/* PAEQ-128: optimized (AES-NI) version*/


//#include "crypto_aead.h"
#include "api.h"

#include <stdio.h>
#include <cstdint>
#include <cstring>
#include <stdlib.h>
#include "string.h"
#include "wmmintrin.h"
#include <intrin.h>
#include "emmintrin.h"

#pragma intrinsic(_mm_set_epi64x)

#define D_BYTES 2

#define CRYPTO_MBLOCK (64-D_BYTES-CRYPTO_KEYBYTES)  //46 for 16-byte key
#define CRYPTO_ADBLOCK (64-D_BYTES-2*CRYPTO_KEYBYTES) //30 for 16-byte key
#define CRYPTO_COUNTERBYTES (64-D_BYTES-CRYPTO_KEYBYTES-CRYPTO_NPUBBYTES)  //34 for 16-byte key and 12-byte nonce
#define CRYPTO_LENGTH 12 //Maximal length of plaintext/AD length

#define AES_GROUP_ROUNDS 2
#define AES_GROUPS 10
//#define EXTRANONCE

//This is the implementation of PPAE instantiated with AESQ permutation


//AES S-box
const static unsigned char sbox[256] = {
	//0     1     2     3     4     5     6     7     8     9     A     B     C     D     E     F
	0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76, //0
	0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0, //1
	0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15, //2
	0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75, //3
	0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84, //4
	0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf, //5
	0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8, //6
	0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2, //7
	0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73, //8
	0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb, //9
	0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79, //A
	0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08, //B
	0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a, //C
	0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e, //D
	0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf, //E
	0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16 };

unsigned char mul[256][256]; //GF(256) multiplication table, initialized in Init().

unsigned char Shuffle[16] = { 3, 15, 10, 6, 1, 13, 8, 4, 2, 14, 11, 7, 0, 12, 9, 5 };

void AES_Round(unsigned char* state)  //SubBytes-ShiftRows-MixColumns
{
	unsigned char tmp[4][4];

	for (unsigned i = 0; i<4; ++i)
	{
		for (unsigned j = 0; j<4; ++j)
			tmp[j][i] = state[4 * i + j];//AES state conversion
	}
	for (unsigned i = 0; i<4; ++i)//Columnwise loop
	{
		state[4 * i] = mul[sbox[tmp[0][i]]][2] ^ mul[sbox[tmp[3][(i + 3) % 4]]][1] ^
			mul[sbox[tmp[2][(i + 2) % 4]]][1] ^ mul[sbox[tmp[1][(i + 1) % 4]]][3];
		state[4 * i + 1] = mul[sbox[tmp[1][(i + 1) % 4]]][2] ^ mul[sbox[tmp[0][i]]][1] ^
			mul[sbox[tmp[3][(i + 3) % 4]]][1] ^ mul[sbox[tmp[2][(i + 2) % 4]]][3];
		state[4 * i + 2] = mul[sbox[tmp[2][(i + 2) % 4]]][2] ^ mul[sbox[tmp[1][(i + 1) % 4]]][1] ^
			mul[sbox[tmp[0][i]]][1] ^ mul[sbox[tmp[3][(i + 3) % 4]]][3];
		state[4 * i + 3] = mul[sbox[tmp[3][(i + 3) % 4]]][2] ^ mul[sbox[tmp[2][(i + 2) % 4]]][1] ^
			mul[sbox[tmp[1][(i + 1) % 4]]][1] ^ mul[sbox[tmp[0][i]]][3];
	}

}

void FPerm(const unsigned char* input, unsigned char* output)//AESQ permutation
{

	unsigned char Registers[4][16];  //AES state registers
	unsigned char Registers_tmp[4][16];  //AES state registers

	for (unsigned i = 0; i<4; ++i)//Filling registers
	{
		for (unsigned j = 0; j<16; ++j)
			Registers[i][j] = input[16 * i + j];
	}

	//Main permutation
	for (unsigned i = 0; i<AES_GROUPS; ++i)//Group loop
	{
		//AES rounds
		for (unsigned r = 0; r<4; ++r)//Register loop
		{
			for (unsigned j = 0; j<AES_GROUP_ROUNDS; ++j)//Middle rounds
			{
				AES_Round(Registers[r]); //SB-SR-MC
				for (unsigned k = 0; k<4; ++k)  //Round constants
				{
					Registers[r][4 * k] ^= 8 * i + 4 * j + r + 1;
					//printf("Constant for acc%d: %d\n",r,8*i+4*j+r+1);
				}
			}
		}
		//Permutation
		for (unsigned r = 0; r<4; ++r)//Register loop
		for (unsigned j = 0; j<16; ++j)
			Registers_tmp[r][j] = Registers[r][j];

		for (unsigned r = 0; r<4; ++r)//Register loop
		{
			for (unsigned i = 0; i<4; ++i)//Column loop
			{
				unsigned char r_out = Shuffle[4 * r + i] / 4;  //Register index
				unsigned char c_out = Shuffle[4 * r + i] % 4;  //Column index
				for (unsigned j = 0; j<4; ++j)
					Registers[r_out][4 * c_out + j] = Registers_tmp[r][4 * i + j];
			}
		}


	}
	for (unsigned i = 0; i<4; ++i)//Filling registers
	{
		for (unsigned j = 0; j<16; ++j)
			output[16 * i + j] = Registers[i][j];
	}

}

void DoubleFPermAsm(const __m128i* input1, const __m128i* input2, __m128i* output1, __m128i* output2)//AESQ permutation
{
	//Round Key initialization
	__m128i roundkey0 = _mm_set_epi64x(0x0000000100000001, 0x0000000100000001);
	__m128i roundkey1 = _mm_set_epi64x(0x0000000200000002, 0x0000000200000002);
	__m128i roundkey2 = _mm_set_epi64x(0x0000000300000003, 0x0000000300000003);
	__m128i roundkey3 = _mm_set_epi64x(0x0000000400000004, 0x0000000400000004);
	__m128i roundkeyUpdateConstant = roundkey3;

	__m128i acc0 = input1[0];
	__m128i acc1 = input1[1];
	__m128i acc2 = input1[2];
	__m128i acc3 = input1[3];

	__m128i acc4 = input2[0];
	__m128i acc5 = input2[1];
	__m128i acc6 = input2[2];
	__m128i acc7 = input2[3];
	__m128i mixTmp1, mixTmp2;


	for (unsigned i = 0; i<AES_GROUPS; ++i)
	{
		for (unsigned j = 0; j<AES_GROUP_ROUNDS; ++j)
		{
			//SubRounds
			acc0 = _mm_aesenc_si128(acc0, roundkey0);
			acc1 = _mm_aesenc_si128(acc1, roundkey1);
			acc2 = _mm_aesenc_si128(acc2, roundkey2);
			acc3 = _mm_aesenc_si128(acc3, roundkey3);

			acc4 = _mm_aesenc_si128(acc4, roundkey0);
			acc5 = _mm_aesenc_si128(acc5, roundkey1);
			acc6 = _mm_aesenc_si128(acc6, roundkey2);
			acc7 = _mm_aesenc_si128(acc7, roundkey3);

			//Update Constant
			roundkey0 = _mm_add_epi64(roundkeyUpdateConstant, roundkey0);
			roundkey1 = _mm_add_epi64(roundkeyUpdateConstant, roundkey1);
			roundkey2 = _mm_add_epi64(roundkeyUpdateConstant, roundkey2);
			roundkey3 = _mm_add_epi64(roundkeyUpdateConstant, roundkey3);


		}
		//Mixing
		mixTmp1 = _mm_unpackhi_epi32(acc1, acc0);//INV
		acc0 = _mm_unpacklo_epi32(acc1, acc0);//INV
		acc1 = _mm_unpackhi_epi32(acc3, acc2);//INV
		acc2 = _mm_unpacklo_epi32(acc3, acc2);//INV
		acc3 = _mm_unpackhi_epi32(acc2, acc0);//INV
		acc0 = _mm_unpacklo_epi32(acc2, acc0);//INV
		acc2 = _mm_unpacklo_epi32(mixTmp1, acc1);//INV
		acc1 = _mm_unpackhi_epi32(mixTmp1, acc1);//INV

		mixTmp2 = _mm_unpackhi_epi32(acc5, acc4);//INV
		acc4 = _mm_unpacklo_epi32(acc5, acc4);//INV
		acc5 = _mm_unpackhi_epi32(acc7, acc6);//INV
		acc6 = _mm_unpacklo_epi32(acc7, acc6);//INV
		acc7 = _mm_unpackhi_epi32(acc6, acc4);//INV
		acc4 = _mm_unpacklo_epi32(acc6, acc4);//INV
		acc6 = _mm_unpacklo_epi32(mixTmp2, acc5);//INV
		acc5 = _mm_unpackhi_epi32(mixTmp2, acc5);//INV


	}
	output1[0] = acc0;
	output1[1] = acc1;
	output1[2] = acc2;
	output1[3] = acc3;

	output2[0] = acc4;
	output2[1] = acc5;
	output2[2] = acc6;
	output2[3] = acc7;
}


