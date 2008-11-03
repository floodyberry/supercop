# D. J. Bernstein and Peter Schwabe
# 2008.09.05
# Public domain.

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

int64 check
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

int64 tmp
int64 mainloopbytes

int64 in
int64 out
int64 len

int64 tmpinp
stack64 outstack
int64 lentmp
int64 inv
int64 outv

int6464 n0
int6464 n1
int6464 n2
int6464 n3


stack64 pre10
stack64 pre20
stack64 pre21
stack64 pre22
stack64 pre23

int6464 ty0

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

int3232 r12
int3232 r13
int3232 r14
int3232 r15

int6464 r16
int6464 r20
int6464 r24
int6464 r28
int6464 r32
int6464 r36
int6464 r40

int6464 pr0
int6464 pr1
int6464 pr2
int6464 pr3

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

stack128 tmpin


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
r12 = x0
r13 = x1
r13 ^= r12
r14 = x2
r14 ^= r13
r15 = x3
r15 ^= r14

x0 = *(uint32 *) (c + 28)
r16 = x0

x0 = *(uint32 *) (c + 32)
r20 = x0

x0 = *(uint32 *) (c + 36)
r24 = x0

x0 = *(uint32 *) (c + 40)
r28 = x0

x0 = *(uint32 *) (c + 44)
r32 = x0

x0 = *(uint32 *) (c + 48)
r36 = x0

x0 = *(uint32 *) (c + 52)
r40 = x0

y0 = *(uint32 *) (c + 56)
y1 = *(uint32 *) (c + 60)
y2 = *(uint32 *) (c + 64)
y3 = *(uint32 *) (c + 68)

table = &aes_tablex

n0 = y0
n1 = y1
n2 = y2
n3 = y3

unsigned<? len - 16
goto outerloop if !unsigned<

# Copy input to 16 byte region:
tmpinp = &tmpin
lentmp = len
outstack = out
while (lentmp) { *tmpinp++ = *in++; --lentmp }

in = &tmpin
out = &tmpin
mainloopbytes = 16
len -= 16
goto precompute

