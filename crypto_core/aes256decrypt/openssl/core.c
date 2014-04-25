#include <openssl/aes.h>
#include "crypto_core.h"

int crypto_core(
        unsigned char *out,
  const unsigned char *in,
  const unsigned char *k,
  const unsigned char *c
)
{
  AES_KEY kexp;
  AES_set_decrypt_key(k,256,&kexp);
  AES_decrypt(in,out,&kexp);
  return 0;
}
