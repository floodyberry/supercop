
# qhasm: enter crypto_hashblocks_rfsb509_amd64_3
.text
.p2align 5
.globl _crypto_hashblocks_rfsb509_amd64_3
.globl crypto_hashblocks_rfsb509_amd64_3
_crypto_hashblocks_rfsb509_amd64_3:
crypto_hashblocks_rfsb509_amd64_3:
mov %rsp,%r11
and $31,%r11
add $128,%r11
sub %r11,%rsp

# qhasm: int64 rp

# qhasm: int64 bp

# qhasm: int64 blen

# qhasm: input rp

# qhasm: input bp

# qhasm: input blen

# qhasm: int64 c1

# qhasm: int64 c2

# qhasm: int64 c3

# qhasm: int64 c4

# qhasm: int64 c5

# qhasm: int64 c6

# qhasm: int64 c7

# qhasm: caller c1

# qhasm: caller c2

# qhasm: caller c3

# qhasm: caller c4

# qhasm: caller c5

# qhasm: caller c6

# qhasm: caller c7

# qhasm: stack64 c1_stack

# qhasm: stack64 c2_stack

# qhasm: stack64 c3_stack

# qhasm: stack64 c4_stack

# qhasm: stack64 c5_stack

# qhasm: stack64 c6_stack

# qhasm: stack64 c7_stack

# qhasm: c1_stack = c1
# asm 1: movq <c1=int64#9,>c1_stack=stack64#1
# asm 2: movq <c1=%r11,>c1_stack=64(%rsp)
movq %r11,64(%rsp)

# qhasm: c2_stack = c2
# asm 1: movq <c2=int64#10,>c2_stack=stack64#2
# asm 2: movq <c2=%r12,>c2_stack=72(%rsp)
movq %r12,72(%rsp)

# qhasm: c3_stack = c3
# asm 1: movq <c3=int64#11,>c3_stack=stack64#3
# asm 2: movq <c3=%r13,>c3_stack=80(%rsp)
movq %r13,80(%rsp)

# qhasm: c4_stack = c4
# asm 1: movq <c4=int64#12,>c4_stack=stack64#4
# asm 2: movq <c4=%r14,>c4_stack=88(%rsp)
movq %r14,88(%rsp)

# qhasm: c5_stack = c5
# asm 1: movq <c5=int64#13,>c5_stack=stack64#5
# asm 2: movq <c5=%r15,>c5_stack=96(%rsp)
movq %r15,96(%rsp)

# qhasm: c6_stack = c6
# asm 1: movq <c6=int64#14,>c6_stack=stack64#6
# asm 2: movq <c6=%rbx,>c6_stack=104(%rsp)
movq %rbx,104(%rsp)

# qhasm: c7_stack = c7
# asm 1: movq <c7=int64#15,>c7_stack=stack64#7
# asm 2: movq <c7=%rbp,>c7_stack=112(%rsp)
movq %rbp,112(%rsp)

# qhasm: int64 positions

# qhasm: int64 pos

# qhasm: int64 pos0

# qhasm: int64 pos1

# qhasm: int64 pos2

# qhasm: int64 pos3

# qhasm: int64 pos4

# qhasm: int64 pos5

# qhasm: int64 pos6

# qhasm: int64 pos7

# qhasm: int6464 v0

# qhasm: int6464 v1

# qhasm: int6464 v2

# qhasm: int6464 v3

# qhasm: int6464 v4

# qhasm: int6464 v5

# qhasm: int6464 v6

# qhasm: int6464 v7

# qhasm: int6464 t0

# qhasm: int6464 t1

# qhasm: int6464 t2

# qhasm: int6464 t3

# qhasm: int6464 t4

# qhasm: int6464 t5

# qhasm: int6464 t6

# qhasm: int6464 t7

# qhasm: int6464 s0

# qhasm: int6464 s1

# qhasm: int6464 s2

# qhasm: int6464 s3

# qhasm: int6464 s4

# qhasm: int6464 s5

# qhasm: int6464 s6

# qhasm: int6464 s7

# qhasm: stack128 state0

# qhasm: stack128 state1

# qhasm: stack128 state2

# qhasm: stack128 state3

# qhasm: int6464 v

# qhasm: int64 matrix

# qhasm: matrix = crypto_hashblocks_rfsb509_amd64_3_matrix
# asm 1: mov  $crypto_hashblocks_rfsb509_amd64_3_matrix,>matrix=int64#4
# asm 2: mov  $crypto_hashblocks_rfsb509_amd64_3_matrix,>matrix=%rcx
mov  $crypto_hashblocks_rfsb509_amd64_3_matrix,%rcx

# qhasm: assign 4 to matrix

# qhasm: stack64 rp_stack

# qhasm: rp_stack = rp
# asm 1: movq <rp=int64#1,>rp_stack=stack64#8
# asm 2: movq <rp=%rdi,>rp_stack=120(%rsp)
movq %rdi,120(%rsp)

# qhasm: int64 mask

# qhasm: (uint32) mask = 0x3fc0
# asm 1: mov  $0x3fc0,>mask=int64#8d
# asm 2: mov  $0x3fc0,>mask=%r10d
mov  $0x3fc0,%r10d

# qhasm: assign 8 to mask

# qhasm: v = *(unaligned int128 *) (rp + 0)
# asm 1: movdqu 0(<rp=int64#1),>v=int6464#1
# asm 2: movdqu 0(<rp=%rdi),>v=%xmm0
movdqu 0(%rdi),%xmm0

# qhasm: state0 = v
# asm 1: movdqa <v=int6464#1,>state0=stack128#1
# asm 2: movdqa <v=%xmm0,>state0=0(%rsp)
movdqa %xmm0,0(%rsp)

