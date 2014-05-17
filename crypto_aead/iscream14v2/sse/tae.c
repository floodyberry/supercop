#include <string.h>

#include "tae.h"
#include "params.h"

#include "api.h"
#include "crypto_aead.h"

#if defined(__GNUC__) && !defined(__INTEL_COMPILER) && !defined(__clang__)
// GCC builtins
#define sse_load(p) __builtin_ia32_loaddqu((const char*)(p))
#define sse_store(p,x) __builtin_ia32_storedqu((char*)(p), x)
#define sse_interleavel(x,y) __builtin_ia32_punpcklbw128(x,y)
#define sse_interleaveh(x,y) __builtin_ia32_punpckhbw128(x,y)
#else
#include <tmmintrin.h>
// MSVC/ICC vector instrinsics
#define sse_load(p) _mm_loadu_si128((const __m128i *)(p))
#define sse_store(p,x) _mm_storeu_si128((__m128i *)(p),x)
#define sse_interleavel(x,y) _mm_unpacklo_epi8(x,y)
#define sse_interleaveh(x,y) _mm_unpackhi_epi8(x,y)
#endif

int crypto_aead_encrypt(unsigned char *c,unsigned long long *clen,
                        const unsigned char *m,unsigned long long mlen,
                        const unsigned char *ad,unsigned long long adlen,
                        const unsigned char *nsec,
                        const unsigned char *npub,
                        const unsigned char *k) {
    
  v16qi data[16];
  uint8_t buffer[16*16] = {0};
  v16qi tweakey[16*TWEAKEY_SIZE];
  uint8_t pad[16];

  v16qi *checksum = (v16qi*) &buffer[ 16 * (((mlen+15)/16)%16) ];
  v16qi auth = CV(0);

  // Associated Data
  if (adlen > 0) {
    size_t idx=0;
    tweakey_schedule(k, npub, TWEAK_AD, tweakey);
    
    for (idx=0; idx+256<adlen; idx+=16*16) {
      read128(ad+idx, data);
      encrypt_tweakey(data, tweakey);
      tweakey_increment(tweakey, idx);
      write128_checksum(data, NULL, &auth, 16);
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
    read128(buffer2, data);
    encrypt_tweakey(data, tweakey);
    write128_checksum(data, NULL, &auth, (adlen-idx+15)/16);
  }

  size_t idx=0;
  tweakey_schedule(k, npub, TWEAK_MESSAGE, tweakey);
  if (mlen > 0) {
    
    for (idx=0; idx+16*16<=mlen; idx+=16*16) {
      read128_with_checksum(m+idx, data, checksum, 16);
      encrypt_tweakey(data, tweakey);
      tweakey_increment(tweakey, idx);
      write128(data, c+idx);
    }

    // Final chunk(s)
    if (mlen > idx+240) {
      /* printf ("## Almost!\n"); */
      // Almost full chunk: one extra chunk for checksum
      uint8_t buffer2[16*16] = {0};
      memcpy(buffer2, m+idx, 240);

      memset(buffer2+256-16, 0, 16);
      buffer2[255] = 8*(mlen%16);
      read128_with_checksum(buffer2, data, checksum, 15);
      update_checksum(m+idx+240, checksum, mlen-idx-240);

      encrypt_tweakey(data, tweakey);
      tweakey_increment(tweakey, idx);
      write128(data, buffer2);
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
  read128(buffer, data);
  encrypt_tweakey(data, tweakey);
  write128(data, buffer);

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
  v16qi data[16];
  uint8_t buffer[16*16] = {0};
  v16qi tweakey[16*TWEAKEY_SIZE];
  *outputmlen = clen-CRYPTO_ABYTES;

  v16qi auth = CV(0);
  v16qi checksum = CV(0);

  // Associated Data
  if (adlen > 0) {
    size_t idx=0;
    tweakey_schedule(k, npub, TWEAK_AD, tweakey);
    
    for (idx=0; idx+256<adlen; idx+=16*16) {
      read128(ad+idx, data);
      encrypt_tweakey(data, tweakey);
      tweakey_increment(tweakey, idx);
      write128_checksum(data, NULL, &auth, 16);
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
    read128(buffer2, data);
    encrypt_tweakey(data, tweakey);
    write128_checksum(data, NULL, &auth, (adlen-idx+15)/16);
  }

  auth ^= sse_load(c+*outputmlen);

  // Message
  size_t idx=0;
  tweakey_schedule(k, npub, TWEAK_MESSAGE, tweakey);
  for (idx=0; idx+256 <= *outputmlen; idx+=256) {
    read128(c+idx, data);
    decrypt_tweakey(data, tweakey);
    tweakey_increment(tweakey, idx);
    write128_checksum(data, m+idx, &checksum, 16);
  }

  int fullblocks = (*outputmlen-idx)/16;

  // Partial block
  if (*outputmlen % 16) {
    // use slot fullblocks (tweak is already correct)
    uint8_t buffer2[16*16] = {0};
    buffer2[16*fullblocks+15] = 8*(*outputmlen%16);
    read128(buffer2, data);
    encrypt_tweakey(data, tweakey);
    write128(data, buffer2);
    unsigned i;
    for (i=0; i<*outputmlen%16; i++)
      m[16*(*outputmlen/16) + i] = c[16*(*outputmlen/16) + i] ^ buffer2[16*fullblocks+i];
    update_checksum(m+16*(*outputmlen/16), &checksum, *outputmlen%16);
  }

  // Last chunk: remaining full blocks, and checksum
  memcpy(buffer, c+idx, 16*fullblocks);
  sse_store(buffer+16*fullblocks, auth);
  tweakey_set(tweakey, fullblocks, 15, 2*8*(*outputmlen)+1);
  read128(buffer, data);
  decrypt_tweakey(data, tweakey);
  write128_checksum2(data, buffer, &checksum, fullblocks+1, fullblocks);
  memcpy(m+idx, buffer, 16*fullblocks);

  // Verify tag
  if (memcmp(&checksum, buffer+16*fullblocks, 16) != 0) {
    memset(m, 0, *outputmlen);
    return -1;
  }

  return 0;
}

void write128_checksum2(v16qi *in128, uint8_t* out8, v16qi *cksum,
		       int mlen, int cklen) {

#define X(i) in128[8*(i%2)+(i/2)]
  
  // Transpose matrix
#define INTERLEAVE(i,j)					     \
  do {							     \
    v16qi t1= X(i);					     \
    v16qi t2= X(j);					     \
    X(i) = sse_interleavel(t1, t2);                          \
    X(j) = sse_interleaveh(t1, t2);                          \
  } while(0)
  
  INTERLEAVE( 0,  8);
  INTERLEAVE( 1,  9);
  INTERLEAVE( 2, 10);
  INTERLEAVE( 3, 11);
  INTERLEAVE( 4, 12);
  INTERLEAVE( 5, 13);
  INTERLEAVE( 6, 14);
  INTERLEAVE( 7, 15);

  INTERLEAVE( 0,  4);
  INTERLEAVE( 1,  5);
  INTERLEAVE( 2,  6);
  INTERLEAVE( 3,  7);
  INTERLEAVE( 8, 12);
  INTERLEAVE( 9, 13);
  INTERLEAVE(10, 14);
  INTERLEAVE(11, 15);

  INTERLEAVE( 0,  2);
  INTERLEAVE( 1,  3);
  INTERLEAVE( 4,  6);
  INTERLEAVE( 5,  7);
  INTERLEAVE( 8, 10);
  INTERLEAVE( 9, 11);
  INTERLEAVE(12, 14);
  INTERLEAVE(13, 15);

  INTERLEAVE( 0,  1);
  INTERLEAVE( 2,  3);
  INTERLEAVE( 4,  5);
  INTERLEAVE( 6,  7);
  INTERLEAVE( 8,  9);
  INTERLEAVE(10, 11);
  INTERLEAVE(12, 13);
  INTERLEAVE(14, 15);

  // Write data
  if (out8) {
    switch (mlen) {
    case 16:
    sse_store(out8+16*15, X(15));
    case 15:
    sse_store(out8+16*14, X(14));
    case 14:
    sse_store(out8+16*13, X(13));
    case 13:
    sse_store(out8+16*12, X(12));
    case 12:
    sse_store(out8+16*11, X(11));
    case 11:
    sse_store(out8+16*10, X(10));
    case 10:
    sse_store(out8+16*9 , X(9 ));
    case 9:
    sse_store(out8+16*8 , X(8 ));
    case 8:
    sse_store(out8+16*7 , X(7 ));
    case 7:
    sse_store(out8+16*6 , X(6 ));
    case 6:
    sse_store(out8+16*5 , X(5 ));
    case 5:
    sse_store(out8+16*4 , X(4 ));
    case 4:
    sse_store(out8+16*3 , X(3 ));
    case 3:
    sse_store(out8+16*2 , X(2 ));
    case 2:
    sse_store(out8+16*1 , X(1 ));
    case 1:
    sse_store(out8+16*0 , X(0 ));
    case 0:
      ;
    }
  }

  // Update checksum
  if (cksum) {
    switch (cklen) {
    case 16:
      *cksum ^= X(15);
    case 15:
      *cksum ^= X(14);
    case 14:
      *cksum ^= X(13);
    case 13:
      *cksum ^= X(12);
    case 12:
      *cksum ^= X(11);
    case 11:
      *cksum ^= X(10);
    case 10:
      *cksum ^= X(9 );
    case 9:
      *cksum ^= X(8 );
    case 8:
      *cksum ^= X(7 );
    case 7:
      *cksum ^= X(6 );
    case 6:
      *cksum ^= X(5 );
    case 5:
      *cksum ^= X(4 );
    case 4:
      *cksum ^= X(3 );
    case 3:
      *cksum ^= X(2 );
    case 2:
      *cksum ^= X(1 );
    case 1:
      *cksum ^= X(0 );
    case 0:
      ;
    }
  }
#undef X
#undef INTERLEAVE  
}

void write128_checksum(v16qi *in128, uint8_t* out8, v16qi *cksum, int len) {
  write128_checksum2(in128, out8, cksum, len, len);
}

void write128(v16qi *in128, uint8_t *out8) {
  write128_checksum(in128, out8, NULL, 16);
}

void read128_with_checksum(const uint8_t *in8, v16qi *out128, v16qi *cksum, int len) {
  // Read data
  register v16qi
    X0  = sse_load(in8+16*0 ),
    X1  = sse_load(in8+16*1 ),
    X2  = sse_load(in8+16*2 ),
    X3  = sse_load(in8+16*3 ),
    X4  = sse_load(in8+16*4 ),
    X5  = sse_load(in8+16*5 ),
    X6  = sse_load(in8+16*6 ),
    X7  = sse_load(in8+16*7 ),
    X8  = sse_load(in8+16*8 ),
    X9  = sse_load(in8+16*9 ),
    X10 = sse_load(in8+16*10),
    X11 = sse_load(in8+16*11),
    X12 = sse_load(in8+16*12),
    X13 = sse_load(in8+16*13),
    X14 = sse_load(in8+16*14),
    X15 = sse_load(in8+16*15);

#define X(i) X##i

  // Update checksum
  if (cksum) {
    switch (len) {
    case 16:
      *cksum ^= X(15);
    case 15:
      *cksum ^= X(14);
    case 14:
      *cksum ^= X(13);
    case 13:
      *cksum ^= X(12);
    case 12:
      *cksum ^= X(11);
    case 11:
      *cksum ^= X(10);
    case 10:
      *cksum ^= X(9 );
    case 9:
      *cksum ^= X(8 );
    case 8:
      *cksum ^= X(7 );
    case 7:
      *cksum ^= X(6 );
    case 6:
      *cksum ^= X(5 );
    case 5:
      *cksum ^= X(4 );
    case 4:
      *cksum ^= X(3 );
    case 3:
      *cksum ^= X(2 );
    case 2:
      *cksum ^= X(1 );
    case 1:
      *cksum ^= X(0 );
    case 0:
      ;
    }
  }
  
  // Transpose matrix
#define INTERLEAVE(i,j)					     \
  do {							     \
    v16qi t1= X(i);					     \
    v16qi t2= X(j);					     \
    X(i) = sse_interleavel(t1, t2);                          \
    X(j) = sse_interleaveh(t1, t2);                          \
  } while(0)
  

  INTERLEAVE( 0,  8);
  INTERLEAVE( 1,  9);
  INTERLEAVE( 2, 10);
  INTERLEAVE( 3, 11);
  INTERLEAVE( 4, 12);
  INTERLEAVE( 5, 13);
  INTERLEAVE( 6, 14);
  INTERLEAVE( 7, 15);

  INTERLEAVE( 0,  4);
  INTERLEAVE( 1,  5);
  INTERLEAVE( 2,  6);
  INTERLEAVE( 3,  7);
  INTERLEAVE( 8, 12);
  INTERLEAVE( 9, 13);
  INTERLEAVE(10, 14);
  INTERLEAVE(11, 15);

  INTERLEAVE( 0,  2);
  INTERLEAVE( 1,  3);
  INTERLEAVE( 4,  6);
  INTERLEAVE( 5,  7);
  INTERLEAVE( 8, 10);
  INTERLEAVE( 9, 11);
  INTERLEAVE(12, 14);
  INTERLEAVE(13, 15);

  INTERLEAVE( 0,  1);
  INTERLEAVE( 2,  3);
  INTERLEAVE( 4,  5);
  INTERLEAVE( 6,  7);
  INTERLEAVE( 8,  9);
  INTERLEAVE(10, 11);
  INTERLEAVE(12, 13);
  INTERLEAVE(14, 15);

  // Write data
  out128[0 ] = X(0 );
  out128[1 ] = X(2 );
  out128[2 ] = X(4 );
  out128[3 ] = X(6 );
  out128[4 ] = X(8 );
  out128[5 ] = X(10);
  out128[6 ] = X(12);
  out128[7 ] = X(14);
  out128[8 ] = X(1 );
  out128[9 ] = X(3 );
  out128[10] = X(5 );
  out128[11] = X(7 );
  out128[12] = X(9 );
  out128[13] = X(11);
  out128[14] = X(13);
  out128[15] = X(15);

#undef X
#undef INTERLEAVE
}

void read128(const uint8_t *in8, v16qi *out128) {
  read128_with_checksum(in8, out128, NULL, 0);
}

void update_checksum(const uint8_t *in8, v16qi *cksum, size_t len) {
  size_t i;
  for (i=0; i<len; i++)
    (*cksum)[i%16] ^= in8[i];
}
