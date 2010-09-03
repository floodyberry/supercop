
# qhasm: stack32 arg1

# qhasm: stack32 arg2

# qhasm: stack32 arg3

# qhasm: input arg1

# qhasm: input arg2

# qhasm: input arg3

# qhasm: int32 out

# qhasm: int32 in

# qhasm: int32 inlen

# qhasm: int6464 x0

# qhasm: int6464 x1

# qhasm: int6464 x2

# qhasm: int6464 x3

# qhasm: int6464 x4

# qhasm: int6464 x5

# qhasm: int6464 x6

# qhasm: int6464 x7

# qhasm: int6464 y0

# qhasm: int6464 y1

# qhasm: int6464 y2

# qhasm: int6464 y3

# qhasm: int32 i

# qhasm: int32 r

# qhasm: int32 source

# qhasm: int32 copy

# qhasm: stack128 tmp

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

# qhasm: stack128 x4_stack

# qhasm: stack128 x5_stack

# qhasm: stack128 x6_stack

# qhasm: stack128 x7_stack

# qhasm: int32 constants

# qhasm: enter crypto_hash_cubehash1632_x86xmm
.text
.p2align 5
.globl _crypto_hash_cubehash1632_x86xmm
.globl crypto_hash_cubehash1632_x86xmm
_crypto_hash_cubehash1632_x86xmm:
crypto_hash_cubehash1632_x86xmm:
mov %esp,%eax
and $31,%eax
add $128,%eax
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

# qhasm:   in = arg2
# asm 1: movl <arg2=stack32#-2,>in=int32#5
# asm 2: movl <arg2=8(%esp,%eax),>in=%esi
movl 8(%esp,%eax),%esi

# qhasm:   inlen = arg3
# asm 1: movl <arg3=stack32#-3,>inlen=int32#2
# asm 2: movl <arg3=12(%esp,%eax),>inlen=%ecx
movl 12(%esp,%eax),%ecx

# qhasm:   y0 = 0
# asm 1: pxor   >y0=int6464#1,>y0=int6464#1
# asm 2: pxor   >y0=%xmm0,>y0=%xmm0
pxor   %xmm0,%xmm0

# qhasm:   tmp = y0
# asm 1: movdqa <y0=int6464#1,>tmp=stack128#1
# asm 2: movdqa <y0=%xmm0,>tmp=32(%esp)
movdqa %xmm0,32(%esp)

# qhasm:   constants = &crypto_hash_cubehash1632_x86xmm_constants
# asm 1: lea  crypto_hash_cubehash1632_x86xmm_constants,>constants=int32#3
# asm 2: lea  crypto_hash_cubehash1632_x86xmm_constants,>constants=%edx
lea  crypto_hash_cubehash1632_x86xmm_constants,%edx

# qhasm:   x5 = *(int128 *) (constants + 80)
# asm 1: movdqa 80(<constants=int32#3),>x5=int6464#1
# asm 2: movdqa 80(<constants=%edx),>x5=%xmm0
movdqa 80(%edx),%xmm0

# qhasm:   x7 = *(int128 *) (constants + 112)
# asm 1: movdqa 112(<constants=int32#3),>x7=int6464#2
# asm 2: movdqa 112(<constants=%edx),>x7=%xmm1
movdqa 112(%edx),%xmm1

# qhasm:   x4 = *(int128 *) (constants + 64)
# asm 1: movdqa 64(<constants=int32#3),>x4=int6464#3
# asm 2: movdqa 64(<constants=%edx),>x4=%xmm2
movdqa 64(%edx),%xmm2

# qhasm:   x6 = *(int128 *) (constants + 96)
# asm 1: movdqa 96(<constants=int32#3),>x6=int6464#4
# asm 2: movdqa 96(<constants=%edx),>x6=%xmm3
movdqa 96(%edx),%xmm3

# qhasm:   x0 = *(int128 *) (constants + 0)
# asm 1: movdqa 0(<constants=int32#3),>x0=int6464#5
# asm 2: movdqa 0(<constants=%edx),>x0=%xmm4
movdqa 0(%edx),%xmm4

# qhasm:   x1 = *(int128 *) (constants + 16)
# asm 1: movdqa 16(<constants=int32#3),>x1=int6464#6
# asm 2: movdqa 16(<constants=%edx),>x1=%xmm5
movdqa 16(%edx),%xmm5

# qhasm:   x2 = *(int128 *) (constants + 32)
# asm 1: movdqa 32(<constants=int32#3),>x2=int6464#7
# asm 2: movdqa 32(<constants=%edx),>x2=%xmm6
movdqa 32(%edx),%xmm6

# qhasm:   x3 = *(int128 *) (constants + 48)
# asm 1: movdqa 48(<constants=int32#3),>x3=int6464#8
# asm 2: movdqa 48(<constants=%edx),>x3=%xmm7
movdqa 48(%edx),%xmm7

# qhasm:   x5_stack = x5
# asm 1: movdqa <x5=int6464#1,>x5_stack=stack128#2
# asm 2: movdqa <x5=%xmm0,>x5_stack=48(%esp)
movdqa %xmm0,48(%esp)

# qhasm:   x7_stack = x7
# asm 1: movdqa <x7=int6464#2,>x7_stack=stack128#3
# asm 2: movdqa <x7=%xmm1,>x7_stack=64(%esp)
movdqa %xmm1,64(%esp)

# qhasm:                      signed<? inlen - 32
# asm 1: cmp  $32,<inlen=int32#2
# asm 2: cmp  $32,<inlen=%ecx
cmp  $32,%ecx
# comment:fp stack unchanged by jump

# qhasm: goto inlenbelow32 if signed<
jl ._inlenbelow32
# comment:fp stack unchanged by fallthrough

# qhasm: mainloop:
._mainloop:

