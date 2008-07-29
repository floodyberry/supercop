/*
 *   MIRACL random number routines 
 *   mrrand.c
 *
 *   Copyright (c) 1988-1997 Shamus Software Ltd.
 */

extern "C" {

#include "miracl.h"

void bigrand(_MIPD_ big w,big x)
{  /*  generate a big random number 0<=x<w  */
    int m;
    mr_small r;
#ifdef MR_FP
    mr_small dres;
#endif
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;

    MR_IN(20)

 /*   decr(_MIPP_ w,2,w);  */
    m=0;
    zero(mr_mip->w0);

    do
    { /* create big rand piece by piece */
        m++;
        mr_mip->w0->len=m;
        r=brand(_MIPPO_ );
        if (mr_mip->base==0) mr_mip->w0->w[m-1]=r;
        else                 mr_mip->w0->w[m-1]=MR_REMAIN(r,mr_mip->base);
    } while (compare(mr_mip->w0,w)<0);
    mr_lzero(mr_mip->w0);
    divide(_MIPP_ mr_mip->w0,w,w);

    copy(mr_mip->w0,x);
 /*   incr(_MIPP_ x,2,x);
    if (w!=x) incr(_MIPP_ w,2,w); */
    MR_OUT
}

void bigdig(_MIPD_ int n,int b,big x)
{ /* generate random number n digits long *
   * to "printable" base b                */
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;

    MR_IN(19)

    if (b<2 || b>256)
    {
        mr_berror(_MIPP_ MR_ERR_BASE_TOO_BIG);
        MR_OUT
        return;
    }

    do
    { /* repeat if x too small */
        expint(_MIPP_ b,n,mr_mip->w1);
        bigrand(_MIPP_ mr_mip->w1,x);
        subdiv(_MIPP_ mr_mip->w1,b,mr_mip->w1);
    } while (!mr_mip->ERNUM && compare(x,mr_mip->w1)<0);

    MR_OUT
}
}

