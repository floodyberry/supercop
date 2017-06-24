/*
u4.h version $Date$
D. J. Bernstein
Romain Dolbeau
Public domain.
*/

#define VEC4_ROT(a,imm) _mm_or_si128(_mm_slli_epi32(a,imm),_mm_srli_epi32(a,(32-imm)))

/* same, but replace 2 of the shift/shift/or "rotation" by byte shuffles (8 & 16) (better) */
#define VEC4_QUARTERROUND_SHUFFLE(a,b,c,d)                                \
   x_##a = _mm_add_epi32(x_##a, x_##b); t_##a = _mm_xor_si128(x_##d, x_##a); x_##d = _mm_shuffle_epi8(t_##a, rot16); \
   x_##c = _mm_add_epi32(x_##c, x_##d); t_##c = _mm_xor_si128(x_##b, x_##c); x_##b = VEC4_ROT(t_##c, 12); \
   x_##a = _mm_add_epi32(x_##a, x_##b); t_##a = _mm_xor_si128(x_##d, x_##a); x_##d = _mm_shuffle_epi8(t_##a, rot8); \
   x_##c = _mm_add_epi32(x_##c, x_##d); t_##c = _mm_xor_si128(x_##b, x_##c); x_##b = VEC4_ROT(t_##c,  7)

#define VEC4_QUARTERROUND(a,b,c,d) VEC4_QUARTERROUND_SHUFFLE(a,b,c,d)


  if (!bytes) return;
