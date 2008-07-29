int64 arg1
int64 arg2
int64 arg3
int64 arg4
int64 arg5
input arg1
input arg2
input arg3
input arg4
input arg5

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

stack64 in_stack

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

int64 q00
int64 q01
int64 q02
int64 q03

int64 q10
int64 q11
int64 q12
int64 q13

int64 q20
int64 q21
int64 q22
int64 q23

int64 q30
int64 q31
int64 q32
int64 q33

int64 b0
int64 b1
int64 b2
int64 b3


enter ECRYPT_init
leave


enter ECRYPT_ivsetup

c = arg1
iv = arg2

x0 = *(uint32 *) (iv + 0)
x1 = *(uint32 *) (iv + 4)
x2 = *(uint32 *) (iv + 8)
x3 = *(uint32 *) (iv + 12)
*(uint32 *) (c + 56) = x0
*(uint32 *) (c + 60) = x1
*(uint32 *) (c + 64) = x2
*(uint32 *) (c + 68) = x3

leave


enter ECRYPT_keysetup

r11_stack = r11_caller
r12_stack = r12_caller
r13_stack = r13_caller
r14_stack = r14_caller
r15_stack = r15_caller
rbx_stack = rbx_caller
rbp_stack = rbp_caller

c = arg1
k = arg2

x0 = *(uint32 *) (k + 0)
x1 = *(uint32 *) (k + 4)
x2 = *(uint32 *) (k + 8)
x3 = *(uint32 *) (k + 12)
*(uint32 *) (c + 0) = x0
*(uint32 *) (c + 4) = x1
*(uint32 *) (c + 8) = x2
*(uint32 *) (c + 12) = x3

table = &aes_tablex

e = (x3 >> 8) & 255
e = *(uint8 *) (table + 1 + e * 8)
(uint32) e ^= 0x01
q3 = x3 & 255
(uint32) x3 <<<= 16
q3 = *(uint32 *) (table + 2 + q3 * 8)
(uint32) q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (table + 3 + q2 * 8)
(uint32) q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
(uint32) x3 <<<= 16
q1 = *(uint16 *) (table + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 16) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (table + 1 + e * 8)
(uint32) e ^= 0x02
q3 = x3 & 255
(uint32) x3 <<<= 16
q3 = *(uint32 *) (table + 2 + q3 * 8)
(uint32) q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (table + 3 + q2 * 8)
(uint32) q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
(uint32) x3 <<<= 16
q1 = *(uint16 *) (table + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 20) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (table + 1 + e * 8)
(uint32) e ^= 0x04
q3 = x3 & 255
(uint32) x3 <<<= 16
q3 = *(uint32 *) (table + 2 + q3 * 8)
(uint32) q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (table + 3 + q2 * 8)
(uint32) q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
(uint32) x3 <<<= 16
q1 = *(uint16 *) (table + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 24) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (table + 1 + e * 8)
(uint32) e ^= 0x08
q3 = x3 & 255
(uint32) x3 <<<= 16
q3 = *(uint32 *) (table + 2 + q3 * 8)
(uint32) q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (table + 3 + q2 * 8)
(uint32) q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
(uint32) x3 <<<= 16
q1 = *(uint16 *) (table + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 28) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (table + 1 + e * 8)
(uint32) e ^= 0x10
q3 = x3 & 255
(uint32) x3 <<<= 16
q3 = *(uint32 *) (table + 2 + q3 * 8)
(uint32) q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (table + 3 + q2 * 8)
(uint32) q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
(uint32) x3 <<<= 16
q1 = *(uint16 *) (table + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 32) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (table + 1 + e * 8)
(uint32) e ^= 0x20
q3 = x3 & 255
(uint32) x3 <<<= 16
q3 = *(uint32 *) (table + 2 + q3 * 8)
(uint32) q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (table + 3 + q2 * 8)
(uint32) q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
(uint32) x3 <<<= 16
q1 = *(uint16 *) (table + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 36) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (table + 1 + e * 8)
(uint32) e ^= 0x40
q3 = x3 & 255
(uint32) x3 <<<= 16
q3 = *(uint32 *) (table + 2 + q3 * 8)
(uint32) q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (table + 3 + q2 * 8)
(uint32) q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
(uint32) x3 <<<= 16
q1 = *(uint16 *) (table + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 40) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (table + 1 + e * 8)
(uint32) e ^= 0x80
q3 = x3 & 255
(uint32) x3 <<<= 16
q3 = *(uint32 *) (table + 2 + q3 * 8)
(uint32) q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (table + 3 + q2 * 8)
(uint32) q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
(uint32) x3 <<<= 16
q1 = *(uint16 *) (table + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 44) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (table + 1 + e * 8)
(uint32) e ^= 0x1b
q3 = x3 & 255
(uint32) x3 <<<= 16
q3 = *(uint32 *) (table + 2 + q3 * 8)
(uint32) q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (table + 3 + q2 * 8)
(uint32) q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
(uint32) x3 <<<= 16
q1 = *(uint16 *) (table + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 48) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (table + 1 + e * 8)
(uint32) e ^= 0x36
q3 = x3 & 255
(uint32) x3 <<<= 16
q3 = *(uint32 *) (table + 2 + q3 * 8)
(uint32) q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (table + 3 + q2 * 8)
(uint32) q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
(uint32) x3 <<<= 16
q1 = *(uint16 *) (table + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 52) = x0

