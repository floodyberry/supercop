/*
 * Deoxys-II-256 Bit-Sliced C Implementation
 *
 * Copyright 2016:
 *     Jeremy Jean <JJean@ntu.edu.sg>
 *     Ivica Nikolic <inikolic@ntu.edu.sg>
 *     Haoyang Wang <wang1153@e.ntu.edu.sg>
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
#include <tmmintrin.h>
#include "deoxysii256.macros"
#include "tweakableBC.h"



/* Define the three MSB of the tweak (that depend on the stage) */
#define MSB_AD_N1		      (0x3<<4)
#define MSB_AD_N2		      (0x7<<4)
#define MSB_AD 			      (0x2<<4)
#define MSB_AD_LAST		      (0x6<<4)
#define MSB_M			      (0x0<<4)
#define MSB_M_LAST_ZERO		  (0x1<<4)
#define MSB_M_LAST_NONZERO	  (0x4<<4)
#define MSB_CHKSUM		      (0x5<<4)

/* Number of bits in the TWEAKEY state (256 or 384) */
#define TWEAKEY_STATE_SIZE    384

void DeoxysEncrypt_Auth(__m128i rk[17][8], const uint8_t* pt, __m128i* Auth);
void DeoxysEncrypt_XOR(__m128i rk[17][8], const uint8_t* nonce_plaintext, const uint8_t* pt, uint8_t ct[128]);
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
void deoxys_aead_encrypt_8(const uint8_t *ass_data, size_t ass_data_len,
                         const uint8_t *message, size_t m_len,
                         const uint8_t *key,
                         const uint8_t *nonce,
                         uint8_t *ciphertext, size_t *c_len)
{

    uint64_t i;
    uint64_t j,t;
    uint8_t tweak[16];
    uint8_t tweakey[TWEAKEY_STATE_SIZE/8];
    uint8_t Auth[16];
    uint8_t last_block[16];
    uint8_t temp[16];
    uint8_t tag[16];
    uint8_t nonce_plaintext[16];
    __m128i rk[17][8];
    __m128i subkey[17][8];
    __m128i Tweak, Tweak1, TEMP;
    __m128i Tweaks[17][8];
    __m128i AUTH;
    __m128i *AUTH_P;


    /* Fill the tweak with zeros */
    memset(tweak, 0, sizeof(tweak));

    /* Fill the key(s) in the tweakey state */
    memcpy(tweakey, key, 32);

    /* Pre-expansion of the subkeys in the subtweakeys for encryption */
    prepare_subkeys(tweakey, TWEAKEY_STATE_SIZE/128);

    /* Associated data */
    memset(Auth, 0, 16);
    AUTH=XOR(AUTH,AUTH);
    AUTH_P=&AUTH;

    /* Key Schedule */
    KEY_SCHEDULE(key, subkey);

     set_block_number_in_tweak(tweak + 0 , 0 );
     set_block_number_in_tweak(tweak + 8 , 0 );

    if(ass_data_len) {

        set_stage_in_tweak(tweak, MSB_AD);
        Tweak=LOAD(tweak);

        i=0;
        /* bitsliced implementation */
        if(128<=ass_data_len) {
            FIRST_ROUNDKEYS_ASS(subkey, rk);
            DeoxysEncrypt_Auth(rk, ass_data+0, AUTH_P);
            i=1;
        }


        while (128*(i+1) <= ass_data_len) {
            if(0==(i%32)) {
                ADD_TO_TWEAK(Tweak, CARRY);
                RENEW_TWEAKS(Tweaks, Tweak);
                ROUNDKEY(Tweaks, subkey, rk);
            } else {
                UPDATE_SUBKEYS(rk,i);
            }

            DeoxysEncrypt_Auth(rk, ass_data+128*i, AUTH_P);
            i++;
        }



        /* Table-based implementation */
        j=0;
        while (16*(j+1) <= (ass_data_len-128*i)) {

            /* Encrypt the current block */
            set_block_number_in_tweak(tweak + 8, j+8*i);
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt(TWEAKEY_STATE_SIZE, ass_data+(128*i+16*j), tweakey, temp);

            /* Update Auth value */
            AUTH=XOR(AUTH,LOAD(temp));

            /* Go on with the next block */
            j++;
        }


        /* Last block if incomplete */
        if (ass_data_len > 128*i+16*j) {

            /* Prepare the last padded block */
            memset(last_block, 0, 16);
            memcpy(last_block, ass_data+(128*i+16*j), ass_data_len-(128*i+16*j));
            last_block[ass_data_len-(128*i+16*j)]=0x80;

            /* Encrypt the last block */
            set_stage_in_tweak(tweak, MSB_AD_LAST);
            set_block_number_in_tweak(tweak + 8, j+8*i);
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);

            /* Update the Auth value */
            AUTH=XOR(AUTH,LOAD(temp));
        }
    }/* if ass_data_len>0 */



    /*
     * Message
     * first pass
     */
    memset(tweak, 0, sizeof(tweak));
    set_stage_in_tweak(tweak, MSB_M);
    Tweak=LOAD(tweak);

    i=0;
    /* bitsliced implementation */
    if(128<=m_len) {
        FIRST_ROUNDKEYS_M1(subkey, rk);
        DeoxysEncrypt_Auth(rk, message+0, AUTH_P);
        i=1;
    }

    while (128*(i+1) <= m_len) {
        if(0==(i%32)) {
            ADD_TO_TWEAK(Tweak, CARRY);
            RENEW_TWEAKS(Tweaks, Tweak);
            ROUNDKEY(Tweaks, subkey, rk);
        } else {
            UPDATE_SUBKEYS(rk,i);
        }
        DeoxysEncrypt_Auth(rk, message+128*i, AUTH_P);
        i++;
    }


    /* Table-based implementation */
    j=0;
    while (16*(j+1) <= (m_len-128*i)) {

        /* Encrypt the current block */
        set_block_number_in_tweak(tweak + 8, j+8*i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, message+(128*i+16*j), tweakey, temp);

        /* Update Auth value */
        AUTH=XOR(AUTH,LOAD(temp));

        /* Go on with the next block */
        j++;
    }



    /* Last block if incomplete */
    if (m_len > 128*i+16*j) {

        /* Prepare the last padded block */
        memset(last_block, 0, 16);
        memcpy(last_block, message+(128*i+16*j), m_len-(128*i+16*j));
        last_block[m_len-(128*i+16*j)]=0x80;

        /* Encrypt the last block */
        set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO);
        set_block_number_in_tweak(tweak + 8, j+8*i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);

        /* Update the Auth value */
        AUTH=XOR(AUTH,LOAD(temp));
    }
    STORE(Auth,AUTH);

    /* Last encryption */
    set_stage_in_tweak(tweak, MSB_M_LAST_ZERO );
    memcpy( tweak + 1, nonce, 15);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt(TWEAKEY_STATE_SIZE, Auth, tweakey, tag );




    /*
     * Message
     * second pass
     */

    memset( nonce_plaintext, 0, 1 );
    memcpy( nonce_plaintext + 1, nonce, 15 );

    memcpy(tweak, tag, 16 );
    tweak[0] = 0x80 ^ (tweak[0] & 0x7f);

    Tweak=LOAD(tweak);
    TEMP=XOR(TEMP,TEMP);
    Tweak1=Tweak;
    /* bitsliced implementation */
    i=0;
    if(128 <= m_len){
        RENEW_TWEAKS_XOR(Tweaks, Tweak);
        ROUNDKEY(Tweaks, subkey, rk);
        DeoxysEncrypt_XOR(rk, nonce_plaintext, message, ciphertext);
        i=1;
    }



    while(128*(i+1) <= m_len){
        if(0==(i%32)){
            XOR_TO_TWEAK(Tweak1, Tweak, TEMP);
            RENEW_TWEAKS_XOR(Tweaks, Tweak1);
            ROUNDKEY(Tweaks, subkey, rk);
        }else{
            UPDATE_SUBKEYS(rk,i);
        }

        DeoxysEncrypt_XOR(rk, nonce_plaintext, message+128*i, ciphertext+128*i);
        i++;
    }




   uint8_t temp_tweak[16];
   memcpy( temp_tweak, tweak, 16 );
   j = 0;
   while (16*(j+1) <= m_len-128*i) {
       temp_tweak[ 8] = tweak[ 8] ^ (((8*i+j)>>56) & 0xff );
       temp_tweak[ 9] = tweak[ 9] ^ (((8*i+j)>>48) & 0xff );
       temp_tweak[10] = tweak[10] ^ (((8*i+j)>>40) & 0xff );
       temp_tweak[11] = tweak[11] ^ (((8*i+j)>>32) & 0xff );
       temp_tweak[12] = tweak[12] ^ (((8*i+j)>>24) & 0xff );
       temp_tweak[13] = tweak[13] ^ (((8*i+j)>>16) & 0xff );
       temp_tweak[14] = tweak[14] ^ (((8*i+j)>> 8) & 0xff );
       temp_tweak[15] = tweak[15] ^ (((8*i+j)>> 0) & 0xff );
       set_tweak_in_tweakey(tweakey, temp_tweak);
       aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce_plaintext , tweakey, ciphertext + (128*i+16*j) );
       xor_values(ciphertext + (128*i+16*j), message + (128*i+16*j) );
       j++;
   }
   /* Impartial block */
   if (m_len >  128*i+16*j) {
       temp_tweak[ 8] = tweak[ 8] ^ (((8*i+j)>>56) & 0xff );
       temp_tweak[ 9] = tweak[ 9] ^ (((8*i+j)>>48) & 0xff );
       temp_tweak[10] = tweak[10] ^ (((8*i+j)>>40) & 0xff );
       temp_tweak[11] = tweak[11] ^ (((8*i+j)>>32) & 0xff );
       temp_tweak[12] = tweak[12] ^ (((8*i+j)>>24) & 0xff );
       temp_tweak[13] = tweak[13] ^ (((8*i+j)>>16) & 0xff );
       temp_tweak[14] = tweak[14] ^ (((8*i+j)>> 8) & 0xff );
       temp_tweak[15] = tweak[15] ^ (((8*i+j)>> 0) & 0xff );
       set_tweak_in_tweakey(tweakey, temp_tweak);
       aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce_plaintext , tweakey, temp );
       for( t = 0; t < m_len - (128*i+16*j); t ++)
           ciphertext[ 128*i+16*j + t ] = message[ 128*i+16*j + t] ^ temp[t];
   }


   /* Append the authentication tag to the ciphertext */
   memcpy( ciphertext + m_len, tag, 16 );

   /* The authentication tag is one block long, i.e. 16 bytes */
   *c_len=m_len+16;

}





