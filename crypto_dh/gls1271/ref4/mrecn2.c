/*
 *  No mattter where you got this code, be aware that MIRACL is NOT
 *  free software. For commercial use a license is required.
 *	See www.shamus.ie
 *
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

	w3[0]=u->a->w[0];
	w3[1]=u->a->w[1];
	w4[0]=u->b->w[0];
	w4[1]=u->b->w[1];

	a->w=w3;
	b->w=w4;
	t.a=a;
	t.b=b;

	zzn2_tim2_i(&t);
    zzn2_timesi_i(u);
    zzn2_add_i(u,&t,u); 
    u->a->len=2;
	u->b->len=2;
}

static inline void zzn2_imul_i(int i,zzn2 *x)
{
	modpmul(i,x->a->w);
	modpmul(i,x->b->w);
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
#ifdef MR_COUNT_OPS
fpc+=4;
fpa+=1;
#endif 
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

BOOL nres_sqroot(_MIPD_ big x,big w)
{ /* w=sqrt(x) mod p. This depends on p being prime! */
    int i,t,js;
#ifdef MR_COUNT_OPS
fpc+=125; 
#endif   
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return FALSE;

    copy(x,w);
    if (size(w)==0) return TRUE; 

	copy(w,mr_mip->w1);
    for (i=0;i<25;i++)
	{
		modsqr(w->w,w->w);
		modsqr(w->w,w->w);
		modsqr(w->w,w->w);
		modsqr(w->w,w->w);
		modsqr(w->w,w->w);
	}
	w->len=2;

	modsqr(w->w,mr_mip->w2->w);
	mr_mip->w2->len=2;
	if (compare(mr_mip->w1,mr_mip->w2)!=0) {zero(w);return FALSE;}
	
	return TRUE;

}

BOOL zzn2_sqrt(_MIPD_ zzn2 *u,zzn2 *w)
{ /* sqrt(a+ib) = sqrt(a+sqrt(a*a-n*b*b)/2)+ib/(2*sqrt(a+sqrt(a*a-n*b*b)/2))
     where i*i=n */
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
#ifdef MR_COUNT_OPS
fpc+=2;
fpa+=1;
#endif 
    if (mr_mip->ERNUM) return FALSE;

    zzn2_copy(u,w);
    if (zzn2_iszero(w)) return TRUE;

    MR_IN(204)  

	modsqr(w->b->w,mr_mip->w7->w);
	modsqr(w->a->w,mr_mip->w1->w);
	modadd(mr_mip->w1->w,mr_mip->w7->w,mr_mip->w7->w);
	mr_mip->w7->len=2;

//    nres_modmult(_MIPP_ w->b,w->b,mr_mip->w7);
//    nres_modmult(_MIPP_ w->a,w->a,mr_mip->w1);
//    nres_modadd(_MIPP_ mr_mip->w7,mr_mip->w1,mr_mip->w7);

    if (!nres_sqroot(_MIPP_ mr_mip->w7,mr_mip->w7)) /* s=w7 */
    {
        zzn2_zero(w);
        MR_OUT
        return FALSE;
    }
#ifdef MR_COUNT_OPS
fpa+=1;
#endif 
    modadd(w->a->w,mr_mip->w7->w,mr_mip->w15->w);
	moddiv2(mr_mip->w15->w);
	mr_mip->w15->len=2;

//    nres_modadd(_MIPP_ w->a,mr_mip->w7,mr_mip->w15);
//    nres_div2(_MIPP_ mr_mip->w15,mr_mip->w15);

    if (!nres_sqroot(_MIPP_ mr_mip->w15,mr_mip->w15))
    {
#ifdef MR_COUNT_OPS
fpa+=1;
#endif 
    modsub(w->a->w,mr_mip->w7->w,mr_mip->w15->w);
	moddiv2(mr_mip->w15->w);
	mr_mip->w15->len=2;


   //     nres_modsub(_MIPP_ w->a,mr_mip->w7,mr_mip->w15);
   //     nres_div2(_MIPP_ mr_mip->w15,mr_mip->w15);
        if (!nres_sqroot(_MIPP_ mr_mip->w15,mr_mip->w15))
        {
            zzn2_zero(w);
            MR_OUT
            return FALSE;
        }
//		else printf("BBBBBBBBBBBBBBBBBB\n");
    }
//	else printf("AAAAAAAAAAAAAAAAAAA\n");
#ifdef MR_COUNT_OPS
fpa+=1;
#endif 
    copy(mr_mip->w15,w->a);
    modadd(mr_mip->w15->w,mr_mip->w15->w,mr_mip->w15->w);
    nres_moddiv(_MIPP_ w->b,mr_mip->w15,w->b);

    MR_OUT
    return TRUE;
}

BOOL zzn2_multi_inverse(_MIPD_ int m,zzn2 *x,zzn2 *w)
{ 
    int i;
    zzn2 t1,t2;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (m==0) return TRUE;
    if (m<0) return FALSE;
    MR_IN(214)

    if (x==w)
    {
        mr_berror(_MIPP_ MR_ERR_BAD_PARAMETERS);
        MR_OUT
        return FALSE;
    }

    if (m==1)
    {
        zzn2_copy_i(&x[0],&w[0]);
        zzn2_inv_i(_MIPP_ &w[0]);

        MR_OUT
        return TRUE;
    }

    zzn2_from_int(_MIPP_ 1,&w[0]);
    zzn2_copy_i(&x[0],&w[1]);

    for (i=2;i<m;i++)
    {
        if (zzn2_isunity(_MIPP_ &x[i-1]))
            zzn2_copy_i(&w[i-1],&w[i]);
        else
            zzn2_mul_i(&w[i-1],&x[i-1],&w[i]); 
    }

    t1.a=mr_mip->w8;
    t1.b=mr_mip->w9;
    t2.a=mr_mip->w10;
    t2.b=mr_mip->w11;

    zzn2_mul_i(&w[m-1],&x[m-1],&t1); 
    if (zzn2_iszero(&t1))
    {
        mr_berror(_MIPP_ MR_ERR_DIV_BY_ZERO);
        MR_OUT
        return FALSE;
    }

    zzn2_inv_i(_MIPP_ &t1);

    zzn2_copy_i(&x[m-1],&t2);
    zzn2_mul_i(&w[m-1],&t1,&w[m-1]);

    for (i=m-2;;i--)
    {
        if (i==0)
        {
            zzn2_mul_i(&t2,&t1,&w[0]);
            break;
        }
        zzn2_mul_i(&w[i],&t2,&w[i]);
        zzn2_mul_i(&w[i],&t1,&w[i]);
        if (!zzn2_isunity(_MIPP_ &x[i])) zzn2_mul_i(&t2,&x[i],&t2);
    }

    MR_OUT 
    return TRUE;   
}


