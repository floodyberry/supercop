/******************************************************************************************
	A PCLMULQDQ and SSE4 based implementation of Trivia0v2 AE scheme.

	Trivia0v2 is a stream cipher based cadidate scheme for the CAESAR AE competition.
	In the implementation, we replace the field multiplication algorithm presented in
	the reference implementation with a faster algorithm that utilizes Intel's PCLMULQDQ
	instruction along with some other Intel SSE4 instructions.
	This implementation is quite fast as compared to the reference implementation, but
	we still think that the code is not optimal. We welcome any comments/suggestions for
	further optimization of our implementation.

		@designers:
			Avik Chakraborti <avikchkrbrti@gmail.com>
			Mridul Nandi <mridul.nandi@gmail.com>

		@implementors:
			Avik Chakraborti <avikchkrbrti@gmail.com>
			Ashwin Jha <ajha.dev@gmail.com>

*******************************************************************************************/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include <wmmintrin.h>
#include <emmintrin.h>
#include <smmintrin.h>
#include <immintrin.h>
#include "crypto_aead.h"

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;

#define CONST_alpha_32 0x00400007			// The primitive polynomial for GF(2^32), alpha
#define CONST_beta_64 0x000000000000001B	// The primitive polynomial for GF(2^64), beta
#define PROC_CHECKSUM 1						// Here we process Checksum blocks.
#define PROC_BLOCK 0
#define PROC_AD 1							// Process Associated Data.
#define PROC_MSG 0							// Process Message.

/*
 * Different Modes of Uses of Streamcipher Keys 
 */
#define DROP_KEY 0							// NO use so drop the key...
#define CT_GEN_KEY 1						// to generate ciphertext
#define LEN_HASH_KEY_AD 2					// to handle variable length hashing for AD
#define LEN_HASH_KEY_MSG 3					// to handle variable length hashing for Message
#define ENCRYPTION 1						// If 1 encrypting, otherwise (i.e, 0) decrypting
#define CHUNK_SIZE 0x100000000				// Process checksum after 2^32 blocks 
#define MAX_IT 0x08000000          			// Intermediate Tag (if any) upto 2^23 blocks (2^32 bytes)

/*
 * Will be used For TriviA-0 version 
 */
#define CHUNK_SIZE_MSG 0x100000000
#define IT 0								// No intermediate Tag (ITag)
#define SV_PARAM 0x0000000000000000
/*---------------------------------*/

/*
 * Will be used TriviA-128 version 
 */
//#define CHUNK_SIZE_MSG 128 					// Process checksum after 2^7 Msg Blocks\
											   (not for AD) for ITag 
//#define IT 1 								// Intermediate Tag is produced until 2^{32} blocks 
//#define SV_PARAM 0x00800000 
/*-------------------------------*/

u32             G_STAR;						// alpha - x^32, where alpha is the choosen\
											   			32 bit primitive polynomial.
u64             Q_PLUS; 					// x^64/alpha


inline u64
dec_load64(const u8 * Bytes)
{
    int             i;
    u64             Block = 0;
    Block = Bytes[0];
    for (i = 1; i < 8; i++) {
		Block <<= 8;
		Block = (Block) ^ (u64) (Bytes[i]);
    }
    return Block;
}


inline u32
dec_load32(const u8 * Bytes)
{
    int             i;
    u32             Block = 0;
    Block = (u8) Bytes[0];
    for (i = 1; i < 4; i++) 
	{
		Block <<= 8;
		Block = (Block) ^ (u32) (Bytes[i]);
    }
    return Block;
}


inline void
store64(u8 * bytes, u64 block)
{
	*(u64*)bytes =
      ((block & 0xFF00000000000000u) >> 56u) |
      ((block & 0x00FF000000000000u) >> 40u) |
      ((block & 0x0000FF0000000000u) >> 24u) |
      ((block & 0x000000FF00000000u) >>  8u) |
      ((block & 0x00000000FF000000u) <<  8u) |      
      ((block & 0x0000000000FF0000u) << 24u) |
      ((block & 0x000000000000FF00u) << 40u) |
      ((block & 0x00000000000000FFu) << 56u);
}


