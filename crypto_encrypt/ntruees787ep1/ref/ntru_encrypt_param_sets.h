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
 * File: ntru_encrypt_param_sets.h
 *
 * Contents: Definitions and declarations for the NTRUEncrypt parameter sets.
 *
 *****************************************************************************/

#ifndef NTRU_ENCRYPT_PARAM_SETS_H
#define NTRU_ENCRYPT_PARAM_SETS_H

#include "crypto_platform.h"
#include "crypto_hash_basics.h"
#include "sizes.h"


/* choose which parameter sets to build if not running eBATS */

#if !defined(EBATS)
#define EES251EP6
//#define EES251EP7
#define EES347EP2
#define EES347EP3
#define EES397EP1
#define EES397EP2
#define EES491EP1
#define EES491EP2
#define EES587EP1
#define EES587EP2
#define EES787EP1
#define EES787EP2
#endif /* !EBATS */


/* parameter set ID list */

typedef enum {
#if defined(EES251EP6)
    NTRU_EES251EP6,
#endif
#if defined(EES251EP7)
    NTRU_EES251EP7,
#endif
#if defined(EES347EP2)
    NTRU_EES347EP2,
#endif
#if defined(EES347EP3)
    NTRU_EES347EP3,
#endif
#if defined(EES397EP1)
    NTRU_EES397EP1,
#endif
#if defined(EES397EP2)
    NTRU_EES397EP2,
#endif
#if defined(EES491EP1)
    NTRU_EES491EP1,
#endif
#if defined(EES491EP2)
    NTRU_EES491EP2,
#endif
#if defined(EES587EP1)
    NTRU_EES587EP1,
#endif
#if defined(EES587EP1)
    NTRU_EES587EP2,
#endif
#if defined(EES787EP1)
    NTRU_EES787EP1,
#endif
#if defined(EES787EP2)
    NTRU_EES787EP2
#endif
} NTRU_ENCRYPT_PARAM_SET_ID;


/**************
 * STRUCTURES *
 **************/

typedef struct {
    NTRU_ENCRYPT_PARAM_SET_ID   param_set_id; /* parameter set ID */
    boolean                     binary;       /* binary form = 1,
                                                 product form = 0 */
    uint16_t                    N;            /* ring dimension */
    uint8_t                     nLen;         /* no. of octets in N */
    uint8_t                     cM_mask;      /* 0xff >> (8 - (N & 0x7)) */
    uint16_t                    q;            /* big modulus */
    uint16_t                    FLen;         /* no. of nonzero coefficients */
    uint16_t                    gLen;         /* no. of nonzero coefficients */
    uint16_t                    bLen;         /* no. of octets in b */
    uint16_t                    rLen;         /* no. of nonzero coefficients */
    CRYPTO_HASH_ALGID           hash_id;      /* hash algorithm ID */
    uint16_t                    mask;         /* 2^(random polynomial generation
                                                    constant) - 1 */
    uint16_t                    limit;        /* limit for no bias in SEF */
    uint16_t                    min_outLen;   /* min. no. of octets output by
                                                 SEF */
    uint16_t                    min_msg_rep_wt;
                                              /* min. message representative
                                                 weight */
    uint8_t                     OID[3];       /* parameter set OID */
    uint8_t                     max_mLen;     /* max no. of plaintext octets */
} NTRU_ENCRYPT_PARAM_SET;


/*********************
 * MAX-LENGTH MACROS *
 *********************/

#if defined(EES251EP6)      /* EES251EP6 */

#if !defined(MAX_N)
#define MAX_N   251
#elif MAX_N < 251
#undef MAX_N
#define MAX_N   251
#endif

#if !defined(MAX_R)
#define MAX_R    48
#elif MAX_R < 48
#undef MAX_R
#define MAX_R    48
#endif

#if !defined(MAX_F)
#define MAX_F    48
#elif MAX_F < 48
#undef MAX_F
#define MAX_F    48
#endif

#if !defined(MAX_G)
#define MAX_G   125
#elif MAX_G < 125
#undef MAX_G
#define MAX_G   125
#endif

