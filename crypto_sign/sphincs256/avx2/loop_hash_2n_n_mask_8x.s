
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

# qhasm: reg256 x0

# qhasm: reg256 x1

# qhasm: reg256 x2

# qhasm: reg256 x3

# qhasm: reg256 x4

# qhasm: reg256 x5

# qhasm: reg256 x6

# qhasm: reg256 x7

# qhasm: reg256 x8

# qhasm: reg256 x9

# qhasm: reg256 x10

# qhasm: reg256 x11

# qhasm: reg256 x12

# qhasm: reg256 x13

# qhasm: reg256 x14

# qhasm: reg256 x15

# qhasm: stack256 x6stack

# qhasm: stack256 x10stack

# qhasm: stack256 x11stack

# qhasm: stack256 x15stack

# qhasm: stack256 x4stack

# qhasm: stack256 x8stack

# qhasm: stack256 x9stack

# qhasm: stack256 x13stack

# qhasm: stack2048 buf

# qhasm: reg256 rotate8

# qhasm: reg256 rotate16

# qhasm: reg256 mask

# qhasm: reg256 t

# qhasm: reg256 t0

# qhasm: reg256 t1

# qhasm: int64 constp

# qhasm: int64 bufp

# qhasm: int64 offset

# qhasm: int64 distance

# qhasm: int64 iterations

# qhasm: enter loop_hash_2n_n_mask_8x
.p2align 5
.global _loop_hash_2n_n_mask_8x
.global loop_hash_2n_n_mask_8x
_loop_hash_2n_n_mask_8x:
loop_hash_2n_n_mask_8x:
mov %rsp,%r11
and $31,%r11
add $512,%r11
sub %r11,%rsp

# qhasm: rotate8 = mem256[_rotate8]
# asm 1: vmovupd _rotate8,>rotate8=reg256#1
# asm 2: vmovupd _rotate8,>rotate8=%ymm0
vmovupd _rotate8,%ymm0

# qhasm: rotate16 = mem256[_rotate16]
# asm 1: vmovupd _rotate16,>rotate16=reg256#2
# asm 2: vmovupd _rotate16,>rotate16=%ymm1
vmovupd _rotate16,%ymm1

# qhasm: constp = &hashc8x
# asm 1: lea  hashc8x(%rip),>constp=int64#5
# asm 2: lea  hashc8x(%rip),>constp=%r8
lea  hashc8x(%rip),%r8

# qhasm: bufp = &buf
# asm 1: leaq <buf=stack2048#1,>bufp=int64#6
# asm 2: leaq <buf=256(%rsp),>bufp=%r9
leaq 256(%rsp),%r9

# qhasm: distance = input_2
# asm 1: mov  <input_2=int64#3,>distance=int64#3
# asm 2: mov  <input_2=%rdx,>distance=%rdx
mov  %rdx,%rdx

# qhasm: iterations = distance
# asm 1: mov  <distance=int64#3,>iterations=int64#7
# asm 2: mov  <distance=%rdx,>iterations=%rax
mov  %rdx,%rax

# qhasm: (uint32) iterations >>= 6
# asm 1: shr  $6,<iterations=int64#7d
# asm 2: shr  $6,<iterations=%eax
shr  $6,%eax

# qhasm: looptop:
._looptop:

# qhasm: mask = mem256[input_3 + 0]
# asm 1: vmovupd   0(<input_3=int64#4),>mask=reg256#3
# asm 2: vmovupd   0(<input_3=%rcx),>mask=%ymm2
vmovupd   0(%rcx),%ymm2

# qhasm: x0  = mem256[input_1 +   0]
# asm 1: vmovupd   0(<input_1=int64#2),>x0=reg256#4
# asm 2: vmovupd   0(<input_1=%rsi),>x0=%ymm3
vmovupd   0(%rsi),%ymm3

# qhasm: x0 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x0=reg256#4,>x0=reg256#4
# asm 2: vxorpd <mask=%ymm2,<x0=%ymm3,>x0=%ymm3
vxorpd %ymm2,%ymm3,%ymm3

# qhasm: offset = distance
# asm 1: mov  <distance=int64#3,>offset=int64#8
# asm 2: mov  <distance=%rdx,>offset=%r10
mov  %rdx,%r10

# qhasm: x1  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x1=reg256#5
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x1=%ymm4
vmovupd   0(%rsi,%r10),%ymm4

# qhasm: x1 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x1=reg256#5,>x1=reg256#5
# asm 2: vxorpd <mask=%ymm2,<x1=%ymm4,>x1=%ymm4
vxorpd %ymm2,%ymm4,%ymm4

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: x2  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x2=reg256#6
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x2=%ymm5
vmovupd   0(%rsi,%r10),%ymm5

# qhasm: x2 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x2=reg256#6,>x2=reg256#6
# asm 2: vxorpd <mask=%ymm2,<x2=%ymm5,>x2=%ymm5
vxorpd %ymm2,%ymm5,%ymm5

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: x3  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x3=reg256#7
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x3=%ymm6
vmovupd   0(%rsi,%r10),%ymm6

# qhasm: x3 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vxorpd <mask=%ymm2,<x3=%ymm6,>x3=%ymm6
vxorpd %ymm2,%ymm6,%ymm6

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: x4  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x4=reg256#8
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x4=%ymm7
vmovupd   0(%rsi,%r10),%ymm7

# qhasm: x4 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x4=reg256#8,>x4=reg256#8
# asm 2: vxorpd <mask=%ymm2,<x4=%ymm7,>x4=%ymm7
vxorpd %ymm2,%ymm7,%ymm7

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: x5  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x5=reg256#9
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x5=%ymm8
vmovupd   0(%rsi,%r10),%ymm8

# qhasm: x5 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x5=reg256#9,>x5=reg256#9
# asm 2: vxorpd <mask=%ymm2,<x5=%ymm8,>x5=%ymm8
vxorpd %ymm2,%ymm8,%ymm8

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: x6  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x6=reg256#10
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x6=%ymm9
vmovupd   0(%rsi,%r10),%ymm9

# qhasm: x6 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x6=reg256#10,>x6=reg256#10
# asm 2: vxorpd <mask=%ymm2,<x6=%ymm9,>x6=%ymm9
vxorpd %ymm2,%ymm9,%ymm9

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: x7  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x7=reg256#11
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x7=%ymm10
vmovupd   0(%rsi,%r10),%ymm10

# qhasm: x7 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x7=reg256#11,>x7=reg256#3
# asm 2: vxorpd <mask=%ymm2,<x7=%ymm10,>x7=%ymm2
vxorpd %ymm2,%ymm10,%ymm2

# qhasm: input_1 += 32
# asm 1: add  $32,<input_1=int64#2
# asm 2: add  $32,<input_1=%rsi
add  $32,%rsi

# qhasm: t0 = unpack  low dwords of x0 and x4 
# asm 1: vpunpckldq <x4=reg256#8,<x0=reg256#4,>t0=reg256#11
# asm 2: vpunpckldq <x4=%ymm7,<x0=%ymm3,>t0=%ymm10
vpunpckldq %ymm7,%ymm3,%ymm10

# qhasm: t1 = unpack high dwords of x0 and x4 
# asm 1: vpunpckhdq <x4=reg256#8,<x0=reg256#4,>t1=reg256#4
# asm 2: vpunpckhdq <x4=%ymm7,<x0=%ymm3,>t1=%ymm3
vpunpckhdq %ymm7,%ymm3,%ymm3

# qhasm: x0[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#4,<t0=reg256#11,>x0=reg256#8
# asm 2: vperm2f128 $0x20,<t1=%ymm3,<t0=%ymm10,>x0=%ymm7
vperm2f128 $0x20,%ymm3,%ymm10,%ymm7

# qhasm: x4[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#4,<t0=reg256#11,>x4=reg256#4
# asm 2: vperm2f128 $0x31,<t1=%ymm3,<t0=%ymm10,>x4=%ymm3
vperm2f128 $0x31,%ymm3,%ymm10,%ymm3

# qhasm: t0 = unpack  low dwords of x1 and x5
# asm 1: vpunpckldq <x5=reg256#9,<x1=reg256#5,>t0=reg256#11
# asm 2: vpunpckldq <x5=%ymm8,<x1=%ymm4,>t0=%ymm10
vpunpckldq %ymm8,%ymm4,%ymm10

# qhasm: t1 = unpack high dwords of x1 and x5
# asm 1: vpunpckhdq <x5=reg256#9,<x1=reg256#5,>t1=reg256#5
# asm 2: vpunpckhdq <x5=%ymm8,<x1=%ymm4,>t1=%ymm4
vpunpckhdq %ymm8,%ymm4,%ymm4

# qhasm: x1[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#5,<t0=reg256#11,>x1=reg256#9
# asm 2: vperm2f128 $0x20,<t1=%ymm4,<t0=%ymm10,>x1=%ymm8
vperm2f128 $0x20,%ymm4,%ymm10,%ymm8

# qhasm: x5[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#5,<t0=reg256#11,>x5=reg256#5
# asm 2: vperm2f128 $0x31,<t1=%ymm4,<t0=%ymm10,>x5=%ymm4
vperm2f128 $0x31,%ymm4,%ymm10,%ymm4

# qhasm: t0 = unpack  low dwords of x2 and x6
# asm 1: vpunpckldq <x6=reg256#10,<x2=reg256#6,>t0=reg256#11
# asm 2: vpunpckldq <x6=%ymm9,<x2=%ymm5,>t0=%ymm10
vpunpckldq %ymm9,%ymm5,%ymm10

# qhasm: t1 = unpack high dwords of x2 and x6
# asm 1: vpunpckhdq <x6=reg256#10,<x2=reg256#6,>t1=reg256#6
# asm 2: vpunpckhdq <x6=%ymm9,<x2=%ymm5,>t1=%ymm5
vpunpckhdq %ymm9,%ymm5,%ymm5

# qhasm: x2[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#6,<t0=reg256#11,>x2=reg256#10
# asm 2: vperm2f128 $0x20,<t1=%ymm5,<t0=%ymm10,>x2=%ymm9
vperm2f128 $0x20,%ymm5,%ymm10,%ymm9

# qhasm: x6[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#6,<t0=reg256#11,>x6=reg256#6
# asm 2: vperm2f128 $0x31,<t1=%ymm5,<t0=%ymm10,>x6=%ymm5
vperm2f128 $0x31,%ymm5,%ymm10,%ymm5

# qhasm: t0 = unpack  low dwords of x3 and x7
# asm 1: vpunpckldq <x7=reg256#3,<x3=reg256#7,>t0=reg256#11
# asm 2: vpunpckldq <x7=%ymm2,<x3=%ymm6,>t0=%ymm10
vpunpckldq %ymm2,%ymm6,%ymm10

# qhasm: t1 = unpack high dwords of x3 and x7
# asm 1: vpunpckhdq <x7=reg256#3,<x3=reg256#7,>t1=reg256#3
# asm 2: vpunpckhdq <x7=%ymm2,<x3=%ymm6,>t1=%ymm2
vpunpckhdq %ymm2,%ymm6,%ymm2

# qhasm: x3[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#3,<t0=reg256#11,>x3=reg256#7
# asm 2: vperm2f128 $0x20,<t1=%ymm2,<t0=%ymm10,>x3=%ymm6
vperm2f128 $0x20,%ymm2,%ymm10,%ymm6

# qhasm: x7[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#3,<t0=reg256#11,>x7=reg256#3
# asm 2: vperm2f128 $0x31,<t1=%ymm2,<t0=%ymm10,>x7=%ymm2
vperm2f128 $0x31,%ymm2,%ymm10,%ymm2

# qhasm: t0 = unpack  low dwords of x0 and x2
# asm 1: vpunpckldq <x2=reg256#10,<x0=reg256#8,>t0=reg256#11
# asm 2: vpunpckldq <x2=%ymm9,<x0=%ymm7,>t0=%ymm10
vpunpckldq %ymm9,%ymm7,%ymm10

# qhasm: t1 = unpack high dwords of x0 and x2
# asm 1: vpunpckhdq <x2=reg256#10,<x0=reg256#8,>t1=reg256#8
# asm 2: vpunpckhdq <x2=%ymm9,<x0=%ymm7,>t1=%ymm7
vpunpckhdq %ymm9,%ymm7,%ymm7

# qhasm: x0[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#8,<t0=reg256#11,>x0=reg256#10
# asm 2: vperm2f128 $0x20,<t1=%ymm7,<t0=%ymm10,>x0=%ymm9
vperm2f128 $0x20,%ymm7,%ymm10,%ymm9

# qhasm: x2[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#8,<t0=reg256#11,>x2=reg256#8
# asm 2: vperm2f128 $0x31,<t1=%ymm7,<t0=%ymm10,>x2=%ymm7
vperm2f128 $0x31,%ymm7,%ymm10,%ymm7

# qhasm: t0 = unpack  low dwords of x1 and x3
# asm 1: vpunpckldq <x3=reg256#7,<x1=reg256#9,>t0=reg256#11
# asm 2: vpunpckldq <x3=%ymm6,<x1=%ymm8,>t0=%ymm10
vpunpckldq %ymm6,%ymm8,%ymm10

# qhasm: t1 = unpack high dwords of x1 and x3
# asm 1: vpunpckhdq <x3=reg256#7,<x1=reg256#9,>t1=reg256#7
# asm 2: vpunpckhdq <x3=%ymm6,<x1=%ymm8,>t1=%ymm6
vpunpckhdq %ymm6,%ymm8,%ymm6

# qhasm: x1[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#7,<t0=reg256#11,>x1=reg256#9
# asm 2: vperm2f128 $0x20,<t1=%ymm6,<t0=%ymm10,>x1=%ymm8
vperm2f128 $0x20,%ymm6,%ymm10,%ymm8

# qhasm: x3[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#7,<t0=reg256#11,>x3=reg256#7
# asm 2: vperm2f128 $0x31,<t1=%ymm6,<t0=%ymm10,>x3=%ymm6
vperm2f128 $0x31,%ymm6,%ymm10,%ymm6

# qhasm: t0 = unpack  low dwords of x4 and x6
# asm 1: vpunpckldq <x6=reg256#6,<x4=reg256#4,>t0=reg256#11
# asm 2: vpunpckldq <x6=%ymm5,<x4=%ymm3,>t0=%ymm10
vpunpckldq %ymm5,%ymm3,%ymm10

# qhasm: t1 = unpack high dwords of x4 and x6
# asm 1: vpunpckhdq <x6=reg256#6,<x4=reg256#4,>t1=reg256#4
# asm 2: vpunpckhdq <x6=%ymm5,<x4=%ymm3,>t1=%ymm3
vpunpckhdq %ymm5,%ymm3,%ymm3

# qhasm: x4[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#4,<t0=reg256#11,>x4=reg256#6
# asm 2: vperm2f128 $0x20,<t1=%ymm3,<t0=%ymm10,>x4=%ymm5
vperm2f128 $0x20,%ymm3,%ymm10,%ymm5

# qhasm: x6[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#4,<t0=reg256#11,>x6=reg256#4
# asm 2: vperm2f128 $0x31,<t1=%ymm3,<t0=%ymm10,>x6=%ymm3
vperm2f128 $0x31,%ymm3,%ymm10,%ymm3

# qhasm: t0 = unpack  low dwords of x5 and x7
# asm 1: vpunpckldq <x7=reg256#3,<x5=reg256#5,>t0=reg256#11
# asm 2: vpunpckldq <x7=%ymm2,<x5=%ymm4,>t0=%ymm10
vpunpckldq %ymm2,%ymm4,%ymm10

# qhasm: t1 = unpack high dwords of x5 and x7
# asm 1: vpunpckhdq <x7=reg256#3,<x5=reg256#5,>t1=reg256#3
# asm 2: vpunpckhdq <x7=%ymm2,<x5=%ymm4,>t1=%ymm2
vpunpckhdq %ymm2,%ymm4,%ymm2

# qhasm: x5[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#3,<t0=reg256#11,>x5=reg256#5
# asm 2: vperm2f128 $0x20,<t1=%ymm2,<t0=%ymm10,>x5=%ymm4
vperm2f128 $0x20,%ymm2,%ymm10,%ymm4

# qhasm: x7[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#3,<t0=reg256#11,>x7=reg256#3
# asm 2: vperm2f128 $0x31,<t1=%ymm2,<t0=%ymm10,>x7=%ymm2
vperm2f128 $0x31,%ymm2,%ymm10,%ymm2

# qhasm: t0 = unpack  low dwords of x0 and x1
# asm 1: vpunpckldq <x1=reg256#9,<x0=reg256#10,>t0=reg256#11
# asm 2: vpunpckldq <x1=%ymm8,<x0=%ymm9,>t0=%ymm10
vpunpckldq %ymm8,%ymm9,%ymm10

# qhasm: t1 = unpack high dwords of x0 and x1
# asm 1: vpunpckhdq <x1=reg256#9,<x0=reg256#10,>t1=reg256#9
# asm 2: vpunpckhdq <x1=%ymm8,<x0=%ymm9,>t1=%ymm8
vpunpckhdq %ymm8,%ymm9,%ymm8

# qhasm: x0[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#9,<t0=reg256#11,>x0=reg256#10
# asm 2: vperm2f128 $0x20,<t1=%ymm8,<t0=%ymm10,>x0=%ymm9
vperm2f128 $0x20,%ymm8,%ymm10,%ymm9

# qhasm: x1[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#9,<t0=reg256#11,>x1=reg256#9
# asm 2: vperm2f128 $0x31,<t1=%ymm8,<t0=%ymm10,>x1=%ymm8
vperm2f128 $0x31,%ymm8,%ymm10,%ymm8

# qhasm: t0 = unpack  low dwords of x2 and x3
# asm 1: vpunpckldq <x3=reg256#7,<x2=reg256#8,>t0=reg256#11
# asm 2: vpunpckldq <x3=%ymm6,<x2=%ymm7,>t0=%ymm10
vpunpckldq %ymm6,%ymm7,%ymm10

# qhasm: t1 = unpack high dwords of x2 and x3
# asm 1: vpunpckhdq <x3=reg256#7,<x2=reg256#8,>t1=reg256#7
# asm 2: vpunpckhdq <x3=%ymm6,<x2=%ymm7,>t1=%ymm6
vpunpckhdq %ymm6,%ymm7,%ymm6

# qhasm: x2[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#7,<t0=reg256#11,>x2=reg256#8
# asm 2: vperm2f128 $0x20,<t1=%ymm6,<t0=%ymm10,>x2=%ymm7
vperm2f128 $0x20,%ymm6,%ymm10,%ymm7

# qhasm: x3[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#7,<t0=reg256#11,>x3=reg256#7
# asm 2: vperm2f128 $0x31,<t1=%ymm6,<t0=%ymm10,>x3=%ymm6
vperm2f128 $0x31,%ymm6,%ymm10,%ymm6

# qhasm: t0 = unpack  low dwords of x4 and x5
# asm 1: vpunpckldq <x5=reg256#5,<x4=reg256#6,>t0=reg256#11
# asm 2: vpunpckldq <x5=%ymm4,<x4=%ymm5,>t0=%ymm10
vpunpckldq %ymm4,%ymm5,%ymm10

# qhasm: t1 = unpack high dwords of x4 and x5
# asm 1: vpunpckhdq <x5=reg256#5,<x4=reg256#6,>t1=reg256#5
# asm 2: vpunpckhdq <x5=%ymm4,<x4=%ymm5,>t1=%ymm4
vpunpckhdq %ymm4,%ymm5,%ymm4

# qhasm: x4[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#5,<t0=reg256#11,>x4=reg256#6
# asm 2: vperm2f128 $0x20,<t1=%ymm4,<t0=%ymm10,>x4=%ymm5
vperm2f128 $0x20,%ymm4,%ymm10,%ymm5