# qhasm: v = *(unaligned int128 *) (rp + 16)
# asm 1: movdqu 16(<rp=int64#1),>v=int6464#1
# asm 2: movdqu 16(<rp=%rdi),>v=%xmm0
movdqu 16(%rdi),%xmm0

# qhasm: state1 = v
# asm 1: movdqa <v=int6464#1,>state1=stack128#2
# asm 2: movdqa <v=%xmm0,>state1=16(%rsp)
movdqa %xmm0,16(%rsp)

# qhasm: v = *(unaligned int128 *) (rp + 32)
# asm 1: movdqu 32(<rp=int64#1),>v=int6464#1
# asm 2: movdqu 32(<rp=%rdi),>v=%xmm0
movdqu 32(%rdi),%xmm0

# qhasm: state2 = v
# asm 1: movdqa <v=int6464#1,>state2=stack128#3
# asm 2: movdqa <v=%xmm0,>state2=32(%rsp)
movdqa %xmm0,32(%rsp)

# qhasm: v = *(unaligned int128 *) (rp + 48)
# asm 1: movdqu 48(<rp=int64#1),>v=int6464#1
# asm 2: movdqu 48(<rp=%rdi),>v=%xmm0
movdqu 48(%rdi),%xmm0

# qhasm: state3 = v
# asm 1: movdqa <v=int6464#1,>state3=stack128#4
# asm 2: movdqa <v=%xmm0,>state3=48(%rsp)
movdqa %xmm0,48(%rsp)

# qhasm:              unsigned<? blen -= 48
# asm 1: sub  $48,<blen=int64#3
# asm 2: sub  $48,<blen=%rdx
sub  $48,%rdx
# comment:fp stack unchanged by jump

# qhasm: goto done if unsigned<
jb ._done

# qhasm: mainloop:
._mainloop:

# qhasm: positions = ((uint64 *)&state0)[0]
# asm 1: movq <state0=stack128#1,>positions=int64#1
# asm 2: movq <state0=0(%rsp),>positions=%rdi
movq 0(%rsp),%rdi

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#1,>pos0=int64#5
# asm 2: mov  <positions=%rdi,>pos0=%r8
mov  %rdi,%r8

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#5
# asm 2: shl  $6,<pos0=%r8
shl  $6,%r8

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#5d
# asm 2: and  $0x3fc0,<pos0=%r8d
and  $0x3fc0,%r8d

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#1,>pos1=int64#6
# asm 2: mov  <positions=%rdi,>pos1=%r9
mov  %rdi,%r9

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#6
# asm 2: shr  $2,<pos1=%r9
shr  $2,%r9

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#6d
# asm 2: and  $0x3fc0,<pos1=%r9d
and  $0x3fc0,%r9d

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#1,>pos2=int64#7
# asm 2: mov  <positions=%rdi,>pos2=%rax
mov  %rdi,%rax

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#7
# asm 2: shr  $10,<pos2=%rax
shr  $10,%rax

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#7d
# asm 2: and  $0x3fc0,<pos2=%eax
and  $0x3fc0,%eax

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#1,>pos3=int64#8
# asm 2: mov  <positions=%rdi,>pos3=%r10
mov  %rdi,%r10

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#8
# asm 2: shr  $18,<pos3=%r10
shr  $18,%r10

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#8d
# asm 2: and  $0x3fc0,<pos3=%r10d
and  $0x3fc0,%r10d

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#8,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r10,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r10,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#8,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r10,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r10,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#8,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r10,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r10,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#8,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r10,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r10,%rcx),%xmm3

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#7,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%rax,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%rax,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%rax,%rcx,1),%xmm3

# qhasm: v4 = *(int128 *)(pos2 + 48 + matrix)
# asm 1: movdqa 48(<pos2=int64#7,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 48(<pos2=%rax,<matrix=%rcx),>v4=%xmm4
movdqa 48(%rax,%rcx),%xmm4

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%r9,%rcx,1),%xmm4

# qhasm: v5 = *(int128 *)(pos1 + 48 + matrix)
# asm 1: movdqa 48(<pos1=int64#6,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 48(<pos1=%r9,<matrix=%rcx),>v5=%xmm5
movdqa 48(%r9,%rcx),%xmm5

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#5,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%r8,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%r8,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#5,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%r8,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%r8,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#5,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%r8,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%r8,%rcx,1),%xmm5

