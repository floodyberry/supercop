/* 
// AEZ v1.1 reference code. AEZ info: http://www.cs.ucdavis.edu/~rogaway/aez
//
// ** This version is slow and susceptible to side-channel attacks. **
// ** Do not use for any purpose other than to understand AEZ.      **
//
// Written by Ted Krovetz (ted@krovetz.net). Last modified 10 May 2014.
//
// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.
//
// In jurisdictions that recognize copyright laws, the author or authors
// of this software dedicate any and all copyright interest in the
// software to the public domain. We make this dedication for the benefit
// of the public at large and to the detriment of our heirs and
// successors. We intend this dedication to be an overt act of
// relinquishment in perpetuity of all present and future rights to this
// software under copyright law.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//
// For more information, please refer to <http://unlicense.org/>
*/
#include <stdlib.h>
#include <string.h>

typedef unsigned char byte;

#include "rijndael-alg-fst.h"     /* Defines "u32" type for AES internal key */

/* ------------------------------------------------------------------------- */

static void xor_bytes(byte *d, byte *s1, byte *s2, unsigned n) {
    unsigned i;
    for (i=0; i<n; i++) d[i] = s1[i] ^ s2[i];
}

/* ------------------------------------------------------------------------- */

/* "rijndael-alg-fst.h" has a big-endian data layout.                        */
static void xor_into_round_key(u32 *rk, byte *s) {
    rk[0] ^= ((u32)s[ 0] << 24) | ((u32)s[ 1] << 16) | ((u32)s[ 2] << 8) | s[ 3];
    rk[1] ^= ((u32)s[ 4] << 24) | ((u32)s[ 5] << 16) | ((u32)s[ 6] << 8) | s[ 7];
    rk[2] ^= ((u32)s[ 8] << 24) | ((u32)s[ 9] << 16) | ((u32)s[10] << 8) | s[11];
    rk[3] ^= ((u32)s[12] << 24) | ((u32)s[13] << 16) | ((u32)s[14] << 8) | s[15];
}

/* ------------------------------------------------------------------------- */

static void double_block(byte *b) {
    byte tmp = b[0];
    unsigned i;
    for (i=0; i<15; i++)
        b[i] = (byte)((b[i] << 1) | (b[i+1] >> 7));
    b[15] = (byte)((b[15] << 1) ^ ((tmp >> 7) * 135));
}

/* ------------------------------------------------------------------------- */

static void mult_block(unsigned x, byte *d) {                      /* d = xd */
    byte t[16], r[16]={0};
    memcpy(t,d,16);
    for ( ; x; x>>=1) {
        if (x&1) xor_bytes(r, r, t, 16);
        double_block(t);
    }
    memcpy(d,r,16);
}

/* ------------------------------------------------------------------------- */

