/*
  aesenc-int.c version $Date: 2016/01/30 12:37:00 $
  AES-GCM.
  Romain Dolbeau
  Public Domain
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <arm_neon.h>
#include "crypto_aead.h"
#include "stdaes-common.h"

#include <openssl/evp.h>

#define ACCBY8

#define AES_USE_ASM

#define ALIGN16  __attribute__((aligned(16)))
#define ALIGN32  __attribute__((aligned(32)))
#define ALIGN64  __attribute__((aligned(64)))
#define _bswap64(a) __builtin_bswap64(a)
#define _bswap(a) __builtin_bswap32(a)

#define print16c(s,A)                           \
  do {                                          \
    int k;                                      \
    printf("%s: %s = ", s, ""#A);               \
    for (k = 0 ; k < 16 ; k++) {                \
      printf("%02hhx", ((unsigned char*)A)[k]); \
      if ((k%4)==3) printf(" ");                \
    }                                           \
    printf("\n");                               \
  }while (0)
  
#define printv16c(p,v)                                                  \
  {                                                                     \
    ALIGN16 unsigned char temp[16];                                     \
    vst1q_u8(temp, (uint8x16_t)v);                                      \
    int z;                                                              \
    printf("%8s:%8s = ",p,#v);                                          \
    for (z = 15 ; z >= 0 ; z--) {                                       \
      printf("%02hhx", temp[z]);                                        \
      if ((z%4)==0) printf(" ");                                        \
    }                                                                   \
    printf("\n");                                                       \
  }



/** single, by-the-book AES encryption with AES-NI */
static inline void aes_armv8_encrypt1(unsigned char *out, const unsigned char *n, const unsigned char *rkeys) {
  uint8x16_t temp = vld1q_u8(n);
  int i;
/* 
   In ARMv8+crypto, the AESE instruction does the 'AddRoundKey' first then SubBytes and ShiftRows.
   The AESMC instruction does the MixColumns.
   So instead of a single XOR of the first round key before the rounds,
   we end up having a single XOR of the last round key after the rounds.
*/
#if 1
#pragma unroll(13)
  for (i = 0 ; i < 13 ; i++) {
#ifdef AES_USE_ASM
    uint32x4_t t;
    t = vld1q_u32((unsigned int*)(rkeys+i*16));\
    asm("aese %0.16b, %1.16b\naesmc %0.16b, %0.16b\n" : "+w"(temp) : "w"(t));
#else
    temp = vaeseq_u8(temp, vld1q_u8(rkeys+i*16));
    temp = vaesmcq_u8(temp);
#endif
  }
#else
#define ROUND(i) \
	temp = vaeseq_u8(temp, vld1q_u8(rkeys + i*16));temp = vaesmcq_u8(temp)
#define MAKE13(X)\
X(0);X(1);X(2);X(3);X(4);X(5);X(6);X(7);X(8);X(9);X(10);X(11);X(12)
MAKE13(ROUND);
#undef ROUND
#undef MAKE13
#endif
  temp = vaeseq_u8(temp, vld1q_u8((rkeys+208)));
  temp = veorq_u8(temp,  vld1q_u8((rkeys+224)));

  vst1q_u8(out, temp);
}

/* naive */
/* Reverse doublewords (64 bits) in a quadwords (128 bits) vector */
static inline uint32x4_t vreversedbwq_u128(const uint32x4_t x) {
	uint8x16_t x2 = vreinterpretq_u8_u32(x);
	uint8x16_t x2r = vextq_u8(x2,x2,8);
	return vreinterpretq_u32_u8(x2r);
}

/* naive */
/* Reverse byte (8 bits) in a quadwords (128 bits) vector */
static inline uint32x4_t vreversebyteq_u128(const uint32x4_t x) {
	uint8x16_t x2 = vreinterpretq_u8_u32(x);
	uint8x16_t x2pbr = vrev64q_u8(x2);
	uint8x16_t x2r = vextq_u8(x2pbr,x2pbr,8);
	return vreinterpretq_u32_u8(x2r);
}

/* naive */
/* Reverse words (32 bits) in a quadwords (128 bits) vector */
static inline uint32x4_t vreversewq_u32(const uint32x4_t x) {
	uint8x16_t x2pbr = vreinterpretq_u8_u32(vrev64q_u32(x));
	uint8x16_t x2r = vextq_u8(x2pbr,x2pbr,8);
	return vreinterpretq_u32_u8(x2r);
}

/* gcc propagate constants so that it sees a constant parameter to vextq_u32... llvm doesn't :-( */
#if 0
/*  */
/* Rotate an entire vector to the left, word-wise */
static inline uint32x4_t vrotatewordsleft_u32(const uint32x4_t x, const int v) {
	uint32x4_t vzero = vdupq_n_u32(0);
	uint32x4_t y = vextq_u32(x,vzero,v);
	return y;
}

/*  */
/* Rotate an entire vector to the right, word-wise */
static inline uint32x4_t vrotatewordsright_u32(const uint32x4_t x, const int v) {
	uint32x4_t vzero = vdupq_n_u32(0);
	uint32x4_t y = vextq_u32(vzero,x,4-v);
	return y;
}
#else
#define vrotatewordsleft_u32(x,v) vextq_u32(x,vdupq_n_u32(0),v)
#define vrotatewordsright_u32(x,v) vextq_u32(vdupq_n_u32(0),x,4-v)
#endif


/* ARM bit-reversal inside a 32 bits word */
static inline uint32_t rbit(const uint32_t x) {
  uint32_t r= 0xDEADBEEF;
  asm("rbit %w0,%w1" : "=r"(r) : "r"(x));
  return r;
}

/* ARM byte-reversal inside a 32 bits word */
static inline uint32_t bswap32(const uint32_t x) {
#if 0
  uint32_t t = 0;
  t |= (((x >>  0)&0xFF) << 24);
  t |= (((x >>  8)&0xFF) << 16);
  t |= (((x >> 16)&0xFF) <<  8);
  t |= (((x >> 24)&0xFF) <<  0);
  return t;
#else
  uint32_t r;
  asm volatile("rev %w0,%w1" : "=r"(r) : "r"(x));
  return r;
#endif
}



/** multiple-blocks-at-once AES encryption with ARMv9+crypto */
/* Step 1 : loading the nonce */
/* load & increment the n vector (non-vectorized, unused for now) */
#define NVx(a)                                                  \
  uint32x4_t nv##a = vld1q_u32(n);n[3]=_bswap(_bswap(n[3])+1)

