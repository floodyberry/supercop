/*
 * CPQREF/pol.c
 *
 *  Copyright 2013 John M. Schanck
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
#include <stdint.h>
#include <string.h>

#include "fastrandombytes.h"
#include "shred.h"
#include "pol.h"
#include "pqerror.h"

static int64_t
zz_gcd(
    const int64_t a,
    const int64_t b,
    int64_t       *u_ptr,
    int64_t       *v_ptr)
{
  int64_t d = a;
  int64_t u = 1;
  int64_t v = 0;
  int64_t v1, v3, t1, t3;
  if(b != 0) {
    v1 = 0;
    v3 = b;
    do {
      t1 = d / v3;
      t3 = d % v3;
      t1 = u - (t1*v1);

      u = v1;
      d = v3;
      v1 = t1;
      v3 = t3;
    } while(v3 != 0);
    v = (d - a*u)/b;
  }
  if(u_ptr != NULL) *u_ptr = u;
  if(v_ptr != NULL) *v_ptr = v;
  return d;
}

static int64_t
zz_inv_mod(
    int64_t       a,
    const int64_t p)
{
  int64_t r;
  int64_t t = ((int64_t)(a > 0) - (int64_t)(a < 0));
  a *= t;

  if(zz_gcd(a,p,&r,NULL) == 1)
  {
    r *= t;
    return (r > 0) ? r : p + r;
  }
  return 0;
}


void
pol_gen_product(
    uint16_t        *ai,
    const uint8_t   d1,
    const uint8_t   d2,
    const uint8_t   d3,
    const uint16_t  N)
{
  uint16_t rndcap = UINT16_MAX - (UINT16_MAX % N); /* assumes N is not power of 2 */
  uint16_t d = 2*((uint16_t)d1 + d2 + d3);
  uint16_t r;

  while(d > 0)
  {
    rng_uint16(&r);
    if(r < rndcap)
    {
      *ai++ = r % N;
      --d;
    }
  }

  return;
}


/* Uniform random element of pZ^n, v, such that
 * v_i + (p-1)/2 <= (q-1)/2
 * v_i - (p-1)/2 >= -(q-1)/2
 */
void
pol_unidrnd_pZ(
    int64_t          *v,
    const uint16_t   N,
    const int64_t    q,
    const int8_t     p)
{
  uint16_t i = 0;
  uint64_t r = 0;

  int64_t range = q/p;
  int64_t center = q/(2*p);

  uint64_t rndcap = (UINT64_MAX - (UINT64_MAX % range));

  while(i < N) {
    rng_uint64(&r);
    if(r < rndcap) {
      v[i] = ((int64_t)(r % range) - center) * p;
      ++i;
    }
  }

  return;
}


/*
 * Computes the inverse of a in (Z/pZ)[x]/(x^N - 1) for prime p.
 *
 * @see www.securityinnovation.com/uploads/Crypto/NTRUTech014.pdf
 *      page 3, 'Inversion in (Z/pZ)[x]/(x^N - 1)'
 */
int
pol_inv_modp(
    int64_t         *ainvp,
    const int64_t   *a,
    const uint16_t  N,
    const int64_t   p)
{
  uint16_t i;
  uint16_t k;
  uint16_t m;

  int64_t u;

  uint16_t degf;
  uint16_t degg;
  uint16_t degc;
  uint16_t degb;
  uint16_t degtmp;

  /* TODO: minimize memory usage */
  size_t scratch_len = 4*(N + 1)*sizeof(int8_t);
  int8_t *scratch = malloc(scratch_len);

  int8_t *f = scratch;
  int8_t *g = f + (N+1);
  int8_t *b = g + (N+1);
  int8_t *c = b + (N+1);
  int8_t *poltmp;

  if(!scratch)
  {
    return PQNTRU_ERROR;
  }
  memset(scratch, 0, scratch_len);

  /* f = a (mod p)*/
  degf = 0;
  for(i=0; i<N; i++) {
    f[i] = a[i] % p;
    if(f[i]) degf = i;
  }

  /* g = x^N - 1 */
  g[0] = p-1;
  g[N] = 1;
  degg = N;

  /* b(X) = 1 */
  b[0] = 1;
  degb = 0;

  /* c(X) = 0 */
  degc = 0;

  k = 0;
  while (1)
  {
    /* find smallest m such that f[m] is nonzero */
    for (m = 0; (m <= degf) && (f[m] == 0); ++m);
    if (m > degf)
    {
      free(scratch);
      return PQNTRU_ERROR; /* not invertible */
    }

    /* divide f by x^m, mul c by x^m */
    if(m > 0) {
      f = f + m;
      degf -= m;
      degc += m;
      for (i = degc; i >= m; i--)
      {
          c[i] = c[i-m];
      }
      for (i = 0; i < m; i++)
      {
          c[i] = 0;
      }
      k += m;
    }

    if(degf == 0)
    {
      break;
    }

    if(degf < degg) {
      /* Swap f and g, b and c */
      poltmp = f; f = g; g = poltmp;
      poltmp = c; c = b; b = poltmp;
      degtmp = degf; degf = degg; degg = degtmp;
      degtmp = degc; degc = degb; degb = degtmp;
    }

    u = (f[0] * zz_inv_mod(g[0], p)) % p;

    for(i = 0; i <= degg; i++)
    {
      f[i] = (f[i] - u*g[i]) % p;
    }

    if(degg == degf)
    {
      while(degf > 0 && f[degf] == 0)
      {
        --degf;
      }
    }

    for(i = 0; i <= degc; i++)
    {
      b[i] = (b[i] - u*c[i]) % p;
    }

    if(degc >= degb)
    {
      degb = degc;
      while(degb > 0 && b[degb] == 0)
      {
        --degb;
      }
    }
  }

  if(k >= N)
  {
    k -= N;
  }

  /* a^{-1} = 1/f * x^{-k} * b */
  u = zz_inv_mod(f[0], p);
  for (m=0, i = k; i < N; m++, i++)
  {
    ainvp[m] = cmod(u * b[i],  p);
  }
  for (i = 0; i < k; m++, i++)
  {
    ainvp[m] = cmod(u * b[i],  p);
  }

  shred(scratch, scratch_len);
  free(scratch);

  return PQNTRU_OK;
}


