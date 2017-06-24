/* elliptic curve arithmetic */

/* tau endomorphism (two coordinates) */
void eca_tau_2co(__m128i *x_20, __m128i *x_21, __m128i *x_22,
                 __m128i *l_20, __m128i *l_21, __m128i *l_22,
                 __m128i x_00, __m128i x_01, __m128i x_02,
                 __m128i l_00, __m128i l_01, __m128i l_02) {
    /* var */
    __m128i sq_0, sq_1, sq_2, sq_3, sq_4, sq_5;
    __m128i re_0, re_1, re_2;

    /* x-coordinate squaring (x^2) */
    /* interleaving */
    re_0 = _mm_shuffle_epi32(x_00, 0xD8);
    re_1 = _mm_shuffle_epi32(x_01, 0xD8);
    re_2 = _mm_shuffle_epi32(x_02, 0xD8);

    /* man */
    ffa_sqr_stp(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);
    ffa_red_192_019_001(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);

    /* x-coordinate squaring (x^4) */
    /* interleaving */
    re_0 = _mm_shuffle_epi32(re_0, 0xD8);
    re_1 = _mm_shuffle_epi32(re_1, 0xD8);
    re_2 = _mm_shuffle_epi32(re_2, 0xD8);

    /* man */
    ffa_sqr_stp(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);
    ffa_red_192_019_001(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, *x_20, *x_21, *x_22);

    /* l-coordinate squaring (l^2) */
    /* interleaving */
    re_0 = _mm_shuffle_epi32(l_00, 0xD8);
    re_1 = _mm_shuffle_epi32(l_01, 0xD8);
    re_2 = _mm_shuffle_epi32(l_02, 0xD8);

    /* man */
    ffa_sqr_stp(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);
    ffa_red_192_019_001(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);

    /* l-coordinate squaring (l^4) */
    /* interleaving */
    re_0 = _mm_shuffle_epi32(re_0, 0xD8);
    re_1 = _mm_shuffle_epi32(re_1, 0xD8);
    re_2 = _mm_shuffle_epi32(re_2, 0xD8);

    /* man */
    ffa_sqr_stp(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);
    ffa_red_192_019_001(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, *l_20, *l_21, *l_22);

    /* end */
    return;
}

/* tau endomorphism (three coordinates) */
void eca_tau_3co(__m128i *x_20, __m128i *x_21, __m128i *x_22,
                 __m128i *l_20, __m128i *l_21, __m128i *l_22,
                 __m128i *z_20, __m128i *z_21, __m128i *z_22,
                 __m128i x_00, __m128i x_01, __m128i x_02,
                 __m128i l_00, __m128i l_01, __m128i l_02,
                 __m128i z_00, __m128i z_01, __m128i z_02) {
    /* var */
    __m128i sq_0, sq_1, sq_2, sq_3, sq_4, sq_5;
    __m128i re_0, re_1, re_2;

    /* X-coordinate squaring (X^2) */
    /* interleaving */
    re_0 = _mm_shuffle_epi32(x_00, 0xD8);
    re_1 = _mm_shuffle_epi32(x_01, 0xD8);
    re_2 = _mm_shuffle_epi32(x_02, 0xD8);

    /* man */
    ffa_sqr_stp(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);
    ffa_red_192_019_001(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);

    /* X-coordinate squaring (X^4) */
    /* interleaving */
    re_0 = _mm_shuffle_epi32(re_0, 0xD8);
    re_1 = _mm_shuffle_epi32(re_1, 0xD8);
    re_2 = _mm_shuffle_epi32(re_2, 0xD8);

    /* man */
    ffa_sqr_stp(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);
    ffa_red_192_019_001(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, *x_20, *x_21, *x_22);

    /* L-coordinate squaring (L^2) */
    /* interleaving */
    re_0 = _mm_shuffle_epi32(l_00, 0xD8);
    re_1 = _mm_shuffle_epi32(l_01, 0xD8);
    re_2 = _mm_shuffle_epi32(l_02, 0xD8);

    /* man */
    ffa_sqr_stp(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);
    ffa_red_192_019_001(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);

    /* L-coordinate squaring (L^4) */
    /* interleaving */
    re_0 = _mm_shuffle_epi32(re_0, 0xD8);
    re_1 = _mm_shuffle_epi32(re_1, 0xD8);
    re_2 = _mm_shuffle_epi32(re_2, 0xD8);

    /* man */
    ffa_sqr_stp(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);
    ffa_red_192_019_001(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, *l_20, *l_21, *l_22);

    /* Z-coordinate squaring (Z^2) */
    /* interleaving */
    re_0 = _mm_shuffle_epi32(z_00, 0xD8);
    re_1 = _mm_shuffle_epi32(z_01, 0xD8);
    re_2 = _mm_shuffle_epi32(z_02, 0xD8);

    /* man */
    ffa_sqr_stp(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);
    ffa_red_192_019_001(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);

    /* Z-coordinate squaring (Z^4) */
    /* interleaving */
    re_0 = _mm_shuffle_epi32(re_0, 0xD8);
    re_1 = _mm_shuffle_epi32(re_1, 0xD8);
    re_2 = _mm_shuffle_epi32(re_2, 0xD8);

    /* man */
    ffa_sqr_stp(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, re_0, re_1, re_2);
    ffa_red_192_019_001(sq_0, sq_1, sq_2, sq_3, sq_4, sq_5, *z_20, *z_21, *z_22);

    /* end */
    return;
}

