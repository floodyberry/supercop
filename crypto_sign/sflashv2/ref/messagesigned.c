#include <memory.h>
#include <stdio.h>
#include <stdlib.h>

#include "lib_flash.h"
#include "sizes.h"

int crypto_sign_open(unsigned char m[],
		  unsigned long long *mlen,
		  const unsigned char sm[],
		  const unsigned long long smlen,
		  const unsigned char pk[PUBLICKEY_BYTES]
)
{
  Flash_Complete_Key CK = (Flash_Complete_Key) malloc(sizeof(struct Flash_Complete_Key));
  unsigned char signature[SIGNATURE_BYTES];
  if (smlen<SIGNATURE_BYTES)
    {
     free(CK);
      return -100;
    }
  
  *mlen=smlen-SIGNATURE_BYTES;
  

  Flash_load2_public_key(pk,CK);
  memcpy(signature,sm,SIGNATURE_BYTES);

  memcpy(m,sm+SIGNATURE_BYTES,*mlen);

  if (Flash_verify2(m,8*(*mlen),signature,CK))
    {
     free(CK);
      return 0;
    }
  else
    {
     free(CK);
      return -100;
    }
  
}
