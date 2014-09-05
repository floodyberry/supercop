#include "crypto_sign.h"
#include <stdlib.h>
#include <string.h>

#include "api.h"
#include "randombytes.h"
#include "zerobytes.h"
#include "params.h"
#include "wots.h"
#include "horst.h"
#include "hash.h"
#include "crypto_hash_blake512.h"

#define BIGINT_BYTES ((TOTALTREE_HEIGHT-SUBTREE_HEIGHT+7)/8)

#if (TOTALTREE_HEIGHT-SUBTREE_HEIGHT) > 64
#error "TOTALTREE_HEIGHT-SUBTREE_HEIGHT must be at most 64" 
#endif

typedef struct{
  int level;
  unsigned long long subtree;
  int subleaf;
} leafaddr;


static void get_seed(unsigned char seed[SEED_BYTES], const unsigned char *sk, const leafaddr *a)
{
#if (N_LEVELS > 15) && (N_LEVELS < 8)
#error "Need to have 8 <= N_LEVELS <= 15"
#endif

#if SUBTREE_HEIGHT != 5
#error "Need to have SUBTREE_HEIGHT == 5"
#endif

#if TOTALTREE_HEIGHT != 60
#error "Need to have TOTALTREE_HEIGHT == 60"
#endif
  unsigned char buffer[SEED_BYTES+8];
  unsigned long long t;
  int i;

  for(i=0;i<SEED_BYTES;i++)
    buffer[i] = sk[i];

  //4 bits to encode level
  t  = a->level;
  //55 bits to encode subtree
  t |= a->subtree << 4;
  //5 bits to encode leaf
  t |= (unsigned long long)a->subleaf << 59;

  for(i=0;i<8;i++)
    buffer[SEED_BYTES+i] = (t >> 8*i) & 0xff;
  
#if SEED_BYTES != HASH_BYTES
#error "Need to have SEED_BYTES == HASH_BYTES"
#endif
  varlen_hash(seed,buffer,SEED_BYTES+8);
}


static void l_tree(unsigned char *leaf, unsigned char *wots_pk, const unsigned char *masks)
{
  int l = WOTS_L;
  int i,j = 0;
  for(i=0;i<WOTS_LOG_L;i++)
  {
    for(j=0 ;j < (l>>1);j++)
      hash_2n_n_mask(wots_pk+j*HASH_BYTES,wots_pk+j*2*HASH_BYTES, masks+i*2*HASH_BYTES);

    if(l&1)
    {
      memcpy(wots_pk+(l>>1)*HASH_BYTES,wots_pk+(l-1)*HASH_BYTES, HASH_BYTES);
      l=(l>>1)+1;
    } 
    else 
      l=(l>>1);
  }
  memcpy(leaf,wots_pk,HASH_BYTES);
}


static void gen_leaf_wots(unsigned char leaf[HASH_BYTES], const unsigned char *masks, const unsigned char *sk, const leafaddr *a)
{
  unsigned char seed[SEED_BYTES];
  unsigned char pk[WOTS_L*HASH_BYTES];

  get_seed(seed, sk, a);
  wots_pkgen(pk, seed, masks);

  l_tree(leaf, pk, masks); 
}


static void treehash(unsigned char *node, int height, const unsigned char *sk, const leafaddr *leaf, const unsigned char *masks)
{

  leafaddr a = *leaf;
  int lastnode,i;
  unsigned char stack[(height+1)*HASH_BYTES];
  unsigned int  stacklevels[height+1];
  unsigned int  stackoffset=0;
  unsigned int maskoffset =0;

  lastnode = a.subleaf+(1<<height);

  for(;a.subleaf<lastnode;a.subleaf++) 
  {
    gen_leaf_wots(stack+stackoffset*HASH_BYTES,masks,sk,&a);
    stacklevels[stackoffset] = 0;
    stackoffset++;
    while(stackoffset>1 && stacklevels[stackoffset-1] == stacklevels[stackoffset-2])
    {
      //MASKS
      maskoffset = 2*(stacklevels[stackoffset-1] + WOTS_LOG_L)*HASH_BYTES;
      hash_2n_n_mask(stack+(stackoffset-2)*HASH_BYTES,stack+(stackoffset-2)*HASH_BYTES,
          masks+maskoffset);
      stacklevels[stackoffset-2]++;
      stackoffset--;
    }
  }
  for(i=0;i<HASH_BYTES;i++)
    node[i] = stack[i];
}


