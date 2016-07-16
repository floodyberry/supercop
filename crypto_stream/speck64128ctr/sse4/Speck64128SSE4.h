/***********************************************************************************
 ** DISCLAIMER. THIS SOFTWARE WAS WRITTEN BY EMPLOYEES OF THE U.S.
 ** GOVERNMENT AS A PART OF THEIR OFFICIAL DUTIES AND, THEREFORE, IS NOT
 ** PROTECTED BY COPYRIGHT. THE U.S. GOVERNMENT MAKES NO WARRANTY, EITHER
 ** EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY IMPLIED WARRANTIES
 ** OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, REGARDING THIS SOFTWARE.
 ** THE U.S. GOVERNMENT FURTHER MAKES NO WARRANTY THAT THIS SOFTWARE WILL NOT
 ** INFRINGE ANY OTHER UNITED STATES OR FOREIGN PATENT OR OTHER
 ** INTELLECTUAL PROPERTY RIGHT. IN NO EVENT SHALL THE U.S. GOVERNMENT BE
 ** LIABLE TO ANYONE FOR COMPENSATORY, PUNITIVE, EXEMPLARY, SPECIAL,
 ** COLLATERAL, INCIDENTAL, CONSEQUENTIAL, OR ANY OTHER TYPE OF DAMAGES IN
 ** CONNECTION WITH OR ARISING OUT OF COPY OR USE OF THIS SOFTWARE.
 ***********************************************************************************/



#include "Intrinsics_SSE4_64block.h"


#define numrounds   27
#define numkeywords 4

#define R(X,Y,k) (X=XOR(ADD(ROR8(X),Y),k), Y=XOR(ROL(Y,3),X)) 

#define Rx4(X,Y,k)  (R(X[0],Y[0],k))
#define Rx8(X,Y,k)  (R(X[0],Y[0],k), R(X[1],Y[1],k))
#define Rx12(X,Y,k) (R(X[0],Y[0],k), R(X[1],Y[1],k), R(X[2],Y[2],k))
#define Rx16(X,Y,k) (X[0]=ROR8(X[0]), X[0]=ADD(X[0],Y[0]), X[0]=XOR(X[0],k), \
		     X[1]=ROR8(X[1]), X[1]=ADD(X[1],Y[1]), X[1]=XOR(X[1],k), \
		     X[2]=ROR8(X[2]), X[2]=ADD(X[2],Y[2]), X[2]=XOR(X[2],k), \
		     X[3]=ROR8(X[3]), X[3]=ADD(X[3],Y[3]), X[3]=XOR(X[3],k), \
		     Z[0]=Y[0], Z[1]=Y[1], Z[2]=Y[2], Z[3]=Y[3],	\
		     Z[0]=SL(Z[0],3),  Z[1]=SL(Z[1],3),  Z[2]=SL(Z[2],3),  Z[3]=SL(Z[3],3), \
		     Y[0]=SR(Y[0],29), Y[1]=SR(Y[1],29), Y[2]=SR(Y[2],29), Y[3]=SR(Y[3],29), \
		     Y[0]=XOR(Y[0],Z[0]), Y[1]=XOR(Y[1],Z[1]), Y[2]=XOR(Y[2],Z[2]), Y[3]=XOR(Y[3],Z[3]), \
		     Y[0]=XOR(X[0],Y[0]), Y[1]=XOR(X[1],Y[1]), Y[2]=XOR(X[2],Y[2]), Y[3]=XOR(X[3],Y[3]))

#define Rx1(x,y,k) (x[0]=RCS(x[0],8), x[0]+=y[0], x[0]^=k, y[0]=LCS(y[0],3), y[0]^=x[0])
#define Rx2(x,y,k) (x[0]=RCS(x[0],8), x[0]+=y[0], x[0]^=k, y[0]=LCS(y[0],3), y[0]^=x[0], x[1]=RCS(x[1],8), x[1]+=y[1], x[1]^=k, y[1]=LCS(y[1],3), y[1]^=x[1])

#define Rx1b(x,y,k) (x=RCS(x,8), x+=y, x^=k, y=LCS(y,3), y^=x)


#define Enc(X,Y,k,n) (Rx##n(X,Y,k[0]),  Rx##n(X,Y,k[1]),  Rx##n(X,Y,k[2]),  Rx##n(X,Y,k[3]),  Rx##n(X,Y,k[4]),  Rx##n(X,Y,k[5]),  Rx##n(X,Y,k[6]),  Rx##n(X,Y,k[7]), \
		      Rx##n(X,Y,k[8]),  Rx##n(X,Y,k[9]),  Rx##n(X,Y,k[10]), Rx##n(X,Y,k[11]), Rx##n(X,Y,k[12]), Rx##n(X,Y,k[13]), Rx##n(X,Y,k[14]), Rx##n(X,Y,k[15]), \
		      Rx##n(X,Y,k[16]), Rx##n(X,Y,k[17]), Rx##n(X,Y,k[18]), Rx##n(X,Y,k[19]), Rx##n(X,Y,k[20]), Rx##n(X,Y,k[21]), Rx##n(X,Y,k[22]), Rx##n(X,Y,k[23]), \
		      Rx##n(X,Y,k[24]), Rx##n(X,Y,k[25]), Rx##n(X,Y,k[26]))


#define RK(X,Y,k,key,i)   (SET1(k[i],Y), key[i]=Y, X=RCS(X,8), X+=Y, X^=i, Y=LCS(Y,3), Y^=X)

#define EK(A,B,C,D,k,key) (RK(B,A,k,key,0),  RK(C,A,k,key,1),  RK(D,A,k,key,2),  RK(B,A,k,key,3),  RK(C,A,k,key,4),  RK(D,A,k,key,5),  RK(B,A,k,key,6), \
			   RK(C,A,k,key,7),  RK(D,A,k,key,8),  RK(B,A,k,key,9),  RK(C,A,k,key,10), RK(D,A,k,key,11), RK(B,A,k,key,12), RK(C,A,k,key,13), \
			   RK(D,A,k,key,14), RK(B,A,k,key,15), RK(C,A,k,key,16), RK(D,A,k,key,17), RK(B,A,k,key,18), RK(C,A,k,key,19), RK(D,A,k,key,20), \
			   RK(B,A,k,key,21), RK(C,A,k,key,22), RK(D,A,k,key,23), RK(B,A,k,key,24), RK(C,A,k,key,25), RK(D,A,k,key,26))