/* Now for curves in Inverted Twisted Edwards Form */

BOOL ecn2_iszero(ecn2 *a)
{
    if (a->marker==MR_EPOINT_INFINITY) return TRUE;
    return FALSE;
}

void ecn2_copy(ecn2 *a,ecn2 *b)
{
    zzn2_copy_i(&(a->x),&(b->x));
    zzn2_copy_i(&(a->y),&(b->y));
    if (a->marker==MR_EPOINT_GENERAL)  zzn2_copy_i(&(a->z),&(b->z));
    b->marker=a->marker;
}

void ecn2_zero(ecn2 *a)
{
    zzn2_zero(&(a->x));
    zzn2_zero(&(a->y)); 
    if (a->marker==MR_EPOINT_GENERAL) zzn2_zero(&(a->z)); 
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
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    if (mr_mip->ERNUM) return;
    if (a->marker!=MR_EPOINT_GENERAL) return;

    MR_IN(194)
    
    zzn2_inv_i(_MIPP_ &(a->z));

    zzn2_mul_i(&(a->x),&(a->z),&(a->x));
    zzn2_mul_i(&(a->y),&(a->z),&(a->y));
    zzn2_from_zzn(mr_mip->one,&(a->z));
    a->marker=MR_EPOINT_NORMALIZED;

    MR_OUT

}

void ecn2_get(_MIPD_ ecn2 *e,zzn2 *x,zzn2 *y,zzn2 *z)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    
    zzn2_copy_i(&(e->x),x);
    zzn2_copy_i(&(e->y),y);
    if (e->marker==MR_EPOINT_GENERAL) zzn2_copy_i(&(e->z),z);
    else                              zzn2_from_zzn(mr_mip->one,z);
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

void ecn2_getz(_MIPD_ ecn2 *e,zzn2 *z)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (e->marker==MR_EPOINT_GENERAL) zzn2_copy_i(&(e->z),z);
    else                              zzn2_from_zzn(mr_mip->one,z);
}

inline void zzn2_conj_i(zzn2 *x,zzn2 *w)
{
    zzn2_copy_i(x,w);
	modneg(w->b->w);
}

void ecn2_psi(_MIPD_ zzn2 *psi,ecn2 *P)
{ /* apply GLS morphism to P */
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    MR_IN(212)
    zzn2_conj_i(&(P->x),&(P->x));
    zzn2_conj_i(&(P->y),&(P->y));
	if (P->marker==MR_EPOINT_GENERAL)
		zzn2_conj_i(&(P->z),&(P->z));
    zzn2_mul_i(&(P->x),&psi[0],&(P->x));
//    zzn2_mul(_MIPP_ &(P->y),&psi[1],&(P->y));

    MR_OUT
}
/*
static void out_zzn2(zzn2 *x)
{
	redc(x->a,x->a);
	redc(x->b,x->b);
	cotnum(x->a,stdout);
	cotnum(x->b,stdout);
	nres(x->a,x->a);
	nres(x->b,x->b);
}
*/

/* find RHS=(x^2-B)/(x^2-A) */

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

    A.a=mr_mip->w8;
    A.b=mr_mip->w9;
    B.a=mr_mip->w10;
    B.b=mr_mip->w11;

    zzn2_from_zzn(mr_mip->A,&A);
    zzn2_from_zzn(mr_mip->B,&B);
  
    if (twist)
    {
        zzn2_txx_i(&A);
        zzn2_txx_i(&B);
    }

    zzn2_sqr_i(x,rhs);

    zzn2_sub_i(rhs,&B,&B);

    zzn2_sub_i(rhs,&A,&A);

    zzn2_inv_i(_MIPP_ &A);
    zzn2_mul_i(&A,&B,rhs);

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

    lhs.a=mr_mip->w12;
    lhs.b=mr_mip->w13;
    rhs.a=mr_mip->w14;
    rhs.b=mr_mip->w15;

    ecn2_rhs(_MIPP_ x,&rhs);

    zzn2_sqr_i(y,&lhs);

    if (!zzn2_compare(&lhs,&rhs))
    {
        MR_OUT
        return FALSE;
    }

    zzn2_copy_i(x,&(e->x));
    zzn2_copy_i(y,&(e->y));

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

    e->marker=MR_EPOINT_NORMALIZED;

    MR_OUT
    return TRUE;
}

#endif

void ecn2_setxyz(zzn2 *x,zzn2 *y,zzn2 *z,ecn2 *e)
{
    zzn2_copy_i(x,&(e->x));
    zzn2_copy_i(y,&(e->y));
    zzn2_copy_i(z,&(e->z));
    e->marker=MR_EPOINT_GENERAL;
}

/* Normalise an array of points of length m<MR_MAX_M_T_S - requires a zzn2 workspace array of length m */

BOOL ecn2_multi_norm(_MIPD_ int m,zzn2 *work,ecn2 *p)
{ 

#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
 
    int i;
	zzn2 one;
    zzn2 w[MR_MAX_M_T_S];
    if (mr_mip->ERNUM) return FALSE;   
    if (m>MR_MAX_M_T_S) return FALSE;

    MR_IN(215)
    
	one.a=mr_mip->w12;
    one.b=mr_mip->w13;

	zzn2_from_zzn(mr_mip->one,&one);

    for (i=0;i<m;i++)
	{
		if (p[i].marker==MR_EPOINT_NORMALIZED) w[i]=one;
        else w[i]=p[i].z;
	}

    if (!zzn2_multi_inverse(_MIPP_ m,w,work)) 
    {
       MR_OUT
       return FALSE;
    }

    for (i=0;i<m;i++)
    {
        p[i].marker=MR_EPOINT_NORMALIZED;
        zzn2_mul_i(&(p[i].x),&work[i],&(p[i].x));    
        zzn2_mul_i(&(p[i].y),&work[i],&(p[i].y));  
		zzn2_from_zzn(mr_mip->one,&(p[i].z));
    }    
    MR_OUT

    return TRUE;   
}

int zzn2_lzero(zzn2 *x)
{
	if (x->a->w[1]!=0)  return 0;
	x->a->len=1;
	if (x->b->w[1]!=0)  return 0;
	x->b->len=1;
	if (x->a->w[0]!=0)  return 0;
	x->a->len=0;
	if (x->b->w[0]!=0)  return 0;
	x->b->len=0;
	return 1;
}


