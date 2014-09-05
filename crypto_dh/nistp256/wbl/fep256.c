/* crypto/ec/ecp_nistp256.c */
/* Modified by Watson Ladd */
/*
 * Written by Adam Langley (Google) for the OpenSSL project
 */
/* Copyright 2011 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

/*
 * A 64-bit implementation of the NIST P-256 elliptic curve point multiplication
 *
 * OpenSSL integration was taken from Emilia Kasper's work in ecp_nistp224.c.
 * Otherwise based on Emilia's P224 work, which was inspired by my curve25519
 * work which got its smarts from Daniel J. Bernstein's work on the same.
 */
#include <stdint.h>
#include "fep256.h"
typedef __int128_t int128_t;
typedef uint8_t u8;
typedef uint32_t u32;
typedef uint64_t u64;
typedef int64_t s64;

/* The underlying field.
 *
 * P256 operates over GF(2^256-2^224+2^192+2^96-1). We can serialise an element
 * of this field into 32 bytes. We call this an felem_bytearray. */

typedef u8 felem_bytearray[32];

/* These are the parameters of P256, taken from FIPS 186-3, page 86. These
 * values are big-endian. */
static const felem_bytearray nistp256_curve_params[5] = {
	{0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x01,       /* p */
	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
	 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
	{0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x01,       /* a = -3 */
	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
	 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfc},      /* b */
	{0x5a, 0xc6, 0x35, 0xd8, 0xaa, 0x3a, 0x93, 0xe7,
	 0xb3, 0xeb, 0xbd, 0x55, 0x76, 0x98, 0x86, 0xbc,
	 0x65, 0x1d, 0x06, 0xb0, 0xcc, 0x53, 0xb0, 0xf6,
	 0x3b, 0xce, 0x3c, 0x3e, 0x27, 0xd2, 0x60, 0x4b},
	{0x6b, 0x17, 0xd1, 0xf2, 0xe1, 0x2c, 0x42, 0x47,       /* x */
	 0xf8, 0xbc, 0xe6, 0xe5, 0x63, 0xa4, 0x40, 0xf2,
	 0x77, 0x03, 0x7d, 0x81, 0x2d, 0xeb, 0x33, 0xa0,
	 0xf4, 0xa1, 0x39, 0x45, 0xd8, 0x98, 0xc2, 0x96},
	{0x4f, 0xe3, 0x42, 0xe2, 0xfe, 0x1a, 0x7f, 0x9b,       /* y */
	 0x8e, 0xe7, 0xeb, 0x4a, 0x7c, 0x0f, 0x9e, 0x16,
	 0x2b, 0xce, 0x33, 0x57, 0x6b, 0x31, 0x5e, 0xce,
	 0xcb, 0xb6, 0x40, 0x68, 0x37, 0xbf, 0x51, 0xf5}
};

/* The representation of field elements.
 * ------------------------------------
 *
 * We represent field elements with either four 128-bit values, eight 128-bit
 * values, or four 64-bit values. The field element represented is:
 *   v[0]*2^0 + v[1]*2^64 + v[2]*2^128 + v[3]*2^192  (mod p)
 * or:
 *   v[0]*2^0 + v[1]*2^64 + v[2]*2^128 + ... + v[8]*2^512  (mod p)
 *
 * 128-bit values are called 'limbs'. Since the limbs are spaced only 64 bits
 * apart, but are 128-bits wide, the most significant bits of each limb overlap
 * with the least significant bits of the next.
 *
 * A field element with four limbs is an 'felem'. One with eight limbs is a
 * 'longfelem'
 *
 * A field element with four, 64-bit values is called a 'smallfelem'. Small
 * values are used as intermediate values before multiplication.
 */

#define NLIMBS 4

typedef uint128_t limb;
typedef limb felem[NLIMBS];
typedef limb longfelem[NLIMBS * 2];
typedef u64 smallfelem[NLIMBS];

/* This is the value of the prime as four 64-bit words, little-endian. */
static const u64 kPrime[4] = { 0xfffffffffffffffful, 0xffffffff, 0, 0xffffffff00000001ul };
static const limb bottom32bits = 0xffffffff;
static const u64 bottom63bits = 0x7ffffffffffffffful;

/* bin32_to_felem takes a little-endian byte array and converts it into felem
 * form. This assumes that the CPU is little-endian. */
static void bin32_to_felem(felem out, const u8 in[32])
	{
	out[0] = *((u64*) &in[0]);
	out[1] = *((u64*) &in[8]);
	out[2] = *((u64*) &in[16]);
	out[3] = *((u64*) &in[24]);
	}

/* smallfelem_to_bin32 takes a smallfelem and serialises into a little endian,
 * 32 byte array. This assumes that the CPU is little-endian. */
static void smallfelem_to_bin32(u8 out[32], const smallfelem in)
	{
	*((u64*) &out[0]) = in[0];
	*((u64*) &out[8]) = in[1];
	*((u64*) &out[16]) = in[2];
	*((u64*) &out[24]) = in[3];
	}


/* Field operations
 * ---------------- */

static void smallfelem_one(smallfelem out)
	{
	out[0] = 1;
	out[1] = 0;
	out[2] = 0;
	out[3] = 0;
	}

static void smallfelem_assign(smallfelem out, const smallfelem in)
	{
	out[0] = in[0];
	out[1] = in[1];
	out[2] = in[2];
	out[3] = in[3];
	}

static void felem_assign(felem out, const felem in)
	{
	out[0] = in[0];
	out[1] = in[1];
	out[2] = in[2];
	out[3] = in[3];
	}

/* felem_sum sets out = out + in. */
static void felem_sum(felem out, const felem in)
	{
	out[0] += in[0];
	out[1] += in[1];
	out[2] += in[2];
	out[3] += in[3];
	}

/* felem_small_sum sets out = out + in. */
static void felem_small_sum(felem out, const smallfelem in)
	{
	out[0] += in[0];
	out[1] += in[1];
	out[2] += in[2];
	out[3] += in[3];
	}

/* felem_scalar sets out = out * scalar */
static void felem_scalar(felem out, const u64 scalar)
	{
	out[0] *= scalar;
	out[1] *= scalar;
	out[2] *= scalar;
	out[3] *= scalar;
	}

/* longfelem_scalar sets out = out * scalar */
static void longfelem_scalar(longfelem out, const u64 scalar)
	{
	out[0] *= scalar;
	out[1] *= scalar;
	out[2] *= scalar;
	out[3] *= scalar;
	out[4] *= scalar;
	out[5] *= scalar;
	out[6] *= scalar;
	out[7] *= scalar;
	}

#define two105m41m9 (((limb)1) << 105) - (((limb)1) << 41) - (((limb)1) << 9)
#define two105 (((limb)1) << 105)
#define two105m41p9 (((limb)1) << 105) - (((limb)1) << 41) + (((limb)1) << 9)

/* zero105 is 0 mod p */
static const felem zero105 = { two105m41m9, two105, two105m41p9, two105m41p9 };

/* smallfelem_neg sets |out| to |-small|
 * On exit:
 *   out[i] < out[i] + 2^105
 */
static void smallfelem_neg(felem out, const smallfelem small)
	{
	/* In order to prevent underflow, we subtract from 0 mod p. */
	out[0] = zero105[0] - small[0];
	out[1] = zero105[1] - small[1];
	out[2] = zero105[2] - small[2];
	out[3] = zero105[3] - small[3];
	}

/* felem_diff subtracts |in| from |out|
 * On entry:
 *   in[i] < 2^104
 * On exit:
 *   out[i] < out[i] + 2^105
 */
static void felem_diff(felem out, const felem in)
	{
	/* In order to prevent underflow, we add 0 mod p before subtracting. */
	out[0] += zero105[0];
	out[1] += zero105[1];
	out[2] += zero105[2];
	out[3] += zero105[3];

	out[0] -= in[0];
	out[1] -= in[1];
	out[2] -= in[2];
	out[3] -= in[3];
	}

#define two107m43m11 (((limb)1) << 107) - (((limb)1) << 43) - (((limb)1) << 11)
#define two107 (((limb)1) << 107)
#define two107m43p11 (((limb)1) << 107) - (((limb)1) << 43) + (((limb)1) << 11)

/* zero107 is 0 mod p */
static const felem zero107 = { two107m43m11, two107, two107m43p11, two107m43p11 };

/* An alternative felem_diff for larger inputs |in|
 * felem_diff_zero107 subtracts |in| from |out|
 * On entry:
 *   in[i] < 2^106
 * On exit:
 *   out[i] < out[i] + 2^107
 */
static void felem_diff_zero107(felem out, const felem in)
	{
	/* In order to prevent underflow, we add 0 mod p before subtracting. */
	out[0] += zero107[0];
	out[1] += zero107[1];
	out[2] += zero107[2];
	out[3] += zero107[3];

	out[0] -= in[0];
	out[1] -= in[1];
	out[2] -= in[2];
	out[3] -= in[3];
	}

/* longfelem_diff subtracts |in| from |out|
 * On entry:
 *   in[i] < 7*2^67
 * On exit:
 *   out[i] < out[i] + 2^70 + 2^40
 */
static void longfelem_diff(longfelem out, const longfelem in)
	{
	static const limb two70m8p6 = (((limb)1) << 70) - (((limb)1) << 8) + (((limb)1) << 6);
	static const limb two70p40 = (((limb)1) << 70) + (((limb)1) << 40);
	static const limb two70 = (((limb)1) << 70);
	static const limb two70m40m38p6 = (((limb)1) << 70) - (((limb)1) << 40) - (((limb)1) << 38) + (((limb)1) << 6);
	static const limb two70m6 = (((limb)1) << 70) - (((limb)1) << 6);

	/* add 0 mod p to avoid underflow */
	out[0] += two70m8p6;
	out[1] += two70p40;
	out[2] += two70;
	out[3] += two70m40m38p6;
	out[4] += two70m6;
	out[5] += two70m6;
	out[6] += two70m6;
	out[7] += two70m6;

	/* in[i] < 7*2^67 < 2^70 - 2^40 - 2^38 + 2^6 */
	out[0] -= in[0];
	out[1] -= in[1];
	out[2] -= in[2];
	out[3] -= in[3];
	out[4] -= in[4];
	out[5] -= in[5];
	out[6] -= in[6];
	out[7] -= in[7];
	}

#define two64m0 (((limb)1) << 64) - 1
#define two110p32m0 (((limb)1) << 110) + (((limb)1) << 32) - 1
#define two64m46 (((limb)1) << 64) - (((limb)1) << 46)
#define two64m32 (((limb)1) << 64) - (((limb)1) << 32)

/* zero110 is 0 mod p */
static const felem zero110 = { two64m0, two110p32m0, two64m46, two64m32 };

/* felem_shrink converts an felem into a smallfelem. The result isn't quite
 * minimal as the value may be greater than p.
 *
 * On entry:
 *   in[i] < 2^109
 * On exit:
 *   out[i] < 2^64
 */
static void felem_shrink(smallfelem out, const felem in)
	{
	felem tmp;
	u64 a, b, mask;
	s64 high, low;
	static const u64 kPrime3Test = 0x7fffffff00000001ul; /* 2^63 - 2^32 + 1 */

	/* Carry 2->3 */
	tmp[3] = zero110[3] + in[3] + ((u64) (in[2] >> 64));
	/* tmp[3] < 2^110 */

	tmp[2] = zero110[2] + (u64) in[2];
	tmp[0] = zero110[0] + in[0];
	tmp[1] = zero110[1] + in[1];
	/* tmp[0] < 2**110, tmp[1] < 2^111, tmp[2] < 2**65 */

	/* We perform two partial reductions where we eliminate the
	 * high-word of tmp[3]. We don't update the other words till the end.
	 */
	a = tmp[3] >> 64; /* a < 2^46 */
	tmp[3] = (u64) tmp[3];
	tmp[3] -= a;
	tmp[3] += ((limb)a) << 32;
	/* tmp[3] < 2^79 */

	b = a;
	a = tmp[3] >> 64; /* a < 2^15 */
	b += a; /* b < 2^46 + 2^15 < 2^47 */
	tmp[3] = (u64) tmp[3];
	tmp[3] -= a;
	tmp[3] += ((limb)a) << 32;
	/* tmp[3] < 2^64 + 2^47 */

	/* This adjusts the other two words to complete the two partial
	 * reductions. */
	tmp[0] += b;
	tmp[1] -= (((limb)b) << 32);

	/* In order to make space in tmp[3] for the carry from 2 -> 3, we
	 * conditionally subtract kPrime if tmp[3] is large enough. */
	high = tmp[3] >> 64;
	/* As tmp[3] < 2^65, high is either 1 or 0 */
	high <<= 63;
	high >>= 63;
	/* high is:
	 *   all ones   if the high word of tmp[3] is 1
	 *   all zeros  if the high word of tmp[3] if 0 */
	low = tmp[3];
	mask = low >> 63;
	/* mask is:
	 *   all ones   if the MSB of low is 1
	 *   all zeros  if the MSB of low if 0 */
	low &= bottom63bits;
	low -= kPrime3Test;
	/* if low was greater than kPrime3Test then the MSB is zero */
	low = ~low;
	low >>= 63;
	/* low is:
	 *   all ones   if low was > kPrime3Test
	 *   all zeros  if low was <= kPrime3Test */
	mask = (mask & low) | high;
	tmp[0] -= mask & kPrime[0];
	tmp[1] -= mask & kPrime[1];
	/* kPrime[2] is zero, so omitted */
	tmp[3] -= mask & kPrime[3];
	/* tmp[3] < 2**64 - 2**32 + 1 */

	tmp[1] += ((u64) (tmp[0] >> 64)); tmp[0] = (u64) tmp[0];
	tmp[2] += ((u64) (tmp[1] >> 64)); tmp[1] = (u64) tmp[1];
	tmp[3] += ((u64) (tmp[2] >> 64)); tmp[2] = (u64) tmp[2];
	/* tmp[i] < 2^64 */

	out[0] = tmp[0];
	out[1] = tmp[1];
	out[2] = tmp[2];
	out[3] = tmp[3];
	}

/* smallfelem_expand converts a smallfelem to an felem */
static void smallfelem_expand(felem out, const smallfelem in)
	{
	out[0] = in[0];
	out[1] = in[1];
	out[2] = in[2];
	out[3] = in[3];
	}

/* smallfelem_square sets |out| = |small|^2
 * On entry:
 *   small[i] < 2^64
 * On exit:
 *   out[i] < 7 * 2^64 < 2^67
 */
static void smallfelem_square(longfelem out, const smallfelem small)
	{
	limb a;
	u64 high, low;

	a = ((uint128_t) small[0]) * small[0];
	low = a;
	high = a >> 64;
	out[0] = low;
	out[1] = high;

	a = ((uint128_t) small[0]) * small[1];
	low = a;
	high = a >> 64;
	out[1] += low;
	out[1] += low;
	out[2] = high;

	a = ((uint128_t) small[0]) * small[2];
	low = a;
	high = a >> 64;
	out[2] += low;
	out[2] *= 2;
	out[3] = high;

	a = ((uint128_t) small[0]) * small[3];
	low = a;
	high = a >> 64;
	out[3] += low;
	out[4] = high;

	a = ((uint128_t) small[1]) * small[2];
	low = a;
	high = a >> 64;
	out[3] += low;
	out[3] *= 2;
	out[4] += high;

	a = ((uint128_t) small[1]) * small[1];
	low = a;
	high = a >> 64;
	out[2] += low;
	out[3] += high;

	a = ((uint128_t) small[1]) * small[3];
	low = a;
	high = a >> 64;
	out[4] += low;
	out[4] *= 2;
	out[5] = high;

	a = ((uint128_t) small[2]) * small[3];
	low = a;
	high = a >> 64;
	out[5] += low;
	out[5] *= 2;
	out[6] = high;
	out[6] += high;

	a = ((uint128_t) small[2]) * small[2];
	low = a;
	high = a >> 64;
	out[4] += low;
	out[5] += high;

	a = ((uint128_t) small[3]) * small[3];
	low = a;
	high = a >> 64;
	out[6] += low;
	out[7] = high;
	}

/* felem_square sets |out| = |in|^2
 * On entry:
 *   in[i] < 2^109
 * On exit:
 *   out[i] < 7 * 2^64 < 2^67
 */
static void felem_square(longfelem out, const felem in)
	{
	u64 small[4];
	felem_shrink(small, in);
	smallfelem_square(out, small);
	}

/* smallfelem_mul sets |out| = |small1| * |small2|
 * On entry:
 *   small1[i] < 2^64
 *   small2[i] < 2^64
 * On exit:
 *   out[i] < 7 * 2^64 < 2^67
 */
static void smallfelem_mul(longfelem out, const smallfelem small1, const smallfelem small2)
	{
	limb a;
	u64 high, low;

	a = ((uint128_t) small1[0]) * small2[0];
	low = a;
	high = a >> 64;
	out[0] = low;
	out[1] = high;


	a = ((uint128_t) small1[0]) * small2[1];
	low = a;
	high = a >> 64;
	out[1] += low;
	out[2] = high;

	a = ((uint128_t) small1[1]) * small2[0];
	low = a;
	high = a >> 64;
	out[1] += low;
	out[2] += high;


	a = ((uint128_t) small1[0]) * small2[2];
	low = a;
	high = a >> 64;
	out[2] += low;
	out[3] = high;

	a = ((uint128_t) small1[1]) * small2[1];
	low = a;
	high = a >> 64;
	out[2] += low;
	out[3] += high;

	a = ((uint128_t) small1[2]) * small2[0];
	low = a;
	high = a >> 64;
	out[2] += low;
	out[3] += high;


	a = ((uint128_t) small1[0]) * small2[3];
	low = a;
	high = a >> 64;
	out[3] += low;
	out[4] = high;

	a = ((uint128_t) small1[1]) * small2[2];
	low = a;
	high = a >> 64;
	out[3] += low;
	out[4] += high;

	a = ((uint128_t) small1[2]) * small2[1];
	low = a;
	high = a >> 64;
	out[3] += low;
	out[4] += high;

	a = ((uint128_t) small1[3]) * small2[0];
	low = a;
	high = a >> 64;
	out[3] += low;
	out[4] += high;


	a = ((uint128_t) small1[1]) * small2[3];
	low = a;
	high = a >> 64;
	out[4] += low;
	out[5] = high;

	a = ((uint128_t) small1[2]) * small2[2];
	low = a;
	high = a >> 64;
	out[4] += low;
	out[5] += high;

	a = ((uint128_t) small1[3]) * small2[1];
	low = a;
	high = a >> 64;
	out[4] += low;
	out[5] += high;


	a = ((uint128_t) small1[2]) * small2[3];
	low = a;
	high = a >> 64;
	out[5] += low;
	out[6] = high;

	a = ((uint128_t) small1[3]) * small2[2];
	low = a;
	high = a >> 64;
	out[5] += low;
	out[6] += high;


	a = ((uint128_t) small1[3]) * small2[3];
	low = a;
	high = a >> 64;
	out[6] += low;
	out[7] = high;
	}

/* felem_mul sets |out| = |in1| * |in2|
 * On entry:
 *   in1[i] < 2^109
 *   in2[i] < 2^109
 * On exit:
 *   out[i] < 7 * 2^64 < 2^67
 */
static void felem_mul(longfelem out, const felem in1, const felem in2)
	{
	smallfelem small1, small2;
	felem_shrink(small1, in1);
	felem_shrink(small2, in2);
	smallfelem_mul(out, small1, small2);
	}

/* felem_small_mul sets |out| = |small1| * |in2|
 * On entry:
 *   small1[i] < 2^64
 *   in2[i] < 2^109
 * On exit:
 *   out[i] < 7 * 2^64 < 2^67
 */
static void felem_small_mul(longfelem out, const smallfelem small1, const felem in2)
	{
	smallfelem small2;
	felem_shrink(small2, in2);
	smallfelem_mul(out, small1, small2);
	}

#define two100m36m4 (((limb)1) << 100) - (((limb)1) << 36) - (((limb)1) << 4)
#define two100 (((limb)1) << 100)
#define two100m36p4 (((limb)1) << 100) - (((limb)1) << 36) + (((limb)1) << 4)
/* zero100 is 0 mod p */
static const felem zero100 = { two100m36m4, two100, two100m36p4, two100m36p4 };

/* Internal function for the different flavours of felem_reduce.
 * felem_reduce_ reduces the higher coefficients in[4]-in[7].
 * On entry:
 *   out[0] >= in[6] + 2^32*in[6] + in[7] + 2^32*in[7] 
 *   out[1] >= in[7] + 2^32*in[4]
 *   out[2] >= in[5] + 2^32*in[5]
 *   out[3] >= in[4] + 2^32*in[5] + 2^32*in[6]
 * On exit:
 *   out[0] <= out[0] + in[4] + 2^32*in[5]
 *   out[1] <= out[1] + in[5] + 2^33*in[6]
 *   out[2] <= out[2] + in[7] + 2*in[6] + 2^33*in[7]
 *   out[3] <= out[3] + 2^32*in[4] + 3*in[7]
 */
static void felem_reduce_(felem out, const longfelem in)
	{
	int128_t c;
	/* combine common terms from below */
	c = in[4] + (in[5] << 32);
	out[0] += c;
	out[3] -= c;

	c = in[5] - in[7];
	out[1] += c;
	out[2] -= c;

	/* the remaining terms */
	/* 256: [(0,1),(96,-1),(192,-1),(224,1)] */
	out[1] -= (in[4] << 32);
	out[3] += (in[4] << 32);

	/* 320: [(32,1),(64,1),(128,-1),(160,-1),(224,-1)] */
	out[2] -= (in[5] << 32);

	/* 384: [(0,-1),(32,-1),(96,2),(128,2),(224,-1)] */
	out[0] -= in[6];
	out[0] -= (in[6] << 32);
	out[1] += (in[6] << 33);
	out[2] += (in[6] * 2);
	out[3] -= (in[6] << 32);

	/* 448: [(0,-1),(32,-1),(64,-1),(128,1),(160,2),(192,3)] */
	out[0] -= in[7];
	out[0] -= (in[7] << 32);
	out[2] += (in[7] << 33);
	out[3] += (in[7] * 3);
	}

/* felem_reduce converts a longfelem into an felem.
 * To be called directly after felem_square or felem_mul.
 * On entry:
 *   in[0] < 2^64, in[1] < 3*2^64, in[2] < 5*2^64, in[3] < 7*2^64
 *   in[4] < 7*2^64, in[5] < 5*2^64, in[6] < 3*2^64, in[7] < 2*64
 * On exit:
 *   out[i] < 2^101
 */
static void felem_reduce(felem out, const longfelem in)
	{
	out[0] = zero100[0] + in[0];
	out[1] = zero100[1] + in[1];
	out[2] = zero100[2] + in[2];
	out[3] = zero100[3] + in[3];

	felem_reduce_(out, in);

	/* out[0] > 2^100 - 2^36 - 2^4 - 3*2^64 - 3*2^96 - 2^64 - 2^96 > 0
	 * out[1] > 2^100 - 2^64 - 7*2^96 > 0
	 * out[2] > 2^100 - 2^36 + 2^4 - 5*2^64 - 5*2^96 > 0
	 * out[3] > 2^100 - 2^36 + 2^4 - 7*2^64 - 5*2^96 - 3*2^96 > 0
	 *
	 * out[0] < 2^100 + 2^64 + 7*2^64 + 5*2^96 < 2^101
	 * out[1] < 2^100 + 3*2^64 + 5*2^64 + 3*2^97 < 2^101
	 * out[2] < 2^100 + 5*2^64 + 2^64 + 3*2^65 + 2^97 < 2^101
	 * out[3] < 2^100 + 7*2^64 + 7*2^96 + 3*2^64 < 2^101
	 */
	}

/* felem_reduce_zero105 converts a larger longfelem into an felem.
 * On entry:
 *   in[0] < 2^71
 * On exit:
 *   out[i] < 2^106
 */
static void felem_reduce_zero105(felem out, const longfelem in)
	{
	out[0] = zero105[0] + in[0];
	out[1] = zero105[1] + in[1];
	out[2] = zero105[2] + in[2];
	out[3] = zero105[3] + in[3];

	felem_reduce_(out, in);

	/* out[0] > 2^105 - 2^41 - 2^9 - 2^71 - 2^103 - 2^71 - 2^103 > 0
	 * out[1] > 2^105 - 2^71 - 2^103 > 0
	 * out[2] > 2^105 - 2^41 + 2^9 - 2^71 - 2^103 > 0
	 * out[3] > 2^105 - 2^41 + 2^9 - 2^71 - 2^103 - 2^103 > 0
	 *
	 * out[0] < 2^105 + 2^71 + 2^71 + 2^103 < 2^106
	 * out[1] < 2^105 + 2^71 + 2^71 + 2^103 < 2^106
	 * out[2] < 2^105 + 2^71 + 2^71 + 2^71 + 2^103 < 2^106
	 * out[3] < 2^105 + 2^71 + 2^103 + 2^71 < 2^106
	 */
	}

/* subtract_u64 sets *result = *result - v and *carry to one if the subtraction
 * underflowed. */
static void subtract_u64(u64* result, u64* carry, u64 v)
	{
	uint128_t r = *result;
	r -= v;
	*carry = (r >> 64) & 1;
	*result = (u64) r;
	}

/* felem_contract converts |in| to its unique, minimal representation.
 * On entry:
 *   in[i] < 2^109
 */
static void felem_contract(smallfelem out, const felem in)
	{
	unsigned i;
	u64 all_equal_so_far = 0, result = 0, carry;

	felem_shrink(out, in);
	/* small is minimal except that the value might be > p */

	all_equal_so_far--;
	/* We are doing a constant time test if out >= kPrime. We need to
	 * compare each u64, from most-significant to least significant. For
	 * each one, if all words so far have been equal (m is all ones) then a
	 * non-equal result is the answer. Otherwise we continue. */
	for (i = 3; i < 4; i--)
		{
		u64 equal;
		uint128_t a = ((uint128_t) kPrime[i]) - out[i];
		/* if out[i] > kPrime[i] then a will underflow and the high
		 * 64-bits will all be set. */
		result |= all_equal_so_far & ((u64) (a >> 64));

		/* if kPrime[i] == out[i] then |equal| will be all zeros and
		 * the decrement will make it all ones. */
		equal = kPrime[i] ^ out[i];
		equal--;
		equal &= equal << 32;
		equal &= equal << 16;
		equal &= equal << 8;
		equal &= equal << 4;
		equal &= equal << 2;
		equal &= equal << 1;
		equal = ((s64) equal) >> 63;

		all_equal_so_far &= equal;
		}

	/* if all_equal_so_far is still all ones then the two values are equal
	 * and so out >= kPrime is true. */
	result |= all_equal_so_far;

	/* if out >= kPrime then we subtract kPrime. */
	subtract_u64(&out[0], &carry, result & kPrime[0]);
	subtract_u64(&out[1], &carry, carry);
	subtract_u64(&out[2], &carry, carry);
	subtract_u64(&out[3], &carry, carry);

	subtract_u64(&out[1], &carry, result & kPrime[1]);
	subtract_u64(&out[2], &carry, carry);
	subtract_u64(&out[3], &carry, carry);

	subtract_u64(&out[2], &carry, result & kPrime[2]);
	subtract_u64(&out[3], &carry, carry);

	subtract_u64(&out[3], &carry, result & kPrime[3]);
	}

static void smallfelem_square_contract(smallfelem out, const smallfelem in)
	{
	longfelem longtmp;
	felem tmp;

	smallfelem_square(longtmp, in);
	felem_reduce(tmp, longtmp);
	felem_contract(out, tmp);
	}

static void smallfelem_mul_contract(smallfelem out, const smallfelem in1, const smallfelem in2)
	{
	longfelem longtmp;
	felem tmp;

	smallfelem_mul(longtmp, in1, in2);
	felem_reduce(tmp, longtmp);
	felem_contract(out, tmp);
	}

/* felem_is_zero returns a limb with all bits set if |in| == 0 (mod p) and 0
 * otherwise.
 * On entry:
 *   small[i] < 2^64
 */
static limb smallfelem_is_zero(const smallfelem small)
	{
	limb result;
	u64 is_p;

	u64 is_zero = small[0] | small[1] | small[2] | small[3];
	is_zero--;
	is_zero &= is_zero << 32;
	is_zero &= is_zero << 16;
	is_zero &= is_zero << 8;
	is_zero &= is_zero << 4;
	is_zero &= is_zero << 2;
	is_zero &= is_zero << 1;
	is_zero = ((s64) is_zero) >> 63;

	is_p = (small[0] ^ kPrime[0]) |
	       (small[1] ^ kPrime[1]) |
	       (small[2] ^ kPrime[2]) |
	       (small[3] ^ kPrime[3]);
	is_p--;
	is_p &= is_p << 32;
	is_p &= is_p << 16;
	is_p &= is_p << 8;
	is_p &= is_p << 4;
	is_p &= is_p << 2;
	is_p &= is_p << 1;
	is_p = ((s64) is_p) >> 63;

	is_zero |= is_p;

	result = is_zero;
	result |= ((limb) is_zero) << 64;
	return result;
	}

static int smallfelem_is_zero_int(const smallfelem small)
	{
	return (int) (smallfelem_is_zero(small) & ((limb)1));
	}

/* felem_inv calculates |out| = |in|^{-1}
 *
 * Based on Fermat's Little Theorem:
 *   a^p = a (mod p)
 *   a^{p-1} = 1 (mod p)
 *   a^{p-2} = a^{-1} (mod p)
 */
static void felem_inv(felem out, const felem in)
	{
	felem ftmp, ftmp2;
	/* each e_I will hold |in|^{2^I - 1} */
	felem e2, e4, e8, e16, e32, e64;
	longfelem tmp;
	unsigned i;

	felem_square(tmp, in); felem_reduce(ftmp, tmp);			/* 2^1 */
	felem_mul(tmp, in, ftmp); felem_reduce(ftmp, tmp);		/* 2^2 - 2^0 */
	felem_assign(e2, ftmp);
	felem_square(tmp, ftmp); felem_reduce(ftmp, tmp);		/* 2^3 - 2^1 */
	felem_square(tmp, ftmp); felem_reduce(ftmp, tmp);		/* 2^4 - 2^2 */
	felem_mul(tmp, ftmp, e2); felem_reduce(ftmp, tmp);		/* 2^4 - 2^0 */
	felem_assign(e4, ftmp);
	felem_square(tmp, ftmp); felem_reduce(ftmp, tmp);		/* 2^5 - 2^1 */
	felem_square(tmp, ftmp); felem_reduce(ftmp, tmp);		/* 2^6 - 2^2 */
	felem_square(tmp, ftmp); felem_reduce(ftmp, tmp);		/* 2^7 - 2^3 */
	felem_square(tmp, ftmp); felem_reduce(ftmp, tmp);		/* 2^8 - 2^4 */
	felem_mul(tmp, ftmp, e4); felem_reduce(ftmp, tmp);		/* 2^8 - 2^0 */
	felem_assign(e8, ftmp);
	for (i = 0; i < 8; i++) {
		felem_square(tmp, ftmp); felem_reduce(ftmp, tmp);
	}								/* 2^16 - 2^8 */
	felem_mul(tmp, ftmp, e8); felem_reduce(ftmp, tmp);		/* 2^16 - 2^0 */
	felem_assign(e16, ftmp);
	for (i = 0; i < 16; i++) {
		felem_square(tmp, ftmp); felem_reduce(ftmp, tmp);
	}								/* 2^32 - 2^16 */
	felem_mul(tmp, ftmp, e16); felem_reduce(ftmp, tmp);		/* 2^32 - 2^0 */
	felem_assign(e32, ftmp);
	for (i = 0; i < 32; i++) {
		felem_square(tmp, ftmp); felem_reduce(ftmp, tmp);
	}								/* 2^64 - 2^32 */
	felem_assign(e64, ftmp);
	felem_mul(tmp, ftmp, in); felem_reduce(ftmp, tmp);		/* 2^64 - 2^32 + 2^0 */
	for (i = 0; i < 192; i++) {
		felem_square(tmp, ftmp); felem_reduce(ftmp, tmp);
	}								/* 2^256 - 2^224 + 2^192 */

	felem_mul(tmp, e64, e32); felem_reduce(ftmp2, tmp);		/* 2^64 - 2^0 */
	for (i = 0; i < 16; i++) {
		felem_square(tmp, ftmp2); felem_reduce(ftmp2, tmp);
	}								/* 2^80 - 2^16 */
	felem_mul(tmp, ftmp2, e16); felem_reduce(ftmp2, tmp);		/* 2^80 - 2^0 */
	for (i = 0; i < 8; i++) {
		felem_square(tmp, ftmp2); felem_reduce(ftmp2, tmp);
	}								/* 2^88 - 2^8 */
	felem_mul(tmp, ftmp2, e8); felem_reduce(ftmp2, tmp);		/* 2^88 - 2^0 */
	for (i = 0; i < 4; i++) {
		felem_square(tmp, ftmp2); felem_reduce(ftmp2, tmp);
	}								/* 2^92 - 2^4 */
	felem_mul(tmp, ftmp2, e4); felem_reduce(ftmp2, tmp);		/* 2^92 - 2^0 */
	felem_square(tmp, ftmp2); felem_reduce(ftmp2, tmp);		/* 2^93 - 2^1 */
	felem_square(tmp, ftmp2); felem_reduce(ftmp2, tmp);		/* 2^94 - 2^2 */
	felem_mul(tmp, ftmp2, e2); felem_reduce(ftmp2, tmp);		/* 2^94 - 2^0 */
	felem_square(tmp, ftmp2); felem_reduce(ftmp2, tmp);		/* 2^95 - 2^1 */
	felem_square(tmp, ftmp2); felem_reduce(ftmp2, tmp);		/* 2^96 - 2^2 */
	felem_mul(tmp, ftmp2, in); felem_reduce(ftmp2, tmp);		/* 2^96 - 3 */

	felem_mul(tmp, ftmp2, ftmp); felem_reduce(out, tmp); /* 2^256 - 2^224 + 2^192 + 2^96 - 3 */
	}

static void smallfelem_inv_contract(smallfelem out, const smallfelem in)
	{
	felem tmp;

	smallfelem_expand(tmp, in);
	felem_inv(tmp, tmp);
	felem_contract(out, tmp);
	}

/* copy_conditional copies in to out iff mask is all ones. */
static void
copy_conditional(felem out, const felem in, limb mask)
	{
	unsigned i;
	for (i = 0; i < NLIMBS; ++i)
		{
		const limb tmp = mask & (in[i] ^ out[i]);
		out[i] ^= tmp;
		}
	}

/* copy_small_conditional copies in to out iff mask is all ones. */
static void
copy_small_conditional(felem out, const smallfelem in, limb mask)
	{
	unsigned i;
	const u64 mask64 = mask;
	for (i = 0; i < NLIMBS; ++i)
		{
		out[i] = ((limb) (in[i] & mask64)) | (out[i] & ~mask);
		}
	}

/*************************************/
/*Now we have to make this work with the new exposed symbols*/
/*Note that above code uses 3 different types: longfelem, smallfelem,
  and felem. We export felems. Also note that some operations are inconvienent.
  We also need to change imported and exported signs: big-endian vs. little-
  endian is one of the biggest problems in the world, and it bites us here.

  Clients have to use GCC extensions. This is a problem... but an okay one.
  Speed is lost, clarity gained by these functions.
*/
static void fep256reduce(fep256*c){
    smallfelem temp;
    felem_shrink(temp, c->c);
    smallfelem_expand(c->c, temp);
}

void fep256add(fep256*c, fep256*a, fep256*b){ 
  felem temp1;
  felem temp2;
  felem_assign(temp1, a->c);
  felem_assign(temp2, b->c);
  felem_sum(temp2, temp1);
  felem_assign(c->c, temp2);
  fep256reduce(c);
}

void fep256sub(fep256 *c, fep256 *a, fep256 *b){
  felem temp1;
  felem temp2;
  felem_assign(temp1, a->c);
  felem_assign(temp2, b->c);
  felem_diff(temp1, temp2);
  felem_assign(c->c, temp1);
  fep256reduce(c);
}

void fep256mul(fep256 *c, fep256 *a, fep256 *b){
  longfelem temp;
  felem_mul(temp, a->c, b->c);
  felem_reduce(c->c,temp);
}

void fep256sqr(fep256 *c, fep256 *a){
  longfelem temp2;
  felem temp1;
  felem_assign(temp1, a->c);
  felem_square(temp2, temp1);
  felem_reduce(c->c, temp2);
}

void fep256inv(fep256 *c, fep256 *a){
  felem_inv(c->c, a->c);
}

void fep256scalar(fep256*c, fep256 *a, uint64_t scalar){
  felem temp;
  felem_assign(temp, a->c);
  felem_scalar(temp, scalar);
  felem_assign(c->c, temp);
}

void fep256setzero(fep256 *c){
  c->c[0]=0;
  c->c[1]=0;
  c->c[2]=0;
  c->c[3]=0;
}

void fep256setone(fep256 *c){
  smallfelem temp;
  smallfelem_one(temp);
  smallfelem_expand(c->c, temp);
}

unsigned int fep256iszero(fep256 *c){ //want to return 1 if zero
  smallfelem temp;
  felem_contract(temp, c->c);
  return (smallfelem_is_zero_int(temp));
}

void fep256cmov(fep256 *c, fep256 *a, unsigned int b){
  int i;
  for(i=0; i<4; i++){
    c->c[i]=((uint128_t)b)*(a->c[i])+(1-(uint128_t) b)*(c->c[i]);
  }
}

void fep256pack(unsigned char *out, fep256 *a){
  smallfelem temp;
  unsigned char little[32];
  int i;
  felem_contract(temp, a->c);
  smallfelem_to_bin32(little, temp);
  for(i=0; i<32; i++){
    out[i]=little[31-i];
  }
}

void fep256unpack(fep256 *c, const unsigned char *in){
  smallfelem temp;
  unsigned char little[32];
  int i;
  for(i=0; i<32; i++){
    little[i]=in[31-i];
  }
  bin32_to_felem(c->c, little);
}
