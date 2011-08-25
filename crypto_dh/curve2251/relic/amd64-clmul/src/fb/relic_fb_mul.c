/*f
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
 * Implementation of the binary field multiplication functions.
 *
 * @version $Id: relic_fb_mul.c,v 1.1 2011/08/12 19:27:15 diego Exp $
 * @ingroup fb
 */

#include "relic.h"

/*============================================================================*/
/* Public definitions                                                         */
/*============================================================================*/

#if FB_MUL == INTEG || !defined(STRIP)

void fb_mul_integ(fb_t c, fb_t a, fb_t b) {
	fb_mulm_low(c, a, b);
}

#endif

void fb_mul_dig(fb_t c, fb_t a, dig_t b) {
	dv_t t;

	dv_null(t);

	TRY {
		/* We need a temporary variable so that c can be a or b. */
		dv_new(t);

		fb_mul1_low(t, a, b);

		fb_rdc1_low(c, t);
	} CATCH_ANY {
		THROW(ERR_CAUGHT);
	}
	FINALLY {
		dv_free(t);
	}
}
