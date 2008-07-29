#ifndef POLY_H
#define POLY_H

#include "gf.h"

typedef struct polynome {
  int deg, size;
  gf_t * coeff;
} * poly_t; /* polynome a coefficients dans le corps fini */

#ifndef TRUE
#define TRUE 1
#define FALSE 0
#endif

#define poly_deg(p) ((p)->deg)
#define poly_size(p) ((p)->size)
#define poly_set_deg(p, d) ((p)->deg = (d))
#define poly_coeff(p, i) ((p)->coeff[i])
#define poly_set_coeff(p, i, a) ((p)->coeff[i] = (a))
#define poly_addto_coeff(p, i, a) ((p)->coeff[i] = gf_add((p)->coeff[i], (a)))
#define poly_multo_coeff(p, i, a) ((p)->coeff[i] = gf_mul((p)->coeff[i], (a)))
#define poly_tete(p) ((p)->coeff[(p)->deg])

/****** poly.c ******/

int poly_calcule_deg(poly_t p);
poly_t poly_alloc(int d);
poly_t poly_alloc_from_string(int d, const unsigned char * s);
void poly_free(poly_t p);
void poly_set(poly_t p, poly_t q);
poly_t poly_mul(poly_t p, poly_t q);
void poly_rem(poly_t p, poly_t g);
gf_t poly_eval(poly_t p, gf_t a);
int poly_degppf(poly_t g);
void poly_eeaux(poly_t * u, poly_t * v, poly_t p, poly_t g, int t);

poly_t * poly_syndrome_init(poly_t generator, gf_t *support, int n);
poly_t * poly_sqrtmod_init(poly_t g);
poly_t poly_randgen_irred(int t, int (*u8rnd)());
#endif /* POLY_H */
