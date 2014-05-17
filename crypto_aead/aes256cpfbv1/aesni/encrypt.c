/*
 *  CPFB version 1.0
 * @author Miguel Montes
 * @author Daniel Penazzi
 * 
 * To the extent possible under law, the authors have waived all copyright
 * and related or neighboring rights to the source code in this file.
 * http://creativecommons.org/publicdomain/zero/1.0/
 */
/* Notes about this version
 * This version of CPFB has been implemented using Intel AES-NI
 * As such, it only compiles on architectures that implement these instructions.
 * It is assumed that the architecture is little-endian
 * For simplicity, it does not implement re-keying for long messages so the maximum
 * message length of this implementation is (2**32 - 1) 96-bit blocks 
 * (12 bytes short of 48 GB).
 */ 

#include <stdint.h>
#include <string.h>
#include <wmmintrin.h>
#include <emmintrin.h>
#include <smmintrin.h>
#ifdef _MSC_VER
#include <intrin.h>
#endif
#include "crypto_aead.h"
#include "api.h"
#include "cpfbkey.h"


#define restrict __restrict

#define BPI 8
#define PAYLOAD_SIZE 12


#define BLOCK_LENGTH 16

#if CRYPTO_KEYBYTES == 16
#define AES_ROUNDS 10
#define KEYBITS 128
#define KEY_LENGTH 16
#elif CRYPTO_KEYBYTES == 32
#define AES_ROUNDS 14
#define KEYBITS 256
#define KEY_LENGTH 32
#else
#error "Unknown Key Length"
#endif

#if CRYPTO_ABYTES <= 16
#define TAG_LENGTH CRYPTO_ABYTES
#else
#error "BAD TAG LENGTH"
#endif


#if CRYPTO_NPUBBYTES >= 8 && CRYPTO_NPUBBYTES <= 15
#define NONCE_LENGTH CRYPTO_NPUBBYTES
#define NONCE_TYPE (CRYPTO_NPUBBYTES-8)
#define NONCE_INCREMENT 8
#else
#error "BAD NONCE LENGTH"
#endif

#if __clang__
#define _mm_cvtsi64x_si128(x) _mm_set_epi64x (0,(x))
#endif


#if __GNUC__
#define bswap32(x) (int) __builtin_bswap32(x)
#define bswap64(x) (long long int) __builtin_bswap64(x)
static inline uint64_t
__shiftright128 (uint64_t LowPart, uint64_t HighPart, unsigned char Shift) {
  uint64_t ret;

__asm__ ("shrd {%[Shift],%[HighPart],%[LowPart]|%[LowPart], %[HighPart], %[Shift]}": [ret] "=r" (ret): [LowPart] "0" (LowPart),[HighPart] "r" (HighPart),[Shift] "Jc" (Shift):"cc");

  return ret;
}

static inline uint64_t
__shiftleft128 (uint64_t LowPart, uint64_t HighPart, unsigned char Shift) {
  uint64_t ret;

__asm__ ("shld {%[Shift],%[LowPart],%[HighPart]|%[HighPart], %[LowPart], %[Shift]}": [ret] "=r" (ret): [LowPart] "r" (LowPart),[HighPart] "0" (HighPart),[Shift] "Jc" (Shift):"cc");

  return ret;
}
#elif _MSC_VER
#define bswap32(x) (int) _byteswap_ulong(x)
#define bswap64(x) (long long int) _byteswap_uint64(x)
#define inline __forceinline
#else
#error -- Unknown compiler
#endif




#define AES_encrypt(i,o,sk) (o) = AES_encrypt_block((i),(sk))
#define AES_encrypt_xor(i,o,sk,x) (o) = AES_encrypt_block((i),(sk)); (x) = _mm_xor_si128((x), (o));


#define load_96_ctr(b,ctr) insert_counter(load_96(b),ctr)
#define safe_load_96_ctr(b,ctr) insert_counter(safe_load_96(b),ctr)
#define safe_load_partial_ctr(b,len,ctr) insert_counter(safe_load_partial(b,len),ctr)
#define insert_counter(b,ctr) _mm_insert_epi32(b,bswap32(ctr),3)
#define load_96(m) _mm_loadu_si128 ((__m128i *) (m))
#define store_96(c,b) _mm_storeu_si128((__m128i*)(c),b)

static inline __m128i safe_load_partial(const unsigned char* m, unsigned long long len){
  unsigned long long hi = 0, lo = 0;
  m+=len;
 if (len & 1) lo = *(unsigned char *) (m -= 1);
 if (len & 2) lo = (lo << 0x10) | *(unsigned short *) (m -= 2);
 if (len & 4) lo = (lo << 0x20) | *(unsigned int *) (m -= 4);
 if (len & 8) {
	hi = lo;
	lo = *(unsigned long long *) (m -= 8);
  }
  return _mm_insert_epi32 (_mm_cvtsi64x_si128 ((long long)lo), (int) hi, 2);
}

