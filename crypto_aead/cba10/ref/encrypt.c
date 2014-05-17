#include <string.h>
#include <openssl/aes.h>
#include "api.h"
#include "crypto_aead.h"
#define NONCEBYTES CRYPTO_NPUBBYTES

// CBA parameters
//================
#define tau_par		(const int)96
#define b_par		(const int)48
#define KEYBYTES   CRYPTO_KEYBYTES
//================

#define min(a, b)	((a) < (b) ? (a):(b))
#define TAGBYTES	tau_par/8
#define n_par		(const int)128
#define l_par		min(n_par - 2*b_par - 32, tau_par)

typedef unsigned char block[16];
typedef unsigned char half_block[8];

/*----------------------------
 Rotates char *a to right by rot_amount
 ----------------------------*/
static void rotate(unsigned char *a, int rot_amount, long long abytes) {
	int rot_bytes = rot_amount / 8;
	int rot_bits = rot_amount - (rot_bytes * 8);
	int i;
	unsigned char temp[abytes];
	memcpy(temp, a, abytes);
	for (i = 0; i < abytes; i++) {
		a[(i + rot_bytes) % abytes] = temp[i];
	}
	memcpy(temp, a, abytes);
	for (i = 1; i < abytes; i++) {
		a[i] = (temp[i - 1] << (8 - rot_bits)) | (temp[i] >> rot_bits);
	}
	a[0] = (temp[abytes - 1] << (8 - rot_bits)) | (temp[0] >> rot_bits);
}

static void xor_half_block(half_block out, half_block s1, half_block s2) {
	unsigned i;
	for (i = 0; i < 8; i++)
		out[i] = s1[i] ^ s2[i];
}

static void xor_block(block out, const block s1, const block s2) {
	unsigned i;
	for (i = 0; i < 16; i++)
		out[i] = s1[i] ^ s2[i];
}

static void pad_block(block out, const block in, int inbytes_to_pad) {
	if (inbytes_to_pad == 16) {
		memcpy(out, in, 16);
		return;
	} else {
		memcpy(out, in, inbytes_to_pad);
		memset(out + inbytes_to_pad, 128, 1);
		int remaining_bytes = 16 - inbytes_to_pad - 1;
		if (remaining_bytes)
			memset(out + inbytes_to_pad + 1, 0, remaining_bytes);
	}
}

/*----------------------------
 works on a half_block A and computes 2.A
 2.A = (A<<1) xor (MSB(A).((0^59)11011))
 ----------------------------*/
static void A2(half_block out, half_block A) {
	int i;
	int MSB = A[0] >> 7;
	for (i = 0; i < 7; i++)
		out[i] = (A[i] << 1) | (A[i + 1] >> 7);
	out[7] = (A[7] << 1) ^ (MSB * 27);
}

/*----------------------------
 works on a half_block A and computes 3.A
 3.A = (A) xor (2.A)
 ----------------------------*/
static void A3(half_block out, half_block A) {
	half_block temp;
	memcpy(temp, A, 8);
	A2(A, A);
	xor_half_block(A, A, temp);
	memcpy(out, A, 8);
}

/*----------------------------
 works on a half_block A and computes 4.A
 4.A = 2.(2.A)
 ----------------------------*/
static void A4(half_block out, half_block A) {
	A2(A, A);
	A2(A, A);
	memcpy(out, A, 8);
}

/*----------------------------
 works on a half_block A and computes 5.A
 5.A = 3.(3.A)
 ----------------------------*/static void A5(half_block out, half_block A) {
	A3(A, A);
	A3(A, A);
	memcpy(out, A, 8);
}

/*----------------------------
 works on a half_block A and computes 6.A
 6.A = 3.(2.A)
 ----------------------------*/
static void A6(half_block out, half_block A) {
	A2(A, A);
	A3(A, A);
	memcpy(out, A, 8);
}

/*----------------------------
 F(alpha, beta, in(0..127) = {0,1}^128) =
 alpha.in(0..63) || beta.in(64..127)
 ----------------------------*/
