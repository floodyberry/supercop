inline void TF1024AES (u64 *h, u64 *m) {

  __m128i xmm[16];
  __m128i constP;
  __m128i constQ;
  __m128i high;
  __m128i tmp[8], tmp2[8], tmp4[2];

  /* constants */
  __m128i transpMaskA = _mm_set_epi32(0x0f070b03, 0x0e060a02, 0x0d050901, 0x0c040800);
  __m128i transpMaskB = _mm_set_epi32(0x0f0e0d0c, 0x07060504, 0x0b0a0908, 0x03020100);
  __m128i zero = _mm_setzero_si128();
  __m128i andM = _mm_set_epi32(0x7f7f7f7f, 0x7f7f7f7f, 0x7f7f7f7f, 0x7f7f7f7f);
  __m128i x1bM = _mm_set_epi32(0x1b1b1b1b, 0x1b1b1b1b, 0x1b1b1b1b, 0x1b1b1b1b);

  /* subshiftMasks are for ShiftBytes + SubBytes (for AESENCLAST) */
  __m128i subshiftMask[8] = {  _mm_set_epi32(0x0306090c, 0x0f020508, 0x0b0e0104, 0x070a0d00),
                               _mm_set_epi32(0x04070a0d, 0x00030609, 0x0c0f0205, 0x080b0e01),
                               _mm_set_epi32(0x05080b0e, 0x0104070a, 0x0d000306, 0x090c0f02),
                               _mm_set_epi32(0x06090c0f, 0x0205080b, 0x0e010407, 0x0a0d0003),
                               _mm_set_epi32(0x070a0d00, 0x0306090c, 0x0f020508, 0x0b0e0104),
                               _mm_set_epi32(0x080b0e01, 0x04070a0d, 0x00030609, 0x0c0f0205),
                               _mm_set_epi32(0x090c0f02, 0x05080b0e, 0x0104070a, 0x0d000306),
                               _mm_set_epi32(0x0e010407, 0x0a0d0003, 0x06090c0f, 0x0205080b)  };

  u8 i = 0, j = 0;
  u8 round = 0;

  /* load matrix */
  for(i = 0; i < 8; i++)
  {
    xmm[8+i] = _mm_set_epi32(m[2*i+1] >> 32, m[2*i+1], m[2*i+0] >> 32, m[2*i+0]); /* Q=m */
    xmm[i] = _mm_set_epi32(h[2*i+1] >> 32, h[2*i+1], h[2*i+0] >> 32, h[2*i+0]);   /* P=h */
    xmm[i] = _mm_xor_si128(xmm[i], xmm[8+i]); /* P^=m */
  }

  /* matrix is now: 2 Columns per XMM, [||P||, ||Q||] */
  /* transpose matrix to get: [Row of P, Row of Q] in one XMM */
  for(j = 0; j < 2; j++)
  {
    for(i = 0; i < 8; i++)
      xmm[j*8+i] = _mm_shuffle_epi8(xmm[j*8+i], transpMaskA);
    tmp[0] = _mm_unpackhi_epi16(xmm[j*8+0], xmm[j*8+1]);
    xmm[j*8+0] = _mm_unpacklo_epi16(xmm[j*8+0], xmm[j*8+1]);
    xmm[j*8+1] = tmp[0];
    tmp[1] = _mm_unpackhi_epi16(xmm[j*8+2], xmm[j*8+3]);
    xmm[j*8+2] = _mm_unpacklo_epi16(xmm[j*8+2], xmm[j*8+3]);
    xmm[j*8+3] = tmp[1];
    tmp[2] = _mm_unpackhi_epi16(xmm[j*8+4], xmm[j*8+5]);
    xmm[j*8+4] = _mm_unpacklo_epi16(xmm[j*8+4], xmm[j*8+5]);
    xmm[j*8+5] = tmp[2];
    tmp[3] = _mm_unpackhi_epi16(xmm[j*8+6], xmm[j*8+7]);
    xmm[j*8+6] = _mm_unpacklo_epi16(xmm[j*8+6], xmm[j*8+7]);
    xmm[j*8+7] = tmp[3];

    for(i = 0; i < 8; i++)
      xmm[j*8+i] = _mm_shuffle_epi8(xmm[j*8+i], transpMaskB);
    tmp[0] = _mm_unpackhi_epi32(xmm[j*8+0], xmm[j*8+2]);
    xmm[j*8+0] = _mm_unpacklo_epi32(xmm[j*8+0], xmm[j*8+2]);
    xmm[j*8+2] = tmp[0];
    tmp[1] = _mm_unpackhi_epi32(xmm[j*8+1], xmm[j*8+3]);
    xmm[j*8+1] = _mm_unpacklo_epi32(xmm[j*8+1], xmm[j*8+3]);
    xmm[j*8+3] = tmp[1];
    tmp[2] = _mm_unpackhi_epi32(xmm[j*8+4], xmm[j*8+6]);
    xmm[j*8+4] = _mm_unpacklo_epi32(xmm[j*8+4], xmm[j*8+6]);
    xmm[j*8+6] = tmp[2];
    tmp[3] = _mm_unpackhi_epi32(xmm[j*8+5], xmm[j*8+7]);
    xmm[j*8+5] = _mm_unpacklo_epi32(xmm[j*8+5], xmm[j*8+7]);
    xmm[j*8+7] = tmp[3];

    /* matrix is now: 2 Rows per XMM, P / Q */
    tmp[0] = _mm_unpackhi_epi64(xmm[j*8+0], xmm[j*8+4]);
    xmm[j*8+0] = _mm_unpacklo_epi64(xmm[j*8+0], xmm[j*8+4]);
    tmp[1] = _mm_unpackhi_epi64(xmm[j*8+1], xmm[j*8+5]);
    tmp[2] = _mm_unpacklo_epi64(xmm[j*8+1], xmm[j*8+5]);
    xmm[j*8+1] = tmp[0];
    xmm[j*8+5] = _mm_unpackhi_epi64(xmm[j*8+2], xmm[j*8+6]);
    xmm[j*8+4] = _mm_unpacklo_epi64(xmm[j*8+2], xmm[j*8+6]);
    xmm[j*8+2] = tmp[2];
    xmm[j*8+6] = _mm_unpacklo_epi64(xmm[j*8+3], xmm[j*8+7]);
    xmm[j*8+7] = _mm_unpackhi_epi64(xmm[j*8+3], xmm[j*8+7]);
    xmm[j*8+3] = tmp[1];/**/
  }

  /* matrix is now: [Row of P, Row of Q] in one XMM
   * and ready to be processed */

  for(round = 0; round < ROUNDS; round++)
  {
    /* AddRoundConstant */
    constP = _mm_set_epi32(0, 0, 0, round);
    constQ = _mm_set_epi32(0, 0, 0, (round ^ 0xff));
    xmm[0] = _mm_xor_si128(xmm[0], constP);
    xmm[15] = _mm_xor_si128(xmm[15], constQ);

    //printStateBig(xmm);

    for(j = 0; j < 2; j++)
    {
      /* ShiftBytes + SubBytes using AES-NI */
      for(i = 0; i < 8; i++)
      {
        xmm[j*8+i] = _mm_shuffle_epi8(xmm[j*8+i], subshiftMask[i]);
        xmm[j*8+i] = _mm_aesenclast_si128(xmm[j*8+i], zero);
      }
      //printStateBig(xmm);

      /* MixBytes */
      /* 8-bit AVR Algorithm ("Byte-sliced") */

      // mul1
      tmp[0] = _mm_xor_si128(xmm[j*8+2], xmm[j*8+5]);
      tmp[1] = _mm_xor_si128(xmm[j*8+0], xmm[j*8+3]);
      tmp[2] = _mm_xor_si128(xmm[j*8+4], xmm[j*8+6]);
      tmp[3] = _mm_xor_si128(xmm[j*8+1], xmm[j*8+7]);

      tmp[6] = _mm_xor_si128(tmp[0], tmp[1]);
      tmp[6] = _mm_xor_si128(tmp[6], xmm[j*8+4]);

      tmp[1] = _mm_xor_si128(tmp[1], xmm[j*8+6]);

      tmp[4] = _mm_xor_si128(tmp[1], xmm[j*8+1]);
      tmp[4] = _mm_xor_si128(tmp[4], xmm[j*8+2]);

      tmp[1] = _mm_xor_si128(tmp[1], xmm[j*8+5]);
      tmp[1] = _mm_xor_si128(tmp[1], xmm[j*8+7]);

      tmp[5] = _mm_xor_si128(tmp[3], xmm[j*8+2]);
      tmp[5] = _mm_xor_si128(tmp[5], xmm[j*8+3]);
      tmp[5] = _mm_xor_si128(tmp[5], xmm[j*8+4]);

      tmp[7] = _mm_xor_si128(tmp[2], xmm[j*8+1]);
      tmp[7] = _mm_xor_si128(tmp[7], xmm[j*8+3]);
      tmp[7] = _mm_xor_si128(tmp[7], xmm[j*8+5]);

      tmp[0] = _mm_xor_si128(tmp[0], tmp[2]);
      tmp[0] = _mm_xor_si128(tmp[0], xmm[j*8+7]);

      tmp[3] = _mm_xor_si128(tmp[3], xmm[j*8+0]);

      tmp[2] = _mm_xor_si128(tmp[2], tmp[3]);

      tmp[3] = _mm_xor_si128(tmp[3], xmm[j*8+2]);
      tmp[3] = _mm_xor_si128(tmp[3], xmm[j*8+5]);

      // mul2
      for(i = 0; i < 8; i++)
      {
        high = _mm_blendv_epi8(zero, x1bM, xmm[j*8+i]);
        xmm[j*8+i] = _mm_and_si128(xmm[j*8+i], andM);
        xmm[j*8+i] = _mm_slli_epi64(xmm[j*8+i], 1);
        xmm[j*8+i] = _mm_xor_si128(xmm[j*8+i], high);
      }

      tmp2[5] = _mm_xor_si128(xmm[j*8+2], xmm[j*8+5]);
      tmp2[6] = _mm_xor_si128(xmm[j*8+0], xmm[j*8+3]);
      tmp2[7] = _mm_xor_si128(xmm[j*8+4], xmm[j*8+6]);
      tmp2[0] = _mm_xor_si128(xmm[j*8+1], xmm[j*8+7]);

      tmp2[3] = _mm_xor_si128(tmp2[5], tmp2[6]);
      tmp2[3] = _mm_xor_si128(tmp2[3], xmm[j*8+4]);

      tmp2[6] = _mm_xor_si128(tmp2[6], xmm[j*8+6]);

      tmp2[1] = _mm_xor_si128(tmp2[6], xmm[j*8+1]);
      tmp2[1] = _mm_xor_si128(tmp2[1], xmm[j*8+2]);

      tmp2[6] = _mm_xor_si128(tmp2[6], xmm[j*8+5]);
      tmp2[6] = _mm_xor_si128(tmp2[6], xmm[j*8+7]);

      tmp2[2] = _mm_xor_si128(tmp2[0], xmm[j*8+2]);
      tmp2[2] = _mm_xor_si128(tmp2[2], xmm[j*8+3]);
      tmp2[2] = _mm_xor_si128(tmp2[2], xmm[j*8+4]);

      tmp2[4] = _mm_xor_si128(tmp2[7], xmm[j*8+1]);
      tmp2[4] = _mm_xor_si128(tmp2[4], xmm[j*8+3]);
      tmp2[4] = _mm_xor_si128(tmp2[4], xmm[j*8+5]);

      tmp2[5] = _mm_xor_si128(tmp2[5], tmp2[7]);
      tmp2[5] = _mm_xor_si128(tmp2[5], xmm[j*8+7]);

      tmp2[0] = _mm_xor_si128(tmp2[0], xmm[j*8+0]);

      tmp2[7] = _mm_xor_si128(tmp2[7], tmp2[0]);

      tmp2[0] = _mm_xor_si128(tmp2[0], xmm[j*8+2]);
      tmp2[0] = _mm_xor_si128(tmp2[0], xmm[j*8+5]);

      for(i = 0; i < 8; i++)
        tmp[i] = _mm_xor_si128(tmp[i], tmp2[i]);

      // mul4
      for(i = 0; i < 8; i++)
      {
        high = _mm_blendv_epi8(zero, x1bM, xmm[j*8+i]);
        xmm[j*8+i] = _mm_and_si128(xmm[j*8+i], andM);
        xmm[j*8+i] = _mm_slli_epi64(xmm[j*8+i], 1);
        xmm[j*8+i] = _mm_xor_si128(xmm[j*8+i], high);
      }

      tmp4[0] = _mm_xor_si128(xmm[j*8+4], xmm[j*8+7]);
      tmp[0] = _mm_xor_si128(tmp[0], tmp4[0]);
      tmp[1] = _mm_xor_si128(tmp[1], tmp4[0]);

      tmp4[1] = _mm_xor_si128(xmm[j*8+3], xmm[j*8+6]);
      tmp[0] = _mm_xor_si128(tmp[0], tmp4[1]);
      tmp[7] = _mm_xor_si128(tmp[7], tmp4[1]);

      tmp4[0] = _mm_xor_si128(xmm[j*8+0], xmm[j*8+5]);
      tmp[1] = _mm_xor_si128(tmp[1], tmp4[0]);
      tmp[2] = _mm_xor_si128(tmp[2], tmp4[0]);

      tmp4[1] = _mm_xor_si128(xmm[j*8+1], xmm[j*8+6]);
      tmp[2] = _mm_xor_si128(tmp[2], tmp4[1]);
      tmp[3] = _mm_xor_si128(tmp[3], tmp4[1]);

      tmp4[0] = _mm_xor_si128(xmm[j*8+2], xmm[j*8+7]);
      tmp[3] = _mm_xor_si128(tmp[3], tmp4[0]);
      tmp[4] = _mm_xor_si128(tmp[4], tmp4[0]);

      tmp4[1] = _mm_xor_si128(xmm[j*8+0], xmm[j*8+3]);
      tmp[4] = _mm_xor_si128(tmp[4], tmp4[1]);
      tmp[5] = _mm_xor_si128(tmp[5], tmp4[1]);

      tmp4[0] = _mm_xor_si128(xmm[j*8+1], xmm[j*8+4]);
      tmp[5] = _mm_xor_si128(tmp[5], tmp4[0]);
      tmp[6] = _mm_xor_si128(tmp[6], tmp4[0]);

      tmp4[1] = _mm_xor_si128(xmm[j*8+2], xmm[j*8+5]);
      tmp[6] = _mm_xor_si128(tmp[6], tmp4[1]);
      tmp[7] = _mm_xor_si128(tmp[7], tmp4[1]);

      for(i = 0; i < 8; i++)
        xmm[j*8+i] = tmp[i];
      /**/
    }

  }

  //printStateBig(xmm);
  /* undo load transpose */
  for(j = 0; j < 2; j++)
  {
    tmp[0] = _mm_unpackhi_epi64(xmm[j*8+0], xmm[j*8+1]);
    xmm[j*8+0] = _mm_unpacklo_epi64(xmm[j*8+0], xmm[j*8+1]);
    tmp[1] = _mm_unpackhi_epi64(xmm[j*8+2], xmm[j*8+3]);
    xmm[j*8+1] = _mm_unpacklo_epi64(xmm[j*8+2], xmm[j*8+3]);
    tmp[2] = _mm_unpackhi_epi64(xmm[j*8+4], xmm[j*8+5]);
    xmm[j*8+2] = _mm_unpacklo_epi64(xmm[j*8+4], xmm[j*8+5]);
    xmm[j*8+4] = tmp[0];
    xmm[j*8+5] = tmp[1];
    xmm[j*8+3] = _mm_unpacklo_epi64(xmm[j*8+6], xmm[j*8+7]);
    xmm[j*8+7] = _mm_unpackhi_epi64(xmm[j*8+6], xmm[j*8+7]);
    xmm[j*8+6] = tmp[2];

    for(i = 0; i < 8; i++)
      xmm[j*8+i] = _mm_shuffle_epi8(xmm[j*8+i], transpMaskA);
    tmp[0] = _mm_unpackhi_epi16(xmm[j*8+0], xmm[j*8+1]);
    xmm[j*8+0] = _mm_unpacklo_epi16(xmm[j*8+0], xmm[j*8+1]);
    xmm[j*8+1] = tmp[0];
    tmp[1] = _mm_unpackhi_epi16(xmm[j*8+2], xmm[j*8+3]);
    xmm[j*8+2] = _mm_unpacklo_epi16(xmm[j*8+2], xmm[j*8+3]);
    xmm[j*8+3] = tmp[1];
    tmp[2] = _mm_unpackhi_epi16(xmm[j*8+4], xmm[j*8+5]);
    xmm[j*8+4] = _mm_unpacklo_epi16(xmm[j*8+4], xmm[j*8+5]);
    xmm[j*8+5] = tmp[2];
    tmp[3] = _mm_unpackhi_epi16(xmm[j*8+6], xmm[j*8+7]);
    xmm[j*8+6] = _mm_unpacklo_epi16(xmm[j*8+6], xmm[j*8+7]);
    xmm[j*8+7] = tmp[3];

    for(i = 0; i < 8; i++)
      xmm[j*8+i] = _mm_shuffle_epi8(xmm[j*8+i], transpMaskB);
    tmp[0] = _mm_unpackhi_epi32(xmm[j*8+0], xmm[j*8+2]);
    xmm[j*8+0] = _mm_unpacklo_epi32(xmm[j*8+0], xmm[j*8+2]);
    xmm[j*8+2] = tmp[0];
    tmp[1] = _mm_unpackhi_epi32(xmm[j*8+1], xmm[j*8+3]);
    xmm[j*8+1] = _mm_unpacklo_epi32(xmm[j*8+1], xmm[j*8+3]);
    xmm[j*8+3] = tmp[1];
    tmp[2] = _mm_unpackhi_epi32(xmm[j*8+4], xmm[j*8+6]);
    xmm[j*8+4] = _mm_unpacklo_epi32(xmm[j*8+4], xmm[j*8+6]);
    xmm[j*8+6] = tmp[2];
    tmp[3] = _mm_unpackhi_epi32(xmm[j*8+5], xmm[j*8+7]);
    xmm[j*8+5] = _mm_unpacklo_epi32(xmm[j*8+5], xmm[j*8+7]);
    xmm[j*8+7] = tmp[3];
  }

  //printStateBig(xmm);

  /* finalize */
  for(i = 0; i < 8; i++)
  {
    xmm[i] = _mm_xor_si128(xmm[i], xmm[8+i]);
    xmm[8+i] = _mm_set_epi32(h[2*i+1] >> 32, h[2*i+1], h[2*i+0] >> 32, h[2*i+0]);
    xmm[i] = _mm_xor_si128(xmm[i], xmm[8+i]);

    u64* ptr = (u64*) &xmm[i];

    h[2*i+0] = ptr[0];
    h[2*i+1] = ptr[1];
  }

}//TF1024AES()

