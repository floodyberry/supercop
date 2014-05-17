/*
 *  CPFB version 1.0
 * @author Miguel Montes
 * @author Daniel Penazzi
 * 
 * To the extent possible under law, the authors have waived all copyright
 * and related or neighboring rights to the source code in this file.
 * http://creativecommons.org/publicdomain/zero/1.0/
 */
/* This file contains implementations of the AES key schedule, based in the
 * code of the white paper "Intel(r) Advanced Encryption Standard (AES) 
 * New Instructions Set" by Shay Gueron.
 * The code is modified to parallelize portions of the key setup in CPFB
 */
#include <wmmintrin.h>

#include "cpfbkey.h"
#define inline __inline


inline void key_expansion_128(__m128i* temp1,
__m128i* temp2,
int KS_Pointer,
__m128i *Key_Schedule)
{
__m128i temp3;
*temp2 = _mm_shuffle_epi32 (*temp2, 0xff);
temp3 = _mm_slli_si128 (*temp1, 0x4);
*temp1 = _mm_xor_si128 (*temp1, temp3);
temp3 = _mm_slli_si128 (temp3, 0x4);
*temp1 = _mm_xor_si128 (*temp1, temp3);
temp3 = _mm_slli_si128 (temp3, 0x4);
*temp1 = _mm_xor_si128 (*temp1, temp3);
*temp1 = _mm_xor_si128 (*temp1, *temp2);
Key_Schedule[KS_Pointer]=*temp1;
}

/* Expand the 128 bit userkey into Key_Schedule, and encrypt two blocks on-the-fly:
 * in1 into _k1, and in2 into _k2
 */
void AES_128_Key_Expansion_and_encryption (__m128i *userkey,
__m128i *Key_Schedule, __m128i in1, __m128i in2, __m128i* _k1, __m128i* _k2)
{
__m128i temp1, temp2, k1,k2 ;
int KS_Pointer=1;
temp1= _mm_loadu_si128(userkey);
Key_Schedule[0]=temp1;
k1 = _mm_xor_si128(in1,temp1);
k2 = _mm_xor_si128(in2,temp1);
temp2 = _mm_aeskeygenassist_si128 (temp1,0x1);
key_expansion_128(&temp1, &temp2, KS_Pointer++, Key_Schedule);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
temp2 = _mm_aeskeygenassist_si128 (temp1,0x2);
key_expansion_128(&temp1, &temp2, KS_Pointer++, Key_Schedule);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
temp2 = _mm_aeskeygenassist_si128 (temp1,0x4);
key_expansion_128(&temp1, &temp2, KS_Pointer++, Key_Schedule);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
temp2 = _mm_aeskeygenassist_si128 (temp1,0x8);
key_expansion_128(&temp1, &temp2, KS_Pointer++, Key_Schedule);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
temp2 = _mm_aeskeygenassist_si128 (temp1,0x10);
key_expansion_128(&temp1, &temp2, KS_Pointer++, Key_Schedule);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
temp2 = _mm_aeskeygenassist_si128 (temp1,0x20);
key_expansion_128(&temp1, &temp2, KS_Pointer++, Key_Schedule);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
temp2 = _mm_aeskeygenassist_si128 (temp1,0x40);
key_expansion_128(&temp1, &temp2, KS_Pointer++, Key_Schedule);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
temp2 = _mm_aeskeygenassist_si128 (temp1,0x80);
key_expansion_128(&temp1, &temp2, KS_Pointer++, Key_Schedule);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
temp2 = _mm_aeskeygenassist_si128 (temp1,0x1b);
key_expansion_128(&temp1, &temp2, KS_Pointer++, Key_Schedule);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
temp2 = _mm_aeskeygenassist_si128 (temp1,0x36);
key_expansion_128(&temp1, &temp2, KS_Pointer++, Key_Schedule);
*_k1 = _mm_aesenclast_si128(k1,temp1);
*_k2 = _mm_aesenclast_si128(k2,temp1);

}

/* Perform two key expansions in parallel. The userkey to be expanded is
 * in the first 128 bits of the key schedule. 
 * This is, the first 128 bits of Key_Schedule_a and Key_Schedule_b are expanded 
 * into the 1280 remaining bits
 */ 
