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
 * File: crypto_hash_basics.h
 *
 * Contents: Common definitions for all hash algorithms.
 *
 *****************************************************************************/

#ifndef CRYPTO_HASH_BASICS_H
#define CRYPTO_HASH_BASICS_H

#include "crypto_config.h"


/**************
 * algorithms *
 **************/

typedef enum {
    CRYPTO_HASH_ALGID_NONE = 0,
#if defined(SHA_1)
    CRYPTO_HASH_ALGID_SHA1,
#endif
#if defined(SHA_256)
    CRYPTO_HASH_ALGID_SHA256,
#endif
} CRYPTO_HASH_ALGID;

#define MAX_DIGEST_LEN  64  /* max digest length for approved core hash fns */


/***************
 * error codes *
 ***************/

typedef enum {
    CRYPTO_HASH_OK,
    CRYPTO_HASH_FAIL,
    CRYPTO_HASH_BAD_PARAMETER,
    CRYPTO_HASH_OVERFLOW,
    CRYPTO_HASH_BAD_ALG = 32,
    CRYPTO_HASH_OUT_OF_MEMORY
} CRYPTO_HASH_ERROR;


/*********
 * flags *
 *********/

#define HASH_DATA_ONLY      0
#define HASH_INIT           (1 << 0)
#define HASH_FINISH         (1 << 1)
#define HASH_ZERO_PAD       (1 << 2)


#endif /* CRYPTO_HASH_BASICS_H */
