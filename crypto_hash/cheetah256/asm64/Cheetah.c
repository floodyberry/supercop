#include "Cheetah.h"

/* Update of the internal variables for Cheetah-256 */
#define UPVAR32(nv,ov,in,a,l0,l1,l2,l3)									\
	nv##in=  TL(Te0,ov##l0,24) ^ TL(Te1,ov##l1,16) ^ TL(Te2,ov##l2,8)  ^ TL(Te3,ov##l3,0) ^ a; \

/* Update of the internal variables for Message Expansion*/
#define UPVAR64(nv,ov,in,l0,l1,l2,l3,l4,l5,l6,l7)									\
	nv##in=  TL(T644,ov##l0,56) ^ TL(T645,ov##l1,48) ^ TL(T646,ov##l2,40)			\
			^TL(T647,ov##l3,32) ^ TL(T640,ov##l4,24) ^ TL(T641,ov##l5,16)			\
			^TL(T642,ov##l6, 8) ^ TL(T643,ov##l7, 0) ;

#define TL(table,input,shift) table[(input >> shift) & 0xff]

/* Update of the internal variables for Cheetah-512 */
#define UPVAR(nv,ov,in,add,l0,l1,l2,l3,l4,l5,l6,l7)									\
	nv##in=  TL(T640,ov##l0,56) ^ TL(T641,ov##l1,48) ^ TL(T642,ov##l2,40)			\
			^TL(T643,ov##l3,32) ^ TL(T644,ov##l4,24) ^ TL(T645,ov##l5,16)			\
			^TL(T646,ov##l6, 8) ^ TL(T647,ov##l7, 0) ^ add;

/* One round for Cheetah-256 */
#define ONEROUND32(nv,ov,a0,a1,a2,a3,a4,a5,a6,a7,HL)												\
  do {																								\
	UPVAR32(nv,ov,0,HL##32(a0),0,1,3,4);	UPVAR32(nv,ov,1,HL##32(a1),1,2,4,5);					\
	UPVAR32(nv,ov,2,HL##32(a2),2,3,5,6);	UPVAR32(nv,ov,3,HL##32(a3),3,4,6,7);					\
	UPVAR32(nv,ov,4,HL##32(a4),4,5,7,0);	UPVAR32(nv,ov,5,HL##32(a5),5,6,0,1);					\
	UPVAR32(nv,ov,6,HL##32(a6),6,7,1,2);	UPVAR32(nv,ov,7,HL##32(a7),7,0,2,3);					\
  } while (0)

/* One round for Cheetah-512 */
#define ONEROUND(nv,ov,a0,a1,a2,a3,a4,a5,a6,a7)																		\
  do {																						\
    UPVAR(nv,ov,0,a0,0,1,2,3,4,5,6,7);	UPVAR(nv,ov,1,a1,1,2,3,4,5,6,7,0);					\
	UPVAR(nv,ov,2,a2,2,3,4,5,6,7,0,1);	UPVAR(nv,ov,3,a3,3,4,5,6,7,0,1,2);					\
    UPVAR(nv,ov,4,a4,4,5,6,7,0,1,2,3);	UPVAR(nv,ov,5,a5,5,6,7,0,1,2,3,4);					\
	UPVAR(nv,ov,6,a6,6,7,0,1,2,3,4,5);	UPVAR(nv,ov,7,a7,7,0,1,2,3,4,5,6);					\
  } while (0)

/* One round for the message expansion for Cheetah-512.
 * All the words have 64 bits. */ 
#define ONEROUND64S(a,c,r)		\
	do {		\
		UPVAR64(c,a, 0, 0, 1, 2, 3, 5, 6, 7, 8);	\
		c##0^=	  (T640[4*r]  &0xff00000000000000ULL)  ^	\
			  (T641[4*r+1]&0x00ff000000000000ULL)^		\
			  (T642[4*r+2]&0x0000ff0000000000ULL)^		\
			  (T643[4*r+3]&0x000000ff00000000ULL);		\
		UPVAR64(c,a, 1, 1, 2, 3, 4, 6, 7, 8, 9);	 \
		UPVAR64(c,a, 2, 2, 3, 4, 5, 7, 8, 9,10);  UPVAR64(c,a, 3, 3, 4, 5, 6, 8, 9,10,11); \
		UPVAR64(c,a, 4, 4, 5, 6, 7, 9,10,11,12);  UPVAR64(c,a, 5, 5, 6, 7, 8,10,11,12,13); \
		UPVAR64(c,a, 6, 6, 7, 8, 9,11,12,13,14);  UPVAR64(c,a, 7, 7, 8, 9,10,12,13,14,15); \
		UPVAR64(c,a, 8, 8, 9,10,11,13,14,15, 0);  UPVAR64(c,a, 9, 9,10,11,12,14,15, 0, 1); \
		UPVAR64(c,a,10,10,11,12,13,15, 0, 1, 2);  UPVAR64(c,a,11,11,12,13,14, 0, 1, 2, 3); \
		UPVAR64(c,a,12,12,13,14,15, 1, 2, 3, 4);  UPVAR64(c,a,13,13,14,15, 0, 2, 3, 4, 5); \
		UPVAR64(c,a,14,14,15, 0, 1, 3, 4, 5, 6);  UPVAR64(c,a,15,15, 0, 1, 2, 4, 5, 6, 7 ); \
	} while (0)

#define H32(a) ((u32)(a  >> 32))
#define L32(a) ((u32)(a & 0xffffffff))

/* Compression function of Cheetah-512  */
void compressCheetah64(hashState *state, const BitSequence *data, u64 blockCounter){
	u64 a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
	u64 c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15;	
	u64 ss0,ss1,ss2,ss3,ss4,ss5,ss6,ss7,tt0,tt1,tt2,tt3,tt4,tt5,tt6,tt7;

	/* Adding the block counter	 */
	state->core64[0]^=blockCounter; 
	
	a0 = *(u64 *)(data+ 0);	a1 = *(u64 *)(data+ 8);  
	a2 = *(u64 *)(data+ 16);	a3 = *(u64 *)(data+ 24);
	a4 = *(u64 *)(data+32);	a5 = *(u64 *)(data+40);  
	a6 = *(u64 *)(data+ 48);	a7 = *(u64 *)(data+ 56);
	a8 = *(u64 *)(data+64);	a9 = *(u64 *)(data+72);  
	a10= *(u64 *)(data+ 80);	a11= *(u64 *)(data+ 88);
	a12= *(u64 *)(data+96);	a13= *(u64 *)(data+104); 
	a14= *(u64 *)(data+112);	a15= *(u64 *)(data+120);

	ss0=state->core64[0]^a0;ss1=state->core64[1]^a1;
	ss2=state->core64[2]^a2;ss3=state->core64[3]^a3;
	ss4=state->core64[4]^a4;ss5=state->core64[5]^a5;
	ss6=state->core64[6]^a6;ss7=state->core64[7]^a7;

	/* rounds 1-11: */
	ONEROUND(tt,ss,a8,a9,a10,a11,a12,a13,a14,a15);
	ONEROUND64S(a,c,1);
	ONEROUND(ss,tt,c0,c1,c2,c3,c4,c5,c6,c7);	
	ONEROUND(tt,ss,c8,c9,c10,c11,c12,c13,c14,c15);
	ONEROUND64S(c,a,2);
	ONEROUND(ss,tt,a0,a1,a2,a3,a4,a5,a6,a7); 	
	ONEROUND(tt,ss,a8,a9,a10,a11,a12,a13,a14,a15);	
	ONEROUND64S(a,c,3);
	ONEROUND(ss,tt,c0,c1,c2,c3,c4,c5,c6,c7);	
	ONEROUND(tt,ss,c8,c9,c10,c11,c12,c13,c14,c15);	
	ONEROUND64S(c,a,4);
	ONEROUND(ss,tt,a0,a1,a2,a3,a4,a5,a6,a7);	
	ONEROUND(tt,ss,a8,a9,a10,a11,a12,a13,a14,a15);	
	ONEROUND64S(a,c,5);
	ONEROUND(ss,tt,c0,c1,c2,c3,c4,c5,c6,c7);	
	ONEROUND(tt,ss,c8,c9,c10,c11,c12,c13,c14,c15);

	/* round 12 + the addition of the previous hash value (feedforward)   */
	state->core64[0] ^= TL(T640,tt0,56)/* T640[tt0 >> 56]*/ ^ T641[(tt1 >> 48) & 0xff]^ T642[(tt2 >> 40) & 0xff]^ T643[(tt3 >> 32) & 0xff]^ T644[(tt4 >> 24) & 0xff]^T645[(tt5 >> 16) & 0xff] ^ T646[(tt6 >>  8) & 0xff] ^ T647[tt7 & 0xff];
	state->core64[1] ^= T640[tt1 >> 56] ^ T641[(tt2 >> 48) & 0xff]^ T642[(tt3 >> 40) & 0xff]^ T643[(tt4 >> 32) & 0xff]^ T644[(tt5 >> 24) & 0xff]^T645[(tt6 >> 16) & 0xff] ^ T646[(tt7 >>  8) & 0xff] ^ T647[tt0 & 0xff];	
	state->core64[2] ^= T640[tt2 >> 56] ^ T641[(tt3 >> 48) & 0xff]^ T642[(tt4 >> 40) & 0xff]^ T643[(tt5 >> 32) & 0xff]^ T644[(tt6 >> 24) & 0xff]^T645[(tt7 >> 16) & 0xff] ^ T646[(tt0 >>  8) & 0xff] ^ T647[tt1 & 0xff];
	state->core64[3] ^= T640[tt3 >> 56] ^ T641[(tt4 >> 48) & 0xff]^ T642[(tt5 >> 40) & 0xff]^ T643[(tt6 >> 32) & 0xff]^ T644[(tt7 >> 24) & 0xff]^T645[(tt0 >> 16) & 0xff] ^ T646[(tt1 >>  8) & 0xff] ^ T647[tt2 & 0xff];
	state->core64[4] ^= T640[tt4 >> 56] ^ T641[(tt5 >> 48) & 0xff]^ T642[(tt6 >> 40) & 0xff]^ T643[(tt7 >> 32) & 0xff]^ T644[(tt0 >> 24) & 0xff]^T645[(tt1 >> 16) & 0xff] ^ T646[(tt2 >>  8) & 0xff] ^ T647[tt3 & 0xff];
	state->core64[5] ^= T640[tt5 >> 56] ^ T641[(tt6 >> 48) & 0xff]^ T642[(tt7 >> 40) & 0xff]^ T643[(tt0 >> 32) & 0xff]^ T644[(tt1 >> 24) & 0xff]^T645[(tt2 >> 16) & 0xff] ^ T646[(tt3 >>  8) & 0xff] ^ T647[tt4 & 0xff];	
	state->core64[6] ^= T640[tt6 >> 56] ^ T641[(tt7 >> 48) & 0xff]^ T642[(tt0 >> 40) & 0xff]^ T643[(tt1 >> 32) & 0xff]^ T644[(tt2 >> 24) & 0xff]^T645[(tt3 >> 16) & 0xff] ^ T646[(tt4 >>  8) & 0xff] ^ T647[tt5 & 0xff];
	state->core64[7] ^= T640[tt7 >> 56] ^ T641[(tt0 >> 48) & 0xff]^ T642[(tt1 >> 40) & 0xff]^ T643[(tt2 >> 32) & 0xff]^ T644[(tt3 >> 24) & 0xff]^T645[(tt4 >> 16) & 0xff] ^ T646[(tt5 >>  8) & 0xff] ^ T647[tt6 & 0xff];
	
}

/* Compression function of Cheetah 256  */
void compressCheetah32(hashState *state, const BitSequence *data, u64 blockCounter){
	u64 a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
	u64 c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15;	
	u32 s0,s1,s2,s3,s4,s5,s6,s7,t0,t1,t2,t3,t4,t5,t6,t7;

	/* Adding the block counter  */	
 	state->core[0]^=H32(blockCounter); state->core[1]^=L32(blockCounter);

	/* Getting the input message */
	a0 =*(u64 *)(data);		a1 =*(u64 *)(data+  8); 
	a2 =*(u64 *)(data+ 16);	a3 =*(u64 *)(data+ 24);
	a4 =*(u64 *)(data+32);	a5 =*(u64 *)(data+ 40); 
	a6 =*(u64 *)(data+ 48);	a7 =*(u64 *)(data+ 56);
	a8 =*(u64 *)(data+64);	a9 =*(u64 *)(data+ 72); 
	a10=*(u64 *)(data+ 80);	a11=*(u64 *)(data+ 88);
	a12=*(u64 *)(data+96);	a13=*(u64 *)(data+104); 
	a14=*(u64 *)(data+112);	a15=*(u64 *)(data+120);	


	s0=state->core[0]^H32(a0);	s1=state->core[1]^H32(a1);
	s2=state->core[2]^H32(a2);	s3=state->core[3]^H32(a3);
	s4=state->core[4]^H32(a4);	s5=state->core[5]^H32(a5);
	s6=state->core[6]^H32(a6);	s7=state->core[7]^H32(a7);

	/* 15 rounds of Rijndael-like transformation. 
	   After every 4 rounds Message Expansion is called. 
     */
	ONEROUND32(t,s,a8,a9,a10,a11,a12,a13,a14,a15,H); 
	ONEROUND32(s,t,a0,a1,a2,a3,a4,a5,a6,a7,L);			
	ONEROUND32(t,s,a8,a9,a10,a11,a12,a13,a14,a15,L);
	ONEROUND64S(a,c,1);
	ONEROUND32(s,t,c0,c1,c2,c3,c4,c5,c6,c7,H);			
	ONEROUND32(t,s,c8,c9,c10,c11,c12,c13,c14,c15,H);
	ONEROUND32(s,t,c0,c1,c2,c3,c4,c5,c6,c7,L);			
	ONEROUND32(t,s,c8,c9,c10,c11,c12,c13,c14,c15,L);
	ONEROUND64S(c,a,2);
	ONEROUND32(s,t,a0,a1,a2,a3,a4,a5,a6,a7,H);			
	ONEROUND32(t,s,a8,a9,a10,a11,a12,a13,a14,a15,H);
	ONEROUND32(s,t,a0,a1,a2,a3,a4,a5,a6,a7,L);			
	ONEROUND32(t,s,a8,a9,a10,a11,a12,a13,a14,a15,L);
	ONEROUND64S(a,c,3);
	ONEROUND32(s,t,c0,c1,c2,c3,c4,c5,c6,c7,H);			
	ONEROUND32(t,s,c8,c9,c10,c11,c12,c13,c14,c15,H);
	ONEROUND32(s,t,c0,c1,c2,c3,c4,c5,c6,c7,L);			
	ONEROUND32(t,s,c8,c9,c10,c11,c12,c13,c14,c15,L);

   	/* round 16 + the addiotion of the previous hash value (feedforward)   */
   	state->core[0] ^= Te0[t0 >> 24] ^ Te1[(t1 >> 16) & 0xff] ^ Te2[(t3 >>  8) & 0xff] ^ Te3[t4 & 0xff];
   	state->core[1] ^= Te0[t1 >> 24] ^ Te1[(t2 >> 16) & 0xff] ^ Te2[(t4 >>  8) & 0xff] ^ Te3[t5 & 0xff];
   	state->core[2] ^= Te0[t2 >> 24] ^ Te1[(t3 >> 16) & 0xff] ^ Te2[(t5 >>  8) & 0xff] ^ Te3[t6 & 0xff];
   	state->core[3] ^= Te0[t3 >> 24] ^ Te1[(t4 >> 16) & 0xff] ^ Te2[(t6 >>  8) & 0xff] ^ Te3[t7 & 0xff];
	state->core[4] ^= Te0[t4 >> 24] ^ Te1[(t5 >> 16) & 0xff] ^ Te2[(t7 >>  8) & 0xff] ^ Te3[t0 & 0xff];
   	state->core[5] ^= Te0[t5 >> 24] ^ Te1[(t6 >> 16) & 0xff] ^ Te2[(t0 >>  8) & 0xff] ^ Te3[t1 & 0xff];
   	state->core[6] ^= Te0[t6 >> 24] ^ Te1[(t7 >> 16) & 0xff] ^ Te2[(t1 >>  8) & 0xff] ^ Te3[t2 & 0xff];
   	state->core[7] ^= Te0[t7 >> 24] ^ Te1[(t0 >> 16) & 0xff] ^ Te2[(t2 >>  8) & 0xff] ^ Te3[t3 & 0xff];  
}

/* Permutation of the Internal State before the processing of the last message block */
void lastBlockPermutation(hashState *state){
	u32 tm32;
	u64 tm64;

	if(state->hashbitlen<=256){
		tm32=state->core[0];	state->core[0]=state->core[4];	state->core[4]=tm32;
		tm32=state->core[1];	state->core[1]=state->core[5];	state->core[5]=tm32;
		tm32=state->core[2];	state->core[2]=state->core[6];	state->core[6]=tm32;
		tm32=state->core[3];	state->core[3]=state->core[7];	state->core[7]=tm32;
	}
	else{
		tm64=state->core64[0];	state->core64[0]=state->core64[4];	state->core64[4]=tm64;
		tm64=state->core64[1];	state->core64[1]=state->core64[5];	state->core64[5]=tm64;
		tm64=state->core64[2];	state->core64[2]=state->core64[6];	state->core64[6]=tm64;
		tm64=state->core64[3];	state->core64[3]=state->core64[7];	state->core64[7]=tm64;
	}
}

HashReturn Init(hashState *state, int hashbitlen){
	int i,j;

	state->hashbitlen=hashbitlen;

	if(!((hashbitlen==224)||(hashbitlen==256)||(hashbitlen==384)||(hashbitlen==512)))
		return BAD_HASHBITLEN;

	for(i=0;i<8;i++){
		state->core[i]=0;
		state->core64[i]=0;
	}	
	for(i=0;i<128;i++)
		state->rS[i]=0;
	
	return SUCCESS;
}

/* The hash function supports salt. Further, the zero value for the salt is taken.   */
HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen){
	unsigned long long doneLength=0,i;
	unsigned long long totLength=0;	

	state->databitlen=databitlen;


	if(state->hashbitlen<=256){				
		totLength=databitlen/8;
		if(totLength>=128)			
			Cheetah25664(&Te0,&T640,&state->core, data, totLength);
		doneLength=totLength/128;
		/*
		while(doneLength+1<=databitlen/MBLEN){						
			compressCheetah32(state,data+doneLength*MBLEN/8,doneLength);
			doneLength++;
		}
		*/
	}
	else{
		totLength=databitlen/8;
		if(totLength>=128)
			Cheetah51264(&Te0,&T640,&state->core64, data, totLength);
		doneLength=totLength/128;
		/*
		while(doneLength+1<=databitlen/MBLEN){									
			compressCheetah64(state,data+doneLength*MBLEN/8,doneLength);
			doneLength++;
		}
		*/
		
	}

	state->doneLength=doneLength;
	state->lRS = databitlen-MBLEN*doneLength;	

	for(i=0;i<state->lRS/8 + (state->lRS%8>1);i++){
		state->rS[i]=data[doneLength+i];		
	}
		
	return SUCCESS;
}


HashReturn Final(hashState *state, BitSequence *hashval){
	int i,j;	

	/* Padding with 1 and a number of 0s to fill the whole block.  */			

	/* If the last block is not filled then padded it with 1 and 0s*/
	if(state->lRS>0){
		state->rS[(state->lRS/8)]&=0xff<<(8 - ( (state->lRS) & 0x7) );
		state->rS[(state->lRS/8)]^=0x01<<(7 - ( (state->lRS) & 0x7) );
		
		/*	If the last block is still not filled than try to 
			put the message length in the least block if possible. 
			The message length needs 8 bytes and the digest length 
			needs 2 bytes (in total 10 bytes). 
		 */
		if(state->lRS/8<128-10){
			for(i=1;i<=8;i++)
				state->rS[117+i]=((state->databitlen)>>(64-8*i)) & 0xff;
			state->rS[126]=((state->hashbitlen) >> 8) & 0xff;
			state->rS[127]= (state->hashbitlen) & 0xff;

			lastBlockPermutation(state);
			
			if(state->hashbitlen<=256){
				compressCheetah32(state,state->rS,state->doneLength);		
			}
			else{
				compressCheetah64(state,state->rS,state->doneLength);
			}
		}
		/*	Hash the last block and create additional block that 
			contains only the message length and digest length 
			and hash that block. 
		 */
		else{
			if(state->hashbitlen<=256){				
				compressCheetah32(state,state->rS,state->doneLength);		
			}
			else{
				compressCheetah64(state,state->rS,state->doneLength);
			}
			memset(state->rS,0,128);
			lastBlockPermutation(state);
			for(i=1;i<=8;i++)
				state->rS[117+i]=((state->databitlen)>>(64-8*i)) & 0xff;
			state->rS[126]=((state->hashbitlen) >> 8) & 0xff;
			state->rS[127]= (state->hashbitlen) & 0xff;
			if(state->hashbitlen<=256){				
				compressCheetah32(state,state->rS,state->doneLength+1);		
			}
			else{
				compressCheetah64(state,state->rS,state->doneLength+1);
			}		
		}
	}
	/*  Create new block with 1 and 0s and message length and digest 
		length and hash that block. 
	 */
	else{		
		state->rS[0]=0x80;
		for(i=1;i<=8;i++)
				state->rS[117+i]=((state->databitlen)>>(64-8*i)) & 0xff;
		state->rS[126]=((state->hashbitlen) >> 8) & 0xff;
		state->rS[127]= (state->hashbitlen)		  & 0xff;
		lastBlockPermutation(state);
		if(state->hashbitlen<=256){				
			compressCheetah32(state,state->rS,state->doneLength);		
		}
		else{
			compressCheetah64(state,state->rS,state->doneLength);
		}		
	}
	
	/* Produce output */
	if(state->hashbitlen<=256){				
		for(i=0;i<state->hashbitlen/32;i++){			
			*(u32 *)(hashval+4*i)=*(u32 *)(state->core + i );
		}
	}
	else{		
		for(i=0;i<state->hashbitlen/64;i++){				
			*(u64 *)(hashval+8*i)=*(u64 *)(state->core64 + i);
		}
	}		

	return SUCCESS;
}
HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval){
	hashState Temp;
    
	if(Init(&Temp,hashbitlen)==SUCCESS){;	
		Update(&Temp,data,databitlen);	
		Final(&Temp,hashval);
		return  SUCCESS;
	}
	else return FAIL;
}