inline void OF1024AES (u64 *h) {

  __m128i xmm[16];
  __m128i constP;
  __m128i high;
  __m128i tmp[8], tmp2[8], tmp4[2];

  /* constants */
  __m128i transpMaskA = _mm_set_epi32(0x0f070b03, 0x0e060a02, 0x0d050901, 0x0c040800);
  __m128i transpMaskB = _mm_set_epi32(0x0f0e0d0c, 0x07060504, 0x0b0a0908, 0x03020100);
  __m128i zero = _mm_setzero_si128();
  __m128i andM = _mm_set_epi32(0x7f7f7f7f, 0x7f7f7f7f, 0x7f7f7f7f, 0x7f7f7f7f);
  __m128i x1bM = _mm_set_epi32(0x1b1b1b1b, 0x1b1b1b1b, 0x1b1b1b1b, 0x1b1b1b1b);

  /* subshiftMasks are for ShiftBytes + SubBytes (for AESENCLAST) */
  __m128i subshiftMask[8] = {  _mm_set_epi32(0x0306090c, 0x0f020508, 0x0b0e0104, 0x070a0d00),
                               _mm_set_epi32(0x04070a0d, 0x00030609, 0x0c0f0205, 0x080b0e01),
                               _mm_set_epi32(0x05080b0e, 0x0104070a, 0x0d000306, 0x090c0f02),
                               _mm_set_epi32(0x06090c0f, 0x0205080b, 0x0e010407, 0x0a0d0003),
                               _mm_set_epi32(0x070a0d00, 0x0306090c, 0x0f020508, 0x0b0e0104),
                               _mm_set_epi32(0x080b0e01, 0x04070a0d, 0x00030609, 0x0c0f0205),
                               _mm_set_epi32(0x090c0f02, 0x05080b0e, 0x0104070a, 0x0d000306),
                               _mm_set_epi32(0x0e010407, 0x0a0d0003, 0x06090c0f, 0x0205080b)  };

  u8 i = 0;
  u8 round = 0;

  /* load matrix */
  for(i = 0; i < 8; i++)
    xmm[i] = _mm_set_epi32(h[2*i+1] >> 32, h[2*i+1], h[2*i+0] >> 32, h[2*i+0]);   /* P=h */

  for(i = 0; i < 8; i++)
    xmm[i] = _mm_shuffle_epi8(xmm[i], transpMaskA);
  tmp[0] = _mm_unpackhi_epi16(xmm[0], xmm[1]);
  xmm[0] = _mm_unpacklo_epi16(xmm[0], xmm[1]);
  xmm[1] = tmp[0];
  tmp[1] = _mm_unpackhi_epi16(xmm[2], xmm[3]);
  xmm[2] = _mm_unpacklo_epi16(xmm[2], xmm[3]);
  xmm[3] = tmp[1];
  tmp[2] = _mm_unpackhi_epi16(xmm[4], xmm[5]);
  xmm[4] = _mm_unpacklo_epi16(xmm[4], xmm[5]);
  xmm[5] = tmp[2];
  tmp[3] = _mm_unpackhi_epi16(xmm[6], xmm[7]);
  xmm[6] = _mm_unpacklo_epi16(xmm[6], xmm[7]);
  xmm[7] = tmp[3];

  for(i = 0; i < 8; i++)
    xmm[i] = _mm_shuffle_epi8(xmm[i], transpMaskB);
  tmp[0] = _mm_unpackhi_epi32(xmm[0], xmm[2]);
  xmm[0] = _mm_unpacklo_epi32(xmm[0], xmm[2]);
  xmm[2] = tmp[0];
  tmp[1] = _mm_unpackhi_epi32(xmm[1], xmm[3]);
  xmm[1] = _mm_unpacklo_epi32(xmm[1], xmm[3]);
  xmm[3] = tmp[1];
  tmp[2] = _mm_unpackhi_epi32(xmm[4], xmm[6]);
  xmm[4] = _mm_unpacklo_epi32(xmm[4], xmm[6]);
  xmm[6] = tmp[2];
  tmp[3] = _mm_unpackhi_epi32(xmm[5], xmm[7]);
  xmm[5] = _mm_unpacklo_epi32(xmm[5], xmm[7]);
  xmm[7] = tmp[3];

  /* matrix is now: 2 Rows per XMM, P */
  tmp[0] = _mm_unpackhi_epi64(xmm[0], xmm[4]);
  xmm[0] = _mm_unpacklo_epi64(xmm[0], xmm[4]);
  tmp[1] = _mm_unpackhi_epi64(xmm[1], xmm[5]);
  tmp[2] = _mm_unpacklo_epi64(xmm[1], xmm[5]);
  xmm[1] = tmp[0];
  xmm[5] = _mm_unpackhi_epi64(xmm[2], xmm[6]);
  xmm[4] = _mm_unpacklo_epi64(xmm[2], xmm[6]);
  xmm[2] = tmp[2];
  xmm[6] = _mm_unpacklo_epi64(xmm[3], xmm[7]);
  xmm[7] = _mm_unpackhi_epi64(xmm[3], xmm[7]);
  xmm[3] = tmp[1];/**/

  /* matrix is now: [Row of P, Row of P] in one XMM
   * and ready to be processed */

  for(round = 0; round < ROUNDS; round++)
  {
    /* AddRoundConstant */
    constP = _mm_set_epi32(0, 0, 0, round);
    xmm[0] = _mm_xor_si128(xmm[0], constP);

    //printStateBig(xmm);

    /* ShiftBytes + SubBytes using AES-NI */
    for(i = 0; i < 8; i++)
    {
      xmm[i] = _mm_shuffle_epi8(xmm[i], subshiftMask[i]);
      xmm[i] = _mm_aesenclast_si128(xmm[i], zero);
    }
    //printStateBig(xmm);

    /* MixBytes */
    /* 8-bit AVR Algorithm ("Byte-sliced") */

    // mul1
    tmp[0] = _mm_xor_si128(xmm[2], xmm[5]);
    tmp[1] = _mm_xor_si128(xmm[0], xmm[3]);
    tmp[2] = _mm_xor_si128(xmm[4], xmm[6]);
    tmp[3] = _mm_xor_si128(xmm[1], xmm[7]);

    tmp[6] = _mm_xor_si128(tmp[0], tmp[1]);
    tmp[6] = _mm_xor_si128(tmp[6], xmm[4]);

    tmp[1] = _mm_xor_si128(tmp[1], xmm[6]);

    tmp[4] = _mm_xor_si128(tmp[1], xmm[1]);
    tmp[4] = _mm_xor_si128(tmp[4], xmm[2]);

    tmp[1] = _mm_xor_si128(tmp[1], xmm[5]);
    tmp[1] = _mm_xor_si128(tmp[1], xmm[7]);

    tmp[5] = _mm_xor_si128(tmp[3], xmm[2]);
    tmp[5] = _mm_xor_si128(tmp[5], xmm[3]);
    tmp[5] = _mm_xor_si128(tmp[5], xmm[4]);

    tmp[7] = _mm_xor_si128(tmp[2], xmm[1]);
    tmp[7] = _mm_xor_si128(tmp[7], xmm[3]);
    tmp[7] = _mm_xor_si128(tmp[7], xmm[5]);

    tmp[0] = _mm_xor_si128(tmp[0], tmp[2]);
    tmp[0] = _mm_xor_si128(tmp[0], xmm[7]);

    tmp[3] = _mm_xor_si128(tmp[3], xmm[0]);

    tmp[2] = _mm_xor_si128(tmp[2], tmp[3]);

    tmp[3] = _mm_xor_si128(tmp[3], xmm[2]);
    tmp[3] = _mm_xor_si128(tmp[3], xmm[5]);

    // mul2
    for(i = 0; i < 8; i++)
    {
      high = _mm_blendv_epi8(zero, x1bM, xmm[i]);
      xmm[i] = _mm_and_si128(xmm[i], andM);
      xmm[i] = _mm_slli_epi64(xmm[i], 1);
      xmm[i] = _mm_xor_si128(xmm[i], high);
    }

    tmp2[5] = _mm_xor_si128(xmm[2], xmm[5]);
    tmp2[6] = _mm_xor_si128(xmm[0], xmm[3]);
    tmp2[7] = _mm_xor_si128(xmm[4], xmm[6]);
    tmp2[0] = _mm_xor_si128(xmm[1], xmm[7]);

    tmp2[3] = _mm_xor_si128(tmp2[5], tmp2[6]);
    tmp2[3] = _mm_xor_si128(tmp2[3], xmm[4]);

    tmp2[6] = _mm_xor_si128(tmp2[6], xmm[6]);

    tmp2[1] = _mm_xor_si128(tmp2[6], xmm[1]);
    tmp2[1] = _mm_xor_si128(tmp2[1], xmm[2]);

    tmp2[6] = _mm_xor_si128(tmp2[6], xmm[5]);
    tmp2[6] = _mm_xor_si128(tmp2[6], xmm[7]);

    tmp2[2] = _mm_xor_si128(tmp2[0], xmm[2]);
    tmp2[2] = _mm_xor_si128(tmp2[2], xmm[3]);
    tmp2[2] = _mm_xor_si128(tmp2[2], xmm[4]);

    tmp2[4] = _mm_xor_si128(tmp2[7], xmm[1]);
    tmp2[4] = _mm_xor_si128(tmp2[4], xmm[3]);
    tmp2[4] = _mm_xor_si128(tmp2[4], xmm[5]);

    tmp2[5] = _mm_xor_si128(tmp2[5], tmp2[7]);
    tmp2[5] = _mm_xor_si128(tmp2[5], xmm[7]);

    tmp2[0] = _mm_xor_si128(tmp2[0], xmm[0]);

    tmp2[7] = _mm_xor_si128(tmp2[7], tmp2[0]);

    tmp2[0] = _mm_xor_si128(tmp2[0], xmm[2]);
    tmp2[0] = _mm_xor_si128(tmp2[0], xmm[5]);

    for(i = 0; i < 8; i++)
      tmp[i] = _mm_xor_si128(tmp[i], tmp2[i]);

    // mul4
    for(i = 0; i < 8; i++)
    {
      high = _mm_blendv_epi8(zero, x1bM, xmm[i]);
      xmm[i] = _mm_and_si128(xmm[i], andM);
      xmm[i] = _mm_slli_epi64(xmm[i], 1);
      xmm[i] = _mm_xor_si128(xmm[i], high);
    }

    tmp4[0] = _mm_xor_si128(xmm[4], xmm[7]);
    tmp[0] = _mm_xor_si128(tmp[0], tmp4[0]);
    tmp[1] = _mm_xor_si128(tmp[1], tmp4[0]);

    tmp4[1] = _mm_xor_si128(xmm[3], xmm[6]);
    tmp[0] = _mm_xor_si128(tmp[0], tmp4[1]);
    tmp[7] = _mm_xor_si128(tmp[7], tmp4[1]);

    tmp4[0] = _mm_xor_si128(xmm[0], xmm[5]);
    tmp[1] = _mm_xor_si128(tmp[1], tmp4[0]);
    tmp[2] = _mm_xor_si128(tmp[2], tmp4[0]);

    tmp4[1] = _mm_xor_si128(xmm[1], xmm[6]);
    tmp[2] = _mm_xor_si128(tmp[2], tmp4[1]);
    tmp[3] = _mm_xor_si128(tmp[3], tmp4[1]);

    tmp4[0] = _mm_xor_si128(xmm[2], xmm[7]);
    tmp[3] = _mm_xor_si128(tmp[3], tmp4[0]);
    tmp[4] = _mm_xor_si128(tmp[4], tmp4[0]);

    tmp4[1] = _mm_xor_si128(xmm[0], xmm[3]);
    tmp[4] = _mm_xor_si128(tmp[4], tmp4[1]);
    tmp[5] = _mm_xor_si128(tmp[5], tmp4[1]);

    tmp4[0] = _mm_xor_si128(xmm[1], xmm[4]);
    tmp[5] = _mm_xor_si128(tmp[5], tmp4[0]);
    tmp[6] = _mm_xor_si128(tmp[6], tmp4[0]);

    tmp4[1] = _mm_xor_si128(xmm[2], xmm[5]);
    tmp[6] = _mm_xor_si128(tmp[6], tmp4[1]);
    tmp[7] = _mm_xor_si128(tmp[7], tmp4[1]);

    for(i = 0; i < 8; i++)
      xmm[i] = tmp[i];
    /**/
  }

  //printStateBig(xmm);
  /* undo load transpose */
  tmp[0] = _mm_unpackhi_epi64(xmm[0], xmm[1]);
  xmm[0] = _mm_unpacklo_epi64(xmm[0], xmm[1]);
  tmp[1] = _mm_unpackhi_epi64(xmm[2], xmm[3]);
  xmm[1] = _mm_unpacklo_epi64(xmm[2], xmm[3]);
  tmp[2] = _mm_unpackhi_epi64(xmm[4], xmm[5]);
  xmm[2] = _mm_unpacklo_epi64(xmm[4], xmm[5]);
  xmm[4] = tmp[0];
  xmm[5] = tmp[1];
  xmm[3] = _mm_unpacklo_epi64(xmm[6], xmm[7]);
  xmm[7] = _mm_unpackhi_epi64(xmm[6], xmm[7]);
  xmm[6] = tmp[2];

  for(i = 0; i < 8; i++)
    xmm[i] = _mm_shuffle_epi8(xmm[i], transpMaskA);
  tmp[0] = _mm_unpackhi_epi16(xmm[0], xmm[1]);
  xmm[0] = _mm_unpacklo_epi16(xmm[0], xmm[1]);
  xmm[1] = tmp[0];
  tmp[1] = _mm_unpackhi_epi16(xmm[2], xmm[3]);
  xmm[2] = _mm_unpacklo_epi16(xmm[2], xmm[3]);
  xmm[3] = tmp[1];
  tmp[2] = _mm_unpackhi_epi16(xmm[4], xmm[5]);
  xmm[4] = _mm_unpacklo_epi16(xmm[4], xmm[5]);
  xmm[5] = tmp[2];
  tmp[3] = _mm_unpackhi_epi16(xmm[6], xmm[7]);
  xmm[6] = _mm_unpacklo_epi16(xmm[6], xmm[7]);
  xmm[7] = tmp[3];

  for(i = 0; i < 8; i++)
    xmm[i] = _mm_shuffle_epi8(xmm[i], transpMaskB);
  tmp[0] = _mm_unpackhi_epi32(xmm[0], xmm[2]);
  xmm[0] = _mm_unpacklo_epi32(xmm[0], xmm[2]);
  xmm[2] = tmp[0];
  tmp[1] = _mm_unpackhi_epi32(xmm[1], xmm[3]);
  xmm[1] = _mm_unpacklo_epi32(xmm[1], xmm[3]);
  xmm[3] = tmp[1];
  tmp[2] = _mm_unpackhi_epi32(xmm[4], xmm[6]);
  xmm[4] = _mm_unpacklo_epi32(xmm[4], xmm[6]);
  xmm[6] = tmp[2];
  tmp[3] = _mm_unpackhi_epi32(xmm[5], xmm[7]);
  xmm[5] = _mm_unpacklo_epi32(xmm[5], xmm[7]);
  xmm[7] = tmp[3];

  /* finalize */
  for(i = 0; i < 8; i++)
  {
    xmm[8+i] = _mm_set_epi32(h[2*i+1] >> 32, h[2*i+1], h[2*i+0] >> 32, h[2*i+0]);
    xmm[i] = _mm_xor_si128(xmm[i], xmm[8+i]);

    u64* ptr = (u64*) &xmm[i];

    h[2*i+0] = ptr[0];
    h[2*i+1] = ptr[1];
  }

}//OF1024AES()
