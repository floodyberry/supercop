#include <string.h>
#include <stdio.h>
#include <emmintrin.h>
#include "crypto_hash.h"
#include "crypto_uint64.h"
#include "crypto_uint32.h"
#include "crypto_uint8.h"

typedef crypto_uint64 u64;
typedef crypto_uint32 u32;
typedef crypto_uint8 u8; 

#define U8TO32(p)					\
  (((u32)((p)[0]) << 24) | ((u32)((p)[1]) << 16) |	\
   ((u32)((p)[2]) <<  8) | ((u32)((p)[3])      ))
#define U32TO8(p, v)					\
  (p)[0] = (u8)((v) >> 24); (p)[1] = (u8)((v) >> 16);	\
  (p)[2] = (u8)((v) >>  8); (p)[3] = (u8)((v)      ); 

#define LOADU(p)  _mm_loadu_si128( (__m128i *)(p) )
#define BSWAP32(r) do { \
   r = _mm_shufflehi_epi16(r, _MM_SHUFFLE(2, 3, 0, 1)); \
   r = _mm_shufflelo_epi16(r, _MM_SHUFFLE(2, 3, 0, 1)); \
   r = _mm_xor_si128(_mm_slli_epi16(r, 8), _mm_srli_epi16(r, 8)); \
} while(0)

typedef struct  { 
  u32 h[8], s[4], t[2];
  int buflen, nullt;
  u8  buf[64];
} state;

const u8 sigma[][16] = {
  { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15 },
  {14,10, 4, 8, 9,15,13, 6, 1,12, 0, 2,11, 7, 5, 3 },
  {11, 8,12, 0, 5, 2,15,13,10,14, 3, 6, 7, 1, 9, 4 },
  { 7, 9, 3, 1,13,12,11,14, 2, 6, 5,10, 4, 0,15, 8 },
  { 9, 0, 5, 7, 2, 4,10,15,14, 1,11,12, 6, 8, 3,13 },
  { 2,12, 6,10, 0,11, 8, 3, 4,13, 7, 5,15,14, 1, 9 },
  {12, 5, 1,15,14,13, 4,10, 0, 7, 6, 3, 9, 2, 8,11 },
  {13,11, 7,14,12, 1, 3, 9, 5, 0,15, 4, 8, 6, 2,10 },
  { 6,15,14, 9,11, 3, 0, 8,12, 2,13, 7, 1, 4,10, 5 },
  {10, 2, 8, 4, 7, 6, 1, 5,15,11, 9,14, 3,12,13 ,0 },
  { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15 },
  {14,10, 4, 8, 9,15,13, 6, 1,12, 0, 2,11, 7, 5, 3 },
  {11, 8,12, 0, 5, 2,15,13,10,14, 3, 6, 7, 1, 9, 4 },
  { 7, 9, 3, 1,13,12,11,14, 2, 6, 5,10, 4, 0,15, 8 },
  { 9, 0, 5, 7, 2, 4,10,15,14, 1,11,12, 6, 8, 3,13 },
  { 2,12, 6,10, 0,11, 8, 3, 4,13, 7, 5,15,14, 1, 9 },
  {12, 5, 1,15,14,13, 4,10, 0, 7, 6, 3, 9, 2, 8,11 },
  {13,11, 7,14,12, 1, 3, 9, 5, 0,15, 4, 8, 6, 2,10 },
  { 6,15,14, 9,11, 3, 0, 8,12, 2,13, 7, 1, 4,10, 5 },
  {10, 2, 8, 4, 7, 6, 1, 5,15,11, 9,14, 3,12,13 ,0 }};

const u32 cst[16] = {
  0x243F6A88,0x85A308D3,0x13198A2E,0x03707344,
  0xA4093822,0x299F31D0,0x082EFA98,0xEC4E6C89,
  0x452821E6,0x38D01377,0xBE5466CF,0x34E90C6C,
  0xC0AC29B7,0xC97C50DD,0x3F84D5B5,0xB5470917};

