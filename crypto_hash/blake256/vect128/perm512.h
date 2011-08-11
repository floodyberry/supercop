#define PERM(i) XCAT(PERM_512_,i)

#define PERM_512_0  do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleavel(mm0, mm1);               \
    m1 = v64_interleavel(mm2, mm3);               \
    m2 = v64_interleaveh(mm0, mm1);               \
    m3 = v64_interleaveh(mm2, mm3);               \
    m4 = v64_interleavel(mm4, mm5);               \
    m5 = v64_interleavel(mm6, mm7);               \
    m6 = v64_interleaveh(mm4, mm5);               \
    m7 = v64_interleaveh(mm6, mm7);               \
  } while(0)

#define PERM_512_1  do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleavel(v64_swp(mm5), mm1);      \
    m1 = v64_interleavel(mm6, mm7);               \
    m2 = v64_swp(mm4);                            \
    m3 = v64_interleaveh(mm7, mm1);               \
    m4 = v64_interleavel(mm2, mm0);               \
    m5 = v64_interleavel(v64_swp(mm6), mm3);      \
    m6 = v64_interleaveh(v64_swp(mm5), mm0);      \
    m7 = v64_interleaveh(mm3, mm2);               \
  } while(0)

#define PERM_512_2  do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleavel(mm5, mm6);               \
    m1 = v64_interleavel(v64_swp(mm5), mm3);      \
    m2 = v64_interleaveh(mm2, mm4);               \
    m3 = v64_interleaveh(mm6, mm1);               \
    m4 = v64_interleaveh(v64_swp(mm2), mm7);      \
    m5 = v64_interleavel(mm7, mm1);               \
    m6 = v64_interleaveh(v64_swp(mm0), mm3);      \
    m7 = v64_interleaveh(v64_swp(mm4), mm0);      \
  } while(0)

#define PERM_512_3  do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleaveh(v64_swp(mm5), mm4);      \
    m1 = v64_interleavel(v64_swp(mm3), mm0);      \
    m2 = v64_interleavel(v64_swp(mm5), mm7);      \
    m3 = v64_interleavel(v64_swp(mm0), mm6);      \
    m4 = v64_interleavel(mm3, mm1);               \
    m5 = v64_interleaveh(mm7, mm1);               \
    m6 = v64_interleavel(v64_swp(mm6), mm4);      \
    m7 = v64_swp(mm2);                            \
  } while(0)

#define PERM_512_4  do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleaveh(v64_swp(mm2), mm4);      \
    m1 = v64_interleaveh(v64_swp(mm4), mm6);      \
    m2 = v64_interleavel(mm7, mm0);               \
    m3 = mm5;                                     \
    m4 = v64_interleaveh(mm3, mm1);               \
    m5 = v64_interleaveh(v64_swp(mm6), mm0);      \
    m6 = v64_interleavel(v64_swp(mm2), mm3);      \
    m7 = v64_interleavel(v64_swp(mm7), mm1);      \
  } while(0)

#define PERM_512_5  do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleavel(mm1, mm5);               \
    m1 = v64_interleavel(mm2, mm7);               \
    m2 = v64_interleaveh(mm6, mm1);               \
    m3 = v64_interleaveh(mm4, mm5);               \
    m4 = v64_interleaveh(v64_swp(mm3), mm2);      \
    m5 = v64_interleavel(v64_swp(mm3), mm6);      \
    m6 = v64_interleaveh(mm7, mm0);               \
    m7 = v64_interleavel(mm4, mm0);               \
  } while(0)

#define PERM_512_6  do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleaveh(v64_swp(mm2), mm5);      \
    m1 = v64_interleavel(mm7, mm4);               \
    m2 = v64_interleavel(v64_swp(mm6), mm5);      \
    m3 = v64_interleaveh(v64_swp(mm6), mm2);      \
    m4 = v64_interleaveh(v64_swp(mm1), mm0);      \
    m5 = v64_interleaveh(mm7, mm1);               \
    m6 = v64_interleaveh(mm4, mm3);               \
    m7 = v64_interleavel(mm0, mm3);               \
  } while(0)

#define PERM_512_7  do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleavel(mm3, mm6);               \
    m1 = v64_interleaveh(v64_swp(mm0), mm6);      \
    m2 = v64_interleavel(v64_swp(mm7), mm1);      \
    m3 = v64_interleavel(v64_swp(mm0), mm5);      \
    m4 = mm2;                                     \
    m5 = v64_interleavel(v64_swp(mm5), mm7);      \
    m6 = v64_interleaveh(v64_swp(mm4), mm1);      \
    m7 = v64_interleaveh(mm4, mm3);               \
  } while(0)

