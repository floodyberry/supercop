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
 * Implementation of the low-level inversion functions.
 *
 * @version $Id: relic_fb_inv_low.c,v 1.1 2011/08/13 04:38:38 diego Exp $
 * @ingroup fb
 */

#include "relic.h"

/*============================================================================*/
/* Public definitions                                                         */
/*============================================================================*/

extern fb_st inv_tab[10][FB_TABLE];

void fb_invn_low(dig_t *c, dig_t *a) {
	int i, j, x, y, u[11];
	fb_t table[11];

	int len, *chain = fb_poly_get_chain(&len);

	u[0] = 1;
	u[1] = 2;
	fb_copy(table[0], a);
	fb_sqr(table[1], table[0]);
	fb_mul(table[1], table[1], table[0]);

	u[2] = u[1] + u[0];
	fb_sqr(table[2], table[1]);
	fb_mul(table[2], table[2], table[0]);

	u[3] = u[2] + u[1];
	fb_sqr(table[3], table[2]);
	for (j = 1; j < u[1]; j++) {
		fb_sqr(table[3], table[3]);
	}
	fb_mul(table[3], table[3], table[1]);

	u[4] = 2 * u[3];
	fb_sqr(table[4], table[3]);
	for (j = 1; j < u[3]; j++) {
		fb_sqr(table[4], table[4]);
	}
	fb_mul(table[4], table[4], table[3]);

	u[5] = u[4] + u[3];
	fb_sqr(table[5], table[4]);
	for (j = 1; j < u[3]; j++) {
		fb_sqr(table[5], table[5]);
	}
	fb_mul(table[5], table[5], table[3]);

	u[6] = u[5] + u[4];
	fb_itr(table[6], table[5], u[4], inv_tab[4]);
	fb_mul(table[6], table[6], table[4]);

	u[7] = 2 * u[6];
	fb_itr(table[7], table[6], u[6], inv_tab[6]);
	fb_mul(table[7], table[7], table[6]);

	u[8] = u[7] + u[6];
	fb_itr(table[8], table[7], u[6], inv_tab[6]);
	fb_mul(table[8], table[8], table[6]);

	u[9] = u[8] + u[7];
	fb_itr(table[9], table[8], u[8], inv_tab[7]);
	fb_mul(table[9], table[9], table[7]);

	u[10] = 2 * u[9];
	fb_itr(table[10], table[9], u[9], inv_tab[9]);
	fb_mul(table[10], table[10], table[9]);

	fb_sqr(c, table[10]);
}
