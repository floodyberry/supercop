#include "crypto_aead.h"
#include "api.h"
#include "twine.h"

#define RETURN_SUCCESS      0
#define RETURN_TAG_NO_MATCH -1
#define RETURN_MEMORY_FAIL  -2
#define STATE_LEN           8

#define SETZERO()       _mm_setzero_si128()                         /* set all 0's */
#define fix1(x)         x = OR((x), _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x08))   /* the fix1 function fixes the MSB of first two 4-bit nibbles to '1' */
#define fix0(x)         x = AND((x), _mm_set_epi8(0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf7))     /* the fix0 function fixes the MSB of first two nibbles to '0' */
#define fix11(x)         x = OR((x), _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x88))   /* the fix1 function fixes the MSB of first two 4-bit nibbles to '1' */
#define fix00(x)         x = AND((x), _mm_set_epi8(0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x77))     /* the fix0 function fixes the MSB of first two nibbles to '0' */
#define ONE_ZERO_PADDING    2                                       /* flag for ozp */
#define ZERO_PREPEND    1                                           /* flag for different padding schemes, prepend 0's to form 128-bit word */
#define ZERO_APPEND     0                                           /* flag for different padding schemes, append 0's to form 128-bit word */
#define PARAM_OZP       3                                           /* flag for PARAM prefix + ONE ZERO PADDING */
#define PARAM			0xcc                                        /* define the PARAM for (E = TWINE, ell_N = 6, tau = 4) */

#define SHR(x,n)        _mm_shuffle_epi8((x), _mm_set_epi8(127+(n), 126+(n), 125+(n), 124+(n), 123+(n), 122+(n), 121+(n), 120+(n), 119+(n), 118+(n), 117+(n), 116+(n), 115+(n), 114+(n), 113+(n), 112+(n))) // shift to the right
#define SHL(x,n)        _mm_shuffle_epi8((x), _mm_set_epi8(15-(n), 14-(n), 13-(n), 12-(n), 11-(n), 10-(n), 9-(n), 8-(n), 7-(n), 6-(n), 5-(n), 4-(n), 3-(n), 2-(n), 1-(n), 0-(n))) // shift to the left


word _tmp;
/* the G function */
#define g(x)    XOR( \
    _mm_shuffle_epi8((x), _mm_set_epi8(3,2,1,0,15,14,13,12,11,10,9,8,7,6,5,4)), \
    _mm_shuffle_epi8((x), _mm_set_epi8(7,6,5,4,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1)));

#define g2(x)   \
    (x) = g(x);

#define f2(x)   \
    (x) = g(x);

#define g1(x)   \
    (x) = XOR(  \
    _mm_shuffle_epi8((x), _mm_set_epi8(7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8)), \
    _mm_shuffle_epi8((x), _mm_set_epi8(11,10,9,8,7,6,5,4,-1,-1,-1,-1,-1,-1,-1,-1)));

#define f1(x) \
    (_tmp) = XOR(    \
    _mm_shuffle_epi8((x), _mm_set_epi8(7,6,5,4,3,2,1,0,7,6,5,4,3,2,1,0)), \
    _mm_shuffle_epi8((x), _mm_set_epi8(11,10,9,8,7,6,5,4,15,14,13,12,11,10,9,8)));\
    (x) = XOR((_tmp),_mm_shuffle_epi8((x), _mm_set_epi8(15,14,13,12,11,10,9,8,-1,-1,-1,-1,-1,-1,-1,-1)));


#define h(x)    \
    (_tmp) = XOR(    \
    _mm_shuffle_epi8((x), _mm_set_epi8(3,2,1,0,11,10,9,8,7,6,5,4,3,2,1,0)), \
    _mm_shuffle_epi8((x), _mm_set_epi8(7,6,5,4,15,14,13,12,11,10,9,8,7,6,5,4))); \
    (x) = XOR((_tmp),_mm_shuffle_epi8((x), _mm_set_epi8(15,14,13,12,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1)));

