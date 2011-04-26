
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

# qhasm: int64 a

# qhasm: int64 b

# qhasm: int64 c

# qhasm: int64 d

# qhasm: int64 loader

# qhasm: int64 arith

# qhasm: int64 ha

# qhasm: int64 hb

# qhasm: int64 hc

# qhasm: int64 hd

# qhasm: int64 state

# qhasm: int64 in

# qhasm: int64 inlen

# qhasm: enter crypto_hashblocks_md5_amd64_1
.text
.p2align 5
.globl _crypto_hashblocks_md5_amd64_1
.globl crypto_hashblocks_md5_amd64_1
_crypto_hashblocks_md5_amd64_1:
crypto_hashblocks_md5_amd64_1:
mov %rsp,%r11
and $31,%r11
add $64,%r11
sub %r11,%rsp

# qhasm: input state

# qhasm: input in

# qhasm: input inlen

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

# qhasm: a = *(uint32 *) (state + 0)
# asm 1: movl   0(<state=int64#1),>a=int64#4d
# asm 2: movl   0(<state=%rdi),>a=%ecx
movl   0(%rdi),%ecx

# qhasm: b = *(uint32 *) (state + 4)
# asm 1: movl   4(<state=int64#1),>b=int64#5d
# asm 2: movl   4(<state=%rdi),>b=%r8d
movl   4(%rdi),%r8d

# qhasm: c = *(uint32 *) (state + 8)
# asm 1: movl   8(<state=int64#1),>c=int64#6d
# asm 2: movl   8(<state=%rdi),>c=%r9d
movl   8(%rdi),%r9d

# qhasm: d = *(uint32 *) (state + 12)
# asm 1: movl   12(<state=int64#1),>d=int64#7d
# asm 2: movl   12(<state=%rdi),>d=%eax
movl   12(%rdi),%eax

# qhasm:              unsigned<? inlen - 64
# asm 1: cmp  $64,<inlen=int64#3
# asm 2: cmp  $64,<inlen=%rdx
cmp  $64,%rdx
# comment:fp stack unchanged by jump

# qhasm: goto done if unsigned<
jb ._done

# qhasm: mainloop:
._mainloop:

# qhasm:   loader = *(uint32 *) (in + 0)
# asm 1: movl   0(<in=int64#2),>loader=int64#8d
# asm 2: movl   0(<in=%rsi),>loader=%r10d
movl   0(%rsi),%r10d

# qhasm:   arith = c
# asm 1: mov  <c=int64#6,>arith=int64#9
# asm 2: mov  <c=%r9,>arith=%r11
mov  %r9,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   arith &= b
# asm 1: and  <b=int64#5,<arith=int64#9
# asm 2: and  <b=%r8,<arith=%r11
and  %r8,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm: ha = a
# asm 1: mov  <a=int64#4,>ha=int64#10
# asm 2: mov  <a=%rcx,>ha=%r12
mov  %rcx,%r12

# qhasm:   a += loader + 0xd76aa478
# asm 1: lea  0xd76aa478(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0xd76aa478(<a=%rcx,<loader=%r10),>a=%rcx
lea  0xd76aa478(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 7
# asm 1: rol  $7,<a=int64#4d
# asm 2: rol  $7,<a=%ecx
rol  $7,%ecx

# qhasm:     arith = b
# asm 1: mov  <b=int64#5,>arith=int64#8
# asm 2: mov  <b=%r8,>arith=%r10
mov  %r8,%r10

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#8
# asm 2: xor  <c=%r9,<arith=%r10
xor  %r9,%r10

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 4)
# asm 1: movl   4(<in=int64#2),>loader=int64#9d
# asm 2: movl   4(<in=%rsi),>loader=%r11d
movl   4(%rsi),%r11d

# qhasm:     arith &= a
# asm 1: and  <a=int64#4,<arith=int64#8
# asm 2: and  <a=%rcx,<arith=%r10
and  %rcx,%r10

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#8
# asm 2: xor  <c=%r9,<arith=%r10
xor  %r9,%r10

# qhasm: hd = d
# asm 1: mov  <d=int64#7,>hd=int64#11
# asm 2: mov  <d=%rax,>hd=%r13
mov  %rax,%r13

# qhasm:     d += loader + 0xe8c7b756
# asm 1: lea  0xe8c7b756(<d=int64#7,<loader=int64#9),>d=int64#7
# asm 2: lea  0xe8c7b756(<d=%rax,<loader=%r11),>d=%rax
lea  0xe8c7b756(%rax,%r11),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#8,<d=int64#7
# asm 2: add  <arith=%r10,<d=%rax
add  %r10,%rax

# qhasm:     (uint32) d <<<= 12
# asm 1: rol  $12,<d=int64#7d
# asm 2: rol  $12,<d=%eax
rol  $12,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 8)
# asm 1: movl   8(<in=int64#2),>loader=int64#8d
# asm 2: movl   8(<in=%rsi),>loader=%r10d
movl   8(%rsi),%r10d

# qhasm:   arith = a
# asm 1: mov  <a=int64#4,>arith=int64#9
# asm 2: mov  <a=%rcx,>arith=%r11
mov  %rcx,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   arith &= d
# asm 1: and  <d=int64#7,<arith=int64#9
# asm 2: and  <d=%rax,<arith=%r11
and  %rax,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm: hc = c
# asm 1: mov  <c=int64#6,>hc=int64#12
# asm 2: mov  <c=%r9,>hc=%r14
mov  %r9,%r14

# qhasm:   c += loader + 0x242070db
# asm 1: lea  0x242070db(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0x242070db(<c=%r9,<loader=%r10),>c=%r9
lea  0x242070db(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 17
# asm 1: rol  $17,<c=int64#6d
# asm 2: rol  $17,<c=%r9d
rol  $17,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 12)
# asm 1: movl   12(<in=int64#2),>loader=int64#8d
# asm 2: movl   12(<in=%rsi),>loader=%r10d
movl   12(%rsi),%r10d

# qhasm:     arith = d
# asm 1: mov  <d=int64#7,>arith=int64#9
# asm 2: mov  <d=%rax,>arith=%r11
mov  %rax,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     arith &= c
# asm 1: and  <c=int64#6,<arith=int64#9
# asm 2: and  <c=%r9,<arith=%r11
and  %r9,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm: hb = b
# asm 1: mov  <b=int64#5,>hb=int64#13
# asm 2: mov  <b=%r8,>hb=%r15
mov  %r8,%r15

# qhasm:     b += loader + 0xc1bdceee
# asm 1: lea  0xc1bdceee(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0xc1bdceee(<b=%r8,<loader=%r10),>b=%r8
lea  0xc1bdceee(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 22
# asm 1: rol  $22,<b=int64#5d
# asm 2: rol  $22,<b=%r8d
rol  $22,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 16)
# asm 1: movl   16(<in=int64#2),>loader=int64#8d
# asm 2: movl   16(<in=%rsi),>loader=%r10d
movl   16(%rsi),%r10d

# qhasm:   arith = c
# asm 1: mov  <c=int64#6,>arith=int64#9
# asm 2: mov  <c=%r9,>arith=%r11
mov  %r9,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   arith &= b
# asm 1: and  <b=int64#5,<arith=int64#9
# asm 2: and  <b=%r8,<arith=%r11
and  %r8,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   a += loader + 0xf57c0faf
# asm 1: lea  0xf57c0faf(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0xf57c0faf(<a=%rcx,<loader=%r10),>a=%rcx
lea  0xf57c0faf(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 7
# asm 1: rol  $7,<a=int64#4d
# asm 2: rol  $7,<a=%ecx
rol  $7,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 20)
# asm 1: movl   20(<in=int64#2),>loader=int64#8d
# asm 2: movl   20(<in=%rsi),>loader=%r10d
movl   20(%rsi),%r10d

