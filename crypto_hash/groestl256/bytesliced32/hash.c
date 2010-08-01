/* hash.c     July 2010
 *
 * Groestl implementation for 32-bit machines with
 * many general purpose registers.
 * Author: Günther A. Roland
 *
 * Based on the 32-bit optimized version by:
 * Soeren S. Thomsen
 *
 * This code is placed in the public domain
 */

#include "crypto_hash.h"
#include "hash.h"

/* S-box */
u8 S_LUT[256] = {
  0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5,
  0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
  0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0,
  0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
  0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc,
  0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
  0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a,
  0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
  0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0,
  0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
  0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b,
  0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
  0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85,
  0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
  0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5,
  0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
  0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17,
  0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
  0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88,
  0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
  0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c,
  0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
  0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9,
  0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
  0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6,
  0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
  0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e,
  0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
  0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94,
  0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
  0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68,
  0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16
};

#define AddConst(x, p, i) do {\
  x[p] = x[p] ^ i;\
} while (0)

#define Mul2(x)\
  x = ((x & 0x7f7f7f7f) << 1) ^ (((x & 0x80808080) >> 7) * 0x1b);

#define SubShiftMix(x) do {\
  u32 col, row;\
	u32 mb1[8], mb2[8], mb4[8];\
	state_union temp1;\
	row_union temp2;\
	for (col = 0; col < 2*COLS; col++) {\
		temp1.s32[col] = x[col];\
	}\
	for (col = 0; col < COLS; col++) {\
		for (row = 0; row < ROWS; row++) {\
			/* ShfitBytes + SubBytes */\
		  temp2.s8[row][col] = S_LUT[temp1.s8[(col+row)%8][row]];\
		}\
	}\
	/* MixBytes part: (8-bit AVR optimized version)*/\
	for (col = 0; col < 2; col++) {\
    mb1[0] = temp2.sRows[2][col] ^ temp2.sRows[5][col];\
    mb1[1] = temp2.sRows[0][col] ^ temp2.sRows[3][col];\
    mb1[2] = temp2.sRows[4][col] ^ temp2.sRows[6][col];\
    mb1[3] = temp2.sRows[1][col] ^ temp2.sRows[7][col];\
    mb1[6] = mb1[0] ^ mb1[1] ^ temp2.sRows[4][col];\
    mb1[1] ^= temp2.sRows[6][col];\
    mb1[4] = mb1[1] ^ temp2.sRows[1][col] ^ temp2.sRows[2][col];\
    mb1[1] ^= temp2.sRows[5][col] ^ temp2.sRows[7][col];\
    mb1[5] = mb1[3] ^ temp2.sRows[2][col] ^ temp2.sRows[3][col] ^ temp2.sRows[4][col];\
    mb1[7] = mb1[2] ^ temp2.sRows[1][col] ^ temp2.sRows[3][col] ^ temp2.sRows[5][col];\
    mb1[0] ^= mb1[2] ^ temp2.sRows[7][col];\
    mb1[3] ^= temp2.sRows[0][col];\
    mb1[2] ^= mb1[3];\
    mb1[3] ^= temp2.sRows[2][col] ^ temp2.sRows[5][col];\
    \
		temp2.sRows[0][col] = Mul2(temp2.sRows[0][col]);\
		temp2.sRows[1][col] = Mul2(temp2.sRows[1][col]);\
		temp2.sRows[2][col] = Mul2(temp2.sRows[2][col]);\
		temp2.sRows[3][col] = Mul2(temp2.sRows[3][col]);\
		temp2.sRows[4][col] = Mul2(temp2.sRows[4][col]);\
		temp2.sRows[5][col] = Mul2(temp2.sRows[5][col]);\
		temp2.sRows[6][col] = Mul2(temp2.sRows[6][col]);\
		temp2.sRows[7][col] = Mul2(temp2.sRows[7][col]);\
		\
    mb2[5] = temp2.sRows[2][col] ^ temp2.sRows[5][col];\
    mb2[6] = temp2.sRows[0][col] ^ temp2.sRows[3][col];\
    mb2[7] = temp2.sRows[4][col] ^ temp2.sRows[6][col];\
    mb2[0] = temp2.sRows[1][col] ^ temp2.sRows[7][col];\
    mb2[3] = mb2[5] ^ mb2[6] ^ temp2.sRows[4][col] ^ mb1[3];\
    mb2[6] ^= temp2.sRows[6][col];\
    mb2[1] = mb2[6] ^ temp2.sRows[1][col] ^ temp2.sRows[2][col] ^ mb1[1];\
    mb2[6] ^= temp2.sRows[5][col] ^ temp2.sRows[7][col] ^ mb1[6];\
    mb2[2] = mb2[0] ^ temp2.sRows[2][col] ^ temp2.sRows[3][col] ^ temp2.sRows[4][col] ^ mb1[2];\
    mb2[4] = mb2[7] ^ temp2.sRows[1][col] ^ temp2.sRows[3][col] ^ temp2.sRows[5][col] ^ mb1[4];\
    mb2[5] ^= mb2[7] ^ temp2.sRows[7][col] ^ mb1[5];\
    mb2[0] ^= temp2.sRows[0][col];\
    mb2[7] ^= mb2[0] ^ mb1[7];\
    mb2[0] ^= temp2.sRows[2][col] ^ temp2.sRows[5][col] ^ mb1[0];\
    \
		temp2.sRows[0][col] = Mul2(temp2.sRows[0][col]);\
		temp2.sRows[1][col] = Mul2(temp2.sRows[1][col]);\
		temp2.sRows[2][col] = Mul2(temp2.sRows[2][col]);\
		temp2.sRows[3][col] = Mul2(temp2.sRows[3][col]);\
		temp2.sRows[4][col] = Mul2(temp2.sRows[4][col]);\
		temp2.sRows[5][col] = Mul2(temp2.sRows[5][col]);\
		temp2.sRows[6][col] = Mul2(temp2.sRows[6][col]);\
		temp2.sRows[7][col] = Mul2(temp2.sRows[7][col]);\
		\
		mb4[0] = temp2.sRows[4][col] ^ temp2.sRows[7][col];\
		mb4[1] = temp2.sRows[3][col] ^ temp2.sRows[6][col];\
		mb4[2] = temp2.sRows[0][col] ^ temp2.sRows[5][col];\
		mb4[3] = temp2.sRows[1][col] ^ temp2.sRows[6][col];\
		mb4[4] = temp2.sRows[2][col] ^ temp2.sRows[7][col];\
		mb4[5] = temp2.sRows[0][col] ^ temp2.sRows[3][col];\
		mb4[6] = temp2.sRows[1][col] ^ temp2.sRows[4][col];\
		mb4[7] = temp2.sRows[2][col] ^ temp2.sRows[5][col];\
		\
		temp2.sRows[0][col] = mb2[0] ^ mb4[0] ^ mb4[1];\
		temp2.sRows[1][col] = mb2[1] ^ mb4[0] ^ mb4[2];\
		temp2.sRows[2][col] = mb2[2] ^ mb4[2] ^ mb4[3];\
		temp2.sRows[3][col] = mb2[3] ^ mb4[3] ^ mb4[4];\
		temp2.sRows[4][col] = mb2[4] ^ mb4[4] ^ mb4[5];\
		temp2.sRows[5][col] = mb2[5] ^ mb4[5] ^ mb4[6];\
		temp2.sRows[6][col] = mb2[6] ^ mb4[6] ^ mb4[7];\
		temp2.sRows[7][col] = mb2[7] ^ mb4[7] ^ mb4[1];\
	}\
	\
	for (col = 0; col < COLS; col++) {\
		for (row = 0; row < ROWS; row++) {\
		  temp1.s8[col][row] = temp2.s8[row][col];\
		}\
	}\
	for (col = 0; col < 2*COLS; col++) {\
		x[col] = temp1.s32[col];\
	}\
} while (0)

