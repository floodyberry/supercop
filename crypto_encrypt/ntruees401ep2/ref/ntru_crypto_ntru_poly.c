/******************************************************************************
 * NTRU Cryptography Reference Source Code
 * Copyright (c) 2009-2013, by Security Innovation, Inc. All rights reserved. 
 *
 * ntru_crypto_ntru_poly.c is a component of ntru-crypto.
 *
 * Copyright (C) 2009-2013  Security Innovation
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 *****************************************************************************/


/******************************************************************************
 *
 * File: ntru_crypto_ntru_poly.c
 *
 * Contents: Routines for generating and operating on polynomials in the
 *           NTRU algorithm.
 *
 *****************************************************************************/

#include "ntru_crypto.h"
#include "ntru_crypto_ntru_poly.h"
#include "ntru_crypto_ntru_mgf1.h"

#if defined(NTRUENVSSE3)
#include <immintrin.h>
#endif

#ifdef TEST_COMPARE_CONVOLUTIONS
    #define NTRUENVSSE3
    #define NTRUENV64BIT
    #define NTRUENV32BIT
    #define NTRUENVUNKNOWN
#endif /* def TEST_COMPARE_CONVOLUTIONS */


/* ntru_gen_poly
 *
 * Generates polynomials by creating for each polynomial, a list of the
 * indices of the +1 coefficients followed by a list of the indices of
 * the -1 coefficients.
 *
 * If a single polynomial is generated (non-product form), indices_counts
 * contains a single value of the total number of indices (for +1 and -1
 * comefficients combined).
 *
 * If multiple polynomials are generated (for product form), their lists of
 * indices are sequentially stored in the indices buffer.  Each byte of
 * indices_counts contains the total number of indices (for +1 and -1
 * coefficients combined) for a single polynomial, beginning with the
 * low-order byte for the first polynomial.  The high-order byte is unused.
 *
 * Returns NTRU_OK if successful.
 * Returns HASH_BAD_ALG if the algorithm is not supported.
 *
 */

uint32_t
ntru_gen_poly(
    NTRU_CRYPTO_HASH_ALGID  hash_algid,      /*  in - hash algorithm ID for
                                                      IGF-2 */
    uint8_t                 md_len,          /*  in - no. of octets in digest */
    uint8_t                 min_calls,       /*  in - minimum no. of hash
                                                      calls */
    uint16_t                seed_len,        /*  in - no. of octets in seed */
    uint8_t                *seed,            /*  in - pointer to seed */
    uint8_t                *buf,             /*  in - pointer to working
                                                      buffer */
    uint16_t                N,               /*  in - max index + 1 */
    uint8_t                 c_bits,          /*  in - no. bits for candidate */
    uint16_t                limit,           /*  in - conversion to index
                                                      limit */
    bool                    is_product_form, /*  in - if generating multiple
                                                      polys */
    uint32_t                indices_counts,  /*  in - nos. of indices needed */
    uint16_t               *indices)         /* out - address for indices */
{
    uint8_t  *mgf_out;
    uint8_t  *octets;
    uint8_t  *used;
    uint8_t   num_polys;
    uint16_t  num_indices;
    uint16_t  octets_available;
    uint16_t  index_cnt = 0;
    uint8_t   left = 0;
    uint8_t   num_left = 0;
    uint32_t  retcode;

    /* generate minimum MGF1 output */

    mgf_out = buf + md_len + 4;
    if ((retcode = ntru_mgf1(buf, hash_algid, md_len, min_calls,
                             seed_len, seed, mgf_out)) != NTRU_OK)
    {
        return retcode;
    }

    octets = mgf_out;
    octets_available = min_calls * md_len;

    /* init indices counts for number of polynomials being generated */

    if (is_product_form)
    {
        /* number of indices for poly1 is in low byte of indices_counts,
         * number of indices for poly2 and poly3 are in next higher bytes
         */

        num_polys = 3;
        num_indices = (uint16_t)(indices_counts & 0xff);
        indices_counts >>= 8;

    }
    else
    {
        /* number of bytes for poly is in low 16 bits of indices_counts */

        num_polys = 1;
        num_indices = (uint16_t)indices_counts;
    }

    /* init used-index array */

    used = mgf_out + octets_available;
    memset(used, 0, N);

    /* generate indices (IGF-2) for all polynomials */

    while (num_polys > 0)
    {

        /* generate indices for a single polynomial */

        while (index_cnt < num_indices)
        {
            uint16_t index;
            uint8_t  num_needed;

            /* form next index to convert to an index */

            do {
                /* use any leftover bits first */

                if (num_left != 0)
                {
                    index = left << (c_bits - num_left);
                }
                else
                {
                    index = 0;
                }

                /* get the rest of the bits needed from new octets */

                num_needed = c_bits - num_left;
                while (num_needed != 0)
                {
                    /* get another octet */

                    if (octets_available == 0)
                    {
                        if ((retcode = ntru_mgf1(buf, hash_algid, md_len, 1,
                                                 0, NULL, mgf_out)) != NTRU_OK)
                        {
                            return retcode;
                        }
                        
                        octets = mgf_out;
                        octets_available = md_len;
                    }
                    left = *octets++;
                    --octets_available;

                    if (num_needed <= 8)
                    {
                        /* all bits needed to fill the index are in this octet */

                        index |= ((uint16_t)(left)) >> (8 - num_needed);
                        num_left = 8 - num_needed;
                        num_needed = 0;
                        left &= 0xff >> (8 - num_left);

                    }
                    else
                    {
                        /* another octet will be needed after using this
                         * whole octet
                         */

                        index |= ((uint16_t)left) << (num_needed - 8);
                        num_needed -= 8;
                    }
                }
            } while (index >= limit);

            /* form index and check if unique */

            index %= N;
            
            if (!used[index])
            {
                used[index] = 1;
                indices[index_cnt] = index;
                ++index_cnt;
            }
        }
        --num_polys;

        /* init for next polynomial if another polynomial to be generated */

        if (num_polys > 0)
        {
            memset(used, 0, N);
            num_indices = num_indices +
                          (uint16_t)(indices_counts & 0xff);
            indices_counts >>= 8;
        }
    }

    NTRU_RET(NTRU_OK);
}


