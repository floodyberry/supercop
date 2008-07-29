/*
 *   MIRACL elliptic curve routines
 *   mrcurve.c
 *
 *   Assumes Weierstrass equation y^2 = x^3 + Ax + B
 *   See IEEE P1363 Draft Standard 
 *
 *   Uses Montgomery's representation internally
 *
 *   Works particularly well with fixed length Comba multiplier
 *   e.g. #define MR_COMBA 5 for 5x32 = 160 bit modulus
 *        on 32-bit computer
 *
 *   Copyright (c) 1997-2005 Shamus Software Ltd.
 */

#include <stdlib.h> 

extern "C" {

#include "miracl.h"
#ifdef MR_STATIC
#include <string.h>
#endif

/* initialise elliptic curve */

void ecurve_init(_MIPD_ big a,big b,big p,int type)
{ /* Initialize the active ecurve    *
   * Asize indicate size of A        *
   * Bsize indicate size of B        */
    int as;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;

    MR_IN(93)

    mr_mip->SS=FALSE;       /* no special support for super-singular curves */ 

    prepare_monty(_MIPP_ p);

    mr_mip->Asize=size(a);
    if (mr_abs(mr_mip->Asize)==MR_TOOBIG)
    {
        if (mr_mip->Asize>=0)
        { /* big positive number - check it isn't minus something small */
           copy(a,mr_mip->w1);
           divide(_MIPP_ mr_mip->w1,p,p);
           subtract(_MIPP_ p,mr_mip->w1,mr_mip->w1);
           as=size(mr_mip->w1);
           if (as<MR_TOOBIG) mr_mip->Asize=-as;
           else
               nres(_MIPP_ a,mr_mip->A);
        }
        else
               nres(_MIPP_ a,mr_mip->A);
    }

    mr_mip->Bsize=size(b);
    if (mr_abs(mr_mip->Bsize)==MR_TOOBIG)
        nres(_MIPP_ b,mr_mip->B);
#ifndef MR_AFFINE_ONLY
    if (type==MR_BEST) mr_mip->coord=MR_PROJECTIVE;
    else mr_mip->coord=type;
#else
    if (type==MR_PROJECTIVE)
        mr_berror(_MIPP_ MR_ERR_NOT_SUPPORTED);
#endif

    MR_OUT
    return;
}

static void epoint_getrhs(_MIPD_ big x,big y)
{ /* x and y must be different */

  /* find x^3+Ax+B */
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    nres_modmult(_MIPP_ x,x,y);

    nres_modmult(_MIPP_ y,x,y);
    if (mr_abs(mr_mip->Asize)==MR_TOOBIG)
        nres_modmult(_MIPP_ x,mr_mip->A,mr_mip->w1);
    else
        nres_premult(_MIPP_ x,mr_mip->Asize,mr_mip->w1);
    nres_modadd(_MIPP_ y,mr_mip->w1,y);
    if (mr_abs(mr_mip->Bsize)==MR_TOOBIG)
        nres_modadd(_MIPP_ y,mr_mip->B,y);
    else
    {
        convert(_MIPP_ mr_mip->Bsize,mr_mip->w1);
        nres(_MIPP_ mr_mip->w1,mr_mip->w1);
        nres_modadd(_MIPP_ y,mr_mip->w1,y);
    }
}

#ifndef MR_NOSUPPORT_COMPRESSION

BOOL epoint_x(_MIPD_ big x)
{ /* test if x is associated with a point on the   *
   * currently active curve                        */
    int j;

#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return FALSE;

    MR_IN(147)
    
    if (x==NULL) return FALSE;

    nres(_MIPP_ x,mr_mip->w2);
    epoint_getrhs(_MIPP_ mr_mip->w2,mr_mip->w3);

    if (size(mr_mip->w3)==0)
    {
        MR_OUT
        return TRUE;
    }

    redc(_MIPP_ mr_mip->w3,mr_mip->w4);
    j=jack(_MIPP_ mr_mip->w4,mr_mip->modulus);

    MR_OUT
    if (j==1) return TRUE;
    return FALSE;
}

#endif

BOOL epoint_set(_MIPD_ big x,big y,int cb,epoint *p)
{ /* initialise a point on active ecurve            *
   * if x or y == NULL, set to point at infinity    *
   * if x==y, a y co-ordinate is calculated - if    *
   * possible - and cb suggests LSB 0/1  of y       *
   * (which "decompresses" y). Otherwise, check     *
   * validity of given (x,y) point, ignoring cb.    *
   * Returns TRUE for valid point, otherwise FALSE. */
  
    BOOL valid;

#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return FALSE;

    MR_IN(97)

    if (x==NULL || y==NULL)
    {
        convert(_MIPP_ 1,mr_mip->w1);
        nres(_MIPP_ mr_mip->w1,p->X);
        nres(_MIPP_ mr_mip->w1,p->Y);
        p->marker=MR_EPOINT_INFINITY;
        MR_OUT
        return TRUE;
    }

/* find x^3+Ax+B */

    nres(_MIPP_ x,p->X);

    epoint_getrhs(_MIPP_ p->X,mr_mip->w3);

    valid=FALSE;

    if (x!=y)
    { /* compare with y^2 */
        nres(_MIPP_ y,p->Y);
        nres_modmult(_MIPP_ p->Y,p->Y,mr_mip->w1);
        
        if (compare(mr_mip->w1,mr_mip->w3)==0) valid=TRUE;
    }
    else
    { /* no y supplied - calculate one. Find square root */
#ifndef MR_NOSUPPORT_COMPRESSION

        valid=nres_sqroot(_MIPP_ mr_mip->w3,p->Y);
    /* check LSB - have we got the right root? */
        redc(_MIPP_ p->Y,mr_mip->w1);
        if (remain(_MIPP_ mr_mip->w1,2)!=cb) 
            mr_psub(_MIPP_ mr_mip->modulus,p->Y,p->Y);

#else
    mr_berror(_MIPP_ MR_ERR_NOT_SUPPORTED);
    MR_OUT
    return FALSE;
#endif
    } 
    if (valid)
    {
        p->marker=MR_EPOINT_NORMALIZED;
        MR_OUT
        return TRUE;
    }

    MR_OUT
    return FALSE;
}

void epoint_getxyz(_MIPD_ epoint *p,big x,big y,big z)
{ /* get (x,y,z) coordinates */
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    MR_IN(143)
    convert(_MIPP_ 1,mr_mip->w1);
    if (p->marker==MR_EPOINT_INFINITY)
    {
#ifndef MR_AFFINE_ONLY
        if (mr_mip->coord==MR_AFFINE)
        { /* (0,1) or (0,0) = O */
#endif
            if (x!=NULL) zero(x);
            if (mr_mip->Bsize==0)
            {
                if (y!=NULL) copy(mr_mip->w1,y);
            }
            else
            {
                if (y!=NULL) zero(y);
            }
#ifndef MR_AFFINE_ONLY 
        }
        if (mr_mip->coord==MR_PROJECTIVE)
        { /* (1,1,0) = O */
            if (x!=NULL) copy(mr_mip->w1,x);
            if (y!=NULL) copy(mr_mip->w1,y);
        }
#endif
        if (z!=NULL) zero(z);
        MR_OUT
        return;
    }
    if (x!=NULL) redc(_MIPP_ p->X,x);
    if (y!=NULL) redc(_MIPP_ p->Y,y);
#ifndef MR_AFFINE_ONLY
    if (mr_mip->coord==MR_AFFINE)
    {
#endif
        if (z!=NULL) zero(z);
#ifndef MR_AFFINE_ONLY
    }

    if (mr_mip->coord==MR_PROJECTIVE)
    {
        if (z!=NULL) 
        {
            if (p->marker!=MR_EPOINT_GENERAL) redc(_MIPP_ mr_mip->w1,z);
            else redc(_MIPP_ p->Z,z);
        }
    }
#endif
    MR_OUT
    return;
}

int epoint_get(_MIPD_ epoint* p,big x,big y)
{ /* Get point co-ordinates in affine, normal form       *
   * (converted from projective, Montgomery form)        *
   * if x==y, supplies x only. Return value is Least     *
   * Significant Bit of y (useful for point compression) */

    int lsb;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    if (p->marker==MR_EPOINT_INFINITY)
    {
        zero(x);
        zero(y);
        return 0;
    }
    if (mr_mip->ERNUM) return 0;

    MR_IN(98)

    if (!epoint_norm(_MIPP_ p)) 
    { /* not possible ! */
        MR_OUT
        return (-1);
    }

    redc(_MIPP_ p->X,x);
    redc(_MIPP_ p->Y,mr_mip->w1);

    if (x!=y) copy(mr_mip->w1,y);
    lsb=remain(_MIPP_ mr_mip->w1,2); 
    MR_OUT
    return lsb;
}

BOOL epoint_norm(_MIPD_ epoint *p)
{ /* normalise a point */
    
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

#ifndef MR_AFFINE_ONLY

    if (mr_mip->coord==MR_AFFINE) return TRUE;
    if (p->marker!=MR_EPOINT_GENERAL) return TRUE;

    if (mr_mip->ERNUM) return FALSE;

    MR_IN(117)

    convert(_MIPP_ 1,mr_mip->w8);
    nres(_MIPP_ mr_mip->w8,mr_mip->w8);  

    if (nres_moddiv(_MIPP_ mr_mip->w8,p->Z,mr_mip->w8)>1) /* 1/Z  */
    {
        epoint_set(_MIPP_ NULL,NULL,0,p);
        mr_berror(_MIPP_ MR_ERR_COMPOSITE_MODULUS); 
        MR_OUT
        return FALSE;
    }
    
    nres_modmult(_MIPP_ mr_mip->w8,mr_mip->w8,mr_mip->w1);/* 1/ZZ */
    nres_modmult(_MIPP_ p->X,mr_mip->w1,p->X);            /* X/ZZ */
    nres_modmult(_MIPP_ mr_mip->w1,mr_mip->w8,mr_mip->w1);/* 1/ZZZ */
    nres_modmult(_MIPP_ p->Y,mr_mip->w1,p->Y);            /* Y/ZZZ */

    convert(_MIPP_ 1,mr_mip->w8);
    nres(_MIPP_ mr_mip->w8,p->Z);
   
    p->marker=MR_EPOINT_NORMALIZED;
    MR_OUT

#endif

    return TRUE;
}

/* adds b+=a, d+=c, and slopes in s1 and s2 */

void ecurve_double_add(_MIPD_ epoint *a,epoint*b,epoint *c,epoint *d,big *s1,big *s2)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;    

    MR_IN(144);

#ifndef MR_AFFINE_ONLY

    if (mr_mip->coord==MR_AFFINE)
    {
#endif
        if (a->marker==MR_EPOINT_INFINITY || size(a->Y)==0)
        {
            *s1=NULL;
            *s2=ecurve_add(_MIPP_ c,d);
            MR_OUT
            return;
        }
        if (b->marker==MR_EPOINT_INFINITY || size(b->Y)==0)
        {
            *s1=NULL;
            epoint_copy(a,b);
            *s2=ecurve_add(_MIPP_ c,d);
            MR_OUT
            return;
        }
        if (c->marker==MR_EPOINT_INFINITY || size(c->Y)==0)
        {
            *s1=ecurve_add(_MIPP_ a,b);
            *s2=NULL;
            MR_OUT
            return;
        }
        if (d->marker==MR_EPOINT_INFINITY || size(d->Y)==0)
        {
            epoint_copy(c,d);
            *s1=ecurve_add(_MIPP_ a,b);
            *s2=NULL;
            MR_OUT
            return;
        }

        if (a==b || (compare(a->X,b->X)==0 && compare(a->Y,b->Y)==0))
        {
            nres_modmult(_MIPP_ a->X,a->X,mr_mip->w8);
            nres_premult(_MIPP_ mr_mip->w8,3,mr_mip->w8); /* 3x^2 */
            if (mr_abs(mr_mip->Asize)==MR_TOOBIG)
                nres_modadd(_MIPP_ mr_mip->w8,mr_mip->A,mr_mip->w8);
            else
            {
                convert(_MIPP_ mr_mip->Asize,mr_mip->w2);
                nres(_MIPP_ mr_mip->w2,mr_mip->w2);
                nres_modadd(_MIPP_ mr_mip->w8,mr_mip->w2,mr_mip->w8);
            }
            nres_premult(_MIPP_ a->Y,2,mr_mip->w10);
        }
        else
        {
            if (compare(a->X,b->X)==0)
            {
                epoint_set(_MIPP_ NULL,NULL,0,b);
                *s1=NULL;
                *s2=ecurve_add(_MIPP_ c,d);
                MR_OUT
                return;
            }
            nres_modsub(_MIPP_ a->Y,b->Y,mr_mip->w8);
            nres_modsub(_MIPP_ a->X,b->X,mr_mip->w10);
        }

        if (c==d || (compare(c->X,d->X)==0 && compare(c->Y,d->Y)==0))
        {
            nres_modmult(_MIPP_ c->X,c->X,mr_mip->w9);
            nres_premult(_MIPP_ mr_mip->w9,3,mr_mip->w9); /* 3x^2 */
            if (mr_abs(mr_mip->Asize)==MR_TOOBIG)
                nres_modadd(_MIPP_ mr_mip->w9,mr_mip->A,mr_mip->w9);
            else
            {
                convert(_MIPP_ mr_mip->Asize,mr_mip->w2);
                nres(_MIPP_ mr_mip->w2,mr_mip->w2);
                nres_modadd(_MIPP_ mr_mip->w9,mr_mip->w2,mr_mip->w9);
            }
            nres_premult(_MIPP_ c->Y,2,mr_mip->w11);
        }
        else
        {
            if (compare(c->X,d->X)==0)
            {
                epoint_set(_MIPP_ NULL,NULL,0,d);
                *s2=NULL;
                *s1=ecurve_add(_MIPP_ a,b);
                MR_OUT
                return;
            }
            nres_modsub(_MIPP_ c->Y,d->Y,mr_mip->w9);
            nres_modsub(_MIPP_ c->X,d->X,mr_mip->w11);
        }

        nres_double_inverse(_MIPP_ mr_mip->w10,mr_mip->w10,mr_mip->w11,mr_mip->w11);
        nres_modmult(_MIPP_ mr_mip->w8,mr_mip->w10,mr_mip->w8);
        nres_modmult(_MIPP_ mr_mip->w9,mr_mip->w11,mr_mip->w9);

        nres_modmult(_MIPP_ mr_mip->w8,mr_mip->w8,mr_mip->w2); /* m^2 */
        nres_modsub(_MIPP_ mr_mip->w2,a->X,mr_mip->w1);
        nres_modsub(_MIPP_ mr_mip->w1,b->X,mr_mip->w1);

        nres_modsub(_MIPP_ b->X,mr_mip->w1,mr_mip->w2);
        nres_modmult(_MIPP_ mr_mip->w2,mr_mip->w8,mr_mip->w2);
        nres_modsub(_MIPP_ mr_mip->w2,b->Y,b->Y);
        copy(mr_mip->w1,b->X);
        b->marker=MR_EPOINT_GENERAL;

        nres_modmult(_MIPP_ mr_mip->w9,mr_mip->w9,mr_mip->w2); /* m^2 */
        nres_modsub(_MIPP_ mr_mip->w2,c->X,mr_mip->w1);
        nres_modsub(_MIPP_ mr_mip->w1,d->X,mr_mip->w1);

        nres_modsub(_MIPP_ d->X,mr_mip->w1,mr_mip->w2);
        nres_modmult(_MIPP_ mr_mip->w2,mr_mip->w9,mr_mip->w2);
        nres_modsub(_MIPP_ mr_mip->w2,d->Y,d->Y);
        copy(mr_mip->w1,d->X);
        d->marker=MR_EPOINT_GENERAL;

        *s1=mr_mip->w8;
        *s2=mr_mip->w9;
#ifndef MR_AFFINE_ONLY
    }
    else
    { /* no speed-up */
        ecurve_add(_MIPP_ a,b);
        copy(mr_mip->w8,mr_mip->w9);
        *s1=mr_mip->w9;
        *s2=ecurve_add(_MIPP_ c,d);
    }
#endif
    MR_OUT
}

