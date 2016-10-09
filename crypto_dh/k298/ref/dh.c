/* inc */
#include "lib.h"
#include "api.h"
#include "randombytes.h"

#include "ffa.h"
#include "eca.h"
#include "smu.h"

/* key pair generation */
int crypto_dh_k298_ref_keypair(unsigned char *pk, unsigned char *sk) {
    /* var */
    __m128i px0, px1, px2;
    __m128i pl0, pl1, pl2;
    __m128i qx0, qx1, qx2;
    __m128i ql0, ql1, ql2;
    
    /* ini */
    randombytes(&sk[0], 16);
    randombytes(&sk[16], 16);
    sk[15] = sk[15] & 0x7F;
    sk[31] = sk[31] & 0x7F;

    /* generator */
    px0 = _mm_set_epi64x(0x15CEE2365000D8EE, 0xB5B3FA6D7E3E6B25);
    px1 = _mm_set_epi64x(0xBEEE18ED795C1870, 0x509A3211274A285C);
    px2 = _mm_set_epi64x(0x162DD3, 0x1D1156);
    pl0 = _mm_set_epi64x(0x97B5B92F33A6FDED, 0xFF4C05F4F6786160);
    pl1 = _mm_set_epi64x(0x32559B62CE5E4143, 0xE4C11BB8E9ADE4CD);
    pl2 = _mm_set_epi64x(0xDEDC9, 0x189230);
   
    /* man */
    smu_3nf_ltr(&qx0, &qx1, &qx2, &ql0, &ql1, &ql2, 
                px0, px1, px2, pl0, pl1, pl2,
                (uint64_t*) &sk[0], (uint64_t*) &sk[16]);

    /* end */
    _mm_store_si128((__m128i *) &pk[0], qx0);
    _mm_store_si128((__m128i *) &pk[16], qx1);
    _mm_store_si128((__m128i *) &pk[32], qx2);
    _mm_store_si128((__m128i *) &pk[48], ql0);
    _mm_store_si128((__m128i *) &pk[64], ql1);
    _mm_store_si128((__m128i *) &pk[80], ql2);

    return 0; 
}

/* shared secret establishment */
int crypto_dh_k298_ref(unsigned char *out, const unsigned char *pk, const unsigned char *sk) {
    /* var */
    __m128i px0, px1, px2;
    __m128i pl0, pl1, pl2;
    __m128i qx0, qx1, qx2;
    __m128i ql0, ql1, ql2;

    /* ini */
    px0 = _mm_loadu_si128((__m128i *) &pk[0]);      
    px1 = _mm_loadu_si128((__m128i *) &pk[16]);      
    px2 = _mm_loadu_si128((__m128i *) &pk[32]);      
    pl0 = _mm_loadu_si128((__m128i *) &pk[48]);      
    pl1 = _mm_loadu_si128((__m128i *) &pk[64]);      
    pl2 = _mm_loadu_si128((__m128i *) &pk[80]);      

    /* man */
    smu_3nf_ltr(&qx0, &qx1, &qx2, &ql0, &ql1, &ql2,
                px0, px1, px2, pl0, pl1, pl2,
                (uint64_t*) &sk[0], (uint64_t*) &sk[16]); 

    /* end */
    _mm_store_si128((__m128i *) &out[0], qx0);
    _mm_store_si128((__m128i *) &out[16], qx1);
    _mm_store_si128((__m128i *) &out[32], qx2);

    return 0;
}

