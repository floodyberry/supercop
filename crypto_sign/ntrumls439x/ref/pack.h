/*
 * CPQREF/pack.h
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

#ifndef CPQREF_PACK_H_
#define CPQREF_PACK_H_


/* TODO: Define this elsewhere. */
#define HASH_BYTES 64


/* Key blob identifiers */
#define PQNTRU_PUBKEY_TAG        0x00
#define PQNTRU_PRIVKEY_TAG       0x80

/* TODO: Support other OID lengths */
#define OID_BYTES ((sizeof(((PQ_PARAM_SET*)0)->OID)))


/* no. of bytes in packed product form polynomial, e.g. f */
#define PACKED_PRODUCT_FORM_BYTES(P) \
               ((2 * ((P)->d1 + (P)->d2 + (P)->d3) * (P)->N_bits + 7) / 8)

/* no. of bytes in packed mod q polynomial, e.g. h */
#define PACKED_MODQ_POLY_BYTES(P) \
               (((P)->N * (P)->q_bits + 7)/8)

/* no. of bytes in packed mod 3 polynomial, e.g. g^-1 */
#define PACKED_MOD3_POLY_BYTES(P) (((P)->N + 4)/5)

/* no. of bytes in packed mod q polynomial, e.g. h */
#define PRODUCT_FORM_BYTES(P) \
               (2*((P)->d1 + (P)->d2 + (P)->d3) * sizeof(uint16_t))

/* no. of bytes in padded polynomials used in Karatsuba multiplication */
#define POLYNOMIAL_BYTES(P) \
               ((P)->padded_N * sizeof(int64_t))


/* Private key blob :=   TAG (1 byte)
 *                     | OID_LEN (1 byte)
 *                     | OID (OID_LEN bytes)
 *                     | product form f and g
 *                     | g^-1 mod p
 * XXX: assumes p = 3.
 * XXX: not standardized. subject to change
 */
#define PRIVKEY_PACKED_BYTES(P) \
        (2 \
        + OID_BYTES \
        + 2 * PACKED_PRODUCT_FORM_BYTES(P) \
        + PACKED_MOD3_POLY_BYTES(P))


/* Public key blob :=   TAG (1 byte)
 *                    | OID_LEN (1 byte)
 *                    | OID (OID_LEN bytes)
 *                    | h (N * ceil(log2(q)) bits)
 *                    | digest (HASH_BYTES bytes)
 * XXX: not standardized. subject to change
 */
#define PUBKEY_PACKED_BYTES(P)  \
        (2 \
        + OID_BYTES \
        + PACKED_MODQ_POLY_BYTES(P) \
        + HASH_BYTES)


#define SIGNATURE_BYTES(P)  \
        ((((P)->N * ((P)->q_bits-1) + 7)/8))


int
get_blob_params(
    PQ_PARAM_SET        **P,
    const size_t        blob_len,
    const unsigned char *blob);

int
pack_private_key(
    PQ_PARAM_SET  *P,
    uint16_t      *f,
    uint16_t      *g,
    int64_t       *ginv,
    size_t        blob_len,
    unsigned char *blob);

int
unpack_private_key(
    PQ_PARAM_SET        *P,
    uint16_t            *f,
    uint16_t            *g,
    int64_t             *ginv,
    const size_t        blob_len,
    const unsigned char *blob);

int
pack_public_key(
    PQ_PARAM_SET        *P,
    int64_t             *h,
    size_t              blob_len,
    unsigned char       *blob);

int
unpack_public_key(
    PQ_PARAM_SET        *P,
    int64_t             *h,
    const size_t        blob_len,
    const unsigned char *blob);

int
pack_signature(
    PQ_PARAM_SET        *P,
    const int64_t       *sig,
    const size_t         blob_len,
    unsigned char       *blob);

int
unpack_signature(
    PQ_PARAM_SET        *P,
    int64_t             *sig,
    const size_t        blob_len,
    const unsigned char *blob);

int
get_digest_ptr(
    PQ_PARAM_SET         *P,
    const unsigned char **digest,
    const size_t          blob_len,
    const unsigned char  *blob);

#endif
