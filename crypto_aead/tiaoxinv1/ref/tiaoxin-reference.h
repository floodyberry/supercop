#ifndef TIAOXIN_REFERENCE_H
#define TIAOXIN_REFERENCE_H


int tiaoxin_reference_encrypt(
       const unsigned char *ad,unsigned long long adlen,
       const unsigned char *m,unsigned long long mlen,
       const unsigned char *nsec,
       const unsigned char *npub,
       const unsigned char *k,
       unsigned char *c,unsigned long long *clen
     );

int tiaoxin_reference_decrypt(
       unsigned char *m,unsigned long long *mlen,
       unsigned char *nsec,
       const unsigned char *c,unsigned long long clen,
       const unsigned char *ad,unsigned long long adlen,
       const unsigned char *npub,
       const unsigned char *k
     );



typedef unsigned char word[16];


#endif