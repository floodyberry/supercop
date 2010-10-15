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

int64 y00

int64 r
int64 finalization
stack256 tmp
int64 z

stack64 out_stack
stack64 in_stack
stack64 inlen_stack
stack32 finalization_stack
stack32 r_stack

stack32 x07_stack
stack32 x08_stack
stack32 x09_stack
stack32 x0a_stack
stack32 x0b_stack
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

int64 r11
int64 r12
int64 r13
int64 r14
int64 r15
int64 rbx
int64 rbp
caller r11
caller r12
caller r13
caller r14
caller r15
caller rbx
caller rbp
stack64 r11_stack
stack64 r12_stack
stack64 r13_stack
stack64 r14_stack
stack64 r15_stack
stack64 rbx_stack
stack64 rbp_stack

enter crypto_hash_cubehash512_amd64_32

  out_stack = out
  inlen_stack = inlen

  r11_stack = r11
  r12_stack = r12
  r13_stack = r13
  r14_stack = r14
  r15_stack = r15
  rbx_stack = rbx
  rbp_stack = rbp

  x08 = 0x9dc06f0a
  x09 = 0x4d197eb5
  x0a = 0xb6e17224
  x0b = 0x912e1aca
  x0c = 0x5270f5e1
  x0d = 0xd9efd0ec
  x0e = 0xf0fcf7c8
  x0f = 0x20d4074f

  x08_stack = x08
  x09_stack = x09
  x0a_stack = x0a
  x0b_stack = x0b

  x10 = 0x15547fee
  x11 = 0xf4839313
  x12 = 0x017c189c
  x13 = 0xaf1c332a
  x14 = 0xde4d7c8c
  x15 = 0x84997eec
  x16 = 0x5bd87a43
  x17 = 0xb6d3d055

  x10_stack = x10
  x11_stack = x11
  x12_stack = x12
  x13_stack = x13
  x14_stack = x14
  x15_stack = x15
  x16_stack = x16
  x17_stack = x17

  x18 = 0x3ae247b0
  x19 = 0x2b8cb0a6
  x1a = 0xd9d6ca35
  x1b = 0x4bf12b94
  x1c = 0x97f33a51
  x1d = 0x62fb84ad
  x1e = 0x7e70e613
  x1f = 0x520c709b

  x18_stack = x18
  x19_stack = x19
  x1a_stack = x1a
  x1b_stack = x1b
  x1c_stack = x1c
  x1d_stack = x1d
  x1e_stack = x1e
  x1f_stack = x1f

  x00 = 0x781f814f
  x01 = 0x18f45926
  x02 = 0x992b7520
  x03 = 0xc8237df7
  x04 = 0xe4e3ba88
  x05 = 0x7b0075ff
  x06 = 0x51916982
  x07 = 0x947c6147

  x07_stack = x07

  finalization = 0

checkinlen:
  inlen = inlen_stack
                     unsigned<? inlen -= 32
goto inlenbelow32 if unsigned<

mainloop:

  r = 16

  finalization_stack = finalization
  inlen_stack = inlen

  (uint32) x00 ^= *(uint32 *) (in + 0)
  (uint32) x01 ^= *(uint32 *) (in + 4)
  (uint32) x02 ^= *(uint32 *) (in + 8)
  (uint32) x03 ^= *(uint32 *) (in + 12)

  x07 = x07_stack
  (uint32) x04 ^= *(uint32 *) (in + 16)
  (uint32) x05 ^= *(uint32 *) (in + 20)
  (uint32) x06 ^= *(uint32 *) (in + 24)
  (uint32) x07 ^= *(uint32 *) (in + 28)
  x07_stack = x07

  in += 32
  in_stack = in

morerounds:

r_stack = r

x10 = x10_stack
x08 = x08_stack
x18 = x18_stack
(uint32) x10 += x00
x10_stack = x10
(uint32) x18 += x08
x18_stack = x18
(uint32) x00 <<<= 7
(uint32) x08 <<<= 7
(uint32) x00 ^= x18
(uint32) x08 ^= x10
  x14 = x14_stack
  x1c = x1c_stack
