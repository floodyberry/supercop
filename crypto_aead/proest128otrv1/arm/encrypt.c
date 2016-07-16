#include "crypto_aead.h"
#include "crypto_verify_16.h"
#include "api.h"
#include "proest128.h"
#include "zerobytes.h"
#include "otr.h"
    
// Xor two blocks
static void xor_block(unsigned char *r, const unsigned char *x, const unsigned char *y) 
{
	int i;
	for (i = 0; i < OTR_BLOCKBYTES; i++)
		r[i] = x[i] ^ y[i];
}

// Do 10* padding, xlen has to be <= OTR_BLOCKBYTES
static void padblock(unsigned char *r, const unsigned char *x, int xlen) 
{
  int i;
  for(i=0;i<xlen;i++)
    r[i] = x[i];
  if (xlen < OTR_BLOCKBYTES) 
  {
    r[xlen] = 0x80;
    for (i = xlen+1; i < OTR_BLOCKBYTES; ++i)
      r[i] = 0;
  }
}

static void pad2block(unsigned char *r, const unsigned char *x, int xlen) 
{
  int i;
  for(i=0;i<xlen;i++)
    r[i] = x[i];
  if (xlen < 2*OTR_BLOCKBYTES) 
  {
    r[xlen] = 0x80;
    for (i = xlen+1; i < 2*OTR_BLOCKBYTES; ++i)
      r[i] = 0;
  }
}


// Encrypt single block using Proest in single-key Even-Mansour
static void encrypt_block(unsigned char *r, const unsigned char *x, const unsigned char *k) 
{
	proest_ctx y;
	xor_block(r, x, k);
	proest_readstate(&y, r);
	proest_permute(&y);
	proest_writestate(r, &y);
	xor_block(r, r, k);
}

static void feistel(unsigned char *c, const unsigned char *m, const unsigned char *l, const unsigned char *delta, const unsigned char *k)
{
  unsigned char buf[OTR_BLOCKBYTES];
  int i;

  xor_block(buf, m, l);
  encrypt_block(buf, buf, k);
  xor_block(buf, buf, m+OTR_BLOCKBYTES);
  xor_block(c+OTR_BLOCKBYTES, l, delta);
  xor_block(c+OTR_BLOCKBYTES, c+OTR_BLOCKBYTES, buf);
  encrypt_block(c+OTR_BLOCKBYTES,c+OTR_BLOCKBYTES,k);
  for(i=0;i<OTR_BLOCKBYTES;i++)
  {
    c[i+OTR_BLOCKBYTES] ^= m[i];
    c[i] = buf[i];
  }
}

static void feistelback(unsigned char *m, const unsigned char *c, const unsigned char *l, const unsigned char *delta, const unsigned char *k)
{
  unsigned char buf[OTR_BLOCKBYTES];
  int i;

  xor_block(buf, c, l);
  xor_block(buf, buf, delta);
  encrypt_block(buf,buf,k);
  xor_block(buf, buf, c+OTR_BLOCKBYTES);
  xor_block(m+OTR_BLOCKBYTES, l, buf);
  encrypt_block(m+OTR_BLOCKBYTES,m+OTR_BLOCKBYTES,k);
  for(i=0;i<OTR_BLOCKBYTES;i++)
  {
    m[i+OTR_BLOCKBYTES] ^= c[i];
    m[i] = buf[i];
  }
}


// Multiplication by x
static void mulx(unsigned char *r, const unsigned char *x) 
{
	int i;
  unsigned char red0, red1;
  unsigned char t[OTR_BLOCKBYTES];
  for(i=0;i<OTR_BLOCKBYTES;i++)
    t[i] = x[i];

  red0  = -(t[OTR_BLOCKBYTES-1] >> 7);
  red1  = 0x04 & red0;
  red0 &= 0x25;

	for (i = 1; i < OTR_BLOCKBYTES; ++i)
    r[i] = (t[i] << 1) | (t[i-1] >> 7);
  r[0]  = (t[0] << 1) ^ red0;
  r[1] ^= red1;
}


// Multiplication by (x+1)
static void mulxp1(unsigned char *r, const unsigned char *x) 
{
  int i;
  unsigned char red0, red1;
  unsigned char t[OTR_BLOCKBYTES];

  red0  = -(x[OTR_BLOCKBYTES-1] >> 7);
  red1  = 0x04 & red0;
  red0 &= 0x25;
	for (i = 1; i < OTR_BLOCKBYTES; ++i)
    t[i] = (x[i] << 1) | (x[i-1] >> 7);
  t[0]  = (x[0] << 1) ^ red0;
  t[1] ^= red1;
	for (i = 0; i < OTR_BLOCKBYTES; ++i)
    r[i] = t[i] ^ x[i];
}


