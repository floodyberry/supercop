#include "arm_neon.h"
#include "stdint.h"


#define u64 uint64_t

#define LCS(x,r) ((x<<r)|(x>>(64-r)))
#define RCS(x,r) ((x>>r)|(x<<(64-r)))

#define XOR veorq_u64
#define SET vcombine_u64
#define ADD vaddq_u64
#define SL vshlq_n_u64
#define SR vshrq_n_u64
#define LOW(Z) vgetq_lane_u64(Z,0)
#define HIGH(Z) vgetq_lane_u64(Z,1)

#define STORE(ip,X,Y) ( ((u64 *)(ip))[0]=LOW(Y), ((u64 *)(ip))[1]=LOW(X), ((u64 *)(ip))[2]=HIGH(Y), ((u64 *)(ip))[3]=HIGH(X) )


//The following rotations may work better in some cases.
//#define ROR(X,r) (XOR(SR(X,r),SL(X,(64-(r)))))

#define ROR(Z,r) vsriq_n_u64(SL(Z,(64-r)),Z,r)
#define R(X,Y,k) (X=XOR(ADD(ROR(X,8),Y),k),Y=XOR(ROR(Y,61),X))



#define Rx8(X,Y,k) (R(X[0],Y[0],k), R(X[1],Y[1],k), R(X[2],Y[2],k), R(X[3],Y[3],k))
#define Rx6(X,Y,k) (R(X[0],Y[0],k), R(X[1],Y[1],k), R(X[2],Y[2],k)) 
#define Rx4(X,Y,k) (R(X[0],Y[0],k), R(X[1],Y[1],k))
#define Rx2(X,Y,k) (R(X[0],Y[0],k))



#define Ex8(X,Y,k) (Rx8(X,Y,k[0]),  Rx8(X,Y,k[1]),  Rx8(X,Y,k[2]),  Rx8(X,Y,k[3]),  Rx8(X,Y,k[4]),  Rx8(X,Y,k[5]),  Rx8(X,Y,k[6]),  Rx8(X,Y,k[7]), \
                    Rx8(X,Y,k[8]),  Rx8(X,Y,k[9]),  Rx8(X,Y,k[10]), Rx8(X,Y,k[11]), Rx8(X,Y,k[12]), Rx8(X,Y,k[13]), Rx8(X,Y,k[14]), Rx8(X,Y,k[15]), \
                    Rx8(X,Y,k[16]), Rx8(X,Y,k[17]), Rx8(X,Y,k[18]), Rx8(X,Y,k[19]), Rx8(X,Y,k[20]), Rx8(X,Y,k[21]), Rx8(X,Y,k[22]), Rx8(X,Y,k[23]), \
                    Rx8(X,Y,k[24]), Rx8(X,Y,k[25]), Rx8(X,Y,k[26]), Rx8(X,Y,k[27]), Rx8(X,Y,k[28]), Rx8(X,Y,k[29]), Rx8(X,Y,k[30]), Rx8(X,Y,k[31]), \
		    Rx8(X,Y,k[32]), Rx8(X,Y,k[33]))


#define Ex6(X,Y,k) (Rx6(X,Y,k[0]),  Rx6(X,Y,k[1]),  Rx6(X,Y,k[2]),  Rx6(X,Y,k[3]),  Rx6(X,Y,k[4]),  Rx6(X,Y,k[5]),  Rx6(X,Y,k[6]),  Rx6(X,Y,k[7]), \
                    Rx6(X,Y,k[8]),  Rx6(X,Y,k[9]),  Rx6(X,Y,k[10]), Rx6(X,Y,k[11]), Rx6(X,Y,k[12]), Rx6(X,Y,k[13]), Rx6(X,Y,k[14]), Rx6(X,Y,k[15]), \
                    Rx6(X,Y,k[16]), Rx6(X,Y,k[17]), Rx6(X,Y,k[18]), Rx6(X,Y,k[19]), Rx6(X,Y,k[20]), Rx6(X,Y,k[21]), Rx6(X,Y,k[22]), Rx6(X,Y,k[23]), \
                    Rx6(X,Y,k[24]), Rx6(X,Y,k[25]), Rx6(X,Y,k[26]), Rx6(X,Y,k[27]), Rx6(X,Y,k[28]), Rx6(X,Y,k[29]), Rx6(X,Y,k[30]), Rx6(X,Y,k[31]), \
		    Rx6(X,Y,k[32]), Rx6(X,Y,k[33]))


#define Ex4(X,Y,k) (Rx4(X,Y,k[0]),  Rx4(X,Y,k[1]),  Rx4(X,Y,k[2]),  Rx4(X,Y,k[3]),  Rx4(X,Y,k[4]),  Rx4(X,Y,k[5]),  Rx4(X,Y,k[6]),  Rx4(X,Y,k[7]), \
                    Rx4(X,Y,k[8]),  Rx4(X,Y,k[9]),  Rx4(X,Y,k[10]), Rx4(X,Y,k[11]), Rx4(X,Y,k[12]), Rx4(X,Y,k[13]), Rx4(X,Y,k[14]), Rx4(X,Y,k[15]), \
                    Rx4(X,Y,k[16]), Rx4(X,Y,k[17]), Rx4(X,Y,k[18]), Rx4(X,Y,k[19]), Rx4(X,Y,k[20]), Rx4(X,Y,k[21]), Rx4(X,Y,k[22]), Rx4(X,Y,k[23]), \
                    Rx4(X,Y,k[24]), Rx4(X,Y,k[25]), Rx4(X,Y,k[26]), Rx4(X,Y,k[27]), Rx4(X,Y,k[28]), Rx4(X,Y,k[29]), Rx4(X,Y,k[30]), Rx4(X,Y,k[31]), \
		    Rx4(X,Y,k[32]), Rx4(X,Y,k[33]))


