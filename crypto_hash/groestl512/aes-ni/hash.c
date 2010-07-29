/* hash.c     July 2010
 *
 * Groestl implementation with inline assembly containing sse and aes
 * instructions.
 * Author: Günther A. Roland
 * 
 * Based on the inline assembly version by:
 * Krystian Matusiewicz
 *
 * This code is placed in the public domain
 */

#include "crypto_hash.h"
#include "hash.h"

#ifdef __x86_64
  #include "TF1024-aes-ni.h"
#endif

/* digest up to len bytes of input (full blocks only) */
inline void Transform(context *ctx,
	       const unsigned char *in, 
	       unsigned long long len) {
  /* increment block counter */
  ctx->block_counter += len/SIZE;
  
  asm volatile ("emms");
  /* digest message, one block at a time */
  for (; len >= SIZE; len -= SIZE, in += SIZE)
    TF1024AES((u64*)in);

  asm volatile ("emms");
}

/* initialise context */
int Init(context* ctx) {
  int i;

  SET_CONSTANTS_1024();

  ctx->state = (u64*) GLOBAL_CV_PTR;

  /* set initial value */
  for (i = 0; i < COLS-1; i++) ctx->state[i] = 0;
  ctx->state[COLS-1] = U64BIG((u64)(8*DIGESTSIZE));

  INIT_CV();

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
  asm volatile ("emms");
  OF1024AES();
  asm volatile ("emms");

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
