#include "crypto_aead.h"
#include "crypto_verify_16.h"
#include "api.h"
#include "proest128.h"
#include "zerobytes.h"
#include "copa.h"
    
typedef struct {
	unsigned char byte[COPA_BLOCKBYTES];
} block;


// Encrypt single block using Proest in single-key Even-Mansour
static void encrypt_block(unsigned char *r, const unsigned char *x, const unsigned char *k) 
{
	proest_ctx y;
  int i;
  for(i=0;i<CRYPTO_KEYBYTES;i++)
    r[i] = x[i] ^ k[i];
	proest_readstate(&y, r);
	proest_permute(&y);
	proest_writestate(r, &y);
  for(i=0;i<CRYPTO_KEYBYTES;i++)
    r[i] ^= k[i];
}

static void xor_block(unsigned char *r, const unsigned char *x, const unsigned char *y)
{
  int i;
  for(i=0;i<COPA_BLOCKBYTES;i++)
    r[i] = x[i] ^ y[i];
}


// Decrypt single block using Proest in single-key Even-Mansour
static void decrypt_block(unsigned char *r, const unsigned char *x, const unsigned char *k) 
{
	proest_ctx y;
  int i;
  for(i=0;i<CRYPTO_KEYBYTES;i++)
    r[i] = x[i] ^ k[i];
	proest_readstate(&y, r);
	proest_inverse_permute(&y);
	proest_writestate(r, &y);
  for(i=0;i<CRYPTO_KEYBYTES;i++)
    r[i] ^= k[i];
}


// Multiplication by x
static void mulx(unsigned char *r, const unsigned char *x) 
{
	int i;
  unsigned char red0, red1;
  unsigned char t[COPA_BLOCKBYTES];
  for(i=0;i<COPA_BLOCKBYTES;i++)
    t[i] = x[i];

  red0  = -(t[COPA_BLOCKBYTES-1] >> 7);
  red1  = 0x04 & red0;
  red0 &= 0x25;

	for (i = 1; i < COPA_BLOCKBYTES; ++i)
    r[i] = (t[i] << 1) | (t[i-1] >> 7);
  r[0]  = (t[0] << 1) ^ red0;
  r[1] ^= red1;
}


// Multiplication by (x+1)
static void mulxp1(unsigned char *r, const unsigned char *x) 
{
  int i;
  unsigned char red0, red1;
  unsigned char t[COPA_BLOCKBYTES];

  red0  = -(x[COPA_BLOCKBYTES-1] >> 7);
  red1  = 0x04 & red0;
  red0 &= 0x25;

	for (i = 1; i < COPA_BLOCKBYTES; ++i)
    t[i] = (x[i] << 1) | (x[i-1] >> 7);
  t[0]  = (x[0] << 1) ^ red0;
  t[1] ^= red1;
	for (i = 0; i < COPA_BLOCKBYTES; ++i)
    r[i] = t[i] ^ x[i];
}

static void copa_process_ad(unsigned char *v, 
    const unsigned char *ad, unsigned long long adlen, 
    const unsigned char *npub, 
    const unsigned char *_3l, 
    const unsigned char *k)
{
  unsigned char buf[2*COPA_BLOCKBYTES];
  unsigned char delta[COPA_BLOCKBYTES];
  unsigned char t[COPA_BLOCKBYTES];
  unsigned long long i;

  mulxp1(delta, _3l);
  mulxp1(delta, delta);
  for(i=0;i<COPA_BLOCKBYTES;i++)
    v[i] = 0;

  while(adlen >= COPA_BLOCKBYTES)
  {
    xor_block(t, ad, delta);
    encrypt_block(t, t, k);
    xor_block(v, v, t);
    mulx(delta, delta);

    adlen -= COPA_BLOCKBYTES;
    ad    += COPA_BLOCKBYTES;
  }

  // Buffer for remaining AD and N
  for(i=0;i<adlen;i++)
    buf[i] = ad[i];
  for(i=0;i<CRYPTO_NPUBBYTES;i++)
    buf[adlen+i] = npub[i];
  buf[adlen+CRYPTO_NPUBBYTES] = 0x80;
  for(i=adlen+CRYPTO_NPUBBYTES+1;i<2*COPA_BLOCKBYTES;i++)
    buf[i] = 0;


  if(adlen+CRYPTO_NPUBBYTES > COPA_BLOCKBYTES)
  {
    xor_block(t, buf, delta);
    encrypt_block(t, t, k);
    xor_block(v, v, t);
    mulx(delta, delta);

    mulxp1(delta, delta);
    mulxp1(delta, delta);
    xor_block(buf+COPA_BLOCKBYTES, buf+COPA_BLOCKBYTES, delta);
    xor_block(buf+COPA_BLOCKBYTES, buf+COPA_BLOCKBYTES, v);
    encrypt_block(v, buf+COPA_BLOCKBYTES, k);
  }
  else
  {
    mulxp1(delta, delta);
    if(adlen+CRYPTO_NPUBBYTES != COPA_BLOCKBYTES)
      mulxp1(delta, delta);

    xor_block(buf, buf, delta);
    xor_block(buf, buf, v);

    encrypt_block(v, buf, k);
  }
}
  
