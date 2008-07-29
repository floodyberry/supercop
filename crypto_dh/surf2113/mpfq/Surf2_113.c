/*
 * Purpose: implement a Kummer cryptosystem on GF(2^127)
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>

#include "field.h"

// Kummer arithmetic.

typedef struct {
  Kelt x;
  Kelt y;
  Kelt z;
  Kelt t;
} KSpoint_struct;

typedef KSpoint_struct KSpoint[1];
typedef KSpoint_struct * dst_KSpoint;
typedef const KSpoint_struct * src_KSpoint;

typedef struct {
  Kelt beta;    // actually there inverses!
  Kelt gamma;
  Kelt delta;
} KSparam_struct;

typedef KSparam_struct KSparam[1];
typedef const KSparam_struct * src_KSparam;

//--------------------

void KSinit(Kfield K, dst_KSpoint P) {
  Kinit(&(P->x));
  Kinit(&(P->y));
  Kinit(&(P->z));
  Kinit(&(P->t));
}

void KSclear(Kfield K, dst_KSpoint P) {
  Kclear(&(P->x));
  Kclear(&(P->y));
  Kclear(&(P->z));
  Kclear(&(P->t));
}

static void KScopy(Kfield K, dst_KSpoint Q, src_KSpoint P) {
  Kset(Q->x, P->x);
  Kset(Q->y, P->y);
  Kset(Q->z, P->z);
  Kset(Q->t, P->t);
}

static void KSdouble(Kfield K, dst_KSpoint Q, src_KSpoint P, 
    src_KSparam KS) {
  Kelt tmp1, tmp2, tmp3, tmp4;

  Kinit(&tmp1); Kinit(&tmp2);
  Kinit(&tmp3); Kinit(&tmp4);

  Kmul(tmp1, P->x, P->t);
  Kmul(tmp2, P->y, P->z);
  Kadd(tmp1, tmp1, tmp2);   // tmp1 = x*t + y*z
  Kadd(tmp2, P->x, P->y);
  Kadd(tmp3, P->z, P->t);
  Kmul(tmp2, tmp2, tmp3);
  Kadd(tmp2, tmp2, tmp1);   // tmp2 = x*z + y*t = (x+y)(z+t) + xt + yz
  Kadd(tmp3, P->x, P->z);
  Kadd(tmp4, P->y, P->t);
  Kmul(tmp3, tmp3, tmp4);
  Kadd(tmp3, tmp3, tmp1);   // tmp3 = x*y + z*t = (x+z)(y+t) + xt + yz
  Kadd(Q->t, P->z, P->t);
  Kadd(Q->t, Q->t, P->x);
  Kadd(Q->t, Q->t, P->y);   // Q.t = x+y+z+t
  Ksqr(Q->x, tmp1);
  Ksqr(Q->y, tmp2);
  Ksqr(Q->z, tmp3);
  Ksqr(Q->t, Q->t);
  Ksqr(Q->t, Q->t);

  // The following will be mul_ui
  Kmul(Q->y, Q->y, KS->beta);
  Kmul(Q->z, Q->z, KS->gamma);
  Kmul(Q->t, Q->t, KS->delta);
  
  Kclear(&tmp1); Kclear(&tmp2);
  Kclear(&tmp3); Kclear(&tmp4);
}

void KSprint(Kfield K, src_KSpoint P) {
  Kprint(stdout, P->x); printf("\n");
  Kprint(stdout, P->y); printf("\n");
  Kprint(stdout, P->z); printf("\n");
  Kprint(stdout, P->t); printf("\n");
}

// scalar multiplication on Surf2_113
// key is 4 limb long.
void KSmul(Kfield K, dst_KSpoint res, src_KSpoint P, mpz_t key,
    src_KSparam KS) {
  KSpoint Pm, Pp;
  Kelt L1, L2, L3, L4, M1, M2, M3, N;
  Kelt YY, ZZ, TT;
  KSpoint_struct *pm, *pp, *tmp;
  int i, l;

  if (mpz_cmp_ui(key, 0)==0) {
    // implement me!
    assert (0);
  }

  if (mpz_cmp_ui(key, 1)==0) {
    KScopy(K, res, P);
    return;
  }

  KSinit(K, Pm); KSinit(K, Pp);
  KScopy(K, Pm, P);
  KSdouble(K, Pp, Pm, KS);

  if (mpz_cmp_ui(key, 2)==0) {
    KScopy(K, res, Pp);
    KSclear(K, Pm);
    KSclear(K, Pp);
    return;
  }

  Kinit(&L1);
  Kinit(&L2);
  Kinit(&L3);
  Kinit(&L4);
  Kinit(&M1);
  Kinit(&M2);
  Kinit(&M3);
  Kinit(&N);

  Kinit(&YY);
  Kinit(&ZZ);
  Kinit(&TT);

#if 1
  Kmul(L1, P->y, P->z);
  Kmul(L2, L1, P->t);
  Kinv(L2, L2);
  Kmul(L2, L2, P->x);
  Kmul(TT, L2, L1); // x/t
  Kmul(L1, P->z, P->t);
  Kmul(YY, L2, L1); // x/y
  Kmul(L1, P->y, P->t);
  Kmul(ZZ, L2, L1); // x/z
#else
  Kinv(YY, P->y);
  Kmul(YY, YY, P->x);
  Kinv(ZZ, P->z);
  Kmul(ZZ, ZZ, P->x);
  Kinv(TT, P->t);
  Kmul(TT, TT, P->x);
#endif

  // initialize loop
  pm = Pm;
  pp = Pp;

  // loop
  l = mpz_sizeinbase(key, 2);
  assert (mpz_tstbit(key, l-1) == 1);
  for (i = l-2; i >= 0; --i) {
    int swap;
    swap = (mpz_tstbit(key, i) == 1);
    if (swap) {
      tmp = pp; pp = pm; pm = tmp;
    }

    // pseudo-add(pm,pp) -> pp
    // Cost : 26A + 11P + 4S
    Kadd(L1, pm->x, pm->y);
    Kadd(L2, pm->z, pm->t);
    Kadd(N, L1, L2);
    Kadd(M1, N, pm->x);
    Kadd(M2, N, pm->z);
    Kadd(M3, N, pm->y);

    Kadd(L1, pp->x, pp->y);
    Kadd(L2, pp->z, pp->t);
    Kadd(L3, L1, L2);
    Kmul(N, L3, N);
    Kadd(L3, L2, pp->y);
    Kmul(M1, L3, M1);
    Kadd(L3, L1, pp->t);
    Kmul(M2, L3, M2);
    Kadd(L3, L2, pp->x);
    Kmul(M3, L3, M3);

    Kmul(L1, pm->x, pp->x);
    Kmul(L2, pm->y, pp->y);
    Kmul(L3, pm->z, pp->z);
    Kmul(L4, pm->t, pp->t);

    Kadd(L1, L1, L4);
    Kadd(pp->x, L1, N);
    Kadd(pp->x, M2, pp->x);
    Kadd(pp->x, M3, pp->x);


    Kadd(pp->y, L2, L4);
    Kadd(pp->y, N, pp->y);
    Kadd(pp->y, M2, pp->y);
    Kadd(pp->y, M1, pp->y);

    Kadd(pp->z, L3, L4);
    Kadd(pp->z, N, pp->z);
    Kadd(pp->z, M3, pp->z);
    Kadd(pp->z, M1, pp->z);

    Kadd(L2, L2, L3);
    Kadd(pp->t, L1, L2);

    Ksqr(pp->x, pp->x);
    Ksqr(pp->y, pp->y);
    Ksqr(pp->z, pp->z);
    Ksqr(pp->t, pp->t); 

    Kmul(pp->y, pp->y, YY);
    Kmul(pp->z, pp->z, ZZ);
    Kmul(pp->t, pp->t, TT); 

    // double pm
    // Cost : 10A + 4P + 5S + 3 sP
    KSdouble(K, pm, pm, KS);

    if (swap) {
      tmp = pp; pp = pm; pm = tmp;
    }
  }

  KScopy(K, res, pm);
  KSclear(K, Pm);
  KSclear(K, Pp);
 
  Kclear(&YY);
  Kclear(&ZZ);
  Kclear(&TT);
  Kclear(&L1);
  Kclear(&L2);
  Kclear(&L3);
  Kclear(&L4);
  Kclear(&M1);
  Kclear(&M2);
  Kclear(&M3);
  Kclear(&N);
}