static inline __m128i xor_partial(const unsigned char* c, __m128i block, unsigned char* m, unsigned long long len){
  unsigned char sh = (unsigned char)(8 * (16 - len));
  unsigned long long hi, lo, mask;

  c += len;
  m += len;
  if (len > 8) {
    lo = (unsigned long long)_mm_cvtsi128_si64 (block);
    hi = (unsigned) _mm_extract_epi32 (block, 2);
    hi = __shiftleft128 (lo, hi, sh) | (hi << sh);
    lo <<= sh;
    lo ^= *(unsigned long long *) (c - 16);
    hi ^= *(unsigned long long *) (c - 8);
    mask = ~0ull << sh;
    *(unsigned long long *) (m - 16) = (lo & mask) | (*(unsigned long long *) (m - 16) & ~mask);
    *(unsigned long long *) (m - 8) = hi;
    return _mm_insert_epi32 (_mm_cvtsi64x_si128 ((long long)(__shiftright128 (lo, hi, sh) | (lo >> sh))), (int) (hi >> sh), 2);
  }
  else {
    lo = *(unsigned long long *) (c - 8) ^ (unsigned long long)(_mm_cvtsi128_si64 (block) << sh);
    mask = ~0ull << sh;
    *(unsigned long long *) (m - 8) = (lo & mask) | (*(unsigned long long *) (m - 8) & ~mask);
    return _mm_cvtsi64x_si128 ((long long) (lo >> sh));
  }

}


static inline __m128i safe_load_96(const unsigned char* m){
  return _mm_insert_epi32(_mm_cvtsi64x_si128(*(long long *) m), *(int *) (m + 8), 2);
}

static inline __m128i safe_load_96_nf(const unsigned char* m){
  return _mm_srli_si128(_mm_loadu_si128((__m128i*)(m-4)),4);
}

static inline void safe_store_96(unsigned char* c, __m128i block){
  _mm_storel_epi64 ((__m128i *) c, block);
  *(int *) (c + 8) = _mm_extract_epi32 (block, 2);
}

static inline int verify_tag(const unsigned char*  a, const unsigned char* b){
  int i;
  unsigned char res = 0;
  for (i=0; i < TAG_LENGTH; i++)
    res |= a[i] ^ b[i];
  return res == 0 ? 0 : -1;
}


inline void safe_store_partial(unsigned char* c, unsigned long long len, __m128i block){
  unsigned int i = 0;
  for (i=0; i < len; i++)
    c[i] = ((unsigned char*)&block)[i];
}


/* Define UNROLL_LOOPS for the unrolled version.
 * GCC does a better job, so we left it undefined
 */
