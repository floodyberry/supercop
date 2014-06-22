
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

# qhasm: reg256 t0

# qhasm: reg256 t1

# qhasm: int64 offset

# qhasm: enter transpose8x
.p2align 5
.global _transpose8x
.global transpose8x
_transpose8x:
transpose8x:
mov %rsp,%r11
and $31,%r11
add $0,%r11
sub %r11,%rsp

# qhasm: x0  = mem256[input_1 +   0]
# asm 1: vmovupd   0(<input_1=int64#2),>x0=reg256#1
# asm 2: vmovupd   0(<input_1=%rsi),>x0=%ymm0
vmovupd   0(%rsi),%ymm0

# qhasm: offset = input_2
# asm 1: mov  <input_2=int64#3,>offset=int64#4
# asm 2: mov  <input_2=%rdx,>offset=%rcx
mov  %rdx,%rcx

# qhasm: x1  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#4),>x1=reg256#2
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%rcx),>x1=%ymm1
vmovupd   0(%rsi,%rcx),%ymm1

# qhasm: offset += input_2
# asm 1: add  <input_2=int64#3,<offset=int64#4
# asm 2: add  <input_2=%rdx,<offset=%rcx
add  %rdx,%rcx

# qhasm: x2  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#4),>x2=reg256#3
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%rcx),>x2=%ymm2
vmovupd   0(%rsi,%rcx),%ymm2

# qhasm: offset += input_2
# asm 1: add  <input_2=int64#3,<offset=int64#4
# asm 2: add  <input_2=%rdx,<offset=%rcx
add  %rdx,%rcx

# qhasm: x3  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#4),>x3=reg256#4
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%rcx),>x3=%ymm3
vmovupd   0(%rsi,%rcx),%ymm3

# qhasm: offset += input_2
# asm 1: add  <input_2=int64#3,<offset=int64#4
# asm 2: add  <input_2=%rdx,<offset=%rcx
add  %rdx,%rcx

# qhasm: x4  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#4),>x4=reg256#5
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%rcx),>x4=%ymm4
vmovupd   0(%rsi,%rcx),%ymm4

# qhasm: offset += input_2
# asm 1: add  <input_2=int64#3,<offset=int64#4
# asm 2: add  <input_2=%rdx,<offset=%rcx
add  %rdx,%rcx

# qhasm: x5  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#4),>x5=reg256#6
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%rcx),>x5=%ymm5
vmovupd   0(%rsi,%rcx),%ymm5

# qhasm: offset += input_2
# asm 1: add  <input_2=int64#3,<offset=int64#4
# asm 2: add  <input_2=%rdx,<offset=%rcx
add  %rdx,%rcx

# qhasm: x6  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#4),>x6=reg256#7
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%rcx),>x6=%ymm6
vmovupd   0(%rsi,%rcx),%ymm6

# qhasm: offset += input_2
# asm 1: add  <input_2=int64#3,<offset=int64#4
# asm 2: add  <input_2=%rdx,<offset=%rcx
add  %rdx,%rcx

# qhasm: x7  = mem256[input_1 +   0 + offset]
# asm 1: vmovupd   0(<input_1=int64#2,<offset=int64#4),>x7=reg256#8
# asm 2: vmovupd   0(<input_1=%rsi,<offset=%rcx),>x7=%ymm7
vmovupd   0(%rsi,%rcx),%ymm7

# qhasm: t0 = unpack  low dwords of x0 and x4 
# asm 1: vpunpckldq <x4=reg256#5,<x0=reg256#1,>t0=reg256#9
# asm 2: vpunpckldq <x4=%ymm4,<x0=%ymm0,>t0=%ymm8
vpunpckldq %ymm4,%ymm0,%ymm8

# qhasm: t1 = unpack high dwords of x0 and x4 
# asm 1: vpunpckhdq <x4=reg256#5,<x0=reg256#1,>t1=reg256#1
# asm 2: vpunpckhdq <x4=%ymm4,<x0=%ymm0,>t1=%ymm0
vpunpckhdq %ymm4,%ymm0,%ymm0

# qhasm: x0[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#1,<t0=reg256#9,>x0=reg256#5
# asm 2: vperm2f128 $0x20,<t1=%ymm0,<t0=%ymm8,>x0=%ymm4
vperm2f128 $0x20,%ymm0,%ymm8,%ymm4

# qhasm: x4[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#1,<t0=reg256#9,>x4=reg256#1
# asm 2: vperm2f128 $0x31,<t1=%ymm0,<t0=%ymm8,>x4=%ymm0
vperm2f128 $0x31,%ymm0,%ymm8,%ymm0

