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
 * File: ntru_encrypt_param_sets.c
 *
 * Contents: Defines the NTRUEncrypt parameter sets.
 *
 *****************************************************************************/

#include <stdlib.h>
#include "ntru_encrypt_param_sets.h"
#include "crypto_hash_basics.h"


/******************
 * PARAMETER SETS *
 ******************/

static NTRU_ENCRYPT_PARAM_SET ntru_param_sets[] = {

#if defined(EES251EP6)
    {
        NTRU_EES251EP6,             /* param set ID */
        TRUE,                       /* binary form */
        251,                        /* N */
        32,                         /* nLen */
        0x07,                       /* cM_mask */
        197,                        /* q */
        48,                         /* dF */
        125,                        /* dg */
        10,                         /* bLen */
        48,                         /* dr */
        CRYPTO_HASH_ALGID_SHA1,     /* hash alg ID */
        0x00ff,                     /* 2^c - 1 */
        251,                        /* 2^c - (2^c mod N) */
        120,                        /* oLenMin */
        70,                         /* dm0 */
        {0x00, 0x01, 0x06},         /* OID */
        20                          /* max mLen */
    },

#endif /* EES251EP6 */

#if defined(EES251EP7)
    {
        NTRU_EES251EP7,             /* param set ID */
        FALSE,                      /* product form */
        251,                        /* N */
        32,                         /* nLen */
        0x07,                       /* cM_mask */
        293,                        /* q */
        8,                          /* df1, df2, df3 */
        125,                        /* dg */
        10,                         /* bLen */
        8,                          /* dr1, dr2, dr3 */
        CRYPTO_HASH_ALGID_SHA1,     /* hash alg ID */
        0x00ff,                     /* 2^c - 1 */
        251,                        /* 2^c - (2^c mod N) */
        60,                         /* oLenMin */
        70,                         /* dm0 */
        {0x00, 0x01, 0x07},         /* OID */
        20                          /* max mLen */
    },

#endif /* EES251EP7 */

#if defined(EES347EP2)
    {
        NTRU_EES347EP2,             /* param set ID */
        TRUE,                       /* binary form */
        347,                        /* N */
        44,                         /* nLen */
        0x07,                       /* cM_mask */
        269,                        /* q */
        66,                         /* dF */
        173,                        /* dg */
        14,                         /* bLen */
        66,                         /* dr */
        CRYPTO_HASH_ALGID_SHA1,     /* hash alg ID */
        0x3fff,                     /* 2^c - 1 */
        16309,                      /* 2^c - (2^c mod N) */
        300,                        /* oLenMin */
        108,                        /* dm0 */
        {0x00, 0x02, 0x02},         /* OID */
        28                          /* max mLen */
    },

#endif /* EES347EP2 */

#if defined(EES347EP3)
    {
        NTRU_EES347EP3,             /* param set ID */
        FALSE,                      /* product form */
        347,                        /* N */
        44,                         /* nLen */
        0x07,                       /* cM_mask */
        541,                        /* q */
        11,                         /* df1, df2, df3 */
        173,                        /* dg */
        14,                         /* bLen */
        11,                         /* dr1, dr2, dr3 */
        CRYPTO_HASH_ALGID_SHA1,     /* hash alg ID */
        0x3fff,                     /* 2^c - 1 */
        16309,                      /* 2^c - (2^c mod N) */
        80,                         /* oLenMin */
        108,                        /* dm0 */
        {0x00, 0x02, 0x03},         /* OID */
        28                          /* max mLen */
    },

#endif /* EES347EP3 */

#if defined(EES397EP1)
    {
        NTRU_EES397EP1,             /* param set ID */
        TRUE,                       /* binary form */
        397,                        /* N */
        50,                         /* nLen */
        0x1f,                       /* cM_mask */
        307,                        /* q */
        74,                         /* dF */
        198,                        /* dg */
        16,                         /* bLen */
        74,                         /* dr */
        CRYPTO_HASH_ALGID_SHA1,     /* hash alg ID */
        0xffff,                     /* 2^c - 1 */
        65505,                      /* 2^c - (2^c mod N) */
        340,                        /* oLenMin */
        128,                        /* dm0 */
        {0x00, 0x03, 0x01},         /* OID */
        32                          /* max mLen */
    },

#endif

#if defined(EES397EP2)
    {
        NTRU_EES397EP2,             /* param set ID */
        FALSE,                      /* product form */
        397,                        /* N */
        50,                         /* nLen */
        0x1f,                       /* cM_mask */
        659,                        /* q */
        12,                         /* df1, df2, df3 */
        198,                        /* dg */
        16,                         /* bLen */
        12,                         /* dr1, dr2, dr3 */
        CRYPTO_HASH_ALGID_SHA1,     /* hash alg ID */
        0xffff,                     /* 2^c - 1 */
        65505,                      /* 2^c - (2^c mod N) */
        100,                        /* oLenMin */
        128,                        /* dm0 */
        {0x00, 0x03, 0x02},         /* OID */
        32                          /* max mLen */
    },

#endif

#if defined(EES491EP1)
    {
        NTRU_EES491EP1,             /* param set ID */
        TRUE,                       /* binary form */
        491,                        /* N */
        62,                         /* nLen */
        0x07,                       /* cM_mask */
        367,                        /* q */
        91,                         /* dF */
        245,                        /* dg */
        20,                         /* bLen */
        91,                         /* dr */
        CRYPTO_HASH_ALGID_SHA256,   /* hash alg ID */
        0x01ff,                     /* 2^c - 1 */
        491,                        /* 2^c - (2^c mod N) */
        440,                        /* oLenMin */
        167,                        /* dm0 */
        {0x00, 0x04, 0x01},         /* OID */
        40                          /* max mLen */
    },

#endif

#if defined(EES491EP2)
    {
        NTRU_EES491EP2,             /* param set ID */
        FALSE,                      /* product form */
        491,                        /* N */
        62,                         /* nLen */
        0x07,                       /* cM_mask */
        967,                        /* q */
        15,                         /* df1, df2, df3 */
        245,                        /* dg */
        20,                         /* bLen */
        15,                         /* dr1, dr2, dr3 */
        CRYPTO_HASH_ALGID_SHA256,   /* hash alg ID */
        0x01ff,                     /* 2^c - 1 */
        491,                        /* 2^c - (2^c mod N) */
        120,                        /* oLenMin */
        167,                        /* dm0 */
        {0x00, 0x04, 0x02},         /* OID */
        40                          /* max mLen */
    },

#endif

#if defined(EES587EP1)
    {
        NTRU_EES587EP1,             /* param set ID */
        TRUE,                       /* binary form */
        587,                        /* N */
        74,                         /* nLen */
        0x07,                       /* cM_mask */
        439,                        /* q */
        108,                        /* dF */
        293,                        /* dg */
        24,                         /* bLen */
        108,                        /* dr */
        CRYPTO_HASH_ALGID_SHA256,   /* hash alg ID */
        0x07ff,                     /* 2^c - 1 */
        1761,                       /* 2^c - (2^c mod N) */
        640,                        /* oLenMin */
        208,                        /* dm0 */
        {0x00, 0x05, 0x01},         /* OID */
        48                          /* max mLen */
    },

#endif

#if defined(EES587EP2)
    {
        NTRU_EES587EP2,             /* param set ID */
        FALSE,                      /* product form */
        587,                        /* N */
        74,                         /* nLen */
        0x07,                       /* cM_mask */
        1229,                       /* q */
        17,                         /* df1, df2, df3 */
        293,                        /* dg */
        24,                         /* bLen */
        17,                         /* dr1, dr2, dr3 */
        CRYPTO_HASH_ALGID_SHA256,   /* hash alg ID */
        0x07ff,                     /* 2^c - 1 */
        1761,                       /* 2^c - (2^c mod N) */
        192,                        /* oLenMin */
        208,                        /* dm0 */
        {0x00, 0x05, 0x02},         /* OID */
        48                          /* max mLen */
    },

#endif

#if defined(EES787EP1)
    {
        NTRU_EES787EP1,             /* param set ID */
        TRUE,                       /* binary form */
        787,                        /* N */
        99,                         /* nLen */
        0x07,                       /* cM_mask */
        587,                        /* q */
        140,                        /* dF */
        393,                        /* dg */
        32,                         /* bLen */
        140,                        /* dr */
        CRYPTO_HASH_ALGID_SHA256,   /* hash alg ID */
        0x0fff,                     /* 2^c - 1 */
        3935,                       /* 2^c - (2^c mod N) */
        672,                        /* oLenMin */
        294,                        /* dm0 */
        {0x00, 0x06, 0x01},         /* OID */
        65                          /* max mLen */
    },

#endif

#if defined(EES787EP2)
    {
        NTRU_EES787EP2,             /* param set ID */
        FALSE,                      /* product form */
        787,                        /* N */
        99,                         /* nLen */
        0x07,                       /* cM_mask */
        2027,                       /* q */
        22,                         /* df1, df2, df3 */
        393,                        /* dg */
        32,                         /* bLen */
        22,                         /* dr1, dr2, dr3 */
        CRYPTO_HASH_ALGID_SHA256,   /* hash alg ID */
        0x0fff,                     /* 2^c - 1 */
        3935,                       /* 2^c - (2^c mod N) */
        192,                        /* oLenMin */
        294,                        /* dm0 */
        {0x00, 0x06, 0x02},         /* OID */
        65                          /* max mLen */
    },

#endif

};

static size_t  num_param_sets =
                sizeof(ntru_param_sets)/sizeof(NTRU_ENCRYPT_PARAM_SET);


/*************
 * FUNCTIONS *
 *************/

/* get_params
 *
 * Looks up a set of NTRU Encrypt parameters based on the parameter set.
 *
 * Returns a pointer to the parameter set parameters if successful.
 * Returns NULL if the parameter set cannot be found.
 */

NTRU_ENCRYPT_PARAM_SET *
get_params(
    NTRU_ENCRYPT_PARAM_SET_ID   param_set_id)
{
    size_t i;

    for (i = 0; i < num_param_sets; i++)
        if (ntru_param_sets[i].param_set_id == param_set_id)
            return &(ntru_param_sets[i]);
    return NULL;
}


