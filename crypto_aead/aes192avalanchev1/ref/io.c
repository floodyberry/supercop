//-------------------------------------------------------------------------------
//-- Title        : AVALANCHE
//-- File         : IO.c
//-- Project      : aes192avalanchev1.1
//-- Author       : C4C Development Team
//-- Organization : King Abdulaziz City for Science and Technology (KACST)
//-- Created      : 08.01.2014
//-------------------------------------------------------------------------------
//-- Description  : A list of functions that read and write from files.
//-------------------------------------------------------------------------------
//-- Copyright (C) KACST-C4C
//-- All rights reserved. Reproduction in whole or part is prohibited
//-- without the written permission of the copyright owner.
//-------------------------------------------------------------------------------
/*----------------- Header Files --------------------------*/
#include "avalanche.h"

/////////////////////////////////////////////////////////////////////////////////////////////////
// ConvertCharToHex -  takes hex characters and convert them to hex representation (2 hex chars to 1 Byte)
//            * INPUT: CipherInHex characters
//            * OUTPUT: temp (stored in hex)
/////////////////////////////////////////////////////////////////////////////////////////////////
void ConvertCharToHex(char cipherInHex[], char temp[]) {
	char hexByte[3] = { 0 };
	unsigned int d;
	int acc[SIZE];

	for (d = 0; d < hSIZE; d += 2) {
		// Assemble a digit pair into the hexByte string
		hexByte[0] = cipherInHex[d];
		hexByte[1] = cipherInHex[d + 1];

		// Convert the hex pair to an integer
		sscanf(hexByte, "%X", &acc[d / 2]);
		temp[d / 2] = acc[d / 2];
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// WriteHexToFile -  takes encrypted output and writes it to file as hex
//            * INPUT: number of chunks to write (numChunks) & file to write to reference (fp)
//            * OUTPUT: N/A
/////////////////////////////////////////////////////////////////////////////////////////////////
void WriteHexToFile(Byte* output, int numChunks, FILE *cipherWriter) {
	int i, k;

	for (k = 0; k < numChunks; k++)
		for (i = 0; i < SIZE; i++)
			fprintf(cipherWriter, "%02x", output[(k * SIZE) + i]);

}

/////////////////////////////////////////////////////////////////////////////////////////////////
// WriteCharToFile -  takes decrypted output and writes it to file as characters
//            * INPUT: number of chunks to write (numChunks) & file to write to reference (fp)
//			sizeOfLastChunk (to remove padding), flag isLast to indicate last chunk
//            * OUTPUT: N/A
/////////////////////////////////////////////////////////////////////////////////////////////////
void WriteCharToFile(Byte* output, int mlen, FILE *textWriter) {
	int i;

	for (i = 0; i < mlen; i++)
		fprintf(textWriter, "%c", output[i]);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// ReadFileForEnc -  reads characters from a file and stores it in an array
//            * INPUT: number of bytes to write (mLen)
//            * OUTPUT: data file is stored in an array
/////////////////////////////////////////////////////////////////////////////////////////////////
void ReadFileForEnc(Byte *input, unsigned long long mLen) {
	Byte temp[2];
	unsigned long long counter = 0;
	FILE *textReader;
	int j;

	//opening file for reading
	textReader = fopen("Message.txt", "r+");
	if (!textReader) {
		printf("Error opening file\n");
		exit(1);
	}
	//Getting/reading chunks from file
	while (!feof(textReader) && counter < mLen) {
		fread(temp, sizeof(char), 1, textReader);
		temp[1] = '\0';
		input[counter] = temp[0];
		counter++;
	} //end while

	for (j = counter; j < SIZE + counter; j++)
		input[j] = 0x00;

	fclose(textReader); //close the file
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// ReadFileForDec -  reads characters from a file and stores it in an array
//            * INPUT: number of bytes to write (cLen)
//            * OUTPUT: data file is stored in an array
/////////////////////////////////////////////////////////////////////////////////////////////////
void ReadFileForDec(Byte *input, unsigned long long cLen) {
	char temp[2], tempCipher[3];
	FILE *cipherReader;
	int i = 0, counter = 0;

	/* opening file for reading */
	cipherReader = fopen("CipherText.txt", "r");
	if (cipherReader == NULL) {
		printf("Error opening file");
		exit(1);
	}
	while (fgets(tempCipher, 3, cipherReader) != NULL) {
		ConvertCharToHex(tempCipher, temp);
		//convert chunk from hex to char
		//getting the first chunk of 128 bit
		for (i = 0; i < SIZE; i++) {
			input[counter] = temp[0];
		}
		counter++;
	}

	fclose(cipherReader); //close the file
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// ReadFileForAD -  reads characters from a file and stores it in an array
//            * INPUT: number of bytes to write (adlen)
//            * OUTPUT: data file is stored in an array
/////////////////////////////////////////////////////////////////////////////////////////////////
void ReadFileForAD(Byte* input, unsigned long long adlen) {
	Byte temp[2];
	unsigned long long counter = 0;
	FILE *textReader;
	//opening file for reading
	textReader = fopen("AD.txt", "r+");
	if (!textReader) {
		printf("Error opening file\n");
		exit(1);
	}
	//Getting/reading chunks from file
	while (!feof(textReader) && counter < adlen) {
		fread(temp, sizeof(char), 1, textReader);
		temp[1] = '\0';
		input[counter] = temp[0];
		counter++;
	} //end while

	fclose(textReader); //close the file
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// InitializeForEncryption -  calculates the length of file
//            * INPUT: N/A
//            * OUTPUT: number of bytes (mLen)
/////////////////////////////////////////////////////////////////////////////////////////////////
void InitializeForEncryption(unsigned long long *mLen) {
	FILE *textReader;
	unsigned long long lengthOfFile = 0;

	/* opening file for reading */
	textReader = fopen("Message.txt", "r+");
	if (!textReader) {
		printf("Error opening file\n");
		exit(1);
	}
	while (!feof(textReader)) {
		fgetc(textReader);
		lengthOfFile++;
	}
	*mLen = lengthOfFile + 1; //keeping in mind EOF char that will be added and CR

	fclose(textReader); //close the file
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// InitializeForDecryption -  calculates the length of file
//            * INPUT: N/A
//            * OUTPUT: number of bytes (cLen)
/////////////////////////////////////////////////////////////////////////////////////////////////
void InitializeForDecryption(unsigned long long *cLen) {
	FILE *cipherReader;
	unsigned long long lengthOfFile = 0;
	/* opening file for reading */
	cipherReader = fopen("CipherText.txt", "r+");
	if (!cipherReader) {
		printf("Error opening file\n");
		exit(1);
	}
	while (!feof(cipherReader)) {
		fgetc(cipherReader);
		lengthOfFile++;
	}
	*cLen = (lengthOfFile - 1) / 2;

	fclose(cipherReader); //close the file
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// InitializeForAD -  calculates the length of file
//            * INPUT: N/A
//            * OUTPUT: number of bytes (length)
/////////////////////////////////////////////////////////////////////////////////////////////////
void InitializeForAD(unsigned long long *length) {
	unsigned long long lengthOfFile = 0;
	FILE *textReader;

	/* opening file for reading */
	textReader = fopen("AD.txt", "r+");
	if (!textReader) {
		printf("Error opening file\n");
		exit(1);
	}
	while (!feof(textReader)) {
		fgetc(textReader);
		lengthOfFile++;
	}
	*length = lengthOfFile - 1;

	fclose(textReader); //close the file
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// FileSettingForEnc - Writes cipherText to a file after encryption
//            * INPUT: Chunk *cipherText, int numOfChunks
//            * OUTPUT: N/A
/////////////////////////////////////////////////////////////////////////////////////////////////
void FileSettingForEnc(Byte *cipherText, unsigned long long numOfChunks) {
	FILE *cipherWriter;

	cipherWriter = fopen("CipherText.txt", "w"); /*create the new file*/
	if (!cipherWriter)
		printf("Unable to create file\n");

	WriteHexToFile(cipherText, numOfChunks, cipherWriter);
	fclose(cipherWriter); //close the file
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// FileSettingForDec - Writes plainText to a file after decryption
//            * INPUT: Chunk *plainText, int numOfChunks
//            * OUTPUT: N/A
/////////////////////////////////////////////////////////////////////////////////////////////////
void FileSettingForDec(Byte *plainText, unsigned long long mlen) {
	FILE *textWriter;

	//open file for writing decrypted msg
	textWriter = fopen("plainText.txt", "w"); /*create the new file*/
	if (!textWriter)
		printf("Unable to create file\n");

	if ((plainText[mlen - 1] < 16 && plainText[mlen - 1]!=3) || (plainText[mlen - 1]==3 && plainText[mlen - 4]==3))
		WriteCharToFile(plainText, mlen - plainText[mlen - 1] - 2, textWriter);
	else
		WriteCharToFile(plainText, mlen-2, textWriter);

	fclose(textWriter); //close the file
}