int
pol_inv_mod2(
    int64_t        *a_inv,
    const int64_t  *a,
    const uint16_t N)
{
  uint16_t i;
  uint16_t k;
  uint16_t m;

  uint16_t degf;
  uint16_t degg;
  uint16_t degc;
  uint16_t degb;
  uint16_t degtmp;

  /* TODO: minimize memory usage */
  uint16_t scratch_len = 4*(N+1);
  uint8_t *scratch = malloc(scratch_len);

  uint8_t *f = scratch;
  uint8_t *g = f + (N+1);
  uint8_t *b = g + (N+1);
  uint8_t *c = b + (N+1);
  uint8_t *poltmp;

  if(!scratch)
  {
    return PQNTRU_ERROR;
  }
  memset(scratch, 0, scratch_len);

  /* f = a (mod 2)*/
  degf = 0;
  for(i=0; i<N; i++) {
    f[i] = (uint8_t) (a[i] & 1);
    if(f[i]) degf = i;
  }

  /* g = x^N - 1 */
  g[0] = 1;
  g[N] = 1;
  degg = N;

  /* b(X) = 1 */
  b[0] = 1;
  degb = 0;

  /* c(X) = 0 */
  degc = 0;

  k = 0;

  while (1)
  {
    /* find smallest m such that f[m] is nonzero */
    for (m = 0; (m <= degf) && (f[m] == 0); ++m);
    if (m > degf)
    {
      free(scratch);
      return PQNTRU_ERROR;
    }
    if(m > 0) {
      f = f + m;
      degf -= m;
      degc += m;
      for (i = degc; i >= m; i--)
      {
          c[i] = c[i-m];
      }
      for (i = 0; i < m; i++)
      {
          c[i] = 0;
      }
      k += m;
    }

    /* if f(X) = 1, done */

    if (degf == 0)
    {
      break;
    }

    if(degf < degg) {
      /* Swap f and g, b and c */
      poltmp = f; f = g; g = poltmp;
      poltmp = c; c = b; b = poltmp;
      degtmp = degf; degf = degg; degg = degtmp;
      degtmp = degc; degc = degb; degb = degtmp;
    }

    /* f(X) += g(X)
     * might change degree of f if degg >= degf
     */

    for (i = 0; i <= degg; i++)
    {
      f[i] ^= g[i];
    }

    if(degg == degf)
    {
      while(degf > 0 && f[degf] == 0)
      {
        --degf;
      }
    }

    /* b(X) += c(X) */
    for (i = 0; i <= degc; i++)
    {
      b[i] ^= c[i];
    }

    if (degc >= degb)
    {
      degb = degc;
      while(degb > 0 && b[degb] == 0)
      {
        --degb;
      }
    }
  }

  /* a^-1 in (Z/2Z)[X]/(X^N - 1) = b(X) shifted left k coefficients */

  if (k >= N)
  {
    k = k - N;
  }

  m = 0;
  for (i = k; i < N; i++)
  {
    a_inv[m++] = (int64_t)(b[i]);
  }

  for (i = 0; i < k; i++)
  {
    a_inv[m++] = (int64_t)(b[i]);
  }

  shred(scratch, scratch_len);
  free(scratch);

  return PQNTRU_OK;
}