# qhasm: x5[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#5,<t0=reg256#11,>x5=reg256#5
# asm 2: vperm2f128 $0x31,<t1=%ymm4,<t0=%ymm10,>x5=%ymm4
vperm2f128 $0x31,%ymm4,%ymm10,%ymm4

# qhasm: t0 = unpack  low dwords of x6 and x7
# asm 1: vpunpckldq <x7=reg256#3,<x6=reg256#4,>t0=reg256#11
# asm 2: vpunpckldq <x7=%ymm2,<x6=%ymm3,>t0=%ymm10
vpunpckldq %ymm2,%ymm3,%ymm10

# qhasm: t1 = unpack high dwords of x6 and x7
# asm 1: vpunpckhdq <x7=reg256#3,<x6=reg256#4,>t1=reg256#3
# asm 2: vpunpckhdq <x7=%ymm2,<x6=%ymm3,>t1=%ymm2
vpunpckhdq %ymm2,%ymm3,%ymm2

# qhasm: x6[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#3,<t0=reg256#11,>x6=reg256#4
# asm 2: vperm2f128 $0x20,<t1=%ymm2,<t0=%ymm10,>x6=%ymm3
vperm2f128 $0x20,%ymm2,%ymm10,%ymm3

# qhasm: x7[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#3,<t0=reg256#11,>x7=reg256#3
# asm 2: vperm2f128 $0x31,<t1=%ymm2,<t0=%ymm10,>x7=%ymm2
vperm2f128 $0x31,%ymm2,%ymm10,%ymm2

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#4,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm3,>x6stack=0(%rsp)
vmovapd %ymm3,0(%rsp)

# qhasm: x8  = mem256[constp +   0]
# asm 1: vmovupd   0(<constp=int64#5),>x8=reg256#4
# asm 2: vmovupd   0(<constp=%r8),>x8=%ymm3
vmovupd   0(%r8),%ymm3

# qhasm: x9  = mem256[constp +  32]
# asm 1: vmovupd   32(<constp=int64#5),>x9=reg256#11
# asm 2: vmovupd   32(<constp=%r8),>x9=%ymm10
vmovupd   32(%r8),%ymm10

# qhasm: x10 = mem256[constp +  64]
# asm 1: vmovupd   64(<constp=int64#5),>x10=reg256#12
# asm 2: vmovupd   64(<constp=%r8),>x10=%ymm11
vmovupd   64(%r8),%ymm11

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#12,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm11,>x10stack=32(%rsp)
vmovapd %ymm11,32(%rsp)

# qhasm: x11 = mem256[constp +  96]
# asm 1: vmovupd   96(<constp=int64#5),>x11=reg256#12
# asm 2: vmovupd   96(<constp=%r8),>x11=%ymm11
vmovupd   96(%r8),%ymm11

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#12,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm11,>x11stack=64(%rsp)
vmovapd %ymm11,64(%rsp)

# qhasm: x12 = mem256[constp + 128]
# asm 1: vmovupd   128(<constp=int64#5),>x12=reg256#12
# asm 2: vmovupd   128(<constp=%r8),>x12=%ymm11
vmovupd   128(%r8),%ymm11

# qhasm: x13 = mem256[constp + 160]
# asm 1: vmovupd   160(<constp=int64#5),>x13=reg256#13
# asm 2: vmovupd   160(<constp=%r8),>x13=%ymm12
vmovupd   160(%r8),%ymm12

# qhasm: x14 = mem256[constp + 192]
# asm 1: vmovupd   192(<constp=int64#5),>x14=reg256#14
# asm 2: vmovupd   192(<constp=%r8),>x14=%ymm13
vmovupd   192(%r8),%ymm13

# qhasm: x15 = mem256[constp + 224]
# asm 1: vmovupd   224(<constp=int64#5),>x15=reg256#15
# asm 2: vmovupd   224(<constp=%r8),>x15=%ymm14
vmovupd   224(%r8),%ymm14

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#15,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm14,>x15stack=96(%rsp)
vmovapd %ymm14,96(%rsp)

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#6,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x4=%ymm5,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm4,%ymm8,%ymm8

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#4,>x8=reg256#4
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm3,>x8=%ymm3
vpaddd %ymm11,%ymm3,%ymm3

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#4,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x8=%ymm3,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm3,%ymm5,%ymm5

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#6,>t0=reg256#15
# asm 2: vpslld $12,<x4=%ymm5,>t0=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x t1 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $12,<x5=%ymm4,>t1=%ymm15
vpslld $12,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $20,<x4=%ymm5,>x4=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#6,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x4=%ymm5,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm4,%ymm8,%ymm8

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#4,>x8=reg256#4
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm3,>x8=%ymm3
vpaddd %ymm11,%ymm3,%ymm3

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#4,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x8=%ymm3,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm3,%ymm5,%ymm5

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#6,>t0=reg256#15
# asm 2: vpslld $7,<x4=%ymm5,>t0=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x t1 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $7,<x5=%ymm4,>t1=%ymm15
vpslld $7,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $25,<x4=%ymm5,>x4=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: x4stack = x4
# asm 1: vmovapd <x4=reg256#6,>x4stack=stack256#5
# asm 2: vmovapd <x4=%ymm5,>x4stack=128(%rsp)
vmovapd %ymm5,128(%rsp)

# qhasm: x8stack = x8
# asm 1: vmovapd <x8=reg256#4,>x8stack=stack256#6
# asm 2: vmovapd <x8=%ymm3,>x8stack=160(%rsp)
vmovapd %ymm3,160(%rsp)

# qhasm: x9stack = x9
# asm 1: vmovapd <x9=reg256#11,>x9stack=stack256#7
# asm 2: vmovapd <x9=%ymm10,>x9stack=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: x13stack = x13
# asm 1: vmovapd <x13=reg256#13,>x13stack=stack256#8
# asm 2: vmovapd <x13=%ymm12,>x13stack=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm: x6 = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#4
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm3
vmovapd 0(%rsp),%ymm3

# qhasm: x10 = x10stack
# asm 1: vmovapd <x10stack=stack256#2,>x10=reg256#6
# asm 2: vmovapd <x10stack=32(%rsp),>x10=%ymm5
vmovapd 32(%rsp),%ymm5

# qhasm: x11 = x11stack
# asm 1: vmovapd <x11stack=stack256#3,>x11=reg256#11
# asm 2: vmovapd <x11stack=64(%rsp),>x11=%ymm10
vmovapd 64(%rsp),%ymm10

# qhasm: x15 = x15stack
# asm 1: vmovapd <x15stack=stack256#4,>x15=reg256#13
# asm 2: vmovapd <x15stack=96(%rsp),>x15=%ymm12
vmovapd 96(%rsp),%ymm12

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#4,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x6=%ymm3,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm3,%ymm7,%ymm7

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm2,%ymm6,%ymm6

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm6,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm6,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm13,%ymm5,%ymm5

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x10=%ymm5,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#4,>t0=reg256#15
# asm 2: vpslld $12,<x6=%ymm3,>t0=%ymm14
vpslld $12,%ymm3,%ymm14

# qhasm: 8x t1 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $12,<x7=%ymm2,>t1=%ymm15
vpslld $12,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $20,<x6=%ymm3,>x6=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#4,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x6=%ymm3,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm3,%ymm7,%ymm7

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm2,%ymm6,%ymm6

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm6,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm6,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm13,%ymm5,%ymm5

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x10=%ymm5,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#4,>t0=reg256#15
# asm 2: vpslld $7,<x6=%ymm3,>t0=%ymm14
vpslld $7,%ymm3,%ymm14

# qhasm: 8x t1 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $7,<x7=%ymm2,>t1=%ymm15
vpslld $7,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $25,<x6=%ymm3,>x6=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#4,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x6=%ymm3,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm3,%ymm8,%ymm8

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm9,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm8,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm5,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm5,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $12,<x5=%ymm4,>t0=%ymm14
vpslld $12,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#4,>t1=reg256#16
# asm 2: vpslld $12,<x6=%ymm3,>t1=%ymm15
vpslld $12,%ymm3,%ymm15

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $20,<x6=%ymm3,>x6=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#4,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x6=%ymm3,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm3,%ymm8,%ymm8

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm9,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm8,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm5,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm5,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $7,<x5=%ymm4,>t0=%ymm14
vpslld $7,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#4,>t1=reg256#16
# asm 2: vpslld $7,<x6=%ymm3,>t1=%ymm15
vpslld $7,%ymm3,%ymm15

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $25,<x6=%ymm3,>x6=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#4,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm3,>x6stack=0(%rsp)
vmovapd %ymm3,0(%rsp)

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#6,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm5,>x10stack=32(%rsp)
vmovapd %ymm5,32(%rsp)

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#11,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm10,>x11stack=64(%rsp)
vmovapd %ymm10,64(%rsp)

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#13,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm12,>x15stack=96(%rsp)
vmovapd %ymm12,96(%rsp)

# qhasm: x4 = x4stack
# asm 1: vmovapd <x4stack=stack256#5,>x4=reg256#4
# asm 2: vmovapd <x4stack=128(%rsp),>x4=%ymm3
vmovapd 128(%rsp),%ymm3

# qhasm: x8 = x8stack
# asm 1: vmovapd <x8stack=stack256#6,>x8=reg256#6
# asm 2: vmovapd <x8stack=160(%rsp),>x8=%ymm5
vmovapd 160(%rsp),%ymm5

# qhasm: x9 = x9stack
# asm 1: vmovapd <x9stack=stack256#7,>x9=reg256#11
# asm 2: vmovapd <x9stack=192(%rsp),>x9=%ymm10
vmovapd 192(%rsp),%ymm10

# qhasm: x13 = x13stack
# asm 1: vmovapd <x13stack=stack256#8,>x13=reg256#13
# asm 2: vmovapd <x13stack=224(%rsp),>x13=%ymm12
vmovapd 224(%rsp),%ymm12

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#4,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x4=%ymm3,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm3,%ymm6,%ymm6

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm7,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm6,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm6,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm5,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm5,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $12,<x7=%ymm2,>t0=%ymm14
vpslld $12,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#4,>t1=reg256#16
# asm 2: vpslld $12,<x4=%ymm3,>t1=%ymm15
vpslld $12,%ymm3,%ymm15

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $20,<x4=%ymm3,>x4=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#4,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x4=%ymm3,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm3,%ymm6,%ymm6

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm7,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm6,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm6,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm5,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm5,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $7,<x7=%ymm2,>t0=%ymm14
vpslld $7,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#4,>t1=reg256#16
# asm 2: vpslld $7,<x4=%ymm3,>t1=%ymm15
vpslld $7,%ymm3,%ymm15

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $25,<x4=%ymm3,>x4=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#4,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x4=%ymm3,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm3,%ymm9,%ymm9

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm4,%ymm8,%ymm8

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm11,%ymm5,%ymm5

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x8=%ymm5,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#4,>t0=reg256#15
# asm 2: vpslld $12,<x4=%ymm3,>t0=%ymm14
vpslld $12,%ymm3,%ymm14

# qhasm: 8x t1 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $12,<x5=%ymm4,>t1=%ymm15
vpslld $12,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $20,<x4=%ymm3,>x4=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#4,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x4=%ymm3,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm3,%ymm9,%ymm9

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm4,%ymm8,%ymm8

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm11,%ymm5,%ymm5

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x8=%ymm5,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#4,>t0=reg256#15
# asm 2: vpslld $7,<x4=%ymm3,>t0=%ymm14
vpslld $7,%ymm3,%ymm14

# qhasm: 8x t1 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $7,<x5=%ymm4,>t1=%ymm15
vpslld $7,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $25,<x4=%ymm3,>x4=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: x4stack = x4
# asm 1: vmovapd <x4=reg256#4,>x4stack=stack256#5
# asm 2: vmovapd <x4=%ymm3,>x4stack=128(%rsp)
vmovapd %ymm3,128(%rsp)

# qhasm: x8stack = x8
# asm 1: vmovapd <x8=reg256#6,>x8stack=stack256#6
# asm 2: vmovapd <x8=%ymm5,>x8stack=160(%rsp)
vmovapd %ymm5,160(%rsp)

# qhasm: x9stack = x9
# asm 1: vmovapd <x9=reg256#11,>x9stack=stack256#7
# asm 2: vmovapd <x9=%ymm10,>x9stack=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: x13stack = x13
# asm 1: vmovapd <x13=reg256#13,>x13stack=stack256#8
# asm 2: vmovapd <x13=%ymm12,>x13stack=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm: x6 = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#4
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm3
vmovapd 0(%rsp),%ymm3

# qhasm: x10 = x10stack
# asm 1: vmovapd <x10stack=stack256#2,>x10=reg256#6
# asm 2: vmovapd <x10stack=32(%rsp),>x10=%ymm5
vmovapd 32(%rsp),%ymm5

# qhasm: x11 = x11stack
# asm 1: vmovapd <x11stack=stack256#3,>x11=reg256#11
# asm 2: vmovapd <x11stack=64(%rsp),>x11=%ymm10
vmovapd 64(%rsp),%ymm10

# qhasm: x15 = x15stack
# asm 1: vmovapd <x15stack=stack256#4,>x15=reg256#13
# asm 2: vmovapd <x15stack=96(%rsp),>x15=%ymm12
vmovapd 96(%rsp),%ymm12

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#4,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x6=%ymm3,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm3,%ymm7,%ymm7

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm2,%ymm6,%ymm6

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm6,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm6,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm13,%ymm5,%ymm5

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x10=%ymm5,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#4,>t0=reg256#15
# asm 2: vpslld $12,<x6=%ymm3,>t0=%ymm14
vpslld $12,%ymm3,%ymm14

# qhasm: 8x t1 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $12,<x7=%ymm2,>t1=%ymm15
vpslld $12,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $20,<x6=%ymm3,>x6=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#4,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x6=%ymm3,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm3,%ymm7,%ymm7

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm2,%ymm6,%ymm6

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm6,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm6,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm13,%ymm5,%ymm5

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x10=%ymm5,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#4,>t0=reg256#15
# asm 2: vpslld $7,<x6=%ymm3,>t0=%ymm14
vpslld $7,%ymm3,%ymm14

# qhasm: 8x t1 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $7,<x7=%ymm2,>t1=%ymm15
vpslld $7,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $25,<x6=%ymm3,>x6=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#4,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x6=%ymm3,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm3,%ymm8,%ymm8

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm9,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm8,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm5,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm5,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $12,<x5=%ymm4,>t0=%ymm14
vpslld $12,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#4,>t1=reg256#16
# asm 2: vpslld $12,<x6=%ymm3,>t1=%ymm15
vpslld $12,%ymm3,%ymm15

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $20,<x6=%ymm3,>x6=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#4,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x6=%ymm3,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm3,%ymm8,%ymm8

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm9,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm8,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm5,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm5,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $7,<x5=%ymm4,>t0=%ymm14
vpslld $7,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#4,>t1=reg256#16
# asm 2: vpslld $7,<x6=%ymm3,>t1=%ymm15
vpslld $7,%ymm3,%ymm15

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $25,<x6=%ymm3,>x6=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#4,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm3,>x6stack=0(%rsp)
vmovapd %ymm3,0(%rsp)

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#6,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm5,>x10stack=32(%rsp)
vmovapd %ymm5,32(%rsp)

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#11,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm10,>x11stack=64(%rsp)
vmovapd %ymm10,64(%rsp)

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#13,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm12,>x15stack=96(%rsp)
vmovapd %ymm12,96(%rsp)

# qhasm: x4 = x4stack
# asm 1: vmovapd <x4stack=stack256#5,>x4=reg256#4
# asm 2: vmovapd <x4stack=128(%rsp),>x4=%ymm3
vmovapd 128(%rsp),%ymm3

# qhasm: x8 = x8stack
# asm 1: vmovapd <x8stack=stack256#6,>x8=reg256#6
# asm 2: vmovapd <x8stack=160(%rsp),>x8=%ymm5
vmovapd 160(%rsp),%ymm5

# qhasm: x9 = x9stack
# asm 1: vmovapd <x9stack=stack256#7,>x9=reg256#11
# asm 2: vmovapd <x9stack=192(%rsp),>x9=%ymm10
vmovapd 192(%rsp),%ymm10

# qhasm: x13 = x13stack
# asm 1: vmovapd <x13stack=stack256#8,>x13=reg256#13
# asm 2: vmovapd <x13stack=224(%rsp),>x13=%ymm12
vmovapd 224(%rsp),%ymm12

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#4,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x4=%ymm3,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm3,%ymm6,%ymm6

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm7,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm6,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm6,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm5,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm5,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $12,<x7=%ymm2,>t0=%ymm14
vpslld $12,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#4,>t1=reg256#16
# asm 2: vpslld $12,<x4=%ymm3,>t1=%ymm15
vpslld $12,%ymm3,%ymm15

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $20,<x4=%ymm3,>x4=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#4,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x4=%ymm3,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm3,%ymm6,%ymm6

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm7,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm6,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm6,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm5,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm5,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $7,<x7=%ymm2,>t0=%ymm14
vpslld $7,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#4,>t1=reg256#16
# asm 2: vpslld $7,<x4=%ymm3,>t1=%ymm15
vpslld $7,%ymm3,%ymm15

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $25,<x4=%ymm3,>x4=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#4,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x4=%ymm3,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm3,%ymm9,%ymm9

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm4,%ymm8,%ymm8

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm11,%ymm5,%ymm5

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x8=%ymm5,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#4,>t0=reg256#15
# asm 2: vpslld $12,<x4=%ymm3,>t0=%ymm14
vpslld $12,%ymm3,%ymm14

# qhasm: 8x t1 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $12,<x5=%ymm4,>t1=%ymm15
vpslld $12,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $20,<x4=%ymm3,>x4=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#4,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x4=%ymm3,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm3,%ymm9,%ymm9

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm4,%ymm8,%ymm8

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm11,%ymm5,%ymm5

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x8=%ymm5,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#4,>t0=reg256#15
# asm 2: vpslld $7,<x4=%ymm3,>t0=%ymm14
vpslld $7,%ymm3,%ymm14

# qhasm: 8x t1 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $7,<x5=%ymm4,>t1=%ymm15
vpslld $7,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $25,<x4=%ymm3,>x4=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: x4stack = x4
# asm 1: vmovapd <x4=reg256#4,>x4stack=stack256#5
# asm 2: vmovapd <x4=%ymm3,>x4stack=128(%rsp)
vmovapd %ymm3,128(%rsp)

# qhasm: x8stack = x8
# asm 1: vmovapd <x8=reg256#6,>x8stack=stack256#6
# asm 2: vmovapd <x8=%ymm5,>x8stack=160(%rsp)
vmovapd %ymm5,160(%rsp)

# qhasm: x9stack = x9
# asm 1: vmovapd <x9=reg256#11,>x9stack=stack256#7
# asm 2: vmovapd <x9=%ymm10,>x9stack=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: x13stack = x13
# asm 1: vmovapd <x13=reg256#13,>x13stack=stack256#8
# asm 2: vmovapd <x13=%ymm12,>x13stack=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm: x6 = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#4
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm3
vmovapd 0(%rsp),%ymm3

# qhasm: x10 = x10stack
# asm 1: vmovapd <x10stack=stack256#2,>x10=reg256#6
# asm 2: vmovapd <x10stack=32(%rsp),>x10=%ymm5
vmovapd 32(%rsp),%ymm5

# qhasm: x11 = x11stack
# asm 1: vmovapd <x11stack=stack256#3,>x11=reg256#11
# asm 2: vmovapd <x11stack=64(%rsp),>x11=%ymm10
vmovapd 64(%rsp),%ymm10

