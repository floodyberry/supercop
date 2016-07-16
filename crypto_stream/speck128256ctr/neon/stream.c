//NEON C code for Speck128/256

/***************************************************************************************
 ** DISCLAIMER.  THIS SOFTWARE WAS WRITTEN BY EMPLOYEES OF THE U.S.
 ** GOVERNMENT AS A PART OF THEIR OFFICIAL DUTIES AND, THEREFORE, IS NOT
 ** PROTECTED BY COPYRIGHT.  THE U.S. GOVERNMENT MAKES NO WARRANTY, EITHER
 ** EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY IMPLIED WARRANTIES
 ** OF MERCANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, REGARDING THIS SOFTWARE.
 ** THE U.S. GOVERNMENT FURTHER MAKES NO WARRANTY THAT THIS SOFTWARE WILL NOT
 ** INFRINGE ANY OTHER UNITED STATES OR FOREIGN PATENT OR OTHER
 ** INTELLECTUAL PROPERTY RIGHT.  IN NO EVENT SHALL THE U.S. GOVERNMENT BE
 ** LIABLE TO ANYONE FOR COMPENSATORY, PUNITIVE, EXEMPLARY, SPECIAL,
 ** COLLATERAL, INCIDENTAL, CONSEQUENTIAL, OR ANY OTHER TYPE OF DAMAGES IN
 ** CONNECTION WITH OR ARISING OUT OF COPY OR USE OF THIS SOFTWARE.
 ***************************************************************************************/


#include <stdio.h>
#include <stdlib.h>
#include "Speck128256NEON.h"


int crypto_stream_speck128256ctr_neon(
  unsigned char *out,
  unsigned long long outlen,
  const unsigned char *n,
  const unsigned char *k
)
{
  int i;
  u64 nonce[2], K[4], key[34],A,B,C,D,x,y;
  unsigned char block[16];
  u128 rk[34];

  if (!outlen) return 0;

  nonce[0]=((u64 *)n)[0];
  nonce[1]=((u64 *)n)[1];

  for(i=0;i<numkeywords;i++) K[i]=((u64 *)k)[i];

  if (outlen<=16){
    D=K[3]; C=K[2]; B=K[1]; A=K[0];
    x=nonce[1]; y=nonce[0]; nonce[0]++;
    for(i=0;i<33;i+=3){
      Rx1b(x,y,A); Rx1b(B,A,i);
      Rx1b(x,y,A); Rx1b(C,A,i+1);
      Rx1b(x,y,A); Rx1b(D,A,i+2);
    }
    Rx1b(x,y,A);
    ((u64 *)block)[1]=x; ((u64 *)block)[0]=y;
    for(i=0;i<outlen;i++) out[i]=block[i];

    return 0;
  }

  ExpandKey(K,rk,key);

  while(outlen>=128){
    Encrypt(out,nonce,rk,key,128);
    out+=128; outlen-=128;
  }

  if (outlen>=96){
    Encrypt(out,nonce,rk,key,96);
    out+=96; outlen-=96;
  }

  if (outlen>=64){
    Encrypt(out,nonce,rk,key,64);
    out+=64; outlen-=64;
  }

  if (outlen>=32){
    Encrypt(out,nonce,rk,key,32);
    out+=32; outlen-=32;
  }

  if (outlen>=16){
    Encrypt(out,nonce,rk,key,16);
    out+=16; outlen-=16;
  }

  if (outlen>0){
    Encrypt(block,nonce,rk,key,16);
    for(i=0;i<outlen;i++) out[i]=block[i];
  }

  return 0;
}



int Encrypt(unsigned char *out, u64 nonce[], u128 rk[], u64 key[], int numbytes)
{
  u64  x[2],y[2];
  u128 X[4],Y[4],Z[4];

  if (numbytes==16){
    x[0]=nonce[1]; y[0]=nonce[0]; nonce[0]++;
    Enc(x,y,key,1);
    ((u64 *)out)[1]=x[0]; ((u64 *)out)[0]=y[0];

    return 0;
  }

  SET1(X[0],nonce[1]);
  SET2(Y[0],nonce[0]);

  if (numbytes==32) Enc(X,Y,rk,2);
  else{
    X[1]=X[0];
    SET2(Y[1],nonce[0]);
    if (numbytes==64) Enc(X,Y,rk,4);
    else{
      X[2]=X[0];
      SET2(Y[2],nonce[0]);
      if (numbytes==96) Enc(X,Y,rk,6);
      else{
        X[3]=X[0];
	SET2(Y[3],nonce[0]);
        Enc(X,Y,rk,8);
      }
    }
  }

  STORE(out,X[0],Y[0]);
  if (numbytes>=64)  STORE(out+32,X[1],Y[1]);
  if (numbytes>=96)  STORE(out+64,X[2],Y[2]);
  if (numbytes>=128) STORE(out+96,X[3],Y[3]);

  return 0;
}



