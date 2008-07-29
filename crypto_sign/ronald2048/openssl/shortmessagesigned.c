#include <stddef.h>
#include <openssl/objects.h>
#include <openssl/md5.h>
#include <openssl/rsa.h>
#include <string.h>
#include "sizes.h"

int shortmessagesigned(
  unsigned char m[SHORTMESSAGE_BYTES],unsigned long long *mlen,
  const unsigned char sm[SIGNATURE_BYTES],const unsigned long long smlen,
  const unsigned char pk[PUBLICKEY_BYTES],const unsigned long long pklen
)
{
  int recoveredlen;
  RSA *r;

  r = RSA_new();
  if (!r) return -1;

  r->n = BN_new(); if (!r->n) goto error;
  if (!BN_bin2bn(pk,MODULUS_BYTES,r->n)) goto error;
  r->e = BN_new(); if (!r->n) goto error;
  if (!BN_set_word(r->e,3)) goto error;
  if (RSA_size(r) > MODULUS_BYTES) goto error;
  recoveredlen = RSA_public_decrypt(smlen,sm,m,r,RSA_PKCS1_PADDING);
  if (recoveredlen < 0) goto forgery;
  *mlen = recoveredlen;

  RSA_free(r);
  return 0;

  error:
  RSA_free(r);
  return -1;

  forgery:
  // ERR_load_crypto_strings();
  // printf("%s\n",ERR_error_string(ERR_get_error(),0));
  RSA_free(r);
  return -100;
}
