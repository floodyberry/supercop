
# qhasm: int64 statep

# qhasm: input statep

# qhasm: int64 bidx

# qhasm: int64 k

# qhasm: int64 l

# qhasm: int64 index

# qhasm: int64 i

# qhasm: int64 temp

# qhasm: int64 bufferp

# qhasm: int64 syndromep

# qhasm: int64 t0

# qhasm: int64 t1

# qhasm: int64 t2

# qhasm: int64 t3

# qhasm: int6464 s0

# qhasm: int6464 s1

# qhasm: int6464 s2

# qhasm: int6464 s3

# qhasm: int6464 s4

# qhasm: int6464 s5

# qhasm: int6464 s6

# qhasm: int6464 s7

# qhasm: int6464 s0t

# qhasm: int6464 s1t

# qhasm: int6464 s2t

# qhasm: int6464 s3t

# qhasm: int6464 s4t

# qhasm: int6464 s5t

# qhasm: int6464 s6t

# qhasm: int6464 s7t

# qhasm: enter performHash256
.text
.p2align 5
.globl _performHash256
.globl performHash256
_performHash256:
performHash256:
mov %rsp,%r11
and $31,%r11
add $0,%r11
sub %r11,%rsp

# qhasm: syndromep = *(uint64 *)(statep + 0)
# asm 1: movq   0(<statep=int64#1),>syndromep=int64#2
# asm 2: movq   0(<statep=%rdi),>syndromep=%rsi
movq   0(%rdi),%rsi

# qhasm: bufferp = *(uint64 *)(statep + 16)
# asm 1: movq   16(<statep=int64#1),>bufferp=int64#3
# asm 2: movq   16(<statep=%rdi),>bufferp=%rdx
movq   16(%rdi),%rdx

# qhasm: i = 0
# asm 1: mov  $0,>i=int64#5
# asm 2: mov  $0,>i=%r8
mov  $0,%r8

# qhasm: s0 = 0
# asm 1: pxor   >s0=int6464#1,>s0=int6464#1
# asm 2: pxor   >s0=%xmm0,>s0=%xmm0
pxor   %xmm0,%xmm0

# qhasm: s1 = 0
# asm 1: pxor   >s1=int6464#2,>s1=int6464#2
# asm 2: pxor   >s1=%xmm1,>s1=%xmm1
pxor   %xmm1,%xmm1

# qhasm: s2 = 0
# asm 1: pxor   >s2=int6464#3,>s2=int6464#3
# asm 2: pxor   >s2=%xmm2,>s2=%xmm2
pxor   %xmm2,%xmm2

# qhasm: s3 = 0
# asm 1: pxor   >s3=int6464#4,>s3=int6464#4
# asm 2: pxor   >s3=%xmm3,>s3=%xmm3
pxor   %xmm3,%xmm3

# qhasm: s4 = 0
# asm 1: pxor   >s4=int6464#5,>s4=int6464#5
# asm 2: pxor   >s4=%xmm4,>s4=%xmm4
pxor   %xmm4,%xmm4

# qhasm: s5 = 0
# asm 1: pxor   >s5=int6464#6,>s5=int6464#6
# asm 2: pxor   >s5=%xmm5,>s5=%xmm5
pxor   %xmm5,%xmm5

# qhasm: s6 = 0
# asm 1: pxor   >s6=int6464#7,>s6=int6464#7
# asm 2: pxor   >s6=%xmm6,>s6=%xmm6
pxor   %xmm6,%xmm6

# qhasm: s7 = 0
# asm 1: pxor   >s7=int6464#8,>s7=int6464#8
# asm 2: pxor   >s7=%xmm7,>s7=%xmm7
pxor   %xmm7,%xmm7

# qhasm:   index = 0
# asm 1: mov  $0,>index=int64#6
# asm 2: mov  $0,>index=%r9
mov  $0,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 0)
# asm 1: xorb 0(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 0(<syndromep=%rsi),<index=%r9b
xorb 0(%rsi),%r9b

# qhasm:   k = 0
# asm 1: mov  $0,>k=int64#7
# asm 2: mov  $0,>k=%rax
mov  $0,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 16384
# asm 1: mov  $16384,>index=int64#6
# asm 2: mov  $16384,>index=%r9
mov  $16384,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 1)
# asm 1: xorb 1(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 1(<syndromep=%rsi),<index=%r9b
xorb 1(%rsi),%r9b

# qhasm:   k = 0
# asm 1: mov  $0,>k=int64#7
# asm 2: mov  $0,>k=%rax
mov  $0,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 32768
# asm 1: mov  $32768,>index=int64#6
# asm 2: mov  $32768,>index=%r9
mov  $32768,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 2)
# asm 1: xorb 2(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 2(<syndromep=%rsi),<index=%r9b
xorb 2(%rsi),%r9b

# qhasm:   k = 1
# asm 1: mov  $1,>k=int64#7
# asm 2: mov  $1,>k=%rax
mov  $1,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 49152
# asm 1: mov  $49152,>index=int64#6
# asm 2: mov  $49152,>index=%r9
mov  $49152,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 3)
# asm 1: xorb 3(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 3(<syndromep=%rsi),<index=%r9b
xorb 3(%rsi),%r9b

# qhasm:   k = 2
# asm 1: mov  $2,>k=int64#7
# asm 2: mov  $2,>k=%rax
mov  $2,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 65536
# asm 1: mov  $65536,>index=int64#6
# asm 2: mov  $65536,>index=%r9
mov  $65536,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 4)
# asm 1: xorb 4(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 4(<syndromep=%rsi),<index=%r9b
xorb 4(%rsi),%r9b

# qhasm:   k = 3
# asm 1: mov  $3,>k=int64#7
# asm 2: mov  $3,>k=%rax
mov  $3,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 81920
# asm 1: mov  $81920,>index=int64#6
# asm 2: mov  $81920,>index=%r9
mov  $81920,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 5)
# asm 1: xorb 5(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 5(<syndromep=%rsi),<index=%r9b
xorb 5(%rsi),%r9b

# qhasm:   k = 3
# asm 1: mov  $3,>k=int64#7
# asm 2: mov  $3,>k=%rax
mov  $3,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 98304
# asm 1: mov  $98304,>index=int64#6
# asm 2: mov  $98304,>index=%r9
mov  $98304,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 6)
# asm 1: xorb 6(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 6(<syndromep=%rsi),<index=%r9b
xorb 6(%rsi),%r9b

# qhasm:   k = 4
# asm 1: mov  $4,>k=int64#7
# asm 2: mov  $4,>k=%rax
mov  $4,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 114688
# asm 1: mov  $114688,>index=int64#6
# asm 2: mov  $114688,>index=%r9
mov  $114688,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 7)
# asm 1: xorb 7(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 7(<syndromep=%rsi),<index=%r9b
xorb 7(%rsi),%r9b

# qhasm:   k = 5
# asm 1: mov  $5,>k=int64#7
# asm 2: mov  $5,>k=%rax
mov  $5,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 131072
# asm 1: mov  $131072,>index=int64#6
# asm 2: mov  $131072,>index=%r9
mov  $131072,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 8)
# asm 1: xorb 8(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 8(<syndromep=%rsi),<index=%r9b
xorb 8(%rsi),%r9b

# qhasm:   k = 6
# asm 1: mov  $6,>k=int64#7
# asm 2: mov  $6,>k=%rax
mov  $6,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 147456
# asm 1: mov  $147456,>index=int64#6
# asm 2: mov  $147456,>index=%r9
mov  $147456,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 9)
# asm 1: xorb 9(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 9(<syndromep=%rsi),<index=%r9b
xorb 9(%rsi),%r9b

# qhasm:   k = 6
# asm 1: mov  $6,>k=int64#7
# asm 2: mov  $6,>k=%rax
mov  $6,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 163840
# asm 1: mov  $163840,>index=int64#6
# asm 2: mov  $163840,>index=%r9
mov  $163840,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 10)
# asm 1: xorb 10(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 10(<syndromep=%rsi),<index=%r9b
xorb 10(%rsi),%r9b

# qhasm:   k = 7
# asm 1: mov  $7,>k=int64#7
# asm 2: mov  $7,>k=%rax
mov  $7,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 180224
# asm 1: mov  $180224,>index=int64#6
# asm 2: mov  $180224,>index=%r9
mov  $180224,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 11)
# asm 1: xorb 11(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 11(<syndromep=%rsi),<index=%r9b
xorb 11(%rsi),%r9b

# qhasm:   k = 8
# asm 1: mov  $8,>k=int64#7
# asm 2: mov  $8,>k=%rax
mov  $8,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 196608
# asm 1: mov  $196608,>index=int64#6
# asm 2: mov  $196608,>index=%r9
mov  $196608,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 12)
# asm 1: xorb 12(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 12(<syndromep=%rsi),<index=%r9b
xorb 12(%rsi),%r9b

