#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#include "matrix.h"
#include "gf.h"
#include "poly.h"

/*********************************************************************************************/
////////////////////////////////////POLYNOMIAL Functions///////////////////////////////////////
/*********************************************************************************************/

poly_t poly_alloc(int d) {
  poly_t p;

  p = (poly_t) malloc(sizeof (struct polynome));
  p->deg = -1;
  p->size = d + 1;
  p->coeff = (gf_t *) calloc(p->size, sizeof (gf_t));
  return p;
}

// assumes s has the proper allocated size
poly_t poly_alloc_from_string(int d, const unsigned char * s) {
  poly_t p;

  p = (poly_t) malloc(sizeof (struct polynome));
  p->deg = -1;
  p->size = d + 1;
  p->coeff = (gf_t *) s;
  return p;
}

poly_t poly_copy(poly_t p) {
  poly_t q;

  q = (poly_t) malloc(sizeof (struct polynome));
  q->deg = p->deg;
  q->size = p->size;
  q->coeff = (gf_t *) calloc(q->size, sizeof (gf_t));
  memcpy(q->coeff, p->coeff, p->size * sizeof (gf_t));
  return q;
}

void poly_free(poly_t p) {
  free(p->coeff);
  free(p);
}

void poly_set_to_zero(poly_t p) {
  memset(p->coeff, 0, p->size * sizeof (gf_t));
  p->deg = -1;
}

int poly_calcule_deg(poly_t p) {
  int d = p->size - 1;
  while ((d >= 0) && (p->coeff[d] == gf_zero()))
    --d;
  p->deg = d;
  return d;
}

// copie q dans p
void poly_set(poly_t p, poly_t q) {
  int d = p->size - q->size;
  if (d < 0) {
    memcpy(p->coeff, q->coeff, p->size * sizeof (gf_t));
    poly_calcule_deg(p);
  }
  else {
    memcpy(p->coeff, q->coeff, q->size * sizeof (gf_t));
    memset(p->coeff + q->size, 0, d * sizeof (gf_t));
    p->deg = q->deg;
  }
}

gf_t poly_eval_aux(gf_t * coeff, gf_t a, int d) {
  gf_t b;

  b = coeff[d--];
  for (; d >= 0; --d)
    if (b != gf_zero())
      b = gf_add(gf_mul(b, a), coeff[d]);
    else
      b = coeff[d];
  return b;
}

poly_t poly_mul(poly_t p, poly_t q) {
  int i,j,dp,dq;
  poly_t r;

  poly_calcule_deg(p);
  poly_calcule_deg(q);
  dp = poly_deg(p);
  dq = poly_deg(q);
  r=poly_alloc(dp+dq);
  for (i = 0; i <= dp; ++i)
    for (j = 0; j <= dq; ++j)
      poly_addto_coeff(r,i+j,gf_mul(poly_coeff(p,i),poly_coeff(q,j)));
  poly_calcule_deg(r);

  return(r);
}

gf_t poly_eval(poly_t p, gf_t a) {
  return poly_eval_aux(p->coeff, a, poly_deg(p));
}

// p contiendra son reste modulo g
void poly_rem(poly_t p, poly_t g) {
  int i, j, d;
  gf_t a, b;

  d = poly_deg(p) - poly_deg(g);
  if (d >= 0) {
    a = gf_inv(poly_tete(g));
    for (i = poly_deg(p); d >= 0; --i, --d) {
      if (poly_coeff(p, i) != gf_zero()) {
	b = gf_mul_fast(a, poly_coeff(p, i));
	for (j = 0; j < poly_deg(g); ++j)
	  poly_addto_coeff(p, j + d, gf_mul_fast(b, poly_coeff(g, j)));
	poly_set_coeff(p, i, gf_zero());
      }
    }
    poly_set_deg(p, poly_deg(g) - 1);
    while ((poly_deg(p) >= 0) && (poly_coeff(p, poly_deg(p)) == gf_zero()))
      poly_set_deg(p, poly_deg(p) - 1);
  }
}

void poly_sqmod_init(poly_t g, poly_t * sq) {
  int i, d;

  d = poly_deg(g);

  for (i = 0; i < d / 2; ++i) {
    // sq[i] = x^(2i) mod g = x^(2i)
    poly_set_to_zero(sq[i]);
    poly_set_deg(sq[i], 2 * i);
    poly_set_coeff(sq[i], 2 * i, gf_unit());
  }

  for (; i < d; ++i) {
    // sq[i] = x^(2i) mod g = (x^2 * sq[i-1]) mod g
    memset(sq[i]->coeff, 0, 2 * sizeof (gf_t));
    memcpy(sq[i]->coeff + 2, sq[i - 1]->coeff, d * sizeof (gf_t));
    poly_set_deg(sq[i], poly_deg(sq[i - 1]) + 2);
    poly_rem(sq[i], g);
  }
}

