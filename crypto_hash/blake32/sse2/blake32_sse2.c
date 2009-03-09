#include <string.h>
#include <stdio.h>
#include <emmintrin.h>

#define ROUNDS32 10

typedef unsigned int u32;
typedef unsigned long long u64;
typedef unsigned char u8; 

#define U8TO32_BE(p) \
  (((u32)((p)[0]) << 24) | \
   ((u32)((p)[1]) << 16) | \
   ((u32)((p)[2]) <<  8) | \
   ((u32)((p)[3])      ))

#define U32TO8_BE(p, v) \
  do { \
    (p)[0] = (u8)((v) >> 24);  \
    (p)[1] = (u8)((v) >> 16); \
    (p)[2] = (u8)((v) >>  8); \
    (p)[3] = (u8)((v)      ); \
  } while (0)


typedef struct  { 
  int datalen;     /* amount of remaining data to hash (bits) */
  int nullt;       /* Boolean value for special case \ell_i=0 */
  u32 h32[8];         /* current chain value (initialized to the IV) */
  u32 t32[2];         /* number of bits hashed so far */
  u8 data32[64];     /* remaining data to hash (less than a block) */
} hashstate;


static  int blake32_compress( hashstate * state, const u8 * datablock );
int blake32_init( hashstate * state );
int blake32_update( hashstate * state, const u8 * data, u64 databitlen );
int blake32_final( hashstate * state, u8 * hashval );


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




int crypto_hash_blake32_sse2( unsigned char *out, const unsigned char *in, unsigned long long inlen ) {


  hashstate state;
  
  blake32_init( &state );

  blake32_update( &state, in, inlen*8 );
  
  return blake32_final( &state, out );

}



static int blake32_compress( hashstate * state, const u8 * datablock ) {

  __m128i row1,row2,row3,row4;
  __m128i buf1,buf2;
  
  u32 m[16]; 
  int r;
  u64 t;

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
  };
  static const u32 z[16] = {
    0x243F6A88, 0x85A308D3, 0x13198A2E, 0x03707344,
    0xA4093822, 0x299F31D0, 0x082EFA98, 0xEC4E6C89,
    0x452821E6, 0x38D01377, 0xBE5466CF, 0x34E90C6C,
    0xC0AC29B7, 0xC97C50DD, 0x3F84D5B5, 0xB5470917 
  };

  /* get message */
  m[ 0] = U8TO32_BE(datablock + 0);
  m[ 1] = U8TO32_BE(datablock + 4);
  m[ 2] = U8TO32_BE(datablock + 8);
  m[ 3] = U8TO32_BE(datablock +12);
  m[ 4] = U8TO32_BE(datablock +16);
  m[ 5] = U8TO32_BE(datablock +20);
  m[ 6] = U8TO32_BE(datablock +24);
  m[ 7] = U8TO32_BE(datablock +28);
  m[ 8] = U8TO32_BE(datablock +32);
  m[ 9] = U8TO32_BE(datablock +36);
  m[10] = U8TO32_BE(datablock +40);
  m[11] = U8TO32_BE(datablock +44);
  m[12] = U8TO32_BE(datablock +48);
  m[13] = U8TO32_BE(datablock +52);
  m[14] = U8TO32_BE(datablock +56);
  m[15] = U8TO32_BE(datablock +60);

  row1 = _mm_set_epi32(state->h32[ 3], state->h32[ 2],
		       state->h32[ 1], state->h32[ 0]);
  row2 = _mm_set_epi32(state->h32[ 7], state->h32[ 6],
		       state->h32[ 5], state->h32[ 4]);
  row3 = _mm_set_epi32(0x03707344, 0x13198A2E, 0x85A308D3, 0x243F6A88);

  if (state->nullt) 
    row4 = _mm_set_epi32(0xEC4E6C89, 0x082EFA98, 0x299F31D0, 0xA409382A);
  else 
    row4 = _mm_set_epi32(0xEC4E6C89^state->t32[1], 0x082EFA98^state->t32[1],
			 0x299F31D0^state->t32[0], 0xA4093822^state->t32[0]);

