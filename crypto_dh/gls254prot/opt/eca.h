/* elliptic curve arithmetic */

/* [p > p] full doubling alternative */
void eca_dbl_ful(__m128i *rx00, __m128i *rx01,
                 __m128i *rl00, __m128i *rl01,
                 __m128i *rz00, __m128i *rz01,
                 __m128i px00, __m128i px01,
                 __m128i pl00, __m128i pl01,
                 __m128i pz00, __m128i pz01) {
    /* var */
    __m128i b00, b01, c00, c01, t00, t01;
    __m128i x00, x01;
  
    /* point doubling */
    /* B */
    low_sqr(&b00, &b01, pz00, pz01);
    /* C */
    c00 = _mm_xor_si128(pl00, px00); c01 = _mm_xor_si128(pl01, px01);
    low_sqr(&c00, &c01, c00, c01);
    /* T */
    t00 = _mm_xor_si128(pl00, pz00); t01 = _mm_xor_si128(pl01, pz01);
    low_mul(&t00, &t01, t00, t01, pl00, pl01);
    low_mul_00u(&x00, &x01, b00, b01);
    t00 = _mm_xor_si128(t00, x00); t01 = _mm_xor_si128(t01, x01);

    /* rx */
    low_sqr(&*rx00, &*rx01, t00, t01);
    /* rz */
    low_mul(&*rz00, &*rz01, t00, t01, b00, b01);
    /* rl */
    *rl00 = _mm_xor_si128(c00, t00); *rl01 = _mm_xor_si128(c01, t01);
    *rl00 = _mm_xor_si128(*rl00, b00); *rl01 = _mm_xor_si128(*rl01, b01);
    low_mul(&*rl00, &*rl01, *rl00, *rl01, c00, c01);
    low_sqr(&x00, &x01, b00, b01);
    low_mul_27u(&x00, &x01, x00, x01);
    x00 = _mm_xor_si128(x00, *rx00); x01 = _mm_xor_si128(x01, *rx01);
    *rl00 = _mm_xor_si128(*rl00, x00); *rl01 = _mm_xor_si128(*rl01, x01);
    low_mul_01u(&x00, &x01, *rz00, *rz01); 
    *rl00 = _mm_xor_si128(*rl00, x00); *rl01 = _mm_xor_si128(*rl01, x01);

    /* end */
    return;
}

/* [pp> p] full addition */
void eca_add_ful(__m128i *rx00, __m128i *rx01,
                 __m128i *rl00, __m128i *rl01,
                 __m128i *rz00, __m128i *rz01,
                 __m128i px00, __m128i px01,
                 __m128i pl00, __m128i pl01,
                 __m128i pz00, __m128i pz01,
                 __m128i qx00, __m128i qx01,
                 __m128i ql00, __m128i ql01,
                 __m128i qz00, __m128i qz01) {
    /* var */
    __m128i a00, a01, b00, b01, c00, c01, d00, d01;
    __m128i s00, s01, t00, t01;
    __m128i x00, x01;

    /* point addition */
    /* S */
    low_mul(&s00, &s01, px00, px01, qz00, qz01);
    /* T */ 
    low_mul(&t00, &t01, qx00, qx01, pz00, pz01);

    /* A */
    low_mul(&a00, &a01, pl00, pl01, qz00, qz01);
    low_mul(&x00, &x01, ql00, ql01, pz00, pz01);
    a00 = _mm_xor_si128(a00, x00); a01 = _mm_xor_si128(a01, x01);
    /* B */
    b00 = _mm_xor_si128(s00, t00); b01 = _mm_xor_si128(s01, t01);
    low_sqr(&b00, &b01, b00, b01);
    /* C */
    low_mul(&c00, &c01, a00, a01, t00, t01);
    /* D */
    low_mul(&d00, &d01, a00, a01, b00, b01);
    low_mul(&d00, &d01, d00, d01, qz00, qz01);
    
    /* rx */
    low_mul(&*rx00, &*rx01, a00, a01, s00, s01);
    low_mul(&*rx00, &*rx01, *rx00, *rx01, c00, c01);
    /* rl */
    *rl00 = _mm_xor_si128(b00, c00); *rl01 = _mm_xor_si128(b01, c01);
    low_sqr(&*rl00, &*rl01, *rl00, *rl01);
    x00 = _mm_xor_si128(pl00, pz00); x01 = _mm_xor_si128(pl01, pz01);
    low_mul(&x00, &x01, x00, x01, d00, d01);
    *rl00 = _mm_xor_si128(*rl00, x00); *rl01 = _mm_xor_si128(*rl01, x01);
    /* rz */
    low_mul(&*rz00, &*rz01, d00, d01, pz00, pz01); 

    return;
}

