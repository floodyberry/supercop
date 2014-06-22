/*
 * Kiasu=/= bitslice C Implementation
 * 
 * Copyright 2014:
 *     Jeremy Jean <JJean@ntu.edu.sg>
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 * 
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include "kiasu.h"

/***************************************************************************/
/***                    COMPILER SPECIFIC DEFINITIONS                    ***/
/***************************************************************************/

/* Define standard sized integers                                          */
#if defined(_MSC_VER) && (_MSC_VER < 1600)
	typedef unsigned __int8  uint8_t;
	typedef unsigned __int32 uint32_t;
	typedef unsigned __int64 uint64_t;
	typedef          __int64 int64_t;
#else
	#include <stdint.h>
#endif

/* How to force specific alignment, request inline, restrict pointers      */
#if __GNUC__
	#define GCC_VERSION (__GNUC__ * 10 + __GNUC_MINOR__)
	#define ALIGN(n) __attribute__ ((aligned(n)))
	#define inline __inline__
	#define restrict __restrict__
#elif _MSC_VER
	#define ALIGN(n) __declspec(align(n))
	#define inline __inline
	#define restrict __restrict
#elif __STDC_VERSION__ >= 199901L   /* C99: delete align, keep others      */
	#define ALIGN(n)
#else /* Not GNU/Microsoft/C99: delete alignment/inline/restrict uses.     */
	#define ALIGN(n)
	#define inline
	#define restrict
#endif

/* How to endian reverse a uint64_t                                        */
#if _MSC_VER
	#include <intrin.h>
	#pragma intrinsic(_byteswap_uint64)
	#define bswap64(x) _byteswap_uint64(x)
#elif __GNUC__ && (GCC_VERSION >= 43)
	#define bswap64(x) __builtin_bswap64(x)
#else
	#define bswap32(x)                                              \
	   ((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) | \
		(((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))

	 static inline uint64_t bswap64(uint64_t x) {
		union { uint64_t u64; uint32_t u32[2]; } in, out;
		in.u64 = x;
		out.u32[0] = bswap32(in.u32[1]);
		out.u32[1] = bswap32(in.u32[0]);
		return out.u64;
	}
#endif

/***************************************************************************/
/* Derived configuration options - Adjust as needed                        */
/***************************************************************************/
#define USE_SSE2    ((__SSE2__ || (_M_IX86_FP>=2) || _M_X64) && !VECTORS_OFF)

/***************************************************************************/
/* Define blocks and operations -- Patch if incorrect on your compiler.    */
/***************************************************************************/

#if USE_SSE2
    #include <xmmintrin.h>              /* SSE instructions and _mm_malloc */
    #include <emmintrin.h>              /* SSE2 instructions               */
    typedef ALIGN(16) __m128i block;
    #define xor_block(x,y)        _mm_xor_si128(x,y)
    #define zero_block()          _mm_setzero_si128()
    #define store(p,x)    _mm_store_si128((__m128i *)(p), (x))

	#if __SSSE3__
    	#include <tmmintrin.h>              /* SSSE3 instructions            */
	#endif


#define L0(i,tmpblock,ta,adp,b) {                                           \
    if((i)==0) {                                                            \
      (ta)[0]=zero_block();                                                 \
    } else {                                                                \
      (tmpblock)=_mm_loadu_si128((__m128i const*)&(adp)[(b)++]);            \
      _mm_store_si128((__m128i *)&(ta)[0], (tmpblock));                     \
    }                                                                       \
  }

#define L(i,count,tmpblock,ta,adp,b) {                                      \
    if((i)<(count)) {                                                       \
      (tmpblock)=_mm_loadu_si128((__m128i const*)&(adp)[(b)++]);            \
      _mm_store_si128((__m128i *)&(ta)[(i)], (tmpblock));                   \
    } else {                                                                \
      (ta)[(i)]=zero_block();                                               \
    }                                                                       \
  }


#endif

/***************************************************************************/
/***                DEFINITIONS OF TYPES USED IN KIASU=/=                ***/
/***************************************************************************/
typedef struct { ALIGN(16) uint32_t bs_key[11][32]; } AES_KEY;
typedef struct { ALIGN(16) uint32_t bs_tweak[32]; } AES_TWEAK;