BOOL ecn2_add(_MIPD_ ecn2 *Q,ecn2 *P)
{ /* P+=Q */
    BOOL Doubling=FALSE;
    BOOL twist;
    zzn2 t2,t3,t4;
 
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
 
    t2.a = mr_mip->w8; 
    t2.b = mr_mip->w9; 
    t3.a = mr_mip->w10; 
    t3.b = mr_mip->w11;
    t4.a = mr_mip->w12;
    t4.b = mr_mip->w13;

    twist=mr_mip->TWIST;
    if (mr_mip->ERNUM) return FALSE;

    if (P->marker==MR_EPOINT_INFINITY)
    {
        ecn2_copy(Q,P);
        return Doubling;
    }
    if (Q->marker==MR_EPOINT_INFINITY) return Doubling;

    if (Q==P)
    {
        Doubling=TRUE;
        if (P->marker==MR_EPOINT_INFINITY) 
        { /* 2 times infinity == infinity ! */
            return Doubling;
        }
    }

    MR_IN(205)

    if (!Doubling)
    { /* Addition */
        zzn2_add_i(&(Q->x),&(Q->y),&t2);
        zzn2_add_i(&(P->x),&(P->y),&t4);
        zzn2_mul_i(&t4,&t2,&t4);          /* I = t4 = (x1+y1)(x2+y2) */
        if (Q->marker!=MR_EPOINT_NORMALIZED)
        {
            if (P->marker==MR_EPOINT_NORMALIZED)
                zzn2_copy_i(&(Q->z),&(P->z));
            else
                zzn2_mul_i(&(Q->z),&(P->z),&(P->z));  /* Z = z1*z2 */
        }  
        else
        {
            if (P->marker==MR_EPOINT_NORMALIZED)
                zzn2_from_zzn(mr_mip->one,&(P->z));
        }
        zzn2_sqr_i(&(P->z),&t2);                 /* P->z = z1.z2 */
        zzn2_imul_i(mr_mip->Bsize,&t2);

        zzn2_mul_i(&(P->x),&(Q->x),&(P->x));     /* X = x1*x2 */
        zzn2_mul_i(&(P->y),&(Q->y),&(P->y));     /* Y = y1*y2 */
		zzn2_dblsub_i(&(P->x),&(P->y),&t4);           /* I = (x1+y1)(x2+y2)-X-Y */ 
        zzn2_mul_i(&(P->x),&(P->y),&t3);         /* E = t3 = X*Y */
        if (twist)
		{
			zzn2_txx_i(&t2);                     /* B = t2 = d*A^2 */
            zzn2_txx_i(&(P->y));                 /* Y=aY */
		}
        zzn2_sub_i(&(P->x),&(P->y),&(P->x));     /* X=X-aY */
        zzn2_mul_i(&(P->z),&(P->x),&(P->z));
        zzn2_mul_i(&(P->z),&t4,&(P->z));

	if (zzn2_lzero(&(P->z)))
    {
        zzn2_from_zzn(mr_mip->one,&(P->x));
        zzn2_zero(&(P->y));
        P->marker=MR_EPOINT_INFINITY;
    }
	else
	{
        zzn2_sub_i(&t3,&t2,&(P->y));
        zzn2_mul_i(&(P->y),&t4,&(P->y));
        zzn2_add_i(&t3,&t2,&t4);
        zzn2_mul_i(&(P->x),&t4,&(P->x));
		P->marker=MR_EPOINT_GENERAL;
	}
    }
    else
    { /* doubling */
        zzn2_add_i(&(P->x),&(P->y),&t2);
        zzn2_sqr_i(&t2,&t2);
        zzn2_sqr_i(&(P->x),&(P->x));
        zzn2_sqr_i(&(P->y),&(P->y));
		zzn2_dblsub_i(&(P->x),&(P->y),&t2);

        if (P->marker!=MR_EPOINT_NORMALIZED)
            zzn2_sqr_i(&(P->z),&(P->z));
        else
            zzn2_from_zzn(mr_mip->one,&(P->z));

		zzn2_tim2_i(&(P->z));
   
        zzn2_imul_i(mr_mip->Bsize,&(P->z));
        if (twist)
		{
			zzn2_txx_i(&(P->z));
			zzn2_txx_i(&(P->y));
		}
        zzn2_add_i(&(P->x),&(P->y),&t3);
        zzn2_sub_i(&(P->x),&(P->y),&t4);
        zzn2_mul_i(&t3,&t4,&(P->x));

        zzn2_sub_i(&t3,&(P->z),&t3);
        zzn2_mul_i(&t2,&t3,&(P->y));
        zzn2_mul_i(&t2,&t4,&(P->z));
		P->marker=MR_EPOINT_GENERAL;
    }
   
    MR_OUT
    return Doubling;
}

void ecn2_negate(_MIPD_ ecn2 *u,ecn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    ecn2_copy(u,w);
    if (w->marker!=MR_EPOINT_INFINITY)
        zzn2_negate(_MIPP_ &(w->x),&(w->x));
}

BOOL ecn2_sub(_MIPD_ ecn2 *Q,ecn2 *P)
{
    BOOL Doubling;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    zzn2 lam;

    lam.a = mr_mip->w14;
    lam.b = mr_mip->w15;

    ecn2_negate(_MIPP_ Q,Q);

    Doubling=ecn2_add(_MIPP_ Q,P);

    ecn2_negate(_MIPP_ Q,Q);

    return Doubling;
}

/*

BOOL ecn2_add_sub(_MIPD_ ecn2 *P,ecn2 *Q,ecn2 *PP,ecn2 *PM)
{  PP=P+Q, PM=P-Q. Assumes P and Q are both normalized, and P!=Q 
 #ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    zzn2 t1,t2,lam;

    if (mr_mip->ERNUM) return FALSE;

    PP->marker=MR_EPOINT_NORMALIZED;
    PM->marker=MR_EPOINT_NORMALIZED;

    return TRUE;
}

*/

/* Precomputation of  3P, 5P, 7P etc. into PT. Assume PT[0] contains P */

#define MR_PRE_2 (6+2*MR_MAX_M_T_S)

