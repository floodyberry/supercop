/*********************************************************************/
/*                                                                   */
/*                           SHAvite-3                               */
/*                                                                   */
/* Candidate submission to NIST SHA-3 competition                    */
/*                                                                   */
/* Written by Eli Biham and Orr Dunkelman                            */
/*                                                                   */
/*********************************************************************/

#include "portable.h"
#include "SHA3api_ref.h"
#include "SHAvite3-256.h"
#include "SHAvite3-512.h"

u32 IV_224[8] =  {0x6774F31C, 0x990AE210, 0xC87D4274, 0xC9546371, 
                  0x62B2AEA8, 0x4B5801D8, 0x1B702860, 0x842F3017};

u32 IV_256[8] =  {0x49BB3E47, 0x2674860D, 0xA8B392AC, 0x021AC4E6, 
                  0x409283CF, 0x620E5D86, 0x6D929DCB, 0x96CC2A8B};

u32 IV_384[16] = {0x4164E55A, 0x92332228, 0x658565BB, 0x07F66B77, 
                  0x8ACF5755, 0x650B6A85, 0x4AC0E038, 0x6814ECD5, 
                  0x6B87E864, 0xB31D971F, 0x75ADA1C8, 0x0A89885D, 
                  0x8A06A5DB, 0x34037C2E, 0x08F156E2, 0xD8CA287C};

u32 IV_512[16] = {0x7F532ACF, 0xCA7B9ADB, 0x251708DE, 0xCF31EDF8, 
                  0xB7411A0D, 0x3C712D17, 0x5A38CF04, 0x9A27ABD2, 
                  0x8C4540AD, 0x5D99F41B, 0xE3887683, 0x26B73DFF, 
                  0x27994E0F, 0x00E3F726, 0x1606C84C, 0x719A682A};

/* Initialization of the internal state of the hash function         */

HashReturn Init(hashState *state, int hashbitlen)
{

int i;


/* Initialization of the counter of number of bits that were hashed  */
/* so far                                                            */ 

   state->bitcount = 0;


/* Store the requested digest size                                   */

   state->DigestSize = hashbitlen;


/* Initialize the message block to empty                             */

   memset(state->buffer,0,128);


/* Set the input to the compression function to all zero             */

   memset(state->chaining_value,0,64); 


/* Set the message block to zero				     */

   memset(state->buffer,0,128);

   
/* Load the correct IV                                               */


   if (hashbitlen==224)
      {
	 for (i=0;i<8;i++) 
            U32TO8_LITTLE(state->chaining_value + 4*i, IV_224[i]);
         state->BlockSize = 512;
         return SUCCESS;
      }   
   if (hashbitlen==256)
      {
	 for (i=0;i<8;i++) 
            U32TO8_LITTLE(state->chaining_value + 4*i, IV_256[i]);
         state->BlockSize = 512;
         return SUCCESS;
      }   
   if (hashbitlen==384)
      {
	 for (i=0;i<16;i++) 
            U32TO8_LITTLE(state->chaining_value + 4*i, IV_384[i]);
         state->BlockSize = 1024;
         return SUCCESS;
      }   
   if (hashbitlen==512)
      {
	 for (i=0;i<16;i++) 
            U32TO8_LITTLE(state->chaining_value + 4*i, IV_512[i]);
         state->BlockSize = 1024;
         return SUCCESS;
      }   


/* If the digest size is not one of the official 4, return error     */

   return BAD_HASHBITLEN;
}



/* Compressing the input data, and updating the internal state       */

HashReturn Update (hashState *state, const BitSequence *data, DataLength
                   databitlen)
{

/* p is a pointer to the current location inside data that we need   */
/* to process (i.e., the first byte of the data which was not used   */
/* as an input to the compression function                           */
   u8 *p = (u8*)data;

/* len is the size of the data that was not process yet in bytes     */
   int len = databitlen>>3;

/* BlockSizeB is the size of the message block of the compression    */
/* function                                                          */
   int BlockSizeB = (state->BlockSize/8);

/* bufcnt stores the number of bytes that are were "sent" to the     */
/* compression function, but were not yet processed, as a full block */
/* has not been obtained                                             */
   int bufcnt= (state->bitcount>>3)%BlockSizeB;

/* local_bitcount contains the number of bits actually hashed so far */
   u64 local_bitcount;

/* If we had to process a message with partial bytes before, then    */
/* Update() should not have been called again.                       */
/* We just discard the extra bits, and inform the user               */

   if (state->bitcount&7ULL)
      {
         fprintf(stderr, "We are sorry, you are calling Update one time after\n"
 		         "what should have been the last call. We ignore\n"
		         "few bits of the input.\n");
         state->bitcount &= ~7ULL;
      }


/* load the number of bits hashed so far into local_bitcount         */

   local_bitcount=state->bitcount;


/* mark that we processed more bits                                  */

   state->bitcount += databitlen;


/* if the input contains a partial byte - store it independently     */

   if (databitlen&7)
      state->partial_byte = data[databitlen>>3];


/* Check if we have enough data to call the compression function     */
/* If not, just copy the input to the buffer of the message block    */

   if (bufcnt + len < BlockSizeB)
      {
         memcpy(&state->buffer[bufcnt], p, len);
         return SUCCESS;
      }


/* There is enough data to start calling the compression function.   */
/* We first check whether there is data remaining from previous      */
/* calls                                                             */

   if (bufcnt>0)
      {

/* Copy from the input the required number of bytes to fill a block  */

         memcpy(&state->buffer[bufcnt], p, BlockSizeB-bufcnt);

/* Update the location of the first byte that was not processed      */

         p += BlockSizeB-bufcnt;

/* Update the remaining number of bytes to process                   */

         len -= BlockSizeB-bufcnt;

/* Update the number of bits hashed so far (locally)                 */

         local_bitcount+=8*(BlockSizeB-bufcnt);

/* Call the respective compression function to process the current   */
/* block                                                             */

         if (state->DigestSize<257)
            Compress256(state->buffer, state->chaining_value, local_bitcount);
         else
            Compress512(state->buffer, state->chaining_value, local_bitcount);
    }


/* At this point, the only remaining data is from the message block  */
/* call the compression function as many times as possible, and      */
/* store the remaining bytes in the buffer                           */

/* Each step of the loop compresses BlockSizeB bytes                 */

   for( ; len>=BlockSizeB; len-=BlockSizeB, p+=BlockSizeB)
      {

/* Update the number of bits hashed so far (locally)                 */

         local_bitcount+=8*BlockSizeB;

/* Call the respective compression function to process the current   */
/* block                                                             */

         if (state->DigestSize<257)
            Compress256(p, state->chaining_value, local_bitcount);
         else 
            Compress512(p, state->chaining_value, local_bitcount);

      }


/* If there are still unprocessed bytes, store them locally and wait */
/* for more                                                          */

   if (len>0)
      memcpy(state->buffer, p, len);

   return SUCCESS;
}


