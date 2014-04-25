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

# qhasm: reg256 freeze_c

# qhasm: reg256 freeze_r0

# qhasm: reg256 freeze_r1

# qhasm: reg256 freeze_r2

# qhasm: reg256 freeze_r3

# qhasm: reg256 freeze_r4

# qhasm: reg256 freeze_r5

# qhasm: enter gfe4x3limb_freeze
.p2align 5
.global _gfe4x3limb_freeze
.global gfe4x3limb_freeze
_gfe4x3limb_freeze:
gfe4x3limb_freeze:
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
add $0,%r11
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
sub %r11,%rsp

# qhasm:   freeze_r0 aligned= mem256[input_1 +   0]
# asm 1: vmovapd   0(<input_1=int64#2),>freeze_r0=reg256#1
# asm 2: vmovapd   0(<input_1=%rsi),>freeze_r0=%ymm0
# bytes: 4 uops: 1
vmovapd   0(%rsi),%ymm0

# qhasm:   freeze_r2 aligned= mem256[input_1 +  64]
# asm 1: vmovapd   64(<input_1=int64#2),>freeze_r2=reg256#2
# asm 2: vmovapd   64(<input_1=%rsi),>freeze_r2=%ymm1
# bytes: 5 uops: 1
vmovapd   64(%rsi),%ymm1
# block pos: 32 64 uops: 4

# qhasm:   freeze_r4 aligned= mem256[input_1 + 128]
# asm 1: vmovapd   128(<input_1=int64#2),>freeze_r4=reg256#3
# asm 2: vmovapd   128(<input_1=%rsi),>freeze_r4=%ymm2
# bytes: 8 uops: 1
vmovapd   128(%rsi),%ymm2

# qhasm:   4x freeze_c = approx freeze_r0 * mem256[_2pm43]
# asm 1: vmulpd _2pm43,<freeze_r0=reg256#1,>freeze_c=reg256#4
# asm 2: vmulpd _2pm43,<freeze_r0=%ymm0,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2pm43,%ymm0,%ymm3

# qhasm:   4x freeze_c = round(freeze_c)
# asm 1: vroundpd $8,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vroundpd $8,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 6 uops: 1
vroundpd $8,%ymm3,%ymm3

# qhasm:   4x freeze_c approx*= mem256[_2p43]
# asm 1: vmulpd _2p43,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vmulpd _2p43,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2p43,%ymm3,%ymm3
# block pos: 64 96 uops: 5

# qhasm:   4x freeze_r2 approx+= freeze_c
# asm 1: vaddpd <freeze_c=reg256#4,<freeze_r2=reg256#2,>freeze_r2=reg256#2
# asm 2: vaddpd <freeze_c=%ymm3,<freeze_r2=%ymm1,>freeze_r2=%ymm1
# bytes: 4 uops: 1
vaddpd %ymm3,%ymm1,%ymm1

# qhasm:   4x freeze_r0 approx-= freeze_c
# asm 1: vsubpd <freeze_c=reg256#4,<freeze_r0=reg256#1,>freeze_r0=reg256#1
# asm 2: vsubpd <freeze_c=%ymm3,<freeze_r0=%ymm0,>freeze_r0=%ymm0
# bytes: 4 uops: 1
vsubpd %ymm3,%ymm0,%ymm0

# qhasm:   4x freeze_c = approx freeze_r2 * mem256[_2pm85]
# asm 1: vmulpd _2pm85,<freeze_r2=reg256#2,>freeze_c=reg256#4
# asm 2: vmulpd _2pm85,<freeze_r2=%ymm1,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2pm85,%ymm1,%ymm3

# qhasm:   4x freeze_c = round(freeze_c)
# asm 1: vroundpd $8,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vroundpd $8,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 6 uops: 1
vroundpd $8,%ymm3,%ymm3

