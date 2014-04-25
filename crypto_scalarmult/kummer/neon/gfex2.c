#include "gfex2.h"

void gfex2_pack(unsigned char *r, const gfex2 *x)	/* a0 a1 a2 a3 b0 b1 b2 b3 <- a0 b0 a1 b1 a2 b2 a3 b3 a4 b4 */
{
  unsigned int t[5],u[5];
  int i;

  for(i=0; i<5; i++) {
    t[i] = x->v[i*2];
    u[i] = x->v[i*2+1];
  }

  t[0]  = t[0];
  t[1]  = t[1] + (t[0] >> 26);
  t[0] &= 0x3ffffff;
  t[2]  = t[2] + (t[1] >> 25);
  t[1] &= 0x1ffffff;
  t[3]  = t[3] + (t[2] >> 26);
  t[2] &= 0x3ffffff;
  t[4]  = t[4] + (t[3] >> 25);
  t[3] &= 0x1ffffff;
  t[0]  = t[0] + (t[4] >> 25);
  t[4] &= 0x1ffffff;
  t[1]  = t[1] + (t[0] >> 26);
  t[0] &= 0x3ffffff;

  u[0]  = u[0];
  u[1]  = u[1] + (u[0] >> 26);
  u[0] &= 0x3ffffff;
  u[2]  = u[2] + (u[1] >> 25);
  u[1] &= 0x1ffffff;
  u[3]  = u[3] + (u[2] >> 26);
  u[2] &= 0x3ffffff;
  u[4]  = u[4] + (u[3] >> 25);
  u[3] &= 0x1ffffff;
  u[0]  = u[0] + (u[4] >> 25);
  u[4] &= 0x1ffffff;
  u[1]  = u[1] + (u[0] >> 26);
  u[0] &= 0x3ffffff;

  r[0] = ( t[0] & 0xff);
  r[1] = ((t[0] >>  8) & 0xff);
  r[2] = ((t[0] >> 16) & 0xff);
  r[3] = ((t[0] >> 24) & 0x03) | ((t[1] & 0x3f) << 2);
  
  r[4] = ((t[1] >>  6) & 0xff);
  r[5] = ((t[1] >> 14) & 0xff);
  r[6] = ((t[1] >> 22) & 0x07) | ((t[2] & 0x1f) << 3);
  r[7] = ((t[2] >>  5) & 0xff);

  r[8]  = ((t[2] >> 13) & 0xff);
  r[9]  = ((t[2] >> 21) & 0x1f) | ((t[3] & 0x07) << 5);
  r[10] = ((t[3] >>  3) & 0xff);
  r[11] = ((t[3] >> 11) & 0xff);

  r[12] = ((t[3] >> 19) & 0x3f) | ((t[4] & 0x03) << 6);
  r[13] = ((t[4] >>  2) & 0xff);
  r[14] = ((t[4] >> 10) & 0xff);
  r[15] = ((t[4] >> 18) & 0xff);


  r[16] =  (u[0] & 0xff);
  r[17] = ((u[0] >>  8) & 0xff);
  r[18] = ((u[0] >> 16) & 0xff);
  r[19] = ((u[0] >> 24) & 0x03) | ((u[1] & 0x3f) << 2);
  
  r[20] = ((u[1] >>  6) & 0xff);
  r[21] = ((u[1] >> 14) & 0xff);
  r[22] = ((u[1] >> 22) & 0x07) | ((u[2] & 0x1f) << 3);
  r[23] = ((u[2] >>  5) & 0xff);

  r[24] = ((u[2] >> 13) & 0xff);
  r[25] = ((u[2] >> 21) & 0x1f) | ((u[3] & 0x07) << 5);
  r[26] = ((u[3] >>  3) & 0xff);
  r[27] = ((u[3] >> 11) & 0xff);

  r[28] = ((u[3] >> 19) & 0x3f) | ((u[4] & 0x03) << 6);
  r[29] = ((u[4] >>  2) & 0xff);
  r[30] = ((u[4] >> 10) & 0xff);
  r[31] = ((u[4] >> 18) & 0xff);

}



void gfex2_unpack(gfex2 *r, const unsigned char b[32])	/* a0 b0 a1 b1 a2 b2 a3 b3 a4 b4 <- a0 a1 a2 a3 b0 b1 b2 b3 */
{
  r->v[0]  = b[0];
  r->v[0] |= ((crypto_uint32)b[1] << 8);
  r->v[0] |= ((crypto_uint32)b[2] << 16);
  r->v[0] |= (((crypto_uint32)b[3]&3) << 24);
  r->v[2]  = ((crypto_uint32)b[3] >> 2);
  r->v[2] |= ((crypto_uint32)b[4] << 6);
  r->v[2] |= ((crypto_uint32)b[5] << 14);
  r->v[2] |= (((crypto_uint32)b[6]&7) << 22);
  r->v[4]  = ((crypto_uint32)b[6] >> 3);
  r->v[4] |= ((crypto_uint32)b[7] << 5);
  r->v[4] |= ((crypto_uint32)b[8] << 13);
  r->v[4] |= (((crypto_uint32)b[9]&31) << 21);
  r->v[6]  = ((crypto_uint32)b[9] >> 5);
  r->v[6] |= ((crypto_uint32)b[10] << 3);
  r->v[6] |= ((crypto_uint32)b[11] << 11);
  r->v[6] |= (((crypto_uint32)b[12]&63) << 19);
  r->v[8]  = ((crypto_uint32)b[12] >> 6);
  r->v[8] |= ((crypto_uint32)b[13] << 2);
  r->v[8] |= ((crypto_uint32)b[14] << 10);
  r->v[8] |= (((crypto_uint32)b[15]) << 18);
  b+=16;

  r->v[1]  = b[0];
  r->v[1] |= ((crypto_uint32)b[1] << 8);
  r->v[1] |= ((crypto_uint32)b[2] << 16);
  r->v[1] |= (((crypto_uint32)b[3]&3) << 24);
  r->v[3]  = ((crypto_uint32)b[3] >> 2);
  r->v[3] |= ((crypto_uint32)b[4] << 6);
  r->v[3] |= ((crypto_uint32)b[5] << 14);
  r->v[3] |= (((crypto_uint32)b[6]&7) << 22);
  r->v[5]  = ((crypto_uint32)b[6] >> 3);
  r->v[5] |= ((crypto_uint32)b[7] << 5);
  r->v[5] |= ((crypto_uint32)b[8] << 13);
  r->v[5] |= (((crypto_uint32)b[9]&31) << 21);
  r->v[7]  = ((crypto_uint32)b[9] >> 5);
  r->v[7] |= ((crypto_uint32)b[10] << 3);
  r->v[7] |= ((crypto_uint32)b[11] << 11);
  r->v[7] |= (((crypto_uint32)b[12]&63) << 19);
  r->v[9]  = ((crypto_uint32)b[12] >> 6);
  r->v[9] |= ((crypto_uint32)b[13] << 2);
  r->v[9] |= ((crypto_uint32)b[14] << 10);
  r->v[9] |= (((crypto_uint32)b[15]) << 18);
}

void gfex2_unpack2(gfex2 *r, const unsigned char a[16], const unsigned char b[16])
{
  unsigned char c[32];
  int i;
  for(i=0; i<16; i++) {
    c[i]    = a[i];
    c[i+16] = b[i];
  }
  gfex2_unpack(r,c);
}
