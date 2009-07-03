/* FILE: essence.h
 *
 * AUTHOR: Jason Worth Martin <jason.worth.martin@gmail.com>
 *
 * DESCRIPTION: This file contains macros and declarations
 * used internally in the ESSENCE implementation.
 *
 */
#ifndef _ESSENCE_H_
#define _ESSENCE_H_
#include "essence_api.h"

#if ESSENCE_USE_PARALLEL_CODE == 1
#include <stdlib.h>
#endif

#if ESSENCE_DEBUG_LEVEL > 0
#include <stdio.h>
#endif

/*
 * This macro corresponds to the F function
 * used in ESSENCE.
 *
 * least significant outputs = 0x0c9ac1ac7974f57b
 * most significant outputs  = 0x997083d5c9316b14
 *
 * This is the Reduced Normal Form of the F function.  This is the
 * same code as in Appendix A of ESSENCE: A Family of Cryptographic
 * Hashing Algorithms.
 *
 */
#define F_func_Reduced_Normal_Form(a,b,c,d,e,f,g)	\
  (							\
   ((a)&(~(b))&(c)&(d)&(e)&(f)&(~(g)))^			\
   ((a)&(b)&(c)&(e)&(~(f))&(g))^			\
   ((a)&(b)&(d)&(~(e))&(g))^				\
   ((a)&(b)&(e)&(f)&(g))^				\
   ((a)&(~(b))&(d)&(e)&(f))^				\
   ((a)&(c)&(e)&(f)&(g))^				\
   ((a)&(~(c))&(d)&(f)&(~(g)))^				\
   ((a)&(d)&(e)&(~(f))&(g))^				\
   ((b)&(c)&(d)&(f)&(g))^				\
   ((b)&(d)&(e)&(~(f))&(g))^				\
   ((c)&(d)&(e)&(f)&(~(g)))^				\
   ((a)&(b)&(~(c))&(g))^				\
   ((~(a))&(b)&(c)&(~(f)))^				\
   ((b)&(c)&(~(e))&(g))^				\
   ((b)&(~(c))&(d)&(e))^				\
   ((a)&(b)&(f))^					\
   ((a)&(~(b))&(e))^					\
   ((a)&(c)&(g))^					\
   ((a)&(d)&(~(g)))^					\
   ((a)&(e)&(g))^					\
   ((~(a))&(e)&(f))^					\
   ((b)&(d)&(~(f)))^					\
   ((b)&(e)&(g))^					\
   ((~(b))&(f)&(g))^					\
   ((c)&(~(d))&(~(e)))^					\
   ((~(c))&(d)&(f))^					\
   ((d)&(e)&(f))^					\
   ((d)&(~(e))&(g))^					\
   ((d)&(f)&(g))^					\
   ((~(a)))^						\
   ((b))^						\
   ((f))						\
							)
    
/*
 * This is a faster version of the F function for most processors.  It
 * is algebraically equivalent to the Reduced Normal Form version
 * above, but uses fewer total operations and fewer intermediate
 * values.  This was created by using some heuristics for combining
 * terms from the Reduced Normal Form.  However, the Reduced Normal
 * Form version above has a much shorter critical path (the Reduced
 * Normal Form version is 2-level logic) so the Reduced Normal Form
 * version will execute faster on processors that have massive
 * register files and many ALU execution units.
 */
#define F_func_RNF_combined(a,b,c,d,e,f,g)     		\
  (							\
   (((f)&(((d)&(((c)&((((a)&(~(b))&(e)&(~(g))) ^	\
		       ((b)&(g)) ^			\
		       ((e)&(~(g)))))) ^		\
		((~(c))&((~(((a)&(~(g))))))) ^		\
		((((a)&(~(b))&(e)) ^			\
		  ((e)) ^				\
		  ((g)))))) ^				\
	  ((~(((a)&(b)&(e)&(g)) ^			\
	      ((a)&(c)&(e)&(g)) ^			\
	      ((a)&(b)) ^				\
	      ((~(a))&(e)) ^				\
	      ((~(b))&(g))))))) ^			\
    ((~(f))&(((b)&((((a)&(c)&(e)&(g)) ^			\
		    ((d)&(e)&(g)) ^			\
		    ((~(a))&(c)) ^			\
		    ((d))))) ^				\
	     ((((a)&(d)&(e)&(g)))))) ^			\
    (((e)&((((b)&(~(c))&(d)) ^				\
	    ((a)&(~(b))) ^				\
	    ((a)&(g)) ^					\
	    ((b)&(g))))) ^				\
     ((~(e))&((((a)&(b)&(d)&(g)) ^			\
	       ((b)&(c)&(g)) ^				\
	       ((c)&(~(d))) ^				\
	       ((d)&(g))))) ^				\
     ((((a)&(b)&(~(c))&(g)) ^				\
       ((a)&(c)&(g)) ^					\
       ((a)&(d)&(~(g))) ^				\
       ((~(a))) ^					\
       ((b))))))					\
							)



