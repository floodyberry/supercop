//Trivia0v1
// 10th September 2015

#include<stdio.h>
#include<stdlib.h>
#include "crypto_aead.h"

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;


#define CONST_alpha_32 0x00400007              // The primitive polynomial for GF(2^32) 
#define CONST_beta_64 0x000000000000001B       // The primitive polynomial for GF(2^64)
#define PROC_CHECKSUM 1                        // Here we process Checksum blocks.
#define PROC_BLOCK 0 
#define PROC_AD 1				// Process Associated Data.
#define PROC_MSG 0				// Process Message.

/* Different Modes of Uses of Streamcipher Keys */ 
#define DROP_KEY 0                              // NO use so drop the key... 
#define CT_GEN_KEY 1				// to generate ciphertext
#define LEN_HASH_KEY_AD 2			// to handle variable length hashing for AD 
#define LEN_HASH_KEY_MSG 3			// to handle variable length hashing for Message
#define ENCRYPTION 1				// If 1 encrypting, otherwise (i.e, 0) decrypting
#define CHUNK_SIZE 0x100000000			// Process checksum after 2^32 blocks
//#define CHUNK_SIZE 0x00000080			// Process checksum after 128 blocks(for TriviA-128 version)
#define MAX_IT 0x08000000          // Intermediate Tag (if any) upto 2^23 blocks (2^32 bytes) 

/* Will be used For TriviA-0 version */
#define CHUNK_SIZE_MSG 0x100000000
#define IT 0   					// No intermediate Tag (ITag)
#define param 0x0000000000000000			 

/* Will be used TriviA-128 version 
#define CHUNK_SIZE_MSG 128        	 // Process checksum after 2^7 Msg Blocks (not for AD) for ITag  
#define IT 1				   // Intermediate Tag is produced until 2^{32} blocks 
#define param 0x00800000
*/


//............ALL MODULES............

static void store64(u8 *Bytes, u64 Block)
{ int i; for (i = 7; i >= 0; i--) {Bytes[i] = (u8)Block; Block >>= 8; }}

static void store32(u8 *Bytes, u32 word)
{ int i; for (i = 3; i >= 0; i--) {Bytes[i] = (u8)word;  word >>= 8; }}

u64 load64(const u8 *Bytes)
{int i; u64 temp, 
Block=0;
Block = Bytes[0];
for(i = 1; i <8; i++) {Block <<= 8; Block = (Block)^(u64)(Bytes[i]);} return Block;}

u32 load32(const u8 *Bytes)
{int i; u32 temp, 
Block=0;
Block = (u8)Bytes[0];
for(i = 1; i <4; i++) {Block <<= 8; Block = (Block)^(u32)(Bytes[i]);} return Block;}


static void set_zero64(u64 *a, int len)
{int i; for(i=0; i<len; i++){a[i]=0;}}

static void set_zero32(u32 *a, int len)
{int i; for(i=0; i<len; i++){a[i]=0;}}

/* It Updates the Streamcipher state (64 rounds together) and also generates the 64 bit key. */

void SC_Update64(u64 *S, u64 *Z)
{
u64 t1 = (S[0] << (66 - 64) | S[1] >> (128 - 66)) ^ (S[1] << (132 - 128) | S[2] >> (192 - 132));
u64 t2 = (S[3] << (69 - 64) | S[4] >> (128 - 69)) ^ (S[3] << (105 - 64) | S[4] >> (128 - 105));
u64 t3 = (S[5] << (66 - 64) | S[6] >> (128 - 66)) ^ (S[6] << (147 - 128) | S[7] >> (192 - 147));

Z[0] = t1 ^ t2 ^ t3 ^ ((S[0] << 38 | S[1] >> 26) & (S[3] << 2 | S[4] >> 62)); // Key Block generated

//Computing Updated Blocks
t1 ^= ((S[1] << (130 - 128) | S[2] >> (192 - 130)) & (S[1] << (131 - 128) | S[2] >> (192 - 131))) ^ (S[3] << (96 - 64) | S[4] >> (128 - 96));
t2 ^= ((S[3] << (103 - 64) | S[4] >> (128 - 103)) & (S[3] << (104 - 64) | S[4] >> (128 - 104))) ^ (S[5] << (120 - 64) | S[6] >> (128 - 120));
t3 ^= ((S[6] << (145 - 128) | S[7] >> (192 - 145)) & (S[6] << (146 - 128) | S[7] >> (192 - 146))) ^ (S[0] << (75 - 64) | S[1] >> (128 - 75));

//Shifting and Inserting Updated Blocks
S[2] = S[1]; S[1] = S[0]; S[0] = t3;   S[4] = S[3]; S[3] = t1;   S[7] = S[6]; S[6] = S[5]; S[5] = t2;
}

