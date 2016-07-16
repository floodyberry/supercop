#ifndef PROEST128_H
#define PROEST128_H

#include <stdint.h>

#define PROEST_LANEBYTES  2
#define PROEST_ROWS       4
#define PROEST_COLUMNS    4
#define PROEST_NROUNDS   16
#define PROEST_STATEBYTES (PROEST_ROWS*PROEST_COLUMNS*PROEST_LANEBYTES)

typedef uint16_t lane;

typedef struct {
  lane a[12][4];
} proest_ctx;

void proest_readstate(proest_ctx *r, const unsigned char in[PROEST_STATEBYTES]);
void proest_writestate(unsigned char out[PROEST_STATEBYTES], const proest_ctx *x);

void proest_permute(proest_ctx *r);
void proest_inverse_permute(proest_ctx *r);

#endif
