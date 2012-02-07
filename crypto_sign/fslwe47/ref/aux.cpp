/*
 *
 * 	@file aux.cpp
 *  @date 16.10.2011
 *  @author Wladimir Paulsen
 */

#include "aux.h"
#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <fstream>
#include <vector>
#include "crypto_sign.h"

NTL_CLIENT


/** Set up a polynomial ring with (x^degree+1) as irreducible polynomial.
 * @param 	modulus_ZZ_pE 	Modulus of underlying integer field.
 * @param 	degree 			Degree of reduction polynomial.
 * @return 	Return 0 if successful else 1.
 * */
int initialize_ZZ_pE(ZZ modulus_ZZ_pE, int degree){
	if(modulus_ZZ_pE < 2 || degree < 1){
		return EXIT_FAILURE;
	}
	ZZ_p::init(modulus_ZZ_pE);				// define GF(p)

	ZZ_pX P = ZZ_pX(degree,to_ZZ_p(1));		// define P as x^n
	SetCoeff(P,0);							// set x^0 to 1

	ZZ_pE::init(P);							// set P as modulus for polynomials
	P.kill();
	return EXIT_SUCCESS;
}

/** Compute binomial n over k and return the result.
 * @param  	n	Integer
 * @param	k	Integer
 * @return 	Return 0 if (n < k) or (n < 0) or (k < 0).
 * @return 	Return 1 if (n==0) or (k==0).
 * @return 	Else return (n over k) = n! / (k!*(n-k)!).
 * */
ZZ ZZ_binomial(ZZ n, ZZ k){
	int i;
	ZZ out,n_,k_;

	if(n < k||n < ZZ::zero()||k < ZZ::zero()){
		return ZZ::zero();
	}

	if(n == 0 || k == 0){
		return to_ZZ(1);
	}

	k_ = k;
	n_ = n;

	if(k > n/2){
		k_ = n_ - k;
	}

	for(i = 1, out = 1; i <= k_; n_--, i++){
		out = out*n_/i;
	}

	return out;
}

/** Return the highest coefficient of polynomial.
 * @param 	polynomial		Polynomial of class Zp[x]/<x^n+1> which should be analyzed.
 * @return  The highest coefficient in range [-p/2,..,p/2] of polynomial.
 **/
ZZ Linf_norm_ZZ_pE(ZZ_pE polynomial){
	ZZ result, modulus, coeff_x_;
	ZZ_p coeff_x;
	ZZ_pX x_;

	x_ = rep(polynomial);

	result = 0;
	modulus = (coeff(x_,0)).modulus();

	for (int x_deg = 0; x_deg < polynomial.degree(); ++x_deg) {
		coeff_x = coeff(x_,x_deg);
		coeff_x_ = rep(coeff_x);
		if(coeff_x_ > modulus/2){
			coeff_x_ = modulus - coeff_x_;
		}
		if(coeff_x_ > result){
			result = coeff_x_;
		}
	}

	return result;
}

/** Return the highest coefficient of polynomial.
 * @param 	polynomial		Polynomial of class Zp[x]/<x^n+1> which should be analyzed.
 * @return  The highest coefficient in range [-p/2,..,p/2] of polynomial.
 **/
ZZ Linf_norm_ZZ_pX(ZZ_pX polynomial){
	ZZ result, modulus, coeff_x_ZZ;
	ZZ_p coeff_x_ZZp;
	long degree = deg(polynomial);

	result = 0;
	modulus = (coeff(polynomial,0)).modulus();

	for (int x_deg = 0; x_deg < degree; ++x_deg) {
		coeff_x_ZZp = coeff(polynomial,x_deg);
		coeff_x_ZZ = rep(coeff_x_ZZp);
		if(coeff_x_ZZ > modulus/2){
			coeff_x_ZZ = modulus - coeff_x_ZZ;
		}
		if(coeff_x_ZZ > result){
			result = coeff_x_ZZ;
		}
	}

	return result;
}

