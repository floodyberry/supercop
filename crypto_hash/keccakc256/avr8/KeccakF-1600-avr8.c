/*
The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
Michaël Peeters and Gilles Van Assche. For more information, feedback or
questions, please refer to our website: http://keccak.noekeon.org/

Implementation by Ronny Van Keer,
hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#include <string.h>
#include <avr/pgmspace.h>
#include "AVR8-rotate64.h"

typedef unsigned char				UINT8;
typedef UINT8								tSmallUInt;
typedef unsigned long long  UINT64;
typedef UINT64 							tKeccakLane;

#define cKeccakLaneSizeInBits   (sizeof(tKeccakLane) * 8)

#define cKeccakNumberOfRounds   24

static tKeccakLane KeccakF_RoundConstants[cKeccakNumberOfRounds] PROGMEM = 
{
    (tKeccakLane)0x0000000000000001ULL,
    (tKeccakLane)0x0000000000008082ULL,
    (tKeccakLane)0x800000000000808aULL,
    (tKeccakLane)0x8000000080008000ULL,
    (tKeccakLane)0x000000000000808bULL,
    (tKeccakLane)0x0000000080000001ULL,
    (tKeccakLane)0x8000000080008081ULL,
    (tKeccakLane)0x8000000000008009ULL,
    (tKeccakLane)0x000000000000008aULL,
    (tKeccakLane)0x0000000000000088ULL,
    (tKeccakLane)0x0000000080008009ULL,
    (tKeccakLane)0x000000008000000aULL,
    (tKeccakLane)0x000000008000808bULL,
    (tKeccakLane)0x800000000000008bULL,
    (tKeccakLane)0x8000000000008089ULL,
    (tKeccakLane)0x8000000000008003ULL,
    (tKeccakLane)0x8000000000008002ULL,
    (tKeccakLane)0x8000000000000080ULL,
    (tKeccakLane)0x000000000000800aULL,
    (tKeccakLane)0x800000008000000aULL,
    (tKeccakLane)0x8000000080008081ULL,
    (tKeccakLane)0x8000000000008080ULL,
    (tKeccakLane)0x0000000080000001ULL,
    (tKeccakLane)0x8000000080008008ULL
};

static tSmallUInt KeccakF_RotationConstants[24] PROGMEM = 
{
	 ROT_CODE( 1), ROT_CODE( 3), ROT_CODE( 6), ROT_CODE(10), ROT_CODE(15), 
	 ROT_CODE(21), ROT_CODE(28), ROT_CODE(36), ROT_CODE(45), ROT_CODE(55),  
	 ROT_CODE( 2), ROT_CODE(14), ROT_CODE(27), ROT_CODE(41), ROT_CODE(56),  
	 ROT_CODE( 8), ROT_CODE(25), ROT_CODE(43), ROT_CODE(62), ROT_CODE(18), 
	 ROT_CODE(39), ROT_CODE(61), ROT_CODE(20), ROT_CODE(44)
};

static tSmallUInt KeccakF_PiLane[24] PROGMEM = 
{
    10,  7, 11, 17, 18,  3,  5, 16,  8, 21, 24,  4, 15, 23, 19, 13, 12,  2, 20, 14, 22,  9,  6,  1 
};

static tSmallUInt KeccakF_Mod5[10] PROGMEM = 
{
    0, 1, 2, 3, 4, 0, 1, 2, 3, 4
};


void KeccakF( tKeccakLane * state )
{
	tSmallUInt	round;
	tKeccakLane	C[5];

	// prepare Theta
	{
		tSmallUInt x;
		tKeccakLane	* pC;
		for ( x = 0, pC = C; x < 5; ++x, ++pC )
		{
			*pC = state[x] ^ state[5 + x] ^ state[10 + x] ^ state[15 + x] ^ state[20 + x];
		}
	}

  for( round = 0; round < cKeccakNumberOfRounds; ++round )
  {
		// Theta
  	{
			tSmallUInt x;
			for ( x = 0; x < 5; ++x )
			{
				tKeccakLane temp;
				tSmallUInt y;
				temp = rotate64_1bit_left( C[pgm_read_byte((KeccakF_Mod5+1)+x)] );
				temp ^= C[pgm_read_byte((KeccakF_Mod5+4)+x)];
				for ( y = 0; y < 25; y += 5 )
				{
					state[y + x] ^= temp;
				}
			}
		}

    // Rho Pi
    {
			tKeccakLane temp;
			tSmallUInt x;
	
			temp = state[1];
			for ( x = 0; x < 24; ++x )
			{
				tSmallUInt t;
				tKeccakLane T[1];
				t = pgm_read_byte(&KeccakF_PiLane[x]);
				T[0] = state[t];
				state[t] = rotate64left_code( temp, pgm_read_byte(&KeccakF_RotationConstants[x]) );
				temp = T[0];
			}
		}

		// Chi Iota Prepare Theta
		{
			tSmallUInt z;
			UINT8 * p = (unsigned char *)state;
			UINT8 * pC = (unsigned char *)C;

			for( z = 0; z < 8; ++z, ++p, ++pC ) 
			{
				tSmallUInt y;
				UINT8 c0, c1, c2, c3, c4, t;

				c0 = c1 = c2 = c3 = c4 = 0;
				for( y = 5; y != 0; --y, p += 40 ) 
				{
					UINT8 a0 = *p;
					UINT8 a1 = *(p+8);
					UINT8 a2 = *(p+16);
					UINT8 a3 = *(p+24);
					UINT8 a4 = *(p+32);

					*p			= t = a0 ^ ((~a1) & a2); c0 ^= t;
					*(p+8)	= t = a1 ^ ((~a2) & a3); c1 ^= t;
					*(p+16) = a2 ^= ((~a3) & a4); c2 ^= a2;
					*(p+24) = a3 ^= ((~a4) & a0); c3 ^= a3;
					*(p+32) = a4 ^= ((~a0) & a1); c4 ^= a4;
				}
				p -= 5 * 5 * 8;
				y = pgm_read_byte( (UINT8 *)(KeccakF_RoundConstants+round) + z );
				*p ^= y;
				*pC 			= c0 ^ y;
				*(pC+ 8)	= c1;
				*(pC+16)	= c2;
				*(pC+24)	= c3;
				*(pC+32)	= c4;
			}
		}
  }

}
