#ifdef DEBUG
   #include<stdio.h>
#endif
#include <byteswap.h>
#include <string.h>

#ifdef __linux__
   #include <endian.h>
#elif __FreeBSD__ || __NetBSD__ ||  __OpenBSD__
  #include <sys/endian.h>
#elif __APPLE__
  #include <machine/endian.h>
#endif

#include "poet.h"
#include "gf_mul.h"

#if BYTE_ORDER == BIG_ENDIAN
  #define TO_BIG_ENDIAN_64(n) (n)
#else
  #define TO_BIG_ENDIAN_64(n) bswap_64(n)
#endif


#define TOP_HASH     AESNI_encrypt(ctx->x, ctx->x, ctx->aes_lt)
#define BOTTOM_HASH  AESNI_encrypt(ctx->y, ctx->y, ctx->aes_lb)


void keysetup(struct poet_ctx *ctx, const uint8_t key[KEYLEN_BITS])
{
  uint8_t ctr[BLOCKLEN];
  AES_KEY aes_key;

  memset(ctx->tau,0,BLOCKLEN);
  memset(ctr,0, BLOCKLEN);

  /* Generate block cipher key */
  AESNI_Key_Expansion(key, aes_key);
  AESNI_encrypt(ctr, ctx->k,aes_key);

  AESNI_Key_Expansion(ctx->k, ctx->aes_enc);
  AES_Key_Dec(ctx->aes_enc, ctx->aes_dec);

  /* Generate header key */
  ctr[BLOCKLEN-1]+=1; AESNI_encrypt(ctr, ctx->l, aes_key);

  /* Generate almost XOR universal hash function keys */
  ctr[BLOCKLEN-1]+=1; AESNI_encrypt(ctr, ctx->lt, aes_key);
  AESNI_Key_Expansion(ctx->lt, ctx->aes_lt);
  ctr[BLOCKLEN-1]+=1; AESNI_encrypt(ctr, ctx->lb, aes_key);
  AESNI_Key_Expansion(ctx->lb,ctx->aes_lb);


  /* Generate tag masking keys */
  ctr[BLOCKLEN-1]+=1; AESNI_encrypt(ctr, ctx->tm, aes_key);

}


/***************************************************************************/
/************************* XOR BLOCKS **************************************/
/***************************************************************************/


inline void xor_block(uint8_t *c, const uint8_t  *a, const uint8_t  *b)
{
  unsigned int i;
  for(i=0; i<BLOCKLEN;i++) c[i] = a[i] ^ b[i];
}



/***************************************************************************/
/********************* Process Header **************************************/
/***************************************************************************/


void process_header(struct poet_ctx *ctx, const uint8_t  *header, uint64_t header_len )
{
  uint64_t h[2];
  unsigned char *mask = (unsigned char *) h;
  block in;
  block out;
  uint64_t offset=0;

  ctx->mlen=0;
  memcpy(h, ctx->l, BLOCKLEN);
  memset(ctx->tau, 0, BLOCKLEN);


  while(header_len > BLOCKLEN)
    {

      if(offset)
	{
	  h[0] = TO_BIG_ENDIAN_64(h[0]);  h[1] = TO_BIG_ENDIAN_64(h[1]);
	  GF128_double(h);
	  h[0] = TO_BIG_ENDIAN_64(h[0]); h[1] = TO_BIG_ENDIAN_64(h[1]);
	}
      xor_block(in,header+offset,mask);

      AESNI_encrypt(in,out,ctx->aes_enc);
      xor_block(ctx->tau,out,ctx->tau);

      offset += BLOCKLEN;
      header_len -= BLOCKLEN;
    }

  h[0] = TO_BIG_ENDIAN_64(h[0]);  h[1] = TO_BIG_ENDIAN_64(h[1]);
  GF128_double(h);
  h[0] = TO_BIG_ENDIAN_64(h[0]);  h[1] = TO_BIG_ENDIAN_64(h[1]);

  /* LASTBLOCK */
   if(header_len < 16)
    {
      memset(in,0,BLOCKLEN);
      memcpy(in,header+offset,header_len);
      in[header_len]=0x80;

      h[0] = TO_BIG_ENDIAN_64(h[0]); h[1] = TO_BIG_ENDIAN_64(h[1]);
      GF128_quintuple(h);
      h[0] = TO_BIG_ENDIAN_64(h[0]); h[1] = TO_BIG_ENDIAN_64(h[1]);

    }
   else
     {
       memcpy(in,header+offset,BLOCKLEN);
       h[0] = TO_BIG_ENDIAN_64(h[0]); h[1] = TO_BIG_ENDIAN_64(h[1]);
       GF128_triple(h);
       h[0] = TO_BIG_ENDIAN_64(h[0]); h[1] = TO_BIG_ENDIAN_64(h[1]);
     }



   xor_block(in,mask,in);

   xor_block(in,in,ctx->tau);
   AESNI_encrypt(in ,ctx->tau, ctx->aes_enc);
   memcpy(ctx->x, ctx->tau, BLOCKLEN);
   memcpy(ctx->y, ctx->tau, BLOCKLEN);
}