# qhasm:     arith = b
# asm 1: mov  <b=int64#5,>arith=int64#9
# asm 2: mov  <b=%r8,>arith=%r11
mov  %r8,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     arith &= a
# asm 1: and  <a=int64#4,<arith=int64#9
# asm 2: and  <a=%rcx,<arith=%r11
and  %rcx,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     d += loader + 0x4787c62a
# asm 1: lea  0x4787c62a(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0x4787c62a(<d=%rax,<loader=%r10),>d=%rax
lea  0x4787c62a(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 12
# asm 1: rol  $12,<d=int64#7d
# asm 2: rol  $12,<d=%eax
rol  $12,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 24)
# asm 1: movl   24(<in=int64#2),>loader=int64#8d
# asm 2: movl   24(<in=%rsi),>loader=%r10d
movl   24(%rsi),%r10d

# qhasm:   arith = a
# asm 1: mov  <a=int64#4,>arith=int64#9
# asm 2: mov  <a=%rcx,>arith=%r11
mov  %rcx,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   arith &= d
# asm 1: and  <d=int64#7,<arith=int64#9
# asm 2: and  <d=%rax,<arith=%r11
and  %rax,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   c += loader + 0xa8304613
# asm 1: lea  0xa8304613(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0xa8304613(<c=%r9,<loader=%r10),>c=%r9
lea  0xa8304613(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 17
# asm 1: rol  $17,<c=int64#6d
# asm 2: rol  $17,<c=%r9d
rol  $17,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 28)
# asm 1: movl   28(<in=int64#2),>loader=int64#8d
# asm 2: movl   28(<in=%rsi),>loader=%r10d
movl   28(%rsi),%r10d

# qhasm:     arith = d
# asm 1: mov  <d=int64#7,>arith=int64#9
# asm 2: mov  <d=%rax,>arith=%r11
mov  %rax,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     arith &= c
# asm 1: and  <c=int64#6,<arith=int64#9
# asm 2: and  <c=%r9,<arith=%r11
and  %r9,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     b += loader + 0xfd469501
# asm 1: lea  0xfd469501(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0xfd469501(<b=%r8,<loader=%r10),>b=%r8
lea  0xfd469501(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 22
# asm 1: rol  $22,<b=int64#5d
# asm 2: rol  $22,<b=%r8d
rol  $22,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 32)
# asm 1: movl   32(<in=int64#2),>loader=int64#8d
# asm 2: movl   32(<in=%rsi),>loader=%r10d
movl   32(%rsi),%r10d

# qhasm:   arith = c
# asm 1: mov  <c=int64#6,>arith=int64#9
# asm 2: mov  <c=%r9,>arith=%r11
mov  %r9,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   arith &= b
# asm 1: and  <b=int64#5,<arith=int64#9
# asm 2: and  <b=%r8,<arith=%r11
and  %r8,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   a += loader + 0x698098d8
# asm 1: lea  0x698098d8(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0x698098d8(<a=%rcx,<loader=%r10),>a=%rcx
lea  0x698098d8(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 7
# asm 1: rol  $7,<a=int64#4d
# asm 2: rol  $7,<a=%ecx
rol  $7,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 36)
# asm 1: movl   36(<in=int64#2),>loader=int64#8d
# asm 2: movl   36(<in=%rsi),>loader=%r10d
movl   36(%rsi),%r10d

# qhasm:     arith = b
# asm 1: mov  <b=int64#5,>arith=int64#9
# asm 2: mov  <b=%r8,>arith=%r11
mov  %r8,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     arith &= a
# asm 1: and  <a=int64#4,<arith=int64#9
# asm 2: and  <a=%rcx,<arith=%r11
and  %rcx,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     d += loader + 0x8b44f7af
# asm 1: lea  0x8b44f7af(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0x8b44f7af(<d=%rax,<loader=%r10),>d=%rax
lea  0x8b44f7af(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 12
# asm 1: rol  $12,<d=int64#7d
# asm 2: rol  $12,<d=%eax
rol  $12,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 40)
# asm 1: movl   40(<in=int64#2),>loader=int64#8d
# asm 2: movl   40(<in=%rsi),>loader=%r10d
movl   40(%rsi),%r10d

# qhasm:   arith = a
# asm 1: mov  <a=int64#4,>arith=int64#9
# asm 2: mov  <a=%rcx,>arith=%r11
mov  %rcx,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   arith &= d
# asm 1: and  <d=int64#7,<arith=int64#9
# asm 2: and  <d=%rax,<arith=%r11
and  %rax,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   c += loader + 0xffff5bb1
# asm 1: lea  0xffff5bb1(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0xffff5bb1(<c=%r9,<loader=%r10),>c=%r9
lea  0xffff5bb1(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 17
# asm 1: rol  $17,<c=int64#6d
# asm 2: rol  $17,<c=%r9d
rol  $17,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 44)
# asm 1: movl   44(<in=int64#2),>loader=int64#8d
# asm 2: movl   44(<in=%rsi),>loader=%r10d
movl   44(%rsi),%r10d

# qhasm:     arith = d
# asm 1: mov  <d=int64#7,>arith=int64#9
# asm 2: mov  <d=%rax,>arith=%r11
mov  %rax,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     arith &= c
# asm 1: and  <c=int64#6,<arith=int64#9
# asm 2: and  <c=%r9,<arith=%r11
and  %r9,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     b += loader + 0x895cd7be
# asm 1: lea  0x895cd7be(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0x895cd7be(<b=%r8,<loader=%r10),>b=%r8
lea  0x895cd7be(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 22
# asm 1: rol  $22,<b=int64#5d
# asm 2: rol  $22,<b=%r8d
rol  $22,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 48)
# asm 1: movl   48(<in=int64#2),>loader=int64#8d
# asm 2: movl   48(<in=%rsi),>loader=%r10d
movl   48(%rsi),%r10d

# qhasm:   arith = c
# asm 1: mov  <c=int64#6,>arith=int64#9
# asm 2: mov  <c=%r9,>arith=%r11
mov  %r9,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   arith &= b
# asm 1: and  <b=int64#5,<arith=int64#9
# asm 2: and  <b=%r8,<arith=%r11
and  %r8,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   a += loader + 0x6b901122
# asm 1: lea  0x6b901122(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0x6b901122(<a=%rcx,<loader=%r10),>a=%rcx
lea  0x6b901122(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 7
# asm 1: rol  $7,<a=int64#4d
# asm 2: rol  $7,<a=%ecx
rol  $7,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 52)
# asm 1: movl   52(<in=int64#2),>loader=int64#8d
# asm 2: movl   52(<in=%rsi),>loader=%r10d
movl   52(%rsi),%r10d

