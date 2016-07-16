//AVX2 C code for SIMON 128/192

/***********************************************************************************
 ** DISCLAIMER. THIS SOFTWARE WAS WRITTEN BY EMPLOYEES OF THE U.S.
 ** GOVERNMENT AS A PART OF THEIR OFFICIAL DUTIES AND, THEREFORE, IS NOT
 ** PROTECTED BY COPYRIGHT. THE U.S. GOVERNMENT MAKES NO WARRANTY, EITHER
 ** EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY IMPLIED WARRANTIES
 ** OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, REGARDING THIS SOFTWARE.
 ** THE U.S. GOVERNMENT FURTHER MAKES NO WARRANTY THAT THIS SOFTWARE WILL NOT
 ** INFRINGE ANY OTHER UNITED STATES OR FOREIGN PATENT OR OTHER
 ** INTELLECTUAL PROPERTY RIGHT. IN NO EVENT SHALL THE U.S. GOVERNMENT BE
 ** LIABLE TO ANYONE FOR COMPENSATORY, PUNITIVE, EXEMPLARY, SPECIAL,
 ** COLLATERAL, INCIDENTAL, CONSEQUENTIAL, OR ANY OTHER TYPE OF DAMAGES IN
 ** CONNECTION WITH OR ARISING OUT OF COPY OR USE OF THIS SOFTWARE.
 ***********************************************************************************/


#include <stdio.h>
#include <stdlib.h>
#include "Simon128192AVX2.h"


int crypto_stream_simon128192ctr_avx2(
  unsigned char *out, 
  unsigned long long outlen, 
  const unsigned char *n, 
  const unsigned char *k
)
{
  int i;
  u64 nonce[2],K[4],key[72],x,y;
  unsigned char block[16];
  u256 rk[72];

  if (!outlen) return 0;

  nonce[0]=((u64 *)n)[0];
  nonce[1]=((u64 *)n)[1];

  for(i=0;i<numkeywords;i++) K[i]=((u64 *)k)[i];

  ExpandKey(K,rk,key);

  if (outlen<=16){
    x=nonce[1]; y=nonce[0]; nonce[0]++;
    for(i=0;i<68;i+=2) R2(x,y,key[i],key[i+1]);
    R1(x,y,key[68]);
    ((u64 *)block)[1]=y; ((u64 *)block)[0]=x;
    for(i=0;i<outlen;i++) out[i]=block[i];

    return 0;
  }
  
  while(outlen>=320){
    Encrypt(out,nonce,rk,key,320);
    out+=320; outlen-=320;
  }

  if (outlen>=256){
    Encrypt(out,nonce,rk,key,256);
    out+=256; outlen-=256;
  }

  if (outlen>=192){
    Encrypt(out,nonce,rk,key,192);
    out+=192; outlen-=192;
  }

  if (outlen>=128){
    Encrypt(out,nonce,rk,key,128);
    out+=128; outlen-=128;
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
    for (i=0;i<outlen;i++) out[i] = block[i];
  }

  return 0;
}



int Encrypt(unsigned char *out, u64 nonce[], u256 rk[], u64 key[], int numbytes)
{
  u64  x[2],y[2];
  u256 X[5],Y[5];

  if (numbytes==16){
    x[0]=nonce[1]; y[0]=nonce[0]; nonce[0]++;
    Enc(x,y,key,1);
    ((u64 *)out)[1]=x[0]; ((u64 *)out)[0]=y[0];

    return 0;
  }

  if (numbytes==32){
    x[0]=nonce[1]; y[0]=nonce[0]; nonce[0]++;
    x[1]=nonce[1]; y[1]=nonce[0]; nonce[0]++;
    Enc(x,y,key,2);
    ((u64 *)out)[1]=x[0]; ((u64 *)out)[0]=y[0];
    ((u64 *)out)[3]=x[1]; ((u64 *)out)[2]=y[1];

    return 0;
  }

  SET1(X[0],nonce[1]);
  SET4(Y[0],nonce[0]);

  if (numbytes==64) Enc(X,Y,rk,4);
  else{
    X[1]=X[0];
    SET4(Y[1],nonce[0]);
    if (numbytes==128) Enc(X,Y,rk,8);
    else{
      X[2]=X[0];
      SET4(Y[2],nonce[0]);
      if (numbytes==192) Enc(X,Y,rk,12);
      else{
	X[3]=X[0];
	SET4(Y[3],nonce[0]);
	if (numbytes==256) Enc(X,Y,rk,16);
	else{
	  X[4]=X[0];
	  SET4(Y[4],nonce[0]);
	  Enc(X,Y,rk,20);
	}
      }
    }
  }

  STORE(out,X[0],Y[0]);
  if (numbytes>=128) STORE(out+64,X[1],Y[1]);
  if (numbytes>=192) STORE(out+128,X[2],Y[2]);
  if (numbytes>=256) STORE(out+192,X[3],Y[3]);
  if (numbytes>=320) STORE(out+256,X[4],Y[4]);

  return 0;
}