# qhasm:   k = 9
# asm 1: mov  $9,>k=int64#7
# asm 2: mov  $9,>k=%rax
mov  $9,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 212992
# asm 1: mov  $212992,>index=int64#6
# asm 2: mov  $212992,>index=%r9
mov  $212992,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 13)
# asm 1: xorb 13(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 13(<syndromep=%rsi),<index=%r9b
xorb 13(%rsi),%r9b

# qhasm:   k = 9
# asm 1: mov  $9,>k=int64#7
# asm 2: mov  $9,>k=%rax
mov  $9,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 229376
# asm 1: mov  $229376,>index=int64#6
# asm 2: mov  $229376,>index=%r9
mov  $229376,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 14)
# asm 1: xorb 14(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 14(<syndromep=%rsi),<index=%r9b
xorb 14(%rsi),%r9b

# qhasm:   k = 10
# asm 1: mov  $10,>k=int64#7
# asm 2: mov  $10,>k=%rax
mov  $10,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 245760
# asm 1: mov  $245760,>index=int64#6
# asm 2: mov  $245760,>index=%r9
mov  $245760,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 15)
# asm 1: xorb 15(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 15(<syndromep=%rsi),<index=%r9b
xorb 15(%rsi),%r9b

# qhasm:   k = 11
# asm 1: mov  $11,>k=int64#7
# asm 2: mov  $11,>k=%rax
mov  $11,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 262144
# asm 1: mov  $262144,>index=int64#6
# asm 2: mov  $262144,>index=%r9
mov  $262144,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 16)
# asm 1: xorb 16(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 16(<syndromep=%rsi),<index=%r9b
xorb 16(%rsi),%r9b

# qhasm:   k = 12
# asm 1: mov  $12,>k=int64#7
# asm 2: mov  $12,>k=%rax
mov  $12,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 278528
# asm 1: mov  $278528,>index=int64#6
# asm 2: mov  $278528,>index=%r9
mov  $278528,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 17)
# asm 1: xorb 17(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 17(<syndromep=%rsi),<index=%r9b
xorb 17(%rsi),%r9b

# qhasm:   k = 12
# asm 1: mov  $12,>k=int64#7
# asm 2: mov  $12,>k=%rax
mov  $12,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 294912
# asm 1: mov  $294912,>index=int64#6
# asm 2: mov  $294912,>index=%r9
mov  $294912,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 18)
# asm 1: xorb 18(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 18(<syndromep=%rsi),<index=%r9b
xorb 18(%rsi),%r9b

# qhasm:   k = 13
# asm 1: mov  $13,>k=int64#7
# asm 2: mov  $13,>k=%rax
mov  $13,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 311296
# asm 1: mov  $311296,>index=int64#6
# asm 2: mov  $311296,>index=%r9
mov  $311296,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 19)
# asm 1: xorb 19(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 19(<syndromep=%rsi),<index=%r9b
xorb 19(%rsi),%r9b

# qhasm:   k = 14
# asm 1: mov  $14,>k=int64#7
# asm 2: mov  $14,>k=%rax
mov  $14,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 327680
# asm 1: mov  $327680,>index=int64#6
# asm 2: mov  $327680,>index=%r9
mov  $327680,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 20)
# asm 1: xorb 20(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 20(<syndromep=%rsi),<index=%r9b
xorb 20(%rsi),%r9b

# qhasm:   k = 15
# asm 1: mov  $15,>k=int64#7
# asm 2: mov  $15,>k=%rax
mov  $15,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 344064
# asm 1: mov  $344064,>index=int64#6
# asm 2: mov  $344064,>index=%r9
mov  $344064,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 21)
# asm 1: xorb 21(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 21(<syndromep=%rsi),<index=%r9b
xorb 21(%rsi),%r9b

# qhasm:   k = 15
# asm 1: mov  $15,>k=int64#7
# asm 2: mov  $15,>k=%rax
mov  $15,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 360448
# asm 1: mov  $360448,>index=int64#6
# asm 2: mov  $360448,>index=%r9
mov  $360448,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 22)
# asm 1: xorb 22(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 22(<syndromep=%rsi),<index=%r9b
xorb 22(%rsi),%r9b

# qhasm:   k = 16
# asm 1: mov  $16,>k=int64#7
# asm 2: mov  $16,>k=%rax
mov  $16,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 376832
# asm 1: mov  $376832,>index=int64#6
# asm 2: mov  $376832,>index=%r9
mov  $376832,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 23)
# asm 1: xorb 23(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 23(<syndromep=%rsi),<index=%r9b
xorb 23(%rsi),%r9b

# qhasm:   k = 17
# asm 1: mov  $17,>k=int64#7
# asm 2: mov  $17,>k=%rax
mov  $17,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 393216
# asm 1: mov  $393216,>index=int64#6
# asm 2: mov  $393216,>index=%r9
mov  $393216,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 24)
# asm 1: xorb 24(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 24(<syndromep=%rsi),<index=%r9b
xorb 24(%rsi),%r9b

# qhasm:   k = 18
# asm 1: mov  $18,>k=int64#7
# asm 2: mov  $18,>k=%rax
mov  $18,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 409600
# asm 1: mov  $409600,>index=int64#6
# asm 2: mov  $409600,>index=%r9
mov  $409600,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 25)
# asm 1: xorb 25(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 25(<syndromep=%rsi),<index=%r9b
xorb 25(%rsi),%r9b

# qhasm:   k = 18
# asm 1: mov  $18,>k=int64#7
# asm 2: mov  $18,>k=%rax
mov  $18,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 425984
# asm 1: mov  $425984,>index=int64#6
# asm 2: mov  $425984,>index=%r9
mov  $425984,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 26)
# asm 1: xorb 26(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 26(<syndromep=%rsi),<index=%r9b
xorb 26(%rsi),%r9b

# qhasm:   k = 19
# asm 1: mov  $19,>k=int64#7
# asm 2: mov  $19,>k=%rax
mov  $19,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 442368
# asm 1: mov  $442368,>index=int64#6
# asm 2: mov  $442368,>index=%r9
mov  $442368,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 27)
# asm 1: xorb 27(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 27(<syndromep=%rsi),<index=%r9b
xorb 27(%rsi),%r9b

# qhasm:   k = 20
# asm 1: mov  $20,>k=int64#7
# asm 2: mov  $20,>k=%rax
mov  $20,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 458752
# asm 1: mov  $458752,>index=int64#6
# asm 2: mov  $458752,>index=%r9
mov  $458752,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 28)
# asm 1: xorb 28(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 28(<syndromep=%rsi),<index=%r9b
xorb 28(%rsi),%r9b

# qhasm:   k = 21
# asm 1: mov  $21,>k=int64#7
# asm 2: mov  $21,>k=%rax
mov  $21,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 475136
# asm 1: mov  $475136,>index=int64#6
# asm 2: mov  $475136,>index=%r9
mov  $475136,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 29)
# asm 1: xorb 29(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 29(<syndromep=%rsi),<index=%r9b
xorb 29(%rsi),%r9b

# qhasm:   k = 21
# asm 1: mov  $21,>k=int64#7
# asm 2: mov  $21,>k=%rax
mov  $21,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 491520
# asm 1: mov  $491520,>index=int64#6
# asm 2: mov  $491520,>index=%r9
mov  $491520,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 30)
# asm 1: xorb 30(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 30(<syndromep=%rsi),<index=%r9b
xorb 30(%rsi),%r9b

# qhasm:   k = 22
# asm 1: mov  $22,>k=int64#7
# asm 2: mov  $22,>k=%rax
mov  $22,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 507904
# asm 1: mov  $507904,>index=int64#6
# asm 2: mov  $507904,>index=%r9
mov  $507904,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 31)
# asm 1: xorb 31(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 31(<syndromep=%rsi),<index=%r9b
xorb 31(%rsi),%r9b

# qhasm:   k = 23
# asm 1: mov  $23,>k=int64#7
# asm 2: mov  $23,>k=%rax
mov  $23,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 524288
# asm 1: mov  $524288,>index=int64#6
# asm 2: mov  $524288,>index=%r9
mov  $524288,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 32)
# asm 1: xorb 32(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 32(<syndromep=%rsi),<index=%r9b
xorb 32(%rsi),%r9b

# qhasm:   k = 24
# asm 1: mov  $24,>k=int64#7
# asm 2: mov  $24,>k=%rax
mov  $24,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 540672
# asm 1: mov  $540672,>index=int64#6
# asm 2: mov  $540672,>index=%r9
mov  $540672,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 33)
# asm 1: xorb 33(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 33(<syndromep=%rsi),<index=%r9b
xorb 33(%rsi),%r9b

