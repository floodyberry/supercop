#define blake2b_blocks_fn blake2b_blocks_avx

#include "crypto_hash.h"
#include "crypto_uint64.h"
#include <stddef.h>
#include <string.h>

enum {
	BLAKE2B_BLOCKBYTES = 128,
	BLAKE2B_STRIDE = 128,
	BLAKE2B_HASHBYTES = 64
};

typedef struct blake2b_context {
	crypto_uint64 h[8];
	crypto_uint64 t[2];
	crypto_uint64 f[2];
} blake2b_context;

extern void blake2b_blocks_fn(blake2b_context *ctx, const unsigned char *in, size_t inlen, size_t stride);

int crypto_hash(unsigned char *hash, const unsigned char *in, unsigned long long inlen) {
	blake2b_context ctx = {
		{0x6a09e667f3bcc908ull ^ 0x0000000001010040ull, 0xbb67ae8584caa73bull,
		 0x3c6ef372fe94f82bull                        , 0xa54ff53a5f1d36f1ull,
		 0x510e527fade682d1ull                        , 0x9b05688c2b3e6c1full,
		 0x1f83d9abfb41bd6bull                        , 0x5be0cd19137e2179ull},
		{0x0000000000000000ull, 0x0000000000000000ull},
		{0x0000000000000000ull, 0x0000000000000000ull},
	};
	size_t bytes = (size_t)inlen;

	if (bytes > BLAKE2B_BLOCKBYTES) {
		size_t want = ((bytes - 1) & ~((size_t)BLAKE2B_BLOCKBYTES - 1));
		blake2b_blocks_fn(&ctx, in, want, BLAKE2B_STRIDE);
		bytes -= want;
		in += want;
	}

	ctx.f[0] = ~(crypto_uint64)0;
	blake2b_blocks_fn(&ctx, in, bytes, BLAKE2B_STRIDE);
	memcpy(hash, ctx.h, BLAKE2B_HASHBYTES);
	return 0;
}

