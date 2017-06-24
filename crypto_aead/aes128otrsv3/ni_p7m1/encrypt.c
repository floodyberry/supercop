/* Copyright (c) 2014, NEC Corporation. All rights reserved.
*
* LICENSE
*
* 1. NEC Corporation ("NEC") hereby grants users to use and reproduce 
*AES-OTR program ("Software") for testing and evaluation purpose for 
*CAESAR (Competition for Authenticated Encryption: Security, Applicability, 
*and Robustness). The users must not use the Software for any other purpose 
*or distribute it to any third party.
*
* 2. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
*OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
*FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL NEC 
*BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, OR CONSEQUENTIAL 
*DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
*ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OF THE 
*SOFTWARE.
*
* 3. In the event of an user's failure to comply with any term of this License 
*or wrongful act, NEC may terminate such user's use of the Software. Upon such 
*termination the user must cease all use of the Software and destroy all copies 
*of the Software.
*
* 4. The users shall comply with all applicable laws and regulations, including 
*export and import control laws, which govern the usage of the Software.
*/

/* AES-OTR v3, AES-NI with doubling routine from [MSK15] */
/* [MSK15] AES-OTR v2.0, Kazuhiko Minematsu, Maki Shigeri, and Hiroyasu Kubo, DIAC 2015 */

#include "crypto_aead.h" /* for SUPERCOP */
#include <string.h>// memset, memcmp
#include <wmmintrin.h>
#include <tmmintrin.h>// _mm_shuffle_epi8
#include <smmintrin.h>// _mm_extract_epi8
#include "api.h"
#include "otr.h"
#include "doubling.h"

/*
** defines
*/
#define ROUND   (CRYPTO_KEYBYTES==16?10:14)
#define EK_SZ (ROUND+1) 
#define le(b) _mm_shuffle_epi8(b,_mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)) /*LE conversion*/
/*
** internal variables
*/
block Q;
block encrypt_key[EK_SZ];

/*
** AES key schedule macro
*/
#define EXPAND_ASSIST(v1,v2,v3,v4,shuff_const,aes_const)                    \
    v2 = _mm_aeskeygenassist_si128(v4,aes_const);                           \
    v3 = _mm_castps_si128(_mm_shuffle_ps(_mm_castsi128_ps(v3),              \
                                         _mm_castsi128_ps(v1), 16));        \
    v1 = _mm_xor_si128(v1,v3);                                              \
    v3 = _mm_castps_si128(_mm_shuffle_ps(_mm_castsi128_ps(v3),              \
                                         _mm_castsi128_ps(v1), 140));       \
    v1 = _mm_xor_si128(v1,v3);                                              \
    v2 = _mm_shuffle_epi32(v2,shuff_const);                                 \
    v1 = _mm_xor_si128(v1,v2)