# qhasm: x15 = x15stack
# asm 1: vmovapd <x15stack=stack256#4,>x15=reg256#13
# asm 2: vmovapd <x15stack=96(%rsp),>x15=%ymm12
vmovapd 96(%rsp),%ymm12

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#4,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x6=%ymm3,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm3,%ymm7,%ymm7

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm2,%ymm6,%ymm6

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm6,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm6,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm13,%ymm5,%ymm5

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x10=%ymm5,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#4,>t0=reg256#15
# asm 2: vpslld $12,<x6=%ymm3,>t0=%ymm14
vpslld $12,%ymm3,%ymm14

# qhasm: 8x t1 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $12,<x7=%ymm2,>t1=%ymm15
vpslld $12,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $20,<x6=%ymm3,>x6=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#4,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x6=%ymm3,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm3,%ymm7,%ymm7

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm2,%ymm6,%ymm6

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm6,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm6,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm13,%ymm5,%ymm5

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x10=%ymm5,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#4,>t0=reg256#15
# asm 2: vpslld $7,<x6=%ymm3,>t0=%ymm14
vpslld $7,%ymm3,%ymm14

# qhasm: 8x t1 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $7,<x7=%ymm2,>t1=%ymm15
vpslld $7,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $25,<x6=%ymm3,>x6=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#4,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x6=%ymm3,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm3,%ymm8,%ymm8

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm9,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm8,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm5,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm5,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $12,<x5=%ymm4,>t0=%ymm14
vpslld $12,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#4,>t1=reg256#16
# asm 2: vpslld $12,<x6=%ymm3,>t1=%ymm15
vpslld $12,%ymm3,%ymm15

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $20,<x6=%ymm3,>x6=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#4,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x6=%ymm3,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm3,%ymm8,%ymm8

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm9,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm8,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm5,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm5,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $7,<x5=%ymm4,>t0=%ymm14
vpslld $7,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#4,>t1=reg256#16
# asm 2: vpslld $7,<x6=%ymm3,>t1=%ymm15
vpslld $7,%ymm3,%ymm15

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $25,<x6=%ymm3,>x6=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#4,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm3,>x6stack=0(%rsp)
vmovapd %ymm3,0(%rsp)

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#6,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm5,>x10stack=32(%rsp)
vmovapd %ymm5,32(%rsp)

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#11,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm10,>x11stack=64(%rsp)
vmovapd %ymm10,64(%rsp)

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#13,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm12,>x15stack=96(%rsp)
vmovapd %ymm12,96(%rsp)

# qhasm: x4 = x4stack
# asm 1: vmovapd <x4stack=stack256#5,>x4=reg256#4
# asm 2: vmovapd <x4stack=128(%rsp),>x4=%ymm3
vmovapd 128(%rsp),%ymm3

# qhasm: x8 = x8stack
# asm 1: vmovapd <x8stack=stack256#6,>x8=reg256#6
# asm 2: vmovapd <x8stack=160(%rsp),>x8=%ymm5
vmovapd 160(%rsp),%ymm5

# qhasm: x9 = x9stack
# asm 1: vmovapd <x9stack=stack256#7,>x9=reg256#11
# asm 2: vmovapd <x9stack=192(%rsp),>x9=%ymm10
vmovapd 192(%rsp),%ymm10

# qhasm: x13 = x13stack
# asm 1: vmovapd <x13stack=stack256#8,>x13=reg256#13
# asm 2: vmovapd <x13stack=224(%rsp),>x13=%ymm12
vmovapd 224(%rsp),%ymm12

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#4,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x4=%ymm3,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm3,%ymm6,%ymm6

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm7,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm6,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm6,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm5,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm5,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $12,<x7=%ymm2,>t0=%ymm14
vpslld $12,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#4,>t1=reg256#16
# asm 2: vpslld $12,<x4=%ymm3,>t1=%ymm15
vpslld $12,%ymm3,%ymm15

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $20,<x4=%ymm3,>x4=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#4,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x4=%ymm3,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm3,%ymm6,%ymm6

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm7,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm6,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm6,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm5,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm5,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $7,<x7=%ymm2,>t0=%ymm14
vpslld $7,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#4,>t1=reg256#16
# asm 2: vpslld $7,<x4=%ymm3,>t1=%ymm15
vpslld $7,%ymm3,%ymm15

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $25,<x4=%ymm3,>x4=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#4,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x4=%ymm3,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm3,%ymm9,%ymm9

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm4,%ymm8,%ymm8

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm11,%ymm5,%ymm5

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x8=%ymm5,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#4,>t0=reg256#15
# asm 2: vpslld $12,<x4=%ymm3,>t0=%ymm14
vpslld $12,%ymm3,%ymm14

# qhasm: 8x t1 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $12,<x5=%ymm4,>t1=%ymm15
vpslld $12,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $20,<x4=%ymm3,>x4=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#4,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x4=%ymm3,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm3,%ymm9,%ymm9

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm4,%ymm8,%ymm8

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm11,%ymm5,%ymm5

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x8=%ymm5,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#4,>t0=reg256#15
# asm 2: vpslld $7,<x4=%ymm3,>t0=%ymm14
vpslld $7,%ymm3,%ymm14

# qhasm: 8x t1 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $7,<x5=%ymm4,>t1=%ymm15
vpslld $7,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $25,<x4=%ymm3,>x4=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: x4stack = x4
# asm 1: vmovapd <x4=reg256#4,>x4stack=stack256#5
# asm 2: vmovapd <x4=%ymm3,>x4stack=128(%rsp)
vmovapd %ymm3,128(%rsp)

# qhasm: x8stack = x8
# asm 1: vmovapd <x8=reg256#6,>x8stack=stack256#6
# asm 2: vmovapd <x8=%ymm5,>x8stack=160(%rsp)
vmovapd %ymm5,160(%rsp)

# qhasm: x9stack = x9
# asm 1: vmovapd <x9=reg256#11,>x9stack=stack256#7
# asm 2: vmovapd <x9=%ymm10,>x9stack=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: x13stack = x13
# asm 1: vmovapd <x13=reg256#13,>x13stack=stack256#8
# asm 2: vmovapd <x13=%ymm12,>x13stack=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm: x6 = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#4
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm3
vmovapd 0(%rsp),%ymm3

# qhasm: x10 = x10stack
# asm 1: vmovapd <x10stack=stack256#2,>x10=reg256#6
# asm 2: vmovapd <x10stack=32(%rsp),>x10=%ymm5
vmovapd 32(%rsp),%ymm5

# qhasm: x11 = x11stack
# asm 1: vmovapd <x11stack=stack256#3,>x11=reg256#11
# asm 2: vmovapd <x11stack=64(%rsp),>x11=%ymm10
vmovapd 64(%rsp),%ymm10

# qhasm: x15 = x15stack
# asm 1: vmovapd <x15stack=stack256#4,>x15=reg256#13
# asm 2: vmovapd <x15stack=96(%rsp),>x15=%ymm12
vmovapd 96(%rsp),%ymm12

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#4,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x6=%ymm3,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm3,%ymm7,%ymm7

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm2,%ymm6,%ymm6

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm6,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm6,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm13,%ymm5,%ymm5

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x10=%ymm5,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#4,>t0=reg256#15
# asm 2: vpslld $12,<x6=%ymm3,>t0=%ymm14
vpslld $12,%ymm3,%ymm14

# qhasm: 8x t1 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $12,<x7=%ymm2,>t1=%ymm15
vpslld $12,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $20,<x6=%ymm3,>x6=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#4,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x6=%ymm3,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm3,%ymm7,%ymm7

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm2,%ymm6,%ymm6

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm6,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm6,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm13,%ymm5,%ymm5

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x10=%ymm5,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#4,>t0=reg256#15
# asm 2: vpslld $7,<x6=%ymm3,>t0=%ymm14
vpslld $7,%ymm3,%ymm14

# qhasm: 8x t1 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $7,<x7=%ymm2,>t1=%ymm15
vpslld $7,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $25,<x6=%ymm3,>x6=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#4,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x6=%ymm3,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm3,%ymm8,%ymm8

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm9,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm8,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm5,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm5,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $12,<x5=%ymm4,>t0=%ymm14
vpslld $12,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#4,>t1=reg256#16
# asm 2: vpslld $12,<x6=%ymm3,>t1=%ymm15
vpslld $12,%ymm3,%ymm15

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $20,<x6=%ymm3,>x6=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#4,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x6=%ymm3,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm3,%ymm8,%ymm8

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm9,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm8,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm5,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm5,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $7,<x5=%ymm4,>t0=%ymm14
vpslld $7,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#4,>t1=reg256#16
# asm 2: vpslld $7,<x6=%ymm3,>t1=%ymm15
vpslld $7,%ymm3,%ymm15

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $25,<x6=%ymm3,>x6=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#4,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm3,>x6stack=0(%rsp)
vmovapd %ymm3,0(%rsp)

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#6,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm5,>x10stack=32(%rsp)
vmovapd %ymm5,32(%rsp)

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#11,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm10,>x11stack=64(%rsp)
vmovapd %ymm10,64(%rsp)

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#13,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm12,>x15stack=96(%rsp)
vmovapd %ymm12,96(%rsp)

# qhasm: x4 = x4stack
# asm 1: vmovapd <x4stack=stack256#5,>x4=reg256#4
# asm 2: vmovapd <x4stack=128(%rsp),>x4=%ymm3
vmovapd 128(%rsp),%ymm3

# qhasm: x8 = x8stack
# asm 1: vmovapd <x8stack=stack256#6,>x8=reg256#6
# asm 2: vmovapd <x8stack=160(%rsp),>x8=%ymm5
vmovapd 160(%rsp),%ymm5

# qhasm: x9 = x9stack
# asm 1: vmovapd <x9stack=stack256#7,>x9=reg256#11
# asm 2: vmovapd <x9stack=192(%rsp),>x9=%ymm10
vmovapd 192(%rsp),%ymm10

# qhasm: x13 = x13stack
# asm 1: vmovapd <x13stack=stack256#8,>x13=reg256#13
# asm 2: vmovapd <x13stack=224(%rsp),>x13=%ymm12
vmovapd 224(%rsp),%ymm12

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#4,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x4=%ymm3,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm3,%ymm6,%ymm6

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm7,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm6,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm6,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm5,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm5,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $12,<x7=%ymm2,>t0=%ymm14
vpslld $12,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#4,>t1=reg256#16
# asm 2: vpslld $12,<x4=%ymm3,>t1=%ymm15
vpslld $12,%ymm3,%ymm15

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $20,<x4=%ymm3,>x4=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#4,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x4=%ymm3,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm3,%ymm6,%ymm6

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm7,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm6,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm6,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm5,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm5,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $7,<x7=%ymm2,>t0=%ymm14
vpslld $7,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#4,>t1=reg256#16
# asm 2: vpslld $7,<x4=%ymm3,>t1=%ymm15
vpslld $7,%ymm3,%ymm15

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $25,<x4=%ymm3,>x4=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#4,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x4=%ymm3,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm3,%ymm9,%ymm9

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm4,%ymm8,%ymm8

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm11,%ymm5,%ymm5

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x8=%ymm5,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#4,>t0=reg256#15
# asm 2: vpslld $12,<x4=%ymm3,>t0=%ymm14
vpslld $12,%ymm3,%ymm14

# qhasm: 8x t1 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $12,<x5=%ymm4,>t1=%ymm15
vpslld $12,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $20,<x4=%ymm3,>x4=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#4,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x4=%ymm3,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm3,%ymm9,%ymm9

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm4,%ymm8,%ymm8

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm11,%ymm5,%ymm5

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x8=%ymm5,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#4,>t0=reg256#15
# asm 2: vpslld $7,<x4=%ymm3,>t0=%ymm14
vpslld $7,%ymm3,%ymm14

# qhasm: 8x t1 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $7,<x5=%ymm4,>t1=%ymm15
vpslld $7,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $25,<x4=%ymm3,>x4=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: x4stack = x4
# asm 1: vmovapd <x4=reg256#4,>x4stack=stack256#5
# asm 2: vmovapd <x4=%ymm3,>x4stack=128(%rsp)
vmovapd %ymm3,128(%rsp)

# qhasm: x8stack = x8
# asm 1: vmovapd <x8=reg256#6,>x8stack=stack256#6
# asm 2: vmovapd <x8=%ymm5,>x8stack=160(%rsp)
vmovapd %ymm5,160(%rsp)

# qhasm: x9stack = x9
# asm 1: vmovapd <x9=reg256#11,>x9stack=stack256#7
# asm 2: vmovapd <x9=%ymm10,>x9stack=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: x13stack = x13
# asm 1: vmovapd <x13=reg256#13,>x13stack=stack256#8
# asm 2: vmovapd <x13=%ymm12,>x13stack=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm: x6 = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#4
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm3
vmovapd 0(%rsp),%ymm3

# qhasm: x10 = x10stack
# asm 1: vmovapd <x10stack=stack256#2,>x10=reg256#6
# asm 2: vmovapd <x10stack=32(%rsp),>x10=%ymm5
vmovapd 32(%rsp),%ymm5

# qhasm: x11 = x11stack
# asm 1: vmovapd <x11stack=stack256#3,>x11=reg256#11
# asm 2: vmovapd <x11stack=64(%rsp),>x11=%ymm10
vmovapd 64(%rsp),%ymm10

# qhasm: x15 = x15stack
# asm 1: vmovapd <x15stack=stack256#4,>x15=reg256#13
# asm 2: vmovapd <x15stack=96(%rsp),>x15=%ymm12
vmovapd 96(%rsp),%ymm12

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#4,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x6=%ymm3,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm3,%ymm7,%ymm7

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm2,%ymm6,%ymm6

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm6,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm6,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm13,%ymm5,%ymm5

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x10=%ymm5,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#4,>t0=reg256#15
# asm 2: vpslld $12,<x6=%ymm3,>t0=%ymm14
vpslld $12,%ymm3,%ymm14

# qhasm: 8x t1 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $12,<x7=%ymm2,>t1=%ymm15
vpslld $12,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $20,<x6=%ymm3,>x6=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#4,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x6=%ymm3,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm3,%ymm7,%ymm7

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm2,%ymm6,%ymm6

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm6,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm6,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm13,%ymm5,%ymm5

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x10=%ymm5,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#4,>t0=reg256#15
# asm 2: vpslld $7,<x6=%ymm3,>t0=%ymm14
vpslld $7,%ymm3,%ymm14

# qhasm: 8x t1 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $7,<x7=%ymm2,>t1=%ymm15
vpslld $7,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $25,<x6=%ymm3,>x6=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#4,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x6=%ymm3,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm3,%ymm8,%ymm8

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm9,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm8,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm5,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm5,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $12,<x5=%ymm4,>t0=%ymm14
vpslld $12,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#4,>t1=reg256#16
# asm 2: vpslld $12,<x6=%ymm3,>t1=%ymm15
vpslld $12,%ymm3,%ymm15

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $20,<x6=%ymm3,>x6=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#4,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x6=%ymm3,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm3,%ymm8,%ymm8

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm9,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm8,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm5,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm5,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $7,<x5=%ymm4,>t0=%ymm14
vpslld $7,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#4,>t1=reg256#16
# asm 2: vpslld $7,<x6=%ymm3,>t1=%ymm15
vpslld $7,%ymm3,%ymm15

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $25,<x6=%ymm3,>x6=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#4,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm3,>x6stack=0(%rsp)
vmovapd %ymm3,0(%rsp)

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#6,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm5,>x10stack=32(%rsp)
vmovapd %ymm5,32(%rsp)

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#11,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm10,>x11stack=64(%rsp)
vmovapd %ymm10,64(%rsp)

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#13,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm12,>x15stack=96(%rsp)
vmovapd %ymm12,96(%rsp)

# qhasm: x4 = x4stack
# asm 1: vmovapd <x4stack=stack256#5,>x4=reg256#4
# asm 2: vmovapd <x4stack=128(%rsp),>x4=%ymm3
vmovapd 128(%rsp),%ymm3

# qhasm: x8 = x8stack
# asm 1: vmovapd <x8stack=stack256#6,>x8=reg256#6
# asm 2: vmovapd <x8stack=160(%rsp),>x8=%ymm5
vmovapd 160(%rsp),%ymm5

# qhasm: x9 = x9stack
# asm 1: vmovapd <x9stack=stack256#7,>x9=reg256#11
# asm 2: vmovapd <x9stack=192(%rsp),>x9=%ymm10
vmovapd 192(%rsp),%ymm10

# qhasm: x13 = x13stack
# asm 1: vmovapd <x13stack=stack256#8,>x13=reg256#13
# asm 2: vmovapd <x13stack=224(%rsp),>x13=%ymm12
vmovapd 224(%rsp),%ymm12

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#4,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x4=%ymm3,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm3,%ymm6,%ymm6

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm7,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm6,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm6,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm5,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm5,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $12,<x7=%ymm2,>t0=%ymm14
vpslld $12,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#4,>t1=reg256#16
# asm 2: vpslld $12,<x4=%ymm3,>t1=%ymm15
vpslld $12,%ymm3,%ymm15

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $20,<x4=%ymm3,>x4=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#4,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x4=%ymm3,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm3,%ymm6,%ymm6

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm7,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm6,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm6,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm5,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm5,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $7,<x7=%ymm2,>t0=%ymm14
vpslld $7,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#4,>t1=reg256#16
# asm 2: vpslld $7,<x4=%ymm3,>t1=%ymm15
vpslld $7,%ymm3,%ymm15

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $25,<x4=%ymm3,>x4=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#4,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x4=%ymm3,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm3,%ymm9,%ymm9

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm4,%ymm8,%ymm8

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm11,%ymm5,%ymm5

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x8=%ymm5,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#4,>t0=reg256#15
# asm 2: vpslld $12,<x4=%ymm3,>t0=%ymm14
vpslld $12,%ymm3,%ymm14

# qhasm: 8x t1 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $12,<x5=%ymm4,>t1=%ymm15
vpslld $12,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $20,<x4=%ymm3,>x4=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#4,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x4=%ymm3,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm3,%ymm9,%ymm9

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm4,%ymm8,%ymm8

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm11,%ymm5,%ymm5

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x8=%ymm5,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#4,>t0=reg256#15
# asm 2: vpslld $7,<x4=%ymm3,>t0=%ymm14
vpslld $7,%ymm3,%ymm14

# qhasm: 8x t1 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $7,<x5=%ymm4,>t1=%ymm15
vpslld $7,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $25,<x4=%ymm3,>x4=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: x4stack = x4
# asm 1: vmovapd <x4=reg256#4,>x4stack=stack256#5
# asm 2: vmovapd <x4=%ymm3,>x4stack=128(%rsp)
vmovapd %ymm3,128(%rsp)

# qhasm: x8stack = x8
# asm 1: vmovapd <x8=reg256#6,>x8stack=stack256#6
# asm 2: vmovapd <x8=%ymm5,>x8stack=160(%rsp)
vmovapd %ymm5,160(%rsp)

# qhasm: x9stack = x9
# asm 1: vmovapd <x9=reg256#11,>x9stack=stack256#7
# asm 2: vmovapd <x9=%ymm10,>x9stack=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: x13stack = x13
# asm 1: vmovapd <x13=reg256#13,>x13stack=stack256#8
# asm 2: vmovapd <x13=%ymm12,>x13stack=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm: x6 = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#4
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm3
vmovapd 0(%rsp),%ymm3

# qhasm: x10 = x10stack
# asm 1: vmovapd <x10stack=stack256#2,>x10=reg256#6
# asm 2: vmovapd <x10stack=32(%rsp),>x10=%ymm5
vmovapd 32(%rsp),%ymm5