static void F(block out, block in, int alpha, int beta) {
	half_block in0, in1;
	memcpy(in0, in, 8);
	memcpy(in1, &in[8], 8);

	switch (alpha) {
	case 2:
		A2(in0, in0);
		break;
	case 3:
		A3(in0, in0);
		break;
	case 4:
		A4(in0, in0);
		break;
	case 5:
		A5(in0, in0);
		break;
	case 6:
		A6(in0, in0);
		break;
	}

	switch (beta) {
	case 2:
		A2(in1, in1);
		break;
	case 3:
		A3(in1, in1);
		break;
	case 4:
		A4(in1, in1);
		break;
	case 5:
		A5(in1, in1);
		break;
	case 6:
		A6(in1, in1);
		break;
	}
	memcpy(out, in0, 8);
	memcpy(&out[8], in1, 8);
}

/*----------------------------
 computes a tau-bit tag value for the associated data "A" using "key"
 this value will be used in the process of message encryption and authentication
 ----------------------------*/
static void H(unsigned char *out, const unsigned char *key,
		const unsigned char *in, long long abytes) {
	AES_KEY aes_key;
	block S, L, temp, delta;
	AES_set_encrypt_key(key, KEYBYTES * 8, &aes_key);

	memset(S, 0, 16);
	unsigned char tau_char = tau_par & 0xFF;
	unsigned char b_char = b_par & 0xFF;

	temp[0] = tau_char;
	temp[1] = b_char;
	memset(temp + 2, 0, 14);

	AES_encrypt(temp, L, &aes_key);

	L[15] = L[15] | 0x03;
	rotate(L, 1, 16);
	F(delta, L, 2, 2);

	long long i;
	for (i = 1; i <= abytes / 16; i++, in = in + 16) {
		F(delta, delta, 2, 2);
		xor_block(temp, in, delta);
		AES_encrypt(temp, temp, &aes_key);
		xor_block(S, S, temp);
	}

	int last_block_bytes = abytes % 16;
	if (last_block_bytes > 0) {
		F(delta, delta, 3, 3);
		pad_block(temp, in, last_block_bytes);
		xor_block(temp, temp, delta);
		AES_encrypt(temp, temp, &aes_key);
		xor_block(S, S, temp);
	}
	memcpy(out, S, TAGBYTES);
}

