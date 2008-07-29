#include <stddef.h>
#include <openssl/objects.h>
#include <openssl/ecdsa.h>
#include <string.h>
#include "sizes.h"

int crypto_sign_keypair(unsigned char *pk,unsigned char *sk)
{
  EC_GROUP *group;
  EC_KEY *k;
  BIGNUM *kx;
  BIGNUM *ky;
  int len;

  group = EC_GROUP_new_by_curve_name(NID);
  if (!group) return -1;

  kx = BN_new(); if (!kx) return -1;
  ky = BN_new(); if (!ky) { BN_free(kx); return -1; }
  k = EC_KEY_new(); if (!k) { BN_free(ky); BN_free(kx); return -1; }

  memset(sk,0,SECRETKEY_BYTES);
  memset(pk,0,PUBLICKEY_BYTES);

  if (!EC_KEY_set_group(k,group)) goto error;
  if (!EC_KEY_generate_key(k)) goto error;

  len = BN_num_bytes(EC_KEY_get0_private_key(k)); if (len > PRIME_BYTES) goto error;
  BN_bn2bin(EC_KEY_get0_private_key(k),sk + PRIME_BYTES - len); sk += PRIME_BYTES;

#ifdef PRIME_FIELD
  if (!EC_POINT_get_affine_coordinates_GFp(group,EC_KEY_get0_public_key(k),kx,ky,0)) goto error;
#else
  if (!EC_POINT_get_affine_coordinates_GF2m(group,EC_KEY_get0_public_key(k),kx,ky,0)) goto error;
#endif

  len = BN_num_bytes(kx); if (len > PRIME_BYTES) goto error;
  BN_bn2bin(kx,sk + PRIME_BYTES - len); sk += PRIME_BYTES;
  BN_bn2bin(kx,pk + PRIME_BYTES - len); pk += PRIME_BYTES;

  len = BN_num_bytes(ky); if (len > PRIME_BYTES) goto error;
  BN_bn2bin(ky,sk + PRIME_BYTES - len); sk += PRIME_BYTES;
  BN_bn2bin(ky,pk + PRIME_BYTES - len); pk += PRIME_BYTES;

  BN_free(ky);
  BN_free(kx);
  EC_KEY_free(k);
  return 0;

error:
  BN_free(ky);
  BN_free(kx);
  EC_KEY_free(k);
  return -1;
}
