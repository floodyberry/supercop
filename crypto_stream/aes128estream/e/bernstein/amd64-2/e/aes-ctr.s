
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

# qhasm: stack64 n0

# qhasm: stack64 n1

# qhasm: stack64 n2

# qhasm: stack64 n3

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

# qhasm: int64 q00

# qhasm: int64 q01

# qhasm: int64 q02

# qhasm: int64 q03

# qhasm: int64 q10

# qhasm: int64 q11

# qhasm: int64 q12

# qhasm: int64 q13

# qhasm: int64 q20

# qhasm: int64 q21

# qhasm: int64 q22

# qhasm: int64 q23

# qhasm: int64 q30

# qhasm: int64 q31

# qhasm: int64 q32

# qhasm: int64 q33

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
add $448,%r11
sub %r11,%rsp

# qhasm: leave
add %r11,%rsp
mov %rdi,%rax
mov %rsi,%rdx
ret

# qhasm: enter ECRYPT_ivsetup
.text
.p2align 5
.globl _ECRYPT_ivsetup
.globl ECRYPT_ivsetup
_ECRYPT_ivsetup:
ECRYPT_ivsetup:
mov %rsp,%r11
and $31,%r11
add $448,%r11
sub %r11,%rsp

# qhasm: c = arg1
# asm 1: mov  <arg1=int64#1,>c=int64#1
# asm 2: mov  <arg1=%rdi,>c=%rdi
mov  %rdi,%rdi

# qhasm: iv = arg2
# asm 1: mov  <arg2=int64#2,>iv=int64#2
# asm 2: mov  <arg2=%rsi,>iv=%rsi
mov  %rsi,%rsi

# qhasm: x0 = *(uint32 *) (iv + 0)
# asm 1: movl   0(<iv=int64#2),>x0=int64#6d
# asm 2: movl   0(<iv=%rsi),>x0=%r9d
movl   0(%rsi),%r9d

# qhasm: x1 = *(uint32 *) (iv + 4)
# asm 1: movl   4(<iv=int64#2),>x1=int64#7d
# asm 2: movl   4(<iv=%rsi),>x1=%eax
movl   4(%rsi),%eax

# qhasm: x2 = *(uint32 *) (iv + 8)
# asm 1: movl   8(<iv=int64#2),>x2=int64#8d
# asm 2: movl   8(<iv=%rsi),>x2=%r10d
movl   8(%rsi),%r10d

# qhasm: x3 = *(uint32 *) (iv + 12)
# asm 1: movl   12(<iv=int64#2),>x3=int64#2d
# asm 2: movl   12(<iv=%rsi),>x3=%esi
movl   12(%rsi),%esi

# qhasm: *(uint32 *) (c + 56) = x0
# asm 1: movl   <x0=int64#6d,56(<c=int64#1)
# asm 2: movl   <x0=%r9d,56(<c=%rdi)
movl   %r9d,56(%rdi)

# qhasm: *(uint32 *) (c + 60) = x1
# asm 1: movl   <x1=int64#7d,60(<c=int64#1)
# asm 2: movl   <x1=%eax,60(<c=%rdi)
movl   %eax,60(%rdi)

# qhasm: *(uint32 *) (c + 64) = x2
# asm 1: movl   <x2=int64#8d,64(<c=int64#1)
# asm 2: movl   <x2=%r10d,64(<c=%rdi)
movl   %r10d,64(%rdi)

# qhasm: *(uint32 *) (c + 68) = x3
# asm 1: movl   <x3=int64#2d,68(<c=int64#1)
# asm 2: movl   <x3=%esi,68(<c=%rdi)
movl   %esi,68(%rdi)

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
add $448,%r11
sub %r11,%rsp

# qhasm: r11_stack = r11_caller
# asm 1: movq <r11_caller=int64#9,>r11_stack=stack64#1
# asm 2: movq <r11_caller=%r11,>r11_stack=0(%rsp)
movq %r11,0(%rsp)

# qhasm: r12_stack = r12_caller
# asm 1: movq <r12_caller=int64#10,>r12_stack=stack64#2
# asm 2: movq <r12_caller=%r12,>r12_stack=8(%rsp)
movq %r12,8(%rsp)

# qhasm: r13_stack = r13_caller
# asm 1: movq <r13_caller=int64#11,>r13_stack=stack64#3
# asm 2: movq <r13_caller=%r13,>r13_stack=16(%rsp)
movq %r13,16(%rsp)

# qhasm: r14_stack = r14_caller
# asm 1: movq <r14_caller=int64#12,>r14_stack=stack64#4
# asm 2: movq <r14_caller=%r14,>r14_stack=24(%rsp)
movq %r14,24(%rsp)

# qhasm: r15_stack = r15_caller
# asm 1: movq <r15_caller=int64#13,>r15_stack=stack64#5
# asm 2: movq <r15_caller=%r15,>r15_stack=32(%rsp)
movq %r15,32(%rsp)

# qhasm: rbx_stack = rbx_caller
# asm 1: movq <rbx_caller=int64#14,>rbx_stack=stack64#6
# asm 2: movq <rbx_caller=%rbx,>rbx_stack=40(%rsp)
movq %rbx,40(%rsp)

# qhasm: rbp_stack = rbp_caller
# asm 1: movq <rbp_caller=int64#15,>rbp_stack=stack64#7
# asm 2: movq <rbp_caller=%rbp,>rbp_stack=48(%rsp)
movq %rbp,48(%rsp)

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
# asm 2: movq <r11_stack=0(%rsp),>r11_caller=%r11
movq 0(%rsp),%r11

# qhasm: r12_caller = r12_stack
# asm 1: movq <r12_stack=stack64#2,>r12_caller=int64#10
# asm 2: movq <r12_stack=8(%rsp),>r12_caller=%r12
movq 8(%rsp),%r12

# qhasm: r13_caller = r13_stack
# asm 1: movq <r13_stack=stack64#3,>r13_caller=int64#11
# asm 2: movq <r13_stack=16(%rsp),>r13_caller=%r13
movq 16(%rsp),%r13

# qhasm: r14_caller = r14_stack
# asm 1: movq <r14_stack=stack64#4,>r14_caller=int64#12
# asm 2: movq <r14_stack=24(%rsp),>r14_caller=%r14
movq 24(%rsp),%r14

# qhasm: r15_caller = r15_stack
# asm 1: movq <r15_stack=stack64#5,>r15_caller=int64#13
# asm 2: movq <r15_stack=32(%rsp),>r15_caller=%r15
movq 32(%rsp),%r15

# qhasm: rbx_caller = rbx_stack
# asm 1: movq <rbx_stack=stack64#6,>rbx_caller=int64#14
# asm 2: movq <rbx_stack=40(%rsp),>rbx_caller=%rbx
movq 40(%rsp),%rbx

# qhasm: rbp_caller = rbp_stack
# asm 1: movq <rbp_stack=stack64#7,>rbp_caller=int64#15
# asm 2: movq <rbp_stack=48(%rsp),>rbp_caller=%rbp
movq 48(%rsp),%rbp

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
add $448,%r11
sub %r11,%rsp

# qhasm: r11_stack = r11_caller
# asm 1: movq <r11_caller=int64#9,>r11_stack=stack64#1
# asm 2: movq <r11_caller=%r11,>r11_stack=0(%rsp)
movq %r11,0(%rsp)

# qhasm: r12_stack = r12_caller
# asm 1: movq <r12_caller=int64#10,>r12_stack=stack64#2
# asm 2: movq <r12_caller=%r12,>r12_stack=8(%rsp)
movq %r12,8(%rsp)

# qhasm: r13_stack = r13_caller
# asm 1: movq <r13_caller=int64#11,>r13_stack=stack64#3
# asm 2: movq <r13_caller=%r13,>r13_stack=16(%rsp)
movq %r13,16(%rsp)

# qhasm: r14_stack = r14_caller
# asm 1: movq <r14_caller=int64#12,>r14_stack=stack64#4
# asm 2: movq <r14_caller=%r14,>r14_stack=24(%rsp)
movq %r14,24(%rsp)

# qhasm: r15_stack = r15_caller
# asm 1: movq <r15_caller=int64#13,>r15_stack=stack64#5
# asm 2: movq <r15_caller=%r15,>r15_stack=32(%rsp)
movq %r15,32(%rsp)

# qhasm: rbx_stack = rbx_caller
# asm 1: movq <rbx_caller=int64#14,>rbx_stack=stack64#6
# asm 2: movq <rbx_caller=%rbx,>rbx_stack=40(%rsp)
movq %rbx,40(%rsp)

# qhasm: rbp_stack = rbp_caller
# asm 1: movq <rbp_caller=int64#15,>rbp_stack=stack64#7
# asm 2: movq <rbp_caller=%rbp,>rbp_stack=48(%rsp)
movq %rbp,48(%rsp)

# qhasm: c = arg2
# asm 1: mov  <arg2=int64#2,>c=int64#6
# asm 2: mov  <arg2=%rsi,>c=%r9
mov  %rsi,%r9

# qhasm: in = arg3
# asm 1: mov  <arg3=int64#3,>in=int64#2
# asm 2: mov  <arg3=%rdx,>in=%rsi
mov  %rdx,%rsi

# qhasm: out = arg4
# asm 1: mov  <arg4=int64#4,>out=int64#8
# asm 2: mov  <arg4=%rcx,>out=%r10
mov  %rcx,%r10

# qhasm: len = arg5
# asm 1: mov  <arg5=int64#5,>len=int64#5
# asm 2: mov  <arg5=%r8,>len=%r8
mov  %r8,%r8

# qhasm: in_stack = in
# asm 1: movq <in=int64#2,>in_stack=stack64#8
# asm 2: movq <in=%rsi,>in_stack=56(%rsp)
movq %rsi,56(%rsp)

# qhasm:                      unsigned>? len - 0
# asm 1: cmp  $0,<len=int64#5
# asm 2: cmp  $0,<len=%r8
cmp  $0,%r8
# comment:fp stack unchanged by jump

# qhasm: goto nothingtodo if !unsigned>
jbe ._nothingtodo

# qhasm: x0 = *(uint32 *) (c + 0)
# asm 1: movl   0(<c=int64#6),>x0=int64#1d
# asm 2: movl   0(<c=%r9),>x0=%edi
movl   0(%r9),%edi

# qhasm: x1 = *(uint32 *) (c + 4)
# asm 1: movl   4(<c=int64#6),>x1=int64#2d
# asm 2: movl   4(<c=%r9),>x1=%esi
movl   4(%r9),%esi

# qhasm: x2 = *(uint32 *) (c + 8)
# asm 1: movl   8(<c=int64#6),>x2=int64#3d
# asm 2: movl   8(<c=%r9),>x2=%edx
movl   8(%r9),%edx

# qhasm: x3 = *(uint32 *) (c + 12)
# asm 1: movl   12(<c=int64#6),>x3=int64#4d
# asm 2: movl   12(<c=%r9),>x3=%ecx
movl   12(%r9),%ecx

# qhasm: r0 = x0
# asm 1: movq <x0=int64#1,>r0=stack64#9
# asm 2: movq <x0=%rdi,>r0=64(%rsp)
movq %rdi,64(%rsp)

# qhasm: r1 = x1
# asm 1: movq <x1=int64#2,>r1=stack64#10
# asm 2: movq <x1=%rsi,>r1=72(%rsp)
movq %rsi,72(%rsp)

# qhasm: r2 = x2
# asm 1: movq <x2=int64#3,>r2=stack64#11
# asm 2: movq <x2=%rdx,>r2=80(%rsp)
movq %rdx,80(%rsp)

# qhasm: r3 = x3
# asm 1: movq <x3=int64#4,>r3=stack64#12
# asm 2: movq <x3=%rcx,>r3=88(%rsp)
movq %rcx,88(%rsp)

# qhasm: x0 = *(uint32 *) (c + 16)
# asm 1: movl   16(<c=int64#6),>x0=int64#1d
# asm 2: movl   16(<c=%r9),>x0=%edi
movl   16(%r9),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#2
# asm 2: xor  <x0=%rdi,<x1=%rsi
xor  %rdi,%rsi

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#2,<x2=int64#3
# asm 2: xor  <x1=%rsi,<x2=%rdx
xor  %rsi,%rdx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#3,<x3=int64#4
# asm 2: xor  <x2=%rdx,<x3=%rcx
xor  %rdx,%rcx

# qhasm: r4 = x0
# asm 1: movq <x0=int64#1,>r4=stack64#13
# asm 2: movq <x0=%rdi,>r4=96(%rsp)
movq %rdi,96(%rsp)

# qhasm: r5 = x1
# asm 1: movq <x1=int64#2,>r5=stack64#14
# asm 2: movq <x1=%rsi,>r5=104(%rsp)
movq %rsi,104(%rsp)

# qhasm: r6 = x2
# asm 1: movq <x2=int64#3,>r6=stack64#15
# asm 2: movq <x2=%rdx,>r6=112(%rsp)
movq %rdx,112(%rsp)

# qhasm: r7 = x3
# asm 1: movq <x3=int64#4,>r7=stack64#16
# asm 2: movq <x3=%rcx,>r7=120(%rsp)
movq %rcx,120(%rsp)

# qhasm: x0 = *(uint32 *) (c + 20)
# asm 1: movl   20(<c=int64#6),>x0=int64#1d
# asm 2: movl   20(<c=%r9),>x0=%edi
movl   20(%r9),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#2
# asm 2: xor  <x0=%rdi,<x1=%rsi
xor  %rdi,%rsi

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#2,<x2=int64#3
# asm 2: xor  <x1=%rsi,<x2=%rdx
xor  %rsi,%rdx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#3,<x3=int64#4
# asm 2: xor  <x2=%rdx,<x3=%rcx
xor  %rdx,%rcx

# qhasm: r8 = x0
# asm 1: movq <x0=int64#1,>r8=stack64#17
# asm 2: movq <x0=%rdi,>r8=128(%rsp)
movq %rdi,128(%rsp)

# qhasm: r9 = x1
# asm 1: movq <x1=int64#2,>r9=stack64#18
# asm 2: movq <x1=%rsi,>r9=136(%rsp)
movq %rsi,136(%rsp)

# qhasm: r10 = x2
# asm 1: movq <x2=int64#3,>r10=stack64#19
# asm 2: movq <x2=%rdx,>r10=144(%rsp)
movq %rdx,144(%rsp)

# qhasm: r11 = x3
# asm 1: movq <x3=int64#4,>r11=stack64#20
# asm 2: movq <x3=%rcx,>r11=152(%rsp)
movq %rcx,152(%rsp)

# qhasm: x0 = *(uint32 *) (c + 24)
# asm 1: movl   24(<c=int64#6),>x0=int64#1d
# asm 2: movl   24(<c=%r9),>x0=%edi
movl   24(%r9),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#2
# asm 2: xor  <x0=%rdi,<x1=%rsi
xor  %rdi,%rsi

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#2,<x2=int64#3
# asm 2: xor  <x1=%rsi,<x2=%rdx
xor  %rsi,%rdx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#3,<x3=int64#4
# asm 2: xor  <x2=%rdx,<x3=%rcx
xor  %rdx,%rcx

# qhasm: r12 = x0
# asm 1: movq <x0=int64#1,>r12=stack64#21
# asm 2: movq <x0=%rdi,>r12=160(%rsp)
movq %rdi,160(%rsp)

# qhasm: r13 = x1
# asm 1: movq <x1=int64#2,>r13=stack64#22
# asm 2: movq <x1=%rsi,>r13=168(%rsp)
movq %rsi,168(%rsp)

# qhasm: r14 = x2
# asm 1: movq <x2=int64#3,>r14=stack64#23
# asm 2: movq <x2=%rdx,>r14=176(%rsp)
movq %rdx,176(%rsp)

# qhasm: r15 = x3
# asm 1: movq <x3=int64#4,>r15=stack64#24
# asm 2: movq <x3=%rcx,>r15=184(%rsp)
movq %rcx,184(%rsp)

# qhasm: x0 = *(uint32 *) (c + 28)
# asm 1: movl   28(<c=int64#6),>x0=int64#1d
# asm 2: movl   28(<c=%r9),>x0=%edi
movl   28(%r9),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#2
# asm 2: xor  <x0=%rdi,<x1=%rsi
xor  %rdi,%rsi

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#2,<x2=int64#3
# asm 2: xor  <x1=%rsi,<x2=%rdx
xor  %rsi,%rdx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#3,<x3=int64#4
# asm 2: xor  <x2=%rdx,<x3=%rcx
xor  %rdx,%rcx

# qhasm: r16 = x0
# asm 1: movq <x0=int64#1,>r16=stack64#25
# asm 2: movq <x0=%rdi,>r16=192(%rsp)
movq %rdi,192(%rsp)

# qhasm: r17 = x1
# asm 1: movq <x1=int64#2,>r17=stack64#26
# asm 2: movq <x1=%rsi,>r17=200(%rsp)
movq %rsi,200(%rsp)

# qhasm: r18 = x2
# asm 1: movq <x2=int64#3,>r18=stack64#27
# asm 2: movq <x2=%rdx,>r18=208(%rsp)
movq %rdx,208(%rsp)

# qhasm: r19 = x3
# asm 1: movq <x3=int64#4,>r19=stack64#28
# asm 2: movq <x3=%rcx,>r19=216(%rsp)
movq %rcx,216(%rsp)

# qhasm: x0 = *(uint32 *) (c + 32)
# asm 1: movl   32(<c=int64#6),>x0=int64#1d
# asm 2: movl   32(<c=%r9),>x0=%edi
movl   32(%r9),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#2
# asm 2: xor  <x0=%rdi,<x1=%rsi
xor  %rdi,%rsi

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#2,<x2=int64#3
# asm 2: xor  <x1=%rsi,<x2=%rdx
xor  %rsi,%rdx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#3,<x3=int64#4
# asm 2: xor  <x2=%rdx,<x3=%rcx
xor  %rdx,%rcx

# qhasm: r20 = x0
# asm 1: movq <x0=int64#1,>r20=stack64#29
# asm 2: movq <x0=%rdi,>r20=224(%rsp)
movq %rdi,224(%rsp)

# qhasm: r21 = x1
# asm 1: movq <x1=int64#2,>r21=stack64#30
# asm 2: movq <x1=%rsi,>r21=232(%rsp)
movq %rsi,232(%rsp)

# qhasm: r22 = x2
# asm 1: movq <x2=int64#3,>r22=stack64#31
# asm 2: movq <x2=%rdx,>r22=240(%rsp)
movq %rdx,240(%rsp)

# qhasm: r23 = x3
# asm 1: movq <x3=int64#4,>r23=stack64#32
# asm 2: movq <x3=%rcx,>r23=248(%rsp)
movq %rcx,248(%rsp)

# qhasm: x0 = *(uint32 *) (c + 36)
# asm 1: movl   36(<c=int64#6),>x0=int64#1d
# asm 2: movl   36(<c=%r9),>x0=%edi
movl   36(%r9),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#2
# asm 2: xor  <x0=%rdi,<x1=%rsi
xor  %rdi,%rsi

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#2,<x2=int64#3
# asm 2: xor  <x1=%rsi,<x2=%rdx
xor  %rsi,%rdx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#3,<x3=int64#4
# asm 2: xor  <x2=%rdx,<x3=%rcx
xor  %rdx,%rcx

# qhasm: r24 = x0
# asm 1: movq <x0=int64#1,>r24=stack64#33
# asm 2: movq <x0=%rdi,>r24=256(%rsp)
movq %rdi,256(%rsp)

