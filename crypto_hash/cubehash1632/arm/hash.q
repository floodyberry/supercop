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
stack32 x03_stack
stack32 x04_stack
stack32 x05_stack
stack32 x06_stack
stack32 x07_stack
stack32 x08_stack
stack32 x09_stack
stack32 x0a_stack
stack32 x0b_stack
stack32 x0c_stack
stack32 x0d_stack
stack32 x0e_stack
stack32 x0f_stack
stack32 x10_stack
stack32 x11_stack
stack32 x12_stack
stack32 x13_stack
stack32 x14_stack
stack32 x15_stack
stack32 x16_stack
stack32 x17_stack
stack32 x18_stack
stack32 x19_stack
stack32 x1a_stack
stack32 x1b_stack
stack32 x1c_stack
stack32 x1d_stack
stack32 x1e_stack
stack32 x1f_stack

enter crypto_hash_cubehash1632_arm

  out_stack = out

  x08 = 0x4d42c787
  x09 = 0xa647a8b3
  x0a = 0x97cf0bef
  x0b = 0x825b4537
  x0c = 0xeef864d2
  x0d = 0xf22090c4
  x0e = 0xd0e5cd33
  x0f = 0xa23911ae

  x08_stack = x08
  x09_stack = x09
  x0b_stack = x0b
  x0c_stack = x0c
  x0d_stack = x0d
  x0e_stack = x0e
  x0f_stack = x0f

  x10 = 0xfcd398d9
  x11 = 0x148fe485
  x12 = 0x1b017bef
  x13 = 0xb6444532
  x14 = 0x6a536159
  x15 = 0x2ff5781c
  x16 = 0x91fa7934
  x17 = 0x0dbadea9

  x10_stack = x10
  x11_stack = x11
  x12_stack = x12
  x13_stack = x13
  x14_stack = x14
  x15_stack = x15
  x16_stack = x16
  x17_stack = x17

  x18 = 0xd65c8a2b
  x19 = 0xa5a70e75
  x1a = 0xb1c62456
  x1b = 0xbc796576
  x1c = 0x1921c8f7
  x1d = 0xe7989af1
  x1e = 0x7795d246
  x1f = 0xd43e3b44

  x18_stack = x18
  x19_stack = x19
  x1a_stack = x1a
  x1b_stack = x1b
  x1c_stack = x1c
  x1d_stack = x1d
  x1e_stack = x1e
  x1f_stack = x1f

  x00 = 0x2aea2a61
  x01 = 0x50f494d4
  x02 = 0x2d538b8b
  x03 = 0x4167d83e
  x04 = 0x3fee2313
  x05 = 0xc701cf8c
  x06 = 0xcc39968e
  x07 = 0x50ac5695

  x03_stack = x03
  x04_stack = x04
  x05_stack = x05
  x06_stack = x06
  x07_stack = x07

  finalization = 0

checkinlen:
                  unsigned<? inlenlow - 32
goto mainloop if !unsigned<
                     =? inlenhigh - 0
goto inlenbelow32 if =

mainloop:

  carry? inlenlow -= 32
  inlenhigh -= 0 - carry
  r = 16

  finalization_stack = finalization
  inlenlow_stack = inlenlow
  inlenhigh_stack = inlenhigh

  x03 = x03_stack
  y00 = *(uint32 *) in; in += 4
  y01 = *(uint32 *) in; in += 4
  y02 = *(uint32 *) in; in += 4
  y03 = *(uint32 *) in; in += 4
  x00 ^= y00
  x01 ^= y01
  x02 ^= y02
  x03 ^= y03
  x03_stack = x03

  x04 = x04_stack
  x05 = x05_stack
  y04 = *(uint32 *) in; in += 4
  y05 = *(uint32 *) in; in += 4
  x04 ^= y04
  x05 ^= y05
  x04_stack = x04
  x05_stack = x05

  x06 = x06_stack
  x07 = x07_stack
  y06 = *(uint32 *) in; in += 4
  y07 = *(uint32 *) in; in += 4
  x06 ^= y06
  x07 ^= y07
  x06_stack = x06
  x07_stack = x07

  in_stack = in

