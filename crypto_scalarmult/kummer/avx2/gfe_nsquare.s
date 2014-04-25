# block pos: 0 32 uops: 6

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

# qhasm: stack64 stack_r11

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

# qhasm: int64 count

# qhasm: enter gfe_nsquare
.p2align 5
.global _gfe_nsquare
.global gfe_nsquare
_gfe_nsquare:
gfe_nsquare:
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
mov %rsp,%r11
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
and $31,%r11
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
add $32,%r11
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
sub %r11,%rsp

# qhasm:   stack_r11 = caller_r11
# asm 1: movq <caller_r11=int64#9,>stack_r11=stack64#1
# asm 2: movq <caller_r11=%r11,>stack_r11=0(%rsp)
# bytes: 4 uops: 1
movq %r11,0(%rsp)

# qhasm:   count = input_2
# asm 1: mov  <input_2=int64#3,>count=int64#4
# asm 2: mov  <input_2=%rdx,>count=%rcx
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
mov  %rdx,%rcx
# block pos: 32 64 uops: 6

# qhasm:   x0 = mem64[input_1 + 0]
# asm 1: movq   0(<input_1=int64#2),>x0=int64#5
# asm 2: movq   0(<input_1=%rsi),>x0=%r8
# bytes: 3 uops: 1
movq   0(%rsi),%r8

# qhasm:   x1 = mem64[input_1 + 8]
# asm 1: movq   8(<input_1=int64#2),>x1=int64#2
# asm 2: movq   8(<input_1=%rsi),>x1=%rsi
# bytes: 4 uops: 1
movq   8(%rsi),%rsi

# qhasm:   mask = mem64[mask63]
# asm 1: movq mask63,>mask=int64#6
# asm 2: movq mask63,>mask=%r9
# bytes: 8 uops: 1
movq mask63,%r9

# qhasm: loop:
._loop:

# qhasm:   rax = x0
# asm 1: mov  <x0=int64#5,>rax=int64#7
# asm 2: mov  <x0=%r8,>rax=%rax
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
mov  %r8,%rax

# qhasm:   (uint128) rdx rax = rax * x0
# asm 1: mul  <x0=int64#5
# asm 2: mul  <x0=%r8
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
mul  %r8

# qhasm:   r0 = rax
# asm 1: mov  <rax=int64#7,>r0=int64#8
# asm 2: mov  <rax=%rax,>r0=%r10
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
mov  %rax,%r10
# block pos: 64 96 uops: 6

# qhasm:   r1 = rdx
# asm 1: mov  <rdx=int64#3,>r1=int64#9
# asm 2: mov  <rdx=%rdx,>r1=%r11
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
mov  %rdx,%r11

# qhasm:   rax = x1
# asm 1: mov  <x1=int64#2,>rax=int64#7
# asm 2: mov  <x1=%rsi,>rax=%rax
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
mov  %rsi,%rax

# qhasm:   (uint128) rdx rax = rax * x0
# asm 1: mul  <x0=int64#5
# asm 2: mul  <x0=%r8
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
mul  %r8

# qhasm:   carry? r1 += rax
# asm 1: add  <rax=int64#7,<r1=int64#9
# asm 2: add  <rax=%rax,<r1=%r11
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
add  %rax,%r11

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
# block pos: 96 128 uops: 6

# qhasm:   carry? r1 += rax
# asm 1: add  <rax=int64#7,<r1=int64#9
# asm 2: add  <rax=%rax,<r1=%r11
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
add  %rax,%r11

# qhasm:   r2 += rdx + carry
# asm 1: adc <rdx=int64#3,<r2=int64#5
# asm 2: adc <rdx=%rdx,<r2=%r8
# bytes: 6 uops: 1
.byte 0x3e
.byte 0x3e
.byte 0x3e
adc %rdx,%r8

# qhasm:   rax = x1
# asm 1: mov  <x1=int64#2,>rax=int64#7
# asm 2: mov  <x1=%rsi,>rax=%rax
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
mov  %rsi,%rax

# qhasm:   (uint128) rdx rax = rax * x1
# asm 1: mul  <x1=int64#2
# asm 2: mul  <x1=%rsi
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
mul  %rsi

# qhasm:   carry? r2 += rax
# asm 1: add  <rax=int64#7,<r2=int64#5
# asm 2: add  <rax=%rax,<r2=%r8
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
add  %rax,%r8