int crypto_stream_simon128192ctr_avx2_xor(
  unsigned char *out, 
  const unsigned char *in, 
  unsigned long long inlen, 
  const unsigned char *n, 
  const unsigned char *k
)
{
  int i;
  u64 nonce[2],K[4],key[72],x,y;
  unsigned char block[16];
  u256 rk[72];

  if (!inlen) return 0;

  nonce[0]=((u64*)n)[0];
  nonce[1]=((u64*)n)[1];

  for(i=0;i<numkeywords;i++) K[i]=((u64 *)k)[i];

  ExpandKey(K,rk,key);

  if (inlen<=16){
    x=nonce[1]; y=nonce[0]; nonce[0]++;
    for(i=0;i<68;i+=2) R2(x,y,key[i],key[i+1]);
    R1(x,y,key[68]);
    ((u64 *)block)[1]=y; ((u64 *)block)[0]=x;
    for(i=0;i<inlen;i++) out[i]=block[i]^in[i];

    return 0;
  }
  
  while(inlen>=320){
    Encrypt_Xor(out,in,nonce,rk,key,320);
    in+=320; inlen-=320; out+=320;
  }

  if (inlen>=256){
    Encrypt_Xor(out,in,nonce,rk,key,256);
    in+=256; inlen-=256; out+=256;
  }

  if (inlen>=192){
    Encrypt_Xor(out,in,nonce,rk,key,192);
    in+=192; inlen-=192; out+=192;
  }

  if (inlen>=128){
    Encrypt_Xor(out,in,nonce,rk,key,128);
    in+=128; inlen-=128; out+=128;
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
    for (i=0;i<inlen;i++) out[i]=block[i]^in[i];
  }

  return 0;
}



int Encrypt_Xor(unsigned char *out, unsigned char *in, u64 nonce[], u256 rk[], u64 key[], int numbytes)
{
  u64  x[2],y[2];
  u256 X[5],Y[5];

  if (numbytes==16){
    x[0]=nonce[1]; y[0]=nonce[0]; nonce[0]++;
    Enc(x,y,key,1);
    ((u64 *)out)[1]=x[0]; ((u64 *)out)[0]=y[0];

    return 0;
  }

  if (numbytes==32){
    x[0]=nonce[1]; y[0]=nonce[0]; nonce[0]++;
    x[1]=nonce[1]; y[1]=nonce[0]; nonce[0]++;
    Enc(x,y,key,2);
    ((u64 *)out)[1]=x[0]^((u64 *)in)[1]; ((u64 *)out)[0]=y[0]^((u64 *)in)[0];
    ((u64 *)out)[3]=x[1]^((u64 *)in)[3]; ((u64 *)out)[2]=y[1]^((u64 *)in)[2];

    return 0;
  }
  
  SET1(X[0],nonce[1]);
  SET4(Y[0],nonce[0]);

  if (numbytes==64) Enc(X,Y,rk,4);
  else{
    X[1]=X[0];
    SET4(Y[1],nonce[0]);
    if (numbytes==128) Enc(X,Y,rk,8);
    else{
      X[2]=X[0];
      SET4(Y[2],nonce[0]);
      if (numbytes==192) Enc(X,Y,rk,12);
      else{
	X[3]=X[0];
	SET4(Y[3],nonce[0]);
	if (numbytes==256) Enc(X,Y,rk,16);
	else{
	  X[4]=X[0];
	  SET4(Y[4],nonce[0]);
	  Enc(X,Y,rk,20);
	}
      }
    }
  }

  XOR_STORE(in,out,X[0],Y[0]);

  if (numbytes>=128) XOR_STORE(in+64,out+64,X[1],Y[1]);
  if (numbytes>=192) XOR_STORE(in+128,out+128,X[2],Y[2]);
  if (numbytes>=256) XOR_STORE(in+192,out+192,X[3],Y[3]);
  if (numbytes>=320) XOR_STORE(in+256,out+256,X[4],Y[4]);

  return 0;
}



int ExpandKey(u64 K[], u256 rk[], u64 key[])
{
  u64 A=K[0], B=K[1], C=K[2], D=K[3];

  EK(A,B,C,D,rk,key);

  return 0;
}
