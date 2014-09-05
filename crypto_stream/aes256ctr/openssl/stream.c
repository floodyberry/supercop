#include "crypto_stream.h"
#include <openssl/evp.h>

int crypto_stream(
unsigned char *out,
unsigned long long outlen,
const unsigned char *n,
const unsigned char *k
)
{
  unsigned char temp[outlen];
  memset(temp, 0, outlen);
  return crypto_stream_xor(out, temp, outlen, n, k);
}

int crypto_stream_xor(
unsigned char *out,
const unsigned char *in,
unsigned long long inlen,
const unsigned char *n,
const unsigned char *k
)
{
  EVP_CIPHER_CTX x;
  int ok = 1;
  int outl = 0;
  EVP_CIPHER_CTX_init(&x);
  ok = EVP_EncryptInit_ex(&x,EVP_aes_256_ctr(),0,k,n);
  if (ok == 1)
    ok = EVP_CIPHER_CTX_set_padding(&x, 0);
  if (ok == 1)
    ok = EVP_EncryptUpdate(&x, out, &outl, in, inlen);
  if (ok == 1)
    ok = EVP_EncryptFinal_ex(&x, out, &outl);

    return ok == 1 ? 0 : -111;
}
