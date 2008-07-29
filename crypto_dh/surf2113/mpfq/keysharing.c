#include <string.h>
#include <assert.h>
#include <gmp.h>
#include "field.h"
#include "crypto_dh.h"
#include "randombytes.h"

#define SECRETKEY_BYTES crypto_dh_SECRETKEYBYTES
#define PUBLICKEY_BYTES crypto_dh_PUBLICKEYBYTES
#define SHAREDSECRET_BYTES crypto_dh_BYTES

#define LIMB_PER_ELT (128/GMP_LIMB_BITS)

typedef unsigned char uchar;
typedef unsigned long long ullong;

// typedefs for Kummer surface:

typedef struct {
  Kelt x;
  Kelt y;
  Kelt z;
  Kelt t;
} KSpoint_struct;

typedef KSpoint_struct KSpoint[1];
typedef KSpoint_struct * dst_KSpoint;
typedef const KSpoint_struct * src_KSpoint;

typedef struct {
  Kelt beta;    // actually their inverses!
  Kelt gamma;
  Kelt delta;
} KSparam_struct;

typedef KSparam_struct KSparam[1];
typedef const KSparam_struct * src_KSparam;

// proto of main KS function (imported):
void KSmul(Kfield k, dst_KSpoint res, src_KSpoint P, mpz_t key,
    src_KSparam KS);

void KSinit(Kfield k, dst_KSpoint P);
void KSclear(Kfield k, dst_KSpoint P);
void KSprint(Kfield k, src_KSpoint P);


// standard KS
void StandardKS(Kfield K, KSparam_struct* KS) {
  Kinit(&(KS->beta ));
  Kinit(&(KS->gamma ));
  Kinit(&(KS->delta));

  Kset_uipoly(KS->beta, 523);
  Kset_uipoly(KS->gamma, 10);
  Kset_uipoly(KS->delta, 4);
}

// Some conversion functions.
// Have to do it the slow way due to endianess, I think.
static void bytes2elt(Kelt z, const uchar*x)
{
  int i, j;
  const int bytesperlimb = GMP_LIMB_BITS/8;

  for (i = 0; i < LIMB_PER_ELT; ++i) {
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

  for (i = 0; i < LIMB_PER_ELT; ++i) {
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
  Kfield K;
  KSpoint base_point, res;
  KSparam KS;
  
  // Get random bytes for sk
  randombytes(sk,SECRETKEY_BYTES);
  sk[0] &= ~1; // clear bits 0
  
  // init field and base_point
  Kfield_init();
  KSinit(K, base_point);
  Kset_uipoly(base_point->x, 1);
  Kset_uipoly(base_point->y, 1);
  Kset_uipoly(base_point->z, 4);
  {
	  mpz_t tz;
	  mpz_init_set_str(tz,"908681679267597915035722095941517",10);
	  Kset_uipoly_wide(base_point->t, tz[0]._mp_d, tz[0]._mp_size);
	  mpz_clear(tz);
  }

  // put the key in an mpz
  mpz_init_set_ui(key, 0);
  for (i = SECRETKEY_BYTES-1; i > 0; --i) {
    mpz_add_ui(key, key, sk[i]);
    mpz_mul_2exp(key, key, 8);
  }
  mpz_add_ui(key, key, sk[0]);

  // Scalar multiplication
  KSinit(K, res);
  StandardKS(K, KS);
  KSmul(K, res, base_point, key, KS);
  Kinv(res->x, res->x);
  Kmul(res->y, res->y, res->x);
  Kmul(res->z, res->z, res->x);
  Kmul(res->t, res->t, res->x);
  
  // put the result in pk
  elt2bytes(pk, res->y);
  elt2bytes(pk+16, res->z);
  elt2bytes(pk+32, res->t);
 
  // clean
  mpz_clear(key);
  KSclear(K, base_point);
  KSclear(K, res);
  Kfield_clear();
  
  return 0;
}
  
int crypto_dh(uchar *s,
    const uchar *pk,
    const uchar *sk)
{
  int i;
  mpz_t key;
  Kfield K;
  KSpoint base_point, res;
  KSparam KS;
  
  // init field and base_point
  Kfield_init();
  KSinit(K, base_point);

  // read base_point from {pk,pklen}
  bytes2elt(base_point->y, pk);
  bytes2elt(base_point->z, pk+16);
  bytes2elt(base_point->t, pk+32);
  base_point->x[0] = 1UL;
  for (i = 1; i < LIMB_PER_ELT; ++i)
    base_point->x[i] = 0UL;

  // put the key in an mpz
  mpz_init_set_ui(key, 0);
  for (i = SECRETKEY_BYTES-1; i > 0; --i) {
    mpz_add_ui(key, key, sk[i]);
    mpz_mul_2exp(key, key, 8);
  }
  mpz_add_ui(key, key, sk[0]);

  // Scalar multiplication
  KSinit(K, res);
  StandardKS(K, KS);
  KSmul(K, res, base_point, key, KS);
  Kinv(res->x, res->x);
  Kmul(res->y, res->y, res->x);
  Kmul(res->z, res->z, res->x);
  Kmul(res->t, res->t, res->x);

  
  // put the result in s
  elt2bytes(s, res->y);
  elt2bytes(s+16, res->z);
  elt2bytes(s+32, res->t);
 
  // clean
  mpz_clear(key);
  KSclear(K, base_point);
  KSclear(K, res);
  Kfield_clear();
  
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