const u8 padding[] =
  {0x80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

static const int sig[][16] = {
  {  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15 } ,
  { 14, 10,  4,  8,  9, 15, 13,  6,  1, 12,  0,  2, 11,  7,  5,  3 } ,
  { 11,  8, 12,  0,  5,  2, 15, 13, 10, 14,  3,  6,  7,  1,  9,  4 } ,
  {  7,  9,  3,  1, 13, 12, 11, 14,  2,  6,  5, 10,  4,  0, 15,  8 } ,
  {  9,  0,  5,  7,  2,  4, 10, 15, 14,  1, 11, 12,  6,  8,  3, 13 } ,
  {  2, 12,  6, 10,  0, 11,  8,  3,  4, 13,  7,  5, 15, 14,  1,  9 } ,
  { 12,  5,  1, 15, 14, 13,  4, 10,  0,  7,  6,  3,  9,  2,  8, 11 } ,
  { 13, 11,  7, 14, 12,  1,  3,  9,  5,  0, 15,  4,  8,  6,  2, 10 } ,
  {  6, 15, 14,  9, 11,  3,  0,  8, 12,  2, 13,  7,  1,  4, 10,  5 } ,
  { 10,  2,  8,  4,  7,  6,  1,  5, 15, 11,  9, 14,  3, 12, 13 , 0 } ,
  {  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15 } ,
  { 14, 10,  4,  8,  9, 15, 13,  6,  1, 12,  0,  2, 11,  7,  5,  3 } ,
  { 11,  8, 12,  0,  5,  2, 15, 13, 10, 14,  3,  6,  7,  1,  9,  4 } ,
  {  7,  9,  3,  1, 13, 12, 11, 14,  2,  6,  5, 10,  4,  0, 15,  8 }  
};

static const u32 z[16] = {
  0x243F6A88, 0x85A308D3, 0x13198A2E, 0x03707344,
  0xA4093822, 0x299F31D0, 0x082EFA98, 0xEC4E6C89,
  0x452821E6, 0x38D01377, 0xBE5466CF, 0x34E90C6C,
  0xC0AC29B7, 0xC97C50DD, 0x3F84D5B5, 0xB5470917 
};

#define down1(r,m,row1,row2,row3,row4,buf1,buf2) \
        buf1 = _mm_set_epi32(m.u32[sig[r][ 6]], \
                            m.u32[sig[r][ 4]], \
                            m.u32[sig[r][ 2]], \
                            m.u32[sig[r][ 0]]); \
        buf2 = _mm_set_epi32(z[sig[r][ 7]], \
                            z[sig[r][ 5]], \
                            z[sig[r][ 3]], \
                            z[sig[r][ 1]]); \
        buf1 = _mm_xor_si128( buf1, buf2); \
        row1 = _mm_add_epi32( row1, buf1); \
        row1 = _mm_add_epi32( row1, row2 ); \
        row4 = _mm_xor_si128( row4, row1 ); \
        row4 = _mm_xor_si128(_mm_srli_epi32( row4, 16 ),_mm_slli_epi32( row4, 16 )); \
        row3 = _mm_add_epi32( row3, row4 );   \
        row2 = _mm_xor_si128( row2, row3 ); \
        row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); \


#define down2(r,m,row1,row2,row3,row4,buf1,buf2) \
        buf1 = _mm_set_epi32(z[sig[r][ 6]], \
                            z[sig[r][ 4]], \
                            z[sig[r][ 2]], \
                            z[sig[r][ 0]]); \
        buf2 = _mm_set_epi32(m.u32[sig[r][ 7]], \
                            m.u32[sig[r][ 5]], \
                            m.u32[sig[r][ 3]], \
                            m.u32[sig[r][ 1]]); \
        buf1 = _mm_xor_si128( buf1, buf2); \
        row1 = _mm_add_epi32( row1, buf1); \
        row1 = _mm_add_epi32( row1, row2 ); \
        row4 = _mm_xor_si128( row4, row1 ); \
        row4 = _mm_xor_si128(_mm_srli_epi32( row4,  8 ),_mm_slli_epi32( row4, 24 )); \
        row3 = _mm_add_epi32( row3, row4 );   \
        row2 = _mm_xor_si128( row2, row3 ); \
        row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); \
        row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); \
        row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); \
        row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); \


