#include <stdlib.h>
#include <stdio.h>

#include "nist.h"

#define PRINT_STEPS 0

char* VERSION(void) {
  return "REFERENCE, *SLOW*";
}

int SupportedLength(int hashbitlen) {
  if (hashbitlen <= 0 || hashbitlen > 512)
    return 0;
  else
    return 1;
}

int RequiredAlignment(void) {
  return 1;
}

typedef u32 ( * boolean_function) (const u32, const u32, const u32);


/************* the round function ****************/

u32 IF(const u32 x, const u32 y, const u32 z) {
  return (x & y) | (~x & z);
}

u32 MAJ(const u32 x, const u32 y, const u32 z) {
  return (z & y) | ((z | y) & x);
}

const int p4[][8] = {
  {1,0,3,2},  // XOR 1
  {2,3,0,1},  // XOR 2
  {3,2,1,0}}; // XOR 3

const int p8[][8] = {
  {1,0, 3,2, 5,4, 7,6},  // XOR 1
  {6,7, 4,5, 2,3, 0,1},  // XOR 6
  {2,3, 0,1, 6,7, 4,5},  // XOR 2
  {3,2, 1,0, 7,6, 5,4},  // XOR 3
  {5,4, 7,6, 1,0, 3,2},  // XOR 5
  {7,6, 5,4, 3,2, 1,0},  // XOR 7
  {4,5, 6,7, 0,1, 2,3}}; // XOR 4

#define tabsize(t) (sizeof(t)/sizeof(t[0]))

void Step(hashState *state, const u32 w[8], const int i,
          const int r, const int s, const boolean_function F) {
  int n = state->n_feistels;
  u32 tmp[8];                 
  int j;
  const int * perm;

  for(j=0; j < n; j++)
    tmp[j] = ROTL32(state->A[j], r);
  
  if (n == 4) 
    perm = &p4[i % tabsize(p4)][0];
  else
    perm = &p8[i % tabsize(p8)][0];

  for(j=0; j < n; j++) {
    int p = perm[j];
    state->A[j] = state->D[j] + w[j] + F(state->A[j], state->B[j], state->C[j]), s;
    state->A[j] = T32(ROTL32(T32(state->A[j]), s) + tmp[p]);
    state->D[j] = state->C[j];    
    state->C[j] = state->B[j];
    state->B[j] = tmp[j];
  }

#if PRINT_STEPS
  if (i >= 32)
    printf ("Feed-Forward ");
  printf("Step %2i: (r=%2i, s=%2i)\n", i, r, s);
  for (j=0; j < n; j++) {
    printf ("A[%d]=%08x  B[%d]=%08x  C[%d]=%08x  D[%d]=%08x\n",
            j, state->A[j], j, state->B[j], j, state->C[j], j, state->D[j]);
  }
  printf("\n");
#endif
}
  
void Round(hashState * const state, u32 w[32][8], const int i, const int r, const int s, const int t, const int u) {
  Step(state, w[8*i],   8*i,   r, s, IF);
  Step(state, w[8*i+1], 8*i+1, s, t, IF);
  Step(state, w[8*i+2], 8*i+2, t, u, IF);
  Step(state, w[8*i+3], 8*i+3, u, r, IF);

  Step(state, w[8*i+4], 8*i+4, r, s, MAJ);
  Step(state, w[8*i+5], 8*i+5, s, t, MAJ);
  Step(state, w[8*i+6], 8*i+6, t, u, MAJ);
  Step(state, w[8*i+7], 8*i+7, u, r, MAJ);
}


/********************* Message expansion ************************/

const int P[32] = {4,6,0,2,     7,5,3,1,
                   15,11,12,8,  9,13,10,14,
                   17,18,23,20, 22,21,16,19,
                   30,24,25,31,27,29,28,26};