# qhasm:   y0 = *(unaligned int128 *) (in + 0)
# asm 1: movdqu 0(<in=int32#5),>y0=int6464#1
# asm 2: movdqu 0(<in=%esi),>y0=%xmm0
movdqu 0(%esi),%xmm0

# qhasm:   y1 = *(unaligned int128 *) (in + 16)
# asm 1: movdqu 16(<in=int32#5),>y1=int6464#2
# asm 2: movdqu 16(<in=%esi),>y1=%xmm1
movdqu 16(%esi),%xmm1

# qhasm:   x0 ^= y0
# asm 1: pxor  <y0=int6464#1,<x0=int6464#5
# asm 2: pxor  <y0=%xmm0,<x0=%xmm4
pxor  %xmm0,%xmm4

# qhasm:   x1 ^= y1
# asm 1: pxor  <y1=int6464#2,<x1=int6464#6
# asm 2: pxor  <y1=%xmm1,<x1=%xmm5
pxor  %xmm1,%xmm5

# qhasm:   in += 32
# asm 1: add  $32,<in=int32#5
# asm 2: add  $32,<in=%esi
add  $32,%esi

# qhasm:   inlen -= 32
# asm 1: sub  $32,<inlen=int32#2
# asm 2: sub  $32,<inlen=%ecx
sub  $32,%ecx

# qhasm:   r = 16
# asm 1: mov  $16,>r=int32#4
# asm 2: mov  $16,>r=%ebx
mov  $16,%ebx
# comment:fp stack unchanged by fallthrough

# qhasm: morerounds:
._morerounds:

# qhasm:   uint32323232 x4 += x0
# asm 1: paddd <x0=int6464#5,<x4=int6464#3
# asm 2: paddd <x0=%xmm4,<x4=%xmm2
paddd %xmm4,%xmm2

# qhasm:   uint32323232 x6 += x2
# asm 1: paddd <x2=int6464#7,<x6=int6464#4
# asm 2: paddd <x2=%xmm6,<x6=%xmm3
paddd %xmm6,%xmm3

# qhasm:   y0 = x2
# asm 1: movdqa <x2=int6464#7,>y0=int6464#1
# asm 2: movdqa <x2=%xmm6,>y0=%xmm0
movdqa %xmm6,%xmm0

# qhasm:   uint32323232 y0 <<= 7
# asm 1: pslld $7,<y0=int6464#1
# asm 2: pslld $7,<y0=%xmm0
pslld $7,%xmm0

# qhasm:   uint32323232 x2 >>= 25
# asm 1: psrld $25,<x2=int6464#7
# asm 2: psrld $25,<x2=%xmm6
psrld $25,%xmm6

# qhasm:   y2 = x0
# asm 1: movdqa <x0=int6464#5,>y2=int6464#2
# asm 2: movdqa <x0=%xmm4,>y2=%xmm1
movdqa %xmm4,%xmm1

# qhasm:   uint32323232 y2 <<= 7
# asm 1: pslld $7,<y2=int6464#2
# asm 2: pslld $7,<y2=%xmm1
pslld $7,%xmm1

# qhasm:   uint32323232 x0 >>= 25
# asm 1: psrld $25,<x0=int6464#5
# asm 2: psrld $25,<x0=%xmm4
psrld $25,%xmm4

# qhasm:   y0 ^= x4
# asm 1: pxor  <x4=int6464#3,<y0=int6464#1
# asm 2: pxor  <x4=%xmm2,<y0=%xmm0
pxor  %xmm2,%xmm0

# qhasm:   y2 ^= x6
# asm 1: pxor  <x6=int6464#4,<y2=int6464#2
# asm 2: pxor  <x6=%xmm3,<y2=%xmm1
pxor  %xmm3,%xmm1

# qhasm:   y0 ^= x2
# asm 1: pxor  <x2=int6464#7,<y0=int6464#1
# asm 2: pxor  <x2=%xmm6,<y0=%xmm0
pxor  %xmm6,%xmm0

# qhasm:   y2 ^= x0
# asm 1: pxor  <x0=int6464#5,<y2=int6464#2
# asm 2: pxor  <x0=%xmm4,<y2=%xmm1
pxor  %xmm4,%xmm1

# qhasm:   x4 <<<= 64
# asm 1: pshufd $0x4e,<x4=int6464#3,<x4=int6464#3
# asm 2: pshufd $0x4e,<x4=%xmm2,<x4=%xmm2
pshufd $0x4e,%xmm2,%xmm2

# qhasm:   x6 <<<= 64
# asm 1: pshufd $0x4e,<x6=int6464#4,<x6=int6464#4
# asm 2: pshufd $0x4e,<x6=%xmm3,<x6=%xmm3
pshufd $0x4e,%xmm3,%xmm3

# qhasm:   x4_stack = x4
# asm 1: movdqa <x4=int6464#3,>x4_stack=stack128#4
# asm 2: movdqa <x4=%xmm2,>x4_stack=80(%esp)
movdqa %xmm2,80(%esp)

# qhasm:   x6_stack = x6
# asm 1: movdqa <x6=int6464#4,>x6_stack=stack128#5
# asm 2: movdqa <x6=%xmm3,>x6_stack=96(%esp)
movdqa %xmm3,96(%esp)

# qhasm:   x5 = x5_stack
# asm 1: movdqa <x5_stack=stack128#2,>x5=int6464#3
# asm 2: movdqa <x5_stack=48(%esp),>x5=%xmm2
movdqa 48(%esp),%xmm2

# qhasm:   x7 = x7_stack
# asm 1: movdqa <x7_stack=stack128#3,>x7=int6464#4
# asm 2: movdqa <x7_stack=64(%esp),>x7=%xmm3
movdqa 64(%esp),%xmm3

# qhasm:   uint32323232 x5 += x1
# asm 1: paddd <x1=int6464#6,<x5=int6464#3
# asm 2: paddd <x1=%xmm5,<x5=%xmm2
paddd %xmm5,%xmm2