void load_SC(u64 *SC_State, const u8 *k, const u8 *npub)
{
    SC_State[0] = load64(k); SC_State[1] = load64(k+8); SC_State[2] = 0x0000000000000000; 
   SC_State[3] = 0x0000000000000000; SC_State[4] = 0x0000000003800000; SC_State[5]=param; 
   SC_State[6] = load64(npub); SC_State[7] = 0x0000000000000000;
}

u64 Key_Ext64(u64 *S)
{
u64 Z;
u64 t1 = (S[0] << (66 - 64) | S[1] >> (128 - 66)) ^ (S[1] << (132 - 128) | S[2] >> (192 - 132));
u64 t2 = (S[3] << (69 - 64) | S[4] >> (128 - 69)) ^ (S[3] << (105 - 64) | S[4] >> (128 - 105));
u64 t3 = (S[5] << (66 - 64) | S[6] >> (128 - 66)) ^ (S[6] << (147 - 128) | S[7] >> (192 - 147));
Z = t1 ^ t2 ^ t3 ^ ((S[0] << 38 | S[1] >> 26) & (S[3] << 2 | S[4] >> 62)); // Key Block generated

return Z;
}

void insert_SC(u64 *SC_State, u32 *Tag)
{
   SC_State[0] ^= ((u64)Tag[0]<<32)^Tag[1];
   SC_State[1] ^= ((u64)Tag[2]<<32)^Tag[3];
   //SC_State[2] ^= ((u64)Tag[4]<<32);
   //SC_State[3] ^= ((u64)Tag[4])<<36; 
}

/* Multiplication by alpha power m. We use mainly for m = 1,2,3,4 */
/*----------------------------------------------------------------*/
u32 Mult_by_alpha_power(u32 a, int m)
{
   int i; u32 result;
   for(i=0; i<m; i++)
   {
	result = a<<1; 
	if(((a>>31)&1)==1) result = result^(CONST_alpha_32);
	a = result;
   }
   return result;
}

/* Horner's Multiplication for 32-bit Vandermonde Matrix Multiplcaition 
When FULL is 1 (for AD) we process 160 bit tags, otheriwse (for message) 128 bit 
----------------------------------------------------------------------*/
void V_Horner_32(u32 Input, u32* Tag)//, u8 FULL)
{
	Tag[0] = Tag[0]^Input;
      	Tag[1] = Mult_by_alpha_power(Tag[1],1)^Input;
      	Tag[2] = Mult_by_alpha_power(Tag[2],2)^Input;
      	Tag[3] = Mult_by_alpha_power(Tag[3],3)^Input;
	//if(FULL==1) Tag[4]=Mult_by_alpha_power(Tag[4],4)^Input;
}
/* Multiplication by beta power m, we use m = 1,2,3 */
/*--------------------------------------------------*/
u64 Mult_by_beta_power(u64 b, int m)
{
   int i; u64 result;
   for(i=0; i<m; i++)
   {
	result = b<<1; 
	if(((b>>63)&1)==1) result = result^(CONST_beta_64);
	b = result;
   }
   return result;
}
/* Horner's Multiplication for 64-bit Vandermonde Matrix Multiplcaition
When FULL is 1 (for AD) we process 4 checksum blocks, otheriwse (for message) 3 blocks 
--------------------------------------------------------------------*/
void V_Horner_64(u64 Input, u64* Checksum)//, u8 FULL)
{
	Checksum[0] = Checksum[0]^Input;
      	Checksum[1] = Mult_by_beta_power(Checksum[1],1)^Input;
      	Checksum[2] = Mult_by_beta_power(Checksum[2],2)^Input;
	//if(FULL==1) Checksum[3] = Mult_by_beta_power(Checksum[3],3)^Input;
}

/* Reverse a 32 bit string */
u32 Reverse_32(u32 a)
{
  u32 i, b=0;

  for(i=0;i<31;i++){
  	b^=(a&1); a=a>>1; b=b<<1;}
  b^=(a&1);
  return b;
}