#define diag1(r,m,row1,row2,row3,row4,buf1,buf2) \
        buf1 = _mm_set_epi32(m.u32[sig[r][14]], \
                            m.u32[sig[r][12]], \
                            m.u32[sig[r][10]], \
                            m.u32[sig[r][ 8]]); \
        buf2 = _mm_set_epi32(z[sig[r][15]], \
                            z[sig[r][13]], \
                            z[sig[r][11]], \
                            z[sig[r][ 9]]); \
        buf1 = _mm_xor_si128( buf1, buf2); \
        row1 = _mm_add_epi32( row1, buf1); \
        row1 = _mm_add_epi32( row1, row2 ); \
        row4 = _mm_xor_si128( row4, row1 ); \
        row4 = _mm_xor_si128(_mm_srli_epi32( row4, 16 ),_mm_slli_epi32( row4, 16 )); \
        row3 = _mm_add_epi32( row3, row4 );   \
        row2 = _mm_xor_si128( row2, row3 ); \
        row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); \


#define diag2(r,m,row1,row2,row3,row4,buf1,buf2) \
        buf1 = _mm_set_epi32(z[sig[r][14]], \
                            z[sig[r][12]], \
                            z[sig[r][10]], \
                            z[sig[r][ 8]]); \
        buf2 = _mm_set_epi32(m.u32[sig[r][15]], \
                            m.u32[sig[r][13]], \
                            m.u32[sig[r][11]], \
                            m.u32[sig[r][ 9]]); \
        buf1 = _mm_xor_si128( buf1, buf2); \
        row1 = _mm_add_epi32( row1, buf1); \
        row1 = _mm_add_epi32( row1, row2 ); \
        row4 = _mm_xor_si128( row4, row1 ); \
        row4 = _mm_xor_si128(_mm_srli_epi32( row4,  8 ),_mm_slli_epi32( row4, 24 )); \
        row3 = _mm_add_epi32( row3, row4 );   \
        row2 = _mm_xor_si128( row2, row3 ); \
        row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); \
        row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); \
        row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); \
        row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); \

#define round(r,m,row1,row2,row3,row4,buf1,buf2) \
  down1(r,m,row1,row2,row3,row4,buf1,buf2) \
  down2(r,m,row1,row2,row3,row4,buf1,buf2) \
  diag1(r,m,row1,row2,row3,row4,buf1,buf2) \
  diag2(r,m,row1,row2,row3,row4,buf1,buf2)
  

static void blake256_compress( state * state, const u8 * datablock ) {

  __m128i row1,row2,row3,row4;
  __m128i buf1,buf2;
  
  union {
    u32     u32[16];
    __m128i u128[4];
  } m;
  u64 t;

  m.u128[0] = LOADU(datablock +  0);
  m.u128[1] = LOADU(datablock + 16);
  m.u128[2] = LOADU(datablock + 32);
  m.u128[3] = LOADU(datablock + 48);
   
  BSWAP32(m.u128[0]);
  BSWAP32(m.u128[1]);
  BSWAP32(m.u128[2]);
  BSWAP32(m.u128[3]);

  row1 = _mm_set_epi32(state->h[ 3], state->h[ 2],
		       state->h[ 1], state->h[ 0]);
  row2 = _mm_set_epi32(state->h[ 7], state->h[ 6],
		       state->h[ 5], state->h[ 4]);
  row3 = _mm_set_epi32(0x03707344, 0x13198A2E, 0x85A308D3, 0x243F6A88);

  if (state->nullt) 
    row4 = _mm_set_epi32(0xEC4E6C89, 0x082EFA98, 0x299F31D0, 0xA4093822);
  else 
    row4 = _mm_set_epi32(0xEC4E6C89^state->t[1], 0x082EFA98^state->t[1],
			 0x299F31D0^state->t[0], 0xA4093822^state->t[0]);

  round( 0,m,row1,row2,row3,row4,buf1,buf2);
  round( 1,m,row1,row2,row3,row4,buf1,buf2);
  round( 2,m,row1,row2,row3,row4,buf1,buf2);
  round( 3,m,row1,row2,row3,row4,buf1,buf2);
  round( 4,m,row1,row2,row3,row4,buf1,buf2);
  round( 5,m,row1,row2,row3,row4,buf1,buf2);
  round( 6,m,row1,row2,row3,row4,buf1,buf2);
  round( 7,m,row1,row2,row3,row4,buf1,buf2);
  round( 8,m,row1,row2,row3,row4,buf1,buf2);
  round( 9,m,row1,row2,row3,row4,buf1,buf2);
  round(10,m,row1,row2,row3,row4,buf1,buf2);
  round(11,m,row1,row2,row3,row4,buf1,buf2);
  round(12,m,row1,row2,row3,row4,buf1,buf2);
  round(13,m,row1,row2,row3,row4,buf1,buf2);

  _mm_store_si128( (__m128i *)m.u32, _mm_xor_si128(row1,row3));
  state->h[0] ^= m.u32[ 0]; 
  state->h[1] ^= m.u32[ 1];    
  state->h[2] ^= m.u32[ 2];    
  state->h[3] ^= m.u32[ 3];
  _mm_store_si128( (__m128i *)m.u32, _mm_xor_si128(row2,row4));
  state->h[4] ^= m.u32[ 0];    
  state->h[5] ^= m.u32[ 1];    
  state->h[6] ^= m.u32[ 2];    
  state->h[7] ^= m.u32[ 3];
}