/***************************************************************************/
/***                       ASSEMBLY PROTOTYPES                           ***/
/***************************************************************************/

/*
** Assembly function to generate the bitsliced subkeys
*/
void kasper_keysetup(AES_KEY *key,
		     const unsigned char *userKey);

/* void kasper_keysetup_test(AES_KEY *key, */
/* 			  const unsigned char *userKey, */
/* 			  unsigned char* out); */

/*
** Assembly function to generate the bitsliced tweak input
*/
void jean_tweaksetup(AES_TWEAK* allTweaks,
		     const unsigned char *tweak);

/*
** Assembly function that encrypts 8 blocks in parallel 
** Original author: Emilia Kasper
** Modified by: Jeremy Jean (April 2014)
*/
void kasper_ecb_encrypt(AES_KEY* key,
			const unsigned char* in,
                        unsigned char* out,
                        uint32_t blks,
                        AES_TWEAK* allTweaks);

/*
** Assembly function that decrypts 8 blocks in parallel
** Original author: Vinit Azad (from Emilia Kasper's work)
** Modified by: Jeremy Jean (April 2014)
*/
void jean_ecb_decrypt(AES_KEY* key,
		      const unsigned char* in,
                      unsigned char* out,
                      uint32_t blks,
                      AES_TWEAK* allTweaks);

/***************************************************************************/
/***                 C FUNCTIONS CALLING ASSEMBLY ONES                   ***/
/***************************************************************************/
void AES_set_encrypt_key(const unsigned char *userKey, AES_KEY *key) {kasper_keysetup(key, userKey);}
void AES_set_tweak(const unsigned char *tweak, AES_TWEAK* allTweaks) {jean_tweaksetup(allTweaks, tweak);}

/* The following encrypts ceil(nblks/8)*8 blocks */
#define AES_ecb_encrypt_blks(blks, nblks, key, allTweaks) 		\
    kasper_ecb_encrypt (key, (unsigned char *)(blks), (unsigned char *)(blks), nblks, allTweaks)

/* The following decrypts ceil(nblks/8)*8 blocks */
#define AES_ecb_decrypt_blks(blks, nblks, key, allTweaks)		\
    jean_ecb_decrypt (key, (unsigned char *)(blks), (unsigned char *)(blks), nblks, allTweaks)

#define BPI 8  /* Number of blocks in buffer per ECB call */

/***************************************************************************/
/***               CONSTANT DEFINITIONS USED IN THE MODE                 ***/
/***************************************************************************/

/* Define the three MSB of the tweak (that depend on the stage) */
#define MSB_AD              (0x2<<5)
#define MSB_AD_LAST         (0x6<<5)
#define MSB_M               (0x0<<5)
#define MSB_M_LAST_ZERO     (0x1<<5)
#define MSB_M_LAST_NONZERO  (0x4<<5)
#define MSB_PAD             (0x4<<5)
#define MSB_CHKSUM          (0x5<<5)

/***************************************************************************/
/***                      FUNCTIONS USED IN THE MODE                     ***/
/***************************************************************************/

/*
** Modifiy the nonce part in the tweak value
*/
 static void set_nonce_in_tweak(uint8_t *tweak, const uint8_t *nonce) {
   tweak[0]=                    (nonce[0] >> 3);
   tweak[1]=(nonce[0]&7) << 5 ^ (nonce[1] >> 3);
   tweak[4]=(nonce[1]&7) << 5 ^ (nonce[2] >> 3);
   tweak[5]=(nonce[2]&7) << 5 ^ (nonce[3] >> 3);
   tweak[8]=(nonce[3]&7) << 5;
 }

 /*
 ** Modifiy the block number in the tweak value
 */
