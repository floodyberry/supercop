#include "api.h"
#include "keccak.h"
#include "crypto_hash.h"

extern void keccakf(u32 *state, const u32 *in, const u32 *cst);

void sqeeze( unsigned char *out, const u32 *state, int laneCount )
{
    u32 * pI = (u32 *)out;
//    const u32 * pS = state;
    u32 t, x0, x1;
    int i;
//    for (i = laneCount-1; i >= 0; --i)
    for (i = 0; i < laneCount; i++)
    {
        x0 = state[i];
        x1 = state[i+25];
        t = (x0 & 0x0000FFFF) | (x1 << 16);
        x1 = (x0 >> 16) | (x1 & 0xFFFF0000);
        x0 = t;
        t = (x0 ^ (x0 >>  8)) & 0x0000FF00UL;  x0 = x0 ^ t ^ (t <<  8);
        t = (x0 ^ (x0 >>  4)) & 0x00F000F0UL;  x0 = x0 ^ t ^ (t <<  4);
        t = (x0 ^ (x0 >>  2)) & 0x0C0C0C0CUL;  x0 = x0 ^ t ^ (t <<  2);
        t = (x0 ^ (x0 >>  1)) & 0x22222222UL;  x0 = x0 ^ t ^ (t <<  1);
        t = (x1 ^ (x1 >>  8)) & 0x0000FF00UL;  x1 = x1 ^ t ^ (t <<  8);
        t = (x1 ^ (x1 >>  4)) & 0x00F000F0UL;  x1 = x1 ^ t ^ (t <<  4);
        t = (x1 ^ (x1 >>  2)) & 0x0C0C0C0CUL;  x1 = x1 ^ t ^ (t <<  2);
        t = (x1 ^ (x1 >>  1)) & 0x22222222UL;  x1 = x1 ^ t ^ (t <<  1);
        *(pI++) = x0;
        *(pI++) = x1;
    }
}

static const u32 cst[2*23+7] =
{
  /* rounds constants r2...r23, terminator 42, r24, other constants */
  /* Rounds constant for round 1 is hard coded  in firstround.pq */
    0x00000000UL,    0x00000089UL,
    0x00000000UL,    0x8000008bUL,
    0x00000000UL,    0x80008080UL,
    0x00000001UL,    0x0000008bUL,
    0x00000001UL,    0x00008000UL,
    0x00000001UL,    0x80008088UL,
    0x00000001UL,    0x80000082UL,
    0x00000000UL,    0x0000000bUL,
    0x00000000UL,    0x0000000aUL,
    0x00000001UL,    0x00008082UL,
    0x00000000UL,    0x00008003UL,
    0x00000001UL,    0x0000808bUL,
    0x00000001UL,    0x8000000bUL,
    0x00000001UL,    0x8000008aUL,
    0x00000001UL,    0x80000081UL,
    0x00000000UL,    0x80000081UL,
    0x00000000UL,    0x80000008UL,
    0x00000000UL,    0x00000083UL,
    0x00000000UL,    0x80008003UL,
    0x00000001UL,    0x80008088UL,
    0x00000000UL,    0x80000088UL,
    0x00000001UL,    0x00008000UL,
    42, /* Round Terminator */
    0x00000000UL,    0x80008082UL,
    0x22222222UL,    0x0c0c0c0cUL,
    0x00f000f0UL,    0x0000ff00UL,
    0x0000ffffUL,    0xffff0000UL
};



int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
{
    u32 __attribute__((aligned(8))) state[STATE_WORDS];
    u8  buf[R_BYTES];
    int i;

    //printf("state: %p\n",state);
    
    for(i=0;i<STATE_WORDS;i++)
      state[i] = 0;

    /* absorb */
    for ( ; inlen >= R_BYTES; inlen -= R_BYTES, in += R_BYTES)
    {
        keccakf(state, (const u32*)in, cst);
    }

    /* pad and absorb */
    for(i=0;i<inlen;i++)
      buf[i] = in[i];
    buf[i++] = 0x01;
    for(;i<R_BYTES;i++)
      buf[i] = 0;
    buf[R_BYTES-1] |= 0x80;

    keccakf(state, (const u32*)buf, cst);
    /*
    for(i=0;i<200;i++)
      printf("%02x ",i[(unsigned char *)state]);
    printf("\n");
    */

    /* sqeeze */
    sqeeze(out, state, CRYPTO_BYTES / LANE_BYTES);

    return 0;
}
