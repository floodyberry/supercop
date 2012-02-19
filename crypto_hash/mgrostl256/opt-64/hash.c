/*
 * hash.h
 *
 *  Created on: 14.02.2012
 * ANSI C code optimised for 64-bit machines
 *
 * Modified Grostle Author: Gurpreet Kaur
 *							Feb 2012
 * 		Grostle Authors: Soeren S. Thomsen
 *          	Krystian Matusiewicz
 */
 
#include <stdlib.h>
#include "mGroestl.h"
#include "tables.h"
#include <string.h>


void PrintState1(u64 y[COLS512]) {
  int i;
  for (i = 0; i < COLS512; i++) printf("%016llx\n", U64BIG(y[i]));
  printf("\n");
}
void PrintState2(u64 y[COLS1024]) {
  int i;
  for (i = 0; i < COLS1024; i++) printf("%016llx\n", U64BIG(y[i]));
  printf("\n");
}

/* compute one new state column */
#define COLUMN(x,y,i,c0,c1,c2,c3,c4,c5,c6,c7)			\
  y[i] = T[0*256+EXT_BYTE(x[c0],0)]				\
    ^ T[1*256+EXT_BYTE(x[c1],1)]				\
    ^ T[2*256+EXT_BYTE(x[c2],2)]				\
    ^ T[3*256+EXT_BYTE(x[c3],3)]				\
    ^ T[4*256+EXT_BYTE(x[c4],4)]				\
    ^ T[5*256+EXT_BYTE(x[c5],5)]				\
    ^ T[6*256+EXT_BYTE(x[c6],6)]				\
    ^ T[7*256+EXT_BYTE(x[c7],7)]

/* compute a round in P (short variants) */
#define RND512P(x,y,r) do {						\
    x[0] ^= U64BIG(0x0000000000000000ull)^r;				\
    x[1] ^= U64BIG(0x1000000000000000ull)^r;				\
    x[2] ^= U64BIG(0x2000000000000000ull)^r;				\
    x[3] ^= U64BIG(0x3000000000000000ull)^r;				\
    x[4] ^= U64BIG(0x4000000000000000ull)^r;				\
    x[5] ^= U64BIG(0x5000000000000000ull)^r;				\
    x[6] ^= U64BIG(0x6000000000000000ull)^r;				\
    x[7] ^= U64BIG(0x7000000000000000ull)^r;				\
    COLUMN(x,y,0,0,1,2,3,4,5,6,7);					\
    COLUMN(x,y,1,1,2,3,4,5,6,7,0);					\
    COLUMN(x,y,2,2,3,4,5,6,7,0,1);					\
    COLUMN(x,y,3,3,4,5,6,7,0,1,2);					\
    COLUMN(x,y,4,4,5,6,7,0,1,2,3);					\
    COLUMN(x,y,5,5,6,7,0,1,2,3,4);					\
    COLUMN(x,y,6,6,7,0,1,2,3,4,5);					\
    COLUMN(x,y,7,7,0,1,2,3,4,5,6);					\
  } while (0)

/* compute a round in Q (short variants) */
#define RND512Q(x,y,r) do {					\
    x[0] ^= U64BIG(0xffffffffffffffffull)^r;			\
    x[1] ^= U64BIG(0xffffffffffffffefull)^r;			\
    x[2] ^= U64BIG(0xffffffffffffffdfull)^r;			\
    x[3] ^= U64BIG(0xffffffffffffffcfull)^r;			\
    x[4] ^= U64BIG(0xffffffffffffffbfull)^r;			\
    x[5] ^= U64BIG(0xffffffffffffffafull)^r;			\
    x[6] ^= U64BIG(0xffffffffffffff9full)^r;			\
    x[7] ^= U64BIG(0xffffffffffffff8full)^r;			\
    COLUMN(x,y,0,1,3,5,7,0,2,4,6);				\
    COLUMN(x,y,1,2,4,6,0,1,3,5,7);				\
    COLUMN(x,y,2,3,5,7,1,2,4,6,0);				\
    COLUMN(x,y,3,4,6,0,2,3,5,7,1);				\
    COLUMN(x,y,4,5,7,1,3,4,6,0,2);				\
    COLUMN(x,y,5,6,0,2,4,5,7,1,3);				\
    COLUMN(x,y,6,7,1,3,5,6,0,2,4);				\
    COLUMN(x,y,7,0,2,4,6,7,1,3,5);				\
  } while (0)


