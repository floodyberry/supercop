/*------------------------------------------------------------------------------------ */
/* Implementation of the double pipe ECHO hash function in its 512-bit outputs variant.*/
/* Optimized for PowerPC                                                               */
/*                                                                                     */
/* Date:     2010-07-23                                                                */
/*                                                                                     */
/* Authors:  Ryad Benadjila  <ryadbenadjila@gmail.com>                                 */
/*           Olivier Billet  <billet@eurecom.fr>                                       */
/*------------------------------------------------------------------------------------ */
#include "echo32.h"
#include "api.h"

#define SALT_A 0x00000000
#define SALT_B 0x00000000
#define SALT_C 0x00000000
#define SALT_D 0x00000000

#define  USINT     0
#define  UINT      1
#define  ULL       2

#define ET_BIG_ENDIAN 		0
#define ET_LITTLE_ENDIAN	1
#define ET_MIDDLE_ENDIAN	2

unsigned long long CNT_r;
unsigned int r;
unsigned char endian;

/***************************Endianess routines***********************************/
unsigned char Endianess(){
/*	Endianess test								*/
	unsigned int T;
	unsigned char T_o[8];
	
	T = 0xAABBCCDD;
	*(unsigned int*)T_o = T;
	
	if(T_o[0] == 0xAA){
		return ET_BIG_ENDIAN;
	}
	if(T_o[0] == 0xDD){
		return ET_LITTLE_ENDIAN;
	}
	else{
		return ET_MIDDLE_ENDIAN;
	}
}

void PushString(unsigned long long num, unsigned char* string, unsigned char type){
	unsigned int j;

	if(type == USINT){
		for(j=0; j<2; j++){
	  		string[j] = (num >> (j*8)) & 0xFF;
		}
	}
	if(type == UINT){
		for(j=0; j<4; j++){
	  		string[j] = (num >> (j*8)) & 0xFF;
		}
	}
	if(type == ULL){
		for(j=0; j<8; j++){
	  		string[j] = (num >> (j*8)) & 0xFF;
		}
	}

	return;
}

unsigned char flip_bits(unsigned char c){
	unsigned char res;
	unsigned char bits[8];
	unsigned int i;

	for(i=0; i<8; i++)
		bits[7-i] = (c >> i) & 0x1;

	res = 0;
	for(i=0; i<8; i++)
		res ^= bits[i] << i;

	return res;
}

#ifdef SALT_OPTION
/***************************Changing SALT routine  ***********************************/
HashReturn SetSalt(hashState* state, const BitSequence* SALT){
	unsigned int topush = *((unsigned int*)SALT);
	PushString(topush, state->SALT, UINT);
	topush = *((unsigned int*)(SALT+4));
	PushString(topush, state->SALT+4, UINT);
	topush = *((unsigned int*)(SALT+8));
	PushString(topush, state->SALT+8, UINT);
	topush = *((unsigned int*)(SALT+12));
	PushString(topush, state->SALT+12, UINT);

	return SUCCESS;
}
#endif

/***************************Initialisation routines***********************************/
HashReturn Init(hashState *state, unsigned int hashbitlen)
{
	unsigned int i, j;
	unsigned char endianess;

	memset(state->state, 0, 16*16);
  	/* set some initial values	    */
  	if(hashbitlen <= 256)
	 	state->end_cv = 16;
  	else
	  	state->end_cv = 2*16;

  	/* load the IV in the internal state */
 	for(i=0; i< state->end_cv; i++){
		if(i%4 == 0){
			PushString(hashbitlen, (unsigned char*)(state->state+i), UINT);
		}
		else{
  			state->state[i] = 0;
		}
	}
	

	state->hashbitlen = hashbitlen;
	state->messbitlen = 0;
	if(hashbitlen <= 256)
		state->m_blocksize = 1536;
	else
		state->m_blocksize = 1024;

    	/* set the counter */
  	state->CNT = 0;
	state->padding = 0;

    	/* set the number of rounds */
  	if(hashbitlen <= 256)
		state->r = 8;
	else
		state->r = 10;	

#ifdef SALT_OPTION
  	/* set the default salt */
  	memset(state->SALT, 0, 16);
#endif
	
	/*	Endianess testing	   */
	endian = Endianess();

	return SUCCESS;
}


/***************************Basic compression routines***********************************/
#define abyte(k)  ((k)        & 0xff)
#define bbyte(k) (((k) >>  8) & 0xff)
#define cbyte(k) (((k) >> 16) & 0xff)
#define dbyte(k)  ((k) >> 24)