r11_caller = r11_stack
r12_caller = r12_stack
r13_caller = r13_stack
r14_caller = r14_stack
r15_caller = r15_stack
rbx_caller = rbx_stack
rbp_caller = rbp_stack

leave


enter ECRYPT_process_bytes stackaligned4096 aes_constants

r11_stack = r11_caller
r12_stack = r12_caller
r13_stack = r13_caller
r14_stack = r14_caller
r15_stack = r15_caller
rbx_stack = rbx_caller
rbp_stack = rbp_caller

c = arg2
in = arg3
out = arg4
len = arg5

in_stack = in

                     unsigned>? len - 0
goto nothingtodo if !unsigned>

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

y0 = *(uint32 *) (c + 56)
y1 = *(uint32 *) (c + 60)
y2 = *(uint32 *) (c + 64)
y3 = *(uint32 *) (c + 68)

assign 3 to y0
assign 4 to y1
assign 7 to y2
assign 14 to y3

table = &aes_tablex


mainloop:

  n0 = y0
  n1 = y1
  n2 = y2
  n3 = y3

  y0 ^= r0
  y1 ^= r1
  y2 ^= r2
  y3 ^= r3


  p00 = y0 & 255
  p01 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  p02 = y0 & 255
  p03 = (y0 >> 8) & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  assign 3 to z0

  p10 = y1 & 255
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  p13 = (y1 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p03 * 8)
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  assign 4 to z1

  p20 = y2 & 255
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  assign 7 to z2

  p30 = y3 & 255
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  z3 = *(uint32 *) (table + 2 + p01 * 8)
  z2 ^= r6
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  z1 ^= r5
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  z0 ^= r4
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  z3 ^= r7
  assign 14 to z3

  q00 = z0 & 255
  q03 = (z0 >> 8) & 255
  (uint32) z0 >>= 16
  q02 = z0 & 255
  q01 = (z0 >> 8) & 255
  y0 = *(uint32 *) (table + 3 + q00 * 8)
  assign 3 to y0

  q10 = z1 & 255
  q11 = (z1 >> 8) & 255
  (uint32) y0 ^= *(uint32 *) (table + 2 + q11 * 8)
  (uint32) z1 >>= 16
  q12 = z1 & 255
  q13 = (z1 >> 8) & 255
  y1 = *(uint32 *) (table + 4 + q01 * 8)
  (uint32) y1 ^= *(uint32 *) (table + 3 + q10 * 8)
  assign 4 to y1

  q20 = z2 & 255
  q21 = (z2 >> 8) & 255
  (uint32) y1 ^= *(uint32 *) (table + 2 + q21 * 8)
  (uint32) z2 >>= 16
  q22 = z2 & 255
  (uint32) y0 ^= *(uint32 *) (table + 1 + q22 * 8)
  q23 = (z2 >> 8) & 255
  y2 = *(uint32 *) (table + 1 + q02 * 8)
  (uint32) y2 ^= *(uint32 *) (table + 4 + q13 * 8)
  (uint32) y2 ^= *(uint32 *) (table + 3 + q20 * 8)
  assign 7 to y2

  q30 = z3 & 255
  q31 = (z3 >> 8) & 255
  (uint32) y2 ^= *(uint32 *) (table + 2 + q31 * 8)
  (uint32) z3 >>= 16
  q32 = z3 & 255
  (uint32) y1 ^= *(uint32 *) (table + 1 + q32 * 8)
  q33 = (z3 >> 8) & 255
  (uint32) y0 ^= *(uint32 *) (table + 4 + q33 * 8)
  y3 = *(uint32 *) (table + 2 + q03 * 8)
  y2 ^= r10
  (uint32) y3 ^= *(uint32 *) (table + 1 + q12 * 8)
  y1 ^= r9
  (uint32) y3 ^= *(uint32 *) (table + 4 + q23 * 8)
  y0 ^= r8
  (uint32) y3 ^= *(uint32 *) (table + 3 + q30 * 8)
  y3 ^= r11
  assign 14 to y3




  p00 = y0 & 255
  p01 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  p02 = y0 & 255
  p03 = (y0 >> 8) & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  assign 3 to z0

  p10 = y1 & 255
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  p13 = (y1 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p03 * 8)
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  assign 4 to z1

  p20 = y2 & 255
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  assign 7 to z2

  p30 = y3 & 255
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  z3 = *(uint32 *) (table + 2 + p01 * 8)
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  z0 ^= r12
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  z1 ^= r13
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  assign 14 to z3

  z2 ^= r14
  z3 ^= r15

  q00 = z0 & 255
  q03 = (z0 >> 8) & 255
  (uint32) z0 >>= 16
  q02 = z0 & 255
  q01 = (z0 >> 8) & 255
  y0 = *(uint32 *) (table + 3 + q00 * 8)
  assign 3 to y0

  q10 = z1 & 255
  q11 = (z1 >> 8) & 255
  (uint32) y0 ^= *(uint32 *) (table + 2 + q11 * 8)
  (uint32) z1 >>= 16
  q12 = z1 & 255
  q13 = (z1 >> 8) & 255
  y1 = *(uint32 *) (table + 4 + q01 * 8)
  (uint32) y1 ^= *(uint32 *) (table + 3 + q10 * 8)
  assign 4 to y1

  q20 = z2 & 255
  q21 = (z2 >> 8) & 255
  (uint32) y1 ^= *(uint32 *) (table + 2 + q21 * 8)
  (uint32) z2 >>= 16
  q22 = z2 & 255
  (uint32) y0 ^= *(uint32 *) (table + 1 + q22 * 8)
  q23 = (z2 >> 8) & 255
  y2 = *(uint32 *) (table + 1 + q02 * 8)
  (uint32) y2 ^= *(uint32 *) (table + 4 + q13 * 8)
  (uint32) y2 ^= *(uint32 *) (table + 3 + q20 * 8)
  assign 7 to y2

  q30 = z3 & 255
  q31 = (z3 >> 8) & 255
  (uint32) y2 ^= *(uint32 *) (table + 2 + q31 * 8)
  (uint32) z3 >>= 16
  q32 = z3 & 255
  (uint32) y1 ^= *(uint32 *) (table + 1 + q32 * 8)
  q33 = (z3 >> 8) & 255
  (uint32) y0 ^= *(uint32 *) (table + 4 + q33 * 8)
  y3 = *(uint32 *) (table + 2 + q03 * 8)
  (uint32) y3 ^= *(uint32 *) (table + 1 + q12 * 8)
  y0 ^= r16
  (uint32) y3 ^= *(uint32 *) (table + 4 + q23 * 8)
  y1 ^= r17
  (uint32) y3 ^= *(uint32 *) (table + 3 + q30 * 8)
  assign 14 to y3

  y2 ^= r18
  y3 ^= r19



  p00 = y0 & 255
  p01 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  p02 = y0 & 255
  p03 = (y0 >> 8) & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  assign 3 to z0

  p10 = y1 & 255
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  p13 = (y1 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p03 * 8)
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  assign 4 to z1

  p20 = y2 & 255
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  assign 7 to z2

  p30 = y3 & 255
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  z3 = *(uint32 *) (table + 2 + p01 * 8)
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  z0 ^= r20
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  z1 ^= r21
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  assign 14 to z3

  z2 ^= r22
  z3 ^= r23

  q00 = z0 & 255
  q03 = (z0 >> 8) & 255
  (uint32) z0 >>= 16
  q02 = z0 & 255
  q01 = (z0 >> 8) & 255
  y0 = *(uint32 *) (table + 3 + q00 * 8)
  assign 3 to y0

  q10 = z1 & 255
  q11 = (z1 >> 8) & 255
  (uint32) y0 ^= *(uint32 *) (table + 2 + q11 * 8)
  (uint32) z1 >>= 16
  q12 = z1 & 255
  q13 = (z1 >> 8) & 255
  y1 = *(uint32 *) (table + 4 + q01 * 8)
  (uint32) y1 ^= *(uint32 *) (table + 3 + q10 * 8)
  assign 4 to y1

  q20 = z2 & 255
  q21 = (z2 >> 8) & 255
  (uint32) y1 ^= *(uint32 *) (table + 2 + q21 * 8)
  (uint32) z2 >>= 16
  q22 = z2 & 255
  (uint32) y0 ^= *(uint32 *) (table + 1 + q22 * 8)
  q23 = (z2 >> 8) & 255
  y2 = *(uint32 *) (table + 1 + q02 * 8)
  (uint32) y2 ^= *(uint32 *) (table + 4 + q13 * 8)
  (uint32) y2 ^= *(uint32 *) (table + 3 + q20 * 8)
  assign 7 to y2

  q30 = z3 & 255
  q31 = (z3 >> 8) & 255
  (uint32) y2 ^= *(uint32 *) (table + 2 + q31 * 8)
  (uint32) z3 >>= 16
  q32 = z3 & 255
  (uint32) y1 ^= *(uint32 *) (table + 1 + q32 * 8)
  q33 = (z3 >> 8) & 255
  (uint32) y0 ^= *(uint32 *) (table + 4 + q33 * 8)
  y3 = *(uint32 *) (table + 2 + q03 * 8)
  (uint32) y3 ^= *(uint32 *) (table + 1 + q12 * 8)
  y0 ^= r24
  (uint32) y3 ^= *(uint32 *) (table + 4 + q23 * 8)
  y1 ^= r25
  (uint32) y3 ^= *(uint32 *) (table + 3 + q30 * 8)
  assign 14 to y3

  y2 ^= r26
  y3 ^= r27



  p00 = y0 & 255
  p01 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  p02 = y0 & 255
  p03 = (y0 >> 8) & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  assign 3 to z0

  p10 = y1 & 255
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  p13 = (y1 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p03 * 8)
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  assign 4 to z1

  p20 = y2 & 255
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  assign 7 to z2

  p30 = y3 & 255
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  z3 = *(uint32 *) (table + 2 + p01 * 8)
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  z0 ^= r28
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  z1 ^= r29
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  assign 14 to z3

  z2 ^= r30
  z3 ^= r31

  q00 = z0 & 255
  q03 = (z0 >> 8) & 255
  (uint32) z0 >>= 16
  q02 = z0 & 255
  q01 = (z0 >> 8) & 255
  y0 = *(uint32 *) (table + 3 + q00 * 8)
  assign 3 to y0

  q10 = z1 & 255
  q11 = (z1 >> 8) & 255
  (uint32) y0 ^= *(uint32 *) (table + 2 + q11 * 8)
  (uint32) z1 >>= 16
  q12 = z1 & 255
  q13 = (z1 >> 8) & 255
  y1 = *(uint32 *) (table + 4 + q01 * 8)
  (uint32) y1 ^= *(uint32 *) (table + 3 + q10 * 8)
  assign 4 to y1

  q20 = z2 & 255
  q21 = (z2 >> 8) & 255
  (uint32) y1 ^= *(uint32 *) (table + 2 + q21 * 8)
  (uint32) z2 >>= 16
  q22 = z2 & 255
  (uint32) y0 ^= *(uint32 *) (table + 1 + q22 * 8)
  q23 = (z2 >> 8) & 255
  y2 = *(uint32 *) (table + 1 + q02 * 8)
  (uint32) y2 ^= *(uint32 *) (table + 4 + q13 * 8)
  (uint32) y2 ^= *(uint32 *) (table + 3 + q20 * 8)
  assign 7 to y2

  q30 = z3 & 255
  q31 = (z3 >> 8) & 255
  (uint32) y2 ^= *(uint32 *) (table + 2 + q31 * 8)
  (uint32) z3 >>= 16
  q32 = z3 & 255
  (uint32) y1 ^= *(uint32 *) (table + 1 + q32 * 8)
  q33 = (z3 >> 8) & 255
  (uint32) y0 ^= *(uint32 *) (table + 4 + q33 * 8)
  y3 = *(uint32 *) (table + 2 + q03 * 8)
  (uint32) y3 ^= *(uint32 *) (table + 1 + q12 * 8)
  y0 ^= r32
  (uint32) y3 ^= *(uint32 *) (table + 4 + q23 * 8)
  y1 ^= r33
  (uint32) y3 ^= *(uint32 *) (table + 3 + q30 * 8)
  assign 14 to y3

  y2 ^= r34
  y3 ^= r35



  p00 = y0 & 255
  p01 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  p02 = y0 & 255
  p03 = (y0 >> 8) & 255
  z0 = *(uint32 *) (table + 3 + p00 * 8)
  assign 3 to z0

  p10 = y1 & 255
  p11 = (y1 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  p13 = (y1 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p03 * 8)
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  assign 4 to z1

  p20 = y2 & 255
  p21 = (y2 >> 8) & 255
  (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
  (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
  assign 7 to z2

  p30 = y3 & 255
  p31 = (y3 >> 8) & 255
  (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
  p33 = (y3 >> 8) & 255
  (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
  z3 = *(uint32 *) (table + 2 + p01 * 8)
  (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
  z0 ^= r36
  (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
  z1 ^= r37
  (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
  assign 14 to z3

  z2 ^= r38
  z3 ^= r39



  y0 = z0 & 255
  y0 = *(uint8 *) (table + 1 + y0 * 8)
  y3 = (z0 >> 8) & 255
  y3 = *(uint16 *) (table + y3 * 8)
  (uint32) z0 >>= 16
  y2 = z0 & 255
  y2 = *(uint32 *) (table + 3 + y2 * 8)
  (uint32) y2 &= 0x00ff0000
  y1 = (z0 >> 8) & 255
  y1 = *(uint32 *) (table + 2 + y1 * 8)
  (uint32) y1 &= 0xff000000
  y0 ^= r40
  y3 ^= r43
  y1 ^= r41
  y2 ^= r42

  q10 = z1 & 255
  q10 = *(uint8 *) (table + 1 + q10 * 8)
  y1 ^= q10
  q11 = (z1 >> 8) & 255
  q11 = *(uint16 *) (table + q11 * 8)
  y0 ^= q11
  (uint32) z1 >>= 16
  q12 = z1 & 255
  q12 = *(uint32 *) (table + 3 + q12 * 8)
  (uint32) q12 &= 0x00ff0000
  y3 ^= q12
  q13 = (z1 >> 8) & 255
  q13 = *(uint32 *) (table + 2 + q13 * 8)
  (uint32) q13 &= 0xff000000
  y2 ^= q13

  q20 = z2 & 255
  q20 = *(uint8 *) (table + 1 + q20 * 8)
  y2 ^= q20
  q21 = (z2 >> 8) & 255
  q21 = *(uint16 *) (table + q21 * 8)
  y1 ^= q21
  (uint32) z2 >>= 16
  q22 = z2 & 255
  q22 = *(uint32 *) (table + 3 + q22 * 8)
  (uint32) q22 &= 0x00ff0000
  y0 ^= q22
  q23 = (z2 >> 8) & 255
  q23 = *(uint32 *) (table + 2 + q23 * 8)
  (uint32) q23 &= 0xff000000
  y3 ^= q23

  q30 = z3 & 255
  q30 = *(uint8 *) (table + 1 + q30 * 8)
  y3 ^= q30
  q31 = (z3 >> 8) & 255
  q31 = *(uint16 *) (table + q31 * 8)
  y2 ^= q31
  (uint32) z3 >>= 16
  q32 = z3 & 255
  q32 = *(uint32 *) (table + 3 + q32 * 8)
  (uint32) q32 &= 0x00ff0000
  y1 ^= q32
  q33 = (z3 >> 8) & 255
  q33 = *(uint32 *) (table + 2 + q33 * 8)
  (uint32) q33 &= 0xff000000
  y0 ^= q33


  in = in_stack

                     unsigned<? len - 16
  goto fullblock if !unsigned<

    b0 = *(uint8 *) (in + 0)
    b0 ^= y0
    *(uint8 *) (out + 0) = b0
                                unsigned>? len - 1
    goto finishpartialblock if !unsigned>

    (uint32) y0 >>= 8
    b1 = *(uint8 *) (in + 1)
    b1 ^= y0
    *(uint8 *) (out + 1) = b1
                                unsigned>? len - 2
    goto finishpartialblock if !unsigned>

    (uint32) y0 >>= 8
    b2 = *(uint8 *) (in + 2)
    b2 ^= y0
    *(uint8 *) (out + 2) = b2
                                unsigned>? len - 3
    goto finishpartialblock if !unsigned>

    (uint32) y0 >>= 8
    b3 = *(uint8 *) (in + 3)
    b3 ^= y0
    *(uint8 *) (out + 3) = b3
                                unsigned>? len - 4
    goto finishpartialblock if !unsigned>

    b0 = *(uint8 *) (in + 4)
    b0 ^= y1
    *(uint8 *) (out + 4) = b0
                                unsigned>? len - 5
    goto finishpartialblock if !unsigned>

    (uint32) y1 >>= 8
    b1 = *(uint8 *) (in + 5)
    b1 ^= y1
    *(uint8 *) (out + 5) = b1
                                unsigned>? len - 6
    goto finishpartialblock if !unsigned>

    (uint32) y1 >>= 8
    b2 = *(uint8 *) (in + 6)
    b2 ^= y1
    *(uint8 *) (out + 6) = b2
                                unsigned>? len - 7
    goto finishpartialblock if !unsigned>

    (uint32) y1 >>= 8
    b3 = *(uint8 *) (in + 7)
    b3 ^= y1
    *(uint8 *) (out + 7) = b3
                                unsigned>? len - 8
    goto finishpartialblock if !unsigned>

    b0 = *(uint8 *) (in + 8)
    b0 ^= y2
    *(uint8 *) (out + 8) = b0
                                unsigned>? len - 9
    goto finishpartialblock if !unsigned>

    (uint32) y2 >>= 8
    b1 = *(uint8 *) (in + 9)
    b1 ^= y2
    *(uint8 *) (out + 9) = b1
                                unsigned>? len - 10
    goto finishpartialblock if !unsigned>

    (uint32) y2 >>= 8
    b2 = *(uint8 *) (in + 10)
    b2 ^= y2
    *(uint8 *) (out + 10) = b2
                                unsigned>? len - 11
    goto finishpartialblock if !unsigned>

    (uint32) y2 >>= 8
    b3 = *(uint8 *) (in + 11)
    b3 ^= y2
    *(uint8 *) (out + 11) = b3
                                unsigned>? len - 12
    goto finishpartialblock if !unsigned>

    b0 = *(uint8 *) (in + 12)
    b0 ^= y3
    *(uint8 *) (out + 12) = b0
                                unsigned>? len - 13
    goto finishpartialblock if !unsigned>

    (uint32) y3 >>= 8
    b1 = *(uint8 *) (in + 13)
    b1 ^= y3
    *(uint8 *) (out + 13) = b1
                                unsigned>? len - 14
    goto finishpartialblock if !unsigned>

    (uint32) y3 >>= 8
    b2 = *(uint8 *) (in + 14)
    b2 ^= y3
    *(uint8 *) (out + 14) = b2
                                unsigned>? len - 15
    goto finishpartialblock if !unsigned>

    (uint32) y3 >>= 8
    b3 = *(uint8 *) (in + 15)
    b3 ^= y3
    *(uint8 *) (out + 15) = b3

finishpartialblock:

    y0 = n0
    y1 = n1
    y2 = n2
    y3 = n3
    y0 += 1

  goto done

fullblock:

  len -= 16

  (uint32) y0 ^= *(uint32 *) (in + 0)
  (uint32) y1 ^= *(uint32 *) (in + 4)
  (uint32) y2 ^= *(uint32 *) (in + 8)
  (uint32) y3 ^= *(uint32 *) (in + 12)
  in += 16

  *(uint32 *) (out + 0) = y0
  *(uint32 *) (out + 4) = y1
  *(uint32 *) (out + 8) = y2
  *(uint32 *) (out + 12) = y3
  out += 16

nextloop:
  
  y0 = n0
  y1 = n1
  y2 = n2
  y3 = n3
  y0 += 1

                unsigned>? len - 0
  goto done if !unsigned>

  in_stack = in

goto mainloop


done:

*(uint32 *) (c + 56) = y0
*(uint32 *) (c + 60) = y1
*(uint32 *) (c + 64) = y2
*(uint32 *) (c + 68) = y3

nothingtodo:

r11_caller = r11_stack
r12_caller = r12_stack
r13_caller = r13_stack
r14_caller = r14_stack
r15_caller = r15_stack
rbx_caller = rbx_stack
rbp_caller = rbp_stack

leave
