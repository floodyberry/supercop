/*
 * SHELL-AES Reference C Implementation
 *
 * Copyright 2014:
 *     Lei Wang <wang.lei@ntu.edu.sg>
 *              <shellaemode@gmail.com>
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

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdint.h>

#include "aes.h"
#include "shellaes.h"


/*print a byte string b[]. blen is the length of b[].*/
void printf_byte_string(const u8 b[], unsigned long long int blen){
    unsigned long long int i;

    for(i=0; i<blen; ++i){
        printf("%3x", b[i]);

        if(i%16==15&&i!=0){
            printf("\n");
        }
    }
    printf("\n");
}

/*xor the first blen bytes of two byte string byte1[] and byte2[],
and save the result byte string to the first blen bytes of byte2[]*/
void xor_byte_string(const u8 byte1[], u8 byte2[], unsigned long long int blen){

    unsigned long long int i;

    for(i=0; i<blen; ++i){
        byte2[i]^=byte1[i];
    }
}

/*compute the XOR checksum of a set of 128-bit state stored in a byte string byte1[]*/
void checksum_state_string(const u8 byte1[], u8 checksum[], unsigned long long int blen){
    memset(checksum, 0x00, 16);

    while(blen!=0){
        xor_byte_string(byte1, checksum, 16);
        byte1+=16;
        blen-=16;
    }
}

/*compute 2*maskstate over GF(2^128) with f(x)=x^128+x^7+x^2+x+1*/
void double_mask(u8 maskstate[]){
    int i;
    u8 msb;
    u8 tempbyte;

    msb=(maskstate[0] & 0x80)?1:0;

    u8 carry=0;

    for(i=15; i>=0; --i){
        tempbyte=maskstate[i];
        maskstate[i]=(tempbyte<<1)|carry;
        carry=tempbyte>>7;
    }

    if(msb){
        maskstate[15]^=0x87;
    }
}

/*MIX function used in XLS*/
void MIX(u8 byte1[], u8 byte2[], unsigned int blen){
    u8 temp[blen];
    u8 tempbyte;
    int i;
    u8 carry;

    memcpy(temp, byte1, blen);
    xor_byte_string(byte2, temp, blen);

    /*left rotate temp[] by one bit*/
    carry=temp[0]>>7;
    for(i=blen-1; i>=0; --i){
        tempbyte=temp[i];
        temp[i]=tempbyte<<1;
        temp[i]|=carry;
        carry=tempbyte>>7;
    }

    xor_byte_string(temp, byte1, blen);
    xor_byte_string(temp, byte2, blen);
}

/*Setup the encryption key materials including mask key, and subkeys for SHELL-AES*/
void KeySetupEnc(u32 mk[], u32 sk[], u8 L[], u8 Lprime[], u8 keyprime[], const u32 rk[], const u8 key[]){

    u8 pt[16];
    u8 ct[16];

    int i;


    /* generate Keyprime for CENC*/
    for(i=0; i<16; ++i){
        keyprime[i]=key[i]^0xF0;
    }

    /* produce L for masks of AES*/
    memset(pt, 0x00, 16);
    aesEncrypt(rk, pt, L);

    /*produce the subkeys for auxiliary permutations*/
    for(i=1; i<=3*d; ++i){
        pt[15]=i;
        aesEncrypt(rk, pt, ct);

        sk[0]=GETU32(ct);
        sk[1]=GETU32(ct+4);
        sk[2]=GETU32(ct+8);
        sk[3]=GETU32(ct+12);

        sk=sk+4;
    }

    /*produce the mask keys for auxiliary permutations*/
    for(i=3*d+1; i<=4*d; ++i){
        pt[15]=i;

        aesEncrypt(rk, pt, ct);

        mk[0]=GETU32(ct);
        mk[1]=GETU32(ct+4);
        mk[2]=GETU32(ct+8);
        mk[3]=GETU32(ct+12);

        mk=mk+4;
    }

    /*produce Lprime for XEX layer*/

    memset(pt, 0xFF, 16);
    aesEncrypt(rk, pt, Lprime);
}

/*Setup the decryption key materials including mask key, and subkey for SHELL-AES*/
void KeySetupDec(u32 mk[], u32 sk[], u32 isk[], u8 L[], u8 Lprime[], u8 keyprime[], const u32 rk[], const u8 key[]){

    int i;
    u32 temp;

    KeySetupEnc(mk, sk, L, Lprime, keyprime, rk, key);

    memcpy(isk, sk, 48*d);

    /*inverse the order of round keys for each auxiliary permutation */
    for(i=0; i<d; ++i){
        temp=isk[12*i  ]; isk[12*i  ]=isk[12*i+ 8]; isk[12*i+ 8]=temp;
        temp=isk[12*i+1]; isk[12*i+1]=isk[12*i+ 9]; isk[12*i+ 9]=temp;
        temp=isk[12*i+2]; isk[12*i+2]=isk[12*i+10]; isk[12*i+10]=temp;
        temp=isk[12*i+3]; isk[12*i+3]=isk[12*i+11]; isk[12*i+11]=temp;
    }


    /*apply inverse mixcolumn to the round keys*/
    for(i=0; i< 12*d; ++i){
        isk[i] =
			Td0[Te4[(isk[i] >> 24)       ] & 0xff] ^
			Td1[Te4[(isk[i] >> 16) & 0xff] & 0xff] ^
			Td2[Te4[(isk[i] >>  8) & 0xff] & 0xff] ^
			Td3[Te4[(isk[i]      ) & 0xff] & 0xff];
    }
}

