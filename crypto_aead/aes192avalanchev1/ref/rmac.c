//-------------------------------------------------------------------------------
//-- Title        : AVALANCHE
//-- File         : RMAC.c
//-- Project      : aes192avalanchev1.1
//-- Author       : C4C Development Team 
//-- Organization : King Abdulaziz City for Science and Technology (KACST)
//-- Created      : 08.01.2014
//-------------------------------------------------------------------------------
//-- Description  :  A list of functions that implements RMAC which is a universal hashing based MAC that
//-- 				requires the hashed image to be encrypted with a one-time pad.
//-------------------------------------------------------------------------------
//-- Copyright (C) KACST-C4C
//-- All rights reserved. Reproduction in whole or part is prohibited
//-- without the written permission of the copyright owner.
//-------------------------------------------------------------------------------
/*----------------- Header Files --------------------------*/
#include "avalanche.h"

/////////////////////////////////////////////////////////////////////////////////////////////////
//  AppendOne - Appends one to the MSB
//		* INPUT:	const LongNum m
//		* OUTPUT:	Byte *mApp
/////////////////////////////////////////////////////////////////////////////////////////////////
void AppendOne(const Byte *m, Byte *mApp, int length)
{
	Byte mask = WORD_LEFT_BIT;
	int j, i = 0;

	if (m[length - 1] & mask)
	{
		mApp[length] = 0x01;
		for (j = 0; j < length; j++)
			mApp[j] = m[j];
	}
	else
	{
		while (!(mask & m[length - 1]))
		{
			mask >>= 1;
			i++;
		}
			mask <<= 1;
		mApp[length] = 0x00;
		mApp[length - 1] = m[length - 1] | mask;
		for (j = 0; j < length - 1; j++)
			mApp[j] = m[j];
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////
//  Sign - Creates the RMAC tag
//		* INPUT: Chunk prime, Chunk key, NumProduct m,
//		* OUTPUT: Chunk Tag
/////////////////////////////////////////////////////////////////////////////////////////////////
void Sign(Chunk prime, Chunk key, const Byte *m, int length, Chunk Tag)
{
	int i;
	Chunk mRes;
	Byte *result, *mApp;
	result = (Byte*) malloc((length) * sizeof(Byte));
	mApp = (Byte*) malloc((length) * sizeof(Byte));

	memset(mApp, 0, length + 2);
#ifdef  DebugOn
	printf("\nm inside sign is:\n");
	for (i = length - 1; i >= 0; i--)
		printf("%02x", m[i]);
#endif

	AppendOne(m, mApp, length);
#ifdef  DebugOn
	printf("\nmApp is:\n");
	for (i = length - 1; i >= 0; i--)
		printf("%02x", mApp[i]);
#endif

	Reduce(mApp, prime, mRes, length);

#ifdef  DebugOn
	printf("\nmod p:\n");
	for (i = SIZE - 1; i >= 0; i--)
	printf("%02x", prime[i]);

	printf("\nmRes is:\n");
	for (i = SIZE - 1; i >= 0; i--)
	printf("%02x", mRes[i]);

	printf("\nKey is:\n");
	for (i = SIZE - 1; i >= 0; i--)
	printf("%02x", key[i]);
#endif

	InterleavedModularMultiplication(key, mRes, prime, result);
#ifdef  DebugOn
	printf("\nresult is:\n");
	for (i = SIZE - 1; i >= 0; i--)
	printf("%02x", result[i]);
#endif

	for (i = 0; i < SIZE; ++i) //converted from little endian to big endian or the reverse??????????? have to specify
		Tag[i] = result[SIZE - 1 - i];

	free(result);
	free(mApp);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
//  Verify - Creates the RMACtag after decryption and compares it with the tag read from tag.txt
//		* INPUT: Chunk tag
//		* OUTPUT: short result returning the result of comparison
/////////////////////////////////////////////////////////////////////////////////////////////////
int Verify(Chunk tag, Chunk tagFromCipher)
{
	int result, i;
	char temp[SIZE], tempChar[hSIZE + 1];
	memset(temp, '\0', SIZE);
	memset(tempChar, '\0', hSIZE);

#ifdef  DebugOn
	printf("\nRMAC tagFromCipher= \t");
	for (i = 0; i < SIZE; i++)
	printf("%02x", tagFromCipher[i]);
	printf("\nRMAC Tag= \t");
	for (i = 0; i < SIZE; i++)
	printf("%02x", tag[i]);
#endif
	result = NumCompare(tag, tagFromCipher);
	return result;
}