# qhasm:   uint32323232 x7 += x3
# asm 1: paddd <x3=int6464#8,<x7=int6464#4
# asm 2: paddd <x3=%xmm7,<x7=%xmm3
paddd %xmm7,%xmm3

# qhasm:   y1 = x3
# asm 1: movdqa <x3=int6464#8,>y1=int6464#5
# asm 2: movdqa <x3=%xmm7,>y1=%xmm4
movdqa %xmm7,%xmm4

# qhasm:   uint32323232 y1 <<= 7
# asm 1: pslld $7,<y1=int6464#5
# asm 2: pslld $7,<y1=%xmm4
pslld $7,%xmm4

# qhasm:   uint32323232 x3 >>= 25
# asm 1: psrld $25,<x3=int6464#8
# asm 2: psrld $25,<x3=%xmm7
psrld $25,%xmm7

# qhasm:   y3 = x1
# asm 1: movdqa <x1=int6464#6,>y3=int6464#7
# asm 2: movdqa <x1=%xmm5,>y3=%xmm6
movdqa %xmm5,%xmm6

# qhasm:   uint32323232 y3 <<= 7
# asm 1: pslld $7,<y3=int6464#7
# asm 2: pslld $7,<y3=%xmm6
pslld $7,%xmm6

# qhasm:   uint32323232 x1 >>= 25
# asm 1: psrld $25,<x1=int6464#6
# asm 2: psrld $25,<x1=%xmm5
psrld $25,%xmm5

# qhasm:   y1 ^= x5
# asm 1: pxor  <x5=int6464#3,<y1=int6464#5
# asm 2: pxor  <x5=%xmm2,<y1=%xmm4
pxor  %xmm2,%xmm4

# qhasm:   y3 ^= x7
# asm 1: pxor  <x7=int6464#4,<y3=int6464#7
# asm 2: pxor  <x7=%xmm3,<y3=%xmm6
pxor  %xmm3,%xmm6

# qhasm:   y1 ^= x3
# asm 1: pxor  <x3=int6464#8,<y1=int6464#5
# asm 2: pxor  <x3=%xmm7,<y1=%xmm4
pxor  %xmm7,%xmm4

# qhasm:   y3 ^= x1
# asm 1: pxor  <x1=int6464#6,<y3=int6464#7
# asm 2: pxor  <x1=%xmm5,<y3=%xmm6
pxor  %xmm5,%xmm6

# qhasm:   x5 <<<= 64
# asm 1: pshufd $0x4e,<x5=int6464#3,<x5=int6464#3
# asm 2: pshufd $0x4e,<x5=%xmm2,<x5=%xmm2
pshufd $0x4e,%xmm2,%xmm2

# qhasm:   x7 <<<= 64
# asm 1: pshufd $0x4e,<x7=int6464#4,<x7=int6464#4
# asm 2: pshufd $0x4e,<x7=%xmm3,<x7=%xmm3
pshufd $0x4e,%xmm3,%xmm3

# qhasm:   x5_stack = x5
# asm 1: movdqa <x5=int6464#3,>x5_stack=stack128#2
# asm 2: movdqa <x5=%xmm2,>x5_stack=48(%esp)
movdqa %xmm2,48(%esp)

# qhasm:   x6 = x6_stack
# asm 1: movdqa <x6_stack=stack128#5,>x6=int6464#3
# asm 2: movdqa <x6_stack=96(%esp),>x6=%xmm2
movdqa 96(%esp),%xmm2

# qhasm:   uint32323232 x6 += y2
# asm 1: paddd <y2=int6464#2,<x6=int6464#3
# asm 2: paddd <y2=%xmm1,<x6=%xmm2
paddd %xmm1,%xmm2

# qhasm:   uint32323232 x7 += y3
# asm 1: paddd <y3=int6464#7,<x7=int6464#4
# asm 2: paddd <y3=%xmm6,<x7=%xmm3
paddd %xmm6,%xmm3

# qhasm:   x2 = y3
# asm 1: movdqa <y3=int6464#7,>x2=int6464#6
# asm 2: movdqa <y3=%xmm6,>x2=%xmm5
movdqa %xmm6,%xmm5

# qhasm:   x3 = y2
# asm 1: movdqa <y2=int6464#2,>x3=int6464#8
# asm 2: movdqa <y2=%xmm1,>x3=%xmm7
movdqa %xmm1,%xmm7

# qhasm:   uint32323232 x2 <<= 11
# asm 1: pslld $11,<x2=int6464#6
# asm 2: pslld $11,<x2=%xmm5
pslld $11,%xmm5

# qhasm:   uint32323232 x3 <<= 11
# asm 1: pslld $11,<x3=int6464#8
# asm 2: pslld $11,<x3=%xmm7
pslld $11,%xmm7

# qhasm:   uint32323232 y2 >>= 21
# asm 1: psrld $21,<y2=int6464#2
# asm 2: psrld $21,<y2=%xmm1
psrld $21,%xmm1

# qhasm:   uint32323232 y3 >>= 21
# asm 1: psrld $21,<y3=int6464#7
# asm 2: psrld $21,<y3=%xmm6
psrld $21,%xmm6

# qhasm:   x2 ^= x6
# asm 1: pxor  <x6=int6464#3,<x2=int6464#6
# asm 2: pxor  <x6=%xmm2,<x2=%xmm5
pxor  %xmm2,%xmm5

# qhasm:   x3 ^= x7
# asm 1: pxor  <x7=int6464#4,<x3=int6464#8
# asm 2: pxor  <x7=%xmm3,<x3=%xmm7
pxor  %xmm3,%xmm7

# qhasm:   x2 ^= y3
# asm 1: pxor  <y3=int6464#7,<x2=int6464#6
# asm 2: pxor  <y3=%xmm6,<x2=%xmm5
pxor  %xmm6,%xmm5

