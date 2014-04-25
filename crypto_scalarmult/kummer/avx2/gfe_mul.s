# block pos: 0 32 uops: 10

# qhasm: int64 input_0

# qhasm: int64 input_1

# qhasm: int64 input_2

# qhasm: int64 input_3

# qhasm: int64 input_4

# qhasm: int64 input_5

# qhasm: stack64 input_6

# qhasm: stack64 input_7

# qhasm: int64 caller_r11

# qhasm: int64 caller_r12

# qhasm: int64 caller_r13

# qhasm: int64 caller_r14

# qhasm: int64 caller_r15

# qhasm: int64 caller_rbx

# qhasm: int64 caller_rbp

# qhasm: int64 x0

# qhasm: int64 x1

# qhasm: int64 r0

# qhasm: int64 r1

# qhasm: int64 r2

# qhasm: int64 r3

# qhasm: int64 rax

# qhasm: int64 rdx

# qhasm: int64 t

# qhasm: int64 mask

# qhasm: enter gfe_mul
.p2align 5
.global _gfe_mul
.global gfe_mul
_gfe_mul:
gfe_mul:
# bytes: 3 uops: 1
mov %rsp,%r11
# bytes: 4 uops: 1
and $31,%r11
# bytes: 4 uops: 1
add $0,%r11
# bytes: 3 uops: 1
sub %r11,%rsp

# qhasm:   input_2 = input_2
# asm 1: mov  <input_2=int64#3,>input_2=int64#4
# asm 2: mov  <input_2=%rdx,>input_2=%rcx
# bytes: 3 uops: 1
mov  %rdx,%rcx

# qhasm:   x0 = mem64[input_1 + 0]
# asm 1: movq   0(<input_1=int64#2),>x0=int64#5
# asm 2: movq   0(<input_1=%rsi),>x0=%r8
# bytes: 3 uops: 1
movq   0(%rsi),%r8

# qhasm:   rax = mem64[input_2 + 0]
# asm 1: movq   0(<input_2=int64#4),>rax=int64#7
# asm 2: movq   0(<input_2=%rcx),>rax=%rax
# bytes: 3 uops: 1
movq   0(%rcx),%rax

# qhasm:   (uint128) rdx rax = rax * x0
# asm 1: mul  <x0=int64#5
# asm 2: mul  <x0=%r8
# bytes: 3 uops: 1
mul  %r8

# qhasm:   r0 = rax
# asm 1: mov  <rax=int64#7,>r0=int64#6
# asm 2: mov  <rax=%rax,>r0=%r9
# bytes: 3 uops: 1
mov  %rax,%r9

# qhasm:   r1 = rdx
# asm 1: mov  <rdx=int64#3,>r1=int64#8
# asm 2: mov  <rdx=%rdx,>r1=%r10
# bytes: 3 uops: 1
mov  %rdx,%r10
# block pos: 32 64 uops: 6

# qhasm:   rax = mem64[input_2 + 8]
# asm 1: movq   8(<input_2=int64#4),>rax=int64#7
# asm 2: movq   8(<input_2=%rcx),>rax=%rax
# bytes: 4 uops: 1
movq   8(%rcx),%rax

# qhasm:   (uint128) rdx rax = rax * x0
# asm 1: mul  <x0=int64#5
# asm 2: mul  <x0=%r8
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
mul  %r8

# qhasm:   carry? r1 += rax
# asm 1: add  <rax=int64#7,<r1=int64#8
# asm 2: add  <rax=%rax,<r1=%r10
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
add  %rax,%r10

# qhasm:   r2 = 0
# asm 1: mov  $0,>r2=int64#5
# asm 2: mov  $0,>r2=%r8
# bytes: 7 uops: 1
mov  $0,%r8

# qhasm:   r2 += rdx + carry
# asm 1: adc <rdx=int64#3,<r2=int64#5
# asm 2: adc <rdx=%rdx,<r2=%r8
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
adc %rdx,%r8

# qhasm:   x1 = mem64[input_1 + 8]
# asm 1: movq   8(<input_1=int64#2),>x1=int64#2
# asm 2: movq   8(<input_1=%rsi),>x1=%rsi
# bytes: 4 uops: 1
movq   8(%rsi),%rsi
# block pos: 64 96 uops: 6

# qhasm:   rax = mem64[input_2 + 0]
# asm 1: movq   0(<input_2=int64#4),>rax=int64#7
# asm 2: movq   0(<input_2=%rcx),>rax=%rax
# bytes: 3 uops: 1
movq   0(%rcx),%rax

# qhasm:   (uint128) rdx rax = rax * x1
# asm 1: mul  <x1=int64#2
# asm 2: mul  <x1=%rsi
# bytes: 7 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
.byte 0x3e
mul  %rsi

