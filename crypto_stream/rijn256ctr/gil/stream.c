/* Rijndael(Nw=8,Nk=8,Nr=14)
 *
 * Implementor: David Leon Gil
 * Inspired by:
 *   Shay Gueron and Vlad Krasnov
 *   Andy Polyakov
 * License: CC0, attribution kindly requested.
 *
 * Please don't use the SUPERCOP version; the assembler has been translated
 * from its original YASM. An updated version will be maintained at
 *   https://github.com/coruus/rijn
 */

#include <stdint.h>
#include <stdlib.h>
#include <string.h>

// Many platforms define a memcpy or memset macro.
// We don't want this.
#undef memcpy
#undef memset

// Use __builtin_memcpy and __builtin_memset if available.
#ifdef __has_builtin
#if __has_builtin(__builtin_memset)
#define memset __builtin_memset
#endif
#endif

// This is included for SUPERCOP compatibility; please use a libc (and
// compiler) that supports memset_s.
#undef memset_s
#define memset_s(DST, DSTLEN, VAL, OPLEN) memset((DST), (DSTLEN), (VAL))

extern void Rijndael_k32b32_encrypt_x4(const void* ks, void* out, const void* in);
extern void Rijndael_k32b32_expandkey(void* ks, const void* key);

// We don't expect that this vector size to exist, but both clang and
// GCC seem to generate decent enough code nonetheless.
typedef uint64_t v16u8 __attribute__((__vector_size__(16*8)));

static const v16u8 increment = { 0, 0, 0, 4,
                                 0, 0, 0, 4,
                                 0, 0, 0, 4,
                                 0, 0, 0, 4 };

static inline void _full_xor(const void* ks,
                             void* out,
                             const void* in,
                             v16u8* nc,
                             size_t nblocks) {
  v16u8* outv = (v16u8*)out;
  v16u8* inv = (v16u8*)in;
  while (nblocks != 0) {
    v16u8 buf = {0};
    Rijndael_k32b32_encrypt_x4(ks, &buf, nc);
    *outv = *inv ^ buf;
    outv++;
    inv++;
    nblocks--;
    *nc = *nc + increment;
  }
}

static inline void _partial_xor(const void* ks,
                                void* out,
                                const void* in,
                                v16u8* nc,
                                size_t inlen) {
  uint8_t* outb = (uint8_t*)out;
  uint8_t* inb = (uint8_t*)in;
  v16u8 buf = {0};
  Rijndael_k32b32_encrypt_x4(ks, &buf, nc);
  
  uint8_t* bufb = (uint8_t*)&buf;
  size_t i;
  for (i = 0; i < inlen; i++) {
    outb[i] = inb[i] ^  bufb[i];
  }
}

int crypto_stream_rijn256ctr_gil_xor(uint8_t* out,
                                     const uint8_t* in,
                                     size_t oplen,
                                     const void* _n,
                                     const void* k) {
  if (oplen == 0) {
    return 0;
  } 
  uint64_t* n = (uint64_t*)_n;

  // Setup four nonce+counter blocks.
  v16u8 nc = { n[0], n[1], n[2], 0,
               n[0], n[1], n[2], 1,
               n[0], n[1], n[2], 2,
               n[0], n[1], n[2], 3 };
  uint32_t ks[120] = {0};

  // Expand the key.
  Rijndael_k32b32_expandkey(ks, k);

  // Encrypt full 128-byte blocks.
  if (oplen >= 128) {
    _full_xor(ks, out, in, &nc, oplen / 128);
  }
  uint64_t done = (oplen / 128) * 128;
  oplen -= done;

  // Encrypt any remaining bytes.
  if (oplen != 0) {
    _partial_xor(ks, out + done, in + done, &nc, oplen);
  }
  memset_s(ks, 120*4, 0, 120*4);
  memset_s(&nc, sizeof(nc), 0, sizeof(nc));
  return 0; 
}

static inline void _full_stream(const void* ks, void* out, v16u8* nc, size_t nblocks) {
  v16u8* outv = (v16u8*)out;
  while (nblocks != 0) {
    v16u8 buf = {0};
    Rijndael_k32b32_encrypt_x4(ks, &buf, nc);
    *outv = buf;
    outv++;
    nblocks--;
    *nc = *nc + increment;    
  }
}

static inline void _partial_stream(const void* ks, void* out, v16u8* nc, size_t inlen) {
  uint8_t* outb = (uint8_t*)out;
  v16u8 buf = {0};
  uint8_t* bufb = (uint8_t*)&buf;
  Rijndael_k32b32_encrypt_x4(ks, &buf, nc);
  size_t i;
  for (i = 0; i < inlen; i++) {
    outb[i] = bufb[i];
  }
}

int crypto_stream_rijn256ctr_gil(uint8_t* out, uint64_t oplen, const void* _n, const void* k) {
  if (oplen == 0) {
    return 0;
  } 
  uint64_t* n = (uint64_t*)_n;

  // Setup four nonce+counter blocks.
  v16u8 nc = { n[0], n[1], n[2], 0,
               n[0], n[1], n[2], 1,
               n[0], n[1], n[2], 2,
               n[0], n[1], n[2], 3 };
  uint32_t ks[120] = {0};

  // Expand the key.
  Rijndael_k32b32_expandkey(ks, k);

  // Encrypt full 128-byte blocks.
  if (oplen >= 128) {
    _full_stream(ks, out, &nc, oplen / 128);
  }

  uint64_t done = (oplen / 128) * 128;
  oplen -= done;

  // Encrypt any remaining bytes.
  if (oplen != 0) {
    _partial_stream(ks, (uint8_t*)out + done, &nc, oplen);
  }
  memset_s(ks, sizeof(ks), 0, sizeof(ks));
  memset_s(&nc, sizeof(nc), 0, sizeof(nc));
  return 0;
}