# qhasm: r25 = x1
# asm 1: movq <x1=int64#2,>r25=stack64#34
# asm 2: movq <x1=%rsi,>r25=264(%rsp)
movq %rsi,264(%rsp)

# qhasm: r26 = x2
# asm 1: movq <x2=int64#3,>r26=stack64#35
# asm 2: movq <x2=%rdx,>r26=272(%rsp)
movq %rdx,272(%rsp)

# qhasm: r27 = x3
# asm 1: movq <x3=int64#4,>r27=stack64#36
# asm 2: movq <x3=%rcx,>r27=280(%rsp)
movq %rcx,280(%rsp)

# qhasm: x0 = *(uint32 *) (c + 40)
# asm 1: movl   40(<c=int64#6),>x0=int64#1d
# asm 2: movl   40(<c=%r9),>x0=%edi
movl   40(%r9),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#2
# asm 2: xor  <x0=%rdi,<x1=%rsi
xor  %rdi,%rsi

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#2,<x2=int64#3
# asm 2: xor  <x1=%rsi,<x2=%rdx
xor  %rsi,%rdx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#3,<x3=int64#4
# asm 2: xor  <x2=%rdx,<x3=%rcx
xor  %rdx,%rcx

# qhasm: r28 = x0
# asm 1: movq <x0=int64#1,>r28=stack64#37
# asm 2: movq <x0=%rdi,>r28=288(%rsp)
movq %rdi,288(%rsp)

# qhasm: r29 = x1
# asm 1: movq <x1=int64#2,>r29=stack64#38
# asm 2: movq <x1=%rsi,>r29=296(%rsp)
movq %rsi,296(%rsp)

# qhasm: r30 = x2
# asm 1: movq <x2=int64#3,>r30=stack64#39
# asm 2: movq <x2=%rdx,>r30=304(%rsp)
movq %rdx,304(%rsp)

# qhasm: r31 = x3
# asm 1: movq <x3=int64#4,>r31=stack64#40
# asm 2: movq <x3=%rcx,>r31=312(%rsp)
movq %rcx,312(%rsp)

# qhasm: x0 = *(uint32 *) (c + 44)
# asm 1: movl   44(<c=int64#6),>x0=int64#1d
# asm 2: movl   44(<c=%r9),>x0=%edi
movl   44(%r9),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#2
# asm 2: xor  <x0=%rdi,<x1=%rsi
xor  %rdi,%rsi

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#2,<x2=int64#3
# asm 2: xor  <x1=%rsi,<x2=%rdx
xor  %rsi,%rdx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#3,<x3=int64#4
# asm 2: xor  <x2=%rdx,<x3=%rcx
xor  %rdx,%rcx

# qhasm: r32 = x0
# asm 1: movq <x0=int64#1,>r32=stack64#41
# asm 2: movq <x0=%rdi,>r32=320(%rsp)
movq %rdi,320(%rsp)

# qhasm: r33 = x1
# asm 1: movq <x1=int64#2,>r33=stack64#42
# asm 2: movq <x1=%rsi,>r33=328(%rsp)
movq %rsi,328(%rsp)

# qhasm: r34 = x2
# asm 1: movq <x2=int64#3,>r34=stack64#43
# asm 2: movq <x2=%rdx,>r34=336(%rsp)
movq %rdx,336(%rsp)

# qhasm: r35 = x3
# asm 1: movq <x3=int64#4,>r35=stack64#44
# asm 2: movq <x3=%rcx,>r35=344(%rsp)
movq %rcx,344(%rsp)

# qhasm: x0 = *(uint32 *) (c + 48)
# asm 1: movl   48(<c=int64#6),>x0=int64#1d
# asm 2: movl   48(<c=%r9),>x0=%edi
movl   48(%r9),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#2
# asm 2: xor  <x0=%rdi,<x1=%rsi
xor  %rdi,%rsi

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#2,<x2=int64#3
# asm 2: xor  <x1=%rsi,<x2=%rdx
xor  %rsi,%rdx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#3,<x3=int64#4
# asm 2: xor  <x2=%rdx,<x3=%rcx
xor  %rdx,%rcx

# qhasm: r36 = x0
# asm 1: movq <x0=int64#1,>r36=stack64#45
# asm 2: movq <x0=%rdi,>r36=352(%rsp)
movq %rdi,352(%rsp)

# qhasm: r37 = x1
# asm 1: movq <x1=int64#2,>r37=stack64#46
# asm 2: movq <x1=%rsi,>r37=360(%rsp)
movq %rsi,360(%rsp)

# qhasm: r38 = x2
# asm 1: movq <x2=int64#3,>r38=stack64#47
# asm 2: movq <x2=%rdx,>r38=368(%rsp)
movq %rdx,368(%rsp)

# qhasm: r39 = x3
# asm 1: movq <x3=int64#4,>r39=stack64#48
# asm 2: movq <x3=%rcx,>r39=376(%rsp)
movq %rcx,376(%rsp)

# qhasm: x0 = *(uint32 *) (c + 52)
# asm 1: movl   52(<c=int64#6),>x0=int64#1d
# asm 2: movl   52(<c=%r9),>x0=%edi
movl   52(%r9),%edi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#1,<x1=int64#2
# asm 2: xor  <x0=%rdi,<x1=%rsi
xor  %rdi,%rsi

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#2,<x2=int64#3
# asm 2: xor  <x1=%rsi,<x2=%rdx
xor  %rsi,%rdx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#3,<x3=int64#4
# asm 2: xor  <x2=%rdx,<x3=%rcx
xor  %rdx,%rcx

# qhasm: r40 = x0
# asm 1: movq <x0=int64#1,>r40=stack64#49
# asm 2: movq <x0=%rdi,>r40=384(%rsp)
movq %rdi,384(%rsp)

# qhasm: r41 = x1
# asm 1: movq <x1=int64#2,>r41=stack64#50
# asm 2: movq <x1=%rsi,>r41=392(%rsp)
movq %rsi,392(%rsp)

# qhasm: r42 = x2
# asm 1: movq <x2=int64#3,>r42=stack64#51
# asm 2: movq <x2=%rdx,>r42=400(%rsp)
movq %rdx,400(%rsp)

# qhasm: r43 = x3
# asm 1: movq <x3=int64#4,>r43=stack64#52
# asm 2: movq <x3=%rcx,>r43=408(%rsp)
movq %rcx,408(%rsp)

# qhasm: y0 = *(uint32 *) (c + 56)
# asm 1: movl   56(<c=int64#6),>y0=int64#3d
# asm 2: movl   56(<c=%r9),>y0=%edx
movl   56(%r9),%edx

# qhasm: y1 = *(uint32 *) (c + 60)
# asm 1: movl   60(<c=int64#6),>y1=int64#4d
# asm 2: movl   60(<c=%r9),>y1=%ecx
movl   60(%r9),%ecx

# qhasm: y2 = *(uint32 *) (c + 64)
# asm 1: movl   64(<c=int64#6),>y2=int64#7d
# asm 2: movl   64(<c=%r9),>y2=%eax
movl   64(%r9),%eax

# qhasm: y3 = *(uint32 *) (c + 68)
# asm 1: movl   68(<c=int64#6),>y3=int64#14d
# asm 2: movl   68(<c=%r9),>y3=%ebx
movl   68(%r9),%ebx

# qhasm: assign 3 to y0

# qhasm: assign 4 to y1

# qhasm: assign 7 to y2

# qhasm: assign 14 to y3

# qhasm: table = &aes_tablex
# asm 1: lea  aes_tablex(%rip),>table=int64#9
# asm 2: lea  aes_tablex(%rip),>table=%r11
lea  aes_tablex(%rip),%r11

# qhasm: mainloop:
._mainloop:

# qhasm:   n0 = y0
# asm 1: movq <y0=int64#3,>n0=stack64#53
# asm 2: movq <y0=%rdx,>n0=416(%rsp)
movq %rdx,416(%rsp)

# qhasm:   n1 = y1
# asm 1: movq <y1=int64#4,>n1=stack64#54
# asm 2: movq <y1=%rcx,>n1=424(%rsp)
movq %rcx,424(%rsp)

# qhasm:   n2 = y2
# asm 1: movq <y2=int64#7,>n2=stack64#55
# asm 2: movq <y2=%rax,>n2=432(%rsp)
movq %rax,432(%rsp)

# qhasm:   n3 = y3
# asm 1: movq <y3=int64#14,>n3=stack64#56
# asm 2: movq <y3=%rbx,>n3=440(%rsp)
movq %rbx,440(%rsp)

# qhasm:   y0 ^= r0
# asm 1: xorq <r0=stack64#9,<y0=int64#3
# asm 2: xorq <r0=64(%rsp),<y0=%rdx
xorq 64(%rsp),%rdx

# qhasm:   y1 ^= r1
# asm 1: xorq <r1=stack64#10,<y1=int64#4
# asm 2: xorq <r1=72(%rsp),<y1=%rcx
xorq 72(%rsp),%rcx

# qhasm:   y2 ^= r2
# asm 1: xorq <r2=stack64#11,<y2=int64#7
# asm 2: xorq <r2=80(%rsp),<y2=%rax
xorq 80(%rsp),%rax

# qhasm:   y3 ^= r3
# asm 1: xorq <r3=stack64#12,<y3=int64#14
# asm 2: xorq <r3=88(%rsp),<y3=%rbx
xorq 88(%rsp),%rbx

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#3b,>p00=int64#2d
# asm 2: movzbl  <y0=%dl,>p00=%esi
movzbl  %dl,%esi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#3%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%dh,>p01=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#3d
# asm 2: shr  $16,<y0=%edx
shr  $16,%edx

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#3b,>p02=int64#10d
# asm 2: movzbl  <y0=%dl,>p02=%r12d
movzbl  %dl,%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#3%next8,>p03=int64#15d
# asm 2: movzbl  <y0=%dh,>p03=%ebp
movzbl  %dh,%ebp

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#2,8),>z0=int64#3d
# asm 2: movl   3(<table=%r11,<p00=%rsi,8),>z0=%edx
movl   3(%r11,%rsi,8),%edx

# qhasm:   assign 3 to z0

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#11d
# asm 2: movzbl  <y1=%cl,>p10=%r13d
movzbl  %cl,%r13d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#2d
# asm 2: movzbl  <y1=%ch,>p11=%esi
movzbl  %ch,%esi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#2,8),<z0=int64#3d
# asm 2: xorl 2(<table=%r11,<p11=%rsi,8),<z0=%edx
xorl 2(%r11,%rsi,8),%edx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#12d
# asm 2: movzbl  <y1=%cl,>p12=%r14d
movzbl  %cl,%r14d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#2d
# asm 2: movzbl  <y1=%ch,>p13=%esi
movzbl  %ch,%esi

# qhasm:   z1 = *(uint32 *) (table + 4 + p03 * 8)
# asm 1: movl   4(<table=int64#9,<p03=int64#15,8),>z1=int64#4d
# asm 2: movl   4(<table=%r11,<p03=%rbp,8),>z1=%ecx
movl   4(%r11,%rbp,8),%ecx

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#11,8),<z1=int64#4d
# asm 2: xorl 3(<table=%r11,<p10=%r13,8),<z1=%ecx
xorl 3(%r11,%r13,8),%ecx

# qhasm:   assign 4 to z1

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#7b,>p20=int64#11d
# asm 2: movzbl  <y2=%al,>p20=%r13d
movzbl  %al,%r13d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#7%next8,>p21=int64#15d
# asm 2: movzbl  <y2=%ah,>p21=%ebp
movzbl  %ah,%ebp

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#15,8),<z1=int64#4d
# asm 2: xorl 2(<table=%r11,<p21=%rbp,8),<z1=%ecx
xorl 2(%r11,%rbp,8),%ecx

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#7d
# asm 2: shr  $16,<y2=%eax
shr  $16,%eax

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#7b,>p22=int64#13d
# asm 2: movzbl  <y2=%al,>p22=%r15d
movzbl  %al,%r15d

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#13,8),<z0=int64#3d
# asm 2: xorl 1(<table=%r11,<p22=%r15,8),<z0=%edx
xorl 1(%r11,%r15,8),%edx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#7%next8,>p23=int64#15d
# asm 2: movzbl  <y2=%ah,>p23=%ebp
movzbl  %ah,%ebp

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#10,8),>z2=int64#7d
# asm 2: movl   1(<table=%r11,<p02=%r12,8),>z2=%eax
movl   1(%r11,%r12,8),%eax

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#2,8),<z2=int64#7d
# asm 2: xorl 4(<table=%r11,<p13=%rsi,8),<z2=%eax
xorl 4(%r11,%rsi,8),%eax

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#11,8),<z2=int64#7d
# asm 2: xorl 3(<table=%r11,<p20=%r13,8),<z2=%eax
xorl 3(%r11,%r13,8),%eax

# qhasm:   assign 7 to z2

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#14b,>p30=int64#10d
# asm 2: movzbl  <y3=%bl,>p30=%r12d
movzbl  %bl,%r12d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#14%next8,>p31=int64#2d
# asm 2: movzbl  <y3=%bh,>p31=%esi
movzbl  %bh,%esi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#2,8),<z2=int64#7d
# asm 2: xorl 2(<table=%r11,<p31=%rsi,8),<z2=%eax
xorl 2(%r11,%rsi,8),%eax

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#14d
# asm 2: shr  $16,<y3=%ebx
shr  $16,%ebx

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#14b,>p32=int64#2d
# asm 2: movzbl  <y3=%bl,>p32=%esi
movzbl  %bl,%esi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#2,8),<z1=int64#4d
# asm 2: xorl 1(<table=%r11,<p32=%rsi,8),<z1=%ecx
xorl 1(%r11,%rsi,8),%ecx

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#14%next8,>p33=int64#14d
# asm 2: movzbl  <y3=%bh,>p33=%ebx
movzbl  %bh,%ebx

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#14,8),<z0=int64#3d
# asm 2: xorl 4(<table=%r11,<p33=%rbx,8),<z0=%edx
xorl 4(%r11,%rbx,8),%edx

# qhasm:   z3 = *(uint32 *) (table + 2 + p01 * 8)
# asm 1: movl   2(<table=int64#9,<p01=int64#1,8),>z3=int64#14d
# asm 2: movl   2(<table=%r11,<p01=%rdi,8),>z3=%ebx
movl   2(%r11,%rdi,8),%ebx

# qhasm:   z2 ^= r6
# asm 1: xorq <r6=stack64#15,<z2=int64#7
# asm 2: xorq <r6=112(%rsp),<z2=%rax
xorq 112(%rsp),%rax

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#12,8),<z3=int64#14d
# asm 2: xorl 1(<table=%r11,<p12=%r14,8),<z3=%ebx
xorl 1(%r11,%r14,8),%ebx

# qhasm:   z1 ^= r5
# asm 1: xorq <r5=stack64#14,<z1=int64#4
# asm 2: xorq <r5=104(%rsp),<z1=%rcx
xorq 104(%rsp),%rcx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#15,8),<z3=int64#14d
# asm 2: xorl 4(<table=%r11,<p23=%rbp,8),<z3=%ebx
xorl 4(%r11,%rbp,8),%ebx

# qhasm:   z0 ^= r4
# asm 1: xorq <r4=stack64#13,<z0=int64#3
# asm 2: xorq <r4=96(%rsp),<z0=%rdx
xorq 96(%rsp),%rdx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#10,8),<z3=int64#14d
# asm 2: xorl 3(<table=%r11,<p30=%r12,8),<z3=%ebx
xorl 3(%r11,%r12,8),%ebx

# qhasm:   z3 ^= r7
# asm 1: xorq <r7=stack64#16,<z3=int64#14
# asm 2: xorq <r7=120(%rsp),<z3=%rbx
xorq 120(%rsp),%rbx

# qhasm:   assign 14 to z3

# qhasm:   q00 = z0 & 255
# asm 1: movzbl  <z0=int64#3b,>q00=int64#2d
# asm 2: movzbl  <z0=%dl,>q00=%esi
movzbl  %dl,%esi

# qhasm:   q03 = (z0 >> 8) & 255
# asm 1: movzbl  <z0=int64#3%next8,>q03=int64#1d
# asm 2: movzbl  <z0=%dh,>q03=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 >>= 16
# asm 1: shr  $16,<z0=int64#3d
# asm 2: shr  $16,<z0=%edx
shr  $16,%edx

# qhasm:   q02 = z0 & 255
# asm 1: movzbl  <z0=int64#3b,>q02=int64#10d
# asm 2: movzbl  <z0=%dl,>q02=%r12d
movzbl  %dl,%r12d

# qhasm:   q01 = (z0 >> 8) & 255
# asm 1: movzbl  <z0=int64#3%next8,>q01=int64#15d
# asm 2: movzbl  <z0=%dh,>q01=%ebp
movzbl  %dh,%ebp

# qhasm:   y0 = *(uint32 *) (table + 3 + q00 * 8)
# asm 1: movl   3(<table=int64#9,<q00=int64#2,8),>y0=int64#3d
# asm 2: movl   3(<table=%r11,<q00=%rsi,8),>y0=%edx
movl   3(%r11,%rsi,8),%edx

# qhasm:   assign 3 to y0

# qhasm:   q10 = z1 & 255
# asm 1: movzbl  <z1=int64#4b,>q10=int64#11d
# asm 2: movzbl  <z1=%cl,>q10=%r13d
movzbl  %cl,%r13d

# qhasm:   q11 = (z1 >> 8) & 255
# asm 1: movzbl  <z1=int64#4%next8,>q11=int64#2d
# asm 2: movzbl  <z1=%ch,>q11=%esi
movzbl  %ch,%esi

# qhasm:   (uint32) y0 ^= *(uint32 *) (table + 2 + q11 * 8)
# asm 1: xorl 2(<table=int64#9,<q11=int64#2,8),<y0=int64#3d
# asm 2: xorl 2(<table=%r11,<q11=%rsi,8),<y0=%edx
xorl 2(%r11,%rsi,8),%edx

# qhasm:   (uint32) z1 >>= 16
# asm 1: shr  $16,<z1=int64#4d
# asm 2: shr  $16,<z1=%ecx
shr  $16,%ecx

# qhasm:   q12 = z1 & 255
# asm 1: movzbl  <z1=int64#4b,>q12=int64#12d
# asm 2: movzbl  <z1=%cl,>q12=%r14d
movzbl  %cl,%r14d

# qhasm:   q13 = (z1 >> 8) & 255
# asm 1: movzbl  <z1=int64#4%next8,>q13=int64#2d
# asm 2: movzbl  <z1=%ch,>q13=%esi
movzbl  %ch,%esi

# qhasm:   y1 = *(uint32 *) (table + 4 + q01 * 8)
# asm 1: movl   4(<table=int64#9,<q01=int64#15,8),>y1=int64#4d
# asm 2: movl   4(<table=%r11,<q01=%rbp,8),>y1=%ecx
movl   4(%r11,%rbp,8),%ecx

# qhasm:   (uint32) y1 ^= *(uint32 *) (table + 3 + q10 * 8)
# asm 1: xorl 3(<table=int64#9,<q10=int64#11,8),<y1=int64#4d
# asm 2: xorl 3(<table=%r11,<q10=%r13,8),<y1=%ecx
xorl 3(%r11,%r13,8),%ecx

# qhasm:   assign 4 to y1

# qhasm:   q20 = z2 & 255
# asm 1: movzbl  <z2=int64#7b,>q20=int64#11d
# asm 2: movzbl  <z2=%al,>q20=%r13d
movzbl  %al,%r13d

# qhasm:   q21 = (z2 >> 8) & 255
# asm 1: movzbl  <z2=int64#7%next8,>q21=int64#15d
# asm 2: movzbl  <z2=%ah,>q21=%ebp
movzbl  %ah,%ebp