/* Multiplications of two 32 bit field elements */
/*-----------------------------------------------*/
u32 Field_Mult_32(u32 a, u32 b)
{
   u32 result=0, i;  

   b=Reverse_32(b); 

   if((b&1)==1) result=a;

   for(i=1;i<32;i++)
   {   
	b=b>>1;
	result=Mult_by_alpha_power(result,1); 
	if((b&1)==1) result=result^a;
   }
   return result;
}

/* Pad The Final Block (Possibly Empty and must be Incomplete) by appending 10*  */
/*------------------------------------------------------------------------------ */
u64 pad(const u8 *Bytes, int Last_len)
{
  int i; u64 Block=0; 
  for (i = 0;i <Last_len; i++) {Block ^= (u64)Bytes[i]; Block <<= 8; } 
  Block ^= 128; Block <<= 8*(7-Last_len); return Block;
}

/*-----------------------------------------------------------------------------------------------*/
/* The Main Module of TriviA Which Would be Repeated for Every 64 bits of Message or Associate data */
/* Apply Pseudo-dot-Product and, update State bits, Tag & Checksum (if not processing checksum)  */
/*------------------------------------------------------------------------------ */
void process_block(u64 Block, u32 *Tag, u64 *Checksum, u64 *SC_State, u64 *Z, u8 IsChecksum)//, u8 IsAD)
{
   u32 State_Key[2], word[2], PDP;
 

   word[0]= (u32)(((Block>>32) & (0x00000000FFFF0000)) ^ ((Block>>16)&(0x000000000000FFFF))); 
   word[1]= (u32)(((Block>>16)&(0x00000000FFFF0000))^ (Block &(0x000000000000FFFF))); // Parse Blocks into words


   State_Key[0]= (u32)(((SC_State[0]>>32) & (0x00000000FFFF0000)) ^ ((SC_State[0]>>16)&(0x000000000000FFFF))); 
   State_Key[1]= (u32)(((SC_State[0]>>16)&(0x00000000FFFF0000))^ (SC_State[0] &(0x000000000000FFFF)));




   //word[0]= (u32)(Block>>32); word[1]= (u32)Block;                   // Parse Block into two words
   
   //State_Key[0]= (u32)((SC_State[0]>>32)&(0xFFFFFFFF)); 
   //State_Key[1]= (u32)(SC_State[0]&(0xFFFFFFFF));                    // Obtain State-key Words(Required for Tag)
   
   SC_Update64(SC_State, Z);                                         // Update the State 
   
   PDP = Field_Mult_32(word[0]^State_Key[0], word[1]^State_Key[1]);  // Pseudo-dot-Product
   
   V_Horner_32(PDP, Tag);                                      // Update Tag always.

   if(!IsChecksum) {V_Horner_64(Block, Checksum);}            // update checksum if not checksum block.
}      


/*--------------------------------------------------------------------------------------------------------*/
/* The Common Module for Both Encryption and Decryption which Implements 1152 Round initialization, */
/* Prcess Associated Data to Produce Intermediate Tag(XOR the Tag With Current State and Reinitialize */
/* The State With 1152 Round */
/*--------------------------------------------------------------------------------------------------------*/

void Initialize_process_AD_Reinitialize(u64 *SC_State, const unsigned char *ad, unsigned long long adlen)
{
   u64  Z[1], Checksum[3], Block, ck_ctr; 
   u32 dummy_word[2], Tag[4], temp; 
   u8 FINISH; 
   int i; 

   for(i=0; i<18; i++) {SC_Update64(SC_State, Z);} // Update SC_State for 18 64-rounds.


/*  PROCESS ASSOCIATED DATA BLOCKS...   */
//----------------------------------------

   ck_ctr = CHUNK_SIZE;  set_zero32(Tag,4);  set_zero64(Checksum,3);
   while(adlen >=8) // Process All But the Final Block of AD 
   {
	Block = load64(ad);
	process_block(Block, Tag, Checksum, SC_State, Z, PROC_BLOCK); // Update the Tag and Checksum
       	ad = ad+8; adlen = adlen-8; ck_ctr--;
        if(ck_ctr==0) // process the checksum blocks
   	{
	   for(i=0; i<3; i++){
		process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM);}// Update Tag 
                                                                                                // for the Checksum Block
	   ck_ctr=CHUNK_SIZE; set_zero64(Checksum,3); // Reset The Chunk Counter and Set the Checksum Array to zero
   	}
   }

   process_block(pad(ad, adlen), Tag, Checksum, SC_State, Z, PROC_BLOCK); // Update the Tag and Checksum for the 
                                                                                   // Final Block
 

   
