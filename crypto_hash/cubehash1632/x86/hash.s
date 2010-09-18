
# qhasm: stack32 arg1

# qhasm: stack32 arg2

# qhasm: stack32 arg3

# qhasm: stack32 arg4

# qhasm: input arg1

# qhasm: input arg2

# qhasm: input arg3

# qhasm: input arg4

# qhasm: int32 out

# qhasm: int32 in

# qhasm: int32 inlenlow

# qhasm: int32 inlenhigh

# qhasm: int32 x00

# qhasm: int32 x01

# qhasm: int32 x02

# qhasm: int32 x03

# qhasm: int32 x04

# qhasm: int32 x05

# qhasm: int32 x06

# qhasm: int32 x07

# qhasm: int32 x08

# qhasm: int32 x09

# qhasm: int32 x0a

# qhasm: int32 x0b

# qhasm: int32 x0c

# qhasm: int32 x0d

# qhasm: int32 x0e

# qhasm: int32 x0f

# qhasm: int32 x10

# qhasm: int32 x11

# qhasm: int32 x12

# qhasm: int32 x13

# qhasm: int32 x14

# qhasm: int32 x15

# qhasm: int32 x16

# qhasm: int32 x17

# qhasm: int32 x18

# qhasm: int32 x19

# qhasm: int32 x1a

# qhasm: int32 x1b

# qhasm: int32 x1c

# qhasm: int32 x1d

# qhasm: int32 x1e

# qhasm: int32 x1f

# qhasm: int32 y00

# qhasm: int32 r

# qhasm: int32 finalization

# qhasm: stack256 tmp

# qhasm: int32 z

# qhasm: stack32 out_stack

# qhasm: stack32 in_stack

# qhasm: stack32 inlenlow_stack

# qhasm: stack32 inlenhigh_stack

# qhasm: stack32 finalization_stack

# qhasm: stack32 r_stack

# qhasm: int3232 x02_stack

# qhasm: int3232 x03_stack

# qhasm: int3232 x04_stack

# qhasm: int3232 x05_stack

# qhasm: int3232 x06_stack

# qhasm: int3232 x07_stack

# qhasm: int3232 x08_stack

# qhasm: int3232 x09_stack

# qhasm: stack32 x0a_stack

# qhasm: stack32 x0b_stack

# qhasm: stack32 x0c_stack

# qhasm: stack32 x0d_stack

# qhasm: stack32 x0e_stack

# qhasm: stack32 x0f_stack

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

# qhasm: int32 eax

# qhasm: int32 ebx

# qhasm: int32 esi

# qhasm: int32 edi

# qhasm: int32 ebp

# qhasm: caller eax

# qhasm: caller ebx

# qhasm: caller esi

# qhasm: caller edi

# qhasm: caller ebp

# qhasm: stack32 eax_stack

# qhasm: stack32 ebx_stack

# qhasm: stack32 esi_stack

# qhasm: stack32 edi_stack

# qhasm: stack32 ebp_stack

# qhasm: enter crypto_hash_cubehash1632_x86
.text
.p2align 5
.globl _crypto_hash_cubehash1632_x86
.globl crypto_hash_cubehash1632_x86
_crypto_hash_cubehash1632_x86:
crypto_hash_cubehash1632_x86:
mov %esp,%eax
and $31,%eax
add $192,%eax
sub %eax,%esp

# qhasm:   eax_stack = eax
# asm 1: movl <eax=int32#1,>eax_stack=stack32#1
# asm 2: movl <eax=%eax,>eax_stack=0(%esp)
movl %eax,0(%esp)

# qhasm:   ebx_stack = ebx
# asm 1: movl <ebx=int32#4,>ebx_stack=stack32#2
# asm 2: movl <ebx=%ebx,>ebx_stack=4(%esp)
movl %ebx,4(%esp)

# qhasm:   esi_stack = esi
# asm 1: movl <esi=int32#5,>esi_stack=stack32#3
# asm 2: movl <esi=%esi,>esi_stack=8(%esp)
movl %esi,8(%esp)

# qhasm:   edi_stack = edi
# asm 1: movl <edi=int32#6,>edi_stack=stack32#4
# asm 2: movl <edi=%edi,>edi_stack=12(%esp)
movl %edi,12(%esp)

# qhasm:   ebp_stack = ebp
# asm 1: movl <ebp=int32#7,>ebp_stack=stack32#5
# asm 2: movl <ebp=%ebp,>ebp_stack=16(%esp)
movl %ebp,16(%esp)

# qhasm:   out = arg1
# asm 1: movl <arg1=stack32#-1,>out=int32#2
# asm 2: movl <arg1=4(%esp,%eax),>out=%ecx
movl 4(%esp,%eax),%ecx

# qhasm:   in = arg2
# asm 1: movl <arg2=stack32#-2,>in=int32#5
# asm 2: movl <arg2=8(%esp,%eax),>in=%esi
movl 8(%esp,%eax),%esi

# qhasm:   inlenlow = arg3
# asm 1: movl <arg3=stack32#-3,>inlenlow=int32#3
# asm 2: movl <arg3=12(%esp,%eax),>inlenlow=%edx
movl 12(%esp,%eax),%edx

# qhasm:   inlenhigh = arg4
# asm 1: movl <arg4=stack32#-4,>inlenhigh=int32#1
# asm 2: movl <arg4=16(%esp,%eax),>inlenhigh=%eax
movl 16(%esp,%eax),%eax

# qhasm:   in_stack = in
# asm 1: movl <in=int32#5,>in_stack=stack32#6
# asm 2: movl <in=%esi,>in_stack=20(%esp)
movl %esi,20(%esp)

# qhasm:   out_stack = out
# asm 1: movl <out=int32#2,>out_stack=stack32#7
# asm 2: movl <out=%ecx,>out_stack=24(%esp)
movl %ecx,24(%esp)

# qhasm:   inlenlow_stack = inlenlow
# asm 1: movl <inlenlow=int32#3,>inlenlow_stack=stack32#8
# asm 2: movl <inlenlow=%edx,>inlenlow_stack=28(%esp)
movl %edx,28(%esp)

# qhasm:   inlenhigh_stack = inlenhigh
# asm 1: movl <inlenhigh=int32#1,>inlenhigh_stack=stack32#9
# asm 2: movl <inlenhigh=%eax,>inlenhigh_stack=32(%esp)
movl %eax,32(%esp)

# qhasm:   x08 = 0x4d42c787
# asm 1: mov  $0x4d42c787,>x08=int32#1
# asm 2: mov  $0x4d42c787,>x08=%eax
mov  $0x4d42c787,%eax

# qhasm:   x09 = 0xa647a8b3
# asm 1: mov  $0xa647a8b3,>x09=int32#2
# asm 2: mov  $0xa647a8b3,>x09=%ecx
mov  $0xa647a8b3,%ecx

# qhasm:   x0a = 0x97cf0bef
# asm 1: mov  $0x97cf0bef,>x0a=int32#3
# asm 2: mov  $0x97cf0bef,>x0a=%edx
mov  $0x97cf0bef,%edx

# qhasm:   x0b = 0x825b4537
# asm 1: mov  $0x825b4537,>x0b=int32#4
# asm 2: mov  $0x825b4537,>x0b=%ebx
mov  $0x825b4537,%ebx

# qhasm:   x08_stack = x08
# asm 1: movd <x08=int32#1,>x08_stack=int3232#1
# asm 2: movd <x08=%eax,>x08_stack=%mm0
movd %eax,%mm0

# qhasm:   x09_stack = x09
# asm 1: movd <x09=int32#2,>x09_stack=int3232#2
# asm 2: movd <x09=%ecx,>x09_stack=%mm1
movd %ecx,%mm1

# qhasm:   x0a_stack = x0a
# asm 1: movl <x0a=int32#3,>x0a_stack=stack32#10
# asm 2: movl <x0a=%edx,>x0a_stack=36(%esp)
movl %edx,36(%esp)

# qhasm:   x0b_stack = x0b
# asm 1: movl <x0b=int32#4,>x0b_stack=stack32#11
# asm 2: movl <x0b=%ebx,>x0b_stack=40(%esp)
movl %ebx,40(%esp)

# qhasm:   x0c = 0xeef864d2
# asm 1: mov  $0xeef864d2,>x0c=int32#1
# asm 2: mov  $0xeef864d2,>x0c=%eax
mov  $0xeef864d2,%eax

# qhasm:   x0d = 0xf22090c4
# asm 1: mov  $0xf22090c4,>x0d=int32#2
# asm 2: mov  $0xf22090c4,>x0d=%ecx
mov  $0xf22090c4,%ecx

# qhasm:   x0e = 0xd0e5cd33
# asm 1: mov  $0xd0e5cd33,>x0e=int32#3
# asm 2: mov  $0xd0e5cd33,>x0e=%edx
mov  $0xd0e5cd33,%edx

# qhasm:   x0f = 0xa23911ae
# asm 1: mov  $0xa23911ae,>x0f=int32#4
# asm 2: mov  $0xa23911ae,>x0f=%ebx
mov  $0xa23911ae,%ebx

# qhasm:   x0c_stack = x0c
# asm 1: movl <x0c=int32#1,>x0c_stack=stack32#12
# asm 2: movl <x0c=%eax,>x0c_stack=44(%esp)
movl %eax,44(%esp)

# qhasm:   x0d_stack = x0d
# asm 1: movl <x0d=int32#2,>x0d_stack=stack32#13
# asm 2: movl <x0d=%ecx,>x0d_stack=48(%esp)
movl %ecx,48(%esp)

# qhasm:   x0e_stack = x0e
# asm 1: movl <x0e=int32#3,>x0e_stack=stack32#14
# asm 2: movl <x0e=%edx,>x0e_stack=52(%esp)
movl %edx,52(%esp)

# qhasm:   x0f_stack = x0f
# asm 1: movl <x0f=int32#4,>x0f_stack=stack32#15
# asm 2: movl <x0f=%ebx,>x0f_stack=56(%esp)
movl %ebx,56(%esp)

# qhasm:   x10 = 0xfcd398d9
# asm 1: mov  $0xfcd398d9,>x10=int32#1
# asm 2: mov  $0xfcd398d9,>x10=%eax
mov  $0xfcd398d9,%eax

# qhasm:   x11 = 0x148fe485
# asm 1: mov  $0x148fe485,>x11=int32#2
# asm 2: mov  $0x148fe485,>x11=%ecx
mov  $0x148fe485,%ecx

# qhasm:   x12 = 0x1b017bef
# asm 1: mov  $0x1b017bef,>x12=int32#3
# asm 2: mov  $0x1b017bef,>x12=%edx
mov  $0x1b017bef,%edx

# qhasm:   x13 = 0xb6444532
# asm 1: mov  $0xb6444532,>x13=int32#4
# asm 2: mov  $0xb6444532,>x13=%ebx
mov  $0xb6444532,%ebx

# qhasm:   x10_stack = x10
# asm 1: movl <x10=int32#1,>x10_stack=stack32#16
# asm 2: movl <x10=%eax,>x10_stack=60(%esp)
movl %eax,60(%esp)

# qhasm:   x11_stack = x11
# asm 1: movl <x11=int32#2,>x11_stack=stack32#17
# asm 2: movl <x11=%ecx,>x11_stack=64(%esp)
movl %ecx,64(%esp)

# qhasm:   x12_stack = x12
# asm 1: movl <x12=int32#3,>x12_stack=stack32#18
# asm 2: movl <x12=%edx,>x12_stack=68(%esp)
movl %edx,68(%esp)

# qhasm:   x13_stack = x13
# asm 1: movl <x13=int32#4,>x13_stack=stack32#19
# asm 2: movl <x13=%ebx,>x13_stack=72(%esp)
movl %ebx,72(%esp)

# qhasm:   x14 = 0x6a536159
# asm 1: mov  $0x6a536159,>x14=int32#1
# asm 2: mov  $0x6a536159,>x14=%eax
mov  $0x6a536159,%eax

# qhasm:   x15 = 0x2ff5781c
# asm 1: mov  $0x2ff5781c,>x15=int32#2
# asm 2: mov  $0x2ff5781c,>x15=%ecx
mov  $0x2ff5781c,%ecx

# qhasm:   x16 = 0x91fa7934
# asm 1: mov  $0x91fa7934,>x16=int32#3
# asm 2: mov  $0x91fa7934,>x16=%edx
mov  $0x91fa7934,%edx

# qhasm:   x17 = 0x0dbadea9
# asm 1: mov  $0x0dbadea9,>x17=int32#4
# asm 2: mov  $0x0dbadea9,>x17=%ebx
mov  $0x0dbadea9,%ebx

# qhasm:   x14_stack = x14
# asm 1: movl <x14=int32#1,>x14_stack=stack32#20
# asm 2: movl <x14=%eax,>x14_stack=76(%esp)
movl %eax,76(%esp)

# qhasm:   x15_stack = x15
# asm 1: movl <x15=int32#2,>x15_stack=stack32#21
# asm 2: movl <x15=%ecx,>x15_stack=80(%esp)
movl %ecx,80(%esp)

# qhasm:   x16_stack = x16
# asm 1: movl <x16=int32#3,>x16_stack=stack32#22
# asm 2: movl <x16=%edx,>x16_stack=84(%esp)
movl %edx,84(%esp)

# qhasm:   x17_stack = x17
# asm 1: movl <x17=int32#4,>x17_stack=stack32#23
# asm 2: movl <x17=%ebx,>x17_stack=88(%esp)
movl %ebx,88(%esp)

# qhasm:   x18 = 0xd65c8a2b
# asm 1: mov  $0xd65c8a2b,>x18=int32#1
# asm 2: mov  $0xd65c8a2b,>x18=%eax
mov  $0xd65c8a2b,%eax

# qhasm:   x19 = 0xa5a70e75
# asm 1: mov  $0xa5a70e75,>x19=int32#2
# asm 2: mov  $0xa5a70e75,>x19=%ecx
mov  $0xa5a70e75,%ecx

# qhasm:   x1a = 0xb1c62456
# asm 1: mov  $0xb1c62456,>x1a=int32#3
# asm 2: mov  $0xb1c62456,>x1a=%edx
mov  $0xb1c62456,%edx

# qhasm:   x1b = 0xbc796576
# asm 1: mov  $0xbc796576,>x1b=int32#4
# asm 2: mov  $0xbc796576,>x1b=%ebx
mov  $0xbc796576,%ebx

# qhasm:   x18_stack = x18
# asm 1: movl <x18=int32#1,>x18_stack=stack32#24
# asm 2: movl <x18=%eax,>x18_stack=92(%esp)
movl %eax,92(%esp)

# qhasm:   x19_stack = x19
# asm 1: movl <x19=int32#2,>x19_stack=stack32#25
# asm 2: movl <x19=%ecx,>x19_stack=96(%esp)
movl %ecx,96(%esp)

# qhasm:   x1a_stack = x1a
# asm 1: movl <x1a=int32#3,>x1a_stack=stack32#26
# asm 2: movl <x1a=%edx,>x1a_stack=100(%esp)
movl %edx,100(%esp)

# qhasm:   x1b_stack = x1b
# asm 1: movl <x1b=int32#4,>x1b_stack=stack32#27
# asm 2: movl <x1b=%ebx,>x1b_stack=104(%esp)
movl %ebx,104(%esp)

# qhasm:   x1c = 0x1921c8f7
# asm 1: mov  $0x1921c8f7,>x1c=int32#1
# asm 2: mov  $0x1921c8f7,>x1c=%eax
mov  $0x1921c8f7,%eax

# qhasm:   x1d = 0xe7989af1
# asm 1: mov  $0xe7989af1,>x1d=int32#2
# asm 2: mov  $0xe7989af1,>x1d=%ecx
mov  $0xe7989af1,%ecx

# qhasm:   x1e = 0x7795d246
# asm 1: mov  $0x7795d246,>x1e=int32#3
# asm 2: mov  $0x7795d246,>x1e=%edx
mov  $0x7795d246,%edx

# qhasm:   x1f = 0xd43e3b44
# asm 1: mov  $0xd43e3b44,>x1f=int32#4
# asm 2: mov  $0xd43e3b44,>x1f=%ebx
mov  $0xd43e3b44,%ebx

# qhasm:   x1c_stack = x1c
# asm 1: movl <x1c=int32#1,>x1c_stack=stack32#28
# asm 2: movl <x1c=%eax,>x1c_stack=108(%esp)
movl %eax,108(%esp)