# qhasm:   k = 24
# asm 1: mov  $24,>k=int64#7
# asm 2: mov  $24,>k=%rax
mov  $24,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 557056
# asm 1: mov  $557056,>index=int64#6
# asm 2: mov  $557056,>index=%r9
mov  $557056,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 34)
# asm 1: xorb 34(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 34(<syndromep=%rsi),<index=%r9b
xorb 34(%rsi),%r9b

# qhasm:   k = 25
# asm 1: mov  $25,>k=int64#7
# asm 2: mov  $25,>k=%rax
mov  $25,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 573440
# asm 1: mov  $573440,>index=int64#6
# asm 2: mov  $573440,>index=%r9
mov  $573440,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 35)
# asm 1: xorb 35(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 35(<syndromep=%rsi),<index=%r9b
xorb 35(%rsi),%r9b

# qhasm:   k = 26
# asm 1: mov  $26,>k=int64#7
# asm 2: mov  $26,>k=%rax
mov  $26,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 589824
# asm 1: mov  $589824,>index=int64#6
# asm 2: mov  $589824,>index=%r9
mov  $589824,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 36)
# asm 1: xorb 36(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 36(<syndromep=%rsi),<index=%r9b
xorb 36(%rsi),%r9b

# qhasm:   k = 27
# asm 1: mov  $27,>k=int64#7
# asm 2: mov  $27,>k=%rax
mov  $27,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 606208
# asm 1: mov  $606208,>index=int64#6
# asm 2: mov  $606208,>index=%r9
mov  $606208,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 37)
# asm 1: xorb 37(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 37(<syndromep=%rsi),<index=%r9b
xorb 37(%rsi),%r9b

# qhasm:   k = 27
# asm 1: mov  $27,>k=int64#7
# asm 2: mov  $27,>k=%rax
mov  $27,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 622592
# asm 1: mov  $622592,>index=int64#6
# asm 2: mov  $622592,>index=%r9
mov  $622592,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 38)
# asm 1: xorb 38(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 38(<syndromep=%rsi),<index=%r9b
xorb 38(%rsi),%r9b

# qhasm:   k = 28
# asm 1: mov  $28,>k=int64#7
# asm 2: mov  $28,>k=%rax
mov  $28,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 638976
# asm 1: mov  $638976,>index=int64#6
# asm 2: mov  $638976,>index=%r9
mov  $638976,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 39)
# asm 1: xorb 39(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 39(<syndromep=%rsi),<index=%r9b
xorb 39(%rsi),%r9b

# qhasm:   k = 29
# asm 1: mov  $29,>k=int64#7
# asm 2: mov  $29,>k=%rax
mov  $29,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 655360
# asm 1: mov  $655360,>index=int64#6
# asm 2: mov  $655360,>index=%r9
mov  $655360,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 40)
# asm 1: xorb 40(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 40(<syndromep=%rsi),<index=%r9b
xorb 40(%rsi),%r9b

# qhasm:   k = 30
# asm 1: mov  $30,>k=int64#7
# asm 2: mov  $30,>k=%rax
mov  $30,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 671744
# asm 1: mov  $671744,>index=int64#6
# asm 2: mov  $671744,>index=%r9
mov  $671744,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 41)
# asm 1: xorb 41(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 41(<syndromep=%rsi),<index=%r9b
xorb 41(%rsi),%r9b

# qhasm:   k = 30
# asm 1: mov  $30,>k=int64#7
# asm 2: mov  $30,>k=%rax
mov  $30,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 688128
# asm 1: mov  $688128,>index=int64#6
# asm 2: mov  $688128,>index=%r9
mov  $688128,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 42)
# asm 1: xorb 42(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 42(<syndromep=%rsi),<index=%r9b
xorb 42(%rsi),%r9b

# qhasm:   k = 31
# asm 1: mov  $31,>k=int64#7
# asm 2: mov  $31,>k=%rax
mov  $31,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 704512
# asm 1: mov  $704512,>index=int64#6
# asm 2: mov  $704512,>index=%r9
mov  $704512,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 43)
# asm 1: xorb 43(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 43(<syndromep=%rsi),<index=%r9b
xorb 43(%rsi),%r9b

# qhasm:   k = 32
# asm 1: mov  $32,>k=int64#7
# asm 2: mov  $32,>k=%rax
mov  $32,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 720896
# asm 1: mov  $720896,>index=int64#6
# asm 2: mov  $720896,>index=%r9
mov  $720896,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 44)
# asm 1: xorb 44(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 44(<syndromep=%rsi),<index=%r9b
xorb 44(%rsi),%r9b

# qhasm:   k = 33
# asm 1: mov  $33,>k=int64#7
# asm 2: mov  $33,>k=%rax
mov  $33,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 737280
# asm 1: mov  $737280,>index=int64#6
# asm 2: mov  $737280,>index=%r9
mov  $737280,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 45)
# asm 1: xorb 45(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 45(<syndromep=%rsi),<index=%r9b
xorb 45(%rsi),%r9b

# qhasm:   k = 33
# asm 1: mov  $33,>k=int64#7
# asm 2: mov  $33,>k=%rax
mov  $33,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 753664
# asm 1: mov  $753664,>index=int64#6
# asm 2: mov  $753664,>index=%r9
mov  $753664,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 46)
# asm 1: xorb 46(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 46(<syndromep=%rsi),<index=%r9b
xorb 46(%rsi),%r9b

# qhasm:   k = 34
# asm 1: mov  $34,>k=int64#7
# asm 2: mov  $34,>k=%rax
mov  $34,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 770048
# asm 1: mov  $770048,>index=int64#6
# asm 2: mov  $770048,>index=%r9
mov  $770048,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 47)
# asm 1: xorb 47(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 47(<syndromep=%rsi),<index=%r9b
xorb 47(%rsi),%r9b

# qhasm:   k = 35
# asm 1: mov  $35,>k=int64#7
# asm 2: mov  $35,>k=%rax
mov  $35,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 786432
# asm 1: mov  $786432,>index=int64#6
# asm 2: mov  $786432,>index=%r9
mov  $786432,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 48)
# asm 1: xorb 48(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 48(<syndromep=%rsi),<index=%r9b
xorb 48(%rsi),%r9b

# qhasm:   k = 36
# asm 1: mov  $36,>k=int64#7
# asm 2: mov  $36,>k=%rax
mov  $36,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 802816
# asm 1: mov  $802816,>index=int64#6
# asm 2: mov  $802816,>index=%r9
mov  $802816,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 49)
# asm 1: xorb 49(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 49(<syndromep=%rsi),<index=%r9b
xorb 49(%rsi),%r9b

# qhasm:   k = 36
# asm 1: mov  $36,>k=int64#7
# asm 2: mov  $36,>k=%rax
mov  $36,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 819200
# asm 1: mov  $819200,>index=int64#6
# asm 2: mov  $819200,>index=%r9
mov  $819200,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 50)
# asm 1: xorb 50(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 50(<syndromep=%rsi),<index=%r9b
xorb 50(%rsi),%r9b

# qhasm:   k = 37
# asm 1: mov  $37,>k=int64#7
# asm 2: mov  $37,>k=%rax
mov  $37,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 835584
# asm 1: mov  $835584,>index=int64#6
# asm 2: mov  $835584,>index=%r9
mov  $835584,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 51)
# asm 1: xorb 51(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 51(<syndromep=%rsi),<index=%r9b
xorb 51(%rsi),%r9b

# qhasm:   k = 38
# asm 1: mov  $38,>k=int64#7
# asm 2: mov  $38,>k=%rax
mov  $38,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 851968
# asm 1: mov  $851968,>index=int64#6
# asm 2: mov  $851968,>index=%r9
mov  $851968,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 52)
# asm 1: xorb 52(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 52(<syndromep=%rsi),<index=%r9b
xorb 52(%rsi),%r9b

# qhasm:   k = 39
# asm 1: mov  $39,>k=int64#7
# asm 2: mov  $39,>k=%rax
mov  $39,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 868352
# asm 1: mov  $868352,>index=int64#6
# asm 2: mov  $868352,>index=%r9
mov  $868352,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 53)
# asm 1: xorb 53(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 53(<syndromep=%rsi),<index=%r9b
xorb 53(%rsi),%r9b

# qhasm:   k = 39
# asm 1: mov  $39,>k=int64#7
# asm 2: mov  $39,>k=%rax
mov  $39,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 884736
# asm 1: mov  $884736,>index=int64#6
# asm 2: mov  $884736,>index=%r9
mov  $884736,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 54)
# asm 1: xorb 54(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 54(<syndromep=%rsi),<index=%r9b
xorb 54(%rsi),%r9b

