#include <string.h>
#include <gmp.h>
#include "field.h"
#include "crypto_dh.h"
#include "randombytes.h"

#define SHAREDSECRET_BYTES crypto_dh_BYTES
#define PUBLICKEY_BYTES crypto_dh_PUBLICKEYBYTES
#define SECRETKEY_BYTES crypto_dh_SECRETKEYBYTES

typedef unsigned char uchar;
typedef unsigned long long ullong;

// proto of main ECC function (imported):
void ECmul(Kfield k, Kdst_elt res,
    Ksrc_elt x, mpz_t key);


// Some conversion functions.
// Have to do it the slow way due to endianess, I think.
static void bytes2elt(Kelt z, const uchar*x)
{
  int i, j;
  const int bytesperlimb = GMP_LIMB_BITS/8;

  for (i = 0; i < SECRETKEY_BYTES/bytesperlimb; ++i) {
    mp_limb_t c = 0;
    for (j = 0; j < bytesperlimb; ++j) 
      c |= ( (mp_limb_t)(x[bytesperlimb*i+j]) ) << 8*j;
    z[i] = c;
  }
}

static void elt2bytes(uchar *x, const Kelt z)
{
  int i, j;
  const int bytesperlimb = GMP_LIMB_BITS/8;

  for (i = 0; i < SECRETKEY_BYTES/bytesperlimb; ++i) {
    mp_limb_t c = z[i];
    for (j = 0; j < bytesperlimb; ++j) {
      x[bytesperlimb*i+j] = c & 255;
      c >>= 8;
    }
  }
}



//////////////
// eBAT API //
//////////////
int crypto_dh_keypair(uchar *pk,
            uchar *sk)
{
  int i;
  mpz_t key;
  Kfield K;
  Kelt base_point, res;
  
  // Get random bytes for sk
  randombytes(sk,SECRETKEY_BYTES);
  sk[0] &= ~7; // clear bits 0,1,2
  sk[SECRETKEY_BYTES-1] &= (1UL << (GMP_LIMB_BITS-1))-1; // clear bit 255
  sk[SECRETKEY_BYTES-1] |= 1UL << (GMP_LIMB_BITS-2); // set bit 254
  
  // init field and base_point
  Kfield_init();
  Kinit(&base_point);
  Kset_uipoly(base_point, 9);

  // put the key in an mpz
  mpz_init_set_ui(key, 0);
  for (i = SECRETKEY_BYTES-1; i > 0; --i) {
    mpz_add_ui(key, key, sk[i]);
    mpz_mul_2exp(key, key, 8);
  }
  mpz_add_ui(key, key, sk[0]);

  // Scalar multiplication
  ECmul(K, res, base_point, key);
  
  // put the result in pk
  elt2bytes(pk, res);
 
  // clean
  mpz_clear(key);
  Kclear(&base_point);
  Kclear(&res);
  Kfield_clear();
  
  return 0;
}
  
int crypto_dh(uchar *s,
    const uchar *pk,
    const uchar *sk
    )
{
  int i;
  mpz_t key;
  Kfield K;
  Kelt base_point, res;
  
  // init field and base_point
  Kfield_init();
  Kinit(&base_point);

  // read base_point from {pk,pklen}
  bytes2elt(base_point, pk);

  // put the key in an mpz
  mpz_init_set_ui(key, 0);
  for (i = SECRETKEY_BYTES-1; i > 0; --i) {
    mpz_add_ui(key, key, sk[i]);
    mpz_mul_2exp(key, key, 8);
  }
  mpz_add_ui(key, key, sk[0]);

  // Scalar multiplication
  ECmul(K, res, base_point, key);
  
  // put the result in s
  elt2bytes(s, res);
 
  // clean
  mpz_clear(key);
  Kclear(&base_point);
  Kclear(&res);
  Kfield_clear();
  
  return 0;
}  