#define integer(s, i) (*((unsigned int*)(s) + i))

#define AES_2Rounds(s){\
/* Round 1						*/\
      x0 = integer(s, 0); x1 = integer(s, 1);\
      x2 = integer(s, 2); x3 = integer(s, 3);\
      p00 = x0 >> 20;\
      p01 = x0 >> 12;\
      p02 = x0 >> 4;\
      p03 = x0 << 4;\
      p00 &= 4080;\
      p01 &= 4080;\
      p02 &= 4080;\
      p03 &= 4080;\
      z0 = *(unsigned int *) (table0 + p00);\
      z3 = *(unsigned int *) (table1 + p01);\
      z2 = *(unsigned int *) (table2 + p02);\
      z1 = *(unsigned int *) (table3 + p03);\
   \
      p10 = x1 >> 20;\
      p11 = x1 >> 12;\
      p12 = x1 >> 4;\
      p13 = x1 << 4;\
      p10 &= 4080;\
      p11 &= 4080;\
      p12 &= 4080;\
      p13 &= 4080;\
      y0 = *(unsigned int *) (table0 + p10);\
      y1 = *(unsigned int *) (table1 + p11);\
      y2 = *(unsigned int *) (table2 + p12);\
      y3 = *(unsigned int *) (table3 + p13);\
      z1 ^= y0;\
      z0 ^= y1;\
      z3 ^= y2;\
      z2 ^= y3;\
   \
      p20 = x2 >> 20;\
      p21 = x2 >> 12;\
      p22 = x2 >> 4;\
      p23 = x2 << 4;\
      p20 &= 4080;\
      p21 &= 4080;\
      p22 &= 4080;\
      p23 &= 4080;\
      y0 = *(unsigned int *) (table0 + p20);\
      y1 = *(unsigned int *) (table1 + p21);\
      y2 = *(unsigned int *) (table2 + p22);\
      y3 = *(unsigned int *) (table3 + p23);\
      z2 ^= y0;\
      z1 ^= y1;\
      z0 ^= y2;\
      z3 ^= y3;\
   \
      p30 = x3 >> 20;\
      p31 = x3 >> 12;\
      p32 = x3 >> 4;\
      p33 = x3 << 4;\
      p31 &= 4080;\
      p32 &= 4080;\
      p33 &= 4080;\
      p30 &= 4080;\
      y1 = *(unsigned int *) (table1 + p31);\
      y2 = *(unsigned int *) (table2 + p32);\
      y3 = *(unsigned int *) (table3 + p33);\
      y0 = *(unsigned int *) (table0 + p30);\
      x2 = z2 ^ y1;\
      x1 = z1 ^ y2 ^ (CNT_r >> 32);\
      x0 = z0 ^ y3 ^ CNT_r;\
      x3 = z3 ^ y0;\
/* Round 2						*/\
      p00 = x0 << 4;\
      p01 = x0 >> 4;\
      p02 = x0 >> 12;\
      p03 = x0 >> 20;\
      p00 &= 4080;\
      p01 &= 4080;\
      p02 &= 4080;\
      p03 &= 4080;\
      z0 = *(unsigned int *) (table0_ + p00);\
      z3 = *(unsigned int *) (table1_ + p01);\
      z2 = *(unsigned int *) (table2_ + p02);\
      z1 = *(unsigned int *) (table3_ + p03);\
   \
      p10 = x1 << 4;\
      p11 = x1 >> 4;\
      p12 = x1 >> 12;\
      p13 = x1 >> 20;\
      p10 &= 4080;\
      p11 &= 4080;\
      p12 &= 4080;\
      p13 &= 4080;\
      y0 = *(unsigned int *) (table0_ + p10);\
      y1 = *(unsigned int *) (table1_ + p11);\
      y2 = *(unsigned int *) (table2_ + p12);\
      y3 = *(unsigned int *) (table3_ + p13);\
      z1 ^= y0;\
      z0 ^= y1;\
      z3 ^= y2;\
      z2 ^= y3;\
   \
      p20 = x2 << 4;\
      p21 = x2 >> 4;\
      p22 = x2 >> 12;\
      p23 = x2 >> 20;\
      p20 &= 4080;\
      p21 &= 4080;\
      p22 &= 4080;\
      p23 &= 4080;\
      y0 = *(unsigned int *) (table0_ + p20);\
      y1 = *(unsigned int *) (table1_ + p21);\
      y2 = *(unsigned int *) (table2_ + p22);\
      y3 = *(unsigned int *) (table3_ + p23);\
      z2 ^= y0;\
      z1 ^= y1;\
      z0 ^= y2;\
      z3 ^= y3;\
   \
      p30 = x3 << 4;\
      p31 = x3 >> 4;\
      p32 = x3 >> 12;\
      p33 = x3 >> 20;\
      p31 &= 4080;\
      p32 &= 4080;\
      p33 &= 4080;\
      p30 &= 4080;\
      y1 = *(unsigned int *) (table1_ + p31);\
      y2 = *(unsigned int *) (table2_ + p32);\
      y3 = *(unsigned int *) (table3_ + p33);\
      y0 = *(unsigned int *) (table0_ + p30);\
      integer(s, 2) = z2 ^ y1;\
      integer(s, 1) = z1 ^ y2;\
      integer(s, 0) = z0 ^ y3;\
      integer(s, 3) = z3 ^ y0;\
}

