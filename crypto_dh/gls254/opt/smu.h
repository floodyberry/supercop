/* scalar multiplication */

/* regular recoding */
#define LOOP_SIZE 32
#define MASK 0x1F
#define M 16
#define SHR 4
#define SHL 60

/* 128-bit integer subtraction */
#define smu_sub_128(c0, c1, a0, a1)\
    asm ("subq %2, %0 \n\t"\
         "sbbq %3, %1"\
    : "+r" (c0), "+r" (c1)\
    : "r" (a0), "r" (a1) : "cc"\
    );

/* 128-bit integer addition */
#define smu_add_128(c0, c1, a0, a1)\
    asm ("addq %2, %0 \n\t"\
         "adcq %3, %1"\
    : "+r" (c0), "+r" (c1)\
    : "r" (a0), "r" (a1) : "cc"\
    );

/* regular recoding of a 127-bit integer */
void smu_reg_rec(int8_t *dig, uint64_t *k00) {
    /* var */
    int64_t ki, sig, i;
   
    /* main loop */
    for (i=0;i<LOOP_SIZE;i++) {
        ki = k00[0] & MASK;
        ki = ki - M;
        dig[i] = ki & 0xFF;

        sig = ki >> 63;
        smu_sub_128(k00[0], k00[1], ki, sig);

        k00[0] = k00[0] >> SHR;
        k00[0] = k00[0] ^ (k00[1] << SHL);
        k00[1] = k00[1] >> SHR;
    }

    dig[LOOP_SIZE] = k00[0] & 0xFF;

    /* end */
    return;
}