# qhasm:   (uint32) y1 ^= *(uint32 *) (table + 2 + q21 * 8)
# asm 1: xorl 2(<table=int64#9,<q21=int64#15,8),<y1=int64#4d
# asm 2: xorl 2(<table=%r11,<q21=%rbp,8),<y1=%ecx
xorl 2(%r11,%rbp,8),%ecx

# qhasm:   (uint32) z2 >>= 16
# asm 1: shr  $16,<z2=int64#7d
# asm 2: shr  $16,<z2=%eax
shr  $16,%eax

# qhasm:   q22 = z2 & 255
# asm 1: movzbl  <z2=int64#7b,>q22=int64#13d
# asm 2: movzbl  <z2=%al,>q22=%r15d
movzbl  %al,%r15d

# qhasm:   (uint32) y0 ^= *(uint32 *) (table + 1 + q22 * 8)
# asm 1: xorl 1(<table=int64#9,<q22=int64#13,8),<y0=int64#3d
# asm 2: xorl 1(<table=%r11,<q22=%r15,8),<y0=%edx
xorl 1(%r11,%r15,8),%edx

# qhasm:   q23 = (z2 >> 8) & 255
# asm 1: movzbl  <z2=int64#7%next8,>q23=int64#15d
# asm 2: movzbl  <z2=%ah,>q23=%ebp
movzbl  %ah,%ebp

# qhasm:   y2 = *(uint32 *) (table + 1 + q02 * 8)
# asm 1: movl   1(<table=int64#9,<q02=int64#10,8),>y2=int64#7d
# asm 2: movl   1(<table=%r11,<q02=%r12,8),>y2=%eax
movl   1(%r11,%r12,8),%eax

# qhasm:   (uint32) y2 ^= *(uint32 *) (table + 4 + q13 * 8)
# asm 1: xorl 4(<table=int64#9,<q13=int64#2,8),<y2=int64#7d
# asm 2: xorl 4(<table=%r11,<q13=%rsi,8),<y2=%eax
xorl 4(%r11,%rsi,8),%eax

# qhasm:   (uint32) y2 ^= *(uint32 *) (table + 3 + q20 * 8)
# asm 1: xorl 3(<table=int64#9,<q20=int64#11,8),<y2=int64#7d
# asm 2: xorl 3(<table=%r11,<q20=%r13,8),<y2=%eax
xorl 3(%r11,%r13,8),%eax

# qhasm:   assign 7 to y2

# qhasm:   q30 = z3 & 255
# asm 1: movzbl  <z3=int64#14b,>q30=int64#10d
# asm 2: movzbl  <z3=%bl,>q30=%r12d
movzbl  %bl,%r12d

# qhasm:   q31 = (z3 >> 8) & 255
# asm 1: movzbl  <z3=int64#14%next8,>q31=int64#2d
# asm 2: movzbl  <z3=%bh,>q31=%esi
movzbl  %bh,%esi

# qhasm:   (uint32) y2 ^= *(uint32 *) (table + 2 + q31 * 8)
# asm 1: xorl 2(<table=int64#9,<q31=int64#2,8),<y2=int64#7d
# asm 2: xorl 2(<table=%r11,<q31=%rsi,8),<y2=%eax
xorl 2(%r11,%rsi,8),%eax

# qhasm:   (uint32) z3 >>= 16
# asm 1: shr  $16,<z3=int64#14d
# asm 2: shr  $16,<z3=%ebx
shr  $16,%ebx

# qhasm:   q32 = z3 & 255
# asm 1: movzbl  <z3=int64#14b,>q32=int64#2d
# asm 2: movzbl  <z3=%bl,>q32=%esi
movzbl  %bl,%esi

# qhasm:   (uint32) y1 ^= *(uint32 *) (table + 1 + q32 * 8)
# asm 1: xorl 1(<table=int64#9,<q32=int64#2,8),<y1=int64#4d
# asm 2: xorl 1(<table=%r11,<q32=%rsi,8),<y1=%ecx
xorl 1(%r11,%rsi,8),%ecx

# qhasm:   q33 = (z3 >> 8) & 255
# asm 1: movzbl  <z3=int64#14%next8,>q33=int64#14d
# asm 2: movzbl  <z3=%bh,>q33=%ebx
movzbl  %bh,%ebx

# qhasm:   (uint32) y0 ^= *(uint32 *) (table + 4 + q33 * 8)
# asm 1: xorl 4(<table=int64#9,<q33=int64#14,8),<y0=int64#3d
# asm 2: xorl 4(<table=%r11,<q33=%rbx,8),<y0=%edx
xorl 4(%r11,%rbx,8),%edx

# qhasm:   y3 = *(uint32 *) (table + 2 + q03 * 8)
# asm 1: movl   2(<table=int64#9,<q03=int64#1,8),>y3=int64#14d
# asm 2: movl   2(<table=%r11,<q03=%rdi,8),>y3=%ebx
movl   2(%r11,%rdi,8),%ebx

# qhasm:   y2 ^= r10
# asm 1: xorq <r10=stack64#19,<y2=int64#7
# asm 2: xorq <r10=144(%rsp),<y2=%rax
xorq 144(%rsp),%rax

# qhasm:   (uint32) y3 ^= *(uint32 *) (table + 1 + q12 * 8)
# asm 1: xorl 1(<table=int64#9,<q12=int64#12,8),<y3=int64#14d
# asm 2: xorl 1(<table=%r11,<q12=%r14,8),<y3=%ebx
xorl 1(%r11,%r14,8),%ebx

# qhasm:   y1 ^= r9
# asm 1: xorq <r9=stack64#18,<y1=int64#4
# asm 2: xorq <r9=136(%rsp),<y1=%rcx
xorq 136(%rsp),%rcx

# qhasm:   (uint32) y3 ^= *(uint32 *) (table + 4 + q23 * 8)
# asm 1: xorl 4(<table=int64#9,<q23=int64#15,8),<y3=int64#14d
# asm 2: xorl 4(<table=%r11,<q23=%rbp,8),<y3=%ebx
xorl 4(%r11,%rbp,8),%ebx

# qhasm:   y0 ^= r8
# asm 1: xorq <r8=stack64#17,<y0=int64#3
# asm 2: xorq <r8=128(%rsp),<y0=%rdx
xorq 128(%rsp),%rdx

# qhasm:   (uint32) y3 ^= *(uint32 *) (table + 3 + q30 * 8)
# asm 1: xorl 3(<table=int64#9,<q30=int64#10,8),<y3=int64#14d
# asm 2: xorl 3(<table=%r11,<q30=%r12,8),<y3=%ebx
xorl 3(%r11,%r12,8),%ebx

# qhasm:   y3 ^= r11
# asm 1: xorq <r11=stack64#20,<y3=int64#14
# asm 2: xorq <r11=152(%rsp),<y3=%rbx
xorq 152(%rsp),%rbx

# qhasm:   assign 14 to y3

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#3b,>p00=int64#2d
# asm 2: movzbl  <y0=%dl,>p00=%esi
movzbl  %dl,%esi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#3%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%dh,>p01=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#3d
# asm 2: shr  $16,<y0=%edx
shr  $16,%edx

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#3b,>p02=int64#10d
# asm 2: movzbl  <y0=%dl,>p02=%r12d
movzbl  %dl,%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#3%next8,>p03=int64#15d
# asm 2: movzbl  <y0=%dh,>p03=%ebp
movzbl  %dh,%ebp

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#2,8),>z0=int64#3d
# asm 2: movl   3(<table=%r11,<p00=%rsi,8),>z0=%edx
movl   3(%r11,%rsi,8),%edx

# qhasm:   assign 3 to z0

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#11d
# asm 2: movzbl  <y1=%cl,>p10=%r13d
movzbl  %cl,%r13d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#2d
# asm 2: movzbl  <y1=%ch,>p11=%esi
movzbl  %ch,%esi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#2,8),<z0=int64#3d
# asm 2: xorl 2(<table=%r11,<p11=%rsi,8),<z0=%edx
xorl 2(%r11,%rsi,8),%edx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#12d
# asm 2: movzbl  <y1=%cl,>p12=%r14d
movzbl  %cl,%r14d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#2d
# asm 2: movzbl  <y1=%ch,>p13=%esi
movzbl  %ch,%esi

# qhasm:   z1 = *(uint32 *) (table + 4 + p03 * 8)
# asm 1: movl   4(<table=int64#9,<p03=int64#15,8),>z1=int64#4d
# asm 2: movl   4(<table=%r11,<p03=%rbp,8),>z1=%ecx
movl   4(%r11,%rbp,8),%ecx

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#11,8),<z1=int64#4d
# asm 2: xorl 3(<table=%r11,<p10=%r13,8),<z1=%ecx
xorl 3(%r11,%r13,8),%ecx

# qhasm:   assign 4 to z1

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#7b,>p20=int64#11d
# asm 2: movzbl  <y2=%al,>p20=%r13d
movzbl  %al,%r13d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#7%next8,>p21=int64#15d
# asm 2: movzbl  <y2=%ah,>p21=%ebp
movzbl  %ah,%ebp

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#15,8),<z1=int64#4d
# asm 2: xorl 2(<table=%r11,<p21=%rbp,8),<z1=%ecx
xorl 2(%r11,%rbp,8),%ecx

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#7d
# asm 2: shr  $16,<y2=%eax
shr  $16,%eax

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#7b,>p22=int64#13d
# asm 2: movzbl  <y2=%al,>p22=%r15d
movzbl  %al,%r15d

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#13,8),<z0=int64#3d
# asm 2: xorl 1(<table=%r11,<p22=%r15,8),<z0=%edx
xorl 1(%r11,%r15,8),%edx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#7%next8,>p23=int64#15d
# asm 2: movzbl  <y2=%ah,>p23=%ebp
movzbl  %ah,%ebp

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#10,8),>z2=int64#7d
# asm 2: movl   1(<table=%r11,<p02=%r12,8),>z2=%eax
movl   1(%r11,%r12,8),%eax

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#2,8),<z2=int64#7d
# asm 2: xorl 4(<table=%r11,<p13=%rsi,8),<z2=%eax
xorl 4(%r11,%rsi,8),%eax

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#11,8),<z2=int64#7d
# asm 2: xorl 3(<table=%r11,<p20=%r13,8),<z2=%eax
xorl 3(%r11,%r13,8),%eax

# qhasm:   assign 7 to z2

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#14b,>p30=int64#10d
# asm 2: movzbl  <y3=%bl,>p30=%r12d
movzbl  %bl,%r12d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#14%next8,>p31=int64#2d
# asm 2: movzbl  <y3=%bh,>p31=%esi
movzbl  %bh,%esi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#2,8),<z2=int64#7d
# asm 2: xorl 2(<table=%r11,<p31=%rsi,8),<z2=%eax
xorl 2(%r11,%rsi,8),%eax

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#14d
# asm 2: shr  $16,<y3=%ebx
shr  $16,%ebx

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#14b,>p32=int64#2d
# asm 2: movzbl  <y3=%bl,>p32=%esi
movzbl  %bl,%esi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#2,8),<z1=int64#4d
# asm 2: xorl 1(<table=%r11,<p32=%rsi,8),<z1=%ecx
xorl 1(%r11,%rsi,8),%ecx

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#14%next8,>p33=int64#14d
# asm 2: movzbl  <y3=%bh,>p33=%ebx
movzbl  %bh,%ebx

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#14,8),<z0=int64#3d
# asm 2: xorl 4(<table=%r11,<p33=%rbx,8),<z0=%edx
xorl 4(%r11,%rbx,8),%edx

# qhasm:   z3 = *(uint32 *) (table + 2 + p01 * 8)
# asm 1: movl   2(<table=int64#9,<p01=int64#1,8),>z3=int64#14d
# asm 2: movl   2(<table=%r11,<p01=%rdi,8),>z3=%ebx
movl   2(%r11,%rdi,8),%ebx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#12,8),<z3=int64#14d
# asm 2: xorl 1(<table=%r11,<p12=%r14,8),<z3=%ebx
xorl 1(%r11,%r14,8),%ebx

# qhasm:   z0 ^= r12
# asm 1: xorq <r12=stack64#21,<z0=int64#3
# asm 2: xorq <r12=160(%rsp),<z0=%rdx
xorq 160(%rsp),%rdx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#15,8),<z3=int64#14d
# asm 2: xorl 4(<table=%r11,<p23=%rbp,8),<z3=%ebx
xorl 4(%r11,%rbp,8),%ebx

# qhasm:   z1 ^= r13
# asm 1: xorq <r13=stack64#22,<z1=int64#4
# asm 2: xorq <r13=168(%rsp),<z1=%rcx
xorq 168(%rsp),%rcx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#10,8),<z3=int64#14d
# asm 2: xorl 3(<table=%r11,<p30=%r12,8),<z3=%ebx
xorl 3(%r11,%r12,8),%ebx

# qhasm:   assign 14 to z3

# qhasm:   z2 ^= r14
# asm 1: xorq <r14=stack64#23,<z2=int64#7
# asm 2: xorq <r14=176(%rsp),<z2=%rax
xorq 176(%rsp),%rax

# qhasm:   z3 ^= r15
# asm 1: xorq <r15=stack64#24,<z3=int64#14
# asm 2: xorq <r15=184(%rsp),<z3=%rbx
xorq 184(%rsp),%rbx

# qhasm:   q00 = z0 & 255
# asm 1: movzbl  <z0=int64#3b,>q00=int64#2d
# asm 2: movzbl  <z0=%dl,>q00=%esi
movzbl  %dl,%esi

# qhasm:   q03 = (z0 >> 8) & 255
# asm 1: movzbl  <z0=int64#3%next8,>q03=int64#1d
# asm 2: movzbl  <z0=%dh,>q03=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 >>= 16
# asm 1: shr  $16,<z0=int64#3d
# asm 2: shr  $16,<z0=%edx
shr  $16,%edx

# qhasm:   q02 = z0 & 255
# asm 1: movzbl  <z0=int64#3b,>q02=int64#10d
# asm 2: movzbl  <z0=%dl,>q02=%r12d
movzbl  %dl,%r12d

# qhasm:   q01 = (z0 >> 8) & 255
# asm 1: movzbl  <z0=int64#3%next8,>q01=int64#15d
# asm 2: movzbl  <z0=%dh,>q01=%ebp
movzbl  %dh,%ebp

# qhasm:   y0 = *(uint32 *) (table + 3 + q00 * 8)
# asm 1: movl   3(<table=int64#9,<q00=int64#2,8),>y0=int64#3d
# asm 2: movl   3(<table=%r11,<q00=%rsi,8),>y0=%edx
movl   3(%r11,%rsi,8),%edx

# qhasm:   assign 3 to y0

# qhasm:   q10 = z1 & 255
# asm 1: movzbl  <z1=int64#4b,>q10=int64#11d
# asm 2: movzbl  <z1=%cl,>q10=%r13d
movzbl  %cl,%r13d

# qhasm:   q11 = (z1 >> 8) & 255
# asm 1: movzbl  <z1=int64#4%next8,>q11=int64#2d
# asm 2: movzbl  <z1=%ch,>q11=%esi
movzbl  %ch,%esi

# qhasm:   (uint32) y0 ^= *(uint32 *) (table + 2 + q11 * 8)
# asm 1: xorl 2(<table=int64#9,<q11=int64#2,8),<y0=int64#3d
# asm 2: xorl 2(<table=%r11,<q11=%rsi,8),<y0=%edx
xorl 2(%r11,%rsi,8),%edx

# qhasm:   (uint32) z1 >>= 16
# asm 1: shr  $16,<z1=int64#4d
# asm 2: shr  $16,<z1=%ecx
shr  $16,%ecx

# qhasm:   q12 = z1 & 255
# asm 1: movzbl  <z1=int64#4b,>q12=int64#12d
# asm 2: movzbl  <z1=%cl,>q12=%r14d
movzbl  %cl,%r14d

# qhasm:   q13 = (z1 >> 8) & 255
# asm 1: movzbl  <z1=int64#4%next8,>q13=int64#2d
# asm 2: movzbl  <z1=%ch,>q13=%esi
movzbl  %ch,%esi

# qhasm:   y1 = *(uint32 *) (table + 4 + q01 * 8)
# asm 1: movl   4(<table=int64#9,<q01=int64#15,8),>y1=int64#4d
# asm 2: movl   4(<table=%r11,<q01=%rbp,8),>y1=%ecx
movl   4(%r11,%rbp,8),%ecx

# qhasm:   (uint32) y1 ^= *(uint32 *) (table + 3 + q10 * 8)
# asm 1: xorl 3(<table=int64#9,<q10=int64#11,8),<y1=int64#4d
# asm 2: xorl 3(<table=%r11,<q10=%r13,8),<y1=%ecx
xorl 3(%r11,%r13,8),%ecx

# qhasm:   assign 4 to y1

# qhasm:   q20 = z2 & 255
# asm 1: movzbl  <z2=int64#7b,>q20=int64#11d
# asm 2: movzbl  <z2=%al,>q20=%r13d
movzbl  %al,%r13d

# qhasm:   q21 = (z2 >> 8) & 255
# asm 1: movzbl  <z2=int64#7%next8,>q21=int64#15d
# asm 2: movzbl  <z2=%ah,>q21=%ebp
movzbl  %ah,%ebp

# qhasm:   (uint32) y1 ^= *(uint32 *) (table + 2 + q21 * 8)
# asm 1: xorl 2(<table=int64#9,<q21=int64#15,8),<y1=int64#4d
# asm 2: xorl 2(<table=%r11,<q21=%rbp,8),<y1=%ecx
xorl 2(%r11,%rbp,8),%ecx

# qhasm:   (uint32) z2 >>= 16
# asm 1: shr  $16,<z2=int64#7d
# asm 2: shr  $16,<z2=%eax
shr  $16,%eax

# qhasm:   q22 = z2 & 255
# asm 1: movzbl  <z2=int64#7b,>q22=int64#13d
# asm 2: movzbl  <z2=%al,>q22=%r15d
movzbl  %al,%r15d

# qhasm:   (uint32) y0 ^= *(uint32 *) (table + 1 + q22 * 8)
# asm 1: xorl 1(<table=int64#9,<q22=int64#13,8),<y0=int64#3d
# asm 2: xorl 1(<table=%r11,<q22=%r15,8),<y0=%edx
xorl 1(%r11,%r15,8),%edx

# qhasm:   q23 = (z2 >> 8) & 255
# asm 1: movzbl  <z2=int64#7%next8,>q23=int64#15d
# asm 2: movzbl  <z2=%ah,>q23=%ebp
movzbl  %ah,%ebp

# qhasm:   y2 = *(uint32 *) (table + 1 + q02 * 8)
# asm 1: movl   1(<table=int64#9,<q02=int64#10,8),>y2=int64#7d
# asm 2: movl   1(<table=%r11,<q02=%r12,8),>y2=%eax
movl   1(%r11,%r12,8),%eax

# qhasm:   (uint32) y2 ^= *(uint32 *) (table + 4 + q13 * 8)
# asm 1: xorl 4(<table=int64#9,<q13=int64#2,8),<y2=int64#7d
# asm 2: xorl 4(<table=%r11,<q13=%rsi,8),<y2=%eax
xorl 4(%r11,%rsi,8),%eax

# qhasm:   (uint32) y2 ^= *(uint32 *) (table + 3 + q20 * 8)
# asm 1: xorl 3(<table=int64#9,<q20=int64#11,8),<y2=int64#7d
# asm 2: xorl 3(<table=%r11,<q20=%r13,8),<y2=%eax
xorl 3(%r11,%r13,8),%eax

