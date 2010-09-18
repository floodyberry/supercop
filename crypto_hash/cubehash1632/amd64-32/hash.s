
# qhasm: int64 out

# qhasm: int64 in

# qhasm: int64 inlen

# qhasm: int64 result

# qhasm: input out

# qhasm: input in

# qhasm: input inlen

# qhasm: output result

# qhasm: int64 x00

# qhasm: int64 x01

# qhasm: int64 x02

# qhasm: int64 x03

# qhasm: int64 x04

# qhasm: int64 x05

# qhasm: int64 x06

# qhasm: int64 x07

# qhasm: int64 x08

# qhasm: int64 x09

# qhasm: int64 x0a

# qhasm: int64 x0b

# qhasm: int64 x0c

# qhasm: int64 x0d

# qhasm: int64 x0e

# qhasm: int64 x0f

# qhasm: int64 x10

# qhasm: int64 x11

# qhasm: int64 x12

# qhasm: int64 x13

# qhasm: int64 x14

# qhasm: int64 x15

# qhasm: int64 x16

# qhasm: int64 x17

# qhasm: int64 x18

# qhasm: int64 x19

# qhasm: int64 x1a

# qhasm: int64 x1b

# qhasm: int64 x1c

# qhasm: int64 x1d

# qhasm: int64 x1e

# qhasm: int64 x1f

# qhasm: int64 y00

# qhasm: int64 r

# qhasm: int64 finalization

# qhasm: stack256 tmp

# qhasm: int64 z

# qhasm: stack64 out_stack

# qhasm: stack64 in_stack

# qhasm: stack64 inlen_stack

# qhasm: stack32 finalization_stack

# qhasm: stack32 r_stack

# qhasm: stack32 x07_stack

# qhasm: stack32 x08_stack

# qhasm: stack32 x09_stack

# qhasm: stack32 x0a_stack

# qhasm: stack32 x0b_stack

# qhasm: stack32 x10_stack

# qhasm: stack32 x11_stack

# qhasm: stack32 x12_stack

# qhasm: stack32 x13_stack

# qhasm: stack32 x14_stack

# qhasm: stack32 x15_stack

# qhasm: stack32 x16_stack

# qhasm: stack32 x17_stack

# qhasm: stack32 x18_stack

# qhasm: stack32 x19_stack

# qhasm: stack32 x1a_stack

# qhasm: stack32 x1b_stack

# qhasm: stack32 x1c_stack

# qhasm: stack32 x1d_stack

# qhasm: stack32 x1e_stack

# qhasm: stack32 x1f_stack

# qhasm: int64 r11

# qhasm: int64 r12

# qhasm: int64 r13

# qhasm: int64 r14

# qhasm: int64 r15

# qhasm: int64 rbx

# qhasm: int64 rbp

# qhasm: caller r11

# qhasm: caller r12

# qhasm: caller r13

# qhasm: caller r14

# qhasm: caller r15

# qhasm: caller rbx

# qhasm: caller rbp

# qhasm: stack64 r11_stack

# qhasm: stack64 r12_stack

# qhasm: stack64 r13_stack

# qhasm: stack64 r14_stack

# qhasm: stack64 r15_stack

# qhasm: stack64 rbx_stack

# qhasm: stack64 rbp_stack

# qhasm: enter crypto_hash_cubehash1632_amd64_32
.text
.p2align 5
.globl _crypto_hash_cubehash1632_amd64_32
.globl crypto_hash_cubehash1632_amd64_32
_crypto_hash_cubehash1632_amd64_32:
crypto_hash_cubehash1632_amd64_32:
mov %rsp,%r11
and $31,%r11
add $256,%r11
sub %r11,%rsp

# qhasm:   out_stack = out
# asm 1: movq <out=int64#1,>out_stack=stack64#1
# asm 2: movq <out=%rdi,>out_stack=160(%rsp)
movq %rdi,160(%rsp)

# qhasm:   inlen_stack = inlen
# asm 1: movq <inlen=int64#3,>inlen_stack=stack64#2
# asm 2: movq <inlen=%rdx,>inlen_stack=168(%rsp)
movq %rdx,168(%rsp)

# qhasm:   r11_stack = r11
# asm 1: movq <r11=int64#9,>r11_stack=stack64#3
# asm 2: movq <r11=%r11,>r11_stack=176(%rsp)
movq %r11,176(%rsp)

# qhasm:   r12_stack = r12
# asm 1: movq <r12=int64#10,>r12_stack=stack64#4
# asm 2: movq <r12=%r12,>r12_stack=184(%rsp)
movq %r12,184(%rsp)

# qhasm:   r13_stack = r13
# asm 1: movq <r13=int64#11,>r13_stack=stack64#5
# asm 2: movq <r13=%r13,>r13_stack=192(%rsp)
movq %r13,192(%rsp)

# qhasm:   r14_stack = r14
# asm 1: movq <r14=int64#12,>r14_stack=stack64#6
# asm 2: movq <r14=%r14,>r14_stack=200(%rsp)
movq %r14,200(%rsp)

# qhasm:   r15_stack = r15
# asm 1: movq <r15=int64#13,>r15_stack=stack64#7
# asm 2: movq <r15=%r15,>r15_stack=208(%rsp)
movq %r15,208(%rsp)

# qhasm:   rbx_stack = rbx
# asm 1: movq <rbx=int64#14,>rbx_stack=stack64#8
# asm 2: movq <rbx=%rbx,>rbx_stack=216(%rsp)
movq %rbx,216(%rsp)

# qhasm:   rbp_stack = rbp
# asm 1: movq <rbp=int64#15,>rbp_stack=stack64#9
# asm 2: movq <rbp=%rbp,>rbp_stack=224(%rsp)
movq %rbp,224(%rsp)

# qhasm:   x08 = 0x4d42c787
# asm 1: mov  $0x4d42c787,>x08=int64#1
# asm 2: mov  $0x4d42c787,>x08=%rdi
mov  $0x4d42c787,%rdi

# qhasm:   x09 = 0xa647a8b3
# asm 1: mov  $0xa647a8b3,>x09=int64#3
# asm 2: mov  $0xa647a8b3,>x09=%rdx
mov  $0xa647a8b3,%rdx

# qhasm:   x0a = 0x97cf0bef
# asm 1: mov  $0x97cf0bef,>x0a=int64#4
# asm 2: mov  $0x97cf0bef,>x0a=%rcx
mov  $0x97cf0bef,%rcx

# qhasm:   x0b = 0x825b4537
# asm 1: mov  $0x825b4537,>x0b=int64#5
# asm 2: mov  $0x825b4537,>x0b=%r8
mov  $0x825b4537,%r8

# qhasm:   x0c = 0xeef864d2
# asm 1: mov  $0xeef864d2,>x0c=int64#6
# asm 2: mov  $0xeef864d2,>x0c=%r9
mov  $0xeef864d2,%r9

# qhasm:   x0d = 0xf22090c4
# asm 1: mov  $0xf22090c4,>x0d=int64#7
# asm 2: mov  $0xf22090c4,>x0d=%rax
mov  $0xf22090c4,%rax

# qhasm:   x0e = 0xd0e5cd33
# asm 1: mov  $0xd0e5cd33,>x0e=int64#8
# asm 2: mov  $0xd0e5cd33,>x0e=%r10
mov  $0xd0e5cd33,%r10

# qhasm:   x0f = 0xa23911ae
# asm 1: mov  $0xa23911ae,>x0f=int64#9
# asm 2: mov  $0xa23911ae,>x0f=%r11
mov  $0xa23911ae,%r11

# qhasm:   x08_stack = x08
# asm 1: movl <x08=int64#1d,>x08_stack=stack32#1
# asm 2: movl <x08=%edi,>x08_stack=0(%rsp)
movl %edi,0(%rsp)

# qhasm:   x09_stack = x09
# asm 1: movl <x09=int64#3d,>x09_stack=stack32#2
# asm 2: movl <x09=%edx,>x09_stack=4(%rsp)
movl %edx,4(%rsp)

# qhasm:   x0a_stack = x0a
# asm 1: movl <x0a=int64#4d,>x0a_stack=stack32#3
# asm 2: movl <x0a=%ecx,>x0a_stack=8(%rsp)
movl %ecx,8(%rsp)

# qhasm:   x0b_stack = x0b
# asm 1: movl <x0b=int64#5d,>x0b_stack=stack32#4
# asm 2: movl <x0b=%r8d,>x0b_stack=12(%rsp)
movl %r8d,12(%rsp)

# qhasm:   x10 = 0xfcd398d9
# asm 1: mov  $0xfcd398d9,>x10=int64#1
# asm 2: mov  $0xfcd398d9,>x10=%rdi
mov  $0xfcd398d9,%rdi

# qhasm:   x11 = 0x148fe485
# asm 1: mov  $0x148fe485,>x11=int64#3
# asm 2: mov  $0x148fe485,>x11=%rdx
mov  $0x148fe485,%rdx

# qhasm:   x12 = 0x1b017bef
# asm 1: mov  $0x1b017bef,>x12=int64#4
# asm 2: mov  $0x1b017bef,>x12=%rcx
mov  $0x1b017bef,%rcx

# qhasm:   x13 = 0xb6444532
# asm 1: mov  $0xb6444532,>x13=int64#5
# asm 2: mov  $0xb6444532,>x13=%r8
mov  $0xb6444532,%r8

# qhasm:   x14 = 0x6a536159
# asm 1: mov  $0x6a536159,>x14=int64#10
# asm 2: mov  $0x6a536159,>x14=%r12
mov  $0x6a536159,%r12

# qhasm:   x15 = 0x2ff5781c
# asm 1: mov  $0x2ff5781c,>x15=int64#11
# asm 2: mov  $0x2ff5781c,>x15=%r13
mov  $0x2ff5781c,%r13

# qhasm:   x16 = 0x91fa7934
# asm 1: mov  $0x91fa7934,>x16=int64#12
# asm 2: mov  $0x91fa7934,>x16=%r14
mov  $0x91fa7934,%r14

# qhasm:   x17 = 0x0dbadea9
# asm 1: mov  $0x0dbadea9,>x17=int64#13
# asm 2: mov  $0x0dbadea9,>x17=%r15
mov  $0x0dbadea9,%r15

# qhasm:   x10_stack = x10
# asm 1: movl <x10=int64#1d,>x10_stack=stack32#5
# asm 2: movl <x10=%edi,>x10_stack=16(%rsp)
movl %edi,16(%rsp)

# qhasm:   x11_stack = x11
# asm 1: movl <x11=int64#3d,>x11_stack=stack32#6
# asm 2: movl <x11=%edx,>x11_stack=20(%rsp)
movl %edx,20(%rsp)

# qhasm:   x12_stack = x12
# asm 1: movl <x12=int64#4d,>x12_stack=stack32#7
# asm 2: movl <x12=%ecx,>x12_stack=24(%rsp)
movl %ecx,24(%rsp)

# qhasm:   x13_stack = x13
# asm 1: movl <x13=int64#5d,>x13_stack=stack32#8
# asm 2: movl <x13=%r8d,>x13_stack=28(%rsp)
movl %r8d,28(%rsp)

# qhasm:   x14_stack = x14
# asm 1: movl <x14=int64#10d,>x14_stack=stack32#9
# asm 2: movl <x14=%r12d,>x14_stack=32(%rsp)
movl %r12d,32(%rsp)

# qhasm:   x15_stack = x15
# asm 1: movl <x15=int64#11d,>x15_stack=stack32#10
# asm 2: movl <x15=%r13d,>x15_stack=36(%rsp)
movl %r13d,36(%rsp)

# qhasm:   x16_stack = x16
# asm 1: movl <x16=int64#12d,>x16_stack=stack32#11
# asm 2: movl <x16=%r14d,>x16_stack=40(%rsp)
movl %r14d,40(%rsp)

# qhasm:   x17_stack = x17
# asm 1: movl <x17=int64#13d,>x17_stack=stack32#12
# asm 2: movl <x17=%r15d,>x17_stack=44(%rsp)
movl %r15d,44(%rsp)

# qhasm:   x18 = 0xd65c8a2b
# asm 1: mov  $0xd65c8a2b,>x18=int64#1
# asm 2: mov  $0xd65c8a2b,>x18=%rdi
mov  $0xd65c8a2b,%rdi

# qhasm:   x19 = 0xa5a70e75
# asm 1: mov  $0xa5a70e75,>x19=int64#3
# asm 2: mov  $0xa5a70e75,>x19=%rdx
mov  $0xa5a70e75,%rdx

# qhasm:   x1a = 0xb1c62456
# asm 1: mov  $0xb1c62456,>x1a=int64#4
# asm 2: mov  $0xb1c62456,>x1a=%rcx
mov  $0xb1c62456,%rcx

# qhasm:   x1b = 0xbc796576
# asm 1: mov  $0xbc796576,>x1b=int64#5
# asm 2: mov  $0xbc796576,>x1b=%r8
mov  $0xbc796576,%r8

# qhasm:   x1c = 0x1921c8f7
# asm 1: mov  $0x1921c8f7,>x1c=int64#10
# asm 2: mov  $0x1921c8f7,>x1c=%r12
mov  $0x1921c8f7,%r12

# qhasm:   x1d = 0xe7989af1
# asm 1: mov  $0xe7989af1,>x1d=int64#11
# asm 2: mov  $0xe7989af1,>x1d=%r13
mov  $0xe7989af1,%r13

# qhasm:   x1e = 0x7795d246
# asm 1: mov  $0x7795d246,>x1e=int64#12
# asm 2: mov  $0x7795d246,>x1e=%r14
mov  $0x7795d246,%r14

# qhasm:   x1f = 0xd43e3b44
# asm 1: mov  $0xd43e3b44,>x1f=int64#13
# asm 2: mov  $0xd43e3b44,>x1f=%r15
mov  $0xd43e3b44,%r15