#define WORD_ROUND(s) do {\
  AES_2Rounds(s);\
  CNT_r++;       \
} while(0);


#define MDS(a, b, c, d) do { \
      x0 = *(a); x1 = *(b);\
      x2 = *(c); x3 = *(d);\
      p00 = x0 >> 20;\
      p01 = x0 >> 12;\
      p02 = x0 >> 4;\
      p03 = x0 << 4;\
      p00 &= 4080;\
      p01 &= 4080;\
      p02 &= 4080;\
      p03 &= 4080;\
      z0 = *(unsigned int *) (table_MC0 + p00);\
      z1 = *(unsigned int *) (table_MC0 + p01);\
      z2 = *(unsigned int *) (table_MC0 + p02);\
      z3 = *(unsigned int *) (table_MC0 + p03);\
   \
      p10 = x1 >> 20;\
      p11 = x1 >> 12;\
      p12 = x1 >> 4;\
      p13 = x1 << 4;\
      p10 &= 4080;\
      p11 &= 4080;\
      p12 &= 4080;\
      p13 &= 4080;\
      y0 = *(unsigned int *) (table_MC1 + p10);\
      y1 = *(unsigned int *) (table_MC1 + p11);\
      y2 = *(unsigned int *) (table_MC1 + p12);\
      y3 = *(unsigned int *) (table_MC1 + p13);\
      z0 ^= y0;\
      z1 ^= y1;\
      z2 ^= y2;\
      z3 ^= y3;\
   \
      p20 = x2 >> 20;\
      p21 = x2 >> 12;\
      p22 = x2 >> 4;\
      p23 = x2 << 4;\
      p20 &= 4080;\
      p21 &= 4080;\
      p22 &= 4080;\
      p23 &= 4080;\
      y0 = *(unsigned int *) (table_MC2 + p20);\
      y1 = *(unsigned int *) (table_MC2 + p21);\
      y2 = *(unsigned int *) (table_MC2 + p22);\
      y3 = *(unsigned int *) (table_MC2 + p23);\
      z0 ^= y0;\
      z1 ^= y1;\
      z2 ^= y2;\
      z3 ^= y3;\
   \
      p30 = x3 >> 20;\
      p31 = x3 >> 12;\
      p32 = x3 >> 4;\
      p33 = x3 << 4;\
      p30 &= 4080;\
      p31 &= 4080;\
      p32 &= 4080;\
      p33 &= 4080;\
      z0 ^= *(unsigned int *) (table_MC3 + p30);\
      z1 ^= *(unsigned int *) (table_MC3 + p31) ;\
      z2 ^= *(unsigned int *) (table_MC3 + p32) ;\
      z3 ^= *(unsigned int *) (table_MC3 + p33);\
      *(d) = (z3 & 0xFF)               ^ ((z2 & 0xFF) << 8)        ^ ((z1 & 0xFF) << 16)      ^ ((z0 & 0xFF) << 24);\
      *(c) = ((z3 & 0xFF00) >> 8)      ^  (z2 & 0xFF00)            ^ ((z1 & 0xFF00) << 8)     ^ ((z0 & 0xFF00) << 16);\
      *(b) = ((z3 & 0xFF0000) >> 16)   ^ ((z2 & 0xFF0000) >> 8)    ^  (z1 & 0xFF0000)         ^ ((z0 & 0xFF0000) << 8);\
      *(a) = ((z3 & 0xFF000000) >> 24) ^ ((z2 & 0xFF000000) >> 16) ^ ((z1 & 0xFF000000) >> 8) ^  (z0 & 0xFF000000);\
} while(0);


