#include <emmintrin.h>

#include "hamsi.h"
#include "hamsi-tables.h"

/* -------------------------------------------------------------------------- */

#ifdef PRINT_INTERNALS

#include <stdio.h>

#define print_bytes(x, n, s) _print_bytes(x, n, s)
#define print_word(x, s) _print_word(x, s)
#define print_state(s0, s1, s2, s3, s) _print_state(s0, s1, s2, s3, s)
#define print_cv(c0, c1, s) _print_cv(c0, c1, s)

void _print_bytes(const uint8_t* x, int n, const char* s)
{
  int i;

  printf("%8s:", s);

  for (i = 0; i < n; ++i)
    {
      if ((i > 0) && ((i % 16) == 0))
        printf("\n%8s ", "");

      printf(" %02X", (int)(x[i]));
    }

  printf("\n\n");
}

void _print_word(__m128i x, const char* s)
{
  uint32_t w[4] __attribute__ ((aligned (32)));

  _mm_store_si128((__m128i*)w, x);
  printf("%8s: %08X %08X %08X %08X\n", s, w[0], w[1], w[2], w[3]);
}

void _print_state(__m128i s0, __m128i s1, __m128i s2, __m128i s3, const char* s)
{
  printf("--- %s ---\n", s);

  print_word(s0, "s0");
  print_word(s1, "s1");
  print_word(s2, "s2");
  print_word(s3, "s3");

  printf("\n");
}

void _print_cv(__m128i c0, __m128i c1, const char* s)
{
  printf("--- %s ---\n", s);

  print_word(c0, "c0");
  print_word(c1, "c1");

  printf("\n");
}

#else

#define print_bytes(x, n, s)
#define print_word(x, s)
#define print_state(s0, s1, s2, s3, s)
#define print_cv(c0, c1, s)

#endif

/* -------------------------------------------------------------------------- */

#define shl(x, c) do { x = _mm_slli_epi32(x, c); } while (0)
#define shr(x, c) do { x = _mm_srli_epi32(x, c); } while (0)

#define rol(x, c) do {                                   \
    t = x; shl(x, c); shr(t, 32 - c); x |= t;            \
  } while (0)

#define ONES _mm_set1_epi32(-1)

#define sub(s0, s1, s2, s3) do {         		 \
    __m128i t;						 \
							 \
                        s3 ^= ONES;			 \
    s1 ^= s0; t   = s0; s0 &= s2;			 \
    s0 ^= s3; s3 |= t ; s2 ^= s1;			 \
    s3 ^= s1; s1 &= s0; s0 ^= s2;			 \
    s2 &= s3; s3 |= s1; s0 ^= ONES;			 \
    s3 ^= s0; t  ^= s0; s0 ^= s2;			 \
    s1 |= s2;						 \
							 \
    s2 = s0;						 \
    s0 = t;						 \
  } while (0)

#define mix(s0, s1, s2, s3) do {                         \
    __m128i t;                                           \
                                                         \
    rol(s0, 13);                                         \
    rol(s2, 3);                                          \
                                                         \
    s1 ^= s0; s1 ^= s2;                                  \
    t   = s0; shl(t, 3);                                 \
    s3 ^= s2; s3 ^= t;                                   \
                                                         \
    rol(s1, 1);                                          \
    rol(s3, 7);                                          \
                                                         \
    s0 ^= s1; s0 ^= s3;                                  \
    t   = s1; shl(t, 7);                                 \
    s2 ^= s3; s2 ^= t;                                   \
                                                         \
    rol(s0,  5);                                         \
    rol(s2, 22);                                         \
  } while (0)

#define shiftrows(s0, s1, s2, s3) do {                   \
    s1 = _mm_shuffle_epi32(s1, _MM_SHUFFLE(0, 3, 2, 1)); \
    s2 = _mm_shuffle_epi32(s2, _MM_SHUFFLE(1, 0, 3, 2)); \
    s3 = _mm_shuffle_epi32(s3, _MM_SHUFFLE(2, 1, 0, 3)); \
  } while (0)

