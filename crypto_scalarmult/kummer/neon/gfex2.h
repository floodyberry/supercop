#ifndef GFE2X_H
#define GFE2X_H

#include "crypto_uint32.h"

typedef struct{
  crypto_uint32 __attribute__((aligned(32))) v[10]; /* x0 y0 x1 y1 x2 y2 x3 y3 x4 y4 */
} gfex2;


void gfex2_pack(unsigned char *r, const gfex2 *x);
void gfex2_unpack(gfex2 *r, const unsigned char b[32]);
void gfex2_unpack2(gfex2 *r, const unsigned char a[16], const unsigned char b[16]);

void gfex2_mul(gfex2 *r, const gfex2 *x, const gfex2 *y);


#endif