# qhasm:   x18_stack = x18
# asm 1: movl <x18=int64#1d,>x18_stack=stack32#13
# asm 2: movl <x18=%edi,>x18_stack=48(%rsp)
movl %edi,48(%rsp)

# qhasm:   x19_stack = x19
# asm 1: movl <x19=int64#3d,>x19_stack=stack32#14
# asm 2: movl <x19=%edx,>x19_stack=52(%rsp)
movl %edx,52(%rsp)

# qhasm:   x1a_stack = x1a
# asm 1: movl <x1a=int64#4d,>x1a_stack=stack32#15
# asm 2: movl <x1a=%ecx,>x1a_stack=56(%rsp)
movl %ecx,56(%rsp)

# qhasm:   x1b_stack = x1b
# asm 1: movl <x1b=int64#5d,>x1b_stack=stack32#16
# asm 2: movl <x1b=%r8d,>x1b_stack=60(%rsp)
movl %r8d,60(%rsp)

# qhasm:   x1c_stack = x1c
# asm 1: movl <x1c=int64#10d,>x1c_stack=stack32#17
# asm 2: movl <x1c=%r12d,>x1c_stack=64(%rsp)
movl %r12d,64(%rsp)

# qhasm:   x1d_stack = x1d
# asm 1: movl <x1d=int64#11d,>x1d_stack=stack32#18
# asm 2: movl <x1d=%r13d,>x1d_stack=68(%rsp)
movl %r13d,68(%rsp)

# qhasm:   x1e_stack = x1e
# asm 1: movl <x1e=int64#12d,>x1e_stack=stack32#19
# asm 2: movl <x1e=%r14d,>x1e_stack=72(%rsp)
movl %r14d,72(%rsp)

# qhasm:   x1f_stack = x1f
# asm 1: movl <x1f=int64#13d,>x1f_stack=stack32#20
# asm 2: movl <x1f=%r15d,>x1f_stack=76(%rsp)
movl %r15d,76(%rsp)

# qhasm:   x00 = 0x2aea2a61
# asm 1: mov  $0x2aea2a61,>x00=int64#3
# asm 2: mov  $0x2aea2a61,>x00=%rdx
mov  $0x2aea2a61,%rdx

# qhasm:   x01 = 0x50f494d4
# asm 1: mov  $0x50f494d4,>x01=int64#5
# asm 2: mov  $0x50f494d4,>x01=%r8
mov  $0x50f494d4,%r8

# qhasm:   x02 = 0x2d538b8b
# asm 1: mov  $0x2d538b8b,>x02=int64#10
# asm 2: mov  $0x2d538b8b,>x02=%r12
mov  $0x2d538b8b,%r12

# qhasm:   x03 = 0x4167d83e
# asm 1: mov  $0x4167d83e,>x03=int64#11
# asm 2: mov  $0x4167d83e,>x03=%r13
mov  $0x4167d83e,%r13

# qhasm:   x04 = 0x3fee2313
# asm 1: mov  $0x3fee2313,>x04=int64#12
# asm 2: mov  $0x3fee2313,>x04=%r14
mov  $0x3fee2313,%r14

# qhasm:   x05 = 0xc701cf8c
# asm 1: mov  $0xc701cf8c,>x05=int64#13
# asm 2: mov  $0xc701cf8c,>x05=%r15
mov  $0xc701cf8c,%r15

# qhasm:   x06 = 0xcc39968e
# asm 1: mov  $0xcc39968e,>x06=int64#14
# asm 2: mov  $0xcc39968e,>x06=%rbx
mov  $0xcc39968e,%rbx

# qhasm:   x07 = 0x50ac5695
# asm 1: mov  $0x50ac5695,>x07=int64#1
# asm 2: mov  $0x50ac5695,>x07=%rdi
mov  $0x50ac5695,%rdi

# qhasm:   x07_stack = x07
# asm 1: movl <x07=int64#1d,>x07_stack=stack32#21
# asm 2: movl <x07=%edi,>x07_stack=80(%rsp)
movl %edi,80(%rsp)

# qhasm:   finalization = 0
# asm 1: mov  $0,>finalization=int64#1
# asm 2: mov  $0,>finalization=%rdi
mov  $0,%rdi

# qhasm: checkinlen:
._checkinlen:

# qhasm:   inlen = inlen_stack
# asm 1: movq <inlen_stack=stack64#2,>inlen=int64#4
# asm 2: movq <inlen_stack=168(%rsp),>inlen=%rcx
movq 168(%rsp),%rcx

# qhasm:                      unsigned<? inlen -= 32
# asm 1: sub  $32,<inlen=int64#4
# asm 2: sub  $32,<inlen=%rcx
sub  $32,%rcx
# comment:fp stack unchanged by jump

# qhasm: goto inlenbelow32 if unsigned<
jb ._inlenbelow32
# comment:fp stack unchanged by fallthrough

# qhasm: mainloop:
._mainloop:

# qhasm:   r = 16
# asm 1: mov  $16,>r=int64#15
# asm 2: mov  $16,>r=%rbp
mov  $16,%rbp

# qhasm:   finalization_stack = finalization
# asm 1: movl <finalization=int64#1d,>finalization_stack=stack32#22
# asm 2: movl <finalization=%edi,>finalization_stack=84(%rsp)
movl %edi,84(%rsp)

# qhasm:   inlen_stack = inlen
# asm 1: movq <inlen=int64#4,>inlen_stack=stack64#2
# asm 2: movq <inlen=%rcx,>inlen_stack=168(%rsp)
movq %rcx,168(%rsp)

# qhasm:   (uint32) x00 ^= *(uint32 *) (in + 0)
# asm 1: xorl 0(<in=int64#2),<x00=int64#3d
# asm 2: xorl 0(<in=%rsi),<x00=%edx
xorl 0(%rsi),%edx

# qhasm:   (uint32) x01 ^= *(uint32 *) (in + 4)
# asm 1: xorl 4(<in=int64#2),<x01=int64#5d
# asm 2: xorl 4(<in=%rsi),<x01=%r8d
xorl 4(%rsi),%r8d

# qhasm:   (uint32) x02 ^= *(uint32 *) (in + 8)
# asm 1: xorl 8(<in=int64#2),<x02=int64#10d
# asm 2: xorl 8(<in=%rsi),<x02=%r12d
xorl 8(%rsi),%r12d

# qhasm:   (uint32) x03 ^= *(uint32 *) (in + 12)
# asm 1: xorl 12(<in=int64#2),<x03=int64#11d
# asm 2: xorl 12(<in=%rsi),<x03=%r13d
xorl 12(%rsi),%r13d

# qhasm:   x07 = x07_stack
# asm 1: movl <x07_stack=stack32#21,>x07=int64#1d
# asm 2: movl <x07_stack=80(%rsp),>x07=%edi
movl 80(%rsp),%edi

# qhasm:   (uint32) x04 ^= *(uint32 *) (in + 16)
# asm 1: xorl 16(<in=int64#2),<x04=int64#12d
# asm 2: xorl 16(<in=%rsi),<x04=%r14d
xorl 16(%rsi),%r14d

# qhasm:   (uint32) x05 ^= *(uint32 *) (in + 20)
# asm 1: xorl 20(<in=int64#2),<x05=int64#13d
# asm 2: xorl 20(<in=%rsi),<x05=%r15d
xorl 20(%rsi),%r15d

# qhasm:   (uint32) x06 ^= *(uint32 *) (in + 24)
# asm 1: xorl 24(<in=int64#2),<x06=int64#14d
# asm 2: xorl 24(<in=%rsi),<x06=%ebx
xorl 24(%rsi),%ebx

# qhasm:   (uint32) x07 ^= *(uint32 *) (in + 28)
# asm 1: xorl 28(<in=int64#2),<x07=int64#1d
# asm 2: xorl 28(<in=%rsi),<x07=%edi
xorl 28(%rsi),%edi

# qhasm:   x07_stack = x07
# asm 1: movl <x07=int64#1d,>x07_stack=stack32#21
# asm 2: movl <x07=%edi,>x07_stack=80(%rsp)
movl %edi,80(%rsp)

# qhasm:   in += 32
# asm 1: add  $32,<in=int64#2
# asm 2: add  $32,<in=%rsi
add  $32,%rsi

# qhasm:   in_stack = in
# asm 1: movq <in=int64#2,>in_stack=stack64#10
# asm 2: movq <in=%rsi,>in_stack=232(%rsp)
movq %rsi,232(%rsp)
# comment:fp stack unchanged by fallthrough

# qhasm: morerounds:
._morerounds:

# qhasm: r_stack = r
# asm 1: movl <r=int64#15d,>r_stack=stack32#23
# asm 2: movl <r=%ebp,>r_stack=88(%rsp)
movl %ebp,88(%rsp)

# qhasm: x10 = x10_stack
# asm 1: movl <x10_stack=stack32#5,>x10=int64#1d
# asm 2: movl <x10_stack=16(%rsp),>x10=%edi
movl 16(%rsp),%edi

# qhasm: x08 = x08_stack
# asm 1: movl <x08_stack=stack32#1,>x08=int64#2d
# asm 2: movl <x08_stack=0(%rsp),>x08=%esi
movl 0(%rsp),%esi

# qhasm: x18 = x18_stack
# asm 1: movl <x18_stack=stack32#13,>x18=int64#4d
# asm 2: movl <x18_stack=48(%rsp),>x18=%ecx
movl 48(%rsp),%ecx

# qhasm: (uint32) x10 += x00
# asm 1: add <x00=int64#3d,<x10=int64#1d
# asm 2: add <x00=%edx,<x10=%edi
add %edx,%edi

# qhasm: x10_stack = x10
# asm 1: movl <x10=int64#1d,>x10_stack=stack32#1
# asm 2: movl <x10=%edi,>x10_stack=0(%rsp)
movl %edi,0(%rsp)

# qhasm: (uint32) x18 += x08
# asm 1: add <x08=int64#2d,<x18=int64#4d
# asm 2: add <x08=%esi,<x18=%ecx
add %esi,%ecx

# qhasm: x18_stack = x18
# asm 1: movl <x18=int64#4d,>x18_stack=stack32#5
# asm 2: movl <x18=%ecx,>x18_stack=16(%rsp)
movl %ecx,16(%rsp)

# qhasm: (uint32) x00 <<<= 7
# asm 1: rol  $7,<x00=int64#3d
# asm 2: rol  $7,<x00=%edx
rol  $7,%edx

# qhasm: (uint32) x08 <<<= 7
# asm 1: rol  $7,<x08=int64#2d
# asm 2: rol  $7,<x08=%esi
rol  $7,%esi

# qhasm: (uint32) x00 ^= x18
# asm 1: xor <x18=int64#4d,<x00=int64#3d
# asm 2: xor <x18=%ecx,<x00=%edx
xor %ecx,%edx

# qhasm: (uint32) x08 ^= x10
# asm 1: xor <x10=int64#1d,<x08=int64#2d
# asm 2: xor <x10=%edi,<x08=%esi
xor %edi,%esi

# qhasm:   x14 = x14_stack
# asm 1: movl <x14_stack=stack32#9,>x14=int64#1d
# asm 2: movl <x14_stack=32(%rsp),>x14=%edi
movl 32(%rsp),%edi

# qhasm:   x1c = x1c_stack
# asm 1: movl <x1c_stack=stack32#17,>x1c=int64#4d
# asm 2: movl <x1c_stack=64(%rsp),>x1c=%ecx
movl 64(%rsp),%ecx

# qhasm: x08_stack = x08
# asm 1: movl <x08=int64#2d,>x08_stack=stack32#9
# asm 2: movl <x08=%esi,>x08_stack=32(%rsp)
movl %esi,32(%rsp)

# qhasm:   (uint32) x14 += x04
# asm 1: add <x04=int64#12d,<x14=int64#1d
# asm 2: add <x04=%r14d,<x14=%edi
add %r14d,%edi

# qhasm:   x14_stack = x14
# asm 1: movl <x14=int64#1d,>x14_stack=stack32#13
# asm 2: movl <x14=%edi,>x14_stack=48(%rsp)
movl %edi,48(%rsp)

# qhasm:   (uint32) x1c += x0c
# asm 1: add <x0c=int64#6d,<x1c=int64#4d
# asm 2: add <x0c=%r9d,<x1c=%ecx
add %r9d,%ecx

# qhasm:   x1c_stack = x1c
# asm 1: movl <x1c=int64#4d,>x1c_stack=stack32#17
# asm 2: movl <x1c=%ecx,>x1c_stack=64(%rsp)
movl %ecx,64(%rsp)

# qhasm:   (uint32) x04 <<<= 7
# asm 1: rol  $7,<x04=int64#12d
# asm 2: rol  $7,<x04=%r14d
rol  $7,%r14d

# qhasm:   (uint32) x0c <<<= 7
# asm 1: rol  $7,<x0c=int64#6d
# asm 2: rol  $7,<x0c=%r9d
rol  $7,%r9d

# qhasm: x12 = x12_stack
# asm 1: movl <x12_stack=stack32#7,>x12=int64#2d
# asm 2: movl <x12_stack=24(%rsp),>x12=%esi
movl 24(%rsp),%esi

# qhasm:   (uint32) x04 ^= x1c
# asm 1: xor <x1c=int64#4d,<x04=int64#12d
# asm 2: xor <x1c=%ecx,<x04=%r14d
xor %ecx,%r14d

# qhasm: x0a = x0a_stack
# asm 1: movl <x0a_stack=stack32#3,>x0a=int64#4d
# asm 2: movl <x0a_stack=8(%rsp),>x0a=%ecx
movl 8(%rsp),%ecx

# qhasm:   (uint32) x0c ^= x14
# asm 1: xor <x14=int64#1d,<x0c=int64#6d
# asm 2: xor <x14=%edi,<x0c=%r9d
xor %edi,%r9d

# qhasm: x1a = x1a_stack
# asm 1: movl <x1a_stack=stack32#15,>x1a=int64#1d
# asm 2: movl <x1a_stack=56(%rsp),>x1a=%edi
movl 56(%rsp),%edi

