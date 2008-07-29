stack32 arg1
stack32 arg2
stack32 arg3
stack32 arg4
stack32 arg5
input arg1
input arg2
input arg3
input arg4
input arg5

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

int32 c
int32 k
int32 iv

int32 x0
int32 x1
int32 x2
int32 x3
int32 e
int32 q0
int32 q1
int32 q2
int32 q3

int32 in
int32 out
int32 len

int3232 c_stack
int3232 in_stack
int3232 out_stack
int3232 len_stack

int3232 y1_stack
int3232 y2_stack
int3232 y3_stack
int3232 z1_stack
int3232 z2_stack
int3232 z3_stack

stack32 n0
stack32 n1
stack32 n2
stack32 n3

stack32 r0
stack32 r1
stack32 r2
stack32 r3
stack32 r4
stack32 r5
stack32 r6
stack32 r7
stack32 r8
stack32 r9
stack32 r10
stack32 r11
stack32 r12
stack32 r13
stack32 r14
stack32 r15
stack32 r16
stack32 r17
stack32 r18
stack32 r19
stack32 r20
stack32 r21
stack32 r22
stack32 r23
stack32 r24
stack32 r25
stack32 r26
stack32 r27
stack32 r28
stack32 r29
stack32 r30
stack32 r31
stack32 r32
stack32 r33
stack32 r34
stack32 r35
stack32 r36
stack32 r37
stack32 r38
stack32 r39
stack32 r40
stack32 r41
stack32 r42
stack32 r43

int32 y0
int32 y1
int32 y2
int32 y3

int32 z0
int32 z1
int32 z2
int32 z3

int32 p00
int32 p01
int32 p02
int32 p03

int32 p10
int32 p11
int32 p12
int32 p13

int32 p20
int32 p21
int32 p22
int32 p23

int32 p30
int32 p31
int32 p32
int32 p33

int32 b0
int32 b1
int32 b2
int32 b3


enter ECRYPT_init
leave


enter ECRYPT_ivsetup

eax_stack = eax
ebx_stack = ebx
esi_stack = esi
edi_stack = edi
ebp_stack = ebp

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

eax = eax_stack
ebx = ebx_stack
esi = esi_stack
edi = edi_stack
ebp = ebp_stack

leave


enter ECRYPT_keysetup

eax_stack = eax
ebx_stack = ebx
esi_stack = esi
edi_stack = edi
ebp_stack = ebp

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

e = (x3 >> 8) & 255
e = *(uint8 *) (&aes_table2 + e * 8)
e ^= 0x01
q3 = x3 & 255
x3 <<<= 16
q3 = *(uint32 *) (&aes_table1 + q3 * 8)
q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (&aes_table0 + q2 * 8)
q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
x3 <<<= 16
q1 = *(uint16 *) (&aes_tablex + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 16) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (&aes_table2 + e * 8)
e ^= 0x02
q3 = x3 & 255
x3 <<<= 16
q3 = *(uint32 *) (&aes_table1 + q3 * 8)
q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (&aes_table0 + q2 * 8)
q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
x3 <<<= 16
q1 = *(uint16 *) (&aes_tablex + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 20) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (&aes_table2 + e * 8)
e ^= 0x04
q3 = x3 & 255
x3 <<<= 16
q3 = *(uint32 *) (&aes_table1 + q3 * 8)
q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (&aes_table0 + q2 * 8)
q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
x3 <<<= 16
q1 = *(uint16 *) (&aes_tablex + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 24) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (&aes_table2 + e * 8)
e ^= 0x08
q3 = x3 & 255
x3 <<<= 16
q3 = *(uint32 *) (&aes_table1 + q3 * 8)
q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (&aes_table0 + q2 * 8)
q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
x3 <<<= 16
q1 = *(uint16 *) (&aes_tablex + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 28) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (&aes_table2 + e * 8)
e ^= 0x10
q3 = x3 & 255
x3 <<<= 16
q3 = *(uint32 *) (&aes_table1 + q3 * 8)
q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (&aes_table0 + q2 * 8)
q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
x3 <<<= 16
q1 = *(uint16 *) (&aes_tablex + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 32) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (&aes_table2 + e * 8)
e ^= 0x20
q3 = x3 & 255
x3 <<<= 16
q3 = *(uint32 *) (&aes_table1 + q3 * 8)
q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (&aes_table0 + q2 * 8)
q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
x3 <<<= 16
q1 = *(uint16 *) (&aes_tablex + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 36) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (&aes_table2 + e * 8)
e ^= 0x40
q3 = x3 & 255
x3 <<<= 16
q3 = *(uint32 *) (&aes_table1 + q3 * 8)
q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (&aes_table0 + q2 * 8)
q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
x3 <<<= 16
q1 = *(uint16 *) (&aes_tablex + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 40) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (&aes_table2 + e * 8)
e ^= 0x80
q3 = x3 & 255
x3 <<<= 16
q3 = *(uint32 *) (&aes_table1 + q3 * 8)
q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (&aes_table0 + q2 * 8)
q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
x3 <<<= 16
q1 = *(uint16 *) (&aes_tablex + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 44) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (&aes_table2 + e * 8)
e ^= 0x1b
q3 = x3 & 255
x3 <<<= 16
q3 = *(uint32 *) (&aes_table1 + q3 * 8)
q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (&aes_table0 + q2 * 8)
q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
x3 <<<= 16
q1 = *(uint16 *) (&aes_tablex + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 48) = x0
x1 ^= x0
x2 ^= x1
x3 ^= x2