/*PX-MAC to process associated data*/
void PXMAC(const u32 mk[], const u32 sk[], const u8 L[], u8 V[], const u32 rk[], const u8 ad[], unsigned long long int adlen){

      int i=0;
      u8 pt[16], ct[16];
      u8 final_block_mask[16];


      memset(pt, 0, 16);
      memset(ct, 0, 16);

      /*process associated data except the last block*/
      memset(V, 0x00, 16);

      while(adlen>16){
            aesReducedEnc(mk+4*i, sk+12*i, ad, ct);
            xor_byte_string(ct, V, 16);

            ++i;
            ad+=16;
            adlen-=16;

            if(i==d){
                aesEncrypt(rk, V, ct);
                memcpy(V, ct, 16);
                i=0;
            }
      }

      /*process the last block*/
      memcpy(final_block_mask, L, 16);
      double_mask(final_block_mask);

      memcpy(pt, ad, adlen);

      if(adlen!=16){
            double_mask(final_block_mask);

            pt[adlen]=0x80;
            memset(pt+adlen+1, 0x00, 15-adlen);
      }

      aesReducedEnc(mk+4*i, sk+12*i, pt, ct);
      xor_byte_string(ct, V, 16);

      xor_byte_string(final_block_mask, V, 16);

      /*the finalization AES*/
      aesEncrypt(rk, V, ct);
      memcpy(V, ct, 16);

}

/*CENC to process nonce*/
void CENC(const u32 rkprime[], u8 S[], u8 F[], const u8 nonce[], unsigned long long int ptlen){

    u8 ctr[16];
    u8 G[16];
    u8 ct[16];
    int i, j=0;

    /*initialize ctr*/
    memset(ctr, 0, 16);
    memcpy(ctr, nonce, byte_length_nonce);

    /*produce the output S except the last block*/
    aesEncrypt(rkprime, ctr, G);

    while(ptlen>16){
        /*increase ctr by adding 1*/
        if(++ctr[15]==0){
            i=14;
            while(++ctr[i]==0){
                --i;
            }
        }
        /*update the value of G*/
        if(j==w){
            aesEncrypt(rkprime, ctr, G);
            j=0;
            continue;
        }

        aesEncrypt(rkprime, ctr, S);

        xor_byte_string(G, S, 16);

        S+=16;

        ptlen-=16;
        ++j;
    }

    /*produce the last block of S*/

    if(++ctr[15]==0){
          i=14;
          while(++ctr[i]==0){
               --i;
          }
    }

    if(j==w){
         aesEncrypt(rkprime, ctr, G);
         j=0;
         if(++ctr[15]==0){
            i=14;
            while(++ctr[i]==0){
                    --i;
            }
        }
    }

    aesEncrypt(rkprime, ctr, ct);
    xor_byte_string(G, ct, 16);

    memcpy(S, ct, ptlen);

    ++j;

    /*produce the value of F*/

    if(++ctr[15]==0){
          i=14;
          while(++ctr[i]==0){
               --i;
          }
    }

    if(j==w){
         aesEncrypt(rkprime, ctr, G);
         j=0;
         if(++ctr[15]==0){
            i=14;
            while(++ctr[i]==0){
                    --i;
            }
        }
    }

    aesEncrypt(rkprime, ctr, F);
    xor_byte_string(G, F, 16);

}

/*PXENC layer*/
void PXENC(const u32 mk[], const u32 sk[], const u8 L[], u8 V[], u8 Z[], const u32 rk[], const u8 I[], unsigned long long int ptlen){

    int i=0;
    u8 ct[16];

    u8 final_block_mask[16];

    /*process I[] except the last block*/
    while(ptlen>16){
        aesReducedEnc(mk+4*i, sk+12*i, I, ct);
        xor_byte_string(ct, V, 16);

        memcpy(Z, V, 16);

        Z+=16;
        I+=16;
        ptlen-=16;
        ++i;

        if(i==d){
                aesEncrypt(rk, V, ct);
                memcpy(V, ct, 16);
                i=0;
        }

    }

    /*process the last block of I[]*/
    aesReducedEnc(mk+4*i, sk+12*i, I, ct);
    xor_byte_string(ct, V, 16);

    memcpy(final_block_mask, L, 16);
    double_mask(final_block_mask);
    double_mask(final_block_mask);
    double_mask(final_block_mask);

    xor_byte_string(final_block_mask, V, 16);

    memcpy(Z, V, 16);

    /*the finalization AES*/
    aesEncrypt(rk, V, ct);
    memcpy(V, ct, 16);

}

