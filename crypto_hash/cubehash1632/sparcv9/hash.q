int64 out
int64 in
int64 inlen
int64 result

input out
input in
input inlen
output result

int64 x00
int64 x01
int64 x02
int64 x03
int64 x04
int64 x05
int64 x06
int64 x07
int64 x08
int64 x09
int64 x0a
int64 x0b
int64 x0c
int64 x0d
int64 x0e
int64 x0f
int64 x10
int64 x11
int64 x12
int64 x13
int64 x14
int64 x15
int64 x16
int64 x17
int64 x18
int64 x19
int64 x1a
int64 x1b
int64 x1c
int64 x1d
int64 x1e
int64 x1f

int64 s00
int64 s01
int64 s02
int64 s03
int64 s04
int64 s05
int64 s06
int64 s07
int64 s08
int64 s09
int64 s0a
int64 s0b
int64 s0c
int64 s0d
int64 s0e
int64 s0f

int64 y00
int64 y01
int64 y02
int64 y03
int64 y04
int64 y05
int64 y06
int64 y07

int64 in0
int64 in1
int64 in2
int64 in3
int64 in4
int64 in5
int64 in6
int64 in7
int64 in8
int64 in9
int64 in10
int64 in11
int64 in12
int64 in13
int64 in14
int64 in15
int64 in16
int64 in17
int64 in18
int64 in19
int64 in20
int64 in21
int64 in22
int64 in23
int64 in24
int64 in25
int64 in26
int64 in27
int64 in28
int64 in29
int64 in30
int64 in31

int64 r
int64 i
int64 finalization
stack256 tmp
int64 z

stack64 out_stack
stack64 in_stack
stack64 inlen_stack
stack64 finalization_stack
stack64 r_stack

stack64 x02_stack
stack64 x03_stack
stack64 x05_stack
stack64 x06_stack
stack64 x07_stack
stack64 x09_stack
stack64 x0a_stack
stack64 x0b_stack
stack64 x0c_stack
stack64 x0d_stack
stack64 x0e_stack
stack64 x0f_stack
stack64 x13_stack
stack64 x14_stack
stack64 x15_stack
stack64 x16_stack
stack64 x17_stack
stack64 x19_stack
stack64 x1b_stack
stack64 x1c_stack
stack64 x1d_stack
stack64 x1e_stack
stack64 x1f_stack