#define RNDP(x, r) do {			\
	  AddConst(x, 0, r);\
	  SubShiftMix(x);\
} while (0)

#define RNDQ(x, s) do {			\
	  AddConst(x, 1, s);\
	  SubShiftMix(x);\
} while (0)

/* the compression function */
void F(u32 *h, const u32 *m) {
  u32 x[2*COLS];
  u32 y[2*COLS];
  u32 z[2*COLS];
  int i;

  /* y <- h + m */
  for (i = 0; i < 2*COLS; i++) {
    y[i] = h[i] ^ m[i];
    x[i] = m[i];
  }

  /* z <- Q(m) */
  RNDQ(x,0xff000000);
  RNDQ(x,0xfe000000);
  RNDQ(x,0xfd000000);
  RNDQ(x,0xfc000000);
  RNDQ(x,0xfb000000);
  RNDQ(x,0xfa000000);
  RNDQ(x,0xf9000000);
  RNDQ(x,0xf8000000);
  RNDQ(x,0xf7000000);
  RNDQ(x,0xf6000000);

  /* y <- P(h+m) */
  RNDP(y,0x00000000);
  RNDP(y,0x00000001);
  RNDP(y,0x00000002);
  RNDP(y,0x00000003);
  RNDP(y,0x00000004);
  RNDP(y,0x00000005);
  RNDP(y,0x00000006);
  RNDP(y,0x00000007);
  RNDP(y,0x00000008);
  RNDP(y,0x00000009);
	
  /* h <- h + Q(m) + P(h+m) */
  for (i = 0; i < 2*COLS; i++) {
    h[i] ^= y[i] ^ x[i];
  }
}

/* digest up to len bytes of input (full blocks only) */
void Transform(context *ctx, 
	       const unsigned char *in, 
	       u32 len) {
  /* increment block counter */
  ctx->block_counter += len/SIZE;
  
  /* digest message, one block at a time */
  for (; len >= SIZE; len -= SIZE, in += SIZE) {
    F(ctx->state, (u32*)in);
  }
}

/* given state h, do h <- P(h)+h */
void OutputTransformation(context *ctx) {
  int j;
  u32 y[2*COLS];
  u32 z[2*COLS];

  for (j = 0; j < 2*COLS; j++) {
    y[j] = ctx->state[j];
  }

  RNDP(y,0x00000000);
  RNDP(y,0x00000001);
  RNDP(y,0x00000002);
  RNDP(y,0x00000003);
  RNDP(y,0x00000004);
  RNDP(y,0x00000005);
  RNDP(y,0x00000006);
  RNDP(y,0x00000007);
  RNDP(y,0x00000008);
  RNDP(y,0x00000009);

  for (j = 0; j < 2*COLS; j++) {
    ctx->state[j] ^= y[j];
  }
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
	   const unsigned char* in,
	   u32 len) {
  u32 index = 0;

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
int crypto_hash(unsigned char *out,
		const unsigned char *in,
		u32 len) {
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
