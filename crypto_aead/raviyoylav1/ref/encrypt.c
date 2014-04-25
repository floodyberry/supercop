#include "crypto_aead.h"
#include "api.h"
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

void stir(uint64_t * state, int statelen)
{
	uint64_t mixer = 6148914691236517205;//010101...
	uint64_t carry = 1234567890123456789;
	int i, j, rounds = 8;
	
	for(i = 0; i < rounds; i++)
	{
		for(j = 0; j < statelen; j++)
		{
			if(state[(j+2)%statelen]>state[(j+3)%statelen])
				carry ^= state[(j+1)%statelen];
			else
				carry ^= ~state[(j+1)%statelen];

			state[j] ^= carry;
			carry += mixer;
		}
	}
}

uint64_t revolve_step(uint64_t * state, int i, int elen, uint64_t * carry)
{
	if(state[(i+2)%elen]>state[(i+3)%elen])
		* carry ^= state[(i+1)%elen];
	else
		* carry ^= ~state[(i+1)%elen];

	state[i%elen] ^= * carry;
	return state[i];
}

void get_stream(uint64_t * ignite, int nglen, 
	unsigned char * stream_random, unsigned long long mlen)
{
	uint64_t * ping, * pong, * sing;
	uint64_t ping_carry, pong_carry, sing_carry;
	uint64_t statelen = 1028;
	uint64_t three, i;
	uint64_t end = mlen / 8;
	
	ping = &ignite[0];
	pong = &ignite[256];
	sing = &ignite[512];
	ping_carry = ignite[statelen - 4];
	pong_carry = ignite[statelen - 3];
	sing_carry = ignite[statelen - 2];
	
	for(i = 0; i < end; i++)
	{
		three = revolve_step(ping, i, nglen, &ping_carry)
		^ revolve_step(pong, i, nglen, &pong_carry)
		^ revolve_step(sing, i, nglen, &sing_carry);
		memmove(stream_random + (i * 8), (uint64_t *) &three, 8);
	}
	
	if((mlen % 8) > 0)
	{
		three = revolve_step(ping, i, (statelen / 4) -1, &ping_carry)
		^ revolve_step(pong, i, (statelen / 4) -1, &pong_carry)
		^ revolve_step(sing, i, (statelen / 4) -1, &sing_carry);
		memmove(stream_random + (i * 8), (uint64_t *) &three, end % 8);
	}
}

void revolve_all(uint64_t * state, int elen, uint64_t * carry)
{
	int i;
	
	for(i = 0; i < elen; i++)
	{
		if(state[(i+2)%elen]>state[(i+3)%elen])
			* carry ^= state[(i+1)%elen];
		else
			* carry ^= ~state[(i+1)%elen];

		state[i] ^= * carry;
	}
}

void evolve(uint64_t * state, int statelen)
{
	int i, j;
	
	for(i = 0; i < statelen; i++)
	{	
		for(j = 0; j < statelen; j++)
		{
			if(state[(j + 1) % statelen] > state[(j + 3) % statelen])
				state[j % statelen] ^=  state[(j + 1) % statelen];
			else
				state[j % statelen] ^=  ~state[(j + 1) % statelen];
			
			if(state[(j + 2) % statelen] > state[(j + 3) % statelen])
				state[j % statelen] ^=  state[(j + 2) % statelen];
			else
				state[j % statelen] ^=  ~state[(j + 2) % statelen];	
			
			if(state[(j + 3) % statelen] % 2 == 1)
				state[j % statelen] ^=  state[(j + 3) % statelen];
			else
				state[j % statelen] ^=  ~state[(j + 3) % statelen];	
		}
	}
}

