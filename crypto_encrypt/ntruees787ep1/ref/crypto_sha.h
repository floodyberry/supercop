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
 * File: crypto_sha.h
 *
 * Contents: Definitions and declarations common to all SHA hash algorithms.
 *
 *****************************************************************************/

#ifndef CRYPTO_SHA_H
#define CRYPTO_SHA_H


#include "crypto_error.h"
#include "crypto_hash_basics.h"


/***************
 * error codes *
 ***************/

#define SHA_OK              CRYPTO_HASH_OK
#define SHA_FAIL            CRYPTO_HASH_FAIL
#define SHA_BAD_PARAMETER   CRYPTO_HASH_BAD_PARAMETER
#define SHA_OVERFLOW        CRYPTO_HASH_OVERFLOW

#define SHA_RET(r)      return ((r) ? SHA_ERROR_BASE + (r) : (r));


/*********
 * flags *
 *********/

#define SHA_DATA_ONLY       HASH_DATA_ONLY
#define SHA_INIT            HASH_INIT
#define SHA_FINISH          HASH_FINISH
#define SHA_ZERO_PAD        HASH_ZERO_PAD


#endif /* CRYPTO_SHA_H */