# qhasm:   x1d_stack = x1d
# asm 1: movl <x1d=int32#2,>x1d_stack=stack32#29
# asm 2: movl <x1d=%ecx,>x1d_stack=112(%esp)
movl %ecx,112(%esp)

# qhasm:   x1e_stack = x1e
# asm 1: movl <x1e=int32#3,>x1e_stack=stack32#30
# asm 2: movl <x1e=%edx,>x1e_stack=116(%esp)
movl %edx,116(%esp)

# qhasm:   x1f_stack = x1f
# asm 1: movl <x1f=int32#4,>x1f_stack=stack32#31
# asm 2: movl <x1f=%ebx,>x1f_stack=120(%esp)
movl %ebx,120(%esp)

# qhasm:   x00 = 0x2aea2a61
# asm 1: mov  $0x2aea2a61,>x00=int32#3
# asm 2: mov  $0x2aea2a61,>x00=%edx
mov  $0x2aea2a61,%edx

# qhasm:   x01 = 0x50f494d4
# asm 1: mov  $0x50f494d4,>x01=int32#4
# asm 2: mov  $0x50f494d4,>x01=%ebx
mov  $0x50f494d4,%ebx

# qhasm:   x02 = 0x2d538b8b
# asm 1: mov  $0x2d538b8b,>x02=int32#1
# asm 2: mov  $0x2d538b8b,>x02=%eax
mov  $0x2d538b8b,%eax

# qhasm:   x03 = 0x4167d83e
# asm 1: mov  $0x4167d83e,>x03=int32#2
# asm 2: mov  $0x4167d83e,>x03=%ecx
mov  $0x4167d83e,%ecx

# qhasm:   x02_stack = x02
# asm 1: movd <x02=int32#1,>x02_stack=int3232#3
# asm 2: movd <x02=%eax,>x02_stack=%mm2
movd %eax,%mm2

# qhasm:   x03_stack = x03
# asm 1: movd <x03=int32#2,>x03_stack=int3232#4
# asm 2: movd <x03=%ecx,>x03_stack=%mm3
movd %ecx,%mm3

# qhasm:   x04 = 0x3fee2313
# asm 1: mov  $0x3fee2313,>x04=int32#1
# asm 2: mov  $0x3fee2313,>x04=%eax
mov  $0x3fee2313,%eax

# qhasm:   x05 = 0xc701cf8c
# asm 1: mov  $0xc701cf8c,>x05=int32#2
# asm 2: mov  $0xc701cf8c,>x05=%ecx
mov  $0xc701cf8c,%ecx

# qhasm:   x06 = 0xcc39968e
# asm 1: mov  $0xcc39968e,>x06=int32#6
# asm 2: mov  $0xcc39968e,>x06=%edi
mov  $0xcc39968e,%edi

# qhasm:   x07 = 0x50ac5695
# asm 1: mov  $0x50ac5695,>x07=int32#7
# asm 2: mov  $0x50ac5695,>x07=%ebp
mov  $0x50ac5695,%ebp

# qhasm:   x04_stack = x04
# asm 1: movd <x04=int32#1,>x04_stack=int3232#5
# asm 2: movd <x04=%eax,>x04_stack=%mm4
movd %eax,%mm4

# qhasm:   x05_stack = x05
# asm 1: movd <x05=int32#2,>x05_stack=int3232#6
# asm 2: movd <x05=%ecx,>x05_stack=%mm5
movd %ecx,%mm5

# qhasm:   x06_stack = x06
# asm 1: movd <x06=int32#6,>x06_stack=int3232#7
# asm 2: movd <x06=%edi,>x06_stack=%mm6
movd %edi,%mm6

# qhasm:   x07_stack = x07
# asm 1: movd <x07=int32#7,>x07_stack=int3232#8
# asm 2: movd <x07=%ebp,>x07_stack=%mm7
movd %ebp,%mm7

# qhasm:   finalization = 0
# asm 1: mov  $0,>finalization=int32#1
# asm 2: mov  $0,>finalization=%eax
mov  $0,%eax

# qhasm: checkinlen:
._checkinlen:

# qhasm:   inlenlow = inlenlow_stack
# asm 1: movl <inlenlow_stack=stack32#8,>inlenlow=int32#2
# asm 2: movl <inlenlow_stack=28(%esp),>inlenlow=%ecx
movl 28(%esp),%ecx

# qhasm:   inlenhigh = inlenhigh_stack
# asm 1: movl <inlenhigh_stack=stack32#9,>inlenhigh=int32#7
# asm 2: movl <inlenhigh_stack=32(%esp),>inlenhigh=%ebp
movl 32(%esp),%ebp

# qhasm:                   unsigned<? inlenlow - 32
# asm 1: cmp  $32,<inlenlow=int32#2
# asm 2: cmp  $32,<inlenlow=%ecx
cmp  $32,%ecx
# comment:fp stack unchanged by jump

# qhasm: goto mainloop if !unsigned<
jae ._mainloop

# qhasm:                      =? inlenhigh - 0
# asm 1: cmp  $0,<inlenhigh=int32#7
# asm 2: cmp  $0,<inlenhigh=%ebp
cmp  $0,%ebp
# comment:fp stack unchanged by jump

# qhasm: goto inlenbelow32 if =
je ._inlenbelow32
# comment:fp stack unchanged by fallthrough

# qhasm: mainloop:
._mainloop:

# qhasm:   carry? inlenlow -= 32
# asm 1: sub $32,<inlenlow=int32#2
# asm 2: sub $32,<inlenlow=%ecx
sub $32,%ecx

# qhasm:   inlenhigh -= 0 - carry
# asm 1: sbb $0,<inlenhigh=int32#7
# asm 2: sbb $0,<inlenhigh=%ebp
sbb $0,%ebp

# qhasm:   finalization_stack = finalization
# asm 1: movl <finalization=int32#1,>finalization_stack=stack32#32
# asm 2: movl <finalization=%eax,>finalization_stack=124(%esp)
movl %eax,124(%esp)

# qhasm:   inlenlow_stack = inlenlow
# asm 1: movl <inlenlow=int32#2,>inlenlow_stack=stack32#8
# asm 2: movl <inlenlow=%ecx,>inlenlow_stack=28(%esp)
movl %ecx,28(%esp)

# qhasm:   inlenhigh_stack = inlenhigh
# asm 1: movl <inlenhigh=int32#7,>inlenhigh_stack=stack32#9
# asm 2: movl <inlenhigh=%ebp,>inlenhigh_stack=32(%esp)
movl %ebp,32(%esp)

# qhasm:   in = in_stack
# asm 1: movl <in_stack=stack32#6,>in=int32#5
# asm 2: movl <in_stack=20(%esp),>in=%esi
movl 20(%esp),%esi

# qhasm:   x02 = x02_stack
# asm 1: movd <x02_stack=int3232#3,>x02=int32#1
# asm 2: movd <x02_stack=%mm2,>x02=%eax
movd %mm2,%eax

# qhasm:   x03 = x03_stack
# asm 1: movd <x03_stack=int3232#4,>x03=int32#2
# asm 2: movd <x03_stack=%mm3,>x03=%ecx
movd %mm3,%ecx

# qhasm:   x00 ^= *(uint32 *) (in + 0)
# asm 1: xorl 0(<in=int32#5),<x00=int32#3
# asm 2: xorl 0(<in=%esi),<x00=%edx
xorl 0(%esi),%edx

# qhasm:   x01 ^= *(uint32 *) (in + 4)
# asm 1: xorl 4(<in=int32#5),<x01=int32#4
# asm 2: xorl 4(<in=%esi),<x01=%ebx
xorl 4(%esi),%ebx

# qhasm:   x02 ^= *(uint32 *) (in + 8)
# asm 1: xorl 8(<in=int32#5),<x02=int32#1
# asm 2: xorl 8(<in=%esi),<x02=%eax
xorl 8(%esi),%eax

# qhasm:   x03 ^= *(uint32 *) (in + 12)
# asm 1: xorl 12(<in=int32#5),<x03=int32#2
# asm 2: xorl 12(<in=%esi),<x03=%ecx
xorl 12(%esi),%ecx

# qhasm:   x02_stack = x02
# asm 1: movd <x02=int32#1,>x02_stack=int3232#3
# asm 2: movd <x02=%eax,>x02_stack=%mm2
movd %eax,%mm2

# qhasm:   x03_stack = x03
# asm 1: movd <x03=int32#2,>x03_stack=int3232#4
# asm 2: movd <x03=%ecx,>x03_stack=%mm3
movd %ecx,%mm3

# qhasm:   x04 = x04_stack
# asm 1: movd <x04_stack=int3232#5,>x04=int32#1
# asm 2: movd <x04_stack=%mm4,>x04=%eax
movd %mm4,%eax

# qhasm:   x05 = x05_stack
# asm 1: movd <x05_stack=int3232#6,>x05=int32#2
# asm 2: movd <x05_stack=%mm5,>x05=%ecx
movd %mm5,%ecx

# qhasm:   x06 = x06_stack
# asm 1: movd <x06_stack=int3232#7,>x06=int32#6
# asm 2: movd <x06_stack=%mm6,>x06=%edi
movd %mm6,%edi

# qhasm:   x07 = x07_stack
# asm 1: movd <x07_stack=int3232#8,>x07=int32#7
# asm 2: movd <x07_stack=%mm7,>x07=%ebp
movd %mm7,%ebp

# qhasm:   x04 ^= *(uint32 *) (in + 16)
# asm 1: xorl 16(<in=int32#5),<x04=int32#1
# asm 2: xorl 16(<in=%esi),<x04=%eax
xorl 16(%esi),%eax

# qhasm:   x05 ^= *(uint32 *) (in + 20)
# asm 1: xorl 20(<in=int32#5),<x05=int32#2
# asm 2: xorl 20(<in=%esi),<x05=%ecx
xorl 20(%esi),%ecx

# qhasm:   x06 ^= *(uint32 *) (in + 24)
# asm 1: xorl 24(<in=int32#5),<x06=int32#6
# asm 2: xorl 24(<in=%esi),<x06=%edi
xorl 24(%esi),%edi

# qhasm:   x07 ^= *(uint32 *) (in + 28)
# asm 1: xorl 28(<in=int32#5),<x07=int32#7
# asm 2: xorl 28(<in=%esi),<x07=%ebp
xorl 28(%esi),%ebp

# qhasm:   x04_stack = x04
# asm 1: movd <x04=int32#1,>x04_stack=int3232#5
# asm 2: movd <x04=%eax,>x04_stack=%mm4
movd %eax,%mm4

# qhasm:   x05_stack = x05
# asm 1: movd <x05=int32#2,>x05_stack=int3232#6
# asm 2: movd <x05=%ecx,>x05_stack=%mm5
movd %ecx,%mm5

# qhasm:   x06_stack = x06
# asm 1: movd <x06=int32#6,>x06_stack=int3232#7
# asm 2: movd <x06=%edi,>x06_stack=%mm6
movd %edi,%mm6

# qhasm:   x07_stack = x07
# asm 1: movd <x07=int32#7,>x07_stack=int3232#8
# asm 2: movd <x07=%ebp,>x07_stack=%mm7
movd %ebp,%mm7

# qhasm:   r = 16
# asm 1: mov  $16,>r=int32#1
# asm 2: mov  $16,>r=%eax
mov  $16,%eax

# qhasm:   in += 32
# asm 1: add  $32,<in=int32#5
# asm 2: add  $32,<in=%esi
add  $32,%esi

# qhasm:   in_stack = in
# asm 1: movl <in=int32#5,>in_stack=stack32#6
# asm 2: movl <in=%esi,>in_stack=20(%esp)
movl %esi,20(%esp)

# qhasm: morerounds:
._morerounds:

# qhasm: r_stack = r
# asm 1: movl <r=int32#1,>r_stack=stack32#33
# asm 2: movl <r=%eax,>r_stack=128(%esp)
movl %eax,128(%esp)

# qhasm: x10 = x10_stack
# asm 1: movl <x10_stack=stack32#16,>x10=int32#1
# asm 2: movl <x10_stack=60(%esp),>x10=%eax
movl 60(%esp),%eax

# qhasm: x08 = x08_stack
# asm 1: movd <x08_stack=int3232#1,>x08=int32#2
# asm 2: movd <x08_stack=%mm0,>x08=%ecx
movd %mm0,%ecx

# qhasm: x18 = x18_stack
# asm 1: movl <x18_stack=stack32#24,>x18=int32#6
# asm 2: movl <x18_stack=92(%esp),>x18=%edi
movl 92(%esp),%edi

# qhasm: x10 += x00
# asm 1: addl <x00=int32#3,<x10=int32#1
# asm 2: addl <x00=%edx,<x10=%eax
addl %edx,%eax

# qhasm: x00 <<<= 7
# asm 1: rol  $7,<x00=int32#3
# asm 2: rol  $7,<x00=%edx
rol  $7,%edx

# qhasm: x10_stack = x10
# asm 1: movl <x10=int32#1,>x10_stack=stack32#16
# asm 2: movl <x10=%eax,>x10_stack=60(%esp)
movl %eax,60(%esp)

# qhasm: x18 += x08
# asm 1: addl <x08=int32#2,<x18=int32#6
# asm 2: addl <x08=%ecx,<x18=%edi
addl %ecx,%edi

# qhasm: x08 <<<= 7
# asm 1: rol  $7,<x08=int32#2
# asm 2: rol  $7,<x08=%ecx
rol  $7,%ecx

# qhasm: x18_stack = x18
# asm 1: movl <x18=int32#6,>x18_stack=stack32#24
# asm 2: movl <x18=%edi,>x18_stack=92(%esp)
movl %edi,92(%esp)

# qhasm: x00 ^= x18
# asm 1: xorl <x18=int32#6,<x00=int32#3
# asm 2: xorl <x18=%edi,<x00=%edx
xorl %edi,%edx

# qhasm: x08 ^= x10
# asm 1: xorl <x10=int32#1,<x08=int32#2
# asm 2: xorl <x10=%eax,<x08=%ecx
xorl %eax,%ecx

# qhasm: x08_stack = x08
# asm 1: movd <x08=int32#2,>x08_stack=int3232#1
# asm 2: movd <x08=%ecx,>x08_stack=%mm0
movd %ecx,%mm0

# qhasm: x04 = x04_stack
# asm 1: movd <x04_stack=int3232#5,>x04=int32#1
# asm 2: movd <x04_stack=%mm4,>x04=%eax
movd %mm4,%eax

# qhasm: x14 = x14_stack
# asm 1: movl <x14_stack=stack32#20,>x14=int32#2
# asm 2: movl <x14_stack=76(%esp),>x14=%ecx
movl 76(%esp),%ecx

# qhasm: x0c = x0c_stack
# asm 1: movl <x0c_stack=stack32#12,>x0c=int32#6
# asm 2: movl <x0c_stack=44(%esp),>x0c=%edi
movl 44(%esp),%edi

# qhasm: x1c = x1c_stack
# asm 1: movl <x1c_stack=stack32#28,>x1c=int32#7
# asm 2: movl <x1c_stack=108(%esp),>x1c=%ebp
movl 108(%esp),%ebp

# qhasm: x14 += x04
# asm 1: addl <x04=int32#1,<x14=int32#2
# asm 2: addl <x04=%eax,<x14=%ecx
addl %eax,%ecx

# qhasm: x04 <<<= 7
# asm 1: rol  $7,<x04=int32#1
# asm 2: rol  $7,<x04=%eax
rol  $7,%eax

# qhasm: x14_stack = x14
# asm 1: movl <x14=int32#2,>x14_stack=stack32#12
# asm 2: movl <x14=%ecx,>x14_stack=44(%esp)
movl %ecx,44(%esp)

# qhasm: x1c += x0c
# asm 1: addl <x0c=int32#6,<x1c=int32#7
# asm 2: addl <x0c=%edi,<x1c=%ebp
addl %edi,%ebp

# qhasm: x0c <<<= 7
# asm 1: rol  $7,<x0c=int32#6
# asm 2: rol  $7,<x0c=%edi
rol  $7,%edi

# qhasm: x1c_stack = x1c
# asm 1: movl <x1c=int32#7,>x1c_stack=stack32#20
# asm 2: movl <x1c=%ebp,>x1c_stack=76(%esp)
movl %ebp,76(%esp)

