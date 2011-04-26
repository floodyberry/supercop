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
stack64 r11_stack
stack64 r12_stack
stack64 r13_stack
stack64 r14_stack
stack64 r15_stack
stack64 rbx_stack
stack64 rbp_stack

int64 a
int64 b
int64 c
int64 d

int64 loader
int64 arith

int64 ha
int64 hb
int64 hc
int64 hd

int64 state
int64 in
int64 inlen


enter crypto_hashblocks_md5_amd64_1
input state
input in
input inlen

r11_stack = r11_caller
r12_stack = r12_caller
r13_stack = r13_caller
r14_stack = r14_caller
r15_stack = r15_caller
rbx_stack = rbx_caller
rbp_stack = rbp_caller

a = *(uint32 *) (state + 0)
b = *(uint32 *) (state + 4)
c = *(uint32 *) (state + 8)
d = *(uint32 *) (state + 12)

             unsigned<? inlen - 64
goto done if unsigned<
mainloop:

  loader = *(uint32 *) (in + 0)
  arith = c
  arith ^= d
  arith &= b
  arith ^= d
ha = a
  a += loader + 0xd76aa478
  a += arith
  (uint32) a <<<= 7
    arith = b
    arith ^= c
  a += b
    loader = *(uint32 *) (in + 4)
    arith &= a
    arith ^= c
hd = d
    d += loader + 0xe8c7b756
    d += arith
    (uint32) d <<<= 12
    d += a
  loader = *(uint32 *) (in + 8)
  arith = a
  arith ^= b
  arith &= d
  arith ^= b
hc = c
  c += loader + 0x242070db
  c += arith
  (uint32) c <<<= 17
  c += d
    loader = *(uint32 *) (in + 12)
    arith = d
    arith ^= a
    arith &= c
    arith ^= a
