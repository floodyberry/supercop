#include "crypto_aead.h"
#include "api.h"
#include <stdio.h>
#include <string.h>

typedef unsigned char u8;
typedef unsigned long long u64;

static void store64to8x8(u8 *Bytes, u64 Block) 
{ int i; for (i = 7; i >= 0; i--) {Bytes[i] = (u8)Block; Block >>= 8; }}

void revolve_all(u8 * state,  u8 * carry)
{
	int i;
	
	for(i = 0; i < 256; i++)
	{
		if(state[(i+2)%256]>state[(i+3)%256])
			* carry ^= state[(i+1)%256];
		else
			* carry ^= ~state[(i+1)%256];

		state[i] ^= * carry;
	}
}

void evolve(u8 * state)
{
	int i, j;
	
	for(i = 0; i < 256; i++)
	{	
		for(j = 0; j < 256; j++)
		{
			if(state[(j + 1) % 256] > state[(j + 3) % 256])
				state[j % 256] ^=  state[(j + 1) % 256];
			else
				state[j % 256] ^=  ~state[(j + 1) % 256];
			
			if(state[(j + 2) % 256] > state[(j + 3) % 256])
				state[j % 256] ^=  state[(j + 2) % 256];
			else
				state[j % 256] ^=  ~state[(j + 2) % 256];	
			
			if(state[(j + 3) % 256] % 2 == 1)
				state[j % 256] ^=  state[(j + 3) % 256];
			else
				state[j % 256] ^=  ~state[(j + 3) % 256];	
		}
	}
}

int crypto_aead_encrypt
(
	u8 *c,u64 *clen,
	const u8 *m,u64 mlen,
	const u8 *ad,u64 adlen,
	const u8 *nsec,
	const u8 *npub,
	const u8 *k
)
{
	u8 ignite[1028] = {0};
	u8 ping[256], pong[256], sing[256], song[256];
	u8 carry = 'a', mixer = 'b';
	u64 i, j;
		
	memmove(ignite, k, CRYPTO_KEYBYTES);
	memmove(ignite + CRYPTO_KEYBYTES, npub, CRYPTO_NPUBBYTES);
	store64to8x8(ignite + (CRYPTO_KEYBYTES + CRYPTO_NPUBBYTES), mlen);
	store64to8x8(ignite + (CRYPTO_KEYBYTES + CRYPTO_NPUBBYTES + 8), adlen);
	*clen = mlen + CRYPTO_ABYTES;
	
	for(i = 0; i < 8; i++)
	{
		for(j = 0; j < 1028; j++)
		{
			if(ignite[(j+2)%1028]>ignite[(j+3)%1028])
				carry ^= ignite[(j+1)%1028];
			else
				carry ^= ~ignite[(j+1)%1028];

			ignite[j] ^= carry;
			carry += mixer;
		}
	}
	
	for(i = 0; i < 256; i++)
	{
		ping[i] = ignite[i];
		pong[i] = ignite[i + 256];
		sing[i] = ignite[i + 512];
		song[i] = ignite[i + 768];
	}
	
	for(i = 0; i < mlen; i++)
	{
		if(ping[(i+2)%256]>ping[(i+3)%256])
			ignite[1024] ^= ping[(i+1)%256];
		else
			ignite[1024] ^= ~ping[(i+1)%256];

		ping[i%256] ^= ignite[1024];
		
		if(pong[(i+2)%256]>pong[(i+3)%256])
			ignite[1025] ^= pong[(i+1)%256];
		else
			ignite[1025] ^= ~pong[(i+1)%256];

		pong[i%256] ^= ignite[1025];
		
		if(sing[(i+2)%256]>sing[(i+3)%256])
			ignite[1026] ^= sing[(i+1)%256];
		else
			ignite[1026] ^= ~sing[(i+1)%256];

		sing[i%256] ^= ignite[1026];
			
		c[i] = m[i] ^ ping[i%256] ^ pong[i%256] ^ sing[i%256];
	}
	
	for(i = 0; i < adlen; i++)
	{
		song[i%256] ^= ad[i];
		if(i%256 == 0 && i > 0)
			revolve_all(song, &ignite[1027]);
	}
	revolve_all(song, &ignite[1027]);
	
	for(i = 0; i < mlen; i++)
	{
		song[i%256] ^= c[i];
		if(i%256 == 0 && i > 0)
			revolve_all(song, &ignite[1027]);
	}
	revolve_all(song, &ignite[1027]);
	
	evolve(song);
	
	memmove(c + mlen, song + 128, CRYPTO_ABYTES);
	
	return 0;
}

int crypto_aead_decrypt
(
	u8 *m,u64 *mlen,
	u8 *nsec,
	const u8 *c,u64 clen,
	const u8 *ad,u64 adlen,
	const u8 *npub,
	const u8 *k
)
{
	u8 ignite[1028] = {0};
	u8 ping[256], pong[256], sing[256], song[256];
	u8 carry = 'a', mixer = 'b';
	u64 i, j;
		
	*mlen = clen - CRYPTO_ABYTES;
	memmove(ignite, k, CRYPTO_KEYBYTES);
	memmove(ignite + CRYPTO_KEYBYTES, npub, CRYPTO_NPUBBYTES);
	store64to8x8(ignite + (CRYPTO_KEYBYTES + CRYPTO_NPUBBYTES), *mlen);
	store64to8x8(ignite + (CRYPTO_KEYBYTES + CRYPTO_NPUBBYTES + 8), adlen);
	
	for(i = 0; i < 8; i++)
	{
		for(j = 0; j < 1028; j++)
		{
			if(ignite[(j+2)%1028]>ignite[(j+3)%1028])
				carry ^= ignite[(j+1)%1028];
			else
				carry ^= ~ignite[(j+1)%1028];

			ignite[j] ^= carry;
			carry += mixer;
		}
	}
	
	for(i = 0; i < 256; i++)
	{
		ping[i] = ignite[i];
		pong[i] = ignite[i + 256];
		sing[i] = ignite[i + 512];
		song[i] = ignite[i + 768];
	}
		
	for(i = 0; i < adlen; i++)
	{
		song[i%256] ^= ad[i];
		if(i%256 == 0 && i > 0)
			revolve_all(song, &ignite[1027]);
	}
	revolve_all(song, &ignite[1027]);
	
	for(i = 0; i < *mlen; i++)
	{
		song[i%256] ^= c[i];
		if(i%256 == 0 && i > 0)
			revolve_all(song, &ignite[1027]);
	}
	revolve_all(song, &ignite[1027]);
	
	evolve(song);
	
	if(memcmp(song + 128, c + *mlen, CRYPTO_ABYTES) != 0)
		return -1;
		
	for(i = 0; i < *mlen; i++)
	{
		if(ping[(i+2)%256]>ping[(i+3)%256])
			ignite[1024] ^= ping[(i+1)%256];
		else
			ignite[1024] ^= ~ping[(i+1)%256];

		ping[i%256] ^= ignite[1024];
		
		if(pong[(i+2)%256]>pong[(i+3)%256])
			ignite[1025] ^= pong[(i+1)%256];
		else
			ignite[1025] ^= ~pong[(i+1)%256];

		pong[i%256] ^= ignite[1025];
		
		if(sing[(i+2)%256]>sing[(i+3)%256])
			ignite[1026] ^= sing[(i+1)%256];
		else
			ignite[1026] ^= ~sing[(i+1)%256];

		sing[i%256] ^= ignite[1026];
		
		m[i] = c[i] ^ ping[i%256] ^ pong[i%256] ^ sing[i%256];
	}
	
	return 0;
}
