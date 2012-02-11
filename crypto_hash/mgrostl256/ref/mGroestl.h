/* mGroestl.h     
 * ANSI C code optimised for 32-bit machines
 * Authors: Soeren S. Thomsen
 *          Krystian Matusiewicz
 *
 * Modified Grostle Author: Gurpreet Kaur
 *							October 2011
 */

#ifndef __mgroestl_h
#define __mgroestl_h

#include <stdio.h>
#include <stdlib.h>
#define NEED_UINT_64T


/* eBash API begin */
#include "crypto_hash.h"
#ifdef crypto_hash_BYTES
#include <crypto_uint8.h>
#include <crypto_uint32.h>
#include <crypto_uint64.h>
typedef crypto_uint8 u8;
typedef crypto_uint32 u32;
typedef crypto_uint64 u64;
#endif
/* eBash API end */

#ifndef crypto_hash_BYTES
#include "brg_types.h"
#endif


#define ROWS 8
#define LENGTHFIELDLEN ROWS
#define COLS512 8
#define COLS1024 16
#define SIZE512 (ROWS*COLS512)
#define SIZE1024 (ROWS*COLS1024)
#define ROUNDS512 10
#define ROUNDS1024 14

typedef enum { P512 = 0, Q512 = 1, P1024 = 2, Q1024 = 3 } Variant;

#define mul1(b) ((u8)(b))
#define mul2(b) ((u8)((b)>>7?((b)<<1)^0x1b:((b)<<1)))
#define mul3(b) (mul2(b)^mul1(b))
#define mul4(b) mul2(mul2(b))
#define mul5(b) (mul4(b)^mul1(b))
#define mul6(b) (mul4(b)^mul2(b))
#define mul7(b) (mul4(b)^mul2(b)^mul1(b))


/* NIST API begin */
typedef unsigned char BitSequence;
typedef unsigned long long DataLength;
typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHLEN = 2 } HashReturn;
typedef struct {
  u8 chaining[ROWS][COLS1024]; /* the actual state */
  u64 block_counter; /* block counter for padding*/ 
  int hashbitlen; /* output length */
  BitSequence buffer[SIZE1024]; /* block buffer */
  int buf_ptr; /* buffer pointer */
  int bits_in_last_byte; /* number of bits in incomplete byte */
  int columns; /* number of columns in state */
  int rounds; /* number of rounds in P and Q */
  int statesize; /* size of state (ROWS*columns) */

//ADDED BY GURPREET 0ct10,2011
  
  int blocksize; /* size of msgblock (1024) */
  u64 cnt_block; /* block counter for XOR */
  BitSequence counter[SIZE1024]; /* block counter buffer */
  int cnt_buf_ptr; /* buffer pointer */
//----------
} hashState;

HashReturn Hash(int, const BitSequence*, DataLength, BitSequence*);
HashReturn Init(hashState*, int);
HashReturn Update(hashState*, const BitSequence*, DataLength);
HashReturn Final(hashState*, BitSequence*);
/* NIST API end */

/* helper functions */
void PrintHash(BitSequence*, int);
//Added by Gurpreet 
void PrintInit(hashState*, int);
//----------
#endif /* __groestl_ref_h */
