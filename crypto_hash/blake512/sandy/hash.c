#include <string.h>
#include <stdio.h>
#include "crypto_hash.h"
#include "crypto_uint64.h"
#include "crypto_uint32.h"
#include "crypto_uint8.h"

typedef crypto_uint64 u64;
typedef crypto_uint32 u32;
typedef crypto_uint8 u8; 

#define U8TO64(p) __builtin_bswap64(*(u64 *) (p))
#define U64TO8(p, v) *(u64 *) (p) = __builtin_bswap64(v);

typedef struct  { 
  u64 h[8], s[4], t[2];
  int buflen, nullt;
  u8  buf[128];
} state;

const u64 cst[16] = {
  0x243F6A8885A308D3ULL,0x13198A2E03707344ULL,0xA4093822299F31D0ULL,0x082EFA98EC4E6C89ULL,
  0x452821E638D01377ULL,0xBE5466CF34E90C6CULL,0xC0AC29B7C97C50DDULL,0x3F84D5B5B5470917ULL,
  0x9216D5D98979FB1BULL,0xD1310BA698DFB5ACULL,0x2FFD72DBD01ADFB7ULL,0xB8E1AFED6A267E96ULL,
  0xBA7C9045F12C7F99ULL,0x24A19947B3916CF7ULL,0x0801F2E2858EFC16ULL,0x636920D871574E69ULL
};

static const u8 padding[129] =
{0x80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

#define ROT(x,n) ({ \
     register u64 __out; \
     register u64 __in = x; \
     __asm__ ("shld %2,%0,%0" : "=r"(__out) : "0"(__in), "i"(64-n)); \
     __out; \
  })

