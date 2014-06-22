//-------------------------------------------------------------------------------
//-- Title        : AVALANCHE
//-- File         : AVALANCHE.c
//-- Project      : aes192avalanchev1.1
//-- Author       : C4C Development Team 
//-- Organization : King Abdulaziz City for Science and Technology (KACST)
//-- Created      : 08.01.2014
//-------------------------------------------------------------------------------
//-- Description  : The starting point of the project (main) where it
//					handles the multiprocessing tasks.
//-------------------------------------------------------------------------------
//-- Copyright (C) KACST-C4C
//-- All rights reserved. Reproduction in whole or part is prohibited
//-- without the written permission of the copyright owner.
//-------------------------------------------------------------------------------
/*----------------- Header Files --------------------------*/
#include "avalanche.h"

/////////////////////////////////////////////////////////////////////////////////////////////////
// PCMACEnc - PCMAC part of avalanche (does the encryption and generate the PCMAC tag)
//            * INPUT: plainText m, mlen, nonce npub, PCMACKey
//            * OUTPUT: PCMACTag, cipherText c
/////////////////////////////////////////////////////////////////////////////////////////////////
void PCMACEnc(Chunk PCMACTag, unsigned char *c, unsigned long long *clen,
		const unsigned char *m, unsigned long long mlen, unsigned char *nonce,
		unsigned char *r, unsigned char *PCMACKey)
{
	int i, j;
	unsigned long long numOfChunks = 0; //number of blocks/chunks to process in a message
	Byte finalKey[kSIZE]; //array for the xored key

	AESArguments *input;
	AES_KEY key;

	if (mlen % SIZE == 0)
		numOfChunks = (unsigned long long) (mlen / SIZE) + 2; //length of plain message plus r+eot
	else
		numOfChunks = (unsigned long long) ceil((float) mlen / SIZE) + 1; //length of plain message plus r

	input = (struct AES_Arguments*) malloc(
			((numOfChunks) + 1) * sizeof(struct AES_Arguments));

	memset(input[numOfChunks].cipherText, 0, SIZE);

	SetupForEnc(input, m, r, mlen, numOfChunks);

	Increment(nonce);
	for (i = 0; i < kSIZE; i++)
		input[0].nonce[i] = nonce[i];
	for (j = 1; j <= numOfChunks; j++)
	{
		Increment(nonce);
		for (i = 0; i < kSIZE; i++)
			input[j].nonce[i] = nonce[i];
	}
	for (j = 0; j < numOfChunks; j++)
	{
		XORKey(input[j].nonce, PCMACKey, finalKey);
		AES_set_encrypt_key(finalKey, 192, &key);
		AES_encrypt(input[j].plainText, input[j].cipherText, &key);
	}

	for (j = 0; j < mlen + CRYPTO_ABYTES - SIZE; j++)
		c[j] = input[j / SIZE].cipherText[j % SIZE];

	*clen = mlen + CRYPTO_ABYTES;

	TagGeneration(m, r, PCMACTag, numOfChunks);

	free(input);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// PCMACDec - PCMAC part of avalanche (does the decryption and generate the PCMAC tag)
//            * INPUT: cipherText c, mlen, nonce npub, PCMACKey
//            * OUTPUT: PCMACTag,  plainText m
/////////////////////////////////////////////////////////////////////////////////////////////////
int PCMACDec(Chunk PCMACTag, unsigned char *m, unsigned long long *mlen,
		const unsigned char *c, unsigned long long clen, unsigned char *nonce,
		unsigned char *PCMACKey)
{
	Byte finalKey[kSIZE]; //array for the xored key
	int i, j; //counters
	int isValid = -1; //not valid message (missing EOT)
	int test = 0;
	unsigned long long numOfChunks = 0; //number of blocks/chunks to process in a message
	Chunk r;
	AESArguments *input;
	AES_KEY key;
	numOfChunks = (unsigned long long) clen / SIZE;

	input = (struct AES_Arguments*) malloc(
			(numOfChunks + 1) * sizeof(struct AES_Arguments));

	SetupForDec(input, c, numOfChunks);

	for (j = 0; j < numOfChunks; j++)
	{
		Increment(nonce);

		for (i = 0; i < SIZE; i++)
		{
			for (i = 0; i < kSIZE; i++)
				input[j].nonce[i] = nonce[i];
		}

	}
	for (j = 0; j < numOfChunks; j++) //decryption process
	{
		XORKey(input[j].nonce, PCMACKey, finalKey);

		AES_set_decrypt_key(finalKey, 192, &key);
		AES_decrypt(input[j].cipherText, input[j].plainText, &key);
	}

	for (j = 0; j < numOfChunks; j++) //to be edited
		for (i = 0; i < SIZE; i++)
			m[(j * SIZE) + i] = input[j + 1].plainText[i];

	*mlen = clen - CRYPTO_ABYTES + SIZE;

	if (m[*mlen] == EOT)
		isValid = 0;

	if (isValid != 0)
	{
		free(input);
		return isValid;
	}

	memcpy(r, input[0].plainText, SIZE);

	TagGeneration(m, r, PCMACTag, numOfChunks);

	free(input);

	return isValid;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// crypto_aead_encrypt - The code for the cipher implementation (encryption part) goes here.
//            * INPUT: plaintext m , associated data ad,
//				secret message number nsec, public message number or nonce npub,
//				and secret key k.
//            * OUTPUT: ciphertext c
/////////////////////////////////////////////////////////////////////////////////////////////////
int crypto_aead_encrypt(unsigned char *c, unsigned long long *clen,
		const unsigned char *m, unsigned long long mlen,
		const unsigned char *ad, unsigned long long adlen,
		const unsigned char *nsec, const unsigned char *npub,
		const unsigned char *k)
{
	Byte PCMACKey[kSIZE];
	Chunk RMACKey;
	Chunk prime;
	int i; //counter
	Chunk PCMACTag; //tag of PCMAC
	Chunk RMACTag; //tag of RMAC
	Chunk r;
	Byte nonce[kSIZE] =
	{ 0 };
	unsigned long long numOfChunks = (unsigned long long) ceil(
			(float) mlen / SIZE) + 2; //length of plain message plus r plus tag

	for (i = 0; i < kSIZE; i++)
		PCMACKey[i] = k[i];

	for (i = 0; i < SIZE; i++)
	{
		RMACKey[i] = k[i + kSIZE];
		prime[i] = k[i + SIZE + kSIZE];
		r[i] = npub[i];
	}
	for (i = SIZE; i < CRYPTO_NPUBBYTES; i++)
		nonce[i - SIZE] = npub[i];

	PCMACEnc(PCMACTag, c, clen, m, mlen, nonce, r, PCMACKey);

	Sign(prime, RMACKey, ad, adlen, RMACTag);

	ModularAddition(RMACTag, PCMACTag);

	for (i = 0; i < SIZE; i++)
		c[*clen - SIZE + i] = RMACTag[i];

	return 0;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// crypto_aead_decrypt -The code for the cipher implementation (decryption part) goes here.
//            * INPUT: ciphertext c,associated data ad,
//				public message number or nonce npub, and secret key k.
//            * OUTPUT: plaintext m
/////////////////////////////////////////////////////////////////////////////////////////////////
int crypto_aead_decrypt(unsigned char *m, unsigned long long *mlen,
		unsigned char *nsec, const unsigned char *c, unsigned long long clen,
		const unsigned char *ad, unsigned long long adlen,
		const unsigned char *npub, const unsigned char *k)
{
	int i;
	int isValid = -1; //not valid message
	Byte PCMACKey[kSIZE];
	Chunk RMACKey;
	Chunk prime;
	Chunk PCMACTag; //tag of PCMAC
	Chunk RMACTag; //tag of RMAC
	Chunk tagFromCipher; // tag retrieved from the cipher
	Byte nonce[kSIZE] =
	{ 0 };
	for (i = 0; i < SIZE; i++)
		tagFromCipher[i] = c[clen - SIZE + i];

	clen -= SIZE; //actual clen without the tag

	for (i = 0; i < kSIZE; i++)
		PCMACKey[i] = k[i];

	for (i = 0; i < SIZE; i++)
	{
		RMACKey[i] = k[i + kSIZE];
		prime[i] = k[i + SIZE + kSIZE];
	}

	for (i = SIZE; i < CRYPTO_NPUBBYTES; i++)
		nonce[i - SIZE] = npub[i];
	isValid = PCMACDec(PCMACTag, m, mlen, c, clen, nonce, PCMACKey);

	if (isValid != 0)
		return isValid;

	Sign(prime, RMACKey, ad, adlen, RMACTag);

	ModularAddition(RMACTag, PCMACTag);

	isValid = Verify(RMACTag, tagFromCipher);

	return isValid;
}
