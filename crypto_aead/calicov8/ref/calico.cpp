// Use Calico v8 construction.  Remove to use Calico v9 construction
#ifndef CALICO_V9
# define CALICO_V8
#endif


//// Basic types ////

#if defined(_MSC_VER)

typedef unsigned __int8  u8;
typedef signed __int8	 s8;
typedef unsigned __int16 u16;
typedef signed __int16   s16;
typedef unsigned __int32 u32;
typedef signed __int32   s32;
typedef unsigned __int64 u64;
typedef signed __int64   s64;

#else

#include <stdint.h>

	typedef uint8_t  u8;
	typedef int8_t   s8;
	typedef uint16_t u16;
	typedef int16_t  s16;
	typedef uint32_t u32;
	typedef int32_t  s32;
	typedef uint64_t u64;
	typedef int64_t  s64;

#endif


//// Rotation ////

#define CAT_ROL8(n, r)  ( (u8)((u8)(n) << (r)) | (u8)((u8)(n) >> ( 8 - (r))) ) /* only works for u8 */
#define CAT_ROR8(n, r)  ( (u8)((u8)(n) >> (r)) | (u8)((u8)(n) << ( 8 - (r))) ) /* only works for u8 */
#define CAT_ROL16(n, r) ( (u16)((u16)(n) << (r)) | (u16)((u16)(n) >> (16 - (r))) ) /* only works for u16 */
#define CAT_ROR16(n, r) ( (u16)((u16)(n) >> (r)) | (u16)((u16)(n) << (16 - (r))) ) /* only works for u16 */
#define CAT_ROL32(n, r) ( (u32)((u32)(n) << (r)) | (u32)((u32)(n) >> (32 - (r))) ) /* only works for u32 */
#define CAT_ROR32(n, r) ( (u32)((u32)(n) >> (r)) | (u32)((u32)(n) << (32 - (r))) ) /* only works for u32 */
#define CAT_ROL64(n, r) ( (u64)((u64)(n) << (r)) | (u64)((u64)(n) >> (64 - (r))) ) /* only works for u64 */
#define CAT_ROR64(n, r) ( (u64)((u64)(n) >> (r)) | (u64)((u64)(n) << (64 - (r))) ) /* only works for u64 */


//// Byte-order swapping ////

#define CAT_BOSWAP16(n) CAT_ROL16(n, 8)
#define CAT_BOSWAP32(n) ( (CAT_ROL32(n, 8) & 0x00ff00ff) | (CAT_ROL32(n, 24) & 0xff00ff00) )
#define CAT_BOSWAP64(n) ( ((u64)CAT_BOSWAP32((u32)n) << 32) | CAT_BOSWAP32((u32)(n >> 32)) )


//// Endian neutral ////

static void write32(void *p, const u32 x) {
	u8 *b = reinterpret_cast<u8 *>( p );

	b[0] = (u8)x;
	b[1] = (u8)(x >> 8);
	b[2] = (u8)(x >> 16);
	b[3] = (u8)(x >> 24);
}

static void write64(void *p, const u64 x) {
	u8 *b = reinterpret_cast<u8 *>( p );

	write32(b, (u32)x);
	write32(b + 4, (u32)(x >> 32));
}

static u32 read32(const void *p) {
	const u8 *b = reinterpret_cast<const u8 *>( p );

	return (((u32)b[0] |
			((u32)(b[1]) <<  8) |
			((u32)(b[2]) << 16) |
			((u32)(b[3]) << 24)));
}

static u64 read64(const void *p) {
	const u8 *b = reinterpret_cast<const u8 *>( p );

	return ((u64)read32(b + 4) << 32) | read32(b);
}


//// SipHash-2-4 ////

#define SIP_HALF_ROUND(a, b, c, d, s, t) \
	a += b; \
	c += d; \
	b = CAT_ROL64(b, s) ^ a; \
	d = CAT_ROL64(d, t) ^ c; \
	a = CAT_ROL64(a, 32);

#define SIP_DOUBLE_ROUND(v0, v1, v2, v3) \
	SIP_HALF_ROUND(v0, v1, v2, v3, 13, 16); \
	SIP_HALF_ROUND(v2, v1, v0, v3, 17, 21); \
	SIP_HALF_ROUND(v0, v1, v2, v3, 13, 16); \
	SIP_HALF_ROUND(v2, v1, v0, v3, 17, 21);

// SipHash finalization constants
static const u64 MSG_XOR_CONST = 0xff;
#ifdef CALICO_V8
static const u64 AD_XOR_CONST = 0xff;
#else
// Calico v9 uses a different XOR constant for the additional data from the message
static const u64 AD_XOR_CONST = 0xee;
#endif

static void siphash24_mix(u64 &v0, u64 &v1, u64 &v2, u64 &v3, const void *input, const u64 input_len, u64 xor_val) {
	// Perform SIP rounds on 8 bytes of input at a time
	const u64 *m64 = (const u64 *)input;
	u64 words = input_len >> 3;
	while (words > 0) {
		u64 mi = read64(m64++);

		v3 ^= mi;
		SIP_DOUBLE_ROUND(v0, v1, v2, v3);
		v0 ^= mi;

		--words;
	}

	// Mix the last 1..7 bytes with the length
	const u8 *m = reinterpret_cast<const u8 *>( m64 );
	u64 last7 = input_len << 56;
	switch (input_len & 7) {
	case 7: last7 |= (u64)m[6] << 48;
	case 6: last7 |= (u64)m[5] << 40;
	case 5: last7 |= (u64)m[4] << 32;
	case 4: last7 |= read32(m); // low -> low
		break;
	case 3: last7 |= (u64)m[2] << 16;
	case 2: last7 |= (u64)m[1] << 8;
	case 1: last7 |= (u64)m[0];
		break;
	};

	// Final mix
	v3 ^= last7;
	SIP_DOUBLE_ROUND(v0, v1, v2, v3);
	v0 ^= last7;

	v2 ^= xor_val;
	SIP_DOUBLE_ROUND(v0, v1, v2, v3);
	SIP_DOUBLE_ROUND(v0, v1, v2, v3);
}