/*
** AES-256 key schedule
*/
__inline__ static void AES_256_Key_Expansion(
	const unsigned char *userKey,
	__m128i *key)
{
	__m128i x0, x1, x2, x3, *kp = key;
	kp[0] = x0 = _mm_loadu_si128((__m128i*)userKey);
	kp[1] = x3 = _mm_loadu_si128((__m128i*)(userKey + 16));
	x2 = _mm_setzero_si128();
	EXPAND_ASSIST(x0, x1, x2, x3, 255, 1);  kp[2] = x0;
	EXPAND_ASSIST(x3, x1, x2, x0, 170, 1);  kp[3] = x3;
	EXPAND_ASSIST(x0, x1, x2, x3, 255, 2);  kp[4] = x0;
	EXPAND_ASSIST(x3, x1, x2, x0, 170, 2);  kp[5] = x3;
	EXPAND_ASSIST(x0, x1, x2, x3, 255, 4);  kp[6] = x0;
	EXPAND_ASSIST(x3, x1, x2, x0, 170, 4);  kp[7] = x3;
	EXPAND_ASSIST(x0, x1, x2, x3, 255, 8);  kp[8] = x0;
	EXPAND_ASSIST(x3, x1, x2, x0, 170, 8);  kp[9] = x3;
	EXPAND_ASSIST(x0, x1, x2, x3, 255, 16); kp[10] = x0;
	EXPAND_ASSIST(x3, x1, x2, x0, 170, 16); kp[11] = x3;
	EXPAND_ASSIST(x0, x1, x2, x3, 255, 32); kp[12] = x0;
	EXPAND_ASSIST(x3, x1, x2, x0, 170, 32); kp[13] = x3;
	EXPAND_ASSIST(x0, x1, x2, x3, 255, 64); kp[14] = x0;
}
/*
** AES-128 key schedule
*/
static void AES_128_Key_Expansion(
	const unsigned char *userkey,
	void *key)
{
	__m128i x0, x1, x2;
	__m128i *kp = (__m128i *)key;
	kp[0] = x0 = _mm_loadu_si128((__m128i*)userkey);
	x2 = _mm_setzero_si128();
	EXPAND_ASSIST(x0, x1, x2, x0, 255, 1);   kp[1] = x0;
	EXPAND_ASSIST(x0, x1, x2, x0, 255, 2);   kp[2] = x0;
	EXPAND_ASSIST(x0, x1, x2, x0, 255, 4);   kp[3] = x0;
	EXPAND_ASSIST(x0, x1, x2, x0, 255, 8);   kp[4] = x0;
	EXPAND_ASSIST(x0, x1, x2, x0, 255, 16);  kp[5] = x0;
	EXPAND_ASSIST(x0, x1, x2, x0, 255, 32);  kp[6] = x0;
	EXPAND_ASSIST(x0, x1, x2, x0, 255, 64);  kp[7] = x0;
	EXPAND_ASSIST(x0, x1, x2, x0, 255, 128); kp[8] = x0;
	EXPAND_ASSIST(x0, x1, x2, x0, 255, 27);  kp[9] = x0;
	EXPAND_ASSIST(x0, x1, x2, x0, 255, 54);  kp[10] = x0;
}
/*
** AES-128/256 encrypt
*/
__inline__ static void AES_encrypt(
	__m128i in,
	__m128i *out,
	const __m128i *key)
{
	__m128i tmp = _mm_load_si128(&in);
	tmp = _mm_xor_si128(tmp, key[0]);
	tmp = _mm_aesenc_si128(tmp, key[1]);
	tmp = _mm_aesenc_si128(tmp, key[2]);
	tmp = _mm_aesenc_si128(tmp, key[3]);
	tmp = _mm_aesenc_si128(tmp, key[4]);
	tmp = _mm_aesenc_si128(tmp, key[5]);
	tmp = _mm_aesenc_si128(tmp, key[6]);
	tmp = _mm_aesenc_si128(tmp, key[7]);
	tmp = _mm_aesenc_si128(tmp, key[8]);
	tmp = _mm_aesenc_si128(tmp, key[9]);
#if (ROUND==10)
	*out = _mm_aesenclast_si128(tmp, key[10]);
#elif (ROUND==14)
	tmp = _mm_aesenc_si128(tmp, key[10]);
	tmp = _mm_aesenc_si128(tmp, key[11]);
	tmp = _mm_aesenc_si128(tmp, key[12]);
	tmp = _mm_aesenc_si128(tmp, key[13]);
	*out = _mm_aesenclast_si128(tmp, key[14]);
#endif
}
/*
** AES-128/256 batch encrypt for PIPE blocks
*/
__inline__ static void AES_ecb_encrypt_PIPE(
	__m128i *blks,
	const __m128i *key)
{
	unsigned j;
	blks[0] = _mm_xor_si128(blks[0], key[0]);
	blks[1] = _mm_xor_si128(blks[1], key[0]);
	blks[2] = _mm_xor_si128(blks[2], key[0]);
	blks[3] = _mm_xor_si128(blks[3], key[0]);
#if (PIPE>=5)
	blks[4] = _mm_xor_si128(blks[4], key[0]);
#endif
#if (PIPE>=6)
	blks[5] = _mm_xor_si128(blks[5], key[0]);
#endif
#if (PIPE>=7)
	blks[6] = _mm_xor_si128(blks[6], key[0]);
#endif
#if (PIPE==8)
	blks[7] = _mm_xor_si128(blks[7], key[0]);
#endif
	for (j = 1; j<ROUND; ++j) {
		blks[0] = _mm_aesenc_si128(blks[0], key[j]);
		blks[1] = _mm_aesenc_si128(blks[1], key[j]);
		blks[2] = _mm_aesenc_si128(blks[2], key[j]);
		blks[3] = _mm_aesenc_si128(blks[3], key[j]);
#if (PIPE>=5)
		blks[4] = _mm_aesenc_si128(blks[4], key[j]);
#endif
#if (PIPE>=6)
		blks[5] = _mm_aesenc_si128(blks[5], key[j]);
#endif
#if (PIPE>=7)
		blks[6] = _mm_aesenc_si128(blks[6], key[j]);
#endif
#if (PIPE==8)
		blks[7] = _mm_aesenc_si128(blks[7], key[j]);
#endif
	}
	blks[0] = _mm_aesenclast_si128(blks[0], key[j]);
	blks[1] = _mm_aesenclast_si128(blks[1], key[j]);
	blks[2] = _mm_aesenclast_si128(blks[2], key[j]);
	blks[3] = _mm_aesenclast_si128(blks[3], key[j]);
#if (PIPE>=5)
	blks[4] = _mm_aesenclast_si128(blks[4], key[j]);
#endif
#if (PIPE>=6)
	blks[5] = _mm_aesenclast_si128(blks[5], key[j]);
#endif
#if (PIPE>=7)
	blks[6] = _mm_aesenclast_si128(blks[6], key[j]);
#endif
#if (PIPE==8)
	blks[7] = _mm_aesenclast_si128(blks[7], key[j]);
#endif
}

