#include <stdlib.h>
#include <stdio.h>

#include "nist.h"
#include "vector.h"

#define PRINT_SOME 0

char* VERSION(void) {
  return "OPTIMIZED, VECTORIZED";
}

int SupportedLength(int hashbitlen) {
  if (hashbitlen <= 0 || hashbitlen > 512)
    return 0;
  else
    return 1;
}

int RequiredAlignment(void) {
  return 16;
}

static const union cv V128 = CV(128);
static const union cv V255 = CV(255);
static const union cv V257 = CV(257);
static const union cv8  V0 = CV(0);


/*
 * Reduce modulo 257; result is in [-127; 383]
 * REDUCE(x) := (x&255) - (x>>8)
 */
#define REDUCE(x)                               \
  v16_sub(v16_and(x, V255.v16), v16_shift_r (x, 8))

/*
 * Reduce from [-127; 383] to [-128; 128]
 * EXTRA_REDUCE_S(x) := x<=128 ? x : x-257
 */
#define EXTRA_REDUCE_S(x)                       \
  v16_sub(x, v16_and(V257.v16, v16_cmp(x, V128.v16)))
 
/*
 * Reduce modulo 257; result is in [-128; 128]
 */
#define REDUCE_FULL_S(x)                        \
  EXTRA_REDUCE_S(REDUCE(x))

#define DO_REDUCE(i)                            \
  X(i) = REDUCE(X(i))

#define DO_REDUCE_FULL_S(i)                     \
  do {                                          \
    X(i) = REDUCE(X(i));                        \
    X(i) = EXTRA_REDUCE_S(X(i));                \
  } while(0)

static const union cv FFT64_Twiddle[] = {
  {{1,    2,    4,    8,   16,   32,   64,  128}},
  {{1,   60,    2,  120,    4,  -17,    8,  -34}},
  {{1,  120,    8,  -68,   64,  -30,   -2,   17}},
  {{1,   46,   60,  -67,    2,   92,  120,  123}},
  {{1,   92,  -17,  -22,   32,  117,  -30,   67}},
  {{1,  -67,  120,  -73,    8,  -22,  -68,  -70}},
  {{1,  123,  -34,  -70,  128,   67,   17,   35}},
};

