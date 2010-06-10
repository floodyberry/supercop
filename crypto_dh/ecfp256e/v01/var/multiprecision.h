/**
 * @file multiprecision.h
 * @brief Multiprecision arithmetic for integers and binary polynomials.
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
 * @author Huseyin Hisil
 * @date Build May 2004, Last Updated Mar 2005.
 **/
/**
 * @brief Type definition for an array.
 * This struct is used for low level integer and polynomial arithmetic.
 *
 * @author Huseyin Hisil.
 * @date Build Mar 21, 2004.
 **/
typedef struct {
	uni_t l; /* Number of digits */
	uni n; /* Starting address of digits */
} MA_t[1], *MA;

/**
 * @brief Counts number of low words.
 * @param c - count index.
 * @param an - Pointer to multiprecision vector.
 * @param al - Length of an.
 * @param b - Number to be compared.
 *
 * @author Huseyin Hisil.
 * @author Ali Mersin.
 **/
#ifndef mam_count_lo
#define mam_count_lo(c, an, al, b){ \
	for((c) = 0; ((c) < (al)) && ((an)[(c)] == (b)); (c)++); \
}
#endif

/**
 * @brief Eliminates leading zero words.
 * Decreases al until leading zero words are eliminated.
 * @param an - Pointer to multiprecision vector.
 * @param al - Length of an to be trimmed.
 *
 * @author Huseyin Hisil.
 **/
#ifndef mam_trim
#define mam_trim(an, al){ \
	while(((an)[(al) - 1] == 0) && ((al) > 1)){ \
		(al)--; \
	} \
}
#endif

/**
 * @brief Finds i'th bit in a multiprecision vector.
 * Sets ib to the value of i'th of an vector.
 * @param ib - Buffer space for the result.
 * @param an - Pointer to multiprecision vector.
 * @param i - i.
 *
 * @author Huseyin Hisil.
 **/
#ifndef mam_ith_bit
#define mam_ith_bit(ib, an, i)if(1){ \
	uni_t _nw, _nb; \
	_nw = (i) / UNIT_LEN; \
	_nb = (i) - (_nw * UNIT_LEN); \
	if(_nb == 0){ \
		(ib) = (an)[_nw - 1] >> (UNIT_LEN - 1); \
	} \
	else{ \
		(ib) = (((an)[_nw] >> (_nb - 1)) & 0x1); \
	} \
}
#endif

/**
 * @brief Finds total bit count of a multiprecision vector.
 * Sets bc to bit count of an vector.
 * @param bc - Buffer space for the result.
 * @param an - Pointer to multiprecision vector.
 * @param al - Length of an.
 *
 * @author Huseyin Hisil.
 **/
#ifndef mam_bit_count
#define mam_bit_count(bc, an, al)if(1){ \
	uni_t _w, _nb; \
	_w = (an)[(al) - 1]; \
	for(_nb = 0; _w != 0; _nb++){ \
		_w >>= 1; \
	} \
	(bc) = _nb + ((al) - 1) * UNIT_LEN; \
}
#endif

/**
 * @brief Clear a memory area that represent a multiprecision vector.
 * al >= 0.
 * @param an - Pointer to multiprecision vector.
 * @param al - Length of an to be cleared.
 *
 * @author Huseyin Hisil.
 **/
#ifndef mam_clr
#define mam_clr(an, al)if(1){ \
	uni_t _i; \
	for(_i = 0; _i < (al); _i++){ \
		(an)[_i] = 0; \
	} \
}
#endif

/**
 * @brief Clones a memory area to one other.
 * al >= 1. (zn, al) is allowed to overlap (an, al).
 * Nothing is done is an == zn.
 * @param zn - Pointer to destination.
 * @param an - Pointer to multiprecision vector.
 * @param al - Length of an to be cleared.
 *
 * @author Huseyin Hisil.
 **/
#ifndef mam_clo
#define mam_clo(zn, an, al)if(1){ \
	uni_t _i_; \
	if(al > 0){ \
		if((zn) < (an)){ \
			for(_i_ = 0; _i_ < (al); _i_++){ \
				(zn)[_i_] = (an)[_i_]; \
			} \
		} \
		else if((zn) > (an)){ \
			for(_i_ = (al) - 1; _i_ > 0; _i_--){ \
				(zn)[_i_] = (an)[_i_]; \
			} \
			(zn)[0] = (an)[0]; \
		} \
	} \
}
#endif

/**
 * @brief Left shifts an array of numbers.
 * al memory spaces must be allocated for zn.
 * (zn, al) is allowed to overlap if zn >= an, but (zn < an) must be avoided.
 * 0 < nb < $UNIT_LEN$.
 * Attention: al should be controlled for a possible increase.
 * cr is set to the excess word or to zero.
 * @param cr - Excess word.
 * @param zn - Pointer to destination word array.
 * @param an - Pointer to multiprecision vector.
 * @param al - Length of an to be cleared.
 * @param nb - Number of inputs bits.
 *
 * @author Huseyin Hisil.
 **/
#ifndef mam_shift_left_bit
#define mam_shift_left_bit(cr, zn, an, al, nb)if(1){ \
	uni_t _i; \
	(cr) = ((an)[(al) - 1] >> (UNIT_LEN - (nb))); \
	for(_i = (al) - 1; _i > 0; _i--){ \
		(zn)[_i] = ((an)[_i] << (nb)) | ((an)[_i - 1] >> (UNIT_LEN - (nb))); \
	} \
	(zn)[0] = ((an)[0] << (nb)); \
}
#endif

/**
 * @brief Shifts a multiprecision vector to left.
 * al memory spaces must be allocated for zn.
 * (zn, al) is allowed to overlap if zn <= an.
 * But (zn > an) must be avoided.
 * 0 <= nb < $UNIT_LEN$.
 * bug: fix for al = 1.
 * @param zn - Pointer to destination.
 * @param an - Pointer to multiprecision vector.
 * @param al - Length of an to be cleared.
 * @param nb - Number of inputs bits.
 *
 * @author Huseyin Hisil.
 **/
#ifndef mam_shift_right_bit
#define mam_shift_right_bit(zn, an, al, nb)if(1){ \
	uni_t _i; \
	for(_i = 0; _i < (al) - 1; _i++){ \
		(zn)[_i] = ((an)[_i] >> (nb)) | ((an)[_i + 1] << (UNIT_LEN - (nb))); \
	} \
	(zn)[(al) - 1] = ((an)[(al) - 1] >> (nb)); \
}
#endif


/**
 * @brief Performs base conversion of a number in a given base.
 * The number stored in source array is converted to hardware base from give
 * base and result is stored in destinatin array.
 * @param an - Destination array.
 * @param buf - Source array.
 * @param bufl - The length of source array.
 * @param base - Radix Base of data.
 * @return The length of destination array.
 *
 * @author Sevgi Uslu
 * @author Evren Akalp
 * @author Huseyin Hisil
 * @date Jan 01, 2006. Modified Jan 11, 2006.
 **/
uni_t man_convert_word(
	uni an,
	const uni buf, uni_t bufl,
	uni_t base
);

/**
 * @brief Performs base conversion of a number to a given base.
 * The number stored in source array is converted to given base from hardware base
 * and result is stored in destinatin array.
 * @param src - Destination array.
 * @param an - Source array.
 * @param al - The length of source array.
 * @param base - Radix Base of data.
 * @return The length of destination array.
 *
 * @author Ali Mersin
 * @author Mutlu Beyazit
 * @author Huseyin Hisil
 * @date  Jan 01, 2006. Modified Mar 11, 2006.
 **/
