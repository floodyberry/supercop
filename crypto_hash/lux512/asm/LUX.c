/*	Reference implementation of hash family LUX 	
	Author: Ivica Nikolic, University of Luxembourg
*/

#include <stdio.h>
#include <string.h>
#include "LUX.h"

/* Table look-up */
#define TL(table,input,shift) table[(input >> shift) & 0xff]

/* Update core element for LUX-224 and LUX-256 */
#define UPVAR32(nv,z1,ov,z2,in,l0,l1,l2,l3,add)									\
	nv##in##z1=  TL(Te0,ov##l0##z2,24) ^ TL(Te1,ov##l1##z2,16) ^ TL(Te2,ov##l2##z2,8)  ^ TL(Te3,ov##l3##z2,0)##add; 

/* Update core element for LUX-384 and LUX-512 */
#define UPVAR64(nv,z1,ov,z2,in,l0,l1,l2,l3,l4,l5,l6,l7,add)									\
	nv##in##z1= TL(T640,ov##l0##z2,56) ^ TL(T641,ov##l1##z2,48) ^ TL(T642,ov##l2##z2,40) ^ TL(T643,ov##l3##z2,32) ^ \
				TL(T644,ov##l4##z2,24) ^ TL(T645,ov##l5##z2,16) ^ TL(T646,ov##l6##z2, 8) ^ TL(T647,ov##l7##z2,0)##add; 

/* One round for optimized LUX-224 and LUX-256.  */
#define ONEROUND(offSet,t,z1,s,z2,bf, p,data)					\
	do {														\
		s##0##z2^=*(u32 *)(data+offSet);						\
		bf[(p+13)%16]^=*(u32 *)(data+offSet);					\
		UPVAR32(t,z1,s,z2,0,0,1,3,4,^0x2ad01c64)				\
		UPVAR32(t,z1,s,z2,1,1,2,4,5,)							\
		UPVAR32(t,z1,s,z2,2,2,3,5,6,)							\
		UPVAR32(t,z1,s,z2,3,3,4,6,7,)							\
		UPVAR32(t,z1,s,z2,4,4,5,7,0,)							\
		UPVAR32(t,z1,s,z2,5,5,6,0,1,)							\
		UPVAR32(t,z1,s,z2,6,6,7,1,2,)							\
		UPVAR32(t,z1,s,z2,7,7,0,2,3,)							\
		bf[p%16]^=t##0##z1;			bf[(p+1)%16]^=t##1##z1;		\
		bf[(p+2)%16]^=t##2##z1;		bf[(p+3)%16]^=t##3##z1;		\
		bf[(p+4)%16]^=t##4##z1;		bf[(p+5)%16]^=t##5##z1;		\
		bf[(p+6)%16]^=t##6##z1;		bf[(p+7)%16]^=t##7##z1;		\
		t##7##z1^=bf[(p+11)%16];								\
	} while (0)
		
/* One round for optimized LUX-384 and LUX-512.  */
#define ONEROUND64(offSet,t,z1,s,z2,bf,p,data)				\
	do {													\
		s##0##z2^=*(u64 *)(data+offSet);					\
		bf[(p+13)%16]^=*(u64 *)(data+offSet);				\
		UPVAR64(t,z1,s,z2,0,0,1,2,3,4,5,6,7,^0x2ad01c64);	\
		UPVAR64(t,z1,s,z2,1,1,2,3,4,5,6,7,0,);				\
		UPVAR64(t,z1,s,z2,2,2,3,4,5,6,7,0,1,);				\
		UPVAR64(t,z1,s,z2,3,3,4,5,6,7,0,1,2,);				\
		UPVAR64(t,z1,s,z2,4,4,5,6,7,0,1,2,3,);				\
		UPVAR64(t,z1,s,z2,5,5,6,7,0,1,2,3,4,);				\
		UPVAR64(t,z1,s,z2,6,6,7,0,1,2,3,4,5,);				\
		UPVAR64(t,z1,s,z2,7,7,0,1,2,3,4,5,6,);				\
		bf[p%16]^=t##0##z1;			bf[(p+1)%16]^=t##1##z1;	\
		bf[(p+2)%16]^=t##2##z1;		bf[(p+3)%16]^=t##3##z1;	\
		bf[(p+4)%16]^=t##4##z1;		bf[(p+5)%16]^=t##5##z1;	\
		bf[(p+6)%16]^=t##6##z1;		bf[(p+7)%16]^=t##7##z1;	\
		t##7##z1^=bf[(p+11)%16];							\
	} while (0)

/* One round of LUX-256 */
void compressSmallChunk(hashState *st, const BitSequence *data){	
	int i; 
	u32 temp;
	u32 t0,t1,t2,t3,t4,t5,t6,t7;	
	
	/* Addition of the message block to the buffer and the core  */
	st->core[0]^=*(u32 *)(data+0);
	st->buffer[0]^=*( u32 *)(data+0);	

    /* Core transformation G  */	
/*
	UPVAR32(t,,st->core[,],0,0,1,3,4,^0x2ad01c64);
	UPVAR32(t,,st->core[,],1,1,2,4,5,);
	UPVAR32(t,,st->core[,],2,2,3,5,6,);
	UPVAR32(t,,st->core[,],3,3,4,6,7,);
	UPVAR32(t,,st->core[,],4,4,5,7,0,);
	UPVAR32(t,,st->core[,],5,5,6,0,1,);
	UPVAR32(t,,st->core[,],6,6,7,1,2,);
	UPVAR32(t,,st->core[,],7,7,0,2,3,);  
*/

 	t0= Te0[(st->core[0] >> 24) & 0xff] ^ Te1[(st->core[1] >> 16) & 0xff] ^ Te2[(st->core[3] >> 8) & 0xff] ^ Te3[(st->core[4] >> 0) & 0xff]^0x2ad01c64;;
	t1= Te0[(st->core[1] >> 24) & 0xff] ^ Te1[(st->core[2] >> 16) & 0xff] ^ Te2[(st->core[4] >> 8) & 0xff] ^ Te3[(st->core[5] >> 0) & 0xff];;
	t2= Te0[(st->core[2] >> 24) & 0xff] ^ Te1[(st->core[3] >> 16) & 0xff] ^ Te2[(st->core[5] >> 8) & 0xff] ^ Te3[(st->core[6] >> 0) & 0xff];;
	t3= Te0[(st->core[3] >> 24) & 0xff] ^ Te1[(st->core[4] >> 16) & 0xff] ^ Te2[(st->core[6] >> 8) & 0xff] ^ Te3[(st->core[7] >> 0) & 0xff];;
	t4= Te0[(st->core[4] >> 24) & 0xff] ^ Te1[(st->core[5] >> 16) & 0xff] ^ Te2[(st->core[7] >> 8) & 0xff] ^ Te3[(st->core[0] >> 0) & 0xff];;
	t5= Te0[(st->core[5] >> 24) & 0xff] ^ Te1[(st->core[6] >> 16) & 0xff] ^ Te2[(st->core[0] >> 8) & 0xff] ^ Te3[(st->core[1] >> 0) & 0xff];;
	t6= Te0[(st->core[6] >> 24) & 0xff] ^ Te1[(st->core[7] >> 16) & 0xff] ^ Te2[(st->core[1] >> 8) & 0xff] ^ Te3[(st->core[2] >> 0) & 0xff];;
	t7= Te0[(st->core[7] >> 24) & 0xff] ^ Te1[(st->core[0] >> 16) & 0xff] ^ Te2[(st->core[2] >> 8) & 0xff] ^ Te3[(st->core[3] >> 0) & 0xff];;
	/* Buffer transformation F  */
	temp=st->buffer[15];
	for(i=15;i>0;i--)
		st->buffer[i]=st->buffer[i-1];
	st->buffer[0]=temp;

	/* Feedback from the core to the buffer. */
	st->buffer[4]^=t0; st->buffer[5]^=t1; st->buffer[6]^=t2; st->buffer[7]^=t3;
	st->buffer[8]^=t4; st->buffer[9]^=t5; st->buffer[10]^=t6; st->buffer[11]^=t7;	

	/* Feedback from the buffer to the core	 */	
	t7^=st->buffer[15];

	st->core[0]=t0; st->core[1]=t1; st->core[2]=t2; st->core[3]=t3;
	st->core[4]=t4; st->core[5]=t5; st->core[6]=t6; st->core[7]=t7;	
}

/* One round of LUX-512 */
void compressSmallChunk64(hashState *st, const BitSequence *data){

	int i;
	u64 temp;
	u64 tt0,tt1,tt2,tt3,tt4,tt5,tt6,tt7;

	st->core64[0]^=*(u64 *)(data+0);
	st->buffer64[0]^=*(u64 *)(data+0);	

/*
	UPVAR64(tt,,st->core64[,],0,0,1,2,3,4,5,6,7,^0x2ad01c64);
	UPVAR64(tt,,st->core64[,],1,1,2,3,4,5,6,7,0,);
	UPVAR64(tt,,st->core64[,],2,2,3,4,5,6,7,0,1,);
	UPVAR64(tt,,st->core64[,],3,3,4,5,6,7,0,1,2,);
	UPVAR64(tt,,st->core64[,],4,4,5,6,7,0,1,2,3,);
	UPVAR64(tt,,st->core64[,],5,5,6,7,0,1,2,3,4,);
	UPVAR64(tt,,st->core64[,],6,6,7,0,1,2,3,4,5,);
	UPVAR64(tt,,st->core64[,],7,7,0,1,2,3,4,5,6,);
*/
	tt0= T640[(st->core64[0] >> 56) & 0xff] ^ T641[(st->core64[1] >> 48) & 0xff] ^ T642[(st->core64[2] >> 40) & 0xff] ^ T643[(st->core64[3] >> 32) & 0xff] ^ T644[(st->core64[4] >> 24) & 0xff] ^ T645[(st->core64[5] >> 16) & 0xff] ^ T646[(st->core64[6] >> 8) & 0xff] ^ T647[(st->core64[7] >> 0) & 0xff]^0x2ad01c64;;
 tt1= T640[(st->core64[1] >> 56) & 0xff] ^ T641[(st->core64[2] >> 48) & 0xff] ^ T642[(st->core64[3] >> 40) & 0xff] ^ T643[(st->core64[4] >> 32) & 0xff] ^ T644[(st->core64[5] >> 24) & 0xff] ^ T645[(st->core64[6] >> 16) & 0xff] ^ T646[(st->core64[7] >> 8) & 0xff] ^ T647[(st->core64[0] >> 0) & 0xff];;
 tt2= T640[(st->core64[2] >> 56) & 0xff] ^ T641[(st->core64[3] >> 48) & 0xff] ^ T642[(st->core64[4] >> 40) & 0xff] ^ T643[(st->core64[5] >> 32) & 0xff] ^ T644[(st->core64[6] >> 24) & 0xff] ^ T645[(st->core64[7] >> 16) & 0xff] ^ T646[(st->core64[0] >> 8) & 0xff] ^ T647[(st->core64[1] >> 0) & 0xff];;
 tt3= T640[(st->core64[3] >> 56) & 0xff] ^ T641[(st->core64[4] >> 48) & 0xff] ^ T642[(st->core64[5] >> 40) & 0xff] ^ T643[(st->core64[6] >> 32) & 0xff] ^ T644[(st->core64[7] >> 24) & 0xff] ^ T645[(st->core64[0] >> 16) & 0xff] ^ T646[(st->core64[1] >> 8) & 0xff] ^ T647[(st->core64[2] >> 0) & 0xff];;
 tt4= T640[(st->core64[4] >> 56) & 0xff] ^ T641[(st->core64[5] >> 48) & 0xff] ^ T642[(st->core64[6] >> 40) & 0xff] ^ T643[(st->core64[7] >> 32) & 0xff] ^ T644[(st->core64[0] >> 24) & 0xff] ^ T645[(st->core64[1] >> 16) & 0xff] ^ T646[(st->core64[2] >> 8) & 0xff] ^ T647[(st->core64[3] >> 0) & 0xff];;
 tt5= T640[(st->core64[5] >> 56) & 0xff] ^ T641[(st->core64[6] >> 48) & 0xff] ^ T642[(st->core64[7] >> 40) & 0xff] ^ T643[(st->core64[0] >> 32) & 0xff] ^ T644[(st->core64[1] >> 24) & 0xff] ^ T645[(st->core64[2] >> 16) & 0xff] ^ T646[(st->core64[3] >> 8) & 0xff] ^ T647[(st->core64[4] >> 0) & 0xff];;
 tt6= T640[(st->core64[6] >> 56) & 0xff] ^ T641[(st->core64[7] >> 48) & 0xff] ^ T642[(st->core64[0] >> 40) & 0xff] ^ T643[(st->core64[1] >> 32) & 0xff] ^ T644[(st->core64[2] >> 24) & 0xff] ^ T645[(st->core64[3] >> 16) & 0xff] ^ T646[(st->core64[4] >> 8) & 0xff] ^ T647[(st->core64[5] >> 0) & 0xff];;
 tt7= T640[(st->core64[7] >> 56) & 0xff] ^ T641[(st->core64[0] >> 48) & 0xff] ^ T642[(st->core64[1] >> 40) & 0xff] ^ T643[(st->core64[2] >> 32) & 0xff] ^ T644[(st->core64[3] >> 24) & 0xff] ^ T645[(st->core64[4] >> 16) & 0xff] ^ T646[(st->core64[5] >> 8) & 0xff] ^ T647[(st->core64[6] >> 0) & 0xff];;
	
	temp=st->buffer64[15];
	for(i=15;i>0;i--)
		st->buffer64[i]=st->buffer64[i-1];
	st->buffer64[0]=temp;

	st->buffer64[4]^=tt0; st->buffer64[5]^=tt1; st->buffer64[6]^=tt2; st->buffer64[7]^=tt3;
	st->buffer64[8]^=tt4; st->buffer64[9]^=tt5; st->buffer64[10]^=tt6; st->buffer64[11]^=tt7;	
	
	tt7^=st->buffer64[15];

	st->core64[0]=tt0;st->core64[1]=tt1;st->core64[2]=tt2;st->core64[3]=tt3;
	st->core64[4]=tt4;st->core64[5]=tt5;st->core64[6]=tt6;st->core64[7]=tt7;
}

/* 16 rounds are processed. This way, the rotations of the buffer can be avoided.   */
/*
void compressBigChunk(hashState *st, const BitSequence *data){
	unsigned long int i;
	u32 ivo[16];
	u32 s0,s1,s2,s3,s4,s5,s6,s7;
	u32 t0,t1,t2,t3,t4,t5,t6,t7;

	for(i=0;i<16;i++){
		ivo[i]=st->buffer[i];		
	}

	ONEROUND(0 ,t,,st->core[,],ivo,3,data);					
	ONEROUND(4 ,s,,t,,ivo,2,data);		
	ONEROUND(8 ,t,,s,,ivo,1,data);		
	ONEROUND(12,s,,t,,ivo,0,data);		
	ONEROUND(16,t,,s,,ivo,15,data);	
	ONEROUND(20,s,,t,,ivo,14,data);	
	ONEROUND(24,t,,s,,ivo,13,data);	
	ONEROUND(28,s,,t,,ivo,12,data);	
	ONEROUND(32,t,,s,,ivo,11,data);	
	ONEROUND(36,s,,t,,ivo,10,data);	
	ONEROUND(40,t,,s,,ivo,9,data);		
	ONEROUND(44,s,,t,,ivo,8,data);		
	ONEROUND(48,t,,s,,ivo,7,data);		
	ONEROUND(52,s,,t,,ivo,6,data);		
	ONEROUND(56,t,,s,,ivo,5,data);		
	ONEROUND(60,st->core[,],t,,ivo,4,data);		

	for(i=0;i<16;i++){
		st->buffer[i]=ivo[i];
	}
}
*/

/*	16 rounds for LUX-384 and LUX-512 are processed. 
	This way, the rotations of the buffer can be avoided. 
 */
/*
void compressBigChunk64(hashState *st, const BitSequence *data){
	unsigned long int i;
	u64 ivo[16];
	u64 s0,s1,s2,s3,s4,s5,s6,s7;
	u64 t0,t1,t2,t3,t4,t5,t6,t7;

	for(i=0;i<16;i++){
		ivo[i]=st->buffer64[i];		
	}

	ONEROUND64(0 ,t,,st->core64[,],ivo,3,data);		
	ONEROUND64(8 ,s,,t,,ivo,2,data);		
	ONEROUND64(16,t,,s,,ivo,1,data);		
	ONEROUND64(24,s,,t,,ivo,0,data);		
	ONEROUND64(32,t,,s,,ivo,15,data);	
	ONEROUND64(40,s,,t,,ivo,14,data);	
	ONEROUND64(48,t,,s,,ivo,13,data);	
	ONEROUND64(56,s,,t,,ivo,12,data);	
	ONEROUND64(64,t,,s,,ivo,11,data);	
	ONEROUND64(72,s,,t,,ivo,10,data);	
	ONEROUND64(80,t,,s,,ivo,9,data);		
	ONEROUND64(88,s,,t,,ivo,8,data);		
	ONEROUND64(96,t,,s,,ivo,7,data);		
	ONEROUND64(104,s,,t,,ivo,6,data);		
	ONEROUND64(112,t,,s,,ivo,5,data);		
	ONEROUND64(120,st->core64[,],t,,ivo,4,data);		

	for(i=0;i<16;i++){
		st->buffer64[i]=ivo[i];
	}
}
*/
HashReturn Init(hashState *state, int hashbitlen){
	int i;

	state->hashbitlen=hashbitlen;
	if(!((hashbitlen==224)||(hashbitlen==256)||(hashbitlen==384)||(hashbitlen==512)))
		return BAD_HASHBITLEN;
		
	for(i=0;i<8;i++){
		state->core[i]=0;
		state->core64[i]=0;
	}
	for(i=0;i<16;i++){
		state->buffer[i]=0;
		state->buffer64[i]=0;
	}
	for(i=0;i<8;i++)
		state->remSeq[i]=0;

	return SUCCESS;
}

HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen){

	int i;
	unsigned long long doneLength=0;
	unsigned long long totLength=0;
	
	state->databitlen=databitlen;
	if(state->hashbitlen<=256){		
		/*	First compress the big chunks of 64 bytes each 
			in 16 rounds. This way the rotations of the 
			buffer are costless.
		 */
		/*
		while(doneLength+64<=databitlen/8){							
		//	compressBigChunk(state,data+doneLength);
			doneLength+=64;			
		}		
		*/
		totLength=databitlen/8;
		doneLength=totLength-(totLength%64);
		if(doneLength>=64)			
			 LUX25664(&Te0,state->core,state->buffer,data,doneLength);	

		/*	The rest of the input is compressed.  */
		while(doneLength+4<=databitlen/8){		
			compressSmallChunk(state,data+doneLength);			
			doneLength+=4;			
		}		
	}
	else{	
		/*	First compress the big chunks of 128 bytes each
			in 16 rounds. This way the rotations of the 
			buffer are costless.
		 */
		/*
		while(doneLength+128<=databitlen/8){		
			compressBigChunk64(state,data+doneLength);			
			doneLength+=128;		
		}
		*/
		totLength=databitlen/8;
		doneLength=totLength-(totLength%128);
		if(doneLength>=128)			
			LUX51264(&T640,state->core64,state->buffer64,data,doneLength);		
		 

		/* The rest of the input is compressed.  */
		while(doneLength+8<=databitlen/8){		
			compressSmallChunk64(state,data+doneLength);		
			doneLength+=8;
		}

	}
	
	/* The remaining input is stored for further processing in Final().	 */
	state->lenRemSeq=databitlen-8*doneLength;	
	for(i=0;i<state->lenRemSeq/8+(state->lenRemSeq%8>0);i++){
			state->remSeq[i]=data[doneLength+i];		
	}

	return SUCCESS;
}

