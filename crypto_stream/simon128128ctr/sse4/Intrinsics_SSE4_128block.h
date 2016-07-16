//Some definitions using SSE4 intriniscs.  This file
//is used for all of our SSE4 implementations of Simon 
//and Speck with 128-bit block sizes.

#include <x86intrin.h>


#define u32 unsigned
#define u64 unsigned long long
#define u128 __m128i

#define LCS(x,r) (((x)<<r)|((x)>>(64-r)))
#define RCS(x,r) (((x)>>r)|((x)<<(64-r)))

#define XOR _mm_xor_si128  
#define AND _mm_and_si128
#define ADD _mm_add_epi64
#define SL  _mm_slli_epi64
#define SR  _mm_srli_epi64

#define SET _mm_set_epi64x
#define SET1(X,c) (X=SET(c,c))
#define SET2(X,c) (X=SET(c++,c++))

#define LOW _mm_unpacklo_epi64
#define HIGH _mm_unpackhi_epi64
#define LD(ip) _mm_loadu_si128((__m128i *)(ip))
#define ST(ip,X) _mm_storeu_si128((__m128i *)(ip),X)
#define STORE(out,X,Y) (ST(out,LOW(Y,X)), ST(out+16,HIGH(Y,X)))
#define XOR_STORE(in,out,X,Y) (ST(out,XOR(LD(in),LOW(Y,X))), ST(out+16,XOR(LD(in+16),HIGH(Y,X))))

#define SHFL _mm_shuffle_epi8 
#define R8   _mm_set_epi64x(0x080f0e0d0c0b0a09LL,0x0007060504030201LL)
#define L8   _mm_set_epi64x(0x0e0d0c0b0a09080fLL,0x0605040302010007LL)
#define ROL8(X)  (SHFL(X,L8))
#define ROR8(X)  (SHFL(X,R8))
#define ROL(X,r) (XOR(SL(X,r),SR(X,(64-r))))
#define ROR(X,r) (XOR(SR(X,r),SL(X,(64-r))))