# qhasm: x04 ^= x1c
# asm 1: xorl <x1c=int32#7,<x04=int32#1
# asm 2: xorl <x1c=%ebp,<x04=%eax
xorl %ebp,%eax

# qhasm: x04_stack = x04
# asm 1: movd <x04=int32#1,>x04_stack=int3232#5
# asm 2: movd <x04=%eax,>x04_stack=%mm4
movd %eax,%mm4

# qhasm: x0c ^= x14
# asm 1: xorl <x14=int32#2,<x0c=int32#6
# asm 2: xorl <x14=%ecx,<x0c=%edi
xorl %ecx,%edi

# qhasm: x0c_stack = x0c
# asm 1: movl <x0c=int32#6,>x0c_stack=stack32#28
# asm 2: movl <x0c=%edi,>x0c_stack=108(%esp)
movl %edi,108(%esp)

# qhasm: x02 = x02_stack
# asm 1: movd <x02_stack=int3232#3,>x02=int32#1
# asm 2: movd <x02_stack=%mm2,>x02=%eax
movd %mm2,%eax

# qhasm: x12 = x12_stack
# asm 1: movl <x12_stack=stack32#18,>x12=int32#2
# asm 2: movl <x12_stack=68(%esp),>x12=%ecx
movl 68(%esp),%ecx

# qhasm: x0a = x0a_stack
# asm 1: movl <x0a_stack=stack32#10,>x0a=int32#6
# asm 2: movl <x0a_stack=36(%esp),>x0a=%edi
movl 36(%esp),%edi

# qhasm: x1a = x1a_stack
# asm 1: movl <x1a_stack=stack32#26,>x1a=int32#7
# asm 2: movl <x1a_stack=100(%esp),>x1a=%ebp
movl 100(%esp),%ebp

# qhasm: x12 += x02
# asm 1: addl <x02=int32#1,<x12=int32#2
# asm 2: addl <x02=%eax,<x12=%ecx
addl %eax,%ecx

# qhasm: x02 <<<= 7
# asm 1: rol  $7,<x02=int32#1
# asm 2: rol  $7,<x02=%eax
rol  $7,%eax

# qhasm: x12_stack = x12
# asm 1: movl <x12=int32#2,>x12_stack=stack32#10
# asm 2: movl <x12=%ecx,>x12_stack=36(%esp)
movl %ecx,36(%esp)

# qhasm: x1a += x0a
# asm 1: addl <x0a=int32#6,<x1a=int32#7
# asm 2: addl <x0a=%edi,<x1a=%ebp
addl %edi,%ebp

# qhasm: x0a <<<= 7
# asm 1: rol  $7,<x0a=int32#6
# asm 2: rol  $7,<x0a=%edi
rol  $7,%edi

# qhasm: x1a_stack = x1a
# asm 1: movl <x1a=int32#7,>x1a_stack=stack32#18
# asm 2: movl <x1a=%ebp,>x1a_stack=68(%esp)
movl %ebp,68(%esp)

# qhasm: x02 ^= x1a
# asm 1: xorl <x1a=int32#7,<x02=int32#1
# asm 2: xorl <x1a=%ebp,<x02=%eax
xorl %ebp,%eax

# qhasm: x02_stack = x02
# asm 1: movd <x02=int32#1,>x02_stack=int3232#3
# asm 2: movd <x02=%eax,>x02_stack=%mm2
movd %eax,%mm2

# qhasm: x0a ^= x12
# asm 1: xorl <x12=int32#2,<x0a=int32#6
# asm 2: xorl <x12=%ecx,<x0a=%edi
xorl %ecx,%edi

# qhasm: x0a_stack = x0a
# asm 1: movl <x0a=int32#6,>x0a_stack=stack32#26
# asm 2: movl <x0a=%edi,>x0a_stack=100(%esp)
movl %edi,100(%esp)

# qhasm: x06 = x06_stack
# asm 1: movd <x06_stack=int3232#7,>x06=int32#1
# asm 2: movd <x06_stack=%mm6,>x06=%eax
movd %mm6,%eax

# qhasm: x16 = x16_stack
# asm 1: movl <x16_stack=stack32#22,>x16=int32#2
# asm 2: movl <x16_stack=84(%esp),>x16=%ecx
movl 84(%esp),%ecx

# qhasm: x0e = x0e_stack
# asm 1: movl <x0e_stack=stack32#14,>x0e=int32#6
# asm 2: movl <x0e_stack=52(%esp),>x0e=%edi
movl 52(%esp),%edi

# qhasm: x1e = x1e_stack
# asm 1: movl <x1e_stack=stack32#30,>x1e=int32#7
# asm 2: movl <x1e_stack=116(%esp),>x1e=%ebp
movl 116(%esp),%ebp

# qhasm: x16 += x06
# asm 1: addl <x06=int32#1,<x16=int32#2
# asm 2: addl <x06=%eax,<x16=%ecx
addl %eax,%ecx

# qhasm: x06 <<<= 7
# asm 1: rol  $7,<x06=int32#1
# asm 2: rol  $7,<x06=%eax
rol  $7,%eax

# qhasm: x16_stack = x16
# asm 1: movl <x16=int32#2,>x16_stack=stack32#14
# asm 2: movl <x16=%ecx,>x16_stack=52(%esp)
movl %ecx,52(%esp)

# qhasm: x1e += x0e
# asm 1: addl <x0e=int32#6,<x1e=int32#7
# asm 2: addl <x0e=%edi,<x1e=%ebp
addl %edi,%ebp

# qhasm: x0e <<<= 7
# asm 1: rol  $7,<x0e=int32#6
# asm 2: rol  $7,<x0e=%edi
rol  $7,%edi

# qhasm: x1e_stack = x1e
# asm 1: movl <x1e=int32#7,>x1e_stack=stack32#22
# asm 2: movl <x1e=%ebp,>x1e_stack=84(%esp)
movl %ebp,84(%esp)

# qhasm: x06 ^= x1e
# asm 1: xorl <x1e=int32#7,<x06=int32#1
# asm 2: xorl <x1e=%ebp,<x06=%eax
xorl %ebp,%eax

# qhasm: x06_stack = x06
# asm 1: movd <x06=int32#1,>x06_stack=int3232#7
# asm 2: movd <x06=%eax,>x06_stack=%mm6
movd %eax,%mm6

# qhasm: x0e ^= x16
# asm 1: xorl <x16=int32#2,<x0e=int32#6
# asm 2: xorl <x16=%ecx,<x0e=%edi
xorl %ecx,%edi

# qhasm: x0e_stack = x0e
# asm 1: movl <x0e=int32#6,>x0e_stack=stack32#30
# asm 2: movl <x0e=%edi,>x0e_stack=116(%esp)
movl %edi,116(%esp)

# qhasm: x11 = x11_stack
# asm 1: movl <x11_stack=stack32#17,>x11=int32#1
# asm 2: movl <x11_stack=64(%esp),>x11=%eax
movl 64(%esp),%eax

# qhasm: x09 = x09_stack
# asm 1: movd <x09_stack=int3232#2,>x09=int32#2
# asm 2: movd <x09_stack=%mm1,>x09=%ecx
movd %mm1,%ecx

# qhasm: x19 = x19_stack
# asm 1: movl <x19_stack=stack32#25,>x19=int32#6
# asm 2: movl <x19_stack=96(%esp),>x19=%edi
movl 96(%esp),%edi

# qhasm: x11 += x01
# asm 1: addl <x01=int32#4,<x11=int32#1
# asm 2: addl <x01=%ebx,<x11=%eax
addl %ebx,%eax

# qhasm: x01 <<<= 7
# asm 1: rol  $7,<x01=int32#4
# asm 2: rol  $7,<x01=%ebx
rol  $7,%ebx

# qhasm: x11_stack = x11
# asm 1: movl <x11=int32#1,>x11_stack=stack32#17
# asm 2: movl <x11=%eax,>x11_stack=64(%esp)
movl %eax,64(%esp)

# qhasm: x19 += x09
# asm 1: addl <x09=int32#2,<x19=int32#6
# asm 2: addl <x09=%ecx,<x19=%edi
addl %ecx,%edi

# qhasm: x09 <<<= 7
# asm 1: rol  $7,<x09=int32#2
# asm 2: rol  $7,<x09=%ecx
rol  $7,%ecx

# qhasm: x19_stack = x19
# asm 1: movl <x19=int32#6,>x19_stack=stack32#25
# asm 2: movl <x19=%edi,>x19_stack=96(%esp)
movl %edi,96(%esp)

# qhasm: x01 ^= x19
# asm 1: xorl <x19=int32#6,<x01=int32#4
# asm 2: xorl <x19=%edi,<x01=%ebx
xorl %edi,%ebx

# qhasm: x09 ^= x11
# asm 1: xorl <x11=int32#1,<x09=int32#2
# asm 2: xorl <x11=%eax,<x09=%ecx
xorl %eax,%ecx

# qhasm: x09_stack = x09
# asm 1: movd <x09=int32#2,>x09_stack=int3232#2
# asm 2: movd <x09=%ecx,>x09_stack=%mm1
movd %ecx,%mm1

# qhasm: x05 = x05_stack
# asm 1: movd <x05_stack=int3232#6,>x05=int32#1
# asm 2: movd <x05_stack=%mm5,>x05=%eax
movd %mm5,%eax

# qhasm: x15 = x15_stack
# asm 1: movl <x15_stack=stack32#21,>x15=int32#2
# asm 2: movl <x15_stack=80(%esp),>x15=%ecx
movl 80(%esp),%ecx

# qhasm: x0d = x0d_stack
# asm 1: movl <x0d_stack=stack32#13,>x0d=int32#6
# asm 2: movl <x0d_stack=48(%esp),>x0d=%edi
movl 48(%esp),%edi

# qhasm: x1d = x1d_stack
# asm 1: movl <x1d_stack=stack32#29,>x1d=int32#7
# asm 2: movl <x1d_stack=112(%esp),>x1d=%ebp
movl 112(%esp),%ebp

# qhasm: x15 += x05
# asm 1: addl <x05=int32#1,<x15=int32#2
# asm 2: addl <x05=%eax,<x15=%ecx
addl %eax,%ecx

# qhasm: x05 <<<= 7
# asm 1: rol  $7,<x05=int32#1
# asm 2: rol  $7,<x05=%eax
rol  $7,%eax

# qhasm: x15_stack = x15
# asm 1: movl <x15=int32#2,>x15_stack=stack32#13
# asm 2: movl <x15=%ecx,>x15_stack=48(%esp)
movl %ecx,48(%esp)

# qhasm: x1d += x0d
# asm 1: addl <x0d=int32#6,<x1d=int32#7
# asm 2: addl <x0d=%edi,<x1d=%ebp
addl %edi,%ebp

# qhasm: x0d <<<= 7
# asm 1: rol  $7,<x0d=int32#6
# asm 2: rol  $7,<x0d=%edi
rol  $7,%edi

# qhasm: x1d_stack = x1d
# asm 1: movl <x1d=int32#7,>x1d_stack=stack32#21
# asm 2: movl <x1d=%ebp,>x1d_stack=80(%esp)
movl %ebp,80(%esp)

# qhasm: x05 ^= x1d
# asm 1: xorl <x1d=int32#7,<x05=int32#1
# asm 2: xorl <x1d=%ebp,<x05=%eax
xorl %ebp,%eax

# qhasm: x05_stack = x05
# asm 1: movd <x05=int32#1,>x05_stack=int3232#6
# asm 2: movd <x05=%eax,>x05_stack=%mm5
movd %eax,%mm5

# qhasm: x0d ^= x15
# asm 1: xorl <x15=int32#2,<x0d=int32#6
# asm 2: xorl <x15=%ecx,<x0d=%edi
xorl %ecx,%edi

# qhasm: x0d_stack = x0d
# asm 1: movl <x0d=int32#6,>x0d_stack=stack32#29
# asm 2: movl <x0d=%edi,>x0d_stack=112(%esp)
movl %edi,112(%esp)

# qhasm: x03 = x03_stack
# asm 1: movd <x03_stack=int3232#4,>x03=int32#1
# asm 2: movd <x03_stack=%mm3,>x03=%eax
movd %mm3,%eax

# qhasm: x13 = x13_stack
# asm 1: movl <x13_stack=stack32#19,>x13=int32#2
# asm 2: movl <x13_stack=72(%esp),>x13=%ecx
movl 72(%esp),%ecx

# qhasm: x0b = x0b_stack
# asm 1: movl <x0b_stack=stack32#11,>x0b=int32#6
# asm 2: movl <x0b_stack=40(%esp),>x0b=%edi
movl 40(%esp),%edi

# qhasm: x1b = x1b_stack
# asm 1: movl <x1b_stack=stack32#27,>x1b=int32#7
# asm 2: movl <x1b_stack=104(%esp),>x1b=%ebp
movl 104(%esp),%ebp

# qhasm: x13 += x03
# asm 1: addl <x03=int32#1,<x13=int32#2
# asm 2: addl <x03=%eax,<x13=%ecx
addl %eax,%ecx

# qhasm: x03 <<<= 7
# asm 1: rol  $7,<x03=int32#1
# asm 2: rol  $7,<x03=%eax
rol  $7,%eax

# qhasm: x13_stack = x13
# asm 1: movl <x13=int32#2,>x13_stack=stack32#11
# asm 2: movl <x13=%ecx,>x13_stack=40(%esp)
movl %ecx,40(%esp)

# qhasm: x1b += x0b
# asm 1: addl <x0b=int32#6,<x1b=int32#7
# asm 2: addl <x0b=%edi,<x1b=%ebp
addl %edi,%ebp

# qhasm: x0b <<<= 7
# asm 1: rol  $7,<x0b=int32#6
# asm 2: rol  $7,<x0b=%edi
rol  $7,%edi

# qhasm: x1b_stack = x1b
# asm 1: movl <x1b=int32#7,>x1b_stack=stack32#19
# asm 2: movl <x1b=%ebp,>x1b_stack=72(%esp)
movl %ebp,72(%esp)

# qhasm: x03 ^= x1b
# asm 1: xorl <x1b=int32#7,<x03=int32#1
# asm 2: xorl <x1b=%ebp,<x03=%eax
xorl %ebp,%eax

# qhasm: x03_stack = x03
# asm 1: movd <x03=int32#1,>x03_stack=int3232#4
# asm 2: movd <x03=%eax,>x03_stack=%mm3
movd %eax,%mm3

# qhasm: x0b ^= x13
# asm 1: xorl <x13=int32#2,<x0b=int32#6
# asm 2: xorl <x13=%ecx,<x0b=%edi
xorl %ecx,%edi

# qhasm: x0b_stack = x0b
# asm 1: movl <x0b=int32#6,>x0b_stack=stack32#27
# asm 2: movl <x0b=%edi,>x0b_stack=104(%esp)
movl %edi,104(%esp)

# qhasm: x07 = x07_stack
# asm 1: movd <x07_stack=int3232#8,>x07=int32#1
# asm 2: movd <x07_stack=%mm7,>x07=%eax
movd %mm7,%eax

# qhasm: x17 = x17_stack
# asm 1: movl <x17_stack=stack32#23,>x17=int32#2
# asm 2: movl <x17_stack=88(%esp),>x17=%ecx
movl 88(%esp),%ecx

# qhasm: x0f = x0f_stack
# asm 1: movl <x0f_stack=stack32#15,>x0f=int32#6
# asm 2: movl <x0f_stack=56(%esp),>x0f=%edi
movl 56(%esp),%edi

# qhasm: x1f = x1f_stack
# asm 1: movl <x1f_stack=stack32#31,>x1f=int32#7
# asm 2: movl <x1f_stack=120(%esp),>x1f=%ebp
movl 120(%esp),%ebp

# qhasm: x17 += x07
# asm 1: addl <x07=int32#1,<x17=int32#2
# asm 2: addl <x07=%eax,<x17=%ecx
addl %eax,%ecx

# qhasm: x07 <<<= 7
# asm 1: rol  $7,<x07=int32#1
# asm 2: rol  $7,<x07=%eax
rol  $7,%eax

# qhasm: x17_stack = x17
# asm 1: movl <x17=int32#2,>x17_stack=stack32#15
# asm 2: movl <x17=%ecx,>x17_stack=56(%esp)
movl %ecx,56(%esp)

# qhasm: x1f += x0f
# asm 1: addl <x0f=int32#6,<x1f=int32#7
# asm 2: addl <x0f=%edi,<x1f=%ebp
addl %edi,%ebp