#define round(r) \
        /*        column step          */ \
        buf1 = _mm_set_epi32(m[sig[r][ 6]], \
                            m[sig[r][ 4]], \
                            m[sig[r][ 2]], \
                            m[sig[r][ 0]]); \
        buf2  = _mm_set_epi32(z[sig[r][ 7]], \
                            z[sig[r][ 5]], \
                            z[sig[r][ 3]], \
                            z[sig[r][ 1]]); \
        buf1 = _mm_xor_si128( buf1, buf2); \
        row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); \
        buf1  = _mm_set_epi32(z[sig[r][ 6]], \
                            z[sig[r][ 4]], \
                            z[sig[r][ 2]], \
                            z[sig[r][ 0]]); \
        buf2 = _mm_set_epi32(m[sig[r][ 7]], \
                            m[sig[r][ 5]], \
                            m[sig[r][ 3]], \
                            m[sig[r][ 1]]); \
        row4 = _mm_xor_si128( row4, row1 ); \
        row4 = _mm_xor_si128(_mm_srli_epi32( row4, 16 ),_mm_slli_epi32( row4, 16 )); \
        row3 = _mm_add_epi32( row3, row4 );   \
        row2 = _mm_xor_si128( row2, row3 ); \
        buf1 = _mm_xor_si128( buf1, buf2); \
        row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); \
        row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1), row2 ); \
        row4 = _mm_xor_si128( row4, row1 ); \
        row4 = _mm_xor_si128(_mm_srli_epi32( row4,  8 ),_mm_slli_epi32( row4, 24 )); \
        row3 = _mm_add_epi32( row3, row4 );   \
        row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(2,1,0,3) ); \
        row2 = _mm_xor_si128( row2, row3 ); \
        row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); \
\
        row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); \
        row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(0,3,2,1) ); \
\
       /*       diagonal step         */ \
        buf1 = _mm_set_epi32(m[sig[r][14]], \
                            m[sig[r][12]], \
                            m[sig[r][10]], \
                            m[sig[r][ 8]]); \
        buf2  = _mm_set_epi32(z[sig[r][15]], \
                            z[sig[r][13]], \
                            z[sig[r][11]], \
                            z[sig[r][ 9]]); \
        buf1 = _mm_xor_si128( buf1, buf2); \
        row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); \
        buf1  = _mm_set_epi32(z[sig[r][14]], \
                            z[sig[r][12]], \
                            z[sig[r][10]], \
                            z[sig[r][ 8]]); \
        buf2 = _mm_set_epi32(m[sig[r][15]], \
                            m[sig[r][13]], \
                            m[sig[r][11]], \
                            m[sig[r][ 9]]); \
        row4 = _mm_xor_si128( row4, row1 ); \
        buf1 = _mm_xor_si128( buf1, buf2); \
        row4 = _mm_xor_si128(_mm_srli_epi32( row4, 16 ),_mm_slli_epi32( row4, 16 )); \
        row3 = _mm_add_epi32( row3, row4 );   \
        row2 = _mm_xor_si128( row2, row3 ); \
        row2 = _mm_xor_si128(_mm_srli_epi32( row2, 12 ),_mm_slli_epi32( row2, 20 )); \
        row1 = _mm_add_epi32( _mm_add_epi32( row1, buf1 ), row2 ); \
        row4 = _mm_xor_si128( row4, row1 ); \
        row4 = _mm_xor_si128(_mm_srli_epi32( row4,  8 ),_mm_slli_epi32( row4, 24 )); \
        row3 = _mm_add_epi32( row3, row4 );   \
        row4 = _mm_shuffle_epi32( row4, _MM_SHUFFLE(0,3,2,1) ); \
        row2 = _mm_xor_si128( row2, row3 ); \
        row2 = _mm_xor_si128(_mm_srli_epi32( row2,  7 ),_mm_slli_epi32( row2, 25 )); \
\
        row3 = _mm_shuffle_epi32( row3, _MM_SHUFFLE(1,0,3,2) ); \
        row2 = _mm_shuffle_epi32( row2, _MM_SHUFFLE(2,1,0,3) ); \
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

  _mm_store_si128( (__m128i *)m, _mm_xor_si128(row1,row3));
  state->h32[0] ^= m[ 0]; 
  state->h32[1] ^= m[ 1];    
  state->h32[2] ^= m[ 2];    
  state->h32[3] ^= m[ 3];
  _mm_store_si128( (__m128i *)m, _mm_xor_si128(row2,row4));
  state->h32[4] ^= m[ 0];    
  state->h32[5] ^= m[ 1];    
  state->h32[6] ^= m[ 2];    
  state->h32[7] ^= m[ 3];

  return 0;
}



int blake32_init( hashstate * state ) {

  int i;
  static const u32 IV32[8]={
    0x6A09E667, 0xBB67AE85,
    0x3C6EF372, 0xA54FF53A,
    0x510E527F, 0x9B05688C,
    0x1F83D9AB, 0x5BE0CD19
  };

  memcpy( state->h32, IV32, sizeof(IV32) );
  
  for(i=0; i<64; ++i)
    state->data32[i] = 0;
  state->t32[0] = 0;
  state->t32[1] = 0;  
  state->datalen = 0;
  state->nullt = 0;

  return 0;
}