inline void
store32(u8 * bytes, u32 word)
{
   	*(u32*)bytes =
      ((word & 0xFF000000u) >> 24u) |
      ((word & 0x00FF0000u) >> 8u) |
      ((word & 0x0000FF00u) << 8u) |
      ((word & 0x000000FFu) << 24u);
}


inline u64
load64(const u8 * bytes)
{
	u64		block = *(u64*)bytes;
	block =
      ((block & 0xFF00000000000000u) >> 56u) |
      ((block & 0x00FF000000000000u) >> 40u) |
      ((block & 0x0000FF0000000000u) >> 24u) |
      ((block & 0x000000FF00000000u) >>  8u) |
      ((block & 0x00000000FF000000u) <<  8u) |      
      ((block & 0x0000000000FF0000u) << 24u) |
      ((block & 0x000000000000FF00u) << 40u) |
      ((block & 0x00000000000000FFu) << 56u);
	return block;
}


inline u32
load32(const u8 * bytes)
{
	u32		block = *(u32*)bytes;
   	block =
      ((block & 0xFF000000u) >> 24u) |
      ((block & 0x00FF0000u) >> 8u) |
      ((block & 0x0000FF00u) << 8u) |
      ((block & 0x000000FFu) << 24u);
	return block;
}


/*----------------------------
 *
 * State updation subroutine
 * 
 *---------------------------*/
void
SC_Update64(u64 * S, u64 * Z)
{
    u64             t1 = (S[0] << (66 - 64) | S[1] >> (128 - 66)) 
											^ (S[1] << (132 - 128) | S[2] >> (192 - 132));

    u64             t2 = (S[3] << (69 - 64) | S[4] >> (128 - 69)) 
											^ (S[3] << (105 - 64) | S[4] >> (128 - 105));

    u64             t3 = (S[5] << (66 - 64) | S[6] >> (128 - 66)) 
											^ (S[6] << (147 - 128) | S[7] >> (192 - 147));

    Z[0] = t1 ^ t2 ^ t3 ^ ((S[0] << 38 | S[1] >> 26) & (S[3] << 2 | S[4] >> 62));	// Key Block generated

    // Computing Updated Blocks
    t1 ^= ((S[1] << (130 - 128) | S[2] >> (192 - 130)) 
								& (S[1] << (131 - 128) | S[2] >> (192 - 131))) 
					^ (S[3] << (96 - 64) | S[4] >> (128 - 96));

    t2 ^= ((S[3] << (103 - 64) | S[4] >> (128 - 103)) 
								& (S[3] << (104 - 64) | S[4] >> (128 - 104))) 
					^ (S[5] << (120 - 64) | S[6] >> (128 - 120));

    t3 ^= ((S[6] << (145 - 128) | S[7] >> (192 - 145)) 
								& (S[6] << (146 - 128) | S[7] >> (192 - 146))) 
					^ (S[0] << (75 - 64) | S[1] >> (128 - 75));

    S[2] = S[1];
    S[1] = S[0];
    S[0] = t3;
    S[4] = S[3];
    S[3] = t1;
    S[7] = S[6];
    S[6] = S[5];
    S[5] = t2;
}


u64
Key_Ext64(u64 * S)
{
    u64             t1 = (S[0] << (66 - 64) | S[1] >> (128 - 66)) 
											^ (S[1] << (132 - 128) | S[2] >> (192 - 132));
    u64             t2 = (S[3] << (69 - 64) | S[4] >> (128 - 69)) 
											^ (S[3] << (105 - 64) | S[4] >> (128 - 105));
    u64             t3 = (S[5] << (66 - 64) | S[6] >> (128 - 66)) 
											^ (S[6] << (147 - 128) | S[7] >> (192 - 147));

    return t1 ^ t2 ^ t3 ^ ((S[0] << 38 | S[1] >> 26) & (S[3] << 2 | S[4] >> 62));	// Key Block generated
}


