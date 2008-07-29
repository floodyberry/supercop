/* snow-2.0.c */

/* 
 * SNOW 2.0.  
 *
 * ECRYPT wrapper around SNOW 2.0 code written by Patrik Ekdahl &
 * Thomas Johansson.
 * see http://www.it.lth.se/cryptology/snow/
 *
 * Author: Christophe De Canni\`ere, K.U.Leuven.
 */

/* ------------------------------------------------------------------------- */

#include "ecrypt-sync.h"
#include "snow2_fast.c"

/* ------------------------------------------------------------------------- */

void ECRYPT_init(void)
{ }

/* ------------------------------------------------------------------------- */

void ECRYPT_keysetup(
  ECRYPT_ctx* ctx, 
  const u8* key, 
  u32 keysize,
  u32 ivsize)
{ 
  u32 i;

  for (i = 0; i < keysize / 8; ++i)
    ctx->key[i] = key[i];

  ctx->keysize = keysize;
}

/* ------------------------------------------------------------------------- */

void ECRYPT_ivsetup(
  ECRYPT_ctx* ctx, 
  const u8* iv)
{ 
  snow_loadkey_fast(ctx, 
    U8TO32_LITTLE(iv),
    U8TO32_LITTLE(iv + 4),
    U8TO32_LITTLE(iv + 8),
    U8TO32_LITTLE(iv + 12));
}

/* ------------------------------------------------------------------------- */

void ECRYPT_process_bytes(
  int action,
  ECRYPT_ctx* ctx, 
  const u8* input, 
  u8* output, 
  u32 msglen)
{ 
  u32 i;
  u32 keystream[16];

  for ( ; msglen >= 64; msglen -= 64, input += 64, output += 64)
    {
      snow_keystream_fast(ctx, keystream);

      for (i = 0; i < 16; ++i)
	((u32*)output)[i] = ((u32*)input)[i] ^ U32TO32_LITTLE(keystream[i]);
    }

  if (msglen > 0)
    {
      snow_keystream_fast(ctx, keystream);

      for (i = 0; i < msglen; i ++)
	output[i] = input[i] ^ ((u8*)keystream)[i];
    }
}

/* ------------------------------------------------------------------------- */
