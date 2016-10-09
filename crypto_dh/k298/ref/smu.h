/* scalar multiplication */

/* 128-bit integer addition */
#define smu_sum_128(c0, c1, a0, a1)\
    asm ("addq %2, %0 \n\t"\
         "adcq %3, %1"\
    : "+r" (c0), "+r" (c1)\
    : "r" (a0), "r" (a1) : "cc"\
    );

/* linear pass for tNAF digits */
#define smu_3nf_lps(DIGT,SIGN,ui,mask,sign,tmp,res)\
    tmp = ui << 3;\
    res = (DIGT >> tmp) & 0x0F;\
    sign = ((SIGN >> tmp) & 0x0F);\
    mask = 0 - sign;\
    res = (res ^ mask) + sign;

/* regular 3tNAF recoding */
#define Q_3NF 65

void smu_3nf(uint64_t *wNAF, uint64_t *r_00, uint64_t *r_01) {
    /* var */
    uint64_t r00, r01, r10, r11, t_w = 12, t0, t1, t2, hi, lo;
    int64_t u_i, i, j, s, t, b, g;
    uint64_t mask, tmp, sign, DIGT_BETA, SIGN_BETA, DIGT_GAMM, SIGN_GAMM;

    /* ini */
    DIGT_BETA = 0x0507070503050301;
    SIGN_BETA = 0x0101000000000000;
    DIGT_GAMM = 0x0101030303000000;
    SIGN_GAMM = 0x0101000000000000;
    r00 = r_00[0]; r01 = r_00[1];
    r10 = r_01[0]; r11 = r_01[1];

    /* man */
    for (i=0;i<Q_3NF;i++) {
        u_i = ((r00 + 12 * r10) & 31) - 16;
        wNAF[i] = u_i;

        /* take absolute value of u_i */
        t0 = (u_i >> 63);
        t1 = ((uint64_t) u_i >> 63);
        u_i = (u_i^t0) - t0;
        u_i = u_i >> 1;

        smu_3nf_lps(DIGT_BETA,SIGN_BETA,u_i,mask,sign,tmp,b);
        smu_3nf_lps(DIGT_GAMM,SIGN_GAMM,u_i,mask,sign,tmp,g);
        t = (t1 * (-b)) + ((1 - t1) * b);
        s = (t1 * (-g)) + ((1 - t1) * g);

        /* r0 = r0 - t * beta_u. */
        hi = (uint64_t)-(t>0);
        smu_sum_128(r00, r01, -t, hi);

        /* r1 = r1 - s * gama_u. */
        hi = (uint64_t)-(s>0);
        smu_sum_128(r10, r11, -s, hi);

        for (j = 0; j < 2; j++) {
            /* tmp = -r0/4. */
            r01 = ~r01; 
            r00 = ~r00;
            smu_sum_128(r00, r01, (int64_t)1, (int64_t)0);
            hi = 0 - (r01 >> 63);
            lo  = r01 & 0x3; 
            r01 = (r01 >> 2) | (hi << 62);
            r00 = (r00 >> 2) | (lo << 62);

            /* r0 = r1 + tmp, r1 = tmp. */
            t0 = r00; t1 = r01;
            smu_sum_128(r00, r01, r10, r11);
            r10 = t0; r11 = t1;
        }
    }

    /* last digit */
    wNAF[Q_3NF] = r00;

    /* end */
    return;
}

/* 3-tNAF linear pass */
#define smu_lps(dst, src)\
    dst = _mm_setzero_si128();\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[0], mask_lps[0]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[1], mask_lps[1]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[2], mask_lps[2]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[3], mask_lps[3]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[4], mask_lps[4]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[5], mask_lps[5]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[6], mask_lps[6]));\
    dst = _mm_xor_si128(dst, _mm_and_si128(src[7], mask_lps[7]))