# qhasm: x11 = x11stack
# asm 1: vmovapd <x11stack=stack256#3,>x11=reg256#11
# asm 2: vmovapd <x11stack=64(%rsp),>x11=%ymm10
vmovapd 64(%rsp),%ymm10

# qhasm: x15 = x15stack
# asm 1: vmovapd <x15stack=stack256#4,>x15=reg256#13
# asm 2: vmovapd <x15stack=96(%rsp),>x15=%ymm12
vmovapd 96(%rsp),%ymm12

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#4,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x6=%ymm3,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm3,%ymm7,%ymm7

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm2,%ymm6,%ymm6

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm6,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm6,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm13,%ymm5,%ymm5

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x10=%ymm5,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#4,>t0=reg256#15
# asm 2: vpslld $12,<x6=%ymm3,>t0=%ymm14
vpslld $12,%ymm3,%ymm14

# qhasm: 8x t1 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $12,<x7=%ymm2,>t1=%ymm15
vpslld $12,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $20,<x6=%ymm3,>x6=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#4,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x6=%ymm3,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm3,%ymm7,%ymm7

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm2,%ymm6,%ymm6

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm6,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm6,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm13,%ymm5,%ymm5

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x10=%ymm5,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm5,%ymm3,%ymm3

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#4,>t0=reg256#15
# asm 2: vpslld $7,<x6=%ymm3,>t0=%ymm14
vpslld $7,%ymm3,%ymm14

# qhasm: 8x t1 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $7,<x7=%ymm2,>t1=%ymm15
vpslld $7,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $25,<x6=%ymm3,>x6=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm14,%ymm3,%ymm3

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#4,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x6=%ymm3,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm3,%ymm8,%ymm8

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm9,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm8,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm5,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm5,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $12,<x5=%ymm4,>t0=%ymm14
vpslld $12,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#4,>t1=reg256#16
# asm 2: vpslld $12,<x6=%ymm3,>t1=%ymm15
vpslld $12,%ymm3,%ymm15

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $20,<x6=%ymm3,>x6=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#10,>x0=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm9,>x0=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#4,<x1=reg256#9,>x1=reg256#9
# asm 2: vpaddd <x6=%ymm3,<x1=%ymm8,>x1=%ymm8
vpaddd %ymm3,%ymm8,%ymm8

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#10,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm9,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#9,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm8,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#6,>x10=reg256#6
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm5,>x10=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#6,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm5,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm5,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $7,<x5=%ymm4,>t0=%ymm14
vpslld $7,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#4,>t1=reg256#16
# asm 2: vpslld $7,<x6=%ymm3,>t1=%ymm15
vpslld $7,%ymm3,%ymm15

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#4,>x6=reg256#4
# asm 2: vpsrld $25,<x6=%ymm3,>x6=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#4,>x6=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm3,>x6=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#4,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm3,>x6stack=0(%rsp)
vmovapd %ymm3,0(%rsp)

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#6,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm5,>x10stack=32(%rsp)
vmovapd %ymm5,32(%rsp)

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#11,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm10,>x11stack=64(%rsp)
vmovapd %ymm10,64(%rsp)

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#13,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm12,>x15stack=96(%rsp)
vmovapd %ymm12,96(%rsp)

# qhasm: x4 = x4stack
# asm 1: vmovapd <x4stack=stack256#5,>x4=reg256#4
# asm 2: vmovapd <x4stack=128(%rsp),>x4=%ymm3
vmovapd 128(%rsp),%ymm3

# qhasm: x8 = x8stack
# asm 1: vmovapd <x8stack=stack256#6,>x8=reg256#6
# asm 2: vmovapd <x8stack=160(%rsp),>x8=%ymm5
vmovapd 160(%rsp),%ymm5

# qhasm: x9 = x9stack
# asm 1: vmovapd <x9stack=stack256#7,>x9=reg256#11
# asm 2: vmovapd <x9stack=192(%rsp),>x9=%ymm10
vmovapd 192(%rsp),%ymm10

# qhasm: x13 = x13stack
# asm 1: vmovapd <x13stack=stack256#8,>x13=reg256#13
# asm 2: vmovapd <x13stack=224(%rsp),>x13=%ymm12
vmovapd 224(%rsp),%ymm12

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#4,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x4=%ymm3,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm3,%ymm6,%ymm6

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm7,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm6,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm6,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm5,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm5,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $12,<x7=%ymm2,>t0=%ymm14
vpslld $12,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#4,>t1=reg256#16
# asm 2: vpslld $12,<x4=%ymm3,>t1=%ymm15
vpslld $12,%ymm3,%ymm15

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $20,<x4=%ymm3,>x4=%ymm3
vpsrld $20,%ymm3,%ymm3

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#8,>x2=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm7,>x2=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#4,<x3=reg256#7,>x3=reg256#7
# asm 2: vpaddd <x4=%ymm3,<x3=%ymm6,>x3=%ymm6
vpaddd %ymm3,%ymm6,%ymm6

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#8,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm7,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#7,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm6,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm6,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm12,%ymm5,%ymm5

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm5,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm5,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm10,%ymm3,%ymm3

# qhasm: 8x t0 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $7,<x7=%ymm2,>t0=%ymm14
vpslld $7,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#4,>t1=reg256#16
# asm 2: vpslld $7,<x4=%ymm3,>t1=%ymm15
vpslld $7,%ymm3,%ymm15

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#4,>x4=reg256#4
# asm 2: vpsrld $25,<x4=%ymm3,>x4=%ymm3
vpsrld $25,%ymm3,%ymm3

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#4,>x4=reg256#4
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm3,>x4=%ymm3
vxorpd %ymm15,%ymm3,%ymm3

# qhasm: x6  = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#15
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm14
vmovapd 0(%rsp),%ymm14

# qhasm: mem256[bufp +   0] = x0
# asm 1: vmovupd   <x0=reg256#10,0(<bufp=int64#6)
# asm 2: vmovupd   <x0=%ymm9,0(<bufp=%r9)
vmovupd   %ymm9,0(%r9)

# qhasm: mem256[bufp +  32] = x1
# asm 1: vmovupd   <x1=reg256#9,32(<bufp=int64#6)
# asm 2: vmovupd   <x1=%ymm8,32(<bufp=%r9)
vmovupd   %ymm8,32(%r9)

# qhasm: mem256[bufp +  64] = x2
# asm 1: vmovupd   <x2=reg256#8,64(<bufp=int64#6)
# asm 2: vmovupd   <x2=%ymm7,64(<bufp=%r9)
vmovupd   %ymm7,64(%r9)

# qhasm: mem256[bufp +  96] = x3
# asm 1: vmovupd   <x3=reg256#7,96(<bufp=int64#6)
# asm 2: vmovupd   <x3=%ymm6,96(<bufp=%r9)
vmovupd   %ymm6,96(%r9)

# qhasm: mem256[bufp + 128] = x4
# asm 1: vmovupd   <x4=reg256#4,128(<bufp=int64#6)
# asm 2: vmovupd   <x4=%ymm3,128(<bufp=%r9)
vmovupd   %ymm3,128(%r9)

# qhasm: mem256[bufp + 160] = x5
# asm 1: vmovupd   <x5=reg256#5,160(<bufp=int64#6)
# asm 2: vmovupd   <x5=%ymm4,160(<bufp=%r9)
vmovupd   %ymm4,160(%r9)

# qhasm: mem256[bufp + 192] = x6
# asm 1: vmovupd   <x6=reg256#15,192(<bufp=int64#6)
# asm 2: vmovupd   <x6=%ymm14,192(<bufp=%r9)
vmovupd   %ymm14,192(%r9)

# qhasm: mem256[bufp + 224] = x7
# asm 1: vmovupd   <x7=reg256#3,224(<bufp=int64#6)
# asm 2: vmovupd   <x7=%ymm2,224(<bufp=%r9)
vmovupd   %ymm2,224(%r9)

# qhasm: mask = mem256[input_3 +  32]
# asm 1: vmovupd   32(<input_3=int64#4),>mask=reg256#3
# asm 2: vmovupd   32(<input_3=%rcx),>mask=%ymm2
vmovupd   32(%rcx),%ymm2

# qhasm: x0  = mem256[input_1 +   0]
# asm 1: vmovupd   0(<input_1=int64#2),>x0=reg256#4
# asm 2: vmovupd   0(<input_1=%rsi),>x0=%ymm3
vmovupd   0(%rsi),%ymm3

# qhasm: x0 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x0=reg256#4,>x0=reg256#4
# asm 2: vxorpd <mask=%ymm2,<x0=%ymm3,>x0=%ymm3
vxorpd %ymm2,%ymm3,%ymm3

# qhasm: offset = distance
# asm 1: mov  <distance=int64#3,>offset=int64#8
# asm 2: mov  <distance=%rdx,>offset=%r10
mov  %rdx,%r10

# qhasm: x1  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x1=reg256#5
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x1=%ymm4
vmovupd   0(%rsi,%r10),%ymm4

# qhasm: x1 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x1=reg256#5,>x1=reg256#5
# asm 2: vxorpd <mask=%ymm2,<x1=%ymm4,>x1=%ymm4
vxorpd %ymm2,%ymm4,%ymm4

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: x2  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x2=reg256#7
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x2=%ymm6
vmovupd   0(%rsi,%r10),%ymm6

# qhasm: x2 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x2=reg256#7,>x2=reg256#7
# asm 2: vxorpd <mask=%ymm2,<x2=%ymm6,>x2=%ymm6
vxorpd %ymm2,%ymm6,%ymm6

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: x3  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x3=reg256#8
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x3=%ymm7
vmovupd   0(%rsi,%r10),%ymm7

# qhasm: x3 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vxorpd <mask=%ymm2,<x3=%ymm7,>x3=%ymm7
vxorpd %ymm2,%ymm7,%ymm7

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: x4  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x4=reg256#9
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x4=%ymm8
vmovupd   0(%rsi,%r10),%ymm8

# qhasm: x4 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x4=reg256#9,>x4=reg256#9
# asm 2: vxorpd <mask=%ymm2,<x4=%ymm8,>x4=%ymm8
vxorpd %ymm2,%ymm8,%ymm8

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: x5  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x5=reg256#10
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x5=%ymm9
vmovupd   0(%rsi,%r10),%ymm9

# qhasm: x5 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x5=reg256#10,>x5=reg256#10
# asm 2: vxorpd <mask=%ymm2,<x5=%ymm9,>x5=%ymm9
vxorpd %ymm2,%ymm9,%ymm9

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: x6  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x6=reg256#15
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x6=%ymm14
vmovupd   0(%rsi,%r10),%ymm14

# qhasm: x6 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x6=reg256#15,>x6=reg256#15
# asm 2: vxorpd <mask=%ymm2,<x6=%ymm14,>x6=%ymm14
vxorpd %ymm2,%ymm14,%ymm14

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: x7  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#8),>x7=reg256#16
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%r10),>x7=%ymm15
vmovupd   0(%rsi,%r10),%ymm15

# qhasm: x7 ^= mask
# asm 1: vxorpd <mask=reg256#3,<x7=reg256#16,>x7=reg256#3
# asm 2: vxorpd <mask=%ymm2,<x7=%ymm15,>x7=%ymm2
vxorpd %ymm2,%ymm15,%ymm2

# qhasm: t0 = unpack  low dwords of x0 and x4 
# asm 1: vpunpckldq <x4=reg256#9,<x0=reg256#4,>t0=reg256#16
# asm 2: vpunpckldq <x4=%ymm8,<x0=%ymm3,>t0=%ymm15
vpunpckldq %ymm8,%ymm3,%ymm15

# qhasm: t1 = unpack high dwords of x0 and x4 
# asm 1: vpunpckhdq <x4=reg256#9,<x0=reg256#4,>t1=reg256#4
# asm 2: vpunpckhdq <x4=%ymm8,<x0=%ymm3,>t1=%ymm3
vpunpckhdq %ymm8,%ymm3,%ymm3

# qhasm: x0[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#4,<t0=reg256#16,>x0=reg256#9
# asm 2: vperm2f128 $0x20,<t1=%ymm3,<t0=%ymm15,>x0=%ymm8
vperm2f128 $0x20,%ymm3,%ymm15,%ymm8

# qhasm: x4[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#4,<t0=reg256#16,>x4=reg256#4
# asm 2: vperm2f128 $0x31,<t1=%ymm3,<t0=%ymm15,>x4=%ymm3
vperm2f128 $0x31,%ymm3,%ymm15,%ymm3

# qhasm: t0 = unpack  low dwords of x1 and x5
# asm 1: vpunpckldq <x5=reg256#10,<x1=reg256#5,>t0=reg256#16
# asm 2: vpunpckldq <x5=%ymm9,<x1=%ymm4,>t0=%ymm15
vpunpckldq %ymm9,%ymm4,%ymm15

# qhasm: t1 = unpack high dwords of x1 and x5
# asm 1: vpunpckhdq <x5=reg256#10,<x1=reg256#5,>t1=reg256#5
# asm 2: vpunpckhdq <x5=%ymm9,<x1=%ymm4,>t1=%ymm4
vpunpckhdq %ymm9,%ymm4,%ymm4

# qhasm: x1[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#5,<t0=reg256#16,>x1=reg256#10
# asm 2: vperm2f128 $0x20,<t1=%ymm4,<t0=%ymm15,>x1=%ymm9
vperm2f128 $0x20,%ymm4,%ymm15,%ymm9

# qhasm: x5[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#5,<t0=reg256#16,>x5=reg256#5
# asm 2: vperm2f128 $0x31,<t1=%ymm4,<t0=%ymm15,>x5=%ymm4
vperm2f128 $0x31,%ymm4,%ymm15,%ymm4

# qhasm: t0 = unpack  low dwords of x2 and x6
# asm 1: vpunpckldq <x6=reg256#15,<x2=reg256#7,>t0=reg256#16
# asm 2: vpunpckldq <x6=%ymm14,<x2=%ymm6,>t0=%ymm15
vpunpckldq %ymm14,%ymm6,%ymm15

# qhasm: t1 = unpack high dwords of x2 and x6
# asm 1: vpunpckhdq <x6=reg256#15,<x2=reg256#7,>t1=reg256#7
# asm 2: vpunpckhdq <x6=%ymm14,<x2=%ymm6,>t1=%ymm6
vpunpckhdq %ymm14,%ymm6,%ymm6

# qhasm: x2[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#7,<t0=reg256#16,>x2=reg256#15
# asm 2: vperm2f128 $0x20,<t1=%ymm6,<t0=%ymm15,>x2=%ymm14
vperm2f128 $0x20,%ymm6,%ymm15,%ymm14

# qhasm: x6[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#7,<t0=reg256#16,>x6=reg256#7
# asm 2: vperm2f128 $0x31,<t1=%ymm6,<t0=%ymm15,>x6=%ymm6
vperm2f128 $0x31,%ymm6,%ymm15,%ymm6

# qhasm: t0 = unpack  low dwords of x3 and x7
# asm 1: vpunpckldq <x7=reg256#3,<x3=reg256#8,>t0=reg256#16
# asm 2: vpunpckldq <x7=%ymm2,<x3=%ymm7,>t0=%ymm15
vpunpckldq %ymm2,%ymm7,%ymm15

# qhasm: t1 = unpack high dwords of x3 and x7
# asm 1: vpunpckhdq <x7=reg256#3,<x3=reg256#8,>t1=reg256#3
# asm 2: vpunpckhdq <x7=%ymm2,<x3=%ymm7,>t1=%ymm2
vpunpckhdq %ymm2,%ymm7,%ymm2

# qhasm: x3[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#3,<t0=reg256#16,>x3=reg256#8
# asm 2: vperm2f128 $0x20,<t1=%ymm2,<t0=%ymm15,>x3=%ymm7
vperm2f128 $0x20,%ymm2,%ymm15,%ymm7

# qhasm: x7[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#3,<t0=reg256#16,>x7=reg256#3
# asm 2: vperm2f128 $0x31,<t1=%ymm2,<t0=%ymm15,>x7=%ymm2
vperm2f128 $0x31,%ymm2,%ymm15,%ymm2

# qhasm: t0 = unpack  low dwords of x0 and x2
# asm 1: vpunpckldq <x2=reg256#15,<x0=reg256#9,>t0=reg256#16
# asm 2: vpunpckldq <x2=%ymm14,<x0=%ymm8,>t0=%ymm15
vpunpckldq %ymm14,%ymm8,%ymm15

# qhasm: t1 = unpack high dwords of x0 and x2
# asm 1: vpunpckhdq <x2=reg256#15,<x0=reg256#9,>t1=reg256#9
# asm 2: vpunpckhdq <x2=%ymm14,<x0=%ymm8,>t1=%ymm8
vpunpckhdq %ymm14,%ymm8,%ymm8

# qhasm: x0[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#9,<t0=reg256#16,>x0=reg256#15
# asm 2: vperm2f128 $0x20,<t1=%ymm8,<t0=%ymm15,>x0=%ymm14
vperm2f128 $0x20,%ymm8,%ymm15,%ymm14

# qhasm: x2[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#9,<t0=reg256#16,>x2=reg256#9
# asm 2: vperm2f128 $0x31,<t1=%ymm8,<t0=%ymm15,>x2=%ymm8
vperm2f128 $0x31,%ymm8,%ymm15,%ymm8

# qhasm: t0 = unpack  low dwords of x1 and x3
# asm 1: vpunpckldq <x3=reg256#8,<x1=reg256#10,>t0=reg256#16
# asm 2: vpunpckldq <x3=%ymm7,<x1=%ymm9,>t0=%ymm15
vpunpckldq %ymm7,%ymm9,%ymm15

# qhasm: t1 = unpack high dwords of x1 and x3
# asm 1: vpunpckhdq <x3=reg256#8,<x1=reg256#10,>t1=reg256#8
# asm 2: vpunpckhdq <x3=%ymm7,<x1=%ymm9,>t1=%ymm7
vpunpckhdq %ymm7,%ymm9,%ymm7

# qhasm: x1[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#8,<t0=reg256#16,>x1=reg256#10
# asm 2: vperm2f128 $0x20,<t1=%ymm7,<t0=%ymm15,>x1=%ymm9
vperm2f128 $0x20,%ymm7,%ymm15,%ymm9

# qhasm: x3[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#8,<t0=reg256#16,>x3=reg256#8
# asm 2: vperm2f128 $0x31,<t1=%ymm7,<t0=%ymm15,>x3=%ymm7
vperm2f128 $0x31,%ymm7,%ymm15,%ymm7

# qhasm: t0 = unpack  low dwords of x4 and x6
# asm 1: vpunpckldq <x6=reg256#7,<x4=reg256#4,>t0=reg256#16
# asm 2: vpunpckldq <x6=%ymm6,<x4=%ymm3,>t0=%ymm15
vpunpckldq %ymm6,%ymm3,%ymm15

# qhasm: t1 = unpack high dwords of x4 and x6
# asm 1: vpunpckhdq <x6=reg256#7,<x4=reg256#4,>t1=reg256#4
# asm 2: vpunpckhdq <x6=%ymm6,<x4=%ymm3,>t1=%ymm3
vpunpckhdq %ymm6,%ymm3,%ymm3

# qhasm: x4[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#4,<t0=reg256#16,>x4=reg256#7
# asm 2: vperm2f128 $0x20,<t1=%ymm3,<t0=%ymm15,>x4=%ymm6
vperm2f128 $0x20,%ymm3,%ymm15,%ymm6

# qhasm: x6[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#4,<t0=reg256#16,>x6=reg256#4
# asm 2: vperm2f128 $0x31,<t1=%ymm3,<t0=%ymm15,>x6=%ymm3
vperm2f128 $0x31,%ymm3,%ymm15,%ymm3