# qhasm: x0f <<<= 7
# asm 1: rol  $7,<x0f=int32#6
# asm 2: rol  $7,<x0f=%edi
rol  $7,%edi

# qhasm: x1f_stack = x1f
# asm 1: movl <x1f=int32#7,>x1f_stack=stack32#23
# asm 2: movl <x1f=%ebp,>x1f_stack=88(%esp)
movl %ebp,88(%esp)

# qhasm: x07 ^= x1f
# asm 1: xorl <x1f=int32#7,<x07=int32#1
# asm 2: xorl <x1f=%ebp,<x07=%eax
xorl %ebp,%eax

# qhasm: x07_stack = x07
# asm 1: movd <x07=int32#1,>x07_stack=int3232#8
# asm 2: movd <x07=%eax,>x07_stack=%mm7
movd %eax,%mm7

# qhasm: x0f ^= x17
# asm 1: xorl <x17=int32#2,<x0f=int32#6
# asm 2: xorl <x17=%ecx,<x0f=%edi
xorl %ecx,%edi

# qhasm: x0b = x0b_stack
# asm 1: movl <x0b_stack=stack32#27,>x0b=int32#1
# asm 2: movl <x0b_stack=104(%esp),>x0b=%eax
movl 104(%esp),%eax

# qhasm: x11 = x11_stack
# asm 1: movl <x11_stack=stack32#17,>x11=int32#2
# asm 2: movl <x11_stack=64(%esp),>x11=%ecx
movl 64(%esp),%ecx

# qhasm: x15 = x15_stack
# asm 1: movl <x15_stack=stack32#13,>x15=int32#7
# asm 2: movl <x15_stack=48(%esp),>x15=%ebp
movl 48(%esp),%ebp

# qhasm: x11 += x0b
# asm 1: addl <x0b=int32#1,<x11=int32#2
# asm 2: addl <x0b=%eax,<x11=%ecx
addl %eax,%ecx

# qhasm: x0b <<<= 11
# asm 1: rol  $11,<x0b=int32#1
# asm 2: rol  $11,<x0b=%eax
rol  $11,%eax

# qhasm: x11_stack = x11
# asm 1: movl <x11=int32#2,>x11_stack=stack32#13
# asm 2: movl <x11=%ecx,>x11_stack=48(%esp)
movl %ecx,48(%esp)

# qhasm: x15 += x0f
# asm 1: addl <x0f=int32#6,<x15=int32#7
# asm 2: addl <x0f=%edi,<x15=%ebp
addl %edi,%ebp

# qhasm: x0f <<<= 11
# asm 1: rol  $11,<x0f=int32#6
# asm 2: rol  $11,<x0f=%edi
rol  $11,%edi

# qhasm: x15_stack = x15
# asm 1: movl <x15=int32#7,>x15_stack=stack32#17
# asm 2: movl <x15=%ebp,>x15_stack=64(%esp)
movl %ebp,64(%esp)

# qhasm: x0b ^= x15
# asm 1: xorl <x15=int32#7,<x0b=int32#1
# asm 2: xorl <x15=%ebp,<x0b=%eax
xorl %ebp,%eax

# qhasm: x0b_stack = x0b
# asm 1: movl <x0b=int32#1,>x0b_stack=stack32#27
# asm 2: movl <x0b=%eax,>x0b_stack=104(%esp)
movl %eax,104(%esp)

# qhasm: x0f ^= x11
# asm 1: xorl <x11=int32#2,<x0f=int32#6
# asm 2: xorl <x11=%ecx,<x0f=%edi
xorl %ecx,%edi

# qhasm: x0f_stack = x0f
# asm 1: movl <x0f=int32#6,>x0f_stack=stack32#31
# asm 2: movl <x0f=%edi,>x0f_stack=120(%esp)
movl %edi,120(%esp)

# qhasm: x03 = x03_stack
# asm 1: movd <x03_stack=int3232#4,>x03=int32#1
# asm 2: movd <x03_stack=%mm3,>x03=%eax
movd %mm3,%eax

# qhasm: x19 = x19_stack
# asm 1: movl <x19_stack=stack32#25,>x19=int32#2
# asm 2: movl <x19_stack=96(%esp),>x19=%ecx
movl 96(%esp),%ecx

# qhasm: x07 = x07_stack
# asm 1: movd <x07_stack=int3232#8,>x07=int32#6
# asm 2: movd <x07_stack=%mm7,>x07=%edi
movd %mm7,%edi

# qhasm: x1d = x1d_stack
# asm 1: movl <x1d_stack=stack32#21,>x1d=int32#7
# asm 2: movl <x1d_stack=80(%esp),>x1d=%ebp
movl 80(%esp),%ebp

# qhasm: x19 += x03
# asm 1: addl <x03=int32#1,<x19=int32#2
# asm 2: addl <x03=%eax,<x19=%ecx
addl %eax,%ecx

# qhasm: x03 <<<= 11
# asm 1: rol  $11,<x03=int32#1
# asm 2: rol  $11,<x03=%eax
rol  $11,%eax

# qhasm: x19_stack = x19
# asm 1: movl <x19=int32#2,>x19_stack=stack32#21
# asm 2: movl <x19=%ecx,>x19_stack=80(%esp)
movl %ecx,80(%esp)

# qhasm: x1d += x07
# asm 1: addl <x07=int32#6,<x1d=int32#7
# asm 2: addl <x07=%edi,<x1d=%ebp
addl %edi,%ebp

# qhasm: x07 <<<= 11
# asm 1: rol  $11,<x07=int32#6
# asm 2: rol  $11,<x07=%edi
rol  $11,%edi

# qhasm: x1d_stack = x1d
# asm 1: movl <x1d=int32#7,>x1d_stack=stack32#25
# asm 2: movl <x1d=%ebp,>x1d_stack=96(%esp)
movl %ebp,96(%esp)

# qhasm: x03 ^= x1d
# asm 1: xorl <x1d=int32#7,<x03=int32#1
# asm 2: xorl <x1d=%ebp,<x03=%eax
xorl %ebp,%eax

# qhasm: x03_stack = x03
# asm 1: movd <x03=int32#1,>x03_stack=int3232#4
# asm 2: movd <x03=%eax,>x03_stack=%mm3
movd %eax,%mm3

# qhasm: x07 ^= x19
# asm 1: xorl <x19=int32#2,<x07=int32#6
# asm 2: xorl <x19=%ecx,<x07=%edi
xorl %ecx,%edi

# qhasm: x07_stack = x07
# asm 1: movd <x07=int32#6,>x07_stack=int3232#8
# asm 2: movd <x07=%edi,>x07_stack=%mm7
movd %edi,%mm7

# qhasm: x09 = x09_stack
# asm 1: movd <x09_stack=int3232#2,>x09=int32#1
# asm 2: movd <x09_stack=%mm1,>x09=%eax
movd %mm1,%eax

# qhasm: x13 = x13_stack
# asm 1: movl <x13_stack=stack32#11,>x13=int32#2
# asm 2: movl <x13_stack=40(%esp),>x13=%ecx
movl 40(%esp),%ecx

# qhasm: x0d = x0d_stack
# asm 1: movl <x0d_stack=stack32#29,>x0d=int32#6
# asm 2: movl <x0d_stack=112(%esp),>x0d=%edi
movl 112(%esp),%edi

# qhasm: x17 = x17_stack
# asm 1: movl <x17_stack=stack32#15,>x17=int32#7
# asm 2: movl <x17_stack=56(%esp),>x17=%ebp
movl 56(%esp),%ebp

# qhasm: x13 += x09
# asm 1: addl <x09=int32#1,<x13=int32#2
# asm 2: addl <x09=%eax,<x13=%ecx
addl %eax,%ecx

# qhasm: x09 <<<= 11
# asm 1: rol  $11,<x09=int32#1
# asm 2: rol  $11,<x09=%eax
rol  $11,%eax

# qhasm: x13_stack = x13
# asm 1: movl <x13=int32#2,>x13_stack=stack32#11
# asm 2: movl <x13=%ecx,>x13_stack=40(%esp)
movl %ecx,40(%esp)

# qhasm: x17 += x0d
# asm 1: addl <x0d=int32#6,<x17=int32#7
# asm 2: addl <x0d=%edi,<x17=%ebp
addl %edi,%ebp

# qhasm: x0d <<<= 11
# asm 1: rol  $11,<x0d=int32#6
# asm 2: rol  $11,<x0d=%edi
rol  $11,%edi

# qhasm: x17_stack = x17
# asm 1: movl <x17=int32#7,>x17_stack=stack32#15
# asm 2: movl <x17=%ebp,>x17_stack=56(%esp)
movl %ebp,56(%esp)

# qhasm: x09 ^= x17
# asm 1: xorl <x17=int32#7,<x09=int32#1
# asm 2: xorl <x17=%ebp,<x09=%eax
xorl %ebp,%eax

# qhasm: x09_stack = x09
# asm 1: movd <x09=int32#1,>x09_stack=int3232#2
# asm 2: movd <x09=%eax,>x09_stack=%mm1
movd %eax,%mm1

# qhasm: x0d ^= x13
# asm 1: xorl <x13=int32#2,<x0d=int32#6
# asm 2: xorl <x13=%ecx,<x0d=%edi
xorl %ecx,%edi

# qhasm: x0d_stack = x0d
# asm 1: movl <x0d=int32#6,>x0d_stack=stack32#29
# asm 2: movl <x0d=%edi,>x0d_stack=112(%esp)
movl %edi,112(%esp)

# qhasm: x1b = x1b_stack
# asm 1: movl <x1b_stack=stack32#19,>x1b=int32#1
# asm 2: movl <x1b_stack=72(%esp),>x1b=%eax
movl 72(%esp),%eax

# qhasm: x05 = x05_stack
# asm 1: movd <x05_stack=int3232#6,>x05=int32#2
# asm 2: movd <x05_stack=%mm5,>x05=%ecx
movd %mm5,%ecx

# qhasm: x1f = x1f_stack
# asm 1: movl <x1f_stack=stack32#23,>x1f=int32#6
# asm 2: movl <x1f_stack=88(%esp),>x1f=%edi
movl 88(%esp),%edi

# qhasm: x1b += x01
# asm 1: addl <x01=int32#4,<x1b=int32#1
# asm 2: addl <x01=%ebx,<x1b=%eax
addl %ebx,%eax

# qhasm: x01 <<<= 11
# asm 1: rol  $11,<x01=int32#4
# asm 2: rol  $11,<x01=%ebx
rol  $11,%ebx

# qhasm: x1b_stack = x1b
# asm 1: movl <x1b=int32#1,>x1b_stack=stack32#19
# asm 2: movl <x1b=%eax,>x1b_stack=72(%esp)
movl %eax,72(%esp)

# qhasm: x1f += x05
# asm 1: addl <x05=int32#2,<x1f=int32#6
# asm 2: addl <x05=%ecx,<x1f=%edi
addl %ecx,%edi

# qhasm: x05 <<<= 11
# asm 1: rol  $11,<x05=int32#2
# asm 2: rol  $11,<x05=%ecx
rol  $11,%ecx

# qhasm: x1f_stack = x1f
# asm 1: movl <x1f=int32#6,>x1f_stack=stack32#23
# asm 2: movl <x1f=%edi,>x1f_stack=88(%esp)
movl %edi,88(%esp)

# qhasm: x01 ^= x1f
# asm 1: xorl <x1f=int32#6,<x01=int32#4
# asm 2: xorl <x1f=%edi,<x01=%ebx
xorl %edi,%ebx

# qhasm: x05 ^= x1b
# asm 1: xorl <x1b=int32#1,<x05=int32#2
# asm 2: xorl <x1b=%eax,<x05=%ecx
xorl %eax,%ecx

# qhasm: x05_stack = x05
# asm 1: movd <x05=int32#2,>x05_stack=int3232#6
# asm 2: movd <x05=%ecx,>x05_stack=%mm5
movd %ecx,%mm5

# qhasm: x0a = x0a_stack
# asm 1: movl <x0a_stack=stack32#26,>x0a=int32#1
# asm 2: movl <x0a_stack=100(%esp),>x0a=%eax
movl 100(%esp),%eax

# qhasm: x10 = x10_stack
# asm 1: movl <x10_stack=stack32#16,>x10=int32#2
# asm 2: movl <x10_stack=60(%esp),>x10=%ecx
movl 60(%esp),%ecx

# qhasm: x0e = x0e_stack
# asm 1: movl <x0e_stack=stack32#30,>x0e=int32#6
# asm 2: movl <x0e_stack=116(%esp),>x0e=%edi
movl 116(%esp),%edi

# qhasm: x14 = x14_stack
# asm 1: movl <x14_stack=stack32#12,>x14=int32#7
# asm 2: movl <x14_stack=44(%esp),>x14=%ebp
movl 44(%esp),%ebp

# qhasm: x10 += x0a
# asm 1: addl <x0a=int32#1,<x10=int32#2
# asm 2: addl <x0a=%eax,<x10=%ecx
addl %eax,%ecx

# qhasm: x0a <<<= 11
# asm 1: rol  $11,<x0a=int32#1
# asm 2: rol  $11,<x0a=%eax
rol  $11,%eax

# qhasm: x10_stack = x10
# asm 1: movl <x10=int32#2,>x10_stack=stack32#12
# asm 2: movl <x10=%ecx,>x10_stack=44(%esp)
movl %ecx,44(%esp)

# qhasm: x14 += x0e
# asm 1: addl <x0e=int32#6,<x14=int32#7
# asm 2: addl <x0e=%edi,<x14=%ebp
addl %edi,%ebp

# qhasm: x0e <<<= 11
# asm 1: rol  $11,<x0e=int32#6
# asm 2: rol  $11,<x0e=%edi
rol  $11,%edi

# qhasm: x14_stack = x14
# asm 1: movl <x14=int32#7,>x14_stack=stack32#16
# asm 2: movl <x14=%ebp,>x14_stack=60(%esp)
movl %ebp,60(%esp)

# qhasm: x0a ^= x14
# asm 1: xorl <x14=int32#7,<x0a=int32#1
# asm 2: xorl <x14=%ebp,<x0a=%eax
xorl %ebp,%eax

# qhasm: x0a_stack = x0a
# asm 1: movl <x0a=int32#1,>x0a_stack=stack32#26
# asm 2: movl <x0a=%eax,>x0a_stack=100(%esp)
movl %eax,100(%esp)

# qhasm: x0e ^= x10
# asm 1: xorl <x10=int32#2,<x0e=int32#6
# asm 2: xorl <x10=%ecx,<x0e=%edi
xorl %ecx,%edi

# qhasm: x0e_stack = x0e
# asm 1: movl <x0e=int32#6,>x0e_stack=stack32#30
# asm 2: movl <x0e=%edi,>x0e_stack=116(%esp)
movl %edi,116(%esp)

# qhasm: x02 = x02_stack
# asm 1: movd <x02_stack=int3232#3,>x02=int32#1
# asm 2: movd <x02_stack=%mm2,>x02=%eax
movd %mm2,%eax

# qhasm: x18 = x18_stack
# asm 1: movl <x18_stack=stack32#24,>x18=int32#2
# asm 2: movl <x18_stack=92(%esp),>x18=%ecx
movl 92(%esp),%ecx

# qhasm: x06 = x06_stack
# asm 1: movd <x06_stack=int3232#7,>x06=int32#6
# asm 2: movd <x06_stack=%mm6,>x06=%edi
movd %mm6,%edi

# qhasm: x1c = x1c_stack
# asm 1: movl <x1c_stack=stack32#20,>x1c=int32#7
# asm 2: movl <x1c_stack=76(%esp),>x1c=%ebp
movl 76(%esp),%ebp

# qhasm: x18 += x02
# asm 1: addl <x02=int32#1,<x18=int32#2
# asm 2: addl <x02=%eax,<x18=%ecx
addl %eax,%ecx

# qhasm: x02 <<<= 11
# asm 1: rol  $11,<x02=int32#1
# asm 2: rol  $11,<x02=%eax
rol  $11,%eax

# qhasm: x18_stack = x18
# asm 1: movl <x18=int32#2,>x18_stack=stack32#20
# asm 2: movl <x18=%ecx,>x18_stack=76(%esp)
movl %ecx,76(%esp)

# qhasm: x1c += x06
# asm 1: addl <x06=int32#6,<x1c=int32#7
# asm 2: addl <x06=%edi,<x1c=%ebp
addl %edi,%ebp

