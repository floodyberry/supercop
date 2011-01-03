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
 * \file mqq-sign.c
 * \author Rune E. Jensen and Danilo Gligoroski 
 * \license GPLv3 or later
 *
 */

/* 
   C code for MQQ-SIGN
   
   History of this code:
   Programmed by 
   Danilo Gligoroski, Rune E. Jensen and Daniel Otte
   March 2010.

   Verified by Danilo Gligoroski
   March 2010.
   
   Tuned and optimized (supercop version) by Rune E. Jensen
   June 2010.
   
   Table look-up code added and verified by Rune E. Jensen
   September 2010
   
   Added more SSE code and additional performance improvements by Rune E. Jensen
   December 2010
   
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "mqqsig.h"

#if MQQ_SUPERCOP_BUILD == 1
#include "crypto_hash_sha512.h"
#include "crypto_sign.h"
#endif

//#include <stdint.h>
//#ifdef _MSC_VER
//   #include "stdint.h"
//#else
//   #include <stdint.h>
//#endif 

#ifdef __SSSE3__
#include <tmmintrin.h>
#elif defined __SSE2__
#include <emmintrin.h>
#endif

void memxor(void* dest, const void* src, uint16_t length){
	while(length--){
		*((uint8_t*)dest) ^= *((uint8_t*)src);
		dest = (uint8_t*)dest +1;
		src  = (uint8_t*)src  +1;

	}
}

void memxor_idx(uint8_t* dest, uint8_t* src, uint16_t length, uint8_t dist){
	uint8_t a, b;
	while(length--){
		a = *dest;
		b = *src;
		a ^= b;
		*dest = a;
		// *((uint8_t*)dest) ^= *((uint8_t*)src);
		dest = (uint8_t*)dest + 1;
		src  = (uint8_t*)src  + dist;
	}
}

static void InverseAffineTransformation(uint8_t *input_bytes, uint8_t result[N/8], uint8_t second_call)
{
	/* The matrix SInv is given as two permutations of N elements. */
	uint8_t i, byteindex;
	#if !((N>=128 && N<=256))
	uint8_t __attribute__ ((aligned (16))) rp1[N/8], rpK[N/8];
	#else
	uint8_t __attribute__ ((aligned (16))) rp1[64], rpK[64];
	#endif
	#if N < 256
	uint8_t j;
	#else
	uint16_t j;
	#endif
	
	#if !((N>=128 && N<=256) & (__SSE2__))
	if (second_call){
		for (j=0; j<N/8; j++){
			#if N >= (64+N/8)
			// Take the bits from an element 64 positions later in sigmaK.
			// The condition (11) in the Technical Description Paper
			input_bytes[j] ^= (uint8_t)((mqq_sigmaK[j] & 0x0F)<<4);
			input_bytes[j] ^= (uint8_t)(mqq_sigmaK[j+64] & 0xFF);
			#else
			// Take the bits from an element a bit later positions later in sigmaK.
			// This is a hack for low values of N, for debugging of MQQ.
			input_bytes[j] ^= (uint8_t)((mqq_sigmaK[j] & 0x0F)<<4);
			input_bytes[j] ^= (uint8_t)(mqq_sigmaK[j+N/8] & 0xFF);
			#endif
		}
	}
	
	#else
	const __m128i bitMergeMask = _mm_set_epi8(0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f, 0x0f);
	// Reorder the layout for v.
	__m128i input_bytes0_15 =  _mm_load_si128((const __m128i *) &input_bytes[0]); // Load a set of input_bytes values
	__m128i input_bytes16_31 = _mm_load_si128((const __m128i *) &input_bytes[16]); // Load a set of input_bytes values (TODO: loads too much!!)

	/* 
	Affine transformation is just for the second call. The constant is extracted 
	from the 4 LSBs of sigmaK[] by the formula and xor-ed to input_bytes[].
	*/
	byteindex = 0;
	if (second_call){
		__m128i mqq_sigma5_0_15, mqq_sigma5_0_15_high, mqq_sigma5_0_15_low, v_0_15, mqq_sigma5_16_31, mqq_sigma5_16_31_high, mqq_sigma5_16_31_low, v_16_31;
		
		mqq_sigma5_0_15 = _mm_load_si128((const __m128i *) &mqq_sigmaK[0]); 
		mqq_sigma5_0_15 = _mm_and_si128(bitMergeMask, mqq_sigma5_0_15); // Now only the 4 bits needed is left in each byte
		mqq_sigma5_0_15_high = _mm_slli_epi16(mqq_sigma5_0_15, 4); // Shift left by 4 (16 bit)
		mqq_sigma5_0_15_low = _mm_load_si128((const __m128i *) &mqq_sigmaK[64]);
		v_0_15 = _mm_xor_si128(mqq_sigma5_0_15_high, mqq_sigma5_0_15_low);
		input_bytes0_15 = _mm_xor_si128(v_0_15, input_bytes0_15);
		#ifndef __SSSE3__
		_mm_store_si128((__m128i *) &input_bytes[0], input_bytes0_15);
		#endif
		
		mqq_sigma5_16_31 = _mm_load_si128((const __m128i *) &mqq_sigmaK[16]);
		mqq_sigma5_16_31 = _mm_and_si128(bitMergeMask, mqq_sigma5_16_31); // Now only the 4 bits needed is left in each byte
		mqq_sigma5_16_31_high = _mm_slli_epi16(mqq_sigma5_16_31, 4); // Shift left by 4 (16 bit)
		mqq_sigma5_16_31_low = _mm_load_si128((const __m128i *) &mqq_sigmaK[64 + 16]);
		v_16_31 = _mm_xor_si128(mqq_sigma5_16_31_high, mqq_sigma5_16_31_low);
		input_bytes16_31 = _mm_xor_si128(v_16_31, input_bytes16_31);

		#ifndef __SSSE3__
		_mm_store_si128((__m128i *) &input_bytes[16], input_bytes16_31);
		#endif
	}
	#endif

	
	
	// This code is included as a readable reference:
	// Initialize rp1 and rpK = 0
	//memset(rp1, 0, N/8);
	//memset(rpK, 0, N/8);
	// Fill rp1 with bits of InputBytes accordingly to sigma1 permutation
	// and fill rpK with bits of InputBytes accordingly to sigmaK permutation
	/*
	for (j=0; j<N; j++)
	{
		uint8_t bitindex = 0x80 >> ((mqq_sigma1[j])&0x07);
		uint8_t bitindexd = 0x80 >> (j&0x07);
		byteindex = mqq_sigma1[j]>>3;
		if (input_bytes[byteindex] & bitindex){
			rp1[j>>3] ^= bitindexd;
		}

		bitindex = 0x80 >> ((mqq_sigmaK[j])&0x07);
		//bitindexd = 0x80 >> (j&0x07);
		byteindex = mqq_sigmaK[j]>>3;
		if (input_bytes[byteindex] & bitindex){
			rpK[j>>3] ^= bitindexd;
		}
	}
	*/

	#if !((N>=128 && N<=256) & (__SSSE3__))
	
	// We have SSE2, but not SSSE3
	/* 
	   Fill rp1 with bits of InputBytes accordingly to sigma1 permutation
	   and fill rpK with bits of InputBytes accordingly to sigmaK permutation
	*/
	
	for (j=0; j<N/8; j++)
	{
		// Using 16-bit variables in order to use cmove instructions.
		uint16_t accumulator1 = 0;
		uint16_t accumulatorK = 0;
		
		// 0
		accumulator1 = (input_bytes[mqq_sigma1[j*8+0]>>3] & (0x80 >> ((mqq_sigma1[j*8+0])&0x07))) ? accumulator1  ^ (0x80 >> 0): accumulator1;
			
		accumulatorK = (input_bytes[mqq_sigmaK[j*8+0]>>3] & (0x80 >> ((mqq_sigmaK[j*8+0])&0x07))) ? accumulatorK  ^ (0x80 >> 0): accumulatorK;
		
		// 1
		accumulator1 = (input_bytes[mqq_sigma1[j*8+1]>>3] & (0x80 >> ((mqq_sigma1[j*8+1])&0x07))) ? accumulator1  ^ (0x80 >> 1): accumulator1;
			
		accumulatorK = (input_bytes[mqq_sigmaK[j*8+1]>>3] & (0x80 >> ((mqq_sigmaK[j*8+1])&0x07))) ? accumulatorK  ^ (0x80 >> 1): accumulatorK;
		
		// 2
		accumulator1 = (input_bytes[mqq_sigma1[j*8+2]>>3] & (0x80 >> ((mqq_sigma1[j*8+2])&0x07))) ? accumulator1  ^ (0x80 >> 2): accumulator1;
			
		accumulatorK = (input_bytes[mqq_sigmaK[j*8+2]>>3] & (0x80 >> ((mqq_sigmaK[j*8+2])&0x07))) ? accumulatorK  ^ (0x80 >> 2): accumulatorK;
		
		// 3
		accumulator1 = (input_bytes[mqq_sigma1[j*8+3]>>3] & (0x80 >> ((mqq_sigma1[j*8+3])&0x07))) ? accumulator1  ^ (0x80 >> 3): accumulator1;
			
		accumulatorK = (input_bytes[mqq_sigmaK[j*8+3]>>3] & (0x80 >> ((mqq_sigmaK[j*8+3])&0x07))) ? accumulatorK  ^ (0x80 >> 3): accumulatorK;
		
		// 4
		accumulator1 = (input_bytes[mqq_sigma1[j*8+4]>>3] & (0x80 >> ((mqq_sigma1[j*8+4])&0x07))) ? accumulator1  ^ (0x80 >> 4): accumulator1;
			
		accumulatorK = (input_bytes[mqq_sigmaK[j*8+4]>>3] & (0x80 >> ((mqq_sigmaK[j*8+4])&0x07))) ? accumulatorK  ^ (0x80 >> 4): accumulatorK;
		
		// 5
		accumulator1 = (input_bytes[mqq_sigma1[j*8+5]>>3] & (0x80 >> ((mqq_sigma1[j*8+5])&0x07))) ? accumulator1  ^ (0x80 >> 5): accumulator1;
			
		accumulatorK = (input_bytes[mqq_sigmaK[j*8+5]>>3] & (0x80 >> ((mqq_sigmaK[j*8+5])&0x07))) ? accumulatorK  ^ (0x80 >> 5): accumulatorK;
		
		// 6
		accumulator1 = (input_bytes[mqq_sigma1[j*8+6]>>3] & (0x80 >> ((mqq_sigma1[j*8+6])&0x07))) ? accumulator1  ^ (0x80 >> 6): accumulator1;
			
		accumulatorK = (input_bytes[mqq_sigmaK[j*8+6]>>3] & (0x80 >> ((mqq_sigmaK[j*8+6])&0x07))) ? accumulatorK  ^ (0x80 >> 6): accumulatorK;
		
		// 7
		accumulator1 = (input_bytes[mqq_sigma1[j*8+7]>>3] & (0x80 >> ((mqq_sigma1[j*8+7])&0x07))) ? accumulator1  ^ (0x80 >> 7): accumulator1;
			
		accumulatorK = (input_bytes[mqq_sigmaK[j*8+7]>>3] & (0x80 >> ((mqq_sigmaK[j*8+7])&0x07))) ? accumulatorK  ^ (0x80 >> 7): accumulatorK;
		
		rp1[j] = accumulator1;
		rpK[j] = accumulatorK;
	}
	
	#else
	// We have SSSE3
	
	// Note: Index 0 is the last one with _mm_shuffle_epi8
	const __m128i shiftTable = _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80); 
	// The mask for changing the 16 bit 3x right shift into an 8 bit 3x shift
	const __m128i shiftRightMask3 = _mm_set_epi8(0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
	// The mask for geting the 0x80 bit
	const __m128i highBitMask = _mm_set_epi8(0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,0x80, 0x80);
	
	// The mask for geting the 0x07 bit
	const __m128i lowBitMask = _mm_set_epi8(0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07);
	
	// Hack: reverse the order so that _mm_shuffle_epi8 works...
	const __m128i reverse_2 = _mm_set_epi8(8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7);
	
	j = 0;
	do
	{
		__m128i mqq_sigma1_values0_15 = _mm_load_si128((const __m128i *) &mqq_sigma1[j*8]); // Load a set of mqq_sigma1 values
		__m128i byteindex128 = _mm_srli_epi16(mqq_sigma1_values0_15, 3); // Shift right by 3 (16 bit)
		byteindex128 = _mm_and_si128(byteindex128, shiftRightMask3); // The byte indexes
		__m128i bitindex128 = _mm_shuffle_epi8(shiftTable, _mm_and_si128(lowBitMask, mqq_sigma1_values0_15));
		
		__m128i byteindex128_low  = _mm_or_si128(_mm_and_si128(highBitMask, mqq_sigma1_values0_15), byteindex128); // Set the high bit if byteindex is above 15
		__m128i byteindex128_high = _mm_or_si128(_mm_andnot_si128(mqq_sigma1_values0_15, highBitMask), byteindex128); // Set the high bit if byteindex is below 15
		__m128i h1_low  = _mm_shuffle_epi8(input_bytes0_15, byteindex128_low);
		__m128i h1_high = _mm_shuffle_epi8(input_bytes16_31, byteindex128_high);
		
		__m128i h1_merge = _mm_and_si128(_mm_or_si128(h1_high, h1_low), bitindex128);
		__m128i h1_merge_comp = _mm_cmpeq_epi8(bitindex128, h1_merge);

		uint16_t h1_bytes = _mm_movemask_epi8(_mm_shuffle_epi8(h1_merge_comp, reverse_2));
		
		
		// The "result" part
		__m128i mqq_sigma5_values0_15 = _mm_load_si128((const __m128i *) &mqq_sigmaK[j*8]); // Load a set of mqq_sigma1 values
		byteindex128 = _mm_srli_epi16(mqq_sigma5_values0_15, 3); // Shift right by 3 (16 bit)
		byteindex128 = _mm_and_si128(byteindex128, shiftRightMask3); // The byte indexes
		bitindex128 = _mm_shuffle_epi8(shiftTable, _mm_and_si128(lowBitMask, mqq_sigma5_values0_15));
		
		byteindex128_low  = _mm_or_si128(_mm_and_si128(highBitMask, mqq_sigma5_values0_15), byteindex128); // Set the high bit if byteindex is above 15
		byteindex128_high = _mm_or_si128(_mm_andnot_si128(mqq_sigma5_values0_15, highBitMask), byteindex128); // Set the high bit if byteindex is below 15
		
		__m128i result_low  = _mm_shuffle_epi8(input_bytes0_15, byteindex128_low);
		__m128i result_high = _mm_shuffle_epi8(input_bytes16_31, byteindex128_high);
		
		__m128i result_merge = _mm_and_si128(_mm_or_si128(result_high, result_low), bitindex128);
		__m128i result_merge_comp = _mm_cmpeq_epi8(bitindex128, result_merge);

		uint16_t result_bytes = _mm_movemask_epi8(_mm_shuffle_epi8(result_merge_comp, reverse_2));
		
		
		((uint16_t*) &rp1[j])[0] = h1_bytes;
		((uint16_t*) &rpK[j])[0] = result_bytes;
		j +=2;
	}
	while(j<N/8);
	#endif


	#if !((N>=128 && N<=256))
	for(i=0; i<N/8; i++) {
		rp1[i] ^= rpK[i];
		result[i] = rp1[i];
	}

	for(j=1; j<=N/16; j++) 
		for(i=0; i<N/8; i++) {
			result[i] ^= rp1[(i+j)%(N/8)];
		}

	// j is equal to N/16 + 1 
	for(i=0; i<N/8; i++)
		result[i] ^= rpK[(i+N/16+1)%(N/8)];
	
	
	#elif !((N==160) & (__SSSE3__))
	uint8_t __attribute__ ((aligned (16))) result_buf1[64];
	uint8_t __attribute__ ((aligned (16))) result_buf2[64];
	for(i=0; i<N/8; i++) {
		rp1[i+ N/8] = rp1[i];
		rpK[i+ N/8] = rpK[i];
	}
	for(i=0; i<N/4; i++) 
		rp1[i] ^= rpK[i];
	
	#if N<192
	#define MQQSIGN_ROLLOVER (4+2)
	#elif N<256
	#define MQQSIGN_ROLLOVER (4+4+2)
	#else
	#define MQQSIGN_ROLLOVER (8+4+2)
	#endif
	j = 1;
	for(i=0; i<N/8+MQQSIGN_ROLLOVER; i++) {
		result_buf1[i] = rp1[i] ^ rp1[(i+j)];
	}
	j = 2;
	
	for(i=0; i<N/8+MQQSIGN_ROLLOVER; i++) {
		result_buf2[i] = result_buf1[i] ^ result_buf1[(i+j)];
	}
	j = 4;
	
	#if N<256
	for(i=0; i<N/8; i++) {
	#else
	for(i=0; i<N/8+8; i++) {
	#endif
	
		#if N<192
		result[i] = result_buf2[i] ^ result_buf2[(i+j)];
		#elif N<256
		result[i] = result_buf2[i] ^ result_buf2[(i+j)] ^ result_buf2[(i+j+4)];
		#else
		result_buf1[i] = result_buf2[i] ^ result_buf2[(i+j)];
		#endif
		
		
	}
	
	#if N<192
	j = 8;
	#elif N<256
	j = 12;
	#else
	j = 8;
	#endif
	
	
	#if N>=256
	for(i=0; i<N/8; i++) {
		result[i] = result_buf1[i] ^ result_buf1[(i+j)];
	}
	j = 16;
	#endif


	for(; j<=N/16; j++) 
		for(i=0; i<N/8; i++) {
			result[i] ^= rp1[(i+j)];
		}

	// j is equal to N/16 + 1 
	for(i=0; i<N/8; i++)
		result[i] ^= rpK[(i+N/16+1)];
	
	#else
	
	// N== 160 and SSSE3 is available.
	
	__m128i rp1_0_15 =  _mm_load_si128((const __m128i *) &rp1[0]);
	__m128i rp1_16_31 = _mm_load_si128((const __m128i *) &rp1[16]);
	__m128i rpK_0_15 =  _mm_load_si128((const __m128i *) &rpK[0]);
	__m128i rpK_16_31 = _mm_load_si128((const __m128i *) &rpK[16]);

	__m128i result_bytes0_15  = _mm_xor_si128(rp1_0_15, rpK_0_15);
	__m128i result_bytes16_31 = _mm_xor_si128(rp1_16_31, rpK_16_31);
	
	__m128i tmp =  _mm_slli_si128(result_bytes16_31, 32 - N/8);
	result_bytes16_31 = _mm_alignr_epi8(result_bytes0_15, tmp, 32 - N/8);
	
	_mm_store_si128((__m128i *) &rp1[0], result_bytes0_15);
	_mm_store_si128((__m128i *) &rp1[16], result_bytes16_31);
	
	__m128i result_bytes0_15_1 = result_bytes0_15;
	__m128i result_bytes16_31_1 = result_bytes16_31;
	j = 1;

	j++;
	__m128i shifted_bytes0_15 = _mm_alignr_epi8(result_bytes16_31, result_bytes0_15, 1);
	__m128i shifted_bytes16_31 = _mm_alignr_epi8(result_bytes0_15, result_bytes16_31, 1);

	result_bytes0_15  = _mm_xor_si128(result_bytes0_15, shifted_bytes0_15);
	result_bytes16_31 = _mm_xor_si128(result_bytes16_31, shifted_bytes16_31);
	
	__m128i result_bytes0_15_2 = result_bytes0_15;
	__m128i result_bytes16_31_2 = result_bytes16_31;
	j += 2;
	
	
	shifted_bytes0_15 = _mm_alignr_epi8(result_bytes16_31, result_bytes0_15, 2);
	shifted_bytes16_31 = _mm_alignr_epi8(result_bytes0_15, result_bytes16_31, 2);

	result_bytes0_15  = _mm_xor_si128(result_bytes0_15, shifted_bytes0_15);
	result_bytes16_31 = _mm_xor_si128(result_bytes16_31, shifted_bytes16_31);
	j += 4;
	
	shifted_bytes0_15 = _mm_alignr_epi8(result_bytes16_31, result_bytes0_15, 4);
	shifted_bytes16_31 = _mm_alignr_epi8(result_bytes0_15, result_bytes16_31, 4);

	result_bytes0_15  = _mm_xor_si128(result_bytes0_15, shifted_bytes0_15);
	result_bytes16_31 = _mm_xor_si128(result_bytes16_31, shifted_bytes16_31);
	j++;
	j++;
	
	shifted_bytes0_15 = _mm_alignr_epi8(result_bytes16_31_2, result_bytes0_15_2, 8);
	shifted_bytes16_31 = _mm_alignr_epi8(result_bytes0_15_2, result_bytes16_31_2, 8);

	result_bytes0_15  = _mm_xor_si128(result_bytes0_15, shifted_bytes0_15);
	result_bytes16_31 = _mm_xor_si128(result_bytes16_31, shifted_bytes16_31);
	j++;
	
	shifted_bytes0_15 = _mm_alignr_epi8(result_bytes16_31_1, result_bytes0_15_1, 10);
	shifted_bytes16_31 = _mm_alignr_epi8(result_bytes0_15_1, result_bytes16_31_1, 10);

	result_bytes0_15  = _mm_xor_si128(result_bytes0_15, shifted_bytes0_15);
	result_bytes16_31 = _mm_xor_si128(result_bytes16_31, shifted_bytes16_31);
	
	tmp =  _mm_slli_si128(rpK_16_31, 32 - N/8);
	rpK_16_31 = _mm_alignr_epi8(rpK_0_15, tmp, 32 - N/8);
	
	shifted_bytes0_15 = _mm_alignr_epi8(rpK_16_31, rpK_0_15, N/16 +1);
	shifted_bytes16_31 = _mm_alignr_epi8(rpK_0_15, rpK_16_31, N/16 +1);

	result_bytes0_15  = _mm_xor_si128(result_bytes0_15, shifted_bytes0_15);
	result_bytes16_31 = _mm_xor_si128(result_bytes16_31, shifted_bytes16_31);
	
	_mm_store_si128((__m128i *) &result[0], result_bytes0_15);
	_mm_store_si128((__m128i *) &result[16], result_bytes16_31);
	
	
	for(; j<=N/16; j++) 
		for(i=0; i<N/8; i++) {
			result[i] ^= rp1[(i+j)%(N/8)];
		}
	#endif
}

static uint8_t Q(uint8_t i, uint8_t b1, uint8_t b2){
	const uint16_t MaskShort[8] = {0x8000, 0x4000, 0x2000, 0x1000, 0x0800, 0x0400, 0x0200, 0x0100};
	__attribute__ ((aligned (16))) uint8_t e[16]; // Only 9 are used, the rest is for SSE.
	__attribute__ ((aligned (16))) uint16_t a[8];
	uint8_t result, column, row, k;
	int8_t j;
	uint16_t temp;
	uint8_t *tmp_ptr=mqq_a;
	
	//TODO: Optimize
	#ifndef __SSSE3__
	if(i&1){
		memcpy(e, cc1, 9);
		while(b1){
			if(b1&0x80){
				memxor_idx((uint8_t*)e, tmp_ptr, 9, 9);
			}
			tmp_ptr++;
			b1 <<= 1;
		}
	}else{
		memcpy(e, cc2, 9);
		while(b1){
			if(b1&0x80){
				memxor((uint8_t*)e, tmp_ptr, 9);
			}
			tmp_ptr+=9;
			b1 <<= 1;
		}
	}
	#else
	__m128i e_values0_9;
	if(i&1){
		memcpy(e, cc1, 9);
		while(b1){
			if(b1&0x80){
				memxor_idx((uint8_t*)e, tmp_ptr, 9, 9);
			}
			tmp_ptr++;
			b1 <<= 1;
		}
		// TODO: add SSE code
		e_values0_9 = _mm_load_si128((const __m128i *) e);
	}else{
		e_values0_9 = _mm_load_si128((const __m128i *) cc2);
		
		while(b1){
			if(b1&0x80){
				__m128i mqq_a_values = _mm_loadu_si128((const __m128i *) tmp_ptr);
				e_values0_9 = _mm_xor_si128(e_values0_9, mqq_a_values);
			}
			
			tmp_ptr+=9;
			b1 <<= 1;
		}
		_mm_store_si128((__m128i *) &e[0], e_values0_9);
	}
	#endif
	/* So we finished with obtaining e0 .. e7 and e8 */

	/* We XOR e[8] with b2 and that will be initial value to transform in order to solve a linear system of equations */
	result=b2 ^ e[8];

	/* 
	   We can look at the bits of e0 .. e7 as a columns of a given matrix. We want to define 8 variables that have the rows
	   of that matrix. The variables need to be 16-bit because we will put into the upper 8 bits the bits of e0 .. e7, 
	   and the bits of the variable result will be the Least Significant Bits of a[0] ... a[7].
 	*/

	#ifndef __SSSE3__
	for(j=0; j<8; ++j){
		row = 0;
		for(k=0; k<8; ++k){
			row |= (e[k]&0x80)>>(k);
			e[k]<<=1;
		}
		a[j]=(((uint16_t)row)<<8) | (result>>7);
		result <<= 1;
	}
	#else
	const __m128i reverse = _mm_set_epi8(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
	__m128i result_8_15 = _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0, result, 0, 0, 0, 0, 0, 0, 0);
	e_values0_9 = _mm_unpacklo_epi64(e_values0_9, result_8_15);
	e_values0_9 = _mm_shuffle_epi8(e_values0_9, reverse);
	for(j=0; j<8; ++j){
		uint16_t result_bytes = _mm_movemask_epi8(e_values0_9);
		e_values0_9 = _mm_slli_epi16(e_values0_9, 1);
		a[j] = result_bytes;
	}
	#endif

	/* Now we finally realize Gausian elimination */
	
	/* First we apply upper triangular transformation */
	for(column=0; column<8; column++)
	{
		row=column;
		const uint16_t mask = 0x8000 >>column;
		while ((a[row] & mask) == 0){
			row++; // TODO: unroll AND -> CMOV => ~ 32*2 instructions (64 bit mode isolated)
		} 
		
		if(row>column)
		{
			temp=a[column];
			a[column]=a[row];
			a[row]=temp;
		} // TODO: unroll AND -> MOV -> CMOV -> CMOV => ~ 32*4 instructions (64 bit mode, merged with above)
		
		// TODO: SSE, (GCC vectorized this code)
		const uint16_t org_a = a[column];
		for  (j=0; j<8; j++) {
			uint16_t org = a[j] ^ org_a;
			a[j] = ((a[j]&mask) !=0) ? org : a[j];
		}
		a[column] = org_a;
	}

	/* The result is in the Least Significant Bits of a[0] ... a[7] */
	// TODO: Change to SSE
	#ifndef __SSSE3__
	result = 0;
	for(j=0; j<8; ++j){
		result <<=1;
		result |= a[j]&1;
	}
	#else
	__m128i a_values = _mm_load_si128((const __m128i *) a);
	const __m128i leastSignificantOfA_BitMask = _mm_set_epi8(0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 1, 3, 5, 7, 9, 11, 13, 15);
	
	a_values = _mm_slli_epi16(a_values, 15);
	a_values = _mm_shuffle_epi8(a_values, leastSignificantOfA_BitMask);
	result = (uint8_t) _mm_movemask_epi8(a_values);
	#endif
	
	return(result); // 20*(16+16+32*4+32*3+32*3+4) = ~7120 instructions (no SSE)
}

/*
Build the look-up table from the private key to speed-up the signing. 
Uses recycled code, and is not optimized. The tables are 2*64 KB.
*/
int buildTable(uint8_t *privateKeyTables, uint8_t mqq_a__[9*8], uint8_t cc1__[9], uint8_t cc2__[9])
{
	int i, j;
	for(i=0; i<9; i++)
		cc1[i] = cc1__[i];
	for(i=0; i<9; i++)
		cc2[i] = cc2__[i];
	for(i=0; i<9*8; i++)
		mqq_a[i] = mqq_a__[i];
	
	// Note that mqq_a__ do not contain all values in mqq_a.
	for(i=0; i<9; i++)
		mqq_a[8*9+i] = cc2[i];
	
	for(i=0; i<256; i++){
		for(j=0; j<256; j++){
			privateKeyTables[j*256 + i]=Q(0,j,i);
		}
	}
	
	for(i=0; i<256; i++){
		for(j=0; j<256; j++){
			privateKeyTables[256*256 + j*256 + i]=Q(1,j,i);
		}
	}
	
	return 0;
}

#if PRIVATE_KEY_LOOKUP_TABLES == 1
extern uint8_t lookup_table_private_key[256*256*2];
#endif


int sign(unsigned char *hash, const unsigned char *sk, uint8_t result[N/8])
{
	uint8_t i;
	#if (N <= 256 & (__SSE2__))
	// Make sure the SSE reads/writes are safe:
	uint8_t __attribute__ ((aligned (16))) result1[512/8];
	#else
	uint8_t result1[N/8];
	#endif
	
	#if PRIVATE_KEY_LOOKUP_TABLES == 1
	uint8_t *lookupQ;
	#endif

	if(sk == NULL)
	{
		return -1;
	}
	else
	{
		const unsigned char *privatekey = sk;
		// Note that here we are using global structures which are good only for testing and benchmarking
		#if PRIVATE_KEY_LOOKUP_TABLES == 0
		memcpy(mqq_a, privatekey, sizeof(mqq_a));
		#endif
		//mqq_a = (uint8_t *) privatekey;
		privatekey += sizeof(mqq_a);
		memcpy(mqq_sigma1, privatekey, sizeof(uint_sigma) * N);
		//mqq_sigma1 = (uint_sigma *) privatekey;
		privatekey += sizeof(uint_sigma) * N;
		memcpy(mqq_sigmaK, privatekey, sizeof(uint_sigma) * N);
		//mqq_sigmaK = (uint_sigma *) privatekey;
		#if PRIVATE_KEY_LOOKUP_TABLES == 1
		//privatekey += sizeof(uint_sigma) * N;
		
		lookupQ = (uint8_t *) lookup_table_private_key;
		#endif
	}
	
	#if PRIVATE_KEY_LOOKUP_TABLES == 0
	for(i=0; i<9; i++)
		cc1[i] = mqq_a[i*9+8];
	for(i=0; i<9; i++)
		cc2[i] = mqq_a[8*9+i];
	#endif
	
	InverseAffineTransformation(hash, result, 0);

	result1[0]=result[0];
	#if PRIVATE_KEY_LOOKUP_TABLES == 0
	for(i=1; i<N/8; i++){
		result1[i]=Q(i,result1[i-1],result[i]);
	}
	#elif PRIVATE_KEY_LOOKUP_TABLES == 1
	for(i=1; i<N/8; i++){
		uint8_t res_i = result[i];
		result1[i] = lookupQ[256*256*(i&1) + 256 * result1[i-1] + res_i];
	}
	
	#endif
	
	InverseAffineTransformation(result1, result, 1);
	return 0;
}

int crypto_sign(
unsigned char *sm,unsigned long long *smlen,
const unsigned char *m,unsigned long long mlen,
const unsigned char *sk
)
{
	#if !((N>=128 && N<=256) & (__SSE2__))
	uint8_t __attribute__ ((aligned (16))) result[N/8];
	#else
	uint8_t __attribute__ ((aligned (16))) result[32];
	#endif
	
	uint8_t __attribute__ ((aligned (16))) hash[512/8];

	// Get the hash of the message:
	#if MQQ_SUPERCOP_BUILD == 1
	crypto_hash_sha512(hash, m, mlen);
	#else
	memcpy(hash, m, N/8);
	#endif

	// Make a signature of the hash, using the key sk:
	if( sign(hash, sk, result) != 0 ) return -1;

	// Write the signature into the start of sm:
	memcpy(sm, result, N/8);
	
	// Copy the original message m into sm, after the signature:
	memcpy(sm+N/8, m, mlen);
	
	// Update smlen:
	*smlen = mlen+N/8;
	
	return 0;
}
