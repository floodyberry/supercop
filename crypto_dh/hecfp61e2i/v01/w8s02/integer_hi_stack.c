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
#include "multiprecision_stack.h"

#define FIXLEN 9 /*Alter this as needed.*/

void mi_io_scan_stack(MI a, uni buf, uni_t bufl, uni_t base)
{
	if(buf[0] == -1){
		a->s = NEGATIVE;
		a->v->l = man_convert_word(a->v->n, (buf + 1), (bufl - 1), base);
	}
	else{
		a->s = POSITIVE;
		a->v->l = man_convert_word(a->v->n, buf, bufl, base);
	}
}

void mi_io_sscan_stack(MI a, sic s, uni_t base)
{
	uni_t bufl, buf[IO_BUFFER_SIZE]; /* IO Buffer will be eliminated by next version. */

	bufl = kn_io_sscan(buf, s, base);
	mi_io_scan_stack(a, buf, bufl, base);
}

void mi_io_fscan_stack(MI a, FILE *fp, uni_t base)
{
	uni_t bufl, buf[IO_BUFFER_SIZE]; /* IO Buffer will be eliminated by next version. */

	bufl = kn_io_fscan(buf, fp, base);
	mi_io_scan_stack(a, buf, bufl, base);
}

void mi_io_sprint_stack(sic s, MI a, uni_t base)
{
	uni_t bufl, buf[IO_BUFFER_SIZE];
	MI_t t;
	uni_t tn[FIXLEN];

	mi_init_stack(t, tn);
	mi_clone_stack(t, a);
	bufl = man_convert_base(buf, t->v->n, t->v->l, base);
	kn_io_sprint(s, buf, bufl, base);
}

void mi_io_fprint_stack(FILE *fp, MI a, uni_t base)
{
	uni_t bufl, buf[IO_BUFFER_SIZE];
	sic sign;
	MI_t t;
	uni_t tn[FIXLEN];

	sign = NULL;
	if((a->s == NEGATIVE) && ((a->v->n[0] != 0) || (a->v->l != 1))){
		sign = "-";
	}
	mi_init_stack(t, tn);
	mi_clone_stack(t, a);
	bufl = man_convert_base(buf, t->v->n, t->v->l, base);
	kn_io_fprint(fp, sign, buf, bufl, "", base);
}

void mi_io_fprint_ln_stack(FILE *fp, MI a, uni_t base)
{
	uni_t bufl, buf[IO_BUFFER_SIZE];
	sic sign;
	MI_t t;
	uni_t tn[FIXLEN];

	sign = NULL;
	if((a->s == NEGATIVE) && ((a->v->n[0] != 0) || (a->v->l != 1))){
		sign = "-";
	}
	mi_init_stack(t, tn);
	mi_clone_stack(t, a);
	bufl = man_convert_base(buf, t->v->n, t->v->l, base);
	kn_io_fprint(fp, sign, buf, bufl, "\n", base);
}


//static uni_t div_lehmer_stack(uni_t aH, uni_t aL, uni_t bH, uni_t bL){
//	uni_t q, sh, tH, tL;
//
//	/*CHECK(bH != 0 || bL != 0);*/ /* b != 0, debug */
//	/*CHECK((aH > bH) || (aH == bH && aL >= bL));*/ /* a > b, debug */
//	/*CHECK((bH + 1) != 0);*/ /* a > b, debug */
//	q = aH / (bH + 1);
//	if(q != ((aH + 1) / bH)){ /* Do it in the hard way. */
//		q = 0;
//		while((aH > bH) || ((aH == bH) && (aL >= bL))){
//			km_log_sub(sh, aH, bH);
//			if(sh != 0){
//				tH = (bH << sh) | (bL >> (UNIT_LEN - sh));
//				tL = (bL << sh);
//			}
//			else{
//				tH = bH;
//				tL = bL;
//			}
//			if((tH > aH) || ((tH == aH) && (tL >= aL))){
//				sh--;
//				tL = (tH << (UNIT_LEN - 1)) + (tL >> 1);
//				tH >>= 1;
//			}
//			q |= (1 << sh);
//			km_sub_2(aH, aL, aH, aL, tL);
//			aH -= tH;
//		}
//	}
//	return q;
//}