morerounds:

r_stack = r

  x08 = x08_stack
  x10 = x10_stack
  x12 = x12_stack
  x18 = x18_stack
  x1a = x1a_stack

  x10 += x00
  x12 += x02
  x18 += x08
  x1a += x0a
  x00 = x18 ^ (x00 >>> 25)
  x02 = x1a ^ (x02 >>> 25)
  x08 = x10 ^ (x08 >>> 25)
  x0a = x12 ^ (x0a >>> 25)
  x1a += x00
  x18 += x02
  x12 += x08
  x10 += x0a

  x02_stack = x02
  x08_stack = x08
  x0a_stack = x0a
  x10_stack = x10
  x12_stack = x12
  x18_stack = x18
  x1a_stack = x1a

  x04 = x04_stack
  x06 = x06_stack
  x0c = x0c_stack
  x0e = x0e_stack
  x14 = x14_stack
  x16 = x16_stack
  x1c = x1c_stack
  x1e = x1e_stack

  x14 += x04
  x16 += x06
  x1c += x0c
  x1e += x0e
  x04 = x1c ^ (x04 >>> 25)
  x06 = x1e ^ (x06 >>> 25)
  x0c = x14 ^ (x0c >>> 25)
  x0e = x16 ^ (x0e >>> 25)
  x1e += x04
  x1c += x06
  x16 += x0c
  x14 += x0e

  x04_stack = x04
  x06_stack = x06
  x0c_stack = x0c
  x0e_stack = x0e
  x14_stack = x14
  x16_stack = x16
  x1c_stack = x1c
  x1e_stack = x1e

  x03 = x03_stack
  x09 = x09_stack
  x0b = x0b_stack
  x11 = x11_stack
  x13 = x13_stack
  x19 = x19_stack
  x1b = x1b_stack
  
  x11 += x01
  x13 += x03
  x19 += x09
  x1b += x0b
  x01 = x19 ^ (x01 >>> 25)
  x03 = x1b ^ (x03 >>> 25)
  x09 = x11 ^ (x09 >>> 25)
  x0b = x13 ^ (x0b >>> 25)
  x1b += x01
  x19 += x03
  x13 += x09
  x11 += x0b
  
  x03_stack = x03
  x09_stack = x09
  x0b_stack = x0b
  x11_stack = x11
  x13_stack = x13
  x19_stack = x19
  x1b_stack = x1b

  x05 = x05_stack
  x07 = x07_stack
  x0d = x0d_stack
  x0f = x0f_stack
  x15 = x15_stack
  x17 = x17_stack
  x1d = x1d_stack
  x1f = x1f_stack

  x15 += x05
  x17 += x07
  x1d += x0d
  x1f += x0f
  x05 = x1d ^ (x05 >>> 25)
  x07 = x1f ^ (x07 >>> 25)
  x0d = x15 ^ (x0d >>> 25)
  x0f = x17 ^ (x0f >>> 25)
  x1f += x05
  x1d += x07
  x17 += x0d
  x15 += x0f
  
  x05_stack = x05
  x07_stack = x07
  x0d_stack = x0d
  x0f_stack = x0f

  x1e = x1e_stack
  x16 = x16_stack
  x08 = x08_stack
  x09 = x09_stack

  x15_stack = x15
  x1d_stack = x1d

  x00 = x1e ^ (x00 >>> 21)
  x01 = x1f ^ (x01 >>> 21)
  x08 = x16 ^ (x08 >>> 21)
  x09 = x17 ^ (x09 >>> 21)
  x1f += x00
  x1e += x01
  x17 += x08
  x16 += x09
  x00 = x17 ^ (x00 >>> 25)
  x01 = x16 ^ (x01 >>> 25)
  x08 = x1f ^ (x08 >>> 25)
  x09 = x1e ^ (x09 >>> 25)

  x08_stack = x08
  x09_stack = x09
  x1e_stack = x1e
  x1f_stack = x1f
  x16_stack = x16
  x17_stack = x17

  x02 = x02_stack
  x03 = x03_stack
  x0a = x0a_stack
  x0b = x0b_stack
  x1c = x1c_stack
  x1d = x1d_stack
  x14 = x14_stack
  x15 = x15_stack
  
  x02 = x1c ^ (x02 >>> 21)
  x03 = x1d ^ (x03 >>> 21)
  x0a = x14 ^ (x0a >>> 21)
  x0b = x15 ^ (x0b >>> 21)
  x1d += x02
  x1c += x03
  x15 += x0a
  x14 += x0b
  x02 = x15 ^ (x02 >>> 25)
  x03 = x14 ^ (x03 >>> 25)
  x0a = x1d ^ (x0a >>> 25)
  x0b = x1c ^ (x0b >>> 25)

  x02_stack = x02
  x03_stack = x03
  x0a_stack = x0a
  x0b_stack = x0b
  x1d_stack = x1d
  x1c_stack = x1c
  x15_stack = x15
  x14_stack = x14

  x04 = x04_stack
  x05 = x05_stack
  x0c = x0c_stack
  x0d = x0d_stack
  x1a = x1a_stack
  x1b = x1b_stack
  x12 = x12_stack
  x13 = x13_stack
  
  x04 = x1a ^ (x04 >>> 21)
  x05 = x1b ^ (x05 >>> 21)
  x0c = x12 ^ (x0c >>> 21)
  x0d = x13 ^ (x0d >>> 21)
  x1b += x04
  x1a += x05
  x13 += x0c
  x12 += x0d
  x04 = x13 ^ (x04 >>> 25)
  x05 = x12 ^ (x05 >>> 25)
  x0c = x1b ^ (x0c >>> 25)
  x0d = x1a ^ (x0d >>> 25)

  x04_stack = x04
  x05_stack = x05
  x0c_stack = x0c
  x0d_stack = x0d
  x1b_stack = x1b
  x1a_stack = x1a
  x13_stack = x13
  x12_stack = x12

  x06 = x06_stack
  x07 = x07_stack
  x0e = x0e_stack
  x0f = x0f_stack
  x18 = x18_stack
  x19 = x19_stack
  x10 = x10_stack
  x11 = x11_stack
  
  x06 = x18 ^ (x06 >>> 21)
  x07 = x19 ^ (x07 >>> 21)
  x0e = x10 ^ (x0e >>> 21)
  x0f = x11 ^ (x0f >>> 21)
  x19 += x06
  x18 += x07
  x11 += x0e
  x10 += x0f
  x06 = x11 ^ (x06 >>> 25)
  x07 = x10 ^ (x07 >>> 25)
  x0e = x19 ^ (x0e >>> 25)
  x0f = x18 ^ (x0f >>> 25)

  x06_stack = x06
  x07_stack = x07
  x0e_stack = x0e
  x0f_stack = x0f
  x19_stack = x19
  x18_stack = x18
  x11_stack = x11
  x10_stack = x10

  x04 = x04_stack
  x05 = x05_stack
  x0c = x0c_stack
  x0d = x0d_stack
  x11 = x11_stack
  x10 = x10_stack
  x19 = x19_stack
  x18 = x18_stack
  
  x11 += x04
  x10 += x05
  x19 += x0c
  x18 += x0d
  
  x11_stack = x11
  x10_stack = x10
  x19_stack = x19
  x18_stack = x18
  
  x08 = x08_stack
  x09 = x09_stack
  x15 = x15_stack
  x14 = x14_stack
  x1d = x1d_stack
  x1c = x1c_stack
  
  x15 += x00
  x14 += x01
  x1d += x08
  x1c += x09
  
  x04 = x04_stack
  x05 = x05_stack
  x0c = x0c_stack
  x0d = x0d_stack

  x04 = x15 ^ (x04 >>> 21)
  x05 = x14 ^ (x05 >>> 21)
  x0c = x1d ^ (x0c >>> 21)
  x0d = x1c ^ (x0d >>> 21)

  x15_stack = x15
  x14_stack = x14
  x1d_stack = x1d
  x1c_stack = x1c
  x04_stack = x04
  x05_stack = x05
  x0c_stack = x0c
  x0d_stack = x0d
  
  x11 = x11_stack
  x10 = x10_stack
  x19 = x19_stack
  x18 = x18_stack

  x00 = x11 ^ (x00 >>> 21)
  x01 = x10 ^ (x01 >>> 21)
  x08 = x19 ^ (x08 >>> 21)
  x09 = x18 ^ (x09 >>> 21)
  
  x08_stack = x08
  x09_stack = x09
  
  x06 = x06_stack
  x07 = x07_stack
  x0e = x0e_stack
  x0f = x0f_stack
  x13 = x13_stack
  x12 = x12_stack
  x1b = x1b_stack
  x1a = x1a_stack

  x13 += x06
  x12 += x07
  x1b += x0e
  x1a += x0f
  
  x13_stack = x13
  x12_stack = x12
  x1b_stack = x1b
  x1a_stack = x1a

  x02 = x02_stack
  x03 = x03_stack
  x0a = x0a_stack
  x0b = x0b_stack
  x17 = x17_stack
  x16 = x16_stack
  x1f = x1f_stack
  x1e = x1e_stack

  x17 += x02
  x16 += x03
  x1f += x0a
  x1e += x0b
  
  x06 = x06_stack
  x07 = x07_stack
  x0e = x0e_stack
  x0f = x0f_stack

  x06 = x17 ^ (x06 >>> 21)
  x07 = x16 ^ (x07 >>> 21)
  x0e = x1f ^ (x0e >>> 21)
  x0f = x1e ^ (x0f >>> 21)

  x17_stack = x17
  x16_stack = x16
  x1f_stack = x1f
  x1e_stack = x1e
  x06_stack = x06
  x07_stack = x07
  x0e_stack = x0e
  x0f_stack = x0f

  x13 = x13_stack
  x12 = x12_stack
  x1b = x1b_stack
  x1a = x1a_stack
  
