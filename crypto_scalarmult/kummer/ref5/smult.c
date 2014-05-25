#include <stdio.h>
#include "crypto_scalarmult.h"
#include "crypto_uint32.h"
#include "gfe.h"

extern const double stepconsts[4];
extern const double hadstepconsts[4];
extern const unsigned char _one[16];

static void cswap4x(gfe *x, gfe *y, int b)
{
  crypto_uint32 db =  -b;
  crypto_int32 t;
  int i,j;
  for(i=0;i<4;i++)
    for(j=0;j<5;j++)
    {
      t = x[i].v[j] ^ y[i].v[j];
      t &= db;
      x[i].v[j] ^= t;
      y[i].v[j] ^= t;
    }
}
  
static const crypto_int32 bbccdd = -1254; 
static const crypto_int32 aaccdd = 627; 
static const crypto_int32 aabbdd = 726; 
static const crypto_int32 aabbcc = 4598;

static const crypto_int32 BBCCDD = 9163;
static const crypto_int32 AACCDD = -27489;
static const crypto_int32 AABBDD = -17787;
static const crypto_int32 AABBCC = -6171;


void ladderstep(gfe work[11]) 
{
    gfe_hadamard(work+7);
    gfe_hadamard(work+3);
    
    gfe_mul(work+ 7,work+ 7,work+3);
    gfe_mul(work+ 8,work+ 8,work+4);
    gfe_mul(work+ 9,work+ 9,work+5);
    gfe_mul(work+10,work+10,work+6);
   
    gfe_square(work+3,work+3);
    gfe_square(work+4,work+4);
    gfe_square(work+5,work+5);
    gfe_square(work+6,work+6);

  
    gfe_mulconst(work+ 7,work+ 7,BBCCDD);
    gfe_mulconst(work+ 8,work+ 8,AACCDD);
    gfe_mulconst(work+ 9,work+ 9,AABBDD);
    gfe_mulconst(work+10,work+10,AABBCC);
 
    gfe_mulconst(work+ 3,work+ 3,BBCCDD);
    gfe_mulconst(work+ 4,work+ 4,AACCDD);
    gfe_mulconst(work+ 5,work+ 5,AABBDD);
    gfe_mulconst(work+ 6,work+ 6,AABBCC);

    gfe_hadamard(work+7);
    gfe_hadamard(work+3);

    gfe_square(work+ 7,work+ 7);
    gfe_square(work+ 8,work+ 8);
    gfe_square(work+ 9,work+ 9);
    gfe_square(work+10,work+10);
    
    gfe_square(work+3,work+3);
    gfe_square(work+4,work+4);
    gfe_square(work+5,work+5);
    gfe_square(work+6,work+6);
    
    gfe_mul(work+ 8,work+ 8,work+0);
    gfe_mul(work+ 9,work+ 9,work+1);
    gfe_mul(work+10,work+10,work+2);
    
    gfe_mulconst(work+ 3,work+ 3,bbccdd);
    gfe_mulconst(work+ 4,work+ 4,aaccdd);
    gfe_mulconst(work+ 5,work+ 5,aabbdd);
    gfe_mulconst(work+ 6,work+ 6,aabbcc);
}

static void ladder(gfe work[11], const unsigned char scalar[32])
{
  int i,j;
  int bit;

  j=2;
  for(i=31;i>=0;i--)
  {
    for(;j>=0;j--)
    {
      bit = (scalar[i]>>j) & 1;
      cswap4x(work+3,work+7,bit);
      ladderstep(work);
      cswap4x(work+3,work+7,bit);

    }
    j = 7;
  }
}

static const gfe aa = {{11,0,0,0,0}};
static const gfe bb = {{-22,0,0,0,0}};
static const gfe cc = {{-19,0,0,0,0}};
static const gfe dd = {{ -3,0,0,0,0}};

int crypto_scalarmult(unsigned char *q, const unsigned char *n, const unsigned char *p)
{
  gfe work[11];
  gfe yz,yzt,r,tr;

  gfe_unpack(&work[0], p);    /* xy1 */
  gfe_unpack(&work[1], p+16); /* xz1 */
  gfe_unpack(&work[2], p+32); /* xt1 */

  work[3] = aa;
  work[4] = bb;
  work[5] = cc;
  work[6] = dd;

  gfe_mul(&work[10], &work[ 0], &work[1]); /* xy1 * xz1 */
  gfe_mul(&work[ 9], &work[ 0], &work[2]); /* xy1 * xt1 */
  gfe_mul(&work[ 8], &work[ 1], &work[2]); /* xz1 * xt1 */
  gfe_mul(&work[ 7], &work[10], &work[2]); /* t3  * xt1 */

  ladder(work, n);

  gfe_mul(&yz,work+4,work+5);
  gfe_mul(&yzt,&yz,work+6);
  gfe_invert(&r,&yzt);
  gfe_mul(&r,&r,work+3);
  gfe_mul(&tr,&r,work+6);
  gfe_mul(work+5,work+5,&tr);
  gfe_pack(q,work+5);
  gfe_mul(work+4,work+4,&tr);
  gfe_pack(q+16,work+4);
  gfe_mul(&yz, &yz ,&r);
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