static void min_gcdx_lehmer_stack(
	uni dn, uni xdn, uni ydn,
	uni xn, uni_t xl, uni yn, uni_t yl,
	SIGN *signd
){
	/*uni_t tAH, tAL, tBH, tBL, tCH, tCL, tDH, tDL, tq0, tq1;*/
	uni_t i, tl, tql, dl, xdl, ydl, shift, A, B, C, D, q, t;
	uni_t txxH, txxL, tyxH, tyxL, txyH, txyL, tyyH, tyyL, crx, cry;
	uni_t uaH, vaH;
	SIGN sign = POSITIVE;

	dl = xl, xdl = 1, ydl = 1, yn[yl] = 0;
	while(!((yl == 1) && (yn[0] == 0))){
		/* Try Approximative GCD in the next version!!! */
		A = 1; B = 0; C = 0; D = 1;
		uaH = xn[xl - 1];
		km_normalize_left(uaH, shift);
		if(shift != 0){
			if(xl > 1){
				uaH += xn[xl - 2] >> (UNIT_LEN - shift);
				vaH = (yn[xl - 1] << shift) + (yn[xl - 2] >> (UNIT_LEN - shift));
			}
			else{
				vaH = (yn[xl - 1] << shift);
			}
		}
		else{
			vaH = yn[xl - 1];
		}
		while(TRUE){
			sign = POSITIVE;
			if((vaH - C) == 0){ break; }
			if((vaH + D) == 0){ break; }
			q = ((uaH + A) / (vaH - C));
			if(q != ((uaH - B) / (vaH + D))){ break; }
			t = A + (q * C), A = C, C = t;
			t = B + (q * D), B = D, D = t;
			t = uaH - (q * vaH), uaH = vaH, vaH = t;
			sign = NEGATIVE;
			if((vaH - D) == 0){ break; }
			q = ((uaH - A) / (vaH + C));
			if(q != ((uaH + B) / (vaH - D))){ break; }
			t = A + (q * C), A = C, C = t;
			t = B + (q * D), B = D, D = t;
			t = uaH - (q * vaH), uaH = vaH, vaH = t;
		}
		if(xdn != NULL){ /* For extended CGD. */
			if(sign == NEGATIVE){
				*signd = mim_sign_inv(*signd);
			}
		}
		if(B == 0){ /* Then A=1, B=0, C=0, D=1. Very rare case. */
			uni_t tq[FIXLEN], tt[FIXLEN];
			mam_clo(dn, xn, xl); /* dn is temp */
			mam_clo(xn, yn, yl);
			mam_clo(yn, dn, xl);
			mam_clr(xn + yl, xl - yl); /* 10 Mayis 2007'de duzelttim. GCD(9589271353, 9545683756) hata veriyordu. */
			tl = xl, xl = yl, yl = tl;
			tq[yl - xl] = 0; /* 2 Haziran 2009. HH. */
			min_div_qr(tq, yn, yn, yl, xn, xl, dn); /* dn is temp */
			tql = yl - xl + 1;
			mam_trim(tq, tql);
			if(xdn != NULL){ /* For extended CGD. */
				mam_clo(dn, xdn, xdl); /* dn is temp */
				mam_clo(xdn, ydn, ydl);
				mam_clo(tt, ydn, ydl);
				tl = xdl, xdl = ydl;
				min_mul_basecase(ydn, tt, ydl, tq, tql);
				ydl += tql;
				mim_inc_n(ydn[ydl], ydn, ydl, dn, tl, 0);
				ydl++;
				mam_trim(ydn, ydl);
				*signd = mim_sign_inv(*signd);
			}
		}
		else{ /* Compute new x and y for GCD. */
			crx = cry = txxH = tyxH = txyH = tyyH = 0;
			if(sign == POSITIVE){
				for(i = 0; i < xl; i++){
					km_mul_2_add_c(txxH, txxL, A, xn[i], txxH);
					km_mul_2_add_c(tyxH, tyxL, B, yn[i], tyxH);
					km_mul_2_add_c(txyH, txyL, C, xn[i], txyH);
					km_mul_2_add_c(tyyH, tyyL, D, yn[i], tyyH);
					km_sub_c(cry, yn[i], tyyL, txyL, cry);
					km_sub_c(crx, xn[i], txxL, tyxL, crx);
				}
				xn[i] = txxH - tyxH - crx;
				yn[i] = tyyH - txyH - cry;
			}
			else{
				for(i = 0; i < xl; i++){
					km_mul_2_add_c(txxH, txxL, A, xn[i], txxH);
					km_mul_2_add_c(tyxH, tyxL, B, yn[i], tyxH);
					km_mul_2_add_c(txyH, txyL, C, xn[i], txyH);
					km_mul_2_add_c(tyyH, tyyL, D, yn[i], tyyH);
					km_sub_c(cry, yn[i], txyL, tyyL, cry);
					km_sub_c(crx, xn[i], tyxL, txxL, crx);
				}
				xn[i] = tyxH - txxH - crx;
				yn[i] = txyH - tyyH - cry;
			}
			if(xdn != NULL){ /* For extended CGD. */
				crx = cry = txxH = tyxH = txyH = tyyH = 0;
				for(i = 0; i < ydl; i++){
					km_mul_2_add_c(txxH, txxL, A, xdn[i], txxH);
					km_mul_2_add_c(tyxH, tyxL, B, ydn[i], tyxH);
					km_mul_2_add_c(txyH, txyL, C, xdn[i], txyH);
					km_mul_2_add_c(tyyH, tyyL, D, ydn[i], tyyH);
					km_add_c(cry, ydn[i], txyL, tyyL, cry);
					km_add_c(crx, xdn[i], txxL, tyxL, crx);
				}
				km_add_c(crx, xdn[ydl], txxH, tyxH, crx);
				km_add_c(cry, ydn[ydl], txyH, tyyH, cry);
				ydl++;
				xdl = ydl;
				mam_trim(xdn, xdl);
				mam_trim(ydn, ydl);
			}
		}
		mam_trim(xn, xl);
		mam_trim(yn, yl);
	}
	if(xdn != NULL){ /* For extended CGD. */
		if(dl > xdl){
			mam_clr((xdn + xdl), (dl - xdl));
		}
		if(dl > ydl){
			mam_clr((ydn + ydl), (dl - ydl));
		}
	}
	mam_clo(dn, xn, dl);
}