/***************************************************************************/
/********************* Encrypt block ***************************************/
/***************************************************************************/

void encrypt_block(struct poet_ctx *ctx, const uint8_t plaintext[16],
		   uint8_t ciphertext[16])
{
  block tmp;
  TOP_HASH;
  xor_block(ctx->x, plaintext,ctx->x);

  AESNI_encrypt(ctx->x, tmp, ctx->aes_enc);

  BOTTOM_HASH;
  xor_block(ciphertext, tmp,ctx->y);

  memcpy(ctx->y, tmp, BLOCKLEN);
  ctx->mlen+=BLOCKLEN_BITS;

}

/***************************************************************************/
/********************* Encrypt final ***************************************/
/***************************************************************************/

void encrypt_final(struct poet_ctx *ctx, const uint8_t *plaintext,
		   uint64_t plen, uint8_t *ciphertext, uint8_t tag[BLOCKLEN])
{
#ifdef DEBUG
  int i;
#endif
  uint64_t offset=0;
  uint64_t len;
  block s;
  block tmp;
  block tmp2;
  while( plen > BLOCKLEN )
    {
      encrypt_block(ctx,  (plaintext+offset), (ciphertext+offset));
      plen   -= BLOCKLEN;
      offset += BLOCKLEN;
    }

  /* Encrypt length of message */
  ctx->mlen+=(plen*8);
  memset(s,0,BLOCKLEN);
  len =  TO_LITTLE_ENDIAN_64(ctx->mlen);
  memcpy(s, &len,8);
  AESNI_encrypt(s, s ,ctx->aes_enc);

  /* Last message block must be padded if necesscary */
  memcpy(tmp,plaintext+offset,plen);
  memcpy(tmp+plen,ctx->tau,BLOCKLEN-plen);


  /* Process last block + tag generation */

  TOP_HASH;
  xor_block(tmp,s,tmp);
  xor_block(ctx->x,tmp,ctx->x);

  AESNI_encrypt(ctx->x, tmp, ctx->aes_enc);

  BOTTOM_HASH;
  xor_block(tmp2, tmp,ctx->y);
  memcpy(ctx->y, tmp, BLOCKLEN);
  xor_block(tmp,s,tmp2);


#ifdef DEBUG
  puts("S"); for(i=0;i<16;i++) printf("%02x ",s[i]); puts("");
  puts("X"); for(i=0;i<16;i++) printf("%02x ",ctx->x[i]); puts("");
  puts("Y"); for(i=0;i<16;i++) printf("%02x ",ctx->y[i]); puts("");
#endif

  /* Do tag splitting if needed */
  memcpy(ciphertext+offset,tmp,plen);
  memcpy(tag,tmp+plen,BLOCKLEN-plen);


  /* Generate tag */
  TOP_HASH;
  xor_block(ctx->x, ctx->tau, ctx->x);
  xor_block(ctx->x, ctx->tm, ctx->x);

  AESNI_encrypt(ctx->x, tmp, ctx->aes_enc);

  BOTTOM_HASH;
  xor_block(tmp, ctx->y, tmp);
  xor_block(tmp, ctx->tm, tmp);

  memcpy(tag+(BLOCKLEN-plen),tmp,plen);

}



