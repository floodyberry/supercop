/*
Algorithm Name: Keccak
Authors: Guido Bertoni, Joan Daemen, Michaël Peeters and Gilles Van Assche
Implementation by Ronny Van Keer, STMicroelectronics

This code, originally by Ronny Van Keer, is hereby put in the public domain.
It is given as is, without any guarantee.

For more information, feedback or questions, please refer to our website:
http://keccak.noekeon.org/
*/

#include <string.h>
#include <avr/pgmspace.h>
#include "Keccak-avr8.h"
#include "Keccak-avr8-util.h"


#define cKeccakR_SizeInBytes    (cKeccakR / 8)
#include "crypto_hash.h"
#ifndef crypto_hash_BYTES
	#if (cKeccakD == 0)
    	#define crypto_hash_BYTES cKeccakR_SizeInBytes
	#else
		#define crypto_hash_BYTES cKeccakD
	#endif
#endif
#if (crypto_hash_BYTES > cKeccakR_SizeInBytes)
    #error "Full squeezing not yet implemented"
#endif

typedef unsigned char				UINT8;
typedef UINT8								tSmallUInt;
typedef unsigned long long  UINT64;
typedef UINT64 							tKeccakLane;

void KeccakF( tKeccakLane * state );


unsigned char KeccakPadding[] PROGMEM = { 1, cKeccakD, cKeccakR_SizeInBytes, 1 };

int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
{
#if 1

	tSmallUInt			i;
	tSmallUInt			len;
	unsigned char * pState;
  tKeccakLane			state[5 * 5];

  memset( state, 0, sizeof(state) );

	/*	Full blocks	*/
  for ( /* empty */; inlen >= cKeccakR_SizeInBytes; inlen -= cKeccakR_SizeInBytes )
  {
		in = xorLanes( state, in, cKeccakR_SizeInBytes / 8 );
    KeccakF( state );
  }

  /*	Last uncomplete block */
	len = (tSmallUInt)inlen;
	xorBytes( state, in, len );

	pState = (unsigned char*)state + len; 

  /*	Padding	*/
	for ( i = 0; i < 4; /* empty */ )
	{
    *(pState++) ^= pgm_read_byte(&KeccakPadding[i++]);
    if ( ++len == cKeccakR_SizeInBytes )
    {
        KeccakF( state );
        pState = (unsigned char*)state;
        len = 0;
    }
	}

  if ( len != 0 )
  {
    KeccakF( state );
  }

  memcpy( out, state, crypto_hash_BYTES );

	return ( 0 );

#else

	hashState state;

	Init( &state );
	Update( &state, in, inlen * 8 );
	return (Final( &state, out, crypto_hash_BYTES ) );

#endif

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
		state->trailingBitsInQueue = 1;
		state->state[state->bytesInQueue++] ^= (*data >> (8 - trailingBits)) | (1 << trailingBits);
	}
	return ( SUCCESS );
}

HashReturn Final(hashState *state, BitSequence *hashval, int hashbytelen)
{
	tSmallUInt	i;
	tSmallUInt	offset;

	if ( state->bytesInQueue < 0 )
	{
		/*	 Final() already called.	*/
		return ( FAIL );
	}

	offset = state->bytesInQueue;
	for ( i = state->trailingBitsInQueue; i < 4; ++i )
	{
	    if ( offset == cKeccakR_SizeInBytes )
	    {
				KeccakF( (tKeccakLane *)state->state );
	      offset = 0;
	    }
	    state->state[offset++] ^= pgm_read_byte( &KeccakPadding[i] );
	}

	if ( offset != 0 )
	{
		KeccakF( (tKeccakLane *)state->state );
	}

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
