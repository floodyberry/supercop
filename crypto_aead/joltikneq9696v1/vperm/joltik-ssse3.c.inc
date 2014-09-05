/*
 * Joltik=/=-96-96 Optimized (vperm) C Implementation
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
#include <emmintrin.h>
#include <xmmintrin.h>
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
** Given a 16-byte array, XOR the 8 last bytes into the 8 first bytes.
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
*** In Joltik=/=-96-96, the tweak is on 96 bits:
***     tweak = <stage> || <nonce> || <blockNumber>
***  where we use:
***      3 bits for stage
***     48 bits for nonce
***     45 bits for blockNumber
***********************************************************************************/
/*
** Modifiy the nonce part in the tweak value
*/
#define set_nonce_in_tweak(tweak, tweak2, nonce) {	          \
                                                                  \
    /* First block */						  \
    (tweak)[4+0] =  ((tweak)[4+0]&0xe0)  ^ ((nonce)[0] >> 3);     \
    (tweak)[4+1] = (((nonce)[0]&7) << 5) ^ ((nonce)[1] >> 3);     \
    (tweak)[4+2] = (((nonce)[1]&7) << 5) ^ ((nonce)[2] >> 3);     \
    (tweak)[4+3] = (((nonce)[2]&7) << 5) ^ ((nonce)[3] >> 3);     \
    (tweak2)[ 0] = (((nonce)[3]&7) << 5) ^ ((nonce)[4] >> 3);     \
    (tweak2)[ 1] = (((nonce)[4]&7) << 5) ^ ((nonce)[5] >> 3);     \
    (tweak2)[ 2] = (((nonce)[5]&7) << 5);                         \
								  \
    /* Second block */						  \
    (tweak)[8+4+0] =  ((tweak)[8+4+0]&0xe0)^ ((nonce)[0] >> 3);   \
    (tweak)[8+4+1] = (((nonce)[0]&7) << 5) ^ ((nonce)[1] >> 3);   \
    (tweak)[8+4+2] = (((nonce)[1]&7) << 5) ^ ((nonce)[2] >> 3);   \
    (tweak)[8+4+3] = (((nonce)[2]&7) << 5) ^ ((nonce)[3] >> 3);   \
    (tweak2)[ 8+0] = (((nonce)[3]&7) << 5) ^ ((nonce)[4] >> 3);   \
    (tweak2)[ 8+1] = (((nonce)[4]&7) << 5) ^ ((nonce)[5] >> 3);   \
    (tweak2)[ 8+2] = (((nonce)[5]&7) << 5);                       \
                                                                  \
  } while(0);

/*
** Modifiy the block number in the tweak value
*/
#define set_block_number_in_tweak(tweak2, block_no_1, block_no_2) {	          \
                                                                                  \
    /* First block */							          \
    (tweak2)[ 6-4] = ((tweak2)[6-4]&0xe0) ^ (((block_no_1) >> 40ULL) & 0x1f);     \
    (tweak2)[ 7-4] = (((block_no_1) >> 32ULL) & 0xff);                            \
    (tweak2)[ 8-4] = (((block_no_1) >> 24ULL) & 0xff);                            \
    (tweak2)[ 9-4] = (((block_no_1) >> 16ULL) & 0xff);                            \
    (tweak2)[10-4] = (((block_no_1) >>  8ULL) & 0xff);                            \
    (tweak2)[11-4] = (((block_no_1) >>  0ULL) & 0xff);                            \
									          \
    /* Second block */							          \
    (tweak2)[8+ 6-4] = ((tweak2)[8+6-4]&0xe0) ^ (((block_no_2) >> 40ULL) & 0x1f); \
    (tweak2)[8+ 7-4] = (((block_no_2) >> 32ULL) & 0xff);                          \
    (tweak2)[8+ 8-4] = (((block_no_2) >> 24ULL) & 0xff);                          \
    (tweak2)[8+ 9-4] = (((block_no_2) >> 16ULL) & 0xff);                          \
    (tweak2)[8+10-4] = (((block_no_2) >>  8ULL) & 0xff);                          \
    (tweak2)[8+11-4] = (((block_no_2) >>  0ULL) & 0xff);                          \
                                                                                  \
  } while(0);

