
# qhasm: int64 arg1

# qhasm: int64 arg2

# qhasm: input arg1

# qhasm: input arg2

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

# qhasm: int64 b0

# qhasm: int64 b1

# qhasm: int64 b2

# qhasm: int64 b3

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
# asm 1: mov  <arg1=int64#1,>c=int64#5
# asm 2: mov  <arg1=%rdi,>c=%r8
mov  %rdi,%r8

# qhasm: iv = arg2
# asm 1: mov  <arg2=int64#2,>iv=int64#1
# asm 2: mov  <arg2=%rsi,>iv=%rdi
mov  %rsi,%rdi

# qhasm: x0 = *(uint32 *) (c + 0)
# asm 1: movl   0(<c=int64#5),>x0=int64#2d
# asm 2: movl   0(<c=%r8),>x0=%esi
movl   0(%r8),%esi

# qhasm: x1 = *(uint32 *) (c + 4)
# asm 1: movl   4(<c=int64#5),>x1=int64#3d
# asm 2: movl   4(<c=%r8),>x1=%edx
movl   4(%r8),%edx

# qhasm: x2 = *(uint32 *) (c + 8)
# asm 1: movl   8(<c=int64#5),>x2=int64#4d
# asm 2: movl   8(<c=%r8),>x2=%ecx
movl   8(%r8),%ecx

# qhasm: x3 = *(uint32 *) (c + 12)
# asm 1: movl   12(<c=int64#5),>x3=int64#6d
# asm 2: movl   12(<c=%r8),>x3=%r9d
movl   12(%r8),%r9d

# qhasm: r0 = x0
# asm 1: movq <x0=int64#2,>r0=stack64#8
# asm 2: movq <x0=%rsi,>r0=56(%rsp)
movq %rsi,56(%rsp)

# qhasm: r1 = x1
# asm 1: movq <x1=int64#3,>r1=stack64#9
# asm 2: movq <x1=%rdx,>r1=64(%rsp)
movq %rdx,64(%rsp)

# qhasm: r2 = x2
# asm 1: movq <x2=int64#4,>r2=stack64#10
# asm 2: movq <x2=%rcx,>r2=72(%rsp)
movq %rcx,72(%rsp)

# qhasm: r3 = x3
# asm 1: movq <x3=int64#6,>r3=stack64#11
# asm 2: movq <x3=%r9,>r3=80(%rsp)
movq %r9,80(%rsp)

# qhasm: x0 = *(uint32 *) (c + 16)
# asm 1: movl   16(<c=int64#5),>x0=int64#2d
# asm 2: movl   16(<c=%r8),>x0=%esi
movl   16(%r8),%esi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#3
# asm 2: xor  <x0=%rsi,<x1=%rdx
xor  %rsi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#6
# asm 2: xor  <x2=%rcx,<x3=%r9
xor  %rcx,%r9

# qhasm: r4 = x0
# asm 1: movq <x0=int64#2,>r4=stack64#12
# asm 2: movq <x0=%rsi,>r4=88(%rsp)
movq %rsi,88(%rsp)

# qhasm: r5 = x1
# asm 1: movq <x1=int64#3,>r5=stack64#13
# asm 2: movq <x1=%rdx,>r5=96(%rsp)
movq %rdx,96(%rsp)

# qhasm: r6 = x2
# asm 1: movq <x2=int64#4,>r6=stack64#14
# asm 2: movq <x2=%rcx,>r6=104(%rsp)
movq %rcx,104(%rsp)

# qhasm: r7 = x3
# asm 1: movq <x3=int64#6,>r7=stack64#15
# asm 2: movq <x3=%r9,>r7=112(%rsp)
movq %r9,112(%rsp)

# qhasm: x0 = *(uint32 *) (c + 20)
# asm 1: movl   20(<c=int64#5),>x0=int64#2d
# asm 2: movl   20(<c=%r8),>x0=%esi
movl   20(%r8),%esi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#3
# asm 2: xor  <x0=%rsi,<x1=%rdx
xor  %rsi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#6
# asm 2: xor  <x2=%rcx,<x3=%r9
xor  %rcx,%r9

# qhasm: r8 = x0
# asm 1: movq <x0=int64#2,>r8=stack64#16
# asm 2: movq <x0=%rsi,>r8=120(%rsp)
movq %rsi,120(%rsp)

# qhasm: r9 = x1
# asm 1: movq <x1=int64#3,>r9=stack64#17
# asm 2: movq <x1=%rdx,>r9=128(%rsp)
movq %rdx,128(%rsp)

# qhasm: r10 = x2
# asm 1: movq <x2=int64#4,>r10=stack64#18
# asm 2: movq <x2=%rcx,>r10=136(%rsp)
movq %rcx,136(%rsp)

# qhasm: r11 = x3
# asm 1: movq <x3=int64#6,>r11=stack64#19
# asm 2: movq <x3=%r9,>r11=144(%rsp)
movq %r9,144(%rsp)

# qhasm: x0 = *(uint32 *) (c + 24)
# asm 1: movl   24(<c=int64#5),>x0=int64#2d
# asm 2: movl   24(<c=%r8),>x0=%esi
movl   24(%r8),%esi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#3
# asm 2: xor  <x0=%rsi,<x1=%rdx
xor  %rsi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#6
# asm 2: xor  <x2=%rcx,<x3=%r9
xor  %rcx,%r9

# qhasm: r12 = x0
# asm 1: movq <x0=int64#2,>r12=stack64#20
# asm 2: movq <x0=%rsi,>r12=152(%rsp)
movq %rsi,152(%rsp)

# qhasm: r13 = x1
# asm 1: movq <x1=int64#3,>r13=stack64#21
# asm 2: movq <x1=%rdx,>r13=160(%rsp)
movq %rdx,160(%rsp)

# qhasm: r14 = x2
# asm 1: movq <x2=int64#4,>r14=stack64#22
# asm 2: movq <x2=%rcx,>r14=168(%rsp)
movq %rcx,168(%rsp)

# qhasm: r15 = x3
# asm 1: movq <x3=int64#6,>r15=stack64#23
# asm 2: movq <x3=%r9,>r15=176(%rsp)
movq %r9,176(%rsp)

# qhasm: x0 = *(uint32 *) (c + 28)
# asm 1: movl   28(<c=int64#5),>x0=int64#2d
# asm 2: movl   28(<c=%r8),>x0=%esi
movl   28(%r8),%esi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#3
# asm 2: xor  <x0=%rsi,<x1=%rdx
xor  %rsi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#6
# asm 2: xor  <x2=%rcx,<x3=%r9
xor  %rcx,%r9

# qhasm: r16 = x0
# asm 1: movq <x0=int64#2,>r16=stack64#24
# asm 2: movq <x0=%rsi,>r16=184(%rsp)
movq %rsi,184(%rsp)

# qhasm: r17 = x1
# asm 1: movq <x1=int64#3,>r17=stack64#25
# asm 2: movq <x1=%rdx,>r17=192(%rsp)
movq %rdx,192(%rsp)

# qhasm: r18 = x2
# asm 1: movq <x2=int64#4,>r18=stack64#26
# asm 2: movq <x2=%rcx,>r18=200(%rsp)
movq %rcx,200(%rsp)

# qhasm: r19 = x3
# asm 1: movq <x3=int64#6,>r19=stack64#27
# asm 2: movq <x3=%r9,>r19=208(%rsp)
movq %r9,208(%rsp)

# qhasm: x0 = *(uint32 *) (c + 32)
# asm 1: movl   32(<c=int64#5),>x0=int64#2d
# asm 2: movl   32(<c=%r8),>x0=%esi
movl   32(%r8),%esi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#3
# asm 2: xor  <x0=%rsi,<x1=%rdx
xor  %rsi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#6
# asm 2: xor  <x2=%rcx,<x3=%r9
xor  %rcx,%r9

# qhasm: r20 = x0
# asm 1: movq <x0=int64#2,>r20=stack64#28
# asm 2: movq <x0=%rsi,>r20=216(%rsp)
movq %rsi,216(%rsp)

# qhasm: r21 = x1
# asm 1: movq <x1=int64#3,>r21=stack64#29
# asm 2: movq <x1=%rdx,>r21=224(%rsp)
movq %rdx,224(%rsp)

# qhasm: r22 = x2
# asm 1: movq <x2=int64#4,>r22=stack64#30
# asm 2: movq <x2=%rcx,>r22=232(%rsp)
movq %rcx,232(%rsp)

# qhasm: r23 = x3
# asm 1: movq <x3=int64#6,>r23=stack64#31
# asm 2: movq <x3=%r9,>r23=240(%rsp)
movq %r9,240(%rsp)

# qhasm: x0 = *(uint32 *) (c + 36)
# asm 1: movl   36(<c=int64#5),>x0=int64#2d
# asm 2: movl   36(<c=%r8),>x0=%esi
movl   36(%r8),%esi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#3
# asm 2: xor  <x0=%rsi,<x1=%rdx
xor  %rsi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#6
# asm 2: xor  <x2=%rcx,<x3=%r9
xor  %rcx,%r9

# qhasm: r24 = x0
# asm 1: movq <x0=int64#2,>r24=stack64#32
# asm 2: movq <x0=%rsi,>r24=248(%rsp)
movq %rsi,248(%rsp)

# qhasm: r25 = x1
# asm 1: movq <x1=int64#3,>r25=stack64#33
# asm 2: movq <x1=%rdx,>r25=256(%rsp)
movq %rdx,256(%rsp)

# qhasm: r26 = x2
# asm 1: movq <x2=int64#4,>r26=stack64#34
# asm 2: movq <x2=%rcx,>r26=264(%rsp)
movq %rcx,264(%rsp)

# qhasm: r27 = x3
# asm 1: movq <x3=int64#6,>r27=stack64#35
# asm 2: movq <x3=%r9,>r27=272(%rsp)
movq %r9,272(%rsp)

# qhasm: x0 = *(uint32 *) (c + 40)
# asm 1: movl   40(<c=int64#5),>x0=int64#2d
# asm 2: movl   40(<c=%r8),>x0=%esi
movl   40(%r8),%esi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#3
# asm 2: xor  <x0=%rsi,<x1=%rdx
xor  %rsi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#6
# asm 2: xor  <x2=%rcx,<x3=%r9
xor  %rcx,%r9

