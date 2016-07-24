/*
  core.c version $Date$
  aes128encrypt
  Romain Dolbeau
  Public Domain
*/

#include "crypto_core.h"
#include <arm_neon.h>
#include "stdaes-common.h"

#define AES_USE_ASM

static inline void aes128_armv8_encrypt(const unsigned char *rkeys, const unsigned char *n, unsigned char *out) {
  uint8x16_t temp = vld1q_u8(n);
  int i;

/* 
   In ARMv8+crypto, the AESE instruction does the 'AddRoundKey' first then SubBytes and ShiftRows.
   The AESMC instruction does the MixColumns.
   So instead of a single XOR of the first round key before the rounds,
   we end up having a single XOR of the last round key after the rounds.
*/

#if 1
#pragma unroll(9)
  for (i = 0 ; i < 9 ; i++) {
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
#define MAKE9(X)\
X(0);X(1);X(2);X(3);X(4);X(5);X(6);X(7);X(8)
#define ROUND(i) \
	temp = vaeseq_u8(temp, vld1q_u8(rkeys + i*16));temp = vaesmcq_u8(temp)
MAKE9(ROUND);
#undef ROUND
#undef MAKE9
#endif
  temp = vaeseq_u8(temp, vld1q_u8((rkeys+144)));
  temp = veorq_u8(temp,  vld1q_u8((rkeys+160)));

  vst1q_u8(out, temp);
}

int crypto_core(
        unsigned char *out,
  const unsigned char *in,
  const unsigned char *k,
  const unsigned char *c
)
{
  unsigned char rkeys[176];
  aes128_setkey_encrypt((unsigned int*)k,(unsigned int*)rkeys);
  aes128_armv8_encrypt(rkeys, in, out);
  return 0;
}
