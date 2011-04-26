/* hash.c     January 2011
 *
 * Groestl-512 implementation with inline assembly containing mmx and
 * sse instructions. Optimized for Opteron.
 * Authors: Krystian Matusiewicz and Soeren S. Thomsen
 *
 * This code is placed in the public domain
 */

#include "hash.h"
#include "tables.h"

#include "PQASM.h"

/* digest up to len bytes of input (full blocks only) */
void Transform(context *ctx, 
	       const unsigned char *in, 
	       unsigned long long len) {
  u64 y[COLS+2] __attribute__ ((aligned (16)));
  u64 z[COLS+2] __attribute__ ((aligned (16)));
  u64 *m, *h = (u64*)ctx->state;
  int i;
  
  /* increment block counter */
  ctx->block_counter += len/SIZE;
  
  asm volatile ("emms");
  /* digest message, one block at a time */
  for (; len >= SIZE; len -= SIZE, in += SIZE) {
    m = (u64*)in;
    for (i = 0; i < COLS; i++) {
      y[i] = m[i];
      z[i] = m[i] ^ h[i];
    }

    Q1024ASM(y);
    P1024ASM(z);

    /* h' == h + Q(m) + P(h+m) */
    for (i = 0; i < COLS; i++) {
      h[i] ^= z[i] ^ y[i];
    }
  }
  asm volatile ("emms");
}

/* given state h, do h <- P(h)+h */
void OutputTransformation(context *ctx) {
  u64 z[COLS] __attribute__ ((aligned (16)));
  int j;

  for (j = 0; j < COLS; j++) {
    z[j] = ctx->state[j];
  }
  asm volatile ("emms");
  P1024ASM(z);
  asm volatile ("emms");
  for (j = 0; j < COLS; j++) {
    ctx->state[j] ^= z[j];
  }
}

/* initialise context */
int Init(context* ctx) {
  int i;

  /* set initial value */
  for (i = 0; i < COLS-1; i++) ctx->state[i] = 0;
  ctx->state[COLS-1] = U64BIG((u64)(8*DIGESTSIZE));

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
      ctx->buffer[(int)ctx->buf_ptr++] = in[index++];
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
    ctx->buffer[(int)ctx->buf_ptr++] = in[index++];
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

int crypto_hash(unsigned char *out,
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