#ifdef UNROLL_LOOPS
static inline __m128i
load_authenticate_store_8 (const unsigned char *restrict m, __m128i * restrict subkeys, uint32_t counter, __m128i X) {
  int i;
  __m128i subkey = subkeys[0];
  __m128i out_0 = load_96_ctr(m,++counter);
  __m128i out_1 = load_96_ctr(m+12,++counter);
  __m128i out_2 = load_96_ctr(m+24,++counter);
  __m128i out_3 = load_96_ctr(m+36,++counter);
  __m128i out_4 = load_96_ctr(m+48,++counter);
  __m128i out_5 = load_96_ctr(m+60,++counter);
  __m128i out_6 = load_96_ctr(m+72,++counter);
  __m128i out_7 = insert_counter(safe_load_96_nf(m+84),++counter);

  out_0 = _mm_xor_si128 (out_0, subkey);
  out_1 = _mm_xor_si128 (out_1, subkey);
  out_2 = _mm_xor_si128 (out_2, subkey);
  out_3 = _mm_xor_si128 (out_3, subkey);
  out_4 = _mm_xor_si128 (out_4, subkey);
  out_5 = _mm_xor_si128 (out_5, subkey);
  out_6 = _mm_xor_si128 (out_6, subkey);
  out_7 = _mm_xor_si128 (out_7, subkey);
  for (i = 1; i < AES_ROUNDS; i++) {
    subkey = subkeys[i];
    out_0 = _mm_aesenc_si128 (out_0, subkey);
    out_1 = _mm_aesenc_si128 (out_1, subkey);
    out_2 = _mm_aesenc_si128 (out_2, subkey);
    out_3 = _mm_aesenc_si128 (out_3, subkey);
    out_4 = _mm_aesenc_si128 (out_4, subkey);
    out_5 = _mm_aesenc_si128 (out_5, subkey);
    out_6 = _mm_aesenc_si128 (out_6, subkey);
    out_7 = _mm_aesenc_si128 (out_7, subkey);
  }
  subkey = subkeys[AES_ROUNDS];
  out_0 = _mm_aesenclast_si128 (out_0, subkey);
  out_1 = _mm_aesenclast_si128 (out_1, subkey);
  out_2 = _mm_aesenclast_si128 (out_2, subkey);
  out_3 = _mm_aesenclast_si128 (out_3, subkey);
  out_4 = _mm_aesenclast_si128 (out_4, subkey);
  out_5 = _mm_aesenclast_si128 (out_5, subkey);
  out_6 = _mm_aesenclast_si128 (out_6, subkey);
  out_7 = _mm_aesenclast_si128 (out_7, subkey);
  X = _mm_xor_si128 (X, out_0);
  X = _mm_xor_si128 (X, out_1);
  X = _mm_xor_si128 (X, out_2);
  X = _mm_xor_si128 (X, out_3);
  X = _mm_xor_si128 (X, out_4);
  X = _mm_xor_si128 (X, out_5);
  X = _mm_xor_si128 (X, out_6);
  X = _mm_xor_si128 (X, out_7);
  return X;
}
static inline __m128i
load_authenticate_store_4 (const unsigned char *restrict m, __m128i * restrict subkeys, uint32_t counter, __m128i X) {
  int i;
  __m128i subkey = subkeys[0];
  __m128i out_0 = load_96_ctr(m,++counter);
  __m128i out_1 = load_96_ctr(m+12,++counter);
  __m128i out_2 = load_96_ctr(m+24,++counter);
  __m128i out_3 = insert_counter(safe_load_96_nf(m+36),++counter);

  out_0 = _mm_xor_si128 (out_0, subkey);
  out_1 = _mm_xor_si128 (out_1, subkey);
  out_2 = _mm_xor_si128 (out_2, subkey);
  out_3 = _mm_xor_si128 (out_3, subkey);
  for (i = 1; i < AES_ROUNDS; i++) {
    subkey = subkeys[i];
    out_0 = _mm_aesenc_si128 (out_0, subkey);
    out_1 = _mm_aesenc_si128 (out_1, subkey);
    out_2 = _mm_aesenc_si128 (out_2, subkey);
    out_3 = _mm_aesenc_si128 (out_3, subkey);
  }
  subkey = subkeys[AES_ROUNDS];
  out_0 = _mm_aesenclast_si128 (out_0, subkey);
  out_1 = _mm_aesenclast_si128 (out_1, subkey);
  out_2 = _mm_aesenclast_si128 (out_2, subkey);
  out_3 = _mm_aesenclast_si128 (out_3, subkey);
  X = _mm_xor_si128 (X, out_0);
  X = _mm_xor_si128 (X, out_1);
  X = _mm_xor_si128 (X, out_2);
  X = _mm_xor_si128 (X, out_3);
  return X;
}

