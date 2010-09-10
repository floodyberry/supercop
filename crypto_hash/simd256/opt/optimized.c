#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "nist.h"
#include "tables.h"

#define PRINT_STEPS 0
#define PRINT_SOME 0

char* VERSION(void) {
  return "OPTIMIZED, NON-VECTORIZED";
}

int SupportedLength(int hashbitlen) {
  if (hashbitlen <= 0 || hashbitlen > 512)
    return 0;
  else
    return 1;
}

int RequiredAlignment(void) {
#ifdef SIMD_LITTLE_ENDIAN
  return 4;
#else
  return 1;
#endif
}

/************* the round function ****************/

#define  IF(x, y, z)  ((((y) ^ (z)) & (x)) ^ (z))

#define MAJ(x, y, z)  (((z) & (y)) | (((z) | (y)) & (x)))

#define STEP4(state, w, i, r, s, A, B, C, D, F)				\
  {                                                                     \
    int j;                                                              \
    u32 R[4];                                                           \
    if (PRINT_SOME) {                                                   \
      for (j=0; j < 4; j++) {                                           \
        printf ("%08x/%2i/%2i: %08x %08x %08x %08x\n",                  \
                w[j], r, s,                                             \
                state->A[j], state->B[j], state->C[j], state->D[j]);    \
      }                                                                 \
      printf("\n");                                                     \
    }									\
    for(j=0; j<4; j++) {                                                \
      R[j] = ROTL32(state->A[j], r);                                    \
    }                                                                   \
    for(j=0; j<4; j++) {                                                \
      state->D[j] = state->D[j] + w[j] +                                \
        F(state->A[j], state->B[j], state->C[j]);                       \
      state->D[j] = T32(ROTL32(T32(state->D[j]), s) + R[(j^(((i)%3)+1))]); \
      state->A[j] = R[j];                                               \
    }                                                                   \
  }
  
const int p8_xor [] = {1, 6, 2, 3, 5, 7, 4};

#define tabsize(t) (sizeof(t)/sizeof(t[0]))

#define STEP8(state, w, i, r, s, A, B, C, D, F)				\
  {                                                                     \
    int j;                                                              \
    u32 R[8];                                                           \
    if (PRINT_SOME) {                                                   \
      for (j=0; j < 8; j++) {                                           \
        printf ("%08x/%2i/%2i: %08x %08x %08x %08x\n",                  \
                w[j], r, s,                                             \
                state->A[j], state->B[j], state->C[j], state->D[j]);    \
      }                                                                 \
      printf("\n");                                                     \
    }									\
    for(j=0; j<8; j++) {                                                \
      R[j] = ROTL32(state->A[j], r);                                    \
    }                                                                   \
    for(j=0; j<8; j++) {                                                \
      state->D[j] = state->D[j] + w[j] +                                \
        F(state->A[j], state->B[j], state->C[j]);                       \
      state->D[j] = T32(ROTL32(T32(state->D[j]), s) +                   \
                        R[j^p8_xor[(i) % tabsize(p8_xor)]]);            \
      state->A[j] = R[j];                                               \
    }                                                                   \
  }

void Round4(hashState * state, fft_t y[128], int i,
           int r, int s, int t, int u) {
  fft_t code = i<2? 185: 233;
  u32 w[8][4];
  int a, b;

  /*
   * The FFT output y is in revbin permuted order,
   * but this is included in the tables P and Q
   */

  for(a=0; a<8; a++)
    for(b=0; b<4; b++)
      w[a][b] = (((u32) (y[Q4[8*i+a][b]] * code)) << 16) |
                (((u32) (y[P4[8*i+a][b]] * code)) & 0xffff);

  STEP4(state, w[0], 8*i+0, r, s, A, B, C, D, IF);
  STEP4(state, w[1], 8*i+1, s, t, D, A, B, C, IF);
  STEP4(state, w[2], 8*i+2, t, u, C, D, A, B, IF);
  STEP4(state, w[3], 8*i+3, u, r, B, C, D, A, IF);

  STEP4(state, w[4], 8*i+4, r, s, A, B, C, D, MAJ);
  STEP4(state, w[5], 8*i+5, s, t, D, A, B, C, MAJ);
  STEP4(state, w[6], 8*i+6, t, u, C, D, A, B, MAJ);
  STEP4(state, w[7], 8*i+7, u, r, B, C, D, A, MAJ);
}

