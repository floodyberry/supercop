//-------------------------------------------------------------------------------
//-- Title        : AVALANCHE
//-- File         : AVALANCHE.c
//-- Project      : aes256avalanchev1.1
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
		const unsigned char *m, unsigned long long mlen,
		const unsigned char *npub, unsigned char *PCMACKey)
{
	int i, j;
	unsigned long long numOfChunks = 0; //number of blocks/chunks to process in a message
	Byte finalKey[kSIZE]; //array for the xored key
	Byte nonce[kSIZE] =
	{ 0 }; //array for the nonce concatenated with it the counter
	Chunk r; //random number
	AESArguments *input;
	AES_KEY key;
	numOfChunks = (unsigned long long) ceil((float) mlen / SIZE) + 1; //length of plain message plus r
	input = (struct AES_Arguments*) malloc(
			(numOfChunks + 1) * sizeof(struct AES_Arguments));

	NumGenerator(r, 5);

	SetupForEnc(input, m, r, mlen, numOfChunks);
	memcpy(nonce, npub, CRYPTO_NPUBBYTES);

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
		AES_set_encrypt_key(finalKey, 256, &key);
		AES_encrypt(input[j].plainText, input[j].cipherText, &key);
	}

	for (j = 0; j < numOfChunks; j++) //to be edited
		for (i = 0; i < SIZE; i++)
			c[(j * SIZE) + i] = input[j].cipherText[i];
	*clen = numOfChunks * SIZE;
	TagGeneration(m, r, PCMACTag, numOfChunks);

	free(input);

}

/////////////////////////////////////////////////////////////////////////////////////////////////
// PCMACDec - PCMAC part of avalanche (does the decryption and generate the PCMAC tag)
//            * INPUT: cipherText c, mlen, nonce npub, PCMACKey
//            * OUTPUT: PCMACTag,  plainText m
/////////////////////////////////////////////////////////////////////////////////////////////////
int PCMACDec(Chunk PCMACTag, unsigned char *m, unsigned long long *mlen,
		const unsigned char *c, unsigned long long clen,
		const unsigned char *npub, unsigned char *PCMACKey)
{
	Byte finalKey[kSIZE]; //array for the xored key
	Byte nonce[kSIZE] =
	{ 0 }; //array for the nonce concatenated with it the counter
	int i, j; //counters
	int isValid = -1; //not valid message (missing EOT)
	unsigned long long numOfChunks = 0; //number of blocks/chunks to process in a message
	Chunk r;
	AESArguments *input;
	AES_KEY key;
	numOfChunks = (unsigned long long) clen / SIZE;

	input = (struct AES_Arguments*) malloc(
			(numOfChunks + 1) * sizeof(struct AES_Arguments));
	SetupForDec(input, c, numOfChunks);
	memcpy(nonce, npub, CRYPTO_NPUBBYTES);
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

		AES_set_decrypt_key(finalKey, 256, &key);
		AES_decrypt(input[j].cipherText, input[j].plainText, &key);
	}

	for (j = 0; j < numOfChunks; j++) //to be edited
		for (i = 0; i < SIZE; i++)
			m[(j * SIZE) + i] = input[j + 1].plainText[i];
	*mlen = (((j - 1) * SIZE) + i) - SIZE; //without r

	for (i = 0; i < SIZE - 1; i++)
		if (m[((numOfChunks - 2) * SIZE) + i] == EOT)
			isValid = 0;
	if (m[clen - 1] == EOT) // checking in case padding is of size 3 - which is equal to EOT
	{
		if (m[clen - 2] == pad)
		{
			if (m[clen - 4] != EOT)
				isValid = -1;
		}
		else
			isValid = 0;
	}
	if (isValid != 0)
		return isValid;

	memcpy(r, input[0].plainText, SIZE);
#ifdef  DebugOn
	printf("\nr is\t");
	for (i = 0; i < SIZE; i++)
	printf("%02x", r[i]);
	printf("\n");
