/* finite field arithmetic */

/* modular reduction */
/* [F_q^2] general reduction modulo X^128 + X^64 + X */
#define low_red_128_064_001(op0,op1,op2,op3,tp0,tp1,re0,re1)\
    tp0 = _mm_xor_si128(op2, op3);\
    tp1 = _mm_xor_si128(tp0, _mm_srli_epi64(op3, 63));\
    tp1 = _mm_slli_epi64(tp1, 1);\
    re0 = _mm_xor_si128(op0, tp1);\
    re1 = _mm_xor_si128(tp0, op1);\
    re1 = _mm_xor_si128(re1, _mm_slli_epi64(op3, 1));\
    re1 = _mm_xor_si128(re1, _mm_srli_epi64(op2, 63));

/* [F_q^2] mult x Fq reduction modulo X^128 + X^64 + X */
#define low_red_128_064_001_fq1(op0,op1,op2,tp0,re0,re1)\
    tp0 = _mm_slli_epi64(op2, 1);\
    re0 = _mm_xor_si128(op0, tp0);\
    re1 = _mm_xor_si128(op2, op1);\
    re1 = _mm_xor_si128(re1, _mm_srli_epi64(op2, 63));

/* [F_q^2] squaring reduction modulo X^128 + X^64 + X */
#define low_red_128_064_001_sqr(op0,op1,op2,op3,tp0,tp1,re0,re1)\
    tp0 = _mm_xor_si128(op2, op3);\
    tp1 = _mm_slli_epi64(tp0, 1);\
    re0 = _mm_xor_si128(op0, tp1);\
    re1 = _mm_xor_si128(tp0, op1);\
    re1 = _mm_xor_si128(re1, _mm_slli_epi64(op3, 1));

/* [F_q^2] reduction of a 128-bit polynomial modulo X^127 + X^63 + 1 */
#define low_red_127_063_000(op0,op1,tp0)\
    tp0 = _mm_srli_epi64(op1, 63);\
    op0 = _mm_xor_si128(op0, tp0);\
    tp0 = _mm_slli_epi64(tp0, 63);\
    op0 = _mm_xor_si128(op0, tp0);\
    op1 = _mm_xor_si128(op1, tp0);

/* [F_q  ] general reduction modulo X^128 + X^64 + X */
#define low_red_128_064_001_bas(op0,op1,tp0,tp1,tp2,re0)\
    tp0 = _mm_alignr_epi8(op1, op1, 8);\
    tp1 = _mm_xor_si128(op1, tp0);\
    tp2 = _mm_srli_epi64(op1, 63);\
    tp1 = _mm_xor_si128(tp1, tp2);\
    tp2 = _mm_unpackhi_epi64(tp1, op1);\
    tp2 = _mm_slli_epi64(tp2, 1);\
    tp1 = _mm_slli_si128(tp1, 8);\
    tp1 = _mm_xor_si128(tp1, tp2);\
    re0 = _mm_xor_si128(op0, tp1);

/* [F_q  ] squaring reduction modulo X^128 + X^64 + X */
#define low_red_128_064_001_sqr_bas(op0,op1,tp0,tp1,re0)\
    tp0 = _mm_alignr_epi8(op1, op1, 8);\
    tp0 = _mm_xor_si128(tp0, op1);\
    tp1 = _mm_unpackhi_epi64(tp0, op1);\
    tp1 = _mm_slli_epi64(tp1, 1);\
    tp0 = _mm_slli_si128(tp0, 8);\
    tp0 = _mm_xor_si128(tp0, tp1);\
    re0 = _mm_xor_si128(op0, tp0);

/* multiplication */
/* [F_q^2] karatsuba algorithm step (middle term addition is not included) */
#define low_kts_stp(op0,op1,op2,op3,op4,op5,re0,re1,re2,ord)\
    re0 = _mm_clmulepi64_si128(op0, op1, ord);\
    re1 = _mm_clmulepi64_si128(op2, op3, ord);\
    re2 = _mm_clmulepi64_si128(op4, op5, ord);\
    re1 = _mm_xor_si128(re1, re0);\
    re1 = _mm_xor_si128(re1, re2);