uni_t man_convert_base(
	uni src,
	uni an, uni_t al,
	uni_t base
);

COMPARE man_compare_1(const uni an, uni_t al, const uni_t b);

/**
 * @brief Compare
 *
 * @author Huseyin Hisil.
 **/
COMPARE man_compare(const uni an, uni_t al, const uni bn, uni_t bl);

/**
 * @brief Shifts a multiprecision vector to left.
 * Input restrictions:
 *  - zn[] and an[] must be valid.
 *  - '1 <= al < $MAXLEN$'.
 *  - (al + 1) memory spaces must be allocated for zn[].
 *  - {zn, al} is allowed to overlap with {an, al} if 'zn >= an' is satisfied.
 * Output: zn[]; 1 bit left shifted an[].
 * @param zn - Pointer to destination.
 * @param an - Pointer to multiprecision vector.
 * @param al - Length of an to be cleared.
 * @param n - Number of input bits.
 *
 * @author Huseyin Hisil.
 **/
void man_shift_left(uni zn, uni an, uni_t al, uni_t n);

void man_shift_left_experimental(uni zn, uni an, uni_t al, uni_t n);

/**
 * @brief Shifts a multiprecision vector to right.
 * Input restrictions:
 *  - zn[] and an[] must be valid.
 *  - '1 <= al < $MAXLEN$'.
 *  - (al + 1) memory spaces must be allocated for zn[].
 *  - {zn, al} is allowed to overlap with {an, al} if 'zn >= an' is satisfied.
 *
 * Output:
 *  - zn[]; 1 bit left shifted an[].
 *
 * @param zn - Pointer to destination.
 * @param an - Pointer to multiprecision vector.
 * @param al - Length of an.
 * @param n - Number of input bits.
 *
 * @author Huseyin Hisil.
 **/
void man_shift_right(uni zn, uni an, uni_t al, uni_t n);

/**
 * @brief Normalize right.
 * @param zn - Pointer to destination.
 * @param an - Pointer to multiprecision vector.
 * @param al - Length of an.
 *
 * @author Huseyin Hisil.
 **/
void man_normalize_right(uni zn, uni an, uni_t al);

/**
 * @brief Initialize an array of uni_t's.
 * @param a - Pointer to array.
 *
 * @author Huseyin Hisil.
 **/
void ma_init(MA a);

/**
 * @brief Release the allocated resource.
 * @param a - Pointer to array.
 *
 * @author Huseyin Hisil.
 **/
void ma_free(MA a);

/**
 * @brief Initialize an array of uni_t's.
 * @param a - Pointer to array.
 *
 * @author Huseyin Hisil.
 **/
void ma_init_fast(MA a);

/**
 * @brief Release the allocated resource.
 * @param a - Pointer to array.
 *
 * @author Huseyin Hisil.
 **/
void ma_free_fast(MA a);

/**
 * @brief Shifts a multiprecision vector to left.
 * Input restrictions:
 *  - zn[] and an[] must be valid.
 *  - '1 <= al < $MAXLEN$'.
 *  - '0 <= n < $MAXLEN$ - al - 1'.
 *  - (al + (n / UNIT_LEN) + 1) memory spaces must be allocated for zn[].
 *  - {zn, (al + nw)} is allowed to overlap if 'zn >= an' is satisfied.
 *  - 'zn < an' must be avoided if and when an overlap is to be took place.
 * Process:
 *  - z[(al + nw - 1), (al + nw - 2), ..., nw] = a[(al - 1), (al - 2), ..., 0].
 *  - z[nw - 1, ..., 0] = 0.
 * Output:
 *  - zn[]; n bit left shifted an[].
 * @param z - Pointer to destination.
 * @param a - Pointer to multiprecision vector.
 * @param n - Number of bits to be shifted.
 *
 * @author Huseyin Hisil.
 **/
void ma_shift_left(MA z, MA a, uni_t n);

/**
 * @brief Shifts a multiprecision vector to right.
 * Input restrictions:
 *  - zn[] and an[] must be valid.
 *  - '1 <= al < $MAXLEN$'.
 *  - '0 <= n < $MAXLEN$ - al - 1'.
 *  - (al + (n / UNIT_LEN) + 1) memory spaces must be allocated for zn[].
 *  - {zn, (al + nw)} is allowed to overlap if 'zn >= an' is satisfied.
 *  - 'zn < an' must be avoided if and when an overlap is to be took place.
 * Process:
 *  - z[(al + nw - 1), (al + nw - 2), ..., nw] = a[(al - 1), (al - 2), ..., 0].
 *  - z[nw - 1, ..., 0] = 0.
 * Output:
 *  - zn[]; n bit left shifted an[].
 *
 * @param z - Pointer to destination.
 * @param a - Pointer to multiprecision vector.
 * @param n - Number of bits to be shifted.
 *
 * @author Huseyin Hisil.
 **/
void ma_shift_right(MA z, MA a, uni_t n);

/**
 * @brief Normalize a multiprecision vector to right.
 *
 * @param z - Pointer to destination.
 * @param a - Pointer to multiprecision vector.
 * @return Number of shifted bits.
 *
 * @author Huseyin Hisil.
 **/
uni_t ma_normalize_right(MA z, MA a);

/**
 * @brief Simple random number generator.
 * For temporal use, to be altered in the future.
 *
 * @param z - Pointer to destination.
 * @param nb - Number of bits.
 * @param s - Seed.
 *
 * @author Mutlu Beyazit.
 **/
void ma_rand(MA z, uni_t nb, uni_t s);

/**
 * @brief Type definition for an integer.
 * A vector is encapsulated with the sign.
 *
 * @author Huseyin Hisil.
 * @date Build Mar 21, 2004.
 **/
typedef struct {
	SIGN s; /* Sign of the integer */
	MA_t v; /* Vector part of the integer */
} MI_t[1], *MI;

/**
 * @brief Invert the magnitude symbolically.
 * @param a - Sign variable to be inverted.
 *
 * @author Huseyin Hisil.
 * @date Feb 2006. Modified Mar 2006.
 **/
#ifndef mim_sign_inv
#define mim_sign_inv(a) (((a) == 0))
#endif

/**
 * @brief Multily the magnitudes.
 * POSITIVE <-- POSITIVE * POSITIVE
 * NEGATIVE <-- POSITIVE * NEGATIVE
 * NEGATIVE <-- NEGATIVE * POSITIVE
 * POSITIVE <-- NEGATIVE * NEGATIVE
 * @param a - Sign input.
 * @param b - Sign input.
 *
 * @author Huseyin Hisil.
 * @date Feb 2005. Modified Mar 2006.
 **/
#ifndef mim_sign_mul
#define mim_sign_mul(a, b) ((a) ^ (b))
#endif

/**
 * @brief Increment a multiprecision integer by an unsigned word.
 * carry word should controlled to determine the length of zn.
 * @param cr - Carry bit.
 * @param zn - Pointer to input-output array.
 * @param zl - Length of the number.
 * @param a - Single precision to be added.
 *
 * @author Huseyin Hisil.
 * @date Feb 2005. Modified Mar 2006.
 **/
#ifndef mim_inc_1
#define mim_inc_1(cr, zn, zl, a)if(1){ \
	uni_t _i; \
	_i = (zn)[0] + (a); \
	(cr) = (_i < (zn)[0]); \
	(zn)[0] = _i; \
	for(_i = 1; (_i < (zl) && (cr) != 0; _i++){ \
		(cr) = ((zn)[_i] == ~0)); \
		(zn)[_i] = 0; \
	} \
}
#endif

