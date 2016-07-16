/*
  core.c version $Date: 2016/01/22 12:57:37 $
  aes256encrypt
  Romain Dolbeau
  Public Domain
*/

#include "crypto_core.h"
#include <arm_neon.h>
#include "stdaes-common.h"

#define AES_USE_ASM

/* this one uses 'aese' for the sbox (only), and is slower than the C code */
static inline void aes256_armv8_setkey_encrypt(const unsigned int key[], unsigned int *aes_edrk) {
  unsigned int i = 0;
  unsigned int rotl_aes_edrk;
  unsigned int tmp8, tmp9, tmp10, tmp11;
  unsigned int tmp12, tmp13, tmp14, tmp15;
  unsigned int temp_lds;
  unsigned int round = 0x00000001;
  uint8x16_t vzero = vreinterpretq_u8_u32(vdupq_n_u32(0));
#define armv8_aese_sbox(input) \
	vgetq_lane_u32(vreinterpretq_u32_u8(vaeseq_u8(vreinterpretq_u8_u32(vdupq_n_u32(input)), vzero)),0)

  tmp8  = (key[0]);
  aes_edrk[0] = tmp8;
  tmp9  = (key[1]);
  aes_edrk[1] = tmp9;
  tmp10 = (key[2]);
  aes_edrk[2] = tmp10;
  tmp11 = (key[3]);
  aes_edrk[3] = tmp11;
  tmp12 = (key[4]);
  aes_edrk[4] = tmp12;
  tmp13 = (key[5]);
  aes_edrk[5] = tmp13;
  tmp14 = (key[6]);
  aes_edrk[6] = tmp14;
  tmp15 = (key[7]);
  aes_edrk[7] = tmp15;

  for( i = 8; i < 56; /* i+=8 */ )
  {
    rotl_aes_edrk   = rotr(tmp15,8);

    temp_lds = armv8_aese_sbox(rotl_aes_edrk);

    tmp8 = tmp8 ^ round ^ temp_lds;
    round = round << 1;

    aes_edrk[i++]   = tmp8;
    tmp9  = tmp9  ^ tmp8;
    aes_edrk[i++]   = tmp9;
    tmp10 = tmp10 ^ tmp9;
    aes_edrk[i++]  = tmp10;
    tmp11 = tmp11 ^ tmp10;
    aes_edrk[i++]  = tmp11;

    temp_lds = armv8_aese_sbox(tmp11);

    tmp12 = tmp12 ^ temp_lds;
    aes_edrk[i++]  = tmp12;
    tmp13 = tmp13 ^ tmp12;
    aes_edrk[i++]  = tmp13;
    tmp14 = tmp14 ^ tmp13;
    aes_edrk[i++]  = tmp14;
    tmp15 = tmp15 ^ tmp14;
    aes_edrk[i++]  = tmp15;
  }

  rotl_aes_edrk   = rotr(tmp15,8);
  temp_lds = armv8_aese_sbox(rotl_aes_edrk);

  tmp8 = tmp8 ^ round ^ temp_lds;
  round = round << 1;

  aes_edrk[i++]   = tmp8;
  tmp9  = tmp9  ^ tmp8;
  aes_edrk[i++]   = tmp9;
  tmp10 = tmp10 ^ tmp9;
  aes_edrk[i++]  = tmp10;
  tmp11 = tmp11 ^ tmp10;
  aes_edrk[i++]  = tmp11;

#undef armv8_aese_sbox
}


static inline void aes256_armv8_encrypt(const unsigned char *rkeys, const unsigned char *n, unsigned char *out) {
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
#define MAKE13(X)\
X(0);X(1);X(2);X(3);X(4);X(5);X(6);X(7);X(8);X(9);X(10);X(11);X(12)
#define ROUND(i) \
	temp = vaeseq_u8(temp, vld1q_u8(rkeys + i*16));temp = vaesmcq_u8(temp)
MAKE13(ROUND);
#undef ROUND
#undef MAKE13
#endif
  temp = vaeseq_u8(temp, vld1q_u8((rkeys+208)));
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
  aes256_setkey_encrypt((unsigned int*)k,(unsigned int*)rkeys);
  aes256_armv8_encrypt(rkeys, in, out);
  return 0;
}
