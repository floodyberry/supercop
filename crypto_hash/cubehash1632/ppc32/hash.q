int32 out
int32 in
int32 inlenhigh
int32 inlenlow
int32 result

input out
input in
input inlenhigh
input inlenlow
output result

int32 x00
int32 x01
int32 x02
int32 x03
int32 x04
int32 x05
int32 x06
int32 x07
int32 x08
int32 x09
int32 x0a
int32 x0b
int32 x0c
int32 x0d
int32 x0e
int32 x0f
int32 x10
int32 x11
int32 x12
int32 x13
int32 x14
int32 x15
int32 x16
int32 x17
int32 x18
int32 x19
int32 x1a
int32 x1b
int32 x1c
int32 x1d
int32 x1e
int32 x1f

int32 y00
int32 y01
int32 y02
int32 y03
int32 y04
int32 y05
int32 y06
int32 y07

int32 r
int32 i
int32 finalization
stack256 tmp
int32 z

stack32 out_stack
stack32 in_stack
stack32 inlenlow_stack
stack32 inlenhigh_stack
stack32 finalization_stack
stack32 r_stack

stack32 x02_stack
stack32 x0a_stack
stack32 x0b_stack
stack32 x14_stack
stack32 x15_stack
stack32 x16_stack
stack32 x17_stack
stack32 x1c_stack
stack32 x1d_stack
stack32 x1e_stack
stack32 x1f_stack

int32 i12
int32 i13
int32 i14
int32 i15
int32 i16
int32 i17
int32 i18
int32 i19
int32 i20
int32 i21
int32 i22
int32 i23
int32 i24
int32 i25
int32 i26
int32 i27
int32 i28
int32 i29

caller i12
caller i13
caller i14
caller i15
caller i16
caller i17
caller i18
caller i19
caller i20
caller i21
caller i22
caller i23
caller i24
caller i25
caller i26
caller i27
caller i28
caller i29

stack32 i12_stack
stack32 i13_stack
stack32 i14_stack
stack32 i15_stack
stack32 i16_stack
stack32 i17_stack
stack32 i18_stack
stack32 i19_stack
stack32 i20_stack
stack32 i21_stack
stack32 i22_stack
stack32 i23_stack
stack32 i24_stack
stack32 i25_stack
stack32 i26_stack
stack32 i27_stack
stack32 i28_stack
stack32 i29_stack

enter crypto_hash_cubehash1632_ppc32

i12_stack = i12
i13_stack = i13
i14_stack = i14
i15_stack = i15
i16_stack = i16
i17_stack = i17
i18_stack = i18
i19_stack = i19
i20_stack = i20
i21_stack = i21
i22_stack = i22
i23_stack = i23
i24_stack = i24
i25_stack = i25
i26_stack = i26
i27_stack = i27
i28_stack = i28
i29_stack = i29

  out_stack = out

  x08 = 65536 * 0x4d42
  x09 = 65536 * 0xa647
  x0a = 65536 * 0x97cf
  x0b = 65536 * 0x825b
  x0c = 65536 * 0xeef8
  x0d = 65536 * 0xf220
  x0e = 65536 * 0xd0e5
  x0f = 65536 * 0xa239
  x08 |= 0xc787
  x09 |= 0xa8b3
  x0a |= 0x0bef
  x0b |= 0x4537
  x0c |= 0x64d2
  x0d |= 0x90c4
  x0e |= 0xcd33
  x0f |= 0x11ae

  x0b_stack = x0b

  x10 = 65536 * 0xfcd3
  x11 = 65536 * 0x148f
  x12 = 65536 * 0x1b01
  x13 = 65536 * 0xb644
  x14 = 65536 * 0x6a53
  x15 = 65536 * 0x2ff5
  x16 = 65536 * 0x91fa
  x17 = 65536 * 0x0dba
  x10 |= 0x98d9
  x11 |= 0xe485
  x12 |= 0x7bef
  x13 |= 0x4532
  x14 |= 0x6159
  x15 |= 0x781c
  x16 |= 0x7934
  x17 |= 0xdea9

  x14_stack = x14
  x15_stack = x15
  x16_stack = x16
  x17_stack = x17

  x18 = 65536 * 0xd65c
  x19 = 65536 * 0xa5a7
  x1a = 65536 * 0xb1c6
  x1b = 65536 * 0xbc79
  x1c = 65536 * 0x1921
  x1d = 65536 * 0xe798
  x1e = 65536 * 0x7795
  x1f = 65536 * 0xd43e
  x18 |= 0x8a2b
  x19 |= 0x0e75
  x1a |= 0x2456
  x1b |= 0x6576
  x1c |= 0xc8f7
  x1d |= 0x9af1
  x1e |= 0xd246
  x1f |= 0x3b44

  x1c_stack = x1c
  x1d_stack = x1d
  x1e_stack = x1e
  x1f_stack = x1f

  x00 = 65536 * 0x2aea
  x01 = 65536 * 0x50f4
  x02 = 65536 * 0x2d53
  x03 = 65536 * 0x4167
  x04 = 65536 * 0x3fee
  x05 = 65536 * 0xc701
  x06 = 65536 * 0xcc39
  x07 = 65536 * 0x50ac
  x00 |= 0x2a61
  x01 |= 0x94d4
  x02 |= 0x8b8b
  x03 |= 0xd83e
  x04 |= 0x2313
  x05 |= 0xcf8c
  x06 |= 0x968e
  x07 |= 0x5695

  finalization = 0