#define PERM_512_8  do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleaveh(v64_swp(mm7), mm2);      \
    m1 = v64_interleavel(mm2, mm6);               \
    m2 = v64_interleaveh(mm4, mm3);               \
    m3 = v64_interleavel(v64_swp(mm1), mm5);      \
    m4 = v64_interleavel(mm1, mm0);               \
    m5 = v64_interleaveh(v64_swp(mm3), mm7);      \
    m6 = v64_interleaveh(mm5, mm0);               \
    m7 = v64_interleavel(v64_swp(mm6), mm4);      \
  } while(0)

#define PERM_512_9  do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleaveh(mm5, mm3);               \
    m1 = v64_interleavel(v64_swp(mm6), mm5);      \
    m2 = v64_interleavel(mm6, mm7);               \
    m3 = v64_interleaveh(v64_swp(mm0), mm7);      \
    m4 = mm2;                                     \
    m5 = v64_interleaveh(v64_swp(mm3), mm4);      \
    m6 = v64_interleaveh(v64_swp(mm1), mm0);      \
    m7 = v64_interleaveh(v64_swp(mm4), mm1);      \
  } while(0)

#define PERM_512_10 do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleavel(v64_swp(mm7), mm2);      \
    m1 = v64_interleavel(v64_swp(mm2), mm3);      \
    m2 = v64_interleavel(v64_swp(mm1), mm5);      \
    m3 = v64_interleavel(v64_swp(mm3), mm1);      \
    m4 = v64_swp(mm0);                            \
    m5 = v64_interleaveh(v64_swp(mm7), mm6);      \
    m6 = v64_interleavel(v64_swp(mm4), mm6);      \
    m7 = v64_interleavel(v64_swp(mm5), mm4);      \
  } while(0)

#define PERM_512_11 do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleavel(v64_swp(mm5), mm1);      \
    m1 = v64_interleavel(mm6, mm7);               \
    m2 = v64_swp(mm4);                            \
    m3 = v64_interleaveh(mm7, mm1);               \
    m4 = v64_interleavel(mm2, mm0);               \
    m5 = v64_interleavel(v64_swp(mm6), mm3);      \
    m6 = v64_interleaveh(v64_swp(mm5), mm0);      \
    m7 = v64_interleaveh(mm3, mm2);               \
  } while(0)

#define PERM_512_12 do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleavel(mm5, mm6);               \
    m1 = v64_interleavel(v64_swp(mm5), mm3);      \
    m2 = v64_interleaveh(mm2, mm4);               \
    m3 = v64_interleaveh(mm6, mm1);               \
    m4 = v64_interleaveh(v64_swp(mm2), mm7);      \
    m5 = v64_interleavel(mm7, mm1);               \
    m6 = v64_interleaveh(v64_swp(mm0), mm3);      \
    m7 = v64_interleaveh(v64_swp(mm4), mm0);      \
  } while(0)

#define PERM_512_13 do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleaveh(v64_swp(mm5), mm4);      \
    m1 = v64_interleavel(v64_swp(mm3), mm0);      \
    m2 = v64_interleavel(v64_swp(mm5), mm7);      \
    m3 = v64_interleavel(v64_swp(mm0), mm6);      \
    m4 = v64_interleavel(mm3, mm1);               \
    m5 = v64_interleaveh(mm7, mm1);               \
    m6 = v64_interleavel(v64_swp(mm6), mm4);      \
    m7 = v64_swp(mm2);                            \
  } while(0)

#define PERM_512_14 do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleaveh(v64_swp(mm2), mm4);      \
    m1 = v64_interleaveh(v64_swp(mm4), mm6);      \
    m2 = v64_interleavel(mm7, mm0);               \
    m3 = mm5;                                     \
    m4 = v64_interleaveh(mm3, mm1);               \
    m5 = v64_interleaveh(v64_swp(mm6), mm0);      \
    m6 = v64_interleavel(v64_swp(mm2), mm3);      \
    m7 = v64_interleavel(v64_swp(mm7), mm1);      \
  } while(0)

#define PERM_512_15 do { \
    v64 mm0 = m0, mm1 = m1, mm2 = m2, mm3 = m3;   \
    v64 mm4 = m4, mm5 = m5, mm6 = m6, mm7 = m7;   \
    m0 = v64_interleavel(mm1, mm5);               \
    m1 = v64_interleavel(mm2, mm7);               \
    m2 = v64_interleaveh(mm6, mm1);               \
    m3 = v64_interleaveh(mm4, mm5);               \
    m4 = v64_interleaveh(v64_swp(mm3), mm2);      \
    m5 = v64_interleavel(v64_swp(mm3), mm6);      \
    m6 = v64_interleaveh(mm7, mm0);               \
    m7 = v64_interleavel(mm4, mm0);               \
  } while(0)

