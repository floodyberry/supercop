/*------------------------------------------------------------------------------------ */
/* Implementation of the simple pipe ECHO hash function in its 256-bit outputs variant.*/
/* Optimized for ANSI C, 32-bit mode                                                   */
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

void PrintState(hashState *state)
{
	int i,j,k;
	for(j=0; j<4; j++) //col
	{
		for(i=0; i<4; i++) //row
		{
			printf ("row %d,col %d :",i,j);
			for(k=0; k<16; k++){
 				if(k%4 == 0){
  					printf(" ");
				}
				printf ("%02X", *((unsigned char*)state->state+16*(i+4*j)+k));
			}
			printf("\n");	
		}
	}
	printf("-----------------------------------\n");
}

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
	 	state->end_cv = ((2048-BLOCK256)/8)/sizeof(int);
  	else
	  	state->end_cv = ((2048-BLOCK512)/8)/sizeof(int);

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
		state->m_blocksize = BLOCK256;
	else
		state->m_blocksize = BLOCK512;

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

#ifdef SALT_OPTION
#define AESround1(s, a, b, c, d) do { \
  a = T0[ abyte(integer(s, 0)) ] ^ T1[ bbyte(integer(s, 1)) ] ^ T2[ cbyte(integer(s, 2)) ] ^ T3[ dbyte(integer(s, 3)) ] ^ CNT_r; \
  b = T0[ abyte(integer(s, 1)) ] ^ T1[ bbyte(integer(s, 2)) ] ^ T2[ cbyte(integer(s, 3)) ] ^ T3[ dbyte(integer(s, 0)) ] ^ (CNT_r >> 32); \
  c = T0[ abyte(integer(s, 2)) ] ^ T1[ bbyte(integer(s, 3)) ] ^ T2[ cbyte(integer(s, 0)) ] ^ T3[ dbyte(integer(s, 1)) ]; \
  d = T0[ abyte(integer(s, 3)) ] ^ T1[ bbyte(integer(s, 0)) ] ^ T2[ cbyte(integer(s, 1)) ] ^ T3[ dbyte(integer(s, 2)) ]; \
} while(0);
#define AESround2(s, a, b, c, d) do { \
  integer(s, 0) = T0[ abyte(a) ] ^ T1[ bbyte(b) ] ^ T2[ cbyte(c) ] ^ T3[ dbyte(d) ] ^ integer(state->SALT, 0); \
  integer(s, 1) = T0[ abyte(b) ] ^ T1[ bbyte(c) ] ^ T2[ cbyte(d) ] ^ T3[ dbyte(a) ] ^ integer(state->SALT, 1); \
  integer(s, 2) = T0[ abyte(c) ] ^ T1[ bbyte(d) ] ^ T2[ cbyte(a) ] ^ T3[ dbyte(b) ] ^ integer(state->SALT, 2); \
  integer(s, 3) = T0[ abyte(d) ] ^ T1[ bbyte(a) ] ^ T2[ cbyte(b) ] ^ T3[ dbyte(c) ] ^ integer(state->SALT, 3); \
} while(0);
#else
#define AESround1(s, a, b, c, d) do { \
  a = T0[ abyte(integer(s, 0)) ] ^ T1[ bbyte(integer(s, 1)) ] ^ T2[ cbyte(integer(s, 2)) ] ^ T3[ dbyte(integer(s, 3)) ] ^ CNT_r; \
  b = T0[ abyte(integer(s, 1)) ] ^ T1[ bbyte(integer(s, 2)) ] ^ T2[ cbyte(integer(s, 3)) ] ^ T3[ dbyte(integer(s, 0)) ] ^ (CNT_r >> 32); \
  c = T0[ abyte(integer(s, 2)) ] ^ T1[ bbyte(integer(s, 3)) ] ^ T2[ cbyte(integer(s, 0)) ] ^ T3[ dbyte(integer(s, 1)) ]; \
  d = T0[ abyte(integer(s, 3)) ] ^ T1[ bbyte(integer(s, 0)) ] ^ T2[ cbyte(integer(s, 1)) ] ^ T3[ dbyte(integer(s, 2)) ]; \
} while(0);
#define AESround2(s, a, b, c, d) do { \
  integer(s, 0) = T0[ abyte(a) ] ^ T1[ bbyte(b) ] ^ T2[ cbyte(c) ] ^ T3[ dbyte(d) ] ^ SALT_A; \
  integer(s, 1) = T0[ abyte(b) ] ^ T1[ bbyte(c) ] ^ T2[ cbyte(d) ] ^ T3[ dbyte(a) ] ^ SALT_B; \
  integer(s, 2) = T0[ abyte(c) ] ^ T1[ bbyte(d) ] ^ T2[ cbyte(a) ] ^ T3[ dbyte(b) ] ^ SALT_C; \
  integer(s, 3) = T0[ abyte(d) ] ^ T1[ bbyte(a) ] ^ T2[ cbyte(b) ] ^ T3[ dbyte(c) ] ^ SALT_D; \
} while(0);
#endif

