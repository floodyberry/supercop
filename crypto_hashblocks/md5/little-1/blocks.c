#include "crypto_hashblocks.h"

typedef unsigned int uint32;

#define block(i) (*(uint32 *) (in + 4 * (i)))

#define F1(w,x,y,z,i,c,s) w += (z ^ (x & (y ^ z))) + block(i) + c; w = (w << s) | (w >> (32 - s)); w += x;
#define F2(w,x,y,z,i,c,s) w += (y ^ (z & (x ^ y))) + block(i) + c; w = (w << s) | (w >> (32 - s)); w += x;
#define F3(w,x,y,z,i,c,s) w += (x ^ y ^ z)         + block(i) + c; w = (w << s) | (w >> (32 - s)); w += x;
#define F4(w,x,y,z,i,c,s) w += (y ^ (x | ~z))      + block(i) + c; w = (w << s) | (w >> (32 - s)); w += x;

int crypto_hashblocks(unsigned char *statebytes,const unsigned char *in,unsigned long long inlen)
{
  uint32 *state = (uint32 *) statebytes;
  uint32 a = state[0];
  uint32 b = state[1];
  uint32 c = state[2];
  uint32 d = state[3];

  while (inlen >= 64) {
    F1(a,b,c,d, 0,0xd76aa478, 7)
    F1(d,a,b,c, 1,0xe8c7b756,12)
    F1(c,d,a,b, 2,0x242070db,17)
    F1(b,c,d,a, 3,0xc1bdceee,22)
    F1(a,b,c,d, 4,0xf57c0faf, 7)
    F1(d,a,b,c, 5,0x4787c62a,12)
    F1(c,d,a,b, 6,0xa8304613,17)
    F1(b,c,d,a, 7,0xfd469501,22)
    F1(a,b,c,d, 8,0x698098d8, 7)
    F1(d,a,b,c, 9,0x8b44f7af,12)
    F1(c,d,a,b,10,0xffff5bb1,17)
    F1(b,c,d,a,11,0x895cd7be,22)
    F1(a,b,c,d,12,0x6b901122, 7)
    F1(d,a,b,c,13,0xfd987193,12)
    F1(c,d,a,b,14,0xa679438e,17)
    F1(b,c,d,a,15,0x49b40821,22)
  
    F2(a,b,c,d, 1,0xf61e2562, 5)
    F2(d,a,b,c, 6,0xc040b340, 9)
    F2(c,d,a,b,11,0x265e5a51,14)
    F2(b,c,d,a, 0,0xe9b6c7aa,20)
    F2(a,b,c,d, 5,0xd62f105d, 5)
    F2(d,a,b,c,10,0x02441453, 9)
    F2(c,d,a,b,15,0xd8a1e681,14)
    F2(b,c,d,a, 4,0xe7d3fbc8,20)
    F2(a,b,c,d, 9,0x21e1cde6, 5)
    F2(d,a,b,c,14,0xc33707d6, 9)
    F2(c,d,a,b, 3,0xf4d50d87,14)
    F2(b,c,d,a, 8,0x455a14ed,20)
    F2(a,b,c,d,13,0xa9e3e905, 5)
    F2(d,a,b,c, 2,0xfcefa3f8, 9)
    F2(c,d,a,b, 7,0x676f02d9,14)
    F2(b,c,d,a,12,0x8d2a4c8a,20)
  
    F3(a,b,c,d, 5,0xfffa3942, 4)
    F3(d,a,b,c, 8,0x8771f681,11)
    F3(c,d,a,b,11,0x6d9d6122,16)
    F3(b,c,d,a,14,0xfde5380c,23)
    F3(a,b,c,d, 1,0xa4beea44, 4)
    F3(d,a,b,c, 4,0x4bdecfa9,11)
    F3(c,d,a,b, 7,0xf6bb4b60,16)
    F3(b,c,d,a,10,0xbebfbc70,23)
    F3(a,b,c,d,13,0x289b7ec6, 4)
    F3(d,a,b,c, 0,0xeaa127fa,11)
    F3(c,d,a,b, 3,0xd4ef3085,16)
    F3(b,c,d,a, 6,0x04881d05,23)
    F3(a,b,c,d, 9,0xd9d4d039, 4)
    F3(d,a,b,c,12,0xe6db99e5,11)
    F3(c,d,a,b,15,0x1fa27cf8,16)
    F3(b,c,d,a, 2,0xc4ac5665,23)
  
    F4(a,b,c,d, 0,0xf4292244, 6)
    F4(d,a,b,c, 7,0x432aff97,10)
    F4(c,d,a,b,14,0xab9423a7,15)
    F4(b,c,d,a, 5,0xfc93a039,21)
    F4(a,b,c,d,12,0x655b59c3, 6)
    F4(d,a,b,c, 3,0x8f0ccc92,10)
    F4(c,d,a,b,10,0xffeff47d,15)
    F4(b,c,d,a, 1,0x85845dd1,21)
    F4(a,b,c,d, 8,0x6fa87e4f, 6)
    F4(d,a,b,c,15,0xfe2ce6e0,10)
    F4(c,d,a,b, 6,0xa3014314,15)
    F4(b,c,d,a,13,0x4e0811a1,21)
    F4(a,b,c,d, 4,0xf7537e82, 6)
    F4(d,a,b,c,11,0xbd3af235,10)
    F4(c,d,a,b, 2,0x2ad7d2bb,15)
    F4(b,c,d,a, 9,0xeb86d391,21)
  
    a += state[0];
    b += state[1];
    c += state[2];
    d += state[3];
  
    state[0] = a;
    state[1] = b;
    state[2] = c;
    state[3] = d;

    in += 64;
    inlen -= 64;
  }

  return inlen;
}
