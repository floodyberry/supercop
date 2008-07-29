#include <stddef.h>
#include <openssl/objects.h>
#include <openssl/md5.h>
#include <openssl/rsa.h>
#include <string.h>
#include "sizes.h"

int signedshortmessage(
  unsigned char sm[SIGNATURE_BYTES],unsigned long long *smlen,
  const unsigned char m[SHORTMESSAGE_BYTES],const unsigned long long mlen,
  const unsigned char sk[SECRETKEY_BYTES],const unsigned long long sklen
)
{
  RSA *r;

  r = RSA_new();
  if (!r) return -1;

  r->n = BN_new(); if (!r->n) goto error;
  r->e = BN_new(); if (!r->e) goto error;
  r->d = BN_new(); if (!r->d) goto error;
  r->p = BN_new(); if (!r->p) goto error;
  r->q = BN_new(); if (!r->q) goto error;
  r->dmp1 = BN_new(); if (!r->dmp1) goto error;
  r->dmq1 = BN_new(); if (!r->dmq1) goto error;
  r->iqmp = BN_new(); if (!r->iqmp) goto error;

  if (!BN_bin2bn(sk,MODULUS_BYTES,r->n)) goto error; sk += MODULUS_BYTES;
  if (!BN_bin2bn(sk,MODULUS_BYTES,r->e)) goto error; sk += MODULUS_BYTES;
  if (!BN_bin2bn(sk,MODULUS_BYTES,r->d)) goto error; sk += MODULUS_BYTES;
  if (!BN_bin2bn(sk,MODULUS_BYTES,r->p)) goto error; sk += MODULUS_BYTES;
  if (!BN_bin2bn(sk,MODULUS_BYTES,r->q)) goto error; sk += MODULUS_BYTES;
  if (!BN_bin2bn(sk,MODULUS_BYTES,r->dmp1)) goto error; sk += MODULUS_BYTES;
  if (!BN_bin2bn(sk,MODULUS_BYTES,r->dmq1)) goto error; sk += MODULUS_BYTES;
  if (!BN_bin2bn(sk,MODULUS_BYTES,r->iqmp)) goto error; sk += MODULUS_BYTES;
  if (RSA_size(r) > MODULUS_BYTES) goto error;

  if (mlen > 1000000000) goto error;
  if (RSA_private_encrypt(mlen,m,sm,r,RSA_PKCS1_PADDING) != MODULUS_BYTES) goto error;
  *smlen = MODULUS_BYTES;

  RSA_free(r);
  return 0;

  error:
  RSA_free(r);
  return -1;
}