/* ntru_poly_check_min_weight
 *
 * Checks that the number of 0, +1, and -1 trinary ring elements meet or exceed
 * a minimum weight.
 */

bool
ntru_poly_check_min_weight(
    uint16_t  num_els,              /*  in - degree of polynomial */
    uint8_t  *ringels,              /*  in - pointer to trinary ring elements */
    uint16_t  min_wt)               /*  in - minimum weight */
{
    uint16_t wt[3];
    uint16_t i;

    wt[0] = wt[1] = wt[2] = 0;
    
    for (i = 0; i < num_els; i++)
    {
       ++wt[ringels[i]];
    }
    
    if ((wt[0] < min_wt) || (wt[1] < min_wt) || (wt[2] < min_wt))
    {
        return FALSE;
    }
    
    return TRUE;
}

/* ntru_ring_mult_indices
 *
 * Multiplies ring element (polynomial) "a" by ring element (polynomial) "b"
 * to produce ring element (polynomial) "c" in (Z/qZ)[X]/(X^N - 1).
 * This is a convolution operation.
 *
 * Ring element "b" is a sparse trinary polynomial with coefficients -1, 0,
 * and 1.  It is specified by a list, bi, of its nonzero indices containing
 * indices for the bi_P1_len +1 coefficients followed by the indices for the
 * bi_M1_len -1 coefficients.
 * The indices are in the range [0,N).
 *
 * The result array "c" may share the same memory space as input array "a",
 * input array "b", or temp array "t".
 *
 * This assumes q is 2^r where 8 < r < 16, so that overflow of the sum
 * beyond 16 bits does not matter.
 */

#ifdef NTRUENV64BIT

