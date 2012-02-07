/*
 * fs_lwe_sign.cpp
 *
 *  Created on: 16.10.2011
 *      Author: Wladimir Paulsen
 */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <vector>
#include <algorithm>

#include <openssl/sha.h>
#include <openssl/evp.h>
#include <NTL/ZZ.h>
#include <NTL/ZZ_p.h>
#include <NTL/ZZ_pE.h>
#include <NTL/ZZ_pX.h>

#include "aux.h"
#include "crypto_sign.h"
#include "fs_lwe_sign.h"
#include "crypto_sign.h"
#include "sizes.h"


NTL_CLIENT

/**
 * Look-up table for random oracle algorithm.
 */

NTL::ZZ L1_elements[] = {
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,0),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,1),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,2),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,3),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,4),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,5),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,6),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,7),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,8),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,9),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,10),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,11),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,12),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,13),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,14),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,15),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,16),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,17),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,18),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,19),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,20),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,21),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,22),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,23),
	count_elements_up_to_L1(PUBLIC_PARAMETER_N,24)
};
/*
// how many bits in higher byte needed to get a random degree, if degree of reduction polynomial > 256
const unsigned char BITS_HIGH_BYTE = log2(PUBLIC_PARAMETER_N) - 8;
// what is optimal size for splitting char array, so that there is no need for bit shift over chars
const unsigned char BLOCKSIZE = (8 - 8%(BITS_HIGH_BYTE+1))/(BITS_HIGH_BYTE+1);
// how many bytes are needed to get a random number in range of Dc
const unsigned int const_BYTES_NUMBER = ceil(ceil(log2(to_double(L1_elements[PUBLIC_PARAMETER_K])))/8);
// how many bytes are needed to get a random number in range of Dc
const unsigned int const_BITS_NUMBER = int(ceil(log2(to_double(L1_elements[PUBLIC_PARAMETER_K])))) % 8;

*/

/**
 * Generate secret key for FS_LWE-Schema.
 * @param PublicParam 	Public security parameter.
 * @param secret_key	Pointer to array of polynomials, where to store generated secret key.
 * @return 				0 if successful, else -1.
 */
int generate_sk(PublicParameter PublicParam, ZZ_pE *secret_key){

	if(PublicParam.m < 1||PublicParam.sigma < 1||secret_key == NULL){
		return -1;
	}

	for(int i = 0; i < PublicParam.m; i++){
		secret_key[i] = random_element_R_with_Linf(to_ZZ(PublicParam.sigma+1));
	}
	return EXIT_SUCCESS;
}

/**
 *	Generate random hash function for FS_LWE-Schema.
 * @param random_hash_function	Pointer to array of polynomials, where to store generated random hash polynomials.
 * @param number_of_ZZ_pE		Number of polynomials to generate.
 * @return	0 if successful, else -1.
 */
int generate_random_hash_function(ZZ_pE *random_hash_function, int number_of_ZZ_pE){
	if(number_of_ZZ_pE <1 || random_hash_function == NULL){
		return -1;
	}

	for(int i = 0; i < number_of_ZZ_pE; i++){
		random_hash_function[i] = random_ZZ_pE();
	}
	return EXIT_SUCCESS;
}


/**
 *	Convert deterministically a char-array into an element of Dc.
 *	Split char array in sections with size of BLOCKSIZE, to get optimal use of chars.
 *	Then get random power and raise coefficient, up to settled number of coefficients.
 *	Finally fill up settled powers to L1_value.
 * @param num_coeff			Number of settled coefficients in generated polynomial.
 * @param L1_value			L1-norm of generated polynomial.
 * @param charArray			Array with chars from message digest.
 * @param charArraySize		Number of chars in array.
 * @return	Generated element of ring Dc.
 */
