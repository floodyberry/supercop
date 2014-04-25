#ifndef SABLIER_HEADER
#define SABLIER_HEADER

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include "authenticate.h"

typedef uint8_t u8;
typedef uint16_t u16;
//typedef unsigned char u8;
//typedef unsigned short u16;
typedef size_t size_type;
//typedef int bool;
//#define true 1
//#define false 0

static u16 const RC[128] = {
	0x8000, 0x0000, 0x0000, 0x0000, 0x8000, 0x000a, 0x0000, 0x0002,
	0x8000, 0x0088, 0x8000, 0x0000, 0x0000, 0x008a, 0x8000, 0x008a,
	0x8000, 0x0002, 0x0000, 0x0000, 0x8000, 0x0008, 0x0000, 0x008a,
	0x8000, 0x0082, 0x0000, 0x0082, 0x0000, 0x008a, 0x0000, 0x0000,
	0x0000, 0x0088, 0x0000, 0x0008, 0x8000, 0x000a, 0x0000, 0x000a,
	0x0000, 0x0008, 0x8000, 0x008a, 0x8000, 0x0082, 0x8000, 0x0088,
	0x0000, 0x0088, 0x8000, 0x0088, 0x8000, 0x0088, 0x0000, 0x0082,
	0x0000, 0x0080, 0x8000, 0x0008, 0x0000, 0x0008, 0x0000, 0x0082,
	0x8000, 0x0008, 0x0000, 0x000a, 0x0000, 0x000a, 0x8000, 0x0002,
	0x8000, 0x0088, 0x0000, 0x000a, 0x0000, 0x0088, 0x0000, 0x0002,
	0x0000, 0x0002, 0x0000, 0x008a, 0x0000, 0x0082, 0x8000, 0x0088,
	0x8000, 0x0082, 0x8000, 0x008a, 0x0000, 0x0000, 0x8000, 0x0082,
	0x0000, 0x000a, 0x0000, 0x0082, 0x8000, 0x000a, 0x0000, 0x0082,
	0x0000, 0x0000, 0x0000, 0x0080, 0x8000, 0x0088, 0x8000, 0x0080,
	0x8000, 0x0002, 0x0000, 0x000a, 0x0000, 0x0000, 0x0000, 0x000a,
	0x8000, 0x0008, 0x0000, 0x0080, 0x0000, 0x008a, 0x0000, 0x0002
};
static u16 const C1 = 0x1735, C2 = 0x9cb6;

static u16 t11, t12, t13, t14, t21, t22,
s11, s12, s13, s14, s21, s22, s3, s41, s42, s51, s52, s53, s54;

#define S(name, row) name ## row

#define _rotate16(i, n) (((i) >> (n)) | ((i) << (16 - (n))))

#define _rotate32(r1, r2, i1, i2)\
	do{\
	r1 = ((i1) >> 5) | ((i2) << 11);\
	r2 = ((i2) >> 5) | ((i1) << 11);\
	} while (0)

#define _keccak(a, b) (~(a) & (b))

#define _combine(a, b) (((a) << 8) | (b))

#define _split(rl, rh, r)\
	do{\
	rh = (r) >> 8;\
	rl = r & 0xFF;\
	} while (0)

#define _half_round()\
	do{\
	S(t, 12) = S(s, 51) ^ S(s, 52);\
	S(t, 13) = S(s, 53) ^ S(s, 54);\
	S(t, 11) = S(t, 12) ^ S(s, 53) ^ S(s, 42);\
	S(t, 14) = S(t, 13) ^ S(s, 52) ^ S(s, 41);\
	S(t, 11) = _rotate16(S(t, 11), 1);\
	S(t, 12) = _rotate16(S(t, 12), 3);\
	S(t, 13) = _rotate16(S(t, 13), 7);\
	S(t, 14) = _rotate16(S(t, 14), 11);\
	_rotate32(S(t, 21), S(t, 22), S(s, 41) ^ S(s, 3), S(s, 42) ^ S(s, 3));\
	S(s, 3) ^= _keccak(S(s, 21), S(s, 22)) ^ (_round_c1);\
	S(s, 3) = _rotate16(S(s, 3), 13);\
	S(s, 41) = S(s, 21) ^ _keccak(S(s, 11), S(s, 12));\
	S(s, 42) = S(s, 22) ^ _keccak(S(s, 13), S(s, 14));\
	\
	S(s, 52) = S(s, 11) ^ S(s, 12);\
	S(s, 53) = S(s, 13) ^ S(s, 14);\
	S(s, 51) = S(s, 52) ^ S(s, 13) ^ S(s, 42);\
	S(s, 54) = S(s, 53) ^ S(s, 12) ^ S(s, 41);\
	S(s, 11) = _rotate16(S(s, 51), 1);\
	S(s, 12) = _rotate16(S(s, 52), 3);\
	S(s, 13) = _rotate16(S(s, 53), 7);\
	S(s, 14) = _rotate16(S(s, 54), 11);\
	_rotate32(S(s, 21), S(s, 22), S(s, 41) ^ S(s, 3), S(s, 42) ^ S(s, 3));\
	S(s, 3) ^= _keccak(S(t, 21), S(t, 22)) ^ (_round_c2);\
	S(s, 3) = _rotate16(S(s, 3), 13);\
	S(s, 41) = S(t, 21) ^ _keccak(S(t, 11), S(t, 12));\
	S(s, 42) = S(t, 22) ^ _keccak(S(t, 13), S(t, 14));\
	S(s, 51) = S(t, 11);\
	S(s, 52) = S(t, 12);\
	S(s, 53) = S(t, 13);\
	S(s, 54) = S(t, 14);\
	}while(0)

