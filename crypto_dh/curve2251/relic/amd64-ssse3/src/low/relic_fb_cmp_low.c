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
 * Implementation of the low-level binary field comparison functions.
 *
 * @version $Id: relic_fb_cmp_low.c,v 1.1 2011/08/12 19:27:17 diego Exp $
 * @ingroup bn
 */

#include <gmp.h>

#include "relic.h"

/*============================================================================*/
/* Public definitions                                                         */
/*============================================================================*/

int fb_cmp1_low(dig_t a, dig_t b) {
	return mpn_cmp(&a, &b, 1);
}

int fb_cmpn_low(dig_t *a, dig_t *b) {
	return mpn_cmp(a, b, FB_DIGS);
}
