/* MMX intrinsics implementation of Groestl-512
 *
 * Author: Soeren S. Thomsen
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <mmintrin.h>
#include "hash.h"
#include "tables.h"

/* compute one round of P1024 or Q1024 */
void ROUND(__m64 *m_in, __m64 *m, u8 r, u8 s) {
  __m64* T_m64 = (__m64*)T;
  __m64 tmp0;
  u32* x = (u32*)m_in;
  tmp0 = _mm_setzero_si64();
  m[ 0] = _mm_xor_si64(T_m64[0*256+((r)^EXT_BYTE(x[ 0],0))], tmp0);
  m[15] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[ 0],1) ], tmp0);
  m[14] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[ 0],2) ], tmp0);
  m[13] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[ 0],3) ], tmp0);
  m[12] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[ 1],0) ], tmp0);
  m[11] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[ 1],1) ], tmp0);
  m[10] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[ 1],2) ], tmp0);
  m[ 5] = _mm_xor_si64(T_m64[7*256+((s)^EXT_BYTE(x[ 1],3))], tmp0);

  m[15] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[30],0) ], m[15]);
  m[14] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[30],1) ], m[14]);
  m[13] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[30],2) ], m[13]);
  m[12] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[30],3) ], m[12]);
  m[11] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[31],0) ], m[11]);
  m[10] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[31],1) ], m[10]);
  m[ 9] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[31],2) ], tmp0);
  m[ 4] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[31],3) ], tmp0);

  m[14] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[28],0) ], m[14]);
  m[13] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[28],1) ], m[13]);
  m[12] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[28],2) ], m[12]);
  m[11] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[28],3) ], m[11]);
  m[10] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[29],0) ], m[10]);
  m[ 9] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[29],1) ], m[ 9]);
  m[ 8] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[29],2) ], tmp0);
  m[ 3] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[29],3) ], tmp0);

  m[13] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[26],0) ], m[13]);
  m[12] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[26],1) ], m[12]);
  m[11] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[26],2) ], m[11]);
  m[10] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[26],3) ], m[10]);
  m[ 9] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[27],0) ], m[ 9]);
  m[ 8] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[27],1) ], m[ 8]);
  m[ 7] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[27],2) ], tmp0);
  m[ 2] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[27],3) ], tmp0);

  m[12] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[24],0) ], m[12]);
  m[11] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[24],1) ], m[11]);
  m[10] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[24],2) ], m[10]);
  m[ 9] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[24],3) ], m[ 9]);
  m[ 8] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[25],0) ], m[ 8]);
  m[ 7] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[25],1) ], m[ 7]);
  m[ 6] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[25],2) ], tmp0);
  m[ 1] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[25],3) ], tmp0);

  m[11] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[22],0) ], m[11]);
  m[10] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[22],1) ], m[10]);
  m[ 9] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[22],2) ], m[ 9]);
  m[ 8] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[22],3) ], m[ 8]);
  m[ 7] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[23],0) ], m[ 7]);
  m[ 6] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[23],1) ], m[ 6]);
  m[ 5] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[23],2) ], m[ 5]);
  m[ 0] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[23],3) ], m[ 0]);

  m[10] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[20],0) ], m[10]);
  m[ 9] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[20],1) ], m[ 9]);
  m[ 8] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[20],2) ], m[ 8]);
  m[ 7] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[20],3) ], m[ 7]);
  m[ 6] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[21],0) ], m[ 6]);
  m[ 5] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[21],1) ], m[ 5]);
  m[ 4] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[21],2) ], m[ 4]);
  m[15] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[21],3) ], m[15]);

  m[ 9] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[18],0) ], m[ 9]);
  m[ 8] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[18],1) ], m[ 8]);
  m[ 7] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[18],2) ], m[ 7]);
  m[ 6] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[18],3) ], m[ 6]);
  m[ 5] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[19],0) ], m[ 5]);
  m[ 4] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[19],1) ], m[ 4]);
  m[ 3] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[19],2) ], m[ 3]);
  m[14] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[19],3) ], m[14]);

  m[ 8] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[16],0) ], m[ 8]);
  m[ 7] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[16],1) ], m[ 7]);
  m[ 6] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[16],2) ], m[ 6]);
  m[ 5] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[16],3) ], m[ 5]);
  m[ 4] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[17],0) ], m[ 4]);
  m[ 3] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[17],1) ], m[ 3]);
  m[ 2] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[17],2) ], m[ 2]);
  m[13] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[17],3) ], m[13]);

  m[ 7] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[14],0) ], m[ 7]);
  m[ 6] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[14],1) ], m[ 6]);
  m[ 5] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[14],2) ], m[ 5]);
  m[ 4] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[14],3) ], m[ 4]);
  m[ 3] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[15],0) ], m[ 3]);
  m[ 2] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[15],1) ], m[ 2]);
  m[ 1] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[15],2) ], m[ 1]);
  m[12] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[15],3) ], m[12]);

  m[ 6] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[12],0) ], m[ 6]);
  m[ 5] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[12],1) ], m[ 5]);
  m[ 4] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[12],2) ], m[ 4]);
  m[ 3] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[12],3) ], m[ 3]);
  m[ 2] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[13],0) ], m[ 2]);
  m[ 1] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[13],1) ], m[ 1]);
  m[ 0] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[13],2) ], m[ 0]);
  m[11] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[13],3) ], m[11]);

  m[ 5] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[10],0) ], m[ 5]);
  m[ 4] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[10],1) ], m[ 4]);
  m[ 3] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[10],2) ], m[ 3]);
  m[ 2] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[10],3) ], m[ 2]);
  m[ 1] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[11],0) ], m[ 1]);
  m[ 0] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[11],1) ], m[ 0]);
  m[15] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[11],2) ], m[15]);
  m[10] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[11],3) ], m[10]);

  m[ 4] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[ 8],0) ], m[ 4]);
  m[ 3] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[ 8],1) ], m[ 3]);
  m[ 2] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[ 8],2) ], m[ 2]);
  m[ 1] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[ 8],3) ], m[ 1]);
  m[ 0] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[ 9],0) ], m[ 0]);
  m[15] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[ 9],1) ], m[15]);
  m[14] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[ 9],2) ], m[14]);
  m[ 9] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[ 9],3) ], m[ 9]);

  m[ 3] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[ 6],0) ], m[ 3]);
  m[ 2] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[ 6],1) ], m[ 2]);
  m[ 1] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[ 6],2) ], m[ 1]);
  m[ 0] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[ 6],3) ], m[ 0]);
  m[15] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[ 7],0) ], m[15]);
  m[14] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[ 7],1) ], m[14]);
  m[13] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[ 7],2) ], m[13]);
  m[ 8] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[ 7],3) ], m[ 8]);

  m[ 2] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[ 4],0) ], m[ 2]);
  m[ 1] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[ 4],1) ], m[ 1]);
  m[ 0] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[ 4],2) ], m[ 0]);
  m[15] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[ 4],3) ], m[15]);
  m[14] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[ 5],0) ], m[14]);
  m[13] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[ 5],1) ], m[13]);
  m[12] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[ 5],2) ], m[12]);
  m[ 7] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[ 5],3) ], m[ 7]);

  m[ 1] = _mm_xor_si64(T_m64[0*256+     EXT_BYTE(x[ 2],0) ], m[ 1]);
  m[ 0] = _mm_xor_si64(T_m64[1*256+     EXT_BYTE(x[ 2],1) ], m[ 0]);
  m[15] = _mm_xor_si64(T_m64[2*256+     EXT_BYTE(x[ 2],2) ], m[15]);
  m[14] = _mm_xor_si64(T_m64[3*256+     EXT_BYTE(x[ 2],3) ], m[14]);
  m[13] = _mm_xor_si64(T_m64[4*256+     EXT_BYTE(x[ 3],0) ], m[13]);
  m[12] = _mm_xor_si64(T_m64[5*256+     EXT_BYTE(x[ 3],1) ], m[12]);
  m[11] = _mm_xor_si64(T_m64[6*256+     EXT_BYTE(x[ 3],2) ], m[11]);
  m[ 6] = _mm_xor_si64(T_m64[7*256+     EXT_BYTE(x[ 3],3) ], m[ 6]);
} 

