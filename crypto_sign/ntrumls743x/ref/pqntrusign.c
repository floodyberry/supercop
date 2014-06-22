/*
 * CPQREF/pqntrusign.c
 *
 *  Copyright 2014 John M. Schanck
 *
 *  This file is part of CPQREF.
 *
 *  CPQREF is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  CPQREF is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with CPQREF.  If not, see <http://www.gnu.org/licenses/>.
*/


#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include "crypto_hash_sha512.h"

#include "shred.h"
#include "params.h"
#include "pack.h"
#include "pol.h"

#include "pqerror.h"

#define STATS 1

static int
challenge(
    int8_t              *sp,
    int8_t              *tp,
    const size_t        public_key_len,
    const unsigned char *public_key_blob,
    const size_t        msg_len,
    const unsigned char *msg)
{
  uint16_t      i;
  uint16_t      j;
  uint16_t      m;

  uint8_t       r;
  int8_t        *poly;

  PQ_PARAM_SET  *P;

  const unsigned char *digest;

  unsigned char input[2*HASH_BYTES];
  unsigned char pool[HASH_BYTES];

  int result;

  result = get_blob_params(&P, public_key_len, public_key_blob);
  if(PQNTRU_ERROR == result)
  {
    return PQNTRU_ERROR;
  }

  result = get_digest_ptr(P, &digest, public_key_len, public_key_blob);
  if(PQNTRU_ERROR == result)
  {
    return PQNTRU_ERROR;
  }

  /* pool = hash(hash(msg) || hash(public key)) */
  crypto_hash_sha512(input, msg, msg_len);
  memcpy(input+HASH_BYTES, digest, HASH_BYTES);
  crypto_hash_sha512(pool, input, 2*HASH_BYTES);

  j = 0;
  poly = sp;
  for(m = 0; m < 2; m++)
  {
    i = 0;
    r = 0;
    while(i < P->N)
    {
      if(HASH_BYTES == j)
      {
        memcpy(input, pool, HASH_BYTES);
        crypto_hash_sha512(pool, input, HASH_BYTES);
        j = 0;
      }
      if(0 == r)
      {
        r = (uint8_t) pool[j++];
      }
      switch(r & 3)
      {
        case 1: poly[i] = -1; break;
        case 2: poly[i] =  0; break;
        case 3: poly[i] =  1; break;
        default:  r >>= 2; continue;
      }
      r >>= 2;
      i++;
    }

    poly = tp;
  }

  return 0;
}



