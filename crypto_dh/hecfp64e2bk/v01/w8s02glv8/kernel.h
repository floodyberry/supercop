/**
 * @file kernel.h
 * @brief Low level functions and nonportable macros.
 * This file is the basis of hardware abstraction. We strongly recommend
 * not to alter these macros unless you consult with one of the authors.
 * Its development is not finished recently. Assembly support will be added by
 * CRYMPIX-v.1.0.0.
 *
 * This file is a part of the freeware CRYMPIX
 * CRYPTOGRAPHIC MULTIPRECISION SOFTWARE Library.
 * This software is initially designed and developed in the
 * Information System Strategy and Security Laboratory (IS3)
 * of Izmir Institute of Technology (IZTECH).
 *
 * CRYMPIX is engineered to provide a portable environment
 * for the implementation of the latest techniques in
 * computational number theory and cryptology.
 * The content can be modified with the sole condition
 * that this header is kept as is.
 * We provide no guarantee for the correctness and
 * completeness of this software.
 *
 * Please report the bugs to:
 *    crympix-bug@is3.iyte.edu.tr
 *
 * Please submit your contributions to:
 *    crympix-devel@is3.iyte.edu.tr
 *
 * Thank you for using this software.
 *
 * @author Huseyin Hisil <huseyinhisil AT iyte.edu.tr, h.hisil AT qut.edu.au>
 * @author Ali Mersin <alimersin AT iyte.edu.tr>
 * @author Evren Akalp <akalpevren AT iyte.edu.tr>
 * @author Mutlu Beyazit <mutlubeyazit AT iyte.edu.tr>
 * @author Sevgi Uslu <sevgiuslu AT iyte.edu.tr>
 * @date Build May 2004, Last Updated Mar 2006.
 **/
#include <stdio.h>
#include "_core.h"


/**
 * @see km_mul_2
 **/
#ifdef SUPPORT_PROCESSOR_x86
#define km_mul_2(zH, zL, a, b) __asm__( \
	"mull %3;" \
	: "=d"((zH)), "=a"((zL)) \
	: "a"((a)), "m"((b)) \
)
#endif

/**
 * @see km_mul_2_add_c
 **/
#ifdef SUPPORT_PROCESSOR_x86
#define km_mul_2_add_c(zH, zL, a, b, c) __asm__( \
	"mull %3;" \
	"addl %4, %%eax;" \
	"adcl $0, %%edx;" \
	: "=&d"((zH)), "=a"((zL)) \
	: "a"((a)), "m"((b)), "m"((c)) \
)
#endif

/**
 * @see km_mul_2_add_2
 **/
#ifdef SUPPORT_PROCESSOR_x86
#define km_mul_2_add_2(zH, zL, a, b, c, d) __asm__( \
	"mull %%ebx;" \
	"addl %4, %%eax;" \
	"adcl $0, %%edx;" \
	"addl %5, %%eax;" \
	"adcl $0, %%edx;" \
	: "=&d"((zH)), "=a"((zL)) \
	: "a"((a)), "b"((b)), "m"((c)), "m"((d)) \
)
#endif

/*
#define km_add_c(cr, z, a, b, c)if(1){ \
	uni_t _t; \
	_t = (a) + (b) + (c); \
	if(_t < (a)){ \
		(cr) = 1; \
	} \
	else if(_t > (a)){ \
		(cr) = 0; \
	} \
	(z) = _t; \
}
*/

/*
#ifdef SUPPORT_PROCESSOR_x86_64
#define km_add_c(cr, z, a, b, c) __asm__( \
	"addq %4, %%rax;" \
	"movq $0x0, %%rdx;" \
	"adcq %3, %%rax;" \
	"adcq $0x0, %%rdx;" \
	: "=&d"((cr)), "=a"((z)) \
	: "a"((a)), "b"((b)), "c"((c)) \
)
#endif
*/

/**
 * @see km_mul_2
 **/
#ifdef SUPPORT_PROCESSOR_x86_64
#define km_mul_2(zH, zL, a, b) __asm__( \
	"mulq %3;" \
	: "=d"((zH)), "=a"((zL)) \
	: "a"((a)), "m"((b)) \
)
#endif

/**
 * @see km_mul_2_add_c
 **/
