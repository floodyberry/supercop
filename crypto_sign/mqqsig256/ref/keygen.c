/*
    This file is part of the mqq-sig package for SUPERCOP.
    Copyright (C) 2010 Rune E. Jensen (runeerle@stud.ntnu.no), 
	               Danilo Gligoroski (danilog@item.ntnu.no)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
/*
 * \file keygen.c
 * \author Rune E. Jensen and Danilo Gligoroski 
 * \license GPLv3 or later
 *
 */


/*
	MQQ reference key pair generator (beta).
	This code use 1-bit math for almost all operations, and is therefor very slow.
	Most logic is not optimized.
	Programed by Rune E. Jensen December 2010
*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include "mqqsig.h"

#ifndef min
	#define min( a, b ) ( ((a) < (b)) ? (a) : (b) )
#endif

#if MQQ_SUPERCOP_BUILD == 1
#include "crypto_sign.h"
#include "randombytes.h"

static int randomNum()
{
	int buf[1];
	randombytes( (unsigned char *) &buf, 4);
	return (buf[0] & RAND_MAX);
}

static void srandomNum(int seed) { srandom(seed); }

#else
static int randomNum() { return rand(); }
static void srandomNum(int seed) { srand(seed); }
#endif

// Saving of the Public-key, either to file (if pk == null) or to *pk.
static int32_t savePublicKey(uint8_t xxFinale[N][SYMBOLIC_NN_SIZE], unsigned char *pk)
{
	uint8_t (*publicKey)[PUBLICKEY_SIZE_S] = (uint8_t (*)[PUBLICKEY_SIZE_S]) malloc(sizeof(uint8_t) * PUBLICKEY_SIZE_L * PUBLICKEY_SIZE_S);
	
	#if N < 256
	uint_fast16_t i;
	uint_fast8_t j;
	#else
	uint_fast32_t i;
	uint_fast16_t j;
	#endif

	if(publicKey == NULL)
		return -1;

	// Clear publicKey
	for(i = 0; i < PUBLICKEY_SIZE_L; i++)
		for(j = 0; j < PUBLICKEY_SIZE_S; j++)
			 publicKey[i][j] = 0;
	
	// Make the publicKey in the binary format
	for(i = 0; i < SYMBOLIC_NN_SIZE; i++)
		for(j = PUBLICKEY_FIRST_ROW; j < PUBLICKEY_LAST_ROW; j++)
		{
			uint_fast8_t byteindex = j>>3;
			uint_fast8_t bitindex = 0x80 >> (j&0x07);
			if(xxFinale[j][i])
				publicKey[i][byteindex-PUBLICKEY_FIRST_ROW/8] ^= bitindex;
		}
	
	// Make the last column in publicKey, its all the other row's xor'ed 
	for(i = 0; i < SYMBOLIC_NN_SIZE; i++)
		for(j = 0; j < PUBLICKEY_SIZE_S; j++)
			publicKey[PUBLICKEY_SIZE_L-1][j] ^= publicKey[i][j];
	
	
	if(pk == NULL)
	{
		free(publicKey);
		return -1;
	}
	else
	{
		// Write the public key to the storage in pointer pk
		memcpy(pk, publicKey, PUBLICKEY_SIZE_L * PUBLICKEY_SIZE_S);
	}
	free(publicKey);
	
	return 0;
}

// Makes a random permutation of the first numberOfValuesToShuffle values in num.
// This is Durstenfeld's algorithm 
// But the value of randomSwapPos here is not perfectly chosen.
static void randomPermutation_int(uint_sigma_calc num[], int16_t numberOfValuesToShuffle)
{
	uint16_t i, randomSwapPos;
	uint_sigma_calc temp;
	for(i = numberOfValuesToShuffle; i > 1; i--)
	{
		randomSwapPos = randomNum() % i;
		temp = num[randomSwapPos];
		num[randomSwapPos] = num[i-1];
		num[i-1] = temp;
	}
}


// Performs a direct copy of the constants and linear symbols in booleanSSymbolic into xx.
// Only the first 8 rows are copied.
static void copyFirst8Symbolic(uint8_t booleanSSymbolic[N][N+1], uint8_t xx[N][SYMBOLIC_NN_SIZE])
{
	uint_fast8_t i;
	uint_sigma_calc j;
	for(i = 0; i < 8; i++)
	{
		xx[i][0] ^= booleanSSymbolic[i][0]; // Add constant. TODO: Change to copy
		for(j = 1; j < N+1; j++)
			xx[i][j] = booleanSSymbolic[i][j]; // Copy linear components
	}
}


// Fill an 8x8 matrix with random Boolean values. The matrix is NonSingular (determinant == 1).
static void makeNonSingularMatrix8x8(uint8_t matrix[8][8])
{
	uint_fast8_t i, j, k, det;
	uint8_t tempMatrix[8][8];
	// Keep trying to find an random matrix until it is NonSingular.
	do {
		det = 1;
		// Fill the matrix with random boolean values.
		for(i = 0; i < 8; i++)
			for(j = 0; j < 8; j++)
				tempMatrix[i][j] = matrix[i][j] = randomNum() & 0x1;
		
		// Perform Gaussian elimination to check if we can construct a diagonal containing only 1's.
		for(i = 0; i < 8; i++)
		{
			// i is the row index to where we need to make tempMatrix[i][i]==1

			int_fast8_t swapped = -1;
			for(j = i; j < 8; j++) {
				// Perform swap?
				if(tempMatrix[j][i] && swapped == -1) {
				
					for(k = 0; k < 8; k++) {
						uint8_t temp = tempMatrix[i][k];
						tempMatrix[i][k] = tempMatrix[j][k];
						tempMatrix[j][k] = temp;
					}
					swapped = j;
				} else if(tempMatrix[j][i] && swapped != -1) {
					// Need to subtract (xor) tempMatrix[i] from tempMatrix[j]
					for(k = 0; k < 8; k++) {
						tempMatrix[j][k] ^= tempMatrix[i][k];
					}
				}
			}
			// In every column there must exist an non zero element, if not the determinant is 0.
			// This is the same as a swap (even between one line) as been performed for each column.
			if(swapped == -1) {
				det = 0;
				break;
			}
		}
	} while(det == 0);
}

// Constant part only in C: booleanS * h1
// Perform the multiplication between booleanSSymbolic and h1.
// Constant part only, the linear and quadratic terms are not touched.
static void findConstants(	uint8_t h[8][137], uint8_t booleanSSymbolic[N][N+1], 
							uint_sigma_calc startIndexOfF1, uint_sigma_calc startIndexOfF9, 
							uint8_t xx[N][SYMBOLIC_NN_SIZE], int targetIndexInxx)
{
	uint_fast8_t i, j;
	
	for(i = 0; i < 8; i++) {
		int targetConstantIndexInxx = targetIndexInxx + i;
		uint_fast8_t firstX;
		uint_fast8_t secondX;
		uint_fast8_t index_h = 16+1; // The first quadratic expresion in h
		
		// Add constant from h[i]
		xx[targetConstantIndexInxx][0] ^= h[i][0]; // Location of constant in xx and h
		
		// Check each symbol in h[i] (x1-x8), and if it is present add the corresponding constant from booleanSSymbolic[ "x_n" ]
		// Need to add constant in booleanSSymbolic[startIndexOfF1 + offset] to xx[targetConstantIndexInxx]
		for(j = 1; j < 8+1; j++) {
			if(h[i][j]) {
				// The symbol x_j is present in h.
				// Find the corresponding equation in booleanSSymbolic
				int indexOfX_j = startIndexOfF1 + j - 1;
				xx[targetConstantIndexInxx][0] ^= booleanSSymbolic[indexOfX_j][0]; // Location of constant in xx and booleanSSymbolic
			}
		}
		
		// Check each symbol in h[i] (x9-x16), and if it is present add the corresponding constant from booleanSSymbolic[ "x_j" ]
		// Need to add constant in booleanSSymbolic[startIndexOfF9 + offset] to xx[targetConstantIndexInxx]
		for(j = 1+8; j < 16+1; j++) {
			if(h[i][j]) {
				// The symbol x_j is present in h.
				// Find the corresponding equation in booleanSSymbolic
				uint_sigma_calc indexOfX_j = startIndexOfF9 + j - 9;
				xx[targetConstantIndexInxx][0] ^= booleanSSymbolic[indexOfX_j][0]; // Location of constant in xx and booleanSSymbolic
			}
		}
		
		// Check each symbol in h[i] (x1-x8)(x9-16), and if it is present add the corresponding constant 
		// from booleanSSymbolic[ "x_firstX" ] * booleanSSymbolic[ "x_secondX" ]
		// Need to add constant in booleanSSymbolic[startIndexOfF1 + offset] to xx[targetConstantIndexInxx]
		
		// This performs lots of useless tests  like (x1 x2)
		for(firstX = 0; firstX < 16; firstX++)
		{
			for(secondX = firstX+1; secondX < 16; secondX++) {
				if(h[i][index_h]) {
					uint_sigma_calc indexOfX_firstX = startIndexOfF1 + firstX; // firstX will always be in the range of 0-7
					uint_sigma_calc indexOfX_secondX = startIndexOfF9 + secondX - 8; // secondX will always be in the range of 8-15
					uint8_t product = booleanSSymbolic[indexOfX_firstX][0] & booleanSSymbolic[indexOfX_secondX][0];
					
					// Now add the product to xx
					xx[targetConstantIndexInxx][0] ^= product;
				}
				index_h++;
			}
		}
	}
}

// Linear symbolics part only in C: booleanSSymbolic * h1
// Perform the multiplication between booleanSSymbolic and h1.
// Linear part only (including quadratic terms of the from 'x[i] x[i]'), the constant and quadratic terms are not touched.
static void findLinearSymbolics(uint8_t h[8][137], uint8_t booleanSSymbolic[N][N+1], 
								uint_sigma_calc startIndexOfF1, uint_sigma_calc startIndexOfF9, 
								uint8_t xx[N][SYMBOLIC_NN_SIZE], int targetIndexInxx)
{
	uint_fast8_t i, j;
	int k;
	for(i = 0; i < 8; i++) {
		int targetConstantIndexInxx = targetIndexInxx + i;
		uint_fast8_t firstX;
		uint_fast8_t secondX;
		int index_h = 16+1; // The first quadratic expresion in h
		
		// Check each symbol in h[i] (x1-x8), and if it is present add the corresponding linear part from booleanSSymbolic[ "x_n" ]
		// Need to add linear parts in booleanSSymbolic[startIndexOfF1 + offset] to xx[targetConstantIndexInxx]
		for(j = 1; j < 8+1; j++) {
			if(h[i][j]) {
				// The symbol x_j is present in h.
				// Find the corresponding equation in booleanSSymbolic
				int indexOfX_j = startIndexOfF1 + j -1;
				for(k = 0; k < N; k++)
					xx[targetConstantIndexInxx][k+1] ^= booleanSSymbolic[indexOfX_j][k+1]; // Location of linear parts in xx and booleanSSymbolic
				
			}
		}
		
		// Check each symbol in h[i] (x9-x16), and if it is present add the corresponding constant from booleanSSymbolic[ "x_j" ]
		// Need to add linear parts in booleanSSymbolic[startIndexOfF9 + offset] to xx[targetConstantIndexInxx]
		for(j = 1+8; j < 16+1; j++) {
			if(h[i][j]) {
				// The symbol x_j is present in h.
				// Find the corresponding equation in booleanSSymbolic
				int indexOfX_j = startIndexOfF9 + j - 9;
				for(k = 0; k < N; k++)
					xx[targetConstantIndexInxx][k+1] ^= booleanSSymbolic[indexOfX_j][k+1]; // Location of linear parts in xx and booleanSSymbolic
			}
		}
		
		// Check each symbol in h[i] (x1-x8)(x9-16), and if it is present add the corresponding answer from 
		// booleanSSymbolic[ "x_firstX" ] * booleanSSymbolic[ "x_secondX" ]
		// Need to add linear parts in booleanSSymbolic[startIndexOfF1 + offset] to xx[targetConstantIndexInxx], but 
		// only if the constant part in booleanSSymbolic[startIndexOfF9 + offset] is present.
		// The same is true the other way around too.
		
		// This performs lots of useless tests  like (x1 x2)
		for(firstX = 0; firstX < 16; firstX++)
		{
			for(secondX = firstX+1; secondX < 16; secondX++) {
				if(h[i][index_h]) {
					int indexOfX_firstX = startIndexOfF1 + firstX; // firstX will always be in the range of 0-7
					int indexOfX_secondX = startIndexOfF9 + secondX - 8; // secondX will always be in the range of 8-15
					
					// Find the constant parts
					uint8_t constantPartExistsF1 = booleanSSymbolic[indexOfX_firstX][0];
					uint8_t constantPartExistsF9 = booleanSSymbolic[indexOfX_secondX][0];
					if(constantPartExistsF1) {
						xx[targetConstantIndexInxx][1] ^= booleanSSymbolic[indexOfX_secondX][1];
					}
					if(constantPartExistsF9){
						xx[targetConstantIndexInxx][1] ^= booleanSSymbolic[indexOfX_firstX][1];
					}
					for(k = 1; k < N; k++) {
						// If constantPartExistsF1 == true, then we need to add the symbols from booleanSSymbolic[indexOfX_secondX] to xx
						if(constantPartExistsF1) {
							xx[targetConstantIndexInxx][k+1] ^= booleanSSymbolic[indexOfX_secondX][k+1];
						}
						
						// If constantPartExistsF9 == true, then we need to add the symbols from booleanSSymbolic[indexOfX_firstX] to xx
						if(constantPartExistsF9) {
							xx[targetConstantIndexInxx][k+1] ^= booleanSSymbolic[indexOfX_firstX][k+1];
						}
					}
					
					// Find the quadratic parts k == k
					for(k = 0; k < N; k++) {
						// If constantPartExistsF1 == true, then we need to add the symbols from booleanSSymbolic[indexOfX_secondX] to xx
						uint8_t product = booleanSSymbolic[indexOfX_firstX][k+1] & booleanSSymbolic[indexOfX_secondX][k+1];
						xx[targetConstantIndexInxx][k+1] ^= product;
					}
				}
				index_h++;
			}
		}
	}
}

// Quadratic symbolics part only in C: booleanSSymbolic * h1
// Perform the multiplication between booleanSSymbolic and h1.
// Quadratic part only (excluding quadratic terms of the from 'x[i] x[i]'), the constant and linear terms are not touched.
static void findQuadraticSymbolics( uint8_t h[8][137], uint8_t booleanSSymbolic[N][N+1], 
									uint_sigma_calc startIndexOfF1, uint_sigma_calc startIndexOfF9, 
									uint8_t xx[N][SYMBOLIC_NN_SIZE], int targetIndexInxx)
{
	uint_fast8_t i;
	int j, k;
	for(i = 0; i < 8; i++) {
		int targetConstantIndexInxx = targetIndexInxx + i;
		
		uint_fast8_t firstX;
		uint_fast8_t secondX;
		int index_h = 16+1; // The first quadratic expresion in h
		// This performs lots of useless tests, like (x1 x2)
		for(firstX = 0; firstX < 16; firstX++)
		{
			for(secondX = firstX+1; secondX < 16; secondX++) {
				
				if(h[i][index_h]) {

					int indexOfX_firstX = startIndexOfF1 + firstX; // firstX will always be in the range of 0-7
					int indexOfX_secondX = startIndexOfF9 + secondX - 8; // secondX will always be in the range of 8-15

					// Find the quadratic parts k != k
					int index_qe1 = N+1; // The first quadratic expression in xx
					int index_qe2 = N+1; // The first quadratic expression in xx
					
					for(j = 0; j < N; j++)
					{
						if( booleanSSymbolic[indexOfX_firstX][j+1]) {
							for(k = j+1; k < N; k++) {
								xx[targetConstantIndexInxx][index_qe1] ^= booleanSSymbolic[indexOfX_secondX][k+1];
								index_qe1++;
							}
						} 
						else
							index_qe1 += N-j-1;

						if( booleanSSymbolic[indexOfX_secondX][j+1]) {
							for(k = j+1; k < N; k++) {
								xx[targetConstantIndexInxx][index_qe2] ^= booleanSSymbolic[indexOfX_firstX][k+1];
								index_qe2++;
							}
						}
						index_qe2 = index_qe1;
					}
				}
				index_h++;
			}
		}
	}
}


// Multiplication of booleanS (not symbolic) and xx (symbolic).
// Creates xxFinale (symbolic).
static void multiplyBooleanSXX(	uint8_t booleanS[N][N], uint8_t xx[N][SYMBOLIC_NN_SIZE], uint8_t xxFinale[N][SYMBOLIC_NN_SIZE])
{
	// Now, multiply xx with booleanS (not symbolic) and make xxFinale
	// This version reduces the number of operations needed, simplifies the later packed format version, and might be more cache friendly.
	int i, j, k, tile_j, tile_j_end;
	uint8_t booleanSTranspose[N][N];
	
	// Transpose booleanS, so that the access patterns becomes cache friendly in the multiply.
	for(i = 0; i < N; i++)
		for(j = 0; j < N; j++)
			booleanSTranspose[i][j] = booleanS[j][i];
	
	// Uses basic loop tiling for L2 cache, slightly more efficient.
	// Skip the parts that is not needed in the Public-key.
	for(tile_j = 0; tile_j < SYMBOLIC_NN_SIZE; tile_j += 2048-16) {
		tile_j_end = min(tile_j + 2048-16, SYMBOLIC_NN_SIZE);
		for(i = PUBLICKEY_FIRST_ROW; i < PUBLICKEY_LAST_ROW ; i++) {
			for(k = 0; k < N; k++) {
				if(booleanSTranspose[k][i]) {
					for(j = tile_j; j < tile_j_end; j++) {
						xxFinale[i][j] ^= xx[k][j];
					}
				}
			}
		}
	}


	// This is the base version of the multiply.
	/*
	for(i = 0; i < N; i++) {
		for(j = 0; j < SYMBOLIC_NN_SIZE; j++) {
			for(k = 0; k < N; k++) {
				xxFinale[i][j] ^= booleanS[i][k] & xx[k][j];
			}
		}
	}
	*/
}

