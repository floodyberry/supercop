#define PERM(i) XCAT(PERM_256_,i)

#define PERM_256_0  do { \
    m0 = v32_interleavel(v32_interleavel(MX(0 ),MX(4 )),  \
                         v32_interleavel(MX(2 ),MX(6 ))); \
    m1 = v32_interleavel(v32_interleavel(MX(1 ),MX(5 )),  \
                         v32_interleavel(MX(3 ),MX(7 ))); \
    m2 = v32_interleavel(v32_interleavel(MX(8 ),MX(12)),  \
                         v32_interleavel(MX(10),MX(14))); \
    m3 = v32_interleavel(v32_interleavel(MX(9 ),MX(13)),  \
                         v32_interleavel(MX(11),MX(15))); \
  } while(0)

#define PERM_256_1  do { \
    m0 = v32_interleavel(v32_interleavel(MX(14),MX(9 )),  \
                         v32_interleavel(MX(4 ),MX(13))); \
    m1 = v32_interleavel(v32_interleavel(MX(10),MX(15)),  \
                         v32_interleavel(MX(8 ),MX(6 ))); \
    m2 = v32_interleavel(v32_interleavel(MX(1 ),MX(11)),  \
                         v32_interleavel(MX(0 ),MX(5 ))); \
    m3 = v32_interleavel(v32_interleavel(MX(12),MX(7 )),  \
                         v32_interleavel(MX(2 ),MX(3 ))); \
  } while(0)

#define PERM_256_2  do { \
    m0 = v32_interleavel(v32_interleavel(MX(11),MX(5 )),  \
                         v32_interleavel(MX(12),MX(15))); \
    m1 = v32_interleavel(v32_interleavel(MX(8 ),MX(2 )),  \
                         v32_interleavel(MX(0 ),MX(13))); \
    m2 = v32_interleavel(v32_interleavel(MX(10),MX(7 )),  \
                         v32_interleavel(MX(3 ),MX(9 ))); \
    m3 = v32_interleavel(v32_interleavel(MX(14),MX(1 )),  \
                         v32_interleavel(MX(6 ),MX(4 ))); \
  } while(0)

#define PERM_256_3  do { \
    m0 = v32_interleavel(v32_interleavel(MX(7 ),MX(13)),  \
                         v32_interleavel(MX(3 ),MX(11))); \
    m1 = v32_interleavel(v32_interleavel(MX(9 ),MX(12)),  \
                         v32_interleavel(MX(1 ),MX(14))); \
    m2 = v32_interleavel(v32_interleavel(MX(2 ),MX(4 )),  \
                         v32_interleavel(MX(5 ),MX(15))); \
    m3 = v32_interleavel(v32_interleavel(MX(6 ),MX(0 )),  \
                         v32_interleavel(MX(10),MX(8 ))); \
  } while(0)

#define PERM_256_4  do { \
    m0 = v32_interleavel(v32_interleavel(MX(9 ),MX(2 )),  \
                         v32_interleavel(MX(5 ),MX(10))); \
    m1 = v32_interleavel(v32_interleavel(MX(0 ),MX(4 )),  \
                         v32_interleavel(MX(7 ),MX(15))); \
    m2 = v32_interleavel(v32_interleavel(MX(14),MX(6 )),  \
                         v32_interleavel(MX(11),MX(3 ))); \
    m3 = v32_interleavel(v32_interleavel(MX(1 ),MX(8 )),  \
                         v32_interleavel(MX(12),MX(13))); \
  } while(0)

#define PERM_256_5  do { \
    m0 = v32_interleavel(v32_interleavel(MX(2 ),MX(0 )),  \
                         v32_interleavel(MX(6 ),MX(8 ))); \
    m1 = v32_interleavel(v32_interleavel(MX(12),MX(11)),  \
                         v32_interleavel(MX(10),MX(3 ))); \
    m2 = v32_interleavel(v32_interleavel(MX(4 ),MX(15)),  \
                         v32_interleavel(MX(7 ),MX(1 ))); \
    m3 = v32_interleavel(v32_interleavel(MX(13),MX(14)),  \
                         v32_interleavel(MX(5 ),MX(9 ))); \
  } while(0)

#define PERM_256_6  do { \
    m0 = v32_interleavel(v32_interleavel(MX(12),MX(14)),  \
                         v32_interleavel(MX(1 ),MX(4 ))); \
    m1 = v32_interleavel(v32_interleavel(MX(5 ),MX(13)),  \
                         v32_interleavel(MX(15),MX(10))); \
    m2 = v32_interleavel(v32_interleavel(MX(0 ),MX(9 )),  \
                         v32_interleavel(MX(6 ),MX(8 ))); \
    m3 = v32_interleavel(v32_interleavel(MX(7 ),MX(2 )),  \
                         v32_interleavel(MX(3 ),MX(11))); \
  } while(0)

#define PERM_256_7  do { \
    m0 = v32_interleavel(v32_interleavel(MX(13),MX(12)),  \
                         v32_interleavel(MX(7 ),MX(3 ))); \
    m1 = v32_interleavel(v32_interleavel(MX(11),MX(1 )),  \
                         v32_interleavel(MX(14),MX(9 ))); \
    m2 = v32_interleavel(v32_interleavel(MX(5 ),MX(8 )),  \
                         v32_interleavel(MX(15),MX(2 ))); \
    m3 = v32_interleavel(v32_interleavel(MX(0 ),MX(6 )),  \
                         v32_interleavel(MX(4 ),MX(10))); \
  } while(0)