/* 3-tNAF left-to-right */
void smu_3nf_ltr(__m128i *q_x0, __m128i *q_x1, __m128i *q_x2,
                 __m128i *q_l0, __m128i *q_l1, __m128i *q_l2,
                 __m128i p_x0, __m128i p_x1, __m128i p_x2,
                 __m128i p_l0, __m128i p_l1, __m128i p_l2,
                 uint64_t *k_00, uint64_t *k_01) {

    /* var */
    __m128i px00[8], px01[8], px02[8];
    __m128i pl00[8], pl01[8], pl02[8];
    __m128i pz00[8], pz01[8], pz02[8];
    __m128i tpx0[4], tpx1[4], tpx2[4];
    __m128i tpl0[4], tpl1[4], tpl2[4];
    __m128i tpz0[4], tpz1[4], tpz2[4];
    __m128i pl0sign, pl1sign, pl2sign;
    __m128i bta0[6], bta1[6], bta2[6];
    __m128i ziv0[7], ziv1[7], ziv2[7];
    __m128i padd_x0, padd_x1, padd_x2;
    __m128i padd_l0, padd_l1, padd_l2;
    __m128i one;

    __m128i qx00, qx01, qx02;
    __m128i ql00, ql01, ql02;
    __m128i qz00, qz01, qz02;
    __m128i qfx0[2], qfx1[2], qfx2[2];
    __m128i qfl0[2], qfl1[2], qfl2[2];
    __m128i qfz0[2], qfz1[2], qfz2[2];

    __m128i dig_sse, sig_sse, cmp_sse, msk_sse;
    __m128i digits[8];
    __m128i mask_lps[8];
    __m128i ONE;

    int64_t i;
    uint64_t digit, sign, mask;
    uint64_t tNAF[66];
    uint64_t k0[2], k1[0];
    uint64_t evk0, evk1, ZERO;

    /* ini */
    /* process subscalars k0 and k1 */
    k0[0] = k_00[0]; k0[1] = k_00[1];
    k1[0] = k_01[0]; k1[1] = k_01[1];

    evk0 = k0[0] & 0x1;
    evk1 = k1[0] & 0x1;
    evk0 = 1 - evk0;
    evk1 = 1 - evk1;

    ZERO = 0x0;
    smu_sum_128(k0[0], k0[1], evk0, ZERO);
    smu_sum_128(k1[0], k1[1], evk1, ZERO);

    /* tnaf recoding */
    smu_3nf(&tNAF[0], &k0[0], &k1[0]);

    /* linear pass initialization */
    ONE = _mm_set_epi64x(0x1, 0x1);
    digits[0] = _mm_set_epi64x(0x0, 0x0);
    digits[1] = _mm_add_epi64(digits[0], ONE);
    digits[2] = _mm_add_epi64(digits[1], ONE);
    digits[3] = _mm_add_epi64(digits[2], ONE);
    digits[4] = _mm_add_epi64(digits[3], ONE);
    digits[5] = _mm_add_epi64(digits[4], ONE);
    digits[6] = _mm_add_epi64(digits[5], ONE);
    digits[7] = _mm_add_epi64(digits[6], ONE);

    /* precompute points */
    one = _mm_set_epi64x(0x0, 0x1);

    /* Q1 (P) */
    px00[0] = p_x0; px01[0] = p_x1; px02[0] = p_x2;
    pl00[0] = p_l0; pl01[0] = p_l1; pl02[0] = p_l2;

    /* Q3 (3P) */
    eca_dbl_mix(&tpx0[0], &tpx1[0], &tpx2[0],
                &tpl0[0], &tpl1[0], &tpl2[0],
                &tpz0[0], &tpz1[0], &tpz2[0],
                px00[0], px01[0], px02[0],
                pl00[0], pl01[0], pl02[0]);

    eca_add_mix(&px00[1], &px01[1], &px02[1],
                &pl00[1], &pl01[1], &pl02[1],
                &pz00[1], &pz01[1], &pz02[1],
                px00[0], px01[0], px02[0],
                pl00[0], pl01[0], pl02[0],
                tpx0[0], tpx1[0], tpx2[0],
                tpl0[0], tpl1[0], tpl2[0],
                tpz0[0], tpz1[0], tpz2[0]);

    /* Q15 (-P + t^2(P)) */
    eca_tau_2co(&tpx0[1], &tpx1[1], &tpx2[1], &tpl0[1], &tpl1[1], &tpl2[1],
                px00[0], px01[0], px02[0], pl00[0], pl01[0], pl02[0]);

    tpz0[1] = one;
    tpz1[1] = _mm_setzero_si128();
    tpz2[1] = _mm_setzero_si128();

    eca_tau_2co(&tpx0[2], &tpx1[2], &tpx2[2], &tpl0[2], &tpl1[2], &tpl2[2],
                tpx0[1], tpx1[1], tpx2[1], tpl0[1], tpl1[1], tpl2[1]);

    tpz0[2] = one;
    tpz1[2] = _mm_setzero_si128();
    tpz2[2] = _mm_setzero_si128();

    pl0sign = _mm_xor_si128(one, pl00[0]);

    eca_add_mix(&px00[7], &px01[7], &px02[7],
                &pl00[7], &pl01[7], &pl02[7],
                &pz00[7], &pz01[7], &pz02[7],
                px00[0], px01[0], px02[0],
                pl0sign, pl01[0], pl02[0],
                tpx0[2], tpx1[2], tpx2[2],
                tpl0[2], tpl1[2], tpl2[2],
                tpz0[2], tpz1[2], tpz2[2]);

    /* Q5 (-Q15 - t(P)) */
    eca_add_mix(&px00[2], &px01[2], &px02[2],
                &pl00[2], &pl01[2], &pl02[2],
                &pz00[2], &pz01[2], &pz02[2],
                tpx0[1], tpx1[1], tpx2[1],
                tpl0[1], tpl1[1], tpl2[1],
                px00[7], px01[7], px02[7],
                pl00[7], pl01[7], pl02[7],
                pz00[7], pz01[7], pz02[7]);

    pl00[2] = _mm_xor_si128(pl00[2], pz00[2]);
    pl01[2] = _mm_xor_si128(pl01[2], pz01[2]);
    pl02[2] = _mm_xor_si128(pl02[2], pz02[2]);

    /* Q13 (-Q3 + t^2(P)) */
    pl0sign = _mm_xor_si128(pl00[1], pz00[1]);
    pl1sign = _mm_xor_si128(pl01[1], pz01[1]);
    pl2sign = _mm_xor_si128(pl02[1], pz02[1]);

    eca_add_mix(&px00[6], &px01[6], &px02[6],
                &pl00[6], &pl01[6], &pl02[6],
                &pz00[6], &pz01[6], &pz02[6],
                tpx0[2], tpx1[2], tpx2[2],
                tpl0[2], tpl1[2], tpl2[2],
                px00[1], px01[1], px02[1],
                pl0sign, pl1sign, pl2sign,
                pz00[1], pz01[1], pz02[1]);

    /* Q7 (Q3 + t(Q3)) */
    eca_tau_3co(&tpx0[3], &tpx1[3], &tpx2[3],
                &tpl0[3], &tpl1[3], &tpl2[3],
                &tpz0[3], &tpz1[3], &tpz2[3],
                px00[1], px01[1], px02[1],
                pl00[1], pl01[1], pl02[1],
                pz00[1], pz01[1], pz02[1]);

    eca_add_ful(&px00[3], &px01[3], &px02[3],
                &pl00[3], &pl01[3], &pl02[3],
                &pz00[3], &pz01[3], &pz02[3],
                px00[1], px01[1], px02[1],
                pl00[1], pl01[1], pl02[1],
                pz00[1], pz01[1], pz02[1],
                tpx0[3], tpx1[3], tpx2[3],
                tpl0[3], tpl1[3], tpl2[3],
                tpz0[3], tpz1[3], tpz2[3]);

    /* Q9 (Q7 + 2P) */
    eca_add_ful(&px00[4], &px01[4], &px02[4],
                &pl00[4], &pl01[4], &pl02[4],
                &pz00[4], &pz01[4], &pz02[4],
                px00[3], px01[3], px02[3],
                pl00[3], pl01[3], pl02[3],
                pz00[3], pz01[3], pz02[3],
                tpx0[0], tpx1[0], tpx2[0],
                tpl0[0], tpl1[0], tpl2[0],
                tpz0[0], tpz1[0], tpz2[0]);

    /* Q11 (Q9 + 2P) */
    eca_add_ful(&px00[5], &px01[5], &px02[5],
                &pl00[5], &pl01[5], &pl02[5],
                &pz00[5], &pz01[5], &pz02[5],
                px00[4], px01[4], px02[4],
                pl00[4], pl01[4], pl02[4],
                pz00[4], pz01[4], pz02[4],
                tpx0[0], tpx1[0], tpx2[0],
                tpl0[0], tpl1[0], tpl2[0],
                tpz0[0], tpz1[0], tpz2[0]);

    /* projective to affine: montgomery trick */
    /* multiplication */
    ffa_mul(&bta0[0], &bta1[0], &bta2[0], pz00[1], pz01[1], pz02[1], pz00[2], pz01[2], pz02[2]);
    ffa_mul(&bta0[1], &bta1[1], &bta2[1], bta0[0], bta1[0], bta2[0], pz00[3], pz01[3], pz02[3]);
    ffa_mul(&bta0[2], &bta1[2], &bta2[2], bta0[1], bta1[1], bta2[1], pz00[4], pz01[4], pz02[4]);
    ffa_mul(&bta0[3], &bta1[3], &bta2[3], bta0[2], bta1[2], bta2[2], pz00[5], pz01[5], pz02[5]);
    ffa_mul(&bta0[4], &bta1[4], &bta2[4], bta0[3], bta1[3], bta2[3], pz00[6], pz01[6], pz02[6]);
    ffa_mul(&bta0[5], &bta1[5], &bta2[5], bta0[4], bta1[4], bta2[4], pz00[7], pz01[7], pz02[7]);

    /* inverse */
    ffa_inv_qdr(&bta0[5], &bta1[5], &bta2[5], bta0[5], bta1[5], bta2[5]);

    /* z coordinate */
    ffa_mul(&ziv0[6], &ziv1[6], &ziv2[6], bta0[5], bta1[5], bta2[5], bta0[4], bta1[4], bta2[4]);
    ffa_mul(&bta0[5], &bta1[5], &bta2[5], bta0[5], bta1[5], bta2[5], pz00[7], pz01[7], pz02[7]);
    ffa_mul(&ziv0[5], &ziv1[5], &ziv2[5], bta0[5], bta1[5], bta2[5], bta0[3], bta1[3], bta2[3]);
    ffa_mul(&bta0[5], &bta1[5], &bta2[5], bta0[5], bta1[5], bta2[5], pz00[6], pz01[6], pz02[6]);
    ffa_mul(&ziv0[4], &ziv1[4], &ziv2[4], bta0[5], bta1[5], bta2[5], bta0[2], bta1[2], bta2[2]);
    ffa_mul(&bta0[5], &bta1[5], &bta2[5], bta0[5], bta1[5], bta2[5], pz00[5], pz01[5], pz02[5]);
    ffa_mul(&ziv0[3], &ziv1[3], &ziv2[3], bta0[5], bta1[5], bta2[5], bta0[1], bta1[1], bta2[1]);
    ffa_mul(&bta0[5], &bta1[5], &bta2[5], bta0[5], bta1[5], bta2[5], pz00[4], pz01[4], pz02[4]);
    ffa_mul(&ziv0[2], &ziv1[2], &ziv2[2], bta0[5], bta1[5], bta2[5], bta0[0], bta1[0], bta2[0]);
    ffa_mul(&bta0[5], &bta1[5], &bta2[5], bta0[5], bta1[5], bta2[5], pz00[3], pz01[3], pz02[3]);
    ffa_mul(&ziv0[1], &ziv1[1], &ziv2[1], bta0[5], bta1[5], bta2[5], pz00[1], pz01[1], pz02[1]);
    ffa_mul(&ziv0[0], &ziv1[0], &ziv2[0], bta0[5], bta1[5], bta2[5], pz00[2], pz01[2], pz02[2]);

    /* affine */
    for (i=0;i<7;i++) {
        ffa_mul(&px00[i+1], &px01[i+1], &px02[i+1],
                   px00[i+1], px01[i+1], px02[i+1],
                   ziv0[i], ziv1[i], ziv2[i]);

        ffa_mul(&pl00[i+1], &pl01[i+1], &pl02[i+1],
                   pl00[i+1], pl01[i+1], pl02[i+1],
                   ziv0[i], ziv1[i], ziv2[i]);
    }

    /* initialize the accumulator Q */
    qz00 = _mm_set_epi64x(0x0, 0x1); qz01 = _mm_setzero_si128(); qz02 = _mm_setzero_si128();

    /* man */
    /* first iteration */
    sign = tNAF[65] >> 63;
    mask = 0 - sign;
    digit = ((tNAF[65] ^ mask) + sign) >> 1;

    dig_sse = _mm_set_epi64x(digit, digit);
    sig_sse = _mm_set_epi64x(0, sign);

    /* create linear pass mask */
    mask_lps[0] = _mm_cmpeq_epi64(digits[0], dig_sse);
    mask_lps[1] = _mm_cmpeq_epi64(digits[1], dig_sse);
    mask_lps[2] = _mm_cmpeq_epi64(digits[2], dig_sse);
    mask_lps[3] = _mm_cmpeq_epi64(digits[3], dig_sse);
    mask_lps[4] = _mm_cmpeq_epi64(digits[4], dig_sse);
    mask_lps[5] = _mm_cmpeq_epi64(digits[5], dig_sse);
    mask_lps[6] = _mm_cmpeq_epi64(digits[6], dig_sse);
    mask_lps[7] = _mm_cmpeq_epi64(digits[7], dig_sse);

    /* linear pass (read) */
    smu_lps(qx00,px00);
    smu_lps(qx01,px01);
    smu_lps(qx02,px02);
    smu_lps(ql00,pl00);
    smu_lps(ql01,pl01);
    smu_lps(ql02,pl02);

    ql00 = _mm_xor_si128(ql00, sig_sse);

    /* main loop */
    for(i=64;i>=0;i--) {
        eca_tau_3co(&qx00, &qx01, &qx02, &ql00, &ql01, &ql02, &qz00, &qz01, &qz02,
                    qx00, qx01, qx02, ql00, ql01, ql02, qz00, qz01, qz02);

        eca_tau_3co(&qx00, &qx01, &qx02, &ql00, &ql01, &ql02, &qz00, &qz01, &qz02,
                    qx00, qx01, qx02, ql00, ql01, ql02, qz00, qz01, qz02);

        sign = tNAF[i] >> 63;
        mask = 0 - sign;
        digit = ((tNAF[i] ^ mask) + sign) >> 1;

        dig_sse = _mm_set_epi64x(digit, digit);
        sig_sse = _mm_set_epi64x(0, sign);

        /* create linear pass mask */
        mask_lps[0] = _mm_cmpeq_epi64(digits[0], dig_sse);
        mask_lps[1] = _mm_cmpeq_epi64(digits[1], dig_sse);
        mask_lps[2] = _mm_cmpeq_epi64(digits[2], dig_sse);
        mask_lps[3] = _mm_cmpeq_epi64(digits[3], dig_sse);
        mask_lps[4] = _mm_cmpeq_epi64(digits[4], dig_sse);
        mask_lps[5] = _mm_cmpeq_epi64(digits[5], dig_sse);
        mask_lps[6] = _mm_cmpeq_epi64(digits[6], dig_sse);
        mask_lps[7] = _mm_cmpeq_epi64(digits[7], dig_sse);

        /* linear pass (read) */
        smu_lps(padd_x0,px00);
        smu_lps(padd_x1,px01);
        smu_lps(padd_x2,px02);
        smu_lps(padd_l0,pl00);
        smu_lps(padd_l1,pl01);
        smu_lps(padd_l2,pl02);

        padd_l0 = _mm_xor_si128(padd_l0, sig_sse);

        eca_add_mix(&qx00, &qx01, &qx02, &ql00, &ql01, &ql02, &qz00, &qz01, &qz02,
                    padd_x0, padd_x1, padd_x2, padd_l0, padd_l1, padd_l2,
                    qx00, qx01, qx02, ql00, ql01, ql02, qz00, qz01, qz02);
    }
 
    /* end */
    /* subtract P, if necessary */
    pl00[0] = _mm_xor_si128(pl00[0], one);

    qfx0[0] = qx00; qfx1[0] = qx01; qfx2[0] = qx02;
    qfl0[0] = ql00; qfl1[0] = ql01; qfl2[0] = ql02;
    qfz0[0] = qz00; qfz1[0] = qz01; qfz2[0] = qz02;

    eca_add_mix(&qfx0[1], &qfx1[1], &qfx2[1],
                &qfl0[1], &qfl1[1], &qfl2[1],
                &qfz0[1], &qfz1[1], &qfz2[1],
                px00[0], px01[0], px02[0], pl00[0], pl01[0], pl02[0],
                qx00, qx01, qx02, ql00, ql01, ql02, qz00, qz01, qz02);

    sig_sse = _mm_set_epi64x(evk0, evk0);
    msk_sse = _mm_setzero_si128();
    msk_sse = _mm_sub_epi64(msk_sse, sig_sse);

    qx00 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfx0[0]), _mm_and_si128(msk_sse, qfx0[1]));
    qx01 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfx1[0]), _mm_and_si128(msk_sse, qfx1[1]));
    qx02 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfx2[0]), _mm_and_si128(msk_sse, qfx2[1]));
    ql00 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfl0[0]), _mm_and_si128(msk_sse, qfl0[1]));
    ql01 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfl1[0]), _mm_and_si128(msk_sse, qfl1[1]));
    ql02 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfl2[0]), _mm_and_si128(msk_sse, qfl2[1]));
    qz00 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfz0[0]), _mm_and_si128(msk_sse, qfz0[1]));
    qz01 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfz1[0]), _mm_and_si128(msk_sse, qfz1[1]));
    qz02 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfz2[0]), _mm_and_si128(msk_sse, qfz2[1]));

    /* subtract t(P), if necessary */
    eca_tau_2co(&px00[0], &px01[0], &px02[0], &pl00[0], &pl01[0], &pl02[0],
                px00[0], px01[0], px02[0], pl00[0], pl01[0], pl02[0]);

    qfx0[0] = qx00; qfx1[0] = qx01; qfx2[0] = qx02;
    qfl0[0] = ql00; qfl1[0] = ql01; qfl2[0] = ql02;
    qfz0[0] = qz00; qfz1[0] = qz01; qfz2[0] = qz02;

    eca_add_mix(&qfx0[1], &qfx1[1], &qfx2[1],
                &qfl0[1], &qfl1[1], &qfl2[1],
                &qfz0[1], &qfz1[1], &qfz2[1],
                px00[0], px01[0], px02[0], pl00[0], pl01[0], pl02[0],
                qx00, qx01, qx02, ql00, ql01, ql02, qz00, qz01, qz02);

    sig_sse = _mm_set_epi64x(evk1, evk1);
    msk_sse = _mm_setzero_si128();
    msk_sse = _mm_sub_epi64(msk_sse, sig_sse);

    qx00 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfx0[0]), _mm_and_si128(msk_sse, qfx0[1]));
    qx01 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfx1[0]), _mm_and_si128(msk_sse, qfx1[1]));
    qx02 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfx2[0]), _mm_and_si128(msk_sse, qfx2[1]));
    ql00 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfl0[0]), _mm_and_si128(msk_sse, qfl0[1]));
    ql01 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfl1[0]), _mm_and_si128(msk_sse, qfl1[1]));
    ql02 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfl2[0]), _mm_and_si128(msk_sse, qfl2[1]));
    qz00 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfz0[0]), _mm_and_si128(msk_sse, qfz0[1]));
    qz01 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfz1[0]), _mm_and_si128(msk_sse, qfz1[1]));
    qz02 = _mm_xor_si128(_mm_andnot_si128(msk_sse, qfz2[0]), _mm_and_si128(msk_sse, qfz2[1]));

    /* to affine */
    ffa_inv_qdr(&qz00, &qz01, &qz02, qz00, qz01, qz02);
    ffa_mul(&qx00, &qx01, &qx02, qx00, qx01, qx02, qz00, qz01, qz02);
    ffa_mul(&ql00, &ql01, &ql02, ql00, ql01, ql02, qz00, qz01, qz02);

    /* to F_{2^384} */
    ffa_red_149(q_x0, q_x1, q_x2, qx00, qx01, qx02);
    ffa_red_149(q_l0, q_l1, q_l2, ql00, ql01, ql02);

    return;
}

