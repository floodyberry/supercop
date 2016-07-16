//Some definitions using SSE4 intriniscs.  This file
//is used for all of our SSE4 implementations of Simon 
//and Speck with 64-bit block sizes.

#include <x86intrin.h>


#define u32 unsigned
#define u64 unsigned long long
#define u128 __m128i

#define LCS(x,r) (((x)<<r)|((x)>>(32-r)))
#define RCS(x,r) (((x)>>r)|((x)<<(32-r)))

#define XOR _mm_xor_si128  
#define AND _mm_and_si128
#define ADD _mm_add_epi32
#define SL _mm_slli_epi32
#define SR _mm_srli_epi32

#define SET _mm_set_epi32
#define SET1(X,c) (X=SET(c,c,c,c))
#define SET4(X,c) (X=SET(c++,c++,c++,c++))

#define LOW _mm_unpacklo_epi32
#define HIGH _mm_unpackhi_epi32
#define ST16(ip,X)  _mm_storeu_si128((__m128i *)(ip),X)
#define LD16(ip) _mm_loadu_si128((__m128i *)(ip))
#define STORE(out,X,Y) (ST16(out,LOW(Y,X)),ST16(out+16,HIGH(Y,X)))
#define XOR_STORE(in,out,X,Y) (ST16(out,XOR(LD16(in),LOW(Y,X))), ST16(out+16,XOR(LD16(in+16),HIGH(Y,X))))

#define SHFL _mm_shuffle_epi8 
#define R8 SET(0x0c0f0e0d,0x080b0a09,0x04070605,0x00030201)
#define L8 SET(0x0e0d0c0f,0x0a09080b,0x06050407,0x02010003)

#define ROL8(X)  (SHFL(X,L8))
#define ROR8(X)  (SHFL(X,R8))
#define ROL(X,r) (XOR(SL(X,r),SR(X,(32-r))))
#define ROR(X,r) (XOR(SR(X,r),SL(X,(32-r))))