/*
 * This version of the F function uses the techniques described in
 * Joan Boyar and Rene Peralta's paper "New logic minimization
 * techniques with applications to cryptology."
 *
 * Here's the BibTeX citation for the paper:
 *
 * @misc{cryptoeprint:2009:191,
 *   author = {Joan Boyar and Rene Peralta},
 *   title = {New logic minimization techniques with applications to cryptology.},
 *   howpublished = {Cryptology ePrint Archive, Report 2009/191},
 *   year = {2009},
 *   note = {\url{http://eprint.iacr.org/}},
 * }
 *
 *
 * What is fascinating about this expression is that even though it
 * appears to have more operations in it than the expression above,
 * many of the subexpressions are re-used.  So, the compiled form
 * actually results in fewer total operations due to the re-used
 * subexpressions.  So far, this is the fastest version of the F
 * function for the Core 2.
 *
 */
#define F_func_Boyar_Peralta(a,b,c,d,e,f,g)		       		\
  (									\
   (d)&(((a)&((((((~(b)) ^ (e)) & (~(g))) ^ (b)) ^ (e)) ^		\
	      (((f) ^ (g)) & ((((((b) ^ (f)) ^ (c)) & (f)) ^ (b)) &	\
			      ((((b) ^ (f)) & (~(e))) ^ (b)))))) ^	\
	((((e) ^ ((((b) ^ (f)) & (~(e))) ^ (b))) &			\
	  (((((~(g)) ^ (b)) ^ (c)) ^ (f)) &				\
	   (((((b) ^ (f)) ^ (c)) &					\
	     (f)) ^ (((((~(b)) ^ (e)) & (~(g))) ^			\
		      (b)) ^ (e))))) ^					\
	 ((((b) ^ ((f) ^ (g))) ^ (c)) ^ (e)))) ^			\
   ((a)&((((g) ^							\
	   (((((~(b)) ^ (e)) & (~(g))) ^ (b)) ^				\
	    (e))) & ((((b) ^ ((f) ^ (g))) ^				\
		      (c)) & (((((((b) ^ (f)) ^ (c)) & (f)) ^ (b)) &	\
			       ((((b) ^ (f)) & (~(e))) ^ (b))) ^	\
			      ((((b) ^ (f)) & (~(e))) ^			\
			       ((g) ^ (((((~(b)) ^ (e)) &		\
					 (~(g))) ^ (b)) ^		\
				       (e))))))) ^			\
	 ((((b) ^ (f)) & (~(e))) ^					\
	  ((f) ^ ((e) ^							\
		  (((((~(g)) ^ (b)) ^ (c)) ^ (f)) &			\
		   (((((b) ^ (f)) ^ (c)) & (f)) ^			\
		    (((((~(b)) ^ (e)) & (~(g))) ^ (b)) ^		\
		     (e))))))))) ^					\
   ((((b) ^ (((b) ^ ((f) ^ (g))) ^ (c))) &				\
     ((e) & ((c) ^ (((f) ^ (g)) &					\
		    ((((((b) ^ (f)) ^ (c)) & (f)) ^ (b)) &		\
		     ((((b) ^ (f)) & (~(e))) ^ (b))))))) ^		\
    ((((~(b)) ^ (e)) & (~(g))) ^					\
     ((((f) ^ (g)) & ((((((b) ^ (f)) ^ (c)) & (f)) ^ (b)) &		\
		      ((((b) ^ (f)) & (~(e))) ^ (b)))) ^		\
      (((((b) ^ (f)) ^ (c)) & (f)) ^					\
       ((e) ^ ((((b) ^ ((f) ^ (g))) ^ (c)) &				\
	       (((((((b) ^ (f)) ^ (c)) & (f)) ^ (b)) &			\
		 ((((b) ^ (f)) & (~(e))) ^ (b))) ^			\
		((((b) ^ (f)) & (~(e))) ^				\
		 ((g) ^							\
		  (((((~(b)) ^ (e)) & (~(g))) ^				\
		    (b)) ^ (e))))))					\
	)								\
       )								\
      )									\
     )									\
    )									\
									)






