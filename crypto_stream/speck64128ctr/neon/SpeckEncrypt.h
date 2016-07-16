#include "arm_neon.h"
#include "stdint.h"

#define u64 uint64_t
#define u32 uint32_t
#define u128 uint32x4_t

#define LCS(x,r) ((x<<r)|(x>>(32-r)))
#define RCS(x,r) ((x>>r)|(x<<(32-r)))

#define XOR veorq_u32
#define ADD vaddq_u32
#define SL vshlq_n_u32
#define SR vshrq_n_u32

#define SET vcombine_u64
#define SET1(X,c) (X=vdupq_n_u32(c))
#define SET4(X,c) ( X=SET1(X,c), X=ADD(X,(u128)SET(0x0000000200000000LL,0x0000000300000001LL)), c+=4)

#define ST16(ip,X) vst1q_u32((u32 *)(ip),X)
#define LD16(ip) vld1q_u32((u32 *)(ip))
#define Tps vtrnq_u32
#define STORE(out,X,Y) (ST16(out,Tps(Y,X).val[0]),ST16(out+16,Tps(Y,X).val[1]))
#define XOR_STORE(in,out,X,Y) (ST16(out,XOR(Tps(Y,X).val[0],LD16(in))), ST16(out+16,XOR(Tps(Y,X).val[1],LD16(in+16))))

//The following rotation may simetimes provide better performance.
//#define ROR(X,r) (XOR(SR(X,r),SL(X,(32-(r)))))

#define ROR(X,r) vsriq_n_u32(SL(X,(32-r)),X,r)

#define R(X,Y,k) (X=XOR(ADD(ROR(X,8),Y),k),Y=XOR(ROR(Y,29),X))


#define Rx4(X,Y,k)  (R(X[0],Y[0],k))
#define Rx8(X,Y,k)  (R(X[0],Y[0],k), R(X[1],Y[1],k))
#define Rx12(X,Y,k) (R(X[0],Y[0],k), R(X[1],Y[1],k), R(X[2],Y[2],k)) 
#define Rx16(X,Y,k) (R(X[0],Y[0],k), R(X[1],Y[1],k), R(X[2],Y[2],k), R(X[3],Y[3],k))



#define Ex16(X,Y,k) (Rx16(X,Y,k[0]),  Rx16(X,Y,k[1]),  Rx16(X,Y,k[2]),  Rx16(X,Y,k[3]),  Rx16(X,Y,k[4]),  Rx16(X,Y,k[5]),  Rx16(X,Y,k[6]),  Rx16(X,Y,k[7]), \
		     Rx16(X,Y,k[8]),  Rx16(X,Y,k[9]),  Rx16(X,Y,k[10]), Rx16(X,Y,k[11]), Rx16(X,Y,k[12]), Rx16(X,Y,k[13]), Rx16(X,Y,k[14]), Rx16(X,Y,k[15]), \
		     Rx16(X,Y,k[16]), Rx16(X,Y,k[17]), Rx16(X,Y,k[18]), Rx16(X,Y,k[19]), Rx16(X,Y,k[20]), Rx16(X,Y,k[21]), Rx16(X,Y,k[22]), Rx16(X,Y,k[23]), \
		     Rx16(X,Y,k[24]), Rx16(X,Y,k[25]), Rx16(X,Y,k[26]))


#define Ex12(X,Y,k) (Rx12(X,Y,k[0]),  Rx12(X,Y,k[1]),  Rx12(X,Y,k[2]),  Rx12(X,Y,k[3]),  Rx12(X,Y,k[4]),  Rx12(X,Y,k[5]),  Rx12(X,Y,k[6]),  Rx12(X,Y,k[7]), \
		     Rx12(X,Y,k[8]),  Rx12(X,Y,k[9]),  Rx12(X,Y,k[10]), Rx12(X,Y,k[11]), Rx12(X,Y,k[12]), Rx12(X,Y,k[13]), Rx12(X,Y,k[14]), Rx12(X,Y,k[15]), \
		     Rx12(X,Y,k[16]), Rx12(X,Y,k[17]), Rx12(X,Y,k[18]), Rx12(X,Y,k[19]), Rx12(X,Y,k[20]), Rx12(X,Y,k[21]), Rx12(X,Y,k[22]), Rx12(X,Y,k[23]), \
		     Rx12(X,Y,k[24]), Rx12(X,Y,k[25]), Rx12(X,Y,k[26]))


#define Ex8(X,Y,k) (Rx8(X,Y,k[0]),  Rx8(X,Y,k[1]),  Rx8(X,Y,k[2]),  Rx8(X,Y,k[3]),  Rx8(X,Y,k[4]),  Rx8(X,Y,k[5]),  Rx8(X,Y,k[6]),  Rx8(X,Y,k[7]), \
                    Rx8(X,Y,k[8]),  Rx8(X,Y,k[9]),  Rx8(X,Y,k[10]), Rx8(X,Y,k[11]), Rx8(X,Y,k[12]), Rx8(X,Y,k[13]), Rx8(X,Y,k[14]), Rx8(X,Y,k[15]), \
                    Rx8(X,Y,k[16]), Rx8(X,Y,k[17]), Rx8(X,Y,k[18]), Rx8(X,Y,k[19]), Rx8(X,Y,k[20]), Rx8(X,Y,k[21]), Rx8(X,Y,k[22]), Rx8(X,Y,k[23]), \
                    Rx8(X,Y,k[24]), Rx8(X,Y,k[25]), Rx8(X,Y,k[26]))