# qhasm:   rdx += 0 + carry
# asm 1: adc $0,<rdx=int64#3
# asm 2: adc $0,<rdx=%rdx
# bytes: 5 uops: 1
.byte 0x3e
adc $0,%rdx
# block pos: 128 160 uops: 6

# qhasm:   rdx = (rdx.r2) << 1
# asm 1: shld $1,<r2=int64#5,<rdx=int64#3
# asm 2: shld $1,<r2=%r8,<rdx=%rdx
# bytes: 6 uops: 1
.byte 0x3e
shld $1,%r8,%rdx

# qhasm:   r2 = (r2.r1) << 1
# asm 1: shld $1,<r1=int64#9,<r2=int64#5
# asm 2: shld $1,<r1=%r11,<r2=%r8
# bytes: 6 uops: 1
.byte 0x3e
shld $1,%r11,%r8

# qhasm:   r1 &= mask
# asm 1: and  <mask=int64#6,<r1=int64#9
# asm 2: and  <mask=%r9,<r1=%r11
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
and  %r9,%r11

# qhasm:   carry? r0 += r2
# asm 1: add  <r2=int64#5,<r0=int64#8
# asm 2: add  <r2=%r8,<r0=%r10
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
add  %r8,%r10

# qhasm:   r1 += rdx + carry
# asm 1: adc <rdx=int64#3,<r1=int64#9
# asm 2: adc <rdx=%rdx,<r1=%r11
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
adc %rdx,%r11

# qhasm:   t = r1
# asm 1: mov  <r1=int64#9,>t=int64#2
# asm 2: mov  <r1=%r11,>t=%rsi
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
mov  %r11,%rsi
# block pos: 160 193 uops: 10

# qhasm:   (uint64) t >>= 63
# asm 1: shr  $63,<t=int64#2
# asm 2: shr  $63,<t=%rsi
# bytes: 4 uops: 1
shr  $63,%rsi

# qhasm:   r1 &= mask
# asm 1: and  <mask=int64#6,<r1=int64#9
# asm 2: and  <mask=%r9,<r1=%r11
# bytes: 3 uops: 1
and  %r9,%r11

# qhasm:   carry? r0 += t
# asm 1: add  <t=int64#2,<r0=int64#8
# asm 2: add  <t=%rsi,<r0=%r10
# bytes: 3 uops: 1
add  %rsi,%r10

# qhasm:   r1 += 0 + carry
# asm 1: adc $0,<r1=int64#9
# asm 2: adc $0,<r1=%r11
# bytes: 4 uops: 1
adc $0,%r11

# qhasm:   x0 = r0
# asm 1: mov  <r0=int64#8,>x0=int64#5
# asm 2: mov  <r0=%r10,>x0=%r8
# bytes: 3 uops: 1
mov  %r10,%r8

# qhasm:   x1 = r1
# asm 1: mov  <r1=int64#9,>x1=int64#2
# asm 2: mov  <r1=%r11,>x1=%rsi
# bytes: 3 uops: 1
mov  %r11,%rsi

# qhasm:              unsigned>? count -= 1
# asm 1: sub  $1,<count=int64#4
# asm 2: sub  $1,<count=%rcx
# bytes: 4 uops: 1
sub  $1,%rcx
# comment:fp stack unchanged by jump

# qhasm: goto loop if unsigned>
# bytes: 2 uops: 1
ja ._loop

# qhasm:   mem64[input_0 + 0] = x0
# asm 1: movq   <x0=int64#5,0(<input_0=int64#1)
# asm 2: movq   <x0=%r8,0(<input_0=%rdi)
# bytes: 3 uops: 1
movq   %r8,0(%rdi)

# qhasm:   mem64[input_0 + 8] = x1
# asm 1: movq   <x1=int64#2,8(<input_0=int64#1)
# asm 2: movq   <x1=%rsi,8(<input_0=%rdi)
# bytes: 4 uops: 1
movq   %rsi,8(%rdi)
# block pos: 193 201 uops: 3

# qhasm:   caller_r11 = stack_r11
# asm 1: movq <stack_r11=stack64#1,>caller_r11=int64#9
# asm 2: movq <stack_r11=0(%rsp),>caller_r11=%r11
# bytes: 4 uops: 1
movq 0(%rsp),%r11

# qhasm: return
# bytes: 3 uops: 1
add %r11,%rsp
# bytes: 1 uops: 1
ret
