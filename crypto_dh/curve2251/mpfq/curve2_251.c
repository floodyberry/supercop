#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>
#define NDEBUG
#include <assert.h>

#include "field.h"

Kfield K;

// EC arithmetic.

#define Kcopy Kset


typedef struct {
    Kelt x;
    Kelt z;
} ECpoint_struct;

typedef ECpoint_struct ECpoint[1];
typedef ECpoint_struct * dst_ECpoint;
typedef const ECpoint_struct * src_ECpoint;

static void ECinit(Kfield K, dst_ECpoint P) {
    Kinit(&(P->x));
    Kinit(&(P->z));
}

static void ECclear(Kfield K, dst_ECpoint P) {
    Kclear(&(P->x));
    Kclear(&(P->z));
}

static void ECcopy(Kfield K, dst_ECpoint Q, src_ECpoint P) {
    Kcopy(Q->x, P->x);
    Kcopy(Q->z, P->z);
}

static void ECdouble(Kfield K, dst_ECpoint Q, src_ECpoint P, Ksrc_elt A6) {
    Kelt tmp1;

    Kinit(&tmp1); 

    Ksqr(Q->x, P->x);
    Ksqr(tmp1, P->z);
    Kmul(Q->z, tmp1, Q->x);
    Kadd(Q->x, Q->x, tmp1);
    Ksqr(Q->x, Q->x);
    Kmul(Q->x, A6, Q->x);  // TODO: mul_ui, here.

    Kclear(&tmp1);
}

void ECprint(Kfield K, src_ECpoint P) {
    Kprint(stdout, P->x); printf("\n");
    Kprint(stdout, P->z); printf("\n");
}

// scalar multiplication on Curve2_251.
void ECmul(Kfield K, Kdst_elt res, Ksrc_elt x, mpz_t key) {
    ECpoint Pm, Pp;
    ECpoint_struct *pm, *pp, *tmp;
    Kelt tmp1, tmp2;
    Kelt A6;
    int i, l;

    Kinit(&A6);
    Kset_uipoly(A6, 9095);

    if (mpz_cmp_ui(key, 0)==0) {
        // implement me!
        assert (0);
    }

    if (mpz_cmp_ui(key, 1)==0) {
        Kcopy(res, x);
        Kclear(&A6);
        return;
    }

    ECinit(K, Pm); ECinit(K, Pp);
    Kcopy(Pm->x, x);
    Kset_ui(Pm->z, 1);
    ECdouble(K, Pp, Pm, A6);

    if (mpz_cmp_ui(key, 2)==0) {
        Kinv(Pp->z, Pp->z);
        Kmul(res, Pp->x, Pp->z);
        Kclear(&A6);
        ECclear(K, Pm); ECclear(K, Pp);
        return;
    }

    // allocate memory (should be NOP in practice, since this is on the
    // stack).
    Kinit(&tmp1); Kinit(&tmp2);

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

        // pseudo add -> pp
        Kadd(tmp1, pm->x, pm->z);
        Kadd(tmp2, pp->x, pp->z);
        Kmul(tmp1, tmp1, tmp2);

        Kmul(pp->x, pm->x, pp->x);
        Kmul(pp->z, pm->z, pp->z);
        Kadd(pp->x, pp->x, pp->z);
        Kadd(pp->z, pp->x, tmp1);

        Ksqr(pp->x, pp->x);
        Ksqr(pp->z, pp->z);
        Kmul(pp->z, pp->z, x);

        // double pm  -> pm
        Ksqr(pm->x, pm->x);
        Ksqr(tmp1, pm->z);
        Kmul(pm->z, tmp1, pm->x);
        Kadd(pm->x, pm->x, tmp1);
        Ksqr(pm->x, pm->x);
        Kmul(pm->x, A6, pm->x);  // TODO: mul_ui, here.

        if (swap) {
            tmp = pp; pp = pm; pm = tmp;
        }
    }
    Kinv(pm->z, pm->z);
    Kmul(res, pm->x, pm->z);

    ECclear(K, Pm); ECclear(K, Pp);
    Kclear(&tmp1); Kclear(&tmp2);
}


#ifdef WANT_MAIN
int main(int argc, char** argv) {
    mpz_t key;
    Kfield K;
    Kelt res, base_point;
    int i;

    Kfield_init(); //, (mp_limb_t *)NULL);

    if (argc != 3) {
        fprintf(stderr, "usage: %s key base_point\n", argv[0]);
        fprintf(stderr, "    key        is the secret key (an integer < 2^256)\n");
        fprintf(stderr, "    base_point is the abscissa of the point to multiply (an integer < 2^256)\n");
        return 1;
    }
    mpz_init_set_str(key, argv[1], 10);
    Kinit(&base_point);
    {
        mpz_t tz;
        mpz_init_set_str(tz, argv[2], 0);
        Kset_uipoly_wide(base_point, tz[0]._mp_d, tz[0]._mp_size);
        mpz_clear(tz);
    }

    Kinit(&res);
    for (i = 0; i < 1000; ++i) {
        ECmul(K, res, base_point, key);
    }
    Kprint(stdout, res); printf("\n");

    Kclear(&base_point);
    Kclear(&res);
    mpz_clear(key);
    return 0; 
}
#endif

#if 0

Some Magma code for testing.

PP<t> := PolynomialRing(GF(2));
Fq<T> := ext<GF(2) | t^251 + t^7 + t^4 + t^2 + 1>;
A6 := T^13 + T^9 + T^8 + T^7 + T^2 + T + 1;
E := EllipticCurve([1,0,0,0,A6]);


Abs := Fq!IntegerToChar2Polynomial(9);
key := 21348576;
PP := Points(E, Abs);
assert #PP eq 2;
P := PP[1];
Q := key*P;
Q[1];







#endif
