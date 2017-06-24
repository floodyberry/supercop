/*
u1.h version $Date$
D. J. Bernstein
Romain Dolbeau
Public domain.
*/

  if (!bytes) return;
  while (bytes >=64) {
    __m128i x_0, x_1, x_2, x_3;
    __m128i t_1;
    const __m128i rot16 = _mm_set_epi8(13,12,15,14,9,8,11,10,5,4,7,6,1,0,3,2);
    const __m128i rot8  = _mm_set_epi8(14,13,12,15,10,9,8,11,6,5,4,7,2,1,0,3);

    x_0 = _mm_load_si128((__m128i*)(x +  0));
    x_1 = _mm_load_si128((__m128i*)(x +  4));
    x_2 = _mm_load_si128((__m128i*)(x +  8));
    x_3 = _mm_load_si128((__m128i*)(x + 12));

    for (i = 0 ; i < 12 ; i += 2) {
      x_0 = _mm_add_epi32(x_0, x_1);
      x_3 = _mm_xor_si128(x_3, x_0);
      x_3 = _mm_shuffle_epi8(x_3, rot16);

      x_2 = _mm_add_epi32(x_2, x_3);
      x_1 = _mm_xor_si128(x_1, x_2);

      t_1 = x_1;
      x_1 = _mm_slli_epi32(x_1, 12);
      t_1 = _mm_srli_epi32(t_1, 20);
      x_1 = _mm_xor_si128(x_1, t_1);

      x_0 = _mm_add_epi32(x_0, x_1);
      x_3 = _mm_xor_si128(x_3, x_0);
      x_0 = _mm_shuffle_epi32(x_0, 0x93);
      x_3 = _mm_shuffle_epi8(x_3, rot8);

      x_2 = _mm_add_epi32(x_2, x_3);
      x_3 = _mm_shuffle_epi32(x_3, 0x4e);
      x_1 = _mm_xor_si128(x_1, x_2);
      x_2 = _mm_shuffle_epi32(x_2, 0x39);

      t_1 = x_1;
      x_1 = _mm_slli_epi32(x_1, 7);
      t_1 = _mm_srli_epi32(t_1, 25);
      x_1 = _mm_xor_si128(x_1, t_1);

      x_0 = _mm_add_epi32(x_0, x_1);
      x_3 = _mm_xor_si128(x_3, x_0);
      x_3 = _mm_shuffle_epi8(x_3, rot16);

      x_2 = _mm_add_epi32(x_2, x_3);
      x_1 = _mm_xor_si128(x_1, x_2);

      t_1 = x_1;
      x_1 = _mm_slli_epi32(x_1, 12);
      t_1 = _mm_srli_epi32(t_1, 20);
      x_1 = _mm_xor_si128(x_1, t_1);

      x_0 = _mm_add_epi32(x_0, x_1);
      x_3 = _mm_xor_si128(x_3, x_0);
      x_0 = _mm_shuffle_epi32(x_0, 0x39);
      x_3 = _mm_shuffle_epi8(x_3, rot8);

      x_2 = _mm_add_epi32(x_2, x_3);
      x_3 = _mm_shuffle_epi32(x_3, 0x4e);
      x_1 = _mm_xor_si128(x_1, x_2);
      x_2 = _mm_shuffle_epi32(x_2, 0x93);

      t_1 = x_1;
      x_1 = _mm_slli_epi32(x_1, 7);
      t_1 = _mm_srli_epi32(t_1, 25);
      x_1 = _mm_xor_si128(x_1, t_1);
    }
    x_0 = _mm_add_epi32(x_0, _mm_load_si128((__m128i*)(x +  0)));
    x_1 = _mm_add_epi32(x_1, _mm_load_si128((__m128i*)(x +  4)));
    x_2 = _mm_add_epi32(x_2, _mm_load_si128((__m128i*)(x +  8)));
    x_3 = _mm_add_epi32(x_3, _mm_load_si128((__m128i*)(x + 12)));
#ifndef CHACHA_NO_XOR
    x_0 = _mm_xor_si128(x_0, _mm_load_si128((__m128i*)(m +  0)));
    x_1 = _mm_xor_si128(x_1, _mm_load_si128((__m128i*)(m + 16)));
    x_2 = _mm_xor_si128(x_2, _mm_load_si128((__m128i*)(m + 32)));
    x_3 = _mm_xor_si128(x_3, _mm_load_si128((__m128i*)(m + 48)));
#endif
    _mm_storeu_si128((__m128i*)(out +  0),  x_0);
    _mm_storeu_si128((__m128i*)(out + 16),  x_1);
    _mm_storeu_si128((__m128i*)(out + 32),  x_2);
    _mm_storeu_si128((__m128i*)(out + 48),  x_3);
    
    x[12]++;

    bytes -= 64;
    out += 64;
    m += 64;
  }
