#ifndef _AESNI_H_
#define _AESNI_HL_

#include <wmmintrin.h>
#include <emmintrin.h>
#include <smmintrin.h>
#include <stdint.h>

#include "api.h"

#define ROUNDS       10
#define ROUND_KEYS   11

typedef __m128i  AES_KEY[ROUND_KEYS];

void AESNI_Key_Expansion(const unsigned char *userkey, AES_KEY enc_key);
void AES_Key_Dec(const AES_KEY enc_key, AES_KEY dec_key);
void AESNI_encrypt(const uint8_t *in, uint8_t *out, const AES_KEY key);
void AESNI_decrypt(const uint8_t *in, uint8_t *out, const AES_KEY key);


#endif // _AESNI_HL_
