#include "crypto_sign.h"

#define MODULUS_BYTES crypto_sign_PUBLICKEYBYTES
#define SECRETKEY_BYTES crypto_sign_SECRETKEYBYTES
#define PUBLICKEY_BYTES crypto_sign_PUBLICKEYBYTES
#define SIGNATURE_BYTES crypto_sign_BYTES
#define SHORTMESSAGE_BYTES (crypto_sign_BYTES - 11)
