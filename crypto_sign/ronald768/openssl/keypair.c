#include <stddef.h>
#include <openssl/rsa.h>
#include <string.h>
#include "sizes.h"

int crypto_sign_keypair(unsigned char *pk,unsigned char *sk)
{
  RSA *r;
  unsigned char *out = sk;
  int len;

  memset(sk,0,SECRETKEY_BYTES);
  memset(pk,0,PUBLICKEY_BYTES);

  r = RSA_generate_key(MODULUS_BYTES * 8,3,0,0);
  if (!r) return -1;

  if (RSA_size(r) != MODULUS_BYTES) goto error;

  len = BN_num_bytes(r->n); if (len > MODULUS_BYTES) goto error;
  out += MODULUS_BYTES; BN_bn2bin(r->n,out - len);

  len = BN_num_bytes(r->e); if (len > MODULUS_BYTES) goto error;
  out += MODULUS_BYTES; BN_bn2bin(r->e,out - len);

  len = BN_num_bytes(r->d); if (len > MODULUS_BYTES) goto error;
  out += MODULUS_BYTES; BN_bn2bin(r->d,out - len);

  len = BN_num_bytes(r->p); if (len > MODULUS_BYTES) goto error;
  out += MODULUS_BYTES; BN_bn2bin(r->p,out - len);

  len = BN_num_bytes(r->q); if (len > MODULUS_BYTES) goto error;
  out += MODULUS_BYTES; BN_bn2bin(r->q,out - len);

  len = BN_num_bytes(r->dmp1); if (len > MODULUS_BYTES) goto error;
  out += MODULUS_BYTES; BN_bn2bin(r->dmp1,out - len);

  len = BN_num_bytes(r->dmq1); if (len > MODULUS_BYTES) goto error;
  out += MODULUS_BYTES; BN_bn2bin(r->dmq1,out - len);

  len = BN_num_bytes(r->iqmp); if (len > MODULUS_BYTES) goto error;
  out += MODULUS_BYTES; BN_bn2bin(r->iqmp,out - len);

  memcpy(pk,sk,MODULUS_BYTES);
  RSA_free(r);
  return 0;

  error:
  RSA_free(r);
  return -1;
}