/*
 * This corresponds to the polynomial:
 *
 * p_64 = x^64 + x^63 + x^61 + x^60 + x^55 + x^53 + x^50 + x^49 + x^46
 * + x^44 + x^41 + x^40 + x^36 + x^33 + x^32 + x^31 + x^30 + x^29 +
 * x^26 + x^25 + x^23 + x^20 + x^18 + x^17 + x^14 + x^13 + x^11 + x^8
 * + x^7 + x^4 + x^2 + x + 1
 * 
 */
#define P_64 0xb0a65313e6966997LL


/*
 * This corresponds to the polynomial:
 *
 * p_32 = x^32 + x^31 + x^24 + x^22 + x^19 + x^17 + x^13 + x^12 + x^11
 * + x^9 + x^8 + x^5 + x^4 + x^2 + 1
 *
 */
#define P_32 0x814a3b35






/*
 * The following is an attempt to get gcc to emit SIMD instructions
 * for data structures that are "obviously" vectors, while at the same
 * time allowing the programmer to access the individual elements of
 * the vectors in a convenient fashion.  If you know of a better way
 * to do this, please tell me!
 *
 */

/*
 * 128 bit integer vector types
 */
typedef uint64_t vec_2_uint64 __attribute ((vector_size (16)));
typedef int64_t  vec_2_int64  __attribute ((vector_size (16)));
typedef uint32_t vec_4_uint32 __attribute ((vector_size (16)));
typedef int32_t  vec_4_int32  __attribute ((vector_size (16)));
typedef uint16_t vec_8_uint16 __attribute ((vector_size (16)));
typedef int16_t  vec_8_int16  __attribute ((vector_size (16)));
typedef uint8_t  vec_16_uint8 __attribute ((vector_size (16)));
typedef int8_t   vec_16_int8  __attribute ((vector_size (16)));
typedef union
{
  vec_2_uint64 v2ui64;
  vec_2_int64  v2i64;
  vec_4_uint32 v4ui32;
  vec_4_int32  v4i32;
  vec_8_uint16 v8ui16;
  vec_8_int16  v8i16;
  vec_16_uint8 v16ui8;
  vec_16_int8  v16i8;
  uint64_t     array_ui64[2];
  int64_t      array_i64[2];
  uint32_t     array_ui32[4];
  int32_t      array_i32[4];
  uint16_t     array_ui16[8];
  int16_t      array_i16[8];
  uint8_t      array_ui8[16];
  int8_t       array_i8[16];
} vec_128;

/*
 * 64 bit integer vector types
 */
typedef uint64_t vec_1_uint64 __attribute ((vector_size (8)));
typedef int64_t  vec_1_int64  __attribute ((vector_size (8)));
typedef uint32_t vec_2_uint32 __attribute ((vector_size (8)));
typedef int32_t  vec_2_int32  __attribute ((vector_size (8)));
typedef uint16_t vec_4_uint16 __attribute ((vector_size (8)));
typedef int16_t  vec_4_int16  __attribute ((vector_size (8)));
typedef uint8_t  vec_8_uint8  __attribute ((vector_size (8)));
typedef int8_t   vec_8_int8   __attribute ((vector_size (8)));
typedef union
{
  vec_1_uint64 v1ui64;
  vec_1_int64  v1i64;
  vec_2_uint32 v2ui32;
  vec_2_int32  v2i32;
  vec_4_uint16 v4ui16;
  vec_4_int16  v4i16;
  vec_8_uint8 v8ui8;
  vec_8_int8  v8i8;
  uint64_t     array_ui64;
  int64_t      array_i64;
  uint32_t     array_ui32[2];
  int32_t      array_i32[2];
  uint16_t     array_ui16[4];
  int16_t      array_i16[4];
  uint8_t      array_ui8[8];
  int8_t       array_i8[8];
} vec_64;



/*
 * Definitions for the L_32 and L_64 tables
 * defined in the essence_L_tables.c file
 */

extern uint32_t L_32_table[256];
extern uint64_t L_64_table[256];




/* ******************************************************************************************
 * ******************************************************************************************
 *
 * The following function declarations are for use with the various
 * alternative implementations of the compression functions.  These
 * include assembly level implementations which need to be separately
 * compiled and linked.
 *
 * ******************************************************************************************
 * *****************************************************************************************/

void essence_compress_512(uint64_t *,
			  BitSequence *,
			  uint64_t,
			  uint64_t);

void essence_compress_256(uint32_t *,
			  BitSequence *,
			  uint64_t,
			  uint64_t);

void essence_compress_256_dual(uint32_t *,
			       uint32_t *,
			       BitSequence *,
			       BitSequence *,
			       uint64_t,
			       uint64_t);

#endif /* _ESSENCE_H_ */
