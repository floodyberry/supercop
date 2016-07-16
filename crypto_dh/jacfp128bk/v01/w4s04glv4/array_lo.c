/**
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
 **/
#include "kernel.h"
#include "multiprecision.h"

uni_t man_convert_word(
	uni an,
	const uni buf, uni_t bufl,
	uni_t base
){
	uni_t i, al;

	an[0] = 0;
	al = 1;
	for(i = 0; i < bufl; i++){
		mim_mul_1(an[al], an, an, al, base, buf[i]);
		//kn_memcheck(al);
		al += (an[al] != 0);
	}
	return al;
}

uni_t man_convert_base(
	uni src,
	uni an, uni_t al,
	uni_t base
){
	uni_t i, shift, f[IO_BUFFER_SIZE];
	uni qn;

	qn = f;
	km_normalize_left(base, shift); /* start normalize */
	for(i = 0; al != 0; i++){
		if(shift > 0){
			mam_shift_left_bit(an[al], an, an, al, shift);
		}
		mim_q_and_r_1(qn, an, (al + 1), base); /* division */
		an[0] >>= shift; /* unnormalize */
		km_swap_ptr(qn, an);
		src[i] = qn[0];
		al -= (an[al-1] == 0);
	}
	src[i] = '\n';

	return i;
}

COMPARE man_compare_1(const uni an, uni_t al, const uni_t b)
{
	COMPARE r;

	if(al > 1){
		r = GREATER;
	}
	else if(an[0] > b){
		r = GREATER;
	}
	else if(an[0] < b){
		r = LESS;
	}
	else{
		r = EQUAL;
	}
	return r;
}

COMPARE man_compare(const uni an, uni_t al, const uni bn, uni_t bl)
{
	COMPARE r;
	uni_t i;

	if(al > bl){
		r = GREATER;
	}
	else if(al < bl){
		r = LESS;
	}
	else{
		r = EQUAL;
		for(i = al - 1; (i > 0) && (r == EQUAL); i--){
			if(an[i] > bn[i]){
				r = GREATER;
			}
			else if(an[i] < bn[i]){
				r = LESS;
			}
		}
		if(r == EQUAL){
			if(an[0] > bn[0]){
				r = GREATER;
			}
			else if(an[0] < bn[0]){
				r = LESS;
			}
		}
	}
	return r;
}

void man_shift_left(uni zn, uni an, uni_t al, uni_t n){
	if(n == 0){
		mam_clo(zn, an, al);
		zn[al] = 0;
	}
	else{
		mam_shift_left_bit(zn[al], zn, an, al, n);
	}
}

void man_shift_right(uni zn, uni an, uni_t al, uni_t n){
	if(n == 0){
		mam_clo(zn, an, al);
	}
	else{
		mam_shift_right_bit(zn, an, al, n);
	}
}

void man_normalize_right(uni zn, uni an, uni_t al){
	uni_t i, j;

	if(man_compare_1(an, al, 0) == EQUAL){
		zn[0] = 0;
	}
	else{
		mam_count_lo(i, an, al, 0);
		km_count_lo(j, an[i], 0);
		man_shift_right(zn, an, al, i * UNIT_LEN + j);
	}
}

void man_shift_left_experimental(uni zn, uni an, uni_t al, uni_t n){
	uni_t nw;

	nw = (n / UNIT_LEN);
	n -= (nw * UNIT_LEN);
	zn[al] = 0;
	an[al] = 0;
	man_shift_left(zn + nw, an, al + 1, n); /* Bit level shifting. */
	mam_clr(zn, nw);
}