void mi_init_stack(MI new, uni an)
{

#ifdef DEBUG_MAI
	CHECK(new != NULL);
#endif

	new->s = POSITIVE;
	new->v->l = 0;
	new->v->n = an;
}

void mi_negate_stack(MI a)
{

#ifdef DEBUG_MAI
	CHECK(a != NULL);
#endif

	if(a->s == POSITIVE){
		a->s = NEGATIVE;
	}
	else{
		a->s = POSITIVE;
	}
}

void mi_set_1_stack(MI a, uni_t value)
{

#ifdef DEBUG_MAI
	CHECK(a != NULL);
#endif

	a->s = POSITIVE;
	a->v->l = 1;
	a->v->n[0] = value;
}

void mi_clone_stack(MI z, MI a)
{

#ifdef DEBUG_MAI
	CHECK(z != NULL);
	CHECK(a != NULL);
#endif

	mam_clo(z->v->n, a->v->n, a->v->l);
	z->v->l = a->v->l;
	z->s = a->s;
}

COMPARE mi_compare_abs_1_stack(MI a, uni_t b)
{

#ifdef DEBUG_MAI
	CHECK(a != NULL);
#endif

	return man_compare_1(a->v->n, a->v->l, b);
}

COMPARE mi_compare_abs_stack(MI a, MI b)
{

#ifdef DEBUG_MAI
	CHECK(a != NULL);
	CHECK(b != NULL);
#endif

	return man_compare(a->v->n, a->v->l, b->v->n, b->v->l);
}

COMPARE mi_compare_stack(MI a, MI b)
{
#ifdef DEBUG_MAI
	CHECK(a != NULL);
	CHECK(b != NULL);
#endif
	return min_compare(a->v->n, a->v->l, a->s, b->v->n, b->v->l, b->s);
}

void mi_shift_left_stack(MI z, MI a)
{

#ifdef DEBUG_MAI
	CHECK(z != NULL);
	CHECK(a != NULL);
#endif

	ma_shift_left(z->v, a->v, 1);
	z->s = a->s;
}

/* Restriction: n => 0 */
void mi_shift_left_nbit_stack(MI z, MI a, uni_t n)
{

#ifdef DEBUG_MAI
	CHECK(z != NULL);
	CHECK(a != NULL);
#endif

	ma_shift_left(z->v, a->v, n);
	z->s = a->s;
}

void mi_shift_right_stack(MI z, MI a)
{

#ifdef DEBUG_MAI
	CHECK(z != NULL);
	CHECK(a != NULL);
#endif

	ma_shift_right(z->v, a->v, 1);
	z->s = a->s;
}

void mi_shift_right_nbit_stack(MI z, MI a, uni_t n)
{

#ifdef DEBUG_MAI
	CHECK(z != NULL);
	CHECK(a != NULL);
#endif

	ma_shift_right(z->v, a->v, n);
	z->s = a->s;
}

void mi_add_1_stack(MI z, MI a, uni_t b){
	MI_t t;
	uni_t tn[FIXLEN];

	mi_init_stack(t, tn);
	mi_set_1_stack(t, b);
	mi_add_stack(z, a, t);
}