# qhasm:   x3 ^= y2
# asm 1: pxor  <y2=int6464#2,<x3=int6464#8
# asm 2: pxor  <y2=%xmm1,<x3=%xmm7
pxor  %xmm1,%xmm7

# qhasm:   x6 = x6[1,0,3,2]
# asm 1: pshufd $0xb1,<x6=int6464#3,>x6=int6464#2
# asm 2: pshufd $0xb1,<x6=%xmm2,>x6=%xmm1
pshufd $0xb1,%xmm2,%xmm1

# qhasm:   x7 = x7[1,0,3,2]
# asm 1: pshufd $0xb1,<x7=int6464#4,>x7=int6464#3
# asm 2: pshufd $0xb1,<x7=%xmm3,>x7=%xmm2
pshufd $0xb1,%xmm3,%xmm2

# qhasm:   x6_stack = x6
# asm 1: movdqa <x6=int6464#2,>x6_stack=stack128#3
# asm 2: movdqa <x6=%xmm1,>x6_stack=64(%esp)
movdqa %xmm1,64(%esp)

# qhasm:   x7_stack = x7
# asm 1: movdqa <x7=int6464#3,>x7_stack=stack128#5
# asm 2: movdqa <x7=%xmm2,>x7_stack=96(%esp)
movdqa %xmm2,96(%esp)

# qhasm:   x4 = x4_stack
# asm 1: movdqa <x4_stack=stack128#4,>x4=int6464#2
# asm 2: movdqa <x4_stack=80(%esp),>x4=%xmm1
movdqa 80(%esp),%xmm1

# qhasm:   x5 = x5_stack
# asm 1: movdqa <x5_stack=stack128#2,>x5=int6464#3
# asm 2: movdqa <x5_stack=48(%esp),>x5=%xmm2
movdqa 48(%esp),%xmm2

# qhasm:   uint32323232 x4 += y0
# asm 1: paddd <y0=int6464#1,<x4=int6464#2
# asm 2: paddd <y0=%xmm0,<x4=%xmm1
paddd %xmm0,%xmm1

# qhasm:   uint32323232 x5 += y1
# asm 1: paddd <y1=int6464#5,<x5=int6464#3
# asm 2: paddd <y1=%xmm4,<x5=%xmm2
paddd %xmm4,%xmm2

# qhasm:   x0 = y1
# asm 1: movdqa <y1=int6464#5,>x0=int6464#4
# asm 2: movdqa <y1=%xmm4,>x0=%xmm3
movdqa %xmm4,%xmm3

# qhasm:   x1 = y0
# asm 1: movdqa <y0=int6464#1,>x1=int6464#7
# asm 2: movdqa <y0=%xmm0,>x1=%xmm6
movdqa %xmm0,%xmm6

# qhasm:   uint32323232 x0 <<= 11
# asm 1: pslld $11,<x0=int6464#4
# asm 2: pslld $11,<x0=%xmm3
pslld $11,%xmm3

# qhasm:   uint32323232 x1 <<= 11
# asm 1: pslld $11,<x1=int6464#7
# asm 2: pslld $11,<x1=%xmm6
pslld $11,%xmm6

# qhasm:   uint32323232 y0 >>= 21
# asm 1: psrld $21,<y0=int6464#1
# asm 2: psrld $21,<y0=%xmm0
psrld $21,%xmm0

# qhasm:   uint32323232 y1 >>= 21
# asm 1: psrld $21,<y1=int6464#5
# asm 2: psrld $21,<y1=%xmm4
psrld $21,%xmm4

# qhasm:   x0 ^= x4
# asm 1: pxor  <x4=int6464#2,<x0=int6464#4
# asm 2: pxor  <x4=%xmm1,<x0=%xmm3
pxor  %xmm1,%xmm3

# qhasm:   x1 ^= x5
# asm 1: pxor  <x5=int6464#3,<x1=int6464#7
# asm 2: pxor  <x5=%xmm2,<x1=%xmm6
pxor  %xmm2,%xmm6

# qhasm:   x0 ^= y1
# asm 1: pxor  <y1=int6464#5,<x0=int6464#4
# asm 2: pxor  <y1=%xmm4,<x0=%xmm3
pxor  %xmm4,%xmm3

# qhasm:   x1 ^= y0
# asm 1: pxor  <y0=int6464#1,<x1=int6464#7
# asm 2: pxor  <y0=%xmm0,<x1=%xmm6
pxor  %xmm0,%xmm6

# qhasm:   x4 = x4[1,0,3,2]
# asm 1: pshufd $0xb1,<x4=int6464#2,>x4=int6464#1
# asm 2: pshufd $0xb1,<x4=%xmm1,>x4=%xmm0
pshufd $0xb1,%xmm1,%xmm0

# qhasm:   x5 = x5[1,0,3,2]
# asm 1: pshufd $0xb1,<x5=int6464#3,>x5=int6464#2
# asm 2: pshufd $0xb1,<x5=%xmm2,>x5=%xmm1
pshufd $0xb1,%xmm2,%xmm1

# qhasm:   x5_stack = x5
# asm 1: movdqa <x5=int6464#2,>x5_stack=stack128#2
# asm 2: movdqa <x5=%xmm1,>x5_stack=48(%esp)
movdqa %xmm1,48(%esp)

# qhasm:   x6 = x6_stack
# asm 1: movdqa <x6_stack=stack128#3,>x6=int6464#2
# asm 2: movdqa <x6_stack=64(%esp),>x6=%xmm1
movdqa 64(%esp),%xmm1

# qhasm:                    unsigned>? r -= 2
# asm 1: sub  $2,<r=int32#4
# asm 2: sub  $2,<r=%ebx
sub  $2,%ebx

# qhasm:   uint32323232 x4 += x0
# asm 1: paddd <x0=int6464#4,<x4=int6464#1
# asm 2: paddd <x0=%xmm3,<x4=%xmm0
paddd %xmm3,%xmm0

