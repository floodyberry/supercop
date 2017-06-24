/*
// AEZ v4.1 reference code. AEZ info: http://www.cs.ucdavis.edu/~rogaway/aez
//
// ** This version is slow and susceptible to side-channel attacks. **
// ** Do not use for any purpose other than to understand AEZ.      **
//
// Written by Ted Krovetz (ted@krovetz.net). Last modified 19 July 2016.
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
/* BLAKE2b384 is used in Extract(). We use Saarinen's reference version      */
/* http://github.com/mjosaarinen/blake2_mjosref  (accessed 02SEP2015)        */
#include "blake2b.h"
/* We us Rijmen, Bosselaers and Barreto's AES reference code, with           */
/* rijndael-alg-fst.h modified to define INTERMEDIATE_VALUE_KAT. This gives  */
/* access to AES4 and AES10, and allows the forcing of MixColumns in the     */
/* final round. It also defines "u32", used for internal AES keys.           */
#include "rijndael-alg-fst.h"
#include "crypto_aead.h"

typedef unsigned char byte;

/* ------------------------------------------------------------------------- */

static void write32_big_endian(unsigned x, void *ptr) {
    byte *p = (byte *)ptr;
    p[0] = (byte)(x>>24); p[1] = (byte)(x>>16);
    p[2] = (byte)(x>> 8); p[3] = (byte)(x>> 0);
}

/* ------------------------------------------------------------------------- */

/* Adjust our constructed round keys to be compatible with rijndael-alg-fst  */
static void correct_key(u32 *p, unsigned nbytes) {
    unsigned i;
    for (i=0; i<nbytes/4; i++) write32_big_endian(p[i], p+i);
}

/* ------------------------------------------------------------------------- */

static void xor_bytes(byte *src1, byte *src2, unsigned n, byte *dst) {
    while (n) { n--; dst[n] = src1[n] ^ src2[n]; }
}

/* ------------------------------------------------------------------------- */

static void double_block(byte *p) {
    byte i, tmp = p[0];
    for (i=0; i<15; i++)
        p[i] = (p[i] << 1) | (p[i+1] >> 7);
    p[15] = (p[15] << 1) ^ ((tmp >> 7)?135:0);
}

/* ------------------------------------------------------------------------- */

static void mult_block(unsigned x, byte *src, byte *dst) {
    byte t[16], r[16];
    memcpy(t,src,16); memset(r,0,16);
    while (x != 0) {
        if (x&1) xor_bytes(r,t,16,r);
        double_block(t);
        x>>=1;
    }
    memcpy(dst,r,16);
}

/* ------------------------------------------------------------------------- */

static void Extract(byte *K, unsigned kbytes, byte extracted_key[3*16]) {
    if (kbytes==48) memcpy(extracted_key, K, 48);
    else            blake2b(extracted_key, 48, NULL, 0, K, kbytes);
}

/* ------------------------------------------------------------------------- */

