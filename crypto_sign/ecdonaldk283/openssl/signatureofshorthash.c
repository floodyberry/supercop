#include <stddef.h>
#include <openssl/objects.h>
#include <openssl/ecdsa.h>
#include <openssl/sha.h>
#include <string.h>
#include "sizes.h"

int signatureofshorthash(
    unsigned char sm[SIGNATURE_BYTES],unsigned long long *smlen,
    const unsigned char m[SHORTHASH_BYTES],const unsigned long long mlen,
    const unsigned char sk[SECRETKEY_BYTES],const unsigned long long sklen
    )
{
  unsigned char h[20];
  EC_GROUP *group;
  EC_KEY *k;
  EC_POINT *kxy;
  BIGNUM *kx;
  BIGNUM *ky;
  ECDSA_SIG *rs;
  int len;

  memset(sm,0,SIGNATURE_BYTES); *smlen = SIGNATURE_BYTES;

  if (mlen > SHORTHASH_BYTES) return -1;
  SHA1(m,mlen,h);

  group = EC_GROUP_new_by_curve_name(NID);
  if (!group) return -1;

  kx = BN_new(); if (!kx) return -1;
  ky = BN_new(); if (!ky) { BN_free(kx); return -1; }
  kxy = EC_POINT_new(group); if (!kxy) { BN_free(ky); BN_free(kx); return -1; }
  k = EC_KEY_new(); if (!k) { EC_POINT_free(kxy); BN_free(ky); BN_free(kx); return -1; }

  if (!EC_KEY_set_group(k,group)) goto error;

  if (!BN_bin2bn(sk,PRIME_BYTES,kx)) goto error; sk += PRIME_BYTES;
  if (!EC_KEY_set_private_key(k,kx)) goto error;

  if (!BN_bin2bn(sk,PRIME_BYTES,kx)) goto error; sk += PRIME_BYTES;
  if (!BN_bin2bn(sk,PRIME_BYTES,ky)) goto error;
#ifdef PRIME_FIELD
  if (!EC_POINT_set_affine_coordinates_GFp(group,kxy,kx,ky,0)) goto error;
#else
  if (!EC_POINT_set_affine_coordinates_GF2m(group,kxy,kx,ky,0)) goto error;
#endif
  if (!EC_KEY_set_public_key(k,kxy)) goto error;

  rs = ECDSA_do_sign(h,20,k);
  if (!rs) goto error;

  len = BN_num_bytes(rs->r); if (len > PRIME_BYTES) goto rserror;
  BN_bn2bin(rs->r,sm + PRIME_BYTES - len); sm += PRIME_BYTES;

  len = BN_num_bytes(rs->s); if (len > PRIME_BYTES) goto rserror;
  BN_bn2bin(rs->s,sm + PRIME_BYTES - len);

  ECDSA_SIG_free(rs);
  EC_KEY_free(k);
  EC_POINT_free(kxy);
  BN_free(ky);
  BN_free(kx);
  return 0;

rserror:
  ECDSA_SIG_free(rs);
error:
  EC_KEY_free(k);
  EC_POINT_free(kxy);
  BN_free(ky);
  BN_free(kx);
  return -1;
}
