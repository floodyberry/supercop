#ifndef GF_H
#define GF_H

typedef unsigned short gf_t;

/* Certaines operations sont definies par des macros */

#define gf_extd() 11
#define gf_card() (1 << gf_extd())
#define gf_ord() ((1 << gf_extd()) - 1)

gf_t gf_log[1 << gf_extd()];
gf_t gf_exp[1 << gf_extd()];


#define gf_unit() 1
#define gf_zero() 0
#define gf_add(x, y) ((x) ^ (y))
#define gf_exp(i) gf_exp[i] /* alpha^i */
#define gf_log(x) gf_log[x] /* retourne i si x=alpha^i */

// résidu modulo q-1
// si -q < d < 0, on obtient q-1+d
// si 0 <= d < q, on obtient d
// si q <= d < 2q-1, on obtient d-q+1
#define _gf_modq_1(d) (((d) & gf_ord()) + ((d) >> gf_extd()))
// on obtient une valeur entre 0 et q-1 compris, la classe de 0 peut
// être représentée par 0 ou q-1 (c'est pour ça que
// _K->exp[q-1]=_K->exp[0]=1)

#define gf_mul_fast(x, y) ((y) ? gf_exp[_gf_modq_1(gf_log[x] + gf_log[y])] : 0)
#define gf_mul(x, y) ((x) ? gf_mul_fast(x, y) : 0)
#define gf_square(x) ((x) ? gf_exp[_gf_modq_1(gf_log[x] << 1)] : 0)
#define gf_sqrt(x) ((x) ? gf_exp[_gf_modq_1(gf_log[x] << (gf_extd()-1))] : 0)
// celui qui divise par zero aura ce qu'il mérite !
#define gf_div(x, y) ((x) ? gf_exp[_gf_modq_1(gf_log[x] - gf_log[y])] : 0)
#define gf_inv(x) gf_exp[gf_ord() - gf_log[x]]

/****** gf.c ******/

int gf_init(int extdeg);
gf_t gf_rand(int (*u8rnd)());
gf_t gf_pow(gf_t x, int i);

#endif /* GF_H */