static void E(byte *K, unsigned kbytes, int j, unsigned i,
                                                byte src[16], byte dst[16]) {
    byte extracted_key[3*16], buf[16], delta[16], I[16], J[16], L[16];

    Extract(K, kbytes, extracted_key);
    memcpy(I,extracted_key,16);
    memcpy(J,extracted_key+16,16);
    memcpy(L,extracted_key+32,16);

    /* Encipher */
    if (j == -1) {
        u32 aes_key[4*11];
        memset(aes_key,0,16);                                  /* 0        */
        memcpy((byte*)aes_key+ 16, extracted_key, 48);         /* I J L    */
        correct_key(aes_key+4,3*16);
        memcpy((byte*)aes_key+ 64, (byte*)aes_key+16, 48);     /* I J L    */
        memcpy((byte*)aes_key+112, (byte*)aes_key+16, 48);     /* I J L    */
        memcpy((byte*)aes_key+160, (byte*)aes_key+16, 16);     /* I        */
        mult_block(i,J,buf); xor_bytes(buf,src,16,buf);
        rijndaelEncryptRound(aes_key, 99, buf, 10); /*incl final MixColumns*/
    } else {
        u32 aes4_key[4*5];
	    memset(aes4_key,0,16);
        if (j==2) {
        	memcpy((byte*)aes4_key+16, L, 16);
        	memcpy((byte*)aes4_key+32, I, 16);
        	memcpy((byte*)aes4_key+48, J, 16);
        	memcpy((byte*)aes4_key+64, L, 16);
        } else {
        	memcpy((byte*)aes4_key+16, J, 16);
        	memcpy((byte*)aes4_key+32, I, 16);
        	memcpy((byte*)aes4_key+48, L, 16);
	        memset((byte*)aes4_key+64,0,16);
        }
        correct_key(aes4_key+4,4*16);
        if (j==0) {
        	mult_block(i,I,buf); xor_bytes(buf, src, 16, buf);
        	rijndaelEncryptRound(aes4_key, 99, buf, 4);
        } else if (j==1 || j==2) {
        	mult_block((i-1)%8,I,delta);
        	for (i=3+(i-1)/8; i>0; i--) mult_block(2,I,I);
        	xor_bytes(delta, I, 16, delta);
        	xor_bytes(delta, src, 16, buf);
        	rijndaelEncryptRound(aes4_key, 99, buf, 4);
        } else if (j>=3 && i==0) {
        	mult_block(1<<(j-3),L,delta); xor_bytes(delta, src, 16, buf);
        	rijndaelEncryptRound(aes4_key, 99, buf, 4);
        	xor_bytes(buf, delta, 16, buf);
        } else {
        	mult_block(1<<(j-3),L,delta);
        	mult_block((i-1)%8,J,buf); xor_bytes(delta, buf, 16, delta);
        	for (i=3+(i-1)/8; i>0; i--) mult_block(2,J,J);
        	xor_bytes(delta, J, 16, delta);
        	xor_bytes(src, delta, 16, buf);
        	rijndaelEncryptRound(aes4_key, 99, buf, 4);
        	xor_bytes(buf, delta, 16, buf);
        }
    }
    memcpy(dst, buf, 16);
}

/* ------------------------------------------------------------------------- */

static void AEZhash(byte *K, unsigned kbytes, byte *N, unsigned nbytes,
    byte *A[], unsigned abytes[], unsigned veclen, unsigned tau, byte *result) {

    byte buf[16], sum[16], *p;
    unsigned i, k, bytes, empty;

    /* Initialize sum with hash of tau */
    memset(buf,0,12); write32_big_endian(tau, buf+12);
    E(K,kbytes,3,1,buf,sum);

    /* Hash nonce, accumulate into sum */
    empty = (nbytes==0);
    for (i=1; nbytes>=16; i++, nbytes-=16, N+=16) {
        E(K,kbytes,4,i,N,buf); xor_bytes(sum, buf, 16, sum);
    }
    if (nbytes || empty) {
        memset(buf,0,16); memcpy(buf,N,nbytes); buf[nbytes]=0x80;
        E(K,kbytes,4,0,buf,buf);
        xor_bytes(sum, buf, 16, sum);
    }

    /* Hash each vector element, accumulate into sum */
    for (k=0; k<veclen; k++) {
        p = A[k]; bytes = abytes[k]; empty = (bytes==0);
        for (i=1; bytes>=16; i++, bytes-=16, p+=16) {
            E(K,kbytes,5+k,i,p,buf); xor_bytes(sum, buf, 16, sum);
        }
        if (bytes || empty) {
            memset(buf,0,16); memcpy(buf,p,bytes); buf[bytes]=0x80;
            E(K,kbytes,5+k,0,buf,buf);
            xor_bytes(sum, buf, 16, sum);
        }
    }
    memcpy(result,sum,16);
}

/* ------------------------------------------------------------------------- */

