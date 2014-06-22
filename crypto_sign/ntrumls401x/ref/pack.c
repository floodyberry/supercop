/*
 * CPQREF/pack.c
 *
 *  Copyright 2014 John M. Schanck
 *
 *  This file is part of CPQREF.
 *
 *  CPQREF is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  CPQREF is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with CPQREF.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "crypto_hash_sha512.h"

#include "params.h"
#include "pack.h"
#include "convert.h"
#include "pqerror.h"


int
get_blob_params(
    PQ_PARAM_SET        **P,
    const size_t        blob_len,
    const unsigned char *blob)
{
  if(!P || !blob || blob_len < (2 + OID_BYTES))
  {
    return PQNTRU_ERROR;
  }

  /* TODO: support other OID lengths */
  if(blob[1] != OID_BYTES)
  {
    return PQNTRU_ERROR;
  }

  if(!(*P = pq_get_param_set_by_oid((const uint8_t*)(2 + blob))))
  {
    return PQNTRU_ERROR;
  }

  return PQNTRU_OK;
}


int
unpack_private_key(
    PQ_PARAM_SET        *P,
    uint16_t            *f,
    uint16_t            *g,
    int64_t             *ginv,
    const size_t        blob_len,
    const unsigned char *blob)
{
  const unsigned char *blob_ptr;

  if(!P || !f || !g || !ginv || !blob)
  {
    return PQNTRU_ERROR;
  }

  if(blob_len != PRIVKEY_PACKED_BYTES(P))
  {
    return PQNTRU_ERROR;
  }

  blob_ptr = blob + 2 + OID_BYTES;

  /* Unpack f */
  octets_2_int16_elements(PACKED_PRODUCT_FORM_BYTES(P),
                    blob_ptr, P->N_bits, f);

  blob_ptr += PACKED_PRODUCT_FORM_BYTES(P);

  /* Unpack g */
  octets_2_int16_elements(PACKED_PRODUCT_FORM_BYTES(P),
                    blob_ptr, P->N_bits, g);

  blob_ptr += PACKED_PRODUCT_FORM_BYTES(P);

  /* Unpack g^-1 */
  bits_2_int64_trits(PACKED_MOD3_POLY_BYTES(P),
                     blob_ptr, ginv, P->N);

  return PQNTRU_OK;
}


int
unpack_public_key(
    PQ_PARAM_SET        *P,
    int64_t             *h,
    const size_t        blob_len,
    const unsigned char *blob)
{
  int          rc;

  rc = get_blob_params(&P, blob_len, blob);
  if(PQNTRU_ERROR == rc)
  {
    return PQNTRU_ERROR;
  }

  if(blob_len != PUBKEY_PACKED_BYTES(P))
  {
    return PQNTRU_ERROR;
  }

  /* Unpack h */
  /* This assumes q is a power of 2, so that we don't
   * need to find a positive representative of each coefficient
   * of h.
   * TODO: push h into {0..q-1} if we ever support other q
   */
  octets_2_int64_elements(PACKED_MODQ_POLY_BYTES(P),
                          blob + 2 + OID_BYTES,
                          P->q_bits, (uint64_t*)h);

  return PQNTRU_OK;
}

int
pack_public_key(
    PQ_PARAM_SET        *P,
    int64_t             *h,
    size_t              blob_len,
    unsigned char       *blob)
{
  unsigned char *blob_ptr;

  if(blob_len != PUBKEY_PACKED_BYTES(P))
  {
    return PQNTRU_ERROR;
  }

  /* Set tag, oid length, and oid */
  blob_ptr = blob;
  *blob_ptr++ = PQNTRU_PUBKEY_TAG;
  *blob_ptr++ = sizeof(P->OID);
  memcpy(blob_ptr, P->OID, sizeof(P->OID));
  blob_ptr += sizeof(P->OID);

  /* pack public key */
  /* TODO: push h into {0..q-1} if we ever support other q */
  int64_elements_2_octets(P->N, (uint64_t *)h, P->q_bits, blob_ptr);

  blob_ptr += PACKED_MODQ_POLY_BYTES(P);

  /* append digest */
  crypto_hash_sha512(blob_ptr, blob, 2 + OID_BYTES + PACKED_MODQ_POLY_BYTES(P));

  return PQNTRU_OK;
}


int
pack_private_key(
    PQ_PARAM_SET  *P,
    uint16_t      *f,
    uint16_t      *g,
    int64_t       *ginv,
    size_t        blob_len,
    unsigned char *blob)
{
  unsigned char *blob_ptr;
  uint16_t dFG;

  if(blob_len != PRIVKEY_PACKED_BYTES(P))
  {
    return PQNTRU_ERROR;
  }

  dFG = 2*(P->d1 + P->d2 + P->d3);

  /* Set tag, oid length, and oid */
  blob_ptr = blob;
  *blob_ptr++ = PQNTRU_PRIVKEY_TAG;
  *blob_ptr++ = sizeof(P->OID);
  memcpy(blob_ptr, P->OID, sizeof(P->OID));
  blob_ptr += sizeof(P->OID);

  /* pack private key */
  int16_elements_2_octets(dFG, f, P->N_bits, blob_ptr);
  blob_ptr += PACKED_PRODUCT_FORM_BYTES(P);

  int16_elements_2_octets(dFG, g, P->N_bits, blob_ptr);
  blob_ptr += PACKED_PRODUCT_FORM_BYTES(P);

  int64_trits_2_bits(ginv, P->N, PACKED_MOD3_POLY_BYTES(P), blob_ptr);

  return PQNTRU_OK;
}

int
pack_signature(
    PQ_PARAM_SET        *P,
    const int64_t       *sig,
    const size_t         blob_len,
    unsigned char       *blob)
{
  if(blob_len != SIGNATURE_BYTES(P))
  {
    return PQNTRU_ERROR;
  }

  /* TODO: push sig into {0..q-1} if we ever support other q */
  int64_elements_2_octets(P->N, (uint64_t *)sig, P->q_bits - 1, blob);

  return PQNTRU_OK;
}

int
unpack_signature(
    PQ_PARAM_SET        *P,
    int64_t             *sig,
    const size_t        blob_len,
    const unsigned char *blob)
{

  if(blob_len != SIGNATURE_BYTES(P))
  {
    return PQNTRU_ERROR;
  }

  octets_2_int64_elements(SIGNATURE_BYTES(P),
                          blob, P->q_bits-1, (uint64_t *)sig);

  return PQNTRU_OK;
}


int
get_digest_ptr(
    PQ_PARAM_SET         *P,
    const unsigned char **digest,
    const size_t          blob_len,
    const unsigned char  *blob)
{
  if(blob_len != PUBKEY_PACKED_BYTES(P))
  {
    return PQNTRU_ERROR;
  }

  *digest = blob + 2 + OID_BYTES + PACKED_MODQ_POLY_BYTES(P);

  return PQNTRU_OK;
}

