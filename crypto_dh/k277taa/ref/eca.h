/* elliptic curve point arithmetic */

/*
# tau endomorphism over affine coordinates
R(x,l) <- tau(P(x,l))

< inp
[__m128i] px_00, px_01, px_02 : point P x coordinate
[__m128i] pl_00, pl_01, pl_02 : point P l coordinate
> out
[__m128i] rx_00, rx_01, rx_02 : point R x coordinate
[__m128i] rl_00, rl_01, rl_02 : point R l coordinate
*/

void eca_tau_aff(__m128i *rx_00, __m128i *rx_01, __m128i *rx_02,
                 __m128i *rl_00, __m128i *rl_01, __m128i *rl_02,
                 __m128i px_00, __m128i px_01, __m128i px_02,
                 __m128i pl_00, __m128i pl_01, __m128i pl_02) {
    /* man */
    FFA_SQR(*rx, px);
    FFA_SQR(*rl, pl);

    /* end */
    return;
}

#define ECA_TAU_AFF(RX,RL,PX,PL)\
    eca_tau_aff(&RX##_00,&RX##_01,&RX##_02,&RL##_00,&RL##_01,&RL##_02,\
                PX##_00,PX##_01,PX##_02,PL##_00,PL##_01,PL##_02);

/*
# tau endomorphism over proyective coordinates
R(X,L,Z) <- tau(P(X,L,Z))

< inp
[__m128i] pX_00, pX_01, pX_02 : point P X coordinate
[__m128i] pL_00, pL_01, pL_02 : point P L coordinate
[__m128i] pZ_00, pZ_01, pZ_02 : point P Z coordinate
> out
[__m128i] rX_00, rX_01, rX_02 : point R X coordinate
[__m128i] rL_00, rL_01, rL_02 : point R L coordinate
[__m128i] rZ_00, rZ_01, rZ_02 : point R Z coordinate
*/

void eca_tau_pro(__m128i *rX_00, __m128i *rX_01, __m128i *rX_02,
                 __m128i *rL_00, __m128i *rL_01, __m128i *rL_02,
                 __m128i *rZ_00, __m128i *rZ_01, __m128i *rZ_02,
                 __m128i pX_00, __m128i pX_01, __m128i pX_02,
                 __m128i pL_00, __m128i pL_01, __m128i pL_02,
                 __m128i pZ_00, __m128i pZ_01, __m128i pZ_02) {
    /* man */
    FFA_SQR(*rX, pX);
    FFA_SQR(*rL, pL);
    FFA_SQR(*rZ, pZ);

    /* end */
    return;
}

#define ECA_TAU_PRO(RX,RL,RZ,PX,PL,PZ)\
    eca_tau_pro(&RX##_00,&RX##_01,&RX##_02,&RL##_00,&RL##_01,&RL##_02,&RZ##_00,&RZ##_01,&RZ##_02,\
                PX##_00,PX##_01,PX##_02,PL##_00,PL##_01,PL##_02,PZ##_00,PZ##_01,PZ##_02);

/*
# point doubling
R(X,L,Z) <- 2*P(X,L,Z)

< inp
[__m128i] pX_00, pX_01, pX_02 : point P X coordinate
[__m128i] pL_00, pL_01, pL_02 : point P L coordinate
[__m128i] pZ_00, pZ_01, pZ_02 : point P Z coordinate
> out
[__m128i] rX_00, rX_01, rX_02 : point R X coordinate
[__m128i] rL_00, rL_01, rL_02 : point R L coordinate
[__m128i] rZ_00, rZ_01, rZ_02 : point R Z coordinate
*/

void eca_dbl(__m128i *rX_00, __m128i *rX_01, __m128i *rX_02,
             __m128i *rL_00, __m128i *rL_01, __m128i *rL_02,
             __m128i *rZ_00, __m128i *rZ_01, __m128i *rZ_02,
             __m128i pX_00, __m128i pX_01, __m128i pX_02,
             __m128i pL_00, __m128i pL_01, __m128i pL_02,
             __m128i pZ_00, __m128i pZ_01, __m128i pZ_02) {
    /* var */
    __m128i b_00, b_01, b_02;
    __m128i c_00, c_01, c_02;
    __m128i t_00, t_01, t_02;
    __m128i tp_00, tp_01, tp_02;

    /* ini */
    FFA_SQR(b, pZ);
    FFA_ADD(c, pX, pL);
    FFA_SQR(c, c);
    FFA_ADD(t, pZ, pL);
    FFA_MUL(t, pL, t);

    /* man */
    FFA_SQR(*rX, t);

    FFA_MUL(*rZ, t, b);

    FFA_ADD(*rL, c, t);
    FFA_ADD(*rL, *rL, b);
    FFA_MUL(*rL, *rL, c);
    FFA_ADD(*rL, *rL, *rX);
    FFA_ADD(*rL, *rL, *rZ);
    FFA_SQR(tp, b);
    FFA_ADD(*rL, *rL, tp);

    /* end */
    return;
}

#define ECA_DBL(RX,RL,RZ,PX,PL,PZ)\
    eca_dbl(RX##_00,RX##_01,RX##_02,RL##_00,RL##_01,RL##_02,RZ##_00,RZ##_01,RZ##_02,\
            PX##_00,PX##_01,PX##_02,PL##_00,PL##_01,PL##_02,PZ##_00,PZ##_01,PZ##_02);

/*
# point full addition
R(X,L,Z) <- P(X,L,Z) + Q(X,L,Z)

< inp
[__m128i] pX_00, pX_01, pX_02 : point P X coordinate
[__m128i] pL_00, pL_01, pL_02 : point P L coordinate
[__m128i] pZ_00, pZ_01, pZ_02 : point P Z coordinate
[__m128i] qX_00, qX_01, qX_02 : point Q X coordinate
[__m128i] qL_00, qL_01, qL_02 : point Q L coordinate
[__m128i] qZ_00, qZ_01, qZ_02 : point Q Z coordinate
> out
[__m128i] rX_00, rX_01, rX_02 : point R X coordinate
[__m128i] rL_00, rL_01, rL_02 : point R L coordinate
[__m128i] rZ_00, rZ_01, rZ_02 : point R Z coordinate
*/

void eca_add_ful(__m128i *rX_00, __m128i *rX_01, __m128i *rX_02,
                 __m128i *rL_00, __m128i *rL_01, __m128i *rL_02,
                 __m128i *rZ_00, __m128i *rZ_01, __m128i *rZ_02,
                 __m128i pX_00, __m128i pX_01, __m128i pX_02,
                 __m128i pL_00, __m128i pL_01, __m128i pL_02,
                 __m128i pZ_00, __m128i pZ_01, __m128i pZ_02,
                 __m128i qX_00, __m128i qX_01, __m128i qX_02,
                 __m128i qL_00, __m128i qL_01, __m128i qL_02,
                 __m128i qZ_00, __m128i qZ_01, __m128i qZ_02) {
    /* var */
    __m128i a_00, a_01, a_02;
    __m128i b_00, b_01, b_02;
    __m128i c_00, c_01, c_02;
    __m128i d_00, d_01, d_02;
    __m128i s_00, s_01, s_02;
    __m128i t_00, t_01, t_02;
    __m128i tp_00, tp_01, tp_02;

    /* ini */
    FFA_MUL(s, pX, qZ);
    FFA_MUL(t, qX, pZ);
    FFA_MUL(a, qL, pZ);
    FFA_MUL(tp, pL, qZ);
    FFA_ADD(a, a, tp);
    FFA_ADD(b, s, t);
    FFA_SQR(b, b);
    FFA_MUL(c, a, t);
    FFA_MUL(d, a, b);
    FFA_MUL(d, d, qZ);

    /* man */
    FFA_MUL(*rX, a, s);
    FFA_MUL(*rX, *rX, c);

    FFA_MUL(*rZ, pZ, d);

    FFA_ADD(*rL, c, b);
    FFA_SQR(*rL, *rL);
    FFA_ADD(tp, pL, pZ);
    FFA_MUL(tp, tp, d);
    FFA_ADD(*rL, *rL, tp);

    /* end */
    return;
}

#define ECA_ADD_FUL(RX,RL,RZ,PX,PL,PZ,QX,QL,QZ)\
    eca_add_ful(&RX##_00,&RX##_01,&RX##_02,&RL##_00,&RL##_01,&RL##_02,&RZ##_00,&RZ##_01,&RZ##_02,\
                PX##_00,PX##_01,PX##_02,PL##_00,PL##_01,PL##_02,PZ##_00,PZ##_01,PZ##_02,\
                QX##_00,QX##_01,QX##_02,QL##_00,QL##_01,QL##_02,QZ##_00,QZ##_01,QZ##_02);

/*
# point mixed addition
R(X,L,Z) <- P(X,L,Z) + Q(x,l)

< inp
[__m128i] pX_00, pX_01, pX_02 : point P X coordinate
[__m128i] pL_00, pL_01, pL_02 : point P L coordinate
[__m128i] pZ_00, pZ_01, pZ_02 : point P Z coordinate
[__m128i] qx_00, qx_01, qx_02 : point Q x coordinate
[__m128i] ql_00, ql_01, ql_02 : point Q l coordinate
> out
[__m128i] rX_00, rX_01, rX_02 : point R X coordinate
[__m128i] rL_00, rL_01, rL_02 : point R L coordinate
[__m128i] rZ_00, rZ_01, rZ_02 : point R Z coordinate
*/

void eca_add_mix(__m128i *rX_00, __m128i *rX_01, __m128i *rX_02,
                 __m128i *rL_00, __m128i *rL_01, __m128i *rL_02,
                 __m128i *rZ_00, __m128i *rZ_01, __m128i *rZ_02,
                 __m128i pX_00, __m128i pX_01, __m128i pX_02,
                 __m128i pL_00, __m128i pL_01, __m128i pL_02,
                 __m128i pZ_00, __m128i pZ_01, __m128i pZ_02,
                 __m128i qx_00, __m128i qx_01, __m128i qx_02,
                 __m128i ql_00, __m128i ql_01, __m128i ql_02) {
    /* var */
    __m128i a_00, a_01, a_02;
    __m128i b_00, b_01, b_02;
    __m128i c_00, c_01, c_02;
    __m128i d_00, d_01, d_02;
    __m128i t_00, t_01, t_02;
    __m128i tp_00, tp_01, tp_02;

    /* ini */
    FFA_MUL(t, qx, pZ);
    FFA_MUL(a, ql, pZ);
    FFA_ADD(a, a, pL);
    FFA_ADD(b, pX, t);
    FFA_SQR(b, b);
    FFA_MUL(c, a, t);
    FFA_MUL(d, a, b);

    /* man */
    FFA_MUL(*rX, a, pX);
    FFA_MUL(*rX, *rX, c);

    FFA_MUL(*rZ, pZ, d);

    FFA_ADD(*rL, c, b);
    FFA_SQR(*rL, *rL);
    FFA_ADD(tp, pL, pZ);
    FFA_MUL(tp, tp, d);
    FFA_ADD(*rL, *rL, tp);

    /* end */
    return;
}

#define ECA_ADD_MIX(RX,RL,RZ,PX,PL,PZ,QX,QL)\
    eca_add_mix(&RX##_00,&RX##_01,&RX##_02,&RL##_00,&RL##_01,&RL##_02,&RZ##_00,&RZ##_01,&RZ##_02,\
                PX##_00,PX##_01,PX##_02,PL##_00,PL##_01,PL##_02,PZ##_00,PZ##_01,PZ##_02,\
                QX##_00,QX##_01,QX##_02,QL##_00,QL##_01,QL##_02);