void message_expansion(hashState * const state, u32 W[32][8],
                       const unsigned char * const M, int final) {
  
  /*
   * Stores the output of the FFT.
   */
  fft_t y[256];

  const int n = state->n_feistels;

  /*
   * 2.1.1 : FFT. compute  the y_i's
   */
  const int alpha = (n == 4) ? 139 : 41; /* this is our 128-th (resp. 256-th) root of unity */

  /*
   * First compute the FFT of X^127 (resp X^255).
   */
  int beta = (n == 4) ? 98 : 163;  /* alpha^127 (resp alpha^255) */
  int beta_i = 1;
  int j,i;
  int alpha_i = 1; /* this contains alpha^i */
  u32 Z[32][8];

  const int fft_size = (n==4) ? 128 : 256;
  const int M_size = (n==4) ? 64 : 128;

  for(i=0; i<fft_size; i++) {
    y[i] = beta_i;
    beta_i = (beta_i * beta) % 257;
  }

  /*
   * Then compute the FFT of X^125 (resp X^253).
   */
  if (final) {
    beta = (n == 4) ? 58 : 40;
    beta_i = 1;
    for(i=0; i<fft_size; i++) {
      y[i] += beta_i;
      beta_i = (beta_i * beta) % 257;
    }
  }

  /*
   * Now compute the FFT of M
   */
  for(i=0; i<fft_size; i++) {
    int alpha_ij = 1; /* this contains alpha^(i*j) */
    
    for(j=0; j<M_size; j++) {

      y[i] = (y[i] + alpha_ij * M[j]) % 257;
      alpha_ij = (alpha_ij * alpha_i) % 257;
    }

    alpha_i = (alpha_i * alpha) % 257;
  }

#if PRINT_STEPS  
  printf ("\\begin{verbatim}\n");
  for(i=0; i<fft_size/8; i++) {
    printf("y[%3d..%3d] = ", 8*i, 8*(i+1)-1);
    for(j=0; j<8; j++)
      printf("%4i ", y[8*i+j]);
  printf ("\n");
  }
  printf ("\\end{verbatim}\n\n");
#endif

  /*
   * 2.1.2 : concatenated code
   * 2.1.3 : permutation, part 1
   */
  
  /*
   * Lift to [-128, 128]
   */
  for(i=0; i<fft_size; i++)
    if (y[i] > 128)
      y[i] -= 257; 
  
#if PRINT_STEPS_VERBOSE
  for(i=0; i<fft_size/8; i++) {
    printf("\\tilde{y}[%3d..%3d] = ", 8*i, 8*(i+1)-1);
    for(j=0; j<8; j++)
      printf("%4i ", y[8*i+j]);
    printf("\n");
  }
#endif

  for(i=0; i<16; i++) 
    for(j=0; j<n; j++)
      Z[i][j] = 
        (((u32) (y[2*i*n+2*j] * 185)) & 0xffff)
        | ((u32) (y[2*i*n+2*j+1] * 185) << 16);
  
  for(i=0; i<8; i++) 
    for(j=0; j<n; j++)
      Z[i+16][j] = 
        (((u32) (y[2*i*n+2*j] * 233)) & 0xffff)
        | ((u32) (y[2*i*n+2*j+fft_size/2] * 233) << 16);

 for(i=0; i<8; i++) 
    for(j=0; j<n; j++)
      Z[i+24][j] = 
        (((u32) (y[2*i*n+2*j+1] * 233)) & 0xffff)
        | ((u32) (y[2*i*n+2*j+fft_size/2+1] * 233) << 16);
 
#if PRINT_STEPS
  printf ("\\paragraph{Intermediate Expanded Message}\n\n\\begin{verbatim}\n");
 for(i=0; i<32; i++) {
   printf("Z[%2d] = ",i);
   for(j=0; j<n; j++) {
     if (j==4)
       printf("\n        ");
     printf("%08x  ", Z[i][j]);
   }

   printf("\n");
 }
  printf ("\\end{verbatim}\n\n");
#endif

 /*
  * 2.1.3 : permutation, part 2
  */
  for(i=0; i<32; i++) 
    for(j=0; j<n; j++)
      W[i][j] = Z[P[i]][j];

#if PRINT_STEPS
  printf ("\\paragraph{Expanded Message}\n\n\\begin{verbatim}\n");
 for(i=0; i<32; i++) {
   printf("W[%2d] = ",i);
   for(j=0; j<n; j++) {
     if (j==4)
       printf("\n        ");
     printf("%08x  ", W[i][j]);
   }
   printf("\n");
 }
  printf ("\\end{verbatim}\n\n");
#endif
}

