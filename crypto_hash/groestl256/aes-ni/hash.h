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

#define ROTL64(a,n) ((((a)<<(n))|((a)>>(64-(n))))&((u64)0xffffffffffffffffULL))

#if (PLATFORM_BYTE_ORDER == IS_BIG_ENDIAN)
#error
#endif /* IS_BIG_ENDIAN */

#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)
#define EXT_BYTE(var,n) ((u8)((u64)(var) >> (8*n)))
#define U64BIG(a)				\
  ((ROTL64(a, 8) & ((u64)0x000000ff000000ffULL)) |	\
   (ROTL64(a,24) & ((u64)0x0000ff000000ff00ULL)) |	\
   (ROTL64(a,40) & ((u64)0x00ff000000ff0000ULL)) |	\
   (ROTL64(a,56) & ((u64)0xff000000ff000000ULL)))
#endif /* IS_LITTLE_ENDIAN */

/* global variables  */
__attribute__ ((aligned (16))) unsigned char GLOBAL_CV_PTR[4*16];
__attribute__ ((aligned (16))) unsigned char ROUND_P[10*16];
__attribute__ ((aligned (16))) unsigned char ROUND_Q[10*16];
__attribute__ ((aligned (16))) unsigned char TRANSP_MASK[16];
__attribute__ ((aligned (16))) unsigned char ALL_7F[16];
__attribute__ ((aligned (16))) unsigned char ALL_1B[16];
__attribute__ ((aligned (16))) unsigned char SUBSH_MASK[8*16];
__attribute__ ((aligned (16))) unsigned char TEMP[8*16];

typedef struct {
  u64 *state;                  /* actual state */
  u64 block_counter;           /* message block counter */
  unsigned char buffer[SIZE];  /* data buffer */
  int buf_ptr;                 /* data buffer pointer */
} context;

#endif /* __hash_h */
