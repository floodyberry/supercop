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
 * File: crypto_platform.h
 *
 * Contents: Platform-specific basic definitions.
 *
 *****************************************************************************/

#ifndef CRYPTO_PLATFORM_H
#define CRYPTO_PLATFORM_H

/* The default implementation is to use stdint.h, a part of the C99 standard.
 * Systems that don't support this are handled on a case-by-case basis.
 */

#if defined(WIN32) || defined(WIN64)

#include <basetsd.h>
typedef unsigned char       uint8_t;
typedef unsigned short int  uint16_t;
typedef UINT32              uint32_t;
typedef UINT64              uint64_t;

typedef char                int8_t;
typedef short int           int16_t;
typedef INT32               int32_t;
typedef INT64               int64_t;

#else

#include <stdint.h>

#endif

typedef uint8_t boolean;

#ifndef TRUE
#define TRUE    1
#endif

#ifndef FALSE
#define FALSE   0
#endif


#endif /* CRYPTO_PLATFORM_H */