#if PRIVATE_KEY_LOOKUP_TABLES == 1
extern int buildTable(uint8_t *privateKey, uint8_t mqq_a__[9*8], uint8_t cc1__[9], uint8_t cc2__[9]);
extern uint8_t lookup_table_private_key[256*256*2];
#endif

// Save Private key
static int savePrivateKey(uint_sigma mqq_sigma1__[N], uint_sigma mqq_sigmaK__[N], uint8_t h1[8][137], unsigned char *sk)
{
	/* 
	This is the private key of MQQ defined by one 
	quadratic quasigroup of order 2^8 given as 81 uint8_t
	and one nonsingular matrix SInv given as two arrays 
	sigma1[] and sigmaK[] of N uint8_t.
	*/
	
	// cc1 and cc2 are linear symbolic vectors with a constant and 8 elements (x0-x7 and x8-x15).
	uint8_t cc1[8][9];
	uint8_t cc2[8][9];
	// mqq_a1 is a linear symbolic matrix with a constant and 8 elements (x0-x7 or x8-x15).
	uint8_t mqq_a1[8][8][9];
	int i, j, k;
	
	// cc1_bin and cc2_bin are bit packed version of cc1 and cc2.
	uint8_t cc1_bin[9];
	uint8_t cc2_bin[9];
	// mqq_a1_bin is a bit packed version of mqq_a1.
	uint8_t mqq_a1_bin[8][9];
	
	// Clear cc1 and cc2
	for(i = 0; i < 8; i++)
		for(j = 0; j < 9; j++)
			cc1[i][j] = cc2[i][j] = 0;
	
	// Clear mqq_a
	for(i = 0; i < 8; i++)
		for(j = 0; j < 8; j++)
			for(k = 0; k < 9; k++)
				mqq_a1[i][j][k] = 0;
	
	// The idea is that mqq_a1 * [x0, x1, x2 ... x7] + cc1  =  h1
	// That is, mqq_a1 contains the linear x0-x7 elements and the quadratic elements of h1.
	// cc1 contains the constants and linear x8-x15 elements of h1.
	// cc2 contains the constants and linear x0-x7 elements of h1.
	
	// Set the constant elements in cc1 and cc2
	for(i = 0; i < 8; i++)
	{
		cc1[i][0] = h1[i][0];
		cc2[i][0] = h1[i][0];
	}
	
	// Set the linear elements in cc1 and cc2
	for(i = 0; i < 8; i++)
		for(j = 0; j < 8; j++)
		{
			cc1[i][1+j] = h1[i][1+8+j]; // x8-15 from h1
			cc2[i][1+j] = h1[i][1+j];   // x0-x7 from h1 
		}
	
	// Set the constant elements in mqq_a1
	for(i = 0; i < 8; i++)
		for(j = 0; j < 8; j++)
			mqq_a1[i][j][0] = h1[i][1+8+j]; // x8-x15 from h1
	
	// Set the linear elements in mqq_a1
	for(i = 0; i < 8; i++)
		for(j = 0; j < 8; j++) // Iterate over the x0-x7 componetns in the quadratic terms
			for(k = 0; k < 8; k++) // Iterate over the x8-x15 componetns in the quadratic terms
			{
				int indexOfSymbolicQuadrat;
				indexOfSymbolicQuadrat = 16 - (-29 +j)*j/2 +k+8;
				
				mqq_a1[i][j][1+k] = h1[i][indexOfSymbolicQuadrat];
			}
	
	for(i = 0; i < 9; i++)
	{
		cc1_bin[i] = 0;
		cc2_bin[i] = 0;
	}
	
	for(i = 0; i < 8; i++)
		for(j = 0; j < 9; j++)
			mqq_a1_bin[i][j] = 0;
	
	// Create the cc1 in the binary format (cc1_bin)
	for(i = 0; i < 8; i++)
	{
		for(j = 0; j < 8; j++)
			if(cc1[i][j+1])
				cc1_bin[j] ^= 0x80 >> i;
		if(cc1[i][0])
			cc1_bin[8] ^= 0x80 >> (i&0x07);
	}
	// Create the cc2 in the binary format (cc2_bin)
	for(i = 0; i < 8; i++)
	{
		for(j = 0; j < 8; j++)
			if(cc2[i][j+1])
				cc2_bin[j] ^= 0x80 >> i;
		if(cc2[i][0])
			cc2_bin[8] ^= 0x80 >> (i&0x07);
	}
	
	// Create the mqq_a1 in the binary format (mqq_a1_bin)
	for(k = 0; k < 8; k++)
		for(i = 0; i < 8; i++)
		{
			for(j = 0; j < 8; j++)
				if(mqq_a1[k][i][j+1])
					mqq_a1_bin[j][i] ^= 0x80 >> k;
			if(mqq_a1[k][i][0])
				mqq_a1_bin[i][8] ^= 0x80 >> (k&0x07);
		}
	
	if(sk == NULL)
	{
		return -1;
	}
	else
	{
		// Write the private key to the storage in pointer sk
		uint8_t *privatekey = sk;
		memcpy(privatekey, mqq_a1_bin, sizeof(mqq_a1_bin));
		privatekey += sizeof(mqq_a1_bin);
		memcpy(privatekey, cc2_bin, sizeof(cc2_bin));
		privatekey += sizeof(cc2_bin);
		memcpy(privatekey, mqq_sigma1__, sizeof(uint_sigma) * N);
		privatekey += sizeof(uint_sigma) * N;
		memcpy(privatekey, mqq_sigmaK__, sizeof(uint_sigma) * N);
		
		#if PRIVATE_KEY_LOOKUP_TABLES == 1
		privatekey += sizeof(uint_sigma) * N;
		buildTable(lookup_table_private_key, (uint8_t *) mqq_a1_bin,cc1_bin, cc2_bin);
		#else
		
		#endif

		
		return 0;
	}
}

