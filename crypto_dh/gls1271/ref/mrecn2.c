/*
 *   MIRACL E(F_p^2) support functions 
 *   mrecn2.c
 *
 *   Copyright (c) 2008 Shamus Software Ltd.
 */

#include <stdlib.h> 
#include "miracl.h"
#ifdef MR_STATIC
#include <string.h>
#endif

static inline void zzn2_div2_i(zzn2 *w)
{
	moddiv2(w->a->w);
	w->a->len=2;
	moddiv2(w->b->w);
	w->b->len=2;
}

static inline void zzn2_tim2_i(zzn2 *w)
{
#ifdef MR_COUNT_OPS
fpa+=2; 
#endif

	modtim2(w->a->w);
	modtim2(w->b->w);
	w->a->len=2;
	w->b->len=2;
}

static inline void zzn2_tim3_i(zzn2 *w)
{
#ifdef MR_COUNT_OPS
fpa+=4; 
#endif

	modtim3(w->a->w);
	modtim3(w->b->w);
	w->a->len=2;
	w->b->len=2;
}

static inline void zzn2_copy_i(zzn2 *x,zzn2 *w)
{
    if (x==w) return;

    w->a->len=x->a->len;
    w->a->w[0]=x->a->w[0];
    w->a->w[1]=x->a->w[1];
    w->b->len=x->b->len;
    w->b->w[0]=x->b->w[0];
    w->b->w[1]=x->b->w[1];

}

static inline void zzn2_add_i(zzn2 *x,zzn2 *y,zzn2 *w)
{

#ifdef MR_COUNT_OPS
fpa+=2; 
#endif

    modadd(x->a->w,y->a->w,w->a->w);
	modadd(x->b->w,y->b->w,w->b->w);
	w->a->len=2;
	w->b->len=2;
}

static inline void zzn2_sub_i(zzn2 *x,zzn2 *y,zzn2 *w)
{
#ifdef MR_COUNT_OPS
fpa+=2; 
#endif
    modsub(x->a->w,y->a->w,w->a->w);
	modsub(x->b->w,y->b->w,w->b->w);
	w->a->len=2;
	w->b->len=2;
}

static inline void zzn2_timesi_i(zzn2 *u)
{
    mr_small w1[2];
	w1[0]=u->a->w[0];
	w1[1]=u->a->w[1];

    u->a->w[0]=u->b->w[0];
    u->a->w[1]=u->b->w[1];

	modneg(u->a->w);

	u->b->w[0]=w1[0];
	u->b->w[1]=w1[1];
}

static inline void zzn2_txx_i(zzn2 *u)
{
  /* multiply w by t^2 where x^2-t is irreducible polynomial for ZZn4
  
   for p=5 mod 8 t=sqrt(sqrt(-2)), qnr=-2
   for p=3 mod 8 t=sqrt(1+sqrt(-1)), qnr=-1
   for p=7 mod 8 and p=2,3 mod 5 t=sqrt(2+sqrt(-1)), qnr=-1 */
    zzn2 t;
	struct bigtype aa,bb;
	big a,b;
	mr_small w3[2],w4[2];
    a=&aa;
	b=&bb;
	a->len=2;
	b->len=2;
	a->w=w3;
	b->w=w4;
	t.a=a;
	t.b=b;
    zzn2_copy_i(u,&t);
    zzn2_timesi_i(u);
    zzn2_add_i(u,&t,u);
    zzn2_add_i(u,&t,u); 
    u->a->len=2;
	u->b->len=2;
}

static inline void zzn2_sqr_i(zzn2 *x,zzn2 *w)
{
	static mr_small w1[2],w2[2];
#ifdef MR_COUNT_OPS
fpa+=3;
fpc+=2;
#endif
	modadd(x->a->w,x->b->w,w1);
    modsub(x->a->w,x->b->w,w2);
	modmult(x->a->w,x->b->w,w->b->w);
	modmult(w1,w2,w->a->w);   // routine that calculates (a+b)(a-b) ??
	modtim2(w->b->w);
	w->a->len=2;
	w->b->len=2;
}

static inline void zzn2_dblsub_i(zzn2 *x,zzn2 *y,zzn2 *w)
{
#ifdef MR_COUNT_OPS
fpa+=4; 
#endif
    moddblsub(w->a->w,x->a->w,y->a->w);
	moddblsub(w->b->w,x->b->w,y->b->w);
	w->a->len=2;
	w->b->len=2;
}