void blake512_compress( state *S, const u8 *block )
{
  u64 m0;
  u64 m1;
  u64 m2;
  u64 m3;
  u64 m4;
  u64 m5;
  u64 m6;
  u64 m7;
  u64 m8;
  u64 m9;
  u64 m10;
  u64 m11;
  u64 m12;
  u64 m13;
  u64 m14;
  u64 m15;
  u64 v0;
  u64 v1;
  u64 v2;
  u64 v3;
  u64 v4;
  u64 v5;
  u64 v6;
  u64 v7;
  u64 v8;
  u64 v9;
  u64 v10;
  u64 v11;
  u64 v12;
  u64 v13;
  u64 v14;
  u64 v15;

  m0 = U8TO64(block + 0);
  m1 = U8TO64(block + 8);
  m2 = U8TO64(block + 16);
  m3 = U8TO64(block + 24);
  m4 = U8TO64(block + 32);
  m5 = U8TO64(block + 40);
  m6 = U8TO64(block + 48);
  m7 = U8TO64(block + 56);
  m8 = U8TO64(block + 64);
  m9 = U8TO64(block + 72);
  m10 = U8TO64(block + 80);
  m11 = U8TO64(block + 88);
  m12 = U8TO64(block + 96);
  m13 = U8TO64(block + 104);
  m14 = U8TO64(block + 112);
  m15 = U8TO64(block + 120);
  v0 = S->h[0];
  v1 = S->h[1];
  v2 = S->h[2];
  v3 = S->h[3];
  v4 = S->h[4];
  v5 = S->h[5];
  v6 = S->h[6];
  v7 = S->h[7];
  v8 = S->s[0] ^ 0x243F6A8885A308D3ULL;
  v9 = S->s[1] ^ 0x13198A2E03707344ULL;
  v10 = S->s[2] ^ 0xA4093822299F31D0ULL;
  v11 = S->s[3] ^ 0x082EFA98EC4E6C89ULL;
  v12 = 0x452821E638D01377ULL;
  v13 = 0xBE5466CF34E90C6CULL;
  v14 = 0xC0AC29B7C97C50DDULL;
  v15 = 0x3F84D5B5B5470917ULL;

  if (S->nullt == 0) { 
    v12 ^= S->t[0];
    v13 ^= S->t[0];
    v14 ^= S->t[1];
    v15 ^= S->t[1];
  }

#define ROUND(m0,c0,m1,c1,m2,c2,m3,c3,m4,c4,m5,c5,m6,c6,m7,c7,m8,c8,m9,c9,m10,c10,m11,c11,m12,c12,m13,c13,m14,c14,m15,c15) \
    v0 += m0 ^ c0; \
    v0 += v4; \
    v12 ^= v0; \
    v12 = ROT( v12,32); \
    v8 += v12; \
    v4 ^= v8; \
    v4 = ROT( v4,25); \
      v1 += m2 ^ c2; \
      v1 += v5; \
      v13 ^= v1; \
      v13 = ROT( v13,32); \
      v9 += v13; \
      v5 ^= v9; \
      v5 = ROT( v5,25); \
        v2 += m4 ^ c4; \
        v2 += v6; \
        v14 ^= v2; \
        v14 = ROT( v14,32); \
        v10 += v14; \
        v6 ^= v10; \
        v6 = ROT( v6,25); \
          v3 += m6 ^ c6; \
          v3 += v7; \
          v15 ^= v3; \
          v15 = ROT( v15,32); \
          v11 += v15; \
          v7 ^= v11; \
          v7 = ROT( v7,25); \
        v2 += m5 ^ c5; \
        v2 += v6; \
        v14 ^= v2; \
        v14 = ROT( v14,16); \
        v10 += v14; \
        v6 ^= v10; \
        v6 = ROT( v6,11); \
          v3 += m7 ^ c7; \
          v3 += v7; \
          v15 ^= v3; \
          v15 = ROT( v15,16); \
          v11 += v15; \
          v7 ^= v11; \
          v7 = ROT( v7,11); \
      v1 += m3 ^ c3; \
      v1 += v5; \
      v13 ^= v1; \
      v13 = ROT( v13,16); \
      v9 += v13; \
      v5 ^= v9; \
      v5 = ROT( v5,11); \
    v0 += m1 ^ c1; \
    v0 += v4; \
    v12 ^= v0; \
    v12 = ROT( v12,16); \
    v8 += v12; \
    v4 ^= v8; \
    v4 = ROT( v4,11); \
            v0 += m8 ^ c8; \
            v0 += v5; \
            v15 ^= v0; \
            v15 = ROT( v15,32); \
            v10 += v15; \
            v5 ^= v10; \
            v5 = ROT( v5,25); \
              v1 += m10 ^ c10; \
              v1 += v6; \
              v12 ^= v1; \
              v12 = ROT( v12,32); \
              v11 += v12; \
              v6 ^= v11; \
              v6 = ROT( v6,25); \
                v2 += m12 ^ c12; \
                v2 += v7; \
                v13 ^= v2; \
                v13 = ROT( v13,32); \
                v8 += v13; \
                v7 ^= v8; \
                v7 = ROT( v7,25); \
                  v3 += m14 ^ c14; \
                  v3 += v4; \
                  v14 ^= v3; \
                  v14 = ROT( v14,32); \
                  v9 += v14; \
                  v4 ^= v9; \
                  v4 = ROT( v4,25); \
                v2 += m13 ^ c13; \
                v2 += v7; \
                v13 ^= v2; \
                v13 = ROT( v13,16); \
                v8 += v13; \
                v7 ^= v8; \
                v7 = ROT( v7,11); \
                  v3 += m15 ^ c15; \
                  v3 += v4; \
                  v14 ^= v3; \
                  v14 = ROT( v14,16); \
                  v9 += v14; \
                  v4 ^= v9; \
                  v4 = ROT( v4,11); \
              v1 += m11 ^ c11; \
              v1 += v6; \
              v12 ^= v1; \
              v12 = ROT( v12,16); \
              v11 += v12; \
              v6 ^= v11; \
              v6 = ROT( v6,11); \
            v0 += m9 ^ c9; \
            v0 += v5; \
            v15 ^= v0; \
            v15 = ROT( v15,16); \
            v10 += v15; \
            v5 ^= v10; \
            v5 = ROT( v5,11); \

  ROUND(m0,cst[1],m1,cst[0],m2,cst[3],m3,cst[2],m4,cst[5],m5,cst[4],m6,cst[7],m7,cst[6],m8,cst[9],m9,cst[8],m10,cst[11],m11,cst[10],m12,cst[13],m13,cst[12],m14,cst[15],m15,cst[14])
  ROUND(m14,cst[10],m10,cst[14],m4,cst[8],m8,cst[4],m9,cst[15],m15,cst[9],m13,cst[6],m6,cst[13],m1,cst[12],m12,cst[1],m0,cst[2],m2,cst[0],m11,cst[7],m7,cst[11],m5,cst[3],m3,cst[5])
  ROUND(m11,cst[8],m8,cst[11],m12,cst[0],m0,cst[12],m5,cst[2],m2,cst[5],m15,cst[13],m13,cst[15],m10,cst[14],m14,cst[10],m3,cst[6],m6,cst[3],m7,cst[1],m1,cst[7],m9,cst[4],m4,cst[9])
  ROUND(m7,cst[9],m9,cst[7],m3,cst[1],m1,cst[3],m13,cst[12],m12,cst[13],m11,cst[14],m14,cst[11],m2,cst[6],m6,cst[2],m5,cst[10],m10,cst[5],m4,cst[0],m0,cst[4],m15,cst[8],m8,cst[15])
  ROUND(m9,cst[0],m0,cst[9],m5,cst[7],m7,cst[5],m2,cst[4],m4,cst[2],m10,cst[15],m15,cst[10],m14,cst[1],m1,cst[14],m11,cst[12],m12,cst[11],m6,cst[8],m8,cst[6],m3,cst[13],m13,cst[3])
  ROUND(m2,cst[12],m12,cst[2],m6,cst[10],m10,cst[6],m0,cst[11],m11,cst[0],m8,cst[3],m3,cst[8],m4,cst[13],m13,cst[4],m7,cst[5],m5,cst[7],m15,cst[14],m14,cst[15],m1,cst[9],m9,cst[1])
  ROUND(m12,cst[5],m5,cst[12],m1,cst[15],m15,cst[1],m14,cst[13],m13,cst[14],m4,cst[10],m10,cst[4],m0,cst[7],m7,cst[0],m6,cst[3],m3,cst[6],m9,cst[2],m2,cst[9],m8,cst[11],m11,cst[8])
  ROUND(m13,cst[11],m11,cst[13],m7,cst[14],m14,cst[7],m12,cst[1],m1,cst[12],m3,cst[9],m9,cst[3],m5,cst[0],m0,cst[5],m15,cst[4],m4,cst[15],m8,cst[6],m6,cst[8],m2,cst[10],m10,cst[2])
  ROUND(m6,cst[15],m15,cst[6],m14,cst[9],m9,cst[14],m11,cst[3],m3,cst[11],m0,cst[8],m8,cst[0],m12,cst[2],m2,cst[12],m13,cst[7],m7,cst[13],m1,cst[4],m4,cst[1],m10,cst[5],m5,cst[10])
  ROUND(m10,cst[2],m2,cst[10],m8,cst[4],m4,cst[8],m7,cst[6],m6,cst[7],m1,cst[5],m5,cst[1],m15,cst[11],m11,cst[15],m9,cst[14],m14,cst[9],m3,cst[12],m12,cst[3],m13,cst[0],m0,cst[13])
  ROUND(m0,cst[1],m1,cst[0],m2,cst[3],m3,cst[2],m4,cst[5],m5,cst[4],m6,cst[7],m7,cst[6],m8,cst[9],m9,cst[8],m10,cst[11],m11,cst[10],m12,cst[13],m13,cst[12],m14,cst[15],m15,cst[14])
  ROUND(m14,cst[10],m10,cst[14],m4,cst[8],m8,cst[4],m9,cst[15],m15,cst[9],m13,cst[6],m6,cst[13],m1,cst[12],m12,cst[1],m0,cst[2],m2,cst[0],m11,cst[7],m7,cst[11],m5,cst[3],m3,cst[5])
  ROUND(m11,cst[8],m8,cst[11],m12,cst[0],m0,cst[12],m5,cst[2],m2,cst[5],m15,cst[13],m13,cst[15],m10,cst[14],m14,cst[10],m3,cst[6],m6,cst[3],m7,cst[1],m1,cst[7],m9,cst[4],m4,cst[9])
  ROUND(m7,cst[9],m9,cst[7],m3,cst[1],m1,cst[3],m13,cst[12],m12,cst[13],m11,cst[14],m14,cst[11],m2,cst[6],m6,cst[2],m5,cst[10],m10,cst[5],m4,cst[0],m0,cst[4],m15,cst[8],m8,cst[15])
  ROUND(m9,cst[0],m0,cst[9],m5,cst[7],m7,cst[5],m2,cst[4],m4,cst[2],m10,cst[15],m15,cst[10],m14,cst[1],m1,cst[14],m11,cst[12],m12,cst[11],m6,cst[8],m8,cst[6],m3,cst[13],m13,cst[3])
  ROUND(m2,cst[12],m12,cst[2],m6,cst[10],m10,cst[6],m0,cst[11],m11,cst[0],m8,cst[3],m3,cst[8],m4,cst[13],m13,cst[4],m7,cst[5],m5,cst[7],m15,cst[14],m14,cst[15],m1,cst[9],m9,cst[1])

  v0 ^= v8;
  v1 ^= v9;
  v2 ^= v10;
  v3 ^= v11;
  v4 ^= v12;
  v5 ^= v13;
  v6 ^= v14;
  v7 ^= v15;

  v0 ^= S->s[0];
  v1 ^= S->s[1];
  v2 ^= S->s[2];
  v3 ^= S->s[3];
  v4 ^= S->s[0];
  v5 ^= S->s[1];
  v6 ^= S->s[2];
  v7 ^= S->s[3];

  S->h[0] ^= v0;
  S->h[1] ^= v1;
  S->h[2] ^= v2;
  S->h[3] ^= v3;
  S->h[4] ^= v4;
  S->h[5] ^= v5;
  S->h[6] ^= v6;
  S->h[7] ^= v7;
}