static void AEZprf(byte *K, unsigned kbytes, byte delta[16],
                                        unsigned bytes, byte *result) {

    byte buf[16], ctr[16];
    memset(ctr,0,16);
    for ( ; bytes >= 16; bytes-=16, result+=16) {
        unsigned i=15;
        xor_bytes(delta, ctr, 16, buf);
        E(K,kbytes,-1,3,buf,result);
        do { ctr[i]++; i--; } while (ctr[i+1]==0);   /* ctr+=1 */
    }
    if (bytes) {
        xor_bytes(delta, ctr, 16, buf);
        E(K,kbytes,-1,3,buf,buf);
        memcpy(result, buf, bytes);
    }
}

/* ------------------------------------------------------------------------- */

/* Set d=0 for EncipherAEZcore and d=1 for DecipherAEZcore */
static void AEZcore(byte *K, unsigned kbytes, byte delta[16],
                        byte *in, unsigned inbytes, unsigned d, byte *out) {
    byte tmp[16], X[16], Y[16], S[16];
    byte *in_orig = in, *out_orig = out;
    unsigned i, inbytes_orig = inbytes;

    memset(X,0,16); memset(Y,0,16);

    /* Pass 1 over in[0:-32], store intermediate values in out[0:-32] */
    for (i=1; inbytes >= 64; i++, inbytes-=32, in+=32, out+=32) {
        E(K, kbytes, 1, i, in+16, tmp); xor_bytes(in, tmp, 16, out);
        E(K, kbytes, 0, 0, out, tmp); xor_bytes(in+16, tmp, 16, out+16);
        xor_bytes(out+16, X, 16, X);
    }

    /* Finish X calculation */
    inbytes -= 32;                /* inbytes now has fragment length 0..31 */
    if (inbytes >= 16) {
        E(K, kbytes, 0, 4, in, tmp); xor_bytes(X, tmp, 16, X);
        inbytes -= 16; in += 16; out += 16;
        memset(tmp,0,16); memcpy(tmp,in,inbytes); tmp[inbytes] = 0x80;
        E(K, kbytes, 0, 5, tmp, tmp); xor_bytes(X, tmp, 16, X);
    } else if (inbytes > 0) {
        memset(tmp,0,16); memcpy(tmp,in,inbytes); tmp[inbytes] = 0x80;
        E(K, kbytes, 0, 4, tmp, tmp); xor_bytes(X, tmp, 16, X);
    }
    in += inbytes; out += inbytes;

    /* Calculate S */
    E(K, kbytes, 0, 1+d, in+16, tmp);
    xor_bytes(X, in, 16, out);
    xor_bytes(delta, out, 16, out);
    xor_bytes(tmp, out, 16, out);
    E(K, kbytes, -1, 1+d, out, tmp);
    xor_bytes(in+16, tmp, 16, out+16);
    xor_bytes(out, out+16, 16, S);

    /* Pass 2 over intermediate values in out[32..]. Final values written */
    inbytes = inbytes_orig; out = out_orig; in = in_orig;
    for (i=1; inbytes >= 64; i++, inbytes-=32, in+=32, out+=32) {
        E(K, kbytes, 2, i, S, tmp);
        xor_bytes(out, tmp, 16, out); xor_bytes(out+16, tmp, 16, out+16);
        xor_bytes(out, Y, 16, Y);
        E(K, kbytes, 0, 0, out+16, tmp); xor_bytes(out, tmp, 16, out);
        E(K, kbytes, 1, i, out, tmp); xor_bytes(out+16, tmp, 16, out+16);
        memcpy(tmp, out, 16); memcpy(out, out+16, 16); memcpy(out+16, tmp, 16);
    }

    /* Finish Y calculation and finish encryption of fragment bytes */
    inbytes -= 32;                /* inbytes now has fragment length 0..31 */
    if (inbytes >= 16) {
        E(K, kbytes, -1, 4, S, tmp); xor_bytes(in, tmp, 16, out);
        E(K, kbytes, 0, 4, out, tmp); xor_bytes(Y, tmp, 16, Y);
        inbytes -= 16; in += 16; out += 16;
        E(K, kbytes, -1, 5, S, tmp); xor_bytes(in, tmp, inbytes, tmp);
        memcpy(out,tmp,inbytes);
        memset(tmp+inbytes,0,16-inbytes); tmp[inbytes] = 0x80;
        E(K, kbytes, 0, 5, tmp, tmp); xor_bytes(Y, tmp, 16, Y);
    } else if (inbytes > 0) {
        E(K, kbytes, -1, 4, S, tmp); xor_bytes(in, tmp, inbytes, tmp);
        memcpy(out,tmp,inbytes);
        memset(tmp+inbytes,0,16-inbytes); tmp[inbytes] = 0x80;
        E(K, kbytes, 0, 4, tmp, tmp); xor_bytes(Y, tmp, 16, Y);
    }
    in += inbytes; out += inbytes;

    /* Finish encryption of last two blocks */
    E(K, kbytes, -1, 2-d, out+16, tmp);
    xor_bytes(out, tmp, 16, out);
    E(K, kbytes, 0, 2-d, out, tmp);
    xor_bytes(tmp, out+16, 16, out+16);
    xor_bytes(delta, out+16, 16, out+16);
    xor_bytes(Y, out+16, 16, out+16);
    memcpy(tmp, out, 16); memcpy(out, out+16, 16); memcpy(out+16, tmp, 16);
}