#define swortfihs(s0, s1, s2, s3) do {                   \
    s1 = _mm_shuffle_epi32(s1, _MM_SHUFFLE(2, 1, 0, 3)); \
    s2 = _mm_shuffle_epi32(s2, _MM_SHUFFLE(1, 0, 3, 2)); \
    s3 = _mm_shuffle_epi32(s3, _MM_SHUFFLE(0, 3, 2, 1)); \
  } while (0)

#define tl(m, i) _mm_load_si128((__m128i*)(t256[i][(m)[i]] + 0))
#define th(m, i) _mm_load_si128((__m128i*)(t256[i][(m)[i]] + 4))

#define ml(m) (tl(m, 0) ^ tl(m, 1) ^ tl(m, 2) ^ tl(m, 3))
#define mh(m) (th(m, 0) ^ th(m, 1) ^ th(m, 2) ^ th(m, 3))

#define addconst(s0, s1, s2, s3, i, j) do {              \
    s0 ^= _mm_load_si128((__m128i*)(alpha[j][0] + 0));   \
    s1 ^= _mm_load_si128((__m128i*)(alpha[j][1] + 0));   \
    s2 ^= _mm_load_si128((__m128i*)(alpha[j][2] + 0));   \
    s3 ^= _mm_load_si128((__m128i*)(alpha[j][3] + 0));   \
                                                         \
    s0 ^= _mm_set_epi32(0, 0, i, 0);                     \
} while (0)

#define reorder(a, b) do {                               \
    const __m128i s = _mm_unpacklo_epi64(b, a);          \
    const __m128i t = _mm_unpackhi_epi64(a, b);          \
    a = s;                                               \
    b = t;                                               \
  } while(0)

#define round(s0, s1, s2, s3, i, j) do {                 \
    addconst(s0, s1, s2, s3, i, j);                      \
    print_state(s0, s1, s2, s3, "after addconst");       \
                                                         \
    sub(s0, s1, s2, s3);                                 \
    print_state(s0, s1, s2, s3, "after sub");            \
                                                         \
    shiftrows(s0, s1, s2, s3);                           \
    print_state(s0, s1, s2, s3, "after shiftrows");      \
                                                         \
    mix(s0, s1, s2, s3);                                 \
    print_state(s0, s1, s2, s3, "after mix");            \
                                                         \
    swortfihs(s0, s1, s2, s3);                           \
    print_state(s0, s1, s2, s3, "after swortfihs");      \
  } while (0)

#define plain_round(s0, s1, s2, s3, i) round(s0, s1, s2, s3, i, 0)
#define final_round(s0, s1, s2, s3, i) round(s0, s1, s2, s3, i, 1)

#define load_cv(cv) do {                                 \
    c0 = _mm_load_si128((__m128i*)(cv + 0));             \
    c1 = _mm_load_si128((__m128i*)(cv + 4));             \
  } while (0)

#define plain_iteration(m) do {                          \
    __m128i s0, s1, s2, s3;                              \
                                                         \
    print_cv(c0, c1, "input");                           \
    print_bytes(m, 4, "m");                              \
                                                         \
    s0 = c0;                                             \
    s1 = ml(m);                                          \
    s2 = c1;                                             \
    s3 = mh(m);                                          \
                                                         \
    reorder(s0, s1);                                     \
    reorder(s2, s3);                                     \
                                                         \
    print_state(s0, s1, s2, s3, "after concat");         \
                                                         \
    plain_round(s0, s1, s2, s3, 0);                      \
    plain_round(s0, s1, s2, s3, 1);                      \
    plain_round(s0, s1, s2, s3, 2);                      \
                                                         \
    c0 ^= s0;                                            \
    c1 ^= s2;                                            \
                                                         \
    print_cv(c0, c1, "output");                          \
  } while (0)    

#define final_iteration(m) do {                          \
    __m128i s0, s1, s2, s3;                              \
                                                         \
    print_cv(c0, c1, "input");                           \
    print_bytes(m, 4, "m");                              \
                                                         \
    s0 = c0;                                             \
    s1 = ml(m);                                          \
    s2 = c1;                                             \
    s3 = mh(m);                                          \
                                                         \
    reorder(s0, s1);                                     \
    reorder(s2, s3);                                     \
                                                         \
    print_state(s0, s1, s2, s3, "after concat");         \
                                                         \
    final_round(s0, s1, s2, s3, 0);                      \
    final_round(s0, s1, s2, s3, 1);                      \
    final_round(s0, s1, s2, s3, 2);                      \
    final_round(s0, s1, s2, s3, 3);                      \
    final_round(s0, s1, s2, s3, 4);                      \
    final_round(s0, s1, s2, s3, 5);                      \
                                                         \
    c0 ^= s0;                                            \
    c1 ^= s2;                                            \
                                                         \
    print_cv(c0, c1, "output");                          \
  } while (0)   