/**
 * Compare two ZZ_pE-arrays.
 *
 * @param polynomial_array1	First polynomial array to compare.
 * @param polynomial_array2	Second polynomial array to compare.
 * @param number_of_elements Number of polynomials in array.
 * @return Return 0 if arrays are the same, else return -1.
 */
int compare_ZZ_pE(ZZ_pE* polynomial_array1, ZZ_pE* polynomial_array2, int number_of_elements){
	ZZ_pX pol_ZZ_pX1, pol_ZZ_pX2;

	if(number_of_elements <= 0){
		return -1;
	}

	for (int index = 0; index < number_of_elements; ++index) {
		pol_ZZ_pX1 = rep(polynomial_array1[index]);
		pol_ZZ_pX2 = rep(polynomial_array2[index]);

		for (int coeff_power = 0; coeff_power < polynomial_array1[0].degree() ; ++coeff_power) {
			if(coeff(pol_ZZ_pX1, coeff_power) != coeff(pol_ZZ_pX2, coeff_power)){
				return -1;
			}
		}
	}
	return 0;
}

/** Compare two ZZ_pE-arrays.
 *
 * @param polynomial_array1	First polynomial array to compare.
 * @param polynomial_array2	Second polynomial array to compare.
 * @return	Return 0 if arrays are the same, else return -1.
 */
int compare_ZZ_pE(vector<ZZ_pE> polynomial_array1, vector<ZZ_pE> polynomial_array2){
	ZZ_pX pol_ZZ_pX1, pol_ZZ_pX2;

	if((polynomial_array1.size() != polynomial_array2.size())||(polynomial_array1.size() <= 0)){
		return -1;
	}

	for (unsigned int index = 0; index < polynomial_array1.size(); ++index) {
		pol_ZZ_pX1 = rep(polynomial_array1.at(index));
		pol_ZZ_pX2 = rep(polynomial_array2.at(index));

		for (int coeff_power = 0; coeff_power < polynomial_array1.at(index).degree() ; ++coeff_power) {
			if(coeff(pol_ZZ_pX1, coeff_power) != coeff(pol_ZZ_pX2, coeff_power)){
				return -1;
			}
		}
	}
	return 0;
}

/**
 *	Compute the L1-Norm of polynomial.
 * @param polynomial	Polynomial of class Zp[x]/<x^n+1> which should be analyzed.
 * @return The sum of polynomial coefficients in range [-p/2,..,p/2].
 */
ZZ L1_norm_ZZ_pE(ZZ_pE polynomial){
	ZZ result, modulus, coeff_x_;
	ZZ_p coeff_x;
	ZZ_pX x_;

	x_ = rep(polynomial);

	result = 0;
	modulus = (coeff(x_,0)).modulus();


	for (int x_deg = 0; x_deg < polynomial.degree(); ++x_deg) {
		coeff_x = coeff(x_,x_deg);
		coeff_x_ = rep(coeff_x);
		if(coeff_x_ > modulus/2){
			coeff_x_ = modulus - coeff_x_;
		}
		result += coeff_x_;
	}
	return result;
}

/**
 *	Compute the L1-Norm of polynomial.
 * @param polynomial	Polynomial of class Zp[x]/<x^n+1> which should be analyzed.
 * @return The sum of polynomial coefficients in range [-p/2,..,p/2].
 */
ZZ L1_norm_ZZ_pX(ZZ_pX polynomial){
	ZZ result, modulus, coeff_x_ZZ;
	ZZ_p coeff_x_ZZ_p;

	result = 0;
	modulus = (coeff(polynomial,0)).modulus();
	long degree = deg(polynomial);


	for (int x_deg = 0; x_deg <= degree; ++x_deg) {
		coeff_x_ZZ_p = coeff(polynomial,x_deg);
		coeff_x_ZZ = rep(coeff_x_ZZ_p);
		if(coeff_x_ZZ > modulus/2){
			coeff_x_ZZ = modulus - coeff_x_ZZ;
		}
		result += coeff_x_ZZ;
	}
	return result;
}

