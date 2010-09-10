
# qhasm: int64 arg1

# qhasm: int64 arg2

# qhasm: int64 arg3

# qhasm: input arg1

# qhasm: input arg2

# qhasm: input arg3

# qhasm: int64 out

# qhasm: int64 in

# qhasm: int64 inlen

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

# qhasm: int64 i

# qhasm: int64 r

# qhasm: int64 source

# qhasm: int64 copy

# qhasm: int64 constants

# qhasm: stack128 tmp

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

# qhasm: enter crypto_hash_cubehash1632_amd64avx
.text
.p2align 5
.globl _crypto_hash_cubehash1632_amd64avx
.globl crypto_hash_cubehash1632_amd64avx
_crypto_hash_cubehash1632_amd64avx:
crypto_hash_cubehash1632_amd64avx:
mov %rsp,%r11
and $31,%r11
add $32,%r11
sub %r11,%rsp

# qhasm:   out = arg1
# asm 1: mov  <arg1=int64#1,>out=int64#5
# asm 2: mov  <arg1=%rdi,>out=%r8
mov  %rdi,%r8

# qhasm:   in = arg2
# asm 1: mov  <arg2=int64#2,>in=int64#2
# asm 2: mov  <arg2=%rsi,>in=%rsi
mov  %rsi,%rsi

# qhasm:   inlen = arg3
# asm 1: mov  <arg3=int64#3,>inlen=int64#4
# asm 2: mov  <arg3=%rdx,>inlen=%rcx
mov  %rdx,%rcx

# qhasm:   y0 = 0
# asm 1: pxor   >y0=int6464#1,>y0=int6464#1
# asm 2: pxor   >y0=%xmm0,>y0=%xmm0
pxor   %xmm0,%xmm0

# qhasm:   tmp = y0
# asm 1: movdqa <y0=int6464#1,>tmp=stack128#1
# asm 2: movdqa <y0=%xmm0,>tmp=0(%rsp)
movdqa %xmm0,0(%rsp)

# qhasm:   constants = &crypto_hash_cubehash1632_amd64avx_constants
# asm 1: movq  crypto_hash_cubehash1632_amd64avx_constants@GOTPCREL(%rip),>constants=int64#3
# asm 2: movq  crypto_hash_cubehash1632_amd64avx_constants@GOTPCREL(%rip),>constants=%rdx
movq  crypto_hash_cubehash1632_amd64avx_constants@GOTPCREL(%rip),%rdx

# qhasm:   x5 = *(int128 *) (constants + 80)
# asm 1: movdqa 80(<constants=int64#3),>x5=int6464#1
# asm 2: movdqa 80(<constants=%rdx),>x5=%xmm0
movdqa 80(%rdx),%xmm0

# qhasm:   x7 = *(int128 *) (constants + 112)
# asm 1: movdqa 112(<constants=int64#3),>x7=int6464#2
# asm 2: movdqa 112(<constants=%rdx),>x7=%xmm1
movdqa 112(%rdx),%xmm1

# qhasm:   x4 = *(int128 *) (constants + 64)
# asm 1: movdqa 64(<constants=int64#3),>x4=int6464#3
# asm 2: movdqa 64(<constants=%rdx),>x4=%xmm2
movdqa 64(%rdx),%xmm2

# qhasm:   x6 = *(int128 *) (constants + 96)
# asm 1: movdqa 96(<constants=int64#3),>x6=int6464#4
# asm 2: movdqa 96(<constants=%rdx),>x6=%xmm3
movdqa 96(%rdx),%xmm3

# qhasm:   x0 = *(int128 *) (constants + 0)
# asm 1: movdqa 0(<constants=int64#3),>x0=int6464#5
# asm 2: movdqa 0(<constants=%rdx),>x0=%xmm4
movdqa 0(%rdx),%xmm4

# qhasm:   x1 = *(int128 *) (constants + 16)
# asm 1: movdqa 16(<constants=int64#3),>x1=int6464#6
# asm 2: movdqa 16(<constants=%rdx),>x1=%xmm5
movdqa 16(%rdx),%xmm5

# qhasm:   x2 = *(int128 *) (constants + 32)
# asm 1: movdqa 32(<constants=int64#3),>x2=int6464#7
# asm 2: movdqa 32(<constants=%rdx),>x2=%xmm6
movdqa 32(%rdx),%xmm6

# qhasm:   x3 = *(int128 *) (constants + 48)
# asm 1: movdqa 48(<constants=int64#3),>x3=int6464#8
# asm 2: movdqa 48(<constants=%rdx),>x3=%xmm7
movdqa 48(%rdx),%xmm7

