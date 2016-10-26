#include "crypto_aead.h"
#include "api.h"
#include <stdio.h>
#include <string.h>
#include <xmmintrin.h>              /* SSE instructions and _mm_malloc */
#include <emmintrin.h>              /* SSE2 instructions               */
#include <wmmintrin.h>              /* SSSE3 instructions              */
#include <tmmintrin.h>              /* _mm_shuffle_epi8 */

#define RETURN_SUCCESS       0
#define RETURN_TAG_NO_MATCH -1
#define RETURN_MEMORY_FAIL  -2
#define RETURN_KEYSIZE_ERR  -3


#define STATE_LEN       16                                          /* the state is of 16 bytes */
#define CONSTANT(b)     _mm_set1_epi8((b))                          /* set each byte in a 128-bit register to be "b"*/
#define XOR(x,y)        _mm_xor_si128((x),(y))                      /* exclusive-OR of 128-bit words x and y */
#define AND(x,y)        _mm_and_si128((x),(y))                      /* logic AND of 128-bit words x and y */
#define ANDNOT(x,y)     _mm_andnot_si128((x),(y))                   /* logic NAND of 128-bit words x and y */
#define OR(x,y)         _mm_or_si128((x),(y))                       /* logic OR of 128-bit words x and y */
#define SHL(x,n)        _mm_shuffle_epi8((x), _mm_set_epi8(15-(n), 14-(n), 13-(n), 12-(n), 11-(n), 10-(n), 9-(n), 8-(n), 7-(n), 6-(n), 5-(n), 4-(n), 3-(n), 2-(n), 1-(n), 0-(n))) // shift to the left
#define SHR(x,n)        _mm_shuffle_epi8((x), _mm_set_epi8(127+(n), 126+(n), 125+(n), 124+(n), 123+(n), 122+(n), 121+(n), 120+(n), 119+(n), 118+(n), 117+(n), 116+(n), 115+(n), 114+(n), 113+(n), 112+(n))) // shift to the right
#define STORE(p,x)      _mm_storeu_si128((__m128i *)(p), (x))       /* store 128-bit word x to memory address p */
#define LOAD(p)         _mm_loadu_si128((__m128i *)(p))             /* load 128-bit word from memory address p, on the tested machine, the first byte appears as LSB */
#define SETZERO()       _mm_setzero_si128()                         /* set all 0's */
#define fix1(x)         x = OR((x), _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x80))   /* the fix1 function fixes the MSB of first byte to '1' */
#define fix0(x)         x = AND((x), _mm_set_epi8(0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f))     /* the fix0 function fixes the MSB of first byte to '0' */
#define ZERO_PREPEND    1                                           /* flag for different padding schemes, prepend 0's to form 128-bit word */
#define ZERO_APPEND     0                                           /* flag for different padding schemes, append 0's to form 128-bit word */
#define PARAM_ZP        3                                           /* flag for different padding schemes, prepend 0's + PARAM to form 128-bit word */
#define PARAM			0xc0                                        /* define the PARAM for (E = AES, ell_N = 12, tau=8) */
/* the G function */
#define g(x)    XOR( \
    _mm_shuffle_epi8((x), _mm_set_epi8(0, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)),  \
    _mm_shuffle_epi8((x), _mm_set_epi8(1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)))


typedef __m128i block;

#include "aes.h"
/* len should be in the range [1, 15] */

void load_partial_block(block* dst, const unsigned char* m, int len, unsigned choice)
{
    unsigned char temp[16];
    if(choice == ZERO_APPEND){
        memcpy(temp, m, len);
        memset(temp+len, 0, 16-len);
        *dst = LOAD(temp);
    }
    else if(choice == ZERO_PREPEND){
        memcpy(temp+16-len, m, len);
        memset(temp, 0, 16-len);
        *dst = LOAD(temp);
    }
    else if(choice == PARAM_ZP){
        memcpy(temp+16-len, m, len);
        memset(temp, 0, 16-len-1);
        temp[16-len-1] = PARAM;
        *dst = LOAD(temp);
    }
    else{
        // do nothing
    }
}

void xor_length(block* st, unsigned long long len)
{
    unsigned char temp[16] = { 0 };
    int i;
    for(i = 0;i < 8;i++){
        temp[15-i] = len & 0xff;
        len >>= 8;
    }
    (*st) = XOR((*st), LOAD(temp));
}

/* len should be in the range [0, 16] */
void store_partial_block(unsigned char* dst, block src, int len)
{
    unsigned char temp[16];
    STORE(temp, src);
    memcpy(dst, temp, len);
}