e = (x3 >> 8) & 255
e = *(uint8 *) (&aes_table2 + e * 8)
e ^= 0x36
q3 = x3 & 255
x3 <<<= 16
q3 = *(uint32 *) (&aes_table1 + q3 * 8)
q3 &= 0xff000000
e ^= q3
q2 = (x3 >> 8) & 255
q2 = *(uint32 *) (&aes_table0 + q2 * 8)
q2 &= 0x00ff0000
e ^= q2
q1 = x3 & 255
x3 <<<= 16
q1 = *(uint16 *) (&aes_tablex + q1 * 8)
e ^= q1
x0 ^= e
*(uint32 *) (c + 52) = x0

eax = eax_stack
ebx = ebx_stack
esi = esi_stack
edi = edi_stack
ebp = ebp_stack

leave


enter ECRYPT_process_bytes stackaligned4096 aes_constants

eax_stack = eax
ebx_stack = ebx
esi_stack = esi
edi_stack = edi
ebp_stack = ebp

c = arg2
in = arg3
out = arg4
len = arg5

c_stack = c
in_stack = in
out_stack = out
len_stack = len

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


mainloop:

  n0 = y0
  n1 = y1
  n2 = y2
  n3 = y3

  y0 ^= r0
  y1 ^= r1
  y2 ^= r2
  y3 ^= r3

  
  y3_stack = y3
  p00 = y0 & 255
  z0 = *(uint32 *) (&aes_table0 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (&aes_table1 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (&aes_table2 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (&aes_table3 + p01 * 8)
  p10 = y1 & 255
  z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
  p11 = (y1 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
  p13 = (y1 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
  y3 = y3_stack
  p20 = y2 & 255
  z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
  p21 = (y2 >> 8) & 255
  z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
  p30 = y3 & 255
  z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
  p31 = (y3 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
  p33 = (y3 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
  y0 = r4
  y0 ^= z0
  y1 = r5
  y1 ^= z1
  y2 = r6
  y2 ^= z2
  y3 = r7
  y3 ^= z3

  y3_stack = y3
  p00 = y0 & 255
  z0 = *(uint32 *) (&aes_table0 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (&aes_table1 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (&aes_table2 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (&aes_table3 + p01 * 8)
  p10 = y1 & 255
  z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
  p11 = (y1 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
  p13 = (y1 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
  y3 = y3_stack
  p20 = y2 & 255
  z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
  p21 = (y2 >> 8) & 255
  z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
  p30 = y3 & 255
  z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
  p31 = (y3 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
  p33 = (y3 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
  y0 = r8
  y0 ^= z0
  y1 = r9
  y1 ^= z1
  y2 = r10
  y2 ^= z2
  y3 = r11
  y3 ^= z3

  y3_stack = y3
  p00 = y0 & 255
  z0 = *(uint32 *) (&aes_table0 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (&aes_table1 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (&aes_table2 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (&aes_table3 + p01 * 8)
  p10 = y1 & 255
  z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
  p11 = (y1 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
  p13 = (y1 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
  y3 = y3_stack
  p20 = y2 & 255
  z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
  p21 = (y2 >> 8) & 255
  z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
  p30 = y3 & 255
  z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
  p31 = (y3 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
  p33 = (y3 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
  y0 = r12
  y0 ^= z0
  y1 = r13
  y1 ^= z1
  y2 = r14
  y2 ^= z2
  y3 = r15
  y3 ^= z3

  y3_stack = y3
  p00 = y0 & 255
  z0 = *(uint32 *) (&aes_table0 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (&aes_table1 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (&aes_table2 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (&aes_table3 + p01 * 8)
  p10 = y1 & 255
  z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
  p11 = (y1 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
  p13 = (y1 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
  y3 = y3_stack
  p20 = y2 & 255
  z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
  p21 = (y2 >> 8) & 255
  z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
  p30 = y3 & 255
  z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
  p31 = (y3 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
  p33 = (y3 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
  y0 = r16
  y0 ^= z0
  y1 = r17
  y1 ^= z1
  y2 = r18
  y2 ^= z2
  y3 = r19
  y3 ^= z3

  y3_stack = y3
  p00 = y0 & 255
  z0 = *(uint32 *) (&aes_table0 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (&aes_table1 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (&aes_table2 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (&aes_table3 + p01 * 8)
  p10 = y1 & 255
  z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
  p11 = (y1 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
  p13 = (y1 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
  y3 = y3_stack
  p20 = y2 & 255
  z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
  p21 = (y2 >> 8) & 255
  z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
  p30 = y3 & 255
  z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
  p31 = (y3 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
  p33 = (y3 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
  y0 = r20
  y0 ^= z0
  y1 = r21
  y1 ^= z1
  y2 = r22
  y2 ^= z2
  y3 = r23
  y3 ^= z3

  y3_stack = y3
  p00 = y0 & 255
  z0 = *(uint32 *) (&aes_table0 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (&aes_table1 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (&aes_table2 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (&aes_table3 + p01 * 8)
  p10 = y1 & 255
  z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
  p11 = (y1 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
  p13 = (y1 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
  y3 = y3_stack
  p20 = y2 & 255
  z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
  p21 = (y2 >> 8) & 255
  z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
  p30 = y3 & 255
  z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
  p31 = (y3 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
  p33 = (y3 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
  y0 = r24
  y0 ^= z0
  y1 = r25
  y1 ^= z1
  y2 = r26
  y2 ^= z2
  y3 = r27
  y3 ^= z3

  y3_stack = y3
  p00 = y0 & 255
  z0 = *(uint32 *) (&aes_table0 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (&aes_table1 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (&aes_table2 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (&aes_table3 + p01 * 8)
  p10 = y1 & 255
  z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
  p11 = (y1 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
  p13 = (y1 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
  y3 = y3_stack
  p20 = y2 & 255
  z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
  p21 = (y2 >> 8) & 255
  z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
  p30 = y3 & 255
  z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
  p31 = (y3 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
  p33 = (y3 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
  y0 = r28
  y0 ^= z0
  y1 = r29
  y1 ^= z1
  y2 = r30
  y2 ^= z2
  y3 = r31
  y3 ^= z3

  y3_stack = y3
  p00 = y0 & 255
  z0 = *(uint32 *) (&aes_table0 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (&aes_table1 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (&aes_table2 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (&aes_table3 + p01 * 8)
  p10 = y1 & 255
  z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
  p11 = (y1 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
  p13 = (y1 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
  y3 = y3_stack
  p20 = y2 & 255
  z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
  p21 = (y2 >> 8) & 255
  z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
  p30 = y3 & 255
  z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
  p31 = (y3 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
  p33 = (y3 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
  y0 = r32
  y0 ^= z0
  y1 = r33
  y1 ^= z1
  y2 = r34
  y2 ^= z2
  y3 = r35
  y3 ^= z3

  y3_stack = y3
  p00 = y0 & 255
  z0 = *(uint32 *) (&aes_table0 + p00 * 8)
  p03 = (y0 >> 8) & 255
  (uint32) y0 >>= 16
  z3 = *(uint32 *) (&aes_table1 + p03 * 8)
  p02 = y0 & 255
  z2 = *(uint32 *) (&aes_table2 + p02 * 8)
  p01 = (y0 >> 8) & 255
  z1 = *(uint32 *) (&aes_table3 + p01 * 8)
  p10 = y1 & 255
  z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
  p11 = (y1 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
  (uint32) y1 >>= 16
  p12 = y1 & 255
  z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
  p13 = (y1 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
  y3 = y3_stack
  p20 = y2 & 255
  z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
  p21 = (y2 >> 8) & 255
  z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
  (uint32) y2 >>= 16
  p22 = y2 & 255
  z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
  p23 = (y2 >> 8) & 255
  z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
  p30 = y3 & 255
  z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
  p31 = (y3 >> 8) & 255
  z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
  (uint32) y3 >>= 16
  p32 = y3 & 255
  z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
  p33 = (y3 >> 8) & 255
  z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
  y0 = r36
  y0 ^= z0
  y1 = r37
  y1 ^= z1
  y2 = r38
  y2 ^= z2
  y3 = r39
  y3 ^= z3


  y3_stack = y3

  z0 = y0 & 255
  z0 = *(uint8 *) (&aes_table2 + z0 * 8)
  z3 = (y0 >> 8) & 255
  z3 = *(uint16 *) (&aes_tablex + z3 * 8)
  (uint32) y0 >>= 16
  z2 = y0 & 255
  z2 = *(uint32 *) (&aes_table0 + z2 * 8)
  z2 &= 0x00ff0000
  z1 = (y0 >> 8) & 255
  z1 = *(uint32 *) (&aes_table1 + z1 * 8)
  z1 &= 0xff000000
  z0 ^= r40
  z3 ^= r43
  z1 ^= r41
  z2 ^= r42

  p10 = y1 & 255
  p10 = *(uint8 *) (&aes_table2 + p10 * 8)
  z1 ^= p10
  p11 = (y1 >> 8) & 255
  p11 = *(uint16 *) (&aes_tablex + p11 * 8)
  z0 ^= p11
  (uint32) y1 >>= 16
  p12 = y1 & 255
  p12 = *(uint32 *) (&aes_table0 + p12 * 8)
  p12 &= 0x00ff0000
  z3 ^= p12
  p13 = (y1 >> 8) & 255
  p13 = *(uint32 *) (&aes_table1 + p13 * 8)
  p13 &= 0xff000000
  z2 ^= p13

  y3 = y3_stack

  p20 = y2 & 255
  p20 = *(uint8 *) (&aes_table2 + p20 * 8)
  z2 ^= p20
  p21 = (y2 >> 8) & 255
  p21 = *(uint16 *) (&aes_tablex + p21 * 8)
  z1 ^= p21
  (uint32) y2 >>= 16
  p22 = y2 & 255
  p22 = *(uint32 *) (&aes_table0 + p22 * 8)
  p22 &= 0x00ff0000
  z0 ^= p22
  p23 = (y2 >> 8) & 255
  p23 = *(uint32 *) (&aes_table1 + p23 * 8)
  p23 &= 0xff000000
  z3 ^= p23

  p30 = y3 & 255
  p30 = *(uint8 *) (&aes_table2 + p30 * 8)
  z3 ^= p30
  p31 = (y3 >> 8) & 255
  p31 = *(uint16 *) (&aes_tablex + p31 * 8)
  z2 ^= p31
  (uint32) y3 >>= 16
  p32 = y3 & 255
  p32 = *(uint32 *) (&aes_table0 + p32 * 8)
  p32 &= 0x00ff0000
  z1 ^= p32
  p33 = (y3 >> 8) & 255
  p33 = *(uint32 *) (&aes_table1 + p33 * 8)
  p33 &= 0xff000000
  z0 ^= p33


  len = len_stack
                     unsigned<? len - 16
  goto fullblock if !unsigned<

    z1_stack = z1
    z2_stack = z2
    z3_stack = z3

    in = in_stack
    out = out_stack

    b0 = *(uint8 *) (in + 0)
    b0 ^= z0
    *(uint8 *) (out + 0) = b0
                                unsigned>? len - 1
    goto finishpartialblock if !unsigned>

    (uint32) z0 >>= 8
    b1 = *(uint8 *) (in + 1)
    b1 ^= z0
    *(uint8 *) (out + 1) = b1
                                unsigned>? len - 2
    goto finishpartialblock if !unsigned>

    (uint32) z0 >>= 8
    b2 = *(uint8 *) (in + 2)
    b2 ^= z0
    *(uint8 *) (out + 2) = b2
                                unsigned>? len - 3
    goto finishpartialblock if !unsigned>

    (uint32) z0 >>= 8
    b3 = *(uint8 *) (in + 3)
    b3 ^= z0
    *(uint8 *) (out + 3) = b3
                                unsigned>? len - 4
    goto finishpartialblock if !unsigned>

    z1 = z1_stack

    b0 = *(uint8 *) (in + 4)
    b0 ^= z1
    *(uint8 *) (out + 4) = b0
                                unsigned>? len - 5
    goto finishpartialblock if !unsigned>

    (uint32) z1 >>= 8
    b1 = *(uint8 *) (in + 5)
    b1 ^= z1
    *(uint8 *) (out + 5) = b1
                                unsigned>? len - 6
    goto finishpartialblock if !unsigned>

    (uint32) z1 >>= 8
    b2 = *(uint8 *) (in + 6)
    b2 ^= z1
    *(uint8 *) (out + 6) = b2
                                unsigned>? len - 7
    goto finishpartialblock if !unsigned>

    (uint32) z1 >>= 8
    b3 = *(uint8 *) (in + 7)
    b3 ^= z1
    *(uint8 *) (out + 7) = b3
                                unsigned>? len - 8
    goto finishpartialblock if !unsigned>

    z2 = z2_stack

    b0 = *(uint8 *) (in + 8)
    b0 ^= z2
    *(uint8 *) (out + 8) = b0
                                unsigned>? len - 9
    goto finishpartialblock if !unsigned>

    (uint32) z2 >>= 8
    b1 = *(uint8 *) (in + 9)
    b1 ^= z2
    *(uint8 *) (out + 9) = b1
                                unsigned>? len - 10
    goto finishpartialblock if !unsigned>

    (uint32) z2 >>= 8
    b2 = *(uint8 *) (in + 10)
    b2 ^= z2
    *(uint8 *) (out + 10) = b2
                                unsigned>? len - 11
    goto finishpartialblock if !unsigned>

    (uint32) z2 >>= 8
    b3 = *(uint8 *) (in + 11)
    b3 ^= z2
    *(uint8 *) (out + 11) = b3
                                unsigned>? len - 12
    goto finishpartialblock if !unsigned>

    z3 = z3_stack

    b0 = *(uint8 *) (in + 12)
    b0 ^= z3
    *(uint8 *) (out + 12) = b0
                                unsigned>? len - 13
    goto finishpartialblock if !unsigned>

    (uint32) z3 >>= 8
    b1 = *(uint8 *) (in + 13)
    b1 ^= z3
    *(uint8 *) (out + 13) = b1
                                unsigned>? len - 14
    goto finishpartialblock if !unsigned>

    (uint32) z3 >>= 8
    b2 = *(uint8 *) (in + 14)
    b2 ^= z3
    *(uint8 *) (out + 14) = b2
                                unsigned>? len - 15
    goto finishpartialblock if !unsigned>

    b3 = *(uint8 *) (in + 15)
    b3 ^= z3
    *(uint8 *) (out + 15) = b3
    *(uint8 *) (out + 15) = z3

finishpartialblock:

    y0 = n0
    y1 = n1
    y2 = n2
    y3 = n3
    y0 += 1

  goto done

fullblock:

  len -= 16
  len_stack = len

  in = in_stack
  z0 ^= *(uint32 *) (in + 0)
  z1 ^= *(uint32 *) (in + 4)
  z2 ^= *(uint32 *) (in + 8)
  z3 ^= *(uint32 *) (in + 12)
  in += 16
  in_stack = in

  out = out_stack
  *(uint32 *) (out + 0) = z0
  *(uint32 *) (out + 4) = z1
  *(uint32 *) (out + 8) = z2
  *(uint32 *) (out + 12) = z3
  out += 16
  out_stack = out

nextloop:
  
  y0 = n0
  y1 = n1
  y2 = n2
  y3 = n3
  y0 += 1

  len = len_stack
                unsigned>? len - 0
  goto done if !unsigned>

goto mainloop


done:

c = c_stack
*(uint32 *) (c + 56) = y0
*(uint32 *) (c + 60) = y1
*(uint32 *) (c + 64) = y2
*(uint32 *) (c + 68) = y3

nothingtodo:

emms

eax = eax_stack
ebx = ebx_stack
esi = esi_stack
edi = edi_stack
ebp = ebp_stack

leave
