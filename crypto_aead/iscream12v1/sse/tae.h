#include <stdint.h>

#if __STDC_VERSION__ < 199901L
#define restrict
#endif

typedef          char          v16qi __attribute__ ((vector_size (16)));
typedef          int            v4si __attribute__ ((vector_size (16)));
typedef          long long      v2di __attribute__ ((vector_size (16)));
typedef unsigned char          v16qu __attribute__ ((vector_size (16)));

#define CV(x) {x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x}

void tweakey_schedule(const uint8_t *restrict k, const uint8_t *restrict n, uint8_t ctrl, v16qi *restrict TK);
void tweakey_increment(v16qi *TK, size_t idx);
void encrypt_tweakey (v16qi *restrict X, v16qi *restrict TK);
void decrypt_tweakey (v16qi *restrict X, v16qi *restrict TK);

void tweakey_set(v16qi *TK, int i, int j, uint8_t x);

void read128(const uint8_t *in8, v16qi *out128);
void write128(v16qi *in128, uint8_t *out8);
void write128_checksum(v16qi *in128, uint8_t* out8, v16qi *cksum, int len);
void write128_checksum2(v16qi *in128, uint8_t* out8, v16qi *cksum, int mlen, int cklen);

void read128_with_checksum(const uint8_t *in8, v16qi *out128, v16qi *cksum, int len);
void update_checksum(const uint8_t *in8, v16qi *cksum, size_t len);


enum tweak_count {
  TWEAK_MESSAGE              = 0x0,
  TWEAK_MESSAGE_LAST_FULL    = 0xc0,
  TWEAK_MESSAGE_LAST_PARTIAL = 0xc8,
  TWEAK_AD                   = 0x80,
  TWEAK_AD_LAST_FULL         = 0xd0,
  TWEAK_AD_LAST_PARTIAL      = 0xd8,
  TWEAK_TAG_LAST_FULL        = 0xe0,
  TWEAK_TAG_LAST_PARTIAL     = 0xe8,
};
