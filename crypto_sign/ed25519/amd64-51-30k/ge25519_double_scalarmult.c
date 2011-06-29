#include "fe25519.h"
#include "sc25519.h"
#include "ge25519.h"

static void setneutral(ge25519 *r)
{
  fe25519_setint(&r->x,0);
  fe25519_setint(&r->y,1);
  fe25519_setint(&r->z,1);
  fe25519_setint(&r->t,0);
}

/* computes [s1]p1 + [s2]p2 */
void ge25519_double_scalarmult_vartime(ge25519_p3 *r, const ge25519_p3 *p1, const sc25519 *s1, const ge25519_p3 *p2, const sc25519 *s2)
{
  ge25519_p1p1 tp1p1;
  ge25519_p3 pre[16];
  unsigned char b[127];
  int i;

  /* precomputation                                                                        s2 s1 */
  setneutral(pre);                                                                      /* 00 00 */
  pre[1] = *p1;                                                                         /* 00 01 */
  ge25519_dbl_p1p1(&tp1p1,(ge25519_p2 *)p1);      ge25519_p1p1_to_p3( &pre[2], &tp1p1); /* 00 10 */
  ge25519_add_p1p1(&tp1p1,&pre[1], &pre[2]);      ge25519_p1p1_to_p3( &pre[3], &tp1p1); /* 00 11 */
  pre[4] = *p2;                                                                         /* 01 00 */
  ge25519_add_p1p1(&tp1p1,&pre[1], &pre[4]);      ge25519_p1p1_to_p3( &pre[5], &tp1p1); /* 01 01 */
  ge25519_add_p1p1(&tp1p1,&pre[2], &pre[4]);      ge25519_p1p1_to_p3( &pre[6], &tp1p1); /* 01 10 */
  ge25519_add_p1p1(&tp1p1,&pre[3], &pre[4]);      ge25519_p1p1_to_p3( &pre[7], &tp1p1); /* 01 11 */
  ge25519_dbl_p1p1(&tp1p1,(ge25519_p2 *)p2);      ge25519_p1p1_to_p3( &pre[8], &tp1p1); /* 10 00 */
  ge25519_add_p1p1(&tp1p1,&pre[1], &pre[8]);      ge25519_p1p1_to_p3( &pre[9], &tp1p1); /* 10 01 */
  ge25519_dbl_p1p1(&tp1p1,(ge25519_p2 *)&pre[5]); ge25519_p1p1_to_p3(&pre[10], &tp1p1); /* 10 10 */
  ge25519_add_p1p1(&tp1p1,&pre[3], &pre[8]);      ge25519_p1p1_to_p3(&pre[11], &tp1p1); /* 10 11 */
  ge25519_add_p1p1(&tp1p1,&pre[4], &pre[8]);      ge25519_p1p1_to_p3(&pre[12], &tp1p1); /* 11 00 */
  ge25519_add_p1p1(&tp1p1,&pre[1],&pre[12]);      ge25519_p1p1_to_p3(&pre[13], &tp1p1); /* 11 01 */
  ge25519_add_p1p1(&tp1p1,&pre[2],&pre[12]);      ge25519_p1p1_to_p3(&pre[14], &tp1p1); /* 11 10 */
  ge25519_add_p1p1(&tp1p1,&pre[3],&pre[12]);      ge25519_p1p1_to_p3(&pre[15], &tp1p1); /* 11 10 */

  sc25519_2interleave2(b,s1,s2);

  /* scalar multiplication */
  *r = pre[b[126]];
  for(i=125;i>=0;i--)
  {
    ge25519_dbl_p1p1(&tp1p1, (ge25519_p2 *)r);
    ge25519_p1p1_to_p2((ge25519_p2 *) r, &tp1p1);
    ge25519_dbl_p1p1(&tp1p1, (ge25519_p2 *)r);
    if(b[i]!=0)
    {
      ge25519_p1p1_to_p3(r, &tp1p1);
      ge25519_add_p1p1(&tp1p1, r, &pre[b[i]]);
    }
    if(i != 0) ge25519_p1p1_to_p2((ge25519_p2 *)r, &tp1p1);
    else ge25519_p1p1_to_p3(r, &tp1p1);
  }
}