/*PXDEC layer: the decryption of PXENC*/
void PXDEC(const u32 mk[], const u32 isk[], const u8 L[], u8 V[], const u8 Z[], const u32 rk[], u8 I[], unsigned long long int ctlen){

    int i=0;

    u8 ct[16];
    u8 final_block_mask[16];

    /*process the output Z[] of XEXLayerDec except the last block*/
    while(ctlen>16){
        xor_byte_string(Z, V, 16);
        aesReducedDec(mk+4*i, isk+12*i, V, ct);

        memcpy(I, ct, 16);
        memcpy(V, Z, 16);

        Z+=16;
        I+=16;
        ctlen-=16;
        ++i;

        if(i==d){
            i=0;
            aesEncrypt(rk, V, ct);
            memcpy(V, ct, 16);
        }
    }

    /*process the last block*/
    memcpy(final_block_mask, L, 16);
    double_mask(final_block_mask);
    double_mask(final_block_mask);
    double_mask(final_block_mask);


    xor_byte_string(Z, V, 16);
    xor_byte_string(final_block_mask, V, 16);

    aesReducedDec(mk+4*i, isk+12*i, V, I);

    /*apply the finalization AES*/
    memcpy(V, Z, 16);
    aesEncrypt(rk, V, ct);
    memcpy(V, ct, 16);
}

/* XEX layer to produce ciphertext*/
void XEXLayerEnc(const u32 rk[], const u8 Lprime[], const u8 Z[], u8 C[], unsigned long long int ctlen){

    u8 mask[16];
    u8 temp[16];
    u8 ct[16];

    memcpy(mask, Lprime, 16);

    while(ctlen!=0){
        double_mask(mask);

        memcpy(temp, Z, 16);

        xor_byte_string(mask, temp, 16);
        aesEncrypt(rk, temp, ct);
        xor_byte_string(mask, ct, 16);
        memcpy(C, ct, 16);

        C+=16;
        Z+=16;
        ctlen-=16;
    }
}

/*decryption of XEX layer*/
void XEXLayerDec(const u32 irk[], const u8 Lprime[], const u8 C[], u8 Z[], unsigned long long int ctlen){

    u8 mask[16];
    u8 temp[16];
    u8 pt[16];

    memcpy(mask, Lprime, 16);

    while(ctlen!=0){
        double_mask(mask);

        memcpy(temp, C, 16);
        xor_byte_string(mask, temp, 16);
        aesDecrypt(irk, temp, pt);
        xor_byte_string(mask, pt, 16);

        memcpy(Z, pt, 16);

        C+=16;
        Z+=16;
        ctlen-=16;
    }
}

/*generate tag for plaintext with multiple block length*/
void tagGen(const u32 rk[], const u8 checksum[], const u8 Lprime[], const u8 U[], const u8 F[], u8 T[], unsigned long long int ptlen){
    u8 mask1[16], mask2[16];
    u8 temp[16];

    /*generate 3*Lprime and 7*Lprime and store them in mask1[] and mask2[] respectively*/
    memcpy(mask1, Lprime, 16);
    double_mask(mask1);
    memcpy(mask2, mask1, 16);
    xor_byte_string(Lprime, mask1, 16);

    double_mask(mask2);
    xor_byte_string(mask1, mask2, 16);

    /*generate 2^{lm+1}*3*Lprime and 2^{lm+1}*7*Lprime and store them in mask1[] and mask2[] respectively*/
    while(ptlen!=0){
        double_mask(mask1);
        double_mask(mask2);
        ptlen-=16;
    }
    double_mask(mask1);
    double_mask(mask2);

    /*produce the tag value*/
    xor_byte_string(checksum, mask1, 16);

    aesEncrypt(rk, mask1, temp);
    xor_byte_string(U, temp, 16);
    xor_byte_string(mask2, temp, 16);

    aesEncrypt(rk, temp, T);
    xor_byte_string(mask2, T, 16);
    xor_byte_string(F, T, 16);
}

/*verify the validness of the tag T[]*/
int tagVef(const u32 rk[], const u8 checksum[], const u8 Lprime[], const u8 U[], const u8 F[], const u8 T[], unsigned long long int ptlen){

    u8 tempT[16];
    int flag=1;
    int i;

    tagGen(rk, checksum, Lprime, U, F, tempT, ptlen);

    for(i=0; i<16; ++i){
        if(tempT[i]!=T[i]){
            flag=0;
        }
    }
    return flag;
}

