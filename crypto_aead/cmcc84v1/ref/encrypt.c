/*     Copyright (C) <2014> <Jonathan Trostle>

Permission is hereby granted, free of charge, to any person obtaining 
a copy of this software and associated documentation files (the 
"Software"), to deal in the Software without restriction, including 
without limitation the rights to use, copy, modify, merge, publish, 
distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject 
to the following conditions:

    The above copyright notice and this permission notice shall be 
included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. */



#include <stdio.h>
#include <stdlib.h>
#include "api.h"
#include "crypto_aead.h"
#include "crypto_verify_16.h"
#include "crypto_core_aes128encrypt.h"
#define ABS 16  /* ABS = AES_BLOCK_SIZE */
#define AES(out,in,k) crypto_core_aes128encrypt(out,in,k,0)


typedef unsigned char uc;

int ctr(uc *v, const uc *k, const uc *plain, unsigned long long plain_len, 
	uc *out)
{
  /* Reference implementation assumes <= 2^{39}-128 bits will be 
     processed */
  int size, last_block_length;
  int whole=1; /*TRUE if last block not whole */
  long long int no_blocks;
  uc c[16];
  int i;
  long long int j;
  last_block_length = plain_len % 16;
  if(last_block_length == 0) 
    last_block_length = 16;
  if(last_block_length == 16)
    whole = 0;
  no_blocks = plain_len/16 + whole;
  if(no_blocks == 1)
    size = last_block_length;
  else
    size = ABS;
  for(i=0; i<size; i++)
    out[i] = plain[i] ^ v[i];
  no_blocks--;
  if(no_blocks > 0)
    {
      v[12] &= 0x7f;
      v[8] &= 0x7f;
    }
  j = 16;
  while(no_blocks > 0)
    {
      if(v[15] < 255)
	{
	  v[15] += 1;
	}
      else if(v[15] == 255)
	{
	  v[15] = 0;
	  if(v[14] < 255)
	    v[14] += 1;
	  else if(v[14] == 255)
	    {
	      v[14] = 0;
	      if(v[13] < 255)
		v[13] += 1;
	      else if(v[13] == 255)
		{
		  v[13] = 0;
		  v[12] += 1;
		}
	    }
	}
      AES(c,v,k);
      if(no_blocks == 1)
	size = last_block_length;
      else
	size = ABS;
      for(i=0; i<size; i++)
	out[i+j] = plain[i+j] ^ c[i];
      j += 16;
      no_blocks--;
    }
  return 0;
}

