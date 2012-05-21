/* hash.c     April 2012
 * Groestl ANSI C code optimized for 32-bit architecture
 * Authors: Thoams Krinninger
 *
 */

#include "hash.h"
#include "tables.h"
#include "groestl_asm.h"

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
						
  mixBytesAsm(x32);
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

  mixBytesAsm(x32);
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