/**
 * Read in number_chars random bytes from /dev/random and initialize NTL-PRNG with it.
 * @param number_chars	Number of chars to read from /dev/random.
 * @return 0 if successful, 1 else.
 */
int init_random(int number_chars){
	FILE *random_source;
	char random_char[number_chars];

	if((random_source = fopen("/dev/urandom", "r")) == NULL ){
		printf("Error: could not open /dev/urandom!\n");
		return EXIT_FAILURE;
	}

	if(!fgets(random_char,number_chars,random_source)){
		printf("Error: could not write random bytes into char array!");
		return EXIT_FAILURE;
	}
	fclose(random_source);

	SetSeed(ZZFromBytes((unsigned char *)random_char,number_chars));

	return EXIT_SUCCESS;
}

/**
 * Return the number of polynomials Zp[x]/<x^n+1> whose L1-norm is less or equal to max_norm_1. L1|x|<= max_norm_1
 * Assume that p > 2*max_norm_1.
 * @param polynomial_degree	Maximal degree of polynomials (n).
 * @param max_norm_1		Maximal L1-norm of polynomials.
 * @return	The number of polynomials |X|. X={ y€Zp[x]/<x^n+1> : L1(y) <= num_coeffs}.
 */
NTL::ZZ count_elements_up_to_L1(int polynomial_degree, int max_norm_1){
	ZZ count = ZZ::zero();

	for (int length = 0; length <= max_norm_1; ++length) {
		count += count_elements_with_L1(polynomial_degree,length);
	}
	return count;
}

/**
 * Return number of polynomials Zp[x]/<x^n+1> whose L1-norm is equal to norm_1.
 * Assume that p > 2*max_norm_1.
 * @param polynomial_degree		Maximal degree of polynomials (n).
 * @param norm_1				L1-norm of polynomials.
 * @return	The number of polynomials |X|. X={ y€Zp[x]/<x^n+1> : L1(y) = norm_1}.
 */
ZZ count_elements_with_L1(int polynomial_degree, int norm_1){
	ZZ count = ZZ::zero();
	if(polynomial_degree <= 0){
		return count;
	}

	if(norm_1 == 0){
		return to_ZZ(1);
	}

	for (int num_coeff = 1; num_coeff <= norm_1; ++num_coeff) {
		count += count_elements_with_L1_and_coeffs(polynomial_degree,norm_1,num_coeff);
	}
	return count;
}

/**
 * Return number of polynomials Zp[x]/<x^n+1> whose L1-norm is equal to norm_1 and the number of settled coefficients is equal to num_coeffs.
 * @param maxPolynomialDegree	Maximal degree of polynomials (n).
 * @param L1norm				L1-norm of polynomials.
 * @param num_coeffs			Number of settled coefficients.
 * @return	The number of polynomials |X|. X={ y€Zp[x]/<x^n+1> : L1(y) = norm_1 & coeff(y) = num_coeffs}.
 */
ZZ count_elements_with_L1_and_coeffs(int maxPolynomialDegree, int L1norm, int num_coeffs){
	if(maxPolynomialDegree < 1||L1norm < 0||num_coeffs < 0){
		return ZZ::zero();
	}
	if(maxPolynomialDegree>0 && L1norm == 0 && num_coeffs == 0){
		return to_ZZ(1);
	}

	return ZZ_binomial(to_ZZ(L1norm -1),to_ZZ(num_coeffs-1))*ZZ_binomial(to_ZZ(maxPolynomialDegree),to_ZZ(num_coeffs))*power(to_ZZ(2),num_coeffs);
}

/**
 * Generate polynomial as element of polynomial ring Zp[x]/<x^n+1>, whose L1-norm is equal to "L1_value".
 * @param polynomial_degree		Maximal degree of polynomials (n).
 * @param L1_value				L1-norm of polynomial to generate.
 * @param modulus				Integer modulus p.
 * @return	Random polynomial y from ring Zp[x]/<x^n+1> and L1(y) = L1_value.
 */