# qhasm:   4x freeze_c approx*= mem256[_2p85]
# asm 1: vmulpd _2p85,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vmulpd _2p85,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2p85,%ymm3,%ymm3
# block pos: 96 132 uops: 6

# qhasm:   4x freeze_r4 approx+= freeze_c
# asm 1: vaddpd <freeze_c=reg256#4,<freeze_r4=reg256#3,>freeze_r4=reg256#3
# asm 2: vaddpd <freeze_c=%ymm3,<freeze_r4=%ymm2,>freeze_r4=%ymm2
# bytes: 4 uops: 1
vaddpd %ymm3,%ymm2,%ymm2

# qhasm:   4x freeze_r2 approx-= freeze_c
# asm 1: vsubpd <freeze_c=reg256#4,<freeze_r2=reg256#2,>freeze_r2=reg256#2
# asm 2: vsubpd <freeze_c=%ymm3,<freeze_r2=%ymm1,>freeze_r2=%ymm1
# bytes: 4 uops: 1
vsubpd %ymm3,%ymm1,%ymm1

# qhasm:   4x freeze_c = approx freeze_r4 * mem256[_2pm127]
# asm 1: vmulpd _2pm127,<freeze_r4=reg256#3,>freeze_c=reg256#4
# asm 2: vmulpd _2pm127,<freeze_r4=%ymm2,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2pm127,%ymm2,%ymm3

# qhasm:   4x freeze_c = round(freeze_c)
# asm 1: vroundpd $8,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vroundpd $8,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 6 uops: 1
vroundpd $8,%ymm3,%ymm3

# qhasm:   4x freeze_r0 approx+= freeze_c
# asm 1: vaddpd <freeze_c=reg256#4,<freeze_r0=reg256#1,>freeze_r0=reg256#1
# asm 2: vaddpd <freeze_c=%ymm3,<freeze_r0=%ymm0,>freeze_r0=%ymm0
# bytes: 4 uops: 1
vaddpd %ymm3,%ymm0,%ymm0

# qhasm:   4x freeze_c approx*= mem256[_2p127]
# asm 1: vmulpd _2p127,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vmulpd _2p127,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2p127,%ymm3,%ymm3
# block pos: 132 160 uops: 4

# qhasm:   4x freeze_r4 approx-= freeze_c
# asm 1: vsubpd <freeze_c=reg256#4,<freeze_r4=reg256#3,>freeze_r4=reg256#3
# asm 2: vsubpd <freeze_c=%ymm3,<freeze_r4=%ymm2,>freeze_r4=%ymm2
# bytes: 4 uops: 1
vsubpd %ymm3,%ymm2,%ymm2

# qhasm:   4x freeze_r0 approx+= mem256[_2p44m2]
# asm 1: vaddpd _2p44m2,<freeze_r0=reg256#1,>freeze_r0=reg256#1
# asm 2: vaddpd _2p44m2,<freeze_r0=%ymm0,>freeze_r0=%ymm0
# bytes: 9 uops: 1
vaddpd _2p44m2,%ymm0,%ymm0

# qhasm:   4x freeze_c = approx freeze_r0 * mem256[_2pm43]
# asm 1: vmulpd _2pm43,<freeze_r0=reg256#1,>freeze_c=reg256#4
# asm 2: vmulpd _2pm43,<freeze_r0=%ymm0,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2pm43,%ymm0,%ymm3

# qhasm:   4x freeze_c = trunc(freeze_c)
# asm 1: vroundpd $11,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vroundpd $11,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 6 uops: 1
vroundpd $11,%ymm3,%ymm3
# block pos: 160 195 uops: 5

# qhasm:   4x freeze_c approx*= mem256[_2p43]
# asm 1: vmulpd _2p43,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vmulpd _2p43,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2p43,%ymm3,%ymm3

