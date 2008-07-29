#include<stdio.h>
#include<stdlib.h>

#include "gf.h"

#define PPOLY 0x0805//0x100b//0x100b//x^11+x^2+1

/*********************************************************************************************/
////////////////////////////////////GF Functions.//////////////////////////////////////////////
/*********************************************************************************************/

// construct the table gf_exp[i]=alpha^i
void gf_init_exp() {
  int i;

  gf_exp[0] = 1;
  for (i = 1; i < gf_ord(); ++i) {
    gf_exp[i] = gf_exp[i - 1] << 1;
    if (gf_exp[i - 1] & (1 << (gf_extd()-1)))
      gf_exp[i] ^= PPOLY;
  }
  // hack pour la multiplication
  gf_exp[gf_ord()] = 1;
}

// contruit la table gf_log[alpha^i]=i
void gf_init_log()
{
  int i;

  gf_log[0] = gf_ord();//(1 << 16) - 1; // log de 0 par convention
  for (i = 0; i < gf_ord() ; ++i)
    gf_log[gf_exp[i]] = i;
}

int init_done = 0;

int gf_init(int extdeg)
{
  if (extdeg != gf_extd()) {
    // wrong extension degree
    return -1;
  }
  if (!init_done) {
    gf_init_exp();
    gf_init_log();
    init_done = 1;
  }
  return 1;
}

// on suppose i >= 0. Par convention 0^0 = 1
gf_t gf_pow(gf_t x, int i) {
  if (i == 0)
    return 1;
  else if (x == 0)
    return 0;
  else {
    // i mod (q-1)
    while (i >> gf_extd())
      i = (i & (gf_ord())) + (i >> gf_extd());
    i *= gf_log[x];
    while (i >> gf_extd())
      i = (i & (gf_ord())) + (i >> gf_extd());
    return gf_exp[i];
  }
}

// u8rnd is a function returning a random byte
gf_t gf_rand(int (*u8rnd)()) {
  return (u8rnd() ^ (u8rnd() << 8)) & gf_ord();
}
