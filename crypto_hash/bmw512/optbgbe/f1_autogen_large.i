/* f1_autogen_large.i */
/*
    This file is part of the bg-generic packet for SUPERCOP.
    Copyright (C) 2010  Daniel Otte (daniel.otte@rub.de)

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
*//* BEGIN of automatic generated code */

static inline
void bmw_large_f1(uint64_t* q, const void* m, const void* h){ 
  uint64_t even, odd;
/* expand_1( 0) */
	q[16] = 
		((  ROTL64(((uint64_t*)m)[ 0], 1) 
		  + ROTL64(((uint64_t*)m)[ 3], 4) 
		  - ROTL64(((uint64_t*)m)[10], 11) 
		  + 0x5555555555555550ULL 
		 )^ ((uint64_t*)h)[ 7] 
		)
		+ S64_1(q[ 0]) + S64_2(q[ 1]) + S64_3(q[ 2]) + S64_0(q[ 3])
		+ S64_1(q[ 4]) + S64_2(q[ 5]) + S64_3(q[ 6]) + S64_0(q[ 7])
		+ S64_1(q[ 8]) + S64_2(q[ 9]) + S64_3(q[10]) + S64_0(q[11])
		+ S64_1(q[12]) + S64_2(q[13]) + S64_3(q[14]) + S64_0(q[15]);
/* expand_1( 1) */
	q[17] = 
		((  ROTL64(((uint64_t*)m)[ 1], 2) 
		  + ROTL64(((uint64_t*)m)[ 4], 5) 
		  - ROTL64(((uint64_t*)m)[11], 12) 
		  + 0x5aaaaaaaaaaaaaa5ULL 
		 )^ ((uint64_t*)h)[ 8] 
		)
		+ S64_1(q[ 1]) + S64_2(q[ 2]) + S64_3(q[ 3]) + S64_0(q[ 4])
		+ S64_1(q[ 5]) + S64_2(q[ 6]) + S64_3(q[ 7]) + S64_0(q[ 8])
		+ S64_1(q[ 9]) + S64_2(q[10]) + S64_3(q[11]) + S64_0(q[12])
		+ S64_1(q[13]) + S64_2(q[14]) + S64_3(q[15]) + S64_0(q[16]);
/* expand_2( 2) */
	q[18] = 
		((  ROTL64(((uint64_t*)m)[ 2], 3) 
		  + ROTL64(((uint64_t*)m)[ 5], 6) 
		  - ROTL64(((uint64_t*)m)[12], 13) 
		  + 0x5ffffffffffffffaULL 
		 )^ ((uint64_t*)h)[ 9] 
		)
		 + ( even =  q[ 2] + q[ 4] + q[ 6]
		           + q[ 8] + q[10] + q[12] + q[14] )
		 + R64_1(q[ 3]) + R64_2(q[ 5]) + R64_3(q[ 7])
		 + R64_4(q[ 9]) + R64_5(q[11]) + R64_6(q[13])
		 + R64_7(q[15]) + S64_4(q[16]) + S64_5(q[17]);
/* expand_2( 3) */
	q[19] = 
		((  ROTL64(((uint64_t*)m)[ 3], 4) 
		  + ROTL64(((uint64_t*)m)[ 6], 7) 
		  - ROTL64(((uint64_t*)m)[13], 14) 
		  + 0x655555555555554fULL 
		 )^ ((uint64_t*)h)[10] 
		)
		 + ( odd  =  q[ 3] + q[ 5] + q[ 7]
		           + q[ 9] + q[11] + q[13] + q[15] )
		 + R64_1(q[ 4]) + R64_2(q[ 6]) + R64_3(q[ 8])
		 + R64_4(q[10]) + R64_5(q[12]) + R64_6(q[14])
		 + R64_7(q[16]) + S64_4(q[17]) + S64_5(q[18]);
/* expand_2( 4) */
	q[20] = 
		((  ROTL64(((uint64_t*)m)[ 4], 5) 
		  + ROTL64(((uint64_t*)m)[ 7], 8) 
		  - ROTL64(((uint64_t*)m)[14], 15) 
		  + 0x6aaaaaaaaaaaaaa4ULL 
		 )^ ((uint64_t*)h)[11] 
		)
		 + ( even  +=  q[16] - q[ 2] )
		 + R64_1(q[ 5]) + R64_2(q[ 7]) + R64_3(q[ 9])
		 + R64_4(q[11]) + R64_5(q[13]) + R64_6(q[15])
		 + R64_7(q[17]) + S64_4(q[18]) + S64_5(q[19]);
/* expand_2( 5) */
	q[21] = 
		((  ROTL64(((uint64_t*)m)[ 5], 6) 
		  + ROTL64(((uint64_t*)m)[ 8], 9) 
		  - ROTL64(((uint64_t*)m)[15], 16) 
		  + 0x6ffffffffffffff9ULL 
		 )^ ((uint64_t*)h)[12] 
		)
		 + ( odd   +=  q[17] - q[ 3] )
		 + R64_1(q[ 6]) + R64_2(q[ 8]) + R64_3(q[10])
		 + R64_4(q[12]) + R64_5(q[14]) + R64_6(q[16])
		 + R64_7(q[18]) + S64_4(q[19]) + S64_5(q[20]);
/* expand_2( 6) */
	q[22] = 
		((  ROTL64(((uint64_t*)m)[ 6], 7) 
		  + ROTL64(((uint64_t*)m)[ 9], 10) 
		  - ROTL64(((uint64_t*)m)[ 0], 1) 
		  + 0x755555555555554eULL 
		 )^ ((uint64_t*)h)[13] 
		)
		 + ( even  +=  q[18] - q[ 4] )
		 + R64_1(q[ 7]) + R64_2(q[ 9]) + R64_3(q[11])
		 + R64_4(q[13]) + R64_5(q[15]) + R64_6(q[17])
		 + R64_7(q[19]) + S64_4(q[20]) + S64_5(q[21]);
/* expand_2( 7) */
	q[23] = 
		((  ROTL64(((uint64_t*)m)[ 7], 8) 
		  + ROTL64(((uint64_t*)m)[10], 11) 
		  - ROTL64(((uint64_t*)m)[ 1], 2) 
		  + 0x7aaaaaaaaaaaaaa3ULL 
		 )^ ((uint64_t*)h)[14] 
		)
		 + ( odd   +=  q[19] - q[ 5] )
		 + R64_1(q[ 8]) + R64_2(q[10]) + R64_3(q[12])
		 + R64_4(q[14]) + R64_5(q[16]) + R64_6(q[18])
		 + R64_7(q[20]) + S64_4(q[21]) + S64_5(q[22]);
/* expand_2( 8) */
	q[24] = 
		((  ROTL64(((uint64_t*)m)[ 8], 9) 
		  + ROTL64(((uint64_t*)m)[11], 12) 
		  - ROTL64(((uint64_t*)m)[ 2], 3) 
		  + 0x7ffffffffffffff8ULL 
		 )^ ((uint64_t*)h)[15] 
		)
		 + ( even  +=  q[20] - q[ 6] )
		 + R64_1(q[ 9]) + R64_2(q[11]) + R64_3(q[13])
		 + R64_4(q[15]) + R64_5(q[17]) + R64_6(q[19])
		 + R64_7(q[21]) + S64_4(q[22]) + S64_5(q[23]);
/* expand_2( 9) */
	q[25] = 
		((  ROTL64(((uint64_t*)m)[ 9], 10) 
		  + ROTL64(((uint64_t*)m)[12], 13) 
		  - ROTL64(((uint64_t*)m)[ 3], 4) 
		  + 0x855555555555554dULL 
		 )^ ((uint64_t*)h)[ 0] 
		)
		 + ( odd   +=  q[21] - q[ 7] )
		 + R64_1(q[10]) + R64_2(q[12]) + R64_3(q[14])
		 + R64_4(q[16]) + R64_5(q[18]) + R64_6(q[20])
		 + R64_7(q[22]) + S64_4(q[23]) + S64_5(q[24]);
/* expand_2(10) */
	q[26] = 
		((  ROTL64(((uint64_t*)m)[10], 11) 
		  + ROTL64(((uint64_t*)m)[13], 14) 
		  - ROTL64(((uint64_t*)m)[ 4], 5) 
		  + 0x8aaaaaaaaaaaaaa2ULL 
		 )^ ((uint64_t*)h)[ 1] 
		)
		 + ( even  +=  q[22] - q[ 8] )
		 + R64_1(q[11]) + R64_2(q[13]) + R64_3(q[15])
		 + R64_4(q[17]) + R64_5(q[19]) + R64_6(q[21])
		 + R64_7(q[23]) + S64_4(q[24]) + S64_5(q[25]);
/* expand_2(11) */
	q[27] = 
		((  ROTL64(((uint64_t*)m)[11], 12) 
		  + ROTL64(((uint64_t*)m)[14], 15) 
		  - ROTL64(((uint64_t*)m)[ 5], 6) 
		  + 0x8ffffffffffffff7ULL 
		 )^ ((uint64_t*)h)[ 2] 
		)
		 + ( odd   +=  q[23] - q[ 9] )
		 + R64_1(q[12]) + R64_2(q[14]) + R64_3(q[16])
		 + R64_4(q[18]) + R64_5(q[20]) + R64_6(q[22])
		 + R64_7(q[24]) + S64_4(q[25]) + S64_5(q[26]);
/* expand_2(12) */
	q[28] = 
		((  ROTL64(((uint64_t*)m)[12], 13) 
		  + ROTL64(((uint64_t*)m)[15], 16) 
		  - ROTL64(((uint64_t*)m)[ 6], 7) 
		  + 0x955555555555554cULL 
		 )^ ((uint64_t*)h)[ 3] 
		)
		 + ( even  +=  q[24] - q[10] )
		 + R64_1(q[13]) + R64_2(q[15]) + R64_3(q[17])
		 + R64_4(q[19]) + R64_5(q[21]) + R64_6(q[23])
		 + R64_7(q[25]) + S64_4(q[26]) + S64_5(q[27]);
/* expand_2(13) */
	q[29] = 
		((  ROTL64(((uint64_t*)m)[13], 14) 
		  + ROTL64(((uint64_t*)m)[ 0], 1) 
		  - ROTL64(((uint64_t*)m)[ 7], 8) 
		  + 0x9aaaaaaaaaaaaaa1ULL 
		 )^ ((uint64_t*)h)[ 4] 
		)
		 + ( odd   +=  q[25] - q[11] )
		 + R64_1(q[14]) + R64_2(q[16]) + R64_3(q[18])
		 + R64_4(q[20]) + R64_5(q[22]) + R64_6(q[24])
		 + R64_7(q[26]) + S64_4(q[27]) + S64_5(q[28]);
/* expand_2(14) */
	q[30] = 
		((  ROTL64(((uint64_t*)m)[14], 15) 
		  + ROTL64(((uint64_t*)m)[ 1], 2) 
		  - ROTL64(((uint64_t*)m)[ 8], 9) 
		  + 0x9ffffffffffffff6ULL 
		 )^ ((uint64_t*)h)[ 5] 
		)
		 + ( even  +=  q[26] - q[12] )
		 + R64_1(q[15]) + R64_2(q[17]) + R64_3(q[19])
		 + R64_4(q[21]) + R64_5(q[23]) + R64_6(q[25])
		 + R64_7(q[27]) + S64_4(q[28]) + S64_5(q[29]);
/* expand_2(15) */
	q[31] = 
		((  ROTL64(((uint64_t*)m)[15], 16) 
		  + ROTL64(((uint64_t*)m)[ 2], 3) 
		  - ROTL64(((uint64_t*)m)[ 9], 10) 
		  + 0xa55555555555554bULL 
		 )^ ((uint64_t*)h)[ 6] 
		)
		 + ( odd   +=  q[27] - q[13] )
		 + R64_1(q[16]) + R64_2(q[18]) + R64_3(q[20])
		 + R64_4(q[22]) + R64_5(q[24]) + R64_6(q[26])
		 + R64_7(q[28]) + S64_4(q[29]) + S64_5(q[30]);
}

/* END of automatic generated code */

