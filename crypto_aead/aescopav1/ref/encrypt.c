/*
 * AES-COPA v1 reference implementation
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
 * Encryption and decryption with tag splitting (for messages smaller than one
 * block).
 */

static void encrypt_tag_splitting(unsigned char* c, 
		const unsigned char* m, int mlen, 
		const block_t V, const block_t LL, const unsigned char* k)
{
	block_t delta36, delta37, delta38, delta236, delta367;
	block_t padmsg = { 0 }, block, S, C, T;
	int i;

	copy_block(delta36, LL);
	for (i = 0; i < 6; i++) {
		gf128_mul3(delta36, delta36);
	}
	gf128_mul3(delta37, delta36);
	gf128_mul3(delta38, delta37);
	gf128_mul2(delta236, delta36);
	gf128_mul7(delta367, delta36);

	for (i = 0; i < mlen; i++) {
		padmsg[i] = m[i];
	}
	padmsg[mlen] = 0x80; /* padding */

	/* encrypt */
	xor_block(block, padmsg, delta37);
	AES_ENCRYPT(block, block, k);
	xor_block(block, block, delta36);
	xor_block(S, block, V);

	AES_ENCRYPT(block, S, k);
	xor_block(C, block, delta236);

	/* tag */
	xor_block(block, padmsg, delta38);
	AES_ENCRYPT(block, block, k);
	xor_block(block, block, S);
	AES_ENCRYPT(block, block, k);
	xor_block(T, block, delta367);

	/* fill c[0..mlen-1+16] with bytes from C and T */
	for (i = 0; i < 16; i++) {
		c[i] = C[i];
	}
	for (i = 16; i < mlen+16; i++) {
		c[i] = T[i-16];
	}
}

static int decrypt_tag_splitting(unsigned char* m, int mlen, 
		const unsigned char* c, 
		const block_t V, const block_t LL, const unsigned char* k)
{
	block_t delta36, delta37, delta38, delta236, delta367;
	block_t block, S, M, T;
	const unsigned char *p = &M[15];
	int i;

	copy_block(delta36, LL);
	for (i = 0; i < 6; i++) {
		gf128_mul3(delta36, delta36);
	}
	gf128_mul3(delta37, delta36);
	gf128_mul3(delta38, delta37);
	gf128_mul2(delta236, delta36);
	gf128_mul7(delta367, delta36);

	copy_block(block, c); /* copies from partial ciphertext + partial tag */
	xor_block(block, block, delta236);
	AES_DECRYPT(S, block, k);

	xor_block(block, V, S);
	xor_block(block, block, delta36);
	AES_DECRYPT(block, block, k);
	xor_block(M, block, delta37); /* block = M10*   */
	
	/* compute tag */
	xor_block(block, M, delta38);
	AES_ENCRYPT(block, block, k);
	xor_block(block, block, S);
	AES_ENCRYPT(block, block, k);
	xor_block(T, block, delta367);

	while (*p == 0)
		p--;
	if ((*p != 0x80) || (p-M != mlen)) {
		return -1;
	}

	if (memcmp(c+16, T, mlen) == 0) {
		for (i = 0; i < mlen; i++) {
			m[i] = M[i];
		}
		return 0;
	} else {
		return -1;
	}
}

/*
 * XLS + auxiliary routines for handling fractional last blocks
 */

void rol(unsigned char* out, const unsigned char* in, unsigned int s)
{
	unsigned char firstbit = in[0] >> 7;
	while (--s > 0) {
		unsigned char bit = in[1] >> 7;

		*out++ = (*in++ << 1) | bit;
	}

	*out = (*in << 1) | firstbit;
}

void mix(unsigned char* buf, unsigned int s)
{
	unsigned char ab[16];
	unsigned int i;

	for (i = 0; i < s; i++) {
		ab[i] = buf[i] ^ buf[s+i];
	}
	rol(ab, ab, s);

	for (i = 0; i < s; i++) {
		buf[i] ^= ab[i];
		buf[s+i] ^= ab[i];
	}
}

void invmix(unsigned char* buf, unsigned int s)
{
	mix(buf, s); /* mix is an involution */
}


void xls(unsigned char* buf, unsigned int s, const block_t twod1, const unsigned char* k)
{
	/*
	 * Input is s+16 bytes buf[0]..buf[s+15] with 1 < s < 16
	 */                     

	block_t LL, LL3;
	gf128_mul7(LL, twod1); 
	gf128_mul7(LL, LL); /* LL = 2^(d-1) * 7^2 * L  */
	gf128_mul3(LL3, LL); /* LL3 = 2^(d-1) * 3 * 7^2 * L  */

	/* Ed,2 on first 16 bytes */
	xor_block(buf, buf, LL3);
	AES_ENCRYPT(buf, buf, k);
	xor_block(buf, buf, LL3);

	/* mix on last 2s bytes */
	mix(buf+16-s, s);
	/* flip */
	buf[16-s] ^= 0x80;

	/* Ed,1 on first 16 bytes */
	xor_block(buf, buf, LL);
	AES_ENCRYPT(buf, buf, k);
	xor_block(buf, buf, LL);

	/* flip */
	buf[16-s] ^= 0x80;
	/* mix on last 2s bytes */
	mix(buf+16-s, s);

	/* Ed,2 on first 16 bytes */
	xor_block(buf, buf, LL3);
	AES_ENCRYPT(buf, buf, k);
	xor_block(buf, buf, LL3);
}

