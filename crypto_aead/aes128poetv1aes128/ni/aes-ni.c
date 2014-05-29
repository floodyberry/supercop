#include "aes-ni.h"

void AES_Key_Dec(const AES_KEY enc_key, AES_KEY dec_key)
{
	dec_key[10] = enc_key[0];
	dec_key[9] = _mm_aesimc_si128(enc_key[1]);
	dec_key[8] = _mm_aesimc_si128(enc_key[2]);
	dec_key[7] = _mm_aesimc_si128(enc_key[3]);
	dec_key[6] = _mm_aesimc_si128(enc_key[4]);
	dec_key[5] = _mm_aesimc_si128(enc_key[5]);
	dec_key[4] = _mm_aesimc_si128(enc_key[6]);
	dec_key[3] = _mm_aesimc_si128(enc_key[7]);
	dec_key[2] = _mm_aesimc_si128(enc_key[8]);
	dec_key[1] = _mm_aesimc_si128(enc_key[9]);
	dec_key[0] = enc_key[10];
}

static inline __m128i AES_128_ASSIST (__m128i temp1, __m128i temp2)
{
    __m128i temp3;
    temp2 = _mm_shuffle_epi32 (temp2 ,0xff);
    temp3 = _mm_slli_si128 (temp1, 0x4);
    temp1 = _mm_xor_si128 (temp1, temp3);
    temp3 = _mm_slli_si128 (temp3, 0x4);
    temp1 = _mm_xor_si128 (temp1, temp3);
    temp3 = _mm_slli_si128 (temp3, 0x4);
    temp1 = _mm_xor_si128 (temp1, temp3);
    temp1 = _mm_xor_si128 (temp1, temp2);
    return temp1;
}

void AESNI_Key_Expansion(const unsigned char *userkey, AES_KEY enc_key)
{
    __m128i temp1, temp2;
    __m128i *Key_Schedule = (__m128i*)enc_key;

    temp1 = _mm_loadu_si128((__m128i*)userkey);
    _mm_storeu_si128(&Key_Schedule[0], temp1);
    temp2= _mm_aeskeygenassist_si128 (temp1 ,0x1);
    temp1 = AES_128_ASSIST(temp1, temp2);
    _mm_storeu_si128(&Key_Schedule[1], temp1);
    temp2 = _mm_aeskeygenassist_si128 (temp1,0x2);
    temp1 = AES_128_ASSIST(temp1, temp2);
    _mm_storeu_si128(&Key_Schedule[2], temp1);
    temp2 = _mm_aeskeygenassist_si128 (temp1,0x4);
    temp1 = AES_128_ASSIST(temp1, temp2);
    _mm_storeu_si128(&Key_Schedule[3], temp1);
    temp2 = _mm_aeskeygenassist_si128 (temp1,0x8);
    temp1 = AES_128_ASSIST(temp1, temp2);
    _mm_storeu_si128(&Key_Schedule[4], temp1);
    temp2 = _mm_aeskeygenassist_si128 (temp1,0x10);
    temp1 = AES_128_ASSIST(temp1, temp2);
    _mm_storeu_si128(&Key_Schedule[5], temp1);
    temp2 = _mm_aeskeygenassist_si128 (temp1,0x20);
    temp1 = AES_128_ASSIST(temp1, temp2);
    _mm_storeu_si128(&Key_Schedule[6], temp1);
    temp2 = _mm_aeskeygenassist_si128 (temp1,0x40);
    temp1 = AES_128_ASSIST(temp1, temp2);
    _mm_storeu_si128(&Key_Schedule[7], temp1);
    temp2 = _mm_aeskeygenassist_si128 (temp1,0x80);
    temp1 = AES_128_ASSIST(temp1, temp2);
    _mm_storeu_si128(&Key_Schedule[8], temp1);
    temp2 = _mm_aeskeygenassist_si128 (temp1,0x1b);
    temp1 = AES_128_ASSIST(temp1, temp2);
    _mm_storeu_si128(&Key_Schedule[9], temp1);
    temp2 = _mm_aeskeygenassist_si128 (temp1,0x36);
    temp1 = AES_128_ASSIST(temp1, temp2);
    _mm_storeu_si128(&Key_Schedule[10], temp1);
}


void AESNI_encrypt(const uint8_t *in, uint8_t *out, const AES_KEY enc_key)
{
    __m128i tmp;

    tmp = _mm_loadu_si128 ((__m128i*)in);

    tmp = _mm_xor_si128 (tmp,enc_key[0]);
    tmp = _mm_aesenc_si128 (tmp, enc_key[1]);
    tmp = _mm_aesenc_si128 (tmp, enc_key[2]);
    tmp = _mm_aesenc_si128 (tmp, enc_key[3]);
    tmp = _mm_aesenc_si128 (tmp, enc_key[4]);
    tmp = _mm_aesenc_si128 (tmp, enc_key[5]);
    tmp = _mm_aesenc_si128 (tmp, enc_key[6]);
    tmp = _mm_aesenc_si128 (tmp, enc_key[7]);
    tmp = _mm_aesenc_si128 (tmp, enc_key[8]);
    tmp = _mm_aesenc_si128 (tmp, enc_key[9]);
    tmp = _mm_aesenclast_si128 (tmp, enc_key[10]);

   _mm_storeu_si128 ((__m128i*)out,tmp);
}


void AESNI_decrypt(const uint8_t *in, uint8_t *out, const AES_KEY dec_key)
{
    __m128i tmp;

    tmp = _mm_loadu_si128 ((__m128i*)in);
    tmp = _mm_xor_si128 (tmp,dec_key[0]);

    tmp = _mm_aesdec_si128 (tmp,dec_key[1]);
    tmp = _mm_aesdec_si128 (tmp,dec_key[2]);
    tmp = _mm_aesdec_si128 (tmp,dec_key[3]);
    tmp = _mm_aesdec_si128 (tmp,dec_key[4]);
    tmp = _mm_aesdec_si128 (tmp,dec_key[5]);
    tmp = _mm_aesdec_si128 (tmp,dec_key[6]);
    tmp = _mm_aesdec_si128 (tmp,dec_key[7]);
    tmp = _mm_aesdec_si128 (tmp,dec_key[8]);
    tmp = _mm_aesdec_si128 (tmp,dec_key[9]);
    tmp = _mm_aesdeclast_si128 (tmp,dec_key[10]);

    _mm_storeu_si128 ((__m128i*)out,tmp);
}