# qhasm:     arith = b
# asm 1: mov  <b=int64#5,>arith=int64#9
# asm 2: mov  <b=%r8,>arith=%r11
mov  %r8,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     arith &= a
# asm 1: and  <a=int64#4,<arith=int64#9
# asm 2: and  <a=%rcx,<arith=%r11
and  %rcx,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     d += loader + 0xfd987193
# asm 1: lea  0xfd987193(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0xfd987193(<d=%rax,<loader=%r10),>d=%rax
lea  0xfd987193(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 12
# asm 1: rol  $12,<d=int64#7d
# asm 2: rol  $12,<d=%eax
rol  $12,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 56)
# asm 1: movl   56(<in=int64#2),>loader=int64#8d
# asm 2: movl   56(<in=%rsi),>loader=%r10d
movl   56(%rsi),%r10d

# qhasm:   arith = a
# asm 1: mov  <a=int64#4,>arith=int64#9
# asm 2: mov  <a=%rcx,>arith=%r11
mov  %rcx,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   arith &= d
# asm 1: and  <d=int64#7,<arith=int64#9
# asm 2: and  <d=%rax,<arith=%r11
and  %rax,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   c += loader + 0xa679438e
# asm 1: lea  0xa679438e(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0xa679438e(<c=%r9,<loader=%r10),>c=%r9
lea  0xa679438e(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 17
# asm 1: rol  $17,<c=int64#6d
# asm 2: rol  $17,<c=%r9d
rol  $17,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 60)
# asm 1: movl   60(<in=int64#2),>loader=int64#8d
# asm 2: movl   60(<in=%rsi),>loader=%r10d
movl   60(%rsi),%r10d

# qhasm:     arith = d
# asm 1: mov  <d=int64#7,>arith=int64#9
# asm 2: mov  <d=%rax,>arith=%r11
mov  %rax,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     arith &= c
# asm 1: and  <c=int64#6,<arith=int64#9
# asm 2: and  <c=%r9,<arith=%r11
and  %r9,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     b += loader + 0x49b40821
# asm 1: lea  0x49b40821(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0x49b40821(<b=%r8,<loader=%r10),>b=%r8
lea  0x49b40821(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 22
# asm 1: rol  $22,<b=int64#5d
# asm 2: rol  $22,<b=%r8d
rol  $22,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 4)
# asm 1: movl   4(<in=int64#2),>loader=int64#8d
# asm 2: movl   4(<in=%rsi),>loader=%r10d
movl   4(%rsi),%r10d

# qhasm:   arith = c
# asm 1: mov  <c=int64#6,>arith=int64#9
# asm 2: mov  <c=%r9,>arith=%r11
mov  %r9,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   arith &= d
# asm 1: and  <d=int64#7,<arith=int64#9
# asm 2: and  <d=%rax,<arith=%r11
and  %rax,%r11

# qhasm:   arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:   a += loader + 0xf61e2562
# asm 1: lea  0xf61e2562(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0xf61e2562(<a=%rcx,<loader=%r10),>a=%rcx
lea  0xf61e2562(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 5
# asm 1: rol  $5,<a=int64#4d
# asm 2: rol  $5,<a=%ecx
rol  $5,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 24)
# asm 1: movl   24(<in=int64#2),>loader=int64#8d
# asm 2: movl   24(<in=%rsi),>loader=%r10d
movl   24(%rsi),%r10d

# qhasm:     arith = b
# asm 1: mov  <b=int64#5,>arith=int64#9
# asm 2: mov  <b=%r8,>arith=%r11
mov  %r8,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     arith &= c
# asm 1: and  <c=int64#6,<arith=int64#9
# asm 2: and  <c=%r9,<arith=%r11
and  %r9,%r11

# qhasm:     arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:     d += loader + 0xc040b340
# asm 1: lea  0xc040b340(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0xc040b340(<d=%rax,<loader=%r10),>d=%rax
lea  0xc040b340(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 9
# asm 1: rol  $9,<d=int64#7d
# asm 2: rol  $9,<d=%eax
rol  $9,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 44)
# asm 1: movl   44(<in=int64#2),>loader=int64#8d
# asm 2: movl   44(<in=%rsi),>loader=%r10d
movl   44(%rsi),%r10d

# qhasm:   arith = a
# asm 1: mov  <a=int64#4,>arith=int64#9
# asm 2: mov  <a=%rcx,>arith=%r11
mov  %rcx,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   arith &= b
# asm 1: and  <b=int64#5,<arith=int64#9
# asm 2: and  <b=%r8,<arith=%r11
and  %r8,%r11

# qhasm:   arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:   c += loader + 0x265e5a51
# asm 1: lea  0x265e5a51(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0x265e5a51(<c=%r9,<loader=%r10),>c=%r9
lea  0x265e5a51(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 14
# asm 1: rol  $14,<c=int64#6d
# asm 2: rol  $14,<c=%r9d
rol  $14,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 0)
# asm 1: movl   0(<in=int64#2),>loader=int64#8d
# asm 2: movl   0(<in=%rsi),>loader=%r10d
movl   0(%rsi),%r10d

# qhasm:     arith = d
# asm 1: mov  <d=int64#7,>arith=int64#9
# asm 2: mov  <d=%rax,>arith=%r11
mov  %rax,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     arith &= a
# asm 1: and  <a=int64#4,<arith=int64#9
# asm 2: and  <a=%rcx,<arith=%r11
and  %rcx,%r11

# qhasm:     arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:     b += loader + 0xe9b6c7aa
# asm 1: lea  0xe9b6c7aa(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0xe9b6c7aa(<b=%r8,<loader=%r10),>b=%r8
lea  0xe9b6c7aa(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 20
# asm 1: rol  $20,<b=int64#5d
# asm 2: rol  $20,<b=%r8d
rol  $20,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 20)
# asm 1: movl   20(<in=int64#2),>loader=int64#8d
# asm 2: movl   20(<in=%rsi),>loader=%r10d
movl   20(%rsi),%r10d

# qhasm:   arith = c
# asm 1: mov  <c=int64#6,>arith=int64#9
# asm 2: mov  <c=%r9,>arith=%r11
mov  %r9,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   arith &= d
# asm 1: and  <d=int64#7,<arith=int64#9
# asm 2: and  <d=%rax,<arith=%r11
and  %rax,%r11

# qhasm:   arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:   a += loader + 0xd62f105d
# asm 1: lea  0xd62f105d(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0xd62f105d(<a=%rcx,<loader=%r10),>a=%rcx
lea  0xd62f105d(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 5
# asm 1: rol  $5,<a=int64#4d
# asm 2: rol  $5,<a=%ecx
rol  $5,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 40)
# asm 1: movl   40(<in=int64#2),>loader=int64#8d
# asm 2: movl   40(<in=%rsi),>loader=%r10d
movl   40(%rsi),%r10d

# qhasm:     arith = b
# asm 1: mov  <b=int64#5,>arith=int64#9
# asm 2: mov  <b=%r8,>arith=%r11
mov  %r8,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     arith &= c
# asm 1: and  <c=int64#6,<arith=int64#9
# asm 2: and  <c=%r9,<arith=%r11
and  %r9,%r11

# qhasm:     arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:     d += loader + 0x02441453
# asm 1: lea  0x02441453(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0x02441453(<d=%rax,<loader=%r10),>d=%rax
lea  0x02441453(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 9
# asm 1: rol  $9,<d=int64#7d
# asm 2: rol  $9,<d=%eax
rol  $9,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 60)
# asm 1: movl   60(<in=int64#2),>loader=int64#8d
# asm 2: movl   60(<in=%rsi),>loader=%r10d
movl   60(%rsi),%r10d