# qhasm: t0 = unpack  low dwords of x1 and x5
# asm 1: vpunpckldq <x5=reg256#6,<x1=reg256#2,>t0=reg256#9
# asm 2: vpunpckldq <x5=%ymm5,<x1=%ymm1,>t0=%ymm8
vpunpckldq %ymm5,%ymm1,%ymm8

# qhasm: t1 = unpack high dwords of x1 and x5
# asm 1: vpunpckhdq <x5=reg256#6,<x1=reg256#2,>t1=reg256#2
# asm 2: vpunpckhdq <x5=%ymm5,<x1=%ymm1,>t1=%ymm1
vpunpckhdq %ymm5,%ymm1,%ymm1

# qhasm: x1[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#2,<t0=reg256#9,>x1=reg256#6
# asm 2: vperm2f128 $0x20,<t1=%ymm1,<t0=%ymm8,>x1=%ymm5
vperm2f128 $0x20,%ymm1,%ymm8,%ymm5

# qhasm: x5[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#2,<t0=reg256#9,>x5=reg256#2
# asm 2: vperm2f128 $0x31,<t1=%ymm1,<t0=%ymm8,>x5=%ymm1
vperm2f128 $0x31,%ymm1,%ymm8,%ymm1

# qhasm: t0 = unpack  low dwords of x2 and x6
# asm 1: vpunpckldq <x6=reg256#7,<x2=reg256#3,>t0=reg256#9
# asm 2: vpunpckldq <x6=%ymm6,<x2=%ymm2,>t0=%ymm8
vpunpckldq %ymm6,%ymm2,%ymm8

# qhasm: t1 = unpack high dwords of x2 and x6
# asm 1: vpunpckhdq <x6=reg256#7,<x2=reg256#3,>t1=reg256#3
# asm 2: vpunpckhdq <x6=%ymm6,<x2=%ymm2,>t1=%ymm2
vpunpckhdq %ymm6,%ymm2,%ymm2

# qhasm: x2[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#3,<t0=reg256#9,>x2=reg256#7
# asm 2: vperm2f128 $0x20,<t1=%ymm2,<t0=%ymm8,>x2=%ymm6
vperm2f128 $0x20,%ymm2,%ymm8,%ymm6

# qhasm: x6[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#3,<t0=reg256#9,>x6=reg256#3
# asm 2: vperm2f128 $0x31,<t1=%ymm2,<t0=%ymm8,>x6=%ymm2
vperm2f128 $0x31,%ymm2,%ymm8,%ymm2

# qhasm: t0 = unpack  low dwords of x3 and x7
# asm 1: vpunpckldq <x7=reg256#8,<x3=reg256#4,>t0=reg256#9
# asm 2: vpunpckldq <x7=%ymm7,<x3=%ymm3,>t0=%ymm8
vpunpckldq %ymm7,%ymm3,%ymm8

# qhasm: t1 = unpack high dwords of x3 and x7
# asm 1: vpunpckhdq <x7=reg256#8,<x3=reg256#4,>t1=reg256#4
# asm 2: vpunpckhdq <x7=%ymm7,<x3=%ymm3,>t1=%ymm3
vpunpckhdq %ymm7,%ymm3,%ymm3

# qhasm: x3[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#4,<t0=reg256#9,>x3=reg256#8
# asm 2: vperm2f128 $0x20,<t1=%ymm3,<t0=%ymm8,>x3=%ymm7
vperm2f128 $0x20,%ymm3,%ymm8,%ymm7

# qhasm: x7[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#4,<t0=reg256#9,>x7=reg256#4
# asm 2: vperm2f128 $0x31,<t1=%ymm3,<t0=%ymm8,>x7=%ymm3
vperm2f128 $0x31,%ymm3,%ymm8,%ymm3

# qhasm: t0 = unpack  low dwords of x0 and x2
# asm 1: vpunpckldq <x2=reg256#7,<x0=reg256#5,>t0=reg256#9
# asm 2: vpunpckldq <x2=%ymm6,<x0=%ymm4,>t0=%ymm8
vpunpckldq %ymm6,%ymm4,%ymm8

# qhasm: t1 = unpack high dwords of x0 and x2
# asm 1: vpunpckhdq <x2=reg256#7,<x0=reg256#5,>t1=reg256#5
# asm 2: vpunpckhdq <x2=%ymm6,<x0=%ymm4,>t1=%ymm4
vpunpckhdq %ymm6,%ymm4,%ymm4

