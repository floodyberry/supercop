#ifndef APE_H
#define APE_H

#include "api.h"
#include "proest128.h"

#define APE_RBYTES (PROEST_STATEBYTES - CRYPTO_KEYBYTES) // = 16
#define APE_CBYTES CRYPTO_KEYBYTES

#endif
