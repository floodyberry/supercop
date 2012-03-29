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
 * Implementation of the multiple precision utilities.
 *
 * @version $Id: relic_bn_util.c,v 1.1 2011/08/12 19:27:16 diego Exp $
 * @ingroup bn
 */

#include <string.h>
#include <ctype.h>

#include "relic.h"

/*============================================================================*/
/* Public definitions                                                         */
/*============================================================================*/

void bn_copy(bn_t c, bn_t a) {
	int i;

	if (c->dp == a->dp)
		return;

	bn_grow(c, a->used);

	for (i = 0; i < a->used; i++) {
		c->dp[i] = a->dp[i];
	}

	c->used = a->used;
	c->sign = a->sign;
}

void bn_abs(bn_t c, bn_t a) {
	if (c->dp != a->dp) {
		bn_copy(c, a);
	}
	c->sign = BN_POS;
}

void bn_neg(bn_t c, bn_t a) {
	if (c->dp != a->dp) {
		bn_copy(c, a);
	}
	if (!bn_is_zero(c)) {
		c->sign = a->sign ^ 1;
	}
}

int bn_sign(bn_t a) {
	return a->sign;
}

void bn_zero(bn_t a) {
	int i;
	dig_t *tmp;

	a->sign = BN_POS;
	a->used = 1;
	tmp = a->dp;
	for (i = 0; i < a->alloc; i++, tmp++)
		*tmp = 0;
}

int bn_is_zero(bn_t a) {
	if (a->used == 0) {
		return 1;
	}
	if ((a->used == 1) && (a->dp[0] == 0)) {
		return 1;
	}
	return 0;
}

int bn_is_even(bn_t a) {
	if (bn_is_zero(a)) {
		return 1;
	}
	if ((a->dp[0] & 0x01) == 0) {
		return 1;
	}
	return 0;
}

int bn_bits(bn_t a) {
	int bits;

	if (a->used == 0) {
		return 0;
	}

	/* Bits in lower digits. */
	bits = (a->used - 1) * BN_DIGIT;

	return bits + util_bits_dig(a->dp[a->used - 1]);
}

int bn_test_bit(bn_t a, int bit) {
	int d;
	dig_t mask;

	SPLIT(bit, d, bit, BN_DIG_LOG);

	mask = ((dig_t)1) << bit;
	return (a->dp[d] & mask) != 0;
}

int bn_get_bit(bn_t a, int bit) {
	int d;

	SPLIT(bit, d, bit, BN_DIG_LOG);

	return ((a->dp[d] & ((dig_t)1 << bit)) >> bit);
}

void bn_set_bit(bn_t a, int bit, int value) {
	int d;

	SPLIT(bit, d, bit, BN_DIG_LOG);

	if (value == 1) {
		a->dp[d] |= ((dig_t)1 << bit);
		if ((d + 1) > a->used) {
			a->used = d + 1;
		}
	} else {
		a->dp[d] &= ~((dig_t)1 << bit);
		bn_trim(a);
	}
}

int bn_ham(bn_t a) {
	int i, c = 0;

	for (i = 0; i < bn_bits(a); i++) {
		if (bn_test_bit(a, i)) {
			c++;
		}
	}

	return c;
}

void bn_get_dig(dig_t *c, bn_t a) {
	*c = a->dp[0];
}

void bn_set_dig(bn_t a, dig_t digit) {
	bn_zero(a);
	a->dp[0] = digit;
	a->used = 1;
	a->sign = BN_POS;
}

void bn_set_2b(bn_t a, int b) {
	int i, d;

	SPLIT(b, d, b, BN_DIG_LOG);

	bn_grow(a, d + 1);
	for (i = 0; i < d; i++)
		a->dp[i] = 0;
	a->used = d + 1;
	a->dp[d] = ((dig_t)1 << b);
	a->sign = BN_POS;
}

void bn_rand(bn_t a, int sign, int bits) {
	int digits;

	SPLIT(bits, digits, bits, BN_DIG_LOG);
	digits += (bits > 0 ? 1 : 0);

	bn_grow(a, digits);

	rand_bytes((unsigned char *)a->dp, digits * sizeof(dig_t));
	a->used = digits;
	a->sign = sign;
	if (bits > 0) {
		dig_t mask = ((dig_t)1 << (dig_t)bits) - 1;
		a->dp[a->used - 1] &= mask;
	}
	bn_trim(a);
}

void bn_print(bn_t a) {
	int i;

	if (a->sign == BN_NEG) {
		util_print("-");
	}
	if (a->used == 0) {
		util_print("0\n");
	} else {
		util_print("%lX", (unsigned long int)a->dp[a->used - 1]);
		for (i = a->used - 2; i >= 0; i--) {
			util_print("%.*lX", (int)(2 * sizeof(dig_t)),
					(unsigned long int)a->dp[i]);
		}
		util_print("\n");
	}
}

void bn_size_bin(int *size, bn_t a) {
	dig_t d;
	int digits;

	digits = (a->used - 1) * sizeof(dig_t);
	d = a->dp[a->used - 1];

	while (d != 0) {
		d = d >> 8;
		digits++;
	}
	*size = digits;
}

void bn_read_bin(bn_t a, unsigned char *bin, int len) {
	int i, j;
	dig_t d;
	int digs = (len % sizeof(dig_t) ==
			0 ? len / sizeof(dig_t) : len / sizeof(dig_t) + 1);

	bn_grow(a, digs);
	bn_zero(a);
	a->used = digs;

	for (i = 0; i < digs - 1; i++) {
		d = 0;
		for (j = sizeof(dig_t) - 1; j >= 0; j--) {
			d = d << 8;
			d |= bin[len - 1 - (i * sizeof(dig_t) + j)];
		}
		a->dp[i] = d;
	}
	d = 0;
	for (j = sizeof(dig_t) - 1; j >= 0; j--) {
		if ((int)(i * sizeof(dig_t) + j) < len) {
			d = d << 8;
			d |= bin[len - 1 - (i * sizeof(dig_t) + j)];
		}
	}
	a->dp[i] = d;

	a->sign = BN_POS;
	bn_trim(a);
}

void bn_write_bin(unsigned char *bin, int len, bn_t a) {
	int size, i, j, k;
	dig_t d;

	bn_size_bin(&size, a);

	if (len < size) {
		THROW(ERR_NO_BUFFER);
	}

	k = 0;
	for (i = 0; i < a->used - 1; i++) {
		d = a->dp[i];
		for (j = 0; j < (int)sizeof(dig_t); j++) {
			bin[len - 1 - k++] = d & 0xFF;
			d = d >> 8;
		}
	}

	d = a->dp[a->used - 1];
	while (d != 0) {
		bin[len - 1 - k++] = d & 0xFF;
		d = d >> 8;
	}

	while (k < len) {
		bin[len - 1 - k++] = 0;
	}
}

void bn_size_raw(int *size, bn_t a) {
	*size = a->used;
}

void bn_read_raw(bn_t a, dig_t *raw, int len) {
	int i;

	bn_grow(a, len);
	bn_zero(a);

	for (i = len - 1; i >= 0; i--) {
		bn_lsh(a, a, BN_DIGIT);
		bn_add_dig(a, a, raw[i]);
	}
	a->sign = BN_POS;
}

void bn_write_raw(dig_t *raw, int len, bn_t a) {
	int i, size;

	size = a->used;

	if (len < size) {
		THROW(ERR_INVALID);
	}

	for (i = 0; i < size; i++) {
		raw[i] = a->dp[i];
	}
	for (; i < len; i++) {
		raw[i] = 0;
	}
}
