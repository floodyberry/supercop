#include "crypto_auth.h"

static int crypto_verify_8( const unsigned char *x, const unsigned char *y )
{
  unsigned int differentbits = 0;
#define F(i) differentbits |= x[i] ^ y[i];
  F( 0 )
  F( 1 )
  F( 2 )
  F( 3 )
  F( 4 )
  F( 5 )
  F( 6 )
  F( 7 )
  return ( 1 & ( ( differentbits - 1 ) >> 8 ) ) - 1;
}


int crypto_auth_verify( const unsigned char *h, const unsigned char *in, unsigned long long inlen, const unsigned char *k )
{
  unsigned char correct[8];
  crypto_auth( correct, in, inlen, k );
  return crypto_verify_8( h, correct );
}
