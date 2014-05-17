#include "crypto_aead.h"
#include "api.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void stir(unsigned long long * state, int statelen)
{
	unsigned long long mixer = 6148914691236517205;
	unsigned long long carry = 1234567890123456789;
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

unsigned long long revolve_step(unsigned long long * state, unsigned long long i, unsigned long long * carry)
{
	unsigned long long elen = 256;
	if(state[(i+2)%elen]>state[(i+3)%elen])
		* carry ^= state[(i+1)%elen];
	else
		* carry ^= ~state[(i+1)%elen];

	state[i%elen] ^= * carry;
	return state[i%elen];
}

void get_stream(unsigned long long * ignite,  
	const unsigned char * in, unsigned char * out, unsigned long long msglen)
{
	unsigned long long ping[256], pong[256], sing[256];
	unsigned long long ping_carry, pong_carry, sing_carry;
	unsigned long long one, two, three, sum, i;
	unsigned long long end;
	unsigned char * buff;
	
	for(i = 0; i < 256; i++)
	{
		ping[i] = ignite[i];
		pong[i] = ignite[i + 256];
		sing[i] = ignite[i + 512];
	}
		
	buff = (unsigned char *) calloc (msglen, sizeof(unsigned char));
	end = msglen / 8;
	ping_carry = ignite[1024];
	pong_carry = ignite[1025];
	sing_carry = ignite[1026];
	
	for(i = 0; i < end; i++)
	{
		one = revolve_step(ping, i, &ping_carry);
		two = revolve_step(pong, i, &pong_carry);
		three = revolve_step(sing, i, &sing_carry);
		sum = one ^ two ^ three;
		memmove(buff + (i * 8), (unsigned char*)&sum, 8);
	}
	if(msglen % 8 > 0)
	{
		one = revolve_step(ping, i, &ping_carry);
		two = revolve_step(pong, i, &pong_carry);
		three = revolve_step(sing, i, &sing_carry);
		sum = one ^ two ^ three;
		memmove(buff + (end * 8), (unsigned char *)&three, msglen % 8);
	}
	for(i = 0; i < msglen; i++)
		out[i] = in[i] ^ buff[i];
		
	free(buff);
}

void revolve_all(unsigned long long * state, int elen, unsigned long long * carry)
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

void evolve(unsigned long long * ignite, int statelen)
{
	int i, j;
	unsigned long long * state;
	
	state = &ignite[768];
	
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

void xorit(unsigned long long * ignite, unsigned char *aorc, unsigned long long aorclen)
{
	unsigned long long * song;
	unsigned long long carry;
	unsigned long long temp;
	unsigned long long inlen = 0;
	unsigned long long runlen = 0;
	unsigned long long i;
	int arraylen = 256;
	int j, tail, sizelen = 8;
	
	song = &ignite[768];
	carry = ignite[1027];
	
	inlen = aorclen / 8;
	tail = aorclen % 8;
	if(tail > 0) inlen++;
	
	runlen = inlen / arraylen;
	if((inlen % arraylen) > 0) runlen++;
	
	for(i = 0; i < runlen; i++)
	{
		for(j = 0; j < arraylen || (j * i) < inlen; j++)
		{
			if(((j * i) + 1 == inlen) && tail > 0)
				sizelen = tail;
			memmove(&temp, aorc + (j * i * 8), sizelen);
			song[j] ^= temp;
		}
		revolve_all(ignite, arraylen, &carry);
	}
	ignite[1027] = carry;
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
	int statelen = 1028;
	unsigned long long ignite[1028] = {0};
		
	*clen = mlen + CRYPTO_ABYTES;	
	memmove(&ignite[0], k, CRYPTO_KEYBYTES );
	memmove(&ignite[4], npub, CRYPTO_NPUBBYTES); 
	ignite[statelen - 1] = mlen;
	ignite[statelen - 2] = adlen;
	
	stir(ignite, statelen);
	get_stream(ignite, m, c, mlen);
	xorit(ignite, (unsigned char*) ad, adlen);
	xorit(ignite, (unsigned char*) c, mlen);
	evolve(ignite, 256);
	
	memcpy(&c[mlen], &ignite[896], CRYPTO_ABYTES);
			
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
	int statelen = 1028;
	unsigned long long ignite[1028] = {0};
			
	*mlen = clen - CRYPTO_ABYTES;
	memmove(&ignite[0], k, CRYPTO_KEYBYTES );
	memmove(&ignite[4], npub, CRYPTO_NPUBBYTES); 
	ignite[statelen - 1] = clen - CRYPTO_ABYTES;
	ignite[statelen - 2] = adlen;
	
	stir(ignite, statelen);
	xorit(ignite, (unsigned char*) ad, adlen);
	xorit(ignite, (unsigned char*) c, *mlen);	
	evolve(ignite, 256);
	
	if(memcmp(&ignite[896], &c[*mlen], CRYPTO_ABYTES) != 0)
		return -1;
	
	get_stream(ignite, c, m, *mlen);
	
	return 0;
}

