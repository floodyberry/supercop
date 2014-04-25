#ifndef GFE4X_H
#define GFE4X_H

#include "crypto_uint32.h"
#include "gfex2.h"

typedef struct{
  crypto_uint32 __attribute__((aligned(32))) v[20]; 
  /* x20 y20 x21 y21 , x22 y22 x23 y23 , x24 y24 z34 t34 , z30 t30 z31 t31 , z32 t32 z33 t33 */
} gfex4;


void gfex4_pack(unsigned char *r, const gfex4 *x);
void gfex4_unpack(gfex4 *r, const unsigned char b[64]);
void gfex4_merge(gfex4 *r, const gfex2 *x, const gfex2 *y);

void invert(gfex4 *r, const gfex4 *x);

void mul(gfex4 *r, const gfex4 *x, const gfex4 *y);
void cswap(gfex4 *a, gfex4 *b, const int bit);
void loop(gfex4 *a, gfex4 *b, gfex4 *d, const unsigned char c[32], const unsigned char n[32], const unsigned char *_const);

#endif