static void ecn2_pre(_MIPD_ int sz,BOOL norm,ecn2 *PT)
{
    int i,j;
    ecn2 P2;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

#ifndef MR_STATIC
	zzn2 *work=(zzn2 *)mr_alloc(_MIPP_ sz,sizeof(zzn2));
    char *mem = memalloc(_MIPP_ 6+2*sz);
#else
	zzn2 work[MR_MAX_M_T_S];
    char mem[MR_BIG_RESERVE(MR_PRE_2)];
    memset(mem, 0, MR_BIG_RESERVE(MR_PRE_2));
#endif
    j=0;
    P2.x.a=mirvar_mem(_MIPP_ mem, j++);
    P2.x.b=mirvar_mem(_MIPP_ mem, j++);
    P2.y.a=mirvar_mem(_MIPP_ mem, j++);
    P2.y.b=mirvar_mem(_MIPP_ mem, j++);
    P2.z.a=mirvar_mem(_MIPP_ mem, j++);
    P2.z.b=mirvar_mem(_MIPP_ mem, j++);

    for (i=0;i<sz;i++)
    {
        work[i].a= mirvar_mem(_MIPP_ mem, j++);
        work[i].b= mirvar_mem(_MIPP_ mem, j++);
    }

    ecn2_copy(&PT[0],&P2);
    ecn2_add(_MIPP_ &P2,&P2);
    for (i=1;i<sz;i++)
    {
        ecn2_copy(&PT[i-1],&PT[i]);
        ecn2_add(_MIPP_ &P2,&PT[i]);
    }
	if (norm) ecn2_multi_norm(_MIPP_ sz,work,PT);

#ifndef MR_STATIC
    memkill(_MIPP_ mem, 6+2*sz);
	mr_free(work);
#else
    memset(mem, 0, MR_BIG_RESERVE(MR_PRE_2));
#endif
}

#ifndef MR_DOUBLE_BIG
#define MR_MUL_RESERVE (1+6*MR_ECC_STORE_N2)
#else
#define MR_MUL_RESERVE (2+6*MR_ECC_STORE_N2)
#endif

int ecn2_mul(_MIPD_ big k,ecn2 *P)
{
    int i,j,nb,n,nbs,nzs,nadds;
    big h;
    ecn2 T[MR_ECC_STORE_N2];
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

#ifndef MR_STATIC
    char *mem = memalloc(_MIPP_ MR_MUL_RESERVE);
#else
    char mem[MR_BIG_RESERVE(MR_MUL_RESERVE)];
    memset(mem, 0, MR_BIG_RESERVE(MR_MUL_RESERVE));
#endif

    j=0;
#ifndef MR_DOUBLE_BIG
    h=mirvar_mem(_MIPP_ mem, j++);
#else
    h=mirvar_mem(_MIPP_ mem, j); j+=2;
#endif
    for (i=0;i<MR_ECC_STORE_N2;i++)
    {
        T[i].x.a= mirvar_mem(_MIPP_ mem, j++);
        T[i].x.b= mirvar_mem(_MIPP_ mem, j++);
        T[i].y.a= mirvar_mem(_MIPP_ mem, j++);
        T[i].y.b= mirvar_mem(_MIPP_ mem, j++);
        T[i].z.a= mirvar_mem(_MIPP_ mem, j++);
        T[i].z.b= mirvar_mem(_MIPP_ mem, j++);
    }

    MR_IN(207)

    ecn2_norm(_MIPP_ P);

	nadds=0;
    premult(_MIPP_ k,3,h);
    ecn2_copy(P,&T[0]);
    ecn2_pre(_MIPP_ MR_ECC_STORE_N2,FALSE,T);
    nb=logb2(_MIPP_ h);

    ecn2_zero(P);

    for (i=nb-1;i>=1;)
    {
        if (mr_mip->user!=NULL) (*mr_mip->user)();
        n=mr_naf_window(_MIPP_ k,h,i,&nbs,&nzs,MR_ECC_STORE_N2);
 
        for (j=0;j<nbs;j++) ecn2_add(_MIPP_ P,P);
       
        if (n>0) {nadds++; ecn2_add(_MIPP_ &T[n/2],P);}
        if (n<0) {nadds++; ecn2_sub(_MIPP_ &T[(-n)/2],P);}
        i-=nbs;
        if (nzs)
        {
            for (j=0;j<nzs;j++) ecn2_add(_MIPP_ P,P);
            i-=nzs;
        }
    }

    ecn2_norm(_MIPP_ P);
    MR_OUT

#ifndef MR_STATIC
    memkill(_MIPP_ mem, MR_MUL_RESERVE);
#else
    memset(mem, 0, MR_BIG_RESERVE(MR_MUL_RESERVE));
#endif
	return nadds;
}

/* Double addition, using Joint Sparse Form */
/* R=aP+bQ */

#define MR_MUL2_JSF_RESERVE 24

int ecn2_mul2_jsf(_MIPD_ big a,ecn2 *P,big b,ecn2 *Q,ecn2 *R)
{
    int e1,h1,e2,h2,bb,nadds;
    ecn2 P1,P2,PS,PD;
    big c,d,e,f;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

#ifndef MR_STATIC
    char *mem = memalloc(_MIPP_ MR_MUL2_JSF_RESERVE);
#else
    char mem[MR_BIG_RESERVE(MR_MUL2_JSF_RESERVE)];
    memset(mem, 0, MR_BIG_RESERVE(MR_MUL2_JSF_RESERVE));
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
    PS.z.a= mirvar_mem(_MIPP_ mem, 16);
    PS.z.b= mirvar_mem(_MIPP_ mem, 17);
    PD.x.a= mirvar_mem(_MIPP_ mem, 18);
    PD.x.b= mirvar_mem(_MIPP_ mem, 19);
    PD.y.a= mirvar_mem(_MIPP_ mem, 20);
    PD.y.b= mirvar_mem(_MIPP_ mem, 21);
    PD.z.a= mirvar_mem(_MIPP_ mem, 22);
    PD.z.b= mirvar_mem(_MIPP_ mem, 23);

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

    /*ecn2_add_sub(_MIPP_ &P1,&P2,&PS,&PD);*/

    ecn2_copy(&P1,&PS);
    ecn2_copy(&P1,&PD);
    ecn2_add(_MIPP_ &P2,&PS);
    ecn2_sub(_MIPP_ &P2,&PD);

    ecn2_zero(R);
	nadds=0;
   
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
                if (h1==1) {ecn2_add(_MIPP_ &P1,R); nadds++;}
                else       {ecn2_sub(_MIPP_ &P1,R); nadds++;}
            }
            else
            {
                if (h1==1)
                {
                    if (h2==1) {ecn2_add(_MIPP_ &PS,R); nadds++;}
                    else       {ecn2_add(_MIPP_ &PD,R); nadds++;}
                }
                else
                {
                    if (h2==1) {ecn2_sub(_MIPP_ &PD,R); nadds++;}
                    else       {ecn2_sub(_MIPP_ &PS,R); nadds++;}
                }
            }
        }
        else if (e2!=h2)
        {
            if (h2==1) {ecn2_add(_MIPP_ &P2,R); nadds++;}
            else       {ecn2_sub(_MIPP_ &P2,R); nadds++;}
        }
        bb-=1;
    }
    ecn2_norm(_MIPP_ R); 

    MR_OUT
