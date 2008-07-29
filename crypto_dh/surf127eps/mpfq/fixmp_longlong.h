#ifndef HAVE_NATIVE_ADDMUL1_1
#define HAVE_LONGLONG_ADDMUL1_1 1
static void
addmul1_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c)
{
  mp_limb_t hi,lo,carry,buf;
  carry = 0;

  umul_ppmm(hi,lo,c,x[0]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[0];
  lo += buf;
  carry += (lo<buf);
  z[0] = lo;
  z[1] += carry;
}
#endif

#ifndef HAVE_NATIVE_ADDMUL1_2
#define HAVE_LONGLONG_ADDMUL1_2 1
static void
addmul1_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c)
{
  mp_limb_t hi,lo,carry,buf;
  carry = 0;

  umul_ppmm(hi,lo,c,x[0]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[0];
  lo += buf;
  carry += (lo<buf);
  z[0] = lo;

  umul_ppmm(hi,lo,c,x[1]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[1];
  lo += buf;
  carry += (lo<buf);
  z[1] = lo;
  z[2] += carry;
}
#endif

#ifndef HAVE_NATIVE_ADDMUL1_3
#define HAVE_LONGLONG_ADDMUL1_3 1
static void
addmul1_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c)
{
  mp_limb_t hi,lo,carry,buf;
  carry = 0;

  umul_ppmm(hi,lo,c,x[0]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[0];
  lo += buf;
  carry += (lo<buf);
  z[0] = lo;

  umul_ppmm(hi,lo,c,x[1]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[1];
  lo += buf;
  carry += (lo<buf);
  z[1] = lo;

  umul_ppmm(hi,lo,c,x[2]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[2];
  lo += buf;
  carry += (lo<buf);
  z[2] = lo;
  z[3] += carry;
}
#endif

#ifndef HAVE_NATIVE_ADDMUL1_4
#define HAVE_LONGLONG_ADDMUL1_4 1
static void
addmul1_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c)
{
  mp_limb_t hi,lo,carry,buf;
  carry = 0;

  umul_ppmm(hi,lo,c,x[0]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[0];
  lo += buf;
  carry += (lo<buf);
  z[0] = lo;

  umul_ppmm(hi,lo,c,x[1]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[1];
  lo += buf;
  carry += (lo<buf);
  z[1] = lo;

  umul_ppmm(hi,lo,c,x[2]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[2];
  lo += buf;
  carry += (lo<buf);
  z[2] = lo;

  umul_ppmm(hi,lo,c,x[3]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[3];
  lo += buf;
  carry += (lo<buf);
  z[3] = lo;
  z[4] += carry;
}
#endif

#ifndef HAVE_NATIVE_ADDMUL1_5
#define HAVE_LONGLONG_ADDMUL1_5 1
static void
addmul1_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c)
{
  mp_limb_t hi,lo,carry,buf;
  carry = 0;

  umul_ppmm(hi,lo,c,x[0]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[0];
  lo += buf;
  carry += (lo<buf);
  z[0] = lo;

  umul_ppmm(hi,lo,c,x[1]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[1];
  lo += buf;
  carry += (lo<buf);
  z[1] = lo;

  umul_ppmm(hi,lo,c,x[2]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[2];
  lo += buf;
  carry += (lo<buf);
  z[2] = lo;

  umul_ppmm(hi,lo,c,x[3]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[3];
  lo += buf;
  carry += (lo<buf);
  z[3] = lo;

  umul_ppmm(hi,lo,c,x[4]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[4];
  lo += buf;
  carry += (lo<buf);
  z[4] = lo;
  z[5] += carry;
}
#endif

#ifndef HAVE_NATIVE_ADDMUL1_6
#define HAVE_LONGLONG_ADDMUL1_6 1
static void
addmul1_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c)
{
  mp_limb_t hi,lo,carry,buf;
  carry = 0;

  umul_ppmm(hi,lo,c,x[0]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[0];
  lo += buf;
  carry += (lo<buf);
  z[0] = lo;

  umul_ppmm(hi,lo,c,x[1]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[1];
  lo += buf;
  carry += (lo<buf);
  z[1] = lo;

  umul_ppmm(hi,lo,c,x[2]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[2];
  lo += buf;
  carry += (lo<buf);
  z[2] = lo;

  umul_ppmm(hi,lo,c,x[3]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[3];
  lo += buf;
  carry += (lo<buf);
  z[3] = lo;

  umul_ppmm(hi,lo,c,x[4]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[4];
  lo += buf;
  carry += (lo<buf);
  z[4] = lo;

  umul_ppmm(hi,lo,c,x[5]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[5];
  lo += buf;
  carry += (lo<buf);
  z[5] = lo;
  z[6] += carry;
}
#endif

#ifndef HAVE_NATIVE_ADDMUL1_7
#define HAVE_LONGLONG_ADDMUL1_7 1
static void
addmul1_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c)
{
  mp_limb_t hi,lo,carry,buf;
  carry = 0;

  umul_ppmm(hi,lo,c,x[0]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[0];
  lo += buf;
  carry += (lo<buf);
  z[0] = lo;

  umul_ppmm(hi,lo,c,x[1]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[1];
  lo += buf;
  carry += (lo<buf);
  z[1] = lo;

  umul_ppmm(hi,lo,c,x[2]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[2];
  lo += buf;
  carry += (lo<buf);
  z[2] = lo;

  umul_ppmm(hi,lo,c,x[3]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[3];
  lo += buf;
  carry += (lo<buf);
  z[3] = lo;

  umul_ppmm(hi,lo,c,x[4]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[4];
  lo += buf;
  carry += (lo<buf);
  z[4] = lo;

  umul_ppmm(hi,lo,c,x[5]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[5];
  lo += buf;
  carry += (lo<buf);
  z[5] = lo;

  umul_ppmm(hi,lo,c,x[6]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[6];
  lo += buf;
  carry += (lo<buf);
  z[6] = lo;
  z[7] += carry;
}
#endif

#ifndef HAVE_NATIVE_ADDMUL1_8
#define HAVE_LONGLONG_ADDMUL1_8 1
static void
addmul1_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c)
{
  mp_limb_t hi,lo,carry,buf;
  carry = 0;

  umul_ppmm(hi,lo,c,x[0]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[0];
  lo += buf;
  carry += (lo<buf);
  z[0] = lo;

  umul_ppmm(hi,lo,c,x[1]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[1];
  lo += buf;
  carry += (lo<buf);
  z[1] = lo;

  umul_ppmm(hi,lo,c,x[2]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[2];
  lo += buf;
  carry += (lo<buf);
  z[2] = lo;

  umul_ppmm(hi,lo,c,x[3]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[3];
  lo += buf;
  carry += (lo<buf);
  z[3] = lo;

  umul_ppmm(hi,lo,c,x[4]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[4];
  lo += buf;
  carry += (lo<buf);
  z[4] = lo;

  umul_ppmm(hi,lo,c,x[5]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[5];
  lo += buf;
  carry += (lo<buf);
  z[5] = lo;

  umul_ppmm(hi,lo,c,x[6]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[6];
  lo += buf;
  carry += (lo<buf);
  z[6] = lo;

  umul_ppmm(hi,lo,c,x[7]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[7];
  lo += buf;
  carry += (lo<buf);
  z[7] = lo;
  z[8] += carry;
}
#endif

#ifndef HAVE_NATIVE_ADDMUL1_9
#define HAVE_LONGLONG_ADDMUL1_9 1
static void
addmul1_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t c)
{
  mp_limb_t hi,lo,carry,buf;
  carry = 0;

  umul_ppmm(hi,lo,c,x[0]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[0];
  lo += buf;
  carry += (lo<buf);
  z[0] = lo;

  umul_ppmm(hi,lo,c,x[1]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[1];
  lo += buf;
  carry += (lo<buf);
  z[1] = lo;

  umul_ppmm(hi,lo,c,x[2]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[2];
  lo += buf;
  carry += (lo<buf);
  z[2] = lo;

  umul_ppmm(hi,lo,c,x[3]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[3];
  lo += buf;
  carry += (lo<buf);
  z[3] = lo;

  umul_ppmm(hi,lo,c,x[4]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[4];
  lo += buf;
  carry += (lo<buf);
  z[4] = lo;

  umul_ppmm(hi,lo,c,x[5]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[5];
  lo += buf;
  carry += (lo<buf);
  z[5] = lo;

  umul_ppmm(hi,lo,c,x[6]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[6];
  lo += buf;
  carry += (lo<buf);
  z[6] = lo;

  umul_ppmm(hi,lo,c,x[7]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[7];
  lo += buf;
  carry += (lo<buf);
  z[7] = lo;

  umul_ppmm(hi,lo,c,x[8]);
  lo += carry;
  carry = (lo<carry) + hi;
  buf = z[8];
  lo += buf;
  carry += (lo<buf);
  z[8] = lo;
  z[9] += carry;
}
#endif

#ifndef HAVE_NATIVE_MUL1_1
#define HAVE_LONGLONG_MUL1_1 1
static void
mul1_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t y)
{
  int i;
  for (i = 0; i < 1+1; ++i) 
    z[i] = 0;
  addmul1_1(z, x, y);
}
#endif

#ifndef HAVE_NATIVE_MUL1_2
#define HAVE_LONGLONG_MUL1_2 1
static void
mul1_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t y)
{
  int i;
  for (i = 0; i < 2+1; ++i) 
    z[i] = 0;
  addmul1_2(z, x, y);
}
#endif

#ifndef HAVE_NATIVE_MUL1_3
#define HAVE_LONGLONG_MUL1_3 1
static void
mul1_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t y)
{
  int i;
  for (i = 0; i < 3+1; ++i) 
    z[i] = 0;
  addmul1_3(z, x, y);
}
#endif

#ifndef HAVE_NATIVE_MUL1_4
#define HAVE_LONGLONG_MUL1_4 1
static void
mul1_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t y)
{
  int i;
  for (i = 0; i < 4+1; ++i) 
    z[i] = 0;
  addmul1_4(z, x, y);
}
#endif

#ifndef HAVE_NATIVE_MUL1_5
#define HAVE_LONGLONG_MUL1_5 1
static void
mul1_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t y)
{
  int i;
  for (i = 0; i < 5+1; ++i) 
    z[i] = 0;
  addmul1_5(z, x, y);
}
#endif

#ifndef HAVE_NATIVE_MUL1_6
#define HAVE_LONGLONG_MUL1_6 1
static void
mul1_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t y)
{
  int i;
  for (i = 0; i < 6+1; ++i) 
    z[i] = 0;
  addmul1_6(z, x, y);
}
#endif

#ifndef HAVE_NATIVE_MUL1_7
#define HAVE_LONGLONG_MUL1_7 1
static void
mul1_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t y)
{
  int i;
  for (i = 0; i < 7+1; ++i) 
    z[i] = 0;
  addmul1_7(z, x, y);
}
#endif

#ifndef HAVE_NATIVE_MUL1_8
#define HAVE_LONGLONG_MUL1_8 1
static void
mul1_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t y)
{
  int i;
  for (i = 0; i < 8+1; ++i) 
    z[i] = 0;
  addmul1_8(z, x, y);
}
#endif

#ifndef HAVE_NATIVE_MUL1_9
#define HAVE_LONGLONG_MUL1_9 1
static void
mul1_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t y)
{
  int i;
  for (i = 0; i < 9+1; ++i) 
    z[i] = 0;
  addmul1_9(z, x, y);
}
#endif

#ifndef HAVE_NATIVE_SHORTMUL_1
#define HAVE_LONGLONG_SHORTMUL_1 1
static void
shortmul_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 1; ++i) 
    z[i] = 0;
  z[1-1] += x[0]*y[1-1];
}
#endif

#ifndef HAVE_NATIVE_SHORTMUL_2
#define HAVE_LONGLONG_SHORTMUL_2 1
static void
shortmul_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 2; ++i) 
    z[i] = 0;
  addmul1_1 (z+0, x, y[0]);
  z[2-1] += x[2-0-1]*y[0];
  z[2-1] += x[0]*y[2-1];
}
#endif

#ifndef HAVE_NATIVE_SHORTMUL_3
#define HAVE_LONGLONG_SHORTMUL_3 1
static void
shortmul_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 3; ++i) 
    z[i] = 0;
  addmul1_2 (z+0, x, y[0]);
  z[3-1] += x[3-0-1]*y[0];
  addmul1_1 (z+1, x, y[1]);
  z[3-1] += x[3-1-1]*y[1];
  z[3-1] += x[0]*y[3-1];
}
#endif

#ifndef HAVE_NATIVE_SHORTMUL_4
#define HAVE_LONGLONG_SHORTMUL_4 1
static void
shortmul_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 4; ++i) 
    z[i] = 0;
  addmul1_3 (z+0, x, y[0]);
  z[4-1] += x[4-0-1]*y[0];
  addmul1_2 (z+1, x, y[1]);
  z[4-1] += x[4-1-1]*y[1];
  addmul1_1 (z+2, x, y[2]);
  z[4-1] += x[4-2-1]*y[2];
  z[4-1] += x[0]*y[4-1];
}
#endif

#ifndef HAVE_NATIVE_SHORTMUL_5
#define HAVE_LONGLONG_SHORTMUL_5 1
static void
shortmul_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 5; ++i) 
    z[i] = 0;
  addmul1_4 (z+0, x, y[0]);
  z[5-1] += x[5-0-1]*y[0];
  addmul1_3 (z+1, x, y[1]);
  z[5-1] += x[5-1-1]*y[1];
  addmul1_2 (z+2, x, y[2]);
  z[5-1] += x[5-2-1]*y[2];
  addmul1_1 (z+3, x, y[3]);
  z[5-1] += x[5-3-1]*y[3];
  z[5-1] += x[0]*y[5-1];
}
#endif

#ifndef HAVE_NATIVE_SHORTMUL_6
#define HAVE_LONGLONG_SHORTMUL_6 1
static void
shortmul_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 6; ++i) 
    z[i] = 0;
  addmul1_5 (z+0, x, y[0]);
  z[6-1] += x[6-0-1]*y[0];
  addmul1_4 (z+1, x, y[1]);
  z[6-1] += x[6-1-1]*y[1];
  addmul1_3 (z+2, x, y[2]);
  z[6-1] += x[6-2-1]*y[2];
  addmul1_2 (z+3, x, y[3]);
  z[6-1] += x[6-3-1]*y[3];
  addmul1_1 (z+4, x, y[4]);
  z[6-1] += x[6-4-1]*y[4];
  z[6-1] += x[0]*y[6-1];
}
#endif

#ifndef HAVE_NATIVE_SHORTMUL_7
#define HAVE_LONGLONG_SHORTMUL_7 1
static void
shortmul_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 7; ++i) 
    z[i] = 0;
  addmul1_6 (z+0, x, y[0]);
  z[7-1] += x[7-0-1]*y[0];
  addmul1_5 (z+1, x, y[1]);
  z[7-1] += x[7-1-1]*y[1];
  addmul1_4 (z+2, x, y[2]);
  z[7-1] += x[7-2-1]*y[2];
  addmul1_3 (z+3, x, y[3]);
  z[7-1] += x[7-3-1]*y[3];
  addmul1_2 (z+4, x, y[4]);
  z[7-1] += x[7-4-1]*y[4];
  addmul1_1 (z+5, x, y[5]);
  z[7-1] += x[7-5-1]*y[5];
  z[7-1] += x[0]*y[7-1];
}
#endif

#ifndef HAVE_NATIVE_SHORTMUL_8
#define HAVE_LONGLONG_SHORTMUL_8 1
static void
shortmul_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 8; ++i) 
    z[i] = 0;
  addmul1_7 (z+0, x, y[0]);
  z[8-1] += x[8-0-1]*y[0];
  addmul1_6 (z+1, x, y[1]);
  z[8-1] += x[8-1-1]*y[1];
  addmul1_5 (z+2, x, y[2]);
  z[8-1] += x[8-2-1]*y[2];
  addmul1_4 (z+3, x, y[3]);
  z[8-1] += x[8-3-1]*y[3];
  addmul1_3 (z+4, x, y[4]);
  z[8-1] += x[8-4-1]*y[4];
  addmul1_2 (z+5, x, y[5]);
  z[8-1] += x[8-5-1]*y[5];
  addmul1_1 (z+6, x, y[6]);
  z[8-1] += x[8-6-1]*y[6];
  z[8-1] += x[0]*y[8-1];
}
#endif

#ifndef HAVE_NATIVE_SHORTMUL_9
#define HAVE_LONGLONG_SHORTMUL_9 1
static void
shortmul_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 9; ++i) 
    z[i] = 0;
  addmul1_8 (z+0, x, y[0]);
  z[9-1] += x[9-0-1]*y[0];
  addmul1_7 (z+1, x, y[1]);
  z[9-1] += x[9-1-1]*y[1];
  addmul1_6 (z+2, x, y[2]);
  z[9-1] += x[9-2-1]*y[2];
  addmul1_5 (z+3, x, y[3]);
  z[9-1] += x[9-3-1]*y[3];
  addmul1_4 (z+4, x, y[4]);
  z[9-1] += x[9-4-1]*y[4];
  addmul1_3 (z+5, x, y[5]);
  z[9-1] += x[9-5-1]*y[5];
  addmul1_2 (z+6, x, y[6]);
  z[9-1] += x[9-6-1]*y[6];
  addmul1_1 (z+7, x, y[7]);
  z[9-1] += x[9-7-1]*y[7];
  z[9-1] += x[0]*y[9-1];
}
#endif

#ifndef HAVE_NATIVE_MUL_1
#define HAVE_LONGLONG_MUL_1 1
static void
mul_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 2*1; ++i) 
    z[i] = 0;
  addmul1_1 (z+0, x, y[0]);
}
#endif

#ifndef HAVE_NATIVE_MUL_2
#define HAVE_LONGLONG_MUL_2 1
static void
mul_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 2*2; ++i) 
    z[i] = 0;
  addmul1_2 (z+0, x, y[0]);
  addmul1_2 (z+1, x, y[1]);
}
#endif

#ifndef HAVE_NATIVE_MUL_3
#define HAVE_LONGLONG_MUL_3 1
static void
mul_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 2*3; ++i) 
    z[i] = 0;
  addmul1_3 (z+0, x, y[0]);
  addmul1_3 (z+1, x, y[1]);
  addmul1_3 (z+2, x, y[2]);
}
#endif

#ifndef HAVE_NATIVE_MUL_4
#define HAVE_LONGLONG_MUL_4 1
static void
mul_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 2*4; ++i) 
    z[i] = 0;
  addmul1_4 (z+0, x, y[0]);
  addmul1_4 (z+1, x, y[1]);
  addmul1_4 (z+2, x, y[2]);
  addmul1_4 (z+3, x, y[3]);
}
#endif

#ifndef HAVE_NATIVE_MUL_5
#define HAVE_LONGLONG_MUL_5 1
static void
mul_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 2*5; ++i) 
    z[i] = 0;
  addmul1_5 (z+0, x, y[0]);
  addmul1_5 (z+1, x, y[1]);
  addmul1_5 (z+2, x, y[2]);
  addmul1_5 (z+3, x, y[3]);
  addmul1_5 (z+4, x, y[4]);
}
#endif

