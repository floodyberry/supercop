//-------------------------------------------------------------------------------
//-- Title        : AVALANCHE
//-- File         : LargeNumbers.c
//-- Project      : aes192avalanchev1.1
//-- Author       : C4C Development Team 
//-- Organization : King Abdulaziz City for Science and Technology (KACST)
//-- Created      : 08.01.2014
//-------------------------------------------------------------------------------
//-- Description  : A list of functions that manipulate large numbers and perform 
//--               operations such as increments, multiplication and reduction.
//-------------------------------------------------------------------------------
//-- Copyright (C) KACST-C4C
//-- All rights reserved. Reproduction in whole or part is prohibited
//-- without the written permission of the copyright owner.
//-------------------------------------------------------------------------------
/*----------------- Header Files --------------------------*/
#include "avalanche.h"

/////////////////////////////////////////////////////////////////////////////////////////////////
// ByteAdd - Add two bytes (a and b) and the carry-in (carryFlag) then store the output in
//                (result) with their corresponding carry out (carryFlag);
//            *  INPUT :    Bytes (a) and (b)
//            * OUTPUT :    result = a + b + carryFlag, and carry out (carryFlag)
/////////////////////////////////////////////////////////////////////////////////////////////////
void ByteAdd(Byte a, Byte b, Byte *result, NumCarry *carryFlag)
{
	(*result) = a + b;
	if (*carryFlag)
	{
		(*result)++;
		*carryFlag = ((*result) <= a) ? 1 : 0;
	}
	else
		*carryFlag = ((*result) < a) ? 1 : 0;

}