enter crypto_hash_cubehash1632_sparcv9

  out_stack = out

  x08 = 0x4d42c787 & 0xfffffc00
  x09 = 0xa647a8b3 & 0xfffffc00
  x0a = 0x97cf0bef & 0xfffffc00
  x0b = 0x825b4537 & 0xfffffc00
  x0c = 0xeef864d2 & 0xfffffc00
  x0d = 0xf22090c4 & 0xfffffc00
  x0e = 0xd0e5cd33 & 0xfffffc00
  x0f = 0xa23911ae & 0xfffffc00

  x08 |= 0x4d42c787 & 0x3ff
  x09 |= 0xa647a8b3 & 0x3ff
  x0a |= 0x97cf0bef & 0x3ff
  x0b |= 0x825b4537 & 0x3ff
  x0c |= 0xeef864d2 & 0x3ff
  x0d |= 0xf22090c4 & 0x3ff
  x0e |= 0xd0e5cd33 & 0x3ff
  x0f |= 0xa23911ae & 0x3ff

          x10 = 0xfcd398d9 & 0xfffffc00
          x11 = 0x148fe485 & 0xfffffc00
          x12 = 0x1b017bef & 0xfffffc00
          x13 = 0xb6444532 & 0xfffffc00
  x09_stack = x09
          x14 = 0x6a536159 & 0xfffffc00
          x15 = 0x2ff5781c & 0xfffffc00
  x0b_stack = x0b
          x16 = 0x91fa7934 & 0xfffffc00
          x17 = 0x0dbadea9 & 0xfffffc00
  x0c_stack = x0c
          x10 |= 0xfcd398d9 & 0x3ff
          x11 |= 0x148fe485 & 0x3ff
  x0d_stack = x0d
          x12 |= 0x1b017bef & 0x3ff
          x13 |= 0xb6444532 & 0x3ff
  x0e_stack = x0e
          x14 |= 0x6a536159 & 0x3ff
          x15 |= 0x2ff5781c & 0x3ff
  x0f_stack = x0f
          x16 |= 0x91fa7934 & 0x3ff
          x17 |= 0x0dbadea9 & 0x3ff

  x18 = 0xd65c8a2b & 0xfffffc00
  x19 = 0xa5a70e75 & 0xfffffc00
  x1a = 0xb1c62456 & 0xfffffc00
  x1b = 0xbc796576 & 0xfffffc00
  x1c = 0x1921c8f7 & 0xfffffc00
  x1d = 0xe7989af1 & 0xfffffc00
          x13_stack = x13
  x1e = 0x7795d246 & 0xfffffc00
  x1f = 0xd43e3b44 & 0xfffffc00
          x14_stack = x14
  x18 |= 0xd65c8a2b & 0x3ff
  x19 |= 0xa5a70e75 & 0x3ff
          x15_stack = x15
  x1a |= 0xb1c62456 & 0x3ff
  x1b |= 0xbc796576 & 0x3ff
          x16_stack = x16
  x1c |= 0x1921c8f7 & 0x3ff
  x1d |= 0xe7989af1 & 0x3ff
          x17_stack = x17
  x1e |= 0x7795d246 & 0x3ff
  x1f |= 0xd43e3b44 & 0x3ff

          x00 = 0x2aea2a61 & 0xfffffc00
          x01 = 0x50f494d4 & 0xfffffc00
  x19_stack = x19
          x02 = 0x2d538b8b & 0xfffffc00
          x03 = 0x4167d83e & 0xfffffc00
          x04 = 0x3fee2313 & 0xfffffc00
          x05 = 0xc701cf8c & 0xfffffc00
  x1b_stack = x1b
          x06 = 0xcc39968e & 0xfffffc00
          x07 = 0x50ac5695 & 0xfffffc00
  x1c_stack = x1c
          x00 |= 0x2aea2a61 & 0x3ff
          x01 |= 0x50f494d4 & 0x3ff
  x1d_stack = x1d
          x02 |= 0x2d538b8b & 0x3ff
          x03 |= 0x4167d83e & 0x3ff
  x1e_stack = x1e
          x04 |= 0x3fee2313 & 0x3ff
          x05 |= 0xc701cf8c & 0x3ff
  x1f_stack = x1f
          x06 |= 0xcc39968e & 0x3ff
          x07 |= 0x50ac5695 & 0x3ff

  finalization = 0

                     unsigned<? inlen - 32
goto inlenbelow32 if unsigned<