static void blake256_compress2(
  state * xstate, const u8 * xdatablock,
  state * ystate, const u8 * ydatablock 
)
{
  __m128i xrow1,xrow2,xrow3,xrow4;
  __m128i xbuf1,xbuf2;
  __m128i yrow1,yrow2,yrow3,yrow4;
  __m128i ybuf1,ybuf2;
  
  union {
    u32     u32[16];
    __m128i u128[4];
  } xm, ym;
  u64 t;

  xm.u128[0] = LOADU(xdatablock +  0);
  xm.u128[1] = LOADU(xdatablock + 16);
  xm.u128[2] = LOADU(xdatablock + 32);
  xm.u128[3] = LOADU(xdatablock + 48);
  ym.u128[0] = LOADU(ydatablock +  0);
  ym.u128[1] = LOADU(ydatablock + 16);
  ym.u128[2] = LOADU(ydatablock + 32);
  ym.u128[3] = LOADU(ydatablock + 48);
   
  BSWAP32(xm.u128[0]);
  BSWAP32(xm.u128[1]);
  BSWAP32(xm.u128[2]);
  BSWAP32(xm.u128[3]);
  BSWAP32(ym.u128[0]);
  BSWAP32(ym.u128[1]);
  BSWAP32(ym.u128[2]);
  BSWAP32(ym.u128[3]);

  xrow1 = _mm_set_epi32(xstate->h[ 3], xstate->h[ 2],
		        xstate->h[ 1], xstate->h[ 0]);
  xrow2 = _mm_set_epi32(xstate->h[ 7], xstate->h[ 6],
		        xstate->h[ 5], xstate->h[ 4]);
  xrow3 = _mm_set_epi32(0x03707344, 0x13198A2E, 0x85A308D3, 0x243F6A88);

  if (xstate->nullt) 
    xrow4 = _mm_set_epi32(0xEC4E6C89, 0x082EFA98, 0x299F31D0, 0xA4093822);
  else 
    xrow4 = _mm_set_epi32(0xEC4E6C89^xstate->t[1], 0x082EFA98^xstate->t[1],
			  0x299F31D0^xstate->t[0], 0xA4093822^xstate->t[0]);

  yrow1 = _mm_set_epi32(ystate->h[ 3], ystate->h[ 2],
		        ystate->h[ 1], ystate->h[ 0]);
  yrow2 = _mm_set_epi32(ystate->h[ 7], ystate->h[ 6],
		        ystate->h[ 5], ystate->h[ 4]);
  yrow3 = _mm_set_epi32(0x03707344, 0x13198A2E, 0x85A308D3, 0x243F6A88);

  if (ystate->nullt) 
    yrow4 = _mm_set_epi32(0xEC4E6C89, 0x082EFA98, 0x299F31D0, 0xA4093822);
  else 
    yrow4 = _mm_set_epi32(0xEC4E6C89^ystate->t[1], 0x082EFA98^ystate->t[1],
			  0x299F31D0^ystate->t[0], 0xA4093822^ystate->t[0]);

#define roundround(r) \
  down1( r,xm,xrow1,xrow2,xrow3,xrow4,xbuf1,xbuf2) \
  down1( r,ym,yrow1,yrow2,yrow3,yrow4,ybuf1,ybuf2) \
  down2( r,xm,xrow1,xrow2,xrow3,xrow4,xbuf1,xbuf2) \
  down2( r,ym,yrow1,yrow2,yrow3,yrow4,ybuf1,ybuf2) \
  diag1( r,xm,xrow1,xrow2,xrow3,xrow4,xbuf1,xbuf2) \
  diag1( r,ym,yrow1,yrow2,yrow3,yrow4,ybuf1,ybuf2) \
  diag2( r,xm,xrow1,xrow2,xrow3,xrow4,xbuf1,xbuf2) \
  diag2( r,ym,yrow1,yrow2,yrow3,yrow4,ybuf1,ybuf2)

  roundround( 0)
  roundround( 1)
  roundround( 2)
  roundround( 3)
  roundround( 4)
  roundround( 5)
  roundround( 6)
  roundround( 7)
  roundround( 8)
  roundround( 9)
  roundround(10)
  roundround(11)
  roundround(12)
  roundround(13)

  _mm_store_si128( (__m128i *)xm.u32, _mm_xor_si128(xrow1,xrow3));
  xstate->h[0] ^= xm.u32[ 0]; 
  xstate->h[1] ^= xm.u32[ 1];    
  xstate->h[2] ^= xm.u32[ 2];    
  xstate->h[3] ^= xm.u32[ 3];
  _mm_store_si128( (__m128i *)xm.u32, _mm_xor_si128(xrow2,xrow4));
  xstate->h[4] ^= xm.u32[ 0];    
  xstate->h[5] ^= xm.u32[ 1];    
  xstate->h[6] ^= xm.u32[ 2];    
  xstate->h[7] ^= xm.u32[ 3];

  _mm_store_si128( (__m128i *)ym.u32, _mm_xor_si128(yrow1,yrow3));
  ystate->h[0] ^= ym.u32[ 0]; 
  ystate->h[1] ^= ym.u32[ 1];    
  ystate->h[2] ^= ym.u32[ 2];    
  ystate->h[3] ^= ym.u32[ 3];
  _mm_store_si128( (__m128i *)ym.u32, _mm_xor_si128(yrow2,yrow4));
  ystate->h[4] ^= ym.u32[ 0];    
  ystate->h[5] ^= ym.u32[ 1];    
  ystate->h[6] ^= ym.u32[ 2];    
  ystate->h[7] ^= ym.u32[ 3];
}

