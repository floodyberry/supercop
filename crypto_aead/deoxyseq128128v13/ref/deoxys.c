/*
 * Deoxys==-128-128 Reference C Implementation
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
#include "deoxys.h"
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

/* Number of bits in the TWEAKEY state (256 or 384) */
#define TWEAKEY_STATE_SIZE    256


/*
** Modifiy the block number in the tweak value
 * Assume there are at most 2^64 blocks
*/
static void set_block_number_in_tweak(uint8_t *tweak, const uint64_t block_no) {
    tweak[ 0] = ((block_no >> 56ULL) & 0xff);
    tweak[ 1] = ((block_no >> 48ULL) & 0xff);
    tweak[ 2] = ((block_no >> 40ULL) & 0xff);
    tweak[ 3] = ((block_no >> 32ULL) & 0xff);
    tweak[ 4] = ((block_no >> 24ULL) & 0xff);
    tweak[ 5] = ((block_no >> 16ULL) & 0xff);
    tweak[ 6] = ((block_no >>  8ULL) & 0xff);
    tweak[ 7] = ((block_no >>  0ULL) & 0xff);
}

uint64_t get_block_number_from_tag(uint8_t *tweak) {
  return 
    ((uint64_t)tweak[ 0] << 56 ) ^
    ((uint64_t)tweak[ 1] << 48 ) ^
    ((uint64_t)tweak[ 2] << 40 ) ^
    ((uint64_t)tweak[ 3] << 32 ) ^
    ((uint64_t)tweak[ 4] << 24 ) ^
    ((uint64_t)tweak[ 5] << 16 ) ^
    ((uint64_t)tweak[ 6] <<  8 ) ^
    ((uint64_t)tweak[ 7]       )
    ;
}

/*
** Modifiy the stage value in the tweak value
*/
static void set_stage_in_tweak(uint8_t *tweak, const uint8_t value) {
    tweak[0]=(tweak[0] & 0x0f) ^ value ;
}

/*
** Update the tweak value in the tweakey word.
** In the case of Deoxys-BC-256, the tweakey word is composed of KEY || TWEAK.
** In the case of Deoxys-BC-384, the tweakey word is composed of KEY_2 || KEY_1 || TWEAK.
*/
static void set_tweak_in_tweakey(uint8_t *tweakey, uint8_t *tweak) {
#if TWEAKEY_STATE_SIZE==256
    memcpy(tweakey+16, tweak, 16);
#elif TWEAKEY_STATE_SIZE==384
    memcpy(tweakey+32, tweak, 16);
#endif
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
    for (i=0; i<16; i++) v1[i] ^= v2[i];
}

