stack32 arg1
stack32 arg2
stack32 arg3
stack32 arg4

input arg1
input arg2
input arg3
input arg4

int32 out
int32 in
int32 inlenlow
int32 inlenhigh

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

int32 r
int32 finalization
stack256 tmp
int32 z

stack32 out_stack
stack32 in_stack
stack32 inlenlow_stack
stack32 inlenhigh_stack
stack32 finalization_stack
stack32 r_stack

# stack32 x00_stack
# stack32 x01_stack
int3232 x02_stack
int3232 x03_stack
int3232 x04_stack
int3232 x05_stack
int3232 x06_stack
int3232 x07_stack
int3232 x08_stack
int3232 x09_stack
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

int32 eax
int32 ebx
int32 esi
int32 edi
int32 ebp
caller eax
caller ebx
caller esi
caller edi
caller ebp
stack32 eax_stack
stack32 ebx_stack
stack32 esi_stack
stack32 edi_stack
stack32 ebp_stack

enter crypto_hash_cubehash512_x86

  eax_stack = eax
  ebx_stack = ebx
  esi_stack = esi
  edi_stack = edi
  ebp_stack = ebp

  out = arg1
  in = arg2
  inlenlow = arg3
  inlenhigh = arg4

  in_stack = in
  out_stack = out
  inlenlow_stack = inlenlow
  inlenhigh_stack = inlenhigh

  x08 = 0x9dc06f0a
  x09 = 0x4d197eb5
  x0a = 0xb6e17224
  x0b = 0x912e1aca
  x08_stack = x08
  x09_stack = x09
  x0a_stack = x0a
  x0b_stack = x0b

  x0c = 0x5270f5e1
  x0d = 0xd9efd0ec
  x0e = 0xf0fcf7c8
  x0f = 0x20d4074f
  x0c_stack = x0c
  x0d_stack = x0d
  x0e_stack = x0e
  x0f_stack = x0f

  x10 = 0x15547fee
  x11 = 0xf4839313
  x12 = 0x017c189c
  x13 = 0xaf1c332a
  x10_stack = x10
  x11_stack = x11
  x12_stack = x12
  x13_stack = x13

  x14 = 0xde4d7c8c
  x15 = 0x84997eec
  x16 = 0x5bd87a43
  x17 = 0xb6d3d055
  x14_stack = x14
  x15_stack = x15
  x16_stack = x16
  x17_stack = x17

  x18 = 0x3ae247b0
  x19 = 0x2b8cb0a6
  x1a = 0xd9d6ca35
  x1b = 0x4bf12b94
  x18_stack = x18
  x19_stack = x19
  x1a_stack = x1a
  x1b_stack = x1b

  x1c = 0x97f33a51
  x1d = 0x62fb84ad
  x1e = 0x7e70e613
  x1f = 0x520c709b
  x1c_stack = x1c
  x1d_stack = x1d
  x1e_stack = x1e
  x1f_stack = x1f

  x00 = 0x781f814f
  x01 = 0x18f45926
  x02 = 0x992b7520
  x03 = 0xc8237df7
  # x00_stack = x00
  # x01_stack = x01
  x02_stack = x02
  x03_stack = x03

  x04 = 0xe4e3ba88
  x05 = 0x7b0075ff
  x06 = 0x51916982
  x07 = 0x947c6147
  x04_stack = x04
  x05_stack = x05
  x06_stack = x06
  x07_stack = x07

  finalization = 0

checkinlen:
  inlenlow = inlenlow_stack
  inlenhigh = inlenhigh_stack

                  unsigned<? inlenlow - 32
goto mainloop if !unsigned<
                     =? inlenhigh - 0
goto inlenbelow32 if =

mainloop:

  carry? inlenlow -= 32
  inlenhigh -= 0 - carry

  finalization_stack = finalization
  inlenlow_stack = inlenlow
  inlenhigh_stack = inlenhigh

  in = in_stack

  # x00 = x00_stack
  # x01 = x01_stack
  x02 = x02_stack
  x03 = x03_stack
  x00 ^= *(uint32 *) (in + 0)
  x01 ^= *(uint32 *) (in + 4)
  x02 ^= *(uint32 *) (in + 8)
  x03 ^= *(uint32 *) (in + 12)
  # x00_stack = x00
  # x01_stack = x01
  x02_stack = x02
  x03_stack = x03

  x04 = x04_stack
  x05 = x05_stack
  x06 = x06_stack
  x07 = x07_stack
  x04 ^= *(uint32 *) (in + 16)
  x05 ^= *(uint32 *) (in + 20)
  x06 ^= *(uint32 *) (in + 24)
  x07 ^= *(uint32 *) (in + 28)
  x04_stack = x04
  x05_stack = x05
  x06_stack = x06
  x07_stack = x07

  r = 16

  in += 32
  in_stack = in