int
pq_sign(
    size_t              *packed_sig_len,
    unsigned char       *packed_sig,
    const size_t        private_key_len,
    const unsigned char *private_key_blob,
    const size_t        public_key_len,
    const unsigned char *public_key_blob,
    const size_t        msg_len,
    const unsigned char *msg)
{

  uint16_t i;
  int error = 0;

  uint16_t  N;
  uint16_t  padN;
  int64_t   q;
  int8_t    p;
  uint16_t  d1;
  uint16_t  d2;
  uint16_t  d3;
  int64_t   m;

  size_t        scratch_len;
  unsigned char *scratch;
  size_t        offset;

  uint16_t      *f;    /* Private key product form f indices */
  uint16_t      *g;    /* .. product form g indices */
  int64_t       *ginv; /* Private key; coefficients of g^{-1} */
  int64_t       *h;    /* Public key coefficients */
  int64_t       *s0;   /* scratch space for random lattice point */
  int64_t       *t0;

  int64_t       *a;    /* scratch space for 3 polynomials */
  int64_t       *tmpx2;/* scratch space for 2 polynomials (aliased by a) */

  int8_t        *sp;   /* Document hash */
  int8_t        *tp;


  PQ_PARAM_SET  *P;

  int rc = PQNTRU_OK;

  if(!private_key_blob || !public_key_blob || !packed_sig_len)
  {
    return PQNTRU_ERROR;
  }

  rc = get_blob_params(&P, private_key_len, private_key_blob);
  if(PQNTRU_ERROR == rc)
  {
    return PQNTRU_ERROR;
  }

  if(!packed_sig) /* Return signature size in packed_sig_len */
  {
    *packed_sig_len = SIGNATURE_BYTES(P);
    return PQNTRU_OK;
  }

  if(!msg || msg_len == 0)
  {
    return PQNTRU_ERROR;
  }

  N = P->N;
  padN = P->padded_N;
  q = P->q;
  p = P->p;
  d1 = P->d1;
  d2 = P->d2;
  d3 = P->d3;

  scratch_len = 2 * PRODUCT_FORM_BYTES(P) /* f and g */
              + 7 * POLYNOMIAL_BYTES(P)   /* h, ginv, and 5 scratch polys */
              + 2 * N;                    /* sp, tp */
  if(!(scratch = malloc(scratch_len)))
  {
    return PQNTRU_ERROR;
  }
  memset(scratch, 0, scratch_len);

  offset = 0;
  f    = (uint16_t*)(scratch);          offset += PRODUCT_FORM_BYTES(P);
  g    = (uint16_t*)(scratch + offset); offset += PRODUCT_FORM_BYTES(P);
  h    =  (int64_t*)(scratch + offset); offset += POLYNOMIAL_BYTES(P);
  ginv =  (int64_t*)(scratch + offset); offset += POLYNOMIAL_BYTES(P);
  s0   =  (int64_t*)(scratch + offset); offset += POLYNOMIAL_BYTES(P);
  t0   =  (int64_t*)(scratch + offset); offset += POLYNOMIAL_BYTES(P);
  /* a is treated as 3 polynomials, aliases tmpx2 */
  a    =  (int64_t*)(scratch + offset); offset += POLYNOMIAL_BYTES(P);
  tmpx2=  (int64_t*)(scratch + offset); offset += 2* POLYNOMIAL_BYTES(P);
  sp   =   (int8_t*)(scratch + offset); offset += N;
  tp   =   (int8_t*)(scratch + offset);


  /* Unpack the keys */
  rc = unpack_private_key(P, f, g, ginv, private_key_len, private_key_blob);
  if(PQNTRU_ERROR == rc)
  {
    shred(scratch, scratch_len);
    free(scratch);
    return PQNTRU_ERROR;
  }

  rc = unpack_public_key(P, h, public_key_len, public_key_blob);
  if(PQNTRU_ERROR == rc)
  {
    shred(scratch, scratch_len);
    free(scratch);
    return PQNTRU_ERROR;
  }


  /* Generate a document hash to sign */
  challenge(sp, tp,
            public_key_len, public_key_blob,
            msg_len, msg);

  do
  {
    error = 0;

    /* Choose random s0 satisfying s0 = sp (mod p) */
    pol_unidrnd_pZ(s0, N, q, p);
    for(i=0; i<N; i++)
    {
      s0[i] += sp[i];
    }

    /* Load h into a zero padded polynomial */
    memcpy(t0, h, N*sizeof(int64_t));

    /* t0 = h*s0 */
    pol_mul_coefficients(t0, t0, s0, N, padN, q, a);

    /* t0 = tp - (s0*h) */
    for(i=0; i<N; i++)
    {
      t0[i] *= -1;
      t0[i] += tp[i];
    }

    /* a = ginv * (tp - t0) (mod p) */
    pol_mul_coefficients(a, t0, ginv, N, padN, p, a);

    /* tmpx2 = a * F = (a * (f-1)/p) */
    pol_mul_product(tmpx2, a, d1, d2, d3, f, N, tmpx2);
    for(i=0; i<N; i++)
    {
      m = p * (a[i] + tmpx2[i]);
      error |= (m > P->B_s) || (-m > P->B_s);

      /* s0 = s0 + p*(a + tmpx2) = s0 + a*f */
      s0[i] += m;

      error |= (cmod(s0[i], p) - sp[i]); /* Not necessary to check this */
      error |= (s0[i] > P->norm_bound_s) || (-s0[i] > P->norm_bound_s);
    }

    /* tmpx2 = a * G = (a * (g - 1)) */
    pol_mul_product(tmpx2, a, d1, d2, d3, g, N, tmpx2);
    for(i=0; i<N; i++)
    {
      m = (a[i] + tmpx2[i]);
      error |= (m > P->B_t) || (-m > P->B_t);

      /* t0 = (a + tmpx2) - t0 + tp = a*g - tp + s0*h + tp = s0*h + a*g */
      t0[i] = m - t0[i] + tp[i];
      error |= (cmod(t0[i], p) - tp[i]); /* Not necessary to check this */
      error |= (t0[i] > P->norm_bound_t) || (-t0[i] > P->norm_bound_t) ;
    }
  } while(0 != error);

  for(i=0; i<N; i++)
  {
    s0[i] = (s0[i] - sp[i])/P->p;
    s0[i] += P->q / (2*P->p);
  }

  pack_signature(P, s0, *packed_sig_len, packed_sig);

  shred(scratch, scratch_len);
  free(scratch);

  return PQNTRU_OK;
}