# qhasm:   assign 7 to y2

# qhasm:   q30 = z3 & 255
# asm 1: movzbl  <z3=int64#14b,>q30=int64#10d
# asm 2: movzbl  <z3=%bl,>q30=%r12d
movzbl  %bl,%r12d

# qhasm:   q31 = (z3 >> 8) & 255
# asm 1: movzbl  <z3=int64#14%next8,>q31=int64#2d
# asm 2: movzbl  <z3=%bh,>q31=%esi
movzbl  %bh,%esi

# qhasm:   (uint32) y2 ^= *(uint32 *) (table + 2 + q31 * 8)
# asm 1: xorl 2(<table=int64#9,<q31=int64#2,8),<y2=int64#7d
# asm 2: xorl 2(<table=%r11,<q31=%rsi,8),<y2=%eax
xorl 2(%r11,%rsi,8),%eax

# qhasm:   (uint32) z3 >>= 16
# asm 1: shr  $16,<z3=int64#14d
# asm 2: shr  $16,<z3=%ebx
shr  $16,%ebx

# qhasm:   q32 = z3 & 255
# asm 1: movzbl  <z3=int64#14b,>q32=int64#2d
# asm 2: movzbl  <z3=%bl,>q32=%esi
movzbl  %bl,%esi

# qhasm:   (uint32) y1 ^= *(uint32 *) (table + 1 + q32 * 8)
# asm 1: xorl 1(<table=int64#9,<q32=int64#2,8),<y1=int64#4d
# asm 2: xorl 1(<table=%r11,<q32=%rsi,8),<y1=%ecx
xorl 1(%r11,%rsi,8),%ecx

# qhasm:   q33 = (z3 >> 8) & 255
# asm 1: movzbl  <z3=int64#14%next8,>q33=int64#14d
# asm 2: movzbl  <z3=%bh,>q33=%ebx
movzbl  %bh,%ebx

# qhasm:   (uint32) y0 ^= *(uint32 *) (table + 4 + q33 * 8)
# asm 1: xorl 4(<table=int64#9,<q33=int64#14,8),<y0=int64#3d
# asm 2: xorl 4(<table=%r11,<q33=%rbx,8),<y0=%edx
xorl 4(%r11,%rbx,8),%edx

# qhasm:   y3 = *(uint32 *) (table + 2 + q03 * 8)
# asm 1: movl   2(<table=int64#9,<q03=int64#1,8),>y3=int64#14d
# asm 2: movl   2(<table=%r11,<q03=%rdi,8),>y3=%ebx
movl   2(%r11,%rdi,8),%ebx

# qhasm:   (uint32) y3 ^= *(uint32 *) (table + 1 + q12 * 8)
# asm 1: xorl 1(<table=int64#9,<q12=int64#12,8),<y3=int64#14d
# asm 2: xorl 1(<table=%r11,<q12=%r14,8),<y3=%ebx
xorl 1(%r11,%r14,8),%ebx

# qhasm:   y0 ^= r16
# asm 1: xorq <r16=stack64#25,<y0=int64#3
# asm 2: xorq <r16=192(%rsp),<y0=%rdx
xorq 192(%rsp),%rdx

# qhasm:   (uint32) y3 ^= *(uint32 *) (table + 4 + q23 * 8)
# asm 1: xorl 4(<table=int64#9,<q23=int64#15,8),<y3=int64#14d
# asm 2: xorl 4(<table=%r11,<q23=%rbp,8),<y3=%ebx
xorl 4(%r11,%rbp,8),%ebx

# qhasm:   y1 ^= r17
# asm 1: xorq <r17=stack64#26,<y1=int64#4
# asm 2: xorq <r17=200(%rsp),<y1=%rcx
xorq 200(%rsp),%rcx

# qhasm:   (uint32) y3 ^= *(uint32 *) (table + 3 + q30 * 8)
# asm 1: xorl 3(<table=int64#9,<q30=int64#10,8),<y3=int64#14d
# asm 2: xorl 3(<table=%r11,<q30=%r12,8),<y3=%ebx
xorl 3(%r11,%r12,8),%ebx

# qhasm:   assign 14 to y3

# qhasm:   y2 ^= r18
# asm 1: xorq <r18=stack64#27,<y2=int64#7
# asm 2: xorq <r18=208(%rsp),<y2=%rax
xorq 208(%rsp),%rax

# qhasm:   y3 ^= r19
# asm 1: xorq <r19=stack64#28,<y3=int64#14
# asm 2: xorq <r19=216(%rsp),<y3=%rbx
xorq 216(%rsp),%rbx

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#3b,>p00=int64#2d
# asm 2: movzbl  <y0=%dl,>p00=%esi
movzbl  %dl,%esi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#3%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%dh,>p01=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#3d
# asm 2: shr  $16,<y0=%edx
shr  $16,%edx

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#3b,>p02=int64#10d
# asm 2: movzbl  <y0=%dl,>p02=%r12d
movzbl  %dl,%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#3%next8,>p03=int64#15d
# asm 2: movzbl  <y0=%dh,>p03=%ebp
movzbl  %dh,%ebp

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#2,8),>z0=int64#3d
# asm 2: movl   3(<table=%r11,<p00=%rsi,8),>z0=%edx
movl   3(%r11,%rsi,8),%edx

# qhasm:   assign 3 to z0

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#11d
# asm 2: movzbl  <y1=%cl,>p10=%r13d
movzbl  %cl,%r13d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#2d
# asm 2: movzbl  <y1=%ch,>p11=%esi
movzbl  %ch,%esi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#2,8),<z0=int64#3d
# asm 2: xorl 2(<table=%r11,<p11=%rsi,8),<z0=%edx
xorl 2(%r11,%rsi,8),%edx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#12d
# asm 2: movzbl  <y1=%cl,>p12=%r14d
movzbl  %cl,%r14d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#2d
# asm 2: movzbl  <y1=%ch,>p13=%esi
movzbl  %ch,%esi

# qhasm:   z1 = *(uint32 *) (table + 4 + p03 * 8)
# asm 1: movl   4(<table=int64#9,<p03=int64#15,8),>z1=int64#4d
# asm 2: movl   4(<table=%r11,<p03=%rbp,8),>z1=%ecx
movl   4(%r11,%rbp,8),%ecx

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#11,8),<z1=int64#4d
# asm 2: xorl 3(<table=%r11,<p10=%r13,8),<z1=%ecx
xorl 3(%r11,%r13,8),%ecx

# qhasm:   assign 4 to z1

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#7b,>p20=int64#11d
# asm 2: movzbl  <y2=%al,>p20=%r13d
movzbl  %al,%r13d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#7%next8,>p21=int64#15d
# asm 2: movzbl  <y2=%ah,>p21=%ebp
movzbl  %ah,%ebp

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#15,8),<z1=int64#4d
# asm 2: xorl 2(<table=%r11,<p21=%rbp,8),<z1=%ecx
xorl 2(%r11,%rbp,8),%ecx

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#7d
# asm 2: shr  $16,<y2=%eax
shr  $16,%eax

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#7b,>p22=int64#13d
# asm 2: movzbl  <y2=%al,>p22=%r15d
movzbl  %al,%r15d

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#13,8),<z0=int64#3d
# asm 2: xorl 1(<table=%r11,<p22=%r15,8),<z0=%edx
xorl 1(%r11,%r15,8),%edx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#7%next8,>p23=int64#15d
# asm 2: movzbl  <y2=%ah,>p23=%ebp
movzbl  %ah,%ebp

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#10,8),>z2=int64#7d
# asm 2: movl   1(<table=%r11,<p02=%r12,8),>z2=%eax
movl   1(%r11,%r12,8),%eax

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#2,8),<z2=int64#7d
# asm 2: xorl 4(<table=%r11,<p13=%rsi,8),<z2=%eax
xorl 4(%r11,%rsi,8),%eax

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#11,8),<z2=int64#7d
# asm 2: xorl 3(<table=%r11,<p20=%r13,8),<z2=%eax
xorl 3(%r11,%r13,8),%eax

# qhasm:   assign 7 to z2

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#14b,>p30=int64#10d
# asm 2: movzbl  <y3=%bl,>p30=%r12d
movzbl  %bl,%r12d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#14%next8,>p31=int64#2d
# asm 2: movzbl  <y3=%bh,>p31=%esi
movzbl  %bh,%esi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#2,8),<z2=int64#7d
# asm 2: xorl 2(<table=%r11,<p31=%rsi,8),<z2=%eax
xorl 2(%r11,%rsi,8),%eax

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#14d
# asm 2: shr  $16,<y3=%ebx
shr  $16,%ebx

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#14b,>p32=int64#2d
# asm 2: movzbl  <y3=%bl,>p32=%esi
movzbl  %bl,%esi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#2,8),<z1=int64#4d
# asm 2: xorl 1(<table=%r11,<p32=%rsi,8),<z1=%ecx
xorl 1(%r11,%rsi,8),%ecx

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#14%next8,>p33=int64#14d
# asm 2: movzbl  <y3=%bh,>p33=%ebx
movzbl  %bh,%ebx

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#14,8),<z0=int64#3d
# asm 2: xorl 4(<table=%r11,<p33=%rbx,8),<z0=%edx
xorl 4(%r11,%rbx,8),%edx

# qhasm:   z3 = *(uint32 *) (table + 2 + p01 * 8)
# asm 1: movl   2(<table=int64#9,<p01=int64#1,8),>z3=int64#14d
# asm 2: movl   2(<table=%r11,<p01=%rdi,8),>z3=%ebx
movl   2(%r11,%rdi,8),%ebx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#12,8),<z3=int64#14d
# asm 2: xorl 1(<table=%r11,<p12=%r14,8),<z3=%ebx
xorl 1(%r11,%r14,8),%ebx

# qhasm:   z0 ^= r20
# asm 1: xorq <r20=stack64#29,<z0=int64#3
# asm 2: xorq <r20=224(%rsp),<z0=%rdx
xorq 224(%rsp),%rdx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#15,8),<z3=int64#14d
# asm 2: xorl 4(<table=%r11,<p23=%rbp,8),<z3=%ebx
xorl 4(%r11,%rbp,8),%ebx

# qhasm:   z1 ^= r21
# asm 1: xorq <r21=stack64#30,<z1=int64#4
# asm 2: xorq <r21=232(%rsp),<z1=%rcx
xorq 232(%rsp),%rcx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#10,8),<z3=int64#14d
# asm 2: xorl 3(<table=%r11,<p30=%r12,8),<z3=%ebx
xorl 3(%r11,%r12,8),%ebx

# qhasm:   assign 14 to z3

# qhasm:   z2 ^= r22
# asm 1: xorq <r22=stack64#31,<z2=int64#7
# asm 2: xorq <r22=240(%rsp),<z2=%rax
xorq 240(%rsp),%rax

# qhasm:   z3 ^= r23
# asm 1: xorq <r23=stack64#32,<z3=int64#14
# asm 2: xorq <r23=248(%rsp),<z3=%rbx
xorq 248(%rsp),%rbx

# qhasm:   q00 = z0 & 255
# asm 1: movzbl  <z0=int64#3b,>q00=int64#2d
# asm 2: movzbl  <z0=%dl,>q00=%esi
movzbl  %dl,%esi

# qhasm:   q03 = (z0 >> 8) & 255
# asm 1: movzbl  <z0=int64#3%next8,>q03=int64#1d
# asm 2: movzbl  <z0=%dh,>q03=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 >>= 16
# asm 1: shr  $16,<z0=int64#3d
# asm 2: shr  $16,<z0=%edx
shr  $16,%edx

# qhasm:   q02 = z0 & 255
# asm 1: movzbl  <z0=int64#3b,>q02=int64#10d
# asm 2: movzbl  <z0=%dl,>q02=%r12d
movzbl  %dl,%r12d

# qhasm:   q01 = (z0 >> 8) & 255
# asm 1: movzbl  <z0=int64#3%next8,>q01=int64#15d
# asm 2: movzbl  <z0=%dh,>q01=%ebp
movzbl  %dh,%ebp

# qhasm:   y0 = *(uint32 *) (table + 3 + q00 * 8)
# asm 1: movl   3(<table=int64#9,<q00=int64#2,8),>y0=int64#3d
# asm 2: movl   3(<table=%r11,<q00=%rsi,8),>y0=%edx
movl   3(%r11,%rsi,8),%edx

# qhasm:   assign 3 to y0

# qhasm:   q10 = z1 & 255
# asm 1: movzbl  <z1=int64#4b,>q10=int64#11d
# asm 2: movzbl  <z1=%cl,>q10=%r13d
movzbl  %cl,%r13d

# qhasm:   q11 = (z1 >> 8) & 255
# asm 1: movzbl  <z1=int64#4%next8,>q11=int64#2d
# asm 2: movzbl  <z1=%ch,>q11=%esi
movzbl  %ch,%esi

# qhasm:   (uint32) y0 ^= *(uint32 *) (table + 2 + q11 * 8)
# asm 1: xorl 2(<table=int64#9,<q11=int64#2,8),<y0=int64#3d
# asm 2: xorl 2(<table=%r11,<q11=%rsi,8),<y0=%edx
xorl 2(%r11,%rsi,8),%edx

# qhasm:   (uint32) z1 >>= 16
# asm 1: shr  $16,<z1=int64#4d
# asm 2: shr  $16,<z1=%ecx
shr  $16,%ecx

# qhasm:   q12 = z1 & 255
# asm 1: movzbl  <z1=int64#4b,>q12=int64#12d
# asm 2: movzbl  <z1=%cl,>q12=%r14d
movzbl  %cl,%r14d

# qhasm:   q13 = (z1 >> 8) & 255
# asm 1: movzbl  <z1=int64#4%next8,>q13=int64#2d
# asm 2: movzbl  <z1=%ch,>q13=%esi
movzbl  %ch,%esi

# qhasm:   y1 = *(uint32 *) (table + 4 + q01 * 8)
# asm 1: movl   4(<table=int64#9,<q01=int64#15,8),>y1=int64#4d
# asm 2: movl   4(<table=%r11,<q01=%rbp,8),>y1=%ecx
movl   4(%r11,%rbp,8),%ecx

# qhasm:   (uint32) y1 ^= *(uint32 *) (table + 3 + q10 * 8)
# asm 1: xorl 3(<table=int64#9,<q10=int64#11,8),<y1=int64#4d
# asm 2: xorl 3(<table=%r11,<q10=%r13,8),<y1=%ecx
xorl 3(%r11,%r13,8),%ecx

# qhasm:   assign 4 to y1

# qhasm:   q20 = z2 & 255
# asm 1: movzbl  <z2=int64#7b,>q20=int64#11d
# asm 2: movzbl  <z2=%al,>q20=%r13d
movzbl  %al,%r13d

# qhasm:   q21 = (z2 >> 8) & 255
# asm 1: movzbl  <z2=int64#7%next8,>q21=int64#15d
# asm 2: movzbl  <z2=%ah,>q21=%ebp
movzbl  %ah,%ebp

# qhasm:   (uint32) y1 ^= *(uint32 *) (table + 2 + q21 * 8)
# asm 1: xorl 2(<table=int64#9,<q21=int64#15,8),<y1=int64#4d
# asm 2: xorl 2(<table=%r11,<q21=%rbp,8),<y1=%ecx
xorl 2(%r11,%rbp,8),%ecx

# qhasm:   (uint32) z2 >>= 16
# asm 1: shr  $16,<z2=int64#7d
# asm 2: shr  $16,<z2=%eax
shr  $16,%eax

# qhasm:   q22 = z2 & 255
# asm 1: movzbl  <z2=int64#7b,>q22=int64#13d
# asm 2: movzbl  <z2=%al,>q22=%r15d
movzbl  %al,%r15d

# qhasm:   (uint32) y0 ^= *(uint32 *) (table + 1 + q22 * 8)
# asm 1: xorl 1(<table=int64#9,<q22=int64#13,8),<y0=int64#3d
# asm 2: xorl 1(<table=%r11,<q22=%r15,8),<y0=%edx
xorl 1(%r11,%r15,8),%edx

# qhasm:   q23 = (z2 >> 8) & 255
# asm 1: movzbl  <z2=int64#7%next8,>q23=int64#15d
# asm 2: movzbl  <z2=%ah,>q23=%ebp
movzbl  %ah,%ebp

# qhasm:   y2 = *(uint32 *) (table + 1 + q02 * 8)
# asm 1: movl   1(<table=int64#9,<q02=int64#10,8),>y2=int64#7d
# asm 2: movl   1(<table=%r11,<q02=%r12,8),>y2=%eax
movl   1(%r11,%r12,8),%eax

# qhasm:   (uint32) y2 ^= *(uint32 *) (table + 4 + q13 * 8)
# asm 1: xorl 4(<table=int64#9,<q13=int64#2,8),<y2=int64#7d
# asm 2: xorl 4(<table=%r11,<q13=%rsi,8),<y2=%eax
xorl 4(%r11,%rsi,8),%eax

# qhasm:   (uint32) y2 ^= *(uint32 *) (table + 3 + q20 * 8)
# asm 1: xorl 3(<table=int64#9,<q20=int64#11,8),<y2=int64#7d
# asm 2: xorl 3(<table=%r11,<q20=%r13,8),<y2=%eax
xorl 3(%r11,%r13,8),%eax

# qhasm:   assign 7 to y2

# qhasm:   q30 = z3 & 255
# asm 1: movzbl  <z3=int64#14b,>q30=int64#10d
# asm 2: movzbl  <z3=%bl,>q30=%r12d
movzbl  %bl,%r12d

# qhasm:   q31 = (z3 >> 8) & 255
# asm 1: movzbl  <z3=int64#14%next8,>q31=int64#2d
# asm 2: movzbl  <z3=%bh,>q31=%esi
movzbl  %bh,%esi

# qhasm:   (uint32) y2 ^= *(uint32 *) (table + 2 + q31 * 8)
# asm 1: xorl 2(<table=int64#9,<q31=int64#2,8),<y2=int64#7d
# asm 2: xorl 2(<table=%r11,<q31=%rsi,8),<y2=%eax
xorl 2(%r11,%rsi,8),%eax

# qhasm:   (uint32) z3 >>= 16
# asm 1: shr  $16,<z3=int64#14d
# asm 2: shr  $16,<z3=%ebx
shr  $16,%ebx

# qhasm:   q32 = z3 & 255
# asm 1: movzbl  <z3=int64#14b,>q32=int64#2d
# asm 2: movzbl  <z3=%bl,>q32=%esi
movzbl  %bl,%esi

# qhasm:   (uint32) y1 ^= *(uint32 *) (table + 1 + q32 * 8)
# asm 1: xorl 1(<table=int64#9,<q32=int64#2,8),<y1=int64#4d
# asm 2: xorl 1(<table=%r11,<q32=%rsi,8),<y1=%ecx
xorl 1(%r11,%rsi,8),%ecx

# qhasm:   q33 = (z3 >> 8) & 255
# asm 1: movzbl  <z3=int64#14%next8,>q33=int64#14d
# asm 2: movzbl  <z3=%bh,>q33=%ebx
movzbl  %bh,%ebx

# qhasm:   (uint32) y0 ^= *(uint32 *) (table + 4 + q33 * 8)
# asm 1: xorl 4(<table=int64#9,<q33=int64#14,8),<y0=int64#3d
# asm 2: xorl 4(<table=%r11,<q33=%rbx,8),<y0=%edx
xorl 4(%r11,%rbx,8),%edx