inline static void set_block_number_in_tweak(uint8_t *tweak, const uint32_t block_no) {
   tweak[ 8]=((block_no >> 24) & 0xff) ^ (tweak[8] & 0xe0);
   tweak[ 9]=((block_no >> 16) & 0xff);
   tweak[12]=((block_no >>  8) & 0xff);
   tweak[13]=((block_no >>  0) & 0xff);
 }

 /*
 ** Modifiy the stage value in the tweak value
 */
 static void set_stage_in_tweak(uint8_t *tweak, const uint8_t value) {
   tweak[0]=(tweak[0] & 0x1f) ^ value ;
 }

/***************************************************************************/
/***                            ENCRYPTION                               ***/
/***************************************************************************/

/*
** Kiasu Encryption function
*/
void kiasu_aead_encrypt(const uint8_t *ad, size_t ad_len, 
			            const uint8_t *m, size_t m_len, 
			            const uint8_t *key, 
			            const uint8_t *nonce, 
			            uint8_t *c, size_t *c_len)
{

  size_t i;
  size_t b; 						/* number of blocks */
  size_t k;
  size_t count;				        /* Counter of the number of significative blocks to process */
  uint8_t *p;
  ALIGN(16) AES_TWEAK allTweaks;	/* Contain the tweak value in bitslice form */
  ALIGN(16) AES_KEY encrypt_key;	/* Contain all the subkeys in bitslice form */
  ALIGN(16) block Auth;				/* Auth value during the mode */
  ALIGN(16) block Checksum;			/* Checksum on the plaintext blocks */
  ALIGN(16) block PaddedBlock;		/* Padded blocks if needed, otherwise the zero bock */
  ALIGN(16) block ta[BPI];			/* 8 blocks for parallel processing */
  ALIGN(16) const block* adp;		/* Pointer to the blocks to process */
  uint8_t tweak[16];				/* The tweak value */
  ALIGN(16) __m128i tmpblock;

  /*************************************************
   *
   *               Initialization
   *
   *************************************************/

  /* The initial block is at address ad */
  adp = (block *)ad;

  /* Initialize the tweak value */
  memset(tweak, 0, 16);

  /* Initialize the Auth value to zero */
  Auth=zero_block();

  /* Convert the master key into bitslice after KS */
  AES_set_encrypt_key(key, &encrypt_key);

  /* Put the nonce in the tweak */
  set_nonce_in_tweak(tweak, nonce);

  /*************************************************
   *
   *               Associated data
   *
   *************************************************/

  /* Put the stage in the tweak */
  set_stage_in_tweak(tweak, MSB_AD);

  /*
   * Handle associated data, at a rate of 8 blocks at a time.
   */
  for (i=0, b=0; i <= ad_len; i+=BPI*16) {

  	/* Count the number of effective to encrypt in parallel */
    count=(ad_len-i)/16;
    if(count>=BPI) count=BPI;
    else count++;

    /* This cost about 0.5 cpb */
    set_block_number_in_tweak(tweak, i/16);
    AES_set_tweak(tweak, &allTweaks);

    /* This cost about 0.19 cpb */
    L0(i     ,tmpblock,ta,adp,b);
    L(1,count,tmpblock,ta,adp,b);
    L(2,count,tmpblock,ta,adp,b);
    L(3,count,tmpblock,ta,adp,b);
    L(4,count,tmpblock,ta,adp,b);
    L(5,count,tmpblock,ta,adp,b);
    L(6,count,tmpblock,ta,adp,b);
    L(7,count,tmpblock,ta,adp,b);

    /* bitslice AES on BPI=8 parallel blocks (about 6.6 cpb) */
    AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

    /* Accumulate the XOR in Auth */
    for (k=0; k<count; ++k) {
    	Auth=xor_block(Auth, ta[k]);
	}

  } /* i,b */

  /* If the last bytes have not been processed, because not a full block */
  if (!ad_len || b*16<ad_len) {

	  /* Put the stage in the tweak */
	  set_stage_in_tweak(tweak, MSB_AD_LAST);
      set_block_number_in_tweak(tweak, (const uint32_t)(b&0xfffffff8));
      AES_set_tweak(tweak, &allTweaks);

	  PaddedBlock=zero_block();
	  memcpy(&PaddedBlock, ad+16*(ad_len/16), ad_len&0xf);

	  p=(unsigned char*)&PaddedBlock;
	  p+=ad_len&0xf;
	  *p=0x80;

      ta[0] = PaddedBlock;
      ta[1] = PaddedBlock;
      ta[2] = PaddedBlock;
      ta[3] = PaddedBlock;
      ta[4] = PaddedBlock;
      ta[5] = PaddedBlock;
      ta[6] = PaddedBlock;
      ta[7] = PaddedBlock;

      /* bitslice AES on BPI=8 parallel blocks (about 6.6 cpb) */
      AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

      /* Update Auth value */
      Auth=xor_block(Auth, ta[b&0x7]);

  } /* if padding */

  /*
   * If we have encrypted at least 8 blocks with the above, we have encrypted
   * a dummy zero block, that needs to be compensated in the Auth value
   */

  /* Encrypt a dummy block of all zero to start counter from 1 in PMAC */
  set_stage_in_tweak(tweak, MSB_AD);
  set_block_number_in_tweak(tweak, 0);
  AES_set_tweak(tweak, &allTweaks);

  /* Zero the input blocks */
  ta[0]=zero_block();
  ta[1]=zero_block();
  ta[2]=zero_block();
  ta[3]=zero_block();
  ta[4]=zero_block();
  ta[5]=zero_block();
  ta[6]=zero_block();
  ta[7]=zero_block();
  AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

  /* XOR back to cancel */
  Auth=xor_block(Auth, ta[0]);

  /*************************************************
   *
   *                   Message
   *
   *************************************************/

  /* The initial block is at address m */
  adp = (block *)m;

  /* Put the stage in the tweak */
  set_stage_in_tweak(tweak, MSB_M);

  /* Initialize the Auth value at the beginning of PMAC */
  Checksum=zero_block();

  /*
   * Handle blocks of message, at a rate of 8 blocks at a time.
   */
  for (i=0, b=0; i <= m_len; i+=BPI*16) {

  	/* Count the number of effective to encrypt in parallel */
    count=(m_len-i)/16;
    if(count>=BPI) count=BPI;
    else count++;

    /* This cost about 0.5 cpb */
    set_block_number_in_tweak(tweak, i/16);
    AES_set_tweak(tweak, &allTweaks);

    /* This cost about 0.19 cpb */
    L0(i     ,tmpblock,ta,adp,b);
    L(1,count,tmpblock,ta,adp,b);
    L(2,count,tmpblock,ta,adp,b);
    L(3,count,tmpblock,ta,adp,b);
    L(4,count,tmpblock,ta,adp,b);
    L(5,count,tmpblock,ta,adp,b);
    L(6,count,tmpblock,ta,adp,b);
    L(7,count,tmpblock,ta,adp,b);

    /* Accumulate the XOR of input blocks in the Checksum  */
    for (k=0; k<count; ++k) {
	    Checksum=xor_block(Checksum, ta[k]);
    }

    /* bitslice AES on BPI=8 parallel blocks (about 6.6 cpb) */
    AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

    /* Write the ciphertext blocks */
    if(i==0) 		for (k=1; k<count; ++k) store(c+i+16*(k-1), ta[k]);
	else			for (k=0; k<count; ++k) store(c+16*k+i-16, ta[k]);

  } /* i,j,b */


  /* If the last bytes have not been processed, because not a full block */
  if (b*16<m_len) {

	  /* Put the stage in the tweak */
	  set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO);
      set_block_number_in_tweak(tweak, (const uint32_t)(b&0xfffffff8));
      AES_set_tweak(tweak, &allTweaks);

      /* Create the padded block with the bytes from the partial plaintext block */
	  PaddedBlock=zero_block();
	  memcpy(&PaddedBlock, m+16*(m_len/16), m_len&0xf);
	  p=(unsigned char*)&PaddedBlock;
	  p+=m_len&0xf;
	  *p=0x80;

	  /* Accumulate the XOR of input blocks in the Checksum  */
      Checksum=xor_block(Checksum, PaddedBlock);

      ta[0] = zero_block();
      ta[1] = zero_block();
      ta[2] = zero_block();
      ta[3] = zero_block();
      ta[4] = zero_block();
      ta[5] = zero_block();
      ta[6] = zero_block();
      ta[7] = zero_block();

      /* bitslice AES on BPI=8 parallel blocks (about 6.6 cpb) */
      AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

      /* Deduce the partial ciphertext  block */
      PaddedBlock=xor_block(PaddedBlock, ta[b&0x7]);

      /* Write the ciphertext bytes */
      memcpy(c+16*b, &PaddedBlock, m_len-b*16);

  } /* if padding */

  /*************************************************
   *
   *                Produce the tag
   *
   *************************************************/

  /* This cost about 0.19 cpb */
  ta[0] = Checksum;
  ta[1] = Checksum;
  ta[2] = Checksum;
  ta[3] = Checksum;
  ta[4] = Checksum;
  ta[5] = Checksum;
  ta[6] = Checksum;
  ta[7] = Checksum;

  /* Compute the encryption for all possible 3 lsb tweak values */

  if (b*16<m_len) 	set_stage_in_tweak(tweak, MSB_CHKSUM);
  else 				set_stage_in_tweak(tweak, MSB_M_LAST_ZERO);

  set_block_number_in_tweak(tweak, (const uint32_t)(b&0xfffffff8));
  AES_set_tweak(tweak, &allTweaks);

  /* bitslice AES on the Checksum */
  AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

  /* Select the correct tweak value from the 3 LSBs */
  Auth=xor_block(ta[b&0x7], Auth);

  /* Append the tag to the ciphertext */
  memcpy(c+m_len, &Auth, 16);

  /* Update the ciphertext length (16-byte tag appended at the end of the actual ciphertext) */
  *c_len=16+m_len;

}

