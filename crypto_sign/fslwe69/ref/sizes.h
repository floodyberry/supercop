/*
 * 	sizes.h
 *	Define sizes of function and security parameter.
 *  Created on: 20.11.2011
 *      Author: Wladimir Paulsen
 */

#ifndef SIZES_H_
#define SIZES_H_

/** Public parameter, must be a power of 2, and define the degree of polynomials. */
#define PUBLIC_PARAMETER_N 			1024					// [log2(N)] = [9]  = 	10
/** Public parameter, define the number of polynomials in secret key and hash function. */
#define PUBLIC_PARAMETER_M 			8						// [log2(M)] = [2,...] = 3
/** Public parameter, define the L1-norm of ring Dc. */
#define PUBLIC_PARAMETER_K 			21						// [log2(K)] = [4,..] = 5
/** Public parameter, define the Linf-norm of ring Ds. */
#define PUBLIC_PARAMETER_SIGMA 		2047					// [log2(SIGMA)] = [6,9..] = 11

//#define LOG2_P 						(ceil(log2(PUBLIC_PARAMETER_SIGMA))+1)*PUBLIC_PARAMETER_M

/** Bytelength of modulus p of integer ring Zp.
 * 	BYTES_PRIMENUMBER =[m*([log2(SIGMA)]+1)/8] */
#define BYTES_PRIMENUMBER 			(unsigned int)ceil(PUBLIC_PARAMETER_M*(ceil(log2(PUBLIC_PARAMETER_SIGMA))+1)/8)
/** Maximal bytelength of coefficients of elements Dy.
 * 	BYTES_Dy = [(log2(M)]+[(log2(N)]+[(log2(SIGMA)]+[(log2(K)]+1)/8 */
#define BYTES_Dy 					(unsigned int)ceil((ceil(log2(PUBLIC_PARAMETER_K*PUBLIC_PARAMETER_M*PUBLIC_PARAMETER_N*PUBLIC_PARAMETER_SIGMA))+1)/8)
/** Bytelength of secret key, without hashing polynomials. */
#define BYTES_SECRETKEY 			PUBLIC_PARAMETER_N*PUBLIC_PARAMETER_M*(unsigned int)ceil((ceil(log2(PUBLIC_PARAMETER_SIGMA))+1)/8)
/** Bytelength of LWE hash function. */
#define BYTES_HASHFUNCTION 			PUBLIC_PARAMETER_N*PUBLIC_PARAMETER_M*BYTES_PRIMENUMBER
/** Bytelength of public key, without hashing polynomials. */
#define BYTES_PUBLICKEY 			PUBLIC_PARAMETER_N*BYTES_PRIMENUMBER
/** Bytelength of signature part z. */
#define BYTES_SIGNATUR_Z 			PUBLIC_PARAMETER_N*PUBLIC_PARAMETER_M*BYTES_Dy
/** Bytelength of signature part e. */
#define BYTES_SIGNATUR_E 			PUBLIC_PARAMETER_N

#endif /* SIZES_H_ */