# qhasm:   uint32323232 x6 += x2
# asm 1: paddd <x2=int6464#6,<x6=int6464#2
# asm 2: paddd <x2=%xmm5,<x6=%xmm1
paddd %xmm5,%xmm1

# qhasm:   y0 = x2
# asm 1: movdqa <x2=int6464#6,>y0=int6464#3
# asm 2: movdqa <x2=%xmm5,>y0=%xmm2
movdqa %xmm5,%xmm2

# qhasm:   uint32323232 y0 <<= 7
# asm 1: pslld $7,<y0=int6464#3
# asm 2: pslld $7,<y0=%xmm2
pslld $7,%xmm2

# qhasm:   uint32323232 x2 >>= 25
# asm 1: psrld $25,<x2=int6464#6
# asm 2: psrld $25,<x2=%xmm5
psrld $25,%xmm5

# qhasm:   y2 = x0
# asm 1: movdqa <x0=int6464#4,>y2=int6464#5
# asm 2: movdqa <x0=%xmm3,>y2=%xmm4
movdqa %xmm3,%xmm4

# qhasm:   uint32323232 y2 <<= 7
# asm 1: pslld $7,<y2=int6464#5
# asm 2: pslld $7,<y2=%xmm4
pslld $7,%xmm4

# qhasm:   uint32323232 x0 >>= 25
# asm 1: psrld $25,<x0=int6464#4
# asm 2: psrld $25,<x0=%xmm3
psrld $25,%xmm3

# qhasm:   y0 ^= x4
# asm 1: pxor  <x4=int6464#1,<y0=int6464#3
# asm 2: pxor  <x4=%xmm0,<y0=%xmm2
pxor  %xmm0,%xmm2

# qhasm:   y2 ^= x6
# asm 1: pxor  <x6=int6464#2,<y2=int6464#5
# asm 2: pxor  <x6=%xmm1,<y2=%xmm4
pxor  %xmm1,%xmm4

# qhasm:   y0 ^= x2
# asm 1: pxor  <x2=int6464#6,<y0=int6464#3
# asm 2: pxor  <x2=%xmm5,<y0=%xmm2
pxor  %xmm5,%xmm2

# qhasm:   y2 ^= x0
# asm 1: pxor  <x0=int6464#4,<y2=int6464#5
# asm 2: pxor  <x0=%xmm3,<y2=%xmm4
pxor  %xmm3,%xmm4

# qhasm:   x4 <<<= 64
# asm 1: pshufd $0x4e,<x4=int6464#1,<x4=int6464#1
# asm 2: pshufd $0x4e,<x4=%xmm0,<x4=%xmm0
pshufd $0x4e,%xmm0,%xmm0

# qhasm:   x6 <<<= 64
# asm 1: pshufd $0x4e,<x6=int6464#2,<x6=int6464#2
# asm 2: pshufd $0x4e,<x6=%xmm1,<x6=%xmm1
pshufd $0x4e,%xmm1,%xmm1

# qhasm:   x4_stack = x4
# asm 1: movdqa <x4=int6464#1,>x4_stack=stack128#4
# asm 2: movdqa <x4=%xmm0,>x4_stack=80(%esp)
movdqa %xmm0,80(%esp)

# qhasm:   x6_stack = x6
# asm 1: movdqa <x6=int6464#2,>x6_stack=stack128#3
# asm 2: movdqa <x6=%xmm1,>x6_stack=64(%esp)
movdqa %xmm1,64(%esp)

# qhasm:   x5 = x5_stack
# asm 1: movdqa <x5_stack=stack128#2,>x5=int6464#1
# asm 2: movdqa <x5_stack=48(%esp),>x5=%xmm0
movdqa 48(%esp),%xmm0

# qhasm:   x7 = x7_stack
# asm 1: movdqa <x7_stack=stack128#5,>x7=int6464#2
# asm 2: movdqa <x7_stack=96(%esp),>x7=%xmm1
movdqa 96(%esp),%xmm1

# qhasm:   uint32323232 x5 += x1
# asm 1: paddd <x1=int6464#7,<x5=int6464#1
# asm 2: paddd <x1=%xmm6,<x5=%xmm0
paddd %xmm6,%xmm0

# qhasm:   uint32323232 x7 += x3
# asm 1: paddd <x3=int6464#8,<x7=int6464#2
# asm 2: paddd <x3=%xmm7,<x7=%xmm1
paddd %xmm7,%xmm1

# qhasm:   y1 = x3
# asm 1: movdqa <x3=int6464#8,>y1=int6464#4
# asm 2: movdqa <x3=%xmm7,>y1=%xmm3
movdqa %xmm7,%xmm3

# qhasm:   uint32323232 y1 <<= 7
# asm 1: pslld $7,<y1=int6464#4
# asm 2: pslld $7,<y1=%xmm3
pslld $7,%xmm3

# qhasm:   uint32323232 x3 >>= 25
# asm 1: psrld $25,<x3=int6464#8
# asm 2: psrld $25,<x3=%xmm7
psrld $25,%xmm7

# qhasm:   y3 = x1
# asm 1: movdqa <x1=int6464#7,>y3=int6464#6
# asm 2: movdqa <x1=%xmm6,>y3=%xmm5
movdqa %xmm6,%xmm5

# qhasm:   uint32323232 y3 <<= 7
# asm 1: pslld $7,<y3=int6464#6
# asm 2: pslld $7,<y3=%xmm5
pslld $7,%xmm5

# qhasm:   uint32323232 x1 >>= 25
# asm 1: psrld $25,<x1=int6464#7
# asm 2: psrld $25,<x1=%xmm6
psrld $25,%xmm6

# qhasm:   y1 ^= x5
# asm 1: pxor  <x5=int6464#1,<y1=int6464#4
# asm 2: pxor  <x5=%xmm0,<y1=%xmm3
pxor  %xmm0,%xmm3

