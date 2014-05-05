#include <stdio.h>
#include "api.h"
#include "crypto_aead.h"

typedef unsigned char u8;
typedef unsigned int u32;
typedef unsigned long long u64;

#define LITTLE_ENDIAN
//#define BIG_ENDIAN

#define RATE (320 / 8 - 2 * CRYPTO_KEYBYTES)
#define PA_ROUNDS 12
#define PB_ROUNDS 8

#define ROTR(x,n) (((x)>>(n))|((x)<<(64-(n))))
#define ROTR32(x,n) (((x)>>(n))|((x)<<(32-(n))))
#define M64(a,b) (((u64)(a))<<32|(b))

#ifdef BIG_ENDIAN
#define EXT_BYTE(x,n) ((u8)((u64)(x)>>(8*(n))))
#define INS_BYTE(x,n) ((u64)(x)<<(8*(n)))
#define U64BIG(x) (x)
#define U32BIG(x) (x)
#endif

#ifdef LITTLE_ENDIAN
#define EXT_BYTE(x,n) ((u8)((u64)(x)>>(8*(7-(n)))))
#define INS_BYTE(x,n) ((u64)(x)<<(8*(7-(n))))
#define U64BIG(x) \
    ((ROTR(x, 8) & (0xFF000000FF000000ULL)) | \
     (ROTR(x,24) & (0x00FF000000FF0000ULL)) | \
     (ROTR(x,40) & (0x0000FF000000FF00ULL)) | \
     (ROTR(x,56) & (0x000000FF000000FFULL)))
#define U32BIG(x) \
    ((ROTR32(x, 8) & (0xFF00FF00ULL)) | \
     (ROTR32(x,24) & (0x00FF00FFULL)))
#endif

static const int R[5][2] = { {19, 28}, {39, 61}, {1, 6}, {10, 17}, {7, 41} };

#define ROUND(C) ({\
    x2 ^= C;\
    x0 ^= x4;\
    x4 ^= x3;\
    x2 ^= x1;\
    t0 = x0;\
    t4 = x4;\
    t3 = x3;\
    t1 = x1;\
    t2 = x2;\
    x0 = t0 ^ ((~t1) & t2);\
    x2 = t2 ^ ((~t3) & t4);\
    x4 = t4 ^ ((~t0) & t1);\
    x1 = t1 ^ ((~t2) & t3);\
    x3 = t3 ^ ((~t4) & t0);\
    x1 ^= x0;\
    t1  = x1;\
    x1 = ROTR(x1, R[1][0]);\
    x3 ^= x2;\
    t2  = x2;\
    x2 = ROTR(x2, R[2][0]);\
    t4  = x4;\
    t2 ^= x2;\
    x2 = ROTR(x2, R[2][1] - R[2][0]);\
    t3  = x3;\
    t1 ^= x1;\
    x3 = ROTR(x3, R[3][0]);\
    x0 ^= x4;\
    x4 = ROTR(x4, R[4][0]);\
    t3 ^= x3;\
    x2 ^= t2;\
    x1 = ROTR(x1, R[1][1] - R[1][0]);\
    t0  = x0;\
    x2 = ~x2;\
    x3 = ROTR(x3, R[3][1] - R[3][0]);\
    t4 ^= x4;\
    x4 = ROTR(x4, R[4][1] - R[4][0]);\
    x3 ^= t3;\
    x1 ^= t1;\
    x0 = ROTR(x0, R[0][0]);\
    x4 ^= t4;\
    t0 ^= x0;\
    x0 = ROTR(x0, R[0][1] - R[0][0]);\
    x0 ^= t0;\
  })

#define P12 ({\
  ROUND(0xf0);\
  ROUND(0xe1);\
  ROUND(0xd2);\
  ROUND(0xc3);\
  ROUND(0xb4);\
  ROUND(0xa5);\
  ROUND(0x96);\
  ROUND(0x87);\
  ROUND(0x78);\
  ROUND(0x69);\
  ROUND(0x5a);\
  ROUND(0x4b);\
})

#define P8 ({\
  ROUND(0xf0);\
  ROUND(0xe1);\
  ROUND(0xd2);\
  ROUND(0xc3);\
  ROUND(0xb4);\
  ROUND(0xa5);\
  ROUND(0x96);\
  ROUND(0x87);\
})