void
ntru_ring_mult_indices_quadruple_width_conv(
    uint16_t const *a,          /*  in - pointer to ring element a */
    uint16_t        bi_P1_len,  /*  in - no. of +1 coefficients in b */
    uint16_t        bi_M1_len,  /*  in - no. of -1 coefficients in b */
    uint16_t const *bi,         /*  in - pointer to the list of nonzero
                                         indices of ring element b,
                                         containing indices for the +1
                                         coefficients followed by the
                                         indices for -1 coefficients */
    uint16_t        N,          /*  in - no. of coefficients in a, b, c */
    uint16_t        q,          /*  in - large modulus */
    uint16_t       *t,          /*  in - temp buffer of N elements */
    uint16_t       *c)          /* out - address for polynomial c */
{
    uint16_t        i;
    uint16_t        mod_q_mask;
    uint64_t        full_mod_q_mask;
    uint32_t        mask_interval;
    uint16_t        iA, iT, iB; /* Loop variables for the relevant arrays */
    uint16_t        mask_time;
    uint16_t        oend[4];
    uint16_t        end;
    uint16_t const  Nmod4 = N & 3;

    uint64_t        tmp1;
    uint64_t        tmp2;

    for(i=0; i<4; i++)
    {
      oend[i] = (N-i) & 0xfffc; /* 4 * floor((N-i)/4) */
    }

    mod_q_mask = q - 1;
    full_mod_q_mask = (mod_q_mask << 16) | mod_q_mask;
    full_mod_q_mask |= (full_mod_q_mask << 32);
    mask_interval = ((1 << 16) / q);

    /* t[(i+k)%N] = sum i=0 through N-1 of a[i], for b[k] = -1 */

    mask_time = 0;

    memset(t, 0, N*sizeof(uint16_t));
    for (iB = bi_P1_len; iB < bi_P1_len + bi_M1_len; iB++)
    {
        /* first half -- from iT to N */
        iT = bi[iB];
        end = oend[iT & 3];

        for (iA = 0; iT < end; iA+=4, iT+=4)
        {
            memcpy(&tmp1, t + iT, sizeof tmp1);
            memcpy(&tmp2, a + iA, sizeof tmp2);
            tmp1 += tmp2;
            memcpy(t + iT, &tmp1, sizeof tmp1);
        }

        while (iT < N)
        {
            t[iT] += a[iA];
            iT++;
            iA++;
        }

        /* second half -- from 0 to start -1 */

        /* at this point we have used (N-bi[iB + bi_P1_len]) and iA should be
         * equal to bi[iB+bi_P1_len]+1.
         */
        end = oend[iA & 3];

        for (iT = 0; iA < end; iA+=4, iT+=4)
        {
            memcpy(&tmp1, t + iT, sizeof tmp1);
            memcpy(&tmp2, a + iA, sizeof tmp2);
            tmp1 += tmp2;
            memcpy(t + iT, &tmp1, sizeof tmp1);
        }

        while (iA < N)
        {
            t[iT] += a[iA];
            iT++;
            iA++;
        }

        mask_time++;
        if (mask_time == mask_interval)
        {
            memcpy(&tmp1, t, sizeof tmp1);
            tmp1 &= full_mod_q_mask;
            memcpy(t, &tmp1, sizeof tmp1);

            end = oend[Nmod4];
            for (iT = Nmod4; iT < end; iT+=4)
            {
                memcpy(&tmp1, t + iT, sizeof tmp1);
                tmp1 &= full_mod_q_mask;
                memcpy(t + iT, &tmp1, sizeof tmp1);
            }
            mask_time = 0;
        }
    } /* for (iB = 0; iB < bi_M1_len; iB++) -- minus-index loop */

    /* Minus everything */
    for (iT = 0; iT < N; iT++)
    {
        t[iT] = -t[iT];
        t[iT] &= mod_q_mask;
    }
    mask_time = 0;

    for (iB = 0; iB < bi_P1_len; iB++)
    {
        /* first half -- from iT to N */
        iT = bi[iB];
        end = oend[iT & 3];

        for (iA = 0; iT < end; iA+=4, iT+=4)
        {
            memcpy(&tmp1, t + iT, sizeof tmp1);
            memcpy(&tmp2, a + iA, sizeof tmp1);
            tmp1 += tmp2;
            memcpy(t + iT, &tmp1, sizeof tmp1);
        }

        while (iT < N)
        {
            t[iT] += a[iA];
            iT++;
            iA++;
        }

        /* second half -- from 0 to start -1 */

        /* at this point we have used (N-bi[iB + bi_P1_len]) and iA should be
         * equal to bi[iB+bi_P1_len]+1.
         */
        end = oend[iA & 3];

        for (iT = 0; iA < end; iA+=4, iT+=4)
        {
            memcpy(&tmp1, t + iT, sizeof tmp1);
            memcpy(&tmp2, a + iA, sizeof tmp1);
            tmp1 += tmp2;
            memcpy(t + iT, &tmp1, sizeof tmp1);
        }

        while (iA < N)
        {
            t[iT] += a[iA];
            iT++;
            iA++;
        }

        mask_time++;
        if (mask_time == mask_interval)
        {
            memcpy(&tmp1, t, sizeof tmp1);
            tmp1 &= full_mod_q_mask;
            memcpy(t, &tmp1, sizeof tmp1);

            end = oend[Nmod4];
            for (iT = Nmod4; iT < end; iT+=4)
            {
                memcpy(&tmp1, t + iT, sizeof tmp1);
                tmp1 &= full_mod_q_mask;
                memcpy(t + iT, &tmp1, sizeof tmp1);
            }
            mask_time = 0;
        }

    } /* for (iB = 0; iB < bi_P1_len; iB++) -- plus-index loop */

    /* c = (a * b) mod q */
    for (iT = 0; iT < N; iT++)
    {
        c[iT] = t[iT] & mod_q_mask;
    }

    return;
}

#endif  /* def NTRUENV64BIT */



/* ntru_ring_mult_indices
 *
 * Multiplies ring element (polynomial) "a" by ring element (polynomial) "b"
 * to produce ring element (polynomial) "c" in (Z/qZ)[X]/(X^N - 1).
 * This is a convolution operation.
 *
 * Ring element "b" is a sparse trinary polynomial with coefficients -1, 0,
 * and 1.  It is specified by a list, bi, of its nonzero indices containing
 * indices for the bi_P1_len +1 coefficients followed by the indices for the
 * bi_M1_len -1 coefficients.
 * The indices are in the range [0,N).
 *
 * The result array "c" may share the same memory space as input array "a",
 * input array "b", or temp array "t".
 *
 * This assumes q is 2^r where 8 < r < 16, so that overflow of the sum
 * beyond 16 bits does not matter.
 */


