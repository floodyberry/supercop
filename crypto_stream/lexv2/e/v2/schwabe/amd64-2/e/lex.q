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

int3232 x0_save
int3232 x1_save
int3232 x2_save
int3232 x3_save

int3232 mmx0
int3232 mmx1
int3232 mmx2
int3232 mmx3

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
stack64 out_stack
stack64 len_stack

stack320 stream
int64 streamp


int64 leak0
int64 leak1
int64 tmp0
int64 tmp1

stack64 r0
stack64 r1
stack64 r2
stack64 r3
#stack64 r4
#stack64 r5
#stack64 r6
#stack64 r7
#stack64 r8
#stack64 r9
#stack64 r10
#stack64 r11
#stack64 r12
#stack64 r13
#stack64 r14
#stack64 r15
#stack64 r16
#stack64 r17
#stack64 r18
#stack64 r19
#stack64 r20
#stack64 r21
#stack64 r22
#stack64 r23
#stack64 r24
#stack64 r25
#stack64 r26
#stack64 r27
#stack64 r28
#stack64 r29
#stack64 r30
#stack64 r31
#stack64 r32
#stack64 r33
#stack64 r34
#stack64 r35
#stack64 r36
#stack64 r37
#stack64 r38
#stack64 r39
#stack64 r40
#stack64 r41
#stack64 r42
#stack64 r43
#
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


enter ECRYPT_init
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

emms

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

unsigned>? len - 0
goto nothingtodo if !unsigned>

y0 = *(uint32 *) (c + 56)
y1 = *(uint32 *) (c + 60)
y2 = *(uint32 *) (c + 64)
y3 = *(uint32 *) (c + 68)

table = &aes_tablex

x0_save = *(uint32 *) (c + 0)
x1_save = *(uint32 *) (c + 4)
x2_save = *(uint32 *) (c + 8)
x3_save = *(uint32 *) (c + 12)

x0_save = *(uint32 *) (c + 16)
x1_save ^= x0_save
x2_save ^= x1_save
x3_save ^= x2_save

r0 = x0_save
r1 = x1_save
r2 = x2_save
r3 = x3_save

unsigned<? len - 40
goto lessthan40bytesleft if unsigned< 

mainloop:

  mmx0 = x0_save 
  mmx1 = x1_save
  mmx2 = x2_save 
  mmx3 = x3_save 