/* compute a round in P (long variants) */
#define RND1024P(x,y,r) do {			\
    x[ 0] ^= U64BIG(0x0000000000000000ull)^r;	\
    x[ 1] ^= U64BIG(0x1000000000000000ull)^r;	\
    x[ 2] ^= U64BIG(0x2000000000000000ull)^r;	\
    x[ 3] ^= U64BIG(0x3000000000000000ull)^r;	\
    x[ 4] ^= U64BIG(0x4000000000000000ull)^r;	\
    x[ 5] ^= U64BIG(0x5000000000000000ull)^r;	\
    x[ 6] ^= U64BIG(0x6000000000000000ull)^r;	\
    x[ 7] ^= U64BIG(0x7000000000000000ull)^r;	\
    x[ 8] ^= U64BIG(0x8000000000000000ull)^r;	\
    x[ 9] ^= U64BIG(0x9000000000000000ull)^r;	\
    x[10] ^= U64BIG(0xa000000000000000ull)^r;	\
    x[11] ^= U64BIG(0xb000000000000000ull)^r;	\
    x[12] ^= U64BIG(0xc000000000000000ull)^r;	\
    x[13] ^= U64BIG(0xd000000000000000ull)^r;	\
    x[14] ^= U64BIG(0xe000000000000000ull)^r;	\
    x[15] ^= U64BIG(0xf000000000000000ull)^r;	\
    COLUMN(x,y,15,15, 0, 1, 2, 3, 4, 5,10);	\
    COLUMN(x,y,14,14,15, 0, 1, 2, 3, 4, 9);	\
    COLUMN(x,y,13,13,14,15, 0, 1, 2, 3, 8);	\
    COLUMN(x,y,12,12,13,14,15, 0, 1, 2, 7);	\
    COLUMN(x,y,11,11,12,13,14,15, 0, 1, 6);	\
    COLUMN(x,y,10,10,11,12,13,14,15, 0, 5);	\
    COLUMN(x,y, 9, 9,10,11,12,13,14,15, 4);	\
    COLUMN(x,y, 8, 8, 9,10,11,12,13,14, 3);	\
    COLUMN(x,y, 7, 7, 8, 9,10,11,12,13, 2);	\
    COLUMN(x,y, 6, 6, 7, 8, 9,10,11,12, 1);	\
    COLUMN(x,y, 5, 5, 6, 7, 8, 9,10,11, 0);	\
    COLUMN(x,y, 4, 4, 5, 6, 7, 8, 9,10,15);	\
    COLUMN(x,y, 3, 3, 4, 5, 6, 7, 8, 9,14);	\
    COLUMN(x,y, 2, 2, 3, 4, 5, 6, 7, 8,13);	\
    COLUMN(x,y, 1, 1, 2, 3, 4, 5, 6, 7,12);	\
    COLUMN(x,y, 0, 0, 1, 2, 3, 4, 5, 6,11);	\
} while (0)

