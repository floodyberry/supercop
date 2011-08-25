/*
 * RELIC is an Efficient LIbrary for Cryptography
 * Copyright (C) 2007-2011 RELIC Authors
 *
 * This file is part of RELIC. RELIC is legal property of its developers,
 * whose names are not listed here. Please refer to the COPYRIGHT file
 * for contact information.
 *
 * RELIC is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * RELIC is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with RELIC. If not, see <http://www.gnu.org/licenses/>.
 */

/**
 * @file
 *
 * Implementation of point multiplication on binary elliptic curves.
 *
 * @version $Id: relic_eb_mul.c,v 1.1 2011/08/12 19:27:16 diego Exp $
 * @ingroup eb
 */

#include "string.h"
#include "relic.h"

/*============================================================================*/
/* Public definitions                                                         */
/*============================================================================*/

#if defined(EB_ORDIN) || defined(EB_KBLTZ)

#if EB_MUL == LODAH || !defined(STRIP)

void eb_mul_lodah(eb_t r, eb_t p, bn_t k) {
	int i, t;
	dv_t x1, z1, x2, z2, r1, r2, r3, r4, r5;
	dig_t *b;

	if (eb_curve_is_super()) {
		THROW(ERR_INVALID);
	}

	dv_null(x1);
	dv_null(z1);
	dv_null(x2);
	dv_null(z2);
	dv_null(r1);
	dv_null(r2);
	dv_null(r3);
	dv_null(r4);
	dv_null(r5);

	TRY {
		dv_new(x1);
		dv_new(z1);
		dv_new(x2);
		dv_new(z2);
		dv_new(r1);
		dv_new(r2);
		dv_new(r3);
		dv_new(r4);
		dv_new(r5);

		fb_copy(x1, p->x);
		fb_zero(z1);
		fb_set_bit(z1, 0, 1);
		fb_sqr(z2, p->x);
		fb_sqr(x2, z2);
		dv_zero(r5, 2 * FB_DIGS);

		b = eb_curve_get_b();

		switch (eb_curve_opt_b()) {
			case OPT_ZERO:
				break;
			case OPT_ONE:
				fb_add_dig(x2, x2, (dig_t)1);
				break;
			case OPT_DIGIT:
				fb_add_dig(x2, x2, b[0]);
				break;
			default:
				fb_add(x2, x2, b);
				break;
		}

		t = bn_bits(k);
		for (i = t - 2; i >= 0; i--) {
			fb_mulm_low(r1, x1, z2);
			fb_mulm_low(r2, x2, z1);
			fb_addn_low(r3, r1, r2);
			fb_muln_low(r4, r1, r2);
			if (bn_test_bit(k, i)) {
				fb_sqrm_low(z1, r3);
				fb_muln_low(r1, z1, p->x);
				fb_add2_low(x1, r1, r4);
				fb_sqrm_low(r1, z2);
				fb_sqrm_low(r2, x2);
				fb_mulm_low(z2, r1, r2);
				fb_sqrm_low(r1, r1);
				fb_sqrl_low(x2, r2);
				fb_mul1_low(r5, r1, b[0]);
				fb_add2_low(x2, x2, r5);
			} else {
				fb_sqrm_low(z2, r3);
				fb_muln_low(r1, z2, p->x);
				fb_add2_low(x2, r1, r4);
				fb_sqrm_low(r1, z1);
				fb_sqrm_low(r2, x1);
				fb_mulm_low(z1, r1, r2);
				fb_sqrm_low(r1, r1);
				fb_sqrl_low(x1, r2);
				fb_mul1_low(r5, r1, b[0]);
				fb_add2_low(x1, x1, r5);
			}
		}

		if (fb_is_zero(z1)) {
			/* The point q is at infinity. */
			eb_set_infty(r);
		} else {
			if (fb_is_zero(z2)) {
				fb_copy(r->x, p->x);
				fb_add(r->y, p->x, p->y);
				fb_zero(r->z);
				fb_set_bit(r->z, 0, 1);
			} else {
				fb_inv(r1, z1);
				fb_mul(r->x, x1, r1);
				return;
			}
		}
	}
	CATCH_ANY {
		THROW(ERR_CAUGHT);
	}
	FINALLY {
		dv_free(x1);
		dv_free(z1);
		dv_free(x2);
		dv_free(z2);
		dv_free(r1);
		dv_free(r2);
		dv_free(r3);
		dv_free(r4);
		dv_free(r5);
	}
}

#endif /* EB_ORDIN || EB_KBLTZ */
#endif /* EB_MUL == LODAH */
