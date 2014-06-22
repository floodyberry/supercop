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
	unsigned int flag = 1, flagFull = 1, i = 0;
	int j;
	if (length == 0)
		mApp[0] = 0x01;
	else
	{
		for (i = 0; i < length; i++)
			mApp[i] = m[i];
		//	this only works when last bit is zero, if not we need a new index
		//	 Remove all leading zero (at MSB):
		//	 Shift the index to the first non-zero digit of Exponent (e)
		i = length - 1;

		while (!mApp[i])
		{
			flagFull = 0;
			i--;
		}

		// Shift the mask (0x0...10...0) for the first non-zero bit within Exponent (e)
		while (!(mask & mApp[i]))
		{
			flag = 0;
			mask >>= 1;
		}

		if (flag && !flagFull)
			mApp[i + 1] = 1;

		else if (!flag)
		{
			mask <<= 1;
			mApp[i] = mApp[i] ^ mask;
		}

		else if (flag && flagFull)
		{
			mApp[i + 1] = 0x01;

		}
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
	if (length < 16)
	{
		result = (Byte*) malloc((SIZE * 2) * sizeof(Byte));
		mApp = (Byte*) malloc((SIZE * 2) * sizeof(Byte));
		memset(mApp, 0, SIZE * 2);

	}
	else
	{
		result = (Byte*) malloc((length * 2) * sizeof(Byte));
		mApp = (Byte*) malloc((length * 2) * sizeof(Byte));
		memset(mApp, 0, length * 2);
	}

	AppendOne(m, mApp, length);

	Reduce(mApp, prime, mRes, length);

	InterleavedModularMultiplication(key, mRes, prime, result);

	for (i = 0; i < SIZE; ++i) //converted from little endian to big endian
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
	int result;
	result = NumCompare(tag, tagFromCipher);
	return result;
}
