
# qhasm: int64 arg1

# qhasm: int64 arg2

# qhasm: int64 arg3

# qhasm: int64 arg4

# qhasm: int64 arg5

# qhasm: input arg1

# qhasm: input arg2

# qhasm: input arg3

# qhasm: input arg4

# qhasm: input arg5

# qhasm: int64 r11_caller

# qhasm: int64 r12_caller

# qhasm: int64 r13_caller

# qhasm: int64 r14_caller

# qhasm: int64 r15_caller

# qhasm: int64 rbx_caller

# qhasm: int64 rbp_caller

# qhasm: caller r11_caller

# qhasm: caller r12_caller

# qhasm: caller r13_caller

# qhasm: caller r14_caller

# qhasm: caller r15_caller

# qhasm: caller rbx_caller

# qhasm: caller rbp_caller

# qhasm: stack64 r11_stack

# qhasm: stack64 r12_stack

# qhasm: stack64 r13_stack

# qhasm: stack64 r14_stack

# qhasm: stack64 r15_stack

# qhasm: stack64 rbx_stack

# qhasm: stack64 rbp_stack

# qhasm: int64 table

# qhasm: int64 c

# qhasm: int64 k

# qhasm: int64 iv

# qhasm: int64 x0

# qhasm: int64 x1

# qhasm: int64 x2

# qhasm: int64 x3

# qhasm: int64 e

# qhasm: int64 q0

# qhasm: int64 q1

# qhasm: int64 q2

# qhasm: int64 q3

# qhasm: int64 in

# qhasm: int64 out

# qhasm: int64 len

# qhasm: stack64 in_stack

# qhasm: stack64 out_stack

# qhasm: stack64 len_stack

# qhasm: stack320 stream

# qhasm: int64 streamp

# qhasm: int64 leak0

# qhasm: int64 leak1

# qhasm: int64 tmp0

# qhasm: int64 tmp1

# qhasm: stack64 r0

# qhasm: stack64 r1

# qhasm: stack64 r2

# qhasm: stack64 r3

# qhasm: stack64 r4

# qhasm: stack64 r5

# qhasm: stack64 r6

# qhasm: stack64 r7

# qhasm: stack64 r8

# qhasm: stack64 r9

# qhasm: stack64 r10

# qhasm: stack64 r11

# qhasm: stack64 r12

# qhasm: stack64 r13

# qhasm: stack64 r14

# qhasm: stack64 r15

# qhasm: stack64 r16

# qhasm: stack64 r17

# qhasm: stack64 r18

# qhasm: stack64 r19

# qhasm: stack64 r20

# qhasm: stack64 r21

# qhasm: stack64 r22

# qhasm: stack64 r23

# qhasm: stack64 r24

# qhasm: stack64 r25

# qhasm: stack64 r26

# qhasm: stack64 r27

# qhasm: stack64 r28

# qhasm: stack64 r29

# qhasm: stack64 r30

# qhasm: stack64 r31

# qhasm: stack64 r32

# qhasm: stack64 r33

# qhasm: stack64 r34

# qhasm: stack64 r35

# qhasm: stack64 r36

# qhasm: stack64 r37

# qhasm: stack64 r38

# qhasm: stack64 r39

# qhasm: stack64 r40

# qhasm: stack64 r41

# qhasm: stack64 r42

# qhasm: stack64 r43

# qhasm: int64 y0

# qhasm: int64 y1

# qhasm: int64 y2

# qhasm: int64 y3

# qhasm: int64 z0

# qhasm: int64 z1

# qhasm: int64 z2

# qhasm: int64 z3

# qhasm: int64 p00

# qhasm: int64 p01

# qhasm: int64 p02

# qhasm: int64 p03

# qhasm: int64 p10

# qhasm: int64 p11

# qhasm: int64 p12

# qhasm: int64 p13

# qhasm: int64 p20

# qhasm: int64 p21

# qhasm: int64 p22

# qhasm: int64 p23

# qhasm: int64 p30

# qhasm: int64 p31

# qhasm: int64 p32

# qhasm: int64 p33

# qhasm: int64 b0

# qhasm: int64 b1

# qhasm: int64 b2

# qhasm: int64 b3

# qhasm: enter ECRYPT_init
.text
.p2align 5
.globl _ECRYPT_init
.globl ECRYPT_init
_ECRYPT_init:
ECRYPT_init:
mov %rsp,%r11
and $31,%r11
add $576,%r11
sub %r11,%rsp

# qhasm: leave
add %r11,%rsp
mov %rdi,%rax
mov %rsi,%rdx
ret

# qhasm: enter ECRYPT_keysetup
.text
.p2align 5
.globl _ECRYPT_keysetup
.globl ECRYPT_keysetup
_ECRYPT_keysetup:
ECRYPT_keysetup:
mov %rsp,%r11
and $31,%r11
add $576,%r11
sub %r11,%rsp

# qhasm: r11_stack = r11_caller
# asm 1: movq <r11_caller=int64#9,>r11_stack=stack64#1
# asm 2: movq <r11_caller=%r11,>r11_stack=160(%rsp)
movq %r11,160(%rsp)

# qhasm: r12_stack = r12_caller
# asm 1: movq <r12_caller=int64#10,>r12_stack=stack64#2
# asm 2: movq <r12_caller=%r12,>r12_stack=168(%rsp)
movq %r12,168(%rsp)

# qhasm: r13_stack = r13_caller
# asm 1: movq <r13_caller=int64#11,>r13_stack=stack64#3
# asm 2: movq <r13_caller=%r13,>r13_stack=176(%rsp)
movq %r13,176(%rsp)

# qhasm: r14_stack = r14_caller
# asm 1: movq <r14_caller=int64#12,>r14_stack=stack64#4
# asm 2: movq <r14_caller=%r14,>r14_stack=184(%rsp)
movq %r14,184(%rsp)

# qhasm: r15_stack = r15_caller
# asm 1: movq <r15_caller=int64#13,>r15_stack=stack64#5
# asm 2: movq <r15_caller=%r15,>r15_stack=192(%rsp)
movq %r15,192(%rsp)

# qhasm: rbx_stack = rbx_caller
# asm 1: movq <rbx_caller=int64#14,>rbx_stack=stack64#6
# asm 2: movq <rbx_caller=%rbx,>rbx_stack=200(%rsp)
movq %rbx,200(%rsp)

# qhasm: rbp_stack = rbp_caller
# asm 1: movq <rbp_caller=int64#15,>rbp_stack=stack64#7
# asm 2: movq <rbp_caller=%rbp,>rbp_stack=208(%rsp)
movq %rbp,208(%rsp)

# qhasm: c = arg1
# asm 1: mov  <arg1=int64#1,>c=int64#6
# asm 2: mov  <arg1=%rdi,>c=%r9
mov  %rdi,%r9

# qhasm: k = arg2
# asm 1: mov  <arg2=int64#2,>k=int64#1
# asm 2: mov  <arg2=%rsi,>k=%rdi
mov  %rsi,%rdi

# qhasm: x0 = *(uint32 *) (k + 0)
# asm 1: movl   0(<k=int64#1),>x0=int64#2d
# asm 2: movl   0(<k=%rdi),>x0=%esi
movl   0(%rdi),%esi

# qhasm: x1 = *(uint32 *) (k + 4)
# asm 1: movl   4(<k=int64#1),>x1=int64#7d
# asm 2: movl   4(<k=%rdi),>x1=%eax
movl   4(%rdi),%eax

# qhasm: x2 = *(uint32 *) (k + 8)
# asm 1: movl   8(<k=int64#1),>x2=int64#8d
# asm 2: movl   8(<k=%rdi),>x2=%r10d
movl   8(%rdi),%r10d

# qhasm: x3 = *(uint32 *) (k + 12)
# asm 1: movl   12(<k=int64#1),>x3=int64#14d
# asm 2: movl   12(<k=%rdi),>x3=%ebx
movl   12(%rdi),%ebx

# qhasm: *(uint32 *) (c + 0) = x0
# asm 1: movl   <x0=int64#2d,0(<c=int64#6)
# asm 2: movl   <x0=%esi,0(<c=%r9)
movl   %esi,0(%r9)

# qhasm: *(uint32 *) (c + 4) = x1
# asm 1: movl   <x1=int64#7d,4(<c=int64#6)
# asm 2: movl   <x1=%eax,4(<c=%r9)
movl   %eax,4(%r9)

# qhasm: *(uint32 *) (c + 8) = x2
# asm 1: movl   <x2=int64#8d,8(<c=int64#6)
# asm 2: movl   <x2=%r10d,8(<c=%r9)
movl   %r10d,8(%r9)

# qhasm: *(uint32 *) (c + 12) = x3
# asm 1: movl   <x3=int64#14d,12(<c=int64#6)
# asm 2: movl   <x3=%ebx,12(<c=%r9)
movl   %ebx,12(%r9)

# qhasm: table = &aes_tablex
# asm 1: lea  aes_tablex(%rip),>table=int64#9
# asm 2: lea  aes_tablex(%rip),>table=%r11
lea  aes_tablex(%rip),%r11

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>e=int64#1d
# asm 2: movzbl  <x3=%bh,>e=%edi
movzbl  %bh,%edi

# qhasm: e = *(uint8 *) (table + 1 + e * 8)
# asm 1: movzbq 1(<table=int64#9,<e=int64#1,8),>e=int64#10
# asm 2: movzbq 1(<table=%r11,<e=%rdi,8),>e=%r12
movzbq 1(%r11,%rdi,8),%r12

# qhasm: (uint32) e ^= 0x01
# asm 1: xor  $0x01,<e=int64#10d
# asm 2: xor  $0x01,<e=%r12d
xor  $0x01,%r12d

# qhasm: q3 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q3=int64#1d
# asm 2: movzbl  <x3=%bl,>q3=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q3 = *(uint32 *) (table + 2 + q3 * 8)
# asm 1: movl   2(<table=int64#9,<q3=int64#1,8),>q3=int64#1d
# asm 2: movl   2(<table=%r11,<q3=%rdi,8),>q3=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm: (uint32) q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int64#1d
# asm 2: and  $0xff000000,<q3=%edi
and  $0xff000000,%edi

# qhasm: e ^= q3
# asm 1: xor  <q3=int64#1,<e=int64#10
# asm 2: xor  <q3=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>q2=int64#1d
# asm 2: movzbl  <x3=%bh,>q2=%edi
movzbl  %bh,%edi

# qhasm: q2 = *(uint32 *) (table + 3 + q2 * 8)
# asm 1: movl   3(<table=int64#9,<q2=int64#1,8),>q2=int64#1d
# asm 2: movl   3(<table=%r11,<q2=%rdi,8),>q2=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm: (uint32) q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int64#1d
# asm 2: and  $0x00ff0000,<q2=%edi
and  $0x00ff0000,%edi

# qhasm: e ^= q2
# asm 1: xor  <q2=int64#1,<e=int64#10
# asm 2: xor  <q2=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q1 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q1=int64#1d
# asm 2: movzbl  <x3=%bl,>q1=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q1 = *(uint16 *) (table + q1 * 8)
# asm 1: movzwq (<table=int64#9,<q1=int64#1,8),>q1=int64#1
# asm 2: movzwq (<table=%r11,<q1=%rdi,8),>q1=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm: e ^= q1
# asm 1: xor  <q1=int64#1,<e=int64#10
# asm 2: xor  <q1=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: x0 ^= e
# asm 1: xor  <e=int64#10,<x0=int64#2
# asm 2: xor  <e=%r12,<x0=%rsi
xor  %r12,%rsi

# qhasm: *(uint32 *) (c + 16) = x0
# asm 1: movl   <x0=int64#2d,16(<c=int64#6)
# asm 2: movl   <x0=%esi,16(<c=%r9)
movl   %esi,16(%r9)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#7
# asm 2: xor  <x0=%rsi,<x1=%rax
xor  %rsi,%rax

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#7,<x2=int64#8
# asm 2: xor  <x1=%rax,<x2=%r10
xor  %rax,%r10

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#8,<x3=int64#14
# asm 2: xor  <x2=%r10,<x3=%rbx
xor  %r10,%rbx

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>e=int64#1d
# asm 2: movzbl  <x3=%bh,>e=%edi
movzbl  %bh,%edi

# qhasm: e = *(uint8 *) (table + 1 + e * 8)
# asm 1: movzbq 1(<table=int64#9,<e=int64#1,8),>e=int64#10
# asm 2: movzbq 1(<table=%r11,<e=%rdi,8),>e=%r12
movzbq 1(%r11,%rdi,8),%r12

# qhasm: (uint32) e ^= 0x02
# asm 1: xor  $0x02,<e=int64#10d
# asm 2: xor  $0x02,<e=%r12d
xor  $0x02,%r12d

# qhasm: q3 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q3=int64#1d
# asm 2: movzbl  <x3=%bl,>q3=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q3 = *(uint32 *) (table + 2 + q3 * 8)
# asm 1: movl   2(<table=int64#9,<q3=int64#1,8),>q3=int64#1d
# asm 2: movl   2(<table=%r11,<q3=%rdi,8),>q3=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm: (uint32) q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int64#1d
# asm 2: and  $0xff000000,<q3=%edi
and  $0xff000000,%edi

# qhasm: e ^= q3
# asm 1: xor  <q3=int64#1,<e=int64#10
# asm 2: xor  <q3=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>q2=int64#1d
# asm 2: movzbl  <x3=%bh,>q2=%edi
movzbl  %bh,%edi

# qhasm: q2 = *(uint32 *) (table + 3 + q2 * 8)
# asm 1: movl   3(<table=int64#9,<q2=int64#1,8),>q2=int64#1d
# asm 2: movl   3(<table=%r11,<q2=%rdi,8),>q2=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm: (uint32) q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int64#1d
# asm 2: and  $0x00ff0000,<q2=%edi
and  $0x00ff0000,%edi

# qhasm: e ^= q2
# asm 1: xor  <q2=int64#1,<e=int64#10
# asm 2: xor  <q2=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q1 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q1=int64#1d
# asm 2: movzbl  <x3=%bl,>q1=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q1 = *(uint16 *) (table + q1 * 8)
# asm 1: movzwq (<table=int64#9,<q1=int64#1,8),>q1=int64#1
# asm 2: movzwq (<table=%r11,<q1=%rdi,8),>q1=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm: e ^= q1
# asm 1: xor  <q1=int64#1,<e=int64#10
# asm 2: xor  <q1=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: x0 ^= e
# asm 1: xor  <e=int64#10,<x0=int64#2
# asm 2: xor  <e=%r12,<x0=%rsi
xor  %r12,%rsi

# qhasm: *(uint32 *) (c + 20) = x0
# asm 1: movl   <x0=int64#2d,20(<c=int64#6)
# asm 2: movl   <x0=%esi,20(<c=%r9)
movl   %esi,20(%r9)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#7
# asm 2: xor  <x0=%rsi,<x1=%rax
xor  %rsi,%rax

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#7,<x2=int64#8
# asm 2: xor  <x1=%rax,<x2=%r10
xor  %rax,%r10

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#8,<x3=int64#14
# asm 2: xor  <x2=%r10,<x3=%rbx
xor  %r10,%rbx

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>e=int64#1d
# asm 2: movzbl  <x3=%bh,>e=%edi
movzbl  %bh,%edi

# qhasm: e = *(uint8 *) (table + 1 + e * 8)
# asm 1: movzbq 1(<table=int64#9,<e=int64#1,8),>e=int64#10
# asm 2: movzbq 1(<table=%r11,<e=%rdi,8),>e=%r12
movzbq 1(%r11,%rdi,8),%r12

# qhasm: (uint32) e ^= 0x04
# asm 1: xor  $0x04,<e=int64#10d
# asm 2: xor  $0x04,<e=%r12d
xor  $0x04,%r12d

# qhasm: q3 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q3=int64#1d
# asm 2: movzbl  <x3=%bl,>q3=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q3 = *(uint32 *) (table + 2 + q3 * 8)
# asm 1: movl   2(<table=int64#9,<q3=int64#1,8),>q3=int64#1d
# asm 2: movl   2(<table=%r11,<q3=%rdi,8),>q3=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm: (uint32) q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int64#1d
# asm 2: and  $0xff000000,<q3=%edi
and  $0xff000000,%edi

# qhasm: e ^= q3
# asm 1: xor  <q3=int64#1,<e=int64#10
# asm 2: xor  <q3=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>q2=int64#1d
# asm 2: movzbl  <x3=%bh,>q2=%edi
movzbl  %bh,%edi

# qhasm: q2 = *(uint32 *) (table + 3 + q2 * 8)
# asm 1: movl   3(<table=int64#9,<q2=int64#1,8),>q2=int64#1d
# asm 2: movl   3(<table=%r11,<q2=%rdi,8),>q2=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm: (uint32) q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int64#1d
# asm 2: and  $0x00ff0000,<q2=%edi
and  $0x00ff0000,%edi

# qhasm: e ^= q2
# asm 1: xor  <q2=int64#1,<e=int64#10
# asm 2: xor  <q2=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q1 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q1=int64#1d
# asm 2: movzbl  <x3=%bl,>q1=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q1 = *(uint16 *) (table + q1 * 8)
# asm 1: movzwq (<table=int64#9,<q1=int64#1,8),>q1=int64#1
# asm 2: movzwq (<table=%r11,<q1=%rdi,8),>q1=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm: e ^= q1
# asm 1: xor  <q1=int64#1,<e=int64#10
# asm 2: xor  <q1=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: x0 ^= e
# asm 1: xor  <e=int64#10,<x0=int64#2
# asm 2: xor  <e=%r12,<x0=%rsi
xor  %r12,%rsi

