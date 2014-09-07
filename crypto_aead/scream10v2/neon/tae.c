#include <string.h>

#include "tae.h"
#include "params.h"

#include "api.h"
#include "crypto_aead.h"

int crypto_aead_encrypt(unsigned char *c,unsigned long long *clen,
                        const unsigned char *m,unsigned long long mlen,
                        const unsigned char *ad,unsigned long long adlen,
                        const unsigned char *nsec,
                        const unsigned char *npub,
                        const unsigned char *k) {
    
  uint8_t buffer[16*16] = {0};
  v16qu tweakey[16*TWEAKEY_SIZE];
  uint8_t pad[16];

  v16qu *checksum = (v16qu*) &buffer[ 16 * (((mlen+15)/16)%16) ];
  v16qu auth = CV(0);

  // Associated Data
  if (adlen > 0) {
    size_t idx=0;
    tweakey_schedule(k, npub, TWEAK_AD, tweakey);
    
    for (idx=0; idx+256<adlen; idx+=16*16) {
      encrypt_bloc128(ad+idx, NULL, 0, tweakey, NULL, 0, &auth, 16);
      tweakey_increment(tweakey, idx);
    }

    // Final chunk
    uint8_t buffer2[16*16] = {0};
    memcpy(buffer2, ad+idx, adlen-idx);
    if ((adlen % 16) == 0) {
      tweakey_set(tweakey, (adlen-idx-1)/16, 15, TWEAK_AD_LAST_FULL);
    } else {
      tweakey_set(tweakey, (adlen-idx-1)/16, 15, TWEAK_AD_LAST_PARTIAL);
      buffer2[adlen-idx] = 0x80;
    }
    encrypt_bloc128(buffer2, NULL, 0, tweakey, NULL, 0, &auth, (adlen-idx+15)/16);
  }

  size_t idx=0;
  tweakey_schedule(k, npub, TWEAK_MESSAGE, tweakey);
  if (mlen > 0) {
    
    for (idx=0; idx+16*16<=mlen; idx+=16*16) {
      encrypt_bloc128(m+idx, c+idx, 16, tweakey, checksum, 16, NULL, 0);
      tweakey_increment(tweakey, idx);
    }

    // Final chunk(s)
    if (mlen > idx+240) {
      /* printf ("## Almost!\n"); */
      // Almost full chunk: one extra chunk for checksum
      uint8_t buffer2[16*16] = {0};
      memcpy(buffer2, m+idx, 240);

      memset(buffer2+256-16, 0, 16);
      buffer2[255] = 8*(mlen%16);
      encrypt_bloc128(buffer2, buffer2, 16, tweakey, checksum, 15, NULL, 0);
      update_checksum(m+idx+240, checksum, mlen-idx-240);
      tweakey_increment(tweakey, idx);
      memcpy(c+idx, buffer2, 240);
      memcpy(pad,   buffer2+240, mlen%16);
      idx = mlen;
    } else {
      // Partial chunk: encrypt length for final block; checksum included
      memcpy(buffer, m+idx, mlen-idx);
      update_checksum(buffer, checksum, mlen-idx);

      if ((mlen % 16) != 0) {
	// Encrypt partial block length
	memset(&buffer[((mlen-idx)|15)-15], 0, 16);
	buffer[(mlen-idx)|15] = 8*(mlen%16);
      }
    }
  }

  // Tag generation
  tweakey_set(tweakey, ((mlen-idx+15)/16), 15, 2*8*mlen+1);
  tweakey_set(tweakey, ((mlen-idx+15)/16), 14, mlen>>4);
  tweakey_set(tweakey, ((mlen-idx+15)/16), 13, mlen>>12);
  tweakey_set(tweakey, ((mlen-idx+15)/16), 12, mlen>>20);
  tweakey_set(tweakey, ((mlen-idx+15)/16), 11, mlen>>28);
  encrypt_bloc128(buffer, buffer, 16, tweakey, NULL, 0, NULL, 0);

  memcpy(c+idx, buffer, (mlen-idx)&(~15));
  memcpy(pad,   buffer+((mlen-idx)&(~15)), (mlen-idx)%16);

  *checksum ^= auth;

  memcpy(c+mlen, checksum, CRYPTO_ABYTES);

  unsigned i;
  for (i=0; i < mlen%16; i++)
    c[16*(mlen/16)+i] = m[16*(mlen/16)+i] ^ pad[i];

  *clen = mlen+CRYPTO_ABYTES;

  return 0;
}

