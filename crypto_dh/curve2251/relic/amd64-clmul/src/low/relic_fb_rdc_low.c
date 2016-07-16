/*
 * Copyright (C) 2011 BACKEND Authors
 *
 * This code is legal property of its developers, whose names are not
 * listed here. Please refer to the COPYRIGHT file for contact
 * information.
 *
 * This code is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This code is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this code. If not, see <http://www.gnu.org/licenses/>.
 */

/**
 * @file
 *
 * Implementation of the low-level modular reduction functions.
 *
 * @version $Id: relic_fb_rdc_low.c,v 1.1 2011/08/12 19:27:15 diego Exp $
 * @ingroup fb
 */

#include "relic.h"

/*============================================================================*/
/* Public definitions                                                         */
/*============================================================================*/

void fb_rdc1_low(dig_t *c, dig_t *a) {
	dig_t d;
	const int fa = 7;
	const int fb = 4;
	const int fc = 2;

	const int rh = FB_BITS % FB_DIGIT;
	const int sh = FB_BITS / FB_DIGIT + 1;
	const int lh = FB_DIGIT - rh;;
	const int ra = (FB_BITS - fa) % FB_DIGIT;
	const int sa = (FB_BITS - fa) / FB_DIGIT + 1;
	const int la = FB_DIGIT - ra;
	const int rb = (FB_BITS - fb) % FB_DIGIT;
	const int sb = (FB_BITS - fb) / FB_DIGIT + 1;
	const int lb = FB_DIGIT - rb;
	const int rc = (FB_BITS - fc) % FB_DIGIT;
	const int sc = (FB_BITS - fc) / FB_DIGIT + 1;
	const int lc = FB_DIGIT - rc;

	d = a[FB_DIGS];

	a[FB_DIGS - sh] ^= (d << lh);
	a[FB_DIGS - sa + 1] ^= (d >> ra);
	a[FB_DIGS - sa] ^= (d << la);

	a[FB_DIGS - sb + 1] ^= (d >> rb);
	a[FB_DIGS - sb] ^= (d << lb);
	a[FB_DIGS - sc + 1] ^= (d >> rc);
	a[FB_DIGS - sc] ^= (d << lc);

	d = a[sh - 1] >> rh;

	dig_t a0 = a[0];
	a0 ^= d;
	d <<= rh;

	a0 ^= (d >> ra);
	a0 ^= (d >> rb);
	a0 ^= (d >> rc);
	a[3] ^= d;

	c[0] = a0;
	c[1] = a[1];
	c[2] = a[2];
	c[3] = a[3];
}