static int enc(unsigned char *c, const unsigned char *key,
		const unsigned char *nonce, const unsigned char *a, long long abytes,
		const unsigned char *m, long long inbytes) {

	const unsigned char* in = m;
	unsigned char* out = c;
	AES_KEY aes_key;
	AES_set_encrypt_key(key, KEYBYTES * 8, &aes_key);
	block temp1, temp2, R, delta, T_A, T, S;
	H(T_A, key, a, abytes);

	// R = E((0^(128 - nonce_bytes - 2)) || (tau) || (b) || (nonce))
	unsigned char tau_char = tau_par & 0xFF;
	unsigned char b_char = b_par & 0xFF;

	if (16 - NONCEBYTES - 2 > 0)
		memset(temp1, 0, 16 - NONCEBYTES - 2);
	temp1[16 - NONCEBYTES - 2] = tau_char;
	temp1[16 - NONCEBYTES - 1] = b_char;
	memcpy(&temp1[16 - NONCEBYTES], nonce, NONCEBYTES);
	AES_encrypt(temp1, R, &aes_key);
	int bytes_1 = l_par / 8;
	memcpy(temp2, R, 16);
	if (bytes_1 > 0)
		memset(temp2 + 16 - bytes_1, 255, bytes_1);
	temp2[15 - bytes_1] |= 0x03;
	rotate(temp2, (l_par / 2) + 1, 16);
	F(delta, temp2, 2, 2);

	if ((inbytes * 8) <= l_par) {
		unsigned char C_0[inbytes];
		int i;
		for (i = 0; i < inbytes; i++, out++, in++) {
			C_0[i] = *in ^ R[16 - inbytes + i];
			*out = C_0[i];
		}

		F(delta, delta, 3, 3);

		pad_block(temp1, C_0, inbytes);

		if (16 - TAGBYTES > 0)
			memset(temp2, 0, 16 - TAGBYTES);
		memcpy(&temp2[16 - TAGBYTES], T_A, TAGBYTES);

		xor_block(temp1, temp1, temp2);
		xor_block(temp1, temp1, delta);
		AES_encrypt(temp1, temp1, &aes_key);
		memcpy(out, temp1, TAGBYTES);
		out = out + TAGBYTES;
		return 0;
	}

	int l_bytes = l_par / 8;
	unsigned char temp_l[(l_bytes)], C_0[(l_bytes)];
	memcpy(temp_l, &R[16 - (l_bytes)], (l_bytes));

	int i;
	for (i = 0; i < l_bytes; i++, in++, out++) {
		C_0[i] = *in ^ temp_l[i];
		*out = C_0[i];
	}

	// T = T_A xor ((0^(tau-l))||C_0)
	if ((tau_par - l_par) / 8 > 0)
		memset(temp1, 0, (tau_par - l_par) / 8);
	memcpy(&temp1[(tau_par - l_par) / 8], C_0, l_bytes);
	for (i = 0; i < (TAGBYTES); i++)
		T[i] = T_A[i] ^ temp1[i];
	if (n_par / 8 > 0)
		memset(S, 0, n_par / 8);

	long long total_blocks = (inbytes - l_bytes) / 16;
	int remaining_bytes = (inbytes - l_bytes) % 16;
	if (remaining_bytes > 0)
		total_blocks++;
	else
		remaining_bytes = 16;

	for (i = 1; i <= total_blocks - 1; i++, in += 16, out += 16) {
		xor_block(S, in, S);
		F(delta, delta, 2, 2);
		xor_block(temp1, in, delta);
		AES_encrypt(temp1, temp1, &aes_key);
		xor_block(out, temp1, delta);
	}

	if ((remaining_bytes <= (n_par - tau_par ) / 8) && (total_blocks >= 2)) {
		out -= 16;
		// C_{m-1} xor delta
		xor_block(temp1, out, delta);

		memcpy(temp2, in, remaining_bytes);
		memcpy(&temp2[remaining_bytes], T, TAGBYTES);
		xor_block(out, temp2, temp1);
		int C_m_1_length = (TAGBYTES) + remaining_bytes;
		out += C_m_1_length;

		F(delta, delta, 3, 3);

		pad_block(temp1, out - C_m_1_length, C_m_1_length);
		xor_block(temp1, temp1, delta);
		AES_encrypt(temp1, temp1, &aes_key);
		xor_block(out, temp1, S);
		out += 16;
		return 0;
	} else {
		pad_block(temp1, in, remaining_bytes);

		xor_block(S, S, temp1);
		F(delta, delta, 2, 4);

		if (16 - TAGBYTES > 0)
			memset(temp1, 0, 16 - TAGBYTES);
		memcpy(&temp1[16 - TAGBYTES], T, TAGBYTES);
		xor_block(temp1, temp1, delta);
		AES_encrypt(temp1, temp1, &aes_key);
		int i;
		for (i = 0; i < remaining_bytes; i++, in++, out++)
			*out = *in ^ temp1[i];
		if (remaining_bytes < 16)
			F(delta, delta, 3, 5);
		else
			F(delta, delta, 5, 3);

		if (16 - TAGBYTES > 0)
			memset(temp1, 0, 16 - TAGBYTES);
		memcpy(&temp1[16 - TAGBYTES], T, TAGBYTES);
		xor_block(temp1, temp1, delta);
		xor_block(temp1, temp1, S);
		AES_encrypt(temp1, temp1, &aes_key);
		memcpy(out, temp1, TAGBYTES);
		out += TAGBYTES;
		return 0;
	}
	return -1;
}