#define BIG_SUB_WORDS(state) do{\
	unsigned int i;\
	for(i=0; i<16; i++){\
		WORD_ROUND((state->state+4*i));\
	}\
} while(0);

#define BIG_MIX_COLUMN(state) do{\
	unsigned int i, j;\
	for(i=0; i<4; i++){\
		for(j=0; j<4; j++){\
			MDS(state->state+16*i+j, state->state+16*i+j+4, state->state+16*i+j+8, state->state+16*i+j+12);\
		}\
	}\
} while(0);



#define WORD_SWAP(state, a, b, aa, bb, cc, dd) do { \
  aa = *(state->state+4*a);   *(state->state+4*a)   = *(state->state+4*b);    *(state->state+4*b)   = aa;\
  bb = *(state->state+4*a+1); *(state->state+4*a+1) = *(state->state+4*b+1);  *(state->state+4*b+1) = bb;\
  cc = *(state->state+4*a+2); *(state->state+4*a+2) = *(state->state+4*b+2);  *(state->state+4*b+2) = cc;\
  dd = *(state->state+4*a+3); *(state->state+4*a+3) = *(state->state+4*b+3);  *(state->state+4*b+3) = dd;\
} while(0); 

#define BIG_SHIFT_ROWS(state) do {\
	WORD_SWAP(state, 9,  13, x0, x1, x2, x3);\
	WORD_SWAP(state, 5,  13, y0, y1, y2, y3);\
	WORD_SWAP(state, 1,  13, z0, z1, z2, z3);\
	\
	WORD_SWAP(state, 2,  10, p00, p01, p02, p03);\
	WORD_SWAP(state, 6,  14, p10, p11, p12, p13);\
	\
	WORD_SWAP(state, 3,  15, p20, p21, p22, p23);\
	WORD_SWAP(state, 7,  15, p30, p31, p32, p33);\
	WORD_SWAP(state, 11, 15, x0, x1, x2, x3);\
} while(0);\


#define LOADmessage(state, data) do {\
	if(state->hashbitlen <= 256){\
		memcpy(state->state+16, data, 1536 >> 3);\
	}\
	else{\
		memcpy(state->state+2*16, data, 1024 >> 3);\
	}\
}while(0);

#define XOR_MEM(A, B, size) do { \
  	unsigned int i;\
  	for(i=0; i<size; i++)\
		((unsigned int*)A)[i] ^=  ((unsigned int*)B)[i];\
} while(0); 

#define FEEDforward(state, oldcv) do{\
	if(state->end_cv == 16){\
		XOR_MEM(state->state, 			state->state + state->end_cv, 	state->end_cv);\
		XOR_MEM(state->state + 2*state->end_cv, state->state + 3*state->end_cv, state->end_cv);\
		XOR_MEM(state->state, 			state->state + 2*state->end_cv, state->end_cv);\
		XOR_MEM(state->state, 			oldcv, 				state->end_cv);\
	}\
	else{\
		XOR_MEM(state->state, state->state + state->end_cv, state->end_cv);\
		XOR_MEM(state->state, oldcv, state->end_cv);\
	}\
}while(0);

#define SAVEcv(state, oldcv) do {\
	memcpy(oldcv, state, (state->end_cv)*sizeof(int)); \
	if(state->end_cv == 16){\
		XOR_MEM(oldcv, state->state + state->end_cv, 	state->end_cv);\
		XOR_MEM(oldcv, state->state + 2*state->end_cv, 	state->end_cv);\
		XOR_MEM(oldcv, state->state + 3*state->end_cv, 	state->end_cv);\
	}\
	else{\
		XOR_MEM(oldcv, state->state + state->end_cv, 	state->end_cv);\
	}\
} while(0);

#define int_revert(in)  do {\
	unsigned int j;\
	unsigned int temp = 0;\
	for(j=0; j<4; j++)\
		temp  ^= (((in)>>(8*(3-j)))&0xff) << (8*j);\
	in = temp;\
}while(0);

#define reverse_state(state) do {\
	unsigned int i;\
	for(i=0; i<4*16; i++){\
		int_revert (integer(state, i));\
	}\
} while(0);



