/******************************************************************************
 * Copyright (C) 2006 by                             NTRU Cryptosystems, Inc. *
 *                        ---ALL RIGHTS RESERVED---                           *
 *                                                                            *
 * This software is proprietary and confidential to NTRU Cryptosystems, Inc., *
 * is furnished under a license and may be used and copied only in accordance *
 * with the terms of such license and with the inclusion of the above         *
 * copyright notice. This software or any other copies thereof may not be     *
 * provided or otherwise made available to any other person. No title to and  *
 * ownership of the software is hereby transferred.                           *
 *                                                                            *
 * The information in this software is subject to change without notice       *
 * and should not be construed as a commitment by NTRU Cryptosystems, Inc.    *
 *                                                                            *
 ******************************************************************************/
/******************************************************************************
 *
 * File: ntru_encrypt.h
 *
 * Contents: Definitions and declarations for NTRUEncrypt encryption and
 *           decryption routines.
 *
 *****************************************************************************/

#ifndef NTRU_ENCRYPT_H
#define NTRU_ENCRYPT_H

#include "crypto_platform.h"
#include "ntru_encrypt_param_sets.h"


/*************************
 * FUNCTION DECLARATIONS *
 *************************/

/* ntru_encrypt
 *
 * Implements NTRU encryption (SVES) for the given parameter set.
 *
 * Returns 0 on success, nonzero otherwise.
 */

extern uint32_t
ntru_encrypt(
    NTRU_ENCRYPT_PARAM_SET_ID  param_set_id, /*  in - parameter set */
    uint32_t                   pub_key_len,  /*  in - no. of octets in public
                                                      key */
    uint8_t const             *pub_key,      /*  in - pointer to public key */
    uint32_t                   pt_len,       /*  in - no. of octets in
                                                      plaintext */
    uint8_t const             *pt,           /*  in - pointer to plaintext */
    uint32_t                  *ct_len,       /* out - address for no. of octets
                                                      in ciphertext */
    uint8_t                   *ct);          /* out - address for ciphertext */


/* ntru_decrypt
 *
 * Implements NTRU decryption (SVES) for the given parameter set.
 *
 * priv_key includes the private key followed by the public key.
 *
 * Returns 0 on success, nonzero otherwise.
 */

extern uint32_t
ntru_decrypt(
    NTRU_ENCRYPT_PARAM_SET_ID  param_set_id, /*  in - parameter set */
    uint32_t                   priv_key_len, /*  in - no. of octets in private
                                                      key */
    uint8_t const             *priv_key,     /*  in - pointer to private key */
    uint32_t                   ct_len,       /*  in - no. of octets in
                                                      ciphertext */
    uint8_t const             *ct,           /*  in - pointer to ciphertext */
    uint32_t                  *pt_len,       /* out - addr for no. of octets in
                                                      plaintext */
    uint8_t                   *pt);          /* out - addr for plaintext */


#endif /* NTRU_ENCRYPT_H */