# qhasm:   y3 = *(uint32 *) (table + 2 + q03 * 8)
# asm 1: movl   2(<table=int64#9,<q03=int64#1,8),>y3=int64#14d
# asm 2: movl   2(<table=%r11,<q03=%rdi,8),>y3=%ebx
movl   2(%r11,%rdi,8),%ebx

# qhasm:   (uint32) y3 ^= *(uint32 *) (table + 1 + q12 * 8)
# asm 1: xorl 1(<table=int64#9,<q12=int64#12,8),<y3=int64#14d
# asm 2: xorl 1(<table=%r11,<q12=%r14,8),<y3=%ebx
xorl 1(%r11,%r14,8),%ebx

# qhasm:   y0 ^= r24
# asm 1: xorq <r24=stack64#33,<y0=int64#3
# asm 2: xorq <r24=256(%rsp),<y0=%rdx
xorq 256(%rsp),%rdx

# qhasm:   (uint32) y3 ^= *(uint32 *) (table + 4 + q23 * 8)
# asm 1: xorl 4(<table=int64#9,<q23=int64#15,8),<y3=int64#14d
# asm 2: xorl 4(<table=%r11,<q23=%rbp,8),<y3=%ebx
xorl 4(%r11,%rbp,8),%ebx

# qhasm:   y1 ^= r25
# asm 1: xorq <r25=stack64#34,<y1=int64#4
# asm 2: xorq <r25=264(%rsp),<y1=%rcx
xorq 264(%rsp),%rcx

# qhasm:   (uint32) y3 ^= *(uint32 *) (table + 3 + q30 * 8)
# asm 1: xorl 3(<table=int64#9,<q30=int64#10,8),<y3=int64#14d
# asm 2: xorl 3(<table=%r11,<q30=%r12,8),<y3=%ebx
xorl 3(%r11,%r12,8),%ebx

# qhasm:   assign 14 to y3

# qhasm:   y2 ^= r26
# asm 1: xorq <r26=stack64#35,<y2=int64#7
# asm 2: xorq <r26=272(%rsp),<y2=%rax
xorq 272(%rsp),%rax

# qhasm:   y3 ^= r27
# asm 1: xorq <r27=stack64#36,<y3=int64#14
# asm 2: xorq <r27=280(%rsp),<y3=%rbx
xorq 280(%rsp),%rbx

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#3b,>p00=int64#2d
# asm 2: movzbl  <y0=%dl,>p00=%esi
movzbl  %dl,%esi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#3%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%dh,>p01=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#3d
# asm 2: shr  $16,<y0=%edx
shr  $16,%edx

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#3b,>p02=int64#10d
# asm 2: movzbl  <y0=%dl,>p02=%r12d
movzbl  %dl,%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#3%next8,>p03=int64#15d
# asm 2: movzbl  <y0=%dh,>p03=%ebp
movzbl  %dh,%ebp

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#2,8),>z0=int64#3d
# asm 2: movl   3(<table=%r11,<p00=%rsi,8),>z0=%edx
movl   3(%r11,%rsi,8),%edx

# qhasm:   assign 3 to z0

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#11d
# asm 2: movzbl  <y1=%cl,>p10=%r13d
movzbl  %cl,%r13d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#2d
# asm 2: movzbl  <y1=%ch,>p11=%esi
movzbl  %ch,%esi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#2,8),<z0=int64#3d
# asm 2: xorl 2(<table=%r11,<p11=%rsi,8),<z0=%edx
xorl 2(%r11,%rsi,8),%edx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#12d
# asm 2: movzbl  <y1=%cl,>p12=%r14d
movzbl  %cl,%r14d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#2d
# asm 2: movzbl  <y1=%ch,>p13=%esi
movzbl  %ch,%esi

# qhasm:   z1 = *(uint32 *) (table + 4 + p03 * 8)
# asm 1: movl   4(<table=int64#9,<p03=int64#15,8),>z1=int64#4d
# asm 2: movl   4(<table=%r11,<p03=%rbp,8),>z1=%ecx
movl   4(%r11,%rbp,8),%ecx

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#11,8),<z1=int64#4d
# asm 2: xorl 3(<table=%r11,<p10=%r13,8),<z1=%ecx
xorl 3(%r11,%r13,8),%ecx

# qhasm:   assign 4 to z1

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#7b,>p20=int64#11d
# asm 2: movzbl  <y2=%al,>p20=%r13d
movzbl  %al,%r13d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#7%next8,>p21=int64#15d
# asm 2: movzbl  <y2=%ah,>p21=%ebp
movzbl  %ah,%ebp

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#15,8),<z1=int64#4d
# asm 2: xorl 2(<table=%r11,<p21=%rbp,8),<z1=%ecx
xorl 2(%r11,%rbp,8),%ecx

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#7d
# asm 2: shr  $16,<y2=%eax
shr  $16,%eax

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#7b,>p22=int64#13d
# asm 2: movzbl  <y2=%al,>p22=%r15d
movzbl  %al,%r15d

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#13,8),<z0=int64#3d
# asm 2: xorl 1(<table=%r11,<p22=%r15,8),<z0=%edx
xorl 1(%r11,%r15,8),%edx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#7%next8,>p23=int64#15d
# asm 2: movzbl  <y2=%ah,>p23=%ebp
movzbl  %ah,%ebp

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#10,8),>z2=int64#7d
# asm 2: movl   1(<table=%r11,<p02=%r12,8),>z2=%eax
movl   1(%r11,%r12,8),%eax

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#2,8),<z2=int64#7d
# asm 2: xorl 4(<table=%r11,<p13=%rsi,8),<z2=%eax
xorl 4(%r11,%rsi,8),%eax

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#11,8),<z2=int64#7d
# asm 2: xorl 3(<table=%r11,<p20=%r13,8),<z2=%eax
xorl 3(%r11,%r13,8),%eax

# qhasm:   assign 7 to z2

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#14b,>p30=int64#10d
# asm 2: movzbl  <y3=%bl,>p30=%r12d
movzbl  %bl,%r12d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#14%next8,>p31=int64#2d
# asm 2: movzbl  <y3=%bh,>p31=%esi
movzbl  %bh,%esi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#2,8),<z2=int64#7d
# asm 2: xorl 2(<table=%r11,<p31=%rsi,8),<z2=%eax
xorl 2(%r11,%rsi,8),%eax

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#14d
# asm 2: shr  $16,<y3=%ebx
shr  $16,%ebx

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#14b,>p32=int64#2d
# asm 2: movzbl  <y3=%bl,>p32=%esi
movzbl  %bl,%esi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#2,8),<z1=int64#4d
# asm 2: xorl 1(<table=%r11,<p32=%rsi,8),<z1=%ecx
xorl 1(%r11,%rsi,8),%ecx

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#14%next8,>p33=int64#14d
# asm 2: movzbl  <y3=%bh,>p33=%ebx
movzbl  %bh,%ebx

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#14,8),<z0=int64#3d
# asm 2: xorl 4(<table=%r11,<p33=%rbx,8),<z0=%edx
xorl 4(%r11,%rbx,8),%edx

# qhasm:   z3 = *(uint32 *) (table + 2 + p01 * 8)
# asm 1: movl   2(<table=int64#9,<p01=int64#1,8),>z3=int64#14d
# asm 2: movl   2(<table=%r11,<p01=%rdi,8),>z3=%ebx
movl   2(%r11,%rdi,8),%ebx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#12,8),<z3=int64#14d
# asm 2: xorl 1(<table=%r11,<p12=%r14,8),<z3=%ebx
xorl 1(%r11,%r14,8),%ebx

# qhasm:   z0 ^= r28
# asm 1: xorq <r28=stack64#37,<z0=int64#3
# asm 2: xorq <r28=288(%rsp),<z0=%rdx
xorq 288(%rsp),%rdx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#15,8),<z3=int64#14d
# asm 2: xorl 4(<table=%r11,<p23=%rbp,8),<z3=%ebx
xorl 4(%r11,%rbp,8),%ebx

# qhasm:   z1 ^= r29
# asm 1: xorq <r29=stack64#38,<z1=int64#4
# asm 2: xorq <r29=296(%rsp),<z1=%rcx
xorq 296(%rsp),%rcx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#10,8),<z3=int64#14d
# asm 2: xorl 3(<table=%r11,<p30=%r12,8),<z3=%ebx
xorl 3(%r11,%r12,8),%ebx

# qhasm:   assign 14 to z3

# qhasm:   z2 ^= r30
# asm 1: xorq <r30=stack64#39,<z2=int64#7
# asm 2: xorq <r30=304(%rsp),<z2=%rax
xorq 304(%rsp),%rax

# qhasm:   z3 ^= r31
# asm 1: xorq <r31=stack64#40,<z3=int64#14
# asm 2: xorq <r31=312(%rsp),<z3=%rbx
xorq 312(%rsp),%rbx

# qhasm:   q00 = z0 & 255
# asm 1: movzbl  <z0=int64#3b,>q00=int64#2d
# asm 2: movzbl  <z0=%dl,>q00=%esi
movzbl  %dl,%esi

# qhasm:   q03 = (z0 >> 8) & 255
# asm 1: movzbl  <z0=int64#3%next8,>q03=int64#1d
# asm 2: movzbl  <z0=%dh,>q03=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z0 >>= 16
# asm 1: shr  $16,<z0=int64#3d
# asm 2: shr  $16,<z0=%edx
shr  $16,%edx

# qhasm:   q02 = z0 & 255
# asm 1: movzbl  <z0=int64#3b,>q02=int64#10d
# asm 2: movzbl  <z0=%dl,>q02=%r12d
movzbl  %dl,%r12d

# qhasm:   q01 = (z0 >> 8) & 255
# asm 1: movzbl  <z0=int64#3%next8,>q01=int64#15d
# asm 2: movzbl  <z0=%dh,>q01=%ebp
movzbl  %dh,%ebp

# qhasm:   y0 = *(uint32 *) (table + 3 + q00 * 8)
# asm 1: movl   3(<table=int64#9,<q00=int64#2,8),>y0=int64#3d
# asm 2: movl   3(<table=%r11,<q00=%rsi,8),>y0=%edx
movl   3(%r11,%rsi,8),%edx

# qhasm:   assign 3 to y0

# qhasm:   q10 = z1 & 255
# asm 1: movzbl  <z1=int64#4b,>q10=int64#11d
# asm 2: movzbl  <z1=%cl,>q10=%r13d
movzbl  %cl,%r13d

# qhasm:   q11 = (z1 >> 8) & 255
# asm 1: movzbl  <z1=int64#4%next8,>q11=int64#2d
# asm 2: movzbl  <z1=%ch,>q11=%esi
movzbl  %ch,%esi

# qhasm:   (uint32) y0 ^= *(uint32 *) (table + 2 + q11 * 8)
# asm 1: xorl 2(<table=int64#9,<q11=int64#2,8),<y0=int64#3d
# asm 2: xorl 2(<table=%r11,<q11=%rsi,8),<y0=%edx
xorl 2(%r11,%rsi,8),%edx

# qhasm:   (uint32) z1 >>= 16
# asm 1: shr  $16,<z1=int64#4d
# asm 2: shr  $16,<z1=%ecx
shr  $16,%ecx

# qhasm:   q12 = z1 & 255
# asm 1: movzbl  <z1=int64#4b,>q12=int64#12d
# asm 2: movzbl  <z1=%cl,>q12=%r14d
movzbl  %cl,%r14d

# qhasm:   q13 = (z1 >> 8) & 255
# asm 1: movzbl  <z1=int64#4%next8,>q13=int64#2d
# asm 2: movzbl  <z1=%ch,>q13=%esi
movzbl  %ch,%esi

# qhasm:   y1 = *(uint32 *) (table + 4 + q01 * 8)
# asm 1: movl   4(<table=int64#9,<q01=int64#15,8),>y1=int64#4d
# asm 2: movl   4(<table=%r11,<q01=%rbp,8),>y1=%ecx
movl   4(%r11,%rbp,8),%ecx

# qhasm:   (uint32) y1 ^= *(uint32 *) (table + 3 + q10 * 8)
# asm 1: xorl 3(<table=int64#9,<q10=int64#11,8),<y1=int64#4d
# asm 2: xorl 3(<table=%r11,<q10=%r13,8),<y1=%ecx
xorl 3(%r11,%r13,8),%ecx

# qhasm:   assign 4 to y1

# qhasm:   q20 = z2 & 255
# asm 1: movzbl  <z2=int64#7b,>q20=int64#11d
# asm 2: movzbl  <z2=%al,>q20=%r13d
movzbl  %al,%r13d

# qhasm:   q21 = (z2 >> 8) & 255
# asm 1: movzbl  <z2=int64#7%next8,>q21=int64#15d
# asm 2: movzbl  <z2=%ah,>q21=%ebp
movzbl  %ah,%ebp

# qhasm:   (uint32) y1 ^= *(uint32 *) (table + 2 + q21 * 8)
# asm 1: xorl 2(<table=int64#9,<q21=int64#15,8),<y1=int64#4d
# asm 2: xorl 2(<table=%r11,<q21=%rbp,8),<y1=%ecx
xorl 2(%r11,%rbp,8),%ecx

# qhasm:   (uint32) z2 >>= 16
# asm 1: shr  $16,<z2=int64#7d
# asm 2: shr  $16,<z2=%eax
shr  $16,%eax

# qhasm:   q22 = z2 & 255
# asm 1: movzbl  <z2=int64#7b,>q22=int64#13d
# asm 2: movzbl  <z2=%al,>q22=%r15d
movzbl  %al,%r15d

# qhasm:   (uint32) y0 ^= *(uint32 *) (table + 1 + q22 * 8)
# asm 1: xorl 1(<table=int64#9,<q22=int64#13,8),<y0=int64#3d
# asm 2: xorl 1(<table=%r11,<q22=%r15,8),<y0=%edx
xorl 1(%r11,%r15,8),%edx

# qhasm:   q23 = (z2 >> 8) & 255
# asm 1: movzbl  <z2=int64#7%next8,>q23=int64#15d
# asm 2: movzbl  <z2=%ah,>q23=%ebp
movzbl  %ah,%ebp

# qhasm:   y2 = *(uint32 *) (table + 1 + q02 * 8)
# asm 1: movl   1(<table=int64#9,<q02=int64#10,8),>y2=int64#7d
# asm 2: movl   1(<table=%r11,<q02=%r12,8),>y2=%eax
movl   1(%r11,%r12,8),%eax

# qhasm:   (uint32) y2 ^= *(uint32 *) (table + 4 + q13 * 8)
# asm 1: xorl 4(<table=int64#9,<q13=int64#2,8),<y2=int64#7d
# asm 2: xorl 4(<table=%r11,<q13=%rsi,8),<y2=%eax
xorl 4(%r11,%rsi,8),%eax

# qhasm:   (uint32) y2 ^= *(uint32 *) (table + 3 + q20 * 8)
# asm 1: xorl 3(<table=int64#9,<q20=int64#11,8),<y2=int64#7d
# asm 2: xorl 3(<table=%r11,<q20=%r13,8),<y2=%eax
xorl 3(%r11,%r13,8),%eax

# qhasm:   assign 7 to y2

# qhasm:   q30 = z3 & 255
# asm 1: movzbl  <z3=int64#14b,>q30=int64#10d
# asm 2: movzbl  <z3=%bl,>q30=%r12d
movzbl  %bl,%r12d

# qhasm:   q31 = (z3 >> 8) & 255
# asm 1: movzbl  <z3=int64#14%next8,>q31=int64#2d
# asm 2: movzbl  <z3=%bh,>q31=%esi
movzbl  %bh,%esi

# qhasm:   (uint32) y2 ^= *(uint32 *) (table + 2 + q31 * 8)
# asm 1: xorl 2(<table=int64#9,<q31=int64#2,8),<y2=int64#7d
# asm 2: xorl 2(<table=%r11,<q31=%rsi,8),<y2=%eax
xorl 2(%r11,%rsi,8),%eax

# qhasm:   (uint32) z3 >>= 16
# asm 1: shr  $16,<z3=int64#14d
# asm 2: shr  $16,<z3=%ebx
shr  $16,%ebx

# qhasm:   q32 = z3 & 255
# asm 1: movzbl  <z3=int64#14b,>q32=int64#2d
# asm 2: movzbl  <z3=%bl,>q32=%esi
movzbl  %bl,%esi

# qhasm:   (uint32) y1 ^= *(uint32 *) (table + 1 + q32 * 8)
# asm 1: xorl 1(<table=int64#9,<q32=int64#2,8),<y1=int64#4d
# asm 2: xorl 1(<table=%r11,<q32=%rsi,8),<y1=%ecx
xorl 1(%r11,%rsi,8),%ecx

# qhasm:   q33 = (z3 >> 8) & 255
# asm 1: movzbl  <z3=int64#14%next8,>q33=int64#14d
# asm 2: movzbl  <z3=%bh,>q33=%ebx
movzbl  %bh,%ebx

# qhasm:   (uint32) y0 ^= *(uint32 *) (table + 4 + q33 * 8)
# asm 1: xorl 4(<table=int64#9,<q33=int64#14,8),<y0=int64#3d
# asm 2: xorl 4(<table=%r11,<q33=%rbx,8),<y0=%edx
xorl 4(%r11,%rbx,8),%edx

# qhasm:   y3 = *(uint32 *) (table + 2 + q03 * 8)
# asm 1: movl   2(<table=int64#9,<q03=int64#1,8),>y3=int64#14d
# asm 2: movl   2(<table=%r11,<q03=%rdi,8),>y3=%ebx
movl   2(%r11,%rdi,8),%ebx

# qhasm:   (uint32) y3 ^= *(uint32 *) (table + 1 + q12 * 8)
# asm 1: xorl 1(<table=int64#9,<q12=int64#12,8),<y3=int64#14d
# asm 2: xorl 1(<table=%r11,<q12=%r14,8),<y3=%ebx
xorl 1(%r11,%r14,8),%ebx

# qhasm:   y0 ^= r32
# asm 1: xorq <r32=stack64#41,<y0=int64#3
# asm 2: xorq <r32=320(%rsp),<y0=%rdx
xorq 320(%rsp),%rdx

# qhasm:   (uint32) y3 ^= *(uint32 *) (table + 4 + q23 * 8)
# asm 1: xorl 4(<table=int64#9,<q23=int64#15,8),<y3=int64#14d
# asm 2: xorl 4(<table=%r11,<q23=%rbp,8),<y3=%ebx
xorl 4(%r11,%rbp,8),%ebx

# qhasm:   y1 ^= r33
# asm 1: xorq <r33=stack64#42,<y1=int64#4
# asm 2: xorq <r33=328(%rsp),<y1=%rcx
xorq 328(%rsp),%rcx

# qhasm:   (uint32) y3 ^= *(uint32 *) (table + 3 + q30 * 8)
# asm 1: xorl 3(<table=int64#9,<q30=int64#10,8),<y3=int64#14d
# asm 2: xorl 3(<table=%r11,<q30=%r12,8),<y3=%ebx
xorl 3(%r11,%r12,8),%ebx

# qhasm:   assign 14 to y3

# qhasm:   y2 ^= r34
# asm 1: xorq <r34=stack64#43,<y2=int64#7
# asm 2: xorq <r34=336(%rsp),<y2=%rax
xorq 336(%rsp),%rax

