int32 out
int32 in
int32 inlenlow
int32 inlenhigh
int32 result

input out
input in
input inlenlow
input inlenhigh
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

int32 s00
int32 s01
int32 s02
int32 s03
int32 s04
int32 s05
int32 s06
int32 s07
int32 s08
int32 s09
int32 s0a
int32 s0b
int32 s0c
int32 s0d
int32 s0e
int32 s0f

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

int32 check
int32 carry

stack32 out_stack
stack32 in_stack
stack32 inlenlow_stack
stack32 inlenhigh_stack
stack32 finalization_stack
stack32 r_stack

stack32 x02_stack
stack32 x0a_stack
stack32 x0b_stack
stack32 x0c_stack
stack32 x0d_stack
stack32 x0e_stack
stack32 x0f_stack
stack32 x14_stack
stack32 x15_stack
stack32 x16_stack
stack32 x17_stack
stack32 x1c_stack
stack32 x1d_stack
stack32 x1e_stack
stack32 x1f_stack

int32 i16
int32 i17
int32 i18
int32 i19
int32 i20
int32 i21
int32 i22
int32 i23
int32 i30
int32 i31

caller i16
caller i17
caller i18
caller i19
caller i20
caller i21
caller i22
caller i23
caller i30
caller i31

stack32 i16_stack
stack32 i17_stack
stack32 i18_stack
stack32 i19_stack
stack32 i20_stack
stack32 i21_stack
stack32 i22_stack
stack32 i23_stack
stack32 i30_stack
stack32 i31_stack

enter crypto_hash_cubehash1632_mips32

  i16_stack = i16
  i17_stack = i17
  i18_stack = i18
  i19_stack = i19
  i20_stack = i20
  i21_stack = i21
  i22_stack = i22
  i23_stack = i23
  i30_stack = i30
  i31_stack = i31

  out_stack = out

  x08 = 0x4d420000
  x08 |= 0xc787
  x09 = 0xa6470000
  x09 |= 0xa8b3
  x0a = 0x97cf0000
  x0a |= 0x0bef
  x0b = 0x825b0000
  x0b |= 0x4537
  x0c = 0xeef80000
  x0c |= 0x64d2
  x0d = 0xf2200000
  x0d |= 0x90c4
  x0e = 0xd0e50000
  x0e |= 0xcd33
  x0f = 0xa2390000
  x0f |= 0x11ae

  x0b_stack = x0b
  x0c_stack = x0c
  x0d_stack = x0d
  x0e_stack = x0e
  x0f_stack = x0f

  x10 = 0xfcd30000
  x10 |= 0x98d9
  x11 = 0x148f0000
  x11 |= 0xe485
  x12 = 0x1b010000
  x12 |= 0x7bef
  x13 = 0xb6440000
  x13 |= 0x4532
  x14 = 0x6a530000
  x14 |= 0x6159
  x15 = 0x2ff50000
  x15 |= 0x781c
  x16 = 0x91fa0000
  x16 |= 0x7934
  x17 = 0x0dba0000
  x17 |= 0xdea9

  x14_stack = x14
  x15_stack = x15
  x16_stack = x16
  x17_stack = x17

  x18 = 0xd65c0000
  x18 |= 0x8a2b
  x19 = 0xa5a70000
  x19 |= 0x0e75
  x1a = 0xb1c60000
  x1a |= 0x2456
  x1b = 0xbc790000
  x1b |= 0x6576
  x1c = 0x19210000
  x1c |= 0xc8f7
  x1d = 0xe7980000
  x1d |= 0x9af1
  x1e = 0x77950000
  x1e |= 0xd246
  x1f = 0xd43e0000
  x1f |= 0x3b44

  x1c_stack = x1c
  x1d_stack = x1d
  x1e_stack = x1e
  x1f_stack = x1f

  x00 = 0x2aea0000
  x00 |= 0x2a61
  x01 = 0x50f40000
  x01 |= 0x94d4
  x02 = 0x2d530000
  x02 |= 0x8b8b
  x03 = 0x41670000
  x03 |= 0xd83e
  x04 = 0x3fee0000
  x04 |= 0x2313
  x05 = 0xc7010000
  x05 |= 0xcf8c
  x06 = 0xcc390000
  x06 |= 0x968e
  x07 = 0x50ac0000
  x07 |= 0x5695

  finalization = 0

checkinlen:
                 carry = (uint32) inlenlow < 32
goto mainloop if carry == 0
goto inlenbelow32 if inlenhigh == 0