# qhasm: x0[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#5,<t0=reg256#9,>x0=reg256#7
# asm 2: vperm2f128 $0x20,<t1=%ymm4,<t0=%ymm8,>x0=%ymm6
vperm2f128 $0x20,%ymm4,%ymm8,%ymm6

# qhasm: x2[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#5,<t0=reg256#9,>x2=reg256#5
# asm 2: vperm2f128 $0x31,<t1=%ymm4,<t0=%ymm8,>x2=%ymm4
vperm2f128 $0x31,%ymm4,%ymm8,%ymm4

# qhasm: t0 = unpack  low dwords of x1 and x3
# asm 1: vpunpckldq <x3=reg256#8,<x1=reg256#6,>t0=reg256#9
# asm 2: vpunpckldq <x3=%ymm7,<x1=%ymm5,>t0=%ymm8
vpunpckldq %ymm7,%ymm5,%ymm8

# qhasm: t1 = unpack high dwords of x1 and x3
# asm 1: vpunpckhdq <x3=reg256#8,<x1=reg256#6,>t1=reg256#6
# asm 2: vpunpckhdq <x3=%ymm7,<x1=%ymm5,>t1=%ymm5
vpunpckhdq %ymm7,%ymm5,%ymm5

# qhasm: x1[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#6,<t0=reg256#9,>x1=reg256#8
# asm 2: vperm2f128 $0x20,<t1=%ymm5,<t0=%ymm8,>x1=%ymm7
vperm2f128 $0x20,%ymm5,%ymm8,%ymm7

# qhasm: x3[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#6,<t0=reg256#9,>x3=reg256#6
# asm 2: vperm2f128 $0x31,<t1=%ymm5,<t0=%ymm8,>x3=%ymm5
vperm2f128 $0x31,%ymm5,%ymm8,%ymm5

# qhasm: t0 = unpack  low dwords of x4 and x6
# asm 1: vpunpckldq <x6=reg256#3,<x4=reg256#1,>t0=reg256#9
# asm 2: vpunpckldq <x6=%ymm2,<x4=%ymm0,>t0=%ymm8
vpunpckldq %ymm2,%ymm0,%ymm8

# qhasm: t1 = unpack high dwords of x4 and x6
# asm 1: vpunpckhdq <x6=reg256#3,<x4=reg256#1,>t1=reg256#1
# asm 2: vpunpckhdq <x6=%ymm2,<x4=%ymm0,>t1=%ymm0
vpunpckhdq %ymm2,%ymm0,%ymm0

# qhasm: x4[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#1,<t0=reg256#9,>x4=reg256#3
# asm 2: vperm2f128 $0x20,<t1=%ymm0,<t0=%ymm8,>x4=%ymm2
vperm2f128 $0x20,%ymm0,%ymm8,%ymm2

# qhasm: x6[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#1,<t0=reg256#9,>x6=reg256#1
# asm 2: vperm2f128 $0x31,<t1=%ymm0,<t0=%ymm8,>x6=%ymm0
vperm2f128 $0x31,%ymm0,%ymm8,%ymm0

# qhasm: t0 = unpack  low dwords of x5 and x7
# asm 1: vpunpckldq <x7=reg256#4,<x5=reg256#2,>t0=reg256#9
# asm 2: vpunpckldq <x7=%ymm3,<x5=%ymm1,>t0=%ymm8
vpunpckldq %ymm3,%ymm1,%ymm8

# qhasm: t1 = unpack high dwords of x5 and x7
# asm 1: vpunpckhdq <x7=reg256#4,<x5=reg256#2,>t1=reg256#2
# asm 2: vpunpckhdq <x7=%ymm3,<x5=%ymm1,>t1=%ymm1
vpunpckhdq %ymm3,%ymm1,%ymm1

# qhasm: x5[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#2,<t0=reg256#9,>x5=reg256#4
# asm 2: vperm2f128 $0x20,<t1=%ymm1,<t0=%ymm8,>x5=%ymm3
vperm2f128 $0x20,%ymm1,%ymm8,%ymm3

# qhasm: x7[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#2,<t0=reg256#9,>x7=reg256#2
# asm 2: vperm2f128 $0x31,<t1=%ymm1,<t0=%ymm8,>x7=%ymm1
vperm2f128 $0x31,%ymm1,%ymm8,%ymm1

# qhasm: t0 = unpack  low dwords of x0 and x1
# asm 1: vpunpckldq <x1=reg256#8,<x0=reg256#7,>t0=reg256#9
# asm 2: vpunpckldq <x1=%ymm7,<x0=%ymm6,>t0=%ymm8
vpunpckldq %ymm7,%ymm6,%ymm8