int
pq_verify(
    const size_t        packed_sig_len,
    const unsigned char *packed_sig,
    const size_t        public_key_blob_len,
    const unsigned char *public_key_blob,
    const size_t        msg_len,
    const unsigned char *msg)
{
  uint16_t      i;

  PQ_PARAM_SET  *P;
  size_t        scratch_len;
  unsigned char *scratch;
  int8_t        *sp;
  int8_t        *tp;
  int64_t       *h;
  int64_t       *sig;
  int64_t       *tmpx3;

  uint16_t      N;
  uint16_t      padN;
  int64_t       q;
  int8_t        p;
  uint16_t      error = 0;
  int           result;


  result = get_blob_params(&P, public_key_blob_len, public_key_blob);
  if(PQNTRU_ERROR == result)
  {
    return PQNTRU_ERROR;
  }

  N = P->N;
  padN = P->padded_N;
  p = P->p;
  q = P->q;

  scratch_len = 2 * N + 5 * POLYNOMIAL_BYTES(P);
  if(!(scratch = malloc(scratch_len)))
  {
    return PQNTRU_ERROR;
  }
  memset(scratch, 0, scratch_len);

  sig  = (int64_t*)scratch;
  h    = (int64_t*)(scratch + POLYNOMIAL_BYTES(P));
  tmpx3 = (int64_t*)(scratch + 2*POLYNOMIAL_BYTES(P));
  sp    =  (int8_t*)(scratch + 5*POLYNOMIAL_BYTES(P));
  tp    =  (int8_t*)(scratch + 5*POLYNOMIAL_BYTES(P) + N);

  result = unpack_public_key(P, h, public_key_blob_len, public_key_blob);
  if(PQNTRU_ERROR == result)
  {
    free(scratch);
    return PQNTRU_ERROR;
  }

  result = unpack_signature(P, sig, packed_sig_len, packed_sig);
  if(PQNTRU_ERROR == result)
  {
    free(scratch);
    return PQNTRU_ERROR;
  }


  challenge(sp, tp,
            public_key_blob_len, public_key_blob,
            msg_len, msg);

  for(i=0; i<N; i++)
  {
    sig[i] = sig[i] - (P->q / (2*P->p));
    sig[i] = sig[i] * P->p;
    sig[i] = sig[i] + sp[i];
    error |= (cmod(sig[i], p) - sp[i]);
    error |= (sig[i] > P->norm_bound_s) || (-sig[i] > P->norm_bound_s);
  }

  pol_mul_coefficients(tmpx3, sig, h, N, padN, q, tmpx3);

  for(i=0; i<N; i++)
  {
    error |= (cmod(tmpx3[i], p) - tp[i]);
    error |= (tmpx3[i] > P->norm_bound_t) || (-tmpx3[i] > P->norm_bound_t) ;
  }

  free(scratch);

  if(0 == error)
  {
    return PQNTRU_OK;
  }
  return PQNTRU_ERROR;
}