# qhasm:   arith = a
# asm 1: mov  <a=int64#4,>arith=int64#9
# asm 2: mov  <a=%rcx,>arith=%r11
mov  %rcx,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   arith &= b
# asm 1: and  <b=int64#5,<arith=int64#9
# asm 2: and  <b=%r8,<arith=%r11
and  %r8,%r11

# qhasm:   arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:   c += loader + 0xd8a1e681
# asm 1: lea  0xd8a1e681(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0xd8a1e681(<c=%r9,<loader=%r10),>c=%r9
lea  0xd8a1e681(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 14
# asm 1: rol  $14,<c=int64#6d
# asm 2: rol  $14,<c=%r9d
rol  $14,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 16)
# asm 1: movl   16(<in=int64#2),>loader=int64#8d
# asm 2: movl   16(<in=%rsi),>loader=%r10d
movl   16(%rsi),%r10d

# qhasm:     arith = d
# asm 1: mov  <d=int64#7,>arith=int64#9
# asm 2: mov  <d=%rax,>arith=%r11
mov  %rax,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     arith &= a
# asm 1: and  <a=int64#4,<arith=int64#9
# asm 2: and  <a=%rcx,<arith=%r11
and  %rcx,%r11

# qhasm:     arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:     b += loader + 0xe7d3fbc8
# asm 1: lea  0xe7d3fbc8(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0xe7d3fbc8(<b=%r8,<loader=%r10),>b=%r8
lea  0xe7d3fbc8(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 20
# asm 1: rol  $20,<b=int64#5d
# asm 2: rol  $20,<b=%r8d
rol  $20,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 36)
# asm 1: movl   36(<in=int64#2),>loader=int64#8d
# asm 2: movl   36(<in=%rsi),>loader=%r10d
movl   36(%rsi),%r10d

# qhasm:   arith = c
# asm 1: mov  <c=int64#6,>arith=int64#9
# asm 2: mov  <c=%r9,>arith=%r11
mov  %r9,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   arith &= d
# asm 1: and  <d=int64#7,<arith=int64#9
# asm 2: and  <d=%rax,<arith=%r11
and  %rax,%r11

# qhasm:   arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:   a += loader + 0x21e1cde6
# asm 1: lea  0x21e1cde6(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0x21e1cde6(<a=%rcx,<loader=%r10),>a=%rcx
lea  0x21e1cde6(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 5
# asm 1: rol  $5,<a=int64#4d
# asm 2: rol  $5,<a=%ecx
rol  $5,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 56)
# asm 1: movl   56(<in=int64#2),>loader=int64#8d
# asm 2: movl   56(<in=%rsi),>loader=%r10d
movl   56(%rsi),%r10d

# qhasm:     arith = b
# asm 1: mov  <b=int64#5,>arith=int64#9
# asm 2: mov  <b=%r8,>arith=%r11
mov  %r8,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     arith &= c
# asm 1: and  <c=int64#6,<arith=int64#9
# asm 2: and  <c=%r9,<arith=%r11
and  %r9,%r11

# qhasm:     arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:     d += loader + 0xc33707d6
# asm 1: lea  0xc33707d6(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0xc33707d6(<d=%rax,<loader=%r10),>d=%rax
lea  0xc33707d6(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 9
# asm 1: rol  $9,<d=int64#7d
# asm 2: rol  $9,<d=%eax
rol  $9,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 12)
# asm 1: movl   12(<in=int64#2),>loader=int64#8d
# asm 2: movl   12(<in=%rsi),>loader=%r10d
movl   12(%rsi),%r10d

# qhasm:   arith = a
# asm 1: mov  <a=int64#4,>arith=int64#9
# asm 2: mov  <a=%rcx,>arith=%r11
mov  %rcx,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   arith &= b
# asm 1: and  <b=int64#5,<arith=int64#9
# asm 2: and  <b=%r8,<arith=%r11
and  %r8,%r11

# qhasm:   arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:   c += loader + 0xf4d50d87
# asm 1: lea  0xf4d50d87(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0xf4d50d87(<c=%r9,<loader=%r10),>c=%r9
lea  0xf4d50d87(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 14
# asm 1: rol  $14,<c=int64#6d
# asm 2: rol  $14,<c=%r9d
rol  $14,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 32)
# asm 1: movl   32(<in=int64#2),>loader=int64#8d
# asm 2: movl   32(<in=%rsi),>loader=%r10d
movl   32(%rsi),%r10d

# qhasm:     arith = d
# asm 1: mov  <d=int64#7,>arith=int64#9
# asm 2: mov  <d=%rax,>arith=%r11
mov  %rax,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     arith &= a
# asm 1: and  <a=int64#4,<arith=int64#9
# asm 2: and  <a=%rcx,<arith=%r11
and  %rcx,%r11

# qhasm:     arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:     b += loader + 0x455a14ed
# asm 1: lea  0x455a14ed(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0x455a14ed(<b=%r8,<loader=%r10),>b=%r8
lea  0x455a14ed(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 20
# asm 1: rol  $20,<b=int64#5d
# asm 2: rol  $20,<b=%r8d
rol  $20,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 52)
# asm 1: movl   52(<in=int64#2),>loader=int64#8d
# asm 2: movl   52(<in=%rsi),>loader=%r10d
movl   52(%rsi),%r10d

# qhasm:   arith = c
# asm 1: mov  <c=int64#6,>arith=int64#9
# asm 2: mov  <c=%r9,>arith=%r11
mov  %r9,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   arith &= d
# asm 1: and  <d=int64#7,<arith=int64#9
# asm 2: and  <d=%rax,<arith=%r11
and  %rax,%r11

# qhasm:   arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:   a += loader + 0xa9e3e905
# asm 1: lea  0xa9e3e905(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0xa9e3e905(<a=%rcx,<loader=%r10),>a=%rcx
lea  0xa9e3e905(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 5
# asm 1: rol  $5,<a=int64#4d
# asm 2: rol  $5,<a=%ecx
rol  $5,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 8)
# asm 1: movl   8(<in=int64#2),>loader=int64#8d
# asm 2: movl   8(<in=%rsi),>loader=%r10d
movl   8(%rsi),%r10d

# qhasm:     arith = b
# asm 1: mov  <b=int64#5,>arith=int64#9
# asm 2: mov  <b=%r8,>arith=%r11
mov  %r8,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     arith &= c
# asm 1: and  <c=int64#6,<arith=int64#9
# asm 2: and  <c=%r9,<arith=%r11
and  %r9,%r11

# qhasm:     arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:     d += loader + 0xfcefa3f8
# asm 1: lea  0xfcefa3f8(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0xfcefa3f8(<d=%rax,<loader=%r10),>d=%rax
lea  0xfcefa3f8(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 9
# asm 1: rol  $9,<d=int64#7d
# asm 2: rol  $9,<d=%eax
rol  $9,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 28)
# asm 1: movl   28(<in=int64#2),>loader=int64#8d
# asm 2: movl   28(<in=%rsi),>loader=%r10d
movl   28(%rsi),%r10d

# qhasm:   arith = a
# asm 1: mov  <a=int64#4,>arith=int64#9
# asm 2: mov  <a=%rcx,>arith=%r11
mov  %rcx,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   arith &= b
# asm 1: and  <b=int64#5,<arith=int64#9
# asm 2: and  <b=%r8,<arith=%r11
and  %r8,%r11

