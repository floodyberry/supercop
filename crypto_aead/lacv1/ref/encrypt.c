
#include "crypto_aead.h"
#include <stdio.h>
#include <malloc.h>

//contents of the 4-bit sbox used in LBlock-s
unsigned char S[16] = {14,9,15,0,13,4,10,11,1,2,8,3,7,6,12,5};	

//padding procedure: string x(xlen bytes) is padded to string xpad(xpadlen bytes)
 void padding(
   const unsigned char *x,unsigned long long xlen,
   unsigned char *xpad,unsigned long long xpadlen
 )
 {
	 int i;

	 for(i = 0; i < xlen; i++)
	 {
		 xpad[i] = x[i];
	 }
	 for(i = xlen; i < xpadlen; i++)
	 {
		xpad[i] = 0;
	 }
 	 xpad[xpadlen - 5] = ((xlen * 8) >> 32) & 0xff;	
 	 xpad[xpadlen - 4] = ((xlen * 8) >> 24) & 0xff;		
 	 xpad[xpadlen - 3] = ((xlen * 8) >> 16) & 0xff;		
 	 xpad[xpadlen - 2] = ((xlen * 8) >>  8) & 0xff;		
 	 xpad[xpadlen - 1] = ((xlen * 8) >>  0) & 0xff;	
	 /* the last 40-bit of xpad is padded with the length of string x(in bits) */

	 return;
 }