#ifndef MR_STATIC

void ecurve_multi_add(_MIPD_ int m,epoint **x,epoint**w)
{ /* adds m points together simultaneously, w[i]+=x[i] */
    int i,*flag;
    big *A,*B,*C;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;    

    MR_IN(122)
#ifndef MR_AFFINE_ONLY
    if (mr_mip->coord==MR_AFFINE)
    { /* this can be done faster */
#endif
        A=(big *)mr_alloc(_MIPP_ m,sizeof(big));
        B=(big *)mr_alloc(_MIPP_ m,sizeof(big));
        C=(big *)mr_alloc(_MIPP_ m,sizeof(big));
        flag=(int *)mr_alloc(_MIPP_ m,sizeof(int));

        convert(_MIPP_ 1,mr_mip->w3);
        nres(_MIPP_ mr_mip->w3,mr_mip->w3);    /* unity */
      
        for (i=0;i<m;i++)
        {
            A[i]=mirvar(_MIPP_ 0);
            B[i]=mirvar(_MIPP_ 0);
            C[i]=mirvar(_MIPP_ 0);
            flag[i]=0;
            if (compare(x[i]->X,w[i]->X)==0 && compare(x[i]->Y,w[i]->Y)==0) 
            { /* doubling */
                if (x[i]->marker==MR_EPOINT_INFINITY || size(x[i]->Y)==0)
                {
                    flag[i]=1;       /* result is infinity */
                    copy(mr_mip->w3,B[i]);
                    continue;    
                }
                nres_modmult(_MIPP_ x[i]->X,x[i]->X,A[i]);
                nres_premult(_MIPP_ A[i],3,A[i]);  /* 3*x^2 */
                if (mr_abs(mr_mip->Asize) == MR_TOOBIG)
                    nres_modadd(_MIPP_ A[i],mr_mip->A,A[i]);
                else
                {
                    convert(_MIPP_ mr_mip->Asize,mr_mip->w2);
                    nres(_MIPP_ mr_mip->w2,mr_mip->w2);
                    nres_modadd(_MIPP_ A[i],mr_mip->w2,A[i]);
                }                                       /* 3*x^2+A */
                nres_premult(_MIPP_ x[i]->Y,2,B[i]);
            }
            else
            {
                if (x[i]->marker==MR_EPOINT_INFINITY)
                {
                    flag[i]=2;              /* w[i] unchanged */
                    copy(mr_mip->w3,B[i]);
                    continue;
                }
                if (w[i]->marker==MR_EPOINT_INFINITY)
                {
                    flag[i]=3;              /* w[i] = x[i] */
                    copy(mr_mip->w3,B[i]);
                    continue;
                }
                nres_modsub(_MIPP_ x[i]->X,w[i]->X,B[i]);
                if (size(B[i])==0)
                { /* point at infinity */
                    flag[i]=1;       /* result is infinity */
                    copy(mr_mip->w3,B[i]);
                    continue;    
                }
                nres_modsub(_MIPP_ x[i]->Y,w[i]->Y,A[i]);
            }   
        }
        nres_multi_inverse(_MIPP_ m,B,C);  /* only one inversion needed */
        for (i=0;i<m;i++)
        {
            if (flag[i]==1)
            { /* point at infinity */
                epoint_set(_MIPP_ NULL,NULL,0,w[i]);
                continue;
            }
            if (flag[i]==2)
            {
                continue;
            }
            if (flag[i]==3)
            {
                epoint_copy(x[i],w[i]);
                continue;
            }
            nres_modmult(_MIPP_ A[i],C[i],mr_mip->w8);

            nres_modmult(_MIPP_ mr_mip->w8,mr_mip->w8,mr_mip->w2); /* m^2 */
            nres_modsub(_MIPP_ mr_mip->w2,x[i]->X,mr_mip->w1);
            nres_modsub(_MIPP_ mr_mip->w1,w[i]->X,mr_mip->w1);
       
            nres_modsub(_MIPP_ w[i]->X,mr_mip->w1,mr_mip->w2);
            nres_modmult(_MIPP_ mr_mip->w2,mr_mip->w8,mr_mip->w2);
            nres_modsub(_MIPP_ mr_mip->w2,w[i]->Y,w[i]->Y);
            copy(mr_mip->w1,w[i]->X);
            w[i]->marker=MR_EPOINT_NORMALIZED;

            mr_free(C[i]);
            mr_free(B[i]);
            mr_free(A[i]);
        }
        mr_free(flag);
        mr_free(C); mr_free(B); mr_free(A);
#ifndef MR_AFFINE_ONLY
    }
    else
    { /* no speed-up */
        for (i=0;i<m;i++) ecurve_add(_MIPP_ x[i],w[i]);
    }
#endif
    MR_OUT  
}