#ifndef HAVE_NATIVE_MUL_6
#define HAVE_LONGLONG_MUL_6 1
static void
mul_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 2*6; ++i) 
    z[i] = 0;
  addmul1_6 (z+0, x, y[0]);
  addmul1_6 (z+1, x, y[1]);
  addmul1_6 (z+2, x, y[2]);
  addmul1_6 (z+3, x, y[3]);
  addmul1_6 (z+4, x, y[4]);
  addmul1_6 (z+5, x, y[5]);
}
#endif

#ifndef HAVE_NATIVE_MUL_7
#define HAVE_LONGLONG_MUL_7 1
static void
mul_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 2*7; ++i) 
    z[i] = 0;
  addmul1_7 (z+0, x, y[0]);
  addmul1_7 (z+1, x, y[1]);
  addmul1_7 (z+2, x, y[2]);
  addmul1_7 (z+3, x, y[3]);
  addmul1_7 (z+4, x, y[4]);
  addmul1_7 (z+5, x, y[5]);
  addmul1_7 (z+6, x, y[6]);
}
#endif

#ifndef HAVE_NATIVE_MUL_8
#define HAVE_LONGLONG_MUL_8 1
static void
mul_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 2*8; ++i) 
    z[i] = 0;
  addmul1_8 (z+0, x, y[0]);
  addmul1_8 (z+1, x, y[1]);
  addmul1_8 (z+2, x, y[2]);
  addmul1_8 (z+3, x, y[3]);
  addmul1_8 (z+4, x, y[4]);
  addmul1_8 (z+5, x, y[5]);
  addmul1_8 (z+6, x, y[6]);
  addmul1_8 (z+7, x, y[7]);
}
#endif

#ifndef HAVE_NATIVE_MUL_9
#define HAVE_LONGLONG_MUL_9 1
static void
mul_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 0; i < 2*9; ++i) 
    z[i] = 0;
  addmul1_9 (z+0, x, y[0]);
  addmul1_9 (z+1, x, y[1]);
  addmul1_9 (z+2, x, y[2]);
  addmul1_9 (z+3, x, y[3]);
  addmul1_9 (z+4, x, y[4]);
  addmul1_9 (z+5, x, y[5]);
  addmul1_9 (z+6, x, y[6]);
  addmul1_9 (z+7, x, y[7]);
  addmul1_9 (z+8, x, y[8]);
}
#endif

#ifndef HAVE_NATIVE_SQR_1
#define HAVE_LONGLONG_SQR_1 1
static void
sqr_1(mp_limb_t *z, const mp_limb_t *x)
{
  mp_limb_t buf[2*1];
  int i;

  for (i = 0; i < 2*1; ++i)
    buf[i] = 0;

  umul_ppmm(z[2*0+1], z[2*0], x[0], x[0]);
  mpn_lshift(buf, buf, 2*1, 1);
  mpn_add_n(z, z, buf, 2*1);
}
#endif

#ifndef HAVE_NATIVE_SQR_2
#define HAVE_LONGLONG_SQR_2 1
static void
sqr_2(mp_limb_t *z, const mp_limb_t *x)
{
  mp_limb_t buf[2*2];
  int i;

  for (i = 0; i < 2*2; ++i)
    buf[i] = 0;
  addmul1_1(buf+1, x, x[1]);

  umul_ppmm(z[2*0+1], z[2*0], x[0], x[0]);
  umul_ppmm(z[2*1+1], z[2*1], x[1], x[1]);
  mpn_lshift(buf, buf, 2*2, 1);
  mpn_add_n(z, z, buf, 2*2);
}
#endif

#ifndef HAVE_NATIVE_SQR_3
#define HAVE_LONGLONG_SQR_3 1
static void
sqr_3(mp_limb_t *z, const mp_limb_t *x)
{
  mp_limb_t buf[2*3];
  int i;

  for (i = 0; i < 2*3; ++i)
    buf[i] = 0;
  addmul1_1(buf+1, x, x[1]);
  addmul1_2(buf+2, x, x[2]);

  umul_ppmm(z[2*0+1], z[2*0], x[0], x[0]);
  umul_ppmm(z[2*1+1], z[2*1], x[1], x[1]);
  umul_ppmm(z[2*2+1], z[2*2], x[2], x[2]);
  mpn_lshift(buf, buf, 2*3, 1);
  mpn_add_n(z, z, buf, 2*3);
}
#endif

