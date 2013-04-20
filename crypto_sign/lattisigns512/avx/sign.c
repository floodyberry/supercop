/*
 * File:   lattisigns512-20130329/sign.c
 * Author: Gim Güneysu, Tobias Oder, Thomas Pöppelmann, Peter Schwabe
 * Public Domain
 */

#include "crypto_int32.h"
#include "crypto_sign.h"
#include "poly.h"
#include "params.h"
#include "crypto_hash_sha512.h"
#include "cpucycles.h"


static void hash160(unsigned char h[20], const unsigned char *m, unsigned long long mlen)
{
  int i;
  unsigned char t[64];
  crypto_hash_sha512(t, m, mlen);
  for(i=0;i<20;i++)
    h[i] = t[i];
}


int crypto_sign_keypair(unsigned char *pk, unsigned char *sk)
{
    poly s1,s2,t;
    int i, j;

    // generate private key
    poly_setrandom_max1(s1);
    poly_setrandom_max1(s2);

    // compress private key
    for(i=0;i<POLY_DEG/4;i++)
    {
      sk[i] = 0;
      for(j=0;j<4;j++)
        sk[i] ^= (((char)((1-s1[4*i+j]))) & 3) << (2*j); /* Encode x as 1-x: 0 as 1, 1 as 0, -1 as 2 */
    }
    for(i=0;i<POLY_DEG/4;i++)
    {
      sk[i+POLY_DEG/4] = 0;
      for(j=0;j<4;j++)
        sk[i+POLY_DEG/4] ^= (((char)((1-s2[4*i+j]))) & 3) << (2*j); /* Encode x as 1-x: 0 as 1, 1 as 0, -1 as 2 */
    }

    poly_mul_a(t, s1);
    poly_add_nored(t, t, s2);

    poly_pack(pk, t);
    return 0;
}

/* Signature has the format (h,z1,znew) with
 * h:      20 bytes
 * z1:   1024 bytes
 * znew:  140 bytes 
 * */
int crypto_sign(unsigned char *sm, 
                unsigned long long *smlen, 
                const unsigned char *m,
                unsigned long long mlen,
                const unsigned char* sk)
{
  poly s1, s2, y1, y2, z1, z2, ay;
  poly c, tmp;
  int i,j, cnt = 0; //loop counter
  int notyet = 1;
  crypto_int32 d;

  crypto_int32 upper_bound = PARAM_KM32;
  crypto_int32 lower_bound = -PARAM_KM32;
//  unsigned long long t1, t2;

  // Extract s1 and s2 from sk
  for(i=0;i<POLY_DEG/4;i++)
    for(j=0;j<4;j++)
      s1[4*i+j] = (double)(1 - ((sk[i] >> (2*j)) & 3)); /* Inverse encoding again by computing 1-x */
  for(i=0;i<POLY_DEG/4;i++)
    for(j=0;j<4;j++)
      s2[4*i+j] = (double)(1 - ((sk[i+POLY_DEG/4] >> (2*j)) & 3)); /* Inverse encoding again by computing 1-x */

  /*XXX: Should validate secret-key polynomials here */

  while(notyet)
  {
//    t1 = cpucycles();
    cnt++;
    notyet = 0;
    
    for(i=0;i<mlen;i++)
      sm[i+crypto_sign_BYTES] = m[i];

    poly_setrandom_maxk(y1);
    poly_setrandom_maxk(y2);

    poly_mul_a(ay, y1);

    poly_add_nored(tmp, ay, y2);

    poly_extract_high_bits(sm+crypto_sign_BYTES-POLY_DEG, tmp);
    
    hash160(sm, sm+crypto_sign_BYTES-POLY_DEG, mlen+POLY_DEG);

    poly_fromhash(c, sm);
    poly_mul(z1,c,s1);
    poly_add_nored(z1,z1,y1);
    poly_coeffreduce(z1);
    // Ensure (in constant time) that coefficients of z1 are in [lower_bound,upper_bound]
    d = 0;
    for(i=0;i<POLY_DEG;i++)
    {
      d |= upper_bound - (crypto_int32)z1[i];
      d |= (crypto_int32)z1[i] - lower_bound;
    }
    notyet |= (d & 0x80000000);

    poly_mul(z2,c,s2);
    poly_add_nored(z2,z2,y2);
    poly_coeffreduce(z2);
    // Ensure (in constant time) that coefficients of z2 are in [lower_bound,upper_bound]
    d = 0;
    for(i=0;i<POLY_DEG;i++)
    {
      d |= upper_bound - (crypto_int32)z2[i];
      d |= (crypto_int32)z2[i] - lower_bound;
    }
    notyet |= (d & 0x80000000);

   
    poly_add_nored(tmp, ay, y2);
    poly_sub_nored(tmp, tmp, z2);

    notyet |= poly_cannotcompress(tmp, z2);
//    t2 = cpucycles();
//    printf("cycles: %llu\n",t2-t1); 
  }
  poly_smallcoeff_pack(sm+20,z1);
  poly_compress(sm+1044, tmp, z2);
  //printf("cnt:%u\n",cnt);

  for(i=0;i<mlen;i++)
    sm[i+crypto_sign_BYTES] = m[i];

  *smlen = mlen+crypto_sign_BYTES;

  return 0;
}


int crypto_sign_open(unsigned char *m,
                     unsigned long long *mlen,
                     const unsigned char *sm,
                     unsigned long long smlen,
                     const unsigned char *pk)
{
  poly c;
  poly t,tmp,tmp2,z1,znew;
  unsigned char d[smlen-crypto_sign_BYTES+POLY_DEG], h[20]; /* get rid of d? */
  unsigned long long i;

  *mlen = smlen-crypto_sign_BYTES;

  poly_fromhash(c,sm);
  if(!poly_smallcoeff_unpack(z1, sm+20)) 
    goto fail;
  if(!poly_decompress(znew, sm+1044))
    goto fail;
  
  poly_unpack(t, pk);

  poly_mul(tmp, c, t);

  poly_mul_a(tmp2, z1);
  poly_add_nored(tmp2, znew, tmp2);
  poly_sub_nored(tmp, tmp2, tmp);

  poly_extract_high_bits(d, tmp);
  for(i=0;i<*mlen;i++)
    d[i+POLY_DEG] = sm[i+crypto_sign_BYTES];
  hash160(h, d, *mlen+POLY_DEG);

  for(i=0;i<20;i++)
    if(sm[i] != h[i]) 
      goto fail;
  
  /*
  sparsepoly_fromhash(&c2, h);

  if(c.one_count != c2.one_count) goto fail;
  if(c.minusone_count != c2.minusone_count) goto fail;
  for(i=0;i<c.one_count;i++)
    if(c.one[i] != c2.one[i]) goto fail;
  for(i=0;i<c.minusone_count;i++)
    if(c.minusone[i] != c2.minusone[i]) goto fail;
    */

  for(i=0;i<*mlen;i++)
    m[i] = sm[i+crypto_sign_BYTES];

  return 0;

fail:
  for(i=0;i<*mlen;i++)
    m[i] = 0;
  *mlen = (unsigned long long)-1;
  return -1;
}