static inline __m128i
load_encrypt_store_8 (__m128i stream, const unsigned char *restrict m,
		      unsigned char *restrict c, __m128i * restrict X, uint32_t counter, __m128i * restrict subkeys) {
  int i;
  __m128i subkey = subkeys[0];
  __m128i in_0 = load_96_ctr(m,++counter);
  __m128i in_1 = load_96_ctr(m+12,++counter);
  __m128i in_2 = load_96_ctr(m+24,++counter);
  __m128i in_3 = load_96_ctr(m+36,++counter);
  __m128i in_4 = load_96_ctr(m+48,++counter);
  __m128i in_5 = load_96_ctr(m+60,++counter);
  __m128i in_6 = load_96_ctr(m+72,++counter);
  __m128i in_7 = insert_counter(safe_load_96_nf(m+84),++counter);
  __m128i out_0 = _mm_xor_si128 (in_0, subkey);
  __m128i out_1 = _mm_xor_si128 (in_1, subkey);
  __m128i out_2 = _mm_xor_si128 (in_2, subkey);
  __m128i out_3 = _mm_xor_si128 (in_3, subkey);
  __m128i out_4 = _mm_xor_si128 (in_4, subkey);
  __m128i out_5 = _mm_xor_si128 (in_5, subkey);
  __m128i out_6 = _mm_xor_si128 (in_6, subkey);
  __m128i out_7 = _mm_xor_si128 (in_7, subkey);
  __m128i XX;

  for (i = 1; i < AES_ROUNDS; i++) {
    subkey = subkeys[i];
    out_0 = _mm_aesenc_si128 (out_0, subkey);
    out_1 = _mm_aesenc_si128 (out_1, subkey);
    out_2 = _mm_aesenc_si128 (out_2, subkey);
    out_3 = _mm_aesenc_si128 (out_3, subkey);
    out_4 = _mm_aesenc_si128 (out_4, subkey);
    out_5 = _mm_aesenc_si128 (out_5, subkey);
    out_6 = _mm_aesenc_si128 (out_6, subkey);
    out_7 = _mm_aesenc_si128 (out_7, subkey);
  }
  subkey = subkeys[AES_ROUNDS];
  out_0 = _mm_aesenclast_si128 (out_0, subkey);
  out_1 = _mm_aesenclast_si128 (out_1, subkey);
  out_2 = _mm_aesenclast_si128 (out_2, subkey);
  out_3 = _mm_aesenclast_si128 (out_3, subkey);
  out_4 = _mm_aesenclast_si128 (out_4, subkey);
  out_5 = _mm_aesenclast_si128 (out_5, subkey);
  out_6 = _mm_aesenclast_si128 (out_6, subkey);
  out_7 = _mm_aesenclast_si128 (out_7, subkey);
  store_96(c, _mm_xor_si128 (stream, in_0));
  store_96((__m128i *) (c + 12), _mm_xor_si128 (out_0, in_1));
  store_96((__m128i *) (c + 24), _mm_xor_si128 (out_1, in_2));
  store_96((__m128i *) (c + 36), _mm_xor_si128 (out_2, in_3));
  store_96((__m128i *) (c + 48), _mm_xor_si128 (out_3, in_4));
  store_96((__m128i *) (c + 60), _mm_xor_si128 (out_4, in_5));
  store_96((__m128i *) (c + 72), _mm_xor_si128 (out_5, in_6));
  safe_store_96(c + 84, _mm_xor_si128 (out_6, in_7));
  XX = *X;
  XX = _mm_xor_si128 (XX, out_0);
  XX = _mm_xor_si128 (XX, out_1);
  XX = _mm_xor_si128 (XX, out_2);
  XX = _mm_xor_si128 (XX, out_3);
  XX = _mm_xor_si128 (XX, out_4);
  XX = _mm_xor_si128 (XX, out_5);
  XX = _mm_xor_si128 (XX, out_6);
  XX = _mm_xor_si128 (XX, out_7);
  X[0] = XX;
  return out_7;
}


static inline __m128i
load_encrypt_store_4 (__m128i stream, const unsigned char *restrict m,
		      unsigned char *restrict c, __m128i * restrict X, uint32_t counter, __m128i * restrict subkeys) {
  int i;
  __m128i subkey = subkeys[0];
  __m128i in_0 = load_96_ctr(m,++counter);
  __m128i in_1 = load_96_ctr(m+12,++counter);
  __m128i in_2 = load_96_ctr(m+24,++counter);
  __m128i in_3 = insert_counter(safe_load_96_nf(m+36),++counter);
  __m128i out_0 = _mm_xor_si128 (in_0, subkey);
  __m128i out_1 = _mm_xor_si128 (in_1, subkey);
  __m128i out_2 = _mm_xor_si128 (in_2, subkey);
  __m128i out_3 = _mm_xor_si128 (in_3, subkey);
  __m128i XX;

  for (i = 1; i < AES_ROUNDS; i++) {
    subkey = subkeys[i];
    out_0 = _mm_aesenc_si128 (out_0, subkey);
    out_1 = _mm_aesenc_si128 (out_1, subkey);
    out_2 = _mm_aesenc_si128 (out_2, subkey);
    out_3 = _mm_aesenc_si128 (out_3, subkey);
  }
  subkey = subkeys[AES_ROUNDS];
  out_0 = _mm_aesenclast_si128 (out_0, subkey);
  out_1 = _mm_aesenclast_si128 (out_1, subkey);
  out_2 = _mm_aesenclast_si128 (out_2, subkey);
  out_3 = _mm_aesenclast_si128 (out_3, subkey);
  store_96((__m128i *) c, _mm_xor_si128 (stream, in_0));
  store_96((__m128i *) (c + 12), _mm_xor_si128 (out_0, in_1));
  store_96((__m128i *) (c + 24), _mm_xor_si128 (out_1, in_2));
  safe_store_96(c + 36, _mm_xor_si128 (out_2, in_3));
  XX = *X;
  XX = _mm_xor_si128 (XX, out_0);
  XX = _mm_xor_si128 (XX, out_1);
  XX = _mm_xor_si128 (XX, out_2);
  XX = _mm_xor_si128 (XX, out_3);
  X[0] = XX;
  return out_3;
}



