/*
// HS1-SIV Draft v2.0 reference code.
//
// Note: This implements HS1-SIV Draft v2, and not v1.
//
//
// ** This version is slow and susceptible to side-channel attacks. **
// ** Do not use for any purpose other than to understand HS1-SIV.  **
//
// Written by Ted Krovetz (ted@krovetz.net). Last modified 20 August 2014.
//
// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.
//
// In jurisdictions that recognize copyright laws, the author or authors
// of this software dedicate any and all copyright interest in the
// software to the public domain. We make this dedication for the benefit
// of the public at large and to the detriment of our heirs and
// successors. We intend this dedication to be an overt act of
// relinquishment in perpetuity of all present and future rights to this
// software under copyright law.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//
// For more information, please refer to <http://unlicense.org/>
//
// The author knows of no intellectual property claims relevant to this work.
*/

/* Exactly one of the following should be set */
#define HS1_SIV_LO  0
#define HS1_SIV     0
#define HS1_SIV_HI  1

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     I n c l u d e s   a n d   u t i l i t i e s
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#include "api.h"
#include "crypto_aead.h"

#if HS1_SIV_LO
#define HS1_SIV_NH_LEN      64
#define HS1_SIV_HASH_RNDS    2
#define HS1_SIV_CHACHA_RNDS  8
#define HS1_SIV_SIV_LEN      CRYPTO_ABYTES
#elif HS1_SIV
#define HS1_SIV_NH_LEN      64
#define HS1_SIV_HASH_RNDS    4
#define HS1_SIV_CHACHA_RNDS 12
#define HS1_SIV_SIV_LEN     CRYPTO_ABYTES
#elif HS1_SIV_HI
#define HS1_SIV_NH_LEN      64
#define HS1_SIV_HASH_RNDS    6
#define HS1_SIV_CHACHA_RNDS 20
#define HS1_SIV_SIV_LEN     CRYPTO_ABYTES
#endif

#define __STDC_LIMIT_MACROS
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
/*#include "prf.h"*/

#if __GNUC__
	#define HS1_SIV_ALIGN(n) __attribute__ ((aligned(n)))
#elif _MSC_VER
	#define HS1_SIV_ALIGN(n) __declspec(align(n))
#elif (__STDC_VERSION >= 201112L) || (__cplusplus >= 201103L)
	#define HS1_SIV_ALIGN(n) alignas(n)
#else /* Not GNU/Microsoft/C11: delete alignment uses.     */
    #pragma message ( "Struct alignment not guaranteed" )
	#define HS1_SIV_ALIGN(n)
#endif

HS1_SIV_ALIGN(16)
typedef struct {
    unsigned char chacha_key[32];
    unsigned char nh_key[HS1_SIV_NH_LEN+16*(HS1_SIV_HASH_RNDS-1)];
    unsigned char poly_key[HS1_SIV_HASH_RNDS*8];
    #if (HS1_SIV_HASH_RNDS > 4) /* ASU */
    unsigned char asu_key[HS1_SIV_HASH_RNDS*24];
    #else
    unsigned char asu_key[];
    #endif
} hs1siv_ctx_t;

/* Little-endian reads and writes. */

static uint32_t swap32(uint32_t x) {
    return (((x & 0x000000ffu) << 24) | ((x & 0x0000ff00u) << 8)  |
            ((x & 0x00ff0000u) >> 8)  | ((x & 0xff000000u) >> 24));
}

static uint64_t swap64(uint64_t x) {
    return ((x & UINT64_C(0x00000000000000ff)) << 56) |
		   ((x & UINT64_C(0x000000000000ff00)) << 40) |
		   ((x & UINT64_C(0x0000000000ff0000)) << 24) |
		   ((x & UINT64_C(0x00000000ff000000)) <<  8) |
	       ((x & UINT64_C(0x000000ff00000000)) >>  8) |
		   ((x & UINT64_C(0x0000ff0000000000)) >> 24) |
		   ((x & UINT64_C(0x00ff000000000000)) >> 40) |
		   ((x & UINT64_C(0xff00000000000000)) >> 56);
}