/**
 * @brief Increment a multiprecision integer by another an multiprecision
 * integer and an unsigned word.
 * carry word should controlled to determine the length of zn.
 * @param cr - Carry bit.
 * @param zn - Pointer to output array.
 * @param zl - Length of the output number.
 * @param an - Pointer to input array.
 * @param al - Length of the input number.
 * @param pad - Constant to be added to the result.
 *
 * @author Huseyin Hisil.
 * @date Feb 2005. Modified Mar 2006.
 **/
#ifndef mim_inc_n
#define mim_inc_n(cr, zn, zl, an, al, pad)if(1){ \
	uni_t _i; \
	(cr) = (pad); \
	if((zl) > (al)){ \
		for(_i = 0; _i < (al); _i++){ \
			km_add_c((cr), (zn)[_i], (zn)[_i], (an)[_i], (cr)); \
		} \
		for(_i = (al); _i < (zl); _i++){ \
			km_add((cr), (zn)[_i], (zn)[_i], (cr)); \
		} \
	}\
	else{ \
		for(_i = 0; _i < (zl); _i++){ \
			km_add_c((cr), (zn)[_i], (zn)[_i], (an)[_i], (cr)); \
		} \
		for(_i = (zl); _i < (al); _i++){ \
			km_add((cr), (zn)[_i], (an)[_i], (cr)); \
		} \
	} \
}
#endif

/**
 * @brief Add a multiprecision integer to an unsigned word.
 * carry word should controlled to determine the length of zn.
 * The result is stored in zn.
 * @param cr - Carry bit.
 * @param zn - Pointer to output array.
 * @param an - Pointer to input array.
 * @param al - Length of the input number.
 * @param b - Constant to be added to the result.
 *
 * @author Huseyin Hisil.
 * @date Feb 2005. Modified Mar 2006.
 **/
#ifndef mim_add_1
#define mim_add_1(cr, zn, an, al, b)if(1){ \
	uni_t _i; \
	(zn)[0] = (an)[0] + (b); \
	(cr) = ((zn)[0] < (an)[0]); \
	for(_i = 1; ((_i < (al)) && ((cr) != 0)); _i++){ \
		(zn)[_i] = (an)[_i] + 1; \
		(cr) = ((zn)[_i] < (an)[_i]); \
	} \
	mam_clo((zn) + _i, (an) + _i, (al) - _i); \
}
#endif

/**
 * @brief Add a multiprecision integer by another an multiprecision
 * integer and an unsigned word.
 * carry word should controlled to determine the length of zn.
 * Restriction z != a, z != b, (al) >= (bl)
 * @param cr - Carry bit.
 * @param zn - Pointer to output array.
 * @param an - Pointer to input array.
 * @param al - Length of the input number.
 * @param bn - Pointer to input array.
 * @param bl - Length of the input number.
 * @param pad - Constant to be added to the result.
 *
 * @author Huseyin Hisil.
 * @date Feb 2005. Modified Mar 2006.
 **/
#ifndef mim_add_n
#define mim_add_n(cr, zn, an, al, bn, bl, pad)if(1){ \
	uni_t _i; \
	(cr) = (pad); \
	for(_i = 0; _i < (bl); _i++){ \
		km_add_c((cr), (zn)[_i], (an)[_i], (bn)[_i], (cr)); \
	} \
	if((al) > (bl)){ \
		mim_add_1((cr), (zn) + (bl), (an) + (bl), (al) - (bl), (cr)); \
	} \
}
#endif

/**
 * @brief Subtract a multiprecision integer from another an unsigned word.
 * borrow word should controlled to determine the length of zn.
 * Restriction z != a, assumption zl = al.
 * @param br - Borrow bit.
 * @param zn - Pointer to output array.
 * @param an - Pointer to input array.
 * @param al - Length of the number.
 * @param b - Single precision constant to be subtracted.
 *
 * @author Huseyin Hisil.
 * @date Feb 2005. Modified Mar 2006.
 **/
#ifndef mim_sub_1
#define mim_sub_1(br, zn, an, al, b)if(1){ \
	uni_t _i; \
	(zn)[0] = (an)[0] - (b); \
	(br) = ((zn)[0] > (an)[0]); \
	for(_i = 1; (_i < (al)) && ((br) != 0); _i++){ \
		(zn)[_i] = (an)[_i] - (br); \
		(br) = ((zn)[_i] > (an)[_i]); \
	} \
	mam_clo((zn) + _i, (an) + _i, (al) - _i); \
}
#endif

/**
 * @brief Subtract a multiprecision integer from another an multiprecision
 * integer and an unsigned word.
 * borrow word should controlled to determine the length of zn.
 * Restriction z != a, z != b, al >= bl.
 * @param br - Borrow bit.
 * @param zn - Pointer to output array.
 * @param an - Pointer to input array.
 * @param al - Length of the number.
 * @param bn - Pointer to input array.
 * @param bl - Length of the number.
 * @param c - Single precision constant to be subtracted.
 *
 * @author Huseyin Hisil.
 * @date Feb 2005. Modified Mar 2006.
 **/
#ifndef mim_sub_n
#define mim_sub_n(br, zn, an, al, bn, bl, c)if(1){ \
	uni_t _i; \
	(br) = (c); \
	for(_i = 0; _i < (bl); _i++){ \
		km_sub_c((br), (zn)[_i], (an)[_i], (bn)[_i], (br)); \
	} \
	if((al) > (bl)){ \
		mim_sub_1((br), ((zn) + (bl)), ((an) + (bl)), ((al) - (bl)), (br)); \
	} \
}
#endif

/**
 * @brief Decrement a multiprecision integer by an unsigned word.
 * borrow word should controlled to determine the length of an.
 * @param br - Borrow bit.
 * @param an - Pointer to input array.
 * @param al - Length of the number.
 * @param b - Single precision constant to be subtracted.
 *
 * @author Huseyin Hisil.
 * @date Feb 2005. Modified Mar 2006.
 **/
#ifndef mim_dec_1
#define mim_dec_1(br, an, al, b)if(1){ \
	uni_t _i; \
	_i = (an)[0] - (b); \
	(br) = (_i > (an)[0]); \
	(an)[0] = _i; \
	for(_i = 1; ((_i < (al)) && ((br) != 0)); _i++){ \
		(br) = ((an)[_i] == 0); \
		(an)[_i] = -1; \
	} \
}
#endif

/**
 * @brief Decrement a multiprecision integer by another an multiprecision
 * integer and an unsigned word.
 * Borrow bit should be controlled to determine the length of zn.
 * @param br - Borrow bit.
 * @param an - Pointer to input array.
 * @param al - Length of the number.
 * @param bn - Pointer to input array.
 * @param bl - Length of the number.
 * @param pad - Single precision constant to be subtracted.
 *
 * @author Huseyin Hisil.
 * @date Feb 2005. Modified Mar 2006.
 **/
#ifndef mim_dec_n
#define mim_dec_n(br, an, al, bn, bl, pad)if(1){ \
	uni_t _i; \
	(br) = (pad); \
	for(_i = 0; _i < (bl); _i++){ \
		km_sub_c((br), (an)[_i], (an)[_i], (bn)[_i], (br)); \
	} \
	if((al) > (bl)){ \
		mim_dec_1((br), ((an) + (bl)), ((al) - (bl)), (br)); \
	} \
}
#endif

