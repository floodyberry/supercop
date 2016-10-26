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
#define ONE_ZERO_PADDING    2                                       /* flag for ozp */
#define ZERO_PREPEND    1                                           /* flag for different padding schemes, prepend 0's to form 128-bit word */
#define ZERO_APPEND     0                                           /* flag for different padding schemes, append 0's to form 128-bit word */
#define PARAM_OZP       3                                           /* flag for PARAM prefix + ONE ZERO PADDING */
#define PARAM			0xc0                                        // define the PARAM for (E = AES, ell_N = 12, tau = 8)

typedef __m128i block;
block _tmp;
#include "aes.h"

/* the G function */
#define g(x)    XOR( \
    _mm_shuffle_epi8((x), _mm_set_epi8(3,2,1,0,15,14,13,12,11,10,9,8,7,6,5,4)), \
    _mm_shuffle_epi8((x), _mm_set_epi8(7,6,5,4,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1)));

#define g2(x)   \
    print_state("g2: ", (x));   \
    (x) = g(x);                 \
    print_state("", (x))

#define f2(x)   \
    print_state("f2: ", (x));   \
    (x) = g(x);                 \
    print_state("", (x))

#define g1(x)   \
    print_state("g1: ", (x));   \
    (x) = XOR(    \
    _mm_shuffle_epi8((x), _mm_set_epi8(7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8)), \
    _mm_shuffle_epi8((x), _mm_set_epi8(11,10,9,8,7,6,5,4,-1,-1,-1,-1,-1,-1,-1,-1)));\
     print_state("", (x));

#define f1(x) \
    print_state("f1: ", (x));   \
    (_tmp) = XOR(    \
    _mm_shuffle_epi8((x), _mm_set_epi8(7,6,5,4,3,2,1,0,7,6,5,4,3,2,1,0)), \
    _mm_shuffle_epi8((x), _mm_set_epi8(11,10,9,8,7,6,5,4,15,14,13,12,11,10,9,8)));\
    (x) = XOR((_tmp),_mm_shuffle_epi8((x), _mm_set_epi8(15,14,13,12,11,10,9,8,-1,-1,-1,-1,-1,-1,-1,-1)));   \
    print_state("", (x));


#define h(x)    \
    print_state("h: ", (x));   \
    (_tmp) = XOR(    \
    _mm_shuffle_epi8((x), _mm_set_epi8(3,2,1,0,11,10,9,8,7,6,5,4,3,2,1,0)), \
    _mm_shuffle_epi8((x), _mm_set_epi8(7,6,5,4,15,14,13,12,11,10,9,8,7,6,5,4))); \
    (x) = XOR((_tmp),_mm_shuffle_epi8((x), _mm_set_epi8(15,14,13,12,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1)));  \
    print_state("", (x));

