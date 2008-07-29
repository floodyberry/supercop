#include "crypto_sign.h"

#define PRIME_BYTES 52
#define NID NID_sect409k1

#define SECRETKEY_BYTES (PRIME_BYTES * 3)
#define PUBLICKEY_BYTES (PRIME_BYTES * 2)
#define SHORTHASH_BYTES 64
#define SIGNATURE_BYTES (PRIME_BYTES * 2)