# qhasm:   k = 40
# asm 1: mov  $40,>k=int64#7
# asm 2: mov  $40,>k=%rax
mov  $40,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 901120
# asm 1: mov  $901120,>index=int64#6
# asm 2: mov  $901120,>index=%r9
mov  $901120,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 55)
# asm 1: xorb 55(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 55(<syndromep=%rsi),<index=%r9b
xorb 55(%rsi),%r9b

# qhasm:   k = 41
# asm 1: mov  $41,>k=int64#7
# asm 2: mov  $41,>k=%rax
mov  $41,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 917504
# asm 1: mov  $917504,>index=int64#6
# asm 2: mov  $917504,>index=%r9
mov  $917504,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 56)
# asm 1: xorb 56(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 56(<syndromep=%rsi),<index=%r9b
xorb 56(%rsi),%r9b

# qhasm:   k = 42
# asm 1: mov  $42,>k=int64#7
# asm 2: mov  $42,>k=%rax
mov  $42,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 933888
# asm 1: mov  $933888,>index=int64#6
# asm 2: mov  $933888,>index=%r9
mov  $933888,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 57)
# asm 1: xorb 57(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 57(<syndromep=%rsi),<index=%r9b
xorb 57(%rsi),%r9b

# qhasm:   k = 42
# asm 1: mov  $42,>k=int64#7
# asm 2: mov  $42,>k=%rax
mov  $42,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 950272
# asm 1: mov  $950272,>index=int64#6
# asm 2: mov  $950272,>index=%r9
mov  $950272,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 58)
# asm 1: xorb 58(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 58(<syndromep=%rsi),<index=%r9b
xorb 58(%rsi),%r9b

# qhasm:   k = 43
# asm 1: mov  $43,>k=int64#7
# asm 2: mov  $43,>k=%rax
mov  $43,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 966656
# asm 1: mov  $966656,>index=int64#6
# asm 2: mov  $966656,>index=%r9
mov  $966656,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 59)
# asm 1: xorb 59(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 59(<syndromep=%rsi),<index=%r9b
xorb 59(%rsi),%r9b

# qhasm:   k = 44
# asm 1: mov  $44,>k=int64#7
# asm 2: mov  $44,>k=%rax
mov  $44,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 983040
# asm 1: mov  $983040,>index=int64#6
# asm 2: mov  $983040,>index=%r9
mov  $983040,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 60)
# asm 1: xorb 60(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 60(<syndromep=%rsi),<index=%r9b
xorb 60(%rsi),%r9b

# qhasm:   k = 45
# asm 1: mov  $45,>k=int64#7
# asm 2: mov  $45,>k=%rax
mov  $45,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 999424
# asm 1: mov  $999424,>index=int64#6
# asm 2: mov  $999424,>index=%r9
mov  $999424,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 61)
# asm 1: xorb 61(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 61(<syndromep=%rsi),<index=%r9b
xorb 61(%rsi),%r9b

# qhasm:   k = 45
# asm 1: mov  $45,>k=int64#7
# asm 2: mov  $45,>k=%rax
mov  $45,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1015808
# asm 1: mov  $1015808,>index=int64#6
# asm 2: mov  $1015808,>index=%r9
mov  $1015808,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 62)
# asm 1: xorb 62(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 62(<syndromep=%rsi),<index=%r9b
xorb 62(%rsi),%r9b

# qhasm:   k = 46
# asm 1: mov  $46,>k=int64#7
# asm 2: mov  $46,>k=%rax
mov  $46,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1032192
# asm 1: mov  $1032192,>index=int64#6
# asm 2: mov  $1032192,>index=%r9
mov  $1032192,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 63)
# asm 1: xorb 63(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 63(<syndromep=%rsi),<index=%r9b
xorb 63(%rsi),%r9b

# qhasm:   k = 47
# asm 1: mov  $47,>k=int64#7
# asm 2: mov  $47,>k=%rax
mov  $47,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1048576
# asm 1: mov  $1048576,>index=int64#6
# asm 2: mov  $1048576,>index=%r9
mov  $1048576,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 64)
# asm 1: xorb 64(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 64(<syndromep=%rsi),<index=%r9b
xorb 64(%rsi),%r9b

# qhasm:   k = 48
# asm 1: mov  $48,>k=int64#7
# asm 2: mov  $48,>k=%rax
mov  $48,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1064960
# asm 1: mov  $1064960,>index=int64#6
# asm 2: mov  $1064960,>index=%r9
mov  $1064960,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 65)
# asm 1: xorb 65(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 65(<syndromep=%rsi),<index=%r9b
xorb 65(%rsi),%r9b

# qhasm:   k = 48
# asm 1: mov  $48,>k=int64#7
# asm 2: mov  $48,>k=%rax
mov  $48,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1081344
# asm 1: mov  $1081344,>index=int64#6
# asm 2: mov  $1081344,>index=%r9
mov  $1081344,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 66)
# asm 1: xorb 66(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 66(<syndromep=%rsi),<index=%r9b
xorb 66(%rsi),%r9b

# qhasm:   k = 49
# asm 1: mov  $49,>k=int64#7
# asm 2: mov  $49,>k=%rax
mov  $49,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1097728
# asm 1: mov  $1097728,>index=int64#6
# asm 2: mov  $1097728,>index=%r9
mov  $1097728,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 67)
# asm 1: xorb 67(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 67(<syndromep=%rsi),<index=%r9b
xorb 67(%rsi),%r9b

# qhasm:   k = 50
# asm 1: mov  $50,>k=int64#7
# asm 2: mov  $50,>k=%rax
mov  $50,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1114112
# asm 1: mov  $1114112,>index=int64#6
# asm 2: mov  $1114112,>index=%r9
mov  $1114112,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 68)
# asm 1: xorb 68(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 68(<syndromep=%rsi),<index=%r9b
xorb 68(%rsi),%r9b

# qhasm:   k = 51
# asm 1: mov  $51,>k=int64#7
# asm 2: mov  $51,>k=%rax
mov  $51,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1130496
# asm 1: mov  $1130496,>index=int64#6
# asm 2: mov  $1130496,>index=%r9
mov  $1130496,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 69)
# asm 1: xorb 69(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 69(<syndromep=%rsi),<index=%r9b
xorb 69(%rsi),%r9b

# qhasm:   k = 51
# asm 1: mov  $51,>k=int64#7
# asm 2: mov  $51,>k=%rax
mov  $51,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1146880
# asm 1: mov  $1146880,>index=int64#6
# asm 2: mov  $1146880,>index=%r9
mov  $1146880,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 70)
# asm 1: xorb 70(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 70(<syndromep=%rsi),<index=%r9b
xorb 70(%rsi),%r9b

# qhasm:   k = 52
# asm 1: mov  $52,>k=int64#7
# asm 2: mov  $52,>k=%rax
mov  $52,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1163264
# asm 1: mov  $1163264,>index=int64#6
# asm 2: mov  $1163264,>index=%r9
mov  $1163264,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 71)
# asm 1: xorb 71(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 71(<syndromep=%rsi),<index=%r9b
xorb 71(%rsi),%r9b

# qhasm:   k = 53
# asm 1: mov  $53,>k=int64#7
# asm 2: mov  $53,>k=%rax
mov  $53,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1179648
# asm 1: mov  $1179648,>index=int64#6
# asm 2: mov  $1179648,>index=%r9
mov  $1179648,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 72)
# asm 1: xorb 72(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 72(<syndromep=%rsi),<index=%r9b
xorb 72(%rsi),%r9b

# qhasm:   k = 54
# asm 1: mov  $54,>k=int64#7
# asm 2: mov  $54,>k=%rax
mov  $54,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1196032
# asm 1: mov  $1196032,>index=int64#6
# asm 2: mov  $1196032,>index=%r9
mov  $1196032,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 73)
# asm 1: xorb 73(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 73(<syndromep=%rsi),<index=%r9b
xorb 73(%rsi),%r9b

# qhasm:   k = 54
# asm 1: mov  $54,>k=int64#7
# asm 2: mov  $54,>k=%rax
mov  $54,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1212416
# asm 1: mov  $1212416,>index=int64#6
# asm 2: mov  $1212416,>index=%r9
mov  $1212416,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 74)
# asm 1: xorb 74(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 74(<syndromep=%rsi),<index=%r9b
xorb 74(%rsi),%r9b

# qhasm:   k = 55
# asm 1: mov  $55,>k=int64#7
# asm 2: mov  $55,>k=%rax
mov  $55,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1228800
# asm 1: mov  $1228800,>index=int64#6
# asm 2: mov  $1228800,>index=%r9
mov  $1228800,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 75)
# asm 1: xorb 75(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 75(<syndromep=%rsi),<index=%r9b
xorb 75(%rsi),%r9b