mainloop:

  inlenlow -= 32
  inlenhigh -= carry
  r = 16

  finalization_stack = finalization
  inlenlow_stack = inlenlow
  inlenhigh_stack = inlenhigh

  new y00
  new y01
  new y02
  new y03

  y00 left = *(unaligned uint32 *) (in + 0)
  y00 right = *(unaligned uint32 *) (in + 0)
  y01 left = *(unaligned uint32 *) (in + 4)
  y01 right = *(unaligned uint32 *) (in + 4)
  y02 left = *(unaligned uint32 *) (in + 8)
  y02 right = *(unaligned uint32 *) (in + 8)
  y03 left = *(unaligned uint32 *) (in + 12)
  y03 right = *(unaligned uint32 *) (in + 12)
  x00 ^= y00
  x01 ^= y01
  x02 ^= y02
  x03 ^= y03

  new y04
  new y05
  new y06
  new y07

  y04 left = *(unaligned uint32 *) (in + 16)
  y04 right = *(unaligned uint32 *) (in + 16)
  y05 left = *(unaligned uint32 *) (in + 20)
  y05 right = *(unaligned uint32 *) (in + 20)
  x04 ^= y04
  x05 ^= y05

  y06 left = *(unaligned uint32 *) (in + 24)
  y06 right = *(unaligned uint32 *) (in + 24)
  y07 left = *(unaligned uint32 *) (in + 28)
  y07 right = *(unaligned uint32 *) (in + 28)
  x06 ^= y06
  x07 ^= y07

  in += 32
  in_stack = in

morerounds:

