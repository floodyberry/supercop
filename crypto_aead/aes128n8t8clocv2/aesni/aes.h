/*
 * AES-128 implementation with AES new instruction
 */

#include <xmmintrin.h>              /* SSE instructions and _mm_malloc */
#include <emmintrin.h>              /* SSE2 instructions               */
#include <wmmintrin.h>              /* SSSE3 instructions              */
#define ROUNDS  10

__m128i roundkeys[11];

#define EXPAND_ASSIST(v1, v2, v3, v4, aes_const) do{            \
	v2 = _mm_aeskeygenassist_si128(v4, aes_const);            	\
	v3 = _mm_castps_si128(_mm_shuffle_ps(_mm_castsi128_ps(v3),  \
				_mm_castsi128_ps(v1), 16));                                 \
	v1 = _mm_xor_si128(v1, v3);									\
	v3 = _mm_castps_si128(_mm_shuffle_ps(_mm_castsi128_ps(v3),	\
				_mm_castsi128_ps(v1), 140));                                \
	v1 = _mm_xor_si128(v1, v3);									\
	v2 = _mm_shuffle_epi32(v2, 255);                            \
	v1 = _mm_xor_si128(v1, v2);                                 \
}while(0)

/* generate all 11 subkeys used in AES-128 call */
void AES128_KeyExpansion(const unsigned char *userkey)
{
	__m128i x0,x1,x2;
	roundkeys[0] = x0 = LOAD(userkey);
	x2 = _mm_setzero_si128();
	EXPAND_ASSIST(x0, x1, x2, x0,   1);    roundkeys[1]  = x0;
	EXPAND_ASSIST(x0, x1, x2, x0,   2);    roundkeys[2]  = x0;
	EXPAND_ASSIST(x0, x1, x2, x0,   4);    roundkeys[3]  = x0;
	EXPAND_ASSIST(x0, x1, x2, x0,   8);    roundkeys[4]  = x0;
	EXPAND_ASSIST(x0, x1, x2, x0,  16);    roundkeys[5]  = x0;
	EXPAND_ASSIST(x0, x1, x2, x0,  32);    roundkeys[6]  = x0;
	EXPAND_ASSIST(x0, x1, x2, x0,  64);    roundkeys[7]  = x0;
	EXPAND_ASSIST(x0, x1, x2, x0, 128);    roundkeys[8]  = x0;
	EXPAND_ASSIST(x0, x1, x2, x0,  27);    roundkeys[9]  = x0;
	EXPAND_ASSIST(x0, x1, x2, x0,  54);    roundkeys[10] = x0;
}

void print_state(char* str, __m128i st)
{
#ifdef _PRINT
	unsigned char temp[16];
	STORE(temp, st);
	printf("%s", str);
	int i;
	for(i = 0;i < 16; i++)
		printf("%02x", temp[i]);
	printf("\n");
#endif
}
/* one AES-128 block-cipher call */
#define AES128_encrypt(in, out)						 \
	print_state("AES  input: ", in);						\
	out = _mm_xor_si128(in, roundkeys[0]);         \
	out = _mm_aesenc_si128(out, roundkeys[1]);     \
	out = _mm_aesenc_si128(out, roundkeys[2]);     \
	out = _mm_aesenc_si128(out, roundkeys[3]);     \
	out = _mm_aesenc_si128(out, roundkeys[4]);     \
	out = _mm_aesenc_si128(out, roundkeys[5]);     \
	out = _mm_aesenc_si128(out, roundkeys[6]);     \
	out = _mm_aesenc_si128(out, roundkeys[7]);     \
	out = _mm_aesenc_si128(out, roundkeys[8]);     \
	out = _mm_aesenc_si128(out, roundkeys[9]);     \
	out = _mm_aesenclast_si128(out, roundkeys[10]);\
	print_state("AES output: ", out);					\

