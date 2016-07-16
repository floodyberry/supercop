/*
 * Joltik=-64-64 Reference C Implementation
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
#define MSB_AD_N1		      (0x3<<4)
#define MSB_AD_N2		      (0x7<<4)
#define MSB_AD 			      (0x2<<4)
#define MSB_AD_LAST		      (0x6<<4)
#define MSB_M			      (0x0<<4)
#define MSB_M_LAST_ZERO		      (0x1<<4)
#define MSB_M_LAST_NONZERO	      (0x4<<4)
#define MSB_CHKSUM		      (0x5<<4)


/* Number of bits in the TWEAKEY state (128 or 192) */
#define TWEAKEY_STATE_SIZE    128

/**********************************************************************************
*** In Joltik=-64-64, the tweak is on 64 bits:
***     tweak = <stage> || <blockNumber>
***  where we use:
***      4 bits for stage
***     60 bits for blockNumber
***********************************************************************************/


/*
** Modifiy the block number in the tweak value
*/
static void set_block_number_in_tweak_4(uint8_t *tweak, const uint64_t block_no) {
    tweak[0] = (tweak[0]&0xf0) ^
               ((block_no >> 56ULL) & 0x0f);
    tweak[1] = ((block_no >> 48ULL) & 0xff);
    tweak[2] = ((block_no >> 40ULL) & 0xff);
    tweak[3] = ((block_no >> 32ULL) & 0xff);
    tweak[4] = ((block_no >> 24ULL) & 0xff);
    tweak[5] = ((block_no >> 16ULL) & 0xff);
    tweak[6] = ((block_no >>  8ULL) & 0xff);
    tweak[7] = ((block_no >>  0ULL) & 0xff);
}

static void set_block_number_in_tweak_1(uint8_t *tweak, const uint64_t block_no) {
    tweak[0] = ((block_no >> 56ULL) & 0x7f) ^ 0x80 ;
    tweak[1] = ((block_no >> 48ULL) & 0xff);
    tweak[2] = ((block_no >> 40ULL) & 0xff);
    tweak[3] = ((block_no >> 32ULL) & 0xff);
    tweak[4] = ((block_no >> 24ULL) & 0xff);
    tweak[5] = ((block_no >> 16ULL) & 0xff);
    tweak[6] = ((block_no >>  8ULL) & 0xff);
    tweak[7] = ((block_no >>  0ULL) & 0xff);
}

uint64_t get_block_number_from_tag(uint8_t *tag) {
    return
    ((uint64_t)(tag[ 0]&0x7f) << 56 ) ^
    ((uint64_t)tag[ 1] << 48 ) ^
    ((uint64_t)tag[ 2] << 40 ) ^
    ((uint64_t)tag[ 3] << 32 ) ^
    ((uint64_t)tag[ 4] << 24 ) ^
    ((uint64_t)tag[ 5] << 16 ) ^
    ((uint64_t)tag[ 6] <<  8 ) ^
    ((uint64_t)tag[ 7]       )
    ;
}

/*
** Modifiy the stage value in the tweak value
*/
static void set_stage_in_tweak(uint8_t *tweak, const uint8_t value) {
    tweak[0]=(tweak[0] & 0x0f) ^ value;
}

/*
** Update the tweak value in the tweakey word.
** In the case of Joltik-BC-128, the tweakey word is composed of KEY || TWEAK.
** In the case of Joltik-BC-192, the tweakey word is composed of KEY_2 || KEY_1 || TWEAK.
*/
static void set_tweak_in_tweakey(uint8_t *tweakey, uint8_t *tweak) {
    memcpy(tweakey+8, tweak, 8);
}

/*
** XOR an input block to another input block
*/
static void xor_values(uint8_t *v1, const uint8_t *v2) {
    int i;
    for (i=0; i<8; i++) v1[i] ^= v2[i];
}

/*
**
*/
size_t getUnpaddedLength(uint8_t* message) {
  int i;
  for(i=7;message[i]==0x00 && i>0;--i);
  if(message[i]==0x80) return i;
  else return -1;
}


