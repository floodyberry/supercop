/* a vperm implementation of TWINE block cipher */
#include <string.h>
#include <stdio.h>
#include <xmmintrin.h>              /* SSE instructions and _mm_malloc */
#include <emmintrin.h>              /* SSE2 instructions               */
#include <wmmintrin.h>              /* SSSE3 instructions              */
#include <tmmintrin.h>              /* _mm_shuffle_epi8 */
#if defined(__GNUC__)
#define ALIGN16(x) x __attribute__ ((aligned(16)))
#else
#define ALIGN16(x) __declspec(align(16)) x
#endif

#define ROUND  36
#define TWINE_OPTIMIZED
typedef __m128i     word;
word lsbox, usbox;                  /* the twine sbox with lower and upper 4-bits, usbox = lsbox << 4 */
unsigned char ek[ROUND][8];
word rks[ROUND];

ALIGN16(const unsigned char S[16]) = {
	0xc, 0x0, 0xf, 0xa, 0x2, 0xb, 0x9, 0x5,
	0x8, 0x3, 0xd, 0x7, 0x1, 0xe, 0x6, 0x4
};

/* shuffle 64 bits message in the lower half, re-group it into 16 nibbles of 4-bits,
 * and distribute each nibble to each unsigned char of the 128-bit word, in the original order,
 * note the TWINE design treats the upper 4-bits of the first unsigned char as the first nibble
 */
ALIGN16(const unsigned char shuffle_const[4][16]) = {
    {7,-1,6,-1,5,-1,4,-1,3,-1,2,-1,1,-1,0,-1},
    {-1,7,-1,6,-1,5,-1,4,-1,3,-1,2,-1,1,-1,0},
    {-1,-1,-1,-1,-1,-1,-1,-1,15,13,11,9,7,5,3,1},
    {-1,-1,-1,-1,-1,-1,-1,-1,14,12,10,8,6,4,2,0}
};

const unsigned char CON_H[ROUND-1] = {0,0,0,1,2,4,0,0,1,3,6,4,0,1,2,5,2,4,1,3,7,7,6,5,2,4,0,1,3,7,6,4,1,2,4};  // HIGH 3-bit
const unsigned char CON_L[ROUND-1] = {1,2,4,0,0,0,3,6,4,0,0,3,5,2,4,0,3,6,7,6,4,3,5,1,1,2,7,6,4,0,3,5,1,2,4};  // LOW 3-bit

ALIGN16(const unsigned char twine80_const[12][16]) =
{
    {0,2,4,6,8,10,12,14,-1,-1,-1,-1,-1,-1,-1,-1},
    {-1,-1,-1,-1,-1,-1,-1,-1,0,2,4,6,8,10,12,14},
    {1,3,5,7,9,11,13,15,-1,-1,-1,-1,-1,-1,-1,-1},
    {-1,-1,-1,-1,-1,-1,-1,-1,1,3,5,7,9,11,13,15},
    {1,0,4,5,2,3,7,6,9,8,12,13,10,11,15,14},
    {5,3,7,1,6,0,4,2,13,11,15,9,14,8,12,10},
    {6,7,3,2,5,4,0,1,14,15,11,10,13,12,8,9},
    {2,4,0,6,1,7,3,5,10,12,8,14,9,15,11,13},
    {-1,0,-1,2,-1,6,-1,4,-1,3,-1,1,-1,5,-1,7},
    {2,-1,0,-1,3,-1,1,-1,6,-1,4,-1,7,-1,5,-1},
    {-1,8,-1,10,-1,14,-1,12,-1,11,-1,9,-1,13,-1,15},
    {10,-1,8,-1,11,-1,9,-1,14,-1,12,-1,15,-1,13,-1}
};