/* compute a round in Q (long variants) */
#define RND1024Q(x,y,r) do {					\
    x[ 0] ^= U64BIG(0xffffffffffffffffull)^r;			\
    x[ 1] ^= U64BIG(0xffffffffffffffefull)^r;			\
    x[ 2] ^= U64BIG(0xffffffffffffffdfull)^r;			\
    x[ 3] ^= U64BIG(0xffffffffffffffcfull)^r;			\
    x[ 4] ^= U64BIG(0xffffffffffffffbfull)^r;			\
    x[ 5] ^= U64BIG(0xffffffffffffffafull)^r;			\
    x[ 6] ^= U64BIG(0xffffffffffffff9full)^r;			\
    x[ 7] ^= U64BIG(0xffffffffffffff8full)^r;			\
    x[ 8] ^= U64BIG(0xffffffffffffff7full)^r;			\
    x[ 9] ^= U64BIG(0xffffffffffffff6full)^r;			\
    x[10] ^= U64BIG(0xffffffffffffff5full)^r;			\
    x[11] ^= U64BIG(0xffffffffffffff4full)^r;			\
    x[12] ^= U64BIG(0xffffffffffffff3full)^r;			\
    x[13] ^= U64BIG(0xffffffffffffff2full)^r;			\
    x[14] ^= U64BIG(0xffffffffffffff1full)^r;			\
    x[15] ^= U64BIG(0xffffffffffffff0full)^r;			\
    COLUMN(x,y,15, 0, 2, 4,10,15, 1, 3, 5);			\
    COLUMN(x,y,14,15, 1, 3, 9,14, 0, 2, 4);			\
    COLUMN(x,y,13,14, 0, 2, 8,13,15, 1, 3);			\
    COLUMN(x,y,12,13,15, 1, 7,12,14, 0, 2);			\
    COLUMN(x,y,11,12,14, 0, 6,11,13,15, 1);			\
    COLUMN(x,y,10,11,13,15, 5,10,12,14, 0);			\
    COLUMN(x,y, 9,10,12,14, 4, 9,11,13,15);			\
    COLUMN(x,y, 8, 9,11,13, 3, 8,10,12,14);			\
    COLUMN(x,y, 7, 8,10,12, 2, 7, 9,11,13);			\
    COLUMN(x,y, 6, 7, 9,11, 1, 6, 8,10,12);			\
    COLUMN(x,y, 5, 6, 8,10, 0, 5, 7, 9,11);			\
    COLUMN(x,y, 4, 5, 7, 9,15, 4, 6, 8,10);			\
    COLUMN(x,y, 3, 4, 6, 8,14, 3, 5, 7, 9);			\
    COLUMN(x,y, 2, 3, 5, 7,13, 2, 4, 6, 8);			\
    COLUMN(x,y, 1, 2, 4, 6,12, 1, 3, 5, 7);			\
    COLUMN(x,y, 0, 1, 3, 5,11, 0, 2, 4, 6);			\
} while (0)