# qhasm: x06 <<<= 11
# asm 1: rol  $11,<x06=int32#6
# asm 2: rol  $11,<x06=%edi
rol  $11,%edi

# qhasm: x1c_stack = x1c
# asm 1: movl <x1c=int32#7,>x1c_stack=stack32#24
# asm 2: movl <x1c=%ebp,>x1c_stack=92(%esp)
movl %ebp,92(%esp)

# qhasm: x02 ^= x1c
# asm 1: xorl <x1c=int32#7,<x02=int32#1
# asm 2: xorl <x1c=%ebp,<x02=%eax
xorl %ebp,%eax

# qhasm: x02_stack = x02
# asm 1: movd <x02=int32#1,>x02_stack=int3232#3
# asm 2: movd <x02=%eax,>x02_stack=%mm2
movd %eax,%mm2

# qhasm: x06 ^= x18
# asm 1: xorl <x18=int32#2,<x06=int32#6
# asm 2: xorl <x18=%ecx,<x06=%edi
xorl %ecx,%edi

# qhasm: x06_stack = x06
# asm 1: movd <x06=int32#6,>x06_stack=int3232#7
# asm 2: movd <x06=%edi,>x06_stack=%mm6
movd %edi,%mm6

# qhasm: x08 = x08_stack
# asm 1: movd <x08_stack=int3232#1,>x08=int32#1
# asm 2: movd <x08_stack=%mm0,>x08=%eax
movd %mm0,%eax

# qhasm: x12 = x12_stack
# asm 1: movl <x12_stack=stack32#10,>x12=int32#2
# asm 2: movl <x12_stack=36(%esp),>x12=%ecx
movl 36(%esp),%ecx

# qhasm: x0c = x0c_stack
# asm 1: movl <x0c_stack=stack32#28,>x0c=int32#6
# asm 2: movl <x0c_stack=108(%esp),>x0c=%edi
movl 108(%esp),%edi

# qhasm: x16 = x16_stack
# asm 1: movl <x16_stack=stack32#14,>x16=int32#7
# asm 2: movl <x16_stack=52(%esp),>x16=%ebp
movl 52(%esp),%ebp

# qhasm: x12 += x08
# asm 1: addl <x08=int32#1,<x12=int32#2
# asm 2: addl <x08=%eax,<x12=%ecx
addl %eax,%ecx

# qhasm: x08 <<<= 11
# asm 1: rol  $11,<x08=int32#1
# asm 2: rol  $11,<x08=%eax
rol  $11,%eax

# qhasm: x12_stack = x12
# asm 1: movl <x12=int32#2,>x12_stack=stack32#10
# asm 2: movl <x12=%ecx,>x12_stack=36(%esp)
movl %ecx,36(%esp)

# qhasm: x16 += x0c
# asm 1: addl <x0c=int32#6,<x16=int32#7
# asm 2: addl <x0c=%edi,<x16=%ebp
addl %edi,%ebp

# qhasm: x0c <<<= 11
# asm 1: rol  $11,<x0c=int32#6
# asm 2: rol  $11,<x0c=%edi
rol  $11,%edi

# qhasm: x16_stack = x16
# asm 1: movl <x16=int32#7,>x16_stack=stack32#14
# asm 2: movl <x16=%ebp,>x16_stack=52(%esp)
movl %ebp,52(%esp)

# qhasm: x08 ^= x16
# asm 1: xorl <x16=int32#7,<x08=int32#1
# asm 2: xorl <x16=%ebp,<x08=%eax
xorl %ebp,%eax

# qhasm: x08_stack = x08
# asm 1: movd <x08=int32#1,>x08_stack=int3232#1
# asm 2: movd <x08=%eax,>x08_stack=%mm0
movd %eax,%mm0

# qhasm: x0c ^= x12
# asm 1: xorl <x12=int32#2,<x0c=int32#6
# asm 2: xorl <x12=%ecx,<x0c=%edi
xorl %ecx,%edi

# qhasm: x0c_stack = x0c
# asm 1: movl <x0c=int32#6,>x0c_stack=stack32#28
# asm 2: movl <x0c=%edi,>x0c_stack=108(%esp)
movl %edi,108(%esp)

# qhasm: x1a = x1a_stack
# asm 1: movl <x1a_stack=stack32#18,>x1a=int32#1
# asm 2: movl <x1a_stack=68(%esp),>x1a=%eax
movl 68(%esp),%eax

# qhasm: x04 = x04_stack
# asm 1: movd <x04_stack=int3232#5,>x04=int32#2
# asm 2: movd <x04_stack=%mm4,>x04=%ecx
movd %mm4,%ecx

# qhasm: x1e = x1e_stack
# asm 1: movl <x1e_stack=stack32#22,>x1e=int32#6
# asm 2: movl <x1e_stack=84(%esp),>x1e=%edi
movl 84(%esp),%edi

# qhasm: x1a += x00
# asm 1: addl <x00=int32#3,<x1a=int32#1
# asm 2: addl <x00=%edx,<x1a=%eax
addl %edx,%eax

# qhasm: x00 <<<= 11
# asm 1: rol  $11,<x00=int32#3
# asm 2: rol  $11,<x00=%edx
rol  $11,%edx

# qhasm: x1a_stack = x1a
# asm 1: movl <x1a=int32#1,>x1a_stack=stack32#18
# asm 2: movl <x1a=%eax,>x1a_stack=68(%esp)
movl %eax,68(%esp)

# qhasm: x1e += x04
# asm 1: addl <x04=int32#2,<x1e=int32#6
# asm 2: addl <x04=%ecx,<x1e=%edi
addl %ecx,%edi

# qhasm: x04 <<<= 11
# asm 1: rol  $11,<x04=int32#2
# asm 2: rol  $11,<x04=%ecx
rol  $11,%ecx

# qhasm: x1e_stack = x1e
# asm 1: movl <x1e=int32#6,>x1e_stack=stack32#22
# asm 2: movl <x1e=%edi,>x1e_stack=84(%esp)
movl %edi,84(%esp)

# qhasm: x00 ^= x1e
# asm 1: xorl <x1e=int32#6,<x00=int32#3
# asm 2: xorl <x1e=%edi,<x00=%edx
xorl %edi,%edx

# qhasm: x04 ^= x1a
# asm 1: xorl <x1a=int32#1,<x04=int32#2
# asm 2: xorl <x1a=%eax,<x04=%ecx
xorl %eax,%ecx

# qhasm: x04_stack = x04
# asm 1: movd <x04=int32#2,>x04_stack=int3232#5
# asm 2: movd <x04=%ecx,>x04_stack=%mm4
movd %ecx,%mm4

# qhasm: x1f = x1f_stack
# asm 1: movl <x1f_stack=stack32#23,>x1f=int32#1
# asm 2: movl <x1f_stack=88(%esp),>x1f=%eax
movl 88(%esp),%eax

# qhasm: x08 = x08_stack
# asm 1: movd <x08_stack=int3232#1,>x08=int32#2
# asm 2: movd <x08_stack=%mm0,>x08=%ecx
movd %mm0,%ecx

# qhasm: x17 = x17_stack
# asm 1: movl <x17_stack=stack32#15,>x17=int32#6
# asm 2: movl <x17_stack=56(%esp),>x17=%edi
movl 56(%esp),%edi

# qhasm: x1f += x00
# asm 1: addl <x00=int32#3,<x1f=int32#1
# asm 2: addl <x00=%edx,<x1f=%eax
addl %edx,%eax

# qhasm: x00 <<<= 7
# asm 1: rol  $7,<x00=int32#3
# asm 2: rol  $7,<x00=%edx
rol  $7,%edx

# qhasm: x1f_stack = x1f
# asm 1: movl <x1f=int32#1,>x1f_stack=stack32#34
# asm 2: movl <x1f=%eax,>x1f_stack=132(%esp)
movl %eax,132(%esp)

# qhasm: x17 += x08
# asm 1: addl <x08=int32#2,<x17=int32#6
# asm 2: addl <x08=%ecx,<x17=%edi
addl %ecx,%edi

# qhasm: x08 <<<= 7
# asm 1: rol  $7,<x08=int32#2
# asm 2: rol  $7,<x08=%ecx
rol  $7,%ecx

# qhasm: x17_stack = x17
# asm 1: movl <x17=int32#6,>x17_stack=stack32#23
# asm 2: movl <x17=%edi,>x17_stack=88(%esp)
movl %edi,88(%esp)

# qhasm: x00 ^= x17
# asm 1: xorl <x17=int32#6,<x00=int32#3
# asm 2: xorl <x17=%edi,<x00=%edx
xorl %edi,%edx

# qhasm: x08 ^= x1f
# asm 1: xorl <x1f=int32#1,<x08=int32#2
# asm 2: xorl <x1f=%eax,<x08=%ecx
xorl %eax,%ecx

# qhasm: x08_stack = x08
# asm 1: movd <x08=int32#2,>x08_stack=int3232#1
# asm 2: movd <x08=%ecx,>x08_stack=%mm0
movd %ecx,%mm0

# qhasm: x04 = x04_stack
# asm 1: movd <x04_stack=int3232#5,>x04=int32#1
# asm 2: movd <x04_stack=%mm4,>x04=%eax
movd %mm4,%eax

# qhasm: x1b = x1b_stack
# asm 1: movl <x1b_stack=stack32#19,>x1b=int32#2
# asm 2: movl <x1b_stack=72(%esp),>x1b=%ecx
movl 72(%esp),%ecx

# qhasm: x0c = x0c_stack
# asm 1: movl <x0c_stack=stack32#28,>x0c=int32#6
# asm 2: movl <x0c_stack=108(%esp),>x0c=%edi
movl 108(%esp),%edi

# qhasm: x13 = x13_stack
# asm 1: movl <x13_stack=stack32#11,>x13=int32#7
# asm 2: movl <x13_stack=40(%esp),>x13=%ebp
movl 40(%esp),%ebp

# qhasm: x1b += x04
# asm 1: addl <x04=int32#1,<x1b=int32#2
# asm 2: addl <x04=%eax,<x1b=%ecx
addl %eax,%ecx

# qhasm: x04 <<<= 7
# asm 1: rol  $7,<x04=int32#1
# asm 2: rol  $7,<x04=%eax
rol  $7,%eax

# qhasm: x1b_stack = x1b
# asm 1: movl <x1b=int32#2,>x1b_stack=stack32#35
# asm 2: movl <x1b=%ecx,>x1b_stack=136(%esp)
movl %ecx,136(%esp)

# qhasm: x13 += x0c
# asm 1: addl <x0c=int32#6,<x13=int32#7
# asm 2: addl <x0c=%edi,<x13=%ebp
addl %edi,%ebp

# qhasm: x0c <<<= 7
# asm 1: rol  $7,<x0c=int32#6
# asm 2: rol  $7,<x0c=%edi
rol  $7,%edi

# qhasm: x13_stack = x13
# asm 1: movl <x13=int32#7,>x13_stack=stack32#19
# asm 2: movl <x13=%ebp,>x13_stack=72(%esp)
movl %ebp,72(%esp)

# qhasm: x04 ^= x13
# asm 1: xorl <x13=int32#7,<x04=int32#1
# asm 2: xorl <x13=%ebp,<x04=%eax
xorl %ebp,%eax

# qhasm: x04_stack = x04
# asm 1: movd <x04=int32#1,>x04_stack=int3232#5
# asm 2: movd <x04=%eax,>x04_stack=%mm4
movd %eax,%mm4

# qhasm: x0c ^= x1b
# asm 1: xorl <x1b=int32#2,<x0c=int32#6
# asm 2: xorl <x1b=%ecx,<x0c=%edi
xorl %ecx,%edi

# qhasm: x0c_stack = x0c
# asm 1: movl <x0c=int32#6,>x0c_stack=stack32#36
# asm 2: movl <x0c=%edi,>x0c_stack=140(%esp)
movl %edi,140(%esp)

# qhasm: x02 = x02_stack
# asm 1: movd <x02_stack=int3232#3,>x02=int32#1
# asm 2: movd <x02_stack=%mm2,>x02=%eax
movd %mm2,%eax

# qhasm: x1d = x1d_stack
# asm 1: movl <x1d_stack=stack32#25,>x1d=int32#2
# asm 2: movl <x1d_stack=96(%esp),>x1d=%ecx
movl 96(%esp),%ecx

# qhasm: x0a = x0a_stack
# asm 1: movl <x0a_stack=stack32#26,>x0a=int32#6
# asm 2: movl <x0a_stack=100(%esp),>x0a=%edi
movl 100(%esp),%edi

# qhasm: x15 = x15_stack
# asm 1: movl <x15_stack=stack32#17,>x15=int32#7
# asm 2: movl <x15_stack=64(%esp),>x15=%ebp
movl 64(%esp),%ebp

# qhasm: x1d += x02
# asm 1: addl <x02=int32#1,<x1d=int32#2
# asm 2: addl <x02=%eax,<x1d=%ecx
addl %eax,%ecx

# qhasm: x02 <<<= 7
# asm 1: rol  $7,<x02=int32#1
# asm 2: rol  $7,<x02=%eax
rol  $7,%eax

# qhasm: x1d_stack = x1d
# asm 1: movl <x1d=int32#2,>x1d_stack=stack32#25
# asm 2: movl <x1d=%ecx,>x1d_stack=96(%esp)
movl %ecx,96(%esp)

# qhasm: x15 += x0a
# asm 1: addl <x0a=int32#6,<x15=int32#7
# asm 2: addl <x0a=%edi,<x15=%ebp
addl %edi,%ebp

# qhasm: x0a <<<= 7
# asm 1: rol  $7,<x0a=int32#6
# asm 2: rol  $7,<x0a=%edi
rol  $7,%edi

# qhasm: x15_stack = x15
# asm 1: movl <x15=int32#7,>x15_stack=stack32#17
# asm 2: movl <x15=%ebp,>x15_stack=64(%esp)
movl %ebp,64(%esp)

# qhasm: x02 ^= x15
# asm 1: xorl <x15=int32#7,<x02=int32#1
# asm 2: xorl <x15=%ebp,<x02=%eax
xorl %ebp,%eax

# qhasm: x02_stack = x02
# asm 1: movd <x02=int32#1,>x02_stack=int3232#3
# asm 2: movd <x02=%eax,>x02_stack=%mm2
movd %eax,%mm2

# qhasm: x0a ^= x1d
# asm 1: xorl <x1d=int32#2,<x0a=int32#6
# asm 2: xorl <x1d=%ecx,<x0a=%edi
xorl %ecx,%edi

# qhasm: x0a_stack = x0a
# asm 1: movl <x0a=int32#6,>x0a_stack=stack32#37
# asm 2: movl <x0a=%edi,>x0a_stack=144(%esp)
movl %edi,144(%esp)

# qhasm: x06 = x06_stack
# asm 1: movd <x06_stack=int3232#7,>x06=int32#1
# asm 2: movd <x06_stack=%mm6,>x06=%eax
movd %mm6,%eax

# qhasm: x19 = x19_stack
# asm 1: movl <x19_stack=stack32#21,>x19=int32#2
# asm 2: movl <x19_stack=80(%esp),>x19=%ecx
movl 80(%esp),%ecx

# qhasm: x0e = x0e_stack
# asm 1: movl <x0e_stack=stack32#30,>x0e=int32#6
# asm 2: movl <x0e_stack=116(%esp),>x0e=%edi
movl 116(%esp),%edi

# qhasm: x11 = x11_stack
# asm 1: movl <x11_stack=stack32#13,>x11=int32#7
# asm 2: movl <x11_stack=48(%esp),>x11=%ebp
movl 48(%esp),%ebp

# qhasm: x19 += x06
# asm 1: addl <x06=int32#1,<x19=int32#2
# asm 2: addl <x06=%eax,<x19=%ecx
addl %eax,%ecx

# qhasm: x06 <<<= 7
# asm 1: rol  $7,<x06=int32#1
# asm 2: rol  $7,<x06=%eax
rol  $7,%eax

# qhasm: x19_stack = x19
# asm 1: movl <x19=int32#2,>x19_stack=stack32#38
# asm 2: movl <x19=%ecx,>x19_stack=148(%esp)
movl %ecx,148(%esp)

# qhasm: x11 += x0e
# asm 1: addl <x0e=int32#6,<x11=int32#7
# asm 2: addl <x0e=%edi,<x11=%ebp
addl %edi,%ebp

