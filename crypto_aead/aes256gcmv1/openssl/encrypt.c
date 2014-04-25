#include <openssl/evp.h>
#include "crypto_aead.h"

int crypto_aead_encrypt(
  unsigned char *c,unsigned long long *clen,
  const unsigned char *m,unsigned long long mlen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *nsec,
  const unsigned char *npub,
  const unsigned char *k
)
{
  EVP_CIPHER_CTX x;
  int outlen = 0;
  int ok = 1;

  if (adlen > 536870912) return -111;
  /* OpenSSL needs to put lengths into an int */
  if (mlen > 536870912) return -111;

  EVP_CIPHER_CTX_init(&x);
  if (ok == 1) ok = EVP_EncryptInit_ex(&x,EVP_aes_256_gcm(),0,0,0);
  if (ok == 1) ok = EVP_CIPHER_CTX_ctrl(&x,EVP_CTRL_GCM_SET_IVLEN,12,0);
  if (ok == 1) ok = EVP_EncryptInit_ex(&x,0,0,k,npub);
  if (ok == 1) ok = EVP_EncryptUpdate(&x,0,&outlen,ad,adlen);
  if (ok == 1) ok = EVP_EncryptUpdate(&x,c,&outlen,m,mlen);
  if (ok == 1) ok = EVP_EncryptFinal_ex(&x,c,&outlen);
  if (ok == 1) ok = EVP_CIPHER_CTX_ctrl(&x,EVP_CTRL_GCM_GET_TAG,16,c + mlen);
  EVP_CIPHER_CTX_cleanup(&x);

  if (ok == 1) {
    *clen = mlen + 16;
    return 0;
  }
  return -111;
}