/* [pm> p] mixed addition */
void eca_add_mix(__m128i *rx00, __m128i *rx01,
                 __m128i *rl00, __m128i *rl01,
                 __m128i *rz00, __m128i *rz01,
                 __m128i px00, __m128i px01,
                 __m128i pl00, __m128i pl01,
                 __m128i pz00, __m128i pz01,
                 __m128i qx00, __m128i qx01,
                 __m128i ql00, __m128i ql01) {
    /* var */
    __m128i a00, a01, b00, b01, c00, c01, d00, d01;
    __m128i t00, t01, x00, x01;

    /* point addition */
    /* T */
    low_mul(&t00, &t01, qx00, qx01, pz00, pz01);

    /* A */
    low_mul(&a00, &a01, ql00, ql01, pz00, pz01);
    a00 = _mm_xor_si128(a00, pl00); a01 = _mm_xor_si128(a01, pl01);
    /* B */
    b00 = _mm_xor_si128(px00, t00); b01 = _mm_xor_si128(px01, t01);
    low_sqr(&b00, &b01, b00, b01);
    /* C */
    low_mul(&c00, &c01, a00, a01, t00, t01);
    /* D */
    low_mul(&d00, &d01, a00, a01, b00, b01);

    /* rx */
    low_mul(&*rx00, &*rx01, a00, a01, c00, c01);
    low_mul(&*rx00, &*rx01, *rx00, *rx01, px00, px01);
    /* rl */
    *rl00 = _mm_xor_si128(c00, b00); *rl01 = _mm_xor_si128(c01, b01);
    low_sqr(&*rl00, &*rl01, *rl00, *rl01);
    x00 = _mm_xor_si128(pl00, pz00); x01 = _mm_xor_si128(pl01, pz01);
    low_mul(&x00, &x01, x00, x01, d00, d01);
    *rl00 = _mm_xor_si128(*rl00, x00); *rl01 = _mm_xor_si128(*rl01, x01);
    /* rz */
    low_mul(&*rz00, &*rz01, d00, d01, pz00, pz01);

    /* end */
    return;
}

/* [mm> p] mixed-mixed addition */
void eca_add_mma(__m128i *rx00, __m128i *rx01,
                 __m128i *rl00, __m128i *rl01,
                 __m128i *rz00, __m128i *rz01,
                 __m128i px00, __m128i px01,
                 __m128i pl00, __m128i pl01,
                 __m128i qx00, __m128i qx01,
                 __m128i ql00, __m128i ql01) {
    /* var */
    __m128i a00, a01, b00, b01, c00, c01;
    __m128i x00, x01;

    /* point addition */
    /* A */
    a00 = _mm_xor_si128(pl00, ql00); a01 = _mm_xor_si128(pl01, ql01);
    /* B */
    b00 = _mm_xor_si128(px00, qx00); b01 = _mm_xor_si128(px01, qx01);
    low_sqr(&b00, &b01, b00, b01); 
    /* C */
    low_mul(&c00, &c01, a00, a01, qx00, qx01);

    /* rz */
    low_mul(&*rz00, &*rz01, a00, a01, b00, b01);
    /* rx */
    low_mul(&*rx00, &*rx01, a00, a01, c00, c01);
    low_mul(&*rx00, &*rx01, *rx00, *rx01, px00, px01);
    /* rl */
    *rl00 = _mm_xor_si128(c00, b00); *rl01 = _mm_xor_si128(c01, b01);
    low_sqr(&*rl00, &*rl01, *rl00, *rl01);
    low_mul(&x00, &x01, *rz00, *rz01, pl00, pl01);
    x00 = _mm_xor_si128(x00, *rz00); x01 = _mm_xor_si128(x01, *rz01);
    *rl00 = _mm_xor_si128(*rl00, x00); *rl01 = _mm_xor_si128(*rl01, x01);

    /* end */
    return;
}