inline void
insert_SC(u64 * SC_State, u32 * Tag)
{
    SC_State[0] ^= ((u64) Tag[0] << 32) ^ Tag[1];
    SC_State[1] ^= ((u64) Tag[2] << 32) ^ Tag[3];
}


/*-----------------------------------------------------------------
 *
 * Multiplication by alpha power m. We use mainly for m = 1,2,3,4 
 *
/*----------------------------------------------------------------*/
inline u32
Mult_by_alpha_power(u32 a, int m)
{
    u32             result;

    while (m--) 
	{
		result = a << 1;
		if (((a >> 31) & 1) == 1)
			result = result ^ (CONST_alpha_32);
		a = result;
    }
    return result;
}


/*------------------------------------------------------------------------
 *
 * Horner's Multiplication for 32-bit Vandermonde Matrix Multiplcaition
 * When FULL is 1 (for AD) we process 160 bit tags, otheriwse (for
 * message) 128 bit
 *
 *-----------------------------------------------------------------------*/
void
V_Horner_32(u32 Input, u32 * Tag)
{
    Tag[0] = Tag[0] ^ Input;
    Tag[1] = Mult_by_alpha_power(Tag[1], 1) ^ Input;
    Tag[2] = Mult_by_alpha_power(Tag[2], 2) ^ Input;
    Tag[3] = Mult_by_alpha_power(Tag[3], 3) ^ Input;
}


/*---------------------------------------------------
 *
 * Multiplication by beta power m, we use m = 1,2,3 
 *
 *--------------------------------------------------*/
inline u64
Mult_by_beta_power(u64 b, int m)
{
    u64             result;

    while (m--) 
	{
		result = b << 1;
		if (((b >> 63) & 1) == 1)
			result = result ^ (CONST_beta_64);
		b = result;
    }
    return result;
}


/*----------------------------------------------------------------------
 * Horner's Multiplication for 64-bit Vandermonde Matrix Multiplcaition
 * When FULL is 1 (for AD) we process 4 checksum blocks, otheriwse (for
 * message) 3 blocks
 *---------------------------------------------------------------------*/
void
V_Horner_64(u64 Input, u64 * Checksum)
{
    Checksum[0] = Checksum[0] ^ Input;
    Checksum[1] = Mult_by_beta_power(Checksum[1], 1) ^ Input;
    Checksum[2] = Mult_by_beta_power(Checksum[2], 2) ^ Input;
}


u32 
Field_Mult_32(u32 a, u32 b)
{
	__m128i			x,
					y;

	x = _mm_cvtsi32_si128(a);
	y = _mm_cvtsi32_si128(b);
	x = _mm_clmulepi64_si128(x,y,0x0);
	
	a = _mm_extract_epi32(x, 0x0);
	b = _mm_extract_epi32(x, 0x1);

	y = _mm_cvtsi64_si128(Q_PLUS);
	x = _mm_cvtsi32_si128(b);	
	x = _mm_clmulepi64_si128(x,y,0x0);

	b = _mm_extract_epi32(x, 0x1);

	y = _mm_cvtsi32_si128(G_STAR);	
	x = _mm_cvtsi32_si128(b);
	x = _mm_clmulepi64_si128(x,y,0x0);
		
	b = _mm_extract_epi32(x, 0x0);

	return a^b;
}


/*----------------------------------------------------------------
 *
 * Pad The Final Block (Possibly Empty and must be Incomplete) by
 * appending 10* 
 *
 *---------------------------------------------------------------*/
inline u64
pad(const u8 * Bytes, int Last_len)
{
    int             i;
    u64             Block = 0;

    for (i = 0; i < Last_len; i++) 
	{
		Block ^= (u64) Bytes[i];
		Block <<= 8;
    }
    Block ^= 128;
    Block <<= 8 * (7 - Last_len);
   
	return Block;
}


/*-----------------------------------------------------------------------------------------------
 *
 * The WORKHORSE of TriviA. Repeated for Every 64 bits of message or associate data. 
 * Apply Pseudo-dot-Product and, update State, Tag & Checksum (if not processing checksum) 
 *
 *----------------------------------------------------------------------------------------------*/