// carré de p modulo un certain polynôme g, sq[] contient les carrés
// modulo g de la base canonique des polynômes de degré < d, où d est
// le degré de g. La table sq[] sera calculée par poly_sqmod_init()
void poly_sqmod(poly_t res, poly_t p, poly_t * sq, int d) {
  int i, j;
  gf_t a;

  poly_set_to_zero(res);

  // termes de bas degré
  for (i = 0; i < d / 2; ++i)
    poly_set_coeff(res, i * 2, gf_square(poly_coeff(p, i)));

  // termes de haut degré
  for (; i < d; ++i) {
    if (poly_coeff(p, i) != gf_zero()) {
      a = gf_square(poly_coeff(p, i));
      for (j = 0; j < d; ++j)
	poly_addto_coeff(res, j, gf_mul_fast(a, poly_coeff(sq[i], j)));
    }
  }

  // mise à jour du degré
  poly_set_deg(res, d - 1);
  while ((poly_deg(res) >= 0) && (poly_coeff(res, poly_deg(res)) == gf_zero()))
    poly_set_deg(res, poly_deg(res) - 1);
}

// destructif
poly_t poly_gcd_aux(poly_t p1, poly_t p2) {
  if (poly_deg(p2) == -1)
    return p1;
  else {
    poly_rem(p1, p2);
    return poly_gcd_aux(p2, p1);
  }
}

poly_t poly_gcd(poly_t p1, poly_t p2) {
  poly_t a, b, c;

  a = poly_copy(p1);
  b = poly_copy(p2);
  if (poly_deg(a) < poly_deg(b))
    c = poly_copy(poly_gcd_aux(b, a));
  else
    c = poly_copy(poly_gcd_aux(a, b));
  poly_free(a);
  poly_free(b);
  return c;
}

// retourne le degré du plus petit facteur
int poly_degppf(poly_t g) {
  int i, d, res;
  poly_t *u, p, r, s;

  d = poly_deg(g);
  u = malloc(d * sizeof (poly_t *));
  for (i = 0; i < d; ++i)
    u[i] = poly_alloc(d + 1);
  poly_sqmod_init(g, u);

  p = poly_alloc(d - 1);
  poly_set_deg(p, 1);
  poly_set_coeff(p, 1, gf_unit());
  r = poly_alloc(d - 1);
  res = d;
  for (i = 1; i <= (d / 2) * gf_extd(); ++i) {
    poly_sqmod(r, p, u, d);
    // r = x^(2^i) mod g
    if ((i % gf_extd()) == 0) { // donc 2^i = (2^m)^j (m deg d'extension)
      poly_addto_coeff(r, 1, gf_unit());
      poly_calcule_deg(r); // le degré peut changer
      s = poly_gcd(g, r);
      if (poly_deg(s) > 0) {
	poly_free(s);
	res = i / gf_extd();
	break;
      }
      poly_free(s);
      poly_addto_coeff(r, 1, gf_unit());
      poly_calcule_deg(r); // le degré peut changer
    }
    // on se sert de s pour l'échange
    s = p;
    p = r;
    r = s;
  }

  poly_free(p);
  poly_free(r);
  for (i = 0; i < d; ++i) {
    poly_free(u[i]);
  }
  free(u);

  return res;
}

// On suppose deg(g) >= deg(p)
void poly_eeaux(poly_t * u, poly_t * v, poly_t p, poly_t g, int t) {
  int i, j, dr, du, delta;
  gf_t a;
  poly_t aux, r0, r1, u0, u1;

  // initialisation des variables locales
  // r0 <- g, r1 <- p, u0 <- 0, u1 <- 1
  dr = poly_deg(g);

  r0 = poly_alloc(dr);
  r1 = poly_alloc(dr - 1);
  u0 = poly_alloc(dr - 1);
  u1 = poly_alloc(dr - 1);
  poly_set(r0, g);
  poly_set(r1, p);
  poly_set_to_zero(u0);
  poly_set_to_zero(u1);
  poly_set_coeff(u1, 0, gf_unit());
  poly_set_deg(u1, 0);

  // invariants:
  // r1 = u1 * p + v1 * g
  // r0 = u0 * p + v0 * g
  // et deg(u1) = deg(g) - deg(r0)
  // on s'arrête lorsque deg(r1) < t (et deg(r0) >= t)
  // et donc deg(u1) = deg(g) - deg(r0) < deg(g) - t
  du = 0;
  dr = poly_deg(r1);
  delta = poly_deg(r0) - dr;

  while (dr >= t) {
    for (j = delta; j >= 0; --j) {
      a = gf_div(poly_coeff(r0, dr + j), poly_coeff(r1, dr));
      if (a != gf_zero()) {
	// u0(z) <- u0(z) + a * u1(z) * z^j
	for (i = 0; i <= du; ++i){
	  poly_addto_coeff(u0, i + j, gf_mul_fast(a, poly_coeff(u1, i)));
	}
	// r0(z) <- r0(z) + a * r1(z) * z^j
	for (i = 0; i <= dr; ++i)
	  poly_addto_coeff(r0, i + j, gf_mul_fast(a, poly_coeff(r1, i)));
      }
    }
    // échanges
    aux = r0; r0 = r1; r1 = aux;
    aux = u0; u0 = u1; u1 = aux;

    du = du + delta;
    delta = 1;
    while (poly_coeff(r1, dr - delta) == gf_zero())
      delta++;
    dr -= delta;
  }

  poly_set_deg(u1, du);
  poly_set_deg(r1, dr);
  //return u1 and r1;
  *u=u1;
  *v=r1;

  poly_free(r0);
  poly_free(u0);
}