ZZ_pE random_element_Dc(int polynomial_degree, ZZ L1_value, ZZ modulus){

	ZZ_pX rand_Dc;
	ZZ_pBak bak;
	ZZ_pE rand_Dc_ZZ_pE;
	long random_long,random_power;
	ZZ L1;
	ZZ_p coeff_old;

	ZZ_p::init(modulus);
	bak.save();								// store current modulus to bak

	rand_Dc = ZZ_pX();						// generate empty ZZ_pX
	rand_Dc_ZZ_pE = to_ZZ_pE(rand_Dc);		// transform it to ZZ_pE
	ZZ_p::init(to_ZZ(polynomial_degree));	// set modulus to n
	L1 = L1_norm_ZZ_pE(rand_Dc_ZZ_pE);

	while(L1 != L1_value) {
		random_power = random()%polynomial_degree;	// generate random coefficient in range(0...n-1)
		random_long = random();

		ZZ_p::init(modulus);						// set modulus to modulus
		coeff_old = coeff(rand_Dc, random_power);	// get old coefficient

		if(random_long > RAND_MAX/2){				// if random number > RAND_MAX/2 then multiply with -1
			SetCoeff(rand_Dc,random_power,coeff_old+(-1));
		}else{
			SetCoeff(rand_Dc,random_power,coeff_old + 1);
		}

		rand_Dc_ZZ_pE = to_ZZ_pE(rand_Dc);			// transform ZZ_pX to ZZ_pE
		L1 = L1_norm_ZZ_pE(rand_Dc_ZZ_pE);
	}
	bak.restore();									// restore modulus

	return rand_Dc_ZZ_pE;
}

/**
 * Determine if all elements of polynomial array have a maximal Linf norm less or equal to maxLinf.
 * @param maxLinf				Maximal Linf norm.
 * @param polynomialArray		Array with polynomials.
 * @param polynomialArrayLength	Number of polynomials in array.
 * @return	True if Linf norm of all array elements is less or equal to maxLinf, else false.
 */
bool is_element_with_max_Linf(ZZ maxLinf, ZZ_pE polynomialArray[], int polynomialArrayLength){
	if(maxLinf < 0||polynomialArrayLength < 1||polynomialArray == NULL){
		return false;
	}
	for (int index = 0; index < polynomialArrayLength; ++index) {
		if(Linf_norm_ZZ_pE(polynomialArray[index])>maxLinf){
			return false;
		}
	}
	return true;
}

/**
 * Convert an array with ZZ_pE elements (polynomials) to a char array.
 * @param ZZ_pE_array		Pointer to array with ZZ_pE elements to convert.
 * @param number_of_ZZ_pE	Number of elements in array.
 * @param length_char		Pointer to integer, where to store number of converted chars.
 * @return	Pointer to char array with converted elements.
 */
unsigned char* convert_ZZ_pE_array_to_char_array(ZZ_pE *ZZ_pE_array, int number_of_ZZ_pE, unsigned long long* length_char){
	// get length of most length coeff in bits
	ZZ most_length_coeff;
	long bitlength, bytelength;
	ZZ_pX temp_ZZ_pX;
	ZZ_p koeff_x;
	bool sign;
	int degree = ZZ_pE_array[0].degree();

	for (int index = 0; index < number_of_ZZ_pE; ++index) {
		most_length_coeff = Linf_norm_ZZ_pE(ZZ_pE_array[index]);
	}
	bitlength = NumBits(most_length_coeff);

	if(bitlength%8){
		bytelength = (bitlength - bitlength%8)/8 +1;
	}else{
		bytelength = bitlength/8;
	}

	*length_char = bytelength*number_of_ZZ_pE*degree;
	unsigned char* char_array = (unsigned char *)malloc(*length_char*sizeof(unsigned char));

	for (int index_ZZ_pE = 0; index_ZZ_pE < number_of_ZZ_pE; ++index_ZZ_pE) {
		temp_ZZ_pX = rep(ZZ_pE_array[index_ZZ_pE]);
		for (int index_coefficient = 0; index_coefficient < degree; ++index_coefficient) {
			koeff_x = coeff(temp_ZZ_pX,index_coefficient);
			sign = false;
			if(rep(koeff_x)*2 > koeff_x.modulus()){
				koeff_x = to_ZZ_p((koeff_x.modulus()-rep(koeff_x)));
				sign = true;
			}
			BytesFromZZ(&char_array[(index_ZZ_pE*degree+index_coefficient)*bytelength],rep(koeff_x),bytelength);	// return koeff as char-array
			if(sign){
				char_array[(index_ZZ_pE*degree+index_coefficient+1)*bytelength-1] |=(1<<7);
			}
		}
	}
	return char_array;
}

