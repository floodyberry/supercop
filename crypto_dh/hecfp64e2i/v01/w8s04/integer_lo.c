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

COMPARE min_compare(
	const uni an, uni_t al, SIGN as,
	const uni bn, uni_t bl, SIGN bs
){
	COMPARE r;

	if(as == bs){
		r = man_compare(an, al, bn, bl);
		if(as == NEGATIVE){
			if(r == GREATER){
				r = LESS;
			}
			else if(r == LESS){
				r = GREATER;
			}
		}
	}
	else if(as == POSITIVE){
		r = GREATER;
	}
	else{
		r = LESS;
	}
	return r;
}

void min_mul_basecase(
	uni zn,
	const uni an, uni_t al,
	const uni bn, uni_t bl
){
	uni_t i;

	mim_mul_1(zn[al], zn, an, al, bn[0], 0);
	for(i = 1; i < bl; i++){
		mim_inc_n_mul_1(zn[i + al], (zn + i), an, al, bn[i], 0);
	}
}

void min_mul_karatsuba(
	uni zn,
	const uni an, uni_t al,
	const uni bn, uni_t bl,
	uni tn
){
	uni_t ca, cb, ct, c, abl;

	if((al < THRESHOLD_KARATSUBA_MUL) || (bl < THRESHOLD_KARATSUBA_MUL)){
		min_mul_basecase(zn, an, al, bn, bl);
	}
	else{
		al >>= 1;
		bl >>= 1;
		abl = (al + bl);
		mim_add_n(ca, zn, an, al, (an + al), al, 0);        /* (ca,zL) = aL + aH */
		mim_add_n(cb, (zn + al), bn, bl, (bn + bl), bl, 0); /* (cb,zH) = bL + bH */
		min_mul_karatsuba(tn, zn, al, (zn + al), bl, (tn + abl)); /* t = zL * zH */
		c = (ca & cb);
		if(ca == 1){
			mim_inc_n(ct, (tn + bl), al, (zn + al), bl, 0);
			c += ct;
		}
		if(cb == 1){
			mim_inc_n(ct, (tn + al), bl, zn, al, 0);
			c += ct;
		}
		min_mul_karatsuba(zn, an, al, bn, bl, (tn + abl)); /* zL = aL * bL */
		min_mul_karatsuba((zn + abl), (an + al), al, (bn + bl), bl, (tn + abl)); /* zH = aH * bH */
		mim_dec_n(ct, tn, abl, zn, abl, 0); /* t = t - zL */
		c -= ct;
		mim_dec_n(ct, tn, abl, (zn + abl), abl, 0); /* t = t - zH */
		c -= ct;
		mim_inc_n(ct, (zn + (abl >> 1)), (abl + (abl >> 1)), tn, abl, 0);
		c += ct;
		mim_inc_n(ct, (zn + abl + (abl >> 1)), (abl >> 1), (&c), 1, 0);
	}
}

void min_sqr_basecase(
	uni zn,
	const uni an, uni_t al
){
	uni_t i, si;

	si = (al << 1) - 1;
	zn[si] = 0; /* Upper bound protection */
	zn[0] = 0; /* Lower bound protection */
	mim_mul_1(zn[al], (zn + 1), (an + 1), (al - 1), an[0], 0);
	for(i = 1; i < (al - 1); i++){
		mim_inc_n_mul_1(zn[i + al], (zn + (i << 1) + 1), (an + i + 1), (al - i - 1), an[i], 0);
	}
	mim_inc_n(zn[si], zn, si, zn, si, 0); /* Shift left by doubling z[...]. */
	/**
	 * Below is a specialized code for squaring. :(
	 * We add a[x].a[x] to z[...]. One
	 * word at a time and by delaying the carry bit.
	 **/
	{
		uni_t si, cr;
		cr = 0;
		for(i = 0, si = 0; i < al; i++){
			km_mul_2_add_2(cr, zn[si], an[i], an[i], cr, zn[si]);
			zn[si + 1] += cr;
			cr = (zn[si + 1] < cr);
			si += 2;
		}
	}
}