/* ------------------------------------------------------------------------- */

/* Set d=0 for EncipherAEZtiny and d=1 for DecipherAEZtiny */
static void AEZtiny(byte *K, unsigned kbytes, byte delta[16],
                        byte *in, unsigned inbytes, unsigned d, byte *out) {
    unsigned rounds,i=7,j,k;
    int step;
    byte mask=0x00, pad=0x80, L[16], R[16], buf[32];
    if      (inbytes==1) rounds=24;
    else if (inbytes==2) rounds=16;
    else if (inbytes<16) rounds=10;
    else {          i=6; rounds=8; }
    /* Split (inbytes*8)/2 bits into L and R. Beware: May end in nibble. */
    memcpy(L, in,           (inbytes+1)/2);
    memcpy(R, in+inbytes/2, (inbytes+1)/2);
    if (inbytes&1) {                     /* Must shift R left by half a byte */
        for (k=0; k<inbytes/2; k++)
            R[k] = (byte)((R[k] << 4) | (R[k+1] >> 4));
        R[inbytes/2] = (byte)(R[inbytes/2] << 4);
        pad = 0x08; mask = 0xf0;
    }
    if (d) {
        if (inbytes < 16) {
            memset(buf,0,16); memcpy(buf,in,inbytes); buf[0] |= 0x80;
            xor_bytes(delta, buf, 16, buf);
            E(K, kbytes,0,3,buf,buf);
            L[0] ^= (buf[0] & 0x80);
        }
        j = rounds-1; step = -1;
    } else {
        j = 0; step = 1;
    }
    for (k=0; k<rounds/2; k++,j=(unsigned)((int)j+2*step)) {
        memset(buf, 0, 16);
        memcpy(buf,R,(inbytes+1)/2);
        buf[inbytes/2] = (buf[inbytes/2] & mask) | pad;
        xor_bytes(buf, delta, 16, buf);
        buf[15] ^= (byte)j;
        E(K, kbytes,0,i,buf,buf);
        xor_bytes(L, buf, 16, L);

        memset(buf, 0, 16);
        memcpy(buf,L,(inbytes+1)/2);
        buf[inbytes/2] = (buf[inbytes/2] & mask) | pad;
        xor_bytes(buf, delta, 16, buf);
        buf[15] ^= (byte)((int)j+step);
        E(K, kbytes,0,i,buf,buf);
        xor_bytes(R, buf, 16, R);
    }
    memcpy(buf,           R, inbytes/2);
    memcpy(buf+inbytes/2, L, (inbytes+1)/2);
    if (inbytes&1) {
        for (k=inbytes-1; k>inbytes/2; k--)
            buf[k] = (byte)((buf[k] >> 4) | (buf[k-1] << 4));
        buf[inbytes/2] = (byte)((L[0] >> 4) | (R[inbytes/2] & 0xf0));
    }
    memcpy(out,buf,inbytes);
    if ((inbytes < 16) && !d) {
        memset(buf+inbytes,0,16-inbytes); buf[0] |= 0x80;
        xor_bytes(delta, buf, 16, buf);
        E(K, kbytes,0,3,buf,buf);
        out[0] ^= (buf[0] & 0x80);
    }
}