#endif /* EES251EP6 */

#if defined(EES251EP7)      /* EES251EP7 */

#if !defined(MAX_N)
#define MAX_N   251
#elif MAX_N < 251
#undef MAX_N
#define MAX_N   251
#endif

#if !defined(MAX_R)
#define MAX_R    24
#elif MAX_R < 24
#undef MAX_R
#define MAX_R    24
#endif

#if !defined(MAX_F)
#define MAX_F    24
#elif MAX_F < 24
#undef MAX_F
#define MAX_F    24
#endif

#if !defined(MAX_G)
#define MAX_G   125
#elif MAX_G < 125
#undef MAX_G
#define MAX_G   125
#endif

#endif /* EES251EP7 */

#if defined(EES347EP2)      /* EES347EP2 */

#if !defined(MAX_N)
#define MAX_N   347
#elif MAX_N < 347
#undef MAX_N
#define MAX_N   347
#endif

#if !defined(MAX_R)
#define MAX_R    66
#elif MAX_R < 66
#undef MAX_R
#define MAX_R    66
#endif

#if !defined(MAX_F)
#define MAX_F    66
#elif MAX_F < 66
#undef MAX_F
#define MAX_F    66
#endif

#if !defined(MAX_G)
#define MAX_G   173
#elif MAX_G < 173
#undef MAX_G
#define MAX_G   173
#endif

#endif /* EES347EP2 */

#if defined(EES347EP3)      /* EES347EP3 */

#if !defined(MAX_N)
#define MAX_N   347
#elif MAX_N < 347
#undef MAX_N
#define MAX_N   347
#endif

#if !defined(MAX_R)
#define MAX_R    33
#elif MAX_R < 33
#undef MAX_R
#define MAX_R    33
#endif

#if !defined(MAX_F)
#define MAX_F    33
#elif MAX_F < 33
#undef MAX_F
#define MAX_F    33
#endif

#if !defined(MAX_G)
#define MAX_G   173
#elif MAX_G < 173
#undef MAX_G
#define MAX_G   173
#endif

#endif /* EES347EP3 */

#if defined(EES397EP1)      /* EES397EP1 */

#if !defined(MAX_N)
#define MAX_N   397
#elif MAX_N < 397
#undef MAX_N
#define MAX_N   397
#endif

#if !defined(MAX_R)
#define MAX_R    74
#elif MAX_R < 74
#undef MAX_R
#define MAX_R    74
#endif

#if !defined(MAX_F)
#define MAX_F    74
#elif MAX_F < 74
#undef MAX_F
#define MAX_F    74
#endif

#if !defined(MAX_G)
#define MAX_G   198
#elif MAX_G < 198
#undef MAX_G
#define MAX_G   198
#endif

#endif /* EES397EP1 */

#if defined(EES397EP2)      /* EES397EP2 */

#if !defined(MAX_N)
#define MAX_N   397
#elif MAX_N < 397
#undef MAX_N
#define MAX_N   397
#endif

#if !defined(MAX_R)
#define MAX_R    36
#elif MAX_R < 36
#undef MAX_R
#define MAX_R    36
#endif

#if !defined(MAX_F)
#define MAX_F    36
#elif MAX_F < 36
#undef MAX_F
#define MAX_F    36
#endif

#if !defined(MAX_G)
#define MAX_G   198
#elif MAX_G < 198
#undef MAX_G
#define MAX_G   198
#endif

#endif /* EES397EP2 */

#if defined(EES491EP1)      /* EES491EP1 */

#if !defined(MAX_N)
#define MAX_N   491
#elif MAX_N < 491
#undef MAX_N
#define MAX_N   491
#endif

#if !defined(MAX_R)
#define MAX_R    91
#elif MAX_R < 91
#undef MAX_R
#define MAX_R    91
#endif

#if !defined(MAX_F)
#define MAX_F    91
#elif MAX_F < 91
#undef MAX_F
#define MAX_F    91
#endif

