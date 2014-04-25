#include "crypto_scalarmult.h"
#include "gfe.h"

extern const unsigned char _one[16];

static const gfe4x znegatedaabbccdd = {{
  11., -22.,  19., -3.,
   0.,   0.,   0.,  0.,
   0.,   0.,   0.,  0.,
   0.,   0.,   0.,  0.,
   0.,   0.,   0.,  0.,
   0.,   0.,   0.,  0.}};

int crypto_scalarmult(unsigned char *q, const unsigned char *n, const unsigned char *p)
{
  gfe4x work[4];
  unsigned char b[64];
  gfe res[4],yz,yzt,r,tr,t3,x3,y3,z3;

  gfe4x_unpack(work,_one,0); /*   1 */
  gfe4x_unpack(work,p,1);    /* xy1 */
  gfe4x_unpack(work,p+16,2); /* xz1 */
  gfe4x_unpack(work,p+32,3); /* xt1 */

  gfe_unpack(&x3,p);    /* x/y */
  gfe_unpack(&y3,p+16); /* x/z */
  gfe_unpack(&z3,p+32); /* x/t */
  gfe_mul(&t3,&x3,&y3); /* xx/yz = xxt/yzt */
  gfe_mul(&y3,&y3,&z3); /* xx/zt = xxy/yzt */
  gfe_mul(&z3,&z3,&x3); /* xx/yt = xxz/yzt */
  gfe_mul(&x3,&x3,&y3); /* xxx/yzt */

  gfe_pack(b,&x3);
  gfe_pack(b + 16,&y3);
  gfe_pack(b + 32,&z3);
  gfe_pack(b + 48,&t3);
  gfe4x3limb_unpack(work+2,b,0);
  gfe4x3limb_unpack(work+2,b + 16,1);
  gfe4x3limb_unpack(work+2,b + 32,2);
  gfe4x3limb_unpack(work+2,b + 48,3);

  work[1] = znegatedaabbccdd;

  gfe4x_znegate(work);
  gfe4x_znegate(work + 2);
  ladder(work, n);
  gfe4x_znegate(work + 1);

  gfe4x3limb_split(res, work+1);

  gfe_mul(&yz,res+1,res+2);
  gfe_mul(&yzt,&yz,res+3);
  gfe_invert(&r,&yzt);
  gfe_mul(&r,&r,res);
  gfe_mul(&tr,&r,res+3);

  gfe_mul(res+2,res+2,&tr);
  gfe_mul(res+1,res+1,&tr);
  gfe_mul(&yz, &yz ,&r);
  gfe_pack(q,res+2);
  gfe_pack(q+16,res+1);
  gfe_pack(q+32,&yz);

  return 0;
}

static const unsigned char base[48] = {
  6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0x68,0x30,0x1e,0x6b,0x4d,0xaf,0xc7,0x56,0x9d,0x1f,0xa7,0xf8,0x71,0x39,0x37,0x6b,
  1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

int crypto_scalarmult_base(unsigned char *q, const unsigned char *n)
{
  return crypto_scalarmult(q,n,base);
}
