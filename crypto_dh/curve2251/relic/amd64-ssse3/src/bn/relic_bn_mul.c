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
 * Implementation of the multiple precision multiplication functions.
 *
 * @version $Id: relic_bn_mul.c,v 1.1 2011/08/12 19:27:16 diego Exp $
 * @ingroup bn
 */

#include "relic.h"

/*============================================================================*/
/* Public definitions                                                         */
/*============================================================================*/

void bn_mul_dig(bn_t c, bn_t a, dig_t b) {
	dig_t carry;

	bn_grow(c, a->used + 1);
	carry = bn_mul1_low(c->dp, a->dp, b, a->used);
	c->dp[a->used] = carry;
	c->used = a->used + 1;
	c->sign = a->sign;
	bn_trim(c);
}