# qhasm: *(uint32 *) (c + 24) = x0
# asm 1: movl   <x0=int64#2d,24(<c=int64#6)
# asm 2: movl   <x0=%esi,24(<c=%r9)
movl   %esi,24(%r9)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#7
# asm 2: xor  <x0=%rsi,<x1=%rax
xor  %rsi,%rax

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#7,<x2=int64#8
# asm 2: xor  <x1=%rax,<x2=%r10
xor  %rax,%r10

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#8,<x3=int64#14
# asm 2: xor  <x2=%r10,<x3=%rbx
xor  %r10,%rbx

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>e=int64#1d
# asm 2: movzbl  <x3=%bh,>e=%edi
movzbl  %bh,%edi

# qhasm: e = *(uint8 *) (table + 1 + e * 8)
# asm 1: movzbq 1(<table=int64#9,<e=int64#1,8),>e=int64#10
# asm 2: movzbq 1(<table=%r11,<e=%rdi,8),>e=%r12
movzbq 1(%r11,%rdi,8),%r12

# qhasm: (uint32) e ^= 0x08
# asm 1: xor  $0x08,<e=int64#10d
# asm 2: xor  $0x08,<e=%r12d
xor  $0x08,%r12d

# qhasm: q3 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q3=int64#1d
# asm 2: movzbl  <x3=%bl,>q3=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q3 = *(uint32 *) (table + 2 + q3 * 8)
# asm 1: movl   2(<table=int64#9,<q3=int64#1,8),>q3=int64#1d
# asm 2: movl   2(<table=%r11,<q3=%rdi,8),>q3=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm: (uint32) q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int64#1d
# asm 2: and  $0xff000000,<q3=%edi
and  $0xff000000,%edi

# qhasm: e ^= q3
# asm 1: xor  <q3=int64#1,<e=int64#10
# asm 2: xor  <q3=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>q2=int64#1d
# asm 2: movzbl  <x3=%bh,>q2=%edi
movzbl  %bh,%edi

# qhasm: q2 = *(uint32 *) (table + 3 + q2 * 8)
# asm 1: movl   3(<table=int64#9,<q2=int64#1,8),>q2=int64#1d
# asm 2: movl   3(<table=%r11,<q2=%rdi,8),>q2=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm: (uint32) q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int64#1d
# asm 2: and  $0x00ff0000,<q2=%edi
and  $0x00ff0000,%edi

# qhasm: e ^= q2
# asm 1: xor  <q2=int64#1,<e=int64#10
# asm 2: xor  <q2=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q1 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q1=int64#1d
# asm 2: movzbl  <x3=%bl,>q1=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q1 = *(uint16 *) (table + q1 * 8)
# asm 1: movzwq (<table=int64#9,<q1=int64#1,8),>q1=int64#1
# asm 2: movzwq (<table=%r11,<q1=%rdi,8),>q1=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm: e ^= q1
# asm 1: xor  <q1=int64#1,<e=int64#10
# asm 2: xor  <q1=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: x0 ^= e
# asm 1: xor  <e=int64#10,<x0=int64#2
# asm 2: xor  <e=%r12,<x0=%rsi
xor  %r12,%rsi

# qhasm: *(uint32 *) (c + 28) = x0
# asm 1: movl   <x0=int64#2d,28(<c=int64#6)
# asm 2: movl   <x0=%esi,28(<c=%r9)
movl   %esi,28(%r9)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#7
# asm 2: xor  <x0=%rsi,<x1=%rax
xor  %rsi,%rax

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#7,<x2=int64#8
# asm 2: xor  <x1=%rax,<x2=%r10
xor  %rax,%r10

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#8,<x3=int64#14
# asm 2: xor  <x2=%r10,<x3=%rbx
xor  %r10,%rbx

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>e=int64#1d
# asm 2: movzbl  <x3=%bh,>e=%edi
movzbl  %bh,%edi

# qhasm: e = *(uint8 *) (table + 1 + e * 8)
# asm 1: movzbq 1(<table=int64#9,<e=int64#1,8),>e=int64#10
# asm 2: movzbq 1(<table=%r11,<e=%rdi,8),>e=%r12
movzbq 1(%r11,%rdi,8),%r12

# qhasm: (uint32) e ^= 0x10
# asm 1: xor  $0x10,<e=int64#10d
# asm 2: xor  $0x10,<e=%r12d
xor  $0x10,%r12d

# qhasm: q3 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q3=int64#1d
# asm 2: movzbl  <x3=%bl,>q3=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q3 = *(uint32 *) (table + 2 + q3 * 8)
# asm 1: movl   2(<table=int64#9,<q3=int64#1,8),>q3=int64#1d
# asm 2: movl   2(<table=%r11,<q3=%rdi,8),>q3=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm: (uint32) q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int64#1d
# asm 2: and  $0xff000000,<q3=%edi
and  $0xff000000,%edi

# qhasm: e ^= q3
# asm 1: xor  <q3=int64#1,<e=int64#10
# asm 2: xor  <q3=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>q2=int64#1d
# asm 2: movzbl  <x3=%bh,>q2=%edi
movzbl  %bh,%edi

# qhasm: q2 = *(uint32 *) (table + 3 + q2 * 8)
# asm 1: movl   3(<table=int64#9,<q2=int64#1,8),>q2=int64#1d
# asm 2: movl   3(<table=%r11,<q2=%rdi,8),>q2=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm: (uint32) q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int64#1d
# asm 2: and  $0x00ff0000,<q2=%edi
and  $0x00ff0000,%edi

# qhasm: e ^= q2
# asm 1: xor  <q2=int64#1,<e=int64#10
# asm 2: xor  <q2=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q1 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q1=int64#1d
# asm 2: movzbl  <x3=%bl,>q1=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q1 = *(uint16 *) (table + q1 * 8)
# asm 1: movzwq (<table=int64#9,<q1=int64#1,8),>q1=int64#1
# asm 2: movzwq (<table=%r11,<q1=%rdi,8),>q1=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm: e ^= q1
# asm 1: xor  <q1=int64#1,<e=int64#10
# asm 2: xor  <q1=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: x0 ^= e
# asm 1: xor  <e=int64#10,<x0=int64#2
# asm 2: xor  <e=%r12,<x0=%rsi
xor  %r12,%rsi

# qhasm: *(uint32 *) (c + 32) = x0
# asm 1: movl   <x0=int64#2d,32(<c=int64#6)
# asm 2: movl   <x0=%esi,32(<c=%r9)
movl   %esi,32(%r9)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#7
# asm 2: xor  <x0=%rsi,<x1=%rax
xor  %rsi,%rax

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#7,<x2=int64#8
# asm 2: xor  <x1=%rax,<x2=%r10
xor  %rax,%r10

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#8,<x3=int64#14
# asm 2: xor  <x2=%r10,<x3=%rbx
xor  %r10,%rbx

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>e=int64#1d
# asm 2: movzbl  <x3=%bh,>e=%edi
movzbl  %bh,%edi

# qhasm: e = *(uint8 *) (table + 1 + e * 8)
# asm 1: movzbq 1(<table=int64#9,<e=int64#1,8),>e=int64#10
# asm 2: movzbq 1(<table=%r11,<e=%rdi,8),>e=%r12
movzbq 1(%r11,%rdi,8),%r12

# qhasm: (uint32) e ^= 0x20
# asm 1: xor  $0x20,<e=int64#10d
# asm 2: xor  $0x20,<e=%r12d
xor  $0x20,%r12d

# qhasm: q3 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q3=int64#1d
# asm 2: movzbl  <x3=%bl,>q3=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q3 = *(uint32 *) (table + 2 + q3 * 8)
# asm 1: movl   2(<table=int64#9,<q3=int64#1,8),>q3=int64#1d
# asm 2: movl   2(<table=%r11,<q3=%rdi,8),>q3=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm: (uint32) q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int64#1d
# asm 2: and  $0xff000000,<q3=%edi
and  $0xff000000,%edi

# qhasm: e ^= q3
# asm 1: xor  <q3=int64#1,<e=int64#10
# asm 2: xor  <q3=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>q2=int64#1d
# asm 2: movzbl  <x3=%bh,>q2=%edi
movzbl  %bh,%edi

# qhasm: q2 = *(uint32 *) (table + 3 + q2 * 8)
# asm 1: movl   3(<table=int64#9,<q2=int64#1,8),>q2=int64#1d
# asm 2: movl   3(<table=%r11,<q2=%rdi,8),>q2=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm: (uint32) q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int64#1d
# asm 2: and  $0x00ff0000,<q2=%edi
and  $0x00ff0000,%edi

# qhasm: e ^= q2
# asm 1: xor  <q2=int64#1,<e=int64#10
# asm 2: xor  <q2=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q1 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q1=int64#1d
# asm 2: movzbl  <x3=%bl,>q1=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q1 = *(uint16 *) (table + q1 * 8)
# asm 1: movzwq (<table=int64#9,<q1=int64#1,8),>q1=int64#1
# asm 2: movzwq (<table=%r11,<q1=%rdi,8),>q1=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm: e ^= q1
# asm 1: xor  <q1=int64#1,<e=int64#10
# asm 2: xor  <q1=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: x0 ^= e
# asm 1: xor  <e=int64#10,<x0=int64#2
# asm 2: xor  <e=%r12,<x0=%rsi
xor  %r12,%rsi

# qhasm: *(uint32 *) (c + 36) = x0
# asm 1: movl   <x0=int64#2d,36(<c=int64#6)
# asm 2: movl   <x0=%esi,36(<c=%r9)
movl   %esi,36(%r9)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#7
# asm 2: xor  <x0=%rsi,<x1=%rax
xor  %rsi,%rax

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#7,<x2=int64#8
# asm 2: xor  <x1=%rax,<x2=%r10
xor  %rax,%r10

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#8,<x3=int64#14
# asm 2: xor  <x2=%r10,<x3=%rbx
xor  %r10,%rbx

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>e=int64#1d
# asm 2: movzbl  <x3=%bh,>e=%edi
movzbl  %bh,%edi

# qhasm: e = *(uint8 *) (table + 1 + e * 8)
# asm 1: movzbq 1(<table=int64#9,<e=int64#1,8),>e=int64#10
# asm 2: movzbq 1(<table=%r11,<e=%rdi,8),>e=%r12
movzbq 1(%r11,%rdi,8),%r12

# qhasm: (uint32) e ^= 0x40
# asm 1: xor  $0x40,<e=int64#10d
# asm 2: xor  $0x40,<e=%r12d
xor  $0x40,%r12d

# qhasm: q3 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q3=int64#1d
# asm 2: movzbl  <x3=%bl,>q3=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q3 = *(uint32 *) (table + 2 + q3 * 8)
# asm 1: movl   2(<table=int64#9,<q3=int64#1,8),>q3=int64#1d
# asm 2: movl   2(<table=%r11,<q3=%rdi,8),>q3=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm: (uint32) q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int64#1d
# asm 2: and  $0xff000000,<q3=%edi
and  $0xff000000,%edi

# qhasm: e ^= q3
# asm 1: xor  <q3=int64#1,<e=int64#10
# asm 2: xor  <q3=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>q2=int64#1d
# asm 2: movzbl  <x3=%bh,>q2=%edi
movzbl  %bh,%edi

# qhasm: q2 = *(uint32 *) (table + 3 + q2 * 8)
# asm 1: movl   3(<table=int64#9,<q2=int64#1,8),>q2=int64#1d
# asm 2: movl   3(<table=%r11,<q2=%rdi,8),>q2=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm: (uint32) q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int64#1d
# asm 2: and  $0x00ff0000,<q2=%edi
and  $0x00ff0000,%edi

# qhasm: e ^= q2
# asm 1: xor  <q2=int64#1,<e=int64#10
# asm 2: xor  <q2=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q1 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q1=int64#1d
# asm 2: movzbl  <x3=%bl,>q1=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q1 = *(uint16 *) (table + q1 * 8)
# asm 1: movzwq (<table=int64#9,<q1=int64#1,8),>q1=int64#1
# asm 2: movzwq (<table=%r11,<q1=%rdi,8),>q1=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm: e ^= q1
# asm 1: xor  <q1=int64#1,<e=int64#10
# asm 2: xor  <q1=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: x0 ^= e
# asm 1: xor  <e=int64#10,<x0=int64#2
# asm 2: xor  <e=%r12,<x0=%rsi
xor  %r12,%rsi

# qhasm: *(uint32 *) (c + 40) = x0
# asm 1: movl   <x0=int64#2d,40(<c=int64#6)
# asm 2: movl   <x0=%esi,40(<c=%r9)
movl   %esi,40(%r9)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#7
# asm 2: xor  <x0=%rsi,<x1=%rax
xor  %rsi,%rax

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#7,<x2=int64#8
# asm 2: xor  <x1=%rax,<x2=%r10
xor  %rax,%r10

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#8,<x3=int64#14
# asm 2: xor  <x2=%r10,<x3=%rbx
xor  %r10,%rbx

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>e=int64#1d
# asm 2: movzbl  <x3=%bh,>e=%edi
movzbl  %bh,%edi

# qhasm: e = *(uint8 *) (table + 1 + e * 8)
# asm 1: movzbq 1(<table=int64#9,<e=int64#1,8),>e=int64#10
# asm 2: movzbq 1(<table=%r11,<e=%rdi,8),>e=%r12
movzbq 1(%r11,%rdi,8),%r12

# qhasm: (uint32) e ^= 0x80
# asm 1: xor  $0x80,<e=int64#10d
# asm 2: xor  $0x80,<e=%r12d
xor  $0x80,%r12d

# qhasm: q3 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q3=int64#1d
# asm 2: movzbl  <x3=%bl,>q3=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q3 = *(uint32 *) (table + 2 + q3 * 8)
# asm 1: movl   2(<table=int64#9,<q3=int64#1,8),>q3=int64#1d
# asm 2: movl   2(<table=%r11,<q3=%rdi,8),>q3=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm: (uint32) q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int64#1d
# asm 2: and  $0xff000000,<q3=%edi
and  $0xff000000,%edi

# qhasm: e ^= q3
# asm 1: xor  <q3=int64#1,<e=int64#10
# asm 2: xor  <q3=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>q2=int64#1d
# asm 2: movzbl  <x3=%bh,>q2=%edi
movzbl  %bh,%edi

# qhasm: q2 = *(uint32 *) (table + 3 + q2 * 8)
# asm 1: movl   3(<table=int64#9,<q2=int64#1,8),>q2=int64#1d
# asm 2: movl   3(<table=%r11,<q2=%rdi,8),>q2=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm: (uint32) q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int64#1d
# asm 2: and  $0x00ff0000,<q2=%edi
and  $0x00ff0000,%edi

# qhasm: e ^= q2
# asm 1: xor  <q2=int64#1,<e=int64#10
# asm 2: xor  <q2=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q1 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q1=int64#1d
# asm 2: movzbl  <x3=%bl,>q1=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q1 = *(uint16 *) (table + q1 * 8)
# asm 1: movzwq (<table=int64#9,<q1=int64#1,8),>q1=int64#1
# asm 2: movzwq (<table=%r11,<q1=%rdi,8),>q1=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm: e ^= q1
# asm 1: xor  <q1=int64#1,<e=int64#10
# asm 2: xor  <q1=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: x0 ^= e
# asm 1: xor  <e=int64#10,<x0=int64#2
# asm 2: xor  <e=%r12,<x0=%rsi
xor  %r12,%rsi

# qhasm: *(uint32 *) (c + 44) = x0
# asm 1: movl   <x0=int64#2d,44(<c=int64#6)
# asm 2: movl   <x0=%esi,44(<c=%r9)
movl   %esi,44(%r9)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#7
# asm 2: xor  <x0=%rsi,<x1=%rax
xor  %rsi,%rax

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#7,<x2=int64#8
# asm 2: xor  <x1=%rax,<x2=%r10
xor  %rax,%r10

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#8,<x3=int64#14
# asm 2: xor  <x2=%r10,<x3=%rbx
xor  %r10,%rbx

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>e=int64#1d
# asm 2: movzbl  <x3=%bh,>e=%edi
movzbl  %bh,%edi

# qhasm: e = *(uint8 *) (table + 1 + e * 8)
# asm 1: movzbq 1(<table=int64#9,<e=int64#1,8),>e=int64#10
# asm 2: movzbq 1(<table=%r11,<e=%rdi,8),>e=%r12
movzbq 1(%r11,%rdi,8),%r12

# qhasm: (uint32) e ^= 0x1b
# asm 1: xor  $0x1b,<e=int64#10d
# asm 2: xor  $0x1b,<e=%r12d
xor  $0x1b,%r12d

# qhasm: q3 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q3=int64#1d
# asm 2: movzbl  <x3=%bl,>q3=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q3 = *(uint32 *) (table + 2 + q3 * 8)
# asm 1: movl   2(<table=int64#9,<q3=int64#1,8),>q3=int64#1d
# asm 2: movl   2(<table=%r11,<q3=%rdi,8),>q3=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm: (uint32) q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int64#1d
# asm 2: and  $0xff000000,<q3=%edi
and  $0xff000000,%edi

