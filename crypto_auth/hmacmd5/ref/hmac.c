#include "crypto_hashblocks_md5.h"
#include "crypto_auth.h"

#define blocks crypto_hashblocks_md5

typedef unsigned int uint32;

int crypto_auth(unsigned char *out,const unsigned char *in,unsigned long long inlen,const unsigned char *k)
{
  unsigned char h[16];
  unsigned char padded[128];
  int i;
  unsigned long long bits = 512 + (inlen << 3);

  h[ 0] = 0x01;
  h[ 1] = 0x23;
  h[ 2] = 0x45;
  h[ 3] = 0x67;
  h[ 4] = 0x89;
  h[ 5] = 0xab;
  h[ 6] = 0xcd;
  h[ 7] = 0xef;
  h[ 8] = 0xfe;
  h[ 9] = 0xdc;
  h[10] = 0xba;
  h[11] = 0x98;
  h[12] = 0x76;
  h[13] = 0x54;
  h[14] = 0x32;
  h[15] = 0x10;

  for (i = 0;i < 32;++i) padded[i] = k[i] ^ 0x36;
  for (i = 32;i < 64;++i) padded[i] = 0x36;

  blocks(h,padded,64);
  blocks(h,in,inlen);
  in += inlen;
  inlen &= 63;
  in -= inlen;

  for (i = 0;i < inlen;++i) padded[i] = in[i];
  padded[inlen] = 0x80;

  if (inlen < 56) {
    for (i = inlen + 1;i < 56;++i) padded[i] = 0;
    padded[56] = bits;
    padded[57] = bits >> 8;
    padded[58] = bits >> 16;
    padded[59] = bits >> 24;
    padded[60] = bits >> 32;
    padded[61] = bits >> 40;
    padded[62] = bits >> 48;
    padded[63] = bits >> 56;
    blocks(h,padded,64);
  } else {
    for (i = inlen + 1;i < 120;++i) padded[i] = 0;
    padded[120] = bits;
    padded[121] = bits >> 8;
    padded[122] = bits >> 16;
    padded[123] = bits >> 24;
    padded[124] = bits >> 32;
    padded[125] = bits >> 40;
    padded[126] = bits >> 48;
    padded[127] = bits >> 56;
    blocks(h,padded,128);
  }

  for (i = 0;i < 32;++i) padded[i] = k[i] ^ 0x5c;
  for (i = 32;i < 64;++i) padded[i] = 0x5c;
  for (i = 0;i < 16;++i) padded[64 + i] = h[i];

  out[ 0] = 0x01;
  out[ 1] = 0x23;
  out[ 2] = 0x45;
  out[ 3] = 0x67;
  out[ 4] = 0x89;
  out[ 5] = 0xab;
  out[ 6] = 0xcd;
  out[ 7] = 0xef;
  out[ 8] = 0xfe;
  out[ 9] = 0xdc;
  out[10] = 0xba;
  out[11] = 0x98;
  out[12] = 0x76;
  out[13] = 0x54;
  out[14] = 0x32;
  out[15] = 0x10;

  for (i = 16;i < 64;++i) padded[64 + i] = 0;
  padded[64 + 16] = 0x80;
  padded[64 + 56] = 128;
  padded[64 + 57] = 2;

  blocks(out,padded,128);

  return 0;
}
