/*
 * Joltik=/=-128-64 Optimized (vperm) C Implementation
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

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <xmmintrin.h>                 /* SSE  intrinsics */
#include <emmintrin.h>                 /* SSE2 intrinsics */
#include <immintrin.h>                 /* AVX2 intrinsics */
#include "joltik.h"
#include "tweakableBC.h"

/* Memory alignments for special sse instructions */
#define ALIGN(n)                        __attribute__ ((aligned ((n))))
#define HIDDEN_ALIGN(n)                 __attribute__ ((visibility("hidden"),aligned(n)))

/* Define the three MSB of the tweak (that depend on the stage) */
#define MSB_AD                          (0x2<<5)
#define MSB_AD_LAST                     (0x6<<5)
#define MSB_M                           (0x0<<5)
#define MSB_M_LAST_ZERO                 (0x1<<5)
#define MSB_M_LAST_NONZERO              (0x4<<5)
#define MSB_PAD                         (0x4<<5)
#define MSB_CHKSUM                      (0x5<<5)

/*
** Given a 32-byte array, XOR all the 8-byte arrays into the 8 first bytes.
*/
#define FOLD_TO_64(a) {                                 \
    __m128i tmp1=_mm_load_si128((__m128i const*)(a));   \
    __m128i tmp2=_mm_srli_si128(tmp1, 8);               \
    tmp1=_mm_xor_si128(tmp1, tmp2);                     \
    _mm_store_si128((__m128i *)(a), tmp1);              \
  } while(0);

/*
** Given two 16-byte arrays, XOR the second one into the first one.
*/
#define XOR_VALUES(a, b) {				\
    __m128i tmp1=_mm_load_si128((__m128i const*)(a));	\
    __m128i tmp2=_mm_loadu_si128((__m128i const*)(b));	\
    tmp1=_mm_xor_si128(tmp1, tmp2);			\
    _mm_store_si128((__m128i *)(a), tmp1);		\
  }

/**********************************************************************************
*** In Joltik=/=-128-64, the tweak is on 64 bits:
***     tweak = <stage> || <nonce> || <blockNumber>
***  where we use:
***      3 bits for stage
***     32 bits for nonce
***     29 bits for blockNumber
***********************************************************************************/
/*
** Modifiy the nonce part in the tweak value
*/
#define set_nonce_in_tweak(tweak, nonce) {                      \
                                                                \
    /* First block */                                           \
    (tweak)[0] =  ((tweak)[0]&0xe0)    ^ ((nonce)[0] >> 3);     \
    (tweak)[1] = (((nonce)[0]&7) << 5) ^ ((nonce)[1] >> 3);     \
    (tweak)[2] = (((nonce)[1]&7) << 5) ^ ((nonce)[2] >> 3);     \
    (tweak)[3] = (((nonce)[2]&7) << 5) ^ ((nonce)[3] >> 3);     \
    (tweak)[4] = (((nonce)[3]&7) << 5);                         \
                                                                \
    /* Second block */                                          \
    (tweak)[8+0] =  ((tweak)[0]&0xe0)    ^ ((nonce)[0] >> 3);   \
    (tweak)[8+1] = (((nonce)[0]&7) << 5) ^ ((nonce)[1] >> 3);   \
    (tweak)[8+2] = (((nonce)[1]&7) << 5) ^ ((nonce)[2] >> 3);   \
    (tweak)[8+3] = (((nonce)[2]&7) << 5) ^ ((nonce)[3] >> 3);   \
    (tweak)[8+4] = (((nonce)[3]&7) << 5);                       \
                                                                \
    /* Third block */                                           \
    (tweak)[16+0] =  ((tweak)[0]&0xe0)    ^ ((nonce)[0] >> 3);  \
    (tweak)[16+1] = (((nonce)[0]&7) << 5) ^ ((nonce)[1] >> 3);  \
    (tweak)[16+2] = (((nonce)[1]&7) << 5) ^ ((nonce)[2] >> 3);  \
    (tweak)[16+3] = (((nonce)[2]&7) << 5) ^ ((nonce)[3] >> 3);  \
    (tweak)[16+4] = (((nonce)[3]&7) << 5);                      \
                                                                \
    /* Fourth block */                                          \
    (tweak)[24+0] =  ((tweak)[0]&0xe0)    ^ ((nonce)[0] >> 3);  \
    (tweak)[24+1] = (((nonce)[0]&7) << 5) ^ ((nonce)[1] >> 3);  \
    (tweak)[24+2] = (((nonce)[1]&7) << 5) ^ ((nonce)[2] >> 3);  \
    (tweak)[24+3] = (((nonce)[2]&7) << 5) ^ ((nonce)[3] >> 3);  \
    (tweak)[24+4] = (((nonce)[3]&7) << 5);                      \
                                                                \
  } while(0);

