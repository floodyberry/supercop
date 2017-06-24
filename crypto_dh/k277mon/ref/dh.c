/* inc */
#include "lib.h"
#include "api.h"
#include "randombytes.h"

#include "ffa.h"
#include "eca.h"
#include "smu.h"

/* key pair generation */
int crypto_dh_k277mon_ref_keypair(unsigned char *pk, unsigned char *sk) {
    /* var */
    __m128i px_00, px_01, px_02, py_00, py_01, py_02;
    __m128i qx_00, qx_01, qx_02, qy_00, qy_01, qy_02;
    uint64_t i;

    /* ini */
    randombytes(&sk[0], 48);
    for (i=47;i>=35;i--) { sk[i] = 0x0; }
    sk[34] = sk[34] & 0x3;
   
    /* generator */
    px_00 = _mm_set_epi64x(0xB5683DA681D21D3, 0xB5683DA681D21D3);
    px_01 = _mm_set_epi64x(0xEF6E305762D74A08, 0x3D23C0CEC3871FB6);
    px_02 = _mm_set_epi64x(0x3679F, 0x164CFEC92CB9E54C);
    py_00 = _mm_set_epi64x(0x2AC69E2C1F32C453, 0x2AC69E2C1F32C453);
    py_01 = _mm_set_epi64x(0x3D680F6711688F42, 0x671BCEF037BB0C39);
    py_02 = _mm_set_epi64x(0x1724BE, 0xCEC95738DF87B738);

    /* man */
    smu_mon(&qx_00, &qx_01, &qx_02, &qy_00, &qy_01, &qy_02,
            px_00, px_01, px_02, py_00, py_01, py_02,
            (uint64_t *) &sk[0]); 

    /* end */
    _mm_storeu_si128((__m128i *) &pk[0], qx_00);
    _mm_storeu_si128((__m128i *) &pk[8], qx_01);
    _mm_storeu_si128((__m128i *) &pk[24], qx_02);
    _mm_storeu_si128((__m128i *) &pk[40], qy_00);
    _mm_storeu_si128((__m128i *) &pk[48], qy_01);
    _mm_storeu_si128((__m128i *) &pk[64], qy_02);

    return 0; 
}

/* shared secret establishment */
int crypto_dh_k277mon_ref(unsigned char *out, const unsigned char *pk, const unsigned char *sk) {
    /* var */
    __m128i px_00, px_01, px_02, py_00, py_01, py_02;
    __m128i qx_00, qx_01, qx_02, qy_00, qy_01, qy_02;

    /* ini */
    px_00 = _mm_loadu_si128((__m128i *) &pk[0]);
    px_01 = _mm_loadu_si128((__m128i *) &pk[8]);
    px_02 = _mm_loadu_si128((__m128i *) &pk[24]);
    py_00 = _mm_loadu_si128((__m128i *) &pk[40]);
    py_01 = _mm_loadu_si128((__m128i *) &pk[48]);
    py_02 = _mm_loadu_si128((__m128i *) &pk[64]);

    /* man */
    smu_mon(&qx_00, &qx_01, &qx_02, &qy_00, &qy_01, &qy_02,
            px_00, px_01, px_02, py_00, py_01, py_02,
            (uint64_t *) &sk[0]); 

    /* end */
    _mm_storeu_si128((__m128i *) &out[0], qx_00);
    _mm_storeu_si128((__m128i *) &out[8], qx_01);
    _mm_storeu_si128((__m128i *) &out[24], qx_02);

    return 0;
}