// le corps est déjà défini
// retourne un polynôme unitaire de degré t irreductible dans le corps
poly_t poly_randgen_irred(int t, int (*u8rnd)()) {
  int i;
  poly_t g;

  g = poly_alloc(t);
  poly_set_deg(g, t);
  poly_set_coeff(g, t, gf_unit());

  i = 0;
  do
    for (i = 0; i < t; ++i)
      poly_set_coeff(g, i, gf_rand(u8rnd));
  while (poly_degppf(g) < t);

  return g;
}


// p = p * x mod g
// p de degré <= deg(g)-1
void poly_shiftmod(poly_t p, poly_t g) {
  int i, t;
  gf_t a;

  t = poly_deg(g);
  a = gf_div(p->coeff[t-1], g->coeff[t]);
  for (i = t - 1; i > 0; --i)
    p->coeff[i] = gf_add(p->coeff[i - 1], gf_mul(a, g->coeff[i]));
  p->coeff[0] = gf_mul(a, g->coeff[0]);
}

poly_t * poly_sqrtmod_init(poly_t g) {
  int i, t;
  poly_t * sqrt, aux, p, q, * sq_aux;

  t = poly_deg(g);

  sq_aux = malloc(t * sizeof (poly_t));
  for (i = 0; i < t; ++i)
    sq_aux[i] = poly_alloc(t - 1);
  poly_sqmod_init(g, sq_aux);

  q = poly_alloc(t - 1);
  p = poly_alloc(t - 1);
  poly_set_deg(p, 1);
  poly_set_coeff(p, 1, gf_unit());
  // q(z) = 0, p(z) = z
  for (i = 0; i < t * gf_extd() - 1; ++i) {
    // q(z) <- p(z)^2 mod g(z)
    poly_sqmod(q, p, sq_aux, t);
    // q(z) <-> p(z)
    aux = q; q = p; p = aux;
  }
  // p(z) = z^(2^(tm-1)) mod g(z) = sqrt(z) mod g(z)

  sqrt = malloc(t * sizeof (poly_t));
  for (i = 0; i < t; ++i)
    sqrt[i] = poly_alloc(t - 1);

  poly_set(sqrt[1], p);
  poly_calcule_deg(sqrt[1]);
  for(i = 3; i < t; i += 2) {
    poly_set(sqrt[i], sqrt[i - 2]);
    poly_shiftmod(sqrt[i], g);
    poly_calcule_deg(sqrt[i]);
  }

  for (i = 0; i < t; i += 2) {
    poly_set_to_zero(sqrt[i]);
    sqrt[i]->coeff[i / 2] = gf_unit();
    sqrt[i]->deg = i / 2;
  }

  for (i = 0; i < t; ++i)
    poly_free(sq_aux[i]);
  free(sq_aux);
  poly_free(p);
  poly_free(q);

  return sqrt;
}

poly_t * poly_syndrome_init(poly_t generator, gf_t *support, int n)
{
  int i,j,t;
  gf_t a;
  poly_t * F;

  F = malloc(n * sizeof (poly_t));
  t = poly_deg(generator);

  //g(z)=g_t+g_(t-1).z^(t-1)+......+g_1.z+g_0
  //f(z)=f_(t-1).z^(t-1)+......+f_1.z+f_0

  for(j=0;j<n;j++)
    {
      F[j] = poly_alloc(t-1);
      poly_set_coeff(F[j],t-1,gf_unit());
      for(i=t-2;i>=0;i--)
	{
	  poly_set_coeff(F[j],i,gf_add(poly_coeff(generator,i+1),
				       gf_mul(support[j],poly_coeff(F[j],i+1))));
	}
      a = gf_add(poly_coeff(generator,0),gf_mul(support[j],poly_coeff(F[j],0)));
      for(i=0;i<t;i++)
	{
	  poly_set_coeff(F[j],i, gf_div(poly_coeff(F[j],i),a));
	}
    }

  return F;
}
