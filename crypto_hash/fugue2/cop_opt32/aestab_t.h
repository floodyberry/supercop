#ifndef _AESTAB_T_H
#define _AESTAB_T_H

//#include "mytypes.h"

#include "crypto_uint32.h"
#include "crypto_uint8.h"
#include "crypto_uint64.h"

#include <stdio.h>
#include <limits.h>

#if defined(BYTE_ORDER) && defined(BIG_ENDIAN) && BYTE_ORDER == BIG_ENDIAN
#define HO2BE_8(_x)  (_x)
#define HO2BE_4(_x)  (_x)
#else
#define HO2BE_8(_x)  ((_x<<56)|((_x<<40)&0xff000000000000ull)|((_x<<24)&0xff0000000000ull)|((_x<<8)&0xff00000000ull)|\
                     ((_x>>8)&0xff000000ull)|((_x>>24)&0xff0000ull)|((_x>>40)&0xff00ull)|(_x>>56))
#define HO2BE_4(_x)  ((_x<<24)|((_x<<8)&0xff0000)|((_x>>8)&0xff00)|(_x>>24))
#endif

#endif