#endif

void ecurve_double(_MIPD_ epoint *p)
{ /* double epoint on active ecurve */

#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;

    if (p->marker==MR_EPOINT_INFINITY) 
    { /* 2 times infinity == infinity ! */
        return;
    }

#ifndef MR_AFFINE_ONLY
    if (mr_mip->coord==MR_AFFINE)
    { /* 2 sqrs, 1 mul, 1 div */
#endif
        if (size(p->Y)==0) 
        { /* set to point at infinity */
            epoint_set(_MIPP_ NULL,NULL,0,p);
            return;
        }
 
        nres_modmult(_MIPP_ p->X,p->X,mr_mip->w8);    /* w8=x^2   */
        nres_premult(_MIPP_ mr_mip->w8,3,mr_mip->w8); /* w8=3*x^2 */
        if (mr_abs(mr_mip->Asize) == MR_TOOBIG)
            nres_modadd(_MIPP_ mr_mip->w8,mr_mip->A,mr_mip->w8);
        else
        {
            convert(_MIPP_ mr_mip->Asize,mr_mip->w2);
            nres(_MIPP_ mr_mip->w2,mr_mip->w2);
            nres_modadd(_MIPP_ mr_mip->w8,mr_mip->w2,mr_mip->w8);
        }                                     /* w8=3*x^2+A */
        nres_premult(_MIPP_ p->Y,2,mr_mip->w6);      /* w6=2y */
        if (nres_moddiv(_MIPP_ mr_mip->w8,mr_mip->w6,mr_mip->w8)>1) 
        {
            epoint_set(_MIPP_ NULL,NULL,0,p);
            mr_berror(_MIPP_ MR_ERR_COMPOSITE_MODULUS); 
            return;
        }

/* w8 is slope m on exit */

        nres_modmult(_MIPP_ mr_mip->w8,mr_mip->w8,mr_mip->w2); /* w2=m^2 */
        nres_premult(_MIPP_ p->X,2,mr_mip->w1);
        nres_modsub(_MIPP_ mr_mip->w2,mr_mip->w1,mr_mip->w1); /* w1=m^2-2x */
        
        nres_modsub(_MIPP_ p->X,mr_mip->w1,mr_mip->w2);
        nres_modmult(_MIPP_ mr_mip->w2,mr_mip->w8,mr_mip->w2);
        nres_modsub(_MIPP_ mr_mip->w2,p->Y,p->Y);
        copy(mr_mip->w1,p->X);
        
        return;    
#ifndef MR_AFFINE_ONLY
    }

    if (size(p->Y)==0)
    { /* set to point at infinity */
        epoint_set(_MIPP_ NULL,NULL,0,p);
        return;
    }
 
    convert(_MIPP_ 1,mr_mip->w1);
    if (mr_abs(mr_mip->Asize) < MR_TOOBIG)
    {
        if (mr_mip->Asize!=0)
        {
            if (p->marker==MR_EPOINT_NORMALIZED) nres(_MIPP_ mr_mip->w1,mr_mip->w2);
            else nres_modmult(_MIPP_ p->Z,p->Z,mr_mip->w2);
        }
        if (mr_mip->Asize==(-3))
        { /* a is -3. Goody. 4 sqrs, 4 muls */
            nres_modsub(_MIPP_ p->X,mr_mip->w2,mr_mip->w3);
            nres_modadd(_MIPP_ p->X,mr_mip->w2,mr_mip->w8);
            nres_modmult(_MIPP_ mr_mip->w3,mr_mip->w8,mr_mip->w3);
            nres_modadd(_MIPP_ mr_mip->w3,mr_mip->w3,mr_mip->w8);
            nres_modadd(_MIPP_ mr_mip->w8,mr_mip->w3,mr_mip->w8);
        }
        else
        { /* a is small */
            if (mr_mip->Asize!=0)
            { /* a is non zero! */
                nres_modmult(_MIPP_ mr_mip->w2,mr_mip->w2,mr_mip->w3);
                nres_premult(_MIPP_ mr_mip->w3,mr_mip->Asize,mr_mip->w3);
            }
            nres_modmult(_MIPP_ p->X,p->X,mr_mip->w1);
            nres_modadd(_MIPP_ mr_mip->w1,mr_mip->w1,mr_mip->w8);
            nres_modadd(_MIPP_ mr_mip->w8,mr_mip->w1,mr_mip->w8);
            if (mr_mip->Asize!=0) nres_modadd(_MIPP_ mr_mip->w8,mr_mip->w3,mr_mip->w8);
        }
    }
    else
    { /* a is not special */
        if (p->marker==MR_EPOINT_NORMALIZED) nres(_MIPP_ mr_mip->w1,mr_mip->w2);
        else nres_modmult(_MIPP_ p->Z,p->Z,mr_mip->w2);

        nres_modmult(_MIPP_ mr_mip->w2,mr_mip->w2,mr_mip->w3);
        nres_modmult(_MIPP_ mr_mip->w3,mr_mip->A,mr_mip->w3);
        nres_modmult(_MIPP_ p->X,p->X,mr_mip->w1);
        nres_modadd(_MIPP_ mr_mip->w1,mr_mip->w1,mr_mip->w8);
        nres_modadd(_MIPP_ mr_mip->w8,mr_mip->w1,mr_mip->w8);
        nres_modadd(_MIPP_ mr_mip->w8,mr_mip->w3,mr_mip->w8);        
    }

/* w8 contains numerator of slope 3x^2+A.z^4  *
 * denominator is now placed in Z             */

    nres_modadd(_MIPP_ p->Y,p->Y,mr_mip->w2);  /* new - w2=2*Y */

    if (p->marker==MR_EPOINT_NORMALIZED)
        copy(mr_mip->w2,p->Z);

    else nres_modmult(_MIPP_ mr_mip->w2,p->Z,p->Z);

    nres_modmult(_MIPP_ mr_mip->w2,mr_mip->w2,mr_mip->w2);  /* new */
    nres_modmult(_MIPP_ p->X,mr_mip->w2,mr_mip->w3);
    nres_modadd(_MIPP_ mr_mip->w3,mr_mip->w3,p->X);
    nres_modmult(_MIPP_ mr_mip->w8,mr_mip->w8,mr_mip->w1);
    nres_modsub(_MIPP_ mr_mip->w1,p->X,p->X);
    nres_modmult(_MIPP_ mr_mip->w2,mr_mip->w2,mr_mip->w2);

/* divide by 2 - new */

    if (remain(_MIPP_ mr_mip->w2,2)!=0)
        mr_padd(_MIPP_ mr_mip->w2,mr_mip->modulus,mr_mip->w2);
    subdiv(_MIPP_ mr_mip->w2,2,mr_mip->w2);

    nres_modsub(_MIPP_ mr_mip->w3,p->X,mr_mip->w3);
    nres_modmult(_MIPP_ mr_mip->w3,mr_mip->w8,mr_mip->w3);
    nres_modsub(_MIPP_ mr_mip->w3,mr_mip->w2,p->Y);

    p->marker=MR_EPOINT_GENERAL;
    return;
#endif
}
   