#else 
static inline __m128i
load_authenticate_store_8 (const unsigned char *restrict m, __m128i * restrict subkeys, uint32_t counter, __m128i X) {
  int i,j;
  __m128i out[8];
  __m128i subkey = subkeys[0];
  for (i = 0; i < 7; i++, m+=12)
    out[i] = load_96_ctr(m,++counter);
  out[7] = insert_counter(safe_load_96_nf(m),++counter);
  for (i = 0; i < 8; i++)
    out[i] = _mm_xor_si128(out[i], subkey);
  for (j = 1; j < AES_ROUNDS; j++) {
    subkey = subkeys[j];
    for (i = 0; i < 8; i++)
      out[i] = _mm_aesenc_si128 (out[i], subkey);
  }
  subkey = subkeys[AES_ROUNDS];
  for (i = 0; i < 8; i++)
    out[i] = _mm_aesenclast_si128 (out[i], subkey);
  for (i = 0; i < 8; i++)
    X = _mm_xor_si128 (X, out[i]);
  return X;
}

static inline __m128i
load_authenticate_store_4 (const unsigned char *restrict m, __m128i * restrict subkeys, uint32_t counter, __m128i X) {
  int i,j;
  __m128i out[4];
  __m128i subkey = subkeys[0];
  for (i = 0; i < 3; i++, m+=12)
    out[i] = load_96_ctr(m,++counter);
  out[3] = insert_counter(safe_load_96_nf(m),++counter);
  for (i = 0; i < 4; i++)
    out[i] = _mm_xor_si128(out[i], subkey);
  for (j = 1; j < AES_ROUNDS; j++) {
    subkey = subkeys[j];
    for (i = 0; i < 4; i++)
      out[i] = _mm_aesenc_si128 (out[i], subkey);
  }
  subkey = subkeys[AES_ROUNDS];
  for (i = 0; i < 4; i++)
    out[i] = _mm_aesenclast_si128 (out[i], subkey);
  for (i = 0; i < 4; i++)
    X = _mm_xor_si128 (X, out[i]);
  return X;
}

static inline __m128i
load_encrypt_store_8 (__m128i stream, const unsigned char *restrict m,
		      unsigned char *restrict c, __m128i * restrict X, uint32_t counter, __m128i * restrict subkeys) {
  int i,j;
  __m128i in[8], out[8];
  __m128i subkey = subkeys[0];
  for (i = 0; i < 7; i++, m+=12)
    in[i] = load_96_ctr(m,++counter);
  in[7] = insert_counter(safe_load_96_nf(m),++counter);
  for (i = 0; i < 8; i++)
    out[i] = _mm_xor_si128(in[i], subkey);
  for (j = 1; j < AES_ROUNDS; j++) {
    subkey = subkeys[j];
    for (i = 0; i < 8; i++)
      out[i] = _mm_aesenc_si128 (out[i], subkey);
  }
  subkey = subkeys[AES_ROUNDS];
  for (i = 0; i < 8; i++){
    out[i] = _mm_aesenclast_si128 (out[i], subkey);
    X[0] = _mm_xor_si128 (X[0], out[i]);
  }
  store_96( c, _mm_xor_si128 (stream, in[0]));
  for (i = 1, c+=12; i < 7; i++, c+=12)
    store_96( c, _mm_xor_si128 (out[i-1], in[i]));
  safe_store_96(c, _mm_xor_si128(out[6],in[7]));
    
  return out[7];
}


static inline __m128i
load_encrypt_store_4 (__m128i stream, const unsigned char *restrict m,
		      unsigned char *restrict c, __m128i * restrict X, uint32_t counter, __m128i * restrict subkeys) {
  int i,j;
  __m128i in[4], out[4];
  __m128i subkey = subkeys[0];
  for (i = 0; i < 3; i++, m+=12)
    in[i] = load_96_ctr(m,++counter);
  in[3] = insert_counter(safe_load_96_nf(m),++counter);
  for (i = 0; i < 4; i++)
    out[i] = _mm_xor_si128(in[i], subkey);
  for (j = 1; j < AES_ROUNDS; j++) {
    subkey = subkeys[j];
    for (i = 0; i < 4; i++)
      out[i] = _mm_aesenc_si128 (out[i], subkey);
  }
  subkey = subkeys[AES_ROUNDS];
  for (i = 0; i < 4; i++){
    out[i] = _mm_aesenclast_si128 (out[i], subkey);
     X[0] = _mm_xor_si128 (X[0], out[i]);
  }
 store_96 ( c, _mm_xor_si128 (stream, in[0]));
 for (i = 1, c+=12; i < 3; i++, c+=12)
    store_96 ( c, _mm_xor_si128 (out[i-1], in[i]));
  safe_store_96 ( c, _mm_xor_si128 (out[2], in[3]));
  return out[3];
}



#endif /* if UNROLL_LOOPS */

