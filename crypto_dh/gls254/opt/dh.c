/* inc */
#include "lib.h"
#include "api.h"
#include "randombytes.h"

#include "msq_015.h"
#include "msq_030.h"
#include "msq_063.h"

#include "ffa.h"
#include "eca.h"
#include "smu.h"

/* key pair generation */
int crypto_dh_gls254_opt_keypair(unsigned char *pk, unsigned char *sk) {
    /* var */
    __m128i px0, px1, pl0, pl1;
    __m128i qx0, qx1, ql0, ql1, qz0, qz1;

    /* ini */
    randombytes(&sk[0], 16);
    randombytes(&sk[16], 16);
    sk[15] = sk[15] & 0x7F;
    sk[31] = sk[31] & 0x7F;

    /* generator */
    px0 = _mm_set_epi64x(0x9D1932CB5FA5B9BF, 0x5BE5F4EB93D8712A);
    px1 = _mm_set_epi64x(0x25F2F29FCBDEC78E, 0x47E70D2DCA8C7210);
    pl0 = _mm_set_epi64x(0x25BE90C01E0E9B06, 0x97FBBBBFEB3A8AB4);
    pl1 = _mm_set_epi64x(0xB3834B048C217C1, 0x1A1764D658204447);

    /* man */
    smu_5nf_dna_ltr(&qx0, &qx1, &ql0, &ql1, &qz0, &qz1, 
                    px0, px1, pl0, pl1, 
                    (uint64_t *) &sk[0], (uint64_t *) &sk[16]);

    /* end */
    _mm_store_si128((__m128i *) &pk[0], qx0);
    _mm_store_si128((__m128i *) &pk[16], qx1);
    _mm_store_si128((__m128i *) &pk[32], ql0);
    _mm_store_si128((__m128i *) &pk[48], ql1);

    return 0; 
}

/* shared secret establishment */
int crypto_dh_gls254_opt(unsigned char *out, const unsigned char *pk, const unsigned char *sk) {
    /* var */
    __m128i px0, px1, pl0, pl1;
    __m128i qx0, qx1, ql0, ql1, qz0, qz1;

    /* ini */
    px0 = _mm_loadu_si128((__m128i *) &pk[0]);
    px1 = _mm_loadu_si128((__m128i *) &pk[16]);
    pl0 = _mm_loadu_si128((__m128i *) &pk[32]);
    pl1 = _mm_loadu_si128((__m128i *) &pk[48]);

    /* man */
    smu_5nf_dna_ltr(&qx0, &qx1, &ql0, &ql1, &qz0, &qz1,
                    px0, px1, pl0, pl1,
                    (uint64_t *) &sk[0], (uint64_t *) &sk[16]); 

    /* end */
    _mm_store_si128((__m128i *) &out[0], qx0);
    _mm_store_si128((__m128i *) &out[16], qx1);

    return 0;
}