# qhasm:   k = 56
# asm 1: mov  $56,>k=int64#7
# asm 2: mov  $56,>k=%rax
mov  $56,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1245184
# asm 1: mov  $1245184,>index=int64#6
# asm 2: mov  $1245184,>index=%r9
mov  $1245184,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 76)
# asm 1: xorb 76(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 76(<syndromep=%rsi),<index=%r9b
xorb 76(%rsi),%r9b

# qhasm:   k = 57
# asm 1: mov  $57,>k=int64#7
# asm 2: mov  $57,>k=%rax
mov  $57,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1261568
# asm 1: mov  $1261568,>index=int64#6
# asm 2: mov  $1261568,>index=%r9
mov  $1261568,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 77)
# asm 1: xorb 77(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 77(<syndromep=%rsi),<index=%r9b
xorb 77(%rsi),%r9b

# qhasm:   k = 57
# asm 1: mov  $57,>k=int64#7
# asm 2: mov  $57,>k=%rax
mov  $57,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1277952
# asm 1: mov  $1277952,>index=int64#6
# asm 2: mov  $1277952,>index=%r9
mov  $1277952,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 78)
# asm 1: xorb 78(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 78(<syndromep=%rsi),<index=%r9b
xorb 78(%rsi),%r9b

# qhasm:   k = 58
# asm 1: mov  $58,>k=int64#7
# asm 2: mov  $58,>k=%rax
mov  $58,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1294336
# asm 1: mov  $1294336,>index=int64#6
# asm 2: mov  $1294336,>index=%r9
mov  $1294336,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 79)
# asm 1: xorb 79(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 79(<syndromep=%rsi),<index=%r9b
xorb 79(%rsi),%r9b

# qhasm:   k = 59
# asm 1: mov  $59,>k=int64#7
# asm 2: mov  $59,>k=%rax
mov  $59,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1310720
# asm 1: mov  $1310720,>index=int64#6
# asm 2: mov  $1310720,>index=%r9
mov  $1310720,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 80)
# asm 1: xorb 80(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 80(<syndromep=%rsi),<index=%r9b
xorb 80(%rsi),%r9b

# qhasm:   k = 60
# asm 1: mov  $60,>k=int64#7
# asm 2: mov  $60,>k=%rax
mov  $60,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1327104
# asm 1: mov  $1327104,>index=int64#6
# asm 2: mov  $1327104,>index=%r9
mov  $1327104,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 81)
# asm 1: xorb 81(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 81(<syndromep=%rsi),<index=%r9b
xorb 81(%rsi),%r9b

# qhasm:   k = 60
# asm 1: mov  $60,>k=int64#7
# asm 2: mov  $60,>k=%rax
mov  $60,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1343488
# asm 1: mov  $1343488,>index=int64#6
# asm 2: mov  $1343488,>index=%r9
mov  $1343488,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 82)
# asm 1: xorb 82(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 82(<syndromep=%rsi),<index=%r9b
xorb 82(%rsi),%r9b

# qhasm:   k = 61
# asm 1: mov  $61,>k=int64#7
# asm 2: mov  $61,>k=%rax
mov  $61,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1359872
# asm 1: mov  $1359872,>index=int64#6
# asm 2: mov  $1359872,>index=%r9
mov  $1359872,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 83)
# asm 1: xorb 83(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 83(<syndromep=%rsi),<index=%r9b
xorb 83(%rsi),%r9b

# qhasm:   k = 62
# asm 1: mov  $62,>k=int64#7
# asm 2: mov  $62,>k=%rax
mov  $62,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1376256
# asm 1: mov  $1376256,>index=int64#6
# asm 2: mov  $1376256,>index=%r9
mov  $1376256,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 84)
# asm 1: xorb 84(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 84(<syndromep=%rsi),<index=%r9b
xorb 84(%rsi),%r9b

# qhasm:   k = 63
# asm 1: mov  $63,>k=int64#7
# asm 2: mov  $63,>k=%rax
mov  $63,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1392640
# asm 1: mov  $1392640,>index=int64#6
# asm 2: mov  $1392640,>index=%r9
mov  $1392640,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 85)
# asm 1: xorb 85(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 85(<syndromep=%rsi),<index=%r9b
xorb 85(%rsi),%r9b

# qhasm:   k = 63
# asm 1: mov  $63,>k=int64#7
# asm 2: mov  $63,>k=%rax
mov  $63,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1409024
# asm 1: mov  $1409024,>index=int64#6
# asm 2: mov  $1409024,>index=%r9
mov  $1409024,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 86)
# asm 1: xorb 86(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 86(<syndromep=%rsi),<index=%r9b
xorb 86(%rsi),%r9b

# qhasm:   k = 64
# asm 1: mov  $64,>k=int64#7
# asm 2: mov  $64,>k=%rax
mov  $64,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1425408
# asm 1: mov  $1425408,>index=int64#6
# asm 2: mov  $1425408,>index=%r9
mov  $1425408,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 87)
# asm 1: xorb 87(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 87(<syndromep=%rsi),<index=%r9b
xorb 87(%rsi),%r9b

# qhasm:   k = 65
# asm 1: mov  $65,>k=int64#7
# asm 2: mov  $65,>k=%rax
mov  $65,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1441792
# asm 1: mov  $1441792,>index=int64#6
# asm 2: mov  $1441792,>index=%r9
mov  $1441792,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 88)
# asm 1: xorb 88(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 88(<syndromep=%rsi),<index=%r9b
xorb 88(%rsi),%r9b

# qhasm:   k = 66
# asm 1: mov  $66,>k=int64#7
# asm 2: mov  $66,>k=%rax
mov  $66,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1458176
# asm 1: mov  $1458176,>index=int64#6
# asm 2: mov  $1458176,>index=%r9
mov  $1458176,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 89)
# asm 1: xorb 89(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 89(<syndromep=%rsi),<index=%r9b
xorb 89(%rsi),%r9b

# qhasm:   k = 66
# asm 1: mov  $66,>k=int64#7
# asm 2: mov  $66,>k=%rax
mov  $66,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1474560
# asm 1: mov  $1474560,>index=int64#6
# asm 2: mov  $1474560,>index=%r9
mov  $1474560,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 90)
# asm 1: xorb 90(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 90(<syndromep=%rsi),<index=%r9b
xorb 90(%rsi),%r9b

# qhasm:   k = 67
# asm 1: mov  $67,>k=int64#7
# asm 2: mov  $67,>k=%rax
mov  $67,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1490944
# asm 1: mov  $1490944,>index=int64#6
# asm 2: mov  $1490944,>index=%r9
mov  $1490944,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 91)
# asm 1: xorb 91(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 91(<syndromep=%rsi),<index=%r9b
xorb 91(%rsi),%r9b

# qhasm:   k = 68
# asm 1: mov  $68,>k=int64#7
# asm 2: mov  $68,>k=%rax
mov  $68,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1507328
# asm 1: mov  $1507328,>index=int64#6
# asm 2: mov  $1507328,>index=%r9
mov  $1507328,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 92)
# asm 1: xorb 92(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 92(<syndromep=%rsi),<index=%r9b
xorb 92(%rsi),%r9b

# qhasm:   k = 69
# asm 1: mov  $69,>k=int64#7
# asm 2: mov  $69,>k=%rax
mov  $69,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1523712
# asm 1: mov  $1523712,>index=int64#6
# asm 2: mov  $1523712,>index=%r9
mov  $1523712,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 93)
# asm 1: xorb 93(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 93(<syndromep=%rsi),<index=%r9b
xorb 93(%rsi),%r9b

# qhasm:   k = 69
# asm 1: mov  $69,>k=int64#7
# asm 2: mov  $69,>k=%rax
mov  $69,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1540096
# asm 1: mov  $1540096,>index=int64#6
# asm 2: mov  $1540096,>index=%r9
mov  $1540096,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 94)
# asm 1: xorb 94(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 94(<syndromep=%rsi),<index=%r9b
xorb 94(%rsi),%r9b

# qhasm:   k = 70
# asm 1: mov  $70,>k=int64#7
# asm 2: mov  $70,>k=%rax
mov  $70,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1556480
# asm 1: mov  $1556480,>index=int64#6
# asm 2: mov  $1556480,>index=%r9
mov  $1556480,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 95)
# asm 1: xorb 95(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 95(<syndromep=%rsi),<index=%r9b
xorb 95(%rsi),%r9b

# qhasm:   k = 71
# asm 1: mov  $71,>k=int64#7
# asm 2: mov  $71,>k=%rax
mov  $71,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1572864
# asm 1: mov  $1572864,>index=int64#6
# asm 2: mov  $1572864,>index=%r9
mov  $1572864,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 96)
# asm 1: xorb 96(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 96(<syndromep=%rsi),<index=%r9b
xorb 96(%rsi),%r9b