void blake512_init( state *S ) {
  S->h[0]=0x6A09E667F3BCC908ULL;
  S->h[1]=0xBB67AE8584CAA73BULL;
  S->h[2]=0x3C6EF372FE94F82BULL;
  S->h[3]=0xA54FF53A5F1D36F1ULL;
  S->h[4]=0x510E527FADE682D1ULL;
  S->h[5]=0x9B05688C2B3E6C1FULL;
  S->h[6]=0x1F83D9ABFB41BD6BULL;
  S->h[7]=0x5BE0CD19137E2179ULL;
  S->t[0]=S->t[1]=S->buflen=S->nullt=0;
  S->s[0]=S->s[1]=S->s[2]=S->s[3] =0;
}


void blake512_update( state * S, const u8 * data, u64 datalen ) {

  int left = (S->buflen >> 3); 
  int fill = 128 - left;

  if( left && ( ((datalen >> 3) & 0x7F) >= fill ) ) {
    memcpy( (void *) (S->buf + left), (void *) data, fill );
    S->t[0] += 1024;
    blake512_compress( S, S->buf );
    data += fill;
    datalen  -= (fill << 3);       
    left = 0;
  }

  while( datalen >= 1024 ) {  
    S->t[0] += 1024;
    blake512_compress( S, data );
    data += 128;
    datalen  -= 1024;
  }

  if( datalen > 0 ) {
    memcpy( (void *) (S->buf + left), (void *) data, ( datalen>>3 ) & 0x7F );
    S->buflen = (left<<3) + datalen;
  }
  else S->buflen=0;
}


