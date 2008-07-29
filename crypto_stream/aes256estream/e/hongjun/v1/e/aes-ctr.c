/* aes-ctr.c               */
/* AES in CTR mode.        */

/* Hongjun Wu, January 2007*/


/* ------------------------------------------------------------------------- */

#include "aes256.h"

#include <string.h>

/* ------------------------------------------------------------------------- */

void ECRYPT_init(void)
{}

/* ------------------------------------------------------------------------- */
/* key setup for AES-256*/
void ECRYPT_keysetup(
  ECRYPT_ctx* ctx, 
  const u8* key, 
  u32 keysize,
  u32 ivsize)
{ 
    unsigned int w[Nk*(Nr+1)], temp; 
    
    int i, j;

	i = 0;

	for( i = 0; i < Nk; i++ )
	{
		w[i] =  key[(i << 2)];
		w[i] |= key[(i << 2)+1] << 8;
		w[i] |= key[(i << 2)+2] << 16;
		w[i] |= key[(i << 2)+3] << 24;
	}

      i = Nk;

	while( i < Nb*(Nr+1) )
	{
		temp = w[i-1];

		temp = Sbox[ temp & 0xFF] <<  24 ^
		       Sbox[(temp >> 8) & 0xFF]  ^
			 (Sbox[(temp >> 16) & 0xFF] << 8 ) ^
		       (Sbox[(temp >> 24) & 0xFF] << 16) ^
			 Rcon[i/Nk];
		w[i] = w[i-Nk] ^ temp;
		i++;

            temp = w[i-1];
		w[i] = w[i-Nk] ^ temp;
		i++;

            temp = w[i-1];
		w[i] = w[i-Nk] ^ temp;
		i++;

            temp = w[i-1];
		w[i] = w[i-Nk] ^ temp;
		i++;

            temp = w[i-1];
		temp = Sbox[ temp & 0xFF] ^
			 Sbox[(temp >> 8) & 0xFF] << 8 ^
			 (Sbox[(temp >> 16) & 0xFF] << 16 ) ^
		       (Sbox[(temp >> 24) & 0xFF] << 24);
		w[i] = w[i-Nk] ^ temp;
		i++;

            temp = w[i-1];
		w[i] = w[i-Nk] ^ temp;
		i++;

            temp = w[i-1];
		w[i] = w[i-Nk] ^ temp;
		i++;

            temp = w[i-1];
		w[i] = w[i-Nk] ^ temp;
		i++;
	}
	

	for (i = 0; i <= Nr; i++)
	for (j = 0; j < Nb; j++)
			ctx->round_key[i][j] = w[(i<<2)+j];
}


/* ------------------------------------------------------------------------- */


void ECRYPT_ivsetup(
  ECRYPT_ctx* ctx, 
  const u8* iv)
{ 
      memcpy(ctx->counter, iv, 16);
}

/* ------------------------------------------------------------------------- */

void ECRYPT_process_bytes(
  int action,
  ECRYPT_ctx* ctx, 
  const u8* input, 
  u8* output, 
  u32 msglen)
{ 
  u8 keystream[16];
  u32 i;

  partial_precompute_tworounds(ctx);

  for ( ; msglen >= 16; msglen -= 16, input += 16, output += 16)
  {
      aes256_enc_block(ctx->counter, keystream, ctx);

      ((u32*)output)[0] = ((u32*)input)[0] ^ ((u32*)keystream)[0] ^ ctx->round_key[Nr][0];
	((u32*)output)[1] = ((u32*)input)[1] ^ ((u32*)keystream)[1] ^ ctx->round_key[Nr][1];
	((u32*)output)[2] = ((u32*)input)[2] ^ ((u32*)keystream)[2] ^ ctx->round_key[Nr][2];
	((u32*)output)[3] = ((u32*)input)[3] ^ ((u32*)keystream)[3] ^ ctx->round_key[Nr][3];

      ctx->counter[0]++;

      if ((ctx->counter[0] & 0xff)== 0) partial_precompute_tworounds(ctx);
  }

  if (msglen > 0)
  {
      aes256_enc_block(ctx->counter, keystream, ctx);
      ((u32*)keystream)[0] ^= ctx->round_key[Nr][0];
	((u32*)keystream)[1] ^= ctx->round_key[Nr][1];
	((u32*)keystream)[2] ^= ctx->round_key[Nr][2];
	((u32*)keystream)[3] ^= ctx->round_key[Nr][3];

      for (i = 0; i < msglen; i ++)
	      output[i] = input[i] ^ keystream[i];
	}
}


/* ------------------------------------------------------------------------- */
