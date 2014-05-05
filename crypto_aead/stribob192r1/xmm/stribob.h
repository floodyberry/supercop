// stribob.h
// 05-Feb-14    Markku-Juhani O. Saarinen <mjos@iki.fi>
//              See LICENSE for Licensing and Warranty information.

#ifndef STRIBOB_H
#define STRIBOB_H

#include <stdint.h>
#include <string.h>

// make 32-byte aligned if possible

#ifndef SBOB_ALIGN
#if defined(_MSC_VER)
#define SBOB_ALIGN /* no-op */
//__declspec(align(32))
#else
#if defined(__GNUC__)
#define SBOB_ALIGN __attribute__ ((aligned (32)))
#else
#define SBOB_ALIGN /* no-op */
#endif
#endif
#endif

// Parameters (rate is in bytes)
#ifndef SBOB_RATE
#define SBOB_RATE 32
#endif

// 512-bit vector accessible as bytes, words, longwords, and quadwords
typedef union {
    uint8_t  b[64];
    uint16_t w[32];
    uint32_t l[16];
    uint64_t q[8];
} w512_t SBOB_ALIGN;

// State
typedef struct {
    w512_t s;               // state
    int l;                  // data position
} sbob_t;

typedef uint8_t sbob_pad_t;

// domain separators
#define BLNK_END    0x01    // Full block or padding marker
#define BLNK_FIN    0x02    // Final block of this data element
#define BLNK_A2B    0x04    // Alice -> Bob
#define BLNK_B2A    0x08    // Bob -> Alice
#define BLNK_DAT    0x00    // Bulk data for hashing (in)
#define BLNK_KEY    0x10    // Secret key (in)
#define BLNK_NPUB   0x20    // Public Nonce or Randomizer (in)
#define BLNK_NSEC   0x30    // Secret Nonce or Randomizer (in / out)
#define BLNK_AAD    0x40    // Authenticated Associated Data (in)
#define BLNK_MSG    0x50    // Message Payload (in/out)
#define BLNK_MAC    0x60    // Authentication Tag (out)
#define BLNK_HASH   0x70    // Hash (out)

#define BLNK_BIT7   0x80    // Reserved

// Error codes
#define SBOB_ERR   (-(__LINE__))

// Permutation
void sbob_pi(w512_t *s512);

// Multipurpose sponge API
void sbob_clr(sbob_t *sb);
void sbob_fin(sbob_t *sb, sbob_pad_t pad);
void sbob_put(sbob_t *sb, sbob_pad_t pad, const void *in, size_t len);
void sbob_get(sbob_t *sb, sbob_pad_t pad, void *out, size_t len);
void sbob_enc(sbob_t *sb, sbob_pad_t pad,
    void *out, const void *in, size_t len);
void sbob_dec(sbob_t *sb, sbob_pad_t pad,
    void *out, const void *in, size_t len);
int sbob_cmp(sbob_t *sb, sbob_pad_t pad, const void *in, size_t len);

#endif