#ifndef HAVE_NATIVE_SQR_4
#define HAVE_LONGLONG_SQR_4 1
static void
sqr_4(mp_limb_t *z, const mp_limb_t *x)
{
  mp_limb_t buf[2*4];
  int i;

  for (i = 0; i < 2*4; ++i)
    buf[i] = 0;
  addmul1_1(buf+1, x, x[1]);
  addmul1_2(buf+2, x, x[2]);
  addmul1_3(buf+3, x, x[3]);

  umul_ppmm(z[2*0+1], z[2*0], x[0], x[0]);
  umul_ppmm(z[2*1+1], z[2*1], x[1], x[1]);
  umul_ppmm(z[2*2+1], z[2*2], x[2], x[2]);
  umul_ppmm(z[2*3+1], z[2*3], x[3], x[3]);
  mpn_lshift(buf, buf, 2*4, 1);
  mpn_add_n(z, z, buf, 2*4);
}
#endif

#ifndef HAVE_NATIVE_SQR_5
#define HAVE_LONGLONG_SQR_5 1
static void
sqr_5(mp_limb_t *z, const mp_limb_t *x)
{
  mp_limb_t buf[2*5];
  int i;

  for (i = 0; i < 2*5; ++i)
    buf[i] = 0;
  addmul1_1(buf+1, x, x[1]);
  addmul1_2(buf+2, x, x[2]);
  addmul1_3(buf+3, x, x[3]);
  addmul1_4(buf+4, x, x[4]);

  umul_ppmm(z[2*0+1], z[2*0], x[0], x[0]);
  umul_ppmm(z[2*1+1], z[2*1], x[1], x[1]);
  umul_ppmm(z[2*2+1], z[2*2], x[2], x[2]);
  umul_ppmm(z[2*3+1], z[2*3], x[3], x[3]);
  umul_ppmm(z[2*4+1], z[2*4], x[4], x[4]);
  mpn_lshift(buf, buf, 2*5, 1);
  mpn_add_n(z, z, buf, 2*5);
}
#endif

#ifndef HAVE_NATIVE_SQR_6
#define HAVE_LONGLONG_SQR_6 1
static void
sqr_6(mp_limb_t *z, const mp_limb_t *x)
{
  mp_limb_t buf[2*6];
  int i;

  for (i = 0; i < 2*6; ++i)
    buf[i] = 0;
  addmul1_1(buf+1, x, x[1]);
  addmul1_2(buf+2, x, x[2]);
  addmul1_3(buf+3, x, x[3]);
  addmul1_4(buf+4, x, x[4]);
  addmul1_5(buf+5, x, x[5]);

  umul_ppmm(z[2*0+1], z[2*0], x[0], x[0]);
  umul_ppmm(z[2*1+1], z[2*1], x[1], x[1]);
  umul_ppmm(z[2*2+1], z[2*2], x[2], x[2]);
  umul_ppmm(z[2*3+1], z[2*3], x[3], x[3]);
  umul_ppmm(z[2*4+1], z[2*4], x[4], x[4]);
  umul_ppmm(z[2*5+1], z[2*5], x[5], x[5]);
  mpn_lshift(buf, buf, 2*6, 1);
  mpn_add_n(z, z, buf, 2*6);
}
#endif

#ifndef HAVE_NATIVE_SQR_7
#define HAVE_LONGLONG_SQR_7 1
static void
sqr_7(mp_limb_t *z, const mp_limb_t *x)
{
  mp_limb_t buf[2*7];
  int i;

  for (i = 0; i < 2*7; ++i)
    buf[i] = 0;
  addmul1_1(buf+1, x, x[1]);
  addmul1_2(buf+2, x, x[2]);
  addmul1_3(buf+3, x, x[3]);
  addmul1_4(buf+4, x, x[4]);
  addmul1_5(buf+5, x, x[5]);
  addmul1_6(buf+6, x, x[6]);

  umul_ppmm(z[2*0+1], z[2*0], x[0], x[0]);
  umul_ppmm(z[2*1+1], z[2*1], x[1], x[1]);
  umul_ppmm(z[2*2+1], z[2*2], x[2], x[2]);
  umul_ppmm(z[2*3+1], z[2*3], x[3], x[3]);
  umul_ppmm(z[2*4+1], z[2*4], x[4], x[4]);
  umul_ppmm(z[2*5+1], z[2*5], x[5], x[5]);
  umul_ppmm(z[2*6+1], z[2*6], x[6], x[6]);
  mpn_lshift(buf, buf, 2*7, 1);
  mpn_add_n(z, z, buf, 2*7);
}
#endif

#ifndef HAVE_NATIVE_SQR_8
#define HAVE_LONGLONG_SQR_8 1
static void
sqr_8(mp_limb_t *z, const mp_limb_t *x)
{
  mp_limb_t buf[2*8];
  int i;

  for (i = 0; i < 2*8; ++i)
    buf[i] = 0;
  addmul1_1(buf+1, x, x[1]);
  addmul1_2(buf+2, x, x[2]);
  addmul1_3(buf+3, x, x[3]);
  addmul1_4(buf+4, x, x[4]);
  addmul1_5(buf+5, x, x[5]);
  addmul1_6(buf+6, x, x[6]);
  addmul1_7(buf+7, x, x[7]);

  umul_ppmm(z[2*0+1], z[2*0], x[0], x[0]);
  umul_ppmm(z[2*1+1], z[2*1], x[1], x[1]);
  umul_ppmm(z[2*2+1], z[2*2], x[2], x[2]);
  umul_ppmm(z[2*3+1], z[2*3], x[3], x[3]);
  umul_ppmm(z[2*4+1], z[2*4], x[4], x[4]);
  umul_ppmm(z[2*5+1], z[2*5], x[5], x[5]);
  umul_ppmm(z[2*6+1], z[2*6], x[6], x[6]);
  umul_ppmm(z[2*7+1], z[2*7], x[7], x[7]);
  mpn_lshift(buf, buf, 2*8, 1);
  mpn_add_n(z, z, buf, 2*8);
}
#endif

#ifndef HAVE_NATIVE_SQR_9
#define HAVE_LONGLONG_SQR_9 1
static void
sqr_9(mp_limb_t *z, const mp_limb_t *x)
{
  mp_limb_t buf[2*9];
  int i;

  for (i = 0; i < 2*9; ++i)
    buf[i] = 0;
  addmul1_1(buf+1, x, x[1]);
  addmul1_2(buf+2, x, x[2]);
  addmul1_3(buf+3, x, x[3]);
  addmul1_4(buf+4, x, x[4]);
  addmul1_5(buf+5, x, x[5]);
  addmul1_6(buf+6, x, x[6]);
  addmul1_7(buf+7, x, x[7]);
  addmul1_8(buf+8, x, x[8]);

  umul_ppmm(z[2*0+1], z[2*0], x[0], x[0]);
  umul_ppmm(z[2*1+1], z[2*1], x[1], x[1]);
  umul_ppmm(z[2*2+1], z[2*2], x[2], x[2]);
  umul_ppmm(z[2*3+1], z[2*3], x[3], x[3]);
  umul_ppmm(z[2*4+1], z[2*4], x[4], x[4]);
  umul_ppmm(z[2*5+1], z[2*5], x[5], x[5]);
  umul_ppmm(z[2*6+1], z[2*6], x[6], x[6]);
  umul_ppmm(z[2*7+1], z[2*7], x[7], x[7]);
  umul_ppmm(z[2*8+1], z[2*8], x[8], x[8]);
  mpn_lshift(buf, buf, 2*9, 1);
  mpn_add_n(z, z, buf, 2*9);
}
#endif

#ifndef HAVE_NATIVE_ADD_1
#define HAVE_LONGLONG_ADD_1 1
static void
add_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r + y[0];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[0] = t;
}
#endif

#ifndef HAVE_NATIVE_ADD_2
#define HAVE_LONGLONG_ADD_2 1
static void
add_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r + y[0];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r + y[1];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[1] = t;
}
#endif

#ifndef HAVE_NATIVE_ADD_3
#define HAVE_LONGLONG_ADD_3 1
static void
add_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r + y[0];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r + y[1];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r + y[2];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[2] = t;
}
#endif

#ifndef HAVE_NATIVE_ADD_4
#define HAVE_LONGLONG_ADD_4 1
static void
add_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r + y[0];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r + y[1];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r + y[2];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[2] = t;
  r = x[3];
  s = r + y[3];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[3] = t;
}
#endif

#ifndef HAVE_NATIVE_ADD_5
#define HAVE_LONGLONG_ADD_5 1
static void
add_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r + y[0];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r + y[1];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r + y[2];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[2] = t;
  r = x[3];
  s = r + y[3];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[3] = t;
  r = x[4];
  s = r + y[4];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[4] = t;
}
#endif

#ifndef HAVE_NATIVE_ADD_6
#define HAVE_LONGLONG_ADD_6 1
static void
add_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r + y[0];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r + y[1];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r + y[2];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[2] = t;
  r = x[3];
  s = r + y[3];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[3] = t;
  r = x[4];
  s = r + y[4];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[4] = t;
  r = x[5];
  s = r + y[5];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[5] = t;
}
#endif

#ifndef HAVE_NATIVE_ADD_7
#define HAVE_LONGLONG_ADD_7 1
static void
add_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r + y[0];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r + y[1];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r + y[2];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[2] = t;
  r = x[3];
  s = r + y[3];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[3] = t;
  r = x[4];
  s = r + y[4];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[4] = t;
  r = x[5];
  s = r + y[5];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[5] = t;
  r = x[6];
  s = r + y[6];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[6] = t;
}
#endif

#ifndef HAVE_NATIVE_ADD_8
#define HAVE_LONGLONG_ADD_8 1
static void
add_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r + y[0];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r + y[1];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r + y[2];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[2] = t;
  r = x[3];
  s = r + y[3];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[3] = t;
  r = x[4];
  s = r + y[4];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[4] = t;
  r = x[5];
  s = r + y[5];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[5] = t;
  r = x[6];
  s = r + y[6];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[6] = t;
  r = x[7];
  s = r + y[7];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[7] = t;
}
#endif

#ifndef HAVE_NATIVE_ADD_9
#define HAVE_LONGLONG_ADD_9 1
static void
add_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r + y[0];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r + y[1];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r + y[2];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[2] = t;
  r = x[3];
  s = r + y[3];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[3] = t;
  r = x[4];
  s = r + y[4];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[4] = t;
  r = x[5];
  s = r + y[5];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[5] = t;
  r = x[6];
  s = r + y[6];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[6] = t;
  r = x[7];
  s = r + y[7];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[7] = t;
  r = x[8];
  s = r + y[8];
  cy1 = s < r;
  t = s + cy;
  cy2 = t < s;
  cy = cy1 | cy2;
  z[8] = t;
}
#endif

#ifndef HAVE_NATIVE_SUB_1
#define HAVE_LONGLONG_SUB_1 1
static void
sub_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r - y[0];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[0] = t;
}
#endif

#ifndef HAVE_NATIVE_SUB_2
#define HAVE_LONGLONG_SUB_2 1
static void
sub_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r - y[0];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r - y[1];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[1] = t;
}
#endif

#ifndef HAVE_NATIVE_SUB_3
#define HAVE_LONGLONG_SUB_3 1
static void
sub_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r - y[0];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r - y[1];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r - y[2];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[2] = t;
}
#endif

