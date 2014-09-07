#include <stdint.h>

#if __STDC_VERSION__ < 199901L
#define restrict
#endif

#include <arm_neon.h>

// GCC builtins
#define neon_load(p) vld1q_u8((uint8_t*)(p))
#define neon_store(p,x) vst1q_u8((uint8_t*)(p), x)

typedef uint8x16_t v16qu;

#define CV(x) {x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x}

void encrypt_bloc128(const unsigned char* in,
		     unsigned char *out, int outlen,
		     v16qu *tweakey,
		     v16qu* ck_r, int n_r,
		     v16qu* ck_w, int n_w);

void decrypt_bloc128(const unsigned char* in,
		     unsigned char *out, int outlen,
		     v16qu *tweakey,
		     v16qu* ck_r, int n_r,
		     v16qu* ck_w, int n_w);

void tweakey_schedule(const uint8_t *restrict k, const uint8_t *restrict n, uint8_t ctrl, v16qu *restrict TK);
void tweakey_increment(v16qu *TK, size_t idx);
/* void encrypt_tweakey (v16qu *restrict X, v16qu *restrict TK); */
/* void decrypt_tweakey (v16qu *restrict X, v16qu *restrict TK); */

void tweakey_set(v16qu *TK, int i, int j, uint8_t x);

/* void read128(const uint8_t *in8, v16qu *out128); */
/* void write128(v16qu *in128, uint8_t *out8); */
/* void write128_checksum(v16qu *in128, uint8_t* out8, v16qu *cksum, int len); */
/* void write128_checksum2(v16qu *in128, uint8_t* out8, v16qu *cksum, int mlen, int cklen); */

/* void read128_with_checksum(const uint8_t *in8, v16qu *out128, v16qu *cksum, int len); */
void update_checksum(const uint8_t *in8, v16qu *cksum, size_t len);


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