/* [F_q^2] Karatsuba multiplication */
void low_mul(__m128i *re_0, __m128i *re_1, __m128i op00, __m128i op01,__m128i op10, __m128i op11) {
    /* var */
    __m128i a00, a01, a02;
    __m128i k00, k01, k02;
    __m128i r00, r01, r02, r10, r11, r12, r20, r21, r22;
    __m128i rbe, rga;
    __m128i dal, dbe, dga, dde, dt0, dt1;

    /* karatsuba: pre */
    /* high level: (b_0 + b_1) | (a_0 + a_1) (LO) > a00 */
    a00 = _mm_unpacklo_epi64(op00, op10);
    a01 = _mm_unpackhi_epi64(op00, op10);
    a00 = _mm_xor_si128(a00, a01);
    
    /* high level: (b_0 + b_1) | (a_0 + a_1) (HI) > a01 */
    a01 = _mm_unpacklo_epi64(op01, op11);
    a02 = _mm_unpackhi_epi64(op01, op11);
    a01 = _mm_xor_si128(a01, a02);

    /* low level: (a_0 + a_1) */
    k00 = _mm_xor_si128(op00, op01);
    k01 = _mm_xor_si128(a00, a01);
    k02 = _mm_xor_si128(op10, op11);

    /* partial karatsuba multiplication */
    low_kts_stp(op00,op10,k00,k02,op01,op11,r00,r01,r02,0x00); /* a0xb0 */
    low_kts_stp(a00,a00,k01,k01,a01,a01,r10,r11,r12,0x01);     /* (a0+a1) x (b0+b1) */
    low_kts_stp(op00,op10,k00,k02,op01,op11,r20,r21,r22,0x11); /* a1xb1 */
      
    /* karatsuba: final sum (the middle term is computed separately, and then reorganized) */
    /* imaginary part */
    r10 = _mm_xor_si128(r10, r00); /* low term */
    r11 = _mm_xor_si128(r11, r01); /* middle term */
    r12 = _mm_xor_si128(r12, r02); /* high term */

    /* real part */
    r00 = _mm_xor_si128(r20, r00); /* low term */
    r01 = _mm_xor_si128(r21, r01); /* middle term */
    r02 = _mm_xor_si128(r22, r02); /* high term */

    rbe = _mm_unpacklo_epi64(r01, r11);
    rga = _mm_unpackhi_epi64(r01, r11);

    /* reduction: pre */
    dal = _mm_unpacklo_epi64(r00, r10);
    dbe = _mm_unpackhi_epi64(r00, r10);
    dga = _mm_unpacklo_epi64(r02, r12);
    dde = _mm_unpackhi_epi64(r02, r12);
   
    /* karatsuba: final sum (middle term is added to the result values) */ 
    dbe = _mm_xor_si128(dbe, rbe);
    dga = _mm_xor_si128(dga, rga);

    /* reduction */
    low_red_128_064_001(dal,dbe,dga,dde,dt0,dt1,*re_0,*re_1);
 
    /* end */ 
    return;
}

/* [F_q^2] multiplication by (1 + u) */
void low_mul_01u(__m128i *re_0, __m128i *re_1, __m128i op00, __m128i op01) {
    /* var */
    __m128i t00, t01;

    /* multiplication */
    /* (a0 + a1u) * (1 + u) = (a0 + a1) + a0u */
    t00 = _mm_slli_si128(op00, 8);
    t01 = _mm_slli_si128(op01, 8);
    
    *re_0 = _mm_xor_si128(op00, t00);
    *re_1 = _mm_xor_si128(op01, t01);

    *re_0 = _mm_alignr_epi8(*re_0, *re_0, 8); 
    *re_1 = _mm_alignr_epi8(*re_1, *re_1, 8); 

    /* end */
    return;
}