/* len should be in the range [1, 15] */
void load_partial_block(word* dst, const unsigned char* m, int len, unsigned choice)
{
    unsigned char temp[STATE_LEN];
    if(choice == ZERO_APPEND){
        memcpy(temp, m, len);
        memset(temp+len, 0, STATE_LEN-len);
        *dst = LOADS(temp);
    }
    else if(choice == ONE_ZERO_PADDING){
        memcpy(temp, m, len);
        memset(temp+len, 0, STATE_LEN-len);
        if(len < STATE_LEN)
            temp[len] = 0x80;
        *dst = LOADS(temp);
    }
    else if(choice == ZERO_PREPEND){
        memcpy(temp+STATE_LEN-len, m, len);
        memset(temp, 0, STATE_LEN-len);
        *dst = LOADS(temp);
    }
    else if(choice == PARAM_OZP){
        temp[0] = PARAM;
        memcpy(temp+1, m, len);
        memset(temp+len+1, 0, STATE_LEN-len-1);
        if(len < (STATE_LEN-1))
            temp[len+1] = 0x80;
        *dst = LOADS(temp);
    }
    else{
        // do nothing
    }
}

/* len should be in the range [0, 16] */
void store_partial_block(unsigned char* dst, word src, int len)
{
    unsigned char temp[16];
    STORES(temp, src);
    memcpy(dst, temp, len);
}

int crypto_aead_encrypt(
                        unsigned char *c, unsigned long long *clen,
                        const unsigned char *m, unsigned long long mlen,
                        const unsigned char *ad, unsigned long long adlen,
                        const unsigned char *nsec,                          //not relavent to CLOC
                        const unsigned char *npub,
                        const unsigned char *k
                        )
{
    word state, tmp;
    unsigned long long i, lastblocklen;
    /* set ciphertext length */
    *clen = mlen + CRYPTO_ABYTES;
    
    /* set key and compute round keys */
    Keyschedule80(k);
    
    /* process the associated data */
    
    /* process the first (partial) block of ad */
    load_partial_block(&state, ad, (adlen>STATE_LEN)?STATE_LEN:adlen, ONE_ZERO_PADDING);
    fix0(state);
    twine80_enc(state);
    if((ad[0] & 0x80) || (adlen == 0)){
        // appy h
        h(state);
    }
    else{
        // do nothing
    }
    
    if(adlen > STATE_LEN){ // ad is of moer than one block
        i = STATE_LEN;
        
        /* process the middle ad blocks, excluding the first and last (partial) block */
        while((i+STATE_LEN) < adlen)
        {
            tmp = LOADS(ad+i);
            state = XOR(state, tmp);
            twine80_enc(state);
            i += STATE_LEN;
        }
        
        /* process the last (partial) ad block */
        load_partial_block(&tmp, ad+i, adlen - i, ONE_ZERO_PADDING);
        state = XOR(state, tmp);
        twine80_enc(state);
    }
    
    
    /* process the nonce */
    load_partial_block(&tmp, npub, CRYPTO_NPUBBYTES, PARAM_OZP);
    state = XOR(state, tmp);
    
    if((adlen % STATE_LEN) || (adlen == 0)){
        /* apply f2 */
        f2(state);
    }
    else{
        /* apply f1 */
        f1(state);
    }
    
    /* copy the encryption to tag state */
    tmp = SHL4(MASK4L(state));
    if(mlen){
        /* apply g2 to tag state */
        g2(tmp);
    }
    else{
        /* apply g1 to tag state */
        g1(tmp);
    }
    state = XOR(MASK4L(state), MASK4U(tmp));
    twine80_enc(state);
    
    i = 0;
    /* process all the message except for the last message/ciphertext block */
    while((i + STATE_LEN) < mlen){
        tmp = LOADS(m+i);
        state = XOR(state, tmp);
        STORES(c+i, state);
        state = XOR(SHL4(MASK4L(state)), state);
        fix1(state);
        twine80_enc(state);
        i += STATE_LEN;
    }
    
    /* process the last block of the message/ciphetext */
    lastblocklen = mlen - i;
    
    if(lastblocklen > 0){
        load_partial_block(&tmp, m+i, lastblocklen, ZERO_APPEND);
        state = XOR(state, tmp);
        store_partial_block(c+i, state, lastblocklen);
        unsigned char shift_bytes = (STATE_LEN - (unsigned char)lastblocklen);
        tmp = AND(SHR(_mm_set1_epi8(0x0f), shift_bytes*2), state);
        state = XOR(state, SHL4(tmp));
        /* add the one zero padding */
        state = XOR(state, SHL(_mm_set_epi8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0x80), lastblocklen*2));
        
        if(mlen % STATE_LEN){
            /* apply f2 */
            f2(state);
        }
        else{
            /* apply f1 */
            f1(state);
        }
        twine80_enc(state);
    }
    
    /* output the tag */
    store_partial_block(c+mlen, SHR4(state), CRYPTO_ABYTES);
    
	return RETURN_SUCCESS;
}