/*SHELL-AES encryption for plaintexts of mutiple blocks long:
parameters follow those of function shellaesEnc
*/
void shellaesEnc_fb(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 p[], unsigned long long int ptlen, u8 c[], u8 tag[]){
    u8 V[16], U[16], checksum[16], F[16], keyprime[16], L[16], Lprime[16];
    u8* S;
    u8* I;
    u8* Z;

    S= (u8 *) malloc(ptlen);
    I= (u8 *) malloc(ptlen);
    Z= (u8 *) malloc(ptlen);

    memset(V, 0, 16);
    memset(U, 0, 16);
    memset(checksum, 0, 16);
    memset(keyprime, 0, 16);
    memset(F, 0, 16);
    memset(L, 0, 16);
    memset(Lprime, 0, 16);

    u32 mk[4*d], sk[12*d], rk[44], rkprime[44];

    /* key setup */
    aesKeySetupEnc(rk, key);
    KeySetupEnc(mk, sk, L, Lprime, keyprime, rk, key);
    aesKeySetupEnc(rkprime, keyprime);

    /*PXMAC: process associated data, and save output to V[]*/
    PXMAC(mk, sk, L, V, rk, ad, adlen);

    /*CENC: process nonce, and save output to S[] and F[]*/
    CENC(rkprime, S, F, nonce, ptlen);

    /*mask plaintext by xoring the output S[] of CENC, and save it to I[]*/
    memcpy(I, S, ptlen);
    xor_byte_string(p, I, ptlen);

    /*PXENC: save outputs to Z[] and U[] */
    PXENC(mk, sk, L, V, Z, rk, I, ptlen);
    memcpy(U, V, 16);

    /*XEX: produce the ciphertext*/
    XEXLayerEnc(rk, Lprime, Z, c, ptlen);

    /*generate tag*/
    checksum_state_string(I, checksum, ptlen);
    tagGen(rk, checksum, Lprime, U, F, tag, ptlen);

    /*
    printf("ciphertext is: \n");
    printf_byte_string(c, ptlen);

    printf("tag value is: \n");
    printf_byte_string(tag, 16);
    */

    free(I);
    free(Z);
    free(S);
}

/*SHELL-AES decryption for plaintexts of mutiple blocks long:
parameters follow those of function shellaesEnc
*/
int shellaesDecVef_fb(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 c[], unsigned long long int ctlen, u8 p[], const u8 tag[]){

    u8 V[16], U[16], checksum[16], keyprime[16], F[16], L[16], Lprime[16];

    u8* S;
    u8* I;
    u8* Z;

    S=(u8 *) malloc(ctlen);
    I=(u8 *) malloc(ctlen);
    Z=(u8 *) malloc(ctlen);

    memset(V, 0, 16);
    memset(U, 0, 16);
    memset(checksum, 0, 16);
    memset(keyprime, 0, 16);
    memset(F, 0, 16);
    memset(L, 0, 16);
    memset(Lprime, 0, 16);

    u32 mk[4*d], sk[12*d], isk[12*d], rk[44], irk[44], rkprime[44];

    /*setup key materials*/
    aesKeySetupEnc(rk, key);
    aesKeySetupDec(irk, key);
    KeySetupDec(mk, sk, isk, L, Lprime, keyprime, rk, key);
    aesKeySetupEnc(rkprime, keyprime);

    /*process associated data*/
    PXMAC(mk, sk, L, V, rk, ad, adlen);

    /*decryption of XEX layer*/
    XEXLayerDec(irk, Lprime, c, Z, ctlen);

    /*decryption of PXENC layer*/
    PXDEC(mk, isk, L, V, Z, rk, I, ctlen);

    /*CENC layer*/
    CENC(rkprime, S, F, nonce, ctlen);

    /*produce the plaintext*/
    memcpy(p, S, ctlen);
    xor_byte_string(I, p, ctlen);

    /*verify the validness of tag*/
    int flag;
    memcpy(U, V, 16);
    checksum_state_string(I, checksum, ctlen);

    flag=tagVef(rk, checksum, Lprime, U, F, tag, ctlen);

    /*
    if(flag){
        printf("the plaintext is:\n");
        printf_byte_string(p, ctlen);
    }
    else{
        printf("the tag is invalid!");
    }
    */

    free(I);
    free(S);
    free(Z);

    return flag;

}

/*SHELL-AES decryption for plaintexts with a length longer than one block but not a multiple of block length:
shellaesDec_fb is used to decrypt of the ciphertext without the last non-full block;
parameters follow those of function shellaesEnc
*/
void shellaesDec_fb(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 c[], unsigned long long int ctlen, u8 p[], u8 tag[]){

    u8 V[16], U[16], checksum[16], keyprime[16], F[16], L[16], Lprime[16];

    u8* S;
    u8* I;
    u8* Z;

    S=(u8 *) malloc(ctlen);
    I=(u8 *) malloc(ctlen);
    Z=(u8 *) malloc(ctlen);

    memset(V, 0, 16);
    memset(U, 0, 16);
    memset(checksum, 0, 16);
    memset(keyprime, 0, 16);
    memset(F, 0, 16);
    memset(L, 0, 16);
    memset(Lprime, 0, 16);

    u32 mk[4*d], sk[12*d], isk[12*d], rk[44], irk[44], rkprime[44];

    aesKeySetupEnc(rk, key);
    aesKeySetupDec(irk, key);
    KeySetupDec(mk, sk, isk, L, Lprime, keyprime, rk, key);
    aesKeySetupEnc(rkprime, keyprime);

    PXMAC(mk, sk, L, V, rk, ad, adlen);

    XEXLayerDec(irk, Lprime, c, Z, ctlen);
    PXDEC(mk, isk, L, V, Z, rk, I, ctlen);
    memcpy(U, V, 16);

    checksum_state_string(I, checksum, ctlen);

    CENC(rkprime, S, F, nonce, ctlen);

    memcpy(p, S, ctlen);
    xor_byte_string(I, p, ctlen);

    tagGen(rk, checksum, Lprime, U, F, tag, ctlen);

    free(I);
    free(S);
    free(Z);


}