/* digest part of a message in long variants */
int Transform(context *ctx, 
	      const unsigned char *msg, 
	      unsigned long long msglen) {
  int i;
  __m64 m64_m[COLS], *m64_h, m64_hm[COLS], tmp[COLS];
  u32 *msg_32;

  while (msglen >= SIZE) {
    msg_32 = (u32*)msg;
    m64_h = (__m64*)ctx->state;

    for (i = 0; i < COLS; i++) {
      m64_m[i]  = _mm_setr_pi32(msg_32[2*i],msg_32[2*i+1]);
      m64_hm[i] = _mm_xor_si64(m64_h[i], m64_m[i]);
    }

    ROUND(m64_hm, tmp, 0, 0);
    ROUND(tmp, m64_hm, 1, 0);
    ROUND(m64_hm, tmp, 2, 0);
    ROUND(tmp, m64_hm, 3, 0);
    ROUND(m64_hm, tmp, 4, 0);
    ROUND(tmp, m64_hm, 5, 0);
    ROUND(m64_hm, tmp, 6, 0);
    ROUND(tmp, m64_hm, 7, 0);
    ROUND(m64_hm, tmp, 8, 0);
    ROUND(tmp, m64_hm, 9, 0);
    ROUND(m64_hm, tmp,10, 0);
    ROUND(tmp, m64_hm,11, 0);
    ROUND(m64_hm, tmp,12, 0);
    ROUND(tmp, m64_hm,13, 0);

    ROUND(m64_m, tmp, 0, 0xff^0);
    ROUND(tmp, m64_m, 0, 0xff^1);
    ROUND(m64_m, tmp, 0, 0xff^2);
    ROUND(tmp, m64_m, 0, 0xff^3);
    ROUND(m64_m, tmp, 0, 0xff^4);
    ROUND(tmp, m64_m, 0, 0xff^5);
    ROUND(m64_m, tmp, 0, 0xff^6);
    ROUND(tmp, m64_m, 0, 0xff^7);
    ROUND(m64_m, tmp, 0, 0xff^8);
    ROUND(tmp, m64_m, 0, 0xff^9);
    ROUND(m64_m, tmp, 0, 0xff^10);
    ROUND(tmp, m64_m, 0, 0xff^11);
    ROUND(m64_m, tmp, 0, 0xff^12);
    ROUND(tmp, m64_m, 0, 0xff^13);

    for (i = 0; i < COLS; i++) {
      m64_h[i] = _mm_xor_si64(m64_h[i], m64_m [i]);
      m64_h[i] = _mm_xor_si64(m64_h[i], m64_hm[i]);
    }

    _mm_empty();

    ctx->block_counter++;

    msg += SIZE;
    msglen -= SIZE;
  }

  return 0;
}