void mi_add_stack(MI z, MI a, MI b)
{

#ifdef DEBUG_MAI
	CHECK(z != NULL);
	CHECK(a != NULL);
	CHECK(b != NULL);
#endif

	if(a == b){
		if(z == a){ /* Logically satisfies (a == b), (b == z), (z == a), (a->s == b->s), (|A| == |B|). */
			mim_inc_n(z->v->n[z->v->l], z->v->n, z->v->l, z->v->n, z->v->l, 0);
		}
		else{ /* Logically satisfies (a == b), (b != z), (z != a), (a->s == b->s), (|A| == |B|). */
			mim_add_n(z->v->n[a->v->l], z->v->n, a->v->n, a->v->l, a->v->n, a->v->l, 0);
		}
	}
	else{
		if(mi_compare_abs_stack(a, b) == LESS){
			km_swap_ptr(a, b); /* Eliminates possibility of |A| < |B|. */
		}
		if(z == a){ /* Logically satisfies (a != b), (b != z), (z == a). */
			if(a->s == b->s){
				mim_inc_n(z->v->n[a->v->l], z->v->n, z->v->l, b->v->n, b->v->l, 0);
			}
			else{
				mim_dec_n(z->v->n[z->v->l], z->v->n, z->v->l, b->v->n, b->v->l, 0);
			}
		}
		else if(z == b){ /* Logically satisfies (a != b), (b == z), (z != a). */
			if(a->s == b->s){
				mim_inc_n(z->v->n[a->v->l], z->v->n, z->v->l, a->v->n, a->v->l, 0);
			}
			else{
				mim_sub_n(z->v->n[a->v->l], z->v->n, a->v->n, a->v->l, b->v->n, b->v->l, 0);
			}
		}
		else{ /* Logically satisfies (a != b), (b != z), (z != a). */
			if(a->s == b->s){
				mim_add_n(z->v->n[a->v->l], z->v->n, a->v->n, a->v->l, b->v->n, b->v->l, 0);
			}
			else{
				mim_sub_n(z->v->n[a->v->l], z->v->n, a->v->n, a->v->l, b->v->n, b->v->l, 0);
			}
		}
	}
	z->v->l = a->v->l + 1;
	mam_trim(z->v->n, z->v->l);
	if(z->v->n[0] == 0 && z->v->l == 1){
		z->s = POSITIVE;
	}
	else{
		z->s = a->s;
	}
}

void mi_sub_1_stack(MI z, MI a, uni_t b){
	MI_t t;
	uni_t tn[FIXLEN];

#ifdef DEBUG_MAI
	CHECK(z != NULL);
	CHECK(a != NULL);
#endif

	mi_init_stack(t, tn);
	mi_set_1_stack(t, b);
	mi_sub_stack(z, a, t);
}

void mi_sub_stack(MI z, MI a, MI b)
{
	MI_t t;
	uni_t tn[FIXLEN];

#ifdef DEBUG_MAI
	CHECK(z != NULL);
	CHECK(a != NULL);
	CHECK(b != NULL);
#endif

	if(a == b){
		mi_set_1_stack(z, 0);
	}
	else{
		mi_init_stack(t, tn);
		mi_clone_stack(t, b);
		mi_negate_stack(t);
		mi_add_stack(z, a, t); /* z = a - b = a + (-b). */
	}
}

void mi_div_q_stack(MI q, MI a, MI b)
{

#ifdef DEBUG_MAI
	CHECK(q != NULL);
	CHECK(a != NULL);
	CHECK(b != NULL);
#endif

	if(mi_compare_abs_1_stack(b, 0) == EQUAL){
		kn_exit("mi_q_and_r", ERR_DIVIDE_BY_ZERO);
	}
	/* ALI BURASI */

}