#ifndef HAVE_NATIVE_SUB_4
#define HAVE_LONGLONG_SUB_4 1
static void
sub_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r - y[0];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r - y[1];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r - y[2];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[2] = t;
  r = x[3];
  s = r - y[3];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[3] = t;
}
#endif

#ifndef HAVE_NATIVE_SUB_5
#define HAVE_LONGLONG_SUB_5 1
static void
sub_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r - y[0];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r - y[1];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r - y[2];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[2] = t;
  r = x[3];
  s = r - y[3];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[3] = t;
  r = x[4];
  s = r - y[4];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[4] = t;
}
#endif

#ifndef HAVE_NATIVE_SUB_6
#define HAVE_LONGLONG_SUB_6 1
static void
sub_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r - y[0];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r - y[1];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r - y[2];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[2] = t;
  r = x[3];
  s = r - y[3];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[3] = t;
  r = x[4];
  s = r - y[4];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[4] = t;
  r = x[5];
  s = r - y[5];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[5] = t;
}
#endif

#ifndef HAVE_NATIVE_SUB_7
#define HAVE_LONGLONG_SUB_7 1
static void
sub_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r - y[0];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r - y[1];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r - y[2];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[2] = t;
  r = x[3];
  s = r - y[3];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[3] = t;
  r = x[4];
  s = r - y[4];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[4] = t;
  r = x[5];
  s = r - y[5];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[5] = t;
  r = x[6];
  s = r - y[6];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[6] = t;
}
#endif

#ifndef HAVE_NATIVE_SUB_8
#define HAVE_LONGLONG_SUB_8 1
static void
sub_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r - y[0];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r - y[1];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r - y[2];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[2] = t;
  r = x[3];
  s = r - y[3];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[3] = t;
  r = x[4];
  s = r - y[4];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[4] = t;
  r = x[5];
  s = r - y[5];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[5] = t;
  r = x[6];
  s = r - y[6];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[6] = t;
  r = x[7];
  s = r - y[7];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[7] = t;
}
#endif

#ifndef HAVE_NATIVE_SUB_9
#define HAVE_LONGLONG_SUB_9 1
static void
sub_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *y)
{
  mp_limb_t r, s, t, cy, cy1, cy2;
  cy = 0;

  r = x[0];
  s = r - y[0];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[0] = t;
  r = x[1];
  s = r - y[1];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[1] = t;
  r = x[2];
  s = r - y[2];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[2] = t;
  r = x[3];
  s = r - y[3];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[3] = t;
  r = x[4];
  s = r - y[4];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[4] = t;
  r = x[5];
  s = r - y[5];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[5] = t;
  r = x[6];
  s = r - y[6];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[6] = t;
  r = x[7];
  s = r - y[7];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[7] = t;
  r = x[8];
  s = r - y[8];
  cy1 = s > r;
  t = s - cy;
  cy2 = t > s;
  cy = cy1 | cy2;
  z[8] = t;
}
#endif

#ifndef HAVE_NATIVE_MOD_1
#define HAVE_LONGLONG_MOD_1 1
static void
mod_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p)
{
  int i;
  mp_limb_t q[1+1], r[1];
  assert (p[1-1] != 0);
  mpn_tdiv_qr(q, r, 0, x, 2*1, p, 1);
  for (i = 0; i < 1; ++i)
    z[i] = r[i];
}
#endif

#ifndef HAVE_NATIVE_MOD_2
#define HAVE_LONGLONG_MOD_2 1
static void
mod_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p)
{
  int i;
  mp_limb_t q[2+1], r[2];
  assert (p[2-1] != 0);
  mpn_tdiv_qr(q, r, 0, x, 2*2, p, 2);
  for (i = 0; i < 2; ++i)
    z[i] = r[i];
}
#endif

#ifndef HAVE_NATIVE_MOD_3
#define HAVE_LONGLONG_MOD_3 1
static void
mod_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p)
{
  int i;
  mp_limb_t q[3+1], r[3];
  assert (p[3-1] != 0);
  mpn_tdiv_qr(q, r, 0, x, 2*3, p, 3);
  for (i = 0; i < 3; ++i)
    z[i] = r[i];
}
#endif

#ifndef HAVE_NATIVE_MOD_4
#define HAVE_LONGLONG_MOD_4 1
static void
mod_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p)
{
  int i;
  mp_limb_t q[4+1], r[4];
  assert (p[4-1] != 0);
  mpn_tdiv_qr(q, r, 0, x, 2*4, p, 4);
  for (i = 0; i < 4; ++i)
    z[i] = r[i];
}
#endif

#ifndef HAVE_NATIVE_MOD_5
#define HAVE_LONGLONG_MOD_5 1
static void
mod_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p)
{
  int i;
  mp_limb_t q[5+1], r[5];
  assert (p[5-1] != 0);
  mpn_tdiv_qr(q, r, 0, x, 2*5, p, 5);
  for (i = 0; i < 5; ++i)
    z[i] = r[i];
}
#endif

#ifndef HAVE_NATIVE_MOD_6
#define HAVE_LONGLONG_MOD_6 1
static void
mod_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p)
{
  int i;
  mp_limb_t q[6+1], r[6];
  assert (p[6-1] != 0);
  mpn_tdiv_qr(q, r, 0, x, 2*6, p, 6);
  for (i = 0; i < 6; ++i)
    z[i] = r[i];
}
#endif

#ifndef HAVE_NATIVE_MOD_7
#define HAVE_LONGLONG_MOD_7 1
static void
mod_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p)
{
  int i;
  mp_limb_t q[7+1], r[7];
  assert (p[7-1] != 0);
  mpn_tdiv_qr(q, r, 0, x, 2*7, p, 7);
  for (i = 0; i < 7; ++i)
    z[i] = r[i];
}
#endif

#ifndef HAVE_NATIVE_MOD_8
#define HAVE_LONGLONG_MOD_8 1
static void
mod_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p)
{
  int i;
  mp_limb_t q[8+1], r[8];
  assert (p[8-1] != 0);
  mpn_tdiv_qr(q, r, 0, x, 2*8, p, 8);
  for (i = 0; i < 8; ++i)
    z[i] = r[i];
}
#endif

#ifndef HAVE_NATIVE_MOD_9
#define HAVE_LONGLONG_MOD_9 1
static void
mod_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p)
{
  int i;
  mp_limb_t q[9+1], r[9];
  assert (p[9-1] != 0);
  mpn_tdiv_qr(q, r, 0, x, 2*9, p, 9);
  for (i = 0; i < 9; ++i)
    z[i] = r[i];
}
#endif

#ifndef HAVE_NATIVE_CMP_1
#define HAVE_LONGLONG_CMP_1 1
static int
cmp_1(const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 1-1; i >= 0; --i) {
    if (x[i] > y[i])
      return 1;
    if (x[i] < y[i])
      return -1;
  }
  return 0;
}
#endif

#ifndef HAVE_NATIVE_CMP_2
#define HAVE_LONGLONG_CMP_2 1
static int
cmp_2(const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 2-1; i >= 0; --i) {
    if (x[i] > y[i])
      return 1;
    if (x[i] < y[i])
      return -1;
  }
  return 0;
}
#endif

#ifndef HAVE_NATIVE_CMP_3
#define HAVE_LONGLONG_CMP_3 1
static int
cmp_3(const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 3-1; i >= 0; --i) {
    if (x[i] > y[i])
      return 1;
    if (x[i] < y[i])
      return -1;
  }
  return 0;
}
#endif

#ifndef HAVE_NATIVE_CMP_4
#define HAVE_LONGLONG_CMP_4 1
static int
cmp_4(const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 4-1; i >= 0; --i) {
    if (x[i] > y[i])
      return 1;
    if (x[i] < y[i])
      return -1;
  }
  return 0;
}
#endif

#ifndef HAVE_NATIVE_CMP_5
#define HAVE_LONGLONG_CMP_5 1
static int
cmp_5(const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 5-1; i >= 0; --i) {
    if (x[i] > y[i])
      return 1;
    if (x[i] < y[i])
      return -1;
  }
  return 0;
}
#endif

#ifndef HAVE_NATIVE_CMP_6
#define HAVE_LONGLONG_CMP_6 1
static int
cmp_6(const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 6-1; i >= 0; --i) {
    if (x[i] > y[i])
      return 1;
    if (x[i] < y[i])
      return -1;
  }
  return 0;
}
#endif

#ifndef HAVE_NATIVE_CMP_7
#define HAVE_LONGLONG_CMP_7 1
static int
cmp_7(const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 7-1; i >= 0; --i) {
    if (x[i] > y[i])
      return 1;
    if (x[i] < y[i])
      return -1;
  }
  return 0;
}
#endif

#ifndef HAVE_NATIVE_CMP_8
#define HAVE_LONGLONG_CMP_8 1
static int
cmp_8(const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 8-1; i >= 0; --i) {
    if (x[i] > y[i])
      return 1;
    if (x[i] < y[i])
      return -1;
  }
  return 0;
}
#endif

#ifndef HAVE_NATIVE_CMP_9
#define HAVE_LONGLONG_CMP_9 1
static int
cmp_9(const mp_limb_t *x, const mp_limb_t *y)
{
  int i;
  for (i = 9-1; i >= 0; --i) {
    if (x[i] > y[i])
      return 1;
    if (x[i] < y[i])
      return -1;
  }
  return 0;
}
#endif

#ifndef HAVE_NATIVE_REDC_1
#define HAVE_LONGLONG_REDC_1 1
static void
redc_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p) 
{
  mp_limb_t m[1], t[2*1];
  int i;

  shortmul_1(m, x, mip);
  mul_1(t, m, p);
  add_2(t, t, x);
  if (cmp_1(t+1, p) > 0)
    sub_1(z, t+1, p);
  else
    for (i=0; i<1; ++i)
      z[i] = t[i+1];
}
#endif

#ifndef HAVE_NATIVE_REDC_2
#define HAVE_LONGLONG_REDC_2 1
static void
redc_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p) 
{
  mp_limb_t m[2], t[2*2];
  int i;

  shortmul_2(m, x, mip);
  mul_2(t, m, p);
  add_4(t, t, x);
  if (cmp_2(t+2, p) > 0)
    sub_2(z, t+2, p);
  else
    for (i=0; i<2; ++i)
      z[i] = t[i+2];
}
#endif

#ifndef HAVE_NATIVE_REDC_3
#define HAVE_LONGLONG_REDC_3 1
static void
redc_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p) 
{
  mp_limb_t m[3], t[2*3];
  int i;

  shortmul_3(m, x, mip);
  mul_3(t, m, p);
  add_6(t, t, x);
  if (cmp_3(t+3, p) > 0)
    sub_3(z, t+3, p);
  else
    for (i=0; i<3; ++i)
      z[i] = t[i+3];
}
#endif

#ifndef HAVE_NATIVE_REDC_4
#define HAVE_LONGLONG_REDC_4 1
static void
redc_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p) 
{
  mp_limb_t m[4], t[2*4];
  int i;

  shortmul_4(m, x, mip);
  mul_4(t, m, p);
  add_8(t, t, x);
  if (cmp_4(t+4, p) > 0)
    sub_4(z, t+4, p);
  else
    for (i=0; i<4; ++i)
      z[i] = t[i+4];
}
#endif

#ifndef HAVE_NATIVE_REDC_5
#define HAVE_LONGLONG_REDC_5 1
static void
redc_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p) 
{
  mp_limb_t m[5], t[2*5];
  int i;

  shortmul_5(m, x, mip);
  mul_5(t, m, p);
  mpn_add_n(t, t, x, 10);
  if (cmp_5(t+5, p) > 0)
    sub_5(z, t+5, p);
  else
    for (i=0; i<5; ++i)
      z[i] = t[i+5];
}
#endif

