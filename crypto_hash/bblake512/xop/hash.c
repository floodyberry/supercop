
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
typedef crypto_uint8   u8; 

#else

typedef unsigned long long u64; 
typedef unsigned int       u32; 
typedef unsigned char       u8; 

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
	__m128i h[4];
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

inline int blake512_compress( state * state, const u8 * datablock ) 
{

  __m128i row1l,row1h;
  __m128i row2l,row2h;
  __m128i row3l,row3h;
  __m128i row4l,row4h;

  //  const __m128i r16 = _mm_setr_epi8(2,3,4,5,6,7,0,1,10,11,12,13,14,15,8,9);
  const __m128i u8to64 = _mm_set_epi8(8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7);

  __m128i m0, m1, m2, m3, m4, m5, m6, m7;
  __m128i t0, t1, t2, t3;
  __m128i b0, b1;

  m0 = _mm_loadu_si128((__m128i*)(datablock +   0));
  m1 = _mm_loadu_si128((__m128i*)(datablock +  16));
  m2 = _mm_loadu_si128((__m128i*)(datablock +  32));
  m3 = _mm_loadu_si128((__m128i*)(datablock +  48));
  m4 = _mm_loadu_si128((__m128i*)(datablock +  64));
  m5 = _mm_loadu_si128((__m128i*)(datablock +  80));
  m6 = _mm_loadu_si128((__m128i*)(datablock +  96));
  m7 = _mm_loadu_si128((__m128i*)(datablock + 112));

  m0 = BSWAP64(m0);
  m1 = BSWAP64(m1);
  m2 = BSWAP64(m2);
  m3 = BSWAP64(m3);
  m4 = BSWAP64(m4);
  m5 = BSWAP64(m5);
  m6 = BSWAP64(m6);
  m7 = BSWAP64(m7);

  row1l = state->h[0];
  row1h = state->h[1];
  row2l = state->h[2];
  row2h = state->h[3];
  row3l = _mm_set_epi64x(0x13198A2E03707344ULL, 0x243F6A8885A308D3ULL);
  row3h = _mm_set_epi64x(0x082EFA98EC4E6C89ULL, 0xA4093822299F31D0ULL);

  row4l = _mm_set_epi64x(0xBE5466CF34E90C6CULL, 0x452821E638D01377ULL);
  row4h = _mm_set_epi64x(0x3F84D5B5B5470917ULL, 0xC0AC29B7C97C50DDULL);

#ifdef AVOID_BRANCHING
  do
  {
    const __m128i mask = _mm_cmpeq_epi32(_mm_setzero_si128(), _mm_set1_epi32(state->nullt));
    const __m128i xor1 = _mm_and_si128(_mm_set1_epi64x(state->t[0]), mask);
    const __m128i xor2 = _mm_and_si128(_mm_set1_epi64x(state->t[1]), mask);
    row4l = _mm_xor_si128(row4l, xor1);
    row4h = _mm_xor_si128(row4h, xor2);
  } while(0);
#else
  if(!state->nullt)
  {
  	row4l = _mm_xor_si128(row4l, _mm_set1_epi64x(state->t[0]));
  	row4h = _mm_xor_si128(row4h, _mm_set1_epi64x(state->t[1]));
  }
#endif

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
  row1h = _mm_xor_si128(row3h,row1h);

  state->h[0] = _mm_xor_si128(row1l, state->h[0]);
  state->h[1] = _mm_xor_si128(row1h, state->h[1]);

  row2l = _mm_xor_si128(row4l,row2l);
  row2h = _mm_xor_si128(row4h,row2h);

  state->h[2] = _mm_xor_si128(row2l, state->h[2]);
  state->h[3] = _mm_xor_si128(row2h, state->h[3]);
  
  return 0;
}