mainloop:

  inlen -= 32
  r = 16

  finalization_stack = finalization
  inlen_stack = inlen

  in0 = *(uint8 *) (in + 0)
    in1 = *(uint8 *) (in + 1)
      in2 = *(uint8 *) (in + 2)
        in3 = *(uint8 *) (in + 3)
  x00 ^= in0
          in4 = *(uint8 *) (in + 4)
    in1 <<= 8
    x00 ^= in1
            in5 = *(uint8 *) (in + 5)
      in2 <<= 16
      x00 ^= in2
              in6 = *(uint8 *) (in + 6)
        in3 <<= 24
        x00 ^= in3
                in7 = *(uint8 *) (in + 7)
          x01 ^= in4
                  in8 = *(uint8 *) (in + 8)
            in5 <<= 8
            x01 ^= in5
                    in9 = *(uint8 *) (in + 9)
              in6 <<= 16
              x01 ^= in6
                      in10 = *(uint8 *) (in + 10)
                in7 <<= 24
                x01 ^= in7
                        in11 = *(uint8 *) (in + 11)
                  x02 ^= in8
                          in12 = *(uint8 *) (in + 12)
                    in9 <<= 8
                    x02 ^= in9
                            in13 = *(uint8 *) (in + 13)
                      in10 <<= 16
                      x02 ^= in10
                              in14 = *(uint8 *) (in + 14)
                        in11 <<= 24
                        x02 ^= in11
                                in15 = *(uint8 *) (in + 15)
                          x03 ^= in12
                                  in16 = *(uint8 *) (in + 16)
                            in13 <<= 8
                            x03 ^= in13
                                    in17 = *(uint8 *) (in + 17)
                              in14 <<= 16
                              x03 ^= in14
                                      in18 = *(uint8 *) (in + 18)
                                in15 <<= 24
                                x03 ^= in15
  x03_stack = x03
                                        in19 = *(uint8 *) (in + 19)
                                  x04 ^= in16
                                          in20 = *(uint8 *) (in + 20)
                                    in17 <<= 8
                                    x04 ^= in17
                                            in21 = *(uint8 *) (in + 21)
                                      in18 <<= 16
                                      x04 ^= in18
                                              in22 = *(uint8 *) (in + 22)
                                        in19 <<= 24
                                        x04 ^= in19
                                                in23 = *(uint8 *) (in + 23)
                                          x05 ^= in20
                                                  in24 = *(uint8 *) (in + 24)
                                            in21 <<= 8
                                            x05 ^= in21
                                                    in25 = *(uint8 *) (in + 25)
                                              in22 <<= 16
                                              x05 ^= in22
                                                      in26 = *(uint8 *) (in + 26)
                                                in23 <<= 24
                                                x05 ^= in23
  x05_stack = x05
                                                        in27 = *(uint8 *) (in + 27)
                                                  x06 ^= in24
                                                          in28 = *(uint8 *) (in + 28)
                                                    in25 <<= 8
                                                    x06 ^= in25
                                                            in29 = *(uint8 *) (in + 29)
                                                      in26 <<= 16
                                                      x06 ^= in26
                                                              in30 = *(uint8 *) (in + 30)
                                                        in27 <<= 24
                                                        x06 ^= in27
  x06_stack = x06
                                                                in31 = *(uint8 *) (in + 31)
                                                          x07 ^= in28
                                                            in29 <<= 8
                                                            x07 ^= in29
                                                              in30 <<= 16
                                                              x07 ^= in30
                                                                in31 <<= 24
                                                                x07 ^= in31

  x07_stack = x07

  in += 32
  in_stack = in


morerounds:

