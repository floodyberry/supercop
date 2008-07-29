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
 * File: ntru_encrypt_keygen.h
 *
 * Contents: Definitions and declarations for routines implementing
 *           NTRUEncrypt key generation.
 *
 *****************************************************************************/

#ifndef NTRU_ENCRYPT_KEYGEN_H
#define NTRU_ENCRYPT_KEYGEN_H

#include "crypto_platform.h"
#include "ntru_encrypt_param_sets.h"


/*************************
 * FUNCTION DECLARATIONS *
 *************************/

/* ntru_encrypt_keygen
 *
 * Computes an NTRUEncrypt keypair, returning the private and public keys.
 * The private key contains F (or f1, f2, f3 if product form) followed by h,
 * since h is also needed for decryption and is thus considered part of the
 * "private key" in this case.
 *
 * Returns 0 if successful, nonzero otherwise.
 */

extern uint32_t
ntru_encrypt_keygen(
    NTRU_ENCRYPT_PARAM_SET_ID  param_set_id, /*  in - parameter set */
    uint32_t                  *priv_key_len, /* out - no. of octets in private
                                                      key */
    uint8_t                   *priv_key,     /* out - addr for the private
                                                      key */
    uint32_t                  *pub_key_len,  /* out - no. of octets in public
                                                      key */
    uint8_t                   *pub_key);     /* out - addr for the public key */


#endif /* NTRU_ENCRYPT_KEYGEN_H */


