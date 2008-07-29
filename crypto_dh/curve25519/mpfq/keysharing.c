#include <string.h>
#include <assert.h>
#include <gmp.h>
#include "mpfq_p_25519.h"
#include "randombytes.h"
#include "crypto_dh.h"

#define SECRETKEY_BYTES crypto_dh_SECRETKEYBYTES
#define PUBLICKEY_BYTES crypto_dh_PUBLICKEYBYTES
#define SHAREDSECRET_BYTES crypto_dh_BYTES

typedef unsigned char uchar;
typedef unsigned long long ullong;

// proto of main ECC function (imported):
void ECmul(mpfq_p_25519_field k, mpfq_p_25519_dst_elt res,
    mpfq_p_25519_src_elt x, mpz_t key);


// Some conversion functions.
// Have to do it the slow way due to endianess, I think.
static void bytes2elt(mpfq_p_25519_elt z, const uchar*x)
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

static void elt2bytes(uchar *x, const mpfq_p_25519_elt z)
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
int crypto_dh_keypair(uchar *pk, uchar *sk)
{
  int i;
  mpz_t key;
  mpfq_p_25519_field K;
  mpfq_p_25519_elt base_point, res;
  
  // Get random bytes for sk
  randombytes(sk,SECRETKEY_BYTES);
  sk[0] &= ~7; // clear bits 0,1,2
  sk[SECRETKEY_BYTES-1] &= (1UL << (GMP_LIMB_BITS-1))-1; // clear bit 255
  sk[SECRETKEY_BYTES-1] |= 1UL << (GMP_LIMB_BITS-2); // set bit 254
  
  // init field and base_point
  mpfq_p_25519_field_init(K, (mp_limb_t *)NULL);
  mpfq_p_25519_init(K, &base_point);
  mpfq_p_25519_read(K, base_point, "9", 10);

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
  mpfq_p_25519_clear(K, &base_point);
  mpfq_p_25519_clear(K, &res);
  mpfq_p_25519_field_clear(K);
  
  return 0;
}
  
int crypto_dh(uchar *s,
    const uchar *pk,
    const uchar *sk)
{
  int i;
  mpz_t key;
  mpfq_p_25519_field K;
  mpfq_p_25519_elt base_point, res;
  
  // init field and base_point
  mpfq_p_25519_field_init(K, (mp_limb_t *)NULL);
  mpfq_p_25519_init(K, &base_point);

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
  mpfq_p_25519_clear(K, &base_point);
  mpfq_p_25519_clear(K, &res);
  mpfq_p_25519_field_clear(K);
  
  return 0;
}  

#ifdef WANT_MAIN2

int main(int argc, char **argv)
{
  uchar sk1[SECRETKEY_BYTES]; 
  uchar sk2[SECRETKEY_BYTES]; 
  uchar pk1[PUBLICKEY_BYTES]; 
  uchar pk2[PUBLICKEY_BYTES]; 
  ullong sklen1, sklen2, pklen1, pklen2;
  uchar key1[SHAREDSECRET_BYTES];
  uchar key2[SHAREDSECRET_BYTES];
  ullong klen1, klen2;

  
  keypair(sk1, &sklen1, pk1, &pklen1);
  keypair(sk2, &sklen2, pk2, &pklen2);

  printf("\n");

  sharedsecret(key1, &klen1, sk1, sklen1, pk2, pklen2);
  sharedsecret(key2, &klen2, sk2, sklen2, pk1, pklen1);

  assert(klen1 == klen2);
  assert(memcmp(key1, key2, klen1) == 0);

  return 0;
}

#endif