# qhasm:   y3 ^= r35
# asm 1: xorq <r35=stack64#44,<y3=int64#14
# asm 2: xorq <r35=344(%rsp),<y3=%rbx
xorq 344(%rsp),%rbx

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#3b,>p00=int64#2d
# asm 2: movzbl  <y0=%dl,>p00=%esi
movzbl  %dl,%esi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#3%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%dh,>p01=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#3d
# asm 2: shr  $16,<y0=%edx
shr  $16,%edx

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#3b,>p02=int64#10d
# asm 2: movzbl  <y0=%dl,>p02=%r12d
movzbl  %dl,%r12d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#3%next8,>p03=int64#15d
# asm 2: movzbl  <y0=%dh,>p03=%ebp
movzbl  %dh,%ebp

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#9,<p00=int64#2,8),>z0=int64#3d
# asm 2: movl   3(<table=%r11,<p00=%rsi,8),>z0=%edx
movl   3(%r11,%rsi,8),%edx

# qhasm:   assign 3 to z0

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#11d
# asm 2: movzbl  <y1=%cl,>p10=%r13d
movzbl  %cl,%r13d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#2d
# asm 2: movzbl  <y1=%ch,>p11=%esi
movzbl  %ch,%esi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#9,<p11=int64#2,8),<z0=int64#3d
# asm 2: xorl 2(<table=%r11,<p11=%rsi,8),<z0=%edx
xorl 2(%r11,%rsi,8),%edx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#12d
# asm 2: movzbl  <y1=%cl,>p12=%r14d
movzbl  %cl,%r14d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#2d
# asm 2: movzbl  <y1=%ch,>p13=%esi
movzbl  %ch,%esi

# qhasm:   z1 = *(uint32 *) (table + 4 + p03 * 8)
# asm 1: movl   4(<table=int64#9,<p03=int64#15,8),>z1=int64#4d
# asm 2: movl   4(<table=%r11,<p03=%rbp,8),>z1=%ecx
movl   4(%r11,%rbp,8),%ecx

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#9,<p10=int64#11,8),<z1=int64#4d
# asm 2: xorl 3(<table=%r11,<p10=%r13,8),<z1=%ecx
xorl 3(%r11,%r13,8),%ecx

# qhasm:   assign 4 to z1

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#7b,>p20=int64#11d
# asm 2: movzbl  <y2=%al,>p20=%r13d
movzbl  %al,%r13d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#7%next8,>p21=int64#15d
# asm 2: movzbl  <y2=%ah,>p21=%ebp
movzbl  %ah,%ebp

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#9,<p21=int64#15,8),<z1=int64#4d
# asm 2: xorl 2(<table=%r11,<p21=%rbp,8),<z1=%ecx
xorl 2(%r11,%rbp,8),%ecx

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#7d
# asm 2: shr  $16,<y2=%eax
shr  $16,%eax

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#7b,>p22=int64#13d
# asm 2: movzbl  <y2=%al,>p22=%r15d
movzbl  %al,%r15d

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#9,<p22=int64#13,8),<z0=int64#3d
# asm 2: xorl 1(<table=%r11,<p22=%r15,8),<z0=%edx
xorl 1(%r11,%r15,8),%edx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#7%next8,>p23=int64#15d
# asm 2: movzbl  <y2=%ah,>p23=%ebp
movzbl  %ah,%ebp

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#9,<p02=int64#10,8),>z2=int64#7d
# asm 2: movl   1(<table=%r11,<p02=%r12,8),>z2=%eax
movl   1(%r11,%r12,8),%eax

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#9,<p13=int64#2,8),<z2=int64#7d
# asm 2: xorl 4(<table=%r11,<p13=%rsi,8),<z2=%eax
xorl 4(%r11,%rsi,8),%eax

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#9,<p20=int64#11,8),<z2=int64#7d
# asm 2: xorl 3(<table=%r11,<p20=%r13,8),<z2=%eax
xorl 3(%r11,%r13,8),%eax

# qhasm:   assign 7 to z2

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#14b,>p30=int64#10d
# asm 2: movzbl  <y3=%bl,>p30=%r12d
movzbl  %bl,%r12d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#14%next8,>p31=int64#2d
# asm 2: movzbl  <y3=%bh,>p31=%esi
movzbl  %bh,%esi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#9,<p31=int64#2,8),<z2=int64#7d
# asm 2: xorl 2(<table=%r11,<p31=%rsi,8),<z2=%eax
xorl 2(%r11,%rsi,8),%eax

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#14d
# asm 2: shr  $16,<y3=%ebx
shr  $16,%ebx

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#14b,>p32=int64#2d
# asm 2: movzbl  <y3=%bl,>p32=%esi
movzbl  %bl,%esi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#9,<p32=int64#2,8),<z1=int64#4d
# asm 2: xorl 1(<table=%r11,<p32=%rsi,8),<z1=%ecx
xorl 1(%r11,%rsi,8),%ecx

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#14%next8,>p33=int64#14d
# asm 2: movzbl  <y3=%bh,>p33=%ebx
movzbl  %bh,%ebx

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#9,<p33=int64#14,8),<z0=int64#3d
# asm 2: xorl 4(<table=%r11,<p33=%rbx,8),<z0=%edx
xorl 4(%r11,%rbx,8),%edx

# qhasm:   z3 = *(uint32 *) (table + 2 + p01 * 8)
# asm 1: movl   2(<table=int64#9,<p01=int64#1,8),>z3=int64#14d
# asm 2: movl   2(<table=%r11,<p01=%rdi,8),>z3=%ebx
movl   2(%r11,%rdi,8),%ebx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#9,<p12=int64#12,8),<z3=int64#14d
# asm 2: xorl 1(<table=%r11,<p12=%r14,8),<z3=%ebx
xorl 1(%r11,%r14,8),%ebx

# qhasm:   z0 ^= r36
# asm 1: xorq <r36=stack64#45,<z0=int64#3
# asm 2: xorq <r36=352(%rsp),<z0=%rdx
xorq 352(%rsp),%rdx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#9,<p23=int64#15,8),<z3=int64#14d
# asm 2: xorl 4(<table=%r11,<p23=%rbp,8),<z3=%ebx
xorl 4(%r11,%rbp,8),%ebx

# qhasm:   z1 ^= r37
# asm 1: xorq <r37=stack64#46,<z1=int64#4
# asm 2: xorq <r37=360(%rsp),<z1=%rcx
xorq 360(%rsp),%rcx

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#9,<p30=int64#10,8),<z3=int64#14d
# asm 2: xorl 3(<table=%r11,<p30=%r12,8),<z3=%ebx
xorl 3(%r11,%r12,8),%ebx

# qhasm:   assign 14 to z3

# qhasm:   z2 ^= r38
# asm 1: xorq <r38=stack64#47,<z2=int64#7
# asm 2: xorq <r38=368(%rsp),<z2=%rax
xorq 368(%rsp),%rax

# qhasm:   z3 ^= r39
# asm 1: xorq <r39=stack64#48,<z3=int64#14
# asm 2: xorq <r39=376(%rsp),<z3=%rbx
xorq 376(%rsp),%rbx

# qhasm:   y0 = z0 & 255
# asm 1: movzbl  <z0=int64#3b,>y0=int64#1d
# asm 2: movzbl  <z0=%dl,>y0=%edi
movzbl  %dl,%edi

# qhasm:   y0 = *(uint8 *) (table + 1 + y0 * 8)
# asm 1: movzbq 1(<table=int64#9,<y0=int64#1,8),>y0=int64#2
# asm 2: movzbq 1(<table=%r11,<y0=%rdi,8),>y0=%rsi
movzbq 1(%r11,%rdi,8),%rsi

# qhasm:   y3 = (z0 >> 8) & 255
# asm 1: movzbl  <z0=int64#3%next8,>y3=int64#1d
# asm 2: movzbl  <z0=%dh,>y3=%edi
movzbl  %dh,%edi

# qhasm:   y3 = *(uint16 *) (table + y3 * 8)
# asm 1: movzwq (<table=int64#9,<y3=int64#1,8),>y3=int64#10
# asm 2: movzwq (<table=%r11,<y3=%rdi,8),>y3=%r12
movzwq (%r11,%rdi,8),%r12

# qhasm:   (uint32) z0 >>= 16
# asm 1: shr  $16,<z0=int64#3d
# asm 2: shr  $16,<z0=%edx
shr  $16,%edx

# qhasm:   y2 = z0 & 255
# asm 1: movzbl  <z0=int64#3b,>y2=int64#1d
# asm 2: movzbl  <z0=%dl,>y2=%edi
movzbl  %dl,%edi

# qhasm:   y2 = *(uint32 *) (table + 3 + y2 * 8)
# asm 1: movl   3(<table=int64#9,<y2=int64#1,8),>y2=int64#11d
# asm 2: movl   3(<table=%r11,<y2=%rdi,8),>y2=%r13d
movl   3(%r11,%rdi,8),%r13d

# qhasm:   (uint32) y2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<y2=int64#11d
# asm 2: and  $0x00ff0000,<y2=%r13d
and  $0x00ff0000,%r13d

# qhasm:   y1 = (z0 >> 8) & 255
# asm 1: movzbl  <z0=int64#3%next8,>y1=int64#1d
# asm 2: movzbl  <z0=%dh,>y1=%edi
movzbl  %dh,%edi

# qhasm:   y1 = *(uint32 *) (table + 2 + y1 * 8)
# asm 1: movl   2(<table=int64#9,<y1=int64#1,8),>y1=int64#3d
# asm 2: movl   2(<table=%r11,<y1=%rdi,8),>y1=%edx
movl   2(%r11,%rdi,8),%edx

# qhasm:   (uint32) y1 &= 0xff000000
# asm 1: and  $0xff000000,<y1=int64#3d
# asm 2: and  $0xff000000,<y1=%edx
and  $0xff000000,%edx

# qhasm:   y0 ^= r40
# asm 1: xorq <r40=stack64#49,<y0=int64#2
# asm 2: xorq <r40=384(%rsp),<y0=%rsi
xorq 384(%rsp),%rsi

# qhasm:   y3 ^= r43
# asm 1: xorq <r43=stack64#52,<y3=int64#10
# asm 2: xorq <r43=408(%rsp),<y3=%r12
xorq 408(%rsp),%r12

# qhasm:   y1 ^= r41
# asm 1: xorq <r41=stack64#50,<y1=int64#3
# asm 2: xorq <r41=392(%rsp),<y1=%rdx
xorq 392(%rsp),%rdx

# qhasm:   y2 ^= r42
# asm 1: xorq <r42=stack64#51,<y2=int64#11
# asm 2: xorq <r42=400(%rsp),<y2=%r13
xorq 400(%rsp),%r13

# qhasm:   q10 = z1 & 255
# asm 1: movzbl  <z1=int64#4b,>q10=int64#1d
# asm 2: movzbl  <z1=%cl,>q10=%edi
movzbl  %cl,%edi

# qhasm:   q10 = *(uint8 *) (table + 1 + q10 * 8)
# asm 1: movzbq 1(<table=int64#9,<q10=int64#1,8),>q10=int64#1
# asm 2: movzbq 1(<table=%r11,<q10=%rdi,8),>q10=%rdi
movzbq 1(%r11,%rdi,8),%rdi

# qhasm:   y1 ^= q10
# asm 1: xor  <q10=int64#1,<y1=int64#3
# asm 2: xor  <q10=%rdi,<y1=%rdx
xor  %rdi,%rdx

# qhasm:   q11 = (z1 >> 8) & 255
# asm 1: movzbl  <z1=int64#4%next8,>q11=int64#1d
# asm 2: movzbl  <z1=%ch,>q11=%edi
movzbl  %ch,%edi

# qhasm:   q11 = *(uint16 *) (table + q11 * 8)
# asm 1: movzwq (<table=int64#9,<q11=int64#1,8),>q11=int64#1
# asm 2: movzwq (<table=%r11,<q11=%rdi,8),>q11=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm:   y0 ^= q11
# asm 1: xor  <q11=int64#1,<y0=int64#2
# asm 2: xor  <q11=%rdi,<y0=%rsi
xor  %rdi,%rsi

# qhasm:   (uint32) z1 >>= 16
# asm 1: shr  $16,<z1=int64#4d
# asm 2: shr  $16,<z1=%ecx
shr  $16,%ecx

# qhasm:   q12 = z1 & 255
# asm 1: movzbl  <z1=int64#4b,>q12=int64#1d
# asm 2: movzbl  <z1=%cl,>q12=%edi
movzbl  %cl,%edi

# qhasm:   q12 = *(uint32 *) (table + 3 + q12 * 8)
# asm 1: movl   3(<table=int64#9,<q12=int64#1,8),>q12=int64#1d
# asm 2: movl   3(<table=%r11,<q12=%rdi,8),>q12=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm:   (uint32) q12 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q12=int64#1d
# asm 2: and  $0x00ff0000,<q12=%edi
and  $0x00ff0000,%edi

# qhasm:   y3 ^= q12
# asm 1: xor  <q12=int64#1,<y3=int64#10
# asm 2: xor  <q12=%rdi,<y3=%r12
xor  %rdi,%r12

# qhasm:   q13 = (z1 >> 8) & 255
# asm 1: movzbl  <z1=int64#4%next8,>q13=int64#1d
# asm 2: movzbl  <z1=%ch,>q13=%edi
movzbl  %ch,%edi

# qhasm:   q13 = *(uint32 *) (table + 2 + q13 * 8)
# asm 1: movl   2(<table=int64#9,<q13=int64#1,8),>q13=int64#1d
# asm 2: movl   2(<table=%r11,<q13=%rdi,8),>q13=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm:   (uint32) q13 &= 0xff000000
# asm 1: and  $0xff000000,<q13=int64#1d
# asm 2: and  $0xff000000,<q13=%edi
and  $0xff000000,%edi

# qhasm:   y2 ^= q13
# asm 1: xor  <q13=int64#1,<y2=int64#11
# asm 2: xor  <q13=%rdi,<y2=%r13
xor  %rdi,%r13

# qhasm:   q20 = z2 & 255
# asm 1: movzbl  <z2=int64#7b,>q20=int64#1d
# asm 2: movzbl  <z2=%al,>q20=%edi
movzbl  %al,%edi

# qhasm:   q20 = *(uint8 *) (table + 1 + q20 * 8)
# asm 1: movzbq 1(<table=int64#9,<q20=int64#1,8),>q20=int64#1
# asm 2: movzbq 1(<table=%r11,<q20=%rdi,8),>q20=%rdi
movzbq 1(%r11,%rdi,8),%rdi

# qhasm:   y2 ^= q20
# asm 1: xor  <q20=int64#1,<y2=int64#11
# asm 2: xor  <q20=%rdi,<y2=%r13
xor  %rdi,%r13

# qhasm:   q21 = (z2 >> 8) & 255
# asm 1: movzbl  <z2=int64#7%next8,>q21=int64#1d
# asm 2: movzbl  <z2=%ah,>q21=%edi
movzbl  %ah,%edi

# qhasm:   q21 = *(uint16 *) (table + q21 * 8)
# asm 1: movzwq (<table=int64#9,<q21=int64#1,8),>q21=int64#1
# asm 2: movzwq (<table=%r11,<q21=%rdi,8),>q21=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm:   y1 ^= q21
# asm 1: xor  <q21=int64#1,<y1=int64#3
# asm 2: xor  <q21=%rdi,<y1=%rdx
xor  %rdi,%rdx

# qhasm:   (uint32) z2 >>= 16
# asm 1: shr  $16,<z2=int64#7d
# asm 2: shr  $16,<z2=%eax
shr  $16,%eax

# qhasm:   q22 = z2 & 255
# asm 1: movzbl  <z2=int64#7b,>q22=int64#1d
# asm 2: movzbl  <z2=%al,>q22=%edi
movzbl  %al,%edi

# qhasm:   q22 = *(uint32 *) (table + 3 + q22 * 8)
# asm 1: movl   3(<table=int64#9,<q22=int64#1,8),>q22=int64#1d
# asm 2: movl   3(<table=%r11,<q22=%rdi,8),>q22=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm:   (uint32) q22 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q22=int64#1d
# asm 2: and  $0x00ff0000,<q22=%edi
and  $0x00ff0000,%edi

# qhasm:   y0 ^= q22
# asm 1: xor  <q22=int64#1,<y0=int64#2
# asm 2: xor  <q22=%rdi,<y0=%rsi
xor  %rdi,%rsi

# qhasm:   q23 = (z2 >> 8) & 255
# asm 1: movzbl  <z2=int64#7%next8,>q23=int64#1d
# asm 2: movzbl  <z2=%ah,>q23=%edi
movzbl  %ah,%edi

# qhasm:   q23 = *(uint32 *) (table + 2 + q23 * 8)
# asm 1: movl   2(<table=int64#9,<q23=int64#1,8),>q23=int64#1d
# asm 2: movl   2(<table=%r11,<q23=%rdi,8),>q23=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm:   (uint32) q23 &= 0xff000000
# asm 1: and  $0xff000000,<q23=int64#1d
# asm 2: and  $0xff000000,<q23=%edi
and  $0xff000000,%edi

# qhasm:   y3 ^= q23
# asm 1: xor  <q23=int64#1,<y3=int64#10
# asm 2: xor  <q23=%rdi,<y3=%r12
xor  %rdi,%r12

# qhasm:   q30 = z3 & 255
# asm 1: movzbl  <z3=int64#14b,>q30=int64#1d
# asm 2: movzbl  <z3=%bl,>q30=%edi
movzbl  %bl,%edi

# qhasm:   q30 = *(uint8 *) (table + 1 + q30 * 8)
# asm 1: movzbq 1(<table=int64#9,<q30=int64#1,8),>q30=int64#1
# asm 2: movzbq 1(<table=%r11,<q30=%rdi,8),>q30=%rdi
movzbq 1(%r11,%rdi,8),%rdi

# qhasm:   y3 ^= q30
# asm 1: xor  <q30=int64#1,<y3=int64#10
# asm 2: xor  <q30=%rdi,<y3=%r12
xor  %rdi,%r12

# qhasm:   q31 = (z3 >> 8) & 255
# asm 1: movzbl  <z3=int64#14%next8,>q31=int64#1d
# asm 2: movzbl  <z3=%bh,>q31=%edi
movzbl  %bh,%edi

# qhasm:   q31 = *(uint16 *) (table + q31 * 8)
# asm 1: movzwq (<table=int64#9,<q31=int64#1,8),>q31=int64#1
# asm 2: movzwq (<table=%r11,<q31=%rdi,8),>q31=%rdi
movzwq (%r11,%rdi,8),%rdi

# qhasm:   y2 ^= q31
# asm 1: xor  <q31=int64#1,<y2=int64#11
# asm 2: xor  <q31=%rdi,<y2=%r13
xor  %rdi,%r13

# qhasm:   (uint32) z3 >>= 16
# asm 1: shr  $16,<z3=int64#14d
# asm 2: shr  $16,<z3=%ebx
shr  $16,%ebx

# qhasm:   q32 = z3 & 255
# asm 1: movzbl  <z3=int64#14b,>q32=int64#1d
# asm 2: movzbl  <z3=%bl,>q32=%edi
movzbl  %bl,%edi

# qhasm:   q32 = *(uint32 *) (table + 3 + q32 * 8)
# asm 1: movl   3(<table=int64#9,<q32=int64#1,8),>q32=int64#1d
# asm 2: movl   3(<table=%r11,<q32=%rdi,8),>q32=%edi
movl   3(%r11,%rdi,8),%edi

# qhasm:   (uint32) q32 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q32=int64#1d
# asm 2: and  $0x00ff0000,<q32=%edi
and  $0x00ff0000,%edi

# qhasm:   y1 ^= q32
# asm 1: xor  <q32=int64#1,<y1=int64#3
# asm 2: xor  <q32=%rdi,<y1=%rdx
xor  %rdi,%rdx

