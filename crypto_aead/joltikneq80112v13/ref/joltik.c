/*
 * Joltik=/=-80-112 Reference C Implementation
 *
 * Copyright 2015:
 *     Jeremy Jean <JJean@ntu.edu.sg>
 *     Ivica Nikolic <inikolic@ntu.edu.sg>
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
#define MSB_AD 			      (0x2<<4)
#define MSB_AD_LAST		      (0x6<<4)
#define MSB_M			      (0x0<<4)
#define MSB_M_LAST_NONZERO	  (0x4<<4)
#define MSB_CHKSUM_FULL       (0x1<<4)
#define MSB_CHKSUM_NON_FULL	  (0x5<<4)

/* Number of bits in the TWEAKEY state (128 or 192) */
#define TWEAKEY_STATE_SIZE    192

/**********************************************************************************
*** In Joltik=/=-80-112, the tweak is on 112 bits:
***     tweak = <stage> || <nonce> || <blockNumber>
***  where we use:
***      4 bits for stage
***     56 bits for nonce
***     52 bits for blockNumber
***********************************************************************************/
/*
** Modifiy the nonce part in the tweak value
*/
static void set_nonce_in_tweak(uint8_t *tweak, const uint8_t *nonce) {
    tweak[0] = (tweak[0]&0xf0)     ^ (nonce[0] >> 4);
    tweak[1] = (nonce[0]&0xf) << 4 ^ (nonce[1] >> 4);
    tweak[2] = (nonce[1]&0xf) << 4 ^ (nonce[2] >> 4);
    tweak[3] = (nonce[2]&0xf) << 4 ^ (nonce[3] >> 4);
    tweak[4] = (nonce[3]&0xf) << 4 ^ (nonce[4] >> 4);
    tweak[5] = (nonce[4]&0xf) << 4 ^ (nonce[5] >> 4);
    tweak[6] = (nonce[5]&0xf) << 4 ^ (nonce[6] >> 4);
    tweak[7] = (nonce[6]&0xf) << 4;
}

/*
** Modifiy the block number in the tweak value
*/

static void set_block_number_in_tweak(uint8_t *tweak, const uint64_t block_no) {
    tweak[ 7] = (tweak[7]&0xf0) ^ ((block_no >> 48ULL) & 0xf);
    tweak[ 8] = ((block_no >> 40ULL) & 0xff);
    tweak[ 9] = ((block_no >> 32ULL) & 0xff);
    tweak[10] = ((block_no >> 24ULL) & 0xff);
    tweak[11] = ((block_no >> 16ULL) & 0xff);
    tweak[12] = ((block_no >>  8ULL) & 0xff);
    tweak[13] = ((block_no >>  0ULL) & 0xff);
}

/*
** Modifiy the stage value in the tweak value
*/
static void set_stage_in_tweak(uint8_t *tweak, const uint8_t value) {
    tweak[0]=(tweak[0] & 0xf) ^ value ;
}

/*
** Update the tweak value in the tweakey word.
*/
static void set_tweak_in_tweakey(uint8_t *tweakey, uint8_t *tweak) {
    memcpy(tweakey+10, tweak,  14);
}

/*
** Constant-time memcmp function
*/
static int memcmp_const(const void * a, const void *b, const size_t size)  {

    size_t i;
    unsigned char result = 0;
    const unsigned char *_a = (const unsigned char *) a;
    const unsigned char *_b = (const unsigned char *) b;

    for (i = 0; i < size; i++) {
        result |= _a[i] ^ _b[i];
    }

    /* returns 0 if equal, nonzero otherwise */
    return result; 
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
    uint8_t tweak[14];
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
    memcpy(tweakey, key, 10);

    /* Associated data */
    memset(Auth, 0, 8);

    if(ass_data_len) {
            set_stage_in_tweak(tweak, MSB_AD);

            /* For each full input blocks */
            i=0;
            while (8*(i+1) <= ass_data_len) {

                /* Encrypt the current block */
                set_block_number_in_tweak(tweak, i);
                set_tweak_in_tweakey(tweakey, tweak);
                aesTweakEncrypt(TWEAKEY_STATE_SIZE, ass_data+8*i, tweakey, temp);

                /* Update Auth value */
                xor_values(Auth, temp);

                /* Go on with the next block */
                i++;
            }

            /* Last block if incomplete */
            if ( ass_data_len > 8*i ) {

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
    }/* if ass_data_len>0 */

    /* Message */
    memset(Checksum, 0, 8);
    set_stage_in_tweak(tweak, MSB_M);
    i=0;
    while (8*(i+1) <= m_len) {
        xor_values(Checksum, message+8*i );
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, message+8*i, tweakey, ciphertext+8*i );
        i++;
    }
 
    /* Process last block */
    /* If the block is full, i.e. M_last=epsilon */
    if (m_len == 8*i) {
        set_stage_in_tweak(tweak, MSB_CHKSUM_FULL);
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
        set_stage_in_tweak(tweak, MSB_CHKSUM_NON_FULL);
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
    uint8_t tweak[14];
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
    memcpy(tweakey, key, 10);

    /* Associated data */
    memset(Auth, 0, 8);
    if(ass_data_len) {
            set_stage_in_tweak(tweak, MSB_AD);
            i=0;
            while (8*(i+1) <= ass_data_len) {
                set_block_number_in_tweak(tweak, i);
                set_tweak_in_tweakey(tweakey, tweak);
                aesTweakEncrypt(TWEAKEY_STATE_SIZE, ass_data+8*i, tweakey, temp);
                xor_values(Auth, temp);
                i++;
            }

            /* Last block if incomplete */
            if ( ass_data_len > 8*i ) {
                memset(last_block, 0, 8);
                memcpy(last_block, ass_data+8*i, ass_data_len-8*i);
                last_block[ass_data_len-8*i]=0x80;
                set_stage_in_tweak(tweak, MSB_AD_LAST);
                set_block_number_in_tweak(tweak, i);
                set_tweak_in_tweakey(tweakey, tweak);
                aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);
                xor_values(Auth, temp);
            }
    }/* if ass_data_len>0 */

    /* Ciphertext */
    memset(Checksum, 0, 8);
    set_stage_in_tweak(tweak, MSB_M);
    i=0;
    while(8*(i+1)<=c_len) {
        set_tweak_in_tweakey(tweakey, tweak);
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakDecrypt(TWEAKEY_STATE_SIZE, ciphertext+8*i, tweakey, message+8*i);

        xor_values(Checksum, message+8*i);
        i++;
    }

    /* Last block */
    /* If the block is full, i.e. M_last=epsilon */
    if (c_len == 8*i) {
        set_stage_in_tweak(tweak, MSB_CHKSUM_FULL);
        set_block_number_in_tweak(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, Checksum, tweakey, Final);
        xor_values(Final, Auth);

        /* If the tags does not match, return error -1 */
        if( 0 != memcmp_const(Final, Tag, sizeof(Tag)) ) {
            memset( message, 0, c_len);
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
        set_stage_in_tweak(tweak, MSB_CHKSUM_NON_FULL);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, Checksum, tweakey, Final);
        xor_values(Final, Auth);

        /* If the tags does not match, return error -1 */
        if( 0 != memcmp_const(Final, Tag, sizeof(Tag)) ) {
            memset( message, 0, c_len );
            return -1;
        }
    }

    *m_len=c_len;
    return 0;
}