x08_stack = x08
  (uint32) x14 += x04
  x14_stack = x14
  (uint32) x1c += x0c
  x1c_stack = x1c
  (uint32) x04 <<<= 7
  (uint32) x0c <<<= 7
x12 = x12_stack
  (uint32) x04 ^= x1c
x0a = x0a_stack
  (uint32) x0c ^= x14
x1a = x1a_stack
(uint32) x12 += x02
x12_stack = x12
(uint32) x1a += x0a
x1a_stack = x1a
(uint32) x02 <<<= 7
(uint32) x0a <<<= 7
(uint32) x02 ^= x1a
(uint32) x0a ^= x12
  x16 = x16_stack
  x1e = x1e_stack
x0a_stack = x0a
  (uint32) x16 += x06
  x16_stack = x16
  (uint32) x1e += x0e
  x1e_stack = x1e
  (uint32) x06 <<<= 7
  (uint32) x0e <<<= 7
x11 = x11_stack
  (uint32) x06 ^= x1e
x09 = x09_stack
  (uint32) x0e ^= x16
x19 = x19_stack
(uint32) x11 += x01
x11_stack = x11
(uint32) x19 += x09
x19_stack = x19
(uint32) x01 <<<= 7
(uint32) x09 <<<= 7
  x15 = x15_stack
(uint32) x01 ^= x19
  x1d = x1d_stack
(uint32) x09 ^= x11
x09_stack = x09
  (uint32) x15 += x05
  x15_stack = x15
  (uint32) x1d += x0d
  x1d_stack = x1d
  (uint32) x05 <<<= 7
  (uint32) x0d <<<= 7
x13 = x13_stack
  (uint32) x05 ^= x1d
x0b = x0b_stack
  (uint32) x0d ^= x15
x1b = x1b_stack
(uint32) x13 += x03
x13_stack = x13
(uint32) x1b += x0b
x1b_stack = x1b
(uint32) x03 <<<= 7
(uint32) x0b <<<= 7
(uint32) x03 ^= x1b
(uint32) x0b ^= x13
  x07 = x07_stack
  x17 = x17_stack
  x1f = x1f_stack
x0b_stack = x0b
  (uint32) x17 += x07
  (uint32) x1f += x0f
  x1f_stack = x1f
  (uint32) x07 <<<= 7
  (uint32) x0f <<<= 7
  (uint32) x07 ^= x1f
  (uint32) x0f ^= x17
# x17 reused
x09 = x09_stack
x13 = x13_stack
(uint32) x13 += x09
x13_stack = x13
(uint32) x17 += x0d
x17_stack = x17
(uint32) x09 <<<= 11
(uint32) x0d <<<= 11
(uint32) x09 ^= x17
  x0b = x0b_stack
(uint32) x0d ^= x13
  x11 = x11_stack
x09_stack = x09
  x15 = x15_stack
  (uint32) x11 += x0b
  x11_stack = x11
  (uint32) x15 += x0f
  x15_stack = x15
  (uint32) x0b <<<= 11
  (uint32) x0f <<<= 11
  (uint32) x0b ^= x15
  (uint32) x0f ^= x11
x19 = x19_stack
x1d = x1d_stack
  x0b_stack = x0b
(uint32) x19 += x03
x19_stack = x19
(uint32) x1d += x07
x1d_stack = x1d
(uint32) x03 <<<= 11
(uint32) x07 <<<= 11
(uint32) x03 ^= x1d
(uint32) x07 ^= x19

  x1b = x1b_stack
  x1f = x1f_stack
  (uint32) x1b += x01
  x1b_stack = x1b
  (uint32) x1f += x05
  x1f_stack = x1f
  (uint32) x01 <<<= 11
  (uint32) x05 <<<= 11
  (uint32) x01 ^= x1f
  (uint32) x05 ^= x1b