#ifndef MR_STATIC
    memkill(_MIPP_ mem, MR_MUL2_JSF_RESERVE);
#else
    memset(mem, 0, MR_BIG_RESERVE(MR_MUL2_JSF_RESERVE));
#endif
	return nadds;

}

/* General purpose multi-exponentiation engine, using inter-leaving algorithm. Calculate aP+bQ+cR+dS...
   Inputs are divided into two groups of sizes wa<4 and wb<4. For the first group if the points are fixed the 
   first precomputed Table Ta[] may be taken from ROM. For the second group if the points are variable Tb[j] will
   have to computed online. Each group has its own precomputed store size, sza (=8?) and szb (=20?) respectively. 
   The values a,b,c.. are provided in ma[] and mb[], and 3.a,3.b,3.c (as required by the NAF) are provided in 
   ma3[] and mb3[]. If only one group is required, set wb=0 and pass NULL pointers.
   */

int ecn2_muln_engine(_MIPD_ int wa,int sza,int wb,int szb,big *ma,big *ma3,big *mb,big *mb3,ecn2 *Ta,ecn2 *Tb,ecn2 *R)
{ /* general purpose interleaving algorithm engine for multi-exp */
    int i,j,tba[4],pba[4],na[4],sa[4],tbb[4],pbb[4],nb[4],sb[4],nbits,nbs,nzs;
    int nadds;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    ecn2_zero(R);

    nbits=0;
    for (i=0;i<wa;i++) {sa[i]=exsign(ma[i]); tba[i]=0; j=logb2(_MIPP_ ma3[i]); if (j>nbits) nbits=j; }
    for (i=0;i<wb;i++) {sb[i]=exsign(mb[i]); tbb[i]=0; j=logb2(_MIPP_ mb3[i]); if (j>nbits) nbits=j; }
    
    nadds=0;
    for (i=nbits-1;i>=1;i--)
    {
        if (mr_mip->user!=NULL) (*mr_mip->user)();
        if (R->marker!=MR_EPOINT_INFINITY) ecn2_add(_MIPP_ R,R);
        for (j=0;j<wa;j++)
        { /* deal with the first group */
            if (tba[j]==0)
            {
                na[j]=mr_naf_window(_MIPP_ ma[j],ma3[j],i,&nbs,&nzs,sza);
                tba[j]=nbs+nzs;
                pba[j]=nbs;
            }
            tba[j]--;  pba[j]--; 
            if (pba[j]==0)
            {
                if (sa[j]==PLUS)
                {
                    if (na[j]>0) {ecn2_add(_MIPP_ &Ta[j*sza+na[j]/2],R); nadds++;}
                    if (na[j]<0) {ecn2_sub(_MIPP_ &Ta[j*sza+(-na[j])/2],R); nadds++;}
                }
                else
                {
                    if (na[j]>0) {ecn2_sub(_MIPP_ &Ta[j*sza+na[j]/2],R); nadds++;}
                    if (na[j]<0) {ecn2_add(_MIPP_ &Ta[j*sza+(-na[j])/2],R); nadds++;}
                }
            }         
        }
        for (j=0;j<wb;j++)
        { /* deal with the second group */
            if (tbb[j]==0)
            {
                nb[j]=mr_naf_window(_MIPP_ mb[j],mb3[j],i,&nbs,&nzs,szb);
                tbb[j]=nbs+nzs;
                pbb[j]=nbs;
            }
            tbb[j]--;  pbb[j]--; 
            if (pbb[j]==0)
            {
                if (sb[j]==PLUS)
                {
                    if (nb[j]>0) {ecn2_add(_MIPP_ &Tb[j*szb+nb[j]/2],R);  nadds++;}
                    if (nb[j]<0) {ecn2_sub(_MIPP_ &Tb[j*szb+(-nb[j])/2],R);  nadds++;}
                }
                else
                {
                    if (nb[j]>0) {ecn2_sub(_MIPP_ &Tb[j*szb+nb[j]/2],R);  nadds++;}
                    if (nb[j]<0) {ecn2_add(_MIPP_ &Tb[j*szb+(-nb[j])/2],R);  nadds++;}
                }
            }         
        }
    }
    ecn2_norm(_MIPP_ R);  
    return nadds;
}

/* Routines to support Galbraith, Lin, Scott (GLS) method for ECC */
/* requires an endomorphism psi */

/* *********************** */

/* Precompute T - first half from i.P, second half from i.psi(P) */
/* norm=TRUE if the table is to be normalised - which it should be */
/* if it is to be calculated off-line */

void ecn2_precomp_gls(_MIPD_ int sz,BOOL norm,ecn2 *P,zzn2 *psi,ecn2 *T)
{
    int i,j;

#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    j=0;

    MR_IN(219)

    ecn2_norm(_MIPP_ P);
    ecn2_copy(P,&T[0]);

    ecn2_pre(_MIPP_ sz,norm,T); /* precompute table */
    for (i=sz;i<sz+sz;i++)
    {
        ecn2_copy(&T[i-sz],&T[i]);
        ecn2_psi(_MIPP_ psi,&T[i]);
    }

    MR_OUT
}

/* Calculate a[0].P+a[1].psi(P) using interleaving method */

#define MR_MUL2_GLS_RESERVE (2+2*MR_ECC_STORE_N2*6)