#ifdef SUPPORT_PROCESSOR_x86_64
#define km_mul_2_add_c(zH, zL, a, b, c) __asm__( \
	"mulq %3;" \
	"addq %4, %%rax;" \
	"adcq $0, %%rdx;" \
	: "=&d"((zH)), "=a"((zL)) \
	: "a"((a)), "m"((b)), "m"((c)) \
)
#endif

/**
 * @see km_mul_2_add_2
 **/
#ifdef SUPPORT_PROCESSOR_x86_64
#define km_mul_2_add_2(zH, zL, a, b, c, d) __asm__( \
	"mulq %%rbx;" \
	"addq %4, %%rax;" \
	"adcq $0, %%rdx;" \
	"addq %5, %%rax;" \
	"adcq $0, %%rdx;" \
	: "=&d"((zH)), "=a"((zL)) \
	: "a"((a)), "b"((b)), "m"((c)), "m"((d)) \
)
#endif


/**
 * @see km_fetch_lo
 **/
#ifdef SUPPORT_DOUBLE_PRECISION_C99
#ifndef km_fetch_lo
#define km_fetch_lo(a) ((uni_t)(a))
#endif
#endif

/**
 * @see km_fetch_hi
 **/
#ifdef SUPPORT_DOUBLE_PRECISION_C99
#ifndef km_fetch_hi
#define km_fetch_hi(a) ((a) >> UNIT_LEN)
#endif
#endif

/**
 * @see km_lo_to_hi
 **/
#ifdef SUPPORT_DOUBLE_PRECISION_C99
#ifndef km_lo_to_hi
#define km_lo_to_hi(a) ((unid_t)(a) << UNIT_LEN)
#endif
#endif

/**
 * @see km_mul_2
 **/
#ifdef SUPPORT_DOUBLE_PRECISION_C99
#ifndef km_mul_2
#define km_mul_2(zH, zL, a, b)if(1){ \
	unid_t _t_; \
	_t_ = (unid_t)(a) * (b); \
	(zL) = km_fetch_lo(_t_); \
	(zH) = km_fetch_hi(_t_); \
}
#endif
#endif

/**
 * @see km_mul_2_add_c
 **/
#ifdef SUPPORT_DOUBLE_PRECISION_C99
#ifndef km_mul_2_add_c
#define km_mul_2_add_c(zH, zL, a, b, c)if(1){ \
	unid_t _t_; \
	_t_ = (unid_t)(a) * (b) + (c); \
	(zL) = km_fetch_lo(_t_); \
	(zH) = km_fetch_hi(_t_); \
}
#endif
#endif

/**
 * @see km_mul_2_add_2
 **/
#ifdef SUPPORT_DOUBLE_PRECISION_C99
#ifndef km_mul_2_add_2
#define km_mul_2_add_2(zH, zL, a, b, c, d)if(1){ \
	unid_t _t_; \
	_t_ = (unid_t)(a) * (b) + (d) + (c); \
	(zL) = km_fetch_lo(_t_); \
	(zH) = km_fetch_hi(_t_); \
}
#endif
#endif

/**
 * @see km_qr_2
 **/
#ifdef SUPPORT_DOUBLE_PRECISION_C99
#ifndef km_qr_2
#define km_qr_2(q, r, aH, aL, b)if(1){ \
	unid_t _t_; \
	_t_ = km_lo_to_hi(aH) + (aL); \
	(q) = _t_ / (b); \
	(r) = _t_ - ((q) * (b)); \
}
#endif
#endif