outerloop:

  tmp = y0 & 255
  tmp <<= 4
  mainloopbytes = 4096
  mainloopbytes -= tmp

  unsigned<? len - mainloopbytes
  goto happy if !unsigned<
    mainloopbytes = len
    (uint64) mainloopbytes >>= 4
    mainloopbytes <<= 4
  happy:
  
  len -= mainloopbytes

  precompute:

  y1 = n1
  y2 = n2
  y3 = n3

  y0 ^= r0
  y1 ^= r1
  y2 ^= r2
  y3 ^= r3
  
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>>= 16
  z3 = *(uint32 *) (table + 2 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (table + 1 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (table + 4 + p01 * 8)
  (uint32) y0 <<<= 16

  p10 = y1 & 255
  (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
  p11 = (y1 >> 8) & 255
  z0 = *(uint32 *) (table + 2 + p11 * 8)
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

  y1 = r5
  y1 ^= z1
  y2 = r6
  y2 ^= z2
  y3 = r7
  y3 ^= z3

  z0 ^= r4
  pre10 = z0

  p10 = y1 & 255
  z1 = *(uint32 *) (table + 3 + p10 * 8)
  p11 = (y1 >> 8) & 255
  z0 = *(uint32 *) (table + 2 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  z3 = *(uint32 *) (table + 1 + p12 * 8)
  p13 = (y1 >> 8) & 255
  z2 = *(uint32 *) (table + 4 + p13 * 8)
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

  z0 ^= r8
  z1 ^= r9
  z2 ^= r10
  z3 ^= r11
  
  pre20 = z0
  pre21 = z1
  pre22 = z2
  pre23 = z3
  
  y0 ^= r0

  mainloop:
  
    y0 ^= r0
  
    p00 = y0 & 255
    z0 = *(uint32 *) (table + 3 + p00 * 8)
    z0 ^= pre10
  
    p00 = z0 & 255
    y0 = *(uint32 *) (table + 3 + p00 * 8)
    p03 = (z0 >> 8) & 255
    (uint32) z0 >>= 16
    y3 = *(uint32 *) (table + 2 + p03 * 8)
    p02 = z0 & 255
    y2 = *(uint32 *) (table + 1 + p02 * 8)
    p01 = (z0 >> 8) & 255
    y1 = *(uint32 *) (table + 4 + p01 * 8)
  
    y0 ^= pre20
    y1 ^= pre21
    y2 ^= pre22
    y3 ^= pre23

    round3:
  
    p00 = y0 & 255
    z0 = *(uint32 *) (table + 3 + p00 * 8)
    p03 = (y0 >> 8) & 255
    (uint32) y0 >>= 16
    z3 = *(uint32 *) (table + 2 + p03 * 8)
    p02 = y0 & 255
    z2 = *(uint32 *) (table + 1 + p02 * 8)
    p01 = (y0 >> 8) & 255
    z1 = *(uint32 *) (table + 4 + p01 * 8)
    
    y0 = r12
    
    p10 = y1 & 255
    (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
    p11 = (y1 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
    (uint32) y1 >>= 16
    p12 = y1 & 255
    (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
    p13 = (y1 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
    
    y1 = r13
  
    p20 = y2 & 255
    pr1 = y1
    (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
    p21 = (y2 >> 8) & 255
    (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
    (uint32) y2 >>= 16
    p22 = y2 & 255
    (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
    
    (uint32) y3 >>>= 16
    p33 = (y3 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
    
    p23 = (y2 >> 8) & 255
    (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
    
    y2 = r14
    pr2 = y2
    
    p32 = y3 & 255
    (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
    (uint32) y3 >>>= 16
    p31 = (y3 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
    y0 ^= z0
    p30 = y3 & 255
    (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
    
    y3 = r15
    pr3 = y3
  
    y1 ^= z1
    y2 ^= z2
    y3 ^= z3
  
    round4:
  
    p00 = y0 & 255
    z0 = *(uint32 *) (table + 3 + p00 * 8)
    p03 = (y0 >> 8) & 255
    (uint32) y0 >>= 16
    z3 = *(uint32 *) (table + 2 + p03 * 8)
    p02 = y0 & 255
    z2 = *(uint32 *) (table + 1 + p02 * 8)
    p01 = (y0 >> 8) & 255
    z1 = *(uint32 *) (table + 4 + p01 * 8)
    
    y0 = r16
    
    p10 = y1 & 255
    ty0 = y0
    (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
    p11 = (y1 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
    (uint32) y1 >>= 16
    p12 = y1 & 255
    (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
    p13 = (y1 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
    
    pr1 ^= ty0
  
    p20 = y2 & 255
    pr2 ^= pr1
    (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
    p21 = (y2 >> 8) & 255
    (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
    pr3 ^= pr2
    (uint32) y2 >>= 16
    p22 = y2 & 255
    (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
    
    (uint32) y3 >>>= 16
    p33 = (y3 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
    
    p23 = (y2 >> 8) & 255
    (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
    y1 = pr1
    
    y2 = pr2
    
    p32 = y3 & 255
    (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
    (uint32) y3 >>>= 16
    p31 = (y3 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
    y0 ^= z0
    p30 = y3 & 255
    (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
    
    y3 = pr3
  
    y1 ^= z1
    y2 ^= z2
    y3 ^= z3
  
    round5:
  
    p00 = y0 & 255
    z0 = *(uint32 *) (table + 3 + p00 * 8)
    p03 = (y0 >> 8) & 255
    (uint32) y0 >>= 16
    z3 = *(uint32 *) (table + 2 + p03 * 8)
    p02 = y0 & 255
    z2 = *(uint32 *) (table + 1 + p02 * 8)
    p01 = (y0 >> 8) & 255
    z1 = *(uint32 *) (table + 4 + p01 * 8)
    
    y0 = r20
    
    p10 = y1 & 255
    ty0 = y0
    (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
    p11 = (y1 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
    (uint32) y1 >>= 16
    p12 = y1 & 255
    (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
    p13 = (y1 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
    
    pr1 ^= ty0
  
    p20 = y2 & 255
    pr2 ^= pr1
    (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
    p21 = (y2 >> 8) & 255
    (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
    pr3 ^= pr2
    (uint32) y2 >>= 16
    p22 = y2 & 255
    (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
    
    (uint32) y3 >>>= 16
    p33 = (y3 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
    
    p23 = (y2 >> 8) & 255
    (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
    y1 = pr1
    
    y2 = pr2
    
    p32 = y3 & 255
    (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
    (uint32) y3 >>>= 16
    p31 = (y3 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
    y0 ^= z0
    p30 = y3 & 255
    (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
    
    y3 = pr3
  
    y1 ^= z1
    y2 ^= z2
    y3 ^= z3
  
    round6:
  
    p00 = y0 & 255
    z0 = *(uint32 *) (table + 3 + p00 * 8)
    p03 = (y0 >> 8) & 255
    (uint32) y0 >>= 16
    z3 = *(uint32 *) (table + 2 + p03 * 8)
    p02 = y0 & 255
    z2 = *(uint32 *) (table + 1 + p02 * 8)
    p01 = (y0 >> 8) & 255
    z1 = *(uint32 *) (table + 4 + p01 * 8)
    
    y0 = r24
    
    p10 = y1 & 255
    ty0 = y0
    (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
    p11 = (y1 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
    (uint32) y1 >>= 16
    p12 = y1 & 255
    (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
    p13 = (y1 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
    
    pr1 ^= ty0
  
    p20 = y2 & 255
    pr2 ^= pr1
    (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
    p21 = (y2 >> 8) & 255
    (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
    pr3 ^= pr2
    (uint32) y2 >>= 16
    p22 = y2 & 255
    (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
    
    (uint32) y3 >>>= 16
    p33 = (y3 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
    
    p23 = (y2 >> 8) & 255
    (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
    y1 = pr1
    
    y2 = pr2
    
    p32 = y3 & 255
    (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
    (uint32) y3 >>>= 16
    p31 = (y3 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
    y0 ^= z0
    p30 = y3 & 255
    (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
    
    y3 = pr3
  
    y1 ^= z1
    y2 ^= z2
    y3 ^= z3
  
    round7:
  
    p00 = y0 & 255
    z0 = *(uint32 *) (table + 3 + p00 * 8)
    p03 = (y0 >> 8) & 255
    (uint32) y0 >>= 16
    z3 = *(uint32 *) (table + 2 + p03 * 8)
    p02 = y0 & 255
    z2 = *(uint32 *) (table + 1 + p02 * 8)
    p01 = (y0 >> 8) & 255
    z1 = *(uint32 *) (table + 4 + p01 * 8)
    
    y0 = r28
    
    p10 = y1 & 255
    ty0 = y0
    (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
    p11 = (y1 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
    (uint32) y1 >>= 16
    p12 = y1 & 255
    (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
    p13 = (y1 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
    
    pr1 ^= ty0
  
    p20 = y2 & 255
    pr2 ^= pr1
    (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
    p21 = (y2 >> 8) & 255
    (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
    pr3 ^= pr2
    (uint32) y2 >>= 16
    p22 = y2 & 255
    (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
    
    (uint32) y3 >>>= 16
    p33 = (y3 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
    
    p23 = (y2 >> 8) & 255
    (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
    y1 = pr1
    
    y2 = pr2
    
    p32 = y3 & 255
    (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
    (uint32) y3 >>>= 16
    p31 = (y3 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
    y0 ^= z0
    p30 = y3 & 255
    (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
    
    y3 = pr3
  
    y1 ^= z1
    y2 ^= z2
    y3 ^= z3
  
  
    round8:
   
    p00 = y0 & 255
    z0 = *(uint32 *) (table + 3 + p00 * 8)
    p03 = (y0 >> 8) & 255
    (uint32) y0 >>= 16
    z3 = *(uint32 *) (table + 2 + p03 * 8)
    p02 = y0 & 255
    z2 = *(uint32 *) (table + 1 + p02 * 8)
    p01 = (y0 >> 8) & 255
    z1 = *(uint32 *) (table + 4 + p01 * 8)
    
    y0 = r32
    
    p10 = y1 & 255
    ty0 = y0
    (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
    p11 = (y1 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
    (uint32) y1 >>= 16
    p12 = y1 & 255
    (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
    p13 = (y1 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
    
    pr1 ^= ty0
  
    p20 = y2 & 255
    pr2 ^= pr1
    (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
    p21 = (y2 >> 8) & 255
    (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
    pr3 ^= pr2
    (uint32) y2 >>= 16
    p22 = y2 & 255
    (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
    
    (uint32) y3 >>>= 16
    p33 = (y3 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
    
    p23 = (y2 >> 8) & 255
    (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
    y1 = pr1
    
    y2 = pr2
    
    p32 = y3 & 255
    (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
    (uint32) y3 >>>= 16
    p31 = (y3 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
    y0 ^= z0
    p30 = y3 & 255
    (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
    
    y3 = pr3
  
    y1 ^= z1
    y2 ^= z2
    y3 ^= z3
  
    round9:
   
    p00 = y0 & 255
    z0 = *(uint32 *) (table + 3 + p00 * 8)
    p03 = (y0 >> 8) & 255
    (uint32) y0 >>= 16
    z3 = *(uint32 *) (table + 2 + p03 * 8)
    p02 = y0 & 255
    z2 = *(uint32 *) (table + 1 + p02 * 8)
    p01 = (y0 >> 8) & 255
    z1 = *(uint32 *) (table + 4 + p01 * 8)
    
    y0 = r36
    
    p10 = y1 & 255
    ty0 = y0
    (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
    p11 = (y1 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
    (uint32) y1 >>= 16
    p12 = y1 & 255
    (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
    p13 = (y1 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
    
    pr1 ^= ty0
  
    p20 = y2 & 255
    pr2 ^= pr1
    (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
    p21 = (y2 >> 8) & 255
    (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
    pr3 ^= pr2
    (uint32) y2 >>= 16
    p22 = y2 & 255
    (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
    
    (uint32) y3 >>>= 16
    p33 = (y3 >> 8) & 255
    (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
    
    p23 = (y2 >> 8) & 255
    (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
    y1 = pr1
    
    y2 = pr2
    
    p32 = y3 & 255
    (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
    (uint32) y3 >>>= 16
    p31 = (y3 >> 8) & 255
    (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
    y0 ^= z0
    p30 = y3 & 255
    (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
    
    y3 = pr3
  
    y1 ^= z1
    y2 ^= z2
    y3 ^= z3
  
  
    round10:
  
    z0 = y0 & 255
    z0 = *(uint8 *) (table + 1 + z0 * 8)
    z3 = (y0 >> 8) & 255
    z3 = *(uint16 *) (table + z3 * 8)
    (uint32) y0 >>= 16
    z2 = y0 & 255
    z2 = *(uint32 *) (table + 2048 + z2 * 8)
    z1 = (y0 >> 8) & 255
    z1 = *(uint32 *) (table + 2052 + z1 * 8)
  
    y0 = r40
    
    p10 = y1 & 255
    p10 = *(uint8 *) (table + 1 + p10 * 8)
    z1 ^= p10
    p11 = (y1 >> 8) & 255
    p11 = *(uint16 *) (table + p11 * 8)
    z0 ^= p11
    (uint32) y1 >>= 16
    p12 = y1 & 255
    p12 = *(uint32 *) (table + 2048 + p12 * 8)
    z3 ^= p12
    p13 = (y1 >> 8) & 255
    p13 = *(uint32 *) (table + 2052 + p13 * 8)
    z2 ^= p13
    y1 = pr1
  
    p20 = y2 & 255
    y1 ^= y0
    p20 = *(uint8 *) (table + 1 + p20 * 8)
    z2 ^= p20
    p21 = (y2 >> 8) & 255
    p21 = *(uint16 *) (table + p21 * 8)
    z1 ^= p21
    (uint32) y2 >>= 16
    p22 = y2 & 255
    p22 = *(uint32 *) (table + 2048 + p22 * 8)
    z0 ^= p22
    p23 = (y2 >> 8) & 255
    p23 = *(uint32 *) (table + 2052 + p23 * 8)
    y2 = pr2
    z3 ^= p23
  
    
    (uint32) y3 >>>= 16
    y2 ^= y1
    p33 = (y3 >> 8) & 255
    p33 = *(uint32 *) (table + 2052 + p33 * 8)
    z0 ^= p33
    p32 = y3 & 255
    p32 = *(uint32 *) (table + 2048 + p32 * 8)
    z1 ^= p32
    (uint32) y3 >>>= 16
    p31 = (y3 >> 8) & 255
    p31 = *(uint16 *) (table + p31 * 8)
    z2 ^= p31
    p30 = y3 & 255
    p30 = *(uint8 *) (table + 1 + p30 * 8)
    z3 ^= p30
  
    y3 = pr3
    y3 ^= y2
  
    z0 ^= y0
    z1 ^= y1
    z2 ^= y2
    z3 ^= y3
  
    
    (uint32) z0 ^= *(uint32 *) (in + 0)
    (uint32) z1 ^= *(uint32 *) (in + 4)
    (uint32) z2 ^= *(uint32 *) (in + 8)
    (uint32) z3 ^= *(uint32 *) (in + 12)
    in += 16
  
    *(uint32 *) (out + 0) = z0
    *(uint32 *) (out + 4) = z1
    *(uint32 *) (out + 8) = z2
    *(uint32 *) (out + 12) = z3
    out += 16
    
    y0 = n0
    y0 += 1
    n0 = y0
    unsigned>? mainloopbytes -= 16
  
    # Usually we can just go back to mainloop
    goto mainloop if unsigned>
  
  # If length is <= 0, then we're in the case, that we have to process the last few (already encrypted) remaining bytes
  signed>? =? len - 0
    goto done if =
    goto processlastbytes if !signed>

  # If there is still a full block left, we just have to do precomputation
  unsigned<? len - 16
    goto outerloop if !unsigned<

  # Otherwise we have to copy the remaining (less than 16) bytes to a region consisting of 16 bytes
  tmpinp = &tmpin
  lentmp = len
  outstack = out
  while (lentmp) { *tmpinp++ = *in++; --lentmp }

  in = &tmpin
  out = &tmpin
  len -= 16
  mainloopbytes = 16

  # Check whether we need precomputation for the last bytes
  tmp = y0 & 255
  =? tmp - 0 
    goto mainloop if !=
    goto precompute

processlastbytes:


len += 16
tmpinp = &tmpin
out = outstack
lentmp = len
while (lentmp) { *out++ = *tmpinp++; --lentmp }

done:
  
  y1 = n1
  y2 = n2
  y3 = n3

*(uint32 *) (c + 56) = y0
*(uint32 *) (c + 60) = y1
*(uint32 *) (c + 64) = y2
*(uint32 *) (c + 68) = y3

nothingtodo:

emms
r11_caller = r11_stack
r12_caller = r12_stack
r13_caller = r13_stack
r14_caller = r14_stack
r15_caller = r15_stack
rbx_caller = rbx_stack
rbp_caller = rbp_stack

leave
