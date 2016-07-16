/*
 * fs_lwe_sign.h
 *
 *  Created on: 10.10.2011
 *      Author: Wladimir Paulsen
 */

#ifndef FS_LWE_SIGN_H_
#define FS_LWE_SIGN_H_

#include <NTL/ZZ.h>
#include <NTL/ZZ_p.h>
#include <NTL/ZZ_pE.h>
#include <NTL/ZZ_pX.h>
#include "aux.h"
#include "sizes.h"
#include <cstdlib>
#include <vector>

//NTL_CLIENT
struct PublicParameter{
	int n;				// Define the degree of polynomials
	int m;				// define the number of polynomials
	int sigma;			//
	int k;				//
};

NTL::ZZ_pE generate_element_Dc(NTL::ZZ num_coeff, NTL::ZZ L1_value, unsigned char* md_value, unsigned int charArraySize);

/* Generate secret key for FS_LWE-Schema.
 * sk€Ds^m && Linf(sk) <= sigma. */
int generate_sk(PublicParameter PP, NTL::ZZ_pE *secret_key);

/* Generate random hash function for FS_LWE-Schema. */
int generate_random_hash_function(NTL::ZZ_pE *random_hash_function, int number_of_ZZ_pE);

/* Test input parameter and return a prime p with length (2*sigma +1)^m*(2^(-128/2)). */
NTL::ZZ test_input_parameter(PublicParameter PP);

/* Berechnet den Hash-Wert indem es message*(random hash function) berechnet */
NTL::ZZ_pE LWE_hash(PublicParameter PP, NTL::ZZ_pE *hash_function, NTL::ZZ_pE *message, int number_of_ZZ_pE);

/* Generate m random polynomials from Dy, which Linf-norm is <= n*m*k*sigma */
int random_element_Dy(PublicParameter PP, NTL::ZZ_pE* randomDy);

/* Take as input a random hash function and a message and put an element from Dc out.
 * This function should act as random oracle. */
NTL::ZZ_pE RandomOracle_Dc(PublicParameter PP, NTL::ZZ_pE LWE_hash_rand, unsigned char* message, unsigned long long message_length);

int verify_signatur(
		PublicParameter PublicParameter,
		unsigned char* 	message,
		NTL::ZZ_pE* 			SignaturePart_z,
		NTL::ZZ_pE* 			SignaturePart_e,
		NTL::ZZ_pE* 			HashPolynomials,
		NTL::ZZ_pE 			PublicKey,
		int 			length_Sign_z,
		unsigned long long message_length
	);

int sign_message(
		PublicParameter PublicParam,
		unsigned char* 	message,
		unsigned long long message_length,
		NTL::ZZ_pE* 			SecretKey,
		NTL::ZZ_pE* 			HashPolynomials,
		NTL::ZZ_pE* 			SignaturePart_e,
		NTL::ZZ_pE* 			SignaturePart_z
);

int crypto_sign_keypair(unsigned char *pk, unsigned char *sk);

int crypto_sign(
       unsigned char *sm,unsigned long long *smlen,
       const unsigned char *m,unsigned long long mlen,
       const unsigned char *sk
     );

int crypto_sign_open(
  unsigned char *m,unsigned long long *mlen,
  const unsigned char *sm,unsigned long long smlen,
  const unsigned char *pk
);


// how many bits in higher byte needed to get a random degree, if degree of reduction polynomial > 256
const unsigned char  BITS_HIGH_BYTE = log2(PUBLIC_PARAMETER_N) - 8;
// what is optimal size for splitting char array, so that there is no need for bit shift over chars
const unsigned char BLOCKSIZE = (8 - 8%(BITS_HIGH_BYTE+1))/(BITS_HIGH_BYTE+1);
// how many bytes are needed to get a random number in range of Dc
const unsigned char const_BYTES_NUMBER = ceil(ceil(log2(NTL::to_double(count_elements_up_to_L1(PUBLIC_PARAMETER_N,PUBLIC_PARAMETER_K))))/8);
// how many bytes are needed to get a random number in range of Dc
const unsigned char const_BITS_NUMBER = (unsigned char)(ceil(log2(NTL::to_double(count_elements_up_to_L1(PUBLIC_PARAMETER_N,PUBLIC_PARAMETER_K))))) % 8;

#endif /* FS_LWE_SIGN_H_ */