ZZ_pE generate_element_Dc(ZZ num_coeff, ZZ L1_value, unsigned char* charArray, unsigned int charArraySize){

	unsigned int randomPower, bit_length;
	unsigned char koef=0,index_byte_block=0, index_byte_in_block=0, randomSettledPower, high_byte;

	ZZ_pX temp_res = ZZ_pX();
	std::vector<unsigned int> setted_coefficients;

	// while L1(element) != L1_value && inside of char array
	while((L1_norm_ZZ_pX(temp_res) != L1_value)&&((unsigned int)((BLOCKSIZE +1)*index_byte_block+index_byte_in_block) < charArraySize)){
		// While number of elements coefficients < num_coeff
		while((num_of_coeff_not_0(temp_res) < num_coeff)&&((unsigned int)((BLOCKSIZE +1)*index_byte_block+index_byte_in_block) < charArraySize)){

			if(index_byte_in_block%BLOCKSIZE == 0){
				koef = charArray[index_byte_block*(BLOCKSIZE +1)];	// byte with highByte's and coefficients
				index_byte_block++;
				index_byte_in_block = 0;
			}

			high_byte = (koef>>((BITS_HIGH_BYTE+1)*index_byte_in_block))&((1<<BITS_HIGH_BYTE) - 1);
			randomPower = charArray[index_byte_block*(BLOCKSIZE +1)+index_byte_in_block]+high_byte*(1<<8);

			if(std::find(setted_coefficients.begin(), setted_coefficients.end(), randomPower) == setted_coefficients.end()){
				// element is not in set
				setted_coefficients.push_back(randomPower);
				if((koef>>((BITS_HIGH_BYTE+1)*(index_byte_in_block+1)-1))&1){
					SetCoeff(temp_res,randomPower, 1);
				}else{
					SetCoeff(temp_res,randomPower,(-1));
				}
			}
			index_byte_in_block++;
		}

		if((L1_value > num_coeff)&&(L1_norm_ZZ_pX(temp_res) < L1_value)){	// raise one coefficient

			bit_length = (int)ceil(log2(setted_coefficients.size()));
			randomSettledPower = (charArray[index_byte_block*(BLOCKSIZE +1)+index_byte_in_block])&((1<<bit_length) - 1);

			if(randomSettledPower < setted_coefficients.size()){
				ZZ_p coeff_old = coeff(temp_res, setted_coefficients.at(randomSettledPower));

				if(2*rep(coeff_old) > coeff_old.modulus()){		// get sign of old coefficient
					SetCoeff(temp_res, setted_coefficients.at(randomSettledPower),coeff_old-1);
				}else{
					SetCoeff(temp_res, setted_coefficients.at(randomSettledPower),coeff_old+1);
				}
			}
		}
		index_byte_in_block++;
	}

	return to_ZZ_pE(temp_res);
}

/**
 * Test input parameter and return a prime p with length (2*sigma +1)^m*(2^(-128/2)).
 * @param PublicParam 	Public security parameter (n, m, sigma, k)
 * @return	A (probably) prime number with bitlength m*(ceil(log2(sigma))+1).
 */
ZZ test_input_parameter(PublicParameter PublicParam){
	ZZ binomial, p, tmp;

	long pow;
	binomial =  ZZ_binomial(to_ZZ(PublicParam.n),to_ZZ(PublicParam.k));

	if(PublicParam.n <= 0 || PublicParam.m <= 0 || PublicParam.sigma <= 0 || PublicParam.m <= 0||(PublicParam.n&(PublicParam.n-1))!= 0||(PublicParam.k +(log(binomial)/log(2)))< 160){
		printf("Some of input parameters is smaller as 0!\n");
		return ZZ::zero();
	}

	// test if n is power of 2
	if((PublicParam.n&(PublicParam.n-1))!= 0){
		printf("Error, n isn't power of 2!");
		return ZZ::zero();
	}

	/* take care that (k + log2((n over k))) >= 160 Bit */
	if((PublicParam.k +(log(binomial)/log(2)))< 160){
		printf("Error: Value k is to small!\n");
		return to_ZZ(0);
	}

	tmp = 2*power(to_ZZ(2*PublicParam.sigma+1), PublicParam.m);
	pow = log(tmp)/log(2);
	p = GenPrime_ZZ(pow,80);

	return p;
}