/* ------------------------------------------------------------------------- */

static void Encipher(byte *K, unsigned kbytes, byte delta[16],
                                    byte *in, unsigned inbytes, byte *out) {
    if (inbytes == 0) return;
    if (inbytes < 32) AEZtiny(K, kbytes, delta, in, inbytes, 0, out);
    else              AEZcore(K, kbytes, delta, in, inbytes, 0, out);
}

/* ------------------------------------------------------------------------- */

static void Decipher(byte *K, unsigned kbytes, byte delta[16],
                                    byte *in, unsigned inbytes, byte *out) {
    if (inbytes == 0) return;
    if (inbytes < 32) AEZtiny(K, kbytes, delta, in, inbytes, 1, out);
    else              AEZcore(K, kbytes, delta, in, inbytes, 1, out);
}

/* ------------------------------------------------------------------------- */

int Decrypt(byte *K, unsigned kbytes,
            byte *N, unsigned nbytes,
            byte *AD[], unsigned adbytes[],
            unsigned veclen, unsigned abytes,
            byte *C, unsigned cbytes, byte *M) {
    byte delta[16], *X, sum=0;
    unsigned i;
    if (cbytes < abytes) return -1;
    AEZhash(K, kbytes, N, nbytes, AD, adbytes, veclen, abytes*8, delta);
    X = (byte *)malloc(cbytes);
    if (cbytes==abytes) {
        AEZprf(K, kbytes, delta, abytes, X);
        for (i=0; i<abytes; i++) sum |= (X[i] ^ C[i]);
    } else {
        Decipher(K, kbytes, delta, C, cbytes, X);
        for (i=0; i<abytes; i++) sum |= X[cbytes-abytes+i];
        if (sum==0) memcpy(M,X,cbytes-abytes);
    }
    free(X);
    return (sum == 0 ? 0 : -1);  /* return 0 if valid, -1 if invalid */
}

/* ------------------------------------------------------------------------- */

void Encrypt(byte *K, unsigned kbytes,
             byte *N, unsigned nbytes,
             byte *AD[], unsigned adbytes[],
             unsigned veclen, unsigned abytes,
             byte *M, unsigned mbytes, byte *C) {
    byte delta[16], *X;
    AEZhash(K, kbytes, N, nbytes, AD, adbytes, veclen, abytes*8, delta);
    if (mbytes==0) {
        AEZprf(K, kbytes, delta, abytes, C);
    } else {
        X = (byte *)malloc(mbytes+abytes);
        memcpy(X, M, mbytes); memset(X+mbytes,0,abytes);
        Encipher(K, kbytes, delta, X, mbytes+abytes, X);
        memcpy(C, X, mbytes+abytes);
        free(X);
    }
}

/* ------------------------------------------------------------------------- */
/* aez mapping for CAESAR competition                                        */

int crypto_aead_encrypt(
    unsigned char *c,unsigned long long *clen,
    const unsigned char *m,unsigned long long mlen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k
)
{
    byte *AD[] = {(byte*)ad};
    unsigned adbytes[] = {(unsigned)adlen};
    (void)nsec;
    if (clen) *clen = mlen+16;
    Encrypt((byte*)k, 48, (byte*)npub, 12, AD,
                adbytes, 1, 16, (byte*)m, mlen, (byte*)c);
    return 0;
}

int crypto_aead_decrypt(
    unsigned char *m,unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c,unsigned long long clen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k
)
{
    byte *AD[] = {(byte*)ad};
    unsigned adbytes[] = {(unsigned)adlen};
    (void)nsec;
    if (mlen) *mlen = clen-16;
    return Decrypt((byte*)k, 48, (byte*)npub, 12, AD,
                    adbytes, 1, 16, (byte*)c, clen, (byte*)m);
}