#ifndef HAVE_NATIVE_REDC_6
#define HAVE_LONGLONG_REDC_6 1
static void
redc_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p) 
{
  mp_limb_t m[6], t[2*6];
  int i;

  shortmul_6(m, x, mip);
  mul_6(t, m, p);
  mpn_add_n(t, t, x, 12);
  if (cmp_6(t+6, p) > 0)
    sub_6(z, t+6, p);
  else
    for (i=0; i<6; ++i)
      z[i] = t[i+6];
}
#endif

#ifndef HAVE_NATIVE_REDC_7
#define HAVE_LONGLONG_REDC_7 1
static void
redc_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p) 
{
  mp_limb_t m[7], t[2*7];
  int i;

  shortmul_7(m, x, mip);
  mul_7(t, m, p);
  mpn_add_n(t, t, x, 14);
  if (cmp_7(t+7, p) > 0)
    sub_7(z, t+7, p);
  else
    for (i=0; i<7; ++i)
      z[i] = t[i+7];
}
#endif

#ifndef HAVE_NATIVE_REDC_8
#define HAVE_LONGLONG_REDC_8 1
static void
redc_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p) 
{
  mp_limb_t m[8], t[2*8];
  int i;

  shortmul_8(m, x, mip);
  mul_8(t, m, p);
  mpn_add_n(t, t, x, 16);
  if (cmp_8(t+8, p) > 0)
    sub_8(z, t+8, p);
  else
    for (i=0; i<8; ++i)
      z[i] = t[i+8];
}
#endif

#ifndef HAVE_NATIVE_REDC_9
#define HAVE_LONGLONG_REDC_9 1
static void
redc_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *mip, const mp_limb_t *p) 
{
  mp_limb_t m[9], t[2*9];
  int i;

  shortmul_9(m, x, mip);
  mul_9(t, m, p);
  mpn_add_n(t, t, x, 18);
  if (cmp_9(t+9, p) > 0)
    sub_9(z, t+9, p);
  else
    for (i=0; i<9; ++i)
      z[i] = t[i+9];
}
#endif

#ifndef HAVE_NATIVE_MGY_ENCODE_1
#define HAVE_LONGLONG_MGY_ENCODE_1 1
static void
mgy_encode_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p) 
{
  mp_limb_t t[2];
  int i;
  for (i = 0; i < 1; ++i) {
    t[i] = 0;
    t[i+1] = x[i];
  }
  mod_1(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_ENCODE_2
#define HAVE_LONGLONG_MGY_ENCODE_2 1
static void
mgy_encode_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p) 
{
  mp_limb_t t[4];
  int i;
  for (i = 0; i < 2; ++i) {
    t[i] = 0;
    t[i+2] = x[i];
  }
  mod_2(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_ENCODE_3
#define HAVE_LONGLONG_MGY_ENCODE_3 1
static void
mgy_encode_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p) 
{
  mp_limb_t t[6];
  int i;
  for (i = 0; i < 3; ++i) {
    t[i] = 0;
    t[i+3] = x[i];
  }
  mod_3(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_ENCODE_4
#define HAVE_LONGLONG_MGY_ENCODE_4 1
static void
mgy_encode_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p) 
{
  mp_limb_t t[8];
  int i;
  for (i = 0; i < 4; ++i) {
    t[i] = 0;
    t[i+4] = x[i];
  }
  mod_4(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_ENCODE_5
#define HAVE_LONGLONG_MGY_ENCODE_5 1
static void
mgy_encode_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p) 
{
  mp_limb_t t[10];
  int i;
  for (i = 0; i < 5; ++i) {
    t[i] = 0;
    t[i+5] = x[i];
  }
  mod_5(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_ENCODE_6
#define HAVE_LONGLONG_MGY_ENCODE_6 1
static void
mgy_encode_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p) 
{
  mp_limb_t t[12];
  int i;
  for (i = 0; i < 6; ++i) {
    t[i] = 0;
    t[i+6] = x[i];
  }
  mod_6(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_ENCODE_7
#define HAVE_LONGLONG_MGY_ENCODE_7 1
static void
mgy_encode_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p) 
{
  mp_limb_t t[14];
  int i;
  for (i = 0; i < 7; ++i) {
    t[i] = 0;
    t[i+7] = x[i];
  }
  mod_7(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_ENCODE_8
#define HAVE_LONGLONG_MGY_ENCODE_8 1
static void
mgy_encode_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p) 
{
  mp_limb_t t[16];
  int i;
  for (i = 0; i < 8; ++i) {
    t[i] = 0;
    t[i+8] = x[i];
  }
  mod_8(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_ENCODE_9
#define HAVE_LONGLONG_MGY_ENCODE_9 1
static void
mgy_encode_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p) 
{
  mp_limb_t t[18];
  int i;
  for (i = 0; i < 9; ++i) {
    t[i] = 0;
    t[i+9] = x[i];
  }
  mod_9(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_DECODE_1
#define HAVE_LONGLONG_MGY_DECODE_1 1
static void
mgy_decode_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p) 
{
  mp_limb_t t[2];
  int i;
  mul_1(t, x, invR);
  mod_1(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_DECODE_2
#define HAVE_LONGLONG_MGY_DECODE_2 1
static void
mgy_decode_2(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p) 
{
  mp_limb_t t[4];
  int i;
  mul_2(t, x, invR);
  mod_2(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_DECODE_3
#define HAVE_LONGLONG_MGY_DECODE_3 1
static void
mgy_decode_3(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p) 
{
  mp_limb_t t[6];
  int i;
  mul_3(t, x, invR);
  mod_3(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_DECODE_4
#define HAVE_LONGLONG_MGY_DECODE_4 1
static void
mgy_decode_4(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p) 
{
  mp_limb_t t[8];
  int i;
  mul_4(t, x, invR);
  mod_4(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_DECODE_5
#define HAVE_LONGLONG_MGY_DECODE_5 1
static void
mgy_decode_5(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p) 
{
  mp_limb_t t[10];
  int i;
  mul_5(t, x, invR);
  mod_5(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_DECODE_6
#define HAVE_LONGLONG_MGY_DECODE_6 1
static void
mgy_decode_6(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p) 
{
  mp_limb_t t[12];
  int i;
  mul_6(t, x, invR);
  mod_6(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_DECODE_7
#define HAVE_LONGLONG_MGY_DECODE_7 1
static void
mgy_decode_7(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p) 
{
  mp_limb_t t[14];
  int i;
  mul_7(t, x, invR);
  mod_7(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_DECODE_8
#define HAVE_LONGLONG_MGY_DECODE_8 1
static void
mgy_decode_8(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p) 
{
  mp_limb_t t[16];
  int i;
  mul_8(t, x, invR);
  mod_8(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_MGY_DECODE_9
#define HAVE_LONGLONG_MGY_DECODE_9 1
static void
mgy_decode_9(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *invR, const mp_limb_t *p) 
{
  mp_limb_t t[18];
  int i;
  mul_9(t, x, invR);
  mod_9(z, t, p);
}
#endif

#ifndef HAVE_NATIVE_SHIFTS_1
#define HAVE_LONGLONG_SHIFTS_1 1
static inline void lshift_1(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 1-1; i>0; --i) {
      a[i] <<= cnt;
      a[i] |= (a[i-1] >> dnt);
    }
    a[0] <<= cnt;
  }
}

static inline void long_lshift_1(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 1-1; i>off; --i) {
      a[i] = (a[i-off]<<cnt) | (a[i-off-1]>>dnt);
    }
    a[off] = a[0]<<cnt;
    for (i = off-1; i>=0; --i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 1-1; i >= off; --i)
      a[i] = a[i-off];
    for (i = off-1; i >= 0; --i)
      a[i] = 0;
  }
}


static inline void rshift_1(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 0; i < 1-1; ++i) {
      a[i] >>= cnt;
      a[i] |= (a[i+1] << dnt);
    }
    a[1-1] >>= cnt;
  }
}


static inline void long_rshift_1(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 0; i < 1 - off - 1; ++i) {
      a[i] = (a[i+off]>>cnt) | (a[i+off+1]<<dnt);
    }
    a[1-off-1] = a[1-1]>>cnt;
    for (i = 1-off; i < 1; ++i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 0; i < 1-off; ++i)
      a[i] = a[i+off];
    for (i = 1-off; i < 1; ++i)
      a[i] = 0;
  }
}
#endif

#ifndef HAVE_NATIVE_SHIFTS_2
#define HAVE_LONGLONG_SHIFTS_2 1
static inline void lshift_2(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 2-1; i>0; --i) {
      a[i] <<= cnt;
      a[i] |= (a[i-1] >> dnt);
    }
    a[0] <<= cnt;
  }
}

static inline void long_lshift_2(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 2-1; i>off; --i) {
      a[i] = (a[i-off]<<cnt) | (a[i-off-1]>>dnt);
    }
    a[off] = a[0]<<cnt;
    for (i = off-1; i>=0; --i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 2-1; i >= off; --i)
      a[i] = a[i-off];
    for (i = off-1; i >= 0; --i)
      a[i] = 0;
  }
}


static inline void rshift_2(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 0; i < 2-1; ++i) {
      a[i] >>= cnt;
      a[i] |= (a[i+1] << dnt);
    }
    a[2-1] >>= cnt;
  }
}


static inline void long_rshift_2(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 0; i < 2 - off - 1; ++i) {
      a[i] = (a[i+off]>>cnt) | (a[i+off+1]<<dnt);
    }
    a[2-off-1] = a[2-1]>>cnt;
    for (i = 2-off; i < 2; ++i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 0; i < 2-off; ++i)
      a[i] = a[i+off];
    for (i = 2-off; i < 2; ++i)
      a[i] = 0;
  }
}
#endif

#ifndef HAVE_NATIVE_SHIFTS_3
#define HAVE_LONGLONG_SHIFTS_3 1
static inline void lshift_3(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 3-1; i>0; --i) {
      a[i] <<= cnt;
      a[i] |= (a[i-1] >> dnt);
    }
    a[0] <<= cnt;
  }
}

static inline void long_lshift_3(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 3-1; i>off; --i) {
      a[i] = (a[i-off]<<cnt) | (a[i-off-1]>>dnt);
    }
    a[off] = a[0]<<cnt;
    for (i = off-1; i>=0; --i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 3-1; i >= off; --i)
      a[i] = a[i-off];
    for (i = off-1; i >= 0; --i)
      a[i] = 0;
  }
}


static inline void rshift_3(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 0; i < 3-1; ++i) {
      a[i] >>= cnt;
      a[i] |= (a[i+1] << dnt);
    }
    a[3-1] >>= cnt;
  }
}


static inline void long_rshift_3(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 0; i < 3 - off - 1; ++i) {
      a[i] = (a[i+off]>>cnt) | (a[i+off+1]<<dnt);
    }
    a[3-off-1] = a[3-1]>>cnt;
    for (i = 3-off; i < 3; ++i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 0; i < 3-off; ++i)
      a[i] = a[i+off];
    for (i = 3-off; i < 3; ++i)
      a[i] = 0;
  }
}
#endif

#ifndef HAVE_NATIVE_SHIFTS_4
#define HAVE_LONGLONG_SHIFTS_4 1
static inline void lshift_4(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 4-1; i>0; --i) {
      a[i] <<= cnt;
      a[i] |= (a[i-1] >> dnt);
    }
    a[0] <<= cnt;
  }
}

static inline void long_lshift_4(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 4-1; i>off; --i) {
      a[i] = (a[i-off]<<cnt) | (a[i-off-1]>>dnt);
    }
    a[off] = a[0]<<cnt;
    for (i = off-1; i>=0; --i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 4-1; i >= off; --i)
      a[i] = a[i-off];
    for (i = off-1; i >= 0; --i)
      a[i] = 0;
  }
}