static int le() { const union { int x; char e; } l = { 1 }; return l.e; }
static uint32_t read32le(uint32_t *p) { return (le()?*p:swap32(*p)); }
static uint64_t read64le(uint64_t *p) { return (le()?*p:swap64(*p)); }
static void write32le(uint32_t *p, uint32_t w) { *p = (le()?w:swap32(w)); }
static void write64le(uint64_t *p, uint64_t w) { *p = (le()?w:swap64(w)); }

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     C h a c h a   S e c t i o n -- Implementation borrowed from D Bernstein
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* This chacha implementation was adapted from a public domain implementation
 * found at http://cr.yp.to/chacha.html. It has been modified to accommodate
 * 12-byte IVs as specified in "draft-nir-cfrg-chacha20-poly1305".
 */

typedef struct { uint32_t input[16]; } chacha_ctx_t;

static uint32_t rotl(uint32_t x, unsigned n) { return (x<<n) | (x>>(32-n)); }

#define QUARTERROUND(a,b,c,d) \
  x[a] += x[b]; x[d] = rotl(x[d] ^ x[a],16); \
  x[c] += x[d]; x[b] = rotl(x[b] ^ x[c],12); \
  x[a] += x[b]; x[d] = rotl(x[d] ^ x[a], 8); \
  x[c] += x[d]; x[b] = rotl(x[b] ^ x[c], 7);

static void salsa20_wordtobyte(unsigned char output[64],const uint32_t input[16])
{
  uint32_t i, x[16];

  for (i = 0;i < 16;++i) x[i] = input[i];
  for (i = HS1_SIV_CHACHA_RNDS;i != 0;i -= 2) {
    QUARTERROUND( 0, 4, 8,12)
    QUARTERROUND( 1, 5, 9,13)
    QUARTERROUND( 2, 6,10,14)
    QUARTERROUND( 3, 7,11,15)
    QUARTERROUND( 0, 5,10,15)
    QUARTERROUND( 1, 6,11,12)
    QUARTERROUND( 2, 7, 8,13)
    QUARTERROUND( 3, 4, 9,14)
  }
  for (i = 0;i < 16;++i) x[i] += input[i];
  for (i = 0;i < 16;++i) write32le((uint32_t *)(output + 4 * i),x[i]);
}

static const char sigma[] = "expand 32-byte k";
static const char tau[] = "expand 16-byte k";

void chacha_keysetup(chacha_ctx_t *x, const unsigned char *k, unsigned kbits)
{
  const char *constants;

  x->input[4] = read32le((uint32_t *)(k + 0));
  x->input[5] = read32le((uint32_t *)(k + 4));
  x->input[6] = read32le((uint32_t *)(k + 8));
  x->input[7] = read32le((uint32_t *)(k + 12));
  if (kbits == 256) { /* recommended */
    k += 16;
    constants = sigma;
  } else { /* kbits == 128 */
    constants = tau;
  }
  x->input[8] = read32le((uint32_t *)(k + 0));
  x->input[9] = read32le((uint32_t *)(k + 4));
  x->input[10] = read32le((uint32_t *)(k + 8));
  x->input[11] = read32le((uint32_t *)(k + 12));
  x->input[0] = read32le((uint32_t *)(constants + 0));
  x->input[1] = read32le((uint32_t *)(constants + 4));
  x->input[2] = read32le((uint32_t *)(constants + 8));
  x->input[3] = read32le((uint32_t *)(constants + 12));
}

void chacha_ivsetup(chacha_ctx_t *x,const unsigned char *iv)
{
  x->input[12] = 0;
  x->input[13] = read32le((uint32_t *)(iv + 0)); /* Modified for 12-byte iv */
  x->input[14] = read32le((uint32_t *)(iv + 4));
  x->input[15] = read32le((uint32_t *)(iv + 8));
}