# qhasm:   carry? r1 += rax
# asm 1: add  <rax=int64#7,<r1=int64#8
# asm 2: add  <rax=%rax,<r1=%r10
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
add  %rax,%r10

# qhasm:   r2  += rdx + carry
# asm 1: adc <rdx=int64#3,<r2=int64#5
# asm 2: adc <rdx=%rdx,<r2=%r8
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
adc %rdx,%r8

# qhasm:   rax = mem64[input_2 + 8]
# asm 1: movq   8(<input_2=int64#4),>rax=int64#7
# asm 2: movq   8(<input_2=%rcx),>rax=%rax
# bytes: 4 uops: 1
movq   8(%rcx),%rax

# qhasm:   (uint128) rdx rax = rax * x1
# asm 1: mul  <x1=int64#2
# asm 2: mul  <x1=%rsi
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
mul  %rsi
# block pos: 96 129 uops: 6

# qhasm:   carry? r2 += rax
# asm 1: add  <rax=int64#7,<r2=int64#5
# asm 2: add  <rax=%rax,<r2=%r8
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
add  %rax,%r8

# qhasm:   r3 = 0
# asm 1: mov  $0,>r3=int64#2
# asm 2: mov  $0,>r3=%rsi
# bytes: 7 uops: 1
mov  $0,%rsi

# qhasm:   r3 += rdx + carry
# asm 1: adc <rdx=int64#3,<r3=int64#2
# asm 2: adc <rdx=%rdx,<r3=%rsi
# bytes: 3 uops: 1
adc %rdx,%rsi

# qhasm:   r3 = (r3.r2) << 1
# asm 1: shld $1,<r2=int64#5,<r3=int64#2
# asm 2: shld $1,<r2=%r8,<r3=%rsi
# bytes: 5 uops: 1
shld $1,%r8,%rsi

# qhasm:   r2 = (r2.r1) << 1
# asm 1: shld $1,<r1=int64#8,<r2=int64#5
# asm 2: shld $1,<r1=%r10,<r2=%r8
# bytes: 5 uops: 1
shld $1,%r10,%r8

# qhasm:   mask = mem64[mask63]
# asm 1: movq mask63,>mask=int64#3
# asm 2: movq mask63,>mask=%rdx
# bytes: 8 uops: 1
movq mask63,%rdx
# block pos: 129 160 uops: 6

# qhasm:   r1 &= mask
# asm 1: and  <mask=int64#3,<r1=int64#8
# asm 2: and  <mask=%rdx,<r1=%r10
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
and  %rdx,%r10

# qhasm:   carry? r0 += r2
# asm 1: add  <r2=int64#5,<r0=int64#6
# asm 2: add  <r2=%r8,<r0=%r9
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
add  %r8,%r9

# qhasm:   r1 += r3 + carry
# asm 1: adc <r3=int64#2,<r1=int64#8
# asm 2: adc <r3=%rsi,<r1=%r10
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
adc %rsi,%r10

# qhasm:   t = r1
# asm 1: mov  <r1=int64#8,>t=int64#2
# asm 2: mov  <r1=%r10,>t=%rsi
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
mov  %r10,%rsi

# qhasm:   (uint64) t >>= 63
# asm 1: shr  $63,<t=int64#2
# asm 2: shr  $63,<t=%rsi
# bytes: 5 uops: 1
.byte 0x3e
shr  $63,%rsi

# qhasm:   r1 &= mask
# asm 1: and  <mask=int64#3,<r1=int64#8
# asm 2: and  <mask=%rdx,<r1=%r10
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
and  %rdx,%r10
# block pos: 160 192 uops: 6

# qhasm:   carry? r0 += t
# asm 1: add  <t=int64#2,<r0=int64#6
# asm 2: add  <t=%rsi,<r0=%r9
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
add  %rsi,%r9

# qhasm:   t = 0
# asm 1: mov  $0,>t=int64#2
# asm 2: mov  $0,>t=%rsi
# bytes: 7 uops: 1
mov  $0,%rsi

# qhasm:   r1 += t + carry
# asm 1: adc <t=int64#2,<r1=int64#8
# asm 2: adc <t=%rsi,<r1=%r10
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
adc %rsi,%r10

# qhasm:   mem64[input_0 + 0] = r0
# asm 1: movq   <r0=int64#6,0(<input_0=int64#1)
# asm 2: movq   <r0=%r9,0(<input_0=%rdi)
# bytes: 3 uops: 1
movq   %r9,0(%rdi)

# qhasm:   mem64[input_0 + 8] = r1
# asm 1: movq   <r1=int64#8,8(<input_0=int64#1)
# asm 2: movq   <r1=%r10,8(<input_0=%rdi)
# bytes: 4 uops: 1
movq   %r10,8(%rdi)

# qhasm: return
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
add %r11,%rsp
# block pos: 192 193 uops: 1
# bytes: 1 uops: 1
ret