/**
 * @brief Swaps two words.
 * @param a - Pointer.
 * @param b - Pointer.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_swap
#define km_swap(a, b)if(1){ \
	uni_t _t; \
	_t = (a); \
	(a) = (b); \
	(b) = (_t); \
}
#endif

/**
 * @brief Swaps the stored address of two pointers.
 * The pointers can be any type.
 * @param a - Pointer.
 * @param b - Pointer.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_swap_ptr
#define km_swap_ptr(a, b)if(1){ \
	void *_t; \
	_t = (a); \
	(a) = (b); \
	(b) = (_t); \
}
#endif

/**
 * @brief Count number of a given bit starting fron the LSB.
 * Restriction: _an[0] != 0.
 * @param c - To be documented.
 * @param a - To be documented.
 * @param b - To be documented.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_count_lo
#define km_count_lo(c, a, b){ \
	for((c) = 0; (((a) >> (c)) & 0x1) == (b); (c)++); \
}
#endif

/**
 * @brief Count number of a given bit starting from the MSB.
 * Restriction: a != 0.
 * @param c - To be documented.
 * @param a - To be documented.
 * @param b - To be documented.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_count_hi
#define km_count_hi(c, a, b)if(1){ \
	uni_t __t; \
	CHECK((a) != 0); \
	__t = 1 << (UNIT_LEN - 1); \
	for((c) = 0; ((a) & __t) == b; (c)++){ \
		__t >>= 1; \
	} \
}
#endif

/**
 * @brief Performs normalization of a digit to left.
 * Calculates the shift amount and performs left shift on the single precision
 * @f$ digit @f$.
 * Both @f$ digit @f$ and @f$ shift @f$ are updated.
 * The variable @f$ digit @f$ should be larger than @f$ 0 @f$.
 * The running time varies due to loop.
 * This macro should be updated to fix the running time.
 * Binary search will be a good candidate for the basis of the new version.
 * @param digit - Digit to be normalized. @f$ 0 < digit < 2^{\beta} @f$.
 * @param shift - Digit for shift amount.
 * @exception If @f$ digit=0 @f$ then validation fault occurs.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_normalize_left
#define km_normalize_left(digit, shift){ \
	CHECK(digit != 0); \
	(shift) = UNIT_LEN - 1; \
	while(((digit) >> (shift)) != 1){ \
		(shift)--; \
	} \
	(shift) = UNIT_LEN - 1 - (shift); \
	(digit) <<= (shift); \
}
#endif

/**
 * @brief Performs normalization of a digit to right.
 * @param digit - Digit to be normalized. @f$ 0 < digit < 2^{\beta} @f$.
 * @param shift - Digit for shift amount.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_normalize_right
#define km_normalize_right(digit, shift){ \
	CHECK(digit != 0); \
	(shift) = 0; \
	while(((digit) & 0x1) == 0){ \
		(shift)++; \
	} \
	(digit) >>= (shift); \
}
#endif

/**
 * @brief Exclusive-or two digits.
 * @param a - Digit. @f$ 0 \leq a < 2^{\beta} @f$.
 * @param b - Digit. @f$ 0 \leq b < 2^{\beta} @f$.
 * @return digit @f$ 0 \leq (a \; EXOR \; b) < 2^{\beta} @f$.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_exor
#define km_exor(a, b) ((a) ^ (b))
#endif

/**
 * @brief Single precision mod operation.
 * @param a - Input digit. @f$ 0 \leq a < 2^{\beta} @f$.
 * @param b - Input digit. @f$ 0 < b < 2^{\beta} @f$.
 * @return @f$ a \, (mod \; b) @f$ such that @f$ 0 \leq z < (2^{\beta}-1) @f$.
 * @exception If @f$ b = 0 @f$ then divide by zero hardware exception occurs.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_mod
#define km_mod(a, b) ((a) - (((a) / (b)) * (b)))
#endif

/**
 * @brief Finds size difference in terms of bits.
 * Restriction @f$ b \leq a @f$. This macro may be altered in the future.
 * @param z - Output digit.
 * @param a - Input digit.
 * @param b - Input digit.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_log_sub
#define km_log_sub(z, a, b)if(1){ \
	uni_t _t; \
	for(_t = 0; ((a) >> _t) >= (b); _t++); \
	(z) = _t - 1; \
}
#endif

/**
 * @brief Add two digits preserving the possible carry bit.
 * This macro can be altered in the future.
 * Adds @f$ a @f$ and @f$ b @f$ and stores the result in @f$ z @f$.
 * If an overflow occurs, @f$ cr @f$ is set to @f$ 1 @f$ else to @f$ 0 @f$.
 * If @f$ _t = z + a \equiv @f$ is the case @f$ cr @f$ is remained unchanged.
 * If @f$ cr @f$ and @f$ z @f$ are the same variable then @f$ cr @f$ is
 * also set to @f$ z @f$. Carry can be 1 at most since
 * @f$ (2^{\beta}-1) + (2^{\beta}-1)\equiv 1\,(mod\; 2^{\beta}) @f$.
 * @param cr - Output digit to store overflow.
 * @param z - Output digit. @f$ 0 \leq z < 2^{\beta} @f$.
 * @param a - Input digit. @f$ 0 \leq a < 2^{\beta} @f$.
 * @param b - Input digit. @f$ 0 \leq b < 2^{\beta} @f$.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_add
#define km_add(cr, z, a, b){ \
	(z) = (a) + (b); \
	(cr) = ((z) < (a)); \
}
#endif

/**
 * @brief Subtract two digits (one from other) preserving the possible borrow bit.
 * This macro can be altered in the future.
 * Result is stored into @f$ z @f$. Possible borrow bit is preserved in
 * @f$ cr @f$.
 * @param cr - Output digit for deficient bit. _cr = 0 or _cr = 1.
 * @param z - Output digit.
 * @param a - Input digit. @f$ 0 \leq a < 2^{\beta} @f$.
 * @param b - Input digit. @f$ 0 \leq b < 2^{\beta} @f$.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_sub
#define km_sub(cr, z, a, b){ \
	(cr) = ((a) < (b)); \
	(z) = (a) - (b); \
}
#endif

/**
 * @brief Adds a, b and c.
 * This macro can be altered in the future.
 * Result is stored into z.If an overflow occures at the end of addition,
 * cr is set to 1, else to 0. ({cr, z} = a + b + c)
 * @param cr - Output digit for excess bit. _cr = 0 or _cr = 1.
 * @param z - Output digit. @f$ 0 \leq z < 2^{\beta} @f$.
 * @param a - Input digit. @f$ 0 \leq a < 2^{\beta} @f$.
 * @param b - Input digit. @f$ 0 \leq b < 2^{\beta} @f$.
 * @param c - Input digit. @f$ 0 \leq c \leq 1 @f$.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_add_c
#define km_add_c(cr, z, a, b, c)if(1){ \
	uni_t _t; \
	_t = (a) + (b) + (c); \
	if(_t < (a)){ \
		(cr) = 1; \
	} \
	else if(_t > (a)){ \
		(cr) = 0; \
	} \
	(z) = _t; \
}
#endif

/**
 * @brief Subtacts b and c from a.
 * This macro can be altered in the future.
 * Result is stored into z.If a is not big enough , cr is set to 1,
 * else to 0. ({cr, z} = a - b - c)
 * @param cr - Output digit for deficient bit. cr = 0 or cr = 1.
 * @param z - Output digit. @f$ 0 \leq z < 2^{\beta} @f$.
 * @param a - Input digit. @f$ 0 \leq a < 2^{\beta} @f$.
 * @param b - Input digit. @f$ 0 \leq b < 2^{\beta} @f$.
 * @param c - Input digit. @f$ 0 \leq c \leq 1 @f$.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_sub_c
#define km_sub_c(cr, z, a, b, c)if(1){ \
	uni_t _t; \
	_t = (a) - (b) - (c); \
	if(_t < (a)){ \
		(cr) = 0; \
	} \
	else if(_t > (a)){ \
		(cr) = 1; \
	} \
	(z) = _t; \
}
#endif

/**
 * @brief Adds a two digit variable and a single digit variable.
 * Possible carry is lost.
 * @f$ [zH \cdot 2^{\beta} + zL] = [aH \cdot 2^{\beta} + aL] + b \; (mod \; {2}^{2 \beta})@f$.
 * @param zH - Output digit for higher half.
 * @param zL - Output digit for lower half.
 * @param aH - Input digit for higher half. @f$ 0 \leq b < 2^{\beta} @f$.
 * @param aL - Input digit for higher half. @f$ 0 \leq b < 2^{\beta} @f$.
 * @param b - Input digit. @f$ 0 \leq b < 2^{\beta} @f$.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_add_2
#define km_add_2(zH, zL, aH, aL, b)if(1){ \
	uni_t _tH, _tL; \
	km_add(_tH, _tL, aL, b); \
	(zH) = aH + _tH; \
	(zL) = _tL; \
}
#endif

/**
 * @brief Low level subtraction.
 * @param zH - To be documented.
 * @param zL - To be documented.
 * @param aH - To be documented.
 * @param aL - To be documented.
 * @param b - To be documented.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_sub_2
#define km_sub_2(zH, zL, aH, aL, b)if(1){ \
	uni_t _tH, _tL; \
	km_sub(_tH, _tL, aL, b); \
	(zH) = aH - _tH; \
	(zL) = _tL; \
}
#endif

/**
 * @brief Masks the lower half bits from the undelying hardware type.
 * @param a - Input digit. @f$ 0 \leq a < 2^{\beta} @f$.
 * @return  @f$ a \; (mod \; {2}^{\beta / 2})@f$.
 *
 * @author Huseyin Hisil.
 * @date Mar 2006.
 **/