/* [mm> p] doubling-and-mixed-addition */
void eca_add_dbl(__m128i *rx00, __m128i *rx01,
                     __m128i *rl00, __m128i *rl01,
                     __m128i *rz00, __m128i *rz01,
                     __m128i px00, __m128i px01,
                     __m128i pl00, __m128i pl01,
                     __m128i qx00, __m128i qx01,
                     __m128i ql00, __m128i ql01) {
    /* var */
    __m128i d00, d01, e00, e01;
    __m128i t00, t01, a00, a01, b00, b01;
    __m128i x00, x01;
    __m128i ONE;

    /* init */
    ONE = _mm_set_epi64x(0x0, 0x1);

    /* D */
    low_sqr(&d00, &d01, pl00, pl01);
    /* E */
    e00 = _mm_xor_si128(ql00, ONE); e01 = ql01;

    /* T */
    ONE = _mm_slli_si128(ONE, 8);
    t00 = _mm_xor_si128(d00, pl00); t01 = _mm_xor_si128(d01, pl01);
    t00 = _mm_xor_si128(t00, ONE);
    /* A */
    low_sqr(&a00, &a01, px00, px01);
    x00 = _mm_xor_si128(d00, e00); x01 = _mm_xor_si128(d01, e01);
    x00 = _mm_xor_si128(x00, ONE);
    low_mul(&x00, &x01, x00, x01, t00, t01);
    a00 = _mm_xor_si128(a00, x00); a01 = _mm_xor_si128(a01, x01);
    /* B */
    b00 = _mm_xor_si128(qx00, t00); b01 = _mm_xor_si128(qx01, t01);
    low_sqr(&b00, &b01, b00, b01);

    /* rx */
    low_sqr(&*rx00, &*rx01, a00, a01);
    low_mul(&*rx00, &*rx01, *rx00, *rx01, qx00, qx01);
    /* rz */
    low_mul(&*rz00, &*rz01, a00, a01, b00, b01); 
    /* rl */
    *rl00 = _mm_xor_si128(a00, b00); *rl01 = _mm_xor_si128(a01, b01);
    low_sqr(&*rl00, &*rl01, *rl00, *rl01);
    low_mul(&*rl00, &*rl01, *rl00, *rl01, t00, t01);
    low_mul(&x00, &x01, e00, e01, *rz00, *rz01);
    *rl00 = _mm_xor_si128(*rl00, x00); *rl01 = _mm_xor_si128(*rl01, x01);

    /* end */
    return;
}