# qhasm:   q33 = (z3 >> 8) & 255
# asm 1: movzbl  <z3=int64#14%next8,>q33=int64#1d
# asm 2: movzbl  <z3=%bh,>q33=%edi
movzbl  %bh,%edi

# qhasm:   q33 = *(uint32 *) (table + 2 + q33 * 8)
# asm 1: movl   2(<table=int64#9,<q33=int64#1,8),>q33=int64#1d
# asm 2: movl   2(<table=%r11,<q33=%rdi,8),>q33=%edi
movl   2(%r11,%rdi,8),%edi

# qhasm:   (uint32) q33 &= 0xff000000
# asm 1: and  $0xff000000,<q33=int64#1d
# asm 2: and  $0xff000000,<q33=%edi
and  $0xff000000,%edi

# qhasm:   y0 ^= q33
# asm 1: xor  <q33=int64#1,<y0=int64#2
# asm 2: xor  <q33=%rdi,<y0=%rsi
xor  %rdi,%rsi

# qhasm:   in = in_stack
# asm 1: movq <in_stack=stack64#8,>in=int64#1
# asm 2: movq <in_stack=56(%rsp),>in=%rdi
movq 56(%rsp),%rdi

# qhasm:                      unsigned<? len - 16
# asm 1: cmp  $16,<len=int64#5
# asm 2: cmp  $16,<len=%r8
cmp  $16,%r8
# comment:fp stack unchanged by jump

# qhasm:   goto fullblock if !unsigned<
jae ._fullblock

# qhasm:     b0 = *(uint8 *) (in + 0)
# asm 1: movzbq 0(<in=int64#1),>b0=int64#4
# asm 2: movzbq 0(<in=%rdi),>b0=%rcx
movzbq 0(%rdi),%rcx

# qhasm:     b0 ^= y0
# asm 1: xor  <y0=int64#2,<b0=int64#4
# asm 2: xor  <y0=%rsi,<b0=%rcx
xor  %rsi,%rcx

# qhasm:     *(uint8 *) (out + 0) = b0
# asm 1: movb   <b0=int64#4b,0(<out=int64#8)
# asm 2: movb   <b0=%cl,0(<out=%r10)
movb   %cl,0(%r10)

# qhasm:                                 unsigned>? len - 1
# asm 1: cmp  $1,<len=int64#5
# asm 2: cmp  $1,<len=%r8
cmp  $1,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) y0 >>= 8
# asm 1: shr  $8,<y0=int64#2d
# asm 2: shr  $8,<y0=%esi
shr  $8,%esi

# qhasm:     b1 = *(uint8 *) (in + 1)
# asm 1: movzbq 1(<in=int64#1),>b1=int64#4
# asm 2: movzbq 1(<in=%rdi),>b1=%rcx
movzbq 1(%rdi),%rcx

# qhasm:     b1 ^= y0
# asm 1: xor  <y0=int64#2,<b1=int64#4
# asm 2: xor  <y0=%rsi,<b1=%rcx
xor  %rsi,%rcx

# qhasm:     *(uint8 *) (out + 1) = b1
# asm 1: movb   <b1=int64#4b,1(<out=int64#8)
# asm 2: movb   <b1=%cl,1(<out=%r10)
movb   %cl,1(%r10)

# qhasm:                                 unsigned>? len - 2
# asm 1: cmp  $2,<len=int64#5
# asm 2: cmp  $2,<len=%r8
cmp  $2,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) y0 >>= 8
# asm 1: shr  $8,<y0=int64#2d
# asm 2: shr  $8,<y0=%esi
shr  $8,%esi

# qhasm:     b2 = *(uint8 *) (in + 2)
# asm 1: movzbq 2(<in=int64#1),>b2=int64#4
# asm 2: movzbq 2(<in=%rdi),>b2=%rcx
movzbq 2(%rdi),%rcx

# qhasm:     b2 ^= y0
# asm 1: xor  <y0=int64#2,<b2=int64#4
# asm 2: xor  <y0=%rsi,<b2=%rcx
xor  %rsi,%rcx

# qhasm:     *(uint8 *) (out + 2) = b2
# asm 1: movb   <b2=int64#4b,2(<out=int64#8)
# asm 2: movb   <b2=%cl,2(<out=%r10)
movb   %cl,2(%r10)

# qhasm:                                 unsigned>? len - 3
# asm 1: cmp  $3,<len=int64#5
# asm 2: cmp  $3,<len=%r8
cmp  $3,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) y0 >>= 8
# asm 1: shr  $8,<y0=int64#2d
# asm 2: shr  $8,<y0=%esi
shr  $8,%esi

# qhasm:     b3 = *(uint8 *) (in + 3)
# asm 1: movzbq 3(<in=int64#1),>b3=int64#4
# asm 2: movzbq 3(<in=%rdi),>b3=%rcx
movzbq 3(%rdi),%rcx

# qhasm:     b3 ^= y0
# asm 1: xor  <y0=int64#2,<b3=int64#4
# asm 2: xor  <y0=%rsi,<b3=%rcx
xor  %rsi,%rcx

# qhasm:     *(uint8 *) (out + 3) = b3
# asm 1: movb   <b3=int64#4b,3(<out=int64#8)
# asm 2: movb   <b3=%cl,3(<out=%r10)
movb   %cl,3(%r10)

# qhasm:                                 unsigned>? len - 4
# asm 1: cmp  $4,<len=int64#5
# asm 2: cmp  $4,<len=%r8
cmp  $4,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     b0 = *(uint8 *) (in + 4)
# asm 1: movzbq 4(<in=int64#1),>b0=int64#2
# asm 2: movzbq 4(<in=%rdi),>b0=%rsi
movzbq 4(%rdi),%rsi

# qhasm:     b0 ^= y1
# asm 1: xor  <y1=int64#3,<b0=int64#2
# asm 2: xor  <y1=%rdx,<b0=%rsi
xor  %rdx,%rsi

# qhasm:     *(uint8 *) (out + 4) = b0
# asm 1: movb   <b0=int64#2b,4(<out=int64#8)
# asm 2: movb   <b0=%sil,4(<out=%r10)
movb   %sil,4(%r10)

# qhasm:                                 unsigned>? len - 5
# asm 1: cmp  $5,<len=int64#5
# asm 2: cmp  $5,<len=%r8
cmp  $5,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) y1 >>= 8
# asm 1: shr  $8,<y1=int64#3d
# asm 2: shr  $8,<y1=%edx
shr  $8,%edx

# qhasm:     b1 = *(uint8 *) (in + 5)
# asm 1: movzbq 5(<in=int64#1),>b1=int64#2
# asm 2: movzbq 5(<in=%rdi),>b1=%rsi
movzbq 5(%rdi),%rsi

# qhasm:     b1 ^= y1
# asm 1: xor  <y1=int64#3,<b1=int64#2
# asm 2: xor  <y1=%rdx,<b1=%rsi
xor  %rdx,%rsi

# qhasm:     *(uint8 *) (out + 5) = b1
# asm 1: movb   <b1=int64#2b,5(<out=int64#8)
# asm 2: movb   <b1=%sil,5(<out=%r10)
movb   %sil,5(%r10)

# qhasm:                                 unsigned>? len - 6
# asm 1: cmp  $6,<len=int64#5
# asm 2: cmp  $6,<len=%r8
cmp  $6,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) y1 >>= 8
# asm 1: shr  $8,<y1=int64#3d
# asm 2: shr  $8,<y1=%edx
shr  $8,%edx

# qhasm:     b2 = *(uint8 *) (in + 6)
# asm 1: movzbq 6(<in=int64#1),>b2=int64#2
# asm 2: movzbq 6(<in=%rdi),>b2=%rsi
movzbq 6(%rdi),%rsi

# qhasm:     b2 ^= y1
# asm 1: xor  <y1=int64#3,<b2=int64#2
# asm 2: xor  <y1=%rdx,<b2=%rsi
xor  %rdx,%rsi

# qhasm:     *(uint8 *) (out + 6) = b2
# asm 1: movb   <b2=int64#2b,6(<out=int64#8)
# asm 2: movb   <b2=%sil,6(<out=%r10)
movb   %sil,6(%r10)

# qhasm:                                 unsigned>? len - 7
# asm 1: cmp  $7,<len=int64#5
# asm 2: cmp  $7,<len=%r8
cmp  $7,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) y1 >>= 8
# asm 1: shr  $8,<y1=int64#3d
# asm 2: shr  $8,<y1=%edx
shr  $8,%edx

# qhasm:     b3 = *(uint8 *) (in + 7)
# asm 1: movzbq 7(<in=int64#1),>b3=int64#2
# asm 2: movzbq 7(<in=%rdi),>b3=%rsi
movzbq 7(%rdi),%rsi

# qhasm:     b3 ^= y1
# asm 1: xor  <y1=int64#3,<b3=int64#2
# asm 2: xor  <y1=%rdx,<b3=%rsi
xor  %rdx,%rsi

# qhasm:     *(uint8 *) (out + 7) = b3
# asm 1: movb   <b3=int64#2b,7(<out=int64#8)
# asm 2: movb   <b3=%sil,7(<out=%r10)
movb   %sil,7(%r10)

# qhasm:                                 unsigned>? len - 8
# asm 1: cmp  $8,<len=int64#5
# asm 2: cmp  $8,<len=%r8
cmp  $8,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     b0 = *(uint8 *) (in + 8)
# asm 1: movzbq 8(<in=int64#1),>b0=int64#2
# asm 2: movzbq 8(<in=%rdi),>b0=%rsi
movzbq 8(%rdi),%rsi

# qhasm:     b0 ^= y2
# asm 1: xor  <y2=int64#11,<b0=int64#2
# asm 2: xor  <y2=%r13,<b0=%rsi
xor  %r13,%rsi

# qhasm:     *(uint8 *) (out + 8) = b0
# asm 1: movb   <b0=int64#2b,8(<out=int64#8)
# asm 2: movb   <b0=%sil,8(<out=%r10)
movb   %sil,8(%r10)

# qhasm:                                 unsigned>? len - 9
# asm 1: cmp  $9,<len=int64#5
# asm 2: cmp  $9,<len=%r8
cmp  $9,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) y2 >>= 8
# asm 1: shr  $8,<y2=int64#11d
# asm 2: shr  $8,<y2=%r13d
shr  $8,%r13d

# qhasm:     b1 = *(uint8 *) (in + 9)
# asm 1: movzbq 9(<in=int64#1),>b1=int64#2
# asm 2: movzbq 9(<in=%rdi),>b1=%rsi
movzbq 9(%rdi),%rsi

# qhasm:     b1 ^= y2
# asm 1: xor  <y2=int64#11,<b1=int64#2
# asm 2: xor  <y2=%r13,<b1=%rsi
xor  %r13,%rsi

# qhasm:     *(uint8 *) (out + 9) = b1
# asm 1: movb   <b1=int64#2b,9(<out=int64#8)
# asm 2: movb   <b1=%sil,9(<out=%r10)
movb   %sil,9(%r10)

# qhasm:                                 unsigned>? len - 10
# asm 1: cmp  $10,<len=int64#5
# asm 2: cmp  $10,<len=%r8
cmp  $10,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) y2 >>= 8
# asm 1: shr  $8,<y2=int64#11d
# asm 2: shr  $8,<y2=%r13d
shr  $8,%r13d

# qhasm:     b2 = *(uint8 *) (in + 10)
# asm 1: movzbq 10(<in=int64#1),>b2=int64#2
# asm 2: movzbq 10(<in=%rdi),>b2=%rsi
movzbq 10(%rdi),%rsi

# qhasm:     b2 ^= y2
# asm 1: xor  <y2=int64#11,<b2=int64#2
# asm 2: xor  <y2=%r13,<b2=%rsi
xor  %r13,%rsi

# qhasm:     *(uint8 *) (out + 10) = b2
# asm 1: movb   <b2=int64#2b,10(<out=int64#8)
# asm 2: movb   <b2=%sil,10(<out=%r10)
movb   %sil,10(%r10)

# qhasm:                                 unsigned>? len - 11
# asm 1: cmp  $11,<len=int64#5
# asm 2: cmp  $11,<len=%r8
cmp  $11,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) y2 >>= 8
# asm 1: shr  $8,<y2=int64#11d
# asm 2: shr  $8,<y2=%r13d
shr  $8,%r13d

# qhasm:     b3 = *(uint8 *) (in + 11)
# asm 1: movzbq 11(<in=int64#1),>b3=int64#2
# asm 2: movzbq 11(<in=%rdi),>b3=%rsi
movzbq 11(%rdi),%rsi

# qhasm:     b3 ^= y2
# asm 1: xor  <y2=int64#11,<b3=int64#2
# asm 2: xor  <y2=%r13,<b3=%rsi
xor  %r13,%rsi

# qhasm:     *(uint8 *) (out + 11) = b3
# asm 1: movb   <b3=int64#2b,11(<out=int64#8)
# asm 2: movb   <b3=%sil,11(<out=%r10)
movb   %sil,11(%r10)

# qhasm:                                 unsigned>? len - 12
# asm 1: cmp  $12,<len=int64#5
# asm 2: cmp  $12,<len=%r8
cmp  $12,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     b0 = *(uint8 *) (in + 12)
# asm 1: movzbq 12(<in=int64#1),>b0=int64#2
# asm 2: movzbq 12(<in=%rdi),>b0=%rsi
movzbq 12(%rdi),%rsi

# qhasm:     b0 ^= y3
# asm 1: xor  <y3=int64#10,<b0=int64#2
# asm 2: xor  <y3=%r12,<b0=%rsi
xor  %r12,%rsi

# qhasm:     *(uint8 *) (out + 12) = b0
# asm 1: movb   <b0=int64#2b,12(<out=int64#8)
# asm 2: movb   <b0=%sil,12(<out=%r10)
movb   %sil,12(%r10)

# qhasm:                                 unsigned>? len - 13
# asm 1: cmp  $13,<len=int64#5
# asm 2: cmp  $13,<len=%r8
cmp  $13,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) y3 >>= 8
# asm 1: shr  $8,<y3=int64#10d
# asm 2: shr  $8,<y3=%r12d
shr  $8,%r12d

# qhasm:     b1 = *(uint8 *) (in + 13)
# asm 1: movzbq 13(<in=int64#1),>b1=int64#2
# asm 2: movzbq 13(<in=%rdi),>b1=%rsi
movzbq 13(%rdi),%rsi

# qhasm:     b1 ^= y3
# asm 1: xor  <y3=int64#10,<b1=int64#2
# asm 2: xor  <y3=%r12,<b1=%rsi
xor  %r12,%rsi

# qhasm:     *(uint8 *) (out + 13) = b1
# asm 1: movb   <b1=int64#2b,13(<out=int64#8)
# asm 2: movb   <b1=%sil,13(<out=%r10)
movb   %sil,13(%r10)

# qhasm:                                 unsigned>? len - 14
# asm 1: cmp  $14,<len=int64#5
# asm 2: cmp  $14,<len=%r8
cmp  $14,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) y3 >>= 8
# asm 1: shr  $8,<y3=int64#10d
# asm 2: shr  $8,<y3=%r12d
shr  $8,%r12d

# qhasm:     b2 = *(uint8 *) (in + 14)
# asm 1: movzbq 14(<in=int64#1),>b2=int64#2
# asm 2: movzbq 14(<in=%rdi),>b2=%rsi
movzbq 14(%rdi),%rsi

# qhasm:     b2 ^= y3
# asm 1: xor  <y3=int64#10,<b2=int64#2
# asm 2: xor  <y3=%r12,<b2=%rsi
xor  %r12,%rsi

# qhasm:     *(uint8 *) (out + 14) = b2
# asm 1: movb   <b2=int64#2b,14(<out=int64#8)
# asm 2: movb   <b2=%sil,14(<out=%r10)
movb   %sil,14(%r10)

# qhasm:                                 unsigned>? len - 15
# asm 1: cmp  $15,<len=int64#5
# asm 2: cmp  $15,<len=%r8
cmp  $15,%r8
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) y3 >>= 8
# asm 1: shr  $8,<y3=int64#10d
# asm 2: shr  $8,<y3=%r12d
shr  $8,%r12d

# qhasm:     b3 = *(uint8 *) (in + 15)
# asm 1: movzbq 15(<in=int64#1),>b3=int64#1
# asm 2: movzbq 15(<in=%rdi),>b3=%rdi
movzbq 15(%rdi),%rdi

# qhasm:     b3 ^= y3
# asm 1: xor  <y3=int64#10,<b3=int64#1
# asm 2: xor  <y3=%r12,<b3=%rdi
xor  %r12,%rdi

# qhasm:     *(uint8 *) (out + 15) = b3
# asm 1: movb   <b3=int64#1b,15(<out=int64#8)
# asm 2: movb   <b3=%dil,15(<out=%r10)
movb   %dil,15(%r10)
# comment:fp stack unchanged by fallthrough

# qhasm: finishpartialblock:
._finishpartialblock:

# qhasm:     y0 = n0
# asm 1: movq <n0=stack64#53,>y0=int64#3
# asm 2: movq <n0=416(%rsp),>y0=%rdx
movq 416(%rsp),%rdx

# qhasm:     y1 = n1
# asm 1: movq <n1=stack64#54,>y1=int64#4
# asm 2: movq <n1=424(%rsp),>y1=%rcx
movq 424(%rsp),%rcx

# qhasm:     y2 = n2
# asm 1: movq <n2=stack64#55,>y2=int64#7
# asm 2: movq <n2=432(%rsp),>y2=%rax
movq 432(%rsp),%rax

# qhasm:     y3 = n3
# asm 1: movq <n3=stack64#56,>y3=int64#14
# asm 2: movq <n3=440(%rsp),>y3=%rbx
movq 440(%rsp),%rbx

# qhasm:     y0 += 1
# asm 1: add  $1,<y0=int64#3
# asm 2: add  $1,<y0=%rdx
add  $1,%rdx
# comment:fp stack unchanged by jump

# qhasm:   goto done
jmp ._done

# qhasm: fullblock:
._fullblock:

# qhasm:   len -= 16
# asm 1: sub  $16,<len=int64#5
# asm 2: sub  $16,<len=%r8
sub  $16,%r8

# qhasm:   (uint32) y0 ^= *(uint32 *) (in + 0)
# asm 1: xorl 0(<in=int64#1),<y0=int64#2d
# asm 2: xorl 0(<in=%rdi),<y0=%esi
xorl 0(%rdi),%esi

# qhasm:   (uint32) y1 ^= *(uint32 *) (in + 4)
# asm 1: xorl 4(<in=int64#1),<y1=int64#3d
# asm 2: xorl 4(<in=%rdi),<y1=%edx
xorl 4(%rdi),%edx

# qhasm:   (uint32) y2 ^= *(uint32 *) (in + 8)
# asm 1: xorl 8(<in=int64#1),<y2=int64#11d
# asm 2: xorl 8(<in=%rdi),<y2=%r13d
xorl 8(%rdi),%r13d

# qhasm:   (uint32) y3 ^= *(uint32 *) (in + 12)
# asm 1: xorl 12(<in=int64#1),<y3=int64#10d
# asm 2: xorl 12(<in=%rdi),<y3=%r12d
xorl 12(%rdi),%r12d

# qhasm:   in += 16
# asm 1: add  $16,<in=int64#1
# asm 2: add  $16,<in=%rdi
add  $16,%rdi

# qhasm:   *(uint32 *) (out + 0) = y0
# asm 1: movl   <y0=int64#2d,0(<out=int64#8)
# asm 2: movl   <y0=%esi,0(<out=%r10)
movl   %esi,0(%r10)