void fft64(void *a) {

  v16* const A = a;
#if V16_SIZE == 8
#define X(i) A[i]
#elif V16_SIZE == 4
#define X(i) A[2*i]
#endif

#define DO_REDUCE(i)                            \
  X(i) = REDUCE(X(i))

  /*
   * Begin with 8 parallels DIF FFT_8
   *
   * FFT_8 using w=4 as 8th root of unity
   *  Unrolled decimation in frequency (DIF) radix-2 NTT.
   *  Output data is in revbin_permuted order.
   */

  static const int w[] = {0, 2, 4, 6};
  v16 *Twiddle = (v16*)FFT64_Twiddle;

#define BUTTERFLY(i,j,n)                                \
  do {                                                  \
    v16 u= X(i);                                        \
    v16 v= X(j);                                        \
    X(i) =  v16_add(u, v);                              \
    if (n)                                              \
      X(j) = v16_shift_l(v16_sub(u, v), w[n]);          \
    else                                                \
      X(j) = v16_sub(u, v);                             \
  } while(0)

  BUTTERFLY(0, 4, 0);
  BUTTERFLY(1, 5, 1);
  BUTTERFLY(2, 6, 2);
  BUTTERFLY(3, 7, 3);
  
  DO_REDUCE(6);
  DO_REDUCE(7);
  
  BUTTERFLY(0, 2, 0);
  BUTTERFLY(4, 6, 0);
  BUTTERFLY(1, 3, 2);
  BUTTERFLY(5, 7, 2);
  
  DO_REDUCE(7);
  
  BUTTERFLY(0, 1, 0);
  BUTTERFLY(2, 3, 0);
  BUTTERFLY(4, 5, 0);
  BUTTERFLY(6, 7, 0);
  
  /* We don't need to reduce X(0) */
  DO_REDUCE_FULL_S(1);
  DO_REDUCE_FULL_S(2);
  DO_REDUCE_FULL_S(3);
  DO_REDUCE_FULL_S(4);
  DO_REDUCE_FULL_S(5);
  DO_REDUCE_FULL_S(6);
  DO_REDUCE_FULL_S(7);
    
#undef BUTTERFLY

  /*
   * Multiply by twiddle factors
   */

  A[1] = v16_mul(A[1], Twiddle[0]);
  A[2] = v16_mul(A[2], Twiddle[1]);
  A[3] = v16_mul(A[3], Twiddle[2]);
  A[4] = v16_mul(A[4], Twiddle[3]);
  A[5] = v16_mul(A[5], Twiddle[4]);
  A[6] = v16_mul(A[6], Twiddle[5]);
  A[7] = v16_mul(A[7], Twiddle[6]);

  /*
   * Transpose the FFT state with a revbin order permutation
   * on the rows and the column.
   * This will make the full FFT_64 in order.
   */

#if V16_SIZE == 8
#define INTERLEAVE(i,j)                          \
  do {                                           \
    v16 t1= X(i);                                \
    v16 t2= X(j);                                \
    X(i) = v16_interleavel(t1, t2);              \
    X(j) = v16_interleaveh(t1, t2);              \
  } while(0)

  INTERLEAVE(0, 1);
  INTERLEAVE(2, 3);
  INTERLEAVE(4, 5);
  INTERLEAVE(6, 7);

  INTERLEAVE(0, 2);
  INTERLEAVE(1, 3);
  INTERLEAVE(4, 6);
  INTERLEAVE(5, 7);

  INTERLEAVE(0, 4);
  INTERLEAVE(1, 5);
  INTERLEAVE(2, 6);
  INTERLEAVE(3, 7);

#else

#error "Implement me!"

#endif

#undef INTERLEAVE

  /*
   * Finish with 8 parallels DIT FFT_8
   *
   * FFT_8 using w=4 as 8th root of unity
   *  Unrolled decimation in time (DIT) radix-2 NTT.
   *  Intput data is in revbin_permuted order.
   */
  
#define BUTTERFLY(i,j,n)                                \
  do {                                                  \
    v16 u= X(i);                                        \
    v16 v= X(j);                                        \
    if (n)                                              \
      v = v16_shift_l(v, w[n]);                         \
    X(i) = v16_add(u, v);                               \
    X(j) = v16_sub(u, v);                               \
  } while(0)

  DO_REDUCE(0);
  DO_REDUCE(1);
  DO_REDUCE(2);
  DO_REDUCE(3);
  DO_REDUCE(4);
  DO_REDUCE(5);
  DO_REDUCE(6);
  DO_REDUCE(7);
  
  BUTTERFLY(0, 1, 0);
  BUTTERFLY(2, 3, 0);
  BUTTERFLY(4, 5, 0);
  BUTTERFLY(6, 7, 0);
  
  BUTTERFLY(0, 2, 0);
  BUTTERFLY(4, 6, 0);
  BUTTERFLY(1, 3, 2);
  BUTTERFLY(5, 7, 2);
  
  DO_REDUCE(7);
  
  BUTTERFLY(0, 4, 0);
  BUTTERFLY(1, 5, 1);
  BUTTERFLY(2, 6, 2);
  BUTTERFLY(3, 7, 3);
  
  DO_REDUCE_FULL_S(0);
  DO_REDUCE_FULL_S(1);
  DO_REDUCE_FULL_S(2);
  DO_REDUCE_FULL_S(3);
  DO_REDUCE_FULL_S(4);
  DO_REDUCE_FULL_S(5);
  DO_REDUCE_FULL_S(6);
  DO_REDUCE_FULL_S(7);
  
#undef BUTTERFLY

#undef X

}


