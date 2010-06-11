#ifndef __hash_h
#define __hash_h


extern int crypto_hash_groestl256_bitsliced(unsigned char *out, const unsigned char *in, unsigned long long inlen);

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen);


#endif /* __hash_h */
