int64 arg1
int64 arg2
int64 arg3

input arg1
input arg2
input arg3

int64 out
int64 in
int64 inlen

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

int64 i
int64 r
int64 source
int64 copy

stack128 tmp

int64 constants

int64 r11_caller
int64 r12_caller
int64 r13_caller
int64 r14_caller
int64 r15_caller
int64 rbx_caller
int64 rbp_caller
caller r11_caller
caller r12_caller
caller r13_caller
caller r14_caller
caller r15_caller
caller rbx_caller
caller rbp_caller

enter crypto_hash_cubehash512_amd64

  out = arg1
  in = arg2
  inlen = arg3

  constants = &crypto_hash_cubehash512_amd64_constants

  x0 = *(int128 *) (constants + 0)
  x1 = *(int128 *) (constants + 16)
  x2 = *(int128 *) (constants + 32)
  x3 = *(int128 *) (constants + 48)
  x4 = *(int128 *) (constants + 64)
  x5 = *(int128 *) (constants + 80)
  x6 = *(int128 *) (constants + 96)
  x7 = *(int128 *) (constants + 112)

  y0 ^= y0
  tmp = y0

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

  y0 = x2
  y1 = x3
  y2 = x0
  y3 = x1
  uint32323232 x4 += x0
  uint32323232 x5 += x1
  uint32323232 x6 += x2
  uint32323232 x7 += x3
  uint32323232 y0 <<= 7
  uint32323232 y1 <<= 7
  uint32323232 y2 <<= 7
  uint32323232 y3 <<= 7
  uint32323232 x0 >>= 25
  uint32323232 x1 >>= 25
  uint32323232 x2 >>= 25
  uint32323232 x3 >>= 25
  y0 ^= x4
  y1 ^= x5
  y2 ^= x6
  y3 ^= x7
  x4 <<<= 64
  x5 <<<= 64
  x6 <<<= 64
  x7 <<<= 64
  y0 ^= x2
  y1 ^= x3
  y2 ^= x0
  y3 ^= x1
                   unsigned>? r -= 1
  x0 = y1
  x1 = y0
  x2 = y3
  x3 = y2
  uint32323232 x4 += y0
  uint32323232 x5 += y1
  uint32323232 x6 += y2
  uint32323232 x7 += y3
  uint32323232 x0 <<= 11
  uint32323232 x1 <<= 11
  uint32323232 x2 <<= 11
  uint32323232 x3 <<= 11
  uint32323232 y0 >>= 21
  uint32323232 y1 >>= 21
  uint32323232 y2 >>= 21
  uint32323232 y3 >>= 21
  x0 ^= x4
  x1 ^= x5
  x2 ^= x6
  x3 ^= x7
  x4 = x4[1,0,3,2]
  x5 = x5[1,0,3,2]
  x6 = x6[1,0,3,2]
  x7 = x7[1,0,3,2]
  x0 ^= y1
  x1 ^= y0
  x2 ^= y3
  x3 ^= y2

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

  x7 ^= *(int128 *) (constants + 128)
  r = 32
  inlen = -2

goto morerounds
finish:

  *(unaligned int128 *) (out + 0) = x0
  *(unaligned int128 *) (out + 16) = x1
  *(unaligned int128 *) (out + 32) = x2
  *(unaligned int128 *) (out + 48) = x3

leave
