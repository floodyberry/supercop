#ifndef HASH_H
#define HASH_H

#include "params.h"

int msg_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen);
int varlen_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen);
int hash_2n_n(unsigned char *out,const unsigned char *in);
int hash_2n_n_mask(unsigned char *out,const unsigned char *in,const unsigned char *mask);
int hash_n_n(unsigned char *out,const unsigned char *in);
int hash_n_n_mask(unsigned char *out,const unsigned char *in,const unsigned char *mask);

int hash_2n_n_8x(unsigned char *out,const unsigned char *in, 
      unsigned long long out_dist, unsigned long long in_dist);
int hash_2n_n_mask_8x(unsigned char *out,const unsigned char *in, 
      unsigned long long out_dist, unsigned long long in_dist,
      const unsigned char *mask);
int hash_n_n_8x(unsigned char *out,const unsigned char *in);

#endif