/**
 * Compute LWE-Hash by multiplying message with hash polynomials and add to results.
 * @param PublicParam		Public security parameter-
 * @param hash_function		Pointer to array of hash polynomials.
 * @param message			Pointer to array of polynomials to hash.
 * @param number_of_ZZ_pE	Number of polynomials in array.
 * @return					Hash-value as polynomial.
 */
ZZ_pE LWE_hash(PublicParameter PublicParam, ZZ_pE *hash_function, ZZ_pE *message, int number_of_ZZ_pE){
	ZZ_pE result = ZZ_pE::zero();
	ZZ_pE product = ZZ_pE::zero();

    // multiply message blocks with hash polynomials and add to result
    for (int i = 0; i < number_of_ZZ_pE; ++i) {
    	mul(product,message[i],hash_function[i]);
    	add(result,result,product);
	}
    return result;
}

/**
 * Generate (m) random polynomials from Dy, whose Linf-norm is <= n*m*k*sigma.
 * @param PublicParam	Public security parameter.
 * @param randomDy		Pointer to array, where to store generated polynomials.
 * @return	0 if successful, else -1.
 */
int random_element_Dy(PublicParameter PublicParam, ZZ_pE* randomDy){
	if(randomDy == NULL){
		return -1;
	}

	for(int i = 0; i < PublicParam.m; i++){
		randomDy[i] = random_element_R_with_Linf(to_ZZ(PublicParam.k*PublicParam.m*PublicParam.n*PublicParam.sigma));
	}
	return EXIT_SUCCESS;
}

/**
 *	Take as input a random hash function and a message and put an element from Dc out.
 *	This function should act as random oracle.
 * @param PublicParam		Public security parameter.
 * @param LWE_hash_rand		LWE-hash value of random element.
 * @param message			Pointer to message array of unsigned char.
 * @param message_length	Length of message array.
 * @return					Random element of ring Dc.
 */
ZZ_pE RandomOracle_Dc(
		PublicParameter 	PublicParam,
		ZZ_pE 				LWE_hash_rand,
		unsigned char* 		message,
		unsigned long long 	message_length
){

	unsigned char md_value[EVP_MAX_MD_SIZE];	// message digest
	unsigned char* char_arr;					// char-array for converted lwe-hash-value
	unsigned long long length_char_arr;
	int L1_norm=0, num_coeff=0;
	ZZ number;
	unsigned char run_index = 0;

	// convert LWE-Hash into char-array for hash-function
	char_arr =  convert_ZZ_pE_array_to_char_array(&LWE_hash_rand, 1, &length_char_arr);

	// copy message into a new array
	unsigned char* message_with_lwe = (unsigned char*)malloc(sizeof(char)*(size_t)(message_length + length_char_arr+1));

	if(NULL == message_with_lwe){
		printf("Couldn't reserve memory, abort!\n");
		return ZZ_pE::zero();
	}

	memcpy(message_with_lwe, char_arr,(size_t)length_char_arr);
	memcpy(&message_with_lwe[length_char_arr], message,(size_t)message_length);

	do{
		// append index to the end of array and hash the array
		memcpy(&message_with_lwe[message_length+ length_char_arr],(char *) &run_index, 1);
		SHA512(message_with_lwe, message_length + length_char_arr +1, md_value);

		md_value[const_BYTES_NUMBER-1] &= ((1<<const_BITS_NUMBER)-1);		// clear first bits to get a number in range Dc

		number = ZZFromBytes(md_value, const_BYTES_NUMBER);	// 8*20+2=162-Bit with
		run_index++;

	}while(number > L1_elements[PUBLIC_PARAMETER_K]);

	// get L1-Length
	for(int i = PublicParam.k; i>= 1;i--){
		if((L1_elements[i-1] < number) && (L1_elements[i] > number)){
			L1_norm = i;
			break;
		}
	}


	number -= L1_elements[L1_norm-1];
	ZZ sum_elements = L1_elements[L1_norm]-L1_elements[L1_norm-1];
	ZZ temp2;
	// get number of coefficients <= L1-length
	for (int index_num_coeff = L1_norm; index_num_coeff >= 1; index_num_coeff--){
		temp2 = count_elements_with_L1_and_coeffs(PublicParam.n, L1_norm, index_num_coeff);
		if((sum_elements - temp2 <= number) && (sum_elements > number)){
			num_coeff = index_num_coeff;
			break;
		}
		sum_elements -= temp2;
	}

	// Convert 512-Bit String (md_value) into an element of Dc
	ZZ_pE result =  generate_element_Dc(to_ZZ(num_coeff), to_ZZ(L1_norm), &md_value[const_BYTES_NUMBER], (unsigned int) EVP_MAX_MD_SIZE-const_BYTES_NUMBER);

	// delete temporary arrays and return a result
	free(char_arr);
	free(message_with_lwe);

	return result;
}