/* the compression function (short variants) */
inline void F512(u64 *h, const u64 *m, u64 *c) {		//modified

  u64 y[COLS512] __attribute__((aligned(16)));
  u64 z[COLS512] __attribute__((aligned(16)));
  u64 outQ[COLS512] __attribute__((aligned(16)));
  u64 inP[COLS512] __attribute__((aligned(16)));
  int i,j=0;

//ADDED By Gurpreet
  u64 ml[COLS512] __attribute__((aligned(16)));		//msg_left
  u64 mr[COLS512] __attribute__((aligned(16)));		//msg_right


j=0;
/*divide msg into two 512 blocks*/
      for (i = 0; i < COLS1024; i++) {		//modified
	if(i<COLS512){
    		ml[i] = m[i];
		}
	else {
		mr[j] = m[i];
		j++;
	     }
      }
//---------------
  /* compute c+ml 
             h+mr */
  for (i = 0; i < COLS512; i++) {
    inP[i] = c[i] ^ ml[i];
    z[i] = h[i]^mr[i];
  }

  /* compute Q(h+mr) */
  RND512Q(z,y,U64BIG(0x0000000000000000ull));
  RND512Q(y,z,U64BIG(0x0000000000000001ull));
  RND512Q(z,y,U64BIG(0x0000000000000002ull));
  RND512Q(y,z,U64BIG(0x0000000000000003ull));
  RND512Q(z,y,U64BIG(0x0000000000000004ull));
  RND512Q(y,z,U64BIG(0x0000000000000005ull));
  RND512Q(z,y,U64BIG(0x0000000000000006ull));
  RND512Q(y,z,U64BIG(0x0000000000000007ull));
  RND512Q(z,y,U64BIG(0x0000000000000008ull));
  RND512Q(y,outQ,U64BIG(0x0000000000000009ull));
	
  /* compute P(c+ml) */
  RND512P(inP,y,U64BIG(0x0000000000000000ull));
  RND512P(y,z,  U64BIG(0x0100000000000000ull));
  RND512P(z,y,  U64BIG(0x0200000000000000ull));
  RND512P(y,z,  U64BIG(0x0300000000000000ull));
  RND512P(z,y,  U64BIG(0x0400000000000000ull));
  RND512P(y,z,  U64BIG(0x0500000000000000ull));
  RND512P(z,y,  U64BIG(0x0600000000000000ull));
  RND512P(y,z,  U64BIG(0x0700000000000000ull));
  RND512P(z,y,  U64BIG(0x0800000000000000ull));
  RND512P(y,inP,  U64BIG(0x0900000000000000ull));
	
//ADDED by GURPREET 
  /* compute P(c+ml) + Q(h+mr) */
  for (i = 0; i < COLS512; i++) {
    inP[i] = inP[i]^outQ[i];
  }

  /* compute P(P(h+ml) + Q(h+mr)) */
  RND512P(inP,z,U64BIG(0x0000000000000000ull));
  RND512P(z,y,  U64BIG(0x0100000000000000ull));
  RND512P(y,z,  U64BIG(0x0200000000000000ull));
  RND512P(z,y,  U64BIG(0x0300000000000000ull));
  RND512P(y,z,  U64BIG(0x0400000000000000ull));
  RND512P(z,y,  U64BIG(0x0500000000000000ull));
  RND512P(y,z,  U64BIG(0x0600000000000000ull));
  RND512P(z,y,  U64BIG(0x0700000000000000ull));
  RND512P(y,z,  U64BIG(0x0800000000000000ull));
  RND512P(z,inP,  U64BIG(0x0900000000000000ull));

  /* compute P(P(h+ml) + Q(h+mr)) + Q(h+mr) + h */
#pragma vector aligned
  for (i = 0; i < COLS512; i++) {
    h[i] ^= inP[i] ^ outQ[i];
  }
}


/* the compression function (long variants) */
inline void F1024(u64 *h, const u64 *m) {
  static u64 y[COLS1024] __attribute__((aligned(16)));
  static u64 z[COLS1024] __attribute__((aligned(16)));
  static u64 outQ[COLS1024] __attribute__((aligned(16)));
  static u64 inP[COLS1024] __attribute__((aligned(16)));
  int i;

  for (i = 0; i < COLS1024; i++) {
    z[i] = m[i];
    inP[i] = h[i] ^ m[i];
  }

  /* compute Q(m) */
  RND1024Q(z,y,0);
  for (i = 1; i < ROUNDS1024-1; i += 2) {
    RND1024Q(y,z,U64BIG((u64)i));
    RND1024Q(z,y,U64BIG((u64)(i+1)));
  }
  RND1024Q(y,outQ,U64BIG((u64)(ROUNDS1024-1)));
	
  /* compute P(h+m) */
  RND1024P(inP,z,0);
  for (i = 1; i < ROUNDS1024-1; i += 2) {
    RND1024P(z,y,U64BIG(((u64)i)<<56));
    RND1024P(y,z,U64BIG(((u64)(i+1))<<56));
  }
  RND1024P(z,y,U64BIG(((u64)(ROUNDS1024-1))<<56));
	
  /* h' == h + Q(m) + P(h+m) */
#pragma vector aligned
  for (i = 0; i < COLS1024; i++) {
    h[i] ^= outQ[i] ^ y[i];
  }
}


//-------------------------------------------------
/* 	Transform:
	digest up to msglen bytes of input (full blocks only) */