# qhasm: t1 = unpack high dwords of x0 and x1
# asm 1: vpunpckhdq <x1=reg256#8,<x0=reg256#7,>t1=reg256#7
# asm 2: vpunpckhdq <x1=%ymm7,<x0=%ymm6,>t1=%ymm6
vpunpckhdq %ymm7,%ymm6,%ymm6

# qhasm: x0[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#7,<t0=reg256#9,>x0=reg256#8
# asm 2: vperm2f128 $0x20,<t1=%ymm6,<t0=%ymm8,>x0=%ymm7
vperm2f128 $0x20,%ymm6,%ymm8,%ymm7

# qhasm: x1[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#7,<t0=reg256#9,>x1=reg256#7
# asm 2: vperm2f128 $0x31,<t1=%ymm6,<t0=%ymm8,>x1=%ymm6
vperm2f128 $0x31,%ymm6,%ymm8,%ymm6

# qhasm: t0 = unpack  low dwords of x2 and x3
# asm 1: vpunpckldq <x3=reg256#6,<x2=reg256#5,>t0=reg256#9
# asm 2: vpunpckldq <x3=%ymm5,<x2=%ymm4,>t0=%ymm8
vpunpckldq %ymm5,%ymm4,%ymm8

# qhasm: t1 = unpack high dwords of x2 and x3
# asm 1: vpunpckhdq <x3=reg256#6,<x2=reg256#5,>t1=reg256#5
# asm 2: vpunpckhdq <x3=%ymm5,<x2=%ymm4,>t1=%ymm4
vpunpckhdq %ymm5,%ymm4,%ymm4

# qhasm: x2[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#5,<t0=reg256#9,>x2=reg256#6
# asm 2: vperm2f128 $0x20,<t1=%ymm4,<t0=%ymm8,>x2=%ymm5
vperm2f128 $0x20,%ymm4,%ymm8,%ymm5

# qhasm: x3[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#5,<t0=reg256#9,>x3=reg256#5
# asm 2: vperm2f128 $0x31,<t1=%ymm4,<t0=%ymm8,>x3=%ymm4
vperm2f128 $0x31,%ymm4,%ymm8,%ymm4

# qhasm: t0 = unpack  low dwords of x4 and x5
# asm 1: vpunpckldq <x5=reg256#4,<x4=reg256#3,>t0=reg256#9
# asm 2: vpunpckldq <x5=%ymm3,<x4=%ymm2,>t0=%ymm8
vpunpckldq %ymm3,%ymm2,%ymm8

# qhasm: t1 = unpack high dwords of x4 and x5
# asm 1: vpunpckhdq <x5=reg256#4,<x4=reg256#3,>t1=reg256#3
# asm 2: vpunpckhdq <x5=%ymm3,<x4=%ymm2,>t1=%ymm2
vpunpckhdq %ymm3,%ymm2,%ymm2

# qhasm: x4[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#3,<t0=reg256#9,>x4=reg256#4
# asm 2: vperm2f128 $0x20,<t1=%ymm2,<t0=%ymm8,>x4=%ymm3
vperm2f128 $0x20,%ymm2,%ymm8,%ymm3

# qhasm: x5[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#3,<t0=reg256#9,>x5=reg256#3
# asm 2: vperm2f128 $0x31,<t1=%ymm2,<t0=%ymm8,>x5=%ymm2
vperm2f128 $0x31,%ymm2,%ymm8,%ymm2

# qhasm: t0 = unpack  low dwords of x6 and x7
# asm 1: vpunpckldq <x7=reg256#2,<x6=reg256#1,>t0=reg256#9
# asm 2: vpunpckldq <x7=%ymm1,<x6=%ymm0,>t0=%ymm8
vpunpckldq %ymm1,%ymm0,%ymm8

# qhasm: t1 = unpack high dwords of x6 and x7
# asm 1: vpunpckhdq <x7=reg256#2,<x6=reg256#1,>t1=reg256#1
# asm 2: vpunpckhdq <x7=%ymm1,<x6=%ymm0,>t1=%ymm0
vpunpckhdq %ymm1,%ymm0,%ymm0

# qhasm: x6[0,1,2,3] = t0[0,1],t1[0,1]
# asm 1: vperm2f128 $0x20,<t1=reg256#1,<t0=reg256#9,>x6=reg256#2
# asm 2: vperm2f128 $0x20,<t1=%ymm0,<t0=%ymm8,>x6=%ymm1
vperm2f128 $0x20,%ymm0,%ymm8,%ymm1