/**
 * Verify signature of message, given the message, signature and public key.
 * @param PublicParameter		Public security parameter.
 * @param message				Pointer to message array of unsigned chars.
 * @param SignaturePart_z		Pointer to array of polynomials, part z of signature.
 * @param SignaturePart_e		Pointer to array of polynomials, part e of signature.
 * @param HashPolynomials		Pointer to array of polynomials of LWE-hash function, part of public key.
 * @param PublicKey				LWE-hash of secret key, public key.
 * @param length_Sign_z			Length of polynomial array.
 * @param message_length		Length of message array.
 * @return						0 if successful, -1 else.
 */
int verify_signatur(
		PublicParameter PublicParameter,
		unsigned char* 	message,
		ZZ_pE* 			SignaturePart_z,
		ZZ_pE* 			SignaturePart_e,
		ZZ_pE* 			HashPolynomials,
		ZZ_pE 			PublicKey,
		int 			length_Sign_z,
		unsigned long long message_length
	){

	// is sign_z element of G^m ?
	ZZ max_length = to_ZZ(PublicParameter.sigma*PublicParameter.k*((PublicParameter.m*PublicParameter.n)-1));
	if(!is_element_with_max_Linf(max_length, SignaturePart_z, length_Sign_z)){
		printf("Verification failed, response is not an element of G^m! Abort!\n");
		return -1;
	}

	ZZ_pE hash_Sign_z = LWE_hash(PublicParameter, HashPolynomials, SignaturePart_z, length_Sign_z);
	ZZ_pE temp = hash_Sign_z - (*SignaturePart_e)*PublicKey;
	ZZ_pE temp_e = RandomOracle_Dc(PublicParameter,temp, message, message_length);

	return compare_ZZ_pE(SignaturePart_e,&temp_e,1);
}

/**
 *	Generate a Fiat-Shamir signature of message with given secret key.
 * @param PublicParam		Public security parameter.
 * @param message			Pointer to message array of unsigned chars.
 * @param message_length	Length of message array.
 * @param SecretKey			Pointer to array of polynomials of secret key.
 * @param HashPolynomials	Pointer to array of polynomials of LWE hash function.
 * @param SignaturePart_e	Pointer to signature part e.
 * @param SignaturePart_z	Pointer to signature part z.
 * @return					0 if successful, else -1.
 */
int sign_message(
		PublicParameter PublicParam,
		unsigned char* 	message,
		unsigned long long message_length,
		ZZ_pE* 			SecretKey,
		ZZ_pE* 			HashPolynomials,
		ZZ_pE* 			SignaturePart_e,
		ZZ_pE* 			SignaturePart_z
){
	ZZ max_length = to_ZZ(PublicParam.sigma*PublicParam.k*(PublicParam.n*PublicParam.m-1));
	ZZ_pE rand_Dy_hash;
	ZZ_pE random_Dy[PublicParam.m];


	do{
		random_element_Dy(PublicParam,random_Dy);

		rand_Dy_hash = LWE_hash(PublicParam, HashPolynomials, random_Dy, PublicParam.m);
		SignaturePart_e[0] = RandomOracle_Dc(PublicParam,rand_Dy_hash,message, message_length);

		for (int index = 0; index < PublicParam.m; ++index) {
			SignaturePart_z[index] = SecretKey[index]*SignaturePart_e[0] + random_Dy[index];
		}
	}while(!is_element_with_max_Linf(max_length, SignaturePart_z, PublicParam.m));

/*
	ZZ_pE PK = LWE_hash(PublicParam, HashPolynomials, SecretKey, PublicParam.m);
	ZZ_pE Hz = rand_Dy_hash + PK * SignaturePart_e[0];
	return compare_ZZ_pE(&Hz, &rand_Dy_hash,1);
*/
	return 0;
}