void fft128(void *a) {

  static const union cv FFT128_Twiddle[] =  {
    {{  1, -118,   46,  -31,   60,  116,  -67,  -61}},
    {{  2,   21,   92,  -62,  120,  -25,  123, -122}},
    {{  4,   42,  -73, -124,  -17,  -50,  -11,   13}},
    {{  8,   84,  111,    9,  -34, -100,  -22,   26}},
    {{ 16,  -89,  -35,   18,  -68,   57,  -44,   52}},
    {{ 32,   79,  -70,   36,  121,  114,  -88,  104}},
    {{ 64,  -99,  117,   72,  -15,  -29,   81,  -49}},
    {{128,   59,  -23, -113,  -30,  -58,  -95,  -98}},
  };

  int i;

  // Temp space to help for interleaving in the end
  v16 B[8];

  v16 *A = (v16*) a;
  v16 *Twiddle = (v16*)FFT128_Twiddle;

  /* Size-2 butterflies */

  for (i = 0; i<8; i++) {
    B[i]   = v16_add(A[i], A[i+8]);
    B[i]   = REDUCE_FULL_S(B[i]);
    A[i+8] = v16_sub(A[i], A[i+8]);
    A[i+8] = REDUCE_FULL_S(A[i+8]);
    A[i+8] = v16_mul(A[i+8], Twiddle[i]);
    A[i+8] = REDUCE_FULL_S(A[i+8]);
  }

  fft64(B);
  fft64(A+8);

  /* Transpose (i.e. interleave) */

  for (i=0; i<8; i++) {
    A[2*i]   = v16_interleavel (B[i], A[i+8]);
    A[2*i+1] = v16_interleaveh (B[i], A[i+8]);
  }
}


void fft128_msg(short *a, const unsigned char *x, int final) {

  static const union cv FFT128_Twiddle[] =  {
    {{  1, -118,   46,  -31,   60,  116,  -67,  -61}},
    {{  2,   21,   92,  -62,  120,  -25,  123, -122}},
    {{  4,   42,  -73, -124,  -17,  -50,  -11,   13}},
    {{  8,   84,  111,    9,  -34, -100,  -22,   26}},
    {{ 16,  -89,  -35,   18,  -68,   57,  -44,   52}},
    {{ 32,   79,  -70,   36,  121,  114,  -88,  104}},
    {{ 64,  -99,  117,   72,  -15,  -29,   81,  -49}},
    {{128,   59,  -23, -113,  -30,  -58,  -95,  -98}},
  };

  static const union cv Tweak =
    {{0,0,0,0,0,0,0,1}};
  static const union cv FinalTweak =
    {{0,0,0,0,0,1,0,1}};


  v8  *X = (v8*)  x;
  v16 *A = (v16*) a;
  v16 *Twiddle = (v16*)FFT128_Twiddle;

#define UNPACK(i)                                      \
  do {                                                 \
    v8 t = X[i];                                       \
    A[2*i]   = v8_mergel(t, V0.v8);                    \
    A[2*i+8] = v16_mul(A[2*i], Twiddle[2*i]);          \
    A[2*i+8] = REDUCE(A[2*i+8]);                       \
    A[2*i+1] = v8_mergeh(t, V0.v8);                    \
    A[2*i+9] = v16_mul(A[2*i+1], Twiddle[2*i+1]);      \
    A[2*i+9] = REDUCE(A[2*i+9]);                       \
  } while(0)


  /* 
   * This allows to tweak the last butterflies to introduce X^127
   */
#define UNPACK_TWEAK(i,tw)                             \
  do {                                                 \
    v8 t = X[i];                                       \
    v16 tmp;                                           \
    A[2*i]   = v8_mergel(t, V0.v8);                    \
    A[2*i+8] = v16_mul(A[2*i], Twiddle[2*i]);          \
    A[2*i+8] = REDUCE(A[2*i+8]);                       \
    tmp      = v8_mergeh(t, V0.v8);                    \
    A[2*i+1] = v16_add(tmp, tw);                               \
    A[2*i+9] = v16_mul(v16_sub(tmp, tw), Twiddle[2*i+1]);      \
    A[2*i+9] = REDUCE(A[2*i+9]);                       \
  } while(0)

  UNPACK(0);
  UNPACK(1);
  UNPACK(2);
  if (final)
    UNPACK_TWEAK(3, FinalTweak.v16);
  else
    UNPACK_TWEAK(3, Tweak.v16);

#undef UNPACK
#undef UNPACK_TWEAK

  fft64(a);
  fft64(a+64);
}

