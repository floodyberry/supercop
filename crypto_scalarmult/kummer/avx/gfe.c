#include "gfe.h"

typedef unsigned long long u64;


extern const double _2pm22[4];
extern const double _2pm43[4];
extern const double _2pm64[4];
extern const double _2pm85[4];
extern const double _2pm106[4];
extern const double _2pm127[4];

void gfe_invert(gfe *r, const gfe *x)
{
  gfe x2,x3,x12,x15,x30,x_5_0, x_10_0, x_20_0, x_40_0, x_80_0, x_120_0, x_125_0, t;

  gfe_square(&x2, x);                     /* 2 */
  gfe_mul(&x3,&x2,x);                     /* 3 mult */
  gfe_nsquare(&x12,&x3,2);                /* 12 */
  gfe_mul(&x15,&x12,&x3);                 /* 15 mult */
  gfe_square(&x30, &x15);                 /* 30 */
  gfe_mul(&x_5_0, &x30, x);               /* 31 = 2^5-1 mult */

  gfe_nsquare(&t,&x_5_0,5);               /* 2^10-2^5 */
  gfe_mul(&x_10_0,&t,&x_5_0);             /* 2^10-1 mult */

  gfe_nsquare(&t,&x_10_0,10);             /* 2^20-2^10 */
  gfe_mul(&x_20_0,&t,&x_10_0);            /* 2^20-1 mult */

  gfe_nsquare(&t,&x_20_0,20);             /* 2^40-2^20 */
  gfe_mul(&x_40_0,&t,&x_20_0);            /* 2^40-1 mult */

  gfe_nsquare(&t,&x_40_0,40);             /* 2^80-2^40 */
  gfe_mul(&x_80_0,&t,&x_40_0);            /* 2^80-1 mult */

  gfe_nsquare(&t,&x_80_0,40);             /* 2^120-2^40 */
  gfe_mul(&x_120_0,&t,&x_40_0);           /* 2^120-1 mult */

  gfe_nsquare(&t,&x_120_0,5);             /* 2^125-2^5 */
  gfe_mul(&x_125_0, &t, &x_5_0);          /* 2^126-1 mult */

  gfe_nsquare(&t,&x_125_0,2);             /* 2^127-2^2 */
  gfe_mul(r,&t,x);                        /* 2^127-3 mult */
}

void gfe_unpack(gfe *r, const unsigned char *x)
{
  int i;
  r->v[0] = 0;
  for(i=0;i<8;i++)
    r->v[0] |= ((unsigned long long)x[i] << 8*i);
  r->v[1] = 0;
  for(i=0;i<8;i++)
    r->v[1] |= ((unsigned long long)x[i+8] << 8*i);
  r->v[1] &= 0x7fffffffffffffff;
}

void gfe_pack(unsigned char *r, const gfe *x)
{
  int i;
  for(i=0;i<8;i++)
    r[i] = (x->v[0] >> 8*i) & 0xff;
  for(i=0;i<8;i++)
    r[8+i] = (x->v[1] >> 8*i) & 0xff;
}

void gfe4x3limb_split(gfe *r, const gfe4x *x)
{
  gfe4x t;
  int i;
  gfe4x3limb_freeze(&t, x);
  for(i=0;i<4;i++)
  {
    r[i].v[0]  =  (unsigned long long) t.v[i];
    r[i].v[0] |= ((unsigned long long) t.v[i+8]) << 43;
    r[i].v[1]  = ((unsigned long long) t.v[i+8]) >> 21;
    r[i].v[1] |= ((unsigned long long) t.v[i+16]) << 21;
  }
}


void gfe4x_unpack(gfe4x *r, const unsigned char x[16], int pos)
{
    r->v[ 0+pos]  = (double)( (u64)(x[ 0])       ^ ((u64)x[ 1] << 8)                        ^ ((u64)x[ 2] & 0x3f) << 16);
    r->v[ 4+pos]  = (double)(((u64)(x[ 2]) >> 6) ^ ((u64)x[ 3] << 2) ^ ((u64)x[ 4] << 10) ^ ((u64)x[ 5] & 0x07) << 18);
    r->v[ 4+pos] *= 4194304.; /* 2^22 */
    r->v[ 8+pos]  = (double)(((u64)(x[ 5]) >> 3) ^ ((u64)x[ 6] << 5) ^ ((u64)x[ 7] << 13));
    r->v[ 8+pos] *= 8796093022208.; /* 2^43 */
    r->v[12+pos]  = (double)( (u64)(x[ 8])       ^ ((u64)x[ 9] << 8)                        ^ ((u64)x[10] & 0x1f) << 16);
    r->v[12+pos] *= 18446744073709551616.; /* 2^64 */
    r->v[16+pos]  = (double)(((u64)(x[10]) >> 5) ^ ((u64)x[11] << 3) ^ ((u64)x[12] << 11) ^ ((u64)x[13] & 0x03) << 19);
    r->v[16+pos] *= 38685626227668133590597632.; /* 2^85 */
    r->v[20+pos]  = (double)(((u64)(x[13]) >> 2) ^ ((u64)x[14] << 6)                        ^ ((u64)x[15] & 0x7f) << 14);
    r->v[20+pos] *= 81129638414606681695789005144064.; /* 2^106 */
}

void gfe4x3limb_unpack(gfe4x *r, const unsigned char x[16], int pos)
{
    r->v[ 0+pos]  = (double)(  (u64)x[ 0]       
                           ^ ( (u64)x[ 1]       <<  8)                        
                           ^ ( (u64)x[ 2]       << 16)
                           ^ ( (u64)x[ 3]       << 24)
                           ^ ( (u64)x[ 4]       << 32)
                           ^ (((u64)x[ 5] &  7) << 40));
    r->v[ 8+pos]  = (double)(( (u64)x[ 5]       >>  3)
                           ^ ( (u64)x[ 6]       <<  5)                        
                           ^ ( (u64)x[ 7]       << 13)                        
                           ^ ( (u64)x[ 8]       << 21)                        
                           ^ ( (u64)x[ 9]       << 29)                        
                           ^ (((u64)x[10] & 31) << 37));                       
    r->v[ 8+pos] *= 8796093022208.; /* 2^43 */
    r->v[16+pos]  = (double)( ((u64)x[10]       >>  5)
                           ^ ( (u64)x[11]       <<  3)                        
                           ^ ( (u64)x[12]       << 11)                        
                           ^ ( (u64)x[13]       << 19)                        
                           ^ ( (u64)x[14]       << 27)                        
                           ^ ( (u64)x[15]       << 35));
    r->v[16+pos] *= 38685626227668133590597632.; /* 2^85 */
    /*
    r->v[ 4+pos] = 0.; //XXX: eliminate
    r->v[12+pos] = 0.; //XXX: eliminate
    r->v[20+pos] = 0.; //XXX: eliminate
    */
}
