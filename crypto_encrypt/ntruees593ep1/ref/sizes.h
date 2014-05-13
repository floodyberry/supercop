/******************************************************************************
 *
 * File: sizes.h
 *
 * Contents: Macros for the eBATS submission.
 *
 *****************************************************************************/


#ifndef SIZES_H
#define SIZES_H
#include "crypto_encrypt.h"
#define EES593EP1
#define EBATS
#define SEED_LENGTH (36)

#if defined(EES401EP2)

#define SECRETKEY_BYTES 607
#define PUBLICKEY_BYTES 557
#define SHORTPLAINTEXT_BYTES 60
#define SEC_STRENGTH 112
#define ENCRYPTION_BYTES 552

#elif defined(EES439EP1)

#define SECRETKEY_BYTES 659
#define PUBLICKEY_BYTES 609
#define SHORTPLAINTEXT_BYTES 65
#define SEC_STRENGTH 128
#define ENCRYPTION_BYTES 604

#elif defined(EES593EP1)

#define SECRETKEY_BYTES 891
#define PUBLICKEY_BYTES 821
#define SHORTPLAINTEXT_BYTES 86
#define SEC_STRENGTH 192
#define ENCRYPTION_BYTES 816

#elif defined(EES743EP1)

#define SECRETKEY_BYTES 1120
#define PUBLICKEY_BYTES 1027
#define SHORTPLAINTEXT_BYTES 106
#define SEC_STRENGTH 256
#define ENCRYPTION_BYTES 1022
#endif

#endif 