r_stack = r

  x10 += x00
  x12 += x02
  x18 += x08
  x1a += x0a
  s00 = x00 << 7
  (uint32) x00 >>= 25
  x00 |= s00
  s02 = x02 << 7
  (uint32) x02 >>= 25
  x02 |= s02
  s08 = x08 << 7
  (uint32) x08 >>= 25
  x08 |= s08
  s0a = x0a << 7
  (uint32) x0a >>= 25
  x0a |= s0a
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
	  x0c = x0c_stack
	  x0e = x0e_stack
  x16 += x06
  x1c += x0c
  x1e += x0e
  s04 = x04 << 7
  (uint32) x04 >>= 25
  x04 |= s04
  s06 = x06 << 7
  (uint32) x06 >>= 25
  x06 |= s06
  s0c = x0c << 7
  (uint32) x0c >>= 25
  x0c |= s0c
  s0e = x0e << 7
  (uint32) x0e >>= 25
  x0e |= s0e
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
	  x0c_stack = x0c
	  x0e_stack = x0e
  x1b += x0b
  s01 = x01 << 7
  (uint32) x01 >>= 25
  x01 |= s01
  s03 = x03 << 7
  (uint32) x03 >>= 25
  x03 |= s03
  s09 = x09 << 7
  (uint32) x09 >>= 25
  x09 |= s09
  s0b = x0b << 7
  (uint32) x0b >>= 25
  x0b |= s0b
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
          x0d_stack = x0d
          x0f_stack = x0f
  x15 += x05
  x17 += x07
  x1d += x0d
  x1f += x0f
  s05 = x05 << 7
  (uint32) x05 >>= 25
  x05 |= s05
  s07 = x07 << 7
  (uint32) x07 >>= 25
  x07 |= s07
  s0d = x0d << 7
  (uint32) x0d >>= 25
  x0d |= s0d
  s0f = x0f << 7
  (uint32) x0f >>= 25
  x0f |= s0f
  x05 ^= x1d
  x07 ^= x1f
  x0d ^= x15
  x0f ^= x17
  x1f += x05
  x1d += x07
  x17 += x0d
  x15 += x0f
          x1e = x1e_stack
	  x0d_stack = x0d
	  x0f_stack = x0f
  s00 = x00 << 11
  (uint32) x00 >>= 21
  x00 |= s00
          x16 = x16_stack
  s01 = x01 << 11
  (uint32) x01 >>= 21
  x01 |= s01
          x15_stack = x15
  s08 = x08 << 11
  (uint32) x08 >>= 21
  x08 |= s08
          x1d_stack = x1d
  s09 = x09 << 11
  (uint32) x09 >>= 21
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
  (uint32) x00 >>= 25
  x00 |= s00
          x1f_stack = x1f
  s01 = x01 << 7
  (uint32) x01 >>= 25
  x01 |= s01
          x1e_stack = x1e
  s08 = x08 << 7
  (uint32) x08 >>= 25
  x08 |= s08
          x17_stack = x17
  s09 = x09 << 7
  (uint32) x09 >>= 25
  x09 |= s09
          x16_stack = x16
  x00 ^= x17
          x02 = x02_stack
  x01 ^= x16
          x0a = x0a_stack
  x08 ^= x1f
          x0b = x0b_stack
  x09 ^= x1e
          x1c = x1c_stack
  s02 = x02 << 11
  (uint32) x02 >>= 21
  x02 |= s02
          x1d = x1d_stack
  s03 = x03 << 11
  (uint32) x03 >>= 21
  x03 |= s03
          x14 = x14_stack
  s0a = x0a << 11
  (uint32) x0a >>= 21
  x0a |= s0a
          x15 = x15_stack
  s0b = x0b << 11
  (uint32) x0b >>= 21
  x0b |= s0b
  x02 ^= x1c
  x03 ^= x1d
  x0a ^= x14
  x0b ^= x15
  x1d += x02
  x1c += x03
  x15 += x0a
  x14 += x0b
          x1d_stack = x1d
  s02 = x02 << 7
  (uint32) x02 >>= 25
  x02 |= s02
          x1c_stack = x1c
  s03 = x03 << 7
  (uint32) x03 >>= 25
  x03 |= s03
          x15_stack = x15
  s0a = x0a << 7
  (uint32) x0a >>= 25
  x0a |= s0a
          x14_stack = x14
  s0b = x0b << 7
  (uint32) x0b >>= 25
  x0b |= s0b
  x02 ^= x15
  x03 ^= x14
  x0a ^= x1d
	  x0c = x0c_stack
	  x0d = x0d_stack
  x0b ^= x1c
          x02_stack = x02
  s04 = x04 << 11
  (uint32) x04 >>= 21
  x04 |= s04
          x0a_stack = x0a
  s05 = x05 << 11
  (uint32) x05 >>= 21
  x05 |= s05
          x0b_stack = x0b
  s0c = x0c << 11
  (uint32) x0c >>= 21
  x0c |= s0c
  s0d = x0d << 11
  (uint32) x0d >>= 21
  x0d |= s0d
  x04 ^= x1a
  x05 ^= x1b
  x0c ^= x12
  x0d ^= x13
  x1b += x04
  x1a += x05
  x13 += x0c
  x12 += x0d
  s04 = x04 << 7
  (uint32) x04 >>= 25
  x04 |= s04
  s05 = x05 << 7
  (uint32) x05 >>= 25
  x05 |= s05
  s0c = x0c << 7
  (uint32) x0c >>= 25
  x0c |= s0c
  s0d = x0d << 7
  (uint32) x0d >>= 25
  x0d |= s0d
  x04 ^= x13
  x05 ^= x12
  x0c ^= x1b
  x0d ^= x1a
          x0c_stack = x0c
          x0d_stack = x0d
	  x0e = x0e_stack
	  x0f = x0f_stack

  s06 = x06 << 11
  (uint32) x06 >>= 21
  x06 |= s06
  s07 = x07 << 11
  (uint32) x07 >>= 21
  x07 |= s07
  s0e = x0e << 11
  (uint32) x0e >>= 21
  x0e |= s0e
  s0f = x0f << 11
  (uint32) x0f >>= 21
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
  (uint32) x06 >>= 25
  x06 |= s06
  s07 = x07 << 7
  (uint32) x07 >>= 25
  x07 |= s07
  s0e = x0e << 7
  (uint32) x0e >>= 25
  x0e |= s0e
  s0f = x0f << 7
  (uint32) x0f >>= 25
  x0f |= s0f
  x06 ^= x11
          x15 = x15_stack
  x07 ^= x10
          x14 = x14_stack
  x0e ^= x19
          x1d = x1d_stack
  x0f ^= x18
          x1c = x1c_stack

	  x0e_stack = x0e
	  x0f_stack = x0f
	  x0c = x0c_stack
	  x0d = x0d_stack
  
  x11 += x04
  x10 += x05
  x19 += x0c
  x18 += x0d
  
  
  x15 += x00
  x14 += x01
  x1d += x08
  x1c += x09

  s04 = x04 << 11
  (uint32) x04 >>= 21
  x04 |= s04
          x15_stack = x15
  s05 = x05 << 11
  (uint32) x05 >>= 21
  x05 |= s05
          x14_stack = x14
  s0c = x0c << 11
  (uint32) x0c >>= 21
  x0c |= s0c
          x1d_stack = x1d
  s0d = x0d << 11
  (uint32) x0d >>= 21
  x0d |= s0d
          x1c_stack = x1c
  x04 ^= x15
  x05 ^= x14
  x0c ^= x1d
  x0d ^= x1c
          x0c_stack = x0c
          x0d_stack = x0d
          x0e = x0e_stack
          x0f = x0f_stack
  s00 = x00 << 11
  (uint32) x00 >>= 21
  x00 |= s00
  s01 = x01 << 11
  (uint32) x01 >>= 21
  x01 |= s01
  s08 = x08 << 11
  (uint32) x08 >>= 21
  x08 |= s08
  s09 = x09 << 11
  (uint32) x09 >>= 21
  x09 |= s09
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
  s06 = x06 << 11
  (uint32) x06 >>= 21
  x06 |= s06
          x17_stack = x17
  s07 = x07 << 11
  (uint32) x07 >>= 21
  x07 |= s07
          x16_stack = x16
  s0e = x0e << 11
  (uint32) x0e >>= 21
  x0e |= s0e
          x1f_stack = x1f
  s0f = x0f << 11
  (uint32) x0f >>= 21
  x0f |= s0f
          x1e_stack = x1e
  x06 ^= x17
  x07 ^= x16
  x0e ^= x1f
  x0f ^= x1e
          x0e_stack = x0e
          x0f_stack = x0f
  
  s0b = x0b << 11
  (uint32) x0b >>= 21
  x0b |= s0b
  s0a = x0a << 11
  (uint32) x0a >>= 21
  x0a |= s0a
  s03 = x03 << 11
  (uint32) x03 >>= 21
  x03 |= s03
  s02 = x02 << 11
  (uint32) x02 >>= 21
  x02 |= s02
        r = r_stack
  x0b ^= x1a
  x0a ^= x1b
                   r -= 2
  x03 ^= x12
  x02 ^= x13
          x0b_stack = x0b