// Update the Tag for the Final 3 Checksum Blocks for AD and Get the Key for Variable Length Handling
   for(i=0; i<3; i++)
	{  process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM);
	   if(i == 0) {Tag[0] ^= (u32)(Z[0]>>32); Tag[1] ^= (u32)(Z[0]);}
	   if(i == 2) {Tag[2] ^= (u32)(Z[0]>>32); Tag[3] ^= (u32)(Z[0]);}
	}

// Add the Currently Generated Key to Handle Variable Length AD
   //Tag[0] ^= (u32)(Z[0]>>32); Tag[1] ^= (u32)(Z[0]); Tag[2] ^= (u32)(Z[1]>>32); Tag[3] ^= (u32)(Z[1]); Tag[4] ^= (u32)(Z[2]>>32);

   insert_SC(SC_State, Tag); // Insert Tag for AD to streamcipher state
   for(i=0; i<18; i++) {SC_Update64(SC_State, Z);} // Update SC_State for 18 64-rounds.


}





int crypto_aead_encrypt(
unsigned char *c,unsigned long long *clen,
const unsigned char *m,unsigned long long mlen,
const unsigned char *ad,unsigned long long adlen,
const unsigned char *nsec,
const unsigned char *npub,
const unsigned char *k)
{
   u64 SC_State[8], Z[1], Checksum[3], Block, ck_ctr, blk_ctr; 
   u32 dummy_word[2], Tag[4], temp; 
   u8 FINISH; 
   int i; 
   *clen=0;
   load_SC(SC_State, k, npub);  // Load State Blocks with Nonce and key


   Initialize_process_AD_Reinitialize(SC_State, ad, adlen); //Initialize, Process AD and Reinitialize */


/*  PROCESS MESSAGE BLOCKS.       */
//--------------------------------//


   ck_ctr = CHUNK_SIZE_MSG; blk_ctr= MAX_IT;  set_zero32(Tag,4); set_zero64(Checksum,3);
   while(mlen >=8) // Process All But the Final Block of Padded Message 
   {
        Block = load64(m);    
	process_block(Block, Tag, Checksum, SC_State, Z, PROC_BLOCK); //Update the Tag and the Checksum
        for(i=0;i<8;i++) {c[i] = ((u8)(Z[0]>>(8*(7-i))))^(m[i]);  } // ciphertext computation      

        m = m+8; c= c+8; mlen = mlen-8; *clen = *clen+8; ck_ctr--; if(blk_ctr>0) blk_ctr--;
        
	if(ck_ctr==0) // process the checksum blocks 
   	{
	   for(i=0; i<3; i++)
	   {
		process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM); // Update Tag 
                                                                                                 // for the Checksum Block
	   }
	   ck_ctr=CHUNK_SIZE_MSG; set_zero64(Checksum,3); // Reset The Chunk Counter and Set the Checksum Array to zero
	   
	   /* if(IT && blk_ctr!=0) //Compute intermediate tag  // CHANGE
	   {
		for(i=0;i<4;i++){store32(c, Tag[i]); c= c+4;} *clen= *clen+16;
	   }*/
   	}
   }

// Process the Final Block (possibly emty) of Mesage after we apply 10* pad
   process_block(pad(m, mlen), Tag, Checksum, SC_State, Z, PROC_BLOCK); // Update the Tag and Checksum for the 
                                                                                  // Final Block
   for(i=0;i<mlen;i++) {c[i] = ((u8)(Z[0]>>(8*(7-i))))^(m[i]); } //ciphertext for final block 
   *clen= *clen+mlen; c=c+mlen;

// Update the Tag for the Final 3 Checksum Blocks for Message and Get the Key for Variable Length Handling
   for(i=0; i<3; i++)
	{
	    process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM);
	    if(i == 0) {Tag[0] ^= (u32)(Z[0]>>32); Tag[1] ^= (u32)(Z[0]);}
	    if(i == 2) {Tag[2] ^= (u32)(Z[0]>>32); Tag[3] ^= (u32)(Z[0]);}

	}