void mi_div_q_r_stack(MI q, MI r, MI a, MI b)
{
	/**
	 * q and r are nullable but not both.
	 * no other restriction.
	 *
	 * Controls:
	 * - b cannot be zero.
	 * - if b is composed of one word use simple-division.
	 *
	 * Bug: A bunch of bugs is highly possible!!'
	 */
	COMPARE ch;
	MI_t n, tq, tr;
	uni_t nn[FIXLEN], tqn[FIXLEN], trn[FIXLEN];

#ifdef DEBUG_MAI
	CHECK((q != NULL) || (r != NULL));
	CHECK(a != NULL);
	CHECK(b != NULL);
#endif

	if(mi_compare_abs_1_stack(b, 0) == EQUAL){
		kn_exit("mi_q_and_r", ERR_DIVIDE_BY_ZERO);
	}
	if(q == NULL){
		mi_init_stack(tq, tqn);
		q = tq;
	}
	if(r == NULL){
		mi_init_stack(tr, trn);
		r = tr;
	}
	ch = man_compare(a->v->n, a->v->l, b->v->n, b->v->l);
	if(ch == LESS){
		q->v->n[0] = 0;
		q->v->l = 1;
		mam_clo(r->v->n, a->v->n, a->v->l);
		r->v->l = a->v->l;
	}
	else if(ch == GREATER){
		if(a->v->l == 1){
			q->v->n[0] = a->v->n[0] / b->v->n[0];
			q->v->l = 1;
			r->v->n[0] = a->v->n[0] - (b->v->n[0] * (a->v->n[0] / b->v->n[0]));
			r->v->l = 1;
		}
		else{
			mam_clr(q->v->n, a->v->l - b->v->l + 1);
			mi_init_stack(n, nn);
			min_div_qr(q->v->n, r->v->n, a->v->n, a->v->l, b->v->n, b->v->l, n->v->n);
			q->v->l = a->v->l - b->v->l + 1;
			mam_trim(q->v->n, q->v->l);
			r->v->l = a->v->l;
			mam_trim(r->v->n, r->v->l);
		}
	}
	else{
		q->v->n[0] = 1;
		q->v->l = 1;
		r->v->n[0] = 0;
		r->v->l = 1;
	}
	if(q->v->n[0] == 0 && q->v->l == 1){
		q->s = POSITIVE;
	}
	else{
		q->s = mim_sign_mul(a->s, b->s);
	}
}

void mi_div_1_stack(MI q, MI a, uni_t b)
{
	MI_t t;
	uni_t tn[FIXLEN];

#ifdef DEBUG_MAI
	CHECK(q != NULL);
	CHECK(a != NULL);
#endif

	mi_init_stack(t, tn);
	mi_set_1_stack(t, b);
	mi_div_stack(q, a, t);
}

void mi_div_stack(MI q, MI a, MI b)
{
	MI_t t;
	uni_t tn[FIXLEN];

#ifdef DEBUG_MAI
	CHECK(q != NULL);
	CHECK(a != NULL);
	CHECK(b != NULL);
#endif

	if((q == b) || (q == a)){
		mi_init_stack(t, tn);
		mi_div_q_r_stack(t, NULL, a, b);
		mi_clone_stack(q, t);
	}
	else{
		mi_div_q_r_stack(q, NULL, a, b);
	}
}

void mi_mul_1_stack(MI z, MI a, uni_t b)
{
	MI_t t;
	uni_t tn[FIXLEN];

#ifdef DEBUG_MAI
	CHECK(z != NULL);
	CHECK(a != NULL);
#endif

	mi_init_stack(t, tn);
	t->s = POSITIVE;
	t->v->n[0] = b;
	t->v->l = 1;
	mi_mul_stack(z, a, t);
}

void mi_mul_stack(MI z, MI a, MI b)
{
	uni_t al, bl, i;
	MI_t t, r;
	uni_t tn[FIXLEN], rn[FIXLEN];

#ifdef DEBUG_MAI
	CHECK(z != NULL);
	CHECK(a != NULL);
	CHECK(b != NULL);
#endif

	mi_init_stack(r, rn);
	if(a->v->l < b->v->l){
		km_swap_ptr(a, b);
	}
	al = a->v->l;
	bl = b->v->l;
	if(a == b){
		if(bl < THRESHOLD_KARATSUBA_SQR){
			if(bl < THRESHOLD_SQR){
				min_mul_basecase(r->v->n, a->v->n, al, a->v->n, al);
			}
			else{
				min_sqr_basecase(r->v->n, a->v->n, al);
			}
		}
		else if(bl < THRESHOLD_TOOMCOOK3_SQR){
			/* Partitioning strategy can be done better. */
			i = 0; /* Calculate recursion depth. */
			while((al / (1 << i)) > THRESHOLD_KARATSUBA_SQR){
				i++;
			}
			while((al & ((1 << i) - 1)) != 0){
				al++;
			}
			mam_clr(a->v->n + a->v->l, al - a->v->l);
			mam_clr(b->v->n + b->v->l, al - b->v->l);
			mi_init_stack(t, tn);
			min_sqr_karatsuba(r->v->n, a->v->n, al, t->v->n);
		}
	}
	else{
		if(bl < THRESHOLD_KARATSUBA_MUL){
			min_mul_basecase(r->v->n, a->v->n, al, b->v->n, bl);
			/* mi_mul_stack_comba(r->v->n, a->v->n, al, b->v->n, bl); */
		}
		else if(bl < THRESHOLD_TOOMCOOK3_MUL){
			/* Partitioning strategy can be done better. */
			i = 0; /* Calculate recursion depth. */
			while((al / (1 << i)) > THRESHOLD_KARATSUBA_MUL){
				i++;
			}
			while((al & ((1 << i) - 1)) != 0){
				al++;
			}
			mam_clr(a->v->n + a->v->l, al - a->v->l);
			mam_clr(b->v->n + b->v->l, al - b->v->l);
			mi_init_stack(t, tn);
			min_mul_karatsuba(r->v->n, a->v->n, al, b->v->n, al, t->v->n);
		}
	}
	r->v->l = al + bl;
	mam_trim(r->v->n, r->v->l);
	if(r->v->n[0] == 0 && r->v->l == 1){
		r->s = POSITIVE;
	}
	else{
		r->s = mim_sign_mul(a->s, b->s);
	}
	mi_clone_stack(z, r);
}