/*
** batch doubling from [MSK15]
*/
__inline__ static void mul2_PIPE(__m128i *dat) {
	unsigned a, b;
	block tmp = le(dat[0]);
	block carry[PIPE];
	block up4, up8;

	const block sh1 = _mm_set_epi8(255, 255, 255, 255, 255, 255, 15, 14, 255, 255, 255, 255, 255, 255, 7, 6);
	const block sh2 = _mm_set_epi8(255, 255, 255, 255, 255, 255, 13, 12, 255, 255, 255, 255, 255, 255, 5, 4);
	const block sh3 = _mm_set_epi8(255, 255, 255, 255, 255, 255, 11, 10, 255, 255, 255, 255, 255, 255, 3, 2);
	const block sh4 = _mm_set_epi8(255, 255, 255, 255, 255, 255, 9, 8, 255, 255, 255, 255, 255, 255, 1, 0);
	const block *Txp = (const block*)TX;
	const block *Typ = (const block*)TY;

	a = _mm_extract_epi8(tmp, 15);
	b = _mm_extract_epi8(tmp, 7);
	up4 = _mm_unpacklo_epi64(Txp[a], Typ[b]);
	up8 = _mm_unpackhi_epi64(Txp[a], Typ[b]);
	carry[0] = _mm_shuffle_epi8(up4, sh1);
	carry[1] = _mm_shuffle_epi8(up4, sh2);
	carry[2] = _mm_shuffle_epi8(up4, sh3);
	carry[3] = _mm_shuffle_epi8(up4, sh4);
#if(PIPE>=5)
	carry[4] = _mm_shuffle_epi8(up8, sh1);
#endif
#if(PIPE>=6)
	carry[5] = _mm_shuffle_epi8(up8, sh2);
#endif
#if(PIPE>=7)
	carry[6] = _mm_shuffle_epi8(up8, sh3);
#endif
#if(PIPE==8)
	carry[7] = _mm_shuffle_epi8(up8, sh4);
#endif
	dat[1] = _mm_slli_epi64(tmp, 1);
	dat[2] = _mm_slli_epi64(tmp, 2);
	dat[3] = _mm_slli_epi64(tmp, 3);
	dat[4] = _mm_slli_epi64(tmp, 4);
#if(PIPE>=5)
	dat[5] = _mm_slli_epi64(tmp, 5);
#endif
#if(PIPE>=6)
	dat[6] = _mm_slli_epi64(tmp, 6);
#endif
#if(PIPE>=7)
	dat[7] = _mm_slli_epi64(tmp, 7);
#endif
#if (PIPE==8)
	dat[8] = (_mm_slli_epi64(tmp, 8));
#endif
	dat[1] = le(_mm_xor_si128(dat[1], carry[0]));
	dat[2] = le(_mm_xor_si128(dat[2], carry[1]));
	dat[3] = le(_mm_xor_si128(dat[3], carry[2]));
	dat[4] = le(_mm_xor_si128(dat[4], carry[3]));
#if(PIPE>=5)
	dat[5] = le(_mm_xor_si128(dat[5], carry[4]));
#endif
#if(PIPE>=6)
	dat[6] = le(_mm_xor_si128(dat[6], carry[5]));
#endif
#if(PIPE>=7)
	dat[7] = le(_mm_xor_si128(dat[7], carry[6]));
#endif
#if (PIPE==8)
	dat[8] = le(_mm_xor_si128(dat[8], carry[7]));
#endif
}
/*
** doubling (multiply by x over GF(2^n))
*/
__inline__ static void mul2(__m128i in, __m128i *out) {
	const __m128i shuf = _mm_set_epi8(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
	const __m128i mask = _mm_set_epi32(135, 1, 1, 1);
	block intmp = _mm_shuffle_epi8(in, shuf);
	block tmp = _mm_srai_epi32(intmp, 31);
	tmp = _mm_and_si128(tmp, mask);
	tmp = _mm_shuffle_epi32(tmp, _MM_SHUFFLE(2, 1, 0, 3));
	*out = _mm_slli_epi32(intmp, 1);
	*out = _mm_xor_si128(*out, tmp);
	*out = _mm_shuffle_epi8(*out, shuf);
}

__inline__ static void mul4(__m128i in, __m128i *out) {
	const __m128i shuf = _mm_set_epi8(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
	const __m128i mask = _mm_set_epi32(135, 1, 1, 1);
	block intmp = _mm_shuffle_epi8(in, shuf);
	block tmp = _mm_srai_epi32(intmp, 31);
	tmp = _mm_and_si128(tmp, mask);
	tmp = _mm_shuffle_epi32(tmp, _MM_SHUFFLE(2, 1, 0, 3));
	*out = _mm_slli_epi32(intmp, 1);
	*out = _mm_xor_si128(*out, tmp);
	tmp = _mm_srai_epi32(*out, 31);
	tmp = _mm_and_si128(tmp, mask);
	tmp = _mm_shuffle_epi32(tmp, _MM_SHUFFLE(2, 1, 0, 3));
	*out = _mm_slli_epi32(*out, 1);
	*out = _mm_xor_si128(*out, tmp);
	*out = _mm_shuffle_epi8(*out, shuf);
}

__inline__ static void mul3(__m128i in, __m128i *out) {
	const __m128i shuf = _mm_set_epi8(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
	const __m128i mask = _mm_set_epi32(135, 1, 1, 1);
	block intmp = _mm_shuffle_epi8(in, shuf);
	block tmp = _mm_srai_epi32(intmp, 31);
	tmp = _mm_and_si128(tmp, mask);
	tmp = _mm_shuffle_epi32(tmp, _MM_SHUFFLE(2, 1, 0, 3));
	*out = _mm_slli_epi32(intmp, 1);
	*out = _mm_xor_si128(*out, tmp);
	*out = _mm_xor_si128(*out, intmp);
	*out = _mm_shuffle_epi8(*out, shuf);
}
__inline__ static void mul3twice(__m128i in, __m128i *out){
	__m128i tmp;
	mul4(in, &tmp);
	*out = _mm_xor_si128(in, tmp);
}

__inline__ static void mul7(__m128i in, __m128i *out){
	__m128i tmp;
	mul2(in, &tmp);
	*out = _mm_xor_si128(in, tmp);
	mul2(tmp, &tmp);
	*out = _mm_xor_si128(*out, tmp);
}
/*
ozp: 100...0 padding for 16-byte block
*/
__inline__ static  void ozp(uint32 length, const uint8 *in, __m128i *out){
	ALIGN(16)uint8 tmp[BLOCK + 1] = { 0 };
	memcpy(tmp, in, length);
	tmp[length] = 0x80;
	*out = _mm_load_si128((__m128i*)tmp);
}
/*
** XOR of full and partial blocks 
*/
__inline__ static void xorp(uint32 length, const __m128i *x, const uint8 *y, uint8 *z){
	__m128i tmp = _mm_setzero_si128();
	memcpy((uint8*)&tmp, y, length);
	tmp = _mm_xor_si128(*x, tmp);
	memcpy(z, (uint8*)&tmp, length);
}
/*
Setup : AES (enc) key schedule and generate authentication masks
*/
int Setup(const uint8 *skey)
{
	const block cst = _mm_setzero_si128();

#if(KEY_SZ == 128)
	AES_128_Key_Expansion(skey, encrypt_key);
#elif(KEY_SZ == 256)
	AES_256_Key_Expansion(skey, encrypt_key);
#endif
	AES_encrypt(cst, &Q, encrypt_key);
	return SUCCESS;
}
/*
EFunc : OTR Core Encryption Function, with nonce encryption 
*/
__m128i EFunc(
	const uint8 *nonce,
	uint32 nonce_len,
#if(ADP==Seri)
	const __m128i TA,
#endif
	const uint8 *plaintext,
	uint32 pl_len,
	uint32 t_len,
	uint8 *ciphertext)
{
	uint32 i, j;
	uint32 ell = 0; //number of 2BLOCK-byte chunks, excl. last one
	uint32 last = 0; //number of bytes in the last chunks

	block Sum = _mm_setzero_si128();
	block txt[PIPE], Ln[PIPE + 1];
	uint32 rest_len = pl_len;
	const __m128i *ptp = (__m128i*)plaintext;
	__m128i *ctp = (__m128i*)ciphertext;
	ALIGN(16)uint8 tmp[BLOCK] = { 0 };
	block *La;

	/* Encryption of nonce */
	memcpy(&tmp[BLOCK - nonce_len], nonce, nonce_len);
	tmp[0] = (uint8)((t_len%BLOCK) << 4);
	tmp[BLOCK - nonce_len - 1] |= 0x01;
	Ln[0] = _mm_load_si128((__m128i*)tmp);
	AES_encrypt(Ln[0], &Ln[0], encrypt_key);
#if (ADP==Seri)
	Ln[0] = _mm_xor_si128(Ln[0], TA);
	mul2(Ln[0], &Ln[0]);
#endif

	/* Encryption of plaintext */
	while (rest_len > (DBLOCK*PIPE)){
		/* first round*/
		mul2_PIPE(Ln);
		txt[0] = _mm_xor_si128(Ln[0], ptp[0]); 
		txt[1] = _mm_xor_si128(Ln[1], ptp[2]);
		txt[2] = _mm_xor_si128(Ln[2], ptp[4]);
		txt[3] = _mm_xor_si128(Ln[3], ptp[6]);
#if (PIPE>=5)
		txt[4] = _mm_xor_si128(Ln[4], ptp[8]);
#endif
#if (PIPE>=6)
		txt[5] = _mm_xor_si128(Ln[5], ptp[10]);
#endif
#if (PIPE>=7)
		txt[6] = _mm_xor_si128(Ln[6], ptp[12]);
#endif
#if (PIPE==8)
		txt[7] = _mm_xor_si128(Ln[7], ptp[14]);
#endif
		AES_ecb_encrypt_PIPE(txt, encrypt_key);
		/* second round*/
		for (j = 0; j < PIPE; j++){
			Ln[j] = _mm_xor_si128(Ln[j], Ln[j + 1]);
		}
		ctp[0] = _mm_xor_si128(txt[0], ptp[1]);
		txt[0] = _mm_xor_si128(Ln[0], ctp[0]);
		ctp[2] = _mm_xor_si128(txt[1], ptp[3]);
		txt[1] = _mm_xor_si128(Ln[1], ctp[2]);
		ctp[4] = _mm_xor_si128(txt[2], ptp[5]);
		txt[2] = _mm_xor_si128(Ln[2], ctp[4]);
		ctp[6] = _mm_xor_si128(txt[3], ptp[7]);
		txt[3] = _mm_xor_si128(Ln[3], ctp[6]);
#if (PIPE>=5)
		ctp[8] = _mm_xor_si128(txt[4], ptp[9]);
		txt[4] = _mm_xor_si128(Ln[4], ctp[8]);
#endif
#if (PIPE>=6)
		ctp[10] = _mm_xor_si128(txt[5], ptp[11]);
		txt[5] = _mm_xor_si128(Ln[5], ctp[10]);
#endif
#if (PIPE>=7)
		ctp[12] = _mm_xor_si128(txt[6], ptp[13]);
		txt[6] = _mm_xor_si128(Ln[6], ctp[12]);
#endif
#if (PIPE==8)
		ctp[14] = _mm_xor_si128(txt[7], ptp[15]);
		txt[7] = _mm_xor_si128(Ln[7], ctp[14]);
#endif
		AES_ecb_encrypt_PIPE(txt, encrypt_key);
		ctp[1] = _mm_xor_si128(txt[0], ptp[0]);
		Sum = _mm_xor_si128(Sum, ptp[1]);
		ctp[3] = _mm_xor_si128(txt[1], ptp[2]);
		Sum = _mm_xor_si128(Sum, ptp[3]);
		ctp[5] = _mm_xor_si128(txt[2], ptp[4]);
		Sum = _mm_xor_si128(Sum, ptp[5]);
		ctp[7] = _mm_xor_si128(txt[3], ptp[6]);
		Sum = _mm_xor_si128(Sum, ptp[7]);
#if (PIPE>=5)
		ctp[9] = _mm_xor_si128(txt[4], ptp[8]);
		Sum = _mm_xor_si128(Sum, ptp[9]);
#endif
#if (PIPE>=6)
		ctp[11] = _mm_xor_si128(txt[5], ptp[10]);
		Sum = _mm_xor_si128(Sum, ptp[11]);
#endif
#if (PIPE>=7)
		ctp[13] = _mm_xor_si128(txt[6], ptp[12]);
		Sum = _mm_xor_si128(Sum, ptp[13]);
#endif
#if (PIPE==8)
		ctp[15] = _mm_xor_si128(txt[7], ptp[14]);
		Sum = _mm_xor_si128(Sum, ptp[15]);
#endif
		Ln[0] = _mm_load_si128(&Ln[PIPE]);
		ptp += (2 * PIPE);
		ctp += (2 * PIPE);
		rest_len -= (DBLOCK*PIPE);
	}

	if (rest_len != 0){
		last = rest_len % DBLOCK;
		if (last == 0) last = DBLOCK;
		ell = (rest_len - last) / DBLOCK; // plaintext length = 2BLOCK*ell + last (non-zero)
	}

	/* 2-round Feistel for the full chunks */
	mul3(Ln[0], &Ln[1]);
	for (i = 0; i < (2 * ell); i += 2){
		txt[0] = _mm_xor_si128(Ln[0], ptp[i]);
		AES_encrypt(txt[0], &txt[0], encrypt_key);
		ctp[i] = _mm_xor_si128(txt[0], ptp[i + 1]);
		txt[0] = _mm_xor_si128(Ln[1], ctp[i]);
		AES_encrypt(txt[0], &txt[0], encrypt_key);
		ctp[i + 1] = _mm_xor_si128(txt[0], ptp[i]);
		Sum = _mm_xor_si128(Sum, ptp[i + 1]);
		Ln[0] = _mm_xor_si128(Ln[0], Ln[1]);
		mul2(Ln[1], &Ln[1]);
	}
	ptp += (2 * ell);
	ctp += (2 * ell);
	/* Last chunk */
	if (last <= BLOCK){ 	//odd block, including the case pl_len = 0 (no plaintext)
		AES_encrypt(Ln[0], &txt[0], encrypt_key);//txt[0] is Z
		xorp(last, &txt[0], (uint8*)ptp, (uint8*)ctp);
		ozp(last, (uint8*)ptp, &txt[0]);
		Sum = _mm_xor_si128(txt[0], Sum);
		La = &Ln[0];
	}
	else{//even blocks, last > BLOCK always holds. 2-round Feistel with last swap
		txt[0] = _mm_xor_si128(Ln[0], ptp[0]);
		AES_encrypt(txt[0], &txt[1], encrypt_key); //txt[1] is Z
		xorp(last - BLOCK, &txt[1], (uint8*)&ptp[1], (uint8*)&ctp[1]);
		ozp(last - BLOCK, (uint8*)&ctp[1], &txt[0]); //txt[0] = ozp(C[lastblock])
		Sum = _mm_xor_si128(Sum, txt[0]);
		Sum = _mm_xor_si128(Sum, txt[1]);
		txt[0] = _mm_xor_si128(Ln[1], txt[0]); //txt[0] = Lsharp + ozp(C[lastblock])
		AES_encrypt(txt[0], &txt[0], encrypt_key);
		ctp[0] = _mm_xor_si128(txt[0], ptp[0]);
		La = &Ln[1];
	}
	/* TE generation */
	if (last == BLOCK || last == DBLOCK){//last = 16 or 32
		mul7(*La, La);
	}
	else{
		mul3twice(*La, La);
	}
	Sum = _mm_xor_si128(Sum, *La);	//Sum = (3^2 or 7)L* xor Sum
	AES_encrypt(Sum, &Sum, encrypt_key);
	return Sum; //TE
}
/*
DFunc : OTR Core Decryption Function, with nonce encryption 
*/
__m128i DFunc(
	const uint8 *nonce,
	uint32 nonce_len,
#if(ADP==Seri)
	const __m128i TA,
#endif
	const uint8 *ciphertext,
	uint32 ci_len,
	uint32 t_len,
	uint8 *plaintext)
{
	uint32 i;
	uint32 ell = 0; //number of 2BLOCK-byte chunks, excl. last one
	uint32 last = 0; //number of bytes in the last chunks

	block Sum = _mm_setzero_si128();
	block txt[PIPE], Ln[PIPE + 1];
	uint32 rest_len = ci_len;
	__m128i *ptp = (__m128i*)plaintext;
	const __m128i *ctp = (__m128i*)ciphertext;
	ALIGN(16)uint8 tmp[BLOCK] = { 0 };
	block *La;

	/* Encryption of nonce */
	memcpy(&tmp[BLOCK - nonce_len], nonce, nonce_len);
	tmp[0] = (uint8)((t_len%BLOCK) << 4);
	tmp[BLOCK - nonce_len - 1] |= 0x01;
	Ln[0] = _mm_load_si128((__m128i*)tmp);
	AES_encrypt(Ln[0], &Ln[0], encrypt_key);

#if (ADP==Seri)
	Ln[0] = _mm_xor_si128(Ln[0], TA);
	mul2(Ln[0], &Ln[0]);
#endif
	while (rest_len > (DBLOCK*PIPE)){
		/* first round*/
		mul2_PIPE(Ln);
		txt[0] = _mm_xor_si128(Ln[0], ctp[0]);
		txt[0] = _mm_xor_si128(Ln[1], txt[0]); 
		txt[1] = _mm_xor_si128(Ln[1], ctp[2]);
		txt[1] = _mm_xor_si128(Ln[2], txt[1]); 
		txt[2] = _mm_xor_si128(Ln[2], ctp[4]);
		txt[2] = _mm_xor_si128(Ln[3], txt[2]); 
		txt[3] = _mm_xor_si128(Ln[3], ctp[6]);
		txt[3] = _mm_xor_si128(Ln[4], txt[3]); 
#if (PIPE>=5)
		txt[4] = _mm_xor_si128(Ln[4], ctp[8]);
		txt[4] = _mm_xor_si128(Ln[5], txt[4]); 
#endif
#if (PIPE>=6)
		txt[5] = _mm_xor_si128(Ln[5], ctp[10]);
		txt[5] = _mm_xor_si128(Ln[6], txt[5]); 
#endif
#if (PIPE>=7)
		txt[6] = _mm_xor_si128(Ln[6], ctp[12]);
		txt[6] = _mm_xor_si128(Ln[7], txt[6]); 
#endif
#if (PIPE==8)
		txt[7] = _mm_xor_si128(Ln[7], ctp[14]);
		txt[7] = _mm_xor_si128(Ln[8], txt[7]); 
#endif
		AES_ecb_encrypt_PIPE(txt, encrypt_key);
		/* second round*/
		ptp[0] = _mm_xor_si128(txt[0], ctp[1]);
		txt[0] = _mm_xor_si128(Ln[0], ptp[0]);
		ptp[2] = _mm_xor_si128(txt[1], ctp[3]);
		txt[1] = _mm_xor_si128(Ln[1], ptp[2]);
		ptp[4] = _mm_xor_si128(txt[2], ctp[5]);
		txt[2] = _mm_xor_si128(Ln[2], ptp[4]);
		ptp[6] = _mm_xor_si128(txt[3], ctp[7]);
		txt[3] = _mm_xor_si128(Ln[3], ptp[6]);
#if (PIPE>=5)
		ptp[8] = _mm_xor_si128(txt[4], ctp[9]);
		txt[4] = _mm_xor_si128(Ln[4], ptp[8]);
#endif
#if (PIPE>=6)
		ptp[10] = _mm_xor_si128(txt[5], ctp[11]);
		txt[5] = _mm_xor_si128(Ln[5], ptp[10]);
#endif
#if (PIPE>=7)
		ptp[12] = _mm_xor_si128(txt[6], ctp[13]);
		txt[6] = _mm_xor_si128(Ln[6], ptp[12]);
#endif
#if (PIPE==8)
		ptp[14] = _mm_xor_si128(txt[7], ctp[15]);
		txt[7] = _mm_xor_si128(Ln[7], ptp[14]);
#endif
		AES_ecb_encrypt_PIPE(txt, encrypt_key);
		ptp[1] = _mm_xor_si128(txt[0], ctp[0]);
		Sum = _mm_xor_si128(Sum, ptp[1]);
		ptp[3] = _mm_xor_si128(txt[1], ctp[2]);
		Sum = _mm_xor_si128(Sum, ptp[3]);
		ptp[5] = _mm_xor_si128(txt[2], ctp[4]);
		Sum = _mm_xor_si128(Sum, ptp[5]);
		ptp[7] = _mm_xor_si128(txt[3], ctp[6]);
		Sum = _mm_xor_si128(Sum, ptp[7]);
#if (PIPE>=5)
		ptp[9] = _mm_xor_si128(txt[4], ctp[8]);
		Sum = _mm_xor_si128(Sum, ptp[9]);
#endif
#if (PIPE>=6)
		ptp[11] = _mm_xor_si128(txt[5], ctp[10]);
		Sum = _mm_xor_si128(Sum, ptp[11]);
#endif
#if (PIPE>=7)
		ptp[13] = _mm_xor_si128(txt[6], ctp[12]);
		Sum = _mm_xor_si128(Sum, ptp[13]);
#endif
#if (PIPE==8)
		ptp[15] = _mm_xor_si128(txt[7], ctp[14]);
		Sum = _mm_xor_si128(Sum, ptp[15]);
#endif
		Ln[0] = _mm_load_si128(&Ln[PIPE]);
		ptp += (2 * PIPE);
		ctp += (2 * PIPE);
		rest_len -= (DBLOCK*PIPE);
	}

	if (rest_len != 0){
		last = rest_len % DBLOCK;
		if (last == 0) last = DBLOCK;
		ell = (rest_len - last) / DBLOCK; // plaintext length = 2BLOCK*ell + last (non-zero)
	}

	/* 2-round Feistel for the full chunks */
	mul3(Ln[0], &Ln[1]);
	for (i = 0; i < (2 * ell); i += 2){
		txt[0] = _mm_xor_si128(Ln[1], ctp[i]);
		AES_encrypt(txt[0], &txt[0], encrypt_key);
		ptp[i] = _mm_xor_si128(txt[0], ctp[i + 1]);
		txt[0] = _mm_xor_si128(Ln[0], ptp[i]);
		AES_encrypt(txt[0], &txt[0], encrypt_key);
		ptp[i + 1] = _mm_xor_si128(txt[0], ctp[i]);
		Sum = _mm_xor_si128(Sum, ptp[i + 1]);
		Ln[0] = _mm_xor_si128(Ln[0], Ln[1]);
		mul2(Ln[1], &Ln[1]);
	}
	ptp += (2 * ell);
	ctp += (2 * ell);
	/* Last chunk */
	if (last <= BLOCK){ 	//odd block, including the case pl_len = 0 (no plaintext)
		AES_encrypt(Ln[0], &txt[0], encrypt_key); //txt[0] is Z
		xorp(last, &txt[0], (uint8*)&ctp[0], (uint8*)&ptp[0]);
		ozp(last, (uint8*)&ptp[0], &txt[0]);
		Sum = _mm_xor_si128(txt[0], Sum);
		La = &Ln[0];
	}
	else{//even blocks, last > BLOCK always holds. 2-round Feistel with last swap
		ozp(last - BLOCK, (uint8*)&ctp[1], &txt[0]);
		Sum = _mm_xor_si128(Sum, txt[0]);
		txt[0] = _mm_xor_si128(Ln[1], txt[0]);
		AES_encrypt(txt[0], &txt[0], encrypt_key);
		ptp[0] = _mm_xor_si128(txt[0], ctp[0]);
		txt[0] = _mm_xor_si128(Ln[0], ptp[0]);
		AES_encrypt(txt[0], &txt[1], encrypt_key); //txt[1] is Z
		xorp(last - BLOCK, &txt[1], (uint8*)&ctp[1], (uint8*)&ptp[1]);
		Sum = _mm_xor_si128(Sum, txt[1]);
		La = &Ln[1];
	}
	/* TE generation */
	if (last == BLOCK || last == DBLOCK){//last = 16 or 32
		mul7(*La, La);
	}
	else{
		mul3twice(*La, La);
	}
	Sum = _mm_xor_si128(Sum, *La);	//Sum = (3^2 or 7)L* xor Sum
	AES_encrypt(Sum, &Sum, encrypt_key);
	return Sum;//TE
}//end of DFunc
/*
AFunc : OTR Core Authentication Function (ADP=p)
*/
__m128i AFunc(
	const uint8 *header,
	uint32 h_len)
{
	uint32 i;
	uint32 m, last;
	block tmp[PIPE], mask[PIPE + 1], ASum = _mm_setzero_si128();
	uint32 rest_len = h_len;
	const __m128i *hdp = (__m128i*)header;

	mask[0] = _mm_load_si128(&Q);
	while (rest_len > (BLOCK*PIPE)){
		mul2_PIPE(mask);
		for (i = 0; i < PIPE; i++){
			tmp[i] = _mm_xor_si128(mask[i], hdp[i]);
		}
		AES_ecb_encrypt_PIPE(tmp, encrypt_key);
		for (i = 0; i < PIPE; i++){
			ASum = _mm_xor_si128(ASum, tmp[i]);
		}
		rest_len -= (BLOCK*PIPE);
		hdp += PIPE;
		mask[0] = _mm_load_si128(&mask[PIPE]);
	}

	last = rest_len % BLOCK;
	if (last == 0) last = BLOCK;
	m = (rest_len - last) / BLOCK; //header = m blocks + last bytes

	for (i = 0; i < m; i++){
		tmp[0] = _mm_xor_si128(mask[0], hdp[i]);
		AES_encrypt(tmp[0], &tmp[0], encrypt_key);
		ASum = _mm_xor_si128(ASum, tmp[0]);
		mul2(mask[0], &mask[0]);
	}
	hdp += m;
	/* last block */
	ozp(last, (uint8*)&hdp[0], &tmp[0]);
	ASum = _mm_xor_si128(ASum, tmp[0]);
	if (last != BLOCK){
		mul3(mask[0], &mask[0]);
	}
	else{
		mul3twice(mask[0], &mask[0]);
	}
	ASum = _mm_xor_si128(ASum, mask[0]);
	AES_encrypt(ASum, &ASum, encrypt_key);
	return ASum; //TA
}
/*
AFuncS : OTR Core Authentication Function (ADP=s)
*/
__m128i AFuncS(
	const uint8 *header,
	uint32 h_len)
{
	uint32 i;
	uint32 m, last;
	block chain = _mm_setzero_si128(), tmp, mask;
	const __m128i *hdp = (__m128i*)header;

	last = h_len % BLOCK;
	if (last == 0) last = BLOCK;
	m = (h_len - last) / BLOCK; //header = m blocks + last bytes

	for (i = 0; i < m; i++){
		chain = _mm_xor_si128(chain, hdp[i]);
		AES_encrypt(chain, &chain, encrypt_key);
	}
	hdp += m;
	/* last block */
	ozp(last, (uint8*)&hdp[0], &tmp);
	chain = _mm_xor_si128(tmp, chain);
	if (last != BLOCK){
		mul2(Q, &mask);
	}
	else{
		mul4(Q, &mask);
	}
	chain = _mm_xor_si128(chain, mask);
	AES_encrypt(chain, &chain, encrypt_key);
	return chain; //TA
}

int crypto_aead_encrypt(
	unsigned char *c, unsigned long long *clen,
	const unsigned char *m, unsigned long long mlen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
	)
{
	block TA = _mm_setzero_si128(), TE;

	Setup(k);
#if(ADP==Para)
	if ((uint32)adlen > 0){
		TA = AFunc(ad, (uint32)adlen);
	}
	TE = EFunc(npub, CRYPTO_NPUBBYTES, m, (uint32)mlen, CRYPTO_ABYTES, c);
	TE = _mm_xor_si128(TE, TA);
#else
	if ((uint32)adlen > 0){
		TA = AFuncS(ad, (uint32)adlen);
	}
	TE = EFunc(npub, CRYPTO_NPUBBYTES, TA, m, (uint32)mlen, CRYPTO_ABYTES, c);
#endif
	memcpy(c + mlen, (uint8*)&TE, CRYPTO_ABYTES);
	*clen = mlen + CRYPTO_ABYTES;
	return 0;
}

int crypto_aead_decrypt(
	unsigned char *m, unsigned long long *mlen,
	unsigned char *nsec,
	const unsigned char *c, unsigned long long clen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k
	)
{
	uint8 loctag[BLOCK];
	block TA = _mm_setzero_si128(), TE;

	*mlen = clen - CRYPTO_ABYTES;
	Setup(k);
#if (ADP==Para)
	if ((uint32)adlen > 0){
		TA = AFunc(ad, (uint32)adlen);
	}
	TE = DFunc(npub, CRYPTO_NPUBBYTES, c,
		(uint32)clen - CRYPTO_ABYTES, CRYPTO_ABYTES, m);
	TE = _mm_xor_si128(TE, TA);
#else 
	if ((uint32)adlen > 0){
		TA = AFuncS(ad, (uint32)adlen);
	}
	TE = DFunc(npub, CRYPTO_NPUBBYTES, TA, c,
		(uint32)clen - CRYPTO_ABYTES, CRYPTO_ABYTES, m);
#endif
	memcpy(loctag, (uint8*)&TE, CRYPTO_ABYTES);
	if (memcmp(loctag, c + (uint32)*mlen, CRYPTO_ABYTES) != 0){//non-constant-time compare
		return TAG_UNMATCH; //-1
	}
	return TAG_MATCH; //0
}
