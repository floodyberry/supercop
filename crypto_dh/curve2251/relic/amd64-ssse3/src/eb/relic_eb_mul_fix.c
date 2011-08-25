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
 * Implementation of fixed point multiplication on binary elliptic curves.
 *
 * @version $Id: relic_eb_mul_fix.c,v 1.1 2011/08/12 19:27:16 diego Exp $
 * @ingroup eb
 */

#include "relic.h"

/*============================================================================*/
/* Public definitions                                                         */
/*============================================================================*/

#if EB_FIX == COMBS || !defined(STRIP)

void eb_mul_pre_combs(eb_t *t, eb_t p) {
	int i, j, l;
	bn_t ord;

	bn_null(ord);

	TRY {
		bn_new(ord);

		eb_curve_get_ord(ord);
		l = bn_bits(ord);
		l = ((l % EB_DEPTH) == 0 ? (l / EB_DEPTH) : (l / EB_DEPTH) + 1);

		eb_set_infty(t[0]);

		eb_copy(t[1], p);
		for (j = 1; j < EB_DEPTH; j++) {
			eb_dbl(t[1 << j], t[1 << (j - 1)]);
			for (i = 1; i < l; i++) {
				eb_dbl(t[1 << j], t[1 << j]);
			}
			for (i = 1; i < (1 << j); i++) {
				eb_add(t[(1 << j) + i], t[1 << j], t[i]);
			}
		}

		eb_norm_sim(t + 2, t + 2, EB_TABLE_COMBS - 2);
	}
	CATCH_ANY {
		THROW(ERR_CAUGHT);
	}
	FINALLY {
		bn_free(ord);
	}
}

void eb_mul_fix_combs(eb_t r, eb_t *t, bn_t k) {
	int i, j, l, w, n, p0, p1;
	bn_t ord;

	bn_null(ord);

	TRY {
		bn_new(ord);

		eb_curve_get_ord(ord);
		l = bn_bits(ord);
		l = ((l % EB_DEPTH) == 0 ? (l / EB_DEPTH) : (l / EB_DEPTH) + 1);

		n = bn_bits(k);

		p0 = (EB_DEPTH) * l - 1;

		w = 0;
		p1 = p0--;
		for (j = EB_DEPTH - 1; j >= 0; j--, p1 -= l) {
			w = w << 1;
			if (p1 < n && bn_test_bit(k, p1)) {
				w = w | 1;
			}
		}
		eb_copy(r, t[w]);

		for (i = l - 2; i >= 0; i--) {
			eb_dbl(r, r);

			w = 0;
			p1 = p0--;
			for (j = EB_DEPTH - 1; j >= 0; j--, p1 -= l) {
				w = w << 1;
				if (p1 < n && bn_test_bit(k, p1)) {
					w = w | 1;
				}
			}
			if (w > 0) {
				eb_add(r, r, t[w]);
			}
		}
		eb_norm(r, r);
	}
	CATCH_ANY {
		THROW(ERR_CAUGHT);
	}
	FINALLY {
		bn_free(ord);
	}
}

#endif

#if EB_FIX == COMBD || !defined(STRIP)

void eb_mul_pre_combd(eb_t *t, eb_t p) {
	bn_t n;

	bn_null(n);

	TRY {
		int i, j, d, e;
		bn_new(n);

		eb_curve_get_ord(n);
		d = bn_bits(n);
		d = ((d % EB_DEPTH) == 0 ? (d / EB_DEPTH) : (d / EB_DEPTH) + 1);
		e = (d % 2 == 0 ? (d / 2) : (d / 2) + 1);

		eb_set_infty(t[0]);
		eb_copy(t[1], p);
		for (j = 1; j < EB_DEPTH; j++) {
			eb_dbl(t[1 << j], t[1 << (j - 1)]);
			for (i = 1; i < d; i++) {
				eb_dbl(t[1 << j], t[1 << j]);
			}
			for (i = 1; i < (1 << j); i++) {
				eb_add(t[(1 << j) + i], t[1 << j], t[i]);
			}
		}
		eb_set_infty(t[1 << EB_DEPTH]);
		for (j = 1; j < (1 << EB_DEPTH); j++) {
			eb_dbl(t[(1 << EB_DEPTH) + j], t[j]);
			for (i = 1; i < e; i++) {
				eb_dbl(t[(1 << EB_DEPTH) + j], t[(1 << EB_DEPTH) + j]);
			}
		}

		eb_norm_sim(t + 2, t + 2, (1 << EB_DEPTH) - 2);
		eb_norm_sim(t + (1 << EB_DEPTH) + 1, t + (1 << EB_DEPTH) + 1, (1 << EB_DEPTH) - 1);
	}
	CATCH_ANY {
		THROW(ERR_CAUGHT);
	}
	FINALLY {
		bn_free(n);
	}
}

void eb_mul_fix_combd(eb_t r, eb_t *t, bn_t k) {
	int i, j, d, e, w0, w1, n0, p0, p1;
	bn_t n;

	bn_null(n);

	TRY {
		bn_new(n);

		eb_curve_get_ord(n);

		d = bn_bits(n);
		d = ((d % EB_DEPTH) == 0 ? (d / EB_DEPTH) : (d / EB_DEPTH) + 1);
		e = (d % 2 == 0 ? (d / 2) : (d / 2) + 1);

		eb_set_infty(r);
		n0 = bn_bits(k);

		p1 = (e - 1) + (EB_DEPTH - 1) * d;
		for (i = e - 1; i >= 0; i--) {
			eb_dbl(r, r);

			w0 = 0;
			p0 = p1;
			for (j = EB_DEPTH - 1; j >= 0; j--, p0 -= d) {
				w0 = w0 << 1;
				if (p0 < n0 && bn_test_bit(k, p0)) {
					w0 = w0 | 1;
				}
			}

			w1 = 0;
			p0 = p1-- + e;
			for (j = EB_DEPTH - 1; j >= 0; j--, p0 -= d) {
				w1 = w1 << 1;
				if (i + e < d && p0 < n0 && bn_test_bit(k, p0)) {
					w1 = w1 | 1;
				}
			}

			eb_add(r, r, t[w0]);
			eb_add(r, r, t[(1 << EB_DEPTH) + w1]);
		}
		eb_norm(r, r);
	}
	CATCH_ANY {
		THROW(ERR_CAUGHT);
	}
	FINALLY {
		bn_free(n);
	}
}

#endif