# qhasm:   y3 ^= x7
# asm 1: pxor  <x7=int6464#2,<y3=int6464#6
# asm 2: pxor  <x7=%xmm1,<y3=%xmm5
pxor  %xmm1,%xmm5

# qhasm:   y1 ^= x3
# asm 1: pxor  <x3=int6464#8,<y1=int6464#4
# asm 2: pxor  <x3=%xmm7,<y1=%xmm3
pxor  %xmm7,%xmm3

# qhasm:   y3 ^= x1
# asm 1: pxor  <x1=int6464#7,<y3=int6464#6
# asm 2: pxor  <x1=%xmm6,<y3=%xmm5
pxor  %xmm6,%xmm5

# qhasm:   x5 <<<= 64
# asm 1: pshufd $0x4e,<x5=int6464#1,<x5=int6464#1
# asm 2: pshufd $0x4e,<x5=%xmm0,<x5=%xmm0
pshufd $0x4e,%xmm0,%xmm0

# qhasm:   x7 <<<= 64
# asm 1: pshufd $0x4e,<x7=int6464#2,<x7=int6464#2
# asm 2: pshufd $0x4e,<x7=%xmm1,<x7=%xmm1
pshufd $0x4e,%xmm1,%xmm1

# qhasm:   x5_stack = x5
# asm 1: movdqa <x5=int6464#1,>x5_stack=stack128#2
# asm 2: movdqa <x5=%xmm0,>x5_stack=48(%esp)
movdqa %xmm0,48(%esp)

# qhasm:   x6 = x6_stack
# asm 1: movdqa <x6_stack=stack128#3,>x6=int6464#1
# asm 2: movdqa <x6_stack=64(%esp),>x6=%xmm0
movdqa 64(%esp),%xmm0

# qhasm:   uint32323232 x6 += y2
# asm 1: paddd <y2=int6464#5,<x6=int6464#1
# asm 2: paddd <y2=%xmm4,<x6=%xmm0
paddd %xmm4,%xmm0

# qhasm:   uint32323232 x7 += y3
# asm 1: paddd <y3=int6464#6,<x7=int6464#2
# asm 2: paddd <y3=%xmm5,<x7=%xmm1
paddd %xmm5,%xmm1

# qhasm:   x2 = y3
# asm 1: movdqa <y3=int6464#6,>x2=int6464#7
# asm 2: movdqa <y3=%xmm5,>x2=%xmm6
movdqa %xmm5,%xmm6

# qhasm:   x3 = y2
# asm 1: movdqa <y2=int6464#5,>x3=int6464#8
# asm 2: movdqa <y2=%xmm4,>x3=%xmm7
movdqa %xmm4,%xmm7

# qhasm:   uint32323232 x2 <<= 11
# asm 1: pslld $11,<x2=int6464#7
# asm 2: pslld $11,<x2=%xmm6
pslld $11,%xmm6

# qhasm:   uint32323232 x3 <<= 11
# asm 1: pslld $11,<x3=int6464#8
# asm 2: pslld $11,<x3=%xmm7
pslld $11,%xmm7

# qhasm:   uint32323232 y2 >>= 21
# asm 1: psrld $21,<y2=int6464#5
# asm 2: psrld $21,<y2=%xmm4
psrld $21,%xmm4

# qhasm:   uint32323232 y3 >>= 21
# asm 1: psrld $21,<y3=int6464#6
# asm 2: psrld $21,<y3=%xmm5
psrld $21,%xmm5

# qhasm:   x2 ^= x6
# asm 1: pxor  <x6=int6464#1,<x2=int6464#7
# asm 2: pxor  <x6=%xmm0,<x2=%xmm6
pxor  %xmm0,%xmm6

# qhasm:   x3 ^= x7
# asm 1: pxor  <x7=int6464#2,<x3=int6464#8
# asm 2: pxor  <x7=%xmm1,<x3=%xmm7
pxor  %xmm1,%xmm7

# qhasm:   x2 ^= y3
# asm 1: pxor  <y3=int6464#6,<x2=int6464#7
# asm 2: pxor  <y3=%xmm5,<x2=%xmm6
pxor  %xmm5,%xmm6

# qhasm:   x3 ^= y2
# asm 1: pxor  <y2=int6464#5,<x3=int6464#8
# asm 2: pxor  <y2=%xmm4,<x3=%xmm7
pxor  %xmm4,%xmm7

# qhasm:   x6 = x6[1,0,3,2]
# asm 1: pshufd $0xb1,<x6=int6464#1,>x6=int6464#1
# asm 2: pshufd $0xb1,<x6=%xmm0,>x6=%xmm0
pshufd $0xb1,%xmm0,%xmm0

# qhasm:   x7 = x7[1,0,3,2]
# asm 1: pshufd $0xb1,<x7=int6464#2,>x7=int6464#2
# asm 2: pshufd $0xb1,<x7=%xmm1,>x7=%xmm1
pshufd $0xb1,%xmm1,%xmm1

# qhasm:   x6_stack = x6
# asm 1: movdqa <x6=int6464#1,>x6_stack=stack128#5
# asm 2: movdqa <x6=%xmm0,>x6_stack=96(%esp)
movdqa %xmm0,96(%esp)

# qhasm:   x7_stack = x7
# asm 1: movdqa <x7=int6464#2,>x7_stack=stack128#3
# asm 2: movdqa <x7=%xmm1,>x7_stack=64(%esp)
movdqa %xmm1,64(%esp)

# qhasm:   x4 = x4_stack
# asm 1: movdqa <x4_stack=stack128#4,>x4=int6464#1
# asm 2: movdqa <x4_stack=80(%esp),>x4=%xmm0
movdqa 80(%esp),%xmm0

# qhasm:   x5 = x5_stack
# asm 1: movdqa <x5_stack=stack128#2,>x5=int6464#2
# asm 2: movdqa <x5_stack=48(%esp),>x5=%xmm1
movdqa 48(%esp),%xmm1

