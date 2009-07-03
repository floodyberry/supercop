#include <string.h>
#include <stdio.h>
#include <emmintrin.h>
#include "crypto_hash.h"

typedef unsigned long long u64;
typedef unsigned int u32;
typedef unsigned char u8; 

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

typedef struct  { 
  u64 h[8], s[4], t[2];
  int buflen, nullt;
  u8 buf[128];
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
    {10, 2, 8, 4, 7, 6, 1, 5,15,11, 9,14, 3,12,13 ,0 }  
  };

const u64 cst[16] = {
  0x243F6A8885A308D3ULL,0x13198A2E03707344ULL,0xA4093822299F31D0ULL,0x082EFA98EC4E6C89ULL,
  0x452821E638D01377ULL,0xBE5466CF34E90C6CULL,0xC0AC29B7C97C50DDULL,0x3F84D5B5B5470917ULL,
  0x9216D5D98979FB1BULL,0xD1310BA698DFB5ACULL,0x2FFD72DBD01ADFB7ULL,0xB8E1AFED6A267E96ULL,
  0xBA7C9045F12C7F99ULL,0x24A19947B3916CF7ULL,0x0801F2E2858EFC16ULL,0x636920D871574E69ULL
};

static const u8 padding[129] =
  { 0x80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};


static  int blake64_compress( state * state, const u8 * datablock ) {

  __m128i row1a,row1b;
  __m128i row2a,row2b;
  __m128i row3a,row3b;
  __m128i row4a,row4b;
  __m128i buf1a,buf2a;

  u64 m[16]; 
  u64 y[16]; 

  /* constants and permutation */
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
    { 10,  2,  8,  4,  7,  6,  1,  5, 15, 11,  9, 14,  3, 12, 13 , 0 }, 
    {  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15 } ,
    { 14, 10,  4,  8,  9, 15, 13,  6,  1, 12,  0,  2, 11,  7,  5,  3 } ,
    { 11,  8, 12,  0,  5,  2, 15, 13, 10, 14,  3,  6,  7,  1,  9,  4 } ,
    {  7,  9,  3,  1, 13, 12, 11, 14,  2,  6,  5, 10,  4,  0, 15,  8 } ,
  };

  static const u64 z[16] = {
    0x243F6A8885A308D3ULL,0x13198A2E03707344ULL,
    0xA4093822299F31D0ULL,0x082EFA98EC4E6C89ULL,
    0x452821E638D01377ULL,0xBE5466CF34E90C6CULL,
    0xC0AC29B7C97C50DDULL,0x3F84D5B5B5470917ULL,
    0x9216D5D98979FB1BULL,0xD1310BA698DFB5ACULL,
    0x2FFD72DBD01ADFB7ULL,0xB8E1AFED6A267E96ULL,
    0xBA7C9045F12C7F99ULL,0x24A19947B3916CF7ULL,
    0x0801F2E2858EFC16ULL,0x636920D871574E69ULL
  };

  /* get message */
  m[ 0] = U8TO64(datablock +  0);
  m[ 1] = U8TO64(datablock +  8);
  m[ 2] = U8TO64(datablock + 16);
  m[ 3] = U8TO64(datablock + 24);
  m[ 4] = U8TO64(datablock + 32);
  m[ 5] = U8TO64(datablock + 40);
  m[ 6] = U8TO64(datablock + 48);
  m[ 7] = U8TO64(datablock + 56);
  m[ 8] = U8TO64(datablock + 64);
  m[ 9] = U8TO64(datablock + 72);
  m[10] = U8TO64(datablock + 80);
  m[11] = U8TO64(datablock + 88);
  m[12] = U8TO64(datablock + 96);
  m[13] = U8TO64(datablock +104);
  m[14] = U8TO64(datablock +112);
  m[15] = U8TO64(datablock +120);

  row1b = _mm_set_epi64((__m64)state->h[3],(__m64)state->h[2]);
  row1a = _mm_set_epi64((__m64)state->h[1],(__m64)state->h[0]);
  row2b = _mm_set_epi64((__m64)state->h[7],(__m64)state->h[6]);
  row2a = _mm_set_epi64((__m64)state->h[5],(__m64)state->h[4]);
  row3b = _mm_set_epi64((__m64)0x082EFA98EC4E6C89ULL,
			(__m64)0xA4093822299F31D0ULL);
  row3a = _mm_set_epi64((__m64)0x13198A2E03707344ULL,
			(__m64)0x243F6A8885A308D3ULL);
  
  if (state->nullt) {
    row4b = _mm_set_epi64((__m64)0x3F84D5B5B5470917ULL,
			  (__m64)0xC0AC29B7C97C50DDULL);
    row4a = _mm_set_epi64((__m64)0xBE5466CF34E90C6CULL,
			  (__m64)0x452821E638D01377ULL);
  }
  else {
    row4b = _mm_set_epi64((__m64)(0x3F84D5B5B5470917ULL^state->t[1]),
			  (__m64)(0xC0AC29B7C97C50DDULL^state->t[1]));
    row4a = _mm_set_epi64((__m64)(0xBE5466CF34E90C6CULL^state->t[0]),
			  (__m64)(0x452821E638D01377ULL^state->t[0]));
  }
  /* initialization ok (beware of bug on Celeron and P4!) */

  

