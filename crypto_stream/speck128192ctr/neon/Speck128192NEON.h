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


#include "Intrinsics_NEON_128block.h"


#define numrounds 33
#define numkeywords 3

#define R(X,Y,k) (X=XOR(ADD(ROR8(X),Y),k), Y=XOR(ROL(Y,3),X))

#define Rx2(X,Y,k) (R(X[0],Y[0],k))
#define Rx4(X,Y,k) (R(X[0],Y[0],k), R(X[1],Y[1],k))
#define Rx6(X,Y,k) (R(X[0],Y[0],k), R(X[1],Y[1],k), R(X[2],Y[2],k)) 
#define Rx8(X,Y,k) (R(X[0],Y[0],k), R(X[1],Y[1],k), R(X[2],Y[2],k), R(X[3],Y[3],k))

#define Rx1(x,y,k) (x[0]=RCS(x[0],8), x[0]+=y[0], x[0]^=k, y[0]=LCS(y[0],3), y[0]^=x[0])

#define Rx1b(x,y,k) (x=RCS(x,8), x+=y, x^=k, y=LCS(y,3), y^=x)

#define Enc(X,Y,k,n) (Rx##n(X,Y,k[0]),  Rx##n(X,Y,k[1]),  Rx##n(X,Y,k[2]),  Rx##n(X,Y,k[3]),  Rx##n(X,Y,k[4]),  Rx##n(X,Y,k[5]),  Rx##n(X,Y,k[6]),  Rx##n(X,Y,k[7]), \
		      Rx##n(X,Y,k[8]),  Rx##n(X,Y,k[9]),  Rx##n(X,Y,k[10]), Rx##n(X,Y,k[11]), Rx##n(X,Y,k[12]), Rx##n(X,Y,k[13]), Rx##n(X,Y,k[14]), Rx##n(X,Y,k[15]), \
		      Rx##n(X,Y,k[16]), Rx##n(X,Y,k[17]), Rx##n(X,Y,k[18]), Rx##n(X,Y,k[19]), Rx##n(X,Y,k[20]), Rx##n(X,Y,k[21]), Rx##n(X,Y,k[22]), Rx##n(X,Y,k[23]), \
		      Rx##n(X,Y,k[24]), Rx##n(X,Y,k[25]), Rx##n(X,Y,k[26]), Rx##n(X,Y,k[27]), Rx##n(X,Y,k[28]), Rx##n(X,Y,k[29]), Rx##n(X,Y,k[30]), Rx##n(X,Y,k[31]), \
		      Rx##n(X,Y,k[32]))



#define RK(X,Y,k,key,i) (SET1(k[i],Y), key[i]=Y, X=RCS(X,8), X+=Y, X^=i, Y=LCS(Y,3), Y^=X)

#define EK(A,B,C,D,k,key) (RK(B,A,k,key,0),  RK(C,A,k,key,1),  RK(B,A,k,key,2),  RK(C,A,k,key,3),  RK(B,A,k,key,4),  RK(C,A,k,key,5),  RK(B,A,k,key,6),	\
			   RK(C,A,k,key,7),  RK(B,A,k,key,8),  RK(C,A,k,key,9),  RK(B,A,k,key,10), RK(C,A,k,key,11), RK(B,A,k,key,12), RK(C,A,k,key,13), \
			   RK(B,A,k,key,14), RK(C,A,k,key,15), RK(B,A,k,key,16), RK(C,A,k,key,17), RK(B,A,k,key,18), RK(C,A,k,key,19), RK(B,A,k,key,20), \
			   RK(C,A,k,key,21), RK(B,A,k,key,22), RK(C,A,k,key,23), RK(B,A,k,key,24), RK(C,A,k,key,25), RK(B,A,k,key,26), RK(C,A,k,key,27), \
			   RK(B,A,k,key,28), RK(C,A,k,key,29), RK(B,A,k,key,30), RK(C,A,k,key,31), RK(B,A,k,key,32))