# qhasm:                      signed<? inlen - 32
# asm 1: cmp  $32,<inlen=int64#4
# asm 2: cmp  $32,<inlen=%rcx
cmp  $32,%rcx
# comment:fp stack unchanged by jump

# qhasm: goto inlenbelow32 if signed<
jl ._inlenbelow32
# comment:fp stack unchanged by fallthrough

# qhasm: mainloop:
._mainloop:

# qhasm:   y0 = *(unaligned int128 *) (in + 0)
# asm 1: movdqu 0(<in=int64#2),>y0=int6464#9
# asm 2: movdqu 0(<in=%rsi),>y0=%xmm8
movdqu 0(%rsi),%xmm8

# qhasm:   y1 = *(unaligned int128 *) (in + 16)
# asm 1: movdqu 16(<in=int64#2),>y1=int6464#10
# asm 2: movdqu 16(<in=%rsi),>y1=%xmm9
movdqu 16(%rsi),%xmm9

# qhasm:   x0 ^= y0
# asm 1: pxor  <y0=int6464#9,<x0=int6464#5
# asm 2: pxor  <y0=%xmm8,<x0=%xmm4
pxor  %xmm8,%xmm4

# qhasm:   x1 ^= y1
# asm 1: pxor  <y1=int6464#10,<x1=int6464#6
# asm 2: pxor  <y1=%xmm9,<x1=%xmm5
pxor  %xmm9,%xmm5

# qhasm:   in += 32
# asm 1: add  $32,<in=int64#2
# asm 2: add  $32,<in=%rsi
add  $32,%rsi

# qhasm:   inlen -= 32
# asm 1: sub  $32,<inlen=int64#4
# asm 2: sub  $32,<inlen=%rcx
sub  $32,%rcx

# qhasm:   r = 16
# asm 1: mov  $16,>r=int64#1
# asm 2: mov  $16,>r=%rdi
mov  $16,%rdi
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

# qhasm:   uint32323232 y0 = x2 << 7
# asm 1: vpslld $7,<x2=int6464#7,>y0=int6464#9
# asm 2: vpslld $7,<x2=%xmm6,>y0=%xmm8
vpslld $7,%xmm6,%xmm8

# qhasm:   uint32323232 x2 >>= 25
# asm 1: psrld $25,<x2=int6464#7
# asm 2: psrld $25,<x2=%xmm6
psrld $25,%xmm6

# qhasm:   uint32323232 y2 = x0 << 7
# asm 1: vpslld $7,<x0=int6464#5,>y2=int6464#10
# asm 2: vpslld $7,<x0=%xmm4,>y2=%xmm9
vpslld $7,%xmm4,%xmm9

# qhasm:   uint32323232 x0 >>= 25
# asm 1: psrld $25,<x0=int6464#5
# asm 2: psrld $25,<x0=%xmm4
psrld $25,%xmm4

# qhasm:   y0 ^= x4
# asm 1: pxor  <x4=int6464#3,<y0=int6464#9
# asm 2: pxor  <x4=%xmm2,<y0=%xmm8
pxor  %xmm2,%xmm8

# qhasm:   y2 ^= x6
# asm 1: pxor  <x6=int6464#4,<y2=int6464#10
# asm 2: pxor  <x6=%xmm3,<y2=%xmm9
pxor  %xmm3,%xmm9

# qhasm:   y0 ^= x2
# asm 1: pxor  <x2=int6464#7,<y0=int6464#9
# asm 2: pxor  <x2=%xmm6,<y0=%xmm8
pxor  %xmm6,%xmm8

# qhasm:   y2 ^= x0
# asm 1: pxor  <x0=int6464#5,<y2=int6464#10
# asm 2: pxor  <x0=%xmm4,<y2=%xmm9
pxor  %xmm4,%xmm9

# qhasm:   x4 <<<= 64
# asm 1: pshufd $0x4e,<x4=int6464#3,<x4=int6464#3
# asm 2: pshufd $0x4e,<x4=%xmm2,<x4=%xmm2
pshufd $0x4e,%xmm2,%xmm2

# qhasm:   x6 <<<= 64
# asm 1: pshufd $0x4e,<x6=int6464#4,<x6=int6464#4
# asm 2: pshufd $0x4e,<x6=%xmm3,<x6=%xmm3
pshufd $0x4e,%xmm3,%xmm3

# qhasm:   uint32323232 x5 += x1
# asm 1: paddd <x1=int6464#6,<x5=int6464#1
# asm 2: paddd <x1=%xmm5,<x5=%xmm0
paddd %xmm5,%xmm0