#define round(r)\
    /* column step */\
    /***************************************************/\
    /* high-order side: words 0, 1, 4, 5, 8, 9, 12, 13  */		\
    buf2a = _mm_set_epi64( (__m64)m[sig[r][ 2]], (__m64)m[sig[r][ 0]] );	\
    buf1a = _mm_set_epi64( (__m64)z[sig[r][ 3]], (__m64)z[sig[r][ 1]] );	\
    buf1a = _mm_xor_si128( buf1a, buf2a );					\
    row1a = _mm_add_epi64( _mm_add_epi64(row1a, buf1a), row2a );		\
    row4a = _mm_xor_si128( row4a, row1a );				\
    row4a = _mm_xor_si128(_mm_srli_epi64( row4a, 32 ),_mm_slli_epi64( row4a, 32 )); \
    row3a = _mm_add_epi64( row3a, row4a );				\
    row2a = _mm_xor_si128( row2a, row3a );				\
    row2a = _mm_xor_si128(_mm_srli_epi64( row2a, 25 ),_mm_slli_epi64( row2a, 39 )); \
  									\
    buf2a = _mm_set_epi64( (__m64)m[sig[r][ 3]], (__m64)m[sig[r][ 1]] );	\
    buf1a = _mm_set_epi64( (__m64)z[sig[r][ 2]], (__m64)z[sig[r][ 0]] );	\
    buf1a = _mm_xor_si128( buf1a, buf2a );					\
    row1a = _mm_add_epi64( _mm_add_epi64(row1a, buf1a), row2a );		\
    row4a = _mm_xor_si128( row4a, row1a );				\
    row4a = _mm_xor_si128(_mm_srli_epi64( row4a, 16 ),_mm_slli_epi64( row4a, 48 )); \
    row3a = _mm_add_epi64( row3a, row4a );				\
    row2a = _mm_xor_si128( row2a, row3a );				\
    row2a = _mm_xor_si128(_mm_srli_epi64( row2a, 11 ),_mm_slli_epi64( row2a, 53 )); \
  									\
    /* same stuff for low-order side */\
    buf2a = _mm_set_epi64( (__m64)m[sig[r][ 6]], (__m64)m[sig[r][ 4]] );\
    buf1a = _mm_set_epi64( (__m64)z[sig[r][ 7]], (__m64)z[sig[r][ 5]] );\
    buf1a = _mm_xor_si128( buf1a, buf2a );				\
    row1b = _mm_add_epi64( _mm_add_epi64(row1b, buf1a), row2b );		\
    row4b = _mm_xor_si128( row4b, row1b );				\
    row4b = _mm_xor_si128(_mm_srli_epi64( row4b, 32 ),_mm_slli_epi64( row4b, 32 )); \
    row3b = _mm_add_epi64( row3b, row4b );				\
    row2b = _mm_xor_si128( row2b, row3b );				\
    row2b = _mm_xor_si128(_mm_srli_epi64( row2b, 25 ),_mm_slli_epi64( row2b, 39 )); \
