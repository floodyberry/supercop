#include <memory.h>
#include <stdio.h>
#include <stdlib.h>

#include "lib_flash.h"
#include "sizes.h"

int crypto_sign( 
		  unsigned char sm[],
		  unsigned long long *smlen,
		  const unsigned char m[],
		  const unsigned long long mlen,
		  const unsigned char sk[SECRETKEY_BYTES]

)
{
  unsigned char signature[37];
  Flash_Complete_Key CK = (Flash_Complete_Key) malloc(sizeof(struct Flash_Complete_Key));
  
  *smlen=SIGNATURE_BYTES+mlen;
  
  Flash_load2_private_key(sk,CK);
  
  Flash_sign2(signature,m,8*mlen,CK);
  memcpy(sm+SIGNATURE_BYTES,m,mlen);

  memcpy(sm,signature,SIGNATURE_BYTES);

  free(CK);
  return 0;
}
