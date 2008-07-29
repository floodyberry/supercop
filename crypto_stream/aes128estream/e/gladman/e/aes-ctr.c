/* aes-ctr.c */

/* 
 * AES in CTR mode.  
 *
 * ECRYPT wrapper around Brian Gladman's code
 * see http://fp.gladman.plus.com/AES/
 *
 * Author: Christophe De Canni\`ere, K.U.Leuven.
 */

/* ------------------------------------------------------------------------- */

#include "ecrypt-sync.h"
#include "aes.h"

#include "aestab.c"
#include "aeskey.c"
#include "aescrypt.c"

#include <string.h>

/* ------------------------------------------------------------------------- */

void ECRYPT_init(void)
{ 
  gen_tabs();
}

/* ------------------------------------------------------------------------- */

void ECRYPT_keysetup(
  ECRYPT_ctx* ctx, 
  const u8* key, 
  u32 keysize,
  u32 ivsize)
{ 
  aes_encrypt_key(key, keysize / 8, &(ctx->ctx));
}

/* ------------------------------------------------------------------------- */

void ECRYPT_ivsetup(
  ECRYPT_ctx* ctx, 
  const u8* iv)
{ 
  memcpy(ctx->in, iv, 16);
}

/* ------------------------------------------------------------------------- */

void ECRYPT_process_bytes(
  int action,
  ECRYPT_ctx* ctx, 
  const u8* input, 
  u8* output, 
  u32 msglen)
{ 
  u8 out[16];

  for ( ; msglen >= 16; msglen -= 16, input += 16, output += 16)
    {
      aes_encrypt(ctx->in, out, &(ctx->ctx));

      ((u32*)output)[0] = ((u32*)input)[0] ^ ((u32*)out)[0];
      ((u32*)output)[1] = ((u32*)input)[1] ^ ((u32*)out)[1];
      ((u32*)output)[2] = ((u32*)input)[2] ^ ((u32*)out)[2];
      ((u32*)output)[3] = ((u32*)input)[3] ^ ((u32*)out)[3];

      U32TO8_LITTLE(ctx->in, U8TO32_LITTLE(ctx->in) + 1);
    }

  if (msglen > 0)
    {
      u32 i;

      aes_encrypt(ctx->in, out, &(ctx->ctx));

      for (i = 0; i < msglen; i ++)
	output[i] = input[i] ^ out[i];
    }
}

/* ------------------------------------------------------------------------- */