void xlsinv(unsigned char* buf, unsigned int s, const block_t twod1, const unsigned char* k)
{
	block_t LL, LL3;
	gf128_mul7(LL, twod1); 
	gf128_mul7(LL, LL); /* LL = 2^(d-1) * 7^2 * L  */
	gf128_mul3(LL3, LL); /* LL3 = 2^(d-1) * 3 * 7^2 * L  */

	/* Ed,2 on first 16 bytes */
	xor_block(buf, buf, LL3);
	AES_DECRYPT(buf, buf, k);
	xor_block(buf, buf, LL3);

	/* mix on last 2s bytes */
	invmix(buf+16-s, s);
	/* flip  */
	buf[16-s] ^= 0x80;

	/* Ed,1 on first 16 bytes */
	xor_block(buf, buf, LL);
	AES_DECRYPT(buf, buf, k);
	xor_block(buf, buf, LL);

	/* flip */
	buf[16-s] ^= 0x80;
	/* mix on last 2s bytes */
	invmix(buf+16-s, s);

	/* Ed,2 on first 16 bytes */
	xor_block(buf, buf, LL3);
	AES_DECRYPT(buf, buf, k);
	xor_block(buf, buf, LL3);
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

	block_t V;
	block_t lastblock;
	block_t block, Lup, Ldown, twod1;
	block_t checksum = { 0 };
	block_t T;
	block_t LL = { 0 };

	AES_ENCRYPT(LL, LL, k); /* LL = AES(LL) */

	*clen = mlen + 16;

	/* mac AD + nonce */
	macdata = malloc(adlen + 16);
	memcpy(macdata, ad, adlen);
	memcpy(macdata+adlen, npub, 16);
	mac(V, macdata, adlen+16, LL, k);
	free(macdata);

	if (mlen < 16) {
		encrypt_tag_splitting(c, m, mlen, V, LL, k);
		return 0;
	}

	xor_block(lastblock, LL, V); /* lastblock = LL ^ V */

	copy_block(twod1, LL); /* 2^(d-1)*L where d is # of blocks. */
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

		gf128_mul2(Lup, Lup);
		gf128_mul2(Ldown, Ldown);
		if (remaining < mlen) {
			gf128_mul2(twod1, twod1);
		}

		in += 16;
		out += 16;
		remaining -= 16;
	}

	/* compute tag */
	gf128_mul3(LL, twod1);
	gf128_mul3(LL, LL);
	xor_block(checksum, checksum, LL);
	AES_ENCRYPT(checksum, checksum, k);

	xor_block(checksum, checksum, lastblock);

	AES_ENCRYPT(checksum, checksum, k);
	gf128_mul7(LL, twod1);
	xor_block(T, checksum, LL);

	if (remaining == 0) { /* last block full, we are done */
		copy_block(out, T);
	} else { /* last partial block remaining, use XLS */
		unsigned char buf[32]; /* at most 15 + 16 bytes */

		memcpy(buf, in, remaining);
		memcpy(buf+remaining, T, 16);
		xls(buf, remaining, twod1, k);

		memcpy(out, buf, remaining+16); /* last partial ciphertext + tag */
	}

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

	const unsigned char* T;
	unsigned char buf[32]; /* for XLS: at most 15 + 16 bytes */
	block_t V;
	block_t lastblock;
	block_t checksum = { 0 };
	block_t tag;
	block_t block, Lup, Ldown, twod1;
	block_t LL = { 0 };

	AES_ENCRYPT(LL, LL, k); /* LL = AES(LL) */

	*mlen = clen - 16;

	/* mac AD + nonce */
	macdata = malloc(adlen + 16);
	memcpy(macdata, ad, adlen);
	memcpy(macdata+adlen, npub, 16);
	mac(V, macdata, adlen+16, LL, k);
	free(macdata);

	if (*mlen < 16) {
		return decrypt_tag_splitting(m, *mlen, c, V, LL, k);
	}

	xor_block(lastblock, LL, V); /* lastblock = LL ^ V; */

	copy_block(twod1, LL); /* 2^(d-1)*L where d is # of blocks. */
	gf128_mul3(Lup, LL); /* Lup = 3*LL */
	gf128_mul2(Ldown, LL); /* Ldown = 2*LL */

	remaining = *mlen;
	while (remaining >= 16) {
		block_t newlastblock;
		xor_block(block, in, Ldown);
		AES_DECRYPT(newlastblock, block, k);

		xor_block(block, newlastblock, lastblock);
		copy_block(lastblock, newlastblock);

		AES_DECRYPT(block, block, k);
		xor_block(out, block, Lup);
		xor_block(checksum, checksum, out);

		gf128_mul2(Lup, Lup);
		gf128_mul2(Ldown, Ldown);
		if (remaining < *mlen) {
			gf128_mul2(twod1, twod1);
		}

		in += 16;
		out += 16;
		remaining -= 16;
	}

	if (remaining == 0) { /* last block full, take tag from input */
		T = in;
	} else { /* last partial block remaining, use XLS^-1 */
		memcpy(buf, in, remaining+16);
		in += remaining;
		xlsinv(buf, remaining, twod1, k);

		memcpy(out, buf, remaining); /* last partial plaintext */
		T = buf + remaining;
	}

	/* compute tag */
	gf128_mul3(LL, twod1);
	gf128_mul3(LL, LL);
	xor_block(checksum, checksum, LL);
	AES_ENCRYPT(checksum, checksum, k);

	xor_block(checksum, checksum, lastblock);

	AES_ENCRYPT(checksum, checksum, k);
	gf128_mul7(LL, twod1);
	xor_block(tag, checksum, LL);

	if (memcmp(tag, T, 16) == 0) {
		return 0;
	} else {
		return -1;
	}
}