void mi_exp_stack(MI z, MI a, MI b)
{
	int i; /* Fix this */
	uni_t ei;

#ifdef DEBUG_MAI
	CHECK(z != NULL);
	CHECK(a != NULL);
	CHECK(b != NULL);
	CHECK(z != b);
	CHECK(z != a);
	CHECK(b != a);
#endif

	z->v->n[0] = 1;
	z->v->l = 1;
	z->s = POSITIVE;
	mam_bit_count(i, b->v->n, b->v->l);
	i--;
	while(i >= 0){
		mi_mul_stack(z, z, z);
		mam_ith_bit(ei, b->v->n, i);
		if(ei == 1){
			mi_mul_stack(z, a, z);
		}
		i--;
	}
}

void mi_gcd_stack(MI d, MI x, MI y)
{
	uni_t bcx, bcy;
	MI_t tx, ty;
	uni_t txn[FIXLEN], tyn[FIXLEN];

#ifdef DEBUG_MAI
	CHECK(d != NULL);
	CHECK(x != NULL);
	CHECK(y != NULL);
#endif

	/* Make |x| >= |y| by swapping if needed. */
	if(mi_compare_abs_stack(x, y) == LESS){
		km_swap_ptr(x, y);
	}
	if((y->v->l == 1) && (y->v->n[0] == 0)){
		mi_clone_stack(d, x);
	}
	else{
		/* If x is much bigger than y, then use division. */
		mam_bit_count(bcx, x->v->n, x->v->l);
		mam_bit_count(bcy, y->v->n, y->v->l);
		mi_init_stack(tx, txn);
		mi_init_stack(ty, tyn);
		if((bcx - bcy) > THRESHOLD_GCD_DIV){
			mi_clone_stack(tx, y);
			mi_mod_stack(ty, x, y);
		}
		else{
			mi_clone_stack(tx, x);
			mi_clone_stack(ty, y);
		}
		min_gcdx_lehmer_stack(
			d->v->n, NULL, NULL,
			tx->v->n, tx->v->l,
			ty->v->n, ty->v->l,
			NULL
		);
		d->v->l = tx->v->l;
		mam_trim(d->v->n, d->v->l);
	}
	d->s = POSITIVE; /* GCD(-a, b) == GCD(a, b). Sign of x is not important. */
}

void mi_gcdx_stack(MI d, MI xd, MI yd, MI x, MI y)
{
	uni_t bcx, bcy;
	MI_t tx, ty;
	uni_t txn[FIXLEN], tyn[FIXLEN];
	BOOL swap;

#ifdef DEBUG_MAI
	CHECK(d != NULL);
	CHECK(x != NULL);
	CHECK(y != NULL);
	CHECK(xd != yd);
	CHECK(x != xd);
	CHECK(x != yd);
	CHECK(y != xd);
	CHECK(y != yd);
	CHECK(d != x);
	CHECK(d != y);
	CHECK(d != xd);
	CHECK(d != yd);
#endif

	swap = FALSE;
	/* Make |x| >= |y| by swapping if needed. */
	if(mi_compare_abs_stack(x, y) == LESS){
		km_swap_ptr(x, y);
		swap = TRUE;
	}
	xd->v->l = 1;
	yd->v->l = 1;
	if((y->v->l == 1) && (y->v->n[0] == 1)){ /* 25 march 2007 */
		mi_set_1_stack(d, 1);
		xd->v->n[0] = 1;
		yd->v->n[0] = 0;
	}
	else if((y->v->l == 1) && (y->v->n[0] == 0)){
		mi_clone_stack(d, x);
		xd->v->n[0] = 1;
		yd->v->n[0] = 0;
	}
	else{
		/* If x is much bigger than y, then use division. */
		mam_bit_count(bcx, x->v->n, x->v->l);
		mam_bit_count(bcy, y->v->n, y->v->l);
		mi_init_stack(tx, txn);
		mi_init_stack(ty, tyn);

		if((bcx - bcy) > THRESHOLD_GCD_DIV){
			mi_clone_stack(tx, y);
			mi_mod_stack(ty, x, y);
			xd->v->n[0] = 0;
			yd->v->n[0] = 1;
			xd->s = NEGATIVE;
		}
		else{
			mi_clone_stack(tx, x);
			mi_clone_stack(ty, y);
			xd->v->n[0] = 1;
			yd->v->n[0] = 0;
			xd->s = POSITIVE;
		}

		min_gcdx_lehmer_stack(
			d->v->n, xd->v->n, yd->v->n,
			tx->v->n, tx->v->l,
			ty->v->n, ty->v->l,
			&xd->s
		);

		d->s = POSITIVE; /* GCD(-a, b) == GCD(a, b) */
		d->v->l = tx->v->l;
		mam_trim(d->v->n, d->v->l);
		xd->v->l = tx->v->l;
		mam_trim(xd->v->n, xd->v->l);
		if(yd != NULL){
			mi_mul_stack(tx, x, xd); /* tx is temp now.*/
			mi_sub_stack(tx, d, tx);
			mi_div_stack(yd, tx, y);
		}
		if(swap == TRUE){
			mi_clone_stack(tx, xd);
			mi_clone_stack(xd, yd);
			mi_clone_stack(yd, tx);
		}
		if(x->s == NEGATIVE){
			xd->s = mim_sign_inv(xd->s);
		}
		if(y->s == NEGATIVE){
			yd->s = mim_sign_inv(yd->s);
		}
	}
}