/*
** Modifiy the block number in the tweak value
*/
#define set_block_number_in_tweak(tweak, block_no_1, block_no_2, block_no_3, block_no_4) {   \
									                     \
    /* First block */                                                                        \
    (tweak)[4] = ((tweak)[4]&0xe0) ^ (((block_no_1) >> 24ULL) & 0x1f);                       \
    (tweak)[5] = (((block_no_1) >> 16ULL) & 0xff);                                           \
    (tweak)[6] = (((block_no_1) >>  8ULL) & 0xff);                                           \
    (tweak)[7] = (((block_no_1) >>  0ULL) & 0xff);                                           \
                                                                                             \
    /* Second block */                                                                       \
    (tweak)[8+4] = ((tweak)[8+4]&0xe0) ^ (((block_no_2) >> 24ULL) & 0x1f);                   \
    (tweak)[8+5] = (((block_no_2) >> 16ULL) & 0xff);                                         \
    (tweak)[8+6] = (((block_no_2) >>  8ULL) & 0xff);                                         \
    (tweak)[8+7] = (((block_no_2) >>  0ULL) & 0xff);                                         \
                                                                                             \
    /* Third block */                                                                        \
    (tweak)[16+4] = ((tweak)[16+4]&0xe0) ^ (((block_no_3) >> 24ULL) & 0x1f);                 \
    (tweak)[16+5] = (((block_no_3) >> 16ULL) & 0xff);                                        \
    (tweak)[16+6] = (((block_no_3) >>  8ULL) & 0xff);                                        \
    (tweak)[16+7] = (((block_no_3) >>  0ULL) & 0xff);                                        \
                                                                                             \
    /* Fourth block */                                                                       \
    (tweak)[24+4] = ((tweak)[24+4]&0xe0) ^ (((block_no_4) >> 24ULL) & 0x1f);                 \
    (tweak)[24+5] = (((block_no_4) >> 16ULL) & 0xff);                                        \
    (tweak)[24+6] = (((block_no_4) >>  8ULL) & 0xff);                                        \
    (tweak)[24+7] = (((block_no_4) >>  0ULL) & 0xff);                                        \
                                                                                             \
  } while(0);

/*
** Modifiy the stage value in the tweak value
*/
#define set_stage_in_tweak(tweak, value1, value2, value3, value4) {	\
    (tweak)[   0]=((tweak)[   0] & 0x1f) ^ (value1);   /* First block */ \
    (tweak)[ 8+0]=((tweak)[ 8+0] & 0x1f) ^ (value2);  /* Second block */ \
    (tweak)[16+0]=((tweak)[16+0] & 0x1f) ^ (value3);  /* Second block */ \
    (tweak)[24+0]=((tweak)[24+0] & 0x1f) ^ (value4);  /* Second block */ \
  } while(0);