/* [F_q^2] multiplication by (0 + u) */
void low_mul_00u(__m128i *re_0, __m128i *re_1, __m128i op00, __m128i op01) {
    /* var */
    __m128i t00, t01;

    /* multiplication */
    /* (a0 + a1u) * (0 + u) = a1 + (a0 + a1)u */
    t00 = _mm_srli_si128(op00, 8);
    t01 = _mm_srli_si128(op01, 8);
    
    *re_0 = _mm_xor_si128(op00, t00);
    *re_1 = _mm_xor_si128(op01, t01);

    *re_0 = _mm_alignr_epi8(*re_0, *re_0, 8); 
    *re_1 = _mm_alignr_epi8(*re_1, *re_1, 8); 

    /* end */
    return;
}

/* [F_q^2] multiplication by (x^27 + u) */
void low_mul_27u(__m128i *re_0, __m128i *re_1, __m128i op00, __m128i op01) {
    /* var */
    __m128i l01, r00;
    __m128i alp, bet, gam;
    __m128i t00, t01;

    /* multiplication */
    alp = _mm_slli_epi64(op00, 27);
    l01 = _mm_slli_epi64(op01, 27);

    r00 = _mm_srli_epi64(op00, 37);
    gam = _mm_srli_epi64(op01, 37);    
   
    bet = _mm_xor_si128(l01, r00);

    /* reduction */
    bet = _mm_xor_si128(bet, gam);
    gam = _mm_slli_epi64(gam, 1);
    alp = _mm_xor_si128(alp, gam);

    /* final multiplication */
    t00 = _mm_srli_si128(op00, 8);
    t01 = _mm_srli_si128(op01, 8);

    t00 = _mm_xor_si128(t00, op00);
    t01 = _mm_xor_si128(t01, op01);

    t00 = _mm_alignr_epi8(t00, t00, 8);
    t01 = _mm_alignr_epi8(t01, t01, 8);

    *re_0 = _mm_xor_si128(t00, alp);
    *re_1 = _mm_xor_si128(t01, bet); 

    /* end */
    return;
}

/* [F_q^2] multiplication by (b \in Fq) */
void low_mul_fq1(__m128i *c_00, __m128i *c_01, __m128i a_00, __m128i a_01, __m128i b_00) {
    /* var */
    __m128i re00, re01, im00, im01;
    __m128i real, rebe, rega, rede;
    __m128i tmp0;

    /* multiplication */
    re00 = _mm_clmulepi64_si128(a_00, b_00, 0x00);
    re01 = _mm_clmulepi64_si128(a_01, b_00, 0x00);
    im00 = _mm_clmulepi64_si128(a_00, b_00, 0x01);
    im01 = _mm_clmulepi64_si128(a_01, b_00, 0x01);

    /* reduction: pre */
    real = _mm_unpacklo_epi64(re00, im00);
    rebe = _mm_unpackhi_epi64(re00, im00);
    rega = _mm_unpacklo_epi64(re01, im01);
    rede = _mm_unpackhi_epi64(re01, im01);

    /* multiplication: post */
    rebe = _mm_xor_si128(rebe, rega);
    rega = rede;

    /* reduction */
    low_red_128_064_001_fq1(real,rebe,rega,tmp0,*c_00,*c_01);

    /* end */
    return;
}

/* [F_q  ] Karatsuba multiplication */
void low_mul_bas(__m128i *re_0, __m128i op00, __m128i op10) {
    /* var */
    __m128i a00, a01, a02;
    __m128i k00, k01, k02;
    __m128i sal, sbe;

    /* karatsuba: pre */
    a00 = _mm_unpacklo_epi64(op00, op10);
    a01 = _mm_unpackhi_epi64(op00, op10);
    a00 = _mm_xor_si128(a00, a01);
 
    /* karatsuba */
    k00 = _mm_clmulepi64_si128(op00, op10, 0x00);
    k01 = _mm_clmulepi64_si128(a00, a00, 0x10);
    k02 = _mm_clmulepi64_si128(op00, op10, 0x11);
    k01 = _mm_xor_si128(k01, k00);
    k01 = _mm_xor_si128(k01, k02);

    /* katatsuba: post */
    sal = _mm_xor_si128(k00, _mm_slli_si128(k01, 8));
    sbe = _mm_xor_si128(k02, _mm_srli_si128(k01, 8));
     
    /* reduction */
    low_red_128_064_001_bas(sal,sbe,a00,a01,a02,*re_0);

    /* end */
    return;
}