# qhasm: x0e <<<= 7
# asm 1: rol  $7,<x0e=int32#6
# asm 2: rol  $7,<x0e=%edi
rol  $7,%edi

# qhasm: x11_stack = x11
# asm 1: movl <x11=int32#7,>x11_stack=stack32#21
# asm 2: movl <x11=%ebp,>x11_stack=80(%esp)
movl %ebp,80(%esp)

# qhasm: x06 ^= x11
# asm 1: xorl <x11=int32#7,<x06=int32#1
# asm 2: xorl <x11=%ebp,<x06=%eax
xorl %ebp,%eax

# qhasm: x06_stack = x06
# asm 1: movd <x06=int32#1,>x06_stack=int3232#7
# asm 2: movd <x06=%eax,>x06_stack=%mm6
movd %eax,%mm6

# qhasm: x0e ^= x19
# asm 1: xorl <x19=int32#2,<x0e=int32#6
# asm 2: xorl <x19=%ecx,<x0e=%edi
xorl %ecx,%edi

# qhasm: x0e_stack = x0e
# asm 1: movl <x0e=int32#6,>x0e_stack=stack32#39
# asm 2: movl <x0e=%edi,>x0e_stack=152(%esp)
movl %edi,152(%esp)

# qhasm: x1e = x1e_stack
# asm 1: movl <x1e_stack=stack32#22,>x1e=int32#1
# asm 2: movl <x1e_stack=84(%esp),>x1e=%eax
movl 84(%esp),%eax

# qhasm: x09 = x09_stack
# asm 1: movd <x09_stack=int3232#2,>x09=int32#2
# asm 2: movd <x09_stack=%mm1,>x09=%ecx
movd %mm1,%ecx

# qhasm: x16 = x16_stack
# asm 1: movl <x16_stack=stack32#14,>x16=int32#6
# asm 2: movl <x16_stack=52(%esp),>x16=%edi
movl 52(%esp),%edi

# qhasm: x1e += x01
# asm 1: addl <x01=int32#4,<x1e=int32#1
# asm 2: addl <x01=%ebx,<x1e=%eax
addl %ebx,%eax

# qhasm: x01 <<<= 7
# asm 1: rol  $7,<x01=int32#4
# asm 2: rol  $7,<x01=%ebx
rol  $7,%ebx

# qhasm: x1e_stack = x1e
# asm 1: movl <x1e=int32#1,>x1e_stack=stack32#11
# asm 2: movl <x1e=%eax,>x1e_stack=40(%esp)
movl %eax,40(%esp)

# qhasm: x16 += x09
# asm 1: addl <x09=int32#2,<x16=int32#6
# asm 2: addl <x09=%ecx,<x16=%edi
addl %ecx,%edi

# qhasm: x09 <<<= 7
# asm 1: rol  $7,<x09=int32#2
# asm 2: rol  $7,<x09=%ecx
rol  $7,%ecx

# qhasm: x16_stack = x16
# asm 1: movl <x16=int32#6,>x16_stack=stack32#13
# asm 2: movl <x16=%edi,>x16_stack=48(%esp)
movl %edi,48(%esp)

# qhasm: x01 ^= x16
# asm 1: xorl <x16=int32#6,<x01=int32#4
# asm 2: xorl <x16=%edi,<x01=%ebx
xorl %edi,%ebx

# qhasm: x09 ^= x1e
# asm 1: xorl <x1e=int32#1,<x09=int32#2
# asm 2: xorl <x1e=%eax,<x09=%ecx
xorl %eax,%ecx

# qhasm: x09_stack = x09
# asm 1: movd <x09=int32#2,>x09_stack=int3232#2
# asm 2: movd <x09=%ecx,>x09_stack=%mm1
movd %ecx,%mm1

# qhasm: x05 = x05_stack
# asm 1: movd <x05_stack=int3232#6,>x05=int32#1
# asm 2: movd <x05_stack=%mm5,>x05=%eax
movd %mm5,%eax

# qhasm: x1a = x1a_stack
# asm 1: movl <x1a_stack=stack32#18,>x1a=int32#2
# asm 2: movl <x1a_stack=68(%esp),>x1a=%ecx
movl 68(%esp),%ecx

# qhasm: x0d = x0d_stack
# asm 1: movl <x0d_stack=stack32#29,>x0d=int32#6
# asm 2: movl <x0d_stack=112(%esp),>x0d=%edi
movl 112(%esp),%edi

# qhasm: x12 = x12_stack
# asm 1: movl <x12_stack=stack32#10,>x12=int32#7
# asm 2: movl <x12_stack=36(%esp),>x12=%ebp
movl 36(%esp),%ebp

# qhasm: x1a += x05
# asm 1: addl <x05=int32#1,<x1a=int32#2
# asm 2: addl <x05=%eax,<x1a=%ecx
addl %eax,%ecx

# qhasm: x05 <<<= 7
# asm 1: rol  $7,<x05=int32#1
# asm 2: rol  $7,<x05=%eax
rol  $7,%eax

# qhasm: x1a_stack = x1a
# asm 1: movl <x1a=int32#2,>x1a_stack=stack32#10
# asm 2: movl <x1a=%ecx,>x1a_stack=36(%esp)
movl %ecx,36(%esp)

# qhasm: x12 += x0d
# asm 1: addl <x0d=int32#6,<x12=int32#7
# asm 2: addl <x0d=%edi,<x12=%ebp
addl %edi,%ebp

# qhasm: x0d <<<= 7
# asm 1: rol  $7,<x0d=int32#6
# asm 2: rol  $7,<x0d=%edi
rol  $7,%edi

# qhasm: x12_stack = x12
# asm 1: movl <x12=int32#7,>x12_stack=stack32#14
# asm 2: movl <x12=%ebp,>x12_stack=52(%esp)
movl %ebp,52(%esp)

# qhasm: x05 ^= x12
# asm 1: xorl <x12=int32#7,<x05=int32#1
# asm 2: xorl <x12=%ebp,<x05=%eax
xorl %ebp,%eax

# qhasm: x05_stack = x05
# asm 1: movd <x05=int32#1,>x05_stack=int3232#6
# asm 2: movd <x05=%eax,>x05_stack=%mm5
movd %eax,%mm5

# qhasm: x0d ^= x1a
# asm 1: xorl <x1a=int32#2,<x0d=int32#6
# asm 2: xorl <x1a=%ecx,<x0d=%edi
xorl %ecx,%edi

# qhasm: x0d_stack = x0d
# asm 1: movl <x0d=int32#6,>x0d_stack=stack32#28
# asm 2: movl <x0d=%edi,>x0d_stack=108(%esp)
movl %edi,108(%esp)

# qhasm: x03 = x03_stack
# asm 1: movd <x03_stack=int3232#4,>x03=int32#1
# asm 2: movd <x03_stack=%mm3,>x03=%eax
movd %mm3,%eax

# qhasm: x1c = x1c_stack
# asm 1: movl <x1c_stack=stack32#24,>x1c=int32#2
# asm 2: movl <x1c_stack=92(%esp),>x1c=%ecx
movl 92(%esp),%ecx

# qhasm: x0b = x0b_stack
# asm 1: movl <x0b_stack=stack32#27,>x0b=int32#6
# asm 2: movl <x0b_stack=104(%esp),>x0b=%edi
movl 104(%esp),%edi

# qhasm: x14 = x14_stack
# asm 1: movl <x14_stack=stack32#16,>x14=int32#7
# asm 2: movl <x14_stack=60(%esp),>x14=%ebp
movl 60(%esp),%ebp

# qhasm: x1c += x03
# asm 1: addl <x03=int32#1,<x1c=int32#2
# asm 2: addl <x03=%eax,<x1c=%ecx
addl %eax,%ecx

# qhasm: x03 <<<= 7
# asm 1: rol  $7,<x03=int32#1
# asm 2: rol  $7,<x03=%eax
rol  $7,%eax

# qhasm: x1c_stack = x1c
# asm 1: movl <x1c=int32#2,>x1c_stack=stack32#24
# asm 2: movl <x1c=%ecx,>x1c_stack=92(%esp)
movl %ecx,92(%esp)

# qhasm: x14 += x0b
# asm 1: addl <x0b=int32#6,<x14=int32#7
# asm 2: addl <x0b=%edi,<x14=%ebp
addl %edi,%ebp

# qhasm: x0b <<<= 7
# asm 1: rol  $7,<x0b=int32#6
# asm 2: rol  $7,<x0b=%edi
rol  $7,%edi

# qhasm: x14_stack = x14
# asm 1: movl <x14=int32#7,>x14_stack=stack32#16
# asm 2: movl <x14=%ebp,>x14_stack=60(%esp)
movl %ebp,60(%esp)

# qhasm: x03 ^= x14
# asm 1: xorl <x14=int32#7,<x03=int32#1
# asm 2: xorl <x14=%ebp,<x03=%eax
xorl %ebp,%eax

# qhasm: x03_stack = x03
# asm 1: movd <x03=int32#1,>x03_stack=int3232#4
# asm 2: movd <x03=%eax,>x03_stack=%mm3
movd %eax,%mm3

# qhasm: x0b ^= x1c
# asm 1: xorl <x1c=int32#2,<x0b=int32#6
# asm 2: xorl <x1c=%ecx,<x0b=%edi
xorl %ecx,%edi

# qhasm: x0b_stack = x0b
# asm 1: movl <x0b=int32#6,>x0b_stack=stack32#15
# asm 2: movl <x0b=%edi,>x0b_stack=56(%esp)
movl %edi,56(%esp)

# qhasm: x07 = x07_stack
# asm 1: movd <x07_stack=int3232#8,>x07=int32#1
# asm 2: movd <x07_stack=%mm7,>x07=%eax
movd %mm7,%eax

# qhasm: x18 = x18_stack
# asm 1: movl <x18_stack=stack32#20,>x18=int32#2
# asm 2: movl <x18_stack=76(%esp),>x18=%ecx
movl 76(%esp),%ecx

# qhasm: x0f = x0f_stack
# asm 1: movl <x0f_stack=stack32#31,>x0f=int32#6
# asm 2: movl <x0f_stack=120(%esp),>x0f=%edi
movl 120(%esp),%edi

# qhasm: x10 = x10_stack
# asm 1: movl <x10_stack=stack32#12,>x10=int32#7
# asm 2: movl <x10_stack=44(%esp),>x10=%ebp
movl 44(%esp),%ebp

# qhasm: x18 += x07
# asm 1: addl <x07=int32#1,<x18=int32#2
# asm 2: addl <x07=%eax,<x18=%ecx
addl %eax,%ecx

# qhasm: x07 <<<= 7
# asm 1: rol  $7,<x07=int32#1
# asm 2: rol  $7,<x07=%eax
rol  $7,%eax

# qhasm: x18_stack = x18
# asm 1: movl <x18=int32#2,>x18_stack=stack32#12
# asm 2: movl <x18=%ecx,>x18_stack=44(%esp)
movl %ecx,44(%esp)

# qhasm: x10 += x0f
# asm 1: addl <x0f=int32#6,<x10=int32#7
# asm 2: addl <x0f=%edi,<x10=%ebp
addl %edi,%ebp

# qhasm: x0f <<<= 7
# asm 1: rol  $7,<x0f=int32#6
# asm 2: rol  $7,<x0f=%edi
rol  $7,%edi

# qhasm: x10_stack = x10
# asm 1: movl <x10=int32#7,>x10_stack=stack32#20
# asm 2: movl <x10=%ebp,>x10_stack=76(%esp)
movl %ebp,76(%esp)

# qhasm: x07 ^= x10
# asm 1: xorl <x10=int32#7,<x07=int32#1
# asm 2: xorl <x10=%ebp,<x07=%eax
xorl %ebp,%eax

# qhasm: x0f ^= x18
# asm 1: xorl <x18=int32#2,<x0f=int32#6
# asm 2: xorl <x18=%ecx,<x0f=%edi
xorl %ecx,%edi

# qhasm: x0f_stack = x0f
# asm 1: movl <x0f=int32#6,>x0f_stack=stack32#26
# asm 2: movl <x0f=%edi,>x0f_stack=100(%esp)
movl %edi,100(%esp)

# qhasm: x03 = x03_stack
# asm 1: movd <x03_stack=int3232#4,>x03=int32#2
# asm 2: movd <x03_stack=%mm3,>x03=%ecx
movd %mm3,%ecx

# qhasm: x16 = x16_stack
# asm 1: movl <x16_stack=stack32#13,>x16=int32#6
# asm 2: movl <x16_stack=48(%esp),>x16=%edi
movl 48(%esp),%edi

# qhasm: x12 = x12_stack
# asm 1: movl <x12_stack=stack32#14,>x12=int32#7
# asm 2: movl <x12_stack=52(%esp),>x12=%ebp
movl 52(%esp),%ebp

# qhasm: x16 += x03
# asm 1: addl <x03=int32#2,<x16=int32#6
# asm 2: addl <x03=%ecx,<x16=%edi
addl %ecx,%edi

# qhasm: x03 <<<= 11
# asm 1: rol  $11,<x03=int32#2
# asm 2: rol  $11,<x03=%ecx
rol  $11,%ecx

# qhasm: x16_stack = x16
# asm 1: movl <x16=int32#6,>x16_stack=stack32#22
# asm 2: movl <x16=%edi,>x16_stack=84(%esp)
movl %edi,84(%esp)

# qhasm: x12 += x07
# asm 1: addl <x07=int32#1,<x12=int32#7
# asm 2: addl <x07=%eax,<x12=%ebp
addl %eax,%ebp

# qhasm: x07 <<<= 11
# asm 1: rol  $11,<x07=int32#1
# asm 2: rol  $11,<x07=%eax
rol  $11,%eax

# qhasm: x12_stack = x12
# asm 1: movl <x12=int32#7,>x12_stack=stack32#18
# asm 2: movl <x12=%ebp,>x12_stack=68(%esp)
movl %ebp,68(%esp)

# qhasm: x03 ^= x12
# asm 1: xorl <x12=int32#7,<x03=int32#2
# asm 2: xorl <x12=%ebp,<x03=%ecx
xorl %ebp,%ecx

# qhasm: x03_stack = x03
# asm 1: movd <x03=int32#2,>x03_stack=int3232#4
# asm 2: movd <x03=%ecx,>x03_stack=%mm3
movd %ecx,%mm3

# qhasm: x07 ^= x16
# asm 1: xorl <x16=int32#6,<x07=int32#1
# asm 2: xorl <x16=%edi,<x07=%eax
xorl %edi,%eax

# qhasm: x07_stack = x07
# asm 1: movd <x07=int32#1,>x07_stack=int3232#8
# asm 2: movd <x07=%eax,>x07_stack=%mm7
movd %eax,%mm7

# qhasm: x0b = x0b_stack
# asm 1: movl <x0b_stack=stack32#15,>x0b=int32#1
# asm 2: movl <x0b_stack=56(%esp),>x0b=%eax
movl 56(%esp),%eax

# qhasm: x1e = x1e_stack
# asm 1: movl <x1e_stack=stack32#11,>x1e=int32#2
# asm 2: movl <x1e_stack=40(%esp),>x1e=%ecx
movl 40(%esp),%ecx

# qhasm: x0f = x0f_stack
# asm 1: movl <x0f_stack=stack32#26,>x0f=int32#6
# asm 2: movl <x0f_stack=100(%esp),>x0f=%edi
movl 100(%esp),%edi

# qhasm: x1a = x1a_stack
# asm 1: movl <x1a_stack=stack32#10,>x1a=int32#7
# asm 2: movl <x1a_stack=36(%esp),>x1a=%ebp
movl 36(%esp),%ebp

# qhasm: x1e += x0b
# asm 1: addl <x0b=int32#1,<x1e=int32#2
# asm 2: addl <x0b=%eax,<x1e=%ecx
addl %eax,%ecx

# qhasm: x0b <<<= 11
# asm 1: rol  $11,<x0b=int32#1
# asm 2: rol  $11,<x0b=%eax
rol  $11,%eax

# qhasm: x1e_stack = x1e
# asm 1: movl <x1e=int32#2,>x1e_stack=stack32#30
# asm 2: movl <x1e=%ecx,>x1e_stack=116(%esp)
movl %ecx,116(%esp)

# qhasm: x1a += x0f
# asm 1: addl <x0f=int32#6,<x1a=int32#7
# asm 2: addl <x0f=%edi,<x1a=%ebp
addl %edi,%ebp