HashReturn Compress(hashState *state)
{ 	
	/*	Saving the old chaining variable for feedforwarding			*/
	unsigned int oldcv[2*16];
	unsigned long long c0, c1;
  	register unsigned int x0;
  	register unsigned int x1;
  	register unsigned int x2;
 	register unsigned int x3;
  	register unsigned int y0;
  	register unsigned int y1;
  	register unsigned int y2;
  	register unsigned int y3;
  	register unsigned int z0;
  	register unsigned int z1;
  	register unsigned int z2;
  	register unsigned int z3;
 	register unsigned int p00;
  	register unsigned int p01;
  	register unsigned int p02;
  	register unsigned int p03;
  	register unsigned int p10;
  	register unsigned int p11;
  	register unsigned int p12;
  	register unsigned int p13;
  	register unsigned int p20;
 	register unsigned int p21;
  	register unsigned int p22;
  	register unsigned int p23;
  	register unsigned int p30;
  	register unsigned int p31;
  	register unsigned int p32;
  	register unsigned int p33;

 	/*	Loading the message in the state					*/
	LOADmessage(state, state->data);

	/*	Preparing the Feedforward operation					*/
	SAVEcv(state, oldcv);
	
	r = state->r;	
	state->CNT += (1-state->padding) * state->m_blocksize + state->padding * state->messbitlen;

	CNT_r = state->CNT;

	if(endian == ET_LITTLE_ENDIAN){	
		reverse_state(state->state);
	}

	do {


	/*	Applying 2 rounds AES on each word					*/
		BIG_SUB_WORDS(state);

	/*	Shift rows								*/

		BIG_SHIFT_ROWS(state);

	/*	Mix columns								*/
		BIG_MIX_COLUMN(state);

		r--;
	} while(r);

	if(endian == ET_LITTLE_ENDIAN){	
		reverse_state(state->state);
	}

	/*	Feedforwarding 								*/
	FEEDforward(state, oldcv);

	return SUCCESS;
}

HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen){

	unsigned int i;
	unsigned long long n_blocks;

	if(databitlen == 0){
		return SUCCESS;
	}
	/*	Last call twice error ?							*/
	if(state->messbitlen % 8 != 0){
		return UPDATE_WBITS_TWICE;
	}
	/*	Take the input bits and concatenate to the existing data				*/
	n_blocks = (databitlen + state->messbitlen)/state->m_blocksize;

	/*	Process if enough data									*/
	for(i=0; i<n_blocks; i++){
		if(i == 0)
			memcpy(state->data + (state->messbitlen >> 3), data, (state->m_blocksize-state->messbitlen) >> 3);
		else
			memcpy(state->data, data + (i-1)*(state->m_blocksize >> 3) + ((state->m_blocksize-state->messbitlen) >> 3), state->m_blocksize >> 3);
	/*	Update the internal state and feedforward						*/
		Compress(state);
	}

	/*	Store the remaining bits for the next update						*/
	if(((databitlen + state->messbitlen) % state->m_blocksize) != 0){
		if(n_blocks >= 1){
			unsigned int remaining_bits = ((databitlen + state->messbitlen) % state->m_blocksize);
			memcpy(state->data, data + (n_blocks-1)*(state->m_blocksize >> 3) + ((state->m_blocksize-state->messbitlen) >> 3), remaining_bits >> 3);
			state->messbitlen = remaining_bits;
			/*	Treat the last bits							*/
			if(databitlen % 8 != 0)
				state->data[(state->messbitlen >> 3)] = flip_bits(flip_bits(data[(databitlen >> 3)]) & (0xff >> (8-(databitlen%8))));
		}
	/*	If there was not enough data, concatenate and wait for the next update			*/
	/*	or final										*/
		else{
			memcpy(state->data + (state->messbitlen >> 3), data, databitlen >> 3);
			state->messbitlen += databitlen;
			/*	Treat the last bits							*/
			if(databitlen % 8 != 0)
				state->data[(state->messbitlen >> 3)] = flip_bits(flip_bits(data[(databitlen >> 3)]) & (0xff >> (8-(databitlen%8))));
		}
	}
	/*	Case where we processed all the data in the buffer					*/
	else
		state->messbitlen = 0;		

	return SUCCESS;
}