void chacha_xor(chacha_ctx_t *x,const unsigned char *in,unsigned char *out,unsigned bytes)
{
  unsigned char output[64];
  unsigned i;

  if (!bytes) return;
  for (;;) {
    salsa20_wordtobyte(output,x->input);
    x->input[12] += 1;
    if (bytes <= 64) {
      for (i = 0;i < bytes;++i) out[i] = in[i] ^ output[i];
      return;
    }
    for (i = 0;i < 64;++i) out[i] = in[i] ^ output[i];
    bytes -= 64;
    out += 64;
    in += 64;
  }
}

void hs1siv_chacha256(void *out, unsigned outbytes, unsigned char *iv, void *user_key)
{
    chacha_ctx_t ctx;

    chacha_keysetup(&ctx, user_key, 256);
    chacha_ivsetup(&ctx,iv);
    #if ( ! HS1_SIV_XOR )
    memset(out, 0, outbytes);
    #endif
    chacha_xor(&ctx,out,out,outbytes);
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     H S 1 - H a s h   S e c t i o n
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

static const uint64_t m60 = ((uint64_t)1 << 60) - 1;
static const uint64_t m61 = ((uint64_t)1 << 61) - 1;

/* dh:dl = a * b : since a and b are both < 64 bits, no overflow in m. */
static void pmul64(uint64_t *dh, uint64_t *dl, uint64_t a, uint64_t b) {
    uint64_t m = (uint64_t)(uint32_t)(a>>32) * (uint64_t)(uint32_t)b
               + (uint64_t)(uint32_t)(b>>32) * (uint64_t)(uint32_t)a;
    uint64_t h = (uint64_t)(uint32_t)(a>>32) * (uint64_t)(uint32_t)(b>>32);
    uint64_t l = (uint64_t)(uint32_t)a * (uint64_t)(uint32_t)b;
    h += (m >> 32); l += (m << 32);  /* h:l += (m>>32):(m<<32)      */
    if (l < (m << 32)) h += 1;       /* Check for carry from l to h */
    *dl=l; *dh=h;
}

/* Return 62 bits congruent to ak+m mod (2^61-1). Assumes 60-bit k, m; 62-bit a */
static uint64_t poly_step(uint64_t a, uint64_t m, uint64_t k) {
    #if (__GNUC__ && __LP64__)
        __uint128_t tmp = (__uint128_t)a * (__uint128_t)k;
        return ((uint64_t)tmp & m61) + (uint64_t)(tmp >> 61) + m;
    #else
        uint64_t h,l;
        pmul64(&h,&l,a,k);
        return (l & m61) + ((h << 3) | (l >> 61)) + m;
    #endif
}

static uint64_t poly_finalize(uint64_t a) {
    a = (a & m61) + (a >> 61);   /* a may be 62 bits, so one final reduction */
    if (a == m61) a = 0;
    return a;
}

static uint32_t asu_hash(uint64_t x, uint64_t *k) {
    uint64_t t = k[0] + k[1] * (uint32_t)x + k[2] * (uint32_t)(x >> 32);
    return (uint32_t)(t >> 32);
}

void prf_hash2(uint64_t *h, uint32_t *in, unsigned inbytes, uint32_t *nhkey, uint64_t *polykey, uint64_t *asukey) {
    uint64_t s0 = 1, s1 = 1;
    unsigned i=0, j;

    /* Hash full blocks of HS1_SIV_NH_LEN bytes */
    for ( ; inbytes >= HS1_SIV_NH_LEN; inbytes -= HS1_SIV_NH_LEN, in += HS1_SIV_NH_LEN/4) {
        uint64_t a0 = 0, a1 = 0;
        for (i=0;i<HS1_SIV_NH_LEN/4;i+=8) {
            a0 += (uint64_t)(read32le(in+i+0) + nhkey[i+0]) * (read32le(in+i+2) + nhkey[i+2]);
            a0 += (uint64_t)(read32le(in+i+1) + nhkey[i+1]) * (read32le(in+i+3) + nhkey[i+3]);
            a1 += (uint64_t)(read32le(in+i+0) + nhkey[i+4]) * (read32le(in+i+2) + nhkey[i+6]);
            a1 += (uint64_t)(read32le(in+i+1) + nhkey[i+5]) * (read32le(in+i+3) + nhkey[i+7]);
            a0 += (uint64_t)(read32le(in+i+4) + nhkey[i+4]) * (read32le(in+i+6) + nhkey[i+6]);
            a0 += (uint64_t)(read32le(in+i+5) + nhkey[i+5]) * (read32le(in+i+7) + nhkey[i+7]);
            a1 += (uint64_t)(read32le(in+i+4) + nhkey[i+8]) * (read32le(in+i+6) + nhkey[i+10]);
            a1 += (uint64_t)(read32le(in+i+5) + nhkey[i+9]) * (read32le(in+i+7) + nhkey[i+11]);
        }
        s0 = poly_step(s0, a0&m60, polykey[0]);
        s1 = poly_step(s1, a1&m60, polykey[1]);
    }
    /* If partial block remains, hash it */
    i=0;
    if (inbytes != 0) {
        uint64_t a0 = 0, a1 = 0;
        while (inbytes >= 16) {
            a0 += (uint64_t)(read32le(in+i+0) + nhkey[i+0]) * (read32le(in+i+2) + nhkey[i+2]);
            a0 += (uint64_t)(read32le(in+i+1) + nhkey[i+1]) * (read32le(in+i+3) + nhkey[i+3]);
            a1 += (uint64_t)(read32le(in+i+0) + nhkey[i+4]) * (read32le(in+i+2) + nhkey[i+6]);
            a1 += (uint64_t)(read32le(in+i+1) + nhkey[i+5]) * (read32le(in+i+3) + nhkey[i+7]);
            i += 4; inbytes -= 16;
        }
        if (inbytes) {
            uint32_t tail[4] = {0,0,0,0};
            for (j=0;j<inbytes;j++)
                ((unsigned char *)tail)[j] = ((unsigned char *)(in+i))[j];
            a0 += (uint64_t)(read32le(tail+0) + nhkey[i+0]) * (read32le(tail+2) + nhkey[i+2]);
            a0 += (uint64_t)(read32le(tail+1) + nhkey[i+1]) * (read32le(tail+3) + nhkey[i+3]);
            a1 += (uint64_t)(read32le(tail+0) + nhkey[i+4]) * (read32le(tail+2) + nhkey[i+6]);
            a1 += (uint64_t)(read32le(tail+1) + nhkey[i+5]) * (read32le(tail+3) + nhkey[i+7]);
            a0 += inbytes;
            a1 += inbytes;
        }
        s0 = poly_step(s0, a0&m60, polykey[0]);
        s1 = poly_step(s1, a1&m60, polykey[1]);
    }
    s0 = poly_finalize(s0);
    s1 = poly_finalize(s1);
    #if (HS1_SIV_HASH_RNDS > 4)
    write64le(h, (uint64_t)asu_hash(s1, asukey+3) << 32 | asu_hash(s0, asukey));
    #else
    (void)asukey;
    write64le(h,s0);
    write64le(h+1,s1);
    #endif
}

void hs1_hash(hs1siv_ctx_t *ctx, void *in, unsigned inbytes, void *out) {
    uint64_t *h = (uint64_t *)out;
    unsigned k = (HS1_SIV_HASH_RNDS > 4 ? 1 : 2);

    prf_hash2(h, (uint32_t *)in, inbytes, (uint32_t *)ctx->nh_key, (uint64_t *)ctx->poly_key, (uint64_t *)ctx->asu_key);
    #if HS1_SIV_HASH_RNDS > 2
    prf_hash2(h+k, (uint32_t *)in, inbytes, (uint32_t *)ctx->nh_key+8, (uint64_t *)ctx->poly_key+2, (uint64_t *)ctx->asu_key+3);
    #if HS1_SIV_HASH_RNDS > 4
    prf_hash2(h+2*k, (uint32_t *)in, inbytes, (uint32_t *)ctx->nh_key+16, (uint64_t *)ctx->poly_key+4, (uint64_t *)ctx->asu_key+6);
    #if HS1_SIV_HASH_RNDS > 6
    prf_hash2(h+3*k, (uint32_t *)in, inbytes, (uint32_t *)ctx->nh_key+24, (uint64_t *)ctx->poly_key+6, (uint64_t *)ctx->asu_key+9);
    #endif
    #endif
    #endif
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     P R F   S e c t i o n
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/*
typedef struct {
    unsigned char chacha_key[32];
    unsigned char nh_key[HS1_SIV_NH_LEN+16*(HS1_SIV_HASH_RNDS-1)];
    unsigned char poly_key[HS1_SIV_HASH_RNDS*8];
    #if (HS1_SIV_HASH_RNDS > 4)
    unsigned char asu_key[HS1_SIV_HASH_RNDS*24];
    #else
    unsigned char asu_key[];
    #endif
} hs1siv_ctx_t;
*/

void hs1siv_subkeygen(hs1siv_ctx_t *ctx, void *user_key, unsigned key_bytes)
{
    unsigned char chacha_key[32];
    unsigned char iv[12] = {0};
    unsigned i=0;

    /* Copy user_key as many times as needed to fill 32 byte chacha key */
    while (i < 32) {
        unsigned nbytes = 32-i;
        if (nbytes > key_bytes) nbytes = key_bytes;
        memcpy(chacha_key+i,user_key,nbytes);
        i += nbytes;
    }

    /* Build key-derivation nonce and fill context */
    iv[0] = key_bytes;
    iv[2] = HS1_SIV_SIV_LEN;
    iv[4] = HS1_SIV_CHACHA_RNDS;
    iv[5] = HS1_SIV_HASH_RNDS;
    iv[6] = HS1_SIV_NH_LEN;
    hs1siv_chacha256(ctx, sizeof(hs1siv_ctx_t), iv, chacha_key);

    /* Pre-process internal keys: make future reads little-endian, mod poly key */
    for (i=0; i<sizeof(ctx->nh_key)/4; i++)
        ((uint32_t *)ctx->nh_key)[i] = read32le(((uint32_t *)ctx->nh_key)+i);
    for (i=0; i<sizeof(ctx->poly_key)/8; i++)
        ((uint64_t *)ctx->poly_key)[i] = read64le(((uint64_t *)ctx->poly_key)+i) & m60;
    #if (HS1_SIV_HASH_RNDS > 4)
    for (i=0; i<sizeof(ctx->asu_key)/8; i++)
        ((uint64_t *)ctx->asu_key)[i] = read64le(((uint64_t *)ctx->asu_key)+i);
    #endif
}

void hs1(
    hs1siv_ctx_t *hs1_ctx,
    void *in, unsigned inbytes,
    void *iv,
    void *out, unsigned outbytes
)
{
    #if (HS1_SIV_HASH_RNDS > 4)
    uint64_t h[HS1_SIV_HASH_RNDS/2];
    #else
    uint64_t h[HS1_SIV_HASH_RNDS];
    #endif

    unsigned i;
    unsigned char key[32];
    chacha_ctx_t chacha_ctx;

    hs1_hash(hs1_ctx, in, inbytes, h);
    memcpy(key, hs1_ctx->chacha_key, 32);
    for (i=0; i<sizeof(h)/8;i++) ((uint64_t *)key)[i] ^= h[i];
    chacha_keysetup(&chacha_ctx, key, 256);
    chacha_ivsetup(&chacha_ctx,(unsigned char *)iv);
    memset(out,0,outbytes);
    chacha_xor(&chacha_ctx, (unsigned char *)out, (unsigned char *)out, outbytes);
}

void hs1siv_encrypt(hs1siv_ctx_t *ctx, void *m, unsigned mbytes, void *a, unsigned abytes, void *n, void *t, void *c)
{
    unsigned i;
    unsigned buflen = (abytes+15)/16*16 + (mbytes+15)/16*16 + 16;
    unsigned char tmp_t[HS1_SIV_SIV_LEN];
    unsigned char *buf = (unsigned char *)malloc(buflen);
    memset(buf, 0, buflen);
    memcpy(buf, a, abytes);
    memcpy(buf+(abytes+15)/16*16, m, mbytes);
    write32le((uint32_t *)(buf+buflen-16), abytes);
    write32le((uint32_t *)(buf+buflen-8), mbytes);
    hs1(ctx, buf, buflen, n, tmp_t, HS1_SIV_SIV_LEN);
    free(buf);
    buf = (unsigned char *)malloc(mbytes+64);
    hs1(ctx, tmp_t, HS1_SIV_SIV_LEN, n, buf, mbytes+64);
    for (i=0; i<mbytes; i++)
        buf[64+i] ^= ((unsigned char *)m)[i];
    memcpy(c,buf+64,mbytes);
    memcpy(t,tmp_t,HS1_SIV_SIV_LEN);
    free(buf);
}

int hs1siv_decrypt(hs1siv_ctx_t *ctx, void *c, unsigned cbytes, void *a, unsigned abytes, void *n, void *t, void *m)
{
    unsigned i, buflen = (abytes+15)/16*16 + (cbytes+15)/16*16 + 16;
    unsigned char *maybe_m = (unsigned char *)malloc(cbytes);
    unsigned char maybe_t[HS1_SIV_SIV_LEN];
    unsigned char *buf = (unsigned char *)malloc(cbytes+64);
    hs1(ctx, t, HS1_SIV_SIV_LEN, n, buf, cbytes+64);
    for (i=0; i<cbytes; i++)
        ((unsigned char *)maybe_m)[i] = ((unsigned char *)c)[i] ^ buf[64+i];
    free(buf);
    buf = (unsigned char *)malloc(buflen);
    memset(buf, 0, buflen);
    memcpy(buf, a, abytes);
    memcpy(buf+(abytes+15)/16*16, maybe_m, cbytes);
    write32le((uint32_t *)(buf+buflen-16), abytes);
    write32le((uint32_t *)(buf+buflen-8), cbytes);
    hs1(ctx, buf, buflen, n, maybe_t, HS1_SIV_SIV_LEN);
    free(buf);
    if (memcmp(t,maybe_t,HS1_SIV_SIV_LEN) == 0) {
        memcpy(m,maybe_m,cbytes);
        free(maybe_m);
        return 0;
    } else {
        free(maybe_m);
        return -1;
    }
}

int crypto_aead_encrypt(
    unsigned char *c,unsigned long long *clen,
    const unsigned char *m,unsigned long long mlen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k
)
{
    hs1siv_ctx_t ctx;
    (void)nsec;
    hs1siv_subkeygen(&ctx, (void *)k, CRYPTO_KEYBYTES);
    if (clen) *clen = mlen+CRYPTO_ABYTES;
    hs1siv_encrypt(&ctx, (void *)m, mlen, (void *)ad, adlen, (void *)npub, c+mlen, c);
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
    hs1siv_ctx_t ctx;
    (void)nsec;
    if (mlen) *mlen = clen-CRYPTO_ABYTES;
    hs1siv_subkeygen(&ctx, (void *)k, CRYPTO_KEYBYTES);
    return hs1siv_decrypt(&ctx, (void *)c, clen-CRYPTO_ABYTES, (void *)ad, adlen, (void *)npub, (void *)(c+clen-CRYPTO_ABYTES), m);
}
