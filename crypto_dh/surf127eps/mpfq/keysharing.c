#include <string.h>
#include <assert.h>
#include <gmp.h>
#include "mpfq_p_127_735.h"
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
  mpfq_p_127_735_elt x;
  mpfq_p_127_735_elt y;
  mpfq_p_127_735_elt z;
  mpfq_p_127_735_elt t;
} KSpoint_struct;

typedef KSpoint_struct KSpoint[1];
typedef KSpoint_struct * dst_KSpoint;
typedef const KSpoint_struct * src_KSpoint;

typedef struct {
  mpfq_p_127_735_elt y0;
  mpfq_p_127_735_elt z0;
  mpfq_p_127_735_elt t0;
  mpfq_p_127_735_elt y0p;
  mpfq_p_127_735_elt z0p;
  mpfq_p_127_735_elt t0p;
} KSparam_struct;

typedef KSparam_struct KSparam[1];
typedef const KSparam_struct * src_KSparam;

// proto of main KS function (imported):
void KSmul(mpfq_p_127_735_field k, dst_KSpoint res, src_KSpoint P, mpz_t key,
    src_KSparam KS);

void KSinit(mpfq_p_127_735_field k, dst_KSpoint P);
void KSclear(mpfq_p_127_735_field k, dst_KSpoint P);
void KSprint(mpfq_p_127_735_field k, src_KSpoint P);


// standard KS
void StandardKS(mpfq_p_127_735_field k, KSparam_struct* KS) {
  mpfq_p_127_735_init(k, &(KS->y0 ));
  mpfq_p_127_735_init(k, &(KS->z0 ));
  mpfq_p_127_735_init(k, &(KS->t0 ));
  mpfq_p_127_735_init(k, &(KS->y0p));
  mpfq_p_127_735_init(k, &(KS->z0p));
  mpfq_p_127_735_init(k, &(KS->t0p));

  mpfq_p_127_735_read(k, KS->y0, "86208552985914662648361214299883935423", 10);
  mpfq_p_127_735_read(k, KS->z0, "160053938517731349632395585267160595069", 10);
  mpfq_p_127_735_read(k, KS->t0, "35005564474699507747312683600916451858", 10);
  mpfq_p_127_735_read(k, KS->y0p, "94814796580219064497014986095768528928", 10);
  mpfq_p_127_735_read(k, KS->z0p, "42902767594179849850407630572137072504", 10);
  mpfq_p_127_735_read(k, KS->t0p, "22524084758416781578372604087642334537", 10);
}

// Some conversion functions.
// Have to do it the slow way due to endianess, I think.
static void bytes2elt(mpfq_p_127_735_elt z, const uchar*x)
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

static void elt2bytes(uchar *x, const mpfq_p_127_735_elt z)
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
int crypto_dh_keypair(uchar *pk,
            uchar *sk)
{
  int i;
  mpz_t key;
  mpfq_p_127_735_field K;
  KSpoint base_point, res;
  KSparam KS;
  
  // Get random bytes for sk
  randombytes(sk,SECRETKEY_BYTES);
  sk[0] &= ~1; // clear bits 0
  
  // init field and base_point
  mpfq_p_127_735_field_init(K, (mp_limb_t *)NULL);
  KSinit(K, base_point);
  mpfq_p_127_735_read(K, base_point->x, "1", 10);
  mpfq_p_127_735_read(K, base_point->y, "1", 10);
  mpfq_p_127_735_read(K, base_point->z, "49", 10);
  mpfq_p_127_735_read(K, base_point->t, "53867932920444881924681329411677323765", 10);

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
  mpfq_p_127_735_inv(K, res->x, res->x);
  mpfq_p_127_735_mul(K, res->y, res->y, res->x);
  mpfq_p_127_735_mul(K, res->z, res->z, res->x);
  mpfq_p_127_735_mul(K, res->t, res->t, res->x);
  
  // put the result in pk
  elt2bytes(pk, res->y);
  elt2bytes(pk+16, res->z);
  elt2bytes(pk+32, res->t);
 
  // clean
  mpz_clear(key);
  KSclear(K, base_point);
  KSclear(K, res);
  mpfq_p_127_735_field_clear(K);
  
  return 0;
}
  
int crypto_dh(uchar *s,
    const uchar *pk,
    const uchar *sk)
{
  int i;
  mpz_t key;
  mpfq_p_127_735_field K;
  KSpoint base_point, res;
  KSparam KS;
  
  // init field and base_point
  mpfq_p_127_735_field_init(K, (mp_limb_t *)NULL);
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
  mpfq_p_127_735_inv(K, res->x, res->x);
  mpfq_p_127_735_mul(K, res->y, res->y, res->x);
  mpfq_p_127_735_mul(K, res->z, res->z, res->x);
  mpfq_p_127_735_mul(K, res->t, res->t, res->x);

  
  // put the result in s
  elt2bytes(s, res->y);
  elt2bytes(s+16, res->z);
  elt2bytes(s+32, res->t);
 
  // clean
  mpz_clear(key);
  KSclear(K, base_point);
  KSclear(K, res);
  mpfq_p_127_735_field_clear(K);
  
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
