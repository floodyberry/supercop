#ifndef GFE_H
#define GFE_H

#include "crypto_int32.h"

typedef struct{
  crypto_int32 v[5];
} gfe;

void gfe_unpack(gfe *r, const unsigned char b[16]);

void gfe_pack(unsigned char r[16], const gfe *x);

void gfe_mul(gfe *r, const gfe *x, const gfe *y);

void gfe_mulconst(gfe *r, const gfe *x, crypto_int32 c);

void gfe_hadamard(gfe r[4]);

#define gfe_square(R,X) gfe_mul(R,X,X)
//void gfe_square(gfe *r, const gfe *x);
void gfe_invert(gfe *r, const gfe *x);
void gfe_print(const gfe *x);

#endif