inline int blake512_compress2( state * statet, const u8 * datablock, state * etats, const u8 * kcolbatad ) {

  __m128i row1l,row1h;
  __m128i row2l,row2h;
  __m128i row3l,row3h;
  __m128i row4l,row4h;
  __m128i row1lb,row1hb;
  __m128i row2lb,row2hb;
  __m128i row3lb,row3hb;
  __m128i row4lb,row4hb;

  //  const __m128i r16 = _mm_setr_epi8(2,3,4,5,6,7,0,1,10,11,12,13,14,15,8,9);
  const __m128i u8to64 = _mm_set_epi8(8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7);

  __m128i m0, m1, m2, m3, m4, m5, m6, m7;
  __m128i t0, t1, t2, t3;
  __m128i b0, b1;

  __m128i m0b, m1b, m2b, m3b, m4b, m5b, m6b, m7b;
  __m128i t0b, t1b, t2b, t3b;
  __m128i b0b, b1b;

  m0 = _mm_loadu_si128((__m128i*)(datablock +   0));
  m1 = _mm_loadu_si128((__m128i*)(datablock +  16));
  m2 = _mm_loadu_si128((__m128i*)(datablock +  32));
  m3 = _mm_loadu_si128((__m128i*)(datablock +  48));
  m4 = _mm_loadu_si128((__m128i*)(datablock +  64));
  m5 = _mm_loadu_si128((__m128i*)(datablock +  80));
  m6 = _mm_loadu_si128((__m128i*)(datablock +  96));
  m7 = _mm_loadu_si128((__m128i*)(datablock + 112));
  m0b= _mm_loadu_si128((__m128i*)(kcolbatad +   0));
  m1b= _mm_loadu_si128((__m128i*)(kcolbatad +  16));
  m2b= _mm_loadu_si128((__m128i*)(kcolbatad +  32));
  m3b= _mm_loadu_si128((__m128i*)(kcolbatad +  48));
  m4b= _mm_loadu_si128((__m128i*)(kcolbatad +  64));
  m5b= _mm_loadu_si128((__m128i*)(kcolbatad +  80));
  m6b= _mm_loadu_si128((__m128i*)(kcolbatad +  96));
  m7b= _mm_loadu_si128((__m128i*)(kcolbatad + 112));


  m0 = BSWAP64(m0);
  m1 = BSWAP64(m1);
  m2 = BSWAP64(m2);
  m3 = BSWAP64(m3);
  m4 = BSWAP64(m4);
  m5 = BSWAP64(m5);
  m6 = BSWAP64(m6);
  m7 = BSWAP64(m7);
  m0b= BSWAP64(m0b);
  m1b= BSWAP64(m1b);
  m2b= BSWAP64(m2b);
  m3b= BSWAP64(m3b);
  m4b= BSWAP64(m4b);
  m5b= BSWAP64(m5b);
  m6b= BSWAP64(m6b);
  m7b= BSWAP64(m7b);

  row1l = statet->h[0];
  row1h = statet->h[1];
  row2l = statet->h[2];
  row2h = statet->h[3];
  row1lb= etats->h[0];
  row1hb= etats->h[1];
  row2lb= etats->h[2];
  row2hb= etats->h[3];
  row3l = _mm_set_epi64x(0x13198A2E03707344ULL, 0x243F6A8885A308D3ULL);
  row3h = _mm_set_epi64x(0x082EFA98EC4E6C89ULL, 0xA4093822299F31D0ULL);
  row4l = _mm_set_epi64x(0xBE5466CF34E90C6CULL, 0x452821E638D01377ULL);
  row4h = _mm_set_epi64x(0x3F84D5B5B5470917ULL, 0xC0AC29B7C97C50DDULL);
  row3lb= _mm_set_epi64x(0x13198A2E03707344ULL, 0x243F6A8885A308D3ULL);
  row3hb= _mm_set_epi64x(0x082EFA98EC4E6C89ULL, 0xA4093822299F31D0ULL);
  row4lb= _mm_set_epi64x(0xBE5466CF34E90C6CULL, 0x452821E638D01377ULL);
  row4hb= _mm_set_epi64x(0x3F84D5B5B5470917ULL, 0xC0AC29B7C97C50DDULL);

#ifdef AVOID_BRANCHING
  do
  {
    const __m128i mask = _mm_cmpeq_epi32(_mm_setzero_si128(), _mm_set1_epi32(statet->nullt));
    const __m128i maskb = _mm_cmpeq_epi32(_mm_setzero_si128(), _mm_set1_epi32(etats->nullt));
    const __m128i xor1 = _mm_and_si128(_mm_set1_epi64x(statet->t[0]), mask);
    const __m128i xor2 = _mm_and_si128(_mm_set1_epi64x(statet->t[1]), mask);
    const __m128i xor1b= _mm_and_si128(_mm_set1_epi64x(etats->t[0]), maskb);
    const __m128i xor2b= _mm_and_si128(_mm_set1_epi64x(etats->t[1]), maskb);
    row4l = _mm_xor_si128(row4l, xor1);
    row4h = _mm_xor_si128(row4h, xor2);
    row4lb= _mm_xor_si128(row4lb, xor1b);
    row4hb= _mm_xor_si128(row4hb, xor2b);
  } while(0);
#else
  if(!statet->nullt)
  {
  	row4l = _mm_xor_si128(row4l, _mm_set1_epi64x(statet->t[0]));
  	row4h = _mm_xor_si128(row4h, _mm_set1_epi64x(statet->t[1]));
  	row4lb= _mm_xor_si128(row4lb, _mm_set1_epi64x(etats->t[0]));
  	row4hb= _mm_xor_si128(row4hb, _mm_set1_epi64x(etats->t[1]));
  }
#endif

  ROUNDD( 0);  
  ROUNDD( 1);  
  ROUNDD( 2);  
  ROUNDD( 3);  
  ROUNDD( 4);  
  ROUNDD( 5);  
  ROUNDD( 6);  
  ROUNDD( 7);  
  ROUNDD( 8);  
  ROUNDD( 9);  
  ROUNDD(10);  
  ROUNDD(11);  
  ROUNDD(12);  
  ROUNDD(13);  
  ROUNDD(14);  
  ROUNDD(15);  

  row1l = _mm_xor_si128(row3l,row1l);
  row1h = _mm_xor_si128(row3h,row1h);
  row1lb= _mm_xor_si128(row3lb,row1lb);
  row1hb= _mm_xor_si128(row3hb,row1hb);

  statet->h[0] = _mm_xor_si128(row1l, statet->h[0]);
  statet->h[1] = _mm_xor_si128(row1h, statet->h[1]);
  etats->h[0] = _mm_xor_si128(row1lb, etats->h[0]);
  etats->h[1] = _mm_xor_si128(row1hb, etats->h[1]);

  row2l = _mm_xor_si128(row4l,row2l);
  row2h = _mm_xor_si128(row4h,row2h);
  row2lb= _mm_xor_si128(row4lb,row2lb);
  row2hb= _mm_xor_si128(row4hb,row2hb);

  statet->h[2] = _mm_xor_si128(row2l, statet->h[2]);
  statet->h[3] = _mm_xor_si128(row2h, statet->h[3]);
  etats->h[2] = _mm_xor_si128(row2lb, etats->h[2]);
  etats->h[3] = _mm_xor_si128(row2hb, etats->h[3]);
  
  return 0;
}

