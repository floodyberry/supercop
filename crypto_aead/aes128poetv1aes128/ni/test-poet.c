#include <stdio.h>
#include <string.h>

#include "poet.h"

inline void dump_hex (char *label, uint8_t *c, int len)
{
  int i;

  printf("%s: \n", label);


  for (i = 0; i < len; i++) {
    printf("%02x ", c[i]);
  }

  puts("\n");
}



void dump_context (struct poet_ctx *ctx)
{
  dump_hex("Secret  key: ", ctx->k, BLOCKLEN);

  dump_hex("Masking key: ", ctx->tm, BLOCKLEN);


  dump_hex("Header  key: ", ctx->l, BLOCKLEN);
  dump_hex("Hashfun key: ", ctx->lt, BLOCKLEN);
  dump_hex("Hashfun key: ", ctx->lb, BLOCKLEN);
  dump_hex("Tau        : ", ctx->tau, BLOCKLEN);
}

int main()
{
  struct poet_ctx ctx;
  uint8_t key[KEYLEN] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,32};
  uint8_t header[2*BLOCKLEN+1] =
    {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,
     0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};

  uint8_t m[2*BLOCKLEN+3] =
    {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,
     0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,1,2};

  uint8_t c[3*BLOCKLEN];
  uint8_t t[2*BLOCKLEN];
  int result;

  memset(c,0,3*BLOCKLEN);
  memset(t,0,2*BLOCKLEN);

  keysetup(&ctx, key);

  process_header(&ctx, header, 2*BLOCKLEN+1);
  encrypt_final(&ctx, m, 2*BLOCKLEN+3, c, t);

  dump_context(&ctx);
  dump_hex ("Tag: ", t, 2*BLOCKLEN);
  dump_hex ("Message: ", m, 2*BLOCKLEN+3);
  dump_hex ("Ciphertext: ", c, 3*BLOCKLEN);
  dump_hex("Tau        : ", ctx.tau, BLOCKLEN);

  puts("\n----------------------------------------------------------------\n");

  keysetup(&ctx, key);
  process_header(&ctx, header, 2*BLOCKLEN+1);
  result = decrypt_final(&ctx, c, 2*BLOCKLEN+3, t, m);

  dump_context(&ctx);
  dump_hex ("Message: ", m, 2*BLOCKLEN+3);
  dump_hex("Tau        : ", ctx.tau, BLOCKLEN);

  if(result==0) puts("SUCCESS");
  else puts("FAIL");

return 0;
}