/**
 * @brief Multiply a multiprecision integer by another an unsigned word and
 * also add an unsigned word.
 * Carry word should be controlled to determine the length of zn.
 * @param cr - Carry word.
 * @param zn - Pointer to output array.
 * @param an - Pointer to input array.
 * @param al - Length of the number.
 * @param b - Single precision multiplier.
 * @param c - Single precision value to be added.
 *
 * @author Huseyin Hisil.
 * @date Feb 2005. Modified Mar 2006.
 **/
#ifndef mim_mul_1
#define mim_mul_1(cr, zn, an, al, b, c)if(1){ \
	uni_t _i, _t; \
	_t = (c); \
	_i = (al) & 0x7; \
	if(_i < 4){ \
		if(_i == 1){ \
			km_mul_2_add_c(_t, (zn)[0], (an)[0], (b), _t); \
		} \
		else if(_i == 2){ \
			km_mul_2_add_c(_t, (zn)[0], (an)[0], (b), _t); \
			km_mul_2_add_c(_t, (zn)[1], (an)[1], (b), _t); \
		} \
		else if(_i == 3){ \
			km_mul_2_add_c(_t, (zn)[0], (an)[0], (b), _t); \
			km_mul_2_add_c(_t, (zn)[1], (an)[1], (b), _t); \
			km_mul_2_add_c(_t, (zn)[2], (an)[2], (b), _t); \
		} \
	} \
	else if(_i > 4){ \
		if(_i == 5){ \
			km_mul_2_add_c(_t, (zn)[0], (an)[0], (b), _t); \
			km_mul_2_add_c(_t, (zn)[1], (an)[1], (b), _t); \
			km_mul_2_add_c(_t, (zn)[2], (an)[2], (b), _t); \
			km_mul_2_add_c(_t, (zn)[3], (an)[3], (b), _t); \
			km_mul_2_add_c(_t, (zn)[4], (an)[4], (b), _t); \
		} \
		else if(_i == 6){ \
			km_mul_2_add_c(_t, (zn)[0], (an)[0], (b), _t); \
			km_mul_2_add_c(_t, (zn)[1], (an)[1], (b), _t); \
			km_mul_2_add_c(_t, (zn)[2], (an)[2], (b), _t); \
			km_mul_2_add_c(_t, (zn)[3], (an)[3], (b), _t); \
			km_mul_2_add_c(_t, (zn)[4], (an)[4], (b), _t); \
			km_mul_2_add_c(_t, (zn)[5], (an)[5], (b), _t); \
		} \
		else{ \
			km_mul_2_add_c(_t, (zn)[0], (an)[0], (b), _t); \
			km_mul_2_add_c(_t, (zn)[1], (an)[1], (b), _t); \
			km_mul_2_add_c(_t, (zn)[2], (an)[2], (b), _t); \
			km_mul_2_add_c(_t, (zn)[3], (an)[3], (b), _t); \
			km_mul_2_add_c(_t, (zn)[4], (an)[4], (b), _t); \
			km_mul_2_add_c(_t, (zn)[5], (an)[5], (b), _t); \
			km_mul_2_add_c(_t, (zn)[6], (an)[6], (b), _t); \
		} \
	} \
	else{ \
		km_mul_2_add_c(_t, (zn)[0], (an)[0], (b), _t); \
		km_mul_2_add_c(_t, (zn)[1], (an)[1], (b), _t); \
		km_mul_2_add_c(_t, (zn)[2], (an)[2], (b), _t); \
		km_mul_2_add_c(_t, (zn)[3], (an)[3], (b), _t); \
	} \
	for(; _i < (al); _i++){ \
		km_mul_2_add_c(_t, (zn)[_i], (an)[_i], (b), _t); \
		_i++; \
		km_mul_2_add_c(_t, (zn)[_i], (an)[_i], (b), _t); \
		_i++; \
		km_mul_2_add_c(_t, (zn)[_i], (an)[_i], (b), _t); \
		_i++; \
		km_mul_2_add_c(_t, (zn)[_i], (an)[_i], (b), _t); \
		_i++; \
		km_mul_2_add_c(_t, (zn)[_i], (an)[_i], (b), _t); \
		_i++; \
		km_mul_2_add_c(_t, (zn)[_i], (an)[_i], (b), _t); \
		_i++; \
		km_mul_2_add_c(_t, (zn)[_i], (an)[_i], (b), _t); \
		_i++; \
		km_mul_2_add_c(_t, (zn)[_i], (an)[_i], (b), _t); \
	} \
	(cr) = _t; \
}
#endif

/**
 * @brief Divide a multiprecision integer by another an unsigned word.
 * both _rn and _a must be normalized.
 * rl >= 2.
 * (rn[rl - 1] >> (UNIT_LEN - 1)) must be zero.
 * @param qn - Pointer to output quotient.
 * @param rn - Pointer to input-dividend and output-remainder quotient.
 * @param rl - Length of dividend.
 * @param a - Single precision divisor.
 *
 * @author Mutlu Beyazit, Huseyin Hisil.
 * @date Feb 2006. Modified Mar 2006.
 **/
#ifndef mim_q_and_r_1
#define mim_q_and_r_1(qn, rn, rl, a)if(1){ \
	uni _rhn; \
	uni_t _i; \
	_rhn = (rn) + 1; \
	for(_i = (rl) - 2; _i > 0; _i--){ \
		km_qr_2((qn)[_i], (rn)[_i], _rhn[_i], (rn)[_i], (a)); \
		_rhn[_i] = 0; \
	} \
	km_qr_2((qn)[0], (rn)[0], _rhn[0], (rn)[0], (a)); \
	(rn)[1] = 0; \
}
#endif

/**
 * @brief Increment a multiprecision integer by multiplying it with an
 * unsigned word and a multiprecision integer.
 * Carry word should controlled to determine the length of zn.
 * This macro dominates the general performance of the code.
 * Therefore, the code is developed in a way that pipeline-processors
 * will have less branches.
 * @param cr - Carry word.
 * @param zn - Pointer to input-output.
 * @param an - Pointer to input multiplicand.
 * @param al - Length of multiplicand.
 * @param b - Single precision multiplier.
 * @param c - Single precision to be added.
 *
 * @author Huseyin Hisil.
 * @date Feb 2005. Modified Apr 2007.
 **/