/*
** Deoxys decryption function
*/
int deoxys_aead_decrypt_8(const uint8_t *ass_data, size_t ass_data_len,
                       uint8_t *message, size_t *m_len,
                       const uint8_t *key,
                       const uint8_t *nonce,
                       const uint8_t *ciphertext, size_t c_len)
{

    uint64_t i;
    uint64_t j,t;
    uint8_t tweak[16];
    uint8_t tweakey[TWEAKEY_STATE_SIZE/8];
    uint8_t Auth[16];
    uint8_t last_block[16];
    uint8_t Tag[16], tag[16];
    uint8_t temp[16];
    uint8_t nonce_plaintext[16];
    __m128i rk[17][8];
    __m128i subkey[17][8];
    __m128i Tweak, Tweak1, TEMP;
    __m128i Tweaks[17][8];
    __m128i AUTH;
    __m128i *AUTH_P;


    /* Get the tag from the last 16 bytes of the ciphertext */
    memcpy(Tag, ciphertext+c_len-16, 16);

    /* Update c_len to the actual size of the ciphertext (i.e., without the tag) */
    c_len-=16;

    /* Fill the tweak with zeros */
    memset(tweak, 0, sizeof(tweak));

    /* Fill the key(s) in the tweakey state */
    memcpy(tweakey, key, 32);

    /* Pre-expansion of the subkeys in the subtweakeys for encryption */
    prepare_subkeys(tweakey, TWEAKEY_STATE_SIZE/128);

    /* Associated data */
    AUTH=XOR(AUTH,AUTH);
    AUTH_P=&AUTH;
    memset(Auth, 0, 16);

    KEY_SCHEDULE(key, subkey);
    /* The first two blocks with Nonce plaintext */
    set_block_number_in_tweak(tweak + 0 , 0 );
    set_block_number_in_tweak(tweak + 8 , 0 );

    if(ass_data_len) {

        set_stage_in_tweak(tweak, MSB_AD);
        Tweak=LOAD(tweak);

        i=0;
        /* bitsliced implementation */
        if(128<=ass_data_len) {
            FIRST_ROUNDKEYS_ASS(subkey, rk);
            DeoxysEncrypt_Auth(rk, ass_data+0, AUTH_P);
            i=1;
        }

        while (128*(i+1) <= ass_data_len) {
            if(0==(i%32)) {
                ADD_TO_TWEAK(Tweak, CARRY);
                RENEW_TWEAKS(Tweaks, Tweak);
                ROUNDKEY(Tweaks, subkey, rk);
            } else {
                UPDATE_SUBKEYS(rk,i);
            }

            DeoxysEncrypt_Auth(rk, ass_data+128*i, AUTH_P);
            i++;
        }


        /* Table-based implementation */
        j=0;
        while (16*(j+1) <= (ass_data_len-128*i)) {

            /* Encrypt the current block */
            set_block_number_in_tweak(tweak + 8, j+8*i);
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt(TWEAKEY_STATE_SIZE, ass_data+(128*i+16*j), tweakey, temp);

            /* Update Auth value */
            AUTH=XOR(AUTH,LOAD(temp));

            /* Go on with the next block */
            j++;
        }


        /* Last block if incomplete */
        if (ass_data_len > 128*i+16*j) {

            /* Prepare the last padded block */
            memset(last_block, 0, 16);
            memcpy(last_block, ass_data+(128*i+16*j), ass_data_len-(128*i+16*j));
            last_block[ass_data_len-(128*i+16*j)]=0x80;

            /* Encrypt the last block */
            set_stage_in_tweak(tweak, MSB_AD_LAST);
            set_block_number_in_tweak(tweak + 8, j+8*i);
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);

            /* Update the Auth value */
            AUTH=XOR(AUTH,LOAD(temp));
        }

    }/* if ass_data_len>0 */




    /* Get the message
     * (from the second pass)
     */
    memset( nonce_plaintext, 0, 1 );
    memcpy( nonce_plaintext + 1, nonce, 15 );

    memcpy(tweak, Tag, 16 );
    tweak[0] = 0x80 ^ (tweak[0] & 0x7f);

    Tweak=LOAD(tweak);
    TEMP=XOR(TEMP,TEMP);
    Tweak1=Tweak;
    /* bitsliced implementation */
    i=0;
    if(128 <= c_len){
        RENEW_TWEAKS_XOR(Tweaks, Tweak);
        ROUNDKEY(Tweaks, subkey, rk);
        DeoxysEncrypt_XOR(rk, nonce_plaintext, ciphertext, message);
        i=1;
    }


    while(128*(i+1) <= c_len){
        if(0==(i%32)){
            XOR_TO_TWEAK(Tweak1, Tweak, TEMP);
            RENEW_TWEAKS_XOR(Tweaks, Tweak1);
            ROUNDKEY(Tweaks, subkey, rk);
        }else{
            UPDATE_SUBKEYS(rk,i);
        }

        DeoxysEncrypt_XOR(rk, nonce_plaintext, ciphertext+128*i, message+128*i);
        i++;
    }


   uint8_t temp_tweak[16];
   memcpy( temp_tweak, tweak, 16 );
   j = 0;
   while (16*(j+1) <= c_len-128*i) {
       temp_tweak[ 8] = tweak[ 8] ^ (((8*i+j)>>56) & 0xff );
       temp_tweak[ 9] = tweak[ 9] ^ (((8*i+j)>>48) & 0xff );
       temp_tweak[10] = tweak[10] ^ (((8*i+j)>>40) & 0xff );
       temp_tweak[11] = tweak[11] ^ (((8*i+j)>>32) & 0xff );
       temp_tweak[12] = tweak[12] ^ (((8*i+j)>>24) & 0xff );
       temp_tweak[13] = tweak[13] ^ (((8*i+j)>>16) & 0xff );
       temp_tweak[14] = tweak[14] ^ (((8*i+j)>> 8) & 0xff );
       temp_tweak[15] = tweak[15] ^ (((8*i+j)>> 0) & 0xff );
       set_tweak_in_tweakey(tweakey, temp_tweak);
       aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce_plaintext , tweakey, message + (128*i+16*j) );
       xor_values(message + (128*i+16*j), ciphertext + (128*i+16*j) );
       j++;
   }
   /* Impartial block */
   if (c_len >  128*i+16*j) {
       temp_tweak[ 8] = tweak[ 8] ^ (((8*i+j)>>56) & 0xff );
       temp_tweak[ 9] = tweak[ 9] ^ (((8*i+j)>>48) & 0xff );
       temp_tweak[10] = tweak[10] ^ (((8*i+j)>>40) & 0xff );
       temp_tweak[11] = tweak[11] ^ (((8*i+j)>>32) & 0xff );
       temp_tweak[12] = tweak[12] ^ (((8*i+j)>>24) & 0xff );
       temp_tweak[13] = tweak[13] ^ (((8*i+j)>>16) & 0xff );
       temp_tweak[14] = tweak[14] ^ (((8*i+j)>> 8) & 0xff );
       temp_tweak[15] = tweak[15] ^ (((8*i+j)>> 0) & 0xff );
       set_tweak_in_tweakey(tweakey, temp_tweak);
       aesTweakEncrypt(TWEAKEY_STATE_SIZE, nonce_plaintext , tweakey, temp );
       for( t = 0; t < c_len - (128*i+16*j); t ++)
           message[ 128*i+16*j + t ] = ciphertext[ 128*i+16*j + t] ^ temp[t];
   }





    /* Message
     * first pass
     */

    memset(tweak, 0, sizeof(tweak));
    set_stage_in_tweak(tweak, MSB_M);
    Tweak=LOAD(tweak);

    i=0;
    /* bitsliced implementation */
    if(128<=c_len) {
        FIRST_ROUNDKEYS_M1(subkey, rk);
        DeoxysEncrypt_Auth(rk, message+0, AUTH_P);
        i=1;
    }

    while (128*(i+1) <= c_len) {
        if(0==(i%32)) {
            ADD_TO_TWEAK(Tweak, CARRY);
            RENEW_TWEAKS(Tweaks, Tweak);
            ROUNDKEY(Tweaks, subkey, rk);
        } else {
            UPDATE_SUBKEYS(rk,i);
        }
        DeoxysEncrypt_Auth(rk, message+128*i, AUTH_P);
        i++;
    }


    /* Table-based implementation */
    j=0;
    while (16*(j+1) <= (c_len-128*i)) {

        /* Encrypt the current block */
        set_block_number_in_tweak(tweak + 8, j+8*i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, message+(128*i+16*j), tweakey, temp);

        /* Update Auth value */
        AUTH=XOR(AUTH,LOAD(temp));

        /* Go on with the next block */
        j++;
    }


    /* Last block if incomplete */
    if (c_len > 128*i+16*j) {

        /* Prepare the last padded block */
        memset(last_block, 0, 16);
        memcpy(last_block, message+(128*i+16*j), c_len-(128*i+16*j));
        last_block[c_len-(128*i+16*j)]=0x80;

        /* Encrypt the last block */
        set_stage_in_tweak(tweak, MSB_M_LAST_NONZERO);
        set_block_number_in_tweak(tweak + 8, j+8*i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt(TWEAKEY_STATE_SIZE, last_block, tweakey, temp);

        /* Update the Auth value */
        AUTH=XOR(AUTH,LOAD(temp));
    }
    STORE(Auth,AUTH);


    /* Last encryption */
    set_stage_in_tweak(tweak, MSB_M_LAST_ZERO );
    memcpy( tweak + 1, nonce, 15);
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
