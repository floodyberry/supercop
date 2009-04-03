/*
 *  No mattter where you got this code, be aware that MIRACL is NOT
 *  free software. For commercial use a license is required.
 *	See www.shamus.ie
 *
 *   MIRACL F_p^2 support functions 
 *   mrzzn2.c
 *
 *   Copyright (c) 2006 Shamus Software Ltd.
 */

#include <stdlib.h> 
#include "miracl.h"

BOOL zzn2_iszero(zzn2 *x)
{

    if (x->a->len==0 && x->b->len==0) return TRUE;
	return FALSE;
    
    //if (size(x->a)==0 && size(x->b)==0) return TRUE;
    //return FALSE;

}

void zzn2_sub(_MIPD_ zzn2 *x,zzn2 *y,zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(160)
#ifdef P64_1271
#ifdef MR_COUNT_OPS
fpa+=2; 
#endif
    modsub(x->a->w,y->a->w,w->a->w);
	modsub(x->b->w,y->b->w,w->b->w);
	w->a->len=2;
	w->b->len=2;
#else
    nres_modsub(_MIPP_ x->a,y->a,w->a);
    nres_modsub(_MIPP_ x->b,y->b,w->b);
#endif
	MR_OUT
}

void zzn2_add(_MIPD_ zzn2 *x,zzn2 *y,zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(159)
#ifdef P64_1271
#ifdef MR_COUNT_OPS
fpa+=2; 
#endif
    modadd(x->a->w,y->a->w,w->a->w);
	modadd(x->b->w,y->b->w,w->b->w);
	w->a->len=2;
	w->b->len=2;
#else
    nres_modadd(_MIPP_ x->a,y->a,w->a);
    nres_modadd(_MIPP_ x->b,y->b,w->b);
#endif
	MR_OUT
}

BOOL zzn2_isunity(_MIPD_ zzn2 *x)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM || size(x->b)!=0) return FALSE;
    MR_IN(155)

    redc(_MIPP_ x->a,mr_mip->w1);

    MR_OUT
    if (size(mr_mip->w1)==1) return TRUE;
    return FALSE;
}

BOOL zzn2_compare(zzn2 *x,zzn2 *y)
{
    if (mr_compare(x->a,y->a)==0 && mr_compare(x->b,y->b)==0) return TRUE;
    return FALSE;
}

void zzn2_from_int(_MIPD_ int i,zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;

    MR_IN(156)
    convert(_MIPP_ i,mr_mip->w1);
    nres(_MIPP_ mr_mip->w1,w->a);
    zero(w->b);
    MR_OUT
}

void zzn2_from_ints(_MIPD_ int i,int j,zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;

    MR_IN(168)
    convert(_MIPP_ i,mr_mip->w1);
    nres(_MIPP_ mr_mip->w1,w->a);
    convert(_MIPP_ j,mr_mip->w1);
    nres(_MIPP_ mr_mip->w1,w->b);

    MR_OUT
}

void zzn2_from_zzns(big x,big y,zzn2 *w)
{
    copy(x,w->a);
    copy(y,w->b);
}

void zzn2_from_bigs(_MIPD_ big x,big y, zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;

    MR_IN(166)
    nres(_MIPP_ x,w->a);
    nres(_MIPP_ y,w->b);
    MR_OUT
}

void zzn2_from_zzn(big x,zzn2 *w)
{
    copy(x,w->a);
    zero(w->b);
}

void zzn2_from_big(_MIPD_ big x, zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;

    MR_IN(167)
    nres(_MIPP_ x,w->a);
    zero(w->b);
    MR_OUT
}

void zzn2_zero(zzn2 *w)
{
    zero(w->a);
    zero(w->b);
}

void zzn2_negate(_MIPD_ zzn2 *x,zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(157)
    zzn2_copy(x,w);
#ifdef P64_1271
	modneg(w->a->w);
    modneg(w->b->w);
#else
    nres_negate(_MIPP_ w->a,w->a);
    nres_negate(_MIPP_ w->b,w->b);
#endif
    MR_OUT
}

