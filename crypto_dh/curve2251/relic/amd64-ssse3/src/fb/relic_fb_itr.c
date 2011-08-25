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
 * Implementation of the iterated squaring/square-root of a binary field
 * element.
 *
 * @version $Id: relic_fb_itr.c,v 1.1 2011/08/12 19:27:17 diego Exp $
 * @ingroup fb
 */

#include "relic.h"

/*============================================================================*/
/* Public definitions                                                         */
/*============================================================================*/

void fb_itr_basic(fb_t c, fb_t a, int b) {
	int i;

	fb_copy(c, a);
	for (i = 0; i < b; i++) {
		fb_sqr(c, c);
	}
}

void fb_itr_pre_quick(fb_t *t, int b) {
	int i, j, k;
	dv_t r;

	dv_null(r);

	TRY {
		dv_new(r);

		for (i = 0; i < FB_DIGS * FB_DIGIT; i += 4) {
			for (j = 0; j < 16; j++) {
				fb_zero(r);
				fb_set_dig(r, j);
				fb_lsh(r, r, i);
				for (k = 0; k < b; k++) {
					fb_sqr(r, r);
				}

#if ALLOC == STACK || ALLOC == AUTO
				fb_copy((dig_t *)t + (4 * i + j) * FB_DIGS, r);
#else
				fb_copy(t[4 * i + j], r);
#endif
			}
		}
	} CATCH_ANY {
		THROW(ERR_CAUGHT);
	} FINALLY {
		dv_free(r);
	}
}

void fb_itr_quick(fb_t c, fb_t a, fb_t *t) {
	fb_itrn_low(c, a, (dig_t *)t);
}