void mi_lcm_stack(MI z, MI a, MI b)
{
	MI_t t;
	uni_t tn[FIXLEN];

#ifdef DEBUG_MAI
	CHECK(z != NULL);
	CHECK(a != NULL);
	CHECK(b != NULL);
#endif

	mi_init_stack(t, tn);
	mi_gcd_stack(t, a, b);
	if(a->v->l < b->v->l){
		mi_div_stack(t, a, t);
		mi_mul_stack(z, b, t);
	}
	else{
		mi_div_stack(t, b, t);
		mi_mul_stack(z, a, t);
	}
}

void mi_mod_stack(MI r, MI a, MI n)
{

#ifdef DEBUG_MOD
	CHECK(r != NULL);
	CHECK(a != NULL);
	CHECK(n != NULL);
	if(n->s == NEGATIVE){ /* n cannot be negative */
		kn_exit("mi_mod_stack: modulus cannot be negative", ERR_INVALID_MODULUS);
	}
	else if((n->v->l == 1) && (n->v->n[0] == 0)){ /* n cannot be 0 */
		kn_exit("mi_mod_stack: modulus cannot be 0", ERR_INVALID_MODULUS);
	}
	else if((n->v->l == 1) && (n->v->n[0] == 1)){ /* n cannot be 1 */
		kn_exit("mi_mod_stack: modulus cannot be 1", ERR_INVALID_MODULUS);
	}
#endif

	if(mi_compare_abs_stack(a, n) == LESS){
		if(a->s == NEGATIVE){
			mi_add_stack(r, a, n); /* (|a| < |n|) and (0 < a) */
		}
		else{
			mi_clone_stack(r, a);
		}
	}
	else{
		mi_div_q_r_stack(NULL, r, a, n);
		if(a->s == NEGATIVE){
			if((r->v->l != 1) || (r->v->n[0] != 0)){
				mi_add_stack(r, r, n); /* (|a| >= |n|) and (0 < a) */
			}
		}
	}
}

void mi_modadd_stack(MI z, MI a, MI b, MI n)
{

#ifdef DEBUG_MOD
	CHECK(z != NULL);
	CHECK(a != NULL);
	CHECK(b != NULL);
	CHECK(n != NULL);
	if((n->v->l + 1) < a->v->l){
		kn_warn("mi_modadd_stack: |a| > |n|", 0);
	}
	if((n->v->l + 1) < b->v->l){
		kn_warn("mi_modadd_stack: |b| > |n|", 0);
	}
#endif

	mi_add_stack(z, a, b);
	mi_mod_stack(z, z, n);
}

void mi_modsub_stack(MI z, MI a, MI b, MI n)
{

#ifdef DEBUG_MOD
	CHECK(z != NULL);
	CHECK(a != NULL);
	CHECK(b != NULL);
	CHECK(n != NULL);
	if((n->v->l + 1) < a->v->l){
		kn_warn("mi_modsub_stack: |a| > |n|", 0);
	}
	if((n->v->l + 1) < b->v->l){
		kn_warn("mi_modsub_stack: |b| > |n|", 0);
	}
#endif

	mi_sub_stack(z, a, b);
	mi_mod_stack(z, z, n);
}

