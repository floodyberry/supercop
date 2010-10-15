/*
20101014
D. J. Bernstein
Public domain.
*/

#include "parameters.h"
#include "cubehash.h"
#include "crypto_uint32.h"
#define myuint32 crypto_uint32

#define ROTATEUPWARDS7(a) (((a) << 7) | ((a) >> 25))
#define ROTATEUPWARDS11(a) (((a) << 11) | ((a) >> 21))
#define SWAP(a,b) { myuint32 u = a; a = b; b = u; }

static void rounds(myuint32 x[2][2][2][2][2],int r)
{
  int j;
  int k;
  int l;
  int m;

  for (;r > 0;--r) {
    /* "add x_0jklm into x_1jklmn modulo 2^32" */
    for (j = 0;j < 2;++j) for (k = 0;k < 2;++k) for (l = 0;l < 2;++l) for (m = 0;m < 2;++m)
      x[1][j][k][l][m] += x[0][j][k][l][m];
    /* "rotate x_0jklm upwards by 7 bits" */
    for (j = 0;j < 2;++j) for (k = 0;k < 2;++k) for (l = 0;l < 2;++l) for (m = 0;m < 2;++m)
      x[0][j][k][l][m] = ROTATEUPWARDS7(x[0][j][k][l][m]);
    /* "swap x_00klm with x_01klm" */
    for (k = 0;k < 2;++k) for (l = 0;l < 2;++l) for (m = 0;m < 2;++m)
      SWAP(x[0][0][k][l][m],x[0][1][k][l][m])
    /* "xor x_1jklm into x_0jklm" */
    for (j = 0;j < 2;++j) for (k = 0;k < 2;++k) for (l = 0;l < 2;++l) for (m = 0;m < 2;++m)
      x[0][j][k][l][m] ^= x[1][j][k][l][m];
    /* "swap x_1jk0m with x_1jk1m" */
    for (j = 0;j < 2;++j) for (k = 0;k < 2;++k) for (m = 0;m < 2;++m)
      SWAP(x[1][j][k][0][m],x[1][j][k][1][m])
    /* "add x_0jklm into x_1jklm modulo 2^32" */
    for (j = 0;j < 2;++j) for (k = 0;k < 2;++k) for (l = 0;l < 2;++l) for (m = 0;m < 2;++m)
      x[1][j][k][l][m] += x[0][j][k][l][m];
    /* "rotate x_0jklm upwards by 11 bits" */
    for (j = 0;j < 2;++j) for (k = 0;k < 2;++k) for (l = 0;l < 2;++l) for (m = 0;m < 2;++m)
      x[0][j][k][l][m] = ROTATEUPWARDS11(x[0][j][k][l][m]);
    /* "swap x_0j0lm with x_0j1lm" */
    for (j = 0;j < 2;++j) for (l = 0;l < 2;++l) for (m = 0;m < 2;++m)
      SWAP(x[0][j][0][l][m],x[0][j][1][l][m])
    /* "xor x_1jklm into x_0jklm" */
    for (j = 0;j < 2;++j) for (k = 0;k < 2;++k) for (l = 0;l < 2;++l) for (m = 0;m < 2;++m)
      x[0][j][k][l][m] ^= x[1][j][k][l][m];
    /* "swap x_1jkl0 with x_1jkl1" */
    for (j = 0;j < 2;++j) for (k = 0;k < 2;++k) for (l = 0;l < 2;++l)
      SWAP(x[1][j][k][l][0],x[1][j][k][l][1])
  }
}

static void state_fromx(unsigned char state[128],myuint32 x[2][2][2][2][2])
{
  int i;
  int j;
  int k;
  int l;
  int m;
  myuint32 u;

  for (i = 0;i < 2;++i)
    for (j = 0;j < 2;++j)
      for (k = 0;k < 2;++k)
        for (l = 0;l < 2;++l)
	  for (m = 0;m < 2;++m) {
	    u = x[i][j][k][l][m];
	    *state++ = u; u >>= 8;
	    *state++ = u; u >>= 8;
	    *state++ = u; u >>= 8;
	    *state++ = u; u >>= 8;
	  }
}

