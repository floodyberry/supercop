#include <stddef.h>
#include <openssl/dsa.h>
#include <string.h>
#include "sizes.h"
#include "prime.h"

int crypto_sign_keypair(unsigned char *pk,unsigned char *sk)
{
  DSA *x;
  int len;

  x = DSA_new();
  if (!x) return -1;

  memset(sk,0,SECRETKEY_BYTES);
  memset(pk,0,PUBLICKEY_BYTES);

  x->p = BN_new(); if (!x->p) goto error;
  x->q = BN_new(); if (!x->q) goto error;
  x->g = BN_new(); if (!x->g) goto error;

  if (!BN_bin2bn(prime,sizeof prime,x->p)) goto error;
  if (!BN_bin2bn(prime_q,sizeof prime_q,x->q)) goto error;
  if (!BN_bin2bn(prime_g,sizeof prime_g,x->g)) goto error;

  if (!DSA_generate_key(x)) goto error;

  len = BN_num_bytes(x->pub_key); if (len > PUBLICKEY_BYTES) goto error;
  BN_bn2bin(x->pub_key,pk + PUBLICKEY_BYTES - len);
  BN_bn2bin(x->pub_key,sk + PUBLICKEY_BYTES - len);

  len = BN_num_bytes(x->priv_key); if (len > SECRETKEY_BYTES - PUBLICKEY_BYTES) goto error;
  BN_bn2bin(x->priv_key,sk + SECRETKEY_BYTES - len);

  DSA_free(x);
  return 0;

error:
  DSA_free(x);
  return -1;
}