int crypto_aead_decrypt(unsigned char *m,unsigned long long *outputmlen,
                        unsigned char *nsec,
                        const unsigned char *c,unsigned long long clen,
                        const unsigned char *ad,unsigned long long adlen,
                        const unsigned char *npub,
                        const unsigned char *k) {
  uint8_t buffer[16*16] = {0};
  v16qu tweakey[16*TWEAKEY_SIZE];
  *outputmlen = clen-CRYPTO_ABYTES;

  v16qu auth = CV(0);
  v16qu checksum = CV(0);

  // Associated Data
  if (adlen > 0) {
    size_t idx=0;
    tweakey_schedule(k, npub, TWEAK_AD, tweakey);
    
    for (idx=0; idx+256<adlen; idx+=16*16) {
      encrypt_bloc128(ad+idx, NULL, 0, tweakey, NULL, 0, &auth, 16);
      tweakey_increment(tweakey, idx);
    }

    // Final chunk
    uint8_t buffer2[16*16] = {0};
    memcpy(buffer2, ad+idx, adlen-idx);
    if ((adlen % 16) == 0) {
      tweakey_set(tweakey, (adlen-idx-1)/16, 15, TWEAK_AD_LAST_FULL);
    } else {
      tweakey_set(tweakey, (adlen-idx-1)/16, 15, TWEAK_AD_LAST_PARTIAL);
      buffer2[adlen-idx] = 0x80;
    }
    encrypt_bloc128(buffer2, NULL, 0, tweakey, NULL, 0, &auth, (adlen-idx+15)/16);
  }

  auth ^= neon_load(c+*outputmlen);

  // Message
  size_t idx=0;
  tweakey_schedule(k, npub, TWEAK_MESSAGE, tweakey);
  for (idx=0; idx+256 <= *outputmlen; idx+=256) {
    decrypt_bloc128(c+idx, m+idx, 16, tweakey, NULL, 0, &checksum, 16);
    tweakey_increment(tweakey, idx);
  }

  int fullblocks = (*outputmlen-idx)/16;

  // Partial block
  if (*outputmlen % 16) {
    // use slot fullblocks (tweak is already correct)
    uint8_t buffer2[16*16] = {0};
    buffer2[16*fullblocks+15] = 8*(*outputmlen%16);
    encrypt_bloc128(buffer2, buffer2, 16, tweakey, NULL, 0, NULL, 0);
    unsigned i;
    for (i=0; i<*outputmlen%16; i++)
      m[16*(*outputmlen/16) + i] = c[16*(*outputmlen/16) + i] ^ buffer2[16*fullblocks+i];
    update_checksum(m+16*(*outputmlen/16), &checksum, *outputmlen%16);
  }

  // Last chunk: remaining full blocks, and checksum
  memcpy(buffer, c+idx, 16*fullblocks);
  neon_store(buffer+16*fullblocks, auth);
  tweakey_set(tweakey, fullblocks, 15, 2*8*(*outputmlen)+1);
  decrypt_bloc128(buffer, buffer, fullblocks+1, tweakey, NULL, 0, &checksum, fullblocks);
  memcpy(m+idx, buffer, 16*fullblocks);

  // Verify tag
  if (memcmp(&checksum, buffer+16*fullblocks, 16) != 0) {
    memset(m, 0, *outputmlen);
    return -1;
  }

  return 0;
}

void update_checksum(const uint8_t *in8, v16qu *cksum, size_t len) {
  size_t i;
  for (i=0; i<len; i++)
    (*cksum)[i%16] ^= in8[i];
}