x0a = x0a_stack
x10 = x10_stack
x14 = x14_stack
(uint32) x10 += x0a
x10_stack = x10
(uint32) x14 += x0e
x14_stack = x14
(uint32) x0a <<<= 11
(uint32) x0e <<<= 11
(uint32) x0a ^= x14
x0a_stack = x0a
(uint32) x0e ^= x10

  x18 = x18_stack
  x1c = x1c_stack
  (uint32) x18 += x02
  x18_stack = x18
  (uint32) x1c += x06
  x1c_stack = x1c
  (uint32) x02 <<<= 11
  (uint32) x06 <<<= 11
  (uint32) x02 ^= x1c
  (uint32) x06 ^= x18

x1a = x1a_stack
x1e = x1e_stack
(uint32) x1a += x00
x1a_stack = x1a
(uint32) x1e += x04
x1e_stack = x1e
(uint32) x00 <<<= 11
(uint32) x04 <<<= 11
(uint32) x00 ^= x1e
(uint32) x04 ^= x1a

  x08 = x08_stack
  x12 = x12_stack
  x16 = x16_stack
  (uint32) x12 += x08
  x12_stack = x12
  (uint32) x16 += x0c
  x16_stack = x16
  (uint32) x08 <<<= 11
  (uint32) x0c <<<= 11
  (uint32) x08 ^= x16
  (uint32) x0c ^= x12
# x08 reused
x1f = x1f_stack
x17 = x17_stack
(uint32) x1f += x00
x1f_stack = x1f
(uint32) x17 += x08
x17_stack = x17
(uint32) x00 <<<= 7
(uint32) x08 <<<= 7
(uint32) x00 ^= x17
(uint32) x08 ^= x1f
x08_stack = x08

  x1b = x1b_stack
  x13 = x13_stack
  (uint32) x1b += x04
  x1b_stack = x1b
  (uint32) x13 += x0c
  x13_stack = x13
  (uint32) x04 <<<= 7
  (uint32) x0c <<<= 7
  (uint32) x04 ^= x13
  (uint32) x0c ^= x1b

x1d = x1d_stack
x0a = x0a_stack
x15 = x15_stack
(uint32) x1d += x02
x1d_stack = x1d
(uint32) x15 += x0a
x15_stack = x15
(uint32) x02 <<<= 7
(uint32) x0a <<<= 7
(uint32) x02 ^= x15
(uint32) x0a ^= x1d
x0a_stack = x0a

  x19 = x19_stack
  x11 = x11_stack
  (uint32) x19 += x06
  x19_stack = x19
  (uint32) x11 += x0e
  x11_stack = x11
  (uint32) x06 <<<= 7
  (uint32) x0e <<<= 7
  (uint32) x06 ^= x11
  (uint32) x0e ^= x19

x1e = x1e_stack
x09 = x09_stack
x16 = x16_stack
(uint32) x1e += x01
x1e_stack = x1e
(uint32) x16 += x09
x16_stack = x16
(uint32) x01 <<<= 7
(uint32) x09 <<<= 7
(uint32) x01 ^= x16
(uint32) x09 ^= x1e
x09_stack = x09

  x1a = x1a_stack
  x12 = x12_stack
  (uint32) x1a += x05
  x1a_stack = x1a
  (uint32) x12 += x0d
  x12_stack = x12
  (uint32) x05 <<<= 7
  (uint32) x0d <<<= 7
  (uint32) x05 ^= x12
  (uint32) x0d ^= x1a

x18 = x18_stack
x10 = x10_stack
(uint32) x18 += x07
x18_stack = x18
(uint32) x10 += x0f
x10_stack = x10
(uint32) x07 <<<= 7
(uint32) x0f <<<= 7
(uint32) x07 ^= x10
(uint32) x0f ^= x18

  x1c = x1c_stack
  x0b = x0b_stack
  x14 = x14_stack
  (uint32) x1c += x03
  x1c_stack = x1c
  (uint32) x14 += x0b
  x14_stack = x14
  (uint32) x03 <<<= 7
  (uint32) x0b <<<= 7
  (uint32) x03 ^= x14
  (uint32) x0b ^= x1c