# qhasm: t0 = unpack  low dwords of x5 and x7
# asm 1: vpunpckldq <x7=reg256#3,<x5=reg256#5,>t0=reg256#16
# asm 2: vpunpckldq <x7=%ymm2,<x5=%ymm4,>t0=%ymm15
vpunpckldq %ymm2,%ymm4,%ymm15

# qhasm: t1 = unpack high dwords of x5 and x7
# asm 1: vpunpckhdq <x7=reg256#3,<x5=reg256#5,>t1=reg256#3
# asm 2: vpunpckhdq <x7=%ymm2,<x5=%ymm4,>t1=%ymm2
vpunpckhdq %ymm2,%ymm4,%ymm2

# qhasm: x5[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#3,<t0=reg256#16,>x5=reg256#5
# asm 2: vperm2f128 $0x20,<t1=%ymm2,<t0=%ymm15,>x5=%ymm4
vperm2f128 $0x20,%ymm2,%ymm15,%ymm4

# qhasm: x7[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#3,<t0=reg256#16,>x7=reg256#3
# asm 2: vperm2f128 $0x31,<t1=%ymm2,<t0=%ymm15,>x7=%ymm2
vperm2f128 $0x31,%ymm2,%ymm15,%ymm2

# qhasm: t0 = unpack  low dwords of x0 and x1
# asm 1: vpunpckldq <x1=reg256#10,<x0=reg256#15,>t0=reg256#16
# asm 2: vpunpckldq <x1=%ymm9,<x0=%ymm14,>t0=%ymm15
vpunpckldq %ymm9,%ymm14,%ymm15

# qhasm: t1 = unpack high dwords of x0 and x1
# asm 1: vpunpckhdq <x1=reg256#10,<x0=reg256#15,>t1=reg256#10
# asm 2: vpunpckhdq <x1=%ymm9,<x0=%ymm14,>t1=%ymm9
vpunpckhdq %ymm9,%ymm14,%ymm9

# qhasm: x0[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#10,<t0=reg256#16,>x0=reg256#15
# asm 2: vperm2f128 $0x20,<t1=%ymm9,<t0=%ymm15,>x0=%ymm14
vperm2f128 $0x20,%ymm9,%ymm15,%ymm14

# qhasm: x1[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#10,<t0=reg256#16,>x1=reg256#10
# asm 2: vperm2f128 $0x31,<t1=%ymm9,<t0=%ymm15,>x1=%ymm9
vperm2f128 $0x31,%ymm9,%ymm15,%ymm9

# qhasm: t0 = unpack  low dwords of x2 and x3
# asm 1: vpunpckldq <x3=reg256#8,<x2=reg256#9,>t0=reg256#16
# asm 2: vpunpckldq <x3=%ymm7,<x2=%ymm8,>t0=%ymm15
vpunpckldq %ymm7,%ymm8,%ymm15

# qhasm: t1 = unpack high dwords of x2 and x3
# asm 1: vpunpckhdq <x3=reg256#8,<x2=reg256#9,>t1=reg256#8
# asm 2: vpunpckhdq <x3=%ymm7,<x2=%ymm8,>t1=%ymm7
vpunpckhdq %ymm7,%ymm8,%ymm7

# qhasm: x2[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#8,<t0=reg256#16,>x2=reg256#9
# asm 2: vperm2f128 $0x20,<t1=%ymm7,<t0=%ymm15,>x2=%ymm8
vperm2f128 $0x20,%ymm7,%ymm15,%ymm8

# qhasm: x3[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#8,<t0=reg256#16,>x3=reg256#8
# asm 2: vperm2f128 $0x31,<t1=%ymm7,<t0=%ymm15,>x3=%ymm7
vperm2f128 $0x31,%ymm7,%ymm15,%ymm7

# qhasm: t0 = unpack  low dwords of x4 and x5
# asm 1: vpunpckldq <x5=reg256#5,<x4=reg256#7,>t0=reg256#16
# asm 2: vpunpckldq <x5=%ymm4,<x4=%ymm6,>t0=%ymm15
vpunpckldq %ymm4,%ymm6,%ymm15

# qhasm: t1 = unpack high dwords of x4 and x5
# asm 1: vpunpckhdq <x5=reg256#5,<x4=reg256#7,>t1=reg256#5
# asm 2: vpunpckhdq <x5=%ymm4,<x4=%ymm6,>t1=%ymm4
vpunpckhdq %ymm4,%ymm6,%ymm4

# qhasm: x4[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#5,<t0=reg256#16,>x4=reg256#7
# asm 2: vperm2f128 $0x20,<t1=%ymm4,<t0=%ymm15,>x4=%ymm6
vperm2f128 $0x20,%ymm4,%ymm15,%ymm6

# qhasm: x5[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#5,<t0=reg256#16,>x5=reg256#5
# asm 2: vperm2f128 $0x31,<t1=%ymm4,<t0=%ymm15,>x5=%ymm4
vperm2f128 $0x31,%ymm4,%ymm15,%ymm4

# qhasm: t0 = unpack  low dwords of x6 and x7
# asm 1: vpunpckldq <x7=reg256#3,<x6=reg256#4,>t0=reg256#16
# asm 2: vpunpckldq <x7=%ymm2,<x6=%ymm3,>t0=%ymm15
vpunpckldq %ymm2,%ymm3,%ymm15

# qhasm: t1 = unpack high dwords of x6 and x7
# asm 1: vpunpckhdq <x7=reg256#3,<x6=reg256#4,>t1=reg256#3
# asm 2: vpunpckhdq <x7=%ymm2,<x6=%ymm3,>t1=%ymm2
vpunpckhdq %ymm2,%ymm3,%ymm2

# qhasm: x6[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#3,<t0=reg256#16,>x6=reg256#4
# asm 2: vperm2f128 $0x20,<t1=%ymm2,<t0=%ymm15,>x6=%ymm3
vperm2f128 $0x20,%ymm2,%ymm15,%ymm3

# qhasm: x7[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#3,<t0=reg256#16,>x7=reg256#3
# asm 2: vperm2f128 $0x31,<t1=%ymm2,<t0=%ymm15,>x7=%ymm2
vperm2f128 $0x31,%ymm2,%ymm15,%ymm2

# qhasm: x0 ^= mem256[bufp +   0]
# asm 1: vxorpd 0(<bufp=int64#6),<x0=reg256#15,<x0=reg256#15
# asm 2: vxorpd 0(<bufp=%r9),<x0=%ymm14,<x0=%ymm14
vxorpd 0(%r9),%ymm14,%ymm14

# qhasm: x1 ^= mem256[bufp +  32]
# asm 1: vxorpd 32(<bufp=int64#6),<x1=reg256#10,<x1=reg256#10
# asm 2: vxorpd 32(<bufp=%r9),<x1=%ymm9,<x1=%ymm9
vxorpd 32(%r9),%ymm9,%ymm9

# qhasm: x2 ^= mem256[bufp +  64]
# asm 1: vxorpd 64(<bufp=int64#6),<x2=reg256#9,<x2=reg256#9
# asm 2: vxorpd 64(<bufp=%r9),<x2=%ymm8,<x2=%ymm8
vxorpd 64(%r9),%ymm8,%ymm8

# qhasm: x3 ^= mem256[bufp +  96]
# asm 1: vxorpd 96(<bufp=int64#6),<x3=reg256#8,<x3=reg256#8
# asm 2: vxorpd 96(<bufp=%r9),<x3=%ymm7,<x3=%ymm7
vxorpd 96(%r9),%ymm7,%ymm7

# qhasm: x4 ^= mem256[bufp + 128]
# asm 1: vxorpd 128(<bufp=int64#6),<x4=reg256#7,<x4=reg256#7
# asm 2: vxorpd 128(<bufp=%r9),<x4=%ymm6,<x4=%ymm6
vxorpd 128(%r9),%ymm6,%ymm6

# qhasm: x5 ^= mem256[bufp + 160]
# asm 1: vxorpd 160(<bufp=int64#6),<x5=reg256#5,<x5=reg256#5
# asm 2: vxorpd 160(<bufp=%r9),<x5=%ymm4,<x5=%ymm4
vxorpd 160(%r9),%ymm4,%ymm4

# qhasm: x6 ^= mem256[bufp + 192]
# asm 1: vxorpd 192(<bufp=int64#6),<x6=reg256#4,<x6=reg256#4
# asm 2: vxorpd 192(<bufp=%r9),<x6=%ymm3,<x6=%ymm3
vxorpd 192(%r9),%ymm3,%ymm3

# qhasm: x7 ^= mem256[bufp + 224]
# asm 1: vxorpd 224(<bufp=int64#6),<x7=reg256#3,<x7=reg256#3
# asm 2: vxorpd 224(<bufp=%r9),<x7=%ymm2,<x7=%ymm2
vxorpd 224(%r9),%ymm2,%ymm2

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#4,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm3,>x6stack=0(%rsp)
vmovapd %ymm3,0(%rsp)

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#7,<x0=reg256#15,>x0=reg256#4
# asm 2: vpaddd <x4=%ymm6,<x0=%ymm14,>x0=%ymm3
vpaddd %ymm6,%ymm14,%ymm3

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm3,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm3,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm9,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm11,%ymm5,%ymm5

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x4=reg256#7,>x4=reg256#7
# asm 2: vxorpd <x8=%ymm5,<x4=%ymm6,>x4=%ymm6
vxorpd %ymm5,%ymm6,%ymm6

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#7,>t0=reg256#15
# asm 2: vpslld $12,<x4=%ymm6,>t0=%ymm14
vpslld $12,%ymm6,%ymm14

# qhasm: 8x t1 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $12,<x5=%ymm4,>t1=%ymm15
vpslld $12,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#7,>x4=reg256#7
# asm 2: vpsrld $20,<x4=%ymm6,>x4=%ymm6
vpsrld $20,%ymm6,%ymm6

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#7,>x4=reg256#7
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm6,>x4=%ymm6
vxorpd %ymm14,%ymm6,%ymm6

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#7,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x4=%ymm6,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm6,%ymm3,%ymm3

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm3,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm3,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm9,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#6,>x8=reg256#6
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm5,>x8=%ymm5
vpaddd %ymm11,%ymm5,%ymm5

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#6,<x4=reg256#7,>x4=reg256#7
# asm 2: vxorpd <x8=%ymm5,<x4=%ymm6,>x4=%ymm6
vxorpd %ymm5,%ymm6,%ymm6

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#7,>t0=reg256#15
# asm 2: vpslld $7,<x4=%ymm6,>t0=%ymm14
vpslld $7,%ymm6,%ymm14

# qhasm: 8x t1 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $7,<x5=%ymm4,>t1=%ymm15
vpslld $7,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#7,>x4=reg256#7
# asm 2: vpsrld $25,<x4=%ymm6,>x4=%ymm6
vpsrld $25,%ymm6,%ymm6

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#7,>x4=reg256#7
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm6,>x4=%ymm6
vxorpd %ymm14,%ymm6,%ymm6

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: x4stack = x4
# asm 1: vmovapd <x4=reg256#7,>x4stack=stack256#5
# asm 2: vmovapd <x4=%ymm6,>x4stack=128(%rsp)
vmovapd %ymm6,128(%rsp)

# qhasm: x8stack = x8
# asm 1: vmovapd <x8=reg256#6,>x8stack=stack256#6
# asm 2: vmovapd <x8=%ymm5,>x8stack=160(%rsp)
vmovapd %ymm5,160(%rsp)

# qhasm: x9stack = x9
# asm 1: vmovapd <x9=reg256#11,>x9stack=stack256#7
# asm 2: vmovapd <x9=%ymm10,>x9stack=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: x13stack = x13
# asm 1: vmovapd <x13=reg256#13,>x13stack=stack256#8
# asm 2: vmovapd <x13=%ymm12,>x13stack=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm: x6 = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#6
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm5
vmovapd 0(%rsp),%ymm5

# qhasm: x10 = x10stack
# asm 1: vmovapd <x10stack=stack256#2,>x10=reg256#7
# asm 2: vmovapd <x10stack=32(%rsp),>x10=%ymm6
vmovapd 32(%rsp),%ymm6

# qhasm: x11 = x11stack
# asm 1: vmovapd <x11stack=stack256#3,>x11=reg256#11
# asm 2: vmovapd <x11stack=64(%rsp),>x11=%ymm10
vmovapd 64(%rsp),%ymm10

# qhasm: x15 = x15stack
# asm 1: vmovapd <x15stack=stack256#4,>x15=reg256#13
# asm 2: vmovapd <x15stack=96(%rsp),>x15=%ymm12
vmovapd 96(%rsp),%ymm12

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#6,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x6=%ymm5,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm5,%ymm8,%ymm8

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm8,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm8,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm13,%ymm6,%ymm6

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x10=%ymm6,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#6,>t0=reg256#15
# asm 2: vpslld $12,<x6=%ymm5,>t0=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x t1 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $12,<x7=%ymm2,>t1=%ymm15
vpslld $12,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $20,<x6=%ymm5,>x6=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#6,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x6=%ymm5,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm5,%ymm8,%ymm8

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm8,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm8,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm13,%ymm6,%ymm6

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x10=%ymm6,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#6,>t0=reg256#15
# asm 2: vpslld $7,<x6=%ymm5,>t0=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x t1 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $7,<x7=%ymm2,>t1=%ymm15
vpslld $7,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $25,<x6=%ymm5,>x6=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm4,%ymm3,%ymm3

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#6,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x6=%ymm5,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm3,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm3,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm6,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm6,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $12,<x5=%ymm4,>t0=%ymm14
vpslld $12,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#6,>t1=reg256#16
# asm 2: vpslld $12,<x6=%ymm5,>t1=%ymm15
vpslld $12,%ymm5,%ymm15

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $20,<x6=%ymm5,>x6=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm4,%ymm3,%ymm3

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#6,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x6=%ymm5,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm3,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm3,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm6,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm6,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $7,<x5=%ymm4,>t0=%ymm14
vpslld $7,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#6,>t1=reg256#16
# asm 2: vpslld $7,<x6=%ymm5,>t1=%ymm15
vpslld $7,%ymm5,%ymm15

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $25,<x6=%ymm5,>x6=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#6,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm5,>x6stack=0(%rsp)
vmovapd %ymm5,0(%rsp)

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#7,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm6,>x10stack=32(%rsp)
vmovapd %ymm6,32(%rsp)

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#11,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm10,>x11stack=64(%rsp)
vmovapd %ymm10,64(%rsp)

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#13,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm12,>x15stack=96(%rsp)
vmovapd %ymm12,96(%rsp)

# qhasm: x4 = x4stack
# asm 1: vmovapd <x4stack=stack256#5,>x4=reg256#6
# asm 2: vmovapd <x4stack=128(%rsp),>x4=%ymm5
vmovapd 128(%rsp),%ymm5

# qhasm: x8 = x8stack
# asm 1: vmovapd <x8stack=stack256#6,>x8=reg256#7
# asm 2: vmovapd <x8stack=160(%rsp),>x8=%ymm6
vmovapd 160(%rsp),%ymm6

# qhasm: x9 = x9stack
# asm 1: vmovapd <x9stack=stack256#7,>x9=reg256#11
# asm 2: vmovapd <x9stack=192(%rsp),>x9=%ymm10
vmovapd 192(%rsp),%ymm10

# qhasm: x13 = x13stack
# asm 1: vmovapd <x13stack=stack256#8,>x13=reg256#13
# asm 2: vmovapd <x13stack=224(%rsp),>x13=%ymm12
vmovapd 224(%rsp),%ymm12

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm2,%ymm8,%ymm8

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#6,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x4=%ymm5,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm5,%ymm7,%ymm7

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $12,<x7=%ymm2,>t0=%ymm14
vpslld $12,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#6,>t1=reg256#16
# asm 2: vpslld $12,<x4=%ymm5,>t1=%ymm15
vpslld $12,%ymm5,%ymm15

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $20,<x4=%ymm5,>x4=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm2,%ymm8,%ymm8

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#6,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x4=%ymm5,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm5,%ymm7,%ymm7

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $7,<x7=%ymm2,>t0=%ymm14
vpslld $7,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#6,>t1=reg256#16
# asm 2: vpslld $7,<x4=%ymm5,>t1=%ymm15
vpslld $7,%ymm5,%ymm15

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $25,<x4=%ymm5,>x4=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#6,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x4=%ymm5,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm5,%ymm3,%ymm3

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm3,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm3,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm9,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm11,%ymm6,%ymm6

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x8=%ymm6,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#6,>t0=reg256#15
# asm 2: vpslld $12,<x4=%ymm5,>t0=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x t1 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $12,<x5=%ymm4,>t1=%ymm15
vpslld $12,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $20,<x4=%ymm5,>x4=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#6,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x4=%ymm5,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm5,%ymm3,%ymm3

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm3,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm3,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm9,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm11,%ymm6,%ymm6

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x8=%ymm6,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#6,>t0=reg256#15
# asm 2: vpslld $7,<x4=%ymm5,>t0=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x t1 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $7,<x5=%ymm4,>t1=%ymm15
vpslld $7,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $25,<x4=%ymm5,>x4=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: x4stack = x4
# asm 1: vmovapd <x4=reg256#6,>x4stack=stack256#5
# asm 2: vmovapd <x4=%ymm5,>x4stack=128(%rsp)
vmovapd %ymm5,128(%rsp)

# qhasm: x8stack = x8
# asm 1: vmovapd <x8=reg256#7,>x8stack=stack256#6
# asm 2: vmovapd <x8=%ymm6,>x8stack=160(%rsp)
vmovapd %ymm6,160(%rsp)

# qhasm: x9stack = x9
# asm 1: vmovapd <x9=reg256#11,>x9stack=stack256#7
# asm 2: vmovapd <x9=%ymm10,>x9stack=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: x13stack = x13
# asm 1: vmovapd <x13=reg256#13,>x13stack=stack256#8
# asm 2: vmovapd <x13=%ymm12,>x13stack=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm: x6 = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#6
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm5
vmovapd 0(%rsp),%ymm5

# qhasm: x10 = x10stack
# asm 1: vmovapd <x10stack=stack256#2,>x10=reg256#7
# asm 2: vmovapd <x10stack=32(%rsp),>x10=%ymm6
vmovapd 32(%rsp),%ymm6

# qhasm: x11 = x11stack
# asm 1: vmovapd <x11stack=stack256#3,>x11=reg256#11
# asm 2: vmovapd <x11stack=64(%rsp),>x11=%ymm10
vmovapd 64(%rsp),%ymm10

# qhasm: x15 = x15stack
# asm 1: vmovapd <x15stack=stack256#4,>x15=reg256#13
# asm 2: vmovapd <x15stack=96(%rsp),>x15=%ymm12
vmovapd 96(%rsp),%ymm12

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#6,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x6=%ymm5,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm5,%ymm8,%ymm8

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm8,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm8,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm13,%ymm6,%ymm6

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x10=%ymm6,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#6,>t0=reg256#15
# asm 2: vpslld $12,<x6=%ymm5,>t0=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x t1 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $12,<x7=%ymm2,>t1=%ymm15
vpslld $12,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $20,<x6=%ymm5,>x6=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#6,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x6=%ymm5,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm5,%ymm8,%ymm8

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm8,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm8,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm13,%ymm6,%ymm6

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x10=%ymm6,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#6,>t0=reg256#15
# asm 2: vpslld $7,<x6=%ymm5,>t0=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x t1 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $7,<x7=%ymm2,>t1=%ymm15
vpslld $7,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $25,<x6=%ymm5,>x6=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm4,%ymm3,%ymm3

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#6,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x6=%ymm5,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm3,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm3,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm6,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm6,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $12,<x5=%ymm4,>t0=%ymm14
vpslld $12,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#6,>t1=reg256#16
# asm 2: vpslld $12,<x6=%ymm5,>t1=%ymm15
vpslld $12,%ymm5,%ymm15

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $20,<x6=%ymm5,>x6=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm4,%ymm3,%ymm3

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#6,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x6=%ymm5,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm3,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm3,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm6,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm6,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $7,<x5=%ymm4,>t0=%ymm14
vpslld $7,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#6,>t1=reg256#16
# asm 2: vpslld $7,<x6=%ymm5,>t1=%ymm15
vpslld $7,%ymm5,%ymm15

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $25,<x6=%ymm5,>x6=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#6,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm5,>x6stack=0(%rsp)
vmovapd %ymm5,0(%rsp)

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#7,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm6,>x10stack=32(%rsp)
vmovapd %ymm6,32(%rsp)

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#11,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm10,>x11stack=64(%rsp)
vmovapd %ymm10,64(%rsp)

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#13,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm12,>x15stack=96(%rsp)
vmovapd %ymm12,96(%rsp)