/* [pm> p] doubling-and-addition-subtraction */
void eca_add_sub_dbl(__m128i *rx00, __m128i *rx01,
                    __m128i *rl00, __m128i *rl01,
                    __m128i *rz00, __m128i *rz01,
                    __m128i *sx00, __m128i *sx01,
                    __m128i *sl00, __m128i *sl01,
                    __m128i *sz00, __m128i *sz01,
                    __m128i px00, __m128i px01,
                    __m128i pl00, __m128i pl01,
                    __m128i pz00, __m128i pz01,
                    __m128i qx00, __m128i qx01,
                    __m128i ql00, __m128i ql01) {
    /* var */
    __m128i d00, d01, e00, e01, f00, f01, s00, s01;
    __m128i t00, t01, a00, a01, b00, b01;
    __m128i x00, x01;
    __m128i ONE;

    /* init */
    ONE = _mm_set_epi64x(0x0, 0x1);

    /* point doubling-and-addition */
    /* D */
    low_sqr(&d00, &d01, pl00, pl01);
    /* E */
    low_sqr(&e00, &e01, pz00, pz01);
    /* S */
    low_mul(&s00, &s01, qx00, qx01, e00, e01);

    /* T */
    low_mul(&t00, &t01, pl00, pl01, pz00, pz01);
    t00 = _mm_xor_si128(t00, d00); t01 = _mm_xor_si128(t01, d01);
    low_mul_00u(&x00, &x01, e00, e01);
    t00 = _mm_xor_si128(t00, x00); t01 = _mm_xor_si128(t01, x01);
    /* A */
    low_sqr(&a00, &a01, px00, px01);
    low_mul(&a00, &a01, a00, a01, e00, e01);
    ONE = _mm_slli_si128(ONE, 8);
    x00 = _mm_xor_si128(ql00, ONE); x01 = ql01;
    low_mul(&x00, &x01, x00, x01, e00, e01);
    x00 = _mm_xor_si128(x00, d00); x01 = _mm_xor_si128(x01, d01);
    low_mul(&x00, &x01, x00, x01, t00, t01);
    a00 = _mm_xor_si128(a00, x00); a01 = _mm_xor_si128(a01, x01);
    /* B */
    b00 = _mm_xor_si128(s00, t00); b01 = _mm_xor_si128(s01, t01);
    low_sqr(&b00, &b01, b00, b01);

    /* rx */
    low_sqr(&*rx00, &*rx01, a00, a01);
    low_mul(&*rx00, &*rx01, *rx00, *rx01, s00, s01);
    /* rz */
    low_mul(&f00, &f01, b00, b01, e00, e01);
    low_mul(&*rz00, &*rz01, a00, a01, f00, f01);
    /* rl */
    *rl00 = _mm_xor_si128(a00, b00); *rl01 = _mm_xor_si128(a01, b01);
    low_sqr(&*rl00, &*rl01, *rl00, *rl01);
    low_mul(&*rl00, &*rl01, *rl00, *rl01, t00, t01);
    low_mul(&x00, &x01, ql00, ql01, *rz00, *rz01);
    *rl00 = _mm_xor_si128(*rl00, x00); *rl01 = _mm_xor_si128(*rl01, x01);

    /* init */
    ONE = _mm_set_epi64x(0x0, 0x1);

    /* A' */
    low_mul(&x00, &x01, t00, t01, e00, e01);
    a00 = _mm_xor_si128(a00, x00); a01 = _mm_xor_si128(a01, x01);
    /* sx */
    low_sqr(&*sx00, &*sx01, a00, a01);
    low_mul(&*sx00, &*sx01, *sx00, *sx01, s00, s01);
    /* sz */
    low_mul(&*sz00, &*sz01, a00, a01, f00, f01);
    /* sl */
    *sl00 = _mm_xor_si128(a00, b00); *sl01 = _mm_xor_si128(a01, b01);
    low_sqr(&*sl00, &*sl01, *sl00, *sl01);
    low_mul(&*sl00, &*sl01, *sl00, *sl01, t00, t01);
    low_mul(&x00, &x01, _mm_xor_si128(ql00, ONE), ql01, *sz00, *sz01);
    *sl00 = _mm_xor_si128(*sl00, x00); *sl01 = _mm_xor_si128(*sl01, x01);

    /* end */
    return;
}

