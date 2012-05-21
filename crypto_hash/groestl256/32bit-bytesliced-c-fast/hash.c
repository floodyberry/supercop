/* hash.c     April 2012
 * Groestl ANSI C code optimized for 32-bit architecture
 * Authors: Thoams Krinninger
 *
 */

#include "hash.h"
#include "tables.h"

#define ROTATE_LINE_LEFT(v1, v2, amount_bytes, temp_var) {temp_var = (v1>>(8*amount_bytes))|(v2<<(8*(4-amount_bytes))); \
															v2 = (v2>>(8*amount_bytes))|(v1<<(8*(4-amount_bytes))); \
															v1 = temp_var;}


void rotate_line_left(uint32_t* x,uint32_t row_number,uint32_t shift_value)	 
{
	uint32_t t1,t2,t3,t4;															 
	t4=shift_value;											 
	if(t4 < 4)						        				 
	{														 
		t2 = x[2*row_number];								 
		t3 = x[2*row_number+1];								 
	} else {												 
		t3 = x[2*row_number];								 
		t2 = x[2*row_number+1];								 
		t4 -= 4;									 		 
	}														 
	if(t4 != 0)									 			 
	{														 
		ROTATE_LINE_LEFT(t2, t3, t4, t1)			 
	}												
	x[2*row_number] = t2;									 
	x[2*row_number+1] = t3;									 
} 															 


uint32_t MUL2_32Bit(uint32_t x,uint32_t mmsb,uint32_t mclmsb)		
{
	uint32_t t1,t2,t3;
	t1 = x & mmsb;		  
	t3 = x & mclmsb;	  
	t3 = t3 << 1;		  
	t1 = t1 >> 7;		  
	t2 = t1 << 1;		  
	t1 = t1 | t2;		  
	t2 = t1 << 3;		  
	t1 = t1 | t2;		  
	return (t3 ^ t1);		  
}

void mix_bytes_half_state(uint32_t* x, uint32_t mmsb, uint32_t mclmsb) {
  uint32_t t0, t1, t2, t3, t4, t5, t6, t7;
  uint32_t x0, x1, x2, x3, x4, x5, x6, x7;
  uint32_t y0, y1, y2, y3, y4, y5, y6, y7;
  
  t0 = x[2*0] ^ x[2*1];
  t1 = x[2*1] ^ x[2*2];
  t2 = x[2*2] ^ x[2*3];
  t3 = x[2*3] ^ x[2*4];
  t4 = x[2*4] ^ x[2*5];
  t5 = x[2*5] ^ x[2*6];
  t6 = x[2*6] ^ x[2*7];
  t7 = x[2*7] ^ x[2*0];
  
  x0 = t0 ^ t3;
  x1 = t1 ^ t4;
  x2 = t2 ^ t5;
  x3 = t3 ^ t6;
  x4 = t4 ^ t7;
  x5 = t5 ^ t0;
  x6 = t6 ^ t1;
  x7 = t7 ^ t2;
  
  y0 = t0 ^ t2 ^ x[2*6];
  y1 = t1 ^ t3 ^ x[2*7];
  y2 = t2 ^ t4 ^ x[2*0];
  y3 = t3 ^ t5 ^ x[2*1];
  y4 = t4 ^ t6 ^ x[2*2];
  y5 = t5 ^ t7 ^ x[2*3];
  y6 = t6 ^ t0 ^ x[2*4];
  y7 = t7 ^ t1 ^ x[2*5];
  
  x3 = MUL2_32Bit(x3,mmsb,mclmsb);
  x0 = MUL2_32Bit(x0,mmsb,mclmsb);
  
  t0 = x3 ^ y7;
  t0 = MUL2_32Bit(t0,mmsb,mclmsb);
  t5 = x0 ^ y4;
  t5 = MUL2_32Bit(t5,mmsb,mclmsb);
  
  x[2*0] = t0 ^ y4;
  x[2*5] = t5 ^ y1;
  
  x[2*1] = MUL2_32Bit(MUL2_32Bit(x4,mmsb,mclmsb) ^ y0, mmsb, mclmsb) ^ y5;
  x[2*2] = MUL2_32Bit(MUL2_32Bit(x5,mmsb,mclmsb) ^ y1, mmsb, mclmsb) ^ y6;
  x[2*3] = MUL2_32Bit(MUL2_32Bit(x6,mmsb,mclmsb) ^ y2, mmsb, mclmsb) ^ y7;
  x[2*4] = MUL2_32Bit(MUL2_32Bit(x7,mmsb,mclmsb) ^ y3, mmsb, mclmsb) ^ y0;
  x[2*6] = MUL2_32Bit(MUL2_32Bit(x1,mmsb,mclmsb) ^ y5, mmsb, mclmsb) ^ y2;
  x[2*7] = MUL2_32Bit(MUL2_32Bit(x2,mmsb,mclmsb) ^ y6, mmsb, mclmsb) ^ y3;
}

void mixBytes(uint32_t* x)
{
	uint32_t mmsb,mclmsb;

	mmsb = 0x80808080;
	mclmsb = 0x7f7f7f7f;

	mix_bytes_half_state(&x[0], mmsb, mclmsb);
	mix_bytes_half_state(&x[1], mmsb, mclmsb);
}


void subBytes(uint8_t* x)
{
	int i;
	for(i=0;i<64;i++)
	{
		x[i] = S[x[i]];
	}
}