//-------------------------------------------------
/* digest up to msglen bytes of input (full blocks only) */
void Transform(hashState *ctx, 
	       const u8 *input, 
	       int msglen) {



//ADDED BY GURPREET 

  ctx->cnt_buf_ptr = ctx->statesize;

  /*for block counter*/
  while (ctx->cnt_buf_ptr > 0) {
    ctx->counter[--ctx->cnt_buf_ptr] = (u8)ctx->cnt_block;
    ctx->cnt_block >>= 8;
  }

  ctx->cnt_buf_ptr = ctx->statesize;
//-------

  /* determine variant, SHORT or LONG, and select underlying
     compression function based on the variant */
  if (ctx->size == SHORT) {
    /* increment block counter */
    //ctx->block_counter += msglen/SIZE1024;	//modified
    while (msglen >= SIZE1024) {
      F512(ctx->chaining,(u64*)input, (u64*)ctx->counter);	//modified

//ADDSED bY GURPREET-- Feb14,2012
    ctx->block_counter++;
//----------
    //if (ctx->block_counter1 == 0) ctx->block_counter2++;


//ADDED BY GURPREET 
    //reset to last position
    ctx->cnt_buf_ptr = ctx->statesize;
    //set to same as block counter
    ctx->cnt_block=ctx->block_counter+1;

    /*for counter*/
   while (ctx->cnt_buf_ptr > 0) {
     ctx->counter[--ctx->cnt_buf_ptr] = (u8)ctx->cnt_block;
     ctx->cnt_block >>= 8;
   }
//----

      msglen -= SIZE1024;
      input += SIZE1024;

    }
  }
/*  else {
    // increment block counter 
    ctx->block_counter += msglen/SIZE1024;
    while (msglen >= SIZE1024) {
      F1024(ctx->chaining,(u64*)input);
      msglen -= SIZE1024;
      input += SIZE1024;
    }
  }*/

}

//-------------------------------------------------
/* 	OutputTransformation:
	given state h, do h <- P(h)+h */
//-------------------------------------------------

/* given state h, do h <- P(h)+h */
void OutputTransformation(hashState *ctx) {
  int j;
  u64 temp[COLS1024];
  u64 y[COLS1024];
  u64 z[COLS1024];

  /* determine variant */
  switch (ctx->size) {
  case SHORT :
    for (j = 0; j < COLS512; j++) {
      temp[j] = ctx->chaining[j];
    }
    RND512P(temp,z,U64BIG(0x0000000000000000ull));
    RND512P(z,y,U64BIG(0x0100000000000000ull));
    RND512P(y,z,U64BIG(0x0200000000000000ull));
    RND512P(z,y,U64BIG(0x0300000000000000ull));
    RND512P(y,z,U64BIG(0x0400000000000000ull));
    RND512P(z,y,U64BIG(0x0500000000000000ull));
    RND512P(y,z,U64BIG(0x0600000000000000ull));
    RND512P(z,y,U64BIG(0x0700000000000000ull));
    RND512P(y,z,U64BIG(0x0800000000000000ull));
    RND512P(z,temp,U64BIG(0x0900000000000000ull));
    for (j = 0; j < COLS512; j++) {
      ctx->chaining[j] ^= temp[j];
    }
    break;
  case LONG  :
    for (j = 0; j < COLS1024; j++) {
      temp[j] = ctx->chaining[j];
    }
    RND1024P(temp,y,0);
    for (j = 1; j < ROUNDS1024-1; j += 2) {
      RND1024P(y,z,U64BIG(((u64)j)<<56));
      RND1024P(z,y,U64BIG(((u64)j+1)<<56));
    }
    RND1024P(y,temp,U64BIG(((u64)(ROUNDS1024-1))<<56));
    for (j = 0; j < COLS1024; j++) {
      ctx->chaining[j] ^= temp[j];
    }
    break;
  }
}

//-------------------------------------------------
/* 	INITIALISE
	initialise context */
