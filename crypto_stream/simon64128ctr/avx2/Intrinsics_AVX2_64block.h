//Some definitions using AVX2 intriniscs.  This file
//is used for all of our AVX2 implementations of Simon 
//and Speck with 64-bit block sizes.

#include <x86intrin.h>


#define u32 unsigned
#define u64 unsigned long long
#define u256 __m256i

#define LCS(x,r) (((x)<<r)|((x)>>(32-r)))
#define RCS(x,r) (((x)>>r)|((x)<<(32-r)))

#define XOR _mm256_xor_si256  
#define AND _mm256_and_si256
#define ADD _mm256_add_epi32
#define SL  _mm256_slli_epi32
#define SR  _mm256_srli_epi32

#define SET _mm256_set_epi32
#define SET1(X,c) (X=SET(c,c,c,c,c,c,c,c))
#define SET8(X,c) (X=SET(c+7,c+6,c+3,c+2,c+5,c+4,c+1,c), c+=8)

#define LOW _mm256_unpacklo_epi32
#define HIGH _mm256_unpackhi_epi32
#define LD32(ip) _mm256_loadu_si256((__m256i *)(ip))
#define ST32(ip,X) _mm256_storeu_si256((__m256i *)(ip),X)
#define STORE(out,X,Y) (ST32(out,LOW(Y,X)),ST32(out+32,HIGH(Y,X)))
#define XOR_STORE(in,out,X,Y) (ST32(out,XOR(LD32(in),LOW(Y,X))), ST32(out+32,XOR(LD32(in+32),HIGH(Y,X))))

#define SHFL _mm256_shuffle_epi8
#define R8 SET(0x0c0f0e0d,0x080b0a09,0x04070605,0x00030201,0x0c0f0e0d,0x080b0a09,0x04070605,0x00030201)
#define L8 SET(0x0e0d0c0f,0x0a09080b,0x06050407,0x02010003,0x0e0d0c0f,0x0a09080b,0x06050407,0x02010003)

#define ROL8(X)  (SHFL(X,L8))
#define ROR8(X)  (SHFL(X,R8))
#define ROL(X,r) (XOR(SL(X,r),SR(X,(32-r))))
#define ROR(X,r) (XOR(SR(X,r),SL(X,(32-r))))
