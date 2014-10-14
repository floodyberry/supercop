#define blake2s_blocks_fn blake2s_blocks_ssse3

#include "crypto_hash.h"
#include "crypto_uint32.h"
#include <stddef.h>
#include <string.h>

enum {
	BLAKE2S_BLOCKBYTES = 64,
	BLAKE2S_STRIDE = 64,
	BLAKE2S_HASHBYTES = 32
};

typedef struct blake2s_context {
	crypto_uint32 h[8];
	crypto_uint32 t[2];
	crypto_uint32 f[2];
} blake2s_context;

extern void blake2s_blocks_fn(blake2s_context *ctx, const unsigned char *in, size_t inlen, size_t stride);

int crypto_hash(unsigned char *hash, const unsigned char *in, unsigned long long inlen) {
	blake2s_context ctx = {
		{0x6a09e667 ^ 0x01010020, 0xbb67ae85,
		 0x3c6ef372             , 0xa54ff53a,
		 0x510e527f             , 0x9b05688c,
		 0x1f83d9ab             , 0x5be0cd19},
		{0x00000000, 0x000000000},
		{0x00000000, 0x000000000},
	};
	size_t bytes = (size_t)inlen;

	if (bytes > BLAKE2S_BLOCKBYTES) {
		size_t want = ((bytes - 1) & ~((size_t)BLAKE2S_BLOCKBYTES - 1));
		blake2s_blocks_fn(&ctx, in, want, BLAKE2S_STRIDE);
		bytes -= want;
		in += want;
	}

	ctx.f[0] = ~(crypto_uint32)0;
	blake2s_blocks_fn(&ctx, in, bytes, BLAKE2S_STRIDE);
	memcpy(hash, ctx.h, BLAKE2S_HASHBYTES);
	return 0;
}