/* 5-NAF pre-computation */
void smu_pre_5nf(__m128i *ppx0, __m128i *ppx1,
                 __m128i *ppl0, __m128i *ppl1,
                 __m128i *ppz0, __m128i *ppz1,
                 __m128i px00, __m128i px01,
                 __m128i pl00, __m128i pl01) {
    /* var */
    __m128i ONE, ml00;
    __m128i zin0[8], zin1[8];
    __m128i tmp0[5], tmp1[5];

    /* init */
    ONE = _mm_set_epi64x(0x0, 0x1);
    ml00 = _mm_xor_si128(pl00, ONE);

    /* pre-computation */
    /* P1 */
    ppx0[0] = px00; ppx1[0] = px01; ppl0[0] = pl00; ppl1[0] = pl01;

    /* P3 */
    eca_add_dbl(&ppx0[1], &ppx1[1], &ppl0[1], &ppl1[1], &ppz0[1], &ppz1[1],
                px00, px01, pl00, pl01,
                px00, px01, pl00, pl01);

    /* P5 and P7 */
    eca_add_sub_dbl(&ppx0[2], &ppx1[2], &ppl0[2], &ppl1[2], &ppz0[2], &ppz1[2],
                    &ppx0[3], &ppx1[3], &ppl0[3], &ppl1[3], &ppz0[3], &ppz1[3],
                    ppx0[1], ppx1[1], ppl0[1], ppl1[1], ppz0[1], ppz1[1],
                    px00, px01, pl00, pl01);

    /* P9 and P11 */
    eca_add_sub_dbl(&ppx0[4], &ppx1[4], &ppl0[4], &ppl1[4], &ppz0[4], &ppz1[4],
                    &ppx0[5], &ppx1[5], &ppl0[5], &ppl1[5], &ppz0[5], &ppz1[5],
                    ppx0[2], ppx1[2], ppl0[2], ppl1[2], ppz0[2], ppz1[2],
                    px00, px01, pl00, pl01);

    /* P9 and P11 */
    eca_add_sub_dbl(&ppx0[6], &ppx1[6], &ppl0[6], &ppl1[6], &ppz0[6], &ppz1[6],
                    &ppx0[7], &ppx1[7], &ppl0[7], &ppl1[7], &ppz0[7], &ppz1[7],
                    ppx0[3], ppx1[3], ppl0[3], ppl1[3], ppz0[3], ppz1[3],
                    px00, px01, pl00, pl01);

    /* inversion: montgomery`s trick */
    /* part I */
    low_mul(&tmp0[0], &tmp1[0], ppz0[1], ppz1[1], ppz0[2], ppz1[2]);
    low_mul(&tmp0[1], &tmp1[1], tmp0[0], tmp1[0], ppz0[3], ppz1[3]);
    low_mul(&tmp0[2], &tmp1[2], tmp0[1], tmp1[1], ppz0[4], ppz1[4]);
    low_mul(&tmp0[3], &tmp1[3], tmp0[2], tmp1[2], ppz0[5], ppz1[5]);
    low_mul(&tmp0[4], &tmp1[4], tmp0[3], tmp1[3], ppz0[6], ppz1[6]);
    low_mul(&zin0[0], &zin1[0], tmp0[4], tmp1[4], ppz0[7], ppz1[7]);

    /* part II */
    low_inv(&zin0[0], &zin1[0], zin0[0], zin1[0]);

    /* part III */
    low_mul(&zin0[7], &zin1[7], zin0[0], zin1[0], tmp0[4], tmp1[4]);
    low_mul(&zin0[0], &zin1[0], zin0[0], zin1[0], ppz0[7], ppz1[7]);
    low_mul(&zin0[6], &zin1[6], zin0[0], zin1[0], tmp0[3], tmp1[3]);
    low_mul(&zin0[0], &zin1[0], zin0[0], zin1[0], ppz0[6], ppz1[6]);
    low_mul(&zin0[5], &zin1[5], zin0[0], zin1[0], tmp0[2], tmp1[2]);
    low_mul(&zin0[0], &zin1[0], zin0[0], zin1[0], ppz0[5], ppz1[5]);
    low_mul(&zin0[4], &zin1[4], zin0[0], zin1[0], tmp0[1], tmp1[1]);
    low_mul(&zin0[0], &zin1[0], zin0[0], zin1[0], ppz0[4], ppz1[4]);
    low_mul(&zin0[3], &zin1[3], zin0[0], zin1[0], tmp0[0], tmp1[0]);
    low_mul(&zin0[0], &zin1[0], zin0[0], zin1[0], ppz0[3], ppz1[3]);
    low_mul(&zin0[1], &zin1[1], zin0[0], zin1[0], ppz0[2], ppz1[2]);
    low_mul(&zin0[2], &zin1[2], zin0[0], zin1[0], ppz0[1], ppz1[1]);

    /* to affine */
    low_mul(&ppx0[1], &ppx1[1], ppx0[1], ppx1[1], zin0[1], zin1[1]);
    low_mul(&ppl0[1], &ppl1[1], ppl0[1], ppl1[1], zin0[1], zin1[1]);
    low_mul(&ppx0[2], &ppx1[2], ppx0[2], ppx1[2], zin0[2], zin1[2]);
    low_mul(&ppl0[2], &ppl1[2], ppl0[2], ppl1[2], zin0[2], zin1[2]);
    low_mul(&ppx0[3], &ppx1[3], ppx0[3], ppx1[3], zin0[3], zin1[3]);
    low_mul(&ppl0[3], &ppl1[3], ppl0[3], ppl1[3], zin0[3], zin1[3]);
    low_mul(&ppx0[4], &ppx1[4], ppx0[4], ppx1[4], zin0[4], zin1[4]);
    low_mul(&ppl0[4], &ppl1[4], ppl0[4], ppl1[4], zin0[4], zin1[4]);
    low_mul(&ppx0[5], &ppx1[5], ppx0[5], ppx1[5], zin0[5], zin1[5]);
    low_mul(&ppl0[5], &ppl1[5], ppl0[5], ppl1[5], zin0[5], zin1[5]);
    low_mul(&ppx0[6], &ppx1[6], ppx0[6], ppx1[6], zin0[6], zin1[6]);
    low_mul(&ppl0[6], &ppl1[6], ppl0[6], ppl1[6], zin0[6], zin1[6]);
    low_mul(&ppx0[7], &ppx1[7], ppx0[7], ppx1[7], zin0[7], zin1[7]);
    low_mul(&ppl0[7], &ppl1[7], ppl0[7], ppl1[7], zin0[7], zin1[7]);

    /* end */
    return;
}