/* point full addition */
void eca_add_ful(__m128i *x_20, __m128i *x_21, __m128i *x_22,
                 __m128i *l_20, __m128i *l_21, __m128i *l_22,
                 __m128i *z_20, __m128i *z_21, __m128i *z_22,
                 __m128i x_10, __m128i x_11, __m128i x_12,
                 __m128i l_10, __m128i l_11, __m128i l_12,
                 __m128i z_10, __m128i z_11, __m128i z_12,
                 __m128i x_00, __m128i x_01, __m128i x_02,
                 __m128i l_00, __m128i l_01, __m128i l_02,
                 __m128i z_00, __m128i z_01, __m128i z_02) {
    /* var */
    __m128i A_00, A_01, A_02;
    __m128i B_00, B_01, B_02;
    __m128i C_00, C_01, C_02;
    __m128i D_00, D_01, D_02;
    __m128i E_00, E_01, E_02;
    __m128i F_00, F_01, F_02;
    __m128i tp_0, tp_1, tp_2;

    /* man */
    /* A = l_0 * z_1 + l_1 * z_0 */
    ffa_mul(&A_00, &A_01, &A_02, l_00, l_01, l_02, z_10, z_11, z_12);
    ffa_mul(&tp_0, &tp_1, &tp_2, l_10, l_11, l_12, z_00, z_01, z_02);
    ffa_add(A_00, A_01, A_02, A_00, A_01, A_02, tp_0, tp_1, tp_2);

    /* C = x_0 * z_1 */
    ffa_mul(&C_00, &C_01, &C_02, x_00, x_01, x_02, z_10, z_11, z_12);

    /* D = x_1 * z_0 */
    ffa_mul(&D_00, &D_01, &D_02, x_10, x_11, x_12, z_00, z_01, z_02);

    /* B = (C + D)^2 */
    ffa_add(B_00, B_01, B_02, C_00, C_01, C_02, D_00, D_01, D_02);
    ffa_sqr(&B_00, &B_01, &B_02, B_00, B_01, B_02);

    /* E = A * D */
    ffa_mul(&E_00, &E_01, &E_02, A_00, A_01, A_02, D_00, D_01, D_02);

    /* xR = A * C * E */
    ffa_mul(x_20, x_21, x_22, A_00, A_01, A_02, C_00, C_01, C_02);
    ffa_mul(x_20, x_21, x_22, *x_20, *x_21, *x_22, E_00, E_01, E_02);

    /* F = (A * B * z_1) */
    ffa_mul(&F_00, &F_01, &F_02, A_00, A_01, A_02, B_00, B_01, B_02);
    ffa_mul(&F_00, &F_01, &F_02, F_00, F_01, F_02, z_10, z_11, z_12);

    /* l_2 = (E + B)^2 + F * (l_0 + z_0) */
    ffa_add(*l_20, *l_21, *l_22, E_00, E_01, E_02, B_00, B_01, B_02);
    ffa_sqr(l_20, l_21, l_22, *l_20, *l_21, *l_22);
    ffa_add(tp_0, tp_1, tp_2, l_00, l_01, l_02, z_00, z_01, z_02);
    ffa_mul(&tp_0, &tp_1, &tp_2, F_00, F_01, F_02, tp_0, tp_1, tp_2);
    ffa_add(*l_20, *l_21, *l_22, *l_20, *l_21, *l_22, tp_0, tp_1, tp_2);

    /* z_2 = F * z_0 */
    ffa_mul(z_20, z_21, z_22, F_00, F_01, F_02, z_00, z_01, z_02);

    /* end */
    return;
}

