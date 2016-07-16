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

void ma_init(MA new)
{
	new->l = 0;
	new->n = (uni)kn_init();
}

void ma_free(MA a)
{
	CHECK(a != NULL);
	if(a->n != NULL){
		kn_free(a->n);
	}
	else{
		kn_exit("mi_free", ERR_OBJECT_KILL);
	}
}

void ma_init_fast(MA new)
{
	new->l = 0;
	new->n = (uni)kn_init_fast();
}

void ma_free_fast(MA a)
{
	CHECK(a != NULL);
	if(a->n != NULL){
		kn_free_fast(a->n);
	}
	else{
		kn_exit("mi_free", ERR_OBJECT_KILL);
	}
}

void ma_shift_left(MA z, MA a, uni_t n){
	uni_t nw;

	CHECK(z != NULL);
	CHECK(a != NULL);
	nw = (n / UNIT_LEN);
	n -= (nw * UNIT_LEN);
	z->n[a->l] = 0;
	man_shift_left(z->n, a->n, a->l, n); /* Bit level shifting. */
	z->l = a->l + (z->n[a->l] != 0);
	mam_clo(z->n + nw, z->n, z->l); /* Word level shifting. */
	mam_clr(z->n, nw);
	z->l += nw;
}

void ma_shift_right(MA z, MA a, uni_t n){
	uni_t nw;

	CHECK(z != NULL);
	CHECK(a != NULL);
	nw = (n / UNIT_LEN);
	n -= (nw * UNIT_LEN);
	if(nw >= a->l){
		z->n[0] = 0;
		z->l = 1;
	}
	else{
		mam_clo(z->n, (a->n + nw), (a->l - nw)); /* Word level shifting. */
		z->l = a->l - nw;
		man_shift_right(z->n, z->n, z->l, n); /* Bit level shifting. */
		z->l -= (z->n[z->l - 1] == 0);
	}
	if((z->n[0] == 0) && (z->l == 0)) z->l++; /* Fix this. 16 March 2007 */
}

uni_t ma_normalize_right(MA z, MA a){
	uni_t i, j;

	CHECK(z != NULL);
	CHECK(a != NULL);
	if(man_compare_1(a->n, a->l, 0) == EQUAL){
		i = j = z->n[0] = 0;
		z->l = 1;
	}
	else{
		mam_count_lo(i, a->n, a->l, 0);
		km_count_lo(j, a->n[i], 0);
		ma_shift_right(z, a, i * UNIT_LEN + j);
	}
	return (i * UNIT_LEN) + j;
}

void ma_rand(MA z, uni_t nb, uni_t s)
{
	uni_t i, m, q, r;

	CHECK(z != NULL);
	if(s != 0){
		kn_srand(s);
	}
	for(i = 0; i < nb; i++){
		q = i / UNIT_LEN;
		m = i - q * UNIT_LEN;
		if(m == 0){
			z->n[q] = 0;
		}
		r = kn_rand();
		z->n[q] |= ((r & 1) << m);
	}
	z->l = nb / UNIT_LEN + (nb % UNIT_LEN != 0);
}
