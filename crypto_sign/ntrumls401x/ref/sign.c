/*
 * CPASSREF/sign.c
 *
 *  Copyright 2013 John M. Schanck
 *
 *  This file is part of CPASSREF.
 *
 *  CPASSREF is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  CPASSREF is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with CPASSREF.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include "crypto_sign.h"

#include "params.h"
#include "pqerror.h"
#include "pqntrusign.h"

#define PARAM_SET DRAFT_401

int
crypto_sign_keypair(unsigned char *pk, unsigned char *sk)
{
  PQ_PARAM_SET *P;
  size_t sk_blob_len;
  size_t pk_blob_len;
  int rc;

  if(!(P = pq_get_param_set_by_id(PARAM_SET)))
  {
    return -1;
  }

  pq_gen_key(P, &sk_blob_len, NULL, &pk_blob_len, NULL);
  if(rc == PQNTRU_ERROR)
  {
    return -1;
  }

  pq_gen_key(P, &sk_blob_len, sk, &pk_blob_len, pk);
  if(rc == PQNTRU_ERROR)
  {
    return -1;
  }

  /* bummer. we have to copy the public key into the secret
   * key blob to have access to it in crypto_sign */
  memcpy(sk+sk_blob_len, pk, pk_blob_len);

  return 0;
}

int
crypto_sign(
    unsigned char *sm, unsigned long long *smlen,
    const unsigned char *m, unsigned long long mlen,
    const unsigned char *sk)
{

  size_t lsmlen = crypto_sign_BYTES;
  size_t sk_blob_len;
  size_t pk_blob_len;
  int rc;

  PQ_PARAM_SET *P;
  if(!(P = pq_get_param_set_by_id(PARAM_SET)))
  {
    return -1;
  }

  /* get the actual blob sizes */
  pq_gen_key(P, &sk_blob_len, NULL, &pk_blob_len, NULL);
  if(rc == PQNTRU_ERROR)
  {
    return -1;
  }

  rc = pq_sign(&lsmlen, sm,
                 sk_blob_len, sk,
                 pk_blob_len, sk+sk_blob_len,
                 mlen, m);
  if(rc == PQNTRU_ERROR)
  {
    return -1;
  }

  *smlen = crypto_sign_BYTES + mlen;
  memcpy(sm + crypto_sign_BYTES, m, mlen);

  return 0;
}

int
crypto_sign_open(
    unsigned char *m, unsigned long long *mlen,
    const unsigned char *sm, unsigned long long smlen,
    const unsigned char *pk)
{
  int rc;

  rc = pq_verify(crypto_sign_BYTES, sm,
                 crypto_sign_PUBLICKEYBYTES, pk,
                 smlen-crypto_sign_BYTES, sm+crypto_sign_BYTES);

  if(rc != PQNTRU_OK)
  {
    return -1;
  }
  else
  {
    *mlen = smlen-crypto_sign_BYTES;
    memmove(m, sm+crypto_sign_BYTES, *mlen);
    return 0;
  }
}