static inline void rshift_4(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 0; i < 4-1; ++i) {
      a[i] >>= cnt;
      a[i] |= (a[i+1] << dnt);
    }
    a[4-1] >>= cnt;
  }
}


static inline void long_rshift_4(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 0; i < 4 - off - 1; ++i) {
      a[i] = (a[i+off]>>cnt) | (a[i+off+1]<<dnt);
    }
    a[4-off-1] = a[4-1]>>cnt;
    for (i = 4-off; i < 4; ++i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 0; i < 4-off; ++i)
      a[i] = a[i+off];
    for (i = 4-off; i < 4; ++i)
      a[i] = 0;
  }
}
#endif

#ifndef HAVE_NATIVE_SHIFTS_5
#define HAVE_LONGLONG_SHIFTS_5 1
static inline void lshift_5(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 5-1; i>0; --i) {
      a[i] <<= cnt;
      a[i] |= (a[i-1] >> dnt);
    }
    a[0] <<= cnt;
  }
}

static inline void long_lshift_5(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 5-1; i>off; --i) {
      a[i] = (a[i-off]<<cnt) | (a[i-off-1]>>dnt);
    }
    a[off] = a[0]<<cnt;
    for (i = off-1; i>=0; --i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 5-1; i >= off; --i)
      a[i] = a[i-off];
    for (i = off-1; i >= 0; --i)
      a[i] = 0;
  }
}


static inline void rshift_5(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 0; i < 5-1; ++i) {
      a[i] >>= cnt;
      a[i] |= (a[i+1] << dnt);
    }
    a[5-1] >>= cnt;
  }
}


static inline void long_rshift_5(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 0; i < 5 - off - 1; ++i) {
      a[i] = (a[i+off]>>cnt) | (a[i+off+1]<<dnt);
    }
    a[5-off-1] = a[5-1]>>cnt;
    for (i = 5-off; i < 5; ++i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 0; i < 5-off; ++i)
      a[i] = a[i+off];
    for (i = 5-off; i < 5; ++i)
      a[i] = 0;
  }
}
#endif

#ifndef HAVE_NATIVE_SHIFTS_6
#define HAVE_LONGLONG_SHIFTS_6 1
static inline void lshift_6(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 6-1; i>0; --i) {
      a[i] <<= cnt;
      a[i] |= (a[i-1] >> dnt);
    }
    a[0] <<= cnt;
  }
}

static inline void long_lshift_6(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 6-1; i>off; --i) {
      a[i] = (a[i-off]<<cnt) | (a[i-off-1]>>dnt);
    }
    a[off] = a[0]<<cnt;
    for (i = off-1; i>=0; --i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 6-1; i >= off; --i)
      a[i] = a[i-off];
    for (i = off-1; i >= 0; --i)
      a[i] = 0;
  }
}


static inline void rshift_6(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 0; i < 6-1; ++i) {
      a[i] >>= cnt;
      a[i] |= (a[i+1] << dnt);
    }
    a[6-1] >>= cnt;
  }
}


static inline void long_rshift_6(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 0; i < 6 - off - 1; ++i) {
      a[i] = (a[i+off]>>cnt) | (a[i+off+1]<<dnt);
    }
    a[6-off-1] = a[6-1]>>cnt;
    for (i = 6-off; i < 6; ++i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 0; i < 6-off; ++i)
      a[i] = a[i+off];
    for (i = 6-off; i < 6; ++i)
      a[i] = 0;
  }
}
#endif

#ifndef HAVE_NATIVE_SHIFTS_7
#define HAVE_LONGLONG_SHIFTS_7 1
static inline void lshift_7(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 7-1; i>0; --i) {
      a[i] <<= cnt;
      a[i] |= (a[i-1] >> dnt);
    }
    a[0] <<= cnt;
  }
}

static inline void long_lshift_7(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 7-1; i>off; --i) {
      a[i] = (a[i-off]<<cnt) | (a[i-off-1]>>dnt);
    }
    a[off] = a[0]<<cnt;
    for (i = off-1; i>=0; --i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 7-1; i >= off; --i)
      a[i] = a[i-off];
    for (i = off-1; i >= 0; --i)
      a[i] = 0;
  }
}


static inline void rshift_7(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 0; i < 7-1; ++i) {
      a[i] >>= cnt;
      a[i] |= (a[i+1] << dnt);
    }
    a[7-1] >>= cnt;
  }
}


static inline void long_rshift_7(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 0; i < 7 - off - 1; ++i) {
      a[i] = (a[i+off]>>cnt) | (a[i+off+1]<<dnt);
    }
    a[7-off-1] = a[7-1]>>cnt;
    for (i = 7-off; i < 7; ++i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 0; i < 7-off; ++i)
      a[i] = a[i+off];
    for (i = 7-off; i < 7; ++i)
      a[i] = 0;
  }
}
#endif

#ifndef HAVE_NATIVE_SHIFTS_8
#define HAVE_LONGLONG_SHIFTS_8 1
static inline void lshift_8(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 8-1; i>0; --i) {
      a[i] <<= cnt;
      a[i] |= (a[i-1] >> dnt);
    }
    a[0] <<= cnt;
  }
}

static inline void long_lshift_8(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 8-1; i>off; --i) {
      a[i] = (a[i-off]<<cnt) | (a[i-off-1]>>dnt);
    }
    a[off] = a[0]<<cnt;
    for (i = off-1; i>=0; --i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 8-1; i >= off; --i)
      a[i] = a[i-off];
    for (i = off-1; i >= 0; --i)
      a[i] = 0;
  }
}


static inline void rshift_8(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 0; i < 8-1; ++i) {
      a[i] >>= cnt;
      a[i] |= (a[i+1] << dnt);
    }
    a[8-1] >>= cnt;
  }
}


static inline void long_rshift_8(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 0; i < 8 - off - 1; ++i) {
      a[i] = (a[i+off]>>cnt) | (a[i+off+1]<<dnt);
    }
    a[8-off-1] = a[8-1]>>cnt;
    for (i = 8-off; i < 8; ++i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 0; i < 8-off; ++i)
      a[i] = a[i+off];
    for (i = 8-off; i < 8; ++i)
      a[i] = 0;
  }
}
#endif

#ifndef HAVE_NATIVE_SHIFTS_9
#define HAVE_LONGLONG_SHIFTS_9 1
static inline void lshift_9(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 9-1; i>0; --i) {
      a[i] <<= cnt;
      a[i] |= (a[i-1] >> dnt);
    }
    a[0] <<= cnt;
  }
}

static inline void long_lshift_9(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 9-1; i>off; --i) {
      a[i] = (a[i-off]<<cnt) | (a[i-off-1]>>dnt);
    }
    a[off] = a[0]<<cnt;
    for (i = off-1; i>=0; --i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 9-1; i >= off; --i)
      a[i] = a[i-off];
    for (i = off-1; i >= 0; --i)
      a[i] = 0;
  }
}


static inline void rshift_9(mp_limb_t *a, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  if (cnt != 0) {
    for (i = 0; i < 9-1; ++i) {
      a[i] >>= cnt;
      a[i] |= (a[i+1] << dnt);
    }
    a[9-1] >>= cnt;
  }
}


static inline void long_rshift_9(mp_limb_t *a, int off, int cnt) {
  int i;
  int dnt = GMP_NUMB_BITS - cnt;
  assert (off > 0);
  if (cnt != 0) {
    for (i = 0; i < 9 - off - 1; ++i) {
      a[i] = (a[i+off]>>cnt) | (a[i+off+1]<<dnt);
    }
    a[9-off-1] = a[9-1]>>cnt;
    for (i = 9-off; i < 9; ++i) {
      a[i] = 0UL;
    }
  } else {
    for (i = 0; i < 9-off; ++i)
      a[i] = a[i+off];
    for (i = 9-off; i < 9; ++i)
      a[i] = 0;
  }
}
#endif

#ifndef HAVE_NATIVE_INVMOD1
#define HAVE_LONGLONG_INVMOD_1 1
static int
invmod_1(mp_limb_t *z, const mp_limb_t *x, const mp_limb_t *p) {
  mp_limb_t a, b, u, v, fix;
  int t, lsh;

  a = *x;
  b = *p;

  if (a == 0) {
    fprintf(stderr, "Error, division by zero in invmod_1\n");
    exit(1);
  }
      

  fix = (b+1)>>1;

  assert (a < b);

  u = 1; v = 0; t = 0;
  
  count_trailing_zeros(lsh, a);
  a >>= lsh;
  t += lsh;
  v <<= lsh;
  do {
    do {
      b -= a; v += u;
      count_trailing_zeros(lsh, b);
      b >>= lsh;
      t += lsh;
      u <<= lsh;
    } while (a<b);
    if (a == b)
      break;
    do {
      a -= b; u += v;
      count_trailing_zeros(lsh, a);
      a >>= lsh;
      t += lsh;
      v <<= lsh;
    } while (b < a);
  } while (a != b);
  if (a != 1) {
    *z = a;
    return 0;
  }
  while (t>0) {
    mp_limb_t sig = u & 1UL;
    u >>= 1;
    if (sig)
      u += fix;
    --t;
  } 
  *z = u;
  return 1;
}
#endif