#  mmx0 = r0
#  mmx1 = r1
#  mmx2 = r2 
#  mmx3 = r3

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

  x0 = mmx0
  x1 = mmx1
  x2 = mmx2
  x3 = mmx3

  y0 = x0
  y0 ^= z0
  y1 = x1
  y1 ^= z1
  y2 = x2
  y2 ^= z2
  y3 = x3
  y3 ^= z3
  
  leak0 = y0 
  (uint32) leak0 &= 0xff00ff
  (uint32) leak0 <<<= 24
  leak1 = y2
  (uint32) leak1 &= 0xff00ff
  (uint32) leak1 <<<= 16
  leak0 ^= leak1
  (uint32) leak0 ^= *(uint32 *) (in + 0)
  *(uint32 *) (out + 0) = leak0

  mmx0 = *(uint32 *) (c + 20)
  mmx1 ^= mmx0
  mmx2 ^= mmx1
  mmx3 ^= mmx2

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

  x0 = mmx0
  x1 = mmx1
  x2 = mmx2
  x3 = mmx3

  y0 = x0
  y0 ^= z0
  y1 = x1
  y1 ^= z1
  y2 = x2
  y2 ^= z2
  y3 = x3
  y3 ^= z3

  leak0 = y0 
  (uint32) leak0 &= 0xff00ff00
  (uint32) leak0 <<<= 16
  leak1 = y2
  (uint32) leak1 &= 0xff00ff00
  (uint32) leak1 <<<= 8
  leak0 ^= leak1
  (uint32) leak0 ^= *(uint32 *) (in + 4)
  *(uint32 *) (out + 4) = leak0

  mmx0 = *(uint32 *) (c + 24)
  mmx1 ^= mmx0
  mmx2 ^= mmx1
  mmx3 ^= mmx2

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

  x0 = mmx0
  x1 = mmx1
  x2 = mmx2
  x3 = mmx3

  y0 = x0
  y0 ^= z0
  y1 = x1
  y1 ^= z1
  y2 = x2
  y2 ^= z2
  y3 = x3
  y3 ^= z3

  leak0 = y0 
  (uint32) leak0 &= 0xff00ff
  (uint32) leak0 <<<= 24
  leak1 = y2
  (uint32) leak1 &= 0xff00ff
  (uint32) leak1 <<<= 16
  leak0 ^= leak1
  (uint32) leak0 ^= *(uint32 *) (in + 8)
  *(uint32 *) (out + 8) = leak0

  mmx0 = *(uint32 *) (c + 28)
  mmx1 ^= mmx0
  mmx2 ^= mmx1
  mmx3 ^= mmx2

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

  x0 = mmx0
  x1 = mmx1
  x2 = mmx2
  x3 = mmx3

  y0 = x0
  y0 ^= z0
  y1 = x1
  y1 ^= z1
  y2 = x2
  y2 ^= z2
  y3 = x3
  y3 ^= z3

  leak0 = y0 
  (uint32) leak0 &= 0xff00ff00
  (uint32) leak0 <<<= 16
  leak1 = y2
  (uint32) leak1 &= 0xff00ff00
  (uint32) leak1 <<<= 8
  leak0 ^= leak1
  (uint32) leak0 ^= *(uint32 *) (in + 12)
  *(uint32 *) (out + 12) = leak0

  mmx0 = *(uint32 *) (c + 32)
  mmx1 ^= mmx0
  mmx2 ^= mmx1
  mmx3 ^= mmx2

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

  x0 = mmx0
  x1 = mmx1
  x2 = mmx2
  x3 = mmx3

  y0 = x0
  y0 ^= z0
  y1 = x1
  y1 ^= z1
  y2 = x2
  y2 ^= z2
  y3 = x3
  y3 ^= z3


  leak0 = y0 
  (uint32) leak0 &= 0xff00ff
  (uint32) leak0 <<<= 24
  leak1 = y2
  (uint32) leak1 &= 0xff00ff
  (uint32) leak1 <<<= 16
  leak0 ^= leak1
  (uint32) leak0 ^= *(uint32 *) (in + 16)
  *(uint32 *) (out + 16) = leak0

  mmx0 = *(uint32 *) (c + 36)
  mmx1 ^= mmx0
  mmx2 ^= mmx1
  mmx3 ^= mmx2

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

  x0 = mmx0
  x1 = mmx1
  x2 = mmx2
  x3 = mmx3

  y0 = x0
  y0 ^= z0
  y1 = x1
  y1 ^= z1
  y2 = x2
  y2 ^= z2
  y3 = x3
  y3 ^= z3


  leak0 = y0 
  (uint32) leak0 &= 0xff00ff00
  (uint32) leak0 <<<= 16
  leak1 = y2
  (uint32) leak1 &= 0xff00ff00
  (uint32) leak1 <<<= 8
  leak0 ^= leak1
  (uint32) leak0 ^= *(uint32 *) (in + 20)
  *(uint32 *) (out + 20) = leak0

  mmx0 = *(uint32 *) (c + 40)
  mmx1 ^= mmx0
  mmx2 ^= mmx1
  mmx3 ^= mmx2


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

  x0 = mmx0
  x1 = mmx1
  x2 = mmx2
  x3 = mmx3

  y0 = x0
  y0 ^= z0
  y1 = x1
  y1 ^= z1
  y2 = x2
  y2 ^= z2
  y3 = x3
  y3 ^= z3


  leak0 = y0 
  (uint32) leak0 &= 0xff00ff
  (uint32) leak0 <<<= 24
  leak1 = y2
  (uint32) leak1 &= 0xff00ff
  (uint32) leak1 <<<= 16
  leak0 ^= leak1
  (uint32) leak0 ^= *(uint32 *) (in + 24)
  *(uint32 *) (out + 24) = leak0

  mmx0 = *(uint32 *) (c + 44)
  mmx1 ^= mmx0
  mmx2 ^= mmx1
  mmx3 ^= mmx2

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

  x0 = mmx0
  x1 = mmx1
  x2 = mmx2
  x3 = mmx3

  y0 = x0
  y0 ^= z0
  y1 = x1
  y1 ^= z1
  y2 = x2
  y2 ^= z2
  y3 = x3
  y3 ^= z3


  leak0 = y0 
  (uint32) leak0 &= 0xff00ff00
  (uint32) leak0 <<<= 16
  leak1 = y2
  (uint32) leak1 &= 0xff00ff00
  (uint32) leak1 <<<= 8
  leak0 ^= leak1
  (uint32) leak0 ^= *(uint32 *) (in + 28)
  *(uint32 *) (out + 28) = leak0

  mmx0 = *(uint32 *) (c + 48)
  mmx1 ^= mmx0
  mmx2 ^= mmx1
  mmx3 ^= mmx2


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
  
  x0 = mmx0
  x1 = mmx1
  x2 = mmx2
  x3 = mmx3

  y0 = x0
  y0 ^= z0
  y1 = x1
  y1 ^= z1
  y2 = x2
  y2 ^= z2
  y3 = x3
  y3 ^= z3

  leak0 = y0 
  (uint32) leak0 &= 0xff00ff
  (uint32) leak0 <<<= 24
  leak1 = y2
  (uint32) leak1 &= 0xff00ff
  (uint32) leak1 <<<= 16
  leak0 ^= leak1
  (uint32) leak0 ^= *(uint32 *) (in + 32)
  *(uint32 *) (out + 32) = leak0

  mmx0 = *(uint32 *) (c + 52)
  mmx1 ^= mmx0
  mmx2 ^= mmx1
  mmx3 ^= mmx2

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
  
  x0 = mmx0
  x1 = mmx1
  x2 = mmx2
  x3 = mmx3

  y0 = x0
  y0 ^= z0
  y1 = x1
  y1 ^= z1
  y2 = x2
  y2 ^= z2
  y3 = x3
  y3 ^= z3

  leak0 = y0 
  (uint32) leak0 &= 0xff00ff00
  (uint32) leak0 <<<= 16
  leak1 = y2
  (uint32) leak1 &= 0xff00ff00
  (uint32) leak1 <<<= 8
  leak0 ^= leak1
  (uint32) leak0 ^= *(uint32 *) (in + 36)
  *(uint32 *) (out + 36) = leak0

  in += 40
  out += 40
  len -= 40

  signed<? len - 40
goto mainloop if !signed< 

lessthan40bytesleft:

=? signed<? len - 0

goto done if =

goto copy if signed<

in_stack = in
out_stack = out
len_stack = len

tmp0 = 0

in = &stream

*(uint64 *) (in + 0) = tmp0
*(uint64 *) (in + 8) = tmp0
*(uint64 *) (in + 16) = tmp0
*(uint64 *) (in + 24) = tmp0
*(uint64 *) (in + 32) = tmp0

out = in

goto mainloop

copy:

in = in_stack
out = out_stack
len = len_stack

streamp = &stream

copyloop:

unsigned<? len - 1
goto done if unsigned<

tmp0 = *(uint8 *) (streamp + 0)
tmp1 = *(uint8 *) (in + 0)
tmp0 ^= tmp1
*(uint8 *) (out + 0) = tmp0

len -= 1
in += 1
out += 1
streamp += 1

goto copyloop

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