# qhasm: v6 = *(int128 *)(pos0 + 48 + matrix)
# asm 1: movdqa 48(<pos0=int64#5,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 48(<pos0=%r8,<matrix=%rcx),>v6=%xmm6
movdqa 48(%r8,%rcx),%xmm6

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#1,>pos4=int64#5
# asm 2: mov  <positions=%rdi,>pos4=%r8
mov  %rdi,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#1,>pos5=int64#6
# asm 2: mov  <positions=%rdi,>pos5=%r9
mov  %rdi,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#1,>pos6=int64#7
# asm 2: mov  <positions=%rdi,>pos6=%rax
mov  %rdi,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#1,>pos7=int64#1
# asm 2: mov  <positions=%rdi,>pos7=%rdi
mov  %rdi,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = ((uint64 *)&state0)[1]
# asm 1: movq 8+<state0=stack128#1,>positions=int64#8
# asm 2: movq 8+<state0=0(%rsp),>positions=%r10
movq 8+0(%rsp),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = ((uint64 *)&state1)[0]
# asm 1: movq <state1=stack128#2,>positions=int64#8
# asm 2: movq <state1=16(%rsp),>positions=%r10
movq 16(%rsp),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = ((uint64 *)&state1)[1]
# asm 1: movq 8+<state1=stack128#2,>positions=int64#8
# asm 2: movq 8+<state1=16(%rsp),>positions=%r10
movq 8+16(%rsp),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = ((uint64 *)&state2)[0]
# asm 1: movq <state2=stack128#3,>positions=int64#8
# asm 2: movq <state2=32(%rsp),>positions=%r10
movq 32(%rsp),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = ((uint64 *)&state2)[1]
# asm 1: movq 8+<state2=stack128#3,>positions=int64#8
# asm 2: movq 8+<state2=32(%rsp),>positions=%r10
movq 8+32(%rsp),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = ((uint64 *)&state3)[0]
# asm 1: movq <state3=stack128#4,>positions=int64#8
# asm 2: movq <state3=48(%rsp),>positions=%r10
movq 48(%rsp),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = ((uint64 *)&state3)[1]
# asm 1: movq 8+<state3=stack128#4,>positions=int64#8
# asm 2: movq 8+<state3=48(%rsp),>positions=%r10
movq 8+48(%rsp),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = *(int64 *)(bp + 0)
# asm 1: movq   0(<bp=int64#2),>positions=int64#8
# asm 2: movq   0(<bp=%rsi),>positions=%r10
movq   0(%rsi),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = *(int64 *)(bp + 8)
# asm 1: movq   8(<bp=int64#2),>positions=int64#8
# asm 2: movq   8(<bp=%rsi),>positions=%r10
movq   8(%rsi),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = *(int64 *)(bp + 16)
# asm 1: movq   16(<bp=int64#2),>positions=int64#8
# asm 2: movq   16(<bp=%rsi),>positions=%r10
movq   16(%rsi),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = *(int64 *)(bp + 24)
# asm 1: movq   24(<bp=int64#2),>positions=int64#8
# asm 2: movq   24(<bp=%rsi),>positions=%r10
movq   24(%rsi),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = *(int64 *)(bp + 32)
# asm 1: movq   32(<bp=int64#2),>positions=int64#8
# asm 2: movq   32(<bp=%rsi),>positions=%r10
movq   32(%rsi),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: positions = *(int64 *)(bp + 40)
# asm 1: movq   40(<bp=int64#2),>positions=int64#8
# asm 2: movq   40(<bp=%rsi),>positions=%r10
movq   40(%rsi),%r10

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: pos0 = positions
# asm 1: mov  <positions=int64#8,>pos0=int64#1
# asm 2: mov  <positions=%r10,>pos0=%rdi
mov  %r10,%rdi

# qhasm: pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#1
# asm 2: shl  $6,<pos0=%rdi
shl  $6,%rdi

# qhasm: (uint32) pos0 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos0=int64#1d
# asm 2: and  $0x3fc0,<pos0=%edi
and  $0x3fc0,%edi

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: pos1 = positions
# asm 1: mov  <positions=int64#8,>pos1=int64#7
# asm 2: mov  <positions=%r10,>pos1=%rax
mov  %r10,%rax

# qhasm: (uint64) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#7
# asm 2: shr  $2,<pos1=%rax
shr  $2,%rax

# qhasm: (uint32) pos1 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos1=int64#7d
# asm 2: and  $0x3fc0,<pos1=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: pos2 = positions
# asm 1: mov  <positions=int64#8,>pos2=int64#6
# asm 2: mov  <positions=%r10,>pos2=%r9
mov  %r10,%r9

# qhasm: (uint64) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#6
# asm 2: shr  $10,<pos2=%r9
shr  $10,%r9

# qhasm: (uint32) pos2 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos2=int64#6d
# asm 2: and  $0x3fc0,<pos2=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: pos3 = positions
# asm 1: mov  <positions=int64#8,>pos3=int64#5
# asm 2: mov  <positions=%r10,>pos3=%r8
mov  %r10,%r8

# qhasm: (uint64) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#5
# asm 2: shr  $18,<pos3=%r8
shr  $18,%r8

# qhasm: (uint32) pos3 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos3=int64#5d
# asm 2: and  $0x3fc0,<pos3=%r8d
and  $0x3fc0,%r8d

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: v0 = *(int128 *)(pos3 +  0 + matrix)
# asm 1: movdqa 0(<pos3=int64#5,<matrix=int64#4),>v0=int6464#1
# asm 2: movdqa 0(<pos3=%r8,<matrix=%rcx),>v0=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm: v1 = *(int128 *)(pos3 + 16 + matrix)
# asm 1: movdqa 16(<pos3=int64#5,<matrix=int64#4),>v1=int6464#2
# asm 2: movdqa 16(<pos3=%r8,<matrix=%rcx),>v1=%xmm1
movdqa 16(%r8,%rcx),%xmm1

# qhasm: v2 = *(int128 *)(pos3 + 32 + matrix)
# asm 1: movdqa 32(<pos3=int64#5,<matrix=int64#4),>v2=int6464#3
# asm 2: movdqa 32(<pos3=%r8,<matrix=%rcx),>v2=%xmm2
movdqa 32(%r8,%rcx),%xmm2

# qhasm: v3 = *(int128 *)(pos3 + 48 + matrix)
# asm 1: movdqa 48(<pos3=int64#5,<matrix=int64#4),>v3=int6464#4
# asm 2: movdqa 48(<pos3=%r8,<matrix=%rcx),>v3=%xmm3
movdqa 48(%r8,%rcx),%xmm3

# qhasm: pos4 = positions
# asm 1: mov  <positions=int64#8,>pos4=int64#5
# asm 2: mov  <positions=%r10,>pos4=%r8
mov  %r10,%r8

# qhasm: (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#5
# asm 2: shr  $26,<pos4=%r8
shr  $26,%r8

# qhasm: (uint32) pos4 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos4=int64#5d
# asm 2: and  $0x3fc0,<pos4=%r8d
and  $0x3fc0,%r8d