#define XOR(x,y)        _mm_xor_si128((x),(y))                      /* exclusive-OR of 128-bit words x and y */
#define AND(x,y)        _mm_and_si128((x),(y))                      /* logic AND of 128-bit words x and y */
#define ANDNOT(x,y)     _mm_andnot_si128((x),(y))                   /* logic NAND of 128-bit words x and y */
#define OR(x,y)         _mm_or_si128((x),(y))                       /* logic OR of 128-bit words x and y */
#define SHL4(x)         _mm_slli_epi16((x), 4)                      /* SHL4(x)  = x << 4, where x is a 128 bit word */
#define SHR4(x)         _mm_srli_epi16((x), 4)                      /* SHL4(x)  = x >> 4, where x is a 128 bit word */
#define SHL8(x)         _mm_slli_epi16((x), 8)                      /* SHL4(x)  = x << 8, where x is a 128 bit word */
#define SHR8(x)         _mm_srli_epi16((x), 8)                      /* SHL4(x)  = x >> 8, where x is a 128 bit word */
#define CONSTANT(b)     _mm_set1_epi8((b))                          /* set each unsigned char in a 128-bit register to be "b" */
#define MASK4L(x)       AND((x), CONSTANT(0x0f))                    /* mask out the upper 4 bits of each unsigned char */
#define MASK4U(x)       AND((x), CONSTANT(0xf0))                    /* mask out the lower 4 bits of each unsigned char */
#define XOR4(u,l)       XOR(MASK4U(u), MASK4L(l))                   /* take the upper 4 bits of u and lower 4 bits of l of each unsigned char */
#define SETZERO()       _mm_setzero_si128()                         /* set all 0's */
#define PSHUFB(s,x)     _mm_shuffle_epi8((s), (x))                  /* return s(x) */
#define WSBOX(x)        XOR(_mm_shuffle_epi8(lsbox,MASK4L(x)), _mm_shuffle_epi8(usbox,MASK4L(SHR4(x))))   /* word-level sboxes, apply 4-bit sbox to both lower nibbles and upper nibbles */
#define STORE(p,x)      _mm_store_si128((__m128i *)(p), (x))       /* store 128-bit word x to memory address p */
#define LOAD(p)         _mm_load_si128((__m128i *)(p))             /* load 128-bit word from memory address p, on the tested machine, the first unsigned char appears as LSB */
#define LOAD64(p)        _mm_loadl_epi64((__m128i *)(p))
#define STORE64(p,x)     _mm_storel_epi64((__m128i *)(p), (x))
#define LOADS(p)         SHUFFLE4(LOAD64(p))             /* load 64-bit word from memory address p, and shuffle it */
#define STORES(p,x)      STORE64((p), DSHUFFLE4(x))                     /* store 64-bit to memory address p */


#define SHUFFLE4(x)    XOR(    \
		_mm_shuffle_epi8(MASK4L(x), _mm_set_epi8(7, -1, 6, -1, 5, -1, 4, -1, 3, -1, 2, -1, 1, -1, 0, -1)),  \
		_mm_shuffle_epi8(SHR4(MASK4U(x)), _mm_set_epi8(-1, 7, -1, 6, -1, 5, -1, 4, -1, 3, -1, 2, -1, 1, -1, 0)))



#define SHUFFLE4_inline(r, x)     do{   \
    word _tmp = LOAD(shuffle_const[0]); \
    word _s1 = MASK4L(x);               \
    _s1 = PSHUFB(_s1, _tmp);            \
    r = MASK4U(x);                      \
    r = SHR4(r);                        \
    _tmp = LOAD(shuffle_const[1]);      \
    r = PSHUFB(r, _tmp);                \
    r = XOR(_s1, r);                    \
}while(0);


#define DSHUFFLE4(x)    XOR(    \
		_mm_shuffle_epi8(MASK4L(x), _mm_set_epi8(-1,-1,-1,-1,-1,-1,-1,-1,15,13,11,9,7,5,3,1)),  \
		_mm_shuffle_epi8(SHL4(MASK4L(x)), _mm_set_epi8(-1,-1,-1,-1,-1,-1,-1,-1,14,12,10,8,6,4,2,0)))

/* a raw version of the twine80 SSE implementation */
#ifndef TWINE_OPTIMIZED
#define twine80_enc(state) do{          \
	word _tmp;                          \
	int _i;                             \
	for(_i = 0; _i < ROUND-1; _i++){    \
		_tmp  = XOR(state, rks[_i]);    \
		_tmp  = WSBOX(_tmp);            \
		_tmp  = XOR(SHL8(_tmp), state); \
		state = XOR(_mm_shuffle_epi8(state, _mm_setr_epi8(-1,2,-1,6,-1,0,-1,4,-1,10,-1,14,-1,8,-1,12)), \
				_mm_shuffle_epi8(_tmp,  _mm_setr_epi8(1,-1,11,-1,3,-1,9,-1,7,-1,13,-1,5,-1,15,-1)));    \
	}                                   \
	_tmp  = XOR(state, rks[_i]);        \
	_tmp  = WSBOX(_tmp);                \
	_tmp  = XOR(SHL8(_tmp), state);     \
	state = XOR(_mm_shuffle_epi8(state, _mm_setr_epi8(0,-1,2,-1,4,-1,6,-1,8,-1,10,-1,12,-1,14,-1)),     \
			_mm_shuffle_epi8(_tmp,  _mm_setr_epi8(-1,1,-1,3,-1,5,-1,7,-1,9,-1,11,-1,13,-1,15)));        \
}while(0);
#endif