static void Variant(byte *K, unsigned jdoublings, unsigned i, unsigned l,
                                        unsigned k, unsigned inv, u32 *dst)
{
    u32 Klong[11*4];
    byte Offset[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    rijndaelKeySetupEnc(Klong, K, 128);
    if (i) {
        byte I[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        rijndaelEncrypt(Klong, 10, I, I);
        mult_block(i, I);
        xor_bytes(Offset,Offset,I,16);
    }
    if (jdoublings) {
        byte J[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1};
        rijndaelEncrypt(Klong, 10, J, J);
        for ( ; jdoublings>0; jdoublings--) double_block(J);
        xor_bytes(Offset,Offset,J,16);
    }
    if (l) {
        byte L[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2};
        rijndaelEncrypt(Klong, 10, L, L);
        mult_block(l, L);
        xor_bytes(Offset,Offset,L,16);
    }
    if (inv)    rijndaelKeySetupDec(Klong, K, 128);
    if (k==0) {
        memcpy(dst, Offset, 16);
    } else if (k==4) {
        memset(dst,0,16); memset(dst+16,0,16);
        if (inv) xor_into_round_key(dst+16, Offset);
        else     xor_into_round_key(dst, Offset);
        memcpy(dst+4,Klong+8,16);
        memcpy(dst+8,Klong+20,16);
        memcpy(dst+12,Klong+32,16);
    } else /* k==10 */ {
        memcpy(dst,Klong,sizeof(Klong));
        xor_into_round_key(dst, Offset);       /* Xor offset into 0th round  */
        xor_into_round_key(dst+40, Offset);    /* Xor offset into 10th round */
    }
}

/* ------------------------------------------------------------------------- */

static void AHash(byte *K, byte *M, unsigned mbytes, byte *result) {
    byte sigma[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    u32 Khash[5*4];
    unsigned j = 1;
    while (mbytes >= 16) {
        byte buf[16];
        Variant(K, (j+7)/8, (j-1)%8 , 0, 4, 0, Khash);
        rijndaelEncrypt(Khash, 4, M, buf);
        xor_bytes(sigma, sigma, buf, 16);
        mbytes -= 16;
        M += 16;
        j += 1;
    }
    if (mbytes) {
        byte buf[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        memcpy(buf, M, mbytes);
        buf[mbytes] = 0x80;
        Variant(K, (j+7)/8, (j-1)%8 , 0, 4, 0, Khash);
        rijndaelEncrypt(Khash, 4, buf, buf);
        xor_bytes(sigma, sigma, buf, 16);
    }
    memcpy(result, sigma, 16);
}

/* ------------------------------------------------------------------------- */

static void AMAC(byte *K, byte *M, unsigned mbytes, unsigned i, byte *result) {
    u32 Kmac[11*4];
    byte buf[16];
    if ( (mbytes == 0) || (mbytes%16 != 0) ) Variant(K, 0, 0, 9+i, 10, 0, Kmac);
    else                                     Variant(K, 0, 0, 4+i, 10, 0, Kmac);
    if (mbytes < 16) {
        memset(buf, 0, 16);
        memcpy(buf, M, mbytes);
        buf[mbytes] = 0x80;
        rijndaelEncrypt(Kmac, 10, buf, result);
    } else if (mbytes == 16) {
        rijndaelEncrypt(Kmac, 10, M, result);
    } else {
        AHash(K, M+16, mbytes-16, buf);
        xor_bytes(buf, buf, M, 16);
        rijndaelEncrypt(Kmac, 10, buf, result);
    }
}

/* ------------------------------------------------------------------------- */

static void CipherMEM(byte *K, byte *T, unsigned tbytes, byte *in,
                                unsigned inbytes, unsigned inv, byte *out) {
    u32 Kmac[11*4], Kecb[11*4];
    byte X0[16], Y0[16], Delta[16], buf[16], Ki[16];
    byte *out_orig = out;                    /* Need access to out[0] later */
    unsigned inbytes_orig = inbytes, i = 1;
    AMAC(K, T, tbytes, 0, Delta);
    xor_bytes(in,in,Delta,16);
    AMAC(K, in, inbytes, 1, X0);
    xor_bytes(in,in,Delta,16);
    Variant(K, 0, 0, 1, 10, inv, Kecb);
    if (inv) rijndaelDecrypt(Kecb, 10, X0, Y0);
    else     rijndaelEncrypt(Kecb, 10, X0, Y0);
    in+=16, out+=16, inbytes-=16;
    while (inbytes >= 32) {
        Variant(K, (i+7)/8, (i-1)%8, 0, 0, 0, (u32 *)Ki);
        xor_bytes(buf,in,X0,16); xor_bytes(buf,buf,Ki,16);
        if (inv) rijndaelDecrypt(Kecb, 10, buf, buf);
        else     rijndaelEncrypt(Kecb, 10, buf, buf);
        xor_bytes(buf,buf,Y0,16); xor_bytes(out,buf,Ki,16);
        in+=16, out+=16, inbytes-=16; i+=1;
    }
    if (inbytes==16) {
        Variant(K, (i+7)/8, (i-1)%8, 0, 0, 0, (u32 *)Ki);
        xor_bytes(buf,in,X0,16); xor_bytes(buf,buf,Ki,16);
        if (inv) rijndaelDecrypt(Kecb, 10, buf, buf);
        else     rijndaelEncrypt(Kecb, 10, buf, buf);
        xor_bytes(buf,buf,Y0,16); xor_bytes(out,buf,Ki,16);
        Variant(K, 0, 0, 5, 10, 1, Kmac);
    } else if ((i==1) && (inbytes < 16)) {   /* Original in 17..31 bytes */
        Variant(K, (i+7)/8, (i-1)%8, 0, 0, 0, (u32 *)Ki);
        memcpy(buf,Y0,inbytes%16);                       
        xor_bytes(Y0,in,X0,inbytes%16); xor_bytes(Y0,Y0,Ki,inbytes%16);
        if (inv) rijndaelDecrypt(Kecb, 10, Y0, Y0);
        else     rijndaelEncrypt(Kecb, 10, Y0, Y0);
        xor_bytes(buf,buf,Y0,inbytes%16); xor_bytes(out,buf,Ki,inbytes%16);
        Variant(K, 0, 0, 10, 10, 1, Kmac);
    } else {                       /* Longer in, 17..31 byte tail */
        byte Kpenult[16], Kult[16];
        Variant(K, (i+7)/8, (i-1)%8, 0, 0, 0, (u32 *)Kpenult);
        Variant(K, (i+8)/8, i%8, 0, 0, 0, (u32 *)Kult);
        /* Process last partial ciphertext block */
        xor_bytes(buf,in,X0,16); xor_bytes(buf,buf,Kpenult,16);
        if (inv) rijndaelDecrypt(Kecb, 10, buf, buf);
        else     rijndaelEncrypt(Kecb, 10, buf, buf);
        xor_bytes(buf,buf,Y0,inbytes%16); xor_bytes(out+16,buf,Kult,inbytes%16);
        /* Process last full ciphertext block */
        xor_bytes(buf,in+16,X0,inbytes%16); xor_bytes(buf,buf,Kult,inbytes%16);
        if (inv) rijndaelDecrypt(Kecb, 10, buf, buf);
        else     rijndaelEncrypt(Kecb, 10, buf, buf);
        xor_bytes(buf,buf,Y0,16); xor_bytes(out,buf,Kpenult,16);
        Variant(K, 0, 0, 10, 10, 1, Kmac);
    }
    /* Write C0 */
    rijndaelDecrypt(Kmac, 10, Y0, Y0);
    AHash(K, out_orig+16, inbytes_orig-16, buf);
    xor_bytes(buf, buf, Y0, 16);
    xor_bytes(out_orig, buf, Delta, 16);
}

/* ------------------------------------------------------------------------- */

static void complement_if_needed(byte *Delta, unsigned numbytes,
                                                        byte *src, byte *dst) {
    byte comp[16], and_sum=0xff, or_sum=0x00;
    unsigned i;
    for (i=0; i<numbytes; i++) {
        and_sum &= src[i];
        or_sum |= src[i];
        comp[i] = (byte)~src[i];
    }
    unsigned delta_bit = ( Delta[(numbytes-1)/8] >> ((16-numbytes)%8) ) & 1;
    if ( (delta_bit + (and_sum==0xff) + (or_sum==0x00)) == 2 )
         memcpy(dst,comp,numbytes);
    else memcpy(dst,src,numbytes);
}

static void CipherFF0(byte *K, byte *T, unsigned tbytes, byte *in,
                                unsigned inbytes, unsigned inv, byte *out) {
    unsigned rounds,i;
    u32 Kff0[5*4];
    byte mask=0x00, pad=0x80, Delta[16], front[16], back[16], buf[16], *A, *B;
    Variant(K, 0, 0, 2, 4, 0, Kff0);
    AMAC(K, T, tbytes, 2, Delta);
    if (inv) { complement_if_needed(Delta, inbytes, in, buf); in=buf; }
    if (inbytes==1) rounds=24; else if (inbytes==2) rounds=16; else rounds=10;
    /* Split (inbytes*8)/2 bits into A and B. Beware: May end in nibble. */
    memcpy(front, in,          (inbytes+1)/2);
    memcpy(back, in+inbytes/2, (inbytes+1)/2);
    if (inbytes&1) {
        for (i=0; i<inbytes/2; i++)
            back[i] = (byte)((back[i] << 4) | (back[i+1] >> 4));
        back[inbytes/2] = (byte)(back[inbytes/2] << 4);
        pad = 0x08; mask = 0xf0;
    }
    if (inv) { B=front; A=back; } else { A=front; B=back; }
    for (i=1; i<rounds; i+=2) {
        memset(buf, 0, 16);
        buf[3] = (byte)(inv ? rounds+1-i : i);
        memcpy(buf+4,B,(inbytes+1)/2);
        buf[4+inbytes/2] = (buf[4+inbytes/2] & mask) | pad;
        xor_bytes(buf, buf, Delta, 16);
        rijndaelEncrypt(Kff0, 4, buf, buf);
        xor_bytes(A, A, buf, 16);

        memset(buf, 0, 16);
        buf[3] = (byte)(inv ? rounds-i : i+1);
        memcpy(buf+4,A,(inbytes+1)/2);
        buf[4+inbytes/2] = (buf[4+inbytes/2] & mask) | pad;
        xor_bytes(buf, buf, Delta, 16);
        rijndaelEncrypt(Kff0, 4, buf, buf);
        xor_bytes(B, B, buf, 16);
    }
    memcpy(buf,           front, inbytes/2);
    memcpy(buf+inbytes/2, back, (inbytes+1)/2);
    if (inbytes&1) {
        for (i=inbytes-1; i>inbytes/2; i--)
            buf[i] = (byte)((buf[i] >> 4) | (buf[i-1] << 4));
        buf[inbytes/2] = (byte)((back[0] >> 4) | (front[inbytes/2] & mask));
    }
    if (inv) memcpy(out,buf,inbytes);
    else complement_if_needed(Delta, inbytes, buf, out);
}

/* ------------------------------------------------------------------------- */

static void Cipher(byte *K, byte *T, unsigned tbytes, byte *in,
                                unsigned inbytes, unsigned inv, byte *out) {
    if (inbytes == 0) return;
    if (inbytes < 16) CipherFF0(K, T, tbytes, in, inbytes, inv, out);
    if (inbytes > 16) CipherMEM(K, T, tbytes, in, inbytes, inv, out);
    if (inbytes == 16) {
        byte Delta[16], buf[16];
        u32 Kone[11*4];
        Variant(K, 0, 0, 3, 10, inv, Kone);
        AMAC(K, T, tbytes, 3, Delta);
        xor_bytes(buf, in, Delta, 16);
        if (inv) rijndaelDecrypt(Kone, 10, buf, buf);
        else     rijndaelEncrypt(Kone, 10, buf, buf);
        xor_bytes(out, buf, Delta, 16);
    }
}

/* ------------------------------------------------------------------------- */

static void ExtractKey(byte *Key, unsigned kbytes, byte *result) {
    byte CONST1[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
         CONST2[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
         CONST3[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3},
         CONST4[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4},
         aez_constant_aez_const[] = "AEZ-Constant-AEZ";
    byte K[16], buf[16];
    u32 rks[11*4];
    rijndaelKeySetupEnc(rks, aez_constant_aez_const, 128);
    if (kbytes == 16) {
        rijndaelEncrypt(rks, 10, CONST1, CONST1);
        xor_bytes(result, Key, CONST1, 16);
    } else {
        rijndaelEncrypt(rks, 10, CONST2, CONST2);
        rijndaelEncrypt(rks, 10, CONST3, CONST3);
        rijndaelEncrypt(rks, 10, CONST4, CONST4);
        rijndaelKeySetupEnc(rks, CONST4, 128);
        memset(K,0,16);
        for ( ; kbytes > 16; kbytes -=16, Key+= 16) {
            xor_bytes(K, K, Key, 16);
            rijndaelEncrypt(rks, 10, K, K);
        }
        if (kbytes < 16) {
            memcpy(buf, Key, kbytes);
            memset(buf+kbytes+1, 0, 15-kbytes);
            buf[kbytes] = 0x80;
            xor_bytes(buf, buf, CONST3, 16);
        } else
            xor_bytes(buf, Key, CONST2, 16);
        xor_bytes(K, K, buf, 16);
        rijndaelEncrypt(rks, 10, K, result);
    }
}

/* ------------------------------------------------------------------------- */

static void Format(byte *N, unsigned nbytes, byte *AD, unsigned adbytes,
                                unsigned abytes, byte **T, unsigned *tbytes) {
    if (nbytes <= 12) {
        byte *res = (byte *)malloc(adbytes+16);
        memset(res,0,16);
        res[0] = (byte)(nbytes == 12 ? abytes | 0x40 : abytes);
        memcpy(res+4, N, nbytes);
        if (nbytes < 12) res[nbytes+4] = 0x80;
        memcpy(res+16, AD, adbytes);
        *tbytes = adbytes+16;
        *T = res;
    } else {
        unsigned padbytes = 16 - (adbytes % 16);
        byte *res = (byte *)malloc(5+nbytes+adbytes+padbytes);
        res[0] = (byte)(abytes | 0x80);
        res[1] = res[2] = res[3] = 0;
        memcpy(res+4, N, 12);
        memcpy(res+16, AD, adbytes);
        res[16+adbytes] = 0x80;
        memset(res+16+adbytes+1,0,padbytes-1);
        memcpy(res+16+adbytes+padbytes,N+12,nbytes-12);
        res[4+nbytes+adbytes+padbytes] = (byte)nbytes;
        *tbytes = 5+nbytes+adbytes+padbytes;
        *T = res;
    }
}

/* ------------------------------------------------------------------------- */

int Decrypt(byte *Key, unsigned kbytes, byte *N, unsigned nbytes, byte *AD,
        unsigned adbytes, byte *C, unsigned cbytes, unsigned abytes, byte *M) {
    byte K[16], *T, *X, sum=0;
    unsigned tbytes,i;
    if (cbytes < abytes) return 0;
    ExtractKey(Key, kbytes, K);
    X = (byte *)malloc(cbytes);
    Format(N, nbytes, AD, adbytes, abytes, &T, &tbytes);
    if (cbytes==abytes) {
        byte buf[16];
        AMAC(K, T, tbytes, 4, buf);
        for (i=0; i<abytes; i++) sum |= (buf[i] ^ C[i]);
    } else {
        Cipher(K, T, tbytes, C, cbytes, 1, X);
        for (i=0; i<abytes; i++) sum |= X[cbytes-abytes+i];
        if (sum==0) memcpy(M,X,cbytes-abytes);
    }
    free(T);
    free(X);
    return (sum == 0 ? 0 : -1);  /* return 0 if valid, -1 if invalid */
}

/* ------------------------------------------------------------------------- */

void Encrypt(byte *Key, unsigned kbytes, byte *N, unsigned nbytes, byte *AD,
        unsigned adbytes, byte *M, unsigned mbytes, unsigned abytes, byte *C) {
    byte K[16], buf[16], *T, *X;
    unsigned tbytes;
    ExtractKey(Key, kbytes, K);
    X = (byte *)malloc(mbytes+abytes);
    memcpy(X, M, mbytes); memset(X+mbytes,0,abytes);
    Format(N, nbytes, AD, adbytes, abytes, &T, &tbytes);
    if (mbytes==0) {
        AMAC(K, T, tbytes, 4, buf);
        memcpy(C,buf,abytes);
    } else
        Cipher(K, T, tbytes, X, mbytes+abytes, 0, C);
    free(T);
    free(X);
}

/* ------------------------------------------------------------------------- */

