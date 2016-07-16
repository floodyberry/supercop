int64 arg1
int64 arg2

input arg1
input arg2

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


int64 table

int64 c
int64 k
int64 iv

int64 x0
int64 x1
int64 x2
int64 x3
int64 e
int64 q0
int64 q1
int64 q2
int64 q3

int64 in
int64 out
int64 len

stack64 n0
stack64 n1
stack64 n2
stack64 n3

stack64 r0
stack64 r1
stack64 r2
stack64 r3
stack64 r4
stack64 r5
stack64 r6
stack64 r7
stack64 r8
stack64 r9
stack64 r10
stack64 r11
stack64 r12
stack64 r13
stack64 r14
stack64 r15
stack64 r16
stack64 r17
stack64 r18
stack64 r19
stack64 r20
stack64 r21
stack64 r22
stack64 r23
stack64 r24
stack64 r25
stack64 r26
stack64 r27
stack64 r28
stack64 r29
stack64 r30
stack64 r31
stack64 r32
stack64 r33
stack64 r34
stack64 r35
stack64 r36
stack64 r37
stack64 r38
stack64 r39
stack64 r40
stack64 r41
stack64 r42
stack64 r43

int64 y0
int64 y1
int64 y2
int64 y3

int64 z0
int64 z1
int64 z2
int64 z3

int64 p00
int64 p01
int64 p02
int64 p03

int64 p10
int64 p11
int64 p12
int64 p13

int64 p20
int64 p21
int64 p22
int64 p23

int64 p30
int64 p31
int64 p32
int64 p33

int64 b0
int64 b1
int64 b2
int64 b3


enter ECRYPT_ivsetup

r11_stack = r11_caller
r12_stack = r12_caller
r13_stack = r13_caller
r14_stack = r14_caller
r15_stack = r15_caller
rbx_stack = rbx_caller
rbp_stack = rbp_caller


c = arg1
iv = arg2

x0 = *(uint32 *) (c + 0)
x1 = *(uint32 *) (c + 4)
x2 = *(uint32 *) (c + 8)
x3 = *(uint32 *) (c + 12)
r0 = x0
r1 = x1
r2 = x2
r3 = x3

x0 = *(uint32 *) (c + 16)
x1 ^= x0
x2 ^= x1
x3 ^= x2
r4 = x0
r5 = x1
r6 = x2
r7 = x3

x0 = *(uint32 *) (c + 20)
x1 ^= x0
x2 ^= x1
x3 ^= x2
r8 = x0
r9 = x1
r10 = x2
r11 = x3

x0 = *(uint32 *) (c + 24)
x1 ^= x0
x2 ^= x1
x3 ^= x2
r12 = x0
r13 = x1
r14 = x2
r15 = x3

x0 = *(uint32 *) (c + 28)
x1 ^= x0
x2 ^= x1
x3 ^= x2
r16 = x0
r17 = x1
r18 = x2
r19 = x3

x0 = *(uint32 *) (c + 32)
x1 ^= x0
x2 ^= x1
x3 ^= x2
r20 = x0
r21 = x1
r22 = x2
r23 = x3

x0 = *(uint32 *) (c + 36)
x1 ^= x0
x2 ^= x1
x3 ^= x2
r24 = x0
r25 = x1
r26 = x2
r27 = x3

x0 = *(uint32 *) (c + 40)
x1 ^= x0
x2 ^= x1
x3 ^= x2
r28 = x0
r29 = x1
r30 = x2
r31 = x3

x0 = *(uint32 *) (c + 44)
x1 ^= x0
x2 ^= x1
x3 ^= x2
r32 = x0
r33 = x1
r34 = x2
r35 = x3

x0 = *(uint32 *) (c + 48)
x1 ^= x0
x2 ^= x1
x3 ^= x2
r36 = x0
r37 = x1
r38 = x2
r39 = x3

x0 = *(uint32 *) (c + 52)
x1 ^= x0
x2 ^= x1
x3 ^= x2
r40 = x0
r41 = x1
r42 = x2
r43 = x3

y0 = *(uint32 *) (iv + 0)
(uint32) bswap y0
y1 = *(uint32 *) (iv + 4)
(uint32) bswap y1
y2 = *(uint32 *) (iv + 8)
(uint32) bswap y2
y3 = *(uint32 *) (iv + 12)
(uint32) bswap y3

assign 3 to y0
assign 4 to y1
assign 7 to y2
assign 14 to y3

table = &aes_tablex

  n0 = y0
  n1 = y1
  n2 = y2
  n3 = y3

  y0 ^= r0
  y1 ^= r1
  y2 ^= r2
  y3 ^= r3

  p00 = y0 & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (table + 2 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p01 * 8)

  p10 = y1 & 255
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  p13 = (y1 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)

  p20 = y2 & 255
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)

  p30 = y3 & 255
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)

  y0 = r4
  y0 ^= z0
  y1 = r5
  y1 ^= z1
  y2 = r6
  y2 ^= z2
  y3 = r7
  y3 ^= z3

