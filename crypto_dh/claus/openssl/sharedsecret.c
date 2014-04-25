#include <stddef.h>
#include <openssl/bn.h>
#include <openssl/dh.h>
#include <string.h>
#include "prime.h"
#include "crypto_dh.h"

#define SECRETKEY_BYTES crypto_dh_SECRETKEYBYTES
#define PUBLICKEY_BYTES crypto_dh_PUBLICKEYBYTES
#define SHAREDSECRET_BYTES crypto_dh_BYTES

int crypto_dh(
  unsigned char *s,
  const unsigned char *pk,
  const unsigned char *sk
)
{
  DH *alice;
  BIGNUM *bob;
  int len;

  alice = DH_new(); if (!alice) return -1;
  bob = BN_new(); if (!bob) goto boberror;

  alice->p = BN_new(); if (!alice->p) goto error;
  alice->g = BN_new(); if (!alice->g) goto error;
  alice->pub_key = BN_new(); if (!alice->pub_key) goto error;
  alice->priv_key = BN_new(); if (!alice->priv_key) goto error;

  if (!BN_bin2bn(prime,sizeof prime,alice->p)) goto error;
  if (!BN_set_word(alice->g,2)) goto error;
  if (!BN_bin2bn(sk,PUBLICKEY_BYTES,alice->pub_key)) goto error;
  if (!BN_bin2bn(sk + PUBLICKEY_BYTES,SECRETKEY_BYTES - PUBLICKEY_BYTES,alice->priv_key)) goto error;
  if (!BN_bin2bn(pk,PUBLICKEY_BYTES,bob)) goto error;

  memset(s,0,SHAREDSECRET_BYTES);

  if (DH_size(alice) > SHAREDSECRET_BYTES) goto error;
  len = DH_compute_key(s,bob,alice);
  if (len < 0) goto error;
  /* OpenSSL documentation claims len is length of shared secret; it's actually 1 */

  BN_free(bob);
  DH_free(alice);
  return 0;

  error:
  BN_free(bob);

  boberror:
  DH_free(alice);
  return -1;
}
