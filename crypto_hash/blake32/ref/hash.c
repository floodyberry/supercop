#include <string.h>
#include <stdio.h>

#define ROUNDS32 10
#define SUCCESS 0
#define ERROR  -1

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
  int hashbitlen;  /* length of the hash value (bits) */
  int datalen;     /* amount of remaining data to hash (bits) */
  int init;        /* set to 1 when initialized */
  int nullt;       /* Boolean value for special case \ell_i=0 */
  u32 h32[8];         /* current chain value (initialized to the IV) */
  u32 t32[2];         /* number of bits hashed so far */
  u8 data32[64];     /* remaining data to hash (less than a block) */
  u32 salt32[4];      /* salt (null by default) */
} hashstate;


static  int blake32_compress( hashstate * state, const u8 * datablock );
int blake32_init( hashstate * state );
int blake32_update( hashstate * state, const u8 * data, u64 databitlen );
int blake32_final( hashstate * state, u8 * hashval );


static const unsigned char sigma[][16] = {
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
    {  9,  0,  5,  7,  2,  4, 10, 15, 14,  1, 11, 12,  6,  8,  3, 13 } ,
    {  2, 12,  6, 10,  0, 11,  8,  3,  4, 13,  7,  5, 15, 14,  1,  9 } ,
    { 12,  5,  1, 15, 14, 13,  4, 10,  0,  7,  6,  3,  9,  2,  8, 11 } ,
    { 13, 11,  7, 14, 12,  1,  3,  9,  5,  0, 15,  4,  8,  6,  2, 10 } ,
    {  6, 15, 14,  9, 11,  3,  0,  8, 12,  2, 13,  7,  1,  4, 10,  5 } ,
    { 10,  2,  8,  4,  7,  6,  1,  5, 15, 11,  9, 14,  3, 12, 13 , 0 }  
  };

static const u32 c32[16] = {
    0x243F6A88, 0x85A308D3,
    0x13198A2E, 0x03707344,
    0xA4093822, 0x299F31D0,
    0x082EFA98, 0xEC4E6C89,
    0x452821E6, 0x38D01377,
    0xBE5466CF, 0x34E90C6C,
    0xC0AC29B7, 0xC97C50DD,
    0x3F84D5B5, 0xB5470917 
};

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

static const u32 IV32[8]={
  0x6A09E667, 0xBB67AE85,
  0x3C6EF372, 0xA54FF53A,
  0x510E527F, 0x9B05688C,
  0x1F83D9AB, 0x5BE0CD19
};


int crypto_hash_blake32_ref( unsigned char *out, const unsigned char *in, unsigned long long inlen ) {

  int ret;
  hashstate state;
  
  ret = blake32_init( &state );
  if ( ret != SUCCESS ) return ret;

  /* inlen in BYTES, update function needs BITS (adapt later...) */
  ret = blake32_update( &state, in, inlen*8 );
  if ( ret != SUCCESS ) return ret;

  ret = blake32_final( &state, out );

  return ret;
}


static  int blake32_compress( hashstate * state, const u8 * datablock ) {

#define ROT32(x,n) (((x)<<(32-n))|( (x)>>(n)))
#define ADD32(x,y)   ((u32)((x) + (y)))
#define XOR32(x,y)    ((u32)((x) ^ (y)))

#define G32(a,b,c,d,i) \
  do {\
    v[a] = XOR32(m[sigma[round][i]], c32[sigma[round][i+1]])+ADD32(v[a],v[b]);\
    v[d] = ROT32(XOR32(v[d],v[a]),16);\
    v[c] = ADD32(v[c],v[d]);\
    v[b] = ROT32(XOR32(v[b],v[c]),12);\
    v[a] = XOR32(m[sigma[round][i+1]], c32[sigma[round][i]])+ADD32(v[a],v[b]); \
    v[d] = ROT32(XOR32(v[d],v[a]), 8);\
    v[c] = ADD32(v[c],v[d]);\
    v[b] = ROT32(XOR32(v[b],v[c]), 7);\
  } while (0)

  u32 v[16];
  u32 m[16];
  int round;

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

  /* initialization */
  v[ 0] = state->h32[0];
  v[ 1] = state->h32[1];
  v[ 2] = state->h32[2];
  v[ 3] = state->h32[3];
  v[ 4] = state->h32[4];
  v[ 5] = state->h32[5];
  v[ 6] = state->h32[6];
  v[ 7] = state->h32[7];
  v[ 8] = state->salt32[0];
  v[ 8] ^= 0x243F6A88;
  v[ 9] = state->salt32[1];
  v[ 9] ^= 0x85A308D3;
  v[10] = state->salt32[2];
  v[10] ^= 0x13198A2E;
  v[11] = state->salt32[3];
  v[11] ^= 0x03707344;
  v[12] =  0xA4093822;
  v[13] =  0x299F31D0;
  v[14] =  0x082EFA98;
  v[15] =  0xEC4E6C89;
  if (state->nullt == 0) { 
    v[12] ^= state->t32[0];
    v[13] ^= state->t32[0];
    v[14] ^= state->t32[1];
    v[15] ^= state->t32[1];
  }

  for(round=0; round<ROUNDS32; ++round) {

    G32( 0, 4, 8,12, 0);
    G32( 1, 5, 9,13, 2);
    G32( 2, 6,10,14, 4);
    G32( 3, 7,11,15, 6);

    G32( 3, 4, 9,14,14);   
    G32( 2, 7, 8,13,12);
    G32( 0, 5,10,15, 8);
    G32( 1, 6,11,12,10);
  }

  state->h32[0] ^= v[ 0]; 
  state->h32[1] ^= v[ 1];    
  state->h32[2] ^= v[ 2];    
  state->h32[3] ^= v[ 3];    
  state->h32[4] ^= v[ 4];    
  state->h32[5] ^= v[ 5];    
  state->h32[6] ^= v[ 6];    
  state->h32[7] ^= v[ 7];
  state->h32[0] ^= v[ 8]; 
  state->h32[1] ^= v[ 9];    
  state->h32[2] ^= v[10];    
  state->h32[3] ^= v[11];    
  state->h32[4] ^= v[12];    
  state->h32[5] ^= v[13];    
  state->h32[6] ^= v[14];    
  state->h32[7] ^= v[15];
  state->h32[0] ^= state->salt32[0];
  state->h32[1] ^= state->salt32[1];    
  state->h32[2] ^= state->salt32[2];    
  state->h32[3] ^= state->salt32[3];    
  state->h32[4] ^= state->salt32[0];    
  state->h32[5] ^= state->salt32[1];    
  state->h32[6] ^= state->salt32[2];    
  state->h32[7] ^= state->salt32[3];      

  return SUCCESS;
}


int blake32_init( hashstate * state ) {

  int i;

  memcpy( state->h32, IV32, sizeof(IV32) );

  
  for(i=0; i<64; ++i)
    state->data32[i] = 0;

  state->t32[0] = 0;
  state->t32[1] = 0;  
  state->salt32[0] = 0;
  state->salt32[1] = 0;
  state->salt32[2] = 0;
  state->salt32[3] = 0;
  state->hashbitlen = 256;
  state->datalen = 0;
  state->init = 1;
  state->nullt = 0;

  return SUCCESS;
}

int blake32_update( hashstate * state, const u8 * data, u64 databitlen ) {


  int fill;
  int left;


  if ( databitlen == 0 )
    return SUCCESS;

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

  return SUCCESS;
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
  
  return SUCCESS;
}






/*  uncomment below for test vectors */
/*
int main() {

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
