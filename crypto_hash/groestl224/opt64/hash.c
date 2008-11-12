/* hash.c     November 2008
 * ANSI C code optimised for 64-bit machines
 * Authors: Soeren S. Thomsen
 *          Krystian Matusiewicz
 *
 * This code is placed in the public domain
 */

#include "hash.h"
#include "tables.h"

/* compute one new state column */
#define COLUMN(x,y,i,a,b,c,d,e,f,g,h,r,s)	\
  y[i] =					\
    T[(r)^EXT_BYTE(x[a],0)]^			\
    T[1*256+EXT_BYTE(x[b],1)]^			\
    T[2*256+EXT_BYTE(x[c],2)]^			\
    T[3*256+EXT_BYTE(x[d],3)]^			\
    T[4*256+EXT_BYTE(x[e],4)]^			\
    T[5*256+EXT_BYTE(x[f],5)]^			\
    T[6*256+EXT_BYTE(x[g],6)]^			\
    T[7*256+((s)^EXT_BYTE(x[h],7))]

/* compute a round in P or Q (short variants) */
#define RND(x,y,r,s) do {			\
    COLUMN(x,y,7,7,0,1,2,3,4,5,6,0,0);		\
    COLUMN(x,y,6,6,7,0,1,2,3,4,5,0,0);		\
    COLUMN(x,y,5,5,6,7,0,1,2,3,4,0,0);		\
    COLUMN(x,y,4,4,5,6,7,0,1,2,3,0,0);		\
    COLUMN(x,y,3,3,4,5,6,7,0,1,2,0,0);		\
    COLUMN(x,y,2,2,3,4,5,6,7,0,1,0,0);		\
    COLUMN(x,y,1,1,2,3,4,5,6,7,0,0,s);		\
    COLUMN(x,y,0,0,1,2,3,4,5,6,7,r,0);		\
  } while (0)

/* the compression function */
void F(u64 *h, const u64 *m) {
  u64 y[COLS];
  u64 z[COLS];
  u64 outQ[COLS];
  u64 inP[COLS];
  int i;
  
  for (i = 0; i < COLS; i++) {
    inP[i] = h[i] ^ m[i];
  }

  /* compute Q(m) */
  RND(m,y,0,0^0xff);
  RND(y,z,0,1^0xff);
  RND(z,y,0,2^0xff);
  RND(y,z,0,3^0xff);
  RND(z,y,0,4^0xff);
  RND(y,z,0,5^0xff);
  RND(z,y,0,6^0xff);
  RND(y,z,0,7^0xff);
  RND(z,y,0,8^0xff);
  RND(y,outQ,0,9^0xff);
	
  /* compute P(h+m) */
  RND(inP,z,0,0);
  RND(z,y,1,0);
  RND(y,z,2,0);
  RND(z,y,3,0);
  RND(y,z,4,0);
  RND(z,y,5,0);
  RND(y,z,6,0);
  RND(z,y,7,0);
  RND(y,z,8,0);
  RND(z,y,9,0);
	
  /* h' == h + Q(m) + P(h+m) */
  for (i = 0; i < COLS; i++) {
    h[i] ^= outQ[i] ^ y[i];
  }
}


/* digest up to len bytes of input (full blocks only) */
void Transform(context *ctx, 
	       const unsigned char *in, 
	       unsigned long long len) {
  /* increment block counter */
  ctx->block_counter += len/SIZE;
  
  /* digest message, one block at a time */
  for (; len >= SIZE; len -= SIZE, in += SIZE) {
    F(ctx->state, (u64*)in);
  }
}

/* given state h, do h <- P(h)+h */
void OutputTransformation(context *ctx) {
  int j;
  u64 temp[COLS];
  u64 y[COLS];
  u64 z[COLS];

  RND(ctx->state,y,0,0);
  RND(y,z,1,0);
  RND(z,y,2,0);
  RND(y,z,3,0);
  RND(z,y,4,0);
  RND(y,z,5,0);
  RND(z,y,6,0);
  RND(y,z,7,0);
  RND(z,y,8,0);
  RND(y,temp,9,0);
  for (j = 0; j < COLS; j++) {
    ctx->state[j] ^= temp[j];
  }
}

/* initialise context */
int Init(context* ctx) {
  int i;

  /* set initial value */
  for (i = 0; i < COLS-1; i++) ctx->state[i] = 0;
  ctx->state[COLS-1] = U64BIG((u64)8*DIGESTSIZE);

  /* set other variables */
  ctx->buf_ptr = 0;
  ctx->block_counter = 0;

  return 0;
}

/* update state with databitlen bits of input */
int Update(context* ctx,
	   const unsigned char* in,
	   unsigned long long len) {
  unsigned long long index = 0;

  /* if the buffer contains data that has not yet been digested, first
     add data to buffer until full */
  if (ctx->buf_ptr) {
    while (ctx->buf_ptr < SIZE && index < len) {
      ctx->buffer[ctx->buf_ptr++] = in[index++];
    }
    if (ctx->buf_ptr < SIZE) return 0;

    /* digest buffer */
    ctx->buf_ptr = 0;
    Transform(ctx, ctx->buffer, SIZE);
  }

  /* digest bulk of message */
  Transform(ctx, in+index, len-index);
  index += ((len-index)/SIZE)*SIZE;

  /* store remaining data in buffer */
  while (index < len) {
    ctx->buffer[ctx->buf_ptr++] = in[index++];
  }

  return 0;
}

/* finalise: process remaining data (including padding), perform
   output transformation, and write hash result to 'output' */
int Final(context* ctx,
	  unsigned char* out) {
  int i, j = 0;
  unsigned char *s = (unsigned char*)ctx->state;

  ctx->buffer[ctx->buf_ptr++] = 0x80;

  /* pad with '0'-bits */
  if (ctx->buf_ptr > SIZE-LENGTHFIELDLEN) {
    /* padding requires two blocks */
    while (ctx->buf_ptr < SIZE) {
      ctx->buffer[ctx->buf_ptr++] = 0;
    }
    /* digest first padding block */
    Transform(ctx, ctx->buffer, SIZE);
    ctx->buf_ptr = 0;
  }
  while (ctx->buf_ptr < SIZE-LENGTHFIELDLEN) {
    ctx->buffer[ctx->buf_ptr++] = 0;
  }

  /* length padding */
  ctx->block_counter++;
  ctx->buf_ptr = SIZE;
  while (ctx->buf_ptr > SIZE-LENGTHFIELDLEN) {
    ctx->buffer[--ctx->buf_ptr] = (unsigned char)ctx->block_counter;
    ctx->block_counter >>= 8;
  }

  /* digest final padding block */
  Transform(ctx, ctx->buffer, SIZE);
  /* perform output transformation */
  OutputTransformation(ctx);

  /* store hash result in output */
  for (i = SIZE-DIGESTSIZE; i < SIZE; i++,j++) {
    out[j] = s[i];
  }

  /* zeroise relevant variables and deallocate memory */
  for (i = 0; i < COLS; i++) {
    ctx->state[i] = 0;
  }
  for (i = 0; i < SIZE; i++) {
    ctx->buffer[i] = 0;
  }

  return 0;
}

/* hash bit sequence */
int Hash(unsigned char *out,
	 const unsigned char *in,
	 unsigned long long len) {
  int ret;
  context ctx;

  /* initialise */
  if ((ret = Init(&ctx)) < 0)
    return ret;

  /* process message */
  if ((ret = Update(&ctx, in, len)) < 0)
    return ret;

  /* finalise */
  ret = Final(&ctx, out);

  return ret;
}
