/*
 * api.h
 *
 * Header file for Artemia-128
 */


#ifndef API_H
#define API_H

#define CRYPTO_KEYBYTES     16  /* length of key in byte */
#define CRYPTO_NSECBYTES    0   /* length of secret message number in byte */
// In Artemia, public message is nonce
#define CRYPTO_NPUBBYTES    16   /* length of public message number in byte */
#define CRYPTO_ABYTES       44  /* Maximum difference between ciphertext length and plaintext lenght */
#define CRYPTO_NOOVERLAP    1   /* Implementation can not handle outputs that overlap inputs */

#endif // API_H
