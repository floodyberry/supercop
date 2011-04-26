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
#include "Keccak-compact8.h"

#define cKeccakR_SizeInBytes    (cKeccakR / 8)
#include "crypto_hash.h"
#ifndef crypto_hash_BYTES
    #ifdef cKeccakFixedOutputLengthInBytes
        #define crypto_hash_BYTES cKeccakFixedOutputLengthInBytes
    #else
        #define crypto_hash_BYTES cKeccakR_SizeInBytes
    #endif
#endif

typedef unsigned char				UINT8;
typedef UINT8								tSmallUInt;
typedef unsigned long long  UINT64;
typedef UINT64 							tKeccakLane;

#define cKeccakLaneSizeInBits   (sizeof(tKeccakLane) * 8)

#define cKeccakNumberOfRounds   24

void KeccakF( tKeccakLane * state );


const void * xorBytes( void* dest, const void* src, tSmallUInt n )
{
    tSmallUInt i;
    UINT8 *pDest = (UINT8*)dest;
    const UINT8 *pSrc = (const UINT8*)src;
    for(i=0; i<n; i++)
        *(pDest++) ^= *(pSrc++);
    return pSrc;
}

const void * xorLanes( void* dest, const void* src, tSmallUInt n )
{
    tSmallUInt i;
    UINT64 *pDest = (UINT64*)dest;
    const UINT64 *pSrc = (const UINT64*)src;
    for(i=0; i<n; i++)
        *(pDest++) ^= *(pSrc++);
    return pSrc;
}

UINT64 rotate64_1bit_left( UINT64 a )
{
    return (a << 1) | (a >> 63);
}

UINT64 rotate64left( UINT64 a, tSmallUInt r )
{
    return (a << r) | (a >> (64-r));
}

int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
{
#if 1

	hashState state;

	Init( &state );
	Update( &state, in, inlen * 8 );
	return (Final( &state, out, crypto_hash_BYTES ) );

#else

		tSmallUInt		i;
		tSmallUInt		len;
		unsigned char * pState;
    tKeccakLane		state[5 * 5];

    memset( state, 0, sizeof(state) );

#if 1
		/*	Full blocks	*/
    for ( /* empty */; inlen >= cKeccakR_SizeInBytes; inlen -= cKeccakR_SizeInBytes )
    {
			in = xorLanes( state, in, cKeccakR_SizeInBytes / 8 );
      KeccakF( state );
    }

    /*    Last uncomplete block */
		len = (tSmallUInt)inlen;
		xorBytes( state, in, len );

 		pState = (unsigned char*)state + len; 

#else

		/*	Full blocks	*/
    for ( /* empty */; inlen >= cKeccakR_SizeInBytes; inlen -= cKeccakR_SizeInBytes )
    {
			pState = (unsigned char*)state; 
    	for ( i = cKeccakR_SizeInBytes; i != 0; --i )
   		{
	 			*(pState++) ^= *(in++);
   		}
      KeccakF( state );
    }

    /*    Last uncomplete block */
 		pState = (unsigned char*)state; 
 		for ( i = len = (tSmallUInt)inlen; i != 0; --i )
 		{
 			*(pState++) ^= *(in++);
 		}

#endif


    /*    Padding	*/
    *pState ^= 1;
    ((UINT8*)state)[cKeccakR_SizeInBytes-1] ^= 0x80;
    KeccakF( state );

#if (crypto_hash_BYTES > cKeccakR_SizeInBytes)
    #error "Full squeezing not yet implemented"
#endif
    memcpy( out, state, crypto_hash_BYTES );

		return ( 0 );

#endif
}


static tKeccakLane KeccakF_RoundConstants[cKeccakNumberOfRounds] = 
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

static tSmallUInt KeccakF_RotationConstants[24] = 
{
	  1,  3,  6, 10, 15, 21, 28, 36, 45, 55, 2, 14, 27, 41, 56, 8, 25, 43, 62, 18, 39, 61, 20, 44
};