# qhasm: x4 = x4stack
# asm 1: vmovapd <x4stack=stack256#5,>x4=reg256#6
# asm 2: vmovapd <x4stack=128(%rsp),>x4=%ymm5
vmovapd 128(%rsp),%ymm5

# qhasm: x8 = x8stack
# asm 1: vmovapd <x8stack=stack256#6,>x8=reg256#7
# asm 2: vmovapd <x8stack=160(%rsp),>x8=%ymm6
vmovapd 160(%rsp),%ymm6

# qhasm: x9 = x9stack
# asm 1: vmovapd <x9stack=stack256#7,>x9=reg256#11
# asm 2: vmovapd <x9stack=192(%rsp),>x9=%ymm10
vmovapd 192(%rsp),%ymm10

# qhasm: x13 = x13stack
# asm 1: vmovapd <x13stack=stack256#8,>x13=reg256#13
# asm 2: vmovapd <x13stack=224(%rsp),>x13=%ymm12
vmovapd 224(%rsp),%ymm12

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm2,%ymm8,%ymm8

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#6,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x4=%ymm5,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm5,%ymm7,%ymm7

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $12,<x7=%ymm2,>t0=%ymm14
vpslld $12,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#6,>t1=reg256#16
# asm 2: vpslld $12,<x4=%ymm5,>t1=%ymm15
vpslld $12,%ymm5,%ymm15

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $20,<x4=%ymm5,>x4=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm2,%ymm8,%ymm8

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#6,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x4=%ymm5,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm5,%ymm7,%ymm7

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $7,<x7=%ymm2,>t0=%ymm14
vpslld $7,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#6,>t1=reg256#16
# asm 2: vpslld $7,<x4=%ymm5,>t1=%ymm15
vpslld $7,%ymm5,%ymm15

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $25,<x4=%ymm5,>x4=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#6,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x4=%ymm5,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm5,%ymm3,%ymm3

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm3,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm3,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm9,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm11,%ymm6,%ymm6

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x8=%ymm6,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#6,>t0=reg256#15
# asm 2: vpslld $12,<x4=%ymm5,>t0=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x t1 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $12,<x5=%ymm4,>t1=%ymm15
vpslld $12,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $20,<x4=%ymm5,>x4=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#6,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x4=%ymm5,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm5,%ymm3,%ymm3

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm3,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm3,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm9,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm11,%ymm6,%ymm6

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x8=%ymm6,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#6,>t0=reg256#15
# asm 2: vpslld $7,<x4=%ymm5,>t0=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x t1 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $7,<x5=%ymm4,>t1=%ymm15
vpslld $7,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $25,<x4=%ymm5,>x4=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: x4stack = x4
# asm 1: vmovapd <x4=reg256#6,>x4stack=stack256#5
# asm 2: vmovapd <x4=%ymm5,>x4stack=128(%rsp)
vmovapd %ymm5,128(%rsp)

# qhasm: x8stack = x8
# asm 1: vmovapd <x8=reg256#7,>x8stack=stack256#6
# asm 2: vmovapd <x8=%ymm6,>x8stack=160(%rsp)
vmovapd %ymm6,160(%rsp)

# qhasm: x9stack = x9
# asm 1: vmovapd <x9=reg256#11,>x9stack=stack256#7
# asm 2: vmovapd <x9=%ymm10,>x9stack=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: x13stack = x13
# asm 1: vmovapd <x13=reg256#13,>x13stack=stack256#8
# asm 2: vmovapd <x13=%ymm12,>x13stack=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm: x6 = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#6
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm5
vmovapd 0(%rsp),%ymm5

# qhasm: x10 = x10stack
# asm 1: vmovapd <x10stack=stack256#2,>x10=reg256#7
# asm 2: vmovapd <x10stack=32(%rsp),>x10=%ymm6
vmovapd 32(%rsp),%ymm6

# qhasm: x11 = x11stack
# asm 1: vmovapd <x11stack=stack256#3,>x11=reg256#11
# asm 2: vmovapd <x11stack=64(%rsp),>x11=%ymm10
vmovapd 64(%rsp),%ymm10

# qhasm: x15 = x15stack
# asm 1: vmovapd <x15stack=stack256#4,>x15=reg256#13
# asm 2: vmovapd <x15stack=96(%rsp),>x15=%ymm12
vmovapd 96(%rsp),%ymm12

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#6,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x6=%ymm5,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm5,%ymm8,%ymm8

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm8,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm8,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm13,%ymm6,%ymm6

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x10=%ymm6,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#6,>t0=reg256#15
# asm 2: vpslld $12,<x6=%ymm5,>t0=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x t1 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $12,<x7=%ymm2,>t1=%ymm15
vpslld $12,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $20,<x6=%ymm5,>x6=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#6,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x6=%ymm5,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm5,%ymm8,%ymm8

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm8,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm8,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm13,%ymm6,%ymm6

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x10=%ymm6,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#6,>t0=reg256#15
# asm 2: vpslld $7,<x6=%ymm5,>t0=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x t1 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $7,<x7=%ymm2,>t1=%ymm15
vpslld $7,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $25,<x6=%ymm5,>x6=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm4,%ymm3,%ymm3

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#6,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x6=%ymm5,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm3,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm3,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm6,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm6,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $12,<x5=%ymm4,>t0=%ymm14
vpslld $12,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#6,>t1=reg256#16
# asm 2: vpslld $12,<x6=%ymm5,>t1=%ymm15
vpslld $12,%ymm5,%ymm15

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $20,<x6=%ymm5,>x6=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm4,%ymm3,%ymm3

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#6,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x6=%ymm5,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm3,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm3,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm6,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm6,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $7,<x5=%ymm4,>t0=%ymm14
vpslld $7,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#6,>t1=reg256#16
# asm 2: vpslld $7,<x6=%ymm5,>t1=%ymm15
vpslld $7,%ymm5,%ymm15

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $25,<x6=%ymm5,>x6=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#6,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm5,>x6stack=0(%rsp)
vmovapd %ymm5,0(%rsp)

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#7,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm6,>x10stack=32(%rsp)
vmovapd %ymm6,32(%rsp)

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#11,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm10,>x11stack=64(%rsp)
vmovapd %ymm10,64(%rsp)

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#13,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm12,>x15stack=96(%rsp)
vmovapd %ymm12,96(%rsp)

# qhasm: x4 = x4stack
# asm 1: vmovapd <x4stack=stack256#5,>x4=reg256#6
# asm 2: vmovapd <x4stack=128(%rsp),>x4=%ymm5
vmovapd 128(%rsp),%ymm5

# qhasm: x8 = x8stack
# asm 1: vmovapd <x8stack=stack256#6,>x8=reg256#7
# asm 2: vmovapd <x8stack=160(%rsp),>x8=%ymm6
vmovapd 160(%rsp),%ymm6

# qhasm: x9 = x9stack
# asm 1: vmovapd <x9stack=stack256#7,>x9=reg256#11
# asm 2: vmovapd <x9stack=192(%rsp),>x9=%ymm10
vmovapd 192(%rsp),%ymm10

# qhasm: x13 = x13stack
# asm 1: vmovapd <x13stack=stack256#8,>x13=reg256#13
# asm 2: vmovapd <x13stack=224(%rsp),>x13=%ymm12
vmovapd 224(%rsp),%ymm12

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm2,%ymm8,%ymm8

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#6,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x4=%ymm5,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm5,%ymm7,%ymm7

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $12,<x7=%ymm2,>t0=%ymm14
vpslld $12,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#6,>t1=reg256#16
# asm 2: vpslld $12,<x4=%ymm5,>t1=%ymm15
vpslld $12,%ymm5,%ymm15

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $20,<x4=%ymm5,>x4=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm2,%ymm8,%ymm8

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#6,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x4=%ymm5,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm5,%ymm7,%ymm7

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $7,<x7=%ymm2,>t0=%ymm14
vpslld $7,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#6,>t1=reg256#16
# asm 2: vpslld $7,<x4=%ymm5,>t1=%ymm15
vpslld $7,%ymm5,%ymm15

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $25,<x4=%ymm5,>x4=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#6,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x4=%ymm5,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm5,%ymm3,%ymm3

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm3,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm3,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm9,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm11,%ymm6,%ymm6

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x8=%ymm6,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#6,>t0=reg256#15
# asm 2: vpslld $12,<x4=%ymm5,>t0=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x t1 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $12,<x5=%ymm4,>t1=%ymm15
vpslld $12,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $20,<x4=%ymm5,>x4=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#6,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x4=%ymm5,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm5,%ymm3,%ymm3

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm3,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm3,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm9,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm11,%ymm6,%ymm6

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x8=%ymm6,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#6,>t0=reg256#15
# asm 2: vpslld $7,<x4=%ymm5,>t0=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x t1 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $7,<x5=%ymm4,>t1=%ymm15
vpslld $7,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $25,<x4=%ymm5,>x4=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: x4stack = x4
# asm 1: vmovapd <x4=reg256#6,>x4stack=stack256#5
# asm 2: vmovapd <x4=%ymm5,>x4stack=128(%rsp)
vmovapd %ymm5,128(%rsp)

# qhasm: x8stack = x8
# asm 1: vmovapd <x8=reg256#7,>x8stack=stack256#6
# asm 2: vmovapd <x8=%ymm6,>x8stack=160(%rsp)
vmovapd %ymm6,160(%rsp)

# qhasm: x9stack = x9
# asm 1: vmovapd <x9=reg256#11,>x9stack=stack256#7
# asm 2: vmovapd <x9=%ymm10,>x9stack=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: x13stack = x13
# asm 1: vmovapd <x13=reg256#13,>x13stack=stack256#8
# asm 2: vmovapd <x13=%ymm12,>x13stack=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm: x6 = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#6
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm5
vmovapd 0(%rsp),%ymm5

# qhasm: x10 = x10stack
# asm 1: vmovapd <x10stack=stack256#2,>x10=reg256#7
# asm 2: vmovapd <x10stack=32(%rsp),>x10=%ymm6
vmovapd 32(%rsp),%ymm6

# qhasm: x11 = x11stack
# asm 1: vmovapd <x11stack=stack256#3,>x11=reg256#11
# asm 2: vmovapd <x11stack=64(%rsp),>x11=%ymm10
vmovapd 64(%rsp),%ymm10

# qhasm: x15 = x15stack
# asm 1: vmovapd <x15stack=stack256#4,>x15=reg256#13
# asm 2: vmovapd <x15stack=96(%rsp),>x15=%ymm12
vmovapd 96(%rsp),%ymm12

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#6,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x6=%ymm5,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm5,%ymm8,%ymm8

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm8,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm8,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm13,%ymm6,%ymm6

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x10=%ymm6,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#6,>t0=reg256#15
# asm 2: vpslld $12,<x6=%ymm5,>t0=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x t1 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $12,<x7=%ymm2,>t1=%ymm15
vpslld $12,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $20,<x6=%ymm5,>x6=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#6,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x6=%ymm5,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm5,%ymm8,%ymm8

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm8,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm8,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm13,%ymm6,%ymm6

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x10=%ymm6,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#6,>t0=reg256#15
# asm 2: vpslld $7,<x6=%ymm5,>t0=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x t1 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $7,<x7=%ymm2,>t1=%ymm15
vpslld $7,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $25,<x6=%ymm5,>x6=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm4,%ymm3,%ymm3

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#6,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x6=%ymm5,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm3,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm3,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm6,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm6,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $12,<x5=%ymm4,>t0=%ymm14
vpslld $12,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#6,>t1=reg256#16
# asm 2: vpslld $12,<x6=%ymm5,>t1=%ymm15
vpslld $12,%ymm5,%ymm15

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $20,<x6=%ymm5,>x6=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm4,%ymm3,%ymm3

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#6,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x6=%ymm5,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm3,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm3,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm6,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm6,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $7,<x5=%ymm4,>t0=%ymm14
vpslld $7,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#6,>t1=reg256#16
# asm 2: vpslld $7,<x6=%ymm5,>t1=%ymm15
vpslld $7,%ymm5,%ymm15

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $25,<x6=%ymm5,>x6=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#6,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm5,>x6stack=0(%rsp)
vmovapd %ymm5,0(%rsp)

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#7,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm6,>x10stack=32(%rsp)
vmovapd %ymm6,32(%rsp)

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#11,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm10,>x11stack=64(%rsp)
vmovapd %ymm10,64(%rsp)

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#13,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm12,>x15stack=96(%rsp)
vmovapd %ymm12,96(%rsp)

# qhasm: x4 = x4stack
# asm 1: vmovapd <x4stack=stack256#5,>x4=reg256#6
# asm 2: vmovapd <x4stack=128(%rsp),>x4=%ymm5
vmovapd 128(%rsp),%ymm5

# qhasm: x8 = x8stack
# asm 1: vmovapd <x8stack=stack256#6,>x8=reg256#7
# asm 2: vmovapd <x8stack=160(%rsp),>x8=%ymm6
vmovapd 160(%rsp),%ymm6

# qhasm: x9 = x9stack
# asm 1: vmovapd <x9stack=stack256#7,>x9=reg256#11
# asm 2: vmovapd <x9stack=192(%rsp),>x9=%ymm10
vmovapd 192(%rsp),%ymm10

# qhasm: x13 = x13stack
# asm 1: vmovapd <x13stack=stack256#8,>x13=reg256#13
# asm 2: vmovapd <x13stack=224(%rsp),>x13=%ymm12
vmovapd 224(%rsp),%ymm12

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm2,%ymm8,%ymm8

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#6,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x4=%ymm5,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm5,%ymm7,%ymm7

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $12,<x7=%ymm2,>t0=%ymm14
vpslld $12,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#6,>t1=reg256#16
# asm 2: vpslld $12,<x4=%ymm5,>t1=%ymm15
vpslld $12,%ymm5,%ymm15

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $20,<x4=%ymm5,>x4=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm2,%ymm8,%ymm8

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#6,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x4=%ymm5,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm5,%ymm7,%ymm7

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $7,<x7=%ymm2,>t0=%ymm14
vpslld $7,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#6,>t1=reg256#16
# asm 2: vpslld $7,<x4=%ymm5,>t1=%ymm15
vpslld $7,%ymm5,%ymm15

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $25,<x4=%ymm5,>x4=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#6,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x4=%ymm5,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm5,%ymm3,%ymm3

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm3,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm3,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm9,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm11,%ymm6,%ymm6

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x8=%ymm6,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#6,>t0=reg256#15
# asm 2: vpslld $12,<x4=%ymm5,>t0=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x t1 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $12,<x5=%ymm4,>t1=%ymm15
vpslld $12,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $20,<x4=%ymm5,>x4=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#6,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x4=%ymm5,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm5,%ymm3,%ymm3

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm3,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm3,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm9,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm11,%ymm6,%ymm6

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x8=%ymm6,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#6,>t0=reg256#15
# asm 2: vpslld $7,<x4=%ymm5,>t0=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x t1 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $7,<x5=%ymm4,>t1=%ymm15
vpslld $7,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $25,<x4=%ymm5,>x4=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: x4stack = x4
# asm 1: vmovapd <x4=reg256#6,>x4stack=stack256#5
# asm 2: vmovapd <x4=%ymm5,>x4stack=128(%rsp)
vmovapd %ymm5,128(%rsp)

# qhasm: x8stack = x8
# asm 1: vmovapd <x8=reg256#7,>x8stack=stack256#6
# asm 2: vmovapd <x8=%ymm6,>x8stack=160(%rsp)
vmovapd %ymm6,160(%rsp)

# qhasm: x9stack = x9
# asm 1: vmovapd <x9=reg256#11,>x9stack=stack256#7
# asm 2: vmovapd <x9=%ymm10,>x9stack=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: x13stack = x13
# asm 1: vmovapd <x13=reg256#13,>x13stack=stack256#8
# asm 2: vmovapd <x13=%ymm12,>x13stack=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm: x6 = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#6
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm5
vmovapd 0(%rsp),%ymm5

# qhasm: x10 = x10stack
# asm 1: vmovapd <x10stack=stack256#2,>x10=reg256#7
# asm 2: vmovapd <x10stack=32(%rsp),>x10=%ymm6
vmovapd 32(%rsp),%ymm6

# qhasm: x11 = x11stack
# asm 1: vmovapd <x11stack=stack256#3,>x11=reg256#11
# asm 2: vmovapd <x11stack=64(%rsp),>x11=%ymm10
vmovapd 64(%rsp),%ymm10

# qhasm: x15 = x15stack
# asm 1: vmovapd <x15stack=stack256#4,>x15=reg256#13
# asm 2: vmovapd <x15stack=96(%rsp),>x15=%ymm12
vmovapd 96(%rsp),%ymm12

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#6,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x6=%ymm5,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm5,%ymm8,%ymm8

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm8,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm8,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm13,%ymm6,%ymm6

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x10=%ymm6,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#6,>t0=reg256#15
# asm 2: vpslld $12,<x6=%ymm5,>t0=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x t1 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $12,<x7=%ymm2,>t1=%ymm15
vpslld $12,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $20,<x6=%ymm5,>x6=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#6,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x6=%ymm5,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm5,%ymm8,%ymm8

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm8,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm8,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm13,%ymm6,%ymm6

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x10=%ymm6,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#6,>t0=reg256#15
# asm 2: vpslld $7,<x6=%ymm5,>t0=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x t1 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $7,<x7=%ymm2,>t1=%ymm15
vpslld $7,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $25,<x6=%ymm5,>x6=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm4,%ymm3,%ymm3

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#6,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x6=%ymm5,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm3,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm3,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm6,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm6,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $12,<x5=%ymm4,>t0=%ymm14
vpslld $12,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#6,>t1=reg256#16
# asm 2: vpslld $12,<x6=%ymm5,>t1=%ymm15
vpslld $12,%ymm5,%ymm15

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $20,<x6=%ymm5,>x6=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm4,%ymm3,%ymm3

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#6,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x6=%ymm5,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm3,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm3,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm6,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm6,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $7,<x5=%ymm4,>t0=%ymm14
vpslld $7,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#6,>t1=reg256#16
# asm 2: vpslld $7,<x6=%ymm5,>t1=%ymm15
vpslld $7,%ymm5,%ymm15

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $25,<x6=%ymm5,>x6=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#6,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm5,>x6stack=0(%rsp)
vmovapd %ymm5,0(%rsp)

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#7,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm6,>x10stack=32(%rsp)
vmovapd %ymm6,32(%rsp)

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#11,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm10,>x11stack=64(%rsp)
vmovapd %ymm10,64(%rsp)

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#13,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm12,>x15stack=96(%rsp)
vmovapd %ymm12,96(%rsp)