/* point mixed addition */
void eca_add_mix(__m128i *x_20, __m128i *x_21, __m128i *x_22,
                 __m128i *l_20, __m128i *l_21, __m128i *l_22,
                 __m128i *z_20, __m128i *z_21, __m128i *z_22,
                 __m128i x_10, __m128i x_11, __m128i x_12,
                 __m128i l_10, __m128i l_11, __m128i l_12,
                 __m128i x_00, __m128i x_01, __m128i x_02,
                 __m128i l_00, __m128i l_01, __m128i l_02,
                 __m128i z_00, __m128i z_01, __m128i z_02) {
    /* var */
    __m128i A_00, A_01, A_02;
    __m128i B_00, B_01, B_02;
    __m128i C_00, C_01, C_02;
    __m128i D_00, D_01, D_02;
    __m128i E_00, E_01, E_02;
    __m128i tp_0, tp_1, tp_2;

    /* man */
    /* A = (l_0 + l_1 * z_0) */
    ffa_mul(&A_00, &A_01, &A_02, l_10, l_11, l_12, z_00, z_01, z_02);
    ffa_add(A_00, A_01, A_02, A_00, A_01, A_02, l_00, l_01, l_02);

    /* C = x_1 * z_0 */
    ffa_mul(&C_00, &C_01, &C_02, x_10, x_11, x_12, z_00, z_01, z_02);

    /* D = A * C */
    ffa_mul(&D_00, &D_01, &D_02, A_00, A_01, A_02, C_00, C_01, C_02);

    /* B = (x_0 + C)^2 */
    ffa_add(B_00, B_01, B_02, x_00, x_01, x_02, C_00, C_01, C_02);
    ffa_sqr(&B_00, &B_01, &B_02, B_00, B_01, B_02);

    /* E = A * B */
    ffa_mul(&E_00, &E_01, &E_02, A_00, A_01, A_02, B_00, B_01, B_02);

    /* x_2 = A * x_0 * D */
    ffa_mul(x_20, x_21, x_22, A_00, A_01, A_02, x_00, x_01, x_02);
    ffa_mul(x_20, x_21, x_22, *x_20, *x_21, *x_22, D_00, D_01, D_02);

    /* l_2 = (D + B)^2 + E * (l_0 + z_0) */
    ffa_add(*l_20, *l_21, *l_22, D_00, D_01, D_02, B_00, B_01, B_02);
    ffa_sqr(l_20, l_21, l_22, *l_20, *l_21, *l_22);
    ffa_add(tp_0, tp_1, tp_2, l_00, l_01, l_02, z_00, z_01, z_02);
    ffa_mul(&tp_0, &tp_1, &tp_2, tp_0, tp_1, tp_2, E_00, E_01, E_02);
    ffa_add(*l_20, *l_21, *l_22, *l_20, *l_21, *l_22, tp_0, tp_1, tp_2);

    /* z_2 = E * z_0 */
    ffa_mul(z_20, z_21, z_22, E_00, E_01, E_02, z_00, z_01, z_02);

    /* end */
    return;
}