hb = b
    b += loader + 0xc1bdceee
    b += arith
    (uint32) b <<<= 22
    b += c
  loader = *(uint32 *) (in + 16)
  arith = c
  arith ^= d
  arith &= b
  arith ^= d
  a += loader + 0xf57c0faf
  a += arith
  (uint32) a <<<= 7
  a += b
    loader = *(uint32 *) (in + 20)
    arith = b
    arith ^= c
    arith &= a
    arith ^= c
    d += loader + 0x4787c62a
    d += arith
    (uint32) d <<<= 12
    d += a
  loader = *(uint32 *) (in + 24)
  arith = a
  arith ^= b
  arith &= d
  arith ^= b
  c += loader + 0xa8304613
  c += arith
  (uint32) c <<<= 17
  c += d
    loader = *(uint32 *) (in + 28)
    arith = d
    arith ^= a
    arith &= c
    arith ^= a
    b += loader + 0xfd469501
    b += arith
    (uint32) b <<<= 22
    b += c
  loader = *(uint32 *) (in + 32)
  arith = c
  arith ^= d
  arith &= b
  arith ^= d
  a += loader + 0x698098d8
  a += arith
  (uint32) a <<<= 7
  a += b
    loader = *(uint32 *) (in + 36)
    arith = b
    arith ^= c
    arith &= a
    arith ^= c
    d += loader + 0x8b44f7af
    d += arith
    (uint32) d <<<= 12
    d += a
  loader = *(uint32 *) (in + 40)
  arith = a
  arith ^= b
  arith &= d
  arith ^= b
  c += loader + 0xffff5bb1
  c += arith
  (uint32) c <<<= 17
  c += d
    loader = *(uint32 *) (in + 44)
    arith = d
    arith ^= a
    arith &= c
    arith ^= a
    b += loader + 0x895cd7be
    b += arith
    (uint32) b <<<= 22
    b += c
  loader = *(uint32 *) (in + 48)
  arith = c
  arith ^= d
  arith &= b
  arith ^= d
  a += loader + 0x6b901122
  a += arith
  (uint32) a <<<= 7
  a += b
    loader = *(uint32 *) (in + 52)
    arith = b
    arith ^= c
    arith &= a
    arith ^= c
    d += loader + 0xfd987193
    d += arith
    (uint32) d <<<= 12
    d += a
  loader = *(uint32 *) (in + 56)
  arith = a
  arith ^= b
  arith &= d
  arith ^= b
  c += loader + 0xa679438e
  c += arith
  (uint32) c <<<= 17
  c += d
    loader = *(uint32 *) (in + 60)
    arith = d
    arith ^= a
    arith &= c
    arith ^= a
    b += loader + 0x49b40821
    b += arith
    (uint32) b <<<= 22
    b += c
  loader = *(uint32 *) (in + 4)
  arith = c
  arith ^= b
  arith &= d
  arith ^= c
  a += loader + 0xf61e2562
  a += arith
  (uint32) a <<<= 5
  a += b
    loader = *(uint32 *) (in + 24)
    arith = b
    arith ^= a
    arith &= c
    arith ^= b
    d += loader + 0xc040b340
    d += arith
    (uint32) d <<<= 9
    d += a
  loader = *(uint32 *) (in + 44)
  arith = a
  arith ^= d
  arith &= b
  arith ^= a
  c += loader + 0x265e5a51
  c += arith
  (uint32) c <<<= 14
  c += d
    loader = *(uint32 *) (in + 0)
    arith = d
    arith ^= c
    arith &= a
    arith ^= d
    b += loader + 0xe9b6c7aa
    b += arith
    (uint32) b <<<= 20
    b += c
  loader = *(uint32 *) (in + 20)
  arith = c
  arith ^= b
  arith &= d
  arith ^= c
  a += loader + 0xd62f105d
  a += arith
  (uint32) a <<<= 5
  a += b
    loader = *(uint32 *) (in + 40)
    arith = b
    arith ^= a
    arith &= c
    arith ^= b
    d += loader + 0x02441453
    d += arith
    (uint32) d <<<= 9
    d += a
  loader = *(uint32 *) (in + 60)
  arith = a
  arith ^= d
  arith &= b
  arith ^= a
  c += loader + 0xd8a1e681
  c += arith
  (uint32) c <<<= 14
  c += d
    loader = *(uint32 *) (in + 16)
    arith = d
    arith ^= c
    arith &= a
    arith ^= d
    b += loader + 0xe7d3fbc8
    b += arith
    (uint32) b <<<= 20
    b += c
  loader = *(uint32 *) (in + 36)
  arith = c
  arith ^= b
  arith &= d
  arith ^= c
  a += loader + 0x21e1cde6
  a += arith
  (uint32) a <<<= 5
  a += b
    loader = *(uint32 *) (in + 56)
    arith = b
    arith ^= a
    arith &= c
    arith ^= b
    d += loader + 0xc33707d6
    d += arith
    (uint32) d <<<= 9
    d += a
  loader = *(uint32 *) (in + 12)
  arith = a
  arith ^= d
  arith &= b
  arith ^= a
  c += loader + 0xf4d50d87
  c += arith
  (uint32) c <<<= 14
  c += d
    loader = *(uint32 *) (in + 32)
    arith = d
    arith ^= c
    arith &= a
    arith ^= d
    b += loader + 0x455a14ed
    b += arith
    (uint32) b <<<= 20
    b += c
  loader = *(uint32 *) (in + 52)
  arith = c
  arith ^= b
  arith &= d
  arith ^= c
  a += loader + 0xa9e3e905
  a += arith
  (uint32) a <<<= 5
  a += b
    loader = *(uint32 *) (in + 8)
    arith = b
    arith ^= a
    arith &= c
    arith ^= b
    d += loader + 0xfcefa3f8
    d += arith
    (uint32) d <<<= 9
    d += a
  loader = *(uint32 *) (in + 28)
  arith = a
  arith ^= d
  arith &= b
  arith ^= a
  c += loader + 0x676f02d9
  c += arith
  (uint32) c <<<= 14
  c += d
    loader = *(uint32 *) (in + 48)
    arith = d
    arith ^= c
    arith &= a
    arith ^= d
    b += loader + 0x8d2a4c8a
    b += arith
    (uint32) b <<<= 20
    b += c
  loader = *(uint32 *) (in + 20)
  arith = d
  arith ^= c
  arith ^= b
  a += loader + 0xfffa3942
  a += arith
  (uint32) a <<<= 4
  a += b
    loader = *(uint32 *) (in + 32)
    arith = c
    arith ^= b
    arith ^= a
    d += loader + 0x8771f681
    d += arith
    (uint32) d <<<= 11
    d += a
  loader = *(uint32 *) (in + 44)
  arith = b
  arith ^= a
  arith ^= d
  c += loader + 0x6d9d6122
  c += arith
  (uint32) c <<<= 16
  c += d
    loader = *(uint32 *) (in + 56)
    arith = a
    arith ^= d
    arith ^= c
    b += loader + 0xfde5380c
    b += arith
    (uint32) b <<<= 23
    b += c
  loader = *(uint32 *) (in + 4)
  arith = d
  arith ^= c
  arith ^= b
  a += loader + 0xa4beea44
  a += arith
  (uint32) a <<<= 4
  a += b
    loader = *(uint32 *) (in + 16)
    arith = c
    arith ^= b
    arith ^= a
    d += loader + 0x4bdecfa9
    d += arith
    (uint32) d <<<= 11
    d += a
  loader = *(uint32 *) (in + 28)
  arith = b
  arith ^= a
  arith ^= d
  c += loader + 0xf6bb4b60
  c += arith
  (uint32) c <<<= 16
  c += d
    loader = *(uint32 *) (in + 40)
    arith = a
    arith ^= d
    arith ^= c
    b += loader + 0xbebfbc70
    b += arith
    (uint32) b <<<= 23
    b += c
  loader = *(uint32 *) (in + 52)
  arith = d
  arith ^= c
  arith ^= b
  a += loader + 0x289b7ec6
  a += arith
  (uint32) a <<<= 4
  a += b
    loader = *(uint32 *) (in + 0)
    arith = c
    arith ^= b
    arith ^= a
    d += loader + 0xeaa127fa
    d += arith
    (uint32) d <<<= 11
    d += a
  loader = *(uint32 *) (in + 12)
  arith = b
  arith ^= a
  arith ^= d
  c += loader + 0xd4ef3085
  c += arith
  (uint32) c <<<= 16
  c += d
    loader = *(uint32 *) (in + 24)
    arith = a
    arith ^= d
    arith ^= c
    b += loader + 0x04881d05
    b += arith
    (uint32) b <<<= 23
    b += c
  loader = *(uint32 *) (in + 36)
  arith = d
  arith ^= c
  arith ^= b
  a += loader + 0xd9d4d039
  a += arith
  (uint32) a <<<= 4
  a += b
    loader = *(uint32 *) (in + 48)
    arith = c
    arith ^= b
    arith ^= a
    d += loader + 0xe6db99e5
    d += arith
    (uint32) d <<<= 11
    d += a
  loader = *(uint32 *) (in + 60)
  arith = b
  arith ^= a
  arith ^= d
  c += loader + 0x1fa27cf8
  c += arith
  (uint32) c <<<= 16
  c += d
    loader = *(uint32 *) (in + 8)
    arith = a
    arith ^= d
    arith ^= c
    b += loader + 0xc4ac5665
    b += arith
    (uint32) b <<<= 23
    b += c
  loader = *(uint32 *) (in + 0)
  arith = -1
  arith ^= d
  arith |= b
  arith ^= c
  a += loader + 0xf4292244
  a += arith
  (uint32) a <<<= 6
  a += b
    loader = *(uint32 *) (in + 28)
    arith = -1
    arith ^= c
    arith |= a
    arith ^= b
    d += loader + 0x432aff97
    d += arith
    (uint32) d <<<= 10
    d += a
  loader = *(uint32 *) (in + 56)
  arith = -1
  arith ^= b
  arith |= d
  arith ^= a
  c += loader + 0xab9423a7
  c += arith
  (uint32) c <<<= 15
  c += d
    loader = *(uint32 *) (in + 20)
    arith = -1
    arith ^= a
    arith |= c
    arith ^= d
    b += loader + 0xfc93a039
    b += arith
    (uint32) b <<<= 21
    b += c
  loader = *(uint32 *) (in + 48)
  arith = -1
  arith ^= d
  arith |= b
  arith ^= c
  a += loader + 0x655b59c3
  a += arith
  (uint32) a <<<= 6
  a += b
    loader = *(uint32 *) (in + 12)
    arith = -1
    arith ^= c
    arith |= a
    arith ^= b
    d += loader + 0x8f0ccc92
    d += arith
    (uint32) d <<<= 10
    d += a
  loader = *(uint32 *) (in + 40)
  arith = -1
  arith ^= b
  arith |= d
  arith ^= a
  c += loader + 0xffeff47d
  c += arith
  (uint32) c <<<= 15
  c += d
    loader = *(uint32 *) (in + 4)
    arith = -1
    arith ^= a
    arith |= c
    arith ^= d
    b += loader + 0x85845dd1
    b += arith
    (uint32) b <<<= 21
    b += c
  loader = *(uint32 *) (in + 32)
  arith = -1
  arith ^= d
  arith |= b
  arith ^= c
  a += loader + 0x6fa87e4f
  a += arith
  (uint32) a <<<= 6
  a += b
    loader = *(uint32 *) (in + 60)
    arith = -1
    arith ^= c
    arith |= a
    arith ^= b
    d += loader + 0xfe2ce6e0
    d += arith
    (uint32) d <<<= 10
    d += a
  loader = *(uint32 *) (in + 24)
  arith = -1
  arith ^= b
  arith |= d
  arith ^= a
  c += loader + 0xa3014314
  c += arith
  (uint32) c <<<= 15
  c += d
    loader = *(uint32 *) (in + 52)
    arith = -1
    arith ^= a
    arith |= c
    arith ^= d
    b += loader + 0x4e0811a1
    b += arith
    (uint32) b <<<= 21
    b += c
  loader = *(uint32 *) (in + 16)
  arith = -1
  arith ^= d
  arith |= b
  arith ^= c
  a += loader + 0xf7537e82
  a += arith
  (uint32) a <<<= 6
  a += b
    loader = *(uint32 *) (in + 44)
    arith = -1
    arith ^= c
    arith |= a
    arith ^= b
    d += loader + 0xbd3af235
    d += arith
    (uint32) d <<<= 10
    d += a
  loader = *(uint32 *) (in + 8)
  arith = -1
  arith ^= b
  arith |= d
  arith ^= a
  c += loader + 0x2ad7d2bb
  c += arith
  (uint32) c <<<= 15
  c += d
    loader = *(uint32 *) (in + 36)
    arith = -1
    arith ^= a
    arith |= c
    arith ^= d
    b += loader + 0xeb86d391
    b += arith
    (uint32) b <<<= 21
    b += c


  in += 64
  inlen -= 64

  a += ha
  b += hb
  c += hc
  d += hd

                  unsigned<? inlen - 64
goto mainloop if !unsigned<
done:

*(uint32 *) (state + 0) = a
*(uint32 *) (state + 4) = b
*(uint32 *) (state + 8) = c
*(uint32 *) (state + 12) = d

r11_caller = r11_stack
r12_caller = r12_stack
r13_caller = r13_stack
r14_caller = r14_stack
r15_caller = r15_stack
rbx_caller = rbx_stack
rbp_caller = rbp_stack

int64 result
result = inlen
assign outputreg 0 to result

leave