void min_sqr_karatsuba(
	uni zn,
	const uni an, uni_t al,
	uni tn
){
	uni_t c, ct, a2l;

	if(al < THRESHOLD_KARATSUBA_SQR){
		if(al < THRESHOLD_SQR){
			min_mul_basecase(zn, an, al, an, al);
		}
		else{
			min_sqr_basecase(zn, an, al);
		}
	}
	else{
		a2l = al;
		al >>= 1;
		min_sqr_karatsuba(zn, an, al, (tn + a2l)); /* zL = aL * aL */
		min_sqr_karatsuba((zn + a2l), (an + al), al, (tn + a2l)); /* zH = aH * aH */
		min_mul_karatsuba(tn, an, al, (an + al), al, (tn + a2l)); /* t = aL * aH */
		mim_inc_n(c, (zn + al), (a2l + al), tn, a2l, 0);
		mim_inc_n(ct, (zn + al), (a2l + al), tn, a2l, 0);
		c += ct;
		mim_inc_n(ct, (zn + a2l + al), al, (&c), 1, 0);
	}
}

void min_div_qr(
	uni qn, uni rn,
	const uni an, uni_t al,
	const uni bn, uni_t bl,
	uni nn
){
	uni_t nph, npl, guessr, guess, tempH, tempL, gH, gL;
	uni_t i, carry, offset, num, shift, rl, nl;

	/* START normalization */
	num = bn[bl - 1];
	km_normalize_left(num, shift);
	man_shift_left(rn, an, al, shift);
	rl = al;
	if(rn[rl] != 0){
		rl++;
	}
	if((rn[rl - 1] >> (UNIT_LEN - 1)) == 1){ /* Duzelt. */
		rn[rl] = 0;
		rl++;
	}
	if(bl == 1){
		mim_q_and_r_1(qn, rn, rl, num);
		if(shift != 0){
			rn[0] >>= shift;
		}
		return;
	}
	else{
		man_shift_left(nn, bn, bl, shift);
		nl = bl;
	}
	/* END normalization */

	/* START big division */
	nph = nn[nl - 1];
	npl = nn[nl - 2];
	while(rl > nl){
		carry = 0;
		/* START quotient guess */
		if(rn[rl - 1] == nph){ /* Very rare special case */
			guess = (uni_t)(-1);
			guessr = nph + rn[rl - 2];
			if(guessr < nph){
				carry = 1;
			}
		}
		else{
			km_qr_2(guess, guessr, rn[rl - 1], rn[rl - 2], nph); /* Burada rn'nin MSB'i matematiksel olarak 1 olamiyor yani tasma olmuyor. aciklanacak. */
		}
		/* END quotient guess */

		/* START Fixing quotient guess */
		if(carry == 0){
			km_mul_2(gH, gL, guess, npl);
			if(!((gH < guessr) || ((gH == guessr) && (gL <= rn[rl - 3])))){
				guess--;
				guessr += nph;
				if(guessr >= nph){
					km_mul_2(gH, gL, guess, npl);
					if(!((gH < guessr) || ((gH == guessr) && (gL <= rn[rl - 3])))){
						guess--;
					}
				}
			}
		}
		/* END Fixing quotient guess */

		/* START mul and sub */
		carry = 0;
		i = 0;
		offset = (rl - nl - 1);
		while(i < nl){
			km_mul_2_add_c(tempH, tempL, guess, nn[i], carry);
			carry = tempH + (rn[offset] < tempL);
			rn[offset] -= tempL;
			offset++;
			i++;
		}
		if(carry > rn[offset]){ /* Very rare case; twice in 2^base cases. */
			guess--;
			rn[offset] = 0;
			offset = (rl - nl - 1);
			carry = 0;
			i = 0;
			while(i < nl){
				tempL = rn[offset] + nn[i] + carry;
				if(tempL > nn[i]){
					carry = 0;
				}
				else if (tempL < nn[i]){
					carry = 1;
				}
				rn[offset] = tempL;
				offset++;
				i++;
			}
		}
		else{
			rn[offset] -= carry;
		}
		if(qn != NULL){
			qn[rl - nl - 1] = guess;
		}
		rl--;
		/* END mul and sub */
	}
	/* END big division */
	man_shift_right(rn, rn, rl, shift);
}

