stack32 arg1
stack32 arg2
stack32 arg3

input arg1
input arg2
input arg3

int32 out
int32 in
int32 inlen

int6464 x0
int6464 x1
int6464 x2
int6464 x3
int6464 x4
int6464 x5
int6464 x6
int6464 x7
int6464 y0
int6464 y1
int6464 y2
int6464 y3

int32 i
int32 r
int32 source
int32 copy

stack128 tmp

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

stack128 x4_stack
stack128 x5_stack
stack128 x6_stack
stack128 x7_stack

int32 constants

enter crypto_hash_cubehash512_x86xmm

  eax_stack = eax
  ebx_stack = ebx
  esi_stack = esi
  edi_stack = edi
  ebp_stack = ebp

  in = arg2
  inlen = arg3

  y0 = 0
  tmp = y0

  constants = &crypto_hash_cubehash512_x86xmm_constants
  x5 = *(int128 *) (constants + 80)
  x7 = *(int128 *) (constants + 112)
  x4 = *(int128 *) (constants + 64)
  x6 = *(int128 *) (constants + 96)
  x0 = *(int128 *) (constants + 0)
  x1 = *(int128 *) (constants + 16)
  x2 = *(int128 *) (constants + 32)
  x3 = *(int128 *) (constants + 48)

  x5_stack = x5
  x7_stack = x7

                     signed<? inlen - 32
goto inlenbelow32 if signed<
mainloop:

  y0 = *(unaligned int128 *) (in + 0)
  y1 = *(unaligned int128 *) (in + 16)
  x0 ^= y0
  x1 ^= y1
  in += 32
  inlen -= 32
  r = 16

morerounds:

  uint32323232 x4 += x0
  uint32323232 x6 += x2
  y0 = x2
  uint32323232 y0 <<= 7
  uint32323232 x2 >>= 25
  y2 = x0
  uint32323232 y2 <<= 7
  uint32323232 x0 >>= 25
  y0 ^= x4
  y2 ^= x6
  y0 ^= x2
  y2 ^= x0
  x4 <<<= 64
  x6 <<<= 64

  x4_stack = x4
  x6_stack = x6
  x5 = x5_stack
  x7 = x7_stack

  uint32323232 x5 += x1
  uint32323232 x7 += x3
  y1 = x3
  uint32323232 y1 <<= 7
  uint32323232 x3 >>= 25
  y3 = x1
  uint32323232 y3 <<= 7
  uint32323232 x1 >>= 25
  y1 ^= x5
  y3 ^= x7
  y1 ^= x3
  y3 ^= x1
  x5 <<<= 64
  x7 <<<= 64

  x5_stack = x5
  x6 = x6_stack

  uint32323232 x6 += y2
  uint32323232 x7 += y3
  x2 = y3
  x3 = y2
  uint32323232 x2 <<= 11
  uint32323232 x3 <<= 11
  uint32323232 y2 >>= 21
  uint32323232 y3 >>= 21
  x2 ^= x6
  x3 ^= x7
  x2 ^= y3
  x3 ^= y2
  x6 = x6[1,0,3,2]
  x7 = x7[1,0,3,2]

  x6_stack = x6
  x7_stack = x7

  x4 = x4_stack
  x5 = x5_stack

  uint32323232 x4 += y0
  uint32323232 x5 += y1
  x0 = y1
  x1 = y0
  uint32323232 x0 <<= 11
  uint32323232 x1 <<= 11
  uint32323232 y0 >>= 21
  uint32323232 y1 >>= 21
  x0 ^= x4
  x1 ^= x5
  x0 ^= y1
  x1 ^= y0
  x4 = x4[1,0,3,2]
  x5 = x5[1,0,3,2]

  x5_stack = x5
  x6 = x6_stack

                   unsigned>? r -= 2

  uint32323232 x4 += x0
  uint32323232 x6 += x2
  y0 = x2
  uint32323232 y0 <<= 7
  uint32323232 x2 >>= 25
  y2 = x0
  uint32323232 y2 <<= 7
  uint32323232 x0 >>= 25
  y0 ^= x4
  y2 ^= x6
  y0 ^= x2
  y2 ^= x0
  x4 <<<= 64
  x6 <<<= 64

  x4_stack = x4
  x6_stack = x6
  x5 = x5_stack
  x7 = x7_stack

  uint32323232 x5 += x1
  uint32323232 x7 += x3
  y1 = x3
  uint32323232 y1 <<= 7
  uint32323232 x3 >>= 25
  y3 = x1
  uint32323232 y3 <<= 7
  uint32323232 x1 >>= 25
  y1 ^= x5
  y3 ^= x7
  y1 ^= x3
  y3 ^= x1
  x5 <<<= 64
  x7 <<<= 64

  x5_stack = x5
  x6 = x6_stack

  uint32323232 x6 += y2
  uint32323232 x7 += y3
  x2 = y3
  x3 = y2
  uint32323232 x2 <<= 11
  uint32323232 x3 <<= 11
  uint32323232 y2 >>= 21
  uint32323232 y3 >>= 21
  x2 ^= x6
  x3 ^= x7
  x2 ^= y3
  x3 ^= y2
  x6 = x6[1,0,3,2]
  x7 = x7[1,0,3,2]

  x6_stack = x6
  x7_stack = x7

  x4 = x4_stack
  x5 = x5_stack

  uint32323232 x4 += y0
  uint32323232 x5 += y1
  x0 = y1
  x1 = y0
  uint32323232 x0 <<= 11
  uint32323232 x1 <<= 11
  uint32323232 y0 >>= 21
  uint32323232 y1 >>= 21
  x0 ^= x4
  x1 ^= x5
  x0 ^= y1
  x1 ^= y0
  x4 = x4[1,0,3,2]
  x5 = x5[1,0,3,2]

  x5_stack = x5
  x6 = x6_stack

goto morerounds if unsigned>
                  signed<? inlen - 32
goto mainloop if !signed<
inlenbelow32:
                     signed<? inlen - 16
goto inlenbelow16 if signed<

  y0 = *(unaligned int128 *) (in + 0)
  x0 ^= y0

  in += 16
  inlen -= 16
  copy = &tmp
  while (inlen) { *copy++ = *in++; --inlen }
  i = 128
  *(uint8 *) (copy + 0) = i

  y1 = tmp
  x1 ^= y1
  r = 16
  inlen = -1

goto morerounds
inlenbelow16:
                    signed<? inlen - 0
goto inlenbelow0 if signed<

  copy = &tmp
  while (inlen) { *copy++ = *in++; --inlen }
  i = 128
  *(uint8 *) (copy + 0) = i

  y0 = tmp
  x0 ^= y0
  r = 16
  inlen = -1

goto morerounds
inlenbelow0:
                =? inlen + 1
goto finish if !=

  x7 = x7_stack
  x7 ^= *(int128 *) (constants + 128)
  x7_stack = x7
  r = 32
  inlen = -2

goto morerounds
finish:

  out = arg1
  *(unaligned int128 *) (out + 0) = x0
  *(unaligned int128 *) (out + 16) = x1
  *(unaligned int128 *) (out + 32) = x2
  *(unaligned int128 *) (out + 48) = x3

  eax = eax_stack
  ebx = ebx_stack
  esi = esi_stack
  edi = edi_stack
  ebp = ebp_stack

leave