#if 0
void fft128_msg(short *a, const unsigned char *x, int final) {

  for (int i=0; i<64; i++)
    a[i] = x[i];

  for (int i=64; i<128; i++)
    a[i] = 0;

  a[127] = 1;
  a[125] = final? 1: 0;

  fft128(a);
}
#endif

void fft256_msg(short *a, const unsigned char *x, int final) {

  static const union cv FFT256_Twiddle[] =  {
    {{   1,   41, -118,   45,   46,   87,  -31,   14}}, 
    {{  60, -110,  116, -127,  -67,   80,  -61,   69}}, 
    {{   2,   82,   21,   90,   92,  -83,  -62,   28}}, 
    {{ 120,   37,  -25,    3,  123,  -97, -122, -119}}, 
    {{   4,  -93,   42,  -77,  -73,   91, -124,   56}}, 
    {{ -17,   74,  -50,    6,  -11,   63,   13,   19}}, 
    {{   8,   71,   84,  103,  111,  -75,    9,  112}}, 
    {{ -34, -109, -100,   12,  -22,  126,   26,   38}}, 
    {{  16, -115,  -89,  -51,  -35,  107,   18,  -33}}, 
    {{ -68,   39,   57,   24,  -44,   -5,   52,   76}}, 
    {{  32,   27,   79, -102,  -70,  -43,   36,  -66}}, 
    {{ 121,   78,  114,   48,  -88,  -10,  104, -105}}, 
    {{  64,   54,  -99,   53,  117,  -86,   72,  125}}, 
    {{ -15, -101,  -29,   96,   81,  -20,  -49,   47}}, 
    {{ 128,  108,   59,  106,  -23,   85, -113,   -7}}, 
    {{ -30,   55,  -58,  -65,  -95,  -40,  -98,   94}}
  };

  static const union cv Tweak =
    {{0,0,0,0,0,0,0,1}};
  static const union cv FinalTweak =
    {{0,0,0,0,0,1,0,1}};


  v8  *X = (v8*)  x;
  v16 *A = (v16*) a;
  v16 *Twiddle = (v16*)FFT256_Twiddle;

#define UNPACK(i)                                       \
  do {                                                  \
    v8 t      = X[i];                                   \
    A[2*i]    = v8_mergel(t, V0.v8);                    \
    A[2*i+16] = v16_mul(A[2*i], Twiddle[2*i]);          \
    A[2*i+16] = REDUCE(A[2*i+16]);                      \
    A[2*i+1]  = v8_mergeh(t, V0.v8);                    \
    A[2*i+17] = v16_mul(A[2*i+1], Twiddle[2*i+1]);      \
    A[2*i+17] = REDUCE(A[2*i+17]);                       \
  } while(0)


  /* 
   * This allows to tweak the last butterflies to introduce X^127
   */
#define UNPACK_TWEAK(i,tw)                              \
  do {                                                  \
    v8 t = X[i];                                        \
    v16 tmp;                                            \
    A[2*i]    = v8_mergel(t, V0.v8);                    \
    A[2*i+16] = v16_mul(A[2*i], Twiddle[2*i]);          \
    A[2*i+16] = REDUCE(A[2*i+16]);                       \
    tmp       = v8_mergeh(t, V0.v8);                    \
    A[2*i+1]  = v16_add(tmp, tw);                               \
    A[2*i+17] = v16_mul(v16_sub(tmp, tw), Twiddle[2*i+1]);      \
    A[2*i+17] = REDUCE(A[2*i+17]);                      \
  } while(0)

  UNPACK(0);
  UNPACK(1);
  UNPACK(2);
  UNPACK(3);
  UNPACK(4);
  UNPACK(5);
  UNPACK(6);
  if (final)
    UNPACK_TWEAK(7, FinalTweak.v16);
  else
    UNPACK_TWEAK(7, Tweak.v16);

#undef UNPACK
#undef UNPACK_TWEAK

  fft128(a);
  fft128(a+128);
}