void zzn2_conj(_MIPD_ zzn2 *x,zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    MR_IN(158)
    if (mr_mip->ERNUM) return;
    zzn2_copy(x,w);
    nres_negate(_MIPP_ w->b,w->b);
    MR_OUT
}

void zzn2_copy(zzn2 *x,zzn2 *w)
{
    if (x==w) return;

    w->a->len=x->a->len;
    w->a->w[0]=x->a->w[0];
    w->a->w[1]=x->a->w[1];
    w->b->len=x->b->len;
    w->b->w[0]=x->b->w[0];
    w->b->w[1]=x->b->w[1];

}

  
void zzn2_sadd(_MIPD_ zzn2 *x,big y,zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(169)
    nres_modadd(_MIPP_ x->a,y,w->a);
    MR_OUT
}              


void zzn2_ssub(_MIPD_ zzn2 *x,big y,zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(170)
    nres_modsub(_MIPP_ x->a,y,w->a);
    MR_OUT
}

void zzn2_smul(_MIPD_ zzn2 *x,big y,zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(161)
    if (size(x->a)!=0) nres_modmult(_MIPP_ x->a,y,w->a);
    else zero(w->a);
    if (size(x->b)!=0) nres_modmult(_MIPP_ x->b,y,w->b);
    else zero(w->b);
    MR_OUT
}

void zzn2_imul(_MIPD_ zzn2 *x,int y,zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(152)
    if (size(x->a)!=0) nres_premult(_MIPP_ x->a,y,w->a);
    else zero(w->a);
    if (size(x->b)!=0) nres_premult(_MIPP_ x->b,y,w->b);
    else zero(w->b);
    MR_OUT
}


/*
static void nres_print(_MIPD_ char *label, big x)
{
    char s[1024];
    big a;
#ifdef MR_STATIC
    char mem_big[MR_BIG_RESERVE(1)];     
 	memset(mem_big, 0, MR_BIG_RESERVE(1)); 
    a=mirvar_mem(_MIPP_ mem_big,0);
#else
    a = mirvar(_MIPP_  0); 
#endif

    redc(_MIPP_ x, a);
    otstr(_MIPP_ a, s);

    printf("%s: %s\n", label, s);
#ifndef MR_STATIC
    mr_free(a);
#endif
}
*/

void zzn2_inv(_MIPD_ zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(163)
    nres_modmult(_MIPP_ w->a,w->a,mr_mip->w1); 
    nres_modmult(_MIPP_ w->b,w->b,mr_mip->w2); 
    nres_modadd(_MIPP_ mr_mip->w1,mr_mip->w2,mr_mip->w1);

    if (mr_mip->qnr==-2)
        nres_modadd(_MIPP_ mr_mip->w1,mr_mip->w2,mr_mip->w1);
    redc(_MIPP_ mr_mip->w1,mr_mip->w6);
  
    xgcd(_MIPP_ mr_mip->w6,mr_mip->modulus,mr_mip->w6,mr_mip->w6,mr_mip->w6);

    nres(_MIPP_ mr_mip->w6,mr_mip->w6);

    nres_modmult(_MIPP_ w->a,mr_mip->w6,w->a);
    nres_negate(_MIPP_ mr_mip->w6,mr_mip->w6);
    nres_modmult(_MIPP_ w->b,mr_mip->w6,w->b);
    MR_OUT
}

/* divide zzn2 by 2 */

void zzn2_div2(_MIPD_ zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(173)
#ifdef P64_1271
	moddiv2(w->a->w);
	w->a->len=2;
	moddiv2(w->b->w);
	w->b->len=2;
#else
    nres_div2(_MIPP_ w->a,w->a);
    nres_div2(_MIPP_ w->b,w->b);
#endif
    MR_OUT
}

/* divide zzn2 by 3 */

void zzn2_div3(_MIPD_ zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(200)

    nres_div3(_MIPP_ w->a,w->a);
    nres_div3(_MIPP_ w->b,w->b);

    MR_OUT
}