/* len should be in the range [1, 15] */
void load_partial_block(block* dst, const unsigned char* m, int len, unsigned choice)
{
    unsigned char temp[16];
    if(choice == ZERO_APPEND){
        memcpy(temp, m, len);
        memset(temp+len, 0, 16-len);
        *dst = LOAD(temp);
    }
    else if(choice == ONE_ZERO_PADDING){
        memcpy(temp, m, len);
        memset(temp+len, 0, STATE_LEN-len);
        if(len < STATE_LEN)
            temp[len] = 0x80;
        *dst = LOAD(temp);
    }
    else if(choice == ZERO_PREPEND){
        memcpy(temp+16-len, m, len);
        memset(temp, 0, 16-len);
        *dst = LOAD(temp);
    }
    else if(choice == PARAM_OZP){
        temp[0] = PARAM;
        memcpy(temp+1, m, len);
        memset(temp+len+1, 0, STATE_LEN-len-1);
        if(len < (STATE_LEN-1))
            temp[len+1] = 0x80;
        *dst = LOAD(temp);
    }
    else{
        // do nothing
    }
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
    unsigned long long i, lastblocklen;
    /* set ciphertext length */
    *clen = mlen + CRYPTO_ABYTES;
    
    /* generate round keys from master key */
    AES128_KeyExpansion(k);
    
    
    /* process the first (partial) block of ad */
    load_partial_block(&estate, ad, (adlen>STATE_LEN)?STATE_LEN:adlen, ONE_ZERO_PADDING);
    fix0(estate);
    AES128_encrypt(estate, estate);
    if((ad[0] & 0x80) || (adlen == 0)){
        // appy h
        h(estate);
    }
    else{
        // do nothing
    }
    
    if(adlen > STATE_LEN){ // ad is of moer than one block
        i = STATE_LEN;
        
        /* process the middle ad blocks, excluding the first and last (partial) block */
        while((i+STATE_LEN) < adlen)
        {
            tmp = LOAD(ad+i);
            estate = XOR(estate, tmp);
            AES128_encrypt(estate, estate);
            i += STATE_LEN;
        }
        
        /* process the last (partial) ad block */
        load_partial_block(&tmp, ad+i, adlen - i, ONE_ZERO_PADDING);
        estate = XOR(estate, tmp);
        AES128_encrypt(estate, estate);
    }
    
    
    /* process the nonce */
    load_partial_block(&tmp, npub, CRYPTO_NPUBBYTES, PARAM_OZP);
    estate = XOR(estate, tmp);

    if((adlen % STATE_LEN) || (adlen == 0)){
        /* apply f2 */
        f2(estate);
    }
    else{
        /* apply f1 */
        f1(estate);
    }
    
    /* process ciphertext */
    
    tstate = estate;
    AES128_encrypt(estate, estate);
    
    if(mlen){
        /* apply g2 to tag state */
        g2(tstate);
    }
    else{
        /* apply g1 to tag state */
        g1(tstate);
    }
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
        /* add the one zero padding */
        tstate = XOR(tstate, SHL(_mm_set_epi8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0x80), lastblocklen));
        
        if(mlen % STATE_LEN){
            /* apply f2 */
            f2(tstate);
        }
        else{
            /* apply f1 */
            f1(tstate);
        }
        AES128_encrypt(tstate, tstate);
    }

    
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
    unsigned long long i, lastblocklen,j;
    
    /* set ciphertext length */
    *mlen = clen - CRYPTO_ABYTES;
    
    /* generate round keys from master key */
    AES128_KeyExpansion(k);
    
    
    /* process the first (partial) block of ad */
    load_partial_block(&estate, ad, (adlen>STATE_LEN)?STATE_LEN:adlen, ONE_ZERO_PADDING);
    fix0(estate);
    AES128_encrypt(estate, estate);
    if((ad[0] & 0x80) || (adlen == 0)){
        // appy h
        h(estate);
    }
    else{
        // do nothing
    }
    
    if(adlen > STATE_LEN){ // ad is of moer than one block
        i = STATE_LEN;
        
        /* process the middle ad blocks, excluding the first and last (partial) block */
        while((i+STATE_LEN) < adlen)
        {
            tmp = LOAD(ad+i);
            estate = XOR(estate, tmp);
            AES128_encrypt(estate, estate);
            i += STATE_LEN;
        }
        
        /* process the last (partial) ad block */
        load_partial_block(&tmp, ad+i, adlen - i, ONE_ZERO_PADDING);
        estate = XOR(estate, tmp);
        AES128_encrypt(estate, estate);
    }
    
    
    /* process the nonce */
    load_partial_block(&tmp, npub, CRYPTO_NPUBBYTES, PARAM_OZP);
    estate = XOR(estate, tmp);
    
    if((adlen % STATE_LEN) || (adlen == 0)){
        /* apply f2 */
        f2(estate);
    }
    else{
        /* apply f1 */
        f1(estate);
    }
    
    /* process ciphertext */
    
    tstate = estate;
    AES128_encrypt(estate, estate);
    
    if(*mlen){
        /* apply g2 to tag state */
        g2(tstate);
    }
    else{
        /* apply g1 to tag state */
        g1(tstate);
    }
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
        print_state("after xoring last partial message block\n", estate);
        store_partial_block(m+i, estate, lastblocklen);
        unsigned char shift_bytes = (STATE_LEN - (unsigned char)lastblocklen);
        tmp = AND(SHR(_mm_set1_epi8(0xff), shift_bytes), tmp);
        tstate = XOR(tstate, tmp);
        /* add the one zero padding */
        tstate = XOR(tstate, SHL(_mm_set_epi8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0x80), lastblocklen));
        
        if((*mlen) % STATE_LEN){
            /* apply f2 */
            f2(tstate);
        }
        else{
            /* apply f1 */
            f1(tstate);
        }
        AES128_encrypt(tstate, tstate);
    }
    
    /* compare tag and output message */
    STORE(ltag, tstate);
    for(j = 0; j < CRYPTO_ABYTES; j++){
        if(ltag[j] != c[clen - CRYPTO_ABYTES + j])
            return RETURN_TAG_NO_MATCH;
    }
    return RETURN_SUCCESS;

}