#ifndef km_fetch_lo
#define km_fetch_lo(a) ((a) & (((uni_t)1 << UNIT_LEN_HALF) - 1))
#endif

/**
 * @brief Masks the upper half bits from the undelying hardware type.
 * @param a - Input digit. @f$ 0 \leq a < 2^{\beta} @f$.
 * @return  @f$ \displaystyle{ \left\lfloor {{a \over {2^{\beta /2} }}} \right\rfloor } @f$.
 *
 * @author Huseyin Hisil.
 * @date Mar 2006.
 **/
#ifndef km_fetch_hi
#define km_fetch_hi(a) ((uni_t)(a) >> UNIT_LEN_HALF)
#endif

/**
 * @brief Carries the lower part to the higher part.
 * Lower part always become zero.
 * @param a - Input digit. @f$ 0 \leq a < 2^{\beta} @f$.
 * @return  @f$ \displaystyle{ \left\{ {a - \left\lfloor {{a \over {2^{\beta /2} }}} \right\rfloor 2^{\beta /2} } \right\}2^{\beta /2} } @f$.
 *
 * @author Huseyin Hisil.
 * @date Mar 2006.
 **/
#ifndef km_lo_to_hi
#define km_lo_to_hi(a) ((uni_t)(a) << UNIT_LEN_HALF)
#endif