static void validate_authpath(unsigned char root[HASH_BYTES], const unsigned char leaf[HASH_BYTES], unsigned int leafidx, const unsigned char *authpath, const unsigned char *masks, unsigned int height)
{
  int i,j;
  unsigned char buffer[2*HASH_BYTES];

  if(leafidx&1)
  {
    for(j=0;j<HASH_BYTES;j++)
      buffer[HASH_BYTES+j] = leaf[j];
    for(j=0;j<HASH_BYTES;j++)
      buffer[j] = authpath[j];
  }
  else
  {
    for(j=0;j<HASH_BYTES;j++)
      buffer[j] = leaf[j];
    for(j=0;j<HASH_BYTES;j++)
      buffer[HASH_BYTES+j] = authpath[j];
  }
  authpath += HASH_BYTES;

  for(i=0;i<height-1;i++)
  {
    leafidx >>= 1;
    if(leafidx&1)
    {
      hash_2n_n_mask(buffer+HASH_BYTES,buffer,masks+2*(WOTS_LOG_L+i)*HASH_BYTES);
      for(j=0;j<HASH_BYTES;j++)
        buffer[j] = authpath[j];
    }
    else
    {
      hash_2n_n_mask(buffer,buffer,masks+2*(WOTS_LOG_L+i)*HASH_BYTES);
      for(j=0;j<HASH_BYTES;j++)
        buffer[j+HASH_BYTES] = authpath[j];
    }
    authpath += HASH_BYTES;
  }
  hash_2n_n_mask(root,buffer,masks+2*(WOTS_LOG_L+height-1)*HASH_BYTES);
}


static void compute_authpath_wots(unsigned char root[HASH_BYTES], unsigned char *authpath, const leafaddr *a, const unsigned char *sk, const unsigned char *masks, unsigned int height)
{
  int i, idx, j;
  leafaddr ta = *a;

  unsigned char tree[2*(1<<SUBTREE_HEIGHT)*HASH_BYTES];
  unsigned char seed[(1<<SUBTREE_HEIGHT)*SEED_BYTES];
  unsigned char pk[(1<<SUBTREE_HEIGHT)*WOTS_L*HASH_BYTES];

  // level 0
  for(ta.subleaf = 0; ta.subleaf < (1<<SUBTREE_HEIGHT); ta.subleaf++)
    get_seed(seed + ta.subleaf * SEED_BYTES, sk, &ta);

  for(ta.subleaf = 0; ta.subleaf < (1<<SUBTREE_HEIGHT); ta.subleaf++)
    wots_pkgen(pk + ta.subleaf * WOTS_L*HASH_BYTES, seed + ta.subleaf * SEED_BYTES, masks);

  for(ta.subleaf = 0; ta.subleaf < (1<<SUBTREE_HEIGHT); ta.subleaf++)
    l_tree(tree + (1<<SUBTREE_HEIGHT)*HASH_BYTES + ta.subleaf * HASH_BYTES,
        pk  + ta.subleaf * WOTS_L*HASH_BYTES, masks);

  int level = 0;

  // tree
  for (i = (1<<SUBTREE_HEIGHT); i > 0; i>>=1)
  {
    for (j = 0; j < i; j+=2)
      hash_2n_n_mask(tree + (i>>1)*HASH_BYTES + (j>>1) * HASH_BYTES, 
          tree + i*HASH_BYTES + j * HASH_BYTES,
          masks+2*(WOTS_LOG_L + level)*HASH_BYTES);

    level++;
  }


  idx = a->subleaf;

  // copy authpath
  for(i=0;i<height;i++)
    memcpy(authpath + i*HASH_BYTES, tree + ((1<<SUBTREE_HEIGHT)>>i)*HASH_BYTES + ((idx >> i) ^ 1) * HASH_BYTES, HASH_BYTES);

  // copy root
  memcpy(root, tree+HASH_BYTES, HASH_BYTES);
}


/*
 * Format pk: [|N_MASKS*HASH_BYTES| Bitmasks || root]
 */
int crypto_sign_keypair(unsigned char *pk, unsigned char *sk)
{
  leafaddr a;

  randombytes(sk,CRYPTO_SECRETKEYBYTES);
  memcpy(pk,sk+SEED_BYTES,N_MASKS*HASH_BYTES);

  // Initialization of top-subtree address
  a.level   = N_LEVELS - 1;
  a.subtree = 0;
  a.subleaf = 0;

  // Construct top subtree
  treehash(pk+(N_MASKS*HASH_BYTES), SUBTREE_HEIGHT, sk, &a, pk);
  return 0;
}


