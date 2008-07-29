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
 * File: crypto_msbyte_uint32.c
 *
 * Contents: Routines to convert between an array of bytes in network byte
 *           order (most-significant byte first) and an array of uint32 words.
 *
 *****************************************************************************/


#include <stdlib.h>
#include "crypto_msbyte_uint32.h"


/* crypto_msbyte_2_uint32()
 *
 * This routine converts an array of bytes in network byte order to an array
 * of uint32_t, placing the first byte in the most significant byte of the
 * first uint32_t word.
 *
 * The number of bytes in the input stream MUST be at least 4 times the
 * number of words expected in the output array.
 */

void
crypto_msbyte_2_uint32(
    uint32_t       *words,      // out - pointer to the output uint32_t array
    uint8_t const  *bytes,      //  in - pointer to the input byte array
    uint32_t        n)          //  in - number of words in the output array
{
    uint32_t    i;

    for (i = 0; i < n; i++) {
        words[i]  = ((uint32_t) (*bytes++)) << 24;
        words[i] |= ((uint32_t) (*bytes++)) << 16;
        words[i] |= ((uint32_t) (*bytes++)) <<  8;
        words[i] |=  (uint32_t) (*bytes++);
    }
}


/* crypto_uint32_2_msbyte()
 *
 * This routine converts an array of uint32_t to an array of bytes in
 * network byte order, placing the most significant byte of the first uint32_t
 * word as the first byte of the output array.
 *
 * The number of bytes in the output stream will be 4 times the number of words
 * specified in the input array.
 */

void
crypto_uint32_2_msbyte(
    uint8_t        *bytes,      // out - pointer to the output byte array
    uint32_t const *words,      //  in - pointer to the input uint32_t array
    uint32_t        n)          //  in - number of words in the input array
{
    uint32_t i;

    for (i = 0; i < n; i++) {
        *bytes++ = (uint8_t) (words[i] >> 24);
        *bytes++ = (uint8_t) (words[i] >> 16);
        *bytes++ = (uint8_t) (words[i] >>  8);
        *bytes++ = (uint8_t) (words[i]      );
    }
}