# qhasm: uint32323232 v1 ^= *(int128 *)(pos2 +  0 + matrix)
# asm 1: pxor 0(<pos2=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 0(<pos2=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 0(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#6,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 16(<pos2=%r9,<matrix=%rcx,1),<v2=%xmm2
pxor 16(%r9,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#6,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 32(<pos2=%r9,<matrix=%rcx,1),<v3=%xmm3
pxor 32(%r9,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#6,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 48(<pos2=%r9,<matrix=%rcx,1),<v4=%xmm4
pxor 48(%r9,%rcx,1),%xmm4

# qhasm: pos5 = positions
# asm 1: mov  <positions=int64#8,>pos5=int64#6
# asm 2: mov  <positions=%r10,>pos5=%r9
mov  %r10,%r9

# qhasm: (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#6
# asm 2: shr  $34,<pos5=%r9
shr  $34,%r9

# qhasm: (uint32) pos5 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos5=int64#6d
# asm 2: and  $0x3fc0,<pos5=%r9d
and  $0x3fc0,%r9d

# qhasm: uint32323232 v2 ^= *(int128 *)(pos1 +  0 + matrix)
# asm 1: pxor 0(<pos1=int64#7,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 0(<pos1=%rax,<matrix=%rcx,1),<v2=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm: uint32323232 v3 ^= *(int128 *)(pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#7,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 16(<pos1=%rax,<matrix=%rcx,1),<v3=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#7,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 32(<pos1=%rax,<matrix=%rcx,1),<v4=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 48(<pos1=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 48(%rax,%rcx,1),%xmm5

# qhasm: pos6 = positions
# asm 1: mov  <positions=int64#8,>pos6=int64#7
# asm 2: mov  <positions=%r10,>pos6=%rax
mov  %r10,%rax

# qhasm: (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#7
# asm 2: shr  $42,<pos6=%rax
shr  $42,%rax

# qhasm: (uint32) pos6 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos6=int64#7d
# asm 2: and  $0x3fc0,<pos6=%eax
and  $0x3fc0,%eax

# qhasm: uint32323232 v3 ^= *(int128 *)(pos0 +  0 + matrix)
# asm 1: pxor 0(<pos0=int64#1,<matrix=int64#4,1),<v3=int6464#4
# asm 2: pxor 0(<pos0=%rdi,<matrix=%rcx,1),<v3=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm: uint32323232 v4 ^= *(int128 *)(pos0 + 16 + matrix)
# asm 1: pxor 16(<pos0=int64#1,<matrix=int64#4,1),<v4=int6464#5
# asm 2: pxor 16(<pos0=%rdi,<matrix=%rcx,1),<v4=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm: uint32323232 v5 ^= *(int128 *)(pos0 + 32 + matrix)
# asm 1: pxor 32(<pos0=int64#1,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 32(<pos0=%rdi,<matrix=%rcx,1),<v5=%xmm5
pxor 32(%rdi,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos0 + 48 + matrix)
# asm 1: pxor 48(<pos0=int64#1,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 48(<pos0=%rdi,<matrix=%rcx,1),<v6=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm: pos7 = positions
# asm 1: mov  <positions=int64#8,>pos7=int64#1
# asm 2: mov  <positions=%r10,>pos7=%rdi
mov  %r10,%rdi

# qhasm: (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#1
# asm 2: shr  $50,<pos7=%rdi
shr  $50,%rdi

# qhasm: (uint32) pos7 &= 0x3fc0
# asm 1: and  $0x3fc0,<pos7=int64#1d
# asm 2: and  $0x3fc0,<pos7=%edi
and  $0x3fc0,%edi

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#9
# asm 2: movdqa <v7=%xmm7,>t7=%xmm8
movdqa %xmm7,%xmm8

# qhasm: uint6464 t7 <<= 3
# asm 1: psllq $3,<t7=int6464#9
# asm 2: psllq $3,<t7=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v7 >>= 61
# asm 1: psrlq $61,<v7=int6464#8
# asm 2: psrlq $61,<v7=%xmm7
psrlq $61,%xmm7

# qhasm: s7[0,1,2,3] = v7[1,1,0,1]
# asm 1: pshufd $0x45,<v7=int6464#8,>s7=int6464#10
# asm 2: pshufd $0x45,<v7=%xmm7,>s7=%xmm9
pshufd $0x45,%xmm7,%xmm9

# qhasm: v7 >>= 64
# asm 1: psrldq $8,<v7=int6464#8
# asm 2: psrldq $8,<v7=%xmm7
psrldq $8,%xmm7

# qhasm: t7 ^= s7
# asm 1: pxor  <s7=int6464#10,<t7=int6464#9
# asm 2: pxor  <s7=%xmm9,<t7=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v3 ^= t7
# asm 1: pxor  <t7=int6464#9,<v3=int6464#4
# asm 2: pxor  <t7=%xmm8,<v3=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v4 ^= v7
# asm 1: pxor  <v7=int6464#8,<v4=int6464#5
# asm 2: pxor  <v7=%xmm7,<v4=%xmm4
pxor  %xmm7,%xmm4

# qhasm: t6 = v6
# asm 1: movdqa <v6=int6464#7,>t6=int6464#8
# asm 2: movdqa <v6=%xmm6,>t6=%xmm7
movdqa %xmm6,%xmm7

# qhasm: uint6464 t6 <<= 3
# asm 1: psllq $3,<t6=int6464#8
# asm 2: psllq $3,<t6=%xmm7
psllq $3,%xmm7

# qhasm: uint6464 v6 >>= 61
# asm 1: psrlq $61,<v6=int6464#7
# asm 2: psrlq $61,<v6=%xmm6
psrlq $61,%xmm6

# qhasm: s6[0,1,2,3] = v6[1,1,0,1]
# asm 1: pshufd $0x45,<v6=int6464#7,>s6=int6464#9
# asm 2: pshufd $0x45,<v6=%xmm6,>s6=%xmm8
pshufd $0x45,%xmm6,%xmm8

# qhasm: v6 >>= 64
# asm 1: psrldq $8,<v6=int6464#7
# asm 2: psrldq $8,<v6=%xmm6
psrldq $8,%xmm6

# qhasm: t6 ^= s6
# asm 1: pxor  <s6=int6464#9,<t6=int6464#8
# asm 2: pxor  <s6=%xmm8,<t6=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v2 ^= t6
# asm 1: pxor  <t6=int6464#8,<v2=int6464#3
# asm 2: pxor  <t6=%xmm7,<v2=%xmm2
pxor  %xmm7,%xmm2

# qhasm: v3 ^= v6
# asm 1: pxor  <v6=int6464#7,<v3=int6464#4
# asm 2: pxor  <v6=%xmm6,<v3=%xmm3
pxor  %xmm6,%xmm3

# qhasm: t5 = v5
# asm 1: movdqa <v5=int6464#6,>t5=int6464#7
# asm 2: movdqa <v5=%xmm5,>t5=%xmm6
movdqa %xmm5,%xmm6

# qhasm: uint6464 t5 <<= 3
# asm 1: psllq $3,<t5=int6464#7
# asm 2: psllq $3,<t5=%xmm6
psllq $3,%xmm6

# qhasm: uint6464 v5 >>= 61
# asm 1: psrlq $61,<v5=int6464#6
# asm 2: psrlq $61,<v5=%xmm5
psrlq $61,%xmm5

# qhasm: s5[0,1,2,3] = v5[1,1,0,1]
# asm 1: pshufd $0x45,<v5=int6464#6,>s5=int6464#8
# asm 2: pshufd $0x45,<v5=%xmm5,>s5=%xmm7
pshufd $0x45,%xmm5,%xmm7

# qhasm: v5 >>= 64
# asm 1: psrldq $8,<v5=int6464#6
# asm 2: psrldq $8,<v5=%xmm5
psrldq $8,%xmm5

# qhasm: t5 ^= s5
# asm 1: pxor  <s5=int6464#8,<t5=int6464#7
# asm 2: pxor  <s5=%xmm7,<t5=%xmm6
pxor  %xmm7,%xmm6

# qhasm: v1 ^= t5
# asm 1: pxor  <t5=int6464#7,<v1=int6464#2
# asm 2: pxor  <t5=%xmm6,<v1=%xmm1
pxor  %xmm6,%xmm1

# qhasm: v2 ^= v5
# asm 1: pxor  <v5=int6464#6,<v2=int6464#3
# asm 2: pxor  <v5=%xmm5,<v2=%xmm2
pxor  %xmm5,%xmm2

# qhasm: t4 = v4
# asm 1: movdqa <v4=int6464#5,>t4=int6464#6
# asm 2: movdqa <v4=%xmm4,>t4=%xmm5
movdqa %xmm4,%xmm5

# qhasm: uint6464 t4 <<= 3
# asm 1: psllq $3,<t4=int6464#6
# asm 2: psllq $3,<t4=%xmm5
psllq $3,%xmm5

# qhasm: uint6464 v4 >>= 61
# asm 1: psrlq $61,<v4=int6464#5
# asm 2: psrlq $61,<v4=%xmm4
psrlq $61,%xmm4

# qhasm: s4[0,1,2,3] = v4[1,1,0,1]
# asm 1: pshufd $0x45,<v4=int6464#5,>s4=int6464#7
# asm 2: pshufd $0x45,<v4=%xmm4,>s4=%xmm6
pshufd $0x45,%xmm4,%xmm6

# qhasm: v4 >>= 64
# asm 1: psrldq $8,<v4=int6464#5
# asm 2: psrldq $8,<v4=%xmm4
psrldq $8,%xmm4

# qhasm: t4 ^= s4
# asm 1: pxor  <s4=int6464#7,<t4=int6464#6
# asm 2: pxor  <s4=%xmm6,<t4=%xmm5
pxor  %xmm6,%xmm5

# qhasm: v0 ^= t4
# asm 1: pxor  <t4=int6464#6,<v0=int6464#1
# asm 2: pxor  <t4=%xmm5,<v0=%xmm0
pxor  %xmm5,%xmm0

# qhasm: v1 ^= v4
# asm 1: pxor  <v4=int6464#5,<v1=int6464#2
# asm 2: pxor  <v4=%xmm4,<v1=%xmm1
pxor  %xmm4,%xmm1

# qhasm: v4 = *(int128 *)(pos7 +  0 + matrix)
# asm 1: movdqa 0(<pos7=int64#1,<matrix=int64#4),>v4=int6464#5
# asm 2: movdqa 0(<pos7=%rdi,<matrix=%rcx),>v4=%xmm4
movdqa 0(%rdi,%rcx),%xmm4

# qhasm: v5 = *(int128 *)(pos7 + 16 + matrix)
# asm 1: movdqa 16(<pos7=int64#1,<matrix=int64#4),>v5=int6464#6
# asm 2: movdqa 16(<pos7=%rdi,<matrix=%rcx),>v5=%xmm5
movdqa 16(%rdi,%rcx),%xmm5

# qhasm: v6 = *(int128 *)(pos7 + 32 + matrix)
# asm 1: movdqa 32(<pos7=int64#1,<matrix=int64#4),>v6=int6464#7
# asm 2: movdqa 32(<pos7=%rdi,<matrix=%rcx),>v6=%xmm6
movdqa 32(%rdi,%rcx),%xmm6

# qhasm: v7 = *(int128 *)(pos7 + 48 + matrix)
# asm 1: movdqa 48(<pos7=int64#1,<matrix=int64#4),>v7=int6464#8
# asm 2: movdqa 48(<pos7=%rdi,<matrix=%rcx),>v7=%xmm7
movdqa 48(%rdi,%rcx),%xmm7

# qhasm: uint32323232 v5 ^= *(int128 *)(pos6 +  0 + matrix)
# asm 1: pxor 0(<pos6=int64#7,<matrix=int64#4,1),<v5=int6464#6
# asm 2: pxor 0(<pos6=%rax,<matrix=%rcx,1),<v5=%xmm5
pxor 0(%rax,%rcx,1),%xmm5

# qhasm: uint32323232 v6 ^= *(int128 *)(pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#7,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 16(<pos6=%rax,<matrix=%rcx,1),<v6=%xmm6
pxor 16(%rax,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#7,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 32(<pos6=%rax,<matrix=%rcx,1),<v7=%xmm7
pxor 32(%rax,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#7,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 48(<pos6=%rax,<matrix=%rcx,1),<v0=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm: uint32323232 v6 ^= *(int128 *)(pos5 +  0 + matrix)
# asm 1: pxor 0(<pos5=int64#6,<matrix=int64#4,1),<v6=int6464#7
# asm 2: pxor 0(<pos5=%r9,<matrix=%rcx,1),<v6=%xmm6
pxor 0(%r9,%rcx,1),%xmm6

# qhasm: uint32323232 v7 ^= *(int128 *)(pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#6,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 16(<pos5=%r9,<matrix=%rcx,1),<v7=%xmm7
pxor 16(%r9,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#6,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 32(<pos5=%r9,<matrix=%rcx,1),<v0=%xmm0
pxor 32(%r9,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#6,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 48(<pos5=%r9,<matrix=%rcx,1),<v1=%xmm1
pxor 48(%r9,%rcx,1),%xmm1

# qhasm: uint32323232 v7 ^= *(int128 *)(pos4 +  0 + matrix)
# asm 1: pxor 0(<pos4=int64#5,<matrix=int64#4,1),<v7=int6464#8
# asm 2: pxor 0(<pos4=%r8,<matrix=%rcx,1),<v7=%xmm7
pxor 0(%r8,%rcx,1),%xmm7

# qhasm: uint32323232 v0 ^= *(int128 *)(pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#5,<matrix=int64#4,1),<v0=int6464#1
# asm 2: pxor 16(<pos4=%r8,<matrix=%rcx,1),<v0=%xmm0
pxor 16(%r8,%rcx,1),%xmm0

# qhasm: uint32323232 v1 ^= *(int128 *)(pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#5,<matrix=int64#4,1),<v1=int6464#2
# asm 2: pxor 32(<pos4=%r8,<matrix=%rcx,1),<v1=%xmm1
pxor 32(%r8,%rcx,1),%xmm1

# qhasm: uint32323232 v2 ^= *(int128 *)(pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#5,<matrix=int64#4,1),<v2=int6464#3
# asm 2: pxor 48(<pos4=%r8,<matrix=%rcx,1),<v2=%xmm2
pxor 48(%r8,%rcx,1),%xmm2

# qhasm: t3 = v3
# asm 1: movdqa <v3=int6464#4,>t3=int6464#9
# asm 2: movdqa <v3=%xmm3,>t3=%xmm8
movdqa %xmm3,%xmm8

# qhasm: uint6464 t3 <<= 3
# asm 1: psllq $3,<t3=int6464#9
# asm 2: psllq $3,<t3=%xmm8
psllq $3,%xmm8

# qhasm: uint6464 v3 >>= 61
# asm 1: psrlq $61,<v3=int6464#4
# asm 2: psrlq $61,<v3=%xmm3
psrlq $61,%xmm3

# qhasm: s3[0,1,2,3] = v3[1,1,0,1]
# asm 1: pshufd $0x45,<v3=int6464#4,>s3=int6464#10
# asm 2: pshufd $0x45,<v3=%xmm3,>s3=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm: v3 >>= 64
# asm 1: psrldq $8,<v3=int6464#4
# asm 2: psrldq $8,<v3=%xmm3
psrldq $8,%xmm3

# qhasm: t3 ^= s3
# asm 1: pxor  <s3=int6464#10,<t3=int6464#9
# asm 2: pxor  <s3=%xmm9,<t3=%xmm8
pxor  %xmm9,%xmm8

# qhasm: v7 ^= t3
# asm 1: pxor  <t3=int6464#9,<v7=int6464#8
# asm 2: pxor  <t3=%xmm8,<v7=%xmm7
pxor  %xmm8,%xmm7

# qhasm: v0 ^= v3
# asm 1: pxor  <v3=int6464#4,<v0=int6464#1
# asm 2: pxor  <v3=%xmm3,<v0=%xmm0
pxor  %xmm3,%xmm0

# qhasm: t2 = v2
# asm 1: movdqa <v2=int6464#3,>t2=int6464#4
# asm 2: movdqa <v2=%xmm2,>t2=%xmm3
movdqa %xmm2,%xmm3

# qhasm: uint6464 t2 <<= 3
# asm 1: psllq $3,<t2=int6464#4
# asm 2: psllq $3,<t2=%xmm3
psllq $3,%xmm3

# qhasm: uint6464 v2 >>= 61
# asm 1: psrlq $61,<v2=int6464#3
# asm 2: psrlq $61,<v2=%xmm2
psrlq $61,%xmm2

# qhasm: s2[0,1,2,3] = v2[1,1,0,1]
# asm 1: pshufd $0x45,<v2=int6464#3,>s2=int6464#9
# asm 2: pshufd $0x45,<v2=%xmm2,>s2=%xmm8
pshufd $0x45,%xmm2,%xmm8

# qhasm: v2 >>= 64
# asm 1: psrldq $8,<v2=int6464#3
# asm 2: psrldq $8,<v2=%xmm2
psrldq $8,%xmm2

# qhasm: t2 ^= s2
# asm 1: pxor  <s2=int6464#9,<t2=int6464#4
# asm 2: pxor  <s2=%xmm8,<t2=%xmm3
pxor  %xmm8,%xmm3

# qhasm: v6 ^= t2
# asm 1: pxor  <t2=int6464#4,<v6=int6464#7
# asm 2: pxor  <t2=%xmm3,<v6=%xmm6
pxor  %xmm3,%xmm6

# qhasm: v7 ^= v2
# asm 1: pxor  <v2=int6464#3,<v7=int6464#8
# asm 2: pxor  <v2=%xmm2,<v7=%xmm7
pxor  %xmm2,%xmm7

# qhasm: t1 = v1
# asm 1: movdqa <v1=int6464#2,>t1=int6464#3
# asm 2: movdqa <v1=%xmm1,>t1=%xmm2
movdqa %xmm1,%xmm2

# qhasm: uint6464 t1 <<= 3
# asm 1: psllq $3,<t1=int6464#3
# asm 2: psllq $3,<t1=%xmm2
psllq $3,%xmm2

# qhasm: uint6464 v1 >>= 61
# asm 1: psrlq $61,<v1=int6464#2
# asm 2: psrlq $61,<v1=%xmm1
psrlq $61,%xmm1

# qhasm: s1[0,1,2,3] = v1[1,1,0,1]
# asm 1: pshufd $0x45,<v1=int6464#2,>s1=int6464#4
# asm 2: pshufd $0x45,<v1=%xmm1,>s1=%xmm3
pshufd $0x45,%xmm1,%xmm3

# qhasm: v1 >>= 64
# asm 1: psrldq $8,<v1=int6464#2
# asm 2: psrldq $8,<v1=%xmm1
psrldq $8,%xmm1

# qhasm: t1 ^= s1
# asm 1: pxor  <s1=int6464#4,<t1=int6464#3
# asm 2: pxor  <s1=%xmm3,<t1=%xmm2
pxor  %xmm3,%xmm2

# qhasm: v5 ^= t1
# asm 1: pxor  <t1=int6464#3,<v5=int6464#6
# asm 2: pxor  <t1=%xmm2,<v5=%xmm5
pxor  %xmm2,%xmm5

# qhasm: v6 ^= v1
# asm 1: pxor  <v1=int6464#2,<v6=int6464#7
# asm 2: pxor  <v1=%xmm1,<v6=%xmm6
pxor  %xmm1,%xmm6

# qhasm: t0 = v0
# asm 1: movdqa <v0=int6464#1,>t0=int6464#2
# asm 2: movdqa <v0=%xmm0,>t0=%xmm1
movdqa %xmm0,%xmm1

# qhasm: uint6464 t0 <<= 3
# asm 1: psllq $3,<t0=int6464#2
# asm 2: psllq $3,<t0=%xmm1
psllq $3,%xmm1

# qhasm: uint6464 v0 >>= 61
# asm 1: psrlq $61,<v0=int6464#1
# asm 2: psrlq $61,<v0=%xmm0
psrlq $61,%xmm0

# qhasm: s0[0,1,2,3] = v0[1,1,0,1]
# asm 1: pshufd $0x45,<v0=int6464#1,>s0=int6464#3
# asm 2: pshufd $0x45,<v0=%xmm0,>s0=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm: v0 >>= 64
# asm 1: psrldq $8,<v0=int6464#1
# asm 2: psrldq $8,<v0=%xmm0
psrldq $8,%xmm0

# qhasm: t0 ^= s0
# asm 1: pxor  <s0=int6464#3,<t0=int6464#2
# asm 2: pxor  <s0=%xmm2,<t0=%xmm1
pxor  %xmm2,%xmm1

# qhasm: v4 ^= t0
# asm 1: pxor  <t0=int6464#2,<v4=int6464#5
# asm 2: pxor  <t0=%xmm1,<v4=%xmm4
pxor  %xmm1,%xmm4

# qhasm: v5 ^= v0
# asm 1: pxor  <v0=int6464#1,<v5=int6464#6
# asm 2: pxor  <v0=%xmm0,<v5=%xmm5
pxor  %xmm0,%xmm5

# qhasm: t7 = v7
# asm 1: movdqa <v7=int6464#8,>t7=int6464#1
# asm 2: movdqa <v7=%xmm7,>t7=%xmm0
movdqa %xmm7,%xmm0

# qhasm: uint6464 t7 >>= 61
# asm 1: psrlq $61,<t7=int6464#1
# asm 2: psrlq $61,<t7=%xmm0
psrlq $61,%xmm0

# qhasm: t7 >>= 64
# asm 1: psrldq $8,<t7=int6464#1
# asm 2: psrldq $8,<t7=%xmm0
psrldq $8,%xmm0

# qhasm: v4 ^= t7
# asm 1: pxor  <t7=int6464#1,<v4=int6464#5
# asm 2: pxor  <t7=%xmm0,<v4=%xmm4
pxor  %xmm0,%xmm4

# qhasm: v7 &= crypto_hashblocks_rfsb509_amd64_3_MASK125
# asm 1: pand  crypto_hashblocks_rfsb509_amd64_3_MASK125,<v7=int6464#8
# asm 2: pand  crypto_hashblocks_rfsb509_amd64_3_MASK125,<v7=%xmm7
pand  crypto_hashblocks_rfsb509_amd64_3_MASK125,%xmm7

# qhasm: state0 = v4
# asm 1: movdqa <v4=int6464#5,>state0=stack128#1
# asm 2: movdqa <v4=%xmm4,>state0=0(%rsp)
movdqa %xmm4,0(%rsp)

# qhasm: state1 = v5
# asm 1: movdqa <v5=int6464#6,>state1=stack128#2
# asm 2: movdqa <v5=%xmm5,>state1=16(%rsp)
movdqa %xmm5,16(%rsp)

# qhasm: state2 = v6
# asm 1: movdqa <v6=int6464#7,>state2=stack128#3
# asm 2: movdqa <v6=%xmm6,>state2=32(%rsp)
movdqa %xmm6,32(%rsp)

# qhasm: state3 = v7
# asm 1: movdqa <v7=int6464#8,>state3=stack128#4
# asm 2: movdqa <v7=%xmm7,>state3=48(%rsp)
movdqa %xmm7,48(%rsp)

# qhasm: bp += 48
# asm 1: add  $48,<bp=int64#2
# asm 2: add  $48,<bp=%rsi
add  $48,%rsi

# qhasm:                   unsigned<? blen -= 48
# asm 1: sub  $48,<blen=int64#3
# asm 2: sub  $48,<blen=%rdx
sub  $48,%rdx
# comment:fp stack unchanged by jump

# qhasm: goto mainloop if !unsigned<
jae ._mainloop
# comment:fp stack unchanged by fallthrough

# qhasm: done:
._done:

# qhasm: rp = rp_stack
# asm 1: movq <rp_stack=stack64#8,>rp=int64#1
# asm 2: movq <rp_stack=120(%rsp),>rp=%rdi
movq 120(%rsp),%rdi

# qhasm: v = state0
# asm 1: movdqa <state0=stack128#1,>v=int6464#1
# asm 2: movdqa <state0=0(%rsp),>v=%xmm0
movdqa 0(%rsp),%xmm0

# qhasm: *(unaligned int128 *) (rp + 0) = v
# asm 1: movdqu <v=int6464#1,0(<rp=int64#1)
# asm 2: movdqu <v=%xmm0,0(<rp=%rdi)
movdqu %xmm0,0(%rdi)

# qhasm: v = state1
# asm 1: movdqa <state1=stack128#2,>v=int6464#1
# asm 2: movdqa <state1=16(%rsp),>v=%xmm0
movdqa 16(%rsp),%xmm0

# qhasm: *(unaligned int128 *) (rp + 16) = v
# asm 1: movdqu <v=int6464#1,16(<rp=int64#1)
# asm 2: movdqu <v=%xmm0,16(<rp=%rdi)
movdqu %xmm0,16(%rdi)

# qhasm: v = state2
# asm 1: movdqa <state2=stack128#3,>v=int6464#1
# asm 2: movdqa <state2=32(%rsp),>v=%xmm0
movdqa 32(%rsp),%xmm0

# qhasm: *(unaligned int128 *) (rp + 32) = v
# asm 1: movdqu <v=int6464#1,32(<rp=int64#1)
# asm 2: movdqu <v=%xmm0,32(<rp=%rdi)
movdqu %xmm0,32(%rdi)

# qhasm: v = state3
# asm 1: movdqa <state3=stack128#4,>v=int6464#1
# asm 2: movdqa <state3=48(%rsp),>v=%xmm0
movdqa 48(%rsp),%xmm0

# qhasm: *(unaligned int128 *) (rp + 48) = v
# asm 1: movdqu <v=int6464#1,48(<rp=int64#1)
# asm 2: movdqu <v=%xmm0,48(<rp=%rdi)
movdqu %xmm0,48(%rdi)

# qhasm: c1 = c1_stack
# asm 1: movq <c1_stack=stack64#1,>c1=int64#9
# asm 2: movq <c1_stack=64(%rsp),>c1=%r11
movq 64(%rsp),%r11

# qhasm: c2 = c2_stack
# asm 1: movq <c2_stack=stack64#2,>c2=int64#10
# asm 2: movq <c2_stack=72(%rsp),>c2=%r12
movq 72(%rsp),%r12

# qhasm: c3 = c3_stack
# asm 1: movq <c3_stack=stack64#3,>c3=int64#11
# asm 2: movq <c3_stack=80(%rsp),>c3=%r13
movq 80(%rsp),%r13

# qhasm: c4 = c4_stack
# asm 1: movq <c4_stack=stack64#4,>c4=int64#12
# asm 2: movq <c4_stack=88(%rsp),>c4=%r14
movq 88(%rsp),%r14

# qhasm: c5 = c5_stack
# asm 1: movq <c5_stack=stack64#5,>c5=int64#13
# asm 2: movq <c5_stack=96(%rsp),>c5=%r15
movq 96(%rsp),%r15

# qhasm: c6 = c6_stack
# asm 1: movq <c6_stack=stack64#6,>c6=int64#14
# asm 2: movq <c6_stack=104(%rsp),>c6=%rbx
movq 104(%rsp),%rbx

# qhasm: c7 = c7_stack
# asm 1: movq <c7_stack=stack64#7,>c7=int64#15
# asm 2: movq <c7_stack=112(%rsp),>c7=%rbp
movq 112(%rsp),%rbp

# qhasm: int64 result

# qhasm: result = blen + 48
# asm 1: lea  48(<blen=int64#3),>result=int64#7
# asm 2: lea  48(<blen=%rdx),>result=%rax
lea  48(%rdx),%rax

# qhasm: assign outputreg 0 to result

# qhasm: leave
add %r11,%rsp
ret