# qhasm:   4x freeze_r2 approx+= freeze_c
# asm 1: vaddpd <freeze_c=reg256#4,<freeze_r2=reg256#2,>freeze_r2=reg256#2
# asm 2: vaddpd <freeze_c=%ymm3,<freeze_r2=%ymm1,>freeze_r2=%ymm1
# bytes: 4 uops: 1
vaddpd %ymm3,%ymm1,%ymm1

# qhasm:   4x freeze_r0 approx-= freeze_c
# asm 1: vsubpd <freeze_c=reg256#4,<freeze_r0=reg256#1,>freeze_r0=reg256#1
# asm 2: vsubpd <freeze_c=%ymm3,<freeze_r0=%ymm0,>freeze_r0=%ymm0
# bytes: 4 uops: 1
vsubpd %ymm3,%ymm0,%ymm0

# qhasm:   4x freeze_r2 approx+= mem256[_2p86m2p44]
# asm 1: vaddpd _2p86m2p44,<freeze_r2=reg256#2,>freeze_r2=reg256#2
# asm 2: vaddpd _2p86m2p44,<freeze_r2=%ymm1,>freeze_r2=%ymm1
# bytes: 9 uops: 1
vaddpd _2p86m2p44,%ymm1,%ymm1

# qhasm:   4x freeze_c = approx freeze_r2 * mem256[_2pm85]
# asm 1: vmulpd _2pm85,<freeze_r2=reg256#2,>freeze_c=reg256#4
# asm 2: vmulpd _2pm85,<freeze_r2=%ymm1,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2pm85,%ymm1,%ymm3
# block pos: 195 227 uops: 5

# qhasm:   4x freeze_c = trunc(freeze_c)
# asm 1: vroundpd $11,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vroundpd $11,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 6 uops: 1
vroundpd $11,%ymm3,%ymm3

# qhasm:   4x freeze_c approx*= mem256[_2p85]
# asm 1: vmulpd _2p85,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vmulpd _2p85,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2p85,%ymm3,%ymm3

# qhasm:   4x freeze_r4 approx+= freeze_c
# asm 1: vaddpd <freeze_c=reg256#4,<freeze_r4=reg256#3,>freeze_r4=reg256#3
# asm 2: vaddpd <freeze_c=%ymm3,<freeze_r4=%ymm2,>freeze_r4=%ymm2
# bytes: 4 uops: 1
vaddpd %ymm3,%ymm2,%ymm2

# qhasm:   4x freeze_r2 approx-= freeze_c
# asm 1: vsubpd <freeze_c=reg256#4,<freeze_r2=reg256#2,>freeze_r2=reg256#2
# asm 2: vsubpd <freeze_c=%ymm3,<freeze_r2=%ymm1,>freeze_r2=%ymm1
# bytes: 4 uops: 1
vsubpd %ymm3,%ymm1,%ymm1

# qhasm:   4x freeze_r4 approx+= mem256[_2p128m2p86]
# asm 1: vaddpd _2p128m2p86,<freeze_r4=reg256#3,>freeze_r4=reg256#3
# asm 2: vaddpd _2p128m2p86,<freeze_r4=%ymm2,>freeze_r4=%ymm2
# bytes: 9 uops: 1
vaddpd _2p128m2p86,%ymm2,%ymm2
# block pos: 227 259 uops: 5

# qhasm:   4x freeze_c = approx freeze_r4 * mem256[_2pm127]
# asm 1: vmulpd _2pm127,<freeze_r4=reg256#3,>freeze_c=reg256#4
# asm 2: vmulpd _2pm127,<freeze_r4=%ymm2,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2pm127,%ymm2,%ymm3

# qhasm:   4x freeze_c = trunc(freeze_c)
# asm 1: vroundpd $11,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vroundpd $11,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 6 uops: 1
vroundpd $11,%ymm3,%ymm3

# qhasm:   4x freeze_r0 approx+= freeze_c
# asm 1: vaddpd <freeze_c=reg256#4,<freeze_r0=reg256#1,>freeze_r0=reg256#1
# asm 2: vaddpd <freeze_c=%ymm3,<freeze_r0=%ymm0,>freeze_r0=%ymm0
# bytes: 4 uops: 1
vaddpd %ymm3,%ymm0,%ymm0