#ifdef NTRUENV32BIT
void
ntru_ring_mult_indices_double_width_conv(
    uint16_t const *a,          /*  in - pointer to ring element a */
    uint16_t const  bi_P1_len,  /*  in - no. of +1 coefficients in b */
    uint16_t const  bi_M1_len,  /*  in - no. of -1 coefficients in b */
    uint16_t const *bi,         /*  in - pointer to the list of nonzero
                                         indices of ring element b,
                                         containing indices for the +1
                                         coefficients followed by the
                                         indices for -1 coefficients */
    uint16_t const  N,          /*  in - no. of coefficients in a, b, c */
    uint16_t const  q,          /*  in - large modulus */
    uint16_t       *t,          /*  in - temp buffer of N elements */
    uint16_t       *c)          /* out - address for polynomial c */
{
    uint16_t        mod_q_mask;
    uint32_t        mask_interval;
    uint16_t        iA, iT, iB; /* Loop variables for the relevant arrays */
    uint16_t        mask_time;
    uint16_t        end;

    uint32_t        tmp1;
    uint32_t        tmp2;

    end = N & 0xfffe; /* 4 * floor((N-i)/4) */

    mod_q_mask = q - 1;
    mask_interval = ((1 << 16) / q);
    mask_time = 0;

    /* t[(i+k)%N] = sum i=0 through N-1 of a[i], for b[k] = -1 */
    memset(t, 0, N*sizeof(uint16_t));
    for (iB = bi_P1_len; iB < bi_P1_len + bi_M1_len; iB++)
    {
        /* first half -- iT from bi[iB] to N
                         iA from 0 to N - bi[iB] */
        iT = bi[iB];

        for (iA = 0; iT < end; iA+=2, iT+=2)
        {
            memcpy(&tmp1, t + iT, sizeof tmp1);
            memcpy(&tmp2, a + iA, sizeof tmp2);
            tmp1 += tmp2;
            memcpy(t + iT, &tmp1, sizeof tmp1);
        }

        if (iT < N)
        {
            t[iT] += a[iA];
            iT++;
            iA++;
        }

        /* second half -- iT from 0 to bi[iB]
                          iA from bi[iB] to N  */

        for (iT = 0; iA < end; iA+=2, iT+=2)
        {
            memcpy(&tmp1, t + iT, sizeof tmp1);
            memcpy(&tmp2, a + iA, sizeof tmp2);
            tmp1 += tmp2;
            memcpy(t + iT, &tmp1, sizeof tmp1);
        }

        if (iA < N)
        {
            t[iT] += a[iA];
            iT++;
            iA++;
        }

        mask_time++;
        if (mask_time == mask_interval)
        {
            for (iT = 0; iT < N; iT++)
            {
              t[iT] &= mod_q_mask;
            }
            mask_time = 0;
        }
    } /* for (iB = 0; iB < bi_M1_len; iB++) -- minus-index loop */

    /* Minus everything */
    for (iT = 0; iT < N; iT++)
    {
        t[iT] = -t[iT];
        t[iT] &= mod_q_mask;
    }
    mask_time = 0;

    for (iB = 0; iB < bi_P1_len; iB++)
    {
        /* first half -- iT from bi[iB] to N
                         iA from 0 to N - bi[iB] */
        iT = bi[iB];

        for (iA = 0; iT < end; iA+=2, iT+=2)
        {
          memcpy(&tmp1, t + iT, sizeof tmp1);
          memcpy(&tmp2, a + iA, sizeof tmp2);
          tmp1 += tmp2;
          memcpy(t + iT, &tmp1, sizeof tmp1);
        }

        if (iT < N)
        {
            t[iT] += a[iA];
            iT++;
            iA++;
        }

        /* second half -- iT from 0 to bi[iB]
                          iA from bi[iB] to N  */
        for (iT = 0; iA < end; iA+=2, iT+=2)
        {
          memcpy(&tmp1, t + iT, sizeof tmp1);
          memcpy(&tmp2, a + iA, sizeof tmp2);
          tmp1 += tmp2;
          memcpy(t + iT, &tmp1, sizeof tmp1);
        }

        if (iA < N)
        {
            t[iT] += a[iA];
            iT++;
            iA++;
        }

        mask_time++;
        if (mask_time == mask_interval)
        {
            for (iT = 0; iT < N; iT++)
            {
              t[iT] &= mod_q_mask;
            }
            mask_time = 0;
        }

    } /* for (iB = 0; iB < bi_P1_len; iB++) -- plus-index loop */

    /* c = (a * b) mod q */
    for (iT = 0; iT < N; iT++)
    {
        c[iT] = t[iT] & mod_q_mask;
    }

    return;
}
#endif


/* ntru_ring_mult_indices
 *
 * Multiplies ring element (polynomial) "a" by ring element (polynomial) "b"
 * to produce ring element (polynomial) "c" in (Z/qZ)[X]/(X^N - 1).
 * This is a convolution operation.
 *
 * Ring element "b" is a sparse trinary polynomial with coefficients -1, 0,
 * and 1.  It is specified by a list, bi, of its nonzero indices containing
 * indices for the bi_P1_len +1 coefficients followed by the indices for the
 * bi_M1_len -1 coefficients.
 * The indices are in the range [0,N).
 *
 * The result array "c" may share the same memory space as input array "a",
 * input array "b", or temp array "t".
 *
 * This assumes q is 2^r where 8 < r < 16, so that overflow of the sum
 * beyond 16 bits does not matter.
 */
#ifdef NTRUENVSSE3

