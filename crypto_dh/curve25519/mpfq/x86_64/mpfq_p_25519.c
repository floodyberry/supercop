/*
 * This file has been automatically generated, do not edit directly.
 * Calling function: FpGen::gen_gfp_k(25519,4,9)
 */
 
#include <string.h> 
#include "mpfq_p_25519.h"


void mpfq_p_25519_field_tricks(mpfq_p_25519_dst_field k, mp_limb_t flags) {
  // maybe some day...
}

void mpfq_p_25519_field_clear(mpfq_p_25519_dst_field k) {
  free(k->p);
  k->p = NULL;
  mpz_clear(k->factor);
}

void mpfq_p_25519_write(mpfq_p_25519_src_field k, char *str, mpfq_p_25519_src_elt x, int base) {
  int i, n; 
  mp_limb_t tmp[4+1];
  
  for (i = 0; i < 4; ++i)
    tmp[i] = x[i];
  
  n = mpn_get_str((unsigned char*)str, base, tmp, 4);
  for (i = 0; i < n; ++i)
    str[i] += '0';
  str[n] = '\0';
}

int mpfq_p_25519_read(mpfq_p_25519_src_field k, mpfq_p_25519_dst_elt x, const char *str, int base) {
  int i, n, len;
  unsigned char *tmp;
  
  len = strlen(str);
  tmp = (unsigned char *) malloc(sizeof(unsigned char)*len);
  if (!tmp) 
    MALLOC_FAILED();
  for (i = 0; i < len; ++i)
    tmp[i] = (unsigned char)(str[i]-'0');
  n = mpn_set_str(x, tmp, len, base);
  if (n > 4) {
    fprintf(stderr, "error in read_fp_4, input number is too large\n");
    return 0;
  } 
  for (i = n; i< 4; ++i)
    x[i] = 0UL;
  if (mpn_cmp(x,k->p,4) >= 0) {
    fprintf(stderr, "error in read_fp_4, input number is too large\n");
    return 0;
  }
  free(tmp);
  return 1;
}

void mpfq_p_25519_print(mpfq_p_25519_src_field k, mpfq_p_25519_src_elt x) {
  char str[1000*4];
  mpfq_p_25519_write(k, str, x, 10);
  printf("%s", str);
}

int mpfq_p_25519_inv(mpfq_p_25519_dst_field k, mpfq_p_25519_dst_elt z, mpfq_p_25519_src_elt x) {
#if 1
  invmod_4(z, x, k->p);
#else
  mp_limb_t s1[4+1], s2[4+1];
  mp_limb_t r1[4+1], r2[4+1];
  mp_size_t r1n, r2n;
  int i;

  add_4(s1, x, k->p);
  mpfq_p_25519_copy(k, s2, k->p);

  if (cmp_4(s1, s2) == 0) {
    fprintf(stderr, "error in inv_fp_4: division by 0\n");
    exit(1);
  }

  assert (cmp_4(s1, s2) > 0);

  r1n = mpn_gcdext(r1, r2, &r2n, s1, 4, s2, 4);

  // Non invertible element ?
  if ((r1n != 1) || (r1[0] != 1UL)) {
    fprintf(stderr, "warning in inv_fp_4: non invertible element\n");
    if ((r1n <= 1) && (r1[0] == 0UL)) {
      fprintf(stderr, "hum... in fact this is a division by 0\n");
      exit(1);
    } else {
      mpn2mpz(k->factor, r1, r1n);
      return 1;
    }
  }

  // OK. GCD is one. make the result positive and put it in z.
  assert ((r1n == 1) && (r1[0] == 1UL));

  if (r2n < 0) {
    for (i = -r2n; i < 4; ++i)
      r2[i] = 0UL;
    sub_4(r2, k->p, r2);
  } else {
    for (i = r2n; i < 4; ++i)
      r2[i] = 0UL;
  }

  mpfq_p_25519_copy(k, z, r2);
#endif
}

void mpfq_p_25519_random(mpfq_p_25519_src_field k, mpfq_p_25519_dst_elt r) {
  mpn_random(r, 4);
  mpfq_p_25519_normalize(k, r);
}

void mpfq_p_25519_random2(mpfq_p_25519_src_field k, mpfq_p_25519_dst_elt r) {
  mpn_random2(r, 4);
  mpfq_p_25519_normalize(k, r);
}

void mpfq_p_25519_field_init(mpfq_p_25519_dst_field k, mp_limb_t *p) {
  k->p = (mp_limb_t *)malloc(4*sizeof(mp_limb_t));
  k->bigmul_p = (mp_limb_t *)malloc(9*sizeof(mp_limb_t));
  if ((!k->p) || (!k->bigmul_p))
    MALLOC_FAILED();
  {
    int i;
    k->p[0] = -19UL;
    for (i = 1; i < (4-1); ++i)
      k->p[i] = -1UL;
    k->p[4-1] = (-1UL) >> 1;   // 2^(w-1) - 1 where w is 32 or 64
  }
  k->kl = 4;
  k->url = 9;
  k->url_margin = LONG_MAX;
  k->type = CLASSICAL_REP;
  mpz_init(k->factor);
  // precompute bigmul_p = largest multiple of p that fits in an elt_ur
  //   p*Floor( (2^(9*GMP_LIMB_BITS)-1)/p )
  {
    mpfq_p_25519_elt_ur big;
    mp_limb_t q[9-4+1], r[4], tmp[9+1];
    int i;

    for (i = 0; i < 9; ++i)
      big[i] = ~0UL;
    mpn_tdiv_qr(q, r, 0, big, 9, k->p, 4);
    mpn_mul(tmp, q, 9-4+1, k->p, 4);
    for (i = 0; i < 9; ++i)
      (k->bigmul_p)[i] = tmp[i];
    assert (tmp[9] == 0UL);
  }
}
;

