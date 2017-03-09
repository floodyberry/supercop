/*
 *   MIRACL Extended Greatest Common Divisor module.
 *   mrxgcd.c
 *
 *   Copyright (c) 1988-2001 Shamus Software Ltd.
 */

extern "C" {

#include "miracl.h"

#ifdef mr_dltype

static mr_small qdiv(mr_large u,mr_large v)
{ /* fast division - small quotient expected.  */
    mr_large lq,x=u;
#ifdef MR_FP
    mr_small dres;
#endif
    x-=v;
    if (x<v) return 1;
    x-=v;
    if (x<v) return 2;
    x-=v;
    if (x<v) return 3;
    x-=v;
    if (x<v) return 4;
    x-=v;
    if (x<v) return 5;
    x-=v;
    if (x<v) return 6;
    x-=v;
    if (x<v) return 7;
    x-=v;
    if (x<v) return 8;

/* do it the hard way! */

    lq=8+MR_DIV(x,v);
    if (lq>=MAXBASE) return 0;
    return (mr_small)lq;
}

#else

static mr_small qdiv(mr_small u,mr_small v)
{ /* fast division - small quotient expected */
    mr_small x=u;
    x-=v;
    if (x<v) return 1;
    x-=v;
    if (x<v) return 2;

    return MR_DIV(u,v);
}

#endif

int xgcd(_MIPD_ big x,big y,big xd,big yd,big z)
{ /* greatest common divisor by Euclids method  *
   * extended to also calculate xd and yd where *
   *      z = x.xd + y.yd = gcd(x,y)            *
   * if xd, yd not distinct, only xd calculated *
   * z only returned if distinct from xd and yd *
   * xd will always be positive, yd negative    */

    int s,n,iter;
    mr_small r,a,b,c,d;
    mr_small q,m,sr;
#ifdef MR_FP
    mr_small dres;
#endif

#ifdef mr_dltype
    union doubleword uu,vv;
    mr_large u,v,lr;
#else
    mr_small u,v,lr;
#endif

    BOOL last,dplus=TRUE;
    big t;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return 0;

    MR_IN(30)

    copy(x,mr_mip->w1);
    copy(y,mr_mip->w2);
    s=exsign(mr_mip->w1);
    insign(PLUS,mr_mip->w1);
    insign(PLUS,mr_mip->w2);
    convert(_MIPP_ 1,mr_mip->w3);
    zero(mr_mip->w4);
    last=FALSE;
    a=b=c=d=0;
    iter=0;

    while (size(mr_mip->w2)!=0)
    {
        if (b==0)
        { /* update mr_mip->w1 and mr_mip->w2 */
            divide(_MIPP_ mr_mip->w1,mr_mip->w2,mr_mip->w5);
            t=mr_mip->w1,mr_mip->w1=mr_mip->w2,mr_mip->w2=t;    /* swap(mr_mip->w1,mr_mip->w2) */
            multiply(_MIPP_ mr_mip->w4,mr_mip->w5,mr_mip->w0);
            add(_MIPP_ mr_mip->w3,mr_mip->w0,mr_mip->w3);
            t=mr_mip->w3,mr_mip->w3=mr_mip->w4,mr_mip->w4=t;    /* swap(xd,yd) */
            iter++;
        }
        else
        {

/*  printf("a= %d b= %d c= %d  d= %d \n",a,b,c,d);   */

            mr_pmul(_MIPP_ mr_mip->w1,c,mr_mip->w5);   /* c*w1 */
            mr_pmul(_MIPP_ mr_mip->w1,a,mr_mip->w1);   /* a*w1 */
            mr_pmul(_MIPP_ mr_mip->w2,b,mr_mip->w0);   /* b*w2 */
            mr_pmul(_MIPP_ mr_mip->w2,d,mr_mip->w2);   /* d*w2 */


            if (!dplus)
            {
                mr_psub(_MIPP_ mr_mip->w0,mr_mip->w1,mr_mip->w1); /* b*w2-a*w1 */
                mr_psub(_MIPP_ mr_mip->w5,mr_mip->w2,mr_mip->w2); /* c*w1-d*w2 */
            }
            else
            {
                mr_psub(_MIPP_ mr_mip->w1,mr_mip->w0,mr_mip->w1); /* a*w1-b*w2 */
                mr_psub(_MIPP_ mr_mip->w2,mr_mip->w5,mr_mip->w2); /* d*w2-c*w1 */
            }
            mr_pmul(_MIPP_ mr_mip->w3,c,mr_mip->w5);
            mr_pmul(_MIPP_ mr_mip->w3,a,mr_mip->w3);
            mr_pmul(_MIPP_ mr_mip->w4,b,mr_mip->w0);
            mr_pmul(_MIPP_ mr_mip->w4,d,mr_mip->w4);
    
            if (a==0) copy(mr_mip->w0,mr_mip->w3);
            else      mr_padd(_MIPP_ mr_mip->w3,mr_mip->w0,mr_mip->w3);
            mr_padd(_MIPP_ mr_mip->w4,mr_mip->w5,mr_mip->w4);
        }
        if (mr_mip->ERNUM || size(mr_mip->w2)==0) break;


        n=(int)mr_mip->w1->len;
        if (n==1)
        {
            last=TRUE;
            u=mr_mip->w1->w[0];
            v=mr_mip->w2->w[0];
        }
        else
        {
            m=mr_mip->w1->w[n-1]+1;
            if (mr_mip->base==0)
            {
#ifndef MR_NOFULLWIDTH
#ifdef mr_dltype
 /* use double length type if available */
                if (n>2 && m!=0)
                { /* squeeze out as much significance as possible */
                    uu.h[MR_TOP]=muldvm(mr_mip->w1->w[n-1],mr_mip->w1->w[n-2],m,&sr);
                    uu.h[MR_BOT]=muldvm(sr,mr_mip->w1->w[n-3],m,&sr);
                    vv.h[MR_TOP]=muldvm(mr_mip->w2->w[n-1],mr_mip->w2->w[n-2],m,&sr);
                    vv.h[MR_BOT]=muldvm(sr,mr_mip->w2->w[n-3],m,&sr);
                }
                else
                {
                    uu.h[MR_TOP]=mr_mip->w1->w[n-1];
                    uu.h[MR_BOT]=mr_mip->w1->w[n-2];
                    vv.h[MR_TOP]=mr_mip->w2->w[n-1];
                    vv.h[MR_BOT]=mr_mip->w2->w[n-2];
                    if (n==2) last=TRUE;
                }
                u=uu.d;
                v=vv.d;
#else
                if (m==0)
                {
                    u=mr_mip->w1->w[n-1];
                    v=mr_mip->w2->w[n-1];   
                }
                else
                {
                    u=muldvm(mr_mip->w1->w[n-1],mr_mip->w1->w[n-2],m,&sr);
                    v=muldvm(mr_mip->w2->w[n-1],mr_mip->w2->w[n-2],m,&sr);
                }
#endif
#endif
            }
            else
            {
#ifdef mr_dltype
                if (n>2)
                { /* squeeze out as much significance as possible */
                    u=muldiv(mr_mip->w1->w[n-1],mr_mip->base,mr_mip->w1->w[n-2],m,&sr);
                    u=u*mr_mip->base+muldiv(sr,mr_mip->base,mr_mip->w1->w[n-3],m,&sr);
                    v=muldiv(mr_mip->w2->w[n-1],mr_mip->base,mr_mip->w2->w[n-2],m,&sr);
                    v=v*mr_mip->base+muldiv(sr,mr_mip->base,mr_mip->w2->w[n-3],m,&sr);
                }
                else
                {
                    u=(mr_large)mr_mip->base*mr_mip->w1->w[n-1]+mr_mip->w1->w[n-2];
                    v=(mr_large)mr_mip->base*mr_mip->w2->w[n-1]+mr_mip->w2->w[n-2];
                    last=TRUE;
                }
#else
                u=muldiv(mr_mip->w1->w[n-1],mr_mip->base,mr_mip->w1->w[n-2],m,&sr);
                v=muldiv(mr_mip->w2->w[n-1],mr_mip->base,mr_mip->w2->w[n-2],m,&sr);
#endif
            }
        }

        dplus=TRUE;
        a=1; b=0; c=0; d=1;

        forever
        { /* work only with most significant piece */
            if (last)
            {
                if (v==0) break;
                q=qdiv(u,v);
                if (q==0) break;
            }
            else
            {
                if (dplus)
                { 
                    if (v-c==0 || v+d==0) break;
                    q=qdiv(u+a,v-c);
                    if (q==0) break;
                    if (q!=qdiv(u-b,v+d)) break;
                }
                else 
                {
                    if (v+c==0 || v-d==0) break;
                    q=qdiv(u-a,v+c);
                    if (q==0) break;
                    if (q!=qdiv(u+b,v-d)) break;
                }
            }

            if (q==1)
            {
                if (b+d >= MAXBASE) break; 
                r=a+c;  a=c; c=r;
                r=b+d;  b=d; d=r;
                lr=u-v; u=v; v=lr;      
            }
            else
            { 
                if (q>=MR_DIV(MAXBASE-b,d)) break;
                r=a+q*c;  a=c; c=r;
                r=b+q*d;  b=d; d=r;
                lr=u-q*v; u=v; v=lr;
            }
            iter++;
            dplus=!dplus;
        }
        iter%=2;
    }

    if (s==MINUS) iter++;
    if (iter%2==1) subtract(_MIPP_ y,mr_mip->w3,mr_mip->w3);

    if (xd!=yd)
    {
        negify(x,mr_mip->w2);
        mad(_MIPP_ mr_mip->w2,mr_mip->w3,mr_mip->w1,y,mr_mip->w4,mr_mip->w4);
        copy(mr_mip->w4,yd);
    }
    copy(mr_mip->w3,xd);
    if (z!=xd && z!=yd) copy(mr_mip->w1,z);

    MR_OUT
    return (size(mr_mip->w1));
}

/* Montgomery's method for multiple 
   simultaneous modular inversions */

BOOL double_inverse(_MIPD_ big n,big x,big y,big w,big z)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    MR_IN(146)

    mad(_MIPP_ x,w,w,n,n,mr_mip->w6);
    if (size(mr_mip->w6)==0)
    {
        mr_berror(_MIPP_ MR_ERR_DIV_BY_ZERO);
        MR_OUT
        return FALSE;
    }
    xgcd(_MIPP_ mr_mip->w6,n,mr_mip->w6,mr_mip->w6,mr_mip->w6);

    mad(_MIPP_ w,mr_mip->w6,w,n,n,y);
    mad(_MIPP_ x,mr_mip->w6,x,n,n,z);

    MR_OUT 
    return TRUE;   
}

