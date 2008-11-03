#ifndef __hash_h
#define __hash_h

#include <stdlib.h>
#include "brg_endian.h"
#define NEED_UINT_64T
#include "brg_types.h"

/* some sizes (number of bytes) */
#define ROWS 8
#define LENGTHFIELDLEN ROWS
#define COLS 16
#define SIZE (ROWS*COLS)
#define ROUNDS 14

#define DIGESTSIZE 64

#define ROTL64(a,n) ((((a)<<(n))|((a)>>(64-(n))))&li_64(ffffffffffffffff))

#if (PLATFORM_BYTE_ORDER == IS_BIG_ENDIAN)
#define EXT_BYTE(var,n) ((u8)((u64)(var) >> (8*(7-(n)))))
#define U64BIG(a) (a)
#endif /* IS_BIG_ENDIAN */

#if (PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN)
#define EXT_BYTE(var,n) ((u8)((u64)(var) >> (8*n)))
#define U64BIG(a) \
  ((ROTL64(a, 8) & li_64(000000FF000000FF)) | \
   (ROTL64(a,24) & li_64(0000FF000000FF00)) | \
   (ROTL64(a,40) & li_64(00FF000000FF0000)) | \
   (ROTL64(a,56) & li_64(FF000000FF000000)))
#endif /* IS_LITTLE_ENDIAN */

typedef struct {
  u64 state[COLS];             /* actual state */
  u64 block_counter;           /* message block counter */
  unsigned char buffer[SIZE];  /* data buffer */
  int buf_ptr;                 /* data buffer pointer */
} context;

int Init(context*);
int Update(context*, const unsigned char*, int);
int Final(context*, unsigned char*);
int crypto_hash_groestl512_opt64(unsigned char*, 
				 const unsigned char*, 
				 unsigned long long);


#endif /* __hash_h */
