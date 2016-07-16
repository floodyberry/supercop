/*
 * SHELL Reference C Implementation
 *
 * Copyright 2015:
 *     Lei Wang <wanglei_hb@sjtu.edu.cn>
 *              <shellaemode@gmail.com>
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 *
 */

#include <assert.h>
#include <stdlib.h>

#include "aes.h"


/* the auxiliary permutation: reduced 4-round AES encryption */

void aesReducedEnc(const u32 mk[], const u32 sk[], const u8 pt[], u8 ct[]){

    u32 s0, s1, s2, s3, t0, t1, t2, t3;

    s0 = GETU32(pt     ) ^ mk[0];
	s1 = GETU32(pt +  4) ^ mk[1];
	s2 = GETU32(pt +  8) ^ mk[2];
	s3 = GETU32(pt + 12) ^ mk[3];

    /* round 1*/
    t0 =
            Te0[(s0 >> 24)       ] ^
            Te1[(s1 >> 16) & 0xff] ^
            Te2[(s2 >>  8) & 0xff] ^
            Te3[(s3      ) & 0xff] ^
            sk[0];
    t1 =
            Te0[(s1 >> 24)       ] ^
            Te1[(s2 >> 16) & 0xff] ^
            Te2[(s3 >>  8) & 0xff] ^
            Te3[(s0      ) & 0xff] ^
            sk[1];
    t2 =
            Te0[(s2 >> 24)       ] ^
            Te1[(s3 >> 16) & 0xff] ^
            Te2[(s0 >>  8) & 0xff] ^
            Te3[(s1      ) & 0xff] ^
            sk[2];
    t3 =
            Te0[(s3 >> 24)       ] ^
            Te1[(s0 >> 16) & 0xff] ^
            Te2[(s1 >>  8) & 0xff] ^
            Te3[(s2      ) & 0xff] ^
            sk[3];

    /* round 2*/

    s0 =
            Te0[(t0 >> 24)       ] ^
            Te1[(t1 >> 16) & 0xff] ^
            Te2[(t2 >>  8) & 0xff] ^
            Te3[(t3      ) & 0xff] ^
            sk[4];
    s1 =
            Te0[(t1 >> 24)       ] ^
            Te1[(t2 >> 16) & 0xff] ^
            Te2[(t3 >>  8) & 0xff] ^
            Te3[(t0      ) & 0xff] ^
            sk[5];
    s2 =
            Te0[(t2 >> 24)       ] ^
            Te1[(t3 >> 16) & 0xff] ^
            Te2[(t0 >>  8) & 0xff] ^
            Te3[(t1      ) & 0xff] ^
            sk[6];
    s3 =
            Te0[(t3 >> 24)       ] ^
            Te1[(t0 >> 16) & 0xff] ^
            Te2[(t1 >>  8) & 0xff] ^
            Te3[(t2      ) & 0xff] ^
            sk[7];

    /* round 3*/

    t0 =
            Te0[(s0 >> 24)       ] ^
            Te1[(s1 >> 16) & 0xff] ^
            Te2[(s2 >>  8) & 0xff] ^
            Te3[(s3      ) & 0xff] ^
            sk[8];
    t1 =
            Te0[(s1 >> 24)       ] ^
            Te1[(s2 >> 16) & 0xff] ^
            Te2[(s3 >>  8) & 0xff] ^
            Te3[(s0      ) & 0xff] ^
            sk[9];
    t2 =
            Te0[(s2 >> 24)       ] ^
            Te1[(s3 >> 16) & 0xff] ^
            Te2[(s0 >>  8) & 0xff] ^
            Te3[(s1      ) & 0xff] ^
            sk[10];
    t3 =
            Te0[(s3 >> 24)       ] ^
            Te1[(s0 >> 16) & 0xff] ^
            Te2[(s1 >>  8) & 0xff] ^
            Te3[(s2      ) & 0xff] ^
            sk[11];


    /* round 4*/

    s0 =
		(Te0[(t0 >> 24)       ] ) ^
		(Te1[(t1 >> 16) & 0xff]) ^
		(Te2[(t2 >>  8) & 0xff]) ^
		(Te3[(t3      ) & 0xff]) ;

	PUTU32(ct     , s0);

	s1 =
		(Te0[(t1 >> 24)       ] ) ^
		(Te1[(t2 >> 16) & 0xff] ) ^
		(Te2[(t3 >>  8) & 0xff] ) ^
		(Te3[(t0      ) & 0xff] );

	PUTU32(ct +  4, s1);

	s2 =
		(Te0[(t2 >> 24)       ] ) ^
		(Te1[(t3 >> 16) & 0xff] ) ^
		(Te2[(t0 >>  8) & 0xff] ) ^
		(Te3[(t1      ) & 0xff] );

	PUTU32(ct +  8, s2);

	s3 =
		(Te0[(t3 >> 24)       ] ) ^
		(Te1[(t0 >> 16) & 0xff] ) ^
		(Te2[(t1 >>  8) & 0xff] ) ^
		(Te3[(t2      ) & 0xff] );

	PUTU32(ct + 12, s3);
}

