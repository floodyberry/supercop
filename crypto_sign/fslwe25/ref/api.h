/*
 * api.h
 *
 * Define the sizes of public key, secret key and signature.
 *
 *  Created on: 11.10.2011
 *      Author: Wladimir Paulsen
 */

#ifndef API_H_
#define API_H_

#endif /* API_H_ */

/** Length of secret key */
#define CRYPTO_SECRETKEYBYTES (BYTES_PRIMENUMBER + BYTES_HASHFUNCTION + BYTES_SECRETKEY)
/** Length of public key */
#define CRYPTO_PUBLICKEYBYTES (BYTES_PRIMENUMBER + BYTES_HASHFUNCTION + BYTES_PUBLICKEY)
/** Length of message overhead with signature */
#define CRYPTO_BYTES (BYTES_SIGNATUR_E + BYTES_SIGNATUR_Z)
/** Define which version of implementation */
#define CRYPTO_VERSION "1.0"