void blake512_final( state * S, u8 * digest ) {

  u8 msglen[16], zo=0x01,oo=0x81;
  u64 lo=S->t[0] + S->buflen, hi = S->t[1];
  if ( lo < S->buflen ) hi++;
  U64TO8(  msglen + 0, hi );
  U64TO8(  msglen + 8, lo );

  if ( S->buflen == 888 ) { /* one padding byte */
    S->t[0] -= 8; 
    blake512_update( S, &oo, 8 );
  }
  else {
    if ( S->buflen < 888 ) { /* enough space to fill the block */
      if ( S->buflen == 0 ) S->nullt=1;
      S->t[0] -= 888 - S->buflen;
      blake512_update( S, padding, 888 - S->buflen );
    }
    else { /* NOT enough space, need 2 compressions */ 
      S->t[0] -= 1024 - S->buflen; 
      blake512_update( S, padding, 1024 - S->buflen );
      S->t[0] -= 888;
      blake512_update( S, padding+1, 888 );
      S->nullt = 1;
    }
    blake512_update( S, &zo, 8 );
    S->t[0] -= 8;
  }
  S->t[0] -= 128;
  blake512_update( S, msglen, 128 );    

  U64TO8( digest + 0, S->h[0]);
  U64TO8( digest + 8, S->h[1]);
  U64TO8( digest +16, S->h[2]);
  U64TO8( digest +24, S->h[3]);
  U64TO8( digest +32, S->h[4]);
  U64TO8( digest +40, S->h[5]);
  U64TO8( digest +48, S->h[6]);
  U64TO8( digest +56, S->h[7]);
}


int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen ) {

  state S;
  blake512_init( &S );
  blake512_update( &S, in, inlen*8 );
  blake512_final( &S, out );
  return 0;
}