/**
 * Convert array with ZZ_pE elements (polynomials) to char array.
 * @param ZZ_pE_array		Pointer to array with ZZ_pE elements to convert.
 * @param number_of_ZZ_pE	Number of elements in array.
 * @param length_char		Pointer to integer, where to store number of converted chars.
 * @param char_array		Pointer to char array with converted elements.
 * @return 0 if successful, -1 else.
 */
int convert_ZZ_pE_array_to_char_array(NTL::ZZ_pE *ZZ_pE_array, int number_of_ZZ_pE, unsigned long long* length_char, unsigned char* char_array){
	// get length of most length coeff in bits
	ZZ most_length_coeff;
	long bitlength, bytelength;
	ZZ_pX temp_ZZ_pX;
	ZZ_p koeff_x;
	bool sign;
	int degree = ZZ_pE_array[0].degree();

	for (int index = 0; index < number_of_ZZ_pE; ++index) {
		most_length_coeff = Linf_norm_ZZ_pE(ZZ_pE_array[index]);
	}
	bitlength = NumBits(most_length_coeff);

	if(bitlength%8){
		bytelength = (bitlength - bitlength%8)/8 +1;
	}else{
		bytelength = bitlength/8;
	}

	*length_char = bytelength*number_of_ZZ_pE*degree;

	for (int index_ZZ_pE = 0; index_ZZ_pE < number_of_ZZ_pE; ++index_ZZ_pE) {
		temp_ZZ_pX = rep(ZZ_pE_array[index_ZZ_pE]);
		for (int index_coefficient = 0; index_coefficient < degree; ++index_coefficient) {
			koeff_x = coeff(temp_ZZ_pX,index_coefficient);
			sign = false;
			if(rep(koeff_x)*2 > koeff_x.modulus()){
				koeff_x = to_ZZ_p((koeff_x.modulus()-rep(koeff_x)));
				sign = true;
			}
			BytesFromZZ(&char_array[(index_ZZ_pE*degree+index_coefficient)*bytelength],rep(koeff_x),bytelength);	// return koeff as char-array
			if(sign){
				char_array[(index_ZZ_pE*degree+index_coefficient+1)*bytelength-1] |=(1<<7);
			}
		}
	}

	return EXIT_SUCCESS;
}

/**
 * Convert char-array (with converted ZZ_pE elements) back to ZZ_pE-array.
 * @param ZZ_pE_array			Pointer to ZZ_pE array.
 * @param char_array			Pointer to char array.
 * @param length_char			Number of chars in char array.
 * @param number_of_ZZ_pE		Number of stored ZZ_pE elements in char array.
 * @param polynomial_degree		Maximal degree of stored ZZ_pE elements.
 * @return	0 if successful, -1 else.
 */