/////////////////////////////////////////////////////////////////////////////////////////////////
// CtrAdd - Add two Multiprecision numbers (Big Integer)
//            *  INPUT :    array of bytes of size SIZE (a) and (b),
//            *  OUTPUT:  Result = a + b, and a carry out (carryFlag)
/////////////////////////////////////////////////////////////////////////////////////////////////
void CtrAdd(Byte *a, Byte *b, Byte *result, unsigned short *carryFlag)
{
	int i;

	*carryFlag = 0;
	for (i = kSIZE - 1; i >= chunksOfN; i--)
		ByteAdd(a[i], b[i], &result[i], carryFlag);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// ByteSub - Subtract two word numbers (a and b) and the carry-in (carryFlag) then store the  XXXXXXXXXXXXXXXXXXXXX
//                output in (result) with their corresponding carry out (carryFlag);
//            *  INPUT :    Numbers (a) and (b)
//            *  OUTPUT:    result = a - b - carryFlag, and carryFlag
/////////////////////////////////////////////////////////////////////////////////////////////////
void ByteSub(Byte a, Byte b, Byte *result, NumCarry *carryFlag)
{
	(*result) = a - b;
	if (*carryFlag)
	{
		(*result)--;
		*carryFlag = ((*result) >= a) ? 1 : 0;
	}
	else
		*carryFlag = ((*result) > a) ? 1 : 0;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// NumSetEqual - Copy the content of input (b) into the output (a);  XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//            * INPUT:      Number (a) and (b), both belongs to interval [0, n-1] 
//            * OUTPUT:     a = b
/////////////////////////////////////////////////////////////////////////////////////////////////
void NumSetEqual(const Chunk b, Chunk a)
{
	int i;

	for (i = 0; i < SIZE; i++)
		a[i] = b[i];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// NumCompare - Compare two input numbers A and B;
//            * INPUT:      w-bit number (A)  and w-bit number (b)
//            * OUTPUT:
//                                IF (A < B)    THEN   Retune Less_Than(LT)
//                                IF (A > B)    THEN   Retune Greater_Than(GT)
//                                IF (A = B)    THEN   Retune Equal(EQ)
/////////////////////////////////////////////////////////////////////////////////////////////////
int NumCompare(Chunk A, Chunk B)
{
	int i;

	for (i = SIZE - 1; i >= 0; i--)
	{
		if (A[i] < B[i])
			return LT;
		if (A[i] > B[i])
			return GT;
	}
	return EQ;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// LongNumCompare - Compare two input numbers A and B;
//            * INPUT:      length-bit number (A)  and length-bit number (b)
//            * OUTPUT:
//                                IF (A < B)    THEN   Retune Less_Than(LT)
//                                IF (A > B)    THEN   Retune Greater_Than(GT)
//                                IF (A = B)    THEN   Retune Equal(EQ)
/////////////////////////////////////////////////////////////////////////////////////////////////
short LongNumCompare(Byte * A, Byte * B, int length)
{
	int i;

	for (i = length - 1; i >= 0; i--)
	{
		if (A[i] < B[i])
			return LT;
		if (A[i] > B[i])
			return GT;
	}
	return EQ;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// LongNumSetZero - Reset the content of input (a) to zeros;
//            * INPUT:      length-bit Double-Precision Number (a)
//            * OUTPUT:     a = 0
/////////////////////////////////////////////////////////////////////////////////////////////////
void LongNumSetZero(Byte * a, int length)
{
	int i;

	for (i = 0; i < length; i++)
		a[i] = 0;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// ConvertLongNum - convert a w-bit Num to a length-bit Byte *
//            * INPUT:      w bit Double-Precision number (a)
//            * OUTPUT:     length-bit number (A)
/////////////////////////////////////////////////////////////////////////////////////////////////
void ConvertLongNum(Chunk a, Byte * A, int length)
{
	int i;

	LongNumSetZero(A, length);
	for (i = 0; i < SIZE; i++)
		A[i] = a[i];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// LongNumShiftLeft - Shift the input(a) to the left by one position (a << 1);  XXXXXXXXXXXXXX
//            * INPUT:      Number (a) 
//            * OUTPUT :    a/2 and carryFlag that contains the LSB of (a)
/////////////////////////////////////////////////////////////////////////////////////////////////
void LongNumShiftLeft(Byte * a, NumCarry *carryFlag, int length)
{
	int i;

	*carryFlag = (a[length - 1] & WORD_LEFT_BIT) ? 1 : 0;
	a[length - 1] <<= 1;
	for (i = length - 2; i >= 0; i--)
	{
		if (a[i] & WORD_LEFT_BIT)
			a[i + 1] |= WORD_RIGHT_BIT; // OR operation to set the LSB of a[i+1]
		a[i] <<= 1;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// LongNumShiftLeftmany - Shift the input(a) to the left by number of position specified (length) XXXXXXXXXXX
//            * INPUT:      Number (a), 
//            * OUTPUT :    number of position to be shifted (length)
/////////////////////////////////////////////////////////////////////////////////////////////////
void LongNumShiftLeftMany(Byte * a, int shifts, int length)
{
	int i = 0;
	NumCarry carryFlag = 0;

	for (i = 0; i < shifts; i++)
		LongNumShiftLeft(a, &carryFlag, length);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// LongNumSub - Subtract length-bit Multiprecision numbers (Big Integer)
//            *  INPUT :    length-bit number (A) and length-bit number (b)
//            *  OUTPUT:  Result = a - b, and a carry out (carryFlag)
//                  a(n-1)a(n-2) ... a(1)a(0) 
//                                             - 
//                  b(n-1)b(n-2) ... b(1)b(0) 
//                  ----------------------------
//   carryFlag Result(n-1)Result(n-2) ... Result(1)Result(0)
/////////////////////////////////////////////////////////////////////////////////////////////////
void LongNumSub(Byte * A, Byte * B, Byte * result, NumCarry *carryFlag,
		int length)
{
	int i;

	*carryFlag = 0;
	for (i = 0; i < length; i++)
		ByteSub(A[i], B[i], &result[i], carryFlag);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// LongNumShiftRight - Shift the input(a) to the right by one position (a << 1);
//            * INPUT:      Number (a) 
//            * OUTPUT :    a/2 and carryFlag that contains the LSB of (a)
/////////////////////////////////////////////////////////////////////////////////////////////////
void LongNumShiftRight(Byte * a, NumCarry *carryFlag, int length)
{
	int i;

	*carryFlag = (a[0] & WORD_RIGHT_BIT);
	a[0] >>= 1;
	for (i = 1; i < length; i++)
	{
		if (a[i] & WORD_RIGHT_BIT)
			a[i - 1] |= WORD_LEFT_BIT; // OR operation to set the MSB of a[i-1]
		a[i] >>= 1;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// Byte *Add - Add length-bit Multiprecision numbers (Big Integer)          **
//            *  INPUT :    length-bit number (A) and length-bit number (b)
//            *  OUTPUT:  Result = a - b, and a carry out (carryFlag)
//                  a(n-1)a(n-2) ... a(1)a(0) 
//                                             - 
//                  b(n-1)b(n-2) ... b(1)b(0) 
//                  ----------------------------
//   carryFlag Result(n-1)Result(n-2) ... Result(1)Result(0)
////////////////////////////////////////////////////////////////////////////////////////////////////
void LongNumAdd(Byte * A, Byte * B, Byte * result, NumCarry *carryFlag,
		int length) //Multi-Precision Addition Algorithm
{
	int i;

	*carryFlag = 0;
	for (i = 0; i < length; i++)
		ByteAdd(A[i], B[i], &result[i], carryFlag);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// InterleavedModularMultiplication - Multiply two Multiprecision numbers (Big Integer) using interleaved  ***
//   modular multiplication (IMM) 
//            *  INPUT :    w-bit (a) and (b), both belong to interval [0, n-1]
//            *  OUTPUT:    Result = a * b, and carryFlag
//                  a(n-1)a(n-2) ... a(1)a(0) 
//                                             * 
//                  b(n-1)b(n-2) ... b(1)b(0) 
//                  ----------------------------
//         Result(2n-1)Result(2n-2) ... Result(1)Result(0)
/////////////////////////////////////////////////////////////////////////////////////////////////
void InterleavedModularMultiplication(Chunk a, Chunk b, Chunk mod,
		Byte * result)
{
	int i = 0, j = 0;
	unsigned int x = 0;
	NumCarry carryFlag = 0;
	Byte B[SIZE * 2];
	Byte Mod[SIZE * 2];
	int length = SIZE * 2;
	LongNumSetZero(result, length);
	ConvertLongNum(b, B, length);
	ConvertLongNum(mod, Mod, length);

	for (j = SIZE - 1; j >= 0; j--) //a's index
	{
		for (i = BYTE_SIZE - 1; i >= 0; i--)
		{
			x = a[j] & (1 << (i)); // mask ith bit from the left
			LongNumShiftLeft(result, &carryFlag, length);
			if (x)
				LongNumAdd(result, B, result, &carryFlag, length);
			if (LongNumCompare(result, Mod, length) >= 0) //mod operation
				LongNumSub(result, Mod, result, &carryFlag, length);
			if (LongNumCompare(result, Mod, length) >= 0) //mod operation
				LongNumSub(result, Mod, result, &carryFlag, length);
		}
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// Reduce - Reduction function to bring the double-Precision positive number (c) 
//            back into the range of [0, n-1] using restoring division (using testing rather than retrieving)
//            * INPUT:      length-bit positive number (Result), modulus (n)
//            * OUTPUT :    result = Result mod n
/////////////////////////////////////////////////////////////////////////////////////////////////
void Reduce(Byte *Result, Chunk n, Chunk result, int length)
{
	Byte *Modulus;

	int i;
	NumCarry carryFlag = 0;
	Modulus = (Byte*) malloc((length) * sizeof(Byte));

	ConvertLongNum(n, Modulus, length);

	LongNumShiftLeftMany(Modulus, (length - SIZE) * 8, length);

	for (i = 1; i <= (length - SIZE) * 8; i++)
	{
		if (LongNumCompare(Result, Modulus, length) >= 0)
			LongNumSub(Result, Modulus, Result, &carryFlag, length);
		LongNumShiftRight(Modulus, &carryFlag, length);
	}
	if (LongNumCompare(Result, Modulus, length) >= 0)
		LongNumSub(Result, Modulus, Result, &carryFlag, length);
	NumSetEqual(Result, result);

	free(Modulus);
}