# qhasm: x0f <<<= 11
# asm 1: rol  $11,<x0f=int32#6
# asm 2: rol  $11,<x0f=%edi
rol  $11,%edi

# qhasm: x1a_stack = x1a
# asm 1: movl <x1a=int32#7,>x1a_stack=stack32#26
# asm 2: movl <x1a=%ebp,>x1a_stack=100(%esp)
movl %ebp,100(%esp)

# qhasm: x0b ^= x1a
# asm 1: xorl <x1a=int32#7,<x0b=int32#1
# asm 2: xorl <x1a=%ebp,<x0b=%eax
xorl %ebp,%eax

# qhasm: x0b_stack = x0b
# asm 1: movl <x0b=int32#1,>x0b_stack=stack32#11
# asm 2: movl <x0b=%eax,>x0b_stack=40(%esp)
movl %eax,40(%esp)

# qhasm: x0f ^= x1e
# asm 1: xorl <x1e=int32#2,<x0f=int32#6
# asm 2: xorl <x1e=%ecx,<x0f=%edi
xorl %ecx,%edi

# qhasm: x0f_stack = x0f
# asm 1: movl <x0f=int32#6,>x0f_stack=stack32#15
# asm 2: movl <x0f=%edi,>x0f_stack=56(%esp)
movl %edi,56(%esp)

# qhasm: x14 = x14_stack
# asm 1: movl <x14_stack=stack32#16,>x14=int32#1
# asm 2: movl <x14_stack=60(%esp),>x14=%eax
movl 60(%esp),%eax

# qhasm: x05 = x05_stack
# asm 1: movd <x05_stack=int3232#6,>x05=int32#2
# asm 2: movd <x05_stack=%mm5,>x05=%ecx
movd %mm5,%ecx

# qhasm: x10 = x10_stack
# asm 1: movl <x10_stack=stack32#20,>x10=int32#6
# asm 2: movl <x10_stack=76(%esp),>x10=%edi
movl 76(%esp),%edi

# qhasm: x14 += x01
# asm 1: addl <x01=int32#4,<x14=int32#1
# asm 2: addl <x01=%ebx,<x14=%eax
addl %ebx,%eax

# qhasm: x01 <<<= 11
# asm 1: rol  $11,<x01=int32#4
# asm 2: rol  $11,<x01=%ebx
rol  $11,%ebx

# qhasm: x14_stack = x14
# asm 1: movl <x14=int32#1,>x14_stack=stack32#20
# asm 2: movl <x14=%eax,>x14_stack=76(%esp)
movl %eax,76(%esp)

# qhasm: x10 += x05
# asm 1: addl <x05=int32#2,<x10=int32#6
# asm 2: addl <x05=%ecx,<x10=%edi
addl %ecx,%edi

# qhasm: x05 <<<= 11
# asm 1: rol  $11,<x05=int32#2
# asm 2: rol  $11,<x05=%ecx
rol  $11,%ecx

# qhasm: x10_stack = x10
# asm 1: movl <x10=int32#6,>x10_stack=stack32#16
# asm 2: movl <x10=%edi,>x10_stack=60(%esp)
movl %edi,60(%esp)

# qhasm: x01 ^= x10
# asm 1: xorl <x10=int32#6,<x01=int32#4
# asm 2: xorl <x10=%edi,<x01=%ebx
xorl %edi,%ebx

# qhasm: x05 ^= x14
# asm 1: xorl <x14=int32#1,<x05=int32#2
# asm 2: xorl <x14=%eax,<x05=%ecx
xorl %eax,%ecx

# qhasm: x05_stack = x05
# asm 1: movd <x05=int32#2,>x05_stack=int3232#6
# asm 2: movd <x05=%ecx,>x05_stack=%mm5
movd %ecx,%mm5

# qhasm: x09 = x09_stack
# asm 1: movd <x09_stack=int3232#2,>x09=int32#1
# asm 2: movd <x09_stack=%mm1,>x09=%eax
movd %mm1,%eax

# qhasm: x1c = x1c_stack
# asm 1: movl <x1c_stack=stack32#24,>x1c=int32#2
# asm 2: movl <x1c_stack=92(%esp),>x1c=%ecx
movl 92(%esp),%ecx

# qhasm: x0d = x0d_stack
# asm 1: movl <x0d_stack=stack32#28,>x0d=int32#6
# asm 2: movl <x0d_stack=108(%esp),>x0d=%edi
movl 108(%esp),%edi

# qhasm: x18 = x18_stack
# asm 1: movl <x18_stack=stack32#12,>x18=int32#7
# asm 2: movl <x18_stack=44(%esp),>x18=%ebp
movl 44(%esp),%ebp

# qhasm: x1c += x09
# asm 1: addl <x09=int32#1,<x1c=int32#2
# asm 2: addl <x09=%eax,<x1c=%ecx
addl %eax,%ecx

# qhasm: x09 <<<= 11
# asm 1: rol  $11,<x09=int32#1
# asm 2: rol  $11,<x09=%eax
rol  $11,%eax

# qhasm: x1c_stack = x1c
# asm 1: movl <x1c=int32#2,>x1c_stack=stack32#28
# asm 2: movl <x1c=%ecx,>x1c_stack=108(%esp)
movl %ecx,108(%esp)

# qhasm: x18 += x0d
# asm 1: addl <x0d=int32#6,<x18=int32#7
# asm 2: addl <x0d=%edi,<x18=%ebp
addl %edi,%ebp

# qhasm: x0d <<<= 11
# asm 1: rol  $11,<x0d=int32#6
# asm 2: rol  $11,<x0d=%edi
rol  $11,%edi

# qhasm: x18_stack = x18
# asm 1: movl <x18=int32#7,>x18_stack=stack32#24
# asm 2: movl <x18=%ebp,>x18_stack=92(%esp)
movl %ebp,92(%esp)

# qhasm: x09 ^= x18
# asm 1: xorl <x18=int32#7,<x09=int32#1
# asm 2: xorl <x18=%ebp,<x09=%eax
xorl %ebp,%eax

# qhasm: x09_stack = x09
# asm 1: movd <x09=int32#1,>x09_stack=int3232#2
# asm 2: movd <x09=%eax,>x09_stack=%mm1
movd %eax,%mm1

# qhasm: x0d ^= x1c
# asm 1: xorl <x1c=int32#2,<x0d=int32#6
# asm 2: xorl <x1c=%ecx,<x0d=%edi
xorl %ecx,%edi

# qhasm: x0d_stack = x0d
# asm 1: movl <x0d=int32#6,>x0d_stack=stack32#13
# asm 2: movl <x0d=%edi,>x0d_stack=48(%esp)
movl %edi,48(%esp)

# qhasm: x02 = x02_stack
# asm 1: movd <x02_stack=int3232#3,>x02=int32#1
# asm 2: movd <x02_stack=%mm2,>x02=%eax
movd %mm2,%eax

# qhasm: x17 = x17_stack
# asm 1: movl <x17_stack=stack32#23,>x17=int32#2
# asm 2: movl <x17_stack=88(%esp),>x17=%ecx
movl 88(%esp),%ecx

# qhasm: x06 = x06_stack
# asm 1: movd <x06_stack=int3232#7,>x06=int32#6
# asm 2: movd <x06_stack=%mm6,>x06=%edi
movd %mm6,%edi

# qhasm: x13 = x13_stack
# asm 1: movl <x13_stack=stack32#19,>x13=int32#7
# asm 2: movl <x13_stack=72(%esp),>x13=%ebp
movl 72(%esp),%ebp

# qhasm: x17 += x02
# asm 1: addl <x02=int32#1,<x17=int32#2
# asm 2: addl <x02=%eax,<x17=%ecx
addl %eax,%ecx

# qhasm: x02 <<<= 11
# asm 1: rol  $11,<x02=int32#1
# asm 2: rol  $11,<x02=%eax
rol  $11,%eax

# qhasm: x17_stack = x17
# asm 1: movl <x17=int32#2,>x17_stack=stack32#23
# asm 2: movl <x17=%ecx,>x17_stack=88(%esp)
movl %ecx,88(%esp)

# qhasm: x13 += x06
# asm 1: addl <x06=int32#6,<x13=int32#7
# asm 2: addl <x06=%edi,<x13=%ebp
addl %edi,%ebp

# qhasm: x06 <<<= 11
# asm 1: rol  $11,<x06=int32#6
# asm 2: rol  $11,<x06=%edi
rol  $11,%edi

# qhasm: x13_stack = x13
# asm 1: movl <x13=int32#7,>x13_stack=stack32#19
# asm 2: movl <x13=%ebp,>x13_stack=72(%esp)
movl %ebp,72(%esp)

# qhasm: x02 ^= x13
# asm 1: xorl <x13=int32#7,<x02=int32#1
# asm 2: xorl <x13=%ebp,<x02=%eax
xorl %ebp,%eax

# qhasm: x02_stack = x02
# asm 1: movd <x02=int32#1,>x02_stack=int3232#3
# asm 2: movd <x02=%eax,>x02_stack=%mm2
movd %eax,%mm2

# qhasm: x06 ^= x17
# asm 1: xorl <x17=int32#2,<x06=int32#6
# asm 2: xorl <x17=%ecx,<x06=%edi
xorl %ecx,%edi

# qhasm: x06_stack = x06
# asm 1: movd <x06=int32#6,>x06_stack=int3232#7
# asm 2: movd <x06=%edi,>x06_stack=%mm6
movd %edi,%mm6

# qhasm: x0a = x0a_stack
# asm 1: movl <x0a_stack=stack32#37,>x0a=int32#1
# asm 2: movl <x0a_stack=144(%esp),>x0a=%eax
movl 144(%esp),%eax

# qhasm: x1f = x1f_stack
# asm 1: movl <x1f_stack=stack32#34,>x1f=int32#2
# asm 2: movl <x1f_stack=132(%esp),>x1f=%ecx
movl 132(%esp),%ecx

# qhasm: x0e = x0e_stack
# asm 1: movl <x0e_stack=stack32#39,>x0e=int32#6
# asm 2: movl <x0e_stack=152(%esp),>x0e=%edi
movl 152(%esp),%edi

# qhasm: x1b = x1b_stack
# asm 1: movl <x1b_stack=stack32#35,>x1b=int32#7
# asm 2: movl <x1b_stack=136(%esp),>x1b=%ebp
movl 136(%esp),%ebp

# qhasm: x1f += x0a
# asm 1: addl <x0a=int32#1,<x1f=int32#2
# asm 2: addl <x0a=%eax,<x1f=%ecx
addl %eax,%ecx

# qhasm: x0a <<<= 11
# asm 1: rol  $11,<x0a=int32#1
# asm 2: rol  $11,<x0a=%eax
rol  $11,%eax

# qhasm: x1f_stack = x1f
# asm 1: movl <x1f=int32#2,>x1f_stack=stack32#31
# asm 2: movl <x1f=%ecx,>x1f_stack=120(%esp)
movl %ecx,120(%esp)

# qhasm: x1b += x0e
# asm 1: addl <x0e=int32#6,<x1b=int32#7
# asm 2: addl <x0e=%edi,<x1b=%ebp
addl %edi,%ebp

# qhasm: x0e <<<= 11
# asm 1: rol  $11,<x0e=int32#6
# asm 2: rol  $11,<x0e=%edi
rol  $11,%edi

# qhasm: x1b_stack = x1b
# asm 1: movl <x1b=int32#7,>x1b_stack=stack32#27
# asm 2: movl <x1b=%ebp,>x1b_stack=104(%esp)
movl %ebp,104(%esp)

# qhasm: x0a ^= x1b
# asm 1: xorl <x1b=int32#7,<x0a=int32#1
# asm 2: xorl <x1b=%ebp,<x0a=%eax
xorl %ebp,%eax

# qhasm: x0a_stack = x0a
# asm 1: movl <x0a=int32#1,>x0a_stack=stack32#10
# asm 2: movl <x0a=%eax,>x0a_stack=36(%esp)
movl %eax,36(%esp)

# qhasm: x0e ^= x1f
# asm 1: xorl <x1f=int32#2,<x0e=int32#6
# asm 2: xorl <x1f=%ecx,<x0e=%edi
xorl %ecx,%edi

# qhasm: x0e_stack = x0e
# asm 1: movl <x0e=int32#6,>x0e_stack=stack32#14
# asm 2: movl <x0e=%edi,>x0e_stack=52(%esp)
movl %edi,52(%esp)

# qhasm: x15 = x15_stack
# asm 1: movl <x15_stack=stack32#17,>x15=int32#1
# asm 2: movl <x15_stack=64(%esp),>x15=%eax
movl 64(%esp),%eax

# qhasm: x04 = x04_stack
# asm 1: movd <x04_stack=int3232#5,>x04=int32#2
# asm 2: movd <x04_stack=%mm4,>x04=%ecx
movd %mm4,%ecx

# qhasm: x11 = x11_stack
# asm 1: movl <x11_stack=stack32#21,>x11=int32#6
# asm 2: movl <x11_stack=80(%esp),>x11=%edi
movl 80(%esp),%edi

# qhasm: x15 += x00
# asm 1: addl <x00=int32#3,<x15=int32#1
# asm 2: addl <x00=%edx,<x15=%eax
addl %edx,%eax

# qhasm: x00 <<<= 11
# asm 1: rol  $11,<x00=int32#3
# asm 2: rol  $11,<x00=%edx
rol  $11,%edx

# qhasm: x15_stack = x15
# asm 1: movl <x15=int32#1,>x15_stack=stack32#21
# asm 2: movl <x15=%eax,>x15_stack=80(%esp)
movl %eax,80(%esp)

# qhasm: x11 += x04
# asm 1: addl <x04=int32#2,<x11=int32#6
# asm 2: addl <x04=%ecx,<x11=%edi
addl %ecx,%edi

# qhasm: x04 <<<= 11
# asm 1: rol  $11,<x04=int32#2
# asm 2: rol  $11,<x04=%ecx
rol  $11,%ecx

# qhasm: x11_stack = x11
# asm 1: movl <x11=int32#6,>x11_stack=stack32#17
# asm 2: movl <x11=%edi,>x11_stack=64(%esp)
movl %edi,64(%esp)

# qhasm: x00 ^= x11
# asm 1: xorl <x11=int32#6,<x00=int32#3
# asm 2: xorl <x11=%edi,<x00=%edx
xorl %edi,%edx

# qhasm: x04 ^= x15
# asm 1: xorl <x15=int32#1,<x04=int32#2
# asm 2: xorl <x15=%eax,<x04=%ecx
xorl %eax,%ecx

# qhasm: x04_stack = x04
# asm 1: movd <x04=int32#2,>x04_stack=int3232#5
# asm 2: movd <x04=%ecx,>x04_stack=%mm4
movd %ecx,%mm4

# qhasm: x08 = x08_stack
# asm 1: movd <x08_stack=int3232#1,>x08=int32#1
# asm 2: movd <x08_stack=%mm0,>x08=%eax
movd %mm0,%eax

# qhasm: x1d = x1d_stack
# asm 1: movl <x1d_stack=stack32#25,>x1d=int32#2
# asm 2: movl <x1d_stack=96(%esp),>x1d=%ecx
movl 96(%esp),%ecx

# qhasm: x0c = x0c_stack
# asm 1: movl <x0c_stack=stack32#36,>x0c=int32#6
# asm 2: movl <x0c_stack=140(%esp),>x0c=%edi
movl 140(%esp),%edi

# qhasm: x19 = x19_stack
# asm 1: movl <x19_stack=stack32#38,>x19=int32#7
# asm 2: movl <x19_stack=148(%esp),>x19=%ebp
movl 148(%esp),%ebp

# qhasm: x1d += x08
# asm 1: addl <x08=int32#1,<x1d=int32#2
# asm 2: addl <x08=%eax,<x1d=%ecx
addl %eax,%ecx

# qhasm: x08 <<<= 11
# asm 1: rol  $11,<x08=int32#1
# asm 2: rol  $11,<x08=%eax
rol  $11,%eax

# qhasm: x1d_stack = x1d
# asm 1: movl <x1d=int32#2,>x1d_stack=stack32#29
# asm 2: movl <x1d=%ecx,>x1d_stack=112(%esp)
movl %ecx,112(%esp)