static BOOL ecurve_padd(_MIPD_ epoint *p,epoint *pa)
{ /* primitive add two epoints on the active ecurve - pa+=p;   *
   * note that if p is normalized, its Z coordinate isn't used */
 
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
#ifndef MR_AFFINE_ONLY
    if (mr_mip->coord==MR_AFFINE)
    {  /* 1 sqr, 1 mul, 1 div */
#endif
        nres_modsub(_MIPP_ p->Y,pa->Y,mr_mip->w8);
        nres_modsub(_MIPP_ p->X,pa->X,mr_mip->w6);
        if (size(mr_mip->w6)==0) 
        { /* divide by 0 */
            if (size(mr_mip->w8)==0) 
            { /* should have doubled ! */
                return FALSE; 
            }
            else
            { /* point at infinity */
                epoint_set(_MIPP_ NULL,NULL,0,pa);
                return TRUE;
            }
        }
        if (nres_moddiv(_MIPP_ mr_mip->w8,mr_mip->w6,mr_mip->w8)>1)
        {
            epoint_set(_MIPP_ NULL,NULL,0,pa);
            mr_berror(_MIPP_ MR_ERR_COMPOSITE_MODULUS);
            return TRUE;
        }

        nres_modmult(_MIPP_ mr_mip->w8,mr_mip->w8,mr_mip->w2); /* w2=m^2 */
        nres_modsub(_MIPP_ mr_mip->w2,p->X,mr_mip->w1); /* w1=m^2-x1-x2 */
        nres_modsub(_MIPP_ mr_mip->w1,pa->X,mr_mip->w1);
        

        nres_modsub(_MIPP_ pa->X,mr_mip->w1,mr_mip->w2);
        nres_modmult(_MIPP_ mr_mip->w2,mr_mip->w8,mr_mip->w2);
        nres_modsub(_MIPP_ mr_mip->w2,pa->Y,pa->Y);
        copy(mr_mip->w1,pa->X);

        pa->marker=MR_EPOINT_NORMALIZED;
        return TRUE;
#ifndef MR_AFFINE_ONLY
    }

    if (p->marker!=MR_EPOINT_NORMALIZED)    
    {
        nres_modmult(_MIPP_ p->Z,p->Z,mr_mip->w6);
        nres_modmult(_MIPP_ pa->X,mr_mip->w6,mr_mip->w1);
        nres_modmult(_MIPP_ mr_mip->w6,p->Z,mr_mip->w6);
        nres_modmult(_MIPP_ pa->Y,mr_mip->w6,mr_mip->w8);
    }
    else
    {
        copy(pa->X,mr_mip->w1);
        copy(pa->Y,mr_mip->w8);
    }
    if (pa->marker==MR_EPOINT_NORMALIZED)
    {
        convert(_MIPP_ 1,mr_mip->w6);
        nres(_MIPP_ mr_mip->w6,mr_mip->w6);
    }
    else nres_modmult(_MIPP_ pa->Z,pa->Z,mr_mip->w6);
    nres_modmult(_MIPP_ p->X,mr_mip->w6,mr_mip->w4);
    if (pa->marker!=MR_EPOINT_NORMALIZED) 
        nres_modmult(_MIPP_ mr_mip->w6,pa->Z,mr_mip->w6);
    nres_modmult(_MIPP_ p->Y,mr_mip->w6,mr_mip->w5);
    nres_modsub(_MIPP_ mr_mip->w1,mr_mip->w4,mr_mip->w1);
    nres_modsub(_MIPP_ mr_mip->w8,mr_mip->w5,mr_mip->w8);

/* w8 contains the numerator of the slope */

    if (size(mr_mip->w1)==0)
    {
        if (size(mr_mip->w8)==0)
        { /* should have doubled ! */
           return FALSE; 
        }
        else
        { /* point at infinity */
            epoint_set(_MIPP_ NULL,NULL,0,pa);
            return TRUE;
        }
    }
    nres_modadd(_MIPP_ mr_mip->w4,mr_mip->w4,mr_mip->w6);
    nres_modadd(_MIPP_ mr_mip->w1,mr_mip->w6,mr_mip->w4);
    nres_modadd(_MIPP_ mr_mip->w5,mr_mip->w5,mr_mip->w6);
    nres_modadd(_MIPP_ mr_mip->w8,mr_mip->w6,mr_mip->w5);
    
    if (p->marker!=MR_EPOINT_NORMALIZED)
    { 
        if (pa->marker!=MR_EPOINT_NORMALIZED) 
            nres_modmult(_MIPP_ pa->Z,p->Z,mr_mip->w3);
        else
            copy(p->Z,mr_mip->w3);
        nres_modmult(_MIPP_ mr_mip->w3,mr_mip->w1,pa->Z);
    }
    else
    {
        if (pa->marker!=MR_EPOINT_NORMALIZED)
            nres_modmult(_MIPP_ pa->Z,mr_mip->w1,pa->Z);
        else
            copy(mr_mip->w1,pa->Z);
    }
    nres_modmult(_MIPP_ mr_mip->w1,mr_mip->w1,mr_mip->w6);
    nres_modmult(_MIPP_ mr_mip->w1,mr_mip->w6,mr_mip->w1);
    nres_modmult(_MIPP_ mr_mip->w6,mr_mip->w4,mr_mip->w6);
    nres_modmult(_MIPP_ mr_mip->w8,mr_mip->w8,mr_mip->w4);

    nres_modsub(_MIPP_ mr_mip->w4,mr_mip->w6,pa->X);
    nres_modsub(_MIPP_ mr_mip->w6,pa->X,mr_mip->w6);
    nres_modsub(_MIPP_ mr_mip->w6,pa->X,mr_mip->w6);
    nres_modmult(_MIPP_ mr_mip->w8,mr_mip->w6,mr_mip->w2);
    nres_modmult(_MIPP_ mr_mip->w1,mr_mip->w5,mr_mip->w1);
    nres_modsub(_MIPP_ mr_mip->w2,mr_mip->w1,mr_mip->w5);

/* divide by 2 */

    if (remain(_MIPP_ mr_mip->w5,2)!=0)
        mr_padd(_MIPP_ mr_mip->w5,mr_mip->modulus,mr_mip->w5);
    subdiv(_MIPP_ mr_mip->w5,2,mr_mip->w5);
    copy(mr_mip->w5,pa->Y);
    pa->marker=MR_EPOINT_GENERAL;
    return TRUE;      
#endif
}