# qhasm:   *(uint32 *) (out + 4) = y1
# asm 1: movl   <y1=int64#3d,4(<out=int64#8)
# asm 2: movl   <y1=%edx,4(<out=%r10)
movl   %edx,4(%r10)

# qhasm:   *(uint32 *) (out + 8) = y2
# asm 1: movl   <y2=int64#11d,8(<out=int64#8)
# asm 2: movl   <y2=%r13d,8(<out=%r10)
movl   %r13d,8(%r10)

# qhasm:   *(uint32 *) (out + 12) = y3
# asm 1: movl   <y3=int64#10d,12(<out=int64#8)
# asm 2: movl   <y3=%r12d,12(<out=%r10)
movl   %r12d,12(%r10)

# qhasm:   out += 16
# asm 1: add  $16,<out=int64#8
# asm 2: add  $16,<out=%r10
add  $16,%r10

# qhasm: nextloop:
._nextloop:

# qhasm:   y0 = n0
# asm 1: movq <n0=stack64#53,>y0=int64#3
# asm 2: movq <n0=416(%rsp),>y0=%rdx
movq 416(%rsp),%rdx

# qhasm:   y1 = n1
# asm 1: movq <n1=stack64#54,>y1=int64#4
# asm 2: movq <n1=424(%rsp),>y1=%rcx
movq 424(%rsp),%rcx

# qhasm:   y2 = n2
# asm 1: movq <n2=stack64#55,>y2=int64#7
# asm 2: movq <n2=432(%rsp),>y2=%rax
movq 432(%rsp),%rax

# qhasm:   y3 = n3
# asm 1: movq <n3=stack64#56,>y3=int64#14
# asm 2: movq <n3=440(%rsp),>y3=%rbx
movq 440(%rsp),%rbx

# qhasm:   y0 += 1
# asm 1: add  $1,<y0=int64#3
# asm 2: add  $1,<y0=%rdx
add  $1,%rdx

# qhasm:                 unsigned>? len - 0
# asm 1: cmp  $0,<len=int64#5
# asm 2: cmp  $0,<len=%r8
cmp  $0,%r8
# comment:fp stack unchanged by jump

# qhasm:   goto done if !unsigned>
jbe ._done

# qhasm:   in_stack = in
# asm 1: movq <in=int64#1,>in_stack=stack64#8
# asm 2: movq <in=%rdi,>in_stack=56(%rsp)
movq %rdi,56(%rsp)
# comment:fp stack unchanged by jump

# qhasm: goto mainloop
jmp ._mainloop

# qhasm: done:
._done:

# qhasm: *(uint32 *) (c + 56) = y0
# asm 1: movl   <y0=int64#3d,56(<c=int64#6)
# asm 2: movl   <y0=%edx,56(<c=%r9)
movl   %edx,56(%r9)

# qhasm: *(uint32 *) (c + 60) = y1
# asm 1: movl   <y1=int64#4d,60(<c=int64#6)
# asm 2: movl   <y1=%ecx,60(<c=%r9)
movl   %ecx,60(%r9)

# qhasm: *(uint32 *) (c + 64) = y2
# asm 1: movl   <y2=int64#7d,64(<c=int64#6)
# asm 2: movl   <y2=%eax,64(<c=%r9)
movl   %eax,64(%r9)

# qhasm: *(uint32 *) (c + 68) = y3
# asm 1: movl   <y3=int64#14d,68(<c=int64#6)
# asm 2: movl   <y3=%ebx,68(<c=%r9)
movl   %ebx,68(%r9)
# comment:fp stack unchanged by fallthrough

# qhasm: nothingtodo:
._nothingtodo:

# qhasm: r11_caller = r11_stack
# asm 1: movq <r11_stack=stack64#1,>r11_caller=int64#9
# asm 2: movq <r11_stack=0(%rsp),>r11_caller=%r11
movq 0(%rsp),%r11

# qhasm: r12_caller = r12_stack
# asm 1: movq <r12_stack=stack64#2,>r12_caller=int64#10
# asm 2: movq <r12_stack=8(%rsp),>r12_caller=%r12
movq 8(%rsp),%r12

# qhasm: r13_caller = r13_stack
# asm 1: movq <r13_stack=stack64#3,>r13_caller=int64#11
# asm 2: movq <r13_stack=16(%rsp),>r13_caller=%r13
movq 16(%rsp),%r13

# qhasm: r14_caller = r14_stack
# asm 1: movq <r14_stack=stack64#4,>r14_caller=int64#12
# asm 2: movq <r14_stack=24(%rsp),>r14_caller=%r14
movq 24(%rsp),%r14

# qhasm: r15_caller = r15_stack
# asm 1: movq <r15_stack=stack64#5,>r15_caller=int64#13
# asm 2: movq <r15_stack=32(%rsp),>r15_caller=%r15
movq 32(%rsp),%r15

# qhasm: rbx_caller = rbx_stack
# asm 1: movq <rbx_stack=stack64#6,>rbx_caller=int64#14
# asm 2: movq <rbx_stack=40(%rsp),>rbx_caller=%rbx
movq 40(%rsp),%rbx

# qhasm: rbp_caller = rbp_stack
# asm 1: movq <rbp_stack=stack64#7,>rbp_caller=int64#15
# asm 2: movq <rbp_stack=48(%rsp),>rbp_caller=%rbp
movq 48(%rsp),%rbp

# qhasm: leave
add %r11,%rsp
mov %rdi,%rax
mov %rsi,%rdx
ret

# constants
.data
.section .rodata
.p2align 6

aes_constants:
aes_tablex:
.byte 0x00
aes_table2:
.byte 0x63
aes_table1:
.byte 0xa5
aes_table0:
.byte 0xc6
aes_table3:
.long 0xc6a56363
.long 0xf8847c00
.long 0xf8847c7c
.long 0xee997700
.long 0xee997777
.long 0xf68d7b00
.long 0xf68d7b7b
.long 0xff0df200
.long 0xff0df2f2
.long 0xd6bd6b00
.long 0xd6bd6b6b
.long 0xdeb16f00
.long 0xdeb16f6f
.long 0x9154c500
.long 0x9154c5c5
.long 0x60503000
.long 0x60503030
.long 0x02030100
.long 0x02030101
.long 0xcea96700
.long 0xcea96767
.long 0x567d2b00
.long 0x567d2b2b
.long 0xe719fe00
.long 0xe719fefe
.long 0xb562d700
.long 0xb562d7d7
.long 0x4de6ab00
.long 0x4de6abab
.long 0xec9a7600
.long 0xec9a7676
.long 0x8f45ca00
.long 0x8f45caca
.long 0x1f9d8200
.long 0x1f9d8282
.long 0x8940c900
.long 0x8940c9c9
.long 0xfa877d00
.long 0xfa877d7d
.long 0xef15fa00
.long 0xef15fafa
.long 0xb2eb5900
.long 0xb2eb5959
.long 0x8ec94700
.long 0x8ec94747
.long 0xfb0bf000
.long 0xfb0bf0f0
.long 0x41ecad00
.long 0x41ecadad
.long 0xb367d400
.long 0xb367d4d4
.long 0x5ffda200
.long 0x5ffda2a2
.long 0x45eaaf00
.long 0x45eaafaf
.long 0x23bf9c00
.long 0x23bf9c9c
.long 0x53f7a400
.long 0x53f7a4a4
.long 0xe4967200
.long 0xe4967272
.long 0x9b5bc000
.long 0x9b5bc0c0
.long 0x75c2b700
.long 0x75c2b7b7
.long 0xe11cfd00
.long 0xe11cfdfd
.long 0x3dae9300
.long 0x3dae9393
.long 0x4c6a2600
.long 0x4c6a2626
.long 0x6c5a3600
.long 0x6c5a3636
.long 0x7e413f00
.long 0x7e413f3f
.long 0xf502f700
.long 0xf502f7f7
.long 0x834fcc00
.long 0x834fcccc
.long 0x685c3400
.long 0x685c3434
.long 0x51f4a500
.long 0x51f4a5a5
.long 0xd134e500
.long 0xd134e5e5
.long 0xf908f100
.long 0xf908f1f1
.long 0xe2937100
.long 0xe2937171
.long 0xab73d800
.long 0xab73d8d8
.long 0x62533100
.long 0x62533131
.long 0x2a3f1500
.long 0x2a3f1515
.long 0x080c0400
.long 0x080c0404
.long 0x9552c700
.long 0x9552c7c7
.long 0x46652300
.long 0x46652323
.long 0x9d5ec300
.long 0x9d5ec3c3
.long 0x30281800
.long 0x30281818
.long 0x37a19600
.long 0x37a19696
.long 0x0a0f0500
.long 0x0a0f0505
.long 0x2fb59a00
.long 0x2fb59a9a
.long 0x0e090700
.long 0x0e090707
.long 0x24361200
.long 0x24361212
.long 0x1b9b8000
.long 0x1b9b8080
.long 0xdf3de200
.long 0xdf3de2e2
.long 0xcd26eb00
.long 0xcd26ebeb
.long 0x4e692700
.long 0x4e692727
.long 0x7fcdb200
.long 0x7fcdb2b2
.long 0xea9f7500
.long 0xea9f7575
.long 0x121b0900
.long 0x121b0909
.long 0x1d9e8300
.long 0x1d9e8383
.long 0x58742c00
.long 0x58742c2c
.long 0x342e1a00
.long 0x342e1a1a
.long 0x362d1b00
.long 0x362d1b1b
.long 0xdcb26e00
.long 0xdcb26e6e
.long 0xb4ee5a00
.long 0xb4ee5a5a
.long 0x5bfba000
.long 0x5bfba0a0
.long 0xa4f65200
.long 0xa4f65252
.long 0x764d3b00
.long 0x764d3b3b
.long 0xb761d600
.long 0xb761d6d6
.long 0x7dceb300
.long 0x7dceb3b3
.long 0x527b2900
.long 0x527b2929
.long 0xdd3ee300
.long 0xdd3ee3e3
.long 0x5e712f00
.long 0x5e712f2f
.long 0x13978400
.long 0x13978484
.long 0xa6f55300
.long 0xa6f55353
.long 0xb968d100
.long 0xb968d1d1
.long 0x00000000
.long 0x00000000
.long 0xc12ced00
.long 0xc12ceded
.long 0x40602000
.long 0x40602020
.long 0xe31ffc00
.long 0xe31ffcfc
.long 0x79c8b100
.long 0x79c8b1b1
.long 0xb6ed5b00
.long 0xb6ed5b5b
.long 0xd4be6a00
.long 0xd4be6a6a
.long 0x8d46cb00
.long 0x8d46cbcb
.long 0x67d9be00
.long 0x67d9bebe
.long 0x724b3900
.long 0x724b3939
.long 0x94de4a00
.long 0x94de4a4a
.long 0x98d44c00
.long 0x98d44c4c
.long 0xb0e85800
.long 0xb0e85858
.long 0x854acf00
.long 0x854acfcf
.long 0xbb6bd000
.long 0xbb6bd0d0
.long 0xc52aef00
.long 0xc52aefef
.long 0x4fe5aa00
.long 0x4fe5aaaa
.long 0xed16fb00
.long 0xed16fbfb
.long 0x86c54300
.long 0x86c54343
.long 0x9ad74d00
.long 0x9ad74d4d
.long 0x66553300
.long 0x66553333
.long 0x11948500
.long 0x11948585
.long 0x8acf4500
.long 0x8acf4545
.long 0xe910f900
.long 0xe910f9f9
.long 0x04060200
.long 0x04060202
.long 0xfe817f00
.long 0xfe817f7f
.long 0xa0f05000
.long 0xa0f05050
.long 0x78443c00
.long 0x78443c3c
.long 0x25ba9f00
.long 0x25ba9f9f
.long 0x4be3a800
.long 0x4be3a8a8
.long 0xa2f35100
.long 0xa2f35151
.long 0x5dfea300
.long 0x5dfea3a3
.long 0x80c04000
.long 0x80c04040
.long 0x058a8f00
.long 0x058a8f8f
.long 0x3fad9200
.long 0x3fad9292
.long 0x21bc9d00
.long 0x21bc9d9d
.long 0x70483800
.long 0x70483838
.long 0xf104f500
.long 0xf104f5f5
.long 0x63dfbc00
.long 0x63dfbcbc
.long 0x77c1b600
.long 0x77c1b6b6
.long 0xaf75da00
.long 0xaf75dada
.long 0x42632100
.long 0x42632121
.long 0x20301000
.long 0x20301010
.long 0xe51aff00
.long 0xe51affff
.long 0xfd0ef300
.long 0xfd0ef3f3
.long 0xbf6dd200
.long 0xbf6dd2d2
.long 0x814ccd00
.long 0x814ccdcd
.long 0x18140c00
.long 0x18140c0c
.long 0x26351300
.long 0x26351313
.long 0xc32fec00
.long 0xc32fecec
.long 0xbee15f00
.long 0xbee15f5f
.long 0x35a29700
.long 0x35a29797
.long 0x88cc4400
.long 0x88cc4444
.long 0x2e391700
.long 0x2e391717
.long 0x9357c400
.long 0x9357c4c4
.long 0x55f2a700
.long 0x55f2a7a7
.long 0xfc827e00
.long 0xfc827e7e
.long 0x7a473d00
.long 0x7a473d3d
.long 0xc8ac6400
.long 0xc8ac6464
.long 0xbae75d00
.long 0xbae75d5d
.long 0x322b1900
.long 0x322b1919
.long 0xe6957300
.long 0xe6957373
.long 0xc0a06000
.long 0xc0a06060
.long 0x19988100
.long 0x19988181
.long 0x9ed14f00
.long 0x9ed14f4f
.long 0xa37fdc00
.long 0xa37fdcdc
.long 0x44662200
.long 0x44662222
.long 0x547e2a00
.long 0x547e2a2a
.long 0x3bab9000
.long 0x3bab9090
.long 0x0b838800
.long 0x0b838888
.long 0x8cca4600
.long 0x8cca4646
.long 0xc729ee00
.long 0xc729eeee
.long 0x6bd3b800
.long 0x6bd3b8b8
.long 0x283c1400
.long 0x283c1414
.long 0xa779de00
.long 0xa779dede
.long 0xbce25e00
.long 0xbce25e5e
.long 0x161d0b00
.long 0x161d0b0b
.long 0xad76db00
.long 0xad76dbdb
.long 0xdb3be000
.long 0xdb3be0e0
.long 0x64563200
.long 0x64563232
.long 0x744e3a00
.long 0x744e3a3a
.long 0x141e0a00
.long 0x141e0a0a
.long 0x92db4900
.long 0x92db4949
.long 0x0c0a0600
.long 0x0c0a0606
.long 0x486c2400
.long 0x486c2424
.long 0xb8e45c00
.long 0xb8e45c5c
.long 0x9f5dc200
.long 0x9f5dc2c2
.long 0xbd6ed300
.long 0xbd6ed3d3
.long 0x43efac00
.long 0x43efacac
.long 0xc4a66200
.long 0xc4a66262
.long 0x39a89100
.long 0x39a89191
.long 0x31a49500
.long 0x31a49595
.long 0xd337e400
.long 0xd337e4e4
.long 0xf28b7900
.long 0xf28b7979
.long 0xd532e700
.long 0xd532e7e7
.long 0x8b43c800
.long 0x8b43c8c8
.long 0x6e593700
.long 0x6e593737
.long 0xdab76d00
.long 0xdab76d6d
.long 0x018c8d00
.long 0x018c8d8d
.long 0xb164d500
.long 0xb164d5d5
.long 0x9cd24e00
.long 0x9cd24e4e
.long 0x49e0a900
.long 0x49e0a9a9
.long 0xd8b46c00
.long 0xd8b46c6c
.long 0xacfa5600
.long 0xacfa5656
.long 0xf307f400
.long 0xf307f4f4
.long 0xcf25ea00
.long 0xcf25eaea
.long 0xcaaf6500
.long 0xcaaf6565
.long 0xf48e7a00
.long 0xf48e7a7a
.long 0x47e9ae00
.long 0x47e9aeae
.long 0x10180800
.long 0x10180808
.long 0x6fd5ba00
.long 0x6fd5baba
.long 0xf0887800
.long 0xf0887878
.long 0x4a6f2500
.long 0x4a6f2525
.long 0x5c722e00
.long 0x5c722e2e
.long 0x38241c00
.long 0x38241c1c
.long 0x57f1a600
.long 0x57f1a6a6
.long 0x73c7b400
.long 0x73c7b4b4
.long 0x9751c600
.long 0x9751c6c6
.long 0xcb23e800
.long 0xcb23e8e8
.long 0xa17cdd00
.long 0xa17cdddd
.long 0xe89c7400
.long 0xe89c7474
.long 0x3e211f00
.long 0x3e211f1f
.long 0x96dd4b00
.long 0x96dd4b4b
.long 0x61dcbd00
.long 0x61dcbdbd
.long 0x0d868b00
.long 0x0d868b8b
.long 0x0f858a00
.long 0x0f858a8a
.long 0xe0907000
.long 0xe0907070
.long 0x7c423e00
.long 0x7c423e3e
.long 0x71c4b500
.long 0x71c4b5b5
.long 0xccaa6600
.long 0xccaa6666
.long 0x90d84800
.long 0x90d84848
.long 0x06050300
.long 0x06050303
.long 0xf701f600
.long 0xf701f6f6
.long 0x1c120e00
.long 0x1c120e0e
.long 0xc2a36100
.long 0xc2a36161
.long 0x6a5f3500
.long 0x6a5f3535
.long 0xaef95700
.long 0xaef95757
.long 0x69d0b900
.long 0x69d0b9b9
.long 0x17918600
.long 0x17918686
.long 0x9958c100
.long 0x9958c1c1
.long 0x3a271d00
.long 0x3a271d1d
.long 0x27b99e00
.long 0x27b99e9e
.long 0xd938e100
.long 0xd938e1e1
.long 0xeb13f800
.long 0xeb13f8f8
.long 0x2bb39800
.long 0x2bb39898
.long 0x22331100
.long 0x22331111
.long 0xd2bb6900
.long 0xd2bb6969
.long 0xa970d900
.long 0xa970d9d9
.long 0x07898e00
.long 0x07898e8e
.long 0x33a79400
.long 0x33a79494
.long 0x2db69b00
.long 0x2db69b9b
.long 0x3c221e00
.long 0x3c221e1e
.long 0x15928700
.long 0x15928787
.long 0xc920e900
.long 0xc920e9e9
.long 0x8749ce00
.long 0x8749cece
.long 0xaaff5500
.long 0xaaff5555
.long 0x50782800
.long 0x50782828
.long 0xa57adf00
.long 0xa57adfdf
.long 0x038f8c00
.long 0x038f8c8c
.long 0x59f8a100
.long 0x59f8a1a1
.long 0x09808900
.long 0x09808989
.long 0x1a170d00
.long 0x1a170d0d
.long 0x65dabf00
.long 0x65dabfbf
.long 0xd731e600
.long 0xd731e6e6
.long 0x84c64200
.long 0x84c64242
.long 0xd0b86800
.long 0xd0b86868
.long 0x82c34100
.long 0x82c34141
.long 0x29b09900
.long 0x29b09999
.long 0x5a772d00
.long 0x5a772d2d
.long 0x1e110f00
.long 0x1e110f0f
.long 0x7bcbb000
.long 0x7bcbb0b0
.long 0xa8fc5400
.long 0xa8fc5454
.long 0x6dd6bb00
.long 0x6dd6bbbb
.long 0x2c3a1600
.long 0x2c3a1616