/* divide zzn2 by 5 */

void zzn2_div5(_MIPD_ zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(209)

    nres_div5(_MIPP_ w->a,w->a);
    nres_div5(_MIPP_ w->b,w->b);

    MR_OUT
}

/* multiply zzn2 by i */

void zzn2_timesi(_MIPD_ zzn2 *u)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(164)
    copy(u->a,mr_mip->w1);
    nres_negate(_MIPP_ u->b,u->a);
    if (mr_mip->qnr==-2)
        nres_modadd(_MIPP_ u->a,u->a,u->a);

    copy(mr_mip->w1,u->b);
    MR_OUT
}

void zzn2_txx(_MIPD_ zzn2 *u)
{
  /* multiply w by t^2 where x^2-t is irreducible polynomial for ZZn4
  
   for p=5 mod 8 t=sqrt(sqrt(-2)), qnr=-2
   for p=3 mod 8 t=sqrt(1+sqrt(-1)), qnr=-1
   for p=7 mod 8 and p=2,3 mod 5 t=sqrt(2+sqrt(-1)), qnr=-1 */
    zzn2 t;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(196)  
        
    switch (mr_mip->pmod8)
    {
    case 5:
        zzn2_timesi(_MIPP_ u);
        break;
    case 3:
        t.a=mr_mip->w3;
        t.b=mr_mip->w4;
        zzn2_copy(u,&t);
        zzn2_timesi(_MIPP_ u);
        zzn2_add(_MIPP_ u,&t,u);
        break;
    case 7:
        t.a=mr_mip->w3;
        t.b=mr_mip->w4;
        zzn2_copy(u,&t);
        zzn2_timesi(_MIPP_ u);
        zzn2_add(_MIPP_ u,&t,u);
        zzn2_add(_MIPP_ u,&t,u); 
        break;
    default: break; 
    }
    MR_OUT
}

void zzn2_txd(_MIPD_ zzn2 *u)
{ /* divide w by t^2 where x^2-t is irreducible polynomial for ZZn4
  
   for p=5 mod 8 t=sqrt(sqrt(-2)), qnr=-2
   for p=3 mod 8 t=sqrt(1+sqrt(-1)), qnr=-1
   for p=7 mod 8 and p=2,3 mod 5 t=sqrt(2+sqrt(-1)), qnr=-1 */
    zzn2 t;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return;
    MR_IN(197)  
    t.a=mr_mip->w3;
    t.b=mr_mip->w4;
    switch (mr_mip->pmod8)
    {
    case 5:
        copy(u->b,t.a);
        nres_div2(_MIPP_ u->a,t.b);
        nres_negate(_MIPP_ t.b,t.b);
        zzn2_copy(&t,u);
        break;
    case 3:
        nres_modadd(_MIPP_ u->a,u->b,t.a);
        nres_modsub(_MIPP_ u->b,u->a,t.b);
        zzn2_div2(_MIPP_ &t);
        zzn2_copy(&t,u);
        break;
    case 7:
        nres_modadd(_MIPP_ u->a,u->a,t.a);
        nres_modadd(_MIPP_ t.a,u->b,t.a);
        nres_modadd(_MIPP_ u->b,u->b,t.b);
        nres_modsub(_MIPP_ t.b,u->a,t.b);
        zzn2_div5(_MIPP_ &t);
        zzn2_copy(&t,u);  
/*
        nres_modadd(_MIPP_ u->a,u->b,t.a);
        nres_modadd(_MIPP_ t.a,u->b,t.a);
        nres_modsub(_MIPP_ u->b,u->a,t.b);
        zzn2_div3(_MIPP_ &t);
        zzn2_copy(&t,u);
*/
        break;
        default: break;
    }
 
    MR_OUT
}