int ecn2_mul2_gls(_MIPD_ big *a,ecn2 *P,zzn2 *psi,ecn2 *R)
{
    int i,j,nadds;
    ecn2 T[2*MR_ECC_STORE_N2];
    big a3[2];
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

#ifndef MR_STATIC
    char *mem = memalloc(_MIPP_ MR_MUL2_GLS_RESERVE);
#else
    char mem[MR_BIG_RESERVE(MR_MUL2_GLS_RESERVE)];       
 	memset(mem, 0, MR_BIG_RESERVE(MR_MUL2_GLS_RESERVE));   
#endif

    for (j=i=0;i<2;i++)
        a3[i]=mirvar_mem(_MIPP_ mem, j++);

    for (i=0;i<2*MR_ECC_STORE_N2;i++)
    {
        T[i].x.a=mirvar_mem(_MIPP_  mem, j++);
        T[i].x.b=mirvar_mem(_MIPP_  mem, j++);
        T[i].y.a=mirvar_mem(_MIPP_  mem, j++);
        T[i].y.b=mirvar_mem(_MIPP_  mem, j++);  
        T[i].z.a=mirvar_mem(_MIPP_  mem, j++);
        T[i].z.b=mirvar_mem(_MIPP_  mem, j++);          
        T[i].marker=MR_EPOINT_INFINITY;
    }
    MR_IN(220)

    ecn2_precomp_gls(_MIPP_ MR_ECC_STORE_N2,FALSE,P,psi,T);

    for (i=0;i<2;i++) premult(_MIPP_ a[i],3,a3[i]); /* calculate for NAF */

    nadds=ecn2_muln_engine(_MIPP_ 0,0,2,MR_ECC_STORE_N2,NULL,NULL,a,a3,NULL,T,R);

    ecn2_norm(_MIPP_ R);

    MR_OUT

#ifndef MR_STATIC
    memkill(_MIPP_ mem, MR_MUL2_GLS_RESERVE);
#else
    memset(mem, 0, MR_BIG_RESERVE(MR_MUL2_GLS_RESERVE));
#endif
    return nadds;
}

/* Calculates a[0]*P+a[1]*psi(P) + b[0]*Q+b[1]*psi(Q) 
   where P is fixed, and precomputations are already done off-line into FT
   using ecn2_precomp_gls. Useful for signature verification */

#define MR_MUL4_GLS_V_RESERVE (4+2*MR_ECC_STORE_N2*6)

int ecn2_mul4_gls_v(_MIPD_ big *a,int ns,ecn2 *FT,big *b,ecn2 *Q,zzn2 *psi,ecn2 *R)
{ 
    int i,j,nadds;
    ecn2 VT[2*MR_ECC_STORE_N2];
    big a3[2],b3[2];
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

#ifndef MR_STATIC
    char *mem = memalloc(_MIPP_ MR_MUL4_GLS_V_RESERVE);
#else
    char mem[MR_BIG_RESERVE(MR_MUL4_GLS_V_RESERVE)];       
 	memset(mem, 0, MR_BIG_RESERVE(MR_MUL4_GLS_V_RESERVE));   
#endif
    j=0;
    for (i=0;i<2;i++)
    {
        a3[i]=mirvar_mem(_MIPP_ mem, j++);
        b3[i]=mirvar_mem(_MIPP_ mem, j++);
    }
    for (i=0;i<2*MR_ECC_STORE_N2;i++)
    {
        VT[i].x.a=mirvar_mem(_MIPP_  mem, j++);
        VT[i].x.b=mirvar_mem(_MIPP_  mem, j++);
        VT[i].y.a=mirvar_mem(_MIPP_  mem, j++);
        VT[i].y.b=mirvar_mem(_MIPP_  mem, j++);  
        VT[i].z.a=mirvar_mem(_MIPP_  mem, j++);
        VT[i].z.b=mirvar_mem(_MIPP_  mem, j++);         
        VT[i].marker=MR_EPOINT_INFINITY;
    }

    MR_IN(217)

    ecn2_precomp_gls(_MIPP_ MR_ECC_STORE_N2,FALSE,Q,psi,VT); /* precompute for the variable points */
    for (i=0;i<2;i++)
    { /* needed for NAF */
        premult(_MIPP_ a[i],3,a3[i]);
        premult(_MIPP_ b[i],3,b3[i]);
    }
    nadds=ecn2_muln_engine(_MIPP_ 2,ns,2,MR_ECC_STORE_N2,a,a3,b,b3,FT,VT,R);
    ecn2_norm(_MIPP_ R);

    MR_OUT

#ifndef MR_STATIC
    memkill(_MIPP_ mem, MR_MUL4_GLS_V_RESERVE);
#else
    memset(mem, 0, MR_BIG_RESERVE(MR_MUL4_GLS_V_RESERVE));
#endif
    return nadds;
}

/* Calculate a.P+b.Q using interleaving method. P is fixed and T is precomputed from it */

void ecn2_precomp(_MIPD_ int sz,BOOL norm,ecn2 *P,ecn2 *T)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    MR_IN(216)

    ecn2_norm(_MIPP_ P);
    ecn2_copy(P,&T[0]);
    ecn2_pre(_MIPP_ sz,norm,T); 

    MR_OUT
}

#ifndef MR_DOUBLE_BIG
#define MR_MUL2_RESERVE (2+2*MR_ECC_STORE_N2*6)
#else
#define MR_MUL2_RESERVE (4+2*MR_ECC_STORE_N2*6)
#endif

int ecn2_mul2(_MIPD_ big a,int ns,ecn2 *FT,big b,ecn2 *Q,ecn2 *R)
{
    int i,j,nadds;
    ecn2 T[2*MR_ECC_STORE_N2];
    big a3,b3;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

#ifndef MR_STATIC
    char *mem = memalloc(_MIPP_ MR_MUL2_RESERVE);
#else
    char mem[MR_BIG_RESERVE(MR_MUL2_RESERVE)];       
 	memset(mem, 0, MR_BIG_RESERVE(MR_MUL2_RESERVE));   
#endif

    j=0;
#ifndef MR_DOUBLE_BIG
    a3=mirvar_mem(_MIPP_ mem, j++);
	b3=mirvar_mem(_MIPP_ mem, j++);
#else
    a3=mirvar_mem(_MIPP_ mem, j); j+=2;
	b3=mirvar_mem(_MIPP_ mem, j); j+=2;
#endif    
    for (i=0;i<2*MR_ECC_STORE_N2;i++)
    {
        T[i].x.a=mirvar_mem(_MIPP_  mem, j++);
        T[i].x.b=mirvar_mem(_MIPP_  mem, j++);
        T[i].y.a=mirvar_mem(_MIPP_  mem, j++);
        T[i].y.b=mirvar_mem(_MIPP_  mem, j++); 
        T[i].z.a=mirvar_mem(_MIPP_  mem, j++);
        T[i].z.b=mirvar_mem(_MIPP_  mem, j++);        
        T[i].marker=MR_EPOINT_INFINITY;
    }

    MR_IN(218)

    ecn2_precomp(_MIPP_ MR_ECC_STORE_N2,FALSE,Q,T);

    premult(_MIPP_ a,3,a3); 
	premult(_MIPP_ b,3,b3); 

    nadds=ecn2_muln_engine(_MIPP_ 1,ns,1,MR_ECC_STORE_N2,&a,&a3,&b,&b3,FT,T,R);

    ecn2_norm(_MIPP_ R);

    MR_OUT

#ifndef MR_STATIC
    memkill(_MIPP_ mem, MR_MUL2_RESERVE);
#else
    memset(mem, 0, MR_BIG_RESERVE(MR_MUL2_RESERVE));
#endif
    return nadds;
}