/* squaring */
/* [F_q^2] squaring */
void low_sqr(__m128i *re_0, __m128i *re_1, __m128i op00, __m128i op01) {
    /* var */
    __m128i a00, a01;
    __m128i sal, sbe, sga, sde, st0, st1;
    __m128i dt0, dt1;
   
    /* pre */
    a00 = _mm_shuffle_epi32(op00, 0xD8);
    a01 = _mm_shuffle_epi32(op01, 0xD8);

    /* squaring */
    sal = _mm_clmulepi64_si128(a00, a00, 0x00);
    sbe = _mm_clmulepi64_si128(a00, a00, 0x11);
    sga = _mm_clmulepi64_si128(a01, a01, 0x00);
    sde = _mm_clmulepi64_si128(a01, a01, 0x11);

    /* reduce */
    low_red_128_064_001_sqr(sal,sbe,sga,sde,st0,st1,*re_0,*re_1);

    /* squaring: final sum */
    st0 = _mm_srli_si128(*re_0, 8);
    st1 = _mm_srli_si128(*re_1, 8);
    *re_0 = _mm_xor_si128(*re_0, st0);
    *re_1 = _mm_xor_si128(*re_1, st1);

    /* end */
    return;
}

/* [F_q  ] squaring */
void low_sqr_bas(__m128i *re_0, __m128i op00) {
    /* var */
    __m128i sal, sbe;
    __m128i t00, t01;
  
    /* squaring */
    sal = _mm_clmulepi64_si128(op00, op00, 0x00);
    sbe = _mm_clmulepi64_si128(op00, op00, 0x11);

    /* reduce */
    low_red_128_064_001_sqr_bas(sal,sbe,t00,t01,*re_0);

    /* end */
    return;
}

#define low_sqr_003_stp(fir)\
    sal = _mm_clmulepi64_si128(fir, fir, 0x00);\
    sbe = _mm_clmulepi64_si128(fir, fir, 0x11);\
    low_red_128_064_001_sqr_bas(sal,sbe,t00,t01,*re_0);\
    sal = _mm_clmulepi64_si128(*re_0, *re_0, 0x00);\
    sbe = _mm_clmulepi64_si128(*re_0, *re_0, 0x11);\
    low_red_128_064_001_sqr_bas(sal,sbe,t00,t01,*re_0);\
    sal = _mm_clmulepi64_si128(*re_0, *re_0, 0x00);\
    sbe = _mm_clmulepi64_si128(*re_0, *re_0, 0x11);\
    low_red_128_064_001_sqr_bas(sal,sbe,t00,t01,*re_0);

/* [F_q  ] three squarings */
void low_sqr_003_bas(__m128i *re_0, __m128i op00) {
    /* var */
    __m128i sal, sbe;
    __m128i t00, t01;

    /* squarings */ 
    low_sqr_003_stp(op00);

    /* end */ 
    return;
}

/* [F_q  ] six squarings */
void low_sqr_006_bas(__m128i *re_0, __m128i op00) {
    /* var */
    __m128i sal, sbe;
    __m128i t00, t01;

    /* squarings */
    low_sqr_003_stp(op00);
    low_sqr_003_stp(*re_0); /* 006 */

    /* end */
    return;
}