void FPermAsm(const __m128i* input, __m128i* output)//AESQ permutation
{

	//Round Key initialization
	//Round Key initialization
	__m128i roundkey0 = _mm_set_epi64x(0x0000000100000001, 0x0000000100000001);
	__m128i roundkey1 = _mm_set_epi64x(0x0000000200000002, 0x0000000200000002);
	__m128i roundkey2 = _mm_set_epi64x(0x0000000300000003, 0x0000000300000003);
	__m128i roundkey3 = _mm_set_epi64x(0x0000000400000004, 0x0000000400000004);
	__m128i roundkeyUpdateConstant = roundkey3;

	__m128i acc0 = input[0];
	__m128i acc1 = input[1];
	__m128i acc2 = input[2];
	__m128i acc3 = input[3];
	__m128i mixTmp;


	for (unsigned i = 0; i<AES_GROUPS; ++i)
	{
		for (unsigned j = 0; j<AES_GROUP_ROUNDS; ++j)
		{
			//SubRounds
			acc0 = _mm_aesenc_si128(acc0, roundkey0);
			acc1 = _mm_aesenc_si128(acc1, roundkey1);
			acc2 = _mm_aesenc_si128(acc2, roundkey2);
			acc3 = _mm_aesenc_si128(acc3, roundkey3);

			//Update Constant
			roundkey0 = _mm_add_epi64(roundkeyUpdateConstant, roundkey0);
			roundkey1 = _mm_add_epi64(roundkeyUpdateConstant, roundkey1);
			roundkey2 = _mm_add_epi64(roundkeyUpdateConstant, roundkey2);
			roundkey3 = _mm_add_epi64(roundkeyUpdateConstant, roundkey3);


		}
		//Mixing
		mixTmp = _mm_unpackhi_epi32(acc1, acc0);//INV
		acc0 = _mm_unpacklo_epi32(acc1, acc0);//INV
		acc1 = _mm_unpackhi_epi32(acc3, acc2);//INV
		acc2 = _mm_unpacklo_epi32(acc3, acc2);//INV
		acc3 = _mm_unpackhi_epi32(acc2, acc0);//INV
		acc0 = _mm_unpacklo_epi32(acc2, acc0);//INV
		acc2 = _mm_unpacklo_epi32(mixTmp, acc1);//INV
		acc1 = _mm_unpackhi_epi32(mixTmp, acc1);//INV
	}
	output[0] = acc0;
	output[1] = acc1;
	output[2] = acc2;
	output[3] = acc3;
}

//GF(256) multiplication

unsigned char gmul_o(unsigned char a, unsigned char b) {
	unsigned char p = 0;
	unsigned char counter;
	unsigned char hi_bit_set;
	for (counter = 0; counter < 8; counter++) {
		if ((b & 1) == 1)
			p ^= a;
		hi_bit_set = (a & 0x80);
		a <<= 1;
		if (hi_bit_set == 0x80)
			a ^= 0x1b;
		b >>= 1;
	}
	return p;
}

void Init()
{
	for (unsigned i = 0; i<256; ++i)
	{
		for (unsigned j = 0; j<256; ++j)
			mul[i][j] = gmul_o(i, j);
	}
}


/*Error values: 1 - Invalid clen pointer
2 - Invalid key or ciphertext pointer
3 - Invalid plaintext pointer
4 - Invalid associated data pointer

*/

int GenerateNonceOpt(unsigned char* output, const unsigned char *m, unsigned long long mlen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *k)
	//Generate a nonce as a hash of the plaintext & AD by the AESQ-sponge function
{
	//Does not work for keys longer than 192 bits
	if (CRYPTO_KEYBYTES >24)
	{
		memset(output, 0, CRYPTO_NPUBBYTES);
		return -1;
	}

	__m128i State[4];  //sponge internal state
	__m128i StateOut[4];  //sponge internal state
	State[0] = State[1] = State[2] = State[3] = _mm_set_epi64x(0, 0);
	
	__m128i Injection[2]; //We inject into the first 32 bytes

	//Plaintext length -- 12 bytes and AD length - 12 bytes
	Injection[0] = _mm_set_epi64x(adlen<<32,mlen);
	Injection[1] = _mm_set_epi64x(0, adlen >> 32);  
	

	//Key and nonce length
	__m128i tmp = _mm_set_epi64x(CRYPTO_KEYBYTES + (CRYPTO_NPUBBYTES << 8), 0);
	Injection[1] = _mm_xor_si128(Injection[1], tmp);

	//Add key
	__m128i key = _mm_loadu_si128((__m128i*)k);
	Injection[1] = _mm_xor_si128(Injection[1], _mm_slli_si128(key, 10)); //10 key bytes left

	//Iteration
	State[0] = _mm_xor_si128(State[0], Injection[0]);
	State[1] = _mm_xor_si128(State[1], Injection[1]);
	FPermAsm(State, StateOut);


	//Main loop
	unsigned state_index = 0;
	unsigned long long message_index = 0;
	unsigned long long ad_index = 0;
	unsigned char buf[32];

	//Remaining key bytes
	Injection[0] = _mm_srli_si128(key, CRYPTO_KEYBYTES - 10);
	key = _mm_xor_si128(key, key);
	state_index = CRYPTO_KEYBYTES - 10;

	//Injecting plaintext
	State[0] = _mm_xor_si128(StateOut[0], Injection[0]);

	if (mlen + state_index < 16)//load only to the first register
	{
		memset(buf, 0, 32);
		memcpy(buf,m,mlen);
		Injection[0] = _mm_loadu_si128((__m128i*)buf);
		Injection[0] = _mm_srli_si128(Injection[0], CRYPTO_KEYBYTES - 10);
		state_index += mlen;
	}
	else if (mlen + state_index < 32)//load also to the second register
	{
		memset(buf, 0, 32);
		memcpy(buf, m, mlen);
		Injection[0] = _mm_loadu_si128((__m128i*)buf);
		Injection[0] = _mm_srli_si128(Injection[0], CRYPTO_KEYBYTES - 10);
		Injection[1] = _mm_loadu_si128((__m128i*)(buf+16));
		state_index += mlen;
	}
	else
	{
		memset(buf, 0, 32);
		memcpy(buf, m, 32);
		Injection[0] = _mm_loadu_si128((__m128i*)buf);
		Injection[0] = _mm_srli_si128(Injection[0], CRYPTO_KEYBYTES - 10);
		Injection[1] = _mm_loadu_si128((__m128i*)(buf + 16));
		State[0] = _mm_xor_si128(State[0], Injection[0]);
		State[1] = _mm_xor_si128(StateOut[1], Injection[1]);
		State[2] = StateOut[2];
		State[3] = StateOut[3];
		FPermAsm(State, StateOut);
		message_index += 32 - state_index;
		state_index = 0;
		
		while (mlen - message_index >= 32)
		{
			Injection[0] = _mm_loadu_si128((__m128i*)(m+message_index));
			Injection[1] = _mm_loadu_si128((__m128i*)(m + message_index+16));
			State[0] = _mm_xor_si128(StateOut[0], Injection[0]);
			State[1] = _mm_xor_si128(StateOut[1], Injection[1]);
			State[2] = StateOut[2];
			State[3] = StateOut[3];
			FPermAsm(State, StateOut);
			message_index += 32 - state_index;
			state_index = 0;
		}
		if (mlen - message_index< 16)//load only to the first register
		{
			memset(buf, 0, 32);
			memcpy(buf, m+message_index, mlen-message_index);
			Injection[0] = _mm_loadu_si128((__m128i*)buf);
			state_index += mlen-message_index;
		}
		else if (mlen + state_index < 32)//load also to the second register
		{
			memset(buf, 0, 32);
			memcpy(buf, m + message_index, mlen - message_index);
			Injection[0] = _mm_loadu_si128((__m128i*)buf);
			Injection[1] = _mm_loadu_si128((__m128i*)(buf + 16));
			state_index += mlen - message_index;
		}
		else return -1;
	}//end of plaintext loading
	
	

	
	return 0;

}