void
ntru_ring_mult_indices_sse3(
    uint16_t const *a,          /*  in - pointer to ring element a */
    uint16_t const  bi_P1_len,  /*  in - no. of +1 coefficients in b */
    uint16_t const  bi_M1_len,  /*  in - no. of -1 coefficients in b */
    uint16_t const *bi,         /*  in - pointer to the list of nonzero
                                         indices of ring element b,
                                         containing indices for the +1
                                         coefficients followed by the
                                         indices for -1 coefficients */
    uint16_t const  N,          /*  in - no. of coefficients in a, b, c */
    uint16_t const  q,          /*  in - large modulus */
    uint16_t       *t,          /*  in - temp buffer of N elements */
    uint16_t       *c)          /* out - address for polynomial c */
{
  uint16_t const padN = (N + 0x0007) & 0xfff8;
  __m128i *T = alloca(2*padN*sizeof(uint16_t));
  memset(T,0,2*padN*sizeof(uint16_t));
  __m128i *Tp;

  uint16_t i;
  uint16_t j;
  uint16_t k;
  uint16_t m;
  uint16_t const mod_q_mask = q-1;

  __m128i a0s[8];
  __m128i aNs[8];
  a0s[0] = _mm_lddqu_si128((__m128i *) a);
  aNs[0] = _mm_lddqu_si128((__m128i *) (a+N-8));
  for(i=1; i<8; i++)
  {
    a0s[i] = _mm_slli_si128(a0s[i-1],2);
    aNs[i] = _mm_srli_si128(aNs[i-1],2);
  }

  for(i=bi_P1_len; i<bi_P1_len+bi_M1_len; i++)
  {
    k = bi[i];
    m = k&7;
    k/=8;
    Tp = T+k;
    __m128i x2 = _mm_add_epi16(*Tp, a0s[m]);
    _mm_store_si128(Tp, x2);
    Tp++;
    for(j=8-m; j<=(N-8); j+=8)
    {
      __m128i x3 = _mm_lddqu_si128((__m128i *) &a[j]);
      x2 = _mm_add_epi16(*Tp, x3);
      _mm_store_si128(Tp, x2);
      Tp++;
    }
    if(j == N) continue;
    x2 = _mm_add_epi16(*Tp, aNs[j-(N-8)]);
    _mm_store_si128(Tp, x2);
  }

  __m128i neg = _mm_setzero_si128();
  neg = _mm_cmpeq_epi8(neg,neg);
  Tp = T;
  for(i=0; i<(2*padN)/8; i++)
  {
    __m128i x1 = _mm_sign_epi16(*Tp,neg);
    _mm_store_si128(Tp, x1);
    Tp++;
  }

  for(i=0; i<bi_P1_len; i++)
  {
    k = bi[i];
    m = k&7;
    k/=8;
    Tp = T+k;
    __m128i x2 = _mm_add_epi16(*Tp, a0s[m]);
    _mm_store_si128(Tp, x2);
    Tp++;
    for(j=8-m; j<=(N-8); j+=8)
    {
      __m128i x3 = _mm_lddqu_si128((__m128i *) &a[j]);
      x2 = _mm_add_epi16(*Tp, x3);
      _mm_store_si128(Tp, x2);
      Tp++;
    }
    if(j == N) continue;
    x2 = _mm_add_epi16(*Tp, aNs[j-(N-8)]);
    _mm_store_si128(Tp, x2);
  }

  __m128i *Ti = T;
  Tp = (__m128i *) (((uint16_t *) T)+N);
  __m128i x0 = _mm_set1_epi16(mod_q_mask);
  for(j=0; j<N; j+=8)
  {
    __m128i x1 = _mm_load_si128(Ti);
    __m128i x2 = _mm_lddqu_si128(Tp);
    __m128i x3 = _mm_add_epi16(x1, x2);
    __m128i x4 = _mm_and_si128(x3, x0);
    _mm_store_si128(Ti, x4);
    Ti++;
    Tp++;
  }
  memcpy(c, T, N*sizeof(uint16_t));

  return;
}
#endif

/* ntru_ring_mult_indices
 *
 * Multiplies ring element (polynomial) "a" by ring element (polynomial) "b"
 * to produce ring element (polynomial) "c" in (Z/qZ)[X]/(X^N - 1).
 * This is a convolution operation.
 *
 * Ring element "b" is a sparse trinary polynomial with coefficients -1, 0,
 * and 1.  It is specified by a list, bi, of its nonzero indices containing
 * indices for the bi_P1_len +1 coefficients followed by the indices for the
 * bi_M1_len -1 coefficients.
 * The indices are in the range [0,N).
 *
 * The result array "c" may share the same memory space as input array "a",
 * input array "b", or temp array "t".
 *
 * This assumes q is 2^r where 8 < r < 16, so that overflow of the sum
 * beyond 16 bits does not matter.
 */
#ifdef NTRUENVUNKNOWN
void
ntru_ring_mult_indices_orig(
    uint16_t const *a,          /*  in - pointer to ring element a */
    uint16_t const  bi_P1_len,  /*  in - no. of +1 coefficients in b */
    uint16_t const  bi_M1_len,  /*  in - no. of -1 coefficients in b */
    uint16_t const *bi,         /*  in - pointer to the list of nonzero
                                         indices of ring element b,
                                         containing indices for the +1
                                         coefficients followed by the
                                         indices for -1 coefficients */
    uint16_t const  N,          /*  in - no. of coefficients in a, b, c */
    uint16_t const  q,          /*  in - large modulus */
    uint16_t       *t,          /*  in - temp buffer of N elements */
    uint16_t       *c)          /* out - address for polynomial c */
{
    uint16_t mod_q_mask = q - 1;
    uint16_t i, j, k;

    /* t[(i+k)%N] = sum i=0 through N-1 of a[i], for b[k] = -1 */

    for (k = 0; k < N; k++)
    {
        t[k] = 0;
    }

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

    /* c = (a * b) mod q */

    for (k = 0; k < N; k++)
    {
        c[k] = t[k] & mod_q_mask;
    }

    return;
}
#endif   /* def NTRUENVUNKNOWN */