void epoint_copy(epoint *a,epoint *b)
{   
    if (a==b || b==NULL) return;

    copy(a->X,b->X);
    copy(a->Y,b->Y);
#ifndef MR_AFFINE_ONLY
    if (a->marker==MR_EPOINT_GENERAL) copy(a->Z,b->Z);
#endif
    b->marker=a->marker;
    return;
}

BOOL epoint_comp(_MIPD_ epoint *a,epoint *b)
{
    BOOL result;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return FALSE;
    if (a==b) return TRUE;
    if (a->marker==MR_EPOINT_INFINITY)
    {
        if (b->marker==MR_EPOINT_INFINITY) return TRUE;
        else return FALSE;
    }
    if (b->marker==MR_EPOINT_INFINITY)
        return FALSE;
    
#ifndef MR_AFFINE_ONLY
    if (mr_mip->coord==MR_AFFINE)
    {
#endif
        if (compare(a->X,b->X)==0 && compare(a->Y,b->Y)==0) result=TRUE;
        else result=FALSE;
        return result;
#ifndef MR_AFFINE_ONLY
    }

    if (mr_mip->coord==MR_PROJECTIVE)
    {
        MR_IN(105)
        if (a->marker!=MR_EPOINT_GENERAL) 
        {
            convert(_MIPP_ 1,mr_mip->w1);
            nres(_MIPP_ mr_mip->w1,mr_mip->w1);
        }
        else copy(a->Z,mr_mip->w1);

        if (b->marker!=MR_EPOINT_GENERAL) 
        {
            convert(_MIPP_ 1,mr_mip->w2);
            nres(_MIPP_ mr_mip->w2,mr_mip->w2);
        }
        else copy(b->Z,mr_mip->w2);

        nres_modmult(_MIPP_ mr_mip->w1,mr_mip->w1,mr_mip->w3); /* Za*Za */
        nres_modmult(_MIPP_ mr_mip->w2,mr_mip->w2,mr_mip->w4); /* Zb*Zb */

        nres_modmult(_MIPP_ a->X,mr_mip->w4,mr_mip->w5); /* Xa*Zb*Zb */
        nres_modmult(_MIPP_ b->X,mr_mip->w3,mr_mip->w6); /* Xb*Za*Za */

        if (compare(mr_mip->w5,mr_mip->w6)!=0) result=FALSE;
        else
        {
            nres_modmult(_MIPP_ mr_mip->w1,mr_mip->w3,mr_mip->w3);
            nres_modmult(_MIPP_ mr_mip->w2,mr_mip->w4,mr_mip->w4);

            nres_modmult(_MIPP_ a->Y,mr_mip->w4,mr_mip->w5);
            nres_modmult(_MIPP_ b->Y,mr_mip->w3,mr_mip->w6);

            if (compare(mr_mip->w5,mr_mip->w6)!=0) result=FALSE;
            else result=TRUE;
        }
        MR_OUT
        return result;
    }
    return FALSE;
#endif
}