void aesReducedDec(const u32 mk[], const u32 sk[], const u8 ct[], u8 pt[]){
    u32 s0, s1, s2, s3, t0, t1, t2, t3;

    s0 = GETU32(ct     );
	s1 = GETU32(ct +  4);
	s2 = GETU32(ct +  8);
	s3 = GETU32(ct + 12);

    /*apply inverse of mixcolumn to s0-s3 */

    s0 =
			Td0[Te4[(s0 >> 24)       ] & 0xff] ^
			Td1[Te4[(s0 >> 16) & 0xff] & 0xff] ^
			Td2[Te4[(s0 >>  8) & 0xff] & 0xff] ^
			Td3[Te4[(s0      ) & 0xff] & 0xff];

    s1 =
			Td0[Te4[(s1 >> 24)       ] & 0xff] ^
			Td1[Te4[(s1 >> 16) & 0xff] & 0xff] ^
			Td2[Te4[(s1 >>  8) & 0xff] & 0xff] ^
			Td3[Te4[(s1      ) & 0xff] & 0xff];

    s2 =
			Td0[Te4[(s2 >> 24)       ] & 0xff] ^
			Td1[Te4[(s2 >> 16) & 0xff] & 0xff] ^
			Td2[Te4[(s2 >>  8) & 0xff] & 0xff] ^
			Td3[Te4[(s2      ) & 0xff] & 0xff];

    s3 =
			Td0[Te4[(s3 >> 24)       ] & 0xff] ^
			Td1[Te4[(s3 >> 16) & 0xff] & 0xff] ^
			Td2[Te4[(s3 >>  8) & 0xff] & 0xff] ^
			Td3[Te4[(s3      ) & 0xff] & 0xff];

    /*Decryption procedure*/

    t0 =
            Td0[(s0 >> 24)       ] ^
            Td1[(s3 >> 16) & 0xff] ^
            Td2[(s2 >>  8) & 0xff] ^
            Td3[(s1      ) & 0xff] ^
            sk[0];
    t1 =
            Td0[(s1 >> 24)       ] ^
            Td1[(s0 >> 16) & 0xff] ^
            Td2[(s3 >>  8) & 0xff] ^
            Td3[(s2      ) & 0xff] ^
            sk[1];
    t2 =
            Td0[(s2 >> 24)       ] ^
            Td1[(s1 >> 16) & 0xff] ^
            Td2[(s0 >>  8) & 0xff] ^
            Td3[(s3      ) & 0xff] ^
            sk[2];

    t3 =
            Td0[(s3 >> 24)       ] ^
            Td1[(s2 >> 16) & 0xff] ^
            Td2[(s1 >>  8) & 0xff] ^
            Td3[(s0      ) & 0xff] ^
            sk[3];

    s0 =
            Td0[(t0 >> 24)       ] ^
            Td1[(t3 >> 16) & 0xff] ^
            Td2[(t2 >>  8) & 0xff] ^
            Td3[(t1      ) & 0xff] ^
            sk[4];
    s1 =
            Td0[(t1 >> 24)       ] ^
            Td1[(t0 >> 16) & 0xff] ^
            Td2[(t3 >>  8) & 0xff] ^
            Td3[(t2      ) & 0xff] ^
            sk[5];
    s2 =
            Td0[(t2 >> 24)       ] ^
            Td1[(t1 >> 16) & 0xff] ^
            Td2[(t0 >>  8) & 0xff] ^
            Td3[(t3      ) & 0xff] ^
            sk[6];
    s3 =
            Td0[(t3 >> 24)       ] ^
            Td1[(t2 >> 16) & 0xff] ^
            Td2[(t1 >>  8) & 0xff] ^
            Td3[(t0      ) & 0xff] ^
            sk[7];

    t0 =
            Td0[(s0 >> 24)       ] ^
            Td1[(s3 >> 16) & 0xff] ^
            Td2[(s2 >>  8) & 0xff] ^
            Td3[(s1      ) & 0xff] ^
            sk[8];
    t1 =
            Td0[(s1 >> 24)       ] ^
            Td1[(s0 >> 16) & 0xff] ^
            Td2[(s3 >>  8) & 0xff] ^
            Td3[(s2      ) & 0xff] ^
            sk[9];
    t2 =
            Td0[(s2 >> 24)       ] ^
            Td1[(s1 >> 16) & 0xff] ^
            Td2[(s0 >>  8) & 0xff] ^
            Td3[(s3      ) & 0xff] ^
            sk[10];

    t3 =
            Td0[(s3 >> 24)       ] ^
            Td1[(s2 >> 16) & 0xff] ^
            Td2[(s1 >>  8) & 0xff] ^
            Td3[(s0      ) & 0xff] ^
            sk[11];

    s0 =
   		(Td4[(t0 >> 24)       ] & 0xff000000) ^
   		(Td4[(t3 >> 16) & 0xff] & 0x00ff0000) ^
   		(Td4[(t2 >>  8) & 0xff] & 0x0000ff00) ^
   		(Td4[(t1      ) & 0xff] & 0x000000ff) ^
   		mk[0];

	PUTU32(pt     , s0);

   	s1 =
   		(Td4[(t1 >> 24)       ] & 0xff000000) ^
   		(Td4[(t0 >> 16) & 0xff] & 0x00ff0000) ^
   		(Td4[(t3 >>  8) & 0xff] & 0x0000ff00) ^
   		(Td4[(t2      ) & 0xff] & 0x000000ff) ^
   		mk[1];

	PUTU32(pt +  4, s1);

   	s2 =
   		(Td4[(t2 >> 24)       ] & 0xff000000) ^
   		(Td4[(t1 >> 16) & 0xff] & 0x00ff0000) ^
   		(Td4[(t0 >>  8) & 0xff] & 0x0000ff00) ^
   		(Td4[(t3      ) & 0xff] & 0x000000ff) ^
   		mk[2];

	PUTU32(pt +  8, s2);

   	s3 =
   		(Td4[(t3 >> 24)       ] & 0xff000000) ^
   		(Td4[(t2 >> 16) & 0xff] & 0x00ff0000) ^
   		(Td4[(t1 >>  8) & 0xff] & 0x0000ff00) ^
   		(Td4[(t0      ) & 0xff] & 0x000000ff) ^
   		mk[3];

	PUTU32(pt + 12, s3);

}