# qhasm: x4 = x4stack
# asm 1: vmovapd <x4stack=stack256#5,>x4=reg256#6
# asm 2: vmovapd <x4stack=128(%rsp),>x4=%ymm5
vmovapd 128(%rsp),%ymm5

# qhasm: x8 = x8stack
# asm 1: vmovapd <x8stack=stack256#6,>x8=reg256#7
# asm 2: vmovapd <x8stack=160(%rsp),>x8=%ymm6
vmovapd 160(%rsp),%ymm6

# qhasm: x9 = x9stack
# asm 1: vmovapd <x9stack=stack256#7,>x9=reg256#11
# asm 2: vmovapd <x9stack=192(%rsp),>x9=%ymm10
vmovapd 192(%rsp),%ymm10

# qhasm: x13 = x13stack
# asm 1: vmovapd <x13stack=stack256#8,>x13=reg256#13
# asm 2: vmovapd <x13stack=224(%rsp),>x13=%ymm12
vmovapd 224(%rsp),%ymm12

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm2,%ymm8,%ymm8

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#6,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x4=%ymm5,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm5,%ymm7,%ymm7

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $12,<x7=%ymm2,>t0=%ymm14
vpslld $12,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#6,>t1=reg256#16
# asm 2: vpslld $12,<x4=%ymm5,>t1=%ymm15
vpslld $12,%ymm5,%ymm15

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $20,<x4=%ymm5,>x4=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm2,%ymm8,%ymm8

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#6,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x4=%ymm5,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm5,%ymm7,%ymm7

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x2=%ymm8,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm8,%ymm12,%ymm12

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x3=%ymm7,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm7,%ymm13,%ymm13

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#13,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x13=%ymm12,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#14,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm13,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm13,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t0=reg256#15
# asm 2: vpslld $7,<x7=%ymm2,>t0=%ymm14
vpslld $7,%ymm2,%ymm14

# qhasm: 8x t1 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#6,>t1=reg256#16
# asm 2: vpslld $7,<x4=%ymm5,>t1=%ymm15
vpslld $7,%ymm5,%ymm15

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $25,<x4=%ymm5,>x4=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm14,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm14,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#6,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x4=%ymm5,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm5,%ymm3,%ymm3

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm3,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm3,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm9,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm11,%ymm6,%ymm6

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x8=%ymm6,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#6,>t0=reg256#15
# asm 2: vpslld $12,<x4=%ymm5,>t0=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x t1 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $12,<x5=%ymm4,>t1=%ymm15
vpslld $12,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $20,<x4=%ymm5,>x4=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: 8x  x0 += x4
# asm 1: vpaddd <x4=reg256#6,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x4=%ymm5,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm5,%ymm3,%ymm3

# qhasm: 8x  x1 += x5
# asm 1: vpaddd <x5=reg256#5,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x5=%ymm4,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm4,%ymm9,%ymm9

# qhasm: x12 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x0=%ymm3,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm3,%ymm11,%ymm11

# qhasm: x13 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x13=reg256#13,>x13=reg256#13
# asm 2: vxorpd <x1=%ymm9,<x13=%ymm12,>x13=%ymm12
vxorpd %ymm9,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#13,>x13=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm12,>x13=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x12
# asm 1: vpaddd <x12=reg256#12,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x12=%ymm11,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm11,%ymm6,%ymm6

# qhasm: 8x x9 += x13
# asm 1: vpaddd <x13=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x13=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x4 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x8=%ymm6,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x5 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x9=%ymm10,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm10,%ymm4,%ymm4

# qhasm: 8x t0 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#6,>t0=reg256#15
# asm 2: vpslld $7,<x4=%ymm5,>t0=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x t1 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t1=reg256#16
# asm 2: vpslld $7,<x5=%ymm4,>t1=%ymm15
vpslld $7,%ymm4,%ymm15

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $25,<x4=%ymm5,>x4=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: x4 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x5 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t1=%ymm15,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm15,%ymm4,%ymm4

# qhasm: x4stack = x4
# asm 1: vmovapd <x4=reg256#6,>x4stack=stack256#5
# asm 2: vmovapd <x4=%ymm5,>x4stack=128(%rsp)
vmovapd %ymm5,128(%rsp)

# qhasm: x8stack = x8
# asm 1: vmovapd <x8=reg256#7,>x8stack=stack256#6
# asm 2: vmovapd <x8=%ymm6,>x8stack=160(%rsp)
vmovapd %ymm6,160(%rsp)

# qhasm: x9stack = x9
# asm 1: vmovapd <x9=reg256#11,>x9stack=stack256#7
# asm 2: vmovapd <x9=%ymm10,>x9stack=192(%rsp)
vmovapd %ymm10,192(%rsp)

# qhasm: x13stack = x13
# asm 1: vmovapd <x13=reg256#13,>x13stack=stack256#8
# asm 2: vmovapd <x13=%ymm12,>x13stack=224(%rsp)
vmovapd %ymm12,224(%rsp)

# qhasm: x6 = x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#6
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm5
vmovapd 0(%rsp),%ymm5

# qhasm: x10 = x10stack
# asm 1: vmovapd <x10stack=stack256#2,>x10=reg256#7
# asm 2: vmovapd <x10stack=32(%rsp),>x10=%ymm6
vmovapd 32(%rsp),%ymm6

# qhasm: x11 = x11stack
# asm 1: vmovapd <x11stack=stack256#3,>x11=reg256#11
# asm 2: vmovapd <x11stack=64(%rsp),>x11=%ymm10
vmovapd 64(%rsp),%ymm10

# qhasm: x15 = x15stack
# asm 1: vmovapd <x15stack=stack256#4,>x15=reg256#13
# asm 2: vmovapd <x15stack=96(%rsp),>x15=%ymm12
vmovapd 96(%rsp),%ymm12

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#6,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x6=%ymm5,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm5,%ymm8,%ymm8

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm8,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm8,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm1,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm13,%ymm6,%ymm6

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x10=%ymm6,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#6,>t0=reg256#15
# asm 2: vpslld $12,<x6=%ymm5,>t0=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x t1 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $12,<x7=%ymm2,>t1=%ymm15
vpslld $12,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $20,<x6=%ymm5,>x6=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x2 += x6
# asm 1: vpaddd <x6=reg256#6,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x6=%ymm5,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm5,%ymm8,%ymm8

# qhasm: 8x  x3 += x7
# asm 1: vpaddd <x7=reg256#3,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x7=%ymm2,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm2,%ymm7,%ymm7

# qhasm: x14 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x14=reg256#14,>x14=reg256#14
# asm 2: vxorpd <x2=%ymm8,<x14=%ymm13,>x14=%ymm13
vxorpd %ymm8,%ymm13,%ymm13

# qhasm: x15 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#14,>x14=reg256#14
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm13,>x14=%ymm13
vpshufb %ymm0,%ymm13,%ymm13

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x10 += x14
# asm 1: vpaddd <x14=reg256#14,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x14=%ymm13,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm13,%ymm6,%ymm6

# qhasm: 8x x11 += x15
# asm 1: vpaddd <x15=reg256#13,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x15=%ymm12,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x6 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x10=%ymm6,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm6,%ymm5,%ymm5

# qhasm: x7 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x11=%ymm10,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm10,%ymm2,%ymm2

# qhasm: 8x t0 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#6,>t0=reg256#15
# asm 2: vpslld $7,<x6=%ymm5,>t0=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x t1 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t1=reg256#16
# asm 2: vpslld $7,<x7=%ymm2,>t1=%ymm15
vpslld $7,%ymm2,%ymm15

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $25,<x6=%ymm5,>x6=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: x6 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t0=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x7 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t1=%ymm15,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm15,%ymm2,%ymm2

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm4,%ymm3,%ymm3

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#6,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x6=%ymm5,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm3,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm3,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm6,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm6,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x5 << 12
# asm 1: vpslld $12,<x5=reg256#5,>t0=reg256#15
# asm 2: vpslld $12,<x5=%ymm4,>t0=%ymm14
vpslld $12,%ymm4,%ymm14

# qhasm: 8x t1 = x6 << 12
# asm 1: vpslld $12,<x6=reg256#6,>t1=reg256#16
# asm 2: vpslld $12,<x6=%ymm5,>t1=%ymm15
vpslld $12,%ymm5,%ymm15

# qhasm: 8x x5 unsigned>>= 20
# asm 1: vpsrld $20,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $20,<x5=%ymm4,>x5=%ymm4
vpsrld $20,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 20
# asm 1: vpsrld $20,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $20,<x6=%ymm5,>x6=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#15,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm14,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm14,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#16,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t1=%ymm15,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm15,%ymm5,%ymm5

# qhasm: 8x  x0 += x5
# asm 1: vpaddd <x5=reg256#5,<x0=reg256#4,>x0=reg256#4
# asm 2: vpaddd <x5=%ymm4,<x0=%ymm3,>x0=%ymm3
vpaddd %ymm4,%ymm3,%ymm3

# qhasm: 8x  x1 += x6
# asm 1: vpaddd <x6=reg256#6,<x1=reg256#10,>x1=reg256#10
# asm 2: vpaddd <x6=%ymm5,<x1=%ymm9,>x1=%ymm9
vpaddd %ymm5,%ymm9,%ymm9

# qhasm: x15 ^= x0
# asm 1: vxorpd <x0=reg256#4,<x15=reg256#13,>x15=reg256#13
# asm 2: vxorpd <x0=%ymm3,<x15=%ymm12,>x15=%ymm12
vxorpd %ymm3,%ymm12,%ymm12

# qhasm: x12 ^= x1
# asm 1: vxorpd <x1=reg256#10,<x12=reg256#12,>x12=reg256#12
# asm 2: vxorpd <x1=%ymm9,<x12=%ymm11,>x12=%ymm11
vxorpd %ymm9,%ymm11,%ymm11

# qhasm: x15 = shuffle bytes of x15 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x15=reg256#13,>x15=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x15=%ymm12,>x15=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: x12 = shuffle bytes of x12 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x12=reg256#12,>x12=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x12=%ymm11,>x12=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: 8x x10 += x15
# asm 1: vpaddd <x15=reg256#13,<x10=reg256#7,>x10=reg256#7
# asm 2: vpaddd <x15=%ymm12,<x10=%ymm6,>x10=%ymm6
vpaddd %ymm12,%ymm6,%ymm6

# qhasm: 8x x11 += x12
# asm 1: vpaddd <x12=reg256#12,<x11=reg256#11,>x11=reg256#11
# asm 2: vpaddd <x12=%ymm11,<x11=%ymm10,>x11=%ymm10
vpaddd %ymm11,%ymm10,%ymm10

# qhasm: x5 ^= x10
# asm 1: vxorpd <x10=reg256#7,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <x10=%ymm6,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm6,%ymm4,%ymm4

# qhasm: x6 ^= x11
# asm 1: vxorpd <x11=reg256#11,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <x11=%ymm10,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x5 << 7
# asm 1: vpslld $7,<x5=reg256#5,>t0=reg256#12
# asm 2: vpslld $7,<x5=%ymm4,>t0=%ymm11
vpslld $7,%ymm4,%ymm11

# qhasm: 8x t1 = x6 << 7
# asm 1: vpslld $7,<x6=reg256#6,>t1=reg256#15
# asm 2: vpslld $7,<x6=%ymm5,>t1=%ymm14
vpslld $7,%ymm5,%ymm14

# qhasm: 8x x5 unsigned>>= 25
# asm 1: vpsrld $25,<x5=reg256#5,>x5=reg256#5
# asm 2: vpsrld $25,<x5=%ymm4,>x5=%ymm4
vpsrld $25,%ymm4,%ymm4

# qhasm: 8x x6 unsigned>>= 25
# asm 1: vpsrld $25,<x6=reg256#6,>x6=reg256#6
# asm 2: vpsrld $25,<x6=%ymm5,>x6=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: x5 ^= t0
# asm 1: vxorpd <t0=reg256#12,<x5=reg256#5,>x5=reg256#5
# asm 2: vxorpd <t0=%ymm11,<x5=%ymm4,>x5=%ymm4
vxorpd %ymm11,%ymm4,%ymm4

# qhasm: x6 ^= t1
# asm 1: vxorpd <t1=reg256#15,<x6=reg256#6,>x6=reg256#6
# asm 2: vxorpd <t1=%ymm14,<x6=%ymm5,>x6=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: x6stack = x6
# asm 1: vmovapd <x6=reg256#6,>x6stack=stack256#1
# asm 2: vmovapd <x6=%ymm5,>x6stack=0(%rsp)
vmovapd %ymm5,0(%rsp)

# qhasm: x10stack = x10
# asm 1: vmovapd <x10=reg256#7,>x10stack=stack256#2
# asm 2: vmovapd <x10=%ymm6,>x10stack=32(%rsp)
vmovapd %ymm6,32(%rsp)

# qhasm: x11stack = x11
# asm 1: vmovapd <x11=reg256#11,>x11stack=stack256#3
# asm 2: vmovapd <x11=%ymm10,>x11stack=64(%rsp)
vmovapd %ymm10,64(%rsp)

# qhasm: x15stack = x15
# asm 1: vmovapd <x15=reg256#13,>x15stack=stack256#4
# asm 2: vmovapd <x15=%ymm12,>x15stack=96(%rsp)
vmovapd %ymm12,96(%rsp)

# qhasm: x4 = x4stack
# asm 1: vmovapd <x4stack=stack256#5,>x4=reg256#6
# asm 2: vmovapd <x4stack=128(%rsp),>x4=%ymm5
vmovapd 128(%rsp),%ymm5

# qhasm: x8 = x8stack
# asm 1: vmovapd <x8stack=stack256#6,>x8=reg256#7
# asm 2: vmovapd <x8stack=160(%rsp),>x8=%ymm6
vmovapd 160(%rsp),%ymm6

# qhasm: x9 = x9stack
# asm 1: vmovapd <x9stack=stack256#7,>x9=reg256#11
# asm 2: vmovapd <x9stack=192(%rsp),>x9=%ymm10
vmovapd 192(%rsp),%ymm10

# qhasm: x13 = x13stack
# asm 1: vmovapd <x13stack=stack256#8,>x13=reg256#12
# asm 2: vmovapd <x13stack=224(%rsp),>x13=%ymm11
vmovapd 224(%rsp),%ymm11

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm2,%ymm8,%ymm8

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#6,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x4=%ymm5,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm5,%ymm7,%ymm7

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x13=reg256#12,>x13=reg256#12
# asm 2: vxorpd <x2=%ymm8,<x13=%ymm11,>x13=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x14=reg256#14,>x14=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x14=%ymm13,>x14=%ymm12
vxorpd %ymm7,%ymm13,%ymm12

# qhasm: x13 = shuffle bytes of x13 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x13=reg256#12,>x13=reg256#12
# asm 2: vpshufb <rotate16=%ymm1,<x13=%ymm11,>x13=%ymm11
vpshufb %ymm1,%ymm11,%ymm11

# qhasm: x14 = shuffle bytes of x14 by rotate16
# asm 1: vpshufb <rotate16=reg256#2,<x14=reg256#13,>x14=reg256#13
# asm 2: vpshufb <rotate16=%ymm1,<x14=%ymm12,>x14=%ymm12
vpshufb %ymm1,%ymm12,%ymm12

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#12,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x13=%ymm11,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm11,%ymm6,%ymm6

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x7 << 12
# asm 1: vpslld $12,<x7=reg256#3,>t0=reg256#14
# asm 2: vpslld $12,<x7=%ymm2,>t0=%ymm13
vpslld $12,%ymm2,%ymm13

# qhasm: 8x t1 = x4 << 12
# asm 1: vpslld $12,<x4=reg256#6,>t1=reg256#15
# asm 2: vpslld $12,<x4=%ymm5,>t1=%ymm14
vpslld $12,%ymm5,%ymm14

# qhasm: 8x x7 unsigned>>= 20
# asm 1: vpsrld $20,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $20,<x7=%ymm2,>x7=%ymm2
vpsrld $20,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 20
# asm 1: vpsrld $20,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $20,<x4=%ymm5,>x4=%ymm5
vpsrld $20,%ymm5,%ymm5

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#14,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm13,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm13,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#15,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t1=%ymm14,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm14,%ymm5,%ymm5

# qhasm: 8x  x2 += x7
# asm 1: vpaddd <x7=reg256#3,<x2=reg256#9,>x2=reg256#9
# asm 2: vpaddd <x7=%ymm2,<x2=%ymm8,>x2=%ymm8
vpaddd %ymm2,%ymm8,%ymm8

# qhasm: 8x  x3 += x4
# asm 1: vpaddd <x4=reg256#6,<x3=reg256#8,>x3=reg256#8
# asm 2: vpaddd <x4=%ymm5,<x3=%ymm7,>x3=%ymm7
vpaddd %ymm5,%ymm7,%ymm7

# qhasm: x13 ^= x2
# asm 1: vxorpd <x2=reg256#9,<x13=reg256#12,>x13=reg256#12
# asm 2: vxorpd <x2=%ymm8,<x13=%ymm11,>x13=%ymm11
vxorpd %ymm8,%ymm11,%ymm11

# qhasm: x14 ^= x3
# asm 1: vxorpd <x3=reg256#8,<x14=reg256#13,>x14=reg256#13
# asm 2: vxorpd <x3=%ymm7,<x14=%ymm12,>x14=%ymm12
vxorpd %ymm7,%ymm12,%ymm12

# qhasm: x13 = shuffle bytes of x13 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x13=reg256#12,>x13=reg256#12
# asm 2: vpshufb <rotate8=%ymm0,<x13=%ymm11,>x13=%ymm11
vpshufb %ymm0,%ymm11,%ymm11

# qhasm: x14 = shuffle bytes of x14 by rotate8
# asm 1: vpshufb <rotate8=reg256#1,<x14=reg256#13,>x14=reg256#13
# asm 2: vpshufb <rotate8=%ymm0,<x14=%ymm12,>x14=%ymm12
vpshufb %ymm0,%ymm12,%ymm12

# qhasm: 8x x8 += x13
# asm 1: vpaddd <x13=reg256#12,<x8=reg256#7,>x8=reg256#7
# asm 2: vpaddd <x13=%ymm11,<x8=%ymm6,>x8=%ymm6
vpaddd %ymm11,%ymm6,%ymm6

# qhasm: 8x x9 += x14
# asm 1: vpaddd <x14=reg256#13,<x9=reg256#11,>x9=reg256#11
# asm 2: vpaddd <x14=%ymm12,<x9=%ymm10,>x9=%ymm10
vpaddd %ymm12,%ymm10,%ymm10

# qhasm: x7 ^= x8
# asm 1: vxorpd <x8=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <x8=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= x9
# asm 1: vxorpd <x9=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <x9=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: 8x t0 = x7 << 7
# asm 1: vpslld $7,<x7=reg256#3,>t0=reg256#7
# asm 2: vpslld $7,<x7=%ymm2,>t0=%ymm6
vpslld $7,%ymm2,%ymm6

# qhasm: 8x t1 = x4 << 7
# asm 1: vpslld $7,<x4=reg256#6,>t1=reg256#11
# asm 2: vpslld $7,<x4=%ymm5,>t1=%ymm10
vpslld $7,%ymm5,%ymm10

# qhasm: 8x x7 unsigned>>= 25
# asm 1: vpsrld $25,<x7=reg256#3,>x7=reg256#3
# asm 2: vpsrld $25,<x7=%ymm2,>x7=%ymm2
vpsrld $25,%ymm2,%ymm2

# qhasm: 8x x4 unsigned>>= 25
# asm 1: vpsrld $25,<x4=reg256#6,>x4=reg256#6
# asm 2: vpsrld $25,<x4=%ymm5,>x4=%ymm5
vpsrld $25,%ymm5,%ymm5