#define _round()\
	do{\
	_half_round();\
	_half_round();\
	_leakage(S(s, 22) ^ S(s, 3) ^ S(s, 51) ^ S(s, 42));\
	}while(0)

#define _load(key, iv)\
	do{\
	S(s, 11) = _combine(key[0], iv[0]);\
	S(s, 12) = _combine(key[1], iv[1]);\
	S(s, 13) = _combine(key[2], iv[2]);\
	S(s, 14) = _combine(key[3], iv[3]);\
	\
	S(s, 21) = _combine(key[4], iv[4]);\
	S(s, 22) = _combine(key[5], iv[5]);\
	\
	S(s, 3) = _combine(iv[6], key[3] ^ iv[7]);\
	\
	S(s, 41) = _combine(key[6] ^ iv[0], key[6] ^ iv[1]);\
	S(s, 42) = _combine(key[7] ^ iv[2], key[7] ^ iv[3]);\
	\
	S(s, 51) = _combine(key[8] ^ iv[4], iv[8]);\
	S(s, 52) = _combine(key[9] ^ iv[5], iv[8]);\
	S(s, 53) = _combine(key[8] ^ iv[6], iv[9]);\
	S(s, 54) = _combine(key[9] ^ iv[7], iv[9]);\
	}while(0)

#define encrypt_stream()\
	do{\
	_round();\
	_split(c0, c1, z);\
	}while(0)

#define encrypt_only()\
	do{\
	encrypt_stream();\
	c0 ^= m0;\
	c1 ^= m1;\
	}while(0)

#define encrypt_authenticate_message()\
	do{\
	encrypt_stream();\
	c0 ^= m0;\
	c1 ^= m1;\
	_split(a0, a1, S(s, 41));\
	if(encrypt_or_decrypt) authenticate(m0, m1, a0, a1);\
	else authenticate(c0, c1, a0, a1);\
	}while(0)

#define encrypt_authenticate_constant()\
	do{\
	encrypt_stream();\
	_split(a0, a1, S(s, 41));\
	authenticate(m0, m1, a0, a1);\
	}while(0)

#define encrypt_authenticate_message_and_constant()\
	do{\
	encrypt_stream();\
	c0 ^= m0;\
	_split(a0, a1, S(s, 41));\
	if(encrypt_or_decrypt) authenticate(m0, m1, a0, a1);\
	else  authenticate(c0, m1, a0, a1);\
	}while(0)

static bool load(u8 const *key, u8 const *iv){
	size_t i;
	u16 z;
	u8 c0, c1;

	_load(key, iv);

	for (i = 0; i != 64; ++i){
#define _leakage(stream)
#define _round_c1 RC[2 * i]
#define _round_c2 RC[2 * i + 1]
		//_round();
		_half_round();
#undef _round_c1
#undef _round_c2
#undef _leakage
	}

	if (iv[0] & 1){
#define _leakage(stream) z = (stream)
#define _round_c1 C1
#define _round_c2 C2
		encrypt_stream();
		tag(0) = c0;
		tag(1) = c1;
		encrypt_stream();
		tag(2) = c0;
		tag(3) = c1;

		encrypt_stream();
		stream(0) = c0;
		stream(1) = c1;
		encrypt_stream();
		stream(2) = c0;
		stream(3) = c1;
#undef _round_c1
#undef _round_c2
#undef _leakage
		return true;
	}
	return false;
}

#endif
