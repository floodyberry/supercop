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
#define EES787EP1
#define EBATS

#if defined(EES251EP6)              /* parameter set EES251EP6 */

#define PRIVATEKEY_BYTES      48
#define PUBLICKEY_BYTES      251
#define SHORTPLAINTEXT_BYTES 20

#elif defined(EES251EP7)            /* parameter set EES251EP7 */

#define PRIVATEKEY_BYTES      24
#define PUBLICKEY_BYTES      502
#define SHORTPLAINTEXT_BYTES 20

#elif defined(EES347EP2)            /* parameter set EES347EP2 */

#define PRIVATEKEY_BYTES     132
#define PUBLICKEY_BYTES      694
#define SHORTPLAINTEXT_BYTES 28

#elif defined(EES347EP3)            /* parameter set EES347EP3 */

#define PRIVATEKEY_BYTES      66
#define PUBLICKEY_BYTES      694
#define SHORTPLAINTEXT_BYTES 28

#elif defined(EES397EP1)            /* parameter set EES397EP1 */

#define PRIVATEKEY_BYTES     148
#define PUBLICKEY_BYTES      794
#define SHORTPLAINTEXT_BYTES 32

#elif defined(EES397EP2)            /* parameter set EES397EP2 */

#define PRIVATEKEY_BYTES      72
#define PUBLICKEY_BYTES      794
#define SHORTPLAINTEXT_BYTES 32

#elif defined(EES491EP1)            /* parameter set EES491EP1 */

#define PRIVATEKEY_BYTES     182
#define PUBLICKEY_BYTES      982
#define SHORTPLAINTEXT_BYTES 40

#elif defined(EES491EP2)            /* parameter set EES491EP2 */

#define PRIVATEKEY_BYTES      90
#define PUBLICKEY_BYTES      982
#define SHORTPLAINTEXT_BYTES 40

#elif defined(EES587EP1)            /* parameter set EES587EP1 */

#define PRIVATEKEY_BYTES     216
#define PUBLICKEY_BYTES     1174
#define SHORTPLAINTEXT_BYTES 48

#elif defined(EES587EP2)            /* parameter set EES587EP2 */

#define PRIVATEKEY_BYTES     102
#define PUBLICKEY_BYTES     1174
#define SHORTPLAINTEXT_BYTES 48

#elif defined(EES787EP1)            /* parameter set EES787EP1 */

#define PRIVATEKEY_BYTES     280
#define PUBLICKEY_BYTES     1574
#define SHORTPLAINTEXT_BYTES 65

#elif defined(EES787EP2)            /* parameter set EES787EP2 */

#define PRIVATEKEY_BYTES     132
#define PUBLICKEY_BYTES     1574
#define SHORTPLAINTEXT_BYTES 65

#endif

/* for all parameter sets */

#define SECRETKEY_BYTES     PRIVATEKEY_BYTES + PUBLICKEY_BYTES
#define ENCRYPTION_BYTES    PUBLICKEY_BYTES

#endif /* SIZES_H */