void AES_128_Key_Expansion_2 (__m128i * restrict Key_Schedule_a, __m128i * restrict Key_Schedule_b)
{
__m128i a1, a2, b1, b2;
int KS_Pointer=1;
a1= _mm_load_si128(Key_Schedule_a);
b1= _mm_load_si128(Key_Schedule_b);
a2 = _mm_aeskeygenassist_si128 (a1,0x1);
b2 = _mm_aeskeygenassist_si128 (b1,0x1);
key_expansion_128(&a1, &a2, KS_Pointer, Key_Schedule_a);
key_expansion_128(&b1, &b2, KS_Pointer++, Key_Schedule_b);
a2 = _mm_aeskeygenassist_si128 (a1,0x2);
b2 = _mm_aeskeygenassist_si128 (b1,0x2);
key_expansion_128(&a1, &a2, KS_Pointer, Key_Schedule_a);
key_expansion_128(&b1, &b2, KS_Pointer++, Key_Schedule_b);
a2 = _mm_aeskeygenassist_si128 (a1,0x4);
b2 = _mm_aeskeygenassist_si128 (b1,0x4);
key_expansion_128(&a1, &a2, KS_Pointer, Key_Schedule_a);
key_expansion_128(&b1, &b2, KS_Pointer++, Key_Schedule_b);
a2 = _mm_aeskeygenassist_si128 (a1,0x8);
b2 = _mm_aeskeygenassist_si128 (b1,0x8);
key_expansion_128(&a1, &a2, KS_Pointer, Key_Schedule_a);
key_expansion_128(&b1, &b2, KS_Pointer++, Key_Schedule_b);
a2 = _mm_aeskeygenassist_si128 (a1,0x10);
b2 = _mm_aeskeygenassist_si128 (b1,0x10);
key_expansion_128(&a1, &a2, KS_Pointer, Key_Schedule_a);
key_expansion_128(&b1, &b2, KS_Pointer++, Key_Schedule_b);
a2 = _mm_aeskeygenassist_si128 (a1,0x20);
b2 = _mm_aeskeygenassist_si128 (b1,0x20);
key_expansion_128(&a1, &a2, KS_Pointer, Key_Schedule_a);
key_expansion_128(&b1, &b2, KS_Pointer++, Key_Schedule_b);
a2 = _mm_aeskeygenassist_si128 (a1,0x40);
b2 = _mm_aeskeygenassist_si128 (b1,0x40);
key_expansion_128(&a1, &a2, KS_Pointer, Key_Schedule_a);
key_expansion_128(&b1, &b2, KS_Pointer++, Key_Schedule_b);
a2 = _mm_aeskeygenassist_si128 (a1,0x80);
b2 = _mm_aeskeygenassist_si128 (b1,0x80);
key_expansion_128(&a1, &a2, KS_Pointer, Key_Schedule_a);
key_expansion_128(&b1, &b2, KS_Pointer++, Key_Schedule_b);
a2 = _mm_aeskeygenassist_si128 (a1,0x1b);
b2 = _mm_aeskeygenassist_si128 (b1,0x1b);
key_expansion_128(&a1, &a2, KS_Pointer, Key_Schedule_a);
key_expansion_128(&b1, &b2, KS_Pointer++, Key_Schedule_b);
a2 = _mm_aeskeygenassist_si128 (a1,0x36);
b2 = _mm_aeskeygenassist_si128 (b1,0x36);
key_expansion_128(&a1, &a2, KS_Pointer, Key_Schedule_a);
key_expansion_128(&b1, &b2, KS_Pointer++, Key_Schedule_b);
}