static inline __m128i
load_authenticate_store_2 (const unsigned char *restrict m, __m128i * restrict subkeys, uint32_t counter, __m128i X) {
  int i;
  __m128i subkey = subkeys[0];
  __m128i out_0 = load_96_ctr(m,++counter);
  __m128i out_1 = insert_counter(safe_load_96_nf(m+12),++counter);

  out_0 = _mm_xor_si128 (out_0, subkey);
  out_1 = _mm_xor_si128 (out_1, subkey);
  for (i = 1; i < AES_ROUNDS; i++) {
    subkey = subkeys[i];
    out_0 = _mm_aesenc_si128 (out_0, subkey);
    out_1 = _mm_aesenc_si128 (out_1, subkey);
  }
  subkey = subkeys[AES_ROUNDS];
  out_0 = _mm_aesenclast_si128 (out_0, subkey);
  out_1 = _mm_aesenclast_si128 (out_1, subkey);
  X = _mm_xor_si128 (X, out_0);
  X = _mm_xor_si128 (X, out_1);
  return X;
}


static inline __m128i
load_encrypt_store_2 (__m128i stream, const unsigned char *restrict m,
		      unsigned char *restrict c, __m128i * restrict X, uint32_t counter, __m128i * restrict subkeys) {
  int i;
  __m128i subkey = subkeys[0];
  __m128i in_0 = load_96_ctr( m, ++counter);
  __m128i in_1 = insert_counter(safe_load_96_nf(m+12),++counter);
  __m128i out_0 = _mm_xor_si128 (in_0, subkey);
  __m128i out_1 = _mm_xor_si128 (in_1, subkey);
  __m128i XX;

  for (i = 1; i < AES_ROUNDS; i++) {
    subkey = subkeys[i];
    out_0 = _mm_aesenc_si128 (out_0, subkey);
    out_1 = _mm_aesenc_si128 (out_1, subkey);
  }
  subkey = subkeys[AES_ROUNDS];
  out_0 = _mm_aesenclast_si128 (out_0, subkey);
  out_1 = _mm_aesenclast_si128 (out_1, subkey);
  store_96( c, _mm_xor_si128 (stream, in_0));
  safe_store_96 (c + 12, _mm_xor_si128 (out_0, in_1));
  XX = *X;
  XX = _mm_xor_si128 (XX, out_0);
  XX = _mm_xor_si128 (XX, out_1);
  X[0] = XX;
  return out_1;
}

static inline __m128i
AES_encrypt_block (__m128i in, __m128i * subkeys) {
  int i;
  __m128i subkey, out;

  out = _mm_xor_si128 (in, subkeys[0]);
  for (i = 1; i < AES_ROUNDS; i++) {
    subkey = subkeys[i];
    out = _mm_aesenc_si128 (out, subkey);
  }
  return _mm_aesenclast_si128 (out, subkeys[AES_ROUNDS]);
}

#if KEYBITS == 256
/* Encrypt two separate blocks. Only used in AES-256 key setup */
static inline void
AES_encrypt_2 (__m128i in0, __m128i * _out0, __m128i in1, __m128i * _out1, __m128i * subkeys) {
  int i;
  __m128i subkey, out0, out1;

  subkey = subkeys[0];
  out0 = _mm_xor_si128 (in0, subkey);
  out1 = _mm_xor_si128 (in1, subkey);
  for (i = 1; i < AES_ROUNDS; i++) {
    subkey = subkeys[i];
    out0 = _mm_aesenc_si128 (out0, subkey);
    out1 = _mm_aesenc_si128 (out1, subkey);
  }
  subkey = subkeys[AES_ROUNDS];
  *_out0 = _mm_aesenclast_si128 (out0, subkey);
  *_out1 = _mm_aesenclast_si128 (out1, subkey);
}
#endif /*KEYBITS == 256 */

static inline void
init (const unsigned char *_npub, __m128i * userkey, __m128i * kappa_0,
      __m128i * kappa_m, __m128i * key, __m128i * nonce) {
  __m128i npub, nonce_0, nonce_m;

  npub = _mm_loadu_si128 ((__m128i *) _npub);
#if NONCE_LENGTH != 12
  npub = _mm_slli_si128 (npub, BLOCK_LENGTH - NONCE_LENGTH);
  npub = _mm_srli_si128 (npub, BLOCK_LENGTH - NONCE_LENGTH);
#endif
#if NONCE_LENGTH <= 12
  nonce_0 = _mm_insert_epi32 (npub, (int) (NONCE_TYPE) << 0x18, 3);
  nonce_m = _mm_insert_epi32 (npub, (int) (NONCE_TYPE + NONCE_INCREMENT) << 0x18, 3);
#else
  nonce_0 = _mm_or_si128 (npub, _mm_insert_epi32 (_mm_setzero_si128 (), (int) (NONCE_TYPE) << 0x18, 3));
  nonce_m =
    _mm_or_si128 (npub, _mm_insert_epi32 (_mm_setzero_si128 (), (int) (NONCE_TYPE + NONCE_INCREMENT) << 0x18, 3));
#endif
  *nonce = nonce_m;
#if KEYBITS == 128
  AES_128_Key_Expansion_and_encryption (userkey, key, nonce_0, nonce_m, kappa_0, kappa_m);
  AES_128_Key_Expansion_2 (kappa_0, kappa_m);
#else
  AES_256_Key_Expansion_and_encryption (userkey, key, nonce_0, nonce_m, kappa_0, kappa_m);
  AES_encrypt_2 (*kappa_0, kappa_0 + 1, *kappa_m, kappa_m + 1, key);
  AES_256_Key_Expansion_2 (kappa_0, kappa_m);
#endif
}