#define save_cv(cv) do {                                 \
    _mm_store_si128((__m128i*)(cv + 0), c0);             \
    _mm_store_si128((__m128i*)(cv + 4), c1);             \
  } while (0)  

/* -------------------------------------------------------------------------- */

HashReturn Init
  (hashState* const state, const int hashbitlen)
{
  __m128i c0, c1;

  if (hashbitlen != 256)
    return BAD_HASHBITLEN;

  state->databitlen = 0;
  state->hashbitlen = 256;

  load_cv(iv256);
  save_cv(state->cv);

  return SUCCESS;
}

/* -------------------------------------------------------------------------- */

HashReturn Update
  (hashState* const state, const BitSequence* data, DataLength databitlen)
{
  int i;

  const int bufferbytes = (state->databitlen % 32) / 8;
  state->databitlen += databitlen;

  if (8 * bufferbytes + databitlen < 32)
    for (i = 0; i < (databitlen + 7) / 8; ++i)
      state->buffer[bufferbytes + i] = data[i];
  else
    {    
      __m128i c0, c1;
 
      load_cv(state->cv);

      if (bufferbytes > 0)
        {
          const int bytes = 4 - bufferbytes;

          for (i = 0; i < bytes; ++i)
            state->buffer[bufferbytes + i] = data[i];

          plain_iteration(state->buffer);
          data += bytes;
          databitlen -= 8 * bytes;
        }

      while (databitlen >= 32) 
        {
          plain_iteration(data);
          data += 4;
          databitlen -= 32;
        }

      save_cv(state->cv);

      for (i = 0; i < (databitlen + 7) / 8; ++i)
        state->buffer[i] = data[i];
    }

  return SUCCESS;       
}

/* -------------------------------------------------------------------------- */

HashReturn Final
  (hashState* const state, BitSequence* const hashval)
{
  const int bufferbytes = (state->databitlen % 32) / 8;
  const int bits = state->databitlen % 8;

  __m128i c0, c1;
  uint8_t length[8];

  int i;

  state->buffer[bufferbytes] &= 0xFF << (8 - bits);
  state->buffer[bufferbytes] |= 1 << (7 - bits);

  for (i = bufferbytes + 1; i < 4; ++i)
    state->buffer[i] = 0;

  for (i = 0; i < 8; ++i)
    length[i] = (state->databitlen >> (8 * (7 - i))) & 0xFF;

  load_cv(state->cv);

  plain_iteration(state->buffer);
  plain_iteration(length + 0);
  final_iteration(length + 4);

  save_cv(state->cv);

  for (i = 0; i < 8; ++i)
    {
      const uint32_t t = state->cv[i];

      hashval[i * 4 + 0] = (t >> 24) & 0xFF;
      hashval[i * 4 + 1] = (t >> 16) & 0xFF;
      hashval[i * 4 + 2] = (t >>  8) & 0xFF;
      hashval[i * 4 + 3] = (t >>  0) & 0xFF;
    }

  return SUCCESS;
}

/* -------------------------------------------------------------------------- */

HashReturn Hash
  (int hashbitlen, const BitSequence* data, DataLength databitlen,
   BitSequence *hashval)
{
    hashState state;
    HashReturn ret = Init(&state, hashbitlen);

    if (ret == SUCCESS)
      {
        Update(&state, data, databitlen);
        Final(&state, hashval);
      }

    return ret;
}

/* -------------------------------------------------------------------------- */

#ifdef PRINT_INTERNALS

int main()
{
  uint8_t data[8] = {0x85, 0x69, 0xDF, 0x97, 0x1E, 0x67, 0x4E, 0x00};
  uint8_t hashval[32];

  Hash(256, data, 57, hashval);

  print_bytes(hashval, 32, "hash");

  return 0;
}

#endif

/* -------------------------------------------------------------------------- */
