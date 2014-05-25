
/*
	Bernstein's code
	from the crypto_stream directory of test framework

	Plus some macros from include/ecrypt_portable.h
	which his depend on

	Only parts needed for Enchilada are here
*/	

#include "enchilada.h"

#define U32V(v) ((u32)(v) & U32C(0xFFFFFFFF))

#define ROTL32(v, n) \
  (U32V((v) << (n)) | ((v) >> (32 - (n))))

#define U32C(v) (v##U)

#define U8V(v) ((byte)(v) & 0xFF)

#define U8TO32_LITTLE(p) \
  (((u32)((p)[0])      ) | \
   ((u32)((p)[1]) <<  8) | \
   ((u32)((p)[2]) << 16) | \
   ((u32)((p)[3]) << 24))

#define U32TO8_LITTLE(p, v) \
  do { \
    (p)[0] = U8V((v)      ); \
    (p)[1] = U8V((v) >>  8); \
    (p)[2] = U8V((v) >> 16); \
    (p)[3] = U8V((v) >> 24); \
  } while (0)

/*
chacha-ref.c version 20080118
D. J. Bernstein
Public domain.
*/

#define ROTATE(v,c) (ROTL32(v,c))
#define XOR(v,w) ((v) ^ (w))
#define PLUS(v,w) (U32V((v) + (w)))
#define PLUSONE(v) (PLUS((v),1))

#define QUARTERROUND(a,b,c,d) \
  x[a] = PLUS(x[a],x[b]); x[d] = ROTATE(XOR(x[d],x[a]),16); \
  x[c] = PLUS(x[c],x[d]); x[b] = ROTATE(XOR(x[b],x[c]),12); \
  x[a] = PLUS(x[a],x[b]); x[d] = ROTATE(XOR(x[d],x[a]), 8); \
  x[c] = PLUS(x[c],x[d]); x[b] = ROTATE(XOR(x[b],x[c]), 7);

static void salsa20_wordtobyte(byte output[64],const u32 input[16])
{
  u32 x[16];
  int i;

  for (i = 0;i < 16;++i) x[i] = input[i];
  for (i = 12;i > 0;i -= 2) {
    QUARTERROUND( 0, 4, 8,12)
    QUARTERROUND( 1, 5, 9,13)
    QUARTERROUND( 2, 6,10,14)
    QUARTERROUND( 3, 7,11,15)
    QUARTERROUND( 0, 5,10,15)
    QUARTERROUND( 1, 6,11,12)
    QUARTERROUND( 2, 7, 8,13)
    QUARTERROUND( 3, 4, 9,14)
  }
  for (i = 0;i < 16;++i) x[i] = PLUS(x[i],input[i]);
  for (i = 0;i < 16;++i) U32TO8_LITTLE(output + 4 * i,x[i]);
}

static const char sigma[16] = "expand 32-byte k";
static const char tau[16] = "expand 16-byte k";

void chacha_keysetup(u32 *x,const byte *k,u32 kbits,u32 ivbits)
{
  const char *constants;

  x[4] = U8TO32_LITTLE(k + 0);
  x[5] = U8TO32_LITTLE(k + 4);
  x[6] = U8TO32_LITTLE(k + 8);
  x[7] = U8TO32_LITTLE(k + 12);
  if (kbits == 256) { /* recommended */
    k += 16;
    constants = sigma;
  } else { /* kbits == 128 */
    constants = tau;
  }
  x[8] = U8TO32_LITTLE(k + 0);
  x[9] = U8TO32_LITTLE(k + 4);
  x[10] = U8TO32_LITTLE(k + 8);
  x[11] = U8TO32_LITTLE(k + 12);
  x[0] = U8TO32_LITTLE(constants + 0);
  x[1] = U8TO32_LITTLE(constants + 4);
  x[2] = U8TO32_LITTLE(constants + 8);
  x[3] = U8TO32_LITTLE(constants + 12);
}

void chacha_ivsetup(u32 *x,const byte *iv)
{
  x[12] = 0;
  x[13] = 0;
  x[14] = U8TO32_LITTLE(iv + 0);
  x[15] = U8TO32_LITTLE(iv + 4);
}

void chacha_encrypt_bytes(u32 *x,const byte *m,byte *c,u32 bytes)
{
  byte output[64];
  int i;

  if (!bytes) return;
  for (;;) {
    salsa20_wordtobyte(output,x);
    x[12] = PLUSONE(x[12]);
    if (!x[12]) {
      x[13] = PLUSONE(x[13]);
      /* stopping at 2^70 bytes per nonce is user's responsibility */
    }
    if (bytes <= 64) {
      for (i = 0;i < bytes;++i) c[i] = m[i] ^ output[i];
      return;
    }
    for (i = 0;i < 64;++i) c[i] = m[i] ^ output[i];
    bytes -= 64;
    c += 64;
    m += 64;
  }
}

void chacha_keystream_bytes(u32 *x,byte *stream,u32 bytes)
{
  u32 i;
  for (i = 0;i < bytes;++i) stream[i] = 0;
  chacha_encrypt_bytes(x,stream,stream,bytes);
}