/*
SHELL-AES encryption for plaintexts shorter than one blocks long:
parameters follow those of function shellaesEnc
*/
void shellaesEnc_short(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 p[], unsigned long long int ptlen, u8 c[], u8 tag[]){

         u8 V[16], F[16], keyprime[16], L[16], Lprime[16], S[16], I[16];

         u32 mk[4*d], sk[12*d], rk[44], rkprime[44];

         u8 pt[16], pt1[16], pt2[16], ct1[16], ct2[16];
         u8 mask[16];
         u8 temp[16];
         int i;

         /*key setup*/
         aesKeySetupEnc(rk, key);
         KeySetupEnc(mk, sk, L, Lprime, keyprime, rk, key);
         aesKeySetupEnc(rkprime, keyprime);

         /*PXMAC: process the associated data and save output to V[]*/
         memset(V, 0, 16);
         PXMAC(mk, sk, L, V, rk, ad, adlen);

         /*CENC: process nonce and save the output to S[] and F[]*/
         CENC(rkprime, S, F, nonce, 16);


         /*pad p[] to a full block and save it to pt[]*/
         memset(pt, 0, 16);
         memcpy(pt, p, ptlen);
         pt[ptlen]=0x80;

         /*mask pt[] by xoring the output S[] of CENC, and save it to I[] */
         memcpy(I, S, 16);
         xor_byte_string(pt, I, 16);

         /*compute 3^3*Lprime and save it to mask[]*/
         memcpy(mask, Lprime, 16);
         for(i=0; i<3; ++i){
            memcpy(temp, mask, 16);
            double_mask(mask);
            xor_byte_string(temp, mask, 16);
         }

         /*compute XEX cipher with tweak of 3^3*Lprime and input I[], and save the output to ct1[]*/

         memcpy(pt1, I, 16);
         xor_byte_string(mask, pt1, 16);
         aesEncrypt(rk, pt1, ct1);
         xor_byte_string(mask, ct1, 16);

         /*compute XEX cipher with tweak of 2*3^3*Lprime and input I[], and save the output to ct2[]*/
         double_mask(mask);
         memcpy(pt2, I, 16);
         xor_byte_string(mask, pt2, 16);
         aesEncrypt(rk, pt2, ct2);
         xor_byte_string(mask, ct2, 16);

         /*compute XEX cipher with tweak of 2^2*3^3*Lprime and input of xoring ct1 and the output V of PX-MAC,
           and save the output to ct1[]*/
         xor_byte_string(ct1, V, 16);
         memcpy(pt1, V, 16);
         double_mask(mask);
         xor_byte_string(mask, pt1, 16);
         aesEncrypt(rk, pt1, ct1);
         xor_byte_string(mask, ct1, 16);

        /*compute XEX cipher with tweak of 2^3*3^3*Lprime and input of xoring ct2 and the updated V,
          and save the output to ct2[]*/
         xor_byte_string(ct2, V, 16);
         memcpy(pt2, V, 16);
         double_mask(mask);
         xor_byte_string(mask, pt2, 16);
         aesEncrypt(rk, pt2, ct2);
         xor_byte_string(mask, ct2, 16);

         /*xor ct2 with the output F of CENC*/
         xor_byte_string(F, ct2, 16);

         /*tag splitting:
         produce the ciphertext and tag from ct1 and ct2*/
         memcpy(c, ct1, ptlen);
         for(i=ptlen; i<16; ++i){
            tag[i-ptlen]=ct1[i];
         }
         for(i=0; i<ptlen; ++i){
            tag[16-ptlen+i]=ct2[i];
         }

        /*
        printf("ciphertext is: \n");
        printf_byte_string(c, ptlen);

        printf("tag value is: \n");
        printf_byte_string(tag, 16);
        */

}