//-------------------------------------------------
/* initialise context */
HashReturn Init(hashState* ctx,
		int hashbitlen) {
  /* output size (in bits) must be a positive integer less than or
     equal to 512, and divisible by 8 */
  if (hashbitlen <= 0 || (hashbitlen%8) || hashbitlen > 512)
    return BAD_HASHLEN;

  /* set number of state columns and state size depending on
     variant */
  if (hashbitlen <= 256) {
    ctx->size = SHORT;
    ctx->statesize = SIZE512;
    ctx->chaining = calloc(COLS512,sizeof(u64));
    ctx->buffer = malloc(SIZE1024);	//modified
    ctx->blocksize = SIZE1024;		//added
    /* set initial value */
    ctx->chaining[COLS512-1] = U64BIG((u64)hashbitlen);
  }
 /* else {
    ctx->size = LONG;
    ctx->chaining = calloc(COLS1024,sizeof(u64));
    ctx->buffer = malloc(SIZE1024);
    //set initial value 
    ctx->chaining[COLS1024-1] = U64BIG((u64)hashbitlen);
  }*/


  /* set other variables */
  ctx->hashbitlen = hashbitlen;
  ctx->buf_ptr = 0;
  ctx->block_counter = 0;
  ctx->bits_in_last_byte = 0;

//ADDED BY GURPREET 
  ctx->cnt_buf_ptr = 0;			//added
  ctx->cnt_block = 1;			//added as there will always be atleast 1 block

/* initialize counter buffer to zero*/
while (ctx->cnt_buf_ptr < ctx->statesize) {
    ctx->counter[ctx->cnt_buf_ptr++] = 0;
   }
//----
  return SUCCESS;
}

//-----------------------------------------------------
/* 	UPDATE
	update state with databitlen bits of input */
//----------------------------------------------------
/* update state with databitlen bits of input */
//Update(&context, data, databitlen)2016
HashReturn Update(hashState* ctx,
		  const BitSequence* input,
		  DataLength databitlen) {
  int index = 0;
  int msglen = (int)(databitlen/8);
  int rem = (int)(databitlen%8);

  /* non-integral number of message bytes can only be supplied in the
     last call to this function */
  if (ctx->bits_in_last_byte) return FAIL;

  /* if the buffer contains data that has not yet been digested, first
     add data to buffer until full */
  if (ctx->buf_ptr) {
    while (ctx->buf_ptr < ctx->size && index < msglen) {
      ctx->buffer[(int)ctx->buf_ptr++] = input[index++];
    }
    if (ctx->buf_ptr < ctx->blocksize) {//MODIFIED
      /* buffer still not full, return */
      if (rem) {
	ctx->bits_in_last_byte = rem;
	ctx->buffer[(int)ctx->buf_ptr++] = input[index];
      }
      return SUCCESS;
    }

    /* digest buffer */
    ctx->buf_ptr = 0;
    Transform(ctx, ctx->buffer, ctx->blocksize);	//MODIFIED
  }

  /* digest bulk of message */
  Transform(ctx, input+index, msglen-index);
  index += ((msglen-index)/ctx->blocksize)*ctx->blocksize; //MODIFIED

  /* store remaining data in buffer */
  while (index < msglen) {
    ctx->buffer[(int)ctx->buf_ptr++] = input[index++];
  }

  /* if non-integral number of bytes have been supplied, store
     remaining bits in last byte, together with information about
     number of bits */
  if (rem) {
    ctx->bits_in_last_byte = rem;
    ctx->buffer[(int)ctx->buf_ptr++] = input[index];
  }
  return SUCCESS;
}

#define BILB ctx->bits_in_last_byte


//-------------------------------------------------------------------
/* 	FINALISE
	finalise: process remaining data (including padding), perform
   	output transformation, and write hash result to 'output' */
//-------------------