/*
** Constant-time memcmp function
*/
int memcmp_const(const void * a, const void *b, const size_t size)  {

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
** Joltik encryption function
*/
void joltik_aead_encrypt(const uint8_t *ass_data, size_t ass_data_len,
                         const uint8_t *message, size_t m_len,
                         const uint8_t *key,
                         const uint8_t *nonce,
                         uint8_t *ciphertext, size_t *c_len)
{

    uint32_t i,j;
    uint64_t hblock;
    uint8_t tweak[8];
    uint8_t tweakey[TWEAKEY_STATE_SIZE/8];
    uint8_t Auth[8];
    uint8_t last_block[8];
    uint8_t Checksum[8];
    uint8_t Final[8];
    uint8_t temp[8];
    uint8_t tag[8];

    /* Fill the tweak from nonce */
    memset(tweak, 0, sizeof(tweak));

    /* Fill the key(s) in the tweakey state */
    memcpy(tweakey, key, 8);

    /* Associated data */
    memset (Auth, 0, 8);

    /* The first two blocks with Nonce plaintext */
    set_stage_in_tweak(tweak, MSB_AD_N1);
    set_block_number_in_tweak_4(tweak, 0 );
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce, tweakey, temp);
    xor_values(Auth, temp);
    
    set_stage_in_tweak(tweak, MSB_AD_N2);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce, tweakey, temp);
    xor_values(Auth, temp);
    
    if(ass_data_len) {
        
        set_stage_in_tweak (tweak, MSB_AD);
        
        i = 0;
        while (8*(i+1) <= ass_data_len) {
            set_block_number_in_tweak_4 (tweak, i);
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt (TWEAKEY_STATE_SIZE, ass_data+8*i, tweakey, temp);
            xor_values (Auth, temp);
            i++;
        }
        
        /* Last incomplete BLOCK */
        if ( ass_data_len > 8*i ) {
            
            /* Prepare the last padded block */
            memset(last_block, 0, 8);
            memcpy(last_block, ass_data+8*i, ass_data_len-8*i);
            last_block[ass_data_len-8*i]=0x80;
            
            /* Encrypt the last block */
            set_stage_in_tweak(tweak, MSB_AD_LAST);
            set_block_number_in_tweak_4(tweak, i );
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);
            
            /* Update the Auth value */
            xor_values(Auth, temp);
        }
    } /* if ass_data_len>0 */

    
    
    /* Message
     * first pass
     */
    
    set_stage_in_tweak(tweak, MSB_M);
    i=0;
    while (8*(i+1) <= m_len) {
        set_block_number_in_tweak_4(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, message + 8*i, tweakey, temp);
        xor_values(Auth, temp );
        i++;
    }
    
    /* Process incomplete block */
    if (m_len >  8*i) {
        
        /* Prepare the last padded block */
        memset(last_block, 0, 8);
        memcpy(last_block, message+8*i, m_len-8*i);
        last_block[m_len-8*i]=0x80;
        
        set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO );
        set_block_number_in_tweak_4(tweak, i );
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);
        xor_values(Auth, temp );
    }
    
    /* Last encryption */
    set_stage_in_tweak(tweak, MSB_M_LAST_ZERO );
    set_block_number_in_tweak_4(tweak, 0 );
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt(TWEAKEY_STATE_SIZE, Auth, tweakey, tag );
    

    
    /* Message
     * second pass
     */
    
    i = 0;
    hblock = get_block_number_from_tag( tag );
    while (8*(i+1) <= m_len) {
        set_block_number_in_tweak_1(tweak, hblock );
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce , tweakey, ciphertext + 8*i );
        xor_values(ciphertext + 8*i, message + 8*i );
        i++;
        hblock++;
    }
    
    /* Impartial block */
    if (m_len >  8*i) {
        set_block_number_in_tweak_1(tweak, hblock );
	set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce , tweakey, temp );
        
        for( j = 0; j < m_len - 8 * i; j ++)
            ciphertext[ 8 * i + j ] = message[ 8 * i + j] ^ temp[j];
    } 
    
    /* Append the authentication tag to the ciphertext */
    memcpy( ciphertext + m_len, tag, 8 );

    /* Update the size of the ciphertext (incl. tag) */
    *c_len=8+m_len;
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

    uint32_t i,j;
    uint64_t hblock;
    uint8_t tweak[8];
    uint8_t tweakey[TWEAKEY_STATE_SIZE/8];
    uint8_t Auth[8];
    uint8_t last_block[8];
    uint8_t Checksum[8];
    uint8_t Final[8];
    uint8_t zero_block[8];
    uint8_t Pad[8];
    uint8_t Tag[8], tag[8];
    uint8_t temp[8];
    
    /* Get the tag from the last 8 bytes of the ciphertext */
    memcpy(Tag, ciphertext+c_len-8, 8);

    /* Update c_len to the actual size of the ciphertext (i.e., without the tag) */
    c_len-=8;
    
    /* Fill the tweak with zeros (no nonce !!!) */
    memset(tweak, 0, sizeof(tweak));

    /* Fill the key(s) in the tweakey state */
    memcpy(tweakey, key, 8);

    /* Associated data */
    memset (Auth, 0, 8);
    
    /* The first two blocks with Nonce plaintext */
    set_stage_in_tweak(tweak, MSB_AD_N1);
    set_block_number_in_tweak_4(tweak, 0 );
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce, tweakey, temp);
    xor_values(Auth, temp);
    
    set_stage_in_tweak(tweak, MSB_AD_N2);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce, tweakey, temp);
    xor_values(Auth, temp);
    
    
    if(ass_data_len) {
        
        set_stage_in_tweak (tweak, MSB_AD);
        
        i = 0;
        while (8*(i+1) <= ass_data_len) {
            set_block_number_in_tweak_4 (tweak, i);
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt (TWEAKEY_STATE_SIZE, ass_data+8*i, tweakey, temp);
            xor_values (Auth, temp);
            i++;
        }
        
        /* Last incomplete BLOCK */
        if ( ass_data_len > 8*i ) {
            
            /* Prepare the last padded block */
            memset(last_block, 0, 8);
            memcpy(last_block, ass_data+8*i, ass_data_len-8*i);
            last_block[ass_data_len-8*i]=0x80;
            
            /* Encrypt the last block */
            set_stage_in_tweak(tweak, MSB_AD_LAST);
            set_block_number_in_tweak_4(tweak, i );
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);
            
            /* Update the Auth value */
            xor_values(Auth, temp);
        }
    } /* if ass_data_len>0 */
    

    
    /* Get the message
     * (from the second pass)
     */
    
    i = 0;
    hblock = get_block_number_from_tag( Tag );
    while (8*(i+1) <= c_len) {
        set_block_number_in_tweak_1(tweak, hblock );
	set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce , tweakey, message + 8*i );
        xor_values( message + 8*i  , ciphertext + 8*i);
        i++;
        hblock++;
    }
    
    /* Impartial block */
    if (c_len >  8*i) {
        set_block_number_in_tweak_1(tweak, hblock );
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce , tweakey, temp );
        
        for( j = 0; j < c_len - 8 * i; j ++)
            message[ 8 * i + j ] = ciphertext[ 8 * i + j] ^ temp[j];
        
    } 
    

    
    /* Message
     * first pass
     */
    
    
    memset(tweak, 0, sizeof(tweak));
    set_stage_in_tweak(tweak, MSB_M);
    i=0;
    while (8*(i+1) <= c_len) {
        
        set_block_number_in_tweak_4(tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, message + 8*i, tweakey, temp);
        xor_values(Auth, temp );
        i++;
    }
    
    
    /* Process incomplete block */
    if (c_len >  8*i) {
        
        /* Prepare the last padded block */
        memset(last_block, 0, 8);
        memcpy(last_block, message+8*i, c_len-8*i);
        last_block[c_len-8*i]=0x80;
        
        set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO );
        set_block_number_in_tweak_4(tweak, i );
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);
        xor_values(Auth, temp );
    }
    
    /* Last encryption */
    set_stage_in_tweak(tweak, MSB_M_LAST_ZERO );
    set_block_number_in_tweak_4(tweak, 0 );
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt(TWEAKEY_STATE_SIZE, Auth, tweakey, tag );
    
    
    /* If the tags does not match, return error -1 */
    if( 0 != memcmp_const(Tag, tag, sizeof(Tag)) ) {
        memset( message, 0, c_len );
        return -1;
    }
    
    *m_len=c_len;
    return 0;

}