int get_subkeys(uc *key1, uc *key2, const uc *aes_key)
{
  uc zero[ABS]={0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
			  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
  int i, msb, new_msb, flag;
  AES(key1,zero,aes_key);
  if((key1[0] & 0x80) != 0) flag = 1; else flag = 0;
  msb = 0;
  for(i=ABS-1; i >= 0; i--)
    {
      new_msb = key1[i] & 0x80;
      key1[i] = key1[i] << 1;
      if(msb != 0)
	key1[i] += 1;
      msb = new_msb;
    }
  if(flag == 1)
    key1[ABS-1] ^= 0x87;
  if((key1[0] & 0x80) != 0) flag = 1; else flag = 0;
  msb = 0;
  for(i=ABS-1; i >= 0; i--)
    {
      new_msb = key1[i] & 0x80;
      key2[i] = key1[i] << 1;
      if(msb != 0)
	key2[i] += 1;
      msb = new_msb;
    }
  if(flag == 1)
    key2[ABS-1] ^= 0x87;
  return 0;
}

int pad(uc *buf, unsigned int pad_length, unsigned long long length,
	uc *k1, uc *k2)
{ /* assumes buf has room to pad which is true for cbc_buffer
     length is length of buf string; length + pad_length is div. by 16*/
  int i, n;
  if(pad_length == 0)
    {
      /* we have a whole block to pad */
      for(i=length-ABS; i <= length-1; i++)
	buf[i] ^= k1[i - length + ABS];
      return 0;
    }
  else if(pad_length > 16 || pad_length < 1)
    return -1;
  else /* partial block (1 to 16 bytes), have to add pad bytes
        16 bytes is corner case where P1 is multiple of block size,
        pad with 1 byte to get to size of P2, then need 15 more pad bytes
        must add pad_length bytes */
    {
      buf[length] = 0x80;
      for(i=0; i< pad_length-1;i++)
	buf[length+1+i] = 0x00; /* NOW XOR last 16 bytes with K2 */
      n = ABS - pad_length;
      for(i=0; i < ABS; i++)
	buf[length-n+i] ^= k2[i];
    }
  return 0;
}

int cmac(uc *msg, const uc *aes_key, unsigned long long length, uc *tag)
{
  /* length is length of msg */
  unsigned int pad_length;  
  int i;
  uc k1[16], k2[16], temp[16];
  unsigned long long no_blocks, j;
  pad_length = ABS - (length % ABS);
  if(pad_length == 16)
    pad_length = 0;
  if(get_subkeys(k1,k2,aes_key) == -1)
    return -1;
  if(pad(msg, pad_length, length, k1,k2) == -1)
    return -1;
  no_blocks = (length + pad_length)/16;
  AES(tag,msg,aes_key);
  for(j=1; j<no_blocks; j++)
    {
      for(i=0;i < ABS;i++)
	temp[i] = msg[16*j + i] ^ tag[i];
      AES(tag,temp,aes_key);
    }
  return 0;
}

int cbc_encrypt(uc *in, unsigned long long length, uc *out, 
		const uc *aes_key, uc *iv)
{
  /* ASSUMES length is divisible by ABS */
  unsigned long long j, i;
  int k;
  unsigned long long no_blocks = length/16;
  uc ivc[ABS];
  for(k=0;k<ABS;k++)
    ivc[k] = iv[k];
  if((length % 16) != 0)
    return -1;
  for(i=0; i < ABS; i++)
    ivc[i] ^= in[i];
  AES(out,ivc,aes_key);
  for(j=1; j < no_blocks; j++)
    {
      for(i=0; i < ABS; i++)
	ivc[i] = in[16*j + i] ^ out[16*(j-1) + i];
      AES(out + 16*j,ivc,aes_key);
    }
  return 0;
}



int crypto_aead_encrypt(
			uc *c, unsigned long long *clen,
			const uc *m, unsigned long long mlen,
			const uc *ad, unsigned long long adlen,
			const uc *nsec,
			const uc *npub,
			const uc *k)
{
  /* ASSUME CALLER has allocated the buffer c with *clen bytes */
  /* ASSUME message is in buffer m which has at least mlen bytes */
  /* uc big_m[ABS] = { [0 ... 15] = 0xb6 }; */
  uc big_m[ABS] = {0xb6, 0xb6, 0xb6, 0xb6,0xb6, 0xb6, 0xb6, 0xb6, 
                   0xb6, 0xb6, 0xb6, 0xb6,0xb6, 0xb6, 0xb6, 0xb6};
  unsigned long long p1_length, p2_length, cbc_length, j;
  int i, pad_length, temp, index;
  uc k1[16], k2[16], w[16], tag[16], *scratch, *cbc_buffer;
  uc *x, small[CRYPTO_ABYTES];
  if(npub == NULL)
    return -2;
  *clen = mlen + CRYPTO_ABYTES;
  index = ABS - CRYPTO_NPUBBYTES;
  for(i=index; i < ABS; i++)
    big_m[i] = npub[i - index];
  p1_length = (mlen + CRYPTO_ABYTES)/2;
  p2_length = (mlen + CRYPTO_ABYTES) - p1_length;
  cbc_length = p1_length;
  if(p1_length < p2_length)
    cbc_length++;
  if((temp=cbc_length % ABS) != 0)
    cbc_length += ABS - temp;
  pad_length = cbc_length - p1_length;
  /* malloc the buffer of size cbc_length and add padding to it
     then cbc it. But Y will end up in this buffer so make the 
     length cbc_length plus adlen plus padding: */
  cbc_buffer = malloc(cbc_length + adlen + 
		      (ABS - (adlen%ABS))*sizeof(unsigned char));
  if(cbc_buffer == NULL)
    return -3;
  if(p1_length <= mlen)
    {
      for(j=0;j<p1_length;j++)
	cbc_buffer[j] = m[j];
    }
  else if(mlen < p1_length)
    {
      for(j=0; j<mlen;j++)
	cbc_buffer[j] = m[j];
      for(j=mlen;j < p1_length;j++)
	cbc_buffer[j] = 0x00;
    }
  /* pad_length = 0 implies a full block
     will append A to cbc_buffer after getting X
     to get Y. Then MAC buffer and preserve Y in place
     so we can access X in the 3rd equation */
  if(get_subkeys(k1,k2,k+16) == -1)
    return -4;
  if(pad(cbc_buffer,pad_length,p1_length,k1,k2) == -1)
    return -4;
  AES(w,big_m,k);
  /* NOW we cbc_encrypt cbc_buffer */
  if(cbc_encrypt(cbc_buffer, cbc_length, cbc_buffer, k+16, w) == -1)
    return -4;
  /* Now XOR P2 in which will not generally cover all bytes
     (last bytes will be overwritten with A) */
  if(p1_length <= mlen)
    for(j = p1_length; j < mlen;j++)
      cbc_buffer[j - p1_length] ^= m[j];
  /* save X for later use */
  /* with a little extra complexity we could maintain X in 
     cbc_buffer by saving the bytes of X that are affected by
     padding and then overwriting the affected bytes later on
     when we need to reconstitute X. This would eliminate the
     copy below */
  x = malloc(p2_length*sizeof(unsigned char));
  if(x == NULL)
    return -3;
  for(j=0; j < p2_length; j++)
        x[j] = cbc_buffer[j];
  for(j=p2_length; j < p2_length + adlen; j++)
    cbc_buffer[j] = ad[j - p2_length];
  if(cmac(cbc_buffer, k+32, p2_length+adlen, tag) == -1)
    return -4;
  scratch = malloc(cbc_length*sizeof(unsigned char *));
  if(scratch == NULL)
    return -3;

  if(p1_length <= mlen)
    {
    if(ctr(tag, k+48, m, p1_length,scratch) == -1)
      return -4; 
    }
  else if(mlen < p1_length)
    {
      for(j=0; j<mlen;j++)
	small[j] = m[j];
      for(j=mlen;j < p1_length;j++)
	small[j] = 0x00;
      if(ctr(tag, k+48, small, p1_length,scratch) == -1)
	return -4;
    }

  /* pad scratch (holds X2), then cbc encrypt it. Then xor in X
     to get X1. But copy out X2 first. */
  for(j=0; j<p1_length;j++)
    c[p2_length+j] = scratch[j];
  if(get_subkeys(k1,k2,k+64) == -1)
    return -4;
  if(pad(scratch, pad_length, p1_length, k1,k2) == -1)
    return -4;
  if(cbc_encrypt(scratch,cbc_length,scratch,k+64,w) == -1)
    return -4;
  /* XOR with X to get X1 */
  for(j=0; j<p2_length;j++)
    c[j] = scratch[j] ^ x[j];
  free(scratch);
  scratch = NULL;
  free(x);
  x = NULL;
  free(cbc_buffer);
  cbc_buffer = NULL;
  return 0;
}

int crypto_aead_decrypt(
			uc *m, unsigned long long *mlen,
			uc *nsec,
			const uc *c, unsigned long long clen,
			const uc *ad, unsigned long long adlen,
			const uc *npub,
			const uc *k
			)
{
  /* uc big_m[ABS] = { [0 ... 15] = 0xb6 }; */
  uc big_m[ABS] = {0xb6, 0xb6, 0xb6, 0xb6,0xb6, 0xb6, 0xb6, 0xb6, 
                   0xb6, 0xb6, 0xb6, 0xb6,0xb6, 0xb6, 0xb6, 0xb6};
  unsigned long long p1_length, p2_length, cbc_length, j;
  int i, pad_length, temp, index;
  uc k1[16], k2[16], w[16], tag[16], *scratch, *cbc_buffer;
  uc *x;
  if(npub == NULL)
    return -2;
  /* WE EXPECT *mlen to lower bound the length of the buffer m and
     we expect that m has at least clen - CRYPTO_ABYTES */
  *mlen = clen - CRYPTO_ABYTES;
  if(clen < CRYPTO_ABYTES)
    return -1;
  index = ABS - CRYPTO_NPUBBYTES;
  for(i=index; i < ABS; i++)
    big_m[i] = npub[i - index];
  p1_length = clen/2;
  p2_length = clen - p1_length;
  cbc_length = p1_length;
  if(p1_length < p2_length)
    cbc_length++;
  if((temp=cbc_length % ABS) != 0)
    cbc_length += ABS - temp;
  pad_length = cbc_length - p1_length;
  /* malloc the buffer of size cbc_length and add padding to it
     then cbc it. But Y will end up in this buffer so make the 
     length cbc_length plus adlen plus padding: */
  cbc_buffer = malloc(cbc_length 
	     + adlen + (ABS - (adlen%ABS))*sizeof(unsigned char));
  if(cbc_buffer == NULL)
    return -3;
  /* GOT TO HERE IN CHECKING */
  /* copy X2 into cbc_buffer; it's length is p1_length */
  for(j=0; j < p1_length; j++)
    cbc_buffer[j] = c[j+p2_length];
  /* now pad it, then cbc encrypt it, then xor X1 in */

  if(get_subkeys(k1,k2,k+64) == -1)
    return -4;
  if(pad(cbc_buffer,pad_length,p1_length,k1,k2) == -1)
    return -4;
  AES(w,big_m,k);
  /* NOW we cbc_encrypt cbc_buffer */
  if(cbc_encrypt(cbc_buffer, cbc_length, cbc_buffer, k+64, w) == -1)
    return -4;
  /* Now XOR X1 in which will not generally cover all bytes
     (last bytes will be overwritten with A) */
  for(j=0; j < p2_length; j++)
    cbc_buffer[j] ^= c[j];
  /* save X for later use */
  /* with a little extra complexity we could maintain X in 
     cbc_buffer by saving the bytes of X that are affected by
     padding and then overwriting the affected bytes later on
     when we need to reconstitute X. This would eliminate the
     copy of the potentially big string below */
  x = malloc(p2_length*sizeof(unsigned char));
  if(x == NULL)
    return -3;
  for(j=0; j < p2_length; j++)
        x[j] = cbc_buffer[j];
  for(j=p2_length; j < p2_length + adlen; j++)
     cbc_buffer[j] = ad[j - p2_length];
  if(cmac(cbc_buffer, k+32, p2_length+adlen, tag) == -1)
    return -4;
  scratch = malloc(cbc_length*sizeof(unsigned char *));
  if(scratch == NULL)
    return -3;
  if(ctr(tag, k+48, c+p2_length, p1_length,scratch) == -1)
    return -4;
  /* pad scratch (holds P1), then cbc encrypt it. Then xor in X
     to get P2. But copy out P1 first. Handle corner case where
     P1 longer than m */
  if(p1_length <= *mlen)
    for(j=0; j < p1_length;j++)
      m[j] = scratch[j];
  else
    {
      for(j=0; j < *mlen; j++)
	m[j] = scratch[j];
      /* check the rest of P1 to make sure they are zero bytes */
      /*for(j=0; j < p1_length-*mlen; j++)*/
      for(j = *mlen; j < p1_length; j++) /*check for invalid */
	{
	  /*if(scratch[*mlen + j] != 0x00)*/
	    if(scratch[j] != 0x00)
	    {
	      return -1;
	    }
	}
    }
  /*pad, cbc_encrypt, then xor with X. Result will be P2 */
  /* then segment P2 into msg bytes and Z, check Z, copy msg into m */
  if(get_subkeys(k1,k2,k+16) == -1)
    return -4;
  if(pad(scratch, pad_length, p1_length, k1,k2) == -1)
    return -4;
  if(cbc_encrypt(scratch,cbc_length,scratch,k+16,w) == -1)
    return -4; 
  for(j=0; j < p2_length; j++)
    scratch[j] ^= x[j];
  if(*mlen > p1_length)
    {
      for(j=0; j < (*mlen - p1_length); j++)
	m[j + p1_length] = scratch[j];
      for(j=(*mlen - p1_length); j < p2_length; j++)
	if(scratch[j] != 0x00)
	  return -1;
    }
  else
    for(j=0; j < p2_length; j++)
      if(scratch[j] != 0x00)
	return -1;
  free(scratch);
  scratch = NULL;
  free(x);
  x = NULL;
  free(cbc_buffer);
  cbc_buffer = NULL;
  return 0;
}