r_stack = r

  x10 += x00
  x12 += x02
  x18 += x08
  x1a += x0a
  s00 = x00 << 7
  s02 = x02 << 7
  (uint32) x00 >>= 25
  (uint32) x02 >>= 25
  x00 |= s00
  x02 |= s02
  s08 = x08 << 7
  s0a = x0a << 7
    x06 = x06_stack
  (uint32) x08 >>= 25
  (uint32) x0a >>= 25
    x0c = x0c_stack
  x08 |= s08
  x0a |= s0a
    x0e = x0e_stack
  x00 ^= x18
  x02 ^= x1a
    x14 = x14_stack
  x08 ^= x10
  x0a ^= x12
    x16 = x16_stack
  x1a += x00
  x18 += x02
    x1c = x1c_stack
  x12 += x08
  x10 += x0a
    x1e = x1e_stack
    x14 += x04
    x16 += x06
  x02_stack = x02
    x1c += x0c
    x1e += x0e
  x0a_stack = x0a
    s04 = x04 << 7
    s06 = x06 << 7
    (uint32) x04 >>= 25
    (uint32) x06 >>= 25
    x04 |= s04
    x06 |= s06
    s0c = x0c << 7
    s0e = x0e << 7
    (uint32) x0c >>= 25
    (uint32) x0e >>= 25
  x03 = x03_stack
    x0c |= s0c
    x0e |= s0e
  x09 = x09_stack
    x04 ^= x1c
    x06 ^= x1e
  x0b = x0b_stack
    x0c ^= x14
    x0e ^= x16
  x13 = x13_stack
    x1e += x04
    x1c += x06
  x19 = x19_stack
    x16 += x0c
    x14 += x0e
  x1b = x1b_stack

    x06_stack = x06
    x0c_stack = x0c
    x0e_stack = x0e
  x11 += x01
  x13 += x03
    x14_stack = x14
  x19 += x09
  x1b += x0b
    x16_stack = x16
  s01 = x01 << 7
  s03 = x03 << 7
    x1c_stack = x1c
  (uint32) x01 >>= 25
  (uint32) x03 >>= 25
    x1e_stack = x1e
  x01 |= s01
  x03 |= s03
    x05 = x05_stack
  s09 = x09 << 7
  s0b = x0b << 7
    x07 = x07_stack
  (uint32) x09 >>= 25
  (uint32) x0b >>= 25
    x0d = x0d_stack
  x09 |= s09
  x0b |= s0b
    x0f = x0f_stack
  x01 ^= x19
  x03 ^= x1b
    x15 = x15_stack
  x09 ^= x11
  x0b ^= x13
    x17 = x17_stack
  x1b += x01
  x19 += x03
    x1d = x1d_stack
  x13 += x09
  x11 += x0b
    x1f = x1f_stack
    x15 += x05
    x17 += x07
  x03_stack = x03
    x1d += x0d
    x1f += x0f
  x09_stack = x09
    s05 = x05 << 7
    s07 = x07 << 7
  x0b_stack = x0b
    (uint32) x05 >>= 25
    (uint32) x07 >>= 25
  x13_stack = x13
    x05 |= s05
    x07 |= s07
  x19_stack = x19
    s0d = x0d << 7
    s0f = x0f << 7
  x1b_stack = x1b
    (uint32) x0d >>= 25
    (uint32) x0f >>= 25
    x0d |= s0d
    x0f |= s0f
    x05 ^= x1d
    x07 ^= x1f
  x1e = x1e_stack
    x0d ^= x15
    x0f ^= x17
  x16 = x16_stack
    x1f += x05
    x1d += x07
  x09 = x09_stack
    x17 += x0d
    x15 += x0f
    x05_stack = x05
  s00 = x00 << 11
  s01 = x01 << 11
    x07_stack = x07
  (uint32) x00 >>= 21
  (uint32) x01 >>= 21
    x0d_stack = x0d
  x00 |= s00
  x01 |= s01
    x0f_stack = x0f
  s08 = x08 << 11
  s09 = x09 << 11
    x15_stack = x15
  (uint32) x08 >>= 21
  (uint32) x09 >>= 21
    x1d_stack = x1d
  x08 |= s08
  x09 |= s09
  x00 ^= x1e
  x01 ^= x1f
  x08 ^= x16
  x09 ^= x17
  x1f += x00
  x1e += x01
  x17 += x08
  x16 += x09
  s00 = x00 << 7
  s01 = x01 << 7
    x02 = x02_stack
  (uint32) x00 >>= 25
  (uint32) x01 >>= 25
    x03 = x03_stack
  x00 |= s00
  x01 |= s01
    x0a = x0a_stack
  s08 = x08 << 7
  s09 = x09 << 7
    x0b = x0b_stack
  (uint32) x08 >>= 25
  (uint32) x09 >>= 25
    x1c = x1c_stack
  x08 |= s08
  x09 |= s09
    x1d = x1d_stack
  x00 ^= x17
  x01 ^= x16
    x14 = x14_stack
  x08 ^= x1f
  x09 ^= x1e
    x15 = x15_stack
    s02 = x02 << 11
    s03 = x03 << 11
  x09_stack = x09
    (uint32) x02 >>= 21
    (uint32) x03 >>= 21
  x1e_stack = x1e
    x02 |= s02
    x03 |= s03
  x1f_stack = x1f
    s0a = x0a << 11
    s0b = x0b << 11
  x16_stack = x16
    (uint32) x0a >>= 21
    (uint32) x0b >>= 21
  x17_stack = x17
    x0a |= s0a
    x0b |= s0b
    x02 ^= x1c
    x03 ^= x1d
    x0a ^= x14
    x0b ^= x15
    x1d += x02
    x1c += x03
    x15 += x0a
    x14 += x0b
    s02 = x02 << 7
    s03 = x03 << 7
    (uint32) x02 >>= 25
    (uint32) x03 >>= 25
    x02 |= s02
    x03 |= s03
    s0a = x0a << 7
    s0b = x0b << 7
  x05 = x05_stack
    (uint32) x0a >>= 25
    (uint32) x0b >>= 25
  x0c = x0c_stack
    x0a |= s0a
    x0b |= s0b
  x0d = x0d_stack
    x02 ^= x15
    x03 ^= x14
  x1b = x1b_stack
    x0a ^= x1d
    x0b ^= x1c
  x13 = x13_stack
  s04 = x04 << 11
  s05 = x05 << 11
    x02_stack = x02
  (uint32) x04 >>= 21
  (uint32) x05 >>= 21
    x03_stack = x03
  x04 |= s04
  x05 |= s05
    x0a_stack = x0a
  s0c = x0c << 11
  s0d = x0d << 11
    x0b_stack = x0b
  (uint32) x0c >>= 21
  (uint32) x0d >>= 21
    x1d_stack = x1d
  x0c |= s0c
  x0d |= s0d
    x1c_stack = x1c
  x04 ^= x1a
  x05 ^= x1b
    x15_stack = x15
  x0c ^= x12
  x0d ^= x13
    x14_stack = x14
  x1b += x04
  x1a += x05
  x13 += x0c
  x12 += x0d
  s04 = x04 << 7
  s05 = x05 << 7
  (uint32) x04 >>= 25
  (uint32) x05 >>= 25
  x04 |= s04
  x05 |= s05
  s0c = x0c << 7
  s0d = x0d << 7
    x06 = x06_stack
  (uint32) x0c >>= 25
  (uint32) x0d >>= 25
    x07 = x07_stack
  x0c |= s0c
  x0d |= s0d
    x0e = x0e_stack
  x04 ^= x13
  x05 ^= x12
    x0f = x0f_stack
  x0c ^= x1b
  x0d ^= x1a
    x19 = x19_stack
    s06 = x06 << 11
    s07 = x07 << 11
  x05_stack = x05
    (uint32) x06 >>= 21
    (uint32) x07 >>= 21
  x0c_stack = x0c
    x06 |= s06
    x07 |= s07
  x0d_stack = x0d
    s0e = x0e << 11
    s0f = x0f << 11
  x1b_stack = x1b
    (uint32) x0e >>= 21
    (uint32) x0f >>= 21
  x13_stack = x13
    x0e |= s0e
    x0f |= s0f
    x06 ^= x18
    x07 ^= x19
    x0e ^= x10
    x0f ^= x11
    x19 += x06
    x18 += x07
    x11 += x0e
    x10 += x0f
    s06 = x06 << 7
    s07 = x07 << 7
    (uint32) x06 >>= 25
    (uint32) x07 >>= 25
    x06 |= s06
    x07 |= s07
    s0e = x0e << 7
    s0f = x0f << 7
  x05 = x05_stack
    (uint32) x0e >>= 25
    (uint32) x0f >>= 25
  x0c = x0c_stack
    x0e |= s0e
    x0f |= s0f
  x0d = x0d_stack
    x06 ^= x11
    x07 ^= x10
      x15 = x15_stack
    x0e ^= x19
    x0f ^= x18
      x14 = x14_stack
      x1d = x1d_stack
      x1c = x1c_stack
  x11 += x04
  x10 += x05
      x09 = x09_stack
  x19 += x0c
  x18 += x0d
    x06_stack = x06
      x15 += x00
      x14 += x01
  x05 = x05_stack
      x1d += x08
      x1c += x09
  x0c = x0c_stack
  s04 = x04 << 11
  s05 = x05 << 11
  x0d = x0d_stack
  (uint32) x04 >>= 21
  (uint32) x05 >>= 21
    x07_stack = x07
  x04 |= s04
  x05 |= s05
    x0e_stack = x0e
  s0c = x0c << 11
  s0d = x0d << 11
    x0f_stack = x0f
  (uint32) x0c >>= 21
  (uint32) x0d >>= 21
  x15_stack = x15
  x0c |= s0c
  x0d |= s0d
  x14_stack = x14
  x04 ^= x15
  x05 ^= x14
  x1d_stack = x1d
  x0c ^= x1d
  x0d ^= x1c
  x1c_stack = x1c
  s00 = x00 << 11
  s01 = x01 << 11
    x19_stack = x19
  (uint32) x00 >>= 21
  (uint32) x01 >>= 21
  x05_stack = x05
  x00 |= s00
  x01 |= s01
  x0c_stack = x0c
  s08 = x08 << 11
  s09 = x09 << 11
  x0d_stack = x0d
  (uint32) x08 >>= 21
  (uint32) x09 >>= 21
  x06 = x06_stack
  x08 |= s08
  x09 |= s09
  x13 = x13_stack
  x00 ^= x11
  x01 ^= x10
  x07 = x07_stack
  x08 ^= x19
  x09 ^= x18
  x0e = x0e_stack
  x13 += x06
  x12 += x07
  x1b = x1b_stack

  x0f = x0f_stack

  x09_stack = x09
  
  x02 = x02_stack
  x1b += x0e

  x03 = x03_stack
  x1a += x0f

  x0a = x0a_stack
  x0b = x0b_stack
  x17 = x17_stack
  x16 = x16_stack
  x1f = x1f_stack
  x1e = x1e_stack

  x06 = x06_stack
  x17 += x02

  x07 = x07_stack
  x16 += x03

  x0e = x0e_stack
  x1f += x0a

  x0f = x0f_stack
  x1e += x0b