/*
SHELL-AES decryption for plaintexts shorter than one blocks long:
parameters follow those of function shellaesEnc
*/
int shellaesDec_short(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 c[], unsigned long long int ctlen, u8 p[], const u8 tag[]){

    u8 V[16], F[16], keyprime[16], L[16], Lprime[16], S[16], I[16];
    u32 mk[4*d], sk[12*d], rk[44], irk[44], rkprime[44];
    u8  pt1[16], pt2[16], ct1[16], ct2[16];
    u8 mask[16], mask1[16];
    u8 temp[16];

    int i, flag;

    /* key setup */
    aesKeySetupEnc(rk, key);
    KeySetupEnc(mk, sk, L, Lprime, keyprime, rk, key);
    aesKeySetupDec(irk, key);
    aesKeySetupEnc(rkprime, keyprime);

    memset(V, 0, 16);

    /*PX-MAC*/
    PXMAC(mk, sk, L, V, rk, ad, adlen);

    /*derive the block of ciphertext and save it to ct1[]*/

    memcpy(ct1, c, ctlen);
    for(i=ctlen; i<16; ++i){
        ct1[i]=tag[i-ctlen];
    }

    /*produce mask 3^3*Lprime*/
    memcpy(mask, Lprime, 16);
    for(i=0; i<3; ++i){
        memcpy(temp, mask, 16);
        double_mask(mask);
        xor_byte_string(temp, mask, 16);
    }

    /*produce mask 2^2*3^3*Lprime*/
    memcpy(mask1, mask, 16);
    double_mask(mask1);
    double_mask(mask1);

    /*decrypt to obtain I[]*/
    xor_byte_string(mask1, ct1, 16);
    aesDecrypt(irk, ct1, pt1);
    xor_byte_string(mask1, pt1, 16);

    xor_byte_string(V, pt1, 16);
    memcpy(ct1, pt1, 16);

    xor_byte_string(ct1, V, 16);

    xor_byte_string(mask, ct1, 16);
    aesDecrypt(irk, ct1, pt1);
    xor_byte_string(mask, pt1, 16);

    memcpy(I, pt1, 16);

    /*decrypt the plaintext*/
    CENC(rkprime, S, F, nonce, 16);
    xor_byte_string(S, pt1, 16);
    memcpy(p, pt1, ctlen);

    /*verify the validness of tag*/
    memcpy(pt2, I, 16);
    double_mask(mask);

    xor_byte_string(mask, pt2, 16);
    aesEncrypt(rk, pt2, ct2);
    xor_byte_string(mask, ct2, 16);

    xor_byte_string(V, ct2, 16);

    memcpy(pt2, ct2, 16);

    double_mask(mask1);

    xor_byte_string(mask1, pt2, 16);
    aesEncrypt(rk, pt2, ct2);
    xor_byte_string(mask1, ct2, 16);

    xor_byte_string(F, ct2, 16);


    flag=1;

    if(pt1[ctlen]!=0x80){
        flag=0;
    }

    for(i=ctlen+1; i<16; ++i){
        if(pt1[i]!=0){
            flag=0;
        }
    }

    for(i=0; i<ctlen; ++i){
        if(ct2[i]!=tag[i+16-ctlen]){
            flag=0;
        }
    }

    /*
     if(flag){
        printf("the plaintext is:\n");
        printf_byte_string(p, ctlen);
    }
    else{
        printf("the tag is invalid!");
    }
    */

    return flag;
}

/*XLS function to process the non-full last block of plaintexts*/
void XLS(const u32 rk[], const u8 Lprime[], const u8 p[], unsigned long long int fb_ptlen, unsigned int nfb_ptlen, u8 c[], u8 tag[]){
    u8 mask1[16], mask2[16];
    u8 temp[16];
    u8 pt[16], ct[16], byte1[nfb_ptlen], byte2[nfb_ptlen];
    int i;

    /*produce mask 3^2*Lprime, and save it to mask1[]*/
    memcpy(mask1, Lprime, 16);
    for(i=0; i<2; ++i){
        memcpy(temp, mask1, 16);
        double_mask(mask1);
        xor_byte_string(temp, mask1, 16);
    }

    /*produce mask 7^2*Lprime, and save it to mask2[]*/
    memcpy(mask2, Lprime, 16);
    for(i=0; i<2; ++i){
        memcpy(temp, mask2, 16);
        double_mask(mask2);
        xor_byte_string(mask2, temp, 16);
        double_mask(mask2);
        xor_byte_string(temp, mask2, 16);
    }

    /*produce the masks for E' and E'', and save them to mask1[] and mask2[] respectively*/
    while(fb_ptlen!=0){
        double_mask(mask1);
        double_mask(mask2);
        fb_ptlen-=16;
    }
    double_mask(mask1);
    double_mask(mask2);

    /*First round of XLS*/

    memcpy(pt, p, nfb_ptlen);
    memcpy(pt+nfb_ptlen, tag, 16-nfb_ptlen);

    /*apply E'*/
    xor_byte_string(mask1, pt, 16);
    aesEncrypt(rk, pt, ct);
    xor_byte_string(mask1, ct, 16);

    /*flip one bit*/
    ct[15-nfb_ptlen]^=0x01;

    memcpy(byte1, ct+16-nfb_ptlen, nfb_ptlen);
    memcpy(byte2, tag+16-nfb_ptlen, nfb_ptlen);

    /*MIX function*/
    MIX(byte1, byte2, nfb_ptlen);

    memcpy(ct+16-nfb_ptlen, byte1, nfb_ptlen);

    memcpy(pt, ct, 16);

    /*Second round of XLS*/

    /*apply E''*/
    xor_byte_string(mask2, pt, 16);
    aesEncrypt(rk, pt, ct);
    xor_byte_string(mask2, ct, 16);

    ct[15-nfb_ptlen]^=0x01;

    memcpy(byte1, ct+16-nfb_ptlen, nfb_ptlen);
    MIX(byte1, byte2, nfb_ptlen);

    memcpy(ct+16-nfb_ptlen, byte1, nfb_ptlen);
    memcpy(pt, ct, 16);

    /*the third round of XLS*/

    xor_byte_string(mask1, pt, 16);
    aesEncrypt(rk, pt, ct);
    xor_byte_string(mask1, ct, 16);

    /*produce ciphertext and tag*/
    memcpy(c, ct, nfb_ptlen);
    memcpy(tag, ct+nfb_ptlen, 16-nfb_ptlen);
    memcpy(tag+16-nfb_ptlen, byte2, nfb_ptlen);

}