/*
** Deoxys encryption function
*/
void deoxys_aead_encrypt(const uint8_t *ass_data, size_t ass_data_len,
                         const uint8_t *message, size_t m_len,
                         const uint8_t *key,
                         const uint8_t *nonce,
                         uint8_t *ciphertext, size_t *c_len)
{

    uint64_t i;
    uint64_t j;
    uint64_t hblock1,hblock2;
    uint8_t tweak[16];
    uint8_t tweakey[TWEAKEY_STATE_SIZE/8];
    uint8_t Auth[16];
    uint8_t last_block[16];
    uint8_t Final[16];
    uint8_t zero_block[16];
    uint8_t Pad[16];
    uint8_t temp[16];
    uint8_t tag[16];
    
    /* Fill the tweak with zeros (no nonce !!!) */
    memset(tweak, 0, sizeof(tweak));

    /* Fill the key(s) in the tweakey state */
    memcpy(tweakey, key, 16);

    /* Associated data */
    memset(Auth, 0, 16);
    
    /* The first two blocks with Nonce plaintext */
    set_block_number_in_tweak(tweak + 0 , 0 );
    set_block_number_in_tweak(tweak + 8 , 0 );
    set_stage_in_tweak(tweak, MSB_AD_N1);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce, tweakey, temp);
    xor_values(Auth, temp);

    set_stage_in_tweak(tweak, MSB_AD_N2);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce, tweakey, temp);
    xor_values(Auth, temp);

    if(ass_data_len) {

        set_stage_in_tweak(tweak, MSB_AD);

        /* For each full input blocks */
        i=0;
        while (16*(i+1) <= ass_data_len) {

            /* Encrypt the current block */
            set_block_number_in_tweak(tweak + 8, i );
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt(TWEAKEY_STATE_SIZE, ass_data+16*i, tweakey, temp);

            /* Update Auth value */
            xor_values(Auth, temp);

            /* Go on with the next block */
            i++;
        }

        /* Last block if incomplete */
        if ( ass_data_len > 16*i ) {
	  
            /* Prepare the last padded block */
            memset(last_block, 0, 16);
            memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
            last_block[ass_data_len-16*i]=0x80;

            /* Encrypt the last block */
            set_stage_in_tweak(tweak, MSB_AD_LAST);
            set_block_number_in_tweak(tweak + 8 , i );
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);

            /* Update the Auth value */
            xor_values(Auth, temp);
        }

    }/* if ass_data_len>0 */

    
    
    /* Message 
     * first pass
     */
    
    set_stage_in_tweak(tweak, MSB_M);
    i=0;
    while (16*(i+1) <= m_len) {
        set_block_number_in_tweak(tweak + 8, i);
	set_tweak_in_tweakey(tweakey, tweak);
	aesTweakEncrypt(TWEAKEY_STATE_SIZE, message + 16*i, tweakey, temp);
        xor_values(Auth, temp );
        i++;
	
    }
    


    /* Process incomplete block */
    if (m_len >  16*i) {
      
        /* Prepare the last padded block */
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*i, m_len-16*i);
        last_block[m_len-16*i]=0x80;

        set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO );
        set_block_number_in_tweak(tweak + 8 , i );
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);
	
        xor_values(Auth, temp );
    } 
    
    /* Last encryption */
    set_stage_in_tweak(tweak, MSB_M_LAST_ZERO );
    set_block_number_in_tweak(tweak + 8 , 0 );
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt(TWEAKEY_STATE_SIZE, Auth, tweakey, tag );
    
    
    /* Message 
     * second pass
     */
    memcpy(tweak, tag, 16 );
    tweak[0] = 0x80 ^ (tweak[0] & 0x7f);
    
    i = 0;
    hblock1 = get_block_number_from_tag( tag + 0 );
    hblock2 = get_block_number_from_tag( tag + 8 );
    while (16*(i+1) <= m_len) {
      
        set_block_number_in_tweak(tweak + 8, hblock2 );
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce , tweakey, ciphertext + 16*i );
        xor_values(ciphertext + 16*i, message + 16*i );
        i++;
        hblock2++;
        if( hblock2 == 0 ){
            hblock1 ++;
            set_block_number_in_tweak(tweak , hblock1 );
            tweak[0] = 0x80 ^ (tweak[0] & 0x7f);
        }
    }
    
    /* Impartial block */
    if (m_len >  16*i) {
        set_block_number_in_tweak(tweak + 8 , hblock2 );
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce , tweakey, temp );
        for( j = 0; j < m_len - 16 * i; j ++)
            ciphertext[ 16 * i + j ] = message[ 16 * i + j] ^ temp[j];

    } 
    
    
    /* Append the authentication tag to the ciphertext */
    memcpy( ciphertext + m_len, tag, 16 ); 

    /* The authentication tag is one block long, i.e. 16 bytes */
    *c_len=m_len+16;

}