/* for testing and debugging purposes */
void pstate_local(int r, const word left, const word right)
{
#ifdef _IPRINT
	word state;
	unsigned char tmp[8];
	state = XOR(PSHUFB(left,_mm_setr_epi8(0, -1, 1, -1, 2, -1, 3, -1, 4, -1, 5, -1, 6, -1, 7, -1)),
			PSHUFB(right,_mm_setr_epi8(-1, 0, -1, 1, -1, 2, -1, 3, -1, 4, -1, 5, -1, 6, -1, 7)));
	word r2 = SHL4(XOR( PSHUFB(left,_mm_setr_epi8(8, -1, 9, -1, 10, -1, 11, -1, 12, -1, 13, -1, 14, -1, 15, -1)),
				PSHUFB(right,_mm_setr_epi8(-1, 8, -1, 9, -1, 10, -1, 11, -1, 12, -1, 13, -1, 14, -1, 15))));
	state = XOR(state, r2);
	STORES(tmp, state);
	int i;
	printf("ROUND %02d: ", r);
	for(i = 0;i < 8; i++)
		printf("%02x", tmp[i]);
	printf("\n");
#endif
}

void pstate_local2(const char* s, const word state)
{
#ifdef _PRINT
	unsigned char tmp[8];
	STORES(tmp, state);
	int i;
	printf("%s", s);
	for(i = 0;i < 8; i++)
		printf("%02x", tmp[i]);
	printf("\n");
#endif
}


/* the optimized SSE implementation of twine80 */
#ifdef TWINE_OPTIMIZED
#define twine80_enc(state) do{              \
	pstate_local2("Twine  input: ", state); \
	word left, right, _tmp;                 \
	left = LOAD(twine80_const[0]);			\
	left = PSHUFB(state, left);				\
	left = MASK4L(left);					\
	_tmp = LOAD(twine80_const[1]);			\
	_tmp = PSHUFB(state, _tmp);				\
	_tmp = SHR4(_tmp);						\
	_tmp = MASK4L(_tmp);					\
	left = XOR(left, _tmp);					\
	right = LOAD(twine80_const[2]);			\
	right = PSHUFB(state, right);			\
	right = MASK4L(right);					\
	_tmp = LOAD(twine80_const[3]);			\
	_tmp = PSHUFB(state, _tmp);				\
	_tmp = SHR4(_tmp);						\
	_tmp = MASK4L(_tmp);					\
	right = XOR(right, _tmp);				\
	int _i = 0;                             \
	pstate_local(-1, left, right);          \
	for(_i = 0; _i < ROUND; _i+=4){         \
		_tmp = XOR(left, rks[_i+0]);		\
		_tmp = PSHUFB(lsbox, _tmp);			\
		right = XOR(right, _tmp);			\
		_tmp = LOAD(twine80_const[4]);		\
		left = PSHUFB(left, _tmp);			\
		\
		_tmp = XOR(right, rks[_i+1]);		\
		_tmp = PSHUFB(lsbox, _tmp);			\
		left = XOR(left, _tmp);				\
		_tmp = LOAD(twine80_const[5]);		\
		right = PSHUFB(right, _tmp);		\
		\
		_tmp = XOR(left, rks[_i+2]);		\
		_tmp = PSHUFB(lsbox, _tmp);			\
		right = XOR(right, _tmp);			\
		_tmp = LOAD(twine80_const[6]);		\
		left = PSHUFB(left, _tmp);			\
		\
		_tmp = XOR(right, rks[_i+3]);		\
		_tmp = PSHUFB(lsbox, _tmp);			\
		left = XOR(left, _tmp);				\
		_tmp = LOAD(twine80_const[7]);		\
		right = PSHUFB(right, _tmp);		\
		\
		pstate_local(_i+3, left, right);    \
	}                                       \
	_tmp = LOAD(twine80_const[8]);			\
	state = PSHUFB(left, _tmp);				\
	_tmp = LOAD(twine80_const[9]);			\
	_tmp = PSHUFB(right, _tmp);				\
	state = XOR(state, _tmp);				\
	_tmp = LOAD(twine80_const[10]);			\
	left = PSHUFB(left, _tmp);				\
	_tmp = LOAD(twine80_const[11]);			\
	right = PSHUFB(right, _tmp);			\
	right = XOR(left, right);				\
	right = SHL4(right);					\
	state = XOR(state, right);				\
	pstate_local2("Twine output: ", state);	\
}while(0);
#endif