/**
 * Generate a pair of secret and public key.
 * @param pk	Char array to store public key and polynomials of LWE hash function.
 * @param sk	Char array to store secret key and polynomials of LWE hash function.
 * @return	0 if successful, -1 else.
 */
int crypto_sign_keypair(unsigned char *pk, unsigned char *sk){

	bool result;
	struct PublicParameter PP = {PUBLIC_PARAMETER_N, PUBLIC_PARAMETER_M,PUBLIC_PARAMETER_SIGMA,PUBLIC_PARAMETER_K};

	unsigned long long length;

	NTL::ZZ prime_number = test_input_parameter(PP);
	if(prime_number == ZZ::zero()){
		return -1;
	}

	initialize_ZZ_pE(prime_number, PP.n);						// initialize ZZ_pE and ZZ_p
	NTL::ZZ_pE sk_ZZ[PP.m];
	NTL::ZZ_pE rhf[PP.m];
	result = generate_sk(PP,sk_ZZ);								// generate random secret key
	generate_random_hash_function(rhf, PP.m);					// generate random hash-function
	ZZ_pE pk_ZZ_pE = LWE_hash(PP, rhf, sk_ZZ, PP.m);			// compute public key

	// convert and copy main parameter to byte arrays pk = [p|rhf|pk] and sk = [p|rhf|sk]
	// prime number p
	NTL::BytesFromZZ(pk, prime_number, BYTES_PRIMENUMBER);
	NTL::BytesFromZZ(sk, prime_number, BYTES_PRIMENUMBER);
	// random hash function
	convert_ZZ_pE_array_to_char_array(rhf, PP.m, &length, &sk[BYTES_PRIMENUMBER]);
	memcpy(&pk[BYTES_PRIMENUMBER],&sk[BYTES_PRIMENUMBER],(size_t)length);
	// secret and public key
	convert_ZZ_pE_array_to_char_array(&pk_ZZ_pE, 1, &length, &pk[BYTES_PRIMENUMBER+BYTES_HASHFUNCTION]);
	convert_ZZ_pE_array_to_char_array(sk_ZZ, PP.m, &length, &sk[BYTES_PRIMENUMBER+BYTES_HASHFUNCTION]);

	return result;
}


/**
 * Generating a signed message sm[0],...,sm[*smlen-1] from original message m[0],...,m[mlen-1] under secret key sk[0],sk[1].
 *
 * @param sm	Char array to store signed message (message + signature).
 * @param smlen	Length of signed message.
 * @param m		Char array with message to sign.
 * @param mlen	Length of message.
 * @param sk	Pointer to secret key.
 * @return		0 if successful, -1 else.
 */