# qhasm:   uint32323232 x4 += y0
# asm 1: paddd <y0=int6464#3,<x4=int6464#1
# asm 2: paddd <y0=%xmm2,<x4=%xmm0
paddd %xmm2,%xmm0

# qhasm:   uint32323232 x5 += y1
# asm 1: paddd <y1=int6464#4,<x5=int6464#2
# asm 2: paddd <y1=%xmm3,<x5=%xmm1
paddd %xmm3,%xmm1

# qhasm:   x0 = y1
# asm 1: movdqa <y1=int6464#4,>x0=int6464#5
# asm 2: movdqa <y1=%xmm3,>x0=%xmm4
movdqa %xmm3,%xmm4

# qhasm:   x1 = y0
# asm 1: movdqa <y0=int6464#3,>x1=int6464#6
# asm 2: movdqa <y0=%xmm2,>x1=%xmm5
movdqa %xmm2,%xmm5

# qhasm:   uint32323232 x0 <<= 11
# asm 1: pslld $11,<x0=int6464#5
# asm 2: pslld $11,<x0=%xmm4
pslld $11,%xmm4

# qhasm:   uint32323232 x1 <<= 11
# asm 1: pslld $11,<x1=int6464#6
# asm 2: pslld $11,<x1=%xmm5
pslld $11,%xmm5

# qhasm:   uint32323232 y0 >>= 21
# asm 1: psrld $21,<y0=int6464#3
# asm 2: psrld $21,<y0=%xmm2
psrld $21,%xmm2

# qhasm:   uint32323232 y1 >>= 21
# asm 1: psrld $21,<y1=int6464#4
# asm 2: psrld $21,<y1=%xmm3
psrld $21,%xmm3

# qhasm:   x0 ^= x4
# asm 1: pxor  <x4=int6464#1,<x0=int6464#5
# asm 2: pxor  <x4=%xmm0,<x0=%xmm4
pxor  %xmm0,%xmm4

# qhasm:   x1 ^= x5
# asm 1: pxor  <x5=int6464#2,<x1=int6464#6
# asm 2: pxor  <x5=%xmm1,<x1=%xmm5
pxor  %xmm1,%xmm5

# qhasm:   x0 ^= y1
# asm 1: pxor  <y1=int6464#4,<x0=int6464#5
# asm 2: pxor  <y1=%xmm3,<x0=%xmm4
pxor  %xmm3,%xmm4

# qhasm:   x1 ^= y0
# asm 1: pxor  <y0=int6464#3,<x1=int6464#6
# asm 2: pxor  <y0=%xmm2,<x1=%xmm5
pxor  %xmm2,%xmm5

# qhasm:   x4 = x4[1,0,3,2]
# asm 1: pshufd $0xb1,<x4=int6464#1,>x4=int6464#3
# asm 2: pshufd $0xb1,<x4=%xmm0,>x4=%xmm2
pshufd $0xb1,%xmm0,%xmm2

# qhasm:   x5 = x5[1,0,3,2]
# asm 1: pshufd $0xb1,<x5=int6464#2,>x5=int6464#1
# asm 2: pshufd $0xb1,<x5=%xmm1,>x5=%xmm0
pshufd $0xb1,%xmm1,%xmm0

# qhasm:   x5_stack = x5
# asm 1: movdqa <x5=int6464#1,>x5_stack=stack128#2
# asm 2: movdqa <x5=%xmm0,>x5_stack=48(%esp)
movdqa %xmm0,48(%esp)

# qhasm:   x6 = x6_stack
# asm 1: movdqa <x6_stack=stack128#5,>x6=int6464#4
# asm 2: movdqa <x6_stack=96(%esp),>x6=%xmm3
movdqa 96(%esp),%xmm3
# comment:fp stack unchanged by jump

# qhasm: goto morerounds if unsigned>
ja ._morerounds

# qhasm:                   signed<? inlen - 32
# asm 1: cmp  $32,<inlen=int32#2
# asm 2: cmp  $32,<inlen=%ecx
cmp  $32,%ecx
# comment:fp stack unchanged by jump

# qhasm: goto mainloop if !signed<
jge ._mainloop
# comment:fp stack unchanged by fallthrough

# qhasm: inlenbelow32:
._inlenbelow32:

# qhasm:                      signed<? inlen - 16
# asm 1: cmp  $16,<inlen=int32#2
# asm 2: cmp  $16,<inlen=%ecx
cmp  $16,%ecx
# comment:fp stack unchanged by jump

# qhasm: goto inlenbelow16 if signed<
jl ._inlenbelow16

# qhasm:   y0 = *(unaligned int128 *) (in + 0)
# asm 1: movdqu 0(<in=int32#5),>y0=int6464#1
# asm 2: movdqu 0(<in=%esi),>y0=%xmm0
movdqu 0(%esi),%xmm0

# qhasm:   x0 ^= y0
# asm 1: pxor  <y0=int6464#1,<x0=int6464#5
# asm 2: pxor  <y0=%xmm0,<x0=%xmm4
pxor  %xmm0,%xmm4

# qhasm:   in += 16
# asm 1: add  $16,<in=int32#5
# asm 2: add  $16,<in=%esi
add  $16,%esi

# qhasm:   inlen -= 16
# asm 1: sub  $16,<inlen=int32#2
# asm 2: sub  $16,<inlen=%ecx
sub  $16,%ecx

# qhasm:   copy = &tmp
# asm 1: leal <tmp=stack128#1,>copy=int32#6
# asm 2: leal <tmp=32(%esp),>copy=%edi
leal 32(%esp),%edi

# qhasm:   while (inlen) { *copy++ = *in++; --inlen }
rep movsb

# qhasm:   i = 128
# asm 1: mov  $128,>i=int32#2
# asm 2: mov  $128,>i=%ecx
mov  $128,%ecx