#define Ex4(X,Y,k) (Rx4(X,Y,k[0]),  Rx4(X,Y,k[1]),  Rx4(X,Y,k[2]),  Rx4(X,Y,k[3]),  Rx4(X,Y,k[4]),  Rx4(X,Y,k[5]),  Rx4(X,Y,k[6]),  Rx4(X,Y,k[7]), \
                    Rx4(X,Y,k[8]),  Rx4(X,Y,k[9]),  Rx4(X,Y,k[10]), Rx4(X,Y,k[11]), Rx4(X,Y,k[12]), Rx4(X,Y,k[13]), Rx4(X,Y,k[14]), Rx4(X,Y,k[15]), \
                    Rx4(X,Y,k[16]), Rx4(X,Y,k[17]), Rx4(X,Y,k[18]), Rx4(X,Y,k[19]), Rx4(X,Y,k[20]), Rx4(X,Y,k[21]), Rx4(X,Y,k[22]), Rx4(X,Y,k[23]), \
                    Rx4(X,Y,k[24]), Rx4(X,Y,k[25]), Rx4(X,Y,k[26]))


#define Rx2(x,y,k) (x[0]=RCS(x[0],8), x[0]+=y[0], x[0]^=k, y[0]=LCS(y[0],3), y[0]^=x[0], x[1]=RCS(x[1],8), x[1]+=y[1], x[1]^=k, y[1]=LCS(y[1],3), y[1]^=x[1])

#define Ex2(X,Y,k) (Rx2(X,Y,k[0]),  Rx2(X,Y,k[1]),  Rx2(X,Y,k[2]),  Rx2(X,Y,k[3]),  Rx2(X,Y,k[4]),  Rx2(X,Y,k[5]),  Rx2(X,Y,k[6]),  Rx2(X,Y,k[7]), \
                    Rx2(X,Y,k[8]),  Rx2(X,Y,k[9]),  Rx2(X,Y,k[10]), Rx2(X,Y,k[11]), Rx2(X,Y,k[12]), Rx2(X,Y,k[13]), Rx2(X,Y,k[14]), Rx2(X,Y,k[15]), \
                    Rx2(X,Y,k[16]), Rx2(X,Y,k[17]), Rx2(X,Y,k[18]), Rx2(X,Y,k[19]), Rx2(X,Y,k[20]), Rx2(X,Y,k[21]), Rx2(X,Y,k[22]), Rx2(X,Y,k[23]), \
                    Rx2(X,Y,k[24]), Rx2(X,Y,k[25]), Rx2(X,Y,k[26]))



#define Rx1(x,y,k) (x[0]=RCS(x[0],8), x[0]+=y[0], x[0]^=k, y[0]=LCS(y[0],3), y[0]^=x[0])

#define Ex1(X,Y,k) (Rx1(X,Y,k[0]),  Rx1(X,Y,k[1]),  Rx1(X,Y,k[2]),  Rx1(X,Y,k[3]),  Rx1(X,Y,k[4]),  Rx1(X,Y,k[5]),  Rx1(X,Y,k[6]),  Rx1(X,Y,k[7]), \
                    Rx1(X,Y,k[8]),  Rx1(X,Y,k[9]),  Rx1(X,Y,k[10]), Rx1(X,Y,k[11]), Rx1(X,Y,k[12]), Rx1(X,Y,k[13]), Rx1(X,Y,k[14]), Rx1(X,Y,k[15]), \
                    Rx1(X,Y,k[16]), Rx1(X,Y,k[17]), Rx1(X,Y,k[18]), Rx1(X,Y,k[19]), Rx1(X,Y,k[20]), Rx1(X,Y,k[21]), Rx1(X,Y,k[22]), Rx1(X,Y,k[23]), \
                    Rx1(X,Y,k[24]), Rx1(X,Y,k[25]), Rx1(X,Y,k[26]))



#define Rx1b(x,y,k) (x=RCS(x,8), x+=y, x^=k, y=LCS(y,3), y^=x)

#define RK(U,V,k,key,i) (SET1(k[i],U), key[i]=U, V=RCS(V,8), V+=U, V^=i, U=LCS(U,3), U^=V)

#define EK(A,B,C,D,k,key) (RK(A,B,k,key,0),  RK(A,C,k,key,1),  RK(A,D,k,key,2),  RK(A,B,k,key,3),  RK(A,C,k,key,4),  RK(A,D,k,key,5),  RK(A,B,k,key,6), \
			   RK(A,C,k,key,7),  RK(A,D,k,key,8),  RK(A,B,k,key,9),  RK(A,C,k,key,10), RK(A,D,k,key,11), RK(A,B,k,key,12), RK(A,C,k,key,13), \
			   RK(A,D,k,key,14), RK(A,B,k,key,15), RK(A,C,k,key,16), RK(A,D,k,key,17), RK(A,B,k,key,18), RK(A,C,k,key,19), RK(A,D,k,key,20), \
			   RK(A,B,k,key,21), RK(A,C,k,key,22), RK(A,D,k,key,23), RK(A,B,k,key,24), RK(A,C,k,key,25), RK(A,D,k,key,26))
