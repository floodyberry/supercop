/** Implementation of sha512 compression function, originally from openssl  */

/**The original file was modified so that it implements
 * only the compression functions. Below follows the original copyright
 * notice.
*/
/** ====================================================================
 * Copyright (c) 2004 The OpenSSL Project.  All rights reserved
 * according to the OpenSSL license [found in ../../LICENSE].
 * ====================================================================
 */
/**
 * IMPLEMENTATION NOTES.
 *
 * As you might have noticed 32-bit hash algorithms:
 *
 * - permit SHA_LONG to be wider than 32-bit (case on CRAY);
 * - optimized versions implement two transform functions: one operating
 *   on [aligned] data in host byte order and one - on data in input
 *   stream byte order;
 * - share common byte-order neutral collector and padding function
 *   implementations, ../md32_common.h;
 *
 * Neither of the above applies to this SHA-512 implementations. Reasons
 * [in reverse order] are:
 *
 * - it's the only 64-bit hash algorithm for the moment of this writing,
 *   there is no need for common collector/padding implementation [yet];
 * - by supporting only one transform function [which operates on
 *   *aligned* data in input stream byte order, big-endian in this case]
 *   we minimize burden of maintenance in two ways: a) collector/padding
 *   function is simpler; b) only one transform function to stare at;
 * - SHA_LONG64 is required to be exactly 64-bit in order to be able to
 *   apply a number of optimizations to mitigate potential performance
 *   penalties caused by previous design decision;
 *
 * Caveat lector.
 *
 * Implementation relies on the fact that "long long" is 64-bit on
 * both 32- and 64-bit platforms. If some compiler vendor comes up
 * with 128-bit long long, adjustment to sha.h would be required.
 * As this implementation relies on 64-bit integer type, it's totally
 * inappropriate for platforms which don't support it, most notably
 * 16-bit platforms.
 *					<appro@fy.chalmers.se>
 */
#include <stdlib.h>
#include <string.h>

#include <sha512.h>


/** sha512 round constants*/
static const uint64_t K512[80] = {
        U64(0x428a2f98d728ae22),U64(0x7137449123ef65cd),
        U64(0xb5c0fbcfec4d3b2f),U64(0xe9b5dba58189dbbc),
        U64(0x3956c25bf348b538),U64(0x59f111f1b605d019),
        U64(0x923f82a4af194f9b),U64(0xab1c5ed5da6d8118),
        U64(0xd807aa98a3030242),U64(0x12835b0145706fbe),
        U64(0x243185be4ee4b28c),U64(0x550c7dc3d5ffb4e2),
        U64(0x72be5d74f27b896f),U64(0x80deb1fe3b1696b1),
        U64(0x9bdc06a725c71235),U64(0xc19bf174cf692694),
        U64(0xe49b69c19ef14ad2),U64(0xefbe4786384f25e3),
        U64(0x0fc19dc68b8cd5b5),U64(0x240ca1cc77ac9c65),
        U64(0x2de92c6f592b0275),U64(0x4a7484aa6ea6e483),
        U64(0x5cb0a9dcbd41fbd4),U64(0x76f988da831153b5),
        U64(0x983e5152ee66dfab),U64(0xa831c66d2db43210),
        U64(0xb00327c898fb213f),U64(0xbf597fc7beef0ee4),
        U64(0xc6e00bf33da88fc2),U64(0xd5a79147930aa725),
        U64(0x06ca6351e003826f),U64(0x142929670a0e6e70),
        U64(0x27b70a8546d22ffc),U64(0x2e1b21385c26c926),
        U64(0x4d2c6dfc5ac42aed),U64(0x53380d139d95b3df),
        U64(0x650a73548baf63de),U64(0x766a0abb3c77b2a8),
        U64(0x81c2c92e47edaee6),U64(0x92722c851482353b),
        U64(0xa2bfe8a14cf10364),U64(0xa81a664bbc423001),
        U64(0xc24b8b70d0f89791),U64(0xc76c51a30654be30),
        U64(0xd192e819d6ef5218),U64(0xd69906245565a910),
        U64(0xf40e35855771202a),U64(0x106aa07032bbd1b8),
        U64(0x19a4c116b8d2d0c8),U64(0x1e376c085141ab53),
        U64(0x2748774cdf8eeb99),U64(0x34b0bcb5e19b48a8),
        U64(0x391c0cb3c5c95a63),U64(0x4ed8aa4ae3418acb),
        U64(0x5b9cca4f7763e373),U64(0x682e6ff3d6b2b8a3),
        U64(0x748f82ee5defb2fc),U64(0x78a5636f43172f60),
        U64(0x84c87814a1f0ab72),U64(0x8cc702081a6439ec),
        U64(0x90befffa23631e28),U64(0xa4506cebde82bde9),
        U64(0xbef9a3f7b2c67915),U64(0xc67178f2e372532b),
        U64(0xca273eceea26619c),U64(0xd186b8c721c0c207),
        U64(0xeada7dd6cde0eb1e),U64(0xf57d4f7fee6ed178),
        U64(0x06f067aa72176fba),U64(0x0a637dc5a2c898a6),
        U64(0x113f9804bef90dae),U64(0x1b710b35131c471b),
        U64(0x28db77f523047d84),U64(0x32caab7b40c72493),
        U64(0x3c9ebe0a15c9bebc),U64(0x431d67c49c100d4c),
        U64(0x4cc5d4becb3e42b6),U64(0x597f299cfc657e2a),
        U64(0x5fcb6fab3ad6faec),U64(0x6c44198c4a475817) };

/** treat rotations and endians (for sha256 treated in sha-openssl/md32_common.h)*/
#ifndef PULL64
#define B(x,j)    (((uint64_t)(*(((const unsigned char *)(&x))+j)))<<((7-j)*8) )
#define PULL64(x) (B(x,0)|B(x,1)|B(x,2)|B(x,3)|B(x,4)|B(x,5)|B(x,6)|B(x,7))
#endif

