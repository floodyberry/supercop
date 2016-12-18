/* finite field arithmetic */

/*
an element a in F_{2^277} = 
a_4(X^256) + a_3(X^192) + a_2(X^128) + a_1(X^64) + a_0
is stored in three 128-bit registers R_0, R_1, R_2 as

R_0 = a_0 | a_0
R_1 = a_2 | a_1
R_2 = a_4 | a_3

where the registers are depicted as follows:
R_x = (most significant 64-bit word) | (least significant 64-bit word)
*/

/*
# reduction after multiplication 
redundant trinomial: x^320 + x^64 + x

< inp
[__m128i] a_00, a_01, a_02, a_03, a_04, a_05 : element to be reduced
[__m128i] t_00 : temporary variable
> out
[__m128i] c_00, c_01, c_02 : reduced element
*/

#define ffa_red_mul(c_00, c_01, c_02, a_00, a_01, a_02, a_03, a_04, a_05, t_00)\
    a_05 = _mm_srli_si128(a_05, 8);\
    a_03 = _mm_xor_si128(a_03, a_05);\
    t_00 = _mm_srli_epi64(a_05, 63);\
    a_03 = _mm_xor_si128(a_03, t_00);\
    a_02 = _mm_xor_si128(a_02, a_04);\
    t_00 = _mm_srli_epi64(a_04, 63);\
    a_02 = _mm_xor_si128(a_02, t_00);\
    a_01 = _mm_xor_si128(a_01, a_03);\
    t_00 = _mm_srli_epi64(a_03, 63);\
    a_01 = _mm_xor_si128(a_01, t_00);\
    t_00 = _mm_alignr_epi8(a_05, a_04, 8);\
    t_00 = _mm_slli_epi64(t_00, 1);\
    c_02 = _mm_xor_si128(a_02, t_00);\
    t_00 = _mm_alignr_epi8(a_04, a_03, 8);\
    t_00 = _mm_slli_epi64(t_00, 1);\
    c_01 = _mm_xor_si128(a_01, t_00);\
    a_03 = _mm_slli_epi64(a_03, 1);\
    c_00 = _mm_xor_si128(a_00, a_03);