int crypto_aead_encrypt(
    unsigned char *c, unsigned long long *clen,
    const unsigned char *m, unsigned long long mlen,
    const unsigned char *ad, unsigned long long adlen,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k) {

  u32 K0 = U32BIG(((u32*)k)[0]);
  u32 K1 = U32BIG(((u32*)k)[1]);
  u32 K2 = U32BIG(((u32*)k)[2]);
  u32 N0 = U32BIG(((u32*)npub)[0]);
  u32 N1 = U32BIG(((u32*)npub)[1]);
  u32 N2 = U32BIG(((u32*)npub)[2]);
  u64 x0, x1, x2, x3, x4;
  u64 t0, t1, t2, t3, t4;
  u64 rlen;
  int i;

  // initialization
  x0 = (u64)((CRYPTO_KEYBYTES * 8) << 16 | PA_ROUNDS << 8 | PB_ROUNDS << 0) << 40;
  x1 = 0;
  x2 = M64(K0, K1);
  x3 = M64(K2, N0);
  x4 = M64(N1, N2);
  P12;
  x3 ^= M64( 0, K0);
  x4 ^= M64(K1, K2);

  // process associated data
  if (adlen) {
    rlen = adlen;
    while (rlen >= RATE) {
      x0 ^= U64BIG(*(u64*)ad);
      x1 ^= U64BIG(*(u64*)(ad + 8));
      P8;
      rlen -= RATE;
      ad += RATE;
    }
    for (i = 0; i < rlen; ++i, ++ad)
      if (i < 8)
        x0 ^= INS_BYTE(*ad, i);
      else
        x1 ^= INS_BYTE(*ad, i);
    if (rlen < 8)
      x0 ^= INS_BYTE(0x80, rlen);
    else
      x1 ^= INS_BYTE(0x80, rlen);
    P8;
  }
  x4 ^= 1;

  // process plaintext
  rlen = mlen;
  while (rlen >= RATE) {
    x0 ^= U64BIG(*(u64*)m);
    x1 ^= U64BIG(*(u64*)(m + 8));
    *(u64*)c = U64BIG(x0);
    *(u64*)(c + 8) = U64BIG(x1);
    P8;
    rlen -= RATE;
    m += RATE;
    c += RATE;
  }
  for (i = 0; i < rlen; ++i, ++m, ++c) {
    if (i < 8) {
      x0 ^= INS_BYTE(*m, i);
      *c = EXT_BYTE(x0, i);
    } else {
      x1 ^= INS_BYTE(*m, i);
      *c = EXT_BYTE(x1, i);
    }
  }
  if (rlen < 8)
    x0 ^= INS_BYTE(0x80, rlen);
  else
    x1 ^= INS_BYTE(0x80, rlen);

  // finalization
  x2 ^= M64(K0, K1);
  x3 ^= M64(K2,  0);
  P12;
  x3 ^= M64( 0, K0);
  x4 ^= M64(K1, K2);

  // return tag
  ((u32*)c)[0] = U32BIG((u32)x3);
  ((u32*)c)[1] = U32BIG((u32)(x4 >> 32));
  ((u32*)c)[2] = U32BIG((u32)x4);
  *clen = mlen + CRYPTO_KEYBYTES;

  return 0;
}

int crypto_aead_decrypt(
    unsigned char *m, unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c, unsigned long long clen,
    const unsigned char *ad, unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k) {

  *mlen = 0;
  if (clen < CRYPTO_KEYBYTES)
    return -1;

  u32 K0 = U32BIG(((u32*)k)[0]);
  u32 K1 = U32BIG(((u32*)k)[1]);
  u32 K2 = U32BIG(((u32*)k)[2]);
  u32 N0 = U32BIG(((u32*)npub)[0]);
  u32 N1 = U32BIG(((u32*)npub)[1]);
  u32 N2 = U32BIG(((u32*)npub)[2]);
  u64 x0, x1, x2, x3, x4;
  u64 t0, t1, t2, t3, t4;
  u64 rlen;
  int i;

  // initialization
  x0 = (u64)((CRYPTO_KEYBYTES * 8) << 16 | PA_ROUNDS << 8 | PB_ROUNDS << 0) << 40;
  x1 = 0;
  x2 = M64(K0, K1);
  x3 = M64(K2, N0);
  x4 = M64(N1, N2);
  P12;
  x3 ^= M64( 0, K0);
  x4 ^= M64(K1, K2);

  // process associated data
  if (adlen) {
    rlen = adlen;
    while (rlen >= RATE) {
      x0 ^= U64BIG(*(u64*)ad);
      x1 ^= U64BIG(*(u64*)(ad + 8));
      P8;
      rlen -= RATE;
      ad += RATE;
    }
    for (i = 0; i < rlen; ++i, ++ad)
      if (i < 8)
        x0 ^= INS_BYTE(*ad, i);
      else
        x1 ^= INS_BYTE(*ad, i);
    if (rlen < 8)
      x0 ^= INS_BYTE(0x80, rlen);
    else
      x1 ^= INS_BYTE(0x80, rlen);
    P8;
  }
  x4 ^= 1;

  // process plaintext
  rlen = clen - CRYPTO_KEYBYTES;
  while (rlen >= RATE) {
    *(u64*)m = U64BIG(x0) ^ *(u64*)c;
    *(u64*)(m + 8) = U64BIG(x1) ^ *(u64*)(c + 8);
    x0 = U64BIG(*((u64*)c));
    x1 = U64BIG(*((u64*)(c + 8)));
    P8;
    rlen -= RATE;
    m += RATE;
    c += RATE;
  }
  for (i = 0; i < rlen; ++i, ++m, ++c) {
    if (i < 8) {
      *m = EXT_BYTE(x0, i) ^ *c;
      x0 &= ~INS_BYTE(0xff, i);
      x0 |= INS_BYTE(*c, i);
    } else {
      *m = EXT_BYTE(x1, i) ^ *c;
      x1 &= ~INS_BYTE(0xff, i);
      x1 |= INS_BYTE(*c, i);
    }
  }
  if (rlen < 8)
    x0 ^= INS_BYTE(0x80, rlen);
  else
    x1 ^= INS_BYTE(0x80, rlen);

  // finalization
  x2 ^= M64(K0, K1);
  x3 ^= M64(K2,  0);
  P12;
  x3 ^= M64( 0, K0);
  x4 ^= M64(K1, K2);

  // return -1 if verification fails
  if (((u32*)c)[0] != U32BIG((u32)x3) ||
      ((u32*)c)[1] != U32BIG((u32)(x4 >> 32)) ||
      ((u32*)c)[2] != U32BIG((u32)x4))
    return -1;

  // return plaintext
  *mlen = clen - CRYPTO_KEYBYTES;
  return 0;
}
