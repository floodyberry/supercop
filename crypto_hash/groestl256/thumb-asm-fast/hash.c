/* hash.c     April 2012
 * Groestl ANSI C code optimized for 32-bit architecture
 * Authors: Thoams Krinninger
 *
 */

#include "hash.h"
#include "groestl_asm.h"
#include "crypto_hash.h"


#define ROTATE_LINE_LEFT(v1, v2, amount_bytes, temp_var) {temp_var = (v1>>(8*amount_bytes))|(v2<<(8*(4-amount_bytes))); \
															v2 = (v2>>(8*amount_bytes))|(v1<<(8*(4-amount_bytes))); \
															v1 = temp_var;}


#define rotate_line_left(x,row_number,shift_value,t1,t2,t3,t4)	 \
{															 \
	t4=shift_value;											 \
	if(t4 < 4)						        				 \
	{														 \
		t2 = x[2*row_number];								 \
		t3 = x[2*row_number+1];								 \
	} else {												 \
		t3 = x[2*row_number];								 \
		t2 = x[2*row_number+1];								 \
		t4 -= 4;									 		 \
	}														 \
	if(t4 != 0)									 			 \
	{														 \
		ROTATE_LINE_LEFT(t2, t3, t4, t1)			 \
	}														 \
	x[2*row_number] = t2;									 \
	x[2*row_number+1] = t3;									 \
} 															 \



/* compute one round of P (short variants) */
void RND512P(uint32_t *x32, uint32_t r) {
  uint32_t t1, t2, t3, t4;

  x32[ 0] ^= 0x30201000^r;
  x32[ 1] ^= 0x70605040^r;

  subBytesASM((uint8_t*)x32);

  rotate_line_left(x32,1, 1, t1, t2, t3, t4);
  rotate_line_left(x32,2, 2, t1, t2, t3, t4);
  rotate_line_left(x32,3, 3, t1, t2, t3, t4);
  rotate_line_left(x32,4, 4, t1, t2, t3, t4);
  rotate_line_left(x32,5, 5, t1, t2, t3, t4);
  rotate_line_left(x32,6, 6, t1, t2, t3, t4);
  rotate_line_left(x32,7, 7, t1, t2, t3, t4);
						
  mixBytesAsm(x32);
}

/* compute one round of Q (short variants) */
void RND512Q(uint32_t *x32, uint32_t r) {
  uint32_t t1, t2, t3, t4;

  x32[ 0] = ~x32[ 0];
  x32[ 1] = ~x32[ 1];
  x32[ 2] = ~x32[ 2];
  x32[ 3] = ~x32[ 3];
  x32[ 4] = ~x32[ 4];
  x32[ 5] = ~x32[ 5];
  x32[ 6] = ~x32[ 6];
  x32[ 7] = ~x32[ 7];
  x32[ 8] = ~x32[ 8];
  x32[ 9] = ~x32[ 9];
  x32[10] = ~x32[10];
  x32[11] = ~x32[11];
  x32[12] = ~x32[12];
  x32[13] = ~x32[13];
  x32[14] ^= 0xcfdfefff^r;
  x32[15] ^= 0x8f9fafbf^r;

  subBytesASM((uint8_t*)x32);

  rotate_line_left(x32,0, 1, t1, t2, t3, t4);
  rotate_line_left(x32,1, 3, t1, t2, t3, t4);
  rotate_line_left(x32,2, 5, t1, t2, t3, t4);
  rotate_line_left(x32,3, 7, t1, t2, t3, t4);
  rotate_line_left(x32,5, 2, t1, t2, t3, t4);
  rotate_line_left(x32,6, 4, t1, t2, t3, t4);
  rotate_line_left(x32,7, 6, t1, t2, t3, t4);

  mixBytesAsm(x32);
}

