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
 * Implementation of point addition on binary elliptic curves.
 *
 * @version $Id: relic_eb_add.c,v 1.1 2011/08/12 19:27:16 diego Exp $
 * @ingroup eb
 */

#include "relic.h"

/*============================================================================*/
/* Private definitions                                                        */
/*============================================================================*/

#if EB_ADD == PROJC || !defined(STRIP)

#if defined(EB_ORDIN) || defined(EB_KBLTZ)

#if defined(EB_MIXED) || !defined(STRIP)

/**
 * Adds a point represented in affine coordinates to a point represented in
 * projective coordinates.
 *
 * @param r					- the result.
 * @param p					- the affine point.
 * @param q					- the projective point.
 */
static void eb_add_projc_ordin_mix(eb_t r, eb_t p, eb_t q) {
	fb_t t0, t1, t2, t3, t4, t5;

	fb_null(t0);
	fb_null(t1);
	fb_null(t2);
	fb_null(t3);
	fb_null(t4);
	fb_null(t5);

	TRY {
		fb_new(t0);
		fb_new(t1);
		fb_new(t2);
		fb_new(t3);
		fb_new(t4);
		fb_new(t5);

		if (!p->norm) {
			/* A = y1 + y2 * z1^2. */
			fb_sqr(t0, p->z);
			fb_mul(t0, t0, q->y);
			fb_add(t0, t0, p->y);
			/* B = x1 + x2 * z1. */
			fb_mul(t1, p->z, q->x);
			fb_add(t1, t1, p->x);
		} else {
			/* t0 = A = y1 + y2. */
			fb_add(t0, p->y, q->y);
			/* t1 = B = x1 + x2. */
			fb_add(t1, p->x, q->x);
		}

		if (fb_is_zero(t1)) {
			if (fb_is_zero(t0)) {
				/* If t0 = 0 and t1 = 0, p = q, should have doubled! */
				eb_dbl_projc(r, p);
			} else {
				/* If t0 = 0, r is infinity. */
				eb_set_infty(r);
			}
		} else {
			if (!p->norm) {
				/* t2 = C = B * z1. */
				fb_mul(t2, p->z, t1);
				/* z3 = C^2. */
				fb_sqr(r->z, t2);
				/* t1 = B^2. */
				fb_sqr(t1, t1);
				/* t1 = A + B^2. */
				fb_add(t1, t0, t1);
			} else {
				/* If z1 = 0, t2 = C = B. */
				fb_copy(t2, t1);
				/* z3 = B^2. */
				fb_sqr(r->z, t1);
				/* t1 = A + z3. */
				fb_add(t1, t0, r->z);
			}

			/* t3 = D = x2 * z3. */
			fb_mul(t3, r->z, q->x);

			/* t4 = (y2 + x2). */
			fb_add(t4, q->x, q->y);

			/* z3 = A^2. */
			fb_sqr(r->x, t0);

			/* t1 = A + B^2 + a2 * C. */
			switch (eb_curve_opt_a()) {
				case OPT_ZERO:
					break;
				case OPT_ONE:
					fb_add(t1, t1, t2);
					break;
				case OPT_DIGIT:
					/* t5 = a2 * C. */
					fb_mul_dig(t5, t2, eb_curve_get_a()[0]);
					fb_add(t1, t1, t5);
					break;
				default:
					/* t5 = a2 * C. */
					fb_mul(t5, eb_curve_get_a(), t2);
					fb_add(t1, t1, t5);
					break;
			}

			/* t1 = C * (A + B^2 + a2 * C). */
			fb_mul(t1, t1, t2);
			/* x3 = A^2 + C * (A + B^2 + a2 * C). */
			fb_add(r->x, r->x, t1);

			/* t3 = D + x3. */
			fb_add(t3, t3, r->x);
			/* t2 = A * B. */
			fb_mul(t2, t0, t2);
			/* y3 = (D + x3) * (A * B + z3). */
			fb_add(r->y, t2, r->z);
			fb_mul(r->y, r->y, t3);
			/* t0 = z3^2. */
			fb_sqr(t0, r->z);
			/* t0 = (y2 + x2) * z3^2. */
			fb_mul(t0, t0, t4);
			/* y3 = (D + x3) * (A * B + z3) + (y2 + x2) * z3^2. */
			fb_add(r->y, r->y, t0);
		}

		r->norm = 0;
	}
	CATCH_ANY {
		THROW(ERR_CAUGHT);
	}
	FINALLY {
		fb_free(t0);
		fb_free(t1);
		fb_free(t2);
		fb_free(t3);
		fb_free(t4);
		fb_free(t5);
	}
}