void
ntru_ring_mult_indices(
    uint16_t const *a,          /*  in - pointer to ring element a */
    uint16_t const  bi_P1_len,  /*  in - no. of +1 coefficients in b */
    uint16_t const  bi_M1_len,  /*  in - no. of -1 coefficients in b */
    uint16_t const *bi,         /*  in - pointer to the list of nonzero
                                         indices of ring element b,
                                         containing indices for the +1
                                         coefficients followed by the
                                         indices for -1 coefficients */
    uint16_t const  N,          /*  in - no. of coefficients in a, b, c */
    uint16_t const  q,          /*  in - large modulus */
    uint16_t       *t,          /*  in - temp buffer of N elements */
    uint16_t       *c)          /* out - address for polynomial c */
{
#ifdef NTRUENVSSE3
    ntru_ring_mult_indices_sse3
        (a, bi_P1_len, bi_M1_len, bi, N, q, t, c);
    return;
#endif
#ifdef NTRUENV64BIT
    ntru_ring_mult_indices_quadruple_width_conv
        (a, bi_P1_len, bi_M1_len, bi, N, q, t, c);
    return;
#endif
#ifdef NTRUENV32BIT
    ntru_ring_mult_indices_double_width_conv
        (a, bi_P1_len, bi_M1_len, bi, N, q, t, c);
    return;
#endif
#ifdef NTRUENVUNKNOWN
    ntru_ring_mult_indices_orig (a, bi_P1_len, bi_M1_len, bi, N, q, t, c);
    return;
#endif
}



/* ntru_ring_mult_product_indices
 *
 * Multiplies ring element (polynomial) "a" by ring element (polynomial) "b"
 * to produce ring element (polynomial) "c" in (Z/qZ)[X]/(X^N - 1).
 * This is a convolution operation.
 *
 * Ring element "b" is represented by the product form b1 * b2 + b3, where
 * b1, b2, and b3 are each a sparse trinary polynomial with coefficients -1,
 * 0, and 1.  It is specified by a list, bi, of the nonzero indices of b1, b2,
 * and b3, containing the indices for the +1 coefficients followed by the
 * indices for the -1 coefficients for each polynomial in that order.
 * The indices are in the range [0,N).
 *
 * The result array "c" may share the same memory space as input array "a",
 * or input array "b".
 *
 * This assumes q is 2^r where 8 < r < 16, so that overflow of the sum
 * beyond 16 bits does not matter.
 */

void
ntru_ring_mult_product_indices(
    uint16_t const *a,          /*  in - pointer to ring element a */
    uint16_t const  b1i_len,    /*  in - no. of +1 or -1 coefficients in b1 */
    uint16_t const  b2i_len,    /*  in - no. of +1 or -1 coefficients in b2 */
    uint16_t const  b3i_len,    /*  in - no. of +1 or -1 coefficients in b3 */
    uint16_t const *bi,         /*  in - pointer to the list of nonzero
                                         indices of polynomials b1, b2, b3,
                                         containing indices for the +1
                                         coefficients followed by the
                                         indices for -1 coefficients for
                                         each polynomial */
    uint16_t const  N,          /*  in - no. of coefficients in a, b, c */
    uint16_t const  q,          /*  in - large modulus */
    uint16_t       *t,          /*  in - temp buffer of 2N elements */
    uint16_t       *c)          /* out - address for polynomial c */
{
    uint16_t *t2 = t + N;
    uint16_t  mod_q_mask = q - 1;
    uint16_t  i;
    
    /* t2 = a * b1 */

    ntru_ring_mult_indices(a, b1i_len, b1i_len, bi, N, q, t, t2);

    /* t2 = (a * b1) * b2 */

    ntru_ring_mult_indices(t2, b2i_len, b2i_len, bi + (b1i_len << 1), N, q,
                           t, t2);

    /* t = a * b3 */

    ntru_ring_mult_indices(a, b3i_len, b3i_len,
                           bi + ((b1i_len + b2i_len) << 1), N, q, t, t);

    /* c = (a * b1 * b2) + (a * b3) */

    for (i = 0; i < N; i++)
    {
        c[i] = (t2[i] + t[i]) & mod_q_mask;
    }
    
    return;
}