# qhasm:   arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:   c += loader + 0x676f02d9
# asm 1: lea  0x676f02d9(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0x676f02d9(<c=%r9,<loader=%r10),>c=%r9
lea  0x676f02d9(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 14
# asm 1: rol  $14,<c=int64#6d
# asm 2: rol  $14,<c=%r9d
rol  $14,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 48)
# asm 1: movl   48(<in=int64#2),>loader=int64#8d
# asm 2: movl   48(<in=%rsi),>loader=%r10d
movl   48(%rsi),%r10d

# qhasm:     arith = d
# asm 1: mov  <d=int64#7,>arith=int64#9
# asm 2: mov  <d=%rax,>arith=%r11
mov  %rax,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     arith &= a
# asm 1: and  <a=int64#4,<arith=int64#9
# asm 2: and  <a=%rcx,<arith=%r11
and  %rcx,%r11

# qhasm:     arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:     b += loader + 0x8d2a4c8a
# asm 1: lea  0x8d2a4c8a(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0x8d2a4c8a(<b=%r8,<loader=%r10),>b=%r8
lea  0x8d2a4c8a(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 20
# asm 1: rol  $20,<b=int64#5d
# asm 2: rol  $20,<b=%r8d
rol  $20,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 20)
# asm 1: movl   20(<in=int64#2),>loader=int64#8d
# asm 2: movl   20(<in=%rsi),>loader=%r10d
movl   20(%rsi),%r10d

# qhasm:   arith = d
# asm 1: mov  <d=int64#7,>arith=int64#9
# asm 2: mov  <d=%rax,>arith=%r11
mov  %rax,%r11

# qhasm:   arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   a += loader + 0xfffa3942
# asm 1: lea  0xfffa3942(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0xfffa3942(<a=%rcx,<loader=%r10),>a=%rcx
lea  0xfffa3942(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 4
# asm 1: rol  $4,<a=int64#4d
# asm 2: rol  $4,<a=%ecx
rol  $4,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 32)
# asm 1: movl   32(<in=int64#2),>loader=int64#8d
# asm 2: movl   32(<in=%rsi),>loader=%r10d
movl   32(%rsi),%r10d

# qhasm:     arith = c
# asm 1: mov  <c=int64#6,>arith=int64#9
# asm 2: mov  <c=%r9,>arith=%r11
mov  %r9,%r11

# qhasm:     arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     d += loader + 0x8771f681
# asm 1: lea  0x8771f681(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0x8771f681(<d=%rax,<loader=%r10),>d=%rax
lea  0x8771f681(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 11
# asm 1: rol  $11,<d=int64#7d
# asm 2: rol  $11,<d=%eax
rol  $11,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 44)
# asm 1: movl   44(<in=int64#2),>loader=int64#8d
# asm 2: movl   44(<in=%rsi),>loader=%r10d
movl   44(%rsi),%r10d

# qhasm:   arith = b
# asm 1: mov  <b=int64#5,>arith=int64#9
# asm 2: mov  <b=%r8,>arith=%r11
mov  %r8,%r11

# qhasm:   arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   c += loader + 0x6d9d6122
# asm 1: lea  0x6d9d6122(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0x6d9d6122(<c=%r9,<loader=%r10),>c=%r9
lea  0x6d9d6122(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 16
# asm 1: rol  $16,<c=int64#6d
# asm 2: rol  $16,<c=%r9d
rol  $16,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 56)
# asm 1: movl   56(<in=int64#2),>loader=int64#8d
# asm 2: movl   56(<in=%rsi),>loader=%r10d
movl   56(%rsi),%r10d

# qhasm:     arith = a
# asm 1: mov  <a=int64#4,>arith=int64#9
# asm 2: mov  <a=%rcx,>arith=%r11
mov  %rcx,%r11

# qhasm:     arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     b += loader + 0xfde5380c
# asm 1: lea  0xfde5380c(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0xfde5380c(<b=%r8,<loader=%r10),>b=%r8
lea  0xfde5380c(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 23
# asm 1: rol  $23,<b=int64#5d
# asm 2: rol  $23,<b=%r8d
rol  $23,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 4)
# asm 1: movl   4(<in=int64#2),>loader=int64#8d
# asm 2: movl   4(<in=%rsi),>loader=%r10d
movl   4(%rsi),%r10d

# qhasm:   arith = d
# asm 1: mov  <d=int64#7,>arith=int64#9
# asm 2: mov  <d=%rax,>arith=%r11
mov  %rax,%r11

# qhasm:   arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   a += loader + 0xa4beea44
# asm 1: lea  0xa4beea44(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0xa4beea44(<a=%rcx,<loader=%r10),>a=%rcx
lea  0xa4beea44(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 4
# asm 1: rol  $4,<a=int64#4d
# asm 2: rol  $4,<a=%ecx
rol  $4,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 16)
# asm 1: movl   16(<in=int64#2),>loader=int64#8d
# asm 2: movl   16(<in=%rsi),>loader=%r10d
movl   16(%rsi),%r10d

# qhasm:     arith = c
# asm 1: mov  <c=int64#6,>arith=int64#9
# asm 2: mov  <c=%r9,>arith=%r11
mov  %r9,%r11

# qhasm:     arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     d += loader + 0x4bdecfa9
# asm 1: lea  0x4bdecfa9(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0x4bdecfa9(<d=%rax,<loader=%r10),>d=%rax
lea  0x4bdecfa9(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 11
# asm 1: rol  $11,<d=int64#7d
# asm 2: rol  $11,<d=%eax
rol  $11,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 28)
# asm 1: movl   28(<in=int64#2),>loader=int64#8d
# asm 2: movl   28(<in=%rsi),>loader=%r10d
movl   28(%rsi),%r10d

# qhasm:   arith = b
# asm 1: mov  <b=int64#5,>arith=int64#9
# asm 2: mov  <b=%r8,>arith=%r11
mov  %r8,%r11

# qhasm:   arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   c += loader + 0xf6bb4b60
# asm 1: lea  0xf6bb4b60(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0xf6bb4b60(<c=%r9,<loader=%r10),>c=%r9
lea  0xf6bb4b60(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 16
# asm 1: rol  $16,<c=int64#6d
# asm 2: rol  $16,<c=%r9d
rol  $16,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 40)
# asm 1: movl   40(<in=int64#2),>loader=int64#8d
# asm 2: movl   40(<in=%rsi),>loader=%r10d
movl   40(%rsi),%r10d

# qhasm:     arith = a
# asm 1: mov  <a=int64#4,>arith=int64#9
# asm 2: mov  <a=%rcx,>arith=%r11
mov  %rcx,%r11

# qhasm:     arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     b += loader + 0xbebfbc70
# asm 1: lea  0xbebfbc70(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0xbebfbc70(<b=%r8,<loader=%r10),>b=%r8
lea  0xbebfbc70(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 23
# asm 1: rol  $23,<b=int64#5d
# asm 2: rol  $23,<b=%r8d
rol  $23,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 52)
# asm 1: movl   52(<in=int64#2),>loader=int64#8d
# asm 2: movl   52(<in=%rsi),>loader=%r10d
movl   52(%rsi),%r10d

# qhasm:   arith = d
# asm 1: mov  <d=int64#7,>arith=int64#9
# asm 2: mov  <d=%rax,>arith=%r11
mov  %rax,%r11