int crypto_sign(unsigned char *sm,unsigned long long *smlen, const unsigned char *m,unsigned long long mlen, const unsigned char *sk)
{
  leafaddr a;
  unsigned long long i;
  unsigned long long leafidx;
  unsigned char R[MESSAGE_HASH_SEED_BYTES];
  unsigned char m_h[MSGHASH_BYTES];
  unsigned long long rnd[8];
  unsigned long long horst_sigbytes;
  unsigned char root[HASH_BYTES];
  unsigned char seed[SEED_BYTES];
  unsigned char masks[N_MASKS*HASH_BYTES];
  unsigned char *pk;
  unsigned char tsk[CRYPTO_SECRETKEYBYTES];

  for(i=0;i<CRYPTO_SECRETKEYBYTES;i++)
    tsk[i] = sk[i];

  // create leafidx deterministically
  {
    // shift scratch upwards so we can reuse msg later
    unsigned char* scratch = sm + CRYPTO_BYTES - SK_RAND_SEED_BYTES;

    // Copy message to scratch backwards to handle m = sm overlap
    for(i=mlen;i>0;i--)
      scratch[SK_RAND_SEED_BYTES+i-1] = m[i-1];
    // Copy secret random seed to scratch
    memcpy(scratch, tsk + CRYPTO_SECRETKEYBYTES - SK_RAND_SEED_BYTES, SK_RAND_SEED_BYTES);

    crypto_hash_blake512((unsigned char*)rnd, scratch, SK_RAND_SEED_BYTES + mlen); //XXX: Why Blake 512?

    // wipe sk
    zerobytes(scratch,SK_RAND_SEED_BYTES);

#if TOTALTREE_HEIGHT != 60
#error "Implemented for TOTALTREE_HEIGHT == 60!"
#endif

    leafidx = rnd[0] & 0xfffffffffffffff;

#if MESSAGE_HASH_SEED_BYTES != 32
#error "Implemented for MESSAGE_HASH_SEED_BYTES == 32!"
#endif
    memcpy(R, &rnd[2], MESSAGE_HASH_SEED_BYTES);

    // prepare msg_hash
    scratch = sm + CRYPTO_BYTES - MESSAGE_HASH_SEED_BYTES - CRYPTO_PUBLICKEYBYTES;

    // cpy R
    memcpy(scratch, R, MESSAGE_HASH_SEED_BYTES);

    // construct and cpy pk
    leafaddr a;
    a.level = N_LEVELS - 1;
    a.subtree = 0;
    a.subleaf=0;

    pk = scratch + MESSAGE_HASH_SEED_BYTES;

    memcpy(pk, tsk+SEED_BYTES, N_MASKS*HASH_BYTES);

    treehash(pk+(N_MASKS*HASH_BYTES), SUBTREE_HEIGHT, tsk, &a, pk);

    // message already on the right spot

    msg_hash(m_h, scratch, mlen + MESSAGE_HASH_SEED_BYTES + CRYPTO_PUBLICKEYBYTES);
  }

  a.level   = N_LEVELS; // Use unique value $d$ for HORST address.
  a.subleaf = leafidx & ((1<<SUBTREE_HEIGHT)-1);
  a.subtree = leafidx >> SUBTREE_HEIGHT;

  *smlen = 0;

  for(i=0; i<MESSAGE_HASH_SEED_BYTES; i++)
    sm[i] = R[i];

  sm += MESSAGE_HASH_SEED_BYTES;
  *smlen += MESSAGE_HASH_SEED_BYTES;

  memcpy(masks, tsk+SEED_BYTES,N_MASKS*HASH_BYTES);
  for(i=0;i<(TOTALTREE_HEIGHT+7)/8;i++)
    sm[i] = (leafidx >> 8*i) & 0xff;

  sm += (TOTALTREE_HEIGHT+7)/8;
  *smlen += (TOTALTREE_HEIGHT+7)/8;

  get_seed(seed, tsk, &a);
  horst_sign(sm, root, &horst_sigbytes, m, mlen, seed, masks, m_h);

  sm += horst_sigbytes;
  *smlen += horst_sigbytes;
  
  for(i=0;i<N_LEVELS;i++)
  {
    a.level = i;

    get_seed(seed, tsk, &a); //XXX: Don't use the same address as for horst_sign here!
    wots_sign(sm, root, seed, masks);
    sm += WOTS_SIGBYTES;
    *smlen += WOTS_SIGBYTES;

    compute_authpath_wots(root,sm,&a,tsk,masks,SUBTREE_HEIGHT);
    sm += SUBTREE_HEIGHT*HASH_BYTES;
    *smlen += SUBTREE_HEIGHT*HASH_BYTES;
    
    a.subleaf = a.subtree & ((1<<SUBTREE_HEIGHT)-1);
    a.subtree >>= SUBTREE_HEIGHT;
  }

  zerobytes(tsk, CRYPTO_SECRETKEYBYTES);

  *smlen += mlen;

  return 0;
}



