#include "crypto_auth.h"
#include "crypto_uint64.h"
#include "crypto_uint32.h"
#include "crypto_uint8.h"

typedef crypto_uint64 u64;
typedef crypto_uint32 u32;
typedef crypto_uint8   u8;

#define ROTL(x,b) (u64)( ((x) << (b)) | ( (x) >> (64 - (b))) )

#define U32TO8_LE(p, v)         \
    (p)[0] = (u8)((v)      ); (p)[1] = (u8)((v) >>  8); \
    (p)[2] = (u8)((v) >> 16); (p)[3] = (u8)((v) >> 24);

#define U64TO8_LE(p, v)         \
    U32TO8_LE((p),     (u32)((v)      ));   \
    U32TO8_LE((p) + 4, (u32)((v) >> 32));

#define SIPROUND            \
  do {              \
    x0 += x1; x1=ROTL(x1,13); x1 ^= x0; x0=ROTL(x0,32); \
    x2 += x3; x3=ROTL(x3,16); x3 ^= x2;     \
    x0 += x3; x3=ROTL(x3,21); x3 ^= x0;     \
    x2 += x1; x1=ROTL(x1,17); x1 ^= x2; x2=ROTL(x2,32); \
  } while(0)


int crypto_auth( unsigned char *out, const unsigned char *in, unsigned long long inlen, const unsigned char *k )
{
  u64 h;
  /* "somepseudorandomlygeneratedbytes" */
  u64 x0 = 0x736f6d6570736575ULL;
  u64 x1 = 0x646f72616e646f6dULL;
  u64 x2 = 0x6c7967656e657261ULL;
  u64 x3 = 0x7465646279746573ULL;
  u64 b;
  /* little-endian only */
  u64 k0 = ( ( u64 * )k )[0];
  u64 k1 = ( ( u64 * )k )[1];
  union
  {
    const u8 *v8;
    u32     *v32;
    u64     *v64;
  } m;
  m.v8 = ( const u8 * )in;
  const u64 *end = m.v64 + ( ( inlen >> 3 ) );
  const int left = inlen & 7;
  b = ( ( u64 )inlen ) << 56;
  x3 ^= k1;
  x2 ^= k0;
  x1 ^= k1;
  x0 ^= k0;

  for( ; m.v64 < end; m.v64++ )
  {
    x3 ^= m.v64[0];
    SIPROUND;
    SIPROUND;
    x0 ^= m.v64[0];
  }

  switch( left )
  {
  case 7: b |= ( ( u64 )m.v8[ 6] )  << 48;

  case 6: b |= ( ( u64 )m.v8[ 5] )  << 40;

  case 5: b |= ( ( u64 )m.v8[ 4] )  << 32;

  case 4: b |= ( ( u64 )m.v32[0] ); break;

  case 3: b |= ( ( u64 )m.v8[ 2] )  << 16;

  case 2: b |= ( ( u64 )m.v8[ 1] )  <<  8;

  case 1: b |= ( ( u64 )m.v8[ 0] ); break;

  case 0: break;
  }

  x3 ^= b;
  SIPROUND;
  SIPROUND;
  x0 ^= b;
  x2 ^= 0xff;
  SIPROUND;
  SIPROUND;
  SIPROUND;
  SIPROUND;
  /* make non-portable to be faster on short data */
  ( ( u64 * )out )[0] = x0 ^ x1 ^ x2 ^ x3;
  return 0;
}