#ifndef PUSH64
#define BB(x,c,j)    (*((&c)+j)=((x>>((7-j)*8))&0xff))
#define PUSH64(x,c) (BB(x,c,0),\
                     BB(x,c,1),\
                     BB(x,c,2),\
                     BB(x,c,3),\
                     BB(x,c,4),\
                     BB(x,c,5),\
                     BB(x,c,6),\
                     BB(x,c,7))
#endif

#ifndef ROTR
#define ROTR(x,s)	(((x)>>s) | (x)<<(64-s))
#endif

#define Sigma0(x)	(ROTR((x),28) ^ ROTR((x),34) ^ ROTR((x),39))
#define Sigma1(x)	(ROTR((x),14) ^ ROTR((x),18) ^ ROTR((x),41))
#define sigma0(x)	(ROTR((x),1)  ^ ROTR((x),8)  ^ ((x)>>7))
#define sigma1(x)	(ROTR((x),19) ^ ROTR((x),61) ^ ((x)>>6))

#define Ch(x,y,z)	(((x) & (y)) ^ ((~(x)) & (z)))
#define Maj(x,y,z)	(((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)))


#if defined(__i386) || defined(__i386__) || defined(_M_IX86)
/*
 * This code should give better results on 32-bit CPU with less than
 * ~24 registers, both size and performance wise...
 */
/**
 * sha512 compression function - 32-bit machines
 * @param res The resulting hash value
 * @param hash The chaining input value
 * @param in The message input
 */
void sha512_comp (hashblock res, const hashblock hash, const messageblock in)
	{
	const uint64_t *W=in;
	uint64_t	A,E,T;
	uint64_t	X[9+80],*F;
	uint64_t H[8];
	int i;

   for (i = 0; i < SHA512_DIGEST_LENGTH/8; i++) {
	   H[i]=PULL64(hash[i*8]);
	}

	F    = X+80;
	A    = H[0];	F[1] = H[1];
	F[2] = H[2];	F[3] = H[3];
	E    = H[4];	F[5] = H[5];
	F[6] = H[6];	F[7] = H[7];

	for (i=0;i<16;i++,F--)
		{
#ifdef B_ENDIAN
		T = W[i];
#else
		T = PULL64(W[i]);
#endif
		F[0] = A;
		F[4] = E;
		F[8] = T;
		T   += F[7] + Sigma1(E) + Ch(E,F[5],F[6]) + K512[i];
		E    = F[3] + T;
		A    = T + Sigma0(A) + Maj(A,F[1],F[2]);
		}

	for (;i<80;i++,F--)
		{
		T    = sigma0(F[8+16-1]);
		T   += sigma1(F[8+16-14]);
		T   += F[8+16] + F[8+16-9];

		F[0] = A;
		F[4] = E;
		F[8] = T;
		T   += F[7] + Sigma1(E) + Ch(E,F[5],F[6]) + K512[i];
		E    = F[3] + T;
		A    = T + Sigma0(A) + Maj(A,F[1],F[2]);
		}

	H[0] += A;		H[1] += F[1];
	H[2] += F[2];	H[3] += F[3];
	H[4] += E;		H[5] += F[5];
	H[6] += F[6];	H[7] += F[7];

   for (i = 0; i < SHA512_DIGEST_LENGTH/8; i++) {
	   PUSH64(H[i],res[i*8]);
	}

	}

#else

/**
 * sha512 compression function - 64-bit machines
 * @param res The resulting hash value
 * @param hash The chaining input value
 * @param in The message input
 */
void sha512_comp (hashblock res, const hashblock hash, const messageblock in)
	{
	const uint64_t *W=in;
	uint64_t	a,b,c,d,e,f,g,h,s0,s1,T1,T2;
	uint64_t	X[16];
	uint64_t  H[8];
	int i;

   for (i = 0; i < SHA512_DIGEST_LENGTH/8; i++) {
	   H[i]=PULL64(hash[i*8]);
	}


	a = H[0];	b = H[1];	c = H[2];	d = H[3];
	e = H[4];	f = H[5];	g = H[6];	h = H[7];

	for (i=0;i<16;i++)
		{
#ifdef B_ENDIAN
		T1 = X[i] = W[i];
#else
		T1 = X[i] = PULL64(W[i]);
#endif
		T1 += h + Sigma1(e) + Ch(e,f,g) + K512[i];
		T2 = Sigma0(a) + Maj(a,b,c);
		h = g;	g = f;	f = e;	e = d + T1;
		d = c;	c = b;	b = a;	a = T1 + T2;
		}

	for (;i<80;i++)
		{
		s0 = X[(i+1)&0x0f];	s0 = sigma0(s0);
		s1 = X[(i+14)&0x0f];	s1 = sigma1(s1);

		T1 = X[i&0xf] += s0 + s1 + X[(i+9)&0xf];
		T1 += h + Sigma1(e) + Ch(e,f,g) + K512[i];
		T2 = Sigma0(a) + Maj(a,b,c);
		h = g;	g = f;	f = e;	e = d + T1;
		d = c;	c = b;	b = a;	a = T1 + T2;
		}

	H[0] += a;	H[1] += b;	H[2] += c;	H[3] += d;
	H[4] += e;	H[5] += f;	H[6] += g;	H[7] += h;

   for (i = 0; i < SHA512_DIGEST_LENGTH/8; i++) {
	   PUSH64(H[i],res[i*8]);
	}

	}



#endif



#if defined(PEDANTIC) || defined(__DECC) || defined(OPENSSL_SYS_MACOSX)
static void *dummy=&dummy;
#endif