void blake256_init( state *S ) {
  S->h[0]=0x6A09E667;
  S->h[1]=0xBB67AE85;
  S->h[2]=0x3C6EF372;
  S->h[3]=0xA54FF53A;
  S->h[4]=0x510E527F;
  S->h[5]=0x9B05688C;
  S->h[6]=0x1F83D9AB;
  S->h[7]=0x5BE0CD19;
  S->t[0]=S->t[1]=S->buflen=S->nullt=0;
  S->s[0]=S->s[1]=S->s[2]=S->s[3] =0;
}

void blake256_init0( state *S ) {
  S->h[0]=0xb5bfb2f9;
  S->h[1]=0x14cfcc63;
  S->h[2]=0xb85c549c;
  S->h[3]=0xc9b4184e;
  S->h[4]=0x67dfc6ce;
  S->h[5]=0x29e9904b;
  S->h[6]=0xd59ee74e;
  S->h[7]=0xfaa9c653;
  S->t[0]=512;
  S->t[1]=S->buflen=S->nullt=0;
  S->s[0]=S->s[1]=S->s[2]=S->s[3] =0;
}

void blake256_init1( state *S ) {
  S->h[0]=0x3174b284;
  S->h[1]=0x24796e24;
  S->h[2]=0x9fc2eecc;
  S->h[3]=0x236cb48c;
  S->h[4]=0x15f7a368;
  S->h[5]=0x4fe6923e;
  S->h[6]=0x04fad360;
  S->h[7]=0x76aeea3a;
  S->t[0]=512;
  S->t[1]=S->buflen=S->nullt=0;
  S->s[0]=S->s[1]=S->s[2]=S->s[3] =0;
}


