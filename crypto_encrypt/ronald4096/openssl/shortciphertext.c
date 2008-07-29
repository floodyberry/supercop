#include <stddef.h>
#include <openssl/rand.h>
#include <openssl/rsa.h>
#include <openssl/rc4.h>
#include <string.h>
#include "sizes.h"

int shortciphertext(
  unsigned char c[ENCRYPTION_BYTES],unsigned long long *clen,
  const unsigned char m[SHORTPLAINTEXT_BYTES],const unsigned long long mlen,
  const unsigned char pk[PUBLICKEY_BYTES],const unsigned long long pklen
)
{
  RSA *r;

  r = RSA_new();
  if (!r) return -1;

  r->n = BN_new(); if (!r->n) goto error;
  if (!BN_bin2bn(pk,MODULUS_BYTES,r->n)) goto error;
  r->e = BN_new(); if (!r->n) goto error;
  if (!BN_set_word(r->e,3)) goto error;
  if (RSA_size(r) > MODULUS_BYTES) goto error;

  if (RSA_public_encrypt(mlen,m,c,r,RSA_PKCS1_PADDING) != MODULUS_BYTES) goto error;
  *clen = MODULUS_BYTES;

  RSA_free(r);
  return 0;

  error:
  RSA_free(r);
  return -1;
}
