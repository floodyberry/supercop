#include "crypto_sign.h"

#define PRIME_BYTES 20
#define NID NID_secp160r1
#define PRIME_FIELD

#define SECRETKEY_BYTES (PRIME_BYTES * 3)
#define PUBLICKEY_BYTES (PRIME_BYTES * 2)
#define SHORTHASH_BYTES 64
#define SIGNATURE_BYTES (PRIME_BYTES * 2)
