/*
 * File:   lattisigns512-20130329/poly.h
 * Author: Gim Güneysu, Tobias Oder, Thomas Pöppelmann, Peter Schwabe
 * Public Domain
 */

#ifndef POLY_H
#define POLY_H
#include "params.h"

typedef double __attribute__ ((aligned (32))) poly[POLY_DEG];

extern const poly param_a;

/*
typedef struct {
  unsigned int one[32];
  unsigned int one_count;
  unsigned int minusone[32];
  unsigned int minusone_count;
} sparsepoly;
*/

void poly_pack(unsigned char r[1536], const poly f);
void poly_unpack(poly r, const unsigned char a[1536]);

void poly_smallcoeff_pack(unsigned char r[1024], const poly f);
int  poly_smallcoeff_unpack(poly r, const unsigned char a[1024]);

int  poly_cannotcompress(const poly y, const poly z);
void poly_compress(unsigned char r[140], const poly y, const poly z);
int  poly_decompress(poly r, const unsigned char a[140]);

void poly_fromhash(poly r, const unsigned char h[20]);
//void sparsepoly_fromhash(sparsepoly *r, const unsigned char h[20]);

void poly_setrandom(poly r);
void poly_setrandom_maxk(poly r);
void poly_setrandom_max1(poly r);

void poly_extract_high_bits(unsigned char hibits[POLY_DEG], poly f); /* XXX: make f const again */

void poly_add_nored(poly r, const poly f, const poly g);
void poly_sub_nored(poly r, const poly f, const poly g);

void poly_mul(poly r, const poly f, const poly g);
void poly_mul_a(poly r, const poly f);

void poly_coeffreduce(poly r);

void poly_print(const poly f);



#endif