if (bytes>=256) {
  /* constant for shuffling bytes (replacing multiple-of-8 rotates) */
  __m128i rot16 = _mm_set_epi8(13,12,15,14,9,8,11,10,5,4,7,6,1,0,3,2);
  __m128i rot8  = _mm_set_epi8(14,13,12,15,10,9,8,11,6,5,4,7,2,1,0,3);
  u32 in12;
  __m128i x_0 = _mm_set1_epi32(x[0]);
  __m128i x_1 = _mm_set1_epi32(x[1]);
  __m128i x_2 = _mm_set1_epi32(x[2]);
  __m128i x_3 = _mm_set1_epi32(x[3]);
  __m128i x_4 = _mm_set1_epi32(x[4]);
  __m128i x_5 = _mm_set1_epi32(x[5]);
  __m128i x_6 = _mm_set1_epi32(x[6]);
  __m128i x_7 = _mm_set1_epi32(x[7]);
  __m128i x_8 = _mm_set1_epi32(x[8]);
  __m128i x_9 = _mm_set1_epi32(x[9]);
  __m128i x_10 = _mm_set1_epi32(x[10]);
  __m128i x_11 = _mm_set1_epi32(x[11]);
  __m128i x_12;// = _mm_set1_epi32(x[12]); /* useless */
  __m128i x_13 = _mm_set1_epi32(x[13]);
  __m128i x_14 = _mm_set1_epi32(x[14]);
  __m128i x_15 = _mm_set1_epi32(x[15]);
  __m128i orig0 = x_0;
  __m128i orig1 = x_1;
  __m128i orig2 = x_2;
  __m128i orig3 = x_3;
  __m128i orig4 = x_4;
  __m128i orig5 = x_5;
  __m128i orig6 = x_6;
  __m128i orig7 = x_7;
  __m128i orig8 = x_8;
  __m128i orig9 = x_9;
  __m128i orig10 = x_10;
  __m128i orig11 = x_11;
  __m128i orig12;// = x_12; /* useless */
  __m128i orig13 = x_13;
  __m128i orig14 = x_14;
  __m128i orig15 = x_15;
  __m128i t_0;
  __m128i t_1;
  __m128i t_2;
  __m128i t_3;
  __m128i t_4;
  __m128i t_5;
  __m128i t_6;
  __m128i t_7;
  __m128i t_8;
  __m128i t_9;
  __m128i t_10;
  __m128i t_11;
  __m128i t_12;
  __m128i t_13;
  __m128i t_14;
  __m128i t_15;

  while (bytes >= 256) {
    x_0 = orig0;
    x_1 = orig1;
    x_2 = orig2;
    x_3 = orig3;
    x_4 = orig4;
    x_5 = orig5;
    x_6 = orig6;
    x_7 = orig7;
    x_8 = orig8;
    x_9 = orig9;
    x_10 = orig10;
    x_11 = orig11;
    //x_12 = orig12; /* useless */
    x_13 = orig13;
    x_14 = orig14;
    x_15 = orig15;

    const __m128i addv12 = _mm_set_epi32(3,2,1,0);
    in12 = x[12];
    /*     t_12 = _mm_broadcastd_epi32(_mm_cvtsi32_si128(in12)); */ /* AVX2 */
    t_12 = _mm_set1_epi32(in12);
    x_12 = _mm_add_epi64(addv12, t_12);
    orig12 = x_12;
    x[12] += 4;

    for (i = 0 ; i < 12 ; i+=2) {
      VEC4_QUARTERROUND( 0, 4, 8,12);
      VEC4_QUARTERROUND( 1, 5, 9,13);
      VEC4_QUARTERROUND( 2, 6,10,14);
      VEC4_QUARTERROUND( 3, 7,11,15);
      VEC4_QUARTERROUND( 0, 5,10,15);
      VEC4_QUARTERROUND( 1, 6,11,12);
      VEC4_QUARTERROUND( 2, 7, 8,13);
      VEC4_QUARTERROUND( 3, 4, 9,14);
    }

#define ONEQUAD_TRANSPOSE(a,b,c,d)                                      \
    {                                                                   \
      __m128i t0, t1, t2, t3;                                           \
      x_##a = _mm_add_epi32(x_##a, orig##a);                         \
      x_##b = _mm_add_epi32(x_##b, orig##b);                         \
      x_##c = _mm_add_epi32(x_##c, orig##c);                         \
      x_##d = _mm_add_epi32(x_##d, orig##d);                         \
      t_##a = _mm_unpacklo_epi32(x_##a, x_##b);                      \
      t_##b = _mm_unpacklo_epi32(x_##c, x_##d);                      \
      t_##c = _mm_unpackhi_epi32(x_##a, x_##b);                      \
      t_##d = _mm_unpackhi_epi32(x_##c, x_##d);                      \
      x_##a = _mm_unpacklo_epi64(t_##a, t_##b);                      \
      x_##b = _mm_unpackhi_epi64(t_##a, t_##b);                      \
      x_##c = _mm_unpacklo_epi64(t_##c, t_##d);                      \
      x_##d = _mm_unpackhi_epi64(t_##c, t_##d);                      \
      t0 = _mm_xor_si128(x_##a, _mm_loadu_si128((__m128i*)(m+0)));       \
      _mm_storeu_si128((__m128i*)(out+0),t0);                            \
      t1 = _mm_xor_si128(x_##b, _mm_loadu_si128((__m128i*)(m+64)));      \
      _mm_storeu_si128((__m128i*)(out+64),t1);                           \
      t2 = _mm_xor_si128(x_##c, _mm_loadu_si128((__m128i*)(m+128)));     \
      _mm_storeu_si128((__m128i*)(out+128),t2);                          \
      t3 = _mm_xor_si128(x_##d, _mm_loadu_si128((__m128i*)(m+192)));     \
      _mm_storeu_si128((__m128i*)(out+192),t3);                          \
    }

#define ONEQUAD_TRANSPOSE_NOXOR(a,b,c,d)                                \
    {                                                                   \
      __m128i t0, t1, t2, t3;                                           \
      x_##a = _mm_add_epi32(x_##a, orig##a);                            \
      x_##b = _mm_add_epi32(x_##b, orig##b);                            \
      x_##c = _mm_add_epi32(x_##c, orig##c);                            \
      x_##d = _mm_add_epi32(x_##d, orig##d);                            \
      t_##a = _mm_unpacklo_epi32(x_##a, x_##b);                         \
      t_##b = _mm_unpacklo_epi32(x_##c, x_##d);                         \
      t_##c = _mm_unpackhi_epi32(x_##a, x_##b);                         \
      t_##d = _mm_unpackhi_epi32(x_##c, x_##d);                         \
      x_##a = _mm_unpacklo_epi64(t_##a, t_##b);                         \
      x_##b = _mm_unpackhi_epi64(t_##a, t_##b);                         \
      x_##c = _mm_unpacklo_epi64(t_##c, t_##d);                         \
      x_##d = _mm_unpackhi_epi64(t_##c, t_##d);                         \
      _mm_storeu_si128((__m128i*)(out+0),x_##a);                         \
      _mm_storeu_si128((__m128i*)(out+64),x_##b);                        \
      _mm_storeu_si128((__m128i*)(out+128),x_##c);                       \
      _mm_storeu_si128((__m128i*)(out+192),x_##d);                       \
    }
    
#ifndef CHACHA_NO_XOR
#define ONEQUAD(a,b,c,d) ONEQUAD_TRANSPOSE(a,b,c,d)
#else
#define ONEQUAD(a,b,c,d) ONEQUAD_TRANSPOSE_NOXOR(a,b,c,d)
#endif

    ONEQUAD(0,1,2,3);
    m+=16;
    out+=16;
    ONEQUAD(4,5,6,7);
    m+=16;
    out+=16;
    ONEQUAD(8,9,10,11);
    m+=16;
    out+=16;
    ONEQUAD(12,13,14,15);
    m-=48;
    out-=48;
    
#undef ONEQUAD
#undef ONEQUAD_TRANSPOSE

    bytes -= 256;
    out += 256;
    m += 256;
  }
 }
#undef VEC4_ROT
#undef VEC4_QUARTERROUND
#undef VEC4_QUARTERROUND_SHUFFLE