big ecurve_add(_MIPD_ epoint *p,epoint *pa)
{  /* pa=pa+p; */
   /* An ephemeral pointer to the line slope is returned */

#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return NULL;

    MR_IN(94)

    if (p==pa) 
    {
        ecurve_double(_MIPP_ pa);
        MR_OUT
        if (pa->marker==MR_EPOINT_INFINITY) return NULL;
        return mr_mip->w8;
    }
    if (pa->marker==MR_EPOINT_INFINITY)
    {
        epoint_copy(p,pa);
        MR_OUT 
        return NULL;
    }
    if (p->marker==MR_EPOINT_INFINITY) 
    {
        MR_OUT
        return NULL;
    }

    if (!ecurve_padd(_MIPP_ p,pa)) ecurve_double(_MIPP_ pa);
    MR_OUT

    if (pa->marker==MR_EPOINT_INFINITY) return NULL;
    return mr_mip->w8;
}

void epoint_negate(_MIPD_ epoint *p)
{ /* negate a point */
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    if (p->marker==MR_EPOINT_INFINITY) return;

    MR_IN(121)
    if (size(p->Y)!=0) mr_psub(_MIPP_ mr_mip->modulus,p->Y,p->Y);
    MR_OUT
}

big ecurve_sub(_MIPD_ epoint *p,epoint *pa)
{
    big r;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return NULL;

    MR_IN(104)

    if (p==pa)
    {
        epoint_set(_MIPP_ NULL,NULL,0,pa);
        MR_OUT
        return NULL;
    } 
    if (p->marker==MR_EPOINT_INFINITY) 
    {
        MR_OUT
        return NULL;
    }

    epoint_negate(_MIPP_ p);
    r=ecurve_add(_MIPP_ p,pa);
    epoint_negate(_MIPP_ p);

    MR_OUT
    return r;
}

