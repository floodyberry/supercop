#include "crypto_hash_sha256.h"
#include "crypto_sign.h"
#include "sizes.h"

extern int keypair( unsigned char sk[SECRETKEY_BYTES] , unsigned
long long * sklen , unsigned char pk[PUBLICKEY_BYTES] ,
unsigned long long * pklen );

extern int signatureofshorthash(unsigned char *,unsigned long long *,
  const unsigned char *,unsigned long long,
  const unsigned char *,unsigned long long);
extern int verification(const unsigned char *,unsigned long long,
  const unsigned char *,unsigned long long,
  const unsigned char *,unsigned long long);

#ifdef __cplusplus
extern "C"
#endif
int crypto_sign_keypair( unsigned char *pk, unsigned char *sk )
{
	unsigned long long sklen;
	unsigned long long pklen;
	return keypair( sk , &sklen , pk , &pklen );
}

#ifdef __cplusplus
extern "C"
#endif
int crypto_sign(
  unsigned char *sm,unsigned long long *smlen,
  const unsigned char *m,unsigned long long mlen,
  const unsigned char *sk
)
{
  unsigned char h[32];
  int i;

  crypto_hash_sha256(h,m,mlen);

  if (SHORTHASH_BYTES < 32) return -1;
  i = signatureofshorthash(sm,smlen,h,32,sk,SECRETKEY_BYTES);
  if (i < 0) return i;

  if (*smlen != SIGNATURE_BYTES) return -1;
  for (i = 0;i < mlen;++i) {
    sm[*smlen] = m[i];
    ++*smlen;
  }
  return 0;
}

#ifdef __cplusplus
extern "C"
#endif
int crypto_sign_open(
  unsigned char *m,unsigned long long *mlen,
  const unsigned char *sm,unsigned long long smlen,
  const unsigned char *pk
)
{
  unsigned char h[32];
  int i;

  if (smlen < SIGNATURE_BYTES) return -100;
  for (i = SIGNATURE_BYTES;i < smlen;++i) m[i - SIGNATURE_BYTES] = sm[i];
  *mlen = smlen - SIGNATURE_BYTES;
  crypto_hash_sha256(h,m,*mlen);
  if (SHORTHASH_BYTES < 32) return -1;
  return verification(h,32,sm,SIGNATURE_BYTES,pk,PUBLICKEY_BYTES);
}