# qhasm: (uint32) x12 += x02
# asm 1: add <x02=int64#10d,<x12=int64#2d
# asm 2: add <x02=%r12d,<x12=%esi
add %r12d,%esi

# qhasm: x12_stack = x12
# asm 1: movl <x12=int64#2d,>x12_stack=stack32#3
# asm 2: movl <x12=%esi,>x12_stack=8(%rsp)
movl %esi,8(%rsp)

# qhasm: (uint32) x1a += x0a
# asm 1: add <x0a=int64#4d,<x1a=int64#1d
# asm 2: add <x0a=%ecx,<x1a=%edi
add %ecx,%edi

# qhasm: x1a_stack = x1a
# asm 1: movl <x1a=int64#1d,>x1a_stack=stack32#7
# asm 2: movl <x1a=%edi,>x1a_stack=24(%rsp)
movl %edi,24(%rsp)

# qhasm: (uint32) x02 <<<= 7
# asm 1: rol  $7,<x02=int64#10d
# asm 2: rol  $7,<x02=%r12d
rol  $7,%r12d

# qhasm: (uint32) x0a <<<= 7
# asm 1: rol  $7,<x0a=int64#4d
# asm 2: rol  $7,<x0a=%ecx
rol  $7,%ecx

# qhasm: (uint32) x02 ^= x1a
# asm 1: xor <x1a=int64#1d,<x02=int64#10d
# asm 2: xor <x1a=%edi,<x02=%r12d
xor %edi,%r12d

# qhasm: (uint32) x0a ^= x12
# asm 1: xor <x12=int64#2d,<x0a=int64#4d
# asm 2: xor <x12=%esi,<x0a=%ecx
xor %esi,%ecx

# qhasm:   x16 = x16_stack
# asm 1: movl <x16_stack=stack32#11,>x16=int64#1d
# asm 2: movl <x16_stack=40(%rsp),>x16=%edi
movl 40(%rsp),%edi

# qhasm:   x1e = x1e_stack
# asm 1: movl <x1e_stack=stack32#19,>x1e=int64#2d
# asm 2: movl <x1e_stack=72(%rsp),>x1e=%esi
movl 72(%rsp),%esi

# qhasm: x0a_stack = x0a
# asm 1: movl <x0a=int64#4d,>x0a_stack=stack32#11
# asm 2: movl <x0a=%ecx,>x0a_stack=40(%rsp)
movl %ecx,40(%rsp)

# qhasm:   (uint32) x16 += x06
# asm 1: add <x06=int64#14d,<x16=int64#1d
# asm 2: add <x06=%ebx,<x16=%edi
add %ebx,%edi

# qhasm:   x16_stack = x16
# asm 1: movl <x16=int64#1d,>x16_stack=stack32#15
# asm 2: movl <x16=%edi,>x16_stack=56(%rsp)
movl %edi,56(%rsp)

# qhasm:   (uint32) x1e += x0e
# asm 1: add <x0e=int64#8d,<x1e=int64#2d
# asm 2: add <x0e=%r10d,<x1e=%esi
add %r10d,%esi

# qhasm:   x1e_stack = x1e
# asm 1: movl <x1e=int64#2d,>x1e_stack=stack32#19
# asm 2: movl <x1e=%esi,>x1e_stack=72(%rsp)
movl %esi,72(%rsp)

# qhasm:   (uint32) x06 <<<= 7
# asm 1: rol  $7,<x06=int64#14d
# asm 2: rol  $7,<x06=%ebx
rol  $7,%ebx

# qhasm:   (uint32) x0e <<<= 7
# asm 1: rol  $7,<x0e=int64#8d
# asm 2: rol  $7,<x0e=%r10d
rol  $7,%r10d

# qhasm: x11 = x11_stack
# asm 1: movl <x11_stack=stack32#6,>x11=int64#4d
# asm 2: movl <x11_stack=20(%rsp),>x11=%ecx
movl 20(%rsp),%ecx

# qhasm:   (uint32) x06 ^= x1e
# asm 1: xor <x1e=int64#2d,<x06=int64#14d
# asm 2: xor <x1e=%esi,<x06=%ebx
xor %esi,%ebx

# qhasm: x09 = x09_stack
# asm 1: movl <x09_stack=stack32#2,>x09=int64#2d
# asm 2: movl <x09_stack=4(%rsp),>x09=%esi
movl 4(%rsp),%esi

# qhasm:   (uint32) x0e ^= x16
# asm 1: xor <x16=int64#1d,<x0e=int64#8d
# asm 2: xor <x16=%edi,<x0e=%r10d
xor %edi,%r10d

# qhasm: x19 = x19_stack
# asm 1: movl <x19_stack=stack32#14,>x19=int64#1d
# asm 2: movl <x19_stack=52(%rsp),>x19=%edi
movl 52(%rsp),%edi

# qhasm: (uint32) x11 += x01
# asm 1: add <x01=int64#5d,<x11=int64#4d
# asm 2: add <x01=%r8d,<x11=%ecx
add %r8d,%ecx

# qhasm: x11_stack = x11
# asm 1: movl <x11=int64#4d,>x11_stack=stack32#2
# asm 2: movl <x11=%ecx,>x11_stack=4(%rsp)
movl %ecx,4(%rsp)

# qhasm: (uint32) x19 += x09
# asm 1: add <x09=int64#2d,<x19=int64#1d
# asm 2: add <x09=%esi,<x19=%edi
add %esi,%edi

# qhasm: x19_stack = x19
# asm 1: movl <x19=int64#1d,>x19_stack=stack32#6
# asm 2: movl <x19=%edi,>x19_stack=20(%rsp)
movl %edi,20(%rsp)

# qhasm: (uint32) x01 <<<= 7
# asm 1: rol  $7,<x01=int64#5d
# asm 2: rol  $7,<x01=%r8d
rol  $7,%r8d

# qhasm: (uint32) x09 <<<= 7
# asm 1: rol  $7,<x09=int64#2d
# asm 2: rol  $7,<x09=%esi
rol  $7,%esi

# qhasm:   x15 = x15_stack
# asm 1: movl <x15_stack=stack32#10,>x15=int64#15d
# asm 2: movl <x15_stack=36(%rsp),>x15=%ebp
movl 36(%rsp),%ebp

# qhasm: (uint32) x01 ^= x19
# asm 1: xor <x19=int64#1d,<x01=int64#5d
# asm 2: xor <x19=%edi,<x01=%r8d
xor %edi,%r8d

# qhasm:   x1d = x1d_stack
# asm 1: movl <x1d_stack=stack32#18,>x1d=int64#1d
# asm 2: movl <x1d_stack=68(%rsp),>x1d=%edi
movl 68(%rsp),%edi

# qhasm: (uint32) x09 ^= x11
# asm 1: xor <x11=int64#4d,<x09=int64#2d
# asm 2: xor <x11=%ecx,<x09=%esi
xor %ecx,%esi

# qhasm: x09_stack = x09
# asm 1: movl <x09=int64#2d,>x09_stack=stack32#10
# asm 2: movl <x09=%esi,>x09_stack=36(%rsp)
movl %esi,36(%rsp)

# qhasm:   (uint32) x15 += x05
# asm 1: add <x05=int64#13d,<x15=int64#15d
# asm 2: add <x05=%r15d,<x15=%ebp
add %r15d,%ebp

# qhasm:   x15_stack = x15
# asm 1: movl <x15=int64#15d,>x15_stack=stack32#14
# asm 2: movl <x15=%ebp,>x15_stack=52(%rsp)
movl %ebp,52(%rsp)

# qhasm:   (uint32) x1d += x0d
# asm 1: add <x0d=int64#7d,<x1d=int64#1d
# asm 2: add <x0d=%eax,<x1d=%edi
add %eax,%edi

# qhasm:   x1d_stack = x1d
# asm 1: movl <x1d=int64#1d,>x1d_stack=stack32#18
# asm 2: movl <x1d=%edi,>x1d_stack=68(%rsp)
movl %edi,68(%rsp)

# qhasm:   (uint32) x05 <<<= 7
# asm 1: rol  $7,<x05=int64#13d
# asm 2: rol  $7,<x05=%r15d
rol  $7,%r15d

# qhasm:   (uint32) x0d <<<= 7
# asm 1: rol  $7,<x0d=int64#7d
# asm 2: rol  $7,<x0d=%eax
rol  $7,%eax

# qhasm: x13 = x13_stack
# asm 1: movl <x13_stack=stack32#8,>x13=int64#2d
# asm 2: movl <x13_stack=28(%rsp),>x13=%esi
movl 28(%rsp),%esi

# qhasm:   (uint32) x05 ^= x1d
# asm 1: xor <x1d=int64#1d,<x05=int64#13d
# asm 2: xor <x1d=%edi,<x05=%r15d
xor %edi,%r15d

# qhasm: x0b = x0b_stack
# asm 1: movl <x0b_stack=stack32#4,>x0b=int64#1d
# asm 2: movl <x0b_stack=12(%rsp),>x0b=%edi
movl 12(%rsp),%edi

# qhasm:   (uint32) x0d ^= x15
# asm 1: xor <x15=int64#15d,<x0d=int64#7d
# asm 2: xor <x15=%ebp,<x0d=%eax
xor %ebp,%eax

# qhasm: x1b = x1b_stack
# asm 1: movl <x1b_stack=stack32#16,>x1b=int64#4d
# asm 2: movl <x1b_stack=60(%rsp),>x1b=%ecx
movl 60(%rsp),%ecx

# qhasm: (uint32) x13 += x03
# asm 1: add <x03=int64#11d,<x13=int64#2d
# asm 2: add <x03=%r13d,<x13=%esi
add %r13d,%esi

# qhasm: x13_stack = x13
# asm 1: movl <x13=int64#2d,>x13_stack=stack32#4
# asm 2: movl <x13=%esi,>x13_stack=12(%rsp)
movl %esi,12(%rsp)

# qhasm: (uint32) x1b += x0b
# asm 1: add <x0b=int64#1d,<x1b=int64#4d
# asm 2: add <x0b=%edi,<x1b=%ecx
add %edi,%ecx

# qhasm: x1b_stack = x1b
# asm 1: movl <x1b=int64#4d,>x1b_stack=stack32#8
# asm 2: movl <x1b=%ecx,>x1b_stack=28(%rsp)
movl %ecx,28(%rsp)

# qhasm: (uint32) x03 <<<= 7
# asm 1: rol  $7,<x03=int64#11d
# asm 2: rol  $7,<x03=%r13d
rol  $7,%r13d

# qhasm: (uint32) x0b <<<= 7
# asm 1: rol  $7,<x0b=int64#1d
# asm 2: rol  $7,<x0b=%edi
rol  $7,%edi

# qhasm: (uint32) x03 ^= x1b
# asm 1: xor <x1b=int64#4d,<x03=int64#11d
# asm 2: xor <x1b=%ecx,<x03=%r13d
xor %ecx,%r13d

# qhasm: (uint32) x0b ^= x13
# asm 1: xor <x13=int64#2d,<x0b=int64#1d
# asm 2: xor <x13=%esi,<x0b=%edi
xor %esi,%edi

# qhasm:   x07 = x07_stack
# asm 1: movl <x07_stack=stack32#21,>x07=int64#2d
# asm 2: movl <x07_stack=80(%rsp),>x07=%esi
movl 80(%rsp),%esi

# qhasm:   x17 = x17_stack
# asm 1: movl <x17_stack=stack32#12,>x17=int64#4d
# asm 2: movl <x17_stack=44(%rsp),>x17=%ecx
movl 44(%rsp),%ecx

# qhasm:   x1f = x1f_stack
# asm 1: movl <x1f_stack=stack32#20,>x1f=int64#15d
# asm 2: movl <x1f_stack=76(%rsp),>x1f=%ebp
movl 76(%rsp),%ebp

# qhasm: x0b_stack = x0b
# asm 1: movl <x0b=int64#1d,>x0b_stack=stack32#12
# asm 2: movl <x0b=%edi,>x0b_stack=44(%rsp)
movl %edi,44(%rsp)

# qhasm:   (uint32) x17 += x07
# asm 1: add <x07=int64#2d,<x17=int64#4d
# asm 2: add <x07=%esi,<x17=%ecx
add %esi,%ecx

# qhasm:   (uint32) x1f += x0f
# asm 1: add <x0f=int64#9d,<x1f=int64#15d
# asm 2: add <x0f=%r11d,<x1f=%ebp
add %r11d,%ebp

# qhasm:   x1f_stack = x1f
# asm 1: movl <x1f=int64#15d,>x1f_stack=stack32#16
# asm 2: movl <x1f=%ebp,>x1f_stack=60(%rsp)
movl %ebp,60(%rsp)

# qhasm:   (uint32) x07 <<<= 7
# asm 1: rol  $7,<x07=int64#2d
# asm 2: rol  $7,<x07=%esi
rol  $7,%esi

# qhasm:   (uint32) x0f <<<= 7
# asm 1: rol  $7,<x0f=int64#9d
# asm 2: rol  $7,<x0f=%r11d
rol  $7,%r11d

# qhasm:   (uint32) x07 ^= x1f
# asm 1: xor <x1f=int64#15d,<x07=int64#2d
# asm 2: xor <x1f=%ebp,<x07=%esi
xor %ebp,%esi

# qhasm:   (uint32) x0f ^= x17
# asm 1: xor <x17=int64#4d,<x0f=int64#9d
# asm 2: xor <x17=%ecx,<x0f=%r11d
xor %ecx,%r11d

# qhasm: x09 = x09_stack
# asm 1: movl <x09_stack=stack32#10,>x09=int64#1d
# asm 2: movl <x09_stack=36(%rsp),>x09=%edi
movl 36(%rsp),%edi

# qhasm: x13 = x13_stack
# asm 1: movl <x13_stack=stack32#4,>x13=int64#15d
# asm 2: movl <x13_stack=12(%rsp),>x13=%ebp
movl 12(%rsp),%ebp