r = r_stack

  x02 = x13 ^ (x02 >>> 21)
  x03 = x12 ^ (x03 >>> 21)
  x0a = x1b ^ (x0a >>> 21)
  x0b = x1a ^ (x0b >>> 21)

  x03_stack = x03
  x0b_stack = x0b

                   unsigned>? r -= 2
goto morerounds if unsigned>

  finalization = finalization_stack
  in = in_stack
  inlenlow = inlenlow_stack
  inlenhigh = inlenhigh_stack

goto checkinlen

inlenbelow32:

                      =? finalization - 1
goto finalization1 if =
                      =? finalization - 2
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

                 =? inlenlow - 0
goto copydone if =
  copyloop:
    y00 = *(uint8 *) in; in += 1
    *(uint8 *) z = y00; z += 1

                 unsigned>? inlenlow -= 1
goto copyloop if unsigned>
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

  x03 = x03_stack
  x04 = x04_stack
  x05 = x05_stack
  x06 = x06_stack
  x07 = x07_stack

  *(uint32 *) (out + 0) = x00
  *(uint32 *) (out + 4) = x01
  *(uint32 *) (out + 8) = x02
  *(uint32 *) (out + 12) = x03
  *(uint32 *) (out + 16) = x04
  *(uint32 *) (out + 20) = x05
  *(uint32 *) (out + 24) = x06
  *(uint32 *) (out + 28) = x07

  x08 = x08_stack
  x09 = x09_stack
  x0b = x0b_stack
  x0c = x0c_stack
  x0d = x0d_stack
  x0e = x0e_stack
  x0f = x0f_stack

  *(uint32 *) (out + 32) = x08
  *(uint32 *) (out + 36) = x09
  *(uint32 *) (out + 40) = x0a
  *(uint32 *) (out + 44) = x0b
  *(uint32 *) (out + 48) = x0c
  *(uint32 *) (out + 52) = x0d
  *(uint32 *) (out + 56) = x0e
  *(uint32 *) (out + 60) = x0f

  result = 0

leave