HashReturn Final(hashState* ctx,
		 BitSequence* output) {

  int i, j = 0, hashbytelen = ctx->hashbitlen/8;
  u8 *s = (BitSequence*)ctx->chaining;

u64 kbyts=0,kbits;	//ADDED

  /* pad with '1'-bit and first few '0'-bits */
  if (BILB) {
    ctx->buffer[(int)ctx->buf_ptr-1] &= ((1<<BILB)-1)<<(8-BILB);
    ctx->buffer[(int)ctx->buf_ptr-1] ^= 0x1<<(7-BILB);
    BILB = 0;
  }
  else ctx->buffer[(int)ctx->buf_ptr++] = 0x80;

  /* pad with '0'-bits */
//modified :1 byte for r value & 8 bytes for length

  if (ctx->buf_ptr > ctx->blocksize-LENGTHFIELDLEN-1) { ////Modified 1 byte for r value & 8 bytes for length

    /* padding requires two blocks */
    while (ctx->buf_ptr < ctx->blocksize) {
      ctx->buffer[(int)ctx->buf_ptr++] = 0;
	kbyts++; 		//ADDED: no of zeros appended
    }

    /* digest first padding block */
    Transform(ctx, ctx->buffer, ctx->blocksize);	//Modified
    ctx->buf_ptr = 0;
  }

  while (ctx->buf_ptr < ctx->blocksize-LENGTHFIELDLEN-1) {	//Modified
    ctx->buffer[(int)ctx->buf_ptr++] = 0;
	kbyts++; 		//no of zeros appended
  }

//ADDSED bY GURPREET-- Feb14,2012

//for k zeros
  while (ctx->buf_ptr < ctx->blocksize-LENGTHFIELDLEN-1) {
    ctx->buffer[(int)ctx->buf_ptr++] = 0;
	kbyts++; 		//no of zeros appended
  }

    //ADDED BY gurpreet FOR R-BYTES
	kbits=(kbyts*8)+ctx->bits_in_last_byte;

	kbits+=8;		//7bits as 10000000 & added 1 bit as space is 7bits for rbytes
	int r_bytes;
	// for 7 bit r_bytes padding

	r_bytes=(952-kbits)%1024;
	while (r_bytes<0)
	   {r_bytes+=1024;}		// convert -vr to +ve mod value
	r_bytes/=8;			// convert it into bytes

	//for 7bit r_bytes value
	 while (ctx->buf_ptr >= ctx->blocksize-LENGTHFIELDLEN-1) {
	    ctx->buffer[ctx->buf_ptr--] = (u8)r_bytes;
	    r_bytes >>= 8;
	  } 

    //-----

  /* length padding */
  ctx->block_counter++;
  ctx->buf_ptr = ctx->blocksize;		//modified
//ADDED
   ctx->cnt_block=ctx->block_counter;
//------

/*for padding block counter*/
  while (ctx->buf_ptr > ctx->blocksize-LENGTHFIELDLEN) {	//modified
    ctx->buffer[(int)--ctx->buf_ptr] = (u8)ctx->block_counter;
    ctx->block_counter >>= 8;
  }

  /* digest final padding block */
  Transform(ctx, ctx->buffer, ctx->blocksize);		//modified
  /* perform output transformation */
  OutputTransformation(ctx);

j=0;
  /* store hash result in output */
  for (i = ctx->size-hashbytelen; i < ctx->size; i++,j++) {
    output[j] = s[i];
  }

  /* zeroise relevant variables and deallocate memory */
  if (ctx->size == SHORT) {
    memset(ctx->chaining, 0, COLS512*sizeof(u64));
    memset(ctx->buffer, 0, SIZE512);
  }
  else {
    memset(ctx->chaining, 0, COLS1024*sizeof(u64));
    memset(ctx->buffer, 0, SIZE1024);
  }
  free(ctx->chaining);
  free(ctx->buffer);

  return SUCCESS;
}

/* hash bit sequence */
HashReturn Hash(int hashbitlen,
		const BitSequence* data, 
		DataLength databitlen,
		BitSequence* hashval) {
  HashReturn ret;
  hashState context;

  /* initialise */
  if ((ret = Init(&context, hashbitlen)) != SUCCESS)
    return ret;

  /* process message */
  if ((ret = Update(&context, data, databitlen)) != SUCCESS)
    return ret;

  /* finalise */
  ret = Final(&context, hashval);

  return ret;
}

void PrintHash(const BitSequence* hash,
	       int hashbitlen) {
  int i;
  for (i = 0; i < hashbitlen/8; i++) {
    printf("%02x", hash[i]);
  }
  printf("\n");
}


/* eBash API */
#ifdef crypto_hash_BYTES
int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
  if (Hash(crypto_hash_BYTES * 8, in, inlen * 8,out) == SUCCESS) return 0;
  return -1;
}
#endif