extern "C"
void siphash24_mac(void *tag_p /* 8 bytes */,
				   const unsigned char *key /* 32 bytes */,
				   const void *public_msg_num_p /* 8 bytes */,
				   const void *msg, const unsigned long long msg_len,
				   const void *ad, const unsigned long long ad_len)
{
	const u64 public_msg_num = read64(public_msg_num_p);

	// Convert key into two 64-bit integers
#ifdef CALICO_V8
	// Broken key mix for Calico v8
	u64 k0 = read64(key) ^ public_msg_num;
#else
	u64 k0 = read64(key);
#endif
	u64 k1 = read64(key + 8);

	// Mix the key across initial state
	u64 v0 = k0 ^ 0x736f6d6570736575ULL;
	u64 v1 = k1 ^ 0x646f72616e646f6dULL;
	u64 v2 = k0 ^ 0x6c7967656e657261ULL;
	u64 v3 = k1 ^ 0x7465646279746573ULL;

#ifndef CALICO_V8
	// New key mix for Calico v9
	v3 ^= public_msg_num;
	SIP_DOUBLE_ROUND(v0, v1, v2, v3);
	v0 ^= public_msg_num;
#endif

	// Hash the message
	siphash24_mix(v0, v1, v2, v3, msg, msg_len, MSG_XOR_CONST);

	// Hash the additional data
	siphash24_mix(v0, v1, v2, v3, ad, ad_len, AD_XOR_CONST);

	const u64 tag = (v0 ^ v1) ^ (v2 ^ v3);

	write64(tag_p, tag);
}


//// ChaCha14 ////

static const int CHACHA_ROUNDS = 14; // Multiple of 2

#define QUARTERROUND(A, B, C, D)						\
	x[A] += x[B]; x[D] = CAT_ROL32(x[D] ^ x[A], 16);	\
	x[C] += x[D]; x[B] = CAT_ROL32(x[B] ^ x[C], 12);	\
	x[A] += x[B]; x[D] = CAT_ROL32(x[D] ^ x[A], 8);		\
	x[C] += x[D]; x[B] = CAT_ROL32(x[B] ^ x[C], 7);

static const u32 CHACHA_CONST[4] = {
	0x61707865, 0x3320646e, 0x79622d32, 0x6b206574
};

static void chacha_gen(const u8 *key, const u64 block_counter, const u64 public_msg_num, u32 x[16]) {
	x[0] = CHACHA_CONST[0];
	x[1] = CHACHA_CONST[1];
	x[2] = CHACHA_CONST[2];
	x[3] = CHACHA_CONST[3];

	for (int word = 0; word < 8; ++word) {
		x[word + 4] = read32(key + (4 * word));
	}

	x[12] = (u32)block_counter;
	x[13] = (u32)(block_counter >> 32);
	x[14] = (u32)public_msg_num;
	x[15] = (u32)(public_msg_num >> 32);

	for (int round = CHACHA_ROUNDS; round > 0; round -= 2) {
		QUARTERROUND(0, 4, 8,  12)
		QUARTERROUND(1, 5, 9,  13)
		QUARTERROUND(2, 6, 10, 14)
		QUARTERROUND(3, 7, 11, 15)
		QUARTERROUND(0, 5, 10, 15)
		QUARTERROUND(1, 6, 11, 12)
		QUARTERROUND(2, 7, 8,  13)
		QUARTERROUND(3, 4, 9,  14)
	}

	x[0] += CHACHA_CONST[0];
	x[1] += CHACHA_CONST[1];
	x[2] += CHACHA_CONST[2];
	x[3] += CHACHA_CONST[3];

	for (int word = 0; word < 8; ++word) {
		x[word + 4] += read32(key + (4 * word));
	}

	x[12] += (u32)block_counter;
	x[13] += (u32)(block_counter >> 32);
	x[14] += (u32)public_msg_num;
	x[15] += (u32)(public_msg_num >> 32);
}

extern "C"
void chacha(const unsigned char *key /* 32 bytes */,
			const unsigned char *public_msg_num_p /* 8 bytes */,
			const unsigned char *input,
			unsigned long long len,
			unsigned char *output)
{
	const u64 public_msg_num = read64(public_msg_num_p);
	u64 block_counter = 0;
	u32 keystream[16];

	while (len >= 64) {
		chacha_gen(key, block_counter, public_msg_num, keystream);

		for (int word = 0; word < 16; ++word, input += 4, output += 4) {
			write32(output, read32(input) ^ keystream[word]);
		}

		++block_counter;
		len -= 64;
	}

	if (len > 0) {
		chacha_gen(key, block_counter, public_msg_num, keystream);

		u64 words = len / 4;
		for (u64 word = 0; word < words; ++word, input += 4, output += 4) {
			write32(output, read32(input) ^ keystream[word]);
		}

		const u32 keystream_final = keystream[words];

		switch (len % 4) {
		case 3:	output[2] = input[2] ^ (u8)(keystream_final >> 16);
		case 2:	output[1] = input[1] ^ (u8)(keystream_final >> 8);
		case 1:	output[0] = input[0] ^ (u8)keystream_final;
		}
	}
}
