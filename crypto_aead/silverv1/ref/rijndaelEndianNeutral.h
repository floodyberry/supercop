#ifndef RIJENH
#define RIJENH

/*rijndael byte oriented. Does not attempt to be efficient,
only endian neutral
 Author Daniel Penazzi */

typedef unsigned char u8;



void rijndaelexpandKey(const u8 *k,u8* rk);


void rijndaelEncrypt(u8* rk,const u8* pt,u8* ct);
 

void rijndaelDecrypt(u8* rk,const u8* ct,u8* pt);

#endif


