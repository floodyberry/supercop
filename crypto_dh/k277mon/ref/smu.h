/* scalar multiplication */

/*
# integer to 2-adic representation

< inp
[uint64_t] k : integer
> out
[uint64_t] k2a : 2-adic representation of k
*/

void smu_mon_itb(uint8_t *k2a, uint64_t k) {
    /* var */
    uint64_t i;

    /* man */
    for (i=0;i<64;i++) { k2a[i] = (k >> i) % 2; }

    /* end */
    return;
}

/*
# data veil
*/

#define smu_vei(c_00,c_01,c_02,a_00,a_01,a_02,b_00,b_01,b_02,msk)\
    c_00 = _mm_xor_si128(_mm_and_si128(msk,a_00),_mm_andnot_si128(msk,b_00));\
    c_01 = _mm_xor_si128(_mm_and_si128(msk,a_01),_mm_andnot_si128(msk,b_01));\
    c_02 = _mm_xor_si128(_mm_and_si128(msk,a_02),_mm_andnot_si128(msk,b_02));

#define SMU_VEI(C,A,B,MSK)\
    smu_vei(C##_00,C##_01,C##_02,A##_00,A##_01,A##_02,B##_00,B##_01,B##_02,MSK);

/*
# montgomery scalar multiplication
Q(x,y) <- k * P(x,y)

< inp
[__m128i] px_00, px_01, px_02 : P x coordinate
[__m128i] py_00, py_01, py_02 : P y coordinate
[uint64_t] k : scalar k
> out
[__m128i] qx_00, qx_01, qx_02 : Q x coordinate
[__m128i] qy_00, qy_01, qy_02 : Q y coordinate
*/

void smu_mon(__m128i *qx_00, __m128i *qx_01, __m128i *qx_02,
             __m128i *qy_00, __m128i *qy_01, __m128i *qy_02,
             __m128i px_00, __m128i px_01, __m128i px_02,
             __m128i py_00, __m128i py_01, __m128i py_02,
             uint64_t *k) {
    /* var */
    __m128i pX_00, pX_01, pX_02, pZ_00, pZ_01, pZ_02;
    __m128i qX_00, qX_01, qX_02, qZ_00, qZ_01, qZ_02;
    __m128i tX_00, tX_01, tX_02, tZ_00, tZ_01, tZ_02;
    __m128i msk, one;
    uint64_t swi;
    int64_t i;
    uint8_t k2a[320];

    /* ini */
    one = _mm_set_epi64x(0x1, 0x1);

    /* 2-adic representation */
    smu_mon_itb(&k2a[0], k[0]);
    smu_mon_itb(&k2a[64], k[1]);
    smu_mon_itb(&k2a[128], k[2]);
    smu_mon_itb(&k2a[192], k[3]);
    smu_mon_itb(&k2a[256], k[4]);

    /* points P and Q */
    pX_00 = px_00; pX_01 = px_01; pX_02 = px_02;
    pZ_00 = _mm_set_epi64x(0x0, 0x1); pZ_01 = _mm_setzero_si128(); pZ_02 = _mm_setzero_si128();
    FFA_SQR(qZ, pX); FFA_SQR(qX, qZ); qX_00 = _mm_xor_si128(qX_00, pZ_00);

    /* man */
    swi = 1;

    for (i=274;i>=0;i--) {
        swi = k2a[i] ^ swi;
        msk = _mm_set_epi64x(swi, swi);
        msk = _mm_sub_epi64(msk, one);

        tX_00 = pX_00; tX_01 = pX_01; tX_02 = pX_02;
        tZ_00 = pZ_00; tZ_01 = pZ_01; tZ_02 = pZ_02;
        SMU_VEI(pX,pX,qX,msk); SMU_VEI(pZ,pZ,qZ,msk);
        SMU_VEI(qX,qX,tX,msk); SMU_VEI(qZ,qZ,tZ,msk);

        ECA_ADD_MON(pX,pZ,pX,pZ,qX,qZ,px);
        ECA_DBL_MON(qX,qZ,qX,qZ);

        swi = k2a[i];
    }

    /* end */
    swi = swi ^ 1;
    msk = _mm_set_epi64x(swi, swi);
    msk = _mm_sub_epi64(msk, one);

    tX_00 = pX_00; tX_01 = pX_01; tX_02 = pX_02;
    tZ_00 = pZ_00; tZ_01 = pZ_01; tZ_02 = pZ_02;
    SMU_VEI(pX,pX,qX,msk); SMU_VEI(pZ,pZ,qZ,msk);
    SMU_VEI(qX,qX,tX,msk); SMU_VEI(qZ,qZ,tZ,msk);

    ECA_MXY_MON(*qx,*qy,pX,pZ,qX,qZ,px,py);

    FFA_RED_277(*qx,*qx);
    FFA_RED_277(*qy,*qy);

    return;
}