/* apply the output transformation */
void OutputTransformation(context *ctx) {
  int i;
  __m64 *m64_h, tmp1[COLS], tmp2[COLS];
  m64_h = (__m64*)ctx->state;

  for (i = 0; i < COLS; i++) {
    tmp1[i] = m64_h[i];
  }

  ROUND(tmp1, tmp2, 0, 0);
  ROUND(tmp2, tmp1, 1, 0);
  ROUND(tmp1, tmp2, 2, 0);
  ROUND(tmp2, tmp1, 3, 0);
  ROUND(tmp1, tmp2, 4, 0);
  ROUND(tmp2, tmp1, 5, 0);
  ROUND(tmp1, tmp2, 6, 0);
  ROUND(tmp2, tmp1, 7, 0);
  ROUND(tmp1, tmp2, 8, 0);
  ROUND(tmp2, tmp1, 9, 0);
  ROUND(tmp1, tmp2,10, 0);
  ROUND(tmp2, tmp1,11, 0);
  ROUND(tmp1, tmp2,12, 0);
  ROUND(tmp2, tmp1,13, 0);

  for (i = 0; i < COLS; i++) {
    m64_h[i] = _mm_xor_si64(m64_h[i], tmp1[i]);
  }

  _mm_empty();
}

/* initialise context */
int Init(context* ctx) {
  int i;

  /* set initial value */
  for (i = 0; i < 2*COLS-1; i++) ctx->state[i] = 0;
  ctx->state[2*COLS-1] = U32BIG((u32)8*DIGESTSIZE);

  /* set other variables */
  ctx->buf_ptr = 0;
  ctx->block_counter = 0;

  return 0;
}

