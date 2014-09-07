#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include <time.h>
#include <sys/types.h>
#include <unistd.h>

#include "tae.h"
#include "sbox.h"
#include "params.h"
#include "helper.h"

#define V(x) (v16qu){x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x}
#define shift_left(x)  ((x) << (v16qu)CV(4))
#define shift_right(x) ((x) >> (v16qu)CV(4))

static void LBox16P(v16qu *X);

/* Data layout:

   [in[0][0] in[1][0] ...]
   [in[0][2] in[1][2] ...]
   [in[0][4] in[1][4] ...]
   ...
   [in[0][14] in[1][14] ...]
   [in[0][1] in[1][1] ...]
   [in[0][3] in[1][3] ...]
   [in[0][5] in[1][5] ...]
   ...
   [in[0][15] in[1][15] ...]

 */

#define key_idx(j) (((j)>>1)+8*((j)&1))

/* TK is expandeded Tweakey */
static void encrypt_tweakey (v16qu *restrict X, v16qu *restrict TK) {
#if NSTEPS > 15
#error Round constant not implemented
#endif
  static const v16qu RC[64] = {
    CV(  0), CV( 27), CV( 54), CV( 81), CV(108), CV(135), CV(162), CV(189), 
    CV(216), CV(243), CV( 14), CV( 41), CV( 68), CV( 95), CV(122), CV(149), 
    CV(176), CV(203), CV(230), CV(  1), CV( 28), CV( 55), CV( 82), CV(109), 
    CV(136), CV(163), CV(190), CV(217), CV(244), CV( 15), CV( 42), CV( 69), 
    CV( 96), CV(123), CV(150), CV(177), CV(204), CV(231), CV(  2), CV( 29), 
    CV( 56), CV( 83), CV(110), CV(137), CV(164), CV(191), CV(218), CV(245), 
    CV( 16), CV( 43), CV( 70), CV( 97), CV(124), CV(151), CV(178), CV(205), 
    CV(232), CV(  3), CV( 30), CV( 57), CV( 84), CV(111), CV(138), CV(165), 
  };

  int t=0;
  int i,j;

  for (i=0; i<NSTEPS; i++) {
    // Key addition
    for (j=0; j<8; j++) {
      X[j] ^= TK[t++];
    }
    SBOX(X);
    // Round constants
    X[0] ^= RC[2*i];

    // Key addition
    for (j=8; j<16; j++) {
      X[j] ^= TK[t++];
    }
    SBOX((X+8));


    // LBox
    LBox16P(X);

    // Sbox
    SBOX(X);
    // Round constants
    X[0] ^= RC[2*i+1];

    SBOX((X+8));
    
    // LBox
    LBox16P(X);
    
    if (t == 32)
      t=0;
  }

  // Final key addition
  for (j=0; j<16; j++) {
      X[j] ^= TK[t++];
  }
}

static void decrypt_tweakey (v16qu *restrict X, v16qu *restrict TK) {
#if NSTEPS > 15
#error Round constant not implemented
#endif
  static const v16qu RC[64] = {
    CV(  0), CV( 27), CV( 54), CV( 81), CV(108), CV(135), CV(162), CV(189), 
    CV(216), CV(243), CV( 14), CV( 41), CV( 68), CV( 95), CV(122), CV(149), 
    CV(176), CV(203), CV(230), CV(  1), CV( 28), CV( 55), CV( 82), CV(109), 
    CV(136), CV(163), CV(190), CV(217), CV(244), CV( 15), CV( 42), CV( 69), 
    CV( 96), CV(123), CV(150), CV(177), CV(204), CV(231), CV(  2), CV( 29), 
    CV( 56), CV( 83), CV(110), CV(137), CV(164), CV(191), CV(218), CV(245), 
    CV( 16), CV( 43), CV( 70), CV( 97), CV(124), CV(151), CV(178), CV(205), 
    CV(232), CV(  3), CV( 30), CV( 57), CV( 84), CV(111), CV(138), CV(165), 
  };

  int t=16*((NSTEPS%2)+1);
  int i,j;

  // Final key addition
  for (j=15; j>=0; j--) {
      X[j] ^= TK[--t];
  }

  for (i=NSTEPS-1; i>=0; i--) {
    if (t == 0)
      t=32;

    LBox16P(X);

    SBOX((X+8));
    X[0] ^= RC[2*i+1];
    SBOX(X);

    LBox16P(X);

    SBOX((X+8));
    for (j=15; j>=8; j--) {
      X[j] ^= TK[--t];
    }
    X[0] ^= RC[2*i];
    SBOX(X);
    for (j=7; j>=0; j--) {
      X[j] ^= TK[--t];
    }
  }
}

/* Computes 16 LBoxes (16bit each) in parallel */

