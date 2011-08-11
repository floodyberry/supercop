#define PERM(i) XCAT(PERM_512_INPLACE_,i)

#define PERM_512_INPLACE_0  do { \
    m0 = v64_interleavel(mm0, mm1);               \
    m1 = v64_interleavel(mm2, mm3);               \
    m2 = v64_interleaveh(mm0, mm1);               \
    m3 = v64_interleaveh(mm2, mm3);               \
    m4 = v64_interleavel(mm4, mm5);               \
    m5 = v64_interleavel(mm6, mm7);               \
    m6 = v64_interleaveh(mm4, mm5);               \
    m7 = v64_interleaveh(mm6, mm7);               \
  } while(0)

#define PERM_512_INPLACE_1  do { \
    m0 = v64_interleavel(mm7, mm2);               \
    m1 = v64_interleaveh(mm4, mm6);               \
    m2 = v64_interleavel(mm5, mm4);               \
    m3 = v64_interleavel(v64_swp(mm7), mm3);      \
    m4 = v64_swp(mm0);                            \
    m5 = v64_interleaveh(mm5, mm2);               \
    m6 = v64_interleavel(mm6, mm1);               \
    m7 = v64_interleaveh(mm3, mm1);               \
  } while(0)

#define PERM_512_INPLACE_2  do { \
    m0 = v64_interleavel(v64_swp(mm5), mm6);      \
    m1 = v64_interleaveh(mm2, mm7);               \
    m2 = v64_interleavel(mm4, mm0);               \
    m3 = v64_interleaveh(v64_swp(mm1), mm6);      \
    m4 = v64_interleaveh(v64_swp(mm5), mm1);      \
    m5 = v64_interleaveh(mm3, mm4);               \
    m6 = v64_interleavel(mm7, mm3);               \
    m7 = v64_interleavel(v64_swp(mm0), mm2);      \
  } while(0)

#define PERM_512_INPLACE_3  do { \
    m0 = v64_interleaveh(mm3, mm1);               \
    m1 = v64_interleaveh(mm6, mm5);               \
    m2 = v64_interleaveh(mm4, mm0);               \
    m3 = v64_interleavel(mm6, mm7);               \
    m4 = v64_interleaveh(v64_swp(mm1), mm2);      \
    m5 = v64_interleaveh(v64_swp(mm2), mm7);      \
    m6 = v64_interleavel(mm3, mm5);               \
    m7 = v64_interleavel(mm0, mm4);               \
  } while(0)

#define PERM_512_INPLACE_4  do { \
    m0 = v64_interleaveh(mm4, mm2);               \
    m1 = v64_interleavel(mm1, mm5);               \
    m2 = v64_interleaveh(v64_swp(mm0), mm3);      \
    m3 = v64_interleaveh(v64_swp(mm2), mm7);      \
    m4 = v64_interleaveh(v64_swp(mm7), mm5);      \
    m5 = v64_interleaveh(v64_swp(mm3), mm1);      \
    m6 = v64_interleavel(v64_swp(mm0), mm6);      \
    m7 = v64_interleaveh(v64_swp(mm4), mm6);      \
  } while(0)

#define PERM_512_INPLACE_5  do { \
    m0 = v64_interleavel(mm1, mm3);               \
    m1 = v64_interleavel(mm0, mm4);               \
    m2 = v64_interleavel(mm6, mm5);               \
    m3 = v64_interleaveh(mm5, mm1);               \
    m4 = v64_interleaveh(v64_swp(mm2), mm3);      \
    m5 = v64_interleaveh(mm7, mm0);               \
    m6 = v64_interleaveh(mm6, mm2);               \
    m7 = v64_interleaveh(v64_swp(mm7), mm4);      \
  } while(0)

#define PERM_512_INPLACE_6  do { \
    m0 = v64_interleaveh(v64_swp(mm6), mm0);      \
    m1 = v64_interleavel(mm7, mm2);               \
    m2 = v64_interleaveh(mm2, mm7);               \
    m3 = v64_interleavel(v64_swp(mm6), mm5);      \
    m4 = v64_interleavel(mm0, mm3);               \
    m5 = v64_swp(mm4);                            \
    m6 = v64_interleaveh(mm3, mm1);               \
    m7 = v64_interleaveh(v64_swp(mm1), mm5);      \
  } while(0)

#define PERM_512_INPLACE_7  do { \
    m0 = v64_interleaveh(mm6, mm3);               \
    m1 = v64_interleaveh(v64_swp(mm6), mm1);      \
    m2 = v64_interleavel(v64_swp(mm5), mm7);      \
    m3 = v64_interleaveh(mm0, mm4);               \
    m4 = v64_interleaveh(mm2, mm7);               \
    m5 = v64_interleavel(mm4, mm1);               \
    m6 = v64_interleavel(mm0, mm2);               \
    m7 = v64_interleavel(mm3, mm5);               \
  } while(0)

