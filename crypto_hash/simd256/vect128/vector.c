#include <stdlib.h>
#include <stdio.h>

#include "nist.h"
#include "vector.h"

#define PRINT_SOME 0

char* VERSION(void) {
  return "OPTIMIZED, VECTORIZED";
}

int SupportedLength(int hashbitlen) {
  if (hashbitlen <= 0 || hashbitlen > 256)
    return 0;
  else
    return 1;
}


static const union cv V128 = CV(128);
static const union cv V255 = CV(255);
static const union cv V257 = CV(257);


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

void fft128(short *a, const unsigned char *x, int final) {

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

  static const union cv8  V0 =
    {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
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

  fft64(a);
  fft64(a+64);
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

void SIMD_Compress(hashState * state, const unsigned char *m, int final) {
  union cv Y[16];
  short* y = (short*) Y[0].u16;

  fft128(y, m, final);
  rounds(state->A, m, y);
}

/* 
 * Give the FFT output in the regular order for consitancy checks
 */
void fft128_natural(fft_t *x, unsigned char *a) {
  union cv Y[16];
  short* y = (short*) Y[0].u16;
  int i;

  fft128(y, a, 0);

  for(i=0; i<64; i++) {
    x[2*i]   = y[i];
    x[2*i+1] = y[i+64];
  }
}