void blake256_update( state *S, const u8 *data, u64 datalen ) {

  int left=S->buflen >> 3; 
  int fill=64 - left;
   
  if( left && ( ((datalen >> 3) & 0x3F) >= fill ) ) {
    memcpy( (void*) (S->buf + left), (void*) data, fill );
    S->t[0] += 512;
    if (S->t[0] == 0) S->t[1]++;      
    blake256_compress( S, S->buf );
    data += fill;
    datalen  -= (fill << 3);       
    left = 0;
  }

  while( datalen >= 512 ) {
    S->t[0] += 512;
    if (S->t[0] == 0) S->t[1]++;
    blake256_compress( S, data );
    data += 64;
    datalen  -= 512;
  }
  
  if( datalen > 0 ) {
    memcpy( (void*) (S->buf + left), (void*) data, datalen>>3 );
    S->buflen = (left<<3) + datalen;
  }
  else S->buflen=0;
}


void blake256_final( state *S, u8 *digest ) {
  
  u8 msglen[8], zo=0x01, oo=0x81;
  u32 lo=S->t[0] + S->buflen, hi=S->t[1];
  if ( lo < S->buflen ) hi++;
  U32TO8(  msglen + 0, hi );
  U32TO8(  msglen + 4, lo );

  if ( S->buflen == 440 ) { /* one padding byte */
    S->t[0] -= 8;
    blake256_update( S, &oo, 8 );
  }
  else {
    if ( S->buflen < 440 ) { /* enough space to fill the block  */
      if ( !S->buflen ) S->nullt=1;
      S->t[0] -= 440 - S->buflen;
      blake256_update( S, padding, 440 - S->buflen );
    }
    else { /* need 2 compressions */
      S->t[0] -= 512 - S->buflen; 
      blake256_update( S, padding, 512 - S->buflen );
      S->t[0] -= 440;
      blake256_update( S, padding+1, 440 );
      S->nullt = 1;
    }
    blake256_update( S, &zo, 8 );
    S->t[0] -= 8;
  }
  S->t[0] -= 64;
  blake256_update( S, msglen, 64 );    
  
  U32TO8( digest + 0, S->h[0]);
  U32TO8( digest + 4, S->h[1]);
  U32TO8( digest + 8, S->h[2]);
  U32TO8( digest +12, S->h[3]);
  U32TO8( digest +16, S->h[4]);
  U32TO8( digest +20, S->h[5]);
  U32TO8( digest +24, S->h[6]);
  U32TO8( digest +28, S->h[7]);
}


int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
{
  state S0;
  state S1;
  unsigned char out0[crypto_hash_BYTES];
  unsigned char out1[crypto_hash_BYTES];

  blake256_init0(&S0);
  blake256_init1(&S1);
  while (inlen >= 128) {
    if (!(S0.t[0] += 512)) ++S0.t[1];
    if (!(S1.t[0] += 512)) ++S1.t[1];
    blake256_compress2(&S0,in,&S1,in + 64);
    in += 128;
    inlen -= 128;
  }
  if (inlen >= 64) {
    blake256_update(&S0,in,64*8); in += 64; inlen -= 64;
    blake256_update(&S1,in,inlen*8);
  } else {
    blake256_update(&S0,in,inlen*8);
  }
  blake256_final(&S0,out0);
  blake256_final(&S1,out1);

  blake256_init(&S0);
  blake256_update(&S0,out0,crypto_hash_BYTES*8);
  blake256_update(&S0,out1,crypto_hash_BYTES*8);
  blake256_final(&S0,out);

  return 0;
}
