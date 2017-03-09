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
#include "brg_endian.h"

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


/* some sizes (number of bytes) */
#define ROWS 8
#define LENGTHFIELDLEN ROWS
#define COLS512 8
#define COLS1024 16

#define SIZE512 (ROWS*COLS512)
#define SIZE1024 (ROWS*COLS1024)

#define ROUNDS512 10
#define ROUNDS1024 14

#define ROTL32(v, n) ((((v)<<(n))|((v)>>(32-(n))))&li_32(ffffffff))

#if (PLATFORM_BYTE_ORDER == IS_BIG_ENDIAN)
#define EXT_BYTE(var,n) ((u8)((u32)(var) >> (8*(3-(n)))))
#define U32BIG(a) (a)
#endif /* IS_BIG_ENDIAN */

#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)
#define EXT_BYTE(var,n) ((u8)((u32)(var) >> (8*n)))
#define U32BIG(a)				\
  ((ROTL32(a,8) & li_32(00FF00FF)) |		\
   (ROTL32(a,24) & li_32(FF00FF00)))
#endif /* IS_LITTLE_ENDIAN */

typedef enum { LONG, SHORT } Var;


/* NIST API begin */
typedef unsigned char BitSequence;
typedef unsigned long long DataLength;
typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHLEN = 2 } HashReturn;
typedef struct {
  u32 *chaining;            /* actual state */
  u64 block_counter1;       /* message block counter(s) *///modified
  //u32 block_counter2;     /* message block counter(s) */
  int hashbitlen;           /* output length in bits */
  BitSequence *buffer;      /* data buffer */
  int buf_ptr;              /* data buffer pointer */
  int bits_in_last_byte;    /* no. of message bits in last byte of
			       data buffer */
  int columns;              /* no. of columns in state */
  int statesize;            /* total no. of bytes in state */
  Var v;                    /* LONG or SHORT */


//ADDED BY GURPREET 0ct25,2011
  
  int blocksize; /* size of msgblock (1024) */
  u64 cnt_block; /* block counter for XOR */
  BitSequence counter[SIZE1024]; /* block counter buffer */
  int cnt_buf_ptr; /* buffer pointer */
//----------

} hashState;

HashReturn Init(hashState*, int);
HashReturn Update(hashState*, const BitSequence*, DataLength);
HashReturn Final(hashState*, BitSequence*);
HashReturn Hash(int, const BitSequence*, DataLength, BitSequence*);
/* NIST API end   */

/* helper functions */
void PrintHash(const BitSequence*, int);
//Added by Gurpreet 
void PrintInit(hashState*, int);
//------------

#endif /* __mgroestl_h */