# qhasm: e ^= q3
# asm 1: xor  <q3=int64#1,<e=int64#10
# asm 2: xor  <q3=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>q2=int64#1d
# asm 2: movzbl  <x3=%bh,>q2=%edi
movzbl  %bh,%edi

# qhasm: q2 = *(uint32 *) (table + 3 + q2 * 8)
# asm 1: movl   3(<table=int64#9,<q2=int64#1,8),>q2=int64#1d
# asm 2: movl   3(<table=%r11,<q2=%rdi,8),>q2=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm: (uint32) q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int64#1d
# asm 2: and  $0x00ff0000,<q2=%edi
and  $0x00ff0000,%edi

# qhasm: e ^= q2
# asm 1: xor  <q2=int64#1,<e=int64#10
# asm 2: xor  <q2=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: q1 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q1=int64#1d
# asm 2: movzbl  <x3=%bl,>q1=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q1 = *(uint16 *) (table + q1 * 8)
# asm 1: movzwq (<table=int64#9,<q1=int64#1,8),>q1=int64#1
# asm 2: movzwq (<table=%r11,<q1=%rdi,8),>q1=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm: e ^= q1
# asm 1: xor  <q1=int64#1,<e=int64#10
# asm 2: xor  <q1=%rdi,<e=%r12
xor  %rdi,%r12

# qhasm: x0 ^= e
# asm 1: xor  <e=int64#10,<x0=int64#2
# asm 2: xor  <e=%r12,<x0=%rsi
xor  %r12,%rsi

# qhasm: *(uint32 *) (c + 48) = x0
# asm 1: movl   <x0=int64#2d,48(<c=int64#6)
# asm 2: movl   <x0=%esi,48(<c=%r9)
movl   %esi,48(%r9)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#7
# asm 2: xor  <x0=%rsi,<x1=%rax
xor  %rsi,%rax

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#7,<x2=int64#8
# asm 2: xor  <x1=%rax,<x2=%r10
xor  %rax,%r10

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#8,<x3=int64#14
# asm 2: xor  <x2=%r10,<x3=%rbx
xor  %r10,%rbx

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>e=int64#1d
# asm 2: movzbl  <x3=%bh,>e=%edi
movzbl  %bh,%edi

# qhasm: e = *(uint8 *) (table + 1 + e * 8)
# asm 1: movzbq 1(<table=int64#9,<e=int64#1,8),>e=int64#7
# asm 2: movzbq 1(<table=%r11,<e=%rdi,8),>e=%rax
movzbq 1(%r11,%rdi,8),%rax

# qhasm: (uint32) e ^= 0x36
# asm 1: xor  $0x36,<e=int64#7d
# asm 2: xor  $0x36,<e=%eax
xor  $0x36,%eax

# qhasm: q3 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q3=int64#1d
# asm 2: movzbl  <x3=%bl,>q3=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q3 = *(uint32 *) (table + 2 + q3 * 8)
# asm 1: movl   2(<table=int64#9,<q3=int64#1,8),>q3=int64#1d
# asm 2: movl   2(<table=%r11,<q3=%rdi,8),>q3=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm: (uint32) q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int64#1d
# asm 2: and  $0xff000000,<q3=%edi
and  $0xff000000,%edi

# qhasm: e ^= q3
# asm 1: xor  <q3=int64#1,<e=int64#7
# asm 2: xor  <q3=%rdi,<e=%rax
xor  %rdi,%rax

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl  <x3=int64#14%next8,>q2=int64#1d
# asm 2: movzbl  <x3=%bh,>q2=%edi
movzbl  %bh,%edi

# qhasm: q2 = *(uint32 *) (table + 3 + q2 * 8)
# asm 1: movl   3(<table=int64#9,<q2=int64#1,8),>q2=int64#1d
# asm 2: movl   3(<table=%r11,<q2=%rdi,8),>q2=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm: (uint32) q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int64#1d
# asm 2: and  $0x00ff0000,<q2=%edi
and  $0x00ff0000,%edi

# qhasm: e ^= q2
# asm 1: xor  <q2=int64#1,<e=int64#7
# asm 2: xor  <q2=%rdi,<e=%rax
xor  %rdi,%rax

# qhasm: q1 = x3 & 255
# asm 1: movzbl  <x3=int64#14b,>q1=int64#1d
# asm 2: movzbl  <x3=%bl,>q1=%edi
movzbl  %bl,%edi

# qhasm: (uint32) x3 <<<= 16
# asm 1: rol  $16,<x3=int64#14d
# asm 2: rol  $16,<x3=%ebx
rol  $16,%ebx

# qhasm: q1 = *(uint16 *) (table + q1 * 8)
# asm 1: movzwq (<table=int64#9,<q1=int64#1,8),>q1=int64#1
# asm 2: movzwq (<table=%r11,<q1=%rdi,8),>q1=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm: e ^= q1
# asm 1: xor  <q1=int64#1,<e=int64#7
# asm 2: xor  <q1=%rdi,<e=%rax
xor  %rdi,%rax

# qhasm: x0 ^= e
# asm 1: xor  <e=int64#7,<x0=int64#2
# asm 2: xor  <e=%rax,<x0=%rsi
xor  %rax,%rsi

# qhasm: *(uint32 *) (c + 52) = x0
# asm 1: movl   <x0=int64#2d,52(<c=int64#6)
# asm 2: movl   <x0=%esi,52(<c=%r9)
movl   %esi,52(%r9)

# qhasm: r11_caller = r11_stack
# asm 1: movq <r11_stack=stack64#1,>r11_caller=int64#9
# asm 2: movq <r11_stack=160(%rsp),>r11_caller=%r11
movq 160(%rsp),%r11

# qhasm: r12_caller = r12_stack
# asm 1: movq <r12_stack=stack64#2,>r12_caller=int64#10
# asm 2: movq <r12_stack=168(%rsp),>r12_caller=%r12
movq 168(%rsp),%r12

# qhasm: r13_caller = r13_stack
# asm 1: movq <r13_stack=stack64#3,>r13_caller=int64#11
# asm 2: movq <r13_stack=176(%rsp),>r13_caller=%r13
movq 176(%rsp),%r13

# qhasm: r14_caller = r14_stack
# asm 1: movq <r14_stack=stack64#4,>r14_caller=int64#12
# asm 2: movq <r14_stack=184(%rsp),>r14_caller=%r14
movq 184(%rsp),%r14

# qhasm: r15_caller = r15_stack
# asm 1: movq <r15_stack=stack64#5,>r15_caller=int64#13
# asm 2: movq <r15_stack=192(%rsp),>r15_caller=%r15
movq 192(%rsp),%r15

# qhasm: rbx_caller = rbx_stack
# asm 1: movq <rbx_stack=stack64#6,>rbx_caller=int64#14
# asm 2: movq <rbx_stack=200(%rsp),>rbx_caller=%rbx
movq 200(%rsp),%rbx

# qhasm: rbp_caller = rbp_stack
# asm 1: movq <rbp_stack=stack64#7,>rbp_caller=int64#15
# asm 2: movq <rbp_stack=208(%rsp),>rbp_caller=%rbp
movq 208(%rsp),%rbp

# qhasm: leave
add %r11,%rsp
mov %rdi,%rax
mov %rsi,%rdx
ret

# qhasm: enter ECRYPT_process_bytes stackaligned4096 aes_constants
.text
.p2align 5
.globl _ECRYPT_process_bytes
.globl ECRYPT_process_bytes
_ECRYPT_process_bytes:
ECRYPT_process_bytes:
mov %rsp,%r11
sub $aes_constants,%r11
and $4095,%r11
add $576,%r11
sub %r11,%rsp

# qhasm: r11_stack = r11_caller
# asm 1: movq <r11_caller=int64#9,>r11_stack=stack64#1
# asm 2: movq <r11_caller=%r11,>r11_stack=160(%rsp)
movq %r11,160(%rsp)

# qhasm: r12_stack = r12_caller
# asm 1: movq <r12_caller=int64#10,>r12_stack=stack64#2
# asm 2: movq <r12_caller=%r12,>r12_stack=168(%rsp)
movq %r12,168(%rsp)

# qhasm: r13_stack = r13_caller
# asm 1: movq <r13_caller=int64#11,>r13_stack=stack64#3
# asm 2: movq <r13_caller=%r13,>r13_stack=176(%rsp)
movq %r13,176(%rsp)

# qhasm: r14_stack = r14_caller
# asm 1: movq <r14_caller=int64#12,>r14_stack=stack64#4
# asm 2: movq <r14_caller=%r14,>r14_stack=184(%rsp)
movq %r14,184(%rsp)

# qhasm: r15_stack = r15_caller
# asm 1: movq <r15_caller=int64#13,>r15_stack=stack64#5
# asm 2: movq <r15_caller=%r15,>r15_stack=192(%rsp)
movq %r15,192(%rsp)

# qhasm: rbx_stack = rbx_caller
# asm 1: movq <rbx_caller=int64#14,>rbx_stack=stack64#6
# asm 2: movq <rbx_caller=%rbx,>rbx_stack=200(%rsp)
movq %rbx,200(%rsp)

# qhasm: rbp_stack = rbp_caller
# asm 1: movq <rbp_caller=int64#15,>rbp_stack=stack64#7
# asm 2: movq <rbp_caller=%rbp,>rbp_stack=208(%rsp)
movq %rbp,208(%rsp)

# qhasm: c = arg2
# asm 1: mov  <arg2=int64#2,>c=int64#2
# asm 2: mov  <arg2=%rsi,>c=%rsi
mov  %rsi,%rsi

# qhasm: in = arg3
# asm 1: mov  <arg3=int64#3,>in=int64#6
# asm 2: mov  <arg3=%rdx,>in=%r9
mov  %rdx,%r9

# qhasm: out = arg4
# asm 1: mov  <arg4=int64#4,>out=int64#8
# asm 2: mov  <arg4=%rcx,>out=%r10
mov  %rcx,%r10

# qhasm: len = arg5
# asm 1: mov  <arg5=int64#5,>len=int64#5
# asm 2: mov  <arg5=%r8,>len=%r8
mov  %r8,%r8

# qhasm: unsigned>? len - 0
# asm 1: cmp  $0,<len=int64#5
# asm 2: cmp  $0,<len=%r8
cmp  $0,%r8
# comment:fp stack unchanged by jump

# qhasm: goto nothingtodo if !unsigned>
jbe ._nothingtodo

# qhasm: x0 = *(uint32 *) (c + 0)
# asm 1: movl   0(<c=int64#2),>x0=int64#1d
# asm 2: movl   0(<c=%rsi),>x0=%edi
movl   0(%rsi),%edi

# qhasm: x1 = *(uint32 *) (c + 4)
# asm 1: movl   4(<c=int64#2),>x1=int64#3d
# asm 2: movl   4(<c=%rsi),>x1=%edx
movl   4(%rsi),%edx

# qhasm: x2 = *(uint32 *) (c + 8)
# asm 1: movl   8(<c=int64#2),>x2=int64#4d
# asm 2: movl   8(<c=%rsi),>x2=%ecx
movl   8(%rsi),%ecx

# qhasm: x3 = *(uint32 *) (c + 12)
# asm 1: movl   12(<c=int64#2),>x3=int64#7d
# asm 2: movl   12(<c=%rsi),>x3=%eax
movl   12(%rsi),%eax

# qhasm: r0 = x0
# asm 1: movq <x0=int64#1,>r0=stack64#8
# asm 2: movq <x0=%rdi,>r0=216(%rsp)
movq %rdi,216(%rsp)

# qhasm: r1 = x1
# asm 1: movq <x1=int64#3,>r1=stack64#9
# asm 2: movq <x1=%rdx,>r1=224(%rsp)
movq %rdx,224(%rsp)

# qhasm: r2 = x2
# asm 1: movq <x2=int64#4,>r2=stack64#10
# asm 2: movq <x2=%rcx,>r2=232(%rsp)
movq %rcx,232(%rsp)

# qhasm: r3 = x3
# asm 1: movq <x3=int64#7,>r3=stack64#11
# asm 2: movq <x3=%rax,>r3=240(%rsp)
movq %rax,240(%rsp)

# qhasm: x0 = *(uint32 *) (c + 16)
# asm 1: movl   16(<c=int64#2),>x0=int64#1d
# asm 2: movl   16(<c=%rsi),>x0=%edi
movl   16(%rsi),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#3
# asm 2: xor  <x0=%rdi,<x1=%rdx
xor  %rdi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#7
# asm 2: xor  <x2=%rcx,<x3=%rax
xor  %rcx,%rax

# qhasm: r4 = x0
# asm 1: movq <x0=int64#1,>r4=stack64#12
# asm 2: movq <x0=%rdi,>r4=248(%rsp)
movq %rdi,248(%rsp)

# qhasm: r5 = x1
# asm 1: movq <x1=int64#3,>r5=stack64#13
# asm 2: movq <x1=%rdx,>r5=256(%rsp)
movq %rdx,256(%rsp)

# qhasm: r6 = x2
# asm 1: movq <x2=int64#4,>r6=stack64#14
# asm 2: movq <x2=%rcx,>r6=264(%rsp)
movq %rcx,264(%rsp)

# qhasm: r7 = x3
# asm 1: movq <x3=int64#7,>r7=stack64#15
# asm 2: movq <x3=%rax,>r7=272(%rsp)
movq %rax,272(%rsp)

# qhasm: x0 = *(uint32 *) (c + 20)
# asm 1: movl   20(<c=int64#2),>x0=int64#1d
# asm 2: movl   20(<c=%rsi),>x0=%edi
movl   20(%rsi),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#3
# asm 2: xor  <x0=%rdi,<x1=%rdx
xor  %rdi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#7
# asm 2: xor  <x2=%rcx,<x3=%rax
xor  %rcx,%rax

# qhasm: r8 = x0
# asm 1: movq <x0=int64#1,>r8=stack64#16
# asm 2: movq <x0=%rdi,>r8=280(%rsp)
movq %rdi,280(%rsp)

# qhasm: r9 = x1
# asm 1: movq <x1=int64#3,>r9=stack64#17
# asm 2: movq <x1=%rdx,>r9=288(%rsp)
movq %rdx,288(%rsp)

# qhasm: r10 = x2
# asm 1: movq <x2=int64#4,>r10=stack64#18
# asm 2: movq <x2=%rcx,>r10=296(%rsp)
movq %rcx,296(%rsp)

# qhasm: r11 = x3
# asm 1: movq <x3=int64#7,>r11=stack64#19
# asm 2: movq <x3=%rax,>r11=304(%rsp)
movq %rax,304(%rsp)

# qhasm: x0 = *(uint32 *) (c + 24)
# asm 1: movl   24(<c=int64#2),>x0=int64#1d
# asm 2: movl   24(<c=%rsi),>x0=%edi
movl   24(%rsi),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#3
# asm 2: xor  <x0=%rdi,<x1=%rdx
xor  %rdi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#7
# asm 2: xor  <x2=%rcx,<x3=%rax
xor  %rcx,%rax

# qhasm: r12 = x0
# asm 1: movq <x0=int64#1,>r12=stack64#20
# asm 2: movq <x0=%rdi,>r12=312(%rsp)
movq %rdi,312(%rsp)

# qhasm: r13 = x1
# asm 1: movq <x1=int64#3,>r13=stack64#21
# asm 2: movq <x1=%rdx,>r13=320(%rsp)
movq %rdx,320(%rsp)

# qhasm: r14 = x2
# asm 1: movq <x2=int64#4,>r14=stack64#22
# asm 2: movq <x2=%rcx,>r14=328(%rsp)
movq %rcx,328(%rsp)

# qhasm: r15 = x3
# asm 1: movq <x3=int64#7,>r15=stack64#23
# asm 2: movq <x3=%rax,>r15=336(%rsp)
movq %rax,336(%rsp)

# qhasm: x0 = *(uint32 *) (c + 28)
# asm 1: movl   28(<c=int64#2),>x0=int64#1d
# asm 2: movl   28(<c=%rsi),>x0=%edi
movl   28(%rsi),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#3
# asm 2: xor  <x0=%rdi,<x1=%rdx
xor  %rdi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#7
# asm 2: xor  <x2=%rcx,<x3=%rax
xor  %rcx,%rax

# qhasm: r16 = x0
# asm 1: movq <x0=int64#1,>r16=stack64#24
# asm 2: movq <x0=%rdi,>r16=344(%rsp)
movq %rdi,344(%rsp)

# qhasm: r17 = x1
# asm 1: movq <x1=int64#3,>r17=stack64#25
# asm 2: movq <x1=%rdx,>r17=352(%rsp)
movq %rdx,352(%rsp)

# qhasm: r18 = x2
# asm 1: movq <x2=int64#4,>r18=stack64#26
# asm 2: movq <x2=%rcx,>r18=360(%rsp)
movq %rcx,360(%rsp)

# qhasm: r19 = x3
# asm 1: movq <x3=int64#7,>r19=stack64#27
# asm 2: movq <x3=%rax,>r19=368(%rsp)
movq %rax,368(%rsp)