# qhasm:   k = 72
# asm 1: mov  $72,>k=int64#7
# asm 2: mov  $72,>k=%rax
mov  $72,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1589248
# asm 1: mov  $1589248,>index=int64#6
# asm 2: mov  $1589248,>index=%r9
mov  $1589248,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 97)
# asm 1: xorb 97(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 97(<syndromep=%rsi),<index=%r9b
xorb 97(%rsi),%r9b

# qhasm:   k = 72
# asm 1: mov  $72,>k=int64#7
# asm 2: mov  $72,>k=%rax
mov  $72,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1605632
# asm 1: mov  $1605632,>index=int64#6
# asm 2: mov  $1605632,>index=%r9
mov  $1605632,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 98)
# asm 1: xorb 98(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 98(<syndromep=%rsi),<index=%r9b
xorb 98(%rsi),%r9b

# qhasm:   k = 73
# asm 1: mov  $73,>k=int64#7
# asm 2: mov  $73,>k=%rax
mov  $73,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1622016
# asm 1: mov  $1622016,>index=int64#6
# asm 2: mov  $1622016,>index=%r9
mov  $1622016,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 99)
# asm 1: xorb 99(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 99(<syndromep=%rsi),<index=%r9b
xorb 99(%rsi),%r9b

# qhasm:   k = 74
# asm 1: mov  $74,>k=int64#7
# asm 2: mov  $74,>k=%rax
mov  $74,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1638400
# asm 1: mov  $1638400,>index=int64#6
# asm 2: mov  $1638400,>index=%r9
mov  $1638400,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 100)
# asm 1: xorb 100(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 100(<syndromep=%rsi),<index=%r9b
xorb 100(%rsi),%r9b

# qhasm:   k = 75
# asm 1: mov  $75,>k=int64#7
# asm 2: mov  $75,>k=%rax
mov  $75,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1654784
# asm 1: mov  $1654784,>index=int64#6
# asm 2: mov  $1654784,>index=%r9
mov  $1654784,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 101)
# asm 1: xorb 101(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 101(<syndromep=%rsi),<index=%r9b
xorb 101(%rsi),%r9b

# qhasm:   k = 75
# asm 1: mov  $75,>k=int64#7
# asm 2: mov  $75,>k=%rax
mov  $75,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1671168
# asm 1: mov  $1671168,>index=int64#6
# asm 2: mov  $1671168,>index=%r9
mov  $1671168,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 102)
# asm 1: xorb 102(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 102(<syndromep=%rsi),<index=%r9b
xorb 102(%rsi),%r9b

# qhasm:   k = 76
# asm 1: mov  $76,>k=int64#7
# asm 2: mov  $76,>k=%rax
mov  $76,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1687552
# asm 1: mov  $1687552,>index=int64#6
# asm 2: mov  $1687552,>index=%r9
mov  $1687552,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 103)
# asm 1: xorb 103(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 103(<syndromep=%rsi),<index=%r9b
xorb 103(%rsi),%r9b

# qhasm:   k = 77
# asm 1: mov  $77,>k=int64#7
# asm 2: mov  $77,>k=%rax
mov  $77,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1703936
# asm 1: mov  $1703936,>index=int64#6
# asm 2: mov  $1703936,>index=%r9
mov  $1703936,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 104)
# asm 1: xorb 104(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 104(<syndromep=%rsi),<index=%r9b
xorb 104(%rsi),%r9b

# qhasm:   k = 78
# asm 1: mov  $78,>k=int64#7
# asm 2: mov  $78,>k=%rax
mov  $78,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1720320
# asm 1: mov  $1720320,>index=int64#6
# asm 2: mov  $1720320,>index=%r9
mov  $1720320,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 105)
# asm 1: xorb 105(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 105(<syndromep=%rsi),<index=%r9b
xorb 105(%rsi),%r9b

# qhasm:   k = 78
# asm 1: mov  $78,>k=int64#7
# asm 2: mov  $78,>k=%rax
mov  $78,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1736704
# asm 1: mov  $1736704,>index=int64#6
# asm 2: mov  $1736704,>index=%r9
mov  $1736704,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 106)
# asm 1: xorb 106(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 106(<syndromep=%rsi),<index=%r9b
xorb 106(%rsi),%r9b

# qhasm:   k = 79
# asm 1: mov  $79,>k=int64#7
# asm 2: mov  $79,>k=%rax
mov  $79,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1753088
# asm 1: mov  $1753088,>index=int64#6
# asm 2: mov  $1753088,>index=%r9
mov  $1753088,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 107)
# asm 1: xorb 107(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 107(<syndromep=%rsi),<index=%r9b
xorb 107(%rsi),%r9b

# qhasm:   k = 80
# asm 1: mov  $80,>k=int64#7
# asm 2: mov  $80,>k=%rax
mov  $80,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1769472
# asm 1: mov  $1769472,>index=int64#6
# asm 2: mov  $1769472,>index=%r9
mov  $1769472,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 108)
# asm 1: xorb 108(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 108(<syndromep=%rsi),<index=%r9b
xorb 108(%rsi),%r9b

# qhasm:   k = 81
# asm 1: mov  $81,>k=int64#7
# asm 2: mov  $81,>k=%rax
mov  $81,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1785856
# asm 1: mov  $1785856,>index=int64#6
# asm 2: mov  $1785856,>index=%r9
mov  $1785856,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 109)
# asm 1: xorb 109(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 109(<syndromep=%rsi),<index=%r9b
xorb 109(%rsi),%r9b

# qhasm:   k = 81
# asm 1: mov  $81,>k=int64#7
# asm 2: mov  $81,>k=%rax
mov  $81,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1802240
# asm 1: mov  $1802240,>index=int64#6
# asm 2: mov  $1802240,>index=%r9
mov  $1802240,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 110)
# asm 1: xorb 110(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 110(<syndromep=%rsi),<index=%r9b
xorb 110(%rsi),%r9b

# qhasm:   k = 82
# asm 1: mov  $82,>k=int64#7
# asm 2: mov  $82,>k=%rax
mov  $82,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1818624
# asm 1: mov  $1818624,>index=int64#6
# asm 2: mov  $1818624,>index=%r9
mov  $1818624,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 111)
# asm 1: xorb 111(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 111(<syndromep=%rsi),<index=%r9b
xorb 111(%rsi),%r9b

# qhasm:   k = 83
# asm 1: mov  $83,>k=int64#7
# asm 2: mov  $83,>k=%rax
mov  $83,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1835008
# asm 1: mov  $1835008,>index=int64#6
# asm 2: mov  $1835008,>index=%r9
mov  $1835008,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 112)
# asm 1: xorb 112(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 112(<syndromep=%rsi),<index=%r9b
xorb 112(%rsi),%r9b

# qhasm:   k = 84
# asm 1: mov  $84,>k=int64#7
# asm 2: mov  $84,>k=%rax
mov  $84,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1851392
# asm 1: mov  $1851392,>index=int64#6
# asm 2: mov  $1851392,>index=%r9
mov  $1851392,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 113)
# asm 1: xorb 113(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 113(<syndromep=%rsi),<index=%r9b
xorb 113(%rsi),%r9b

# qhasm:   k = 84
# asm 1: mov  $84,>k=int64#7
# asm 2: mov  $84,>k=%rax
mov  $84,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1867776
# asm 1: mov  $1867776,>index=int64#6
# asm 2: mov  $1867776,>index=%r9
mov  $1867776,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 114)
# asm 1: xorb 114(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 114(<syndromep=%rsi),<index=%r9b
xorb 114(%rsi),%r9b

# qhasm:   k = 85
# asm 1: mov  $85,>k=int64#7
# asm 2: mov  $85,>k=%rax
mov  $85,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1884160
# asm 1: mov  $1884160,>index=int64#6
# asm 2: mov  $1884160,>index=%r9
mov  $1884160,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 115)
# asm 1: xorb 115(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 115(<syndromep=%rsi),<index=%r9b
xorb 115(%rsi),%r9b

# qhasm:   k = 86
# asm 1: mov  $86,>k=int64#7
# asm 2: mov  $86,>k=%rax
mov  $86,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1900544
# asm 1: mov  $1900544,>index=int64#6
# asm 2: mov  $1900544,>index=%r9
mov  $1900544,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 116)
# asm 1: xorb 116(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 116(<syndromep=%rsi),<index=%r9b
xorb 116(%rsi),%r9b

