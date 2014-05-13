/*
 * Deoxys=-256-128 Reference C Implementation
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
#include "deoxys.h"
#include "tweakableBC.h"

/* Define the three MSB of the tweak (that depend on the stage) */
#define MSB_AD               (0x2<<4)
#define MSB_AD_LAST_FULL     (0x6<<4)
#define MSB_AD_LAST_PARTIAL  (0x7<<4)
#define MSB_M_ONE_LEFT_UP    (0x0<<4)
#define MSB_M_ONE_LEFT_DOWN  (0x4<<4)
#define MSB_M_ONE_RIGHT_UP   (0x1<<4)
#define MSB_M_ONE_RIGHT_DOWN (0x5<<4)
#define MSB_M_UP             (0x0<<4)
#define MSB_M_DOWN           (0x4<<4)
#define MSB_M_LAST_AUTH      (0x1<<4)
#define MSB_M_LAST_CIPH      (0x5<<4)
#define MSB_XLS1             (0x8<<4)
#define MSB_XLS2             (0x9<<4)

/* Number of bits in the TWEAKEY state (256 or 384) */
#define TWEAKEY_STATE_SIZE    384

/**********************************************************************************
*** In Deoxys=-256-128, the tweak is on 128 bits:
***     tweak = <stage> || <nonce> || <blockNumber>
***  where we use:
***      4 bits for stage
***     64 bits for nonce
***     60 bits for blockNumber
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
    tweak[7] = (nonce[6]&0xf) << 4 ^ (nonce[7] >> 4);
    tweak[8] = (nonce[7]&0xf) << 4;
}

/*
** Modifiy the block number in the tweak value
*/
static void set_block_number_in_tweak(uint8_t *tweak, const uint64_t block_no) {
    tweak[ 8] = (tweak[8]&0xf0) ^ ((block_no >> 56ULL) & 0x0f);
    tweak[ 9] = ((block_no >> 48ULL) & 0xff);
    tweak[10] = ((block_no >> 40ULL) & 0xff);
    tweak[11] = ((block_no >> 32ULL) & 0xff);
    tweak[12] = ((block_no >> 24ULL) & 0xff);
    tweak[13] = ((block_no >> 16ULL) & 0xff);
    tweak[14] = ((block_no >>  8ULL) & 0xff);
    tweak[15] = ((block_no >>  0ULL) & 0xff);
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
** XOR an input block to another input block
*/
static void xor_values(uint8_t *v1, const uint8_t *v2) {
    int i;
    for (i=0; i<16; i++) v1[i] ^= v2[i];
}

/*
**
*/
size_t getUnpaddedLength(uint8_t* message) {
  int i;
  for(i=15;message[i]==0x00 && i>0;--i);
  if(message[i]==0x80) return i;
  else return -1;
}


/*
** Mix function used in XLS
*/
void mix(const uint8_t* A, const uint8_t* B, const uint32_t s, uint8_t* Out1, uint8_t* Out2) {

  uint32_t i;
  uint8_t S[16];
  uint8_t rotS[16];

  for(i=0; i<s; i++) S[i] = A[i] ^ B[i];
  for(i=0; i<s; i++) {rotS[i] = S[i]<<1; rotS[i] ^= (S[(i+1)%s]>>7) & 0x1;}
  for(i=0; i<s; i++) {Out1[i] = A[i] ^ rotS[i]; Out2[i] = B[i] ^ rotS[i]; }
}
/*
** XLS function used for padding, when message input has a length not a multiple of the block size
*/
void XLS(const uint8_t isDirect,
         uint8_t message[],
         const uint32_t s,
         uint8_t* tweakey, /* of size TWEAKEY_STATE_SIZE/8 bytes */
         uint8_t* tweak,
         const uint32_t l,
         uint8_t* cipher) {

  uint8_t M1[16];
  uint8_t M2[16];
  uint8_t X1[16];
  uint8_t X1ns[16];
  uint8_t X1s[16];
  uint8_t Xp1ns[16];
  uint8_t Xp1s[16];
  uint8_t X2[16];
  uint8_t Xp1[16];
  uint8_t Y1[16];
  uint8_t Y1ns[16];
  uint8_t Y1s[16];
  uint8_t Yp1ns[16];
  uint8_t Yp1s[16];
  uint8_t Yp1[16];
  uint8_t C1[16];
  uint8_t C2[16];

  /* Prepare the inputs */
  memcpy (M1, message, 16);
  memcpy (M2, message+16, s);

  /* First round */
  set_stage_in_tweak (tweak, MSB_XLS1);
  set_block_number_in_tweak (tweak, l);
  set_tweak_in_tweakey(tweakey, tweak);
  if (isDirect) aesTweakEncrypt (TWEAKEY_STATE_SIZE, M1, tweakey, X1);
  else          aesTweakDecrypt (TWEAKEY_STATE_SIZE, M1, tweakey, X1);
  memcpy (X1ns, X1  , 16-s);
  memcpy (X1s, X1+16-s, s);
  memcpy (Xp1ns, X1ns, 16-s);
  Xp1ns[16-s-1] ^= 1;
  mix (X1s, M2, s, Xp1s, X2);
  memcpy (Xp1, Xp1ns, 16-s);
  memcpy (Xp1+16-s, Xp1s, s);

  /* Second round */
  set_stage_in_tweak (tweak, MSB_XLS2);
  set_tweak_in_tweakey(tweakey, tweak);
  if (isDirect) aesTweakEncrypt (TWEAKEY_STATE_SIZE, Xp1, tweakey, Y1);
  else          aesTweakDecrypt (TWEAKEY_STATE_SIZE, Xp1, tweakey, Y1);
  memcpy (Y1ns, Y1, 16-s);
  memcpy (Y1s, Y1+16-s, s);
  memcpy (Yp1ns, Y1ns, 16-s);
  Yp1ns[16-s-1] ^= 1;
  mix (Y1s, X2, s, Yp1s, C2);
  memcpy (Yp1, Yp1ns, 16-s);
  memcpy (Yp1+16-s, Yp1s, s);

  /* Third round */
  set_stage_in_tweak (tweak, MSB_XLS1);
  set_tweak_in_tweakey(tweakey, tweak);
  if (isDirect) aesTweakEncrypt (TWEAKEY_STATE_SIZE, Yp1, tweakey, C1);
  else          aesTweakDecrypt (TWEAKEY_STATE_SIZE, Yp1, tweakey, C1);

  /* Write the outputs */
  memcpy (cipher, C1, 16);
  memcpy (cipher+16, C2, s);

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

    uint32_t i;
    uint8_t tweak[16];
    uint8_t tweakey[TWEAKEY_STATE_SIZE/8];
    uint8_t Auth[16];
    uint8_t last_block[16];
    uint8_t Checksum[16];
    uint8_t Final[16];
    uint8_t temp[16];
    uint8_t c_star[16];


    /* Fill the tweak from nonce */
    memset(tweak, 0, sizeof(tweak));
    set_nonce_in_tweak (tweak, nonce);

    /* Fill the key(s) in the tweakey state */
#if TWEAKEY_STATE_SIZE==256
    memcpy(tweakey, key, 16);
#elif TWEAKEY_STATE_SIZE==384
    memcpy(tweakey, key, 32);
#endif

    /* Associated data */
    memset (Auth, 0, 16);
    set_stage_in_tweak (tweak, MSB_AD);
    i = 1;
    while (16*i+16 <= ass_data_len) {
        set_block_number_in_tweak (tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt (TWEAKEY_STATE_SIZE, ass_data+16*(i-1), tweakey, temp);
        xor_values (Auth, temp);
        i++;
    }

    /* Last block if full and not empty */
    if (ass_data_len==16*i) {
        xor_values (Auth, ass_data+16*(i-1));
        set_stage_in_tweak (tweak, MSB_AD_LAST_FULL);

    } else { /* Last block is NOT full or zero length associated data */
        if (ass_data_len >= 16) {
            set_block_number_in_tweak (tweak, i);
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt (TWEAKEY_STATE_SIZE, ass_data+16*(i-1), tweakey, temp);
            xor_values (Auth, temp);
        } else {
            i = 0;
        }

        memset(last_block, 0, 16);
        memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
        last_block[ass_data_len-16*i] = 0x80;
        xor_values (Auth, last_block);
        set_stage_in_tweak (tweak, MSB_AD_LAST_PARTIAL);
    }

    /* Last BC call for the associated data */
    set_block_number_in_tweak (tweak, ass_data_len/16);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt (TWEAKEY_STATE_SIZE, Auth, tweakey, Auth);

    /* Now, we handle the message */

    /* Case where the message length is less than one full block */
    if (m_len < 16) {

        /* Pad the partial message block */
        memset(last_block, 0, 16);
        memcpy(last_block, message, m_len);
        last_block[m_len] = 0x80;

        /* Update the tweak value */
        set_block_number_in_tweak (tweak, 0);
        set_stage_in_tweak (tweak, MSB_M_ONE_LEFT_UP);

        /* Encrypt the block */
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt (TWEAKEY_STATE_SIZE, last_block, tweakey, temp);

        /* Update the Auth value */
        xor_values (Auth, temp);

        /* Obtain the ciphertext block */
        set_stage_in_tweak (tweak, MSB_M_ONE_LEFT_DOWN);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt (TWEAKEY_STATE_SIZE, Auth, tweakey, c_star);

        /* Encrypt the checksum */
        set_stage_in_tweak (tweak, MSB_M_ONE_RIGHT_UP);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt (TWEAKEY_STATE_SIZE, last_block, tweakey, temp);

        /* Update the Auth value */
        xor_values (Auth, temp);

        /* Obtain the tag */
        set_block_number_in_tweak (tweak, 0);
        set_stage_in_tweak (tweak, MSB_M_ONE_RIGHT_DOWN);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt (TWEAKEY_STATE_SIZE, Auth, tweakey, temp);

        /* Use the tag splitting technique to get a length-preserving ciphertext */
        memcpy (ciphertext, c_star, m_len);
        memcpy (ciphertext+m_len, c_star+m_len, 16-m_len);
        memcpy (ciphertext+m_len+16-m_len, temp, m_len);



        /* Update the size of the ciphertext (incl. tag) */
        *c_len=16+m_len;

        return;
    }

    /* Any length */
    memset (Checksum, 0, 16);
    i = 1;
    while (16*i  <= m_len) {

      /* Update the checksum */
      xor_values (Checksum, message+16*(i-1));

      /* Encrypt the current message block */
      set_block_number_in_tweak (tweak, i);
      set_stage_in_tweak (tweak, MSB_M_UP);
      set_tweak_in_tweakey(tweakey, tweak);
      aesTweakEncrypt (TWEAKEY_STATE_SIZE, message+16*(i-1), tweakey, temp);

      /* Update the Auth value */
      xor_values  (Auth, temp);

      /* Obtain the current ciphertext block */
      set_stage_in_tweak (tweak, MSB_M_DOWN);
      set_tweak_in_tweakey(tweakey, tweak);
      aesTweakEncrypt (TWEAKEY_STATE_SIZE, Auth, tweakey, ciphertext+16*(i-1));

      /* Go on with the next block */
      i++;
    }

    /* Encrypt the checksum */
    set_stage_in_tweak (tweak, MSB_M_LAST_AUTH);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt (TWEAKEY_STATE_SIZE, Checksum, tweakey, temp);

    /* Update the Auth value */
    xor_values (Auth, temp);

    /* Produce the Final value */
    set_stage_in_tweak (tweak, MSB_M_LAST_CIPH);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt (TWEAKEY_STATE_SIZE, Auth, tweakey, Final);

    /* If the last block is incomplete */
    if (m_len> 16*(i-1)) {

      uint32_t s;
      uint8_t XLSin[32];
      uint8_t XLSout[32];

      /* s denotes the number of bytes in the last partial block */
      s=m_len-16*(i-1);

      /* Prepare the input to XLS */
      memcpy(XLSin, message+16*(i-1), s);
      memcpy(XLSin+s, Final, 16);

      /* Call XLS */
      XLS (1, XLSin, s, tweakey, tweak, i-1, XLSout);

      /* Write the ciphertext */
      memcpy (ciphertext+16*(i-1), XLSout, s);

      /* and append the tag to it */
      memcpy (ciphertext+m_len, XLSout+s, 16);

    } else {

      /* Append the tag to the ciphertext */
      memcpy (ciphertext+m_len, Final, 16);
    }

    /* Update the size of the ciphertext (incl. tag) */
    *c_len=16+m_len;
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

    uint32_t i;
    uint8_t tweak[16];
    uint8_t tweakey[TWEAKEY_STATE_SIZE/8];
    uint8_t Auth[16];
    uint8_t last_block[16];
    uint8_t Checksum[16];
    uint8_t Final[16];
    uint8_t temp[16];
    uint8_t temp_msg[16];
    uint8_t c_star[16];

    /* Fill the tweak from nonce */
    memset(tweak, 0, sizeof(tweak));
    set_nonce_in_tweak (tweak, nonce);

    /* Fill the key(s) in the tweakey state */
#if TWEAKEY_STATE_SIZE==256
    memcpy(tweakey, key, 16);
#elif TWEAKEY_STATE_SIZE==384
    memcpy(tweakey, key, 32);
#endif

    /* Associated data */
    memset (Auth, 0, 16);
    set_stage_in_tweak (tweak, MSB_AD);
    i = 1;
    while (16*i+16 <= ass_data_len) {
        set_block_number_in_tweak (tweak, i);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt (TWEAKEY_STATE_SIZE, ass_data+16*(i-1), tweakey, temp);
        xor_values (Auth, temp);
        i++;
    }

    /* Last block if full and not empty */
    if (ass_data_len==16*i) {
        xor_values (Auth, ass_data+16*(i-1));
        set_stage_in_tweak (tweak, MSB_AD_LAST_FULL);

    } else { /* Last block is NOT full or zero length associated data */
        if (ass_data_len >= 16) {
            set_block_number_in_tweak (tweak, i);
            set_tweak_in_tweakey(tweakey, tweak);
            aesTweakEncrypt (TWEAKEY_STATE_SIZE, ass_data+16*(i-1), tweakey, temp);
            xor_values (Auth, temp);
        } else {
            i = 0;
        }

        memset(last_block, 0, 16);
        memcpy(last_block, ass_data+16*i, ass_data_len-16*i);
        last_block[ass_data_len-16*i] = 0x80;
        xor_values (Auth, last_block);
        set_stage_in_tweak (tweak, MSB_AD_LAST_PARTIAL);
    }

    /* Last BC call for the associated data */
    set_block_number_in_tweak (tweak, ass_data_len/16);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt (TWEAKEY_STATE_SIZE, Auth, tweakey, Auth);

    /* Now, we handle the message */

    /* Case where the message length is less than one full block (c_len-16<16) */
    if ((c_len-16) < 16) {

        /* Reverse the tag splitting technique to construct the ciphertext block */
        memcpy(c_star, ciphertext, 16);

        /* Decrypt the block */
        set_block_number_in_tweak (tweak, 0);
        set_stage_in_tweak (tweak, MSB_M_ONE_LEFT_DOWN);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakDecrypt (TWEAKEY_STATE_SIZE, c_star, tweakey, temp);

        /* Decrypt again to get the message block */
        xor_values(Auth, temp);
        set_stage_in_tweak (tweak, MSB_M_ONE_LEFT_UP);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakDecrypt (TWEAKEY_STATE_SIZE, Auth, tweakey, temp_msg);

        /* First check on the n-bit tag condition: the plaintext must be c_len-16 bytes long */
        if((c_len-16) != getUnpaddedLength(temp_msg)) return -1;

        /* Update the plaintext length by removing the size of tag from c_len */
        *m_len=c_len-16;

        /* Write plaintext */
        memcpy(message, temp_msg, *m_len);

        /* Update the Auth value */
        memcpy(Auth, temp, 16);

        /* Encrypt the checksum */
        set_stage_in_tweak (tweak, MSB_M_ONE_RIGHT_UP);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt (TWEAKEY_STATE_SIZE, temp_msg, tweakey, temp);

        /* Update the Auth value */
        xor_values (Auth, temp);

        /* Check the remaining of the tag */
        set_stage_in_tweak (tweak, MSB_M_ONE_RIGHT_DOWN);
        set_tweak_in_tweakey(tweakey, tweak);
        aesTweakEncrypt (TWEAKEY_STATE_SIZE, Auth, tweakey, temp);
        if(0 != memcmp(ciphertext+16, temp, *m_len)) return -1;

        /* If the tag is valid, then quit the function, and the plaintext is returned */
        return 0;
    }

    /* Any length */

    /* Update the size of the plaintext */
    *m_len=c_len-16;

    memset (Checksum, 0, 16);
    i = 1;
    while (16*i <= *m_len) {

      /* Decrypt the current ciphertext block */
      set_block_number_in_tweak (tweak, i);
      set_stage_in_tweak (tweak, MSB_M_DOWN);
      set_tweak_in_tweakey(tweakey, tweak);
      aesTweakDecrypt (TWEAKEY_STATE_SIZE, ciphertext+16*(i-1), tweakey, temp);

      /* Update the Auth value */
      xor_values (Auth, temp);

      /* Obtain the plaintext block */
      set_stage_in_tweak (tweak, MSB_M_UP);
      set_tweak_in_tweakey(tweakey, tweak);
      aesTweakDecrypt (TWEAKEY_STATE_SIZE, Auth, tweakey, message+16*(i-1));

      /* Update the Checksum */
      xor_values (Checksum, message+16*(i-1));

      /* Update the Auth value */
      memcpy(Auth, temp, 16);

      /* Go on with the next block */
      i++;
    }

    /* Encrypt the checkum */
    set_stage_in_tweak (tweak, MSB_M_LAST_AUTH);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt (TWEAKEY_STATE_SIZE, Checksum, tweakey, temp);

    /* Update the Auth value */
    xor_values (Auth, temp);

    /* Obtain the Final value */
    set_stage_in_tweak (tweak, MSB_M_LAST_CIPH);
    set_tweak_in_tweakey(tweakey, tweak);
    aesTweakEncrypt (TWEAKEY_STATE_SIZE, Auth, tweakey, Final);

    /* If the last block is incomplete */
    if (*m_len> 16*(i-1)) {

      uint32_t s;
      uint8_t XLSin[32];
      uint8_t XLSout[32];

      /* s denotes the number of bytes in the last partial block */
      s=c_len-16-16*(i-1);

      /* Prepare the input to XLS */
      memcpy(XLSin, ciphertext+16*(i-1), s); /* copy the s-byte partial block */
      memcpy(XLSin+c_len-16-16*(i-1), ciphertext+c_len-16, 16); /* append tag */

      /* Apply inverse XLS */
      XLS (0, XLSin, s, tweakey, tweak, i-1, XLSout);

      /* Check the Final value */
      if(0!=memcmp(Final, XLSout+s, 16)) return -1;

      /* Write the remaining s bytes in the plaintext */
      memcpy(message+*m_len-s, XLSout, s);

    } else {

      /* If the tag does not match, return error */
      if(0!=memcmp(Final, ciphertext+c_len-16, 16)) return -1;

    }

    return 0;
}
