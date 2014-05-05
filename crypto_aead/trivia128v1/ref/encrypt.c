/* PROGRAM FOR TriviA128v1, WHERE THE CIPHERTEXT INCLUDES INTERMEDIATE TAG */ 


#include<stdio.h>
#include<stdlib.h>
//#include"crypto_aead.h"
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;

#define CONST_alpha_32 0x00400007              // The primitive polynomial for GF(2^32) 
#define CONST_beta_64 0x000000000000001B       // The primitive polynomial for GF(2^64)
#define PROC_CHECKSUM 1                        // Indicates process checksum Blocks.
#define PROC_BLOCK 0                           // Indicates process Message or Associated Data Blocks (Not Checksum)
#define PROC_AD 1			       // Indicates process Associated Data Block.
#define PROC_MSG 0			       // Indicates process Message Block

//#define CHUNK_SIZE 0x40000000		       // Process checksum after 2^30 blocks(for TriviA-0 version)
#define CHUNK_SIZE 0x00000080		       // Process checksum after 128 blocks(for TriviA-128 version)
#define MAX_IT 0x01000000                      // Intermediate Tag upto 2^24 blocks (2^27 bytes) 

/* Will be used For TriviA-0 version */
/*
#define CHUNK_SIZE_MSG 0x40000000
#define IT 0   				       // No intermediate Tag (ITag)
#define param 0x0000000000000000			 
*/

/* Will be used TriviA-128 version */
#define CHUNK_SIZE_MSG 128       	       // Process checksum after 2^7 Msg Blocks (not for AD) for ITag  
#define IT 1				       // Indicates production of intermediate tag
#define param 0x0080000000000000               // Fixed value of param



static void store64(u8 *Bytes, u64 Block) // Store a 64 bit Block in 8 consequetive bytes in a byte array
{ int i; for (i = 7; i >= 0; i--) {Bytes[i] = (u8)Block; Block >>= 8; }}

static void store32(u8 *Bytes, u32 word) // Store 32 bit Block in  consequetive bytes in a byte array
{ int i; for (i = 3; i >= 0; i--) {Bytes[i] = (u8)word;  word >>= 8; }}

u64 load64(const u8 *Bytes) // Load 8 consequetive bytes of a byte array in a 64-bit Block
{int i; u64 temp, 
Block=0;
Block = Bytes[0];
for(i = 1; i <8; i++) {Block <<= 8; Block = (Block)^(u64)(Bytes[i]);} return Block;}

u32 load32(const u8 *Bytes) // Load 4 consequetive bytes of a byte array in a 32-bit Block
{int i; u32 temp, 
Block=0;
Block = (u8)Bytes[0];
for(i = 1; i <4; i++) {Block <<= 8; Block = (Block)^(u32)(Bytes[i]);} return Block;}


static void set_zero64(u64 *a, int len) // Set the elements of a unsigned long long array to zero
{int i; for(i=0; i<len; i++){a[i]=0;}}

static void set_zero32(u32 *a, int len) // Set the elements of a unsigned interger array to zero
{int i; for(i=0; i<len; i++){a[i]=0;}}


void SC_Update64(u64 *S, u64 *Z) // 64- round update of the Stream Cipher state
{
u64 t1 = (S[0] << (66 - 64) | S[1] >> (128 - 66)) ^ (S[1] << (132 - 128) | S[2] >> (192 - 132));
u64 t2 = (S[3] << (69 - 64) | S[4] >> (128 - 69)) ^ (S[3] << (105 - 64) | S[4] >> (128 - 105));
u64 t3 = (S[5] << (66 - 64) | S[6] >> (128 - 66)) ^ (S[6] << (147 - 128) | S[7] >> (192 - 147));

Z[0] = t1 ^ t2 ^ t3 ^ ((S[0] << 38 | S[1] >> 26) & (S[3] << 2 | S[4] >> 62)); // 64-bit key block generated

//Nonlinear Function of the stream cipher used in TriviA
t1 ^= ((S[1] << (130 - 128) | S[2] >> (192 - 130)) & (S[1] << (131 - 128) | S[2] >> (192 - 131))) ^ (S[3] << (96 - 64) | S[4] >> (128 - 96));
t2 ^= ((S[3] << (103 - 64) | S[4] >> (128 - 103)) & (S[3] << (104 - 64) | S[4] >> (128 - 104))) ^ (S[5] << (120 - 64) | S[6] >> (128 - 120));
t3 ^= ((S[6] << (145 - 128) | S[7] >> (192 - 145)) & (S[6] << (146 - 128) | S[7] >> (192 - 146))) ^ (S[0] << (75 - 64) | S[1] >> (128 - 75));

//Shifting and Inserting Updated Blocks
S[2] = S[1]; S[1] = S[0]; S[0] = t3;   S[4] = S[3]; S[3] = t1;   S[7] = S[6]; S[6] = S[5]; S[5] = t2;
}


