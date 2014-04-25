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
  AES_set_encrypt_key(k,256,&kexp);
  AES_ecb_encrypt(in,out,&kexp,AES_ENCRYPT);
  return 0;
}
