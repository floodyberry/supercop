#include <string.h>
#include <stdio.h>
#include <emmintrin.h>

#define ROUNDS64 14

typedef unsigned int u32;
typedef unsigned long long u64;
typedef unsigned char u8; 


#define U8TO32_BE(p) \
  (((u32)((p)[0]) << 24) | \
   ((u32)((p)[1]) << 16) | \
   ((u32)((p)[2]) <<  8) | \
   ((u32)((p)[3])      ))

#define U8TO64_BE(p) \
  (((u64)U8TO32_BE(p) << 32) | (u64)U8TO32_BE((p) + 4))

#define U32TO8_BE(p, v) \
  do { \
    (p)[0] = (u8)((v) >> 24);  \
    (p)[1] = (u8)((v) >> 16); \
    (p)[2] = (u8)((v) >>  8); \
    (p)[3] = (u8)((v)      ); \
  } while (0)

#define U64TO8_BE(p, v) \
  do { \
    U32TO8_BE((p),     (u32)((v) >> 32));	\
    U32TO8_BE((p) + 4, (u32)((v)      ));	\
  } while (0)


typedef struct  { 
  int datalen;     /* amount of remaining data to hash (bits) */
  int nullt;       /* Boolean value for special case \ell_i=0 */
  u64 h64[8];      /* current chain value (initialized to the IV) */
  u64 t64[2];      /* number of bits hashed so far */
  u8 data64[128];  /* remaining data to hash (less than a block) */
} hashstate;


static  int blake64_compress( hashstate * state, const u8 * datablock );
int blake64_init( hashstate * state );
int blake64_update( hashstate * state, const u8 * data, u64 databitlen );
int blake64_final( hashstate * state, u8 * hashval );



