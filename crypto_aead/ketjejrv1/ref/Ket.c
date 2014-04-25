/*
The Ketje authenticated encryption scheme, designed by Guido Bertoni,
Joan Daemen, Michaël Peeters, Gilles Van Assche and Ronny Van Keer.
For more information, feedback or questions, please refer to our website:
http://ketje.noekeon.org/

Implementation by the designers,
hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#include "Ketje.h"
#include "Ket.h"

#define	Ket_Minimum( a, b ) (((a) < (b)) ? (a) : (b))

/* Permutation state management functions	*/

unsigned char Ket_StateExtractByte( void *state, unsigned int offset )
{
	unsigned char data[1];

	KeccakF_StateExtractBytesInLane(state, offset / KeccakF_laneInBytes, data, offset % KeccakF_laneInBytes, 1);
	return data[0];
}

void Ket_StateOverwrite( void *state, unsigned int offset, const unsigned char *data, unsigned int length )
{
	unsigned int lanePosition;
	unsigned int laneOffset;
	unsigned int sizeInLane;

	lanePosition = offset / KeccakF_laneInBytes; 
	laneOffset = offset % KeccakF_laneInBytes; 
	while ( length != 0 ) {
		sizeInLane = Ket_Minimum( KeccakF_laneInBytes - laneOffset, length );
		KeccakF_StateOverwriteBytesInLane(state, lanePosition, data, laneOffset, sizeInLane);
		data += sizeInLane;
		length -= sizeInLane;
		++lanePosition; 
		laneOffset = 0; 
	}
}

void Ket_StateXORByte( void *state, unsigned int offset, unsigned char data )
{
   unsigned char localData[1];

   localData[0] = data;
   KeccakF_StateXORBytesInLane(state, offset / KeccakF_laneInBytes, localData, offset % KeccakF_laneInBytes, 1 );
}

/* Ketje low level functions	*/

void Ket_Step( void *state, unsigned int size, unsigned char frameAndPaddingBits)
{

	Ket_StateXORByte(state, size, frameAndPaddingBits);
	Ket_StateXORByte(state, Ketje_BlockSize, 0x08 );
    KeccakP_StatePermute(state, Ket_StepRounds );
}

void Ket_FeedAssociatedDataBlocks( void *state, const unsigned char *data, unsigned int nBlocks )
{

	do
	{
		Ket_StateXORByte( state, 0, *(data++) );
		Ket_StateXORByte( state, 1, *(data++) );
		#if (KeccakF_width == 400 )
		Ket_StateXORByte( state, 2, *(data++) );
		Ket_StateXORByte( state, 3, *(data++) );
		#endif
		Ket_Step( state, Ketje_BlockSize, FRAMEBITS00 ); 
	}
	while ( --nBlocks != 0 );
}

void Ket_UnwrapBlocks( void *state, const unsigned char *ciphertext, unsigned char *plaintext, unsigned int nBlocks )
{
	unsigned char tempBlock[Ketje_BlockSize];
    unsigned char frameAndPaddingBits[1];
    frameAndPaddingBits[0] = 0x08 | FRAMEBITS11;
	
	while ( nBlocks-- != 0 ) 
	{
		KeccakF_StateExtractLanes(state, tempBlock, Ketje_BlockSize / KeccakF_laneInBytes);
		tempBlock[0] = *(plaintext++) = *(ciphertext++) ^ tempBlock[0];
		tempBlock[1] = *(plaintext++) = *(ciphertext++) ^ tempBlock[1];
		#if (KeccakF_width == 400 )
		tempBlock[2] = *(plaintext++) = *(ciphertext++) ^ tempBlock[2];
		tempBlock[3] = *(plaintext++) = *(ciphertext++) ^ tempBlock[3];
		#endif
		KeccakF_StateXORLanes(state, tempBlock, Ketje_BlockSize / KeccakF_laneInBytes);
		KeccakF_StateXORBytesInLane(state, Ketje_BlockSize / KeccakF_laneInBytes, frameAndPaddingBits, 0, 1);
		KeccakP_StatePermute(state, Ket_StepRounds);
	}
}

void Ket_WrapBlocks( void *state, const unsigned char *plaintext, unsigned char *ciphertext, unsigned int nBlocks )
{
	unsigned char keystream[Ketje_BlockSize];
	unsigned char plaintemp[Ketje_BlockSize];
    unsigned char frameAndPaddingBits[1];
    frameAndPaddingBits[0] = 0x08 | FRAMEBITS11;

	while ( nBlocks-- != 0 ) 
	{
		KeccakF_StateExtractLanes(state, keystream, Ketje_BlockSize / KeccakF_laneInBytes);
		plaintemp[0] = plaintext[0];
		plaintemp[1] = plaintext[1];
		#if (KeccakF_width == 400 )
		plaintemp[2] = plaintext[2];
		plaintemp[3] = plaintext[3];
		#endif
		*(ciphertext++) = *(plaintext++) ^ keystream[0];
		*(ciphertext++) = *(plaintext++) ^ keystream[1];
		#if (KeccakF_width == 400 )
		*(ciphertext++) = *(plaintext++) ^ keystream[2];
		*(ciphertext++) = *(plaintext++) ^ keystream[3];
		#endif
		KeccakF_StateXORLanes(state, plaintemp, Ketje_BlockSize / KeccakF_laneInBytes);
		KeccakF_StateXORBytesInLane(state, Ketje_BlockSize / KeccakF_laneInBytes, frameAndPaddingBits, 0, 1);
		KeccakP_StatePermute(state, Ket_StepRounds);
	}
}

