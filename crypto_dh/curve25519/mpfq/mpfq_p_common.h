#ifndef _MPFQ_P_COMMON_H_
#define _MPFQ_P_COMMON_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "gmp.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MALLOC_FAILED()							\
	do {								\
		fprintf(stderr, "malloc failed in %s\n", __func__);	\
		abort();						\
	} while (0)

static void mpn_normalize(mp_limb_t * dst, int * pnlimbs)
{
	while (*pnlimbs > 0) {
		if (dst[(*pnlimbs) - 1] != 0)
			break;
		(*pnlimbs)--;
	}
}
static void mpn2mpz(__mpz_struct * dst, mp_limb_t * src, size_t nlimbs)
{
	if (dst->_mp_alloc < nlimbs) {
		dst->_mp_alloc = nlimbs;
		dst->_mp_d =
		    realloc(dst->_mp_d, nlimbs * sizeof(mp_limb_t));
		if (!dst->_mp_d) {
			MALLOC_FAILED();
		}
	}
	dst->_mp_size = nlimbs;
	memcpy(dst->_mp_d, src, nlimbs * sizeof(mp_limb_t));
	mpn_normalize(dst->_mp_d, &(dst->_mp_size));
}


// Info for Montgomery representation
typedef struct {
  mp_limb_t invP;   // -1/p mod 2^GMP_LIMB_BITS
  mp_limb_t *invR;  // 1/R mod p
} mgy_info_struct;


// Several ways of representing elements
// NB: MGY and UNNORMALIZED are flags. 4 combos give:
#define CLASSICAL_REP 0UL
#define MGY_REP 1UL
#define UNNORMALIZED_REP 2UL
#define MGY_UNNORMALIZED_REP 3UL

#define IS_MGY_REP(type) ((type) & MGY_REP)
#define IS_UNNORMALIZED_REP(type) ((type) & UNNORMALIZED_REP)
#define IS_NORMALIZED_REP(type) (!((type) & UNNORMALIZED_REP))

typedef struct {
  mp_limb_t *p;
  size_t kl;   // number of limbs of a reduced elt
  size_t url;  // number of limbs of an unreduced elt
  mp_limb_t *bigmul_p; // largest multiple of p that fits in an ur_elt
  long url_margin;  // number of adds of unreduced elts that are allowed (>=500)
  mgy_info_struct mgy_info;
  unsigned long type;     // contains the representation of elements and things like that...
  mpz_t factor;
} mpfq_p_field_struct;

typedef mpfq_p_field_struct mpfq_p_field[1];
typedef const mpfq_p_field_struct * mpfq_p_src_field;
typedef mpfq_p_field_struct * mpfq_p_dst_field;

#ifdef __cplusplus
}
#endif

#endif	/* _MPFQ_P_COMMON_H_ */
