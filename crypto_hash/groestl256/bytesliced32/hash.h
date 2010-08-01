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

typedef union {
	u32 s32[2*COLS];
	u8 s8[COLS][ROWS];
} state_union;

typedef union {
	u32 sRows[ROWS][2];
	u8 s8[ROWS][COLS];
} row_union;

/* for debug output: */
#define PrintState(x) do {\
  u32 col, row;\
	state_union temp1;\
	row_union temp2;\
	printf("X:\n");\
	for (row = 0; row < 16; row++) {\
      printf("%08x\n", x[row]);\
	}\
	printf("State:\n");\
	for (col = 0; col < 2*COLS; col++) {\
		temp1.s32[col] = x[col];\
	}\
	for (row = 0; row < ROWS; row++) {\
		for (col = 0; col < COLS; col++) {\
      printf("%02x ", temp1.s8[col][row]);\
      temp2.s8[row][col] = temp1.s8[col][row];\
		}\
		printf("\n");\
	}\
	printf("Rows:\n");\
	for (row = 0; row < ROWS; row++) {\
      printf("%08x %08x\n", temp2.sRows[row][1], temp2.sRows[row][0]);\
	}\
	printf("\n\n");\
} while (0)

#endif /* __hash_h */