# qhasm:   uint32323232 x7 += x3
# asm 1: paddd <x3=int6464#8,<x7=int6464#2
# asm 2: paddd <x3=%xmm7,<x7=%xmm1
paddd %xmm7,%xmm1

# qhasm:   uint32323232 y1 = x3 << 7
# asm 1: vpslld $7,<x3=int6464#8,>y1=int6464#5
# asm 2: vpslld $7,<x3=%xmm7,>y1=%xmm4
vpslld $7,%xmm7,%xmm4

# qhasm:   uint32323232 x3 >>= 25
# asm 1: psrld $25,<x3=int6464#8
# asm 2: psrld $25,<x3=%xmm7
psrld $25,%xmm7

# qhasm:   uint32323232 y3 = x1 << 7
# asm 1: vpslld $7,<x1=int6464#6,>y3=int6464#7
# asm 2: vpslld $7,<x1=%xmm5,>y3=%xmm6
vpslld $7,%xmm5,%xmm6

# qhasm:   uint32323232 x1 >>= 25
# asm 1: psrld $25,<x1=int6464#6
# asm 2: psrld $25,<x1=%xmm5
psrld $25,%xmm5

# qhasm:   y1 ^= x5
# asm 1: pxor  <x5=int6464#1,<y1=int6464#5
# asm 2: pxor  <x5=%xmm0,<y1=%xmm4
pxor  %xmm0,%xmm4

# qhasm:   y3 ^= x7
# asm 1: pxor  <x7=int6464#2,<y3=int6464#7
# asm 2: pxor  <x7=%xmm1,<y3=%xmm6
pxor  %xmm1,%xmm6

# qhasm:   y1 ^= x3
# asm 1: pxor  <x3=int6464#8,<y1=int6464#5
# asm 2: pxor  <x3=%xmm7,<y1=%xmm4
pxor  %xmm7,%xmm4

# qhasm:   y3 ^= x1
# asm 1: pxor  <x1=int6464#6,<y3=int6464#7
# asm 2: pxor  <x1=%xmm5,<y3=%xmm6
pxor  %xmm5,%xmm6

# qhasm:   x5 <<<= 64
# asm 1: pshufd $0x4e,<x5=int6464#1,<x5=int6464#1
# asm 2: pshufd $0x4e,<x5=%xmm0,<x5=%xmm0
pshufd $0x4e,%xmm0,%xmm0

# qhasm:   x7 <<<= 64
# asm 1: pshufd $0x4e,<x7=int6464#2,<x7=int6464#2
# asm 2: pshufd $0x4e,<x7=%xmm1,<x7=%xmm1
pshufd $0x4e,%xmm1,%xmm1

# qhasm:   uint32323232 x6 += y2
# asm 1: paddd <y2=int6464#10,<x6=int6464#4
# asm 2: paddd <y2=%xmm9,<x6=%xmm3
paddd %xmm9,%xmm3

# qhasm:   uint32323232 x7 += y3
# asm 1: paddd <y3=int6464#7,<x7=int6464#2
# asm 2: paddd <y3=%xmm6,<x7=%xmm1
paddd %xmm6,%xmm1

# qhasm:   uint32323232 x2 = y3 << 11
# asm 1: vpslld $11,<y3=int6464#7,>x2=int6464#6
# asm 2: vpslld $11,<y3=%xmm6,>x2=%xmm5
vpslld $11,%xmm6,%xmm5

# qhasm:   uint32323232 x3 = y2 << 11
# asm 1: vpslld $11,<y2=int6464#10,>x3=int6464#8
# asm 2: vpslld $11,<y2=%xmm9,>x3=%xmm7
vpslld $11,%xmm9,%xmm7

# qhasm:   uint32323232 y2 >>= 21
# asm 1: psrld $21,<y2=int6464#10
# asm 2: psrld $21,<y2=%xmm9
psrld $21,%xmm9

# qhasm:   uint32323232 y3 >>= 21
# asm 1: psrld $21,<y3=int6464#7
# asm 2: psrld $21,<y3=%xmm6
psrld $21,%xmm6

# qhasm:   x2 ^= x6
# asm 1: pxor  <x6=int6464#4,<x2=int6464#6
# asm 2: pxor  <x6=%xmm3,<x2=%xmm5
pxor  %xmm3,%xmm5

# qhasm:   x3 ^= x7
# asm 1: pxor  <x7=int6464#2,<x3=int6464#8
# asm 2: pxor  <x7=%xmm1,<x3=%xmm7
pxor  %xmm1,%xmm7

