/**
 * @file field.h
 * @brief Field switch code.
 * @copyright
 *   Copyright (c) 2014 Cryptography Research, Inc.  \n
 *   Released under the MIT License.  See LICENSE.txt for license information.
 * @author Mike Hamburg
 */
#ifndef __FIELD_H__
#define __FIELD_H__
#include "magic.h"

#include "p448.h"

#define field_t              p448_t
#define field_mul            p448_mul
#define field_add            p448_add
#define field_sub            p448_sub
#define field_bias           p448_bias
#define field_copy           p448_copy
#define field_weak_reduce    p448_weak_reduce
#define field_strong_reduce  p448_strong_reduce
#define field_cond_swap      p448_cond_swap
#define field_cond_neg       p448_cond_neg
#define field_serialize      p448_serialize
#define field_deserialize    p448_deserialize
#define field_eq             p448_eq
#define field_is_zero        p448_is_zero
#define simultaneous_invert  simultaneous_invert_p448 /* FUTURE: consistency */

#endif /* __FIELD_H__ */