/**
 * @brief Multiply two digits
 * This macro is implemented in a way that, no carry bit control is
 * necessary.

@verbatim

                                       ----------------------------------
                                       |      aH       ||      aL       |
                                       ----------------------------------
                                       ----------------------------------
                                       |      bH       ||      bL       |
  *                                    ----------------------------------
 ___________________________________________________________________________

                                       ----------------------------------
                                       |             aL * bL            |
                                       ----------------------------------
                      ----------------------------------
                      |             aH * bL            |  <-- HIGH(aL * bL)
                      ----------------------------------
                      ----------------------------------
                      |             aL * bH            |  <-- LOW(aH * bL)
                      ----------------------------------
     ----------------------------------
     |             aH * bH            |  <-- HIGH(aL * bH) + HIGH(aH * bL)
  +  ----------------------------------
 ___________________________________________________________________________

     ---------------------------------------------------------------------
     |                zH               ||               zL               |
     ---------------------------------------------------------------------

 @endverbatim

 * @param zH - Output digit for higher half.
 * @param zL - Output digit for lower half.
 * @param a - Input digit. @f$ 0 \leq b < 2^{\beta} @f$.
 * @param b - Input digit. @f$ 0 \leq b < 2^{\beta} @f$.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_mul_2
#define km_mul_2(zH, zL, a, b)if(1){ \
	uni_t _tLL, _tLH, _tHL, _aL, _bL, _aH, _bH; \
	_aL = km_fetch_lo(a); \
	_bL = km_fetch_lo(b); \
	_aH = km_fetch_hi(a); \
	_bH = km_fetch_hi(b); \
	_tLL = _aL * _bL; \
	_tHL = _aH * _bL; \
	_tLH = _aL * _bH + km_fetch_hi(_tLL) + km_fetch_lo(_tHL); \
	(zL) = km_lo_to_hi(km_fetch_lo(_tLH)) + km_fetch_lo(_tLL); \
	(zH) = _aH * _bH + km_fetch_hi(_tHL) + km_fetch_hi(_tLH); \
}
#endif

/**
 * @brief Multiply two digits and and one more variable
 * to the result.
 * This macro is implemented in a way that, no carry bit control is
 * necessary.
 * @verbatim
 *
 *                                       ----------------------------------
 *                                       |      aH       ||      aL       |
 *                                       ----------------------------------
 *                                       ----------------------------------
 *                                       |      bH       ||      bL       |
 *  *                                    ----------------------------------
 * ___________________________________________________________________________
 *
 *                                       ----------------------------------
 *                                       |             aL * bL            |  <-- cL
 *                                       ----------------------------------
 *                      ----------------------------------
 *                      |             aH * bL            |  <-- cH + HIGH(aL * bL)
 *                      ----------------------------------
 *                      ----------------------------------
 *                      |             aL * bH            |  <-- LOW(aH * bL)
 *                      ----------------------------------
 *     ----------------------------------
 *     |             aH * bH            |  <-- HIGH(aL * bH) + HIGH(aH * bL)
 *  +  ----------------------------------
 * ___________________________________________________________________________
 *
 *     ---------------------------------------------------------------------
 *     |                zH               ||               zL               |
 *     ---------------------------------------------------------------------
 *
 * @endverbatim
 *
 * @param zH - Output digit for higher half.
 * @param zL - Output digit for lower half.
 * @param a - Input digit. @f$ 0 \leq b < 2^{\beta} @f$.
 * @param b - Input digit. @f$ 0 \leq b < 2^{\beta} @f$.
 * @param c - Input digit. @f$ 0 \leq b < 2^{\beta} @f$
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_mul_2_add_c
#define km_mul_2_add_c(zH, zL, a, b, c){ \
	uni_t _tLL, _tLH, _tHL, _aL, _bL, _aH, _bH; \
	_aL = km_fetch_lo(a); \
	_bL = km_fetch_lo(b); \
	_aH = km_fetch_hi(a); \
	_bH = km_fetch_hi(b); \
	_tLL = _aL * _bL + km_fetch_lo(c); \
	_tHL = _aH * _bL + km_fetch_hi(c); \
	_tLH = _aL * _bH + km_fetch_hi(_tLL) + km_fetch_lo(_tHL); \
	(zL) = km_lo_to_hi(km_fetch_lo(_tLH)) + km_fetch_lo(_tLL); \
	(zH) = _aH * _bH + km_fetch_hi(_tHL) + km_fetch_hi(_tLH); \
}
#endif

/**
 * @brief Multiply two digits and and two more variables
 * to the result.
 * This macro is implemented in a way that, no carry bit control is
 * necessary.
 *
 * @verbatim
 *
 *                                       ----------------------------------
 *                                       |      aH       ||      aL       |
 *                                       ----------------------------------
 *                                       ----------------------------------
 *                                       |      bH       ||      bL       |
 *  *                                    ----------------------------------
 * ___________________________________________________________________________
 *
 *                                       ----------------------------------
 *                                       |             aL * bL            |  <-- cL + dL
 *                                       ----------------------------------
 *                      ----------------------------------
 *                      |             aH * bL            |  <-- cH + HIGH(aL * bL)
 *                      ----------------------------------
 *                      ----------------------------------
 *                      |             aL * bH            |  <-- dH + LOW(aH * bL)
 *                      ----------------------------------
 *     ----------------------------------
 *     |             aH * bH            |  <-- HIGH(aL * bH) + HIGH(aH * bL)
 *  +  ----------------------------------
 * ___________________________________________________________________________
 *
 *     ---------------------------------------------------------------------
 *     |                zH               ||               zL               |
 *     ---------------------------------------------------------------------
 *
 * @endverbatim
 *
 * @param zH - Output digit for higher half.
 * @param zL - Output digit for lower half.
 * @param a - Input digit. @f$ 0 \leq b < 2^{\beta} @f$.
 * @param b - Input digit. @f$ 0 \leq b < 2^{\beta} @f$.
 * @param c - Input digit. @f$ 0 \leq b < 2^{\beta} @f$
 * @param d - Input digit. @f$ 0 \leq b < 2^{\beta} @f$.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_mul_2_add_2
#define km_mul_2_add_2(zH, zL, a, b, c, d){ \
	uni_t _tLL, _tLH, _tHL, _aL, _bL, _aH, _bH; \
	_aL = km_fetch_lo(a); \
	_bL = km_fetch_lo(b); \
	_aH = km_fetch_hi(a); \
	_bH = km_fetch_hi(b); \
	_tLL = _aL * _bL + km_fetch_lo(c) + km_fetch_lo(d); \
	_tHL = _aH * _bL + km_fetch_hi(c) + km_fetch_hi(d); \
	_tLH = _aL * _bH + km_fetch_hi(_tLL) + km_fetch_lo(_tHL); \
	(zL) = km_lo_to_hi(km_fetch_lo(_tLH)) + km_fetch_lo(_tLL); \
	(zH) = _aH * _bH + km_fetch_hi(_tHL) + km_fetch_hi(_tLH); \
}
#endif

/**
 * @brief Double precision quotient and remainder.
 * Restrictions aH < b, b must be normalized.
 * @param q - To be documented.
 * @param r - To be documented.
 * @param aH - To be documented.
 * @param aL - To be documented.
 * @param b - To be documented.
 *
 * @author Huseyin Hisil.
 **/