/* update state with databitlen bits of input */
int Update(context* ctx,
	   const unsigned char* input,
	   unsigned long long len) {
  unsigned long long index = 0;

  /* if the buffer contains data that has not yet been digested, first
     add data to buffer until full */
  if (ctx->buf_ptr) {
    while (ctx->buf_ptr < SIZE && index < len) {
      ctx->buffer[(int)ctx->buf_ptr++] = input[index++];
    }
    if (ctx->buf_ptr < SIZE) {
      return 0;
    }

    /* digest buffer */
    ctx->buf_ptr = 0;
    Transform(ctx, ctx->buffer, SIZE);
  }

  /* digest bulk of message */
  Transform(ctx, input+index, len-index);
  index += ((len-index)/SIZE)*SIZE;

  /* store remaining data in buffer */
  while (index < len) {
    ctx->buffer[(int)ctx->buf_ptr++] = input[index++];
  }

  return 0;
}

/* finalise: process remaining data (including padding), perform
   output transformation, and write hash result to 'out' */
int Final(context* ctx,
	  unsigned char* out) {
  int i, j = 0;
  unsigned char *s = (unsigned char*)ctx->state;

  /* pad with '1'-bit and first few '0'-bits */
  ctx->buffer[(int)ctx->buf_ptr++] = 0x80;

  /* pad with '0'-bits */
  if (ctx->buf_ptr > SIZE-LENGTHFIELDLEN) {
    /* padding requires two blocks */
    while (ctx->buf_ptr < SIZE) {
      ctx->buffer[(int)ctx->buf_ptr++] = 0;
    }
    /* digest first padding block */
    Transform(ctx, ctx->buffer, SIZE);
    ctx->buf_ptr = 0;
  }
  while (ctx->buf_ptr < SIZE-LENGTHFIELDLEN) {
    ctx->buffer[(int)ctx->buf_ptr++] = 0;
  }

  /* length padding */
  ctx->block_counter++;
  ctx->buf_ptr = SIZE;
  while (ctx->buf_ptr > SIZE-LENGTHFIELDLEN) {
    ctx->buffer[(int)--ctx->buf_ptr] = (unsigned char)ctx->block_counter;
    ctx->block_counter >>= 8;
  }

  /* digest final padding block */
  Transform(ctx, ctx->buffer, SIZE);
  /* perform output transformation */
  OutputTransformation(ctx);

  /* store hash result in out */
  for (i = SIZE-DIGESTSIZE; i < SIZE; i++,j++) {
    out[j] = s[i];
  }

  /* zeroise relevant variables and deallocate memory */
  for (i = 0; i < 2*COLS; i++) {
    ctx->state[i] = 0;
  }
  for (i = 0; i < SIZE; i++) {
    ctx->buffer[i] = 0;
  }

  return 0;
}

/* hash 'in' (of 'len' bytes) and store message digest in 'out' */
int Hash(unsigned char* out, 
	 const unsigned char* in, 
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