int GenerateNonceRef(unsigned char* output, const unsigned char *m, unsigned long long mlen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *k)
	//Generate a nonce as a hash of the plaintext & AD by the AESQ-sponge function
{
	//Does not work for keys longer than 192 bits
	if (CRYPTO_KEYBYTES >24)
	{
		memset(output, 0, CRYPTO_NPUBBYTES);
		return -1;
	}

	unsigned char State[64];
	unsigned char Buffer[CRYPTO_KEYBYTES + 2 + 2 * CRYPTO_LENGTH];
	unsigned char StateOut[64];
	memset(State, 0, 64);

	//Plaintext length
	for (unsigned i = 0; i<CRYPTO_LENGTH; ++i)
		Buffer[i] = (i<sizeof(mlen)) ? (mlen >> (8 * i)) & 0xff : 0;

	//Associated data length
	for (unsigned i = 0; i<CRYPTO_LENGTH; ++i)
		Buffer[i + CRYPTO_LENGTH] = (i<sizeof(adlen)) ? (adlen >> (8 * i)) & 0xff : 0;

	//Key length
	Buffer[2 * CRYPTO_LENGTH] = CRYPTO_KEYBYTES;

	//Nonce length
	Buffer[2 * CRYPTO_LENGTH + 1] = CRYPTO_NPUBBYTES;

	//Add key 
	for (unsigned i = 0; i<CRYPTO_KEYBYTES; ++i)
		Buffer[i + CRYPTO_LENGTH * 2 + 2] = k[i];

	unsigned state_index = 0;
	unsigned long long message_index = 0;
	unsigned long long ad_index = 0;

	for (unsigned i = 0; (i<CRYPTO_KEYBYTES + 2 + 2 * CRYPTO_LENGTH); ++i)//Feeding buffer
	{
		State[state_index] ^= Buffer[i];
		state_index++;
		if (state_index == 64 - 2 * CRYPTO_KEYBYTES)//end of state
		{
			FPerm(State, StateOut);
			state_index = 0;
			for (unsigned j = 0; j<64; ++j) State[j] = StateOut[j];
		}
	}

	while (mlen>0)//Feeding plaintext
	{
		State[state_index] ^= m[message_index];
		state_index++;
		message_index++;
		mlen--;
		if (state_index == 64 - 2 * CRYPTO_KEYBYTES)//end of state
		{
			FPerm(State, StateOut);
			state_index = 0;
			for (unsigned j = 0; j<64; ++j) State[j] = StateOut[j];
		}
	}
	while (adlen>0) //Filling AD
	{
		State[state_index] ^= ad[ad_index];
		state_index++;
		ad_index++;
		adlen--;
		if (state_index == 64 - 2 * CRYPTO_KEYBYTES)//end of state
		{
			FPerm(State, StateOut);
			state_index = 0;
			for (unsigned j = 0; j<64; ++j) State[j] = StateOut[j];
		}
	}
	//end of data
	//Padding 10*1
	State[state_index] ^= 1;
	if (state_index == 64 - 2 * CRYPTO_KEYBYTES)//end of state
	{
		FPerm(State, StateOut);
		state_index = 0;
		for (unsigned j = 0; j<64; ++j) State[j] = StateOut[j];
	}
	while (state_index <63 - 2 * CRYPTO_KEYBYTES)
	{
		State[state_index] ^= 0;
		state_index++;
	}
	State[state_index] ^= 1;//state_index must be =63 - 2*CRYPTO_KEYBYTES
	FPerm(State, StateOut);
	for (unsigned j = 0; j<CRYPTO_NPUBBYTES; ++j)
		output[j] = StateOut[j];

	return 0;

}