#ifndef km_qr_2
#define km_qr_2(q, r, aH, aL, b)if(1){ \
	uni_t _qH, _qL, _rH, _rL, _bH, _bL, _t; \
	CHECK((b) != 0); \
	/*CHECK((b) > (aH));*/ \
	_bL = km_fetch_lo(b); \
	_bH = km_fetch_hi(b); \
	_qH = (aH) / _bH; \
	_rH = (aH) - (_qH * _bH); \
	_rH = km_lo_to_hi(_rH) + km_fetch_hi(aL); \
	_t = _qH * _bL; \
	if(_rH < _t){ \
		_rH += (b); \
		_qH--; \
		if(_rH >= (b)){ \
			if(_rH < _t){ \
				_rH += (b); \
				_qH--; \
			} \
		} \
	} \
	_rH -= _t; \
	_qL = _rH / _bH; \
	_rL = _rH - (_qL * _bH); \
	_rL = km_lo_to_hi(_rL) + km_fetch_lo(aL); \
	_t = _qL * _bL; \
	if(_rL < _t){ \
		_rL += (b); \
		_qL--; \
		if(_rL >= (b)){ \
			if(_rL < _t){ \
				_rL += (b); \
				_qL--; \
			} \
		} \
	} \
	(q) = km_lo_to_hi(_qH) + _qL; \
	(r) = _rL - _t; \
}
#endif