#ifndef mim_inc_n_mul_1
#define mim_inc_n_mul_1(cr, zn, an, al, b, c)if(1){ \
	uni_t _i, _t; \
	_t = (c); \
	_i = (al) & 0x7; \
	if(_i < 4){ \
		if(_i == 1){ \
			km_mul_2_add_2(_t, (zn)[0], (an)[0], (b), _t, (zn)[0]); \
		} \
		else if(_i == 2){ \
			km_mul_2_add_2(_t, (zn)[0], (an)[0], (b), _t, (zn)[0]); \
			km_mul_2_add_2(_t, (zn)[1], (an)[1], (b), _t, (zn)[1]); \
		} \
		else if(_i == 3){ \
			km_mul_2_add_2(_t, (zn)[0], (an)[0], (b), _t, (zn)[0]); \
			km_mul_2_add_2(_t, (zn)[1], (an)[1], (b), _t, (zn)[1]); \
			km_mul_2_add_2(_t, (zn)[2], (an)[2], (b), _t, (zn)[2]); \
		} \
	} \
	else if(_i > 4){ \
		if(_i == 5){ \
			km_mul_2_add_2(_t, (zn)[0], (an)[0], (b), _t, (zn)[0]); \
			km_mul_2_add_2(_t, (zn)[1], (an)[1], (b), _t, (zn)[1]); \
			km_mul_2_add_2(_t, (zn)[2], (an)[2], (b), _t, (zn)[2]); \
			km_mul_2_add_2(_t, (zn)[3], (an)[3], (b), _t, (zn)[3]); \
			km_mul_2_add_2(_t, (zn)[4], (an)[4], (b), _t, (zn)[4]); \
		} \
		else if(_i == 6){ \
			km_mul_2_add_2(_t, (zn)[0], (an)[0], (b), _t, (zn)[0]); \
			km_mul_2_add_2(_t, (zn)[1], (an)[1], (b), _t, (zn)[1]); \
			km_mul_2_add_2(_t, (zn)[2], (an)[2], (b), _t, (zn)[2]); \
			km_mul_2_add_2(_t, (zn)[3], (an)[3], (b), _t, (zn)[3]); \
			km_mul_2_add_2(_t, (zn)[4], (an)[4], (b), _t, (zn)[4]); \
			km_mul_2_add_2(_t, (zn)[5], (an)[5], (b), _t, (zn)[5]); \
		} \
		else{ \
			km_mul_2_add_2(_t, (zn)[0], (an)[0], (b), _t, (zn)[0]); \
			km_mul_2_add_2(_t, (zn)[1], (an)[1], (b), _t, (zn)[1]); \
			km_mul_2_add_2(_t, (zn)[2], (an)[2], (b), _t, (zn)[2]); \
			km_mul_2_add_2(_t, (zn)[3], (an)[3], (b), _t, (zn)[3]); \
			km_mul_2_add_2(_t, (zn)[4], (an)[4], (b), _t, (zn)[4]); \
			km_mul_2_add_2(_t, (zn)[5], (an)[5], (b), _t, (zn)[5]); \
			km_mul_2_add_2(_t, (zn)[6], (an)[6], (b), _t, (zn)[6]); \
		} \
	} \
	else{ \
		km_mul_2_add_2(_t, (zn)[0], (an)[0], (b), _t, (zn)[0]); \
		km_mul_2_add_2(_t, (zn)[1], (an)[1], (b), _t, (zn)[1]); \
		km_mul_2_add_2(_t, (zn)[2], (an)[2], (b), _t, (zn)[2]); \
		km_mul_2_add_2(_t, (zn)[3], (an)[3], (b), _t, (zn)[3]); \
	} \
	for(; _i < (al); _i++){ \
		km_mul_2_add_2(_t, (zn)[_i], (an)[_i], (b), _t, (zn)[_i]); \
		_i++; \
		km_mul_2_add_2(_t, (zn)[_i], (an)[_i], (b), _t, (zn)[_i]); \
		_i++; \
		km_mul_2_add_2(_t, (zn)[_i], (an)[_i], (b), _t, (zn)[_i]); \
		_i++; \
		km_mul_2_add_2(_t, (zn)[_i], (an)[_i], (b), _t, (zn)[_i]); \
		_i++; \
		km_mul_2_add_2(_t, (zn)[_i], (an)[_i], (b), _t, (zn)[_i]); \
		_i++; \
		km_mul_2_add_2(_t, (zn)[_i], (an)[_i], (b), _t, (zn)[_i]); \
		_i++; \
		km_mul_2_add_2(_t, (zn)[_i], (an)[_i], (b), _t, (zn)[_i]); \
		_i++; \
		km_mul_2_add_2(_t, (zn)[_i], (an)[_i], (b), _t, (zn)[_i]); \
	} \
	(cr) = _t; \
}
#endif

/**
 * @brief Decrement a multiprecision integer by multiplying it with an
 * unsigned word and a multiprecision integer.
 * Borrow word should controlled to determine the length of zn.
 * @param br - Borrow word.
 * @param zn - Pointer to input-output.
 * @param an - Pointer to input multiplicand.
 * @param al - Length of multiplicand.
 * @param b - Single precision multiplier.
 * @param pad - Single precision to be added.
 *
 * @author Huseyin Hisil.
 * @date Feb 2005. Modified Mar 2006.
 **/
#ifndef mim_dec_n_mul_1
#define mim_dec_n_mul_1(br, zn, an, al, b, pad)if(1){ \
	uni_t _i, _tH, _tL; \
	_tH = (pad); \
	for(_i = 0; _i < (al); _i++){ \
		km_mul_2_sub_2(_tH, _tL, (zn)[_i], (an)[_i], (b), _tH); \
		(zn)[_i] = _tL; \
	} \
	(br) = _tH; \
}
#endif

/**
 * @brief Low level integer comparison sign.
 * @param an - Pointer to first integer
 * @param al - Length of an
 * @param as - Sign of first integer
 * @param bn - Pointer to second integer
 * @param bl - Length of bn
 * @param bs - Sign of second integer
 * @return LESS, GREATER or EQUAL
 *
 * @author Huseyin Hisil
 * @date Mar 2005
 **/
COMPARE min_compare(
	const uni an, uni_t al, SIGN as,
	const uni bn, uni_t bl, SIGN bs
);

/**
 * @brief Low level school multiplication.
 * al > bl has better performance.
 * @param zn - Pointer to destination
 * @param an - Pointer to first integer
 * @param al - Length of an
 * @param bn - Pointer to second integer
 * @param bl - Length of bn
 *
 * @author Huseyin Hisil
 * @date Mar 2005
 **/
void min_mul_basecase(
	uni zn,
	const uni an, uni_t al,
	const uni bn, uni_t bl
);

/**
 * @brief Low level 2-way karatsuba multiplication.
 * tn is used as temporary space.
 * al must be equls to bl for now. Fix this.
 * @param zn - Pointer to destination
 * @param an - Pointer to first integer
 * @param al - Length of an
 * @param bn - Pointer to second integer
 * @param bl - Length of bn
 * @param tn - Temp space
 *
 * @author Huseyin Hisil
 * @date Mar 2005
 **/
void min_mul_karatsuba(
	uni zn,
	const uni an, uni_t al,
	const uni bn, uni_t bl,
	uni tn
);

/**
 * @brief Low level school multiplication technique for fast squaring
 * al > bl has better performance.
 * @param zn - Pointer to destination
 * @param an - Pointer to integer about to be squared
 * @param al - Length of an
 *
 * @author Huseyin Hisil
 * @date Mar 2005
 **/
void min_sqr_basecase(
	uni zn,
	const uni an, uni_t al
);

/**
 * @brief Low level 2-way karatsuba squaring.
 * @param zn - Pointer to destination
 * @param an - Pointer to integer about to be squared
 * @param al - Length of an
 * @param tn - Temp space
 *
 * @author Huseyin Hisil
 * @date Mar 2005
 **/
void min_sqr_karatsuba(
	uni zn,
	const uni an, uni_t al,
	uni tn
);

/**
 * @brief Divides {an, al} to {bn, bl}.
 * {bn, bl} > 0.
 * Quotient is stored in qn and remainder in rn.
 * A temp space nn is used to normalize {bni bl}.
 * rl >= nl.
 * (rn[rl - 1] >> (UNIT_LEN - 1)) must be zero.
 * @param qn - Pointer to quotient
 * @param rn - Pointer to remainder
 * @param an - Pointer to integer about to be divided
 * @param al - Length of an
 * @param bn - Pointer to integer about to divide
 * @param bl - Length of bn
 * @param nn - Pointer to divisor
 *
 * @author Huseyin Hisil
 * @date Feb 2005
 **/