void SIMD_Compress(hashState * const state, const unsigned char * const M, int final) {
  
  /*
   * Allocate some room for the expanded message.
   */ 
  u32 W[32][8];
  u32 IV[4][8];
  int i,j;
  const int n = state->n_feistels;

#if PRINT_STEPS
  if (final)
    printf ("\\subsubsection{Final block}\n\n");
  else {
    static int blocknb = 0;
    char* names[] = {
      "First",
      "Second",
      "Third",
      "Fourth"
    };
    if (blocknb < 4)
      printf ("\\subsubsection{%s block}\n\n", names[blocknb++]);
    else
      printf ("\\subsubsection{%ith block}\n\n", ++blocknb);
  }

  printf ("\\begin{verbatim}\n");
  for(i=0; i<2*n; i++) {
    printf("M[%3d..%3d] = ", 8*i, 8*(i+1)-1);
    for(j=0; j<8; j++)
      printf("%02x ", M[8*i+j]);
    printf("\n");
  }
  printf ("\\end{verbatim}\n\n");

#endif

  /*
   * Save the chaining value for the feed-forward.
   */
  for(i=0; i<n; i++) {
    IV[0][i] = state->A[i];
    IV[1][i] = state->B[i];
    IV[2][i] = state->C[i];
    IV[3][i] = state->D[i];
  }

#if PRINT_STEPS
  printf ("\\paragraph{NTT Output}\n\n");
#endif

  message_expansion(state, W,  M, final);

#if PRINT_STEPS
  printf ("\\paragraph{Feistel Steps}\n\n\\begin{verbatim}\n");
  printf("IV :\n");
 for(i=0; i<n; i++)
    printf("A[%d]=%08x  B[%d]=%08x  C[%d]=%08x  D[%d]=%08x\n", 
           i,state->A[i], i,state->B[i], i,state->C[i], i,state->D[i]);
  printf("\n");
#endif

  /*
   * XOR the message to the chaining value
   *  handle endianness problems smoothly
   */
#define PACK(i)  ((((u32) M[i]))         ^              \
                  (((u32) M[i+1]) << 8)  ^              \
                  (((u32) M[i+2]) << 16) ^              \
                  (((u32) M[i+3]) << 24))
  for(j=0; j<n; j++) {
    state->A[j] ^= PACK(4*j);
    state->B[j] ^= PACK(4*j+4*n);
    state->C[j] ^= PACK(4*j+8*n);
    state->D[j] ^= PACK(4*j+12*n);
  }
#undef PACK  
  
#if PRINT_STEPS
  printf("IV XOR M :\n");
  for(i=0; i<n; i++)
    printf("A[%d]=%08x  B[%d]=%08x  C[%d]=%08x  D[%d]=%08x\n", 
           i,state->A[i], i,state->B[i], i,state->C[i], i,state->D[i]);
  printf("\n");
#endif

  /*
   * Run the feistel ladders.
   */
  Round(state, W, 0, 3,  23, 17, 27);
  Round(state, W, 1, 28, 19, 22,  7);
  Round(state, W, 2, 29,  9, 15,  5);
  Round(state, W, 3,  4, 13, 10, 25);

  /*
   * Modified Davies-Meyer Feed-Forward.
   */
  Step(state, IV[0], 32, 4,  13, IF);
  Step(state, IV[1], 33, 13, 10, IF);
  Step(state, IV[2], 34, 10, 25, IF);
  Step(state, IV[3], 35, 25,  4, IF);

#if PRINT_STEPS
  printf ("\\end{verbatim}\n\n");

  printf("\\paragraph{Compression Function Output}\n\n\\begin{verbatim}\n");
  for(i=0; i<n; i++)
    printf("A[%d]=%08x  B[%d]=%08x  C[%d]=%08x  D[%d]=%08x\n", 
           i,state->A[i], i,state->B[i], i,state->C[i], i,state->D[i]);
  printf ("\\end{verbatim}\n\n");
#endif
}
