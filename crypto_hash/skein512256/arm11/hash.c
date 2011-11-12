#include <string.h>
#include "crypto_hash.h"
#include "skein.h"

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
   // Init
   state ctx;
   memcpy(ctx.X, SKEIN_512_IV_256, sizeof(ctx.X));
   ctx.T[0] = 0;
   ctx.T[1] = 0x7000000000000000ull;
   
   // Update
   if (inlen > 64)
   {
      size_t n = (inlen - 1) / 64;
      Skein_512_Process_Block(&ctx, in, n, 64);
      inlen -= n * 64;
      in    += n * 64;
   }

   // Final
   u8 buf[64] = {0}; // zero pad
   memcpy(buf, in, inlen);

   ctx.T[1] |= 0x8000000000000000ull; // set final flag
   Skein_512_Process_Block(&ctx, buf, 1, inlen);

   // generate hash
   memset(buf, 0, 64);
   ctx.T[0] = 0;
   ctx.T[1] = 0xFF00000000000000ull;
   Skein_512_Process_Block(&ctx, buf, 1, 8);

   memcpy(out, ctx.X, 32);

   return 0;
}