\
    buf2a = _mm_set_epi64( (__m64)m[sig[r][ 7]], (__m64)m[sig[r][ 5]] );	\
    buf1a = _mm_set_epi64( (__m64)z[sig[r][ 6]], (__m64)z[sig[r][ 4]] );	\
    buf1a = _mm_xor_si128( buf1a, buf2a );					\
    row1b = _mm_add_epi64( _mm_add_epi64(row1b, buf1a), row2b );		\
    row4b = _mm_xor_si128( row4b, row1b );				\
    row4b = _mm_xor_si128(_mm_srli_epi64( row4b, 16 ),_mm_slli_epi64( row4b, 48 )); \
    row3b = _mm_add_epi64( row3b, row4b );				\
    row2b = _mm_xor_si128( row2b, row3b );				\
    row2b = _mm_xor_si128(_mm_srli_epi64( row2b, 11 ),_mm_slli_epi64( row2b, 53 )); \
\
    /* shuffle */\
    _mm_store_si128( 0+ (__m128i *)y, row4a); \
    _mm_store_si128( 1+ (__m128i *)y, row4b); \
    row4a = row3a;\
    row3a = row3b;\
    row3b = row4a;\
    row4a  = _mm_set_epi64( (__m64)y[0], (__m64)y[3] );\
    row4b  = _mm_set_epi64( (__m64)y[2], (__m64)y[1] );\
    _mm_store_si128( 0+ (__m128i *)y, row2a);  \
    _mm_store_si128( 1+ (__m128i *)y, row2b);  \
    row2a  = _mm_set_epi64( (__m64)y[2], (__m64)y[1] );  \
    row2b  = _mm_set_epi64( (__m64)y[0], (__m64)y[3] );  \
    /* diagonal step */\
    /***************************************************/\
    /* high-order side: words 0, 1, 4, 5, 8, 9, 12, 13  */\
    buf2a = _mm_set_epi64( (__m64)m[sig[r][10]], (__m64)m[sig[r][ 8]] );\
    buf1a = _mm_set_epi64( (__m64)z[sig[r][11]], (__m64)z[sig[r][ 9]] );\
    buf1a = _mm_xor_si128( buf1a, buf2a );\
    row1a = _mm_add_epi64( _mm_add_epi64(row1a, buf1a), row2a );\
    row4a = _mm_xor_si128( row4a, row1a );		      \
    row4a = _mm_xor_si128(_mm_srli_epi64( row4a, 32 ),_mm_slli_epi64( row4a, 32 )); \
    row3a = _mm_add_epi64( row3a, row4a );					\
    row2a = _mm_xor_si128( row2a, row3a );					\
    row2a = _mm_xor_si128(_mm_srli_epi64( row2a, 25 ),_mm_slli_epi64( row2a, 39 )); \
\
    buf2a = _mm_set_epi64( (__m64)m[sig[r][11]], (__m64)m[sig[r][ 9]] );\
    buf1a = _mm_set_epi64( (__m64)z[sig[r][10]], (__m64)z[sig[r][ 8]] );\
    buf1a = _mm_xor_si128( buf1a, buf2a );\
    row1a = _mm_add_epi64( _mm_add_epi64(row1a, buf1a), row2a );\
    row4a = _mm_xor_si128( row4a, row1a );			\
    row4a = _mm_xor_si128(_mm_srli_epi64( row4a, 16 ),_mm_slli_epi64( row4a, 48 )); \
    row3a = _mm_add_epi64( row3a, row4a );					\
    row2a = _mm_xor_si128( row2a, row3a );					\
    row2a = _mm_xor_si128(_mm_srli_epi64( row2a, 11 ),_mm_slli_epi64( row2a, 53 )); \