# qhasm:   x2 ^= y3
# asm 1: pxor  <y3=int6464#7,<x2=int6464#6
# asm 2: pxor  <y3=%xmm6,<x2=%xmm5
pxor  %xmm6,%xmm5

# qhasm:   x3 ^= y2
# asm 1: pxor  <y2=int6464#10,<x3=int6464#8
# asm 2: pxor  <y2=%xmm9,<x3=%xmm7
pxor  %xmm9,%xmm7

# qhasm:   x6 = x6[1,0,3,2]
# asm 1: pshufd $0xb1,<x6=int6464#4,>x6=int6464#4
# asm 2: pshufd $0xb1,<x6=%xmm3,>x6=%xmm3
pshufd $0xb1,%xmm3,%xmm3

# qhasm:   x7 = x7[1,0,3,2]
# asm 1: pshufd $0xb1,<x7=int6464#2,>x7=int6464#2
# asm 2: pshufd $0xb1,<x7=%xmm1,>x7=%xmm1
pshufd $0xb1,%xmm1,%xmm1

# qhasm:   uint32323232 x4 += y0
# asm 1: paddd <y0=int6464#9,<x4=int6464#3
# asm 2: paddd <y0=%xmm8,<x4=%xmm2
paddd %xmm8,%xmm2

# qhasm:   uint32323232 x5 += y1
# asm 1: paddd <y1=int6464#5,<x5=int6464#1
# asm 2: paddd <y1=%xmm4,<x5=%xmm0
paddd %xmm4,%xmm0

# qhasm:   uint32323232 x0 = y1 << 11
# asm 1: vpslld $11,<y1=int6464#5,>x0=int6464#7
# asm 2: vpslld $11,<y1=%xmm4,>x0=%xmm6
vpslld $11,%xmm4,%xmm6

# qhasm:   uint32323232 x1 = y0 << 11
# asm 1: vpslld $11,<y0=int6464#9,>x1=int6464#10
# asm 2: vpslld $11,<y0=%xmm8,>x1=%xmm9
vpslld $11,%xmm8,%xmm9

# qhasm:   uint32323232 y0 >>= 21
# asm 1: psrld $21,<y0=int6464#9
# asm 2: psrld $21,<y0=%xmm8
psrld $21,%xmm8

# qhasm:   uint32323232 y1 >>= 21
# asm 1: psrld $21,<y1=int6464#5
# asm 2: psrld $21,<y1=%xmm4
psrld $21,%xmm4

# qhasm:   x0 ^= x4
# asm 1: pxor  <x4=int6464#3,<x0=int6464#7
# asm 2: pxor  <x4=%xmm2,<x0=%xmm6
pxor  %xmm2,%xmm6

# qhasm:   x1 ^= x5
# asm 1: pxor  <x5=int6464#1,<x1=int6464#10
# asm 2: pxor  <x5=%xmm0,<x1=%xmm9
pxor  %xmm0,%xmm9

# qhasm:   x0 ^= y1
# asm 1: pxor  <y1=int6464#5,<x0=int6464#7
# asm 2: pxor  <y1=%xmm4,<x0=%xmm6
pxor  %xmm4,%xmm6

# qhasm:   x1 ^= y0
# asm 1: pxor  <y0=int6464#9,<x1=int6464#10
# asm 2: pxor  <y0=%xmm8,<x1=%xmm9
pxor  %xmm8,%xmm9

# qhasm:   x4 = x4[1,0,3,2]
# asm 1: pshufd $0xb1,<x4=int6464#3,>x4=int6464#3
# asm 2: pshufd $0xb1,<x4=%xmm2,>x4=%xmm2
pshufd $0xb1,%xmm2,%xmm2

# qhasm:   x5 = x5[1,0,3,2]
# asm 1: pshufd $0xb1,<x5=int6464#1,>x5=int6464#1
# asm 2: pshufd $0xb1,<x5=%xmm0,>x5=%xmm0
pshufd $0xb1,%xmm0,%xmm0

# qhasm:                    unsigned>? r -= 2
# asm 1: sub  $2,<r=int64#1
# asm 2: sub  $2,<r=%rdi
sub  $2,%rdi

# qhasm:   uint32323232 x4 += x0
# asm 1: paddd <x0=int6464#7,<x4=int6464#3
# asm 2: paddd <x0=%xmm6,<x4=%xmm2
paddd %xmm6,%xmm2

