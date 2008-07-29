#include "crypto_sign.h"

#define PRIME_BYTES 24
#define NID NID_X9_62_prime192v1
#define PRIME_FIELD

#define SECRETKEY_BYTES (PRIME_BYTES * 3)
#define PUBLICKEY_BYTES (PRIME_BYTES * 2)
#define SHORTHASH_BYTES 64
#define SIGNATURE_BYTES (PRIME_BYTES * 2)