/* -----------------------------------------    ----------------------------------------*/


int crypto_sign_keypair(unsigned char* pk, unsigned char *sk)
{
	// ------------------------------ Table initialization start -----------------------------------
	// 
	uint_sigma_calc sigma1[N];
	uint_sigma_calc sigmaK[N];
	
	uint_sigma_calc Candidate[N][N/8 + 3];
	
	uint8_t booleanSInverse[N][N];
	uint8_t booleanS[N][N]; // Init to Identity matrix
	
	// We will keep the values of the public key in xx and xxFinale
	// Both xx and xxFinale are our internal variables
	uint8_t (*xx)[SYMBOLIC_NN_SIZE] = (uint8_t (*)[SYMBOLIC_NN_SIZE]) calloc(N * SYMBOLIC_NN_SIZE, sizeof(uint8_t));
	uint8_t (*xxFinale)[SYMBOLIC_NN_SIZE] = (uint8_t (*)[SYMBOLIC_NN_SIZE]) calloc(N * SYMBOLIC_NN_SIZE, sizeof(uint8_t));
	
	int i, j;
	
	// Use the current time as a seed for the random genrator
	int seed = (int) time(NULL);

	srandomNum(seed);

	// ------------------------------ Table initialization end -------------------------------------
		

	// ------------------------------ booleanS construction start -------------------
	int_fast8_t det;
	int k;
	for(i = 0; i < N; i++)
	{
		sigma1[i] = sigmaK[i] = i;
	}
	do { // This loop runs over (det == 0)
		// Initialize sigma1 with values from 1 to N.
		randomPermutation_int(sigma1, N);
		randomPermutation_int(sigmaK, N);

		int makesigmaK = 0;
		for(i = 0; i < N; i++)
		{
			for(j=0; j<=N/16; j++) Candidate[i][j] = sigma1[(i+j*8)%N];
			for(j=0; j<=N/16+1; j++) Candidate[i][N/16 + j + 1] = sigmaK[(i+j*8)%N];
		}
		
		// Now check if the determinant is 1
		for(i = 0; i < N; i++)
		{
			for(j = 0; j < N; j++) {
				booleanSInverse[i][j] = 0;
				booleanS[i][j] = 0;
				if(i == j) 
					booleanS[i][j] = 1; // Initialize to Identity matrix
			}
		}
		
		// Make a 1 in booleanSInverse from each of the locations in Candidate
		for(i = 0; i < N; i++)
		{
			for(j = 0; j < N/8 + 3; j++) {
				booleanSInverse[i][Candidate[i][j]] ^= 1;
			}
		}
		

		// Check if the determinant of Sinverse is 0 or 1.
		// If it is 0 then a new sigmaK must be generated.
		// When the determinant is 1 the lower left triangle is already completed.
		det = 1;
		for(i = 0; i < N; i++)
		{
			// i is the row index to where we need to make booleanSInverse[i][i]==1

			int swapped = -1;
			for(j = i; j < N; j++) {
				// Perform swap?
				if(booleanSInverse[j][i] && swapped == -1) {
				
					for(k = 0; k < N; k++) {
						uint8_t temp = booleanSInverse[i][k];
						booleanSInverse[i][k] = booleanSInverse[j][k];
						booleanSInverse[j][k] = temp;
					
						// Make the inverse too
						temp = booleanS[i][k];
						booleanS[i][k] = booleanS[j][k];
						booleanS[j][k] = temp;
					}
					swapped = j;
				} else if(booleanSInverse[j][i] && swapped != -1) {
					// Need to substract (xor) booleanSInverse[i] from booleanSInverse[j]
					for(k = 0; k < N; k++) {
						booleanSInverse[j][k] ^= booleanSInverse[i][k];
						booleanS[j][k] ^= booleanS[i][k];
					}
				}
			}
			if(swapped == -1) {
				det = 0;
				break;
			}
		}
	
		// End the loop generating a Candidate (sigma1 and sigmaK) that makes Sinverse invertible (det == 1).
	} while(det == 0);

	// Assume that det is 1.
	// booleanSInverse contains 0 in the lower left triangle now, need to do change it to the identity matrix (and duplicate the operations on booleanS).
	for(i = 0; i < N; i++)
	{
		for(j = 0; j < i; j++) {
			// Perform swap?
			if(booleanSInverse[j][i]) {
				// Need to substract (xor) booleanSInverse[j] from booleanSInverse[i]
				for(k = 0; k < N; k++) {
					booleanSInverse[j][k] ^= booleanSInverse[i][k];
					booleanS[j][k] ^= booleanS[i][k];
				}
			}
		}
	}
	
	// ------------------------------ booleanS construction end ---------------------
	
	
	
	// ------------------------------ Function h1 construction start -------------------------------
	// h1 is the quasigrup operation * in the description of the algorithm

	// This is the h1 transform function:
	// The format is:
	// index 0:    constant 
	// index 1-16: linear components x1-x16
	// index 17-136: quadratic components x1x2, x1x3, ... x1x16, x2x3, x2x4, ... x15x16
	// Although the secret quasigroup needs 81 bytes, internaly we will work with structure that has all posible
	// combinations: 137 = 1 + 16 + (16*16-16)/2
	uint8_t h1[8][137];
	uint8_t A1BTX2PX1BPCLin[8][137]; 
	int_fast8_t matrixRank = 0;
	
	// Search until the rank requirement of h1 is satisfied.
	uint_fast8_t max_rank_in_h1 = 0; 
	uint_fast8_t count_min_rank_once_in_h1 = 0;

	int iterations = 0;
	do
	{
		iterations++;
		if(iterations % 64 == 0) {
			// This situation should never occur if the PRNG is a good one.
			//iterations = 0;
			//seed = (int) time(NULL);
			srandomNum(seed + iterations);
		}
		// Need to make 8 matrices of size 8*8, containing random Boolean values.
		// The lower left triangle (diagonal included) is always zero.
		// U are denoted as U_i in the description of the algorithm
		uint8_t U[8][8][8];
	
		// Clear U
		for(i = 0; i < 8; i++)
			for(j = 0; j < 8; j++)
				for(k = 0; k < 8; k++)
					U[i][j][k] = 0;

		// Iterate over the U.
		for(i = 0; i < 8; i++)
		{
			// Iterate over rows.
			for(j = 0; j < i; j++) {
				// Start just after the diagonal (j+1), and assign random values to each element.
				for(k = j+1; k < 8; k++) {
					// Assign a random value
					U[i][j][k] = randomNum() & 0x01;
				}
			}
		}
	
		// Make 3 random 8x8 boolean non-singular matrices (determinant == 1).
		uint8_t B[8][8];
		uint8_t A1[8][8];
		uint8_t A2[8][8];
	
		makeNonSingularMatrix8x8(B);
		makeNonSingularMatrix8x8(A1);
		makeNonSingularMatrix8x8(A2);
			
		// Need to perform symbolic multiplication between U and X1Lin.
		uint8_t A1BLin[8][8][8+1];
		// Clear A1BLin.
		for(i = 0; i < 8; i++)
			for(j = 0; j < 8; j++)
				for(k = 0; k < 9; k++)
					A1BLin[i][j][k] = 0;
	
		uint8_t A1BLinTemp[8][8][8+1];
		// Clear A1BLinTemp.
		for(i = 0; i < 8; i++)
			for(j = 0; j < 8; j++)
				for(k = 0; k < 9; k++)
					A1BLinTemp[i][j][k] = 0;
	
		int_fast8_t matrixIndex;
		// Iterate over each matrix in U.
		// Perform symbolic multiplication between U and X1Lin (x[1] - x[8])
		for(matrixIndex = 0; matrixIndex < 8; matrixIndex++) {
		
			// Make a clean temporary matrix
			uint8_t nonTransposedA1BLinTemp[8][8+1];
			for(i = 0; i < 8; i++)
				for(j = 0; j < 9; j++)
					nonTransposedA1BLinTemp[i][j] = 0;
		
			// Perform symbolic multiplication between one matrix from U and 
			// X1Lin (A1) (x[1] - x[8])
			for(i = 0; i < 8; i++) {
				// Iterate over rows.
				for(j = 0; j < 8; j++) {
					for(k = 0; k < 8; k++) {
						nonTransposedA1BLinTemp[i][j+1] ^= U[matrixIndex][i][k] & A1[k][j];
					}
				}
			}
			
			nonTransposedA1BLinTemp[matrixIndex][0] = 1;
		
			// Write transpose of nonTransposedA1BLinTemp into A1BLinTemp[matrixIndex].
			for(i = 0; i < 8; i++)
				for(j = 0; j < 9; j++)
					A1BLinTemp[i][matrixIndex][j] = nonTransposedA1BLinTemp[i][j];
		}

		// Multiply B by A1BLinTemp. A1BLinTemp is an matrix of symbolic expressions.
		for(matrixIndex = 0; matrixIndex < 8; matrixIndex++) {
			for(i = 0; i < 8; i++) {
				// Iterate over rows.
				for(k = 0; k < 8; k++) {
					// Each element in the A1BLin matrix are symbolic expressions, so the values of B are multiplied with the entire symbolic vectors
					if(B[matrixIndex][k])
						for(j = 0; j < 8+1; j++)
							A1BLin[matrixIndex][i][j] ^= A1BLinTemp[k][i][j];
				}
			}
		}

		// Make a random Boolean array.
		uint8_t con[8]; // con is the vector c in the documentation
		for(i = 0; i < 8; i++)
			con[i] = randomNum() & 0x01;
		
		// Make a symbolic vector BX1PConLin.
		uint8_t BX1PConLin[8][8+1];
		for(i = 0; i < 8; i++)
			for(j = 0; j < 9; j++)
				 BX1PConLin[i][j] = 0;
		
		// Multiply B by X1Lin symbolically, using A1 directly.
		// The constant part from Con can be added directly, as there is no overlap.
		for(i = 0; i < 8; i++){
			BX1PConLin[i][0] = con[i];
			for(j = 0; j < 8; j++)
				for(k = 0; k < 8; k++) 
					BX1PConLin[i][j+1] ^= B[i][k] & A1[k][j];
		}
	
		// Clear A1BTX2PX1BPCLin.
		for(i = 0; i < 8; i++)
			for(j = 0; j < 137; j++)
				A1BTX2PX1BPCLin[i][j] = 0;
	
		
		// Perform the linear part x9-x16 
		for(i = 0; i < 8; i++) // Iterate over the vectors in A1BTX2PX1BPCLin
			for(j = 0; j < 8; j++)
				for(k = 0; k < 8; k++) 
					A1BTX2PX1BPCLin[i][1+8+j] ^= A1BLin[i][k][0] & A2[k][j];
	
	
		int_fast8_t firstX;
		int_fast8_t secondX;
		uint_fast8_t index_h;
		// perform the quadratic part x1x9, x1x10, ... x1x16, x2x3
		for(i = 0; i < 8; i++) { // Iterate over the vectors in A1BTX2PX1BPCLin
			index_h = 16+1; // The index of the first quadratic expression in A1BTX2PX1BPCLin
			for(firstX = 0; firstX < 16; firstX++) {
				for(secondX = firstX+1; secondX < 16; secondX++) {
				
					// Only work with x1 - x8 from A1BLin, and only x9 - x16 from X2Lin
					if(firstX < 8 && secondX >= 8)
					{
						uint8_t product = 0;
						for(k = 0; k < 8; k++) 
							product ^= A1BLin[i][k][1 + firstX] & A2[k][secondX -8];
						// Note that it is not xor'ed, as there is no overlap.
						A1BTX2PX1BPCLin[i][index_h] = product;
					}
					index_h++;
				}
			}
		}
		// A1BLin.X2Lin + BX1PConLin
	
		for(i = 0; i < 8; i++) // Iterate over the vectors in A1BTX2PX1BPCLin
			for(j = 0; j < 9; j++) {
				// Note that it is not xor'ed, as there is no overlap from the A1BLin.X2Lin part.
				A1BTX2PX1BPCLin[i][j] = BX1PConLin[i][j];
			}
		
		// Now test the rank of A1BTX2PX1BPCLin, by trying to invert A1BTX2PX1BPCLinSymmetric.
		// The rank(s) are found by counting the rows that contained only 0's during inversion.
		uint8_t A1BTX2PX1BPCLinSymmetric[8*2][8*2];
		
		uint_fast8_t rowsInA1BTX2PX1BPCLin;
		for(rowsInA1BTX2PX1BPCLin = 0; rowsInA1BTX2PX1BPCLin < 8; rowsInA1BTX2PX1BPCLin++)
		{
			
			// Clear the matrix
			for(i = 0; i < 8*2; i++)
				for(j = 0; j < 8*2; j++)
					A1BTX2PX1BPCLinSymmetric[i][j] = 0;
		
			// Fill A1BTX2PX1BPCLinSymmetric with the quadratic components from A1BTX2PX1BPCLin.
			i = rowsInA1BTX2PX1BPCLin;
			index_h = 16+1; // The index of the first quadratic expression in A1BTX2PX1BPCLin
			for(firstX = 0; firstX < 16; firstX++) {
				for(secondX = firstX+1; secondX < 16; secondX++) {
					// It is symmetric, so set [i][j] = [j][i].
					A1BTX2PX1BPCLinSymmetric[firstX][secondX] ^= A1BTX2PX1BPCLin[i][index_h];
					A1BTX2PX1BPCLinSymmetric[secondX][firstX] ^= A1BTX2PX1BPCLin[i][index_h];
					index_h++;
				}
			}
		
			// Check the rank of A1BTX2PX1BPCLinSymmetric:
			matrixRank = 0; 
			for(i = 0; i < 8*2; i++)
			{
				// i is the row index to where we need to make A1BTX2PX1BPCLinSymmetric[i][i]==1

				int_fast8_t swapped = -1;
				for(j = i; j < 8*2; j++) {
					// Perform swap?
					if(A1BTX2PX1BPCLinSymmetric[j][i] && swapped == -1) {
				
						for(k = 0; k < 8*2; k++) {
							uint8_t temp = A1BTX2PX1BPCLinSymmetric[i][k];
							A1BTX2PX1BPCLinSymmetric[i][k] = A1BTX2PX1BPCLinSymmetric[j][k];
							A1BTX2PX1BPCLinSymmetric[j][k] = temp;
					
						}
						swapped = j;
					} else if(A1BTX2PX1BPCLinSymmetric[j][i] && swapped != -1) {
						// Need to substract (xor) A1BTX2PX1BPCLinSymmetric[i] from A1BTX2PX1BPCLinSymmetric[j]
						for(k = 0; k < 8*2; k++) {
							A1BTX2PX1BPCLinSymmetric[j][k] ^= A1BTX2PX1BPCLinSymmetric[i][k];
						}
					}
				}
				
				if(swapped == -1) {
					// A rank of 16 is not possible.
				} else
					matrixRank++; // Count the rank.
			}
			
			// Keep track of the best rank.
			if(matrixRank > max_rank_in_h1)
				max_rank_in_h1 = matrixRank;
			
			// Count the number of ranks that satisfy the second rank requirement.	
			if(matrixRank >= MIN_RANK_ONCE_QUASIGROUP)
				count_min_rank_once_in_h1++;
			
			// Restart if its impossible that count will match rank requirements.
			if(7-rowsInA1BTX2PX1BPCLin + count_min_rank_once_in_h1 < MIN_RANK_ONCE_QUASIGROUP_COUNT)
			{
				max_rank_in_h1 = 0;
				count_min_rank_once_in_h1 = 0;
				break;
			}
			
			// Make sure that this rank is within the good range, if not remake.
			if(matrixRank < MIN_RANK_QUASIGROUP || matrixRank > MAX_RANK_QUASIGROUP)
			{

				max_rank_in_h1 = 0;
				count_min_rank_once_in_h1 = 0;
				break;
			}
		}
		
		// Make sure there is at least one rank 14 (or bigger than the MIN_RANK_QUASIGROUP requirement).
	} while(max_rank_in_h1 <  MIN_RANK_ONCE_QUASIGROUP);
	// And h1 = A1BTX2PX1BPCLin is done *)
	// h1 is the quasigroup saved into the Private-key.
	for(i = 0; i < 8; i++) 
		for(j = 0; j < 137; j++) 
			h1[i][j] = A1BTX2PX1BPCLin[i][j];

	// This is only needed for N==256, but is performed always for simplicity in the code.
	// Move data from 16 bit to 8 bit variables (N==256).
	uint_sigma sigma1_Nbit[N];
	uint_sigma sigmaK_Nbit[N];
	for(i = 0; i < N; i++)
	{
		sigma1_Nbit[i] = sigma1[i];
		sigmaK_Nbit[i]= sigmaK[i];
	}
	
	// Save all the Private-key data: sigma1, sigmaK and h1.
	savePrivateKey(sigma1_Nbit, sigmaK_Nbit, h1, sk);

	// ------------------------------ Function h1 construction end ---------------------------------
	
	
	
	// ------------------------------ Public key construction start --------------------------------
	// Now get the "random" N/8 bytes v, to be used as the N constant additions.
	uint8_t v[N];
	
	for(i = 0; i < N/8; i++)
	{
		// Make an 8 bit value from the bits in two elements from sigmaK
		uint8_t random4BitsHigh = sigmaK[i] & 0x0f; // Take the 4 lowest bits
		random4BitsHigh = random4BitsHigh << 4; // Move them to the upper 4 places
		#if N >= (64+N/8)
		// Take the bits from an element 64 positions later in sigmaK.
		// The condition (11) in the Technical Description Paper
		uint8_t random4BitsLow = sigmaK[64 + i];
		#else
		// Take the bits from an element a bit later positions later in sigmaK.
		// This is a hack for low values of N, for debugging of MQQ.
		uint8_t random4BitsLow = sigmaK[N/2 + i];
		#endif
		uint8_t randomBitsFromsigmaK = random4BitsHigh ^ random4BitsLow; // Merge them.
		
		// Insert each bit in randomBitsFromsigmaK into a diffrent location in v
		// TODO: Check/verify the overall randomness 
		for(j = 0; j < 8; j++)
			v[i*8 + j] = (randomBitsFromsigmaK >> (7-j)) & 0x01;
	}
	
	// Need a symbolic version of booleanS: booleanSSymbolic 
	// booleanSSymbolic starts with the constant from v, and then contains symbols in the range x[0] - x[N-1]
	// S' in the documentation
	uint8_t booleanSSymbolic[N][N+1];
	for(i = 0; i < N; i++) {
		booleanSSymbolic[i][0] = v[i];
		for(j = 0; j < N; j++) {
			booleanSSymbolic[i][j+1] = booleanS[i][j];
		}
	}
	
	// Start the production of the public key
	// First 8 expressions are linear and copied directly
	copyFirst8Symbolic(booleanSSymbolic, xx);
	
	// Create the rest of the symbolic qudratic expressions stored in xx
	for(i = 1; i < (N/8); i++)
	{
		uint_sigma_calc inputF1 = 8*(i -1);
		uint_sigma_calc inputF9 = 8*i;
		if(i%2 == 0) {
			inputF1 = 8*i;
			inputF9 = 8*(i -1);
		}
		
		// Create the symbolic xx
		// It's done in 3 stages:
		// First the constants, then the linear parts and finally the quadratic parts.
		// This staging exists mainly for debugging.
		// xx will receive values that correspond to the operations P' from the documantation 
		findConstants(h1, booleanSSymbolic, inputF1, inputF9, xx, 8*i);
		findLinearSymbolics(h1, booleanSSymbolic, inputF1, inputF9, xx, 8*i);
		findQuadraticSymbolics(h1, booleanSSymbolic, inputF1, inputF9, xx, 8*i);
	}
	
	// Now, multiply xx with booleanS (not symbolic) and make xxFinale
	multiplyBooleanSXX(booleanS, xx, xxFinale);
	
	
	// ------------------------------ Public key construction end ----------------------------------
	
	free(xx);
	savePublicKey(xxFinale, pk);
	free(xxFinale);
	
	return 0;
}