void ecurve_mult(_MIPD_ big e,epoint *pa,epoint *pt)
{ /* pt=e*pa; */
    int i,j,n,nb,nbs,nzs;
    epoint *table[11];

#ifdef MR_STATIC
    char mem[MR_ECP_RESERVE(11)];  
#else
    char *mem;
#endif

#ifndef MR_ALWAYS_BINARY
    epoint *p;
    int ce,ch;
#endif
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;

    MR_IN(95)

    if (size(e)==0) 
    { /* multiplied by 0 */
        epoint_set(_MIPP_ NULL,NULL,0,pt);
        MR_OUT
        return;
    }
    copy(e,mr_mip->w9);
    epoint_norm(_MIPP_ pa);
    epoint_copy(pa,pt);

    if (size(mr_mip->w9)<0)
    { /* pt = -pt */
        negify(mr_mip->w9,mr_mip->w9);
        epoint_negate(_MIPP_ pt);
    }

    if (size(mr_mip->w9)==1)
    { 
        MR_OUT
        return;
    }

    premult(_MIPP_ mr_mip->w9,3,mr_mip->w10);      /* h=3*e */

#ifndef MR_STATIC
#ifndef MR_ALWAYS_BINARY
    if (mr_mip->base==mr_mip->base2)
    {
#endif
#endif

#ifdef  MR_STATIC
        memset(mem,0,MR_ECP_RESERVE(11));
#else
        mem=(char *)ecp_memalloc(_MIPP_ 11);
#endif

        for (i=0;i<=10;i++)
            table[i]=epoint_init_mem(_MIPP_ mem,i);

        epoint_copy(pt,table[0]);
        epoint_copy(pt,table[10]);
        ecurve_double(_MIPP_ table[10]);
        epoint_norm(_MIPP_ table[10]);

        for (i=1;i<=9;i++)
        { /* precomputation */
            epoint_copy(table[i-1],table[i]);
            ecurve_add(_MIPP_ table[10],table[i]);
        }
        ecurve_add(_MIPP_ table[9],table[10]);

  /* note that normalising this table doesn't really help */
        nb=logb2(_MIPP_ mr_mip->w10);

        for (i=nb-2;i>=1;)
        { /* add/subtract */
            if (mr_mip->user!=NULL) (*mr_mip->user)();
            n=mr_naf_window(_MIPP_ mr_mip->w9,mr_mip->w10,i,&nbs,&nzs);
            for (j=0;j<nbs;j++)
                ecurve_double(_MIPP_ pt);
            if (n>0) ecurve_add(_MIPP_ table[n/2],pt);
            if (n<0) ecurve_sub(_MIPP_ table[(-n)/2],pt);
            i-=nbs;
            if (nzs)
            {
                for (j=0;j<nzs;j++) ecurve_double(_MIPP_ pt);
                i-=nzs;
            }
        }
        ecp_memkill(_MIPP_ mem,11);

#ifndef MR_STATIC
#ifndef MR_ALWAYS_BINARY
    }
    else
    { 
        mem=ecp_memalloc(_MIPP_ 1);
        p=epoint_init_mem(_MIPP_ mem,0);
        epoint_copy(pt,p);

        expb2(_MIPP_ logb2(_MIPP_ mr_mip->w10)-1,mr_mip->w11);
        mr_psub(_MIPP_ mr_mip->w10,mr_mip->w11,mr_mip->w10);
        subdiv(_MIPP_ mr_mip->w11,2,mr_mip->w11);
        while (size(mr_mip->w11) > 1)
        { /* add/subtract method */
            if (mr_mip->user!=NULL) (*mr_mip->user)();

            ecurve_double(_MIPP_ pt);
            ce=compare(mr_mip->w9,mr_mip->w11); /* e(i)=1? */
            ch=compare(mr_mip->w10,mr_mip->w11); /* h(i)=1? */
            if (ch>=0) 
            {  /* h(i)=1 */
                if (ce<0) ecurve_add(_MIPP_ p,pt);
                mr_psub(_MIPP_ mr_mip->w10,mr_mip->w11,mr_mip->w10);
            }
            if (ce>=0) 
            {  /* e(i)=1 */
                if (ch<0) ecurve_sub(_MIPP_ p,pt);
                mr_psub(_MIPP_ mr_mip->w9,mr_mip->w11,mr_mip->w9);  
            }
            subdiv(_MIPP_ mr_mip->w11,2,mr_mip->w11);
        }
        ecp_memkill(_MIPP_ mem,1);
    }
#endif
#endif
    MR_OUT
}

#ifndef MR_STATIC