int
pq_gen_key(
    PQ_PARAM_SET  *P,
    size_t        *privkey_blob_len,
    unsigned char *privkey_blob,
    size_t        *pubkey_blob_len,
    unsigned char *pubkey_blob)
{
  uint16_t      i;
  uint16_t      m;

  uint16_t      N;
  uint16_t      padN;
  int64_t       q;
  int8_t        p;
  uint16_t      d1;
  uint16_t      d2;
  uint16_t      d3;

  size_t        private_key_blob_len;
  size_t        public_key_blob_len;

  uint16_t      *f;
  uint16_t      *g;
  int64_t       *h;

  size_t        scratch_len;
  size_t        offset;
  unsigned char *scratch;
  int64_t       *a1;
  int64_t       *a2;
  int64_t       *tmpx3;

  if(!P || !privkey_blob_len || !pubkey_blob_len)
  {
    return PQNTRU_ERROR;
  }

  N = P->N;
  padN = P->padded_N;
  q = P->q;
  p = P->p;
  d1 = P->d1;
  d2 = P->d2;
  d3 = P->d3;

  /* TODO: Standardize packed key formats */

  private_key_blob_len = PRIVKEY_PACKED_BYTES(P);
  public_key_blob_len = PUBKEY_PACKED_BYTES(P);

  if(!privkey_blob || !pubkey_blob)
  {
    if(!privkey_blob && privkey_blob_len != NULL)
    {
      *privkey_blob_len = private_key_blob_len;
    }
    if(!pubkey_blob && pubkey_blob_len != NULL)
    {
      *pubkey_blob_len = public_key_blob_len;
    }
    return PQNTRU_OK;
  }

  if((*privkey_blob_len != private_key_blob_len)
      || (*pubkey_blob_len != public_key_blob_len))
  {
    return PQNTRU_ERROR;
  }

  scratch_len = 2 * PRODUCT_FORM_BYTES(P) + 6 * POLYNOMIAL_BYTES(P);
  if(!(scratch = malloc(scratch_len)))
  {
    return PQNTRU_ERROR;
  }
  memset(scratch, 0, scratch_len);

  offset = 0;
  f = (uint16_t*)(scratch);            offset += PRODUCT_FORM_BYTES(P);
  g = (uint16_t*)(scratch + offset);   offset += PRODUCT_FORM_BYTES(P);
  h  = (int64_t*)(scratch + offset);   offset += POLYNOMIAL_BYTES(P);
  a1 = (int64_t*)(scratch + offset);   offset += POLYNOMIAL_BYTES(P);
  a2 = (int64_t*)(scratch + offset);   offset += POLYNOMIAL_BYTES(P);
  tmpx3 = (int64_t*)(scratch + offset);


  /* Find invertible pf mod q */
  /* TODO: Better sampling of product form keys
   *       Try to avoid keys with f(1) = 0
   */
  do
  {
    pol_gen_product(f, d1, d2, d3, N);

    /* f = p * (1 + product form poly) */
    memset(a1, 0, POLYNOMIAL_BYTES(P));
    a1[0] = p;

    pol_mul_product(a1, a1, d1, d2, d3, f, N, tmpx3);
    a1[0] += p;

  } while(PQNTRU_ERROR == pol_inv_mod2(a2, a1, N));

  /* Lift from (Z/2Z)[X]/(X^N - 1) to (Z/qZ)[X]/(X^N -1) */
  for (m = 0; m < 5; ++m)   /* assumes 2^16 < q <= 2^32 */
  {
    /* a^-1 = a^-1 * (2 - a * a^-1) mod q */

    pol_mul_product(a1, a2, d1, d2, d3, f, N, tmpx3);

    for (i = 0; i < N; ++i)
    {
      a1[i] = -p*(a1[i] + a2[i]);
    }

    a1[0] = a1[0] + 2;
    pol_mul_coefficients(a2, a2, a1, N, padN, q, tmpx3);
  }


  /* Find invertible g mod p */
  do
  {
    /* Generate product form g,
     * then expand it to find inverse mod p
     */
    pol_gen_product(g, d1, d2, d3, N);

    memset(a1, 0, POLYNOMIAL_BYTES(P));
    a1[0] = 1;

    pol_mul_product(a1, a1, d1, d2, d3, g, N, tmpx3);
    a1[0] += 1;

  } while(PQNTRU_ERROR == pol_inv_modp(tmpx3, a1, N, p));

  pack_private_key(P, f, g, tmpx3, private_key_blob_len, privkey_blob);

  /* Calculate public key, h = g/f mod q */
  pol_mul_product(h, a2, d1, d2, d3, g, N, tmpx3);
  for(i=0; i<N; i++)
  {
    h[i] = cmod(h[i] + a2[i], q);
  }

  pack_public_key(P, h, public_key_blob_len, pubkey_blob);

  shred(scratch, scratch_len);
  free(scratch);

  return PQNTRU_OK;
}


