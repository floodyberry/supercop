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


#include    <string.h>
#include "Keccak-compact-settings.h"
#include "Keccak-compact.h"
#define cKeccakR_SizeInBytes    (cKeccakR / 8)
#include "crypto_hash.h"
#ifndef crypto_hash_BYTES
    #ifdef cKeccakFixedOutputLengthInBytes
        #define crypto_hash_BYTES cKeccakFixedOutputLengthInBytes
    #else
        #define crypto_hash_BYTES cKeccakR_SizeInBytes
    #endif
#endif
#if (crypto_hash_BYTES > cKeccakR_SizeInBytes)
    #error "Full squeezing not yet implemented"
#endif

#define IS_BIG_ENDIAN      4321 /* byte 0 is most significant (mc68k) */
#define IS_LITTLE_ENDIAN   1234 /* byte 0 is least significant (i386) */
#define PLATFORM_BYTE_ORDER IS_LITTLE_ENDIAN /* WARNING: This implementation works on little-endian platform. Support for big-endinanness is implemented, but not tested. */

#if     (cKeccakB   == 1600)
    typedef unsigned long long  UINT64;
    typedef UINT64 tKeccakLane;
    #define cKeccakNumberOfRounds   24
#elif   (cKeccakB   == 800)
    typedef unsigned int        UINT32;
    // WARNING: on 8-bit and 16-bit platforms, this should be replaced by:
    //typedef unsigned long       UINT32;
    typedef UINT32 tKeccakLane;
    #define cKeccakNumberOfRounds   22
#elif   (cKeccakB   == 400)
    typedef unsigned short      UINT16;
    typedef UINT16 tKeccakLane;
    #define cKeccakNumberOfRounds   20
#elif   (cKeccakB   == 200)
    typedef unsigned char       UINT8;
    typedef UINT8 tKeccakLane;
    #define cKeccakNumberOfRounds   18
#else
    #error  "Unsupported Keccak-f width"
#endif

typedef unsigned int tSmallUInt; /*INFO It could be more optimized to use "unsigned char" on an 8-bit CPU	*/


#define cKeccakLaneSizeInBits   (sizeof(tKeccakLane) * 8)

#define ROL(a, offset) (tKeccakLane)((((tKeccakLane)a) << ((offset) % cKeccakLaneSizeInBits)) ^ (((tKeccakLane)a) >> (cKeccakLaneSizeInBits-((offset) % cKeccakLaneSizeInBits))))

void KeccakF( tKeccakLane * state, const tKeccakLane *in, int laneCount );


int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
{
    tKeccakLane		state[5 * 5];
	#if (crypto_hash_BYTES >= cKeccakR_SizeInBytes)
    #define temp out
	#else
    unsigned char 	temp[cKeccakR_SizeInBytes];
	#endif

    memset( state, 0, sizeof(state) );

    for ( /* empty */; inlen >= cKeccakR_SizeInBytes; inlen -= cKeccakR_SizeInBytes, in += cKeccakR_SizeInBytes )
    {
        KeccakF( state, (const tKeccakLane*)in, cKeccakR_SizeInBytes / sizeof(tKeccakLane) );
    }

    /*    Last data and padding	*/
    memcpy( temp, in, (size_t)inlen );
    temp[inlen++] = 1;
    memset( temp+inlen, 0, cKeccakR_SizeInBytes - (size_t)inlen );
    temp[cKeccakR_SizeInBytes-1] |= 0x80;
    KeccakF( state, (const tKeccakLane*)temp, cKeccakR_SizeInBytes / sizeof(tKeccakLane) );

    #if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN) || (cKeccakB == 200)

    memcpy( out, state, crypto_hash_BYTES );

	#else

    for ( i = 0; i < (crypto_hash_BYTES / sizeof(tKeccakLane)); ++i )
	{
		tSmallUInt		j;
	    tKeccakLane		t;

		t = state[i];
		for ( j = 0; j < sizeof(tKeccakLane); ++j )
		{
			*(out++) = (unsigned char)t;
			t >>= 8;
		}
	}

	#endif
	#if (crypto_hash_BYTES >= cKeccakR_SizeInBytes)
    #undef temp
	#endif

    return ( 0 );
}


const tKeccakLane KeccakF_RoundConstants[cKeccakNumberOfRounds] = 
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
    (tKeccakLane)0x8000000000000080ULL
	#if		(cKeccakB	>= 400)
  , (tKeccakLane)0x000000000000800aULL,
    (tKeccakLane)0x800000008000000aULL
	#if		(cKeccakB	>= 800)
  , (tKeccakLane)0x8000000080008081ULL,
    (tKeccakLane)0x8000000000008080ULL
	#if		(cKeccakB	== 1600)
  , (tKeccakLane)0x0000000080000001ULL,
    (tKeccakLane)0x8000000080008008ULL
	#endif
	#endif
	#endif
};

const tSmallUInt KeccakF_RotationConstants[25] = 
{
	 1,  3,  6, 10, 15, 21, 28, 36, 45, 55,  2, 14, 27, 41, 56,  8, 25, 43, 62, 18, 39, 61, 20, 44
};

const tSmallUInt KeccakF_PiLane[25] = 
{
    10,  7, 11, 17, 18,  3,  5, 16,  8, 21, 24,  4, 15, 23, 19, 13, 12,  2, 20, 14, 22,  9,  6,  1 
};

const tSmallUInt KeccakF_Mod5[10] = 
{
    0, 1, 2, 3, 4, 0, 1, 2, 3, 4
};


