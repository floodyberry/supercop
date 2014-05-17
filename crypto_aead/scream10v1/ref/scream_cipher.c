/* LS-cipher implementation */

#include "crypto_uint16.h"
#include "crypto_uint8.h"

#include "sbox.h"
#include "lbox.h"
#include "params.h"

void LS_encrypt(const crypto_uint8 input[16], const crypto_uint8 key[16], const crypto_uint8 tweak[16],
		crypto_uint8 output[16]) {
  crypto_uint16 data[8];
  crypto_uint16 k[8];
  crypto_uint16 t[8];
  int i,j;

  for (i=0; i<8; i++) {
    data[i] = ((crypto_uint16)input[2*i+1]<<8) + input[2*i];
    k[i] = ((crypto_uint16)  key[2*i+1]<<8) +   key[2*i];
    t[i] = ((crypto_uint16)tweak[2*i+1]<<8) + tweak[2*i];
  }
    
  /* Initial key + tweak addition */
  for (j=0; j<8; j++) data[j] ^= k[j] ^ t[j];
    
  /* ---------------- Step Function ---------------- */
  for (i=0; i<nSteps; i++) {
        
    /* ---------------- First Round ---------------- */
    /* SBox layer (bitsliced) */
    SBOX(data);
    /* First round constant */
    data[0] ^= ((27*(2*i)) % 256);
    /* LBox layer (tables) */
    for (j=0; j<8; j++)
      data[j] = LBox2[data[j]>>8] ^ LBox1[data[j]&0xff];
        
    /* ---------------- Second Round -------------- */
    /* SBox layer (bitsliced) */
    SBOX(data);
    /* Round constant */
    data[0] ^= ((27*(2*i+1)) % 256);
    /* LBox layer (tables) */
    for (j=0; j<8; j++)
      data[j] = LBox2[data[j]>>8] ^ LBox1[data[j]&0xff];
        
    /* Tweak schedule */
    for (j=0; j<4; j++) {
      t[j]   ^= t[j+4];
      t[j+4] ^= t[j];
    }
    /* ----------- Key + Tweak Addition ---------- */
    for (j=0; j<8; j++) data[j] ^= k[j] ^ t[j];
  }

  /* ----------- Restore initial tweak --------- */
  for (i=nSteps%3; i<3; i++) {
    for (j=0; j<4; j++) {
      t[j]   ^= t[j+4];
      t[j+4] ^= t[j];
    }
  }
    
  for (i=0; i<8; i++) {
    output[2*i]   = data[i];
    output[2*i+1] = data[i]>>8;
  }
}


void LS_decrypt(const crypto_uint8 input[16], const crypto_uint8 key[16], const crypto_uint8 tweak[16],
		crypto_uint8 output[16]) {
  crypto_uint16 data[8];
  crypto_uint16 k[8];
  crypto_uint16 t[8];
  int i,j;

  for (i=0; i<8; i++) {
    data[i] = ((crypto_uint16)input[2*i+1]<<8) + input[2*i];
    k[i] = ((crypto_uint16)  key[2*i+1]<<8) +   key[2*i];
    t[i] = ((crypto_uint16)tweak[2*i+1]<<8) + tweak[2*i];
  }

  /* ---------------- Step Function ---------------- */
  for (i=nSteps-1; i>=0; i--) {
    /* ----------- Key + Tweak Addition ---------- */
    for (j=0; j<8; j++) data[j] ^= k[j];
    switch(i%3) {
    case     0:
      for (j=0; j<4; j++) data[j] ^= t[j] ^ t[j+4];
      for (j=4; j<8; j++) data[j] ^= t[j-4];
      break;
    case     1:
      for (j=0; j<4; j++) data[j] ^= t[j+4];
      for (j=4; j<8; j++) data[j] ^= t[j] ^ t[j-4];
      break;
    case     2:
      for (j=0; j<8; j++) data[j] ^= t[j] ;
      break;
    }

    /* ---------------- Second Round -------------- */
    /* LBox layer (tables) */
    for (j=0; j<8; j++)
      data[j] = LBoxInv2[data[j]>>8] ^ LBoxInv1[data[j]&0xff];
    /* Round constant */
    data[0] ^= ((27*(2*i+1)) % 256);
    /* SBox layer (bitsliced) */
    SBOX_Inv(data);
        
    /* ---------------- First Round ---------------- */
    /* LBox layer (tables) */
    for (j=0; j<8; j++)
      data[j] = LBoxInv2[data[j]>>8] ^ LBoxInv1[data[j]&0xff];
    /* First round constant */
    data[0] ^= ((27*(2*i)) % 256);
    /* SBox layer (bitsliced) */
    SBOX_Inv(data);
  }

  /* Final key + tweak addition */
  for (j=0; j<8; j++) data[j] ^= k[j] ^ t[j];
    
  for (i=0; i<8; i++) {
    output[2*i]   = data[i];
    output[2*i+1] = data[i]>>8;
  }
}