int PAEQ128_opt_AESNI_decrypt(unsigned char *m, unsigned long long *mlen,
	const unsigned char *c, unsigned long long clen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k)
{

	if (mlen == NULL)
		return -1;
	if ((clen == 0) && (adlen == 0))
	{
		*mlen = 0;
		return 0;
	}

	(*mlen) = 0;


	//Here we do decryption and/or authentication so we need a key and a ciphertext pointer valid
	if ((k == NULL) || (c == NULL))
		return -2;

	//1.1 Initializing constants
	uint64_t D_left = ((uint64_t)CRYPTO_NPUBBYTES * 8) + (((uint64_t)CRYPTO_KEYBYTES * 8) << 8);
	__m128i D0 = _mm_set_epi64x(0, D_left);
	__m128i D2 = _mm_set_epi64x(0, D_left + 2);
	__m128i D3 = _mm_set_epi64x(0, D_left + 3);
	__m128i one128 = _mm_set_epi64x(0, 1);
	__m128i four128 = _mm_set_epi64x(0, 4);
	__m128i six128 = _mm_set_epi64x(0, 6);
	__m128i counter_one128 = _mm_set_epi64x(0, 1 << 16);  //value to increase the counter
	__m128i Dmask = _mm_set_epi32(0xffffffff, 0xffffffff, 0xffffffff, 0xffff0000);

	//Block variables
	__m128i BlockInput[4];  //V1 - input to the first layer call of F
	__m128i BlockMiddle[4];  //W1 - output of the first layer call of F
	__m128i BlockOutput[4];  //Y1 - output of the second layer call of F

	//Extra variables
	__m128i BlockExtraInput[4];
	__m128i BlockExtraMiddle[4];
	__m128i BlockExtraOutput[4];


	__m128i BlockLastInput[4];  //Z1 - input to the last call of F
	__m128i Tag[4]; //Tag output

	//1.2 Clearing variables
	memset(BlockLastInput, 0, 64);
	memset(BlockInput, 0, 64);
	memset(BlockOutput, 0, 64);
	memset(BlockMiddle, 0, 64);
	memset(BlockMiddle, 0, 64);

	//1.3 Setting first block
	BlockInput[0] = D0;  //Domain separation constant
	uint64_t nonce_low = (*((uint64_t*)npub)) << 32;
	uint64_t nonce_high = *((uint64_t*)(npub + 4));
	BlockInput[2] = _mm_set_epi64x(nonce_high, nonce_low);   //Nonce
	__m128i Key = _mm_set_epi64x(*((uint64_t*)(k + 8)), (*((uint64_t*)k)));
	BlockInput[3] = Key;


	unsigned long long decrypted_bytes = 0;//Encrypted bytes counter


	//Encryption part
	if (clen != 0)
	{
		if (c == NULL)
			return -3;

		while ((clen>CRYPTO_ABYTES))
		{
			/* I. First layer */

			if ((clen < (2 * CRYPTO_MBLOCK + CRYPTO_ABYTES)) || (decrypted_bytes == 0))
			{

				//1. Domain-separation constant
				if (clen < CRYPTO_MBLOCK + CRYPTO_ABYTES) //Last incomplete block
					BlockInput[0] = _mm_add_epi64(BlockInput[0], one128);

				//2. Counter incrementing
				BlockInput[0] = _mm_add_epi64(BlockInput[0], counter_one128);

				//3. Permutation call
				FPermAsm(BlockInput, BlockMiddle); //First layer call to F

				/* II. Encryption*/

				//1. Filling ciphertext buffers
				__m128i ciphertext128[3];
				__m128i plaintext_buffer[3];
				__m128i padding[3];
				__m128i boundary[3];
				memset(ciphertext128, 0, sizeof(__m128i) * 3);
				if (clen >= CRYPTO_MBLOCK + CRYPTO_ABYTES)//Full block encryption
				{
					ciphertext128[0] = D2;
					memcpy(((char*)ciphertext128) + 2, c + decrypted_bytes, CRYPTO_MBLOCK);
					memset(boundary, 0, sizeof(__m128i) * 3);
				}
				else
				{
					ciphertext128[0] = D3;
					memcpy(((char*)ciphertext128) + 2, c + decrypted_bytes, clen - CRYPTO_ABYTES);

					padding[0] = padding[1] = padding[2] = _mm_set1_epi8(clen - CRYPTO_ABYTES);
					boundary[0] = boundary[1] = boundary[2] = _mm_set1_epi8(0xff);
					memset(boundary, 0, clen - CRYPTO_ABYTES + 2);
				}


				//3. Getting plaintext
				plaintext_buffer[0] = _mm_xor_si128(BlockMiddle[0], ciphertext128[0]);
				plaintext_buffer[1] = _mm_xor_si128(BlockMiddle[1], ciphertext128[1]);
				plaintext_buffer[2] = _mm_xor_si128(BlockMiddle[2], ciphertext128[2]);

				if (clen >= CRYPTO_MBLOCK + CRYPTO_ABYTES)
					memcpy(m + decrypted_bytes, ((char*)plaintext_buffer) + 2, CRYPTO_MBLOCK);
				else //Last incomplete block
					memcpy(m + decrypted_bytes, ((char*)plaintext_buffer) + 2, (clen - CRYPTO_ABYTES));
				memset(plaintext_buffer, 0, 6 * sizeof(uint64_t));

				//4. Loading ciphertext
				BlockMiddle[0] = _mm_xor_si128(_mm_andnot_si128(boundary[0], ciphertext128[0]), _mm_and_si128(boundary[0], _mm_xor_si128(BlockMiddle[0], padding[0])));
				BlockMiddle[1] = _mm_xor_si128(_mm_andnot_si128(boundary[1], ciphertext128[1]), _mm_and_si128(boundary[1], _mm_xor_si128(BlockMiddle[1], padding[1])));
				BlockMiddle[2] = _mm_xor_si128(_mm_andnot_si128(boundary[2], ciphertext128[2]), _mm_and_si128(boundary[2], _mm_xor_si128(BlockMiddle[2], padding[2])));

				//III. Second permutation call
				//1. Call
				FPermAsm(BlockMiddle, BlockOutput); //Second layer call to F

				//2. Buffer update: Adding the output to tag preparation buffer
				BlockLastInput[0] = _mm_xor_si128(BlockOutput[0], BlockLastInput[0]);
				BlockLastInput[1] = _mm_xor_si128(BlockOutput[1], BlockLastInput[1]);
				BlockLastInput[2] = _mm_xor_si128(BlockOutput[2], BlockLastInput[2]);

				//Counters increment
				if (clen >= CRYPTO_MBLOCK + CRYPTO_ABYTES)
				{
					decrypted_bytes += CRYPTO_MBLOCK;
					clen -= CRYPTO_MBLOCK;
				}
				else
				{
					decrypted_bytes += (clen - CRYPTO_ABYTES);
					clen = CRYPTO_ABYTES;
				}
				(*mlen) = decrypted_bytes;
			}//end of <138 byte condition


			else //More than 137 bytes to encrypt
			{
				BlockExtraInput[0] = _mm_add_epi64(BlockInput[0], counter_one128);
				BlockInput[0] = _mm_add_epi64(BlockExtraInput[0], counter_one128);
				BlockExtraInput[1] = BlockInput[1];
				BlockExtraInput[2] = BlockInput[2];
				BlockExtraInput[3] = BlockInput[3];

				//2. Two-permutation call
				DoubleFPermAsm(BlockExtraInput, BlockInput, BlockExtraMiddle, BlockMiddle); //First layer call to F


				//3. Preparing plaintext buffer
				__m128i plaintext_buffer[6];  //96-byte storage
				plaintext_buffer[0] = BlockExtraMiddle[0];
				plaintext_buffer[1] = BlockExtraMiddle[1];
				plaintext_buffer[2] = BlockExtraMiddle[2];
				plaintext_buffer[3] = BlockMiddle[0];
				plaintext_buffer[4] = BlockMiddle[1];
				plaintext_buffer[5] = BlockMiddle[2];

				//4.Loading ciphertext
				BlockExtraMiddle[0] = _mm_loadu_si128((__m128i*)(c + decrypted_bytes - 2));   //Bytes [0:13]
				BlockExtraMiddle[1] = _mm_loadu_si128((__m128i*)(c + decrypted_bytes + 14));  //Bytes [14:29]
				BlockExtraMiddle[2] = _mm_loadu_si128((__m128i*)(c + decrypted_bytes + 30));  //Bytes [30:45]
				BlockMiddle[0] = _mm_loadu_si128((__m128i*)(c + decrypted_bytes + 44));  //Bytes [0:13]
				BlockMiddle[1] = _mm_loadu_si128((__m128i*)(c + decrypted_bytes + 60));   //Bytes [14:29]
				BlockMiddle[2] = _mm_loadu_si128((__m128i*)(c + decrypted_bytes + 76));  //Bytes [30:45]

				//5. Preparing the middle layer
				BlockMiddle[0] = _mm_and_si128(BlockMiddle[0], Dmask); //Clearing first two bytes
				BlockExtraMiddle[0] = _mm_and_si128(BlockExtraMiddle[0], Dmask);
				BlockMiddle[0] = _mm_xor_si128(BlockMiddle[0], D2);    //Loading D2
				BlockExtraMiddle[0] = _mm_xor_si128(BlockExtraMiddle[0], D2);

				//6. Getting plaintext
				plaintext_buffer[0] = _mm_xor_si128(plaintext_buffer[0], BlockExtraMiddle[0]);
				plaintext_buffer[1] = _mm_xor_si128(plaintext_buffer[1], BlockExtraMiddle[1]);
				plaintext_buffer[2] = _mm_xor_si128(plaintext_buffer[2], BlockExtraMiddle[2]);
				plaintext_buffer[3] = _mm_xor_si128(plaintext_buffer[3], BlockMiddle[0]);
				plaintext_buffer[4] = _mm_xor_si128(plaintext_buffer[4], BlockMiddle[1]);
				plaintext_buffer[5] = _mm_xor_si128(plaintext_buffer[5], BlockMiddle[2]);
				memcpy(m + decrypted_bytes, ((char*)plaintext_buffer) + 2, CRYPTO_MBLOCK);
				memcpy(m + decrypted_bytes + 46, ((char*)plaintext_buffer) + 50, CRYPTO_MBLOCK);

				//7. Second layer permutation
				DoubleFPermAsm(BlockExtraMiddle, BlockMiddle, BlockExtraOutput, BlockOutput); //Second layer call to F

				//8. Buffer update: Adding the output to tag preparation buffer
				BlockLastInput[0] = _mm_xor_si128(BlockOutput[0], BlockLastInput[0]);
				BlockLastInput[1] = _mm_xor_si128(BlockOutput[1], BlockLastInput[1]);
				BlockLastInput[2] = _mm_xor_si128(BlockOutput[2], BlockLastInput[2]);
				BlockLastInput[0] = _mm_xor_si128(BlockExtraOutput[0], BlockLastInput[0]);
				BlockLastInput[1] = _mm_xor_si128(BlockExtraOutput[1], BlockLastInput[1]);
				BlockLastInput[2] = _mm_xor_si128(BlockExtraOutput[2], BlockLastInput[2]);


				//9.Counter update
				decrypted_bytes += 2 * CRYPTO_MBLOCK;
				clen -= 2 * CRYPTO_MBLOCK;
				(*mlen) = decrypted_bytes;
			}


		}//end of encryption loop
	}//end of encryption part

	//Clearing variables
	for (unsigned i = 0; i < 4; ++i)
	{
		BlockInput[i] = _mm_xor_si128(BlockInput[i], BlockInput[i]);
		BlockMiddle[i] = _mm_xor_si128(BlockMiddle[i], BlockMiddle[i]);
		BlockOutput[i] = _mm_xor_si128(BlockOutput[i], BlockOutput[i]);

		BlockExtraInput[i] = _mm_xor_si128(BlockExtraInput[i], BlockExtraInput[i]);
		BlockExtraMiddle[i] = _mm_xor_si128(BlockExtraMiddle[i], BlockExtraMiddle[i]);
		BlockExtraOutput[i] = _mm_xor_si128(BlockExtraOutput[i], BlockExtraOutput[i]);
	}



	//Associated data part	  
	if (adlen != 0)
	{
		if (ad == NULL)
		{
			for (unsigned i = 0; i < 4; ++i)
				BlockLastInput[i] = _mm_xor_si128(BlockLastInput[i], BlockLastInput[i]);
			Key = _mm_xor_si128(Key, Key);
			return -4;
		}

		unsigned long long adblock_counter = 1;   //AD block counter
		unsigned long long auth_bytes = 0;

		//Preparing the block
		BlockInput[0] = _mm_add_epi64(D0, four128);
		BlockInput[3] = Key;
		while (adlen>0)
		{
			if ((adlen <= (2 * CRYPTO_ADBLOCK)) || (auth_bytes == 0))
			{

				//1. Constant
				if (adlen < CRYPTO_ADBLOCK)
					BlockInput[0] = _mm_add_epi64(BlockInput[0], one128);


				//2. Counter
				BlockInput[0] = _mm_add_epi64(BlockInput[0], counter_one128);

				//3. AD block

				//3.1 Filling AD buffers
				uint64_t ad_buffer[4];
				ad_buffer[0] = 0;
				if (adlen >= CRYPTO_ADBLOCK)//Full block encryption
					memcpy(((char*)ad_buffer) + 2, ad + auth_bytes, CRYPTO_ADBLOCK);
				else
				{
					//Filling buffers with adlen
					ad_buffer[0] = ((uint64_t)adlen * 0x01010000) ^ (((uint64_t)adlen * 0x01010101) << 32);
					for (unsigned i = 1; i < 4; ++i)
						ad_buffer[i] = (((uint64_t)adlen * 0x01010101) << 32) ^ ((uint64_t)adlen * 0x01010101);
					memcpy(((char*)ad_buffer) + 2, ad + auth_bytes, adlen);
				}

				//3.2 Working with BlockInput
				BlockInput[1] = _mm_set_epi64x(ad_buffer[1], ad_buffer[0]);
				BlockInput[2] = _mm_set_epi64x(ad_buffer[3], ad_buffer[2]);


				//4.Call to the F permutation
				FPermAsm(BlockInput, BlockOutput);//Call to the F permutation

				//Adding the output to tag preparation buffer
				BlockLastInput[0] = _mm_xor_si128(BlockOutput[0], BlockLastInput[0]);
				BlockLastInput[1] = _mm_xor_si128(BlockOutput[1], BlockLastInput[1]);
				BlockLastInput[2] = _mm_xor_si128(BlockOutput[2], BlockLastInput[2]);


				//Counters increment
				adblock_counter++;
				if (adlen >= CRYPTO_ADBLOCK)
				{
					auth_bytes += CRYPTO_ADBLOCK;
					adlen -= CRYPTO_ADBLOCK;
				}
				else
				{
					auth_bytes += adlen;
					adlen = 0;
				}
			}//end of 60-byte condition
			else //We authenticate 60-byte chunks
			{

				//1.Preparing input
				BlockExtraInput[0] = _mm_add_epi64(BlockInput[0], counter_one128);
				BlockInput[0] = _mm_add_epi64(BlockExtraInput[0], counter_one128);
				BlockExtraInput[3] = BlockInput[3]; //Key is constant

				//2. Loading AD
				BlockExtraInput[1] = _mm_loadu_si128((__m128i*)(ad + auth_bytes - 2));   //Bytes [0:13]
				BlockExtraInput[1] = _mm_and_si128(BlockExtraInput[1], Dmask); //Clearing first two bytes
				BlockExtraInput[2] = _mm_loadu_si128((__m128i*)(ad + auth_bytes + 14));  //Bytes [14:29]
				BlockInput[1] = _mm_loadu_si128((__m128i*)(ad + auth_bytes + 28));  //Bytes [0:13]
				BlockInput[1] = _mm_and_si128(BlockInput[1], Dmask); //Clearing first two bytes
				BlockInput[2] = _mm_loadu_si128((__m128i*)(ad + auth_bytes + 44));  //Bytes [14:29]

				//3. Call to the permutation
				DoubleFPermAsm(BlockExtraInput, BlockInput, BlockExtraOutput, BlockOutput);

				//4. Buffer update: Adding the output to tag preparation buffer
				BlockLastInput[0] = _mm_xor_si128(BlockOutput[0], BlockLastInput[0]);
				BlockLastInput[1] = _mm_xor_si128(BlockOutput[1], BlockLastInput[1]);
				BlockLastInput[2] = _mm_xor_si128(BlockOutput[2], BlockLastInput[2]);
				BlockLastInput[0] = _mm_xor_si128(BlockExtraOutput[0], BlockLastInput[0]);
				BlockLastInput[1] = _mm_xor_si128(BlockExtraOutput[1], BlockLastInput[1]);
				BlockLastInput[2] = _mm_xor_si128(BlockExtraOutput[2], BlockLastInput[2]);

				//5. Counter update
				auth_bytes += 2 * CRYPTO_ADBLOCK;
				adlen -= 2 * CRYPTO_ADBLOCK;
			}
		}//end of AD loop
	}//end of AD part

	// Tag production 
	BlockLastInput[3] = Key;
	BlockLastInput[0] = _mm_and_si128(BlockLastInput[0], Dmask); //Clearing first two bytes
	BlockLastInput[0] = _mm_add_epi64(BlockLastInput[0], six128);
	BlockLastInput[0] = _mm_add_epi64(BlockLastInput[0], D0);

	//1. Permutation call
	FPermAsm(BlockLastInput, Tag);
	//2. Key injection
	Tag[3] = _mm_xor_si128(Tag[3], Key);

	//3. Clearing variables
	for (unsigned i = 0; i < 4; ++i)
	{
		BlockInput[i] = _mm_xor_si128(BlockInput[i], BlockInput[i]);
		BlockMiddle[i] = _mm_xor_si128(BlockMiddle[i], BlockMiddle[i]);
		BlockOutput[i] = _mm_xor_si128(BlockOutput[i], BlockOutput[i]);

		BlockExtraInput[i] = _mm_xor_si128(BlockExtraInput[i], BlockExtraInput[i]);
		BlockExtraMiddle[i] = _mm_xor_si128(BlockExtraMiddle[i], BlockExtraMiddle[i]);
		BlockExtraOutput[i] = _mm_xor_si128(BlockExtraOutput[i], BlockExtraOutput[i]);
		BlockLastInput[i] = _mm_xor_si128(BlockLastInput[i], BlockLastInput[i]);
	}
	Key = _mm_xor_si128(Key, Key);

	//4. Checking tag
	__m128i ciphertext_tag = _mm_loadu_si128((__m128i*)(c + (*mlen)));
	ciphertext_tag = _mm_xor_si128(ciphertext_tag, Tag[0]);
	uint32_t* test = (uint32_t*)(&ciphertext_tag);

	if ((test[0] == 0) && (test[1] == 0) && (test[2] == 0) && (test[3] == 0))
		return 0;
	else return -1;
}