static inline void zzn2_mul_i(zzn2 *x,zzn2 *y,zzn2 *w)
{
	static mr_small w1[2],w2[2],w5[2];
#ifdef MR_COUNT_OPS
fpa+=5;
fpc+=3;
#endif

	modmult(x->a->w,y->a->w,w1);
    modmult(x->b->w,y->b->w,w2);
	modadd(x->a->w,x->b->w,w5);
	modadd(y->a->w,y->b->w,w->b->w);
    modmult(w->b->w,w5,w->b->w);
    moddblsub(w->b->w,w1,w2);  /* w->b->w - w1 -w2 */

	modsub(w1,w2,w->a->w); 

	w->a->len=2;
	w->b->len=2; 
}

void zzn2_inv_i(_MIPD_ zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(163)
    modsqr(w->a->w,mr_mip->w1->w); 
    modsqr(w->b->w,mr_mip->w2->w); 
    modadd(mr_mip->w1->w,mr_mip->w2->w,mr_mip->w1->w);
	mr_mip->w1->len=2;

 /*   redc(_MIPP_ mr_mip->w1,mr_mip->w6); */
    copy(mr_mip->w1,mr_mip->w6);
  
    xgcd(_MIPP_ mr_mip->w6,mr_mip->modulus,mr_mip->w6,mr_mip->w6,mr_mip->w6);

/*    nres(_MIPP_ mr_mip->w6,mr_mip->w6); */

    modmult(w->a->w,mr_mip->w6->w,w->a->w);
	modneg(mr_mip->w6->w);
    modmult(w->b->w,mr_mip->w6->w,w->b->w);
    MR_OUT
}

BOOL ecn2_iszero(ecn2 *a)
{
    if (a->marker==MR_EPOINT_INFINITY) return TRUE;
    return FALSE;
}

void ecn2_copy(ecn2 *a,ecn2 *b)
{
    zzn2_copy_i(&(a->x),&(b->x));
    zzn2_copy_i(&(a->y),&(b->y));
#ifndef MR_AFFINE_ONLY
    zzn2_copy_i(&(a->z),&(b->z));
#endif
    b->marker=a->marker;
}

void ecn2_zero(ecn2 *a)
{
    zzn2_zero(&(a->x)); zzn2_zero(&(a->y)); 
#ifndef MR_AFFINE_ONLY
    zzn2_zero(&(a->z));
#endif
    a->marker=MR_EPOINT_INFINITY;
}

BOOL ecn2_compare(_MIPD_ ecn2 *a,ecn2 *b)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return FALSE;

    MR_IN(193)
    ecn2_norm(_MIPP_ a);
    ecn2_norm(_MIPP_ b);
    MR_OUT
    if (zzn2_compare(&(a->x),&(b->x)) && zzn2_compare(&(a->y),&(b->y)) && a->marker==b->marker) return TRUE;
    return FALSE;
}

void ecn2_norm(_MIPD_ ecn2 *a)
{
    zzn2 t;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
#ifndef MR_AFFINE_ONLY
    if (mr_mip->ERNUM) return;
    if (a->marker!=MR_EPOINT_GENERAL) return;

    MR_IN(194)

    zzn2_inv_i(_MIPP_ &(a->z));

    t.a=mr_mip->w3;
    t.b=mr_mip->w4;
    zzn2_copy_i(&(a->z),&t);

    zzn2_sqr_i( &(a->z),&(a->z));
    zzn2_mul_i( &(a->x),&(a->z),&(a->x));
    zzn2_mul_i( &(a->z),&t,&(a->z));
    zzn2_mul_i( &(a->y),&(a->z),&(a->y));
    zzn2_from_int(_MIPP_ 1,&(a->z));
    a->marker=MR_EPOINT_NORMALIZED;

    MR_OUT
#endif
}

void ecn2_get(ecn2 *e,zzn2 *x,zzn2 *y,zzn2 *z)
{
    zzn2_copy_i(&(e->x),x);
    zzn2_copy_i(&(e->y),y);
#ifndef MR_AFFINE_ONLY
    zzn2_copy_i(&(e->z),z);
#endif
}

void ecn2_getxy(ecn2 *e,zzn2 *x,zzn2 *y)
{
    zzn2_copy_i(&(e->x),x);
    zzn2_copy_i(&(e->y),y);
}

void ecn2_getx(ecn2 *e,zzn2 *x)
{
    zzn2_copy_i(&(e->x),x);
}

inline void zzn2_conj_i(zzn2 *x,zzn2 *w)
{
    zzn2_copy_i(x,w);
	modneg(w->b->w);
}

void ecn2_psi(_MIPD_ zzn2 *px,zzn2 *py,ecn2 *P)
{
	ecn2_norm(_MIPP_ P);
	zzn2_conj_i(&(P->x),&(P->x));
	zzn2_conj_i(&(P->y),&(P->y));
	zzn2_mul_i(&(P->x),px,&(P->x));
	zzn2_mul_i(&(P->y),py,&(P->y));

}

