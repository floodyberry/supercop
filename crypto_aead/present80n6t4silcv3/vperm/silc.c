#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "silc.h"
#include "api.h"


void zpp(dqword *state, const unsigned char *s, int len){
    ALIGN16(unsigned char tmp[16]) = {0};
    memcpy(tmp, s, len);
    *state = LOAD(tmp);
    *state = SHL(*state, STATE_LEN-len);
}

void zap(dqword *state, const unsigned char *s, int len){
    ALIGN16(unsigned char tmp[16]) = {0};
    memcpy(tmp, s, len);
    *state = LOAD(tmp);
}

#define Len(x) _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0, x&0xFF, (x>>8)&0xFF,(x>>16)&0xFF,(x>>24)&0xFF, (x>>32)&0xFF, (x>>40)&0xFF, (x>>48)&0xFF, (x>>56)&0xFF)

//g(X) = (X[2], X[3], . . . , X[8], X[1, 2])
#define g(x) \
    (x) = XORDQW(\
        PSHUFB((x), _mm_setr_epi8(1, 2, 3, 4, 5, 6, 7, 1, -1, -1, -1, -1, -1, -1, -1, -1)),\
        PSHUFB((x), _mm_setr_epi8(-1, -1, -1, -1, -1,  -1, -1,0, -1, -1, -1, -1, -1, -1, -1, -1)));



#define fix1(x) x = ORDQW((x), _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x80))  /* the fix1 function fixes the MSB of first two 4-bit nibbles to '1' */

void ae_clear(ae_cxt* cxt){
    cxt->es = SETZERO();
    cxt->ts = SETZERO();
    cxt->userkey = NULL;
    cxt->klen = 0;
    cxt->ad = NULL;
    cxt->adlen = 0;
    cxt->nonce = NULL;
    cxt->nlen = 0;
    cxt->pt = NULL;
    cxt->ptlen = 0;
    cxt->ct = NULL;
    cxt->ctlen = 0;
    cxt->tag = NULL;
    cxt->tlen = 0;
}

/* setup key */
int ae_init(ae_cxt* cxt, const byte* userkey, int keylen)
{
    if(keylen != CRYPTO_KEYBYTES)
    {
        return KEY_ERROR;
    }
    cxt->userkey = (byte*)userkey;
    cxt->klen = keylen;
    PRESENT80_InitKEY(userkey);
    return SUCCESS;
}

/* associated data and nonce length in byte
 * nlen should be less than 16 bytes and larger than 0 byte;
 */
int process_ad(ae_cxt* cxt, const byte* ad, unsigned long long adlen, const byte* nonce, unsigned long long nlen)
{
    dqword state;
    dqword tmpState;
    ALIGN16(unsigned char tmp[16]);
    //SH[0] ← EK(zpp(param ∥ N))
    tmp[0] = PARAM;
    memcpy(tmp+1, nonce, nlen);
    zpp(&state, tmp, nlen+1);

    PRESENT80_enc(&state, cxt->userkey);
    /*
    if |A| = 0 then
        V ← g(SH[0] ⊕ Len(A)) // Len(A) = 0n
        return V
    */
    if(adlen == 0){
        g(state);
        cxt->es = state;
        return SUCCESS;
    }
    /*
    for i ← 1 to a − 1 do
        SH[i] ← EK(SH[i − 1] ⊕ A[i])
    */
    int i = 0;

    while((i + STATE_LEN) <= adlen){
        state = XORDQW(state, LOAD128L(ad+i));
        PRESENT80_enc(&state, cxt->userkey);
        i += STATE_LEN;
    }

    //SH[a] ← EK(SH[a − 1] ⊕ zap(A[a]))
    if(i < adlen){
        zap(&tmpState, ad+i, adlen-i);
        state = XORDQW(state, tmpState);
        PRESENT80_enc(&state, cxt->userkey);
    }
    state = XORDQW(state, Len(adlen));
    g(state);
    cxt->es = state;
    return SUCCESS;
}

/*
 * plaintext, message length in byte, ciphertext, associated data, and associated data length in byte tag, and tag length in byte
 */