#define PERM_256_8  do { \
    m0 = v32_interleavel(v32_interleavel(MX(6 ),MX(11)),  \
                         v32_interleavel(MX(14),MX(0 ))); \
    m1 = v32_interleavel(v32_interleavel(MX(15),MX(3 )),  \
                         v32_interleavel(MX(9 ),MX(8 ))); \
    m2 = v32_interleavel(v32_interleavel(MX(12),MX(1 )),  \
                         v32_interleavel(MX(13),MX(10))); \
    m3 = v32_interleavel(v32_interleavel(MX(2 ),MX(4 )),  \
                         v32_interleavel(MX(7 ),MX(5 ))); \
  } while(0)

#define PERM_256_9  do { \
    m0 = v32_interleavel(v32_interleavel(MX(10),MX(7 )),  \
                         v32_interleavel(MX(8 ),MX(1 ))); \
    m1 = v32_interleavel(v32_interleavel(MX(2 ),MX(6 )),  \
                         v32_interleavel(MX(4 ),MX(5 ))); \
    m2 = v32_interleavel(v32_interleavel(MX(15),MX(3 )),  \
                         v32_interleavel(MX(9 ),MX(13))); \
    m3 = v32_interleavel(v32_interleavel(MX(11),MX(12)),  \
                         v32_interleavel(MX(14),MX(0 ))); \
  } while(0)

#define PERM_256_10 do { \
    m0 = v32_interleavel(v32_interleavel(MX(0 ),MX(4 )),  \
                         v32_interleavel(MX(2 ),MX(6 ))); \
    m1 = v32_interleavel(v32_interleavel(MX(1 ),MX(5 )),  \
                         v32_interleavel(MX(3 ),MX(7 ))); \
    m2 = v32_interleavel(v32_interleavel(MX(8 ),MX(12)),  \
                         v32_interleavel(MX(10),MX(14))); \
    m3 = v32_interleavel(v32_interleavel(MX(9 ),MX(13)),  \
                         v32_interleavel(MX(11),MX(15))); \
  } while(0)

#define PERM_256_11 do { \
    m0 = v32_interleavel(v32_interleavel(MX(14),MX(9 )),  \
                         v32_interleavel(MX(4 ),MX(13))); \
    m1 = v32_interleavel(v32_interleavel(MX(10),MX(15)),  \
                         v32_interleavel(MX(8 ),MX(6 ))); \
    m2 = v32_interleavel(v32_interleavel(MX(1 ),MX(11)),  \
                         v32_interleavel(MX(0 ),MX(5 ))); \
    m3 = v32_interleavel(v32_interleavel(MX(12),MX(7 )),  \
                         v32_interleavel(MX(2 ),MX(3 ))); \
  } while(0)

#define PERM_256_12 do { \
    m0 = v32_interleavel(v32_interleavel(MX(11),MX(5 )),  \
                         v32_interleavel(MX(12),MX(15))); \
    m1 = v32_interleavel(v32_interleavel(MX(8 ),MX(2 )),  \
                         v32_interleavel(MX(0 ),MX(13))); \
    m2 = v32_interleavel(v32_interleavel(MX(10),MX(7 )),  \
                         v32_interleavel(MX(3 ),MX(9 ))); \
    m3 = v32_interleavel(v32_interleavel(MX(14),MX(1 )),  \
                         v32_interleavel(MX(6 ),MX(4 ))); \
  } while(0)

#define PERM_256_13 do { \
    m0 = v32_interleavel(v32_interleavel(MX(7 ),MX(13)),  \
                         v32_interleavel(MX(3 ),MX(11))); \
    m1 = v32_interleavel(v32_interleavel(MX(9 ),MX(12)),  \
                         v32_interleavel(MX(1 ),MX(14))); \
    m2 = v32_interleavel(v32_interleavel(MX(2 ),MX(4 )),  \
                         v32_interleavel(MX(5 ),MX(15))); \
    m3 = v32_interleavel(v32_interleavel(MX(6 ),MX(0 )),  \
                         v32_interleavel(MX(10),MX(8 ))); \
  } while(0)

#define PERM_256_14 do { \
    m0 = v32_interleavel(v32_interleavel(MX(9 ),MX(2 )),  \
                         v32_interleavel(MX(5 ),MX(10))); \
    m1 = v32_interleavel(v32_interleavel(MX(0 ),MX(4 )),  \
                         v32_interleavel(MX(7 ),MX(15))); \
    m2 = v32_interleavel(v32_interleavel(MX(14),MX(6 )),  \
                         v32_interleavel(MX(11),MX(3 ))); \
    m3 = v32_interleavel(v32_interleavel(MX(1 ),MX(8 )),  \
                         v32_interleavel(MX(12),MX(13))); \
  } while(0)

#define PERM_256_15 do { \
    m0 = v32_interleavel(v32_interleavel(MX(2 ),MX(0 )),  \
                         v32_interleavel(MX(6 ),MX(8 ))); \
    m1 = v32_interleavel(v32_interleavel(MX(12),MX(11)),  \
                         v32_interleavel(MX(10),MX(3 ))); \
    m2 = v32_interleavel(v32_interleavel(MX(4 ),MX(15)),  \
                         v32_interleavel(MX(7 ),MX(1 ))); \
    m3 = v32_interleavel(v32_interleavel(MX(13),MX(14)),  \
                         v32_interleavel(MX(5 ),MX(9 ))); \
  } while(0)