# qhasm: x7 ^= t0
# asm 1: vxorpd <t0=reg256#7,<x7=reg256#3,>x7=reg256#3
# asm 2: vxorpd <t0=%ymm6,<x7=%ymm2,>x7=%ymm2
vxorpd %ymm6,%ymm2,%ymm2

# qhasm: x4 ^= t1
# asm 1: vxorpd <t1=reg256#11,<x4=reg256#6,>x4=reg256#6
# asm 2: vxorpd <t1=%ymm10,<x4=%ymm5,>x4=%ymm5
vxorpd %ymm10,%ymm5,%ymm5

# qhasm: x6= x6stack
# asm 1: vmovapd <x6stack=stack256#1,>x6=reg256#7
# asm 2: vmovapd <x6stack=0(%rsp),>x6=%ymm6
vmovapd 0(%rsp),%ymm6

# qhasm: t0 = unpack  low dwords of x0 and x4 
# asm 1: vpunpckldq <x4=reg256#6,<x0=reg256#4,>t0=reg256#11
# asm 2: vpunpckldq <x4=%ymm5,<x0=%ymm3,>t0=%ymm10
vpunpckldq %ymm5,%ymm3,%ymm10

# qhasm: t1 = unpack high dwords of x0 and x4 
# asm 1: vpunpckhdq <x4=reg256#6,<x0=reg256#4,>t1=reg256#4
# asm 2: vpunpckhdq <x4=%ymm5,<x0=%ymm3,>t1=%ymm3
vpunpckhdq %ymm5,%ymm3,%ymm3

# qhasm: x0[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#4,<t0=reg256#11,>x0=reg256#6
# asm 2: vperm2f128 $0x20,<t1=%ymm3,<t0=%ymm10,>x0=%ymm5
vperm2f128 $0x20,%ymm3,%ymm10,%ymm5

# qhasm: x4[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#4,<t0=reg256#11,>x4=reg256#4
# asm 2: vperm2f128 $0x31,<t1=%ymm3,<t0=%ymm10,>x4=%ymm3
vperm2f128 $0x31,%ymm3,%ymm10,%ymm3

# qhasm: t0 = unpack  low dwords of x1 and x5
# asm 1: vpunpckldq <x5=reg256#5,<x1=reg256#10,>t0=reg256#11
# asm 2: vpunpckldq <x5=%ymm4,<x1=%ymm9,>t0=%ymm10
vpunpckldq %ymm4,%ymm9,%ymm10

# qhasm: t1 = unpack high dwords of x1 and x5
# asm 1: vpunpckhdq <x5=reg256#5,<x1=reg256#10,>t1=reg256#5
# asm 2: vpunpckhdq <x5=%ymm4,<x1=%ymm9,>t1=%ymm4
vpunpckhdq %ymm4,%ymm9,%ymm4

# qhasm: x1[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#5,<t0=reg256#11,>x1=reg256#10
# asm 2: vperm2f128 $0x20,<t1=%ymm4,<t0=%ymm10,>x1=%ymm9
vperm2f128 $0x20,%ymm4,%ymm10,%ymm9

# qhasm: x5[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#5,<t0=reg256#11,>x5=reg256#5
# asm 2: vperm2f128 $0x31,<t1=%ymm4,<t0=%ymm10,>x5=%ymm4
vperm2f128 $0x31,%ymm4,%ymm10,%ymm4

# qhasm: t0 = unpack  low dwords of x2 and x6
# asm 1: vpunpckldq <x6=reg256#7,<x2=reg256#9,>t0=reg256#11
# asm 2: vpunpckldq <x6=%ymm6,<x2=%ymm8,>t0=%ymm10
vpunpckldq %ymm6,%ymm8,%ymm10

# qhasm: t1 = unpack high dwords of x2 and x6
# asm 1: vpunpckhdq <x6=reg256#7,<x2=reg256#9,>t1=reg256#7
# asm 2: vpunpckhdq <x6=%ymm6,<x2=%ymm8,>t1=%ymm6
vpunpckhdq %ymm6,%ymm8,%ymm6

# qhasm: x2[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#7,<t0=reg256#11,>x2=reg256#9
# asm 2: vperm2f128 $0x20,<t1=%ymm6,<t0=%ymm10,>x2=%ymm8
vperm2f128 $0x20,%ymm6,%ymm10,%ymm8

# qhasm: x6[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#7,<t0=reg256#11,>x6=reg256#7
# asm 2: vperm2f128 $0x31,<t1=%ymm6,<t0=%ymm10,>x6=%ymm6
vperm2f128 $0x31,%ymm6,%ymm10,%ymm6

# qhasm: t0 = unpack  low dwords of x3 and x7
# asm 1: vpunpckldq <x7=reg256#3,<x3=reg256#8,>t0=reg256#11
# asm 2: vpunpckldq <x7=%ymm2,<x3=%ymm7,>t0=%ymm10
vpunpckldq %ymm2,%ymm7,%ymm10

# qhasm: t1 = unpack high dwords of x3 and x7
# asm 1: vpunpckhdq <x7=reg256#3,<x3=reg256#8,>t1=reg256#3
# asm 2: vpunpckhdq <x7=%ymm2,<x3=%ymm7,>t1=%ymm2
vpunpckhdq %ymm2,%ymm7,%ymm2

# qhasm: x3[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#3,<t0=reg256#11,>x3=reg256#8
# asm 2: vperm2f128 $0x20,<t1=%ymm2,<t0=%ymm10,>x3=%ymm7
vperm2f128 $0x20,%ymm2,%ymm10,%ymm7

# qhasm: x7[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#3,<t0=reg256#11,>x7=reg256#3
# asm 2: vperm2f128 $0x31,<t1=%ymm2,<t0=%ymm10,>x7=%ymm2
vperm2f128 $0x31,%ymm2,%ymm10,%ymm2

# qhasm: t0 = unpack  low dwords of x0 and x2
# asm 1: vpunpckldq <x2=reg256#9,<x0=reg256#6,>t0=reg256#11
# asm 2: vpunpckldq <x2=%ymm8,<x0=%ymm5,>t0=%ymm10
vpunpckldq %ymm8,%ymm5,%ymm10

# qhasm: t1 = unpack high dwords of x0 and x2
# asm 1: vpunpckhdq <x2=reg256#9,<x0=reg256#6,>t1=reg256#6
# asm 2: vpunpckhdq <x2=%ymm8,<x0=%ymm5,>t1=%ymm5
vpunpckhdq %ymm8,%ymm5,%ymm5

# qhasm: x0[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#6,<t0=reg256#11,>x0=reg256#9
# asm 2: vperm2f128 $0x20,<t1=%ymm5,<t0=%ymm10,>x0=%ymm8
vperm2f128 $0x20,%ymm5,%ymm10,%ymm8

# qhasm: x2[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#6,<t0=reg256#11,>x2=reg256#6
# asm 2: vperm2f128 $0x31,<t1=%ymm5,<t0=%ymm10,>x2=%ymm5
vperm2f128 $0x31,%ymm5,%ymm10,%ymm5

# qhasm: t0 = unpack  low dwords of x1 and x3
# asm 1: vpunpckldq <x3=reg256#8,<x1=reg256#10,>t0=reg256#11
# asm 2: vpunpckldq <x3=%ymm7,<x1=%ymm9,>t0=%ymm10
vpunpckldq %ymm7,%ymm9,%ymm10

# qhasm: t1 = unpack high dwords of x1 and x3
# asm 1: vpunpckhdq <x3=reg256#8,<x1=reg256#10,>t1=reg256#8
# asm 2: vpunpckhdq <x3=%ymm7,<x1=%ymm9,>t1=%ymm7
vpunpckhdq %ymm7,%ymm9,%ymm7

# qhasm: x1[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#8,<t0=reg256#11,>x1=reg256#10
# asm 2: vperm2f128 $0x20,<t1=%ymm7,<t0=%ymm10,>x1=%ymm9
vperm2f128 $0x20,%ymm7,%ymm10,%ymm9

# qhasm: x3[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#8,<t0=reg256#11,>x3=reg256#8
# asm 2: vperm2f128 $0x31,<t1=%ymm7,<t0=%ymm10,>x3=%ymm7
vperm2f128 $0x31,%ymm7,%ymm10,%ymm7

# qhasm: t0 = unpack  low dwords of x4 and x6
# asm 1: vpunpckldq <x6=reg256#7,<x4=reg256#4,>t0=reg256#11
# asm 2: vpunpckldq <x6=%ymm6,<x4=%ymm3,>t0=%ymm10
vpunpckldq %ymm6,%ymm3,%ymm10

# qhasm: t1 = unpack high dwords of x4 and x6
# asm 1: vpunpckhdq <x6=reg256#7,<x4=reg256#4,>t1=reg256#4
# asm 2: vpunpckhdq <x6=%ymm6,<x4=%ymm3,>t1=%ymm3
vpunpckhdq %ymm6,%ymm3,%ymm3

# qhasm: x4[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#4,<t0=reg256#11,>x4=reg256#7
# asm 2: vperm2f128 $0x20,<t1=%ymm3,<t0=%ymm10,>x4=%ymm6
vperm2f128 $0x20,%ymm3,%ymm10,%ymm6

# qhasm: x6[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#4,<t0=reg256#11,>x6=reg256#4
# asm 2: vperm2f128 $0x31,<t1=%ymm3,<t0=%ymm10,>x6=%ymm3
vperm2f128 $0x31,%ymm3,%ymm10,%ymm3

# qhasm: t0 = unpack  low dwords of x5 and x7
# asm 1: vpunpckldq <x7=reg256#3,<x5=reg256#5,>t0=reg256#11
# asm 2: vpunpckldq <x7=%ymm2,<x5=%ymm4,>t0=%ymm10
vpunpckldq %ymm2,%ymm4,%ymm10

# qhasm: t1 = unpack high dwords of x5 and x7
# asm 1: vpunpckhdq <x7=reg256#3,<x5=reg256#5,>t1=reg256#3
# asm 2: vpunpckhdq <x7=%ymm2,<x5=%ymm4,>t1=%ymm2
vpunpckhdq %ymm2,%ymm4,%ymm2

# qhasm: x5[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#3,<t0=reg256#11,>x5=reg256#5
# asm 2: vperm2f128 $0x20,<t1=%ymm2,<t0=%ymm10,>x5=%ymm4
vperm2f128 $0x20,%ymm2,%ymm10,%ymm4

# qhasm: x7[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#3,<t0=reg256#11,>x7=reg256#3
# asm 2: vperm2f128 $0x31,<t1=%ymm2,<t0=%ymm10,>x7=%ymm2
vperm2f128 $0x31,%ymm2,%ymm10,%ymm2

# qhasm: t0 = unpack  low dwords of x0 and x1
# asm 1: vpunpckldq <x1=reg256#10,<x0=reg256#9,>t0=reg256#11
# asm 2: vpunpckldq <x1=%ymm9,<x0=%ymm8,>t0=%ymm10
vpunpckldq %ymm9,%ymm8,%ymm10

# qhasm: t1 = unpack high dwords of x0 and x1
# asm 1: vpunpckhdq <x1=reg256#10,<x0=reg256#9,>t1=reg256#9
# asm 2: vpunpckhdq <x1=%ymm9,<x0=%ymm8,>t1=%ymm8
vpunpckhdq %ymm9,%ymm8,%ymm8

# qhasm: x0[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#9,<t0=reg256#11,>x0=reg256#10
# asm 2: vperm2f128 $0x20,<t1=%ymm8,<t0=%ymm10,>x0=%ymm9
vperm2f128 $0x20,%ymm8,%ymm10,%ymm9

# qhasm: x1[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#9,<t0=reg256#11,>x1=reg256#9
# asm 2: vperm2f128 $0x31,<t1=%ymm8,<t0=%ymm10,>x1=%ymm8
vperm2f128 $0x31,%ymm8,%ymm10,%ymm8

# qhasm: t0 = unpack  low dwords of x2 and x3
# asm 1: vpunpckldq <x3=reg256#8,<x2=reg256#6,>t0=reg256#11
# asm 2: vpunpckldq <x3=%ymm7,<x2=%ymm5,>t0=%ymm10
vpunpckldq %ymm7,%ymm5,%ymm10

# qhasm: t1 = unpack high dwords of x2 and x3
# asm 1: vpunpckhdq <x3=reg256#8,<x2=reg256#6,>t1=reg256#6
# asm 2: vpunpckhdq <x3=%ymm7,<x2=%ymm5,>t1=%ymm5
vpunpckhdq %ymm7,%ymm5,%ymm5

# qhasm: x2[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#6,<t0=reg256#11,>x2=reg256#8
# asm 2: vperm2f128 $0x20,<t1=%ymm5,<t0=%ymm10,>x2=%ymm7
vperm2f128 $0x20,%ymm5,%ymm10,%ymm7

# qhasm: x3[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#6,<t0=reg256#11,>x3=reg256#6
# asm 2: vperm2f128 $0x31,<t1=%ymm5,<t0=%ymm10,>x3=%ymm5
vperm2f128 $0x31,%ymm5,%ymm10,%ymm5

# qhasm: t0 = unpack  low dwords of x4 and x5
# asm 1: vpunpckldq <x5=reg256#5,<x4=reg256#7,>t0=reg256#11
# asm 2: vpunpckldq <x5=%ymm4,<x4=%ymm6,>t0=%ymm10
vpunpckldq %ymm4,%ymm6,%ymm10

# qhasm: t1 = unpack high dwords of x4 and x5
# asm 1: vpunpckhdq <x5=reg256#5,<x4=reg256#7,>t1=reg256#5
# asm 2: vpunpckhdq <x5=%ymm4,<x4=%ymm6,>t1=%ymm4
vpunpckhdq %ymm4,%ymm6,%ymm4

# qhasm: x4[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#5,<t0=reg256#11,>x4=reg256#7
# asm 2: vperm2f128 $0x20,<t1=%ymm4,<t0=%ymm10,>x4=%ymm6
vperm2f128 $0x20,%ymm4,%ymm10,%ymm6

# qhasm: x5[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#5,<t0=reg256#11,>x5=reg256#5
# asm 2: vperm2f128 $0x31,<t1=%ymm4,<t0=%ymm10,>x5=%ymm4
vperm2f128 $0x31,%ymm4,%ymm10,%ymm4

# qhasm: t0 = unpack  low dwords of x6 and x7
# asm 1: vpunpckldq <x7=reg256#3,<x6=reg256#4,>t0=reg256#11
# asm 2: vpunpckldq <x7=%ymm2,<x6=%ymm3,>t0=%ymm10
vpunpckldq %ymm2,%ymm3,%ymm10

# qhasm: t1 = unpack high dwords of x6 and x7
# asm 1: vpunpckhdq <x7=reg256#3,<x6=reg256#4,>t1=reg256#3
# asm 2: vpunpckhdq <x7=%ymm2,<x6=%ymm3,>t1=%ymm2
vpunpckhdq %ymm2,%ymm3,%ymm2

# qhasm: x6[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#3,<t0=reg256#11,>x6=reg256#4
# asm 2: vperm2f128 $0x20,<t1=%ymm2,<t0=%ymm10,>x6=%ymm3
vperm2f128 $0x20,%ymm2,%ymm10,%ymm3

# qhasm: x7[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#3,<t0=reg256#11,>x7=reg256#3
# asm 2: vperm2f128 $0x31,<t1=%ymm2,<t0=%ymm10,>x7=%ymm2
vperm2f128 $0x31,%ymm2,%ymm10,%ymm2

# qhasm: (uint64) distance >>= 1
# asm 1: shr  $1,<distance=int64#3
# asm 2: shr  $1,<distance=%rdx
shr  $1,%rdx

# qhasm: mem256[input_0 +   0] = x0
# asm 1: vmovupd   <x0=reg256#10,0(<input_0=int64#1)
# asm 2: vmovupd   <x0=%ymm9,0(<input_0=%rdi)
vmovupd   %ymm9,0(%rdi)

# qhasm: offset = distance
# asm 1: mov  <distance=int64#3,>offset=int64#8
# asm 2: mov  <distance=%rdx,>offset=%r10
mov  %rdx,%r10

# qhasm: mem256[input_0 +   0 + offset] = x1
# asm 1: vmovupd   <x1=reg256#9,0(<input_0=int64#1,<offset=int64#8)
# asm 2: vmovupd   <x1=%ymm8,0(<input_0=%rdi,<offset=%r10)
vmovupd   %ymm8,0(%rdi,%r10)

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: mem256[input_0 +   0 + offset] = x2
# asm 1: vmovupd   <x2=reg256#8,0(<input_0=int64#1,<offset=int64#8)
# asm 2: vmovupd   <x2=%ymm7,0(<input_0=%rdi,<offset=%r10)
vmovupd   %ymm7,0(%rdi,%r10)

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: mem256[input_0 +   0 + offset] = x3
# asm 1: vmovupd   <x3=reg256#6,0(<input_0=int64#1,<offset=int64#8)
# asm 2: vmovupd   <x3=%ymm5,0(<input_0=%rdi,<offset=%r10)
vmovupd   %ymm5,0(%rdi,%r10)

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: mem256[input_0 +   0 + offset] = x4
# asm 1: vmovupd   <x4=reg256#7,0(<input_0=int64#1,<offset=int64#8)
# asm 2: vmovupd   <x4=%ymm6,0(<input_0=%rdi,<offset=%r10)
vmovupd   %ymm6,0(%rdi,%r10)

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: mem256[input_0 +   0 + offset] = x5
# asm 1: vmovupd   <x5=reg256#5,0(<input_0=int64#1,<offset=int64#8)
# asm 2: vmovupd   <x5=%ymm4,0(<input_0=%rdi,<offset=%r10)
vmovupd   %ymm4,0(%rdi,%r10)

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: mem256[input_0 +   0 + offset] = x6
# asm 1: vmovupd   <x6=reg256#4,0(<input_0=int64#1,<offset=int64#8)
# asm 2: vmovupd   <x6=%ymm3,0(<input_0=%rdi,<offset=%r10)
vmovupd   %ymm3,0(%rdi,%r10)

# qhasm: offset += distance
# asm 1: add  <distance=int64#3,<offset=int64#8
# asm 2: add  <distance=%rdx,<offset=%r10
add  %rdx,%r10

# qhasm: mem256[input_0 +   0 + offset] = x7
# asm 1: vmovupd   <x7=reg256#3,0(<input_0=int64#1,<offset=int64#8)
# asm 2: vmovupd   <x7=%ymm2,0(<input_0=%rdi,<offset=%r10)
vmovupd   %ymm2,0(%rdi,%r10)

# qhasm: new x8

# qhasm: new x9

# qhasm: new x10

# qhasm: new x11

# qhasm: new x12

# qhasm: new x13

# qhasm: new x14

# qhasm: new x15

# qhasm: distance <<= 1
# asm 1: shl  $1,<distance=int64#3
# asm 2: shl  $1,<distance=%rdx
shl  $1,%rdx

# qhasm: input_1 += 32
# asm 1: add  $32,<input_1=int64#2
# asm 2: add  $32,<input_1=%rsi
add  $32,%rsi

# qhasm: input_0 += 32
# asm 1: add  $32,<input_0=int64#1
# asm 2: add  $32,<input_0=%rdi
add  $32,%rdi

# qhasm: unsigned>? iterations -= 1
# asm 1: sub  $1,<iterations=int64#7
# asm 2: sub  $1,<iterations=%rax
sub  $1,%rax
# comment:fp stack unchanged by jump

# qhasm: goto looptop if unsigned>
ja ._looptop

# qhasm: return
add %r11,%rsp
ret