/*
** Deoxys decryption function
*/
int deoxys_aead_decrypt(const uint8_t *ass_data, size_t ass_data_len,
                       uint8_t *message, size_t *m_len,
                       const uint8_t *key,
                       const uint8_t *nonce,
                       const uint8_t *ciphertext, size_t c_len)
{

    uint64_t i;
    uint64_t j;        
    uint64_t hblock1,hblock2;
    uint8_t tweak[16];
    uint8_t tweakey[TWEAKEY_STATE_SIZE/8];
    uint8_t Auth[16];
    uint8_t last_block[16];
    uint8_t Checksum[16];
    uint8_t Final[16];
    uint8_t zero_block[16];
    uint8_t Pad[16];
    uint8_t Tag[16], tag[16];
    uint8_t temp[16];
    
    /* Get the tag from the last 16 bytes of the ciphertext */
    memcpy(Tag, ciphertext+c_len-16, 16);
    
    /* Update c_len to the actual size of the ciphertext (i.e., without the tag) */
    c_len-=16;

    /* Fill the tweak with zeros (no nonce !!!) */
    memset(tweak, 0, sizeof(tweak));

    /* Fill the key(s) in the tweakey state */
    memcpy(tweakey, key, 16);

     /* Associated data */
    memset(Auth, 0, 16);
    
    /* The first two blocks with Nonce plaintext */
    set_block_number_in_tweak(tweak + 0 , 0 );
    set_block_number_in_tweak(tweak + 8 , 0 );
    set_stage_in_tweak(tweak, MSB_AD_N1);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce, tweakey, temp);
    xor_values(Auth, temp);

    set_stage_in_tweak(tweak, MSB_AD_N2);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce, tweakey, temp);
    xor_values(Auth, temp);

    if(ass_data_len) {

        set_stage_in_tweak(tweak, MSB_AD);
        i=0;
        while (16*(i+1) <= ass_data_len) {
            set_block_number_in_tweak(tweak + 8 , i );
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt(TWEAKEY_STATE_SIZE, ass_data+16*i, tweakey, temp);
            xor_values(Auth, temp);
            i++;
        }

        /* Last block if incomplete */
        if ( ass_data_len > 16*i ) {
	  
            memset(last_block, 0, 16);
            memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
            last_block[ass_data_len-16*i]=0x80;

            set_stage_in_tweak(tweak, MSB_AD_LAST);
            set_block_number_in_tweak(tweak + 8 , i );
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);

            xor_values(Auth, temp);
        }

    }/* if ass_data_len>0 */
    
    

    /* Get the message
     * (from the second pass) 
     */
    memcpy(tweak, Tag, 16 );
    tweak[0] = 0x80 ^ (tweak[0] & 0x7f);   
    
    i = 0;
    hblock1 = get_block_number_from_tag( Tag + 0 );
    hblock2 = get_block_number_from_tag( Tag + 8 );
    
    while (16*(i+1) <= c_len) {
        set_block_number_in_tweak(tweak + 8 , hblock2 );
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce , tweakey, message + 16*i );
	xor_values( message + 16*i  , ciphertext + 16*i);
        i++;
        hblock2++;
        if( hblock2 == 0 ){
            hblock1 ++;
            set_block_number_in_tweak(tweak , hblock1 );
            tweak[0] = 0x80 ^ (tweak[0] & 0x7f);
        }
    }
    

    
    /* Impartial block */
    if (c_len >  16*i) {
        set_block_number_in_tweak(tweak + 8 , hblock2 );
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce , tweakey, temp );
        for( j = 0; j < c_len - 16 * i; j ++)
            message[ 16 * i + j ] = ciphertext[ 16 * i + j] ^ temp[j];
    } 
    

    
    /* Message 
     * first pass
     */
    
    
    memset(tweak, 0, sizeof(tweak));
    set_stage_in_tweak(tweak, MSB_M);
    i=0;
    while (16*(i+1) <= c_len) {
        set_block_number_in_tweak(tweak + 8 , i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, message + 16*i, tweakey, temp);
        xor_values(Auth, temp );
        i++;
    }

    
    /* Process incomplete block */
    if (c_len >  16*i) {
      
        /* Prepare the last padded block */
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*i, c_len-16*i);
        last_block[c_len-16*i]=0x80;

        set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO );
        set_block_number_in_tweak(tweak + 8 , i );
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);
        xor_values(Auth, temp );
    } 
    
    /* Last encryption */
    set_stage_in_tweak(tweak, MSB_M_LAST_ZERO );
    set_block_number_in_tweak(tweak + 8 , 0 );
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