void rounds(u32* state, const unsigned char* msg, short* fft) {
  
  v32* S = (v32*) state;
  v32* M = (v32*)msg;
  v16* W = (v16*)fft;

  register v32 S0, S1, S2, S3;
  static const union cv code[] = { CV(185), CV(233) };

  S0 = v32_xor(S[0], v32_bswap(M[0]));
  S1 = v32_xor(S[1], v32_bswap(M[1]));
  S2 = v32_xor(S[2], v32_bswap(M[2]));
  S3 = v32_xor(S[3], v32_bswap(M[3]));

#define S(i) S##i


/* #define F_0(B, C, D)     ((((C) ^ (D)) & (B)) ^ (D)) */
/* #define F_1(B, C, D)     (((D) & (C)) | (((D) | (C)) & (B))) */

#define F_0(B, C, D)     v32_xor(v32_and(v32_xor(C,D), B), D)
#define F_1(B, C, D)     v32_or(v32_and(D, C), v32_and( v32_or(D,C), B))

#define F(a,b,c,fun) F_##fun (a,b,c)

  /*
   * We split the round function in two halfes
   * so as to insert some independent computations in between
   */

#define STEP_1(a,b,c,d,w,fun,r,s,z)                             \
  do {                                                          \
    if (PRINT_SOME) {                                           \
      int j;                                                    \
      v32 ww=w, aa=a, bb=b, cc=c, dd=d;                         \
      u32 *WW = (void*)&ww;                                     \
      u32 *AA = (void*)&aa;                                     \
      u32 *BB = (void*)&bb;                                     \
      u32 *CC = (void*)&cc;                                     \
      u32 *DD = (void*)&dd;                                     \
      for (j=0; j<4; j++) {                                     \
        printf ("%08x/%2i/%2i: %08x %08x %08x %08x\n",          \
                WW[j], r, s,                                    \
                AA[j], BB[j], CC[j], DD[j]);                    \
      }                                                         \
    }                                                           \
    TT = F(a,b,c,fun);                                          \
    a = v32_rotate(a,r);                                        \
    w = v32_add(w, d);                                          \
    TT = v32_add(TT, w);                                        \
    TT = v32_rotate(TT,s);                                      \
    d = v32_shufrot(a,z);                                       \
  } while(0)

#define STEP_2(a,b,c,d,w,fun,r,s)                               \
  do {                                                          \
    d = v32_add(d, TT);                                         \
  } while(0)

#define STEP(a,b,c,d,w,fun,r,s,z)               \
  do {                                          \
    register v32 TT;                            \
    STEP_1(a,b,c,d,w,fun,r,s,z);                \
    STEP_2(a,b,c,d,w,fun,r,s);                  \
  } while(0);


#define ROUND(h0,l0,u0,h1,l1,u1,h2,l2,u2,h3,l3,u3,        \
              fun,r,s,t,u,z)                              \
  do {                                                    \
    register v32 W0, W1, W2, W3, TT;                      \
    W0 = v16_merge##u0(W[h0], W[l0]);                     \
    W0 = V1632(v16_mul(V3216(W0), code[z].v16));          \
    STEP_1(S(0), S(1), S(2), S(3), W0, fun, r, s, 1);     \
    W1 = v16_merge##u1(W[h1], W[l1]);                     \
    W1 = V1632(v16_mul(V3216(W1), code[z].v16));          \
    STEP_2(S(0), S(1), S(2), S(3), W0, fun, r, s);        \
    STEP_1(S(3), S(0), S(1), S(2), W1, fun, s, t, 2);     \
    W2 = v16_merge##u2(W[h2], W[l2]);                     \
    W2 = V1632(v16_mul(V3216(W2), code[z].v16));          \
    STEP_2(S(3), S(0), S(1), S(2), W1, fun, s, t);        \
    STEP_1(S(2), S(3), S(0), S(1), W2, fun, t, u, 1);     \
    W3 = v16_merge##u3(W[h3], W[l3]);                     \
    W3 = V1632(v16_mul(V3216(W3), code[z].v16));          \
    STEP_2(S(2), S(3), S(0), S(1), W2, fun, t, u);        \
    STEP_1(S(1), S(2), S(3), S(0), W3, fun, u, r, 2);     \
    STEP_2(S(1), S(2), S(3), S(0), W3, fun, u, r);        \
  } while(0)


  /*
   * 4 rounds with code 185
   */
  ROUND(  2, 10, l,  3, 11, l,  0,  8, l,  1,  9, l, 0, 3,  20, 14, 27, 0);
  ROUND(  3, 11, h,  2, 10, h,  1,  9, h,  0,  8, h, 1, 3,  20, 14, 27, 0);
  ROUND(  7, 15, h,  5, 13, h,  6, 14, l,  4, 12, l, 0, 26,  4, 23, 11, 0);
  ROUND(  4, 12, h,  6, 14, h,  5, 13, l,  7, 15, l, 1, 26,  4, 23, 11, 0);

  /*
   * 4 rounds with code 233
   */
  ROUND(  0,  4, h,  1,  5, l,  3,  7, h,  2,  6, l, 0, 19, 28,  7, 22, 1);
  ROUND(  3,  7, l,  2,  6, h,  0,  4, l,  1,  5, h, 1, 19, 28,  7, 22, 1);
  ROUND( 11, 15, l,  8, 12, l,  8, 12, h, 11, 15, h, 0, 15,  5, 29,  9, 1);
  ROUND(  9, 13, h, 10, 14, h, 10, 14, l,  9, 13, l, 1, 15,  5, 29,  9, 1);

  /*
   * 1 round as feed-forward
   */
  STEP(S(0), S(1), S(2), S(3), S[0], 0, 15, 5, 1);
  STEP(S(3), S(0), S(1), S(2), S[1], 0, 5, 29, 2);
  STEP(S(2), S(3), S(0), S(1), S[2], 0, 29, 9, 1);
  STEP(S(1), S(2), S(3), S(0), S[3], 0, 9, 15, 2);

  S[0] = S(0);  S[1] = S(1);  S[2] = S(2);  S[3] = S(3);
}