/*inverse of XLS*/
void XLSInv(const u32 irk[], const u8 Lprime[], const u8 c[], unsigned long long fb_ctlen, unsigned int nfb_ctlen, u8 p[], u8 tag[]){
    u8 pt[16], ct[16];
    u8 temp[16];
    u8 mask1[16], mask2[16];
    u8 byte1[nfb_ctlen], byte2[nfb_ctlen];

    int i;

    /*produce mask 3^2*Lprime, and save it to mask1[]*/
    memcpy(mask1, Lprime, 16);
    for(i=0; i<2; ++i){
        memcpy(temp, mask1, 16);
        double_mask(mask1);
        xor_byte_string(temp, mask1, 16);
    }

    /*produce mask 7^2*Lprime, and save it to mask2[]*/
    memcpy(mask2, Lprime, 16);
    for(i=0; i<2; ++i){
        memcpy(temp, mask2, 16);
        double_mask(mask2);
        xor_byte_string(mask2, temp, 16);
        double_mask(mask2);
        xor_byte_string(temp, mask2, 16);
    }

    /*produce the masks for E' and E'', and save them to mask1[] and mask2[] respectively*/
    while(fb_ctlen!=0){
        double_mask(mask1);
        double_mask(mask2);
        fb_ctlen-=16;
    }
    double_mask(mask1);
    double_mask(mask2);

    memcpy(ct, c, nfb_ctlen);
    memcpy(ct+nfb_ctlen, tag, 16-nfb_ctlen);
    memcpy(byte2, tag+16-nfb_ctlen, nfb_ctlen);

    /*the first round */

    xor_byte_string(mask1, ct, 16);
    aesDecrypt(irk, ct, pt);
    xor_byte_string(mask1, pt, 16);

    pt[15-nfb_ctlen]^=0x01;
    memcpy(byte1, pt+16-nfb_ctlen, nfb_ctlen);
    MIX(byte1, byte2, nfb_ctlen);
    memcpy(pt+16-nfb_ctlen, byte1, nfb_ctlen);
    memcpy(ct, pt, 16);

    /*The second round*/

    xor_byte_string(mask2, ct, 16);
    aesDecrypt(irk, ct, pt);
    xor_byte_string(mask2, pt, 16);

    pt[15-nfb_ctlen]^=0x01;
    memcpy(byte1, pt+16-nfb_ctlen, nfb_ctlen);
    MIX(byte1, byte2, nfb_ctlen);

    memcpy(pt+16-nfb_ctlen, byte1, nfb_ctlen);
    memcpy(ct, pt, 16);

    /*the third round */

    xor_byte_string(mask1, ct, 16);
    aesDecrypt(irk, ct, pt);
    xor_byte_string(mask1, pt, 16);

    /*separate the output to plaintext and tag*/
    memcpy(p, pt, nfb_ctlen);
    memcpy(tag, pt+nfb_ctlen, 16-nfb_ctlen);
    memcpy(tag+16-nfb_ctlen, byte2, nfb_ctlen);


}

/*SHELL-AES encryption for plaintexts with a length longer than one block but not a multiple of block length:
parameters follow those of function shellaesEnc
*/
void shellaesEnc_nfb(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 p[], unsigned long long int ptlen, u8 c[], u8 tag[]){

    u8 V[16], U[16], checksum[16], F[16], keyprime[16], L[16], Lprime[16];
    u8* S;
    u8* I;
    u8* Z;

    unsigned long long int pt_fblen;
    unsigned int pt_nfblen;

    pt_nfblen=ptlen%16;
    pt_fblen=ptlen-pt_nfblen;

    S= (u8 *) malloc(ptlen);
    I= (u8 *) malloc(ptlen);
    Z= (u8 *) malloc(pt_fblen);

    memset(V, 0, 16);
    memset(U, 0, 16);
    memset(checksum, 0, 16);
    memset(keyprime, 0, 16);
    memset(F, 0, 16);
    memset(L, 0, 16);
    memset(Lprime, 0, 16);

    u32 mk[4*d], sk[12*d], rk[44], rkprime[44];

    /*key setup*/
    aesKeySetupEnc(rk, key);
    KeySetupEnc(mk, sk, L, Lprime, keyprime, rk, key);
    aesKeySetupEnc(rkprime, keyprime);

    /*process the plaintext except the last non-full block*/
    PXMAC(mk, sk, L, V, rk, ad, adlen);
    CENC(rkprime, S, F, nonce, ptlen);
    memcpy(I, p, ptlen);
    xor_byte_string(S, I, ptlen);
    checksum_state_string(I, checksum, pt_fblen);
    PXENC(mk, sk, L, V, Z, rk, I, pt_fblen);
    memcpy(U, V, 16);
    XEXLayerEnc(rk, Lprime, Z, c, pt_fblen);
    tagGen(rk, checksum, Lprime, U, F, tag, pt_fblen);

    /*XLS: process the last non-full block*/
    XLS(rk, Lprime, p+pt_fblen, pt_fblen, pt_nfblen, c+pt_fblen, tag);

    /*
    printf("ciphertext is: \n");
    printf_byte_string(c, ptlen);

    printf("tag value is: \n");
    printf_byte_string(tag, 16);
    */

    free(I);
    free(Z);
    free(S);

}

