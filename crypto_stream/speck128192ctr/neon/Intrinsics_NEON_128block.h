//Some definitions using NEON intrinsics.  This file
//is used for all of our NEON implementations of Simon
//and Speck with 128-bit block sizes.

#include "arm_neon.h"


#define u32 unsigned
#define u64 uint64_t
#define u128 uint64x2_t

#define LCS(x,r) (((x)<<r)|((x)>>(64-r)))
#define RCS(x,r) (((x)>>r)|((x)<<(64-r)))

#define XOR veorq_u64
#define AND vandq_u64
#define ADD vaddq_u64
#define SL vshlq_n_u64
#define SR vshrq_n_u64

#define SET vcombine_u64
#define SET1(X,c) (X=SET(c,c))
#define SET2(X,c) (X=SET(c++,c++))

#define LOW(Z) vgetq_lane_u64(Z,0)
#define HIGH(Z) vgetq_lane_u64(Z,1)
#define STORE(ip,X,Y) (((u64 *)(ip))[0]=LOW(Y), ((u64 *)(ip))[1]=LOW(X), ((u64 *)(ip))[2]=HIGH(Y), ((u64 *)(ip))[3]=HIGH(X))
#define XOR_STORE(in,out,X,Y) (Y=XOR(Y,SET(((u64 *)(in))[0],((u64 *)(in))[2])), X=XOR(X,SET(((u64 *)(in))[1],((u64 *)(in))[3])), STORE(out,X,Y))

//On some ARM processors the following rotation may perform better.
//#define ROR(X,r) (XOR(SR(X,r),SL(X,(64-(r)))))

#define ROR8(X) ROR(X,8)
#define ROL8(X) ROR(X,56)
#define ROR(X,r) vsriq_n_u64(SL(X,(64-r)),X,r)
#define ROL(X,r) ROR(X,(64-r))