#define FFA_RED_MUL(C,A,T_00)\
    ffa_red_mul(C##_00,C##_01,C##_02,A##_00,A##_01,A##_02,A##_03,A##_04,A##_05,T_00);

/*
# reduction after squaring
polynomial: x^320 + x^64 + x

< inp
[__m128i] a_00, a_01, a_02, a_03, a_04 : element to be reduced
> out
[__m128i] c_00, c_01, c_02 : reduced element
*/

#define ffa_red_sqr(c_00,c_01,c_02,a_00,a_01,a_02,a_03,a_04)\
    a_02 = _mm_xor_si128(a_02, a_04);\
    a_01 = _mm_xor_si128(a_01, a_03);\
    c_01 = _mm_alignr_epi8(a_01, a_00, 8);\
    a_01 = _mm_alignr_epi8(a_02, a_01, 8);\
    a_02 = _mm_srli_si128(a_02, 8);\
    a_04 = _mm_slli_epi64(a_04, 1);\
    c_02 = _mm_xor_si128(a_01, a_04);\
    a_03 = _mm_slli_epi64(a_03, 1);\
    c_01 = _mm_xor_si128(c_01, a_03);\
    c_01 = _mm_xor_si128(c_01, a_02);\
    a_02 = _mm_slli_epi64(a_02, 1);\
    c_00 = _mm_xor_si128(a_00, a_02);

#define FFA_RED_SQR(C,A)\
    ffa_red_sqr(C##_00,C##_01,C##_02,A##_00,A##_01,A##_02,A##_03,A##_04);

/*
# reduction (irreducible polynomial)
polynomial (135 terms): x^277 + x^273 + x^270 + ...

< inp
[__m128i] a_00, a_01, a_02 : element to be reduced
> out
[__m128i] c_00, c_01, c_02 : reduced element
*/

/* reduction step */
#define ffa_red_277_stp(a_00,a_01,a_02,P_00,P_01,P_02,m_00,m_01,m_02,m_03,m_04,t_00,mul)\
    mul = _mm_srli_epi64(a_02, 21);\
    m_00 = _mm_clmulepi64_si128(mul, P_00, 0x00);\
    m_01 = _mm_clmulepi64_si128(mul, P_00, 0x10);\
    m_02 = _mm_clmulepi64_si128(mul, P_01, 0x00);\
    m_03 = _mm_clmulepi64_si128(mul, P_01, 0x10);\
    m_04 = _mm_clmulepi64_si128(mul, P_02, 0x00);\
    t_00 = _mm_slli_si128(m_01, 8);\
    m_00 = _mm_xor_si128(m_00, t_00);\
    t_00 = _mm_alignr_epi8(m_03, m_01, 8);\
    m_02 = _mm_xor_si128(m_02, t_00);\
    t_00 = _mm_srli_si128(m_03, 8);\
    m_04 = _mm_xor_si128(m_04, t_00);\
    a_00 = _mm_xor_si128(a_00, m_00);\
    a_01 = _mm_xor_si128(a_01, m_02);\
    a_02 = _mm_xor_si128(a_02, m_04);

#define FFA_RED_277_STP(A,P,M,T_00,MUL)\
    ffa_red_277_stp(A##_00,A##_01,A##_02,P##_00,P##_01,P##_02,\
    M##_00,M##_01,M##_02,M##_03,M##_04,T_00,MUL);

#define FFA_RED_277_STP(A,P,M,T_00,MUL)\
    ffa_red_277_stp(A##_00,A##_01,A##_02,P##_00,P##_01,P##_02,\
    M##_00,M##_01,M##_02,M##_03,M##_04,T_00,MUL);

void ffa_red_277(__m128i *c_00, __m128i *c_01, __m128i *c_02,
                 __m128i a_00, __m128i a_01, __m128i a_02) {
    /* var */
    __m128i P_00, P_01, P_02;
    __m128i m_00, m_01, m_02, m_03, m_04;
    __m128i t_00, mul;

    /* ini */
    /* rearrange registers */
    a_00 = _mm_unpacklo_epi64(a_00, a_01);
    a_01 = _mm_alignr_epi8(a_02, a_01, 8);
    a_02 = _mm_srli_si128(a_02, 8);

    /* initialize 125-term irreducible polynomial */
    P_00 = _mm_set_epi64x(0x268FB7C4FAAB9219, 0x298066C3250EE8FD);
    P_01 = _mm_set_epi64x(0x9882CAA0E6DCE0E8, 0x55ADB57541B74B45);
    P_02 = _mm_set_epi64x(0x0, 0x2266B8);

    /* man */
    FFA_RED_277_STP(a,P,m,t_00,mul);
    FFA_RED_277_STP(a,P,m,t_00,mul);
    FFA_RED_277_STP(a,P,m,t_00,mul);
    FFA_RED_277_STP(a,P,m,t_00,mul);
    FFA_RED_277_STP(a,P,m,t_00,mul);
    FFA_RED_277_STP(a,P,m,t_00,mul);
    FFA_RED_277_STP(a,P,m,t_00,mul);
    FFA_RED_277_STP(a,P,m,t_00,mul);
    FFA_RED_277_STP(a,P,m,t_00,mul);
    FFA_RED_277_STP(a,P,m,t_00,mul);
    FFA_RED_277_STP(a,P,m,t_00,mul);

    /* end */
    /* rearrange registers */
    *c_00 = a_00;
    *c_01 = _mm_alignr_epi8(a_01, a_00, 8);
    *c_02 = _mm_alignr_epi8(a_02, a_01, 8);

    return;
}

#define FFA_RED_277(C,A)\
    ffa_red_277(&C##_00,&C##_01,&C##_02,A##_00,A##_01,A##_02);

/*
# addition

< inp
[__m128i] a_00, a_01, a_02 : operand a
[__m128i] b_00, b_01, b_02 : operand b
> out
[__m128i] c_00, c_01, c_02 : result (a+b) (redundant-trinomial reduced)
*/

#define ffa_add(c_00,c_01,c_02,a_00,a_01,a_02,b_00,b_01,b_02)\
    c_00 = _mm_xor_si128(a_00, b_00);\
    c_01 = _mm_xor_si128(a_01, b_01);\
    c_02 = _mm_xor_si128(a_02, b_02);

#define FFA_ADD(C,A,B)\
    ffa_add(C##_00,C##_01,C##_02,A##_00,A##_01,A##_02,B##_00,B##_01,B##_02);

/*
# multiplication
method: "Improved Polynomial Multiplication Formulas over F_2 Using Chinese Remainder Theorem"
        by Cenk and Ozbudak, IEEE Transactions on Computers, 2009

< inp
[__m128i] a_00, a_01, a_02 : operand a
[__m128i] b_00, b_01, b_02 : operand b
> out
[__m128i] c_00, c_01, c_02 : result (a*b) (redundant-trinomial reduced)
*/

void ffa_mul(__m128i *c_00, __m128i *c_01, __m128i *c_02,
             __m128i a_00, __m128i a_01, __m128i a_02,
             __m128i b_00, __m128i b_01, __m128i b_02) {
    /* var */
    __m128i ab_00, ab_11, ab_22, ab_33, ab_44;
    __m128i sab_01, sab_02, sab_24, sab_34;
    __m128i sab_023, sab_124, sab_0134, sab_01234;
    __m128i m_00, m_01, m_02, m_03, m_04, m_05, m_06, m_07, m_08, m_09, m_10, m_11, m_12;
    __m128i p_00, p_01, p_02, p_03, p_04, p_05, p_06, p_07, p_08;
    __m128i f_00, f_01, f_02, f_03, f_04, f_05;
    __m128i t_01, t_34, t_1112;
    __m128i t_00;

    /* ini */
    /* interleave operands words for fast pre-additions */
    ab_00 = _mm_unpacklo_epi64(a_00, b_00);
    ab_11 = _mm_unpacklo_epi64(a_01, b_01);
    ab_22 = _mm_unpackhi_epi64(a_01, b_01);
    ab_33 = _mm_unpacklo_epi64(a_02, b_02);
    ab_44 = _mm_unpackhi_epi64(a_02, b_02);

    /* pre-additions */
    sab_01 = _mm_xor_si128(ab_00, ab_11);
    sab_02 = _mm_xor_si128(ab_00, ab_22);
    sab_24 = _mm_xor_si128(ab_22, ab_44);
    sab_34 = _mm_xor_si128(ab_33, ab_44);
    sab_023 = _mm_xor_si128(sab_02, ab_33);
    sab_124 = _mm_xor_si128(ab_11, sab_24);
    sab_0134 = _mm_xor_si128(sab_01, sab_34);
    sab_01234 = _mm_xor_si128(sab_0134, ab_22);

    /* man */
    /* multiplications */
    m_00 = _mm_clmulepi64_si128(ab_00, ab_00, 0x10);
    m_01 = _mm_clmulepi64_si128(ab_11, ab_11, 0x10);
    m_02 = _mm_clmulepi64_si128(ab_22, ab_22, 0x10);
    m_03 = _mm_clmulepi64_si128(ab_33, ab_33, 0x10);
    m_04 = _mm_clmulepi64_si128(ab_44, ab_44, 0x10);
    m_05 = _mm_clmulepi64_si128(sab_01, sab_01, 0x10);
    m_06 = _mm_clmulepi64_si128(sab_02, sab_02, 0x10);
    m_07 = _mm_clmulepi64_si128(sab_24, sab_24, 0x10);
    m_08 = _mm_clmulepi64_si128(sab_34, sab_34, 0x10);
    m_09 = _mm_clmulepi64_si128(sab_023, sab_023, 0x10);
    m_10 = _mm_clmulepi64_si128(sab_124, sab_124, 0x10);
    m_11 = _mm_clmulepi64_si128(sab_0134, sab_0134, 0x10);
    m_12 = _mm_clmulepi64_si128(sab_01234, sab_01234, 0x10);

    /* post-additions */
    p_00 = m_00;
    p_08 = m_04;

    t_01 = _mm_xor_si128(m_00, m_01);
    t_34 = _mm_xor_si128(m_03, m_04);
    p_01 = _mm_xor_si128(t_01, m_05);
    p_07 = _mm_xor_si128(t_34, m_08);

    p_02 = _mm_xor_si128(t_01, m_06);
    p_02 = _mm_xor_si128(p_02, m_02);
    p_06 = _mm_xor_si128(t_34, m_07);
    p_06 = _mm_xor_si128(p_06, m_02);

    t_1112 = _mm_xor_si128(m_11, m_12);
    p_03 = _mm_xor_si128(m_00, t_1112);
    p_03 = _mm_xor_si128(p_03, m_09);
    p_03 = _mm_xor_si128(p_03, p_06);
    p_05 = _mm_xor_si128(m_04, t_1112);
    p_05 = _mm_xor_si128(p_05, m_10);
    p_05 = _mm_xor_si128(p_05, p_02);

    p_04 = _mm_xor_si128(p_01, m_09);
    p_04 = _mm_xor_si128(p_04, m_10);
    p_04 = _mm_xor_si128(p_04, m_12);
    p_04 = _mm_xor_si128(p_04, p_07);

    /* end */
    /* final additions and register reordering for reduction */
    f_05 = p_08;
    t_00 = _mm_alignr_epi8(p_08, p_06, 8);
    f_04 = _mm_xor_si128(t_00, p_07);
    t_00 = _mm_alignr_epi8(p_06, p_04, 8);
    f_03 = _mm_xor_si128(t_00, p_05);
    t_00 = _mm_alignr_epi8(p_04, p_02, 8);
    f_02 = _mm_xor_si128(t_00, p_03);
    t_00 = _mm_alignr_epi8(p_02, p_00, 8);
    f_01 = _mm_xor_si128(t_00, p_01);
    f_00 = p_00;

    /* reduction */
    FFA_RED_MUL(*c, f, t_00);

    return;
}

#define FFA_MUL(C,A,B)\
    ffa_mul(&C##_00,&C##_01,&C##_02,A##_00,A##_01,A##_02,B##_00,B##_01,B##_02);

/*
# squaring
method: schoolbook multiplication

< inp
[__m128i] a_00, a_01, a_02 : operand a
> out
[__m128i] c_00, c_01, c_02 : result (a*a) (redundant-trinomial reduced)
*/

void ffa_sqr(__m128i *c_00, __m128i *c_01, __m128i *c_02,
             __m128i a_00, __m128i a_01, __m128i a_02) {
    /* var */
    __m128i m_00, m_01, m_02, m_03, m_04;

    /* man */
    /* squaring */
    m_00 = _mm_clmulepi64_si128(a_00, a_00, 0x00);
    m_01 = _mm_clmulepi64_si128(a_01, a_01, 0x00);
    m_02 = _mm_clmulepi64_si128(a_01, a_01, 0x11);
    m_03 = _mm_clmulepi64_si128(a_02, a_02, 0x00);
    m_04 = _mm_clmulepi64_si128(a_02, a_02, 0x11);

    /* end */
    /* reduction */
    FFA_RED_SQR(*c, m);

    return;
}

#define FFA_SQR(C,A)\
    ffa_sqr(&C##_00,&C##_01,&C##_02,A##_00,A##_01,A##_02);

/*
# inverse
method: Itoh-Tsujii with addition chain:
        1-2-4-8-16-17-34-68-69-138-276-277

< inp
[__m128i] a_00, a_01, a_02 : operand a
> out
[__m128i] c_00, c_01, c_02 : result (a^-1) (redundant-trinomial reduced)
*/

void ffa_inv(__m128i *c_00, __m128i *c_01, __m128i *c_02,
             __m128i a_00, __m128i a_01, __m128i a_02) {
    /* var */
    __m128i t_00, t_01, t_02;
    __m128i ai_00, ai_01, ai_02;
    uint64_t i;

    /* man */
    /* 2 */
    FFA_SQR(t, a);
    FFA_MUL(ai, t, a);

    /* 4 */
    FFA_SQR(t, ai);
    FFA_SQR(t, t);
    FFA_MUL(ai, t, ai);

    /* 8 */
    FFA_SQR(t, ai);
    for (i=0;i<3;i++) { FFA_SQR(t, t); }
    FFA_MUL(ai, t, ai);

    /* 16 */
    FFA_SQR(t, ai);
    for (i=0;i<7;i++) { FFA_SQR(t, t); }
    FFA_MUL(ai, t, ai);

    /* 17 */
    FFA_SQR(t, ai);
    FFA_MUL(ai, t, a);

    /* 34 */
    FFA_SQR(t, ai);
    for (i=0;i<16;i++) { FFA_SQR(t, t); }
    FFA_MUL(ai, t, ai);

    /* 68 */
    FFA_SQR(t, ai);
    for (i=0;i<33;i++) { FFA_SQR(t, t); }
    FFA_MUL(ai, t, ai);

    /* 69 */
    FFA_SQR(t, ai);
    FFA_MUL(ai, t, a);

    /* 138 */
    FFA_SQR(t, ai);
    for (i=0;i<68;i++) { FFA_SQR(t, t); }
    FFA_MUL(ai, t, ai);

    /* 276 */
    FFA_SQR(t, ai);
    for (i=0;i<137;i++) { FFA_SQR(t, t); }
    FFA_MUL(ai, t, ai);

    /* end */
    FFA_SQR(*c, ai);

    return;
}

#define FFA_INV(C,A)\
    ffa_inv(&C##_00,&C##_01,&C##_02,A##_00,A##_01,A##_02);

