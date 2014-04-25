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

# qhasm: reg256 r0

# qhasm: reg256 r1

# qhasm: reg256 r2

# qhasm: reg256 r3

# qhasm: reg256 r4

# qhasm: reg256 r5

# qhasm: reg256 s

# qhasm: enter gfe4x_znegate
.p2align 5
.global _gfe4x_znegate
.global gfe4x_znegate
_gfe4x_znegate:
gfe4x_znegate:
# bytes: 5 uops: 1
.byte 0x3e
.byte 0x3e
mov %rsp,%r11
# bytes: 5 uops: 1
.byte 0x3e
and $31,%r11
# bytes: 5 uops: 1
.byte 0x3e
add $0,%r11
# bytes: 4 uops: 1
.byte 0x3e
sub %r11,%rsp

# qhasm: s aligned= mem256[minusz]
# asm 1: vmovapd minusz,>s=reg256#1
# asm 2: vmovapd minusz,>s=%ymm0
# bytes: 9 uops: 1
vmovapd minusz,%ymm0

# qhasm: 4x r0 = approx s * mem256[input_0 + 0]
# asm 1: vmulpd 0(<input_0=int64#1),<s=reg256#1,>r0=reg256#2
# asm 2: vmulpd 0(<input_0=%rdi),<s=%ymm0,>r0=%ymm1
# bytes: 4 uops: 1
vmulpd 0(%rdi),%ymm0,%ymm1
# block pos: 32 67 uops: 6

# qhasm: 4x r1 = approx s * mem256[input_0 + 32]
# asm 1: vmulpd 32(<input_0=int64#1),<s=reg256#1,>r1=reg256#3
# asm 2: vmulpd 32(<input_0=%rdi),<s=%ymm0,>r1=%ymm2
# bytes: 5 uops: 1
vmulpd 32(%rdi),%ymm0,%ymm2

# qhasm: 4x r2 = approx s * mem256[input_0 + 64]
# asm 1: vmulpd 64(<input_0=int64#1),<s=reg256#1,>r2=reg256#4
# asm 2: vmulpd 64(<input_0=%rdi),<s=%ymm0,>r2=%ymm3
# bytes: 5 uops: 1
vmulpd 64(%rdi),%ymm0,%ymm3

# qhasm: 4x r3 = approx s * mem256[input_0 + 96]
# asm 1: vmulpd 96(<input_0=int64#1),<s=reg256#1,>r3=reg256#5
# asm 2: vmulpd 96(<input_0=%rdi),<s=%ymm0,>r3=%ymm4
# bytes: 5 uops: 1
vmulpd 96(%rdi),%ymm0,%ymm4

# qhasm: 4x r4 = approx s * mem256[input_0 + 128]
# asm 1: vmulpd 128(<input_0=int64#1),<s=reg256#1,>r4=reg256#6
# asm 2: vmulpd 128(<input_0=%rdi),<s=%ymm0,>r4=%ymm5
# bytes: 8 uops: 1
vmulpd 128(%rdi),%ymm0,%ymm5

# qhasm: 4x r5 = approx s * mem256[input_0 + 160]
# asm 1: vmulpd 160(<input_0=int64#1),<s=reg256#1,>r5=reg256#1
# asm 2: vmulpd 160(<input_0=%rdi),<s=%ymm0,>r5=%ymm0
# bytes: 8 uops: 1
vmulpd 160(%rdi),%ymm0,%ymm0

# qhasm: mem256[input_0 +   0] aligned= r0
# asm 1: vmovapd   <r0=reg256#2,0(<input_0=int64#1)
# asm 2: vmovapd   <r0=%ymm1,0(<input_0=%rdi)
# bytes: 4 uops: 1
vmovapd   %ymm1,0(%rdi)
# block pos: 67 98 uops: 5

# qhasm: mem256[input_0 +  32] aligned= r1
# asm 1: vmovapd   <r1=reg256#3,32(<input_0=int64#1)
# asm 2: vmovapd   <r1=%ymm2,32(<input_0=%rdi)
# bytes: 5 uops: 1
vmovapd   %ymm2,32(%rdi)

# qhasm: mem256[input_0 +  64] aligned= r2
# asm 1: vmovapd   <r2=reg256#4,64(<input_0=int64#1)
# asm 2: vmovapd   <r2=%ymm3,64(<input_0=%rdi)
# bytes: 5 uops: 1
vmovapd   %ymm3,64(%rdi)

# qhasm: mem256[input_0 +  96] aligned= r3
# asm 1: vmovapd   <r3=reg256#5,96(<input_0=int64#1)
# asm 2: vmovapd   <r3=%ymm4,96(<input_0=%rdi)
# bytes: 5 uops: 1
vmovapd   %ymm4,96(%rdi)

# qhasm: mem256[input_0 + 128] aligned= r4
# asm 1: vmovapd   <r4=reg256#6,128(<input_0=int64#1)
# asm 2: vmovapd   <r4=%ymm5,128(<input_0=%rdi)
# bytes: 8 uops: 1
vmovapd   %ymm5,128(%rdi)

# qhasm: mem256[input_0 + 160] aligned= r5
# asm 1: vmovapd   <r5=reg256#1,160(<input_0=int64#1)
# asm 2: vmovapd   <r5=%ymm0,160(<input_0=%rdi)
# bytes: 8 uops: 1
vmovapd   %ymm0,160(%rdi)
# block pos: 98 102 uops: 2

# qhasm: return
# bytes: 3 uops: 1
add %r11,%rsp
# bytes: 1 uops: 1
ret