int blake32_update( hashstate * state, const u8 * data, u64 databitlen ) {

  int fill;
  int left;


  if ( databitlen == 0 )
    return 0;

  left = (state->datalen >> 3); 
  fill = 64 - left;
    
  /* compress remaining data filled with new bits */
  if( left && ( ((databitlen >> 3) & 0x3F) >= fill ) ) {
    memcpy( (void *) (state->data32 + left),
	    (void *) data, fill );

    /* update counter */
    state->t32[0] += 512;
    if (state->t32[0] == 0)
      state->t32[1]++;
      
    blake32_compress( state, state->data32 );
    data += fill;
    databitlen  -= (fill << 3);       
    left = 0;
  }

  /* compress data until enough for a block */
  while( databitlen >= 512 ) {

    state->t32[0] += 512;
    if (state->t32[0] == 0)
      state->t32[1]++;
    blake32_compress( state, data );
    data += 64;
    databitlen  -= 512;
  }
  
  if( databitlen > 0 ) {
    memcpy( (void *) (state->data32 + left),
	    (void *) data, databitlen>>3 );
    state->datalen = (left<<3) + databitlen;
  }
  else
    state->datalen=0;

  return 0;
}

int blake32_final( hashstate * state, u8 * hashval ) {
  
  unsigned char msglen[8];
  u8 zo=0x01,oo=0x81;

  /* copy nb. bits hash in total as a 64-bit BE word */
  u32 low, high;
  low  = state->t32[0] + state->datalen;
  high = state->t32[1];
  if ( low < state->datalen )
    high++;
  U32TO8_BE(  msglen + 0, high );
  U32TO8_BE(  msglen + 4, low  );

  if ( state->datalen == 440 ) {
    /* special case of one padding byte */
    state->t32[0] -= 8;
    blake32_update( state, &oo, 8 );
  }
  else {
    if ( state->datalen < 440 ) {
      /* enough space to fill the block  */
      state->t32[0] -= 440 - state->datalen;
      blake32_update( state, padding, 440 - state->datalen );
      /* to use t=0 if no remaining data */
      if ( state->datalen == 0 ) 
	state->nullt=1;
    }
    else {
      /* NOT enough space, need 2 compressions */
      state->t32[0] -= 512 - state->datalen; 
      blake32_update( state, padding, 512 - state->datalen );
      state->t32[0] -= 440;
      blake32_update( state, padding+1, 440 );  /* padd with zeroes */
      state->nullt = 1; /* raise flag to set t=0 at the next compress */
    }
    blake32_update( state, &zo, 8 );
    state->t32[0] -= 8;
  }
  state->t32[0] -= 64;
  blake32_update( state, msglen, 64 );    

  U32TO8_BE( hashval + 0, state->h32[0]);
  U32TO8_BE( hashval + 4, state->h32[1]);
  U32TO8_BE( hashval + 8, state->h32[2]);
  U32TO8_BE( hashval +12, state->h32[3]);
  U32TO8_BE( hashval +16, state->h32[4]);
  U32TO8_BE( hashval +20, state->h32[5]);
  U32TO8_BE( hashval +24, state->h32[6]);
  U32TO8_BE( hashval +28, state->h32[7]);
  
  return 0;
}


/*  uncomment below for test vectors */
/*
int main( int ac, char ** av) {

  int i, v;
  u8 data[72], hash[32];
  u8 test1[]= {0xD1, 0xE3, 0x9B, 0x45, 0x7D, 0x22, 0x50, 0xB4, 0xF5, 0xB1, 0x52, 0xE7, 0x41, 0x57, 0xFB, 0xA4, \
	       0xC1, 0xB4, 0x23, 0xB8, 0x75, 0x49, 0x10, 0x6B, 0x07, 0xFD, 0x3A, 0x3E, 0x7F, 0x4A, 0xEB, 0x28};
  u8 test2[]= {0x8A, 0x63, 0x84, 0x88, 0xC3, 0x18, 0xC5, 0xA8, 0x22, 0x2A, 0x18, 0x13, 0x17, 0x4C, 0x36, 0xB4, \
	       0xBB, 0x66, 0xE4, 0x5B, 0x09, 0xAF, 0xDD, 0xFD, 0x7F, 0x2B, 0x2F, 0xE3, 0x16, 0x1B, 0x7A, 0x6D};

  for(i=0; i<72; ++i)
    data[i]=0;  

  crypto_hash_blake32_ref( hash, data, 1 );    
  v=0;
  for(i=0; i<32; ++i) {
    printf("%02X", hash[i]);
    if ( hash[i] != test1[i]) v=1;
  }
  if (v)
    printf("\nerror\n");
  else
    printf("\nok\n");

  crypto_hash_blake32_ref( hash, data, 72 );    
  v=0;
  for(i=0; i<32; ++i) {
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
