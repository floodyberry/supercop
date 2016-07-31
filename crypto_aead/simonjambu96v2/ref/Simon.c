
/* 

Modified from: 
Simon and Speck Block cipher implementation by Nicolas Courtois, Theodosis Mourouzis, Guangyan Song

*/
#include "Simon.h"

char Simonz[5][65] =
{"11111010001001010110000111001101111101000100101011000011100110",
"10001110111110010011000010110101000111011111001001100001011010",
"10101111011100000011010010011000101000010001111110010110110011",
"11011011101011000110010111100000010010001010011100110100001111",
"11010001111001101011011000100000010111000011001010010011101111"};

void SimonKeySetup64(const uint8_t* rk, uint32_t* rkexp)
{
	int mm = 3; 
	int nn = 32; 
	int i, j = 0;
	uint32_t tmp = 0; 

	for (i = 0; i < mm; i++)
		rkexp[i] = ((uint32_t *)rk)[i];
	for (i = mm; i < 42; i++)
	{
		tmp = ROTL((nn - 3), rkexp[i - 1]);
		tmp = tmp ^ ROTL(31,tmp);
		rkexp[i] = (~(rkexp[i - mm])) ^ tmp ^ (Simonz[2][(i - mm) % 62] - '0') ^ 3;
	};
}

void SimonKeySetup96(const uint8_t* rk, uint64_t *rkexp)
{
	int mm = 2;
	int nn = 48;
	int i, j = 0;
	uint64_t tmp = 0;
	uint64_t t1; 
	// 
	rkexp[0] = (((uint64_t *)rk)[0]) & 0xffffffffffff;
	rkexp[1] = ((((uint64_t *)(rk + 6))[0])) & 0xffffffffffff;

	for (i = mm; i < 52; i++)
	{
		tmp = ROTL2((nn - 3), rkexp[i - 1], nn);
		tmp = tmp ^ ROTL2((nn - 1), tmp, nn);
		//is it bitwise negation?
		t1 = ~(0xffffffffffffffff << nn);
		rkexp[i] = (~(rkexp[i - mm]) & t1) ^ tmp ^ (Simonz[2][(i - mm) % 62] - '0') ^ 3;
	};
}

void SimonKeySetup128(const uint8_t* rk, uint64_t *rkexp)
{
	int mm = 2;
	int nn = 64;
	int i, j = 0;

	uint64_t tmp = 0;

	rkexp[0] = ((uint64_t*)rk)[0]; 
	rkexp[1] = ((uint64_t*)rk+1)[0];

	for (i = mm; i < 68; i++)
	{
		tmp = ROTL2((nn - 3), rkexp[i - 1], nn);
		tmp = tmp ^ ROTL2((nn - 1), tmp, nn);
		rkexp[i] = (~(rkexp[i - mm])) ^ tmp ^ (Simonz[2][(i - mm) % 62] - '0') ^ 3;
	};
}

void SimonEncrypt64(uint32_t *SR, uint32_t *SL, const uint32_t *k)
{
	uint32_t x = SL[0]; uint32_t y = SR[0];
	uint32_t tmp = 0; 
	int i; 

	for (i = 0; i < 42; i++)
	{
		tmp = x;
		x = y ^ ROTL(1, x) & ROTL(8, x) ^ ROTL(2, x) ^ k[i];
		y = tmp;
	};
	SL[0] = x; SR[0] = y;
}

void SimonEncrypt96(uint64_t *SR, uint64_t *SL, const uint64_t *k)
{
	uint64_t x = SL[0]; uint64_t y = SR[0];
	uint64_t tmp = 0;
	int i;

	for (i = 0; i < 52; i++)
	{
		tmp = x;
		x = y ^ ROTL2(1, x, 48) & ROTL2(8, x, 48) ^ ROTL2(2, x, 48) ^ k[i];
		y = tmp;
	};
	SL[0] = x & 0xffffffffffff; SR[0] = y & 0xffffffffffff;
}


void SimonEncrypt128(uint64_t *SR, uint64_t *SL, const uint64_t k[])
 {
 	uint64_t i;
 	uint64_t x = *SL; uint64_t y = *SR;
 	for (i = 0; i < 68; i++)
 	{
		uint64_t tmp = x;
 		x = y ^ ROTL64(x, 1) & ROTL64(x, 8) ^ ROTL64(x, 2) ^ k[i];
 		y = tmp; 
 	};
 	*SL = x; *SR = y;
 }


