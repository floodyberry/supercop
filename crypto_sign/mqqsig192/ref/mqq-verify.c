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
 * \file mqq-verify.c
 * \author Rune E. Jensen and Danilo Gligoroski 
 * \license GPLv3 or later
 *
 */
/*
	MQQ reference verify (non-clean).
	Programed by Rune E. Jensen December 2010
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ctype.h>
#include "mqqsig.h"

#if MQQ_SUPERCOP_BUILD == 1
#include "crypto_hash_sha512.h"
#include "crypto_sign.h"
#endif

//#include "rdtsc.h"
#ifdef __SSE2__
#include <emmintrin.h>
#endif

int verify(const uint8_t Signature[N/8], const uint8_t publicKey[PUBLICKEY_SIZE_L][PUBLICKEY_SIZE_S], uint8_t hash[PUBLICKEY_SIZE_S])
{
	uint_fast8_t i;
	#if N < 360
	uint_fast16_t index_publicKey = 0;
	#else
	uint_fast32_t index_publicKey = 0;
	#endif

	#if N < 256
	uint8_t k;
	#else
	uint16_t k;
	#endif
	
	#if N < 256
	uint_fast8_t firstX;
	uint_fast8_t secondX;
	#else
	uint_fast16_t firstX;
	uint_fast16_t secondX;
	#endif

	// The xor of the constant part:
	#if ((PUBLICKEY_SIZE_S<16) || PUBLICKEY_SIZE_S>32 || !(__SSSE3__))
	for(i = 0; i < PUBLICKEY_SIZE_S; i++) {
		hash[i] = publicKey[index_publicKey][i];
	}
	#elif ( PUBLICKEY_SIZE_S==16)
	__m128i enc_bytes00_15 = _mm_load_si128((const __m128i *) &publicKey[index_publicKey][ 0]); // Load a set of input_bytes values
	#else
	__m128i enc_bytes00_15 = _mm_loadu_si128((const __m128i *) &publicKey[index_publicKey][ 0]); // Load a set of input_bytes values
	__m128i enc_bytes16_31 = _mm_loadu_si128((const __m128i *) &publicKey[index_publicKey][16]); // Load a set of input_bytes values (TODO: loads too much!!)
	#endif


	index_publicKey++;
	
	// The xor of the linear part:
	for(k = 0; k < N; k++) {
		uint8_t byteindex = k>>3;
		uint8_t bitindex = 0x80 >> (k&0x07);

		if (Signature[byteindex] & bitindex) {
			
			#if ((PUBLICKEY_SIZE_S<16) || PUBLICKEY_SIZE_S>32 || !(__SSSE3__))
			for(i = 0; i < PUBLICKEY_SIZE_S; i++)
				hash[i] ^= publicKey[index_publicKey][i];
			#elif ( PUBLICKEY_SIZE_S==16)
			enc_bytes00_15 = _mm_xor_si128(_mm_load_si128((const __m128i *) &publicKey[index_publicKey][ 0]), enc_bytes00_15);
			#else
			enc_bytes00_15 = _mm_xor_si128(_mm_loadu_si128((const __m128i *) &publicKey[index_publicKey][ 0]), enc_bytes00_15);
			enc_bytes16_31 = _mm_xor_si128(_mm_loadu_si128((const __m128i *) &publicKey[index_publicKey][16]), enc_bytes16_31);
			#endif		
		}
		index_publicKey++;
	}
	
	// TODO: Basic optimization!!
	for(firstX = 0; firstX < N; firstX++)
	{
		uint8_t byteindex_firstX = firstX>>3;
		uint8_t bitindex_firstX = 0x80 >> (firstX&0x07);
		if(Signature[byteindex_firstX] & bitindex_firstX) {
			for(secondX = firstX+1; secondX < N; secondX++) {
			
				//uint_fast16_t indexOfSymbolicQuadrat = index_publicKey;			
				uint8_t byteindex_secondX = secondX>>3;
				uint8_t bitindex_secondX = 0x80 >> (secondX&0x07);
			
				// The xor:
				if(Signature[byteindex_secondX] & bitindex_secondX) {
					
					#if ((PUBLICKEY_SIZE_S<16) || PUBLICKEY_SIZE_S>32 || !(__SSSE3__))
					for(i = 0; i < PUBLICKEY_SIZE_S; i++)
						hash[i] ^= publicKey[index_publicKey][i];
					#elif ( PUBLICKEY_SIZE_S==16)
					enc_bytes00_15 = _mm_xor_si128(_mm_load_si128((const __m128i *) &publicKey[index_publicKey][ 0]), enc_bytes00_15);
					#else
					enc_bytes00_15 = _mm_xor_si128(_mm_loadu_si128((const __m128i *) &publicKey[index_publicKey][ 0]), enc_bytes00_15);
					enc_bytes16_31 = _mm_xor_si128(_mm_loadu_si128((const __m128i *) &publicKey[index_publicKey][16]), enc_bytes16_31);
					#endif	


				}

				index_publicKey++;
			}
		}
		else
			index_publicKey += N - firstX-1;
		
	}
	#if ((PUBLICKEY_SIZE_S<16) || PUBLICKEY_SIZE_S>32 || !(__SSSE3__))
	
	#elif ( PUBLICKEY_SIZE_S==16)
	_mm_store_si128((__m128i *) &hash[0], enc_bytes00_15);
	#else
	_mm_store_si128((__m128i *) &hash[0], enc_bytes00_15);
	_mm_store_si128((__m128i *) &hash[16], enc_bytes16_31);
	#endif	

	return 0;
}

int crypto_sign_open(
unsigned char *m,unsigned long long *mlen,
const unsigned char *sm,unsigned long long smlen,
const unsigned char *pk
)
{
	uint8_t __attribute__ ((aligned (16))) hash[512/8];
	uint8_t __attribute__ ((aligned (16))) result[512/8];
	
	// Get the hash of the message:
	#if MQQ_SUPERCOP_BUILD == 1
	crypto_hash_sha512(hash, sm+N/8, smlen-N/8);
	#else
	memcpy(hash, sm+N/8, N/8);
	#endif
	
	// Make a signature of the hash, using the key sk:
	verify(sm, (const uint8_t (*)[PUBLICKEY_SIZE_S]) pk, result);
	
	// Check if the signature is good, -100 is returned if its not.
	if(memcmp(result, hash+PUBLICKEY_FIRST_ROW/8, PUBLICKEY_ROWS_TO_STORE/8) != 0)
	{
		#if MQQ_SUPERCOP_BUILD == 0
		int i;
		printf("\nHash.of.message.(correct):");
		for(i=0; i<256/8; i++){
			printf("%02X.", hash[i]);
		}
		
		printf("\nSignature.verify.(result):");
		for(i=0; i<PUBLICKEY_SIZE_S; i++){
			printf("%02X.", result[i]);
		}
		printf("\n");
		#endif
		
		return -100;
	}
	// Copy the signed message sm into m:
	memcpy(m, sm+N/8, smlen-N/8);
	
	// Update mlen:
	*mlen = smlen-N/8;

	return 0;
}