int crypto_aead_encrypt(
                        unsigned char *c, unsigned long long *clen,         // ciphertext
                        const unsigned char *m, unsigned long long mlen,    // message
                        const unsigned char *ad, unsigned long long adlen,  // associated data
                        const unsigned char *nsec,                          // not relavent to CLOC or SLIC
                        const unsigned char *npub,                          // nonce
                        const unsigned char *k                              // the master key
                        )
{
    block estate, tstate, tmp;  // encryption state, tag state, and temporary state
    estate = SETZERO();
    /* set ciphertext length */
    *clen = mlen + CRYPTO_ABYTES;
    
    /* generate round keys from master key */
    AES128_KeyExpansion(k);
    
    /* process nonce */
    load_partial_block(&estate, npub, CRYPTO_NPUBBYTES, PARAM_ZP);
    
    AES128_encrypt(estate, estate);
    
    /* process assoicated data */
    unsigned long long i, lastblocklen;
    int j;
    for(i = 0; i < (unsigned long long)(adlen >> 4); i++){
        estate = XOR(estate, LOAD(ad+(i<<4)));
        AES128_encrypt(estate, estate);
    }
    
    /* process the last partial block if any */
    lastblocklen = adlen % STATE_LEN;
    if(lastblocklen){
        load_partial_block(&tmp, ad+(i<<4), lastblocklen, ZERO_APPEND);
        estate = XOR(estate, tmp);
        AES128_encrypt(estate, estate);
    }
    
    /* encode the adlen and process */
    xor_length(&estate, adlen);
    estate = g(estate);
    tstate = estate;
    
    /* process ciphertext */
    
    AES128_encrypt(estate, estate);
    tstate = g(tstate);
    AES128_encrypt(tstate, tstate);
    

    
    i = 0;
    block* mp = (block*) m;     // message pointer in block
    block* cp = (block*) c;     // ciphertext pointer in block
    /* process all the message except for the last message/ciphertext block */
    while((i + STATE_LEN) < mlen){
        tmp = LOAD(mp);
        estate = XOR(estate, tmp);
        STORE(cp, estate);
        tstate = XOR(estate, tstate);
        fix1(estate);
        print_state("after applying fix1\n", estate);
        AES128_encrypt(estate, estate);
        AES128_encrypt(tstate, tstate);
        i += STATE_LEN;
        mp++;
        cp++;
    }
    
    /* process the last block of the message/ciphetext */
    lastblocklen = mlen - i;
    
    if(lastblocklen > 0){
        load_partial_block(&tmp, m+i, lastblocklen, ZERO_APPEND);
        estate = XOR(estate, tmp);
        print_state("after xoring last partial message block\n", estate);
        store_partial_block(c+i, estate, lastblocklen);
        unsigned char shift_bytes = (STATE_LEN - (unsigned char)lastblocklen);
        tmp = AND(SHR(_mm_set1_epi8(0xff), shift_bytes), estate);
        tstate = XOR(tstate, tmp);
        AES128_encrypt(tstate, tstate);
    }
    /* encode the message length and process */
    
    xor_length(&tstate, mlen);
    tstate = g(tstate);
    AES128_encrypt(tstate, tstate);
    
    /* output the tag */
    store_partial_block(c+i+lastblocklen, tstate, CRYPTO_ABYTES);
    
    return RETURN_SUCCESS;
    
}

int crypto_aead_decrypt(
                        unsigned char *m,unsigned long long *mlen,          // message
                        unsigned char *nsec,                                // not relavent to CLOC or SLIC
                        const unsigned char *c,unsigned long long clen,     // ciphertext
                        const unsigned char *ad,unsigned long long adlen,   // associated data
                        const unsigned char *npub,                          // nonce
                        const unsigned char *k                              // the master key
                        )
{

    block estate, tstate, tmp;  // encryption state, tag state, and temporary state
    estate = SETZERO();
    unsigned char ltag[16];     // local copy of temporary tag value
    
    /* set message length */
    *mlen = clen - CRYPTO_ABYTES;
    
    /* generate round keys from master key */
    AES128_KeyExpansion(k);
    
    /* process nonce */
    load_partial_block(&estate, npub, CRYPTO_NPUBBYTES, PARAM_ZP);
    
    AES128_encrypt(estate, estate);
    
    /* process assoicated data */
    unsigned long long i, lastblocklen;
    int j;
    for(i = 0; i < (unsigned long long)(adlen >> 4); i++){
        estate = XOR(estate, LOAD(ad+(i<<4)));
        AES128_encrypt(estate, estate);
    }
    
    /* process the last partial block if any */
    lastblocklen = adlen % STATE_LEN;
    if(lastblocklen){
        load_partial_block(&tmp, ad+(i<<4), lastblocklen, ZERO_APPEND);
        estate = XOR(estate, tmp);
        AES128_encrypt(estate, estate);
    }
    
    /* encode the adlen and process */
    xor_length(&estate, adlen);
    estate = g(estate);
    tstate = estate;
    
    /* process ciphertext */
    
    AES128_encrypt(estate, estate);
    tstate = g(tstate);
    AES128_encrypt(tstate, tstate);
    
    
    
    i = 0;
    block* mp = (block*) m;     // message pointer in block
    block* cp = (block*) c;     // ciphertext pointer in block
    
    /* process all the message except for the last message/ciphertext block */
    while((i + STATE_LEN) < (*mlen)){
        tmp = LOAD(cp);
        estate = XOR(estate, tmp);
        STORE(mp, estate);
        tstate = XOR(tmp, tstate);
        AES128_encrypt(tstate, tstate);
        fix1(tmp);
        print_state("after applying fix1\n", estate);
        AES128_encrypt(tmp, estate);
        i += STATE_LEN;
        mp++;
        cp++;
    }
    
    /* process the last block of the message/ciphetext */
    lastblocklen = (*mlen) - i;
    
    if(lastblocklen > 0){
        load_partial_block(&tmp, c+i, lastblocklen, ZERO_APPEND);
        estate = XOR(estate, tmp);
        store_partial_block(m+i, estate, lastblocklen);
        char shift_bytes = (char)(STATE_LEN - lastblocklen);
        tmp = AND(SHR(_mm_set1_epi8(0xff), shift_bytes), tmp);
        tstate = XOR(tstate, tmp);
        AES128_encrypt(tstate, tstate);
    }
    /* encode the message length and process */
    
    xor_length(&tstate, (*mlen));
    tstate = g(tstate);
    AES128_encrypt(tstate, tstate);
    
    /* compare tag and output message */
    STORE(ltag, tstate);
    for(j = 0; j < CRYPTO_ABYTES; j++){
        if(ltag[j] != c[clen - CRYPTO_ABYTES + j])
            return RETURN_TAG_NO_MATCH;
    }
    return RETURN_SUCCESS;

}