static void LBox16P(v16qu *X) {
  int j;
  static const v16qu tables[8] =
    {
      {0x00, 0x89, 0x85, 0x0c, 0x83, 0x0a, 0x06, 0x8f, 0x7f, 0xf6, 0xfa, 0x73, 0xfc, 0x75, 0x79, 0xf0, },
      {0x00, 0x66, 0x55, 0x33, 0x33, 0x55, 0x66, 0x00, 0x00, 0x66, 0x55, 0x33, 0x33, 0x55, 0x66, 0x00, },
      {0x00, 0xfe, 0xc1, 0x3f, 0xa1, 0x5f, 0x60, 0x9e, 0x91, 0x6f, 0x50, 0xae, 0x30, 0xce, 0xf1, 0x0f, },
      {0x00, 0xff, 0xcc, 0x33, 0xaa, 0x55, 0x66, 0x99, 0x99, 0x66, 0x55, 0xaa, 0x33, 0xcc, 0xff, 0x00, },
      {0x00, 0x69, 0x55, 0x3c, 0x33, 0x5a, 0x66, 0x0f, 0x0f, 0x66, 0x5a, 0x33, 0x3c, 0x55, 0x69, 0x00, },
      {0x00, 0x0e, 0x0d, 0x03, 0x0b, 0x05, 0x06, 0x08, 0x07, 0x09, 0x0a, 0x04, 0x0c, 0x02, 0x01, 0x0f, },
      {0x00, 0x69, 0x55, 0x3c, 0x33, 0x5a, 0x66, 0x0f, 0x0f, 0x66, 0x5a, 0x33, 0x3c, 0x55, 0x69, 0x00, },
      {0x00, 0xe0, 0xd0, 0x30, 0xb0, 0x50, 0x60, 0x80, 0x70, 0x90, 0xa0, 0x40, 0xc0, 0x20, 0x10, 0xf0, },
    };

  for (j=0; j<8; j+=2) {

    // Evaluate 2 series LBoxes in parallel, with 16-bit input
    // (X[4*j], X[4*j+2]) and (X[4*j+1], X[4*j+3]) ie (A,B) and (C,D)

#define A (X[j])
#define B (X[j+8])
#define C (X[j+1])
#define D (X[j+9])

    v16qu in[4] = {A, B, C, D};
    v16qu t0, t1;

#define READ(t,x) x = t;

    v16qu table;

    READ(tables[0], table);

    t0 = shift_right(in[0]);
    t1 = shift_right(in[2]);

    A  = __builtin_shuffle(table, t0);
    C  = __builtin_shuffle(table, t1);

    READ(tables[1], table);

    B  = __builtin_shuffle(table, t0);
    D  = __builtin_shuffle(table, t1);

    READ(tables[2], table);

    A ^= __builtin_shuffle(table, in[0]);
    C ^= __builtin_shuffle(table, in[2]);

    READ(tables[3], table);

    B ^= __builtin_shuffle(table, in[0]);
    D ^= __builtin_shuffle(table, in[2]);

    READ(tables[4], table);

    t0 = shift_right(in[1]);
    t1 = shift_right(in[3]);

    A ^= __builtin_shuffle(table, t0);
    C ^= __builtin_shuffle(table, t1);

    READ(tables[5], table);

    B ^= __builtin_shuffle(table, t0);
    D ^= __builtin_shuffle(table, t1);

    READ(tables[6], table);

    A ^= __builtin_shuffle(table, in[1]);
    C ^= __builtin_shuffle(table, in[3]);

    READ(tables[7], table);

    B ^= __builtin_shuffle(table, in[1]);
    D ^= __builtin_shuffle(table, in[3]);

#undef A
#undef B
#undef C
#undef D
  }
}


/* Tweakey scheduling */
#define ROTATE(x,y) (((x)<<1) | ((y)>>7))

void tweak_expand(v16qu T[16], v16qu K[16], v16qu TK[32]) {
  int i;

  for (i = 0; i<16; i++)
    TK[i] = T[i]^K[i];
  for (i = 0; i<16; i++)
    TK[16+key_idx(i)] = ROTATE(T[key_idx(i)],T[key_idx(i^1)]);
}

void tweakey_schedule(const uint8_t *restrict k,
		      const uint8_t *restrict n,
		      uint8_t ctrl,
		      v16qu *restrict TK) {
  v16qu *K = &TK[2*16];
  v16qu *T = &TK[3*16];
  v16qu C= {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
  int j;

  for (j=0; j<16; j++) {
    K[key_idx(j)] = (v16qu) CV(k[j]);
  }
  for (j=0; j<12; j++) {
    T[key_idx(j)] = (v16qu) CV(n[j]);
  }

  T[key_idx(15)] = C;
  T[key_idx(14)] = (v16qu) CV(0);
  T[key_idx(13)] = (v16qu) CV(0);
  T[key_idx(12)] = (v16qu) CV(ctrl);

  tweak_expand(T, K, TK);
}

#define UPDATE(i) do {						 \
    TK[key_idx(i)   ] = T[key_idx(i)]^K[key_idx(i)];		 \
    TK[key_idx(i)+16] = ROTATE(T[key_idx(i)],T[key_idx(i^1)]);	 \
    TK[key_idx(i^1)+16] = ROTATE(T[key_idx(i^1)],T[key_idx(i)]); \
  } while(0)

void tweakey_increment(v16qu *TK, size_t idx) {
  v16qu *K = &TK[2*16];
  v16qu *T = &TK[3*16];

  T[key_idx(15)] += V(16);
  UPDATE(15);
  if (((idx+256) & 0xfff) == 0) {
    T[key_idx(14)] += V(1);
    UPDATE(14);
    if (((idx+256) & 0xfffff) == 0) {
      T[key_idx(13)] += V(1);
      UPDATE(13);
      if (((idx+256) & 0xfffffff) == 0) {
	T[key_idx(12)] += V(1);
	UPDATE(12);
      }
    }
  }
}

void tweakey_set(v16qu *TK, int i, int j, uint8_t x) {
  v16qu *K = &TK[2*16];
  v16qu *T = &TK[3*16];

  T[key_idx(j)][i] = x;
  UPDATE(j);
}

#undef UPDATE