# qhasm:   4x freeze_c approx*= mem256[_2p127]
# asm 1: vmulpd _2p127,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vmulpd _2p127,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2p127,%ymm3,%ymm3

# qhasm:   4x freeze_r4 approx-= freeze_c
# asm 1: vsubpd <freeze_c=reg256#4,<freeze_r4=reg256#3,>freeze_r4=reg256#3
# asm 2: vsubpd <freeze_c=%ymm3,<freeze_r4=%ymm2,>freeze_r4=%ymm2
# bytes: 4 uops: 1
vsubpd %ymm3,%ymm2,%ymm2
# block pos: 259 291 uops: 5

# qhasm:   4x freeze_c = approx freeze_r0 * mem256[_2pm43]
# asm 1: vmulpd _2pm43,<freeze_r0=reg256#1,>freeze_c=reg256#4
# asm 2: vmulpd _2pm43,<freeze_r0=%ymm0,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2pm43,%ymm0,%ymm3

# qhasm:   4x freeze_c = trunc(freeze_c)
# asm 1: vroundpd $11,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vroundpd $11,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 6 uops: 1
vroundpd $11,%ymm3,%ymm3

# qhasm:   4x freeze_c approx*= mem256[_2p43]
# asm 1: vmulpd _2p43,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vmulpd _2p43,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2p43,%ymm3,%ymm3

# qhasm:   4x freeze_r2 approx+= freeze_c
# asm 1: vaddpd <freeze_c=reg256#4,<freeze_r2=reg256#2,>freeze_r2=reg256#2
# asm 2: vaddpd <freeze_c=%ymm3,<freeze_r2=%ymm1,>freeze_r2=%ymm1
# bytes: 4 uops: 1
vaddpd %ymm3,%ymm1,%ymm1

# qhasm:   4x freeze_r0 approx-= freeze_c
# asm 1: vsubpd <freeze_c=reg256#4,<freeze_r0=reg256#1,>freeze_r0=reg256#1
# asm 2: vsubpd <freeze_c=%ymm3,<freeze_r0=%ymm0,>freeze_r0=%ymm0
# bytes: 4 uops: 1
vsubpd %ymm3,%ymm0,%ymm0
# block pos: 291 323 uops: 5

# qhasm:   4x freeze_c = approx freeze_r2 * mem256[_2pm85]
# asm 1: vmulpd _2pm85,<freeze_r2=reg256#2,>freeze_c=reg256#4
# asm 2: vmulpd _2pm85,<freeze_r2=%ymm1,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2pm85,%ymm1,%ymm3

# qhasm:   4x freeze_c = trunc(freeze_c)
# asm 1: vroundpd $11,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vroundpd $11,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 6 uops: 1
vroundpd $11,%ymm3,%ymm3

# qhasm:   4x freeze_c approx*= mem256[_2p85]
# asm 1: vmulpd _2p85,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vmulpd _2p85,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2p85,%ymm3,%ymm3

# qhasm:   4x freeze_r4 approx+= freeze_c
# asm 1: vaddpd <freeze_c=reg256#4,<freeze_r4=reg256#3,>freeze_r4=reg256#3
# asm 2: vaddpd <freeze_c=%ymm3,<freeze_r4=%ymm2,>freeze_r4=%ymm2
# bytes: 4 uops: 1
vaddpd %ymm3,%ymm2,%ymm2

# qhasm:   4x freeze_r2 approx-= freeze_c
# asm 1: vsubpd <freeze_c=reg256#4,<freeze_r2=reg256#2,>freeze_r2=reg256#2
# asm 2: vsubpd <freeze_c=%ymm3,<freeze_r2=%ymm1,>freeze_r2=%ymm1
# bytes: 4 uops: 1
vsubpd %ymm3,%ymm1,%ymm1
# block pos: 323 355 uops: 5