#ifndef HAVE_NATIVE_INVMOD2
#define HAVE_LONGLONG_INVMOD_2 1
static int
invmod_2(mp_limb_t *res, const mp_limb_t *x, const mp_limb_t *p) {
  mp_limb_t u[2], v[2], a[2], b[2], fix[2];
  int i, t, lsh;

  u[0] = 1UL; v[0] = 0UL;
  a[0] = x[0]; b[0] = p[0];
  for (i=1; i < 2; ++i) {
    u[i] = 0UL; v[i] = 0UL;
    a[i] = x[i]; b[i] = p[i];
  }
  
  if (cmp_2(a, v) == 0) {
    fprintf(stderr, "Error, division by zero in invmod_2\n");
    exit(1);
  }

  add_2(fix, b, u);
  rshift_2(fix, 1);

  assert (cmp_2(a,b) < 0);

  t = 0;
  
  if (a[0] != 0) {
    count_trailing_zeros(lsh, a[0]);
    rshift_2(a, lsh);
    t += lsh;
    lshift_2(v, lsh);
  } else { // rare...
//    fprintf(stderr, "XOURIG\n");
    i = 1;
    while (a[i] == 0)
      ++i;
    assert (i <= 2);
    count_trailing_zeros(lsh, a[i]);
    long_rshift_2(a, i, lsh);
    t += lsh + i*GMP_NUMB_BITS;
    long_lshift_2(v, i, lsh);
  }

  do {
    do {
      sub_2(b, b, a);
      add_2(v, v, u);
      if (b[0] != 0) {
        count_trailing_zeros(lsh, b[0]);
        rshift_2(b, lsh);
        t += lsh;
        lshift_2(u, lsh);
      } else {  // Should almost never occur.
 //       fprintf(stderr, "XOURIG\n");
        i = 1;
        while (b[i] == 0)
          ++i;
        assert (i <= 2);
        count_trailing_zeros(lsh, b[i]);
        long_rshift_2(b, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_2(u, i, lsh);
      }
    } while (cmp_2(a,b) < 0);
    if (cmp_2(a, b) == 0)
      break;
    do {
      sub_2(a, a, b);
      add_2(u, u, v);
      if (a[0] != 0) {
        count_trailing_zeros(lsh, a[0]);
        rshift_2(a, lsh);
        t += lsh;
        lshift_2(v, lsh);
      } else { // rare...
//        fprintf(stderr, "XOURIG\n");
        i = 1;
        while (a[i] == 0)
          ++i;
        assert (i <= 2);
        count_trailing_zeros(lsh, a[i]);
        long_rshift_2(a, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_2(v, i, lsh);
      }
    } while (cmp_2(b,a)<0);
  } while (cmp_2(a,b) != 0);
  {
    int ok = 1;
    if (a[0] != 1)
      ok = 0;
    else {
      for (i = 1; i < 2; ++i) 
        if (a[1] != 0) 
	  ok = 0;
    }
    if (!ok) 
      return 0;
  }
  while (t>0) {
    mp_limb_t sig = u[0] & 1UL;
    rshift_2(u, 1);
    if (sig)
      add_2(u, u, fix);
    --t;
  }
  for (i = 0; i < 2; ++i) {
    res[i] = u[i];
  }
  return 1;
}
#endif

#ifndef HAVE_NATIVE_INVMOD3
#define HAVE_LONGLONG_INVMOD_3 1
static int
invmod_3(mp_limb_t *res, const mp_limb_t *x, const mp_limb_t *p) {
  mp_limb_t u[3], v[3], a[3], b[3], fix[3];
  int i, t, lsh;

  u[0] = 1UL; v[0] = 0UL;
  a[0] = x[0]; b[0] = p[0];
  for (i=1; i < 3; ++i) {
    u[i] = 0UL; v[i] = 0UL;
    a[i] = x[i]; b[i] = p[i];
  }
  
  if (cmp_3(a, v) == 0) {
    fprintf(stderr, "Error, division by zero in invmod_3\n");
    exit(1);
  }

  add_3(fix, b, u);
  rshift_3(fix, 1);

  assert (cmp_3(a,b) < 0);

  t = 0;
  
  if (a[0] != 0) {
    count_trailing_zeros(lsh, a[0]);
    rshift_3(a, lsh);
    t += lsh;
    lshift_3(v, lsh);
  } else { // rare...
//    fprintf(stderr, "XOURIG\n");
    i = 1;
    while (a[i] == 0)
      ++i;
    assert (i <= 3);
    count_trailing_zeros(lsh, a[i]);
    long_rshift_3(a, i, lsh);
    t += lsh + i*GMP_NUMB_BITS;
    long_lshift_3(v, i, lsh);
  }

  do {
    do {
      sub_3(b, b, a);
      add_3(v, v, u);
      if (b[0] != 0) {
        count_trailing_zeros(lsh, b[0]);
        rshift_3(b, lsh);
        t += lsh;
        lshift_3(u, lsh);
      } else {  // Should almost never occur.
 //       fprintf(stderr, "XOURIG\n");
        i = 1;
        while (b[i] == 0)
          ++i;
        assert (i <= 3);
        count_trailing_zeros(lsh, b[i]);
        long_rshift_3(b, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_3(u, i, lsh);
      }
    } while (cmp_3(a,b) < 0);
    if (cmp_3(a, b) == 0)
      break;
    do {
      sub_3(a, a, b);
      add_3(u, u, v);
      if (a[0] != 0) {
        count_trailing_zeros(lsh, a[0]);
        rshift_3(a, lsh);
        t += lsh;
        lshift_3(v, lsh);
      } else { // rare...
//        fprintf(stderr, "XOURIG\n");
        i = 1;
        while (a[i] == 0)
          ++i;
        assert (i <= 3);
        count_trailing_zeros(lsh, a[i]);
        long_rshift_3(a, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_3(v, i, lsh);
      }
    } while (cmp_3(b,a)<0);
  } while (cmp_3(a,b) != 0);
  {
    int ok = 1;
    if (a[0] != 1)
      ok = 0;
    else {
      for (i = 1; i < 3; ++i) 
        if (a[1] != 0) 
	  ok = 0;
    }
    if (!ok) 
      return 0;
  }
  while (t>0) {
    mp_limb_t sig = u[0] & 1UL;
    rshift_3(u, 1);
    if (sig)
      add_3(u, u, fix);
    --t;
  }
  for (i = 0; i < 3; ++i) {
    res[i] = u[i];
  }
  return 1;
}
#endif

#ifndef HAVE_NATIVE_INVMOD4
#define HAVE_LONGLONG_INVMOD_4 1
static int
invmod_4(mp_limb_t *res, const mp_limb_t *x, const mp_limb_t *p) {
  mp_limb_t u[4], v[4], a[4], b[4], fix[4];
  int i, t, lsh;

  u[0] = 1UL; v[0] = 0UL;
  a[0] = x[0]; b[0] = p[0];
  for (i=1; i < 4; ++i) {
    u[i] = 0UL; v[i] = 0UL;
    a[i] = x[i]; b[i] = p[i];
  }
  
  if (cmp_4(a, v) == 0) {
    fprintf(stderr, "Error, division by zero in invmod_4\n");
    exit(1);
  }

  add_4(fix, b, u);
  rshift_4(fix, 1);

  assert (cmp_4(a,b) < 0);

  t = 0;
  
  if (a[0] != 0) {
    count_trailing_zeros(lsh, a[0]);
    rshift_4(a, lsh);
    t += lsh;
    lshift_4(v, lsh);
  } else { // rare...
//    fprintf(stderr, "XOURIG\n");
    i = 1;
    while (a[i] == 0)
      ++i;
    assert (i <= 4);
    count_trailing_zeros(lsh, a[i]);
    long_rshift_4(a, i, lsh);
    t += lsh + i*GMP_NUMB_BITS;
    long_lshift_4(v, i, lsh);
  }

  do {
    do {
      sub_4(b, b, a);
      add_4(v, v, u);
      if (b[0] != 0) {
        count_trailing_zeros(lsh, b[0]);
        rshift_4(b, lsh);
        t += lsh;
        lshift_4(u, lsh);
      } else {  // Should almost never occur.
 //       fprintf(stderr, "XOURIG\n");
        i = 1;
        while (b[i] == 0)
          ++i;
        assert (i <= 4);
        count_trailing_zeros(lsh, b[i]);
        long_rshift_4(b, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_4(u, i, lsh);
      }
    } while (cmp_4(a,b) < 0);
    if (cmp_4(a, b) == 0)
      break;
    do {
      sub_4(a, a, b);
      add_4(u, u, v);
      if (a[0] != 0) {
        count_trailing_zeros(lsh, a[0]);
        rshift_4(a, lsh);
        t += lsh;
        lshift_4(v, lsh);
      } else { // rare...
//        fprintf(stderr, "XOURIG\n");
        i = 1;
        while (a[i] == 0)
          ++i;
        assert (i <= 4);
        count_trailing_zeros(lsh, a[i]);
        long_rshift_4(a, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_4(v, i, lsh);
      }
    } while (cmp_4(b,a)<0);
  } while (cmp_4(a,b) != 0);
  {
    int ok = 1;
    if (a[0] != 1)
      ok = 0;
    else {
      for (i = 1; i < 4; ++i) 
        if (a[1] != 0) 
	  ok = 0;
    }
    if (!ok) 
      return 0;
  }
  while (t>0) {
    mp_limb_t sig = u[0] & 1UL;
    rshift_4(u, 1);
    if (sig)
      add_4(u, u, fix);
    --t;
  }
  for (i = 0; i < 4; ++i) {
    res[i] = u[i];
  }
  return 1;
}
#endif

#ifndef HAVE_NATIVE_INVMOD5
#define HAVE_LONGLONG_INVMOD_5 1
static int
invmod_5(mp_limb_t *res, const mp_limb_t *x, const mp_limb_t *p) {
  mp_limb_t u[5], v[5], a[5], b[5], fix[5];
  int i, t, lsh;

  u[0] = 1UL; v[0] = 0UL;
  a[0] = x[0]; b[0] = p[0];
  for (i=1; i < 5; ++i) {
    u[i] = 0UL; v[i] = 0UL;
    a[i] = x[i]; b[i] = p[i];
  }
  
  if (cmp_5(a, v) == 0) {
    fprintf(stderr, "Error, division by zero in invmod_5\n");
    exit(1);
  }

  add_5(fix, b, u);
  rshift_5(fix, 1);

  assert (cmp_5(a,b) < 0);

  t = 0;
  
  if (a[0] != 0) {
    count_trailing_zeros(lsh, a[0]);
    rshift_5(a, lsh);
    t += lsh;
    lshift_5(v, lsh);
  } else { // rare...
//    fprintf(stderr, "XOURIG\n");
    i = 1;
    while (a[i] == 0)
      ++i;
    assert (i <= 5);
    count_trailing_zeros(lsh, a[i]);
    long_rshift_5(a, i, lsh);
    t += lsh + i*GMP_NUMB_BITS;
    long_lshift_5(v, i, lsh);
  }

  do {
    do {
      sub_5(b, b, a);
      add_5(v, v, u);
      if (b[0] != 0) {
        count_trailing_zeros(lsh, b[0]);
        rshift_5(b, lsh);
        t += lsh;
        lshift_5(u, lsh);
      } else {  // Should almost never occur.
 //       fprintf(stderr, "XOURIG\n");
        i = 1;
        while (b[i] == 0)
          ++i;
        assert (i <= 5);
        count_trailing_zeros(lsh, b[i]);
        long_rshift_5(b, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_5(u, i, lsh);
      }
    } while (cmp_5(a,b) < 0);
    if (cmp_5(a, b) == 0)
      break;
    do {
      sub_5(a, a, b);
      add_5(u, u, v);
      if (a[0] != 0) {
        count_trailing_zeros(lsh, a[0]);
        rshift_5(a, lsh);
        t += lsh;
        lshift_5(v, lsh);
      } else { // rare...
//        fprintf(stderr, "XOURIG\n");
        i = 1;
        while (a[i] == 0)
          ++i;
        assert (i <= 5);
        count_trailing_zeros(lsh, a[i]);
        long_rshift_5(a, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_5(v, i, lsh);
      }
    } while (cmp_5(b,a)<0);
  } while (cmp_5(a,b) != 0);
  {
    int ok = 1;
    if (a[0] != 1)
      ok = 0;
    else {
      for (i = 1; i < 5; ++i) 
        if (a[1] != 0) 
	  ok = 0;
    }
    if (!ok) 
      return 0;
  }
  while (t>0) {
    mp_limb_t sig = u[0] & 1UL;
    rshift_5(u, 1);
    if (sig)
      add_5(u, u, fix);
    --t;
  }
  for (i = 0; i < 5; ++i) {
    res[i] = u[i];
  }
  return 1;
}
#endif

#ifndef HAVE_NATIVE_INVMOD6
#define HAVE_LONGLONG_INVMOD_6 1
static int
invmod_6(mp_limb_t *res, const mp_limb_t *x, const mp_limb_t *p) {
  mp_limb_t u[6], v[6], a[6], b[6], fix[6];
  int i, t, lsh;

  u[0] = 1UL; v[0] = 0UL;
  a[0] = x[0]; b[0] = p[0];
  for (i=1; i < 6; ++i) {
    u[i] = 0UL; v[i] = 0UL;
    a[i] = x[i]; b[i] = p[i];
  }
  
  if (cmp_6(a, v) == 0) {
    fprintf(stderr, "Error, division by zero in invmod_6\n");
    exit(1);
  }

  add_6(fix, b, u);
  rshift_6(fix, 1);

  assert (cmp_6(a,b) < 0);

  t = 0;
  
  if (a[0] != 0) {
    count_trailing_zeros(lsh, a[0]);
    rshift_6(a, lsh);
    t += lsh;
    lshift_6(v, lsh);
  } else { // rare...
//    fprintf(stderr, "XOURIG\n");
    i = 1;
    while (a[i] == 0)
      ++i;
    assert (i <= 6);
    count_trailing_zeros(lsh, a[i]);
    long_rshift_6(a, i, lsh);
    t += lsh + i*GMP_NUMB_BITS;
    long_lshift_6(v, i, lsh);
  }

  do {
    do {
      sub_6(b, b, a);
      add_6(v, v, u);
      if (b[0] != 0) {
        count_trailing_zeros(lsh, b[0]);
        rshift_6(b, lsh);
        t += lsh;
        lshift_6(u, lsh);
      } else {  // Should almost never occur.
 //       fprintf(stderr, "XOURIG\n");
        i = 1;
        while (b[i] == 0)
          ++i;
        assert (i <= 6);
        count_trailing_zeros(lsh, b[i]);
        long_rshift_6(b, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_6(u, i, lsh);
      }
    } while (cmp_6(a,b) < 0);
    if (cmp_6(a, b) == 0)
      break;
    do {
      sub_6(a, a, b);
      add_6(u, u, v);
      if (a[0] != 0) {
        count_trailing_zeros(lsh, a[0]);
        rshift_6(a, lsh);
        t += lsh;
        lshift_6(v, lsh);
      } else { // rare...
//        fprintf(stderr, "XOURIG\n");
        i = 1;
        while (a[i] == 0)
          ++i;
        assert (i <= 6);
        count_trailing_zeros(lsh, a[i]);
        long_rshift_6(a, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_6(v, i, lsh);
      }
    } while (cmp_6(b,a)<0);
  } while (cmp_6(a,b) != 0);
  {
    int ok = 1;
    if (a[0] != 1)
      ok = 0;
    else {
      for (i = 1; i < 6; ++i) 
        if (a[1] != 0) 
	  ok = 0;
    }
    if (!ok) 
      return 0;
  }
  while (t>0) {
    mp_limb_t sig = u[0] & 1UL;
    rshift_6(u, 1);
    if (sig)
      add_6(u, u, fix);
    --t;
  }
  for (i = 0; i < 6; ++i) {
    res[i] = u[i];
  }
  return 1;
}
#endif

#ifndef HAVE_NATIVE_INVMOD7
#define HAVE_LONGLONG_INVMOD_7 1
static int
invmod_7(mp_limb_t *res, const mp_limb_t *x, const mp_limb_t *p) {
  mp_limb_t u[7], v[7], a[7], b[7], fix[7];
  int i, t, lsh;

  u[0] = 1UL; v[0] = 0UL;
  a[0] = x[0]; b[0] = p[0];
  for (i=1; i < 7; ++i) {
    u[i] = 0UL; v[i] = 0UL;
    a[i] = x[i]; b[i] = p[i];
  }
  
  if (cmp_7(a, v) == 0) {
    fprintf(stderr, "Error, division by zero in invmod_7\n");
    exit(1);
  }

  add_7(fix, b, u);
  rshift_7(fix, 1);

  assert (cmp_7(a,b) < 0);

  t = 0;
  
  if (a[0] != 0) {
    count_trailing_zeros(lsh, a[0]);
    rshift_7(a, lsh);
    t += lsh;
    lshift_7(v, lsh);
  } else { // rare...
//    fprintf(stderr, "XOURIG\n");
    i = 1;
    while (a[i] == 0)
      ++i;
    assert (i <= 7);
    count_trailing_zeros(lsh, a[i]);
    long_rshift_7(a, i, lsh);
    t += lsh + i*GMP_NUMB_BITS;
    long_lshift_7(v, i, lsh);
  }

  do {
    do {
      sub_7(b, b, a);
      add_7(v, v, u);
      if (b[0] != 0) {
        count_trailing_zeros(lsh, b[0]);
        rshift_7(b, lsh);
        t += lsh;
        lshift_7(u, lsh);
      } else {  // Should almost never occur.
 //       fprintf(stderr, "XOURIG\n");
        i = 1;
        while (b[i] == 0)
          ++i;
        assert (i <= 7);
        count_trailing_zeros(lsh, b[i]);
        long_rshift_7(b, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_7(u, i, lsh);
      }
    } while (cmp_7(a,b) < 0);
    if (cmp_7(a, b) == 0)
      break;
    do {
      sub_7(a, a, b);
      add_7(u, u, v);
      if (a[0] != 0) {
        count_trailing_zeros(lsh, a[0]);
        rshift_7(a, lsh);
        t += lsh;
        lshift_7(v, lsh);
      } else { // rare...
//        fprintf(stderr, "XOURIG\n");
        i = 1;
        while (a[i] == 0)
          ++i;
        assert (i <= 7);
        count_trailing_zeros(lsh, a[i]);
        long_rshift_7(a, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_7(v, i, lsh);
      }
    } while (cmp_7(b,a)<0);
  } while (cmp_7(a,b) != 0);
  {
    int ok = 1;
    if (a[0] != 1)
      ok = 0;
    else {
      for (i = 1; i < 7; ++i) 
        if (a[1] != 0) 
	  ok = 0;
    }
    if (!ok) 
      return 0;
  }
  while (t>0) {
    mp_limb_t sig = u[0] & 1UL;
    rshift_7(u, 1);
    if (sig)
      add_7(u, u, fix);
    --t;
  }
  for (i = 0; i < 7; ++i) {
    res[i] = u[i];
  }
  return 1;
}
#endif

#ifndef HAVE_NATIVE_INVMOD8
#define HAVE_LONGLONG_INVMOD_8 1
static int
invmod_8(mp_limb_t *res, const mp_limb_t *x, const mp_limb_t *p) {
  mp_limb_t u[8], v[8], a[8], b[8], fix[8];
  int i, t, lsh;

  u[0] = 1UL; v[0] = 0UL;
  a[0] = x[0]; b[0] = p[0];
  for (i=1; i < 8; ++i) {
    u[i] = 0UL; v[i] = 0UL;
    a[i] = x[i]; b[i] = p[i];
  }
  
  if (cmp_8(a, v) == 0) {
    fprintf(stderr, "Error, division by zero in invmod_8\n");
    exit(1);
  }

  add_8(fix, b, u);
  rshift_8(fix, 1);

  assert (cmp_8(a,b) < 0);

  t = 0;
  
  if (a[0] != 0) {
    count_trailing_zeros(lsh, a[0]);
    rshift_8(a, lsh);
    t += lsh;
    lshift_8(v, lsh);
  } else { // rare...
//    fprintf(stderr, "XOURIG\n");
    i = 1;
    while (a[i] == 0)
      ++i;
    assert (i <= 8);
    count_trailing_zeros(lsh, a[i]);
    long_rshift_8(a, i, lsh);
    t += lsh + i*GMP_NUMB_BITS;
    long_lshift_8(v, i, lsh);
  }

  do {
    do {
      sub_8(b, b, a);
      add_8(v, v, u);
      if (b[0] != 0) {
        count_trailing_zeros(lsh, b[0]);
        rshift_8(b, lsh);
        t += lsh;
        lshift_8(u, lsh);
      } else {  // Should almost never occur.
 //       fprintf(stderr, "XOURIG\n");
        i = 1;
        while (b[i] == 0)
          ++i;
        assert (i <= 8);
        count_trailing_zeros(lsh, b[i]);
        long_rshift_8(b, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_8(u, i, lsh);
      }
    } while (cmp_8(a,b) < 0);
    if (cmp_8(a, b) == 0)
      break;
    do {
      sub_8(a, a, b);
      add_8(u, u, v);
      if (a[0] != 0) {
        count_trailing_zeros(lsh, a[0]);
        rshift_8(a, lsh);
        t += lsh;
        lshift_8(v, lsh);
      } else { // rare...
//        fprintf(stderr, "XOURIG\n");
        i = 1;
        while (a[i] == 0)
          ++i;
        assert (i <= 8);
        count_trailing_zeros(lsh, a[i]);
        long_rshift_8(a, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_8(v, i, lsh);
      }
    } while (cmp_8(b,a)<0);
  } while (cmp_8(a,b) != 0);
  {
    int ok = 1;
    if (a[0] != 1)
      ok = 0;
    else {
      for (i = 1; i < 8; ++i) 
        if (a[1] != 0) 
	  ok = 0;
    }
    if (!ok) 
      return 0;
  }
  while (t>0) {
    mp_limb_t sig = u[0] & 1UL;
    rshift_8(u, 1);
    if (sig)
      add_8(u, u, fix);
    --t;
  }
  for (i = 0; i < 8; ++i) {
    res[i] = u[i];
  }
  return 1;
}
#endif

#ifndef HAVE_NATIVE_INVMOD9
#define HAVE_LONGLONG_INVMOD_9 1
static int
invmod_9(mp_limb_t *res, const mp_limb_t *x, const mp_limb_t *p) {
  mp_limb_t u[9], v[9], a[9], b[9], fix[9];
  int i, t, lsh;

  u[0] = 1UL; v[0] = 0UL;
  a[0] = x[0]; b[0] = p[0];
  for (i=1; i < 9; ++i) {
    u[i] = 0UL; v[i] = 0UL;
    a[i] = x[i]; b[i] = p[i];
  }
  
  if (cmp_9(a, v) == 0) {
    fprintf(stderr, "Error, division by zero in invmod_9\n");
    exit(1);
  }

  add_9(fix, b, u);
  rshift_9(fix, 1);

  assert (cmp_9(a,b) < 0);

  t = 0;
  
  if (a[0] != 0) {
    count_trailing_zeros(lsh, a[0]);
    rshift_9(a, lsh);
    t += lsh;
    lshift_9(v, lsh);
  } else { // rare...
//    fprintf(stderr, "XOURIG\n");
    i = 1;
    while (a[i] == 0)
      ++i;
    assert (i <= 9);
    count_trailing_zeros(lsh, a[i]);
    long_rshift_9(a, i, lsh);
    t += lsh + i*GMP_NUMB_BITS;
    long_lshift_9(v, i, lsh);
  }

  do {
    do {
      sub_9(b, b, a);
      add_9(v, v, u);
      if (b[0] != 0) {
        count_trailing_zeros(lsh, b[0]);
        rshift_9(b, lsh);
        t += lsh;
        lshift_9(u, lsh);
      } else {  // Should almost never occur.
 //       fprintf(stderr, "XOURIG\n");
        i = 1;
        while (b[i] == 0)
          ++i;
        assert (i <= 9);
        count_trailing_zeros(lsh, b[i]);
        long_rshift_9(b, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_9(u, i, lsh);
      }
    } while (cmp_9(a,b) < 0);
    if (cmp_9(a, b) == 0)
      break;
    do {
      sub_9(a, a, b);
      add_9(u, u, v);
      if (a[0] != 0) {
        count_trailing_zeros(lsh, a[0]);
        rshift_9(a, lsh);
        t += lsh;
        lshift_9(v, lsh);
      } else { // rare...
//        fprintf(stderr, "XOURIG\n");
        i = 1;
        while (a[i] == 0)
          ++i;
        assert (i <= 9);
        count_trailing_zeros(lsh, a[i]);
        long_rshift_9(a, i, lsh);
        t += lsh + i*GMP_NUMB_BITS;
        long_lshift_9(v, i, lsh);
      }
    } while (cmp_9(b,a)<0);
  } while (cmp_9(a,b) != 0);
  {
    int ok = 1;
    if (a[0] != 1)
      ok = 0;
    else {
      for (i = 1; i < 9; ++i) 
        if (a[1] != 0) 
	  ok = 0;
    }
    if (!ok) 
      return 0;
  }
  while (t>0) {
    mp_limb_t sig = u[0] & 1UL;
    rshift_9(u, 1);
    if (sig)
      add_9(u, u, fix);
    --t;
  }
  for (i = 0; i < 9; ++i) {
    res[i] = u[i];
  }
  return 1;
}
#endif

