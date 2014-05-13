/*
 * Joltik=/=-96-96 Reference C Implementation
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
#include "joltik.h"
#include "tweakableBC.h"

/* Define the three MSB of the tweak (that depend on the stage) */
#define MSB_AD 			      (0x2<<5)
#define MSB_AD_LAST		      (0x6<<5)
#define MSB_M			      (0x0<<5)
#define MSB_M_LAST_ZERO		  (0x1<<5)
#define MSB_M_LAST_NONZERO	  (0x4<<5)
#define MSB_PAD			      (0x4<<5)
#define MSB_CHKSUM		      (0x5<<5)

/* Number of bits in the TWEAKEY state (128 or 192) */
#define TWEAKEY_STATE_SIZE    192

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
static void set_nonce_in_tweak(uint8_t *tweak, const uint8_t *nonce) {
    tweak[0] =	(tweak[0]&0xe0)    ^ (nonce[0] >> 3);
    tweak[1] = ((nonce[0]&7) << 5) ^ (nonce[1] >> 3);
    tweak[2] = ((nonce[1]&7) << 5) ^ (nonce[2] >> 3);
    tweak[3] = ((nonce[2]&7) << 5) ^ (nonce[3] >> 3);
    tweak[4] = ((nonce[3]&7) << 5) ^ (nonce[4] >> 3);
    tweak[5] = ((nonce[4]&7) << 5) ^ (nonce[5] >> 3);
    tweak[6] = ((nonce[5]&7) << 5);
}

/*
** Modifiy the block number in the tweak value
*/
static void set_block_number_in_tweak(uint8_t *tweak, const uint64_t block_no) {
    tweak[ 6] = (tweak[6]&0xe0) ^ ((block_no >> 40ULL) & 0x1f);
    tweak[ 7] = ((block_no >> 32ULL) & 0xff);
    tweak[ 8] = ((block_no >> 24ULL) & 0xff);
    tweak[ 9] = ((block_no >> 16ULL) & 0xff);
    tweak[10] = ((block_no >>  8ULL) & 0xff);
    tweak[11] = ((block_no >>  0ULL) & 0xff);
}

/*
** Modifiy the stage value in the tweak value
*/
static void set_stage_in_tweak(uint8_t *tweak, const uint8_t value) {
    tweak[0]=(tweak[0] & 0x1f) ^ value ;
}

/*
** Update the tweak value in the tweakey word.
** In the case of Joltik-BC-128, the tweakey word is composed of KEY || TWEAK.
** In the case of Joltik-BC-192, the tweakey word is composed of KEY_1 || KEY_2 || TWEAK.
*/
static void set_tweak_in_tweakey(uint8_t *tweakey, uint8_t *tweak) {
#if TWEAKEY_STATE_SIZE==128
    memcpy(tweakey+10, tweak,  6);
#elif TWEAKEY_STATE_SIZE==192
    memcpy(tweakey+12, tweak, 12);
#endif
}

/*
** XOR an input block to another input block
*/
static void xor_values(uint8_t *v1, const uint8_t *v2) {
    int i;
    for (i=0; i<8; i++) v1[i] ^= v2[i];
}

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
    uint8_t tweak[12];
    uint8_t tweakey[TWEAKEY_STATE_SIZE/8];
    uint8_t Auth[8];
    uint8_t last_block[8];
    uint8_t Checksum[8];
    uint8_t Final[8];
    uint8_t zero_block[8];
    uint8_t Pad[8];
    uint8_t temp[8];

    /* Fill the tweak from nonce */
    memset(tweak, 0, sizeof(tweak));

    /* Set the nonce in the tweak */
    set_nonce_in_tweak(tweak, nonce);

    /* Fill the key(s) in the tweakey state */
#if TWEAKEY_STATE_SIZE==128
    memcpy(tweakey, key, 10);
#elif TWEAKEY_STATE_SIZE==192
    memcpy(tweakey, key, 12);