/**
 * @brief Initialize CRYMPIX.
 * @param maxlen - To be documented.
 *
 * @author Mutlu Beyazit.
 * @author Ali Mersin.
 * @author Huseyin Hisil.
 * @date Mar 20 2004. Modified in Dec 31, 2005.
 **/
void crympix_init(uni_t maxlen);

/**
 * @brief Finalize CRYMPIX.
 * @author Mutlu Beyazit.
 * @author Ali Mersin.
 * @author Huseyin Hisil.
 * @date Mar 20 2004. Modified in Dec 31, 2005.
 **/
void crympix_kill();

/**
 * @brief Abnormal exit for CRYMPIX.
 * @param s - To be documented.
 * @param code - To be documented.
 *
 * @author Huseyin Hisil.
 * @date Mar 20 2004.
 **/
void kn_exit(sic s, uni_t code);

/**
 * @brief Warning for DEBUG_X modes.
 * @param s - To be documented.
 * @param code - To be documented.
 *
 * @author Huseyin Hisil.
 * @date Mar 22 2007.
 **/
void kn_warn(sic_t *s, uni_t code);

/**
 * @brief Checks whether the demanded meoery is lower than predefined limits.
 * @param len - To be documented.
 *
 * @author Huseyin Hisil.
 * @date Mar 20 2004.
 **/
void kn_memcheck(uni_t len);

/**
 * @brief Allocates memory for workspace numbers.
 * For inner functions only.
 *
 * @author Mutlu Beyazit.
 * @author Ali Mersin.
 * @author Huseyin Hisil.
 * @date Dec 31, 2005.
 **/
void *kn_init_fast();

/**
 * @brief Release the allocated memory.
 * For inner functions only.
 * @param node - To be documented.
 *
 * @author Mutlu Beyazit.
 * @author Ali Mersin.
 * @author Huseyin Hisil.
 * @date Dec 31, 2005.
 **/
void kn_free_fast(void *node);

/**
 * @brief Release the allocated memory to the Operating System.
 * For inner functions only.
 * @param node - To be documented.
 *
 * @author Ali Mersin.
 * @date Mar 02, 2006.
 **/
void kn_kill_fast(void *node);

/**
 * @brief Flush the list that stores the previously allocated memory.
 * For inner functions only.
 *
 * @author Ali Mersin.
 * @date Mar 02, 2006.
 **/
void kn_flush_fast();

