/**
 * @file magic.h
 * @copyright
 *   Copyright (c) 2014 Cryptography Research, Inc.  \n
 *   Released under the MIT License.  See LICENSE.txt for license information.
 * @author Mike Hamburg
 * @brief Goldilocks magic numbers (group orders, coefficients, algo params etc).
 */


#ifndef __GOLDI_MAGIC_H__
#define __GOLDI_MAGIC_H__ 1

#include "word.h"
#include "p448.h"
#include "ec_point.h"

/* TODO: standardize notation */


/** @brief The number of bits in the Goldilocks field. */
#define GOLDI_FIELD_BITS 448

/** @brief The number of words in the Goldilocks field. */
#define GOLDI_FIELD_WORDS DIV_CEIL(GOLDI_FIELD_BITS,WORD_BITS)

/** @brief The number of bits in the Goldilocks curve's cofactor (cofactor=4). */
#define COFACTOR_BITS 2

/** @brief The number of bits in a Goldilocks scalar. */
#define SCALAR_BITS (GOLDI_FIELD_BITS - COFACTOR_BITS)

/** @brief The number of words in the Goldilocks field. */
#define SCALAR_WORDS WORDS_FOR_BITS(SCALAR_BITS)

/**
 * @brief sqrt(d-1), used for point formats and twisting.
 */
extern const struct p448_t sqrt_d_minus_1;

/**
 * @brief The base point for Goldilocks.
 */
extern const struct affine_t goldilocks_base_point;

/**
 * @brief The Goldilocks prime subgroup order.
 */ 
extern const struct barrett_prime_t curve_prime_order;

/**
 * @brief Window size for fixed-window signed binary scalarmul.
 * Table size is 2^(this - 1).
 */
#define SCALARMUL_FIXED_WINDOW_SIZE 5

/**
 * @brief Even/odd adjustments for fixed window with
 * ROUNDUP(SCALAR_BITS,SCALARMUL_FIXED_WINDOW_SIZE).
 */
extern const word_t SCALARMUL_FIXED_WINDOW_ADJUSTMENT[2*SCALAR_WORDS];

/**
 * @brief Table size for wNAF signed binary (variable-time) scalarmul.
 * Table size is 2^this.
 */
#define SCALARMUL_WNAF_TABLE_BITS 3

/**
 * @brief Table size for wNAF signed binary (variable-time) linear combo.
 * Table size is 2^this.
 */
#define SCALARMUL_WNAF_COMBO_TABLE_BITS 4

/**
 * @brief If true, use wider tables for the precomputed combs.
 */
#ifndef USE_BIG_COMBS
#if defined(__ARM_NEON__)
#define USE_BIG_COMBS 1
#else
#define USE_BIG_COMBS (WORD_BITS==64)
#endif
#endif

/** @brief The number of combs to use for signed comb algo */
#define COMB_N (USE_BIG_COMBS ? 5  : 8)

/** @brief The number of teeth of the combs for signed comb algo */
#define COMB_T (USE_BIG_COMBS ? 5  : 4)

/** @brief The spacing the of combs for signed comb algo */
#define COMB_S (USE_BIG_COMBS ? 18 : 14)

/**
 * @brief The bit width of the precomputed WNAF tables.  Size is 2^this elements.
 */
#define WNAF_PRECMP_BITS 5

/**
 * @brief crandom magic structure guard constant = "return 4", cf xkcd #221
 */
#define CRANDOM_MAGIC 0x72657475726e2034ull

#endif /* __GOLDI_MAGIC_H__ */