# qhasm: r28 = x0
# asm 1: movq <x0=int64#2,>r28=stack64#36
# asm 2: movq <x0=%rsi,>r28=280(%rsp)
movq %rsi,280(%rsp)

# qhasm: r29 = x1
# asm 1: movq <x1=int64#3,>r29=stack64#37
# asm 2: movq <x1=%rdx,>r29=288(%rsp)
movq %rdx,288(%rsp)

# qhasm: r30 = x2
# asm 1: movq <x2=int64#4,>r30=stack64#38
# asm 2: movq <x2=%rcx,>r30=296(%rsp)
movq %rcx,296(%rsp)

# qhasm: r31 = x3
# asm 1: movq <x3=int64#6,>r31=stack64#39
# asm 2: movq <x3=%r9,>r31=304(%rsp)
movq %r9,304(%rsp)

# qhasm: x0 = *(uint32 *) (c + 44)
# asm 1: movl   44(<c=int64#5),>x0=int64#2d
# asm 2: movl   44(<c=%r8),>x0=%esi
movl   44(%r8),%esi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#3
# asm 2: xor  <x0=%rsi,<x1=%rdx
xor  %rsi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#6
# asm 2: xor  <x2=%rcx,<x3=%r9
xor  %rcx,%r9

# qhasm: r32 = x0
# asm 1: movq <x0=int64#2,>r32=stack64#40
# asm 2: movq <x0=%rsi,>r32=312(%rsp)
movq %rsi,312(%rsp)

# qhasm: r33 = x1
# asm 1: movq <x1=int64#3,>r33=stack64#41
# asm 2: movq <x1=%rdx,>r33=320(%rsp)
movq %rdx,320(%rsp)

# qhasm: r34 = x2
# asm 1: movq <x2=int64#4,>r34=stack64#42
# asm 2: movq <x2=%rcx,>r34=328(%rsp)
movq %rcx,328(%rsp)

# qhasm: r35 = x3
# asm 1: movq <x3=int64#6,>r35=stack64#43
# asm 2: movq <x3=%r9,>r35=336(%rsp)
movq %r9,336(%rsp)

# qhasm: x0 = *(uint32 *) (c + 48)
# asm 1: movl   48(<c=int64#5),>x0=int64#2d
# asm 2: movl   48(<c=%r8),>x0=%esi
movl   48(%r8),%esi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#3
# asm 2: xor  <x0=%rsi,<x1=%rdx
xor  %rsi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#6
# asm 2: xor  <x2=%rcx,<x3=%r9
xor  %rcx,%r9

# qhasm: r36 = x0
# asm 1: movq <x0=int64#2,>r36=stack64#44
# asm 2: movq <x0=%rsi,>r36=344(%rsp)
movq %rsi,344(%rsp)

# qhasm: r37 = x1
# asm 1: movq <x1=int64#3,>r37=stack64#45
# asm 2: movq <x1=%rdx,>r37=352(%rsp)
movq %rdx,352(%rsp)

# qhasm: r38 = x2
# asm 1: movq <x2=int64#4,>r38=stack64#46
# asm 2: movq <x2=%rcx,>r38=360(%rsp)
movq %rcx,360(%rsp)

# qhasm: r39 = x3
# asm 1: movq <x3=int64#6,>r39=stack64#47
# asm 2: movq <x3=%r9,>r39=368(%rsp)
movq %r9,368(%rsp)

# qhasm: x0 = *(uint32 *) (c + 52)
# asm 1: movl   52(<c=int64#5),>x0=int64#2d
# asm 2: movl   52(<c=%r8),>x0=%esi
movl   52(%r8),%esi

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int64#2,<x1=int64#3
# asm 2: xor  <x0=%rsi,<x1=%rdx
xor  %rsi,%rdx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int64#3,<x2=int64#4
# asm 2: xor  <x1=%rdx,<x2=%rcx
xor  %rdx,%rcx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int64#4,<x3=int64#6
# asm 2: xor  <x2=%rcx,<x3=%r9
xor  %rcx,%r9

# qhasm: r40 = x0
# asm 1: movq <x0=int64#2,>r40=stack64#48
# asm 2: movq <x0=%rsi,>r40=376(%rsp)
movq %rsi,376(%rsp)

# qhasm: r41 = x1
# asm 1: movq <x1=int64#3,>r41=stack64#49
# asm 2: movq <x1=%rdx,>r41=384(%rsp)
movq %rdx,384(%rsp)

# qhasm: r42 = x2
# asm 1: movq <x2=int64#4,>r42=stack64#50
# asm 2: movq <x2=%rcx,>r42=392(%rsp)
movq %rcx,392(%rsp)

# qhasm: r43 = x3
# asm 1: movq <x3=int64#6,>r43=stack64#51
# asm 2: movq <x3=%r9,>r43=400(%rsp)
movq %r9,400(%rsp)

# qhasm: y0 = *(uint32 *) (iv + 0)
# asm 1: movl   0(<iv=int64#1),>y0=int64#3d
# asm 2: movl   0(<iv=%rdi),>y0=%edx
movl   0(%rdi),%edx

# qhasm: (uint32) bswap y0
# asm 1: bswap <y0=int64#3d
# asm 2: bswap <y0=%edx
bswap %edx

# qhasm: y1 = *(uint32 *) (iv + 4)
# asm 1: movl   4(<iv=int64#1),>y1=int64#4d
# asm 2: movl   4(<iv=%rdi),>y1=%ecx
movl   4(%rdi),%ecx

# qhasm: (uint32) bswap y1
# asm 1: bswap <y1=int64#4d
# asm 2: bswap <y1=%ecx
bswap %ecx

# qhasm: y2 = *(uint32 *) (iv + 8)
# asm 1: movl   8(<iv=int64#1),>y2=int64#7d
# asm 2: movl   8(<iv=%rdi),>y2=%eax
movl   8(%rdi),%eax

# qhasm: (uint32) bswap y2
# asm 1: bswap <y2=int64#7d
# asm 2: bswap <y2=%eax
bswap %eax

# qhasm: y3 = *(uint32 *) (iv + 12)
# asm 1: movl   12(<iv=int64#1),>y3=int64#14d
# asm 2: movl   12(<iv=%rdi),>y3=%ebx
movl   12(%rdi),%ebx

# qhasm: (uint32) bswap y3
# asm 1: bswap <y3=int64#14d
# asm 2: bswap <y3=%ebx
bswap %ebx

# qhasm: assign 3 to y0

# qhasm: assign 4 to y1

# qhasm: assign 7 to y2

# qhasm: assign 14 to y3

# qhasm: table = &aes_tablex
# asm 1: lea  aes_tablex(%rip),>table=int64#2
# asm 2: lea  aes_tablex(%rip),>table=%rsi
lea  aes_tablex(%rip),%rsi

# qhasm:   n0 = y0
# asm 1: movq <y0=int64#3,>n0=stack64#52
# asm 2: movq <y0=%rdx,>n0=408(%rsp)
movq %rdx,408(%rsp)

# qhasm:   n1 = y1
# asm 1: movq <y1=int64#4,>n1=stack64#53
# asm 2: movq <y1=%rcx,>n1=416(%rsp)
movq %rcx,416(%rsp)

# qhasm:   n2 = y2
# asm 1: movq <y2=int64#7,>n2=stack64#54
# asm 2: movq <y2=%rax,>n2=424(%rsp)
movq %rax,424(%rsp)

# qhasm:   n3 = y3
# asm 1: movq <y3=int64#14,>n3=stack64#55
# asm 2: movq <y3=%rbx,>n3=432(%rsp)
movq %rbx,432(%rsp)

# qhasm:   y0 ^= r0
# asm 1: xorq <r0=stack64#8,<y0=int64#3
# asm 2: xorq <r0=56(%rsp),<y0=%rdx
xorq 56(%rsp),%rdx

# qhasm:   y1 ^= r1
# asm 1: xorq <r1=stack64#9,<y1=int64#4
# asm 2: xorq <r1=64(%rsp),<y1=%rcx
xorq 64(%rsp),%rcx

# qhasm:   y2 ^= r2
# asm 1: xorq <r2=stack64#10,<y2=int64#7
# asm 2: xorq <r2=72(%rsp),<y2=%rax
xorq 72(%rsp),%rax