# qhasm: x7[0,1,2,3] = t0[2,3],t1[2,3]
# asm 1: vperm2f128 $0x31,<t1=reg256#1,<t0=reg256#9,>x7=reg256#1
# asm 2: vperm2f128 $0x31,<t1=%ymm0,<t0=%ymm8,>x7=%ymm0
vperm2f128 $0x31,%ymm0,%ymm8,%ymm0

# qhasm: mem256[input_0 +   0] = x0
# asm 1: vmovupd   <x0=reg256#8,0(<input_0=int64#1)
# asm 2: vmovupd   <x0=%ymm7,0(<input_0=%rdi)
vmovupd   %ymm7,0(%rdi)

# qhasm: offset = input_2
# asm 1: mov  <input_2=int64#3,>offset=int64#2
# asm 2: mov  <input_2=%rdx,>offset=%rsi
mov  %rdx,%rsi

# qhasm: mem256[input_0 +   0 + offset] = x1
# asm 1: vmovupd   <x1=reg256#7,0(<input_0=int64#1,<offset=int64#2)
# asm 2: vmovupd   <x1=%ymm6,0(<input_0=%rdi,<offset=%rsi)
vmovupd   %ymm6,0(%rdi,%rsi)

# qhasm: offset += input_2
# asm 1: add  <input_2=int64#3,<offset=int64#2
# asm 2: add  <input_2=%rdx,<offset=%rsi
add  %rdx,%rsi

# qhasm: mem256[input_0 +   0 + offset] = x2
# asm 1: vmovupd   <x2=reg256#6,0(<input_0=int64#1,<offset=int64#2)
# asm 2: vmovupd   <x2=%ymm5,0(<input_0=%rdi,<offset=%rsi)
vmovupd   %ymm5,0(%rdi,%rsi)

# qhasm: offset += input_2
# asm 1: add  <input_2=int64#3,<offset=int64#2
# asm 2: add  <input_2=%rdx,<offset=%rsi
add  %rdx,%rsi

# qhasm: mem256[input_0 +   0 + offset] = x3
# asm 1: vmovupd   <x3=reg256#5,0(<input_0=int64#1,<offset=int64#2)
# asm 2: vmovupd   <x3=%ymm4,0(<input_0=%rdi,<offset=%rsi)
vmovupd   %ymm4,0(%rdi,%rsi)

# qhasm: offset += input_2
# asm 1: add  <input_2=int64#3,<offset=int64#2
# asm 2: add  <input_2=%rdx,<offset=%rsi
add  %rdx,%rsi

# qhasm: mem256[input_0 +   0 + offset] = x4
# asm 1: vmovupd   <x4=reg256#4,0(<input_0=int64#1,<offset=int64#2)
# asm 2: vmovupd   <x4=%ymm3,0(<input_0=%rdi,<offset=%rsi)
vmovupd   %ymm3,0(%rdi,%rsi)

# qhasm: offset += input_2
# asm 1: add  <input_2=int64#3,<offset=int64#2
# asm 2: add  <input_2=%rdx,<offset=%rsi
add  %rdx,%rsi

# qhasm: mem256[input_0 +   0 + offset] = x5
# asm 1: vmovupd   <x5=reg256#3,0(<input_0=int64#1,<offset=int64#2)
# asm 2: vmovupd   <x5=%ymm2,0(<input_0=%rdi,<offset=%rsi)
vmovupd   %ymm2,0(%rdi,%rsi)

# qhasm: offset += input_2
# asm 1: add  <input_2=int64#3,<offset=int64#2
# asm 2: add  <input_2=%rdx,<offset=%rsi
add  %rdx,%rsi

# qhasm: mem256[input_0 +   0 + offset] = x6
# asm 1: vmovupd   <x6=reg256#2,0(<input_0=int64#1,<offset=int64#2)
# asm 2: vmovupd   <x6=%ymm1,0(<input_0=%rdi,<offset=%rsi)
vmovupd   %ymm1,0(%rdi,%rsi)

# qhasm: offset += input_2
# asm 1: add  <input_2=int64#3,<offset=int64#2
# asm 2: add  <input_2=%rdx,<offset=%rsi
add  %rdx,%rsi

# qhasm: mem256[input_0 +   0 + offset] = x7
# asm 1: vmovupd   <x7=reg256#1,0(<input_0=int64#1,<offset=int64#2)
# asm 2: vmovupd   <x7=%ymm0,0(<input_0=%rdi,<offset=%rsi)
vmovupd   %ymm0,0(%rdi,%rsi)

# qhasm: return
add %r11,%rsp
ret
