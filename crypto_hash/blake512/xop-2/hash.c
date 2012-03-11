
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <x86intrin.h>

#include "config.h"
#include "rounds.h"

#ifndef NOT_SUPERCOP

#include "crypto_hash.h"
#include "crypto_uint64.h"
#include "crypto_uint32.h"
#include "crypto_uint8.h"

typedef crypto_uint64 u64;
typedef crypto_uint32 u32;
typedef crypto_uint8 u8; 

#else

typedef unsigned long long u64; 
typedef unsigned int u32; 
typedef unsigned char u8; 

#endif

#define U8TO32(p) \
  (((u32)((p)[0]) << 24) | ((u32)((p)[1]) << 16) | \
   ((u32)((p)[2]) <<  8) | ((u32)((p)[3])      ))
#define U8TO64(p) \
  (((u64)U8TO32(p) << 32) | (u64)U8TO32((p) + 4))
#define U32TO8(p, v) \
    (p)[0] = (u8)((v) >> 24); (p)[1] = (u8)((v) >> 16); \
    (p)[2] = (u8)((v) >>  8); (p)[3] = (u8)((v)      ); 
#define U64TO8(p, v) \
    U32TO8((p),     (u32)((v) >> 32));	\
    U32TO8((p) + 4, (u32)((v)      )); 

typedef struct  
{ 
  u64 h[8];
  u64 s[4], t[2];
  u32 buflen, nullt;
  u8 buf[128];
} state __attribute__ ((aligned (64)));

static const u8 padding[129] =
{ 
	0x80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
};

static inline int blake512_compress( state * state, const u8 * datablock ) 
{

  __m128i row1l;
  __m128i row2l;
  __m128i row3l;
  __m128i row4l;
  u64 row1hl, row1hh;
  u64 row2hl, row2hh;
  u64 row3hl, row3hh;
  u64 row4hl, row4hh;

  const __m128i r16 = _mm_setr_epi8(2,3,4,5,6,7,0,1,10,11,12,13,14,15,8,9);
  const __m128i u8to64 = _mm_set_epi8(8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7);

  union
  {
    __m128i u128[8];
    u64     u64[16];
  } m;

  __m128i t0, t1, t2, t3, t4, t5, t6, t7;
  u64     u0, u1, u2, u3;
  __m128i b0;
  u64 b1l, b1h;

  m.u128[0] = _mm_loadu_si128((__m128i*)(datablock +   0));
  m.u128[1] = _mm_loadu_si128((__m128i*)(datablock +  16));
  m.u128[2] = _mm_loadu_si128((__m128i*)(datablock +  32));
  m.u128[3] = _mm_loadu_si128((__m128i*)(datablock +  48));
  m.u128[4] = _mm_loadu_si128((__m128i*)(datablock +  64));
  m.u128[5] = _mm_loadu_si128((__m128i*)(datablock +  80));
  m.u128[6] = _mm_loadu_si128((__m128i*)(datablock +  96));
  m.u128[7] = _mm_loadu_si128((__m128i*)(datablock + 112));

  m.u128[0] = BSWAP64(m.u128[0]);
  m.u128[1] = BSWAP64(m.u128[1]);
  m.u128[2] = BSWAP64(m.u128[2]);
  m.u128[3] = BSWAP64(m.u128[3]);
  m.u128[4] = BSWAP64(m.u128[4]);
  m.u128[5] = BSWAP64(m.u128[5]);
  m.u128[6] = BSWAP64(m.u128[6]);
  m.u128[7] = BSWAP64(m.u128[7]);

  row1l = _mm_load_si128((__m128i*)&state->h[0]);
  row1hl = state->h[2];
  row1hh = state->h[3];

  row2l = _mm_load_si128((__m128i*)&state->h[4]);
  row2hl = state->h[6];
  row2hh = state->h[7];

  row3l = _mm_set_epi64x(0x13198A2E03707344ULL, 0x243F6A8885A308D3ULL);
  row3hl = 0xA4093822299F31D0ULL;
  row3hh = 0x082EFA98EC4E6C89ULL;

  row4l = _mm_set_epi64x(0xBE5466CF34E90C6CULL, 0x452821E638D01377ULL);
  row4hl = 0xC0AC29B7C97C50DDULL;
  row4hh = 0x3F84D5B5B5470917ULL;

  if(!state->nullt)
  {
  	row4l = _mm_xor_si128(row4l, _mm_set1_epi64x(state->t[0]));
    row4hl ^= state->t[1];
    row4hh ^= state->t[1];
  }

  ROUND( 0);
  ROUND( 1);
  ROUND( 2);
  ROUND( 3);
  ROUND( 4);
  ROUND( 5);
  ROUND( 6);
  ROUND( 7);
  ROUND( 8);
  ROUND( 9);
  ROUND(10);
  ROUND(11);
  ROUND(12);
  ROUND(13);
  ROUND(14);
  ROUND(15);

  row1l = _mm_xor_si128(row3l,row1l);
  row1hl ^= row3hl;
  row1hh ^= row3hh;

  _mm_store_si128((__m128i*)&state->h[0], _mm_xor_si128(row1l, _mm_load_si128((__m128i*)&state->h[0])));
  state->h[2] ^= row1hl;
  state->h[3] ^= row1hh;

  row2l = _mm_xor_si128(row4l,row2l);
  row2hl ^= row4hl;
  row2hh ^= row4hh;

  _mm_store_si128((__m128i*)&state->h[4], _mm_xor_si128(row2l, _mm_load_si128((__m128i*)&state->h[4])));
  state->h[6] ^= row2hl;
  state->h[7] ^= row2hh;
  
  return 0;
}

