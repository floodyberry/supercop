#include "params.h"
#include "horst.h"
#include "hash.h"
#include "prg.h"
#include <stdint.h>
#include <stdio.h>

static void expand_seed(unsigned char outseeds[HORST_T*HORST_SKBYTES], const unsigned char inseed[SEED_BYTES])
{
  prg(outseeds, HORST_T*HORST_SKBYTES, inseed);
}

extern void loop_hash_2n_n_mask_8x(unsigned char *out,const unsigned char *in, unsigned long long distance, const unsigned char *mask);


int horst_sign(unsigned char *sig, unsigned char pk[HASH_BYTES], unsigned long long *sigbytes, 
               const unsigned char *m, unsigned long long mlen, 
               const unsigned char seed[SEED_BYTES], 
               const unsigned char masks[2*HORST_LOGT*HASH_BYTES], 
               const unsigned char m_hash[MSGHASH_BYTES])
{
  unsigned char sk[HORST_T*HORST_SKBYTES];
  unsigned int idx;
  int i,j,k;
  int sigpos = 0;

  unsigned char tree[(2*HORST_T-1)*HASH_BYTES]; /*XXX: This wants to be replaced by something more memory-efficient */

  expand_seed(sk, seed);

  // Build the whole tree and save it
#if HORST_SKBYTES != HASH_BYTES
#error "Need to have HORST_SKBYTES == HASH_BYTES"
#endif

  // Generate pk leaves
  for(i=0;i<HORST_T;i+=8)
    hash_n_n_8x(tree+(HORST_T-1+i)*HASH_BYTES, sk+i*HORST_SKBYTES);

  // Hash from level 0 to 1
  loop_hash_2n_n_mask_8x(tree+(32767)*HASH_BYTES,tree+(65535)*HASH_BYTES,8192*HASH_BYTES,masks);
  // Hash from level 1 to 2
  loop_hash_2n_n_mask_8x(tree+(16383)*HASH_BYTES,tree+(32767)*HASH_BYTES,4096*HASH_BYTES,masks+2*HASH_BYTES);
  // Hash from level 2 to 3
  loop_hash_2n_n_mask_8x(tree+(8191)*HASH_BYTES,tree+(16383)*HASH_BYTES,2048*HASH_BYTES,masks+4*HASH_BYTES);
  // Hash from level 3 to 4
  loop_hash_2n_n_mask_8x(tree+(4095)*HASH_BYTES,tree+(8191)*HASH_BYTES,1024*HASH_BYTES,masks+6*HASH_BYTES);
  // Hash from level 4 to 5
  loop_hash_2n_n_mask_8x(tree+(2047)*HASH_BYTES,tree+(4095)*HASH_BYTES,512*HASH_BYTES,masks+8*HASH_BYTES);
  // Hash from level 5 to 6
  loop_hash_2n_n_mask_8x(tree+(1023)*HASH_BYTES,tree+(2047)*HASH_BYTES,256*HASH_BYTES,masks+10*HASH_BYTES);
  // Hash from level 6 to 7
  loop_hash_2n_n_mask_8x(tree+(511)*HASH_BYTES,tree+(1023)*HASH_BYTES,128*HASH_BYTES,masks+12*HASH_BYTES);
  // Hash from level 7 to 8
  loop_hash_2n_n_mask_8x(tree+(255)*HASH_BYTES,tree+(511)*HASH_BYTES,64*HASH_BYTES,masks+14*HASH_BYTES);
  // Hash from level 8 to 9
  loop_hash_2n_n_mask_8x(tree+(127)*HASH_BYTES,tree+(255)*HASH_BYTES,32*HASH_BYTES,masks+16*HASH_BYTES);
  // Hash from level 9 to 10
  loop_hash_2n_n_mask_8x(tree+(63)*HASH_BYTES,tree+(127)*HASH_BYTES,16*HASH_BYTES,masks+18*HASH_BYTES);
  // Hash from level 10 to 11
  loop_hash_2n_n_mask_8x(tree+(31)*HASH_BYTES,tree+(63)*HASH_BYTES,8*HASH_BYTES,masks+20*HASH_BYTES);
  // Hash from level 11 to 12
  loop_hash_2n_n_mask_8x(tree+(15)*HASH_BYTES,tree+(31)*HASH_BYTES,4*HASH_BYTES,masks+22*HASH_BYTES);
  // Hash from level 12 to 13
  loop_hash_2n_n_mask_8x(tree+(7)*HASH_BYTES,tree+(15)*HASH_BYTES,2*HASH_BYTES,masks+24*HASH_BYTES);
  // Hash from level 13 to 14
  for(j=0;j<4;j++)
    hash_2n_n_mask(tree+(3+j)*HASH_BYTES,tree+(7+2*j)*HASH_BYTES,masks+26*HASH_BYTES);
  // Hash from level 14 to 15
  for(j=0;j<2;j++)
      hash_2n_n_mask(tree+(1+j)*HASH_BYTES,tree+(3+2*j)*HASH_BYTES,masks+28*HASH_BYTES);
  // Hash from level 15 to 16
  hash_2n_n_mask(tree+0*HASH_BYTES,tree+1*HASH_BYTES,masks+30*HASH_BYTES);


#if HORST_K != (MSGHASH_BYTES/2)
#error "Need to have HORST_K == (MSGHASH_BYTES/2)"
#endif

  // First write 64 hashes from level 10 to the signature
  for(j=63*HASH_BYTES;j<127*HASH_BYTES;j++)
    sig[sigpos++] = tree[j];

  // Signature consists of HORST_K parts; each part of secret key and HORST_LOGT-4 auth-path hashes
  for(i=0;i<HORST_K;i++)
  {
    idx = m_hash[2*i] + (m_hash[2*i+1]<<8);

    for(k=0;k<HORST_SKBYTES;k++)
      sig[sigpos++] = sk[idx*HORST_SKBYTES+k];

    idx += (HORST_T-1);
    for(j=0;j<HORST_LOGT-6;j++)
    {
      idx = (idx&1)?idx+1:idx-1; // neighbor node
      for(k=0;k<HASH_BYTES;k++)
        sig[sigpos++] = tree[idx*HASH_BYTES+k];
      idx = (idx-1)/2; // parent node
    }
  }
 
  for(i=0;i<HASH_BYTES;i++)
    pk[i] = tree[i];
  
  *sigbytes = HORST_SIGBYTES;
  return 0;
}

