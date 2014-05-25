#include "smult.h"
#include "gfex2.h"
#include "gfex4.h"

static const unsigned char __attribute__((aligned(32))) one[16] = {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
static const unsigned char __attribute__((aligned(32))) _28[16]       = {0xf8,0xff,0xff,0x0f,0xf8,0xff,0xff,0x0f,0xf8,0xff,0xff,0x0f,0xf8,0xff,0xff,0x0f};
static const unsigned char __attribute__((aligned(32))) _2928[16]     = {0xf8,0xff,0xff,0x1f,0xf8,0xff,0xff,0x1f,0xf8,0xff,0xff,0x0f,0xf8,0xff,0xff,0x0f};
static const unsigned char __attribute__((aligned(32))) _27[16]       = {0xfc,0xff,0xff,0x07,0xfc,0xff,0xff,0x07,0xfc,0xff,0xff,0x07,0xfc,0xff,0xff,0x07};
static const unsigned char __attribute__((aligned(32))) _28272827[16] = {0xfc,0xff,0xff,0x0f,0xfc,0xff,0xff,0x07,0xfc,0xff,0xff,0x0f,0xfc,0xff,0xff,0x07};
static const unsigned char __attribute__((aligned(32))) _mask25[16]   = {0xff,0xff,0xff,0x01,0x00,0x00,0x00,0x00,0xff,0xff,0xff,0x01,0x00,0x00,0x00,0x00};
static const unsigned char __attribute__((aligned(32))) _mask26[16]   = {0xff,0xff,0xff,0x03,0x00,0x00,0x00,0x00,0xff,0xff,0xff,0x03,0x00,0x00,0x00,0x00};

static const gfex4 con1 = {{//bbccdd, aaccdd, aabbdd, aabbcc
         114,        57,         0,         0,         0,         0,         0,         0,         0,         0,
           0,         0,        66,       418,         0,         0,         0,         0,         0,         0}};

static const gfex4 con2 = {{//BBCCDD, AACCDD, AABBDD, AABBCC
         833,      2499,         0,         0,         0,         0,         0,         0,         0,         0,
           0,         0,      1617,       561,         0,         0,         0,         0,         0,         0}};




  static gfex4 xyzt3;
  static gfex4 xyzt2; 
  static gfex4 _1xyz;
  static unsigned char __attribute__((aligned(32))) c[32];
  static unsigned char __attribute__((aligned(32))) _const[96];
  
  static gfex4 xyzt2_i;
  static gfex2 x_x;
  static gfex4 xxxx;
  static gfex4 result;
  static unsigned char __attribute__((aligned(32))) xyzt2p[64];
  static unsigned char __attribute__((aligned(32))) resultp[64];
  static gfex4 xyzt3_i;
  static unsigned char __attribute__((aligned(32))) r[32];

  static unsigned char __attribute__((aligned(32))) cp1[64], cp2[64];

  static const unsigned char __attribute__((aligned(32))) xyzt2_[64] = {
     11  , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0,-22-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,127,
    -19-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,127,- 3-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,127};

int smult(unsigned char *q, const unsigned char *n, const unsigned char *p)
{

  gfex2 xx,zy,xz_xy;
  gfex2 xyy,zz,xyz_yz;
  gfex2 _1xyz_0,_1xyz_1;
  int i;
  int j;
  int bit;

  gfex2_unpack2(&xx,p,p);		/* x0 x0 x1 x1 x2 x2 x3 x3 x4 x4 */
  gfex2_unpack2(&zy,p+32,p+16);		/* z0 y0 z1 y1 z2 y2 z3 y3 z4 y4 */
  gfex2_mul(&xz_xy,&xx,&zy);		/* x0z0 x0y0 x1z1 x1y1 x2z2 x2y2 x3z3 x3y3 x4z4 x4y4 */

  gfex2_pack(r,&xz_xy);			/* x0z0 x1z1 x2z2 x3z3 x0y0 x1y1 x2y2 x3y3 */
  gfex2_unpack2(&xyy,r+16,p+16);	/* x0y0 y0 x1y1 y1 x2y2 y2 x3y3 y3 x4y4 y4 */
  gfex2_unpack2(&zz,p+32,p+32);		/* z0 z0 z1 z1 z2 z2 z3 z3 z4 z4 */
  gfex2_mul(&xyz_yz,&xyy,&zz);		/* x0y0zy y0z0 x1y1z1 y1z1 x2y2z2 y2z2 x3y3z3 y3z3 x4y4z4 y4z4 */


  gfex4_merge(&xyzt3,&xyz_yz,&xz_xy);


  gfex4_unpack(&xyzt2,xyzt2_);


  gfex2_unpack2(&_1xyz_0,one,p);
  gfex2_unpack2(&_1xyz_1,p+16,p+32);
  gfex4_merge(&_1xyz,&_1xyz_0,&_1xyz_1);


  gfex4_pack(cp1,&con1);
  gfex4_pack(cp2,&con2);
  for(j=0; j<4; j++) {
    c[j]    = cp1[j];		c[16+j]    = cp2[j];
    c[j+4]  = cp1[j+16];	c[16+j+4]  = cp2[j+16];
    c[j+8]  = cp1[j+32];	c[16+j+8]  = cp2[j+32];
    c[j+12] = cp1[j+48];	c[16+j+12] = cp2[j+48];
  }

  for(j=0; j<16; j++) {
    _const[j]    = _mask25[j];
    _const[j+16] = _mask26[j];
    _const[j+32] = _28[j];
    _const[j+48] = _2928[j];
    _const[j+64] = _27[j];
    _const[j+80] = _28272827[j];
  }


  loop(&xyzt3,&xyzt2,&_1xyz,c,n,&_const[0]);
  bit = n[0]&1;
  cswap(&xyzt2,&xyzt3,1 ^ bit);





  invert(&xyzt2_i,&xyzt2);
  gfex4_pack(xyzt2p,&xyzt2);
  gfex2_unpack2(&x_x,xyzt2p,xyzt2p);
  gfex4_merge(&xxxx,&x_x,&x_x);
  mul(&result,&xxxx,&xyzt2_i);
  gfex4_pack(resultp,&result);
  for(i=0; i<48; i++) {
    q[i] = resultp[i+16];
  }
  return 0;
}



static const unsigned char __attribute__((aligned(32))) base[48] = {
  6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  104,48,30,107,77,175,199,86,157,31,167,248,113,57,55,107,
  1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};


int smult_base(unsigned char *q, const unsigned char *n)
{
  return smult(q,n,base);
}