#if !defined(MAX_G)
#define MAX_G   245
#elif MAX_G < 245
#undef MAX_G
#define MAX_G   245
#endif

#endif /* EES491EP1 */

#if defined(EES491EP2)      /* EES491EP2 */

#if !defined(MAX_N)
#define MAX_N   491
#elif MAX_N < 491
#undef MAX_N
#define MAX_N   491
#endif

#if !defined(MAX_R)
#define MAX_R    45
#elif MAX_R < 45
#undef MAX_R
#define MAX_R    45
#endif

#if !defined(MAX_F)
#define MAX_F    45
#elif MAX_F < 45
#undef MAX_F
#define MAX_F    45
#endif

#if !defined(MAX_G)
#define MAX_G   245
#elif MAX_G < 245
#undef MAX_G
#define MAX_G   245
#endif

#endif /* EES491EP2 */

#if defined(EES587EP1)      /* EES587EP1 */

#if !defined(MAX_N)
#define MAX_N   587
#elif MAX_N < 587
#undef MAX_N
#define MAX_N   587
#endif

#if !defined(MAX_R)
#define MAX_R    108
#elif MAX_R < 108
#undef MAX_R
#define MAX_R    108
#endif

#if !defined(MAX_F)
#define MAX_F   108
#elif MAX_F < 108
#undef MAX_F
#define MAX_F   108
#endif

#if !defined(MAX_G)
#define MAX_G   293
#elif MAX_G < 293
#undef MAX_G
#define MAX_G   293
#endif

#endif /* EES587EP1 */

#if defined(EES587EP2)      /* EES587EP2 */

#if !defined(MAX_N)
#define MAX_N   587
#elif MAX_N < 587
#undef MAX_N
#define MAX_N   587
#endif

#if !defined(MAX_R)
#define MAX_R    51
#elif MAX_R < 51
#undef MAX_R
#define MAX_R    51
#endif

#if !defined(MAX_F)
#define MAX_F    51
#elif MAX_F < 51
#undef MAX_F
#define MAX_F    51
#endif

#if !defined(MAX_G)
#define MAX_G   293
#elif MAX_G < 293
#undef MAX_G
#define MAX_G   293
#endif

#endif /* EES587EP2 */

#if defined(EES787EP1)      /* EES787EP1 */

#if !defined(MAX_N)
#define MAX_N   787
#elif MAX_N < 787
#undef MAX_N
#define MAX_N   787
#endif

#if !defined(MAX_R)
#define MAX_R    140
#elif MAX_R < 140
#undef MAX_R
#define MAX_R    140
#endif

#if !defined(MAX_F)
#define MAX_F   140
#elif MAX_F < 140
#undef MAX_F
#define MAX_F   140
#endif

#if !defined(MAX_G)
#define MAX_G   393
#elif MAX_G < 393
#undef MAX_G
#define MAX_G   393
#endif

#endif /* EES787EP1 */

#if defined(EES787EP2)      /* EES787EP2 */

#if !defined(MAX_N)
#define MAX_N   787
#elif MAX_N < 787
#undef MAX_N
#define MAX_N   787
#endif

#if !defined(MAX_R)
#define MAX_R    66
#elif MAX_R < 66
#undef MAX_R
#define MAX_R    66
#endif

#if !defined(MAX_F)
#define MAX_F    66
#elif MAX_F < 66
#undef MAX_F
#define MAX_F    66
#endif

#if !defined(MAX_G)
#define MAX_G   393
#elif MAX_G < 393
#undef MAX_G
#define MAX_G   393
#endif

#endif /* EES787EP2 */


/*************************
 * FUNCTION DECLARATIONS *
 *************************/

/* get_params
 *
 * Looks up a set of NTRU Encrypt parameters based on the parameter set.
 *
 * Returns a pointer to the parameter set parameters if successful.
 * Returns NULL if the parameter set cannot be found.
 */

extern NTRU_ENCRYPT_PARAM_SET *
get_params(
    NTRU_ENCRYPT_PARAM_SET_ID   param_set_id);


#endif /* NTRU_ENCRYPT_PARAM_SETS_H */