# qhasm: (uint32) x13 += x09
# asm 1: add <x09=int64#1d,<x13=int64#15d
# asm 2: add <x09=%edi,<x13=%ebp
add %edi,%ebp

# qhasm: x13_stack = x13
# asm 1: movl <x13=int64#15d,>x13_stack=stack32#4
# asm 2: movl <x13=%ebp,>x13_stack=12(%rsp)
movl %ebp,12(%rsp)

# qhasm: (uint32) x17 += x0d
# asm 1: add <x0d=int64#7d,<x17=int64#4d
# asm 2: add <x0d=%eax,<x17=%ecx
add %eax,%ecx

# qhasm: x17_stack = x17
# asm 1: movl <x17=int64#4d,>x17_stack=stack32#10
# asm 2: movl <x17=%ecx,>x17_stack=36(%rsp)
movl %ecx,36(%rsp)

# qhasm: (uint32) x09 <<<= 11
# asm 1: rol  $11,<x09=int64#1d
# asm 2: rol  $11,<x09=%edi
rol  $11,%edi

# qhasm: (uint32) x0d <<<= 11
# asm 1: rol  $11,<x0d=int64#7d
# asm 2: rol  $11,<x0d=%eax
rol  $11,%eax

# qhasm: (uint32) x09 ^= x17
# asm 1: xor <x17=int64#4d,<x09=int64#1d
# asm 2: xor <x17=%ecx,<x09=%edi
xor %ecx,%edi

# qhasm:   x0b = x0b_stack
# asm 1: movl <x0b_stack=stack32#12,>x0b=int64#4d
# asm 2: movl <x0b_stack=44(%rsp),>x0b=%ecx
movl 44(%rsp),%ecx

# qhasm: (uint32) x0d ^= x13
# asm 1: xor <x13=int64#15d,<x0d=int64#7d
# asm 2: xor <x13=%ebp,<x0d=%eax
xor %ebp,%eax

# qhasm:   x11 = x11_stack
# asm 1: movl <x11_stack=stack32#2,>x11=int64#15d
# asm 2: movl <x11_stack=4(%rsp),>x11=%ebp
movl 4(%rsp),%ebp

# qhasm: x09_stack = x09
# asm 1: movl <x09=int64#1d,>x09_stack=stack32#2
# asm 2: movl <x09=%edi,>x09_stack=4(%rsp)
movl %edi,4(%rsp)

# qhasm:   x15 = x15_stack
# asm 1: movl <x15_stack=stack32#14,>x15=int64#1d
# asm 2: movl <x15_stack=52(%rsp),>x15=%edi
movl 52(%rsp),%edi

# qhasm:   (uint32) x11 += x0b
# asm 1: add <x0b=int64#4d,<x11=int64#15d
# asm 2: add <x0b=%ecx,<x11=%ebp
add %ecx,%ebp

# qhasm:   x11_stack = x11
# asm 1: movl <x11=int64#15d,>x11_stack=stack32#12
# asm 2: movl <x11=%ebp,>x11_stack=44(%rsp)
movl %ebp,44(%rsp)

# qhasm:   (uint32) x15 += x0f
# asm 1: add <x0f=int64#9d,<x15=int64#1d
# asm 2: add <x0f=%r11d,<x15=%edi
add %r11d,%edi

# qhasm:   x15_stack = x15
# asm 1: movl <x15=int64#1d,>x15_stack=stack32#14
# asm 2: movl <x15=%edi,>x15_stack=52(%rsp)
movl %edi,52(%rsp)

# qhasm:   (uint32) x0b <<<= 11
# asm 1: rol  $11,<x0b=int64#4d
# asm 2: rol  $11,<x0b=%ecx
rol  $11,%ecx

# qhasm:   (uint32) x0f <<<= 11
# asm 1: rol  $11,<x0f=int64#9d
# asm 2: rol  $11,<x0f=%r11d
rol  $11,%r11d

# qhasm:   (uint32) x0b ^= x15
# asm 1: xor <x15=int64#1d,<x0b=int64#4d
# asm 2: xor <x15=%edi,<x0b=%ecx
xor %edi,%ecx

# qhasm:   (uint32) x0f ^= x11
# asm 1: xor <x11=int64#15d,<x0f=int64#9d
# asm 2: xor <x11=%ebp,<x0f=%r11d
xor %ebp,%r11d

# qhasm: x19 = x19_stack
# asm 1: movl <x19_stack=stack32#6,>x19=int64#1d
# asm 2: movl <x19_stack=20(%rsp),>x19=%edi
movl 20(%rsp),%edi

# qhasm: x1d = x1d_stack
# asm 1: movl <x1d_stack=stack32#18,>x1d=int64#15d
# asm 2: movl <x1d_stack=68(%rsp),>x1d=%ebp
movl 68(%rsp),%ebp

# qhasm:   x0b_stack = x0b
# asm 1: movl <x0b=int64#4d,>x0b_stack=stack32#6
# asm 2: movl <x0b=%ecx,>x0b_stack=20(%rsp)
movl %ecx,20(%rsp)

# qhasm: (uint32) x19 += x03
# asm 1: add <x03=int64#11d,<x19=int64#1d
# asm 2: add <x03=%r13d,<x19=%edi
add %r13d,%edi

# qhasm: x19_stack = x19
# asm 1: movl <x19=int64#1d,>x19_stack=stack32#18
# asm 2: movl <x19=%edi,>x19_stack=68(%rsp)
movl %edi,68(%rsp)

# qhasm: (uint32) x1d += x07
# asm 1: add <x07=int64#2d,<x1d=int64#15d
# asm 2: add <x07=%esi,<x1d=%ebp
add %esi,%ebp

# qhasm: x1d_stack = x1d
# asm 1: movl <x1d=int64#15d,>x1d_stack=stack32#20
# asm 2: movl <x1d=%ebp,>x1d_stack=76(%rsp)
movl %ebp,76(%rsp)

# qhasm: (uint32) x03 <<<= 11
# asm 1: rol  $11,<x03=int64#11d
# asm 2: rol  $11,<x03=%r13d
rol  $11,%r13d

# qhasm: (uint32) x07 <<<= 11
# asm 1: rol  $11,<x07=int64#2d
# asm 2: rol  $11,<x07=%esi
rol  $11,%esi

# qhasm: (uint32) x03 ^= x1d
# asm 1: xor <x1d=int64#15d,<x03=int64#11d
# asm 2: xor <x1d=%ebp,<x03=%r13d
xor %ebp,%r13d

# qhasm: (uint32) x07 ^= x19
# asm 1: xor <x19=int64#1d,<x07=int64#2d
# asm 2: xor <x19=%edi,<x07=%esi
xor %edi,%esi

# qhasm:   x1b = x1b_stack
# asm 1: movl <x1b_stack=stack32#8,>x1b=int64#1d
# asm 2: movl <x1b_stack=28(%rsp),>x1b=%edi
movl 28(%rsp),%edi

# qhasm:   x1f = x1f_stack
# asm 1: movl <x1f_stack=stack32#16,>x1f=int64#4d
# asm 2: movl <x1f_stack=60(%rsp),>x1f=%ecx
movl 60(%rsp),%ecx

# qhasm:   (uint32) x1b += x01
# asm 1: add <x01=int64#5d,<x1b=int64#1d
# asm 2: add <x01=%r8d,<x1b=%edi
add %r8d,%edi

# qhasm:   x1b_stack = x1b
# asm 1: movl <x1b=int64#1d,>x1b_stack=stack32#8
# asm 2: movl <x1b=%edi,>x1b_stack=28(%rsp)
movl %edi,28(%rsp)

# qhasm:   (uint32) x1f += x05
# asm 1: add <x05=int64#13d,<x1f=int64#4d
# asm 2: add <x05=%r15d,<x1f=%ecx
add %r15d,%ecx

# qhasm:   x1f_stack = x1f
# asm 1: movl <x1f=int64#4d,>x1f_stack=stack32#16
# asm 2: movl <x1f=%ecx,>x1f_stack=60(%rsp)
movl %ecx,60(%rsp)

# qhasm:   (uint32) x01 <<<= 11
# asm 1: rol  $11,<x01=int64#5d
# asm 2: rol  $11,<x01=%r8d
rol  $11,%r8d

# qhasm:   (uint32) x05 <<<= 11
# asm 1: rol  $11,<x05=int64#13d
# asm 2: rol  $11,<x05=%r15d
rol  $11,%r15d

# qhasm:   (uint32) x01 ^= x1f
# asm 1: xor <x1f=int64#4d,<x01=int64#5d
# asm 2: xor <x1f=%ecx,<x01=%r8d
xor %ecx,%r8d

# qhasm:   (uint32) x05 ^= x1b
# asm 1: xor <x1b=int64#1d,<x05=int64#13d
# asm 2: xor <x1b=%edi,<x05=%r15d
xor %edi,%r15d

# qhasm: x0a = x0a_stack
# asm 1: movl <x0a_stack=stack32#11,>x0a=int64#1d
# asm 2: movl <x0a_stack=40(%rsp),>x0a=%edi
movl 40(%rsp),%edi

# qhasm: x10 = x10_stack
# asm 1: movl <x10_stack=stack32#1,>x10=int64#4d
# asm 2: movl <x10_stack=0(%rsp),>x10=%ecx
movl 0(%rsp),%ecx

# qhasm: x14 = x14_stack
# asm 1: movl <x14_stack=stack32#13,>x14=int64#15d
# asm 2: movl <x14_stack=48(%rsp),>x14=%ebp
movl 48(%rsp),%ebp

# qhasm: (uint32) x10 += x0a
# asm 1: add <x0a=int64#1d,<x10=int64#4d
# asm 2: add <x0a=%edi,<x10=%ecx
add %edi,%ecx

# qhasm: x10_stack = x10
# asm 1: movl <x10=int64#4d,>x10_stack=stack32#1
# asm 2: movl <x10=%ecx,>x10_stack=0(%rsp)
movl %ecx,0(%rsp)

# qhasm: (uint32) x14 += x0e
# asm 1: add <x0e=int64#8d,<x14=int64#15d
# asm 2: add <x0e=%r10d,<x14=%ebp
add %r10d,%ebp

# qhasm: x14_stack = x14
# asm 1: movl <x14=int64#15d,>x14_stack=stack32#11
# asm 2: movl <x14=%ebp,>x14_stack=40(%rsp)
movl %ebp,40(%rsp)

# qhasm: (uint32) x0a <<<= 11
# asm 1: rol  $11,<x0a=int64#1d
# asm 2: rol  $11,<x0a=%edi
rol  $11,%edi

# qhasm: (uint32) x0e <<<= 11
# asm 1: rol  $11,<x0e=int64#8d
# asm 2: rol  $11,<x0e=%r10d
rol  $11,%r10d

# qhasm: (uint32) x0a ^= x14
# asm 1: xor <x14=int64#15d,<x0a=int64#1d
# asm 2: xor <x14=%ebp,<x0a=%edi
xor %ebp,%edi

# qhasm: x0a_stack = x0a
# asm 1: movl <x0a=int64#1d,>x0a_stack=stack32#13
# asm 2: movl <x0a=%edi,>x0a_stack=48(%rsp)
movl %edi,48(%rsp)

# qhasm: (uint32) x0e ^= x10
# asm 1: xor <x10=int64#4d,<x0e=int64#8d
# asm 2: xor <x10=%ecx,<x0e=%r10d
xor %ecx,%r10d

# qhasm:   x18 = x18_stack
# asm 1: movl <x18_stack=stack32#5,>x18=int64#1d
# asm 2: movl <x18_stack=16(%rsp),>x18=%edi
movl 16(%rsp),%edi

# qhasm:   x1c = x1c_stack
# asm 1: movl <x1c_stack=stack32#17,>x1c=int64#4d
# asm 2: movl <x1c_stack=64(%rsp),>x1c=%ecx
movl 64(%rsp),%ecx

# qhasm:   (uint32) x18 += x02
# asm 1: add <x02=int64#10d,<x18=int64#1d
# asm 2: add <x02=%r12d,<x18=%edi
add %r12d,%edi

# qhasm:   x18_stack = x18
# asm 1: movl <x18=int64#1d,>x18_stack=stack32#5
# asm 2: movl <x18=%edi,>x18_stack=16(%rsp)
movl %edi,16(%rsp)

# qhasm:   (uint32) x1c += x06
# asm 1: add <x06=int64#14d,<x1c=int64#4d
# asm 2: add <x06=%ebx,<x1c=%ecx
add %ebx,%ecx

# qhasm:   x1c_stack = x1c
# asm 1: movl <x1c=int64#4d,>x1c_stack=stack32#17
# asm 2: movl <x1c=%ecx,>x1c_stack=64(%rsp)
movl %ecx,64(%rsp)

# qhasm:   (uint32) x02 <<<= 11
# asm 1: rol  $11,<x02=int64#10d
# asm 2: rol  $11,<x02=%r12d
rol  $11,%r12d

# qhasm:   (uint32) x06 <<<= 11
# asm 1: rol  $11,<x06=int64#14d
# asm 2: rol  $11,<x06=%ebx
rol  $11,%ebx

# qhasm:   (uint32) x02 ^= x1c
# asm 1: xor <x1c=int64#4d,<x02=int64#10d
# asm 2: xor <x1c=%ecx,<x02=%r12d
xor %ecx,%r12d

# qhasm:   (uint32) x06 ^= x18
# asm 1: xor <x18=int64#1d,<x06=int64#14d
# asm 2: xor <x18=%edi,<x06=%ebx
xor %edi,%ebx

# qhasm: x1a = x1a_stack
# asm 1: movl <x1a_stack=stack32#7,>x1a=int64#1d
# asm 2: movl <x1a_stack=24(%rsp),>x1a=%edi
movl 24(%rsp),%edi