# qhasm:   *(uint8 *) (copy + 0) = i
# asm 1: movb <i=int32#2%8,0(<copy=int32#6)
# asm 2: movb <i=%cl,0(<copy=%edi)
movb %cl,0(%edi)

# qhasm:   y1 = tmp
# asm 1: movdqa <tmp=stack128#1,>y1=int6464#1
# asm 2: movdqa <tmp=32(%esp),>y1=%xmm0
movdqa 32(%esp),%xmm0

# qhasm:   x1 ^= y1
# asm 1: pxor  <y1=int6464#1,<x1=int6464#6
# asm 2: pxor  <y1=%xmm0,<x1=%xmm5
pxor  %xmm0,%xmm5

# qhasm:   r = 16
# asm 1: mov  $16,>r=int32#4
# asm 2: mov  $16,>r=%ebx
mov  $16,%ebx

# qhasm:   inlen = -1
# asm 1: mov  $-1,>inlen=int32#2
# asm 2: mov  $-1,>inlen=%ecx
mov  $-1,%ecx
# comment:fp stack unchanged by jump

# qhasm: goto morerounds
jmp ._morerounds

# qhasm: inlenbelow16:
._inlenbelow16:

# qhasm:                     signed<? inlen - 0
# asm 1: cmp  $0,<inlen=int32#2
# asm 2: cmp  $0,<inlen=%ecx
cmp  $0,%ecx
# comment:fp stack unchanged by jump

# qhasm: goto inlenbelow0 if signed<
jl ._inlenbelow0

# qhasm:   copy = &tmp
# asm 1: leal <tmp=stack128#1,>copy=int32#6
# asm 2: leal <tmp=32(%esp),>copy=%edi
leal 32(%esp),%edi

# qhasm:   while (inlen) { *copy++ = *in++; --inlen }
rep movsb

# qhasm:   i = 128
# asm 1: mov  $128,>i=int32#2
# asm 2: mov  $128,>i=%ecx
mov  $128,%ecx

# qhasm:   *(uint8 *) (copy + 0) = i
# asm 1: movb <i=int32#2%8,0(<copy=int32#6)
# asm 2: movb <i=%cl,0(<copy=%edi)
movb %cl,0(%edi)

# qhasm:   y0 = tmp
# asm 1: movdqa <tmp=stack128#1,>y0=int6464#1
# asm 2: movdqa <tmp=32(%esp),>y0=%xmm0
movdqa 32(%esp),%xmm0

# qhasm:   x0 ^= y0
# asm 1: pxor  <y0=int6464#1,<x0=int6464#5
# asm 2: pxor  <y0=%xmm0,<x0=%xmm4
pxor  %xmm0,%xmm4

# qhasm:   r = 16
# asm 1: mov  $16,>r=int32#4
# asm 2: mov  $16,>r=%ebx
mov  $16,%ebx

# qhasm:   inlen = -1
# asm 1: mov  $-1,>inlen=int32#2
# asm 2: mov  $-1,>inlen=%ecx
mov  $-1,%ecx
# comment:fp stack unchanged by jump

# qhasm: goto morerounds
jmp ._morerounds

# qhasm: inlenbelow0:
._inlenbelow0:

# qhasm:                 =? inlen + 1
# asm 1: cmp  $-1,<inlen=int32#2
# asm 2: cmp  $-1,<inlen=%ecx
cmp  $-1,%ecx
# comment:fp stack unchanged by jump

# qhasm: goto finish if !=
jne ._finish

# qhasm:   x7 = x7_stack
# asm 1: movdqa <x7_stack=stack128#3,>x7=int6464#1
# asm 2: movdqa <x7_stack=64(%esp),>x7=%xmm0
movdqa 64(%esp),%xmm0

# qhasm:   x7 ^= *(int128 *) (constants + 128)
# asm 1: pxor 128(<constants=int32#3),<x7=int6464#1
# asm 2: pxor 128(<constants=%edx),<x7=%xmm0
pxor 128(%edx),%xmm0

# qhasm:   x7_stack = x7
# asm 1: movdqa <x7=int6464#1,>x7_stack=stack128#3
# asm 2: movdqa <x7=%xmm0,>x7_stack=64(%esp)
movdqa %xmm0,64(%esp)

# qhasm:   r = 160
# asm 1: mov  $160,>r=int32#4
# asm 2: mov  $160,>r=%ebx
mov  $160,%ebx

# qhasm:   inlen = -2
# asm 1: mov  $-2,>inlen=int32#2
# asm 2: mov  $-2,>inlen=%ecx
mov  $-2,%ecx
# comment:fp stack unchanged by jump

# qhasm: goto morerounds
jmp ._morerounds

# qhasm: finish:
._finish:

# qhasm:   out = arg1
# asm 1: movl <arg1=stack32#-1,>out=int32#1
# asm 2: movl <arg1=4(%esp,%eax),>out=%eax
movl 4(%esp,%eax),%eax

# qhasm:   *(unaligned int128 *) (out + 0) = x0
# asm 1: movdqu <x0=int6464#5,0(<out=int32#1)
# asm 2: movdqu <x0=%xmm4,0(<out=%eax)
movdqu %xmm4,0(%eax)

# qhasm:   *(unaligned int128 *) (out + 16) = x1
# asm 1: movdqu <x1=int6464#6,16(<out=int32#1)
# asm 2: movdqu <x1=%xmm5,16(<out=%eax)
movdqu %xmm5,16(%eax)

# qhasm:   *(unaligned int128 *) (out + 32) = x2
# asm 1: movdqu <x2=int6464#7,32(<out=int32#1)
# asm 2: movdqu <x2=%xmm6,32(<out=%eax)
movdqu %xmm6,32(%eax)

# qhasm:   *(unaligned int128 *) (out + 48) = x3
# asm 1: movdqu <x3=int6464#8,48(<out=int32#1)
# asm 2: movdqu <x3=%xmm7,48(<out=%eax)
movdqu %xmm7,48(%eax)

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