int crypto_aead_decrypt(
                        unsigned char *m,unsigned long long *mlen,
                        unsigned char *nsec,                                //not relavent to CLOC
                        const unsigned char *c,unsigned long long clen,
                        const unsigned char *ad,unsigned long long adlen,
                        const unsigned char *npub,
                        const unsigned char *k
                        )
{
    word state, tmp;
    unsigned long long i, lastblocklen;    /* set plaintext length */
    
    *mlen = clen - CRYPTO_ABYTES;
    
    unsigned char tag[CRYPTO_ABYTES];

    /* set key and compute round keys */
    Keyschedule80(k);
    
    /* process the associated data */
    
    /* process the first (partial) block of ad */
    load_partial_block(&state, ad, (adlen>STATE_LEN)?STATE_LEN:adlen, ONE_ZERO_PADDING);
    fix0(state);
    twine80_enc(state);
    if((ad[0] & 0x80) || (adlen == 0)){
        // appy h
        h(state);
    }
    else{
        // do nothing
    }
    
    if(adlen > STATE_LEN){ // ad is of more than one block
        i = STATE_LEN;
        
        /* process the middle ad blocks, excluding the first and last (partial) block */
        while((i+STATE_LEN) < adlen)
        {
            tmp = LOADS(ad+i);
            state = XOR(state, tmp);
            twine80_enc(state);
            i += STATE_LEN;
        }
        
        /* process the last (partial) ad block */
        load_partial_block(&tmp, ad+i, adlen - i, ONE_ZERO_PADDING);
        state = XOR(state, tmp);
        twine80_enc(state);
    }
    
    
    /* process the nonce */
    load_partial_block(&tmp, npub, CRYPTO_NPUBBYTES, PARAM_OZP);
    state = XOR(state, tmp);
    
    if((adlen % STATE_LEN) || (adlen == 0)){
        /* apply f2 */
        f2(state);
    }
    else{
        /* apply f1 */
        f1(state);
    }
    
    /* copy the encryption to tag state */
    tmp = SHL4(MASK4L(state));
    if(*mlen){
        /* apply g2 to tag state */
        g2(tmp);
    }
    else{
        /* apply g1 to tag state */
        g1(tmp);
    }
    state = XOR(MASK4L(state), MASK4U(tmp));
    twine80_enc(state);
    
    i = 0;
    /* process all the message except for the last message/ciphertext block */
    while((i + STATE_LEN) < (*mlen)){
        tmp = LOADS(c+i);
        tmp = XOR(tmp, SHL4(tmp));
        state = XOR(state, tmp);
        STORES(m+i, state);
        state = XOR(MASK4U(state), MASK4L(tmp));
        fix1(state);
        twine80_enc(state);
        i += STATE_LEN;
    }
    
    /* process the last block of the message/ciphetext */
    lastblocklen = (*mlen) - i;
    
    if(lastblocklen > 0){
        load_partial_block(&tmp, c+i, lastblocklen, ZERO_APPEND);
        state = XOR(state, tmp);
        store_partial_block(m+i, state, lastblocklen);
        unsigned char shift_bytes = (STATE_LEN - (unsigned char)lastblocklen);
        tmp = AND(SHR(_mm_set1_epi8(0x0f), shift_bytes*2), tmp);
        state = XOR(state, SHL4(tmp));
        /* add the one zero padding */
        state = XOR(state, SHL(_mm_set_epi8(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0x80), lastblocklen*2));
        
        if((*mlen) % STATE_LEN){
            /* apply f2 */
            f2(state);
        }
        else{
            /* apply f1 */
            f1(state);
        }
        twine80_enc(state);
    }
    
    /* output the tag */
    store_partial_block(tag, SHR4(state), CRYPTO_ABYTES);

    /* compare the tag */
    for(i = 0; i < CRYPTO_ABYTES; i++)
        if(tag[i] != c[(*mlen) + i]){
            return RETURN_TAG_NO_MATCH;
        }
    
	return RETURN_SUCCESS;
}