HashReturn Final(hashState *state, BitSequence *hashval){
	int i;
	BitSequence empty[128];	

	/*	If the block is not full then add 1 and a number of 0s.	*/
	if(state->lenRemSeq>0){		
		state->remSeq[state->lenRemSeq>>3] &=(0xff)<<(8-(state->lenRemSeq & 7));
		state->remSeq[state->lenRemSeq>>3] ^=(0x01)<<(7-((state->lenRemSeq) & 7));	
	}
	/*	Else create new block with 1 and 31 zeros. */
	else{
		state->remSeq[0]=0x80;
	}

	/* Hash the padded block. */
	if(state->hashbitlen<=256){		
		compressSmallChunk(state,state->remSeq);		
	}
	else{		
		compressSmallChunk64(state,state->remSeq);		
	}
	
	/*	Additional block(s) that contain the input 
		length is(are) created and compressed. For LUX-224 and LUX-256, 
		the message blocks are only 32 bits, therefore the message length 
		represantion takes two block. 
	*/
	for(i=0;i<8;i++)
		empty[i]   = ( (state->databitlen)>>(56-8*i) ) & 0xff;					
	if(state->hashbitlen<=256){
		compressSmallChunk(state,empty);
		compressSmallChunk(state,empty+4);
	}	
	else{		
		compressSmallChunk64(state,empty);
	}

	/*	16 blank rounds are iterated. 
		The input for the blank rounds are blocks with 0s.
		Output is value of the core element C_3.
	 */
	memset(empty, 0, 128);
	if(state->hashbitlen<=256){
		for(i=0;i<16;i++){
			compressSmallChunk(state,empty);		
		}
		for(i=0;i<state->hashbitlen/32;i++){
			compressSmallChunk(state,empty);				
				*(u32 *)(hashval + 4*i)=*(u32 *)(state->core + 3);		
		}
	}
	else{
		for(i=0;i<16;i++){
			compressSmallChunk64(state,empty);			
		}
		for(i=0;i<state->hashbitlen/64;i++){
			compressSmallChunk64(state,empty);
			*(u64 *)(hashval + 8*i)=*(u64 *)(state->core64 + 3);
		}
	}

	return SUCCESS;
}

HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval){
	hashState Temp;

	if(Init(&Temp,hashbitlen)==SUCCESS){	
		Update(&Temp,data,databitlen );	
		Final(&Temp,hashval);
		return  SUCCESS;
	}
	else return FAIL;
}