void RND512P(uint32_t *x32, uint32_t r) {
  uint32_t i;

  x32[ 0] ^= 0x30201000^r;
  x32[ 1] ^= 0x70605040^r;

  subBytes((uint8_t*)x32);

  for(i=1;i<8;i++)
  {
    rotate_line_left(x32,i, i);
  }
						
  mixBytes(x32);
}

void RND512Q(uint32_t *x32, uint32_t r) {
  uint32_t i;
  uint32_t j;

  for(i=0;i<14;i++)
  {
	 x32[i] = ~x32[i];
  }

  x32[14] ^= 0xcfdfefff^r;
  x32[15] ^= 0x8f9fafbf^r;

  subBytes((uint8_t*)x32);

  j=1;

  for(i=0;i<4;i++)
  {  	  
	  rotate_line_left(x32,i, j);
	  j+=2;
  }

  j=2;
  for(i=5;i<8;i++)
  {  	  
	  rotate_line_left(x32,i, j);
	  j+=2;
  }

  mixBytes(x32);
}

void F512(uint32_t *h, uint32_t *m) {
  int i;
  uint32_t roundConstantAddingValue;
  uint32_t roundConstant;
  uint32_t x[2*COLS512];


  for (i = 0; i < 2*COLS512; i++) {
    x[i] = h[i]^m[i];
  }

  roundConstantAddingValue = 0x01010101;
  roundConstant = 0;

  for(i=0;i<10;i++)
  {
  	RND512Q(m, roundConstant);
  	roundConstant += roundConstantAddingValue;
  }

  roundConstant = 0;

  for(i=0;i<10;i++)
  {
  	RND512P(x, roundConstant);
  	roundConstant += roundConstantAddingValue;
  }
				  
  for (i = 0; i < 2*COLS512; i++) {
    h[i] ^= x[i]^m[i];
  }
}

void P(uint32_t *h, uint32_t *m)
{
  int i;
  uint32_t roundConstantAddingValue;
  uint32_t roundConstant;


  for (i = 0; i < 2*COLS512; i++) {
    m[i] = h[i]^m[i];
  }

  roundConstantAddingValue = 0x01010101;
  roundConstant = 0;


  for(i=0;i<10;i++)
  {
  	RND512P(m, roundConstant);
  	roundConstant += roundConstantAddingValue;
  }
				  
  for (i = 0; i < 2*COLS512; i++) {
    h[i] ^= m[i];
  }
}


void Q(uint32_t *h, uint32_t *m)
{
  int i;
  uint32_t roundConstantAddingValue;
  uint32_t roundConstant;

  roundConstantAddingValue = 0x01010101;
  roundConstant = 0;

  for(i=0;i<10;i++)
  {
  	RND512Q(m, roundConstant);
  	roundConstant += roundConstantAddingValue;
  }

  for (i = 0; i < 2*COLS512; i++) {
    h[i] ^= m[i];
  }
}


int crypto_hash(unsigned char *hashval,
		const unsigned char *data,
		unsigned long long databytelen)
{
  uint8_t state[SIZE512];
  uint8_t message_block[SIZE512];
  uint32_t i, j, w;
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
		
  P((uint32_t*)state, (uint32_t*)message_block);

  for (i = 0; i < SIZE512; i++) {
    message_block[(i%8)*8+i/8] = data[i]; //zeilenweise speichern
  }
  Q((uint32_t*)state, (uint32_t*)message_block);
    data += SIZE512;
  }
	

	//Padding
  bytes_remaining = ((uint32_t)databytelen)%64;
  if(bytes_remaining > (SIZE512-64/8-1)) //if only one padding block is needed (64 bit w + 1 byte for appending bit 1)
  {
    for(j=0;j<2;j++)
    {  
      for(i=0;i<bytes_remaining;i++)
      {
    	  message_block[(i%8)*8+i/8] = data[i]; //zeilenweise speichern
      }    	
    	//setting padding bit 1
  
  		message_block[(i%8)*8+i/8] = 0x80;
      i++;
      for(;i<SIZE512;i++)
      {
        message_block[(i%8)*8+i/8] = 0;
      }

      if(j==0)
      {
        P((uint32_t*)state, (uint32_t*)message_block);
      }
      else
      {
        Q((uint32_t*)state, (uint32_t*)message_block);
      }
    }
  }

  w = (-((uint32_t)8*databytelen)-65)&0x1FF;
  databytelen = (8*databytelen+w+65)/(SIZE512*8);
  

  for(j=0;j<2;j++)     //j is 2 at this moment
  {
    i=0;
    if(bytes_remaining <= (SIZE512-64/8-1))
    {
      for(;i<bytes_remaining;i++)
      {
    	message_block[(i%8)*8+i/8] = data[i]; //zeilenweise speichern
	  }
      message_block[(i%8)*8+i/8] = 0x80;
      i++;
    }

    for(;i<(SIZE512-(64/8));i++)
  	{
  	  message_block[(i%8)*8+i/8] = 0;
  	}

    full_message_blocks = databytelen; //temp copy of padding value
    for(i=SIZE512-1;i>=(SIZE512-64/8);i--)
	{
      message_block[(i%8)*8+i/8] = (uint8_t)full_message_blocks;
      full_message_blocks >>= 8;
	}

    if(j==0)
    {
      P((uint32_t*)state, (uint32_t*)message_block);
    }
    else
    {
      Q((uint32_t*)state, (uint32_t*)message_block);
    }
  }

  for (i = 0; i < SIZE512/sizeof(uint32_t); i++) {
	  ((uint32_t*)message_block)[i] = ((uint32_t*)state)[i];
  }

  w = 0;     //round constant
  

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