#if defined(NTRUENVSSE3)
static void
grade_school_mul(
    uint16_t        *res1,   /* out - a * b in Z[x], must be length 2N */
    uint16_t        *tmp1,   /*  in - N coefficients of scratch space */
    uint16_t const  *a,     /*  in - polynomial */
    uint16_t const  *b,     /*  in - polynomial */
    uint16_t const   N)     /*  in - number of coefficients in a and b */
{
  uint16_t const padN = (N + 0x0007) & 0xfff8;
  __m128i *T = alloca(2*padN*sizeof(uint16_t));
  memset(T,0,2*padN*sizeof(uint16_t));

  uint16_t i;
  uint16_t j;
  uint16_t m;

  __m128i abroad[8];

  __m128i cur;
  __m128i next;
  __m128i x2;
  for(i=0; i<padN/8; i++)
  {
    /* Broadcast each of the uint16's at a[8*i] into 8
       copies of that value in a separate __m128i. */
    __m128i ai8 = _mm_load_si128((__m128i *) a+i);
    __m128i ai8h = _mm_unpackhi_epi16(ai8,ai8);
    __m128i ai8l = _mm_unpacklo_epi16(ai8,ai8);
    abroad[0] = _mm_shuffle_epi32(ai8h, 0xFFFF);
    abroad[1] = _mm_shuffle_epi32(ai8h, 0xAAAA);
    abroad[2] = _mm_shuffle_epi32(ai8h, 0x5555);
    abroad[3] = _mm_shuffle_epi32(ai8h, 0x0000);

    abroad[4] = _mm_shuffle_epi32(ai8l, 0xFFFF);
    abroad[5] = _mm_shuffle_epi32(ai8l, 0xAAAA);
    abroad[6] = _mm_shuffle_epi32(ai8l, 0x5555);
    abroad[7] = _mm_shuffle_epi32(ai8l, 0x0000);

    /* Load a 256 bit section of b.
       Shift it down by 2*(m+1) bytes and multiply the
       low 128 bits by abroad[m]. Add all 8 of these
       values to T[i+j]. */
    cur = _mm_setzero_si128();
    for(j=0; j<(padN/8); j++)
    {
      next = _mm_load_si128((__m128i *) b+j);

      x2 = _mm_xor_si128(x2,x2);
      for(m=0; m<8; m++)
      {
        cur = _mm_alignr_epi8(next, cur, 2);
        next = _mm_srli_si128(next, 2);

        __m128i x1 = _mm_mullo_epi16(cur, abroad[m]);
        x2 = _mm_add_epi16(x2, x1);
      }
      x2 = _mm_add_epi16(x2, _mm_load_si128(T+i+j));
      _mm_store_si128(T+i+j, x2);
    }

    /* Handle the last N&7 coefficients from a */
    x2 = _mm_xor_si128(x2,x2);
    for(m=0; m < (N&7); m++)
    {
      cur = _mm_srli_si128(cur, 2);

      __m128i x1 = _mm_mullo_epi16(cur, abroad[m]);
      x2 = _mm_add_epi16(x2, x1);
    }
    _mm_store_si128(T+i+j, x2);
  }

  memcpy(res1, T, 2*N*sizeof(uint16_t));

  return;
}
#else
static void
grade_school_mul(
    uint16_t        *res1,   /* out - a * b in Z[x], must be length 2N */
    uint16_t        *tmp1,   /*  in - N coefficients of scratch space */
    uint16_t const  *a,     /*  in - polynomial */
    uint16_t const  *b,     /*  in - polynomial */
    uint16_t const   N)     /*  in - number of coefficients in a and b */
{
    uint16_t i;
    uint16_t j;

    for(j=0; j<N; j++)
    {
        res1[j] = a[0]*b[j];
    }
    for(i=1; i<N; i++)
    {
        res1[i+N-1] = 0;
        for(j=0; j<N; j++)
        {
            res1[i+j] += a[i]*b[j];
        }
    }
    res1[2*N-1] = 0;

    return;
}
#endif