int convert_char_array_to_ZZ_pE_array(NTL::ZZ_pE *ZZ_pE_array,unsigned char* char_array,unsigned long long length_char, int number_of_ZZ_pE, int polynomial_degree){
	ZZ koeff_ZZ;
	ZZ_pX temp_ZZ_pX;

	if(length_char%(number_of_ZZ_pE*polynomial_degree)){
		printf("Char-array does not contain the right number of chars! Abort!\n");
		return EXIT_FAILURE;
	}
	int bytelength = length_char/(number_of_ZZ_pE*polynomial_degree);

	ZZ modulus = coeff(rep((const ZZ_pE)*ZZ_pE_array),0).modulus();
	ZZ_p koeff_p;
	unsigned char temp_string[bytelength];

	for (int index_ZZ_pE_element = 0; index_ZZ_pE_element < number_of_ZZ_pE; ++index_ZZ_pE_element) {
		for (int coeff_power = 0; coeff_power < polynomial_degree; ++coeff_power) {
			if(char_array[(index_ZZ_pE_element*polynomial_degree+coeff_power+1)*bytelength-1]>>7){
				for (int index = 0; index < bytelength-1; ++index) {
					temp_string[index] = char_array[(index_ZZ_pE_element*polynomial_degree+coeff_power)*bytelength+index];
				}
				temp_string[bytelength-1] = char_array[(index_ZZ_pE_element*polynomial_degree+coeff_power+1)*bytelength-1]&0x7F;
				ZZFromBytes(koeff_ZZ, temp_string, bytelength);				// construct a ZZ-number from byte-array
				koeff_p = to_ZZ_p(koeff_ZZ*(-1));
				SetCoeff(temp_ZZ_pX,coeff_power,koeff_p);	// set this ZZ-number as coefficient in ZZ_pX-polynomial
			}else{
				ZZFromBytes(koeff_ZZ, &char_array[(index_ZZ_pE_element*polynomial_degree+coeff_power)*bytelength], bytelength);				// construct a ZZ-number from byte-array
				SetCoeff(temp_ZZ_pX,coeff_power,to_ZZ_p(koeff_ZZ));			// set this ZZ-number as coefficient in ZZ_pX-polynomial
			}
		}
		ZZ_pE_array[index_ZZ_pE_element] = to_ZZ_pE(temp_ZZ_pX);
	}
	return EXIT_SUCCESS;
}

/**
 * Return a random element of polynomial ring Zp[x]/<x^n+1>, whose Linf-norm is equal to parameter length_Linf.
 * @param length_Linf	Desired Linf norm of element.
 * @return Random polynomial y of ring Zp[x]/<x^n+1> with Linf(y) = length_Linf.
 */
NTL::ZZ_pE random_element_R_with_Linf(NTL::ZZ length_Linf){
	ZZ_pX temp;
	ZZ_pBak bak;
	bak.save();					// store current modulus of ZZ_p to bak

	ZZ_p::init(length_Linf);	// set modulus to sigma+1

	for(long index_power = 0; index_power < ZZ_pE::degree();index_power++){
		if(rand()&1){
			SetCoeff(temp, index_power,random_ZZ_p());
		}else{
			SetCoeff(temp, index_power,random_ZZ_p()*(-1));
		}
	}

	bak.restore();				// set previous modulus back

	return to_ZZ_pE(temp);
}

/**
 * Return the number of polynomial coefficients which are not 0.
 * @param polynomial	Polynomial of polynomial ring Zp[x]/<x^n+1>.
 * @return	Number of polynomial coefficients unequal to 0.
 */
int num_of_coeff_not_0(NTL::ZZ_pE polynomial){
	int result = 0;
	ZZ_pX temp_ZZ_pX = rep(polynomial);

	for (long int index_coeff = 0; index_coeff < polynomial.degree(); ++index_coeff) {
		if(coeff(temp_ZZ_pX,index_coeff) != ZZ_pE::zero())	result++;
	}
	return result;
}

/**
 * Return the number of polynomial coefficients which are not 0.
 * @param polynomial	Polynomial of polynomial ring Zp[x]/<x^n+1>.
 * @return	Number of polynomial coefficients unequal to 0.
 */
int num_of_coeff_not_0(NTL::ZZ_pX polynomial){
	int result = 0;

	for (long int index_coeff = 0; index_coeff <= deg(polynomial); ++index_coeff) {
		if(coeff(polynomial,index_coeff) != ZZ_pE::zero())	result++;
	}
	return result;
}