# qhasm:   y3 ^= r3
# asm 1: xorq <r3=stack64#11,<y3=int64#14
# asm 2: xorq <r3=80(%rsp),<y3=%rbx
xorq 80(%rsp),%rbx

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#3b,>p00=int64#1d
# asm 2: movzbl  <y0=%dl,>p00=%edi
movzbl  %dl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#2,<p00=int64#1,8),>z0=int64#6d
# asm 2: movl   3(<table=%rsi,<p00=%rdi,8),>z0=%r9d
movl   3(%rsi,%rdi,8),%r9d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#3%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%dh,>p03=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#3d
# asm 2: shr  $16,<y0=%edx
shr  $16,%edx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#2,<p03=int64#1,8),>z3=int64#8d
# asm 2: movl   2(<table=%rsi,<p03=%rdi,8),>z3=%r10d
movl   2(%rsi,%rdi,8),%r10d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#3b,>p02=int64#1d
# asm 2: movzbl  <y0=%dl,>p02=%edi
movzbl  %dl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#2,<p02=int64#1,8),>z2=int64#9d
# asm 2: movl   1(<table=%rsi,<p02=%rdi,8),>z2=%r11d
movl   1(%rsi,%rdi,8),%r11d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#3%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%dh,>p01=%edi
movzbl  %dh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#2,<p01=int64#1,8),>z1=int64#3d
# asm 2: movl   4(<table=%rsi,<p01=%rdi,8),>z1=%edx
movl   4(%rsi,%rdi,8),%edx

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#1d
# asm 2: movzbl  <y1=%cl,>p10=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#2,<p10=int64#1,8),<z1=int64#3d
# asm 2: xorl 3(<table=%rsi,<p10=%rdi,8),<z1=%edx
xorl 3(%rsi,%rdi,8),%edx

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%ch,>p11=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#2,<p11=int64#1,8),<z0=int64#6d
# asm 2: xorl 2(<table=%rsi,<p11=%rdi,8),<z0=%r9d
xorl 2(%rsi,%rdi,8),%r9d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#1d
# asm 2: movzbl  <y1=%cl,>p12=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#2,<p12=int64#1,8),<z3=int64#8d
# asm 2: xorl 1(<table=%rsi,<p12=%rdi,8),<z3=%r10d
xorl 1(%rsi,%rdi,8),%r10d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%ch,>p13=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#2,<p13=int64#1,8),<z2=int64#9d
# asm 2: xorl 4(<table=%rsi,<p13=%rdi,8),<z2=%r11d
xorl 4(%rsi,%rdi,8),%r11d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#7b,>p20=int64#1d
# asm 2: movzbl  <y2=%al,>p20=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#2,<p20=int64#1,8),<z2=int64#9d
# asm 2: xorl 3(<table=%rsi,<p20=%rdi,8),<z2=%r11d
xorl 3(%rsi,%rdi,8),%r11d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#7%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%ah,>p21=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#2,<p21=int64#1,8),<z1=int64#3d
# asm 2: xorl 2(<table=%rsi,<p21=%rdi,8),<z1=%edx
xorl 2(%rsi,%rdi,8),%edx

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#7d
# asm 2: shr  $16,<y2=%eax
shr  $16,%eax

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#7b,>p22=int64#1d
# asm 2: movzbl  <y2=%al,>p22=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#2,<p22=int64#1,8),<z0=int64#6d
# asm 2: xorl 1(<table=%rsi,<p22=%rdi,8),<z0=%r9d
xorl 1(%rsi,%rdi,8),%r9d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#7%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%ah,>p23=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#2,<p23=int64#1,8),<z3=int64#8d
# asm 2: xorl 4(<table=%rsi,<p23=%rdi,8),<z3=%r10d
xorl 4(%rsi,%rdi,8),%r10d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#14b,>p30=int64#1d
# asm 2: movzbl  <y3=%bl,>p30=%edi
movzbl  %bl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#2,<p30=int64#1,8),<z3=int64#8d
# asm 2: xorl 3(<table=%rsi,<p30=%rdi,8),<z3=%r10d
xorl 3(%rsi,%rdi,8),%r10d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#14%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%bh,>p31=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#2,<p31=int64#1,8),<z2=int64#9d
# asm 2: xorl 2(<table=%rsi,<p31=%rdi,8),<z2=%r11d
xorl 2(%rsi,%rdi,8),%r11d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#14d
# asm 2: shr  $16,<y3=%ebx
shr  $16,%ebx

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#14b,>p32=int64#1d
# asm 2: movzbl  <y3=%bl,>p32=%edi
movzbl  %bl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#2,<p32=int64#1,8),<z1=int64#3d
# asm 2: xorl 1(<table=%rsi,<p32=%rdi,8),<z1=%edx
xorl 1(%rsi,%rdi,8),%edx

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#14%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%bh,>p33=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#2,<p33=int64#1,8),<z0=int64#6d
# asm 2: xorl 4(<table=%rsi,<p33=%rdi,8),<z0=%r9d
xorl 4(%rsi,%rdi,8),%r9d