static inline void blake512_init( state * S )
{
  memset(S, 0, sizeof(state));
  S->h[0] = _mm_set_epi64x(0xBB67AE8584CAA73BULL, 0x6A09E667F3BCC908ULL);
  S->h[1] = _mm_set_epi64x(0xA54FF53A5F1D36F1ULL, 0x3C6EF372FE94F82BULL);
  S->h[2] = _mm_set_epi64x(0x9B05688C2B3E6C1FULL, 0x510E527FADE682D1ULL);
  S->h[3] = _mm_set_epi64x(0x5BE0CD19137E2179ULL, 0x1F83D9ABFB41BD6BULL);
}

/* init left branch with blake512('0x00')*/
static inline void blake512_init0( state * S )
{
  memset(S, 0, sizeof(state));
  S->h[0] = _mm_set_epi64x(0xBA6D2478045DE6D1ULL, 0x97961587F6D970FAULL);
  S->h[1] = _mm_set_epi64x(0xFABD09B61AE50932ULL, 0x054D52BC29D31BE4ULL);
  S->h[2] = _mm_set_epi64x(0xB83BE13D4B9C0609ULL, 0xFF9102B9F69E2BBDULL);
  S->h[3] = _mm_set_epi64x(0x34058BE0EC49BEB3ULL, 0x1E5FA0B48BD081B6ULL);
}