int AESQ_CTR(
	unsigned char *c, unsigned long long *clen,
	const unsigned char *m, unsigned long long mlen,
	const unsigned char *npub,
	const unsigned char *k
	)
{
	__m128i BlockInput1[4];
	__m128i BlockInput2[4];
	__m128i BlockOutput1[4];
	__m128i BlockOutput2[4];
	__m128i plaintext1[4];
	__m128i plaintext2[4];
	__m128i ciphertext1[4];
	__m128i ciphertext2[4];

	__m128i one128 = _mm_set_epi64x(0, 1);
	__m128i two128 = _mm_set_epi64x(0, 2);

	memset(BlockInput1, 0, 64);
	memset(BlockInput2, 0, 64);
	memcpy(BlockInput1, npub, CRYPTO_NPUBBYTES);
	memcpy(BlockInput2, npub, CRYPTO_NPUBBYTES);
	memcpy(BlockInput1, k, CRYPTO_KEYBYTES);
	memcpy(BlockInput2, k, CRYPTO_KEYBYTES);
	BlockInput2[1] = _mm_add_epi64(BlockInput1[1], one128);

	unsigned long encrypted_bytes = 0;
	while (mlen >= 128)
	{
		DoubleFPermAsm(BlockInput1, BlockInput2, BlockOutput1, BlockOutput2);
		BlockInput1[1] = _mm_add_epi64(BlockInput1[1], two128);
		BlockInput2[1] = _mm_add_epi64(BlockInput2[1], two128);
		plaintext1[0] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes));
		plaintext1[1] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes + 16));
		plaintext1[2] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes + 32));
		plaintext1[3] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes + 48));
		plaintext2[0] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes + 64));
		plaintext2[1] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes + 80));
		plaintext2[2] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes + 96));
		plaintext2[3] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes + 112));
		ciphertext1[0] = _mm_xor_si128(plaintext1[0], BlockOutput1[0]);
		ciphertext1[1] = _mm_xor_si128(plaintext1[1], BlockOutput1[1]);
		ciphertext1[2] = _mm_xor_si128(plaintext1[2], BlockOutput1[2]);
		ciphertext1[3] = _mm_xor_si128(plaintext1[3], BlockOutput1[3]);
		ciphertext2[0] = _mm_xor_si128(plaintext2[0], BlockOutput2[0]);
		ciphertext2[1] = _mm_xor_si128(plaintext2[1], BlockOutput2[1]);
		ciphertext2[2] = _mm_xor_si128(plaintext2[2], BlockOutput2[2]);
		ciphertext2[3] = _mm_xor_si128(plaintext2[3], BlockOutput2[3]);
		_mm_storeu_si128((__m128i*)(c + encrypted_bytes), ciphertext1[0]);
		_mm_storeu_si128((__m128i*)(c + encrypted_bytes + 16), ciphertext1[1]);
		_mm_storeu_si128((__m128i*)(c + encrypted_bytes + 32), ciphertext1[2]);
		_mm_storeu_si128((__m128i*)(c + encrypted_bytes + 48), ciphertext1[3]);
		_mm_storeu_si128((__m128i*)(c + encrypted_bytes + 64), ciphertext2[0]);
		_mm_storeu_si128((__m128i*)(c + encrypted_bytes + 80), ciphertext2[1]);
		_mm_storeu_si128((__m128i*)(c + encrypted_bytes + 96), ciphertext2[2]);
		_mm_storeu_si128((__m128i*)(c + encrypted_bytes + 112), ciphertext2[3]);

		mlen -= 128;
		encrypted_bytes += 128;
	}

	return 0;

}

int PAEQ128_opt_AESNI_encrypt(
	unsigned char *c, unsigned long long *clen,
	const unsigned char *m, unsigned long long mlen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k
	)

