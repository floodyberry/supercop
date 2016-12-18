/* elliptic curve point arithmetic */

/*
# y coordinate montgomery
R(x,y) <- mxy(P(X,Z),Q(X,Z),d(x,y))
where d = Q - P

< inp
[__m128i] pX_00, pX_01, pX_02 : point P X coordinate
[__m128i] pZ_00, pZ_01, pZ_02 : point P Z coordinate
[__m128i] qX_00, qX_01, qX_02 : point Q X coordinate
[__m128i] qZ_00, qZ_01, qZ_02 : point Q Z coordinate
[__m128i] dx_00, dx_01, dx_02 : point d x coordinate
[__m128i] dy_00, dy_01, dy_02 : point d y coordinate
> out
[__m128i] rx_00, rx_01, rx_02 : point R x coordinate
[__m128i] ry_00, ry_01, ry_02 : point R y coordinate
*/

void eca_mxy_mon(__m128i *rx_00, __m128i *rx_01, __m128i *rx_02,
                 __m128i *ry_00, __m128i *ry_01, __m128i *ry_02,
                 __m128i pX_00, __m128i pX_01, __m128i pX_02,
                 __m128i pZ_00, __m128i pZ_01, __m128i pZ_02,
                 __m128i qX_00, __m128i qX_01, __m128i qX_02,
                 __m128i qZ_00, __m128i qZ_01, __m128i qZ_02,
                 __m128i dx_00, __m128i dx_01, __m128i dx_02,
                 __m128i dy_00, __m128i dy_01, __m128i dy_02) {
    /* var */
    __m128i c_00, c_01, c_02;
    __m128i d_00, d_01, d_02;

    /* ini */
    FFA_MUL(c, qZ, pZ);

    FFA_MUL(pZ, pZ, dx);
    FFA_ADD(pZ, pZ, pX);
    FFA_MUL(qZ, qZ, dx);
    FFA_MUL(pX, qZ, pX);
    FFA_ADD(qZ, qZ, qX);
    FFA_MUL(qZ, qZ, pZ);

    FFA_SQR(d, dx);
    FFA_ADD(d, d, dy);
    FFA_MUL(d, d, c);
    FFA_ADD(d, d, qZ);
    FFA_MUL(c, c, dx);
    FFA_INV(c, c);
    FFA_MUL(d, d, c);

    /* man */
    FFA_MUL(*rx, pX, c);
    FFA_ADD(*ry, *rx, dx);
    FFA_MUL(*ry, *ry, d);
    FFA_ADD(*ry, *ry, dy);

    /* end */
    return;
}

#define ECA_MXY_MON(RX,RY,PX,PZ,QX,QZ,DX,DY)\
    eca_mxy_mon(&RX##_00,&RX##_01,&RX##_02,&RY##_00,&RY##_01,&RY##_02,\
                PX##_00,PX##_01,PX##_02,PZ##_00,PZ##_01,PZ##_02,\
                QX##_00,QX##_01,QX##_02,QZ##_00,QZ##_01,QZ##_02,\
                DX##_00,DX##_01,DX##_02,DY##_00,DY##_01,DY##_02);

/*
# point doubling montgomery
R(X,Z) <- 2*P(X,Z)

< inp
[__m128i] pX_00, pX_01, pX_02 : point P X coordinate
[__m128i] pZ_00, pZ_01, pZ_02 : point P Z coordinate
> out
[__m128i] rX_00, rX_01, rX_02 : point R X coordinate
[__m128i] rZ_00, rZ_01, rZ_02 : point R Z coordinate
*/

void eca_dbl_mon(__m128i *rX_00, __m128i *rX_01, __m128i *rX_02,
                 __m128i *rZ_00, __m128i *rZ_01, __m128i *rZ_02,
                 __m128i pX_00, __m128i pX_01, __m128i pX_02,
                 __m128i pZ_00, __m128i pZ_01, __m128i pZ_02) {
    /* var */
    __m128i tp_00, tp_01, tp_02;

    /* man */
    FFA_SQR(*rX, pX);
    FFA_SQR(*rZ, pZ);
    tp_00 = *rZ_00; tp_01 = *rZ_01; tp_02 = *rZ_02;
    FFA_MUL(*rZ, *rZ, *rX);
    FFA_ADD(*rX, *rX, tp);
    FFA_SQR(*rX, *rX);

    /* end */
    return;
}

#define ECA_DBL_MON(RX,RZ,PX,PZ)\
    eca_dbl_mon(&RX##_00,&RX##_01,&RX##_02,&RZ##_00,&RZ##_01,&RZ##_02,\
                PX##_00,PX##_01,PX##_02,PZ##_00,PZ##_01,PZ##_02);

/*
# point addition montgomery
R(X,Z) <- P(X,Z) + Q(X,Z);

< inp
[__m128i] pX_00, pX_01, pX_02 : point P X coordinate
[__m128i] pZ_00, pZ_01, pZ_02 : point P Z coordinate
[__m128i] qX_00, qX_01, qX_02 : point Q X coordinate
[__m128i] qZ_00, qZ_01, qZ_02 : point Q Z coordinate
[__m128i] dx_00, dx_01, dx_02 : point d x coordinate (P-Q difference)
> out
[__m128i] rX_00, rX_01, rX_02 : point R X coordinate
[__m128i] rZ_00, rZ_01, rZ_02 : point R Z coordinate
*/

void eca_add_mon(__m128i *rX_00, __m128i *rX_01, __m128i *rX_02,
                 __m128i *rZ_00, __m128i *rZ_01, __m128i *rZ_02,
                 __m128i pX_00, __m128i pX_01, __m128i pX_02,
                 __m128i pZ_00, __m128i pZ_01, __m128i pZ_02,
                 __m128i qX_00, __m128i qX_01, __m128i qX_02,
                 __m128i qZ_00, __m128i qZ_01, __m128i qZ_02,
                 __m128i dx_00, __m128i dx_01, __m128i dx_02) {
    /* var */
    __m128i tp_00, tp_01, tp_02;

    /* ini */
    FFA_MUL(*rX, pX, qZ);
    FFA_MUL(*rZ, qX, pZ);
    FFA_MUL(tp, *rX, *rZ);

    /* man */
    FFA_ADD(*rZ, *rX, *rZ);
    FFA_SQR(*rZ, *rZ);

    FFA_MUL(*rX, *rZ, dx);
    FFA_ADD(*rX, *rX, tp);

    /* end */
    return;
}

#define ECA_ADD_MON(RX,RZ,PX,PZ,QX,QZ,DX)\
    eca_add_mon(&RX##_00,&RX##_01,&RX##_02,&RZ##_00,&RZ##_01,&RZ##_02,\
                PX##_00,PX##_01,PX##_02,PZ##_00,PZ##_01,PZ##_02,\
                QX##_00,QX##_01,QX##_02,QZ##_00,QZ##_01,QZ##_02,\
                DX##_00,DX##_01,DX##_02);

