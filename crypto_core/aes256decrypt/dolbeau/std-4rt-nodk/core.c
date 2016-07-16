/*
  core.c version $Date: 2014/12/14 13:24:18 $
  aes256decrypt
  Romain Dolbeau
  Public Domain
*/

#include "crypto_core.h"
#include "stdaes-common.h"

static inline void aes256_4rtnodk_decrypt(const unsigned int *aes_edrk, const unsigned int *input, unsigned int *output)
{
  unsigned int X0, X1, X2, X3, Y0, Y1, Y2, Y3;
  unsigned int i = 56, j = 0;

  X0 = (input[j++] ^ aes_edrk[i++]);
  X1 = (input[j++] ^ aes_edrk[i++]);
  X2 = (input[j++] ^ aes_edrk[i++]);
  X3 = (input[j++] ^ aes_edrk[i++]);

  for (i = 52 ; i > 0 ; i -= 4) {
    
    AES_ROUND4NODK_DEC(aes_edrk, i, Y0, Y1, Y2, Y3, X0, X1, X2, X3 );

    X0=Y0;
    X1=Y1;
    X2=Y2;
    X3=Y3;
  }
  /* last round */
#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
  Y0 = aes_edrk[  i] ^
    ( RSb[( X0 >> 24) &0xFF ] << 24) ^
    ( RSb[( X3 >> 16) &0xFF ] << 16) ^
    ( RSb[( X2 >>  8) &0xFF ] <<  8) ^
    ( RSb[( X1      ) &0xFF ]      );
  
  Y1 = aes_edrk[1+i] ^
    ( RSb[( X1 >> 24 ) &0xFF ] << 24) ^
    ( RSb[( X0 >> 16 ) &0xFF ] << 16) ^
    ( RSb[( X3 >>  8 ) &0xFF ] <<  8) ^
    ( RSb[( X2       ) &0xFF ]      );
  
  Y2 = aes_edrk[2+i] ^
    ( RSb[( X2 >> 24 ) &0xFF ] << 24) ^
    ( RSb[( X1 >> 16 ) &0xFF ] << 16) ^
    ( RSb[( X0 >>  8 ) &0xFF ] <<  8) ^
    ( RSb[( X3       ) &0xFF ]      );
  
  Y3 = aes_edrk[3+i] ^
    ( RSb[( X3 >> 24 ) &0xFF ] << 24) ^
    ( RSb[( X2 >> 16 ) &0xFF ] << 16) ^
    ( RSb[( X1 >>  8 ) &0xFF ] <<  8) ^
    ( RSb[( X0       ) &0xFF ]      );
#else
  Y0 = aes_edrk[  i] ^
    ( RSb[( X0      ) &0xFF ]      ) ^
    ( RSb[( X3 >>  8) &0xFF ] <<  8) ^
    ( RSb[( X2 >> 16) &0xFF ] << 16) ^
    ( RSb[( X1 >> 24) &0xFF ] << 24);
  
  Y1 = aes_edrk[1+i] ^
    ( RSb[( X1      ) &0xFF ]      ) ^
    ( RSb[( X0 >>  8) &0xFF ] <<  8) ^
    ( RSb[( X3 >> 16) &0xFF ] << 16) ^
    ( RSb[( X2 >> 24) &0xFF ] << 24);
  
  Y2 = aes_edrk[2+i] ^
    ( RSb[( X2      ) &0xFF ]      ) ^
    ( RSb[( X1 >>  8) &0xFF ] <<  8) ^
    ( RSb[( X0 >> 16) &0xFF ] << 16) ^
    ( RSb[( X3 >> 24) &0xFF ] << 24);
  
  Y3 = aes_edrk[3+i] ^
    ( RSb[( X3      ) &0xFF ]      ) ^
    ( RSb[( X2 >>  8) &0xFF ] <<  8) ^
    ( RSb[( X1 >> 16) &0xFF ] << 16) ^
    ( RSb[( X0 >> 24) &0xFF ] << 24);
#endif

  output[0] = (Y0);
  output[1] = (Y1);
  output[2] = (Y2);
  output[3] = (Y3);
}

int crypto_core(
        unsigned char *out,
  const unsigned char *in,
  const unsigned char *k,
  const unsigned char *c
) {
  unsigned int rkeys[60];
  aes256_setkey_encrypt((const unsigned int*)k,rkeys);
  aes256_4rtnodk_decrypt(rkeys, (const unsigned int*)in, (unsigned int*)out);
  return 0;
}