#define WORD_ROUND(s, j, i) do {\
  register unsigned int a, b, c, d;\
  AESround1(s, a, b, c, d);\
  AESround2(s, a, b, c, d);\
  CNT_r++;     \
} while(0);

#define MDS(SA, SB, SC, SD) do { \
  unsigned int t0, t1, t2, t3, t4, t5, t6;\
  t4   = (integer(SA,0) ^ integer(SB,0));\
  t5   = (integer(SC,0) ^ integer(SD,0));\
  t6   = (integer(SA,0) ^ integer(SD,0));\
  t0   = t4 ^ t5;\
  t1   =(((t4 >> 7)&0x01010101)*27)  ^ ((t4 << 1)&0xfefefefe);\
  t2   =(((t5 >> 7)&0x01010101)*27)  ^ ((t5 << 1)&0xfefefefe);\
  t3   =(((t6 >> 7)&0x01010101)*27)  ^ ((t6 << 1)&0xfefefefe);\
  integer(SC,0)   ^= (t0 ^ t2);					\
  integer(SD,0)   ^= (t0 ^ t3);					\
  integer(SA,0)   ^= (t0 ^ t1);					\
  integer(SB,0)   ^= (t0 ^ t1 ^ t2 ^ t3);			\
} while(0);


#define BIG_SUB_WORDS(state) do{\
	WORD_ROUND((state->state)   , 0, 0);\
	WORD_ROUND((state->state+4) , 0, 1);\
	WORD_ROUND((state->state+8) , 0, 2);\
	WORD_ROUND((state->state+12), 0, 3);\
	WORD_ROUND((state->state+16), 1, 0);\
	WORD_ROUND((state->state+20), 1, 1);\
	WORD_ROUND((state->state+24), 1, 2);\
	WORD_ROUND((state->state+28), 1, 3);\
	WORD_ROUND((state->state+32), 2, 0);\
	WORD_ROUND((state->state+36), 2, 1);\
	WORD_ROUND((state->state+40), 2, 2);\
	WORD_ROUND((state->state+44), 2, 3);\
	WORD_ROUND((state->state+48), 3, 0);\
	WORD_ROUND((state->state+52), 3, 1);\
	WORD_ROUND((state->state+56), 3, 2);\
	WORD_ROUND((state->state+60), 3, 3);\
} while(0);

#define BIG_MIX_COLUMN(state) do{\
	MDS(state->state, state->state+4, state->state+8, state->state+12);\
	MDS(state->state+1, state->state+1+4, state->state+1+8, state->state+1+12);\
	MDS(state->state+2, state->state+2+4, state->state+2+8, state->state+2+12);\
	MDS(state->state+3, state->state+3+4, state->state+3+8, state->state+3+12);\
	\
	MDS(state->state+16, state->state+16+4, state->state+16+8, state->state+16+12);\
	MDS(state->state+16+1, state->state+16+1+4, state->state+16+1+8, state->state+16+1+12);\
	MDS(state->state+16+2, state->state+16+2+4, state->state+16+2+8, state->state+16+2+12);\
	MDS(state->state+16+3, state->state+16+3+4, state->state+16+3+8, state->state+16+3+12);\
	\
	MDS(state->state+16*2, state->state+16*2+4, state->state+16*2+8, state->state+16*2+12);\
	MDS(state->state+16*2+1, state->state+16*2+1+4, state->state+16*2+1+8, state->state+16*2+1+12);\
	MDS(state->state+16*2+2, state->state+16*2+2+4, state->state+16*2+2+8, state->state+16*2+2+12);\
	MDS(state->state+16*2+3, state->state+16*2+3+4, state->state+16*2+3+8, state->state+16*2+3+12);\
	\
	MDS(state->state+16*3, state->state+16*3+4, state->state+16*3+8, state->state+16*3+12);\
	MDS(state->state+16*3+1, state->state+16*3+1+4, state->state+16*3+1+8, state->state+16*3+1+12);\
	MDS(state->state+16*3+2, state->state+16*3+2+4, state->state+16*3+2+8, state->state+16*3+2+12);\
	MDS(state->state+16*3+3, state->state+16*3+3+4, state->state+16*3+3+8, state->state+16*3+3+12);\
} while(0);

#define WORD_SWAP(state, a, b) do { \
  unsigned int aa, bb;\
  aa = *(state->state+4*a);   *(state->state+4*a)   = *(state->state+4*b);    *(state->state+4*b)   = aa;\
  bb = *(state->state+4*a+1); *(state->state+4*a+1) = *(state->state+4*b+1);  *(state->state+4*b+1) = bb;\
  aa = *(state->state+4*a+2); *(state->state+4*a+2) = *(state->state+4*b+2);  *(state->state+4*b+2) = aa;\
  bb = *(state->state+4*a+3); *(state->state+4*a+3) = *(state->state+4*b+3);  *(state->state+4*b+3) = bb;\
} while(0); 