static void
pol_mul_indices(
    int64_t         *c,
    const int64_t   *a,
    const uint16_t  bi_P1_len,
    const uint16_t  bi_M1_len,
    const uint16_t  *bi,
    const uint16_t  N,
    int64_t         *t)
{
  //uint64_t mod_q_mask = q - 1;
  uint16_t i, j, k;

  /* t[(i+k)%N] = sum i=0 through N-1 of a[i], for b[k] = -1 */
  memset(t, 0, N * sizeof(uint64_t));

  for (j = bi_P1_len; j < bi_P1_len + bi_M1_len; j++)
  {
    k = bi[j];

    for (i = 0; k < N; ++i, ++k)
    {
      t[k] = t[k] + a[i];
    }

    for (k = 0; i < N; ++i, ++k)
    {
      t[k] = t[k] + a[i];
    }
  }

  /* t[(i+k)%N] = -(sum i=0 through N-1 of a[i] for b[k] = -1) */

  for (k = 0; k < N; k++)
  {
    t[k] = -t[k];
  }

  /* t[(i+k)%N] += sum i=0 through N-1 of a[i] for b[k] = +1 */

  for (j = 0; j < bi_P1_len; j++)
  {
    k = bi[j];

    for (i = 0; k < N; ++i, ++k)
    {
      t[k] = t[k] + a[i];
    }

    for (k = 0; i < N; ++i, ++k)
    {
      t[k] = t[k] + a[i];
    }
  }

  if(t != c)
  {
    memcpy(c, t, N*sizeof(int64_t));
  }

  return;
}


void
pol_mul_product(
    int64_t         *c,
    const int64_t   *a,
    const uint16_t  b1i_len,
    const uint16_t  b2i_len,
    const uint16_t  b3i_len,
    const uint16_t  *bi,
    const uint16_t  N,
    int64_t         *t)
{
  int64_t    *t2 = t + N;
  uint16_t   i;

  /* t2 = a * b1 */

  pol_mul_indices(t2, a, b1i_len, b1i_len,
                  bi, N, t);

  /* t2 = (a * b1) * b2 */

  pol_mul_indices(t2, t2, b2i_len, b2i_len,
                  bi + (b1i_len << 1), N, t);

  /* t = a * b3 */

  pol_mul_indices(t, a, b3i_len, b3i_len,
                  bi + ((b1i_len + b2i_len) << 1), N, t);

  /* c = (a * b1 * b2) + (a * b3) */

  for (i = 0; i < N; i++)
  {
    c[i] = (t2[i] + t[i]);
  }

  return;
}


/* Space efficient Karatsuba multiplication.
 * See: Thomé, "Karatsuba multiplication with temporary space of size \le n"
 * http://www.loria.fr/~thome/files/kara.pdf
 *
 * Note: Input length should factor into b * 2^k, b <= 38
 */
static void
karatsuba(
    int64_t        *res1,   /* out - a * b in Z[x], must be length 2k */
    int64_t        *tmp1,   /*  in - k coefficients of scratch space */
    int64_t const  *a,     /*  in - polynomial */
    int64_t const  *b,     /*  in - polynomial */
    uint16_t const  k)     /*  in - number of coefficients in a and b */
{
  uint16_t i;
  uint16_t j;

  /* Grade school multiplication for small / odd inputs */
  if(k <= 38 || (k & 1) != 0)
  {
    for(j=0; j<k; j++)
    {
      res1[j] = a[0]*b[j];
    }
    for(i=1; i<k; i++)
    {
      res1[i+k-1] = 0;
      for(j=0; j<k; j++)
      {
        res1[i+j] += a[i]*b[j];
      }
    }
    res1[2*k-1] = 0;

    return;
  }

  uint16_t const p = k>>1;

  int64_t *res2 = res1+p;
  int64_t *res3 = res1+k;
  int64_t *res4 = res1+k+p;
  int64_t *tmp2 = tmp1+p;
  int64_t const *a2 = a+p;
  int64_t const *b2 = b+p;

  for(i=0; i<p; i++)
  {
    res1[i] = a[i] - a2[i];
    res2[i] = b2[i] - b[i];
  }

  karatsuba(tmp1, res3, res1, res2, p);

  karatsuba(res3, res1, a2, b2, p);

  for(i=0; i<p; i++)
  {
    tmp1[i] += res3[i];
  }

  for(i=0; i<p; i++)
  {
    res2[i]  = tmp1[i];
    tmp2[i] += res4[i];
    res3[i] += tmp2[i];
  }

  karatsuba(tmp1, res1, a, b, p);

  for(i=0; i<p; i++)
  {
    res1[i]  = tmp1[i];
    res2[i] += tmp1[i] + tmp2[i];
    res3[i] += tmp2[i];
  }

  return;
}


void
pol_mul_coefficients(
     int64_t         *c,       /* out - address for polynomial c */
     const int64_t   *a,       /*  in - pointer to polynomial a */
     const int64_t   *b,       /*  in - pointer to polynomial b */
     const uint16_t  N,        /*  in - ring degree */
     const uint16_t  padN,     /*  in - padded polynomial degree */
     const int64_t   q,        /*  in - large modulus */
     int64_t         *tmp)
{
  uint16_t i;
  int64_t *res = tmp;
  int64_t *scratch = res + 2*padN;

  karatsuba(res, scratch, a, b, padN);

  for(i=0; i<N; i++)
  {
    c[i] = cmod(res[i] + res[i+N], q);
  }
}



/* Center 'a' modulo p (an odd prime).
 * (a_i -> [-(p-1)/2, (p-1)/2]
 */
int64_t
cmod(int64_t a, int64_t p)
{
  if (a >= 0)
  {
    a %= p;
  }
  else
  {
    a = p + (a % p);
  }
  if (a > ((p-1)/2))
  {
    a -= p;
  }

  return a;
}