static tSmallUInt KeccakF_PiLane[24] = 
{
    10,  7, 11, 17, 18,  3,  5, 16,  8, 21, 24,  4, 15, 23, 19, 13, 12,  2, 20, 14, 22,  9,  6,  1 
};

static tSmallUInt KeccakF_Mod5[10] = 
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
				temp = rotate64_1bit_left( C[KeccakF_Mod5[x+1]] );
				temp ^= C[KeccakF_Mod5[x+4]];
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
				t = KeccakF_PiLane[x];
				T[0] = state[t];
				state[t] = rotate64left( temp, KeccakF_RotationConstants[x] );
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
				y = ((UINT8 *)(KeccakF_RoundConstants+round))[z];
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

/*
** API with a message queue
*/

HashReturn Init(hashState *state)
{
	memset( state, 0, sizeof(hashState) );
	return ( SUCCESS );
}

HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen)
{
	tSmallUInt	trailingBits;
	tSmallUInt	len;
	
	if ( (state->bytesInQueue == 0xFF) || (state->trailingBitsInQueue != 0) )
	{
		/*	 Final() already called or bits already in queue not modulo 8.	*/
		return ( FAIL );
	}

	trailingBits = (unsigned char)databitlen & 7;
	databitlen >>= 3;	/*	becomes byte length	*/
	
	/*	If already data in queue, continue queuing first */
	if ( (state->bytesInQueue != 0) && (databitlen != 0) )
	{
		len = cKeccakR_SizeInBytes - state->bytesInQueue;
		if ( databitlen < len )
		{
			len = (unsigned char)databitlen;
		}
		data = xorBytes( state->state + state->bytesInQueue, data, len );
		databitlen -= len;
		if ( (state->bytesInQueue += len) == cKeccakR_SizeInBytes )
		{
			KeccakF( (tKeccakLane *)state->state );
			state->bytesInQueue = 0;
		}
	}

	/*	Absorb complete blocks */
	for ( /* */; databitlen >= cKeccakR_SizeInBytes; databitlen -= cKeccakR_SizeInBytes )
	{
		data = xorLanes( state->state, data, cKeccakR_SizeInBytes / 8 );
		KeccakF( (tKeccakLane *)state->state );
	}

	/*	Queue remaining data bytes */
	if ( (unsigned char)databitlen != 0 )
	{
		data = xorBytes( state->state, data, (unsigned char)databitlen );
		state->bytesInQueue = (unsigned char)databitlen;
	}

	/*	Queue eventual remaining data bits plus add first padding bit */
	if ( trailingBits != 0 )
	{
		state->trailingBitsInQueue = trailingBits;
		state->state[state->bytesInQueue] ^= (*data >> (8 - trailingBits));
	}
	return ( SUCCESS );
}

HashReturn Final(hashState *state, BitSequence *hashval, int hashbytelen)
{
	tSmallUInt	i;

	if ( state->bytesInQueue < 0 )
	{
		/*	 Final() already called.	*/
		return ( FAIL );
	}

    // Padding
    if ((state->bytesInQueue == (cKeccakR_SizeInBytes - 1)) && (state->trailingBitsInQueue == 7)) {
        state->state[cKeccakR_SizeInBytes-1] ^= 0x80;
        KeccakF( (tKeccakLane *)state->state );
    }
    else {
        state->state[state->bytesInQueue] ^= 1 << state->trailingBitsInQueue;
    }
    state->state[cKeccakR_SizeInBytes-1] ^= 0x80;
    KeccakF( (tKeccakLane *)state->state );

    // Output
	for ( /* empty */; hashbytelen != 0; hashval += i, hashbytelen -= i )
	{
		i = (hashbytelen < cKeccakR_SizeInBytes) ? hashbytelen : cKeccakR_SizeInBytes;

    memcpy( hashval, state->state, i );

		if ( i != hashbytelen )
		{
			KeccakF( (tKeccakLane *)state->state );
		}
	}

	state->bytesInQueue = 0xFF;	/* flag final state */
	return ( SUCCESS );
}