void KeccakF( tKeccakLane * state, const tKeccakLane *in, int laneCount )
{
	tSmallUInt x, y;
    tKeccakLane temp;
    tKeccakLane BC[5];

	#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN) || (cKeccakB == 200)
    while ( --laneCount >= 0 )
	{
        state[laneCount] ^= in[laneCount];
	}
	#else
	temp = 0; /* please compiler */
    while ( --laneCount >= 0 )
	{
		for ( x = 0; x < sizeof(tKeccakLane); ++x )
		{
			temp <<= 8;
			temp |= ((char*)&in[laneCount])[x];
		}
        state[laneCount] = temp;
	}
	#endif

	#define	round	laneCount
    for( round = 0; round < cKeccakNumberOfRounds; ++round )
    {
		// Theta
		for ( x = 0; x < 5; ++x )
		{
			BC[x] = state[x] ^ state[5 + x] ^ state[10 + x] ^ state[15 + x] ^ state[20 + x];
		}
		for ( x = 0; x < 5; ++x )
		{
			temp = BC[KeccakF_Mod5[x+4]] ^ ROL(BC[KeccakF_Mod5[x+1]], 1);
			for ( y = 0; y < 25; y += 5 )
			{
				state[y + x] ^= temp;
			}
		}

        // Rho Pi
		temp = state[1];
		for ( x = 0; x < 24; ++x )
		{
			BC[0] = state[KeccakF_PiLane[x]];
			state[KeccakF_PiLane[x]] = ROL( temp, KeccakF_RotationConstants[x] );
			temp = BC[0];
		}

		//	Chi
		for ( y = 0; y < 25; y += 5 )
		{
			BC[0] = state[y + 0];
			BC[1] = state[y + 1];
			BC[2] = state[y + 2];
			BC[3] = state[y + 3];
			BC[4] = state[y + 4];
			for ( x = 0; x < 5; ++x )
			{
				state[y + x] = BC[x] ^((~BC[KeccakF_Mod5[x+1]]) & BC[KeccakF_Mod5[x+2]]);
			}
		}

		//	Iota
		state[0] ^= KeccakF_RoundConstants[round];
    }
	#undef	round

}


HashReturn Init(hashState *state)
{

	state->bitsInQueue = 0;
	memset( state->state, 0, sizeof(state->state) );

	return ( SUCCESS );
}

HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen)
{
	
	if ( (state->bitsInQueue < 0) || ((state->bitsInQueue % 8) != 0) )
	{
		/*	 Final() already called or bits already in queue not modulo 8.	*/
		return ( FAIL );
	}

	/*	If already data in queue, continue queuing first */
	for ( /* empty */; (databitlen >= 8) && (state->bitsInQueue != 0); databitlen -= 8 )
	{
		state->state[state->bitsInQueue / 8] ^= *(data++);
		if ( (state->bitsInQueue += 8) == cKeccakR )
		{
			KeccakF( (tKeccakLane *)state->state, 0, 0 );
			state->bitsInQueue = 0;
		}
	}

	/*	Absorb complete blocks */
	for ( /* */; databitlen >= cKeccakR; databitlen -= cKeccakR, data += cKeccakR_SizeInBytes )
	{
		KeccakF( (tKeccakLane *)state->state, (const tKeccakLane *)data, cKeccakR_SizeInBytes / sizeof(tKeccakLane) );
	}

	/*	Queue remaining data bytes */
	for ( /* empty */; databitlen >=8; databitlen -= 8, state->bitsInQueue += 8 )
	{
		state->state[state->bitsInQueue / 8] ^= *(data++);
	}
	/*	Queue eventual remaining data bits plus add first padding bit */
	if ( databitlen != 0 )
	{
		state->state[state->bitsInQueue / 8] ^= (*data >> (8 - databitlen));
		state->bitsInQueue += (int)databitlen;
	}
	return ( SUCCESS );
}

HashReturn Final(hashState *state, BitSequence *hashval, int hashbytelen)
{
	tSmallUInt	i;

	if ( state->bitsInQueue < 0 )
	{
		/*	 Final() already called.	*/
		return ( FAIL );
	}

    // Padding
    if (state->bitsInQueue + 1 == cKeccakR_SizeInBytes*8) {
        state->state[cKeccakR_SizeInBytes-1] ^= 0x80;
		KeccakF( (tKeccakLane *)state->state, 0, 0 );
    }
    else {
        state->state[state->bitsInQueue/8] ^= 1 << (state->bitsInQueue % 8);
    }
    state->state[cKeccakR_SizeInBytes-1] ^= 0x80;
    KeccakF( (tKeccakLane *)state->state, 0, 0 );

    // Output
	for ( /* empty */; hashbytelen != 0; hashval += i, hashbytelen -= i )
	{
		i = (hashbytelen < cKeccakR_SizeInBytes) ? hashbytelen : cKeccakR_SizeInBytes;

		#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN) || (cKeccakB == 200)

	    memcpy( hashval, state->state, i );

		#else

	    for ( offset = 0; offset < i; offset += sizeof(tKeccakLane) )
		{
			tSmallUInt		j;

			for ( j = 0; j < sizeof(tKeccakLane); ++j )
			{
				hashval[offset + j] = state->state[offset + (sizeof(tKeccakLane) - 1) - j];
			}
		}

		#endif

		if ( i != hashbytelen )
		{
			KeccakF( (tKeccakLane *)state->state, 0, 0 );
		}
	}

	state->bitsInQueue = -1;	/* flag final state */
	return ( SUCCESS );
}
