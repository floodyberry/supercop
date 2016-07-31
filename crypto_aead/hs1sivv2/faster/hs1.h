/*
// HS1 Header for HS1-SIV Specification Draft v3 optimized reference code.
//
// Written by Ted Krovetz (ted@krovetz.net). Last modified Jan 12, 2016
//
// To the extent possible under law, the author has dedicated all copyright
// and related and neighboring rights to this software to the public
// domain worldwide. This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication
// along with this software. If not, see
// <http://creativecommons.org/publicdomain/zero/1.0/>
//
// The author knows of no intellectual property claims relevant to this work.
*/

#include <stdint.h>
#include <stddef.h>

/*****************************************************************************
 * HS1-SIV, HS1-HASH, and HS1 settings
 ****************************************************************************/

#ifndef HS1_NH_LEN
#define HS1_NH_LEN      64  /* A multiple of 64. Likely 64, 128, or 256. */
#endif

#ifndef HS1_HASH_RNDS
#define HS1_HASH_RNDS    4  /* 2, 4, 6, or 8.                            */
#endif

#ifndef HS1_CHACHA_RNDS
#define HS1_CHACHA_RNDS 12  /* A multiple of 4. Likely 8, 12, or 20.     */
#endif

#ifndef HS1_ASU
#define HS1_ASU          0  /* 0 if almost-universal good enough.        */
#endif

#ifndef HS1_SIV_LEN
#define HS1_SIV_LEN     16 /* 8, 16, or 32.                             */
#endif

/*****************************************************************************
 * HS1-Hash structure and functions
 ****************************************************************************/

/* Choosing a random HS1-Hash element is done by choosing random integer
 * sequences for each of nh_key (each less than 2^32), poly_key (each less
 * than 2^60), and asu_key (each less than 2^64). It is the user's
 * responsibility to mind endianness issues if interoperability between
 * big and little endian systems is desired, and to align a structure
 * appropriately in memory on SIMD architectures with alignment requirements.
 */
typedef struct {
    uint32_t nh_key[HS1_NH_LEN/4+4*(HS1_HASH_RNDS-1)];
    uint64_t poly_key[HS1_HASH_RNDS];
    #if HS1_ASU
    uint64_t asu_key[HS1_HASH_RNDS*3];
    #else
    uint64_t asu_key[];
    #endif
} hs1_hash_ctx_t __attribute__ ((aligned (32)));

/* Any inbytes that is a multiple of HS1_NH_LEN may be supplied. Each
 * entry of accum is updated using Horner's method. The entries in
 * accum should be initialized to 1 before hashing begins. For
 * streaming data hash_step may be called multiple times.
 */
void hash_step(
    const hs1_hash_ctx_t *ctx,
    const void *in,
    unsigned inbytes,              /* Must be a multiple of HS1_NH_LEN */
    uint64_t accum[HS1_HASH_RNDS]
);

/* Final hash result is written to result. It will be HS1_HASH_RNDS * 4
 * bytes (almost strongly universal) if HS1_ASU is nonzero, or
 * HS1_HASH_RNDS * 8 bytes (almost universal) otherwise. Input and
 * result bytes are read and written in an endian-neutral manner.
 * The inbytes value may be any number 0...HS1_NH_LEN.
 */
void hash_finalize(
    const hs1_hash_ctx_t *ctx,
    const void *in,
    unsigned inbytes,              /* Must be <= HS1_NH_LEN */
    uint64_t accum[HS1_HASH_RNDS],
    void *result
);

/*****************************************************************************
 * HS1-SIV structure and functions
 ****************************************************************************/

typedef struct {
    unsigned char   chacha_key[32];
    hs1_hash_ctx_t  hash_key;
} hs1_ctx_t __attribute__ ((aligned (32)));

void hs1_setup(hs1_ctx_t *ctx,
               const void *user_key,
               unsigned key_bytes);

/* (mbytes + HS1_SIV_LEN) bytes written to c                             */
void hs1siv_encrypt(const hs1_ctx_t *ctx,
                    const void *m, unsigned mbytes,
                    const void *a, unsigned abytes,
                    const void *n, void *c);

/* (cbytes - HS1_SIV_LEN) bytes written to m if no error encountered.    */
/* A negative return value indicates invalid ctx,c,a,n combination.      */
int hs1siv_decrypt(const hs1_ctx_t *ctx,
                    const void *c, unsigned cbytes,
                    const void *a, unsigned abytes,
                    const void *n, void *m);

/*****************************************************************************
 * HS1 function
 ****************************************************************************/

void hs1(const hs1_ctx_t *ctx, const void *n,
         const void *in, unsigned inbytes,
         void *out, unsigned outbytes,
         void *xor_buf);           /* gets xor'd with output */


/*****************************************************************************
 * Chacha structure and function
 ****************************************************************************/

/* The following structure is compatible with Andrew Moon's chacha
 * implementations (https://github.com/floodyberry/chacha-opt, Jul 27, 2015).
 * Those are designed for 8-byte counters and nonces, but using just the
 * first 4 bytes for the counter and the remaining 12 bytes for the nonce
 * works just fine, allowing RFC 7539 interface compatibility.
 */
typedef struct {
	unsigned char key[32];
	uint32_t counter;
	unsigned char nonce[12];
	size_t rounds;
} chacha_state_t __attribute__ ((aligned (32)));

void chacha_blocks(
	chacha_state_t *chacha_state,
	const void *in,          /* gets xor'd with chacha output */
	void *out,               /* out may equal in              */
	size_t len
);

/*****************************************************************************
 * CAESAR interface
 ****************************************************************************/

int crypto_aead_encrypt(
    unsigned char *c,unsigned long long *clen,
    const unsigned char *m,unsigned long long mlen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k
);

int crypto_aead_decrypt(
    unsigned char *m,unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c,unsigned long long clen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k
);