#define PERM_512_INPLACE_8  do { \
    m0 = v64_interleavel(mm3, mm7);               \
    m1 = v64_interleavel(v64_swp(mm5), mm0);      \
    m2 = v64_interleaveh(mm7, mm4);               \
    m3 = v64_interleavel(v64_swp(mm1), mm4);      \
    m4 = mm6;                                     \
    m5 = v64_interleavel(v64_swp(mm0), mm5);      \
    m6 = v64_interleaveh(v64_swp(mm1), mm3);      \
    m7 = mm2;                                     \
  } while(0)

#define PERM_512_INPLACE_9  do { \
    m0 = v64_interleavel(mm5, mm4);               \
    m1 = v64_interleaveh(mm3, mm0);               \
    m2 = v64_interleavel(mm1, mm2);               \
    m3 = v64_interleaveh(v64_swp(mm3), mm2);      \
    m4 = v64_interleaveh(mm7, mm4);               \
    m5 = v64_interleaveh(mm1, mm6);               \
    m6 = v64_interleavel(v64_swp(mm5), mm7);      \
    m7 = v64_interleavel(mm6, mm0);               \
  } while(0)

#define PERM_512_INPLACE_10 do { \
    m0 = v64_interleavel(mm0, mm1);               \
    m1 = v64_interleavel(mm2, mm3);               \
    m2 = v64_interleaveh(mm0, mm1);               \
    m3 = v64_interleaveh(mm2, mm3);               \
    m4 = v64_interleavel(mm4, mm5);               \
    m5 = v64_interleavel(mm6, mm7);               \
    m6 = v64_interleaveh(mm4, mm5);               \
    m7 = v64_interleaveh(mm6, mm7);               \
  } while(0)

#define PERM_512_INPLACE_11 do { \
    m0 = v64_interleavel(mm7, mm2);               \
    m1 = v64_interleaveh(mm4, mm6);               \
    m2 = v64_interleavel(mm5, mm4);               \
    m3 = v64_interleavel(v64_swp(mm7), mm3);      \
    m4 = v64_swp(mm0);                            \
    m5 = v64_interleaveh(mm5, mm2);               \
    m6 = v64_interleavel(mm6, mm1);               \
    m7 = v64_interleaveh(mm3, mm1);               \
  } while(0)

#define PERM_512_INPLACE_12 do { \
    m0 = v64_interleavel(v64_swp(mm5), mm6);      \
    m1 = v64_interleaveh(mm2, mm7);               \
    m2 = v64_interleavel(mm4, mm0);               \
    m3 = v64_interleaveh(v64_swp(mm1), mm6);      \
    m4 = v64_interleaveh(v64_swp(mm5), mm1);      \
    m5 = v64_interleaveh(mm3, mm4);               \
    m6 = v64_interleavel(mm7, mm3);               \
    m7 = v64_interleavel(v64_swp(mm0), mm2);      \
  } while(0)

#define PERM_512_INPLACE_13 do { \
    m0 = v64_interleaveh(mm3, mm1);               \
    m1 = v64_interleaveh(mm6, mm5);               \
    m2 = v64_interleaveh(mm4, mm0);               \
    m3 = v64_interleavel(mm6, mm7);               \
    m4 = v64_interleaveh(v64_swp(mm1), mm2);      \
    m5 = v64_interleaveh(v64_swp(mm2), mm7);      \
    m6 = v64_interleavel(mm3, mm5);               \
    m7 = v64_interleavel(mm0, mm4);               \
  } while(0)

#define PERM_512_INPLACE_14 do { \
    m0 = v64_interleaveh(mm4, mm2);               \
    m1 = v64_interleavel(mm1, mm5);               \
    m2 = v64_interleaveh(v64_swp(mm0), mm3);      \
    m3 = v64_interleaveh(v64_swp(mm2), mm7);      \
    m4 = v64_interleaveh(v64_swp(mm7), mm5);      \
    m5 = v64_interleaveh(v64_swp(mm3), mm1);      \
    m6 = v64_interleavel(v64_swp(mm0), mm6);      \
    m7 = v64_interleaveh(v64_swp(mm4), mm6);      \
  } while(0)

#define PERM_512_INPLACE_15 do { \
    m0 = v64_interleavel(mm1, mm3);               \
    m1 = v64_interleavel(mm0, mm4);               \
    m2 = v64_interleavel(mm6, mm5);               \
    m3 = v64_interleaveh(mm5, mm1);               \
    m4 = v64_interleaveh(v64_swp(mm2), mm3);      \
    m5 = v64_interleaveh(mm7, mm0);               \
    m6 = v64_interleaveh(mm6, mm2);               \
    m7 = v64_interleaveh(v64_swp(mm7), mm4);      \
  } while(0)

