/*
 * Deoxys-I-256 Optimized AES-NI C Implementation for small messages
 *
 * Copyright 2016:
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

#include <string.h>
#include <time.h>
#include <xmmintrin.h>              /* SSE instructions and _mm_malloc */
#include <emmintrin.h>              /* SSE2 instructions               */
#include <wmmintrin.h>              /* SSSE3 instructions              */
#include <tmmintrin.h>              /* SSSE3 instructions              */
#include "tweakable-cipher.macros"
#include "ae.macros"

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

int deoxys_aead_encrypt(const unsigned char *ass_data, 
                        unsigned long long int ass_data_len,
                        const unsigned char *message,
                        unsigned long long int m_len,
                        const unsigned char *key,
                        const unsigned char *nonce,
                        unsigned char *ciphertext,
                        unsigned long long int *c_len)
{

    unsigned long long i;
    unsigned char last_block[16];    
    const __m128i EIGHT         = constant8(0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,8);
    const __m128i ONE           = constant8(0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,1);
    const __m128i SEIGHT        = constant8(0,0,0,0,  0,0,0,0,  8,0,0,0,  0,0,0,0);
    const __m128i STAGE_MASK    = constant8(0x0f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff);
    const __m128i BLOCK_MASK    = constant8(0xff    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xf0,0x00,0x00,0x00, 0x00,0x00,0x00,0x00);
    const __m128i PERM_MASK     = constant8(0,1,2,3,4,5,6,7,  15,14,13,12,11,10,9,8);
    const __m128i H_PERMUTATION = constant8(7,0,13,10, 11,4,1,14, 15,8,5,2, 3,12,9,6);   	
    __m128i States[8];
    __m128i Tweaks[8];
    __m128i subkeys[17];
    __m128i State;
    __m128i tmp;
    __m128i tmp2;
    __m128i tmp3;
    __m128i tmp4;
    __m128i Tag;
    __m128i Tweak;
    __m128i tTweak;
    __m128i Auth;
    __m128i Checksum;
    __m128i mask_top_7_bits     = constant8_same(0xfe);
    __m128i mask_top_1_bit      = constant8_same(0x80);
    __m128i mask_bottom_1_bit   = constant8_same(0x01);
    __m128i mask_bottom_7_bits  = constant8_same(0x7f);
    static const unsigned char rcon[17] = {0x2f,0x5e,0xbc,0x63,0xc6,0x97,0x35,0x6a,0xd4,0xb3,0x7d,0xfa,0xef,0xc5,0x91,0x39,0x72};

    /* Set up the round keys (which include XOR of round constants) */
    TWEAKEY_SCHEDULE3(subkeys, key, tmp,tmp2,tmp3,tmp4);
   
    /*
     *
     *			 Associated data 
     *
     *
     */

    Auth = xor(Auth, Auth);
    Tweak = xor(Tweak, Tweak);

    if(ass_data_len) {

            SET_STAGE_IN_TWEAK(Tweak, constant8((0x2<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            i = 0;

            while (16*(i+8) <= ass_data_len)
            {
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);
                Tweaks[5] = add8(Tweaks[4], ONE);
                Tweaks[6] = add8(Tweaks[5], ONE);
                Tweaks[7] = add8(Tweaks[6], ONE);

                PROCESS_8_ASS_DATA_BLOCKS(States, ass_data + 16 * i, Auth);

                if(248 == (i % 256) ) { ADD_TO_TWEAK(Tweak, SEIGHT); }
                else                   { Tweak = add8(Tweak,  EIGHT); }

                i += 8;
            }

            if(16*(i+7) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);
                Tweaks[5] = add8(Tweaks[4], ONE);
                Tweaks[6] = add8(Tweaks[5], ONE);
                Tweaks[7] = add8(Tweaks[6], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80); ls(States[6], ass_data + 16 * i, 96);
                i += 7;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[7], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[7], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES8        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], xor(States[6], States[7]))))))));
            }
            else if(16*(i+7) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);
                Tweaks[5] = add8(Tweaks[4], ONE);
                Tweaks[6] = add8(Tweaks[5], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80); ls(States[6], ass_data + 16 * i, 96);
                AES7        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6])))))));
            }
            else if(16*(i+6) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);
                Tweaks[5] = add8(Tweaks[4], ONE);
                Tweaks[6] = add8(Tweaks[5], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80);
                i += 6;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[6], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[6], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES7        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6])))))));
            }
            else if(16*(i+6) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);
                Tweaks[5] = add8(Tweaks[4], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80);
                AES6        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5] ))))));
            }
            else if(16*(i+5) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);
                Tweaks[5] = add8(Tweaks[4], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64);
                i += 5;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[5], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[5], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES6        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5]))))));
            }

            else if(16*(i+5) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64);
                AES5        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))));
            }
            else if(16*(i+4) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                i += 4;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[4], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[4], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES5        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))));
            }
            else if(16*(i+4) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                AES4        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], States[3]))));
            }
            else if(16*(i+3) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32);
                i += 3;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[3], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[3], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES4        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], States[3]))));
            }
            else if(16*(i+3) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32);
                AES3        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], States[2])));
            }
            else if(16*(i+2) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16);
                i += 2;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[2], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[2], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES3        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], States[2])));
            }
            else if(16*(i+2) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16);
                AES2        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], States[1]));
            }
            else if(16*(i+1) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);

                ls(States[0], ass_data + 16 * i, 0);
                i += 1;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[1], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[1], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES2        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], States[1] ));
            }

            else if(16*(i+1) == ass_data_len ){
                State = load((__m128i *) (ass_data + 16 * i ));
                AES(State, subkeys, Tweak, tTweak);
                Auth = xor(Auth, State);
                i++;
            }
            else if(16*i < ass_data_len ){
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                SET_STAGE_IN_TWEAK(Tweak, constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                State = load((__m128i *) (last_block ));
                AES(State, subkeys, Tweak, tTweak);
                Auth = xor (Auth, State);
            }
    }
    
    
        
    
     /*
     *
     *
     * 			Message 
     *
     *
     */
    
    Tweak 	= constant8(	(nonce[0] >> 4) 		    ,
                                (nonce[0]&0xf) << 4 ^ (nonce[1] >> 4) ,
                                (nonce[1]&0xf) << 4 ^ (nonce[2] >> 4) ,
                                (nonce[2]&0xf) << 4 ^ (nonce[3] >> 4) ,
                                (nonce[3]&0xf) << 4 ^ (nonce[4] >> 4) ,
                                (nonce[4]&0xf) << 4 ^ (nonce[5] >> 4) ,
                                (nonce[5]&0xf) << 4 ^ (nonce[6] >> 4) ,
                                (nonce[6]&0xf) << 4 ^ (nonce[7] >> 4),  
                                (nonce[7]&0xf) << 4                  , 
                                0, 0, 0, 0, 0, 0, 0);
    
    Checksum = xor(Checksum, Checksum);

    // No need for  SET_STAGE_IN_TWEAK because the constant is zero
    i=0;

    // Absorb all 128-byte blocks (8 in parallel)
    while (16*(i+8) <= m_len) {

        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        Tweaks[5] = add8(Tweaks[4], ONE);
        Tweaks[6] = add8(Tweaks[5], ONE);
        Tweaks[7] = add8(Tweaks[6], ONE);

        PROCESS_8_MESSAGE_BLOCKS(States, message + 16 * i, ciphertext + 16 * i , Checksum);

        if(248 == (i % 256) ) { ADD_TO_TWEAK(Tweak, SEIGHT); }
        else                   { Tweak = add8(Tweak,  EIGHT); }

        i += 8;

    }

    if(16*(i+7) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        Tweaks[5] = add8(Tweaks[4], ONE);
        Tweaks[6] = add8(Tweaks[5], ONE);
        Tweaks[7] = add8(Tweaks[6], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        ls(States[4], message + 16 * i,64); ls(States[5], message + 16 * i, 80); ls(States[6], message + 16 * i, 96);
        States[7] = xor(States[7], States[7]);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+7), m_len-16*(i+7));
        last_block[m_len-16*(i+7)]=0x80;
        tmp = load((__m128i *) (last_block ));

        Checksum = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], xor(States[6], tmp))))))));
        SET_STAGE_IN_TWEAK(Tweaks[7], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES8        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);store(ciphertext+16*i+16,States[1]);store(ciphertext+16*i+32,States[2]);store(ciphertext+16*i+48,States[3]);
        store(ciphertext+16*i+64,States[4]);store(ciphertext+16*i+80,States[5]);store(ciphertext+16*i+96,States[6]);
        i += 7;
        tmp = xor(tmp, States[7]);


        store(ciphertext+16*i, tmp);
        SET_STAGE_IN_TWEAK(Tweak, constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        i++;
        SET_BLOCK_NO_IN_TWEAK(Tweak, i);
        AES(Checksum, subkeys, Tweak, tTweak);
        Tag = xor(Checksum, Auth);
    }
    else if(16*(i+7) == m_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        Tweaks[5] = add8(Tweaks[4], ONE);
        Tweaks[6] = add8(Tweaks[5], ONE);
        Tweaks[7] = add8(Tweaks[6], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        ls(States[4], message + 16 * i,64); ls(States[5], message + 16 * i, 80); ls(States[6], message + 16 * i, 96);
        States[7] = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6])))))));
        SET_STAGE_IN_TWEAK(Tweaks[7], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES8        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);store(ciphertext+16*i+16,States[1]);store(ciphertext+16*i+32,States[2]);store(ciphertext+16*i+48,States[3]);
        store(ciphertext+16*i+64,States[4]);store(ciphertext+16*i+80,States[5]);store(ciphertext+16*i+96,States[6]);
        Tag = xor(States[7], Auth);

    }
    else if(16*(i+6) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        Tweaks[5] = add8(Tweaks[4], ONE);
        Tweaks[6] = add8(Tweaks[5], ONE);
        Tweaks[7] = add8(Tweaks[6], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        ls(States[4], message + 16 * i,64); ls(States[5], message + 16 * i, 80);
        States[6] = xor(States[6], States[6]);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+6), m_len-16*(i+6));
        last_block[m_len-16*(i+6)]=0x80;
        tmp = load((__m128i *) (last_block ));
        SET_STAGE_IN_TWEAK(Tweaks[6], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        SET_STAGE_IN_TWEAK(Tweaks[7], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        States[7] = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], xor(States[6],tmp) )))))));
        AES8        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);store(ciphertext+16*i+16,States[1]);store(ciphertext+16*i+32,States[2]);store(ciphertext+16*i+48,States[3]);
        store(ciphertext+16*i+64,States[4]);store(ciphertext+16*i+80,States[5]);
        i += 6;
        tmp = xor(tmp, States[6]);
        store(ciphertext+16*i, tmp);
        Tag = xor(States[7], Auth);
    }
    else if(16*(i+6) == m_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        Tweaks[5] = add8(Tweaks[4], ONE);
        Tweaks[6] = add8(Tweaks[5], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        ls(States[4], message + 16 * i,64); ls(States[5], message + 16 * i, 80);
        States[6] = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5]))))));
        SET_STAGE_IN_TWEAK(Tweaks[6], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES7        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);store(ciphertext+16*i+16,States[1]);store(ciphertext+16*i+32,States[2]);store(ciphertext+16*i+48,States[3]);
        store(ciphertext+16*i+64,States[4]);store(ciphertext+16*i+80,States[5]);
        Tag = xor(States[6], Auth);

    }
    else if(16*(i+5) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        Tweaks[5] = add8(Tweaks[4], ONE);
        Tweaks[6] = add8(Tweaks[5], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        ls(States[4], message + 16 * i,64);
        States[5] = xor(States[5], States[5]);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+5), m_len-16*(i+5));
        last_block[m_len-16*(i+5)]=0x80;
        tmp = load((__m128i *) (last_block ));
        SET_STAGE_IN_TWEAK(Tweaks[5], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        SET_STAGE_IN_TWEAK(Tweaks[6], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        States[6] = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5],tmp )))))));
        AES7        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);store(ciphertext+16*i+16,States[1]);store(ciphertext+16*i+32,States[2]);store(ciphertext+16*i+48,States[3]);
        store(ciphertext+16*i+64,States[4]);
        i += 5;
        tmp = xor(tmp, States[5]);
        store(ciphertext+16*i, tmp);
        Tag = xor(States[6], Auth);
    }
    else if(16*(i+5) == m_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        Tweaks[5] = add8(Tweaks[4], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        ls(States[4], message + 16 * i,64);
        States[5] = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))));
        SET_STAGE_IN_TWEAK(Tweaks[5], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES6        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);store(ciphertext+16*i+16,States[1]);store(ciphertext+16*i+32,States[2]);store(ciphertext+16*i+48,States[3]);
        store(ciphertext+16*i+64,States[4]);
        Tag = xor(States[5], Auth);
    }
    else if(16*(i+4) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        Tweaks[5] = add8(Tweaks[4], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        States[4] = xor(States[5], States[5]);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+4), m_len-16*(i+4));
        last_block[m_len-16*(i+4)]=0x80;
        tmp = load((__m128i *) (last_block ));
        SET_STAGE_IN_TWEAK(Tweaks[4], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        SET_STAGE_IN_TWEAK(Tweaks[5], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        States[5] = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], tmp ))))));
        AES6        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);store(ciphertext+16*i+16,States[1]);store(ciphertext+16*i+32,States[2]);store(ciphertext+16*i+48,States[3]);
        i += 4;
        tmp = xor(tmp, States[4]);
        store(ciphertext+16*i, tmp);
        Tag = xor(States[5], Auth);
    }
    else if(16*(i+4) == m_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        States[4] = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], States[3]))));
        SET_STAGE_IN_TWEAK(Tweaks[4], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES5        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);store(ciphertext+16*i+16,States[1]);store(ciphertext+16*i+32,States[2]);store(ciphertext+16*i+48,States[3]);
        Tag = xor(States[4], Auth);
    }
    else if(16*(i+3) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32);
        States[3] = xor(States[3], States[3]);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+3), m_len-16*(i+3));
        last_block[m_len-16*(i+3)]=0x80;
        tmp = load((__m128i *) (last_block ));
        SET_STAGE_IN_TWEAK(Tweaks[3], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        SET_STAGE_IN_TWEAK(Tweaks[4], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        States[4] = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], tmp )))));
        AES5        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);store(ciphertext+16*i+16,States[1]);store(ciphertext+16*i+32,States[2]);
        i += 3;
        tmp = xor(tmp, States[3]);
        store(ciphertext+16*i, tmp);
        Tag = xor(States[4], Auth);
    }
    else if(16*(i+3) == m_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32);
        States[3] = xor (Checksum, xor(States[0], xor(States[1], States[2])));
        SET_STAGE_IN_TWEAK(Tweaks[3], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES4        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);store(ciphertext+16*i+16,States[1]);store(ciphertext+16*i+32,States[2]);
        Tag = xor(States[3], Auth);
    }
    else if(16*(i+2) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16);
        States[2] = xor(States[2], States[2]);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+2), m_len-16*(i+2));
        last_block[m_len-16*(i+2)]=0x80;
        tmp = load((__m128i *) (last_block ));
        SET_STAGE_IN_TWEAK(Tweaks[2], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        SET_STAGE_IN_TWEAK(Tweaks[3], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        States[3] = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], tmp ))));
        AES4        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);store(ciphertext+16*i+16,States[1]);
        i += 2;
        tmp = xor(tmp, States[2]);
        store(ciphertext+16*i, tmp);
        Tag = xor(States[3], Auth);
    }
    else if(16*(i+2) == m_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16);
        States[2] = xor (Checksum, xor(States[0], States[1]));
        SET_STAGE_IN_TWEAK(Tweaks[2], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES3        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);store(ciphertext+16*i+16,States[1]);
        Tag = xor(States[2], Auth);
    }

    else if(16*(i+1) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);

        ls(States[0], message + 16 * i, 0);
        States[1] = xor(States[1], States[1]);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+1), m_len-16*(i+1));
        last_block[m_len-16*(i+1)]=0x80;
        tmp = load((__m128i *) (last_block ));
        SET_STAGE_IN_TWEAK(Tweaks[1], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        SET_STAGE_IN_TWEAK(Tweaks[2], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        States[2] = xor (Checksum, xor(States[0], xor(States[1], tmp )));
        AES3        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);
        i += 1;
        tmp = xor(tmp, States[1]);
        store(ciphertext+16*i, tmp);
        Tag = xor(States[2], Auth);
    }
    else if(16*(i+1) == m_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);

        ls(States[0], message + 16 * i, 0);
        States[1] = xor (Checksum, States[0]);
        SET_STAGE_IN_TWEAK(Tweaks[1], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES2        (States, subkeys, Tweaks);
        store(ciphertext+16*i+ 0,States[0]);
        Tag = xor(States[1], Auth);
    }
    else if(16*i < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);

        States[0] = xor(States[0], States[0]);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+0), m_len-16*(i+0));
        last_block[m_len-16*(i+0)]=0x80;
        tmp = load((__m128i *) (last_block ));
        SET_STAGE_IN_TWEAK(Tweaks[0], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        SET_STAGE_IN_TWEAK(Tweaks[1], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        States[1] = xor (Checksum, xor(States[0], tmp ));
        AES2        (States, subkeys, Tweaks);
        tmp = xor(tmp, States[0]);
        store(ciphertext+16*i, tmp);
        Tag = xor(States[1], Auth);
    }
    else{
        SET_STAGE_IN_TWEAK(Tweak, constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        SET_BLOCK_NO_IN_TWEAK(Tweak, i);
        AES(Checksum, subkeys, Tweak, tTweak);
        Tag = xor(Checksum, Auth);
    }

    store(last_block, Tag);
    memcpy(ciphertext+m_len, last_block, 16);
        
    *c_len=m_len+16;
    
    return 0;

}


int deoxys_aead_decrypt(const unsigned char *ass_data, unsigned long long ass_data_len,
                        unsigned char *message, unsigned long long int *m_len,
                        const unsigned char *key, const unsigned char *nonce,
                        const unsigned char *c, unsigned long long c_len
                        )
{

    unsigned long long int i;
    unsigned char last_block[16];
    const __m128i EIGHT             = constant8(0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,8);
    const __m128i SEIGHT            = constant8(0,0,0,0,  0,0,0,0,  8,0,0,0,  0,0,0,0);
    const __m128i ONE               = constant8(0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,1);
    const __m128i STAGE_MASK        = constant8(0x0f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff);
    const __m128i BLOCK_MASK        = constant8(0xff    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xf0,0x00,0x00,0x00, 0x00,0x00,0x00,0x00);
    const __m128i PERM_MASK         = constant8(0,1,2,3,4,5,6,7,  15,14,13,12,11,10,9,8);
    const __m128i H_PERMUTATION  	= constant8(7,0,13,10, 11,4,1,14, 15,8,5,2, 3,12,9,6);
    const __m128i H_PERMUTATION_INV = constant8(1,6,11,12,5,10,15,0,9,14,3,4,13,2,7,8);
    __m128i States[8];
    __m128i Tweaks[8];
    __m128i subkeys[17];
    __m128i dsubkeys[17];
    __m128i State;
    __m128i tmp;
    __m128i tmp2;
    __m128i tmp3;
    __m128i tmp4;
    __m128i Tweak;
    __m128i tTweak;
    __m128i Auth;
    __m128i Checksum;
    __m128i mask_top_7_bits    = constant8_same(0xfe);
    __m128i mask_top_1_bit     = constant8_same(0x80);
    __m128i mask_bottom_1_bit  = constant8_same(0x01);
    __m128i mask_bottom_7_bits = constant8_same(0x7f);
    static const unsigned char rcon[17] = {0x2f,0x5e,0xbc,0x63,0xc6,0x97,0x35,0x6a,0xd4,0xb3,0x7d,0xfa,0xef,0xc5,0x91,0x39,0x72};


    // Set up the round constants and keys for AES
    TWEAKEY_SCHEDULE3(subkeys, key, tmp,tmp2,tmp3,tmp4);
    TWEAKEY_SCHEDULE3_INVERSE(subkeys, dsubkeys);



    /*
     *
     *			 Associated data
     *
     *
     */

    Auth = xor(Auth, Auth);
    Tweak = xor(Tweak, Tweak);

    if(ass_data_len) {

            SET_STAGE_IN_TWEAK(Tweak, constant8((0x2<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            i = 0;

            while (16*(i+8) <= ass_data_len)
            {
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);
                Tweaks[5] = add8(Tweaks[4], ONE);
                Tweaks[6] = add8(Tweaks[5], ONE);
                Tweaks[7] = add8(Tweaks[6], ONE);

                PROCESS_8_ASS_DATA_BLOCKS(States, ass_data + 16 * i, Auth);

                if(248 == (i % 256) ) { ADD_TO_TWEAK(Tweak, SEIGHT); }
                else                   { Tweak = add8(Tweak,  EIGHT); }

                i += 8;
            }

            if(16*(i+7) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);
                Tweaks[5] = add8(Tweaks[4], ONE);
                Tweaks[6] = add8(Tweaks[5], ONE);
                Tweaks[7] = add8(Tweaks[6], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80); ls(States[6], ass_data + 16 * i, 96);
                i += 7;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[7], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[7], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES8        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], xor(States[6], States[7]))))))));
            }
            else if(16*(i+7) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);
                Tweaks[5] = add8(Tweaks[4], ONE);
                Tweaks[6] = add8(Tweaks[5], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80); ls(States[6], ass_data + 16 * i, 96);
                AES7        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6])))))));
            }
            else if(16*(i+6) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);
                Tweaks[5] = add8(Tweaks[4], ONE);
                Tweaks[6] = add8(Tweaks[5], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80);
                i += 6;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[6], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[6], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES7        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6])))))));
            }
            else if(16*(i+6) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);
                Tweaks[5] = add8(Tweaks[4], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80);
                AES6        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5] ))))));
            }
            else if(16*(i+5) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);
                Tweaks[5] = add8(Tweaks[4], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64);
                i += 5;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[5], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[5], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES6        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5]))))));
            }

            else if(16*(i+5) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64);
                AES5        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))));
            }
            else if(16*(i+4) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);
                Tweaks[4] = add8(Tweaks[3], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                i += 4;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[4], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[4], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES5        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))));
            }
            else if(16*(i+4) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                AES4        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], States[3]))));
            }
            else if(16*(i+3) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);
                Tweaks[3] = add8(Tweaks[2], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32);
                i += 3;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[3], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[3], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES4        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], xor(States[2], States[3]))));
            }
            else if(16*(i+3) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32);
                AES3        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], States[2])));
            }
            else if(16*(i+2) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);
                Tweaks[2] = add8(Tweaks[1], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16);
                i += 2;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[2], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[2], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES3        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], xor(States[1], States[2])));
            }
            else if(16*(i+2) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16);
                AES2        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], States[1]));
            }
            else if(16*(i+1) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8(Tweaks[0], ONE);

                ls(States[0], ass_data + 16 * i, 0);
                i += 1;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[1], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[1], constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES2        (States, subkeys, Tweaks);
                Auth = xor (Auth, xor(States[0], States[1] ));
            }

            else if(16*(i+1) == ass_data_len ){
                State = load((__m128i *) (ass_data + 16 * i ));
                AES(State, subkeys, Tweak, tTweak);
                Auth = xor(Auth, State);
                i++;
            }
            else if(16*i < ass_data_len ){
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                SET_STAGE_IN_TWEAK(Tweak, constant8((0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                State = load((__m128i *) (last_block ));
                AES(State, subkeys, Tweak, tTweak);
                Auth = xor (Auth, State);
            }
    }


    /*
     *
     *
     * 			Message
     *
     *
     */
    Tweak 	= constant8(	(nonce[0] >> 4) 		    ,
                            (nonce[0]&0xf) << 4 ^ (nonce[1] >> 4) ,
                            (nonce[1]&0xf) << 4 ^ (nonce[2] >> 4) ,
                            (nonce[2]&0xf) << 4 ^ (nonce[3] >> 4) ,
                            (nonce[3]&0xf) << 4 ^ (nonce[4] >> 4) ,
                            (nonce[4]&0xf) << 4 ^ (nonce[5] >> 4) ,
                            (nonce[5]&0xf) << 4 ^ (nonce[6] >> 4) ,
                            (nonce[6]&0xf) << 4 ^ (nonce[7] >> 4) ,
                            (nonce[7]&0xf) << 4                   ,
                            0, 0, 0, 0, 0, 0, 0);

    Checksum = xor(Checksum, Checksum);

    if(c_len < 16 ) return -1;
    c_len -=16;
    *m_len=c_len;


    // No need to set stage or block no as they are zero
    i=0;

    // Absorb all 128-byte blocks (8 in parallel)
    while (16*(i+8) <= c_len) {

        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        Tweaks[5] = add8(Tweaks[4], ONE);
        Tweaks[6] = add8(Tweaks[5], ONE);
        Tweaks[7] = add8(Tweaks[6], ONE);

        PROCESS_8_CIPHERTEXT_BLOCKS(States, dsubkeys, Tweaks, c + 16 * i, message + 16 * i , Checksum);

        if(248 == (i % 256) ) { ADD_TO_TWEAK(Tweak, SEIGHT); }
        else                   { Tweak = add8(Tweak,  EIGHT); }

        i += 8;
    }

    if(16*(i+7) < c_len ){
            Tweaks[0] = Tweak;
            Tweaks[1] = add8(Tweaks[0], ONE);
            Tweaks[2] = add8(Tweaks[1], ONE);
            Tweaks[3] = add8(Tweaks[2], ONE);
            Tweaks[4] = add8(Tweaks[3], ONE);
            Tweaks[5] = add8(Tweaks[4], ONE);
            Tweaks[6] = add8(Tweaks[5], ONE);
            Tweaks[7] = add8(Tweaks[6], ONE);

            ls(States[0], c + 16 * i, 0); ls(States[1], c + 16 * i, 16); ls(States[2], c + 16 * i, 32); ls(States[3], c + 16 * i, 48);
            ls(States[4], c + 16 * i,64); ls(States[5], c + 16 * i, 80); ls(States[6], c + 16 * i, 96);
            States[7] = xor(States[7], States[7]);
            SET_STAGE_IN_TWEAK(Tweaks[7], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            AES8_DECP        (States, dsubkeys, subkeys, Tweaks);
            store(message+16*i+ 0,States[0]);store(message+16*i+16,States[1]);store(message+16*i+32,States[2]);store(message+16*i+48,States[3]);
            store(message+16*i+64,States[4]);store(message+16*i+80,States[5]);store(message+16*i+96,States[6]);

            ls(tmp, c+16*(i+7), 0);
            tmp = xor(tmp, States[7]);
            store(last_block, tmp);
            memset(last_block + c_len-16*(i+7), 0, 16 - (c_len-16*(i+7)));
            last_block[c_len-16*(i+7)]=0x80;
            ls(tmp, last_block, 0);
            memcpy(message + 16*(i+7), last_block, c_len - 16*(i+7));
            Checksum = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], xor(States[6], tmp))))))));
            i += 8;
            SET_STAGE_IN_TWEAK(Tweak, constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            SET_BLOCK_NO_IN_TWEAK(Tweak, i);
            AES(Checksum, subkeys, Tweak, tTweak);
            Checksum = xor(Checksum, Auth);
            store(last_block, Checksum);
            if(0 != memcmp_const(last_block, c+c_len, 16) )    return -1;
            return 0;
    }
    else if ( 16*(i+7) == c_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        Tweaks[5] = add8(Tweaks[4], ONE);
        Tweaks[6] = add8(Tweaks[5], ONE);
        Tweaks[7] = add8(Tweaks[6], ONE);
        SET_STAGE_IN_TWEAK(Tweaks[7], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));

        ls(States[0], c + 16 * i, 0); ls(States[1], c + 16 * i, 16); ls(States[2], c + 16 * i, 32); ls(States[3], c + 16 * i, 48);
        ls(States[4], c + 16 * i,64); ls(States[5], c + 16 * i, 80); ls(States[6], c + 16 * i, 96);
        memcpy(last_block, c + c_len, 16);
        ls(tmp, last_block, 0);
        States[7] = xor(Auth, tmp);
        AES8_DEC        (States, dsubkeys, Tweaks);
        store(message+16*i+ 0,States[0]);store(message+16*i+16,States[1]);store(message+16*i+32,States[2]);store(message+16*i+48,States[3]);
        store(message+16*i+64,States[4]);store(message+16*i+80,States[5]);store(message+16*i+96,States[6]);
        Checksum = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6])))))));
        Checksum = _mm_cmpeq_epi8(Checksum, States[7]);
        if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
        else return -1;
    }
    else if(16*(i+6) < c_len ){
            Tweaks[0] = Tweak;
            Tweaks[1] = add8(Tweaks[0], ONE);
            Tweaks[2] = add8(Tweaks[1], ONE);
            Tweaks[3] = add8(Tweaks[2], ONE);
            Tweaks[4] = add8(Tweaks[3], ONE);
            Tweaks[5] = add8(Tweaks[4], ONE);
            Tweaks[7] = add8(Tweaks[5], ONE);
            Tweaks[6] = add8(Tweaks[7], ONE);

            ls(States[0], c + 16 * i, 0); ls(States[1], c + 16 * i, 16); ls(States[2], c + 16 * i, 32); ls(States[3], c + 16 * i, 48);
            ls(States[4], c + 16 * i,64); ls(States[5], c + 16 * i, 80);
            memcpy(last_block, c + c_len, 16);
            ls(tmp, last_block, 0);
            States[6] = xor(Auth, tmp);
            States[7] = xor(States[7], States[7]);
            SET_STAGE_IN_TWEAK(Tweaks[6], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            SET_STAGE_IN_TWEAK(Tweaks[7], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            AES8_DECP        (States, dsubkeys, subkeys, Tweaks);
            store(message+16*i+ 0,States[0]);store(message+16*i+16,States[1]);store(message+16*i+32,States[2]);store(message+16*i+48,States[3]);
            store(message+16*i+64,States[4]);store(message+16*i+80,States[5]);

            ls(tmp, c+16*(i+6), 0);
            tmp = xor(tmp, States[7]);
            store(last_block, tmp);
            memset(last_block + c_len-16*(i+6), 0, 16 - (c_len-16*(i+6)));
            last_block[c_len-16*(i+6)]=0x80;
            ls(tmp, last_block, 0);
            memcpy(message + 16*(i+6), last_block, c_len - 16*(i+6));
            Checksum = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], tmp)))))));
            Checksum = _mm_cmpeq_epi8(Checksum, States[6]);
            if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
            else return -1;
    }
    else if ( 16*(i+6) == c_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        Tweaks[5] = add8(Tweaks[4], ONE);
        Tweaks[6] = add8(Tweaks[5], ONE);
        SET_STAGE_IN_TWEAK(Tweaks[6], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));

        ls(States[0], c + 16 * i, 0); ls(States[1], c + 16 * i, 16); ls(States[2], c + 16 * i, 32); ls(States[3], c + 16 * i, 48);
        ls(States[4], c + 16 * i,64); ls(States[5], c + 16 * i, 80);
        memcpy(last_block, c + c_len, 16);
        ls(tmp, last_block, 0);
        States[6] = xor(Auth, tmp);
        AES7_DEC        (States, dsubkeys, Tweaks);
        store(message+16*i+ 0,States[0]);store(message+16*i+16,States[1]);store(message+16*i+32,States[2]);store(message+16*i+48,States[3]);
        store(message+16*i+64,States[4]);store(message+16*i+80,States[5]);
        Checksum = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5]))))));
        Checksum = _mm_cmpeq_epi8(Checksum, States[6]);
        if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
        else return -1;
    }
    else if(16*(i+5) < c_len ){
            Tweaks[0] = Tweak;
            Tweaks[1] = add8(Tweaks[0], ONE);
            Tweaks[2] = add8(Tweaks[1], ONE);
            Tweaks[3] = add8(Tweaks[2], ONE);
            Tweaks[4] = add8(Tweaks[3], ONE);
            Tweaks[6] = add8(Tweaks[4], ONE);
            Tweaks[5] = add8(Tweaks[6], ONE);

            ls(States[0], c + 16 * i, 0); ls(States[1], c + 16 * i, 16); ls(States[2], c + 16 * i, 32); ls(States[3], c + 16 * i, 48);
            ls(States[4], c + 16 * i,64);
            memcpy(last_block, c + c_len, 16);
            ls(tmp, last_block, 0);
            States[5] = xor(Auth, tmp);
            States[6] = xor(States[6], States[6]);
            SET_STAGE_IN_TWEAK(Tweaks[5], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            SET_STAGE_IN_TWEAK(Tweaks[6], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            AES7_DECP        (States, dsubkeys, subkeys, Tweaks);
            store(message+16*i+ 0,States[0]);store(message+16*i+16,States[1]);store(message+16*i+32,States[2]);store(message+16*i+48,States[3]);
            store(message+16*i+64,States[4]);

            ls(tmp, c+16*(i+5), 0);
            tmp = xor(tmp, States[6]);
            store(last_block, tmp);
            memset(last_block + c_len-16*(i+5), 0, 16 - (c_len-16*(i+5)));
            last_block[c_len-16*(i+5)]=0x80;
            ls(tmp, last_block, 0);
            memcpy(message + 16*(i+5), last_block, c_len - 16*(i+5));
            Checksum = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], tmp))))));
            Checksum = _mm_cmpeq_epi8(Checksum, States[5]);
            if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
            else return -1;
    }
    else if ( 16*(i+5) == c_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        Tweaks[5] = add8(Tweaks[4], ONE);
        SET_STAGE_IN_TWEAK(Tweaks[5], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));

        ls(States[0], c + 16 * i, 0); ls(States[1], c + 16 * i, 16); ls(States[2], c + 16 * i, 32); ls(States[3], c + 16 * i, 48);
        ls(States[4], c + 16 * i,64);
        memcpy(last_block, c + c_len, 16);
        ls(tmp, last_block, 0);
        States[5] = xor(Auth, tmp);
        AES6_DEC        (States, dsubkeys, Tweaks);
        store(message+16*i+ 0,States[0]);store(message+16*i+16,States[1]);store(message+16*i+32,States[2]);store(message+16*i+48,States[3]);
        store(message+16*i+64,States[4]);
        Checksum = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4] )))));
        Checksum = _mm_cmpeq_epi8(Checksum, States[5]);
        if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
        else return -1;
    }
    else if(16*(i+4) < c_len ){
            Tweaks[0] = Tweak;
            Tweaks[1] = add8(Tweaks[0], ONE);
            Tweaks[2] = add8(Tweaks[1], ONE);
            Tweaks[3] = add8(Tweaks[2], ONE);
            Tweaks[5] = add8(Tweaks[3], ONE);
            Tweaks[4] = add8(Tweaks[5], ONE);

            ls(States[0], c + 16 * i, 0); ls(States[1], c + 16 * i, 16); ls(States[2], c + 16 * i, 32); ls(States[3], c + 16 * i, 48);
            memcpy(last_block, c + c_len, 16);
            ls(tmp, last_block, 0);
            States[4] = xor(Auth, tmp);
            States[5] = xor(States[5], States[5]);
            SET_STAGE_IN_TWEAK(Tweaks[4], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            SET_STAGE_IN_TWEAK(Tweaks[5], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            AES6_DECP        (States, dsubkeys, subkeys, Tweaks);
            store(message+16*i+ 0,States[0]);store(message+16*i+16,States[1]);store(message+16*i+32,States[2]);store(message+16*i+48,States[3]);

            ls(tmp, c+16*(i+4), 0);
            tmp = xor(tmp, States[5]);
            store(last_block, tmp);
            memset(last_block + c_len-16*(i+4), 0, 16 - (c_len-16*(i+4)));
            last_block[c_len-16*(i+4)]=0x80;
            ls(tmp, last_block, 0);
            memcpy(message + 16*(i+4), last_block, c_len - 16*(i+4));
            Checksum = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], xor(States[3], tmp)))));
            Checksum = _mm_cmpeq_epi8(Checksum, States[4]);
            if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
            else return -1;
    }
    else if ( 16*(i+4) == c_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        Tweaks[4] = add8(Tweaks[3], ONE);
        SET_STAGE_IN_TWEAK(Tweaks[4], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));

        ls(States[0], c + 16 * i, 0); ls(States[1], c + 16 * i, 16); ls(States[2], c + 16 * i, 32); ls(States[3], c + 16 * i, 48);
        memcpy(last_block, c + c_len, 16);
        ls(tmp, last_block, 0);
        States[4] = xor(Auth, tmp);
        AES5_DEC        (States, dsubkeys, Tweaks);
        store(message+16*i+ 0,States[0]);store(message+16*i+16,States[1]);store(message+16*i+32,States[2]);store(message+16*i+48,States[3]);
        Checksum = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], States[3] ))));
        Checksum = _mm_cmpeq_epi8(Checksum, States[4]);
        if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
        else return -1;
    }
    else if(16*(i+3) < c_len ){
            Tweaks[0] = Tweak;
            Tweaks[1] = add8(Tweaks[0], ONE);
            Tweaks[2] = add8(Tweaks[1], ONE);
            Tweaks[4] = add8(Tweaks[2], ONE);
            Tweaks[3] = add8(Tweaks[4], ONE);

            ls(States[0], c + 16 * i, 0); ls(States[1], c + 16 * i, 16); ls(States[2], c + 16 * i, 32);
            memcpy(last_block, c + c_len, 16);
            ls(tmp, last_block, 0);
            States[3] = xor(Auth, tmp);
            States[4] = xor(States[4], States[4]);
            SET_STAGE_IN_TWEAK(Tweaks[3], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            SET_STAGE_IN_TWEAK(Tweaks[4], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            AES5_DECP        (States, dsubkeys, subkeys, Tweaks);
            store(message+16*i+ 0,States[0]);store(message+16*i+16,States[1]);store(message+16*i+32,States[2]);

            ls(tmp, c+16*(i+3), 0);
            tmp = xor(tmp, States[4]);
            store(last_block, tmp);
            memset(last_block + c_len-16*(i+3), 0, 16 - (c_len-16*(i+3)));
            last_block[c_len-16*(i+3)]=0x80;
            ls(tmp, last_block, 0);
            memcpy(message + 16*(i+3), last_block, c_len - 16*(i+3));
            Checksum = xor (Checksum, xor(States[0], xor(States[1], xor(States[2], tmp))));
            Checksum = _mm_cmpeq_epi8(Checksum, States[3]);
            if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
            else return -1;
    }
    else if ( 16*(i+3) == c_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        Tweaks[3] = add8(Tweaks[2], ONE);
        SET_STAGE_IN_TWEAK(Tweaks[3], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        ls(States[0], c + 16 * i, 0); ls(States[1], c + 16 * i, 16); ls(States[2], c + 16 * i, 32);
        memcpy(last_block, c + c_len, 16);
        ls(tmp, last_block, 0);
        States[3] = xor(Auth, tmp);
        AES4_DEC        (States, dsubkeys, Tweaks);
        store(message+16*i+ 0,States[0]);store(message+16*i+16,States[1]);store(message+16*i+32,States[2]);
        Checksum = xor (Checksum, xor(States[0], xor(States[1], States[2])));
        Checksum = _mm_cmpeq_epi8(Checksum, States[3]);
        if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
        else return -1;
    }
    else if(16*(i+2) < c_len ){
            Tweaks[0] = Tweak;
            Tweaks[1] = add8(Tweaks[0], ONE);
            Tweaks[3] = add8(Tweaks[1], ONE);
            Tweaks[2] = add8(Tweaks[3], ONE);

            ls(States[0], c + 16 * i, 0); ls(States[1], c + 16 * i, 16);
            memcpy(last_block, c + c_len, 16);
            ls(tmp, last_block, 0);
            States[2] = xor(Auth, tmp);
            States[3] = xor(States[3], States[3]);
            SET_STAGE_IN_TWEAK(Tweaks[2], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            SET_STAGE_IN_TWEAK(Tweaks[3], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            AES4_DECP        (States, dsubkeys, subkeys, Tweaks);
            store(message+16*i+ 0,States[0]);store(message+16*i+16,States[1]);

            ls(tmp, c+16*(i+2), 0);
            tmp = xor(tmp, States[3]);
            store(last_block, tmp);
            memset(last_block + c_len-16*(i+2), 0, 16 - (c_len-16*(i+2)));
            last_block[c_len-16*(i+2)]=0x80;
            ls(tmp, last_block, 0);
            memcpy(message + 16*(i+2), last_block, c_len - 16*(i+2));
            Checksum = xor (Checksum, xor(States[0], xor(States[1], tmp)));
            Checksum = _mm_cmpeq_epi8(Checksum, States[2]);
            if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
            else return -1;
    }
    else if ( 16*(i+2) == c_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        Tweaks[2] = add8(Tweaks[1], ONE);
        SET_STAGE_IN_TWEAK(Tweaks[2], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        ls(States[0], c + 16 * i, 0); ls(States[1], c + 16 * i, 16);
        memcpy(last_block, c + c_len, 16);
        ls(tmp, last_block, 0);
        States[2] = xor(Auth, tmp);
        AES3_DEC        (States, dsubkeys, Tweaks);
        store(message+16*i+ 0,States[0]);store(message+16*i+16,States[1]);
        Checksum = xor (Checksum, xor(States[0], States[1]));
        Checksum = _mm_cmpeq_epi8(Checksum, States[2]);
        if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
        else return -1;
    }
    else if(16*(i+1) < c_len ){
            Tweaks[0] = Tweak;
            Tweaks[2] = add8(Tweaks[0], ONE);
            Tweaks[1] = add8(Tweaks[2], ONE);

            ls(States[0], c + 16 * i, 0);
            memcpy(last_block, c + c_len, 16);
            ls(tmp, last_block, 0);
            States[1] = xor(Auth, tmp);
            States[2] = xor(States[2], States[2]);
            SET_STAGE_IN_TWEAK(Tweaks[1], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            SET_STAGE_IN_TWEAK(Tweaks[2], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            AES3_DECP        (States, dsubkeys, subkeys, Tweaks);
            store(message+16*i+ 0,States[0]);
            ls(tmp, c+16*(i+1), 0);
            tmp = xor(tmp, States[2]);
            store(last_block, tmp);
            memset(last_block + c_len-16*(i+1), 0, 16 - (c_len-16*(i+1)));
            last_block[c_len-16*(i+1)]=0x80;
            ls(tmp, last_block, 0);
            memcpy(message + 16*(i+1), last_block, c_len - 16*(i+1));
            Checksum = xor (Checksum, xor(States[0], tmp));
            Checksum = _mm_cmpeq_epi8(Checksum, States[1]);
            if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
            else return -1;
    }
    else if ( 16*(i+1) == c_len  )
    {
        Tweaks[0] = Tweak;
        Tweaks[1] = add8(Tweaks[0], ONE);
        SET_STAGE_IN_TWEAK(Tweaks[1], constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        ls(States[0], c + 16 * i, 0);
        memcpy(last_block, c + c_len, 16);
        ls(tmp, last_block, 0);
        States[1] = xor(Auth, tmp);
        AES2_DEC        (States, dsubkeys, Tweaks);
        store(message+16*i+ 0,States[0]);
        Checksum = xor (Checksum, States[0]);
        Checksum = _mm_cmpeq_epi8(Checksum, States[1]);
        if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
        else return -1;
    }
    else if(16*(i+0) < c_len ){

            Tweaks[1] = Tweak;
            Tweaks[0] = add8(Tweaks[1], ONE);

            memcpy(last_block, c + c_len, 16);
            ls(tmp, last_block, 0);
            States[0] = xor(Auth, tmp);
            States[1] = xor(States[1], States[1]);
            SET_STAGE_IN_TWEAK(Tweaks[0], constant8((0x5<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            SET_STAGE_IN_TWEAK(Tweaks[1], constant8((0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            AES2_DECP        (States, dsubkeys, subkeys, Tweaks);
            ls(tmp, c+16*(i+0), 0);
            tmp = xor(tmp, States[1]);
            store(last_block, tmp);
            memset(last_block + c_len-16*(i+0), 0, 16 - (c_len-16*(i+0)));
            last_block[c_len-16*(i+0)]=0x80;
            ls(tmp, last_block, 0);
            memcpy(message + 16*(i+0), last_block, c_len - 16*(i+0));
            Checksum = xor (Checksum, tmp);
            Checksum = _mm_cmpeq_epi8(Checksum, States[0]);
            if(_mm_movemask_epi8(Checksum)==0xffff) return 0;
            else return -1;
    }
    else{
        SET_STAGE_IN_TWEAK(Tweak, constant8((0x1<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));    
        SET_BLOCK_NO_IN_TWEAK(Tweak, i);
        AES(Checksum, subkeys, Tweak, tTweak);
        Checksum = xor(Checksum, Auth);
        store(last_block, Checksum);
        if(0 != memcmp_const(last_block, c+c_len, 16) )    return -1;
        return 0;
    }
}