int crypto_aead_encrypt
(
	unsigned char *c,unsigned long long *clen,
	const unsigned char *m,unsigned long long mlen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
)
{
	int statelen = 1028, nglen = 256;
	uint64_t ignite[1028] = {0};
	uint64_t * song;
	uint64_t song_carry;
	uint64_t i, j;
	char * song_char;
	unsigned char * stream_random;
	
	*clen = mlen + CRYPTO_ABYTES;
	
	c = (unsigned char *) calloc (*clen, sizeof(char));
		if (c==NULL)
		{
			printf ("Error allocating requested memory");
			exit (1);
		}
						
	memmove(&ignite[0], k, CRYPTO_KEYBYTES );
	memmove(&ignite[4], npub, CRYPTO_NPUBBYTES); 
	ignite[statelen - 1] = mlen;
	ignite[statelen - 2] = adlen;
	stir(ignite, statelen);
	
	stream_random = (unsigned char *) calloc ( mlen,sizeof(char) );
		if (stream_random==NULL)
		{
			printf ("Error allocating requested memory");
			exit (1);
		}
		
	get_stream(ignite, nglen, stream_random, mlen);
	
	for(i = 0; i < mlen; i++)
		c[i] = m[i] ^ stream_random[i];
		
	free(stream_random);
	
	song = &ignite[768];
	song_carry = ignite[statelen - 1];
	song_char = (char *)song;
	
	for(i = 0; i < adlen; i++)
	{
		song_char[i % 2048] ^= ad[i];
		if(i % 2047 == 0 && i > 0) revolve_all(song, 256, &song_carry);
	}
	for(i = adlen, j = 0; i < (adlen + mlen); i++, j++)
	{
		song_char[i % 2048] ^= c[j];
		if(i % 2047 == 0) revolve_all(song, 256, &song_carry);
	}
	if(i % 2047 > 0) revolve_all(song, 256, &song_carry);
	
	evolve(song, 256);
	
	memmove(&c[mlen], &song[256 / 2], CRYPTO_ABYTES);
		
	return 0;
}

int crypto_aead_decrypt
(
	unsigned char *m,unsigned long long *mlen,
	unsigned char *nsec,
	const unsigned char *c,unsigned long long clen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k
)
{
	int statelen = 1028, nglen = 256;
	uint64_t ignite[1028] = {0};
	uint64_t * song;
	uint64_t song_carry;
	uint64_t i, j;
	char * song_char;
	unsigned char * stream_random;
	unsigned char tag[CRYPTO_ABYTES];
	unsigned char ctag[CRYPTO_ABYTES];
	
	*mlen = clen - CRYPTO_ABYTES;
	
	m = (unsigned char *) calloc (*mlen, sizeof(char));
		if (c==NULL)
		{
			printf ("Error allocating requested memory");
			exit (1);
		}
	
	memmove(&ignite[0], k, CRYPTO_KEYBYTES );
	memmove(&ignite[4], npub, CRYPTO_NPUBBYTES); 
	ignite[statelen - 1] = clen - CRYPTO_ABYTES;
	ignite[statelen - 2] = adlen;
	stir(ignite, statelen);
	
	song = &ignite[768];
	song_carry = ignite[statelen - 1];
	song_char = (char *)song;
	
	for(i = 0; i < adlen; i++)
	{
		song_char[i % 2048] ^= ad[i];
		if(i % 2047 == 0 && i > 0) revolve_all(song, 256, &song_carry);
	}
	for(i = adlen, j = 0; i < (adlen + clen - CRYPTO_ABYTES); i++, j++)
	{
		song_char[i % 2048] ^= c[j];
		if(i % 2047 == 0) revolve_all(song, 256, &song_carry);
	}
	if(i % 2047 > 0) revolve_all(song, 256, &song_carry);
	
	evolve(song, 256);
	
	memmove(tag, &song[256 / 2], CRYPTO_ABYTES);
	memmove(ctag, c + (clen - CRYPTO_ABYTES), CRYPTO_ABYTES);
	
	if(strncmp((const char *)tag, (const char *)ctag, CRYPTO_ABYTES) != 0)
		return -1;
	else
	{
		stream_random = (unsigned char *) calloc (clen - CRYPTO_ABYTES,sizeof(char) );
		if (stream_random == NULL)
		{
			printf ("Error allocating requested memory");
			exit (1);
		}
		
		get_stream(ignite, nglen, stream_random, * mlen);
	
		for(i = 0; i < * mlen; i++)
			m[i] = c[i] ^ stream_random[i];
		
		free(stream_random);
	}
	
	return 0;
}