#ifndef MR_AFFINE_ONLY
void ecn2_getz(ecn2 *e,zzn2 *z)
{
    zzn2_copy_i(&(e->z),z);
}
#endif

void ecn2_rhs(_MIPD_ zzn2 *x,zzn2 *rhs)
{ /* calculate RHS of elliptic curve equation */
    BOOL twist;
    zzn2 A,B;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    twist=mr_mip->TWIST;

    MR_IN(202)

    A.a=mr_mip->w10;
    A.b=mr_mip->w11;
    B.a=mr_mip->w12;
    B.b=mr_mip->w13;

    if (mr_abs(mr_mip->Asize)<MR_TOOBIG) zzn2_from_int(_MIPP_ mr_mip->Asize,&A);
    else zzn2_from_zzn(mr_mip->A,&A);

    if (mr_abs(mr_mip->Bsize)<MR_TOOBIG) zzn2_from_int(_MIPP_ mr_mip->Bsize,&B);
    else zzn2_from_zzn(mr_mip->B,&B);
    
    if (twist)
    {
        if (mr_mip->Asize==0 || mr_mip->Bsize==0)
        {
            if (mr_mip->Asize==0)
            {
                zzn2_txd(_MIPP_ &B);
            }
            if (mr_mip->Bsize==0)
            {
                zzn2_mul_i( &A,x,&B);
                zzn2_txd(_MIPP_ &B);
            }
            zzn2_negate(_MIPP_ &B,&B);
        }
        else
        {
            zzn2_txx_i(&B);
            zzn2_txx_i(&B);
            zzn2_txx_i(&B);
            zzn2_mul_i( &A,x,&A);
            zzn2_txx_i(&A);
            zzn2_txx_i(&A);
            zzn2_add_i(&B,&A,&B);
        }
    }
    else
    {
        zzn2_mul_i( &A,x,&A);
        zzn2_add_i(&B,&A,&B);
    }

    zzn2_sqr_i( x,&A);
    zzn2_mul_i( &A,x,&A);
    zzn2_add_i(&B,&A,rhs);

    MR_OUT
}

BOOL ecn2_set(_MIPD_ zzn2 *x,zzn2 *y,ecn2 *e)
{
    zzn2 lhs,rhs;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return FALSE;

    MR_IN(195)

    lhs.a=mr_mip->w10;
    lhs.b=mr_mip->w11;
    rhs.a=mr_mip->w12;
    rhs.b=mr_mip->w13;

    ecn2_rhs(_MIPP_ x,&rhs);

    zzn2_sqr_i( y,&lhs);

    if (!zzn2_compare(&lhs,&rhs))
    {
        MR_OUT
        return FALSE;
    }

    zzn2_copy_i(x,&(e->x));
    zzn2_copy_i(y,&(e->y));
#ifndef MR_AFFINE_ONLY
    zzn2_from_int(_MIPP_ 1,&(e->z));
#endif
    e->marker=MR_EPOINT_NORMALIZED;

    MR_OUT
    return TRUE;
}

#ifndef MR_NOSUPPORT_COMPRESSION

BOOL ecn2_setx(_MIPD_ zzn2 *x,ecn2 *e)
{
    zzn2 rhs;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return FALSE;

    MR_IN(201)

    rhs.a=mr_mip->w12;
    rhs.b=mr_mip->w13;

    ecn2_rhs(_MIPP_ x,&rhs);

    if (!zzn2_iszero(&rhs))
    {
        if (!zzn2_sqrt(_MIPP_ &rhs,&rhs)) 
        {
            MR_OUT
            return FALSE;
        }
    }

    zzn2_copy_i(x,&(e->x));
    zzn2_copy_i(&rhs,&(e->y));
#ifndef MR_AFFINE_ONLY
    zzn2_from_int(_MIPP_ 1,&(e->z));
#endif
    e->marker=MR_EPOINT_NORMALIZED;

    MR_OUT
    return TRUE;
}

#endif

#ifndef MR_AFFINE_ONLY
void ecn2_setxyz(zzn2 *x,zzn2 *y,zzn2 *z,ecn2 *e)
{
    zzn2_copy_i(x,&(e->x));
    zzn2_copy_i(y,&(e->y));
    zzn2_copy_i(z,&(e->z));
    e->marker=MR_EPOINT_GENERAL;
}
#endif