/***************************************************************************/
/********************* Decrypt block ***************************************/
/***************************************************************************/

void decrypt_block(struct poet_ctx *ctx, const uint8_t ciphertext[16],
		   uint8_t plaintext[16])
{
  block tmp;
  BOTTOM_HASH;
  xor_block(ctx->y, ciphertext,ctx->y);

  AESNI_decrypt(ctx->y, tmp, ctx->aes_dec);

  TOP_HASH;
  xor_block(plaintext, tmp,ctx->x);

  memcpy(ctx->x, tmp, BLOCKLEN);
  ctx->mlen+=BLOCKLEN_BITS;
}


/***************************************************************************/
/********************* Decrypt final ***************************************/
/***************************************************************************/

int decrypt_final(struct poet_ctx *ctx, const uint8_t *ciphertext,
		   uint64_t clen, const uint8_t tag[BLOCKLEN],
		   uint8_t *plaintext)
{
#ifdef DEBUG
  int i;
#endif
  uint64_t offset=0;
  block s;
  block tmp;
  block tmp2;
  int alpha;
  int beta;
  uint64_t len;

  while( clen > BLOCKLEN )
    {
      decrypt_block(ctx, ciphertext+offset, plaintext+offset);
      clen   -= BLOCKLEN;
      offset += BLOCKLEN;
    }

  /* Encrypt length of message */
  ctx->mlen+=(clen*8);
  memset(s,0,BLOCKLEN);
  len =  TO_LITTLE_ENDIAN_64(ctx->mlen);
  memcpy(s, &len, 8);
  AESNI_encrypt(s, s ,ctx->aes_enc);


  /* Last ciphertext block must be padded if necesscary */
  memcpy(tmp,ciphertext+offset,clen);
  memcpy(tmp+clen,tag,BLOCKLEN-clen);


  /* Process last block + tag generation */
  BOTTOM_HASH;
  xor_block(tmp,s,tmp);
  xor_block(ctx->y, tmp,ctx->y);

  AESNI_decrypt(ctx->y, tmp, ctx->aes_dec);

  TOP_HASH;
  xor_block(tmp2, tmp, ctx->x);
  xor_block(tmp2, s, tmp2);
  memcpy(ctx->x,tmp,BLOCKLEN);


#ifdef DEBUG
  puts("S"); for(i=0;i<16;i++) printf("%02x ",s[i]); puts("");
  puts("X"); for(i=0;i<16;i++) printf("%02x ",ctx->x[i]); puts("");
  puts("Y"); for(i=0;i<16;i++) printf("%02x ",ctx->y[i]); puts("");
#endif

  /* Do tag splitting if needed */
  memcpy(plaintext+offset,tmp2,clen);

  alpha = memcmp(tmp2+clen,ctx->tau,BLOCKLEN-clen);

  /* Generate tag */
  TOP_HASH;
  xor_block(ctx->x, ctx->tau ,ctx->x);
  xor_block(ctx->x, ctx->tm ,ctx->x);

  AESNI_encrypt(ctx->x, tmp, ctx->aes_enc);

  BOTTOM_HASH;
  xor_block(tmp, ctx->y, tmp);
  xor_block(tmp, ctx->tm, tmp);

#ifdef DEBUG
  puts("tmp"); for(i=0;i<16;i++) printf("%02x ",tmp[i]); puts("");
  puts("tag"); for(i=0;i<16;i++) printf("%02x ",tag[i]); puts("");
#endif

  beta = memcmp(tmp,tag+(BLOCKLEN-clen),clen);

  return alpha|beta;
}