static void otr_process_ad(unsigned char *ta,
    const unsigned char *ad, unsigned long long adlen, 
    const unsigned char *k)
{
  unsigned char buf[OTR_BLOCKBYTES];
  unsigned char xi[OTR_BLOCKBYTES];
  unsigned char q[OTR_BLOCKBYTES];
  unsigned char gamma[OTR_BLOCKBYTES];
  int i;
  
  if(!adlen)
  {
    for(i=0;i<OTR_BLOCKBYTES;i++)
      ta[i] = 0;
    return;
  }

  for(i=0;i<OTR_BLOCKBYTES;i++)
    gamma[i] = 0;
  encrypt_block(gamma, gamma, k);

  mulx(q, gamma);
  mulx(q, q);

  for(i=0;i<OTR_BLOCKBYTES;i++)
    xi[i] = 0;

  while(adlen > OTR_BLOCKBYTES)
  {
    xor_block(buf, q, ad);
    encrypt_block(buf,buf,k);
    xor_block(xi, xi, buf);
    mulx(q, q);

    ad    += OTR_BLOCKBYTES;
    adlen -= OTR_BLOCKBYTES;
  }
  padblock(buf, ad, adlen);
  xor_block(xi, xi, buf);

  if(adlen != OTR_BLOCKBYTES)
  {
    xor_block(buf, xi, q);
    xor_block(buf, buf, gamma);
    encrypt_block(ta, buf, k);
  }
  else
  {
    xor_block(buf, xi, q);
    mulx(q, gamma);
    xor_block(buf, buf, q);
    encrypt_block(ta, buf, k);
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
  unsigned char key[CRYPTO_KEYBYTES];
  unsigned char ta[OTR_BLOCKBYTES];
  unsigned char te[OTR_BLOCKBYTES];
  unsigned char l[OTR_BLOCKBYTES];
  unsigned char delta[OTR_BLOCKBYTES];
  unsigned char sigma[OTR_BLOCKBYTES];
  unsigned char buf[2*OTR_BLOCKBYTES];
  unsigned long long i;
  
  *clen = 0;

  for(i=0;i<CRYPTO_KEYBYTES;i++)
    key[i] = k[i];

  // Init sigma, l and delta
  for(i=0;i<OTR_BLOCKBYTES;i++)
    sigma[i] = 0;
  padblock(delta,npub,CRYPTO_NPUBBYTES);
  encrypt_block(delta,delta,key);
  mulx(l,delta);
  mulx(l,l);

  // Compute TA
  otr_process_ad(ta, ad, adlen, key);

  // Process full double-blocks
  while(mlen >= 2*OTR_BLOCKBYTES)
  {
    xor_block(sigma, sigma, m+OTR_BLOCKBYTES);
    feistel(c, m, l, delta, key);
    mulx(l,l);

    m     += 2*OTR_BLOCKBYTES;
    c     += 2*OTR_BLOCKBYTES;
    mlen  -= 2*OTR_BLOCKBYTES;
    *clen += 2*OTR_BLOCKBYTES;
  }

  if(mlen >= OTR_BLOCKBYTES)
  {
    pad2block(buf,m,mlen);
    xor_block(sigma, sigma, buf+OTR_BLOCKBYTES);
    feistel(c, buf, l, delta, key);
    mulx(l,l);
    c     += 2*OTR_BLOCKBYTES;
    *clen += 2*OTR_BLOCKBYTES;
    xor_block(l, l, delta);
  }
  else
  {
    padblock(buf,m,mlen);
    xor_block(sigma, sigma, buf);
    encrypt_block(buf+OTR_BLOCKBYTES, l, key);
    xor_block(c,buf,buf+OTR_BLOCKBYTES);

    *clen += OTR_BLOCKBYTES;
    c     += OTR_BLOCKBYTES;
  }

  // Compute TE
  mulxp1(l,l);

  xor_block(te, sigma, l);
  xor_block(te, te, delta);
  encrypt_block(te, te, key);

  for(i=0;i<OTR_TAGBYTES;i++)
    c[i] = te[i] ^ ta[i];
  *clen += OTR_TAGBYTES;

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
  unsigned char key[CRYPTO_KEYBYTES];
  unsigned char ta[OTR_BLOCKBYTES];
  unsigned char te[OTR_BLOCKBYTES];
  unsigned char l[OTR_BLOCKBYTES];
  unsigned char delta[OTR_BLOCKBYTES];
  unsigned char sigma[OTR_BLOCKBYTES];
  unsigned char buf[2*OTR_BLOCKBYTES];
  unsigned long long i;

  if(clen < CRYPTO_ABYTES) return -1;
  if((clen-OTR_TAGBYTES) & (OTR_BLOCKBYTES-1)) return -1;

  *mlen = 0;

  for(i=0;i<CRYPTO_KEYBYTES;i++)
    key[i] = k[i];

  // Compute TA
  otr_process_ad(ta, ad, adlen, key);

  // Init sigma, l and delta
  for(i=0;i<OTR_BLOCKBYTES;i++)
    sigma[i] = 0;
  padblock(delta,npub,CRYPTO_NPUBBYTES);
  encrypt_block(delta,delta,key);
  mulx(l,delta);
  mulx(l,l);

  // Process full double-blocks
  while(clen-OTR_TAGBYTES >= 2*OTR_BLOCKBYTES)
  {
    feistelback(m, c, l, delta, key);
    xor_block(sigma, sigma, m+OTR_BLOCKBYTES);
    mulx(l,l);

    m     += 2*OTR_BLOCKBYTES;
    c     += 2*OTR_BLOCKBYTES;
    clen  -= 2*OTR_BLOCKBYTES;
    *mlen += 2*OTR_BLOCKBYTES;
  }

  if(clen-OTR_TAGBYTES) // clen == OTR_BLOCKBYTES
  {
    encrypt_block(buf, l, key);
    xor_block(m,c,buf);
    xor_block(sigma, sigma, m);

    *mlen += OTR_BLOCKBYTES;
    m     += OTR_BLOCKBYTES;
    c     += OTR_BLOCKBYTES;
  }
  else
  {
    xor_block(l, l, delta);
  }

  // Compute TE
  mulxp1(l,l);
  xor_block(te, sigma, l);
  xor_block(te, te, delta);
  encrypt_block(te, te, key);
 
  for(i=0;i<OTR_TAGBYTES;i++)
    te[i] ^= ta[i];
 
  //remove padding
  while((*mlen) > 0)
  {
    (*mlen)--;
    m--;
    if((*m) == 0x80) break;
    if((*m) != 0x00) return -1;
  }
  
  zerobytes(key, CRYPTO_KEYBYTES);

  return crypto_verify_16(te, c);
}
