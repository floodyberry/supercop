#include <openssl/evp.h>
#include "crypto_aead.h"

int crypto_aead_decrypt(
  unsigned char *m,unsigned long long *mlen,
  unsigned char *nsec,
  const unsigned char *c,unsigned long long clen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *npub,
  const unsigned char *k
)
{
  EVP_CIPHER_CTX x;
  int outlen = 0;
  int ok = 1;
  
  if (adlen > 536870912) return -111; 
  /* OpenSSL needs to put lengths into an int */
  if (clen > 536870912) return -111;

  if (clen < 16) return -1;
  clen -= 16;

  EVP_CIPHER_CTX_init(&x);
  if (ok == 1) ok = EVP_DecryptInit_ex(&x,EVP_aes_256_gcm(),0,0,0);
  if (ok == 1) ok = EVP_CIPHER_CTX_ctrl(&x,EVP_CTRL_GCM_SET_IVLEN,12,0);
  if (ok == 1) ok = EVP_CIPHER_CTX_ctrl(&x,EVP_CTRL_GCM_SET_TAG,16,(unsigned char *) c + clen);
  if (ok == 1) ok = EVP_DecryptInit_ex(&x,0,0,k,npub);
  if (ok == 1) ok = EVP_DecryptUpdate(&x,0,&outlen,ad,adlen);
  if (ok == 1) ok = EVP_DecryptUpdate(&x,m,&outlen,c,clen);
  if (ok == 1) ok = EVP_DecryptFinal_ex(&x,m + clen,&outlen);
  EVP_CIPHER_CTX_cleanup(&x);

  if (ok == 1) {
    *mlen = clen;
    return 0;
  }
  return -1; /* forgery; XXX: or out of memory? hmmm */
}
