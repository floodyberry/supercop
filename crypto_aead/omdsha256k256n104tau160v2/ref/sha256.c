/** Implementation of sha256 compression function, originally from openssl  */

/**The original file was modified so that it implements
 * only the compression functions. Below follows the original copyright
 * notice.
*/
/** ====================================================================
 * Copyright (c) 2004 The OpenSSL Project.  All rights reserved
 * according to the OpenSSL license [found in ../../LICENSE].
 * ====================================================================
 */

#include <stdlib.h>
#include <string.h>

#include <sha256.h>
#define	DATA_ORDER_IS_BIG_ENDIAN
#include <md32_common.h>



/** sha256 round constants*/
static const uint32_t K256[64] = {
	0x428a2f98UL,0x71374491UL,0xb5c0fbcfUL,0xe9b5dba5UL,
	0x3956c25bUL,0x59f111f1UL,0x923f82a4UL,0xab1c5ed5UL,
	0xd807aa98UL,0x12835b01UL,0x243185beUL,0x550c7dc3UL,
	0x72be5d74UL,0x80deb1feUL,0x9bdc06a7UL,0xc19bf174UL,
	0xe49b69c1UL,0xefbe4786UL,0x0fc19dc6UL,0x240ca1ccUL,
	0x2de92c6fUL,0x4a7484aaUL,0x5cb0a9dcUL,0x76f988daUL,
	0x983e5152UL,0xa831c66dUL,0xb00327c8UL,0xbf597fc7UL,
	0xc6e00bf3UL,0xd5a79147UL,0x06ca6351UL,0x14292967UL,
	0x27b70a85UL,0x2e1b2138UL,0x4d2c6dfcUL,0x53380d13UL,
	0x650a7354UL,0x766a0abbUL,0x81c2c92eUL,0x92722c85UL,
	0xa2bfe8a1UL,0xa81a664bUL,0xc24b8b70UL,0xc76c51a3UL,
	0xd192e819UL,0xd6990624UL,0xf40e3585UL,0x106aa070UL,
	0x19a4c116UL,0x1e376c08UL,0x2748774cUL,0x34b0bcb5UL,
	0x391c0cb3UL,0x4ed8aa4aUL,0x5b9cca4fUL,0x682e6ff3UL,
	0x748f82eeUL,0x78a5636fUL,0x84c87814UL,0x8cc70208UL,
	0x90befffaUL,0xa4506cebUL,0xbef9a3f7UL,0xc67178f2UL };

/** sha256 round functions*/
#define Sigma0(x)	(ROTATE((x),30) ^ ROTATE((x),19) ^ ROTATE((x),10))
#define Sigma1(x)	(ROTATE((x),26) ^ ROTATE((x),21) ^ ROTATE((x),7))
#define sigma0(x)	(ROTATE((x),25) ^ ROTATE((x),14) ^ ((x)>>3))
#define sigma1(x)	(ROTATE((x),15) ^ ROTATE((x),13) ^ ((x)>>10))

#define Ch(x,y,z)	(((x) & (y)) ^ ((~(x)) & (z)))
#define Maj(x,y,z)	(((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)))

/*****************************************
 *       sha256 compression function     *
 *                                       *
 *   H   points to chaining input        *
 *   in  points to the message input     *
 *                                       *
 *****************************************/
void sha256_comp (hashblock res, const hashblock hash, const void *in)
	{
	uint32_t a,b,c,d,e,f,g,h,s0,s1,T1,T2;
	uint32_t    H[8];
	uint32_t	X[16],l;
	int i;
	const unsigned char *data=in;

	for (i = 0; i < SHA256_DIGEST_LENGTH/4; i++) {
	   HOST_c2l(hash, H[i]);
	}

	a = H[0];	b = H[1];	c = H[2];	d = H[3];
	e = H[4];	f = H[5];	g = H[6];	h = H[7];

	for (i=0;i<16;i++)
		{
		HOST_c2l(data,l); T1 = X[i] = l;
		T1 += h + Sigma1(e) + Ch(e,f,g) + K256[i];
		T2 = Sigma0(a) + Maj(a,b,c);
		h = g;
		g = f;
		f = e;
		e = d + T1;
		d = c;	c = b;	b = a;	a = T1 + T2;
		}

	for (;i<64;i++)
		{
		s0 = X[(i+1)&0x0f];	s0 = sigma0(s0);
		s1 = X[(i+14)&0x0f];	s1 = sigma1(s1);

		T1 = X[i&0xf] += s0 + s1 + X[(i+9)&0xf];
		T1 += h + Sigma1(e) + Ch(e,f,g) + K256[i];
		T2 = Sigma0(a) + Maj(a,b,c);
		h = g;	g = f;	f = e;	e = d + T1;
		d = c;	c = b;	b = a;	a = T1 + T2;
		}

	H[0] += a;	H[1] += b;	H[2] += c;	H[3] += d;
	H[4] += e;	H[5] += f;	H[6] += g;	H[7] += h;

	for (i = 0; i < SHA256_DIGEST_LENGTH/4; i++) {
	   HOST_l2c(H[i], res);
	}
}


