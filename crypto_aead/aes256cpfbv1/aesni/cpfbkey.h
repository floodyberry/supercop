#ifndef _CPFBKEY_H
#define _CPFBKEY_H

#define restrict __restrict

void AES_128_Key_Expansion_2 (__m128i * restrict key_a, __m128i * restrict key_b);
void AES_256_Key_Expansion_2 (__m128i * restrict key_a, __m128i * restrict key_b);


void AES_128_Key_Expansion_and_encryption (__m128i *userkey,
__m128i *Key_Schedule,__m128i in1, __m128i in2, __m128i* _k1, __m128i* _k2);
void AES_256_Key_Expansion_and_encryption (__m128i *userkey,
__m128i *Key_Schedule,__m128i in1, __m128i in2, __m128i* _k1, __m128i* _k2);
#endif