#endif
	FileSettingForDec(m, *mlen - SIZE); //write the plain text to a file

	TagGeneration(m, r, PCMACTag, numOfChunks); //sending m+SIZE to leave the first chunk (which is r)

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
	unsigned long long numOfChunks = (unsigned long long) ceil(
			(float) mlen / SIZE) + 2; //length of plain message plus r plus tag

	for (i = 0; i < kSIZE; i++)
		PCMACKey[i] = k[i];

	for (i = 0; i < SIZE; i++)
	{
		RMACKey[i] = k[i + kSIZE];
		prime[i] = k[i + SIZE + kSIZE];
	}

	PCMACEnc(PCMACTag, c, clen, m, mlen, npub, PCMACKey);
	Sign(prime, RMACKey, ad, adlen, RMACTag);
	ModularAddition(RMACTag, PCMACTag);

	for (i = 0; i < SIZE; i++)
		c[*clen + i] = RMACTag[i];

	*clen += SIZE;

	FileSettingForEnc(c, numOfChunks); //write the cipher text to a file

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

	isValid = PCMACDec(PCMACTag, m, mlen, c, clen, npub, PCMACKey);

	if (isValid != 0)
		return isValid;

	Sign(prime, RMACKey, ad, adlen, RMACTag);
	ModularAddition(RMACTag, PCMACTag);

	isValid = Verify(RMACTag, tagFromCipher);

	if (!isValid)
		printf("\nThe tags are equal\n");
	else
		printf("\nThe tags are not equal\n");
	if (isValid != 0)
		return isValid;
	return isValid;
}

///*-------------------- Main Code ---------------*/
//int main()
//{
//	int isValid;
//	Byte *plainText;
//	Byte *cipherText;
//	Byte *associatedData;
//	unsigned long long mLen, cLen;
//	unsigned long long adLen = 0;
//	Byte nonce[CRYPTO_NPUBBYTES] =
//	{ 0xe4, 0x11, 0x40, 0x71, 0xa4, 0xd9, 0x10, 0x49, 0xe4, 0x11, 0x40, 0x71,
//			0xa4, 0xd9, 0x10, 0x49, 0xe4, 0x11, 0x40, 0x71 }; //nonce
//	Byte fullKey[CRYPTO_KEYBYTES] =
//	{ 0x24, 0x31, 0x40, 0x51, 0x64, 0x79, 0x90, 0xa9, 0x24, 0x31, 0x40, 0x51,
//			0x64, 0x79, 0x90, 0xa9, 0xc4, 0xe1, 0x00, 0x21, 0x44, 0x69, 0x90,
//			0xb9, 0x24, 0x31, 0x40, 0x51, 0x64, 0x79, 0x90, 0xa9, 0xc4, 0xe1,
//			0x00, 0x21, 0x44, 0x69, 0x90, 0xb9, 0xA9, 0x04, 0xB2, 0xB4, 0xAD,
//			0x41, 0x8A, 0x33, 0x91, 0x7C, 0xE8, 0x48, 0xD2, 0x08, 0x90, 0x8C,
//			0xe4, 0x11, 0x40, 0x71, 0xe4, 0x11, 0x40, 0x71 };
//	InitializeForEncryption(&mLen); //calculate numOfChunks and sizeOfPadding
//	plainText = (Byte*) malloc((mLen + SIZE) * sizeof(Byte));
//	cipherText = (Byte*) malloc((mLen + (SIZE * 3)) * sizeof(Byte));
//
//	InitializeForAD(&adLen);
//
//	associatedData = (Byte*) malloc((adLen + 1) * sizeof(Byte));
//
//	ReadFileForAD(associatedData, adLen);
//
//	ReadFileForEnc(plainText, mLen); //fill the arguments for the cipher
//
//#ifdef  DebugOn
//	printf("Number of chunks is %llu\n", mLen);
//#endif
//	crypto_aead_encrypt(cipherText, &cLen, plainText, mLen, associatedData,
//			adLen, 0, nonce, fullKey);
//	InitializeForDecryption(&cLen); //calculate numOfChunks
//	plainText = (Byte*) malloc((cLen) * sizeof(Byte));
//	cipherText = (Byte*) malloc((cLen + 1) * sizeof(Byte));
//#ifdef  DebugOn
//	printf("Number of chunks is %d\n", numOfChunks);
//#endif
//
//	ReadFileForDec(cipherText, cLen); //fill the arguments for the cipher
//
//	isValid = crypto_aead_decrypt(plainText, &mLen, 0, cipherText, cLen,
//			associatedData, adLen, nonce, fullKey);
//	if (isValid == -1)
//		printf("\nThe message is corrupted (missing EOT char)\n");
//
//	return (0);
//
//}