/* compute compression function (short variants) */
void F512(uint32_t *h, uint32_t *m) {
  int i;

  uint32_t x[2*COLS512];


  for (i = 0; i < 2*COLS512; i++) {
    x[i] = h[i]^m[i];
  }

  /* compute Q(m) */
  RND512Q(m, 0x00000000);
  RND512Q(m, 0x01010101);
  RND512Q(m, 0x02020202);
  RND512Q(m, 0x03030303);
  RND512Q(m, 0x04040404);
  RND512Q(m, 0x05050505);
  RND512Q(m, 0x06060606);
  RND512Q(m, 0x07070707);
  RND512Q(m, 0x08080808);
  RND512Q(m, 0x09090909);


  /* compute P(h+m) */
  RND512P(x, 0x00000000);
  RND512P(x, 0x01010101);
  RND512P(x, 0x02020202);
  RND512P(x, 0x03030303);
  RND512P(x, 0x04040404);
  RND512P(x, 0x05050505);
  RND512P(x, 0x06060606);
  RND512P(x, 0x07070707);
  RND512P(x, 0x08080808);
  RND512P(x, 0x09090909);
				  
  /* compute P(h+m) + Q(m) + h */
  for (i = 0; i < 2*COLS512; i++) {
    h[i] ^= x[i]^m[i];
  }
}

int crypto_hash(unsigned char *hashval,
		const unsigned char *data,
		unsigned long long databytelen)
{
  uint8_t state[SIZE512];
	uint8_t message_block[SIZE512];
	uint32_t i, w;
	uint32_t bytes_remaining;
	uint64_t full_message_blocks = databytelen/64;



  
	//Setting initial state
	for(i=0;i<(SIZE512/sizeof(uint32_t));i++)
	{
		((uint32_t*)state)[i] = 0;
	}

  //256BIT_HASH_SPECIFIC line
	state[55] = 1; //Initial value for hash length 256 bit when saving state in row order!

	while(full_message_blocks--)
	{
		for (i = 0; i < SIZE512; i++) {
			message_block[(i%8)*8+i/8] = data[i]; //zeilenweise speichern
		}
		data += SIZE512;
		F512((uint32_t*)state, (uint32_t*)message_block);
	}
	

	//Padding
	bytes_remaining = ((uint32_t)databytelen)%64;

	for(i=0;i<bytes_remaining;i++)
	{
		message_block[(i%8)*8+i/8] = data[i]; //zeilenweise speichern
	}
	
	//setting padding bit 1

	message_block[(i%8)*8+i/8] = 0x80;
	i++;


	//appending zero bytes
	for(;i<(SIZE512-64/8);i++)
	{
		message_block[(i%8)*8+i/8] = 0;
	}

	if(i!=(SIZE512-64/8)) { //no more 64 bit left in state
		for(;i<SIZE512;i++)
		{
			message_block[(i%8)*8+i/8] = 0;
		}
		F512((uint32_t*)state, (uint32_t*)message_block);
		for(i=0; i<(SIZE512/(sizeof(uint32_t))); i++)
		{
			((uint32_t*)message_block)[i] = 0;
		}
	}

  w = (-((uint32_t)8*databytelen)-65)&0x1FF;
  databytelen = (8*databytelen+w+65)/(SIZE512*8);

	for(i=SIZE512-1;i>=(SIZE512-64/8);i--)
	{
		message_block[(i%8)*8+i/8] = (uint8_t)databytelen;
		databytelen >>= 8;
	}
	F512((uint32_t*)state, (uint32_t*)message_block);




	for (i = 0; i < SIZE512/sizeof(uint32_t); i++) {
	  ((uint32_t*)message_block)[i] = ((uint32_t*)state)[i];
	}

  w = 0;     //round constant
  	/* compute Q(m) */  

  for(i=0;i<10;i++)
  {
  	RND512P((uint32_t*)state, w);
  	w += 0x01010101;
  }

	for (i = 0; i < 2*COLS512; i++) {
	  ((uint32_t*)state)[i] ^= ((uint32_t*)message_block)[i];
	}

  for (i = SIZE512-HASH_BIT_LEN/8; i < SIZE512; i++) {
		hashval[i-(SIZE512-HASH_BIT_LEN/8)] = state[(i%8)*8+i/8]; //zeilenweise speichern
	}
  return 0;
}