morerounds:

r_stack = r

# x00 = x00_stack
x10 = x10_stack
x08 = x08_stack
x18 = x18_stack
x10 += x00
x00 <<<= 7
x10_stack = x10
x18 += x08
x08 <<<= 7
x18_stack = x18
x00 ^= x18
# x00_stack = x00
x08 ^= x10
x08_stack = x08

x04 = x04_stack
x14 = x14_stack
x0c = x0c_stack
x1c = x1c_stack
x14 += x04
x04 <<<= 7
x14_stack = x14
x1c += x0c
x0c <<<= 7
x1c_stack = x1c
x04 ^= x1c
x04_stack = x04
x0c ^= x14
x0c_stack = x0c

x02 = x02_stack
x12 = x12_stack
x0a = x0a_stack
x1a = x1a_stack
x12 += x02
x02 <<<= 7
x12_stack = x12
x1a += x0a
x0a <<<= 7
x1a_stack = x1a
x02 ^= x1a
x02_stack = x02
x0a ^= x12
x0a_stack = x0a

x06 = x06_stack
x16 = x16_stack
x0e = x0e_stack
x1e = x1e_stack
x16 += x06
x06 <<<= 7
x16_stack = x16
x1e += x0e
x0e <<<= 7
x1e_stack = x1e
x06 ^= x1e
x06_stack = x06
x0e ^= x16
x0e_stack = x0e

# x01 = x01_stack
x11 = x11_stack
x09 = x09_stack
x19 = x19_stack
x11 += x01
x01 <<<= 7
x11_stack = x11
x19 += x09
x09 <<<= 7
x19_stack = x19
x01 ^= x19
# x01_stack = x01
x09 ^= x11
x09_stack = x09

x05 = x05_stack
x15 = x15_stack
x0d = x0d_stack
x1d = x1d_stack
x15 += x05
x05 <<<= 7
x15_stack = x15
x1d += x0d
x0d <<<= 7
x1d_stack = x1d
x05 ^= x1d
x05_stack = x05
x0d ^= x15
x0d_stack = x0d

x03 = x03_stack
x13 = x13_stack
x0b = x0b_stack
x1b = x1b_stack
x13 += x03
x03 <<<= 7
x13_stack = x13
x1b += x0b
x0b <<<= 7
x1b_stack = x1b
x03 ^= x1b
x03_stack = x03
x0b ^= x13
x0b_stack = x0b

x07 = x07_stack
x17 = x17_stack
x0f = x0f_stack
x1f = x1f_stack
x17 += x07
x07 <<<= 7
x17_stack = x17
x1f += x0f
x0f <<<= 7
x1f_stack = x1f
x07 ^= x1f
x07_stack = x07
x0f ^= x17
# x0f_stack = x0f

x0b = x0b_stack
x11 = x11_stack
# x0f = x0f_stack
x15 = x15_stack
x11 += x0b
x0b <<<= 11
x11_stack = x11
x15 += x0f
x0f <<<= 11
x15_stack = x15
x0b ^= x15
x0b_stack = x0b
x0f ^= x11
x0f_stack = x0f

x03 = x03_stack
x19 = x19_stack
x07 = x07_stack
x1d = x1d_stack
x19 += x03
x03 <<<= 11
x19_stack = x19
x1d += x07
x07 <<<= 11
x1d_stack = x1d
x03 ^= x1d
x03_stack = x03
x07 ^= x19
x07_stack = x07

x09 = x09_stack
x13 = x13_stack
x0d = x0d_stack
x17 = x17_stack
x13 += x09
x09 <<<= 11
x13_stack = x13
x17 += x0d
x0d <<<= 11
x17_stack = x17
x09 ^= x17
x09_stack = x09
x0d ^= x13
x0d_stack = x0d

