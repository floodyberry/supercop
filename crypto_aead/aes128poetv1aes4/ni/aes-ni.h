#ifndef _AESNI_H_
#define _AESNI_HL_

#include <wmmintrin.h>
#include <emmintrin.h>
#include <smmintrin.h>
#include <stdint.h>

#include "api.h"

#define ROUNDS         10
#define ROUND_KEYS     11
#define ROUND_KEYS_FOUR 5

typedef __m128i  AES_KEY[ROUND_KEYS];
typedef __m128i  AUX_KEY[ROUND_KEYS_FOUR];

void AESNI_Key_Expansion(const unsigned char *userkey, AES_KEY enc_key);
void AES_Key_Dec(const AES_KEY enc_key, AES_KEY dec_key);

void AESNI_encrypt(const uint8_t *in, uint8_t *out, const AES_KEY key);
void AESNI_decrypt(const uint8_t *in, uint8_t *out, const AES_KEY key);

void AESNI_Key_Expansion4(const unsigned char *userkey, AUX_KEY aux_key);
void AESNI_encrypt4(const uint8_t *in, uint8_t *out, const AUX_KEY aux_key);

#endif // _AESNI_HL_
