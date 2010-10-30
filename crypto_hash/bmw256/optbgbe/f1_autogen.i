/* f1_autogen.i */
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
*/
/* BEGIN of automatic generated code */

static inline
void bmw_small_f1(uint32_t* q, const void* m, const void* h){ 
  uint32_t even, odd;
/* expand_1( 0) */
	q[16] = 
		((  ROTL32(((uint32_t*)m)[ 0], 1) 
		  + ROTL32(((uint32_t*)m)[ 3], 4) 
		  - ROTL32(((uint32_t*)m)[10], 11) 
		  + 0x55555550UL 
		 )^ ((uint32_t*)h)[ 7] 
		)
		+ S32_1(q[ 0]) + S32_2(q[ 1]) + S32_3(q[ 2]) + S32_0(q[ 3])
		+ S32_1(q[ 4]) + S32_2(q[ 5]) + S32_3(q[ 6]) + S32_0(q[ 7])
		+ S32_1(q[ 8]) + S32_2(q[ 9]) + S32_3(q[10]) + S32_0(q[11])
		+ S32_1(q[12]) + S32_2(q[13]) + S32_3(q[14]) + S32_0(q[15]);
/* expand_1( 1) */
	q[17] = 
		((  ROTL32(((uint32_t*)m)[ 1], 2) 
		  + ROTL32(((uint32_t*)m)[ 4], 5) 
		  - ROTL32(((uint32_t*)m)[11], 12) 
		  + 0x5aaaaaa5UL 
		 )^ ((uint32_t*)h)[ 8] 
		)
		+ S32_1(q[ 1]) + S32_2(q[ 2]) + S32_3(q[ 3]) + S32_0(q[ 4])
		+ S32_1(q[ 5]) + S32_2(q[ 6]) + S32_3(q[ 7]) + S32_0(q[ 8])
		+ S32_1(q[ 9]) + S32_2(q[10]) + S32_3(q[11]) + S32_0(q[12])
		+ S32_1(q[13]) + S32_2(q[14]) + S32_3(q[15]) + S32_0(q[16]);
/* expand_2( 2) */
	q[18] = 
		((  ROTL32(((uint32_t*)m)[ 2], 3) 
		  + ROTL32(((uint32_t*)m)[ 5], 6) 
		  - ROTL32(((uint32_t*)m)[12], 13) 
		  + 0x5ffffffaUL 
		 )^ ((uint32_t*)h)[ 9] 
		)
		 + ( even =  q[ 2] + q[ 4] + q[ 6]
		           + q[ 8] + q[10] + q[12] + q[14] )
		 + R32_1(q[ 3]) + R32_2(q[ 5]) + R32_3(q[ 7])
		 + R32_4(q[ 9]) + R32_5(q[11]) + R32_6(q[13])
		 + R32_7(q[15]) + S32_4(q[16]) + S32_5(q[17]);
/* expand_2( 3) */
	q[19] = 
		((  ROTL32(((uint32_t*)m)[ 3], 4) 
		  + ROTL32(((uint32_t*)m)[ 6], 7) 
		  - ROTL32(((uint32_t*)m)[13], 14) 
		  + 0x6555554fUL 
		 )^ ((uint32_t*)h)[10] 
		)
		 + ( odd  =  q[ 3] + q[ 5] + q[ 7]
		           + q[ 9] + q[11] + q[13] + q[15] )
		 + R32_1(q[ 4]) + R32_2(q[ 6]) + R32_3(q[ 8])
		 + R32_4(q[10]) + R32_5(q[12]) + R32_6(q[14])
		 + R32_7(q[16]) + S32_4(q[17]) + S32_5(q[18]);
/* expand_2( 4) */
	q[20] = 
		((  ROTL32(((uint32_t*)m)[ 4], 5) 
		  + ROTL32(((uint32_t*)m)[ 7], 8) 
		  - ROTL32(((uint32_t*)m)[14], 15) 
		  + 0x6aaaaaa4UL 
		 )^ ((uint32_t*)h)[11] 
		)
		 + ( even  +=  q[16] - q[ 2] )
		 + R32_1(q[ 5]) + R32_2(q[ 7]) + R32_3(q[ 9])
		 + R32_4(q[11]) + R32_5(q[13]) + R32_6(q[15])
		 + R32_7(q[17]) + S32_4(q[18]) + S32_5(q[19]);
/* expand_2( 5) */
	q[21] = 
		((  ROTL32(((uint32_t*)m)[ 5], 6) 
		  + ROTL32(((uint32_t*)m)[ 8], 9) 
		  - ROTL32(((uint32_t*)m)[15], 16) 
		  + 0x6ffffff9UL 
		 )^ ((uint32_t*)h)[12] 
		)
		 + ( odd   +=  q[17] - q[ 3] )
		 + R32_1(q[ 6]) + R32_2(q[ 8]) + R32_3(q[10])
		 + R32_4(q[12]) + R32_5(q[14]) + R32_6(q[16])
		 + R32_7(q[18]) + S32_4(q[19]) + S32_5(q[20]);
/* expand_2( 6) */
	q[22] = 
		((  ROTL32(((uint32_t*)m)[ 6], 7) 
		  + ROTL32(((uint32_t*)m)[ 9], 10) 
		  - ROTL32(((uint32_t*)m)[ 0], 1) 
		  + 0x7555554eUL 
		 )^ ((uint32_t*)h)[13] 
		)
		 + ( even  +=  q[18] - q[ 4] )
		 + R32_1(q[ 7]) + R32_2(q[ 9]) + R32_3(q[11])
		 + R32_4(q[13]) + R32_5(q[15]) + R32_6(q[17])
		 + R32_7(q[19]) + S32_4(q[20]) + S32_5(q[21]);
/* expand_2( 7) */
	q[23] = 
		((  ROTL32(((uint32_t*)m)[ 7], 8) 
		  + ROTL32(((uint32_t*)m)[10], 11) 
		  - ROTL32(((uint32_t*)m)[ 1], 2) 
		  + 0x7aaaaaa3UL 
		 )^ ((uint32_t*)h)[14] 
		)
		 + ( odd   +=  q[19] - q[ 5] )
		 + R32_1(q[ 8]) + R32_2(q[10]) + R32_3(q[12])
		 + R32_4(q[14]) + R32_5(q[16]) + R32_6(q[18])
		 + R32_7(q[20]) + S32_4(q[21]) + S32_5(q[22]);
/* expand_2( 8) */
	q[24] = 
		((  ROTL32(((uint32_t*)m)[ 8], 9) 
		  + ROTL32(((uint32_t*)m)[11], 12) 
		  - ROTL32(((uint32_t*)m)[ 2], 3) 
		  + 0x7ffffff8UL 
		 )^ ((uint32_t*)h)[15] 
		)
		 + ( even  +=  q[20] - q[ 6] )
		 + R32_1(q[ 9]) + R32_2(q[11]) + R32_3(q[13])
		 + R32_4(q[15]) + R32_5(q[17]) + R32_6(q[19])
		 + R32_7(q[21]) + S32_4(q[22]) + S32_5(q[23]);
/* expand_2( 9) */
	q[25] = 
		((  ROTL32(((uint32_t*)m)[ 9], 10) 
		  + ROTL32(((uint32_t*)m)[12], 13) 
		  - ROTL32(((uint32_t*)m)[ 3], 4) 
		  + 0x8555554dUL 
		 )^ ((uint32_t*)h)[ 0] 
		)
		 + ( odd   +=  q[21] - q[ 7] )
		 + R32_1(q[10]) + R32_2(q[12]) + R32_3(q[14])
		 + R32_4(q[16]) + R32_5(q[18]) + R32_6(q[20])
		 + R32_7(q[22]) + S32_4(q[23]) + S32_5(q[24]);
/* expand_2(10) */
	q[26] = 
		((  ROTL32(((uint32_t*)m)[10], 11) 
		  + ROTL32(((uint32_t*)m)[13], 14) 
		  - ROTL32(((uint32_t*)m)[ 4], 5) 
		  + 0x8aaaaaa2UL 
		 )^ ((uint32_t*)h)[ 1] 
		)
		 + ( even  +=  q[22] - q[ 8] )
		 + R32_1(q[11]) + R32_2(q[13]) + R32_3(q[15])
		 + R32_4(q[17]) + R32_5(q[19]) + R32_6(q[21])
		 + R32_7(q[23]) + S32_4(q[24]) + S32_5(q[25]);
/* expand_2(11) */
	q[27] = 
		((  ROTL32(((uint32_t*)m)[11], 12) 
		  + ROTL32(((uint32_t*)m)[14], 15) 
		  - ROTL32(((uint32_t*)m)[ 5], 6) 
		  + 0x8ffffff7UL 
		 )^ ((uint32_t*)h)[ 2] 
		)
		 + ( odd   +=  q[23] - q[ 9] )
		 + R32_1(q[12]) + R32_2(q[14]) + R32_3(q[16])
		 + R32_4(q[18]) + R32_5(q[20]) + R32_6(q[22])
		 + R32_7(q[24]) + S32_4(q[25]) + S32_5(q[26]);
/* expand_2(12) */
	q[28] = 
		((  ROTL32(((uint32_t*)m)[12], 13) 
		  + ROTL32(((uint32_t*)m)[15], 16) 
		  - ROTL32(((uint32_t*)m)[ 6], 7) 
		  + 0x9555554cUL 
		 )^ ((uint32_t*)h)[ 3] 
		)
		 + ( even  +=  q[24] - q[10] )
		 + R32_1(q[13]) + R32_2(q[15]) + R32_3(q[17])
		 + R32_4(q[19]) + R32_5(q[21]) + R32_6(q[23])
		 + R32_7(q[25]) + S32_4(q[26]) + S32_5(q[27]);
/* expand_2(13) */
	q[29] = 
		((  ROTL32(((uint32_t*)m)[13], 14) 
		  + ROTL32(((uint32_t*)m)[ 0], 1) 
		  - ROTL32(((uint32_t*)m)[ 7], 8) 
		  + 0x9aaaaaa1UL 
		 )^ ((uint32_t*)h)[ 4] 
		)
		 + ( odd   +=  q[25] - q[11] )
		 + R32_1(q[14]) + R32_2(q[16]) + R32_3(q[18])
		 + R32_4(q[20]) + R32_5(q[22]) + R32_6(q[24])
		 + R32_7(q[26]) + S32_4(q[27]) + S32_5(q[28]);
/* expand_2(14) */
	q[30] = 
		((  ROTL32(((uint32_t*)m)[14], 15) 
		  + ROTL32(((uint32_t*)m)[ 1], 2) 
		  - ROTL32(((uint32_t*)m)[ 8], 9) 
		  + 0x9ffffff6UL 
		 )^ ((uint32_t*)h)[ 5] 
		)
		 + ( even  +=  q[26] - q[12] )
		 + R32_1(q[15]) + R32_2(q[17]) + R32_3(q[19])
		 + R32_4(q[21]) + R32_5(q[23]) + R32_6(q[25])
		 + R32_7(q[27]) + S32_4(q[28]) + S32_5(q[29]);
/* expand_2(15) */
	q[31] = 
		((  ROTL32(((uint32_t*)m)[15], 16) 
		  + ROTL32(((uint32_t*)m)[ 2], 3) 
		  - ROTL32(((uint32_t*)m)[ 9], 10) 
		  + 0xa555554bUL 
		 )^ ((uint32_t*)h)[ 6] 
		)
		 + ( odd   +=  q[27] - q[13] )
		 + R32_1(q[16]) + R32_2(q[18]) + R32_3(q[20])
		 + R32_4(q[22]) + R32_5(q[24]) + R32_6(q[26])
		 + R32_7(q[28]) + S32_4(q[29]) + S32_5(q[30]);
}

/* END of automatic generated code */