# qhasm:   k = 87
# asm 1: mov  $87,>k=int64#7
# asm 2: mov  $87,>k=%rax
mov  $87,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1916928
# asm 1: mov  $1916928,>index=int64#6
# asm 2: mov  $1916928,>index=%r9
mov  $1916928,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 117)
# asm 1: xorb 117(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 117(<syndromep=%rsi),<index=%r9b
xorb 117(%rsi),%r9b

# qhasm:   k = 87
# asm 1: mov  $87,>k=int64#7
# asm 2: mov  $87,>k=%rax
mov  $87,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1933312
# asm 1: mov  $1933312,>index=int64#6
# asm 2: mov  $1933312,>index=%r9
mov  $1933312,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 118)
# asm 1: xorb 118(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 118(<syndromep=%rsi),<index=%r9b
xorb 118(%rsi),%r9b

# qhasm:   k = 88
# asm 1: mov  $88,>k=int64#7
# asm 2: mov  $88,>k=%rax
mov  $88,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1949696
# asm 1: mov  $1949696,>index=int64#6
# asm 2: mov  $1949696,>index=%r9
mov  $1949696,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 119)
# asm 1: xorb 119(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 119(<syndromep=%rsi),<index=%r9b
xorb 119(%rsi),%r9b

# qhasm:   k = 89
# asm 1: mov  $89,>k=int64#7
# asm 2: mov  $89,>k=%rax
mov  $89,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1966080
# asm 1: mov  $1966080,>index=int64#6
# asm 2: mov  $1966080,>index=%r9
mov  $1966080,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 120)
# asm 1: xorb 120(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 120(<syndromep=%rsi),<index=%r9b
xorb 120(%rsi),%r9b

# qhasm:   k = 90
# asm 1: mov  $90,>k=int64#7
# asm 2: mov  $90,>k=%rax
mov  $90,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1982464
# asm 1: mov  $1982464,>index=int64#6
# asm 2: mov  $1982464,>index=%r9
mov  $1982464,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 121)
# asm 1: xorb 121(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 121(<syndromep=%rsi),<index=%r9b
xorb 121(%rsi),%r9b

# qhasm:   k = 90
# asm 1: mov  $90,>k=int64#7
# asm 2: mov  $90,>k=%rax
mov  $90,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 1998848
# asm 1: mov  $1998848,>index=int64#6
# asm 2: mov  $1998848,>index=%r9
mov  $1998848,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 122)
# asm 1: xorb 122(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 122(<syndromep=%rsi),<index=%r9b
xorb 122(%rsi),%r9b

# qhasm:   k = 91
# asm 1: mov  $91,>k=int64#7
# asm 2: mov  $91,>k=%rax
mov  $91,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 2015232
# asm 1: mov  $2015232,>index=int64#6
# asm 2: mov  $2015232,>index=%r9
mov  $2015232,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 123)
# asm 1: xorb 123(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 123(<syndromep=%rsi),<index=%r9b
xorb 123(%rsi),%r9b

# qhasm:   k = 92
# asm 1: mov  $92,>k=int64#7
# asm 2: mov  $92,>k=%rax
mov  $92,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 2031616
# asm 1: mov  $2031616,>index=int64#6
# asm 2: mov  $2031616,>index=%r9
mov  $2031616,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 124)
# asm 1: xorb 124(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 124(<syndromep=%rsi),<index=%r9b
xorb 124(%rsi),%r9b

# qhasm:   k = 93
# asm 1: mov  $93,>k=int64#7
# asm 2: mov  $93,>k=%rax
mov  $93,%rax

# qhasm:   l = 10
# asm 1: mov  $10,>l=int64#4
# asm 2: mov  $10,>l=%rcx
mov  $10,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 2048000
# asm 1: mov  $2048000,>index=int64#6
# asm 2: mov  $2048000,>index=%r9
mov  $2048000,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 125)
# asm 1: xorb 125(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 125(<syndromep=%rsi),<index=%r9b
xorb 125(%rsi),%r9b

# qhasm:   k = 93
# asm 1: mov  $93,>k=int64#7
# asm 2: mov  $93,>k=%rax
mov  $93,%rax

# qhasm:   l = 4
# asm 1: mov  $4,>l=int64#4
# asm 2: mov  $4,>l=%rcx
mov  $4,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 2064384
# asm 1: mov  $2064384,>index=int64#6
# asm 2: mov  $2064384,>index=%r9
mov  $2064384,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 126)
# asm 1: xorb 126(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 126(<syndromep=%rsi),<index=%r9b
xorb 126(%rsi),%r9b

# qhasm:   k = 94
# asm 1: mov  $94,>k=int64#7
# asm 2: mov  $94,>k=%rax
mov  $94,%rax

# qhasm:   l = 6
# asm 1: mov  $6,>l=int64#4
# asm 2: mov  $6,>l=%rcx
mov  $6,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#4
# asm 2: mov  <index=%r9,>bidx=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#4d
# asm 2: shr  $10,<bidx=%ecx
shr  $10,%ecx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#4,>t0=int64#4
# asm 2: imul  $2088,<bidx=%rcx,>t0=%rcx
imul  $2088,%rcx,%rcx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#7
# asm 2: mov  <index=%r9,>t1=%rax
mov  %r9,%rax

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#7d
# asm 2: and  $7,<t1=%eax
and  $7,%eax

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#7,>t1=int64#7
# asm 2: imul  $261,<t1=%rax,>t1=%rax
imul  $261,%rax,%rax

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#8
# asm 2: mov  $128,>t2=%r10
mov  $128,%r10

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#8
# asm 2: sub  <t3=%r9,<t2=%r10
sub  %r9,%r10

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#4,<temp=int64#6
# asm 2: add  <t0=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#7,<temp=int64#6
# asm 2: add  <t1=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#8,<temp=int64#6
# asm 2: add  <t2=%r10,<temp=%r9
add  %r10,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm:   index = 2080768
# asm 1: mov  $2080768,>index=int64#6
# asm 2: mov  $2080768,>index=%r9
mov  $2080768,%r9

# qhasm:   (uint8) index ^= *(uint8 *)(syndromep + 127)
# asm 1: xorb 127(<syndromep=int64#2),<index=int64#6b
# asm 2: xorb 127(<syndromep=%rsi),<index=%r9b
xorb 127(%rsi),%r9b

# qhasm:   k = 95
# asm 1: mov  $95,>k=int64#7
# asm 2: mov  $95,>k=%rax
mov  $95,%rax

# qhasm:   l = 8
# asm 1: mov  $8,>l=int64#4
# asm 2: mov  $8,>l=%rcx
mov  $8,%rcx

# qhasm:   t0 = *(uint8 *)(bufferp + k)
# asm 1: movzbq (<bufferp=int64#3,<k=int64#7),>t0=int64#8
# asm 2: movzbq (<bufferp=%rdx,<k=%rax),>t0=%r10
movzbq (%rdx,%rax),%r10

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   (uint8) t0 ^= *(uint8 *)(bufferp + k + 1)
# asm 1: xorb 1(<bufferp=int64#3,<k=int64#7),<t0=int64#8b
# asm 2: xorb 1(<bufferp=%rdx,<k=%rax),<t0=%r10b
xorb 1(%rdx,%rax),%r10b

# qhasm:   (uint64) t0 >>= l
# asm 1: shr  %cl,<t0=int64#8
# asm 2: shr  %cl,<t0=%r10
shr  %cl,%r10

# qhasm:   (uint32) t0 &= 0x3f
# asm 1: and  $0x3f,<t0=int64#8d
# asm 2: and  $0x3f,<t0=%r10d
and  $0x3f,%r10d

# qhasm:   t0 <<= 8
# asm 1: shl  $8,<t0=int64#8
# asm 2: shl  $8,<t0=%r10
shl  $8,%r10

# qhasm:   index ^= t0
# asm 1: xor  <t0=int64#8,<index=int64#6
# asm 2: xor  <t0=%r10,<index=%r9
xor  %r10,%r9

# qhasm:   bidx = index
# asm 1: mov  <index=int64#6,>bidx=int64#3
# asm 2: mov  <index=%r9,>bidx=%rdx
mov  %r9,%rdx

# qhasm:   (uint32) bidx >>= 10
# asm 1: shr  $10,<bidx=int64#3d
# asm 2: shr  $10,<bidx=%edx
shr  $10,%edx

# qhasm:   (uint32) index &= 1023
# asm 1: and  $1023,<index=int64#6d
# asm 2: and  $1023,<index=%r9d
and  $1023,%r9d

# qhasm:   t0 = bidx * 2088
# asm 1: imul  $2088,<bidx=int64#3,>t0=int64#3
# asm 2: imul  $2088,<bidx=%rdx,>t0=%rdx
imul  $2088,%rdx,%rdx

# qhasm:   t1 = index 
# asm 1: mov  <index=int64#6,>t1=int64#4
# asm 2: mov  <index=%r9,>t1=%rcx
mov  %r9,%rcx