/***************************************************************************/
/***                             DECRYPTION                              ***/
/***************************************************************************/

/*
** Kiasu Decryption function
*/

int  kiasu_aead_decrypt(const uint8_t *ad, size_t ad_len, 
			            uint8_t *m, size_t *m_len, 
			            const uint8_t *key, 
			            const uint8_t *nonce, 
			            const uint8_t *c, size_t c_len)
{

  size_t i;
  size_t b; 						/* number of blocks */
  size_t k;
  size_t count;				        /* Counter of the number of significative blocks to process */
  uint8_t* p;
  ALIGN(16) AES_TWEAK allTweaks;	/* Contain the tweak value in bitslice form */
  ALIGN(16) AES_KEY encrypt_key;	/* Contain all the subkeys in bitslice form */  
  ALIGN(16) uint8_t lastBlock[16];
  ALIGN(16) block DecOfZero;
  ALIGN(16) block PaddedBlock;
  ALIGN(16) block Auth;				/* Auth value during the mode */
  ALIGN(16) block Checksum;			/* Checksum on the plaintext blocks */
  ALIGN(16) block ta[BPI];			/* 8 blocks for parallel processing */
  ALIGN(16) const block* adp;		/* Pointer to the blocks to process */
  ALIGN(16) uint8_t tweak[16];
  ALIGN(16) uint8_t tag[16];
  ALIGN(16) __m128i tmpblock;
  
  /*************************************************
   *
   *               Initialization
   *
   *************************************************/

  /* The initial block of assiocated data is at that address */
  adp = (block *)ad;

  /* Initialize the tweak value */
  memset(tweak, 0, 16);

  /* Initialize the Auth value to zero */
  Auth=zero_block();

  /* Convert the master key into bitslice after KS */
  AES_set_encrypt_key(key, &encrypt_key);

  /* Put the nonce in the tweak */
  set_nonce_in_tweak(tweak, nonce);

  /*************************************************
   *
   *               Associated data
   *
   *************************************************/

  /* Put the stage in the tweak */
  set_stage_in_tweak(tweak, MSB_AD);

  /* int k; */
  /*for(k=0; k<16; ++k) printf("%02x ", tweak[k]); printf("\n");*/

  /*
   * Handle associated data, at a rate of 8 blocks at a time.
   */
  for (i=0, b=0; i <= ad_len; i+=BPI*16) {

  	/* Count the number of effective to encrypt in parallel */
    count=(ad_len-i)/16;
    if(count>=BPI) count=BPI;
    else count++;

    /* This cost about 0.5 cpb */
    set_block_number_in_tweak(tweak, i/16);
    AES_set_tweak(tweak, &allTweaks);

    /* This cost about 0.19 cpb */
    L0(i     ,tmpblock,ta,adp,b);
    L(1,count,tmpblock,ta,adp,b);
    L(2,count,tmpblock,ta,adp,b);
    L(3,count,tmpblock,ta,adp,b);
    L(4,count,tmpblock,ta,adp,b);
    L(5,count,tmpblock,ta,adp,b);
    L(6,count,tmpblock,ta,adp,b);
    L(7,count,tmpblock,ta,adp,b);

    /* bitslice AES on BPI=8 parallel blocks (about 6.6 cpb) */
    AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

    /* Accumulate the XOR in Auth */
    for (k=0; k<count; ++k) {
    	Auth=xor_block(Auth, ta[k]);
	}

  } /* i,b */

  /* If the last bytes have not been processed, because not a full block */
  if (!ad_len || b*16<ad_len) {

	  /* Put the stage in the tweak */
	  set_stage_in_tweak(tweak, MSB_AD_LAST);
      set_block_number_in_tweak(tweak, (const uint32_t)(b&0xfffffff8));
      AES_set_tweak(tweak, &allTweaks);

      /* Create the padded block */
	  PaddedBlock=zero_block();
	  memcpy(&PaddedBlock, ad+16*(ad_len/16), ad_len&0xf);
	  p=(unsigned char*)&PaddedBlock;
	  p+=ad_len&0xf;
	  *p=0x80;

      ta[0] = PaddedBlock;
      ta[1] = PaddedBlock;
      ta[2] = PaddedBlock;
      ta[3] = PaddedBlock;
      ta[4] = PaddedBlock;
      ta[5] = PaddedBlock;
      ta[6] = PaddedBlock;
      ta[7] = PaddedBlock;

      /* bitslice AES on BPI=8 parallel blocks (about 6.6 cpb) */
      AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

      /* Update the Auth value */
      Auth=xor_block(Auth, ta[b&0x7]);

  } /* if padding */

  /*
   * If we have encrypted at least 8 blocks with the above, we have encrypted
   * a dummy zero block, that needs to be compensated in the Auth value
   */
  /* Encrypt a dummy block of all zero to start counter from 1 in PMAC */
  set_stage_in_tweak(tweak, MSB_AD);
  set_block_number_in_tweak(tweak, 0);
  AES_set_tweak(tweak, &allTweaks);

  /* Zero the input blocks */
  ta[0]=zero_block();
  ta[1]=zero_block();
  ta[2]=zero_block();
  ta[3]=zero_block();
  ta[4]=zero_block();
  ta[5]=zero_block();
  ta[6]=zero_block();
  ta[7]=zero_block();
  AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

  /* XOR back to cancel */
  Auth=xor_block(Auth, ta[0]);

  /*************************************************
   *
   *                   Ciphertext
   *
   *************************************************/

  /* The initial block is at address c */
  adp = (block *)c;

  /* Put the stage in the tweak */
  set_stage_in_tweak(tweak, MSB_M);

  /* Encrypt a dummy block of all zero to start counter from 1 in PMAC */
  set_block_number_in_tweak(tweak, 0);
  AES_set_tweak(tweak, &allTweaks);

  /* Zero the input blocks */
  ta[0]=zero_block();
  ta[1]=zero_block();
  ta[2]=zero_block();
  ta[3]=zero_block();
  ta[4]=zero_block();
  ta[5]=zero_block();
  ta[6]=zero_block();
  ta[7]=zero_block();
  AES_ecb_decrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

  /* Initialize Checksum to get rid of the first useless block */
  DecOfZero=ta[0];
  Checksum=DecOfZero;

  /*
   * Handle blocks of message, at a rate of 8 blocks at a time (-16 to remove the tag)
   */
  for (i=0, b=0; i <= c_len-16; i+=BPI*16) {

  	/* Count the number of effective to encrypt in parallel */
    count=(c_len-16-i)/16;
    if(count>=BPI) count=BPI;
    else count++;

    /* This cost about 0.5 cpb */
    set_block_number_in_tweak(tweak, i/16);
    AES_set_tweak(tweak, &allTweaks);

    /* This cost about 0.19 cpb */
    /* Prepare the input blocks to decrypt */
    L0(i     ,tmpblock,ta,adp,b);
    L(1,count,tmpblock,ta,adp,b);
    L(2,count,tmpblock,ta,adp,b);
    L(3,count,tmpblock,ta,adp,b);
    L(4,count,tmpblock,ta,adp,b);
    L(5,count,tmpblock,ta,adp,b);
    L(6,count,tmpblock,ta,adp,b);
    L(7,count,tmpblock,ta,adp,b);

    /* bitslice AES on BPI=8 parallel blocks (about 6.6 cpb) */
    AES_ecb_decrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

    /* Accumulate the XOR of input blocks in the Checksum  */
    for (k=0; k<count; ++k) {
	    Checksum=xor_block(Checksum, ta[k]);
    }

    /* Write the plaintext blocks */
    if(i==0) 		for (k=1; k<count; ++k) store(m+i+16*(k-1), ta[k]);
	else			for (k=0; k<count; ++k) store(m+16*k+i-16, ta[k]);

  }/*i,b*/

  /* If the last bytes have not been processed, because not a full block */
  if (b*16<(c_len-16)) {

	  /* Put the stage in the tweak */
	  set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO);
      set_block_number_in_tweak(tweak, (const uint32_t)(b&0xfffffff8));
      AES_set_tweak(tweak, &allTweaks);

      ta[0] = zero_block();
      ta[1] = zero_block();
      ta[2] = zero_block();
      ta[3] = zero_block();
      ta[4] = zero_block();
      ta[5] = zero_block();
      ta[6] = zero_block();
      ta[7] = zero_block();

      /* bitslice AES on BPI=8 parallel blocks (about 6.6 cpb) */
      AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

      /* Write the partial plaintext block */
      memcpy(m+16*b, &ta[b&0x7], c_len-16-b*16);

      /* Create the padded block to update the Checksum */
	  PaddedBlock=zero_block();
	  p=(unsigned char*)&PaddedBlock;
      *(block *)lastBlock=ta[b&0x7];

	  for (k=0; k<c_len-16-16*b; ++k) {
	  	m[16*b+k]=c[16*b+k]^lastBlock[k]; /* Write the plaintext bytes */
	  	p[k]=m[16*b+k];
	  }
	  p[k]=0x80; /* 10^* padding */

	  /* Accumulate the XOR of input blocks in the Checksum  */
      Checksum=xor_block(Checksum, PaddedBlock);      

  } /* if padding */	

  /*************************************************
   *
   *               Check the tag
   *
   *************************************************/

  /* This cost about 0.19 cpb */
  ta[0] = Checksum;
  ta[1] = Checksum;
  ta[2] = Checksum;
  ta[3] = Checksum;
  ta[4] = Checksum;
  ta[5] = Checksum;
  ta[6] = Checksum;
  ta[7] = Checksum;

  if (b*16<(c_len-16)) 	set_stage_in_tweak(tweak, MSB_CHKSUM);
  else 					set_stage_in_tweak(tweak, MSB_M_LAST_ZERO);
  set_block_number_in_tweak(tweak, (const uint32_t)(b&0xfffffff8));
  AES_set_tweak(tweak, &allTweaks);

  /* bitslice AES on the Checksum */
  AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

  /* Select the correct tweak value from the 3 LSBs */
  Auth=xor_block(ta[b&0x7], Auth);

  /* Check the computed tag against the provided tag, appended to the ciphertext */
  *(block *)tag=Auth;

  /* Actual check */
  if(0!=memcmp(tag, c+c_len-16, 16)) {
    return -1; /* Error, the tags do not match */
  }

  /* Update the length of the plaintext */
  *m_len=c_len-16;

  /* return ERROR_SUCCESS: the tag is verified, the plaintext is written */
  return 0;
}

