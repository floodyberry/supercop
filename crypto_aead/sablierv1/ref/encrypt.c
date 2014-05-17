/* tested code for the submitted tested vectors */
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;

#include "api.h"
#include "cipher_1.h"
#include "authenticate_1.h"
#include "crypto_aead.h"



int crypto_aead_encrypt(
	unsigned char *c, unsigned long long *clen,
	const unsigned char *m, unsigned long long mlen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
	)
{
	u8 i;
	Sablier_State state;
	Sablier_Authenstate authenstate;

	memset(&state, 0, sizeof(Sablier_State));
	memset(&authenstate, 0, sizeof(Sablier_Authenstate));

	Initialization(&state, k, npub);     /*initializing the state*/
	
	
	Authenticated_encryption(&state, &authenstate, ad, npub, m, c, mlen, adlen, CRYPTO_NPUBBYTES);
	for (i = 0; i < CRYPTO_ABYTES; i++)c[mlen + i] = authenstate.accumulator[i];
	*clen = mlen + CRYPTO_ABYTES;

	return(0);

}

/*
int crypto_aead_encrypt(
	unsigned char *c, unsigned long long *clen,
	const unsigned char *m, unsigned long long mlen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
	)
{
	u8 i;
	Sablier_State state;
	Sablier_Authenstate authenstate;

	memset(&state, 0, sizeof(Sablier_State));
	memset(&authenstate, 0, sizeof(Sablier_Authenstate));

	Initialization(&state, (u8*)k, (u8*)npub);     //initializing the state

	if (npub[0] & 1)
	{
		*clen = mlen + CRYPTO_ABYTES;
		Authenticated_encryption(&state, &authenstate, ad, npub, m, c, mlen, adlen, CRYPTO_NPUBBYTES);
		for (i = 0; i < CRYPTO_ABYTES; i++)c[mlen + i] = authenstate.accumulator[i];
	}
	else
	{
		*clen = mlen;
		EncryptMessage(&state, m, c, mlen);
	}
	
	return(0);
}
*/

int crypto_aead_decrypt(
	unsigned char *m, unsigned long long *mlen,
	unsigned char *nsec,
	const unsigned char *c, unsigned long long clen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k
	)
{
	u8 i, receivedtag[4];
	Sablier_State state;
	Sablier_Authenstate authenstate;

	memset(&state, 0, sizeof(Sablier_State));
	memset(&authenstate, 0, sizeof(Sablier_Authenstate));
	for (i = 0; i < CRYPTO_ABYTES; i++)receivedtag[i] = 0x0;
	for (i = 0; i < CRYPTO_ABYTES; i++)receivedtag[i] = c[clen - CRYPTO_ABYTES + i];

	Initialization(&state, k, npub);     /*initializing the state*/
	*mlen = clen - CRYPTO_ABYTES;

	Authenticated_decryption(&state, &authenstate, ad, npub, adlen, CRYPTO_NPUBBYTES);
	Authenticated_decryptmes(&state, &authenstate, m, c, *mlen);
	for (i = 0; i < 4; i++)authenstate.tag[i] = authenstate.accumulator[i];
	if (memcmp(authenstate.tag, receivedtag, CRYPTO_ABYTES) != 0)return(-1);
	else return(0);
	
}

/*
int crypto_aead_decrypt(
	unsigned char *m, unsigned long long *mlen,
	unsigned char *nsec,
	const unsigned char *c, unsigned long long clen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k
	)
{
	int i;
	u8 receivedtag[4];
	Sablier_State state;
	Sablier_Authenstate authenstate;

	memset(&state, 0, sizeof(Sablier_State));
	memset(&authenstate, 0, sizeof(Sablier_Authenstate));
	for (i = 0; i < CRYPTO_ABYTES; i++)receivedtag[i] = 0x0;
	//	for (i = CRYPTO_ABYTES -1; i >= 0; i--)receivedtag[3-i] = c[clen -1 - i];
	for (i = 0; i < CRYPTO_ABYTES; i++)receivedtag[i] = c[clen - CRYPTO_ABYTES + i];
	

	Initialization(&state, (u8*)k, (u8*)npub);     //initializing the state

	if (npub[0] & 1)
	{
		*mlen = clen - CRYPTO_ABYTES;
		Authenticated_decryption(&state, &authenstate, ad, npub, adlen, CRYPTO_NPUBBYTES);
		Authenticated_decryptmes(&state, &authenstate, m, c, *mlen);
		for (i = 0; i < 4; i++)authenstate.tag[i] = authenstate.accumulator[i];
		if (memcmp(authenstate.tag, receivedtag, CRYPTO_ABYTES) != 0)return(-1);
		else return(0);
	}
	else
	{
		*mlen = clen;
		EncryptMessage(&state, c, m, clen - CRYPTO_ABYTES);
		return(0);
	}
	
}
*/