# qhasm: x0 = *(uint32 *) (c + 32)
# asm 1: movl   32(<c=int64#2),>x0=int64#1d
# asm 2: movl   32(<c=%rsi),>x0=%edi
movl   32(%rsi),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#3
# asm 2: xor  <x0=%rdi,<x1=%rdx
xor  %rdi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#7
# asm 2: xor  <x2=%rcx,<x3=%rax
xor  %rcx,%rax

# qhasm: r20 = x0
# asm 1: movq <x0=int64#1,>r20=stack64#28
# asm 2: movq <x0=%rdi,>r20=376(%rsp)
movq %rdi,376(%rsp)

# qhasm: r21 = x1
# asm 1: movq <x1=int64#3,>r21=stack64#29
# asm 2: movq <x1=%rdx,>r21=384(%rsp)
movq %rdx,384(%rsp)

# qhasm: r22 = x2
# asm 1: movq <x2=int64#4,>r22=stack64#30
# asm 2: movq <x2=%rcx,>r22=392(%rsp)
movq %rcx,392(%rsp)

# qhasm: r23 = x3
# asm 1: movq <x3=int64#7,>r23=stack64#31
# asm 2: movq <x3=%rax,>r23=400(%rsp)
movq %rax,400(%rsp)

# qhasm: x0 = *(uint32 *) (c + 36)
# asm 1: movl   36(<c=int64#2),>x0=int64#1d
# asm 2: movl   36(<c=%rsi),>x0=%edi
movl   36(%rsi),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#3
# asm 2: xor  <x0=%rdi,<x1=%rdx
xor  %rdi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#7
# asm 2: xor  <x2=%rcx,<x3=%rax
xor  %rcx,%rax

# qhasm: r24 = x0
# asm 1: movq <x0=int64#1,>r24=stack64#32
# asm 2: movq <x0=%rdi,>r24=408(%rsp)
movq %rdi,408(%rsp)

# qhasm: r25 = x1
# asm 1: movq <x1=int64#3,>r25=stack64#33
# asm 2: movq <x1=%rdx,>r25=416(%rsp)
movq %rdx,416(%rsp)

# qhasm: r26 = x2
# asm 1: movq <x2=int64#4,>r26=stack64#34
# asm 2: movq <x2=%rcx,>r26=424(%rsp)
movq %rcx,424(%rsp)

# qhasm: r27 = x3
# asm 1: movq <x3=int64#7,>r27=stack64#35
# asm 2: movq <x3=%rax,>r27=432(%rsp)
movq %rax,432(%rsp)

# qhasm: x0 = *(uint32 *) (c + 40)
# asm 1: movl   40(<c=int64#2),>x0=int64#1d
# asm 2: movl   40(<c=%rsi),>x0=%edi
movl   40(%rsi),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#3
# asm 2: xor  <x0=%rdi,<x1=%rdx
xor  %rdi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#7
# asm 2: xor  <x2=%rcx,<x3=%rax
xor  %rcx,%rax

# qhasm: r28 = x0
# asm 1: movq <x0=int64#1,>r28=stack64#36
# asm 2: movq <x0=%rdi,>r28=440(%rsp)
movq %rdi,440(%rsp)

# qhasm: r29 = x1
# asm 1: movq <x1=int64#3,>r29=stack64#37
# asm 2: movq <x1=%rdx,>r29=448(%rsp)
movq %rdx,448(%rsp)

# qhasm: r30 = x2
# asm 1: movq <x2=int64#4,>r30=stack64#38
# asm 2: movq <x2=%rcx,>r30=456(%rsp)
movq %rcx,456(%rsp)

# qhasm: r31 = x3
# asm 1: movq <x3=int64#7,>r31=stack64#39
# asm 2: movq <x3=%rax,>r31=464(%rsp)
movq %rax,464(%rsp)

# qhasm: x0 = *(uint32 *) (c + 44)
# asm 1: movl   44(<c=int64#2),>x0=int64#1d
# asm 2: movl   44(<c=%rsi),>x0=%edi
movl   44(%rsi),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#3
# asm 2: xor  <x0=%rdi,<x1=%rdx
xor  %rdi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#7
# asm 2: xor  <x2=%rcx,<x3=%rax
xor  %rcx,%rax

# qhasm: r32 = x0
# asm 1: movq <x0=int64#1,>r32=stack64#40
# asm 2: movq <x0=%rdi,>r32=472(%rsp)
movq %rdi,472(%rsp)

# qhasm: r33 = x1
# asm 1: movq <x1=int64#3,>r33=stack64#41
# asm 2: movq <x1=%rdx,>r33=480(%rsp)
movq %rdx,480(%rsp)

# qhasm: r34 = x2
# asm 1: movq <x2=int64#4,>r34=stack64#42
# asm 2: movq <x2=%rcx,>r34=488(%rsp)
movq %rcx,488(%rsp)

# qhasm: r35 = x3
# asm 1: movq <x3=int64#7,>r35=stack64#43
# asm 2: movq <x3=%rax,>r35=496(%rsp)
movq %rax,496(%rsp)

# qhasm: x0 = *(uint32 *) (c + 48)
# asm 1: movl   48(<c=int64#2),>x0=int64#1d
# asm 2: movl   48(<c=%rsi),>x0=%edi
movl   48(%rsi),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#3
# asm 2: xor  <x0=%rdi,<x1=%rdx
xor  %rdi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#7
# asm 2: xor  <x2=%rcx,<x3=%rax
xor  %rcx,%rax

# qhasm: r36 = x0
# asm 1: movq <x0=int64#1,>r36=stack64#44
# asm 2: movq <x0=%rdi,>r36=504(%rsp)
movq %rdi,504(%rsp)

# qhasm: r37 = x1
# asm 1: movq <x1=int64#3,>r37=stack64#45
# asm 2: movq <x1=%rdx,>r37=512(%rsp)
movq %rdx,512(%rsp)

# qhasm: r38 = x2
# asm 1: movq <x2=int64#4,>r38=stack64#46
# asm 2: movq <x2=%rcx,>r38=520(%rsp)
movq %rcx,520(%rsp)

# qhasm: r39 = x3
# asm 1: movq <x3=int64#7,>r39=stack64#47
# asm 2: movq <x3=%rax,>r39=528(%rsp)
movq %rax,528(%rsp)

# qhasm: x0 = *(uint32 *) (c + 52)
# asm 1: movl   52(<c=int64#2),>x0=int64#1d
# asm 2: movl   52(<c=%rsi),>x0=%edi
movl   52(%rsi),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#3
# asm 2: xor  <x0=%rdi,<x1=%rdx
xor  %rdi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#7
# asm 2: xor  <x2=%rcx,<x3=%rax
xor  %rcx,%rax

# qhasm: r40 = x0
# asm 1: movq <x0=int64#1,>r40=stack64#48
# asm 2: movq <x0=%rdi,>r40=536(%rsp)
movq %rdi,536(%rsp)

# qhasm: r41 = x1
# asm 1: movq <x1=int64#3,>r41=stack64#49
# asm 2: movq <x1=%rdx,>r41=544(%rsp)
movq %rdx,544(%rsp)

# qhasm: r42 = x2
# asm 1: movq <x2=int64#4,>r42=stack64#50
# asm 2: movq <x2=%rcx,>r42=552(%rsp)
movq %rcx,552(%rsp)

# qhasm: r43 = x3
# asm 1: movq <x3=int64#7,>r43=stack64#51
# asm 2: movq <x3=%rax,>r43=560(%rsp)
movq %rax,560(%rsp)

# qhasm: y0 = *(uint32 *) (c + 56)
# asm 1: movl   56(<c=int64#2),>y0=int64#14d
# asm 2: movl   56(<c=%rsi),>y0=%ebx
movl   56(%rsi),%ebx

# qhasm: y1 = *(uint32 *) (c + 60)
# asm 1: movl   60(<c=int64#2),>y1=int64#3d
# asm 2: movl   60(<c=%rsi),>y1=%edx
movl   60(%rsi),%edx

# qhasm: y2 = *(uint32 *) (c + 64)
# asm 1: movl   64(<c=int64#2),>y2=int64#4d
# asm 2: movl   64(<c=%rsi),>y2=%ecx
movl   64(%rsi),%ecx

# qhasm: y3 = *(uint32 *) (c + 68)
# asm 1: movl   68(<c=int64#2),>y3=int64#7d
# asm 2: movl   68(<c=%rsi),>y3=%eax
movl   68(%rsi),%eax

# qhasm: table = &aes_tablex
# asm 1: lea  aes_tablex(%rip),>table=int64#9
# asm 2: lea  aes_tablex(%rip),>table=%r11
lea  aes_tablex(%rip),%r11

# qhasm: unsigned<? len - 40
# asm 1: cmp  $40,<len=int64#5
# asm 2: cmp  $40,<len=%r8
cmp  $40,%r8
# comment:fp stack unchanged by jump

# qhasm: goto lessthan40bytesleft if unsigned< 
jb ._lessthan40bytesleft
# comment:fp stack unchanged by fallthrough

# qhasm: mainloop:
._mainloop:

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#1,8),>z0=int64#10d
# asm 2: movl   3(<table=%r11,<p00=%rdi,8),>z0=%r12d
movl   3(%r11,%rdi,8),%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#9,<p03=int64#1,8),>z3=int64#11d
# asm 2: movl   2(<table=%r11,<p03=%rdi,8),>z3=%r13d
movl   2(%r11,%rdi,8),%r13d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#1,8),>z2=int64#12d
# asm 2: movl   1(<table=%r11,<p02=%rdi,8),>z2=%r14d
movl   1(%r11,%rdi,8),%r14d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#9,<p01=int64#1,8),>z1=int64#13d
# asm 2: movl   4(<table=%r11,<p01=%rdi,8),>z1=%r15d
movl   4(%r11,%rdi,8),%r15d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p10=int64#1d
# asm 2: movzbl  <y1=%dl,>p10=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#1,8),<z1=int64#13d
# asm 2: xorl 3(<table=%r11,<p10=%rdi,8),<z1=%r15d
xorl 3(%r11,%rdi,8),%r15d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%dh,>p11=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#1,8),<z0=int64#10d
# asm 2: xorl 2(<table=%r11,<p11=%rdi,8),<z0=%r12d
xorl 2(%r11,%rdi,8),%r12d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#3d
# asm 2: shr  $16,<y1=%edx
shr  $16,%edx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p12=int64#1d
# asm 2: movzbl  <y1=%dl,>p12=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#1,8),<z3=int64#11d
# asm 2: xorl 1(<table=%r11,<p12=%rdi,8),<z3=%r13d
xorl 1(%r11,%rdi,8),%r13d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%dh,>p13=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#1,8),<z2=int64#12d
# asm 2: xorl 4(<table=%r11,<p13=%rdi,8),<z2=%r14d
xorl 4(%r11,%rdi,8),%r14d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p20=int64#1d
# asm 2: movzbl  <y2=%cl,>p20=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#1,8),<z2=int64#12d
# asm 2: xorl 3(<table=%r11,<p20=%rdi,8),<z2=%r14d
xorl 3(%r11,%rdi,8),%r14d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%ch,>p21=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#1,8),<z1=int64#13d
# asm 2: xorl 2(<table=%r11,<p21=%rdi,8),<z1=%r15d
xorl 2(%r11,%rdi,8),%r15d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#4d
# asm 2: shr  $16,<y2=%ecx
shr  $16,%ecx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p22=int64#1d
# asm 2: movzbl  <y2=%cl,>p22=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#1,8),<z0=int64#10d
# asm 2: xorl 1(<table=%r11,<p22=%rdi,8),<z0=%r12d
xorl 1(%r11,%rdi,8),%r12d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%ch,>p23=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#1,8),<z3=int64#11d
# asm 2: xorl 4(<table=%r11,<p23=%rdi,8),<z3=%r13d
xorl 4(%r11,%rdi,8),%r13d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#1,8),<z3=int64#11d
# asm 2: xorl 3(<table=%r11,<p30=%rdi,8),<z3=%r13d
xorl 3(%r11,%rdi,8),%r13d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#1,8),<z2=int64#12d
# asm 2: xorl 2(<table=%r11,<p31=%rdi,8),<z2=%r14d
xorl 2(%r11,%rdi,8),%r14d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#1,8),<z1=int64#13d
# asm 2: xorl 1(<table=%r11,<p32=%rdi,8),<z1=%r15d
xorl 1(%r11,%rdi,8),%r15d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#1,8),<z0=int64#10d
# asm 2: xorl 4(<table=%r11,<p33=%rdi,8),<z0=%r12d
xorl 4(%r11,%rdi,8),%r12d