# qhasm:   4x freeze_c = approx freeze_r4 * mem256[_2pm127]
# asm 1: vmulpd _2pm127,<freeze_r4=reg256#3,>freeze_c=reg256#4
# asm 2: vmulpd _2pm127,<freeze_r4=%ymm2,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2pm127,%ymm2,%ymm3

# qhasm:   4x freeze_c = trunc(freeze_c)
# asm 1: vroundpd $11,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vroundpd $11,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 6 uops: 1
vroundpd $11,%ymm3,%ymm3

# qhasm:   4x freeze_r0 approx+= freeze_c
# asm 1: vaddpd <freeze_c=reg256#4,<freeze_r0=reg256#1,>freeze_r0=reg256#1
# asm 2: vaddpd <freeze_c=%ymm3,<freeze_r0=%ymm0,>freeze_r0=%ymm0
# bytes: 4 uops: 1
vaddpd %ymm3,%ymm0,%ymm0

# qhasm:   4x freeze_c approx*= mem256[_2p127]
# asm 1: vmulpd _2p127,<freeze_c=reg256#4,>freeze_c=reg256#4
# asm 2: vmulpd _2p127,<freeze_c=%ymm3,>freeze_c=%ymm3
# bytes: 9 uops: 1
vmulpd _2p127,%ymm3,%ymm3

# qhasm:   4x freeze_r4 approx-= freeze_c
# asm 1: vsubpd <freeze_c=reg256#4,<freeze_r4=reg256#3,>freeze_r4=reg256#3
# asm 2: vsubpd <freeze_c=%ymm3,<freeze_r4=%ymm2,>freeze_r4=%ymm2
# bytes: 4 uops: 1
vsubpd %ymm3,%ymm2,%ymm2
# block pos: 355 390 uops: 5

# qhasm:   4x freeze_r2 approx*= mem256[_2pm43]
# asm 1: vmulpd _2pm43,<freeze_r2=reg256#2,>freeze_r2=reg256#2
# asm 2: vmulpd _2pm43,<freeze_r2=%ymm1,>freeze_r2=%ymm1
# bytes: 9 uops: 1
vmulpd _2pm43,%ymm1,%ymm1

# qhasm:   4x freeze_r4 approx*= mem256[_2pm85]
# asm 1: vmulpd _2pm85,<freeze_r4=reg256#3,>freeze_r4=reg256#3
# asm 2: vmulpd _2pm85,<freeze_r4=%ymm2,>freeze_r4=%ymm2
# bytes: 9 uops: 1
vmulpd _2pm85,%ymm2,%ymm2

# qhasm:   mem256[input_0 +   0] aligned= freeze_r0
# asm 1: vmovapd   <freeze_r0=reg256#1,0(<input_0=int64#1)
# asm 2: vmovapd   <freeze_r0=%ymm0,0(<input_0=%rdi)
# bytes: 4 uops: 1
vmovapd   %ymm0,0(%rdi)

# qhasm:   mem256[input_0 +  64] aligned= freeze_r2
# asm 1: vmovapd   <freeze_r2=reg256#2,64(<input_0=int64#1)
# asm 2: vmovapd   <freeze_r2=%ymm1,64(<input_0=%rdi)
# bytes: 5 uops: 1
vmovapd   %ymm1,64(%rdi)

# qhasm:   mem256[input_0 + 128] aligned= freeze_r4
# asm 1: vmovapd   <freeze_r4=reg256#3,128(<input_0=int64#1)
# asm 2: vmovapd   <freeze_r4=%ymm2,128(<input_0=%rdi)
# bytes: 8 uops: 1
vmovapd   %ymm2,128(%rdi)
# block pos: 390 394 uops: 2

# qhasm: return
# bytes: 3 uops: 1
add %r11,%rsp
# bytes: 1 uops: 1
ret