/**
 * @brief Allocates memory for workspace numbers.
 * If list that stores the avaliable memory slots is free
 * memory is allocated from system, else an avaliable slot
 * from the list is allocated.
 *
 * @author Mutlu Beyazit.
 * @author Ali Mersin.
 * @author Huseyin Hisil.
 * @date Dec 31, 2005.
 **/
void *kn_init();

void *kn_alloc(uni_t size);

/**
 * @brief Release the allocated memory.
 * Memory slot to be freed is directly transferred to CRYMPIX
 * in order to use for new memory allocation; stored
 * in the list.
 * @param node - To be documented.
 *
 * @author Mutlu Beyazit.
 * @author Ali Mersin.
 * @author Huseyin Hisil.
 * @date Dec 31, 2005.
 **/
void kn_free(void *node);

 /**
 * @brief Release the allocated memory to system.
 * User level memory kill.
 * @param node - To be documented.
 *
 * @author Ali Mersin.
 * @date Mar 02, 2006.
 **/
void kn_kill(void *node);

void kn_release(void *node);

/**
 * @brief Flush the list that stores the previously allocated memory.
 * User level list flush.
 *
 * @author Ali Mersin.
 * @date Mar 02, 2006.
 **/
void kn_flush();

/**
 * @brief Scans digits of a number from a string while performing base conversion.
 * Reads digits of a multiprecision number in a given base from a string into an
 * array. The number is represented in hardware base and and conversions are
 * performed as defined in the ascii_scan_map. Meanwhile controls for invalid
 * characters and buffer overflow are done.
 * @return The length of an array.
 * @param an - Destination array.
 * @param s - Source string.
 * @param base - Radix Base of data.
 * @exception Invalid character.
 * @exception Buffer overflow.
 *
 * @author Huseyin Hisil.
 * @date Jan 01, 2005. Modified Jan 11, 2006.
 **/
uni_t kn_io_sscan(uni an, sic s, uni_t base);

/**
 * @brief Scans digits of a number from a file while performing base conversion.
 * Reads digits of a multiprecision number in a given base from a file into an
 * array. The number is represented in hardware base and and conversions are
 * performed as defined in the ascii_scan_map. Meanwhile controls for invalid
 * characters and buffer overflow are made.
 * @param an - Array pointer.
 * @param fp - File poiner for reading data from file. File must be opened before.
 * @param base - Radix Base of data.
 * @return The length of an array.
 * @exception Invalid character.
 * @exception Buffer overflow.
 *
 * @author Evren Akalp.
 * @date Jan 01, 2005. Modified Mar 11, 2006.
 **/
uni_t kn_io_fscan(uni an, FILE *fp, uni_t base);

/**
 * @brief Prints digits of a number to an array while performing base conversion.
 * Prints the content of an array in hardware base to an array in
 * base base. Conversions are performed as defined in ascii_print_map.
 * @param sn - Destination array.
 * @param an - Source array.
 * @param al - Length of source array.
 * @param base - Radix Base of data.
 *
 * @author Ali Mersin.
 * @author Mutlu Beyazit.
 * @author Huseyin Hisil.
 * @date Jan 01, 2005. Modified Jan 11, 2006.
 **/
void kn_io_sprint(sic sn, uni an, uni_t al, uni_t base);

/**
 * @brief Prints digits of a number to a file while performing base conversion.
 * Prints the content of an array in hardware base to a file in
 * base base. Conversions are performed as defined in ascii_print_map.
 * @param fp - File poiner for writing data to file. File must be opened before.
 * @param prefix - Prefix string.
 * @param an - Source array.
 * @param al - Length of source array.
 * @param suffix - Suffix string.
 * @param base Radix Base of data.
 *
 * @author Ali Mersin.
 * @author Mutlu Beyazit.
 * @author Huseyin Hisil.
 * @date Mar 13, 2006.
 **/
void kn_io_fprint(FILE *fp, sic prefix, uni an, uni_t al, sic suffix, uni_t base);

/**
 * @brief Set seed for random number generator.
 * @param s - Seed.
 *
 * @author Mutlu Beyazit.
 **/
void kn_srand(uni_t s);

/**
 * @brief Generate a random number.
 * @return Random word.
 *
 * @author Mutlu Beyazit.
 **/
uni_t kn_rand();
