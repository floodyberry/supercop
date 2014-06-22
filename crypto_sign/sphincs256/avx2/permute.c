#include <stdint.h>

#define CHACHA_ROUNDS 12

#define U32V(x) \
  ((x) & 0xffffffff)

#define ROTL32(x,c) \
  ((((x) << c) | ((x) >> (32-c))) & 0xffffffff)

#define ROTATE(v,c) (ROTL32(v,c))
#define XOR(v,w) ((v) ^ (w))
#define PLUS(v,w) (U32V((v) + (w)))
#define PLUSONE(v) (PLUS((v),1))

#define QUARTERROUND(a,b,c,d) \
  x[a] = PLUS(x[a],x[b]); x[d] = ROTATE(XOR(x[d],x[a]),16); \
  x[c] = PLUS(x[c],x[d]); x[b] = ROTATE(XOR(x[b],x[c]),12); \
  x[a] = PLUS(x[a],x[b]); x[d] = ROTATE(XOR(x[d],x[a]), 8); \
  x[c] = PLUS(x[c],x[d]); x[b] = ROTATE(XOR(x[b],x[c]), 7);


void chacha_permute(unsigned char out[64],const unsigned char in [64])
{
  uint32_t x[16];
  int i;

  for (i = 0;i < 16;i++)
  {
    x[i] = in[4*i+3];
    x[i] <<= 8;
    x[i] |= in[4*i+2];
    x[i] <<= 8;
    x[i] |= in[4*i+1];
    x[i] <<= 8;
    x[i] |= in[4*i+0];
  }

  for (i = CHACHA_ROUNDS;i > 0;i -= 2) 
  {
    QUARTERROUND( 0, 4, 8,12)
    QUARTERROUND( 1, 5, 9,13)
    QUARTERROUND( 2, 6,10,14)
    QUARTERROUND( 3, 7,11,15)
    QUARTERROUND( 0, 5,10,15)
    QUARTERROUND( 1, 6,11,12)
    QUARTERROUND( 2, 7, 8,13)
    QUARTERROUND( 3, 4, 9,14)
  }

//  for (i = 0;i < 16;++i) x[i] = PLUS(x[i],input[i]); // XXX: Bad idea if we later xor the input to the state?
  for (i = 0;i < 16;++i) 
  {
    out[4*i]   =  x[i] & 0xff;
    out[4*i+1] = (x[i] >>  8) & 0xff;
    out[4*i+2] = (x[i] >> 16) & 0xff;
    out[4*i+3] = (x[i] >> 24) & 0xff;
  }
}