# x01 = x01_stack
x1b = x1b_stack
x05 = x05_stack
x1f = x1f_stack
x1b += x01
x01 <<<= 11
x1b_stack = x1b
x1f += x05
x05 <<<= 11
x1f_stack = x1f
x01 ^= x1f
# x01_stack = x01
x05 ^= x1b
x05_stack = x05

x0a = x0a_stack
x10 = x10_stack
x0e = x0e_stack
x14 = x14_stack
x10 += x0a
x0a <<<= 11
x10_stack = x10
x14 += x0e
x0e <<<= 11
x14_stack = x14
x0a ^= x14
x0a_stack = x0a
x0e ^= x10
x0e_stack = x0e

x02 = x02_stack
x18 = x18_stack
x06 = x06_stack
x1c = x1c_stack
x18 += x02
x02 <<<= 11
x18_stack = x18
x1c += x06
x06 <<<= 11
x1c_stack = x1c
x02 ^= x1c
x02_stack = x02
x06 ^= x18
x06_stack = x06

x08 = x08_stack
x12 = x12_stack
x0c = x0c_stack
x16 = x16_stack
x12 += x08
x08 <<<= 11
x12_stack = x12
x16 += x0c
x0c <<<= 11
x16_stack = x16
x08 ^= x16
x08_stack = x08
x0c ^= x12
x0c_stack = x0c

# x00 = x00_stack
x1a = x1a_stack
x04 = x04_stack
x1e = x1e_stack
x1a += x00
x00 <<<= 11
x1a_stack = x1a
x1e += x04
x04 <<<= 11
x1e_stack = x1e
x00 ^= x1e
# x00_stack = x00
x04 ^= x1a
x04_stack = x04

# x00 = x00_stack
x1f = x1f_stack
x08 = x08_stack
x17 = x17_stack
x1f += x00
x00 <<<= 7
x1f_stack = x1f
x17 += x08
x08 <<<= 7
x17_stack = x17
x00 ^= x17
# x00_stack = x00
x08 ^= x1f
x08_stack = x08

x04 = x04_stack
x1b = x1b_stack
x0c = x0c_stack
x13 = x13_stack
x1b += x04
x04 <<<= 7
x1b_stack = x1b
x13 += x0c
x0c <<<= 7
x13_stack = x13
x04 ^= x13
x04_stack = x04
x0c ^= x1b
x0c_stack = x0c

x02 = x02_stack
x1d = x1d_stack
x0a = x0a_stack
x15 = x15_stack
x1d += x02
x02 <<<= 7
x1d_stack = x1d
x15 += x0a
x0a <<<= 7
x15_stack = x15
x02 ^= x15
x02_stack = x02
x0a ^= x1d
x0a_stack = x0a

x06 = x06_stack
x19 = x19_stack
x0e = x0e_stack
x11 = x11_stack
x19 += x06
x06 <<<= 7
x19_stack = x19
x11 += x0e
x0e <<<= 7
x11_stack = x11
x06 ^= x11
x06_stack = x06
x0e ^= x19
x0e_stack = x0e

# x01 = x01_stack
x1e = x1e_stack
x09 = x09_stack
x16 = x16_stack
x1e += x01
x01 <<<= 7
x1e_stack = x1e
x16 += x09
x09 <<<= 7
x16_stack = x16
x01 ^= x16
# x01_stack = x01
x09 ^= x1e
x09_stack = x09

x05 = x05_stack
x1a = x1a_stack
x0d = x0d_stack
x12 = x12_stack
x1a += x05
x05 <<<= 7
x1a_stack = x1a
x12 += x0d
x0d <<<= 7
x12_stack = x12
x05 ^= x12
x05_stack = x05
x0d ^= x1a
x0d_stack = x0d

x03 = x03_stack
x1c = x1c_stack
x0b = x0b_stack
x14 = x14_stack
x1c += x03
x03 <<<= 7
x1c_stack = x1c
x14 += x0b
x0b <<<= 7
x14_stack = x14
x03 ^= x14
x03_stack = x03
x0b ^= x1c
x0b_stack = x0b

x07 = x07_stack
x18 = x18_stack
x0f = x0f_stack
x10 = x10_stack
x18 += x07
x07 <<<= 7
x18_stack = x18
x10 += x0f
x0f <<<= 7
x10_stack = x10
x07 ^= x10
# x07_stack = x07
x0f ^= x18
x0f_stack = x0f

