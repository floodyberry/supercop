#include <memory.h>
#include <stdio.h>
#include <stdlib.h>

#include "lib_flash.h"
#include "sizes.h"

int crypto_sign_keypair(unsigned char *pk,unsigned char *sk)
{
  unsigned char *seed;
  int length;

  //FILE *RAND;
  //RAND = fopen("sizes.h","rb");
  

  Flash_Complete_Key CK = (Flash_Complete_Key) malloc(sizeof(struct Flash_Complete_Key));
  
  
  //fseek(RAND,0,SEEK_END);
  //length = ftell(RAND)>55 ? 55 : ftell(RAND);
  //seed = (unsigned char *) malloc(length*sizeof(unsigned char));
  //fseek(RAND,0,SEEK_SET);
  //fread(seed,1,length,RAND);
  //fclose(RAND);
  
  //init_rando(seed, length);
  
  Flash_build_complete_key(CK);			
  
  Flash_store2_public_key (pk,CK);

  Flash_store2_private_key(sk,CK);

  free(CK);
  
  return 0;
  
}