void ecn2_negate(_MIPD_ ecn2 *u,ecn2 *w)
{
    ecn2_copy(u,w);
    if (!w->marker!=MR_EPOINT_INFINITY)
        zzn2_negate(_MIPP_ &(w->y),&(w->y));
}
/*
BOOL ecn2_add2(_MIPD_ ecn2 *Q,ecn2 *P,zzn2 *lam,zzn2 *ex1)
{
    BOOL Doubling;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    Doubling=ecn2_add3(_MIPP_ Q,P,lam,ex1,NULL);

    return Doubling;
}

BOOL ecn2_add1(_MIPD_ ecn2 *Q,ecn2 *P,zzn2 *lam)
{
    BOOL Doubling;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    Doubling=ecn2_add3(_MIPP_ Q,P,lam,NULL,NULL);

    return Doubling;
}
*/

BOOL ecn2_sub(_MIPD_ ecn2 *Q,ecn2 *P)
{
    BOOL Doubling;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    ecn2_negate(_MIPP_ Q,Q);

    Doubling=ecn2_add(_MIPP_ Q,P);

    ecn2_negate(_MIPP_ Q,Q);

    return Doubling;
}
/*
static void zzn2_print(_MIPD_ char *label, zzn2 *x)
{
    char s1[1024], s2[1024];
    big a, b;

#ifdef MR_STATIC
    char mem_big[MR_BIG_RESERVE(2)];   
 	memset(mem_big, 0, MR_BIG_RESERVE(2)); 
    a=mirvar_mem(_MIPP_ mem_big,0);
    b=mirvar_mem(_MIPP_ mem_big,1);
#else
    a = mirvar(_MIPP_  0); 
    b = mirvar(_MIPP_  0); 
#endif
    redc(_MIPP_ x->a, a); otstr(_MIPP_ a, s1);
    redc(_MIPP_ x->b, b); otstr(_MIPP_ b, s2);

    printf("%s: [%s,%s]\n", label, s1, s2);
#ifndef MR_STATIC
    mr_free(a); mr_free(b);
#endif
}

static void nres_print(_MIPD_ char *label, big x)
{
    char s[1024];
    big a;

    a = mirvar(_MIPP_  0); 

    redc(_MIPP_ x, a);
    otstr(_MIPP_ a, s);

    printf("%s: %s\n", label, s);

    mr_free(a);
}
*/
BOOL ecn2_add_sub(_MIPD_ ecn2 *P,ecn2 *Q,ecn2 *PP,ecn2 *PM)
{ /* PP=P+Q, PM=P-Q. Assumes P and Q are both normalized, and P!=Q */
 #ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    zzn2 t1,t2,lam;

    if (mr_mip->ERNUM) return FALSE;

    MR_IN(211)

    if (P->marker==MR_EPOINT_GENERAL || P->marker==MR_EPOINT_GENERAL)
    { /* Sorry, some restrictions.. */
        mr_berror(_MIPP_ MR_ERR_BAD_PARAMETERS);
        MR_OUT
        return FALSE;
    }

    if (zzn2_compare(&(P->x),&(Q->x)))
    { /* P=Q or P=-Q - shouldn't happen */
        ecn2_copy(P,PP);
        ecn2_add(_MIPP_ Q,PP);
        ecn2_copy(P,PM);
        ecn2_sub(_MIPP_ Q,PM);

        MR_OUT
        return TRUE;
    }

    t1.a = mr_mip->w8;
    t1.b = mr_mip->w9; 
    t2.a = mr_mip->w10; 
    t2.b = mr_mip->w11; 
    lam.a = mr_mip->w12; 
    lam.b = mr_mip->w13;    

    zzn2_copy_i(&(P->x),&t2);
    zzn2_sub_i(&t2,&(Q->x),&t2);
    zzn2_inv_i(_MIPP_ &t2);   /* only one inverse required */
    zzn2_add_i(&(P->x),&(Q->x),&(PP->x));
    zzn2_copy_i(&(PP->x),&(PM->x));

    zzn2_copy_i(&(P->y),&t1);
    zzn2_sub_i(&t1,&(Q->y),&t1);
    zzn2_copy_i(&t1,&lam);
    zzn2_mul_i( &lam,&t2,&lam);
    zzn2_copy_i(&lam,&t1);
    zzn2_sqr_i( &t1,&t1);
    zzn2_sub_i(&t1,&(PP->x),&(PP->x));
    zzn2_copy_i(&(Q->x),&(PP->y));
    zzn2_sub_i(&(PP->y),&(PP->x),&(PP->y));
    zzn2_mul_i( &(PP->y),&lam,&(PP->y));
    zzn2_sub_i(&(PP->y),&(Q->y),&(PP->y));

    zzn2_copy_i(&(P->y),&t1);
    zzn2_add_i(&t1,&(Q->y),&t1);
    zzn2_copy_i(&t1,&lam);
    zzn2_mul_i( &lam,&t2,&lam);
    zzn2_copy_i(&lam,&t1);
    zzn2_sqr_i( &t1,&t1);
    zzn2_sub_i(&t1,&(PM->x),&(PM->x));
    zzn2_copy_i(&(Q->x),&(PM->y));
    zzn2_sub_i(&(PM->y),&(PM->x),&(PM->y));
    zzn2_mul_i( &(PM->y),&lam,&(PM->y));
    zzn2_add_i(&(PM->y),&(Q->y),&(PM->y));

#ifndef MR_AFFINE_ONLY      
    zzn2_from_int(_MIPP_ 1,&(PP->z));
    zzn2_from_int(_MIPP_ 1,&(PM->z));
#endif
    PP->marker=MR_EPOINT_NORMALIZED;
    PM->marker=MR_EPOINT_NORMALIZED;

    MR_OUT
    return TRUE;
}