/*
static void zzn2_print(_MIPD_ char *label, zzn2 *x)
{
    char s1[1024], s2[1024];
    big a, b;


    a = mirvar(_MIPP_  0); 
    b = mirvar(_MIPP_  0); 

    redc(_MIPP_ x->a, a); otstr(_MIPP_ a, s1);
    redc(_MIPP_ x->b, b); otstr(_MIPP_ b, s2);

    printf("%s: [%s,%s]\n", label, s1, s2);

    mr_free(a); mr_free(b);

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



void zzn2_sqr(_MIPD_ zzn2 *x,zzn2 *w)
{
#ifdef MR_COUNT_OPS
fpa+=3;
fpc+=2;
#endif
	modadd(x->a->w,x->b->w,mr_mip->w1->w);
    modsub(x->a->w,x->b->w,mr_mip->w2->w);
	modmult(x->a->w,x->b->w,w->b->w);
	modmult(mr_mip->w1->w,mr_mip->w2->w,w->a->w);
	modadd(w->b->w,w->b->w,w->b->w);
	w->a->len=2;
	w->b->len=2;
}


void zzn2_mul(_MIPD_ zzn2 *x,zzn2 *y,zzn2 *w)
{
#ifdef MR_COUNT_OPS
fpa+=5;
fpc+=3;
#endif

	modmult(x->a->w,y->a->w,mr_mip->w1->w);
    modmult(x->b->w,y->b->w,mr_mip->w2->w);
	modadd(x->a->w,x->b->w,mr_mip->w5->w);
	modadd(y->a->w,y->b->w,w->b->w);
    modmult(w->b->w,mr_mip->w5->w,w->b->w);
	modsub(w->b->w,mr_mip->w1->w,w->b->w);
	modsub(w->b->w,mr_mip->w2->w,w->b->w);
	modsub(mr_mip->w1->w,mr_mip->w2->w,w->a->w); 

	w->a->len=2;
	w->b->len=2; 

}



/* Lucas-style ladder exponentiation - for ZZn4 exponentiation 

void zzn2_powl(_MIPD_ zzn2 *x,big e,zzn2 *w)
{
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    int i,s;
    zzn2 t1,t3,t4;
    if (mr_mip->ERNUM) return;
    MR_IN(165)
    t1.a=mr_mip->w3;
    t1.b=mr_mip->w4;
    t3.a=mr_mip->w8;
    t3.b=mr_mip->w9;
    t4.a=mr_mip->w10;
    t4.b=mr_mip->w11;

    zzn2_from_int(_MIPP_ 1,&t1);

    s=size(e);
    if (s==0)
    {
        zzn2_copy(&t1,w);
        return;
    }
    zzn2_copy(x,w);
    if (s==1 || s==(-1)) return;

    i=logb2(_MIPP_ e)-1;

    zzn2_copy(w,&t3);
    zzn2_mul(_MIPP_ w,w,&t4);
    zzn2_add(_MIPP_ &t4,&t4,&t4);
    zzn2_sub(_MIPP_ &t4,&t1,&t4);

    while (i-- && !mr_mip->ERNUM)
    {
        if (mr_testbit(_MIPP_ e,i))
        {
            zzn2_mul(_MIPP_ &t3,&t4,&t3);
            zzn2_add(_MIPP_ &t3,&t3,&t3);
            zzn2_sub(_MIPP_ &t3,w,&t3);
            zzn2_mul(_MIPP_ &t4,&t4,&t4);
            zzn2_add(_MIPP_ &t4,&t4,&t4);
            zzn2_sub(_MIPP_ &t4,&t1,&t4);
        }
        else
        {
            zzn2_mul(_MIPP_ &t4,&t3,&t4);
            zzn2_add(_MIPP_ &t4,&t4,&t4);
            zzn2_sub(_MIPP_ &t4,w,&t4);
            zzn2_mul(_MIPP_ &t3,&t3,&t3);
            zzn2_add(_MIPP_ &t3,&t3,&t3);
            zzn2_sub(_MIPP_ &t3,&t1,&t3);
        }

    }
    zzn2_copy(&t4,w);
    MR_OUT
}
*/