\
    /* same stuff for low-order side */\
    buf2a = _mm_set_epi64( (__m64)m[sig[r][14]], (__m64)m[sig[r][12]] );\
    buf1a = _mm_set_epi64( (__m64)z[sig[r][15]], (__m64)z[sig[r][13]] );\
    buf1a = _mm_xor_si128( buf1a, buf2a );\
    row1b = _mm_add_epi64( _mm_add_epi64(row1b, buf1a), row2b );\
    row4b = _mm_xor_si128( row4b, row1b );			\
    buf2a = _mm_set_epi64( (__m64)m[sig[r][15]], (__m64)m[sig[r][13]] );\
    row4b = _mm_xor_si128(_mm_srli_epi64( row4b, 32 ),_mm_slli_epi64( row4b, 32 )); \
    row3b = _mm_add_epi64( row3b, row4b );					\
    row2b = _mm_xor_si128( row2b, row3b );					\
    buf1a = _mm_set_epi64( (__m64)z[sig[r][14]], (__m64)z[sig[r][12]] );\
    row2b = _mm_xor_si128(_mm_srli_epi64( row2b, 25 ),_mm_slli_epi64( row2b, 39 )); \
\
    buf1a = _mm_xor_si128( buf1a, buf2a );\
    row1b = _mm_add_epi64( _mm_add_epi64(row1b, buf1a), row2b );\
    row4b = _mm_xor_si128( row4b, row1b );			\
    row4b = _mm_xor_si128(_mm_srli_epi64( row4b, 16 ),_mm_slli_epi64( row4b, 48 )); \
    row3b = _mm_add_epi64( row3b, row4b );					\
    row2b = _mm_xor_si128( row2b, row3b );					\
    row2b = _mm_xor_si128(_mm_srli_epi64( row2b, 11 ),_mm_slli_epi64( row2b, 53 )); \
\
    /* shuffle back */\
    buf1a = row3a;\
    row3a = row3b;\
    row3b = buf1a;\
    _mm_store_si128( 0+ (__m128i *)y, row2a);	\
    _mm_store_si128( 1+ (__m128i *)y, row2b);  \
    row2a  = _mm_set_epi64( (__m64)y[0], (__m64)y[3] );  \
    row2b  = _mm_set_epi64( (__m64)y[2], (__m64)y[1] );  \
    _mm_store_si128( 0+ (__m128i *)y, row4a);  \
    _mm_store_si128( 1+ (__m128i *)y, row4b);  \
    row4a  = _mm_set_epi64( (__m64)y[2], (__m64)y[1] );  \
    row4b  = _mm_set_epi64( (__m64)y[0], (__m64)y[3] );  \
    							 \

  round(0);
  round(1);
  round(2);
  round(3);
  round(4);
  round(5);
  round(6);
  round(7);
  round(8);
  round(9);
  round(10);
  round(11);
  round(12);
  round(13);

  row1a = _mm_xor_si128(row3a,row1a);
  row1b = _mm_xor_si128(row3b,row1b);
  _mm_store_si128(  (__m128i *)m, row1a);
  state->h[0] ^= m[ 0]; 
  state->h[1] ^= m[ 1];    
  _mm_store_si128(  (__m128i *)m, row1b);
  state->h[2] ^= m[ 0]; 
  state->h[3] ^= m[ 1];    

  row2a = _mm_xor_si128(row4a,row2a);
  row2b = _mm_xor_si128(row4b,row2b);
  _mm_store_si128(  (__m128i *)m, row2a);
  state->h[4] ^= m[ 0];    
  state->h[5] ^= m[ 1];    
  _mm_store_si128(  (__m128i *)m, row2b);
  state->h[6] ^= m[ 0];    
  state->h[7] ^= m[ 1];    

  return 0;
}