BOOL ecn2_add(_MIPD_ ecn2 *Q,ecn2 *P)
{ /* P+=Q */
    BOOL Doubling=FALSE;
    BOOL twist;
    int iA;
    zzn2 t1,t2,t3,lam;
 
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    t1.a = mr_mip->w8;
    t1.b = mr_mip->w9; 
    t2.a = mr_mip->w10; 
    t2.b = mr_mip->w11; 
    t3.a = mr_mip->w12; 
    t3.b = mr_mip->w13; 
	lam.a = mr_mip->w14;
    lam.b = mr_mip->w15;


    twist=mr_mip->TWIST;
    if (mr_mip->ERNUM) return FALSE;

    if (P->marker==MR_EPOINT_INFINITY)
    {
        ecn2_copy(Q,P);
        return Doubling;
    }
    if (Q->marker==MR_EPOINT_INFINITY) return Doubling;

    MR_IN(205)

    if (Q!=P && Q->marker==MR_EPOINT_GENERAL)
    { /* Sorry, this code is optimized for mixed addition only */
        mr_berror(_MIPP_ MR_ERR_BAD_PARAMETERS);
        MR_OUT
        return Doubling;
    }
#ifndef MR_AFFINE_ONLY
    if (mr_mip->coord==MR_AFFINE)
    {
#endif
        if (!zzn2_compare(&(P->x),&(Q->x)))
        {
            zzn2_copy_i(&(P->y),&t1);
            zzn2_sub_i(&t1,&(Q->y),&t1);
            zzn2_copy_i(&(P->x),&t2);
            zzn2_sub_i(&t2,&(Q->x),&t2);
            zzn2_copy_i(&t1,&lam);
            zzn2_inv_i(_MIPP_ &t2);
            zzn2_mul_i( &lam,&t2,&lam);

            zzn2_add_i(&(P->x),&(Q->x),&(P->x));
            zzn2_copy_i(&lam,&t1);
            zzn2_sqr_i( &t1,&t1);
            zzn2_sub_i(&t1,&(P->x),&(P->x));
           
            zzn2_copy_i(&(Q->x),&(P->y));
            zzn2_sub_i(&(P->y),&(P->x),&(P->y));
            zzn2_mul_i( &(P->y),&lam,&(P->y));
            zzn2_sub_i(&(P->y),&(Q->y),&(P->y));
        }
        else
        {   
            if (!zzn2_compare(&(P->y),&(Q->y)) || zzn2_iszero(&(P->y)))
            {
                ecn2_zero(P);
                zzn2_from_int(_MIPP_ 1,&lam);
                MR_OUT
                return Doubling;
            }
            zzn2_copy_i(&(P->x),&t1);
            zzn2_copy_i(&(P->x),&t2);
            zzn2_copy_i(&(P->x),&lam);
            zzn2_sqr_i( &lam,&lam);
          
		    zzn2_copy_i(&lam,&t3);
			zzn2_tim2_i(&t3);
            zzn2_add_i(&lam,&t3,&lam);

            if (mr_abs(mr_mip->Asize)<MR_TOOBIG) zzn2_from_int(_MIPP_ mr_mip->Asize,&t3);
            else zzn2_from_zzn(mr_mip->A,&t3);
        
            if (twist)
            {
                zzn2_txx_i(&t3);
                zzn2_txx_i(&t3);
            }
            zzn2_add_i(&lam,&t3,&lam);
			zzn2_copy_i(&(P->y),&t3);
			zzn2_tim2_i(&t3);
            zzn2_inv_i(_MIPP_ &t3);
            zzn2_mul_i( &lam,&t3,&lam);

            zzn2_add_i(&t2,&(P->x),&t2);
            zzn2_copy_i(&lam,&(P->x));
            zzn2_sqr_i( &(P->x),&(P->x));
            zzn2_sub_i(&(P->x),&t2,&(P->x));
            zzn2_sub_i(&t1,&(P->x),&t1);
            zzn2_mul_i( &t1,&lam,&t1);
            zzn2_sub_i(&t1,&(P->y),&(P->y));
        }
#ifndef MR_AFFINE_ONLY      
        zzn2_from_int(_MIPP_ 1,&(P->z));
#endif
        P->marker=MR_EPOINT_NORMALIZED;
        MR_OUT
        return Doubling;
#ifndef MR_AFFINE_ONLY
    }

    if (Q==P) Doubling=TRUE;

    if (!Doubling)
    {
        if (P->marker!=MR_EPOINT_NORMALIZED)
        {
			zzn2_sqr_i(&(P->z),&t1);
			zzn2_mul_i(&t1,&(P->z),&t2);
			zzn2_mul_i(&t1,&(Q->x),&t1);
			zzn2_mul_i(&t2,&(Q->y),&t2);
          //  zzn2_sqr_i( &(P->z),&t1);         /* 1S */
          //  zzn2_mul_i( &t3,&t1,&t3);         /* 1M */
          //  zzn2_mul_i( &t1,&(P->z),&t1);     /* 1M */
          //  zzn2_mul_i( &Yzzz,&t1,&Yzzz);     /* 1M */
        }
        if (zzn2_compare(&t1,&(P->x)))  /*?*/
        {
            if (!zzn2_compare(&t2,&(P->y)) || zzn2_iszero(&(P->y)))
            {
                ecn2_zero(P);
                zzn2_from_int(_MIPP_ 1,&lam);
                MR_OUT
                return Doubling;
            }
            else Doubling=TRUE;
        }
    }

    if (!Doubling)
    { /* Addition */
		zzn2_sub_i(&t1,&(P->x),&t1);
		zzn2_sub_i(&t2,&(P->y),&t2);
		zzn2_mul_i(&(P->z),&t1,&(P->z));
		zzn2_sqr_i(&t1,&t3);
		zzn2_mul_i(&t3,&t1,&lam);
		zzn2_mul_i(&t3,&(P->x),&t3);
		zzn2_copy_i(&t3,&t1);
		zzn2_tim2_i(&t1);
		zzn2_sqr_i(&t2,&(P->x));
		zzn2_dblsub_i(&t1,&lam,&(P->x));
		zzn2_sub_i(&t3,&(P->x),&t3);
		zzn2_mul_i(&t3,&t2,&t3);
		zzn2_mul_i(&lam,&(P->y),&lam);
		zzn2_sub_i(&t3,&lam,&(P->y));
    }
    else
    { /* doubling */

		zzn2_sqr_i(&(P->z),&t1);
        if (twist) zzn2_txx_i(&t1);
		zzn2_sub_i(&(P->x),&t1,&t2);
		zzn2_add_i(&t1,&(P->x),&t1);
		zzn2_mul_i(&t2,&t1,&t2);
		zzn2_tim3_i(&t2);
	
		zzn2_tim2_i(&(P->y));
		zzn2_mul_i(&(P->z),&(P->y),&(P->z));
		zzn2_sqr_i(&(P->y),&(P->y));
		zzn2_mul_i(&(P->y),&(P->x),&t3);
		zzn2_sqr_i(&(P->y),&(P->y));
		zzn2_div2_i(&(P->y));
		zzn2_sqr_i(&t2,&(P->x));
		zzn2_copy_i(&t3,&t1);
		zzn2_tim2_i(&t1);
		zzn2_sub_i(&(P->x),&t1,&(P->x));
		zzn2_sub_i(&t3,&(P->x),&t1);
		zzn2_mul_i(&t1,&t2,&t1);
		zzn2_sub_i(&t1,&(P->y),&(P->y));
    }

    P->marker=MR_EPOINT_GENERAL;
    MR_OUT
    return Doubling;
#endif
}

