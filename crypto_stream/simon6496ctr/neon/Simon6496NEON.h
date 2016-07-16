/***************************************************************************************
 ** DISCLAIMER.  THIS SOFTWARE WAS WRITTEN BY EMPLOYEES OF THE U.S.
 ** GOVERNMENT AS A PART OF THEIR OFFICIAL DUTIES AND, THEREFORE, IS NOT
 ** PROTECTED BY COPYRIGHT.  THE U.S. GOVERNMENT MAKES NO WARRANTY, EITHER
 ** EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY IMPLIED WARRANTIES
 ** OF MERCANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, REGARDING THIS SOFTWARE.
 ** THE U.S. GOVERNMENT FURTHER MAKES NO WARRANTY THAT THIS SOFTWARE WILL NOT
 ** INFRINGE ANY OTHER UNITED STATES OR FOREIGN PATENT OR OTHER
 ** INTELLECTUAL PROPERTY RIGHT.  IN NO EVENT SHALL THE U.S. GOVERNMENT BE
 ** LIABLE TO ANYONE FOR COMPENSATORY, PUNITIVE, EXEMPLARY, SPECIAL,
 ** COLLATERAL, INCIDENTAL, CONSEQUENTIAL, OR ANY OTHER TYPE OF DAMAGES IN
 ** CONNECTION WITH OR ARISING OUT OF COPY OR USE OF THIS SOFTWARE.
 ***************************************************************************************/


#include "Intrinsics_NEON_64block.h"


#define numrounds   42
#define numkeywords 3

#define R(U,V,k) (V=XOR(V,ROL(U,2)), V=XOR(V,AND(ROL(U,1),ROL8(U))), V=XOR(V,k))

#define Sx4(U,V,k)  (R(U[0],V[0],k))
#define Sx8(U,V,k)  (R(U[0],V[0],k), R(U[1],V[1],k))
#define Sx12(U,V,k) (R(U[0],V[0],k), R(U[1],V[1],k), R(U[2],V[2],k))
#define Sx16(U,V,k) (R(U[0],V[0],k), R(U[1],V[1],k), R(U[2],V[2],k), R(U[3],V[3],k))

#define Rx4(X,Y,k,l)  (Sx4(X,Y,k), Sx4(Y,X,l))
#define Rx8(X,Y,k,l)  (Sx8(X,Y,k), Sx8(Y,X,l))
#define Rx12(X,Y,k,l) (Sx12(X,Y,k), Sx12(Y,X,l)) 
#define Rx16(X,Y,k,l) (Sx16(X,Y,k), Sx16(Y,X,l))

#define f(x) ((LCS(x,1) & LCS(x,8)) ^ LCS(x,2))
#define R2(x,y,k1,k2) (y^=f(x), y^=k1, x^=f(y), x^=k2)
#define Rx2(x,y,k,l) (R2(x[0],y[0],k,l), R2(x[1],y[1],k,l))
#define Rx1(x,y,k,l) (R2(x[0],y[0],k,l))


#define Enc(X,Y,k,n) (Rx##n(X,Y,k[0],k[1]),   Rx##n(X,Y,k[2],k[3]),   Rx##n(X,Y,k[4],k[5]),   Rx##n(X,Y,k[6],k[7]),   Rx##n(X,Y,k[8],k[9]), \
		     Rx##n(X,Y,k[10],k[11]), Rx##n(X,Y,k[12],k[13]), Rx##n(X,Y,k[14],k[15]), Rx##n(X,Y,k[16],k[17]), Rx##n(X,Y,k[18],k[19]),\
		     Rx##n(X,Y,k[20],k[21]), Rx##n(X,Y,k[22],k[23]), Rx##n(X,Y,k[24],k[25]), Rx##n(X,Y,k[26],k[27]), Rx##n(X,Y,k[28],k[29]),\
		     Rx##n(X,Y,k[30],k[31]), Rx##n(X,Y,k[32],k[33]), Rx##n(X,Y,k[34],k[35]), Rx##n(X,Y,k[36],k[37]), Rx##n(X,Y,k[38],k[39]),\
		     Rx##n(X,Y,k[40],k[41]))


#define _c 0xfffffffc
#define _d 0xfffffffd

#define RK(c0,c1,c2,A,B,C,rk,key,i) (A^=c0^(RCS(C,3)^RCS(C,4)), key[i]=A,   SET1(rk[i],A), \
				     B^=c1^(RCS(A,3)^RCS(A,4)), key[i+1]=B, SET1(rk[i+1],B), \
				     C^=c2^(RCS(B,3)^RCS(B,4)), key[i+2]=C, SET1(rk[i+2],C))

#define EK(A,B,C,D,rk,key) (SET1(rk[0],A), key[0]=A, SET1(rk[1],B), key[1]=B, SET1(rk[2],C), key[2]=C, \
			    RK(_d,_c,_d,A,B,C,rk,key,3),  RK(_c,_d,_d,A,B,C,rk,key,6),  RK(_d,_d,_c,A,B,C,rk,key,9),  RK(_d,_d,_d,A,B,C,rk,key,12), \
			    RK(_c,_c,_c,A,B,C,rk,key,15), RK(_c,_c,_c,A,B,C,rk,key,18), RK(_d,_d,_c,A,B,C,rk,key,21), RK(_d,_c,_c,A,B,C,rk,key,24), \
			    RK(_d,_c,_c,A,B,C,rk,key,27), RK(_d,_d,_c,A,B,C,rk,key,30), RK(_c,_c,_d,A,B,C,rk,key,33), RK(_c,_d,_c,A,B,C,rk,key,36), \
			    RK(_c,_c,_c,A,B,C,rk,key,39))