int crypto_aead_encrypt(
	unsigned char *c, 			unsigned long long *clen,
	const unsigned char *m, 	unsigned long long mlen,
	const unsigned char *ad, 	unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
)
{
  unsigned char v[COPA_BLOCKBYTES];
  unsigned char l[COPA_BLOCKBYTES];
  unsigned char delta0[COPA_BLOCKBYTES];
  unsigned char delta1[COPA_BLOCKBYTES];
  unsigned char sigma[COPA_BLOCKBYTES];
  unsigned char key[CRYPTO_KEYBYTES];
  unsigned long long i;

  *clen = 0;

  for(i=0;i<CRYPTO_KEYBYTES;i++)
    key[i] = k[i];

  // Init delta0, delta1, and sigma
  for(i=0;i<COPA_BLOCKBYTES;i++)
  {
    l[i] = 0;
    sigma[i]  = 0;
  }
  encrypt_block(l,l,key);

  mulx(delta1, l);
  xor_block(delta0, l, delta1);

  // Init V (process AD)
  copa_process_ad(v, ad, adlen, npub, delta0, key);
   
  xor_block(v, v, l);

  // Encrypt full blocks
  while(mlen >= COPA_BLOCKBYTES)
  {
    xor_block(sigma, sigma, m);

    xor_block(c, m, delta0);
    encrypt_block(c,c,key);
    xor_block(v, v, c);
    encrypt_block(c,v,key);
    xor_block(c, c, delta1);
  
    mulx(delta0, delta0);
    mulx(delta1, delta1);

    m     += COPA_BLOCKBYTES;
    c     += COPA_BLOCKBYTES;
    mlen  -= COPA_BLOCKBYTES;
    *clen += COPA_BLOCKBYTES;
  }

  // Last padded block
  for(i=0;i<mlen;i++)
    c[i] = m[i];
  c[mlen] = 0x80;
  for(i=mlen+1;i<COPA_BLOCKBYTES;i++)
    c[i] = 0;

  xor_block(sigma, sigma, c);
  xor_block(c, c, delta0);
  encrypt_block(c,c,key);
  xor_block(v, v, c);
  encrypt_block(c,v,key);
  xor_block(c, c, delta1);

  c += COPA_BLOCKBYTES;
  *clen += COPA_BLOCKBYTES;

  // Compute tag
  mulx(delta1, delta1);

  xor_block(delta1, delta1, delta0);

  mulxp1(delta0, delta0);
  xor_block(delta0, delta0, sigma);
  encrypt_block(delta0,delta0,key);
  xor_block(delta0, delta0, v);
  encrypt_block(delta0,delta0,key);

  xor_block(delta0, delta0, delta1);
  for(i=0;i<COPA_TAGBYTES;i++)
    c[i] = delta0[i];
  *clen += COPA_TAGBYTES;

  zerobytes(key, CRYPTO_KEYBYTES);

  return 0;
}


int crypto_aead_decrypt(
    unsigned char *m, 		unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c, 	unsigned long long clen,
    const unsigned char *ad,	unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k
    )
{
  unsigned char v[COPA_BLOCKBYTES];
  unsigned char l[COPA_BLOCKBYTES];
  unsigned char delta0[COPA_BLOCKBYTES];
  unsigned char delta1[COPA_BLOCKBYTES];
  unsigned char sigma[COPA_BLOCKBYTES];
  unsigned char key[CRYPTO_KEYBYTES];
  unsigned long long i;

  *mlen = 0;
  if(clen < CRYPTO_ABYTES) return -1;
  if((clen-COPA_TAGBYTES) & (COPA_BLOCKBYTES-1)) return -1; 

  for(i=0;i<CRYPTO_KEYBYTES;i++)
    key[i] = k[i];

  // Init delta0, delta1, and sigma
  for(i=0;i<COPA_BLOCKBYTES;i++)
  {
    l[i] = 0;
    sigma[i]  = 0;
  }
  encrypt_block(l,l,key);
  mulx(delta1, l);
  xor_block(delta0, l, delta1);

  // Init V (process AD)
  copa_process_ad(v, ad, adlen, npub, delta0, key);
  xor_block(v,v,l);

  // Decrypt full blocks
  while(clen-COPA_TAGBYTES >= COPA_BLOCKBYTES)
  {
    xor_block(m, c, delta1);
    decrypt_block(m,m,key);
    xor_block(m, m, v);
    xor_block(v, v, m);
    decrypt_block(m,m,key);
    xor_block(m, m, delta0);

    xor_block(sigma, sigma, m);

    m     += COPA_BLOCKBYTES;
    c     += COPA_BLOCKBYTES;
    *mlen  += COPA_BLOCKBYTES;
    clen  -= COPA_BLOCKBYTES;

    if(clen!=COPA_TAGBYTES) 
    {
      mulx(delta0, delta0);
      mulx(delta1, delta1);
    }
  }

  // Compute and check tag
  mulx(delta1, delta1);

  xor_block(delta1, delta1, delta0);

  mulxp1(delta0, delta0);
  xor_block(delta0, delta0, sigma);
  encrypt_block(delta0,delta0,key);
  xor_block(delta0, delta0, v);
  encrypt_block(delta0,delta0,key);

  xor_block(delta0, delta0, delta1);

  // remove padding
  while((*mlen) > 0)
  {
    (*mlen)--;
    m--;
    if((*m) == 0x80) break;
    if((*m) != 0x00) return -1;
  }

  zerobytes(key, CRYPTO_KEYBYTES);

  return crypto_verify_16(delta0,c);
}