void min_div_qr(
	uni qn, uni rn,
	const uni an, uni_t al,
	const uni bn, uni_t bl,
	uni nn
);


/**
 * @brief Divides {an, al} to {bn, bl}. (Jebelean's exact divison)
 * Remainder must be 0.
 * @param qn - Pointer to quotient
 * @param an - Pointer to integer about to be divided
 * @param al - Length of an
 * @param bn - Pointer to integer about to divide
 * @param bl - Length of bn
 * @param nn - Pointer to divisor
 *
 * @author Huseyin Hisil
 * @date Feb 2005
 **/
void min_div_exact(
	uni qn,
	const uni an, uni_t al,
	const uni bn, uni_t bl,
	uni nn
);

/**
 * @brief Low level extended gcd with double digit Lehmer's scheme.
 * Notes: |x| >= |y|.
 * Computes x = gcd(x, y).
 * BUG a[...] == b[...] olursa if(B == 0){ DIVIDE BY ZERO }
 * @param dn - Pointer to gcd
 * @param xdn - Pointer to invariant
 * @param ydn - Pointer to invariant
 * @param xn - Pointer to first integer
 * @param xl - Length of xn
 * @param yn - Pointer to second integer
 * @param yl - Length of yn
 * @param signd - Final sign of invariant y.
 *
 * @author Huseyin Hisil
 * @date Feb 2005, Modified Jan 2006
 **/
void min_gcdx_lehmer(
	uni dn, uni xdn, uni ydn,
	uni xn, uni_t xl,
	uni yn, uni_t yl,
	SIGN *signd
);

uni_t min_find_nd(uni_t x);
uni_t min_find_window(uni e, uni_t i, uni_t ws);
uni_t min_nres_prepare(uni_t a);
void min_nres_prepare2(MI nd, MI n);
void min_nres_redc(uni zn, uni_t zl, uni_t nd, uni nn, uni_t nl);

/**
 * @brief User level integer instance initialize.
 * @return New pointer to integer
 *
 * @author Huseyin Hisil
 * @date Sep 2004
 **/
void mi_init(MI new);

/**
 * @brief User level integer release.
 * Release number is not returned to the system. Instead it it cached.
 * @param a - Pointer to integer about to be released
 *
 * @author Huseyin Hisil
 * @date Sep 2004
 **/
void mi_free(MI a);

/**
 * @brief Developer level integer instance initialize.
 * Fast family memory functions has a distinct cahing buffer which is
 * used bu inner routines.
 * @author Ali Mersin
 * @author Mutlu Beyazit
 * @date Sep 2005
 **/
void mi_init_fast(MI new);

/**
 * @brief Developer level integer release.
 * Release number is not returned to the system. Instead it it cached.
 * @param a - Pointer to integer about to be released.
 *
 * @author Ali Mersin
 * @author Mutlu Beyazit
 * @date Sep 2005
 **/
void mi_free_fast(MI a);

/**
 * @brief User level integer array instance initialize.
 * This function doesn't introduce a faster scheme than mi_init.
 * It should be redesigned.
 * @param len - Number of instances within the array.
 *
 * @author Huseyin Hisil
 * @date Dec 2005
 **/
MI_t *mi_init_array(uni_t len);

/**
 * @brief User level integer array instance release.
 * The instances within the array are not returned to the system.
 * They are cached for further use.
 * @param a - Pointer to the array of integers to be released.
 *
 * @author Huseyin Hisil
 * @date Dec 2005
 **/
void mi_kill_array(MI_t *a);

/**
 * @brief Developer level integer array instance initialize.
 * This function doesn't introduce a faster scheme than mi_init_fast.
 * It should be redesigned.
 * @param len - Number of instances within the array.
 *
 * @author Huseyin Hisil
 * @date Jan 2006
 **/
MI_t *mi_init_array_fast(uni_t len);

/**
 * @brief Developer level integer array instance release.
 * The instances within the array are not returned to the system.
 * They are cached for further use.
 * @param a - Pointer to the array of integers to be released.
 *
 * @author Huseyin Hisil
 * @date Jan 2006
 **/
void mi_free_array_fast(MI_t *a);

/**
 * @brief User level generic (I/O) function.
 * @param a - Multiprecision integer.
 * @param buf - To be documented.
 * @param bufl - To be documented.
 * @param base - (I/O) base.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_io_scan(MI a, uni buf, uni_t bufl, uni_t base);

/**
 * @brief User level generic (I/O) function.
 * @param a - Multiprecision integer.
 * @param s - To be documented.
 * @param base - (I/O) base.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_io_sscan(MI a, sic s, uni_t base);

/**
 * @brief User level generic (I/O) function.
 * @param a - Multiprecision integer.
 * @param fp - File.
 * @param base - (I/O) base.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_io_fscan(MI a, FILE *fp, uni_t base);

/**
 * @brief User level generic (I/O) function.
 * @param s - To be documented.
 * @param a - Multiprecision integer.
 * @param base - (I/O) base.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_io_sprint(sic s, MI a, uni_t base);

/**
 * @brief User level generic print function.
 * @param fp - File.
 * @param a - Multiprecision integer.
 * @param base - (I/O) base.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_io_fprint(FILE *fp, MI a, uni_t base);

/**
 * @brief User level generic print function with newline.
 * @param fp - File.
 * @param a - Multiprecision integer.
 * @param base - (I/O) base.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_io_fprint_ln(FILE *fp, MI a, uni_t base);

/**
 * @brief Sets the magnitude of an integer to the specified value.
 * @param a - Multiprecision integer.
 * @param sign - To be documented.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_sign(MI a, SIGN sign);

/**
 * @brief Inverts the magnitude of an integer.
 * @param a - Multiprecision integer.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_negate(MI a);

/**
 * @brief Assign the single precison value to a mutliprecision integer.
 * @param a - Multiprecision integer.
 * @param value - To be documented.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_set_1(MI a, uni_t value);

/**
 * @brief Clone an integer instance.
 * @param z - To be documented.
 * @param a - To be documented.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_clone(MI z, MI a);

/**
 * @brief Shifts an integer instance to left by one bit.
 * @param z - To be documented.
 * @param a - To be documented.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_shift_left(MI z, MI a);

/**
 * @brief Shifts an integer instance to right by one bit.
 * @param z - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_shift_right(MI z, MI a);

/**
 * @brief Shifts an integer instance to left by many bits.
 * @param z - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param n - To be documented.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_shift_left_nbit(MI z, MI a, uni_t n);

/**
 * @brief Shifts an integer instance to right by many bits.
 * @param z - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param n - To be documented.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_shift_right_nbit(MI z, MI a, uni_t n);

/**
 * @brief Compare a multiprecision integers with a single precision positive integer.
 * @param a - Multiprecision integer, input.
 * @param b - To be documented.
 *
 * @author Huseyin Hisil.
 * @date
 **/
COMPARE mi_compare_abs_1(MI a, uni_t b);

/**
 * @brief Compare two integers without regarding the magnitude.
 * @param a - Multiprecision integer, input.
 * @param b - Multiprecision integer, input.
 *
 * @author Huseyin Hisil.
 * @date
 **/
COMPARE mi_compare_abs(MI a, MI b);

/**
 * @brief Compare two integers.
 * @param a - Multiprecision integer, input.
 * @param b - Multiprecision integer, input.
 *
 * @author Huseyin Hisil.
 * @date
 **/