x13_stack = x13

x1b_stack = x1b
  s06 = x06 << 11
  s07 = x07 << 11
  (uint32) x06 >>= 21
  (uint32) x07 >>= 21
  x17_stack = x17
  x06 |= s06
  x07 |= s07
  x16_stack = x16
  s0e = x0e << 11
  s0f = x0f << 11
  x1f_stack = x1f
  (uint32) x0e >>= 21
  (uint32) x0f >>= 21
  x1e_stack = x1e
  x0e |= s0e
  x0f |= s0f
r = r_stack
  x06 ^= x17
  x07 ^= x16
  x06_stack = x06
  x0e ^= x1f
  x0f ^= x1e
  x07_stack = x07
  s0b = x0b << 11
  s0a = x0a << 11
  x0e_stack = x0e
  (uint32) x0b >>= 21
  (uint32) x0a >>= 21
  x0f_stack = x0f
  x0b |= s0b
  x0a |= s0a
  x13 = x13_stack
  s03 = x03 << 11
  s02 = x02 << 11
  x1b = x1b_stack
  (uint32) x03 >>= 21
  (uint32) x02 >>= 21
  x03 |= s03
  x02 |= s02
                   unsigned>? r -= 2
  x02 ^= x13
  x03 ^= x12
  x03_stack = x03
  x0a ^= x1b
  x0b ^= x1a
  x0b_stack = x0b