# qhasm:   uint32323232 x6 += x2
# asm 1: paddd <x2=int6464#6,<x6=int6464#4
# asm 2: paddd <x2=%xmm5,<x6=%xmm3
paddd %xmm5,%xmm3

# qhasm:   uint32323232 y0 = x2 << 7
# asm 1: vpslld $7,<x2=int6464#6,>y0=int6464#9
# asm 2: vpslld $7,<x2=%xmm5,>y0=%xmm8
vpslld $7,%xmm5,%xmm8

# qhasm:   uint32323232 x2 >>= 25
# asm 1: psrld $25,<x2=int6464#6
# asm 2: psrld $25,<x2=%xmm5
psrld $25,%xmm5

# qhasm:   uint32323232 y2 = x0 << 7
# asm 1: vpslld $7,<x0=int6464#7,>y2=int6464#5
# asm 2: vpslld $7,<x0=%xmm6,>y2=%xmm4
vpslld $7,%xmm6,%xmm4

# qhasm:   uint32323232 x0 >>= 25
# asm 1: psrld $25,<x0=int6464#7
# asm 2: psrld $25,<x0=%xmm6
psrld $25,%xmm6

# qhasm:   y0 ^= x4
# asm 1: pxor  <x4=int6464#3,<y0=int6464#9
# asm 2: pxor  <x4=%xmm2,<y0=%xmm8
pxor  %xmm2,%xmm8

# qhasm:   y2 ^= x6
# asm 1: pxor  <x6=int6464#4,<y2=int6464#5
# asm 2: pxor  <x6=%xmm3,<y2=%xmm4
pxor  %xmm3,%xmm4

# qhasm:   y0 ^= x2
# asm 1: pxor  <x2=int6464#6,<y0=int6464#9
# asm 2: pxor  <x2=%xmm5,<y0=%xmm8
pxor  %xmm5,%xmm8

# qhasm:   y2 ^= x0
# asm 1: pxor  <x0=int6464#7,<y2=int6464#5
# asm 2: pxor  <x0=%xmm6,<y2=%xmm4
pxor  %xmm6,%xmm4

# qhasm:   x4 <<<= 64
# asm 1: pshufd $0x4e,<x4=int6464#3,<x4=int6464#3
# asm 2: pshufd $0x4e,<x4=%xmm2,<x4=%xmm2
pshufd $0x4e,%xmm2,%xmm2

# qhasm:   x6 <<<= 64
# asm 1: pshufd $0x4e,<x6=int6464#4,<x6=int6464#4
# asm 2: pshufd $0x4e,<x6=%xmm3,<x6=%xmm3
pshufd $0x4e,%xmm3,%xmm3

# qhasm:   uint32323232 x5 += x1
# asm 1: paddd <x1=int6464#10,<x5=int6464#1
# asm 2: paddd <x1=%xmm9,<x5=%xmm0
paddd %xmm9,%xmm0

# qhasm:   uint32323232 x7 += x3
# asm 1: paddd <x3=int6464#8,<x7=int6464#2
# asm 2: paddd <x3=%xmm7,<x7=%xmm1
paddd %xmm7,%xmm1

# qhasm:   uint32323232 y1 = x3 << 7
# asm 1: vpslld $7,<x3=int6464#8,>y1=int6464#11
# asm 2: vpslld $7,<x3=%xmm7,>y1=%xmm10
vpslld $7,%xmm7,%xmm10

# qhasm:   uint32323232 x3 >>= 25
# asm 1: psrld $25,<x3=int6464#8
# asm 2: psrld $25,<x3=%xmm7
psrld $25,%xmm7

# qhasm:   uint32323232 y3 = x1 << 7
# asm 1: vpslld $7,<x1=int6464#10,>y3=int6464#6
# asm 2: vpslld $7,<x1=%xmm9,>y3=%xmm5
vpslld $7,%xmm9,%xmm5

# qhasm:   uint32323232 x1 >>= 25
# asm 1: psrld $25,<x1=int6464#10
# asm 2: psrld $25,<x1=%xmm9
psrld $25,%xmm9

# qhasm:   y1 ^= x5
# asm 1: pxor  <x5=int6464#1,<y1=int6464#11
# asm 2: pxor  <x5=%xmm0,<y1=%xmm10
pxor  %xmm0,%xmm10

# qhasm:   y3 ^= x7
# asm 1: pxor  <x7=int6464#2,<y3=int6464#6
# asm 2: pxor  <x7=%xmm1,<y3=%xmm5
pxor  %xmm1,%xmm5