static uni_t div_lehmer(uni_t aH, uni_t aL, uni_t bH, uni_t bL){
	uni_t q, sh, tH, tL;

	/*CHECK(bH != 0 || bL != 0);*/ /* b != 0, debug */
	/*CHECK((aH > bH) || (aH == bH && aL >= bL));*/ /* a > b, debug */
	/*CHECK((bH + 1) != 0);*/ /* a > b, debug */
	q = aH / (bH + 1);
	if(q != ((aH + 1) / bH)){ /* Do it in the hard way. */
		q = 0;
		while((aH > bH) || ((aH == bH) && (aL >= bL))){
			km_log_sub(sh, aH, bH);
			if(sh != 0){
				tH = (bH << sh) | (bL >> (UNIT_LEN - sh));
				tL = (bL << sh);
			}
			else{
				tH = bH;
				tL = bL;
			}
			if((tH > aH) || ((tH == aH) && (tL >= aL))){
				sh--;
				tL = (tH << (UNIT_LEN - 1)) + (tL >> 1);
				tH >>= 1;
			}
			q |= (1 << sh);
			km_sub_2(aH, aL, aH, aL, tL);
			aH -= tH;
		}
	}
	return q;
}

void min_gcdx_lehmer(
	uni dn, uni xdn, uni ydn,
	uni xn, uni_t xl, uni yn, uni_t yl,
	SIGN *signd
){
	uni_t tAH, tAL, tBH, tBL, tCH, tCL, tDH, tDL, tq0, tq1;
	uni_t i, tl, tql, dl, xdl, ydl, shift, A, B, C, D, q, t;
	uni_t txxH, txxL, tyxH, tyxL, txyH, txyL, tyyH, tyyL, crx, cry;
	uni_t uaH, uaL, vaH, vaL;
	SIGN sign = POSITIVE;

	dl = xl, xdl = 1, ydl = 1, yn[yl] = 0;
	while(!((yl == 1) && (yn[0] == 0))){
		/* Try Approximative GCD in the next version!!! */
		A = 1; B = 0; C = 0; D = 1;
		uaH = xn[xl - 1];
		km_normalize_left(uaH, shift);
		if(xl > THRESHOLD_GCD_LEHMER){ /* Extract double word. */
			if(shift != 0){
				uaH += xn[xl - 2] >> (UNIT_LEN - shift);
				uaL = (xn[xl - 2] << shift) + (xn[xl - 3] >> (UNIT_LEN - shift));
				vaH = (yn[xl - 1] << shift) + (yn[xl - 2] >> (UNIT_LEN - shift));
				vaL = (yn[xl - 2] << shift) + (yn[xl - 3] >> (UNIT_LEN - shift));
			}
			else{
				uaL = xn[xl - 2];
				vaH = yn[xl - 1];
				vaL = yn[xl - 2];
			}
			while(TRUE){
				sign = POSITIVE;
				km_sub_2(tCH, tCL, vaH, vaL, C);
				if(tCH == 0){ break; }
				km_add_2(tDH, tDL, vaH, vaL, D);
				if(tDH == 0){ break; }
				km_add_2(tAH, tAL, uaH, uaL, A);
				tq0 = div_lehmer(tAH, tAL, tCH, tCL);
				km_sub_2(tBH, tBL, uaH, uaL, B);
				tq1 = div_lehmer(tBH, tBL, tDH, tDL);
				if(tq0 != tq1){ break; }
				tq1 = (tq0 * C) + A, A = C, C = tq1;
				tq1 = (tq0 * D) + B, B = D, D = tq1;
				km_mul_2(tAH, tAL, vaL, tq0);
				tAH += (vaH * tq0);
				km_sub_2(tq1, tq0, uaH, uaL, tAL);
				tq1 -= tAH;
				uaH = vaH, uaL = vaL, vaH = tq1, vaL = tq0;
				sign = NEGATIVE;
				km_add_2(tCH, tCL, vaH, vaL, C);
				km_sub_2(tDH, tDL, vaH, vaL, D);
				if(tDH == 0){ break; }
				km_sub_2(tAH, tAL, uaH, uaL, A);
				tq0 = div_lehmer(tAH, tAL, tCH, tCL);
				km_add_2(tBH, tBL, uaH, uaL, B);
				tq1 = div_lehmer(tBH, tBL, tDH, tDL);
				if(tq0 != tq1){ break; }
				tq1 = (tq0 * C) + A, A = C, C = tq1;
				tq1 = (tq0 * D) + B, B = D, D = tq1;
				km_mul_2(tAH, tAL, vaL, tq0);
				tAH += (vaH * tq0);
				km_sub_2(tq1, tq0, uaH, uaL, tAL);
				tq1 -= tAH;
				uaH = vaH, uaL = vaL, vaH = tq1, vaL = tq0;
			}
		}
		else{
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
		}
		if(xdn != NULL){ /* For extended CGD. */
			if(sign == NEGATIVE){
				*signd = mim_sign_inv(*signd);
			}
		}
		if(B == 0){ /* Then A=1, B=0, C=0, D=1. Very rare case. */
			uni tq, tt;
			tq = (uni)kn_init_fast(); /* Think on this */
			tt = (uni)kn_init_fast(); /* Think on this */
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
			kn_free_fast((void *)tq);
			kn_free_fast((void *)tt);
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

/**
 * Finds (-x)^-1 (mod w) for montgomery multiplication.
 * w is the size of computer word.
 **/
uni_t min_find_nd(uni_t x){
	uni_t i, j, y;
	y = 1, j = 4, x = -x;
	while(j != 0){
		i = j >> 1;
		if(i < ((x * y) % j)){
			y += i;
		}
		j <<= 1;
	}
	if(i < (x * y)){
		i <<= 1;
		y += i;
	}
	return y;
}

uni_t min_find_window(uni e, uni_t i, uni_t ws){
	uni_t b, sl, sr, n, k;

	b = i / UNIT_LEN;
	sr = i - (b * UNIT_LEN) + 1;
	sl = UNIT_LEN - sr;
	n = e[b];
	n = (n << sl);
	if((b != 0) && (sl != 0)){
		k = e[b - 1];
		k >>= sr;
		n |= k;
	}
	sr = UNIT_LEN - ws;
	k = 0;
	while(k == 0){
		k = (n >> sr) & 0x1;
		sr++;
	}
	n >>= (sr - 1);
	return n;
}

uni_t min_nres_prepare(uni_t a){
	uni_t nd;
	if((a & 0x1) != 1){
		nd = 0;
	}
	else{
		nd = min_find_nd(a);
	}
	return nd;
}

void min_nres_prepare2(MI nd, MI n){
	/* To be coded in the future. */
	kn_exit("min_nres_prepare2: not implemented", 0);
}

void min_nres_redc(uni zn, uni_t zl, uni_t nd, uni nn, uni_t nl){
	uni_t i, j, overlap, m, crL, crH;

	overlap = 0;
	mam_clr(zn + zl, nl << 1);
	for(i = 0; i < nl; i++){
		m = zn[i] * nd; /* We update t with (-n[0])^-1. Dusse & Kaliski */
		crH = 0;
		for(j = 0; j < nl; j++){
			km_mul_2_add_2(crH, crL, m, nn[j], crH, zn[i + j]);
			zn[i + j] = crL;
		}
		zn[nl + i] += overlap;
		overlap = (zn[nl + i] < overlap);
		zn[nl + i] += crH;
		overlap = (zn[nl + i] < crH);
	}
	mam_clo(zn, zn + nl, nl);
	zn[nl] = overlap;
	nl += overlap; /* 14 Mart 2007 tarihinde duzelttim. HH. */
	if(man_compare(zn, nl, nn, nl) != LESS){
		mim_dec_n(i, zn, nl, nn, nl, 0);
	}
}