/* retrieve digit sign (sig) and absolute value (abs) */
#define smu_get_flg(vec,idx,msk,abs,sig)\
    msk = vec[idx] >> 7;\
    abs = vec[idx];\
    sig = abs >> 63;\
    abs = ((abs ^ msk) + sig) >> 1;

/* GLS endomorphism */
#define smu_psi_end(ox00,ox01,ol00,ol01,ix00,ix01,il00,il01,ONE)\
    ox00 = _mm_srli_si128(ix00, 8);\
    ox00 = _mm_xor_si128(ox00, ix00);\
    ox01 = _mm_srli_si128(ix01, 8);\
    ox01 = _mm_xor_si128(ox01, ix01);\
    ol00 = _mm_srli_si128(il00, 8);\
    ol00 = _mm_xor_si128(ol00, il00);\
    ol01 = _mm_srli_si128(il01, 8);\
    ol01 = _mm_xor_si128(ol01, il01);\
    ol00 = _mm_xor_si128(ol00, ONE);

/* linar pass algorithm */
#define smu_lps(dst0, dst1, msk0, msk1, src)\
    dst0 = _mm_setzero_si128();\
    dst1 = _mm_setzero_si128();\
    dst0 = _mm_xor_si128(dst0, _mm_and_si128(src[0], msk0[0]));\
    dst1 = _mm_xor_si128(dst1, _mm_and_si128(src[0], msk1[0]));\
    dst0 = _mm_xor_si128(dst0, _mm_and_si128(src[1], msk0[1]));\
    dst1 = _mm_xor_si128(dst1, _mm_and_si128(src[1], msk1[1]));\
    dst0 = _mm_xor_si128(dst0, _mm_and_si128(src[2], msk0[2]));\
    dst1 = _mm_xor_si128(dst1, _mm_and_si128(src[2], msk1[2]));\
    dst0 = _mm_xor_si128(dst0, _mm_and_si128(src[3], msk0[3]));\
    dst1 = _mm_xor_si128(dst1, _mm_and_si128(src[3], msk1[3]));\
    dst0 = _mm_xor_si128(dst0, _mm_and_si128(src[4], msk0[4]));\
    dst1 = _mm_xor_si128(dst1, _mm_and_si128(src[4], msk1[4]));\
    dst0 = _mm_xor_si128(dst0, _mm_and_si128(src[5], msk0[5]));\
    dst1 = _mm_xor_si128(dst1, _mm_and_si128(src[5], msk1[5]));\
    dst0 = _mm_xor_si128(dst0, _mm_and_si128(src[6], msk0[6]));\
    dst1 = _mm_xor_si128(dst1, _mm_and_si128(src[6], msk1[6]));\
    dst0 = _mm_xor_si128(dst0, _mm_and_si128(src[7], msk0[7]));\
    dst1 = _mm_xor_si128(dst1, _mm_and_si128(src[7], msk1[7]));