#endif /* EB_MIXED */

/**
 * Adds two points represented in projective coordinates on an ordinary binary
 * elliptic curve.
 *
 * @param r					- the result.
 * @param p					- the first point to add.
 * @param q					- the second point to add.
 */
static void eb_add_projc_ordin(eb_t r, eb_t p, eb_t q) {
#if defined(EB_MIXED) && defined(STRIP)
	eb_add_projc_ordin_mix(r, p, q);
#else /* General addition. */
	fb_t t0, t1, t2, t3, t4, t5, t6, t7;

	fb_null(t0);
	fb_null(t1);
	fb_null(t2);
	fb_null(t3);
	fb_null(t4);
	fb_null(t5);
	fb_null(t6);
	fb_null(t7);

	TRY {
		fb_new(t0);
		fb_new(t1);
		fb_new(t2);
		fb_new(t3);
		fb_new(t4);
		fb_new(t5);
		fb_new(t6);
		fb_new(t7);

		if (q->norm) {
			eb_add_projc_ordin_mix(r, p, q);
		} else {
			/* t0 = B = x2 * z1. */
			fb_mul(t0, q->x, p->z);

			/* A = x1 * z2 */
			fb_mul(t1, p->x, q->z);

			/* t2 = E = A + B. */
			fb_add(t2, t1, t0);

			/* t3 = D = B^2. */
			fb_sqr(t3, t0);
			/* t4 = C = A^2. */
			fb_sqr(t4, t1);
			/* t5 = F = C + D. */
			fb_add(t5, t3, t4);

			/* t6 = H = y2 * z1^2. */
			fb_sqr(t6, p->z);
			fb_mul(t6, t6, q->y);

			/* t7 = G = y1 * z2^2. */
			fb_sqr(t7, q->z);
			fb_mul(t7, t7, p->y);

			/* t3 = D + H. */
			fb_add(t3, t3, t6);
			/* t4 = C + G. */
			fb_add(t4, t4, t7);
			/* t6 = I = G + H. */
			fb_add(t6, t7, t6);

			/* If E is zero. */
			if (fb_is_zero(t2)) {
				if (fb_is_zero(t6)) {
					/* If I is zero, p = q, should have doubled. */
					eb_dbl_projc(r, p);
				} else {
					/* If I is not zero, q = -p, r = infinity. */
					eb_set_infty(r);
				}
			} else {
				/* t6 = J = I * E. */
				fb_mul(t6, t6, t2);

				/* z3 = F * z1 * z2. */
				fb_mul(r->z, p->z, q->z);
				fb_mul(r->z, t5, r->z);

				/* t4 = B * (C + G). */
				fb_mul(t4, t0, t4);
				/* t2 = A * J. */
				fb_mul(t2, t1, t6);
				/* x3 = A * (D + H) + B * (C + G). */
				fb_mul(r->x, t1, t3);
				fb_add(r->x, r->x, t4);

				/* t7 = F * G. */
				fb_mul(t7, t7, t5);
				/* Y3 = (A * J + F * G) * F + (J + z3) * x3. */
				fb_add(r->y, t2, t7);
				fb_mul(r->y, r->y, t5);
				/* t7 = (J + z3) * x3. */
				fb_add(t7, t6, r->z);
				fb_mul(t7, t7, r->x);
				fb_add(r->y, r->y, t7);
			}
		}

		r->norm = 0;
	}
	CATCH_ANY {
		THROW(ERR_CAUGHT);
	}
	FINALLY {
		fb_free(t0);
		fb_free(t1);
		fb_free(t2);
		fb_free(t3);
		fb_free(t4);
		fb_free(t5);
		fb_free(t6);
		fb_free(t7);
	}
#endif
}

#endif /* EB_ORDIN || EB_KBLTZ */

#endif /* EB_ADD == PROJC */

/*============================================================================*/
	/* Public definitions                                                         */
/*============================================================================*/

#if EB_ADD == PROJC || !defined(STRIP)

void eb_add_projc(eb_t r, eb_t p, eb_t q) {
	if (eb_is_infty(p)) {
		eb_copy(r, q);
		return;
	}

	if (eb_is_infty(q)) {
		eb_copy(r, p);
		return;
	}

#if defined(EB_ORDIN) || defined(EB_KBLTZ)
	eb_add_projc_ordin(r, p, q);
#endif
}

#endif