#ifndef MR_STATIC

BOOL ecn2_brick_init(_MIPD_ ebrick *B,zzn2 *x,zzn2 *y,big a,big b,big n,int window,int nb)
{ /* Uses Montgomery arithmetic internally              *
   * (x,y) is the fixed base                            *
   * a,b and n are parameters and modulus of the curve  *
   * window is the window size in bits and              *
   * nb is the maximum number of bits in the multiplier */
    int i,j,k,t,bp,len,bptr;
    ecn2 *table;
    ecn2 w;

#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    if (nb<2 || window<1 || window>nb || mr_mip->ERNUM) return FALSE;

    t=MR_ROUNDUP(nb,window);

    if (t<2) return FALSE;

    MR_IN(221)

#ifndef MR_ALWAYS_BINARY
    if (mr_mip->base != mr_mip->base2)
    {
        mr_berror(_MIPP_ MR_ERR_NOT_SUPPORTED);
        MR_OUT
        return FALSE;
    }
#endif

    B->window=window;
    B->max=nb;
    table=mr_alloc(_MIPP_ (1<<window),sizeof(ecn2));
    if (table==NULL)
    {
        mr_berror(_MIPP_ MR_ERR_OUT_OF_MEMORY);   
        MR_OUT
        return FALSE;
    }
    B->a=mirvar(_MIPP_ 0);
    B->b=mirvar(_MIPP_ 0);
    B->n=mirvar(_MIPP_ 0);
    copy(a,B->a);
    copy(b,B->b);
    copy(n,B->n);

    ecurve_init(_MIPP_ a,b,n,MR_BEST);
    mr_mip->TWIST=TRUE;

    w.x.a=mirvar(_MIPP_ 0);
    w.x.b=mirvar(_MIPP_ 0);
    w.y.a=mirvar(_MIPP_ 0);
    w.y.b=mirvar(_MIPP_ 0);
    w.z.a=mirvar(_MIPP_ 0);
    w.z.b=mirvar(_MIPP_ 0);

    w.marker=MR_EPOINT_INFINITY;
    ecn2_set(_MIPP_ x,y,&w);

    table[0].x.a=mirvar(_MIPP_ 0);
    table[0].x.b=mirvar(_MIPP_ 0);
    table[0].y.a=mirvar(_MIPP_ 0);
    table[0].y.b=mirvar(_MIPP_ 0);
    table[0].z.a=mirvar(_MIPP_ 0);
    table[0].z.b=mirvar(_MIPP_ 0);
    table[0].marker=MR_EPOINT_INFINITY;
    table[1].x.a=mirvar(_MIPP_ 0);
    table[1].x.b=mirvar(_MIPP_ 0);
    table[1].y.a=mirvar(_MIPP_ 0);
    table[1].y.b=mirvar(_MIPP_ 0);
    table[1].z.a=mirvar(_MIPP_ 0);
    table[1].z.b=mirvar(_MIPP_ 0);
    table[1].marker=MR_EPOINT_INFINITY;

    ecn2_copy(&w,&table[1]);
    for (j=0;j<t;j++)
        ecn2_add(_MIPP_ &w,&w);

    k=1;
    for (i=2;i<(1<<window);i++)
    {
        table[i].x.a=mirvar(_MIPP_ 0);
        table[i].x.b=mirvar(_MIPP_ 0);
        table[i].y.a=mirvar(_MIPP_ 0);
        table[i].y.b=mirvar(_MIPP_ 0);
        table[i].z.a=mirvar(_MIPP_ 0);
        table[i].z.b=mirvar(_MIPP_ 0);
        table[i].marker=MR_EPOINT_INFINITY;
        if (i==(1<<k))
        {
            k++;
			ecn2_norm(_MIPP_ &w);
            ecn2_copy(&w,&table[i]);
            
            for (j=0;j<t;j++)
                ecn2_add(_MIPP_ &w,&w);
            continue;
        }
        bp=1;
        for (j=0;j<k;j++)
        {
            if (i&bp)
                ecn2_add(_MIPP_ &table[1<<j],&table[i]);
            bp<<=1;
        }
        ecn2_norm(_MIPP_ &table[i]);
    }
    mr_free(w.x.a);
    mr_free(w.x.b);
    mr_free(w.y.a);
    mr_free(w.y.b);
    mr_free(w.z.a);
    mr_free(w.z.b);

/* create the table */

    len=n->len;
    bptr=0;
    B->table=mr_alloc(_MIPP_ 4*len*(1<<window),sizeof(mr_small));

    for (i=0;i<(1<<window);i++)
    {
        for (j=0;j<len;j++) B->table[bptr++]=table[i].x.a->w[j];
        for (j=0;j<len;j++) B->table[bptr++]=table[i].x.b->w[j];

        for (j=0;j<len;j++) B->table[bptr++]=table[i].y.a->w[j];
        for (j=0;j<len;j++) B->table[bptr++]=table[i].y.b->w[j];

        mr_free(table[i].x.a);
        mr_free(table[i].x.b);
        mr_free(table[i].y.a);
        mr_free(table[i].y.b);
        mr_free(table[i].z.a);
        mr_free(table[i].z.b);
    }
        
    mr_free(table);  

    MR_OUT
    return TRUE;
}

void ecn2_brick_end(ebrick *B)
{
    mirkill(B->n);
    mirkill(B->b);
    mirkill(B->a);
    mr_free(B->table);  
}

#else

/* use precomputated table in ROM */

void ecn2_brick_init(ebrick *B,const mr_small* rom,big a,big b,big n,int window,int nb)
{
    B->table=rom;
    B->a=a; /* just pass a pointer */
    B->b=b;
    B->n=n;
    B->window=window;  /* 2^4=16  stored values */
    B->max=nb;
}

#endif