//key schedule algorithm of the full 32-round LBlock-s   
 void key_sched_LBlocks(
   const unsigned char *keystate,
   unsigned char *subkey
 )
 {	
	int i, j, r;
	unsigned char temp[10], ttemp[10], temp1;

	//copy the master key stored in keystate(10 bytes)
	for(i = 0; i < 10; i++)
	{
		ttemp[i] = keystate[i];
	}

	//output the first round subkey(4 bytes)
	for(j = 0; j < 4; j++)
	{
		subkey[j] = ttemp[j];
	}

	for (r = 1; r < 32; r++)
	{	
		//update the key register with operation <<< 24
		for (i = 0; i < 10; i++)
		{
			temp[i] = ttemp[(i + 3) % 10];
		}
		temp1 = (S[temp[0] >> 4] << 4) ^ (S[temp[0] & 0xf]);	//update the key register with two 4-bit sbox operations
		temp[3] ^= (temp1 & 0xf0) ^ (temp[8] & 0xf);
		temp[6] ^= temp1 << 4;
		temp[1] ^= temp[1] >> 4;
		temp[3] ^= r << 2;				//update the key register with round constant xor operation

		for (i = 0; i < 10; i++)
		{
			ttemp[i] = temp[i];
		}
		for (j = 0; j < 4; j++)
		{
			subkey[r * 4 + j] = ttemp[j];	//output the (r + 1)-th round subkey(4 bytes)
		}	
	}

	return;
 }

 //encryption algorithm of the full 32-round LBlock-s
 void E(
   const unsigned char *input,
   const unsigned char *key,
   unsigned char *output
 )
 {
	int i, r;
	unsigned char subkey[32 * 4];
	unsigned char left[4], right[4];
	unsigned char temp[4], nibble[8];

	key_sched_LBlocks(key, subkey);		//obtain the subkeys used in 32 rounds, each subkey is 4 bytes

	for(i = 0; i < 4; i++)
	{
		left[i] = input[i];
		right[i] = input[i + 4];
	}

	//32-round encryption
	for(r = 0; r < 32; r++)
	{
		//finish the operation of <<< 8 in right half branch
		for(i = 0; i < 4; i++)
		{
			temp[i] = right[(i + 1) % 4];
		}
		for(i = 0; i < 4; i++)
		{
			right[i] = temp[i];
		}

		//round subkey xor operation
		for(i = 0; i < 4; i++)
		{
			temp[i] = left[i] ^ subkey[r * 4 + i];
		}

		//4-bit sbox operation, the results are stored in 8 nibbles, each nibble is 4-bit long
		for(i = 0; i < 4; i++)
		{
			nibble[2 * i] = S[temp[i] >> 4];
			nibble[2 * i + 1] = S[temp[i] & 0xf];
		}
		
		//nibble-wise permutation, the results are stored in 4 bytes
		temp[0] = (nibble[1] << 4) ^ nibble[3];
		temp[1] = (nibble[0] << 4) ^ nibble[2];
		temp[2] = (nibble[5] << 4) ^ nibble[7];
		temp[3] = (nibble[4] << 4) ^ nibble[6];

		for(i = 0; i < 4; i++)
		{
			temp[i] ^= right[i];
		}
		for(i = 0; i < 4; i++)
		{
			right[i] = left[i];
			left[i] = temp[i];
		}
	}

	//the ciphertext is stored in output(8 bytes)
	for(i = 0; i < 4; i++)
	{
		output[i] = left[i];
		output[i + 4] = right[i];
	}
 }

 //key schedule algorithm of the reduced 16-round LBlock-s   
 void KS(
   unsigned char *keystate,
   unsigned char *subkey
 )
 {	
	int i, j, r;
	unsigned char temp[10], ttemp[10], temp1;

	for(i = 0; i < 10; i++)
	{
		ttemp[i] = keystate[i];
	}

	for(j = 0; j < 4; j++)
	{
		subkey[j] = ttemp[j];
	}

	for (r = 1; r < 16; r++)
	{	
		for (i = 0; i < 10; i++)
		{
			temp[i] = ttemp[(i + 3) % 10];
		}
		temp1 = (S[temp[0] >> 4] << 4) ^ (S[temp[0] & 0xf]);
		temp[3] ^= (temp1 & 0xf0) ^ (temp[8] & 0xf);
		temp[6] ^= temp1 << 4;
		temp[1] ^= temp[1] >> 4;
		temp[3] ^= r << 2;

		for (i = 0; i < 10; i++)
		{
			ttemp[i] = temp[i];
		}
		for (j = 0; j < 4; j++)
		{
			subkey[r * 4 + j] = ttemp[j];	
		}
	}

	//after outputing 16 round subkeys, update the key register one more time, the round constant used is 0x15
	for (i = 0; i < 10; i++)
	{
		temp[i] = ttemp[(i + 3) % 10];
	}
	temp1 = (S[temp[0] >> 4] << 4) ^ (S[temp[0] & 0xf]);
	temp[3] ^= (temp1 & 0xf0) ^ (temp[8] & 0xf);
	temp[6] ^= temp1 << 4;
	temp[1] ^= temp[1] >> 4;
	temp[3] ^= 0x15 << 2;

	//output the final state of key register
	for(i = 0; i < 10; i++)
	{
		keystate[i] = temp[i];
	}

	return;
 }

  //encryption algorithm of the reduced 16-round LBlock-s
  void G(
   unsigned char *input,
   unsigned char *subkey,
   unsigned char *output
 )
 {
	int i, r;
	unsigned char left[4], right[4];
	unsigned char temp[4], nibble[8];

	for(i = 0; i < 4; i++)
	{
		left[i] = input[i];
		right[i] = input[i + 4];
	}

	for(r = 0; r < 16; r++)
	{
		for(i = 0; i < 4; i++)
		{
			temp[i] = right[(i + 1) % 4];
		}
		for(i = 0; i < 4; i++)
		{
			right[i] = temp[i];
		}

		for(i = 0; i < 4; i++)
		{
			temp[i] = left[i] ^ subkey[r * 4 + i];
		}

		for(i = 0; i < 4; i++)
		{
			nibble[2 * i] = S[temp[i] >> 4];
			nibble[2 * i + 1] = S[temp[i] & 0xf];
		}
		
		temp[0] = (nibble[1] << 4) ^ nibble[3];
		temp[1] = (nibble[0] << 4) ^ nibble[2];
		temp[2] = (nibble[5] << 4) ^ nibble[7];
		temp[3] = (nibble[4] << 4) ^ nibble[6];

		for(i = 0; i < 4; i++)
		{
			temp[i] ^= right[i];
		}
		for(i = 0; i < 4; i++)
		{
			right[i] = left[i];
			left[i] = temp[i];
		}
	}

	for(i = 0; i < 4; i++)
	{
		output[i] = left[i];
		output[i + 4] = right[i];
	}	

	return;
 }

  //encryption algorithm of the reduced 16-round LBlock-s with 48-bit leak data
  void Gleak(
   unsigned char *input,
   unsigned char *subkey,
   unsigned char *output,
   unsigned char *leak
 )
 {
	int i, r;
	unsigned char left[4], right[4];
	unsigned char temp[4], nibble[8];

	for(i = 0; i < 4; i++)
	{
		left[i] = input[i];
		right[i] = input[i + 4];
	}

	for(r = 0; r < 8; r++)
	{
		for(i = 0; i < 4; i++)
		{
			temp[i] = right[(i + 1) % 4];
		}
		for(i = 0; i < 4; i++)
		{
			right[i] = temp[i];
		}

		for(i = 0; i < 4; i++)
		{
			temp[i] = left[i] ^ subkey[r * 4 + i];
		}

		for(i = 0; i < 4; i++)
		{
			nibble[2 * i] = S[temp[i] >> 4];
			nibble[2 * i + 1] = S[temp[i] & 0xf];
		}
		
		temp[0] = (nibble[1] << 4) ^ nibble[3];
		temp[1] = (nibble[0] << 4) ^ nibble[2];
		temp[2] = (nibble[5] << 4) ^ nibble[7];
		temp[3] = (nibble[4] << 4) ^ nibble[6];

		for(i = 0; i < 4; i++)
		{
			temp[i] ^= right[i];
		}
		for(i = 0; i < 4; i++)
		{
			right[i] = left[i];
			left[i] = temp[i];
		}
	}

	//the higher 24-bit output of 8-round LBlock-s is used as the first 24-bit leak data
	leak[0] = left[0];
	leak[1] = left[1];
	leak[2] = left[2];

	for(r = 8; r < 16; r++)
	{
		for(i = 0; i < 4; i++)
		{
			temp[i] = right[(i + 1) % 4];
		}
		for(i = 0; i < 4; i++)
		{
			right[i] = temp[i];
		}

		for(i = 0; i < 4; i++)
		{
			temp[i] = left[i] ^ subkey[r * 4 + i];
		}

		for(i = 0; i < 4; i++)
		{
			nibble[2 * i] = S[temp[i] >> 4];
			nibble[2 * i + 1] = S[temp[i] & 0xf];
		}
		
		temp[0] = (nibble[1] << 4) ^ nibble[3];
		temp[1] = (nibble[0] << 4) ^ nibble[2];
		temp[2] = (nibble[5] << 4) ^ nibble[7];
		temp[3] = (nibble[4] << 4) ^ nibble[6];

		for(i = 0; i < 4; i++)
		{
			temp[i] ^= right[i];
		}
		for(i = 0; i < 4; i++)
		{
			right[i] = left[i];
			left[i] = temp[i];
		}
	}

	//the higher 24-bit output of 16-round LBlock-s is used as the last 24-bit leak data
	leak[3] = left[0];
	leak[4] = left[1];
	leak[5] = left[2];

	for(i = 0; i < 4; i++)
	{
		output[i] = left[i];
		output[i + 4] = right[i];
	}	

	return;
 }

 int crypto_aead_encrypt(
   unsigned char *c,unsigned long long *clen,
   const unsigned char *m,unsigned long long mlen,
   const unsigned char *ad,unsigned long long adlen,
   const unsigned char *nsec,
   const unsigned char *npub,
   const unsigned char *k
 )
 {
	unsigned char *mpad; 
	unsigned long long mpadlen;
	unsigned char *adpad = NULL; 
	unsigned long long adpadlen;
	unsigned char ukey[16];
	unsigned char datastate[8] = {0}, keystate[10], leak[6];
	unsigned char subkey[16 * 4];
	unsigned char tag[8];
	int i, j;

	/*	//1 message should not be null
	if(mlen == 0)
	{
		return -2;	
	}
	//2 at most 2^40 bits data (including associate data and message are allowed to be processed with the same key)
	if((mlen + adlen) > ((unsigned long)0x1 << 37))
	{
		return -3;	
	}
*/

	if(mlen == 0) //if the message is null, the result is expected to be computed as follows 
	{
		mpadlen = 0;
		mpad = (unsigned char *)malloc(mpadlen);	//the array to store padded message(mpad bytes)
		padding(m, mlen, mpad, mpadlen);
	}
	else
	{
		//compute the length of padded message(in bytes)
		if((mlen + 5) % 6 == 0)
		{
			mpadlen = mlen + 5;
		}
		else
		{
			mpadlen = ((mlen + 5) / 6 + 1) * 6;
		}
		mpad = (unsigned char *)malloc(mpadlen);	//the array to store padded message(mpad bytes)
		padding(m, mlen, mpad, mpadlen);	//message padding procedure
	}
	

	if(adlen == 0)		//associate data can be null
	{
		adpadlen = 0;	
	}
	else	//associate data padding procedure
	{
		if((adlen + 5) % 6 == 0)
		{
			adpadlen = adlen + 5;
		}
		else
		{
			adpadlen = ((adlen + 5) / 6 + 1) * 6;
		}
		adpad = (unsigned char *)malloc(adpadlen);
		padding(ad, adlen, adpad, adpadlen);
	}

	//initialize to generate 128-bit ukey
	E(npub, k, ukey);
	E(ukey, k, ukey + 8);

	//update the key register of KS with lower 80-bit ukey
	for(i = 0; i < 10; i++)
	{
		keystate[i] = ukey[i + 6];
	}

	//encrypting 64-bit 0 with higher 80-bit ukey to obtain the beginning of data state 
	E(datastate, ukey, datastate);

	//processing associate data
	for(i = 0; i < adpadlen; i += 6)
	{
		KS(keystate, subkey);
		G(datastate, subkey, datastate);
		for(j = 0; j < 6; j++)
		{
			datastate[j + 2] ^= adpad[i + j];
		}
	}

	//processing message
	for(i = 0; i < mpadlen; i += 6)
	{
		KS(keystate, subkey);
		Gleak(datastate, subkey, datastate, leak);
		for(j = 0; j < 6; j++)
		{
			datastate[j + 2] ^= mpad[i + j];	//xor the padded message block to the lower 48-bit of data state 
			if((i + j) < mlen)
			{
				c[i + j] = m[i + j] ^ leak[j];	//xor the message block with the 48-bit leak data to get the cipher block
			}
		}
	}

	//generate the tag
	E(datastate, k, tag);

	//the last 8 bytes of cipher are the tag
	for(i = 0; i < 8; i++)
	{
		c[mlen + i] = tag[i];
	}

	*clen = mlen + 8;	//length of cipher, the first mlen bytes are ciphertext corresponding to the message, and the last 8 bytes are the tag

	return 0;
 }

 int crypto_aead_decrypt(
   unsigned char *m,unsigned long long *mlen,
   unsigned char *nsec,
   const unsigned char *c,unsigned long long clen,
   const unsigned char *ad,unsigned long long adlen,
   const unsigned char *npub,
   const unsigned char *k
 )
 {
   	unsigned char *mpad; 
	unsigned long long mpadlen;
	unsigned char *adpad = NULL; 
	unsigned long long adpadlen;
	unsigned char ukey[16];
	unsigned char datastate[8] = {0}, keystate[10], leak[6];
	unsigned char subkey[16 * 4];
	unsigned char tag[8];

	int i, j;

	*mlen = clen - 8;	//length of message 

	/*1 message should not be null
	if(*mlen == 0)
	{
		return -2;	
	}
	//2 at most 2^40 bits data (including associate data and message are allowed to be processed with the same key)
	if((*mlen + adlen) > ((unsigned long)0x1 << 37))
	{
		return -3;	
	}*/

	if(*mlen == 0) //if the message is null, the result is expected to be computed as follows 
	{
		mpadlen = 0;	
	}
	else
	{
		//compute the length of padded message(in bytes), and store the padding data in the array mpad
		if((*mlen + 5) % 6 == 0)
		{
			mpadlen = *mlen + 5;
		}
		else
		{
			mpadlen = ((*mlen + 5) / 6 + 1) * 6;
		}
		mpad = (unsigned char *)malloc(mpadlen);
		padding(m, *mlen, mpad, mpadlen);
	}
	

	if(adlen == 0)		//associate data can be null
	{
		adpadlen = 0;	
	}
	else	//associate data padding procedure
	{
		if((adlen + 5) % 6 == 0)
		{
			adpadlen = adlen + 5;
		}
		else
		{
			adpadlen = ((adlen + 5) / 6 + 1) * 6;
		}
		adpad = (unsigned char *)malloc(adpadlen);
		padding(ad, adlen, adpad, adpadlen);
	}

	E(npub, k, ukey);
	E(ukey, k, ukey + 8);

	for(i = 0; i < 10; i++)
	{
		keystate[i] = ukey[i + 6];
	}

	E(datastate, ukey, datastate);

	for(i = 0; i < adpadlen; i += 6)
	{
		KS(keystate, subkey);
		G(datastate, subkey, datastate);
		for(j = 0; j < 6; j++)
		{
			datastate[j + 2] ^= adpad[i + j];
		}
	}

	for(i = 0; i < mpadlen; i += 6)
	{
		KS(keystate, subkey);
		Gleak(datastate, subkey, datastate, leak);
		for(j = 0; j < 6; j++)
		{
			if((i + j) < *mlen)
			{
				m[i + j] = c[i + j] ^ leak[j];	//xor the cipher block with 48-bit leak data to get the message block
				datastate[j + 2] ^= m[i + j];
			}
			else
			{
				datastate[j + 2] ^= mpad[i + j];
			}
		}
	}

	E(datastate, k, tag);

	//verifying procedure
	for(i = 0; i < 8; i++)
	{
		if(tag[i] != c[*mlen + i])
		{
			return -1;		//if the tag computed is not equal to the tag stored in the last 8 bytes of cipher, reture -1 to denote the failure of verifying and output no message
		}
	}

	return 0;	//denotes the success of verifying and output the decrypted message
 }