goto morerounds if r > 0

  finalization = finalization_stack
  in = in_stack
  inlenlow = inlenlow_stack
  inlenhigh = inlenhigh_stack

goto checkinlen

inlenbelow32:

		      check = 1
goto finalization1 if finalization == check
		      check = 2
goto finalization2 if finalization == check
  
  new tmp
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

goto copydone if inlenlow <= 0
  copyloop:
    y00 = *(uint8 *) (in + 0)
    in += 1
    *(uint8 *) (z + 0) = y00
    z += 1

                 inlenlow -= 1
goto copyloop if inlenlow > 0
copydone:

  y00 = 128
  *(uint8 *) (z + 0) = y00

  in = &tmp
  finalization = 1
  inlenlow = 32
  carry = 0
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

  *(unaligned uint32 *) (out + 0) left = x00
  *(unaligned uint32 *) (out + 0) right = x00
  *(unaligned uint32 *) (out + 4) left = x01
  *(unaligned uint32 *) (out + 4) right = x01
  *(unaligned uint32 *) (out + 8) left = x02
  *(unaligned uint32 *) (out + 8) right = x02
  *(unaligned uint32 *) (out + 12) left = x03
  *(unaligned uint32 *) (out + 12) right = x03
  *(unaligned uint32 *) (out + 16) left = x04
  *(unaligned uint32 *) (out + 16) right = x04
  *(unaligned uint32 *) (out + 20) left = x05
  *(unaligned uint32 *) (out + 20) right = x05
  *(unaligned uint32 *) (out + 24) left = x06
  *(unaligned uint32 *) (out + 24) right = x06
  *(unaligned uint32 *) (out + 28) left = x07
  *(unaligned uint32 *) (out + 28) right = x07

  x0b = x0b_stack
  x0c = x0c_stack
  x0d = x0d_stack
  x0e = x0e_stack
  x0f = x0f_stack

  *(unaligned uint32 *) (out + 32) left = x08
  *(unaligned uint32 *) (out + 32) right = x08
  *(unaligned uint32 *) (out + 36) left = x09
  *(unaligned uint32 *) (out + 36) right = x09
  *(unaligned uint32 *) (out + 40) left = x0a
  *(unaligned uint32 *) (out + 40) right = x0a
  *(unaligned uint32 *) (out + 44) left = x0b
  *(unaligned uint32 *) (out + 44) right = x0b
  *(unaligned uint32 *) (out + 48) left = x0c
  *(unaligned uint32 *) (out + 48) right = x0c
  *(unaligned uint32 *) (out + 52) left = x0d
  *(unaligned uint32 *) (out + 52) right = x0d
  *(unaligned uint32 *) (out + 56) left = x0e
  *(unaligned uint32 *) (out + 56) right = x0e
  *(unaligned uint32 *) (out + 60) left = x0f
  *(unaligned uint32 *) (out + 60) right = x0f

  result = 0

  i16 = i16_stack
  i17 = i17_stack
  i18 = i18_stack
  i19 = i19_stack
  i20 = i20_stack
  i21 = i21_stack
  i22 = i22_stack
  i23 = i23_stack
  i30 = i30_stack
  i31 = i31_stack

leave