void load_SC(u64 *SC_State, const u8 *k, const u8 *npub) // Load the Key and the IV into the state registers
{
   SC_State[0] = load64(k); SC_State[1] = load64(k+8); SC_State[2] = 0xFFFFFFFFFFFFFFFF; 
   SC_State[3] = 0xFFFFFFFFFFFFFFFF; SC_State[4] = 0xFFFFFFFFFFFFFFFF; SC_State[5]=param; 
   SC_State[6] = load64(npub); SC_State[7] = 0xFFFFFFFFFFFFFFFF;
}

u64 Key_Ext64(u64 *S) // Extract a 64-bit key Block (No Updation)
{
u64 Z;
u64 t1 = (S[0] << (66 - 64) | S[1] >> (128 - 66)) ^ (S[1] << (132 - 128) | S[2] >> (192 - 132));
u64 t2 = (S[3] << (69 - 64) | S[4] >> (128 - 69)) ^ (S[3] << (105 - 64) | S[4] >> (128 - 105));
u64 t3 = (S[5] << (66 - 64) | S[6] >> (128 - 66)) ^ (S[6] << (147 - 128) | S[7] >> (192 - 147));

Z = t1 ^ t2 ^ t3 ^ ((S[0] << 38 | S[1] >> 26) & (S[3] << 2 | S[4] >> 62)); // Key Block generated

return Z;
}

void insert_SC(u64 *SC_State, u32 *Tag) // XOR a 160 bit Tag with the first 160 bits of the stream cipher state

{
   SC_State[0] ^= ((u64)Tag[0]<<32)^Tag[1];
   SC_State[1] ^= ((u64)Tag[2]<<32)^Tag[3];
   SC_State[2] ^= ((u64)Tag[4]<<32);
   SC_State[3] ^= ((u64)Tag[4])<<36; 
}



u32 Mult_by_alpha_power(u32 a, int m) // Field multiplication of a polynomial a(x) with x^m in GF(2^32)
{
   int i; u32 result;
   for(i=0; i<m; i++)
   {
	result = a<<1; 
	if((a>>31)&1==1) result = result^(CONST_alpha_32);
	a = result;
   }
   return result;
}



/* Horner's Multiplication for 32-bit Vandermonde Matrix Multiplcaition 
When FULL is 1 (for AD) we process 160 bit tags, otheriwse (for message) 128 bit 
----------------------------------------------------------------------*/
void V_Horner_32(u32 Input, u32* Tag, u8 FULL)
{
	Tag[0] = Tag[0]^Input;                                      
      	Tag[1] = Mult_by_alpha_power(Tag[1],1)^Input;
      	Tag[2] = Mult_by_alpha_power(Tag[2],2)^Input;
      	Tag[3] = Mult_by_alpha_power(Tag[3],3)^Input;
	if(FULL==1) Tag[4]=Mult_by_alpha_power(Tag[4],4)^Input;
}



u64 Mult_by_beta_power(u64 b, int m) // Field multiplication of a polynomial b(x) with x^m in GF(2^64)
{
   int i; u64 result;
   for(i=0; i<m; i++)
   {
	result = b<<1; 
	if((b>>63)&1==1) result = result^(CONST_beta_64);
	b = result;
   }
   return result;
}


