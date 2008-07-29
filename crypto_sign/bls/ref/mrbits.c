/*
 *   MIRACL bit manipulation routines 
 *   mrbits.c
 *
 *   Copyright (c) 1988-2006 Shamus Software Ltd.
 */

#include <stdlib.h> 

extern "C" {

#include "miracl.h"

int logb2(_MIPD_ big x)
{ /* returns number of bits in x */
    int xl,lg2;
    mr_small top;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM || size(x)==0) return 0;

    MR_IN(49)


#ifndef MR_ALWAYS_BINARY
    if (mr_mip->base==mr_mip->base2)
    {
#endif
        xl=(int)(x->len&MR_OBITS);
        lg2=mr_mip->lg2b*(xl-1);
        top=x->w[xl-1];
        while (top>=1)
        {
            lg2++;
            top/=2;
        }

#ifndef MR_ALWAYS_BINARY
    }
    else 
    {
        copy(x,mr_mip->w0);
        insign(PLUS,mr_mip->w0);
        lg2=0;
        while (mr_mip->w0->len>1)
        {
#ifdef MR_FP_ROUNDING
            mr_sdiv(_MIPP_ mr_mip->w0,mr_mip->base2,mr_invert(mr_mip->base2),mr_mip->w0);
#else
            mr_sdiv(_MIPP_ mr_mip->w0,mr_mip->base2,mr_mip->w0);
#endif
            lg2+=mr_mip->lg2b;
        }

        while (mr_mip->w0->w[0]>=1)
        {
            lg2++;
            mr_mip->w0->w[0]/=2;
        }
    }
#endif
    MR_OUT
    return lg2;
}

void sftbit(_MIPD_ big x,int n,big z)
{ /* shift x by n bits */
    int m;
    mr_small sm;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    copy(x,z);
    if (n==0) return;

    MR_IN(47)

    m=mr_abs(n);
    sm=mr_shiftbits((mr_small)1,m%mr_mip->lg2b);
    if (n>0)
    { /* shift left */

#ifndef MR_ALWAYS_BINARY
        if (mr_mip->base==mr_mip->base2)
        {
#endif
            mr_shift(_MIPP_ z,n/mr_mip->lg2b,z);
            mr_pmul(_MIPP_ z,sm,z);
#ifndef MR_ALWAYS_BINARY
        }
        else
        {
            expb2(_MIPP_ m,mr_mip->w1);
            multiply(_MIPP_ z,mr_mip->w1,z);
        }
#endif
    }
    else
    { /* shift right */

#ifndef MR_ALWAYS_BINARY
        if (mr_mip->base==mr_mip->base2)
        {
#endif
            mr_shift(_MIPP_ z,n/mr_mip->lg2b,z);
#ifdef MR_FP_ROUNDING
            mr_sdiv(_MIPP_ z,sm,mr_invert(sm),z);
#else
            mr_sdiv(_MIPP_ z,sm,z);
#endif

#ifndef MR_ALWAYS_BINARY
        }
        else
        {
            expb2(_MIPP_ m,mr_mip->w1);
            divide(_MIPP_ z,mr_mip->w1,z);
        }
#endif
    }
    MR_OUT
}

void expb2(_MIPD_ int n,big x)
{ /* sets x=2^n */
    int r,p;
#ifndef MR_ALWAYS_BINARY
    int i;
#endif
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    convert(_MIPP_ 1,x);
    if (n==0) return;

    MR_IN(149)

    if (n<0)
    {
        mr_berror(_MIPP_ MR_ERR_NEG_POWER);
        MR_OUT
        return;
    }
    r=n/mr_mip->lg2b;
    p=n%mr_mip->lg2b;

#ifndef MR_ALWAYS_BINARY
    if (mr_mip->base==mr_mip->base2)
    {
#endif
        mr_shift(_MIPP_ x,r,x);
        x->w[x->len-1]=mr_shiftbits(x->w[x->len-1],p);
#ifndef MR_ALWAYS_BINARY
    }
    else
    {
        for (i=1;i<=r;i++)
            mr_pmul(_MIPP_ x,mr_mip->base2,x);
        mr_pmul(_MIPP_ x,mr_shiftbits((mr_small)1,p),x);
    }
#endif
    MR_OUT
}

void bigbits(_MIPD_ int n,big x)
{ /* sets x as random < 2^n */
    mr_small r;
    mr_unsign32 wlen;
#ifdef MR_FP
    mr_small dres;
#endif
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    zero(x);
    if (mr_mip->ERNUM || n<=0) return;
    
    MR_IN(150)

    expb2(_MIPP_ n,mr_mip->w1);
    wlen=mr_mip->w1->len;
    do
    {
        r=brand(_MIPPO_ );
        if (mr_mip->base==0) x->w[x->len++]=r;
        else                 x->w[x->len++]=MR_REMAIN(r,mr_mip->base);
    } while (x->len<wlen);
#ifndef MR_ALWAYS_BINARY
    if (mr_mip->base==mr_mip->base2)
    {
#endif

    x->w[wlen-1]=MR_REMAIN(x->w[wlen-1],mr_mip->w1->w[wlen-1]);
    mr_lzero(x);

#ifndef MR_ALWAYS_BINARY
    }
    else
    {
        divide(_MIPP_ x,mr_mip->w1,mr_mip->w1);
    }
#endif

    MR_OUT
}
}