static int dec(unsigned char *m, const unsigned char *key,
		const unsigned char *nonce, const unsigned char *a, long long abytes,
		const unsigned char *c, long long inbytes) {

	const unsigned char* in = c;
	unsigned char* out = m;
	AES_KEY aes_key, aes_decrypt_key;
	AES_set_encrypt_key(key, KEYBYTES * 8, &aes_key);
	AES_set_decrypt_key(key, KEYBYTES * 8, &aes_decrypt_key);
	block temp1, temp2, R, delta, T_A, T, S, M_0, C_0;
	if (inbytes * 8 < tau_par) {
		return -1;
	}
	H(T_A, key, a, abytes);

	// R = E((0^(128 - nonce_bytes - 2)) || (tau) || (b) || (nonce))
	unsigned char tau_char = tau_par & 0xFF;
	unsigned char b_char = b_par & 0xFF;
	if (16 - NONCEBYTES - 2 > 0)
		memset(temp1, 0, 16 - NONCEBYTES - 2);
	temp1[16 - NONCEBYTES - 2] = tau_char;
	temp1[16 - NONCEBYTES - 1] = b_char;
	memcpy(&temp1[16 - NONCEBYTES], nonce, NONCEBYTES);
	AES_encrypt(temp1, R, &aes_key);

	int bytes_1 = l_par / 8;
	memcpy(temp2, R, 16);
	if (bytes_1 > 0)
		memset(temp2 + 16 - bytes_1, 255, bytes_1);
	temp2[15 - bytes_1] |= 0x03;
	rotate(temp2, (l_par / 2) + 1, 16);
	F(delta, temp2, 2, 2);

	if (inbytes * 8 <= l_par + tau_par) {
		int i, C_0_bytes = inbytes - (TAGBYTES);
		for (i = 0; i < C_0_bytes; i++, in++) {
			C_0[i] = *in;
			M_0[i] = *in ^ R[16 - C_0_bytes + i];
		}

		F(delta, delta, 3, 3);
		pad_block(temp1, C_0, C_0_bytes);

		if (16 - TAGBYTES > 0)
			memset(temp2, 0, 16 - TAGBYTES);
		memcpy(&temp2[16 - TAGBYTES], T_A, TAGBYTES);

		xor_block(temp1, temp1, temp2);
		xor_block(temp1, temp1, delta);

		AES_encrypt(temp1, temp1, &aes_key);
		int validation_test = memcmp(temp1, in, TAGBYTES);

		if (validation_test == 0) {
			memcpy(out, M_0, C_0_bytes);
			out += C_0_bytes;
			return 0;
		} else {
			return -1;
		}
	}

	int l_bytes = l_par / 8;
	unsigned char temp_l[(l_bytes)];
	memcpy(temp_l, &R[16 - (l_bytes)], (l_bytes));
	int i;

	for (i = 0; i < l_bytes; i++, in += 1, out += 1) {
		C_0[i] = *in;
		M_0[i] = *in ^ temp_l[i];
		*out = M_0[i];
	}

	// T = T_A xor ((0^(tau-l))||C_0)
	if ((tau_par - l_par) / 8 > 0)
		memset(temp1, 0, (tau_par - l_par) / 8);
	memcpy(temp1 + (tau_par - l_par) / 8, C_0, l_bytes);

	for (i = 0; i < (TAGBYTES); i++)
		T[i] = T_A[i] ^ temp1[i];
	memset(S, 0, 16);

	long long total_blocks = (inbytes - l_bytes) / 16;
	int remaining_bytes = (inbytes - l_bytes) % 16;
	if (remaining_bytes > 0)
		total_blocks++;
	else
		remaining_bytes = 16;

	for (i = 1; i <= (total_blocks - 2); i++, in += 16, out += 16) {
		F(delta, delta, 2, 2);
		xor_block(temp1, in, delta);
		AES_decrypt(temp1, temp1, &aes_decrypt_key);
		xor_block(out, temp1, delta);
		xor_block(S, S, out);
	}
	block C_m_1, C_m, M_m_1, delta_prime;
	if ((remaining_bytes > (TAGBYTES)) && (total_blocks >= 2)) {
		memcpy(C_m_1, in, remaining_bytes);
		in += remaining_bytes;
		memcpy(C_m, in, 16);
		in += 16;
		F(delta_prime, delta, 6, 6);

		pad_block(temp1, C_m_1, remaining_bytes);
		xor_block(temp1, temp1, delta_prime);
		AES_encrypt(temp1, temp1, &aes_key);
		xor_block(temp1, temp1, S);
		xor_block(M_m_1, C_m, temp1);
		memcpy(out, M_m_1, 16);
		out += 16;

		F(delta, delta, 2, 2);
		xor_block(temp1, M_m_1, delta);
		AES_encrypt(temp1, temp1, &aes_key);
		xor_block(temp1, C_m_1, temp1);

		block T_prime;
		memcpy(out, temp1, remaining_bytes - (TAGBYTES));
		out += remaining_bytes - (TAGBYTES);
		memcpy(T_prime, temp1 + remaining_bytes - (TAGBYTES), TAGBYTES);
		int validation_test = memcmp(T, T_prime, (TAGBYTES));
		if (validation_test == 0)
			return 0;
		else
			return -1;
	} else {
		int C_m_1_length;
		if (total_blocks == 1) {
			C_m_1_length = remaining_bytes - (TAGBYTES);
			memcpy(C_m_1, in, C_m_1_length);
			in += C_m_1_length;
			memcpy(C_m, in, (TAGBYTES));
			in += (TAGBYTES);
		} else {
			C_m_1_length = 16 + remaining_bytes - (TAGBYTES);
			memcpy(C_m_1, in, C_m_1_length);
			in += C_m_1_length;
			memcpy(C_m, in, (TAGBYTES));
			in += (TAGBYTES);
		}

		F(delta, delta, 2, 4);
		if (16 - TAGBYTES > 0)
			memset(temp1, 0, 16 - TAGBYTES);
		memcpy(&temp1[16 - TAGBYTES], T, TAGBYTES);
		xor_block(temp1, temp1, delta);
		AES_encrypt(temp1, temp1, &aes_key);
		xor_block(temp1, C_m_1, temp1);
		memcpy(out, temp1, C_m_1_length);

		out += C_m_1_length;
		pad_block(temp1, temp1, C_m_1_length);
		xor_block(S, S, temp1);
		if (C_m_1_length < 16)
			F(delta, delta, 3, 5);
		else
			F(delta, delta, 5, 3);
		if (16 - TAGBYTES > 0)
			memset(temp1, 0, 16 - TAGBYTES);
		memcpy(&temp1[16 - TAGBYTES], T, TAGBYTES);
		xor_block(temp1, temp1, delta);
		xor_block(temp1, temp1, S);
		AES_encrypt(temp1, temp1, &aes_key);

		int validation_test = memcmp(C_m, temp1, TAGBYTES);
		if (validation_test == 0)
			return 0;
		else
			return -1;
	}

}

int crypto_aead_encrypt(unsigned char *c, unsigned long long *clen,
		const unsigned char *m, unsigned long long mlen,
		const unsigned char *ad, unsigned long long adlen,
		const unsigned char *nsec, const unsigned char *npub,
		const unsigned char *k) {
	
	int res = enc(c, k, npub, ad, adlen, m, mlen);
	*clen = mlen + (long long)TAGBYTES;
	return res;
}

int crypto_aead_decrypt(unsigned char *m, unsigned long long *mlen,
		unsigned char *nsec, const unsigned char *c, unsigned long long clen,
		const unsigned char *ad, unsigned long long adlen,
		const unsigned char *npub, const unsigned char *k) {

	int res = dec(m, k, npub, ad, adlen, c, clen);
	*mlen = clen - (long long)TAGBYTES;
	return res;
}