/* protected 5-NAF double-and-add left-to-right scalar multiplication */
void smu_5nf_dna_ltr(__m128i *qx00, __m128i *qx01,
                     __m128i *ql00, __m128i *ql01,
                     __m128i *qz00, __m128i *qz01,
                     __m128i px00, __m128i px01,
                     __m128i pl00, __m128i pl01,
                     uint64_t *k00, uint64_t *k01) {
    /* var */
    int8_t dg0[33], dg1[33];
    int64_t i;
    uint64_t sig0, sig1, abs0, abs1, msk;
    uint64_t k0[2], k1[2], evk0, evk1, ZERO;
    __m128i ONE;
    __m128i ppx0[8], ppl0[8], ppz0[8], ppx1[8], ppl1[8], ppz1[8];
    __m128i a0x0, a0x1, a0l0, a0l1;
    __m128i a1x0, a1x1, a1l0, a1l1, e1x0, e1x1, e1l0, e1l1;
    __m128i msk0[8], msk1[8], cmp[8], dig0, dig1, ssgn;
    __m128i sig_sse, msk_sse, one;
    __m128i qfx0[2], qfx1[2], qfl0[2], qfl1[2], qfz0[2], qfz1[2];

    /* init */
    ONE = _mm_set_epi64x(0x1, 0x1);
    cmp[0] = _mm_setzero_si128();
    cmp[1] = _mm_add_epi64(cmp[0], ONE);
    cmp[2] = _mm_add_epi64(cmp[1], ONE);
    cmp[3] = _mm_add_epi64(cmp[2], ONE);
    cmp[4] = _mm_add_epi64(cmp[3], ONE);
    cmp[5] = _mm_add_epi64(cmp[4], ONE);
    cmp[6] = _mm_add_epi64(cmp[5], ONE);
    cmp[7] = _mm_add_epi64(cmp[6], ONE);
    ONE = _mm_slli_si128(ONE, 8);

    /* regular recoding */
    k0[0] = k00[0]; k0[1] = k00[1];
    k1[0] = k01[0]; k1[1] = k01[1];

    evk0 = k0[0] & 0x1;
    evk1 = k1[0] & 0x1;
    evk0 = 1 - evk0;
    evk1 = 1 - evk1;
    ZERO = 0x0;
    smu_add_128(k0[0], k0[1], evk0, ZERO);
    smu_add_128(k1[0], k1[1], evk1, ZERO);

    smu_reg_rec(&dg0[0], &k0[0]); smu_reg_rec(&dg1[0], &k1[0]);

    /* pre computation */
    smu_pre_5nf(&ppx0[0], &ppx1[0], &ppl0[0], &ppl1[0], &ppz0[0], &ppz1[0], px00, px01, pl00, pl01);

    /* first iteration */
    /* digit */
    smu_get_flg(dg0,32,msk,abs0,sig0);
    smu_get_flg(dg1,32,msk,abs1,sig1);

    /* linear pass */
    dig0 = _mm_set_epi64x(abs0, abs0);
    dig1 = _mm_set_epi64x(abs1, abs1);
    msk0[0] = _mm_cmpeq_epi64(cmp[0], dig0);
    msk1[0] = _mm_cmpeq_epi64(cmp[0], dig1);
    msk0[1] = _mm_cmpeq_epi64(cmp[1], dig0);
    msk1[1] = _mm_cmpeq_epi64(cmp[1], dig1);
    msk0[2] = _mm_cmpeq_epi64(cmp[2], dig0);
    msk1[2] = _mm_cmpeq_epi64(cmp[2], dig1);
    msk0[3] = _mm_cmpeq_epi64(cmp[3], dig0);
    msk1[3] = _mm_cmpeq_epi64(cmp[3], dig1);
    msk0[4] = _mm_cmpeq_epi64(cmp[4], dig0);
    msk1[4] = _mm_cmpeq_epi64(cmp[4], dig1);
    msk0[5] = _mm_cmpeq_epi64(cmp[5], dig0);
    msk1[5] = _mm_cmpeq_epi64(cmp[5], dig1);
    msk0[6] = _mm_cmpeq_epi64(cmp[6], dig0);
    msk1[6] = _mm_cmpeq_epi64(cmp[6], dig1);
    msk0[7] = _mm_cmpeq_epi64(cmp[7], dig0);
    msk1[7] = _mm_cmpeq_epi64(cmp[7], dig1);
    smu_lps(a0x0, a1x0, msk0, msk1, ppx0);
    smu_lps(a0x1, a1x1, msk0, msk1, ppx1);
    smu_lps(a0l0, a1l0, msk0, msk1, ppl0);
    smu_lps(a0l1, a1l1, msk0, msk1, ppl1);

    /* add k0 digit */
    ssgn = _mm_set_epi64x(0x0, sig0); a0l0 = _mm_xor_si128(a0l0, ssgn);
    *qx00 = a0x0; *qx01 = a0x1; *ql00 = a0l0; *ql01 = a0l1;

    /* add k1 digit */
    ssgn = _mm_set_epi64x(0x0, sig1); a0l0 = _mm_xor_si128(a1l0, ssgn);
    smu_psi_end(e1x0,e1x1,e1l0,e1l1,a1x0,a1x1,a1l0,a1l1,ONE);
    eca_add_mma(&*qx00, &*qx01, &*ql00, &*ql01, &*qz00, &*qz01,
                *qx00, *qx01, *ql00, *ql01,
                e1x0, e1x1, e1l0, e1l1);

    /* main loop */
    for (i=31;i>=0;i--) {
        /* point doubling */
        eca_dbl_ful(&*qx00, &*qx01, &*ql00, &*ql01, &*qz00, &*qz01,
                    *qx00, *qx01, *ql00, *ql01, *qz00, *qz01);

        eca_dbl_ful(&*qx00, &*qx01, &*ql00, &*ql01, &*qz00, &*qz01,
                    *qx00, *qx01, *ql00, *ql01, *qz00, *qz01);

        eca_dbl_ful(&*qx00, &*qx01, &*ql00, &*ql01, &*qz00, &*qz01,
                    *qx00, *qx01, *ql00, *ql01, *qz00, *qz01);

        /* digit */
        smu_get_flg(dg0,i,msk,abs0,sig0);
        smu_get_flg(dg1,i,msk,abs1,sig1);

        /* linear pass */
        dig0 = _mm_set_epi64x(abs0, abs0);
        dig1 = _mm_set_epi64x(abs1, abs1);
        msk0[0] = _mm_cmpeq_epi64(cmp[0], dig0);
        msk1[0] = _mm_cmpeq_epi64(cmp[0], dig1);
        msk0[1] = _mm_cmpeq_epi64(cmp[1], dig0);
        msk1[1] = _mm_cmpeq_epi64(cmp[1], dig1);
        msk0[2] = _mm_cmpeq_epi64(cmp[2], dig0);
        msk1[2] = _mm_cmpeq_epi64(cmp[2], dig1);
        msk0[3] = _mm_cmpeq_epi64(cmp[3], dig0);
        msk1[3] = _mm_cmpeq_epi64(cmp[3], dig1);
        msk0[4] = _mm_cmpeq_epi64(cmp[4], dig0);
        msk1[4] = _mm_cmpeq_epi64(cmp[4], dig1);
        msk0[5] = _mm_cmpeq_epi64(cmp[5], dig0);
        msk1[5] = _mm_cmpeq_epi64(cmp[5], dig1);
        msk0[6] = _mm_cmpeq_epi64(cmp[6], dig0);
        msk1[6] = _mm_cmpeq_epi64(cmp[6], dig1);
        msk0[7] = _mm_cmpeq_epi64(cmp[7], dig0);
        msk1[7] = _mm_cmpeq_epi64(cmp[7], dig1);
        smu_lps(a0x0, a1x0, msk0, msk1, ppx0);
        smu_lps(a0x1, a1x1, msk0, msk1, ppx1);
        smu_lps(a0l0, a1l0, msk0, msk1, ppl0);
        smu_lps(a0l1, a1l1, msk0, msk1, ppl1);

        /* add k0, k1 digits */
        ssgn = _mm_set_epi64x(0x0, sig0); a0l0 = _mm_xor_si128(a0l0, ssgn);
        smu_psi_end(e1x0,e1x1,e1l0,e1l1,a1x0,a1x1,a1l0,a1l1,ONE);
        ssgn = _mm_set_epi64x(0x0, sig1); e1l0 = _mm_xor_si128(e1l0, ssgn);
        eca_add_add_dbl(&*qx00, &*qx01, &*ql00, &*ql01, &*qz00, &*qz01,
                        *qx00, *qx01, *ql00, *ql01, *qz00, *qz01,
                        a0x0, a0x1, a0l0, a0l1, e1x0, e1x1, e1l0, e1l1);
    }

    /* subtract P, if necessary */
    qfx0[0] = *qx00; qfx1[0] = *qx01;
    qfl0[0] = *ql00; qfl1[0] = *ql01;
    qfz0[0] = *qz00; qfz1[0] = *qz01;

    eca_add_mix(&qfx0[1], &qfx1[1], &qfl0[1], &qfl1[1], &qfz0[1], &qfz1[1],
                *qx00, *qx01, *ql00, *ql01, *qz00, *qz01,
                ppx0[0], ppx1[0], ppl0[0], ppl1[0]);

    sig_sse = _mm_set_epi64x(evk0, evk0);
    msk_sse = _mm_setzero_si128();
    msk_sse = _mm_sub_epi64(msk_sse, sig_sse);

    *qx00 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfx0[0]), _mm_and_si128(msk_sse, qfx0[1]));
    *qx01 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfx1[0]), _mm_and_si128(msk_sse, qfx1[1]));
    *ql00 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfl0[0]), _mm_and_si128(msk_sse, qfl0[1]));
    *ql01 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfl1[0]), _mm_and_si128(msk_sse, qfl1[1]));
    *qz00 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfz0[0]), _mm_and_si128(msk_sse, qfz0[1]));
    *qz01 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfz1[0]), _mm_and_si128(msk_sse, qfz1[1]));

    /* subtract psi(P), if necessary */
    smu_psi_end(ppx0[1],ppx1[1],ppl0[1],ppl1[1],ppx0[0],ppx1[0],ppl0[0],ppl1[0],ONE);

    qfx0[0] = *qx00; qfx1[0] = *qx01;
    qfl0[0] = *ql00; qfl1[0] = *ql01;
    qfz0[0] = *qz00; qfz1[0] = *qz01;

    eca_add_mix(&qfx0[1], &qfx1[1], &qfl0[1], &qfl1[1], &qfz0[1], &qfz1[1],
                *qx00, *qx01, *ql00, *ql01, *qz00, *qz01,
                ppx0[1], ppx1[1], ppl0[1], ppl1[1]);

    sig_sse = _mm_set_epi64x(evk1, evk1);
    msk_sse = _mm_setzero_si128();
    msk_sse = _mm_sub_epi64(msk_sse, sig_sse);

    *qx00 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfx0[0]), _mm_and_si128(msk_sse, qfx0[1]));
    *qx01 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfx1[0]), _mm_and_si128(msk_sse, qfx1[1]));
    *ql00 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfl0[0]), _mm_and_si128(msk_sse, qfl0[1]));
    *ql01 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfl1[0]), _mm_and_si128(msk_sse, qfl1[1]));
    *qz00 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfz0[0]), _mm_and_si128(msk_sse, qfz0[1]));
    *qz01 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfz1[0]), _mm_and_si128(msk_sse, qfz1[1]));

    /* end */
    /* to afffine */
    low_inv(qz00, qz01, *qz00, *qz01);
    low_mul(qx00, qx01, *qx00, *qx01, *qz00, *qz01);
    low_mul(ql00, ql01, *ql00, *ql01, *qz00, *qz01);
    *qz00 = _mm_set_epi64x(0x0, 0x1);
    *qz01 = _mm_set_epi64x(0x0, 0x0);

    /* final reduction */
    low_red_127_063_000(*qx00, *qx01, ONE);
    low_red_127_063_000(*ql00, *ql01, ONE);
    low_red_127_063_000(*qz00, *qz01, ONE);

    return;
}

