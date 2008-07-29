#include <stddef.h>
#include <openssl/bn.h>
#include <openssl/dh.h>
#include <string.h>
#include "prime.h"
#include "crypto_dh.h"

#define SECRETKEY_BYTES crypto_dh_SECRETKEYBYTES
#define PUBLICKEY_BYTES crypto_dh_PUBLICKEYBYTES

int crypto_dh_keypair(
  unsigned char *pk,
  unsigned char *sk
)
{
  DH *dh;
  int len;

  dh = DH_new();
  if (!dh) return -1;

  memset(sk,0,SECRETKEY_BYTES);
  memset(pk,0,PUBLICKEY_BYTES);

  dh->p = BN_new(); if (!dh->p) goto error;
  dh->g = BN_new(); if (!dh->g) goto error;

  if (!BN_bin2bn(prime,sizeof prime,dh->p)) goto error;
  if (!BN_set_word(dh->g,2)) goto error;

  if (!DH_generate_key(dh)) goto error;

  len = BN_num_bytes(dh->pub_key); if (len > PUBLICKEY_BYTES) goto error;
  BN_bn2bin(dh->pub_key,pk + PUBLICKEY_BYTES - len);
  BN_bn2bin(dh->pub_key,sk + PUBLICKEY_BYTES - len);

  len = BN_num_bytes(dh->priv_key); if (len > SECRETKEY_BYTES - PUBLICKEY_BYTES) goto error;
  BN_bn2bin(dh->priv_key,sk + SECRETKEY_BYTES - len);

  DH_free(dh);
  return 0;

  error:
  DH_free(dh);
  return -1;
}