/***************************Finialisation routines***************************************/
HashReturn Final(hashState *state, BitSequence *hashval)
{
  	unsigned int i;
	unsigned short int hashlen = 0;
	unsigned long long messlen_l = 0;
	unsigned long long messlen_h = 0;

  	/* First, we initialize the hash value										*/
	for(i=0; i<(state->hashbitlen >> 3); i++)
  		hashval[i] = 0;
  	/* Then, we pad the message											*/ 
  	if(state->messbitlen <= (state->m_blocksize-145)){
  	/*	We can perform a one block padding									*/
 	/*	We add a 1 bit 												*/
		unsigned char c = flip_bits(state->data[state->messbitlen >> 3]);
	/*	Enough room for two bits in the last byte ?								*/
		if((state->messbitlen%8) != 0){
			c &= ~(0xff << (state->messbitlen%8));
			state->data[state->messbitlen >> 3] = flip_bits(c ^ (0x1 << (state->messbitlen % 8)));
		}
	/*	We pad the remaining bits										*/	
		memset(state->data + (state->messbitlen >> 3) + 1, 0, (state->m_blocksize >> 3)- (144 >> 3) - (state->messbitlen >> 3) - 1 ); 
		if((state->messbitlen%8) == 0)
			state->data[(state->messbitlen >> 3)] = 0x80;
	/*	Prepare the message length and the hash length								*/	
		PushString(state->hashbitlen, (unsigned char*)(state->data + (state->m_blocksize >> 3) - (144 >> 3)), USINT);
		PushString(state->CNT + state->messbitlen, (unsigned char*)(state->data + (state->m_blocksize >> 3) - (144 >> 3) + 2), ULL);
		PushString(0, (unsigned char*)(state->data + (state->m_blocksize >> 3) - (144 >> 3) + 10), ULL);
						
	/*	We finalize the compression on the last block								*/	
		if((state->messbitlen%state->m_blocksize) == 0){
			state->messbitlen = 0;
			state->CNT = 0;
		}
		state->padding = 1;
		Compress(state);
  	 }
  	else{
		unsigned char c = flip_bits(state->data[state->messbitlen >> 3]);
  	/*	Not enough room for one block : two blocks padding							*/
		if((state->messbitlen%8) != 0){
			c &= ~(0xff << (state->messbitlen%8));
			state->data[state->messbitlen >> 3] = flip_bits(c ^ (0x1 << (state->messbitlen % 8))); 
		}
		memset(state->data + (state->messbitlen >> 3) + 1, 0, (state->m_blocksize >> 3) - (state->messbitlen >> 3) - 1); 	
		if((state->messbitlen%8) == 0)
			state->data[(state->messbitlen >> 3)] = 0x80;

	/*	We finalize the compression on the last blocks (the first one)						*/	
		state->padding = 1;
		Compress(state);

	/*	Prepare the message length and the hash length								*/		
		memset(state->data, 0, (state->m_blocksize >> 3)); 	
		PushString(state->hashbitlen, (unsigned char*)(state->data + (state->m_blocksize >> 3) - (144 >> 3)), USINT);
		PushString(state->CNT, (unsigned char*)(state->data + (state->m_blocksize >> 3) - (144 >> 3) + 2), ULL);
		PushString(0, (unsigned char*)(state->data + (state->m_blocksize >> 3) - (144 >> 3) + 10), ULL);

	/*	We finalize the compression on the last blocks (the second one)						*/	
		state->padding = 1;
		state->messbitlen = 0;
		state->CNT = 0;
		Compress(state);
	}
	/*	We truncate the chaining variable to get the hash value							*/
	if(state->hashbitlen%8 == 0){
		memcpy(hashval, state->state, (state->hashbitlen)/8);  	
	}
	else{
		((unsigned char*)state->state)[((state->hashbitlen)/8)] = \
		((unsigned char*)state->state)[((state->hashbitlen)/8)] & (0xff << (8-(state->hashbitlen%8)));	
		memcpy(hashval, state->state, ((state->hashbitlen)/8) + 1);  			
	}

  	return SUCCESS;
}



HashReturn Hash(unsigned int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval) 
{ 
  HashReturn S; 
  hashState state; 
  S = Init(&state, hashbitlen); 
  if(S != SUCCESS) return S; 
  S = Update(&state, data, databitlen); 
  if(S != SUCCESS) return S; 
  return Final(&state, hashval); 
}

int crypto_hash_echo512_powerpc_pp32cv1(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  if (Hash(CRYPTO_BYTES * 8,in,inlen * 8,out) == SUCCESS) return 0;
  return -1;
}


