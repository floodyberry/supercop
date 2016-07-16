/*
 * AES-COPA v2 reference implementation
 *
 * copa@esat.kuleuven.be
 */

#include "crypto_aead.h"

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "aes-core.h"


typedef uint8_t block_t[16];

/* 
 * Debugging support 
 */
#define PRINT(b)	printblock(#b, b)
#define PRINT1(b)	if (i == 3*16) printblock(#b, b)
#define PRINTI(i)	printf("%s: %d\n", #i, i)
static void printblock(const char* caption, const block_t buf)
{
	int i;

	printf("%-17s: ", caption);
	for (i = 0; i < 16; i++) {
		printf("%02x", buf[i]);
	}
	putchar('\n');
}

/* 
 * Auxiliary routines: operations on 128-bit blocks, multiplications, AES
 */

static void xor_block(block_t dest, const block_t a, const block_t b)
{
	int i;
	for (i = 0; i < 16; i++) {
		dest[i] = a[i] ^ b[i];
	}
}

static void copy_block(block_t dest, const block_t src)
{
	int i;
	for (i = 0; i < 16; i++) {
		dest[i] = src[i];
	}
}

static void shl_block(block_t res, const block_t x)
{
	int i;
	for (i = 0; i < 15; i++) {
		res[i] = (x[i] << 1) | (x[i+1] >> 7);
	}
	res[15] = x[15] << 1;
}

static void gf128_mul2(block_t res, const block_t x)
{
	int msb = x[0] & 0x80;
	shl_block(res, x);
	if (msb) {
		res[15] ^= 0x87;
	}
}

static void gf128_mul3(block_t res, const block_t x)
{
	block_t x2;

	gf128_mul2(x2, x);
	xor_block(res, x2, x);
}

static void gf128_mul7(block_t res, const block_t x)
{
	block_t x2, x4;

	gf128_mul2(x2, x);
	gf128_mul2(x4, x2);
	xor_block(x4, x4, x2);
	xor_block(res, x4, x);
}

void AES_ENCRYPT(unsigned char* out, const unsigned char* in, const unsigned char* key)
{
	unsigned char buf[16];
	unsigned char expkey[11*16];

	aesc_keyexp(key, expkey);
	aesc_encrypt(in, buf, expkey);
	copy_block(out, buf);
}

void AES_DECRYPT(unsigned char* out, const unsigned char* in, const unsigned char* key)
{
	unsigned char buf[16];
	unsigned char expkey[11*16];

	aesc_keyexp(key, expkey);
	aesc_decrypt(in, buf, expkey);
	copy_block(out, buf);
}

/*
 * COPA's AD processing PMAC1'
 */

void mac(unsigned char* out, 
		const unsigned char* in, unsigned long long len, 
		const unsigned char* LL,
		const unsigned char* k)
{
	block_t v = { 0 }, delta, block;
	unsigned int i;

	gf128_mul3(delta, LL);
	gf128_mul3(delta, delta);
	gf128_mul3(delta, delta); /* delta = 3^3*L */

	/* mac full blocks except last */
	while (len > 16) {
		xor_block(block, in, delta);
		AES_ENCRYPT(block, block, k);
		xor_block(v, v, block);

		gf128_mul2(delta, delta);

		in += 16;
		len -= 16;
	}

	if (len == 16) { /* last block full */
		gf128_mul3(delta, delta);
		xor_block(v, v, delta);
		xor_block(v, v, in);
		AES_ENCRYPT(out, v, k);
	} else { /* last block partial */
		gf128_mul3(delta, delta);
		gf128_mul3(delta, delta);
		xor_block(v, v, delta);
		for (i = 0; i < len; i++) {
			v[i] ^= in[i];
		}
		v[len] ^= 0x80; /* padding */
		AES_ENCRYPT(out, v, k);
	}
}

/*
 * main encryption and decryption routines
 */

int crypto_aead_encrypt(
       unsigned char *c,unsigned long long *clen,
       const unsigned char *m,unsigned long long mlen,
       const unsigned char *ad,unsigned long long adlen,
       const unsigned char *nsec,
       const unsigned char *npub,
       const unsigned char *k
     )
{
	unsigned char* macdata;
	const unsigned char* in = m;
	unsigned char* out = c;
	unsigned long long remaining = mlen;
	int partial;

	block_t V;
	block_t lastblock;
	block_t block, Lup, Ldown;
	block_t checksum = { 0 };
	block_t T;
	block_t LL = { 0 };

	AES_ENCRYPT(LL, LL, k); /* LL = AES(LL) */

	/* last byte is bit P. 
	   P=1 for partial last block, 
	   P=0 otherwise. */
	*clen = (mlen == 0 ? 16 : ((mlen+15)/16)*16) + 16 + 1; 
	partial = (*clen > mlen + 16 + 1);

	/* store bit P */
	c[*clen-1] = partial;

	/* mac AD + nonce */
	macdata = malloc(adlen + 16);
	memcpy(macdata, ad, adlen);
	memcpy(macdata+adlen, npub, 16);
	mac(V, macdata, adlen+16, LL, k);
	free(macdata);

	xor_block(lastblock, LL, V); /* lastblock = LL ^ V */

	gf128_mul3(Lup, LL); /* Lup = 3*LL */
	gf128_mul2(Ldown, LL); /* Ldown = 2*LL */

	while (remaining >= 16) { 
		xor_block(checksum, checksum, in);
		xor_block(block, in, Lup);
		AES_ENCRYPT(block, block, k);

		xor_block(block, block, lastblock);
		copy_block(lastblock, block);

		AES_ENCRYPT(block, block, k);
		xor_block(out, block, Ldown);

		if (remaining != 16) { /* don't double after full last block */
			gf128_mul2(Lup, Lup);
			gf128_mul2(Ldown, Ldown);
		}

		in += 16;
		out += 16;
		remaining -= 16;
	}

	/* if last block is partial */
	if (partial) {
		/* padding */
		block_t padmsg = { 0 };
		unsigned long long i;

		for (i = 0; i < remaining; i++) {
			padmsg[i] = in[i];
		}
		padmsg[i] = 0x80; /* padding */

		gf128_mul7(Lup, Lup);

		xor_block(checksum, checksum, padmsg);
		xor_block(block, padmsg, Lup);
		AES_ENCRYPT(block, block, k);

		xor_block(block, block, lastblock);
		copy_block(lastblock, block);

		AES_ENCRYPT(block, block, k);
		xor_block(out, block, Ldown);

		out += 16;
	}

	/* compute tag */
	gf128_mul3(LL, Lup);
	xor_block(checksum, checksum, LL);
	AES_ENCRYPT(checksum, checksum, k);

	xor_block(checksum, checksum, lastblock);

	AES_ENCRYPT(checksum, checksum, k);
	gf128_mul7(LL, Ldown);
	xor_block(T, checksum, LL);

	copy_block(out, T);

	return 0;
}