/* Horner's Multiplication for 64-bit Vandermonde Matrix Multiplcaition
When FULL is 1 (for AD) we process 4 checksum blocks, otheriwse 3 message blocks 
--------------------------------------------------------------------*/
void V_Horner_64(u64 Input, u64* Checksum, u8 FULL)
{
	Checksum[0] = Checksum[0]^Input;
      	Checksum[1] = Mult_by_beta_power(Checksum[1],1)^Input;
      	Checksum[2] = Mult_by_beta_power(Checksum[2],2)^Input;
	if(FULL==1) Checksum[3] = Mult_by_beta_power(Checksum[3],3)^Input;
}


u32 Reverse_32(u32 a) //Reverse a 32-bit string
{
  u32 i, b=0;

  for(i=0;i<31;i++){
  	b^=(a&1); a=a>>1; b=b<<1;}
  b^=(a&1);
  return b;
}



u32 Field_Mult_32(u32 a, u32 b) // Field multiplication of a(x) and b(x) in GF(2^32)
{
   u32 result=0, i;  

   b=Reverse_32(b); 

   if(b&1==1) result=a;

   for(i=1;i<32;i++)
   {   
	b=b>>1;
	result=Mult_by_alpha_power(result,1); 
	if(b&1==1) result=result^a;
   }
   return result;
}



u64 pad(const u8 *Bytes, int Last_len)//Pad the final Block. If the final block is full(64-bit) then append a 1|0^63 Block
{
  int i; u64 Block=0; 
  for (i = 0;i <Last_len; i++) {Block ^= (u64)Bytes[i]; Block <<= 8; } 
  Block ^= 128; Block <<= 8*(7-Last_len); return Block;
}




/* The Main Module of TriviA Which Would be Repeated for Every 64 bits of Message or Associate data */
/* Apply Pseudo-dot-Product and, update State bits, Tag & Checksum (if not processing checksum)  */
/*------------------------------------------------------------------------------ */
void process_block(u64 Block, u32 *Tag, u64 *Checksum, u64 *SC_State, u64 *Z, u8 IsChecksum, u8 IsAD)
{
   u32 State_Key[2], word[2], PDP;
 
   word[0]= (u32)(Block>>32); word[1]= (u32)Block;                   // Parse Block into two words
   
   State_Key[0]= (u32)((SC_State[0]>>32)&(0xFFFFFFFF)); 
   State_Key[1]= (u32)(SC_State[0]&(0xFFFFFFFF));                    // Obtain state-key Words(Required for Tag)
   
   SC_Update64(SC_State, Z);                                         // Update the stream ciphertate for 64 rounds 
   
   PDP = Field_Mult_32(word[0]^State_Key[0], word[1]^State_Key[1]);  // Pseudo-dot-Product
   
   V_Horner_32(PDP, Tag, IsAD);                                      // Update Tag always.

   if(!IsChecksum) {V_Horner_64(Block, Checksum, IsAD);}             // Update checksum if not checksum Block.
}      


/*--------------------------------------------------------------------------------------------------------*/
/* The common module for both encryption and decryption which implements 1152 round initialization, */
/* Processing of associated data to produce intermediate tag */
/* XOR the tag With current state and reinitialize the state with 1152 rounds */
/*--------------------------------------------------------------------------------------------------------*/

void Initialize_process_AD_Reinitialize(u64 *SC_State, const unsigned char *ad, unsigned long long adlen)
{
   u64  Z[4], Checksum[4], Block; 
   u32  Tag[5], ck_ctr; //ck_ctr denotes the size of a chunk
   int i; 

   for(i=0; i<18; i++) {SC_Update64(SC_State, Z);} // Update SC_State for 18 64-rounds.


/*  PROCESS ASSOCIATED DATA BLOCKS   */

   ck_ctr = CHUNK_SIZE;  set_zero32(Tag,5);  set_zero64(Checksum,4); // Initialization of ck_ctr, tag and Checksum
   while(adlen >=8) // Process All But the Final Block of AD 
   {
	Block = load64(ad);
	process_block(Block, Tag, Checksum, SC_State, Z, PROC_BLOCK, PROC_AD); // Update the tag and checksum
       	ad = ad+8; adlen = adlen-8; ck_ctr--;
        if(ck_ctr==0) // process the checksum blocks
   	{
	   for(i=0; i<4; i++){
		process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM, PROC_AD);}// Update tag 
                                                                                                // for the checksum Block

	   ck_ctr=CHUNK_SIZE; set_zero64(Checksum,4); // Reset the chunk counter and set the checksum Aarray to zero
   	}
   }

   process_block(pad(ad, adlen), Tag, Checksum, SC_State, Z, PROC_BLOCK, PROC_AD); // Update the tag and Checksum for the 
                                                                                   // final block
 