# qhasm: x19 += x0c
# asm 1: addl <x0c=int32#6,<x19=int32#7
# asm 2: addl <x0c=%edi,<x19=%ebp
addl %edi,%ebp

# qhasm: x0c <<<= 11
# asm 1: rol  $11,<x0c=int32#6
# asm 2: rol  $11,<x0c=%edi
rol  $11,%edi

# qhasm: x19_stack = x19
# asm 1: movl <x19=int32#7,>x19_stack=stack32#25
# asm 2: movl <x19=%ebp,>x19_stack=96(%esp)
movl %ebp,96(%esp)

# qhasm: x08 ^= x19
# asm 1: xorl <x19=int32#7,<x08=int32#1
# asm 2: xorl <x19=%ebp,<x08=%eax
xorl %ebp,%eax

# qhasm: x08_stack = x08
# asm 1: movd <x08=int32#1,>x08_stack=int3232#1
# asm 2: movd <x08=%eax,>x08_stack=%mm0
movd %eax,%mm0

# qhasm: x0c ^= x1d
# asm 1: xorl <x1d=int32#2,<x0c=int32#6
# asm 2: xorl <x1d=%ecx,<x0c=%edi
xorl %ecx,%edi

# qhasm: x0c_stack = x0c
# asm 1: movl <x0c=int32#6,>x0c_stack=stack32#12
# asm 2: movl <x0c=%edi,>x0c_stack=44(%esp)
movl %edi,44(%esp)

# qhasm: r = r_stack
# asm 1: movl <r_stack=stack32#33,>r=int32#1
# asm 2: movl <r_stack=128(%esp),>r=%eax
movl 128(%esp),%eax

# qhasm:                    unsigned>? r -= 2
# asm 1: sub $2,<r=int32#1
# asm 2: sub $2,<r=%eax
sub $2,%eax
# comment:fp stack unchanged by jump

# qhasm: goto morerounds if unsigned>
ja ._morerounds

# qhasm:   finalization = finalization_stack
# asm 1: movl <finalization_stack=stack32#32,>finalization=int32#1
# asm 2: movl <finalization_stack=124(%esp),>finalization=%eax
movl 124(%esp),%eax
# comment:fp stack unchanged by jump

# qhasm: goto checkinlen
jmp ._checkinlen

# qhasm: inlenbelow32:
._inlenbelow32:

# qhasm:                       =? finalization - 1
# asm 1: cmp  $1,<finalization=int32#1
# asm 2: cmp  $1,<finalization=%eax
cmp  $1,%eax
# comment:fp stack unchanged by jump

# qhasm: goto finalization1 if =
je ._finalization1

# qhasm:                       =? finalization - 2
# asm 1: cmp  $2,<finalization=int32#1
# asm 2: cmp  $2,<finalization=%eax
cmp  $2,%eax
# comment:fp stack unchanged by jump

# qhasm: goto finalization2 if =
je ._finalization2

# qhasm:   y00 = 0
# asm 1: mov  $0,>y00=int32#1
# asm 2: mov  $0,>y00=%eax
mov  $0,%eax

# qhasm:   z = &tmp
# asm 1: leal <tmp=stack256#1,>z=int32#6
# asm 2: leal <tmp=160(%esp),>z=%edi
leal 160(%esp),%edi

# qhasm:   *(uint32 *) (z + 0) = y00
# asm 1: movl <y00=int32#1,0(<z=int32#6)
# asm 2: movl <y00=%eax,0(<z=%edi)
movl %eax,0(%edi)

# qhasm:   *(uint32 *) (z + 4) = y00
# asm 1: movl <y00=int32#1,4(<z=int32#6)
# asm 2: movl <y00=%eax,4(<z=%edi)
movl %eax,4(%edi)

# qhasm:   *(uint32 *) (z + 8) = y00
# asm 1: movl <y00=int32#1,8(<z=int32#6)
# asm 2: movl <y00=%eax,8(<z=%edi)
movl %eax,8(%edi)

# qhasm:   *(uint32 *) (z + 12) = y00
# asm 1: movl <y00=int32#1,12(<z=int32#6)
# asm 2: movl <y00=%eax,12(<z=%edi)
movl %eax,12(%edi)

# qhasm:   *(uint32 *) (z + 16) = y00
# asm 1: movl <y00=int32#1,16(<z=int32#6)
# asm 2: movl <y00=%eax,16(<z=%edi)
movl %eax,16(%edi)

# qhasm:   *(uint32 *) (z + 20) = y00
# asm 1: movl <y00=int32#1,20(<z=int32#6)
# asm 2: movl <y00=%eax,20(<z=%edi)
movl %eax,20(%edi)

# qhasm:   *(uint32 *) (z + 24) = y00
# asm 1: movl <y00=int32#1,24(<z=int32#6)
# asm 2: movl <y00=%eax,24(<z=%edi)
movl %eax,24(%edi)

# qhasm:   *(uint32 *) (z + 28) = y00
# asm 1: movl <y00=int32#1,28(<z=int32#6)
# asm 2: movl <y00=%eax,28(<z=%edi)
movl %eax,28(%edi)

# qhasm:   while (inlenlow) { *z++ = *in++; --inlenlow }
rep movsb

# qhasm:   y00 = 128
# asm 1: mov  $128,>y00=int32#1
# asm 2: mov  $128,>y00=%eax
mov  $128,%eax

# qhasm:   *(uint8 *) (z + 0) = y00
# asm 1: movb <y00=int32#1%8,0(<z=int32#6)
# asm 2: movb <y00=%al,0(<z=%edi)
movb %al,0(%edi)

# qhasm:   in = &tmp
# asm 1: leal <tmp=stack256#1,>in=int32#1
# asm 2: leal <tmp=160(%esp),>in=%eax
leal 160(%esp),%eax

# qhasm:   in_stack = in
# asm 1: movl <in=int32#1,>in_stack=stack32#6
# asm 2: movl <in=%eax,>in_stack=20(%esp)
movl %eax,20(%esp)

# qhasm:   finalization = 1
# asm 1: mov  $1,>finalization=int32#1
# asm 2: mov  $1,>finalization=%eax
mov  $1,%eax

# qhasm:   inlenlow = 32
# asm 1: mov  $32,>inlenlow=int32#2
# asm 2: mov  $32,>inlenlow=%ecx
mov  $32,%ecx
# comment:fp stack unchanged by jump

# qhasm:   goto mainloop
jmp ._mainloop

# qhasm: finalization1:
._finalization1:

# qhasm:   x1f = x1f_stack
# asm 1: movl <x1f_stack=stack32#31,>x1f=int32#1
# asm 2: movl <x1f_stack=120(%esp),>x1f=%eax
movl 120(%esp),%eax

# qhasm:   x1f ^= 1
# asm 1: xor  $1,<x1f=int32#1
# asm 2: xor  $1,<x1f=%eax
xor  $1,%eax

# qhasm:   x1f_stack = x1f
# asm 1: movl <x1f=int32#1,>x1f_stack=stack32#31
# asm 2: movl <x1f=%eax,>x1f_stack=120(%esp)
movl %eax,120(%esp)

# qhasm:   r = 160
# asm 1: mov  $160,>r=int32#1
# asm 2: mov  $160,>r=%eax
mov  $160,%eax

# qhasm:   finalization = 2
# asm 1: mov  $2,>finalization=int32#6
# asm 2: mov  $2,>finalization=%edi
mov  $2,%edi

# qhasm:   finalization_stack = finalization
# asm 1: movl <finalization=int32#6,>finalization_stack=stack32#32
# asm 2: movl <finalization=%edi,>finalization_stack=124(%esp)
movl %edi,124(%esp)

# qhasm:   inlenlow_stack = inlenlow
# asm 1: movl <inlenlow=int32#2,>inlenlow_stack=stack32#8
# asm 2: movl <inlenlow=%ecx,>inlenlow_stack=28(%esp)
movl %ecx,28(%esp)

# qhasm:   inlenhigh_stack = inlenhigh
# asm 1: movl <inlenhigh=int32#7,>inlenhigh_stack=stack32#9
# asm 2: movl <inlenhigh=%ebp,>inlenhigh_stack=32(%esp)
movl %ebp,32(%esp)
# comment:fp stack unchanged by jump

# qhasm: goto morerounds
jmp ._morerounds

# qhasm: finalization2:
._finalization2:

# qhasm:   out = out_stack
# asm 1: movl <out_stack=stack32#7,>out=int32#1
# asm 2: movl <out_stack=24(%esp),>out=%eax
movl 24(%esp),%eax

# qhasm:   x02 = x02_stack
# asm 1: movd <x02_stack=int3232#3,>x02=int32#2
# asm 2: movd <x02_stack=%mm2,>x02=%ecx
movd %mm2,%ecx

# qhasm:   x03 = x03_stack
# asm 1: movd <x03_stack=int3232#4,>x03=int32#5
# asm 2: movd <x03_stack=%mm3,>x03=%esi
movd %mm3,%esi

# qhasm:   *(uint32 *) (out + 0) = x00
# asm 1: movl <x00=int32#3,0(<out=int32#1)
# asm 2: movl <x00=%edx,0(<out=%eax)
movl %edx,0(%eax)

# qhasm:   *(uint32 *) (out + 4) = x01
# asm 1: movl <x01=int32#4,4(<out=int32#1)
# asm 2: movl <x01=%ebx,4(<out=%eax)
movl %ebx,4(%eax)

# qhasm:   *(uint32 *) (out + 8) = x02
# asm 1: movl <x02=int32#2,8(<out=int32#1)
# asm 2: movl <x02=%ecx,8(<out=%eax)
movl %ecx,8(%eax)

# qhasm:   *(uint32 *) (out + 12) = x03
# asm 1: movl <x03=int32#5,12(<out=int32#1)
# asm 2: movl <x03=%esi,12(<out=%eax)
movl %esi,12(%eax)

# qhasm:   x04 = x04_stack
# asm 1: movd <x04_stack=int3232#5,>x04=int32#2
# asm 2: movd <x04_stack=%mm4,>x04=%ecx
movd %mm4,%ecx

# qhasm:   x05 = x05_stack
# asm 1: movd <x05_stack=int3232#6,>x05=int32#3
# asm 2: movd <x05_stack=%mm5,>x05=%edx
movd %mm5,%edx

# qhasm:   x06 = x06_stack
# asm 1: movd <x06_stack=int3232#7,>x06=int32#4
# asm 2: movd <x06_stack=%mm6,>x06=%ebx
movd %mm6,%ebx

# qhasm:   x07 = x07_stack
# asm 1: movd <x07_stack=int3232#8,>x07=int32#5
# asm 2: movd <x07_stack=%mm7,>x07=%esi
movd %mm7,%esi

# qhasm:   *(uint32 *) (out + 16) = x04
# asm 1: movl <x04=int32#2,16(<out=int32#1)
# asm 2: movl <x04=%ecx,16(<out=%eax)
movl %ecx,16(%eax)

# qhasm:   *(uint32 *) (out + 20) = x05
# asm 1: movl <x05=int32#3,20(<out=int32#1)
# asm 2: movl <x05=%edx,20(<out=%eax)
movl %edx,20(%eax)

# qhasm:   *(uint32 *) (out + 24) = x06
# asm 1: movl <x06=int32#4,24(<out=int32#1)
# asm 2: movl <x06=%ebx,24(<out=%eax)
movl %ebx,24(%eax)

# qhasm:   *(uint32 *) (out + 28) = x07
# asm 1: movl <x07=int32#5,28(<out=int32#1)
# asm 2: movl <x07=%esi,28(<out=%eax)
movl %esi,28(%eax)

# qhasm:   x08 = x08_stack
# asm 1: movd <x08_stack=int3232#1,>x08=int32#2
# asm 2: movd <x08_stack=%mm0,>x08=%ecx
movd %mm0,%ecx

# qhasm:   x09 = x09_stack
# asm 1: movd <x09_stack=int3232#2,>x09=int32#3
# asm 2: movd <x09_stack=%mm1,>x09=%edx
movd %mm1,%edx

# qhasm:   x0a = x0a_stack
# asm 1: movl <x0a_stack=stack32#10,>x0a=int32#4
# asm 2: movl <x0a_stack=36(%esp),>x0a=%ebx
movl 36(%esp),%ebx

# qhasm:   x0b = x0b_stack
# asm 1: movl <x0b_stack=stack32#11,>x0b=int32#5
# asm 2: movl <x0b_stack=40(%esp),>x0b=%esi
movl 40(%esp),%esi

# qhasm:   *(uint32 *) (out + 32) = x08
# asm 1: movl <x08=int32#2,32(<out=int32#1)
# asm 2: movl <x08=%ecx,32(<out=%eax)
movl %ecx,32(%eax)

# qhasm:   *(uint32 *) (out + 36) = x09
# asm 1: movl <x09=int32#3,36(<out=int32#1)
# asm 2: movl <x09=%edx,36(<out=%eax)
movl %edx,36(%eax)

# qhasm:   *(uint32 *) (out + 40) = x0a
# asm 1: movl <x0a=int32#4,40(<out=int32#1)
# asm 2: movl <x0a=%ebx,40(<out=%eax)
movl %ebx,40(%eax)

# qhasm:   *(uint32 *) (out + 44) = x0b
# asm 1: movl <x0b=int32#5,44(<out=int32#1)
# asm 2: movl <x0b=%esi,44(<out=%eax)
movl %esi,44(%eax)

# qhasm:   x0c = x0c_stack
# asm 1: movl <x0c_stack=stack32#12,>x0c=int32#2
# asm 2: movl <x0c_stack=44(%esp),>x0c=%ecx
movl 44(%esp),%ecx

# qhasm:   x0d = x0d_stack
# asm 1: movl <x0d_stack=stack32#13,>x0d=int32#3
# asm 2: movl <x0d_stack=48(%esp),>x0d=%edx
movl 48(%esp),%edx

# qhasm:   x0e = x0e_stack
# asm 1: movl <x0e_stack=stack32#14,>x0e=int32#4
# asm 2: movl <x0e_stack=52(%esp),>x0e=%ebx
movl 52(%esp),%ebx

# qhasm:   x0f = x0f_stack
# asm 1: movl <x0f_stack=stack32#15,>x0f=int32#5
# asm 2: movl <x0f_stack=56(%esp),>x0f=%esi
movl 56(%esp),%esi

# qhasm:   *(uint32 *) (out + 48) = x0c
# asm 1: movl <x0c=int32#2,48(<out=int32#1)
# asm 2: movl <x0c=%ecx,48(<out=%eax)
movl %ecx,48(%eax)

# qhasm:   *(uint32 *) (out + 52) = x0d
# asm 1: movl <x0d=int32#3,52(<out=int32#1)
# asm 2: movl <x0d=%edx,52(<out=%eax)
movl %edx,52(%eax)

# qhasm:   *(uint32 *) (out + 56) = x0e
# asm 1: movl <x0e=int32#4,56(<out=int32#1)
# asm 2: movl <x0e=%ebx,56(<out=%eax)
movl %ebx,56(%eax)

# qhasm:   *(uint32 *) (out + 60) = x0f
# asm 1: movl <x0f=int32#5,60(<out=int32#1)
# asm 2: movl <x0f=%esi,60(<out=%eax)
movl %esi,60(%eax)

# qhasm:   emms
emms

# qhasm:   eax = eax_stack
# asm 1: movl <eax_stack=stack32#1,>eax=int32#1
# asm 2: movl <eax_stack=0(%esp),>eax=%eax
movl 0(%esp),%eax

# qhasm:   ebx = ebx_stack
# asm 1: movl <ebx_stack=stack32#2,>ebx=int32#4
# asm 2: movl <ebx_stack=4(%esp),>ebx=%ebx
movl 4(%esp),%ebx

# qhasm:   esi = esi_stack
# asm 1: movl <esi_stack=stack32#3,>esi=int32#5
# asm 2: movl <esi_stack=8(%esp),>esi=%esi
movl 8(%esp),%esi

# qhasm:   edi = edi_stack
# asm 1: movl <edi_stack=stack32#4,>edi=int32#6
# asm 2: movl <edi_stack=12(%esp),>edi=%edi
movl 12(%esp),%edi

# qhasm:   ebp = ebp_stack
# asm 1: movl <ebp_stack=stack32#5,>ebp=int32#7
# asm 2: movl <ebp_stack=16(%esp),>ebp=%ebp
movl 16(%esp),%ebp

# qhasm: leave
add %eax,%esp
xor %eax,%eax
ret