# qhasm:   y1 ^= x3
# asm 1: pxor  <x3=int6464#8,<y1=int6464#11
# asm 2: pxor  <x3=%xmm7,<y1=%xmm10
pxor  %xmm7,%xmm10

# qhasm:   y3 ^= x1
# asm 1: pxor  <x1=int6464#10,<y3=int6464#6
# asm 2: pxor  <x1=%xmm9,<y3=%xmm5
pxor  %xmm9,%xmm5

# qhasm:   x5 <<<= 64
# asm 1: pshufd $0x4e,<x5=int6464#1,<x5=int6464#1
# asm 2: pshufd $0x4e,<x5=%xmm0,<x5=%xmm0
pshufd $0x4e,%xmm0,%xmm0

# qhasm:   x7 <<<= 64
# asm 1: pshufd $0x4e,<x7=int6464#2,<x7=int6464#2
# asm 2: pshufd $0x4e,<x7=%xmm1,<x7=%xmm1
pshufd $0x4e,%xmm1,%xmm1

# qhasm:   uint32323232 x6 += y2
# asm 1: paddd <y2=int6464#5,<x6=int6464#4
# asm 2: paddd <y2=%xmm4,<x6=%xmm3
paddd %xmm4,%xmm3

# qhasm:   uint32323232 x7 += y3
# asm 1: paddd <y3=int6464#6,<x7=int6464#2
# asm 2: paddd <y3=%xmm5,<x7=%xmm1
paddd %xmm5,%xmm1

# qhasm:   uint32323232 x2 = y3 << 11
# asm 1: vpslld $11,<y3=int6464#6,>x2=int6464#7
# asm 2: vpslld $11,<y3=%xmm5,>x2=%xmm6
vpslld $11,%xmm5,%xmm6

# qhasm:   uint32323232 x3 = y2 << 11
# asm 1: vpslld $11,<y2=int6464#5,>x3=int6464#8
# asm 2: vpslld $11,<y2=%xmm4,>x3=%xmm7
vpslld $11,%xmm4,%xmm7

# qhasm:   uint32323232 y2 >>= 21
# asm 1: psrld $21,<y2=int6464#5
# asm 2: psrld $21,<y2=%xmm4
psrld $21,%xmm4

# qhasm:   uint32323232 y3 >>= 21
# asm 1: psrld $21,<y3=int6464#6
# asm 2: psrld $21,<y3=%xmm5
psrld $21,%xmm5

# qhasm:   x2 ^= x6
# asm 1: pxor  <x6=int6464#4,<x2=int6464#7
# asm 2: pxor  <x6=%xmm3,<x2=%xmm6
pxor  %xmm3,%xmm6

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
# asm 1: pshufd $0xb1,<x6=int6464#4,>x6=int6464#4
# asm 2: pshufd $0xb1,<x6=%xmm3,>x6=%xmm3
pshufd $0xb1,%xmm3,%xmm3

# qhasm:   x7 = x7[1,0,3,2]
# asm 1: pshufd $0xb1,<x7=int6464#2,>x7=int6464#2
# asm 2: pshufd $0xb1,<x7=%xmm1,>x7=%xmm1
pshufd $0xb1,%xmm1,%xmm1

# qhasm:   uint32323232 x4 += y0
# asm 1: paddd <y0=int6464#9,<x4=int6464#3
# asm 2: paddd <y0=%xmm8,<x4=%xmm2
paddd %xmm8,%xmm2

# qhasm:   uint32323232 x5 += y1
# asm 1: paddd <y1=int6464#11,<x5=int6464#1
# asm 2: paddd <y1=%xmm10,<x5=%xmm0
paddd %xmm10,%xmm0

# qhasm:   uint32323232 x0 = y1 << 11
# asm 1: vpslld $11,<y1=int6464#11,>x0=int6464#5
# asm 2: vpslld $11,<y1=%xmm10,>x0=%xmm4
vpslld $11,%xmm10,%xmm4

# qhasm:   uint32323232 x1 = y0 << 11
# asm 1: vpslld $11,<y0=int6464#9,>x1=int6464#6
# asm 2: vpslld $11,<y0=%xmm8,>x1=%xmm5
vpslld $11,%xmm8,%xmm5

# qhasm:   uint32323232 y0 >>= 21
# asm 1: psrld $21,<y0=int6464#9
# asm 2: psrld $21,<y0=%xmm8
psrld $21,%xmm8

# qhasm:   uint32323232 y1 >>= 21
# asm 1: psrld $21,<y1=int6464#11
# asm 2: psrld $21,<y1=%xmm10
psrld $21,%xmm10