#endif

    /* Associated data */
    memset(Auth, 0, 8);
    set_stage_in_tweak(tweak, MSB_AD);

    /* For each full input blocks */
    i=1;
    while (8*i <= ass_data_len) {

        /* Encrypt the current block */
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, ass_data+8*(i-1), tweakey, temp);

        /* Update Auth value */
        xor_values(Auth, temp);

        /* Go on with the next block */
        i++;
    }
    i--;

    /* Last block if incomplete */
    if ( (ass_data_len==0) || (ass_data_len > 8*i) ) {

        /* Prepare the last padded block */
        memset(last_block, 0, 8);
        memcpy(last_block, ass_data+8*i, ass_data_len-8*i);
        last_block[ass_data_len-8*i]=0x80;

        /* Encrypt the last block */
        set_stage_in_tweak(tweak, MSB_AD_LAST);
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);

        /* Update the Auth value */
        xor_values(Auth, temp);
    }

    /* Message */
    memset(Checksum, 0, 8);
    set_stage_in_tweak(tweak, MSB_M);
    i=1;
    while (8*i <= m_len) {
        xor_values(Checksum, message+8*(i-1));
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, message+8*(i-1), tweakey, ciphertext+8*(i-1));
        i++;
    }
    i--;

    /* Process last block */
    /* If the block is full, i.e. M_last=epsilon */
    if (m_len == 8*i) {
        set_stage_in_tweak(tweak, MSB_M_LAST_ZERO);
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, Checksum, tweakey, Final);

    } else { /* If the block is partial and requires padding */
        memset(last_block, 0, 8);
        memcpy(last_block, message+8*i, m_len-8*i);
        last_block[m_len-8*i]=0x80;
        xor_values(Checksum, last_block);

        /* Create the zero block for encryption */
        memset(zero_block, 0, 8);

        /* Encrypt it */
        set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO);
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, zero_block, tweakey, Pad);

        for (j=0; j<m_len-8*i; j++) {
            ciphertext[8*i+j]=last_block[j] ^ Pad[j];
        }
        set_stage_in_tweak(tweak, MSB_CHKSUM);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, Checksum, tweakey, Final);
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
    uint64_t j;
    uint8_t tweak[12];
    uint8_t tweakey[TWEAKEY_STATE_SIZE/8];
    uint8_t Auth[8];
    uint8_t last_block[8];
    uint8_t Checksum[8];
    uint8_t Final[8];
    uint8_t zero_block[8];
    uint8_t Pad[8];
    uint8_t Tag[8];
    uint8_t temp[8];

    /* Get the tag from the last 8 bytes of the ciphertext */
    memcpy(Tag, ciphertext+c_len-8, 8);

    /* Update c_len to the actual size of the ciphertext (i.e., without the tag) */
    c_len-=8;

    /* Fill the tweak from nonce */
    set_nonce_in_tweak(tweak, nonce);

    /* Fill the key(s) in the tweakey state */
#if TWEAKEY_STATE_SIZE==128
    memcpy(tweakey, key, 10);
#elif TWEAKEY_STATE_SIZE==192
    memcpy(tweakey, key, 12);
#endif

    /* Associated data */
    memset(Auth, 0, 8);
    set_stage_in_tweak(tweak, MSB_AD);
    i=1;
    while (8*i <= ass_data_len) {
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, ass_data+8*(i-1), tweakey, temp);
        xor_values(Auth, temp);
        i++;
    }
    i--;

    /* Last block if incomplete */
    if ((ass_data_len==0) || (ass_data_len > 8*i) ) {
        memset(last_block, 0, 8);
        memcpy(last_block, ass_data+8*i, ass_data_len-8*i);
        last_block[ass_data_len-8*i]=0x80;
        set_stage_in_tweak(tweak, MSB_AD_LAST);
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);
        xor_values(Auth, temp);
    }

    /* Ciphertext */
    memset(Checksum, 0, 8);
    set_stage_in_tweak(tweak, MSB_M);
    i=1;
    while(8*i<=c_len) {
        set_tweak_in_tweakey(tweakey, tweak);
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakDecrypt(TWEAKEY_STATE_SIZE, ciphertext+8*(i-1), tweakey, message+8*(i-1));

        xor_values(Checksum, message+8*(i-1));
        i++;
    }
    i--;

    /* Last block */
    /* If the block is full, i.e. M_last=epsilon */
    if (c_len == 8*i) {
        set_stage_in_tweak(tweak, MSB_M_LAST_ZERO);
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, Checksum, tweakey, Final);
        xor_values(Final, Auth);

        /* If the tags does not match, return error -1 */
        if( 0 != memcmp(Final, Tag, sizeof(Tag)) ) {
            return -1;
        }

    } else { /* If the block is partial and has been padded */

        /* Prepare the full-zero block */
        memset(zero_block, 0, 8);

        /* Prepare the tweak */
        set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO);
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);

        /* Encrypt */
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, zero_block, tweakey, Pad);

        /* XOR the partial ciphertext */
        memset(last_block, 0, 8);
        memcpy(last_block, ciphertext+8*i, c_len-8*i);
        memset(Pad+c_len-8*i, 0, 8-(c_len-8*i));
        xor_values(last_block, Pad);
        last_block[c_len-8*i]=0x80;

        for (j=0; j<c_len-8*i; j++) {
            message[8*i+j]=last_block[j];
        }

        /* Update checksum */
        xor_values(Checksum, last_block);

        /* Verify the tag */
        set_stage_in_tweak(tweak, MSB_CHKSUM);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, Checksum, tweakey, Final);
        xor_values(Final, Auth);

        /* If the tags does not match, return error -1 */
        if( 0 != memcmp(Final, Tag, sizeof(Tag)) ) {
            return -1;
        }
    }

    *m_len=c_len;
    return 0;
}