/* point full doubling */
void eca_dbl_ful(__m128i *x_20, __m128i *x_21, __m128i *x_22,
                 __m128i *l_20, __m128i *l_21, __m128i *l_22,
                 __m128i *z_20, __m128i *z_21, __m128i *z_22,
                 __m128i x_00, __m128i x_01, __m128i x_02,
                 __m128i l_00, __m128i l_01, __m128i l_02,
                 __m128i z_00, __m128i z_01, __m128i z_02) {
    /* var */
    __m128i A_00, A_01, A_02;
    __m128i T_00, T_01, T_02;
    __m128i tp_0, tp_1, tp_2;

    /* man */
    /* A = l_0 * z_0 */
    ffa_mul(&A_00, &A_01, &A_02, l_00, l_01, l_02, z_00, z_01, z_02);

    /* T = l_0^2 + A + (y [curve a parameter]) * z_0^2) */
    ffa_sqr(&T_00, &T_01, &T_02, l_00, l_01, l_02);
    ffa_add(T_00, T_01, T_02, T_00, T_01, T_02, A_00, A_01, A_02);
    ffa_sqr(&tp_0, &tp_1, &tp_2, z_00, z_01, z_02);
    ffa_muy(&tp_0, &tp_1, &tp_2, tp_0, tp_1, tp_2);
    ffa_add(T_00, T_01, T_02, T_00, T_01, T_02, tp_0, tp_1, tp_2);

    /* x_2 = T^2 */
    ffa_sqr(x_20, x_21, x_22, T_00, T_01, T_02);

    /* z_2 = T*z_0^2 */
    ffa_sqr(z_20, z_21, z_22, z_00, z_01, z_02);
    ffa_mul(z_20, z_21, z_22, *z_20, *z_21, *z_22, T_00, T_01, T_02);

    /* l_2 = (x_0 * z_0)^2 + x_2 + T*A + z_2 */
    ffa_mul(l_20, l_21, l_22, x_00, x_01, x_02, z_00, z_01, z_02);
    ffa_sqr(l_20, l_21, l_22, *l_20, *l_21, *l_22);
    ffa_add(*l_20, *l_21, *l_22, *l_20, *l_21, *l_22, *x_20, *x_21, *x_22);
    ffa_add(*l_20, *l_21, *l_22, *l_20, *l_21, *l_22, *z_20, *z_21, *z_22);
    ffa_mul(&tp_0, &tp_1, &tp_2, T_00, T_01, T_02, A_00, A_01, A_02);
    ffa_add(*l_20, *l_21, *l_22, *l_20, *l_21, *l_22, tp_0, tp_1, tp_2);

    /* end */
    return;
}

/* point mixed doubling */
void eca_dbl_mix(__m128i *x_20, __m128i *x_21, __m128i *x_22,
                 __m128i *l_20, __m128i *l_21, __m128i *l_22,
                 __m128i *z_20, __m128i *z_21, __m128i *z_22,
                 __m128i x_00, __m128i x_01, __m128i x_02,
                 __m128i l_00, __m128i l_01, __m128i l_02) {
    /* var */
    __m128i tp_0, tp_1, tp_2;
    __m128i A_PR;

    /* ini */
    /* curve a parameter */
    A_PR = _mm_set_epi64x(0x1, 0x0);

    /* man */
    /* T := l_0^2 + l_0 + (y [curve a parameter]) */
    ffa_sqr(z_20, z_21, z_22, l_00, l_01, l_02);
    ffa_add(*z_20, *z_21, *z_22, *z_20, *z_21, *z_22, l_00, l_01, l_02);
    *z_20 = _mm_xor_si128(*z_20, A_PR);

    /* x_2 := T^2 */
    ffa_sqr(x_20, x_21, x_22, *z_20, *z_21, *z_22);

    /* l_2 := x_0^2 + T*(T + lP + 1) */
    A_PR = _mm_alignr_epi8(A_PR, A_PR, 8);
    ffa_sqr(l_20, l_21, l_22, x_00, x_01, x_02);
    ffa_add(tp_0, tp_1, tp_2, *z_20, *z_21, *z_22, l_00, l_01, l_02);
    tp_0 = _mm_xor_si128(tp_0, A_PR);
    ffa_mul(&tp_0, &tp_1, &tp_2, tp_0, tp_1, tp_2, *z_20, *z_21, *z_22);
    ffa_add(*l_20, *l_21, *l_22, *l_20, *l_21, *l_22, tp_0, tp_1, tp_2);

    /* end */
    return;
}