/*SHELL-AES decryption for ciphertexts with a length longer than one block but not a multiple of block length:
parameters follow those of function shellaesEnc
*/
int shellaesDec_nfb(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 c[], unsigned long long int ctlen, u8 p[], const u8 tag[]){
    u8 V[16], U[16], checksum[16], F[16], keyprime[16], L[16], Lprime[16];
    u8* S;
    u8* I;
    u8* Z;
    u8 tempTag[16], tempTag2[16];
    int i, flag;

    unsigned long long int ct_fblen;
    unsigned int ct_nfblen;

    ct_nfblen=ctlen%16;
    ct_fblen=ctlen-ct_nfblen;

    S= (u8 *) malloc(ctlen);
    I= (u8 *) malloc(ctlen);
    Z= (u8 *) malloc(ct_fblen);

    memset(V, 0, 16);
    memset(U, 0, 16);
    memset(checksum, 0, 16);
    memset(keyprime, 0, 16);
    memset(F, 0, 16);
    memset(L, 0, 16);
    memset(Lprime, 0, 16);

    u32 mk[4*d], sk[12*d], isk[12*d], rk[44], irk[44], rkprime[44];

    /*setup key*/
    aesKeySetupEnc(rk, key);
    aesKeySetupDec(irk, key);
    KeySetupDec(mk, sk, isk, L, Lprime, keyprime, rk, key);
    aesKeySetupEnc(rkprime, keyprime);

    /*decrypt the last non-full block*/
    memcpy(tempTag, tag, 16);
    XLSInv(irk, Lprime, c+ct_fblen, ct_fblen, ct_nfblen, p+ct_fblen, tempTag);

    /*process associated data*/
    PXMAC(mk, sk, L, V, rk, ad, adlen);

    /*decryption of XEX layer*/
    XEXLayerDec(irk, Lprime, c, Z, ct_fblen);

    /*decryption of PXENC layer*/
    PXDEC(mk, isk, L, V, Z, rk, I, ct_fblen);
    memcpy(U, V, 16);

    /*process nonce*/
    CENC(rkprime, S, F, nonce, ctlen);

    /*produce plaintext*/
    memcpy(p, I, ct_fblen);
    xor_byte_string(S, p, ct_fblen);

    /*verify the validness of tag*/
    checksum_state_string(I, checksum, ct_fblen);
    tagGen(rk, checksum, Lprime, U, F, tempTag2, ct_fblen);

    flag=1;

    for(i=0; i<16; ++i){
        if(tempTag[i]!=tempTag2[i]){
            flag=0;
        }
    }

    /*

    if(flag){
        printf("the plaintext is: \n");
        printf_byte_string(p, ctlen);
    }
    else{
        printf("the tag is invalid!");
    }
    */

    return flag;

}

/*
the encryption procedure of SHELL-AES:
key[] is the secret key;
nonce[] is the nonce;
ad[] is associated data;
adlen is the byte length of associated data;
p[] is the plaintext;
ptlen is the byte length of plaintext;
c[] is the ciphertext to be produced;
ctlen is the byte length of ciphertext.
*/
void shellaesEnc(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 p[], unsigned long long int ptlen, u8 c[], unsigned long long int ctlen){

    u8 tag[16];


    if(ptlen<16){
        /*plaintext is shorter than one block*/
        shellaesEnc_short(key, nonce, ad, adlen, p, ptlen, c, tag);
    }
    else if (ptlen%16==0){
        /*plaintext is multiple blocks long */
        shellaesEnc_fb(key, nonce, ad, adlen, p, ptlen, c, tag);
    }
    else{
         /*plaintext is longer than one block, and has a length that is not a mutiple of block length */
        shellaesEnc_nfb(key, nonce, ad, adlen, p, ptlen, c, tag);
    }

    /*append the tag to ciphertext*/
    memcpy(c+ptlen, tag, 16);

    /*
    printf("the ciphertext and the tag is \n");
    printf_byte_string(c, ctlen);
    */
}

/*
the encryption procedure of SHELL-AES:
parameters follow those of function shellaesEnc
*/
int shellaesDec(const u8 key[], const u8 nonce[], const u8 ad[], unsigned long long int adlen, const u8 c[], unsigned long long int ctlen, u8 p[], unsigned long long int ptlen){

    u8 tag[16];
    int flag;

    memcpy(tag, c+ptlen, 16);

    if(ptlen<16){
        /*plaintext is shorter than one block*/
        flag=shellaesDec_short(key, nonce, ad, adlen, c, ptlen, p, tag);
    }
    else if (ptlen%16==0){
        /*plaintext is multiple blocks long */
        flag=shellaesDecVef_fb(key, nonce, ad, adlen, c, ptlen, p, tag);
    }
    else{
        /*plaintext is longer than one block, and has a length that is not a mutiple of block length */
        flag=shellaesDec_nfb(key, nonce, ad, adlen, c, ptlen, p, tag);
    }

    return flag;
}
