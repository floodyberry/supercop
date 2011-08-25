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
 * Implementation of point doubling on binary elliptic curves.
 *
 * @version $Id: relic_eb_dbl.c,v 1.1 2011/08/12 19:27:16 diego Exp $
 * @ingroup eb
 */

#include "relic.h"

/*============================================================================*/
/* Private definitions                                                        */
/*============================================================================*/

#if EB_ADD == PROJC || !defined(STRIP)

#if defined(EB_ORDIN) || defined(EB_KBLTZ)
/**
 * Doubles a point represented in projective coordinates on an ordinary binary
 * elliptic curve.
 *
 * @param r					- the result.
 * @param p					- the point to double.
 */
static void eb_dbl_projc_ordin(eb_t r, eb_t p) {
	fb_t t0, t1;

	fb_null(t0);
	fb_null(t1);

	TRY {
		fb_new(t0);
		fb_new(t1);

		/* t0 = B = x1^2. */
		fb_sqr(t0, p->x);
		/* C = B + y1. */
		fb_add(r->y, t0, p->y);

		if (!p->norm) {
			/* A = x1 * z1. */
			fb_mul(t1, p->x, p->z);
			/* z3 = A^2. */
			fb_sqr(r->z, t1);
		} else {
			/* if z1 = 1, A = x1. */
			fb_copy(t1, p->x);
			/* if z1 = 1, z3 = x1^2. */
			fb_copy(r->z, t0);
		}

		/* t1 = D = A * C. */
		fb_mul(t1, t1, r->y);

		/* C^2 + D. */
		fb_sqr(r->y, r->y);
		fb_add(r->x, t1, r->y);

		/* C^2 + D + a2 * z3. */
		switch (eb_curve_opt_a()) {
			case OPT_ZERO:
				break;
			case OPT_ONE:
				fb_add(r->x, r->z, r->x);
				break;
			case OPT_DIGIT:
				fb_mul_dig(r->y, r->z, eb_curve_get_a()[0]);
				fb_add(r->x, r->y, r->x);
				break;
			default:
				fb_mul(r->y, r->z, eb_curve_get_a());
				fb_add(r->x, r->y, r->x);
				break;
		}

		/* t1 = (D + z3). */
		fb_add(t1, t1, r->z);
		/* t0 = B^2. */
		fb_sqr(t0, t0);
		/* t0 = B^2 * z3. */
		fb_mul(t0, t0, r->z);
		/* y3 = (D + z3) * r3 + B^2 * z3. */
		fb_mul(r->y, t1, r->x);
		fb_add(r->y, r->y, t0);

		r->norm = 0;
	}
	CATCH_ANY {
		THROW(ERR_CAUGHT);
	}
	FINALLY {
		fb_free(t0);
		fb_free(t1);
	}
}
#endif /* EB_ORDIN || EB_KBLTZ */

#endif /* EB_ADD == PROJC */

/*============================================================================*/
/* Public definitions                                                         */
/*============================================================================*/

#if EB_ADD == PROJC || !defined(STRIP)

void eb_dbl_projc(eb_t r, eb_t p) {

	if (eb_is_infty(p)) {
		eb_set_infty(r);
		return;
	}

#if defined(EB_ORDIN) || defined(EB_KBLTZ)
	eb_dbl_projc_ordin(r, p);
#endif
}

#endif