/* [F_q  ] fifteen squarings */
void low_sqr_015_bas(__m128i *re_0, __m128i op00) {
    /* var */
    __m128i sal, sbe;
    __m128i t00, t01;

    /* squarings */
    low_sqr_003_stp(op00);
    low_sqr_003_stp(*re_0); /* 006 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 012 */
    low_sqr_003_stp(*re_0); /* 015 */

    /* end */
    return;
}

/* [F_q  ] thirty squarings */
void low_sqr_030_bas(__m128i *re_0, __m128i op00) {
    /* var */
    __m128i sal, sbe;
    __m128i t00, t01;

    /* squarings */
    low_sqr_003_stp(op00);
    low_sqr_003_stp(*re_0); /* 006 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 012 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 018 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 024 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 030 */

    /* end */
    return;
}

/* [F_q  ] sixty-three squarings */
void low_sqr_063_bas(__m128i *re_0, __m128i op00) {
    /* var */
    __m128i sal, sbe;
    __m128i t00, t01;

    /* squarings */
    low_sqr_003_stp(op00);
    low_sqr_003_stp(*re_0); /* 006 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 012 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 018 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 024 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 030 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 036 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 042 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 048 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 054 */
    low_sqr_003_stp(*re_0);
    low_sqr_003_stp(*re_0); /* 060 */
    low_sqr_003_stp(*re_0); /* 063 */

    /* end */
    return;
}

/* inversion */
/* [F_q  ] inversion */
void low_inv_bas(__m128i *re_0, __m128i op00) {
    /* var */
    __m128i a00, a01, a03;

    /* itoh-tsujii: 1-2-3-6-12-15-30-60-63-126 */
    low_sqr_bas(&a01, op00); /* 001 > 002 */
    low_mul_bas(&a00, a01, op00);

    low_sqr_bas(&a01, a00); /* 002 > 003 */
    low_mul_bas(&a03, a01, op00);

    low_sqr_003_bas(&a01, a03); /* 003 > 006 */
    low_mul_bas(&a00, a01, a03);

    low_sqr_006_bas(&a01, a00); /* 006 > 012 */
    low_mul_bas(&a00, a01, a00);

    low_sqr_003_bas(&a01, a00); /* 012 > 015 */
    low_mul_bas(&a00, a01, a03);

    low_sqr_015_bas(&a01, a00); /* 015 > 030 */
    low_mul_bas(&a00, a01, a00);

    low_sqr_030_bas(&a01, a00); /* 030 > 060 */
    low_mul_bas(&a00, a01, a00);

    low_sqr_003_bas(&a01, a00); /* 060 > 063 */
    low_mul_bas(&a00, a01, a03);

    low_sqr_063_bas(&a01, a00); /* 063 > 126 */
    low_mul_bas(&a00, a01, a00);

    low_sqr_bas(re_0, a00); /* 126 > 127 */

    /* end */
    return;
}

/* [F_q^2] inversion */
void low_inv(__m128i *re_0, __m128i *re_1, __m128i op00, __m128i op01) {
    /* var */
    __m128i are, aim, cre, cim;
    __m128i t00, t01, t02;

    /* inversion: pre */
    are = _mm_unpacklo_epi64(op00, op01);
    aim = _mm_unpackhi_epi64(op00, op01);

    /* inversion */
    t00 = _mm_xor_si128(are, aim);  /* t00 = a_r + a_i */
    low_mul_bas(&t01, are, aim);    /* t01 = a_r * a_i */
    low_sqr_bas(&t02, t00);         /* t02 = (a_r + a_i)^2 */
    t01 = _mm_xor_si128(t01, t02);  /* t = a_r * a_i + (a_r + a_i)^2 */

    low_inv_bas(&t01, t01);         /* t = t^-1 */

    low_mul_bas(&cre, t00, t01);    /* c_r = (a_r + a_i) * t */
    low_mul_bas(&cim, aim, t01);    /* c_i = a_i * t */

    /* inversion: post */ 
    *re_0 = _mm_unpacklo_epi64(cre, cim);
    *re_1 = _mm_unpackhi_epi64(cre, cim);

    /* end */
    return;
}