int
crypto_aead_encrypt (unsigned char *c, unsigned long long *clen,
		     const unsigned char *m, unsigned long long mlen,
		     const unsigned char *ad, unsigned long long adlen,
		     const unsigned char *nsec, const unsigned char *npub, const unsigned char *k) {
  __m128i key[AES_ROUNDS + 1];
  __m128i kappa_0[AES_ROUNDS + 1];
  __m128i kappa_m[AES_ROUNDS + 1];
  __m128i X;
  __m128i P;
  __m128i stream;
  __m128i nonce;
  uint32_t counter;

  (void) nsec;			/* avoid warning */

  *clen = mlen + TAG_LENGTH;

  init (npub, (__m128i *) k, kappa_0, kappa_m, key, &nonce);

  /* Block encoding alen and mlen
   * In an online implementation, it would be done at the end, and X
   * would be 0
   */
  X = _mm_insert_epi32 (_mm_cvtsi64x_si128 (bswap64 (mlen)), bswap32 ((unsigned int) adlen), 2);
  AES_encrypt (X, X, kappa_0);

  /* AD processing */
  counter = 0;
    while (adlen >= PAYLOAD_SIZE * 8) {
      X = load_authenticate_store_8 (ad, kappa_0, counter, X);
      ad += PAYLOAD_SIZE * 8;
      adlen -= PAYLOAD_SIZE * 8;
      counter += 8;
    }
    if (adlen >= PAYLOAD_SIZE * 4) {
      X = load_authenticate_store_4 (ad, kappa_0, counter, X);
      ad += PAYLOAD_SIZE * 4;
      adlen -= PAYLOAD_SIZE * 4;
      counter += 4;
    }
    if (adlen >= PAYLOAD_SIZE * 2) {
      X = load_authenticate_store_2 (ad, kappa_0, counter, X);
      ad += PAYLOAD_SIZE * 2;
      adlen -= PAYLOAD_SIZE * 2;
      counter += 2;
    }
    if (adlen >= PAYLOAD_SIZE) {
      AES_encrypt_xor (safe_load_96_ctr(ad,++counter), stream, kappa_0, X);
      ad += PAYLOAD_SIZE;
      adlen -= PAYLOAD_SIZE;
    }
    if (adlen > 0) {
      AES_encrypt_xor (safe_load_partial_ctr(ad,adlen,++counter), stream, kappa_0, X);
    }

    /* Plaintext processing */
  if (mlen > 0) {
    *kappa_m = _mm_xor_si128 (*kappa_m, *kappa_0);
    counter = 0;
    AES_encrypt (_mm_setzero_si128 (), stream, kappa_m);
    while (mlen >= PAYLOAD_SIZE * 8) {
      stream = load_encrypt_store_8 (stream, m, c, &X, counter, kappa_m);
      m += PAYLOAD_SIZE * 8;
      c += PAYLOAD_SIZE * 8;
      mlen -= PAYLOAD_SIZE * 8;
      counter += 8;
    }
    if (mlen >= PAYLOAD_SIZE * 4) {
      stream = load_encrypt_store_4 (stream, m, c, &X, counter, kappa_m);
      m += PAYLOAD_SIZE * 4;
      c += PAYLOAD_SIZE * 4;
      mlen -= PAYLOAD_SIZE * 4;
      counter += 4;
    }
    if (mlen >= PAYLOAD_SIZE * 2) {
      stream = load_encrypt_store_2 (stream, m, c, &X, counter, kappa_m);
      m += PAYLOAD_SIZE * 2;
      c += PAYLOAD_SIZE * 2;
      mlen -= PAYLOAD_SIZE * 2;
      counter += 2;
    }
    if (mlen >= PAYLOAD_SIZE) {
      P = safe_load_96_ctr(m,++counter);
      safe_store_96(c, _mm_xor_si128 (P, stream));
      AES_encrypt_xor (P, stream, kappa_m, X);
      m += PAYLOAD_SIZE;
      c += PAYLOAD_SIZE;
      mlen -= PAYLOAD_SIZE;
    }
    if (mlen > 0) {
      P = safe_load_partial_ctr(m,mlen,++counter);
      safe_store_partial(c,mlen, _mm_xor_si128 (P, stream));
      AES_encrypt_xor (P, stream, kappa_m, X);
      c+=mlen;
    }
  }
  AES_encrypt (X, X, kappa_0);
#if TAG_LENGTH == 16
  _mm_storeu_si128 ((__m128i *) c, X);
#else
  memcpy (c, &X, TAG_LENGTH);
#endif
  return 0;
}


