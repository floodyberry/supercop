//Some definitions using AVX2 intriniscs.  This file
//is used for all of our AVX2 implementations of Simon 
//and Speck with 128-bit block sizes.

#include <x86intrin.h>


#define u32 unsigned
#define u64 unsigned long long
#define u256 __m256i

#define LCS(x,r) (((x)<<r)|((x)>>(64-r)))
#define RCS(x,r) (((x)>>r)|((x)<<(64-r)))

#define XOR _mm256_xor_si256  
#define AND _mm256_and_si256   
#define ADD _mm256_add_epi64
#define SL  _mm256_slli_epi64
#define SR  _mm256_srli_epi64 

#define SET _mm256_set_epi64x
#define SET1(X,c) (X=SET(c,c,c,c))
#define SET4(X,c) (X=SET(c+3,c+1,c+2,c), c+=4)

#define LOW  _mm256_unpacklo_epi64
#define HIGH _mm256_unpackhi_epi64
#define LD(ip) _mm256_loadu_si256((__m256i *)(ip))
#define ST(ip,X) _mm256_storeu_si256((__m256i *)(ip),X)
#define STORE(out,X,Y) (ST(out,LOW(Y,X)), ST(out+32,HIGH(Y,X)))
#define XOR_STORE(in,out,X,Y) (ST(out,XOR(LD(in),LOW(Y,X))), ST(out+32,XOR(LD(in+32),HIGH(Y,X))))

#define SHFL _mm256_shuffle_epi8
#define R8 SET(0x080f0e0d0c0b0a09LL,0x0007060504030201LL,0x080f0e0d0c0b0a09LL,0x0007060504030201LL)
#define L8 SET(0x0e0d0c0b0a09080fLL,0x0605040302010007LL,0x0e0d0c0b0a09080fLL,0x0605040302010007LL)
#define ROL8(X)  (SHFL(X,L8))
#define ROR8(X)  (SHFL(X,R8))
#define ROL(X,r) (XOR(SL(X,r),SR(X,(64-r))))
#define ROR(X,r) (XOR(SR(X,r),SL(X,(64-r))))