/* init left branch with blake512('0x01')*/
static inline void blake512_init1( state * S )
{
  memset(S, 0, sizeof(state));
  S->h[0] = _mm_set_epi64x(0xB863ABA0320D64B5ULL, 0xDF390C157B7A2146ULL);
  S->h[1] = _mm_set_epi64x(0x176AD0871A63ADE2ULL, 0xEFE0387883F3536BULL);
  S->h[2] = _mm_set_epi64x(0xF2A5B7095FAD88E0ULL, 0x300614A0CE07AA5EULL);
  S->h[3] = _mm_set_epi64x(0xFF84945AF89C8F4FULL, 0x2584AAF92C6AD3A7ULL);
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
    _mm_storeu_si128((__m128i*)(digest +  0), BSWAP64(S->h[0]));
    _mm_storeu_si128((__m128i*)(digest + 16), BSWAP64(S->h[1]));
    _mm_storeu_si128((__m128i*)(digest + 32), BSWAP64(S->h[2]));
    _mm_storeu_si128((__m128i*)(digest + 48), BSWAP64(S->h[3]));
  } while(0);
}


int crypto_hash_old( unsigned char *out, const unsigned char *in, unsigned long long inlen ) 
{

  state S;
  blake512_init( &S );
  blake512_update( &S, in, inlen*8 );
  blake512_final( &S, out );
  return 0;
}

int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen ) 
{
  state S0;
  state S1;
  unsigned char out0[64];
  unsigned char out1[64];

  blake512_init0(&S0);
  blake512_init1(&S1);
  while (inlen >= 256) {
    if (!(S0.t[0] += 1024)) ++S0.t[1];
    if (!(S1.t[0] += 1024)) ++S1.t[1];
    blake512_compress2(&S0,in,&S1,in + 128);
    in += 256;
    inlen -= 256;
  }
  if (inlen >= 128) {
    blake512_update(&S0,in,128*8); in += 128; inlen -= 128;
    blake512_update(&S1,in,inlen*8);
  } else {
    blake512_update(&S0,in,inlen*8);
  }
  blake512_final(&S0,out0);
  blake512_final(&S1,out1);

  blake512_init(&S0);
  blake512_update(&S0,out0,64*8);
  blake512_update(&S0,out1,64*8);
  blake512_final(&S0,out);

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

  crypto_hash_old( digest, data, 1 );    
  v=0;
  for(i=0; i<64; ++i) {
    printf("%02X", digest[i]);
    if ( digest[i] != test1[i]) v=1;
  }
  if (v) printf("\nerror\n");
  else  printf("\nok\n");

  for(i=0; i<144; ++i) data[i]=0;  

  crypto_hash_old( digest, data, 144 );    
  v=0;
  for(i=0; i<64; ++i) {
    printf("%02X", digest[i]);
    if ( digest[i] != test2[i]) v=1;
  }
  if (v) printf("\nerror\n");
  else printf("\nok\n");

  /* computing IVs for bblake512 */
  /*
    data[0]=0x00;
    crypto_hash_old( digest, data, 1 );    
    for(i=0; i<64; ++i) {
    printf("%02X", digest[i]);
    if (i%8==7) printf("\n");
    }

    printf(" \n");

    data[0]=0x01;
    crypto_hash_old( digest, data, 1 );    
    for(i=0; i<64; ++i) {
    printf("%02X", digest[i]);
    if (i%8==7) printf("\n");
    }
  */
  
  bench();

  return 0;
}

#endif