# qhasm:   x0 ^= x4
# asm 1: pxor  <x4=int6464#3,<x0=int6464#5
# asm 2: pxor  <x4=%xmm2,<x0=%xmm4
pxor  %xmm2,%xmm4

# qhasm:   x1 ^= x5
# asm 1: pxor  <x5=int6464#1,<x1=int6464#6
# asm 2: pxor  <x5=%xmm0,<x1=%xmm5
pxor  %xmm0,%xmm5

# qhasm:   x0 ^= y1
# asm 1: pxor  <y1=int6464#11,<x0=int6464#5
# asm 2: pxor  <y1=%xmm10,<x0=%xmm4
pxor  %xmm10,%xmm4

# qhasm:   x1 ^= y0
# asm 1: pxor  <y0=int6464#9,<x1=int6464#6
# asm 2: pxor  <y0=%xmm8,<x1=%xmm5
pxor  %xmm8,%xmm5

# qhasm:   x4 = x4[1,0,3,2]
# asm 1: pshufd $0xb1,<x4=int6464#3,>x4=int6464#3
# asm 2: pshufd $0xb1,<x4=%xmm2,>x4=%xmm2
pshufd $0xb1,%xmm2,%xmm2

# qhasm:   x5 = x5[1,0,3,2]
# asm 1: pshufd $0xb1,<x5=int6464#1,>x5=int6464#1
# asm 2: pshufd $0xb1,<x5=%xmm0,>x5=%xmm0
pshufd $0xb1,%xmm0,%xmm0
# comment:fp stack unchanged by jump

# qhasm: goto morerounds if unsigned>
ja ._morerounds

# qhasm:                   signed<? inlen - 32
# asm 1: cmp  $32,<inlen=int64#4
# asm 2: cmp  $32,<inlen=%rcx
cmp  $32,%rcx
# comment:fp stack unchanged by jump

# qhasm: goto mainloop if !signed<
jge ._mainloop
# comment:fp stack unchanged by fallthrough

# qhasm: inlenbelow32:
._inlenbelow32:

# qhasm:                      signed<? inlen - 16
# asm 1: cmp  $16,<inlen=int64#4
# asm 2: cmp  $16,<inlen=%rcx
cmp  $16,%rcx
# comment:fp stack unchanged by jump

# qhasm: goto inlenbelow16 if signed<
jl ._inlenbelow16

# qhasm:   y0 = *(unaligned int128 *) (in + 0)
# asm 1: movdqu 0(<in=int64#2),>y0=int6464#9
# asm 2: movdqu 0(<in=%rsi),>y0=%xmm8
movdqu 0(%rsi),%xmm8

# qhasm:   x0 ^= y0
# asm 1: pxor  <y0=int6464#9,<x0=int6464#5
# asm 2: pxor  <y0=%xmm8,<x0=%xmm4
pxor  %xmm8,%xmm4

# qhasm:   in += 16
# asm 1: add  $16,<in=int64#2
# asm 2: add  $16,<in=%rsi
add  $16,%rsi

# qhasm:   inlen -= 16
# asm 1: sub  $16,<inlen=int64#4
# asm 2: sub  $16,<inlen=%rcx
sub  $16,%rcx

# qhasm:   copy = &tmp
# asm 1: leaq <tmp=stack128#1,>copy=int64#1
# asm 2: leaq <tmp=0(%rsp),>copy=%rdi
leaq 0(%rsp),%rdi

# qhasm:   while (inlen) { *copy++ = *in++; --inlen }
rep movsb

# qhasm:   i = 128
# asm 1: mov  $128,>i=int64#4
# asm 2: mov  $128,>i=%rcx
mov  $128,%rcx

# qhasm:   *(uint8 *) (copy + 0) = i
# asm 1: movb   <i=int64#4b,0(<copy=int64#1)
# asm 2: movb   <i=%cl,0(<copy=%rdi)
movb   %cl,0(%rdi)

# qhasm:   y1 = tmp
# asm 1: movdqa <tmp=stack128#1,>y1=int6464#9
# asm 2: movdqa <tmp=0(%rsp),>y1=%xmm8
movdqa 0(%rsp),%xmm8

# qhasm:   x1 ^= y1
# asm 1: pxor  <y1=int6464#9,<x1=int6464#6
# asm 2: pxor  <y1=%xmm8,<x1=%xmm5
pxor  %xmm8,%xmm5

# qhasm:   r = 16
# asm 1: mov  $16,>r=int64#1
# asm 2: mov  $16,>r=%rdi
mov  $16,%rdi