assign 3 to y2

  p00 = y0 & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (table + 2 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p01 * 8)
  p10 = y1 & 255
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  p13 = (y1 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  p20 = y2 & 255
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  p30 = y3 & 255
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  y0 = r8
  y0 ^= z0
  y1 = r9
  y1 ^= z1
  y2 = r10
  y2 ^= z2
  y3 = r11
  y3 ^= z3

assign 3 to y2
  p00 = y0 & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (table + 2 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p01 * 8)
  p10 = y1 & 255
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  p13 = (y1 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  p20 = y2 & 255
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  p30 = y3 & 255
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  y0 = r12
  y0 ^= z0
  y1 = r13
  y1 ^= z1
  y2 = r14
  y2 ^= z2
  y3 = r15
  y3 ^= z3

assign 3 to y2
  p00 = y0 & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (table + 2 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p01 * 8)
  p10 = y1 & 255
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  p13 = (y1 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  p20 = y2 & 255
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  p30 = y3 & 255
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  y0 = r16
  y0 ^= z0
  y1 = r17
  y1 ^= z1
  y2 = r18
  y2 ^= z2
  y3 = r19
  y3 ^= z3

assign 3 to y2
  p00 = y0 & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (table + 2 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p01 * 8)
  p10 = y1 & 255
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  p13 = (y1 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  p20 = y2 & 255
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  p30 = y3 & 255
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  y0 = r20
  y0 ^= z0
  y1 = r21
  y1 ^= z1
  y2 = r22
  y2 ^= z2
  y3 = r23
  y3 ^= z3

assign 3 to y2
  p00 = y0 & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (table + 2 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p01 * 8)
  p10 = y1 & 255
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  p13 = (y1 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  p20 = y2 & 255
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  p30 = y3 & 255
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  y0 = r24
  y0 ^= z0
  y1 = r25
  y1 ^= z1
  y2 = r26
  y2 ^= z2
  y3 = r27
  y3 ^= z3

assign 3 to y2
  p00 = y0 & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (table + 2 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p01 * 8)
  p10 = y1 & 255
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  p13 = (y1 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  p20 = y2 & 255
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  p30 = y3 & 255
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  y0 = r28
  y0 ^= z0
  y1 = r29
  y1 ^= z1
  y2 = r30
  y2 ^= z2
  y3 = r31
  y3 ^= z3

assign 3 to y2
  p00 = y0 & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (table + 2 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p01 * 8)
  p10 = y1 & 255
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  p13 = (y1 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  p20 = y2 & 255
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  p30 = y3 & 255
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  y0 = r32
  y0 ^= z0
  y1 = r33
  y1 ^= z1
  y2 = r34
  y2 ^= z2
  y3 = r35
  y3 ^= z3

assign 3 to y2
  p00 = y0 & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (table + 2 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p01 * 8)
  p10 = y1 & 255
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  p13 = (y1 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  p20 = y2 & 255
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  p30 = y3 & 255
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  y0 = r36
  y0 ^= z0
  y1 = r37
  y1 ^= z1
  y2 = r38
  y2 ^= z2
  y3 = r39
  y3 ^= z3

assign 3 to y2


  z0 = y0 & 255
  z0 = *(uint8 *) (table + 1 + z0 * 8)
  z3 = (y0 >> 8) & 255
  z3 = *(uint16 *) (table + z3 * 8)
  (uint32) y0 >>= 16
  z2 = y0 & 255
  z2 = *(uint32 *) (table + 3 + z2 * 8)
  (uint32) z2 &= 0x00ff0000
  z1 = (y0 >> 8) & 255
  z1 = *(uint32 *) (table + 2 + z1 * 8)
  (uint32) z1 &= 0xff000000
  z0 ^= r40
  z3 ^= r43
  z1 ^= r41
  z2 ^= r42

  p10 = y1 & 255
  p10 = *(uint8 *) (table + 1 + p10 * 8)
  z1 ^= p10
  p11 = (y1 >> 8) & 255
  p11 = *(uint16 *) (table + p11 * 8)
  z0 ^= p11
  (uint32) y1 >>= 16
  p12 = y1 & 255
  p12 = *(uint32 *) (table + 3 + p12 * 8)
  (uint32) p12 &= 0x00ff0000
  z3 ^= p12
  p13 = (y1 >> 8) & 255
  p13 = *(uint32 *) (table + 2 + p13 * 8)
  (uint32) p13 &= 0xff000000
  z2 ^= p13


  p20 = y2 & 255
  p20 = *(uint8 *) (table + 1 + p20 * 8)
  z2 ^= p20
  p21 = (y2 >> 8) & 255
  p21 = *(uint16 *) (table + p21 * 8)
  z1 ^= p21
  (uint32) y2 >>= 16
  p22 = y2 & 255
  p22 = *(uint32 *) (table + 3 + p22 * 8)
  (uint32) p22 &= 0x00ff0000
  z0 ^= p22
  p23 = (y2 >> 8) & 255
  p23 = *(uint32 *) (table + 2 + p23 * 8)
  (uint32) p23 &= 0xff000000
  z3 ^= p23

  p30 = y3 & 255
  p30 = *(uint8 *) (table + 1 + p30 * 8)
  z3 ^= p30
  p31 = (y3 >> 8) & 255
  p31 = *(uint16 *) (table + p31 * 8)
  z2 ^= p31
  (uint32) y3 >>= 16
  p32 = y3 & 255
  p32 = *(uint32 *) (table + 3 + p32 * 8)
  (uint32) p32 &= 0x00ff0000
  z1 ^= p32
  p33 = (y3 >> 8) & 255
  p33 = *(uint32 *) (table + 2 + p33 * 8)
  (uint32) p33 &= 0xff000000
  z0 ^= p33

*(uint32 *) (c + 56) = z0
*(uint32 *) (c + 60) = z1
*(uint32 *) (c + 64) = z2
*(uint32 *) (c + 68) = z3


r11_caller = r11_stack
r12_caller = r12_stack
r13_caller = r13_stack
r14_caller = r14_stack
r15_caller = r15_stack
rbx_caller = rbx_stack
rbp_caller = rbp_stack

leave
