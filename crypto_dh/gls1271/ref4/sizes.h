#ifndef HAVE_MAIN
#include "crypto_dh.h"
#endif
#define SECRETKEY_BYTES 32
#ifdef COMPRESSED
#define PUBLICKEY_BYTES 32
#else
#define PUBLICKEY_BYTES 64
#endif
#define SHAREDSECRET_BYTES 32