// Update the tag for the final 4 checksum blocks for AD and get the key for variable length handling
   for(i=0; i<4; i++){process_block(Checksum[i], Tag, Checksum, SC_State, Z+i, PROC_CHECKSUM, PROC_AD);}

// Add the Currently Generated Key to Handle Variable Length AD
   Tag[0] ^= (u32)(Z[0]>>32); Tag[1] ^= (u32)(Z[0]); Tag[2] ^= (u32)(Z[1]>>32); Tag[3] ^= (u32)(Z[1]); Tag[4] ^= (u32)(Z[2]>>32);

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
   u64 SC_State[8], Z[4], Checksum[4], Block; 
   u32 Tag[5], ck_ctr, blk_ctr, temp; // ck_ctr denotes chunk counter and blk_ctr denotes the block counter
                                                     // for computing intermediate tag
   int i; 
   *clen=0;
   load_SC(SC_State, k, npub);  // Load state Blocks with nonce and key


   Initialize_process_AD_Reinitialize(SC_State, ad, adlen); // Initialize, Process AD and Reinitialize */


/*  PROCESS MESSAGE BLOCKS.       */

   ck_ctr = CHUNK_SIZE_MSG; blk_ctr= MAX_IT;  set_zero32(Tag,5); set_zero64(Checksum,4); // Initialization
   while(mlen >=8) // Process All But the Final Block of Padded Message 
   {
        Block = load64(m);    
	process_block(Block, Tag, Checksum, SC_State, Z, PROC_BLOCK, PROC_MSG); // Update the tag, the checksum and the 
                                                                                // stream cipher state 
        for(i=0;i<8;i++) {c[i] = ((u8)(Z[0]>>(8*(7-i))))^(m[i]);  } // Ciphertext computation      

        m = m+8; c= c+8; mlen = mlen-8; *clen = *clen+8; ck_ctr--; if(blk_ctr>0) blk_ctr--; // Increment of ciphertext 
                                                                                            // pointer by one Block 
        
	if(ck_ctr==0) // process the checksum blocks 
   	{
	   for(i=0; i<3; i++)
	   {
		process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM, PROC_MSG); // Update tag 
                                                                                                 // for the checksum Block
	   }
	   ck_ctr=CHUNK_SIZE_MSG; set_zero64(Checksum,4); // Reset The chunk counter and set the checksum array to zero
	   
	   if(IT && blk_ctr!=0) //Compute intermediate tag
	   {
		for(i=0;i<4;i++){store32(c, Tag[i]); c= c+4;} *clen= *clen+16; // Store intermediate tag into the Ciphertext
	   }
   	}
   }

// Process the Final Block (possibly emty) of Mesage after we apply 10* pad
   process_block(pad(m, mlen), Tag, Checksum, SC_State, Z, PROC_BLOCK, PROC_MSG); // Update the Tag and Checksum for the 
                                                                                  // Final Block

   for(i=0;i<mlen;i++) {c[i] = ((u8)(Z[0]>>(8*(7-i))))^(m[i]); } //Ciphertext for the final block 
   *clen= *clen+mlen; c=c+mlen;

// Update the tag for the final 4 checksum Blocks for message and get the key(Z[0], Z[1], Z[2]) for variable length handling
   for(i=0; i<3; i++){process_block(Checksum[i], Tag, Checksum, SC_State, Z+i, PROC_CHECKSUM, PROC_MSG);}

