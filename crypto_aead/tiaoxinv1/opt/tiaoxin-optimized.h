#ifndef TIAOXIN_OPTIMIZED_H
#define TIAOXIN_OPTIMIZED_H

int tiaoxin_optimized_encrypt(
       const unsigned char *ad,unsigned long long adlen,
       const unsigned char *m,unsigned long long mlen,
       const unsigned char *nsec,
       const unsigned char *npub,
       const unsigned char *k,
       unsigned char *c,unsigned long long *clen
     );


int tiaoxin_optimized_decrypt(
       unsigned char *m,unsigned long long *mlen,
       unsigned char *nsec,
       const unsigned char *c,unsigned long long clen,
       const unsigned char *ad,unsigned long long adlen,
       const unsigned char *npub,
       const unsigned char *k
     );


#endif