#define BIG_SHIFT_ROWS(state) do {\
	WORD_SWAP(state, 9,  13);\
	WORD_SWAP(state, 5,  13);\
	WORD_SWAP(state, 1,  13);\
	\
	WORD_SWAP(state, 2,  10);\
	WORD_SWAP(state, 6,  14);\
	\
	WORD_SWAP(state, 3,  15);\
	WORD_SWAP(state, 7,  15);\
	WORD_SWAP(state, 11, 15);\
} while(0);\


#define LOADmessage(state, data) do {\
	if(state->hashbitlen <= 256){\
		memcpy(state->state+state->end_cv, data, BLOCK256 >> 3);\
	}\
	else{\
		memcpy(state->state+state->end_cv, data, BLOCK512 >> 3);\
	}\
}while(0);

#define XOR_MEM(A, B, size) do { \
  	unsigned int i;\
  	for(i=0; i<size; i++)\
		((unsigned int*)A)[i] ^=  ((unsigned int*)B)[i];\
} while(0); 

/*********************************************************************/
#ifdef ECHO_DP
#define FEEDforward(state, oldcv) do{\
	if(state->end_cv == ((2048-BLOCK256)/8)/sizeof(int)){\
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
#endif
#ifdef ECHO_SP
#define FEEDforward(state, oldcv) do{\
	if(state->end_cv == ((2048-BLOCK256)/8)/sizeof(int)){\
		XOR_MEM(state->state, 			  state->state + 2*state->end_cv,   2*state->end_cv);\
		XOR_MEM(state->state + 2*2*state->end_cv, state->state + 3*2*state->end_cv, 2*state->end_cv);\
		XOR_MEM(state->state, 			  state->state + 2*2*state->end_cv, 2*state->end_cv);\
		XOR_MEM(state->state, 			  oldcv, 			    2*state->end_cv);\
		XOR_MEM(state->state, 			  state->state+state->end_cv, 	    state->end_cv);\
	}\
	else{\
		XOR_MEM(state->state, 			state->state + state->end_cv, 	state->end_cv);\
		XOR_MEM(state->state + 2*state->end_cv, state->state + 3*state->end_cv, state->end_cv);\
		XOR_MEM(state->state, 			state->state + 2*state->end_cv, state->end_cv);\
		XOR_MEM(state->state, 			oldcv, 				state->end_cv);\
	}\
}while(0);
#endif

/*********************************************************************/
#ifdef ECHO_DP
#define SAVEcv(state, oldcv) do {\
	memcpy(oldcv, state, (state->end_cv)*sizeof(int)); \
	if(state->end_cv == ((2048-BLOCK256)/8)/sizeof(int)){\
		XOR_MEM(oldcv, state->state + state->end_cv, 	state->end_cv);\
		XOR_MEM(oldcv, state->state + 2*state->end_cv, 	state->end_cv);\
		XOR_MEM(oldcv, state->state + 3*state->end_cv, 	state->end_cv);\
	}\
	else{\
		XOR_MEM(oldcv, state->state + state->end_cv, 	state->end_cv);\
	}\
} while(0);
#endif
#ifdef ECHO_SP
#define SAVEcv(state, oldcv) do {\
	if(state->end_cv == ((2048-BLOCK256)/8)/sizeof(int)){\
		memcpy(oldcv, state, (2*state->end_cv)*sizeof(int)); \
		XOR_MEM(oldcv, state->state + 2*state->end_cv, 	 2*state->end_cv);\
		XOR_MEM(oldcv, state->state + 2*2*state->end_cv, 2*state->end_cv);\
		XOR_MEM(oldcv, state->state + 3*2*state->end_cv, 2*state->end_cv);\
	}\
	else{\
		memcpy(oldcv, state, (state->end_cv)*sizeof(int)); \
		XOR_MEM(oldcv, state->state + state->end_cv, 	state->end_cv);\
		XOR_MEM(oldcv, state->state + 2*state->end_cv, 	state->end_cv);\
		XOR_MEM(oldcv, state->state + 3*state->end_cv, 	state->end_cv);\
	}\
} while(0);
#endif
/*********************************************************************/

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
	unsigned int oldcv[((2048-BLOCK512)/8)/sizeof(int)];
	unsigned int i;
	unsigned long long c0, c1;

 	/*	Loading the message in the state					*/
	LOADmessage(state, state->data);

	/*	Preparing the Feedforward operation					*/
	SAVEcv(state, oldcv);
	
	r = state->r;	
	state->CNT += (1-state->padding) * state->m_blocksize + state->padding * state->messbitlen;

	CNT_r = state->CNT;

	if(endian == ET_BIG_ENDIAN){	
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

	if(endian == ET_BIG_ENDIAN){	
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



HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval) 
{ 
  HashReturn S; 
  hashState state; 
  S = Init(&state, hashbitlen); 
  if(S != SUCCESS) return S; 
  S = Update(&state, data, databitlen); 
  if(S != SUCCESS) return S; 
  return Final(&state, hashval); 
}


int crypto_hash_echosp256_generic_opt32(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  if (Hash(CRYPTO_BYTES * 8,in,inlen * 8,out) == SUCCESS) return 0;
  return -1;
}