# qhasm:   arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   a += loader + 0x289b7ec6
# asm 1: lea  0x289b7ec6(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0x289b7ec6(<a=%rcx,<loader=%r10),>a=%rcx
lea  0x289b7ec6(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 4
# asm 1: rol  $4,<a=int64#4d
# asm 2: rol  $4,<a=%ecx
rol  $4,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 0)
# asm 1: movl   0(<in=int64#2),>loader=int64#8d
# asm 2: movl   0(<in=%rsi),>loader=%r10d
movl   0(%rsi),%r10d

# qhasm:     arith = c
# asm 1: mov  <c=int64#6,>arith=int64#9
# asm 2: mov  <c=%r9,>arith=%r11
mov  %r9,%r11

# qhasm:     arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     d += loader + 0xeaa127fa
# asm 1: lea  0xeaa127fa(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0xeaa127fa(<d=%rax,<loader=%r10),>d=%rax
lea  0xeaa127fa(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 11
# asm 1: rol  $11,<d=int64#7d
# asm 2: rol  $11,<d=%eax
rol  $11,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 12)
# asm 1: movl   12(<in=int64#2),>loader=int64#8d
# asm 2: movl   12(<in=%rsi),>loader=%r10d
movl   12(%rsi),%r10d

# qhasm:   arith = b
# asm 1: mov  <b=int64#5,>arith=int64#9
# asm 2: mov  <b=%r8,>arith=%r11
mov  %r8,%r11

# qhasm:   arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   c += loader + 0xd4ef3085
# asm 1: lea  0xd4ef3085(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0xd4ef3085(<c=%r9,<loader=%r10),>c=%r9
lea  0xd4ef3085(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 16
# asm 1: rol  $16,<c=int64#6d
# asm 2: rol  $16,<c=%r9d
rol  $16,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 24)
# asm 1: movl   24(<in=int64#2),>loader=int64#8d
# asm 2: movl   24(<in=%rsi),>loader=%r10d
movl   24(%rsi),%r10d

# qhasm:     arith = a
# asm 1: mov  <a=int64#4,>arith=int64#9
# asm 2: mov  <a=%rcx,>arith=%r11
mov  %rcx,%r11

# qhasm:     arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     b += loader + 0x04881d05
# asm 1: lea  0x04881d05(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0x04881d05(<b=%r8,<loader=%r10),>b=%r8
lea  0x04881d05(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 23
# asm 1: rol  $23,<b=int64#5d
# asm 2: rol  $23,<b=%r8d
rol  $23,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 36)
# asm 1: movl   36(<in=int64#2),>loader=int64#8d
# asm 2: movl   36(<in=%rsi),>loader=%r10d
movl   36(%rsi),%r10d

# qhasm:   arith = d
# asm 1: mov  <d=int64#7,>arith=int64#9
# asm 2: mov  <d=%rax,>arith=%r11
mov  %rax,%r11

# qhasm:   arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   a += loader + 0xd9d4d039
# asm 1: lea  0xd9d4d039(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0xd9d4d039(<a=%rcx,<loader=%r10),>a=%rcx
lea  0xd9d4d039(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 4
# asm 1: rol  $4,<a=int64#4d
# asm 2: rol  $4,<a=%ecx
rol  $4,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 48)
# asm 1: movl   48(<in=int64#2),>loader=int64#8d
# asm 2: movl   48(<in=%rsi),>loader=%r10d
movl   48(%rsi),%r10d

# qhasm:     arith = c
# asm 1: mov  <c=int64#6,>arith=int64#9
# asm 2: mov  <c=%r9,>arith=%r11
mov  %r9,%r11

# qhasm:     arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     d += loader + 0xe6db99e5
# asm 1: lea  0xe6db99e5(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0xe6db99e5(<d=%rax,<loader=%r10),>d=%rax
lea  0xe6db99e5(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 11
# asm 1: rol  $11,<d=int64#7d
# asm 2: rol  $11,<d=%eax
rol  $11,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 60)
# asm 1: movl   60(<in=int64#2),>loader=int64#8d
# asm 2: movl   60(<in=%rsi),>loader=%r10d
movl   60(%rsi),%r10d

# qhasm:   arith = b
# asm 1: mov  <b=int64#5,>arith=int64#9
# asm 2: mov  <b=%r8,>arith=%r11
mov  %r8,%r11

# qhasm:   arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   c += loader + 0x1fa27cf8
# asm 1: lea  0x1fa27cf8(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0x1fa27cf8(<c=%r9,<loader=%r10),>c=%r9
lea  0x1fa27cf8(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 16
# asm 1: rol  $16,<c=int64#6d
# asm 2: rol  $16,<c=%r9d
rol  $16,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 8)
# asm 1: movl   8(<in=int64#2),>loader=int64#8d
# asm 2: movl   8(<in=%rsi),>loader=%r10d
movl   8(%rsi),%r10d

# qhasm:     arith = a
# asm 1: mov  <a=int64#4,>arith=int64#9
# asm 2: mov  <a=%rcx,>arith=%r11
mov  %rcx,%r11

# qhasm:     arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     b += loader + 0xc4ac5665
# asm 1: lea  0xc4ac5665(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0xc4ac5665(<b=%r8,<loader=%r10),>b=%r8
lea  0xc4ac5665(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 23
# asm 1: rol  $23,<b=int64#5d
# asm 2: rol  $23,<b=%r8d
rol  $23,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 0)
# asm 1: movl   0(<in=int64#2),>loader=int64#8d
# asm 2: movl   0(<in=%rsi),>loader=%r10d
movl   0(%rsi),%r10d

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   arith |= b
# asm 1: or   <b=int64#5,<arith=int64#9
# asm 2: or   <b=%r8,<arith=%r11
or   %r8,%r11

# qhasm:   arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:   a += loader + 0xf4292244
# asm 1: lea  0xf4292244(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0xf4292244(<a=%rcx,<loader=%r10),>a=%rcx
lea  0xf4292244(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 6
# asm 1: rol  $6,<a=int64#4d
# asm 2: rol  $6,<a=%ecx
rol  $6,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 28)
# asm 1: movl   28(<in=int64#2),>loader=int64#8d
# asm 2: movl   28(<in=%rsi),>loader=%r10d
movl   28(%rsi),%r10d

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     arith |= a
# asm 1: or   <a=int64#4,<arith=int64#9
# asm 2: or   <a=%rcx,<arith=%r11
or   %rcx,%r11

# qhasm:     arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:     d += loader + 0x432aff97
# asm 1: lea  0x432aff97(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0x432aff97(<d=%rax,<loader=%r10),>d=%rax
lea  0x432aff97(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 10
# asm 1: rol  $10,<d=int64#7d
# asm 2: rol  $10,<d=%eax
rol  $10,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 56)
# asm 1: movl   56(<in=int64#2),>loader=int64#8d
# asm 2: movl   56(<in=%rsi),>loader=%r10d
movl   56(%rsi),%r10d

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   arith |= d
# asm 1: or   <d=int64#7,<arith=int64#9
# asm 2: or   <d=%rax,<arith=%r11
or   %rax,%r11

# qhasm:   arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:   c += loader + 0xab9423a7
# asm 1: lea  0xab9423a7(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0xab9423a7(<c=%r9,<loader=%r10),>c=%r9
lea  0xab9423a7(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 15
# asm 1: rol  $15,<c=int64#6d
# asm 2: rol  $15,<c=%r9d
rol  $15,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 20)
# asm 1: movl   20(<in=int64#2),>loader=int64#8d
# asm 2: movl   20(<in=%rsi),>loader=%r10d
movl   20(%rsi),%r10d

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     arith |= c
# asm 1: or   <c=int64#6,<arith=int64#9
# asm 2: or   <c=%r9,<arith=%r11
or   %r9,%r11