void ecn2_mul(_MIPD_ big k,ecn2 *P)
{
    BOOL change;
    int i,j,nb,n,nbs,nzs;
    big h,kk;
    ecn2 P2,PT,T[5];
#ifndef MR_AFFINE_ONLY
    #define MR_MUL_RESERVE 44
#else
    #define MR_MUL_RESERVE 30
#endif

#ifndef MR_STATIC
    char *mem = memalloc(_MIPP_ MR_MUL_RESERVE);
#else
    char mem[MR_BIG_RESERVE(MR_MUL_RESERVE)];
    memset(mem, 0, MR_BIG_RESERVE(MR_MUL_RESERVE));
#endif

    j=0;
    h=mirvar_mem(_MIPP_ mem, j++);
    kk=mirvar_mem(_MIPP_ mem, j++);
    P2.x.a= mirvar_mem(_MIPP_ mem, j++);
    P2.x.b= mirvar_mem(_MIPP_ mem, j++);
    P2.y.a= mirvar_mem(_MIPP_ mem, j++);
    P2.y.b= mirvar_mem(_MIPP_ mem, j++);
    PT.x.a= mirvar_mem(_MIPP_ mem, j++);
    PT.x.b= mirvar_mem(_MIPP_ mem, j++);
    PT.y.a= mirvar_mem(_MIPP_ mem, j++);
    PT.y.b= mirvar_mem(_MIPP_ mem, j++);

    for (i=0;i<5;i++)
    {
        T[i].x.a= mirvar_mem(_MIPP_ mem, j++);
        T[i].x.b= mirvar_mem(_MIPP_ mem, j++);
        T[i].y.a= mirvar_mem(_MIPP_ mem, j++);
        T[i].y.b= mirvar_mem(_MIPP_ mem, j++);
    }

#ifndef MR_AFFINE_ONLY
    P2.z.a= mirvar_mem(_MIPP_ mem, j++);
    P2.z.b= mirvar_mem(_MIPP_ mem, j++);
    PT.z.a= mirvar_mem(_MIPP_ mem, j++);
    PT.z.b= mirvar_mem(_MIPP_ mem, j++);

    for (i=0;i<5;i++)
    {
        T[i].z.a= mirvar_mem(_MIPP_ mem, j++);
        T[i].z.b= mirvar_mem(_MIPP_ mem, j++);

    }
#endif

    copy(k,kk);
    ecn2_copy(P,&PT);
    if (size(mr_mip->w7)<0)
    {
        negify(kk,kk);
        ecn2_negate(_MIPP_ &PT,&PT);
    }
    MR_IN(207)

    premult(_MIPP_ kk,3,h);
    ecn2_norm(_MIPP_ &PT);
    ecn2_copy(&PT,&P2);

#ifndef MR_AFFINE_ONLY
    change=FALSE;
    if (mr_mip->coord==MR_PROJECTIVE) {change=TRUE; mr_mip->coord=MR_AFFINE;}
#endif
    ecn2_add(_MIPP_ &P2,&P2);
    ecn2_copy(&PT,&T[0]);
    for (i=1;i<=4;i++)
    {
        ecn2_copy(&T[i-1],&T[i]);
        ecn2_add(_MIPP_ &P2,&T[i]);
    }
#ifndef MR_AFFINE_ONLY
    if (change) mr_mip->coord=MR_PROJECTIVE;
#endif

    nb=logb2(_MIPP_ h);
    for (i=nb-2;i>=1;)
    {
        if (mr_mip->user!=NULL) (*mr_mip->user)();
        n=mr_naf_window(_MIPP_ kk,h,i,&nbs,&nzs,4);
        for (j=0;j<nbs;j++) ecn2_add(_MIPP_ &PT,&PT);
        if (n>0) ecn2_add(_MIPP_ &T[n/2],&PT);
        if (n<0) ecn2_sub(_MIPP_ &T[(-n)/2],&PT);
        i-=nbs;
        if (nzs)
        {
            for (j=0;j<nzs;j++) ecn2_add(_MIPP_ &PT,&PT);
            i-=nzs;
        }
    }
/* do it again?
    for (i=nb-2;i>=1;)
    {
        if (mr_mip->user!=NULL) (*mr_mip->user)();
        n=mr_naf_window(_MIPP_ kk,h,i,&nbs,&nzs,4);
        for (j=0;j<nbs;j++) ecn2_add(_MIPP_ &PT,&PT);
        if (n>0) ecn2_add(_MIPP_ &T[n/2],&PT);
        if (n<0) ecn2_sub(_MIPP_ &T[(-n)/2],&PT);
        i-=nbs;
        if (nzs)
        {
            for (j=0;j<nzs;j++) ecn2_add(_MIPP_ &PT,&PT);
            i-=nzs;
        }
    }
*/
    ecn2_norm(_MIPP_ &PT);
    ecn2_copy(&PT,P);

    MR_OUT

#ifndef MR_STATIC
    memkill(_MIPP_ mem, MR_MUL_RESERVE);
#else
    memset(mem, 0, MR_BIG_RESERVE(MR_MUL_RESERVE));
#endif
}

