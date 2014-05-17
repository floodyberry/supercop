#include "crypto_aead.h"

#include "zerobytes.h"
#include "proest128.h"
#include "ape.h"

static void ape_rxor(unsigned char v[APE_RBYTES], const unsigned char x[APE_RBYTES])
{
  int i;
  for(i=0;i<APE_RBYTES;i++)
    v[i] ^= x[i];
}

static void ape_rset(unsigned char v[APE_RBYTES], const unsigned char x[APE_RBYTES])
{
  int i;
  for(i=0;i<APE_RBYTES;i++)
    v[i] = x[i];
}


static void ape_cxor(unsigned char v[APE_CBYTES], const unsigned char x[APE_CBYTES])
{
  int i;
  for(i=0;i<APE_CBYTES;i++)
    v[i] ^= x[i];
}



int crypto_aead_encrypt(
	unsigned char *c, 			  unsigned long long *clen,
	const unsigned char *m, 	unsigned long long mlen,
	const unsigned char *ad, 	unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
)
{
  proest_ctx x; 
  unsigned char v[PROEST_STATEBYTES];
  unsigned char buf[APE_RBYTES];
  unsigned char key[CRYPTO_KEYBYTES];
  unsigned long long i;

  // Save k
  for(i=0;i<CRYPTO_KEYBYTES;i++)
    key[i] = k[i];

  *clen = 0;
  for(i=0;i<APE_RBYTES;i++)
    v[i] = 0;
  for(i=0;i<APE_CBYTES;i++)
    v[i+APE_RBYTES] = key[i];

  // Consume the nonce (32 bytes = 2 blocks)
  ape_rxor(v, npub);

  proest_readstate(&x, v);
  proest_permute(&x);
  proest_writestate(v, &x);

  ape_rxor(v, npub+APE_RBYTES);
  proest_readstate(&x, v);
  proest_permute(&x);
  proest_writestate(v, &x);

  // AD full blocks
  while(adlen>=APE_RBYTES)
  {
    ape_rxor(v, ad);
    proest_readstate(&x, v);
    proest_permute(&x);
    proest_writestate(v, &x);

    adlen -= APE_RBYTES;
    ad    += APE_RBYTES;
  }
  // AD padded block
  for(i=0;i<adlen;i++)
    buf[i] = ad[i];
  buf[adlen] = 0x80;
  for(i=adlen+1;i<APE_RBYTES;i++) 
    buf[i] = 0;
  ape_rxor(v, buf);
  proest_readstate(&x, v);
  proest_permute(&x);
  proest_writestate(v, &x);
  
  v[PROEST_STATEBYTES-1] ^= 1;

  /*
  printf("INTERMEDIATE\n");
  for(i=0;i<PROEST_STATEBYTES;i++)
    printf("%02x",v[i]);
  printf("\n");
  printf("\n");
  */

  // message full blocks
  while(mlen>=APE_RBYTES)
  {
    ape_rxor(v, m);
    proest_readstate(&x, v);
    proest_permute(&x);
    proest_writestate(v, &x);
    for(i=0;i<APE_RBYTES;i++)
      c[i] = v[i];
    mlen  -= APE_RBYTES;
    m     += APE_RBYTES;
    c     += APE_RBYTES;
    *clen += APE_RBYTES;
  }
  // message padded block
  for(i=0;i<mlen;i++)
    buf[i] = m[i];
  buf[mlen] = 0x80;
  for(i=mlen+1;i<APE_RBYTES;i++) 
    buf[i] = 0;
  ape_rxor(v, buf);

  proest_readstate(&x, v);
  proest_permute(&x);
  proest_writestate(v, &x);

  /*
  printf("INTERMEDIATE\n");
  for(i=0;i<PROEST_STATEBYTES;i++)
    printf("%02x",v[i]);
  printf("\n");
  printf("\n");
  */

  for(i=0;i<APE_RBYTES;i++)
    c[i] = v[i];
  *clen += APE_RBYTES;
  c+=APE_RBYTES;

  ape_cxor(v+APE_RBYTES, key);

  for(i=0;i<APE_CBYTES;i++)
    c[i] = v[i+APE_RBYTES];
  *clen += APE_CBYTES;

  zerobytes(key,CRYPTO_KEYBYTES);

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
  proest_ctx x; 
  unsigned char v[PROEST_STATEBYTES];
  unsigned char iv[PROEST_STATEBYTES];
  unsigned char buf[APE_RBYTES];
  unsigned long long i;
  int r;

  for(i=0;i<APE_RBYTES;i++)
    v[i] = 0;
  for(i=0;i<APE_CBYTES;i++)
    v[i+APE_RBYTES] = k[i];

  // Consume the nonce (32 bytes = 2 blocks)
  ape_rxor(v, npub);
  proest_readstate(&x, v);
  proest_permute(&x);
  proest_writestate(v, &x);

  ape_rxor(v, npub+APE_RBYTES);
  proest_readstate(&x, v);
  proest_permute(&x);
  proest_writestate(v, &x);

  // AD full blocks
  while(adlen>=APE_RBYTES)
  {
    ape_rxor(v, ad);
    proest_readstate(&x, v);
    proest_permute(&x);
    proest_writestate(v, &x);

    adlen -= APE_RBYTES;
    ad    += APE_RBYTES;
  }
  // AD padded block
  for(i=0;i<adlen;i++)
    buf[i] = ad[i];
  buf[adlen] = 0x80;
  for(i=adlen+1;i<APE_RBYTES;i++) 
    buf[i] = 0;
  ape_rxor(v, buf);
  proest_readstate(&x, v);
  proest_permute(&x);
  proest_writestate(iv, &x);
  
  iv[PROEST_STATEBYTES-1] ^= 1;

  // Now go backwards through the message
  *mlen = 0;
  m+=clen-PROEST_STATEBYTES;
  c+=clen-PROEST_STATEBYTES;
  clen-=PROEST_STATEBYTES;

  // Init state
  for(i=0;i<PROEST_STATEBYTES;i++)
    v[i] = c[i];

  ape_cxor(v+APE_RBYTES, k);

  // Process message
  proest_readstate(&x, v);
  proest_inverse_permute(&x);
  proest_writestate(v, &x);
 
  while(clen>=APE_RBYTES)
  {
    c     -= APE_RBYTES;
    clen  -= APE_RBYTES;

    for(i=0;i<APE_RBYTES;i++)
      m[i] = v[i] ^ c[i];
    
    m     -= APE_RBYTES;
    *mlen += APE_RBYTES;
    
    ape_rset(v,c);

    proest_readstate(&x, v);
    proest_inverse_permute(&x);
    proest_writestate(v, &x);
  }

  for(i=0;i<APE_RBYTES;i++)
    m[i] = v[i] ^ iv[i];
  *mlen += APE_RBYTES;
    
  r = 0;
  // Check padding
  for(i=(*mlen)-1; ;i--)
  {
    (*mlen)--;
    if((m[i] == 0x80) || (i == 0)) break;
    r |= m[i];
  }
    
  for(i=0;i<APE_CBYTES;i++)
    r |= (v[i+APE_RBYTES] ^ iv[i+APE_RBYTES]);

  if(r)
    return -1;
  else
    return 0;
}