# qhasm: x1e = x1e_stack
# asm 1: movl <x1e_stack=stack32#19,>x1e=int64#4d
# asm 2: movl <x1e_stack=72(%rsp),>x1e=%ecx
movl 72(%rsp),%ecx

# qhasm: (uint32) x1a += x00
# asm 1: add <x00=int64#3d,<x1a=int64#1d
# asm 2: add <x00=%edx,<x1a=%edi
add %edx,%edi

# qhasm: x1a_stack = x1a
# asm 1: movl <x1a=int64#1d,>x1a_stack=stack32#7
# asm 2: movl <x1a=%edi,>x1a_stack=24(%rsp)
movl %edi,24(%rsp)

# qhasm: (uint32) x1e += x04
# asm 1: add <x04=int64#12d,<x1e=int64#4d
# asm 2: add <x04=%r14d,<x1e=%ecx
add %r14d,%ecx

# qhasm: x1e_stack = x1e
# asm 1: movl <x1e=int64#4d,>x1e_stack=stack32#19
# asm 2: movl <x1e=%ecx,>x1e_stack=72(%rsp)
movl %ecx,72(%rsp)

# qhasm: (uint32) x00 <<<= 11
# asm 1: rol  $11,<x00=int64#3d
# asm 2: rol  $11,<x00=%edx
rol  $11,%edx

# qhasm: (uint32) x04 <<<= 11
# asm 1: rol  $11,<x04=int64#12d
# asm 2: rol  $11,<x04=%r14d
rol  $11,%r14d

# qhasm: (uint32) x00 ^= x1e
# asm 1: xor <x1e=int64#4d,<x00=int64#3d
# asm 2: xor <x1e=%ecx,<x00=%edx
xor %ecx,%edx

# qhasm: (uint32) x04 ^= x1a
# asm 1: xor <x1a=int64#1d,<x04=int64#12d
# asm 2: xor <x1a=%edi,<x04=%r14d
xor %edi,%r14d

# qhasm:   x08 = x08_stack
# asm 1: movl <x08_stack=stack32#9,>x08=int64#1d
# asm 2: movl <x08_stack=32(%rsp),>x08=%edi
movl 32(%rsp),%edi

# qhasm:   x12 = x12_stack
# asm 1: movl <x12_stack=stack32#3,>x12=int64#4d
# asm 2: movl <x12_stack=8(%rsp),>x12=%ecx
movl 8(%rsp),%ecx

# qhasm:   x16 = x16_stack
# asm 1: movl <x16_stack=stack32#15,>x16=int64#15d
# asm 2: movl <x16_stack=56(%rsp),>x16=%ebp
movl 56(%rsp),%ebp

# qhasm:   (uint32) x12 += x08
# asm 1: add <x08=int64#1d,<x12=int64#4d
# asm 2: add <x08=%edi,<x12=%ecx
add %edi,%ecx

# qhasm:   x12_stack = x12
# asm 1: movl <x12=int64#4d,>x12_stack=stack32#3
# asm 2: movl <x12=%ecx,>x12_stack=8(%rsp)
movl %ecx,8(%rsp)

# qhasm:   (uint32) x16 += x0c
# asm 1: add <x0c=int64#6d,<x16=int64#15d
# asm 2: add <x0c=%r9d,<x16=%ebp
add %r9d,%ebp

# qhasm:   x16_stack = x16
# asm 1: movl <x16=int64#15d,>x16_stack=stack32#9
# asm 2: movl <x16=%ebp,>x16_stack=32(%rsp)
movl %ebp,32(%rsp)

# qhasm:   (uint32) x08 <<<= 11
# asm 1: rol  $11,<x08=int64#1d
# asm 2: rol  $11,<x08=%edi
rol  $11,%edi

# qhasm:   (uint32) x0c <<<= 11
# asm 1: rol  $11,<x0c=int64#6d
# asm 2: rol  $11,<x0c=%r9d
rol  $11,%r9d

# qhasm:   (uint32) x08 ^= x16
# asm 1: xor <x16=int64#15d,<x08=int64#1d
# asm 2: xor <x16=%ebp,<x08=%edi
xor %ebp,%edi

# qhasm:   (uint32) x0c ^= x12
# asm 1: xor <x12=int64#4d,<x0c=int64#6d
# asm 2: xor <x12=%ecx,<x0c=%r9d
xor %ecx,%r9d

# qhasm: x1f = x1f_stack
# asm 1: movl <x1f_stack=stack32#16,>x1f=int64#4d
# asm 2: movl <x1f_stack=60(%rsp),>x1f=%ecx
movl 60(%rsp),%ecx

# qhasm: x17 = x17_stack
# asm 1: movl <x17_stack=stack32#10,>x17=int64#15d
# asm 2: movl <x17_stack=36(%rsp),>x17=%ebp
movl 36(%rsp),%ebp

# qhasm: (uint32) x1f += x00
# asm 1: add <x00=int64#3d,<x1f=int64#4d
# asm 2: add <x00=%edx,<x1f=%ecx
add %edx,%ecx

# qhasm: x1f_stack = x1f
# asm 1: movl <x1f=int64#4d,>x1f_stack=stack32#10
# asm 2: movl <x1f=%ecx,>x1f_stack=36(%rsp)
movl %ecx,36(%rsp)

# qhasm: (uint32) x17 += x08
# asm 1: add <x08=int64#1d,<x17=int64#15d
# asm 2: add <x08=%edi,<x17=%ebp
add %edi,%ebp

# qhasm: x17_stack = x17
# asm 1: movl <x17=int64#15d,>x17_stack=stack32#16
# asm 2: movl <x17=%ebp,>x17_stack=60(%rsp)
movl %ebp,60(%rsp)

# qhasm: (uint32) x00 <<<= 7
# asm 1: rol  $7,<x00=int64#3d
# asm 2: rol  $7,<x00=%edx
rol  $7,%edx

# qhasm: (uint32) x08 <<<= 7
# asm 1: rol  $7,<x08=int64#1d
# asm 2: rol  $7,<x08=%edi
rol  $7,%edi

# qhasm: (uint32) x00 ^= x17
# asm 1: xor <x17=int64#15d,<x00=int64#3d
# asm 2: xor <x17=%ebp,<x00=%edx
xor %ebp,%edx

# qhasm: (uint32) x08 ^= x1f
# asm 1: xor <x1f=int64#4d,<x08=int64#1d
# asm 2: xor <x1f=%ecx,<x08=%edi
xor %ecx,%edi

# qhasm: x08_stack = x08
# asm 1: movl <x08=int64#1d,>x08_stack=stack32#24
# asm 2: movl <x08=%edi,>x08_stack=92(%rsp)
movl %edi,92(%rsp)

# qhasm:   x1b = x1b_stack
# asm 1: movl <x1b_stack=stack32#8,>x1b=int64#1d
# asm 2: movl <x1b_stack=28(%rsp),>x1b=%edi
movl 28(%rsp),%edi

# qhasm:   x13 = x13_stack
# asm 1: movl <x13_stack=stack32#4,>x13=int64#4d
# asm 2: movl <x13_stack=12(%rsp),>x13=%ecx
movl 12(%rsp),%ecx

# qhasm:   (uint32) x1b += x04
# asm 1: add <x04=int64#12d,<x1b=int64#1d
# asm 2: add <x04=%r14d,<x1b=%edi
add %r14d,%edi

# qhasm:   x1b_stack = x1b
# asm 1: movl <x1b=int64#1d,>x1b_stack=stack32#25
# asm 2: movl <x1b=%edi,>x1b_stack=96(%rsp)
movl %edi,96(%rsp)

# qhasm:   (uint32) x13 += x0c
# asm 1: add <x0c=int64#6d,<x13=int64#4d
# asm 2: add <x0c=%r9d,<x13=%ecx
add %r9d,%ecx

# qhasm:   x13_stack = x13
# asm 1: movl <x13=int64#4d,>x13_stack=stack32#8
# asm 2: movl <x13=%ecx,>x13_stack=28(%rsp)
movl %ecx,28(%rsp)

# qhasm:   (uint32) x04 <<<= 7
# asm 1: rol  $7,<x04=int64#12d
# asm 2: rol  $7,<x04=%r14d
rol  $7,%r14d

# qhasm:   (uint32) x0c <<<= 7
# asm 1: rol  $7,<x0c=int64#6d
# asm 2: rol  $7,<x0c=%r9d
rol  $7,%r9d

# qhasm:   (uint32) x04 ^= x13
# asm 1: xor <x13=int64#4d,<x04=int64#12d
# asm 2: xor <x13=%ecx,<x04=%r14d
xor %ecx,%r14d

# qhasm:   (uint32) x0c ^= x1b
# asm 1: xor <x1b=int64#1d,<x0c=int64#6d
# asm 2: xor <x1b=%edi,<x0c=%r9d
xor %edi,%r9d

# qhasm: x1d = x1d_stack
# asm 1: movl <x1d_stack=stack32#20,>x1d=int64#1d
# asm 2: movl <x1d_stack=76(%rsp),>x1d=%edi
movl 76(%rsp),%edi

# qhasm: x0a = x0a_stack
# asm 1: movl <x0a_stack=stack32#13,>x0a=int64#4d
# asm 2: movl <x0a_stack=48(%rsp),>x0a=%ecx
movl 48(%rsp),%ecx

# qhasm: x15 = x15_stack
# asm 1: movl <x15_stack=stack32#14,>x15=int64#15d
# asm 2: movl <x15_stack=52(%rsp),>x15=%ebp
movl 52(%rsp),%ebp

# qhasm: (uint32) x1d += x02
# asm 1: add <x02=int64#10d,<x1d=int64#1d
# asm 2: add <x02=%r12d,<x1d=%edi
add %r12d,%edi

# qhasm: x1d_stack = x1d
# asm 1: movl <x1d=int64#1d,>x1d_stack=stack32#14
# asm 2: movl <x1d=%edi,>x1d_stack=52(%rsp)
movl %edi,52(%rsp)

# qhasm: (uint32) x15 += x0a
# asm 1: add <x0a=int64#4d,<x15=int64#15d
# asm 2: add <x0a=%ecx,<x15=%ebp
add %ecx,%ebp

# qhasm: x15_stack = x15
# asm 1: movl <x15=int64#15d,>x15_stack=stack32#26
# asm 2: movl <x15=%ebp,>x15_stack=100(%rsp)
movl %ebp,100(%rsp)

# qhasm: (uint32) x02 <<<= 7
# asm 1: rol  $7,<x02=int64#10d
# asm 2: rol  $7,<x02=%r12d
rol  $7,%r12d

# qhasm: (uint32) x0a <<<= 7
# asm 1: rol  $7,<x0a=int64#4d
# asm 2: rol  $7,<x0a=%ecx
rol  $7,%ecx

# qhasm: (uint32) x02 ^= x15
# asm 1: xor <x15=int64#15d,<x02=int64#10d
# asm 2: xor <x15=%ebp,<x02=%r12d
xor %ebp,%r12d

# qhasm: (uint32) x0a ^= x1d
# asm 1: xor <x1d=int64#1d,<x0a=int64#4d
# asm 2: xor <x1d=%edi,<x0a=%ecx
xor %edi,%ecx

# qhasm: x0a_stack = x0a
# asm 1: movl <x0a=int64#4d,>x0a_stack=stack32#20
# asm 2: movl <x0a=%ecx,>x0a_stack=76(%rsp)
movl %ecx,76(%rsp)

# qhasm:   x19 = x19_stack
# asm 1: movl <x19_stack=stack32#18,>x19=int64#1d
# asm 2: movl <x19_stack=68(%rsp),>x19=%edi
movl 68(%rsp),%edi

# qhasm:   x11 = x11_stack
# asm 1: movl <x11_stack=stack32#12,>x11=int64#4d
# asm 2: movl <x11_stack=44(%rsp),>x11=%ecx
movl 44(%rsp),%ecx

# qhasm:   (uint32) x19 += x06
# asm 1: add <x06=int64#14d,<x19=int64#1d
# asm 2: add <x06=%ebx,<x19=%edi
add %ebx,%edi

# qhasm:   x19_stack = x19
# asm 1: movl <x19=int64#1d,>x19_stack=stack32#18
# asm 2: movl <x19=%edi,>x19_stack=68(%rsp)
movl %edi,68(%rsp)

# qhasm:   (uint32) x11 += x0e
# asm 1: add <x0e=int64#8d,<x11=int64#4d
# asm 2: add <x0e=%r10d,<x11=%ecx
add %r10d,%ecx

# qhasm:   x11_stack = x11
# asm 1: movl <x11=int64#4d,>x11_stack=stack32#27
# asm 2: movl <x11=%ecx,>x11_stack=104(%rsp)
movl %ecx,104(%rsp)

# qhasm:   (uint32) x06 <<<= 7
# asm 1: rol  $7,<x06=int64#14d
# asm 2: rol  $7,<x06=%ebx
rol  $7,%ebx

# qhasm:   (uint32) x0e <<<= 7
# asm 1: rol  $7,<x0e=int64#8d
# asm 2: rol  $7,<x0e=%r10d
rol  $7,%r10d

# qhasm:   (uint32) x06 ^= x11
# asm 1: xor <x11=int64#4d,<x06=int64#14d
# asm 2: xor <x11=%ecx,<x06=%ebx
xor %ecx,%ebx

# qhasm:   (uint32) x0e ^= x19
# asm 1: xor <x19=int64#1d,<x0e=int64#8d
# asm 2: xor <x19=%edi,<x0e=%r10d
xor %edi,%r10d

# qhasm: x1e = x1e_stack
# asm 1: movl <x1e_stack=stack32#19,>x1e=int64#1d
# asm 2: movl <x1e_stack=72(%rsp),>x1e=%edi
movl 72(%rsp),%edi

# qhasm: x09 = x09_stack
# asm 1: movl <x09_stack=stack32#2,>x09=int64#4d
# asm 2: movl <x09_stack=4(%rsp),>x09=%ecx
movl 4(%rsp),%ecx

