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
 * Implementation of binary field inversion functions.
 *
 * @version $Id: relic_fb_inv.c,v 1.1 2011/08/12 19:27:15 diego Exp $
 * @ingroup fb
 */

#include "relic.h"

/*============================================================================*/
/* Public definitions                                                         */
/*============================================================================*/

#if FB_INV == LOWER || !defined(STRIP)

void fb_inv_lower(fb_t c, fb_t a) {
	fb_invn_low(c, a);
}
#endif

void fb_inv_sim(fb_t *c, fb_t *a, int n) {
	int i;
	fb_t u, t[n];

	for (i = 0; i < n; i++) {
		fb_null(t[i]);
	}
	fb_null(u);

	TRY {
		for (i = 0; i < n; i++) {
			fb_new(t[i]);
		}
		fb_new(u);

		fb_copy(c[0], a[0]);
		fb_copy(t[0], a[0]);

		for (i = 1; i < n; i++) {
			fb_copy(t[i], a[i]);
			fb_mul(c[i], c[i - 1], a[i]);
		}

		fb_inv(u, c[n - 1]);

		for (i = n - 1; i > 0; i--) {
			fb_mul(c[i], u, c[i - 1]);
			fb_mul(u, u, t[i]);
		}
		fb_copy(c[0], u);
	}
	CATCH_ANY {
		THROW(ERR_CAUGHT);
	}
	FINALLY {
		for (i = 0; i < n; i++) {
			fb_free(t[i]);
		}
		fb_free(u);
	}
}