BOOL multi_inverse(_MIPD_ int m,big *x,big n,big *w)
{ /* find w[i]=1/x[i] mod n, for i=0 to m-1 *
   * x and w MUST be distinct               */
    int i;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (m==0) return TRUE;
    if (m<0) return FALSE;

    MR_IN(25)

    if (x==w)
    {
        mr_berror(_MIPP_ MR_ERR_BAD_PARAMETERS);
        MR_OUT
        return FALSE;
    }
    if (m==1)
    {
        xgcd(_MIPP_ x[0],n,w[0],w[0],w[0]);
        MR_OUT
        return TRUE;
    }

    convert(_MIPP_ 1,w[0]);
    copy(x[0],w[1]);
    for (i=2;i<m;i++)
        mad(_MIPP_ w[i-1],x[i-1],x[i-1],n,n,w[i]); 

    mad(_MIPP_ w[m-1],x[m-1],x[m-1],n,n,mr_mip->w6);  /* y=x[0]*x[1]*x[2]....x[m-1] */
    if (size(mr_mip->w6)==0)
    {
        mr_berror(_MIPP_ MR_ERR_DIV_BY_ZERO);
        MR_OUT
        return FALSE;
    }

    xgcd(_MIPP_ mr_mip->w6,n,mr_mip->w6,mr_mip->w6,mr_mip->w6);

/* Now y=1/y */

    copy(x[m-1],mr_mip->w5);
    mad(_MIPP_ w[m-1],mr_mip->w6,mr_mip->w6,n,n,w[m-1]);

    for (i=m-2;;i--)
    {
        if (i==0)
        {
            mad(_MIPP_ mr_mip->w5,mr_mip->w6,mr_mip->w6,n,n,w[0]);
            break;
        }
        mad(_MIPP_ w[i],mr_mip->w5,w[i],n,n,w[i]);
        mad(_MIPP_ w[i],mr_mip->w6,w[i],n,n,w[i]);
        mad(_MIPP_ mr_mip->w5,x[i],x[i],n,n,mr_mip->w5);
    }

    MR_OUT 
    return TRUE;   
}
}

