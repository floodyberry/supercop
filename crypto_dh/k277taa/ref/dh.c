/* inc */
#include "lib.h"
#include "api.h"
#include "randombytes.h"

#include "ffa.h"
#include "eca.h"
#include "smu.h"

/* key pair generation */
int crypto_dh_k277taa_ref_keypair(unsigned char *pk, unsigned char *sk) {
    /* var */
    __m128i px_00, px_01, px_02, pl_00, pl_01, pl_02;
    __m128i qx_00, qx_01, qx_02, ql_00, ql_01, ql_02;
    uint64_t i;

    /* ini */
    randombytes(&sk[0], 48);
    for (i=23;i>=17;i--) { sk[i] = 0x0; }
    for (i=47;i>=41;i--) { sk[i] = 0x0; }
   
    /* generator */
    px_00 = _mm_set_epi64x(0x49BC5EA59B80A45C, 0x49BC5EA59B80A45C);
    px_01 = _mm_set_epi64x(0xAAE3B76C2327D6B5, 0xB8CA383F30E8BCC3);
    px_02 = _mm_set_epi64x(0x1B04B1, 0xD6B659F3FBBB25F4);
    pl_00 = _mm_set_epi64x(0xF98D3D700E0CEA76, 0xF98D3D700E0CEA76);
    pl_01 = _mm_set_epi64x(0x8D3FC97A7406A5A4, 0xB0D2CBC57BC4909);
    pl_02 = _mm_set_epi64x(0x13EC17, 0x3420BD81F3B15966);

    /* man */
    smu_taa_ltr_5nf(&qx_00, &qx_01, &qx_02, &ql_00, &ql_01, &ql_02,
                    px_00, px_01, px_02, pl_00, pl_01, pl_02,
                    (uint64_t *) &sk[0], (uint64_t *) &sk[24]); 

    /* end */
    _mm_storeu_si128((__m128i *) &pk[0], qx_00);
    _mm_storeu_si128((__m128i *) &pk[8], qx_01);
    _mm_storeu_si128((__m128i *) &pk[24], qx_02);
    _mm_storeu_si128((__m128i *) &pk[40], ql_00);
    _mm_storeu_si128((__m128i *) &pk[48], ql_01);
    _mm_storeu_si128((__m128i *) &pk[64], ql_02);

    return 0; 
}

/* shared secret establishment */
int crypto_dh_k277taa_ref(unsigned char *out, const unsigned char *pk, const unsigned char *sk) {
    /* var */
    __m128i px_00, px_01, px_02, pl_00, pl_01, pl_02;
    __m128i qx_00, qx_01, qx_02, ql_00, ql_01, ql_02;

    /* ini */
    px_00 = _mm_loadu_si128((__m128i *) &pk[0]);
    px_01 = _mm_loadu_si128((__m128i *) &pk[8]);
    px_02 = _mm_loadu_si128((__m128i *) &pk[24]);
    pl_00 = _mm_loadu_si128((__m128i *) &pk[40]);
    pl_01 = _mm_loadu_si128((__m128i *) &pk[48]);
    pl_02 = _mm_loadu_si128((__m128i *) &pk[64]);

    /* man */
    smu_taa_ltr_5nf(&qx_00, &qx_01, &qx_02, &ql_00, &ql_01, &ql_02,
                    px_00, px_01, px_02, pl_00, pl_01, pl_02,
                    (uint64_t *) &sk[0], (uint64_t *) &sk[24]); 

    /* end */
    _mm_storeu_si128((__m128i *) &out[0], qx_00);
    _mm_storeu_si128((__m128i *) &out[8], qx_01);
    _mm_storeu_si128((__m128i *) &out[24], qx_02);

    return 0;
}