void
process_block(u64 Block, u32 * Tag, u64 * Checksum, u64 * SC_State, u64 * Z, u8 IsChecksum)	
{
    u32             State_Key[2],
                    word[2],
                    PDP;

    word[0] = (u32) (((Block >> 32) & (0x00000000FFFF0000)) ^
	       						((Block >> 16) & (0x000000000000FFFF)));
    word[1] = (u32) (((Block >> 16) & (0x00000000FFFF0000)) ^ 
										(Block & (0x000000000000FFFF)));	// Parse Blocks 
																			// into words

    State_Key[0] = (u32) (((SC_State[0] >> 32) & (0x00000000FFFF0000)) ^
						       ((SC_State[0] >> 16) & (0x000000000000FFFF)));
    State_Key[1] = (u32) (((SC_State[0] >> 16) & (0x00000000FFFF0000)) ^
								       (SC_State[0] & (0x000000000000FFFF)));

    SC_Update64(SC_State, Z);	// Update the State 

    PDP = Field_Mult_32(word[0] ^ State_Key[0], word[1] ^ State_Key[1]);	// Pseudo-dot-Product

    V_Horner_32(PDP, Tag);	// Update Tag always.

    if (!IsChecksum) 
	{
		V_Horner_64(Block, Checksum);				// update checksum if not checksum block.
    }
}


/*----------------------------------------------------------------------------------
 *
 * The Common Module for Both Encryption and Decryption which Implements 1152 
 * Round initialization, Process Associated Data to Produce Intermediate Tag,
 * XOR the Tag With Current State and Reinitialize The State With 1152 Round 
 *
 *---------------------------------------------------------------------------------*/
void
Initialize_process_AD_Reinitialize(u64 * SC_State, const u8 *ad,
				   									u64 adlen)
{
    u64             Z[1],
                    Checksum[3],
                    Block,
                    ck_ctr;
    u32             dummy_word[2],
                    Tag[4],
                    temp;
    u8              FINISH;
    int             i;

    for (i = 0; i < 18; i++) 
	{
		SC_Update64(SC_State, Z);				// Update SC_State for 18 64-rounds.
    }

    /*
     * PROCESS ASSOCIATED DATA BLOCKS...  
     */
    ck_ctr = CHUNK_SIZE;
    memset(Tag,0x0,4*sizeof Tag[0]);
    memset(Checksum,0x0,3*sizeof Checksum[0]);
    while (adlen >= 8)		// Process All But the Final Block of AD 
    {
		Block = load64(ad);
		process_block(Block, Tag, Checksum, SC_State, Z, PROC_BLOCK);	// Update the Tag and Checksum
		ad = ad + 8;
		adlen = adlen - 8;
		ck_ctr--;
		if (ck_ctr == 0)	// process the checksum blocks
		{
			for (i = 0; i < 3; i++) 
			{
				process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM);	// Update Tag for the Checksum Block 
			}
			ck_ctr = CHUNK_SIZE;
    		memset(Checksum,0x0,3*sizeof Checksum[0]);	// Reset The Chunk Counter and Set 
														// the Checksum Array to zero
		}
    }

    process_block(pad(ad, adlen), Tag, Checksum, SC_State, Z, PROC_BLOCK);	// Update the Tag and 
																			// Checksum for the Final Block

    // Update the Tag for the Final 3 Checksum Blocks for AD and Get the
    // Key for Variable Length Handling
    for (i = 0; i < 3; i++) 
	{
		process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM);
		if (i == 0) 
		{
			Tag[0] ^= (u32) (Z[0] >> 32);
			Tag[1] ^= (u32) (Z[0]);
		}
		if (i == 2) 
		{
			Tag[2] ^= (u32) (Z[0] >> 32);
			Tag[3] ^= (u32) (Z[0]);
		}
    }

    insert_SC(SC_State, Tag);	// Insert Tag for AD to streamcipher state

    for (i = 0; i < 18; i++) 
	{
		SC_Update64(SC_State, Z);				// Update SC_State for 18 64-rounds.
    }
}