int horst_verify(unsigned char *pk, const unsigned char *sig, const unsigned char *m, unsigned long long mlen, const unsigned char masks[2*HORST_LOGT*HASH_BYTES], const unsigned char m_hash[MSGHASH_BYTES])
{
  unsigned char buffer[32*HASH_BYTES];
  const unsigned char *level10;
  unsigned int idx;
  int i,j,k;

#if HORST_K != (MSGHASH_BYTES/2)
#error "Need to have HORST_K == (MSGHASH_BYTES/2)"
#endif

  level10 = sig;
  sig+=64*HASH_BYTES;

  for(i=0;i<HORST_K;i++)
  {
    idx = m_hash[2*i] + (m_hash[2*i+1]<<8);

#if HORST_SKBYTES != HASH_BYTES
#error "Need to have HORST_SKBYTES == HASH_BYTES"
#endif

    if(!(idx&1))
    {
      hash_n_n(buffer,sig);
      for(k=0;k<HASH_BYTES;k++)
        buffer[HASH_BYTES+k] = sig[HORST_SKBYTES+k];
    }
    else
    {
      hash_n_n(buffer+HASH_BYTES,sig);
      for(k=0;k<HASH_BYTES;k++)
        buffer[k] = sig[HORST_SKBYTES+k];
    }
    sig += HORST_SKBYTES+HASH_BYTES;

    for(j=1;j<HORST_LOGT-6;j++)
    {
      idx = idx>>1; // parent node

      if(!(idx&1))
      {
        hash_2n_n_mask(buffer,buffer,masks+2*(j-1)*HASH_BYTES);
        for(k=0;k<HASH_BYTES;k++)
          buffer[HASH_BYTES+k] = sig[k];
      }
      else
      {
        hash_2n_n_mask(buffer+HASH_BYTES,buffer,masks+2*(j-1)*HASH_BYTES);
        for(k=0;k<HASH_BYTES;k++)
          buffer[k] = sig[k];
      }
      sig += HASH_BYTES;
    }

    idx = idx>>1; // parent node
    hash_2n_n_mask(buffer,buffer,masks+2*(HORST_LOGT-7)*HASH_BYTES);

    for(k=0;k<HASH_BYTES;k++)
      if(level10[idx*HASH_BYTES+k] != buffer[k]) 
        goto fail;
  }

  // Compute root from level10
  for(j=0;j<32;j++)
    hash_2n_n_mask(buffer+j*HASH_BYTES, level10+2*j*HASH_BYTES, masks+2*(HORST_LOGT-6)*HASH_BYTES);
  // Hash from level 11 to 12
  for(j=0;j<16;j++)
    hash_2n_n_mask(buffer+j*HASH_BYTES,buffer+2*j*HASH_BYTES,masks+2*(HORST_LOGT-5)*HASH_BYTES);
  // Hash from level 12 to 13
  for(j=0;j<8;j++)
    hash_2n_n_mask(buffer+j*HASH_BYTES,buffer+2*j*HASH_BYTES,masks+2*(HORST_LOGT-4)*HASH_BYTES);
  // Hash from level 13 to 14
  for(j=0;j<4;j++)
    hash_2n_n_mask(buffer+j*HASH_BYTES,buffer+2*j*HASH_BYTES,masks+2*(HORST_LOGT-3)*HASH_BYTES);
  // Hash from level 14 to 15
  for(j=0;j<2;j++)
    hash_2n_n_mask(buffer+j*HASH_BYTES,buffer+2*j*HASH_BYTES,masks+2*(HORST_LOGT-2)*HASH_BYTES);
  // Hash from level 15 to 16
  hash_2n_n_mask(pk, buffer, masks+2*(HORST_LOGT-1)*HASH_BYTES);

  return 0;


fail:
  for(k=0;k<HASH_BYTES;k++)
    pk[k] = 0;
  return -1;
}