static inline void blake512_init( state * S )
{
  memset(S, 0, sizeof(state));
  S->h[0] = 0x6A09E667F3BCC908ULL;
  S->h[1] = 0xBB67AE8584CAA73BULL;
  S->h[2] = 0x3C6EF372FE94F82BULL;
  S->h[3] = 0xA54FF53A5F1D36F1ULL;
  S->h[4] = 0x510E527FADE682D1ULL;
  S->h[5] = 0x9B05688C2B3E6C1FULL;
  S->h[6] = 0x1F83D9ABFB41BD6BULL;
  S->h[7] = 0x5BE0CD19137E2179ULL;
}

static void blake512_update( state * S, const u8 * data, u64 datalen ) 
{


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

static inline void blake512_final( state * S, u8 * digest ) 
{

  u8 msglen[16], zo=0x01,oo=0x81;
  u64 lo=S->t[0] + S->buflen, hi = S->t[1];
  if ( lo < S->buflen ) hi++;
  U64TO8(  msglen + 0, hi );
  U64TO8(  msglen + 8, lo );

  if ( S->buflen == 888 ) /* one padding byte */
  { 
    S->t[0] -= 8; 
    blake512_update( S, &oo, 8 );
  }
  else 
  {
    if ( S->buflen < 888 ) /* enough space to fill the block */
    { 
      if ( S->buflen == 0 ) S->nullt=1;
      S->t[0] -= 888 - S->buflen;
      blake512_update( S, padding, 888 - S->buflen );
    }
    else /* NOT enough space, need 2 compressions */ 
    { 
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

  do
  {
    const __m128i u8to64 = _mm_set_epi8(8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7);
    _mm_storeu_si128((__m128i*)(digest +  0), BSWAP64(_mm_load_si128((__m128i*)&S->h[0])));
    _mm_storeu_si128((__m128i*)(digest + 16), BSWAP64(_mm_load_si128((__m128i*)&S->h[2])));
    _mm_storeu_si128((__m128i*)(digest + 32), BSWAP64(_mm_load_si128((__m128i*)&S->h[4])));
    _mm_storeu_si128((__m128i*)(digest + 48), BSWAP64(_mm_load_si128((__m128i*)&S->h[6])));
  } while(0);
}


int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen ) 
{

  state S;
  blake512_init( &S );
  blake512_update( &S, in, inlen*8 );
  blake512_final( &S, out );
  return 0;
}


#ifdef NOT_SUPERCOP

int main() 
{

  int i, v;
  u8 data[144], digest[64];
  u8 test1[]= {0x97, 0x96, 0x15, 0x87, 0xF6, 0xD9, 0x70, 0xFA, 0xBA, 0x6D, 0x24, 0x78, 0x04, 0x5D, 0xE6, 0xD1, 
	       0xFA, 0xBD, 0x09, 0xB6, 0x1A, 0xE5, 0x09, 0x32, 0x05, 0x4D, 0x52, 0xBC, 0x29, 0xD3, 0x1B, 0xE4, 
	       0xFF, 0x91, 0x02, 0xB9, 0xF6, 0x9E, 0x2B, 0xBD, 0xB8, 0x3B, 0xE1, 0x3D, 0x4B, 0x9C, 0x06, 0x09, 
	       0x1E, 0x5F, 0xA0, 0xB4, 0x8B, 0xD0, 0x81, 0xB6, 0x34, 0x05, 0x8B, 0xE0, 0xEC, 0x49, 0xBE, 0xB3};
  u8 test2[]= {0x31, 0x37, 0x17, 0xD6, 0x08, 0xE9, 0xCF, 0x75, 0x8D, 0xCB, 0x1E, 0xB0, 0xF0, 0xC3, 0xCF, 0x9F, 
	       0xC1, 0x50, 0xB2, 0xD5, 0x00, 0xFB, 0x33, 0xF5, 0x1C, 0x52, 0xAF, 0xC9, 0x9D, 0x35, 0x8A, 0x2F, 
	       0x13, 0x74, 0xB8, 0xA3, 0x8B, 0xBA, 0x79, 0x74, 0xE7, 0xF6, 0xEF, 0x79, 0xCA, 0xB1, 0x6F, 0x22, 
	       0xCE, 0x1E, 0x64, 0x9D, 0x6E, 0x01, 0xAD, 0x95, 0x89, 0xC2, 0x13, 0x04, 0x5D, 0x54, 0x5D, 0xDE};

  for(i=0; i<144; ++i) data[i]=0;  

  crypto_hash( digest, data, 1 );    
  v=0;
  for(i=0; i<64; ++i) {
    printf("%02X", digest[i]);
    if ( digest[i] != test1[i]) v=1;
  }
  if (v) printf("\nerror\n");
  else  printf("\nok\n");

  for(i=0; i<144; ++i) data[i]=0;  

  crypto_hash( digest, data, 144 );    
  v=0;
  for(i=0; i<64; ++i) {
    printf("%02X", digest[i]);
    if ( digest[i] != test2[i]) v=1;
  }
  if (v) printf("\nerror\n");
  else printf("\nok\n");

  return 0;
}

#endif