COMPARE mi_compare(MI a, MI b);

/**
 * @brief Add b.
 * @param z - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param b - To be documented.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_add_1(MI z, MI a, uni_t b);

/**
 * @brief Add two integers.
 * @param z - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param b - Multiprecision integer, input.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_add(MI z, MI a, MI b);

/**
 * @brief Sub b.
 * @param z - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param b - To be documented.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_sub_1(MI z, MI a, uni_t b);

/**
 * @brief Subtract an integer from the other.
 * @param z - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param b - Multiprecision integer, input.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_sub(MI z, MI a, MI b);

/**
 * @brief Mul b.
 * @param z - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param b - To be documented.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_mul_1(MI z, MI a, uni_t b);

/**
 * @brief Multiply two integers.
 * @param z - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param b - Multiprecision integer, input.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_mul(MI z, MI a, MI b);

/**
 * @brief Integer Exponentiation.
 * Attention: This is not modular exponentiation!!!
 * @param z - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param b - Multiprecision integer, input.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_exp(MI z, MI a, MI b);

/**
 * @brief Division without remainder. (Jebelean's Exact Division)
 * @param q - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param b - Multiprecision integer, input.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_div_q(MI q, MI a, MI b);

/**
 * @brief Qutient and Remander for the division of integers.
 * @param q - Multiprecision integer, output.
 * @param r - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param b - Multiprecision integer, input.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_div_qr(MI q, MI r, MI a, MI b);

/**
 * @brief Div b.
 * @param q - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param b - To be documented.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_div_1(MI q, MI a, uni_t b);

/**
 * @brief Divide an integer to one other.
 * @param q - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param b - Multiprecision integer, input.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_div(MI q, MI a, MI b);

/**
 * @brief Greatest common divisor of two integers.
 * @param d - Multiprecision integer, output.
 * @param a - Multiprecision integer, input.
 * @param b - Multiprecision integer, input.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_gcd(MI d, MI a, MI b);

/**
 * @brief Greatest common divisor of two integers with linear dependencies.
 * Extended GCD.
 * @param d - Multiprecision integer, output.
 * @param xd - Multiprecision integer, output.
 * @param yd - Multiprecision integer, output.
 * @param x - Multiprecision integer, input.
 * @param y - Multiprecision integer, input.
 *
 * @author Huseyin Hisil.
 * @date
 **/
void mi_gcdx(MI d, MI xd, MI yd, MI x, MI y);

/**
 * @brief Least Common Multiple of two integers.
 * Calculates gcd of given two numbers and returns (a*b)/gcd(a,b).
 * @param z - Least common multiple result of two multipresicion integer.
 * @param a - First multiprecision integer for least common multiple operation.
 * @param b - Second multiprecision integer for least common multiple operation.
 *
 * @author Ali Mersin
 * @author Evren Akalp
 * @date April 2006.
 **/
void mi_lcm(MI z, MI a, MI b);

void mi_nres_on(MI z, MI a, MI n);
void mi_nres_off(MI z, MI a, uni_t nd, MI n);

/**
 * r = a % n
 * No restrictions.
 * Checked:
 * - n cannot be negatif, zero or one.
 * - if a and n are the same instance, simply r = 1.
 *
 **/
void mi_mod(MI r, MI a, MI n);
void mi_mod_nres(MI z, MI a, uni_t nd, MI n);
void mi_mod_nres2(MI z, MI a, MI nd, MI n);
void mi_modadd(MI z, MI a, MI b, MI n);
void mi_modsub(MI z, MI a, MI b, MI n);
void mi_modmul(MI z, MI a, MI b, MI n);
void mi_modmul_nres(MI z, MI a, MI b, uni_t nd, MI n);
void mi_modmul_nres2(MI z, MI a, MI b, MI nd, MI n);
void mi_modinv(MI z, MI a, MI n);
void mi_moddiv(MI z, MI a, MI b, MI n);
void mi_moddiv_nres(MI z, MI a, MI b, uni_t nd, MI n);
void mi_moddiv_nres2(MI z, MI a, MI b, MI n);
void mi_modexp(MI z, MI M, MI e, MI n);
void mi_modexp_nres(MI z, MI a, MI b, uni_t nd, MI n);
void mi_modexp_nres2(MI z, MI a, MI b, MI nd, MI n);

/**
 * @brief Legendre's quadratic residue checker.
 *
 * 		The Legendre symbol is a number theoretic function defined as (a/p) for odd
 * prime p. This function is used to determine if a is a quadratic residue modulo p, +/-1 or 0
 * returns from this function as shown below.
 *
 * 		(a/p)==(a|p)={0   if p|a; 1   if a is a quadratic residue modulo p; -1   if a is a quadratic nonresidue modulo p.
 *
 * @param a - Any positive multiprecision integer
 * @param b - Odd prime multiprecision integer
 *
 *
 * CRYMPIX defines QRESIDUE as 1, QNRESIDUE as -1, QMULTIPLE as 0 for Legendre symbol
 * @return	QRESIDUE if a is a quadratic residue modulo b
 * 			QNRESIDUE if a is not a quadratic residue modulo b
 * 			QMULTIPLE if a is  multiple of modulo b
 *
 * @author Ali Mersin
 * @author Evren Akalp
 * @date April 2006.
 **/
QR mi_legendre(MI a, MI b);

/**
 * @brief Jacobi's quadratic residue checker.
 *
 * The Jacobi symbol generalizes the quadratic reciprocity theorem
 * 				(m/n)(n/m)==(-1)^((m-1)(n-1)/4)
 *
 * for m and n relatively prime odd integers with n>=3. Written another way, or
 * 				(m/n)==(-1)^((m-1)(n-1)/4)(n/m)
 *
 * @param a - Any positive multiprecision integer
 * @param b - Odd positive multiprecision integer
 *
 * CRYMPIX defines QRESIDUE as 1, QNRESIDUE as -1, QMULTIPLE as 0 for Legendre symbol
 * @return	QRESIDUE if a is a quadratic residue modulo b
 * 			QNRESIDUE if a is not a quadratic residue modulo b
 * 			QMULTIPLE if a is  multiple of modulo b
 *
 * @author Ali Mersin
 * @author Evren Akalp
 * @date April 2006.
 **/
QR mi_jacobi(MI a, MI b);

/**
 * @brief Kronecker's quadratic residue checker.
 *
 * The Kronecker symbol is an extension of the Jacobi symbol (n|m) to all integers.
 * The Kronocker symbol computed by rules of Jacobi symbol
 *		 ((ab)/(cd)) = (a/(cd))(b/(cd))==((ab)/c)((ab)/d)
 *
 * The definition for m=2 is calculated by the formula
 *		 (n/2)={0   for n even; 1   for n odd, n=+/-1 (mod 8); -1   for n odd, n=+/-3 (mod 8)
 *
 * @param a - Any positive multiprecision integer
 * @param b - Odd positive multiprecision integer
 *
 * CRYMPIX defines QRESIDUE as 1, QNRESIDUE as -1, QMULTIPLE as 0 for Legendre symbol
 * @return	QRESIDUE if a is a quadratic residue modulo b
 * 			QNRESIDUE if a is not a quadratic residue modulo b
 * 			QMULTIPLE if a is  multiple of modulo b
 *
 * @author Ali Mersin
 * @author Evren Akalp
 * @date April 2006.
 **/
QR mi_kronecker(MI a, MI b);