inline void KEY_256_ASSIST_1(__m128i* temp1, __m128i * temp2)
{
__m128i temp4;
*temp2 = _mm_shuffle_epi32(*temp2, 0xff);
temp4 = _mm_slli_si128 (*temp1, 0x4);
*temp1 = _mm_xor_si128 (*temp1, temp4);
temp4 = _mm_slli_si128 (temp4, 0x4);
*temp1 = _mm_xor_si128 (*temp1, temp4);
temp4 = _mm_slli_si128 (temp4, 0x4);
*temp1 = _mm_xor_si128 (*temp1, temp4);
*temp1 = _mm_xor_si128 (*temp1, *temp2);
}
inline void KEY_256_ASSIST_2(__m128i* temp1, __m128i * temp3)
{
__m128i temp2,temp4;
temp4 = _mm_aeskeygenassist_si128 (*temp1, 0x0);
temp2 = _mm_shuffle_epi32(temp4, 0xaa);
temp4 = _mm_slli_si128 (*temp3, 0x4);
*temp3 = _mm_xor_si128 (*temp3, temp4);
temp4 = _mm_slli_si128 (temp4, 0x4);
*temp3 = _mm_xor_si128 (*temp3, temp4);
temp4 = _mm_slli_si128 (temp4, 0x4);
*temp3 = _mm_xor_si128 (*temp3, temp4);
*temp3 = _mm_xor_si128 (*temp3, temp2);
}
void AES_256_Key_Expansion (__m128i *userkey,
__m128i *key)
{
__m128i temp1, temp2, temp3;
__m128i *Key_Schedule = (__m128i*)key;
temp1 = _mm_loadu_si128((__m128i*)userkey);
temp3 = _mm_loadu_si128((__m128i*)(userkey+1));
Key_Schedule[0] = temp1;
Key_Schedule[1] = temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x01);
KEY_256_ASSIST_1(&temp1, &temp2);
Key_Schedule[2]=temp1;
KEY_256_ASSIST_2(&temp1, &temp3);
Key_Schedule[3]=temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x02);
KEY_256_ASSIST_1(&temp1, &temp2);
Key_Schedule[4]=temp1;
KEY_256_ASSIST_2(&temp1, &temp3);
Key_Schedule[5]=temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x04);
KEY_256_ASSIST_1(&temp1, &temp2);
Key_Schedule[6]=temp1;
KEY_256_ASSIST_2(&temp1, &temp3);
Key_Schedule[7]=temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x08);
KEY_256_ASSIST_1(&temp1, &temp2);
Key_Schedule[8]=temp1;
KEY_256_ASSIST_2(&temp1, &temp3);
Key_Schedule[9]=temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x10);
KEY_256_ASSIST_1(&temp1, &temp2);
Key_Schedule[10]=temp1;
KEY_256_ASSIST_2(&temp1, &temp3);
Key_Schedule[11]=temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x20);
KEY_256_ASSIST_1(&temp1, &temp2);
Key_Schedule[12]=temp1;
KEY_256_ASSIST_2(&temp1, &temp3);
Key_Schedule[13]=temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x40);
KEY_256_ASSIST_1(&temp1, &temp2);
Key_Schedule[14]=temp1;
}

/* Perform two key expansions in parallel. The userkey to be expanded is
 * in the first 256 bits of the key schedule. 
 * This is, the first 256 bits of Key_Schedule_a and Key_Schedule_b are expanded 
 * into their remaining bits.
 */ 
void AES_256_Key_Expansion_2 (__m128i * restrict Key_Schedule_a, __m128i * restrict Key_Schedule_b)
{
__m128i a1, a2, a3, b1, b2, b3;
a1 = _mm_load_si128(Key_Schedule_a);
a3 = _mm_load_si128(Key_Schedule_a+1);
b1 = _mm_load_si128(Key_Schedule_b);
b3 = _mm_load_si128(Key_Schedule_b+1);
a2 = _mm_aeskeygenassist_si128 (a3,0x01);
b2 = _mm_aeskeygenassist_si128 (b3,0x01);
KEY_256_ASSIST_1(&a1, &a2);
KEY_256_ASSIST_1(&b1, &b2);
Key_Schedule_a[2]=a1;
Key_Schedule_b[2]=b1;
KEY_256_ASSIST_2(&a1, &a3);
KEY_256_ASSIST_2(&b1, &b3);
Key_Schedule_a[3]=a3;
Key_Schedule_b[3]=b3;
a2 = _mm_aeskeygenassist_si128 (a3,0x02);
b2 = _mm_aeskeygenassist_si128 (b3,0x02);
KEY_256_ASSIST_1(&a1, &a2);
KEY_256_ASSIST_1(&b1, &b2);
Key_Schedule_a[4]=a1;
Key_Schedule_b[4]=b1;
KEY_256_ASSIST_2(&a1, &a3);
KEY_256_ASSIST_2(&b1, &b3);
Key_Schedule_a[5]=a3;
Key_Schedule_b[5]=b3;
a2 = _mm_aeskeygenassist_si128 (a3,0x04);
b2 = _mm_aeskeygenassist_si128 (b3,0x04);
KEY_256_ASSIST_1(&a1, &a2);
KEY_256_ASSIST_1(&b1, &b2);
Key_Schedule_a[6]=a1;
Key_Schedule_b[6]=b1;
KEY_256_ASSIST_2(&a1, &a3);
KEY_256_ASSIST_2(&b1, &b3);
Key_Schedule_a[7]=a3;
Key_Schedule_b[7]=b3;
a2 = _mm_aeskeygenassist_si128 (a3,0x08);
b2 = _mm_aeskeygenassist_si128 (b3,0x08);
KEY_256_ASSIST_1(&a1, &a2);
KEY_256_ASSIST_1(&b1, &b2);
Key_Schedule_a[8]=a1;
Key_Schedule_b[8]=b1;
KEY_256_ASSIST_2(&a1, &a3);
KEY_256_ASSIST_2(&b1, &b3);
Key_Schedule_a[9]=a3;
Key_Schedule_b[9]=b3;
a2 = _mm_aeskeygenassist_si128 (a3,0x10);
b2 = _mm_aeskeygenassist_si128 (b3,0x10);
KEY_256_ASSIST_1(&a1, &a2);
KEY_256_ASSIST_1(&b1, &b2);
Key_Schedule_a[10]=a1;
Key_Schedule_b[10]=b1;
KEY_256_ASSIST_2(&a1, &a3);
KEY_256_ASSIST_2(&b1, &b3);
Key_Schedule_a[11]=a3;
Key_Schedule_b[11]=b3;
a2 = _mm_aeskeygenassist_si128 (a3,0x20);
b2 = _mm_aeskeygenassist_si128 (b3,0x20);
KEY_256_ASSIST_1(&a1, &a2);
KEY_256_ASSIST_1(&b1, &b2);
Key_Schedule_a[12]=a1;
Key_Schedule_b[12]=b1;
KEY_256_ASSIST_2(&a1, &a3);
KEY_256_ASSIST_2(&b1, &b3);
Key_Schedule_a[13]=a3;
Key_Schedule_b[13]=b3;
a2 = _mm_aeskeygenassist_si128 (a3,0x40);
b2 = _mm_aeskeygenassist_si128 (b3,0x40);
KEY_256_ASSIST_1(&a1, &a2);
KEY_256_ASSIST_1(&b1, &b2);
Key_Schedule_a[14]=a1;
Key_Schedule_b[14]=b1;
}