int
crypto_aead_decrypt (unsigned char *m, unsigned long long *outputmlen,
		     unsigned char *nsec,
		     const unsigned char *c, unsigned long long clen,
		     const unsigned char *ad, unsigned long long adlen,
		     const unsigned char *npub, const unsigned char *k) {
  __m128i key[AES_ROUNDS + 1];
  __m128i kappa_0[AES_ROUNDS + 1];
  __m128i kappa_m[AES_ROUNDS + 1];
  __m128i X;
  __m128i P;
  __m128i stream;
  __m128i nonce;
  unsigned counter;
  unsigned long long mlen;

  (void) nsec;	/* avoid warning */
  if (clen < TAG_LENGTH)
    return -1;
  *outputmlen = mlen = clen - TAG_LENGTH;

  init (npub, (__m128i *) k, kappa_0, kappa_m, key, &nonce);


  /* Block encoding alen and mlen
   * In an online implementation, it would be done at the end, and X
   * would be 0
   */
  X = _mm_insert_epi32 (_mm_cvtsi64x_si128 (bswap64 (mlen)), bswap32 ((unsigned) adlen), 2);
  AES_encrypt (X, X, kappa_0);

  /* AD processing */
  counter = 0;
    while (adlen >= PAYLOAD_SIZE * 8) {
      X = load_authenticate_store_8 (ad, kappa_0, counter, X);
      ad += PAYLOAD_SIZE * 8;
      adlen -= PAYLOAD_SIZE * 8;
      counter += 8;
    }
    if (adlen >= PAYLOAD_SIZE * 4) {
      X = load_authenticate_store_4 (ad, kappa_0, counter, X);
      ad += PAYLOAD_SIZE * 4;
      adlen -= PAYLOAD_SIZE * 4;
      counter += 4;
    }
    if (adlen >= PAYLOAD_SIZE * 2) {
      X = load_authenticate_store_2 (ad, kappa_0, counter, X);
      ad += PAYLOAD_SIZE * 2;
      adlen -= PAYLOAD_SIZE * 2;
      counter += 2;
    }
    if (adlen >= PAYLOAD_SIZE) {
      AES_encrypt_xor (safe_load_96_ctr(ad,++counter), stream, kappa_0, X);
      ad += PAYLOAD_SIZE;
      adlen -= PAYLOAD_SIZE;
    }
    if (adlen > 0) {
      AES_encrypt_xor (safe_load_partial_ctr(ad,adlen,++counter), stream, kappa_0, X);
    }

  /* Plaintext processing */
  if (mlen > 0) {
    *kappa_m = _mm_xor_si128 (*kappa_0, *kappa_m);
    counter = 0;
    AES_encrypt (_mm_setzero_si128 (), stream, kappa_m);
    if (mlen >= BLOCK_LENGTH){
      P = _mm_xor_si128 (stream, load_96(c));
      while (mlen >= PAYLOAD_SIZE + BLOCK_LENGTH) {
	__m128i P2 = insert_counter(P, ++counter);
	AES_encrypt_xor (P2, stream, kappa_m, X);
	c += PAYLOAD_SIZE;
	P = _mm_xor_si128 (stream, load_96(c));
	store_96(m, P2);
	m += PAYLOAD_SIZE;
	mlen -= PAYLOAD_SIZE;
      }
      P = insert_counter(P, ++counter);
      safe_store_96(m,P);
      AES_encrypt_xor (P, stream, kappa_m, X);
      m += PAYLOAD_SIZE;
      c += PAYLOAD_SIZE;
      mlen -= PAYLOAD_SIZE;
    } 
    if (mlen >= PAYLOAD_SIZE){
      P = insert_counter(_mm_xor_si128 (stream, safe_load_96(c)), ++counter);
      safe_store_96(m,P);
      AES_encrypt_xor (P, stream, kappa_m, X);
      m += PAYLOAD_SIZE;
      c += PAYLOAD_SIZE;
      mlen -= PAYLOAD_SIZE;
    }
    if (mlen > 0) {
      P = insert_counter(xor_partial(c,stream,m,mlen), ++counter);
      AES_encrypt_xor (P, stream, kappa_m, X);
      c+=mlen;
    }
  }
  AES_encrypt (X, X, kappa_0);
  return verify_tag((unsigned char*)&X, c);
}