# qhasm:     arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:     b += loader + 0xfc93a039
# asm 1: lea  0xfc93a039(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0xfc93a039(<b=%r8,<loader=%r10),>b=%r8
lea  0xfc93a039(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 21
# asm 1: rol  $21,<b=int64#5d
# asm 2: rol  $21,<b=%r8d
rol  $21,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 48)
# asm 1: movl   48(<in=int64#2),>loader=int64#8d
# asm 2: movl   48(<in=%rsi),>loader=%r10d
movl   48(%rsi),%r10d

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   arith |= b
# asm 1: or   <b=int64#5,<arith=int64#9
# asm 2: or   <b=%r8,<arith=%r11
or   %r8,%r11

# qhasm:   arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:   a += loader + 0x655b59c3
# asm 1: lea  0x655b59c3(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0x655b59c3(<a=%rcx,<loader=%r10),>a=%rcx
lea  0x655b59c3(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 6
# asm 1: rol  $6,<a=int64#4d
# asm 2: rol  $6,<a=%ecx
rol  $6,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 12)
# asm 1: movl   12(<in=int64#2),>loader=int64#8d
# asm 2: movl   12(<in=%rsi),>loader=%r10d
movl   12(%rsi),%r10d

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     arith |= a
# asm 1: or   <a=int64#4,<arith=int64#9
# asm 2: or   <a=%rcx,<arith=%r11
or   %rcx,%r11

# qhasm:     arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:     d += loader + 0x8f0ccc92
# asm 1: lea  0x8f0ccc92(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0x8f0ccc92(<d=%rax,<loader=%r10),>d=%rax
lea  0x8f0ccc92(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 10
# asm 1: rol  $10,<d=int64#7d
# asm 2: rol  $10,<d=%eax
rol  $10,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 40)
# asm 1: movl   40(<in=int64#2),>loader=int64#8d
# asm 2: movl   40(<in=%rsi),>loader=%r10d
movl   40(%rsi),%r10d

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   arith |= d
# asm 1: or   <d=int64#7,<arith=int64#9
# asm 2: or   <d=%rax,<arith=%r11
or   %rax,%r11

# qhasm:   arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:   c += loader + 0xffeff47d
# asm 1: lea  0xffeff47d(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0xffeff47d(<c=%r9,<loader=%r10),>c=%r9
lea  0xffeff47d(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 15
# asm 1: rol  $15,<c=int64#6d
# asm 2: rol  $15,<c=%r9d
rol  $15,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 4)
# asm 1: movl   4(<in=int64#2),>loader=int64#8d
# asm 2: movl   4(<in=%rsi),>loader=%r10d
movl   4(%rsi),%r10d

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     arith |= c
# asm 1: or   <c=int64#6,<arith=int64#9
# asm 2: or   <c=%r9,<arith=%r11
or   %r9,%r11

# qhasm:     arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:     b += loader + 0x85845dd1
# asm 1: lea  0x85845dd1(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0x85845dd1(<b=%r8,<loader=%r10),>b=%r8
lea  0x85845dd1(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 21
# asm 1: rol  $21,<b=int64#5d
# asm 2: rol  $21,<b=%r8d
rol  $21,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 32)
# asm 1: movl   32(<in=int64#2),>loader=int64#8d
# asm 2: movl   32(<in=%rsi),>loader=%r10d
movl   32(%rsi),%r10d

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   arith |= b
# asm 1: or   <b=int64#5,<arith=int64#9
# asm 2: or   <b=%r8,<arith=%r11
or   %r8,%r11

# qhasm:   arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:   a += loader + 0x6fa87e4f
# asm 1: lea  0x6fa87e4f(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0x6fa87e4f(<a=%rcx,<loader=%r10),>a=%rcx
lea  0x6fa87e4f(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 6
# asm 1: rol  $6,<a=int64#4d
# asm 2: rol  $6,<a=%ecx
rol  $6,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 60)
# asm 1: movl   60(<in=int64#2),>loader=int64#8d
# asm 2: movl   60(<in=%rsi),>loader=%r10d
movl   60(%rsi),%r10d

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     arith |= a
# asm 1: or   <a=int64#4,<arith=int64#9
# asm 2: or   <a=%rcx,<arith=%r11
or   %rcx,%r11

# qhasm:     arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:     d += loader + 0xfe2ce6e0
# asm 1: lea  0xfe2ce6e0(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0xfe2ce6e0(<d=%rax,<loader=%r10),>d=%rax
lea  0xfe2ce6e0(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 10
# asm 1: rol  $10,<d=int64#7d
# asm 2: rol  $10,<d=%eax
rol  $10,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 24)
# asm 1: movl   24(<in=int64#2),>loader=int64#8d
# asm 2: movl   24(<in=%rsi),>loader=%r10d
movl   24(%rsi),%r10d

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   arith |= d
# asm 1: or   <d=int64#7,<arith=int64#9
# asm 2: or   <d=%rax,<arith=%r11
or   %rax,%r11

# qhasm:   arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:   c += loader + 0xa3014314
# asm 1: lea  0xa3014314(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0xa3014314(<c=%r9,<loader=%r10),>c=%r9
lea  0xa3014314(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 15
# asm 1: rol  $15,<c=int64#6d
# asm 2: rol  $15,<c=%r9d
rol  $15,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 52)
# asm 1: movl   52(<in=int64#2),>loader=int64#8d
# asm 2: movl   52(<in=%rsi),>loader=%r10d
movl   52(%rsi),%r10d

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     arith |= c
# asm 1: or   <c=int64#6,<arith=int64#9
# asm 2: or   <c=%r9,<arith=%r11
or   %r9,%r11