/* Expand the 256 bit userkey into Key_Schedule, and encrypt two blocks on-the-fly:
 * in1 into _k1, and in2 into _k2
 */

void AES_256_Key_Expansion_and_encryption (__m128i *userkey,
__m128i *Key_Schedule, __m128i in1, __m128i in2, __m128i* _k1, __m128i* _k2)
{
__m128i temp1, temp2, temp3, k1, k2;
temp1 = _mm_loadu_si128((__m128i*)userkey);
temp3 = _mm_loadu_si128((__m128i*)(userkey+1));
Key_Schedule[0] = temp1;
Key_Schedule[1] = temp3;
k1 = _mm_xor_si128(in1,temp1);
k2 = _mm_xor_si128(in2,temp1);
k1 = _mm_aesenc_si128(k1,temp3);
k2 = _mm_aesenc_si128(k2,temp3);
temp2 = _mm_aeskeygenassist_si128 (temp3,0x01);
KEY_256_ASSIST_1(&temp1, &temp2);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
Key_Schedule[2]=temp1;
KEY_256_ASSIST_2(&temp1, &temp3);
k1 = _mm_aesenc_si128(k1,temp3);
k2 = _mm_aesenc_si128(k2,temp3);
Key_Schedule[3]=temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x02);
KEY_256_ASSIST_1(&temp1, &temp2);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
Key_Schedule[4]=temp1;
KEY_256_ASSIST_2(&temp1, &temp3);
k1 = _mm_aesenc_si128(k1,temp3);
k2 = _mm_aesenc_si128(k2,temp3);
Key_Schedule[5]=temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x04);
KEY_256_ASSIST_1(&temp1, &temp2);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
Key_Schedule[6]=temp1;
KEY_256_ASSIST_2(&temp1, &temp3);
k1 = _mm_aesenc_si128(k1,temp3);
k2 = _mm_aesenc_si128(k2,temp3);
Key_Schedule[7]=temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x08);
KEY_256_ASSIST_1(&temp1, &temp2);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
Key_Schedule[8]=temp1;
KEY_256_ASSIST_2(&temp1, &temp3);
k1 = _mm_aesenc_si128(k1,temp3);
k2 = _mm_aesenc_si128(k2,temp3);
Key_Schedule[9]=temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x10);
KEY_256_ASSIST_1(&temp1, &temp2);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
Key_Schedule[10]=temp1;
KEY_256_ASSIST_2(&temp1, &temp3);
k1 = _mm_aesenc_si128(k1,temp3);
k2 = _mm_aesenc_si128(k2,temp3);
Key_Schedule[11]=temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x20);
KEY_256_ASSIST_1(&temp1, &temp2);
k1 = _mm_aesenc_si128(k1,temp1);
k2 = _mm_aesenc_si128(k2,temp1);
Key_Schedule[12]=temp1;
KEY_256_ASSIST_2(&temp1, &temp3);
k1 = _mm_aesenc_si128(k1,temp3);
k2 = _mm_aesenc_si128(k2,temp3);
Key_Schedule[13]=temp3;
temp2 = _mm_aeskeygenassist_si128 (temp3,0x40);
KEY_256_ASSIST_1(&temp1, &temp2);
k1 = _mm_aesenclast_si128(k1,temp1);
k2 = _mm_aesenclast_si128(k2,temp1);
Key_Schedule[14]=temp1;
*_k1=k1;
*_k2=k2;
}