// Add the Currently Generated Key to Handle Variable Length Message
   //Tag[0] ^= (u32)(Z[0]>>32); Tag[1] ^= (u32)Z[0]; Tag[2] ^= (u32)(Z[2]>>32); Tag[3] ^= (u32)Z[2]; 
   for(i=0;i<4;i++){store32(c, Tag[i]); c= c+4;} *clen= *clen+16; 

  return 0;
}


  int crypto_aead_decrypt(
       unsigned char *m,unsigned long long *outputmlen,
       unsigned char *nsec,
       const unsigned char *c,unsigned long long clen,
       const unsigned char *ad,unsigned long long adlen,
       const unsigned char *npub,
       const unsigned char *k
     )
{
   u64 SC_State[8], Z[1], Checksum[3], Block, ck_ctr, blk_ctr; 
   u32 dummy_word[2], Tag[4],   temp; 
   u8 FINISH, *tempvar; 
   u64 t1, t2, t3, i, j;
   int ctr_tag=0;
   *outputmlen=0;

   

   load_SC(SC_State, k, npub);  // Load State Blocks with Nonce and key


   Initialize_process_AD_Reinitialize(SC_State, ad, adlen); //Initialize, Process AD and Reinitialize */

/*  PROCESS CIPHERTEXT BLOCKS.       */
//--------------------------------//

   ck_ctr = CHUNK_SIZE_MSG; blk_ctr= MAX_IT;  set_zero32(Tag,4); set_zero64(Checksum,3);
   while(clen-16 >=8) // Process ALL but the Final Block of the Ciphertext
   {

        Z[0] = Key_Ext64(SC_State); //Extract the Encryption Key First

        for(i=0;i<8;i++) {m[i] = ((u8)(Z[0]>>(8*(7-i))))^(c[i]);  } // Decrypt the Ciphertext
        Block = load64(m);    
	process_block(Block, Tag, Checksum, SC_State, Z, PROC_BLOCK); //Update the Tag in the Decryptor Side

	
        m = m+8; c= c+8; *outputmlen = *outputmlen+8; clen = clen-8; 
        ck_ctr--; if(blk_ctr>0) blk_ctr--;

	if(ck_ctr==0) // process the checksum blocks
   	{
	   for(i=0; i<3; i++)
	   {
		process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM);// Update Tag 
                                                                                                // for the Checksum Block
	   }
	   ck_ctr=CHUNK_SIZE_MSG; set_zero64(Checksum,3); // Reset The Chunk Counter and Set the Checksum Array to zero
	   
	   /*if(IT && blk_ctr!=0) // In case of Itag, we compute intermediate tag. // CHANGE
	   {
		for(i=0;i<4;i++){ c= c+4;} clen= clen-16;
	   }

           for(i=0;i<4;i++)//Checking the equality of the intermediate tags // CHANGE
           {
                
                temp=load32((c-16+i*4));
                if((Tag[i])!= temp) return -1;
           }*/
           
   	}        
   }



// Process the Final Block (possibly empty) of cipheretxt 
   Z[0] = Key_Ext64(SC_State);  //Extract the Key for the Final Block
  
   for(i=0;i<clen-16;i++) {m[i] = ((u8)(Z[0]>>(8*(7-i))))^(c[i]);} //Decrypt to the Final Message Block
   process_block(pad(m, clen-16), Tag, Checksum, SC_State, Z, PROC_BLOCK); //Update the Tag in the Decryptor Side
   *outputmlen=*outputmlen+clen-16; c=c+clen-16;

// Update the Tag for the Final 4 Checksum Blocks and Get the Key for Variable Length Handling
    for(i=0; i<3; i++)
	{
	    process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM);
	    if(i == 0) {Tag[0] ^= (u32)(Z[0]>>32); Tag[1] ^= (u32)(Z[0]);}
	    if(i == 2) {Tag[2] ^= (u32)(Z[0]>>32); Tag[3] ^= (u32)(Z[0]);}

	}

// Add the Currently Generated Key to Handle Variable Length Message
 //  Tag[0] ^= (u32)(Z[0]>>32); Tag[1] ^= (u32)Z[0]; Tag[2] ^= (u32)(Z[2]>>32); Tag[3] ^= (u32)Z[2]; 
   for(i=0;i<4;i++){ c= c+4;} clen=clen-16;
   temp=load32(c-4);

   for(i=0;i<4;i++)//Check the Equality of the Final Tag
           {            
                temp=load32((c-16+i*4));
                if((Tag[i])!= temp)  return -1;
           }

return 0;
}