void ecn2_mul2(_MIPD_ big a,ecn2 *P,big b,ecn2 *Q,ecn2 *R)
{
    int e1,h1,e2,h2,bb;
    ecn2 P1,P2,PS,PD;
    big c,d,e,f;
#ifndef MR_AFFINE_ONLY
    #define MR_MUL2_RESERVE 28
#else
    #define MR_MUL2_RESERVE 20
#endif

#ifndef MR_STATIC
    char *mem = memalloc(_MIPP_ MR_MUL2_RESERVE);
#else
    char mem[MR_BIG_RESERVE(MR_MUL2_RESERVE)];
    memset(mem, 0, MR_BIG_RESERVE(MR_MUL2_RESERVE));
#endif

    c = mirvar_mem(_MIPP_ mem, 0);
    d = mirvar_mem(_MIPP_ mem, 1);
    e = mirvar_mem(_MIPP_ mem, 2);
    f = mirvar_mem(_MIPP_ mem, 3);
    P1.x.a= mirvar_mem(_MIPP_ mem, 4);
    P1.x.b= mirvar_mem(_MIPP_ mem, 5);
    P1.y.a= mirvar_mem(_MIPP_ mem, 6);
    P1.y.b= mirvar_mem(_MIPP_ mem, 7);
    P2.x.a= mirvar_mem(_MIPP_ mem, 8);
    P2.x.b= mirvar_mem(_MIPP_ mem, 9);
    P2.y.a= mirvar_mem(_MIPP_ mem, 10);
    P2.y.b= mirvar_mem(_MIPP_ mem, 11);
    PS.x.a= mirvar_mem(_MIPP_ mem, 12);
    PS.x.b= mirvar_mem(_MIPP_ mem, 13);
    PS.y.a= mirvar_mem(_MIPP_ mem, 14);
    PS.y.b= mirvar_mem(_MIPP_ mem, 15);
    PD.x.a= mirvar_mem(_MIPP_ mem, 16);
    PD.x.b= mirvar_mem(_MIPP_ mem, 17);
    PD.y.a= mirvar_mem(_MIPP_ mem, 18);
    PD.y.b= mirvar_mem(_MIPP_ mem, 19);
#ifndef MR_AFFINE_ONLY
    P1.z.a= mirvar_mem(_MIPP_ mem, 20);
    P1.z.b = mirvar_mem(_MIPP_ mem, 21);
    P2.z.a= mirvar_mem(_MIPP_ mem, 22);
    P2.z.b = mirvar_mem(_MIPP_ mem, 23);
    PS.z.a= mirvar_mem(_MIPP_ mem, 24);
    PS.z.b = mirvar_mem(_MIPP_ mem, 25);
    PD.z.a= mirvar_mem(_MIPP_ mem, 26);
    PD.z.b = mirvar_mem(_MIPP_ mem, 27);
#endif
    MR_IN(206)

    ecn2_norm(_MIPP_ Q); 
    ecn2_copy(Q,&P2); 

    copy(b,d);
    if (size(d)<0) 
    {
        negify(d,d);
        ecn2_negate(_MIPP_ &P2,&P2);
    }

    ecn2_norm(_MIPP_ P); 
    ecn2_copy(P,&P1); 

    copy(a,c);
    if (size(c)<0) 
    {
        negify(c,c);
        ecn2_negate(_MIPP_ &P1,&P1);
    }

    mr_jsf(_MIPP_ d,c,e,d,f,c);   /* calculate joint sparse form */
 
    if (compare(e,f)>0) bb=logb2(_MIPP_ e)-1;
    else                bb=logb2(_MIPP_ f)-1;

	ecn2_add_sub(_MIPP_ &P1,&P2,&PS,&PD);

    ecn2_zero(R);

    while (bb>=0) 
    { /* add/subtract method */
        if (mr_mip->user!=NULL) (*mr_mip->user)();
        ecn2_add(_MIPP_ R,R);
        e1=h1=e2=h2=0;

        if (mr_testbit(_MIPP_ d,bb)) e2=1;
        if (mr_testbit(_MIPP_ e,bb)) h2=1;
        if (mr_testbit(_MIPP_ c,bb)) e1=1;
        if (mr_testbit(_MIPP_ f,bb)) h1=1;

        if (e1!=h1)
        {
            if (e2==h2)
            {
                if (h1==1) ecn2_add(_MIPP_ &P1,R);
                else       ecn2_sub(_MIPP_ &P1,R);
            }
            else
            {
                if (h1==1)
                {
                    if (h2==1) ecn2_add(_MIPP_ &PS,R);
                    else       ecn2_add(_MIPP_ &PD,R);
                }
                else
                {
                    if (h2==1) ecn2_sub(_MIPP_ &PD,R);
                    else       ecn2_sub(_MIPP_ &PS,R);
                }
            }
        }
        else if (e2!=h2)
        {
            if (h2==1) ecn2_add(_MIPP_ &P2,R);
            else       ecn2_sub(_MIPP_ &P2,R);
        }
        bb-=1;
    }
	ecn2_norm(_MIPP_ R);

    MR_OUT
#ifndef MR_STATIC
    memkill(_MIPP_ mem, MR_MUL2_RESERVE);
#else
    memset(mem, 0, MR_BIG_RESERVE(MR_MUL2_RESERVE));
#endif

}