/*
void ecn2_mul_brick(_MIPD_ ebrick *B,big e,zzn2 *x,zzn2 *y)
{
    int i,j,t,len,maxsize,promptr;
    ecn2 w,z;
 
#ifdef MR_STATIC
    char mem[MR_BIG_RESERVE(10)];
#else
    char *mem;
#endif
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    if (size(e)<0) mr_berror(_MIPP_ MR_ERR_NEG_POWER);
    t=MR_ROUNDUP(B->max,B->window);
    
    MR_IN(116)

#ifndef MR_ALWAYS_BINARY
    if (mr_mip->base != mr_mip->base2)
    {
        mr_berror(_MIPP_ MR_ERR_NOT_SUPPORTED);
        MR_OUT
        return;
    }
#endif

    if (logb2(_MIPP_ e) > B->max)
    {
        mr_berror(_MIPP_ MR_ERR_EXP_TOO_BIG);
        MR_OUT
        return;
    }

    ecurve_init(_MIPP_ B->a,B->b,B->n,MR_BEST);
    mr_mip->TWIST=TRUE;
  
#ifdef MR_STATIC
    memset(mem,0,MR_BIG_RESERVE(10));
#else
    mem=memalloc(_MIPP_ 10);
#endif

    w.x.a=mirvar_mem(_MIPP_  mem, 0);
    w.x.b=mirvar_mem(_MIPP_  mem, 1);
    w.y.a=mirvar_mem(_MIPP_  mem, 2);
    w.y.b=mirvar_mem(_MIPP_  mem, 3);  
    w.z.a=mirvar_mem(_MIPP_  mem, 4);
    w.z.b=mirvar_mem(_MIPP_  mem, 5);      
    w.marker=MR_EPOINT_INFINITY;
    z.x.a=mirvar_mem(_MIPP_  mem, 6);
    z.x.b=mirvar_mem(_MIPP_  mem, 7);
    z.y.a=mirvar_mem(_MIPP_  mem, 8);
    z.y.b=mirvar_mem(_MIPP_  mem, 9);       
    z.marker=MR_EPOINT_INFINITY;

    len=B->n->len;
    maxsize=4*(1<<B->window)*len;

    for (i=t-1;i>=0;i--)
    {
        j=recode(_MIPP_ e,t,B->window,i);
        ecn2_add(_MIPP_ &w,&w);
        if (j>0)
        {
            promptr=4*j*len;
            init_big_from_rom(z.x.a,len,B->table,maxsize,&promptr);
            init_big_from_rom(z.x.b,len,B->table,maxsize,&promptr);
            init_big_from_rom(z.y.a,len,B->table,maxsize,&promptr);
            init_big_from_rom(z.y.b,len,B->table,maxsize,&promptr);
            z.marker=MR_EPOINT_NORMALIZED;
            ecn2_add(_MIPP_ &z,&w);
        }
    }
    ecn2_norm(_MIPP_ &w);
    ecn2_getxy(&w,x,y);
#ifndef MR_STATIC
    memkill(_MIPP_ mem,10);
#else
    memset(mem,0,MR_BIG_RESERVE(10));
#endif
    MR_OUT
}
*/

void ecn2_mul_brick_gls(_MIPD_ ebrick *B,big *e,zzn2 *psi,zzn2 *x,zzn2 *y)
{
    int i,j,k,t,len,maxsize,promptr,se[2];
    ecn2 w,z;
 
#ifdef MR_STATIC
    char mem[MR_BIG_RESERVE(10)];
#else
    char *mem;
#endif
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif

    for (k=0;k<2;k++) se[k]=exsign(e[k]);

    t=MR_ROUNDUP(B->max,B->window);
    
    MR_IN(222)

#ifndef MR_ALWAYS_BINARY
    if (mr_mip->base != mr_mip->base2)
    {
        mr_berror(_MIPP_ MR_ERR_NOT_SUPPORTED);
        MR_OUT
        return;
    }
#endif

    if (logb2(_MIPP_ e[0])>B->max || logb2(_MIPP_ e[1])>B->max)
    {
        mr_berror(_MIPP_ MR_ERR_EXP_TOO_BIG);
        MR_OUT
        return;
    }

    ecurve_init(_MIPP_ B->a,B->b,B->n,MR_BEST);
    mr_mip->TWIST=TRUE;
  
#ifdef MR_STATIC
    memset(mem,0,MR_BIG_RESERVE(10));
#else
    mem=memalloc(_MIPP_ 10);
#endif

    z.x.a=mirvar_mem(_MIPP_  mem, 0);
    z.x.b=mirvar_mem(_MIPP_  mem, 1);
    z.y.a=mirvar_mem(_MIPP_  mem, 2);
    z.y.b=mirvar_mem(_MIPP_  mem, 3);       
    z.marker=MR_EPOINT_INFINITY;

    w.x.a=mirvar_mem(_MIPP_  mem, 4);
    w.x.b=mirvar_mem(_MIPP_  mem, 5);
    w.y.a=mirvar_mem(_MIPP_  mem, 6);
    w.y.b=mirvar_mem(_MIPP_  mem, 7);  
    w.z.a=mirvar_mem(_MIPP_  mem, 8);
    w.z.b=mirvar_mem(_MIPP_  mem, 9); 
    w.marker=MR_EPOINT_INFINITY;

    len=B->n->len;
    maxsize=4*(1<<B->window)*len;

    for (i=t-1;i>=0;i--)
    {
        ecn2_add(_MIPP_ &w,&w);
        for (k=0;k<2;k++)
        {
            j=recode(_MIPP_ e[k],t,B->window,i);
            if (j>0)
            {
                promptr=4*j*len;
                init_big_from_rom(z.x.a,len,B->table,maxsize,&promptr);
                init_big_from_rom(z.x.b,len,B->table,maxsize,&promptr);
                init_big_from_rom(z.y.a,len,B->table,maxsize,&promptr);
                init_big_from_rom(z.y.b,len,B->table,maxsize,&promptr);
                z.marker=MR_EPOINT_NORMALIZED;
                if (k==1) ecn2_psi(_MIPP_ psi,&z);
                if (se[k]==PLUS) ecn2_add(_MIPP_ &z,&w);
                else             ecn2_sub(_MIPP_ &z,&w);
            }
        }      
    }
    ecn2_norm(_MIPP_ &w);
    ecn2_getxy(&w,x,y);
#ifndef MR_STATIC
    memkill(_MIPP_ mem,10);
#else
    memset(mem,0,MR_BIG_RESERVE(10));
#endif
    MR_OUT
}
