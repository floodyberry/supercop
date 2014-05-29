#include <stdio.h>
#include <stdint.h>
#include <string.h>

#include "api.h"

inline void dump_hex (char *label, uint8_t *c, int len)
{
  int i;

  printf("%s: \n", label);


  for (i = 0; i < len; i++) {
    printf("%02x ", c[i]);
  }

  puts("\n");
}


int main()
{
  uint64_t len;
  int result;
  uint8_t key[CRYPTO_KEYBYTES] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,32};
  uint8_t header[CRYPTO_NPUBBYTES+1] =
    {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,0};

  uint8_t nonce[CRYPTO_NPUBBYTES] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};

  uint8_t m[2*CRYPTO_NPUBBYTES+3] =
    {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,
     0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,1,2};

  uint8_t c[3*CRYPTO_NPUBBYTES+3];

  memset(c,0,3*CRYPTO_NPUBBYTES+3);

  result = crypto_aead_encrypt(c, &len ,m,2*CRYPTO_NPUBBYTES+3,
			       header,CRYPTO_NPUBBYTES+1,NULL,nonce,key);


  dump_hex ("Message: ", m, 2*CRYPTO_NPUBBYTES+3);
  dump_hex ("Ciphertext: ", c, 3*CRYPTO_NPUBBYTES+3);

  printf("Result encryption: %d\n", result);

  result = crypto_aead_decrypt(m, &len, NULL, c, 3*CRYPTO_NPUBBYTES+3,
			       header, CRYPTO_NPUBBYTES+1, nonce, key);

  dump_hex ("Message: ", m, 2*CRYPTO_NPUBBYTES+3);
  printf("Result decryption: %d\n", result);
  return 0;
}
