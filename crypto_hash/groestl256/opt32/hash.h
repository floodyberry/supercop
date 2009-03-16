#ifndef __hash_h
#define __hash_h

#include <stdio.h>
#include <stdlib.h>
#include "brg_endian.h"
#include <crypto_uint8.h>
#include <crypto_uint32.h>
#include <crypto_uint64.h>

typedef crypto_uint8 u8;
typedef crypto_uint32 u32;
typedef crypto_uint64 u64;

/* some sizes (number of bytes) */
#define ROWS 8
#define LENGTHFIELDLEN ROWS
#define COLS 8
#define SIZE (ROWS*COLS)
#define DIGESTSIZE 32

#define ROUNDS 10

#define ROTL32(v, n) ((((v)<<(n))|((v)>>(32-(n))))&0xffffffff)

#if (PLATFORM_BYTE_ORDER == IS_BIG_ENDIAN)
#define EXT_BYTE(var,n) ((u8)((u32)(var) >> (8*(3-(n)))))
#define U32BIG(a) (a)
#endif /* IS_BIG_ENDIAN */

#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)
#define EXT_BYTE(var,n) ((u8)((u32)(var) >> (8*n)))
#define U32BIG(a)				\
  ((ROTL32(a,8) & 0x00ff00ff) |			\
   (ROTL32(a,24) & 0xff00ff00))
#endif /* IS_LITTLE_ENDIAN */

typedef struct {
  u32 state[2*COLS];           /* actual state */
  u64 block_counter;           /* message block counter */
  unsigned char buffer[SIZE];  /* data buffer */
  int buf_ptr;                 /* data buffer pointer */
} context;

#endif /* __hash_h */