int crypto_sign(unsigned char *sm,unsigned long long *smlen, const unsigned char *m,unsigned long long mlen, const unsigned char *sk){
	struct PublicParameter PP = {PUBLIC_PARAMETER_N, PUBLIC_PARAMETER_M, PUBLIC_PARAMETER_SIGMA, PUBLIC_PARAMETER_K};

	unsigned long long length;

	*smlen = mlen + BYTES_SIGNATUR_E + BYTES_SIGNATUR_Z;
	// read prime p and initialize ZZ_pE and ZZ_p
	NTL::ZZ prime_number = NTL::ZZFromBytes(sk, BYTES_PRIMENUMBER);
	initialize_ZZ_pE(prime_number, PUBLIC_PARAMETER_N);

	NTL::ZZ_pE sign_e;
	NTL::ZZ_pE sign_z[PUBLIC_PARAMETER_M];
	NTL::ZZ_pE hash_polynomial[PUBLIC_PARAMETER_M];
	NTL::ZZ_pE sk_ZZ_pE[PUBLIC_PARAMETER_M];

	convert_char_array_to_ZZ_pE_array(hash_polynomial, (unsigned char*)&sk[BYTES_PRIMENUMBER], BYTES_HASHFUNCTION, PUBLIC_PARAMETER_M,PUBLIC_PARAMETER_N);
	convert_char_array_to_ZZ_pE_array(sk_ZZ_pE, (unsigned char*)&sk[BYTES_PRIMENUMBER+BYTES_HASHFUNCTION],BYTES_SECRETKEY,PUBLIC_PARAMETER_M,PUBLIC_PARAMETER_N);

	int result = sign_message(PP, (unsigned char*) m, mlen, sk_ZZ_pE, hash_polynomial, &sign_e, sign_z);
	/* copy message and signature */
	memcpy(sm, m, (size_t) mlen);
	convert_ZZ_pE_array_to_char_array(sign_z, PP.m, &length, sm+mlen);
	convert_ZZ_pE_array_to_char_array(&sign_e, 1, &length, sm+mlen+BYTES_SIGNATUR_Z);

	return result;
}

/**
 * verifying a signed message sm[0],...,sm[smlen-1] under public key pk and producing original message m[0],m[1],...,m[*mlen-1].
 * @param m		Char array with message.
 * @param mlen	Length of message.
 * @param sm	Char array with signed message.
 * @param smlen	Length of signed message.
 * @param pk	Pointer to public key.
 * @return		0 if successful, -1 else.
 */
int crypto_sign_open(unsigned char *m, unsigned long long *mlen, const unsigned char *sm,unsigned long long smlen, const unsigned char *pk){
	struct PublicParameter PP = {PUBLIC_PARAMETER_N, PUBLIC_PARAMETER_M,PUBLIC_PARAMETER_SIGMA,PUBLIC_PARAMETER_K};

	NTL::ZZ prime_number = NTL::ZZFromBytes(pk, BYTES_PRIMENUMBER);
	initialize_ZZ_pE(prime_number, PUBLIC_PARAMETER_N);				// initialize ZZ_pE and ZZ_p

	NTL::ZZ_pE hash_polynomial[PUBLIC_PARAMETER_M];
	NTL::ZZ_pE sign_z[PUBLIC_PARAMETER_M];
	NTL::ZZ_pE pk_ZZ_pE, sign_e;

	*mlen = smlen - BYTES_SIGNATUR_E - BYTES_SIGNATUR_Z;
	memcpy(m, sm, (size_t) *mlen);	// copy chars from signed message

	convert_char_array_to_ZZ_pE_array(hash_polynomial,(unsigned char*)&pk[BYTES_PRIMENUMBER], BYTES_HASHFUNCTION,PUBLIC_PARAMETER_M, PUBLIC_PARAMETER_N);
	convert_char_array_to_ZZ_pE_array(&pk_ZZ_pE,(unsigned char*)&pk[BYTES_PRIMENUMBER+BYTES_HASHFUNCTION],BYTES_PUBLICKEY,1,PUBLIC_PARAMETER_N);
	convert_char_array_to_ZZ_pE_array(sign_z,(unsigned char *) (sm+*mlen),BYTES_SIGNATUR_Z, PUBLIC_PARAMETER_M, PUBLIC_PARAMETER_N);
	convert_char_array_to_ZZ_pE_array(&sign_e,(unsigned char *) (sm+*mlen+BYTES_SIGNATUR_Z), BYTES_SIGNATUR_E, 1, PUBLIC_PARAMETER_N);

	return verify_signatur(PP, m, sign_z, &sign_e, hash_polynomial, pk_ZZ_pE, PUBLIC_PARAMETER_M, *mlen);
}