{

	if (clen == NULL)
		return -1;
	if ((mlen == 0) && (adlen == 0))
	{
		*clen = 0;
		return 0;
	}

	//Assume that we do encryption and/or authentication so we need a key and a ciphertext pointer valid
	if ((k == NULL) || (c == NULL))
		return -2;

	if (npub == NULL)
		return -7;

	//1.1 Initializing constants
	uint64_t D_left = ((uint64_t)CRYPTO_NPUBBYTES * 8) + (((uint64_t)CRYPTO_KEYBYTES * 8) << 8);
	__m128i D0 = _mm_set_epi64x(0, D_left);
	__m128i D2 = _mm_set_epi64x(0, D_left + 2);
	__m128i one128 = _mm_set_epi64x(0, 1);
	__m128i four128 = _mm_set_epi64x(0, 4);
	__m128i six128 = _mm_set_epi64x(0, 6);
	__m128i counter_one128 = _mm_set_epi64x(0, 1 << 16);  //value to increase the counter
	__m128i Dmask = _mm_set_epi32(0xffffffff, 0xffffffff, 0xffffffff, 0xffff0000);
	(*clen) = 0;

	//Block variables
	__m128i BlockInput[4];  //V1 - input to the first layer call of F
	__m128i BlockMiddle[4];  //W1 - output of the first layer call of F
	__m128i BlockOutput[4];  //Y1 - output of the second layer call of F

	//Extra variables
	__m128i BlockExtraInput[4];
	__m128i BlockExtraMiddle[4];
	__m128i BlockExtraOutput[4];


	__m128i BlockLastInput[4];  //Z1 - input to the last call of F
	__m128i Tag[4]; //Tag output

	//1.2 Clearing variables
	memset(BlockLastInput, 0, 64);
	memset(BlockInput, 0, 64);
	memset(BlockOutput, 0, 64);
	memset(BlockMiddle, 0, 64);
	memset(BlockMiddle, 0, 64);

	//1.3 Setting first block
	BlockInput[0] = D0;  //Domain separation constant
	uint64_t nonce_low = (*((uint64_t*)npub)) << 32;
	uint64_t nonce_high = *((uint64_t*)(npub + 4));
	BlockInput[2] = _mm_set_epi64x(nonce_high, nonce_low);   //Nonce
	__m128i Key = _mm_set_epi64x(*((uint64_t*)(k + 8)), (*((uint64_t*)k)));
	BlockInput[3] = Key;


	unsigned long long encrypted_bytes = 0;//Encrypted bytes counter


	//Encryption part
	if (mlen != 0)
	{
		if (m == NULL)
			return -3;

		while ((mlen>0))
		{
			/* I. First layer */

			if ((mlen < 2 * CRYPTO_MBLOCK) || (encrypted_bytes == 0))
			{

				//1. Domain-separation constant
				if (mlen < CRYPTO_MBLOCK) //Last incomplete block
					BlockInput[0] = _mm_add_epi64(BlockInput[0], one128);

				//2. Counter incrementing
				BlockInput[0] = _mm_add_epi64(BlockInput[0], counter_one128);

				//3. Permutation call
				FPermAsm(BlockInput, BlockMiddle); //First layer call to F

				/* II. Encryption*/

				//1. Filling plaintext buffers
				__m128i plaintext128[3];
				uint64_t plaintext_buffer[6];
				uint64_t ciphertext_buffer[6];
				plaintext_buffer[0] = D_left + 2; //Making D2
				if (mlen >= CRYPTO_MBLOCK)//Full block encryption
					memcpy(((char*)plaintext_buffer) + 2, m + encrypted_bytes, CRYPTO_MBLOCK);
				else
				{
					plaintext_buffer[0]++; //Making D3
					//Filling buffers with mlen
					plaintext_buffer[0] ^= (((uint64_t)mlen * 0x01010101) << 32) ^ ((uint64_t)mlen * 0x01010000);
					for (unsigned i = 1; i < 6; ++i)
						plaintext_buffer[i] = (((uint64_t)mlen * 0x01010101) << 32) ^ ((uint64_t)mlen * 0x01010101);
					memcpy(((char*)plaintext_buffer) + 2, m + encrypted_bytes, mlen);
				}

				//2. Working with BlockMiddle
				plaintext128[0] = _mm_set_epi64x(plaintext_buffer[1], plaintext_buffer[0]);
				plaintext128[1] = _mm_set_epi64x(plaintext_buffer[3], plaintext_buffer[2]);
				plaintext128[2] = _mm_set_epi64x(plaintext_buffer[5], plaintext_buffer[4]);

				BlockMiddle[0] = _mm_and_si128(BlockMiddle[0], Dmask); //Clearing first two bytes
				BlockMiddle[0] = _mm_xor_si128(BlockMiddle[0], plaintext128[0]);
				BlockMiddle[1] = _mm_xor_si128(BlockMiddle[1], plaintext128[1]);
				BlockMiddle[2] = _mm_xor_si128(BlockMiddle[2], plaintext128[2]);

				//Ciphertext extraction
				ciphertext_buffer[0] = _mm_extract_epi64(BlockMiddle[0], 0);
				ciphertext_buffer[1] = _mm_extract_epi64(BlockMiddle[0], 1);
				ciphertext_buffer[2] = _mm_extract_epi64(BlockMiddle[1], 0);
				ciphertext_buffer[3] = _mm_extract_epi64(BlockMiddle[1], 1);
				ciphertext_buffer[4] = _mm_extract_epi64(BlockMiddle[2], 0);
				ciphertext_buffer[5] = _mm_extract_epi64(BlockMiddle[2], 1);

				if (mlen >= CRYPTO_MBLOCK)
					memcpy(c + encrypted_bytes, ((char*)ciphertext_buffer) + 2, CRYPTO_MBLOCK);
				else //Last incomplete block
					memcpy(c + encrypted_bytes, ((char*)ciphertext_buffer) + 2, mlen);
				memset(ciphertext_buffer, 0, 6 * sizeof(uint64_t));

				//Counters increment
				if (mlen >= CRYPTO_MBLOCK)
				{
					encrypted_bytes += CRYPTO_MBLOCK;
					mlen -= CRYPTO_MBLOCK;
				}
				else
				{
					encrypted_bytes += mlen;
					mlen = 0;
				}
				(*clen) = encrypted_bytes;

				//III. Second permutation call
				//1. Call
				FPermAsm(BlockMiddle, BlockOutput); //Second layer call to F

				//2. Buffer update: Adding the output to tag preparation buffer
				BlockLastInput[0] = _mm_xor_si128(BlockOutput[0], BlockLastInput[0]);
				BlockLastInput[1] = _mm_xor_si128(BlockOutput[1], BlockLastInput[1]);
				BlockLastInput[2] = _mm_xor_si128(BlockOutput[2], BlockLastInput[2]);
			}//end of <138 byte condition


			else //More than 137 bytes to encrypt
			{
				BlockExtraInput[0] = _mm_add_epi64(BlockInput[0], counter_one128);
				BlockInput[0] = _mm_add_epi64(BlockExtraInput[0], counter_one128);
				BlockExtraInput[1] = BlockInput[1];
				BlockExtraInput[2] = BlockInput[2];
				BlockExtraInput[3] = BlockInput[3];

				//2. Two-permutation call
				DoubleFPermAsm(BlockExtraInput, BlockInput, BlockExtraMiddle, BlockMiddle); //First layer call to F


				//3. Loading plaintext
				__m128i plaintext_buffer[6];  //96-byte storage
				plaintext_buffer[0] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes - 2));   //Bytes [0:13]
				plaintext_buffer[1] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes + 14));  //Bytes [14:29]
				plaintext_buffer[2] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes + 30));  //Bytes [30:45]
				plaintext_buffer[3] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes + 44));  //Bytes [0:13]
				plaintext_buffer[4] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes + 60));   //Bytes [14:29]
				plaintext_buffer[5] = _mm_loadu_si128((__m128i*)(m + encrypted_bytes + 76));  //Bytes [30:45]

				//4. Preparing the middle layer
				BlockMiddle[0] = _mm_and_si128(BlockMiddle[0], Dmask); //Clearing first two bytes
				BlockExtraMiddle[0] = _mm_and_si128(BlockExtraMiddle[0], Dmask);
				BlockMiddle[0] = _mm_xor_si128(BlockMiddle[0], D2);    //Loading D2
				BlockExtraMiddle[0] = _mm_xor_si128(BlockExtraMiddle[0], D2);

				//5. Xoring plaintext
				plaintext_buffer[0] = _mm_and_si128(plaintext_buffer[0], Dmask); //Clearing first two bytes
				plaintext_buffer[3] = _mm_and_si128(plaintext_buffer[3], Dmask); //Clearing first two bytes
				BlockExtraMiddle[0] = _mm_xor_si128(BlockExtraMiddle[0], plaintext_buffer[0]);
				BlockExtraMiddle[1] = _mm_xor_si128(BlockExtraMiddle[1], plaintext_buffer[1]);
				BlockExtraMiddle[2] = _mm_xor_si128(BlockExtraMiddle[2], plaintext_buffer[2]);
				BlockMiddle[0] = _mm_xor_si128(BlockMiddle[0], plaintext_buffer[3]);
				BlockMiddle[1] = _mm_xor_si128(BlockMiddle[1], plaintext_buffer[4]);
				BlockMiddle[2] = _mm_xor_si128(BlockMiddle[2], plaintext_buffer[5]);

				//6. Extracting ciphertext
				memcpy(c + encrypted_bytes, ((char*)BlockExtraMiddle) + 2, CRYPTO_MBLOCK);
				memcpy(c + encrypted_bytes + 46, ((char*)BlockMiddle) + 2, CRYPTO_MBLOCK);

				//7. Second layer permutation
				DoubleFPermAsm(BlockExtraMiddle, BlockMiddle, BlockExtraOutput, BlockOutput); //Second layer call to F

				//8. Buffer update: Adding the output to tag preparation buffer
				BlockLastInput[0] = _mm_xor_si128(BlockOutput[0], BlockLastInput[0]);
				BlockLastInput[1] = _mm_xor_si128(BlockOutput[1], BlockLastInput[1]);
				BlockLastInput[2] = _mm_xor_si128(BlockOutput[2], BlockLastInput[2]);
				BlockLastInput[0] = _mm_xor_si128(BlockExtraOutput[0], BlockLastInput[0]);
				BlockLastInput[1] = _mm_xor_si128(BlockExtraOutput[1], BlockLastInput[1]);
				BlockLastInput[2] = _mm_xor_si128(BlockExtraOutput[2], BlockLastInput[2]);


				//9.Counter update
				encrypted_bytes += 2 * CRYPTO_MBLOCK;
				mlen -= 2 * CRYPTO_MBLOCK;
				(*clen) = encrypted_bytes;
			}


		}//end of encryption loop
	}//end of encryption part

	//Clearing variables
	for (unsigned i = 0; i < 4; ++i)
	{
		BlockInput[i] = _mm_xor_si128(BlockInput[i], BlockInput[i]);
		BlockMiddle[i] = _mm_xor_si128(BlockMiddle[i], BlockMiddle[i]);
		BlockOutput[i] = _mm_xor_si128(BlockOutput[i], BlockOutput[i]);

		BlockExtraInput[i] = _mm_xor_si128(BlockExtraInput[i], BlockExtraInput[i]);
		BlockExtraMiddle[i] = _mm_xor_si128(BlockExtraMiddle[i], BlockExtraMiddle[i]);
		BlockExtraOutput[i] = _mm_xor_si128(BlockExtraOutput[i], BlockExtraOutput[i]);
	}



	//Associated data part	  
	if (adlen != 0)
	{
		if (ad == NULL)
		{
			for (unsigned i = 0; i < 4; ++i)
				BlockLastInput[i] = _mm_xor_si128(BlockLastInput[i], BlockLastInput[i]);
			Key = _mm_xor_si128(Key, Key);
			return -4;
		}

		unsigned long long adblock_counter = 1;   //AD block counter
		unsigned long long auth_bytes = 0;

		//Preparing the block
		BlockInput[0] = _mm_add_epi64(D0, four128);
		BlockInput[3] = Key;
		while (adlen>0)
		{
			if ((adlen <= (2 * CRYPTO_ADBLOCK)) || (auth_bytes == 0))
			{

				//1. Constant
				if (adlen < CRYPTO_ADBLOCK)
					BlockInput[0] = _mm_add_epi64(BlockInput[0], one128);


				//2. Counter
				BlockInput[0] = _mm_add_epi64(BlockInput[0], counter_one128);

				//3. AD block

				//3.1 Filling AD buffers
				uint64_t ad_buffer[4];
				ad_buffer[0] = 0;
				if (adlen >= CRYPTO_ADBLOCK)//Full block encryption
					memcpy(((char*)ad_buffer) + 2, ad + auth_bytes, CRYPTO_ADBLOCK);
				else
				{
					//Filling buffers with adlen
					ad_buffer[0] = ((uint64_t)adlen * 0x01010000)^ (((uint64_t)adlen * 0x01010101) << 32);
					for (unsigned i = 1; i < 4; ++i)
						ad_buffer[i] = (((uint64_t)adlen * 0x01010101) << 32) ^ ((uint64_t)adlen * 0x01010101);
					memcpy(((char*)ad_buffer) + 2, ad + auth_bytes, adlen);
				}

				//3.2 Working with BlockInput
				BlockInput[1] = _mm_set_epi64x(ad_buffer[1], ad_buffer[0]);
				BlockInput[2] = _mm_set_epi64x(ad_buffer[3], ad_buffer[2]);


				//4.Call to the F permutation
				FPermAsm(BlockInput, BlockOutput);//Call to the F permutation

				//Adding the output to tag preparation buffer
				BlockLastInput[0] = _mm_xor_si128(BlockOutput[0], BlockLastInput[0]);
				BlockLastInput[1] = _mm_xor_si128(BlockOutput[1], BlockLastInput[1]);
				BlockLastInput[2] = _mm_xor_si128(BlockOutput[2], BlockLastInput[2]);


				//Counters increment
				adblock_counter++;
				if (adlen >= CRYPTO_ADBLOCK)
				{
					auth_bytes += CRYPTO_ADBLOCK;
					adlen -= CRYPTO_ADBLOCK;
				}
				else
				{
					auth_bytes += adlen;
					adlen = 0;
				}
			}//end of 60-byte condition
			else //We authenticate 60-byte chunks
			{

				//1.Preparing input
				BlockExtraInput[0] = _mm_add_epi64(BlockInput[0], counter_one128);
				BlockInput[0] = _mm_add_epi64(BlockExtraInput[0], counter_one128);
				BlockExtraInput[3] = BlockInput[3]; //Key is constant

				//2. Loading AD
				BlockExtraInput[1] = _mm_loadu_si128((__m128i*)(ad + auth_bytes - 2));   //Bytes [0:13]
				BlockExtraInput[1] = _mm_and_si128(BlockExtraInput[1], Dmask); //Clearing first two bytes
				BlockExtraInput[2] = _mm_loadu_si128((__m128i*)(ad + auth_bytes + 14));  //Bytes [14:29]
				BlockInput[1] = _mm_loadu_si128((__m128i*)(ad + auth_bytes + 28));  //Bytes [0:13]
				BlockInput[1] = _mm_and_si128(BlockInput[1], Dmask); //Clearing first two bytes
				BlockInput[2] = _mm_loadu_si128((__m128i*)(ad + auth_bytes + 44));  //Bytes [14:29]

				//3. Call to the permutation
				DoubleFPermAsm(BlockExtraInput, BlockInput, BlockExtraOutput, BlockOutput);

				//4. Buffer update: Adding the output to tag preparation buffer
				BlockLastInput[0] = _mm_xor_si128(BlockOutput[0], BlockLastInput[0]);
				BlockLastInput[1] = _mm_xor_si128(BlockOutput[1], BlockLastInput[1]);
				BlockLastInput[2] = _mm_xor_si128(BlockOutput[2], BlockLastInput[2]);
				BlockLastInput[0] = _mm_xor_si128(BlockExtraOutput[0], BlockLastInput[0]);
				BlockLastInput[1] = _mm_xor_si128(BlockExtraOutput[1], BlockLastInput[1]);
				BlockLastInput[2] = _mm_xor_si128(BlockExtraOutput[2], BlockLastInput[2]);

				//5. Counter update
				auth_bytes += 2 * CRYPTO_ADBLOCK;
				adlen -= 2 * CRYPTO_ADBLOCK;
			}
		}//end of AD loop
	}//end of AD part

	// Tag production 
	BlockLastInput[3] = Key;
	BlockLastInput[0] = _mm_and_si128(BlockLastInput[0], Dmask); //Clearing first two bytes
	BlockLastInput[0] = _mm_add_epi64(BlockLastInput[0], six128);
	BlockLastInput[0] = _mm_add_epi64(BlockLastInput[0], D0);

	//1. Permutation call
	FPermAsm(BlockLastInput, Tag);
	//2. Key injection

	Tag[3] = _mm_xor_si128(Tag[3], Key);

	//3. Truncation
	memcpy(c + (*clen), Tag, CRYPTO_ABYTES);
	*clen += CRYPTO_ABYTES;


	//Clearing variables
	for (unsigned i = 0; i < 4; ++i)
	{
		BlockInput[i] = _mm_xor_si128(BlockInput[i], BlockInput[i]);
		BlockMiddle[i] = _mm_xor_si128(BlockMiddle[i], BlockMiddle[i]);
		BlockOutput[i] = _mm_xor_si128(BlockOutput[i], BlockOutput[i]);

		BlockExtraInput[i] = _mm_xor_si128(BlockExtraInput[i], BlockExtraInput[i]);
		BlockExtraMiddle[i] = _mm_xor_si128(BlockExtraMiddle[i], BlockExtraMiddle[i]);
		BlockExtraOutput[i] = _mm_xor_si128(BlockExtraOutput[i], BlockExtraOutput[i]);
		BlockLastInput[i] = _mm_xor_si128(BlockLastInput[i], BlockLastInput[i]);
	}
	Key = _mm_xor_si128(Key, Key);



	return 0;
}