#ifdef AES_USE_ASM
#define AESENCx(a)\
  { uint32x4_t t;\
  t = vld1q_u32((unsigned int*)(rkeys+i*16));\
  asm("aese %0.16b, %1.16b\naesmc %0.16b, %0.16b\n" : "+w"(nv##a) : "w"(t));\
  }
#else
/* Step 2: one round of AES */
#define AESENCx(a)                                      \
  nv##a = (uint32x4_t)vaeseq_u8((uint8x16_t)nv##a, vld1q_u8(rkeys+i*16)); nv##a = (uint32x4_t)vaesmcq_u8((uint8x16_t)nv##a)
#endif

/* Step 3: last round of AES */
#define AESENCLASTx(a)                                  \
  nv##a = (uint32x4_t)vaeseq_u8((uint8x16_t)nv##a, vld1q_u8((rkeys+208))); nv##a = veorq_u32(nv##a, vld1q_u32((unsigned int*)(rkeys+224)))

/* Step 4: store result */
#define STOREx(a)                                       \
  vst1q_u32((unsigned int*)(out+(a*16)), nv##a)

/* all the MAKE* macros are for automatic explicit unrolling */
#define MAKE2(X)                                \
  X(0);X(1)

#define MAKE4(X)                                \
  X(0);X(1);X(2);X(3)

#define MAKE6(X)                                \
  X(0);X(1);X(2);X(3);                          \
  X(4);X(5)

#define MAKE7(X)                                \
  X(0);X(1);X(2);X(3);                          \
  X(4);X(5);X(6)

#define MAKE8(X)                                \
  X(0);X(1);X(2);X(3);                          \
  X(4);X(5);X(6);X(7)

#define MAKE10(X)                               \
  X(0);X(1);X(2);X(3);                          \
  X(4);X(5);X(6);X(7);                          \
  X(8);X(9)

#define MAKE12(X)                               \
  X(0);X(1);X(2);X(3);                          \
  X(4);X(5);X(6);X(7);                          \
  X(8);X(9);X(10);X(11)

static inline void inc(unsigned char *n) {
  (*(unsigned int*)&n[12]) = _bswap(1+(_bswap((*(unsigned int*)&n[12]))));
}
static inline void incle(unsigned char *n) {
  (*(unsigned int*)&n[12]) = (1+(((*(unsigned int*)&n[12]))));
}

/* create a function of unrolling N ; the MAKEN is the unrolling
   macro, defined above. The N in MAKEN must match N, obviously. */
#define FUNC(N, MAKEN)                          \
  static inline void aes_armv8_encrypt##N(unsigned char *out, unsigned int *n, const unsigned char *rkeys) { \
    MAKEN(NVx);                                                         \
    int i;                                                              \
    for (i = 0 ; i < 13 ; i++) {                                        \
      MAKEN(AESENCx);                                                   \
    }                                                                   \
    MAKEN(AESENCLASTx);                                                 \
    MAKEN(STOREx);                                                      \
  }

/* and now building our unrolled function is trivial */
FUNC(2, MAKE2)
FUNC(4, MAKE4)
FUNC(6, MAKE6)
FUNC(7, MAKE7)
FUNC(8, MAKE8)
FUNC(10, MAKE10)
FUNC(12, MAKE12)

#define vext_p8(a,b,c) vreinterpret_p8_u8(vext_u8(vreinterpret_u8_p8(a),vreinterpret_u8_p8(b),c))
#define vextq_p16(a,b,c) vreinterpretq_p16_u16(vextq_u16(vreinterpretq_u16_p16(a),vreinterpretq_u16_p16(b),c))
#define veor_p8(a,b) vreinterpret_p8_u8(veor_u8(vreinterpret_u8_p8(a),vreinterpret_u8_p8(b)))
#define vand_p8(a,b) vreinterpret_p8_u8(vand_u8(vreinterpret_u8_p8(a),vreinterpret_u8_p8(b)))
#define vandq_p8(a,b) vreinterpretq_p8_u8(vandq_u8(vreinterpretq_u8_p8(a),vreinterpretq_u8_p8(b)))
#define veorq_p16(a,b) vreinterpretq_p16_u16(veorq_u16(vreinterpretq_u16_p16(a), vreinterpretq_u16_p16(b)))
#define vextq_p8a(a,b,c) vreinterpretq_p16_p8(vextq_p8(vreinterpretq_p8_p16(a),vreinterpretq_p8_p16(b),c))
/* 128x128 GCM.
   calling the Camara et al. multiplier above,
   and the Karatsuba multiplication. Plus reduction.
   Beware: doesn't bit-reverse.
*/
static inline poly8x16_t addmul_neon_nobr(const poly8x16_t a,
                                          const poly8x16_t x,
                                          const poly8x16_t y) {
  poly8x8_t adl = vget_low_p8(a);
  poly8x8_t xdl = vget_low_p8(x);
  poly8x8_t ydl = vget_low_p8(y);
  poly8x8_t adh = vget_high_p8(a);
  poly8x8_t xdh = vget_high_p8(x);
  poly8x8_t ydh = vget_high_p8(y);
  adl = veor_p8(adl,xdl);
  adh = veor_p8(adh,xdh);
/*   poly16x8_t rql = vreinterpretq_p16_p128(vmull_p64(vreinterpret_p64_p8(adl),vreinterpret_p64_p8(ydl))); */
/*   poly16x8_t rqh = vreinterpretq_p16_p128(vmull_p64(vreinterpret_p64_p8(adh),vreinterpret_p64_p8(ydh))); */
  poly16x8_t rql = (poly16x8_t)(vmull_p64((poly64_t)(adl),(poly64_t)(ydl)));
  poly16x8_t rqh = (poly16x8_t)(vmull_p64((poly64_t)(adh),(poly64_t)(ydh)));
/* poly16x8_t rqlh = mul64neon(adl,ydh); */
/* printp8x16(a,rqlh); */
/* poly16x8_t rqhl = mul64neon(adh,ydl); */
/* printp8x16(a,rqhl); */
  poly8x8_t ydhxl = veor_p8(ydl,ydh);
  poly8x8_t adhxl = veor_p8(adl,adh);
/*   poly16x8_t rqm = vreinterpretq_p16_p128(vmull_p64(vreinterpret_p64_p8(adhxl),vreinterpret_p64_p8(ydhxl))); */
  poly16x8_t rqm = (poly16x8_t)(vmull_p64((poly64_t)(adhxl),(poly64_t)(ydhxl)));
  poly16x8_t rqlxm = veorq_p16(rql,rqm);
  poly16x8_t rqlxmxh = veorq_p16(rqlxm,rqh);
  poly8x8_t rd0 = vget_low_p8(vreinterpretq_p8_p16(rql));
  poly8x8_t rd1 = vget_high_p8(vreinterpretq_p8_p16(rql));
  poly8x8_t rd1m = vget_low_p8(vreinterpretq_p8_p16(rqlxmxh));
  poly8x8_t rd2m = vget_high_p8(vreinterpretq_p8_p16(rqlxmxh));
  poly8x8_t rd2 = vget_low_p8(vreinterpretq_p8_p16(rqh));
  poly8x8_t rd3 = vget_high_p8(vreinterpretq_p8_p16(rqh));
  poly8x8_t rd1c = veor_p8(rd1,rd1m);
  poly8x8_t rd2c = veor_p8(rd2,rd2m);
  rql = vreinterpretq_p16_p8(vcombine_p8(rd0,rd1c));
  //rqh = vreinterpretq_p16_p8(vcombine_p8(rd2c,rd3));
  poly8x8_t k135 = vcreate_p8(0x8787878787878787ULL);
  poly16x8_t pq2 = vmull_p8(rd2c,k135);
  poly16x8_t pq3 = vmull_p8(rd3,k135);
  poly8x8x2_t uq4 = vuzp_p8(vget_low_p8(vreinterpretq_p8_p16(pq2)),vget_high_p8(vreinterpretq_p8_p16(pq2)));
  poly8x8x2_t uq6 = vuzp_p8(vget_low_p8(vreinterpretq_p8_p16(pq3)),vget_high_p8(vreinterpretq_p8_p16(pq3)));
  poly16x8_t rqlt0 = veorq_p16(rql,vreinterpretq_p16_p8(vcombine_p8(uq4.val[0],uq6.val[0])));
  poly16x8_t sqt1 = vreinterpretq_p16_u64(vshlq_n_u64(vreinterpretq_u64_p8(vcombine_p8(uq4.val[1],uq6.val[1])), 8));
  poly8x8_t sdt2 = vreinterpret_p8_u64(vsri_n_u64(vreinterpret_u64_p8(vget_high_p8(vreinterpretq_p8_p16(sqt1))),vreinterpret_u64_p8(uq4.val[1]),56));
  poly8x8_t sdt3 = vreinterpret_p8_u64(vshr_n_u64(vreinterpret_u64_p8(uq6.val[1]),56));
  poly16x8_t rqlt4 = veorq_p16(rqlt0,vreinterpretq_p16_p8(vcombine_p8(vget_low_p8(vreinterpretq_p8_p16(sqt1)),sdt2)));
  poly16x8_t pq5 = vmull_p8(sdt3,k135);
  poly8x8_t xt6 = veor_p8(vget_low_p8(vreinterpretq_p8_p16(pq5)),vget_low_p8(vreinterpretq_p8_p16(rqlt4)));
  poly16x8_t f = vreinterpretq_p16_p8(vcombine_p8(xt6,vget_high_p8(vreinterpretq_p8_p16(rqlt4))));
  return (poly8x16_t)f;
}


/* NEON based GCM, drop-in replacement
   for the reference addmul.
   This need to bit-reverse inside byte
   before and after calling, to conform
   to GCM bit-ordering.
*/
void addmul(unsigned char *a,
            const unsigned char *x,
            const unsigned long long xlen,
            const unsigned char *y) {
  int i;
  unsigned char y2[16];
  unsigned char x2[16];
  poly8x16_t A, X, Y;
  A = vld1q_p8((const poly8_t *)a);
  X = vld1q_p8((const poly8_t *)x);
  Y = vld1q_p8((const poly8_t *)y);
  A = (poly8x16_t)vrbitq_u8((uint8x16_t)vreversebyteq_u128((uint32x4_t)A));
  X = (poly8x16_t)vrbitq_u8((uint8x16_t)/* vreversebyteq_u128 */((uint32x4_t)X));
  Y = (poly8x16_t)vrbitq_u8((uint8x16_t)vreversebyteq_u128((uint32x4_t)Y));
  if (xlen < 16) { // less than 16 useful bytes - insert zeroes where needed
    unsigned long long mask = -1ull ^ (1ull<<(((16-xlen)%8)*8))-1ull;
    poly8x16_t ff = vdupq_n_p8((poly8_t)0xFF);
    poly8x16_t vm;
    if (xlen>8) {
      vm = (poly8x16_t)vsetq_lane_u64(mask, (uint64x2_t)vdupq_n_u16(0xFFFF), 0);
    } else {
      vm = (poly8x16_t)vsetq_lane_u64(mask, (uint64x2_t)vdupq_n_u16(0x0000), 1);
    }
    X = (poly8x16_t)vreversebyteq_u128((uint32x4_t)vandq_p8(vm, (poly8x16_t)vreversebyteq_u128((uint32x4_t)X)));
  }
  A = addmul_neon_nobr(A,X,Y);
  A = (poly8x16_t)vrbitq_u8((uint8x16_t)vreversebyteq_u128((uint32x4_t)A));
  vst1q_p8((poly8_t *)a, A);
#undef BR
}
  
static inline uint32x4_t mulv_neon_nobr(uint32x4_t A, uint32x4_t B) {
  uint32x4_t Ar = vreversebyteq_u128(A);
  uint32x4_t Br = vreversebyteq_u128(B);
  poly8x8_t adl = (poly8x8_t)(vgetq_lane_u64((uint64x2_t)Ar,0));
  poly8x8_t ydl = (poly8x8_t)(vgetq_lane_u64((uint64x2_t)Br,0));
  poly8x8_t adh = (poly8x8_t)(vgetq_lane_u64((uint64x2_t)Ar,1));
  poly8x8_t ydh = (poly8x8_t)(vgetq_lane_u64((uint64x2_t)Br,1));
  /* 3 calls to mul64neon for Karatsuba multiplication 128x128 */
/*   poly16x8_t rql = vreinterpretq_p16_p128(vmull_p64(vreinterpret_p64_p8(adl),vreinterpret_p64_p8(ydl))); */
/*   poly16x8_t rqh = vreinterpretq_p16_p128(vmull_p64(vreinterpret_p64_p8(adh),vreinterpret_p64_p8(ydh))); */
  poly16x8_t rql = (poly16x8_t)(vmull_p64((poly64_t)(adl),(poly64_t)(ydl)));
  poly16x8_t rqh = (poly16x8_t)(vmull_p64((poly64_t)(adh),(poly64_t)(ydh)));
/* poly16x8_t rqlh = mul64neon(adl,ydh); */
/* printp8x16(a,rqlh); */
/* poly16x8_t rqhl = mul64neon(adh,ydl); */
/* printp8x16(a,rqhl); */
  poly8x8_t ydhxl = veor_p8(ydl,ydh);
  poly8x8_t adhxl = veor_p8(adl,adh);
/*   poly16x8_t rqm = vreinterpretq_p16_p128(vmull_p64(vreinterpret_p64_p8(adhxl),vreinterpret_p64_p8(ydhxl))); */
  poly16x8_t rqm = (poly16x8_t)(vmull_p64((poly64_t)(adhxl),(poly64_t)(ydhxl)));
  poly16x8_t rqlxm = veorq_p16(rql,rqm);
  poly16x8_t rqlxmxh = veorq_p16(rqlxm,rqh);
  poly8x8_t rd0 = vget_low_p8(vreinterpretq_p8_p16(rql));
  poly8x8_t rd1 = vget_high_p8(vreinterpretq_p8_p16(rql));
  poly8x8_t rd1m = vget_low_p8(vreinterpretq_p8_p16(rqlxmxh));
  poly8x8_t rd2m = vget_high_p8(vreinterpretq_p8_p16(rqlxmxh));
  poly8x8_t rd2 = vget_low_p8(vreinterpretq_p8_p16(rqh));
  poly8x8_t rd3 = vget_high_p8(vreinterpretq_p8_p16(rqh));
  poly8x8_t rd1c = veor_p8(rd1,rd1m);
  poly8x8_t rd2c = veor_p8(rd2,rd2m);
  rql = vreinterpretq_p16_p8(vcombine_p8(rd0,rd1c));
  //rqh = vreinterpretq_p16_p8(vcombine_p8(rd2c,rd3));
  poly8x8_t k135 = vcreate_p8(0x8787878787878787ULL);
  poly16x8_t pq2 = vmull_p8(rd2c,k135);
  poly16x8_t pq3 = vmull_p8(rd3,k135);
  poly8x8x2_t uq4 = vuzp_p8(vget_low_p8(vreinterpretq_p8_p16(pq2)),vget_high_p8(vreinterpretq_p8_p16(pq2)));
  poly8x8x2_t uq6 = vuzp_p8(vget_low_p8(vreinterpretq_p8_p16(pq3)),vget_high_p8(vreinterpretq_p8_p16(pq3)));
  poly16x8_t rqlt0 = veorq_p16(rql,vreinterpretq_p16_p8(vcombine_p8(uq4.val[0],uq6.val[0])));
  poly16x8_t sqt1 = vreinterpretq_p16_u64(vshlq_n_u64(vreinterpretq_u64_p8(vcombine_p8(uq4.val[1],uq6.val[1])), 8));
  poly8x8_t sdt2 = vreinterpret_p8_u64(vsri_n_u64(vreinterpret_u64_p8(vget_high_p8(vreinterpretq_p8_p16(sqt1))),vreinterpret_u64_p8(uq4.val[1]),56));
  poly8x8_t sdt3 = vreinterpret_p8_u64(vshr_n_u64(vreinterpret_u64_p8(uq6.val[1]),56));
  poly16x8_t rqlt4 = veorq_p16(rqlt0,vreinterpretq_p16_p8(vcombine_p8(vget_low_p8(vreinterpretq_p8_p16(sqt1)),sdt2)));
  poly16x8_t pq5 = vmull_p8(sdt3,k135);
  poly8x8_t xt6 = veor_p8(vget_low_p8(vreinterpretq_p8_p16(pq5)),vget_low_p8(vreinterpretq_p8_p16(rqlt4)));
  poly16x8_t f = vreinterpretq_p16_p8(vcombine_p8(xt6,vget_high_p8(vreinterpretq_p8_p16(rqlt4))));

  return vreversebyteq_u128((uint32x4_t)f);
}


uint32x4_t mulv(const uint32x4_t A,
		const uint32x4_t B) {
  return (uint32x4_t)vrbitq_u8((uint8x16_t)mulv_neon_nobr((uint32x4_t)vrbitq_u8((uint8x16_t)A),(uint32x4_t)vrbitq_u8((uint8x16_t)B)));
}

/* this is purely reduce4 for PCLMUL on x86_864 ported to NEON */
static inline uint32x4_t reduce4(uint32x4_t H0, uint32x4_t H1, uint32x4_t H2, uint32x4_t H3,
                                 uint32x4_t X0, uint32x4_t X1, uint32x4_t X2, uint32x4_t X3, uint32x4_t acc)
{
  /*algorithm by Krzysztof Jankowski, Pierre Laurent - Intel*/
#define RED_DECL(a) uint32x4_t H##a##_X##a##_lo, H##a##_X##a##_hi, tmp##a, tmp##a##B
  MAKE4(RED_DECL);
  uint32x4_t lo, tmplo, hi, tmphi;
  uint32x4_t tmp8, tmp9;
  uint32x2_t vzero = vdup_n_u32(0);
  /* byte-revert the inputs & xor the first one into the accumulator */

#define RED_SHUFFLE(a) X##a = vreversebyteq_u128(X##a)
  MAKE4(RED_SHUFFLE);
  X3 = veorq_u32(X3,acc);

  /* 4 low H*X (x0*h0) */
#define RED_MUL_LOW(a) H##a##_X##a##_lo = (uint32x4_t)(vmull_p64(vgetq_lane_u64((uint64x2_t)H##a,0),vgetq_lane_u64((uint64x2_t)X##a,0)))
  MAKE4(RED_MUL_LOW);
  lo = veorq_u32(H0_X0_lo, H1_X1_lo);
  lo = veorq_u32(lo, H2_X2_lo);
  lo = veorq_u32(lo, H3_X3_lo);

  /* 4 high H*X (x1*h1) */
#define RED_MUL_HIGH(a) H##a##_X##a##_hi = (uint32x4_t)(vmull_high_p64((poly64x2_t)H##a,(poly64x2_t)X##a))
  MAKE4(RED_MUL_HIGH);
  hi = veorq_u32(H0_X0_hi, H1_X1_hi);
  hi = veorq_u32(hi, H2_X2_hi);
  hi = veorq_u32(hi, H3_X3_hi);

  /* 4 middle H*X, using Karatsuba, i.e.
     x1*h0+x0*h1 =(x1+x0)*(h1+h0)-x1*h1-x0*h0
     we already have all x1y1 & x0y0 (accumulated in hi & lo)
     (0 is low half and 1 is high half)
  */
  /* permute the high and low 64 bits in H1 & X1,
     so create (h0,h1) from (h1,h0) and (x0,x1) from (x1,x0),
     then compute (h0+h1,h1+h0) and (x0+x1,x1+x0),
     and finally multiply
  */
#define RED_MUL_MID(a)							\
  tmp##a    = vreversedbwq_u128(H##a);					\
  tmp##a##B = vreversedbwq_u128(X##a);					\
  tmp##a    = veorq_u32(tmp##a, H##a);					\
  tmp##a##B = veorq_u32(tmp##a##B, X##a);				\
  tmp##a    = (uint32x4_t)(vmull_p64(vgetq_lane_u64((uint64x2_t)tmp##a,0),vgetq_lane_u64((uint64x2_t)tmp##a##B,0)))
  MAKE4(RED_MUL_MID);

  /* substracts x1*h1 and x0*h0 */
#if 1
  tmp0 = veorq_u32(tmp0, lo);
  tmp0 = veorq_u32(tmp0, hi);
  tmp0 = veorq_u32(tmp1, tmp0);
  tmp0 = veorq_u32(tmp2, tmp0);
  tmp0 = veorq_u32(tmp3, tmp0);
#else
  tmp0 = veorq_u32(tmp0, lo);
  tmp1 = veorq_u32(tmp1, hi);
  tmp2 = veorq_u32(tmp2, tmp3);
  tmp1 = veorq_u32(tmp0, tmp1);
  tmp0 = veorq_u32(tmp1,tmp2);
#endif

  /* reduction */
  tmp0B = vcombine_u32(vzero, vget_low_u32(tmp0));
  tmp0  = vcombine_u32(vget_high_u32(tmp0), vzero);

  lo    = veorq_u32(tmp0B, lo);
  hi    = veorq_u32(tmp0, hi);
  tmp3  = lo;
  tmp2B = hi;
  tmp3B = vshrq_n_u32(tmp3, 31);
  tmp8  = vshrq_n_u32(tmp2B, 31);
  tmp3  = vshlq_n_u32(tmp3, 1);
  tmp2B = vshlq_n_u32(tmp2B, 1);

  //tmp9  = vcombine_u32(vzero, vcreate_u32((uint64_t)vgetq_lane_u32(tmp3B,3)));
  tmp9  = vrotatewordsleft_u32(tmp3B, 3);
  tmp8  = vrotatewordsright_u32(tmp8, 1);
  tmp3B = vrotatewordsright_u32(tmp3B, 1);

  tmp3  = vorrq_u32(tmp3, tmp3B);
  tmp2B = vorrq_u32(tmp2B, tmp8);
  tmp2B = vorrq_u32(tmp2B, tmp9);
  tmp3B = vshlq_n_u32(tmp3, 31);
  tmp8  = vshlq_n_u32(tmp3, 30);
  tmp9  = vshlq_n_u32(tmp3, 25);
  tmp3B = veorq_u32(tmp3B, tmp8);
  tmp3B = veorq_u32(tmp3B, tmp9);

  tmp8  = vrotatewordsleft_u32(tmp3B, 1);
  tmp3B = vrotatewordsright_u32(tmp3B, 3);

  tmp3  = veorq_u32(tmp3, tmp3B);
  tmp2  = vshrq_n_u32(tmp3, 1);
  tmp0B = vshrq_n_u32(tmp3, 2);
  tmp1B = vshrq_n_u32(tmp3, 7);
  tmp2  = veorq_u32(tmp2, tmp0B);
  tmp2  = veorq_u32(tmp2, tmp1B);
  tmp2  = veorq_u32(tmp2, tmp8);
  tmp3  = veorq_u32(tmp3, tmp2);
  tmp2B = veorq_u32(tmp2B, tmp3);

  return tmp2B;
}

#ifdef ACCBY8
static inline uint32x4_t reduce8(uint32x4_t H0, uint32x4_t H1, uint32x4_t H2, uint32x4_t H3,
                                 uint32x4_t H4, uint32x4_t H5, uint32x4_t H6, uint32x4_t H7,
                                 uint32x4_t X0, uint32x4_t X1, uint32x4_t X2, uint32x4_t X3,
                                 uint32x4_t X4, uint32x4_t X5, uint32x4_t X6, uint32x4_t X7, uint32x4_t acc)
{
  /*algorithm by Krzysztof Jankowski, Pierre Laurent - Intel*/
  MAKE8(RED_DECL);
  uint32x4_t lo, tmplo, hi, tmphi;
  uint32x4_t tmp8, tmp9;
  uint32x2_t vzero = vdup_n_u32(0);
  /* byte-revert the inputs & xor the first one into the accumulator */
  MAKE8(RED_SHUFFLE);
  X7 = veorq_u32(X7,acc);

  /* 8 low H*X (x0*h0) */
  MAKE8(RED_MUL_LOW);
  lo = veorq_u32(H0_X0_lo, H1_X1_lo);
  lo = veorq_u32(lo, H2_X2_lo);
  lo = veorq_u32(lo, H3_X3_lo);
  lo = veorq_u32(lo, H4_X4_lo);
  lo = veorq_u32(lo, H5_X5_lo);
  lo = veorq_u32(lo, H6_X6_lo);
  lo = veorq_u32(lo, H7_X7_lo);

  /* 8 high H*X (x1*h1) */
  MAKE8(RED_MUL_HIGH);
  hi = veorq_u32(H0_X0_hi, H1_X1_hi);
  hi = veorq_u32(hi, H2_X2_hi);
  hi = veorq_u32(hi, H3_X3_hi);
  hi = veorq_u32(hi, H4_X4_hi);
  hi = veorq_u32(hi, H5_X5_hi);
  hi = veorq_u32(hi, H6_X6_hi);
  hi = veorq_u32(hi, H7_X7_hi);

  /* 8 middle H*X, using Karatsuba, i.e.
     x1*h0+x0*h1 =(x1+x0)*(h1+h0)-x1*h1-x0*h0
     we already have all x1y1 & x0y0 (accumulated in hi & lo)
     (0 is low half and 1 is high half)
  */
  MAKE8(RED_MUL_MID);

  /* substracts x1*h1 and x0*h0 */
  tmp0 = veorq_u32(tmp0, lo);
  tmp0 = veorq_u32(tmp0, hi);
  tmp0 = veorq_u32(tmp1, tmp0);
  tmp0 = veorq_u32(tmp2, tmp0);
  tmp0 = veorq_u32(tmp3, tmp0);
  tmp0 = veorq_u32(tmp4, tmp0);
  tmp0 = veorq_u32(tmp5, tmp0);
  tmp0 = veorq_u32(tmp6, tmp0);
  tmp0 = veorq_u32(tmp7, tmp0);

  /* reduction */
  tmp0B = vcombine_u32(vzero, vget_low_u32(tmp0));
  tmp0  = vcombine_u32(vget_high_u32(tmp0), vzero);

  lo    = veorq_u32(tmp0B, lo);
  hi    = veorq_u32(tmp0, hi);
  tmp3  = lo;
  tmp2B = hi;
  tmp3B = vshrq_n_u32(tmp3, 31);
  tmp8  = vshrq_n_u32(tmp2B, 31);
  tmp3  = vshlq_n_u32(tmp3, 1);
  tmp2B = vshlq_n_u32(tmp2B, 1);

  tmp9  = vrotatewordsleft_u32(tmp3B, 3);
  tmp8  = vrotatewordsright_u32(tmp8, 1);
  tmp3B = vrotatewordsright_u32(tmp3B, 1);

  tmp3  = vorrq_u32(tmp3, tmp3B);
  tmp2B = vorrq_u32(tmp2B, tmp8);
  tmp2B = vorrq_u32(tmp2B, tmp9);
  tmp3B = vshlq_n_u32(tmp3, 31);
  tmp8  = vshlq_n_u32(tmp3, 30);
  tmp9  = vshlq_n_u32(tmp3, 25);
  tmp3B = veorq_u32(tmp3B, tmp8);
  tmp3B = veorq_u32(tmp3B, tmp9);

  tmp8  = vrotatewordsleft_u32(tmp3B, 1);
  tmp3B = vrotatewordsright_u32(tmp3B, 3);

  tmp3  = veorq_u32(tmp3, tmp3B);
  tmp2  = vshrq_n_u32(tmp3, 1);
  tmp0B = vshrq_n_u32(tmp3, 2);
  tmp1B = vshrq_n_u32(tmp3, 7);
  tmp2  = veorq_u32(tmp2, tmp0B);
  tmp2  = veorq_u32(tmp2, tmp1B);
  tmp2  = veorq_u32(tmp2, tmp8);
  tmp3  = veorq_u32(tmp3, tmp2);
  tmp2B = veorq_u32(tmp2B, tmp3);
  return tmp2B;
}
#endif


#define XORx(a)                                         \
  uint32x4_t in##a = vld1q_u32((unsigned int*)(in+a*16));  \
  nv##a = veorq_u32(nv##a, in##a)

/* full encrypt & checksum 8 blocks at once */
static inline void aes_armv8_encrypt8full(unsigned char *out, unsigned int *n, const unsigned char *rkeys,
                                      const unsigned char *in, unsigned char* accum,
                                      const uint32x4_t hv, const uint32x4_t h2v, const uint32x4_t h3v, const uint32x4_t h4v
#ifdef ACCBY8
, const uint32x4_t h5v, const uint32x4_t h6v, const uint32x4_t h7v, const uint32x4_t h8v
#endif
) {
  uint32x4_t accv = vld1q_u32((unsigned int*)accum);
  MAKE8(NVx);
  int i;
#pragma unroll(13)
  for (i = 0 ; i < 13 ; i++) {
    MAKE8(AESENCx);
  }
  MAKE8(AESENCLASTx);
  MAKE8(XORx);
  MAKE8(STOREx);
#ifdef ACCBY8
  accv = reduce8(hv, h2v, h3v, h4v, h5v, h6v, h7v, h8v,
                 nv7, nv6, nv5, nv4, nv3, nv2, nv1, nv0, accv);
#else
  accv = reduce4(hv, h2v, h3v, h4v, nv3, nv2, nv1, nv0, accv);
  accv = reduce4(hv, h2v, h3v, h4v, nv7, nv6, nv5, nv4, accv);
#endif
  vst1q_u32((unsigned int*)accum, accv);
}

/* full decrypt & checksum 8 blocks at once */
static inline void aes_armv8_decrypt8full(const unsigned char *out, unsigned int *n, unsigned char *rkeys,
                                      const unsigned char *in, unsigned char* accum,
                                      const uint32x4_t hv, const uint32x4_t h2v, const uint32x4_t h3v, const uint32x4_t h4v
#ifdef ACCBY8
, const uint32x4_t h5v, const uint32x4_t h6v, const uint32x4_t h7v, const uint32x4_t h8v
#endif
) { 
  uint32x4_t accv = vld1q_u32((unsigned int*)accum);
  int i;
  MAKE8(NVx);
#pragma unroll(13)
  for (i = 0 ; i < 13 ; i++) {
    MAKE8(AESENCx);
  }
  MAKE8(AESENCLASTx);
  MAKE8(XORx);
#ifdef ACCBY8
  accv = reduce8(hv, h2v, h3v, h4v, h5v, h6v, h7v, h8v,
                in7, in6, in5, in4, in3, in2, in1, in0, accv);
#else
  accv = reduce4(hv, h2v, h3v, h4v, in3, in2, in1, in0, accv);
  accv = reduce4(hv, h2v, h3v, h4v, in7, in6, in5, in4, accv);
#endif
  vst1q_u32((unsigned int*)accum, accv);
  MAKE8(STOREx);
}

/* full AES-GCM encryption function */
int crypto_aead_encrypt(
  unsigned char *c,unsigned long long *clen,
  const unsigned char *m,unsigned long long mlen,
  const unsigned char *ad,unsigned long long adlen_,
  const unsigned char *nsec,
  const unsigned char *npub,
  const unsigned char *k
)
{
  ALIGN16 unsigned char rkeys[256];
  unsigned long long i, j;
  unsigned long long adlen = adlen_;
  ALIGN16 unsigned char n2[16];
  ALIGN16 unsigned char H[16];
  ALIGN16 unsigned char T[16];
  ALIGN16 unsigned char accum[16];
  ALIGN16 unsigned char fb[16];
  aes256_setkey_encrypt((unsigned int*)k, (unsigned int*)rkeys);
  for (i = 0;i < 12;i++) n2[i] = npub[i];
  for (i = 12; i < 16;i++) n2[i] = 0;
  memset(accum, 0, 16);

  *clen = mlen + 16;

  aes_armv8_encrypt1(H, accum /* only because it's zero */, rkeys);
  n2[15]++;
  aes_armv8_encrypt1(T, n2, rkeys);
  
  (*(unsigned long long*)&fb[0]) = _bswap64((unsigned long long)(8*adlen));
  (*(unsigned long long*)&fb[8]) = _bswap64((unsigned long long)(8*mlen));

  /* we store H (and it's power) byte-reverted once and for all */
  uint32x4_t Hv = vreversebyteq_u128(vld1q_u32((unsigned int*)H));
  vst1q_u32((unsigned int*)H,Hv);
  uint32x4_t H2v = mulv(Hv, Hv);
  uint32x4_t H3v = mulv(H2v, Hv);
  uint32x4_t H4v = mulv(H3v, Hv);
#ifdef ACCBY8
  uint32x4_t H5v = mulv(H4v, Hv);
  uint32x4_t H6v = mulv(H5v, Hv);
  uint32x4_t H7v = mulv(H6v, Hv);
  uint32x4_t H8v = mulv(H7v, Hv);
#endif

  uint32x4_t accv = vld1q_u32((unsigned int*)accum);

#ifdef ACCBY8
  /* unrolled by 8 GCM */
  unsigned long long adlen_rnd128 = adlen & ~127ull;
  for (i = 0 ; i < adlen_rnd128 ; i+= 128) {
    uint32x4_t X8 = vld1q_u32((unsigned int*)(ad+i+ 0));
    uint32x4_t X7 = vld1q_u32((unsigned int*)(ad+i+16));
    uint32x4_t X6 = vld1q_u32((unsigned int*)(ad+i+32));
    uint32x4_t X5 = vld1q_u32((unsigned int*)(ad+i+48));
    uint32x4_t X4 = vld1q_u32((unsigned int*)(ad+i+64));
    uint32x4_t X3 = vld1q_u32((unsigned int*)(ad+i+80));
    uint32x4_t X2 = vld1q_u32((unsigned int*)(ad+i+96));
    uint32x4_t X1 = vld1q_u32((unsigned int*)(ad+i+112));
    accv = reduce8(Hv, H2v, H3v, H4v, H5v, H6v, H7v, H8v,
                   X1, X2, X3, X4, X5, X6, X7, X8, accv);
  }
  vst1q_u32((unsigned int*)accum, accv);

  /* GCM remainder loop */
  for (i = adlen_rnd128 ; i < adlen ; i+= 16) {
    unsigned long long blocklen = 16;
    if (i+blocklen>adlen)
      blocklen=adlen-i;
    addmul(accum,ad+i,blocklen,H);
  }
#else
  /* unrolled by 4 GCM (by 8 doesn't improve using reduce4) */
  unsigned long long adlen_rnd64 = adlen & ~63ull;
  for (i = 0 ; i < adlen_rnd64 ; i+= 64) {
    uint32x4_t X4 = vld1q_u32((unsigned int*)(ad+i+ 0));
    uint32x4_t X3 = vld1q_u32((unsigned int*)(ad+i+16));
    uint32x4_t X2 = vld1q_u32((unsigned int*)(ad+i+32));
    uint32x4_t X1 = vld1q_u32((unsigned int*)(ad+i+48));
    accv = reduce4(Hv, H2v, H3v, H4v, X1, X2, X3, X4, accv);
  }
  vst1q_u32((unsigned int*)accum, accv);

  /* GCM remainder loop */
  for (i = adlen_rnd64 ; i < adlen ; i+= 16) {
    unsigned long long blocklen = 16;
    if (i+blocklen>adlen)
      blocklen=adlen-i;
    addmul(accum,ad+i,blocklen,H);
  }
#endif

  unsigned long long mlen_rnd128  = mlen & ~127ull;

  /* this only does 8 full blocks, so no fancy bounds
     checking is necessary*/
#ifdef ACCBY8
#define LOOPRND128                                                      \
  {const int iter = 8;                                                  \
    const int lb = iter * 16;                                           \
    for (i = 0 ; i < mlen_rnd128 ; i+= lb) {                            \
      aes_armv8_encrypt8full(c+i, (unsigned int*)n2, rkeys, m+i, accum, Hv, H2v, H3v, H4v, H5v, H6v, H7v, H8v); \
    }}
#else
#define LOOPRND128                                                      \
  {const int iter = 8;                                                  \
    const int lb = iter * 16;                                           \
    for (i = 0 ; i < mlen_rnd128 ; i+= lb) {                            \
      aes_armv8_encrypt8full(c+i, (unsigned int*)n2, rkeys, m+i, accum, Hv, H2v, H3v, H4v); \
    }}
#endif
  
  /* remainder loop, with the slower GCM update to accomodate
     partial blocks */
#define LOOPRMD128                                       \
  {const int iter = 8;                                   \
    const int lb = iter * 16;                            \
  for (i = mlen_rnd128 ; i < mlen ; i+= lb) {            \
    ALIGN16 unsigned char outni[lb];                     \
    aes_armv8_encrypt8(outni, (unsigned int*)n2, rkeys);                    \
    unsigned long long mj = lb;                          \
    if ((i+mj)>=mlen)                                    \
      mj = mlen-i;                                       \
    for (j = 0 ; j < mj ; j++)                           \
      c[i+j] = m[i+j] ^ outni[j];                        \
    for (j = 0 ; j < mj ; j+=16) {                       \
      unsigned long long bl = 16;                        \
      if (j+bl>=mj) {                                    \
        bl = mj-j;                                       \
      }                                                  \
      addmul(accum,c+i+j,bl,H);                          \
    }                                                    \
  }}
  
#define LOOP(iter)                                       \
  const int lb = iter * 16;                              \
  for (i = 0 ; i < mlen ; i+= lb) {                      \
    ALIGN16 unsigned char outni[lb];       \
    aes_armv8_encrypt##iter(outni, (unsigned int*)n2, rkeys);               \
    unsigned long long mj = lb;                          \
    if ((i+mj)>=mlen)                                    \
      mj = mlen-i;                                       \
    for (j = 0 ; j < mj ; j++)                           \
      c[i+j] = m[i+j] ^ outni[j];                        \
    for (j = 0 ; j < mj ; j+=16) {                       \
      unsigned long long bl = 16;                        \
      if (j+bl>=mj) {                                    \
        bl = mj-j;                                       \
      }                                                  \
      addmul(accum,c+i+j,bl,H);                          \
    }                                                    \
  }
  
  n2[15]=0;
  inc(n2);
  inc(n2);
  LOOPRND128;
  LOOPRMD128;
  addmul(accum,fb,16,H);

  for (i = 0;i < 16;++i) c[i+mlen] = T[i] ^ accum[15-i];

  return 0;
}

/* full AES-GCM decryption function
   basically the same as encrypt, but the checksuming
   is done _before_ the decryption. And checksum is
   checked at the end.
 */
int crypto_aead_decrypt(
  unsigned char *m,unsigned long long *mlen,
  unsigned char *nsec,
  const unsigned char *c,unsigned long long clen,
  const unsigned char *ad,unsigned long long adlen_,
  const unsigned char *npub,
  const unsigned char *k
)
{
  unsigned char rkeys[256];
  unsigned long long i, j;
  unsigned long long adlen = adlen_;
  ALIGN16 unsigned char n2[16];
  ALIGN16 unsigned char H[16];
  ALIGN16 unsigned char T[16];
  ALIGN16 unsigned char accum[16];
  ALIGN16 unsigned char fb[16];
  aes256_setkey_encrypt((unsigned int*)k, (unsigned int*)rkeys);
  for (i = 0;i < 12;i++) n2[i] = npub[i];
  for (i = 12; i < 16;i++) n2[i] = 0;
  memset(accum, 0, 16);

  *mlen = clen - 16;

  aes_armv8_encrypt1(H, accum /* only because it's zero */, rkeys);
  n2[15]++;
  aes_armv8_encrypt1(T, n2, rkeys);
  
  (*(unsigned long long*)&fb[0]) = _bswap64((unsigned long long)(8*adlen));
  (*(unsigned long long*)&fb[8]) = _bswap64((unsigned long long)(8*(*mlen)));

  uint32x4_t Hv = vreversebyteq_u128(vld1q_u32((unsigned int*)H));
  vst1q_u32((unsigned int*)H,Hv);
  uint32x4_t H2v = mulv(Hv, Hv);
  uint32x4_t H3v = mulv(H2v, Hv);
  uint32x4_t H4v = mulv(H3v, Hv);
#ifdef ACCBY8
  uint32x4_t H5v = mulv(H4v, Hv);
  uint32x4_t H6v = mulv(H5v, Hv);
  uint32x4_t H7v = mulv(H6v, Hv);
  uint32x4_t H8v = mulv(H7v, Hv);
#endif
  uint32x4_t accv = vld1q_u32((unsigned int*)accum);

#ifdef ACCBY8
  /* unrolled by 8 GCM */
  unsigned long long adlen_rnd128 = adlen & ~127ull;
  for (i = 0 ; i < adlen_rnd128 ; i+= 128) {
    uint32x4_t X8 = vld1q_u32((unsigned int*)(ad+i+ 0));
    uint32x4_t X7 = vld1q_u32((unsigned int*)(ad+i+16));
    uint32x4_t X6 = vld1q_u32((unsigned int*)(ad+i+32));
    uint32x4_t X5 = vld1q_u32((unsigned int*)(ad+i+48));
    uint32x4_t X4 = vld1q_u32((unsigned int*)(ad+i+64));
    uint32x4_t X3 = vld1q_u32((unsigned int*)(ad+i+80));
    uint32x4_t X2 = vld1q_u32((unsigned int*)(ad+i+96));
    uint32x4_t X1 = vld1q_u32((unsigned int*)(ad+i+112));
    accv = reduce8(Hv, H2v, H3v, H4v, H5v, H6v, H7v, H8v,
                   X1, X2, X3, X4, X5, X6, X7, X8, accv);
  }
  vst1q_u32((unsigned int*)accum, accv);

  /* GCM remainder loop */
  for (i = adlen_rnd128 ; i < adlen ; i+= 16) {
    unsigned long long blocklen = 16;
    if (i+blocklen>adlen)
      blocklen=adlen-i;
    addmul(accum,ad+i,blocklen,H);
  }
#else
  unsigned long long adlen_rnd64 = adlen & ~63ull;
  for (i = 0 ; i < adlen_rnd64 ; i+= 64) {
    uint32x4_t X4 = vld1q_u32((unsigned int*)(ad+i+ 0));
    uint32x4_t X3 = vld1q_u32((unsigned int*)(ad+i+16));
    uint32x4_t X2 = vld1q_u32((unsigned int*)(ad+i+32));
    uint32x4_t X1 = vld1q_u32((unsigned int*)(ad+i+48));
    accv = reduce4(Hv, H2v, H3v, H4v, X1, X2, X3, X4, accv);
  }
  vst1q_u32((unsigned int*)accum, accv);

  for (i = adlen_rnd64 ; i < adlen ; i+= 16) {
    unsigned long long blocklen = 16;
    if (i+blocklen>adlen)
      blocklen=adlen-i;
    addmul(accum,ad+i,blocklen,H);
  }
#endif

  unsigned long long mlen_rnd128  = *mlen & ~127ull;

#ifdef ACCBY8
#define LOOPDRND128                                                     \
  {const int iter = 8;                                                  \
    const int lb = iter * 16;                                           \
    for (i = 0 ; i < mlen_rnd128 ; i+= lb) {                            \
      aes_armv8_decrypt8full(m+i, (unsigned int*)n2, rkeys, c+i, accum, Hv, H2v, H3v, H4v, H5v, H6v, H7v, H8v); \
    }}
#else
#define LOOPDRND128                                                     \
  {const int iter = 8;                                                  \
    const int lb = iter * 16;                                           \
    for (i = 0 ; i < mlen_rnd128 ; i+= lb) {                            \
      aes_armv8_decrypt8full(m+i, (unsigned int*)n2, rkeys, c+i, accum, Hv, H2v, H3v, H4v); \
    }}
#endif
  
#define LOOPDRMD128                                       \
  {const int iter = 8;                                    \
    const int lb = iter * 16;                             \
    for (i = mlen_rnd128 ; i < *mlen ; i+= lb) {          \
    ALIGN16 unsigned char outni[lb];                      \
    unsigned long long mj = lb;                           \
    if ((i+mj)>=*mlen)                                    \
      mj = *mlen-i;                                       \
    for (j = 0 ; j < mj ; j+=16) {                        \
      unsigned long long bl = 16;                         \
      if (j+bl>=mj) {                                     \
        bl = mj-j;                                        \
      }                                                   \
      addmul(accum,c+i+j,bl,H);                           \
    }                                                     \
    aes_armv8_encrypt8(outni, (unsigned int*)n2, rkeys);      \
    for (j = 0 ; j < mj ; j++)                            \
      m[i+j] = c[i+j] ^ outni[j];                         \
  }}
  
#define LOOPD(iter)                                       \
  const int lb = iter * 16;                               \
  for (i = 0 ; i < *mlen ; i+= lb) {                      \
    ALIGN16 unsigned char outni[lb];                      \
    unsigned long long mj = lb;                           \
    if ((i+mj)>=*mlen)                                    \
      mj = *mlen-i;                                       \
    for (j = 0 ; j < mj ; j+=16) {                        \
      unsigned long long bl = 16;                         \
      if (j+bl>=mj) {                                     \
        bl = mj-j;                                        \
      }                                                   \
      addmul(accum,c+i+j,bl,H);                           \
    }                                                     \
    aes_armv8_encrypt##iter(outni, (unsigned int*)n2, rkeys);                \
    for (j = 0 ; j < mj ; j++)                            \
      m[i+j] = c[i+j] ^ outni[j];                         \
  }
  
  n2[15]=0;
  inc(n2);
  inc(n2);
  LOOPDRND128;
  LOOPDRMD128;
/*   LOOPD(8); */

  addmul(accum,fb,16,H);

  unsigned char F = 0;

  for (i = 0;i < 16;++i) F |= (c[i+(*mlen)] != (T[i] ^ accum[15-i]));
  if (F)
    return -111;

  return 0; 
}