checkinlen:
                  <? (uint32) inlenlow - 32
goto mainloop if !<
                     =? (uint32) inlenhigh - 0
goto inlenbelow32 if =

mainloop:

  carry? inlenlow -= 32
  inlenhigh = inlenhigh - 1 + carry
  r = 16

  finalization_stack = finalization
  inlenlow_stack = inlenlow
  inlenhigh_stack = inlenhigh

  y00 = *(swapendian uint32 *) in
  in += 4
  y01 = *(swapendian uint32 *) in
  in += 4
  y02 = *(swapendian uint32 *) in
  in += 4
  y03 = *(swapendian uint32 *) in
  in += 4
  x00 ^= y00
  x01 ^= y01
  x02 ^= y02
  x03 ^= y03

  y04 = *(swapendian uint32 *) in
  in += 4
  y05 = *(swapendian uint32 *) in
  in += 4
  x04 ^= y04
  x05 ^= y05

  y06 = *(swapendian uint32 *) in
  in += 4
  y07 = *(swapendian uint32 *) in
  in += 4
  x06 ^= y06
  x07 ^= y07

  in_stack = in

morerounds:

r_stack = r

  x10 += x00
  x12 += x02
  x18 += x08
  x1a += x0a
  x00 <<<= 7
  x02 <<<= 7
  x08 <<<= 7
  x0a <<<= 7
  x00 ^= x18
  x02 ^= x1a
  x08 ^= x10
  x0a ^= x12
          x02_stack = x02
  x1a += x00
          x0a_stack = x0a
  x18 += x02
          x14 = x14_stack
  x12 += x08
          x16 = x16_stack
  x10 += x0a
          x1c = x1c_stack
  x14 += x04
          x1e = x1e_stack
  x16 += x06
  x1c += x0c
  x1e += x0e
  x04 <<<= 7
  x06 <<<= 7
  x0c <<<= 7
  x0e <<<= 7
  x04 ^= x1c
  x06 ^= x1e
  x0c ^= x14
  x0e ^= x16
          x0b = x0b_stack
  x1e += x04
  x1c += x06
  x16 += x0c
  x14 += x0e
          x1e_stack = x1e
  x11 += x01
          x1c_stack = x1c
  x13 += x03
          x16_stack = x16
  x19 += x09
          x14_stack = x14
  x1b += x0b
  x01 <<<= 7
  x03 <<<= 7
  x09 <<<= 7
  x0b <<<= 7
  x01 ^= x19
  x03 ^= x1b
  x09 ^= x11
  x0b ^= x13
          x15 = x15_stack
  x1b += x01
          x17 = x17_stack
  x19 += x03
          x1d = x1d_stack
  x13 += x09
          x1f = x1f_stack
  x11 += x0b
          x0b_stack = x0b
  x15 += x05
  x17 += x07
  x1d += x0d
  x1f += x0f
  x05 <<<= 7
  x07 <<<= 7
  x0d <<<= 7
  x0f <<<= 7
  x05 ^= x1d
  x07 ^= x1f
  x0d ^= x15
  x0f ^= x17
  x1f += x05
  x1d += x07
  x17 += x0d
  x15 += x0f
          x1e = x1e_stack
  x00 <<<= 11
          x16 = x16_stack
  x01 <<<= 11
          x15_stack = x15
  x08 <<<= 11
          x1d_stack = x1d
  x09 <<<= 11
  x00 ^= x1e
  x01 ^= x1f
  x08 ^= x16
  x09 ^= x17
  x1f += x00
  x1e += x01
  x17 += x08
  x16 += x09
  x00 <<<= 7
          x1f_stack = x1f
  x01 <<<= 7
          x1e_stack = x1e
  x08 <<<= 7
          x17_stack = x17
  x09 <<<= 7
          x16_stack = x16
  x00 ^= x17
          x02 = x02_stack
  x01 ^= x16
          x0a = x0a_stack
  x08 ^= x1f
          x0b = x0b_stack
  x09 ^= x1e
          x1c = x1c_stack
  x02 <<<= 11
          x1d = x1d_stack
  x03 <<<= 11
          x14 = x14_stack
  x0a <<<= 11
          x15 = x15_stack
  x0b <<<= 11
  x02 ^= x1c
  x03 ^= x1d
  x0a ^= x14
  x0b ^= x15
  x1d += x02
  x1c += x03
  x15 += x0a
  x14 += x0b
          x1d_stack = x1d
  x02 <<<= 7
          x1c_stack = x1c
  x03 <<<= 7
          x15_stack = x15
  x0a <<<= 7
          x14_stack = x14
  x0b <<<= 7
  x02 ^= x15
  x03 ^= x14
  x0a ^= x1d
  x0b ^= x1c
          x02_stack = x02
  x04 <<<= 11
          x0a_stack = x0a
  x05 <<<= 11
          x0b_stack = x0b
  x0c <<<= 11
  x0d <<<= 11
  x04 ^= x1a
  x05 ^= x1b
  x0c ^= x12
  x0d ^= x13
  x1b += x04
  x1a += x05
  x13 += x0c
  x12 += x0d
  x04 <<<= 7
  x05 <<<= 7
  x0c <<<= 7
  x0d <<<= 7
  x04 ^= x13
  x05 ^= x12
  x0c ^= x1b
  x0d ^= x1a

  x06 <<<= 11
  x07 <<<= 11
  x0e <<<= 11
  x0f <<<= 11
  x06 ^= x18
  x07 ^= x19
  x0e ^= x10
  x0f ^= x11
  x19 += x06
  x18 += x07
  x11 += x0e
  x10 += x0f
  x06 <<<= 7
  x07 <<<= 7
  x0e <<<= 7
  x0f <<<= 7
  x06 ^= x11
          x15 = x15_stack
  x07 ^= x10
          x14 = x14_stack
  x0e ^= x19
          x1d = x1d_stack
  x0f ^= x18
          x1c = x1c_stack
  
  x11 += x04
  x10 += x05
  x19 += x0c
  x18 += x0d
  
  
  x15 += x00
  x14 += x01
  x1d += x08
  x1c += x09

  x04 <<<= 11
          x15_stack = x15
  x05 <<<= 11
          x14_stack = x14
  x0c <<<= 11
          x1d_stack = x1d
  x0d <<<= 11
          x1c_stack = x1c
  x04 ^= x15
  x05 ^= x14
  x0c ^= x1d
  x0d ^= x1c
  x00 <<<= 11
  x01 <<<= 11
  x08 <<<= 11
  x09 <<<= 11
  x00 ^= x11
  x01 ^= x10
          x17 = x17_stack
  x08 ^= x19
          x02 = x02_stack
  x09 ^= x18
          x16 = x16_stack
  x13 += x06
          x1f = x1f_stack
  x12 += x07
          x0a = x0a_stack
  x1b += x0e
          x1e = x1e_stack
  x1a += x0f
          x0b = x0b_stack
  x17 += x02
  x16 += x03
  x1f += x0a
  x1e += x0b
        r = r_stack
  x06 <<<= 11
          x17_stack = x17
  x07 <<<= 11
          x16_stack = x16
  x0e <<<= 11
          x1f_stack = x1f
  x0f <<<= 11
          x1e_stack = x1e
                   >? r -= 2
  x06 ^= x17
  x07 ^= x16
  x0e ^= x1f
  x0f ^= x1e
  
  x0b <<<= 11
  x0a <<<= 11
  x03 <<<= 11
  x02 <<<= 11
  x0b ^= x1a
  x0a ^= x1b
  x03 ^= x12
  x02 ^= x13
          x0b_stack = x0b