# qhasm:   inlen = -1
# asm 1: mov  $-1,>inlen=int64#4
# asm 2: mov  $-1,>inlen=%rcx
mov  $-1,%rcx
# comment:fp stack unchanged by jump

# qhasm: goto morerounds
jmp ._morerounds

# qhasm: inlenbelow16:
._inlenbelow16:

# qhasm:                     signed<? inlen - 0
# asm 1: cmp  $0,<inlen=int64#4
# asm 2: cmp  $0,<inlen=%rcx
cmp  $0,%rcx
# comment:fp stack unchanged by jump

# qhasm: goto inlenbelow0 if signed<
jl ._inlenbelow0

# qhasm:   copy = &tmp
# asm 1: leaq <tmp=stack128#1,>copy=int64#1
# asm 2: leaq <tmp=0(%rsp),>copy=%rdi
leaq 0(%rsp),%rdi

# qhasm:   while (inlen) { *copy++ = *in++; --inlen }
rep movsb

# qhasm:   i = 128
# asm 1: mov  $128,>i=int64#4
# asm 2: mov  $128,>i=%rcx
mov  $128,%rcx

# qhasm:   *(uint8 *) (copy + 0) = i
# asm 1: movb   <i=int64#4b,0(<copy=int64#1)
# asm 2: movb   <i=%cl,0(<copy=%rdi)
movb   %cl,0(%rdi)

# qhasm:   y0 = tmp
# asm 1: movdqa <tmp=stack128#1,>y0=int6464#9
# asm 2: movdqa <tmp=0(%rsp),>y0=%xmm8
movdqa 0(%rsp),%xmm8

# qhasm:   x0 ^= y0
# asm 1: pxor  <y0=int6464#9,<x0=int6464#5
# asm 2: pxor  <y0=%xmm8,<x0=%xmm4
pxor  %xmm8,%xmm4

# qhasm:   r = 16
# asm 1: mov  $16,>r=int64#1
# asm 2: mov  $16,>r=%rdi
mov  $16,%rdi

# qhasm:   inlen = -1
# asm 1: mov  $-1,>inlen=int64#4
# asm 2: mov  $-1,>inlen=%rcx
mov  $-1,%rcx
# comment:fp stack unchanged by jump

# qhasm: goto morerounds
jmp ._morerounds

# qhasm: inlenbelow0:
._inlenbelow0:

# qhasm:                 =? inlen + 1
# asm 1: cmp  $-1,<inlen=int64#4
# asm 2: cmp  $-1,<inlen=%rcx
cmp  $-1,%rcx
# comment:fp stack unchanged by jump

# qhasm: goto finish if !=
jne ._finish

# qhasm:   x7 ^= *(int128 *) (constants + 128)
# asm 1: pxor 128(<constants=int64#3),<x7=int6464#2
# asm 2: pxor 128(<constants=%rdx),<x7=%xmm1
pxor 128(%rdx),%xmm1

# qhasm:   r = 160
# asm 1: mov  $160,>r=int64#1
# asm 2: mov  $160,>r=%rdi
mov  $160,%rdi

# qhasm:   inlen = -2
# asm 1: mov  $-2,>inlen=int64#4
# asm 2: mov  $-2,>inlen=%rcx
mov  $-2,%rcx
# comment:fp stack unchanged by jump

# qhasm: goto morerounds
jmp ._morerounds

# qhasm: finish:
._finish:

# qhasm:   *(unaligned int128 *) (out + 0) = x0
# asm 1: movdqu <x0=int6464#5,0(<out=int64#5)
# asm 2: movdqu <x0=%xmm4,0(<out=%r8)
movdqu %xmm4,0(%r8)

# qhasm:   *(unaligned int128 *) (out + 16) = x1
# asm 1: movdqu <x1=int6464#6,16(<out=int64#5)
# asm 2: movdqu <x1=%xmm5,16(<out=%r8)
movdqu %xmm5,16(%r8)

# qhasm:   *(unaligned int128 *) (out + 32) = x2
# asm 1: movdqu <x2=int6464#7,32(<out=int64#5)
# asm 2: movdqu <x2=%xmm6,32(<out=%r8)
movdqu %xmm6,32(%r8)

# qhasm:   *(unaligned int128 *) (out + 48) = x3
# asm 1: movdqu <x3=int6464#8,48(<out=int64#5)
# asm 2: movdqu <x3=%xmm7,48(<out=%r8)
movdqu %xmm7,48(%r8)

# qhasm: leave
add %r11,%rsp
xor %rax,%rax
xor %rdx,%rdx
ret