x03 = x03_stack
x16 = x16_stack
# x07 = x07_stack
x12 = x12_stack
x16 += x03
x03 <<<= 11
x16_stack = x16
x12 += x07
x07 <<<= 11
x12_stack = x12
x03 ^= x12
x03_stack = x03
x07 ^= x16
x07_stack = x07

x0b = x0b_stack
x1e = x1e_stack
x0f = x0f_stack
x1a = x1a_stack
x1e += x0b
x0b <<<= 11
x1e_stack = x1e
x1a += x0f
x0f <<<= 11
x1a_stack = x1a
x0b ^= x1a
x0b_stack = x0b
x0f ^= x1e
x0f_stack = x0f

# x01 = x01_stack
x14 = x14_stack
x05 = x05_stack
x10 = x10_stack
x14 += x01
x01 <<<= 11
x14_stack = x14
x10 += x05
x05 <<<= 11
x10_stack = x10
x01 ^= x10
# x01_stack = x01
x05 ^= x14
x05_stack = x05

x09 = x09_stack
x1c = x1c_stack
x0d = x0d_stack
x18 = x18_stack
x1c += x09
x09 <<<= 11
x1c_stack = x1c
x18 += x0d
x0d <<<= 11
x18_stack = x18
x09 ^= x18
x09_stack = x09
x0d ^= x1c
x0d_stack = x0d

x02 = x02_stack
x17 = x17_stack
x06 = x06_stack
x13 = x13_stack
x17 += x02
x02 <<<= 11
x17_stack = x17
x13 += x06
x06 <<<= 11
x13_stack = x13
x02 ^= x13
x02_stack = x02
x06 ^= x17
x06_stack = x06

x0a = x0a_stack
x1f = x1f_stack
x0e = x0e_stack
x1b = x1b_stack
x1f += x0a
x0a <<<= 11
x1f_stack = x1f
x1b += x0e
x0e <<<= 11
x1b_stack = x1b
x0a ^= x1b
x0a_stack = x0a
x0e ^= x1f
x0e_stack = x0e

# x00 = x00_stack
x15 = x15_stack
x04 = x04_stack
x11 = x11_stack
x15 += x00
x00 <<<= 11
x15_stack = x15
x11 += x04
x04 <<<= 11
x11_stack = x11
x00 ^= x11
# x00_stack = x00
x04 ^= x15
x04_stack = x04

x08 = x08_stack
x1d = x1d_stack
x0c = x0c_stack
x19 = x19_stack
x1d += x08
x08 <<<= 11
x1d_stack = x1d
x19 += x0c
x0c <<<= 11
x19_stack = x19
x08 ^= x19
x08_stack = x08
x0c ^= x1d
x0c_stack = x0c

r = r_stack
                   unsigned>? r -= 2
goto morerounds if unsigned>

  finalization = finalization_stack

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

  while (inlenlow) { *z++ = *in++; --inlenlow }

  y00 = 128
  *(uint8 *) (z + 0) = y00

  in = &tmp
  in_stack = in
  finalization = 1
  inlenlow = 32
  goto mainloop

finalization1:
  x1f = x1f_stack
  x1f ^= 1
  x1f_stack = x1f
  r = 32
  finalization = 2
  finalization_stack = finalization
  inlenlow_stack = inlenlow
  inlenhigh_stack = inlenhigh
goto morerounds

finalization2:

  out = out_stack

  # x00 = x00_stack
  # x01 = x01_stack
  x02 = x02_stack
  x03 = x03_stack

  *(uint32 *) (out + 0) = x00
  *(uint32 *) (out + 4) = x01
  *(uint32 *) (out + 8) = x02
  *(uint32 *) (out + 12) = x03

  x04 = x04_stack
  x05 = x05_stack
  x06 = x06_stack
  x07 = x07_stack

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

  x0c = x0c_stack
  x0d = x0d_stack
  x0e = x0e_stack
  x0f = x0f_stack

  *(uint32 *) (out + 48) = x0c
  *(uint32 *) (out + 52) = x0d
  *(uint32 *) (out + 56) = x0e
  *(uint32 *) (out + 60) = x0f

  emms

  eax = eax_stack
  ebx = ebx_stack
  esi = esi_stack
  edi = edi_stack
  ebp = ebp_stack

leave