# qhasm:     arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:     b += loader + 0x4e0811a1
# asm 1: lea  0x4e0811a1(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0x4e0811a1(<b=%r8,<loader=%r10),>b=%r8
lea  0x4e0811a1(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 21
# asm 1: rol  $21,<b=int64#5d
# asm 2: rol  $21,<b=%r8d
rol  $21,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   loader = *(uint32 *) (in + 16)
# asm 1: movl   16(<in=int64#2),>loader=int64#8d
# asm 2: movl   16(<in=%rsi),>loader=%r10d
movl   16(%rsi),%r10d

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:   arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:   arith |= b
# asm 1: or   <b=int64#5,<arith=int64#9
# asm 2: or   <b=%r8,<arith=%r11
or   %r8,%r11

# qhasm:   arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:   a += loader + 0xf7537e82
# asm 1: lea  0xf7537e82(<a=int64#4,<loader=int64#8),>a=int64#4
# asm 2: lea  0xf7537e82(<a=%rcx,<loader=%r10),>a=%rcx
lea  0xf7537e82(%rcx,%r10),%rcx

# qhasm:   a += arith
# asm 1: add  <arith=int64#9,<a=int64#4
# asm 2: add  <arith=%r11,<a=%rcx
add  %r11,%rcx

# qhasm:   (uint32) a <<<= 6
# asm 1: rol  $6,<a=int64#4d
# asm 2: rol  $6,<a=%ecx
rol  $6,%ecx

# qhasm:   a += b
# asm 1: add  <b=int64#5,<a=int64#4
# asm 2: add  <b=%r8,<a=%rcx
add  %r8,%rcx

# qhasm:     loader = *(uint32 *) (in + 44)
# asm 1: movl   44(<in=int64#2),>loader=int64#8d
# asm 2: movl   44(<in=%rsi),>loader=%r10d
movl   44(%rsi),%r10d

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:     arith ^= c
# asm 1: xor  <c=int64#6,<arith=int64#9
# asm 2: xor  <c=%r9,<arith=%r11
xor  %r9,%r11

# qhasm:     arith |= a
# asm 1: or   <a=int64#4,<arith=int64#9
# asm 2: or   <a=%rcx,<arith=%r11
or   %rcx,%r11

# qhasm:     arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:     d += loader + 0xbd3af235
# asm 1: lea  0xbd3af235(<d=int64#7,<loader=int64#8),>d=int64#7
# asm 2: lea  0xbd3af235(<d=%rax,<loader=%r10),>d=%rax
lea  0xbd3af235(%rax,%r10),%rax

# qhasm:     d += arith
# asm 1: add  <arith=int64#9,<d=int64#7
# asm 2: add  <arith=%r11,<d=%rax
add  %r11,%rax

# qhasm:     (uint32) d <<<= 10
# asm 1: rol  $10,<d=int64#7d
# asm 2: rol  $10,<d=%eax
rol  $10,%eax

# qhasm:     d += a
# asm 1: add  <a=int64#4,<d=int64#7
# asm 2: add  <a=%rcx,<d=%rax
add  %rcx,%rax

# qhasm:   loader = *(uint32 *) (in + 8)
# asm 1: movl   8(<in=int64#2),>loader=int64#8d
# asm 2: movl   8(<in=%rsi),>loader=%r10d
movl   8(%rsi),%r10d

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:   arith ^= b
# asm 1: xor  <b=int64#5,<arith=int64#9
# asm 2: xor  <b=%r8,<arith=%r11
xor  %r8,%r11

# qhasm:   arith |= d
# asm 1: or   <d=int64#7,<arith=int64#9
# asm 2: or   <d=%rax,<arith=%r11
or   %rax,%r11

# qhasm:   arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:   c += loader + 0x2ad7d2bb
# asm 1: lea  0x2ad7d2bb(<c=int64#6,<loader=int64#8),>c=int64#6
# asm 2: lea  0x2ad7d2bb(<c=%r9,<loader=%r10),>c=%r9
lea  0x2ad7d2bb(%r9,%r10),%r9

# qhasm:   c += arith
# asm 1: add  <arith=int64#9,<c=int64#6
# asm 2: add  <arith=%r11,<c=%r9
add  %r11,%r9

# qhasm:   (uint32) c <<<= 15
# asm 1: rol  $15,<c=int64#6d
# asm 2: rol  $15,<c=%r9d
rol  $15,%r9d

# qhasm:   c += d
# asm 1: add  <d=int64#7,<c=int64#6
# asm 2: add  <d=%rax,<c=%r9
add  %rax,%r9

# qhasm:     loader = *(uint32 *) (in + 36)
# asm 1: movl   36(<in=int64#2),>loader=int64#8d
# asm 2: movl   36(<in=%rsi),>loader=%r10d
movl   36(%rsi),%r10d

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int64#9
# asm 2: mov  $-1,>arith=%r11
mov  $-1,%r11

# qhasm:     arith ^= a
# asm 1: xor  <a=int64#4,<arith=int64#9
# asm 2: xor  <a=%rcx,<arith=%r11
xor  %rcx,%r11

# qhasm:     arith |= c
# asm 1: or   <c=int64#6,<arith=int64#9
# asm 2: or   <c=%r9,<arith=%r11
or   %r9,%r11

# qhasm:     arith ^= d
# asm 1: xor  <d=int64#7,<arith=int64#9
# asm 2: xor  <d=%rax,<arith=%r11
xor  %rax,%r11

# qhasm:     b += loader + 0xeb86d391
# asm 1: lea  0xeb86d391(<b=int64#5,<loader=int64#8),>b=int64#5
# asm 2: lea  0xeb86d391(<b=%r8,<loader=%r10),>b=%r8
lea  0xeb86d391(%r8,%r10),%r8

# qhasm:     b += arith
# asm 1: add  <arith=int64#9,<b=int64#5
# asm 2: add  <arith=%r11,<b=%r8
add  %r11,%r8

# qhasm:     (uint32) b <<<= 21
# asm 1: rol  $21,<b=int64#5d
# asm 2: rol  $21,<b=%r8d
rol  $21,%r8d

# qhasm:     b += c
# asm 1: add  <c=int64#6,<b=int64#5
# asm 2: add  <c=%r9,<b=%r8
add  %r9,%r8

# qhasm:   in += 64
# asm 1: add  $64,<in=int64#2
# asm 2: add  $64,<in=%rsi
add  $64,%rsi

# qhasm:   inlen -= 64
# asm 1: sub  $64,<inlen=int64#3
# asm 2: sub  $64,<inlen=%rdx
sub  $64,%rdx

# qhasm:   a += ha
# asm 1: add  <ha=int64#10,<a=int64#4
# asm 2: add  <ha=%r12,<a=%rcx
add  %r12,%rcx

# qhasm:   b += hb
# asm 1: add  <hb=int64#13,<b=int64#5
# asm 2: add  <hb=%r15,<b=%r8
add  %r15,%r8

# qhasm:   c += hc
# asm 1: add  <hc=int64#12,<c=int64#6
# asm 2: add  <hc=%r14,<c=%r9
add  %r14,%r9

# qhasm:   d += hd
# asm 1: add  <hd=int64#11,<d=int64#7
# asm 2: add  <hd=%r13,<d=%rax
add  %r13,%rax

# qhasm:                   unsigned<? inlen - 64
# asm 1: cmp  $64,<inlen=int64#3
# asm 2: cmp  $64,<inlen=%rdx
cmp  $64,%rdx
# comment:fp stack unchanged by jump

# qhasm: goto mainloop if !unsigned<
jae ._mainloop
# comment:fp stack unchanged by fallthrough

# qhasm: done:
._done:

# qhasm: *(uint32 *) (state + 0) = a
# asm 1: movl   <a=int64#4d,0(<state=int64#1)
# asm 2: movl   <a=%ecx,0(<state=%rdi)
movl   %ecx,0(%rdi)

# qhasm: *(uint32 *) (state + 4) = b
# asm 1: movl   <b=int64#5d,4(<state=int64#1)
# asm 2: movl   <b=%r8d,4(<state=%rdi)
movl   %r8d,4(%rdi)

# qhasm: *(uint32 *) (state + 8) = c
# asm 1: movl   <c=int64#6d,8(<state=int64#1)
# asm 2: movl   <c=%r9d,8(<state=%rdi)
movl   %r9d,8(%rdi)

# qhasm: *(uint32 *) (state + 12) = d
# asm 1: movl   <d=int64#7d,12(<state=int64#1)
# asm 2: movl   <d=%eax,12(<state=%rdi)
movl   %eax,12(%rdi)

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

# qhasm: int64 result

# qhasm: result = inlen
# asm 1: mov  <inlen=int64#3,>result=int64#7
# asm 2: mov  <inlen=%rdx,>result=%rax
mov  %rdx,%rax

# qhasm: assign outputreg 0 to result

# qhasm: leave
add %r11,%rsp
ret