/* Performing the padding scheme, and dealing with any remaining     */
/* bits                                                              */

HashReturn Final (hashState *state, BitSequence *hashval)
{

/* Stores inputs (message blocks) to the compression function        */

   u8 block[128];

/* Stores results (chaining value) of the compression function       */

   u8 result[64];

/* BlockSizeB is the size of the message block of the compression    */
/* function                                                          */

   int BlockSizeB = (state->BlockSize/8);

/* bufcnt stores the number of bytes that are were "sent" to the     */
/* compression function, but were not yet processed, as a full block */
/* has not been obtained                                             */

   int bufcnt= ((unative)state->bitcount>>3)%BlockSizeB;

   int i;

/* Copy the current chaining value into result (as a temporary step) */

   if (state->DigestSize < 257)
      memcpy(result, state->chaining_value, 32);
   else
      memcpy(result, state->chaining_value, 64);


/* Initialize block as the message block to compress with the bytes  */
/* that were not processed yet                                       */

   memset(block, 0, BlockSizeB);
   memcpy(block, state->buffer, bufcnt);


/* Pad the buffer with the byte which contains the fraction of bytes */
/* from and a bit equal to 1					     */

   block[bufcnt] = (state->partial_byte&\
      ~((0x80 >> (state->bitcount&7))-1)) | (0x80 >> (state->bitcount&7));


/* Compress the last block (according to the digest size)            */

  if (state->DigestSize<257) {


/* An additional message block is required if there are less than 10 */
/* more bytes for message length and digest length encoding          */

     if (bufcnt>=BlockSizeB-10)
        {

/* Compress the current block                                        */
           Compress256(block,result,state->bitcount);

/* Generate the full padding block                                   */
           memset(block, 0, BlockSizeB);
           U64TO8_LITTLE(block+BlockSizeB-10, state->bitcount);
           U16TO8_LITTLE(block+BlockSizeB-2, state->DigestSize);

/* Compress the full padding block                                   */
           Compress256(block,result,0x0ULL);

        }

     else

        {

/* Pad the number of bits hashed so far and the digest size to the  */
/* last message block and compress it				    */
           U64TO8_LITTLE(block+BlockSizeB-10, state->bitcount);
           U16TO8_LITTLE(block+BlockSizeB-2, state->DigestSize);
           if (state->bitcount % state->BlockSize)
              Compress256(block,result, state->bitcount);
	   else
              Compress256(block,result, 0x0ULL);
        }
   }

/* In case the requested digest size is more than 256 bits           */ 

   else

      {

/* An additional message block is required if there are less than 18 */
/* more bytes for message length and digest length encoding          */
         if (bufcnt>=BlockSizeB-18)
            {

/* Compress the current block                                        */
               Compress512(block,result,state->bitcount);

/* Generate the full padding block                                   */
               memset(block, 0, BlockSizeB);
               U64TO8_LITTLE(block+BlockSizeB-18, state->bitcount);
               U16TO8_LITTLE(block+BlockSizeB-2, state->DigestSize);

/* Compress the full padding block                                   */
               Compress512(block,result,0x0UL);
            }

         else

            {
/* Pad the number of bits hashed so far and the digest size to the   */
/* last message block and compress it				     */
               U64TO8_LITTLE(block+BlockSizeB-18, state->bitcount);
               memset(block+BlockSizeB-10,0,8);
               U16TO8_LITTLE(block+BlockSizeB-2, state->DigestSize);
               if (state->bitcount % state->BlockSize)
                  Compress512(block,result, state->bitcount);
	       else
                  Compress512(block,result, 0x0ULL);

            }
      }


/* Copy the result into the supplied array of bytes.                 */

   for (i=0;i<(state->DigestSize+7)/8;i++)
       hashval[i]=result[i];


/* Treat cases where the digest size is not a multiple of a byte     */

   if ((state->DigestSize)&7)
       hashval[(state->DigestSize+7)/8] &= \
              (0xFF<<(8-((state->DigestSize)%8)))&0xFF;

   return SUCCESS;

}


/* Hashing a message, from initialization till the end               */

HashReturn Hash (int hashbitlen, const BitSequence *data,
                 DataLength databitlen, BitSequence *hashval)
{
   HashReturn Status;
   hashState state;

   Status = Init(&state, hashbitlen);
   if (Status != SUCCESS) return (Status);
   Status = Update (&state, data, databitlen);
   if (Status != SUCCESS) return (Status);
   Status = Final (&state, hashval);
   if (Status != SUCCESS) return (Status);

   return (SUCCESS);

}

