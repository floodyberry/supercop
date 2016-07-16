
#ifndef AUX_H_
#define AUX_H_

#include <NTL/ZZ.h>
#include <NTL/ZZ_pE.h>
#include <vector>

/** Setup a polynomial ring with (x^degree+1) as irreducible polynomial.
 * @param 	modulus_ZZ_pE 	Modulus of underlying integer field.
 * @param 	degree 			Degree of reduction polynomial.
 * @return 	Return 0 if successful else 1.
 * */
int initialize_ZZ_pE(NTL::ZZ modulus_ZZ_pE, int degree);

/** Compute binomial n over k and return the result.
 * @param  	n	NTL::ZZ Integer
 * @param	k	NTL::ZZ Integer
 * @return 	Return 0 if (n < k) or (n < 0) or (k < 0).
 * @return 	Return 1 if (n==0) or (k==0).
 * @return 	Else return (n over k) = n! / (k!*(n-k)!).
 * */
NTL::ZZ ZZ_binomial(NTL::ZZ n, NTL::ZZ k);

/**
 * Compare two ZZ_pE-arrays.
 *
 * @param polynomial_array1	First polynomial array to compare.
 * @param polynomial_array2	Second polynomial array to compare.
 * @param number_of_elements Number of polynomials in array.
 * @return Return 0 if arrays are the same, else return 1.
 */
int compare_ZZ_pE(NTL::ZZ_pE* polynomial_array1, NTL::ZZ_pE* polynomial_array2, int number_of_elements);

/**
 * Initialize NTL-Pseudo-random-number-generator with random bytes from /dev/random.
 * @param number_chars How many bytes from /dev/random will be used to init.
 * @return
 */
int init_random(int number_chars);

/**
 * Determine the highest coefficient of polynomial.
 * @param 	polynomial Polynomial to analyze.
 * @return the highest coefficient of polynomial.
 **/
NTL::ZZ Linf_norm_ZZ_pE(NTL::ZZ_pE polynomial);

/**
 * Determine the highest coefficient of polynomial.
 * @param 	polynomial Polynomial to analyze.
 * @return the highest coefficient of polynomial.
 **/
NTL::ZZ Linf_norm_ZZ_pX(NTL::ZZ_pX polynomial);

/**
 * Return the sum of absolute value of polynomial coefficients.
 * Polynomial coefficients are in range [-mod/2,...,mod/2].
 * @param polynomial Polynomial to analyze.
 * @return The sum of polynomial coefficients.
 */
NTL::ZZ L1_norm_ZZ_pE(NTL::ZZ_pE polynomial);

/**
 * Return the sum of absolute value of polynomial coefficients.
 * Polynomial coefficients are in range [-mod/2,...,mod/2].
 * @param polynomial Polynomial to analyze.
 * @return The sum of polynomial coefficients.
 */
NTL::ZZ L1_norm_ZZ_pX(NTL::ZZ_pX polynomial);
/**
 * Return number of elements whose have L1-norm equal to norm_1.
 * L1|x| = norm_1
 * Assume that modulus of polynomial coefficients is greater as norm_1
 * @param polynomial_degree	Greatest degree of polynomials to analyze.
 * @param norm_1			L1-norm to determine.
 * @return Number of polynomials with L1-norm = norm_1
 */
NTL::ZZ count_elements_with_L1(int polynomial_degree, int norm_1);

/**
 * Return number of elements whose have L1-norm less or equal to norm_1.
 * L1|x|<= norm_1
 * @param polynomial_degree		Greatest degree of polynomials to analyze.
 * @param max_norm_1			L1-norm to determine.
 * @return	Number of polynomials with L1-norm <= norm_1
 */
NTL::ZZ count_elements_up_to_L1(int polynomial_degree, int max_norm_1);

/**
 * Determine if each element of polynomial array is an element with max. L1-norm <= max_length.
 * @param max_Linf 		Maximal Linf-norm.
 * @param element		Array of polynomials.
 * @param array_length	Number of polynomials in array.
 * @return	Return true if each element of array has max Linf <= max_Linf , else false.
 */
bool is_element_with_max_Linf(NTL::ZZ max_Linf, NTL::ZZ_pE element[], int array_length);

/**
 * Determine if each element of polynomial array is an element with max. L1-norm <= max_length.
 * @param PP_m			How many elements should contain this array.
 * @param max_Linf		Maximal Linf-norm.
 * @param array			Array of polynomials.
 * @return	Return true if each element of array has max Linf <= max_Linf , else false.
 */
bool is_element_with_max_Linf(int PP_m, NTL::ZZ max_Linf, std::vector<NTL::ZZ_pE> array);

/**
 *	Return the number of polynomial coefficients unequal 0.
 * @param polynomial 	Polynomial to analyze.
 * @return The number of polynomial coefficients unequal 0.
 */
int num_of_coeff_not_0(NTL::ZZ_pE polynomial);

/**
 *	Return the number of polynomial coefficients unequal 0.
 * @param polynomial 	Polynomial to analyze.
 * @return The number of polynomial coefficients unequal 0.
 */
int num_of_coeff_not_0(NTL::ZZ_pX polynomial);

/**
 * Return the number of polynomials with certain L1-norm and certain number of coefficients.
 * @param maxPolynomialDegree
 * @param L1norm
 * @param num_coeffs
 * @return
 */
NTL::ZZ count_elements_with_L1_and_coeffs(int maxPolynomialDegree, int L1norm, int num_coeffs);

/* Generate a random polynomial whose L1-norm is equal to length. Random distribution. */
NTL::ZZ_pE random_element_Dc(int polynomial_degree, NTL::ZZ L1_value, NTL::ZZ modulus);

/* Convert a ZZ_pE-Array into an char-array.
 * Return a pointer to converted char-array. */
unsigned char* convert_ZZ_pE_array_to_char_array(NTL::ZZ_pE *ZZ_pE_array, int number_of_ZZ_pE, unsigned long long* length_char);

/* Convert a ZZ_pE-Array into an char-array.
 * Place converted char-array in memory pointed by parameter. */
int convert_ZZ_pE_array_to_char_array(NTL::ZZ_pE *ZZ_pE_array, int number_of_ZZ_pE, unsigned long long* length_char, unsigned char* char_array);

/* Convert a char-array in a ZZ_pE-array. */
int convert_char_array_to_ZZ_pE_array(NTL::ZZ_pE *ZZ_pE_array, unsigned char* char_array, unsigned long long length_char, int number_of_ZZ_pE, int polynomial_degree);

/* Return a random element of polynomial ring R with certain Linf-norm. */
NTL::ZZ_pE random_element_R_with_Linf(NTL::ZZ length_Linf);

#endif /* AUX_H_ */
