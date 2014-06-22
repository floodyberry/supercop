//-------------------------------------------------------------------------------
//-- Title        : AVALANCHE
//-- File         : AVALANCHE.h
//-- Project      : aes192avalanchev1.1
//-- Author       : C4C Development Team 
//-- Organization : King Abdulaziz City for Science and Technology (KACST)
//-- Created      : 08.01.2014
//-------------------------------------------------------------------------------
//-- Description  : Main header for AVALANCHE
//-------------------------------------------------------------------------------
//-- Copyright (C) KACST-C4C
//-- All rights reserved. Reproduction in whole or part is prohibited
//-- without the written permission of the copyright owner.
//-------------------------------------------------------------------------------
/***************	Headers	********************/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <math.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <utmpx.h>
#include "api.h"
#include "crypto_aead.h"
#include "openssl/aes.h"

/***************	Sizes	********************/
#define col			4 
#define row			4
#define SIZE		16
#define hSIZE		32
#define kSIZE		CRYPTO_KEYBYTES-32
#define bytes		16 //128/8
#define sizeOfN		128
#define chunksOfN	sizeOfN/8
#define	sizeOfCtr	192-sizeOfN
#define chunksOfCtr	(sizeOfCtr)/8
#define BYTE_SIZE   8
#define EOT			0x03
#define pad			0x30 //padding with charachter 0
/************ Bit Selection **************/
#define WORD_LEFT_BIT        (1<<(BYTE_SIZE-1))
#define WORD_RIGHT_BIT            1
#define WORD_MID_BIT       (1<<(BYTE_SIZE/2))
#define WORD_LHALF_ONE            ((1<<BYTE_SIZE/2) - 1)
/*****        Results of Compare Functions      *****/
#define LT                 -1
#define EQ                 0
#define GT                 1
/***************	TYPES	********************/
typedef unsigned short NumCarry;
typedef unsigned char Byte; // 8-bit variable
typedef Byte State[row][col]; // 4-bytes x 4 -bytes matrix
typedef Byte Chunk[SIZE]; // 16-bytes
typedef Byte NumProduct[SIZE * 2];

typedef struct AES_Arguments
{
	Byte plainText[SIZE];
	Byte cipherText[SIZE];
	Byte nonce[kSIZE];
} AESArguments;

/************ Function Declaration**************/
//LargeNumbers.c
void CtrAdd(Byte *a, Byte *b, Byte *result, unsigned short *carryFlag);
int NumCompare(Chunk A, Chunk B);
void InterleavedModularMultiplication(Chunk a, Chunk b, Chunk mod,
		Byte * result);
void Reduce(Byte *Result, Chunk n, Chunk result, int length);
//IO.c
void ReadFileForEnc(Byte* input, unsigned long long mLen);
void ReadFileForDec(Byte* input, unsigned long long cLen);
void ReadFileForAD(Byte* input, unsigned long long adlen);
void InitializeForEncryption(unsigned long long *mLen);
void InitializeForDecryption(unsigned long long *cLen);
void InitializeForAD(unsigned long long *length);
void FileSettingForEnc(Byte *cipherText, unsigned long long numOfChunks);
void FileSettingForDec(Byte *plainText, unsigned long long mlen);
//PCMAC.c
void SetupForEnc(AESArguments *input, const unsigned char *m, Chunk r,
		unsigned long long mLen, unsigned long long numOfChunks);
void SetupForDec(AESArguments *input, const unsigned char *c,
		unsigned long long numOfChunks);
void TagGeneration(const unsigned char *m, Chunk r, Chunk tag,
		unsigned long long numOfChunks);
void NumGenerator(Chunk x, int random);
void XORKey(Byte* nCtr, Byte* key, Byte* finalKey);
void ConvertCharToHex(char cipherInHex[], char temp[]);
void ModularAddition(Chunk a, Chunk b);
void Increment(Byte* nCtr);
//RMAC.c
void Sign(Chunk prime, Chunk key, const Byte *m, int length, Chunk Tag);
int Verify(Chunk tag, Chunk tagFromCipher);