# qhasm: x16 = x16_stack
# asm 1: movl <x16_stack=stack32#9,>x16=int64#15d
# asm 2: movl <x16_stack=32(%rsp),>x16=%ebp
movl 32(%rsp),%ebp

# qhasm: (uint32) x1e += x01
# asm 1: add <x01=int64#5d,<x1e=int64#1d
# asm 2: add <x01=%r8d,<x1e=%edi
add %r8d,%edi

# qhasm: x1e_stack = x1e
# asm 1: movl <x1e=int64#1d,>x1e_stack=stack32#2
# asm 2: movl <x1e=%edi,>x1e_stack=4(%rsp)
movl %edi,4(%rsp)

# qhasm: (uint32) x16 += x09
# asm 1: add <x09=int64#4d,<x16=int64#15d
# asm 2: add <x09=%ecx,<x16=%ebp
add %ecx,%ebp

# qhasm: x16_stack = x16
# asm 1: movl <x16=int64#15d,>x16_stack=stack32#9
# asm 2: movl <x16=%ebp,>x16_stack=32(%rsp)
movl %ebp,32(%rsp)

# qhasm: (uint32) x01 <<<= 7
# asm 1: rol  $7,<x01=int64#5d
# asm 2: rol  $7,<x01=%r8d
rol  $7,%r8d

# qhasm: (uint32) x09 <<<= 7
# asm 1: rol  $7,<x09=int64#4d
# asm 2: rol  $7,<x09=%ecx
rol  $7,%ecx

# qhasm: (uint32) x01 ^= x16
# asm 1: xor <x16=int64#15d,<x01=int64#5d
# asm 2: xor <x16=%ebp,<x01=%r8d
xor %ebp,%r8d

# qhasm: (uint32) x09 ^= x1e
# asm 1: xor <x1e=int64#1d,<x09=int64#4d
# asm 2: xor <x1e=%edi,<x09=%ecx
xor %edi,%ecx

# qhasm: x09_stack = x09
# asm 1: movl <x09=int64#4d,>x09_stack=stack32#12
# asm 2: movl <x09=%ecx,>x09_stack=44(%rsp)
movl %ecx,44(%rsp)

# qhasm:   x1a = x1a_stack
# asm 1: movl <x1a_stack=stack32#7,>x1a=int64#1d
# asm 2: movl <x1a_stack=24(%rsp),>x1a=%edi
movl 24(%rsp),%edi

# qhasm:   x12 = x12_stack
# asm 1: movl <x12_stack=stack32#3,>x12=int64#4d
# asm 2: movl <x12_stack=8(%rsp),>x12=%ecx
movl 8(%rsp),%ecx

# qhasm:   (uint32) x1a += x05
# asm 1: add <x05=int64#13d,<x1a=int64#1d
# asm 2: add <x05=%r15d,<x1a=%edi
add %r15d,%edi

# qhasm:   x1a_stack = x1a
# asm 1: movl <x1a=int64#1d,>x1a_stack=stack32#3
# asm 2: movl <x1a=%edi,>x1a_stack=8(%rsp)
movl %edi,8(%rsp)

# qhasm:   (uint32) x12 += x0d
# asm 1: add <x0d=int64#7d,<x12=int64#4d
# asm 2: add <x0d=%eax,<x12=%ecx
add %eax,%ecx

# qhasm:   x12_stack = x12
# asm 1: movl <x12=int64#4d,>x12_stack=stack32#7
# asm 2: movl <x12=%ecx,>x12_stack=24(%rsp)
movl %ecx,24(%rsp)

# qhasm:   (uint32) x05 <<<= 7
# asm 1: rol  $7,<x05=int64#13d
# asm 2: rol  $7,<x05=%r15d
rol  $7,%r15d

# qhasm:   (uint32) x0d <<<= 7
# asm 1: rol  $7,<x0d=int64#7d
# asm 2: rol  $7,<x0d=%eax
rol  $7,%eax

# qhasm:   (uint32) x05 ^= x12
# asm 1: xor <x12=int64#4d,<x05=int64#13d
# asm 2: xor <x12=%ecx,<x05=%r15d
xor %ecx,%r15d

# qhasm:   (uint32) x0d ^= x1a
# asm 1: xor <x1a=int64#1d,<x0d=int64#7d
# asm 2: xor <x1a=%edi,<x0d=%eax
xor %edi,%eax

# qhasm: x18 = x18_stack
# asm 1: movl <x18_stack=stack32#5,>x18=int64#1d
# asm 2: movl <x18_stack=16(%rsp),>x18=%edi
movl 16(%rsp),%edi

# qhasm: x10 = x10_stack
# asm 1: movl <x10_stack=stack32#1,>x10=int64#4d
# asm 2: movl <x10_stack=0(%rsp),>x10=%ecx
movl 0(%rsp),%ecx

# qhasm: (uint32) x18 += x07
# asm 1: add <x07=int64#2d,<x18=int64#1d
# asm 2: add <x07=%esi,<x18=%edi
add %esi,%edi

# qhasm: x18_stack = x18
# asm 1: movl <x18=int64#1d,>x18_stack=stack32#1
# asm 2: movl <x18=%edi,>x18_stack=0(%rsp)
movl %edi,0(%rsp)

# qhasm: (uint32) x10 += x0f
# asm 1: add <x0f=int64#9d,<x10=int64#4d
# asm 2: add <x0f=%r11d,<x10=%ecx
add %r11d,%ecx

# qhasm: x10_stack = x10
# asm 1: movl <x10=int64#4d,>x10_stack=stack32#5
# asm 2: movl <x10=%ecx,>x10_stack=16(%rsp)
movl %ecx,16(%rsp)

# qhasm: (uint32) x07 <<<= 7
# asm 1: rol  $7,<x07=int64#2d
# asm 2: rol  $7,<x07=%esi
rol  $7,%esi

# qhasm: (uint32) x0f <<<= 7
# asm 1: rol  $7,<x0f=int64#9d
# asm 2: rol  $7,<x0f=%r11d
rol  $7,%r11d

# qhasm: (uint32) x07 ^= x10
# asm 1: xor <x10=int64#4d,<x07=int64#2d
# asm 2: xor <x10=%ecx,<x07=%esi
xor %ecx,%esi

# qhasm: (uint32) x0f ^= x18
# asm 1: xor <x18=int64#1d,<x0f=int64#9d
# asm 2: xor <x18=%edi,<x0f=%r11d
xor %edi,%r11d

# qhasm:   x1c = x1c_stack
# asm 1: movl <x1c_stack=stack32#17,>x1c=int64#1d
# asm 2: movl <x1c_stack=64(%rsp),>x1c=%edi
movl 64(%rsp),%edi

# qhasm:   x0b = x0b_stack
# asm 1: movl <x0b_stack=stack32#6,>x0b=int64#4d
# asm 2: movl <x0b_stack=20(%rsp),>x0b=%ecx
movl 20(%rsp),%ecx

# qhasm:   x14 = x14_stack
# asm 1: movl <x14_stack=stack32#11,>x14=int64#15d
# asm 2: movl <x14_stack=40(%rsp),>x14=%ebp
movl 40(%rsp),%ebp

# qhasm:   (uint32) x1c += x03
# asm 1: add <x03=int64#11d,<x1c=int64#1d
# asm 2: add <x03=%r13d,<x1c=%edi
add %r13d,%edi

# qhasm:   x1c_stack = x1c
# asm 1: movl <x1c=int64#1d,>x1c_stack=stack32#6
# asm 2: movl <x1c=%edi,>x1c_stack=20(%rsp)
movl %edi,20(%rsp)

# qhasm:   (uint32) x14 += x0b
# asm 1: add <x0b=int64#4d,<x14=int64#15d
# asm 2: add <x0b=%ecx,<x14=%ebp
add %ecx,%ebp

# qhasm:   x14_stack = x14
# asm 1: movl <x14=int64#15d,>x14_stack=stack32#13
# asm 2: movl <x14=%ebp,>x14_stack=48(%rsp)
movl %ebp,48(%rsp)

# qhasm:   (uint32) x03 <<<= 7
# asm 1: rol  $7,<x03=int64#11d
# asm 2: rol  $7,<x03=%r13d
rol  $7,%r13d

# qhasm:   (uint32) x0b <<<= 7
# asm 1: rol  $7,<x0b=int64#4d
# asm 2: rol  $7,<x0b=%ecx
rol  $7,%ecx

# qhasm:   (uint32) x03 ^= x14
# asm 1: xor <x14=int64#15d,<x03=int64#11d
# asm 2: xor <x14=%ebp,<x03=%r13d
xor %ebp,%r13d

# qhasm:   (uint32) x0b ^= x1c
# asm 1: xor <x1c=int64#1d,<x0b=int64#4d
# asm 2: xor <x1c=%edi,<x0b=%ecx
xor %edi,%ecx

# qhasm: x1e = x1e_stack
# asm 1: movl <x1e_stack=stack32#2,>x1e=int64#1d
# asm 2: movl <x1e_stack=4(%rsp),>x1e=%edi
movl 4(%rsp),%edi

# qhasm: x1a = x1a_stack
# asm 1: movl <x1a_stack=stack32#3,>x1a=int64#15d
# asm 2: movl <x1a_stack=8(%rsp),>x1a=%ebp
movl 8(%rsp),%ebp

# qhasm: (uint32) x1e += x0b
# asm 1: add <x0b=int64#4d,<x1e=int64#1d
# asm 2: add <x0b=%ecx,<x1e=%edi
add %ecx,%edi

# qhasm: x1e_stack = x1e
# asm 1: movl <x1e=int64#1d,>x1e_stack=stack32#19
# asm 2: movl <x1e=%edi,>x1e_stack=72(%rsp)
movl %edi,72(%rsp)

# qhasm: (uint32) x1a += x0f
# asm 1: add <x0f=int64#9d,<x1a=int64#15d
# asm 2: add <x0f=%r11d,<x1a=%ebp
add %r11d,%ebp

# qhasm: x1a_stack = x1a
# asm 1: movl <x1a=int64#15d,>x1a_stack=stack32#15
# asm 2: movl <x1a=%ebp,>x1a_stack=56(%rsp)
movl %ebp,56(%rsp)

# qhasm: (uint32) x0b <<<= 11
# asm 1: rol  $11,<x0b=int64#4d
# asm 2: rol  $11,<x0b=%ecx
rol  $11,%ecx

# qhasm: (uint32) x0f <<<= 11
# asm 1: rol  $11,<x0f=int64#9d
# asm 2: rol  $11,<x0f=%r11d
rol  $11,%r11d

# qhasm: (uint32) x0b ^= x1a
# asm 1: xor <x1a=int64#15d,<x0b=int64#4d
# asm 2: xor <x1a=%ebp,<x0b=%ecx
xor %ebp,%ecx

# qhasm: x0b_stack = x0b
# asm 1: movl <x0b=int64#4d,>x0b_stack=stack32#4
# asm 2: movl <x0b=%ecx,>x0b_stack=12(%rsp)
movl %ecx,12(%rsp)

# qhasm: (uint32) x0f ^= x1e
# asm 1: xor <x1e=int64#1d,<x0f=int64#9d
# asm 2: xor <x1e=%edi,<x0f=%r11d
xor %edi,%r11d

# qhasm:   x16 = x16_stack
# asm 1: movl <x16_stack=stack32#9,>x16=int64#1d
# asm 2: movl <x16_stack=32(%rsp),>x16=%edi
movl 32(%rsp),%edi

# qhasm:   x12 = x12_stack
# asm 1: movl <x12_stack=stack32#7,>x12=int64#4d
# asm 2: movl <x12_stack=24(%rsp),>x12=%ecx
movl 24(%rsp),%ecx

# qhasm:   (uint32) x16 += x03
# asm 1: add <x03=int64#11d,<x16=int64#1d
# asm 2: add <x03=%r13d,<x16=%edi
add %r13d,%edi

# qhasm:   x16_stack = x16
# asm 1: movl <x16=int64#1d,>x16_stack=stack32#11
# asm 2: movl <x16=%edi,>x16_stack=40(%rsp)
movl %edi,40(%rsp)

# qhasm:   (uint32) x12 += x07
# asm 1: add <x07=int64#2d,<x12=int64#4d
# asm 2: add <x07=%esi,<x12=%ecx
add %esi,%ecx

# qhasm:   x12_stack = x12
# asm 1: movl <x12=int64#4d,>x12_stack=stack32#7
# asm 2: movl <x12=%ecx,>x12_stack=24(%rsp)
movl %ecx,24(%rsp)

# qhasm:   (uint32) x03 <<<= 11
# asm 1: rol  $11,<x03=int64#11d
# asm 2: rol  $11,<x03=%r13d
rol  $11,%r13d

# qhasm:   (uint32) x07 <<<= 11
# asm 1: rol  $11,<x07=int64#2d
# asm 2: rol  $11,<x07=%esi
rol  $11,%esi

# qhasm:   (uint32) x03 ^= x12
# asm 1: xor <x12=int64#4d,<x03=int64#11d
# asm 2: xor <x12=%ecx,<x03=%r13d
xor %ecx,%r13d

# qhasm:   (uint32) x07 ^= x16
# asm 1: xor <x16=int64#1d,<x07=int64#2d
# asm 2: xor <x16=%edi,<x07=%esi
xor %edi,%esi

# qhasm: x07_stack = x07
# asm 1: movl <x07=int64#2d,>x07_stack=stack32#21
# asm 2: movl <x07=%esi,>x07_stack=80(%rsp)
movl %esi,80(%rsp)

# qhasm: x14 = x14_stack
# asm 1: movl <x14_stack=stack32#13,>x14=int64#1d
# asm 2: movl <x14_stack=48(%rsp),>x14=%edi
movl 48(%rsp),%edi

# qhasm: x10 = x10_stack
# asm 1: movl <x10_stack=stack32#5,>x10=int64#2d
# asm 2: movl <x10_stack=16(%rsp),>x10=%esi
movl 16(%rsp),%esi