static void state_tox(unsigned char state[128],myuint32 x[2][2][2][2][2])
{
  int i;
  int j;
  int k;
  int l;
  int m;
  myuint32 u;

  for (i = 0;i < 2;++i)
    for (j = 0;j < 2;++j)
      for (k = 0;k < 2;++k)
        for (l = 0;l < 2;++l)
	  for (m = 0;m < 2;++m) {
	    u = ((myuint32) *state++) << 0;
	    u |= ((myuint32) *state++) << 8;
	    u |= ((myuint32) *state++) << 16;
	    u |= ((myuint32) *state++) << 24;
	    x[i][j][k][l][m] = u;
	  }
}

HashReturn Init(hashState *state, int hashbitlen)
{
  myuint32 x[2][2][2][2][2];
  int i;
  int j;
  int k;
  int l;
  int m;

  if (hashbitlen < 8) return BAD_HASHBITLEN;
  if (hashbitlen > 512) return BAD_HASHBITLEN;
  if (hashbitlen != 8 * (hashbitlen / 8)) return BAD_HASHBITLEN;

  /* "the first three state words x_00000, x_00001, x_00010" */
  /* "are set to the integers h/8, b, r respectively." */
  /* "the remaining state words are set to 0." */
  for (i = 0;i < 2;++i)
    for (j = 0;j < 2;++j)
      for (k = 0;k < 2;++k)
        for (l = 0;l < 2;++l)
          for (m = 0;m < 2;++m)
            x[i][j][k][l][m] = 0;
  x[0][0][0][0][0] = hashbitlen/8;
  x[0][0][0][0][1] = CUBEHASH_BLOCKBYTES;
  x[0][0][0][1][0] = CUBEHASH_ROUNDS;

  /* "the state is then transformed invertibly through 16 identical rounds" */
  rounds(x,16);
  state_fromx(state->state,x);
  state->hashbitlen = hashbitlen;
  state->blockbits = 0;

  return SUCCESS;
}

static const BitSequence mybit[8] = { 128, 64, 32, 16, 8, 4, 2, 1 } ;

static void updatebit(hashState *state,BitSequence nextbit)
{
  myuint32 x[2][2][2][2][2];
  int j;

  state->block[state->blockbits / 8] &= ~mybit[state->blockbits % 8];
  state->block[state->blockbits / 8] |= nextbit * mybit[state->blockbits % 8];
  ++state->blockbits;

  /* "for each b-byte block of the padded message:" */
  if (state->blockbits < 8 * CUBEHASH_BLOCKBYTES) return;

  /* "xor the block into the first b bytes of the state" */
  for (j = 0;j < CUBEHASH_BLOCKBYTES;++j) state->state[j] ^= state->block[j];
  state->blockbits = 0;

  /* "and then transform the state invertibly through r identical rounds" */
  state_tox(state->state,x);
  rounds(x,CUBEHASH_ROUNDS);
  state_fromx(state->state,x);
}

HashReturn Update(hashState *state, const BitSequence *data,
                  DataLength databitlen)
{
  DataLength i;
  BitSequence nextbit;

  for (i = 0;i < databitlen;++i) {
    nextbit = (data[i / 8] & mybit[i % 8]) / mybit[i % 8];
    updatebit(state,nextbit);
  }
  return SUCCESS;
}

HashReturn Final(hashState *state, BitSequence *hashval)
{
  myuint32 x[2][2][2][2][2];
  int i;

  /* "append a 1 bit to the input message;" */
  updatebit(state,1);

  /* "then append the minimum possible number of 0 bits" */
  /* "to reach a multiple of 8b bits" */
  while (state->blockbits != 0) updatebit(state,0);

  /* "the integer 1 is xored into the last state word x_11111" */
  state_tox(state->state,x);
  x[1][1][1][1][1] ^= 1;

  /* "the state is then transformed invertibly through 32 identical rounds" */
  rounds(x,32);
  state_fromx(state->state,x);

  /* "output the first h/8 bytes of the state" */
  for (i = 0;i < state->hashbitlen / 8;++i) hashval[i] = state->state[i];
  return SUCCESS;
}

HashReturn Hash(int hashbitlen, const BitSequence *data,
                DataLength databitlen, BitSequence *hashval)
{
  hashState state;
  if (Init(&state,hashbitlen) != SUCCESS) return BAD_HASHBITLEN;
  Update(&state,data,databitlen);
  return Final(&state,hashval);
}
