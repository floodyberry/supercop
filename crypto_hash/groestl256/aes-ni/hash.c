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
  #include "TF512-aes-ni.h"
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
    TF512AES((u64*)in);

  asm volatile ("emms");
}

/* initialise context */
int Init(context* ctx) {
  int i;

  ((u64*)TRANSP_MASK)[0] = 0x0d0509010c040800ULL;
  ((u64*)TRANSP_MASK)[1] = 0x0f070b030e060a02ULL;
  ((u64*)ALL_7F)[0] = 0x7f7f7f7f7f7f7f7fULL;
  ((u64*)ALL_7F)[1] = 0x7f7f7f7f7f7f7f7fULL;
  ((u64*)ALL_1B)[0] = 0x1b1b1b1b1b1b1b1bULL;
  ((u64*)ALL_1B)[1] = 0x1b1b1b1b1b1b1b1bULL;
  ((u64*)SUBSH_MASK)[0] =  0x0b0e0104070a0d00ULL;
  ((u64*)SUBSH_MASK)[1] =  0x0306090c0f020508ULL;
  ((u64*)SUBSH_MASK)[2] =  0x0c0f0205000b0e01ULL;
  ((u64*)SUBSH_MASK)[3] =  0x04070a0d08030609ULL;
  ((u64*)SUBSH_MASK)[4] =  0x0d080306010c0f02ULL;
  ((u64*)SUBSH_MASK)[5] =  0x05000b0e0904070aULL;
  ((u64*)SUBSH_MASK)[6] =  0x0e090407020d0803ULL;
  ((u64*)SUBSH_MASK)[7] =  0x06010c0f0a05000bULL;
  ((u64*)SUBSH_MASK)[8] =  0x0f0a0500030e0904ULL;
  ((u64*)SUBSH_MASK)[9] =  0x07020d080b06010cULL;
  ((u64*)SUBSH_MASK)[10] = 0x080b0601040f0a05ULL;
  ((u64*)SUBSH_MASK)[11] = 0x00030e090c07020dULL;
  ((u64*)SUBSH_MASK)[12] = 0x090c070205080b06ULL;
  ((u64*)SUBSH_MASK)[13] = 0x01040f0a0d00030eULL;
  ((u64*)SUBSH_MASK)[14] = 0x0a0d000306090c07ULL;
  ((u64*)SUBSH_MASK)[15] = 0x0205080b0e01040fULL;

  for(i = 0; i < 10; i++)
  {
    ((u64*)ROUND_P)[2*i+1] = 0x0000000000000000ULL;
    ((u64*)ROUND_P)[2*i+0] = (u64) i;
    ((u64*)ROUND_Q)[2*i+1] = 0x00000000000000ffULL ^ (u64) i;
    ((u64*)ROUND_Q)[2*i+0] = 0x0000000000000000ULL;
  }

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
  OF512AES();
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
