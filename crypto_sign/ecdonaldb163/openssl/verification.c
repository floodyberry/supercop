#include <openssl/objects.h>
#include <openssl/ecdsa.h>
#include <openssl/sha.h>
#include <string.h>
#include "sizes.h"

int verification(
    const unsigned char m[SHORTHASH_BYTES],const unsigned long long mlen,
    const unsigned char sm[SIGNATURE_BYTES],const unsigned long long smlen,
    const unsigned char pk[PUBLICKEY_BYTES],const unsigned long long pklen
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

  if (smlen != SIGNATURE_BYTES) return -1;
  if (mlen > SHORTHASH_BYTES) return -1;
  SHA1(m,mlen,h);

  group = EC_GROUP_new_by_curve_name(NID);
  if (!group) return -1;

  kx = BN_new(); if (!kx) return -1;
  ky = BN_new(); if (!ky) { BN_free(kx); return -1; }
  kxy = EC_POINT_new(group); if (!kxy) { BN_free(ky); BN_free(kx); return -1; }
  k = EC_KEY_new(); if (!k) { EC_POINT_free(kxy); BN_free(ky); BN_free(kx); return -1; }
  rs = ECDSA_SIG_new(); if (!rs) { EC_KEY_free(k); EC_POINT_free(kxy); BN_free(ky); BN_free(kx); return -1; }

  if (!EC_KEY_set_group(k,group)) goto error;
  if (!BN_bin2bn(pk,PRIME_BYTES,kx)) goto error; pk += PRIME_BYTES;
  if (!BN_bin2bn(pk,PRIME_BYTES,ky)) goto error;
#ifdef PRIME_FIELD
  if (!EC_POINT_set_affine_coordinates_GFp(group,kxy,kx,ky,0)) goto error;
#else
  if (!EC_POINT_set_affine_coordinates_GF2m(group,kxy,kx,ky,0)) goto error;
#endif
  if (!EC_KEY_set_public_key(k,kxy)) goto error;

  if (!BN_bin2bn(sm,PRIME_BYTES,rs->r)) goto error; sm += PRIME_BYTES;
  if (!BN_bin2bn(sm,PRIME_BYTES,rs->s)) goto error;

  len = ECDSA_do_verify(h,20,rs,k);
  ECDSA_SIG_free(rs);
  EC_KEY_free(k);
  EC_POINT_free(kxy);
  BN_free(ky);
  BN_free(kx);

  if (len == 1) return 0;
  if (len == 0) return -100;
  return -1;
  
error:
  ECDSA_SIG_free(rs);
  EC_KEY_free(k);
  EC_POINT_free(kxy);
  BN_free(ky);
  BN_free(kx);
  return -1;
}