void Round8(hashState * state, fft_t y[128], int i,
           int r, int s, int t, int u) {
  fft_t code = i<2? 185: 233;
  u32 w[8][8];
  int a, b;

  /*
   * The FFT output y is in revbin permuted order,
   * but this is included in the tables P and Q
   */

  for(a=0; a<8; a++)
    for(b=0; b<8; b++)
      w[a][b] = (((u32) (y[Q8[8*i+a][b]] * code)) << 16) |
                (((u32) (y[P8[8*i+a][b]] * code)) & 0xffff);

  STEP8(state, w[0], 8*i+0, r, s, A, B, C, D, IF);
  STEP8(state, w[1], 8*i+1, s, t, D, A, B, C, IF);
  STEP8(state, w[2], 8*i+2, t, u, C, D, A, B, IF);
  STEP8(state, w[3], 8*i+3, u, r, B, C, D, A, IF);

  STEP8(state, w[4], 8*i+4, r, s, A, B, C, D, MAJ);
  STEP8(state, w[5], 8*i+5, s, t, D, A, B, C, MAJ);
  STEP8(state, w[6], 8*i+6, t, u, C, D, A, B, MAJ);
  STEP8(state, w[7], 8*i+7, u, r, B, C, D, A, MAJ);
}


/********************* Message expansion ************************/

/*
 * Reduce modulo 257; result is in [-127; 383]
 * REDUCE(x) := (x&255) - (x>>8)
 */
#define REDUCE(x) (((x)&255) - ((x)>>8))

/*
 * Reduce from [-127; 383] to [-128; 128]
 * EXTRA_REDUCE_S(x) := x<=128 ? x : x-257
 */
#define EXTRA_REDUCE_S(x)                       \
  ((x)<=128 ? (x) : (x)-257)
 
/*
 * Reduce modulo 257; result is in [-128; 128]
 */
#define REDUCE_FULL_S(x)                        \
  EXTRA_REDUCE_S(REDUCE(x))