/* [pm> p] doubling-and-addition-addition */
void eca_add_add_dbl(__m128i *rx00, __m128i *rx01,
                 __m128i *rl00, __m128i *rl01,
                 __m128i *rz00, __m128i *rz01,
                 __m128i px00, __m128i px01,
                 __m128i pl00, __m128i pl01,
                 __m128i pz00, __m128i pz01,
                 __m128i qx00, __m128i qx01,
                 __m128i ql00, __m128i ql01,
                 __m128i sx00, __m128i sx01,
                 __m128i sl00, __m128i sl01) {
    /* var */
    __m128i d00, d01, e00, e01, f00, f01, s00, s01;
    __m128i t00, t01, a00, a01, b00, b01, c00, c01;
    __m128i x00, x01;
    __m128i ONE;

    /* init */
    ONE = _mm_set_epi64x(0x0, 0x1);

    /* point doubling-and-addition */
    /* D */
    low_sqr(&d00, &d01, pl00, pl01);
    /* E */
    low_sqr(&e00, &e01, pz00, pz01);
    /* F */
    f00 = _mm_xor_si128(ql00, ONE); f01 = ql01;
    /* S */
    low_mul(&s00, &s01, qx00, qx01, e00, e01);

    /* T */
    low_mul(&t00, &t01, pl00, pl01, pz00, pz01);
    t00 = _mm_xor_si128(t00, d00); t01 = _mm_xor_si128(t01, d01);
    low_mul_00u(&x00, &x01, e00, e01);
    t00 = _mm_xor_si128(t00, x00); t01 = _mm_xor_si128(t01, x01);
    /* A */
    low_sqr(&a00, &a01, px00, px01);
    low_mul(&a00, &a01, a00, a01, e00, e01);
    x00 = _mm_xor_si128(f00, _mm_slli_si128(ONE, 8)); x01 = f01;
    low_mul(&x00, &x01, x00, x01, e00, e01);
    x00 = _mm_xor_si128(x00, d00); x01 = _mm_xor_si128(x01, d01);
    low_mul(&x00, &x01, x00, x01, t00, t01);
    a00 = _mm_xor_si128(a00, x00); a01 = _mm_xor_si128(a01, x01);
    /* B */
    b00 = _mm_xor_si128(s00, t00); b01 = _mm_xor_si128(s01, t01);
    low_sqr(&b00, &b01, b00, b01);

    /* rx */
    low_sqr(&*rx00, &*rx01, a00, a01);
    low_mul(&*rx00, &*rx01, *rx00, *rx01, s00, s01);
    /* rz */
    low_mul(&*rz00, &*rz01, a00, a01, b00, b01);
    low_mul(&*rz00, &*rz01, *rz00, *rz01, e00, e01);
    /* rl */
    *rl00 = _mm_xor_si128(a00, b00); *rl01 = _mm_xor_si128(a01, b01);
    low_sqr(&*rl00, &*rl01, *rl00, *rl01);
    low_mul(&*rl00, &*rl01, *rl00, *rl01, t00, t01);
    f00 = _mm_xor_si128(sl00, f00); f01 = _mm_xor_si128(sl01, f01);
    low_mul(&x00, &x01, f00, f01, *rz00, *rz01);
    a00 = _mm_xor_si128(*rl00, x00); a01 = _mm_xor_si128(*rl01, x01);

    /* point addition */
    /* T */
    low_mul(&t00, &t01, sx00, sx01, *rz00, *rz01);

    /* A */
    /* B */
    b00 = _mm_xor_si128(*rx00, t00); b01 = _mm_xor_si128(*rx01, t01);
    low_sqr(&b00, &b01, b00, b01);
    /* C */
    low_mul(&x00, &x01, a00, a01, t00, t01);
    /* D */
    low_mul(&d00, &d01, a00, a01, b00, b01);

    /* rx */
    low_mul(&c00, &c01, a00, a01, *rx00, *rx01);
    low_mul(&*rx00, &*rx01, x00, x01, c00, c01);
    /* rz */
    low_mul(&*rz00, &*rz01, d00, d01, *rz00, *rz01);
    /* rl */
    c00 = _mm_xor_si128(c00, b00); c01 = _mm_xor_si128(c01, b01);
    low_sqr(&c00, &c01, c00, c01);
    x00 = _mm_xor_si128(sl00, ONE); x01 = sl01;
    low_mul(&x00, &x01, x00, x01, *rz00, *rz01);
    *rl00 = _mm_xor_si128(c00, x00); *rl01 = _mm_xor_si128(c01, x01);

    /* end */
    return;
}