# qhasm:   (uint32) t1 &= 7
# asm 1: and  $7,<t1=int64#4d
# asm 2: and  $7,<t1=%ecx
and  $7,%ecx

# qhasm:   t1 = t1 * 261
# asm 1: imul  $261,<t1=int64#4,>t1=int64#4
# asm 2: imul  $261,<t1=%rcx,>t1=%rcx
imul  $261,%rcx,%rcx

# qhasm:   t2 = 128
# asm 1: mov  $128,>t2=int64#7
# asm 2: mov  $128,>t2=%rax
mov  $128,%rax

# qhasm:   t3 = index
# asm 1: mov  <index=int64#6,>t3=int64#6
# asm 2: mov  <index=%r9,>t3=%r9
mov  %r9,%r9

# qhasm:   (uint32) t3 >>= 3
# asm 1: shr  $3,<t3=int64#6d
# asm 2: shr  $3,<t3=%r9d
shr  $3,%r9d

# qhasm:   t2 -= t3
# asm 1: sub  <t3=int64#6,<t2=int64#7
# asm 2: sub  <t3=%r9,<t2=%rax
sub  %r9,%rax

# qhasm:   temp = &fsb256_first_line
# asm 1: lea  fsb256_first_line(%rip),>temp=int64#6
# asm 2: lea  fsb256_first_line(%rip),>temp=%r9
lea  fsb256_first_line(%rip),%r9

# qhasm:   temp += t0
# asm 1: add  <t0=int64#3,<temp=int64#6
# asm 2: add  <t0=%rdx,<temp=%r9
add  %rdx,%r9

# qhasm:   temp += t1
# asm 1: add  <t1=int64#4,<temp=int64#6
# asm 2: add  <t1=%rcx,<temp=%r9
add  %rcx,%r9

# qhasm:   temp += t2
# asm 1: add  <t2=int64#7,<temp=int64#6
# asm 2: add  <t2=%rax,<temp=%r9
add  %rax,%r9

# qhasm:   (unaligned) s0t = *(int128 *)(temp + 0)
# asm 1: movdqu 0(<temp=int64#6),>s0t=int6464#9
# asm 2: movdqu 0(<temp=%r9),>s0t=%xmm8
movdqu 0(%r9),%xmm8

# qhasm:   (unaligned) s1t = *(int128 *)(temp + 16)
# asm 1: movdqu 16(<temp=int64#6),>s1t=int6464#10
# asm 2: movdqu 16(<temp=%r9),>s1t=%xmm9
movdqu 16(%r9),%xmm9

# qhasm:   (unaligned) s2t = *(int128 *)(temp + 32)
# asm 1: movdqu 32(<temp=int64#6),>s2t=int6464#11
# asm 2: movdqu 32(<temp=%r9),>s2t=%xmm10
movdqu 32(%r9),%xmm10

# qhasm:   (unaligned) s3t = *(int128 *)(temp + 48)
# asm 1: movdqu 48(<temp=int64#6),>s3t=int6464#12
# asm 2: movdqu 48(<temp=%r9),>s3t=%xmm11
movdqu 48(%r9),%xmm11

# qhasm:   (unaligned) s4t = *(int128 *)(temp + 64)
# asm 1: movdqu 64(<temp=int64#6),>s4t=int6464#13
# asm 2: movdqu 64(<temp=%r9),>s4t=%xmm12
movdqu 64(%r9),%xmm12

# qhasm:   (unaligned) s5t = *(int128 *)(temp + 80)
# asm 1: movdqu 80(<temp=int64#6),>s5t=int6464#14
# asm 2: movdqu 80(<temp=%r9),>s5t=%xmm13
movdqu 80(%r9),%xmm13

# qhasm:   (unaligned) s6t = *(int128 *)(temp + 96)
# asm 1: movdqu 96(<temp=int64#6),>s6t=int6464#15
# asm 2: movdqu 96(<temp=%r9),>s6t=%xmm14
movdqu 96(%r9),%xmm14

# qhasm:   (unaligned) s7t = *(int128 *)(temp + 112)
# asm 1: movdqu 112(<temp=int64#6),>s7t=int6464#16
# asm 2: movdqu 112(<temp=%r9),>s7t=%xmm15
movdqu 112(%r9),%xmm15

# qhasm:   s0 ^= s0t
# asm 1: pxor  <s0t=int6464#9,<s0=int6464#1
# asm 2: pxor  <s0t=%xmm8,<s0=%xmm0
pxor  %xmm8,%xmm0

# qhasm:   s1 ^= s1t
# asm 1: pxor  <s1t=int6464#10,<s1=int6464#2
# asm 2: pxor  <s1t=%xmm9,<s1=%xmm1
pxor  %xmm9,%xmm1

# qhasm:   s2 ^= s2t
# asm 1: pxor  <s2t=int6464#11,<s2=int6464#3
# asm 2: pxor  <s2t=%xmm10,<s2=%xmm2
pxor  %xmm10,%xmm2

# qhasm:   s3 ^= s3t
# asm 1: pxor  <s3t=int6464#12,<s3=int6464#4
# asm 2: pxor  <s3t=%xmm11,<s3=%xmm3
pxor  %xmm11,%xmm3

# qhasm:   s4 ^= s4t
# asm 1: pxor  <s4t=int6464#13,<s4=int6464#5
# asm 2: pxor  <s4t=%xmm12,<s4=%xmm4
pxor  %xmm12,%xmm4

# qhasm:   s5 ^= s5t
# asm 1: pxor  <s5t=int6464#14,<s5=int6464#6
# asm 2: pxor  <s5t=%xmm13,<s5=%xmm5
pxor  %xmm13,%xmm5

# qhasm:   s6 ^= s6t
# asm 1: pxor  <s6t=int6464#15,<s6=int6464#7
# asm 2: pxor  <s6t=%xmm14,<s6=%xmm6
pxor  %xmm14,%xmm6

# qhasm:   s7 ^= s7t
# asm 1: pxor  <s7t=int6464#16,<s7=int6464#8
# asm 2: pxor  <s7t=%xmm15,<s7=%xmm7
pxor  %xmm15,%xmm7

# qhasm: *(int128 *)(syndromep + 0) = s0
# asm 1: movdqa <s0=int6464#1,0(<syndromep=int64#2)
# asm 2: movdqa <s0=%xmm0,0(<syndromep=%rsi)
movdqa %xmm0,0(%rsi)

# qhasm: *(int128 *)(syndromep + 16) = s1
# asm 1: movdqa <s1=int6464#2,16(<syndromep=int64#2)
# asm 2: movdqa <s1=%xmm1,16(<syndromep=%rsi)
movdqa %xmm1,16(%rsi)

# qhasm: *(int128 *)(syndromep + 32) = s2
# asm 1: movdqa <s2=int6464#3,32(<syndromep=int64#2)
# asm 2: movdqa <s2=%xmm2,32(<syndromep=%rsi)
movdqa %xmm2,32(%rsi)

# qhasm: *(int128 *)(syndromep + 48) = s3
# asm 1: movdqa <s3=int6464#4,48(<syndromep=int64#2)
# asm 2: movdqa <s3=%xmm3,48(<syndromep=%rsi)
movdqa %xmm3,48(%rsi)

# qhasm: *(int128 *)(syndromep + 64) = s4
# asm 1: movdqa <s4=int6464#5,64(<syndromep=int64#2)
# asm 2: movdqa <s4=%xmm4,64(<syndromep=%rsi)
movdqa %xmm4,64(%rsi)

# qhasm: *(int128 *)(syndromep + 80) = s5
# asm 1: movdqa <s5=int6464#6,80(<syndromep=int64#2)
# asm 2: movdqa <s5=%xmm5,80(<syndromep=%rsi)
movdqa %xmm5,80(%rsi)

# qhasm: *(int128 *)(syndromep + 96) = s6
# asm 1: movdqa <s6=int6464#7,96(<syndromep=int64#2)
# asm 2: movdqa <s6=%xmm6,96(<syndromep=%rsi)
movdqa %xmm6,96(%rsi)

# qhasm: *(int128 *)(syndromep + 112) = s7
# asm 1: movdqa <s7=int6464#8,112(<syndromep=int64#2)
# asm 2: movdqa <s7=%xmm7,112(<syndromep=%rsi)
movdqa %xmm7,112(%rsi)

# qhasm: *(uint32 *)(statep + 24) = 0
# asm 1: movl   $0,24(<statep=int64#1)
# asm 2: movl   $0,24(<statep=%rdi)
movl   $0,24(%rdi)

# qhasm: leave
add %r11,%rsp
mov %rdi,%rax
mov %rsi,%rdx
ret