int ae_encrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct, byte* tag, unsigned long long tlen)
{
    dqword tmpState;
    ALIGN16(unsigned char tmp[16]);
    dqword state = cxt->es;
    g(state); //g(V)
    /*
    if |C| = 0 then
        U ← g(SP[0] ⊕ Len(C)) // Len(C) = 0n
        T ← msbτ(EK(U))
    */
    if(mlen == 0){
        PRESENT80_enc(&state, cxt->userkey); // SP[0]
        g(state);   //U
        PRESENT80_enc(&state, cxt->userkey);
        STORE(tmp, state);
        memcpy(tag, tmp, tlen);
        return SUCCESS;
    }
    /*
       SP[0] ← EK(g(V))
       SE[1] ← EK(V) 
    */
    state = _mm_unpacklo_epi64(cxt->es, state);
    PRESENT80_enc(&state, cxt->userkey);

    /*
        for i ← 1 to m − 1 do
            C[i] ← SE[i] ⊕ M[i]
            SE[i + 1] ← EK(fix1(C[i]))
            SP[i] ← EK(SP[i − 1] ⊕ C[i])
    */
    int i = 0;
    while((i+STATE_LEN) <= mlen){
        state = XORDQW(state, LOAD128L(pt+i));
        STORE128L(ct+i, state);
        state = XORDQW(state, SHL(state, 8));
        fix1(state);
        PRESENT80_enc(&state, cxt->userkey);
        i += STATE_LEN;
    }

    /*
    C[m] ← msb|M[m]|(SE[m]) ⊕ M[m]
    SP[m] ← EK(SP[m − 1] ⊕ zap(C[m]))
    */
    if(i < mlen){
        int lastblock = mlen - i;
        memset(tmp, 0, sizeof(tmp));
        memcpy(tmp, pt+i, lastblock);
        state = XORDQW(state, LOAD(tmp));
        STORE(tmp, state);
        memcpy(ct+i, tmp, lastblock);
        zap(&tmpState, tmp, lastblock);
        //move SP[m] into low 64bit
        state = XORDQW(tmpState, SHR(state, 8));
        PRESENT80_enc(&state, cxt->userkey);
    }
    else{
        state = SHR(state, 8);
    }
    /*
    U ← g(SP[m] ⊕ Len(C))
    T ← msbτ(EK(U))
    */
    state = XORDQW(state, Len(mlen));
    g(state);
    PRESENT80_enc(&state, cxt->userkey);
    STORE(tmp, state);
    memcpy(tag, tmp, tlen);
    return SUCCESS;
}

int ae_decrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct, byte* tag, unsigned long long tlen)
{
    dqword tmpState;
    ALIGN16(unsigned char tmp[16]);
    dqword state = cxt->es;
    g(state); //g(V)
    /*
    if |C| = 0 then
        U ← g(SP[0] ⊕ Len(C)) // Len(C) = 0n
        T ← msbτ(EK(U))
    */
    if(mlen == 0){
        PRESENT80_enc(&state, cxt->userkey); // SP[0]
        g(state);   //U
        PRESENT80_enc(&state, cxt->userkey);
        STORE(tmp, state);
        memcpy(tag, tmp, tlen);
        return SUCCESS;
    }
    /*
       SP[0] ← EK(g(V))
       SD[1] ← EK(V) 
    */
    state = _mm_unpacklo_epi64(cxt->es, state);
    PRESENT80_enc(&state, cxt->userkey);

    /*
        for i ← 1 to m − 1 do
            M[i] ← SD[i] ⊕ C[i]
            SD[i + 1] ← EK(fix1(C[i]))
            SP[i] ← EK(SP[i − 1] ⊕ C[i])
    */
    int i = 0;
    while((i+STATE_LEN) <= mlen){
        dqword ciphertext = LOAD128L(ct+i);
        state = XORDQW(state, ciphertext);
        STORE128L(pt+i, state);
        ciphertext = _mm_unpacklo_epi64(ciphertext, ciphertext);
        state = XORDQW(MASK128U(state), ciphertext);
        fix1(state);
        PRESENT80_enc(&state, cxt->userkey);
        i += STATE_LEN;
    }

    /*
    M[m] ← msb|C[m]|(SD[m]) ⊕ C[m]
    SP[m] ← EK(SP[m − 1] ⊕ zap(C[m]))
    */
    if(i < mlen){
        int lastblock = mlen - i;
        memset(tmp, 0, sizeof(tmp));
        memcpy(tmp, ct+i, lastblock);
        dqword ciphertext = LOAD(tmp);
        state = XORDQW(state, ciphertext);
        STORE(tmp, state);
        memcpy(pt+i, tmp, lastblock);
        //move SP[m] into low 64bit
        state = XORDQW(ciphertext, SHR(state, 8));
        PRESENT80_enc(&state, cxt->userkey);
    }
    else{
        state = SHR(state, 8);
    }
    /*
    U ← g(SP[m] ⊕ Len(C))
    T ← msbτ(EK(U))
    */
    state = XORDQW(state, Len(mlen));
    g(state);

    PRESENT80_enc(&state, cxt->userkey);
    STORE(tmp, state);
    memcpy(tag, tmp, tlen);
    return SUCCESS;
}
