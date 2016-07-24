/*
  core.c version $Date: 2016/07/22 09:55:39 $
  aes256decrypt
  Romain Dolbeau
  Public Domain
*/

#include "crypto_core.h"
#include <arm_neon.h>
#include "stdaes-common.h"

#define AES_USE_ASM

static inline void aes256_setkey_armv8_decrypt(const uint8x16_t key[], uint8x16_t *rkeys) {
  uint8x16_t tkeys[15];
  int i;
  aes256_setkey_encrypt((unsigned int*)key, (unsigned int*)tkeys);
  rkeys[0] = tkeys[14];
#pragma unroll(13)
  for (i = 1 ; i < 14 ; i++) {
    rkeys[i] = vaesimcq_u8(tkeys[14-i]);
  }
  rkeys[14] = tkeys[0];
}

static inline void aes256_armv8_decrypt(const unsigned char *rkeys, const unsigned char *n, unsigned char *out) {
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
    asm("aesd %0.16b, %1.16b\naesimc %0.16b, %0.16b\n" : "+w"(temp) : "w"(t));
#else
    temp = vaesdeq_u8(temp, vld1q_u8(rkeys+i*16));
    temp = vaesimcq_u8(temp);
#endif
  }
#else
#define MAKE13(X)\
X(0);X(1);X(2);X(3);X(4);X(5);X(6);X(7);X(8);X(9);X(10);X(11);X(12)
#define ROUND(i) \
	temp = vaesdq_u8(temp, vld1q_u8(rkeys + i*16));temp = vaesimcq_u8(temp)
MAKE13(ROUND);
#undef ROUND
#undef MAKE13
#endif
  temp = vaesdq_u8(temp, vld1q_u8((rkeys+208)));
  temp = veorq_u8(temp,  vld1q_u8((rkeys+224)));

  vst1q_u8(out, temp);
}

int crypto_core(
        unsigned char *out,
  const unsigned char *in,
  const unsigned char *k,
  const unsigned char *c
)
{
  unsigned char rkeys[240];
  aes256_setkey_armv8_decrypt((uint8x16_t*)k,(uint8x16_t*)rkeys);
  aes256_armv8_decrypt(rkeys, in, out);
  return 0;
}