// Add the currently generated key with the tag to handle variable length message
   Tag[0] ^= (u32)(Z[0]>>32); Tag[1] ^= (u32)Z[0]; Tag[2] ^= (u32)(Z[2]>>32); Tag[3] ^= (u32)Z[2]; 
   for(i=0;i<4;i++){store32(c, Tag[i]); c= c+4;} *clen= *clen+16; // Store final tag into the Ciphertext

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
   u64 SC_State[8], Z[4], Checksum[4], Block; 
   u32 Tag[5], ck_ctr, blk_ctr, temp;  // ck_ctr denotes chunk counter and blk_ctr denotes the block counter
                                                      // for computing intermediate tag
   u64 t1, t2, t3, i, j;
   *outputmlen=0;

   

   load_SC(SC_State, k, npub);  // Load state Blocks with nonce and key


   Initialize_process_AD_Reinitialize(SC_State, ad, adlen); //Initialize, Process AD and Reinitialize */


/*  PROCESS CIPHERTEXT BLOCKS.       */


   ck_ctr = CHUNK_SIZE_MSG; blk_ctr= MAX_IT;  set_zero32(Tag,5); set_zero64(Checksum,4); // Initialization
   while(clen-16 >=8) // Process all but the final Block of the ciphertext
   {

        Z[0] = Key_Ext64(SC_State); //Extract the encryption key first

        for(i=0;i<8;i++) {m[i] = ((u8)(Z[0]>>(8*(7-i))))^(c[i]);  } // Decrypt the ciphertext
        Block = load64(m);    
	process_block(Block, Tag, Checksum, SC_State, Z, PROC_BLOCK, PROC_MSG); //Update the tag

	
        m = m+8; c= c+8; *outputmlen = *outputmlen+8; clen = clen-8; // Increment of message pointer by one Block 
        ck_ctr--; if(blk_ctr>0) blk_ctr--;

	if(ck_ctr==0) // process the checksum blocks
   	{
	   for(i=0; i<3; i++)
	   {
		process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM, PROC_MSG);// Update tag 
                                                                                                // for the checksum Block
	   }
	   ck_ctr=CHUNK_SIZE_MSG; set_zero64(Checksum,4); // Reset The chunk counter and set the checksum array to zero
	   
	   if(IT && blk_ctr!=0) // Conditions for computing intermediate tag
	   {
		for(i=0;i<4;i++){ c= c+4;} clen= clen-16;
	   }

           for(i=0;i<4;i++)//Checking the equality of the intermediate tags
           {
                
                temp=load32((c-16+i*4));
                if((Tag[i])!= temp) return -1; // Return -1 if the intermediate tag is not valid
           }
           
   	}        
   }



// Process the final block (possibly empty) of cipheretxt 
   Z[0] = Key_Ext64(SC_State);  //Extract the key for the final Block
  
   for(i=0;i<clen-16;i++) {m[i] = ((u8)(Z[0]>>(8*(7-i))))^(c[i]);} //Decrypt to the final message Block
   process_block(pad(m, clen-16), Tag, Checksum, SC_State, Z, PROC_BLOCK, PROC_MSG); //Update the Tag in the Decryptor Side
   *outputmlen=*outputmlen+clen-16; c=c+clen-16;

// Update the tag for the final 4 checksum Blocks and get the key for variable length handling
   for(i=0; i<3; i++){process_block(Checksum[i], Tag, Checksum, SC_State, Z+i, PROC_CHECKSUM, PROC_MSG);}

// Add the currently generated key with the tag to handle variable length message
   Tag[0] ^= (u32)(Z[0]>>32); Tag[1] ^= (u32)Z[0]; Tag[2] ^= (u32)(Z[2]>>32); Tag[3] ^= (u32)Z[2]; 
   for(i=0;i<4;i++){ c= c+4;} clen=clen-16;
   temp=load32(c-4);

   for(i=0;i<4;i++)//Check the equality of the final tag
           {            
                temp=load32((c-16+i*4));
                if((Tag[i])!= temp)  return -1; // Return -1 if the final tag is not valid
           }

return 0;
}