goto morerounds if unsigned>

  finalization = finalization_stack
  in = in_stack
  inlen = inlen_stack

                  unsigned<? inlen - 32
goto mainloop if !unsigned<

inlenbelow32:

                      =? finalization - 1
goto finalization1 if =
                      =? finalization - 2
goto finalization2 if =
  
  z = &tmp

  *(uint64 *) (z + 0) = 0
  *(uint64 *) (z + 8) = 0
  *(uint64 *) (z + 16) = 0
  *(uint64 *) (z + 24) = 0

                 =? inlen - 0
goto copydone if =
  copyloop:
    y00 = *(uint8 *) (in + 0)
    in += 1
    *(uint8 *) (z + 0) = y00
    z += 1

                 unsigned>? inlen -= 1
goto copyloop if unsigned>
copydone:

  y00 = 128
  *(uint8 *) (z + 0) = y00

  in = &tmp
  finalization = 1
  inlen = 32
  goto mainloop

finalization1:
  x1f = x1f_stack
  x1f ^= 1
  x1f_stack = x1f
  r = 160
  finalization = 2
  finalization_stack = finalization
  in_stack = in
  inlen_stack = inlen
goto morerounds

finalization2:

  out = out_stack

  x03 = x03_stack
  x05 = x05_stack
  x06 = x06_stack
  x07 = x07_stack

  *(uint8 *) (out + 0) = x00
  (uint32) x00 >>= 8
  *(uint8 *) (out + 4) = x01
  (uint32) x01 >>= 8
  *(uint8 *) (out + 8) = x02
  (uint32) x02 >>= 8
  *(uint8 *) (out + 12) = x03
  (uint32) x03 >>= 8
  *(uint8 *) (out + 16) = x04
  (uint32) x04 >>= 8
  *(uint8 *) (out + 20) = x05
  (uint32) x05 >>= 8
  *(uint8 *) (out + 24) = x06
  (uint32) x06 >>= 8
  *(uint8 *) (out + 28) = x07
  (uint32) x07 >>= 8

  *(uint8 *) (out + 1) = x00
  (uint32) x00 >>= 8
  *(uint8 *) (out + 5) = x01
  (uint32) x01 >>= 8
  *(uint8 *) (out + 9) = x02
  (uint32) x02 >>= 8
  *(uint8 *) (out + 13) = x03
  (uint32) x03 >>= 8
  *(uint8 *) (out + 17) = x04
  (uint32) x04 >>= 8
  *(uint8 *) (out + 21) = x05
  (uint32) x05 >>= 8
  *(uint8 *) (out + 25) = x06
  (uint32) x06 >>= 8
  *(uint8 *) (out + 29) = x07
  (uint32) x07 >>= 8

  *(uint8 *) (out + 2) = x00
  (uint32) x00 >>= 8
  *(uint8 *) (out + 6) = x01
  (uint32) x01 >>= 8
  *(uint8 *) (out + 10) = x02
  (uint32) x02 >>= 8
  *(uint8 *) (out + 14) = x03
  (uint32) x03 >>= 8
  *(uint8 *) (out + 18) = x04
  (uint32) x04 >>= 8
  *(uint8 *) (out + 22) = x05
  (uint32) x05 >>= 8
  *(uint8 *) (out + 26) = x06
  (uint32) x06 >>= 8
  *(uint8 *) (out + 30) = x07
  (uint32) x07 >>= 8

  *(uint8 *) (out + 3) = x00
  *(uint8 *) (out + 7) = x01
  *(uint8 *) (out + 11) = x02
  *(uint8 *) (out + 15) = x03
  *(uint8 *) (out + 19) = x04
  *(uint8 *) (out + 23) = x05
  *(uint8 *) (out + 27) = x06
  *(uint8 *) (out + 31) = x07

  x09 = x09_stack
  x0b = x0b_stack
  x0c = x0c_stack
  x0d = x0d_stack
  x0e = x0e_stack
  x0f = x0f_stack

  *(uint8 *) (out + 32) = x08
  (uint32) x08 >>= 8
  *(uint8 *) (out + 36) = x09
  (uint32) x09 >>= 8
  *(uint8 *) (out + 40) = x0a
  (uint32) x0a >>= 8
  *(uint8 *) (out + 44) = x0b
  (uint32) x0b >>= 8
  *(uint8 *) (out + 48) = x0c
  (uint32) x0c >>= 8
  *(uint8 *) (out + 52) = x0d
  (uint32) x0d >>= 8
  *(uint8 *) (out + 56) = x0e
  (uint32) x0e >>= 8
  *(uint8 *) (out + 60) = x0f
  (uint32) x0f >>= 8

  *(uint8 *) (out + 33) = x08
  (uint32) x08 >>= 8
  *(uint8 *) (out + 37) = x09
  (uint32) x09 >>= 8
  *(uint8 *) (out + 41) = x0a
  (uint32) x0a >>= 8
  *(uint8 *) (out + 45) = x0b
  (uint32) x0b >>= 8
  *(uint8 *) (out + 49) = x0c
  (uint32) x0c >>= 8
  *(uint8 *) (out + 53) = x0d
  (uint32) x0d >>= 8
  *(uint8 *) (out + 57) = x0e
  (uint32) x0e >>= 8
  *(uint8 *) (out + 61) = x0f
  (uint32) x0f >>= 8

  *(uint8 *) (out + 34) = x08
  (uint32) x08 >>= 8
  *(uint8 *) (out + 38) = x09
  (uint32) x09 >>= 8
  *(uint8 *) (out + 42) = x0a
  (uint32) x0a >>= 8
  *(uint8 *) (out + 46) = x0b
  (uint32) x0b >>= 8
  *(uint8 *) (out + 50) = x0c
  (uint32) x0c >>= 8
  *(uint8 *) (out + 54) = x0d
  (uint32) x0d >>= 8
  *(uint8 *) (out + 58) = x0e
  (uint32) x0e >>= 8
  *(uint8 *) (out + 62) = x0f
  (uint32) x0f >>= 8

  *(uint8 *) (out + 35) = x08
  *(uint8 *) (out + 39) = x09
  *(uint8 *) (out + 43) = x0a
  *(uint8 *) (out + 47) = x0b
  *(uint8 *) (out + 51) = x0c
  *(uint8 *) (out + 55) = x0d
  *(uint8 *) (out + 59) = x0e
  *(uint8 *) (out + 63) = x0f

  result = 0

leave
