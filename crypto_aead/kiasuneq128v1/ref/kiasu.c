/*
 * Kiasu=/=-128 Reference C Implementation
 * 
 * Copyright 2014:
 *     Jeremy Jean <JJean@ntu.edu.sg>
 *     Ivica Nikolic <INikolic@ntu.edu.sg>
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
#include "kiasu.h"
#include "tweakable_aes.h"

/* Define the three MSB of the tweak (that depend on the stage) */
#define MSB_AD 			      (0x2<<5)
#define MSB_AD_LAST		      (0x6<<5)
#define MSB_M			      (0x0<<5)
#define MSB_M_LAST_ZERO		  (0x1<<5)
#define MSB_M_LAST_NONZERO	  (0x4<<5)
#define MSB_PAD			      (0x4<<5)
#define MSB_CHKSUM		      (0x5<<5)

/**********************************************************************************
*** In Kiasu=/=-128, the tweak is on 64 bits:
***     tweak = <stage> || <nonce> || <blockNumber>
***  where we use:
***      3 bits for stage
***     32 bits for nonce
***     29 bits for blockNumber
***********************************************************************************/

/*
** Modifiy the nonce part in the tweak value
*/
static void set_nonce_in_tweak(uint8_t *tweak, const uint8_t *nonce) {
    tweak[0]= (tweak[0]&0xe0)  ^ (nonce[0] >> 3);
    tweak[1]=(nonce[0]&7) << 5 ^ (nonce[1] >> 3);
    tweak[2]=(nonce[1]&7) << 5 ^ (nonce[2] >> 3);
    tweak[3]=(nonce[2]&7) << 5 ^ (nonce[3] >> 3);
    tweak[4]=(nonce[3]&7) << 5;
}

/*
** Modifiy the block number in the tweak value
*/
static void set_block_number_in_tweak(uint8_t *tweak, const uint32_t block_no) {
    tweak[4]=((block_no >> 24) & 0x1f) ^ (tweak[4] & 0xe0);
    tweak[5]=((block_no >> 16) & 0xff);
    tweak[6]=((block_no >>  8) & 0xff);
    tweak[7]=((block_no >>  0) & 0xff);
}

/*
** Modifiy the stage value in the tweak value
*/
static void set_stage_in_tweak(uint8_t *tweak, const uint8_t value) {
    tweak[0]=(tweak[0] & 0x1f) ^ value ;
}

/*
** XOR an input block to another input block
*/
static void xor_values(uint8_t *v1, const uint8_t *v2) {
    int i;
    for (i=0; i<16; i++) v1[i] ^= v2[i];
}

/*
** Kiasu encryption function
*/
void kiasu_aead_encrypt(const uint8_t *ass_data, size_t ass_data_len,
                        const uint8_t *message, size_t m_len,
                        const uint8_t *key,
                        const uint8_t *nonce,
                        uint8_t *ciphertext, size_t *c_len)
{

    uint32_t i;
    uint32_t j;
    uint8_t tweak[8];
    uint8_t Auth[16];
    uint8_t last_block[16];
    uint8_t Checksum[16];
    uint8_t Final[16];
    uint8_t zero_block[16];
    uint8_t Pad[16];
    uint8_t temp[16];

    /* Fill the tweak from nonce */
    memset(tweak, 0, sizeof(tweak));
    set_nonce_in_tweak(tweak, nonce);

    /* Associated data */
    memset(Auth, 0, 16);
    set_stage_in_tweak(tweak, MSB_AD);

    /* For each full input blocks */
    i=1;
    while (16*i <= ass_data_len) {

        /* Encrypt the current block */
        set_block_number_in_tweak(tweak, i);
        aesTweakEncrypt(ass_data+16*(i-1), key, tweak, temp);

        /* Update Auth value */
        xor_values(Auth, temp);

        /* Go on with the next block */
        i++;
    }
    i--;

    /* Last block if incomplete */
    if ( (ass_data_len==0) || (ass_data_len > 16*i) ) {

        /* Prepare the last padded block */
        memset(last_block, 0, 16);
        memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
        last_block[ass_data_len-16*i]=0x80;

        /* Encrypt the last block */
        set_stage_in_tweak(tweak, MSB_AD_LAST);
        set_block_number_in_tweak(tweak, i);

        aesTweakEncrypt(last_block, key, tweak, temp);

        /* Update the Auth value */
        xor_values(Auth, temp);
    }

    /* Message */
    memset(Checksum, 0, 16);
    set_stage_in_tweak(tweak, MSB_M);
    i=1;
    while (16*i <= m_len) {
        xor_values(Checksum, message+16*(i-1));
        set_block_number_in_tweak(tweak, i);
        aesTweakEncrypt(message+16*(i-1), key, tweak, ciphertext+16*(i-1));
        i++;
    }
    i--;

    /* Process last block */
    /* If the block is full, i.e. M_last=epsilon */
    if (m_len == 16*i) {
        set_stage_in_tweak(tweak, MSB_M_LAST_ZERO);
        set_block_number_in_tweak(tweak, i);
        aesTweakEncrypt(Checksum, key, tweak, Final);

    } else { /* If the block is partial and requires padding */
        memset(last_block, 0, 16);
        memcpy(last_block, message +16*i, m_len-16*i);
        last_block[m_len-16*i]=0x80;
        xor_values(Checksum, last_block);

        set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO);
        set_block_number_in_tweak(tweak, i);
        memset(zero_block, 0, 16);
        aesTweakEncrypt(zero_block, key, tweak, Pad);

        for (j=0; j<m_len-16*i; j++) {
            ciphertext[16*i+j]=last_block[j] ^ Pad[j];
        }
        set_stage_in_tweak(tweak, MSB_CHKSUM);
        aesTweakEncrypt(Checksum, key, tweak, Final);
    }

    /* Append the authentication tag to the ciphertext */
    for (i=0; i<16; i++) {
        ciphertext[m_len+i]=Final[i] ^ Auth[i];
    }

    /* The authentication tag is one block long, i.e. 16 bytes */
    *c_len=m_len+16;

}