/*
** Modifiy the stage value in the tweak value
*/
#define set_stage_in_tweak(tweak, value1, value2) {			\
    (tweak)[  4+0]=((tweak)[4+0] & 0x1f) ^ (value1);  /* First block  */  \
    (tweak)[8+4+0]=((tweak)[8+4] & 0x1f) ^ (value2);  /* Second block */  \
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
  uint64_t j;
  ALIGN(16) uint8_t tweak[16];
  ALIGN(16) uint8_t tweak2[16];
  ALIGN(16) uint8_t Auth[16];
  ALIGN(16) uint8_t last_block[16];
  ALIGN(16) uint8_t temp[16];
  ALIGN(16) uint8_t Checksum[16];
  ALIGN(16) uint8_t zero_block[16];
  ALIGN(16) uint8_t Final[16];
  ALIGN(16) uint8_t Pad[16];
  ALIGN(16) uint8_t subkeys [(32+1)*16];
  ALIGN(16) uint8_t subkeys2[16];

  /* Fill the tweak from nonce */
  memset(tweak,  0, sizeof(tweak));
  memset(tweak2, 0, sizeof(tweak2));

  /* Set the nonce in the tweak */
  set_nonce_in_tweak(tweak, tweak2, nonce);

  /* Fill the subkey(s)  */
  memcpy(subkeys,     key,   8); /* First 64 bits of the master key (total: 96 bits) */
  memcpy(subkeys+8,   key,   8);

  memset(subkeys2,       0, 16);
  memcpy(subkeys2,   key+8,  4); /* Remaining 32 bits of the master key (total: 96 bits) */
  memcpy(subkeys2+8, key+8,  4);

  /* Key schedule: Generate the subkeys into 'subkeys' */
  TweakeyScheduleTK2(subkeys, subkeys2);

  /* Associated data */
  memset(Auth, 0, 16);
  set_stage_in_tweak(tweak, MSB_AD, MSB_AD);

  /* For each full input blocks */
  i=1;
  while (16*i <= ass_data_len) {

    /* Encrypt the current blocks */
    set_block_number_in_tweak(tweak2, 2*i-1, 2*i);
    aesTweakEncrypt(ass_data+16*(i-1), subkeys, tweak, tweak2, temp);

    /* Update Auth value */
    XOR_VALUES(Auth, temp);

    /* Go on with the next two blocks */
    i++;
  }
  i--;
  i<<=1;
  /* Here, i is the number of full blocks we have processed in the loop above */

  /* Compute the partiall Auth value in the first 8 bytes */
  FOLD_TO_64(Auth);

  /* Last two blocks are not full incomplete */
  if ( (ass_data_len==0) || (ass_data_len > 8*i) ) {

    if( 8+16*i <= ass_data_len) { /* One more full block */

      /* Prepare the last padded block */
      memset(last_block, 0, 16);
      memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
      last_block[ass_data_len-16*i]=0x80;

      /* Encrypt the last block */
      set_stage_in_tweak(tweak, MSB_AD, MSB_AD_LAST);
      set_block_number_in_tweak(tweak2, i+1, i+1); /* One more full block */
      aesTweakEncrypt(last_block, subkeys, tweak, tweak2, temp);

      /* Update the Auth value */
      XOR_VALUES(Auth, temp);

      /* Compute the final Auth value */
      if( 8+16*i < ass_data_len ) FOLD_TO_64(Auth);


    } else {

      /* Prepare the last padded block */
      memset(last_block, 0, 16);
      memcpy(last_block, ass_data+8*i, ass_data_len-8*i);
      last_block[ass_data_len-8*i]=0x80;

      /* Encrypt the last block */
      if(ass_data_len>=8+8*i) {
	set_stage_in_tweak(tweak, MSB_AD, MSB_AD_LAST);
	set_block_number_in_tweak(tweak2, i+1, i+1);

      } else {
	set_stage_in_tweak(tweak, MSB_AD_LAST, MSB_AD_LAST);
	set_block_number_in_tweak(tweak2, i, i);
      }

      aesTweakEncrypt(last_block, subkeys, tweak, tweak2, temp);

      if( 8+8*i < ass_data_len ) FOLD_TO_64(temp);

      /* Update the Auth value */
      XOR_VALUES(Auth, temp);
    }
  }

  /* Message */
  memset(Checksum, 0, 16);
  set_stage_in_tweak(tweak, MSB_M, MSB_M);
  i=1;
  while (16*i <= m_len) {
    XOR_VALUES(Checksum, message+16*(i-1));
    set_block_number_in_tweak(tweak2, 2*i-1, 2*i);
    aesTweakEncrypt(message+16*(i-1), subkeys, tweak, tweak2, ciphertext+16*(i-1));
    i++;
  }
  i--;
  i<<=1;
  /* Here, i is the number of full blocks we have processed in the loop above */

  /* One more full block to pe processed on its own */
  if( (8+8*i)<=m_len ) {

    /* Prepare last full block */
    memset(last_block, 0, 16);
    memcpy(last_block, message+8*i, 8);
    XOR_VALUES(Checksum, last_block);

    /* Encrypt it */
    set_stage_in_tweak(tweak, MSB_M, MSB_M);
    set_block_number_in_tweak(tweak2, i+1, i+1);
    aesTweakEncrypt(last_block, subkeys, tweak, tweak2, temp);

    /* Write the encrypted block */
    memcpy(ciphertext+8*i, temp, 8);

    /* We have a new full block */
    i++;
  }

  /* Process last block */
  /* If the block is full, i.e. M_last=epsilon */
  if (m_len == 8*i) {

    FOLD_TO_64(Checksum);

    set_stage_in_tweak(tweak, MSB_M_LAST_ZERO, MSB_M_LAST_ZERO);
    set_block_number_in_tweak(tweak2, i, i);
    aesTweakEncrypt(Checksum, subkeys, tweak, tweak2, Final);

  } else { /* If the block is partial and requires padding */

    memset(last_block, 0, 16);
    memcpy(last_block, message+8*i, m_len-8*i);
    last_block[m_len-8*i]=0x80;
    XOR_VALUES(Checksum, last_block);

    /* Create the zero block for encryption */
    memset(zero_block, 0, 16);

    /* Encrypt it */
    set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO);
    set_block_number_in_tweak(tweak2, i, i);
    aesTweakEncrypt(zero_block, subkeys, tweak, tweak2, Pad);

    FOLD_TO_64(Checksum);

    for (j=0; j<m_len-8*i; j++) {
      ciphertext[8*i+j]=last_block[j] ^ Pad[j];
    }

    set_stage_in_tweak(tweak, MSB_CHKSUM, MSB_CHKSUM);
    aesTweakEncrypt(Checksum, subkeys, tweak, tweak2, Final);

  }

  /* Append the authentication tag to the ciphertext */
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

  ALIGN(16) uint8_t tweak[16];
  ALIGN(16) uint8_t tweak2[16];
  ALIGN(16) uint8_t Auth[16];         /* Auth values is on 8 bytes: the last 8 bytes are used for temporary computations */
  ALIGN(16) uint8_t last_block[16];
  ALIGN(16) uint8_t temp[16];
  ALIGN(16) uint8_t Checksum[16];
  ALIGN(16) uint8_t zero_block[16];
  ALIGN(16) uint8_t Final[16];
  ALIGN(16) uint8_t Pad[16];
  ALIGN(16) uint8_t subkeys[(32+1)*16];
  ALIGN(16) uint8_t subkeys2[16];
  ALIGN(16) uint8_t subkeys_inv[(32+1)*16];
  ALIGN(16) uint8_t subkeys_inv2[16];

  ALIGN(16) uint8_t Tag[8];

  /* Get the tag from the last 8 bytes of the ciphertext */
  memcpy(Tag, ciphertext+c_len-8, 8);

  /* Update c_len to the actual size of the ciphertext (i.e., without the tag) */
  c_len-=8;

  /* Fill the tweak from nonce */
  memset(tweak,  0, sizeof(tweak));
  memset(tweak2, 0, sizeof(tweak2));
  set_nonce_in_tweak(tweak, tweak2, nonce);

  memcpy(subkeys,       key,      8);
  memcpy(subkeys+8,     key,      8); /* K^1 || K^1 */

  memset(subkeys2, 0, 16);
  memcpy(subkeys2,      key+8,    4);
  memcpy(subkeys2+8,    key+8,    4); /* K^2 || K^2 */

  memcpy(subkeys_inv,    subkeys,  16);
  memcpy(subkeys_inv2,   subkeys2, 16);

  /* Key schedule */
  TweakeyScheduleTK2(subkeys, subkeys2);                 /* Fill the subkey(s) for encryption in 'subkeys'     */
  TweakeyScheduleTK2_reverse(subkeys_inv, subkeys_inv2); /* Fill the subkey(s) for decryption in 'subkeys_inv' */

  /* Associated data */
  memset(Auth, 0, 16);
  set_stage_in_tweak(tweak, MSB_AD, MSB_AD);

  /* For each full input blocks */
  i=1;
  while (16*i <= ass_data_len) {

    /* Encrypt the current block */
    set_block_number_in_tweak(tweak2, 2*i-1, 2*i);
    aesTweakEncrypt(ass_data+16*(i-1), subkeys, tweak, tweak2, temp);

    /* Update Auth value */
    XOR_VALUES(Auth, temp);

    /* Go on with the next two blocks */
    i++;
  }
  i--;
  i<<=1;
  /* Here, i is the number of full blocks we have processed in the loop above */

  /* Compute the partiall Auth value in the first 8 bytes */
  FOLD_TO_64(Auth);

  /* Last two blocks are not full incomplete */
  if ( (ass_data_len==0) || (ass_data_len > 8*i) ) {

    if( 8+16*i <= ass_data_len) { /* One more full block */

      /* Prepare the last padded block */
      memset(last_block, 0, 16);
      memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
      last_block[ass_data_len-16*i]=0x80;

      /* Encrypt the last block */
      set_stage_in_tweak(tweak, MSB_AD, MSB_AD_LAST);
      set_block_number_in_tweak(tweak2, i+1, i+1); /* One more full block */
      aesTweakEncrypt(last_block, subkeys, tweak, tweak2, temp);

      /* Update the Auth value */
      XOR_VALUES(Auth, temp);

      /* Compute the final Auth value */
      if( 8+16*i < ass_data_len ) FOLD_TO_64(Auth);


    } else {

      /* Prepare the last padded block */
      memset(last_block, 0, 16);
      memcpy(last_block, ass_data+8*i, ass_data_len-8*i);
      last_block[ass_data_len-8*i]=0x80;

      /* Encrypt the last block */

      if(ass_data_len>=8+8*i) {
        set_stage_in_tweak(tweak, MSB_AD, MSB_AD_LAST);
        set_block_number_in_tweak(tweak2, i+1, i+1);

      } else {
        set_stage_in_tweak(tweak, MSB_AD_LAST, MSB_AD_LAST);
        set_block_number_in_tweak(tweak2, i, i);
      }

      aesTweakEncrypt(last_block, subkeys, tweak, tweak2, temp);

      if( 8+8*i < ass_data_len ) FOLD_TO_64(temp);

      /* Update the Auth value */
      XOR_VALUES(Auth, temp);
    }
  }

  /* Ciphertext */
  memset(Checksum, 0, 16);
  set_stage_in_tweak(tweak, MSB_M, MSB_M);
  i=1;
  while (16*i <= c_len) {
    set_block_number_in_tweak(tweak2, 2*i-1, 2*i);
    aesTweakDecrypt(ciphertext+16*(i-1), subkeys_inv, tweak, tweak2, message+16*(i-1));
    XOR_VALUES(Checksum, message+16*(i-1));
    i++;
  }
  i--;
  i<<=1;
  /* Here, i is the number of full blocks we have processed in the loop above */

  /* One more full block to pe processed on its own */
  if( (8+8*i)<=c_len ) {

    /* Prepare last full block */
    memset(last_block, 0, 16);
    memcpy(last_block, ciphertext+8*i, 8);

    /* Encrypt it */
    set_stage_in_tweak(tweak, MSB_M, MSB_M);
    set_block_number_in_tweak(tweak2, i+1, i+1);
    aesTweakDecrypt(last_block, subkeys_inv, tweak, tweak2, temp);

    /* XOR the first half of the decrypted block to Checksum */
    memset(temp+8, 0, 8);
    XOR_VALUES(Checksum, temp);

    /* Write the encrypted block */
    memcpy(message+8*i, temp, 8);

    /* We have a new full block */
    i++;
  }

  /* Process last block */
  /* If the block is full, i.e. M_last=epsilon */
  if (c_len == 8*i) {

    FOLD_TO_64(Checksum);

    set_stage_in_tweak(tweak, MSB_M_LAST_ZERO, MSB_M_LAST_ZERO);
    set_block_number_in_tweak(tweak2, i, i);
    aesTweakEncrypt(Checksum, subkeys, tweak, tweak2, Final);

  } else { /* If the block is partial and requires padding */

    /* Prepare the full-zero block */
    memset(zero_block, 0, 16);

    /* Encrypt it */
    set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO, MSB_M_LAST_NONZERO);
    set_block_number_in_tweak(tweak2, i, i);
    aesTweakEncrypt(zero_block, subkeys, tweak, tweak2, Pad);

    /* XOR the partial ciphertext */
    memset(last_block, 0, 16);
    memcpy(last_block, ciphertext+8*i, c_len-8*i);
    memset(Pad+c_len-8*i, 0, 16-(c_len-8*i));

    XOR_VALUES(last_block, Pad);
    last_block[c_len-8*i]=0x80;
    memcpy(message+8*i, last_block, c_len-8*i);

    /* Update checksum */
    XOR_VALUES(Checksum, last_block);
    FOLD_TO_64(Checksum);

    /* Encrypt the Checksum */
    set_stage_in_tweak(tweak, MSB_CHKSUM, MSB_CHKSUM);
    aesTweakEncrypt(Checksum, subkeys, tweak, tweak2, Final);

  }

  /* Verify the tag */
  XOR_VALUES(Final, Auth);

  /* If the tags does not match, return error -1 */
  if( 0 != memcmp(Final, Tag, 8) ) {
    return -1;
  }

  *m_len=c_len;
  return 0;

}