/* for testing purposes */
void Encode(unsigned char text[8], unsigned char cipher[8])
{
	word state = LOADS(text);
	twine80_enc(state);
	STORES(cipher, state);
}

/* 80-bit Key schedule for double-block with the master key */
void Keyschedule80(const unsigned char sk[80/8])
{
	lsbox = LOAD(S);
	usbox = SHL4(lsbox);

	int	i;
	unsigned char	tmp[80/4];
	unsigned char	wk[4];

	for(i=0; i<(80/4); i+=2)
	{
		tmp[i] = sk[i/2] >> 4;
		tmp[i+1] = sk[i/2] & 0x0f;
	}

	for(i=0; ; i+=2)
	{
		//ek for two rounds
		ek[i][0] = tmp[1];
		ek[i][1] = tmp[3];
		ek[i][2] = tmp[4];
		ek[i][3] = tmp[6];
		ek[i][4] = tmp[13];
		ek[i][5] = tmp[14];
		ek[i][6] = tmp[15];
		ek[i][7] = tmp[16];

		ek[i+1][0] = tmp[5];
		ek[i+1][1] = tmp[7] ^ CON_H[i];
		ek[i+1][2] = tmp[8];
		ek[i+1][3] = tmp[10];
		ek[i+1][4] = tmp[17];
		ek[i+1][5] = tmp[18];
		ek[i+1][6] = tmp[19] ^ CON_L[i];
		ek[i+1][7] = tmp[1] ^ S[tmp[0]];

		//to the last two rounds
		if(i == (ROUND-2))
			break;

		//rotations for two rounds
		wk[3] = tmp[4] ^ S[tmp[16]];
		wk[0] = tmp[5] ^ S[wk[3]];
		wk[1] = tmp[6];
		wk[2] = ek[i+1][1];

		tmp[4] = tmp[12];
		tmp[5] = tmp[13];
		tmp[6] = tmp[14];
		tmp[7] = tmp[15];

		tmp[12] = ek[i+1][7];
		tmp[13] = tmp[2];
		tmp[14] = tmp[3];
		tmp[15] = tmp[0] ^ CON_L[i+1];

		tmp[0] = tmp[8] ^ S[ek[i+1][7]];
		tmp[1] = tmp[9];
		tmp[2] = tmp[10];
		tmp[3] = tmp[11] ^ CON_H[i+1];

		tmp[8] = tmp[16];
		tmp[9] = tmp[17];
		tmp[10] = tmp[18];
		tmp[11] = tmp[19] ^ CON_L[i];

		tmp[16] = wk[0];
		tmp[17] = wk[1];
		tmp[18] = wk[2];
		tmp[19] = wk[3];
	}

	for(i = 0; i < ROUND; i++)
	{
#ifndef TWINE_OPTIMIZED
		rks[i] = LOADS(ek[i]);
		rks[i] = SHR8(XOR(MASK4L(rks[i]), MASK4U(SHL4(rks[i]))));
#else
        /* key setup for the optimized implementation */
		rks[i] = LOAD64(ek[i]);
		switch(i%4){
			case 0:
				rks[i] = PSHUFB(rks[i], _mm_setr_epi8(0,1,2,3,4,5,6,7,0,1,2,3,4,5,6,7));
				break;
			case 1:
				rks[i] = PSHUFB(rks[i], _mm_setr_epi8(0,2,6,4,3,1,5,7,0,2,6,4,3,1,5,7));
				break;
			case 2:
				rks[i] = PSHUFB(rks[i], _mm_setr_epi8(0,6,5,3,4,2,1,7,0,6,5,3,4,2,1,7));
				break;
			case 3:
				rks[i] = PSHUFB(rks[i], _mm_setr_epi8(0,5,1,4,3,6,2,7,0,5,1,4,3,6,2,7));
				break;
		}
#endif
	}
}