goto morerounds if >

  finalization = finalization_stack
  in = in_stack
  inlenlow = inlenlow_stack
  inlenhigh = inlenhigh_stack

goto checkinlen

inlenbelow32:

                      =? (uint32) finalization - 1
goto finalization1 if =
                      =? (uint32) finalization - 2
goto finalization2 if =
  
  y00 = 0
  z = &tmp

  *(uint32 *) (z + 0) = y00
  *(uint32 *) (z + 4) = y00
  *(uint32 *) (z + 8) = y00
  *(uint32 *) (z + 12) = y00
  *(uint32 *) (z + 16) = y00
  *(uint32 *) (z + 20) = y00
  *(uint32 *) (z + 24) = y00
  *(uint32 *) (z + 28) = y00

                 =? (uint32) inlenlow - 0
goto copydone if =
  copyloop:
    y00 = *(uint8 *) (in + 0)
    in += 1
    *(uint8 *) (z + 0) = y00
    z += 1

                 >? inlenlow -= 1
goto copyloop if >
copydone:

  y00 = 128
  *(uint8 *) (z + 0) = y00

  in = &tmp
  finalization = 1
  inlenlow = 32
  goto mainloop

finalization1:
  x1f = x1f_stack
  x1f ^= 1
  x1f_stack = x1f
  r = 160
  finalization = 2
  finalization_stack = finalization
  in_stack = in
  inlenlow_stack = inlenlow
  inlenhigh_stack = inlenhigh