int crypto_stream_speck128256ctr_neon_xor(
  unsigned char *out,
  const unsigned char *in,
  unsigned long long inlen,
  const unsigned char *n,
  const unsigned char *k
)
{
  int i;
  u64 nonce[2],K[4],key[34],A,B,C,D,x,y;
  unsigned char block[16];
  u128 rk[34];

  if (!inlen) return 0;

  nonce[0]=((u64 *)n)[0];
  nonce[1]=((u64 *)n)[1];

  for(i=0;i<numkeywords;i++) K[i]=((u64 *)k)[i];

  if (inlen<=16){
    D=K[3]; C=K[2]; B=K[1]; A=K[0];
    x=nonce[1]; y=nonce[0]; nonce[0]++;
    for(i=0;i<33;i+=3){
      Rx1b(x,y,A); Rx1b(B,A,i);
      Rx1b(x,y,A); Rx1b(C,A,i+1);
      Rx1b(x,y,A); Rx1b(D,A,i+2);
    }
    Rx1b(x,y,A);
    ((u64 *)block)[1]=x; ((u64 *)block)[0]=y;
    for(i=0;i<inlen;i++) out[i]=block[i]^in[i];

    return 0;
  }

  ExpandKey(K,rk,key);

  while(inlen>=128){
    Encrypt_Xor(out,in,nonce,rk,key,128);
    in+=128; inlen-=128; out+=128;
  }

  if (inlen>=96){
    Encrypt_Xor(out,in,nonce,rk,key,96);
    in+=96; inlen-=96; out+=96;
  }

  if (inlen>=64){
    Encrypt_Xor(out,in,nonce,rk,key,64);
    in+=64; inlen-=64; out+=64;
  }

  if (inlen>=32){
    Encrypt_Xor(out,in,nonce,rk,key,32);
    in+=32; inlen-=32; out+=32;
  }

  if (inlen>=16){
    Encrypt_Xor(block,in,nonce,rk,key,16);
    ((u64 *)out)[0]=((u64 *)block)[0]^((u64 *)in)[0];
    ((u64 *)out)[1]=((u64 *)block)[1]^((u64 *)in)[1];
    in+=16; inlen-=16; out+=16;
  }

  if (inlen>0){
    Encrypt_Xor(block,in,nonce,rk,key,16);
    for(i=0;i<inlen;i++) out[i]=block[i]^in[i];
  }

  return 0;
}



int Encrypt_Xor(unsigned char *out, unsigned char *in, u64 nonce[], u128 rk[], u64 key[], int numbytes)
{
  u64  x[2],y[2];
  u128 X[4],Y[4],Z[4];

  if (numbytes==16){
    x[0]=nonce[1]; y[0]=nonce[0]; nonce[0]++;
    Enc(x,y,key,1);
    ((u64 *)out)[1]=x[0]; ((u64 *)out)[0]=y[0];

    return 0;
  }

  SET1(X[0],nonce[1]);
  SET2(Y[0],nonce[0]);

  if (numbytes==32) Enc(X,Y,rk,2);
  else{
    X[1]=X[0];
    SET2(Y[1],nonce[0]);
    if (numbytes==64) Enc(X,Y,rk,4);
    else{
      X[2]=X[0];
      SET2(Y[2],nonce[0]);
      if (numbytes==96) Enc(X,Y,rk,6);
      else{
        X[3]=X[0];
	SET2(Y[3],nonce[0]);
        Enc(X,Y,rk,8);
      }
    }
  }

  XOR_STORE(in,out,X[0],Y[0]);
  if (numbytes>=64)  XOR_STORE(in+32,out+32,X[1],Y[1]);
  if (numbytes>=96)  XOR_STORE(in+64,out+64,X[2],Y[2]);
  if (numbytes>=128) XOR_STORE(in+96,out+96,X[3],Y[3]);

  return 0;
}



int ExpandKey(u64 K[], u128 rk[], u64 key[])
{
  u64 A=K[0], B=K[1], C=K[2], D=K[3];

  EK(A,B,C,D,rk,key);

  return 0;
}