static const u8 padding[129] =
  {
    0x80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

static const u64 IV64[8]={
  0x6A09E667F3BCC908ULL, 0xBB67AE8584CAA73BULL,
  0x3C6EF372FE94F82BULL, 0xA54FF53A5F1D36F1ULL,
  0x510E527FADE682D1ULL, 0x9B05688C2B3E6C1FULL,
  0x1F83D9ABFB41BD6BULL, 0x5BE0CD19137E2179ULL
};


int crypto_hash_blake64_sse2( unsigned char *out, const unsigned char *in, unsigned long long inlen ) {

  hashstate state;
  blake64_init( &state );
  blake64_update( &state, in, inlen*8 );

  return blake64_final( &state, out );
}


static  int blake64_compress( hashstate * state, const u8 * datablock ) {

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
  m[ 0] = U8TO64_BE(datablock +  0);
  m[ 1] = U8TO64_BE(datablock +  8);
  m[ 2] = U8TO64_BE(datablock + 16);
  m[ 3] = U8TO64_BE(datablock + 24);
  m[ 4] = U8TO64_BE(datablock + 32);
  m[ 5] = U8TO64_BE(datablock + 40);
  m[ 6] = U8TO64_BE(datablock + 48);
  m[ 7] = U8TO64_BE(datablock + 56);
  m[ 8] = U8TO64_BE(datablock + 64);
  m[ 9] = U8TO64_BE(datablock + 72);
  m[10] = U8TO64_BE(datablock + 80);
  m[11] = U8TO64_BE(datablock + 88);
  m[12] = U8TO64_BE(datablock + 96);
  m[13] = U8TO64_BE(datablock +104);
  m[14] = U8TO64_BE(datablock +112);
  m[15] = U8TO64_BE(datablock +120);

  row1b = _mm_set_epi64((__m64)state->h64[3],(__m64)state->h64[2]);
  row1a = _mm_set_epi64((__m64)state->h64[1],(__m64)state->h64[0]);
  row2b = _mm_set_epi64((__m64)state->h64[7],(__m64)state->h64[6]);
  row2a = _mm_set_epi64((__m64)state->h64[5],(__m64)state->h64[4]);
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
    row4b = _mm_set_epi64((__m64)(0x3F84D5B5B5470917ULL^state->t64[1]),
			  (__m64)(0xC0AC29B7C97C50DDULL^state->t64[1]));
    row4a = _mm_set_epi64((__m64)(0xBE5466CF34E90C6CULL^state->t64[0]),
			  (__m64)(0x452821E638D01377ULL^state->t64[0]));
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
  state->h64[0] ^= m[ 0]; 
  state->h64[1] ^= m[ 1];    
  _mm_store_si128(  (__m128i *)m, row1b);
  state->h64[2] ^= m[ 0]; 
  state->h64[3] ^= m[ 1];    

  row2a = _mm_xor_si128(row4a,row2a);
  row2b = _mm_xor_si128(row4b,row2b);
  _mm_store_si128(  (__m128i *)m, row2a);
  state->h64[4] ^= m[ 0];    
  state->h64[5] ^= m[ 1];    
  _mm_store_si128(  (__m128i *)m, row2b);
  state->h64[6] ^= m[ 0];    
  state->h64[7] ^= m[ 1];    

  return 0;
}


int blake64_init( hashstate * state ) {

  int i;

  memcpy( state->h64, IV64, sizeof(IV64) );

  for(i=0; i<64; ++i)
    state->data64[i] = 0;

  state->t64[0] = 0;
  state->t64[1] = 0;    
  state->datalen = 0;
  state->nullt = 0;

  return 0;
}

int blake64_update( hashstate * state, const u8 * data, u64 databitlen ) {

  int fill;
  int left; /* to handle data inputs of up to 2^64-1 bits */

  if ( databitlen == 0 )
    return 0;

  left = (state->datalen >> 3) & 0x7F; 
  fill = 128 - left;

  /* compress remaining data filled with new bits */
  if( left && ( ((databitlen >> 3) & 0x7F) >= fill ) ) {
    memcpy( (void *) (state->data64 + left),
	    (void *) data, fill );

    /* update counter  */
   state->t64[0] += 1024;

   blake64_compress( state, state->data64 );
   data += fill;
   databitlen  -= (fill << 3);       
    left = 0;
  }

  /* compress data until enough for a block */
  while( databitlen >= 1024 ) {
  
   state->t64[0] += 1024;
   blake64_compress( state, data );
    data += 128;
    databitlen  -= 1024;
  }

  if( databitlen > 0 ) {
    memcpy( (void *) (state->data64 + left),
	    (void *) data, ( databitlen>>3 ) & 0x7F );
    state->datalen = (left<<3) + databitlen;
  }
  else
    state->datalen=0;

  return 0;
}

int blake64_final( hashstate * state, u8 * hashval ) {

  unsigned char msglen[16];
  u8 zo=0x01,oo=0x81;

  /* copy nb. bits hash in total as a 128-bit BE word */
  u64 low, high;
  low  = state->t64[0] + state->datalen;
  high = state->t64[1];
  if ( low < state->datalen )
    high++;
  U64TO8_BE(  msglen + 0, high );
  U64TO8_BE(  msglen + 8, low  );


  if ( state->datalen == 888 ) {
    /* special case of one padding byte */
    state->t64[0] -= 8; 
    blake64_update( state, &oo, 8 );
  }
  else {
    if ( state->datalen < 888 ) {
      /* enough space to fill the block */
      state->t64[0] -= 888 - state->datalen;
      blake64_update( state, padding, 888 - state->datalen );
      /* use t=0 if no remaining data */
      if ( state->datalen == 0 ) 
	state->nullt=1;
    }
    else { 
      /* NOT enough space, need 2 compressions */
      state->t64[0] -= 1024 - state->datalen; 
      blake64_update( state, padding, 1024 - state->datalen );
      state->t64[0] -= 888;
      blake64_update( state, padding+1, 888 );  /* padd with zeros */
      state->nullt = 1; /* raise flag to set t=0 at the next compress */
    }
    blake64_update( state, &zo, 8 );
    state->t64[0] -= 8;
  }
  state->t64[0] -= 128;
  blake64_update( state, msglen, 128 );    

  U64TO8_BE( hashval + 0, state->h64[0]);
  U64TO8_BE( hashval + 8, state->h64[1]);
  U64TO8_BE( hashval +16, state->h64[2]);
  U64TO8_BE( hashval +24, state->h64[3]);
  U64TO8_BE( hashval +32, state->h64[4]);
  U64TO8_BE( hashval +40, state->h64[5]);
  U64TO8_BE( hashval +48, state->h64[6]);
  U64TO8_BE( hashval +56, state->h64[7]);
  
  return 0;
}



/*  uncomment below for test vectors */
/*
int main() {
  int i, v;
  u8 data[144], hash[64];
  u8 test1[]= {0x76, 0x5F, 0x70, 0x84, 0x54, 0x82, 0x26, 0xC3, 0xE6, 0xF4, 0x77, 0x9B, 0x95, 0x46, 0x61, 0xDF, \
	       0x49, 0xA2, 0x72, 0xE2, 0xBA, 0x16, 0x63, 0x5F, 0x17, 0xA3, 0x09, 0x37, 0x56, 0xAA, 0x93, 0x64, \
	       0x2A, 0x92, 0xE5, 0xBD, 0xDB, 0x21, 0xA3, 0x21, 0x8F, 0x72, 0xB7, 0xFD, 0x44, 0xE9, 0xFA, 0x19, \
	       0xF8, 0x6A, 0x86, 0x33, 0x4E, 0xBE, 0xDA, 0x0F, 0x4D, 0x42, 0x04, 0xBF, 0x3B, 0x6B, 0xED, 0x68};
  u8 test2[]= {0xEA, 0xB7, 0x30, 0x28, 0x04, 0x28, 0x21, 0x05, 0x71, 0xF3, 0xF8, 0xDE, 0xE6, 0x78, 0xA9, 0xB1, \
	       0xBB, 0xEF, 0x58, 0xDF, 0x55, 0x47, 0x12, 0x65, 0xB7, 0x1E, 0x26, 0x2B, 0x8E, 0xFF, 0xBA, 0x25, \
	       0x33, 0xC1, 0x53, 0x17, 0xC3, 0xE9, 0xF8, 0x97, 0xB2, 0x69, 0xED, 0x41, 0x46, 0xAE, 0xD0, 0xF3, \
	       0xA2, 0x98, 0x27, 0x06, 0x00, 0x55, 0xCA, 0x14, 0x65, 0x27, 0x53, 0xEF, 0xE2, 0x0A, 0x91, 0x3E};

  for(i=0; i<144; ++i)
    data[i]=0;  

  crypto_hash_blake64_sse2( hash, data, 1 );    
  v=0;
  for(i=0; i<64; ++i) {
    printf("%02X", hash[i]);
    if ( hash[i] != test1[i]) v=1;
  }
  if (v)
    printf("\nerror\n");
  else
    printf("\nok\n");

  crypto_hash_blake64_sse2( hash, data, 144 );    
  v=0;
  for(i=0; i<64; ++i) {
    printf("%02X", hash[i]);
    if ( hash[i] != test2[i]) v=1;
  }
  if (v)
    printf("\nerror\n");
  else
    printf("\nok\n");

  return 0;
}
*/