int
crypto_aead_encrypt(u8 *c, u64 *clen, const u8 *m,
		     		u64 mlen,const u8 *ad, u64 adlen,
				    const u8 *nsec, const u8 *npub, const u8 *k)
{
    u64             SC_State[8],
                    Z[1],
                    Checksum[3],
                    Block,
                    ck_ctr,
                    blk_ctr;
    u32             dummy_word[2],
                    Tag[4],
                    temp;
    u8              FINISH;
    int             i;

    *clen = 0;

	G_STAR = 0x00400007;		// setting up the exact
	Q_PLUS = 0x0100401003;		// polynomials

    SC_State[0] = load64(k);
    SC_State[1] = load64(k + 8);
    SC_State[2] = 0x0000000000000000;
    SC_State[3] = 0x0000000000000000;
    SC_State[4] = 0x0000000003800000;
    SC_State[5] = SV_PARAM;
    SC_State[6] = load64(npub);
    SC_State[7] = 0x0000000000000000;

    Initialize_process_AD_Reinitialize(SC_State, ad, adlen);	// Initialize, Process AD
																// and Reinitialize
    /*
     * PROCESS MESSAGE BLOCKS.  
     */
    ck_ctr = CHUNK_SIZE_MSG;
    blk_ctr = MAX_IT;
    memset(Tag,0x0,4*sizeof Tag[0]);
    memset(Checksum,0x0,3*sizeof Checksum[0]);
    while (mlen >= 8)		// Process All But the Final Block of Padded Message 
    {
		Block = load64(m);
		process_block(Block, Tag, Checksum, SC_State, Z, PROC_BLOCK);	// Update the Tag and 
																		// the Checksum
		for (i = 0; i < 8; i++) 
		{
			c[i] = ((u8) (Z[0] >> (8 * (7 - i)))) ^ (m[i]);			// ciphertext computation 
		}

		m = m + 8;
		c = c + 8;
		mlen = mlen - 8;
		*clen = *clen + 8;
		ck_ctr--;
		if (blk_ctr > 0)
			blk_ctr--;

		if (ck_ctr == 0)	// process the checksum blocks 
		{
			for (i = 0; i < 3; i++) 
			{
				process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM);	// Update Tag for 
																						// the Checksum Block
			}
			ck_ctr = CHUNK_SIZE_MSG;
		    memset(Checksum,0x0,3*sizeof Checksum[0]);	// Reset The Chunk Counter and Set 
														// the Checksum Array to zero
		}
    }

    // Process the Final Block (possibly emty) of Mesage after we apply
    // 10* pad
    process_block(pad(m, mlen), Tag, Checksum, SC_State, Z, PROC_BLOCK);	// Update the Tag and 
																			// Checksum for the Final Block
    for (i = 0; i < mlen; i++) 
	{
		c[i] = ((u8) (Z[0] >> (8 * (7 - i)))) ^ (m[i]);
    }				// ciphertext for final block 
    *clen = *clen + mlen;
    c = c + mlen;

    // Update the Tag for the Final 3 Checksum Blocks for Message and Get
    // the Key for Variable Length Handling
    for (i = 0; i < 3; i++) 
	{
		process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM);
		if (i == 0) 
		{
			Tag[0] ^= (u32) (Z[0] >> 32);
			Tag[1] ^= (u32) (Z[0]);
		}
		if (i == 2) 
		{
			Tag[2] ^= (u32) (Z[0] >> 32);
			Tag[3] ^= (u32) (Z[0]);
		}
    }

    for (i = 0; i < 4; i++) 
	{
		store32(c, Tag[i]);
		c = c + 4;
    }
    *clen = *clen + 16;

    return 0;
}