/*
** Joltik encryption function
*/
void joltik_aead_encrypt(const uint8_t *ass_data, size_t ass_data_len,
                         const uint8_t *message, size_t m_len,
                         const uint8_t *key,
                         const uint8_t *nonce,
                         uint8_t *ciphertext, size_t *c_len)
{

  uint64_t i;
  uint8_t m_padded;
  ALIGN(32) uint8_t tweak[32];
  ALIGN(32) uint8_t Auth[32];
  ALIGN(32) uint8_t last_block[32];
  ALIGN(32) uint8_t temp[32];
  ALIGN(32) uint8_t Checksum[32];
  ALIGN(32) uint8_t zero_block[32];
  ALIGN(32) uint8_t Final[32];
  ALIGN(32) uint8_t Pad[32];
  ALIGN(32) uint8_t subkeys[(32+1)*32];
  ALIGN(32) uint8_t subkeys2[32];

  /* Fill the tweak from nonce */
  memset(tweak, 0, sizeof(tweak));

  /* Set the nonce in the tweak */
  set_nonce_in_tweak(tweak, nonce);

  /* Fill the subkey(s)  */
  memcpy(subkeys,     key,   8); /* First 64-bit half of the master key */
  memcpy(subkeys+8,   key,   8);
  memcpy(subkeys+16,  key,   8);
  memcpy(subkeys+24,  key,   8);

  memcpy(subkeys2,    key+8, 8); /* Second 64-bit half of the master key */
  memcpy(subkeys2+8,  key+8, 8);
  memcpy(subkeys2+16, key+8, 8);
  memcpy(subkeys2+24, key+8, 8);

  /* Key schedule: Generate the subkeys into 'subkeys' */
  TweakeyScheduleTK2(subkeys, subkeys2);

  /**********************************************
  *** Associated data ***************************
  **********************************************/
  memset(Auth, 0, 32);
  set_stage_in_tweak(tweak, MSB_AD, MSB_AD, MSB_AD, MSB_AD);

  /* For each full input blocks */
  i=1;
  while (32*i <= ass_data_len) {

    /* Encrypt the current blocks */
    set_block_number_in_tweak(tweak, 4*i-3, 4*i-2, 4*i-1, 4*i);
    aesTweakEncrypt(ass_data+32*(i-1), subkeys, tweak, temp);

    /* Update Auth value */
    XOR_VALUES(Auth, temp);
    XOR_VALUES(Auth+16, temp+16);

    /* Go on with the next four blocks */
    i++;
  }
  i--;
  i<<=2;
  /* Here, i is the number of full blocks we have processed in the loop above */

  if (ass_data_len==0) {

    /* Prepare the last padded block */
    memset(last_block, 0, 32);
    memcpy(last_block, ass_data+8*i, ass_data_len-8*i);
    last_block[ass_data_len-8*i]=0x80;

    /* Encrypt the last block */
    set_stage_in_tweak(tweak, MSB_AD_LAST, MSB_AD_LAST, MSB_AD_LAST, MSB_AD_LAST);
    set_block_number_in_tweak(tweak, i, i, i, i); /* One more full block */
    aesTweakEncrypt(last_block, subkeys, tweak, temp);

    memset(temp+8, 0, 24);
    XOR_VALUES(Auth, temp);

  } else if( (8*i<ass_data_len) && (ass_data_len < 32+8*i) ) { /* Last two blocks are not full incomplete */

    /* Prepare the last padded block */
    memset(last_block, 0, 32);
    memcpy(last_block, ass_data+8*i, ass_data_len-8*i);
    if((ass_data_len-8*i)&0x7) last_block[ass_data_len-8*i]=0x80;

    if( ass_data_len < 8+8*i) { /* One more full block */

      set_stage_in_tweak(tweak, MSB_AD_LAST, MSB_AD_LAST, MSB_AD_LAST, MSB_AD_LAST);
      set_block_number_in_tweak(tweak, i, i, i, i); /* One more full block */
      aesTweakEncrypt(last_block, subkeys, tweak, temp); /* Encrypt the last block */
      memset(temp+8, 0, 24);

    } else if( ass_data_len < 16+8*i) { /* One more full block */

      set_stage_in_tweak(tweak, MSB_AD, MSB_AD_LAST, MSB_AD_LAST, MSB_AD_LAST);
      set_block_number_in_tweak(tweak, i+1, i+1, i+1, i+1); /* One more full block */
      aesTweakEncrypt(last_block, subkeys, tweak, temp); /* Encrypt the last block */
      if((ass_data_len-8*i)==8) memset(temp+ 8, 0, 24);
      else                      memset(temp+16, 0, 16);

    } else if( ass_data_len < 24+8*i) { /* One more full block */

      set_stage_in_tweak(tweak, MSB_AD, MSB_AD, MSB_AD_LAST, MSB_AD_LAST);
      set_block_number_in_tweak(tweak, i+1, i+2, i+2, i+2); /* One more full block */
      aesTweakEncrypt(last_block, subkeys, tweak, temp); /* Encrypt the last block */
      if((ass_data_len-8*i)==16) memset(temp+16, 0, 16);
      else                       memset(temp+24, 0,  8);

    } else if( ass_data_len < 32+8*i) { /* One more full block */

      set_stage_in_tweak(tweak, MSB_AD, MSB_AD, MSB_AD, MSB_AD_LAST);
      set_block_number_in_tweak(tweak, i+1, i+2, i+3, i+3); /* One more full block */
      aesTweakEncrypt(last_block, subkeys, tweak, temp); /* Encrypt the last block */
      if((ass_data_len-8*i)==24) memset(temp+24, 0, 8);
    }

    /* Update the Auth value */
    XOR_VALUES(Auth, temp);
    XOR_VALUES(Auth+16, temp+16);

  }

  /* Compute the final Auth value */
  FOLD_TO_64(Auth);
  FOLD_TO_64(Auth+16);
  XOR_VALUES(Auth, Auth+16);

  /**********************************************
  *** Message ***********************************
  **********************************************/
  memset(Checksum, 0, 32);
  set_stage_in_tweak(tweak, MSB_M, MSB_M, MSB_M, MSB_M);
  i=1;
  while (32*i <= m_len) {
    XOR_VALUES(Checksum, message+32*(i-1));
    XOR_VALUES(Checksum+16, message+32*(i-1)+16);

    set_block_number_in_tweak(tweak, 4*i-3, 4*i-2, 4*i-1, 4*i);
    aesTweakEncrypt(message+32*(i-1), subkeys, tweak, ciphertext+32*(i-1));
    i++;
  }
  i--;
  i<<=2;
  /* Here, i is the number of full blocks we have processed in the loop above */

  m_padded=0;
  if((8*i<m_len) && ( m_len < 32+8*i)) { /* Last two blocks are not full incomplete */

    /* Prepare the zero block to be encrypted */
    memset(zero_block, 0, 32);

    /* Prepare the last padded block */
    memset(last_block, 0, 32);
    memcpy(last_block, message+8*i, m_len-8*i);
    if((m_len-8*i)&0x7) {
      m_padded=1;
      last_block[m_len-8*i]=0x80;
    } else {
      m_padded=0;
    }

    XOR_VALUES(Checksum, last_block);
    XOR_VALUES(Checksum+16, last_block+16);

    if( m_len < 8+8*i) { /* One non-empty block left */

      set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO);
      set_block_number_in_tweak(tweak, i, i, i, i); /* One more full block */
      aesTweakEncrypt(zero_block, subkeys, tweak, Pad); /* Encrypt the last block */
      memset(Pad+8, 0, 24);

      XOR_VALUES(last_block, Pad);
      /*XOR_VALUES(last_block+16, Pad+16);*/

      memcpy(ciphertext+8*i, last_block, m_len-8*i);

    } else if( m_len < 16+8*i) { /* One more full block + non-empty block left*/

      if(m_len!=16) memcpy(zero_block, last_block, 8);
      set_stage_in_tweak(tweak, MSB_M, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO);
      set_block_number_in_tweak(tweak, i+1, i+1, i+1, i+1); /* One more full block */
      aesTweakEncrypt(zero_block, subkeys, tweak, Pad); /* Encrypt the last block */

      /* Write first block */
      memcpy(ciphertext+8*i, Pad, 8);
      i+=1;

      XOR_VALUES(last_block, Pad);
      XOR_VALUES(last_block+16, Pad+16);

      memcpy(ciphertext+8*i, last_block+8, m_len-8*i);

    } else if( m_len < 24+8*i) { /* Two more full block2 + non-empty block left */

      if(m_len!=24) memcpy(zero_block, last_block, 16);
      set_stage_in_tweak(tweak, MSB_M, MSB_M, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO);
      set_block_number_in_tweak(tweak, i+1, i+2, i+2, i+2); /* One more full block */
      aesTweakEncrypt(zero_block, subkeys, tweak, Pad); /* Encrypt the last block */

      /* Write two first blocks */
      memcpy(ciphertext+8*i, Pad, 16);
      i+=2;

      XOR_VALUES(last_block, Pad);
      XOR_VALUES(last_block+16, Pad+16);

      memcpy(ciphertext+8*i, last_block+16, m_len-8*i);

    } else if( m_len < 32+8*i) { /* Three more full blocks + non-empty block left */

      /*if(m_len!=32)*/ memcpy(zero_block, last_block, 24);
      set_stage_in_tweak(tweak, MSB_M, MSB_M, MSB_M, MSB_M_LAST_NONZERO);
      set_block_number_in_tweak(tweak, i+1, i+2, i+3, i+3); /* One more full block */
      aesTweakEncrypt(zero_block, subkeys, tweak, Pad); /* Encrypt the last block */

      /* Write three first blocks */
      memcpy(ciphertext+8*i, Pad, 24);
      i+=3;

      XOR_VALUES(last_block, Pad);
      XOR_VALUES(last_block+16, Pad+16);

      memcpy(ciphertext+8*i, last_block+24, m_len-8*i);
    }

  }

  /* Compute the final Auth value */
  FOLD_TO_64(Checksum);
  FOLD_TO_64(Checksum+16);
  XOR_VALUES(Checksum, Checksum+16);

  if(m_padded) {set_stage_in_tweak(tweak, MSB_CHKSUM, MSB_CHKSUM, MSB_CHKSUM, MSB_CHKSUM);}
  else         {set_stage_in_tweak(tweak, MSB_M_LAST_ZERO, MSB_M_LAST_ZERO, MSB_M_LAST_ZERO, MSB_M_LAST_ZERO);}

  set_block_number_in_tweak(tweak, i, i, i, i);
  aesTweakEncrypt(Checksum, subkeys, tweak, Final);

  for (i=0; i<8; i++) {
    ciphertext[m_len+i]=Final[i] ^ Auth[i];
  }

  /* The authentication tag is one block long, i.e. 8 bytes */
  *c_len=m_len+8;

}