int crypto_aead_encrypt(
	unsigned char *c, unsigned long long *clen,
	const unsigned char *m, unsigned long long mlen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
	)

{
	return PAEQ128_opt_AESNI_encrypt(c, clen, m, mlen, ad, adlen, npub, k);
}

int crypto_aead_encrypt_no_nonce(
	unsigned char *c, unsigned long long *clen,
	const unsigned char *m, unsigned long long mlen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *nsec,
	unsigned char *npub,
	const unsigned char *k
	)
	//Generates nonce out of plaintext and AD and put it into npub

{
	GenerateNonceOpt(npub, m, mlen, ad, adlen, k);
	return PAEQ128_opt_AESNI_encrypt(c, clen, m, mlen, ad, adlen, npub, k);
}

int crypto_aead_encrypt_no_nonce_old(
	unsigned char *c, unsigned long long *clen,
	const unsigned char *m, unsigned long long mlen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *nsec,
	unsigned char *npub,
	const unsigned char *k
	)
{
	Init();//Initializing GF(256) multiplication table for AES

	if (clen == NULL)
		return -1;
	if ((mlen == 0) && (adlen == 0))
	{
		*clen = 0;
		return 0;
	}

	//Assume that we do encryption and/or authentication so we need a key and a ciphertext pointer valid
	if ((k == NULL) || (c == NULL))
		return -2;

	GenerateNonceOpt(npub, m, mlen, ad, adlen, k);

	//Initializing constants
	unsigned char D0[2];
	D0[0] = CRYPTO_NPUBBYTES * 8; //nonce length in bits, zero for 256-bit nonce
	D0[1] = CRYPTO_KEYBYTES * 8; //key length in bits
	(*clen) = 0;

	//Block variables
	unsigned char BlockInput[64];  //V1 - input to the first layer call of F
	unsigned char BlockMiddle[64];  //W1 - output of the first layer call of F
	unsigned char BlockOutput[64];  //Y1 - output of the second layer call of F

	unsigned char BlockLastInput[64];  //Z1 - input to the last call of F
	memset(BlockLastInput, 0, 64);
	unsigned char Tag[64]; //Tag output

	unsigned long long encrypted_bytes = 0;//Encrypted bytes counter


	//Encryption part
	if (mlen != 0)
	{
		if (m == NULL)
		{
			//Clearing variables
			for (unsigned i = 0; i<64; ++i)
				BlockInput[i] = BlockMiddle[i] = BlockOutput[i] = BlockLastInput[i] = 0;
			return -3;
		}

		unsigned long long mblock_counter = 1;   //Message block counter

		while ((mlen>0))
		{
			/* I. First layer */

			//1. Domain-separation constant
			BlockInput[1] = D0[1];
			if (mlen >= CRYPTO_MBLOCK)
				BlockInput[0] = D0[0];
			else //Last incomplete block
				BlockInput[0] = D0[0] + 1;

			//2. Counter
			for (unsigned i = 0; i<CRYPTO_COUNTERBYTES; ++i)
			{
				BlockInput[i + 2] = (i<sizeof(mblock_counter)) ? (mblock_counter >> (8 * i)) & 0xff : 0;//copying counter bytewise
			}

			//3. Nonce
			for (unsigned i = 0; i<CRYPTO_NPUBBYTES; ++i)
			{
				BlockInput[i + 2 + CRYPTO_COUNTERBYTES] = npub[i];
			}

			//4. Key
			for (unsigned i = 0; i<CRYPTO_KEYBYTES; ++i)
			{
				BlockInput[i + 2 + CRYPTO_COUNTERBYTES + CRYPTO_NPUBBYTES] = k[i];
			}

			//5. Permutation call
			FPerm(BlockInput, BlockMiddle); //First layer call to F

			/* II. Encryption*/

			if (mlen >= CRYPTO_MBLOCK)//Full block encryption
			{
				for (unsigned i = 0; i<CRYPTO_MBLOCK; ++i)
				{
					BlockMiddle[i + 2] ^= m[encrypted_bytes + i];
					c[encrypted_bytes + i] = BlockMiddle[i + 2];

				}
				BlockMiddle[1] = D0[1];
				BlockMiddle[0] = D0[0] + 2;  //New Di constant

			}

			else //Last incomplete block
			{
				for (unsigned i = 0; i<(unsigned)mlen; ++i)//Incomplete block Encryption
				{
					BlockMiddle[i + 2] ^= m[encrypted_bytes + i];
					c[encrypted_bytes + i] = BlockMiddle[i + 2];
				}
				for (unsigned i = (unsigned)mlen; i<CRYPTO_MBLOCK; ++i)
				{
					BlockMiddle[i + 2] ^= (unsigned char)mlen;  //Extra Padding: extra bytes filled with the last block length in bytes
				}

				BlockMiddle[1] = D0[1];
				BlockMiddle[0] = D0[0] + 3;  //New Di constant
			}

			//III. Second permutation call
			//1. Call
			FPerm(BlockMiddle, BlockOutput); //Second layer call to F

			//2. Buffer update
			for (unsigned i = 0; i<64 - 2 - CRYPTO_KEYBYTES; ++i)//Adding the output to tag preparation buffer
			{
				BlockLastInput[i + 2] ^= BlockOutput[i + 2];
			}


			//Counters increment
			mblock_counter++;
			if (mlen >= CRYPTO_MBLOCK)
			{
				encrypted_bytes += CRYPTO_MBLOCK;
				mlen -= CRYPTO_MBLOCK;
			}
			else
			{
				encrypted_bytes += mlen;
				mlen = 0;
			}
			(*clen) = encrypted_bytes;
		}
	}

	//Associated data part	  
	if (adlen != 0)
	{
		if (ad == NULL)
		{
			//Clearing variables
			for (unsigned i = 0; i<64; ++i)
				BlockInput[i] = BlockMiddle[i] = BlockOutput[i] = BlockLastInput[i] = 0;
			return -4;
		}

		unsigned long long adblock_counter = 1;   //AD block counter
		unsigned long long auth_bytes = 0;

		while (adlen>0)
		{
			//1. Constant
			BlockInput[1] = D0[1];
			if (adlen >= CRYPTO_ADBLOCK)
				BlockInput[0] = D0[0] + 4;
			else //Last incomplete block
				BlockInput[0] = D0[0] + 5;


			//2. Counter
			for (unsigned i = 0; i<CRYPTO_KEYBYTES; ++i)
				BlockInput[i + 2] = (i<sizeof(adblock_counter)) ? (adblock_counter >> (8 * i)) & 0xff : 0;//copying counter bytewise

			//3. AD block
			if (adlen >= CRYPTO_ADBLOCK) //Filling AD block
			{
				for (unsigned i = 0; i<CRYPTO_ADBLOCK; ++i)
					BlockInput[i + 2 + CRYPTO_KEYBYTES] = ad[auth_bytes + i];

			}
			else //Last incomplete block
			{
				for (unsigned i = 0; i<adlen; ++i)
					BlockInput[i + 2 + CRYPTO_KEYBYTES] = ad[auth_bytes + i];
				for (unsigned i = (unsigned)adlen; i<CRYPTO_ADBLOCK; ++i)
					BlockInput[i + 2 + CRYPTO_KEYBYTES] = (unsigned char)adlen;
			}

			//4. Key
			for (unsigned i = 0; i<CRYPTO_KEYBYTES; ++i)
			{
				BlockInput[i + CRYPTO_ADBLOCK + CRYPTO_KEYBYTES + 2] = k[i];
			}


			//5.Call to the F permutation

			FPerm(BlockInput, BlockOutput);//Call to the F permutation

			for (unsigned i = 0; i<64 - 2 - CRYPTO_KEYBYTES; ++i)//Adding the output to Z
			{
				BlockLastInput[i + 2] ^= BlockOutput[i];
			}

			//Counters increment
			adblock_counter++;
			if (adlen >= CRYPTO_ADBLOCK)
			{
				auth_bytes += CRYPTO_ADBLOCK;
				adlen -= CRYPTO_ADBLOCK;
			}
			else
			{
				auth_bytes += adlen;
				adlen = 0;
			}
		}
	}

	// Tag production 
	for (unsigned i = 0; i<CRYPTO_KEYBYTES; ++i) //Key to the Z input
		BlockLastInput[64 - CRYPTO_KEYBYTES + i] = k[i];
	BlockLastInput[0] = D0[0] + 6;
	BlockLastInput[1] = D0[1];

	//1. Permutation call
	FPerm(BlockLastInput, Tag);
	//2. Key injection
	for (unsigned i = 0; i<CRYPTO_KEYBYTES; ++i)
	{
		Tag[64 - CRYPTO_KEYBYTES + i] ^= k[i];
	}

	//3. Truncation
	for (unsigned i = 0; i<CRYPTO_ABYTES; ++i)
		c[(*clen) + i] = Tag[i];
	*clen += CRYPTO_ABYTES;


	//Clearing variables
	for (unsigned i = 0; i<64; ++i)
		BlockInput[i] = BlockMiddle[i] = BlockOutput[i] = BlockLastInput[i] = 0;



	return 0;
}


int crypto_aead_decrypt(
	unsigned char *m, unsigned long long *mlen,
	unsigned char *nsec,
	const unsigned char *c, unsigned long long clen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k
	)
{
	return PAEQ128_opt_AESNI_decrypt(m, mlen, c, clen, ad, adlen, npub, k);
}

