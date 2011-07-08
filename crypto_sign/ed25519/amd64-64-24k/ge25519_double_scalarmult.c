#include "fe25519.h"
#include "sc25519.h"
#include "ge25519.h"

#define S1_SWINDOWSIZE 5
#define PRE1_SIZE (1<<(S1_SWINDOWSIZE-2))
#define S2_SWINDOWSIZE 7
#define PRE2_SIZE (1<<(S2_SWINDOWSIZE-2))

ge25519_niels pre2[PRE2_SIZE] = {
#include "ge25519_base_slide_multiples.data"
};

static void setneutral(ge25519 *r)
{
  fe25519_setint(&r->x,0);
  fe25519_setint(&r->y,1);
  fe25519_setint(&r->z,1);
  fe25519_setint(&r->t,0);
}

/* computes [s1]p1 + [s2]p2 */
void ge25519_double_scalarmult_vartime(ge25519_p3 *r, const ge25519_p3 *p1, const sc25519 *s1, const sc25519 *s2)
{
  signed char slide1[256], slide2[256];
  ge25519_p3 pre1[PRE1_SIZE], d1;
  ge25519_p1p1 t;
  ge25519_p3 neg;
  ge25519_niels nneg;
  fe25519 d;
  int i;
  
  sc25519_slide(slide1, s1, S1_SWINDOWSIZE);
  sc25519_slide(slide2, s2, S2_SWINDOWSIZE);

  /* precomputation */
  pre1[0] = *p1;                                                                         
  ge25519_dbl_p1p1(&t,(ge25519_p2 *)pre1);      ge25519_p1p1_to_p3(&d1, &t);

  for(i=0;i<PRE1_SIZE-1;i++)
  {
    ge25519_add_p1p1(&t, &pre1[i], &d1);      ge25519_p1p1_to_p3(&pre1[i+1], &t);
  }

  setneutral(r);
  for (i = 255;i >= 0;--i) {
    if (slide1[i] || slide2[i]) goto firstbit;
  }

  for(;i>=0;i--)
  {
    firstbit:

    ge25519_dbl_p1p1(&t, (ge25519_p2 *)r);

    if(slide1[i]>0)
    {
      ge25519_p1p1_to_p3(r, &t);
      ge25519_add_p1p1(&t, r, &pre1[slide1[i]/2]);
    }
    else if(slide1[i]<0)
    {
      ge25519_p1p1_to_p3(r, &t);
      neg = pre1[-slide1[i]/2];
      fe25519_neg(&neg.x, &neg.x);
      fe25519_neg(&neg.t, &neg.t);
      ge25519_add_p1p1(&t, r, &neg);
    }

    if(slide2[i]>0)
    {
      ge25519_p1p1_to_p3(r, &t);
      ge25519_nielsadd_p1p1(&t, r, &pre2[slide2[i]/2]);
    }
    else if(slide2[i]<0)
    {
      ge25519_p1p1_to_p3(r, &t);
      nneg = pre2[-slide2[i]/2];
      d = nneg.ysubx;
      nneg.ysubx = nneg.xaddy;
      nneg.xaddy = d;
      fe25519_neg(&nneg.t2d, &nneg.t2d);
      ge25519_nielsadd_p1p1(&t, r, &nneg);
    }

    ge25519_p1p1_to_p2((ge25519_p2 *)r, &t);
  }
}