int crypto_aead_decrypt(
   unsigned char *m,unsigned long long *mlen,
   unsigned char *nsec,
   const unsigned char *c,unsigned long long clen,
   const unsigned char *ad,unsigned long long adlen,
   const unsigned char *npub,
   const unsigned char *k
   )
{
	unsigned char* macdata;
	const unsigned char* in = c;
	unsigned char* out = m;
	unsigned long long remaining;
	int partial;

	block_t V;
	block_t lastblock, newlastblock;
	block_t checksum = { 0 };
	block_t tag;
	block_t block, Lup, Ldown;
	block_t LL = { 0 };

	AES_ENCRYPT(LL, LL, k); /* LL = AES(LL) */

	/* verify that we have 16*x+1 bytes */
	if (clen % 16 != 1) {
		return -1;
	}

	/* Verify bit P */
	if (c[clen-1] > 1) {
		return -1;
	} else {
		partial = c[clen-1];
	}

	*mlen = clen - 16 - 1; /* provisional, will be adjusted later for incomplete last block */

	/* mac AD + nonce */
	macdata = malloc(adlen + 16);
	memcpy(macdata, ad, adlen);
	memcpy(macdata+adlen, npub, 16);
	mac(V, macdata, adlen+16, LL, k);
	free(macdata);

	xor_block(lastblock, LL, V); /* lastblock = LL ^ V; */

	gf128_mul3(Lup, LL); /* Lup = 3*LL */
	gf128_mul2(Ldown, LL); /* Ldown = 2*LL */

	remaining = *mlen;
	while (remaining > 16) {
		xor_block(block, in, Ldown);
		AES_DECRYPT(newlastblock, block, k);

		xor_block(block, newlastblock, lastblock);
		copy_block(lastblock, newlastblock);

		AES_DECRYPT(block, block, k);
		xor_block(out, block, Lup);
		xor_block(checksum, checksum, out);

		gf128_mul2(Lup, Lup);
		gf128_mul2(Ldown, Ldown);

		in += 16;
		out += 16;
		remaining -= 16;
	}

	/* verify correct length */
	if ((!partial && remaining != 16) || (partial && remaining == 0)) {
		return -1;
	}

	if (!partial) { /* full last block, normal processing */
		xor_block(block, in, Ldown);
		AES_DECRYPT(newlastblock, block, k);

		xor_block(block, newlastblock, lastblock);
		copy_block(lastblock, newlastblock);

		AES_DECRYPT(block, block, k);
		xor_block(out, block, Lup);
		xor_block(checksum, checksum, out);

		in += 16;
		out += 16;
		remaining -= 16;
	} else { /* last partial block remaining */
		int i, j;

		xor_block(block, in, Ldown);
		AES_DECRYPT(newlastblock, block, k);

		xor_block(block, newlastblock, lastblock);
		copy_block(lastblock, newlastblock);

		AES_DECRYPT(block, block, k);
		gf128_mul7(Lup, Lup);
		xor_block(newlastblock, block, Lup);
		xor_block(checksum, checksum, newlastblock);

		i = 15;
		while (i > 0 && newlastblock[i] == 0)
			--i;
		if ((newlastblock[i] != 0x80)) {
			return -1;
		}
		for (j = 0; j < i; j++) {
			out[j] = newlastblock[j];
		}

		/* adjust mlen */
		*mlen -= 16-i;

		in += remaining;
		out += i;
		remaining -= remaining;
	}

	/* compute tag */
	gf128_mul3(LL, Lup);
	xor_block(checksum, checksum, LL);
	AES_ENCRYPT(checksum, checksum, k);

	xor_block(checksum, checksum, lastblock);

	AES_ENCRYPT(checksum, checksum, k);
	gf128_mul7(LL, Ldown);
	xor_block(tag, checksum, LL);

	if (memcmp(tag, in, 16) == 0) {
		return 0;
	} else {
		return -1;
	}
}