void ecurve_multn(_MIPD_ int n,big *y,epoint **x,epoint *w)
{ /* pt=e[o]*p[0]+e[1]*p[1]+ .... e[n-1]*p[n-1]   */
    int i,j,k,m,nb,ea;
    epoint **G;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;

    MR_IN(114)

    m=1<<n;
    G=(epoint **)mr_alloc(_MIPP_ m,sizeof(epoint*));

    for (i=0,k=1;i<n;i++)
    {
        for (j=0; j < (1<<i) ;j++)
        {
            G[k]=epoint_init(_MIPPO_ );
            epoint_copy(x[i],G[k]);
            if (j!=0) ecurve_add(_MIPP_ G[j],G[k]);
            k++;
        }
    }

    nb=0;
    for (j=0;j<n;j++) if ((k=logb2(_MIPP_ y[j])) > nb) nb=k;

    epoint_set(_MIPP_ NULL,NULL,0,w);            /* w=0 */
    
#ifndef MR_ALWAYS_BINARY
    if (mr_mip->base==mr_mip->base2)
    {
#endif
        for (i=nb-1;i>=0;i--)
        {
            if (mr_mip->user!=NULL) (*mr_mip->user)();
            ea=0;
            k=1;
            for (j=0;j<n;j++)
            {
                if (mr_testbit(_MIPP_ y[j],i)) ea+=k;
                k<<=1;
            }
            ecurve_double(_MIPP_ w);
            if (ea!=0) ecurve_add(_MIPP_ G[ea],w);
        }    
#ifndef MR_ALWAYS_BINARY
    }
    else mr_berror(_MIPP_ MR_ERR_NOT_SUPPORTED);
#endif

    for (i=1;i<m;i++) epoint_free(G[i]);
    mr_free(G);
    MR_OUT
}

#endif

void ecurve_mult2(_MIPD_ big e,epoint *p,big ea,epoint *pa,epoint *pt)
{ /* pt=e*p+ea*pa; */
    int e1,h1,e2,h2;
    epoint *p1,*p2,*ps,*pd;
#ifdef MR_STATIC
    char mem[MR_ECP_RESERVE(4)];
#else
    char *mem;
#endif
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;

    MR_IN(103)

    if (size(e)==0) 
    {
        ecurve_mult(_MIPP_ ea,pa,pt);
        MR_OUT
        return;
    }
#ifdef MR_STATIC
    memset(mem,0,MR_ECP_RESERVE(4));
#else
    mem=(char *)ecp_memalloc(_MIPP_ 4);
#endif
    p2=epoint_init_mem(_MIPP_ mem,0);
    p1=epoint_init_mem(_MIPP_ mem,1);
    ps=epoint_init_mem(_MIPP_ mem,2);
    pd=epoint_init_mem(_MIPP_ mem,3);

    epoint_norm(_MIPP_ pa);
    epoint_copy(pa,p2);
    copy(ea,mr_mip->w9);
    if (size(mr_mip->w9)<0)
    { /* p2 = -p2 */
        negify(mr_mip->w9,mr_mip->w9);
        epoint_negate(_MIPP_ p2);
    }
    premult(_MIPP_ mr_mip->w9,3,mr_mip->w10);      /* 3*ea */

    epoint_norm(_MIPP_ p);
    epoint_copy(p,p1);
    copy(e,mr_mip->w12);
    if (size(mr_mip->w12)<0)
    { /* p1= -p1 */
        negify(mr_mip->w12,mr_mip->w12);
        epoint_negate(_MIPP_ p1);
    }
    premult(_MIPP_ mr_mip->w12,3,mr_mip->w13);    /* 3*e */

    epoint_set(_MIPP_ NULL,NULL,0,pt);            /* pt=0 */

    if (compare(mr_mip->w10,mr_mip->w13)>=0)
         expb2(_MIPP_ logb2(_MIPP_ mr_mip->w10)-1,mr_mip->w11);
    else expb2(_MIPP_ logb2(_MIPP_ mr_mip->w13)-1,mr_mip->w11);

    epoint_copy(p1,ps);
    ecurve_add(_MIPP_ p2,ps);                    /* ps=p1+p2 */
    epoint_copy(p1,pd);
    ecurve_sub(_MIPP_ p2,pd);                    /* pd=p1-p2 */
    epoint_norm(_MIPP_ ps);
    epoint_norm(_MIPP_ pd);
    while (size(mr_mip->w11) > 1)
    { /* add/subtract method */
        if (mr_mip->user!=NULL) (*mr_mip->user)();

        ecurve_double(_MIPP_ pt);

        e1=h1=e2=h2=0;
        if (compare(mr_mip->w9,mr_mip->w11)>=0)
        { /* e1(i)=1? */
            e2=1;  
            mr_psub(_MIPP_ mr_mip->w9,mr_mip->w11,mr_mip->w9);
        }
        if (compare(mr_mip->w10,mr_mip->w11)>=0)
        { /* h1(i)=1? */
            h2=1;  
            mr_psub(_MIPP_ mr_mip->w10,mr_mip->w11,mr_mip->w10);
        } 
        if (compare(mr_mip->w12,mr_mip->w11)>=0)
        { /* e2(i)=1? */
            e1=1;   
            mr_psub(_MIPP_ mr_mip->w12,mr_mip->w11,mr_mip->w12);
        }
        if (compare(mr_mip->w13,mr_mip->w11)>=0) 
        { /* h2(i)=1? */
            h1=1;  
            mr_psub(_MIPP_ mr_mip->w13,mr_mip->w11,mr_mip->w13);
        }

        if (e1!=h1)
        {
            if (e2==h2)
            {
                if (h1==1) ecurve_add(_MIPP_ p1,pt);
                else       ecurve_sub(_MIPP_ p1,pt);
            }
            else
            {
                if (h1==1)
                {
                    if (h2==1) ecurve_add(_MIPP_ ps,pt);
                    else       ecurve_add(_MIPP_ pd,pt);
                }
                else
                {
                    if (h2==1) ecurve_sub(_MIPP_ pd,pt);
                    else       ecurve_sub(_MIPP_ ps,pt);
                }
            }
        }
        else if (e2!=h2)
        {
            if (h2==1) ecurve_add(_MIPP_ p2,pt);
            else       ecurve_sub(_MIPP_ p2,pt);
        }

        subdiv(_MIPP_ mr_mip->w11,2,mr_mip->w11);
    }
    ecp_memkill(_MIPP_ mem,4);
    MR_OUT
}
}

