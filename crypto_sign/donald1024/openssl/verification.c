#include <stddef.h>
#include <openssl/dsa.h>
#include <openssl/sha.h>
#include "sizes.h"
#include "prime.h"

int verification(
    const unsigned char m[SHORTHASH_BYTES],const unsigned long long mlen,
    const unsigned char sm[SIGNATURE_BYTES],const unsigned long long smlen,
    const unsigned char pk[PUBLICKEY_BYTES],const unsigned long long pklen
    )
{
  unsigned char h[20];
  DSA *x;
  DSA_SIG *y;

  if (smlen != 40) return -1;
  if (mlen > SHORTHASH_BYTES) return -1;
  SHA1(m,mlen,h);

  x = DSA_new();
  if (!x) return -1;
  y = DSA_SIG_new();
  if (!y) goto xerror;

  x->p = BN_new(); if (!x->p) goto yerror;
  x->q = BN_new(); if (!x->q) goto yerror;
  x->g = BN_new(); if (!x->g) goto yerror;
  x->pub_key = BN_new(); if (!x->pub_key) goto yerror;
  y->r = BN_new(); if (!y->r) goto yerror;
  y->s = BN_new(); if (!y->s) goto yerror;

  if (!BN_bin2bn(prime,sizeof prime,x->p)) goto yerror;
  if (!BN_bin2bn(prime_q,sizeof prime_q,x->q)) goto yerror;
  if (!BN_bin2bn(prime_g,sizeof prime_g,x->g)) goto yerror;
  if (!BN_bin2bn(pk,PUBLICKEY_BYTES,x->pub_key)) goto yerror;
  if (!BN_bin2bn(sm,20,y->r)) goto yerror;
  if (!BN_bin2bn(sm + 20,20,y->s)) goto yerror;

  switch(DSA_do_verify(h,20,y,x)) {
    case 0: DSA_SIG_free(y); DSA_free(x); return -100;
    case 1: DSA_SIG_free(y); DSA_free(x); return 0;
  }

yerror:
  DSA_SIG_free(y);
xerror:
  DSA_free(x);
  return -1;
}