/*
** Kiasu decryption function
*/
int kiasu_aead_decrypt(const uint8_t *ass_data, size_t ass_data_len,
                       uint8_t *message, size_t *m_len,
                       const uint8_t *key,
                       const uint8_t *nonce,
                       const uint8_t *ciphertext, size_t c_len)
{

    uint32_t i;
    uint32_t j;
    uint8_t tweak[8];
    uint8_t Auth[16];
    uint8_t last_block[16];
    uint8_t Checksum[16];
    uint8_t Final[16];
    uint8_t zero_block[16];
    uint8_t Pad[16];
    uint8_t Tag[16];
    uint8_t temp[16];

    /* Get the tag from the last 16 bytes of the ciphertext */
    memcpy(Tag, ciphertext+c_len-16, 16);

    /* Update c_len to the actual size of the ciphertext (i.e., without the tag) */
    c_len-=16;

    /* Fill the tweak from nonce */
    set_nonce_in_tweak(tweak, nonce);

    /* Associated data */
    memset(Auth, 0, 16);
    set_stage_in_tweak(tweak, MSB_AD);
    i=1;
    while (16*i <= ass_data_len) {
        set_block_number_in_tweak(tweak, i);
        aesTweakEncrypt(ass_data+16*(i-1), key, tweak, temp);
        xor_values(Auth, temp);
        i++;
    }
    i--;

    /* Last block if incomplete */
    if ((ass_data_len==0) || (ass_data_len > 16*i) ) {
        memset(last_block, 0, 16);
        memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
        last_block[ass_data_len-16*i]=0x80;
        set_stage_in_tweak(tweak, MSB_AD_LAST);
        set_block_number_in_tweak(tweak, i);
        aesTweakEncrypt(last_block, key, tweak, temp);
        xor_values(Auth, temp);
    }

    /* Ciphertext */
    memset(Checksum, 0, 16);
    set_stage_in_tweak(tweak, MSB_M);
    i=1;
    while(16*i<=c_len) {
        set_block_number_in_tweak(tweak, i);
        aesTweakDecrypt(ciphertext+16*(i-1), key, tweak, message+16*(i-1));
        xor_values(Checksum, message+16*(i-1));
        i++;
    }
    i--;

    /* Last block */
    /* If the block is full, i.e. M_last=epsilon */
    if (c_len == 16*i) {
        set_stage_in_tweak(tweak, MSB_M_LAST_ZERO);
        set_block_number_in_tweak(tweak, i);
        aesTweakEncrypt(Checksum, key, tweak, Final);
        xor_values(Final, Auth);

        /* If the tags does not match, return error -1 */
        if( 0 != memcmp(Final, Tag, sizeof(Tag)) ) {
            return -1;
        }

    } else { /* If the block is partial and has been padded */

        /* Prepare the full-zero block */
        memset(zero_block, 0, 16);

        /* Prepare the tweak */
        set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO);
        set_block_number_in_tweak(tweak, i);

        /* Encrypt */
        aesTweakEncrypt(zero_block, key, tweak, Pad);

        /* XOR the partial ciphertext */
        memset(last_block, 0, 16);
        memcpy(last_block, ciphertext+16*i, c_len-16*i);
        memset(Pad+c_len-16*i, 0, 16-(c_len-16*i));
        xor_values(last_block, Pad);
        last_block[c_len-16*i]=0x80;

        for (j=0; j<c_len-16*i; j++) {
            message[16*i+j]=last_block[j];
        }

        /* Update checksum */
        xor_values(Checksum, last_block);

        /* Verify the tag */
        set_stage_in_tweak(tweak, MSB_CHKSUM);
        aesTweakEncrypt(Checksum, key, tweak, Final);
        xor_values(Final, Auth);

        /* If the tags does not match, return error -1 */
        if( 0 != memcmp(Final, Tag, sizeof(Tag)) ) {
            return -1;
        }
    }

    *m_len=c_len;
    return 0;
}