MAYBE_INLINE void FFT_8(fft_t *y, int stripe) {

  /*
   * FFT_8 using w=4 as 8th root of unity
   *  Unrolled decimation in frequency (DIF) radix-2 NTT.
   *  Output data is in revbin_permuted order.
   */



#define X(i) y[stripe*i]

#define DO_REDUCE(i)                            \
  X(i) = REDUCE(X(i))

#define DO_REDUCE_FULL_S(i)                     \
  do {                                          \
    X(i) = REDUCE(X(i));                        \
    X(i) = EXTRA_REDUCE_S(X(i));                \
  } while(0)

#define BUTTERFLY(i,j,n)                        \
  do {                                          \
    fft_t u= X(i);                              \
    fft_t v= X(j);                              \
    X(i) =  u+v;				\
    X(j) = (u-v) << (2*n);			\
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

    DO_REDUCE_FULL_S(0);
    DO_REDUCE_FULL_S(1);
    DO_REDUCE_FULL_S(2);
    DO_REDUCE_FULL_S(3);
    DO_REDUCE_FULL_S(4);
    DO_REDUCE_FULL_S(5);
    DO_REDUCE_FULL_S(6);
    DO_REDUCE_FULL_S(7);

#undef X
#undef DO_REDUCE
#undef DO_REDUCE_FULL_S
#undef BUTTERFLY
}

MAYBE_INLINE void FFT_16(fft_t *y, int stripe) {

  /*
   * FFT_16 using w=2 as 16th root of unity
   *  Unrolled decimation in frequency (DIF) radix-2 NTT.
   *  Output data is in revbin_permuted order.
   */

#define X(i) y[stripe*i]

#define DO_REDUCE(i)                            \
  X(i) = REDUCE(X(i))

#define DO_REDUCE_FULL_S(i)                     \
  do {                                          \
    X(i) = REDUCE(X(i));                        \
    X(i) = EXTRA_REDUCE_S(X(i));                \
  } while(0)

#define BUTTERFLY(i,j,n)                        \
  do {                                          \
    fft_t u= X(i);                              \
    fft_t v= X(j);                              \
    X(i) =  u+v;				\
    X(j) = (u-v) << n;                          \
  } while(0)

    BUTTERFLY(0,  8, 0);
    BUTTERFLY(1,  9, 1);
    BUTTERFLY(2, 10, 2);
    BUTTERFLY(3, 11, 3);
    BUTTERFLY(4, 12, 4);
    BUTTERFLY(5, 13, 5);
    BUTTERFLY(6, 14, 6);
    BUTTERFLY(7, 15, 7);

    DO_REDUCE(11);
    DO_REDUCE(12);
    DO_REDUCE(13);
    DO_REDUCE(14);
    DO_REDUCE(15);

    BUTTERFLY( 0,  4, 0);
    BUTTERFLY( 8, 12, 0);
    BUTTERFLY( 1,  5, 2);
    BUTTERFLY( 9, 13, 2);
    BUTTERFLY( 2,  6, 4);
    BUTTERFLY(10, 14, 4);
    BUTTERFLY( 3,  7, 6);
    BUTTERFLY(11, 15, 6);

    DO_REDUCE(5);
    DO_REDUCE(7);
    DO_REDUCE(13);
    DO_REDUCE(15);
    
    BUTTERFLY( 0,  2, 0);
    BUTTERFLY( 4,  6, 0);
    BUTTERFLY( 8, 10, 0);
    BUTTERFLY(12, 14, 0);
    BUTTERFLY( 1,  3, 4);
    BUTTERFLY( 5,  7, 4);
    BUTTERFLY( 9, 11, 4);
    BUTTERFLY(13, 15, 4);

    BUTTERFLY( 0,  1, 0);
    BUTTERFLY( 2,  3, 0);
    BUTTERFLY( 4,  5, 0);
    BUTTERFLY( 6,  7, 0);
    BUTTERFLY( 8,  9, 0);
    BUTTERFLY(10, 11, 0);
    BUTTERFLY(12, 13, 0);
    BUTTERFLY(14, 15, 0);

    DO_REDUCE_FULL_S( 0);
    DO_REDUCE_FULL_S( 1);
    DO_REDUCE_FULL_S( 2);
    DO_REDUCE_FULL_S( 3);
    DO_REDUCE_FULL_S( 4);
    DO_REDUCE_FULL_S( 5);
    DO_REDUCE_FULL_S( 6);
    DO_REDUCE_FULL_S( 7);
    DO_REDUCE_FULL_S( 8);
    DO_REDUCE_FULL_S( 9);
    DO_REDUCE_FULL_S(10);
    DO_REDUCE_FULL_S(11);
    DO_REDUCE_FULL_S(12);
    DO_REDUCE_FULL_S(13);
    DO_REDUCE_FULL_S(14);
    DO_REDUCE_FULL_S(15);

#undef X
#undef DO_REDUCE
#undef DO_REDUCE_FULL_S
#undef BUTTERFLY
}

void FFT_64(fft_t *y) {
  
  /*
   * FFT_64 using w=46 as 64th root of unity
   *  decimation in frequency (DIF) radix-8 NTT.
   *  Output data is in revbin_permuted order.
   */

  int i;
 
  /*
   * Begin with 8 parallels DIF FFT_8.
   */
  for (i=0; i<8; i++) {
    FFT_8(y+i,8);
  }

  /*
   * Multiply by twiddle factors
   */
  for (i=8; i<64; i++)
    if (i & 7) y[i] = REDUCE(y[i]*FFT64_8_8_Twiddle[i]);

  /*
   * Finish with 8 paralles DIF FFT_8.
   */
  for (i=0; i<8; i++) {
    FFT_8(y+8*i,1);
  }

}

void FFT_128_halfzero(fft_t *y, int final) {

  /*
   * FFT_128 using w=139 as 128th root of unity.
   *  Decimation in frequency (DIF) NTT.
   *  Output data is in revbin_permuted order.
   *  In place.
   */

  const fft_t tmp = y[63];
  int i;
 
  for (i=0; i<63; i++)
    y[64+i] = REDUCE(y[i] * FFT128_2_64_Twiddle[i]);

  if (final) {
  /*   handle X^125 with an additionnal butterfly */
    const fft_t tmp2 = y[61];
    y[61]  = REDUCE(tmp2 + 1);
    y[125] = REDUCE((tmp2 - 1) * FFT128_2_64_Twiddle[61]);
  }

  /* handle X^127 */
  y[63] = REDUCE(tmp + 1);
  y[127] = REDUCE((tmp - 1) * FFT128_2_64_Twiddle[63]);

  FFT_64(y);
  FFT_64(y+64);
}

void FFT_128_full(fft_t *y) {
  int i;
 
  for (i=0; i<16; i++) {
    FFT_8(y+i,16);
  }

  for (i=0; i<128; i++)
    /*if (i & 7)*/  y[i] = REDUCE(y[i]*FFT128_8_16_Twiddle[i]);

  for (i=0; i<8; i++) {
    FFT_16(y+16*i,1);
  }
}


void FFT_256_halfzero(fft_t *y, int final) {

  /*
   * FFT_256 using w=41 as 256th root of unity.
   *  Decimation in frequency (DIF) NTT.
   *  Output data is in revbin_permuted order.
   *  In place.
   */

  const fft_t tmp = y[127];
  int i;

  for (i=0; i<127; i++)
    y[128+i] = REDUCE(y[i] * FFT256_2_128_Twiddle[i]);

  if (final) {
  /*   handle X^253 with an additionnal butterfly */
    const fft_t tmp2 = y[125];
    y[125] = REDUCE(tmp2 + 1);
    y[253] = REDUCE((tmp2 - 1) * FFT256_2_128_Twiddle[125]);
  }

  /*   handle X^255 with an additionnal butterfly */
  y[127] = REDUCE(tmp + 1);
  y[255] = REDUCE((tmp - 1) * FFT256_2_128_Twiddle[127]);

  FFT_128_full(y);
  FFT_128_full(y+128);
}


void SIMD_Compress(hashState * state, const unsigned char *M, int final) {
  
  fft_t y[256];
  u32 IV[4][8];
  int i,j;
  int n = state->n_feistels;
 
  if (n == 4) {
    for(i=0; i<64; i++)
      y[i] = M[i];

    FFT_128_halfzero(y, final);
  } else {
    for(i=0; i<128; i++)
      y[i] = M[i];

    FFT_256_halfzero(y, final);
  }  

  /* Save the chaining value for the feed-forward */
  
  for(i=0; i<n; i++) {
    IV[0][i] = state->A[i];
    IV[1][i] = state->B[i];
    IV[2][i] = state->C[i];
    IV[3][i] = state->D[i];
  }

#if PRINT_STEPS
 printf("IV :\n");
  for(i=0; i<n; i++)
    printf("A[%d]=%08x  B[%d]=%08x  C[%d]=%08x  D[%d]=%08x\n", 
           i,state->A[i], i,state->B[i], i,state->C[i], i,state->D[i]);
  printf("\n");
#endif

  /* XOR the message to the chaining value */
#ifdef SIMD_LITTLE_ENDIAN
  /* we can XOR word-by-word */
  
  {
    u32 * message = (u32 *) M;
    
    for(i=0; i<n; i++) {
      state->A[i] ^= message[i];
      state->B[i] ^= message[n+i];
      state->C[i] ^= message[2*n+i];
      state->D[i] ^= message[3*n+i];
    }
  }
#else
  /* we have to be extra-careful */
#define PACK(i)  (((u32) M[i]) ^ (((u32) M[i+1]) << 8) ^ (((u32) M[i+2]) << 16) ^ (((u32) M[i+3]) << 24))
  for(j=0; j<n; j++) {
    state->A[j] ^= PACK(4*j);
    state->B[j] ^= PACK(4*j+4*n);
    state->C[j] ^= PACK(4*j+8*n);
    state->D[j] ^= PACK(4*j+12*n);
  }
#undef PACK  
#endif

#if PRINT_STEPS
  printf("IV XOR M :\n");
  for(i=0; i<n; i++)
    printf("A[%d]=%08x  B[%d]=%08x  C[%d]=%08x  D[%d]=%08x\n", 
           i,state->A[i], i,state->B[i], i,state->C[i], i,state->D[i]);
  printf("\n");
#endif

  /* Run the feistel ladders */
  if (n == 4) {
    Round4(state, y, 0, 3,  23, 17, 27);
    Round4(state, y, 1, 28, 19, 22,  7);
    Round4(state, y, 2, 29,  9, 15,  5);
    Round4(state, y, 3,  4, 13, 10, 25);

    STEP4(state, IV[0], 32, 4,  13, A, B, C, D, IF);
    STEP4(state, IV[1], 33, 13, 10, D, A, B, C, IF);
    STEP4(state, IV[2], 34, 10, 25, C, D, A, B, IF);
    STEP4(state, IV[3], 35, 25,  4, B, C, D, A, IF);
  }
  else
 {
    Round8(state, y, 0, 3,  23, 17, 27);
    Round8(state, y, 1, 28, 19, 22,  7);
    Round8(state, y, 2, 29,  9, 15,  5);
    Round8(state, y, 3,  4, 13, 10, 25);

    STEP8(state, IV[0], 32, 4,  13, A, B, C, D, IF);
    STEP8(state, IV[1], 33, 13, 10, D, A, B, C, IF);
    STEP8(state, IV[2], 34, 10, 25, C, D, A, B, IF);
    STEP8(state, IV[3], 35, 25,  4, B, C, D, A, IF);
  }
}


/* 
 * Gives the FFT output in the regular order for consistency checks
 */
int revbin(int k, int i) {
  int acc = 0;
  int j;
  for(j=0; j<k; j++) {
    acc = acc << 1;
    acc ^= (i & 1);
    i = i >> 1;
  }
  return acc;
}


void fft128_natural(fft_t *a, unsigned char *x) {
  fft_t A[128];
  int i;

  for (i=0; i<64; i++)
    A[i] = x[i];

  FFT_128_halfzero(A,0);
  
  for (i=0; i<128; i++)
  a[i] = A[revbin(7,i)];
  
}

void fft256_natural(fft_t *a, unsigned char *x) {
  fft_t A[256];
  int i;

  for (i=0; i<128; i++)
    A[i] = x[i];

  FFT_256_halfzero(A,0);
  
  for (i=0; i<256; i++)
    a[i] = A[revbin(8,i)];
}