void blake64_init( state * S ) {

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


void blake64_update( state * S, const u8 * data, u64 datalen ) {


  int left = (S->buflen >> 3); 
  int fill = 128 - left;

  if( left && ( ((datalen >> 3) & 0x7F) >= fill ) ) {
    memcpy( (void *) (S->buf + left), (void *) data, fill );
    S->t[0] += 1024;
    blake64_compress( S, S->buf );
    data += fill;
    datalen  -= (fill << 3);       
    left = 0;
  }

  while( datalen >= 1024 ) {  
    S->t[0] += 1024;
    blake64_compress( S, data );
    data += 128;
    datalen  -= 1024;
  }

  if( datalen > 0 ) {
    memcpy( (void *) (S->buf + left), (void *) data, ( datalen>>3 ) & 0x7F );
    S->buflen = (left<<3) + datalen;
  }
  else S->buflen=0;
}


void blake64_final( state * S, u8 * digest ) {

  u8 msglen[16], zo=0x01,oo=0x81;
  u64 lo=S->t[0] + S->buflen, hi = S->t[1];
  if ( lo < S->buflen ) hi++;
  U64TO8(  msglen + 0, hi );
  U64TO8(  msglen + 8, lo );

  if ( S->buflen == 888 ) { /* one padding byte */
    S->t[0] -= 8; 
    blake64_update( S, &oo, 8 );
  }
  else {
    if ( S->buflen < 888 ) { /* enough space to fill the block */
      if ( S->buflen == 0 ) S->nullt=1;
      S->t[0] -= 888 - S->buflen;
      blake64_update( S, padding, 888 - S->buflen );
    }
    else { /* NOT enough space, need 2 compressions */ 
      S->t[0] -= 1024 - S->buflen; 
      blake64_update( S, padding, 1024 - S->buflen );
      S->t[0] -= 888;
      blake64_update( S, padding+1, 888 );
      S->nullt = 1;
    }
    blake64_update( S, &zo, 8 );
    S->t[0] -= 8;
  }
  S->t[0] -= 128;
  blake64_update( S, msglen, 128 );    

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
  blake64_init( &S );
  blake64_update( &S, in, inlen*8 );
  blake64_final( &S, out );
  return 0;
}

/*
int main() {

  int i, v;
  u8 data[144], digest[64];
  u8 test1[]= {0x76, 0x5F, 0x70, 0x84, 0x54, 0x82, 0x26, 0xC3, 0xE6, 0xF4, 0x77, 0x9B, 0x95, 0x46, 0x61, 0xDF, \
	       0x49, 0xA2, 0x72, 0xE2, 0xBA, 0x16, 0x63, 0x5F, 0x17, 0xA3, 0x09, 0x37, 0x56, 0xAA, 0x93, 0x64, \
	       0x2A, 0x92, 0xE5, 0xBD, 0xDB, 0x21, 0xA3, 0x21, 0x8F, 0x72, 0xB7, 0xFD, 0x44, 0xE9, 0xFA, 0x19, \
	       0xF8, 0x6A, 0x86, 0x33, 0x4E, 0xBE, 0xDA, 0x0F, 0x4D, 0x42, 0x04, 0xBF, 0x3B, 0x6B, 0xED, 0x68};
  u8 test2[]= {0xEA, 0xB7, 0x30, 0x28, 0x04, 0x28, 0x21, 0x05, 0x71, 0xF3, 0xF8, 0xDE, 0xE6, 0x78, 0xA9, 0xB1, \
	       0xBB, 0xEF, 0x58, 0xDF, 0x55, 0x47, 0x12, 0x65, 0xB7, 0x1E, 0x26, 0x2B, 0x8E, 0xFF, 0xBA, 0x25, \
	       0x33, 0xC1, 0x53, 0x17, 0xC3, 0xE9, 0xF8, 0x97, 0xB2, 0x69, 0xED, 0x41, 0x46, 0xAE, 0xD0, 0xF3, \
	       0xA2, 0x98, 0x27, 0x06, 0x00, 0x55, 0xCA, 0x14, 0x65, 0x27, 0x53, 0xEF, 0xE2, 0x0A, 0x91, 0x3E};

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
*/