# qhasm:   y0 = r4
# asm 1: movq <r4=stack64#12,>y0=int64#14
# asm 2: movq <r4=248(%rsp),>y0=%rbx
movq 248(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#10,<y0=int64#14
# asm 2: xor  <z0=%r12,<y0=%rbx
xor  %r12,%rbx

# qhasm:   y1 = r5
# asm 1: movq <r5=stack64#13,>y1=int64#3
# asm 2: movq <r5=256(%rsp),>y1=%rdx
movq 256(%rsp),%rdx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#13,<y1=int64#3
# asm 2: xor  <z1=%r15,<y1=%rdx
xor  %r15,%rdx

# qhasm:   y2 = r6
# asm 1: movq <r6=stack64#14,>y2=int64#4
# asm 2: movq <r6=264(%rsp),>y2=%rcx
movq 264(%rsp),%rcx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#12,<y2=int64#4
# asm 2: xor  <z2=%r14,<y2=%rcx
xor  %r14,%rcx

# qhasm:   y3 = r7
# asm 1: movq <r7=stack64#15,>y3=int64#7
# asm 2: movq <r7=272(%rsp),>y3=%rax
movq 272(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#11,<y3=int64#7
# asm 2: xor  <z3=%r13,<y3=%rax
xor  %r13,%rax

# qhasm:   leak0 = y0 
# asm 1: mov  <y0=int64#14,>leak0=int64#1
# asm 2: mov  <y0=%rbx,>leak0=%rdi
mov  %rbx,%rdi

# qhasm:   (uint32) leak0 &= 0xff00ff
# asm 1: and  $0xff00ff,<leak0=int64#1d
# asm 2: and  $0xff00ff,<leak0=%edi
and  $0xff00ff,%edi

# qhasm:   (uint32) leak0 <<<= 24
# asm 1: rol  $24,<leak0=int64#1d
# asm 2: rol  $24,<leak0=%edi
rol  $24,%edi

# qhasm:   leak1 = y2
# asm 1: mov  <y2=int64#4,>leak1=int64#10
# asm 2: mov  <y2=%rcx,>leak1=%r12
mov  %rcx,%r12

# qhasm:   (uint32) leak1 &= 0xff00ff
# asm 1: and  $0xff00ff,<leak1=int64#10d
# asm 2: and  $0xff00ff,<leak1=%r12d
and  $0xff00ff,%r12d

# qhasm:   (uint32) leak1 <<<= 16
# asm 1: rol  $16,<leak1=int64#10d
# asm 2: rol  $16,<leak1=%r12d
rol  $16,%r12d

# qhasm:   leak0 ^= leak1
# asm 1: xor  <leak1=int64#10,<leak0=int64#1
# asm 2: xor  <leak1=%r12,<leak0=%rdi
xor  %r12,%rdi

# qhasm:   (uint32) leak0 ^= *(uint32 *) (in + 0)
# asm 1: xorl 0(<in=int64#6),<leak0=int64#1d
# asm 2: xorl 0(<in=%r9),<leak0=%edi
xorl 0(%r9),%edi

# qhasm:   *(uint32 *) (out + 0) = leak0
# asm 1: movl   <leak0=int64#1d,0(<out=int64#8)
# asm 2: movl   <leak0=%edi,0(<out=%r10)
movl   %edi,0(%r10)

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#1,8),>z0=int64#10d
# asm 2: movl   3(<table=%r11,<p00=%rdi,8),>z0=%r12d
movl   3(%r11,%rdi,8),%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#9,<p03=int64#1,8),>z3=int64#11d
# asm 2: movl   2(<table=%r11,<p03=%rdi,8),>z3=%r13d
movl   2(%r11,%rdi,8),%r13d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#1,8),>z2=int64#12d
# asm 2: movl   1(<table=%r11,<p02=%rdi,8),>z2=%r14d
movl   1(%r11,%rdi,8),%r14d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#9,<p01=int64#1,8),>z1=int64#13d
# asm 2: movl   4(<table=%r11,<p01=%rdi,8),>z1=%r15d
movl   4(%r11,%rdi,8),%r15d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p10=int64#1d
# asm 2: movzbl  <y1=%dl,>p10=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#1,8),<z1=int64#13d
# asm 2: xorl 3(<table=%r11,<p10=%rdi,8),<z1=%r15d
xorl 3(%r11,%rdi,8),%r15d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%dh,>p11=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#1,8),<z0=int64#10d
# asm 2: xorl 2(<table=%r11,<p11=%rdi,8),<z0=%r12d
xorl 2(%r11,%rdi,8),%r12d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#3d
# asm 2: shr  $16,<y1=%edx
shr  $16,%edx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p12=int64#1d
# asm 2: movzbl  <y1=%dl,>p12=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#1,8),<z3=int64#11d
# asm 2: xorl 1(<table=%r11,<p12=%rdi,8),<z3=%r13d
xorl 1(%r11,%rdi,8),%r13d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%dh,>p13=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#1,8),<z2=int64#12d
# asm 2: xorl 4(<table=%r11,<p13=%rdi,8),<z2=%r14d
xorl 4(%r11,%rdi,8),%r14d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p20=int64#1d
# asm 2: movzbl  <y2=%cl,>p20=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#1,8),<z2=int64#12d
# asm 2: xorl 3(<table=%r11,<p20=%rdi,8),<z2=%r14d
xorl 3(%r11,%rdi,8),%r14d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%ch,>p21=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#1,8),<z1=int64#13d
# asm 2: xorl 2(<table=%r11,<p21=%rdi,8),<z1=%r15d
xorl 2(%r11,%rdi,8),%r15d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#4d
# asm 2: shr  $16,<y2=%ecx
shr  $16,%ecx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p22=int64#1d
# asm 2: movzbl  <y2=%cl,>p22=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#1,8),<z0=int64#10d
# asm 2: xorl 1(<table=%r11,<p22=%rdi,8),<z0=%r12d
xorl 1(%r11,%rdi,8),%r12d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%ch,>p23=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#1,8),<z3=int64#11d
# asm 2: xorl 4(<table=%r11,<p23=%rdi,8),<z3=%r13d
xorl 4(%r11,%rdi,8),%r13d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#1,8),<z3=int64#11d
# asm 2: xorl 3(<table=%r11,<p30=%rdi,8),<z3=%r13d
xorl 3(%r11,%rdi,8),%r13d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#1,8),<z2=int64#12d
# asm 2: xorl 2(<table=%r11,<p31=%rdi,8),<z2=%r14d
xorl 2(%r11,%rdi,8),%r14d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#1,8),<z1=int64#13d
# asm 2: xorl 1(<table=%r11,<p32=%rdi,8),<z1=%r15d
xorl 1(%r11,%rdi,8),%r15d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#1,8),<z0=int64#10d
# asm 2: xorl 4(<table=%r11,<p33=%rdi,8),<z0=%r12d
xorl 4(%r11,%rdi,8),%r12d

# qhasm:   y0 = r8
# asm 1: movq <r8=stack64#16,>y0=int64#14
# asm 2: movq <r8=280(%rsp),>y0=%rbx
movq 280(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#10,<y0=int64#14
# asm 2: xor  <z0=%r12,<y0=%rbx
xor  %r12,%rbx

# qhasm:   y1 = r9
# asm 1: movq <r9=stack64#17,>y1=int64#3
# asm 2: movq <r9=288(%rsp),>y1=%rdx
movq 288(%rsp),%rdx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#13,<y1=int64#3
# asm 2: xor  <z1=%r15,<y1=%rdx
xor  %r15,%rdx

# qhasm:   y2 = r10
# asm 1: movq <r10=stack64#18,>y2=int64#4
# asm 2: movq <r10=296(%rsp),>y2=%rcx
movq 296(%rsp),%rcx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#12,<y2=int64#4
# asm 2: xor  <z2=%r14,<y2=%rcx
xor  %r14,%rcx

# qhasm:   y3 = r11
# asm 1: movq <r11=stack64#19,>y3=int64#7
# asm 2: movq <r11=304(%rsp),>y3=%rax
movq 304(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#11,<y3=int64#7
# asm 2: xor  <z3=%r13,<y3=%rax
xor  %r13,%rax

# qhasm:   leak0 = y0 
# asm 1: mov  <y0=int64#14,>leak0=int64#1
# asm 2: mov  <y0=%rbx,>leak0=%rdi
mov  %rbx,%rdi

# qhasm:   (uint32) leak0 &= 0xff00ff00
# asm 1: and  $0xff00ff00,<leak0=int64#1d
# asm 2: and  $0xff00ff00,<leak0=%edi
and  $0xff00ff00,%edi

# qhasm:   (uint32) leak0 <<<= 16
# asm 1: rol  $16,<leak0=int64#1d
# asm 2: rol  $16,<leak0=%edi
rol  $16,%edi

# qhasm:   leak1 = y2
# asm 1: mov  <y2=int64#4,>leak1=int64#10
# asm 2: mov  <y2=%rcx,>leak1=%r12
mov  %rcx,%r12

# qhasm:   (uint32) leak1 &= 0xff00ff00
# asm 1: and  $0xff00ff00,<leak1=int64#10d
# asm 2: and  $0xff00ff00,<leak1=%r12d
and  $0xff00ff00,%r12d

# qhasm:   (uint32) leak1 <<<= 8
# asm 1: rol  $8,<leak1=int64#10d
# asm 2: rol  $8,<leak1=%r12d
rol  $8,%r12d

# qhasm:   leak0 ^= leak1
# asm 1: xor  <leak1=int64#10,<leak0=int64#1
# asm 2: xor  <leak1=%r12,<leak0=%rdi
xor  %r12,%rdi

# qhasm:   (uint32) leak0 ^= *(uint32 *) (in + 4)
# asm 1: xorl 4(<in=int64#6),<leak0=int64#1d
# asm 2: xorl 4(<in=%r9),<leak0=%edi
xorl 4(%r9),%edi

# qhasm:   *(uint32 *) (out + 4) = leak0
# asm 1: movl   <leak0=int64#1d,4(<out=int64#8)
# asm 2: movl   <leak0=%edi,4(<out=%r10)
movl   %edi,4(%r10)

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#1,8),>z0=int64#10d
# asm 2: movl   3(<table=%r11,<p00=%rdi,8),>z0=%r12d
movl   3(%r11,%rdi,8),%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#9,<p03=int64#1,8),>z3=int64#11d
# asm 2: movl   2(<table=%r11,<p03=%rdi,8),>z3=%r13d
movl   2(%r11,%rdi,8),%r13d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#1,8),>z2=int64#12d
# asm 2: movl   1(<table=%r11,<p02=%rdi,8),>z2=%r14d
movl   1(%r11,%rdi,8),%r14d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#9,<p01=int64#1,8),>z1=int64#13d
# asm 2: movl   4(<table=%r11,<p01=%rdi,8),>z1=%r15d
movl   4(%r11,%rdi,8),%r15d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p10=int64#1d
# asm 2: movzbl  <y1=%dl,>p10=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#1,8),<z1=int64#13d
# asm 2: xorl 3(<table=%r11,<p10=%rdi,8),<z1=%r15d
xorl 3(%r11,%rdi,8),%r15d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%dh,>p11=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#1,8),<z0=int64#10d
# asm 2: xorl 2(<table=%r11,<p11=%rdi,8),<z0=%r12d
xorl 2(%r11,%rdi,8),%r12d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#3d
# asm 2: shr  $16,<y1=%edx
shr  $16,%edx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p12=int64#1d
# asm 2: movzbl  <y1=%dl,>p12=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#1,8),<z3=int64#11d
# asm 2: xorl 1(<table=%r11,<p12=%rdi,8),<z3=%r13d
xorl 1(%r11,%rdi,8),%r13d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%dh,>p13=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#1,8),<z2=int64#12d
# asm 2: xorl 4(<table=%r11,<p13=%rdi,8),<z2=%r14d
xorl 4(%r11,%rdi,8),%r14d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p20=int64#1d
# asm 2: movzbl  <y2=%cl,>p20=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#1,8),<z2=int64#12d
# asm 2: xorl 3(<table=%r11,<p20=%rdi,8),<z2=%r14d
xorl 3(%r11,%rdi,8),%r14d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%ch,>p21=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#1,8),<z1=int64#13d
# asm 2: xorl 2(<table=%r11,<p21=%rdi,8),<z1=%r15d
xorl 2(%r11,%rdi,8),%r15d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#4d
# asm 2: shr  $16,<y2=%ecx
shr  $16,%ecx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p22=int64#1d
# asm 2: movzbl  <y2=%cl,>p22=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#1,8),<z0=int64#10d
# asm 2: xorl 1(<table=%r11,<p22=%rdi,8),<z0=%r12d
xorl 1(%r11,%rdi,8),%r12d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%ch,>p23=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#1,8),<z3=int64#11d
# asm 2: xorl 4(<table=%r11,<p23=%rdi,8),<z3=%r13d
xorl 4(%r11,%rdi,8),%r13d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#1,8),<z3=int64#11d
# asm 2: xorl 3(<table=%r11,<p30=%rdi,8),<z3=%r13d
xorl 3(%r11,%rdi,8),%r13d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#1,8),<z2=int64#12d
# asm 2: xorl 2(<table=%r11,<p31=%rdi,8),<z2=%r14d
xorl 2(%r11,%rdi,8),%r14d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#1,8),<z1=int64#13d
# asm 2: xorl 1(<table=%r11,<p32=%rdi,8),<z1=%r15d
xorl 1(%r11,%rdi,8),%r15d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#1,8),<z0=int64#10d
# asm 2: xorl 4(<table=%r11,<p33=%rdi,8),<z0=%r12d
xorl 4(%r11,%rdi,8),%r12d

# qhasm:   y0 = r12
# asm 1: movq <r12=stack64#20,>y0=int64#14
# asm 2: movq <r12=312(%rsp),>y0=%rbx
movq 312(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#10,<y0=int64#14
# asm 2: xor  <z0=%r12,<y0=%rbx
xor  %r12,%rbx

# qhasm:   y1 = r13
# asm 1: movq <r13=stack64#21,>y1=int64#3
# asm 2: movq <r13=320(%rsp),>y1=%rdx
movq 320(%rsp),%rdx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#13,<y1=int64#3
# asm 2: xor  <z1=%r15,<y1=%rdx
xor  %r15,%rdx

# qhasm:   y2 = r14
# asm 1: movq <r14=stack64#22,>y2=int64#4
# asm 2: movq <r14=328(%rsp),>y2=%rcx
movq 328(%rsp),%rcx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#12,<y2=int64#4
# asm 2: xor  <z2=%r14,<y2=%rcx
xor  %r14,%rcx

# qhasm:   y3 = r15
# asm 1: movq <r15=stack64#23,>y3=int64#7
# asm 2: movq <r15=336(%rsp),>y3=%rax
movq 336(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#11,<y3=int64#7
# asm 2: xor  <z3=%r13,<y3=%rax
xor  %r13,%rax

# qhasm:   leak0 = y0 
# asm 1: mov  <y0=int64#14,>leak0=int64#1
# asm 2: mov  <y0=%rbx,>leak0=%rdi
mov  %rbx,%rdi

# qhasm:   (uint32) leak0 &= 0xff00ff
# asm 1: and  $0xff00ff,<leak0=int64#1d
# asm 2: and  $0xff00ff,<leak0=%edi
and  $0xff00ff,%edi

# qhasm:   (uint32) leak0 <<<= 24
# asm 1: rol  $24,<leak0=int64#1d
# asm 2: rol  $24,<leak0=%edi
rol  $24,%edi

# qhasm:   leak1 = y2
# asm 1: mov  <y2=int64#4,>leak1=int64#10
# asm 2: mov  <y2=%rcx,>leak1=%r12
mov  %rcx,%r12

# qhasm:   (uint32) leak1 &= 0xff00ff
# asm 1: and  $0xff00ff,<leak1=int64#10d
# asm 2: and  $0xff00ff,<leak1=%r12d
and  $0xff00ff,%r12d

# qhasm:   (uint32) leak1 <<<= 16
# asm 1: rol  $16,<leak1=int64#10d
# asm 2: rol  $16,<leak1=%r12d
rol  $16,%r12d

# qhasm:   leak0 ^= leak1
# asm 1: xor  <leak1=int64#10,<leak0=int64#1
# asm 2: xor  <leak1=%r12,<leak0=%rdi
xor  %r12,%rdi

# qhasm:   (uint32) leak0 ^= *(uint32 *) (in + 8)
# asm 1: xorl 8(<in=int64#6),<leak0=int64#1d
# asm 2: xorl 8(<in=%r9),<leak0=%edi
xorl 8(%r9),%edi

# qhasm:   *(uint32 *) (out + 8) = leak0
# asm 1: movl   <leak0=int64#1d,8(<out=int64#8)
# asm 2: movl   <leak0=%edi,8(<out=%r10)
movl   %edi,8(%r10)

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#1,8),>z0=int64#10d
# asm 2: movl   3(<table=%r11,<p00=%rdi,8),>z0=%r12d
movl   3(%r11,%rdi,8),%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#9,<p03=int64#1,8),>z3=int64#11d
# asm 2: movl   2(<table=%r11,<p03=%rdi,8),>z3=%r13d
movl   2(%r11,%rdi,8),%r13d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#1,8),>z2=int64#12d
# asm 2: movl   1(<table=%r11,<p02=%rdi,8),>z2=%r14d
movl   1(%r11,%rdi,8),%r14d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#9,<p01=int64#1,8),>z1=int64#13d
# asm 2: movl   4(<table=%r11,<p01=%rdi,8),>z1=%r15d
movl   4(%r11,%rdi,8),%r15d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p10=int64#1d
# asm 2: movzbl  <y1=%dl,>p10=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#1,8),<z1=int64#13d
# asm 2: xorl 3(<table=%r11,<p10=%rdi,8),<z1=%r15d
xorl 3(%r11,%rdi,8),%r15d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%dh,>p11=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#1,8),<z0=int64#10d
# asm 2: xorl 2(<table=%r11,<p11=%rdi,8),<z0=%r12d
xorl 2(%r11,%rdi,8),%r12d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#3d
# asm 2: shr  $16,<y1=%edx
shr  $16,%edx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p12=int64#1d
# asm 2: movzbl  <y1=%dl,>p12=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#1,8),<z3=int64#11d
# asm 2: xorl 1(<table=%r11,<p12=%rdi,8),<z3=%r13d
xorl 1(%r11,%rdi,8),%r13d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%dh,>p13=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#1,8),<z2=int64#12d
# asm 2: xorl 4(<table=%r11,<p13=%rdi,8),<z2=%r14d
xorl 4(%r11,%rdi,8),%r14d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p20=int64#1d
# asm 2: movzbl  <y2=%cl,>p20=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#1,8),<z2=int64#12d
# asm 2: xorl 3(<table=%r11,<p20=%rdi,8),<z2=%r14d
xorl 3(%r11,%rdi,8),%r14d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%ch,>p21=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#1,8),<z1=int64#13d
# asm 2: xorl 2(<table=%r11,<p21=%rdi,8),<z1=%r15d
xorl 2(%r11,%rdi,8),%r15d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#4d
# asm 2: shr  $16,<y2=%ecx
shr  $16,%ecx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p22=int64#1d
# asm 2: movzbl  <y2=%cl,>p22=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#1,8),<z0=int64#10d
# asm 2: xorl 1(<table=%r11,<p22=%rdi,8),<z0=%r12d
xorl 1(%r11,%rdi,8),%r12d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%ch,>p23=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#1,8),<z3=int64#11d
# asm 2: xorl 4(<table=%r11,<p23=%rdi,8),<z3=%r13d
xorl 4(%r11,%rdi,8),%r13d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#1,8),<z3=int64#11d
# asm 2: xorl 3(<table=%r11,<p30=%rdi,8),<z3=%r13d
xorl 3(%r11,%rdi,8),%r13d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#1,8),<z2=int64#12d
# asm 2: xorl 2(<table=%r11,<p31=%rdi,8),<z2=%r14d
xorl 2(%r11,%rdi,8),%r14d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#1,8),<z1=int64#13d
# asm 2: xorl 1(<table=%r11,<p32=%rdi,8),<z1=%r15d
xorl 1(%r11,%rdi,8),%r15d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#1,8),<z0=int64#10d
# asm 2: xorl 4(<table=%r11,<p33=%rdi,8),<z0=%r12d
xorl 4(%r11,%rdi,8),%r12d

# qhasm:   y0 = r16
# asm 1: movq <r16=stack64#24,>y0=int64#14
# asm 2: movq <r16=344(%rsp),>y0=%rbx
movq 344(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#10,<y0=int64#14
# asm 2: xor  <z0=%r12,<y0=%rbx
xor  %r12,%rbx

# qhasm:   y1 = r17
# asm 1: movq <r17=stack64#25,>y1=int64#3
# asm 2: movq <r17=352(%rsp),>y1=%rdx
movq 352(%rsp),%rdx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#13,<y1=int64#3
# asm 2: xor  <z1=%r15,<y1=%rdx
xor  %r15,%rdx

# qhasm:   y2 = r18
# asm 1: movq <r18=stack64#26,>y2=int64#4
# asm 2: movq <r18=360(%rsp),>y2=%rcx
movq 360(%rsp),%rcx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#12,<y2=int64#4
# asm 2: xor  <z2=%r14,<y2=%rcx
xor  %r14,%rcx

# qhasm:   y3 = r19
# asm 1: movq <r19=stack64#27,>y3=int64#7
# asm 2: movq <r19=368(%rsp),>y3=%rax
movq 368(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#11,<y3=int64#7
# asm 2: xor  <z3=%r13,<y3=%rax
xor  %r13,%rax

# qhasm:   leak0 = y0 
# asm 1: mov  <y0=int64#14,>leak0=int64#1
# asm 2: mov  <y0=%rbx,>leak0=%rdi
mov  %rbx,%rdi

# qhasm:   (uint32) leak0 &= 0xff00ff00
# asm 1: and  $0xff00ff00,<leak0=int64#1d
# asm 2: and  $0xff00ff00,<leak0=%edi
and  $0xff00ff00,%edi

# qhasm:   (uint32) leak0 <<<= 16
# asm 1: rol  $16,<leak0=int64#1d
# asm 2: rol  $16,<leak0=%edi
rol  $16,%edi

# qhasm:   leak1 = y2
# asm 1: mov  <y2=int64#4,>leak1=int64#10
# asm 2: mov  <y2=%rcx,>leak1=%r12
mov  %rcx,%r12

# qhasm:   (uint32) leak1 &= 0xff00ff00
# asm 1: and  $0xff00ff00,<leak1=int64#10d
# asm 2: and  $0xff00ff00,<leak1=%r12d
and  $0xff00ff00,%r12d

# qhasm:   (uint32) leak1 <<<= 8
# asm 1: rol  $8,<leak1=int64#10d
# asm 2: rol  $8,<leak1=%r12d
rol  $8,%r12d

# qhasm:   leak0 ^= leak1
# asm 1: xor  <leak1=int64#10,<leak0=int64#1
# asm 2: xor  <leak1=%r12,<leak0=%rdi
xor  %r12,%rdi

# qhasm:   (uint32) leak0 ^= *(uint32 *) (in + 12)
# asm 1: xorl 12(<in=int64#6),<leak0=int64#1d
# asm 2: xorl 12(<in=%r9),<leak0=%edi
xorl 12(%r9),%edi

# qhasm:   *(uint32 *) (out + 12) = leak0
# asm 1: movl   <leak0=int64#1d,12(<out=int64#8)
# asm 2: movl   <leak0=%edi,12(<out=%r10)
movl   %edi,12(%r10)

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#1,8),>z0=int64#10d
# asm 2: movl   3(<table=%r11,<p00=%rdi,8),>z0=%r12d
movl   3(%r11,%rdi,8),%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#9,<p03=int64#1,8),>z3=int64#11d
# asm 2: movl   2(<table=%r11,<p03=%rdi,8),>z3=%r13d
movl   2(%r11,%rdi,8),%r13d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#1,8),>z2=int64#12d
# asm 2: movl   1(<table=%r11,<p02=%rdi,8),>z2=%r14d
movl   1(%r11,%rdi,8),%r14d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#9,<p01=int64#1,8),>z1=int64#13d
# asm 2: movl   4(<table=%r11,<p01=%rdi,8),>z1=%r15d
movl   4(%r11,%rdi,8),%r15d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p10=int64#1d
# asm 2: movzbl  <y1=%dl,>p10=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#1,8),<z1=int64#13d
# asm 2: xorl 3(<table=%r11,<p10=%rdi,8),<z1=%r15d
xorl 3(%r11,%rdi,8),%r15d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%dh,>p11=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#1,8),<z0=int64#10d
# asm 2: xorl 2(<table=%r11,<p11=%rdi,8),<z0=%r12d
xorl 2(%r11,%rdi,8),%r12d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#3d
# asm 2: shr  $16,<y1=%edx
shr  $16,%edx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p12=int64#1d
# asm 2: movzbl  <y1=%dl,>p12=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#1,8),<z3=int64#11d
# asm 2: xorl 1(<table=%r11,<p12=%rdi,8),<z3=%r13d
xorl 1(%r11,%rdi,8),%r13d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%dh,>p13=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#1,8),<z2=int64#12d
# asm 2: xorl 4(<table=%r11,<p13=%rdi,8),<z2=%r14d
xorl 4(%r11,%rdi,8),%r14d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p20=int64#1d
# asm 2: movzbl  <y2=%cl,>p20=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#1,8),<z2=int64#12d
# asm 2: xorl 3(<table=%r11,<p20=%rdi,8),<z2=%r14d
xorl 3(%r11,%rdi,8),%r14d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%ch,>p21=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#1,8),<z1=int64#13d
# asm 2: xorl 2(<table=%r11,<p21=%rdi,8),<z1=%r15d
xorl 2(%r11,%rdi,8),%r15d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#4d
# asm 2: shr  $16,<y2=%ecx
shr  $16,%ecx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p22=int64#1d
# asm 2: movzbl  <y2=%cl,>p22=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#1,8),<z0=int64#10d
# asm 2: xorl 1(<table=%r11,<p22=%rdi,8),<z0=%r12d
xorl 1(%r11,%rdi,8),%r12d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%ch,>p23=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#1,8),<z3=int64#11d
# asm 2: xorl 4(<table=%r11,<p23=%rdi,8),<z3=%r13d
xorl 4(%r11,%rdi,8),%r13d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#1,8),<z3=int64#11d
# asm 2: xorl 3(<table=%r11,<p30=%rdi,8),<z3=%r13d
xorl 3(%r11,%rdi,8),%r13d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#1,8),<z2=int64#12d
# asm 2: xorl 2(<table=%r11,<p31=%rdi,8),<z2=%r14d
xorl 2(%r11,%rdi,8),%r14d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#1,8),<z1=int64#13d
# asm 2: xorl 1(<table=%r11,<p32=%rdi,8),<z1=%r15d
xorl 1(%r11,%rdi,8),%r15d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#1,8),<z0=int64#10d
# asm 2: xorl 4(<table=%r11,<p33=%rdi,8),<z0=%r12d
xorl 4(%r11,%rdi,8),%r12d

# qhasm:   y0 = r20
# asm 1: movq <r20=stack64#28,>y0=int64#14
# asm 2: movq <r20=376(%rsp),>y0=%rbx
movq 376(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#10,<y0=int64#14
# asm 2: xor  <z0=%r12,<y0=%rbx
xor  %r12,%rbx

# qhasm:   y1 = r21
# asm 1: movq <r21=stack64#29,>y1=int64#3
# asm 2: movq <r21=384(%rsp),>y1=%rdx
movq 384(%rsp),%rdx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#13,<y1=int64#3
# asm 2: xor  <z1=%r15,<y1=%rdx
xor  %r15,%rdx

# qhasm:   y2 = r22
# asm 1: movq <r22=stack64#30,>y2=int64#4
# asm 2: movq <r22=392(%rsp),>y2=%rcx
movq 392(%rsp),%rcx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#12,<y2=int64#4
# asm 2: xor  <z2=%r14,<y2=%rcx
xor  %r14,%rcx

# qhasm:   y3 = r23
# asm 1: movq <r23=stack64#31,>y3=int64#7
# asm 2: movq <r23=400(%rsp),>y3=%rax
movq 400(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#11,<y3=int64#7
# asm 2: xor  <z3=%r13,<y3=%rax
xor  %r13,%rax

# qhasm:   leak0 = y0 
# asm 1: mov  <y0=int64#14,>leak0=int64#1
# asm 2: mov  <y0=%rbx,>leak0=%rdi
mov  %rbx,%rdi

# qhasm:   (uint32) leak0 &= 0xff00ff
# asm 1: and  $0xff00ff,<leak0=int64#1d
# asm 2: and  $0xff00ff,<leak0=%edi
and  $0xff00ff,%edi

# qhasm:   (uint32) leak0 <<<= 24
# asm 1: rol  $24,<leak0=int64#1d
# asm 2: rol  $24,<leak0=%edi
rol  $24,%edi

# qhasm:   leak1 = y2
# asm 1: mov  <y2=int64#4,>leak1=int64#10
# asm 2: mov  <y2=%rcx,>leak1=%r12
mov  %rcx,%r12

# qhasm:   (uint32) leak1 &= 0xff00ff
# asm 1: and  $0xff00ff,<leak1=int64#10d
# asm 2: and  $0xff00ff,<leak1=%r12d
and  $0xff00ff,%r12d

# qhasm:   (uint32) leak1 <<<= 16
# asm 1: rol  $16,<leak1=int64#10d
# asm 2: rol  $16,<leak1=%r12d
rol  $16,%r12d

# qhasm:   leak0 ^= leak1
# asm 1: xor  <leak1=int64#10,<leak0=int64#1
# asm 2: xor  <leak1=%r12,<leak0=%rdi
xor  %r12,%rdi

# qhasm:   (uint32) leak0 ^= *(uint32 *) (in + 16)
# asm 1: xorl 16(<in=int64#6),<leak0=int64#1d
# asm 2: xorl 16(<in=%r9),<leak0=%edi
xorl 16(%r9),%edi

# qhasm:   *(uint32 *) (out + 16) = leak0
# asm 1: movl   <leak0=int64#1d,16(<out=int64#8)
# asm 2: movl   <leak0=%edi,16(<out=%r10)
movl   %edi,16(%r10)

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#1,8),>z0=int64#10d
# asm 2: movl   3(<table=%r11,<p00=%rdi,8),>z0=%r12d
movl   3(%r11,%rdi,8),%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#9,<p03=int64#1,8),>z3=int64#11d
# asm 2: movl   2(<table=%r11,<p03=%rdi,8),>z3=%r13d
movl   2(%r11,%rdi,8),%r13d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#1,8),>z2=int64#12d
# asm 2: movl   1(<table=%r11,<p02=%rdi,8),>z2=%r14d
movl   1(%r11,%rdi,8),%r14d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#9,<p01=int64#1,8),>z1=int64#13d
# asm 2: movl   4(<table=%r11,<p01=%rdi,8),>z1=%r15d
movl   4(%r11,%rdi,8),%r15d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p10=int64#1d
# asm 2: movzbl  <y1=%dl,>p10=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#1,8),<z1=int64#13d
# asm 2: xorl 3(<table=%r11,<p10=%rdi,8),<z1=%r15d
xorl 3(%r11,%rdi,8),%r15d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%dh,>p11=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#1,8),<z0=int64#10d
# asm 2: xorl 2(<table=%r11,<p11=%rdi,8),<z0=%r12d
xorl 2(%r11,%rdi,8),%r12d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#3d
# asm 2: shr  $16,<y1=%edx
shr  $16,%edx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p12=int64#1d
# asm 2: movzbl  <y1=%dl,>p12=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#1,8),<z3=int64#11d
# asm 2: xorl 1(<table=%r11,<p12=%rdi,8),<z3=%r13d
xorl 1(%r11,%rdi,8),%r13d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%dh,>p13=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#1,8),<z2=int64#12d
# asm 2: xorl 4(<table=%r11,<p13=%rdi,8),<z2=%r14d
xorl 4(%r11,%rdi,8),%r14d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p20=int64#1d
# asm 2: movzbl  <y2=%cl,>p20=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#1,8),<z2=int64#12d
# asm 2: xorl 3(<table=%r11,<p20=%rdi,8),<z2=%r14d
xorl 3(%r11,%rdi,8),%r14d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%ch,>p21=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#1,8),<z1=int64#13d
# asm 2: xorl 2(<table=%r11,<p21=%rdi,8),<z1=%r15d
xorl 2(%r11,%rdi,8),%r15d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#4d
# asm 2: shr  $16,<y2=%ecx
shr  $16,%ecx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p22=int64#1d
# asm 2: movzbl  <y2=%cl,>p22=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#1,8),<z0=int64#10d
# asm 2: xorl 1(<table=%r11,<p22=%rdi,8),<z0=%r12d
xorl 1(%r11,%rdi,8),%r12d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%ch,>p23=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#1,8),<z3=int64#11d
# asm 2: xorl 4(<table=%r11,<p23=%rdi,8),<z3=%r13d
xorl 4(%r11,%rdi,8),%r13d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#1,8),<z3=int64#11d
# asm 2: xorl 3(<table=%r11,<p30=%rdi,8),<z3=%r13d
xorl 3(%r11,%rdi,8),%r13d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#1,8),<z2=int64#12d
# asm 2: xorl 2(<table=%r11,<p31=%rdi,8),<z2=%r14d
xorl 2(%r11,%rdi,8),%r14d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#1,8),<z1=int64#13d
# asm 2: xorl 1(<table=%r11,<p32=%rdi,8),<z1=%r15d
xorl 1(%r11,%rdi,8),%r15d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#1,8),<z0=int64#10d
# asm 2: xorl 4(<table=%r11,<p33=%rdi,8),<z0=%r12d
xorl 4(%r11,%rdi,8),%r12d

# qhasm:   y0 = r24
# asm 1: movq <r24=stack64#32,>y0=int64#14
# asm 2: movq <r24=408(%rsp),>y0=%rbx
movq 408(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#10,<y0=int64#14
# asm 2: xor  <z0=%r12,<y0=%rbx
xor  %r12,%rbx

# qhasm:   y1 = r25
# asm 1: movq <r25=stack64#33,>y1=int64#3
# asm 2: movq <r25=416(%rsp),>y1=%rdx
movq 416(%rsp),%rdx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#13,<y1=int64#3
# asm 2: xor  <z1=%r15,<y1=%rdx
xor  %r15,%rdx

# qhasm:   y2 = r26
# asm 1: movq <r26=stack64#34,>y2=int64#4
# asm 2: movq <r26=424(%rsp),>y2=%rcx
movq 424(%rsp),%rcx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#12,<y2=int64#4
# asm 2: xor  <z2=%r14,<y2=%rcx
xor  %r14,%rcx

# qhasm:   y3 = r27
# asm 1: movq <r27=stack64#35,>y3=int64#7
# asm 2: movq <r27=432(%rsp),>y3=%rax
movq 432(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#11,<y3=int64#7
# asm 2: xor  <z3=%r13,<y3=%rax
xor  %r13,%rax

# qhasm:   leak0 = y0 
# asm 1: mov  <y0=int64#14,>leak0=int64#1
# asm 2: mov  <y0=%rbx,>leak0=%rdi
mov  %rbx,%rdi

# qhasm:   (uint32) leak0 &= 0xff00ff00
# asm 1: and  $0xff00ff00,<leak0=int64#1d
# asm 2: and  $0xff00ff00,<leak0=%edi
and  $0xff00ff00,%edi

# qhasm:   (uint32) leak0 <<<= 16
# asm 1: rol  $16,<leak0=int64#1d
# asm 2: rol  $16,<leak0=%edi
rol  $16,%edi

# qhasm:   leak1 = y2
# asm 1: mov  <y2=int64#4,>leak1=int64#10
# asm 2: mov  <y2=%rcx,>leak1=%r12
mov  %rcx,%r12

# qhasm:   (uint32) leak1 &= 0xff00ff00
# asm 1: and  $0xff00ff00,<leak1=int64#10d
# asm 2: and  $0xff00ff00,<leak1=%r12d
and  $0xff00ff00,%r12d

# qhasm:   (uint32) leak1 <<<= 8
# asm 1: rol  $8,<leak1=int64#10d
# asm 2: rol  $8,<leak1=%r12d
rol  $8,%r12d

# qhasm:   leak0 ^= leak1
# asm 1: xor  <leak1=int64#10,<leak0=int64#1
# asm 2: xor  <leak1=%r12,<leak0=%rdi
xor  %r12,%rdi

# qhasm:   (uint32) leak0 ^= *(uint32 *) (in + 20)
# asm 1: xorl 20(<in=int64#6),<leak0=int64#1d
# asm 2: xorl 20(<in=%r9),<leak0=%edi
xorl 20(%r9),%edi

# qhasm:   *(uint32 *) (out + 20) = leak0
# asm 1: movl   <leak0=int64#1d,20(<out=int64#8)
# asm 2: movl   <leak0=%edi,20(<out=%r10)
movl   %edi,20(%r10)

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#1,8),>z0=int64#10d
# asm 2: movl   3(<table=%r11,<p00=%rdi,8),>z0=%r12d
movl   3(%r11,%rdi,8),%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#9,<p03=int64#1,8),>z3=int64#11d
# asm 2: movl   2(<table=%r11,<p03=%rdi,8),>z3=%r13d
movl   2(%r11,%rdi,8),%r13d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#1,8),>z2=int64#12d
# asm 2: movl   1(<table=%r11,<p02=%rdi,8),>z2=%r14d
movl   1(%r11,%rdi,8),%r14d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#9,<p01=int64#1,8),>z1=int64#13d
# asm 2: movl   4(<table=%r11,<p01=%rdi,8),>z1=%r15d
movl   4(%r11,%rdi,8),%r15d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p10=int64#1d
# asm 2: movzbl  <y1=%dl,>p10=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#1,8),<z1=int64#13d
# asm 2: xorl 3(<table=%r11,<p10=%rdi,8),<z1=%r15d
xorl 3(%r11,%rdi,8),%r15d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%dh,>p11=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#1,8),<z0=int64#10d
# asm 2: xorl 2(<table=%r11,<p11=%rdi,8),<z0=%r12d
xorl 2(%r11,%rdi,8),%r12d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#3d
# asm 2: shr  $16,<y1=%edx
shr  $16,%edx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p12=int64#1d
# asm 2: movzbl  <y1=%dl,>p12=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#1,8),<z3=int64#11d
# asm 2: xorl 1(<table=%r11,<p12=%rdi,8),<z3=%r13d
xorl 1(%r11,%rdi,8),%r13d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%dh,>p13=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#1,8),<z2=int64#12d
# asm 2: xorl 4(<table=%r11,<p13=%rdi,8),<z2=%r14d
xorl 4(%r11,%rdi,8),%r14d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p20=int64#1d
# asm 2: movzbl  <y2=%cl,>p20=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#1,8),<z2=int64#12d
# asm 2: xorl 3(<table=%r11,<p20=%rdi,8),<z2=%r14d
xorl 3(%r11,%rdi,8),%r14d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%ch,>p21=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#1,8),<z1=int64#13d
# asm 2: xorl 2(<table=%r11,<p21=%rdi,8),<z1=%r15d
xorl 2(%r11,%rdi,8),%r15d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#4d
# asm 2: shr  $16,<y2=%ecx
shr  $16,%ecx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p22=int64#1d
# asm 2: movzbl  <y2=%cl,>p22=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#1,8),<z0=int64#10d
# asm 2: xorl 1(<table=%r11,<p22=%rdi,8),<z0=%r12d
xorl 1(%r11,%rdi,8),%r12d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%ch,>p23=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#1,8),<z3=int64#11d
# asm 2: xorl 4(<table=%r11,<p23=%rdi,8),<z3=%r13d
xorl 4(%r11,%rdi,8),%r13d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#1,8),<z3=int64#11d
# asm 2: xorl 3(<table=%r11,<p30=%rdi,8),<z3=%r13d
xorl 3(%r11,%rdi,8),%r13d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#1,8),<z2=int64#12d
# asm 2: xorl 2(<table=%r11,<p31=%rdi,8),<z2=%r14d
xorl 2(%r11,%rdi,8),%r14d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#1,8),<z1=int64#13d
# asm 2: xorl 1(<table=%r11,<p32=%rdi,8),<z1=%r15d
xorl 1(%r11,%rdi,8),%r15d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#1,8),<z0=int64#10d
# asm 2: xorl 4(<table=%r11,<p33=%rdi,8),<z0=%r12d
xorl 4(%r11,%rdi,8),%r12d

# qhasm:   y0 = r28
# asm 1: movq <r28=stack64#36,>y0=int64#14
# asm 2: movq <r28=440(%rsp),>y0=%rbx
movq 440(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#10,<y0=int64#14
# asm 2: xor  <z0=%r12,<y0=%rbx
xor  %r12,%rbx

# qhasm:   y1 = r29
# asm 1: movq <r29=stack64#37,>y1=int64#3
# asm 2: movq <r29=448(%rsp),>y1=%rdx
movq 448(%rsp),%rdx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#13,<y1=int64#3
# asm 2: xor  <z1=%r15,<y1=%rdx
xor  %r15,%rdx

# qhasm:   y2 = r30
# asm 1: movq <r30=stack64#38,>y2=int64#4
# asm 2: movq <r30=456(%rsp),>y2=%rcx
movq 456(%rsp),%rcx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#12,<y2=int64#4
# asm 2: xor  <z2=%r14,<y2=%rcx
xor  %r14,%rcx

# qhasm:   y3 = r31
# asm 1: movq <r31=stack64#39,>y3=int64#7
# asm 2: movq <r31=464(%rsp),>y3=%rax
movq 464(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#11,<y3=int64#7
# asm 2: xor  <z3=%r13,<y3=%rax
xor  %r13,%rax

# qhasm:   leak0 = y0 
# asm 1: mov  <y0=int64#14,>leak0=int64#1
# asm 2: mov  <y0=%rbx,>leak0=%rdi
mov  %rbx,%rdi

# qhasm:   (uint32) leak0 &= 0xff00ff
# asm 1: and  $0xff00ff,<leak0=int64#1d
# asm 2: and  $0xff00ff,<leak0=%edi
and  $0xff00ff,%edi

# qhasm:   (uint32) leak0 <<<= 24
# asm 1: rol  $24,<leak0=int64#1d
# asm 2: rol  $24,<leak0=%edi
rol  $24,%edi

# qhasm:   leak1 = y2
# asm 1: mov  <y2=int64#4,>leak1=int64#10
# asm 2: mov  <y2=%rcx,>leak1=%r12
mov  %rcx,%r12

# qhasm:   (uint32) leak1 &= 0xff00ff
# asm 1: and  $0xff00ff,<leak1=int64#10d
# asm 2: and  $0xff00ff,<leak1=%r12d
and  $0xff00ff,%r12d

# qhasm:   (uint32) leak1 <<<= 16
# asm 1: rol  $16,<leak1=int64#10d
# asm 2: rol  $16,<leak1=%r12d
rol  $16,%r12d

# qhasm:   leak0 ^= leak1
# asm 1: xor  <leak1=int64#10,<leak0=int64#1
# asm 2: xor  <leak1=%r12,<leak0=%rdi
xor  %r12,%rdi

# qhasm:   (uint32) leak0 ^= *(uint32 *) (in + 24)
# asm 1: xorl 24(<in=int64#6),<leak0=int64#1d
# asm 2: xorl 24(<in=%r9),<leak0=%edi
xorl 24(%r9),%edi

# qhasm:   *(uint32 *) (out + 24) = leak0
# asm 1: movl   <leak0=int64#1d,24(<out=int64#8)
# asm 2: movl   <leak0=%edi,24(<out=%r10)
movl   %edi,24(%r10)

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#1,8),>z0=int64#10d
# asm 2: movl   3(<table=%r11,<p00=%rdi,8),>z0=%r12d
movl   3(%r11,%rdi,8),%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#9,<p03=int64#1,8),>z3=int64#11d
# asm 2: movl   2(<table=%r11,<p03=%rdi,8),>z3=%r13d
movl   2(%r11,%rdi,8),%r13d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#1,8),>z2=int64#12d
# asm 2: movl   1(<table=%r11,<p02=%rdi,8),>z2=%r14d
movl   1(%r11,%rdi,8),%r14d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#9,<p01=int64#1,8),>z1=int64#13d
# asm 2: movl   4(<table=%r11,<p01=%rdi,8),>z1=%r15d
movl   4(%r11,%rdi,8),%r15d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p10=int64#1d
# asm 2: movzbl  <y1=%dl,>p10=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#1,8),<z1=int64#13d
# asm 2: xorl 3(<table=%r11,<p10=%rdi,8),<z1=%r15d
xorl 3(%r11,%rdi,8),%r15d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%dh,>p11=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#1,8),<z0=int64#10d
# asm 2: xorl 2(<table=%r11,<p11=%rdi,8),<z0=%r12d
xorl 2(%r11,%rdi,8),%r12d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#3d
# asm 2: shr  $16,<y1=%edx
shr  $16,%edx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p12=int64#1d
# asm 2: movzbl  <y1=%dl,>p12=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#1,8),<z3=int64#11d
# asm 2: xorl 1(<table=%r11,<p12=%rdi,8),<z3=%r13d
xorl 1(%r11,%rdi,8),%r13d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%dh,>p13=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#1,8),<z2=int64#12d
# asm 2: xorl 4(<table=%r11,<p13=%rdi,8),<z2=%r14d
xorl 4(%r11,%rdi,8),%r14d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p20=int64#1d
# asm 2: movzbl  <y2=%cl,>p20=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#1,8),<z2=int64#12d
# asm 2: xorl 3(<table=%r11,<p20=%rdi,8),<z2=%r14d
xorl 3(%r11,%rdi,8),%r14d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%ch,>p21=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#1,8),<z1=int64#13d
# asm 2: xorl 2(<table=%r11,<p21=%rdi,8),<z1=%r15d
xorl 2(%r11,%rdi,8),%r15d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#4d
# asm 2: shr  $16,<y2=%ecx
shr  $16,%ecx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p22=int64#1d
# asm 2: movzbl  <y2=%cl,>p22=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#1,8),<z0=int64#10d
# asm 2: xorl 1(<table=%r11,<p22=%rdi,8),<z0=%r12d
xorl 1(%r11,%rdi,8),%r12d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%ch,>p23=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#1,8),<z3=int64#11d
# asm 2: xorl 4(<table=%r11,<p23=%rdi,8),<z3=%r13d
xorl 4(%r11,%rdi,8),%r13d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#1,8),<z3=int64#11d
# asm 2: xorl 3(<table=%r11,<p30=%rdi,8),<z3=%r13d
xorl 3(%r11,%rdi,8),%r13d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#1,8),<z2=int64#12d
# asm 2: xorl 2(<table=%r11,<p31=%rdi,8),<z2=%r14d
xorl 2(%r11,%rdi,8),%r14d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#1,8),<z1=int64#13d
# asm 2: xorl 1(<table=%r11,<p32=%rdi,8),<z1=%r15d
xorl 1(%r11,%rdi,8),%r15d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#1,8),<z0=int64#10d
# asm 2: xorl 4(<table=%r11,<p33=%rdi,8),<z0=%r12d
xorl 4(%r11,%rdi,8),%r12d

# qhasm:   y0 = r32
# asm 1: movq <r32=stack64#40,>y0=int64#14
# asm 2: movq <r32=472(%rsp),>y0=%rbx
movq 472(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#10,<y0=int64#14
# asm 2: xor  <z0=%r12,<y0=%rbx
xor  %r12,%rbx

# qhasm:   y1 = r33
# asm 1: movq <r33=stack64#41,>y1=int64#3
# asm 2: movq <r33=480(%rsp),>y1=%rdx
movq 480(%rsp),%rdx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#13,<y1=int64#3
# asm 2: xor  <z1=%r15,<y1=%rdx
xor  %r15,%rdx

# qhasm:   y2 = r34
# asm 1: movq <r34=stack64#42,>y2=int64#4
# asm 2: movq <r34=488(%rsp),>y2=%rcx
movq 488(%rsp),%rcx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#12,<y2=int64#4
# asm 2: xor  <z2=%r14,<y2=%rcx
xor  %r14,%rcx

# qhasm:   y3 = r35
# asm 1: movq <r35=stack64#43,>y3=int64#7
# asm 2: movq <r35=496(%rsp),>y3=%rax
movq 496(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#11,<y3=int64#7
# asm 2: xor  <z3=%r13,<y3=%rax
xor  %r13,%rax

# qhasm:   leak0 = y0 
# asm 1: mov  <y0=int64#14,>leak0=int64#1
# asm 2: mov  <y0=%rbx,>leak0=%rdi
mov  %rbx,%rdi

# qhasm:   (uint32) leak0 &= 0xff00ff00
# asm 1: and  $0xff00ff00,<leak0=int64#1d
# asm 2: and  $0xff00ff00,<leak0=%edi
and  $0xff00ff00,%edi

# qhasm:   (uint32) leak0 <<<= 16
# asm 1: rol  $16,<leak0=int64#1d
# asm 2: rol  $16,<leak0=%edi
rol  $16,%edi

# qhasm:   leak1 = y2
# asm 1: mov  <y2=int64#4,>leak1=int64#10
# asm 2: mov  <y2=%rcx,>leak1=%r12
mov  %rcx,%r12

# qhasm:   (uint32) leak1 &= 0xff00ff00
# asm 1: and  $0xff00ff00,<leak1=int64#10d
# asm 2: and  $0xff00ff00,<leak1=%r12d
and  $0xff00ff00,%r12d

# qhasm:   (uint32) leak1 <<<= 8
# asm 1: rol  $8,<leak1=int64#10d
# asm 2: rol  $8,<leak1=%r12d
rol  $8,%r12d

# qhasm:   leak0 ^= leak1
# asm 1: xor  <leak1=int64#10,<leak0=int64#1
# asm 2: xor  <leak1=%r12,<leak0=%rdi
xor  %r12,%rdi

# qhasm:   (uint32) leak0 ^= *(uint32 *) (in + 28)
# asm 1: xorl 28(<in=int64#6),<leak0=int64#1d
# asm 2: xorl 28(<in=%r9),<leak0=%edi
xorl 28(%r9),%edi

# qhasm:   *(uint32 *) (out + 28) = leak0
# asm 1: movl   <leak0=int64#1d,28(<out=int64#8)
# asm 2: movl   <leak0=%edi,28(<out=%r10)
movl   %edi,28(%r10)

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#1,8),>z0=int64#10d
# asm 2: movl   3(<table=%r11,<p00=%rdi,8),>z0=%r12d
movl   3(%r11,%rdi,8),%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#9,<p03=int64#1,8),>z3=int64#11d
# asm 2: movl   2(<table=%r11,<p03=%rdi,8),>z3=%r13d
movl   2(%r11,%rdi,8),%r13d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#1,8),>z2=int64#12d
# asm 2: movl   1(<table=%r11,<p02=%rdi,8),>z2=%r14d
movl   1(%r11,%rdi,8),%r14d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#9,<p01=int64#1,8),>z1=int64#13d
# asm 2: movl   4(<table=%r11,<p01=%rdi,8),>z1=%r15d
movl   4(%r11,%rdi,8),%r15d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p10=int64#1d
# asm 2: movzbl  <y1=%dl,>p10=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#1,8),<z1=int64#13d
# asm 2: xorl 3(<table=%r11,<p10=%rdi,8),<z1=%r15d
xorl 3(%r11,%rdi,8),%r15d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%dh,>p11=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#1,8),<z0=int64#10d
# asm 2: xorl 2(<table=%r11,<p11=%rdi,8),<z0=%r12d
xorl 2(%r11,%rdi,8),%r12d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#3d
# asm 2: shr  $16,<y1=%edx
shr  $16,%edx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p12=int64#1d
# asm 2: movzbl  <y1=%dl,>p12=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#1,8),<z3=int64#11d
# asm 2: xorl 1(<table=%r11,<p12=%rdi,8),<z3=%r13d
xorl 1(%r11,%rdi,8),%r13d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%dh,>p13=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#1,8),<z2=int64#12d
# asm 2: xorl 4(<table=%r11,<p13=%rdi,8),<z2=%r14d
xorl 4(%r11,%rdi,8),%r14d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p20=int64#1d
# asm 2: movzbl  <y2=%cl,>p20=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#1,8),<z2=int64#12d
# asm 2: xorl 3(<table=%r11,<p20=%rdi,8),<z2=%r14d
xorl 3(%r11,%rdi,8),%r14d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%ch,>p21=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#1,8),<z1=int64#13d
# asm 2: xorl 2(<table=%r11,<p21=%rdi,8),<z1=%r15d
xorl 2(%r11,%rdi,8),%r15d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#4d
# asm 2: shr  $16,<y2=%ecx
shr  $16,%ecx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p22=int64#1d
# asm 2: movzbl  <y2=%cl,>p22=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#1,8),<z0=int64#10d
# asm 2: xorl 1(<table=%r11,<p22=%rdi,8),<z0=%r12d
xorl 1(%r11,%rdi,8),%r12d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%ch,>p23=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#1,8),<z3=int64#11d
# asm 2: xorl 4(<table=%r11,<p23=%rdi,8),<z3=%r13d
xorl 4(%r11,%rdi,8),%r13d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#1,8),<z3=int64#11d
# asm 2: xorl 3(<table=%r11,<p30=%rdi,8),<z3=%r13d
xorl 3(%r11,%rdi,8),%r13d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#1,8),<z2=int64#12d
# asm 2: xorl 2(<table=%r11,<p31=%rdi,8),<z2=%r14d
xorl 2(%r11,%rdi,8),%r14d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#1,8),<z1=int64#13d
# asm 2: xorl 1(<table=%r11,<p32=%rdi,8),<z1=%r15d
xorl 1(%r11,%rdi,8),%r15d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#1,8),<z0=int64#10d
# asm 2: xorl 4(<table=%r11,<p33=%rdi,8),<z0=%r12d
xorl 4(%r11,%rdi,8),%r12d

# qhasm:   y0 = r36
# asm 1: movq <r36=stack64#44,>y0=int64#14
# asm 2: movq <r36=504(%rsp),>y0=%rbx
movq 504(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#10,<y0=int64#14
# asm 2: xor  <z0=%r12,<y0=%rbx
xor  %r12,%rbx

# qhasm:   y1 = r37
# asm 1: movq <r37=stack64#45,>y1=int64#3
# asm 2: movq <r37=512(%rsp),>y1=%rdx
movq 512(%rsp),%rdx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#13,<y1=int64#3
# asm 2: xor  <z1=%r15,<y1=%rdx
xor  %r15,%rdx

# qhasm:   y2 = r38
# asm 1: movq <r38=stack64#46,>y2=int64#4
# asm 2: movq <r38=520(%rsp),>y2=%rcx
movq 520(%rsp),%rcx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#12,<y2=int64#4
# asm 2: xor  <z2=%r14,<y2=%rcx
xor  %r14,%rcx

# qhasm:   y3 = r39
# asm 1: movq <r39=stack64#47,>y3=int64#7
# asm 2: movq <r39=528(%rsp),>y3=%rax
movq 528(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#11,<y3=int64#7
# asm 2: xor  <z3=%r13,<y3=%rax
xor  %r13,%rax

# qhasm:   leak0 = y0 
# asm 1: mov  <y0=int64#14,>leak0=int64#1
# asm 2: mov  <y0=%rbx,>leak0=%rdi
mov  %rbx,%rdi

# qhasm:   (uint32) leak0 &= 0xff00ff
# asm 1: and  $0xff00ff,<leak0=int64#1d
# asm 2: and  $0xff00ff,<leak0=%edi
and  $0xff00ff,%edi

# qhasm:   (uint32) leak0 <<<= 24
# asm 1: rol  $24,<leak0=int64#1d
# asm 2: rol  $24,<leak0=%edi
rol  $24,%edi

# qhasm:   leak1 = y2
# asm 1: mov  <y2=int64#4,>leak1=int64#10
# asm 2: mov  <y2=%rcx,>leak1=%r12
mov  %rcx,%r12

# qhasm:   (uint32) leak1 &= 0xff00ff
# asm 1: and  $0xff00ff,<leak1=int64#10d
# asm 2: and  $0xff00ff,<leak1=%r12d
and  $0xff00ff,%r12d

# qhasm:   (uint32) leak1 <<<= 16
# asm 1: rol  $16,<leak1=int64#10d
# asm 2: rol  $16,<leak1=%r12d
rol  $16,%r12d

# qhasm:   leak0 ^= leak1
# asm 1: xor  <leak1=int64#10,<leak0=int64#1
# asm 2: xor  <leak1=%r12,<leak0=%rdi
xor  %r12,%rdi

# qhasm:   (uint32) leak0 ^= *(uint32 *) (in + 32)
# asm 1: xorl 32(<in=int64#6),<leak0=int64#1d
# asm 2: xorl 32(<in=%r9),<leak0=%edi
xorl 32(%r9),%edi

# qhasm:   *(uint32 *) (out + 32) = leak0
# asm 1: movl   <leak0=int64#1d,32(<out=int64#8)
# asm 2: movl   <leak0=%edi,32(<out=%r10)
movl   %edi,32(%r10)

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#1,8),>z0=int64#10d
# asm 2: movl   3(<table=%r11,<p00=%rdi,8),>z0=%r12d
movl   3(%r11,%rdi,8),%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#9,<p03=int64#1,8),>z3=int64#11d
# asm 2: movl   2(<table=%r11,<p03=%rdi,8),>z3=%r13d
movl   2(%r11,%rdi,8),%r13d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#1,8),>z2=int64#12d
# asm 2: movl   1(<table=%r11,<p02=%rdi,8),>z2=%r14d
movl   1(%r11,%rdi,8),%r14d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#9,<p01=int64#1,8),>z1=int64#13d
# asm 2: movl   4(<table=%r11,<p01=%rdi,8),>z1=%r15d
movl   4(%r11,%rdi,8),%r15d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p10=int64#1d
# asm 2: movzbl  <y1=%dl,>p10=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#1,8),<z1=int64#13d
# asm 2: xorl 3(<table=%r11,<p10=%rdi,8),<z1=%r15d
xorl 3(%r11,%rdi,8),%r15d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%dh,>p11=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#1,8),<z0=int64#10d
# asm 2: xorl 2(<table=%r11,<p11=%rdi,8),<z0=%r12d
xorl 2(%r11,%rdi,8),%r12d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#3d
# asm 2: shr  $16,<y1=%edx
shr  $16,%edx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#3b,>p12=int64#1d
# asm 2: movzbl  <y1=%dl,>p12=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#1,8),<z3=int64#11d
# asm 2: xorl 1(<table=%r11,<p12=%rdi,8),<z3=%r13d
xorl 1(%r11,%rdi,8),%r13d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#3%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%dh,>p13=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#1,8),<z2=int64#12d
# asm 2: xorl 4(<table=%r11,<p13=%rdi,8),<z2=%r14d
xorl 4(%r11,%rdi,8),%r14d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p20=int64#1d
# asm 2: movzbl  <y2=%cl,>p20=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#1,8),<z2=int64#12d
# asm 2: xorl 3(<table=%r11,<p20=%rdi,8),<z2=%r14d
xorl 3(%r11,%rdi,8),%r14d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%ch,>p21=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#1,8),<z1=int64#13d
# asm 2: xorl 2(<table=%r11,<p21=%rdi,8),<z1=%r15d
xorl 2(%r11,%rdi,8),%r15d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#4d
# asm 2: shr  $16,<y2=%ecx
shr  $16,%ecx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#4b,>p22=int64#1d
# asm 2: movzbl  <y2=%cl,>p22=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#1,8),<z0=int64#10d
# asm 2: xorl 1(<table=%r11,<p22=%rdi,8),<z0=%r12d
xorl 1(%r11,%rdi,8),%r12d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#4%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%ch,>p23=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#1,8),<z3=int64#11d
# asm 2: xorl 4(<table=%r11,<p23=%rdi,8),<z3=%r13d
xorl 4(%r11,%rdi,8),%r13d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#1,8),<z3=int64#11d
# asm 2: xorl 3(<table=%r11,<p30=%rdi,8),<z3=%r13d
xorl 3(%r11,%rdi,8),%r13d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#1,8),<z2=int64#12d
# asm 2: xorl 2(<table=%r11,<p31=%rdi,8),<z2=%r14d
xorl 2(%r11,%rdi,8),%r14d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#1,8),<z1=int64#13d
# asm 2: xorl 1(<table=%r11,<p32=%rdi,8),<z1=%r15d
xorl 1(%r11,%rdi,8),%r15d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#1,8),<z0=int64#10d
# asm 2: xorl 4(<table=%r11,<p33=%rdi,8),<z0=%r12d
xorl 4(%r11,%rdi,8),%r12d

# qhasm:   y0 = r40
# asm 1: movq <r40=stack64#48,>y0=int64#14
# asm 2: movq <r40=536(%rsp),>y0=%rbx
movq 536(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#10,<y0=int64#14
# asm 2: xor  <z0=%r12,<y0=%rbx
xor  %r12,%rbx

# qhasm:   y1 = r41
# asm 1: movq <r41=stack64#49,>y1=int64#3
# asm 2: movq <r41=544(%rsp),>y1=%rdx
movq 544(%rsp),%rdx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#13,<y1=int64#3
# asm 2: xor  <z1=%r15,<y1=%rdx
xor  %r15,%rdx

# qhasm:   y2 = r42
# asm 1: movq <r42=stack64#50,>y2=int64#4
# asm 2: movq <r42=552(%rsp),>y2=%rcx
movq 552(%rsp),%rcx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#12,<y2=int64#4
# asm 2: xor  <z2=%r14,<y2=%rcx
xor  %r14,%rcx

# qhasm:   y3 = r43
# asm 1: movq <r43=stack64#51,>y3=int64#7
# asm 2: movq <r43=560(%rsp),>y3=%rax
movq 560(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#11,<y3=int64#7
# asm 2: xor  <z3=%r13,<y3=%rax
xor  %r13,%rax

# qhasm:   leak0 = y0 
# asm 1: mov  <y0=int64#14,>leak0=int64#1
# asm 2: mov  <y0=%rbx,>leak0=%rdi
mov  %rbx,%rdi

# qhasm:   (uint32) leak0 &= 0xff00ff00
# asm 1: and  $0xff00ff00,<leak0=int64#1d
# asm 2: and  $0xff00ff00,<leak0=%edi
and  $0xff00ff00,%edi

# qhasm:   (uint32) leak0 <<<= 16
# asm 1: rol  $16,<leak0=int64#1d
# asm 2: rol  $16,<leak0=%edi
rol  $16,%edi

# qhasm:   leak1 = y2
# asm 1: mov  <y2=int64#4,>leak1=int64#10
# asm 2: mov  <y2=%rcx,>leak1=%r12
mov  %rcx,%r12

# qhasm:   (uint32) leak1 &= 0xff00ff00
# asm 1: and  $0xff00ff00,<leak1=int64#10d
# asm 2: and  $0xff00ff00,<leak1=%r12d
and  $0xff00ff00,%r12d

# qhasm:   (uint32) leak1 <<<= 8
# asm 1: rol  $8,<leak1=int64#10d
# asm 2: rol  $8,<leak1=%r12d
rol  $8,%r12d

# qhasm:   leak0 ^= leak1
# asm 1: xor  <leak1=int64#10,<leak0=int64#1
# asm 2: xor  <leak1=%r12,<leak0=%rdi
xor  %r12,%rdi

# qhasm:   (uint32) leak0 ^= *(uint32 *) (in + 36)
# asm 1: xorl 36(<in=int64#6),<leak0=int64#1d
# asm 2: xorl 36(<in=%r9),<leak0=%edi
xorl 36(%r9),%edi

# qhasm:   *(uint32 *) (out + 36) = leak0
# asm 1: movl   <leak0=int64#1d,36(<out=int64#8)
# asm 2: movl   <leak0=%edi,36(<out=%r10)
movl   %edi,36(%r10)

# qhasm:   in += 40
# asm 1: add  $40,<in=int64#6
# asm 2: add  $40,<in=%r9
add  $40,%r9

# qhasm:   out += 40
# asm 1: add  $40,<out=int64#8
# asm 2: add  $40,<out=%r10
add  $40,%r10

# qhasm:   len -= 40
# asm 1: sub  $40,<len=int64#5
# asm 2: sub  $40,<len=%r8
sub  $40,%r8

# qhasm:   signed<? len - 40
# asm 1: cmp  $40,<len=int64#5
# asm 2: cmp  $40,<len=%r8
cmp  $40,%r8
# comment:fp stack unchanged by jump

# qhasm: goto mainloop if !signed< 
jge ._mainloop
# comment:fp stack unchanged by fallthrough

# qhasm: lessthan40bytesleft:
._lessthan40bytesleft:

# qhasm: =? signed<? len - 0
# asm 1: cmp  $0,<len=int64#5
# asm 2: cmp  $0,<len=%r8
cmp  $0,%r8
# comment:fp stack unchanged by jump

# qhasm: goto done if =
je ._done
# comment:fp stack unchanged by jump

# qhasm: goto copy if signed<
jl ._copy

# qhasm: in_stack = in
# asm 1: movq <in=int64#6,>in_stack=stack64#8
# asm 2: movq <in=%r9,>in_stack=216(%rsp)
movq %r9,216(%rsp)

# qhasm: out_stack = out
# asm 1: movq <out=int64#8,>out_stack=stack64#10
# asm 2: movq <out=%r10,>out_stack=232(%rsp)
movq %r10,232(%rsp)

# qhasm: len_stack = len
# asm 1: movq <len=int64#5,>len_stack=stack64#9
# asm 2: movq <len=%r8,>len_stack=224(%rsp)
movq %r8,224(%rsp)

# qhasm: tmp0 = 0
# asm 1: mov  $0,>tmp0=int64#1
# asm 2: mov  $0,>tmp0=%rdi
mov  $0,%rdi

# qhasm: in = &stream
# asm 1: leaq <stream=stack320#1,>in=int64#6
# asm 2: leaq <stream=0(%rsp),>in=%r9
leaq 0(%rsp),%r9

# qhasm: *(uint64 *) (in + 0) = tmp0
# asm 1: movq   <tmp0=int64#1,0(<in=int64#6)
# asm 2: movq   <tmp0=%rdi,0(<in=%r9)
movq   %rdi,0(%r9)

# qhasm: *(uint64 *) (in + 8) = tmp0
# asm 1: movq   <tmp0=int64#1,8(<in=int64#6)
# asm 2: movq   <tmp0=%rdi,8(<in=%r9)
movq   %rdi,8(%r9)

# qhasm: *(uint64 *) (in + 16) = tmp0
# asm 1: movq   <tmp0=int64#1,16(<in=int64#6)
# asm 2: movq   <tmp0=%rdi,16(<in=%r9)
movq   %rdi,16(%r9)

# qhasm: *(uint64 *) (in + 24) = tmp0
# asm 1: movq   <tmp0=int64#1,24(<in=int64#6)
# asm 2: movq   <tmp0=%rdi,24(<in=%r9)
movq   %rdi,24(%r9)

# qhasm: *(uint64 *) (in + 32) = tmp0
# asm 1: movq   <tmp0=int64#1,32(<in=int64#6)
# asm 2: movq   <tmp0=%rdi,32(<in=%r9)
movq   %rdi,32(%r9)

# qhasm: out = in
# asm 1: mov  <in=int64#6,>out=int64#8
# asm 2: mov  <in=%r9,>out=%r10
mov  %r9,%r10
# comment:fp stack unchanged by jump

# qhasm: goto mainloop
jmp ._mainloop

# qhasm: copy:
._copy:

# qhasm: in = in_stack
# asm 1: movq <in_stack=stack64#8,>in=int64#1
# asm 2: movq <in_stack=216(%rsp),>in=%rdi
movq 216(%rsp),%rdi

# qhasm: out = out_stack
# asm 1: movq <out_stack=stack64#10,>out=int64#5
# asm 2: movq <out_stack=232(%rsp),>out=%r8
movq 232(%rsp),%r8

# qhasm: len = len_stack
# asm 1: movq <len_stack=stack64#9,>len=int64#6
# asm 2: movq <len_stack=224(%rsp),>len=%r9
movq 224(%rsp),%r9

# qhasm: streamp = &stream
# asm 1: leaq <stream=stack320#1,>streamp=int64#8
# asm 2: leaq <stream=0(%rsp),>streamp=%r10
leaq 0(%rsp),%r10

# qhasm: copyloop:
._copyloop:

# qhasm: unsigned<? len - 1
# asm 1: cmp  $1,<len=int64#6
# asm 2: cmp  $1,<len=%r9
cmp  $1,%r9
# comment:fp stack unchanged by jump

# qhasm: goto done if unsigned<
jb ._done

# qhasm: tmp0 = *(uint8 *) (streamp + 0)
# asm 1: movzbq 0(<streamp=int64#8),>tmp0=int64#9
# asm 2: movzbq 0(<streamp=%r10),>tmp0=%r11
movzbq 0(%r10),%r11

# qhasm: tmp1 = *(uint8 *) (in + 0)
# asm 1: movzbq 0(<in=int64#1),>tmp1=int64#10
# asm 2: movzbq 0(<in=%rdi),>tmp1=%r12
movzbq 0(%rdi),%r12

# qhasm: tmp0 ^= tmp1
# asm 1: xor  <tmp1=int64#10,<tmp0=int64#9
# asm 2: xor  <tmp1=%r12,<tmp0=%r11
xor  %r12,%r11

# qhasm: *(uint8 *) (out + 0) = tmp0
# asm 1: movb   <tmp0=int64#9b,0(<out=int64#5)
# asm 2: movb   <tmp0=%r11b,0(<out=%r8)
movb   %r11b,0(%r8)

# qhasm: len -= 1
# asm 1: sub  $1,<len=int64#6
# asm 2: sub  $1,<len=%r9
sub  $1,%r9

# qhasm: in += 1
# asm 1: add  $1,<in=int64#1
# asm 2: add  $1,<in=%rdi
add  $1,%rdi

# qhasm: out += 1
# asm 1: add  $1,<out=int64#5
# asm 2: add  $1,<out=%r8
add  $1,%r8

# qhasm: streamp += 1
# asm 1: add  $1,<streamp=int64#8
# asm 2: add  $1,<streamp=%r10
add  $1,%r10
# comment:fp stack unchanged by jump

# qhasm: goto copyloop
jmp ._copyloop

# qhasm: done:
._done:

# qhasm: *(uint32 *) (c + 56) = y0
# asm 1: movl   <y0=int64#14d,56(<c=int64#2)
# asm 2: movl   <y0=%ebx,56(<c=%rsi)
movl   %ebx,56(%rsi)

# qhasm: *(uint32 *) (c + 60) = y1
# asm 1: movl   <y1=int64#3d,60(<c=int64#2)
# asm 2: movl   <y1=%edx,60(<c=%rsi)
movl   %edx,60(%rsi)

# qhasm: *(uint32 *) (c + 64) = y2
# asm 1: movl   <y2=int64#4d,64(<c=int64#2)
# asm 2: movl   <y2=%ecx,64(<c=%rsi)
movl   %ecx,64(%rsi)

# qhasm: *(uint32 *) (c + 68) = y3
# asm 1: movl   <y3=int64#7d,68(<c=int64#2)
# asm 2: movl   <y3=%eax,68(<c=%rsi)
movl   %eax,68(%rsi)
# comment:fp stack unchanged by fallthrough

# qhasm: nothingtodo:
._nothingtodo:

# qhasm: r11_caller = r11_stack
# asm 1: movq <r11_stack=stack64#1,>r11_caller=int64#9
# asm 2: movq <r11_stack=160(%rsp),>r11_caller=%r11
movq 160(%rsp),%r11

# qhasm: r12_caller = r12_stack
# asm 1: movq <r12_stack=stack64#2,>r12_caller=int64#10
# asm 2: movq <r12_stack=168(%rsp),>r12_caller=%r12
movq 168(%rsp),%r12

# qhasm: r13_caller = r13_stack
# asm 1: movq <r13_stack=stack64#3,>r13_caller=int64#11
# asm 2: movq <r13_stack=176(%rsp),>r13_caller=%r13
movq 176(%rsp),%r13

# qhasm: r14_caller = r14_stack
# asm 1: movq <r14_stack=stack64#4,>r14_caller=int64#12
# asm 2: movq <r14_stack=184(%rsp),>r14_caller=%r14
movq 184(%rsp),%r14

# qhasm: r15_caller = r15_stack
# asm 1: movq <r15_stack=stack64#5,>r15_caller=int64#13
# asm 2: movq <r15_stack=192(%rsp),>r15_caller=%r15
movq 192(%rsp),%r15

# qhasm: rbx_caller = rbx_stack
# asm 1: movq <rbx_stack=stack64#6,>rbx_caller=int64#14
# asm 2: movq <rbx_stack=200(%rsp),>rbx_caller=%rbx
movq 200(%rsp),%rbx

# qhasm: rbp_caller = rbp_stack
# asm 1: movq <rbp_stack=stack64#7,>rbp_caller=int64#15
# asm 2: movq <rbp_stack=208(%rsp),>rbp_caller=%rbp
movq 208(%rsp),%rbp

# qhasm: leave
add %r11,%rsp
mov %rdi,%rax
mov %rsi,%rdx
ret