# qhasm: (uint32) x14 += x01
# asm 1: add <x01=int64#5d,<x14=int64#1d
# asm 2: add <x01=%r8d,<x14=%edi
add %r8d,%edi

# qhasm: x14_stack = x14
# asm 1: movl <x14=int64#1d,>x14_stack=stack32#9
# asm 2: movl <x14=%edi,>x14_stack=32(%rsp)
movl %edi,32(%rsp)

# qhasm: (uint32) x10 += x05
# asm 1: add <x05=int64#13d,<x10=int64#2d
# asm 2: add <x05=%r15d,<x10=%esi
add %r15d,%esi

# qhasm: x10_stack = x10
# asm 1: movl <x10=int64#2d,>x10_stack=stack32#5
# asm 2: movl <x10=%esi,>x10_stack=16(%rsp)
movl %esi,16(%rsp)

# qhasm: (uint32) x01 <<<= 11
# asm 1: rol  $11,<x01=int64#5d
# asm 2: rol  $11,<x01=%r8d
rol  $11,%r8d

# qhasm: (uint32) x05 <<<= 11
# asm 1: rol  $11,<x05=int64#13d
# asm 2: rol  $11,<x05=%r15d
rol  $11,%r15d

# qhasm: (uint32) x01 ^= x10
# asm 1: xor <x10=int64#2d,<x01=int64#5d
# asm 2: xor <x10=%esi,<x01=%r8d
xor %esi,%r8d

# qhasm: (uint32) x05 ^= x14
# asm 1: xor <x14=int64#1d,<x05=int64#13d
# asm 2: xor <x14=%edi,<x05=%r15d
xor %edi,%r15d

# qhasm:   x09 = x09_stack
# asm 1: movl <x09_stack=stack32#12,>x09=int64#1d
# asm 2: movl <x09_stack=44(%rsp),>x09=%edi
movl 44(%rsp),%edi

# qhasm:   x1c = x1c_stack
# asm 1: movl <x1c_stack=stack32#6,>x1c=int64#2d
# asm 2: movl <x1c_stack=20(%rsp),>x1c=%esi
movl 20(%rsp),%esi

# qhasm:   x18 = x18_stack
# asm 1: movl <x18_stack=stack32#1,>x18=int64#4d
# asm 2: movl <x18_stack=0(%rsp),>x18=%ecx
movl 0(%rsp),%ecx

# qhasm:   (uint32) x1c += x09
# asm 1: add <x09=int64#1d,<x1c=int64#2d
# asm 2: add <x09=%edi,<x1c=%esi
add %edi,%esi

# qhasm:   x1c_stack = x1c
# asm 1: movl <x1c=int64#2d,>x1c_stack=stack32#17
# asm 2: movl <x1c=%esi,>x1c_stack=64(%rsp)
movl %esi,64(%rsp)

# qhasm:   (uint32) x18 += x0d
# asm 1: add <x0d=int64#7d,<x18=int64#4d
# asm 2: add <x0d=%eax,<x18=%ecx
add %eax,%ecx

# qhasm:   x18_stack = x18
# asm 1: movl <x18=int64#4d,>x18_stack=stack32#13
# asm 2: movl <x18=%ecx,>x18_stack=48(%rsp)
movl %ecx,48(%rsp)

# qhasm:   (uint32) x09 <<<= 11
# asm 1: rol  $11,<x09=int64#1d
# asm 2: rol  $11,<x09=%edi
rol  $11,%edi

# qhasm:   (uint32) x0d <<<= 11
# asm 1: rol  $11,<x0d=int64#7d
# asm 2: rol  $11,<x0d=%eax
rol  $11,%eax

# qhasm:   (uint32) x09 ^= x18
# asm 1: xor <x18=int64#4d,<x09=int64#1d
# asm 2: xor <x18=%ecx,<x09=%edi
xor %ecx,%edi

# qhasm:   x09_stack = x09
# asm 1: movl <x09=int64#1d,>x09_stack=stack32#2
# asm 2: movl <x09=%edi,>x09_stack=4(%rsp)
movl %edi,4(%rsp)

# qhasm:   (uint32) x0d ^= x1c
# asm 1: xor <x1c=int64#2d,<x0d=int64#7d
# asm 2: xor <x1c=%esi,<x0d=%eax
xor %esi,%eax

# qhasm: x17 = x17_stack
# asm 1: movl <x17_stack=stack32#16,>x17=int64#1d
# asm 2: movl <x17_stack=60(%rsp),>x17=%edi
movl 60(%rsp),%edi

# qhasm: x13 = x13_stack
# asm 1: movl <x13_stack=stack32#8,>x13=int64#2d
# asm 2: movl <x13_stack=28(%rsp),>x13=%esi
movl 28(%rsp),%esi

# qhasm: (uint32) x17 += x02
# asm 1: add <x02=int64#10d,<x17=int64#1d
# asm 2: add <x02=%r12d,<x17=%edi
add %r12d,%edi

# qhasm: x17_stack = x17
# asm 1: movl <x17=int64#1d,>x17_stack=stack32#12
# asm 2: movl <x17=%edi,>x17_stack=44(%rsp)
movl %edi,44(%rsp)

# qhasm: (uint32) x13 += x06
# asm 1: add <x06=int64#14d,<x13=int64#2d
# asm 2: add <x06=%ebx,<x13=%esi
add %ebx,%esi

# qhasm: x13_stack = x13
# asm 1: movl <x13=int64#2d,>x13_stack=stack32#8
# asm 2: movl <x13=%esi,>x13_stack=28(%rsp)
movl %esi,28(%rsp)

# qhasm: (uint32) x02 <<<= 11
# asm 1: rol  $11,<x02=int64#10d
# asm 2: rol  $11,<x02=%r12d
rol  $11,%r12d

# qhasm: (uint32) x06 <<<= 11
# asm 1: rol  $11,<x06=int64#14d
# asm 2: rol  $11,<x06=%ebx
rol  $11,%ebx

# qhasm: (uint32) x02 ^= x13
# asm 1: xor <x13=int64#2d,<x02=int64#10d
# asm 2: xor <x13=%esi,<x02=%r12d
xor %esi,%r12d

# qhasm: (uint32) x06 ^= x17
# asm 1: xor <x17=int64#1d,<x06=int64#14d
# asm 2: xor <x17=%edi,<x06=%ebx
xor %edi,%ebx

# qhasm:   x0a = x0a_stack
# asm 1: movl <x0a_stack=stack32#20,>x0a=int64#1d
# asm 2: movl <x0a_stack=76(%rsp),>x0a=%edi
movl 76(%rsp),%edi

# qhasm:   x1f = x1f_stack
# asm 1: movl <x1f_stack=stack32#10,>x1f=int64#2d
# asm 2: movl <x1f_stack=36(%rsp),>x1f=%esi
movl 36(%rsp),%esi

# qhasm:   x1b = x1b_stack
# asm 1: movl <x1b_stack=stack32#25,>x1b=int64#4d
# asm 2: movl <x1b_stack=96(%rsp),>x1b=%ecx
movl 96(%rsp),%ecx

# qhasm:   (uint32) x1f += x0a
# asm 1: add <x0a=int64#1d,<x1f=int64#2d
# asm 2: add <x0a=%edi,<x1f=%esi
add %edi,%esi

# qhasm:   x1f_stack = x1f
# asm 1: movl <x1f=int64#2d,>x1f_stack=stack32#20
# asm 2: movl <x1f=%esi,>x1f_stack=76(%rsp)
movl %esi,76(%rsp)

# qhasm:   (uint32) x1b += x0e
# asm 1: add <x0e=int64#8d,<x1b=int64#4d
# asm 2: add <x0e=%r10d,<x1b=%ecx
add %r10d,%ecx

# qhasm:   x1b_stack = x1b
# asm 1: movl <x1b=int64#4d,>x1b_stack=stack32#16
# asm 2: movl <x1b=%ecx,>x1b_stack=60(%rsp)
movl %ecx,60(%rsp)

# qhasm:   (uint32) x0a <<<= 11
# asm 1: rol  $11,<x0a=int64#1d
# asm 2: rol  $11,<x0a=%edi
rol  $11,%edi

# qhasm:   (uint32) x0e <<<= 11
# asm 1: rol  $11,<x0e=int64#8d
# asm 2: rol  $11,<x0e=%r10d
rol  $11,%r10d

# qhasm:   (uint32) x0a ^= x1b
# asm 1: xor <x1b=int64#4d,<x0a=int64#1d
# asm 2: xor <x1b=%ecx,<x0a=%edi
xor %ecx,%edi

# qhasm:   x0a_stack = x0a
# asm 1: movl <x0a=int64#1d,>x0a_stack=stack32#3
# asm 2: movl <x0a=%edi,>x0a_stack=8(%rsp)
movl %edi,8(%rsp)

# qhasm:   (uint32) x0e ^= x1f
# asm 1: xor <x1f=int64#2d,<x0e=int64#8d
# asm 2: xor <x1f=%esi,<x0e=%r10d
xor %esi,%r10d

# qhasm: x15 = x15_stack
# asm 1: movl <x15_stack=stack32#26,>x15=int64#1d
# asm 2: movl <x15_stack=100(%rsp),>x15=%edi
movl 100(%rsp),%edi

# qhasm: x11 = x11_stack
# asm 1: movl <x11_stack=stack32#27,>x11=int64#2d
# asm 2: movl <x11_stack=104(%rsp),>x11=%esi
movl 104(%rsp),%esi

# qhasm: (uint32) x15 += x00
# asm 1: add <x00=int64#3d,<x15=int64#1d
# asm 2: add <x00=%edx,<x15=%edi
add %edx,%edi

# qhasm: x15_stack = x15
# asm 1: movl <x15=int64#1d,>x15_stack=stack32#10
# asm 2: movl <x15=%edi,>x15_stack=36(%rsp)
movl %edi,36(%rsp)

# qhasm: (uint32) x11 += x04
# asm 1: add <x04=int64#12d,<x11=int64#2d
# asm 2: add <x04=%r14d,<x11=%esi
add %r14d,%esi

# qhasm: x11_stack = x11
# asm 1: movl <x11=int64#2d,>x11_stack=stack32#6
# asm 2: movl <x11=%esi,>x11_stack=20(%rsp)
movl %esi,20(%rsp)

# qhasm: (uint32) x00 <<<= 11
# asm 1: rol  $11,<x00=int64#3d
# asm 2: rol  $11,<x00=%edx
rol  $11,%edx

# qhasm: (uint32) x04 <<<= 11
# asm 1: rol  $11,<x04=int64#12d
# asm 2: rol  $11,<x04=%r14d
rol  $11,%r14d

# qhasm: (uint32) x00 ^= x11
# asm 1: xor <x11=int64#2d,<x00=int64#3d
# asm 2: xor <x11=%esi,<x00=%edx
xor %esi,%edx

# qhasm: (uint32) x04 ^= x15
# asm 1: xor <x15=int64#1d,<x04=int64#12d
# asm 2: xor <x15=%edi,<x04=%r14d
xor %edi,%r14d

# qhasm:   x08 = x08_stack
# asm 1: movl <x08_stack=stack32#24,>x08=int64#1d
# asm 2: movl <x08_stack=92(%rsp),>x08=%edi
movl 92(%rsp),%edi

# qhasm:   x1d = x1d_stack
# asm 1: movl <x1d_stack=stack32#14,>x1d=int64#2d
# asm 2: movl <x1d_stack=52(%rsp),>x1d=%esi
movl 52(%rsp),%esi

# qhasm:   x19 = x19_stack
# asm 1: movl <x19_stack=stack32#18,>x19=int64#4d
# asm 2: movl <x19_stack=68(%rsp),>x19=%ecx
movl 68(%rsp),%ecx

# qhasm:                    r = r_stack
# asm 1: movl <r_stack=stack32#23,>r=int64#15d
# asm 2: movl <r_stack=88(%rsp),>r=%ebp
movl 88(%rsp),%ebp

# qhasm:   (uint32) x1d += x08
# asm 1: add <x08=int64#1d,<x1d=int64#2d
# asm 2: add <x08=%edi,<x1d=%esi
add %edi,%esi

# qhasm:   x1d_stack = x1d
# asm 1: movl <x1d=int64#2d,>x1d_stack=stack32#18
# asm 2: movl <x1d=%esi,>x1d_stack=68(%rsp)
movl %esi,68(%rsp)

# qhasm:   (uint32) x19 += x0c
# asm 1: add <x0c=int64#6d,<x19=int64#4d
# asm 2: add <x0c=%r9d,<x19=%ecx
add %r9d,%ecx

# qhasm:   x19_stack = x19
# asm 1: movl <x19=int64#4d,>x19_stack=stack32#14
# asm 2: movl <x19=%ecx,>x19_stack=52(%rsp)
movl %ecx,52(%rsp)

# qhasm:   (uint32) x08 <<<= 11
# asm 1: rol  $11,<x08=int64#1d
# asm 2: rol  $11,<x08=%edi
rol  $11,%edi

# qhasm:   (uint32) x0c <<<= 11
# asm 1: rol  $11,<x0c=int64#6d
# asm 2: rol  $11,<x0c=%r9d
rol  $11,%r9d

# qhasm:   (uint32) x08 ^= x19
# asm 1: xor <x19=int64#4d,<x08=int64#1d
# asm 2: xor <x19=%ecx,<x08=%edi
xor %ecx,%edi

# qhasm:   x08_stack = x08
# asm 1: movl <x08=int64#1d,>x08_stack=stack32#1
# asm 2: movl <x08=%edi,>x08_stack=0(%rsp)
movl %edi,0(%rsp)

# qhasm:   (uint32) x0c ^= x1d
# asm 1: xor <x1d=int64#2d,<x0c=int64#6d
# asm 2: xor <x1d=%esi,<x0c=%r9d
xor %esi,%r9d