# x0b reused
x1e = x1e_stack
x1a = x1a_stack
(uint32) x1e += x0b
x1e_stack = x1e
(uint32) x1a += x0f
x1a_stack = x1a
(uint32) x0b <<<= 11
(uint32) x0f <<<= 11
(uint32) x0b ^= x1a
x0b_stack = x0b
(uint32) x0f ^= x1e

  x16 = x16_stack
  x12 = x12_stack
  (uint32) x16 += x03
  x16_stack = x16
  (uint32) x12 += x07
  x12_stack = x12
  (uint32) x03 <<<= 11
  (uint32) x07 <<<= 11
  (uint32) x03 ^= x12
  (uint32) x07 ^= x16

x07_stack = x07

x14 = x14_stack
x10 = x10_stack
(uint32) x14 += x01
x14_stack = x14
(uint32) x10 += x05
x10_stack = x10
(uint32) x01 <<<= 11
(uint32) x05 <<<= 11
(uint32) x01 ^= x10
(uint32) x05 ^= x14

  x09 = x09_stack
  x1c = x1c_stack
  x18 = x18_stack
  (uint32) x1c += x09
  x1c_stack = x1c
  (uint32) x18 += x0d
  x18_stack = x18
  (uint32) x09 <<<= 11
  (uint32) x0d <<<= 11
  (uint32) x09 ^= x18
  x09_stack = x09
  (uint32) x0d ^= x1c

x17 = x17_stack
x13 = x13_stack
(uint32) x17 += x02
x17_stack = x17
(uint32) x13 += x06
x13_stack = x13
(uint32) x02 <<<= 11
(uint32) x06 <<<= 11
(uint32) x02 ^= x13
(uint32) x06 ^= x17

  x0a = x0a_stack
  x1f = x1f_stack
  x1b = x1b_stack
  (uint32) x1f += x0a
  x1f_stack = x1f
  (uint32) x1b += x0e
  x1b_stack = x1b
  (uint32) x0a <<<= 11
  (uint32) x0e <<<= 11
  (uint32) x0a ^= x1b
  x0a_stack = x0a
  (uint32) x0e ^= x1f

x15 = x15_stack
x11 = x11_stack
(uint32) x15 += x00
x15_stack = x15
(uint32) x11 += x04
x11_stack = x11
(uint32) x00 <<<= 11
(uint32) x04 <<<= 11
(uint32) x00 ^= x11
(uint32) x04 ^= x15

  x08 = x08_stack
  x1d = x1d_stack
  x19 = x19_stack
                   r = r_stack
  (uint32) x1d += x08
  x1d_stack = x1d
  (uint32) x19 += x0c
  x19_stack = x19
  (uint32) x08 <<<= 11
  (uint32) x0c <<<= 11
  (uint32) x08 ^= x19
  x08_stack = x08
  (uint32) x0c ^= x1d

                   unsigned>? r -= 2
goto morerounds if unsigned>

  finalization = finalization_stack
  in = in_stack

goto checkinlen

inlenbelow32:

  inlen += 32

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

  while (inlen) { *z++ = *in++; --inlen }

  y00 = 128
  *(uint8 *) (z + 0) = y00

  in = &tmp
  finalization = 1
  goto mainloop

finalization1:
  x1f = x1f_stack
  (uint32) x1f ^= 1
  x1f_stack = x1f
  r = 32
  finalization = 2
  finalization_stack = finalization
  in_stack = in
  inlen_stack = inlen
goto morerounds

finalization2:

  out = out_stack

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
  x0a = x0a_stack
  x0b = x0b_stack

  *(uint32 *) (out + 32) = x08
  *(uint32 *) (out + 36) = x09
  *(uint32 *) (out + 40) = x0a
  *(uint32 *) (out + 44) = x0b
  *(uint32 *) (out + 48) = x0c
  *(uint32 *) (out + 52) = x0d
  *(uint32 *) (out + 56) = x0e
  *(uint32 *) (out + 60) = x0f

  r11 = r11_stack
  r12 = r12_stack
  r13 = r13_stack
  r14 = r14_stack
  r15 = r15_stack
  rbx = rbx_stack
  rbp = rbp_stack

  result = 0

leave