#define Ex2(X,Y,k) (Rx2(X,Y,k[0]),  Rx2(X,Y,k[1]),  Rx2(X,Y,k[2]),  Rx2(X,Y,k[3]),  Rx2(X,Y,k[4]),  Rx2(X,Y,k[5]),  Rx2(X,Y,k[6]),  Rx2(X,Y,k[7]), \
                    Rx2(X,Y,k[8]),  Rx2(X,Y,k[9]),  Rx2(X,Y,k[10]), Rx2(X,Y,k[11]), Rx2(X,Y,k[12]), Rx2(X,Y,k[13]), Rx2(X,Y,k[14]), Rx2(X,Y,k[15]), \
                    Rx2(X,Y,k[16]), Rx2(X,Y,k[17]), Rx2(X,Y,k[18]), Rx2(X,Y,k[19]), Rx2(X,Y,k[20]), Rx2(X,Y,k[21]), Rx2(X,Y,k[22]), Rx2(X,Y,k[23]), \
                    Rx2(X,Y,k[24]), Rx2(X,Y,k[25]), Rx2(X,Y,k[26]), Rx2(X,Y,k[27]), Rx2(X,Y,k[28]), Rx2(X,Y,k[29]), Rx2(X,Y,k[30]), Rx2(X,Y,k[31]), \
		    Rx2(X,Y,k[32]), Rx2(X,Y,k[33]))



#define Rx1(x,y,k) (x[0]=RCS(x[0],8), x[0]+=y[0], x[0]^=k, y[0]=LCS(y[0],3), y[0]^=x[0])

#define Ex1(X,Y,k) (Rx1(X,Y,k[0]),  Rx1(X,Y,k[1]),  Rx1(X,Y,k[2]),  Rx1(X,Y,k[3]),  Rx1(X,Y,k[4]),  Rx1(X,Y,k[5]),  Rx1(X,Y,k[6]),  Rx1(X,Y,k[7]), \
                    Rx1(X,Y,k[8]),  Rx1(X,Y,k[9]),  Rx1(X,Y,k[10]), Rx1(X,Y,k[11]), Rx1(X,Y,k[12]), Rx1(X,Y,k[13]), Rx1(X,Y,k[14]), Rx1(X,Y,k[15]), \
                    Rx1(X,Y,k[16]), Rx1(X,Y,k[17]), Rx1(X,Y,k[18]), Rx1(X,Y,k[19]), Rx1(X,Y,k[20]), Rx1(X,Y,k[21]), Rx1(X,Y,k[22]), Rx1(X,Y,k[23]), \
                    Rx1(X,Y,k[24]), Rx1(X,Y,k[25]), Rx1(X,Y,k[26]), Rx1(X,Y,k[27]), Rx1(X,Y,k[28]), Rx1(X,Y,k[29]), Rx1(X,Y,k[30]), Rx1(X,Y,k[31]), \
		    Rx1(X,Y,k[32]), Rx1(X,Y,k[33]))


#define Rx1b(x,y,k) (x=RCS(x,8), x+=y, x^=k, y=LCS(y,3), y^=x)


#define RK(U,V,k,key,i) (k[i]=SET(U,U), key[i]=U, V=RCS(V,8), V+=U, V^=i, U=LCS(U,3), U^=V)

#define EK(A,B,C,D,k,key) (RK(A,B,k,key,0),  RK(A,C,k,key,1),  RK(A,D,k,key,2),  RK(A,B,k,key,3),  RK(A,C,k,key,4),  RK(A,D,k,key,5),  RK(A,B,k,key,6),	\
			   RK(A,C,k,key,7),  RK(A,D,k,key,8),  RK(A,B,k,key,9),  RK(A,C,k,key,10), RK(A,D,k,key,11), RK(A,B,k,key,12), RK(A,C,k,key,13), \
			   RK(A,D,k,key,14), RK(A,B,k,key,15), RK(A,C,k,key,16), RK(A,D,k,key,17), RK(A,B,k,key,18), RK(A,C,k,key,19), RK(A,D,k,key,20), \
			   RK(A,B,k,key,21), RK(A,C,k,key,22), RK(A,D,k,key,23), RK(A,B,k,key,24), RK(A,C,k,key,25), RK(A,D,k,key,26), RK(A,B,k,key,27), \
			   RK(A,C,k,key,28), RK(A,D,k,key,29), RK(A,B,k,key,30), RK(A,C,k,key,31), RK(A,D,k,key,32), RK(A,B,k,key,33))