# qhasm:                    unsigned>? r -= 2
# asm 1: sub  $2,<r=int64#15
# asm 2: sub  $2,<r=%rbp
sub  $2,%rbp
# comment:fp stack unchanged by jump

# qhasm: goto morerounds if unsigned>
ja ._morerounds

# qhasm:   finalization = finalization_stack
# asm 1: movl <finalization_stack=stack32#22,>finalization=int64#1d
# asm 2: movl <finalization_stack=84(%rsp),>finalization=%edi
movl 84(%rsp),%edi

# qhasm:   in = in_stack
# asm 1: movq <in_stack=stack64#10,>in=int64#2
# asm 2: movq <in_stack=232(%rsp),>in=%rsi
movq 232(%rsp),%rsi
# comment:fp stack unchanged by jump

# qhasm: goto checkinlen
jmp ._checkinlen

# qhasm: inlenbelow32:
._inlenbelow32:

# qhasm:   inlen += 32
# asm 1: add  $32,<inlen=int64#4
# asm 2: add  $32,<inlen=%rcx
add  $32,%rcx

# qhasm:                       =? finalization - 1
# asm 1: cmp  $1,<finalization=int64#1
# asm 2: cmp  $1,<finalization=%rdi
cmp  $1,%rdi
# comment:fp stack unchanged by jump

# qhasm: goto finalization1 if =
je ._finalization1

# qhasm:                       =? finalization - 2
# asm 1: cmp  $2,<finalization=int64#1
# asm 2: cmp  $2,<finalization=%rdi
cmp  $2,%rdi
# comment:fp stack unchanged by jump

# qhasm: goto finalization2 if =
je ._finalization2

# qhasm:   y00 = 0
# asm 1: mov  $0,>y00=int64#15
# asm 2: mov  $0,>y00=%rbp
mov  $0,%rbp

# qhasm:   z = &tmp
# asm 1: leaq <tmp=stack256#1,>z=int64#1
# asm 2: leaq <tmp=128(%rsp),>z=%rdi
leaq 128(%rsp),%rdi

# qhasm:   *(uint32 *) (z + 0) = y00
# asm 1: movl   <y00=int64#15d,0(<z=int64#1)
# asm 2: movl   <y00=%ebp,0(<z=%rdi)
movl   %ebp,0(%rdi)

# qhasm:   *(uint32 *) (z + 4) = y00
# asm 1: movl   <y00=int64#15d,4(<z=int64#1)
# asm 2: movl   <y00=%ebp,4(<z=%rdi)
movl   %ebp,4(%rdi)

# qhasm:   *(uint32 *) (z + 8) = y00
# asm 1: movl   <y00=int64#15d,8(<z=int64#1)
# asm 2: movl   <y00=%ebp,8(<z=%rdi)
movl   %ebp,8(%rdi)

# qhasm:   *(uint32 *) (z + 12) = y00
# asm 1: movl   <y00=int64#15d,12(<z=int64#1)
# asm 2: movl   <y00=%ebp,12(<z=%rdi)
movl   %ebp,12(%rdi)

# qhasm:   *(uint32 *) (z + 16) = y00
# asm 1: movl   <y00=int64#15d,16(<z=int64#1)
# asm 2: movl   <y00=%ebp,16(<z=%rdi)
movl   %ebp,16(%rdi)

# qhasm:   *(uint32 *) (z + 20) = y00
# asm 1: movl   <y00=int64#15d,20(<z=int64#1)
# asm 2: movl   <y00=%ebp,20(<z=%rdi)
movl   %ebp,20(%rdi)

# qhasm:   *(uint32 *) (z + 24) = y00
# asm 1: movl   <y00=int64#15d,24(<z=int64#1)
# asm 2: movl   <y00=%ebp,24(<z=%rdi)
movl   %ebp,24(%rdi)

# qhasm:   *(uint32 *) (z + 28) = y00
# asm 1: movl   <y00=int64#15d,28(<z=int64#1)
# asm 2: movl   <y00=%ebp,28(<z=%rdi)
movl   %ebp,28(%rdi)

# qhasm:   while (inlen) { *z++ = *in++; --inlen }
rep movsb

# qhasm:   y00 = 128
# asm 1: mov  $128,>y00=int64#2
# asm 2: mov  $128,>y00=%rsi
mov  $128,%rsi

# qhasm:   *(uint8 *) (z + 0) = y00
# asm 1: movb   <y00=int64#2b,0(<z=int64#1)
# asm 2: movb   <y00=%sil,0(<z=%rdi)
movb   %sil,0(%rdi)

# qhasm:   in = &tmp
# asm 1: leaq <tmp=stack256#1,>in=int64#2
# asm 2: leaq <tmp=128(%rsp),>in=%rsi
leaq 128(%rsp),%rsi

# qhasm:   finalization = 1
# asm 1: mov  $1,>finalization=int64#1
# asm 2: mov  $1,>finalization=%rdi
mov  $1,%rdi
# comment:fp stack unchanged by jump

# qhasm:   goto mainloop
jmp ._mainloop

# qhasm: finalization1:
._finalization1:

# qhasm:   x1f = x1f_stack
# asm 1: movl <x1f_stack=stack32#20,>x1f=int64#1d
# asm 2: movl <x1f_stack=76(%rsp),>x1f=%edi
movl 76(%rsp),%edi

# qhasm:   (uint32) x1f ^= 1
# asm 1: xor  $1,<x1f=int64#1d
# asm 2: xor  $1,<x1f=%edi
xor  $1,%edi

# qhasm:   x1f_stack = x1f
# asm 1: movl <x1f=int64#1d,>x1f_stack=stack32#20
# asm 2: movl <x1f=%edi,>x1f_stack=76(%rsp)
movl %edi,76(%rsp)

# qhasm:   r = 160
# asm 1: mov  $160,>r=int64#15
# asm 2: mov  $160,>r=%rbp
mov  $160,%rbp

# qhasm:   finalization = 2
# asm 1: mov  $2,>finalization=int64#1
# asm 2: mov  $2,>finalization=%rdi
mov  $2,%rdi

# qhasm:   finalization_stack = finalization
# asm 1: movl <finalization=int64#1d,>finalization_stack=stack32#22
# asm 2: movl <finalization=%edi,>finalization_stack=84(%rsp)
movl %edi,84(%rsp)

# qhasm:   in_stack = in
# asm 1: movq <in=int64#2,>in_stack=stack64#10
# asm 2: movq <in=%rsi,>in_stack=232(%rsp)
movq %rsi,232(%rsp)

# qhasm:   inlen_stack = inlen
# asm 1: movq <inlen=int64#4,>inlen_stack=stack64#2
# asm 2: movq <inlen=%rcx,>inlen_stack=168(%rsp)
movq %rcx,168(%rsp)
# comment:fp stack unchanged by jump

# qhasm: goto morerounds
jmp ._morerounds

# qhasm: finalization2:
._finalization2:

# qhasm:   out = out_stack
# asm 1: movq <out_stack=stack64#1,>out=int64#1
# asm 2: movq <out_stack=160(%rsp),>out=%rdi
movq 160(%rsp),%rdi

# qhasm:   x07 = x07_stack
# asm 1: movl <x07_stack=stack32#21,>x07=int64#2d
# asm 2: movl <x07_stack=80(%rsp),>x07=%esi
movl 80(%rsp),%esi

# qhasm:   *(uint32 *) (out + 0) = x00
# asm 1: movl   <x00=int64#3d,0(<out=int64#1)
# asm 2: movl   <x00=%edx,0(<out=%rdi)
movl   %edx,0(%rdi)

# qhasm:   *(uint32 *) (out + 4) = x01
# asm 1: movl   <x01=int64#5d,4(<out=int64#1)
# asm 2: movl   <x01=%r8d,4(<out=%rdi)
movl   %r8d,4(%rdi)

# qhasm:   *(uint32 *) (out + 8) = x02
# asm 1: movl   <x02=int64#10d,8(<out=int64#1)
# asm 2: movl   <x02=%r12d,8(<out=%rdi)
movl   %r12d,8(%rdi)

# qhasm:   *(uint32 *) (out + 12) = x03
# asm 1: movl   <x03=int64#11d,12(<out=int64#1)
# asm 2: movl   <x03=%r13d,12(<out=%rdi)
movl   %r13d,12(%rdi)

# qhasm:   *(uint32 *) (out + 16) = x04
# asm 1: movl   <x04=int64#12d,16(<out=int64#1)
# asm 2: movl   <x04=%r14d,16(<out=%rdi)
movl   %r14d,16(%rdi)

# qhasm:   *(uint32 *) (out + 20) = x05
# asm 1: movl   <x05=int64#13d,20(<out=int64#1)
# asm 2: movl   <x05=%r15d,20(<out=%rdi)
movl   %r15d,20(%rdi)

# qhasm:   *(uint32 *) (out + 24) = x06
# asm 1: movl   <x06=int64#14d,24(<out=int64#1)
# asm 2: movl   <x06=%ebx,24(<out=%rdi)
movl   %ebx,24(%rdi)

# qhasm:   *(uint32 *) (out + 28) = x07
# asm 1: movl   <x07=int64#2d,28(<out=int64#1)
# asm 2: movl   <x07=%esi,28(<out=%rdi)
movl   %esi,28(%rdi)

# qhasm:   x08 = x08_stack
# asm 1: movl <x08_stack=stack32#1,>x08=int64#2d
# asm 2: movl <x08_stack=0(%rsp),>x08=%esi
movl 0(%rsp),%esi

# qhasm:   x09 = x09_stack
# asm 1: movl <x09_stack=stack32#2,>x09=int64#3d
# asm 2: movl <x09_stack=4(%rsp),>x09=%edx
movl 4(%rsp),%edx

# qhasm:   x0a = x0a_stack
# asm 1: movl <x0a_stack=stack32#3,>x0a=int64#4d
# asm 2: movl <x0a_stack=8(%rsp),>x0a=%ecx
movl 8(%rsp),%ecx

# qhasm:   x0b = x0b_stack
# asm 1: movl <x0b_stack=stack32#4,>x0b=int64#5d
# asm 2: movl <x0b_stack=12(%rsp),>x0b=%r8d
movl 12(%rsp),%r8d

# qhasm:   *(uint32 *) (out + 32) = x08
# asm 1: movl   <x08=int64#2d,32(<out=int64#1)
# asm 2: movl   <x08=%esi,32(<out=%rdi)
movl   %esi,32(%rdi)

# qhasm:   *(uint32 *) (out + 36) = x09
# asm 1: movl   <x09=int64#3d,36(<out=int64#1)
# asm 2: movl   <x09=%edx,36(<out=%rdi)
movl   %edx,36(%rdi)

# qhasm:   *(uint32 *) (out + 40) = x0a
# asm 1: movl   <x0a=int64#4d,40(<out=int64#1)
# asm 2: movl   <x0a=%ecx,40(<out=%rdi)
movl   %ecx,40(%rdi)

# qhasm:   *(uint32 *) (out + 44) = x0b
# asm 1: movl   <x0b=int64#5d,44(<out=int64#1)
# asm 2: movl   <x0b=%r8d,44(<out=%rdi)
movl   %r8d,44(%rdi)

# qhasm:   *(uint32 *) (out + 48) = x0c
# asm 1: movl   <x0c=int64#6d,48(<out=int64#1)
# asm 2: movl   <x0c=%r9d,48(<out=%rdi)
movl   %r9d,48(%rdi)

# qhasm:   *(uint32 *) (out + 52) = x0d
# asm 1: movl   <x0d=int64#7d,52(<out=int64#1)
# asm 2: movl   <x0d=%eax,52(<out=%rdi)
movl   %eax,52(%rdi)

# qhasm:   *(uint32 *) (out + 56) = x0e
# asm 1: movl   <x0e=int64#8d,56(<out=int64#1)
# asm 2: movl   <x0e=%r10d,56(<out=%rdi)
movl   %r10d,56(%rdi)

# qhasm:   *(uint32 *) (out + 60) = x0f
# asm 1: movl   <x0f=int64#9d,60(<out=int64#1)
# asm 2: movl   <x0f=%r11d,60(<out=%rdi)
movl   %r11d,60(%rdi)

# qhasm:   r11 = r11_stack
# asm 1: movq <r11_stack=stack64#3,>r11=int64#9
# asm 2: movq <r11_stack=176(%rsp),>r11=%r11
movq 176(%rsp),%r11

# qhasm:   r12 = r12_stack
# asm 1: movq <r12_stack=stack64#4,>r12=int64#10
# asm 2: movq <r12_stack=184(%rsp),>r12=%r12
movq 184(%rsp),%r12

# qhasm:   r13 = r13_stack
# asm 1: movq <r13_stack=stack64#5,>r13=int64#11
# asm 2: movq <r13_stack=192(%rsp),>r13=%r13
movq 192(%rsp),%r13

# qhasm:   r14 = r14_stack
# asm 1: movq <r14_stack=stack64#6,>r14=int64#12
# asm 2: movq <r14_stack=200(%rsp),>r14=%r14
movq 200(%rsp),%r14

# qhasm:   r15 = r15_stack
# asm 1: movq <r15_stack=stack64#7,>r15=int64#13
# asm 2: movq <r15_stack=208(%rsp),>r15=%r15
movq 208(%rsp),%r15

# qhasm:   rbx = rbx_stack
# asm 1: movq <rbx_stack=stack64#8,>rbx=int64#14
# asm 2: movq <rbx_stack=216(%rsp),>rbx=%rbx
movq 216(%rsp),%rbx

# qhasm:   rbp = rbp_stack
# asm 1: movq <rbp_stack=stack64#9,>rbp=int64#15
# asm 2: movq <rbp_stack=224(%rsp),>rbp=%rbp
movq 224(%rsp),%rbp

# qhasm:   result = 0
# asm 1: mov  $0,>result=int64#1
# asm 2: mov  $0,>result=%rdi
mov  $0,%rdi

# qhasm: leave
add %r11,%rsp
xor %rax,%rax
xor %rdx,%rdx
ret