int
crypto_aead_decrypt(u8 *m, u64 *outputmlen, u8 *nsec, 
					const u8 *c, u64 clen, const u8 *ad, 
					u64 adlen, const u8 *npub, const u8 *k)
{
    u64             SC_State[8],
                    Z[1],
                    Checksum[3],
                    Block,
                    ck_ctr,
                    blk_ctr;
    u32             dummy_word[2],
                    Tag[4],
                    temp;
    u8              FINISH,
                   *tempvar;
    u64             t1,
                    t2,
                    t3,
                    i,
                    j;
    int             ctr_tag = 0;
   
	*outputmlen = 0;

	G_STAR = 0x00400007;		// setting up the exact
	Q_PLUS = 0x0100401003;		// polynomials

    // Load State Blocks with Nonce and key
    SC_State[0] = dec_load64(k);
    SC_State[1] = dec_load64(k + 8);
    SC_State[2] = 0x0000000000000000;
    SC_State[3] = 0x0000000000000000;
    SC_State[4] = 0x0000000003800000;
    SC_State[5] = SV_PARAM;
    SC_State[6] = dec_load64(npub);
    SC_State[7] = 0x0000000000000000;

    Initialize_process_AD_Reinitialize(SC_State, ad, adlen);	// Initialize, Process AD
																// and Reinitialize
    /*
     * PROCESS CIPHERTEXT BLOCKS.  
     */
    ck_ctr = CHUNK_SIZE_MSG;
    blk_ctr = MAX_IT;
    memset(Tag,0x0,4*sizeof Tag[0]);
    memset(Checksum,0x0,3*sizeof Checksum[0]);
    clen = clen - 16;
    while (clen >= 8)	// Process ALL but the Final Block of the Ciphertext
    {

		Z[0] = Key_Ext64(SC_State);	// Extract the Encryption Key First

		for (i = 0; i < 8; i++) 
		{
			m[i] = ((u8) (Z[0] >> (8 * (7 - i)))) ^ (c[i]);			// Decrypt the Ciphertext
		}
		Block = dec_load64(m);
	
		process_block(Block, Tag, Checksum, SC_State, Z, PROC_BLOCK);	// Update the Tag in 
																		// the Decryptor Side

		m = m + 8;
		c = c + 8;
		*outputmlen = *outputmlen + 8;
		clen = clen - 8;
		ck_ctr--;
		if (blk_ctr > 0)
			blk_ctr--;

		if (ck_ctr == 0)	// process the checksum blocks
		{
			for (i = 0; i < 3; i++) 
			{
				process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM);	// Update Tag for
																						// the Checksum Block
			}
			ck_ctr = CHUNK_SIZE_MSG;
			memset(Checksum,0x0,3*sizeof Checksum[0]);	// Reset The Chunk Counter and Set 
														// the Checksum Array to zero 
		}
    }

    // Process the Final Block (possibly empty) of cipheretxt 
    Z[0] = Key_Ext64(SC_State);	// Extract the Key for the Final Block

    for (i = 0; i < clen; i++) 
	{
		m[i] = ((u8) (Z[0] >> (8 * (7 - i)))) ^ (c[i]);
    }				// Decrypt to the Final Message Block
    
	process_block(pad(m, clen), Tag, Checksum, SC_State, Z, PROC_BLOCK);	// Update the Tag in 
																				// the Decryptor Side
    *outputmlen = *outputmlen + clen;
    c = c + clen;

    // Update the Tag for the Final 4 Checksum Blocks and Get the Key for
    // Variable Length Handling
    for (i = 0; i < 3; i++) 
	{
		process_block(Checksum[i], Tag, Checksum, SC_State, Z, PROC_CHECKSUM);
		if (i == 0) 
		{
			Tag[0] ^= (u32) (Z[0] >> 32);
			Tag[1] ^= (u32) (Z[0]);
		}
		if (i == 2) 
		{
			Tag[2] ^= (u32) (Z[0] >> 32);
			Tag[3] ^= (u32) (Z[0]);
		}
    }

    for (i = 0; i < 4; i++)	// Check the Equality of the Final Tag
    {
		temp = dec_load32(c + i * 4);
		if ((Tag[i]) != temp)
			return -1;
    }
    return 0;
}

