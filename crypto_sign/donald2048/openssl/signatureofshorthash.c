#include <stddef.h>
#include <openssl/dsa.h>
#include <openssl/sha.h>
#include <string.h>
#include "sizes.h"
#include "prime.h"

int signatureofshorthash(
    unsigned char sm[SIGNATURE_BYTES],unsigned long long *smlen,
    const unsigned char m[SHORTHASH_BYTES],const unsigned long long mlen,
    const unsigned char sk[SECRETKEY_BYTES],const unsigned long long sklen
    )
{
  unsigned char h[20];
  DSA *x;
  DSA_SIG *y;
  int len;

  if (mlen > SHORTHASH_BYTES) return -1;
  SHA1(m,mlen,h);

  x = DSA_new();
  if (!x) return -1;

  x->p = BN_new(); if (!x->p) goto error;
  x->q = BN_new(); if (!x->q) goto error;
  x->g = BN_new(); if (!x->g) goto error;
  x->pub_key = BN_new(); if (!x->pub_key) goto error;
  x->priv_key = BN_new(); if (!x->priv_key) goto error;

  if (!BN_bin2bn(prime,sizeof prime,x->p)) goto error;
  if (!BN_bin2bn(prime_q,sizeof prime_q,x->q)) goto error;
  if (!BN_bin2bn(prime_g,sizeof prime_g,x->g)) goto error;
  if (!BN_bin2bn(sk,PUBLICKEY_BYTES,x->pub_key)) goto error; sk += PUBLICKEY_BYTES;
  if (!BN_bin2bn(sk,SECRETKEY_BYTES - PUBLICKEY_BYTES,x->priv_key)) goto error;

  y = DSA_do_sign(h,20,x);
  if (!y) goto error;

  memset(sm,0,40);
  len = BN_num_bytes(y->r); if (len > 20) goto yerror;
  BN_bn2bin(y->r,sm + 20 - len);
  len = BN_num_bytes(y->s); if (len > 20) goto yerror;
  BN_bn2bin(y->s,sm + 40 - len);
  *smlen = 40;

  DSA_SIG_free(y);
  DSA_free(x);
  return 0;

yerror:
  DSA_SIG_free(y);
error:
  DSA_free(x);
  return -1;
}