void mi_modmul_stack(MI z, MI a, MI b, MI n)
{

#ifdef DEBUG_MOD
	CHECK(z != NULL);
	CHECK(a != NULL);
	CHECK(b != NULL);
	CHECK(n != NULL);
	if((n->v->l + 1) < a->v->l){
		kn_warn("mi_modmul_stack: |a| > |n|", 0);
	}
	if((n->v->l + 1) < b->v->l){
		kn_warn("mi_modmul_stack: |b| > |n|", 0);
	}
#endif

	mi_mul_stack(z, a, b);
	mi_mod_stack(z, z, n);
}

/*EXPERIMENTAL !!!*/
void mi_modinv_stack(MI z, MI a, MI n)
{
	MI_t d, xd, yd, tt, mm, nn;
	uni_t dn[FIXLEN], xdn[FIXLEN], ydn[FIXLEN], ttn[FIXLEN], mmn[FIXLEN], nnn[FIXLEN];

#ifdef DEBUG_MOD
	CHECK(z != NULL);
	CHECK(a != NULL);
	CHECK(n != NULL);
	if((n->v->l + 1) < a->v->l){
		kn_warn("mi_modinv_stack: |a| > |n|", 0);
	}
#endif

	mi_init_stack(mm, mmn);
	mi_clone_stack(mm, a);
	mi_init_stack(nn, nnn);
	mi_clone_stack(nn, n);

	mi_init_stack(d, dn);
	mi_init_stack(xd, xdn);
	mi_init_stack(yd, ydn);
	mi_mod_stack(a, a, n);

	if((a->v->n[0] == 0) && (a->v->l == 1)){ /* 11 Mayis 2007, HH. */
		kn_exit("mi_modinv_stack: 0 is not a unit", 0);
	}

	/* BU KISIM OZEL EKLENDI. DUZELT!!! */
	mi_init_stack(tt, ttn);
	mi_sub_stack(tt, n, a);
	if((tt->v->n[0] == 1) && (tt->v->l == 1)){
		mi_clone_stack(z, a);
		return;
	}
	if((tt->v->n[0] == 0) && (tt->v->l == 1)){
		kn_exit("mi_modinv_stack", 0);
	}
	/* BU KISIM OZEL EKLENDI. DUZELT!!! */

	mi_gcdx_stack(d, xd, yd, n, a);

	/********** DUZELT ***************************/
	if(xd->s == NEGATIVE){
		mi_add_stack(xd, xd, n);
	}
	if(yd->s == NEGATIVE){
		mi_add_stack(yd, yd, n);
	}

	mi_modmul_stack(d, a, xd, n);

	if((d->v->l == 1) && (d->v->n[0] == 1)){
		mi_clone_stack(z, xd);
	}
	else{
		mi_modmul_stack(d, a, yd, n);
		if((d->v->l == 1) && (d->v->n[0] == 1)){
			mi_clone_stack(z, yd);
		}
		else{
			kn_exit("Error @ mi_modinv_stack(z, a);\n", 0);
		}
	}
	/**********************************************/
}

void mi_moddiv_stack(MI z, MI a, MI b, MI n)
{
	MI_t t;
	uni_t tn[FIXLEN];

#ifdef DEBUG_MOD
	CHECK(z != NULL);
	CHECK(a != NULL);
	CHECK(b != NULL);
	CHECK(n != NULL);
	if((n->v->l + 1) < a->v->l){
		kn_warn("mi_moddiv_stack: |a| > |n|", 0);
	}
	if((n->v->l + 1) < b->v->l){
		kn_warn("mi_moddiv_stack: |b| > |n|", 0);
	}
#endif

	mi_init_stack(t, tn);
	mi_modinv_stack(t, b, n);
	mi_mul_stack(z, a, t);
	mi_mod_stack(z, z, n);
}

void mi_modexp_stack(MI z, MI a, MI b, MI n)
{
	int i; /* Fix this */
	uni_t ei;

#ifdef DEBUG_MOD
	CHECK(z != NULL);
	CHECK(a != NULL);
	CHECK(b != NULL);
	CHECK(n != NULL);
	if((n->v->l + 1) < a->v->l){
		kn_warn("mi_modexp_stack: |a| > |n|", 0);
	}
	if((n->v->l + 1) < b->v->l){
		kn_warn("mi_modexp_stack: |b| > |n|", 0);
	}
#endif

	mi_set_1_stack(z, 1);
	mam_bit_count(i, b->v->n, b->v->l);
	while(i >= 0){
		mi_modmul_stack(z, z, z, n);
		mam_ith_bit(ei, b->v->n, i);
		if(ei == 1){
			mi_modmul_stack(z, a, z, n);
		}
		i--;
	}
}