/**
 * @brief Fermat Primality Test.
 * ...
 * @param n - To be documented.
 * @param t - To be documented.
 *
 * @author Sevgi Uslu
 * @date April 2006.
 **/
BOOL mi_prime_test_fermat(MI n, uni_t t);

/**
 * @brief Solovay-Strassen Primality Test.
 * ...
 * @param n - To be documented.
 * @param t - To be documented.
 *
 * @author Sevgi Uslu
 * @date April 2006.
 **/
BOOL mi_prime_test_solovaystrassen(MI n, uni_t t);

/**
 * @brief Miller-Rabin Primality Test.
 * ...
 * @param n - To be documented.
 * @param t - To be documented.
 *
 * @author Sevgi Uslu
 * @date April 2006.
 **/
BOOL mi_prime_test_millerrabin(MI n, uni_t t);

/**
 * @brief Primality Test.
 * ...
 * @param n - To be documented.
 * @param t - To be documented.
 *
 * @author Sevgi Uslu
 * @date April 2006.
 **/
BOOL mi_prime_test(MI n, uni_t t);

/**
 * @brief Simple Pseudoprime Generation.
 * ...
 * @param p - To be documented.
 * @param len - To be documented.
 * @param certainty - To be documented.
 *
 * @author Fusun Cetin
 * @date April 2006.
 **/
void mi_prime_gen_simple(MI p, uni_t len, uni_t certainty);

/**
 * @brief Double Pseudoprime Generation.
 * (r = kt + 1) t is a simple prime.
 * @param p - To be documented.
 * @param t - To be documented.
 * @param certainty - To be documented.
 *
 * @author Fusun Cetin
 * @date April 2006.
 **/
void mi_prime_gen_double(MI p, MI t, uni_t certainty);

/**
 * @brief Strong Pseudoprime Generation.
 * u(r, s) = (s^(r-1) - r^(s-1)) (mod r*s)
 *
 * p = u(r, s) + k*r*s
 *
 * s and t are simple prime.
 * r is double prime.
 * @param p - To be documented.
 * @param len - To be documented.
 * @param certainty - To be documented.
 *
 * @author Fusun Cetin
 * @date April 2006.
 **/
void mi_prime_strong_gen(MI p, uni_t len, uni_t certainty);

/**
 * @brief Type definition for a polynomial over \f$ F_2 \f$.
 * BELOW DEFINITIONS ARE HIGHLY EXPERIMENTAL.
 *
 * @author Huseyin Hisil.
 * @date Build Mar 21, 2004.
 **/
typedef struct {
	uni_t sc; /* Identifier for special case numbers. (Ex: NIST recommended polynomials) */
	MA_t v;   /* Vector part of the integer */
} MBPN_t[1], *MBP;

#define mbpn_GENERIC_REDUCTION 0
#define mbpn_NIST_POLYNOMIAL_163 163
#define mbpn_NIST_POLYNOMIAL_233 233
#define mbpn_NIST_POLYNOMIAL_283 283
#define mbpn_NIST_POLYNOMIAL_409 409
#define mbpn_NIST_POLYNOMIAL_571 571

void mbpn_add_n(uni zn, uni an, uni bn, uni_t bl);
void mbpn_mul_n_rtl_comb(uni zn, uni an, uni_t al, uni bn, uni_t bl);
void mbpn_mul_n_ltr_comb(uni zn, uni an, uni_t al, uni bn, uni_t bl);
void mbpn_mul_n_ltr_cww(uni zn, uni an, uni_t al, uni bn, uni_t bl);
void mbpn_mul_n_karatsuba(uni zn, uni an, uni_t al, uni bn, uni_t bl, uni_t tn);
void mbpn_mul_n_static(uni zn, uni an, uni_t al, uni bn, uni_t bl);
void mbpn_mod_n(uni zn, uni an, uni_t al, uni bn, uni_t bl);
void mbpn_mod_w32_for_np163(uni zn, uni an, uni_t al);
void mbpn_mod_w32_for_np233(uni zn, uni an, uni_t al);
void mbpn_mod_w32_for_np283(uni zn, uni an, uni_t al);
void mbpn_mod_w32_for_np409(uni zn, uni an, uni_t al);
void mbpn_mod_w32_for_np571(uni zn, uni an, uni_t al);
void mbpn_gcd_ext_1(uni_t a, uni_t b);

void mbpn_gcd_gen(MA uv, MA vv, MA ouv, MA ovv);
void mbpn_gcd_euc(uni un, uni_t ul, uni vn, uni_t vl, uni tn);

/**
 * @brief User level integer instance initialize.
 * @return New pointer to integer
 *
 * @author Huseyin Hisil
 * @date Sep 2004
 **/
void mbp_init(MBP new);

/**
 * @brief User level integer release.
 * Release number is not returned to the system. Instead it it cached.
 * @param a - Pointer to integer about to be released
 *
 * @author Huseyin Hisil
 * @date Sep 2004
 **/
void mbp_free(MBP a);

/**
 * @brief Developer level integer instance initialize.
 * Fast family memory functions has a distinct cahing buffer which is
 * used bu inner routines.
 * @author Ali Mersin
 * @author Mutlu Beyazit
 * @date Sep 2005
 **/
void mbp_init_fast(MBP new);

/**
 * @brief Developer level integer release.
 * Release number is not returned to the system. Instead it it cached.
 * @param a - Pointer to integer about to be released.
 *
 * @author Ali Mersin
 * @author Mutlu Beyazit
 * @date Sep 2005
 **/
void mbp_free_fast(MBP a);

/**
 * @brief User level integer array instance initialize.
 * This function doesn't introduce a faster scheme than mbp_init.
 * It should be redesigned.
 * @param len - Number of instances within the array.
 *
 * @author Huseyin Hisil
 * @date Dec 2005
 **/
MBPN_t *mbp_init_array(uni_t len);

/**
 * @brief User level integer array instance release.
 * The instances within the array are not returned to the system.
 * They are cached for further use.
 * @param a - Pointer to the array of integers to be released.
 *
 * @author Huseyin Hisil
 * @date Dec 2005
 **/
void mbp_kill_array(MBPN_t *a);

/**
 * @brief Developer level integer array instance initialize.
 * This function doesn't introduce a faster scheme than mbp_init_fast.
 * It should be redesigned.
 * @param len - Number of instances within the array.
 *
 * @author Huseyin Hisil
 * @date Jan 2006
 **/
MBPN_t *mbp_init_array_fast(uni_t len);

/**
 * @brief Developer level integer array instance release.
 * The instances within the array are not returned to the system.
 * They are cached for further use.
 * @param a - Pointer to the array of integers to be released.
 *
 * @author Huseyin Hisil
 * @date Jan 2006
 **/
void mbp_free_array_fast(MBPN_t *a);

void mbp_io_scan(MBP a, uni buf, uni_t bufl, uni_t base);
void mbp_io_sscan(MBP a, sic s, uni_t base);
void mbp_io_fscan(MBP a, FILE *fp, uni_t base);
void mbp_io_sprint(uni s, MBP a, uni_t base);
void mbp_io_fprint(FILE *fp, MBP a, uni_t base);
void mbp_gcd(MBP z, MBP a, MBP b);

/* no restriction */
#define mbpm_add_n(_zn, _an, _bn, _bl)if(1){ \
	uni_t _i; \
	for(_i = 0; _i < _bl; _i++){ \
		_zn[_i] = _an[_i] ^ _bn[_i]; \
	} \
}
