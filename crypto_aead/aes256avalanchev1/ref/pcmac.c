//-------------------------------------------------------------------------------
//-- Title        : AVALANCHE
//-- File         : PCMAC.c
//-- Project      : aes256avalanchev1.1
//-- Author       : C4C Development Team 
//-- Organization : King Abdulaziz City for Science and Technology (KACST)
//-- Created      : 08.01.2014
//-------------------------------------------------------------------------------
//-- Description  : A list of functions that implements PCMAC which is
//					an authenticated encryption system.
//-------------------------------------------------------------------------------
//-- Copyright (C) KACST-C4C
//-- All rights reserved. Reproduction in whole or part is prohibited
//-- without the written permission of the copyright owner.
//-------------------------------------------------------------------------------
/*----------------- Header Files --------------------------*/
#include "avalanche.h"

/////////////////////////////////////////////////////////////////////////////////////////////////
// NumRand - Random Number Generator to generate number of length = FIELD_BIT_SIZE
//            * INPUT: an int to increase randomness
//            * OUTPUT: A random number (a)
/////////////////////////////////////////////////////////////////////////////////////////////////
Byte NumRand(int j)
{
	unsigned char rand;

	rand = (unsigned char) time(0) + j;
	rand *= rand;
	srand(rand);
	return rand;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// NumGenerator - utilizes the Random Number Generator to generate random num x of length SIZE
//            * INPUT: Byte x, random (to increase randomness)
//            * OUTPUT: SIZE Byte parameters
/////////////////////////////////////////////////////////////////////////////////////////////////
void NumGenerator(Chunk x, int random)
{
	int i;

	for (i = 0; i < SIZE; i++)
		x[i] = NumRand(random++);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// XORKey - XORs the Key with nCtr to generate block final key
//            * INPUT: 128 bit key, 128 bit nCtr
//            * OUTPUT: 128 bit finalKey
/////////////////////////////////////////////////////////////////////////////////////////////////
void XORKey(Byte* nCtr, Byte* key, Byte* finalKey)
{
	int i;

	for (i = 0; i < kSIZE; i++) //16 round for 128 bit (16*8)
		finalKey[i] = key[i] ^ nCtr[i];

}

/////////////////////////////////////////////////////////////////////////////////////////////////
// Increment - Increments the counter by one.
//            * INPUT: Byte* nCtr
//            * OUTPUT: Byte* nCtr incremented
/////////////////////////////////////////////////////////////////////////////////////////////////
void Increment(Byte* nCtr)
{
	unsigned short isFull = 0; //carry to indicate if an index is full
	Byte increment[kSIZE] =
	{ 0 }; //array to increment by 1

	increment[kSIZE - 1]++;

	CtrAdd(nCtr, increment, nCtr, &isFull);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// SetupForEnc - Fills passed parameter (plainText) with values
//            * INPUT:int numOfChunks,int sizeOfPadding
//            * OUTPUT: Filled array plainText
/////////////////////////////////////////////////////////////////////////////////////////////////
void SetupForEnc(AESArguments *input, const unsigned char *m, Chunk r,
		unsigned long long mLen, unsigned long long numOfChunks)
{
	int i = 0, j = 0;
	unsigned char temp[SIZE]; //temp double sized to avoid buffer overflow
	int sizeOfPadding = 0;
	int sizeOfLastChunk = 0;
	sizeOfLastChunk = mLen % SIZE;
	if (sizeOfLastChunk != 0)
		sizeOfPadding = SIZE - sizeOfLastChunk - 1;
	for (i = 0; i < SIZE; i++)
		input[0].plainText[i] = r[i];

	for (i = 0; i < numOfChunks - 2; i++)
	{
		memset(temp, 0, SIZE);
		memcpy(temp, m + (SIZE * i), SIZE);
		for (j = 0; j < SIZE; j++)
			input[i + 1].plainText[j] = temp[j];
	}

	memset(temp, 0, SIZE);
	memcpy(temp, m + (SIZE * i), SIZE - sizeOfPadding - 1); //for last chunk

	if (sizeOfLastChunk == 0)
	{
		memset(temp, 0, SIZE);
		temp[0] = EOT;
	}
	
	if (sizeOfPadding == 0 && sizeOfLastChunk == 15)
		temp[SIZE-1] = EOT;
	
	//padding
	if (sizeOfLastChunk != 0 && sizeOfLastChunk != 15)
	{
		temp[SIZE - sizeOfPadding - 1] = EOT;
		//pad the last chunk
		for (i = 0; i < sizeOfPadding - 1; i++)
			temp[SIZE - sizeOfPadding + i] = pad;
		temp[SIZE - 1] = (char) sizeOfPadding;
	}
	
	for (j = 0; j < SIZE; j++)
		input[numOfChunks - 1].plainText[j] = temp[j];

}

/////////////////////////////////////////////////////////////////////////////////////////////////
// SetupForDec - Fills passed parameter (cipherText) with values
//            * INPUT:int numOfChunks
//            * OUTPUT: Filled array cipherText
/////////////////////////////////////////////////////////////////////////////////////////////////
void SetupForDec(AESArguments *input, const unsigned char *c,
		unsigned long long numOfChunks)
{
	int i = 0, j = 0;
	Byte temp[SIZE + 1];

	for (i = 0; i < numOfChunks; i++)
	{
		memcpy(temp, c + (SIZE * i), SIZE);
		for (j = 0; j < SIZE; j++)
			input[i].cipherText[j] = temp[j];

	}

}

/////////////////////////////////////////////////////////////////////////////////////////////////
// ModularAddition -  Performs an XOR operation
//            * INPUT: Chunk a, Chunk b
//            * OUTPUT: Chunk a after xoring
/////////////////////////////////////////////////////////////////////////////////////////////////
void ModularAddition(Chunk a, Chunk b)
{
	int i;

	for (i = 0; i < SIZE; i++)
		a[i] ^= b[i];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// TagGeneration -  Reads chunks from a file and xor them with r as well.
//            * INPUT: stream of bytes m, Chunk r
//            * OUTPUT: Chunk tag
/////////////////////////////////////////////////////////////////////////////////////////////////
void TagGeneration(const unsigned char *m, Chunk r, Chunk tag,
		unsigned long long numOfChunks)
{
	Chunk temp;
	int i, j, k;

	memset(tag, 0, SIZE);
	for (i = 0; i < numOfChunks - 2; i++)
	{
		memcpy(temp, m + (SIZE * i), SIZE);
		if (i == numOfChunks - 2)
		{
			for (j = 0; j < SIZE; j++)
				if (temp[j] == EOT)
				{
					for (k = j; k < SIZE; k++)
						temp[k] = 0x00;

					break;
				}
		}
		ModularAddition(tag, temp);
	}

	for (i = 0; i < SIZE; i++)
		temp[i] = r[i];
	ModularAddition(tag, temp);

}