goto morerounds

finalization2:

  out = out_stack


  *(swapendian uint32 *) out = x00
  out += 4
  *(swapendian uint32 *) out = x01
  out += 4
  *(swapendian uint32 *) out = x02
  out += 4
  *(swapendian uint32 *) out = x03
  out += 4
  *(swapendian uint32 *) out = x04
  out += 4
  *(swapendian uint32 *) out = x05
  out += 4
  *(swapendian uint32 *) out = x06
  out += 4
  *(swapendian uint32 *) out = x07
  out += 4

  x0b = x0b_stack

  *(swapendian uint32 *) out = x08
  out += 4
  *(swapendian uint32 *) out = x09
  out += 4
  *(swapendian uint32 *) out = x0a
  out += 4
  *(swapendian uint32 *) out = x0b
  out += 4
  *(swapendian uint32 *) out = x0c
  out += 4
  *(swapendian uint32 *) out = x0d
  out += 4
  *(swapendian uint32 *) out = x0e
  out += 4
  *(swapendian uint32 *) out = x0f

  result = 0

i12 = i12_stack
i13 = i13_stack
i14 = i14_stack
i15 = i15_stack
i16 = i16_stack
i17 = i17_stack
i18 = i18_stack
i19 = i19_stack
i20 = i20_stack
i21 = i21_stack
i22 = i22_stack
i23 = i23_stack
i24 = i24_stack
i25 = i25_stack
i26 = i26_stack
i27 = i27_stack
i28 = i28_stack
i29 = i29_stack

leave