#if !defined(NTRUENVSSE3)
static void
karatsuba(
    uint16_t        *res1,   /* out - a * b in Z[x], must be length 2k */
    uint16_t        *tmp1,   /*  in - k coefficients of scratch space */
    uint16_t const  *a,     /*  in - polynomial */
    uint16_t const  *b,     /*  in - polynomial */
    uint16_t const   k)     /*  in - number of coefficients in a and b */
{
    uint16_t i;

    /* Grade school multiplication for small / odd inputs */
    if(k <= 38 || (k & 1) != 0)
    {
      grade_school_mul(res1,tmp1,a,b,k);
      return;
    }

    uint16_t const p = k>>1;

    uint16_t *res2 = res1+p;
    uint16_t *res3 = res1+k;
    uint16_t *res4 = res1+k+p;
    uint16_t *tmp2 = tmp1+p;
    uint16_t const *a2 = a+p;
    uint16_t const *b2 = b+p;

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
#endif


/* ntru_ring_mult_coefficients
 *
 * Multiplies ring element (polynomial) "a" by ring element (polynomial) "b"
 * to produce ring element (polynomial) "c" in (Z/qZ)[X]/(X^N - 1).
 * This is a convolution operation.
 *
 * Ring element "b" has coefficients in the range [0,N).
 *
 * This assumes q is 2^r where 8 < r < 16, so that overflow of the sum
 * beyond 16 bits does not matter.
 */

void
ntru_ring_mult_coefficients(
    uint16_t const *a,          /*  in - pointer to polynomial a */
    uint16_t const *b,          /*  in - pointer to polynomial b */
    uint16_t        N,          /*  in - degree of (x^N - 1) */
    uint16_t        padN,       /*  in - no. of coefficients in a, b, c */
    uint16_t        q,          /*  in - large modulus */
    uint16_t       *tmp,        /*  in - temp buffer of 3*padN elements */
    uint16_t       *c)          /* out - address for polynomial c */
{
    uint16_t i;
    uint16_t q_mask = q-1;

#if !defined(NTRUENVSSE3)
    memset(tmp, 0, 3*padN*sizeof(uint16_t));
    karatsuba(tmp, tmp+2*padN, a, b, N);
#else
    grade_school_mul(tmp, tmp+2*padN, a, b, N);
#endif

    for(i=0; i<N; i++)
    {
        c[i] = (tmp[i] + tmp[i+N]) & q_mask;
    }

    return;
}


/* ntru_ring_inv
 *
 * Finds the inverse of a polynomial, a, in (Z/2Z)[X]/(X^N - 1).
  */

bool
ntru_ring_inv(
    uint16_t       *a,          /*  in - pointer to polynomial a */
    uint16_t        N,          /*  in - no. of coefficients in a */
    uint16_t       *t,          /*  in - temp buffer of 2N elements */
    uint16_t       *a_inv)      /* out - address for polynomial a^-1 */
{
    uint8_t  *b = (uint8_t *)t;     /* b cannot be in a_inv since it must be
                                       rotated and copied there as a^-1 mod 2 */
    uint8_t  *c = b + N;            /* c cannot be in a_inv since it exchanges
                                       with b, and b cannot be in a_inv */
    uint8_t  *f = c + N;
    uint8_t  *g = (uint8_t *)a_inv; /* g needs N + 1 bytes */
    uint16_t  deg_b;
    uint16_t  deg_c;
    uint16_t  deg_f;
    uint16_t  deg_g;
    uint16_t  k = 0;
    uint16_t  i, j;

    if (a == NULL || t == NULL || a_inv == NULL)
    {
        return FALSE;
    }

    /* form a^-1 in (Z/2Z)[X]/(X^N - 1) */

    memset(b, 0, (N << 1));         /* clear to init b, c */

    /* b(X) = 1 */

    b[0] = 1;
    deg_b = 0;

    /* c(X) = 0 (cleared above) */

    deg_c = 0;

    /* f(X) = a(X) mod 2 */

    deg_f = 0;
    for (i = 0; i < N; i++)
    {
        f[i] = (uint8_t)(a[i] & 1);
        if(f[i]) deg_f = i;
    }

    /* g(X) = X^N - 1 */

    g[0] = 1;
    memset(g + 1, 0, N - 1);
    g[N] = 1;
    deg_g = N;

    /* until f(X) = 1 */

    while (1)
    {
        /* while f[0] = 0, f(X) /= X, c(X) *= X, k++ */

        for (i = 0; (i <= deg_f) && (f[i] == 0); ++i);
        if (i > deg_f)
            return FALSE;
        if (i) {
            k = k + i;

            f = f + i;
            deg_f = deg_f - i;

            memmove(c+i, c, deg_c+1);
            memset(c, 0, i);
            deg_c = deg_c + i;
        }

        /* if f(X) = 1, done */

        if (deg_f == 0)
        {
            break;
        }

        /* if deg_f < deg_g, f <-> g, b <-> c */

        if (deg_f < deg_g)
        {
            uint8_t *x;

            x = f;
            f = g;
            g = x;
            deg_f ^= deg_g;
            deg_g ^= deg_f;
            deg_f ^= deg_g;
            x = b;
            b = c;
            c = x;
            deg_b ^= deg_c;
            deg_c ^= deg_b;
            deg_b ^= deg_c;
        }

        /* f(X) += g(X)
         * might change degree of f if deg_g >= deg_f
         */

        #if defined(NTRUENV64BIT) || defined(NTRUENVSSE3)
        for (i = 0; i <= deg_g-8; i+=8)
        {
            uint64_t x;
            uint64_t y;
            memcpy(&x, f+i, sizeof(uint64_t));
            memcpy(&y, g+i, sizeof(uint64_t));
            x^=y;
            memcpy(f+i, &x, sizeof(uint64_t));
        }
        #elif defined(NTRUENV32BIT)
        for (i = 0; i <= deg_g-4; i+=4)
        {
            uint32_t x;
            uint32_t y;
            memcpy(&x, f+i, sizeof(uint32_t));
            memcpy(&y, g+i, sizeof(uint32_t));
            x^=y;
            memcpy(f+i, &x, sizeof(uint32_t));
        }
        #else
        i=0;
        #endif
        for (; i<=deg_g; i++)
        {
            f[i] ^= g[i];
        }

        if(deg_g == deg_f)
        {
            while(deg_f > 0 && f[deg_f] == 0)
            {
                --deg_f;
            }
        }

        /* b(X) += c(X) */
        #if defined(NTRUENV64BIT) || defined(NTRUENVSSE3)
        for (i = 0; i <= deg_c-8; i+=8)
        {
            uint64_t x;
            uint64_t y;
            memcpy(&x, b+i, sizeof(uint64_t));
            memcpy(&y, c+i, sizeof(uint64_t));
            x^=y;
            memcpy(b+i, &x, sizeof(uint64_t));
        }
        #elif defined(NTRUENV32BIT)
        for (i = 0; i <= deg_c-4; i+=4)
        {
            uint32_t x;
            uint32_t y;
            memcpy(&x, b+i, sizeof(uint32_t));
            memcpy(&y, c+i, sizeof(uint32_t));
            x^=y;
            memcpy(b+i, &x, sizeof(uint32_t));
        }
        #else
        i=0;
        #endif
        for (; i<=deg_c; i++)
        {
            b[i] ^= c[i];
        }

        if (deg_c >= deg_b)
        {
            deg_b = deg_c;
            while(deg_b > 0 && b[deg_b] == 0)
            {
                --deg_b;
            }
        }
    }

    /* a^-1 in (Z/2Z)[X]/(X^N - 1) = b(X) shifted left k coefficients */

    j = 0;

    if (k >= N)
    {
        k = k - N;
    }

    for (i = k; i < N; i++)
    {
        a_inv[j++] = (uint16_t)(b[i]);
    }

    for (i = 0; i < k; i++)
    {
        a_inv[j++] = (uint16_t)(b[i]);
    }

    return TRUE;
}