/*
** Joltik decryption function
*/
int joltik_aead_decrypt(const uint8_t *ass_data, size_t ass_data_len,
                        uint8_t *message, size_t *m_len,
                        const uint8_t *key,
                        const uint8_t *nonce,
                        const uint8_t *ciphertext, size_t c_len)
{

  uint64_t i;
  uint8_t m_padded;
  ALIGN(32) uint8_t tweak[32];
  ALIGN(32) uint8_t Auth[32];
  ALIGN(32) uint8_t last_block[32];
  ALIGN(32) uint8_t temp[32];
  ALIGN(32) uint8_t Checksum[32];
  ALIGN(32) uint8_t zero_block[32];
  ALIGN(32) uint8_t Final[32];
  ALIGN(32) uint8_t Pad[32];
  ALIGN(32) uint8_t subkeys[(32+1)*32];
  ALIGN(32) uint8_t subkeys2[32];
  ALIGN(32) uint8_t subkeys_inv[(32+1)*32];
  ALIGN(32) uint8_t subkeys_inv2[32];

  ALIGN(32) uint8_t Tag[8];

  /* Get the tag from the last 8 bytes of the ciphertext */
  memcpy(Tag, ciphertext+c_len-8, 8);

  /* Update c_len to the actual size of the ciphertext (i.e., without the tag) */
  c_len-=8;

  /* Fill the tweak from nonce */
  memset(tweak, 0, sizeof(tweak));

  /* Set the nonce in the tweak */
  set_nonce_in_tweak(tweak, nonce);

  /* Fill the subkey(s)  */
  memcpy(subkeys,     key,      8); /* First 64-bit half of the master key */
  memcpy(subkeys+8,   key,      8);
  memcpy(subkeys+16,  key,      8);
  memcpy(subkeys+24,  key,      8);
  memcpy(subkeys_inv, subkeys, 32);

  memcpy(subkeys2,    key+8, 8); /* Second 64-bit half of the master key */
  memcpy(subkeys2+8,  key+8, 8);
  memcpy(subkeys2+16, key+8, 8);
  memcpy(subkeys2+24, key+8, 8);
  memcpy(subkeys_inv2, subkeys2, 32);

  /* Key schedule: Generate the subkeys into 'subkeys' */
  TweakeyScheduleTK2(subkeys, subkeys2);
  TweakeyScheduleTK2_reverse(subkeys_inv, subkeys_inv2);

  /**********************************************
  *** Associated data ***************************
  **********************************************/
  memset(Auth, 0, 32);
  set_stage_in_tweak(tweak, MSB_AD, MSB_AD, MSB_AD, MSB_AD);

  /* For each full input blocks */
  i=1;
  while (32*i <= ass_data_len) {

    /* Encrypt the current blocks */
    set_block_number_in_tweak(tweak, 4*i-3, 4*i-2, 4*i-1, 4*i);
    aesTweakEncrypt(ass_data+32*(i-1), subkeys, tweak, temp);

    /* Update Auth value */
    XOR_VALUES(Auth, temp);
    XOR_VALUES(Auth+16, temp+16);

    /* Go on with the next four blocks */
    i++;
  }
  i--;
  i<<=2;
  /* Here, i is the number of full blocks we have processed in the loop above */

  if (ass_data_len==0) {

    /* Prepare the last padded block */
    memset(last_block, 0, 32);
    memcpy(last_block, ass_data+8*i, ass_data_len-8*i);
    last_block[ass_data_len-8*i]=0x80;

    /* Encrypt the last block */
    set_stage_in_tweak(tweak, MSB_AD_LAST, MSB_AD_LAST, MSB_AD_LAST, MSB_AD_LAST);
    set_block_number_in_tweak(tweak, i, i, i, i); /* One more full block */
    aesTweakEncrypt(last_block, subkeys, tweak, temp);

    memset(temp+8, 0, 24);
    XOR_VALUES(Auth, temp);

  } else if( (8*i<ass_data_len) && (ass_data_len < 32+8*i) ) { /* Last two blocks are not full incomplete */

    /* Prepare the last padded block */
    memset(last_block, 0, 32);
    memcpy(last_block, ass_data+8*i, ass_data_len-8*i);
    if((ass_data_len-8*i)&0x7) last_block[ass_data_len-8*i]=0x80;

    if( ass_data_len < 8+8*i) { /* One more full block */

      set_stage_in_tweak(tweak, MSB_AD_LAST, MSB_AD_LAST, MSB_AD_LAST, MSB_AD_LAST);
      set_block_number_in_tweak(tweak, i, i, i, i); /* One more full block */
      aesTweakEncrypt(last_block, subkeys, tweak, temp); /* Encrypt the last block */
      memset(temp+8, 0, 24);

    } else if( ass_data_len < 16+8*i) { /* One more full block */

      set_stage_in_tweak(tweak, MSB_AD, MSB_AD_LAST, MSB_AD_LAST, MSB_AD_LAST);
      set_block_number_in_tweak(tweak, i+1, i+1, i+1, i+1); /* One more full block */
      aesTweakEncrypt(last_block, subkeys, tweak, temp); /* Encrypt the last block */
      if((ass_data_len-8*i)==8) memset(temp+ 8, 0, 24);
      else                      memset(temp+16, 0, 16);

    } else if( ass_data_len < 24+8*i) { /* One more full block */

      set_stage_in_tweak(tweak, MSB_AD, MSB_AD, MSB_AD_LAST, MSB_AD_LAST);
      set_block_number_in_tweak(tweak, i+1, i+2, i+2, i+2); /* One more full block */
      aesTweakEncrypt(last_block, subkeys, tweak, temp); /* Encrypt the last block */
      if((ass_data_len-8*i)==16) memset(temp+16, 0, 16);
      else                       memset(temp+24, 0,  8);

    } else if( ass_data_len < 32+8*i) { /* One more full block */

      set_stage_in_tweak(tweak, MSB_AD, MSB_AD, MSB_AD, MSB_AD_LAST);
      set_block_number_in_tweak(tweak, i+1, i+2, i+3, i+3); /* One more full block */
      aesTweakEncrypt(last_block, subkeys, tweak, temp); /* Encrypt the last block */
      if((ass_data_len-8*i)==24) memset(temp+24, 0, 8);
    }

    /* Update the Auth value */
    XOR_VALUES(Auth, temp);
    XOR_VALUES(Auth+16, temp+16);

  }

  /* Compute the final Auth value */
  FOLD_TO_64(Auth);
  FOLD_TO_64(Auth+16);
  XOR_VALUES(Auth, Auth+16);

  /**********************************************
  *** Ciphertext ********************************
  **********************************************/
  memset(Checksum, 0, 32);
  set_stage_in_tweak(tweak, MSB_M, MSB_M, MSB_M, MSB_M);
  i=1;
  while (32*i <= c_len) {
    set_block_number_in_tweak(tweak, 4*i-3, 4*i-2, 4*i-1, 4*i);
    aesTweakDecrypt(ciphertext+32*(i-1), subkeys_inv, tweak, message+32*(i-1));

    /* Update Checksum */
    XOR_VALUES(Checksum, message+32*(i-1));
    XOR_VALUES(Checksum+16, message+32*(i-1)+16);

    i++;

  }
  i--;
  i<<=2;
  /* Here, i is the number of full blocks we have processed in the loop above */

  m_padded=0;
  if((8*i<c_len) && ( c_len < 32+8*i)) { /* Last two blocks are not full incomplete */

    /* Prepare the zero block to be encrypted */
    memset(zero_block, 0, 32);

    /* Only a partial block */
    if( c_len < 8+8*i) { /* One non-empty block left */

      /* Encrypt the zero block */
      set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO);
      set_block_number_in_tweak(tweak, i, i, i, i);
      aesTweakEncrypt(zero_block, subkeys, tweak, Pad); /* Encrypt the last block */
      memset(Pad+8, 0, 24);

      /* XOR the partial ciphertext */
      memset(last_block, 0, 32);
      memcpy(last_block, ciphertext+8*i, c_len-8*i);
      memset(Pad+c_len-8*i, 0, 16-(c_len-8*i));

      XOR_VALUES(last_block, Pad);
      XOR_VALUES(last_block+16, Pad+16);

      /* The initial block has been padded */
      m_padded=1;
      last_block[c_len-8*i]=0x80;
      memcpy(message+8*i, last_block, c_len-8*i);

      /* Update the Checksum, including the padding */
      XOR_VALUES(Checksum, last_block);
      XOR_VALUES(Checksum+16, last_block+16);

    } else {

      /* Here, there is still at least a full block (three at most), */
      /* and possibly an partial block.                              */

      if( c_len < 16+8*i) { /* One more full block + non-empty block left */

        /* We have one full block first that need to be decrypted... */
        memcpy(temp, ciphertext+8*i, 8);
        set_stage_in_tweak(tweak, MSB_M, MSB_M, MSB_M, MSB_M);
        set_block_number_in_tweak(tweak, i+1, i+1, i+1, i+1);
        aesTweakDecrypt(temp, subkeys_inv, tweak, temp);
        memset(temp+8, 0, 24);
        memcpy(message+8*i, temp, 8);

        /* Update Checksum */
        XOR_VALUES(Checksum, temp);
        XOR_VALUES(Checksum+16, temp+16);

        /* We had two more full blocks */
        i+=1;

      } else if( c_len < 24+8*i) { /* Two more full block2 + non-empty block left */

        /* We have two full blocks that need to be decrypted...      */
        memcpy(temp, ciphertext+8*i, 16);
        set_stage_in_tweak(tweak, MSB_M, MSB_M, MSB_M, MSB_M);
        set_block_number_in_tweak(tweak, i+1, i+2, i+2, i+2);
        aesTweakDecrypt(temp, subkeys_inv, tweak, temp);
        memset(temp+16, 0, 16);
        memcpy(message+8*i, temp, 16);

        /* Update Checksum */
        XOR_VALUES(Checksum, temp);
        XOR_VALUES(Checksum+16, temp+16);

        /* We had one more full block */
        i+=2;

      } else if( c_len < 32+8*i) { /* Three more full blocks + non-empty block left */

        /* We have three full blocks that need to be decrypted...    */
        memcpy(temp, ciphertext+8*i, 24);
        set_stage_in_tweak(tweak, MSB_M, MSB_M, MSB_M, MSB_M);
        set_block_number_in_tweak(tweak, i+1, i+2, i+3, i+3);
        aesTweakDecrypt(temp, subkeys_inv, tweak, temp);
        memset(temp+24, 0, 8);
        memcpy(message+8*i, temp, 24);

        /* Update Checksum */
        XOR_VALUES(Checksum, temp);
        XOR_VALUES(Checksum+16, temp+16);

        /* We had three more full blocks */
        i+=3;

      }

      /* One more partial block to process */
      if(8*i<c_len) {
        /*************************************************************/
        /* ... and then, we have a partial block: we need to encrypt the zero block */

        /* Encrypt the zero block */
        set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO);
        set_block_number_in_tweak(tweak, i, i, i, i); /* One more full block */
        aesTweakEncrypt(zero_block, subkeys, tweak, Pad); /* Encrypt the last block */
        memset(Pad+8, 0, 24);

        /* XOR the partial ciphertext */
        memset(last_block, 0, 32);
        memcpy(last_block, ciphertext+8*i, c_len-8*i);
        memset(Pad+c_len-8*i, 0, 16-(c_len-8*i));

        XOR_VALUES(last_block, Pad);
        XOR_VALUES(last_block+16, Pad+16);

        /* The initial block has been padded */
        m_padded=1;
        last_block[c_len-8*i]=0x80;
        memcpy(message+8*i, last_block, c_len-8*i);

        /* Update the Checksum, including the padding */
        XOR_VALUES(Checksum, last_block);
        XOR_VALUES(Checksum+16, last_block+16);

      }/* Partial block */

    } /* Full blocks left to process */

  } /* More Full blocks? */

  /* Compute the 8-byte Ckecksum value */
  FOLD_TO_64(Checksum);
  FOLD_TO_64(Checksum+16);
  XOR_VALUES(Checksum, Checksum+16);

  /* Conditional treatment in the case of padding */
  if(m_padded) {set_stage_in_tweak(tweak, MSB_CHKSUM, MSB_CHKSUM, MSB_CHKSUM, MSB_CHKSUM);}
  else         {set_stage_in_tweak(tweak, MSB_M_LAST_ZERO, MSB_M_LAST_ZERO, MSB_M_LAST_ZERO, MSB_M_LAST_ZERO);}

  set_block_number_in_tweak(tweak, i, i, i, i);
  aesTweakEncrypt(Checksum, subkeys, tweak, Final);

  /* Verify the tag */
  XOR_VALUES(Final, Auth);
  /* XOR_VALUES(Final+16, Auth+16); */

  /* No need to fold Final as the values are already in the 8 first bytes */

  /* If the tags does not match, return error -1 */
  if( 0 != memcmp(Final, Tag, 8) ) {
    return -1;
  }

  *m_len=c_len;
  return 0;
}
