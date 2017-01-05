/*
 * Deoxys-II-256 Optimized AES-NI C Implementation for small messages
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

int deoxys_aead_encrypt(const unsigned char *ass_data, unsigned long long int ass_data_len, const unsigned char *message, unsigned long long int m_len, const unsigned char *key, const unsigned char *nonce, unsigned char *ciphertext, unsigned long long int *c_len)
{

    unsigned long long i,j;
    unsigned char last_block[16];
    const __m128i EIGHT			= constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,8);
    const __m128i ONE           = constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,1 );
    const __m128i SEIGHT		= constant8( 0,0,0,0,  0,0,0,0,  8,0,0,0,  0,0,0,0);
    const __m128i STAGE_MASK   	= constant8( 0x0f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff );
    const __m128i PERM_MASK		= constant8( 0,1,2,3,4,5,6,7,  15,14,13,12,11,10,9,8 );
    const __m128i H_PERMUTATION = constant8( 7,0,13,10, 11,4,1,14, 15,8,5,2, 3,12,9,6 );
    __m128i subkeys[17];
    __m128i States[8];
    __m128i Tweaks[8];
    __m128i State;
    __m128i tmp,tmp2;
    __m128i tmp3;
    __m128i tmp4;
    __m128i Tweak;
    __m128i tTweak;
    __m128i Auth;
    __m128i nonce_plaintext;
    __m128i mask_top_7_bits    = constant8_same(0xfe);
    __m128i mask_top_1_bit     = constant8_same(0x80);
    __m128i mask_bottom_1_bit  = constant8_same(0x01);
    __m128i mask_bottom_7_bits = constant8_same(0x7f);
    static const unsigned char rcon[17] = {0x2f,0x5e,0xbc,0x63,0xc6,0x97,0x35,0x6a,0xd4,0xb3,0x7d,0xfa,0xef,0xc5,0x91,0x39,0x72};



    // Set up the round keys (which include XOR of round constants)
    TWEAKEY_SCHEDULE3( subkeys, key, tmp,tmp2,tmp3,tmp4 );

    
    /*
     *
     *			 Associated data 
     *
     *
     */

    Auth = xor(Auth, Auth);
    Tweak = xor( Tweak, Tweak );

    if(ass_data_len) {

            SET_STAGE_IN_TWEAK(Tweak, constant8( (0x2<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            i = 0;

            while (16*(i+8) <= ass_data_len)
            {
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);
                Tweaks[5] = add8( Tweaks[4], ONE);
                Tweaks[6] = add8( Tweaks[5], ONE);
                Tweaks[7] = add8( Tweaks[6], ONE);

                PROCESS_8_ASS_DATA_BLOCKS( States, ass_data + 16 * i , Auth );

                if(248 == ( i % 256) ) { ADD_TO_TWEAK( Tweak, SEIGHT ); }
                else                   { Tweak = add8( Tweak,  EIGHT ); }

                i += 8;
            }

            if( 16*(i+7) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);
                Tweaks[5] = add8( Tweaks[4], ONE);
                Tweaks[6] = add8( Tweaks[5], ONE);
                Tweaks[7] = add8( Tweaks[6], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80); ls(States[6], ass_data + 16 * i, 96);
                i += 7;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[7], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[7], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES8        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], xor(States[6], States[7]))))))) );
            }
            else if(16*(i+7) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);
                Tweaks[5] = add8( Tweaks[4], ONE);
                Tweaks[6] = add8( Tweaks[5], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80); ls(States[6], ass_data + 16 * i, 96);
                AES7        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6])))))) );
            }
            else if( 16*(i+6) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);
                Tweaks[5] = add8( Tweaks[4], ONE);
                Tweaks[6] = add8( Tweaks[5], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80);
                i += 6;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[6], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[6], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES7        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6])))))) );
            }
            else if(16*(i+6) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);
                Tweaks[5] = add8( Tweaks[4], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80);
                AES6        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5] ))))) );
            }
            else if( 16*(i+5) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);
                Tweaks[5] = add8( Tweaks[4], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64);
                i += 5;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[5], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[5], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES6        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5]))))) );
            }

            else if(16*(i+5) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64);
                AES5        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))) );
            }
            else if( 16*(i+4) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                i += 4;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[4], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[4], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES5        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))) );
            }
            else if(16*(i+4) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                AES4        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], States[3]))) );
            }
            else if( 16*(i+3) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32);
                i += 3;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[3], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[3], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES4        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], States[3]))) );
            }
            else if(16*(i+3) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32);
                AES3        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], States[2])) );
            }
            else if( 16*(i+2) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16);
                i += 2;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[2], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[2], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES3        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], States[2])) );
            }
            else if(16*(i+2) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16);
                AES2        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], States[1]) );
            }
            else if( 16*(i+1) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);

                ls(States[0], ass_data + 16 * i, 0);
                i += 1;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[1], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[1], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES2        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], States[1] ) );
            }

            else if(16*(i+1) == ass_data_len ){
                State = load( (__m128i *) ( ass_data + 16 * i ) );
                AES( State, subkeys, Tweak, tTweak );
                Auth = xor( Auth , State );
                i++;
            }
            else if(16*i < ass_data_len ){
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                SET_STAGE_IN_TWEAK(Tweak, constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                State = load( (__m128i *) ( last_block ) );
                AES( State, subkeys, Tweak, tTweak );
                Auth = xor ( Auth, State );
            }
    }
    
    
        
    
     /*
     *
     *
     * 			Message  - first pass
     *
     *
     */
    
    Tweak 	= xor (Tweak,Tweak);
    

    // No need for  SET_STAGE_IN_TWEAK because the constant is zero
    i=0;

    // Absorb all 128-byte blocks (8 in parallel)
    while (16*(i+8) <= m_len) {

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);
        Tweaks[6] = add8( Tweaks[5], ONE);
        Tweaks[7] = add8( Tweaks[6], ONE);

        LOAD_8_STATES ( States , message + 16 * i);
        AES8        ( States, subkeys, tTweak );
        Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], xor(States[6], States[7]))))))) );

        if(248 == ( i % 256) ) { ADD_TO_TWEAK( Tweak, SEIGHT ); }
        else                   { Tweak = add8( Tweak,  EIGHT ); }

        i += 8;

    }


    if( 16*(i+7) < m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);
        Tweaks[6] = add8( Tweaks[5], ONE);
        Tweaks[7] = add8( Tweaks[6], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        ls(States[4], message + 16 * i,64); ls(States[5], message + 16 * i, 80); ls(States[6], message + 16 * i, 96);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+7), m_len-16*(i+7));
        last_block[m_len-16*(i+7)]=0x80;
        States[7] = load( (__m128i *) ( last_block ) );
        SET_STAGE_IN_TWEAK(Tweaks[7], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES8        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], xor(States[6], States[7]))))))) );

    }
    else if( 16*(i+7) == m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);
        Tweaks[6] = add8( Tweaks[5], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        ls(States[4], message + 16 * i,64); ls(States[5], message + 16 * i, 80); ls(States[6], message + 16 * i, 96);
        AES7        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6] )))))) );

    }
    else if( 16*(i+6) < m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);
        Tweaks[6] = add8( Tweaks[5], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        ls(States[4], message + 16 * i,64); ls(States[5], message + 16 * i, 80);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+6), m_len-16*(i+6));
        last_block[m_len-16*(i+6)]=0x80;
        States[6] = load( (__m128i *) ( last_block ) );
        SET_STAGE_IN_TWEAK(Tweaks[6], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES7        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6])))))) );

    }
    else if( 16*(i+6) == m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        ls(States[4], message + 16 * i,64); ls(States[5], message + 16 * i, 80);
        AES6        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5]))))) );

    }

    else if( 16*(i+5) < m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        ls(States[4], message + 16 * i,64);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+5), m_len-16*(i+5));
        last_block[m_len-16*(i+5)]=0x80;
        States[5] = load( (__m128i *) ( last_block ) );
        SET_STAGE_IN_TWEAK(Tweaks[5], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES6        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5]))))) );

    }
    else if( 16*(i+5) == m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        ls(States[4], message + 16 * i,64);
        AES5        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))) );

    }
    else if( 16*(i+4) < m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+4), m_len-16*(i+4));
        last_block[m_len-16*(i+4)]=0x80;
        States[4] = load( (__m128i *) ( last_block ) );
        SET_STAGE_IN_TWEAK(Tweaks[4], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES5        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))) );

    }
    else if( 16*(i+4) == m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
        AES4        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], States[3]))) );

    }
    else if( 16*(i+3) < m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+3), m_len-16*(i+3));
        last_block[m_len-16*(i+3)]=0x80;
        States[3] = load( (__m128i *) ( last_block ) );
        SET_STAGE_IN_TWEAK(Tweaks[3], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES4        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], States[3]))) );

    }
    else if( 16*(i+3) == m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32);
        AES3        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], xor(States[1], States[2])) );

    }
    else if( 16*(i+2) < m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+2), m_len-16*(i+2));
        last_block[m_len-16*(i+2)]=0x80;
        States[2] = load( (__m128i *) ( last_block ) );
        SET_STAGE_IN_TWEAK(Tweaks[2], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES3        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], xor(States[1], States[2])) );

    }
    else if( 16*(i+2) == m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);

        ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16);
        AES2        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], States[1]) );

    }
    else if( 16*(i+1) < m_len ){

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);

        ls(States[0], message + 16 * i, 0);
        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+1), m_len-16*(i+1));
        last_block[m_len-16*(i+1)]=0x80;
        States[1] = load( (__m128i *) ( last_block ) );
        SET_STAGE_IN_TWEAK(Tweaks[1], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES2        ( States, subkeys, Tweaks );
        Auth = xor ( Auth, xor(States[0], States[1]) );

    }
    else if( 16*(i+1) == m_len ){

        ls(State, message + 16 * i, 0);
        AES        ( State, subkeys, Tweak, tTweak );
        Auth = xor ( Auth, State );

    }
    else if( 16*(i+0) < m_len ){

        memset(last_block, 0, 16);
        memcpy(last_block, message+16*(i+0), m_len-16*(i+0));
        last_block[m_len-16*(i+0)]=0x80;
        State = load( (__m128i *) ( last_block ) );
        SET_STAGE_IN_TWEAK(Tweak, constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
        AES        ( State, subkeys, Tweak, tTweak );
        Auth = xor ( Auth, State );

    }



    last_block[0] = 1<<4;
    memcpy(last_block+1,nonce,15);
    Tweak = load( (__m128i *) ( last_block ) );
    AES( Auth, subkeys, Tweak, tTweak );
    store( last_block , Auth );
    memcpy( ciphertext+m_len , last_block , 16 );
    *c_len=m_len+16;





    /*
    *
    *
    * 			Message  - second pass
    *
    *
    */

    // Compute subtweaks for 1||tag and add them to the subkeys
    Tweak = xor ( and (Auth, constant32(0xffffff7f,0xffffffff,0xffffffff,0xffffffff) ), constant32(0x00000080,0,0,0) );
    for( i=0; i< 17; i++){
        subkeys[i] = xor( subkeys[i], Tweak);
        Tweak = permute( Tweak , H_PERMUTATION);
    }

    last_block[0] = 0;
    memcpy( last_block + 1, nonce, 15 );
    nonce_plaintext = load( (__m128i *) ( last_block ) );



    i=0;
    Tweak = xor( Tweak, Tweak);
    while (16*(i+8) <= m_len) {

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);
        Tweaks[6] = add8( Tweaks[5], ONE);
        Tweaks[7] = add8( Tweaks[6], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext; States[5] = nonce_plaintext; States[6] = nonce_plaintext; States[7] = nonce_plaintext;
        AES8        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( message + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( message + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( message + 16*i +  64 ) ) );
        States[5] = xor( States[5], load( (__m128i *) ( message + 16*i +  80 ) ) );
        States[6] = xor( States[6], load( (__m128i *) ( message + 16*i +  96 ) ) );
        States[7] = xor( States[7], load( (__m128i *) ( message + 16*i + 112 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
        store( ciphertext+16*i +  32 , States[2] );
        store( ciphertext+16*i +  48 , States[3] );
        store( ciphertext+16*i +  64 , States[4] );
        store( ciphertext+16*i +  80 , States[5] );
        store( ciphertext+16*i +  96 , States[6] );
        store( ciphertext+16*i + 112 , States[7] );

        if(248 == ( i % 256) ) { ADD_TO_TWEAK( Tweak, SEIGHT ); }
        else                   { Tweak = add8( Tweak,  EIGHT ); }

        i += 8;

    }


    if( 16*(i+7) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);
        Tweaks[6] = add8( Tweaks[5], ONE);
        Tweaks[7] = add8( Tweaks[6], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext; States[5] = nonce_plaintext; States[6] = nonce_plaintext; States[7] = nonce_plaintext;
        AES8        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( message + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( message + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( message + 16*i +  64 ) ) );
        States[5] = xor( States[5], load( (__m128i *) ( message + 16*i +  80 ) ) );
        States[6] = xor( States[6], load( (__m128i *) ( message + 16*i +  96 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
        store( ciphertext+16*i +  32 , States[2] );
        store( ciphertext+16*i +  48 , States[3] );
        store( ciphertext+16*i +  64 , States[4] );
        store( ciphertext+16*i +  80 , States[5] );
        store( ciphertext+16*i +  96 , States[6] );
        store( last_block, States[7]);
        i += 7;
        for( j=0; j<m_len-16*i; j++)
            ciphertext[ 16*i + j] = message[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+7) == m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);
        Tweaks[6] = add8( Tweaks[5], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext; States[5] = nonce_plaintext; States[6] = nonce_plaintext;
        AES7        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( message + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( message + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( message + 16*i +  64 ) ) );
        States[5] = xor( States[5], load( (__m128i *) ( message + 16*i +  80 ) ) );
        States[6] = xor( States[6], load( (__m128i *) ( message + 16*i +  96 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
        store( ciphertext+16*i +  32 , States[2] );
        store( ciphertext+16*i +  48 , States[3] );
        store( ciphertext+16*i +  64 , States[4] );
        store( ciphertext+16*i +  80 , States[5] );
        store( ciphertext+16*i +  96 , States[6] );

    }
    else if( 16*(i+6) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);
        Tweaks[6] = add8( Tweaks[5], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext; States[5] = nonce_plaintext; States[6] = nonce_plaintext;
        AES7        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( message + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( message + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( message + 16*i +  64 ) ) );
        States[5] = xor( States[5], load( (__m128i *) ( message + 16*i +  80 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
        store( ciphertext+16*i +  32 , States[2] );
        store( ciphertext+16*i +  48 , States[3] );
        store( ciphertext+16*i +  64 , States[4] );
        store( ciphertext+16*i +  80 , States[5] );
        store( last_block, States[6]);
        i += 6;
        for( j=0; j<m_len-16*i; j++)
            ciphertext[ 16*i + j] = message[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+6) == m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext; States[5] = nonce_plaintext;
        AES6        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( message + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( message + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( message + 16*i +  64 ) ) );
        States[5] = xor( States[5], load( (__m128i *) ( message + 16*i +  80 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
        store( ciphertext+16*i +  32 , States[2] );
        store( ciphertext+16*i +  48 , States[3] );
        store( ciphertext+16*i +  64 , States[4] );
        store( ciphertext+16*i +  80 , States[5] );

    }
    else if( 16*(i+5) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext; States[5] = nonce_plaintext;
        AES6        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( message + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( message + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( message + 16*i +  64 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
        store( ciphertext+16*i +  32 , States[2] );
        store( ciphertext+16*i +  48 , States[3] );
        store( ciphertext+16*i +  64 , States[4] );
        store( last_block, States[5]);
        i += 5;
        for( j=0; j<m_len-16*i; j++)
            ciphertext[ 16*i + j] = message[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+5) == m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext;
        AES5        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( message + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( message + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( message + 16*i +  64 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
        store( ciphertext+16*i +  32 , States[2] );
        store( ciphertext+16*i +  48 , States[3] );
        store( ciphertext+16*i +  64 , States[4] );

    }
    else if( 16*(i+4) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext;
        AES5        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( message + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( message + 16*i +  48 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
        store( ciphertext+16*i +  32 , States[2] );
        store( ciphertext+16*i +  48 , States[3] );
        store( last_block, States[4]);
        i += 4;
        for( j=0; j<m_len-16*i; j++)
            ciphertext[ 16*i + j] = message[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+4) == m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        AES4        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( message + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( message + 16*i +  48 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
        store( ciphertext+16*i +  32 , States[2] );
        store( ciphertext+16*i +  48 , States[3] );

    }
    else if( 16*(i+3) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        AES4        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( message + 16*i +  32 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
        store( ciphertext+16*i +  32 , States[2] );
        store( last_block, States[3]);
        i += 3;
        for( j=0; j<m_len-16*i; j++)
            ciphertext[ 16*i + j] = message[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+3) == m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext;
        AES3        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( message + 16*i +  32 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
        store( ciphertext+16*i +  32 , States[2] );
    }
    else if( 16*(i+2) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext;
        AES3        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
        store( last_block, States[2]);
        i += 2;
        for( j=0; j<m_len-16*i; j++)
            ciphertext[ 16*i + j] = message[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+2) == m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext;
        AES2        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( message + 16*i +  16 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( ciphertext+16*i +  16 , States[1] );
    }
    else if( 16*(i+1) < m_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext;
        AES2        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( message + 16*i +   0 ) ) );
        store( ciphertext+16*i +   0 , States[0] );
        store( last_block, States[1]);
        i += 1;
        for( j=0; j<m_len-16*i; j++)
            ciphertext[ 16*i + j] = message[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+1) == m_len ){
        State = nonce_plaintext;
        AES        ( State, subkeys, Tweak, tTweak );
        State = xor( State, load( (__m128i *) ( message + 16*i +   0 ) ) );
        store( ciphertext+16*i +   0 , State );
    }
    else if( 16*(i+0) < m_len ){
        State = nonce_plaintext;
        AES        ( State, subkeys, Tweak, tTweak );
        store( last_block, State);
        for( j=0; j<m_len-16*i; j++)
            ciphertext[ 16*i + j] = message[ 16*i + j ] ^ last_block[j] ;
    }

    return 0;

}


int deoxys_aead_decrypt(const unsigned char *ass_data, unsigned long long ass_data_len,
                        unsigned char *message, unsigned long long int *m_len,
                        const unsigned char *key, const unsigned char *nonce,
                        const unsigned char *c, unsigned long long c_len
                        )
{

    unsigned long long int i,j;
    unsigned char last_block[16];
    const __m128i EIGHT			    = constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,8);
    const __m128i SEIGHT		    = constant8( 0,0,0,0,  0,0,0,0,  8,0,0,0,  0,0,0,0);
    const __m128i ONE               = constant8( 0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,1 );
    const __m128i STAGE_MASK   	    = constant8( 0x0f    ,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff );
    const __m128i PERM_MASK		    = constant8( 0,1,2,3,4,5,6,7,  15,14,13,12,11,10,9,8 );
    const __m128i H_PERMUTATION 	= constant8( 7,0,13,10, 11,4,1,14, 15,8,5,2, 3,12,9,6 );
    __m128i States[8];
    __m128i Tweaks[8];
    __m128i subkeys[17];
    __m128i State;
    __m128i tmp;
    __m128i tmp2;
    __m128i tmp3;
    __m128i tmp4;
    __m128i Tweak;
    __m128i tTweak;
    __m128i Auth;
    __m128i Tag;
    __m128i nonce_plaintext;
    __m128i mask_top_7_bits    = constant8_same(0xfe);
    __m128i mask_top_1_bit     = constant8_same(0x80);
    __m128i mask_bottom_1_bit  = constant8_same(0x01);
    __m128i mask_bottom_7_bits = constant8_same(0x7f);
    static const unsigned char rcon[17] = {0x2f,0x5e,0xbc,0x63,0xc6,0x97,0x35,0x6a,0xd4,0xb3,0x7d,0xfa,0xef,0xc5,0x91,0x39,0x72};



    // Set up the round keys (which include XOR of round constants)
    TWEAKEY_SCHEDULE3( subkeys, key, tmp,tmp2,tmp3,tmp4 );


    /*
     *
     *			 Associated data
     *
     *
     */

    Auth = xor(Auth, Auth);
    Tweak = xor( Tweak, Tweak );

    if(ass_data_len) {

            SET_STAGE_IN_TWEAK(Tweak, constant8( (0x2<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
            i = 0;

            while (16*(i+8) <= ass_data_len)
            {
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);
                Tweaks[5] = add8( Tweaks[4], ONE);
                Tweaks[6] = add8( Tweaks[5], ONE);
                Tweaks[7] = add8( Tweaks[6], ONE);

                PROCESS_8_ASS_DATA_BLOCKS( States, ass_data + 16 * i , Auth );

                if(248 == ( i % 256) ) { ADD_TO_TWEAK( Tweak, SEIGHT ); }
                else                   { Tweak = add8( Tweak,  EIGHT ); }

                i += 8;
            }

            if( 16*(i+7) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);
                Tweaks[5] = add8( Tweaks[4], ONE);
                Tweaks[6] = add8( Tweaks[5], ONE);
                Tweaks[7] = add8( Tweaks[6], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80); ls(States[6], ass_data + 16 * i, 96);
                i += 7;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[7], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[7], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES8        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], xor(States[6], States[7]))))))) );
            }
            else if(16*(i+7) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);
                Tweaks[5] = add8( Tweaks[4], ONE);
                Tweaks[6] = add8( Tweaks[5], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80); ls(States[6], ass_data + 16 * i, 96);
                AES7        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6])))))) );
            }
            else if( 16*(i+6) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);
                Tweaks[5] = add8( Tweaks[4], ONE);
                Tweaks[6] = add8( Tweaks[5], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80);
                i += 6;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[6], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[6], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES7        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6])))))) );
            }
            else if(16*(i+6) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);
                Tweaks[5] = add8( Tweaks[4], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64); ls(States[5], ass_data + 16 * i, 80);
                AES6        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5] ))))) );
            }
            else if( 16*(i+5) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);
                Tweaks[5] = add8( Tweaks[4], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64);
                i += 5;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[5], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[5], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES6        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5]))))) );
            }

            else if(16*(i+5) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                ls(States[4], ass_data + 16 * i,64);
                AES5        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))) );
            }
            else if( 16*(i+4) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);
                Tweaks[4] = add8( Tweaks[3], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                i += 4;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[4], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[4], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES5        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))) );
            }
            else if(16*(i+4) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32); ls(States[3], ass_data + 16 * i, 48);
                AES4        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], States[3]))) );
            }
            else if( 16*(i+3) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);
                Tweaks[3] = add8( Tweaks[2], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32);
                i += 3;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[3], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[3], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES4        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], States[3]))) );
            }
            else if(16*(i+3) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16); ls(States[2], ass_data + 16 * i, 32);
                AES3        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], States[2])) );
            }
            else if( 16*(i+2) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);
                Tweaks[2] = add8( Tweaks[1], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16);
                i += 2;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[2], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[2], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES3        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], xor(States[1], States[2])) );
            }
            else if(16*(i+2) == ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);

                ls(States[0], ass_data + 16 * i, 0); ls(States[1], ass_data + 16 * i, 16);
                AES2        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], States[1]) );
            }
            else if( 16*(i+1) < ass_data_len ){
                Tweaks[0] = Tweak;
                Tweaks[1] = add8( Tweaks[0], ONE);

                ls(States[0], ass_data + 16 * i, 0);
                i += 1;
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                ls(States[1], last_block, 0);
                SET_STAGE_IN_TWEAK(Tweaks[1], constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                AES2        ( States, subkeys, Tweaks );
                Auth = xor ( Auth, xor(States[0], States[1] ) );
            }

            else if(16*(i+1) == ass_data_len ){
                State = load( (__m128i *) ( ass_data + 16 * i ) );
                AES( State, subkeys, Tweak, tTweak );
                Auth = xor( Auth , State );
                i++;
            }
            else if(16*i < ass_data_len ){
                memset(last_block, 0, 16);
                memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
                last_block[ass_data_len-16*i]=0x80;
                SET_STAGE_IN_TWEAK(Tweak, constant8( (0x6<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
                State = load( (__m128i *) ( last_block ) );
                AES( State, subkeys, Tweak, tTweak );
                Auth = xor ( Auth, State );
            }
    }




    /*
     *
     *
     * 			Message : Second Pass
     *
     *
     */

    c_len -= 16;
    *m_len = c_len;

    memcpy( last_block, c + c_len, 16);
    Tag = load( (__m128i *) ( last_block ) );
    Tweak = xor ( and (Tag, constant32(0xffffff7f,0xffffffff,0xffffffff,0xffffffff) ), constant32(0x00000080,0,0,0) );

    for( i=0; i< 17; i++){
        subkeys[i] = xor( subkeys[i], Tweak);
        Tweak = permute( Tweak , H_PERMUTATION);
    }


    last_block[0] = 0;
    memcpy(last_block + 1, nonce, 15);
    nonce_plaintext = load( (__m128i *) ( last_block ) );


    i=0;
    Tweak = xor( Tweak, Tweak);
    while (16*(i+8) <= c_len) {

        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);
        Tweaks[6] = add8( Tweaks[5], ONE);
        Tweaks[7] = add8( Tweaks[6], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext; States[5] = nonce_plaintext; States[6] = nonce_plaintext; States[7] = nonce_plaintext;
        AES8        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( c + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( c + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( c + 16*i +  64 ) ) );
        States[5] = xor( States[5], load( (__m128i *) ( c + 16*i +  80 ) ) );
        States[6] = xor( States[6], load( (__m128i *) ( c + 16*i +  96 ) ) );
        States[7] = xor( States[7], load( (__m128i *) ( c + 16*i + 112 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
        store( message+16*i +  32 , States[2] );
        store( message+16*i +  48 , States[3] );
        store( message+16*i +  64 , States[4] );
        store( message+16*i +  80 , States[5] );
        store( message+16*i +  96 , States[6] );
        store( message+16*i + 112 , States[7] );

        if(248 == ( i % 256) ) { ADD_TO_TWEAK( Tweak, SEIGHT ); }
        else                   { Tweak = add8( Tweak,  EIGHT ); }

        i += 8;

    }

    if( 16*(i+7) < c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);
        Tweaks[6] = add8( Tweaks[5], ONE);
        Tweaks[7] = add8( Tweaks[6], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext; States[5] = nonce_plaintext; States[6] = nonce_plaintext; States[7] = nonce_plaintext;
        AES8        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( c + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( c + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( c + 16*i +  64 ) ) );
        States[5] = xor( States[5], load( (__m128i *) ( c + 16*i +  80 ) ) );
        States[6] = xor( States[6], load( (__m128i *) ( c + 16*i +  96 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
        store( message+16*i +  32 , States[2] );
        store( message+16*i +  48 , States[3] );
        store( message+16*i +  64 , States[4] );
        store( message+16*i +  80 , States[5] );
        store( message+16*i +  96 , States[6] );
        store( last_block, States[7]);
        i += 7;
        for( j=0; j<c_len-16*i; j++)
            message[ 16*i + j] = c[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+7) == c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);
        Tweaks[6] = add8( Tweaks[5], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext; States[5] = nonce_plaintext; States[6] = nonce_plaintext;
        AES7        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( c + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( c + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( c + 16*i +  64 ) ) );
        States[5] = xor( States[5], load( (__m128i *) ( c + 16*i +  80 ) ) );
        States[6] = xor( States[6], load( (__m128i *) ( c + 16*i +  96 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
        store( message+16*i +  32 , States[2] );
        store( message+16*i +  48 , States[3] );
        store( message+16*i +  64 , States[4] );
        store( message+16*i +  80 , States[5] );
        store( message+16*i +  96 , States[6] );

    }
    else if( 16*(i+6) < c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);
        Tweaks[6] = add8( Tweaks[5], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext; States[5] = nonce_plaintext; States[6] = nonce_plaintext;
        AES7        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( c + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( c + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( c + 16*i +  64 ) ) );
        States[5] = xor( States[5], load( (__m128i *) ( c + 16*i +  80 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
        store( message+16*i +  32 , States[2] );
        store( message+16*i +  48 , States[3] );
        store( message+16*i +  64 , States[4] );
        store( message+16*i +  80 , States[5] );
        store( last_block, States[6]);
        i += 6;
        for( j=0; j<c_len-16*i; j++)
            message[ 16*i + j] = c[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+6) == c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext; States[5] = nonce_plaintext;
        AES6        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( c + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( c + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( c + 16*i +  64 ) ) );
        States[5] = xor( States[5], load( (__m128i *) ( c + 16*i +  80 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
        store( message+16*i +  32 , States[2] );
        store( message+16*i +  48 , States[3] );
        store( message+16*i +  64 , States[4] );
        store( message+16*i +  80 , States[5] );

    }
    else if( 16*(i+5) < c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);
        Tweaks[5] = add8( Tweaks[4], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext; States[5] = nonce_plaintext;
        AES6        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( c + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( c + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( c + 16*i +  64 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
        store( message+16*i +  32 , States[2] );
        store( message+16*i +  48 , States[3] );
        store( message+16*i +  64 , States[4] );
        store( last_block, States[5]);
        i += 5;
        for( j=0; j<c_len-16*i; j++)
            message[ 16*i + j] = c[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+5) == c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext;
        AES5        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( c + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( c + 16*i +  48 ) ) );
        States[4] = xor( States[4], load( (__m128i *) ( c + 16*i +  64 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
        store( message+16*i +  32 , States[2] );
        store( message+16*i +  48 , States[3] );
        store( message+16*i +  64 , States[4] );

    }
    else if( 16*(i+4) < c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);
        Tweaks[4] = add8( Tweaks[3], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        States[4] = nonce_plaintext;
        AES5        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( c + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( c + 16*i +  48 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
        store( message+16*i +  32 , States[2] );
        store( message+16*i +  48 , States[3] );
        store( last_block, States[4]);
        i += 4;
        for( j=0; j<c_len-16*i; j++)
            message[ 16*i + j] = c[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+4) == c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        AES4        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( c + 16*i +  32 ) ) );
        States[3] = xor( States[3], load( (__m128i *) ( c + 16*i +  48 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
        store( message+16*i +  32 , States[2] );
        store( message+16*i +  48 , States[3] );

    }
    else if( 16*(i+3) < c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);
        Tweaks[3] = add8( Tweaks[2], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext; States[3] = nonce_plaintext;
        AES4        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( c + 16*i +  32 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
        store( message+16*i +  32 , States[2] );
        store( last_block, States[3]);
        i += 3;
        for( j=0; j<c_len-16*i; j++)
            message[ 16*i + j] = c[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+3) == c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext;
        AES3        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        States[2] = xor( States[2], load( (__m128i *) ( c + 16*i +  32 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
        store( message+16*i +  32 , States[2] );
    }
    else if( 16*(i+2) < c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);
        Tweaks[2] = add8( Tweaks[1], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext; States[2] = nonce_plaintext;
        AES3        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
        store( last_block, States[2]);
        i += 2;
        for( j=0; j<c_len-16*i; j++)
            message[ 16*i + j] = c[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+2) == c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext;
        AES2        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        States[1] = xor( States[1], load( (__m128i *) ( c + 16*i +  16 ) ) );
        store( message+16*i +   0 , States[0] );
        store( message+16*i +  16 , States[1] );
    }
    else if( 16*(i+1) < c_len ){
        Tweaks[0] = Tweak;
        Tweaks[1] = add8( Tweaks[0], ONE);

        States[0] = nonce_plaintext; States[1] = nonce_plaintext;
        AES2        ( States, subkeys, tTweak );
        States[0] = xor( States[0], load( (__m128i *) ( c + 16*i +   0 ) ) );
        store( message+16*i +   0 , States[0] );
        store( last_block, States[1]);
        i += 1;
        for( j=0; j<c_len-16*i; j++)
            message[ 16*i + j] = c[ 16*i + j ] ^ last_block[j] ;
    }
    else if( 16*(i+1) == c_len ){
        State = nonce_plaintext;
        AES        ( State, subkeys, Tweak, tTweak );
        State = xor( State, load( (__m128i *) ( c + 16*i +   0 ) ) );
        store( message+16*i +   0 , State );
    }
    else if( 16*(i+0) < c_len ){
        State = nonce_plaintext;
        AES        ( State, subkeys, Tweak, tTweak );
        store( last_block, State);
        for( j=0; j<c_len-16*i; j++)
            message[ 16*i + j] = c[ 16*i + j ] ^ last_block[j] ;
    }



    /*
    *
    *
    * 			Message  - first pass
    *
    *
    */

   TWEAKEY_SCHEDULE3( subkeys, key, tmp,tmp2,tmp3,tmp4 );
   Tweak 	= xor (Tweak,Tweak);

   i=0;
   while (16*(i+8) <= *m_len) {

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);
       Tweaks[2] = add8( Tweaks[1], ONE);
       Tweaks[3] = add8( Tweaks[2], ONE);
       Tweaks[4] = add8( Tweaks[3], ONE);
       Tweaks[5] = add8( Tweaks[4], ONE);
       Tweaks[6] = add8( Tweaks[5], ONE);
       Tweaks[7] = add8( Tweaks[6], ONE);

       LOAD_8_STATES ( States , message + 16 * i);
       AES8        ( States, subkeys, tTweak );
       Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], xor(States[6], States[7]))))))) );

       if(248 == ( i % 256) ) { ADD_TO_TWEAK( Tweak, SEIGHT ); }
       else                   { Tweak = add8( Tweak,  EIGHT ); }

       i += 8;

   }

   if( 16*(i+7) < *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);
       Tweaks[2] = add8( Tweaks[1], ONE);
       Tweaks[3] = add8( Tweaks[2], ONE);
       Tweaks[4] = add8( Tweaks[3], ONE);
       Tweaks[5] = add8( Tweaks[4], ONE);
       Tweaks[6] = add8( Tweaks[5], ONE);
       Tweaks[7] = add8( Tweaks[6], ONE);

       ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
       ls(States[4], message + 16 * i,64); ls(States[5], message + 16 * i, 80); ls(States[6], message + 16 * i, 96);
       memset(last_block, 0, 16);
       memcpy(last_block, message+16*(i+7), *m_len-16*(i+7));
       last_block[*m_len-16*(i+7)]=0x80;
       States[7] = load( (__m128i *) ( last_block ) );
       SET_STAGE_IN_TWEAK(Tweaks[7], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
       AES8        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], xor(States[6], States[7]))))))) );

   }
   else if( 16*(i+7) == *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);
       Tweaks[2] = add8( Tweaks[1], ONE);
       Tweaks[3] = add8( Tweaks[2], ONE);
       Tweaks[4] = add8( Tweaks[3], ONE);
       Tweaks[5] = add8( Tweaks[4], ONE);
       Tweaks[6] = add8( Tweaks[5], ONE);

       ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
       ls(States[4], message + 16 * i,64); ls(States[5], message + 16 * i, 80); ls(States[6], message + 16 * i, 96);
       AES7        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6] )))))) );

   }
   else if( 16*(i+6) < *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);
       Tweaks[2] = add8( Tweaks[1], ONE);
       Tweaks[3] = add8( Tweaks[2], ONE);
       Tweaks[4] = add8( Tweaks[3], ONE);
       Tweaks[5] = add8( Tweaks[4], ONE);
       Tweaks[6] = add8( Tweaks[5], ONE);

       ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
       ls(States[4], message + 16 * i,64); ls(States[5], message + 16 * i, 80);
       memset(last_block, 0, 16);
       memcpy(last_block, message+16*(i+6), *m_len-16*(i+6));
       last_block[*m_len-16*(i+6)]=0x80;
       States[6] = load( (__m128i *) ( last_block ) );
       SET_STAGE_IN_TWEAK(Tweaks[6], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
       AES7        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], xor(States[5], States[6])))))) );

   }
   else if( 16*(i+6) == *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);
       Tweaks[2] = add8( Tweaks[1], ONE);
       Tweaks[3] = add8( Tweaks[2], ONE);
       Tweaks[4] = add8( Tweaks[3], ONE);
       Tweaks[5] = add8( Tweaks[4], ONE);

       ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
       ls(States[4], message + 16 * i,64); ls(States[5], message + 16 * i, 80);
       AES6        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5]))))) );

   }

   else if( 16*(i+5) < *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);
       Tweaks[2] = add8( Tweaks[1], ONE);
       Tweaks[3] = add8( Tweaks[2], ONE);
       Tweaks[4] = add8( Tweaks[3], ONE);
       Tweaks[5] = add8( Tweaks[4], ONE);

       ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
       ls(States[4], message + 16 * i,64);
       memset(last_block, 0, 16);
       memcpy(last_block, message+16*(i+5), *m_len-16*(i+5));
       last_block[*m_len-16*(i+5)]=0x80;
       States[5] = load( (__m128i *) ( last_block ) );
       SET_STAGE_IN_TWEAK(Tweaks[5], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
       AES6        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], xor(States[4], States[5]))))) );

   }
   else if( 16*(i+5) == *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);
       Tweaks[2] = add8( Tweaks[1], ONE);
       Tweaks[3] = add8( Tweaks[2], ONE);
       Tweaks[4] = add8( Tweaks[3], ONE);

       ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
       ls(States[4], message + 16 * i,64);
       AES5        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))) );

   }
   else if( 16*(i+4) < *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);
       Tweaks[2] = add8( Tweaks[1], ONE);
       Tweaks[3] = add8( Tweaks[2], ONE);
       Tweaks[4] = add8( Tweaks[3], ONE);

       ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
       memset(last_block, 0, 16);
       memcpy(last_block, message+16*(i+4), *m_len-16*(i+4));
       last_block[*m_len-16*(i+4)]=0x80;
       States[4] = load( (__m128i *) ( last_block ) );
       SET_STAGE_IN_TWEAK(Tweaks[4], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
       AES5        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], xor(States[3], States[4])))) );

   }
   else if( 16*(i+4) == *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);
       Tweaks[2] = add8( Tweaks[1], ONE);
       Tweaks[3] = add8( Tweaks[2], ONE);

       ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32); ls(States[3], message + 16 * i, 48);
       AES4        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], States[3]))) );

   }
   else if( 16*(i+3) < *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);
       Tweaks[2] = add8( Tweaks[1], ONE);
       Tweaks[3] = add8( Tweaks[2], ONE);

       ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32);
       memset(last_block, 0, 16);
       memcpy(last_block, message+16*(i+3), *m_len-16*(i+3));
       last_block[*m_len-16*(i+3)]=0x80;
       States[3] = load( (__m128i *) ( last_block ) );
       SET_STAGE_IN_TWEAK(Tweaks[3], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
       AES4        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], xor(States[1], xor(States[2], States[3]))) );

   }
   else if( 16*(i+3) == *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);
       Tweaks[2] = add8( Tweaks[1], ONE);

       ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16); ls(States[2], message + 16 * i, 32);
       AES3        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], xor(States[1], States[2])) );

   }
   else if( 16*(i+2) < *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);
       Tweaks[2] = add8( Tweaks[1], ONE);

       ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16);
       memset(last_block, 0, 16);
       memcpy(last_block, message+16*(i+2), *m_len-16*(i+2));
       last_block[*m_len-16*(i+2)]=0x80;
       States[2] = load( (__m128i *) ( last_block ) );
       SET_STAGE_IN_TWEAK(Tweaks[2], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
       AES3        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], xor(States[1], States[2])) );

   }
   else if( 16*(i+2) == *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);

       ls(States[0], message + 16 * i, 0); ls(States[1], message + 16 * i, 16);
       AES2        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], States[1]) );

   }
   else if( 16*(i+1) < *m_len ){

       Tweaks[0] = Tweak;
       Tweaks[1] = add8( Tweaks[0], ONE);

       ls(States[0], message + 16 * i, 0);
       memset(last_block, 0, 16);
       memcpy(last_block, message+16*(i+1), *m_len-16*(i+1));
       last_block[*m_len-16*(i+1)]=0x80;
       States[1] = load( (__m128i *) ( last_block ) );
       SET_STAGE_IN_TWEAK(Tweaks[1], constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
       AES2        ( States, subkeys, Tweaks );
       Auth = xor ( Auth, xor(States[0], States[1]) );

   }
   else if( 16*(i+1) == *m_len ){

       ls(State, message + 16 * i, 0);
       AES        ( State, subkeys, Tweak, tTweak );
       Auth = xor ( Auth, State );

   }
   else if( 16*(i+0) < *m_len ){

       memset(last_block, 0, 16);
       memcpy(last_block, message+16*(i+0), *m_len-16*(i+0));
       last_block[*m_len-16*(i+0)]=0x80;
       State = load( (__m128i *) ( last_block ) );
       SET_STAGE_IN_TWEAK(Tweak, constant8( (0x4<<4),0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00, 0x00,0x00,0x00,0x00 ));
       AES        ( State, subkeys, Tweak, tTweak );
       Auth = xor ( Auth, State );

   }


   last_block[0] = 1<<4;
   memcpy(last_block+1,nonce,15);
   Tweak = load( (__m128i *) ( last_block ) );
   AES( Auth, subkeys, Tweak, tTweak );
   store( last_block , Auth );


   /* If the tags does not match, return error -1 */
   if( 0 != memcmp_const(last_block, c+c_len, 16) ) {
       return -1;
   }

   return 0;

}