void rounds512(u32* state, const unsigned char* msg, short* fft) {
  
  v32* S = (v32*) state;
  v32* M = (v32*) msg;
  v16* W = (v16*) fft;

  register v32 S0l, S1l, S2l, S3l;
  register v32 S0h, S1h, S2h, S3h;
  static const union cv code[] = { CV(185), CV(233) };

  S0l = v32_xor(S[0], v32_bswap(M[0]));
  S0h = v32_xor(S[1], v32_bswap(M[1]));
  S1l = v32_xor(S[2], v32_bswap(M[2]));
  S1h = v32_xor(S[3], v32_bswap(M[3]));
  S2l = v32_xor(S[4], v32_bswap(M[4]));
  S2h = v32_xor(S[5], v32_bswap(M[5]));
  S3l = v32_xor(S[6], v32_bswap(M[6]));
  S3h = v32_xor(S[7], v32_bswap(M[7]));

#define S(i) S##i


/* #define F_0(B, C, D)     ((((C) ^ (D)) & (B)) ^ (D)) */
/* #define F_1(B, C, D)     (((D) & (C)) | (((D) | (C)) & (B))) */

#define F_0(B, C, D)     v32_xor(v32_and(v32_xor(C,D), B), D)
#define F_1(B, C, D)     v32_or(v32_and(D, C), v32_and( v32_or(D,C), B))

#define Fl(a,b,c,fun) F_##fun (a##l,b##l,c##l)
#define Fh(a,b,c,fun) F_##fun (a##h,b##h,c##h)

  /*
   * We split the round function in two halfes
   * so as to insert some independent computations in between
   */

#define PERM(z,d,a) PERM_##z(d,a)

#define PERM_0(d,a)                                          \
  do {                                                       \
    d##l = v32_shuf(a##l,0xb1); /* 0b10110001 */             \
    d##h = v32_shuf(a##h,0xb1); /* 0b10110001 */             \
  } while(0)

#define PERM_1(d,a)                                          \
  do {                                                       \
    d##l = v32_shuf(a##l,0x4e); /* 0b01001110 */             \
    d##h = v32_shuf(a##h,0x4e); /* 0b01001110 */             \
  } while(0)

#define PERM_2(d,a)                                          \
  do {                                                       \
    d##l = v32_shuf(a##h,0x1b); /* 0b00011011 */             \
    d##h = v32_shuf(a##l,0x1b); /* 0b00011011 */             \
  } while(0)

#define PERM_3(d,a)                                          \
  do {                                                       \
    d##l = a##h;                                             \
    d##h = a##l;                                             \
  } while(0)


#define STEP_1_(a,b,c,d,w,fun,r,s,z)                            \
  do {                                                          \
    if (PRINT_SOME) {                                           \
      int j;                                                    \
      v32 ww=w##l, aa=a##l, bb=b##l, cc=c##l, dd=d##l;          \
      u32 *WW = (void*)&ww;                                     \
      u32 *AA = (void*)&aa;                                     \
      u32 *BB = (void*)&bb;                                     \
      u32 *CC = (void*)&cc;                                     \
      u32 *DD = (void*)&dd;                                     \
      for (j=0; j<4; j++) {                                     \
        printf ("%08x/%2i/%2i: %08x %08x %08x %08x\n",          \
                WW[j], r, s,                                    \
                AA[j], BB[j], CC[j], DD[j]);                    \
      }                                                         \
    }                                                           \
    TTl = Fl(a,b,c,fun);                                        \
    TTh = Fh(a,b,c,fun);                                        \
    a##l = v32_rotate(a##l,r);                                  \
    a##h = v32_rotate(a##h,r);                                  \
    w##l  = v32_add(w##l, d##l);                                \
    w##h  = v32_add(w##h, d##h);                                \
    TTl = v32_add(TTl, w##l);                                   \
    TTh = v32_add(TTh, w##h);                                   \
    TTl = v32_rotate(TTl,s);                                    \
    TTh = v32_rotate(TTh,s);                                    \
    PERM(z,d,a);                                                \
  } while(0)

#define STEP_1(a,b,c,d,w,fun,r,s,z)             \
  STEP_1_(a,b,c,d,w,fun,r,s,z)

#define STEP_2_(a,b,c,d,w,fun,r,s)                               \
  do {                                                          \
    d##l = v32_add(d##l, TTl);                                  \
    d##h = v32_add(d##h, TTh);                                  \
  } while(0)

#define STEP_2(a,b,c,d,w,fun,r,s)              \
  STEP_2_(a,b,c,d,w,fun,r,s)
  
#define STEP(a,b,c,d,w1,w2,fun,r,s,z)           \
  do {                                          \
    register v32 TTl, TTh, Wl=w1, Wh=w2;        \
    STEP_1(a,b,c,d,W,fun,r,s,z);                \
    STEP_2(a,b,c,d,W,fun,r,s);                  \
  } while(0);


#define MSG_l(x) (2*(x))
#define MSG_h(x) (2*(x)+1)

#define MSG(w,hh,ll,u,z)                                \
  do {                                                  \
    int a = MSG_##u(hh);                                \
    int b = MSG_##u(ll);                                \
    w##l = v16_mergel(W[a], W[b]);                      \
    w##l = V1632(v16_mul(V3216(w##l), code[z].v16));    \
    w##h = v16_mergeh(W[a], W[b]);                      \
    w##h = V1632(v16_mul(V3216(w##h), code[z].v16));    \
  } while(0)
  
#define ROUND(h0,l0,u0,h1,l1,u1,h2,l2,u2,h3,l3,u3,        \
              fun,r,s,t,u,z)                              \
  do {                                                    \
    register v32 W0l, W1l, W2l, W3l, TTl;                 \
    register v32 W0h, W1h, W2h, W3h, TTh;                 \
    MSG(W0,h0,l0,u0,z);                                   \
    STEP_1(S(0), S(1), S(2), S(3), W0, fun, r, s, 0);     \
    MSG(W1,h1,l1,u1,z);                                   \
    STEP_2(S(0), S(1), S(2), S(3), W0, fun, r, s);        \
    STEP_1(S(3), S(0), S(1), S(2), W1, fun, s, t, 1);     \
    MSG(W2,h2,l2,u2,z);                                   \
    STEP_2(S(3), S(0), S(1), S(2), W1, fun, s, t);        \
    STEP_1(S(2), S(3), S(0), S(1), W2, fun, t, u, 2);     \
    MSG(W3,h3,l3,u3,z);                                   \
    STEP_2(S(2), S(3), S(0), S(1), W2, fun, t, u);        \
    STEP_1(S(1), S(2), S(3), S(0), W3, fun, u, r, 3);     \
    STEP_2(S(1), S(2), S(3), S(0), W3, fun, u, r);        \
  } while(0)


  /*
   * 4 rounds with code 185
   */
  ROUND(  2, 10, l,  3, 11, l,  0,  8, l,  1,  9, l, 0, 3,  20, 14, 27, 0);
  ROUND(  3, 11, h,  2, 10, h,  1,  9, h,  0,  8, h, 1, 3,  20, 14, 27, 0);
  ROUND(  7, 15, h,  5, 13, h,  6, 14, l,  4, 12, l, 0, 26,  4, 23, 11, 0);
  ROUND(  4, 12, h,  6, 14, h,  5, 13, l,  7, 15, l, 1, 26,  4, 23, 11, 0);

  /*
   * 4 rounds with code 233
   */
  ROUND(  0,  4, h,  1,  5, l,  3,  7, h,  2,  6, l, 0, 19, 28,  7, 22, 1);
  ROUND(  3,  7, l,  2,  6, h,  0,  4, l,  1,  5, h, 1, 19, 28,  7, 22, 1);
  ROUND( 11, 15, l,  8, 12, l,  8, 12, h, 11, 15, h, 0, 15,  5, 29,  9, 1);
  ROUND(  9, 13, h, 10, 14, h, 10, 14, l,  9, 13, l, 1, 15,  5, 29,  9, 1);

  /*
   * 1 round as feed-forward
   */
  STEP(S(0), S(1), S(2), S(3), S[0], S[1], 0, 15, 5, 0);
  STEP(S(3), S(0), S(1), S(2), S[2], S[3], 0, 5, 29, 1);
  STEP(S(2), S(3), S(0), S(1), S[4], S[5], 0, 29, 9, 2);
  STEP(S(1), S(2), S(3), S(0), S[6], S[7], 0, 9, 15, 3);

  S[0] = S0l;  S[1] = S0h;  S[2] = S1l;  S[3] = S1h;
  S[4] = S2l;  S[5] = S2h;  S[6] = S3l;  S[7] = S3h;
}

void SIMD_Compress(hashState * state, const unsigned char *m, int final) {
  if (state->hashbitlen <= 256) {
    union cv Y[16];
    short* y = (short*) Y[0].u16;
    
    fft128_msg(y, m, final);
    rounds(state->A, m, y);
  } else {
    union cv Y[32];
    short* y = (short*) Y[0].u16;
    
    fft256_msg(y, m, final);
    rounds512(state->A, m, y);
  }
}

/* 
 * Give the FFT output in the regular order for consitancy checks
 */
void fft128_natural(fft_t *x, unsigned char *a) {
  union cv Y[16];
  short* y = (short*) Y[0].u16;
  int i;

  fft128_msg(y, a, 0);

  for(i=0; i<64; i++) {
    x[2*i]   = y[i];
    x[2*i+1] = y[i+64];
  }
}