# qhasm:   y0 = r4
# asm 1: movq <r4=stack64#12,>y0=int64#14
# asm 2: movq <r4=88(%rsp),>y0=%rbx
movq 88(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#6,<y0=int64#14
# asm 2: xor  <z0=%r9,<y0=%rbx
xor  %r9,%rbx

# qhasm:   y1 = r5
# asm 1: movq <r5=stack64#13,>y1=int64#4
# asm 2: movq <r5=96(%rsp),>y1=%rcx
movq 96(%rsp),%rcx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#3,<y1=int64#4
# asm 2: xor  <z1=%rdx,<y1=%rcx
xor  %rdx,%rcx

# qhasm:   y2 = r6
# asm 1: movq <r6=stack64#14,>y2=int64#3
# asm 2: movq <r6=104(%rsp),>y2=%rdx
movq 104(%rsp),%rdx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#9,<y2=int64#3
# asm 2: xor  <z2=%r11,<y2=%rdx
xor  %r11,%rdx

# qhasm:   y3 = r7
# asm 1: movq <r7=stack64#15,>y3=int64#7
# asm 2: movq <r7=112(%rsp),>y3=%rax
movq 112(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#8,<y3=int64#7
# asm 2: xor  <z3=%r10,<y3=%rax
xor  %r10,%rax

# qhasm: assign 3 to y2

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#2,<p00=int64#1,8),>z0=int64#6d
# asm 2: movl   3(<table=%rsi,<p00=%rdi,8),>z0=%r9d
movl   3(%rsi,%rdi,8),%r9d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#2,<p03=int64#1,8),>z3=int64#8d
# asm 2: movl   2(<table=%rsi,<p03=%rdi,8),>z3=%r10d
movl   2(%rsi,%rdi,8),%r10d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#2,<p02=int64#1,8),>z2=int64#9d
# asm 2: movl   1(<table=%rsi,<p02=%rdi,8),>z2=%r11d
movl   1(%rsi,%rdi,8),%r11d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#2,<p01=int64#1,8),>z1=int64#10d
# asm 2: movl   4(<table=%rsi,<p01=%rdi,8),>z1=%r12d
movl   4(%rsi,%rdi,8),%r12d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#1d
# asm 2: movzbl  <y1=%cl,>p10=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#2,<p10=int64#1,8),<z1=int64#10d
# asm 2: xorl 3(<table=%rsi,<p10=%rdi,8),<z1=%r12d
xorl 3(%rsi,%rdi,8),%r12d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%ch,>p11=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#2,<p11=int64#1,8),<z0=int64#6d
# asm 2: xorl 2(<table=%rsi,<p11=%rdi,8),<z0=%r9d
xorl 2(%rsi,%rdi,8),%r9d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#1d
# asm 2: movzbl  <y1=%cl,>p12=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#2,<p12=int64#1,8),<z3=int64#8d
# asm 2: xorl 1(<table=%rsi,<p12=%rdi,8),<z3=%r10d
xorl 1(%rsi,%rdi,8),%r10d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%ch,>p13=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#2,<p13=int64#1,8),<z2=int64#9d
# asm 2: xorl 4(<table=%rsi,<p13=%rdi,8),<z2=%r11d
xorl 4(%rsi,%rdi,8),%r11d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p20=int64#1d
# asm 2: movzbl  <y2=%dl,>p20=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#2,<p20=int64#1,8),<z2=int64#9d
# asm 2: xorl 3(<table=%rsi,<p20=%rdi,8),<z2=%r11d
xorl 3(%rsi,%rdi,8),%r11d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%dh,>p21=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#2,<p21=int64#1,8),<z1=int64#10d
# asm 2: xorl 2(<table=%rsi,<p21=%rdi,8),<z1=%r12d
xorl 2(%rsi,%rdi,8),%r12d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#3d
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p22=int64#1d
# asm 2: movzbl  <y2=%dl,>p22=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#2,<p22=int64#1,8),<z0=int64#6d
# asm 2: xorl 1(<table=%rsi,<p22=%rdi,8),<z0=%r9d
xorl 1(%rsi,%rdi,8),%r9d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%dh,>p23=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#2,<p23=int64#1,8),<z3=int64#8d
# asm 2: xorl 4(<table=%rsi,<p23=%rdi,8),<z3=%r10d
xorl 4(%rsi,%rdi,8),%r10d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#2,<p30=int64#1,8),<z3=int64#8d
# asm 2: xorl 3(<table=%rsi,<p30=%rdi,8),<z3=%r10d
xorl 3(%rsi,%rdi,8),%r10d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#2,<p31=int64#1,8),<z2=int64#9d
# asm 2: xorl 2(<table=%rsi,<p31=%rdi,8),<z2=%r11d
xorl 2(%rsi,%rdi,8),%r11d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#2,<p32=int64#1,8),<z1=int64#10d
# asm 2: xorl 1(<table=%rsi,<p32=%rdi,8),<z1=%r12d
xorl 1(%rsi,%rdi,8),%r12d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#2,<p33=int64#1,8),<z0=int64#6d
# asm 2: xorl 4(<table=%rsi,<p33=%rdi,8),<z0=%r9d
xorl 4(%rsi,%rdi,8),%r9d

# qhasm:   y0 = r8
# asm 1: movq <r8=stack64#16,>y0=int64#14
# asm 2: movq <r8=120(%rsp),>y0=%rbx
movq 120(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#6,<y0=int64#14
# asm 2: xor  <z0=%r9,<y0=%rbx
xor  %r9,%rbx

# qhasm:   y1 = r9
# asm 1: movq <r9=stack64#17,>y1=int64#4
# asm 2: movq <r9=128(%rsp),>y1=%rcx
movq 128(%rsp),%rcx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#10,<y1=int64#4
# asm 2: xor  <z1=%r12,<y1=%rcx
xor  %r12,%rcx

# qhasm:   y2 = r10
# asm 1: movq <r10=stack64#18,>y2=int64#3
# asm 2: movq <r10=136(%rsp),>y2=%rdx
movq 136(%rsp),%rdx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#9,<y2=int64#3
# asm 2: xor  <z2=%r11,<y2=%rdx
xor  %r11,%rdx

# qhasm:   y3 = r11
# asm 1: movq <r11=stack64#19,>y3=int64#7
# asm 2: movq <r11=144(%rsp),>y3=%rax
movq 144(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#8,<y3=int64#7
# asm 2: xor  <z3=%r10,<y3=%rax
xor  %r10,%rax

# qhasm: assign 3 to y2

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#2,<p00=int64#1,8),>z0=int64#6d
# asm 2: movl   3(<table=%rsi,<p00=%rdi,8),>z0=%r9d
movl   3(%rsi,%rdi,8),%r9d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#2,<p03=int64#1,8),>z3=int64#8d
# asm 2: movl   2(<table=%rsi,<p03=%rdi,8),>z3=%r10d
movl   2(%rsi,%rdi,8),%r10d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#2,<p02=int64#1,8),>z2=int64#9d
# asm 2: movl   1(<table=%rsi,<p02=%rdi,8),>z2=%r11d
movl   1(%rsi,%rdi,8),%r11d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#2,<p01=int64#1,8),>z1=int64#10d
# asm 2: movl   4(<table=%rsi,<p01=%rdi,8),>z1=%r12d
movl   4(%rsi,%rdi,8),%r12d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#1d
# asm 2: movzbl  <y1=%cl,>p10=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#2,<p10=int64#1,8),<z1=int64#10d
# asm 2: xorl 3(<table=%rsi,<p10=%rdi,8),<z1=%r12d
xorl 3(%rsi,%rdi,8),%r12d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%ch,>p11=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#2,<p11=int64#1,8),<z0=int64#6d
# asm 2: xorl 2(<table=%rsi,<p11=%rdi,8),<z0=%r9d
xorl 2(%rsi,%rdi,8),%r9d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#1d
# asm 2: movzbl  <y1=%cl,>p12=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#2,<p12=int64#1,8),<z3=int64#8d
# asm 2: xorl 1(<table=%rsi,<p12=%rdi,8),<z3=%r10d
xorl 1(%rsi,%rdi,8),%r10d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%ch,>p13=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#2,<p13=int64#1,8),<z2=int64#9d
# asm 2: xorl 4(<table=%rsi,<p13=%rdi,8),<z2=%r11d
xorl 4(%rsi,%rdi,8),%r11d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p20=int64#1d
# asm 2: movzbl  <y2=%dl,>p20=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#2,<p20=int64#1,8),<z2=int64#9d
# asm 2: xorl 3(<table=%rsi,<p20=%rdi,8),<z2=%r11d
xorl 3(%rsi,%rdi,8),%r11d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%dh,>p21=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#2,<p21=int64#1,8),<z1=int64#10d
# asm 2: xorl 2(<table=%rsi,<p21=%rdi,8),<z1=%r12d
xorl 2(%rsi,%rdi,8),%r12d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#3d
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p22=int64#1d
# asm 2: movzbl  <y2=%dl,>p22=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#2,<p22=int64#1,8),<z0=int64#6d
# asm 2: xorl 1(<table=%rsi,<p22=%rdi,8),<z0=%r9d
xorl 1(%rsi,%rdi,8),%r9d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%dh,>p23=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#2,<p23=int64#1,8),<z3=int64#8d
# asm 2: xorl 4(<table=%rsi,<p23=%rdi,8),<z3=%r10d
xorl 4(%rsi,%rdi,8),%r10d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#2,<p30=int64#1,8),<z3=int64#8d
# asm 2: xorl 3(<table=%rsi,<p30=%rdi,8),<z3=%r10d
xorl 3(%rsi,%rdi,8),%r10d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#2,<p31=int64#1,8),<z2=int64#9d
# asm 2: xorl 2(<table=%rsi,<p31=%rdi,8),<z2=%r11d
xorl 2(%rsi,%rdi,8),%r11d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#2,<p32=int64#1,8),<z1=int64#10d
# asm 2: xorl 1(<table=%rsi,<p32=%rdi,8),<z1=%r12d
xorl 1(%rsi,%rdi,8),%r12d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#2,<p33=int64#1,8),<z0=int64#6d
# asm 2: xorl 4(<table=%rsi,<p33=%rdi,8),<z0=%r9d
xorl 4(%rsi,%rdi,8),%r9d

# qhasm:   y0 = r12
# asm 1: movq <r12=stack64#20,>y0=int64#14
# asm 2: movq <r12=152(%rsp),>y0=%rbx
movq 152(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#6,<y0=int64#14
# asm 2: xor  <z0=%r9,<y0=%rbx
xor  %r9,%rbx

# qhasm:   y1 = r13
# asm 1: movq <r13=stack64#21,>y1=int64#4
# asm 2: movq <r13=160(%rsp),>y1=%rcx
movq 160(%rsp),%rcx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#10,<y1=int64#4
# asm 2: xor  <z1=%r12,<y1=%rcx
xor  %r12,%rcx

# qhasm:   y2 = r14
# asm 1: movq <r14=stack64#22,>y2=int64#3
# asm 2: movq <r14=168(%rsp),>y2=%rdx
movq 168(%rsp),%rdx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#9,<y2=int64#3
# asm 2: xor  <z2=%r11,<y2=%rdx
xor  %r11,%rdx

# qhasm:   y3 = r15
# asm 1: movq <r15=stack64#23,>y3=int64#7
# asm 2: movq <r15=176(%rsp),>y3=%rax
movq 176(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#8,<y3=int64#7
# asm 2: xor  <z3=%r10,<y3=%rax
xor  %r10,%rax

# qhasm: assign 3 to y2

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#2,<p00=int64#1,8),>z0=int64#6d
# asm 2: movl   3(<table=%rsi,<p00=%rdi,8),>z0=%r9d
movl   3(%rsi,%rdi,8),%r9d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#2,<p03=int64#1,8),>z3=int64#8d
# asm 2: movl   2(<table=%rsi,<p03=%rdi,8),>z3=%r10d
movl   2(%rsi,%rdi,8),%r10d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#2,<p02=int64#1,8),>z2=int64#9d
# asm 2: movl   1(<table=%rsi,<p02=%rdi,8),>z2=%r11d
movl   1(%rsi,%rdi,8),%r11d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#2,<p01=int64#1,8),>z1=int64#10d
# asm 2: movl   4(<table=%rsi,<p01=%rdi,8),>z1=%r12d
movl   4(%rsi,%rdi,8),%r12d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#1d
# asm 2: movzbl  <y1=%cl,>p10=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#2,<p10=int64#1,8),<z1=int64#10d
# asm 2: xorl 3(<table=%rsi,<p10=%rdi,8),<z1=%r12d
xorl 3(%rsi,%rdi,8),%r12d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%ch,>p11=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#2,<p11=int64#1,8),<z0=int64#6d
# asm 2: xorl 2(<table=%rsi,<p11=%rdi,8),<z0=%r9d
xorl 2(%rsi,%rdi,8),%r9d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#1d
# asm 2: movzbl  <y1=%cl,>p12=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#2,<p12=int64#1,8),<z3=int64#8d
# asm 2: xorl 1(<table=%rsi,<p12=%rdi,8),<z3=%r10d
xorl 1(%rsi,%rdi,8),%r10d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%ch,>p13=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#2,<p13=int64#1,8),<z2=int64#9d
# asm 2: xorl 4(<table=%rsi,<p13=%rdi,8),<z2=%r11d
xorl 4(%rsi,%rdi,8),%r11d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p20=int64#1d
# asm 2: movzbl  <y2=%dl,>p20=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#2,<p20=int64#1,8),<z2=int64#9d
# asm 2: xorl 3(<table=%rsi,<p20=%rdi,8),<z2=%r11d
xorl 3(%rsi,%rdi,8),%r11d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%dh,>p21=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#2,<p21=int64#1,8),<z1=int64#10d
# asm 2: xorl 2(<table=%rsi,<p21=%rdi,8),<z1=%r12d
xorl 2(%rsi,%rdi,8),%r12d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#3d
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p22=int64#1d
# asm 2: movzbl  <y2=%dl,>p22=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#2,<p22=int64#1,8),<z0=int64#6d
# asm 2: xorl 1(<table=%rsi,<p22=%rdi,8),<z0=%r9d
xorl 1(%rsi,%rdi,8),%r9d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%dh,>p23=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#2,<p23=int64#1,8),<z3=int64#8d
# asm 2: xorl 4(<table=%rsi,<p23=%rdi,8),<z3=%r10d
xorl 4(%rsi,%rdi,8),%r10d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#2,<p30=int64#1,8),<z3=int64#8d
# asm 2: xorl 3(<table=%rsi,<p30=%rdi,8),<z3=%r10d
xorl 3(%rsi,%rdi,8),%r10d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#2,<p31=int64#1,8),<z2=int64#9d
# asm 2: xorl 2(<table=%rsi,<p31=%rdi,8),<z2=%r11d
xorl 2(%rsi,%rdi,8),%r11d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#2,<p32=int64#1,8),<z1=int64#10d
# asm 2: xorl 1(<table=%rsi,<p32=%rdi,8),<z1=%r12d
xorl 1(%rsi,%rdi,8),%r12d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#2,<p33=int64#1,8),<z0=int64#6d
# asm 2: xorl 4(<table=%rsi,<p33=%rdi,8),<z0=%r9d
xorl 4(%rsi,%rdi,8),%r9d

# qhasm:   y0 = r16
# asm 1: movq <r16=stack64#24,>y0=int64#14
# asm 2: movq <r16=184(%rsp),>y0=%rbx
movq 184(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#6,<y0=int64#14
# asm 2: xor  <z0=%r9,<y0=%rbx
xor  %r9,%rbx

# qhasm:   y1 = r17
# asm 1: movq <r17=stack64#25,>y1=int64#4
# asm 2: movq <r17=192(%rsp),>y1=%rcx
movq 192(%rsp),%rcx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#10,<y1=int64#4
# asm 2: xor  <z1=%r12,<y1=%rcx
xor  %r12,%rcx

# qhasm:   y2 = r18
# asm 1: movq <r18=stack64#26,>y2=int64#3
# asm 2: movq <r18=200(%rsp),>y2=%rdx
movq 200(%rsp),%rdx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#9,<y2=int64#3
# asm 2: xor  <z2=%r11,<y2=%rdx
xor  %r11,%rdx

# qhasm:   y3 = r19
# asm 1: movq <r19=stack64#27,>y3=int64#7
# asm 2: movq <r19=208(%rsp),>y3=%rax
movq 208(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#8,<y3=int64#7
# asm 2: xor  <z3=%r10,<y3=%rax
xor  %r10,%rax

# qhasm: assign 3 to y2

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#2,<p00=int64#1,8),>z0=int64#6d
# asm 2: movl   3(<table=%rsi,<p00=%rdi,8),>z0=%r9d
movl   3(%rsi,%rdi,8),%r9d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#2,<p03=int64#1,8),>z3=int64#8d
# asm 2: movl   2(<table=%rsi,<p03=%rdi,8),>z3=%r10d
movl   2(%rsi,%rdi,8),%r10d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#2,<p02=int64#1,8),>z2=int64#9d
# asm 2: movl   1(<table=%rsi,<p02=%rdi,8),>z2=%r11d
movl   1(%rsi,%rdi,8),%r11d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#2,<p01=int64#1,8),>z1=int64#10d
# asm 2: movl   4(<table=%rsi,<p01=%rdi,8),>z1=%r12d
movl   4(%rsi,%rdi,8),%r12d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#1d
# asm 2: movzbl  <y1=%cl,>p10=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#2,<p10=int64#1,8),<z1=int64#10d
# asm 2: xorl 3(<table=%rsi,<p10=%rdi,8),<z1=%r12d
xorl 3(%rsi,%rdi,8),%r12d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%ch,>p11=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#2,<p11=int64#1,8),<z0=int64#6d
# asm 2: xorl 2(<table=%rsi,<p11=%rdi,8),<z0=%r9d
xorl 2(%rsi,%rdi,8),%r9d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#1d
# asm 2: movzbl  <y1=%cl,>p12=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#2,<p12=int64#1,8),<z3=int64#8d
# asm 2: xorl 1(<table=%rsi,<p12=%rdi,8),<z3=%r10d
xorl 1(%rsi,%rdi,8),%r10d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%ch,>p13=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#2,<p13=int64#1,8),<z2=int64#9d
# asm 2: xorl 4(<table=%rsi,<p13=%rdi,8),<z2=%r11d
xorl 4(%rsi,%rdi,8),%r11d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p20=int64#1d
# asm 2: movzbl  <y2=%dl,>p20=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#2,<p20=int64#1,8),<z2=int64#9d
# asm 2: xorl 3(<table=%rsi,<p20=%rdi,8),<z2=%r11d
xorl 3(%rsi,%rdi,8),%r11d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%dh,>p21=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#2,<p21=int64#1,8),<z1=int64#10d
# asm 2: xorl 2(<table=%rsi,<p21=%rdi,8),<z1=%r12d
xorl 2(%rsi,%rdi,8),%r12d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#3d
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p22=int64#1d
# asm 2: movzbl  <y2=%dl,>p22=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#2,<p22=int64#1,8),<z0=int64#6d
# asm 2: xorl 1(<table=%rsi,<p22=%rdi,8),<z0=%r9d
xorl 1(%rsi,%rdi,8),%r9d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%dh,>p23=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#2,<p23=int64#1,8),<z3=int64#8d
# asm 2: xorl 4(<table=%rsi,<p23=%rdi,8),<z3=%r10d
xorl 4(%rsi,%rdi,8),%r10d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#2,<p30=int64#1,8),<z3=int64#8d
# asm 2: xorl 3(<table=%rsi,<p30=%rdi,8),<z3=%r10d
xorl 3(%rsi,%rdi,8),%r10d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#2,<p31=int64#1,8),<z2=int64#9d
# asm 2: xorl 2(<table=%rsi,<p31=%rdi,8),<z2=%r11d
xorl 2(%rsi,%rdi,8),%r11d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#2,<p32=int64#1,8),<z1=int64#10d
# asm 2: xorl 1(<table=%rsi,<p32=%rdi,8),<z1=%r12d
xorl 1(%rsi,%rdi,8),%r12d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#2,<p33=int64#1,8),<z0=int64#6d
# asm 2: xorl 4(<table=%rsi,<p33=%rdi,8),<z0=%r9d
xorl 4(%rsi,%rdi,8),%r9d

# qhasm:   y0 = r20
# asm 1: movq <r20=stack64#28,>y0=int64#14
# asm 2: movq <r20=216(%rsp),>y0=%rbx
movq 216(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#6,<y0=int64#14
# asm 2: xor  <z0=%r9,<y0=%rbx
xor  %r9,%rbx

# qhasm:   y1 = r21
# asm 1: movq <r21=stack64#29,>y1=int64#4
# asm 2: movq <r21=224(%rsp),>y1=%rcx
movq 224(%rsp),%rcx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#10,<y1=int64#4
# asm 2: xor  <z1=%r12,<y1=%rcx
xor  %r12,%rcx

# qhasm:   y2 = r22
# asm 1: movq <r22=stack64#30,>y2=int64#3
# asm 2: movq <r22=232(%rsp),>y2=%rdx
movq 232(%rsp),%rdx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#9,<y2=int64#3
# asm 2: xor  <z2=%r11,<y2=%rdx
xor  %r11,%rdx

# qhasm:   y3 = r23
# asm 1: movq <r23=stack64#31,>y3=int64#7
# asm 2: movq <r23=240(%rsp),>y3=%rax
movq 240(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#8,<y3=int64#7
# asm 2: xor  <z3=%r10,<y3=%rax
xor  %r10,%rax

# qhasm: assign 3 to y2

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#2,<p00=int64#1,8),>z0=int64#6d
# asm 2: movl   3(<table=%rsi,<p00=%rdi,8),>z0=%r9d
movl   3(%rsi,%rdi,8),%r9d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#2,<p03=int64#1,8),>z3=int64#8d
# asm 2: movl   2(<table=%rsi,<p03=%rdi,8),>z3=%r10d
movl   2(%rsi,%rdi,8),%r10d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#2,<p02=int64#1,8),>z2=int64#9d
# asm 2: movl   1(<table=%rsi,<p02=%rdi,8),>z2=%r11d
movl   1(%rsi,%rdi,8),%r11d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#2,<p01=int64#1,8),>z1=int64#10d
# asm 2: movl   4(<table=%rsi,<p01=%rdi,8),>z1=%r12d
movl   4(%rsi,%rdi,8),%r12d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#1d
# asm 2: movzbl  <y1=%cl,>p10=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#2,<p10=int64#1,8),<z1=int64#10d
# asm 2: xorl 3(<table=%rsi,<p10=%rdi,8),<z1=%r12d
xorl 3(%rsi,%rdi,8),%r12d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%ch,>p11=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#2,<p11=int64#1,8),<z0=int64#6d
# asm 2: xorl 2(<table=%rsi,<p11=%rdi,8),<z0=%r9d
xorl 2(%rsi,%rdi,8),%r9d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#1d
# asm 2: movzbl  <y1=%cl,>p12=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#2,<p12=int64#1,8),<z3=int64#8d
# asm 2: xorl 1(<table=%rsi,<p12=%rdi,8),<z3=%r10d
xorl 1(%rsi,%rdi,8),%r10d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%ch,>p13=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#2,<p13=int64#1,8),<z2=int64#9d
# asm 2: xorl 4(<table=%rsi,<p13=%rdi,8),<z2=%r11d
xorl 4(%rsi,%rdi,8),%r11d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p20=int64#1d
# asm 2: movzbl  <y2=%dl,>p20=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#2,<p20=int64#1,8),<z2=int64#9d
# asm 2: xorl 3(<table=%rsi,<p20=%rdi,8),<z2=%r11d
xorl 3(%rsi,%rdi,8),%r11d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%dh,>p21=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#2,<p21=int64#1,8),<z1=int64#10d
# asm 2: xorl 2(<table=%rsi,<p21=%rdi,8),<z1=%r12d
xorl 2(%rsi,%rdi,8),%r12d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#3d
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p22=int64#1d
# asm 2: movzbl  <y2=%dl,>p22=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#2,<p22=int64#1,8),<z0=int64#6d
# asm 2: xorl 1(<table=%rsi,<p22=%rdi,8),<z0=%r9d
xorl 1(%rsi,%rdi,8),%r9d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%dh,>p23=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#2,<p23=int64#1,8),<z3=int64#8d
# asm 2: xorl 4(<table=%rsi,<p23=%rdi,8),<z3=%r10d
xorl 4(%rsi,%rdi,8),%r10d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#2,<p30=int64#1,8),<z3=int64#8d
# asm 2: xorl 3(<table=%rsi,<p30=%rdi,8),<z3=%r10d
xorl 3(%rsi,%rdi,8),%r10d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#2,<p31=int64#1,8),<z2=int64#9d
# asm 2: xorl 2(<table=%rsi,<p31=%rdi,8),<z2=%r11d
xorl 2(%rsi,%rdi,8),%r11d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#2,<p32=int64#1,8),<z1=int64#10d
# asm 2: xorl 1(<table=%rsi,<p32=%rdi,8),<z1=%r12d
xorl 1(%rsi,%rdi,8),%r12d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#2,<p33=int64#1,8),<z0=int64#6d
# asm 2: xorl 4(<table=%rsi,<p33=%rdi,8),<z0=%r9d
xorl 4(%rsi,%rdi,8),%r9d

# qhasm:   y0 = r24
# asm 1: movq <r24=stack64#32,>y0=int64#14
# asm 2: movq <r24=248(%rsp),>y0=%rbx
movq 248(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#6,<y0=int64#14
# asm 2: xor  <z0=%r9,<y0=%rbx
xor  %r9,%rbx

# qhasm:   y1 = r25
# asm 1: movq <r25=stack64#33,>y1=int64#4
# asm 2: movq <r25=256(%rsp),>y1=%rcx
movq 256(%rsp),%rcx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#10,<y1=int64#4
# asm 2: xor  <z1=%r12,<y1=%rcx
xor  %r12,%rcx

# qhasm:   y2 = r26
# asm 1: movq <r26=stack64#34,>y2=int64#3
# asm 2: movq <r26=264(%rsp),>y2=%rdx
movq 264(%rsp),%rdx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#9,<y2=int64#3
# asm 2: xor  <z2=%r11,<y2=%rdx
xor  %r11,%rdx

# qhasm:   y3 = r27
# asm 1: movq <r27=stack64#35,>y3=int64#7
# asm 2: movq <r27=272(%rsp),>y3=%rax
movq 272(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#8,<y3=int64#7
# asm 2: xor  <z3=%r10,<y3=%rax
xor  %r10,%rax

# qhasm: assign 3 to y2

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#2,<p00=int64#1,8),>z0=int64#6d
# asm 2: movl   3(<table=%rsi,<p00=%rdi,8),>z0=%r9d
movl   3(%rsi,%rdi,8),%r9d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#2,<p03=int64#1,8),>z3=int64#8d
# asm 2: movl   2(<table=%rsi,<p03=%rdi,8),>z3=%r10d
movl   2(%rsi,%rdi,8),%r10d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#2,<p02=int64#1,8),>z2=int64#9d
# asm 2: movl   1(<table=%rsi,<p02=%rdi,8),>z2=%r11d
movl   1(%rsi,%rdi,8),%r11d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#2,<p01=int64#1,8),>z1=int64#10d
# asm 2: movl   4(<table=%rsi,<p01=%rdi,8),>z1=%r12d
movl   4(%rsi,%rdi,8),%r12d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#1d
# asm 2: movzbl  <y1=%cl,>p10=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#2,<p10=int64#1,8),<z1=int64#10d
# asm 2: xorl 3(<table=%rsi,<p10=%rdi,8),<z1=%r12d
xorl 3(%rsi,%rdi,8),%r12d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%ch,>p11=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#2,<p11=int64#1,8),<z0=int64#6d
# asm 2: xorl 2(<table=%rsi,<p11=%rdi,8),<z0=%r9d
xorl 2(%rsi,%rdi,8),%r9d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#1d
# asm 2: movzbl  <y1=%cl,>p12=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#2,<p12=int64#1,8),<z3=int64#8d
# asm 2: xorl 1(<table=%rsi,<p12=%rdi,8),<z3=%r10d
xorl 1(%rsi,%rdi,8),%r10d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%ch,>p13=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#2,<p13=int64#1,8),<z2=int64#9d
# asm 2: xorl 4(<table=%rsi,<p13=%rdi,8),<z2=%r11d
xorl 4(%rsi,%rdi,8),%r11d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p20=int64#1d
# asm 2: movzbl  <y2=%dl,>p20=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#2,<p20=int64#1,8),<z2=int64#9d
# asm 2: xorl 3(<table=%rsi,<p20=%rdi,8),<z2=%r11d
xorl 3(%rsi,%rdi,8),%r11d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%dh,>p21=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#2,<p21=int64#1,8),<z1=int64#10d
# asm 2: xorl 2(<table=%rsi,<p21=%rdi,8),<z1=%r12d
xorl 2(%rsi,%rdi,8),%r12d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#3d
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p22=int64#1d
# asm 2: movzbl  <y2=%dl,>p22=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#2,<p22=int64#1,8),<z0=int64#6d
# asm 2: xorl 1(<table=%rsi,<p22=%rdi,8),<z0=%r9d
xorl 1(%rsi,%rdi,8),%r9d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%dh,>p23=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#2,<p23=int64#1,8),<z3=int64#8d
# asm 2: xorl 4(<table=%rsi,<p23=%rdi,8),<z3=%r10d
xorl 4(%rsi,%rdi,8),%r10d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#2,<p30=int64#1,8),<z3=int64#8d
# asm 2: xorl 3(<table=%rsi,<p30=%rdi,8),<z3=%r10d
xorl 3(%rsi,%rdi,8),%r10d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#2,<p31=int64#1,8),<z2=int64#9d
# asm 2: xorl 2(<table=%rsi,<p31=%rdi,8),<z2=%r11d
xorl 2(%rsi,%rdi,8),%r11d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#2,<p32=int64#1,8),<z1=int64#10d
# asm 2: xorl 1(<table=%rsi,<p32=%rdi,8),<z1=%r12d
xorl 1(%rsi,%rdi,8),%r12d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#2,<p33=int64#1,8),<z0=int64#6d
# asm 2: xorl 4(<table=%rsi,<p33=%rdi,8),<z0=%r9d
xorl 4(%rsi,%rdi,8),%r9d

# qhasm:   y0 = r28
# asm 1: movq <r28=stack64#36,>y0=int64#14
# asm 2: movq <r28=280(%rsp),>y0=%rbx
movq 280(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#6,<y0=int64#14
# asm 2: xor  <z0=%r9,<y0=%rbx
xor  %r9,%rbx

# qhasm:   y1 = r29
# asm 1: movq <r29=stack64#37,>y1=int64#4
# asm 2: movq <r29=288(%rsp),>y1=%rcx
movq 288(%rsp),%rcx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#10,<y1=int64#4
# asm 2: xor  <z1=%r12,<y1=%rcx
xor  %r12,%rcx

# qhasm:   y2 = r30
# asm 1: movq <r30=stack64#38,>y2=int64#3
# asm 2: movq <r30=296(%rsp),>y2=%rdx
movq 296(%rsp),%rdx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#9,<y2=int64#3
# asm 2: xor  <z2=%r11,<y2=%rdx
xor  %r11,%rdx

# qhasm:   y3 = r31
# asm 1: movq <r31=stack64#39,>y3=int64#7
# asm 2: movq <r31=304(%rsp),>y3=%rax
movq 304(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#8,<y3=int64#7
# asm 2: xor  <z3=%r10,<y3=%rax
xor  %r10,%rax

# qhasm: assign 3 to y2

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#2,<p00=int64#1,8),>z0=int64#6d
# asm 2: movl   3(<table=%rsi,<p00=%rdi,8),>z0=%r9d
movl   3(%rsi,%rdi,8),%r9d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#2,<p03=int64#1,8),>z3=int64#8d
# asm 2: movl   2(<table=%rsi,<p03=%rdi,8),>z3=%r10d
movl   2(%rsi,%rdi,8),%r10d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#2,<p02=int64#1,8),>z2=int64#9d
# asm 2: movl   1(<table=%rsi,<p02=%rdi,8),>z2=%r11d
movl   1(%rsi,%rdi,8),%r11d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#2,<p01=int64#1,8),>z1=int64#10d
# asm 2: movl   4(<table=%rsi,<p01=%rdi,8),>z1=%r12d
movl   4(%rsi,%rdi,8),%r12d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#1d
# asm 2: movzbl  <y1=%cl,>p10=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#2,<p10=int64#1,8),<z1=int64#10d
# asm 2: xorl 3(<table=%rsi,<p10=%rdi,8),<z1=%r12d
xorl 3(%rsi,%rdi,8),%r12d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%ch,>p11=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#2,<p11=int64#1,8),<z0=int64#6d
# asm 2: xorl 2(<table=%rsi,<p11=%rdi,8),<z0=%r9d
xorl 2(%rsi,%rdi,8),%r9d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#1d
# asm 2: movzbl  <y1=%cl,>p12=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#2,<p12=int64#1,8),<z3=int64#8d
# asm 2: xorl 1(<table=%rsi,<p12=%rdi,8),<z3=%r10d
xorl 1(%rsi,%rdi,8),%r10d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%ch,>p13=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#2,<p13=int64#1,8),<z2=int64#9d
# asm 2: xorl 4(<table=%rsi,<p13=%rdi,8),<z2=%r11d
xorl 4(%rsi,%rdi,8),%r11d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p20=int64#1d
# asm 2: movzbl  <y2=%dl,>p20=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#2,<p20=int64#1,8),<z2=int64#9d
# asm 2: xorl 3(<table=%rsi,<p20=%rdi,8),<z2=%r11d
xorl 3(%rsi,%rdi,8),%r11d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%dh,>p21=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#2,<p21=int64#1,8),<z1=int64#10d
# asm 2: xorl 2(<table=%rsi,<p21=%rdi,8),<z1=%r12d
xorl 2(%rsi,%rdi,8),%r12d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#3d
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p22=int64#1d
# asm 2: movzbl  <y2=%dl,>p22=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#2,<p22=int64#1,8),<z0=int64#6d
# asm 2: xorl 1(<table=%rsi,<p22=%rdi,8),<z0=%r9d
xorl 1(%rsi,%rdi,8),%r9d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%dh,>p23=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#2,<p23=int64#1,8),<z3=int64#8d
# asm 2: xorl 4(<table=%rsi,<p23=%rdi,8),<z3=%r10d
xorl 4(%rsi,%rdi,8),%r10d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#2,<p30=int64#1,8),<z3=int64#8d
# asm 2: xorl 3(<table=%rsi,<p30=%rdi,8),<z3=%r10d
xorl 3(%rsi,%rdi,8),%r10d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#2,<p31=int64#1,8),<z2=int64#9d
# asm 2: xorl 2(<table=%rsi,<p31=%rdi,8),<z2=%r11d
xorl 2(%rsi,%rdi,8),%r11d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#2,<p32=int64#1,8),<z1=int64#10d
# asm 2: xorl 1(<table=%rsi,<p32=%rdi,8),<z1=%r12d
xorl 1(%rsi,%rdi,8),%r12d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#2,<p33=int64#1,8),<z0=int64#6d
# asm 2: xorl 4(<table=%rsi,<p33=%rdi,8),<z0=%r9d
xorl 4(%rsi,%rdi,8),%r9d

# qhasm:   y0 = r32
# asm 1: movq <r32=stack64#40,>y0=int64#14
# asm 2: movq <r32=312(%rsp),>y0=%rbx
movq 312(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#6,<y0=int64#14
# asm 2: xor  <z0=%r9,<y0=%rbx
xor  %r9,%rbx

# qhasm:   y1 = r33
# asm 1: movq <r33=stack64#41,>y1=int64#4
# asm 2: movq <r33=320(%rsp),>y1=%rcx
movq 320(%rsp),%rcx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#10,<y1=int64#4
# asm 2: xor  <z1=%r12,<y1=%rcx
xor  %r12,%rcx

# qhasm:   y2 = r34
# asm 1: movq <r34=stack64#42,>y2=int64#3
# asm 2: movq <r34=328(%rsp),>y2=%rdx
movq 328(%rsp),%rdx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#9,<y2=int64#3
# asm 2: xor  <z2=%r11,<y2=%rdx
xor  %r11,%rdx

# qhasm:   y3 = r35
# asm 1: movq <r35=stack64#43,>y3=int64#7
# asm 2: movq <r35=336(%rsp),>y3=%rax
movq 336(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#8,<y3=int64#7
# asm 2: xor  <z3=%r10,<y3=%rax
xor  %r10,%rax

# qhasm: assign 3 to y2

# qhasm:   p00 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p00=int64#1d
# asm 2: movzbl  <y0=%bl,>p00=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint32 *) (table + 3 + p00 * 8)
# asm 1: movl   3(<table=int64#2,<p00=int64#1,8),>z0=int64#6d
# asm 2: movl   3(<table=%rsi,<p00=%rdi,8),>z0=%r9d
movl   3(%rsi,%rdi,8),%r9d

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p03=int64#1d
# asm 2: movzbl  <y0=%bh,>p03=%edi
movzbl  %bh,%edi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z3 = *(uint32 *) (table + 2 + p03 * 8)
# asm 1: movl   2(<table=int64#2,<p03=int64#1,8),>z3=int64#8d
# asm 2: movl   2(<table=%rsi,<p03=%rdi,8),>z3=%r10d
movl   2(%rsi,%rdi,8),%r10d

# qhasm:   p02 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>p02=int64#1d
# asm 2: movzbl  <y0=%bl,>p02=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 1 + p02 * 8)
# asm 1: movl   1(<table=int64#2,<p02=int64#1,8),>z2=int64#9d
# asm 2: movl   1(<table=%rsi,<p02=%rdi,8),>z2=%r11d
movl   1(%rsi,%rdi,8),%r11d

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>p01=int64#1d
# asm 2: movzbl  <y0=%bh,>p01=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 4 + p01 * 8)
# asm 1: movl   4(<table=int64#2,<p01=int64#1,8),>z1=int64#10d
# asm 2: movl   4(<table=%rsi,<p01=%rdi,8),>z1=%r12d
movl   4(%rsi,%rdi,8),%r12d

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#1d
# asm 2: movzbl  <y1=%cl,>p10=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 3 + p10 * 8)
# asm 1: xorl 3(<table=int64#2,<p10=int64#1,8),<z1=int64#10d
# asm 2: xorl 3(<table=%rsi,<p10=%rdi,8),<z1=%r12d
xorl 3(%rsi,%rdi,8),%r12d

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%ch,>p11=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 2 + p11 * 8)
# asm 1: xorl 2(<table=int64#2,<p11=int64#1,8),<z0=int64#6d
# asm 2: xorl 2(<table=%rsi,<p11=%rdi,8),<z0=%r9d
xorl 2(%rsi,%rdi,8),%r9d

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#1d
# asm 2: movzbl  <y1=%cl,>p12=%edi
movzbl  %cl,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 1 + p12 * 8)
# asm 1: xorl 1(<table=int64#2,<p12=int64#1,8),<z3=int64#8d
# asm 2: xorl 1(<table=%rsi,<p12=%rdi,8),<z3=%r10d
xorl 1(%rsi,%rdi,8),%r10d

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%ch,>p13=%edi
movzbl  %ch,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 4 + p13 * 8)
# asm 1: xorl 4(<table=int64#2,<p13=int64#1,8),<z2=int64#9d
# asm 2: xorl 4(<table=%rsi,<p13=%rdi,8),<z2=%r11d
xorl 4(%rsi,%rdi,8),%r11d

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p20=int64#1d
# asm 2: movzbl  <y2=%dl,>p20=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 3 + p20 * 8)
# asm 1: xorl 3(<table=int64#2,<p20=int64#1,8),<z2=int64#9d
# asm 2: xorl 3(<table=%rsi,<p20=%rdi,8),<z2=%r11d
xorl 3(%rsi,%rdi,8),%r11d

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%dh,>p21=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 2 + p21 * 8)
# asm 1: xorl 2(<table=int64#2,<p21=int64#1,8),<z1=int64#10d
# asm 2: xorl 2(<table=%rsi,<p21=%rdi,8),<z1=%r12d
xorl 2(%rsi,%rdi,8),%r12d

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#3d
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p22=int64#1d
# asm 2: movzbl  <y2=%dl,>p22=%edi
movzbl  %dl,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 1 + p22 * 8)
# asm 1: xorl 1(<table=int64#2,<p22=int64#1,8),<z0=int64#6d
# asm 2: xorl 1(<table=%rsi,<p22=%rdi,8),<z0=%r9d
xorl 1(%rsi,%rdi,8),%r9d

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%dh,>p23=%edi
movzbl  %dh,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 4 + p23 * 8)
# asm 1: xorl 4(<table=int64#2,<p23=int64#1,8),<z3=int64#8d
# asm 2: xorl 4(<table=%rsi,<p23=%rdi,8),<z3=%r10d
xorl 4(%rsi,%rdi,8),%r10d

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z3 ^= *(uint32 *) (table + 3 + p30 * 8)
# asm 1: xorl 3(<table=int64#2,<p30=int64#1,8),<z3=int64#8d
# asm 2: xorl 3(<table=%rsi,<p30=%rdi,8),<z3=%r10d
xorl 3(%rsi,%rdi,8),%r10d

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z2 ^= *(uint32 *) (table + 2 + p31 * 8)
# asm 1: xorl 2(<table=int64#2,<p31=int64#1,8),<z2=int64#9d
# asm 2: xorl 2(<table=%rsi,<p31=%rdi,8),<z2=%r11d
xorl 2(%rsi,%rdi,8),%r11d

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   (uint32) z1 ^= *(uint32 *) (table + 1 + p32 * 8)
# asm 1: xorl 1(<table=int64#2,<p32=int64#1,8),<z1=int64#10d
# asm 2: xorl 1(<table=%rsi,<p32=%rdi,8),<z1=%r12d
xorl 1(%rsi,%rdi,8),%r12d

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   (uint32) z0 ^= *(uint32 *) (table + 4 + p33 * 8)
# asm 1: xorl 4(<table=int64#2,<p33=int64#1,8),<z0=int64#6d
# asm 2: xorl 4(<table=%rsi,<p33=%rdi,8),<z0=%r9d
xorl 4(%rsi,%rdi,8),%r9d

# qhasm:   y0 = r36
# asm 1: movq <r36=stack64#44,>y0=int64#14
# asm 2: movq <r36=344(%rsp),>y0=%rbx
movq 344(%rsp),%rbx

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int64#6,<y0=int64#14
# asm 2: xor  <z0=%r9,<y0=%rbx
xor  %r9,%rbx

# qhasm:   y1 = r37
# asm 1: movq <r37=stack64#45,>y1=int64#4
# asm 2: movq <r37=352(%rsp),>y1=%rcx
movq 352(%rsp),%rcx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int64#10,<y1=int64#4
# asm 2: xor  <z1=%r12,<y1=%rcx
xor  %r12,%rcx

# qhasm:   y2 = r38
# asm 1: movq <r38=stack64#46,>y2=int64#3
# asm 2: movq <r38=360(%rsp),>y2=%rdx
movq 360(%rsp),%rdx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int64#9,<y2=int64#3
# asm 2: xor  <z2=%r11,<y2=%rdx
xor  %r11,%rdx

# qhasm:   y3 = r39
# asm 1: movq <r39=stack64#47,>y3=int64#7
# asm 2: movq <r39=368(%rsp),>y3=%rax
movq 368(%rsp),%rax

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int64#8,<y3=int64#7
# asm 2: xor  <z3=%r10,<y3=%rax
xor  %r10,%rax

# qhasm: assign 3 to y2

# qhasm:   z0 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>z0=int64#1d
# asm 2: movzbl  <y0=%bl,>z0=%edi
movzbl  %bl,%edi

# qhasm:   z0 = *(uint8 *) (table + 1 + z0 * 8)
# asm 1: movzbq 1(<table=int64#2,<z0=int64#1,8),>z0=int64#6
# asm 2: movzbq 1(<table=%rsi,<z0=%rdi,8),>z0=%r9
movzbq 1(%rsi,%rdi,8),%r9

# qhasm:   z3 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>z3=int64#1d
# asm 2: movzbl  <y0=%bh,>z3=%edi
movzbl  %bh,%edi

# qhasm:   z3 = *(uint16 *) (table + z3 * 8)
# asm 1: movzwq (<table=int64#2,<z3=int64#1,8),>z3=int64#8
# asm 2: movzwq (<table=%rsi,<z3=%rdi,8),>z3=%r10
movzwq (%rsi,%rdi,8),%r10

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int64#14d
# asm 2: shr  $16,<y0=%ebx
shr  $16,%ebx

# qhasm:   z2 = y0 & 255
# asm 1: movzbl  <y0=int64#14b,>z2=int64#1d
# asm 2: movzbl  <y0=%bl,>z2=%edi
movzbl  %bl,%edi

# qhasm:   z2 = *(uint32 *) (table + 3 + z2 * 8)
# asm 1: movl   3(<table=int64#2,<z2=int64#1,8),>z2=int64#9d
# asm 2: movl   3(<table=%rsi,<z2=%rdi,8),>z2=%r11d
movl   3(%rsi,%rdi,8),%r11d

# qhasm:   (uint32) z2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<z2=int64#9d
# asm 2: and  $0x00ff0000,<z2=%r11d
and  $0x00ff0000,%r11d

# qhasm:   z1 = (y0 >> 8) & 255
# asm 1: movzbl  <y0=int64#14%next8,>z1=int64#1d
# asm 2: movzbl  <y0=%bh,>z1=%edi
movzbl  %bh,%edi

# qhasm:   z1 = *(uint32 *) (table + 2 + z1 * 8)
# asm 1: movl   2(<table=int64#2,<z1=int64#1,8),>z1=int64#10d
# asm 2: movl   2(<table=%rsi,<z1=%rdi,8),>z1=%r12d
movl   2(%rsi,%rdi,8),%r12d

# qhasm:   (uint32) z1 &= 0xff000000
# asm 1: and  $0xff000000,<z1=int64#10d
# asm 2: and  $0xff000000,<z1=%r12d
and  $0xff000000,%r12d

# qhasm:   z0 ^= r40
# asm 1: xorq <r40=stack64#48,<z0=int64#6
# asm 2: xorq <r40=376(%rsp),<z0=%r9
xorq 376(%rsp),%r9

# qhasm:   z3 ^= r43
# asm 1: xorq <r43=stack64#51,<z3=int64#8
# asm 2: xorq <r43=400(%rsp),<z3=%r10
xorq 400(%rsp),%r10

# qhasm:   z1 ^= r41
# asm 1: xorq <r41=stack64#49,<z1=int64#10
# asm 2: xorq <r41=384(%rsp),<z1=%r12
xorq 384(%rsp),%r12

# qhasm:   z2 ^= r42
# asm 1: xorq <r42=stack64#50,<z2=int64#9
# asm 2: xorq <r42=392(%rsp),<z2=%r11
xorq 392(%rsp),%r11

# qhasm:   p10 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p10=int64#1d
# asm 2: movzbl  <y1=%cl,>p10=%edi
movzbl  %cl,%edi

# qhasm:   p10 = *(uint8 *) (table + 1 + p10 * 8)
# asm 1: movzbq 1(<table=int64#2,<p10=int64#1,8),>p10=int64#1
# asm 2: movzbq 1(<table=%rsi,<p10=%rdi,8),>p10=%rdi
movzbq 1(%rsi,%rdi,8),%rdi

# qhasm:   z1 ^= p10
# asm 1: xor  <p10=int64#1,<z1=int64#10
# asm 2: xor  <p10=%rdi,<z1=%r12
xor  %rdi,%r12

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p11=int64#1d
# asm 2: movzbl  <y1=%ch,>p11=%edi
movzbl  %ch,%edi

# qhasm:   p11 = *(uint16 *) (table + p11 * 8)
# asm 1: movzwq (<table=int64#2,<p11=int64#1,8),>p11=int64#1
# asm 2: movzwq (<table=%rsi,<p11=%rdi,8),>p11=%rdi
movzwq (%rsi,%rdi,8),%rdi

# qhasm:   z0 ^= p11
# asm 1: xor  <p11=int64#1,<z0=int64#6
# asm 2: xor  <p11=%rdi,<z0=%r9
xor  %rdi,%r9

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int64#4d
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl  <y1=int64#4b,>p12=int64#1d
# asm 2: movzbl  <y1=%cl,>p12=%edi
movzbl  %cl,%edi

# qhasm:   p12 = *(uint32 *) (table + 3 + p12 * 8)
# asm 1: movl   3(<table=int64#2,<p12=int64#1,8),>p12=int64#1d
# asm 2: movl   3(<table=%rsi,<p12=%rdi,8),>p12=%edi
movl   3(%rsi,%rdi,8),%edi

# qhasm:   (uint32) p12 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<p12=int64#1d
# asm 2: and  $0x00ff0000,<p12=%edi
and  $0x00ff0000,%edi

# qhasm:   z3 ^= p12
# asm 1: xor  <p12=int64#1,<z3=int64#8
# asm 2: xor  <p12=%rdi,<z3=%r10
xor  %rdi,%r10

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl  <y1=int64#4%next8,>p13=int64#1d
# asm 2: movzbl  <y1=%ch,>p13=%edi
movzbl  %ch,%edi

# qhasm:   p13 = *(uint32 *) (table + 2 + p13 * 8)
# asm 1: movl   2(<table=int64#2,<p13=int64#1,8),>p13=int64#1d
# asm 2: movl   2(<table=%rsi,<p13=%rdi,8),>p13=%edi
movl   2(%rsi,%rdi,8),%edi

# qhasm:   (uint32) p13 &= 0xff000000
# asm 1: and  $0xff000000,<p13=int64#1d
# asm 2: and  $0xff000000,<p13=%edi
and  $0xff000000,%edi

# qhasm:   z2 ^= p13
# asm 1: xor  <p13=int64#1,<z2=int64#9
# asm 2: xor  <p13=%rdi,<z2=%r11
xor  %rdi,%r11

# qhasm:   p20 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p20=int64#1d
# asm 2: movzbl  <y2=%dl,>p20=%edi
movzbl  %dl,%edi

# qhasm:   p20 = *(uint8 *) (table + 1 + p20 * 8)
# asm 1: movzbq 1(<table=int64#2,<p20=int64#1,8),>p20=int64#1
# asm 2: movzbq 1(<table=%rsi,<p20=%rdi,8),>p20=%rdi
movzbq 1(%rsi,%rdi,8),%rdi

# qhasm:   z2 ^= p20
# asm 1: xor  <p20=int64#1,<z2=int64#9
# asm 2: xor  <p20=%rdi,<z2=%r11
xor  %rdi,%r11

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p21=int64#1d
# asm 2: movzbl  <y2=%dh,>p21=%edi
movzbl  %dh,%edi

# qhasm:   p21 = *(uint16 *) (table + p21 * 8)
# asm 1: movzwq (<table=int64#2,<p21=int64#1,8),>p21=int64#1
# asm 2: movzwq (<table=%rsi,<p21=%rdi,8),>p21=%rdi
movzwq (%rsi,%rdi,8),%rdi

# qhasm:   z1 ^= p21
# asm 1: xor  <p21=int64#1,<z1=int64#10
# asm 2: xor  <p21=%rdi,<z1=%r12
xor  %rdi,%r12

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int64#3d
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl  <y2=int64#3b,>p22=int64#1d
# asm 2: movzbl  <y2=%dl,>p22=%edi
movzbl  %dl,%edi

# qhasm:   p22 = *(uint32 *) (table + 3 + p22 * 8)
# asm 1: movl   3(<table=int64#2,<p22=int64#1,8),>p22=int64#1d
# asm 2: movl   3(<table=%rsi,<p22=%rdi,8),>p22=%edi
movl   3(%rsi,%rdi,8),%edi

# qhasm:   (uint32) p22 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<p22=int64#1d
# asm 2: and  $0x00ff0000,<p22=%edi
and  $0x00ff0000,%edi

# qhasm:   z0 ^= p22
# asm 1: xor  <p22=int64#1,<z0=int64#6
# asm 2: xor  <p22=%rdi,<z0=%r9
xor  %rdi,%r9

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl  <y2=int64#3%next8,>p23=int64#1d
# asm 2: movzbl  <y2=%dh,>p23=%edi
movzbl  %dh,%edi

# qhasm:   p23 = *(uint32 *) (table + 2 + p23 * 8)
# asm 1: movl   2(<table=int64#2,<p23=int64#1,8),>p23=int64#1d
# asm 2: movl   2(<table=%rsi,<p23=%rdi,8),>p23=%edi
movl   2(%rsi,%rdi,8),%edi

# qhasm:   (uint32) p23 &= 0xff000000
# asm 1: and  $0xff000000,<p23=int64#1d
# asm 2: and  $0xff000000,<p23=%edi
and  $0xff000000,%edi

# qhasm:   z3 ^= p23
# asm 1: xor  <p23=int64#1,<z3=int64#8
# asm 2: xor  <p23=%rdi,<z3=%r10
xor  %rdi,%r10

# qhasm:   p30 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p30=int64#1d
# asm 2: movzbl  <y3=%al,>p30=%edi
movzbl  %al,%edi

# qhasm:   p30 = *(uint8 *) (table + 1 + p30 * 8)
# asm 1: movzbq 1(<table=int64#2,<p30=int64#1,8),>p30=int64#1
# asm 2: movzbq 1(<table=%rsi,<p30=%rdi,8),>p30=%rdi
movzbq 1(%rsi,%rdi,8),%rdi

# qhasm:   z3 ^= p30
# asm 1: xor  <p30=int64#1,<z3=int64#8
# asm 2: xor  <p30=%rdi,<z3=%r10
xor  %rdi,%r10

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p31=int64#1d
# asm 2: movzbl  <y3=%ah,>p31=%edi
movzbl  %ah,%edi

# qhasm:   p31 = *(uint16 *) (table + p31 * 8)
# asm 1: movzwq (<table=int64#2,<p31=int64#1,8),>p31=int64#1
# asm 2: movzwq (<table=%rsi,<p31=%rdi,8),>p31=%rdi
movzwq (%rsi,%rdi,8),%rdi

# qhasm:   z2 ^= p31
# asm 1: xor  <p31=int64#1,<z2=int64#9
# asm 2: xor  <p31=%rdi,<z2=%r11
xor  %rdi,%r11

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int64#7d
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl  <y3=int64#7b,>p32=int64#1d
# asm 2: movzbl  <y3=%al,>p32=%edi
movzbl  %al,%edi

# qhasm:   p32 = *(uint32 *) (table + 3 + p32 * 8)
# asm 1: movl   3(<table=int64#2,<p32=int64#1,8),>p32=int64#1d
# asm 2: movl   3(<table=%rsi,<p32=%rdi,8),>p32=%edi
movl   3(%rsi,%rdi,8),%edi

# qhasm:   (uint32) p32 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<p32=int64#1d
# asm 2: and  $0x00ff0000,<p32=%edi
and  $0x00ff0000,%edi

# qhasm:   z1 ^= p32
# asm 1: xor  <p32=int64#1,<z1=int64#10
# asm 2: xor  <p32=%rdi,<z1=%r12
xor  %rdi,%r12

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl  <y3=int64#7%next8,>p33=int64#1d
# asm 2: movzbl  <y3=%ah,>p33=%edi
movzbl  %ah,%edi

# qhasm:   p33 = *(uint32 *) (table + 2 + p33 * 8)
# asm 1: movl   2(<table=int64#2,<p33=int64#1,8),>p33=int64#1d
# asm 2: movl   2(<table=%rsi,<p33=%rdi,8),>p33=%edi
movl   2(%rsi,%rdi,8),%edi

# qhasm:   (uint32) p33 &= 0xff000000
# asm 1: and  $0xff000000,<p33=int64#1d
# asm 2: and  $0xff000000,<p33=%edi
and  $0xff000000,%edi

# qhasm:   z0 ^= p33
# asm 1: xor  <p33=int64#1,<z0=int64#6
# asm 2: xor  <p33=%rdi,<z0=%r9
xor  %rdi,%r9

# qhasm: *(uint32 *) (c + 56) = z0
# asm 1: movl   <z0=int64#6d,56(<c=int64#5)
# asm 2: movl   <z0=%r9d,56(<c=%r8)
movl   %r9d,56(%r8)

# qhasm: *(uint32 *) (c + 60) = z1
# asm 1: movl   <z1=int64#10d,60(<c=int64#5)
# asm 2: movl   <z1=%r12d,60(<c=%r8)
movl   %r12d,60(%r8)

# qhasm: *(uint32 *) (c + 64) = z2
# asm 1: movl   <z2=int64#9d,64(<c=int64#5)
# asm 2: movl   <z2=%r11d,64(<c=%r8)
movl   %r11d,64(%r8)

# qhasm: *(uint32 *) (c + 68) = z3
# asm 1: movl   <z3=int64#8d,68(<c=int64#5)
# asm 2: movl   <z3=%r10d,68(<c=%r8)
movl   %r10d,68(%r8)

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