int crypto_sign_open(unsigned char *m,unsigned long long *mlen, const unsigned char *sm,unsigned long long smlen, const unsigned char *pk)
{
  unsigned long long i;
  unsigned long long leafidx=0;
  unsigned char wots_pk[WOTS_L*HASH_BYTES];
  unsigned char pkhash[HASH_BYTES];
  unsigned char root[HASH_BYTES];
  unsigned char sig[CRYPTO_BYTES];
  unsigned char *sigp;
  unsigned char tpk[CRYPTO_PUBLICKEYBYTES];

  if(smlen < CRYPTO_BYTES)
    return -1;

  unsigned char m_h[MSGHASH_BYTES];

  for(i=0;i<CRYPTO_PUBLICKEYBYTES;i++)
    tpk[i] = pk[i];

  // construct message hash
  {
    unsigned char R[MESSAGE_HASH_SEED_BYTES];

    for(i=0; i<MESSAGE_HASH_SEED_BYTES; i++)
      R[i] = sm[i];

    int len = smlen - CRYPTO_BYTES;

    unsigned char *scratch = m;

    memcpy(sig, sm, CRYPTO_BYTES);

    memcpy(scratch + MESSAGE_HASH_SEED_BYTES + CRYPTO_PUBLICKEYBYTES, sm + CRYPTO_BYTES, len);

    // cpy R
    memcpy(scratch, R, MESSAGE_HASH_SEED_BYTES);

    // cpy pub key
    memcpy(scratch + MESSAGE_HASH_SEED_BYTES, tpk, CRYPTO_PUBLICKEYBYTES);

    msg_hash(m_h, scratch, len + MESSAGE_HASH_SEED_BYTES + CRYPTO_PUBLICKEYBYTES);
  }
  sigp = &sig[0];

  sigp += MESSAGE_HASH_SEED_BYTES;
  smlen -= MESSAGE_HASH_SEED_BYTES;


  for(i=0;i<(TOTALTREE_HEIGHT+7)/8;i++)
    leafidx ^= (((unsigned long long)sigp[i]) << 8*i);


  horst_verify(root, sigp+(TOTALTREE_HEIGHT+7)/8, 
      sigp+CRYPTO_BYTES-MESSAGE_HASH_SEED_BYTES, smlen-CRYPTO_BYTES-MESSAGE_HASH_SEED_BYTES, tpk, m_h);

  sigp += (TOTALTREE_HEIGHT+7)/8;
  smlen -= (TOTALTREE_HEIGHT+7)/8;
  
  sigp += HORST_SIGBYTES;
  smlen -= HORST_SIGBYTES;

  for(i=0;i<N_LEVELS;i++)
  {
    wots_verify(wots_pk, sigp, root, tpk);

    sigp += WOTS_SIGBYTES;
    smlen -= WOTS_SIGBYTES;

    l_tree(pkhash, wots_pk,tpk);
    validate_authpath(root, pkhash, leafidx & 0x1f, sigp, tpk, SUBTREE_HEIGHT);  
    leafidx >>= 5;

    sigp += SUBTREE_HEIGHT*HASH_BYTES;
    smlen -= SUBTREE_HEIGHT*HASH_BYTES;
  }

  for(i=0;i<HASH_BYTES;i++)
    if(root[i] != tpk[i+N_MASKS*HASH_BYTES])
      goto fail;
  
  *mlen = smlen;
  for(i=0;i<*mlen;i++)
    m[i] = m[i+MESSAGE_HASH_SEED_BYTES+CRYPTO_PUBLICKEYBYTES];

  return 0;
  
  
fail:
  *mlen = smlen;
  for(i=0;i<*mlen;i++)
    m[i] = 0;
  *mlen = -1;
  return -1;
}

