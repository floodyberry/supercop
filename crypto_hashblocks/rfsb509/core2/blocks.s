
# qhasm:  enter crypto_hashblocks_rfsb509_core2
.text
.p2align 5
.globl _crypto_hashblocks_rfsb509_core2
.globl crypto_hashblocks_rfsb509_core2
_crypto_hashblocks_rfsb509_core2:
crypto_hashblocks_rfsb509_core2:
mov %rsp,%r11
and $31,%r11
add $128,%r11
sub %r11,%rsp

# qhasm:  int64 rp

# qhasm:  int64 bp

# qhasm:  int64 blen

# qhasm:  input rp

# qhasm:  input bp

# qhasm:  input blen

# qhasm:  int64 matrix

# qhasm:  matrix = crypto_hashblocks_rfsb509_core2_matrix
# asm 1: mov  $crypto_hashblocks_rfsb509_core2_matrix,>matrix=int64#4
# asm 2: mov  $crypto_hashblocks_rfsb509_core2_matrix,>matrix=%rcx
mov  $crypto_hashblocks_rfsb509_core2_matrix,%rcx

# qhasm:  assign 4 to matrix

# qhasm:  int64 c1

# qhasm:  caller c1

# qhasm:  stack64 c1_stack

# qhasm:  c1_stack = c1
# asm 1: movq <c1=int64#9,>c1_stack=stack64#1
# asm 2: movq <c1=%r11,>c1_stack=64(%rsp)
movq %r11,64(%rsp)

# qhasm:  int64 c2

# qhasm:  caller c2

# qhasm:  stack64 c2_stack

# qhasm:  c2_stack = c2
# asm 1: movq <c2=int64#10,>c2_stack=stack64#2
# asm 2: movq <c2=%r12,>c2_stack=72(%rsp)
movq %r12,72(%rsp)

# qhasm:  int64 c3

# qhasm:  caller c3

# qhasm:  stack64 c3_stack

# qhasm:  c3_stack = c3
# asm 1: movq <c3=int64#11,>c3_stack=stack64#3
# asm 2: movq <c3=%r13,>c3_stack=80(%rsp)
movq %r13,80(%rsp)

# qhasm:  int64 c4

# qhasm:  caller c4

# qhasm:  stack64 c4_stack

# qhasm:  c4_stack = c4
# asm 1: movq <c4=int64#12,>c4_stack=stack64#4
# asm 2: movq <c4=%r14,>c4_stack=88(%rsp)
movq %r14,88(%rsp)

# qhasm:  int64 c5

# qhasm:  caller c5

# qhasm:  stack64 c5_stack

# qhasm:  c5_stack = c5
# asm 1: movq <c5=int64#13,>c5_stack=stack64#5
# asm 2: movq <c5=%r15,>c5_stack=96(%rsp)
movq %r15,96(%rsp)

# qhasm:  int64 c6

# qhasm:  caller c6

# qhasm:  stack64 c6_stack

# qhasm:  c6_stack = c6
# asm 1: movq <c6=int64#14,>c6_stack=stack64#6
# asm 2: movq <c6=%rbx,>c6_stack=104(%rsp)
movq %rbx,104(%rsp)

# qhasm:  int64 c7

# qhasm:  caller c7

# qhasm:  stack64 c7_stack

# qhasm:  c7_stack = c7
# asm 1: movq <c7=int64#15,>c7_stack=stack64#7
# asm 2: movq <c7=%rbp,>c7_stack=112(%rsp)
movq %rbp,112(%rsp)

# qhasm:  stack64 rp_stack

# qhasm:  rp_stack = rp
# asm 1: movq <rp=int64#1,>rp_stack=stack64#8
# asm 2: movq <rp=%rdi,>rp_stack=120(%rsp)
movq %rdi,120(%rsp)

# qhasm:  stack128 state0

# qhasm:  stack128 state1

# qhasm:  stack128 state2

# qhasm:  stack128 state3

# qhasm:  int6464 v

# qhasm:  int6464 w

# qhasm:  int6464 f0

# qhasm:  int6464 f1

# qhasm:  int6464 f2

# qhasm:  int6464 f3

# qhasm:  int6464 f4

# qhasm:  int6464 f5

# qhasm:  int6464 f6

# qhasm:  int6464 f7

# qhasm:  int6464 f8

# qhasm:  int6464 f9

# qhasm:  int6464 f10

# qhasm:  int6464 f11

# qhasm:  int6464 f12

# qhasm:  int6464 f13

# qhasm:  int6464 f14

# qhasm:  int6464 f15

# qhasm:  int6464 f16

# qhasm:  int6464 f17

# qhasm:  int6464 f18

# qhasm:  int6464 f19

# qhasm:  int6464 f20

# qhasm:  int6464 f21

# qhasm:  int6464 f22

# qhasm:  int6464 f23

# qhasm:  int6464 f24

# qhasm:  int6464 f25

# qhasm:  int6464 f26

# qhasm:  int6464 f27

# qhasm:  int6464 f28

# qhasm:  int6464 f29

# qhasm:  int6464 f30

# qhasm:  int6464 f31

# qhasm:  int6464 f32

# qhasm:  int6464 f33

# qhasm:  int6464 f34

# qhasm:  int6464 f35

# qhasm:  int6464 f36

# qhasm:  int6464 f37

# qhasm:  int6464 f38

# qhasm:  int6464 f39

# qhasm:  int6464 f40

# qhasm:  int6464 f41

# qhasm:  int6464 f42

# qhasm:  int6464 f43

# qhasm:  int6464 f44

# qhasm:  int6464 f45

# qhasm:  int6464 f46

# qhasm:  int6464 f47

# qhasm:  int6464 f48

# qhasm:  int6464 f49

# qhasm:  int6464 f50

# qhasm:  int6464 f51

# qhasm:  int6464 f52

# qhasm:  int6464 f53

# qhasm:  int6464 f54

# qhasm:  int6464 f55

# qhasm:  int6464 f56

# qhasm:  int6464 f57

# qhasm:  int6464 f58

# qhasm:  int6464 f59

# qhasm:  int6464 f60

# qhasm:  int6464 f61

# qhasm:  int6464 f62

# qhasm:  int6464 f63

# qhasm:  int6464 f64

# qhasm:  int6464 f65

# qhasm:  int6464 f66

# qhasm:  int6464 f67

# qhasm:  int6464 f68

# qhasm:  int6464 f69

# qhasm:  int6464 f70

# qhasm:  int6464 f71

# qhasm:  int6464 f72

# qhasm:  int6464 f73

# qhasm:  int6464 f74

# qhasm:  int6464 f75

# qhasm:  int6464 f76

# qhasm:  int6464 f77

# qhasm:  int6464 f78

# qhasm:  int6464 f79

# qhasm:  int6464 f80

# qhasm:  int6464 f81

# qhasm:  int6464 f82

# qhasm:  int6464 f83

# qhasm:  int6464 f84

# qhasm:  int6464 f85

# qhasm:  int6464 f86

# qhasm:  int6464 f87

# qhasm:  int6464 f88

# qhasm:  int6464 f89

# qhasm:  int6464 f90

# qhasm:  int6464 f91

# qhasm:  int6464 f92

# qhasm:  int6464 f93

# qhasm:  int6464 f94

# qhasm:  int6464 f95

# qhasm:  int6464 f96

# qhasm:  int6464 f97

# qhasm:  int6464 f98

# qhasm:  int6464 f99

# qhasm:  int6464 f100

# qhasm:  int6464 f101

# qhasm:  int6464 f102

# qhasm:  int6464 f103

# qhasm:  int6464 f104

# qhasm:  int6464 f105

# qhasm:  int6464 f106

# qhasm:  int6464 f107

# qhasm:  int6464 f108

# qhasm:  int6464 f109

# qhasm:  int6464 f110

# qhasm:  int6464 f111

# qhasm:  int6464 f112

# qhasm:  int6464 f113

# qhasm:  int6464 f114

# qhasm:  int64 pos0

# qhasm:  int64 pos1

# qhasm:  int64 pos2

# qhasm:  int64 pos3

# qhasm:  int64 pos4

# qhasm:  int64 pos5

# qhasm:  int64 pos6

# qhasm:  int64 pos7

# qhasm:  int64 pos8

# qhasm:  int64 pos9

# qhasm:  int64 pos10

# qhasm:  int64 pos11

# qhasm:  int64 pos12

# qhasm:  int64 pos13

# qhasm:  int64 pos14

# qhasm:  int64 pos15

# qhasm:  int64 pos16

# qhasm:  int64 pos17

# qhasm:  int64 pos18

# qhasm:  int64 pos19

# qhasm:  int64 pos20

# qhasm:  int64 pos21

# qhasm:  int64 pos22

# qhasm:  int64 pos23

# qhasm:  int64 pos24

# qhasm:  int64 pos25

# qhasm:  int64 pos26

# qhasm:  int64 pos27

# qhasm:  int64 pos28

# qhasm:  int64 pos29

# qhasm:  int64 pos30

# qhasm:  int64 pos31

# qhasm:  int64 pos32

# qhasm:  int64 pos33

# qhasm:  int64 pos34

# qhasm:  int64 pos35

# qhasm:  int64 pos36

# qhasm:  int64 pos37

# qhasm:  int64 pos38

# qhasm:  int64 pos39

# qhasm:  int64 pos40

# qhasm:  int64 pos41

# qhasm:  int64 pos42

# qhasm:  int64 pos43

# qhasm:  int64 pos44

# qhasm:  int64 pos45

# qhasm:  int64 pos46

# qhasm:  int64 pos47

# qhasm:  int64 pos48

# qhasm:  int64 pos49

# qhasm:  int64 pos50

# qhasm:  int64 pos51

# qhasm:  int64 pos52

# qhasm:  int64 pos53

# qhasm:  int64 pos54

# qhasm:  int64 pos55

# qhasm:  int64 pos56

# qhasm:  int64 pos57

# qhasm:  int64 pos58

# qhasm:  int64 pos59

# qhasm:  int64 pos60

# qhasm:  int64 pos61

# qhasm:  int64 pos62

# qhasm:  int64 pos63

# qhasm:  int64 pos64

# qhasm:  int64 pos65

# qhasm:  int64 pos66

# qhasm:  int64 pos67

# qhasm:  int64 pos68

# qhasm:  int64 pos69

# qhasm:  int64 pos70

# qhasm:  int64 pos71

# qhasm:  int64 pos72

# qhasm:  int64 pos73

# qhasm:  int64 pos74

# qhasm:  int64 pos75

# qhasm:  int64 pos76

# qhasm:  int64 pos77

# qhasm:  int64 pos78

# qhasm:  int64 pos79

# qhasm:  int64 pos80

# qhasm:  int64 pos81

# qhasm:  int64 pos82

# qhasm:  int64 pos83

# qhasm:  int64 pos84

# qhasm:  int64 pos85

# qhasm:  int64 pos86

# qhasm:  int64 pos87

# qhasm:  int64 pos88

# qhasm:  int64 pos89

# qhasm:  int64 pos90

# qhasm:  int64 pos91

# qhasm:  int64 pos92

# qhasm:  int64 pos93

# qhasm:  int64 pos94

# qhasm:  int64 pos95

# qhasm:  int64 pos96

# qhasm:  int64 pos97

# qhasm:  int64 pos98

# qhasm:  int64 pos99

# qhasm:  int64 pos100

# qhasm:  int64 pos101

# qhasm:  int64 pos102

# qhasm:  int64 pos103

# qhasm:  int64 pos104

# qhasm:  int64 pos105

# qhasm:  int64 pos106

# qhasm:  int64 pos107

# qhasm:  int64 pos108

# qhasm:  int64 pos109

# qhasm:  int64 pos110

# qhasm:  int64 pos111

# qhasm:  int64 mask

# qhasm:  (uint32) mask = 0x3fc0
# asm 1: mov  $0x3fc0,>mask=int64#8d
# asm 2: mov  $0x3fc0,>mask=%r10d
mov  $0x3fc0,%r10d

# qhasm:  assign 8 to mask

# qhasm:  v = *(unaligned int128 *) (rp + 0)
# asm 1: movdqu 0(<rp=int64#1),>v=int6464#1
# asm 2: movdqu 0(<rp=%rdi),>v=%xmm0
movdqu 0(%rdi),%xmm0

# qhasm:  state0 = v
# asm 1: movdqa <v=int6464#1,>state0=stack128#1
# asm 2: movdqa <v=%xmm0,>state0=0(%rsp)
movdqa %xmm0,0(%rsp)

# qhasm:  v = *(unaligned int128 *) (rp + 16)
# asm 1: movdqu 16(<rp=int64#1),>v=int6464#1
# asm 2: movdqu 16(<rp=%rdi),>v=%xmm0
movdqu 16(%rdi),%xmm0

# qhasm:  state1 = v
# asm 1: movdqa <v=int6464#1,>state1=stack128#2
# asm 2: movdqa <v=%xmm0,>state1=16(%rsp)
movdqa %xmm0,16(%rsp)

# qhasm:  v = *(unaligned int128 *) (rp + 32)
# asm 1: movdqu 32(<rp=int64#1),>v=int6464#1
# asm 2: movdqu 32(<rp=%rdi),>v=%xmm0
movdqu 32(%rdi),%xmm0

# qhasm:  state2 = v
# asm 1: movdqa <v=int6464#1,>state2=stack128#3
# asm 2: movdqa <v=%xmm0,>state2=32(%rsp)
movdqa %xmm0,32(%rsp)

# qhasm:  v = *(unaligned int128 *) (rp + 48)
# asm 1: movdqu 48(<rp=int64#1),>v=int6464#1
# asm 2: movdqu 48(<rp=%rdi),>v=%xmm0
movdqu 48(%rdi),%xmm0

# qhasm:  state3 = v
# asm 1: movdqa <v=int6464#1,>state3=stack128#4
# asm 2: movdqa <v=%xmm0,>state3=48(%rsp)
movdqa %xmm0,48(%rsp)

# qhasm:  pos55 = v
# asm 1: movd   <v=int6464#1,>pos55=int64#14
# asm 2: movd   <v=%xmm0,>pos55=%rbx
movd   %xmm0,%rbx

# qhasm:               unsigned<? blen -= 48
# asm 1: sub  $48,<blen=int64#3
# asm 2: sub  $48,<blen=%rdx
sub  $48,%rdx
# comment:fp stack unchanged by jump

# qhasm:  goto done if unsigned<
jb ._done

# qhasm:  mainloop:
._mainloop:

# qhasm:  (uint32) pos48 = pos55
# asm 1: mov  <pos55=int64#14d,>pos48=int64#5d
# asm 2: mov  <pos55=%ebx,>pos48=%r8d
mov  %ebx,%r8d

# qhasm:  (uint32) pos48 <<= 6
# asm 1: shl  $6,<pos48=int64#5d
# asm 2: shl  $6,<pos48=%r8d
shl  $6,%r8d

# qhasm:  (uint32) pos48 &= mask
# asm 1: andl <mask=int64#8d,<pos48=int64#5d
# asm 2: andl <mask=%r10d,<pos48=%r8d
andl %r10d,%r8d

# qhasm:  (uint32) pos49 = pos55
# asm 1: mov  <pos55=int64#14d,>pos49=int64#6d
# asm 2: mov  <pos55=%ebx,>pos49=%r9d
mov  %ebx,%r9d

# qhasm:  (uint32) pos49 >>= 2
# asm 1: shr  $2,<pos49=int64#6d
# asm 2: shr  $2,<pos49=%r9d
shr  $2,%r9d

# qhasm:  (uint32) pos49 &= mask
# asm 1: andl <mask=int64#8d,<pos49=int64#6d
# asm 2: andl <mask=%r10d,<pos49=%r9d
andl %r10d,%r9d

# qhasm:  (uint32) pos50 = pos55
# asm 1: mov  <pos55=int64#14d,>pos50=int64#9d
# asm 2: mov  <pos55=%ebx,>pos50=%r11d
mov  %ebx,%r11d

# qhasm:  f51 = *(int128 *) (pos48 + 0 + matrix)
# asm 1: movdqa 0(<pos48=int64#5,<matrix=int64#4),>f51=int6464#1
# asm 2: movdqa 0(<pos48=%r8,<matrix=%rcx),>f51=%xmm0
movdqa 0(%r8,%rcx),%xmm0

# qhasm:  (uint32) pos50 >>= 10
# asm 1: shr  $10,<pos50=int64#9d
# asm 2: shr  $10,<pos50=%r11d
shr  $10,%r11d

# qhasm:  (uint32) pos50 &= mask
# asm 1: andl <mask=int64#8d,<pos50=int64#9d
# asm 2: andl <mask=%r10d,<pos50=%r11d
andl %r10d,%r11d

# qhasm:  uint32323232 f51 ^= *(int128 *) (pos49 + 16 + matrix)
# asm 1: pxor 16(<pos49=int64#6,<matrix=int64#4,1),<f51=int6464#1
# asm 2: pxor 16(<pos49=%r9,<matrix=%rcx,1),<f51=%xmm0
pxor 16(%r9,%rcx,1),%xmm0

# qhasm:  (uint32) pos51 = pos55
# asm 1: mov  <pos55=int64#14d,>pos51=int64#10d
# asm 2: mov  <pos55=%ebx,>pos51=%r12d
mov  %ebx,%r12d

# qhasm:  f52 = *(int128 *) (pos49 + 0 + matrix)
# asm 1: movdqa 0(<pos49=int64#6,<matrix=int64#4),>f52=int6464#2
# asm 2: movdqa 0(<pos49=%r9,<matrix=%rcx),>f52=%xmm1
movdqa 0(%r9,%rcx),%xmm1

# qhasm:  (uint32) pos51 >>= 18
# asm 1: shr  $18,<pos51=int64#10d
# asm 2: shr  $18,<pos51=%r12d
shr  $18,%r12d

# qhasm:  uint32323232 f51 ^= *(int128 *) (pos50 + 32 + matrix)
# asm 1: pxor 32(<pos50=int64#9,<matrix=int64#4,1),<f51=int6464#1
# asm 2: pxor 32(<pos50=%r11,<matrix=%rcx,1),<f51=%xmm0
pxor 32(%r11,%rcx,1),%xmm0

# qhasm:  (uint32) pos51 &= mask
# asm 1: andl <mask=int64#8d,<pos51=int64#10d
# asm 2: andl <mask=%r10d,<pos51=%r12d
andl %r10d,%r12d

# qhasm:  uint32323232 f52 ^= *(int128 *) (pos50 + 16 + matrix)
# asm 1: pxor 16(<pos50=int64#9,<matrix=int64#4,1),<f52=int6464#2
# asm 2: pxor 16(<pos50=%r11,<matrix=%rcx,1),<f52=%xmm1
pxor 16(%r11,%rcx,1),%xmm1

# qhasm:  pos52 = pos55
# asm 1: mov  <pos55=int64#14,>pos52=int64#7
# asm 2: mov  <pos55=%rbx,>pos52=%rax
mov  %rbx,%rax

# qhasm:  f53 = *(int128 *) (pos50 + 0 + matrix)
# asm 1: movdqa 0(<pos50=int64#9,<matrix=int64#4),>f53=int6464#3
# asm 2: movdqa 0(<pos50=%r11,<matrix=%rcx),>f53=%xmm2
movdqa 0(%r11,%rcx),%xmm2

# qhasm:  (uint64) pos52 >>= 26
# asm 1: shr  $26,<pos52=int64#7
# asm 2: shr  $26,<pos52=%rax
shr  $26,%rax

# qhasm:  uint32323232 f52 ^= *(int128 *) (pos51 + 32 + matrix)
# asm 1: pxor 32(<pos51=int64#10,<matrix=int64#4,1),<f52=int6464#2
# asm 2: pxor 32(<pos51=%r12,<matrix=%rcx,1),<f52=%xmm1
pxor 32(%r12,%rcx,1),%xmm1

# qhasm:  (uint32) pos52 &= mask
# asm 1: andl <mask=int64#8d,<pos52=int64#7d
# asm 2: andl <mask=%r10d,<pos52=%eax
andl %r10d,%eax

# qhasm:  assign 7 to pos52

# qhasm:  uint32323232 f51 ^= *(int128 *) (pos51 + 48 + matrix)
# asm 1: pxor 48(<pos51=int64#10,<matrix=int64#4,1),<f51=int6464#1
# asm 2: pxor 48(<pos51=%r12,<matrix=%rcx,1),<f51=%xmm0
pxor 48(%r12,%rcx,1),%xmm0

# qhasm:  f54 = f51
# asm 1: movdqa <f51=int6464#1,>f54=int6464#4
# asm 2: movdqa <f51=%xmm0,>f54=%xmm3
movdqa %xmm0,%xmm3

# qhasm:  uint6464 f54 >>= 61
# asm 1: psrlq $61,<f54=int6464#4
# asm 2: psrlq $61,<f54=%xmm3
psrlq $61,%xmm3

# qhasm:  uint6464 f51 <<= 3
# asm 1: psllq $3,<f51=int6464#1
# asm 2: psllq $3,<f51=%xmm0
psllq $3,%xmm0

# qhasm:  f55[0,1,2,3] = f54[1,1,0,1]
# asm 1: pshufd $0x45,<f54=int6464#4,>f55=int6464#5
# asm 2: pshufd $0x45,<f54=%xmm3,>f55=%xmm4
pshufd $0x45,%xmm3,%xmm4

# qhasm:  f55 ^= f51
# asm 1: pxor  <f51=int6464#1,<f55=int6464#5
# asm 2: pxor  <f51=%xmm0,<f55=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  f54 >>= 64
# asm 1: psrldq $8,<f54=int6464#4
# asm 2: psrldq $8,<f54=%xmm3
psrldq $8,%xmm3

# qhasm:  uint32323232 f53 ^= *(int128 *) (pos51 + 16 + matrix)
# asm 1: pxor 16(<pos51=int64#10,<matrix=int64#4,1),<f53=int6464#3
# asm 2: pxor 16(<pos51=%r12,<matrix=%rcx,1),<f53=%xmm2
pxor 16(%r12,%rcx,1),%xmm2

# qhasm:  pos53 = pos55
# asm 1: mov  <pos55=int64#14,>pos53=int64#1
# asm 2: mov  <pos55=%rbx,>pos53=%rdi
mov  %rbx,%rdi

# qhasm:  uint32323232 f54 ^= *(int128 *) (pos51 + 0 + matrix)
# asm 1: pxor 0(<pos51=int64#10,<matrix=int64#4,1),<f54=int6464#4
# asm 2: pxor 0(<pos51=%r12,<matrix=%rcx,1),<f54=%xmm3
pxor 0(%r12,%rcx,1),%xmm3

# qhasm:  (uint64) pos53 >>= 34
# asm 1: shr  $34,<pos53=int64#1
# asm 2: shr  $34,<pos53=%rdi
shr  $34,%rdi

# qhasm:  uint32323232 f53 ^= *(int128 *) (pos52 + 32 + matrix)
# asm 1: pxor 32(<pos52=int64#7,<matrix=int64#4,1),<f53=int6464#3
# asm 2: pxor 32(<pos52=%rax,<matrix=%rcx,1),<f53=%xmm2
pxor 32(%rax,%rcx,1),%xmm2

# qhasm:  (uint32) pos53 &= mask
# asm 1: andl <mask=int64#8d,<pos53=int64#1d
# asm 2: andl <mask=%r10d,<pos53=%edi
andl %r10d,%edi

# qhasm:  assign 1 to pos53

# qhasm:  uint32323232 f52 ^= *(int128 *) (pos52 + 48 + matrix)
# asm 1: pxor 48(<pos52=int64#7,<matrix=int64#4,1),<f52=int6464#2
# asm 2: pxor 48(<pos52=%rax,<matrix=%rcx,1),<f52=%xmm1
pxor 48(%rax,%rcx,1),%xmm1

# qhasm:  v = f52
# asm 1: movdqa <f52=int6464#2,>v=int6464#1
# asm 2: movdqa <f52=%xmm1,>v=%xmm0
movdqa %xmm1,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#1
# asm 2: psrlq $61,<v=%xmm0
psrlq $61,%xmm0

# qhasm:  f56[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#1,>f56=int6464#6
# asm 2: pshufd $0x45,<v=%xmm0,>f56=%xmm5
pshufd $0x45,%xmm0,%xmm5

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#1
# asm 2: psrldq $8,<v=%xmm0
psrldq $8,%xmm0

# qhasm:  uint6464 f52 <<= 3
# asm 1: psllq $3,<f52=int6464#2
# asm 2: psllq $3,<f52=%xmm1
psllq $3,%xmm1

# qhasm:  uint32323232 f54 ^= *(int128 *) (pos52 + 16 + matrix)
# asm 1: pxor 16(<pos52=int64#7,<matrix=int64#4,1),<f54=int6464#4
# asm 2: pxor 16(<pos52=%rax,<matrix=%rcx,1),<f54=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm:  f56 ^= f52
# asm 1: pxor  <f52=int6464#2,<f56=int6464#6
# asm 2: pxor  <f52=%xmm1,<f56=%xmm5
pxor  %xmm1,%xmm5

# qhasm:  f55 ^= v
# asm 1: pxor  <v=int6464#1,<f55=int6464#5
# asm 2: pxor  <v=%xmm0,<f55=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  pos63 = ((uint64 *)&state3)[1]
# asm 1: movq 8+<state3=stack128#4,>pos63=int64#10
# asm 2: movq 8+<state3=48(%rsp),>pos63=%r12
movq 8+48(%rsp),%r12

# qhasm:  pos54 = pos55
# asm 1: mov  <pos55=int64#14,>pos54=int64#15
# asm 2: mov  <pos55=%rbx,>pos54=%rbp
mov  %rbx,%rbp

# qhasm:  uint32323232 f55 ^= *(int128 *) (pos52 + 0 + matrix)
# asm 1: pxor 0(<pos52=int64#7,<matrix=int64#4,1),<f55=int6464#5
# asm 2: pxor 0(<pos52=%rax,<matrix=%rcx,1),<f55=%xmm4
pxor 0(%rax,%rcx,1),%xmm4

# qhasm:  (uint64) pos54 >>= 42
# asm 1: shr  $42,<pos54=int64#15
# asm 2: shr  $42,<pos54=%rbp
shr  $42,%rbp

# qhasm:  uint32323232 f54 ^= *(int128 *) (pos53 + 32 + matrix)
# asm 1: pxor 32(<pos53=int64#1,<matrix=int64#4,1),<f54=int6464#4
# asm 2: pxor 32(<pos53=%rdi,<matrix=%rcx,1),<f54=%xmm3
pxor 32(%rdi,%rcx,1),%xmm3

# qhasm:  (uint32) pos54 &= mask
# asm 1: andl <mask=int64#8d,<pos54=int64#15d
# asm 2: andl <mask=%r10d,<pos54=%ebp
andl %r10d,%ebp

# qhasm:  assign 15 to pos54

# qhasm:  uint32323232 f53 ^= *(int128 *) (pos53 + 48 + matrix)
# asm 1: pxor 48(<pos53=int64#1,<matrix=int64#4,1),<f53=int6464#3
# asm 2: pxor 48(<pos53=%rdi,<matrix=%rcx,1),<f53=%xmm2
pxor 48(%rdi,%rcx,1),%xmm2

# qhasm:  v = f53
# asm 1: movdqa <f53=int6464#3,>v=int6464#1
# asm 2: movdqa <f53=%xmm2,>v=%xmm0
movdqa %xmm2,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#1
# asm 2: psrlq $61,<v=%xmm0
psrlq $61,%xmm0

# qhasm:  f57[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#1,>f57=int6464#2
# asm 2: pshufd $0x45,<v=%xmm0,>f57=%xmm1
pshufd $0x45,%xmm0,%xmm1

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#1
# asm 2: psrldq $8,<v=%xmm0
psrldq $8,%xmm0

# qhasm:  uint6464 f53 <<= 3
# asm 1: psllq $3,<f53=int6464#3
# asm 2: psllq $3,<f53=%xmm2
psllq $3,%xmm2

# qhasm:  uint32323232 f55 ^= *(int128 *) (pos53 + 16 + matrix)
# asm 1: pxor 16(<pos53=int64#1,<matrix=int64#4,1),<f55=int6464#5
# asm 2: pxor 16(<pos53=%rdi,<matrix=%rcx,1),<f55=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm:  f57 ^= f53
# asm 1: pxor  <f53=int6464#3,<f57=int6464#2
# asm 2: pxor  <f53=%xmm2,<f57=%xmm1
pxor  %xmm2,%xmm1

# qhasm:  f56 ^= v
# asm 1: pxor  <v=int6464#1,<f56=int6464#6
# asm 2: pxor  <v=%xmm0,<f56=%xmm5
pxor  %xmm0,%xmm5

# qhasm:  uint32323232 f56 ^= *(int128 *) (pos53 + 0 + matrix)
# asm 1: pxor 0(<pos53=int64#1,<matrix=int64#4,1),<f56=int6464#6
# asm 2: pxor 0(<pos53=%rdi,<matrix=%rcx,1),<f56=%xmm5
pxor 0(%rdi,%rcx,1),%xmm5

# qhasm:  (uint64) pos55 >>= 50
# asm 1: shr  $50,<pos55=int64#14
# asm 2: shr  $50,<pos55=%rbx
shr  $50,%rbx

# qhasm:  uint32323232 f55 ^= *(int128 *) (pos54 + 32 + matrix)
# asm 1: pxor 32(<pos54=int64#15,<matrix=int64#4,1),<f55=int6464#5
# asm 2: pxor 32(<pos54=%rbp,<matrix=%rcx,1),<f55=%xmm4
pxor 32(%rbp,%rcx,1),%xmm4

# qhasm:  (uint32) pos55 &= mask
# asm 1: andl <mask=int64#8d,<pos55=int64#14d
# asm 2: andl <mask=%r10d,<pos55=%ebx
andl %r10d,%ebx

# qhasm:  assign 14 to pos55

# qhasm:  uint32323232 f54 ^= *(int128 *) (pos54 + 48 + matrix)
# asm 1: pxor 48(<pos54=int64#15,<matrix=int64#4,1),<f54=int6464#4
# asm 2: pxor 48(<pos54=%rbp,<matrix=%rcx,1),<f54=%xmm3
pxor 48(%rbp,%rcx,1),%xmm3

# qhasm:  v = f54
# asm 1: movdqa <f54=int6464#4,>v=int6464#1
# asm 2: movdqa <f54=%xmm3,>v=%xmm0
movdqa %xmm3,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#1
# asm 2: psrlq $61,<v=%xmm0
psrlq $61,%xmm0

# qhasm:  f58[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#1,>f58=int6464#3
# asm 2: pshufd $0x45,<v=%xmm0,>f58=%xmm2
pshufd $0x45,%xmm0,%xmm2

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#1
# asm 2: psrldq $8,<v=%xmm0
psrldq $8,%xmm0

# qhasm:  uint6464 f54 <<= 3
# asm 1: psllq $3,<f54=int6464#4
# asm 2: psllq $3,<f54=%xmm3
psllq $3,%xmm3

# qhasm:  uint32323232 f56 ^= *(int128 *) (pos54 + 16 + matrix)
# asm 1: pxor 16(<pos54=int64#15,<matrix=int64#4,1),<f56=int6464#6
# asm 2: pxor 16(<pos54=%rbp,<matrix=%rcx,1),<f56=%xmm5
pxor 16(%rbp,%rcx,1),%xmm5

# qhasm:  f58 ^= f54
# asm 1: pxor  <f54=int6464#4,<f58=int6464#3
# asm 2: pxor  <f54=%xmm3,<f58=%xmm2
pxor  %xmm3,%xmm2

# qhasm:  f57 ^= v
# asm 1: pxor  <v=int6464#1,<f57=int6464#2
# asm 2: pxor  <v=%xmm0,<f57=%xmm1
pxor  %xmm0,%xmm1

# qhasm:  (uint32) pos56 = pos63
# asm 1: mov  <pos63=int64#10d,>pos56=int64#1d
# asm 2: mov  <pos63=%r12d,>pos56=%edi
mov  %r12d,%edi

# qhasm:  uint32323232 f57 ^= *(int128 *) (pos54 + 0 + matrix)
# asm 1: pxor 0(<pos54=int64#15,<matrix=int64#4,1),<f57=int6464#2
# asm 2: pxor 0(<pos54=%rbp,<matrix=%rcx,1),<f57=%xmm1
pxor 0(%rbp,%rcx,1),%xmm1

# qhasm:  (uint32) pos56 <<= 6
# asm 1: shl  $6,<pos56=int64#1d
# asm 2: shl  $6,<pos56=%edi
shl  $6,%edi

# qhasm:  uint32323232 f56 ^= *(int128 *) (pos55 + 32 + matrix)
# asm 1: pxor 32(<pos55=int64#14,<matrix=int64#4,1),<f56=int6464#6
# asm 2: pxor 32(<pos55=%rbx,<matrix=%rcx,1),<f56=%xmm5
pxor 32(%rbx,%rcx,1),%xmm5

# qhasm:  (uint32) pos56 &= mask
# asm 1: andl <mask=int64#8d,<pos56=int64#1d
# asm 2: andl <mask=%r10d,<pos56=%edi
andl %r10d,%edi

# qhasm:  uint32323232 f55 ^= *(int128 *) (pos55 + 48 + matrix)
# asm 1: pxor 48(<pos55=int64#14,<matrix=int64#4,1),<f55=int6464#5
# asm 2: pxor 48(<pos55=%rbx,<matrix=%rcx,1),<f55=%xmm4
pxor 48(%rbx,%rcx,1),%xmm4

# qhasm:  v = f55
# asm 1: movdqa <f55=int6464#5,>v=int6464#1
# asm 2: movdqa <f55=%xmm4,>v=%xmm0
movdqa %xmm4,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#1
# asm 2: psrlq $61,<v=%xmm0
psrlq $61,%xmm0

# qhasm:  f59[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#1,>f59=int6464#4
# asm 2: pshufd $0x45,<v=%xmm0,>f59=%xmm3
pshufd $0x45,%xmm0,%xmm3

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#1
# asm 2: psrldq $8,<v=%xmm0
psrldq $8,%xmm0

# qhasm:  uint6464 f55 <<= 3
# asm 1: psllq $3,<f55=int6464#5
# asm 2: psllq $3,<f55=%xmm4
psllq $3,%xmm4

# qhasm:  uint32323232 f57 ^= *(int128 *) (pos55 + 16 + matrix)
# asm 1: pxor 16(<pos55=int64#14,<matrix=int64#4,1),<f57=int6464#2
# asm 2: pxor 16(<pos55=%rbx,<matrix=%rcx,1),<f57=%xmm1
pxor 16(%rbx,%rcx,1),%xmm1

# qhasm:  f59 ^= f55
# asm 1: pxor  <f55=int6464#5,<f59=int6464#4
# asm 2: pxor  <f55=%xmm4,<f59=%xmm3
pxor  %xmm4,%xmm3

# qhasm:  f58 ^= v
# asm 1: pxor  <v=int6464#1,<f58=int6464#3
# asm 2: pxor  <v=%xmm0,<f58=%xmm2
pxor  %xmm0,%xmm2

# qhasm:  (uint32) pos57 = pos63
# asm 1: mov  <pos63=int64#10d,>pos57=int64#7d
# asm 2: mov  <pos63=%r12d,>pos57=%eax
mov  %r12d,%eax

# qhasm:  uint32323232 f58 ^= *(int128 *) (pos55 + 0 + matrix)
# asm 1: pxor 0(<pos55=int64#14,<matrix=int64#4,1),<f58=int6464#3
# asm 2: pxor 0(<pos55=%rbx,<matrix=%rcx,1),<f58=%xmm2
pxor 0(%rbx,%rcx,1),%xmm2

# qhasm:  (uint32) pos57 >>= 2
# asm 1: shr  $2,<pos57=int64#7d
# asm 2: shr  $2,<pos57=%eax
shr  $2,%eax

# qhasm:  uint32323232 f57 ^= *(int128 *) (pos56 + 32 + matrix)
# asm 1: pxor 32(<pos56=int64#1,<matrix=int64#4,1),<f57=int6464#2
# asm 2: pxor 32(<pos56=%rdi,<matrix=%rcx,1),<f57=%xmm1
pxor 32(%rdi,%rcx,1),%xmm1

# qhasm:  (uint32) pos57 &= mask
# asm 1: andl <mask=int64#8d,<pos57=int64#7d
# asm 2: andl <mask=%r10d,<pos57=%eax
andl %r10d,%eax

# qhasm:  uint32323232 f56 ^= *(int128 *) (pos56 + 48 + matrix)
# asm 1: pxor 48(<pos56=int64#1,<matrix=int64#4,1),<f56=int6464#6
# asm 2: pxor 48(<pos56=%rdi,<matrix=%rcx,1),<f56=%xmm5
pxor 48(%rdi,%rcx,1),%xmm5

# qhasm:  pos7 = ((uint64 *)&state0)[0]
# asm 1: movq <state0=stack128#1,>pos7=int64#14
# asm 2: movq <state0=0(%rsp),>pos7=%rbx
movq 0(%rsp),%rbx

# qhasm:  v = f56
# asm 1: movdqa <f56=int6464#6,>v=int6464#1
# asm 2: movdqa <f56=%xmm5,>v=%xmm0
movdqa %xmm5,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#1
# asm 2: psrlq $61,<v=%xmm0
psrlq $61,%xmm0

# qhasm:  f60[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#1,>f60=int6464#5
# asm 2: pshufd $0x45,<v=%xmm0,>f60=%xmm4
pshufd $0x45,%xmm0,%xmm4

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#1
# asm 2: psrldq $8,<v=%xmm0
psrldq $8,%xmm0

# qhasm:  uint6464 f56 <<= 3
# asm 1: psllq $3,<f56=int6464#6
# asm 2: psllq $3,<f56=%xmm5
psllq $3,%xmm5

# qhasm:  uint32323232 f58 ^= *(int128 *) (pos56 + 16 + matrix)
# asm 1: pxor 16(<pos56=int64#1,<matrix=int64#4,1),<f58=int6464#3
# asm 2: pxor 16(<pos56=%rdi,<matrix=%rcx,1),<f58=%xmm2
pxor 16(%rdi,%rcx,1),%xmm2

# qhasm:  f60 ^= f56
# asm 1: pxor  <f56=int6464#6,<f60=int6464#5
# asm 2: pxor  <f56=%xmm5,<f60=%xmm4
pxor  %xmm5,%xmm4

# qhasm:  f59 ^= v
# asm 1: pxor  <v=int6464#1,<f59=int6464#4
# asm 2: pxor  <v=%xmm0,<f59=%xmm3
pxor  %xmm0,%xmm3

# qhasm:  (uint32) pos58 = pos63
# asm 1: mov  <pos63=int64#10d,>pos58=int64#11d
# asm 2: mov  <pos63=%r12d,>pos58=%r13d
mov  %r12d,%r13d

# qhasm:  uint32323232 f59 ^= *(int128 *) (pos56 + 0 + matrix)
# asm 1: pxor 0(<pos56=int64#1,<matrix=int64#4,1),<f59=int6464#4
# asm 2: pxor 0(<pos56=%rdi,<matrix=%rcx,1),<f59=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm:  (uint32) pos58 >>= 10
# asm 1: shr  $10,<pos58=int64#11d
# asm 2: shr  $10,<pos58=%r13d
shr  $10,%r13d

# qhasm:  uint32323232 f58 ^= *(int128 *) (pos57 + 32 + matrix)
# asm 1: pxor 32(<pos57=int64#7,<matrix=int64#4,1),<f58=int6464#3
# asm 2: pxor 32(<pos57=%rax,<matrix=%rcx,1),<f58=%xmm2
pxor 32(%rax,%rcx,1),%xmm2

# qhasm:  (uint32) pos58 &= mask
# asm 1: andl <mask=int64#8d,<pos58=int64#11d
# asm 2: andl <mask=%r10d,<pos58=%r13d
andl %r10d,%r13d

# qhasm:  uint32323232 f57 ^= *(int128 *) (pos57 + 48 + matrix)
# asm 1: pxor 48(<pos57=int64#7,<matrix=int64#4,1),<f57=int6464#2
# asm 2: pxor 48(<pos57=%rax,<matrix=%rcx,1),<f57=%xmm1
pxor 48(%rax,%rcx,1),%xmm1

# qhasm:  v = f57
# asm 1: movdqa <f57=int6464#2,>v=int6464#1
# asm 2: movdqa <f57=%xmm1,>v=%xmm0
movdqa %xmm1,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#1
# asm 2: psrlq $61,<v=%xmm0
psrlq $61,%xmm0

# qhasm:  f61[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#1,>f61=int6464#6
# asm 2: pshufd $0x45,<v=%xmm0,>f61=%xmm5
pshufd $0x45,%xmm0,%xmm5

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#1
# asm 2: psrldq $8,<v=%xmm0
psrldq $8,%xmm0

# qhasm:  uint6464 f57 <<= 3
# asm 1: psllq $3,<f57=int6464#2
# asm 2: psllq $3,<f57=%xmm1
psllq $3,%xmm1

# qhasm:  uint32323232 f59 ^= *(int128 *) (pos57 + 16 + matrix)
# asm 1: pxor 16(<pos57=int64#7,<matrix=int64#4,1),<f59=int6464#4
# asm 2: pxor 16(<pos57=%rax,<matrix=%rcx,1),<f59=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm:  f61 ^= f57
# asm 1: pxor  <f57=int6464#2,<f61=int6464#6
# asm 2: pxor  <f57=%xmm1,<f61=%xmm5
pxor  %xmm1,%xmm5

# qhasm:  f60 ^= v
# asm 1: pxor  <v=int6464#1,<f60=int6464#5
# asm 2: pxor  <v=%xmm0,<f60=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  (uint32) pos59 = pos63
# asm 1: mov  <pos63=int64#10d,>pos59=int64#12d
# asm 2: mov  <pos63=%r12d,>pos59=%r14d
mov  %r12d,%r14d

# qhasm:  uint32323232 f60 ^= *(int128 *) (pos57 + 0 + matrix)
# asm 1: pxor 0(<pos57=int64#7,<matrix=int64#4,1),<f60=int6464#5
# asm 2: pxor 0(<pos57=%rax,<matrix=%rcx,1),<f60=%xmm4
pxor 0(%rax,%rcx,1),%xmm4

# qhasm:  (uint32) pos59 >>= 18
# asm 1: shr  $18,<pos59=int64#12d
# asm 2: shr  $18,<pos59=%r14d
shr  $18,%r14d

# qhasm:  uint32323232 f59 ^= *(int128 *) (pos58 + 32 + matrix)
# asm 1: pxor 32(<pos58=int64#11,<matrix=int64#4,1),<f59=int6464#4
# asm 2: pxor 32(<pos58=%r13,<matrix=%rcx,1),<f59=%xmm3
pxor 32(%r13,%rcx,1),%xmm3

# qhasm:  (uint32) pos59 &= mask
# asm 1: andl <mask=int64#8d,<pos59=int64#12d
# asm 2: andl <mask=%r10d,<pos59=%r14d
andl %r10d,%r14d

# qhasm:  uint32323232 f58 ^= *(int128 *) (pos58 + 48 + matrix)
# asm 1: pxor 48(<pos58=int64#11,<matrix=int64#4,1),<f58=int6464#3
# asm 2: pxor 48(<pos58=%r13,<matrix=%rcx,1),<f58=%xmm2
pxor 48(%r13,%rcx,1),%xmm2

# qhasm:  v = f58
# asm 1: movdqa <f58=int6464#3,>v=int6464#1
# asm 2: movdqa <f58=%xmm2,>v=%xmm0
movdqa %xmm2,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#1
# asm 2: psrlq $61,<v=%xmm0
psrlq $61,%xmm0

# qhasm:  f62[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#1,>f62=int6464#2
# asm 2: pshufd $0x45,<v=%xmm0,>f62=%xmm1
pshufd $0x45,%xmm0,%xmm1

# qhasm:  (uint32) pos0 = pos7
# asm 1: mov  <pos7=int64#14d,>pos0=int64#13d
# asm 2: mov  <pos7=%ebx,>pos0=%r15d
mov  %ebx,%r15d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#1
# asm 2: psrldq $8,<v=%xmm0
psrldq $8,%xmm0

# qhasm:  (uint32) pos0 <<= 6
# asm 1: shl  $6,<pos0=int64#13d
# asm 2: shl  $6,<pos0=%r15d
shl  $6,%r15d

# qhasm:  uint6464 f58 <<= 3
# asm 1: psllq $3,<f58=int6464#3
# asm 2: psllq $3,<f58=%xmm2
psllq $3,%xmm2

# qhasm:  uint32323232 f60 ^= *(int128 *) (pos58 + 16 + matrix)
# asm 1: pxor 16(<pos58=int64#11,<matrix=int64#4,1),<f60=int6464#5
# asm 2: pxor 16(<pos58=%r13,<matrix=%rcx,1),<f60=%xmm4
pxor 16(%r13,%rcx,1),%xmm4

# qhasm:  (uint32) pos0 &= mask
# asm 1: andl <mask=int64#8d,<pos0=int64#13d
# asm 2: andl <mask=%r10d,<pos0=%r15d
andl %r10d,%r15d

# qhasm:  f62 ^= f58
# asm 1: pxor  <f58=int6464#3,<f62=int6464#2
# asm 2: pxor  <f58=%xmm2,<f62=%xmm1
pxor  %xmm2,%xmm1

# qhasm:  f61 ^= v
# asm 1: pxor  <v=int6464#1,<f61=int6464#6
# asm 2: pxor  <v=%xmm0,<f61=%xmm5
pxor  %xmm0,%xmm5

# qhasm:  pos60 = pos63
# asm 1: mov  <pos63=int64#10,>pos60=int64#7
# asm 2: mov  <pos63=%r12,>pos60=%rax
mov  %r12,%rax

# qhasm:  uint32323232 f61 ^= *(int128 *) (pos58 + 0 + matrix)
# asm 1: pxor 0(<pos58=int64#11,<matrix=int64#4,1),<f61=int6464#6
# asm 2: pxor 0(<pos58=%r13,<matrix=%rcx,1),<f61=%xmm5
pxor 0(%r13,%rcx,1),%xmm5

# qhasm:  (uint64) pos60 >>= 26
# asm 1: shr  $26,<pos60=int64#7
# asm 2: shr  $26,<pos60=%rax
shr  $26,%rax

# qhasm:  uint32323232 f60 ^= *(int128 *) (pos59 + 32 + matrix)
# asm 1: pxor 32(<pos59=int64#12,<matrix=int64#4,1),<f60=int6464#5
# asm 2: pxor 32(<pos59=%r14,<matrix=%rcx,1),<f60=%xmm4
pxor 32(%r14,%rcx,1),%xmm4

# qhasm:  (uint32) pos60 &= mask
# asm 1: andl <mask=int64#8d,<pos60=int64#7d
# asm 2: andl <mask=%r10d,<pos60=%eax
andl %r10d,%eax

# qhasm:  assign 7 to pos60

# qhasm:  uint32323232 f59 ^= *(int128 *) (pos59 + 48 + matrix)
# asm 1: pxor 48(<pos59=int64#12,<matrix=int64#4,1),<f59=int6464#4
# asm 2: pxor 48(<pos59=%r14,<matrix=%rcx,1),<f59=%xmm3
pxor 48(%r14,%rcx,1),%xmm3

# qhasm:  v = f59
# asm 1: movdqa <f59=int6464#4,>v=int6464#1
# asm 2: movdqa <f59=%xmm3,>v=%xmm0
movdqa %xmm3,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#1
# asm 2: psrlq $61,<v=%xmm0
psrlq $61,%xmm0

# qhasm:  f0 = *(int128 *) (pos0 + 48 + matrix)
# asm 1: movdqa 48(<pos0=int64#13,<matrix=int64#4),>f0=int6464#3
# asm 2: movdqa 48(<pos0=%r15,<matrix=%rcx),>f0=%xmm2
movdqa 48(%r15,%rcx),%xmm2

# qhasm:  f63[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#1,>f63=int6464#7
# asm 2: pshufd $0x45,<v=%xmm0,>f63=%xmm6
pshufd $0x45,%xmm0,%xmm6

# qhasm:  (uint32) pos1 = pos7
# asm 1: mov  <pos7=int64#14d,>pos1=int64#11d
# asm 2: mov  <pos7=%ebx,>pos1=%r13d
mov  %ebx,%r13d

# qhasm:  f1 = *(int128 *) (pos0 + 32 + matrix)
# asm 1: movdqa 32(<pos0=int64#13,<matrix=int64#4),>f1=int6464#8
# asm 2: movdqa 32(<pos0=%r15,<matrix=%rcx),>f1=%xmm7
movdqa 32(%r15,%rcx),%xmm7

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#1
# asm 2: psrldq $8,<v=%xmm0
psrldq $8,%xmm0

# qhasm:  (uint32) pos1 >>= 2
# asm 1: shr  $2,<pos1=int64#11d
# asm 2: shr  $2,<pos1=%r13d
shr  $2,%r13d

# qhasm:  f2 = *(int128 *) (pos0 + 16 + matrix)
# asm 1: movdqa 16(<pos0=int64#13,<matrix=int64#4),>f2=int6464#9
# asm 2: movdqa 16(<pos0=%r15,<matrix=%rcx),>f2=%xmm8
movdqa 16(%r15,%rcx),%xmm8

# qhasm:  uint6464 f59 <<= 3
# asm 1: psllq $3,<f59=int6464#4
# asm 2: psllq $3,<f59=%xmm3
psllq $3,%xmm3

# qhasm:  uint32323232 f61 ^= *(int128 *) (pos59 + 16 + matrix)
# asm 1: pxor 16(<pos59=int64#12,<matrix=int64#4,1),<f61=int6464#6
# asm 2: pxor 16(<pos59=%r14,<matrix=%rcx,1),<f61=%xmm5
pxor 16(%r14,%rcx,1),%xmm5

# qhasm:  (uint32) pos1 &= mask
# asm 1: andl <mask=int64#8d,<pos1=int64#11d
# asm 2: andl <mask=%r10d,<pos1=%r13d
andl %r10d,%r13d

# qhasm:  f63 ^= f59
# asm 1: pxor  <f59=int6464#4,<f63=int6464#7
# asm 2: pxor  <f59=%xmm3,<f63=%xmm6
pxor  %xmm3,%xmm6

# qhasm:  uint32323232 f1 ^= *(int128 *) (pos1 + 48 + matrix)
# asm 1: pxor 48(<pos1=int64#11,<matrix=int64#4,1),<f1=int6464#8
# asm 2: pxor 48(<pos1=%r13,<matrix=%rcx,1),<f1=%xmm7
pxor 48(%r13,%rcx,1),%xmm7

# qhasm:  f62 ^= v
# asm 1: pxor  <v=int6464#1,<f62=int6464#2
# asm 2: pxor  <v=%xmm0,<f62=%xmm1
pxor  %xmm0,%xmm1

# qhasm:  pos61 = pos63
# asm 1: mov  <pos63=int64#10,>pos61=int64#1
# asm 2: mov  <pos63=%r12,>pos61=%rdi
mov  %r12,%rdi

# qhasm:  uint32323232 f62 ^= *(int128 *) (pos59 + 0 + matrix)
# asm 1: pxor 0(<pos59=int64#12,<matrix=int64#4,1),<f62=int6464#2
# asm 2: pxor 0(<pos59=%r14,<matrix=%rcx,1),<f62=%xmm1
pxor 0(%r14,%rcx,1),%xmm1

# qhasm:  (uint64) pos61 >>= 34
# asm 1: shr  $34,<pos61=int64#1
# asm 2: shr  $34,<pos61=%rdi
shr  $34,%rdi

# qhasm:  uint32323232 f61 ^= *(int128 *) (pos60 + 32 + matrix)
# asm 1: pxor 32(<pos60=int64#7,<matrix=int64#4,1),<f61=int6464#6
# asm 2: pxor 32(<pos60=%rax,<matrix=%rcx,1),<f61=%xmm5
pxor 32(%rax,%rcx,1),%xmm5

# qhasm:  (uint32) pos61 &= mask
# asm 1: andl <mask=int64#8d,<pos61=int64#1d
# asm 2: andl <mask=%r10d,<pos61=%edi
andl %r10d,%edi

# qhasm:  assign 1 to pos61

# qhasm:  uint32323232 f60 ^= *(int128 *) (pos60 + 48 + matrix)
# asm 1: pxor 48(<pos60=int64#7,<matrix=int64#4,1),<f60=int6464#5
# asm 2: pxor 48(<pos60=%rax,<matrix=%rcx,1),<f60=%xmm4
pxor 48(%rax,%rcx,1),%xmm4

# qhasm:  v = f60
# asm 1: movdqa <f60=int6464#5,>v=int6464#1
# asm 2: movdqa <f60=%xmm4,>v=%xmm0
movdqa %xmm4,%xmm0

# qhasm:  f3 = *(int128 *) (pos0 + 0 + matrix)
# asm 1: movdqa 0(<pos0=int64#13,<matrix=int64#4),>f3=int6464#4
# asm 2: movdqa 0(<pos0=%r15,<matrix=%rcx),>f3=%xmm3
movdqa 0(%r15,%rcx),%xmm3

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#1
# asm 2: psrlq $61,<v=%xmm0
psrlq $61,%xmm0

# qhasm:  f64[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#1,>f64=int6464#10
# asm 2: pshufd $0x45,<v=%xmm0,>f64=%xmm9
pshufd $0x45,%xmm0,%xmm9

# qhasm:  uint32323232 f2 ^= *(int128 *) (pos1 + 32 + matrix)
# asm 1: pxor 32(<pos1=int64#11,<matrix=int64#4,1),<f2=int6464#9
# asm 2: pxor 32(<pos1=%r13,<matrix=%rcx,1),<f2=%xmm8
pxor 32(%r13,%rcx,1),%xmm8

# qhasm:  (uint32) pos2 = pos7
# asm 1: mov  <pos7=int64#14d,>pos2=int64#12d
# asm 2: mov  <pos7=%ebx,>pos2=%r14d
mov  %ebx,%r14d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#1
# asm 2: psrldq $8,<v=%xmm0
psrldq $8,%xmm0

# qhasm:  (uint32) pos2 >>= 10
# asm 1: shr  $10,<pos2=int64#12d
# asm 2: shr  $10,<pos2=%r14d
shr  $10,%r14d

# qhasm:  uint6464 f60 <<= 3
# asm 1: psllq $3,<f60=int6464#5
# asm 2: psllq $3,<f60=%xmm4
psllq $3,%xmm4

# qhasm:  uint32323232 f62 ^= *(int128 *) (pos60 + 16 + matrix)
# asm 1: pxor 16(<pos60=int64#7,<matrix=int64#4,1),<f62=int6464#2
# asm 2: pxor 16(<pos60=%rax,<matrix=%rcx,1),<f62=%xmm1
pxor 16(%rax,%rcx,1),%xmm1

# qhasm:  (uint32) pos2 &= mask
# asm 1: andl <mask=int64#8d,<pos2=int64#12d
# asm 2: andl <mask=%r10d,<pos2=%r14d
andl %r10d,%r14d

# qhasm:  f64 ^= f60
# asm 1: pxor  <f60=int6464#5,<f64=int6464#10
# asm 2: pxor  <f60=%xmm4,<f64=%xmm9
pxor  %xmm4,%xmm9

# qhasm:  f63 ^= v
# asm 1: pxor  <v=int6464#1,<f63=int6464#7
# asm 2: pxor  <v=%xmm0,<f63=%xmm6
pxor  %xmm0,%xmm6

# qhasm:  uint32323232 f63 ^= *(int128 *) (pos60 + 0 + matrix)
# asm 1: pxor 0(<pos60=int64#7,<matrix=int64#4,1),<f63=int6464#7
# asm 2: pxor 0(<pos60=%rax,<matrix=%rcx,1),<f63=%xmm6
pxor 0(%rax,%rcx,1),%xmm6

# qhasm:  pos71 = *(int64 *) (bp + 0)
# asm 1: movq   0(<bp=int64#2),>pos71=int64#13
# asm 2: movq   0(<bp=%rsi),>pos71=%r15
movq   0(%rsi),%r15

# qhasm:  pos62 = pos63
# asm 1: mov  <pos63=int64#10,>pos62=int64#15
# asm 2: mov  <pos63=%r12,>pos62=%rbp
mov  %r12,%rbp

# qhasm:  (uint64) pos62 >>= 42
# asm 1: shr  $42,<pos62=int64#15
# asm 2: shr  $42,<pos62=%rbp
shr  $42,%rbp

# qhasm:  uint32323232 f62 ^= *(int128 *) (pos61 + 32 + matrix)
# asm 1: pxor 32(<pos61=int64#1,<matrix=int64#4,1),<f62=int6464#2
# asm 2: pxor 32(<pos61=%rdi,<matrix=%rcx,1),<f62=%xmm1
pxor 32(%rdi,%rcx,1),%xmm1

# qhasm:  (uint32) pos62 &= mask
# asm 1: andl <mask=int64#8d,<pos62=int64#15d
# asm 2: andl <mask=%r10d,<pos62=%ebp
andl %r10d,%ebp

# qhasm:  w = f0
# asm 1: movdqa <f0=int6464#3,>w=int6464#1
# asm 2: movdqa <f0=%xmm2,>w=%xmm0
movdqa %xmm2,%xmm0

# qhasm:  f0 >>= 80
# asm 1: psrldq $10,<f0=int6464#3
# asm 2: psrldq $10,<f0=%xmm2
psrldq $10,%xmm2

# qhasm:  uint32323232 f3 ^= *(int128 *) (pos1 + 16 + matrix)
# asm 1: pxor 16(<pos1=int64#11,<matrix=int64#4,1),<f3=int6464#4
# asm 2: pxor 16(<pos1=%r13,<matrix=%rcx,1),<f3=%xmm3
pxor 16(%r13,%rcx,1),%xmm3

# qhasm:  assign 15 to pos62

# qhasm:  w <<= 48
# asm 1: pslldq $6,<w=int6464#1
# asm 2: pslldq $6,<w=%xmm0
pslldq $6,%xmm0

# qhasm:  f63 ^= f0
# asm 1: pxor  <f0=int6464#3,<f63=int6464#7
# asm 2: pxor  <f0=%xmm2,<f63=%xmm6
pxor  %xmm2,%xmm6

# qhasm:  f64 ^= w
# asm 1: pxor  <w=int6464#1,<f64=int6464#10
# asm 2: pxor  <w=%xmm0,<f64=%xmm9
pxor  %xmm0,%xmm9

# qhasm:  uint32323232 f61 ^= *(int128 *) (pos61 + 48 + matrix)
# asm 1: pxor 48(<pos61=int64#1,<matrix=int64#4,1),<f61=int6464#6
# asm 2: pxor 48(<pos61=%rdi,<matrix=%rcx,1),<f61=%xmm5
pxor 48(%rdi,%rcx,1),%xmm5

# qhasm:  v = f61
# asm 1: movdqa <f61=int6464#6,>v=int6464#1
# asm 2: movdqa <f61=%xmm5,>v=%xmm0
movdqa %xmm5,%xmm0

# qhasm:  f4 = *(int128 *) (pos1 + 0 + matrix)
# asm 1: movdqa 0(<pos1=int64#11,<matrix=int64#4),>f4=int6464#3
# asm 2: movdqa 0(<pos1=%r13,<matrix=%rcx),>f4=%xmm2
movdqa 0(%r13,%rcx),%xmm2

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#1
# asm 2: psrlq $61,<v=%xmm0
psrlq $61,%xmm0

# qhasm:  f65[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#1,>f65=int6464#5
# asm 2: pshufd $0x45,<v=%xmm0,>f65=%xmm4
pshufd $0x45,%xmm0,%xmm4

# qhasm:  (uint32) pos3 = pos7
# asm 1: mov  <pos7=int64#14d,>pos3=int64#11d
# asm 2: mov  <pos7=%ebx,>pos3=%r13d
mov  %ebx,%r13d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#1
# asm 2: psrldq $8,<v=%xmm0
psrldq $8,%xmm0

# qhasm:  (uint32) pos3 >>= 18
# asm 1: shr  $18,<pos3=int64#11d
# asm 2: shr  $18,<pos3=%r13d
shr  $18,%r13d

# qhasm:  uint6464 f61 <<= 3
# asm 1: psllq $3,<f61=int6464#6
# asm 2: psllq $3,<f61=%xmm5
psllq $3,%xmm5

# qhasm:  uint32323232 f63 ^= *(int128 *) (pos61 + 16 + matrix)
# asm 1: pxor 16(<pos61=int64#1,<matrix=int64#4,1),<f63=int6464#7
# asm 2: pxor 16(<pos61=%rdi,<matrix=%rcx,1),<f63=%xmm6
pxor 16(%rdi,%rcx,1),%xmm6

# qhasm:  (uint32) pos3 &= mask
# asm 1: andl <mask=int64#8d,<pos3=int64#11d
# asm 2: andl <mask=%r10d,<pos3=%r13d
andl %r10d,%r13d

# qhasm:  f65 ^= f61
# asm 1: pxor  <f61=int6464#6,<f65=int6464#5
# asm 2: pxor  <f61=%xmm5,<f65=%xmm4
pxor  %xmm5,%xmm4

# qhasm:  f64 ^= v
# asm 1: pxor  <v=int6464#1,<f64=int6464#10
# asm 2: pxor  <v=%xmm0,<f64=%xmm9
pxor  %xmm0,%xmm9

# qhasm:  uint32323232 f64 ^= *(int128 *) (pos61 + 0 + matrix)
# asm 1: pxor 0(<pos61=int64#1,<matrix=int64#4,1),<f64=int6464#10
# asm 2: pxor 0(<pos61=%rdi,<matrix=%rcx,1),<f64=%xmm9
pxor 0(%rdi,%rcx,1),%xmm9

# qhasm:  (uint64) pos63 >>= 50
# asm 1: shr  $50,<pos63=int64#10
# asm 2: shr  $50,<pos63=%r12
shr  $50,%r12

# qhasm:  uint32323232 f3 ^= *(int128 *) (pos2 + 32 + matrix)
# asm 1: pxor 32(<pos2=int64#12,<matrix=int64#4,1),<f3=int6464#4
# asm 2: pxor 32(<pos2=%r14,<matrix=%rcx,1),<f3=%xmm3
pxor 32(%r14,%rcx,1),%xmm3

# qhasm:  (uint32) pos63 &= mask
# asm 1: andl <mask=int64#8d,<pos63=int64#10d
# asm 2: andl <mask=%r10d,<pos63=%r12d
andl %r10d,%r12d

# qhasm:  w = f1
# asm 1: movdqa <f1=int6464#8,>w=int6464#1
# asm 2: movdqa <f1=%xmm7,>w=%xmm0
movdqa %xmm7,%xmm0

# qhasm:  f1 >>= 80
# asm 1: psrldq $10,<f1=int6464#8
# asm 2: psrldq $10,<f1=%xmm7
psrldq $10,%xmm7

# qhasm:  uint32323232 f4 ^= *(int128 *) (pos2 + 16 + matrix)
# asm 1: pxor 16(<pos2=int64#12,<matrix=int64#4,1),<f4=int6464#3
# asm 2: pxor 16(<pos2=%r14,<matrix=%rcx,1),<f4=%xmm2
pxor 16(%r14,%rcx,1),%xmm2

# qhasm:  assign 14 to pos63

# qhasm:  w <<= 48
# asm 1: pslldq $6,<w=int6464#1
# asm 2: pslldq $6,<w=%xmm0
pslldq $6,%xmm0

# qhasm:  uint32323232 f2 ^= *(int128 *) (pos2 + 48 + matrix)
# asm 1: pxor 48(<pos2=int64#12,<matrix=int64#4,1),<f2=int6464#9
# asm 2: pxor 48(<pos2=%r14,<matrix=%rcx,1),<f2=%xmm8
pxor 48(%r14,%rcx,1),%xmm8

# qhasm:  f64 ^= f1
# asm 1: pxor  <f1=int6464#8,<f64=int6464#10
# asm 2: pxor  <f1=%xmm7,<f64=%xmm9
pxor  %xmm7,%xmm9

# qhasm:  f65 ^= w
# asm 1: pxor  <w=int6464#1,<f65=int6464#5
# asm 2: pxor  <w=%xmm0,<f65=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  uint32323232 f62 ^= *(int128 *) (pos62 + 48 + matrix)
# asm 1: pxor 48(<pos62=int64#15,<matrix=int64#4,1),<f62=int6464#2
# asm 2: pxor 48(<pos62=%rbp,<matrix=%rcx,1),<f62=%xmm1
pxor 48(%rbp,%rcx,1),%xmm1

# qhasm:  v = f62
# asm 1: movdqa <f62=int6464#2,>v=int6464#1
# asm 2: movdqa <f62=%xmm1,>v=%xmm0
movdqa %xmm1,%xmm0

# qhasm:  f5 = *(int128 *) (pos2 + 0 + matrix)
# asm 1: movdqa 0(<pos2=int64#12,<matrix=int64#4),>f5=int6464#6
# asm 2: movdqa 0(<pos2=%r14,<matrix=%rcx),>f5=%xmm5
movdqa 0(%r14,%rcx),%xmm5

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#1
# asm 2: psrlq $61,<v=%xmm0
psrlq $61,%xmm0

# qhasm:  f66[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#1,>f66=int6464#8
# asm 2: pshufd $0x45,<v=%xmm0,>f66=%xmm7
pshufd $0x45,%xmm0,%xmm7

# qhasm:  pos4 = pos7
# asm 1: mov  <pos7=int64#14,>pos4=int64#7
# asm 2: mov  <pos7=%rbx,>pos4=%rax
mov  %rbx,%rax

# qhasm:  uint32323232 f63 ^= *(int128 *) (pos62 + 32 + matrix)
# asm 1: pxor 32(<pos62=int64#15,<matrix=int64#4,1),<f63=int6464#7
# asm 2: pxor 32(<pos62=%rbp,<matrix=%rcx,1),<f63=%xmm6
pxor 32(%rbp,%rcx,1),%xmm6

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#1
# asm 2: psrldq $8,<v=%xmm0
psrldq $8,%xmm0

# qhasm:  (uint64) pos4 >>= 26
# asm 1: shr  $26,<pos4=int64#7
# asm 2: shr  $26,<pos4=%rax
shr  $26,%rax

# qhasm:  uint6464 f62 <<= 3
# asm 1: psllq $3,<f62=int6464#2
# asm 2: psllq $3,<f62=%xmm1
psllq $3,%xmm1

# qhasm:  uint32323232 f64 ^= *(int128 *) (pos62 + 16 + matrix)
# asm 1: pxor 16(<pos62=int64#15,<matrix=int64#4,1),<f64=int6464#10
# asm 2: pxor 16(<pos62=%rbp,<matrix=%rcx,1),<f64=%xmm9
pxor 16(%rbp,%rcx,1),%xmm9

# qhasm:  (uint32) pos4 &= mask
# asm 1: andl <mask=int64#8d,<pos4=int64#7d
# asm 2: andl <mask=%r10d,<pos4=%eax
andl %r10d,%eax

# qhasm:  f66 ^= f62
# asm 1: pxor  <f62=int6464#2,<f66=int6464#8
# asm 2: pxor  <f62=%xmm1,<f66=%xmm7
pxor  %xmm1,%xmm7

# qhasm:  assign 7 to pos4

# qhasm:  f65 ^= v
# asm 1: pxor  <v=int6464#1,<f65=int6464#5
# asm 2: pxor  <v=%xmm0,<f65=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  uint32323232 f65 ^= *(int128 *) (pos62 + 0 + matrix)
# asm 1: pxor 0(<pos62=int64#15,<matrix=int64#4,1),<f65=int6464#5
# asm 2: pxor 0(<pos62=%rbp,<matrix=%rcx,1),<f65=%xmm4
pxor 0(%rbp,%rcx,1),%xmm4

# qhasm:  (uint32) pos64 = pos71
# asm 1: mov  <pos71=int64#13d,>pos64=int64#12d
# asm 2: mov  <pos71=%r15d,>pos64=%r14d
mov  %r15d,%r14d

# qhasm:  uint32323232 f3 ^= *(int128 *) (pos3 + 48 + matrix)
# asm 1: pxor 48(<pos3=int64#11,<matrix=int64#4,1),<f3=int6464#4
# asm 2: pxor 48(<pos3=%r13,<matrix=%rcx,1),<f3=%xmm3
pxor 48(%r13,%rcx,1),%xmm3

# qhasm:  (uint32) pos64 <<= 6
# asm 1: shl  $6,<pos64=int64#12d
# asm 2: shl  $6,<pos64=%r14d
shl  $6,%r14d

# qhasm:  f67 = f3
# asm 1: movdqa <f3=int6464#4,>f67=int6464#1
# asm 2: movdqa <f3=%xmm3,>f67=%xmm0
movdqa %xmm3,%xmm0

# qhasm:  uint32323232 f4 ^= *(int128 *) (pos3 + 32 + matrix)
# asm 1: pxor 32(<pos3=int64#11,<matrix=int64#4,1),<f4=int6464#3
# asm 2: pxor 32(<pos3=%r13,<matrix=%rcx,1),<f4=%xmm2
pxor 32(%r13,%rcx,1),%xmm2

# qhasm:  (uint32) pos64 &= mask
# asm 1: andl <mask=int64#8d,<pos64=int64#12d
# asm 2: andl <mask=%r10d,<pos64=%r14d
andl %r10d,%r14d

# qhasm:  w = f2
# asm 1: movdqa <f2=int6464#9,>w=int6464#2
# asm 2: movdqa <f2=%xmm8,>w=%xmm1
movdqa %xmm8,%xmm1

# qhasm:  f2 >>= 80
# asm 1: psrldq $10,<f2=int6464#9
# asm 2: psrldq $10,<f2=%xmm8
psrldq $10,%xmm8

# qhasm:  uint32323232 f5 ^= *(int128 *) (pos3 + 16 + matrix)
# asm 1: pxor 16(<pos3=int64#11,<matrix=int64#4,1),<f5=int6464#6
# asm 2: pxor 16(<pos3=%r13,<matrix=%rcx,1),<f5=%xmm5
pxor 16(%r13,%rcx,1),%xmm5

# qhasm:  w <<= 48
# asm 1: pslldq $6,<w=int6464#2
# asm 2: pslldq $6,<w=%xmm1
pslldq $6,%xmm1

# qhasm:  f67 <<= 48
# asm 1: pslldq $6,<f67=int6464#1
# asm 2: pslldq $6,<f67=%xmm0
pslldq $6,%xmm0

# qhasm:  f65 ^= f2
# asm 1: pxor  <f2=int6464#9,<f65=int6464#5
# asm 2: pxor  <f2=%xmm8,<f65=%xmm4
pxor  %xmm8,%xmm4

# qhasm:  f66 ^= w
# asm 1: pxor  <w=int6464#2,<f66=int6464#8
# asm 2: pxor  <w=%xmm1,<f66=%xmm7
pxor  %xmm1,%xmm7

# qhasm:  uint32323232 f63 ^= *(int128 *) (pos63 + 48 + matrix)
# asm 1: pxor 48(<pos63=int64#10,<matrix=int64#4,1),<f63=int6464#7
# asm 2: pxor 48(<pos63=%r12,<matrix=%rcx,1),<f63=%xmm6
pxor 48(%r12,%rcx,1),%xmm6

# qhasm:  v = f63
# asm 1: movdqa <f63=int6464#7,>v=int6464#2
# asm 2: movdqa <f63=%xmm6,>v=%xmm1
movdqa %xmm6,%xmm1

# qhasm:  f6 = *(int128 *) (pos3 + 0 + matrix)
# asm 1: movdqa 0(<pos3=int64#11,<matrix=int64#4),>f6=int6464#9
# asm 2: movdqa 0(<pos3=%r13,<matrix=%rcx),>f6=%xmm8
movdqa 0(%r13,%rcx),%xmm8

# qhasm:  uint6464 f63 <<= 3
# asm 1: psllq $3,<f63=int6464#7
# asm 2: psllq $3,<f63=%xmm6
psllq $3,%xmm6

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#2
# asm 2: psrlq $61,<v=%xmm1
psrlq $61,%xmm1

# qhasm:  pos5 = pos7
# asm 1: mov  <pos7=int64#14,>pos5=int64#1
# asm 2: mov  <pos7=%rbx,>pos5=%rdi
mov  %rbx,%rdi

# qhasm:  uint32323232 f64 ^= *(int128 *) (pos63 + 32 + matrix)
# asm 1: pxor 32(<pos63=int64#10,<matrix=int64#4,1),<f64=int6464#10
# asm 2: pxor 32(<pos63=%r12,<matrix=%rcx,1),<f64=%xmm9
pxor 32(%r12,%rcx,1),%xmm9

# qhasm:  f67 ^= f63
# asm 1: pxor  <f63=int6464#7,<f67=int6464#1
# asm 2: pxor  <f63=%xmm6,<f67=%xmm0
pxor  %xmm6,%xmm0

# qhasm:  (uint64) pos5 >>= 34
# asm 1: shr  $34,<pos5=int64#1
# asm 2: shr  $34,<pos5=%rdi
shr  $34,%rdi

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#2,>w=int6464#7
# asm 2: pshufd $0x45,<v=%xmm1,>w=%xmm6
pshufd $0x45,%xmm1,%xmm6

# qhasm:  uint32323232 f65 ^= *(int128 *) (pos63 + 16 + matrix)
# asm 1: pxor 16(<pos63=int64#10,<matrix=int64#4,1),<f65=int6464#5
# asm 2: pxor 16(<pos63=%r12,<matrix=%rcx,1),<f65=%xmm4
pxor 16(%r12,%rcx,1),%xmm4

# qhasm:  (uint32) pos5 &= mask
# asm 1: andl <mask=int64#8d,<pos5=int64#1d
# asm 2: andl <mask=%r10d,<pos5=%edi
andl %r10d,%edi

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#2
# asm 2: psrldq $8,<v=%xmm1
psrldq $8,%xmm1

# qhasm:  assign 1 to pos5

# qhasm:  f67 ^= w
# asm 1: pxor  <w=int6464#7,<f67=int6464#1
# asm 2: pxor  <w=%xmm6,<f67=%xmm0
pxor  %xmm6,%xmm0

# qhasm:  uint32323232 f66 ^= *(int128 *) (pos63 + 0 + matrix)
# asm 1: pxor 0(<pos63=int64#10,<matrix=int64#4,1),<f66=int6464#8
# asm 2: pxor 0(<pos63=%r12,<matrix=%rcx,1),<f66=%xmm7
pxor 0(%r12,%rcx,1),%xmm7

# qhasm:  f66 ^= v
# asm 1: pxor  <v=int6464#2,<f66=int6464#8
# asm 2: pxor  <v=%xmm1,<f66=%xmm7
pxor  %xmm1,%xmm7

# qhasm:  (uint32) pos65 = pos71
# asm 1: mov  <pos71=int64#13d,>pos65=int64#10d
# asm 2: mov  <pos71=%r15d,>pos65=%r12d
mov  %r15d,%r12d

# qhasm:  uint32323232 f4 ^= *(int128 *) (pos4 + 48 + matrix)
# asm 1: pxor 48(<pos4=int64#7,<matrix=int64#4,1),<f4=int6464#3
# asm 2: pxor 48(<pos4=%rax,<matrix=%rcx,1),<f4=%xmm2
pxor 48(%rax,%rcx,1),%xmm2

# qhasm:  (uint32) pos65 >>= 2
# asm 1: shr  $2,<pos65=int64#10d
# asm 2: shr  $2,<pos65=%r12d
shr  $2,%r12d

# qhasm:  f68 = f4
# asm 1: movdqa <f4=int6464#3,>f68=int6464#2
# asm 2: movdqa <f4=%xmm2,>f68=%xmm1
movdqa %xmm2,%xmm1

# qhasm:  uint32323232 f5 ^= *(int128 *) (pos4 + 32 + matrix)
# asm 1: pxor 32(<pos4=int64#7,<matrix=int64#4,1),<f5=int6464#6
# asm 2: pxor 32(<pos4=%rax,<matrix=%rcx,1),<f5=%xmm5
pxor 32(%rax,%rcx,1),%xmm5

# qhasm:  (uint32) pos65 &= mask
# asm 1: andl <mask=int64#8d,<pos65=int64#10d
# asm 2: andl <mask=%r10d,<pos65=%r12d
andl %r10d,%r12d

# qhasm:  f3 >>= 80
# asm 1: psrldq $10,<f3=int6464#4
# asm 2: psrldq $10,<f3=%xmm3
psrldq $10,%xmm3

# qhasm:  uint32323232 f6 ^= *(int128 *) (pos4 + 16 + matrix)
# asm 1: pxor 16(<pos4=int64#7,<matrix=int64#4,1),<f6=int6464#9
# asm 2: pxor 16(<pos4=%rax,<matrix=%rcx,1),<f6=%xmm8
pxor 16(%rax,%rcx,1),%xmm8

# qhasm:  f68 <<= 48
# asm 1: pslldq $6,<f68=int6464#2
# asm 2: pslldq $6,<f68=%xmm1
pslldq $6,%xmm1

# qhasm:  f66 ^= f3
# asm 1: pxor  <f3=int6464#4,<f66=int6464#8
# asm 2: pxor  <f3=%xmm3,<f66=%xmm7
pxor  %xmm3,%xmm7

# qhasm:  uint32323232 f64 ^= *(int128 *) (pos64 + 48 + matrix)
# asm 1: pxor 48(<pos64=int64#12,<matrix=int64#4,1),<f64=int6464#10
# asm 2: pxor 48(<pos64=%r14,<matrix=%rcx,1),<f64=%xmm9
pxor 48(%r14,%rcx,1),%xmm9

# qhasm:  pos15 = ((uint64 *)&state0)[1]
# asm 1: movq 8+<state0=stack128#1,>pos15=int64#11
# asm 2: movq 8+<state0=0(%rsp),>pos15=%r13
movq 8+0(%rsp),%r13

# qhasm:  v = f64
# asm 1: movdqa <f64=int6464#10,>v=int6464#4
# asm 2: movdqa <f64=%xmm9,>v=%xmm3
movdqa %xmm9,%xmm3

# qhasm:  f7 = *(int128 *) (pos4 + 0 + matrix)
# asm 1: movdqa 0(<pos4=int64#7,<matrix=int64#4),>f7=int6464#7
# asm 2: movdqa 0(<pos4=%rax,<matrix=%rcx),>f7=%xmm6
movdqa 0(%rax,%rcx),%xmm6

# qhasm:  uint6464 f64 <<= 3
# asm 1: psllq $3,<f64=int6464#10
# asm 2: psllq $3,<f64=%xmm9
psllq $3,%xmm9

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#4
# asm 2: psrlq $61,<v=%xmm3
psrlq $61,%xmm3

# qhasm:  pos6 = pos7
# asm 1: mov  <pos7=int64#14,>pos6=int64#15
# asm 2: mov  <pos7=%rbx,>pos6=%rbp
mov  %rbx,%rbp

# qhasm:  uint32323232 f65 ^= *(int128 *) (pos64 + 32 + matrix)
# asm 1: pxor 32(<pos64=int64#12,<matrix=int64#4,1),<f65=int6464#5
# asm 2: pxor 32(<pos64=%r14,<matrix=%rcx,1),<f65=%xmm4
pxor 32(%r14,%rcx,1),%xmm4

# qhasm:  f68 ^= f64
# asm 1: pxor  <f64=int6464#10,<f68=int6464#2
# asm 2: pxor  <f64=%xmm9,<f68=%xmm1
pxor  %xmm9,%xmm1

# qhasm:  (uint64) pos6 >>= 42
# asm 1: shr  $42,<pos6=int64#15
# asm 2: shr  $42,<pos6=%rbp
shr  $42,%rbp

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#4,>w=int6464#10
# asm 2: pshufd $0x45,<v=%xmm3,>w=%xmm9
pshufd $0x45,%xmm3,%xmm9

# qhasm:  uint32323232 f66 ^= *(int128 *) (pos64 + 16 + matrix)
# asm 1: pxor 16(<pos64=int64#12,<matrix=int64#4,1),<f66=int6464#8
# asm 2: pxor 16(<pos64=%r14,<matrix=%rcx,1),<f66=%xmm7
pxor 16(%r14,%rcx,1),%xmm7

# qhasm:  (uint32) pos6 &= mask
# asm 1: andl <mask=int64#8d,<pos6=int64#15d
# asm 2: andl <mask=%r10d,<pos6=%ebp
andl %r10d,%ebp

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#4
# asm 2: psrldq $8,<v=%xmm3
psrldq $8,%xmm3

# qhasm:  assign 15 to pos6

# qhasm:  f68 ^= w
# asm 1: pxor  <w=int6464#10,<f68=int6464#2
# asm 2: pxor  <w=%xmm9,<f68=%xmm1
pxor  %xmm9,%xmm1

# qhasm:  uint32323232 f67 ^= *(int128 *) (pos64 + 0 + matrix)
# asm 1: pxor 0(<pos64=int64#12,<matrix=int64#4,1),<f67=int6464#1
# asm 2: pxor 0(<pos64=%r14,<matrix=%rcx,1),<f67=%xmm0
pxor 0(%r14,%rcx,1),%xmm0

# qhasm:  f67 ^= v
# asm 1: pxor  <v=int6464#4,<f67=int6464#1
# asm 2: pxor  <v=%xmm3,<f67=%xmm0
pxor  %xmm3,%xmm0

# qhasm:  (uint32) pos66 = pos71
# asm 1: mov  <pos71=int64#13d,>pos66=int64#7d
# asm 2: mov  <pos71=%r15d,>pos66=%eax
mov  %r15d,%eax

# qhasm:  uint32323232 f5 ^= *(int128 *) (pos5 + 48 + matrix)
# asm 1: pxor 48(<pos5=int64#1,<matrix=int64#4,1),<f5=int6464#6
# asm 2: pxor 48(<pos5=%rdi,<matrix=%rcx,1),<f5=%xmm5
pxor 48(%rdi,%rcx,1),%xmm5

# qhasm:  (uint32) pos66 >>= 10
# asm 1: shr  $10,<pos66=int64#7d
# asm 2: shr  $10,<pos66=%eax
shr  $10,%eax

# qhasm:  f69 = f5
# asm 1: movdqa <f5=int6464#6,>f69=int6464#4
# asm 2: movdqa <f5=%xmm5,>f69=%xmm3
movdqa %xmm5,%xmm3

# qhasm:  uint32323232 f6 ^= *(int128 *) (pos5 + 32 + matrix)
# asm 1: pxor 32(<pos5=int64#1,<matrix=int64#4,1),<f6=int6464#9
# asm 2: pxor 32(<pos5=%rdi,<matrix=%rcx,1),<f6=%xmm8
pxor 32(%rdi,%rcx,1),%xmm8

# qhasm:  (uint32) pos66 &= mask
# asm 1: andl <mask=int64#8d,<pos66=int64#7d
# asm 2: andl <mask=%r10d,<pos66=%eax
andl %r10d,%eax

# qhasm:  f4 >>= 80
# asm 1: psrldq $10,<f4=int6464#3
# asm 2: psrldq $10,<f4=%xmm2
psrldq $10,%xmm2

# qhasm:  uint32323232 f7 ^= *(int128 *) (pos5 + 16 + matrix)
# asm 1: pxor 16(<pos5=int64#1,<matrix=int64#4,1),<f7=int6464#7
# asm 2: pxor 16(<pos5=%rdi,<matrix=%rcx,1),<f7=%xmm6
pxor 16(%rdi,%rcx,1),%xmm6

# qhasm:  f69 <<= 48
# asm 1: pslldq $6,<f69=int6464#4
# asm 2: pslldq $6,<f69=%xmm3
pslldq $6,%xmm3

# qhasm:  f67 ^= f4
# asm 1: pxor  <f4=int6464#3,<f67=int6464#1
# asm 2: pxor  <f4=%xmm2,<f67=%xmm0
pxor  %xmm2,%xmm0

# qhasm:  uint32323232 f65 ^= *(int128 *) (pos65 + 48 + matrix)
# asm 1: pxor 48(<pos65=int64#10,<matrix=int64#4,1),<f65=int6464#5
# asm 2: pxor 48(<pos65=%r12,<matrix=%rcx,1),<f65=%xmm4
pxor 48(%r12,%rcx,1),%xmm4

# qhasm:  v = f65
# asm 1: movdqa <f65=int6464#5,>v=int6464#3
# asm 2: movdqa <f65=%xmm4,>v=%xmm2
movdqa %xmm4,%xmm2

# qhasm:  f8 = *(int128 *) (pos5 + 0 + matrix)
# asm 1: movdqa 0(<pos5=int64#1,<matrix=int64#4),>f8=int6464#10
# asm 2: movdqa 0(<pos5=%rdi,<matrix=%rcx),>f8=%xmm9
movdqa 0(%rdi,%rcx),%xmm9

# qhasm:  uint6464 f65 <<= 3
# asm 1: psllq $3,<f65=int6464#5
# asm 2: psllq $3,<f65=%xmm4
psllq $3,%xmm4

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#3
# asm 2: psrlq $61,<v=%xmm2
psrlq $61,%xmm2

# qhasm:  uint32323232 f66 ^= *(int128 *) (pos65 + 32 + matrix)
# asm 1: pxor 32(<pos65=int64#10,<matrix=int64#4,1),<f66=int6464#8
# asm 2: pxor 32(<pos65=%r12,<matrix=%rcx,1),<f66=%xmm7
pxor 32(%r12,%rcx,1),%xmm7

# qhasm:  f69 ^= f65
# asm 1: pxor  <f65=int6464#5,<f69=int6464#4
# asm 2: pxor  <f65=%xmm4,<f69=%xmm3
pxor  %xmm4,%xmm3

# qhasm:  (uint64) pos7 >>= 50
# asm 1: shr  $50,<pos7=int64#14
# asm 2: shr  $50,<pos7=%rbx
shr  $50,%rbx

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#3,>w=int6464#5
# asm 2: pshufd $0x45,<v=%xmm2,>w=%xmm4
pshufd $0x45,%xmm2,%xmm4

# qhasm:  uint32323232 f67 ^= *(int128 *) (pos65 + 16 + matrix)
# asm 1: pxor 16(<pos65=int64#10,<matrix=int64#4,1),<f67=int6464#1
# asm 2: pxor 16(<pos65=%r12,<matrix=%rcx,1),<f67=%xmm0
pxor 16(%r12,%rcx,1),%xmm0

# qhasm:  (uint32) pos7 &= mask
# asm 1: andl <mask=int64#8d,<pos7=int64#14d
# asm 2: andl <mask=%r10d,<pos7=%ebx
andl %r10d,%ebx

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#3
# asm 2: psrldq $8,<v=%xmm2
psrldq $8,%xmm2

# qhasm:  assign 14 to pos7

# qhasm:  f69 ^= w
# asm 1: pxor  <w=int6464#5,<f69=int6464#4
# asm 2: pxor  <w=%xmm4,<f69=%xmm3
pxor  %xmm4,%xmm3

# qhasm:  uint32323232 f68 ^= *(int128 *) (pos65 + 0 + matrix)
# asm 1: pxor 0(<pos65=int64#10,<matrix=int64#4,1),<f68=int6464#2
# asm 2: pxor 0(<pos65=%r12,<matrix=%rcx,1),<f68=%xmm1
pxor 0(%r12,%rcx,1),%xmm1

# qhasm:  f68 ^= v
# asm 1: pxor  <v=int6464#3,<f68=int6464#2
# asm 2: pxor  <v=%xmm2,<f68=%xmm1
pxor  %xmm2,%xmm1

# qhasm:  (uint32) pos67 = pos71
# asm 1: mov  <pos71=int64#13d,>pos67=int64#1d
# asm 2: mov  <pos71=%r15d,>pos67=%edi
mov  %r15d,%edi

# qhasm:  uint32323232 f6 ^= *(int128 *) (pos6 + 48 + matrix)
# asm 1: pxor 48(<pos6=int64#15,<matrix=int64#4,1),<f6=int6464#9
# asm 2: pxor 48(<pos6=%rbp,<matrix=%rcx,1),<f6=%xmm8
pxor 48(%rbp,%rcx,1),%xmm8

# qhasm:  (uint32) pos67 >>= 18
# asm 1: shr  $18,<pos67=int64#1d
# asm 2: shr  $18,<pos67=%edi
shr  $18,%edi

# qhasm:  f70 = f6
# asm 1: movdqa <f6=int6464#9,>f70=int6464#3
# asm 2: movdqa <f6=%xmm8,>f70=%xmm2
movdqa %xmm8,%xmm2

# qhasm:  uint32323232 f7 ^= *(int128 *) (pos6 + 32 + matrix)
# asm 1: pxor 32(<pos6=int64#15,<matrix=int64#4,1),<f7=int6464#7
# asm 2: pxor 32(<pos6=%rbp,<matrix=%rcx,1),<f7=%xmm6
pxor 32(%rbp,%rcx,1),%xmm6

# qhasm:  (uint32) pos67 &= mask
# asm 1: andl <mask=int64#8d,<pos67=int64#1d
# asm 2: andl <mask=%r10d,<pos67=%edi
andl %r10d,%edi

# qhasm:  f5 >>= 80
# asm 1: psrldq $10,<f5=int6464#6
# asm 2: psrldq $10,<f5=%xmm5
psrldq $10,%xmm5

# qhasm:  uint32323232 f8 ^= *(int128 *) (pos6 + 16 + matrix)
# asm 1: pxor 16(<pos6=int64#15,<matrix=int64#4,1),<f8=int6464#10
# asm 2: pxor 16(<pos6=%rbp,<matrix=%rcx,1),<f8=%xmm9
pxor 16(%rbp,%rcx,1),%xmm9

# qhasm:  f70 <<= 48
# asm 1: pslldq $6,<f70=int6464#3
# asm 2: pslldq $6,<f70=%xmm2
pslldq $6,%xmm2

# qhasm:  f68 ^= f5
# asm 1: pxor  <f5=int6464#6,<f68=int6464#2
# asm 2: pxor  <f5=%xmm5,<f68=%xmm1
pxor  %xmm5,%xmm1

# qhasm:  uint32323232 f66 ^= *(int128 *) (pos66 + 48 + matrix)
# asm 1: pxor 48(<pos66=int64#7,<matrix=int64#4,1),<f66=int6464#8
# asm 2: pxor 48(<pos66=%rax,<matrix=%rcx,1),<f66=%xmm7
pxor 48(%rax,%rcx,1),%xmm7

# qhasm:  v = f66
# asm 1: movdqa <f66=int6464#8,>v=int6464#5
# asm 2: movdqa <f66=%xmm7,>v=%xmm4
movdqa %xmm7,%xmm4

# qhasm:  f9 = *(int128 *) (pos6 + 0 + matrix)
# asm 1: movdqa 0(<pos6=int64#15,<matrix=int64#4),>f9=int6464#6
# asm 2: movdqa 0(<pos6=%rbp,<matrix=%rcx),>f9=%xmm5
movdqa 0(%rbp,%rcx),%xmm5

# qhasm:  uint6464 f66 <<= 3
# asm 1: psllq $3,<f66=int6464#8
# asm 2: psllq $3,<f66=%xmm7
psllq $3,%xmm7

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#5
# asm 2: psrlq $61,<v=%xmm4
psrlq $61,%xmm4

# qhasm:  uint32323232 f67 ^= *(int128 *) (pos66 + 32 + matrix)
# asm 1: pxor 32(<pos66=int64#7,<matrix=int64#4,1),<f67=int6464#1
# asm 2: pxor 32(<pos66=%rax,<matrix=%rcx,1),<f67=%xmm0
pxor 32(%rax,%rcx,1),%xmm0

# qhasm:  (uint32) pos8 = pos15
# asm 1: mov  <pos15=int64#11d,>pos8=int64#10d
# asm 2: mov  <pos15=%r13d,>pos8=%r12d
mov  %r13d,%r12d

# qhasm:  f70 ^= f66
# asm 1: pxor  <f66=int6464#8,<f70=int6464#3
# asm 2: pxor  <f66=%xmm7,<f70=%xmm2
pxor  %xmm7,%xmm2

# qhasm:  (uint32) pos8 <<= 6
# asm 1: shl  $6,<pos8=int64#10d
# asm 2: shl  $6,<pos8=%r12d
shl  $6,%r12d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#5,>w=int6464#8
# asm 2: pshufd $0x45,<v=%xmm4,>w=%xmm7
pshufd $0x45,%xmm4,%xmm7

# qhasm:  uint32323232 f68 ^= *(int128 *) (pos66 + 16 + matrix)
# asm 1: pxor 16(<pos66=int64#7,<matrix=int64#4,1),<f68=int6464#2
# asm 2: pxor 16(<pos66=%rax,<matrix=%rcx,1),<f68=%xmm1
pxor 16(%rax,%rcx,1),%xmm1

# qhasm:  (uint32) pos8 &= mask
# asm 1: andl <mask=int64#8d,<pos8=int64#10d
# asm 2: andl <mask=%r10d,<pos8=%r12d
andl %r10d,%r12d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#5
# asm 2: psrldq $8,<v=%xmm4
psrldq $8,%xmm4

# qhasm:  f70 ^= w
# asm 1: pxor  <w=int6464#8,<f70=int6464#3
# asm 2: pxor  <w=%xmm7,<f70=%xmm2
pxor  %xmm7,%xmm2

# qhasm:  uint32323232 f69 ^= *(int128 *) (pos66 + 0 + matrix)
# asm 1: pxor 0(<pos66=int64#7,<matrix=int64#4,1),<f69=int6464#4
# asm 2: pxor 0(<pos66=%rax,<matrix=%rcx,1),<f69=%xmm3
pxor 0(%rax,%rcx,1),%xmm3

# qhasm:  f69 ^= v
# asm 1: pxor  <v=int6464#5,<f69=int6464#4
# asm 2: pxor  <v=%xmm4,<f69=%xmm3
pxor  %xmm4,%xmm3

# qhasm:  pos68 = pos71
# asm 1: mov  <pos71=int64#13,>pos68=int64#7
# asm 2: mov  <pos71=%r15,>pos68=%rax
mov  %r15,%rax

# qhasm:  uint32323232 f7 ^= *(int128 *) (pos7 + 48 + matrix)
# asm 1: pxor 48(<pos7=int64#14,<matrix=int64#4,1),<f7=int6464#7
# asm 2: pxor 48(<pos7=%rbx,<matrix=%rcx,1),<f7=%xmm6
pxor 48(%rbx,%rcx,1),%xmm6

# qhasm:  (uint64) pos68 >>= 26
# asm 1: shr  $26,<pos68=int64#7
# asm 2: shr  $26,<pos68=%rax
shr  $26,%rax

# qhasm:  f71 = f7
# asm 1: movdqa <f7=int6464#7,>f71=int6464#5
# asm 2: movdqa <f7=%xmm6,>f71=%xmm4
movdqa %xmm6,%xmm4

# qhasm:  uint32323232 f8 ^= *(int128 *) (pos7 + 32 + matrix)
# asm 1: pxor 32(<pos7=int64#14,<matrix=int64#4,1),<f8=int6464#10
# asm 2: pxor 32(<pos7=%rbx,<matrix=%rcx,1),<f8=%xmm9
pxor 32(%rbx,%rcx,1),%xmm9

# qhasm:  (uint32) pos68 &= mask
# asm 1: andl <mask=int64#8d,<pos68=int64#7d
# asm 2: andl <mask=%r10d,<pos68=%eax
andl %r10d,%eax

# qhasm:  f6 >>= 80
# asm 1: psrldq $10,<f6=int6464#9
# asm 2: psrldq $10,<f6=%xmm8
psrldq $10,%xmm8

# qhasm:  uint32323232 f9 ^= *(int128 *) (pos7 + 16 + matrix)
# asm 1: pxor 16(<pos7=int64#14,<matrix=int64#4,1),<f9=int6464#6
# asm 2: pxor 16(<pos7=%rbx,<matrix=%rcx,1),<f9=%xmm5
pxor 16(%rbx,%rcx,1),%xmm5

# qhasm:  assign 7 to pos68

# qhasm:  f71 <<= 48
# asm 1: pslldq $6,<f71=int6464#5
# asm 2: pslldq $6,<f71=%xmm4
pslldq $6,%xmm4

# qhasm:  f69 ^= f6
# asm 1: pxor  <f6=int6464#9,<f69=int6464#4
# asm 2: pxor  <f6=%xmm8,<f69=%xmm3
pxor  %xmm8,%xmm3

# qhasm:  uint32323232 f67 ^= *(int128 *) (pos67 + 48 + matrix)
# asm 1: pxor 48(<pos67=int64#1,<matrix=int64#4,1),<f67=int6464#1
# asm 2: pxor 48(<pos67=%rdi,<matrix=%rcx,1),<f67=%xmm0
pxor 48(%rdi,%rcx,1),%xmm0

# qhasm:  v = f67
# asm 1: movdqa <f67=int6464#1,>v=int6464#8
# asm 2: movdqa <f67=%xmm0,>v=%xmm7
movdqa %xmm0,%xmm7

# qhasm:  f10 = *(int128 *) (pos7 + 0 + matrix)
# asm 1: movdqa 0(<pos7=int64#14,<matrix=int64#4),>f10=int6464#9
# asm 2: movdqa 0(<pos7=%rbx,<matrix=%rcx),>f10=%xmm8
movdqa 0(%rbx,%rcx),%xmm8

# qhasm:  uint6464 f67 <<= 3
# asm 1: psllq $3,<f67=int6464#1
# asm 2: psllq $3,<f67=%xmm0
psllq $3,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#8
# asm 2: psrlq $61,<v=%xmm7
psrlq $61,%xmm7

# qhasm:  uint32323232 f68 ^= *(int128 *) (pos67 + 32 + matrix)
# asm 1: pxor 32(<pos67=int64#1,<matrix=int64#4,1),<f68=int6464#2
# asm 2: pxor 32(<pos67=%rdi,<matrix=%rcx,1),<f68=%xmm1
pxor 32(%rdi,%rcx,1),%xmm1

# qhasm:  (uint32) pos9 = pos15
# asm 1: mov  <pos15=int64#11d,>pos9=int64#12d
# asm 2: mov  <pos15=%r13d,>pos9=%r14d
mov  %r13d,%r14d

# qhasm:  f71 ^= f67
# asm 1: pxor  <f67=int6464#1,<f71=int6464#5
# asm 2: pxor  <f67=%xmm0,<f71=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  (uint32) pos9 >>= 2
# asm 1: shr  $2,<pos9=int64#12d
# asm 2: shr  $2,<pos9=%r14d
shr  $2,%r14d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#8,>w=int6464#1
# asm 2: pshufd $0x45,<v=%xmm7,>w=%xmm0
pshufd $0x45,%xmm7,%xmm0

# qhasm:  uint32323232 f69 ^= *(int128 *) (pos67 + 16 + matrix)
# asm 1: pxor 16(<pos67=int64#1,<matrix=int64#4,1),<f69=int6464#4
# asm 2: pxor 16(<pos67=%rdi,<matrix=%rcx,1),<f69=%xmm3
pxor 16(%rdi,%rcx,1),%xmm3

# qhasm:  (uint32) pos9 &= mask
# asm 1: andl <mask=int64#8d,<pos9=int64#12d
# asm 2: andl <mask=%r10d,<pos9=%r14d
andl %r10d,%r14d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#8
# asm 2: psrldq $8,<v=%xmm7
psrldq $8,%xmm7

# qhasm:  f71 ^= w
# asm 1: pxor  <w=int6464#1,<f71=int6464#5
# asm 2: pxor  <w=%xmm0,<f71=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  uint32323232 f70 ^= *(int128 *) (pos67 + 0 + matrix)
# asm 1: pxor 0(<pos67=int64#1,<matrix=int64#4,1),<f70=int6464#3
# asm 2: pxor 0(<pos67=%rdi,<matrix=%rcx,1),<f70=%xmm2
pxor 0(%rdi,%rcx,1),%xmm2

# qhasm:  f70 ^= v
# asm 1: pxor  <v=int6464#8,<f70=int6464#3
# asm 2: pxor  <v=%xmm7,<f70=%xmm2
pxor  %xmm7,%xmm2

# qhasm:  pos69 = pos71
# asm 1: mov  <pos71=int64#13,>pos69=int64#1
# asm 2: mov  <pos71=%r15,>pos69=%rdi
mov  %r15,%rdi

# qhasm:  uint32323232 f8 ^= *(int128 *) (pos8 + 48 + matrix)
# asm 1: pxor 48(<pos8=int64#10,<matrix=int64#4,1),<f8=int6464#10
# asm 2: pxor 48(<pos8=%r12,<matrix=%rcx,1),<f8=%xmm9
pxor 48(%r12,%rcx,1),%xmm9

# qhasm:  (uint64) pos69 >>= 34
# asm 1: shr  $34,<pos69=int64#1
# asm 2: shr  $34,<pos69=%rdi
shr  $34,%rdi

# qhasm:  f72 = f8
# asm 1: movdqa <f8=int6464#10,>f72=int6464#1
# asm 2: movdqa <f8=%xmm9,>f72=%xmm0
movdqa %xmm9,%xmm0

# qhasm:  uint32323232 f9 ^= *(int128 *) (pos8 + 32 + matrix)
# asm 1: pxor 32(<pos8=int64#10,<matrix=int64#4,1),<f9=int6464#6
# asm 2: pxor 32(<pos8=%r12,<matrix=%rcx,1),<f9=%xmm5
pxor 32(%r12,%rcx,1),%xmm5

# qhasm:  (uint32) pos69 &= mask
# asm 1: andl <mask=int64#8d,<pos69=int64#1d
# asm 2: andl <mask=%r10d,<pos69=%edi
andl %r10d,%edi

# qhasm:  f7 >>= 80
# asm 1: psrldq $10,<f7=int6464#7
# asm 2: psrldq $10,<f7=%xmm6
psrldq $10,%xmm6

# qhasm:  uint32323232 f10 ^= *(int128 *) (pos8 + 16 + matrix)
# asm 1: pxor 16(<pos8=int64#10,<matrix=int64#4,1),<f10=int6464#9
# asm 2: pxor 16(<pos8=%r12,<matrix=%rcx,1),<f10=%xmm8
pxor 16(%r12,%rcx,1),%xmm8

# qhasm:  assign 1 to pos69

# qhasm:  f72 <<= 48
# asm 1: pslldq $6,<f72=int6464#1
# asm 2: pslldq $6,<f72=%xmm0
pslldq $6,%xmm0

# qhasm:  f70 ^= f7
# asm 1: pxor  <f7=int6464#7,<f70=int6464#3
# asm 2: pxor  <f7=%xmm6,<f70=%xmm2
pxor  %xmm6,%xmm2

# qhasm:  uint32323232 f68 ^= *(int128 *) (pos68 + 48 + matrix)
# asm 1: pxor 48(<pos68=int64#7,<matrix=int64#4,1),<f68=int6464#2
# asm 2: pxor 48(<pos68=%rax,<matrix=%rcx,1),<f68=%xmm1
pxor 48(%rax,%rcx,1),%xmm1

# qhasm:  v = f68
# asm 1: movdqa <f68=int6464#2,>v=int6464#7
# asm 2: movdqa <f68=%xmm1,>v=%xmm6
movdqa %xmm1,%xmm6

# qhasm:  f11 = *(int128 *) (pos8 + 0 + matrix)
# asm 1: movdqa 0(<pos8=int64#10,<matrix=int64#4),>f11=int6464#8
# asm 2: movdqa 0(<pos8=%r12,<matrix=%rcx),>f11=%xmm7
movdqa 0(%r12,%rcx),%xmm7

# qhasm:  uint6464 f68 <<= 3
# asm 1: psllq $3,<f68=int6464#2
# asm 2: psllq $3,<f68=%xmm1
psllq $3,%xmm1

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#7
# asm 2: psrlq $61,<v=%xmm6
psrlq $61,%xmm6

# qhasm:  uint32323232 f69 ^= *(int128 *) (pos68 + 32 + matrix)
# asm 1: pxor 32(<pos68=int64#7,<matrix=int64#4,1),<f69=int6464#4
# asm 2: pxor 32(<pos68=%rax,<matrix=%rcx,1),<f69=%xmm3
pxor 32(%rax,%rcx,1),%xmm3

# qhasm:  (uint32) pos10 = pos15
# asm 1: mov  <pos15=int64#11d,>pos10=int64#10d
# asm 2: mov  <pos15=%r13d,>pos10=%r12d
mov  %r13d,%r12d

# qhasm:  f72 ^= f68
# asm 1: pxor  <f68=int6464#2,<f72=int6464#1
# asm 2: pxor  <f68=%xmm1,<f72=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  (uint32) pos10 >>= 10
# asm 1: shr  $10,<pos10=int64#10d
# asm 2: shr  $10,<pos10=%r12d
shr  $10,%r12d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#7,>w=int6464#2
# asm 2: pshufd $0x45,<v=%xmm6,>w=%xmm1
pshufd $0x45,%xmm6,%xmm1

# qhasm:  uint32323232 f70 ^= *(int128 *) (pos68 + 16 + matrix)
# asm 1: pxor 16(<pos68=int64#7,<matrix=int64#4,1),<f70=int6464#3
# asm 2: pxor 16(<pos68=%rax,<matrix=%rcx,1),<f70=%xmm2
pxor 16(%rax,%rcx,1),%xmm2

# qhasm:  (uint32) pos10 &= mask
# asm 1: andl <mask=int64#8d,<pos10=int64#10d
# asm 2: andl <mask=%r10d,<pos10=%r12d
andl %r10d,%r12d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#7
# asm 2: psrldq $8,<v=%xmm6
psrldq $8,%xmm6

# qhasm:  f72 ^= w
# asm 1: pxor  <w=int6464#2,<f72=int6464#1
# asm 2: pxor  <w=%xmm1,<f72=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  uint32323232 f71 ^= *(int128 *) (pos68 + 0 + matrix)
# asm 1: pxor 0(<pos68=int64#7,<matrix=int64#4,1),<f71=int6464#5
# asm 2: pxor 0(<pos68=%rax,<matrix=%rcx,1),<f71=%xmm4
pxor 0(%rax,%rcx,1),%xmm4

# qhasm:  f71 ^= v
# asm 1: pxor  <v=int6464#7,<f71=int6464#5
# asm 2: pxor  <v=%xmm6,<f71=%xmm4
pxor  %xmm6,%xmm4

# qhasm:  pos79 = *(int64 *) (bp + 8)
# asm 1: movq   8(<bp=int64#2),>pos79=int64#14
# asm 2: movq   8(<bp=%rsi),>pos79=%rbx
movq   8(%rsi),%rbx

# qhasm:  pos70 = pos71
# asm 1: mov  <pos71=int64#13,>pos70=int64#15
# asm 2: mov  <pos71=%r15,>pos70=%rbp
mov  %r15,%rbp

# qhasm:  uint32323232 f9 ^= *(int128 *) (pos9 + 48 + matrix)
# asm 1: pxor 48(<pos9=int64#12,<matrix=int64#4,1),<f9=int6464#6
# asm 2: pxor 48(<pos9=%r14,<matrix=%rcx,1),<f9=%xmm5
pxor 48(%r14,%rcx,1),%xmm5

# qhasm:  (uint64) pos70 >>= 42
# asm 1: shr  $42,<pos70=int64#15
# asm 2: shr  $42,<pos70=%rbp
shr  $42,%rbp

# qhasm:  f73 = f9
# asm 1: movdqa <f9=int6464#6,>f73=int6464#2
# asm 2: movdqa <f9=%xmm5,>f73=%xmm1
movdqa %xmm5,%xmm1

# qhasm:  uint32323232 f10 ^= *(int128 *) (pos9 + 32 + matrix)
# asm 1: pxor 32(<pos9=int64#12,<matrix=int64#4,1),<f10=int6464#9
# asm 2: pxor 32(<pos9=%r14,<matrix=%rcx,1),<f10=%xmm8
pxor 32(%r14,%rcx,1),%xmm8

# qhasm:  (uint32) pos70 &= mask
# asm 1: andl <mask=int64#8d,<pos70=int64#15d
# asm 2: andl <mask=%r10d,<pos70=%ebp
andl %r10d,%ebp

# qhasm:  f8 >>= 80
# asm 1: psrldq $10,<f8=int6464#10
# asm 2: psrldq $10,<f8=%xmm9
psrldq $10,%xmm9

# qhasm:  uint32323232 f11 ^= *(int128 *) (pos9 + 16 + matrix)
# asm 1: pxor 16(<pos9=int64#12,<matrix=int64#4,1),<f11=int6464#8
# asm 2: pxor 16(<pos9=%r14,<matrix=%rcx,1),<f11=%xmm7
pxor 16(%r14,%rcx,1),%xmm7

# qhasm:  assign 15 to pos70

# qhasm:  f73 <<= 48
# asm 1: pslldq $6,<f73=int6464#2
# asm 2: pslldq $6,<f73=%xmm1
pslldq $6,%xmm1

# qhasm:  f71 ^= f8
# asm 1: pxor  <f8=int6464#10,<f71=int6464#5
# asm 2: pxor  <f8=%xmm9,<f71=%xmm4
pxor  %xmm9,%xmm4

# qhasm:  uint32323232 f69 ^= *(int128 *) (pos69 + 48 + matrix)
# asm 1: pxor 48(<pos69=int64#1,<matrix=int64#4,1),<f69=int6464#4
# asm 2: pxor 48(<pos69=%rdi,<matrix=%rcx,1),<f69=%xmm3
pxor 48(%rdi,%rcx,1),%xmm3

# qhasm:  v = f69
# asm 1: movdqa <f69=int6464#4,>v=int6464#7
# asm 2: movdqa <f69=%xmm3,>v=%xmm6
movdqa %xmm3,%xmm6

# qhasm:  f12 = *(int128 *) (pos9 + 0 + matrix)
# asm 1: movdqa 0(<pos9=int64#12,<matrix=int64#4),>f12=int6464#10
# asm 2: movdqa 0(<pos9=%r14,<matrix=%rcx),>f12=%xmm9
movdqa 0(%r14,%rcx),%xmm9

# qhasm:  uint6464 f69 <<= 3
# asm 1: psllq $3,<f69=int6464#4
# asm 2: psllq $3,<f69=%xmm3
psllq $3,%xmm3

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#7
# asm 2: psrlq $61,<v=%xmm6
psrlq $61,%xmm6

# qhasm:  uint32323232 f70 ^= *(int128 *) (pos69 + 32 + matrix)
# asm 1: pxor 32(<pos69=int64#1,<matrix=int64#4,1),<f70=int6464#3
# asm 2: pxor 32(<pos69=%rdi,<matrix=%rcx,1),<f70=%xmm2
pxor 32(%rdi,%rcx,1),%xmm2

# qhasm:  (uint32) pos11 = pos15
# asm 1: mov  <pos15=int64#11d,>pos11=int64#12d
# asm 2: mov  <pos15=%r13d,>pos11=%r14d
mov  %r13d,%r14d

# qhasm:  f73 ^= f69
# asm 1: pxor  <f69=int6464#4,<f73=int6464#2
# asm 2: pxor  <f69=%xmm3,<f73=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  (uint32) pos11 >>= 18
# asm 1: shr  $18,<pos11=int64#12d
# asm 2: shr  $18,<pos11=%r14d
shr  $18,%r14d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#7,>w=int6464#4
# asm 2: pshufd $0x45,<v=%xmm6,>w=%xmm3
pshufd $0x45,%xmm6,%xmm3

# qhasm:  uint32323232 f71 ^= *(int128 *) (pos69 + 16 + matrix)
# asm 1: pxor 16(<pos69=int64#1,<matrix=int64#4,1),<f71=int6464#5
# asm 2: pxor 16(<pos69=%rdi,<matrix=%rcx,1),<f71=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm:  (uint32) pos11 &= mask
# asm 1: andl <mask=int64#8d,<pos11=int64#12d
# asm 2: andl <mask=%r10d,<pos11=%r14d
andl %r10d,%r14d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#7
# asm 2: psrldq $8,<v=%xmm6
psrldq $8,%xmm6

# qhasm:  f73 ^= w
# asm 1: pxor  <w=int6464#4,<f73=int6464#2
# asm 2: pxor  <w=%xmm3,<f73=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  uint32323232 f72 ^= *(int128 *) (pos69 + 0 + matrix)
# asm 1: pxor 0(<pos69=int64#1,<matrix=int64#4,1),<f72=int6464#1
# asm 2: pxor 0(<pos69=%rdi,<matrix=%rcx,1),<f72=%xmm0
pxor 0(%rdi,%rcx,1),%xmm0

# qhasm:  f72 ^= v
# asm 1: pxor  <v=int6464#7,<f72=int6464#1
# asm 2: pxor  <v=%xmm6,<f72=%xmm0
pxor  %xmm6,%xmm0

# qhasm:  uint32323232 f10 ^= *(int128 *) (pos10 + 48 + matrix)
# asm 1: pxor 48(<pos10=int64#10,<matrix=int64#4,1),<f10=int6464#9
# asm 2: pxor 48(<pos10=%r12,<matrix=%rcx,1),<f10=%xmm8
pxor 48(%r12,%rcx,1),%xmm8

# qhasm:  (uint64) pos71 >>= 50
# asm 1: shr  $50,<pos71=int64#13
# asm 2: shr  $50,<pos71=%r15
shr  $50,%r15

# qhasm:  f74 = f10
# asm 1: movdqa <f10=int6464#9,>f74=int6464#4
# asm 2: movdqa <f10=%xmm8,>f74=%xmm3
movdqa %xmm8,%xmm3

# qhasm:  uint32323232 f11 ^= *(int128 *) (pos10 + 32 + matrix)
# asm 1: pxor 32(<pos10=int64#10,<matrix=int64#4,1),<f11=int6464#8
# asm 2: pxor 32(<pos10=%r12,<matrix=%rcx,1),<f11=%xmm7
pxor 32(%r12,%rcx,1),%xmm7

# qhasm:  (uint32) pos71 &= mask
# asm 1: andl <mask=int64#8d,<pos71=int64#13d
# asm 2: andl <mask=%r10d,<pos71=%r15d
andl %r10d,%r15d

# qhasm:  f9 >>= 80
# asm 1: psrldq $10,<f9=int6464#6
# asm 2: psrldq $10,<f9=%xmm5
psrldq $10,%xmm5

# qhasm:  uint32323232 f12 ^= *(int128 *) (pos10 + 16 + matrix)
# asm 1: pxor 16(<pos10=int64#10,<matrix=int64#4,1),<f12=int6464#10
# asm 2: pxor 16(<pos10=%r12,<matrix=%rcx,1),<f12=%xmm9
pxor 16(%r12,%rcx,1),%xmm9

# qhasm:  assign 14 to pos71

# qhasm:  f74 <<= 48
# asm 1: pslldq $6,<f74=int6464#4
# asm 2: pslldq $6,<f74=%xmm3
pslldq $6,%xmm3

# qhasm:  f72 ^= f9
# asm 1: pxor  <f9=int6464#6,<f72=int6464#1
# asm 2: pxor  <f9=%xmm5,<f72=%xmm0
pxor  %xmm5,%xmm0

# qhasm:  uint32323232 f70 ^= *(int128 *) (pos70 + 48 + matrix)
# asm 1: pxor 48(<pos70=int64#15,<matrix=int64#4,1),<f70=int6464#3
# asm 2: pxor 48(<pos70=%rbp,<matrix=%rcx,1),<f70=%xmm2
pxor 48(%rbp,%rcx,1),%xmm2

# qhasm:  v = f70
# asm 1: movdqa <f70=int6464#3,>v=int6464#6
# asm 2: movdqa <f70=%xmm2,>v=%xmm5
movdqa %xmm2,%xmm5

# qhasm:  f13 = *(int128 *) (pos10 + 0 + matrix)
# asm 1: movdqa 0(<pos10=int64#10,<matrix=int64#4),>f13=int6464#7
# asm 2: movdqa 0(<pos10=%r12,<matrix=%rcx),>f13=%xmm6
movdqa 0(%r12,%rcx),%xmm6

# qhasm:  uint6464 f70 <<= 3
# asm 1: psllq $3,<f70=int6464#3
# asm 2: psllq $3,<f70=%xmm2
psllq $3,%xmm2

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos12 = pos15
# asm 1: mov  <pos15=int64#11,>pos12=int64#7
# asm 2: mov  <pos15=%r13,>pos12=%rax
mov  %r13,%rax

# qhasm:  uint32323232 f71 ^= *(int128 *) (pos70 + 32 + matrix)
# asm 1: pxor 32(<pos70=int64#15,<matrix=int64#4,1),<f71=int6464#5
# asm 2: pxor 32(<pos70=%rbp,<matrix=%rcx,1),<f71=%xmm4
pxor 32(%rbp,%rcx,1),%xmm4

# qhasm:  f74 ^= f70
# asm 1: pxor  <f70=int6464#3,<f74=int6464#4
# asm 2: pxor  <f70=%xmm2,<f74=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  (uint64) pos12 >>= 26
# asm 1: shr  $26,<pos12=int64#7
# asm 2: shr  $26,<pos12=%rax
shr  $26,%rax

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#3
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm2
pshufd $0x45,%xmm5,%xmm2

# qhasm:  uint32323232 f72 ^= *(int128 *) (pos70 + 16 + matrix)
# asm 1: pxor 16(<pos70=int64#15,<matrix=int64#4,1),<f72=int6464#1
# asm 2: pxor 16(<pos70=%rbp,<matrix=%rcx,1),<f72=%xmm0
pxor 16(%rbp,%rcx,1),%xmm0

# qhasm:  (uint32) pos12 &= mask
# asm 1: andl <mask=int64#8d,<pos12=int64#7d
# asm 2: andl <mask=%r10d,<pos12=%eax
andl %r10d,%eax

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 7 to pos12

# qhasm:  f74 ^= w
# asm 1: pxor  <w=int6464#3,<f74=int6464#4
# asm 2: pxor  <w=%xmm2,<f74=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  uint32323232 f73 ^= *(int128 *) (pos70 + 0 + matrix)
# asm 1: pxor 0(<pos70=int64#15,<matrix=int64#4,1),<f73=int6464#2
# asm 2: pxor 0(<pos70=%rbp,<matrix=%rcx,1),<f73=%xmm1
pxor 0(%rbp,%rcx,1),%xmm1

# qhasm:  f73 ^= v
# asm 1: pxor  <v=int6464#6,<f73=int6464#2
# asm 2: pxor  <v=%xmm5,<f73=%xmm1
pxor  %xmm5,%xmm1

# qhasm:  (uint32) pos72 = pos79
# asm 1: mov  <pos79=int64#14d,>pos72=int64#10d
# asm 2: mov  <pos79=%ebx,>pos72=%r12d
mov  %ebx,%r12d

# qhasm:  uint32323232 f11 ^= *(int128 *) (pos11 + 48 + matrix)
# asm 1: pxor 48(<pos11=int64#12,<matrix=int64#4,1),<f11=int6464#8
# asm 2: pxor 48(<pos11=%r14,<matrix=%rcx,1),<f11=%xmm7
pxor 48(%r14,%rcx,1),%xmm7

# qhasm:  (uint32) pos72 <<= 6
# asm 1: shl  $6,<pos72=int64#10d
# asm 2: shl  $6,<pos72=%r12d
shl  $6,%r12d

# qhasm:  f75 = f11
# asm 1: movdqa <f11=int6464#8,>f75=int6464#3
# asm 2: movdqa <f11=%xmm7,>f75=%xmm2
movdqa %xmm7,%xmm2

# qhasm:  uint32323232 f12 ^= *(int128 *) (pos11 + 32 + matrix)
# asm 1: pxor 32(<pos11=int64#12,<matrix=int64#4,1),<f12=int6464#10
# asm 2: pxor 32(<pos11=%r14,<matrix=%rcx,1),<f12=%xmm9
pxor 32(%r14,%rcx,1),%xmm9

# qhasm:  (uint32) pos72 &= mask
# asm 1: andl <mask=int64#8d,<pos72=int64#10d
# asm 2: andl <mask=%r10d,<pos72=%r12d
andl %r10d,%r12d

# qhasm:  f10 >>= 80
# asm 1: psrldq $10,<f10=int6464#9
# asm 2: psrldq $10,<f10=%xmm8
psrldq $10,%xmm8

# qhasm:  uint32323232 f13 ^= *(int128 *) (pos11 + 16 + matrix)
# asm 1: pxor 16(<pos11=int64#12,<matrix=int64#4,1),<f13=int6464#7
# asm 2: pxor 16(<pos11=%r14,<matrix=%rcx,1),<f13=%xmm6
pxor 16(%r14,%rcx,1),%xmm6

# qhasm:  f75 <<= 48
# asm 1: pslldq $6,<f75=int6464#3
# asm 2: pslldq $6,<f75=%xmm2
pslldq $6,%xmm2

# qhasm:  f73 ^= f10
# asm 1: pxor  <f10=int6464#9,<f73=int6464#2
# asm 2: pxor  <f10=%xmm8,<f73=%xmm1
pxor  %xmm8,%xmm1

# qhasm:  uint32323232 f71 ^= *(int128 *) (pos71 + 48 + matrix)
# asm 1: pxor 48(<pos71=int64#13,<matrix=int64#4,1),<f71=int6464#5
# asm 2: pxor 48(<pos71=%r15,<matrix=%rcx,1),<f71=%xmm4
pxor 48(%r15,%rcx,1),%xmm4

# qhasm:  v = f71
# asm 1: movdqa <f71=int6464#5,>v=int6464#6
# asm 2: movdqa <f71=%xmm4,>v=%xmm5
movdqa %xmm4,%xmm5

# qhasm:  f14 = *(int128 *) (pos11 + 0 + matrix)
# asm 1: movdqa 0(<pos11=int64#12,<matrix=int64#4),>f14=int6464#9
# asm 2: movdqa 0(<pos11=%r14,<matrix=%rcx),>f14=%xmm8
movdqa 0(%r14,%rcx),%xmm8

# qhasm:  uint6464 f71 <<= 3
# asm 1: psllq $3,<f71=int6464#5
# asm 2: psllq $3,<f71=%xmm4
psllq $3,%xmm4

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos13 = pos15
# asm 1: mov  <pos15=int64#11,>pos13=int64#1
# asm 2: mov  <pos15=%r13,>pos13=%rdi
mov  %r13,%rdi

# qhasm:  uint32323232 f72 ^= *(int128 *) (pos71 + 32 + matrix)
# asm 1: pxor 32(<pos71=int64#13,<matrix=int64#4,1),<f72=int6464#1
# asm 2: pxor 32(<pos71=%r15,<matrix=%rcx,1),<f72=%xmm0
pxor 32(%r15,%rcx,1),%xmm0

# qhasm:  f75 ^= f71
# asm 1: pxor  <f71=int6464#5,<f75=int6464#3
# asm 2: pxor  <f71=%xmm4,<f75=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  (uint64) pos13 >>= 34
# asm 1: shr  $34,<pos13=int64#1
# asm 2: shr  $34,<pos13=%rdi
shr  $34,%rdi

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#5
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm4
pshufd $0x45,%xmm5,%xmm4

# qhasm:  uint32323232 f73 ^= *(int128 *) (pos71 + 16 + matrix)
# asm 1: pxor 16(<pos71=int64#13,<matrix=int64#4,1),<f73=int6464#2
# asm 2: pxor 16(<pos71=%r15,<matrix=%rcx,1),<f73=%xmm1
pxor 16(%r15,%rcx,1),%xmm1

# qhasm:  (uint32) pos13 &= mask
# asm 1: andl <mask=int64#8d,<pos13=int64#1d
# asm 2: andl <mask=%r10d,<pos13=%edi
andl %r10d,%edi

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 1 to pos13

# qhasm:  f75 ^= w
# asm 1: pxor  <w=int6464#5,<f75=int6464#3
# asm 2: pxor  <w=%xmm4,<f75=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  uint32323232 f74 ^= *(int128 *) (pos71 + 0 + matrix)
# asm 1: pxor 0(<pos71=int64#13,<matrix=int64#4,1),<f74=int6464#4
# asm 2: pxor 0(<pos71=%r15,<matrix=%rcx,1),<f74=%xmm3
pxor 0(%r15,%rcx,1),%xmm3

# qhasm:  f74 ^= v
# asm 1: pxor  <v=int6464#6,<f74=int6464#4
# asm 2: pxor  <v=%xmm5,<f74=%xmm3
pxor  %xmm5,%xmm3

# qhasm:  (uint32) pos73 = pos79
# asm 1: mov  <pos79=int64#14d,>pos73=int64#12d
# asm 2: mov  <pos79=%ebx,>pos73=%r14d
mov  %ebx,%r14d

# qhasm:  uint32323232 f12 ^= *(int128 *) (pos12 + 48 + matrix)
# asm 1: pxor 48(<pos12=int64#7,<matrix=int64#4,1),<f12=int6464#10
# asm 2: pxor 48(<pos12=%rax,<matrix=%rcx,1),<f12=%xmm9
pxor 48(%rax,%rcx,1),%xmm9

# qhasm:  (uint32) pos73 >>= 2
# asm 1: shr  $2,<pos73=int64#12d
# asm 2: shr  $2,<pos73=%r14d
shr  $2,%r14d

# qhasm:  f76 = f12
# asm 1: movdqa <f12=int6464#10,>f76=int6464#5
# asm 2: movdqa <f12=%xmm9,>f76=%xmm4
movdqa %xmm9,%xmm4

# qhasm:  uint32323232 f13 ^= *(int128 *) (pos12 + 32 + matrix)
# asm 1: pxor 32(<pos12=int64#7,<matrix=int64#4,1),<f13=int6464#7
# asm 2: pxor 32(<pos12=%rax,<matrix=%rcx,1),<f13=%xmm6
pxor 32(%rax,%rcx,1),%xmm6

# qhasm:  (uint32) pos73 &= mask
# asm 1: andl <mask=int64#8d,<pos73=int64#12d
# asm 2: andl <mask=%r10d,<pos73=%r14d
andl %r10d,%r14d

# qhasm:  f11 >>= 80
# asm 1: psrldq $10,<f11=int6464#8
# asm 2: psrldq $10,<f11=%xmm7
psrldq $10,%xmm7

# qhasm:  uint32323232 f14 ^= *(int128 *) (pos12 + 16 + matrix)
# asm 1: pxor 16(<pos12=int64#7,<matrix=int64#4,1),<f14=int6464#9
# asm 2: pxor 16(<pos12=%rax,<matrix=%rcx,1),<f14=%xmm8
pxor 16(%rax,%rcx,1),%xmm8

# qhasm:  f76 <<= 48
# asm 1: pslldq $6,<f76=int6464#5
# asm 2: pslldq $6,<f76=%xmm4
pslldq $6,%xmm4

# qhasm:  f74 ^= f11
# asm 1: pxor  <f11=int6464#8,<f74=int6464#4
# asm 2: pxor  <f11=%xmm7,<f74=%xmm3
pxor  %xmm7,%xmm3

# qhasm:  uint32323232 f72 ^= *(int128 *) (pos72 + 48 + matrix)
# asm 1: pxor 48(<pos72=int64#10,<matrix=int64#4,1),<f72=int6464#1
# asm 2: pxor 48(<pos72=%r12,<matrix=%rcx,1),<f72=%xmm0
pxor 48(%r12,%rcx,1),%xmm0

# qhasm:  pos23 = ((uint64 *)&state1)[0]
# asm 1: movq <state1=stack128#2,>pos23=int64#13
# asm 2: movq <state1=16(%rsp),>pos23=%r15
movq 16(%rsp),%r15

# qhasm:  v = f72
# asm 1: movdqa <f72=int6464#1,>v=int6464#6
# asm 2: movdqa <f72=%xmm0,>v=%xmm5
movdqa %xmm0,%xmm5

# qhasm:  f15 = *(int128 *) (pos12 + 0 + matrix)
# asm 1: movdqa 0(<pos12=int64#7,<matrix=int64#4),>f15=int6464#8
# asm 2: movdqa 0(<pos12=%rax,<matrix=%rcx),>f15=%xmm7
movdqa 0(%rax,%rcx),%xmm7

# qhasm:  uint6464 f72 <<= 3
# asm 1: psllq $3,<f72=int6464#1
# asm 2: psllq $3,<f72=%xmm0
psllq $3,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos14 = pos15
# asm 1: mov  <pos15=int64#11,>pos14=int64#15
# asm 2: mov  <pos15=%r13,>pos14=%rbp
mov  %r13,%rbp

# qhasm:  uint32323232 f73 ^= *(int128 *) (pos72 + 32 + matrix)
# asm 1: pxor 32(<pos72=int64#10,<matrix=int64#4,1),<f73=int6464#2
# asm 2: pxor 32(<pos72=%r12,<matrix=%rcx,1),<f73=%xmm1
pxor 32(%r12,%rcx,1),%xmm1

# qhasm:  f76 ^= f72
# asm 1: pxor  <f72=int6464#1,<f76=int6464#5
# asm 2: pxor  <f72=%xmm0,<f76=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  (uint64) pos14 >>= 42
# asm 1: shr  $42,<pos14=int64#15
# asm 2: shr  $42,<pos14=%rbp
shr  $42,%rbp

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#1
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm0
pshufd $0x45,%xmm5,%xmm0

# qhasm:  uint32323232 f74 ^= *(int128 *) (pos72 + 16 + matrix)
# asm 1: pxor 16(<pos72=int64#10,<matrix=int64#4,1),<f74=int6464#4
# asm 2: pxor 16(<pos72=%r12,<matrix=%rcx,1),<f74=%xmm3
pxor 16(%r12,%rcx,1),%xmm3

# qhasm:  (uint32) pos14 &= mask
# asm 1: andl <mask=int64#8d,<pos14=int64#15d
# asm 2: andl <mask=%r10d,<pos14=%ebp
andl %r10d,%ebp

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 15 to pos14

# qhasm:  f76 ^= w
# asm 1: pxor  <w=int6464#1,<f76=int6464#5
# asm 2: pxor  <w=%xmm0,<f76=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  uint32323232 f75 ^= *(int128 *) (pos72 + 0 + matrix)
# asm 1: pxor 0(<pos72=int64#10,<matrix=int64#4,1),<f75=int6464#3
# asm 2: pxor 0(<pos72=%r12,<matrix=%rcx,1),<f75=%xmm2
pxor 0(%r12,%rcx,1),%xmm2

# qhasm:  f75 ^= v
# asm 1: pxor  <v=int6464#6,<f75=int6464#3
# asm 2: pxor  <v=%xmm5,<f75=%xmm2
pxor  %xmm5,%xmm2

# qhasm:  (uint32) pos74 = pos79
# asm 1: mov  <pos79=int64#14d,>pos74=int64#7d
# asm 2: mov  <pos79=%ebx,>pos74=%eax
mov  %ebx,%eax

# qhasm:  uint32323232 f13 ^= *(int128 *) (pos13 + 48 + matrix)
# asm 1: pxor 48(<pos13=int64#1,<matrix=int64#4,1),<f13=int6464#7
# asm 2: pxor 48(<pos13=%rdi,<matrix=%rcx,1),<f13=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm:  (uint32) pos74 >>= 10
# asm 1: shr  $10,<pos74=int64#7d
# asm 2: shr  $10,<pos74=%eax
shr  $10,%eax

# qhasm:  f77 = f13
# asm 1: movdqa <f13=int6464#7,>f77=int6464#1
# asm 2: movdqa <f13=%xmm6,>f77=%xmm0
movdqa %xmm6,%xmm0

# qhasm:  uint32323232 f14 ^= *(int128 *) (pos13 + 32 + matrix)
# asm 1: pxor 32(<pos13=int64#1,<matrix=int64#4,1),<f14=int6464#9
# asm 2: pxor 32(<pos13=%rdi,<matrix=%rcx,1),<f14=%xmm8
pxor 32(%rdi,%rcx,1),%xmm8

# qhasm:  (uint32) pos74 &= mask
# asm 1: andl <mask=int64#8d,<pos74=int64#7d
# asm 2: andl <mask=%r10d,<pos74=%eax
andl %r10d,%eax

# qhasm:  f12 >>= 80
# asm 1: psrldq $10,<f12=int6464#10
# asm 2: psrldq $10,<f12=%xmm9
psrldq $10,%xmm9

# qhasm:  uint32323232 f15 ^= *(int128 *) (pos13 + 16 + matrix)
# asm 1: pxor 16(<pos13=int64#1,<matrix=int64#4,1),<f15=int6464#8
# asm 2: pxor 16(<pos13=%rdi,<matrix=%rcx,1),<f15=%xmm7
pxor 16(%rdi,%rcx,1),%xmm7

# qhasm:  f77 <<= 48
# asm 1: pslldq $6,<f77=int6464#1
# asm 2: pslldq $6,<f77=%xmm0
pslldq $6,%xmm0

# qhasm:  f75 ^= f12
# asm 1: pxor  <f12=int6464#10,<f75=int6464#3
# asm 2: pxor  <f12=%xmm9,<f75=%xmm2
pxor  %xmm9,%xmm2

# qhasm:  uint32323232 f73 ^= *(int128 *) (pos73 + 48 + matrix)
# asm 1: pxor 48(<pos73=int64#12,<matrix=int64#4,1),<f73=int6464#2
# asm 2: pxor 48(<pos73=%r14,<matrix=%rcx,1),<f73=%xmm1
pxor 48(%r14,%rcx,1),%xmm1

# qhasm:  v = f73
# asm 1: movdqa <f73=int6464#2,>v=int6464#6
# asm 2: movdqa <f73=%xmm1,>v=%xmm5
movdqa %xmm1,%xmm5

# qhasm:  f16 = *(int128 *) (pos13 + 0 + matrix)
# asm 1: movdqa 0(<pos13=int64#1,<matrix=int64#4),>f16=int6464#10
# asm 2: movdqa 0(<pos13=%rdi,<matrix=%rcx),>f16=%xmm9
movdqa 0(%rdi,%rcx),%xmm9

# qhasm:  uint6464 f73 <<= 3
# asm 1: psllq $3,<f73=int6464#2
# asm 2: psllq $3,<f73=%xmm1
psllq $3,%xmm1

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f74 ^= *(int128 *) (pos73 + 32 + matrix)
# asm 1: pxor 32(<pos73=int64#12,<matrix=int64#4,1),<f74=int6464#4
# asm 2: pxor 32(<pos73=%r14,<matrix=%rcx,1),<f74=%xmm3
pxor 32(%r14,%rcx,1),%xmm3

# qhasm:  f77 ^= f73
# asm 1: pxor  <f73=int6464#2,<f77=int6464#1
# asm 2: pxor  <f73=%xmm1,<f77=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  (uint64) pos15 >>= 50
# asm 1: shr  $50,<pos15=int64#11
# asm 2: shr  $50,<pos15=%r13
shr  $50,%r13

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#2
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm1
pshufd $0x45,%xmm5,%xmm1

# qhasm:  uint32323232 f75 ^= *(int128 *) (pos73 + 16 + matrix)
# asm 1: pxor 16(<pos73=int64#12,<matrix=int64#4,1),<f75=int6464#3
# asm 2: pxor 16(<pos73=%r14,<matrix=%rcx,1),<f75=%xmm2
pxor 16(%r14,%rcx,1),%xmm2

# qhasm:  (uint32) pos15 &= mask
# asm 1: andl <mask=int64#8d,<pos15=int64#11d
# asm 2: andl <mask=%r10d,<pos15=%r13d
andl %r10d,%r13d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 14 to pos15

# qhasm:  f77 ^= w
# asm 1: pxor  <w=int6464#2,<f77=int6464#1
# asm 2: pxor  <w=%xmm1,<f77=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  uint32323232 f76 ^= *(int128 *) (pos73 + 0 + matrix)
# asm 1: pxor 0(<pos73=int64#12,<matrix=int64#4,1),<f76=int6464#5
# asm 2: pxor 0(<pos73=%r14,<matrix=%rcx,1),<f76=%xmm4
pxor 0(%r14,%rcx,1),%xmm4

# qhasm:  f76 ^= v
# asm 1: pxor  <v=int6464#6,<f76=int6464#5
# asm 2: pxor  <v=%xmm5,<f76=%xmm4
pxor  %xmm5,%xmm4

# qhasm:  (uint32) pos75 = pos79
# asm 1: mov  <pos79=int64#14d,>pos75=int64#1d
# asm 2: mov  <pos79=%ebx,>pos75=%edi
mov  %ebx,%edi

# qhasm:  uint32323232 f14 ^= *(int128 *) (pos14 + 48 + matrix)
# asm 1: pxor 48(<pos14=int64#15,<matrix=int64#4,1),<f14=int6464#9
# asm 2: pxor 48(<pos14=%rbp,<matrix=%rcx,1),<f14=%xmm8
pxor 48(%rbp,%rcx,1),%xmm8

# qhasm:  (uint32) pos75 >>= 18
# asm 1: shr  $18,<pos75=int64#1d
# asm 2: shr  $18,<pos75=%edi
shr  $18,%edi

# qhasm:  f78 = f14
# asm 1: movdqa <f14=int6464#9,>f78=int6464#2
# asm 2: movdqa <f14=%xmm8,>f78=%xmm1
movdqa %xmm8,%xmm1

# qhasm:  uint32323232 f15 ^= *(int128 *) (pos14 + 32 + matrix)
# asm 1: pxor 32(<pos14=int64#15,<matrix=int64#4,1),<f15=int6464#8
# asm 2: pxor 32(<pos14=%rbp,<matrix=%rcx,1),<f15=%xmm7
pxor 32(%rbp,%rcx,1),%xmm7

# qhasm:  (uint32) pos75 &= mask
# asm 1: andl <mask=int64#8d,<pos75=int64#1d
# asm 2: andl <mask=%r10d,<pos75=%edi
andl %r10d,%edi

# qhasm:  f13 >>= 80
# asm 1: psrldq $10,<f13=int6464#7
# asm 2: psrldq $10,<f13=%xmm6
psrldq $10,%xmm6

# qhasm:  uint32323232 f16 ^= *(int128 *) (pos14 + 16 + matrix)
# asm 1: pxor 16(<pos14=int64#15,<matrix=int64#4,1),<f16=int6464#10
# asm 2: pxor 16(<pos14=%rbp,<matrix=%rcx,1),<f16=%xmm9
pxor 16(%rbp,%rcx,1),%xmm9

# qhasm:  f78 <<= 48
# asm 1: pslldq $6,<f78=int6464#2
# asm 2: pslldq $6,<f78=%xmm1
pslldq $6,%xmm1

# qhasm:  f76 ^= f13
# asm 1: pxor  <f13=int6464#7,<f76=int6464#5
# asm 2: pxor  <f13=%xmm6,<f76=%xmm4
pxor  %xmm6,%xmm4

# qhasm:  uint32323232 f74 ^= *(int128 *) (pos74 + 48 + matrix)
# asm 1: pxor 48(<pos74=int64#7,<matrix=int64#4,1),<f74=int6464#4
# asm 2: pxor 48(<pos74=%rax,<matrix=%rcx,1),<f74=%xmm3
pxor 48(%rax,%rcx,1),%xmm3

# qhasm:  v = f74
# asm 1: movdqa <f74=int6464#4,>v=int6464#6
# asm 2: movdqa <f74=%xmm3,>v=%xmm5
movdqa %xmm3,%xmm5

# qhasm:  f17 = *(int128 *) (pos14 + 0 + matrix)
# asm 1: movdqa 0(<pos14=int64#15,<matrix=int64#4),>f17=int6464#7
# asm 2: movdqa 0(<pos14=%rbp,<matrix=%rcx),>f17=%xmm6
movdqa 0(%rbp,%rcx),%xmm6

# qhasm:  uint6464 f74 <<= 3
# asm 1: psllq $3,<f74=int6464#4
# asm 2: psllq $3,<f74=%xmm3
psllq $3,%xmm3

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f75 ^= *(int128 *) (pos74 + 32 + matrix)
# asm 1: pxor 32(<pos74=int64#7,<matrix=int64#4,1),<f75=int6464#3
# asm 2: pxor 32(<pos74=%rax,<matrix=%rcx,1),<f75=%xmm2
pxor 32(%rax,%rcx,1),%xmm2

# qhasm:  (uint32) pos16 = pos23
# asm 1: mov  <pos23=int64#13d,>pos16=int64#10d
# asm 2: mov  <pos23=%r15d,>pos16=%r12d
mov  %r15d,%r12d

# qhasm:  f78 ^= f74
# asm 1: pxor  <f74=int6464#4,<f78=int6464#2
# asm 2: pxor  <f74=%xmm3,<f78=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  (uint32) pos16 <<= 6
# asm 1: shl  $6,<pos16=int64#10d
# asm 2: shl  $6,<pos16=%r12d
shl  $6,%r12d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#4
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm3
pshufd $0x45,%xmm5,%xmm3

# qhasm:  uint32323232 f76 ^= *(int128 *) (pos74 + 16 + matrix)
# asm 1: pxor 16(<pos74=int64#7,<matrix=int64#4,1),<f76=int6464#5
# asm 2: pxor 16(<pos74=%rax,<matrix=%rcx,1),<f76=%xmm4
pxor 16(%rax,%rcx,1),%xmm4

# qhasm:  (uint32) pos16 &= mask
# asm 1: andl <mask=int64#8d,<pos16=int64#10d
# asm 2: andl <mask=%r10d,<pos16=%r12d
andl %r10d,%r12d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f78 ^= w
# asm 1: pxor  <w=int6464#4,<f78=int6464#2
# asm 2: pxor  <w=%xmm3,<f78=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  uint32323232 f77 ^= *(int128 *) (pos74 + 0 + matrix)
# asm 1: pxor 0(<pos74=int64#7,<matrix=int64#4,1),<f77=int6464#1
# asm 2: pxor 0(<pos74=%rax,<matrix=%rcx,1),<f77=%xmm0
pxor 0(%rax,%rcx,1),%xmm0

# qhasm:  f77 ^= v
# asm 1: pxor  <v=int6464#6,<f77=int6464#1
# asm 2: pxor  <v=%xmm5,<f77=%xmm0
pxor  %xmm5,%xmm0

# qhasm:  pos76 = pos79
# asm 1: mov  <pos79=int64#14,>pos76=int64#7
# asm 2: mov  <pos79=%rbx,>pos76=%rax
mov  %rbx,%rax

# qhasm:  uint32323232 f15 ^= *(int128 *) (pos15 + 48 + matrix)
# asm 1: pxor 48(<pos15=int64#11,<matrix=int64#4,1),<f15=int6464#8
# asm 2: pxor 48(<pos15=%r13,<matrix=%rcx,1),<f15=%xmm7
pxor 48(%r13,%rcx,1),%xmm7

# qhasm:  (uint64) pos76 >>= 26
# asm 1: shr  $26,<pos76=int64#7
# asm 2: shr  $26,<pos76=%rax
shr  $26,%rax

# qhasm:  f79 = f15
# asm 1: movdqa <f15=int6464#8,>f79=int6464#4
# asm 2: movdqa <f15=%xmm7,>f79=%xmm3
movdqa %xmm7,%xmm3

# qhasm:  uint32323232 f16 ^= *(int128 *) (pos15 + 32 + matrix)
# asm 1: pxor 32(<pos15=int64#11,<matrix=int64#4,1),<f16=int6464#10
# asm 2: pxor 32(<pos15=%r13,<matrix=%rcx,1),<f16=%xmm9
pxor 32(%r13,%rcx,1),%xmm9

# qhasm:  (uint32) pos76 &= mask
# asm 1: andl <mask=int64#8d,<pos76=int64#7d
# asm 2: andl <mask=%r10d,<pos76=%eax
andl %r10d,%eax

# qhasm:  f14 >>= 80
# asm 1: psrldq $10,<f14=int6464#9
# asm 2: psrldq $10,<f14=%xmm8
psrldq $10,%xmm8

# qhasm:  uint32323232 f17 ^= *(int128 *) (pos15 + 16 + matrix)
# asm 1: pxor 16(<pos15=int64#11,<matrix=int64#4,1),<f17=int6464#7
# asm 2: pxor 16(<pos15=%r13,<matrix=%rcx,1),<f17=%xmm6
pxor 16(%r13,%rcx,1),%xmm6

# qhasm:  assign 7 to pos76

# qhasm:  f79 <<= 48
# asm 1: pslldq $6,<f79=int6464#4
# asm 2: pslldq $6,<f79=%xmm3
pslldq $6,%xmm3

# qhasm:  f77 ^= f14
# asm 1: pxor  <f14=int6464#9,<f77=int6464#1
# asm 2: pxor  <f14=%xmm8,<f77=%xmm0
pxor  %xmm8,%xmm0

# qhasm:  uint32323232 f75 ^= *(int128 *) (pos75 + 48 + matrix)
# asm 1: pxor 48(<pos75=int64#1,<matrix=int64#4,1),<f75=int6464#3
# asm 2: pxor 48(<pos75=%rdi,<matrix=%rcx,1),<f75=%xmm2
pxor 48(%rdi,%rcx,1),%xmm2

# qhasm:  v = f75
# asm 1: movdqa <f75=int6464#3,>v=int6464#6
# asm 2: movdqa <f75=%xmm2,>v=%xmm5
movdqa %xmm2,%xmm5

# qhasm:  f18 = *(int128 *) (pos15 + 0 + matrix)
# asm 1: movdqa 0(<pos15=int64#11,<matrix=int64#4),>f18=int6464#9
# asm 2: movdqa 0(<pos15=%r13,<matrix=%rcx),>f18=%xmm8
movdqa 0(%r13,%rcx),%xmm8

# qhasm:  uint6464 f75 <<= 3
# asm 1: psllq $3,<f75=int6464#3
# asm 2: psllq $3,<f75=%xmm2
psllq $3,%xmm2

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f76 ^= *(int128 *) (pos75 + 32 + matrix)
# asm 1: pxor 32(<pos75=int64#1,<matrix=int64#4,1),<f76=int6464#5
# asm 2: pxor 32(<pos75=%rdi,<matrix=%rcx,1),<f76=%xmm4
pxor 32(%rdi,%rcx,1),%xmm4

# qhasm:  (uint32) pos17 = pos23
# asm 1: mov  <pos23=int64#13d,>pos17=int64#11d
# asm 2: mov  <pos23=%r15d,>pos17=%r13d
mov  %r15d,%r13d

# qhasm:  f79 ^= f75
# asm 1: pxor  <f75=int6464#3,<f79=int6464#4
# asm 2: pxor  <f75=%xmm2,<f79=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  (uint32) pos17 >>= 2
# asm 1: shr  $2,<pos17=int64#11d
# asm 2: shr  $2,<pos17=%r13d
shr  $2,%r13d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#3
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm2
pshufd $0x45,%xmm5,%xmm2

# qhasm:  uint32323232 f77 ^= *(int128 *) (pos75 + 16 + matrix)
# asm 1: pxor 16(<pos75=int64#1,<matrix=int64#4,1),<f77=int6464#1
# asm 2: pxor 16(<pos75=%rdi,<matrix=%rcx,1),<f77=%xmm0
pxor 16(%rdi,%rcx,1),%xmm0

# qhasm:  (uint32) pos17 &= mask
# asm 1: andl <mask=int64#8d,<pos17=int64#11d
# asm 2: andl <mask=%r10d,<pos17=%r13d
andl %r10d,%r13d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f79 ^= w
# asm 1: pxor  <w=int6464#3,<f79=int6464#4
# asm 2: pxor  <w=%xmm2,<f79=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  uint32323232 f78 ^= *(int128 *) (pos75 + 0 + matrix)
# asm 1: pxor 0(<pos75=int64#1,<matrix=int64#4,1),<f78=int6464#2
# asm 2: pxor 0(<pos75=%rdi,<matrix=%rcx,1),<f78=%xmm1
pxor 0(%rdi,%rcx,1),%xmm1

# qhasm:  f78 ^= v
# asm 1: pxor  <v=int6464#6,<f78=int6464#2
# asm 2: pxor  <v=%xmm5,<f78=%xmm1
pxor  %xmm5,%xmm1

# qhasm:  pos77 = pos79
# asm 1: mov  <pos79=int64#14,>pos77=int64#1
# asm 2: mov  <pos79=%rbx,>pos77=%rdi
mov  %rbx,%rdi

# qhasm:  uint32323232 f16 ^= *(int128 *) (pos16 + 48 + matrix)
# asm 1: pxor 48(<pos16=int64#10,<matrix=int64#4,1),<f16=int6464#10
# asm 2: pxor 48(<pos16=%r12,<matrix=%rcx,1),<f16=%xmm9
pxor 48(%r12,%rcx,1),%xmm9

# qhasm:  (uint64) pos77 >>= 34
# asm 1: shr  $34,<pos77=int64#1
# asm 2: shr  $34,<pos77=%rdi
shr  $34,%rdi

# qhasm:  f80 = f16
# asm 1: movdqa <f16=int6464#10,>f80=int6464#3
# asm 2: movdqa <f16=%xmm9,>f80=%xmm2
movdqa %xmm9,%xmm2

# qhasm:  uint32323232 f17 ^= *(int128 *) (pos16 + 32 + matrix)
# asm 1: pxor 32(<pos16=int64#10,<matrix=int64#4,1),<f17=int6464#7
# asm 2: pxor 32(<pos16=%r12,<matrix=%rcx,1),<f17=%xmm6
pxor 32(%r12,%rcx,1),%xmm6

# qhasm:  (uint32) pos77 &= mask
# asm 1: andl <mask=int64#8d,<pos77=int64#1d
# asm 2: andl <mask=%r10d,<pos77=%edi
andl %r10d,%edi

# qhasm:  f15 >>= 80
# asm 1: psrldq $10,<f15=int6464#8
# asm 2: psrldq $10,<f15=%xmm7
psrldq $10,%xmm7

# qhasm:  uint32323232 f18 ^= *(int128 *) (pos16 + 16 + matrix)
# asm 1: pxor 16(<pos16=int64#10,<matrix=int64#4,1),<f18=int6464#9
# asm 2: pxor 16(<pos16=%r12,<matrix=%rcx,1),<f18=%xmm8
pxor 16(%r12,%rcx,1),%xmm8

# qhasm:  assign 1 to pos77

# qhasm:  f80 <<= 48
# asm 1: pslldq $6,<f80=int6464#3
# asm 2: pslldq $6,<f80=%xmm2
pslldq $6,%xmm2

# qhasm:  f78 ^= f15
# asm 1: pxor  <f15=int6464#8,<f78=int6464#2
# asm 2: pxor  <f15=%xmm7,<f78=%xmm1
pxor  %xmm7,%xmm1

# qhasm:  uint32323232 f76 ^= *(int128 *) (pos76 + 48 + matrix)
# asm 1: pxor 48(<pos76=int64#7,<matrix=int64#4,1),<f76=int6464#5
# asm 2: pxor 48(<pos76=%rax,<matrix=%rcx,1),<f76=%xmm4
pxor 48(%rax,%rcx,1),%xmm4

# qhasm:  v = f76
# asm 1: movdqa <f76=int6464#5,>v=int6464#6
# asm 2: movdqa <f76=%xmm4,>v=%xmm5
movdqa %xmm4,%xmm5

# qhasm:  f19 = *(int128 *) (pos16 + 0 + matrix)
# asm 1: movdqa 0(<pos16=int64#10,<matrix=int64#4),>f19=int6464#8
# asm 2: movdqa 0(<pos16=%r12,<matrix=%rcx),>f19=%xmm7
movdqa 0(%r12,%rcx),%xmm7

# qhasm:  uint6464 f76 <<= 3
# asm 1: psllq $3,<f76=int6464#5
# asm 2: psllq $3,<f76=%xmm4
psllq $3,%xmm4

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f77 ^= *(int128 *) (pos76 + 32 + matrix)
# asm 1: pxor 32(<pos76=int64#7,<matrix=int64#4,1),<f77=int6464#1
# asm 2: pxor 32(<pos76=%rax,<matrix=%rcx,1),<f77=%xmm0
pxor 32(%rax,%rcx,1),%xmm0

# qhasm:  (uint32) pos18 = pos23
# asm 1: mov  <pos23=int64#13d,>pos18=int64#10d
# asm 2: mov  <pos23=%r15d,>pos18=%r12d
mov  %r15d,%r12d

# qhasm:  f80 ^= f76
# asm 1: pxor  <f76=int6464#5,<f80=int6464#3
# asm 2: pxor  <f76=%xmm4,<f80=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  (uint32) pos18 >>= 10
# asm 1: shr  $10,<pos18=int64#10d
# asm 2: shr  $10,<pos18=%r12d
shr  $10,%r12d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#5
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm4
pshufd $0x45,%xmm5,%xmm4

# qhasm:  uint32323232 f78 ^= *(int128 *) (pos76 + 16 + matrix)
# asm 1: pxor 16(<pos76=int64#7,<matrix=int64#4,1),<f78=int6464#2
# asm 2: pxor 16(<pos76=%rax,<matrix=%rcx,1),<f78=%xmm1
pxor 16(%rax,%rcx,1),%xmm1

# qhasm:  (uint32) pos18 &= mask
# asm 1: andl <mask=int64#8d,<pos18=int64#10d
# asm 2: andl <mask=%r10d,<pos18=%r12d
andl %r10d,%r12d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f80 ^= w
# asm 1: pxor  <w=int6464#5,<f80=int6464#3
# asm 2: pxor  <w=%xmm4,<f80=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  uint32323232 f79 ^= *(int128 *) (pos76 + 0 + matrix)
# asm 1: pxor 0(<pos76=int64#7,<matrix=int64#4,1),<f79=int6464#4
# asm 2: pxor 0(<pos76=%rax,<matrix=%rcx,1),<f79=%xmm3
pxor 0(%rax,%rcx,1),%xmm3

# qhasm:  f79 ^= v
# asm 1: pxor  <v=int6464#6,<f79=int6464#4
# asm 2: pxor  <v=%xmm5,<f79=%xmm3
pxor  %xmm5,%xmm3

# qhasm:  pos87 = *(int64 *) (bp + 16)
# asm 1: movq   16(<bp=int64#2),>pos87=int64#12
# asm 2: movq   16(<bp=%rsi),>pos87=%r14
movq   16(%rsi),%r14

# qhasm:  pos78 = pos79
# asm 1: mov  <pos79=int64#14,>pos78=int64#15
# asm 2: mov  <pos79=%rbx,>pos78=%rbp
mov  %rbx,%rbp

# qhasm:  uint32323232 f17 ^= *(int128 *) (pos17 + 48 + matrix)
# asm 1: pxor 48(<pos17=int64#11,<matrix=int64#4,1),<f17=int6464#7
# asm 2: pxor 48(<pos17=%r13,<matrix=%rcx,1),<f17=%xmm6
pxor 48(%r13,%rcx,1),%xmm6

# qhasm:  (uint64) pos78 >>= 42
# asm 1: shr  $42,<pos78=int64#15
# asm 2: shr  $42,<pos78=%rbp
shr  $42,%rbp

# qhasm:  f81 = f17
# asm 1: movdqa <f17=int6464#7,>f81=int6464#5
# asm 2: movdqa <f17=%xmm6,>f81=%xmm4
movdqa %xmm6,%xmm4

# qhasm:  uint32323232 f18 ^= *(int128 *) (pos17 + 32 + matrix)
# asm 1: pxor 32(<pos17=int64#11,<matrix=int64#4,1),<f18=int6464#9
# asm 2: pxor 32(<pos17=%r13,<matrix=%rcx,1),<f18=%xmm8
pxor 32(%r13,%rcx,1),%xmm8

# qhasm:  (uint32) pos78 &= mask
# asm 1: andl <mask=int64#8d,<pos78=int64#15d
# asm 2: andl <mask=%r10d,<pos78=%ebp
andl %r10d,%ebp

# qhasm:  f16 >>= 80
# asm 1: psrldq $10,<f16=int6464#10
# asm 2: psrldq $10,<f16=%xmm9
psrldq $10,%xmm9

# qhasm:  uint32323232 f19 ^= *(int128 *) (pos17 + 16 + matrix)
# asm 1: pxor 16(<pos17=int64#11,<matrix=int64#4,1),<f19=int6464#8
# asm 2: pxor 16(<pos17=%r13,<matrix=%rcx,1),<f19=%xmm7
pxor 16(%r13,%rcx,1),%xmm7

# qhasm:  assign 15 to pos78

# qhasm:  f81 <<= 48
# asm 1: pslldq $6,<f81=int6464#5
# asm 2: pslldq $6,<f81=%xmm4
pslldq $6,%xmm4

# qhasm:  f79 ^= f16
# asm 1: pxor  <f16=int6464#10,<f79=int6464#4
# asm 2: pxor  <f16=%xmm9,<f79=%xmm3
pxor  %xmm9,%xmm3

# qhasm:  uint32323232 f77 ^= *(int128 *) (pos77 + 48 + matrix)
# asm 1: pxor 48(<pos77=int64#1,<matrix=int64#4,1),<f77=int6464#1
# asm 2: pxor 48(<pos77=%rdi,<matrix=%rcx,1),<f77=%xmm0
pxor 48(%rdi,%rcx,1),%xmm0

# qhasm:  v = f77
# asm 1: movdqa <f77=int6464#1,>v=int6464#6
# asm 2: movdqa <f77=%xmm0,>v=%xmm5
movdqa %xmm0,%xmm5

# qhasm:  f20 = *(int128 *) (pos17 + 0 + matrix)
# asm 1: movdqa 0(<pos17=int64#11,<matrix=int64#4),>f20=int6464#10
# asm 2: movdqa 0(<pos17=%r13,<matrix=%rcx),>f20=%xmm9
movdqa 0(%r13,%rcx),%xmm9

# qhasm:  uint6464 f77 <<= 3
# asm 1: psllq $3,<f77=int6464#1
# asm 2: psllq $3,<f77=%xmm0
psllq $3,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f78 ^= *(int128 *) (pos77 + 32 + matrix)
# asm 1: pxor 32(<pos77=int64#1,<matrix=int64#4,1),<f78=int6464#2
# asm 2: pxor 32(<pos77=%rdi,<matrix=%rcx,1),<f78=%xmm1
pxor 32(%rdi,%rcx,1),%xmm1

# qhasm:  (uint32) pos19 = pos23
# asm 1: mov  <pos23=int64#13d,>pos19=int64#11d
# asm 2: mov  <pos23=%r15d,>pos19=%r13d
mov  %r15d,%r13d

# qhasm:  f81 ^= f77
# asm 1: pxor  <f77=int6464#1,<f81=int6464#5
# asm 2: pxor  <f77=%xmm0,<f81=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  (uint32) pos19 >>= 18
# asm 1: shr  $18,<pos19=int64#11d
# asm 2: shr  $18,<pos19=%r13d
shr  $18,%r13d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#1
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm0
pshufd $0x45,%xmm5,%xmm0

# qhasm:  uint32323232 f79 ^= *(int128 *) (pos77 + 16 + matrix)
# asm 1: pxor 16(<pos77=int64#1,<matrix=int64#4,1),<f79=int6464#4
# asm 2: pxor 16(<pos77=%rdi,<matrix=%rcx,1),<f79=%xmm3
pxor 16(%rdi,%rcx,1),%xmm3

# qhasm:  (uint32) pos19 &= mask
# asm 1: andl <mask=int64#8d,<pos19=int64#11d
# asm 2: andl <mask=%r10d,<pos19=%r13d
andl %r10d,%r13d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f81 ^= w
# asm 1: pxor  <w=int6464#1,<f81=int6464#5
# asm 2: pxor  <w=%xmm0,<f81=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  uint32323232 f80 ^= *(int128 *) (pos77 + 0 + matrix)
# asm 1: pxor 0(<pos77=int64#1,<matrix=int64#4,1),<f80=int6464#3
# asm 2: pxor 0(<pos77=%rdi,<matrix=%rcx,1),<f80=%xmm2
pxor 0(%rdi,%rcx,1),%xmm2

# qhasm:  f80 ^= v
# asm 1: pxor  <v=int6464#6,<f80=int6464#3
# asm 2: pxor  <v=%xmm5,<f80=%xmm2
pxor  %xmm5,%xmm2

# qhasm:  uint32323232 f18 ^= *(int128 *) (pos18 + 48 + matrix)
# asm 1: pxor 48(<pos18=int64#10,<matrix=int64#4,1),<f18=int6464#9
# asm 2: pxor 48(<pos18=%r12,<matrix=%rcx,1),<f18=%xmm8
pxor 48(%r12,%rcx,1),%xmm8

# qhasm:  (uint64) pos79 >>= 50
# asm 1: shr  $50,<pos79=int64#14
# asm 2: shr  $50,<pos79=%rbx
shr  $50,%rbx

# qhasm:  f82 = f18
# asm 1: movdqa <f18=int6464#9,>f82=int6464#1
# asm 2: movdqa <f18=%xmm8,>f82=%xmm0
movdqa %xmm8,%xmm0

# qhasm:  uint32323232 f19 ^= *(int128 *) (pos18 + 32 + matrix)
# asm 1: pxor 32(<pos18=int64#10,<matrix=int64#4,1),<f19=int6464#8
# asm 2: pxor 32(<pos18=%r12,<matrix=%rcx,1),<f19=%xmm7
pxor 32(%r12,%rcx,1),%xmm7

# qhasm:  (uint32) pos79 &= mask
# asm 1: andl <mask=int64#8d,<pos79=int64#14d
# asm 2: andl <mask=%r10d,<pos79=%ebx
andl %r10d,%ebx

# qhasm:  f17 >>= 80
# asm 1: psrldq $10,<f17=int6464#7
# asm 2: psrldq $10,<f17=%xmm6
psrldq $10,%xmm6

# qhasm:  uint32323232 f20 ^= *(int128 *) (pos18 + 16 + matrix)
# asm 1: pxor 16(<pos18=int64#10,<matrix=int64#4,1),<f20=int6464#10
# asm 2: pxor 16(<pos18=%r12,<matrix=%rcx,1),<f20=%xmm9
pxor 16(%r12,%rcx,1),%xmm9

# qhasm:  assign 14 to pos79

# qhasm:  f82 <<= 48
# asm 1: pslldq $6,<f82=int6464#1
# asm 2: pslldq $6,<f82=%xmm0
pslldq $6,%xmm0

# qhasm:  f80 ^= f17
# asm 1: pxor  <f17=int6464#7,<f80=int6464#3
# asm 2: pxor  <f17=%xmm6,<f80=%xmm2
pxor  %xmm6,%xmm2

# qhasm:  uint32323232 f78 ^= *(int128 *) (pos78 + 48 + matrix)
# asm 1: pxor 48(<pos78=int64#15,<matrix=int64#4,1),<f78=int6464#2
# asm 2: pxor 48(<pos78=%rbp,<matrix=%rcx,1),<f78=%xmm1
pxor 48(%rbp,%rcx,1),%xmm1

# qhasm:  v = f78
# asm 1: movdqa <f78=int6464#2,>v=int6464#6
# asm 2: movdqa <f78=%xmm1,>v=%xmm5
movdqa %xmm1,%xmm5

# qhasm:  f21 = *(int128 *) (pos18 + 0 + matrix)
# asm 1: movdqa 0(<pos18=int64#10,<matrix=int64#4),>f21=int6464#7
# asm 2: movdqa 0(<pos18=%r12,<matrix=%rcx),>f21=%xmm6
movdqa 0(%r12,%rcx),%xmm6

# qhasm:  uint6464 f78 <<= 3
# asm 1: psllq $3,<f78=int6464#2
# asm 2: psllq $3,<f78=%xmm1
psllq $3,%xmm1

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos20 = pos23
# asm 1: mov  <pos23=int64#13,>pos20=int64#7
# asm 2: mov  <pos23=%r15,>pos20=%rax
mov  %r15,%rax

# qhasm:  uint32323232 f79 ^= *(int128 *) (pos78 + 32 + matrix)
# asm 1: pxor 32(<pos78=int64#15,<matrix=int64#4,1),<f79=int6464#4
# asm 2: pxor 32(<pos78=%rbp,<matrix=%rcx,1),<f79=%xmm3
pxor 32(%rbp,%rcx,1),%xmm3

# qhasm:  f82 ^= f78
# asm 1: pxor  <f78=int6464#2,<f82=int6464#1
# asm 2: pxor  <f78=%xmm1,<f82=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  (uint64) pos20 >>= 26
# asm 1: shr  $26,<pos20=int64#7
# asm 2: shr  $26,<pos20=%rax
shr  $26,%rax

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#2
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm1
pshufd $0x45,%xmm5,%xmm1

# qhasm:  uint32323232 f80 ^= *(int128 *) (pos78 + 16 + matrix)
# asm 1: pxor 16(<pos78=int64#15,<matrix=int64#4,1),<f80=int6464#3
# asm 2: pxor 16(<pos78=%rbp,<matrix=%rcx,1),<f80=%xmm2
pxor 16(%rbp,%rcx,1),%xmm2

# qhasm:  (uint32) pos20 &= mask
# asm 1: andl <mask=int64#8d,<pos20=int64#7d
# asm 2: andl <mask=%r10d,<pos20=%eax
andl %r10d,%eax

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 7 to pos20

# qhasm:  f82 ^= w
# asm 1: pxor  <w=int6464#2,<f82=int6464#1
# asm 2: pxor  <w=%xmm1,<f82=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  uint32323232 f81 ^= *(int128 *) (pos78 + 0 + matrix)
# asm 1: pxor 0(<pos78=int64#15,<matrix=int64#4,1),<f81=int6464#5
# asm 2: pxor 0(<pos78=%rbp,<matrix=%rcx,1),<f81=%xmm4
pxor 0(%rbp,%rcx,1),%xmm4

# qhasm:  f81 ^= v
# asm 1: pxor  <v=int6464#6,<f81=int6464#5
# asm 2: pxor  <v=%xmm5,<f81=%xmm4
pxor  %xmm5,%xmm4

# qhasm:  (uint32) pos80 = pos87
# asm 1: mov  <pos87=int64#12d,>pos80=int64#10d
# asm 2: mov  <pos87=%r14d,>pos80=%r12d
mov  %r14d,%r12d

# qhasm:  uint32323232 f19 ^= *(int128 *) (pos19 + 48 + matrix)
# asm 1: pxor 48(<pos19=int64#11,<matrix=int64#4,1),<f19=int6464#8
# asm 2: pxor 48(<pos19=%r13,<matrix=%rcx,1),<f19=%xmm7
pxor 48(%r13,%rcx,1),%xmm7

# qhasm:  (uint32) pos80 <<= 6
# asm 1: shl  $6,<pos80=int64#10d
# asm 2: shl  $6,<pos80=%r12d
shl  $6,%r12d

# qhasm:  f83 = f19
# asm 1: movdqa <f19=int6464#8,>f83=int6464#2
# asm 2: movdqa <f19=%xmm7,>f83=%xmm1
movdqa %xmm7,%xmm1

# qhasm:  uint32323232 f20 ^= *(int128 *) (pos19 + 32 + matrix)
# asm 1: pxor 32(<pos19=int64#11,<matrix=int64#4,1),<f20=int6464#10
# asm 2: pxor 32(<pos19=%r13,<matrix=%rcx,1),<f20=%xmm9
pxor 32(%r13,%rcx,1),%xmm9

# qhasm:  (uint32) pos80 &= mask
# asm 1: andl <mask=int64#8d,<pos80=int64#10d
# asm 2: andl <mask=%r10d,<pos80=%r12d
andl %r10d,%r12d

# qhasm:  f18 >>= 80
# asm 1: psrldq $10,<f18=int6464#9
# asm 2: psrldq $10,<f18=%xmm8
psrldq $10,%xmm8

# qhasm:  uint32323232 f21 ^= *(int128 *) (pos19 + 16 + matrix)
# asm 1: pxor 16(<pos19=int64#11,<matrix=int64#4,1),<f21=int6464#7
# asm 2: pxor 16(<pos19=%r13,<matrix=%rcx,1),<f21=%xmm6
pxor 16(%r13,%rcx,1),%xmm6

# qhasm:  f83 <<= 48
# asm 1: pslldq $6,<f83=int6464#2
# asm 2: pslldq $6,<f83=%xmm1
pslldq $6,%xmm1

# qhasm:  f81 ^= f18
# asm 1: pxor  <f18=int6464#9,<f81=int6464#5
# asm 2: pxor  <f18=%xmm8,<f81=%xmm4
pxor  %xmm8,%xmm4

# qhasm:  uint32323232 f79 ^= *(int128 *) (pos79 + 48 + matrix)
# asm 1: pxor 48(<pos79=int64#14,<matrix=int64#4,1),<f79=int6464#4
# asm 2: pxor 48(<pos79=%rbx,<matrix=%rcx,1),<f79=%xmm3
pxor 48(%rbx,%rcx,1),%xmm3

# qhasm:  v = f79
# asm 1: movdqa <f79=int6464#4,>v=int6464#6
# asm 2: movdqa <f79=%xmm3,>v=%xmm5
movdqa %xmm3,%xmm5

# qhasm:  f22 = *(int128 *) (pos19 + 0 + matrix)
# asm 1: movdqa 0(<pos19=int64#11,<matrix=int64#4),>f22=int6464#9
# asm 2: movdqa 0(<pos19=%r13,<matrix=%rcx),>f22=%xmm8
movdqa 0(%r13,%rcx),%xmm8

# qhasm:  uint6464 f79 <<= 3
# asm 1: psllq $3,<f79=int6464#4
# asm 2: psllq $3,<f79=%xmm3
psllq $3,%xmm3

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos21 = pos23
# asm 1: mov  <pos23=int64#13,>pos21=int64#1
# asm 2: mov  <pos23=%r15,>pos21=%rdi
mov  %r15,%rdi

# qhasm:  uint32323232 f80 ^= *(int128 *) (pos79 + 32 + matrix)
# asm 1: pxor 32(<pos79=int64#14,<matrix=int64#4,1),<f80=int6464#3
# asm 2: pxor 32(<pos79=%rbx,<matrix=%rcx,1),<f80=%xmm2
pxor 32(%rbx,%rcx,1),%xmm2

# qhasm:  f83 ^= f79
# asm 1: pxor  <f79=int6464#4,<f83=int6464#2
# asm 2: pxor  <f79=%xmm3,<f83=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  (uint64) pos21 >>= 34
# asm 1: shr  $34,<pos21=int64#1
# asm 2: shr  $34,<pos21=%rdi
shr  $34,%rdi

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#4
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm3
pshufd $0x45,%xmm5,%xmm3

# qhasm:  uint32323232 f81 ^= *(int128 *) (pos79 + 16 + matrix)
# asm 1: pxor 16(<pos79=int64#14,<matrix=int64#4,1),<f81=int6464#5
# asm 2: pxor 16(<pos79=%rbx,<matrix=%rcx,1),<f81=%xmm4
pxor 16(%rbx,%rcx,1),%xmm4

# qhasm:  (uint32) pos21 &= mask
# asm 1: andl <mask=int64#8d,<pos21=int64#1d
# asm 2: andl <mask=%r10d,<pos21=%edi
andl %r10d,%edi

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 1 to pos21

# qhasm:  f83 ^= w
# asm 1: pxor  <w=int6464#4,<f83=int6464#2
# asm 2: pxor  <w=%xmm3,<f83=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  uint32323232 f82 ^= *(int128 *) (pos79 + 0 + matrix)
# asm 1: pxor 0(<pos79=int64#14,<matrix=int64#4,1),<f82=int6464#1
# asm 2: pxor 0(<pos79=%rbx,<matrix=%rcx,1),<f82=%xmm0
pxor 0(%rbx,%rcx,1),%xmm0

# qhasm:  f82 ^= v
# asm 1: pxor  <v=int6464#6,<f82=int6464#1
# asm 2: pxor  <v=%xmm5,<f82=%xmm0
pxor  %xmm5,%xmm0

# qhasm:  (uint32) pos81 = pos87
# asm 1: mov  <pos87=int64#12d,>pos81=int64#11d
# asm 2: mov  <pos87=%r14d,>pos81=%r13d
mov  %r14d,%r13d

# qhasm:  uint32323232 f20 ^= *(int128 *) (pos20 + 48 + matrix)
# asm 1: pxor 48(<pos20=int64#7,<matrix=int64#4,1),<f20=int6464#10
# asm 2: pxor 48(<pos20=%rax,<matrix=%rcx,1),<f20=%xmm9
pxor 48(%rax,%rcx,1),%xmm9

# qhasm:  (uint32) pos81 >>= 2
# asm 1: shr  $2,<pos81=int64#11d
# asm 2: shr  $2,<pos81=%r13d
shr  $2,%r13d

# qhasm:  f84 = f20
# asm 1: movdqa <f20=int6464#10,>f84=int6464#4
# asm 2: movdqa <f20=%xmm9,>f84=%xmm3
movdqa %xmm9,%xmm3

# qhasm:  uint32323232 f21 ^= *(int128 *) (pos20 + 32 + matrix)
# asm 1: pxor 32(<pos20=int64#7,<matrix=int64#4,1),<f21=int6464#7
# asm 2: pxor 32(<pos20=%rax,<matrix=%rcx,1),<f21=%xmm6
pxor 32(%rax,%rcx,1),%xmm6

# qhasm:  (uint32) pos81 &= mask
# asm 1: andl <mask=int64#8d,<pos81=int64#11d
# asm 2: andl <mask=%r10d,<pos81=%r13d
andl %r10d,%r13d

# qhasm:  f19 >>= 80
# asm 1: psrldq $10,<f19=int6464#8
# asm 2: psrldq $10,<f19=%xmm7
psrldq $10,%xmm7

# qhasm:  uint32323232 f22 ^= *(int128 *) (pos20 + 16 + matrix)
# asm 1: pxor 16(<pos20=int64#7,<matrix=int64#4,1),<f22=int6464#9
# asm 2: pxor 16(<pos20=%rax,<matrix=%rcx,1),<f22=%xmm8
pxor 16(%rax,%rcx,1),%xmm8

# qhasm:  f84 <<= 48
# asm 1: pslldq $6,<f84=int6464#4
# asm 2: pslldq $6,<f84=%xmm3
pslldq $6,%xmm3

# qhasm:  f82 ^= f19
# asm 1: pxor  <f19=int6464#8,<f82=int6464#1
# asm 2: pxor  <f19=%xmm7,<f82=%xmm0
pxor  %xmm7,%xmm0

# qhasm:  uint32323232 f80 ^= *(int128 *) (pos80 + 48 + matrix)
# asm 1: pxor 48(<pos80=int64#10,<matrix=int64#4,1),<f80=int6464#3
# asm 2: pxor 48(<pos80=%r12,<matrix=%rcx,1),<f80=%xmm2
pxor 48(%r12,%rcx,1),%xmm2

# qhasm:  pos31 = ((uint64 *)&state1)[1]
# asm 1: movq 8+<state1=stack128#2,>pos31=int64#14
# asm 2: movq 8+<state1=16(%rsp),>pos31=%rbx
movq 8+16(%rsp),%rbx

# qhasm:  v = f80
# asm 1: movdqa <f80=int6464#3,>v=int6464#6
# asm 2: movdqa <f80=%xmm2,>v=%xmm5
movdqa %xmm2,%xmm5

# qhasm:  f23 = *(int128 *) (pos20 + 0 + matrix)
# asm 1: movdqa 0(<pos20=int64#7,<matrix=int64#4),>f23=int6464#8
# asm 2: movdqa 0(<pos20=%rax,<matrix=%rcx),>f23=%xmm7
movdqa 0(%rax,%rcx),%xmm7

# qhasm:  uint6464 f80 <<= 3
# asm 1: psllq $3,<f80=int6464#3
# asm 2: psllq $3,<f80=%xmm2
psllq $3,%xmm2

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos22 = pos23
# asm 1: mov  <pos23=int64#13,>pos22=int64#15
# asm 2: mov  <pos23=%r15,>pos22=%rbp
mov  %r15,%rbp

# qhasm:  uint32323232 f81 ^= *(int128 *) (pos80 + 32 + matrix)
# asm 1: pxor 32(<pos80=int64#10,<matrix=int64#4,1),<f81=int6464#5
# asm 2: pxor 32(<pos80=%r12,<matrix=%rcx,1),<f81=%xmm4
pxor 32(%r12,%rcx,1),%xmm4

# qhasm:  f84 ^= f80
# asm 1: pxor  <f80=int6464#3,<f84=int6464#4
# asm 2: pxor  <f80=%xmm2,<f84=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  (uint64) pos22 >>= 42
# asm 1: shr  $42,<pos22=int64#15
# asm 2: shr  $42,<pos22=%rbp
shr  $42,%rbp

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#3
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm2
pshufd $0x45,%xmm5,%xmm2

# qhasm:  uint32323232 f82 ^= *(int128 *) (pos80 + 16 + matrix)
# asm 1: pxor 16(<pos80=int64#10,<matrix=int64#4,1),<f82=int6464#1
# asm 2: pxor 16(<pos80=%r12,<matrix=%rcx,1),<f82=%xmm0
pxor 16(%r12,%rcx,1),%xmm0

# qhasm:  (uint32) pos22 &= mask
# asm 1: andl <mask=int64#8d,<pos22=int64#15d
# asm 2: andl <mask=%r10d,<pos22=%ebp
andl %r10d,%ebp

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 15 to pos22

# qhasm:  f84 ^= w
# asm 1: pxor  <w=int6464#3,<f84=int6464#4
# asm 2: pxor  <w=%xmm2,<f84=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  uint32323232 f83 ^= *(int128 *) (pos80 + 0 + matrix)
# asm 1: pxor 0(<pos80=int64#10,<matrix=int64#4,1),<f83=int6464#2
# asm 2: pxor 0(<pos80=%r12,<matrix=%rcx,1),<f83=%xmm1
pxor 0(%r12,%rcx,1),%xmm1

# qhasm:  f83 ^= v
# asm 1: pxor  <v=int6464#6,<f83=int6464#2
# asm 2: pxor  <v=%xmm5,<f83=%xmm1
pxor  %xmm5,%xmm1

# qhasm:  (uint32) pos82 = pos87
# asm 1: mov  <pos87=int64#12d,>pos82=int64#7d
# asm 2: mov  <pos87=%r14d,>pos82=%eax
mov  %r14d,%eax

# qhasm:  uint32323232 f21 ^= *(int128 *) (pos21 + 48 + matrix)
# asm 1: pxor 48(<pos21=int64#1,<matrix=int64#4,1),<f21=int6464#7
# asm 2: pxor 48(<pos21=%rdi,<matrix=%rcx,1),<f21=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm:  (uint32) pos82 >>= 10
# asm 1: shr  $10,<pos82=int64#7d
# asm 2: shr  $10,<pos82=%eax
shr  $10,%eax

# qhasm:  f85 = f21
# asm 1: movdqa <f21=int6464#7,>f85=int6464#3
# asm 2: movdqa <f21=%xmm6,>f85=%xmm2
movdqa %xmm6,%xmm2

# qhasm:  uint32323232 f22 ^= *(int128 *) (pos21 + 32 + matrix)
# asm 1: pxor 32(<pos21=int64#1,<matrix=int64#4,1),<f22=int6464#9
# asm 2: pxor 32(<pos21=%rdi,<matrix=%rcx,1),<f22=%xmm8
pxor 32(%rdi,%rcx,1),%xmm8

# qhasm:  (uint32) pos82 &= mask
# asm 1: andl <mask=int64#8d,<pos82=int64#7d
# asm 2: andl <mask=%r10d,<pos82=%eax
andl %r10d,%eax

# qhasm:  f20 >>= 80
# asm 1: psrldq $10,<f20=int6464#10
# asm 2: psrldq $10,<f20=%xmm9
psrldq $10,%xmm9

# qhasm:  uint32323232 f23 ^= *(int128 *) (pos21 + 16 + matrix)
# asm 1: pxor 16(<pos21=int64#1,<matrix=int64#4,1),<f23=int6464#8
# asm 2: pxor 16(<pos21=%rdi,<matrix=%rcx,1),<f23=%xmm7
pxor 16(%rdi,%rcx,1),%xmm7

# qhasm:  f85 <<= 48
# asm 1: pslldq $6,<f85=int6464#3
# asm 2: pslldq $6,<f85=%xmm2
pslldq $6,%xmm2

# qhasm:  f83 ^= f20
# asm 1: pxor  <f20=int6464#10,<f83=int6464#2
# asm 2: pxor  <f20=%xmm9,<f83=%xmm1
pxor  %xmm9,%xmm1

# qhasm:  uint32323232 f81 ^= *(int128 *) (pos81 + 48 + matrix)
# asm 1: pxor 48(<pos81=int64#11,<matrix=int64#4,1),<f81=int6464#5
# asm 2: pxor 48(<pos81=%r13,<matrix=%rcx,1),<f81=%xmm4
pxor 48(%r13,%rcx,1),%xmm4

# qhasm:  v = f81
# asm 1: movdqa <f81=int6464#5,>v=int6464#6
# asm 2: movdqa <f81=%xmm4,>v=%xmm5
movdqa %xmm4,%xmm5

# qhasm:  f24 = *(int128 *) (pos21 + 0 + matrix)
# asm 1: movdqa 0(<pos21=int64#1,<matrix=int64#4),>f24=int6464#10
# asm 2: movdqa 0(<pos21=%rdi,<matrix=%rcx),>f24=%xmm9
movdqa 0(%rdi,%rcx),%xmm9

# qhasm:  uint6464 f81 <<= 3
# asm 1: psllq $3,<f81=int6464#5
# asm 2: psllq $3,<f81=%xmm4
psllq $3,%xmm4

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f82 ^= *(int128 *) (pos81 + 32 + matrix)
# asm 1: pxor 32(<pos81=int64#11,<matrix=int64#4,1),<f82=int6464#1
# asm 2: pxor 32(<pos81=%r13,<matrix=%rcx,1),<f82=%xmm0
pxor 32(%r13,%rcx,1),%xmm0

# qhasm:  f85 ^= f81
# asm 1: pxor  <f81=int6464#5,<f85=int6464#3
# asm 2: pxor  <f81=%xmm4,<f85=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  (uint64) pos23 >>= 50
# asm 1: shr  $50,<pos23=int64#13
# asm 2: shr  $50,<pos23=%r15
shr  $50,%r15

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#5
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm4
pshufd $0x45,%xmm5,%xmm4

# qhasm:  uint32323232 f83 ^= *(int128 *) (pos81 + 16 + matrix)
# asm 1: pxor 16(<pos81=int64#11,<matrix=int64#4,1),<f83=int6464#2
# asm 2: pxor 16(<pos81=%r13,<matrix=%rcx,1),<f83=%xmm1
pxor 16(%r13,%rcx,1),%xmm1

# qhasm:  (uint32) pos23 &= mask
# asm 1: andl <mask=int64#8d,<pos23=int64#13d
# asm 2: andl <mask=%r10d,<pos23=%r15d
andl %r10d,%r15d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 14 to pos23

# qhasm:  f85 ^= w
# asm 1: pxor  <w=int6464#5,<f85=int6464#3
# asm 2: pxor  <w=%xmm4,<f85=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  uint32323232 f84 ^= *(int128 *) (pos81 + 0 + matrix)
# asm 1: pxor 0(<pos81=int64#11,<matrix=int64#4,1),<f84=int6464#4
# asm 2: pxor 0(<pos81=%r13,<matrix=%rcx,1),<f84=%xmm3
pxor 0(%r13,%rcx,1),%xmm3

# qhasm:  f84 ^= v
# asm 1: pxor  <v=int6464#6,<f84=int6464#4
# asm 2: pxor  <v=%xmm5,<f84=%xmm3
pxor  %xmm5,%xmm3

# qhasm:  (uint32) pos83 = pos87
# asm 1: mov  <pos87=int64#12d,>pos83=int64#1d
# asm 2: mov  <pos87=%r14d,>pos83=%edi
mov  %r14d,%edi

# qhasm:  uint32323232 f22 ^= *(int128 *) (pos22 + 48 + matrix)
# asm 1: pxor 48(<pos22=int64#15,<matrix=int64#4,1),<f22=int6464#9
# asm 2: pxor 48(<pos22=%rbp,<matrix=%rcx,1),<f22=%xmm8
pxor 48(%rbp,%rcx,1),%xmm8

# qhasm:  (uint32) pos83 >>= 18
# asm 1: shr  $18,<pos83=int64#1d
# asm 2: shr  $18,<pos83=%edi
shr  $18,%edi

# qhasm:  f86 = f22
# asm 1: movdqa <f22=int6464#9,>f86=int6464#5
# asm 2: movdqa <f22=%xmm8,>f86=%xmm4
movdqa %xmm8,%xmm4

# qhasm:  uint32323232 f23 ^= *(int128 *) (pos22 + 32 + matrix)
# asm 1: pxor 32(<pos22=int64#15,<matrix=int64#4,1),<f23=int6464#8
# asm 2: pxor 32(<pos22=%rbp,<matrix=%rcx,1),<f23=%xmm7
pxor 32(%rbp,%rcx,1),%xmm7

# qhasm:  (uint32) pos83 &= mask
# asm 1: andl <mask=int64#8d,<pos83=int64#1d
# asm 2: andl <mask=%r10d,<pos83=%edi
andl %r10d,%edi

# qhasm:  f21 >>= 80
# asm 1: psrldq $10,<f21=int6464#7
# asm 2: psrldq $10,<f21=%xmm6
psrldq $10,%xmm6

# qhasm:  uint32323232 f24 ^= *(int128 *) (pos22 + 16 + matrix)
# asm 1: pxor 16(<pos22=int64#15,<matrix=int64#4,1),<f24=int6464#10
# asm 2: pxor 16(<pos22=%rbp,<matrix=%rcx,1),<f24=%xmm9
pxor 16(%rbp,%rcx,1),%xmm9

# qhasm:  f86 <<= 48
# asm 1: pslldq $6,<f86=int6464#5
# asm 2: pslldq $6,<f86=%xmm4
pslldq $6,%xmm4

# qhasm:  f84 ^= f21
# asm 1: pxor  <f21=int6464#7,<f84=int6464#4
# asm 2: pxor  <f21=%xmm6,<f84=%xmm3
pxor  %xmm6,%xmm3

# qhasm:  uint32323232 f82 ^= *(int128 *) (pos82 + 48 + matrix)
# asm 1: pxor 48(<pos82=int64#7,<matrix=int64#4,1),<f82=int6464#1
# asm 2: pxor 48(<pos82=%rax,<matrix=%rcx,1),<f82=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm:  v = f82
# asm 1: movdqa <f82=int6464#1,>v=int6464#6
# asm 2: movdqa <f82=%xmm0,>v=%xmm5
movdqa %xmm0,%xmm5

# qhasm:  f25 = *(int128 *) (pos22 + 0 + matrix)
# asm 1: movdqa 0(<pos22=int64#15,<matrix=int64#4),>f25=int6464#7
# asm 2: movdqa 0(<pos22=%rbp,<matrix=%rcx),>f25=%xmm6
movdqa 0(%rbp,%rcx),%xmm6

# qhasm:  uint6464 f82 <<= 3
# asm 1: psllq $3,<f82=int6464#1
# asm 2: psllq $3,<f82=%xmm0
psllq $3,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f83 ^= *(int128 *) (pos82 + 32 + matrix)
# asm 1: pxor 32(<pos82=int64#7,<matrix=int64#4,1),<f83=int6464#2
# asm 2: pxor 32(<pos82=%rax,<matrix=%rcx,1),<f83=%xmm1
pxor 32(%rax,%rcx,1),%xmm1

# qhasm:  (uint32) pos24 = pos31
# asm 1: mov  <pos31=int64#14d,>pos24=int64#10d
# asm 2: mov  <pos31=%ebx,>pos24=%r12d
mov  %ebx,%r12d

# qhasm:  f86 ^= f82
# asm 1: pxor  <f82=int6464#1,<f86=int6464#5
# asm 2: pxor  <f82=%xmm0,<f86=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  (uint32) pos24 <<= 6
# asm 1: shl  $6,<pos24=int64#10d
# asm 2: shl  $6,<pos24=%r12d
shl  $6,%r12d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#1
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm0
pshufd $0x45,%xmm5,%xmm0

# qhasm:  uint32323232 f84 ^= *(int128 *) (pos82 + 16 + matrix)
# asm 1: pxor 16(<pos82=int64#7,<matrix=int64#4,1),<f84=int6464#4
# asm 2: pxor 16(<pos82=%rax,<matrix=%rcx,1),<f84=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm:  (uint32) pos24 &= mask
# asm 1: andl <mask=int64#8d,<pos24=int64#10d
# asm 2: andl <mask=%r10d,<pos24=%r12d
andl %r10d,%r12d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f86 ^= w
# asm 1: pxor  <w=int6464#1,<f86=int6464#5
# asm 2: pxor  <w=%xmm0,<f86=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  uint32323232 f85 ^= *(int128 *) (pos82 + 0 + matrix)
# asm 1: pxor 0(<pos82=int64#7,<matrix=int64#4,1),<f85=int6464#3
# asm 2: pxor 0(<pos82=%rax,<matrix=%rcx,1),<f85=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm:  f85 ^= v
# asm 1: pxor  <v=int6464#6,<f85=int6464#3
# asm 2: pxor  <v=%xmm5,<f85=%xmm2
pxor  %xmm5,%xmm2

# qhasm:  pos84 = pos87
# asm 1: mov  <pos87=int64#12,>pos84=int64#7
# asm 2: mov  <pos87=%r14,>pos84=%rax
mov  %r14,%rax

# qhasm:  uint32323232 f23 ^= *(int128 *) (pos23 + 48 + matrix)
# asm 1: pxor 48(<pos23=int64#13,<matrix=int64#4,1),<f23=int6464#8
# asm 2: pxor 48(<pos23=%r15,<matrix=%rcx,1),<f23=%xmm7
pxor 48(%r15,%rcx,1),%xmm7

# qhasm:  (uint64) pos84 >>= 26
# asm 1: shr  $26,<pos84=int64#7
# asm 2: shr  $26,<pos84=%rax
shr  $26,%rax

# qhasm:  f87 = f23
# asm 1: movdqa <f23=int6464#8,>f87=int6464#1
# asm 2: movdqa <f23=%xmm7,>f87=%xmm0
movdqa %xmm7,%xmm0

# qhasm:  uint32323232 f24 ^= *(int128 *) (pos23 + 32 + matrix)
# asm 1: pxor 32(<pos23=int64#13,<matrix=int64#4,1),<f24=int6464#10
# asm 2: pxor 32(<pos23=%r15,<matrix=%rcx,1),<f24=%xmm9
pxor 32(%r15,%rcx,1),%xmm9

# qhasm:  (uint32) pos84 &= mask
# asm 1: andl <mask=int64#8d,<pos84=int64#7d
# asm 2: andl <mask=%r10d,<pos84=%eax
andl %r10d,%eax

# qhasm:  f22 >>= 80
# asm 1: psrldq $10,<f22=int6464#9
# asm 2: psrldq $10,<f22=%xmm8
psrldq $10,%xmm8

# qhasm:  uint32323232 f25 ^= *(int128 *) (pos23 + 16 + matrix)
# asm 1: pxor 16(<pos23=int64#13,<matrix=int64#4,1),<f25=int6464#7
# asm 2: pxor 16(<pos23=%r15,<matrix=%rcx,1),<f25=%xmm6
pxor 16(%r15,%rcx,1),%xmm6

# qhasm:  assign 7 to pos84

# qhasm:  f87 <<= 48
# asm 1: pslldq $6,<f87=int6464#1
# asm 2: pslldq $6,<f87=%xmm0
pslldq $6,%xmm0

# qhasm:  f85 ^= f22
# asm 1: pxor  <f22=int6464#9,<f85=int6464#3
# asm 2: pxor  <f22=%xmm8,<f85=%xmm2
pxor  %xmm8,%xmm2

# qhasm:  uint32323232 f83 ^= *(int128 *) (pos83 + 48 + matrix)
# asm 1: pxor 48(<pos83=int64#1,<matrix=int64#4,1),<f83=int6464#2
# asm 2: pxor 48(<pos83=%rdi,<matrix=%rcx,1),<f83=%xmm1
pxor 48(%rdi,%rcx,1),%xmm1

# qhasm:  v = f83
# asm 1: movdqa <f83=int6464#2,>v=int6464#6
# asm 2: movdqa <f83=%xmm1,>v=%xmm5
movdqa %xmm1,%xmm5

# qhasm:  f26 = *(int128 *) (pos23 + 0 + matrix)
# asm 1: movdqa 0(<pos23=int64#13,<matrix=int64#4),>f26=int6464#9
# asm 2: movdqa 0(<pos23=%r15,<matrix=%rcx),>f26=%xmm8
movdqa 0(%r15,%rcx),%xmm8

# qhasm:  uint6464 f83 <<= 3
# asm 1: psllq $3,<f83=int6464#2
# asm 2: psllq $3,<f83=%xmm1
psllq $3,%xmm1

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f84 ^= *(int128 *) (pos83 + 32 + matrix)
# asm 1: pxor 32(<pos83=int64#1,<matrix=int64#4,1),<f84=int6464#4
# asm 2: pxor 32(<pos83=%rdi,<matrix=%rcx,1),<f84=%xmm3
pxor 32(%rdi,%rcx,1),%xmm3

# qhasm:  (uint32) pos25 = pos31
# asm 1: mov  <pos31=int64#14d,>pos25=int64#11d
# asm 2: mov  <pos31=%ebx,>pos25=%r13d
mov  %ebx,%r13d

# qhasm:  f87 ^= f83
# asm 1: pxor  <f83=int6464#2,<f87=int6464#1
# asm 2: pxor  <f83=%xmm1,<f87=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  (uint32) pos25 >>= 2
# asm 1: shr  $2,<pos25=int64#11d
# asm 2: shr  $2,<pos25=%r13d
shr  $2,%r13d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#2
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm1
pshufd $0x45,%xmm5,%xmm1

# qhasm:  uint32323232 f85 ^= *(int128 *) (pos83 + 16 + matrix)
# asm 1: pxor 16(<pos83=int64#1,<matrix=int64#4,1),<f85=int6464#3
# asm 2: pxor 16(<pos83=%rdi,<matrix=%rcx,1),<f85=%xmm2
pxor 16(%rdi,%rcx,1),%xmm2

# qhasm:  (uint32) pos25 &= mask
# asm 1: andl <mask=int64#8d,<pos25=int64#11d
# asm 2: andl <mask=%r10d,<pos25=%r13d
andl %r10d,%r13d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f87 ^= w
# asm 1: pxor  <w=int6464#2,<f87=int6464#1
# asm 2: pxor  <w=%xmm1,<f87=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  uint32323232 f86 ^= *(int128 *) (pos83 + 0 + matrix)
# asm 1: pxor 0(<pos83=int64#1,<matrix=int64#4,1),<f86=int6464#5
# asm 2: pxor 0(<pos83=%rdi,<matrix=%rcx,1),<f86=%xmm4
pxor 0(%rdi,%rcx,1),%xmm4

# qhasm:  f86 ^= v
# asm 1: pxor  <v=int6464#6,<f86=int6464#5
# asm 2: pxor  <v=%xmm5,<f86=%xmm4
pxor  %xmm5,%xmm4

# qhasm:  pos85 = pos87
# asm 1: mov  <pos87=int64#12,>pos85=int64#1
# asm 2: mov  <pos87=%r14,>pos85=%rdi
mov  %r14,%rdi

# qhasm:  uint32323232 f24 ^= *(int128 *) (pos24 + 48 + matrix)
# asm 1: pxor 48(<pos24=int64#10,<matrix=int64#4,1),<f24=int6464#10
# asm 2: pxor 48(<pos24=%r12,<matrix=%rcx,1),<f24=%xmm9
pxor 48(%r12,%rcx,1),%xmm9

# qhasm:  (uint64) pos85 >>= 34
# asm 1: shr  $34,<pos85=int64#1
# asm 2: shr  $34,<pos85=%rdi
shr  $34,%rdi

# qhasm:  f88 = f24
# asm 1: movdqa <f24=int6464#10,>f88=int6464#2
# asm 2: movdqa <f24=%xmm9,>f88=%xmm1
movdqa %xmm9,%xmm1

# qhasm:  uint32323232 f25 ^= *(int128 *) (pos24 + 32 + matrix)
# asm 1: pxor 32(<pos24=int64#10,<matrix=int64#4,1),<f25=int6464#7
# asm 2: pxor 32(<pos24=%r12,<matrix=%rcx,1),<f25=%xmm6
pxor 32(%r12,%rcx,1),%xmm6

# qhasm:  (uint32) pos85 &= mask
# asm 1: andl <mask=int64#8d,<pos85=int64#1d
# asm 2: andl <mask=%r10d,<pos85=%edi
andl %r10d,%edi

# qhasm:  f23 >>= 80
# asm 1: psrldq $10,<f23=int6464#8
# asm 2: psrldq $10,<f23=%xmm7
psrldq $10,%xmm7

# qhasm:  uint32323232 f26 ^= *(int128 *) (pos24 + 16 + matrix)
# asm 1: pxor 16(<pos24=int64#10,<matrix=int64#4,1),<f26=int6464#9
# asm 2: pxor 16(<pos24=%r12,<matrix=%rcx,1),<f26=%xmm8
pxor 16(%r12,%rcx,1),%xmm8

# qhasm:  assign 1 to pos85

# qhasm:  f88 <<= 48
# asm 1: pslldq $6,<f88=int6464#2
# asm 2: pslldq $6,<f88=%xmm1
pslldq $6,%xmm1

# qhasm:  f86 ^= f23
# asm 1: pxor  <f23=int6464#8,<f86=int6464#5
# asm 2: pxor  <f23=%xmm7,<f86=%xmm4
pxor  %xmm7,%xmm4

# qhasm:  uint32323232 f84 ^= *(int128 *) (pos84 + 48 + matrix)
# asm 1: pxor 48(<pos84=int64#7,<matrix=int64#4,1),<f84=int6464#4
# asm 2: pxor 48(<pos84=%rax,<matrix=%rcx,1),<f84=%xmm3
pxor 48(%rax,%rcx,1),%xmm3

# qhasm:  v = f84
# asm 1: movdqa <f84=int6464#4,>v=int6464#6
# asm 2: movdqa <f84=%xmm3,>v=%xmm5
movdqa %xmm3,%xmm5

# qhasm:  f27 = *(int128 *) (pos24 + 0 + matrix)
# asm 1: movdqa 0(<pos24=int64#10,<matrix=int64#4),>f27=int6464#8
# asm 2: movdqa 0(<pos24=%r12,<matrix=%rcx),>f27=%xmm7
movdqa 0(%r12,%rcx),%xmm7

# qhasm:  uint6464 f84 <<= 3
# asm 1: psllq $3,<f84=int6464#4
# asm 2: psllq $3,<f84=%xmm3
psllq $3,%xmm3

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f85 ^= *(int128 *) (pos84 + 32 + matrix)
# asm 1: pxor 32(<pos84=int64#7,<matrix=int64#4,1),<f85=int6464#3
# asm 2: pxor 32(<pos84=%rax,<matrix=%rcx,1),<f85=%xmm2
pxor 32(%rax,%rcx,1),%xmm2

# qhasm:  (uint32) pos26 = pos31
# asm 1: mov  <pos31=int64#14d,>pos26=int64#10d
# asm 2: mov  <pos31=%ebx,>pos26=%r12d
mov  %ebx,%r12d

# qhasm:  f88 ^= f84
# asm 1: pxor  <f84=int6464#4,<f88=int6464#2
# asm 2: pxor  <f84=%xmm3,<f88=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  (uint32) pos26 >>= 10
# asm 1: shr  $10,<pos26=int64#10d
# asm 2: shr  $10,<pos26=%r12d
shr  $10,%r12d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#4
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm3
pshufd $0x45,%xmm5,%xmm3

# qhasm:  uint32323232 f86 ^= *(int128 *) (pos84 + 16 + matrix)
# asm 1: pxor 16(<pos84=int64#7,<matrix=int64#4,1),<f86=int6464#5
# asm 2: pxor 16(<pos84=%rax,<matrix=%rcx,1),<f86=%xmm4
pxor 16(%rax,%rcx,1),%xmm4

# qhasm:  (uint32) pos26 &= mask
# asm 1: andl <mask=int64#8d,<pos26=int64#10d
# asm 2: andl <mask=%r10d,<pos26=%r12d
andl %r10d,%r12d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f88 ^= w
# asm 1: pxor  <w=int6464#4,<f88=int6464#2
# asm 2: pxor  <w=%xmm3,<f88=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  uint32323232 f87 ^= *(int128 *) (pos84 + 0 + matrix)
# asm 1: pxor 0(<pos84=int64#7,<matrix=int64#4,1),<f87=int6464#1
# asm 2: pxor 0(<pos84=%rax,<matrix=%rcx,1),<f87=%xmm0
pxor 0(%rax,%rcx,1),%xmm0

# qhasm:  f87 ^= v
# asm 1: pxor  <v=int6464#6,<f87=int6464#1
# asm 2: pxor  <v=%xmm5,<f87=%xmm0
pxor  %xmm5,%xmm0

# qhasm:  pos95 = *(int64 *) (bp + 24)
# asm 1: movq   24(<bp=int64#2),>pos95=int64#13
# asm 2: movq   24(<bp=%rsi),>pos95=%r15
movq   24(%rsi),%r15

# qhasm:  pos86 = pos87
# asm 1: mov  <pos87=int64#12,>pos86=int64#15
# asm 2: mov  <pos87=%r14,>pos86=%rbp
mov  %r14,%rbp

# qhasm:  uint32323232 f25 ^= *(int128 *) (pos25 + 48 + matrix)
# asm 1: pxor 48(<pos25=int64#11,<matrix=int64#4,1),<f25=int6464#7
# asm 2: pxor 48(<pos25=%r13,<matrix=%rcx,1),<f25=%xmm6
pxor 48(%r13,%rcx,1),%xmm6

# qhasm:  (uint64) pos86 >>= 42
# asm 1: shr  $42,<pos86=int64#15
# asm 2: shr  $42,<pos86=%rbp
shr  $42,%rbp

# qhasm:  f89 = f25
# asm 1: movdqa <f25=int6464#7,>f89=int6464#4
# asm 2: movdqa <f25=%xmm6,>f89=%xmm3
movdqa %xmm6,%xmm3

# qhasm:  uint32323232 f26 ^= *(int128 *) (pos25 + 32 + matrix)
# asm 1: pxor 32(<pos25=int64#11,<matrix=int64#4,1),<f26=int6464#9
# asm 2: pxor 32(<pos25=%r13,<matrix=%rcx,1),<f26=%xmm8
pxor 32(%r13,%rcx,1),%xmm8

# qhasm:  (uint32) pos86 &= mask
# asm 1: andl <mask=int64#8d,<pos86=int64#15d
# asm 2: andl <mask=%r10d,<pos86=%ebp
andl %r10d,%ebp

# qhasm:  f24 >>= 80
# asm 1: psrldq $10,<f24=int6464#10
# asm 2: psrldq $10,<f24=%xmm9
psrldq $10,%xmm9

# qhasm:  uint32323232 f27 ^= *(int128 *) (pos25 + 16 + matrix)
# asm 1: pxor 16(<pos25=int64#11,<matrix=int64#4,1),<f27=int6464#8
# asm 2: pxor 16(<pos25=%r13,<matrix=%rcx,1),<f27=%xmm7
pxor 16(%r13,%rcx,1),%xmm7

# qhasm:  assign 15 to pos86

# qhasm:  f89 <<= 48
# asm 1: pslldq $6,<f89=int6464#4
# asm 2: pslldq $6,<f89=%xmm3
pslldq $6,%xmm3

# qhasm:  f87 ^= f24
# asm 1: pxor  <f24=int6464#10,<f87=int6464#1
# asm 2: pxor  <f24=%xmm9,<f87=%xmm0
pxor  %xmm9,%xmm0

# qhasm:  uint32323232 f85 ^= *(int128 *) (pos85 + 48 + matrix)
# asm 1: pxor 48(<pos85=int64#1,<matrix=int64#4,1),<f85=int6464#3
# asm 2: pxor 48(<pos85=%rdi,<matrix=%rcx,1),<f85=%xmm2
pxor 48(%rdi,%rcx,1),%xmm2

# qhasm:  v = f85
# asm 1: movdqa <f85=int6464#3,>v=int6464#6
# asm 2: movdqa <f85=%xmm2,>v=%xmm5
movdqa %xmm2,%xmm5

# qhasm:  f28 = *(int128 *) (pos25 + 0 + matrix)
# asm 1: movdqa 0(<pos25=int64#11,<matrix=int64#4),>f28=int6464#10
# asm 2: movdqa 0(<pos25=%r13,<matrix=%rcx),>f28=%xmm9
movdqa 0(%r13,%rcx),%xmm9

# qhasm:  uint6464 f85 <<= 3
# asm 1: psllq $3,<f85=int6464#3
# asm 2: psllq $3,<f85=%xmm2
psllq $3,%xmm2

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f86 ^= *(int128 *) (pos85 + 32 + matrix)
# asm 1: pxor 32(<pos85=int64#1,<matrix=int64#4,1),<f86=int6464#5
# asm 2: pxor 32(<pos85=%rdi,<matrix=%rcx,1),<f86=%xmm4
pxor 32(%rdi,%rcx,1),%xmm4

# qhasm:  (uint32) pos27 = pos31
# asm 1: mov  <pos31=int64#14d,>pos27=int64#11d
# asm 2: mov  <pos31=%ebx,>pos27=%r13d
mov  %ebx,%r13d

# qhasm:  f89 ^= f85
# asm 1: pxor  <f85=int6464#3,<f89=int6464#4
# asm 2: pxor  <f85=%xmm2,<f89=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  (uint32) pos27 >>= 18
# asm 1: shr  $18,<pos27=int64#11d
# asm 2: shr  $18,<pos27=%r13d
shr  $18,%r13d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#3
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm2
pshufd $0x45,%xmm5,%xmm2

# qhasm:  uint32323232 f87 ^= *(int128 *) (pos85 + 16 + matrix)
# asm 1: pxor 16(<pos85=int64#1,<matrix=int64#4,1),<f87=int6464#1
# asm 2: pxor 16(<pos85=%rdi,<matrix=%rcx,1),<f87=%xmm0
pxor 16(%rdi,%rcx,1),%xmm0

# qhasm:  (uint32) pos27 &= mask
# asm 1: andl <mask=int64#8d,<pos27=int64#11d
# asm 2: andl <mask=%r10d,<pos27=%r13d
andl %r10d,%r13d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f89 ^= w
# asm 1: pxor  <w=int6464#3,<f89=int6464#4
# asm 2: pxor  <w=%xmm2,<f89=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  uint32323232 f88 ^= *(int128 *) (pos85 + 0 + matrix)
# asm 1: pxor 0(<pos85=int64#1,<matrix=int64#4,1),<f88=int6464#2
# asm 2: pxor 0(<pos85=%rdi,<matrix=%rcx,1),<f88=%xmm1
pxor 0(%rdi,%rcx,1),%xmm1

# qhasm:  f88 ^= v
# asm 1: pxor  <v=int6464#6,<f88=int6464#2
# asm 2: pxor  <v=%xmm5,<f88=%xmm1
pxor  %xmm5,%xmm1

# qhasm:  uint32323232 f26 ^= *(int128 *) (pos26 + 48 + matrix)
# asm 1: pxor 48(<pos26=int64#10,<matrix=int64#4,1),<f26=int6464#9
# asm 2: pxor 48(<pos26=%r12,<matrix=%rcx,1),<f26=%xmm8
pxor 48(%r12,%rcx,1),%xmm8

# qhasm:  (uint64) pos87 >>= 50
# asm 1: shr  $50,<pos87=int64#12
# asm 2: shr  $50,<pos87=%r14
shr  $50,%r14

# qhasm:  f90 = f26
# asm 1: movdqa <f26=int6464#9,>f90=int6464#3
# asm 2: movdqa <f26=%xmm8,>f90=%xmm2
movdqa %xmm8,%xmm2

# qhasm:  uint32323232 f27 ^= *(int128 *) (pos26 + 32 + matrix)
# asm 1: pxor 32(<pos26=int64#10,<matrix=int64#4,1),<f27=int6464#8
# asm 2: pxor 32(<pos26=%r12,<matrix=%rcx,1),<f27=%xmm7
pxor 32(%r12,%rcx,1),%xmm7

# qhasm:  (uint32) pos87 &= mask
# asm 1: andl <mask=int64#8d,<pos87=int64#12d
# asm 2: andl <mask=%r10d,<pos87=%r14d
andl %r10d,%r14d

# qhasm:  f25 >>= 80
# asm 1: psrldq $10,<f25=int6464#7
# asm 2: psrldq $10,<f25=%xmm6
psrldq $10,%xmm6

# qhasm:  uint32323232 f28 ^= *(int128 *) (pos26 + 16 + matrix)
# asm 1: pxor 16(<pos26=int64#10,<matrix=int64#4,1),<f28=int6464#10
# asm 2: pxor 16(<pos26=%r12,<matrix=%rcx,1),<f28=%xmm9
pxor 16(%r12,%rcx,1),%xmm9

# qhasm:  assign 14 to pos87

# qhasm:  f90 <<= 48
# asm 1: pslldq $6,<f90=int6464#3
# asm 2: pslldq $6,<f90=%xmm2
pslldq $6,%xmm2

# qhasm:  f88 ^= f25
# asm 1: pxor  <f25=int6464#7,<f88=int6464#2
# asm 2: pxor  <f25=%xmm6,<f88=%xmm1
pxor  %xmm6,%xmm1

# qhasm:  uint32323232 f86 ^= *(int128 *) (pos86 + 48 + matrix)
# asm 1: pxor 48(<pos86=int64#15,<matrix=int64#4,1),<f86=int6464#5
# asm 2: pxor 48(<pos86=%rbp,<matrix=%rcx,1),<f86=%xmm4
pxor 48(%rbp,%rcx,1),%xmm4

# qhasm:  v = f86
# asm 1: movdqa <f86=int6464#5,>v=int6464#6
# asm 2: movdqa <f86=%xmm4,>v=%xmm5
movdqa %xmm4,%xmm5

# qhasm:  f29 = *(int128 *) (pos26 + 0 + matrix)
# asm 1: movdqa 0(<pos26=int64#10,<matrix=int64#4),>f29=int6464#7
# asm 2: movdqa 0(<pos26=%r12,<matrix=%rcx),>f29=%xmm6
movdqa 0(%r12,%rcx),%xmm6

# qhasm:  uint6464 f86 <<= 3
# asm 1: psllq $3,<f86=int6464#5
# asm 2: psllq $3,<f86=%xmm4
psllq $3,%xmm4

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos28 = pos31
# asm 1: mov  <pos31=int64#14,>pos28=int64#7
# asm 2: mov  <pos31=%rbx,>pos28=%rax
mov  %rbx,%rax

# qhasm:  uint32323232 f87 ^= *(int128 *) (pos86 + 32 + matrix)
# asm 1: pxor 32(<pos86=int64#15,<matrix=int64#4,1),<f87=int6464#1
# asm 2: pxor 32(<pos86=%rbp,<matrix=%rcx,1),<f87=%xmm0
pxor 32(%rbp,%rcx,1),%xmm0

# qhasm:  f90 ^= f86
# asm 1: pxor  <f86=int6464#5,<f90=int6464#3
# asm 2: pxor  <f86=%xmm4,<f90=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  (uint64) pos28 >>= 26
# asm 1: shr  $26,<pos28=int64#7
# asm 2: shr  $26,<pos28=%rax
shr  $26,%rax

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#5
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm4
pshufd $0x45,%xmm5,%xmm4

# qhasm:  uint32323232 f88 ^= *(int128 *) (pos86 + 16 + matrix)
# asm 1: pxor 16(<pos86=int64#15,<matrix=int64#4,1),<f88=int6464#2
# asm 2: pxor 16(<pos86=%rbp,<matrix=%rcx,1),<f88=%xmm1
pxor 16(%rbp,%rcx,1),%xmm1

# qhasm:  (uint32) pos28 &= mask
# asm 1: andl <mask=int64#8d,<pos28=int64#7d
# asm 2: andl <mask=%r10d,<pos28=%eax
andl %r10d,%eax

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 7 to pos28

# qhasm:  f90 ^= w
# asm 1: pxor  <w=int6464#5,<f90=int6464#3
# asm 2: pxor  <w=%xmm4,<f90=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  uint32323232 f89 ^= *(int128 *) (pos86 + 0 + matrix)
# asm 1: pxor 0(<pos86=int64#15,<matrix=int64#4,1),<f89=int6464#4
# asm 2: pxor 0(<pos86=%rbp,<matrix=%rcx,1),<f89=%xmm3
pxor 0(%rbp,%rcx,1),%xmm3

# qhasm:  f89 ^= v
# asm 1: pxor  <v=int6464#6,<f89=int6464#4
# asm 2: pxor  <v=%xmm5,<f89=%xmm3
pxor  %xmm5,%xmm3

# qhasm:  (uint32) pos88 = pos95
# asm 1: mov  <pos95=int64#13d,>pos88=int64#10d
# asm 2: mov  <pos95=%r15d,>pos88=%r12d
mov  %r15d,%r12d

# qhasm:  uint32323232 f27 ^= *(int128 *) (pos27 + 48 + matrix)
# asm 1: pxor 48(<pos27=int64#11,<matrix=int64#4,1),<f27=int6464#8
# asm 2: pxor 48(<pos27=%r13,<matrix=%rcx,1),<f27=%xmm7
pxor 48(%r13,%rcx,1),%xmm7

# qhasm:  (uint32) pos88 <<= 6
# asm 1: shl  $6,<pos88=int64#10d
# asm 2: shl  $6,<pos88=%r12d
shl  $6,%r12d

# qhasm:  f91 = f27
# asm 1: movdqa <f27=int6464#8,>f91=int6464#5
# asm 2: movdqa <f27=%xmm7,>f91=%xmm4
movdqa %xmm7,%xmm4

# qhasm:  uint32323232 f28 ^= *(int128 *) (pos27 + 32 + matrix)
# asm 1: pxor 32(<pos27=int64#11,<matrix=int64#4,1),<f28=int6464#10
# asm 2: pxor 32(<pos27=%r13,<matrix=%rcx,1),<f28=%xmm9
pxor 32(%r13,%rcx,1),%xmm9

# qhasm:  (uint32) pos88 &= mask
# asm 1: andl <mask=int64#8d,<pos88=int64#10d
# asm 2: andl <mask=%r10d,<pos88=%r12d
andl %r10d,%r12d

# qhasm:  f26 >>= 80
# asm 1: psrldq $10,<f26=int6464#9
# asm 2: psrldq $10,<f26=%xmm8
psrldq $10,%xmm8

# qhasm:  uint32323232 f29 ^= *(int128 *) (pos27 + 16 + matrix)
# asm 1: pxor 16(<pos27=int64#11,<matrix=int64#4,1),<f29=int6464#7
# asm 2: pxor 16(<pos27=%r13,<matrix=%rcx,1),<f29=%xmm6
pxor 16(%r13,%rcx,1),%xmm6

# qhasm:  f91 <<= 48
# asm 1: pslldq $6,<f91=int6464#5
# asm 2: pslldq $6,<f91=%xmm4
pslldq $6,%xmm4

# qhasm:  f89 ^= f26
# asm 1: pxor  <f26=int6464#9,<f89=int6464#4
# asm 2: pxor  <f26=%xmm8,<f89=%xmm3
pxor  %xmm8,%xmm3

# qhasm:  uint32323232 f87 ^= *(int128 *) (pos87 + 48 + matrix)
# asm 1: pxor 48(<pos87=int64#12,<matrix=int64#4,1),<f87=int6464#1
# asm 2: pxor 48(<pos87=%r14,<matrix=%rcx,1),<f87=%xmm0
pxor 48(%r14,%rcx,1),%xmm0

# qhasm:  v = f87
# asm 1: movdqa <f87=int6464#1,>v=int6464#6
# asm 2: movdqa <f87=%xmm0,>v=%xmm5
movdqa %xmm0,%xmm5

# qhasm:  f30 = *(int128 *) (pos27 + 0 + matrix)
# asm 1: movdqa 0(<pos27=int64#11,<matrix=int64#4),>f30=int6464#9
# asm 2: movdqa 0(<pos27=%r13,<matrix=%rcx),>f30=%xmm8
movdqa 0(%r13,%rcx),%xmm8

# qhasm:  uint6464 f87 <<= 3
# asm 1: psllq $3,<f87=int6464#1
# asm 2: psllq $3,<f87=%xmm0
psllq $3,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos29 = pos31
# asm 1: mov  <pos31=int64#14,>pos29=int64#1
# asm 2: mov  <pos31=%rbx,>pos29=%rdi
mov  %rbx,%rdi

# qhasm:  uint32323232 f88 ^= *(int128 *) (pos87 + 32 + matrix)
# asm 1: pxor 32(<pos87=int64#12,<matrix=int64#4,1),<f88=int6464#2
# asm 2: pxor 32(<pos87=%r14,<matrix=%rcx,1),<f88=%xmm1
pxor 32(%r14,%rcx,1),%xmm1

# qhasm:  f91 ^= f87
# asm 1: pxor  <f87=int6464#1,<f91=int6464#5
# asm 2: pxor  <f87=%xmm0,<f91=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  (uint64) pos29 >>= 34
# asm 1: shr  $34,<pos29=int64#1
# asm 2: shr  $34,<pos29=%rdi
shr  $34,%rdi

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#1
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm0
pshufd $0x45,%xmm5,%xmm0

# qhasm:  uint32323232 f89 ^= *(int128 *) (pos87 + 16 + matrix)
# asm 1: pxor 16(<pos87=int64#12,<matrix=int64#4,1),<f89=int6464#4
# asm 2: pxor 16(<pos87=%r14,<matrix=%rcx,1),<f89=%xmm3
pxor 16(%r14,%rcx,1),%xmm3

# qhasm:  (uint32) pos29 &= mask
# asm 1: andl <mask=int64#8d,<pos29=int64#1d
# asm 2: andl <mask=%r10d,<pos29=%edi
andl %r10d,%edi

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 1 to pos29

# qhasm:  f91 ^= w
# asm 1: pxor  <w=int6464#1,<f91=int6464#5
# asm 2: pxor  <w=%xmm0,<f91=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  uint32323232 f90 ^= *(int128 *) (pos87 + 0 + matrix)
# asm 1: pxor 0(<pos87=int64#12,<matrix=int64#4,1),<f90=int6464#3
# asm 2: pxor 0(<pos87=%r14,<matrix=%rcx,1),<f90=%xmm2
pxor 0(%r14,%rcx,1),%xmm2

# qhasm:  f90 ^= v
# asm 1: pxor  <v=int6464#6,<f90=int6464#3
# asm 2: pxor  <v=%xmm5,<f90=%xmm2
pxor  %xmm5,%xmm2

# qhasm:  (uint32) pos89 = pos95
# asm 1: mov  <pos95=int64#13d,>pos89=int64#11d
# asm 2: mov  <pos95=%r15d,>pos89=%r13d
mov  %r15d,%r13d

# qhasm:  uint32323232 f28 ^= *(int128 *) (pos28 + 48 + matrix)
# asm 1: pxor 48(<pos28=int64#7,<matrix=int64#4,1),<f28=int6464#10
# asm 2: pxor 48(<pos28=%rax,<matrix=%rcx,1),<f28=%xmm9
pxor 48(%rax,%rcx,1),%xmm9

# qhasm:  (uint32) pos89 >>= 2
# asm 1: shr  $2,<pos89=int64#11d
# asm 2: shr  $2,<pos89=%r13d
shr  $2,%r13d

# qhasm:  f92 = f28
# asm 1: movdqa <f28=int6464#10,>f92=int6464#1
# asm 2: movdqa <f28=%xmm9,>f92=%xmm0
movdqa %xmm9,%xmm0

# qhasm:  uint32323232 f29 ^= *(int128 *) (pos28 + 32 + matrix)
# asm 1: pxor 32(<pos28=int64#7,<matrix=int64#4,1),<f29=int6464#7
# asm 2: pxor 32(<pos28=%rax,<matrix=%rcx,1),<f29=%xmm6
pxor 32(%rax,%rcx,1),%xmm6

# qhasm:  (uint32) pos89 &= mask
# asm 1: andl <mask=int64#8d,<pos89=int64#11d
# asm 2: andl <mask=%r10d,<pos89=%r13d
andl %r10d,%r13d

# qhasm:  f27 >>= 80
# asm 1: psrldq $10,<f27=int6464#8
# asm 2: psrldq $10,<f27=%xmm7
psrldq $10,%xmm7

# qhasm:  uint32323232 f30 ^= *(int128 *) (pos28 + 16 + matrix)
# asm 1: pxor 16(<pos28=int64#7,<matrix=int64#4,1),<f30=int6464#9
# asm 2: pxor 16(<pos28=%rax,<matrix=%rcx,1),<f30=%xmm8
pxor 16(%rax,%rcx,1),%xmm8

# qhasm:  f92 <<= 48
# asm 1: pslldq $6,<f92=int6464#1
# asm 2: pslldq $6,<f92=%xmm0
pslldq $6,%xmm0

# qhasm:  f90 ^= f27
# asm 1: pxor  <f27=int6464#8,<f90=int6464#3
# asm 2: pxor  <f27=%xmm7,<f90=%xmm2
pxor  %xmm7,%xmm2

# qhasm:  uint32323232 f88 ^= *(int128 *) (pos88 + 48 + matrix)
# asm 1: pxor 48(<pos88=int64#10,<matrix=int64#4,1),<f88=int6464#2
# asm 2: pxor 48(<pos88=%r12,<matrix=%rcx,1),<f88=%xmm1
pxor 48(%r12,%rcx,1),%xmm1

# qhasm:  pos39 = ((uint64 *)&state2)[0]
# asm 1: movq <state2=stack128#3,>pos39=int64#12
# asm 2: movq <state2=32(%rsp),>pos39=%r14
movq 32(%rsp),%r14

# qhasm:  v = f88
# asm 1: movdqa <f88=int6464#2,>v=int6464#6
# asm 2: movdqa <f88=%xmm1,>v=%xmm5
movdqa %xmm1,%xmm5

# qhasm:  f31 = *(int128 *) (pos28 + 0 + matrix)
# asm 1: movdqa 0(<pos28=int64#7,<matrix=int64#4),>f31=int6464#8
# asm 2: movdqa 0(<pos28=%rax,<matrix=%rcx),>f31=%xmm7
movdqa 0(%rax,%rcx),%xmm7

# qhasm:  uint6464 f88 <<= 3
# asm 1: psllq $3,<f88=int6464#2
# asm 2: psllq $3,<f88=%xmm1
psllq $3,%xmm1

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos30 = pos31
# asm 1: mov  <pos31=int64#14,>pos30=int64#15
# asm 2: mov  <pos31=%rbx,>pos30=%rbp
mov  %rbx,%rbp

# qhasm:  uint32323232 f89 ^= *(int128 *) (pos88 + 32 + matrix)
# asm 1: pxor 32(<pos88=int64#10,<matrix=int64#4,1),<f89=int6464#4
# asm 2: pxor 32(<pos88=%r12,<matrix=%rcx,1),<f89=%xmm3
pxor 32(%r12,%rcx,1),%xmm3

# qhasm:  f92 ^= f88
# asm 1: pxor  <f88=int6464#2,<f92=int6464#1
# asm 2: pxor  <f88=%xmm1,<f92=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  (uint64) pos30 >>= 42
# asm 1: shr  $42,<pos30=int64#15
# asm 2: shr  $42,<pos30=%rbp
shr  $42,%rbp

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#2
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm1
pshufd $0x45,%xmm5,%xmm1

# qhasm:  uint32323232 f90 ^= *(int128 *) (pos88 + 16 + matrix)
# asm 1: pxor 16(<pos88=int64#10,<matrix=int64#4,1),<f90=int6464#3
# asm 2: pxor 16(<pos88=%r12,<matrix=%rcx,1),<f90=%xmm2
pxor 16(%r12,%rcx,1),%xmm2

# qhasm:  (uint32) pos30 &= mask
# asm 1: andl <mask=int64#8d,<pos30=int64#15d
# asm 2: andl <mask=%r10d,<pos30=%ebp
andl %r10d,%ebp

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 15 to pos30

# qhasm:  f92 ^= w
# asm 1: pxor  <w=int6464#2,<f92=int6464#1
# asm 2: pxor  <w=%xmm1,<f92=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  uint32323232 f91 ^= *(int128 *) (pos88 + 0 + matrix)
# asm 1: pxor 0(<pos88=int64#10,<matrix=int64#4,1),<f91=int6464#5
# asm 2: pxor 0(<pos88=%r12,<matrix=%rcx,1),<f91=%xmm4
pxor 0(%r12,%rcx,1),%xmm4

# qhasm:  f91 ^= v
# asm 1: pxor  <v=int6464#6,<f91=int6464#5
# asm 2: pxor  <v=%xmm5,<f91=%xmm4
pxor  %xmm5,%xmm4

# qhasm:  (uint32) pos90 = pos95
# asm 1: mov  <pos95=int64#13d,>pos90=int64#7d
# asm 2: mov  <pos95=%r15d,>pos90=%eax
mov  %r15d,%eax

# qhasm:  uint32323232 f29 ^= *(int128 *) (pos29 + 48 + matrix)
# asm 1: pxor 48(<pos29=int64#1,<matrix=int64#4,1),<f29=int6464#7
# asm 2: pxor 48(<pos29=%rdi,<matrix=%rcx,1),<f29=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm:  (uint32) pos90 >>= 10
# asm 1: shr  $10,<pos90=int64#7d
# asm 2: shr  $10,<pos90=%eax
shr  $10,%eax

# qhasm:  f93 = f29
# asm 1: movdqa <f29=int6464#7,>f93=int6464#2
# asm 2: movdqa <f29=%xmm6,>f93=%xmm1
movdqa %xmm6,%xmm1

# qhasm:  uint32323232 f30 ^= *(int128 *) (pos29 + 32 + matrix)
# asm 1: pxor 32(<pos29=int64#1,<matrix=int64#4,1),<f30=int6464#9
# asm 2: pxor 32(<pos29=%rdi,<matrix=%rcx,1),<f30=%xmm8
pxor 32(%rdi,%rcx,1),%xmm8

# qhasm:  (uint32) pos90 &= mask
# asm 1: andl <mask=int64#8d,<pos90=int64#7d
# asm 2: andl <mask=%r10d,<pos90=%eax
andl %r10d,%eax

# qhasm:  f28 >>= 80
# asm 1: psrldq $10,<f28=int6464#10
# asm 2: psrldq $10,<f28=%xmm9
psrldq $10,%xmm9

# qhasm:  uint32323232 f31 ^= *(int128 *) (pos29 + 16 + matrix)
# asm 1: pxor 16(<pos29=int64#1,<matrix=int64#4,1),<f31=int6464#8
# asm 2: pxor 16(<pos29=%rdi,<matrix=%rcx,1),<f31=%xmm7
pxor 16(%rdi,%rcx,1),%xmm7

# qhasm:  f93 <<= 48
# asm 1: pslldq $6,<f93=int6464#2
# asm 2: pslldq $6,<f93=%xmm1
pslldq $6,%xmm1

# qhasm:  f91 ^= f28
# asm 1: pxor  <f28=int6464#10,<f91=int6464#5
# asm 2: pxor  <f28=%xmm9,<f91=%xmm4
pxor  %xmm9,%xmm4

# qhasm:  uint32323232 f89 ^= *(int128 *) (pos89 + 48 + matrix)
# asm 1: pxor 48(<pos89=int64#11,<matrix=int64#4,1),<f89=int6464#4
# asm 2: pxor 48(<pos89=%r13,<matrix=%rcx,1),<f89=%xmm3
pxor 48(%r13,%rcx,1),%xmm3

# qhasm:  v = f89
# asm 1: movdqa <f89=int6464#4,>v=int6464#6
# asm 2: movdqa <f89=%xmm3,>v=%xmm5
movdqa %xmm3,%xmm5

# qhasm:  f32 = *(int128 *) (pos29 + 0 + matrix)
# asm 1: movdqa 0(<pos29=int64#1,<matrix=int64#4),>f32=int6464#10
# asm 2: movdqa 0(<pos29=%rdi,<matrix=%rcx),>f32=%xmm9
movdqa 0(%rdi,%rcx),%xmm9

# qhasm:  uint6464 f89 <<= 3
# asm 1: psllq $3,<f89=int6464#4
# asm 2: psllq $3,<f89=%xmm3
psllq $3,%xmm3

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f90 ^= *(int128 *) (pos89 + 32 + matrix)
# asm 1: pxor 32(<pos89=int64#11,<matrix=int64#4,1),<f90=int6464#3
# asm 2: pxor 32(<pos89=%r13,<matrix=%rcx,1),<f90=%xmm2
pxor 32(%r13,%rcx,1),%xmm2

# qhasm:  f93 ^= f89
# asm 1: pxor  <f89=int6464#4,<f93=int6464#2
# asm 2: pxor  <f89=%xmm3,<f93=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  (uint64) pos31 >>= 50
# asm 1: shr  $50,<pos31=int64#14
# asm 2: shr  $50,<pos31=%rbx
shr  $50,%rbx

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#4
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm3
pshufd $0x45,%xmm5,%xmm3

# qhasm:  uint32323232 f91 ^= *(int128 *) (pos89 + 16 + matrix)
# asm 1: pxor 16(<pos89=int64#11,<matrix=int64#4,1),<f91=int6464#5
# asm 2: pxor 16(<pos89=%r13,<matrix=%rcx,1),<f91=%xmm4
pxor 16(%r13,%rcx,1),%xmm4

# qhasm:  (uint32) pos31 &= mask
# asm 1: andl <mask=int64#8d,<pos31=int64#14d
# asm 2: andl <mask=%r10d,<pos31=%ebx
andl %r10d,%ebx

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 14 to pos31

# qhasm:  f93 ^= w
# asm 1: pxor  <w=int6464#4,<f93=int6464#2
# asm 2: pxor  <w=%xmm3,<f93=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  uint32323232 f92 ^= *(int128 *) (pos89 + 0 + matrix)
# asm 1: pxor 0(<pos89=int64#11,<matrix=int64#4,1),<f92=int6464#1
# asm 2: pxor 0(<pos89=%r13,<matrix=%rcx,1),<f92=%xmm0
pxor 0(%r13,%rcx,1),%xmm0

# qhasm:  f92 ^= v
# asm 1: pxor  <v=int6464#6,<f92=int6464#1
# asm 2: pxor  <v=%xmm5,<f92=%xmm0
pxor  %xmm5,%xmm0

# qhasm:  (uint32) pos91 = pos95
# asm 1: mov  <pos95=int64#13d,>pos91=int64#1d
# asm 2: mov  <pos95=%r15d,>pos91=%edi
mov  %r15d,%edi

# qhasm:  uint32323232 f30 ^= *(int128 *) (pos30 + 48 + matrix)
# asm 1: pxor 48(<pos30=int64#15,<matrix=int64#4,1),<f30=int6464#9
# asm 2: pxor 48(<pos30=%rbp,<matrix=%rcx,1),<f30=%xmm8
pxor 48(%rbp,%rcx,1),%xmm8

# qhasm:  (uint32) pos91 >>= 18
# asm 1: shr  $18,<pos91=int64#1d
# asm 2: shr  $18,<pos91=%edi
shr  $18,%edi

# qhasm:  f94 = f30
# asm 1: movdqa <f30=int6464#9,>f94=int6464#4
# asm 2: movdqa <f30=%xmm8,>f94=%xmm3
movdqa %xmm8,%xmm3

# qhasm:  uint32323232 f31 ^= *(int128 *) (pos30 + 32 + matrix)
# asm 1: pxor 32(<pos30=int64#15,<matrix=int64#4,1),<f31=int6464#8
# asm 2: pxor 32(<pos30=%rbp,<matrix=%rcx,1),<f31=%xmm7
pxor 32(%rbp,%rcx,1),%xmm7

# qhasm:  (uint32) pos91 &= mask
# asm 1: andl <mask=int64#8d,<pos91=int64#1d
# asm 2: andl <mask=%r10d,<pos91=%edi
andl %r10d,%edi

# qhasm:  f29 >>= 80
# asm 1: psrldq $10,<f29=int6464#7
# asm 2: psrldq $10,<f29=%xmm6
psrldq $10,%xmm6

# qhasm:  uint32323232 f32 ^= *(int128 *) (pos30 + 16 + matrix)
# asm 1: pxor 16(<pos30=int64#15,<matrix=int64#4,1),<f32=int6464#10
# asm 2: pxor 16(<pos30=%rbp,<matrix=%rcx,1),<f32=%xmm9
pxor 16(%rbp,%rcx,1),%xmm9

# qhasm:  f94 <<= 48
# asm 1: pslldq $6,<f94=int6464#4
# asm 2: pslldq $6,<f94=%xmm3
pslldq $6,%xmm3

# qhasm:  f92 ^= f29
# asm 1: pxor  <f29=int6464#7,<f92=int6464#1
# asm 2: pxor  <f29=%xmm6,<f92=%xmm0
pxor  %xmm6,%xmm0

# qhasm:  uint32323232 f90 ^= *(int128 *) (pos90 + 48 + matrix)
# asm 1: pxor 48(<pos90=int64#7,<matrix=int64#4,1),<f90=int6464#3
# asm 2: pxor 48(<pos90=%rax,<matrix=%rcx,1),<f90=%xmm2
pxor 48(%rax,%rcx,1),%xmm2

# qhasm:  v = f90
# asm 1: movdqa <f90=int6464#3,>v=int6464#6
# asm 2: movdqa <f90=%xmm2,>v=%xmm5
movdqa %xmm2,%xmm5

# qhasm:  f33 = *(int128 *) (pos30 + 0 + matrix)
# asm 1: movdqa 0(<pos30=int64#15,<matrix=int64#4),>f33=int6464#7
# asm 2: movdqa 0(<pos30=%rbp,<matrix=%rcx),>f33=%xmm6
movdqa 0(%rbp,%rcx),%xmm6

# qhasm:  uint6464 f90 <<= 3
# asm 1: psllq $3,<f90=int6464#3
# asm 2: psllq $3,<f90=%xmm2
psllq $3,%xmm2

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f91 ^= *(int128 *) (pos90 + 32 + matrix)
# asm 1: pxor 32(<pos90=int64#7,<matrix=int64#4,1),<f91=int6464#5
# asm 2: pxor 32(<pos90=%rax,<matrix=%rcx,1),<f91=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm:  (uint32) pos32 = pos39
# asm 1: mov  <pos39=int64#12d,>pos32=int64#10d
# asm 2: mov  <pos39=%r14d,>pos32=%r12d
mov  %r14d,%r12d

# qhasm:  f94 ^= f90
# asm 1: pxor  <f90=int6464#3,<f94=int6464#4
# asm 2: pxor  <f90=%xmm2,<f94=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  (uint32) pos32 <<= 6
# asm 1: shl  $6,<pos32=int64#10d
# asm 2: shl  $6,<pos32=%r12d
shl  $6,%r12d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#3
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm2
pshufd $0x45,%xmm5,%xmm2

# qhasm:  uint32323232 f92 ^= *(int128 *) (pos90 + 16 + matrix)
# asm 1: pxor 16(<pos90=int64#7,<matrix=int64#4,1),<f92=int6464#1
# asm 2: pxor 16(<pos90=%rax,<matrix=%rcx,1),<f92=%xmm0
pxor 16(%rax,%rcx,1),%xmm0

# qhasm:  (uint32) pos32 &= mask
# asm 1: andl <mask=int64#8d,<pos32=int64#10d
# asm 2: andl <mask=%r10d,<pos32=%r12d
andl %r10d,%r12d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f94 ^= w
# asm 1: pxor  <w=int6464#3,<f94=int6464#4
# asm 2: pxor  <w=%xmm2,<f94=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  uint32323232 f93 ^= *(int128 *) (pos90 + 0 + matrix)
# asm 1: pxor 0(<pos90=int64#7,<matrix=int64#4,1),<f93=int6464#2
# asm 2: pxor 0(<pos90=%rax,<matrix=%rcx,1),<f93=%xmm1
pxor 0(%rax,%rcx,1),%xmm1

# qhasm:  f93 ^= v
# asm 1: pxor  <v=int6464#6,<f93=int6464#2
# asm 2: pxor  <v=%xmm5,<f93=%xmm1
pxor  %xmm5,%xmm1

# qhasm:  pos92 = pos95
# asm 1: mov  <pos95=int64#13,>pos92=int64#7
# asm 2: mov  <pos95=%r15,>pos92=%rax
mov  %r15,%rax

# qhasm:  uint32323232 f31 ^= *(int128 *) (pos31 + 48 + matrix)
# asm 1: pxor 48(<pos31=int64#14,<matrix=int64#4,1),<f31=int6464#8
# asm 2: pxor 48(<pos31=%rbx,<matrix=%rcx,1),<f31=%xmm7
pxor 48(%rbx,%rcx,1),%xmm7

# qhasm:  (uint64) pos92 >>= 26
# asm 1: shr  $26,<pos92=int64#7
# asm 2: shr  $26,<pos92=%rax
shr  $26,%rax

# qhasm:  f95 = f31
# asm 1: movdqa <f31=int6464#8,>f95=int6464#3
# asm 2: movdqa <f31=%xmm7,>f95=%xmm2
movdqa %xmm7,%xmm2

# qhasm:  uint32323232 f32 ^= *(int128 *) (pos31 + 32 + matrix)
# asm 1: pxor 32(<pos31=int64#14,<matrix=int64#4,1),<f32=int6464#10
# asm 2: pxor 32(<pos31=%rbx,<matrix=%rcx,1),<f32=%xmm9
pxor 32(%rbx,%rcx,1),%xmm9

# qhasm:  (uint32) pos92 &= mask
# asm 1: andl <mask=int64#8d,<pos92=int64#7d
# asm 2: andl <mask=%r10d,<pos92=%eax
andl %r10d,%eax

# qhasm:  f30 >>= 80
# asm 1: psrldq $10,<f30=int6464#9
# asm 2: psrldq $10,<f30=%xmm8
psrldq $10,%xmm8

# qhasm:  uint32323232 f33 ^= *(int128 *) (pos31 + 16 + matrix)
# asm 1: pxor 16(<pos31=int64#14,<matrix=int64#4,1),<f33=int6464#7
# asm 2: pxor 16(<pos31=%rbx,<matrix=%rcx,1),<f33=%xmm6
pxor 16(%rbx,%rcx,1),%xmm6

# qhasm:  assign 7 to pos92

# qhasm:  f95 <<= 48
# asm 1: pslldq $6,<f95=int6464#3
# asm 2: pslldq $6,<f95=%xmm2
pslldq $6,%xmm2

# qhasm:  f93 ^= f30
# asm 1: pxor  <f30=int6464#9,<f93=int6464#2
# asm 2: pxor  <f30=%xmm8,<f93=%xmm1
pxor  %xmm8,%xmm1

# qhasm:  uint32323232 f91 ^= *(int128 *) (pos91 + 48 + matrix)
# asm 1: pxor 48(<pos91=int64#1,<matrix=int64#4,1),<f91=int6464#5
# asm 2: pxor 48(<pos91=%rdi,<matrix=%rcx,1),<f91=%xmm4
pxor 48(%rdi,%rcx,1),%xmm4

# qhasm:  v = f91
# asm 1: movdqa <f91=int6464#5,>v=int6464#6
# asm 2: movdqa <f91=%xmm4,>v=%xmm5
movdqa %xmm4,%xmm5

# qhasm:  f34 = *(int128 *) (pos31 + 0 + matrix)
# asm 1: movdqa 0(<pos31=int64#14,<matrix=int64#4),>f34=int6464#9
# asm 2: movdqa 0(<pos31=%rbx,<matrix=%rcx),>f34=%xmm8
movdqa 0(%rbx,%rcx),%xmm8

# qhasm:  uint6464 f91 <<= 3
# asm 1: psllq $3,<f91=int6464#5
# asm 2: psllq $3,<f91=%xmm4
psllq $3,%xmm4

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f92 ^= *(int128 *) (pos91 + 32 + matrix)
# asm 1: pxor 32(<pos91=int64#1,<matrix=int64#4,1),<f92=int6464#1
# asm 2: pxor 32(<pos91=%rdi,<matrix=%rcx,1),<f92=%xmm0
pxor 32(%rdi,%rcx,1),%xmm0

# qhasm:  (uint32) pos33 = pos39
# asm 1: mov  <pos39=int64#12d,>pos33=int64#11d
# asm 2: mov  <pos39=%r14d,>pos33=%r13d
mov  %r14d,%r13d

# qhasm:  f95 ^= f91
# asm 1: pxor  <f91=int6464#5,<f95=int6464#3
# asm 2: pxor  <f91=%xmm4,<f95=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  (uint32) pos33 >>= 2
# asm 1: shr  $2,<pos33=int64#11d
# asm 2: shr  $2,<pos33=%r13d
shr  $2,%r13d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#5
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm4
pshufd $0x45,%xmm5,%xmm4

# qhasm:  uint32323232 f93 ^= *(int128 *) (pos91 + 16 + matrix)
# asm 1: pxor 16(<pos91=int64#1,<matrix=int64#4,1),<f93=int6464#2
# asm 2: pxor 16(<pos91=%rdi,<matrix=%rcx,1),<f93=%xmm1
pxor 16(%rdi,%rcx,1),%xmm1

# qhasm:  (uint32) pos33 &= mask
# asm 1: andl <mask=int64#8d,<pos33=int64#11d
# asm 2: andl <mask=%r10d,<pos33=%r13d
andl %r10d,%r13d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f95 ^= w
# asm 1: pxor  <w=int6464#5,<f95=int6464#3
# asm 2: pxor  <w=%xmm4,<f95=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  uint32323232 f94 ^= *(int128 *) (pos91 + 0 + matrix)
# asm 1: pxor 0(<pos91=int64#1,<matrix=int64#4,1),<f94=int6464#4
# asm 2: pxor 0(<pos91=%rdi,<matrix=%rcx,1),<f94=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm:  f94 ^= v
# asm 1: pxor  <v=int6464#6,<f94=int6464#4
# asm 2: pxor  <v=%xmm5,<f94=%xmm3
pxor  %xmm5,%xmm3

# qhasm:  pos93 = pos95
# asm 1: mov  <pos95=int64#13,>pos93=int64#1
# asm 2: mov  <pos95=%r15,>pos93=%rdi
mov  %r15,%rdi

# qhasm:  uint32323232 f32 ^= *(int128 *) (pos32 + 48 + matrix)
# asm 1: pxor 48(<pos32=int64#10,<matrix=int64#4,1),<f32=int6464#10
# asm 2: pxor 48(<pos32=%r12,<matrix=%rcx,1),<f32=%xmm9
pxor 48(%r12,%rcx,1),%xmm9

# qhasm:  (uint64) pos93 >>= 34
# asm 1: shr  $34,<pos93=int64#1
# asm 2: shr  $34,<pos93=%rdi
shr  $34,%rdi

# qhasm:  f96 = f32
# asm 1: movdqa <f32=int6464#10,>f96=int6464#5
# asm 2: movdqa <f32=%xmm9,>f96=%xmm4
movdqa %xmm9,%xmm4

# qhasm:  uint32323232 f33 ^= *(int128 *) (pos32 + 32 + matrix)
# asm 1: pxor 32(<pos32=int64#10,<matrix=int64#4,1),<f33=int6464#7
# asm 2: pxor 32(<pos32=%r12,<matrix=%rcx,1),<f33=%xmm6
pxor 32(%r12,%rcx,1),%xmm6

# qhasm:  (uint32) pos93 &= mask
# asm 1: andl <mask=int64#8d,<pos93=int64#1d
# asm 2: andl <mask=%r10d,<pos93=%edi
andl %r10d,%edi

# qhasm:  f31 >>= 80
# asm 1: psrldq $10,<f31=int6464#8
# asm 2: psrldq $10,<f31=%xmm7
psrldq $10,%xmm7

# qhasm:  uint32323232 f34 ^= *(int128 *) (pos32 + 16 + matrix)
# asm 1: pxor 16(<pos32=int64#10,<matrix=int64#4,1),<f34=int6464#9
# asm 2: pxor 16(<pos32=%r12,<matrix=%rcx,1),<f34=%xmm8
pxor 16(%r12,%rcx,1),%xmm8

# qhasm:  assign 1 to pos93

# qhasm:  f96 <<= 48
# asm 1: pslldq $6,<f96=int6464#5
# asm 2: pslldq $6,<f96=%xmm4
pslldq $6,%xmm4

# qhasm:  f94 ^= f31
# asm 1: pxor  <f31=int6464#8,<f94=int6464#4
# asm 2: pxor  <f31=%xmm7,<f94=%xmm3
pxor  %xmm7,%xmm3

# qhasm:  uint32323232 f92 ^= *(int128 *) (pos92 + 48 + matrix)
# asm 1: pxor 48(<pos92=int64#7,<matrix=int64#4,1),<f92=int6464#1
# asm 2: pxor 48(<pos92=%rax,<matrix=%rcx,1),<f92=%xmm0
pxor 48(%rax,%rcx,1),%xmm0

# qhasm:  v = f92
# asm 1: movdqa <f92=int6464#1,>v=int6464#6
# asm 2: movdqa <f92=%xmm0,>v=%xmm5
movdqa %xmm0,%xmm5

# qhasm:  f35 = *(int128 *) (pos32 + 0 + matrix)
# asm 1: movdqa 0(<pos32=int64#10,<matrix=int64#4),>f35=int6464#8
# asm 2: movdqa 0(<pos32=%r12,<matrix=%rcx),>f35=%xmm7
movdqa 0(%r12,%rcx),%xmm7

# qhasm:  uint6464 f92 <<= 3
# asm 1: psllq $3,<f92=int6464#1
# asm 2: psllq $3,<f92=%xmm0
psllq $3,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f93 ^= *(int128 *) (pos92 + 32 + matrix)
# asm 1: pxor 32(<pos92=int64#7,<matrix=int64#4,1),<f93=int6464#2
# asm 2: pxor 32(<pos92=%rax,<matrix=%rcx,1),<f93=%xmm1
pxor 32(%rax,%rcx,1),%xmm1

# qhasm:  (uint32) pos34 = pos39
# asm 1: mov  <pos39=int64#12d,>pos34=int64#10d
# asm 2: mov  <pos39=%r14d,>pos34=%r12d
mov  %r14d,%r12d

# qhasm:  f96 ^= f92
# asm 1: pxor  <f92=int6464#1,<f96=int6464#5
# asm 2: pxor  <f92=%xmm0,<f96=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  (uint32) pos34 >>= 10
# asm 1: shr  $10,<pos34=int64#10d
# asm 2: shr  $10,<pos34=%r12d
shr  $10,%r12d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#1
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm0
pshufd $0x45,%xmm5,%xmm0

# qhasm:  uint32323232 f94 ^= *(int128 *) (pos92 + 16 + matrix)
# asm 1: pxor 16(<pos92=int64#7,<matrix=int64#4,1),<f94=int6464#4
# asm 2: pxor 16(<pos92=%rax,<matrix=%rcx,1),<f94=%xmm3
pxor 16(%rax,%rcx,1),%xmm3

# qhasm:  (uint32) pos34 &= mask
# asm 1: andl <mask=int64#8d,<pos34=int64#10d
# asm 2: andl <mask=%r10d,<pos34=%r12d
andl %r10d,%r12d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f96 ^= w
# asm 1: pxor  <w=int6464#1,<f96=int6464#5
# asm 2: pxor  <w=%xmm0,<f96=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  uint32323232 f95 ^= *(int128 *) (pos92 + 0 + matrix)
# asm 1: pxor 0(<pos92=int64#7,<matrix=int64#4,1),<f95=int6464#3
# asm 2: pxor 0(<pos92=%rax,<matrix=%rcx,1),<f95=%xmm2
pxor 0(%rax,%rcx,1),%xmm2

# qhasm:  f95 ^= v
# asm 1: pxor  <v=int6464#6,<f95=int6464#3
# asm 2: pxor  <v=%xmm5,<f95=%xmm2
pxor  %xmm5,%xmm2

# qhasm:  pos103 = *(int64 *) (bp + 32)
# asm 1: movq   32(<bp=int64#2),>pos103=int64#14
# asm 2: movq   32(<bp=%rsi),>pos103=%rbx
movq   32(%rsi),%rbx

# qhasm:  pos94 = pos95
# asm 1: mov  <pos95=int64#13,>pos94=int64#15
# asm 2: mov  <pos95=%r15,>pos94=%rbp
mov  %r15,%rbp

# qhasm:  uint32323232 f33 ^= *(int128 *) (pos33 + 48 + matrix)
# asm 1: pxor 48(<pos33=int64#11,<matrix=int64#4,1),<f33=int6464#7
# asm 2: pxor 48(<pos33=%r13,<matrix=%rcx,1),<f33=%xmm6
pxor 48(%r13,%rcx,1),%xmm6

# qhasm:  (uint64) pos94 >>= 42
# asm 1: shr  $42,<pos94=int64#15
# asm 2: shr  $42,<pos94=%rbp
shr  $42,%rbp

# qhasm:  f97 = f33
# asm 1: movdqa <f33=int6464#7,>f97=int6464#1
# asm 2: movdqa <f33=%xmm6,>f97=%xmm0
movdqa %xmm6,%xmm0

# qhasm:  uint32323232 f34 ^= *(int128 *) (pos33 + 32 + matrix)
# asm 1: pxor 32(<pos33=int64#11,<matrix=int64#4,1),<f34=int6464#9
# asm 2: pxor 32(<pos33=%r13,<matrix=%rcx,1),<f34=%xmm8
pxor 32(%r13,%rcx,1),%xmm8

# qhasm:  (uint32) pos94 &= mask
# asm 1: andl <mask=int64#8d,<pos94=int64#15d
# asm 2: andl <mask=%r10d,<pos94=%ebp
andl %r10d,%ebp

# qhasm:  f32 >>= 80
# asm 1: psrldq $10,<f32=int6464#10
# asm 2: psrldq $10,<f32=%xmm9
psrldq $10,%xmm9

# qhasm:  uint32323232 f35 ^= *(int128 *) (pos33 + 16 + matrix)
# asm 1: pxor 16(<pos33=int64#11,<matrix=int64#4,1),<f35=int6464#8
# asm 2: pxor 16(<pos33=%r13,<matrix=%rcx,1),<f35=%xmm7
pxor 16(%r13,%rcx,1),%xmm7

# qhasm:  assign 15 to pos94

# qhasm:  f97 <<= 48
# asm 1: pslldq $6,<f97=int6464#1
# asm 2: pslldq $6,<f97=%xmm0
pslldq $6,%xmm0

# qhasm:  f95 ^= f32
# asm 1: pxor  <f32=int6464#10,<f95=int6464#3
# asm 2: pxor  <f32=%xmm9,<f95=%xmm2
pxor  %xmm9,%xmm2

# qhasm:  uint32323232 f93 ^= *(int128 *) (pos93 + 48 + matrix)
# asm 1: pxor 48(<pos93=int64#1,<matrix=int64#4,1),<f93=int6464#2
# asm 2: pxor 48(<pos93=%rdi,<matrix=%rcx,1),<f93=%xmm1
pxor 48(%rdi,%rcx,1),%xmm1

# qhasm:  v = f93
# asm 1: movdqa <f93=int6464#2,>v=int6464#6
# asm 2: movdqa <f93=%xmm1,>v=%xmm5
movdqa %xmm1,%xmm5

# qhasm:  f36 = *(int128 *) (pos33 + 0 + matrix)
# asm 1: movdqa 0(<pos33=int64#11,<matrix=int64#4),>f36=int6464#10
# asm 2: movdqa 0(<pos33=%r13,<matrix=%rcx),>f36=%xmm9
movdqa 0(%r13,%rcx),%xmm9

# qhasm:  uint6464 f93 <<= 3
# asm 1: psllq $3,<f93=int6464#2
# asm 2: psllq $3,<f93=%xmm1
psllq $3,%xmm1

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f94 ^= *(int128 *) (pos93 + 32 + matrix)
# asm 1: pxor 32(<pos93=int64#1,<matrix=int64#4,1),<f94=int6464#4
# asm 2: pxor 32(<pos93=%rdi,<matrix=%rcx,1),<f94=%xmm3
pxor 32(%rdi,%rcx,1),%xmm3

# qhasm:  (uint32) pos35 = pos39
# asm 1: mov  <pos39=int64#12d,>pos35=int64#11d
# asm 2: mov  <pos39=%r14d,>pos35=%r13d
mov  %r14d,%r13d

# qhasm:  f97 ^= f93
# asm 1: pxor  <f93=int6464#2,<f97=int6464#1
# asm 2: pxor  <f93=%xmm1,<f97=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  (uint32) pos35 >>= 18
# asm 1: shr  $18,<pos35=int64#11d
# asm 2: shr  $18,<pos35=%r13d
shr  $18,%r13d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#2
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm1
pshufd $0x45,%xmm5,%xmm1

# qhasm:  uint32323232 f95 ^= *(int128 *) (pos93 + 16 + matrix)
# asm 1: pxor 16(<pos93=int64#1,<matrix=int64#4,1),<f95=int6464#3
# asm 2: pxor 16(<pos93=%rdi,<matrix=%rcx,1),<f95=%xmm2
pxor 16(%rdi,%rcx,1),%xmm2

# qhasm:  (uint32) pos35 &= mask
# asm 1: andl <mask=int64#8d,<pos35=int64#11d
# asm 2: andl <mask=%r10d,<pos35=%r13d
andl %r10d,%r13d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f97 ^= w
# asm 1: pxor  <w=int6464#2,<f97=int6464#1
# asm 2: pxor  <w=%xmm1,<f97=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  uint32323232 f96 ^= *(int128 *) (pos93 + 0 + matrix)
# asm 1: pxor 0(<pos93=int64#1,<matrix=int64#4,1),<f96=int6464#5
# asm 2: pxor 0(<pos93=%rdi,<matrix=%rcx,1),<f96=%xmm4
pxor 0(%rdi,%rcx,1),%xmm4

# qhasm:  f96 ^= v
# asm 1: pxor  <v=int6464#6,<f96=int6464#5
# asm 2: pxor  <v=%xmm5,<f96=%xmm4
pxor  %xmm5,%xmm4

# qhasm:  uint32323232 f34 ^= *(int128 *) (pos34 + 48 + matrix)
# asm 1: pxor 48(<pos34=int64#10,<matrix=int64#4,1),<f34=int6464#9
# asm 2: pxor 48(<pos34=%r12,<matrix=%rcx,1),<f34=%xmm8
pxor 48(%r12,%rcx,1),%xmm8

# qhasm:  (uint64) pos95 >>= 50
# asm 1: shr  $50,<pos95=int64#13
# asm 2: shr  $50,<pos95=%r15
shr  $50,%r15

# qhasm:  f98 = f34
# asm 1: movdqa <f34=int6464#9,>f98=int6464#2
# asm 2: movdqa <f34=%xmm8,>f98=%xmm1
movdqa %xmm8,%xmm1

# qhasm:  uint32323232 f35 ^= *(int128 *) (pos34 + 32 + matrix)
# asm 1: pxor 32(<pos34=int64#10,<matrix=int64#4,1),<f35=int6464#8
# asm 2: pxor 32(<pos34=%r12,<matrix=%rcx,1),<f35=%xmm7
pxor 32(%r12,%rcx,1),%xmm7

# qhasm:  (uint32) pos95 &= mask
# asm 1: andl <mask=int64#8d,<pos95=int64#13d
# asm 2: andl <mask=%r10d,<pos95=%r15d
andl %r10d,%r15d

# qhasm:  f33 >>= 80
# asm 1: psrldq $10,<f33=int6464#7
# asm 2: psrldq $10,<f33=%xmm6
psrldq $10,%xmm6

# qhasm:  uint32323232 f36 ^= *(int128 *) (pos34 + 16 + matrix)
# asm 1: pxor 16(<pos34=int64#10,<matrix=int64#4,1),<f36=int6464#10
# asm 2: pxor 16(<pos34=%r12,<matrix=%rcx,1),<f36=%xmm9
pxor 16(%r12,%rcx,1),%xmm9

# qhasm:  assign 14 to pos95

# qhasm:  f98 <<= 48
# asm 1: pslldq $6,<f98=int6464#2
# asm 2: pslldq $6,<f98=%xmm1
pslldq $6,%xmm1

# qhasm:  f96 ^= f33
# asm 1: pxor  <f33=int6464#7,<f96=int6464#5
# asm 2: pxor  <f33=%xmm6,<f96=%xmm4
pxor  %xmm6,%xmm4

# qhasm:  uint32323232 f94 ^= *(int128 *) (pos94 + 48 + matrix)
# asm 1: pxor 48(<pos94=int64#15,<matrix=int64#4,1),<f94=int6464#4
# asm 2: pxor 48(<pos94=%rbp,<matrix=%rcx,1),<f94=%xmm3
pxor 48(%rbp,%rcx,1),%xmm3

# qhasm:  v = f94
# asm 1: movdqa <f94=int6464#4,>v=int6464#6
# asm 2: movdqa <f94=%xmm3,>v=%xmm5
movdqa %xmm3,%xmm5

# qhasm:  f37 = *(int128 *) (pos34 + 0 + matrix)
# asm 1: movdqa 0(<pos34=int64#10,<matrix=int64#4),>f37=int6464#7
# asm 2: movdqa 0(<pos34=%r12,<matrix=%rcx),>f37=%xmm6
movdqa 0(%r12,%rcx),%xmm6

# qhasm:  uint6464 f94 <<= 3
# asm 1: psllq $3,<f94=int6464#4
# asm 2: psllq $3,<f94=%xmm3
psllq $3,%xmm3

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos36 = pos39
# asm 1: mov  <pos39=int64#12,>pos36=int64#7
# asm 2: mov  <pos39=%r14,>pos36=%rax
mov  %r14,%rax

# qhasm:  uint32323232 f95 ^= *(int128 *) (pos94 + 32 + matrix)
# asm 1: pxor 32(<pos94=int64#15,<matrix=int64#4,1),<f95=int6464#3
# asm 2: pxor 32(<pos94=%rbp,<matrix=%rcx,1),<f95=%xmm2
pxor 32(%rbp,%rcx,1),%xmm2

# qhasm:  f98 ^= f94
# asm 1: pxor  <f94=int6464#4,<f98=int6464#2
# asm 2: pxor  <f94=%xmm3,<f98=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  (uint64) pos36 >>= 26
# asm 1: shr  $26,<pos36=int64#7
# asm 2: shr  $26,<pos36=%rax
shr  $26,%rax

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#4
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm3
pshufd $0x45,%xmm5,%xmm3

# qhasm:  uint32323232 f96 ^= *(int128 *) (pos94 + 16 + matrix)
# asm 1: pxor 16(<pos94=int64#15,<matrix=int64#4,1),<f96=int6464#5
# asm 2: pxor 16(<pos94=%rbp,<matrix=%rcx,1),<f96=%xmm4
pxor 16(%rbp,%rcx,1),%xmm4

# qhasm:  (uint32) pos36 &= mask
# asm 1: andl <mask=int64#8d,<pos36=int64#7d
# asm 2: andl <mask=%r10d,<pos36=%eax
andl %r10d,%eax

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 7 to pos36

# qhasm:  f98 ^= w
# asm 1: pxor  <w=int6464#4,<f98=int6464#2
# asm 2: pxor  <w=%xmm3,<f98=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  uint32323232 f97 ^= *(int128 *) (pos94 + 0 + matrix)
# asm 1: pxor 0(<pos94=int64#15,<matrix=int64#4,1),<f97=int6464#1
# asm 2: pxor 0(<pos94=%rbp,<matrix=%rcx,1),<f97=%xmm0
pxor 0(%rbp,%rcx,1),%xmm0

# qhasm:  f97 ^= v
# asm 1: pxor  <v=int6464#6,<f97=int6464#1
# asm 2: pxor  <v=%xmm5,<f97=%xmm0
pxor  %xmm5,%xmm0

# qhasm:  (uint32) pos96 = pos103
# asm 1: mov  <pos103=int64#14d,>pos96=int64#10d
# asm 2: mov  <pos103=%ebx,>pos96=%r12d
mov  %ebx,%r12d

# qhasm:  uint32323232 f35 ^= *(int128 *) (pos35 + 48 + matrix)
# asm 1: pxor 48(<pos35=int64#11,<matrix=int64#4,1),<f35=int6464#8
# asm 2: pxor 48(<pos35=%r13,<matrix=%rcx,1),<f35=%xmm7
pxor 48(%r13,%rcx,1),%xmm7

# qhasm:  (uint32) pos96 <<= 6
# asm 1: shl  $6,<pos96=int64#10d
# asm 2: shl  $6,<pos96=%r12d
shl  $6,%r12d

# qhasm:  f99 = f35
# asm 1: movdqa <f35=int6464#8,>f99=int6464#4
# asm 2: movdqa <f35=%xmm7,>f99=%xmm3
movdqa %xmm7,%xmm3

# qhasm:  uint32323232 f36 ^= *(int128 *) (pos35 + 32 + matrix)
# asm 1: pxor 32(<pos35=int64#11,<matrix=int64#4,1),<f36=int6464#10
# asm 2: pxor 32(<pos35=%r13,<matrix=%rcx,1),<f36=%xmm9
pxor 32(%r13,%rcx,1),%xmm9

# qhasm:  (uint32) pos96 &= mask
# asm 1: andl <mask=int64#8d,<pos96=int64#10d
# asm 2: andl <mask=%r10d,<pos96=%r12d
andl %r10d,%r12d

# qhasm:  f34 >>= 80
# asm 1: psrldq $10,<f34=int6464#9
# asm 2: psrldq $10,<f34=%xmm8
psrldq $10,%xmm8

# qhasm:  uint32323232 f37 ^= *(int128 *) (pos35 + 16 + matrix)
# asm 1: pxor 16(<pos35=int64#11,<matrix=int64#4,1),<f37=int6464#7
# asm 2: pxor 16(<pos35=%r13,<matrix=%rcx,1),<f37=%xmm6
pxor 16(%r13,%rcx,1),%xmm6

# qhasm:  f99 <<= 48
# asm 1: pslldq $6,<f99=int6464#4
# asm 2: pslldq $6,<f99=%xmm3
pslldq $6,%xmm3

# qhasm:  f97 ^= f34
# asm 1: pxor  <f34=int6464#9,<f97=int6464#1
# asm 2: pxor  <f34=%xmm8,<f97=%xmm0
pxor  %xmm8,%xmm0

# qhasm:  uint32323232 f95 ^= *(int128 *) (pos95 + 48 + matrix)
# asm 1: pxor 48(<pos95=int64#13,<matrix=int64#4,1),<f95=int6464#3
# asm 2: pxor 48(<pos95=%r15,<matrix=%rcx,1),<f95=%xmm2
pxor 48(%r15,%rcx,1),%xmm2

# qhasm:  v = f95
# asm 1: movdqa <f95=int6464#3,>v=int6464#6
# asm 2: movdqa <f95=%xmm2,>v=%xmm5
movdqa %xmm2,%xmm5

# qhasm:  f38 = *(int128 *) (pos35 + 0 + matrix)
# asm 1: movdqa 0(<pos35=int64#11,<matrix=int64#4),>f38=int6464#9
# asm 2: movdqa 0(<pos35=%r13,<matrix=%rcx),>f38=%xmm8
movdqa 0(%r13,%rcx),%xmm8

# qhasm:  uint6464 f95 <<= 3
# asm 1: psllq $3,<f95=int6464#3
# asm 2: psllq $3,<f95=%xmm2
psllq $3,%xmm2

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos37 = pos39
# asm 1: mov  <pos39=int64#12,>pos37=int64#1
# asm 2: mov  <pos39=%r14,>pos37=%rdi
mov  %r14,%rdi

# qhasm:  uint32323232 f96 ^= *(int128 *) (pos95 + 32 + matrix)
# asm 1: pxor 32(<pos95=int64#13,<matrix=int64#4,1),<f96=int6464#5
# asm 2: pxor 32(<pos95=%r15,<matrix=%rcx,1),<f96=%xmm4
pxor 32(%r15,%rcx,1),%xmm4

# qhasm:  f99 ^= f95
# asm 1: pxor  <f95=int6464#3,<f99=int6464#4
# asm 2: pxor  <f95=%xmm2,<f99=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  (uint64) pos37 >>= 34
# asm 1: shr  $34,<pos37=int64#1
# asm 2: shr  $34,<pos37=%rdi
shr  $34,%rdi

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#3
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm2
pshufd $0x45,%xmm5,%xmm2

# qhasm:  uint32323232 f97 ^= *(int128 *) (pos95 + 16 + matrix)
# asm 1: pxor 16(<pos95=int64#13,<matrix=int64#4,1),<f97=int6464#1
# asm 2: pxor 16(<pos95=%r15,<matrix=%rcx,1),<f97=%xmm0
pxor 16(%r15,%rcx,1),%xmm0

# qhasm:  (uint32) pos37 &= mask
# asm 1: andl <mask=int64#8d,<pos37=int64#1d
# asm 2: andl <mask=%r10d,<pos37=%edi
andl %r10d,%edi

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 1 to pos37

# qhasm:  f99 ^= w
# asm 1: pxor  <w=int6464#3,<f99=int6464#4
# asm 2: pxor  <w=%xmm2,<f99=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  uint32323232 f98 ^= *(int128 *) (pos95 + 0 + matrix)
# asm 1: pxor 0(<pos95=int64#13,<matrix=int64#4,1),<f98=int6464#2
# asm 2: pxor 0(<pos95=%r15,<matrix=%rcx,1),<f98=%xmm1
pxor 0(%r15,%rcx,1),%xmm1

# qhasm:  f98 ^= v
# asm 1: pxor  <v=int6464#6,<f98=int6464#2
# asm 2: pxor  <v=%xmm5,<f98=%xmm1
pxor  %xmm5,%xmm1

# qhasm:  (uint32) pos97 = pos103
# asm 1: mov  <pos103=int64#14d,>pos97=int64#11d
# asm 2: mov  <pos103=%ebx,>pos97=%r13d
mov  %ebx,%r13d

# qhasm:  uint32323232 f36 ^= *(int128 *) (pos36 + 48 + matrix)
# asm 1: pxor 48(<pos36=int64#7,<matrix=int64#4,1),<f36=int6464#10
# asm 2: pxor 48(<pos36=%rax,<matrix=%rcx,1),<f36=%xmm9
pxor 48(%rax,%rcx,1),%xmm9

# qhasm:  (uint32) pos97 >>= 2
# asm 1: shr  $2,<pos97=int64#11d
# asm 2: shr  $2,<pos97=%r13d
shr  $2,%r13d

# qhasm:  f100 = f36
# asm 1: movdqa <f36=int6464#10,>f100=int6464#3
# asm 2: movdqa <f36=%xmm9,>f100=%xmm2
movdqa %xmm9,%xmm2

# qhasm:  uint32323232 f37 ^= *(int128 *) (pos36 + 32 + matrix)
# asm 1: pxor 32(<pos36=int64#7,<matrix=int64#4,1),<f37=int6464#7
# asm 2: pxor 32(<pos36=%rax,<matrix=%rcx,1),<f37=%xmm6
pxor 32(%rax,%rcx,1),%xmm6

# qhasm:  (uint32) pos97 &= mask
# asm 1: andl <mask=int64#8d,<pos97=int64#11d
# asm 2: andl <mask=%r10d,<pos97=%r13d
andl %r10d,%r13d

# qhasm:  f35 >>= 80
# asm 1: psrldq $10,<f35=int6464#8
# asm 2: psrldq $10,<f35=%xmm7
psrldq $10,%xmm7

# qhasm:  uint32323232 f38 ^= *(int128 *) (pos36 + 16 + matrix)
# asm 1: pxor 16(<pos36=int64#7,<matrix=int64#4,1),<f38=int6464#9
# asm 2: pxor 16(<pos36=%rax,<matrix=%rcx,1),<f38=%xmm8
pxor 16(%rax,%rcx,1),%xmm8

# qhasm:  f100 <<= 48
# asm 1: pslldq $6,<f100=int6464#3
# asm 2: pslldq $6,<f100=%xmm2
pslldq $6,%xmm2

# qhasm:  f98 ^= f35
# asm 1: pxor  <f35=int6464#8,<f98=int6464#2
# asm 2: pxor  <f35=%xmm7,<f98=%xmm1
pxor  %xmm7,%xmm1

# qhasm:  uint32323232 f96 ^= *(int128 *) (pos96 + 48 + matrix)
# asm 1: pxor 48(<pos96=int64#10,<matrix=int64#4,1),<f96=int6464#5
# asm 2: pxor 48(<pos96=%r12,<matrix=%rcx,1),<f96=%xmm4
pxor 48(%r12,%rcx,1),%xmm4

# qhasm:  pos47 = ((uint64 *)&state2)[1]
# asm 1: movq 8+<state2=stack128#3,>pos47=int64#13
# asm 2: movq 8+<state2=32(%rsp),>pos47=%r15
movq 8+32(%rsp),%r15

# qhasm:  v = f96
# asm 1: movdqa <f96=int6464#5,>v=int6464#6
# asm 2: movdqa <f96=%xmm4,>v=%xmm5
movdqa %xmm4,%xmm5

# qhasm:  f39 = *(int128 *) (pos36 + 0 + matrix)
# asm 1: movdqa 0(<pos36=int64#7,<matrix=int64#4),>f39=int6464#8
# asm 2: movdqa 0(<pos36=%rax,<matrix=%rcx),>f39=%xmm7
movdqa 0(%rax,%rcx),%xmm7

# qhasm:  uint6464 f96 <<= 3
# asm 1: psllq $3,<f96=int6464#5
# asm 2: psllq $3,<f96=%xmm4
psllq $3,%xmm4

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos38 = pos39
# asm 1: mov  <pos39=int64#12,>pos38=int64#15
# asm 2: mov  <pos39=%r14,>pos38=%rbp
mov  %r14,%rbp

# qhasm:  uint32323232 f97 ^= *(int128 *) (pos96 + 32 + matrix)
# asm 1: pxor 32(<pos96=int64#10,<matrix=int64#4,1),<f97=int6464#1
# asm 2: pxor 32(<pos96=%r12,<matrix=%rcx,1),<f97=%xmm0
pxor 32(%r12,%rcx,1),%xmm0

# qhasm:  f100 ^= f96
# asm 1: pxor  <f96=int6464#5,<f100=int6464#3
# asm 2: pxor  <f96=%xmm4,<f100=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  (uint64) pos38 >>= 42
# asm 1: shr  $42,<pos38=int64#15
# asm 2: shr  $42,<pos38=%rbp
shr  $42,%rbp

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#5
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm4
pshufd $0x45,%xmm5,%xmm4

# qhasm:  uint32323232 f98 ^= *(int128 *) (pos96 + 16 + matrix)
# asm 1: pxor 16(<pos96=int64#10,<matrix=int64#4,1),<f98=int6464#2
# asm 2: pxor 16(<pos96=%r12,<matrix=%rcx,1),<f98=%xmm1
pxor 16(%r12,%rcx,1),%xmm1

# qhasm:  (uint32) pos38 &= mask
# asm 1: andl <mask=int64#8d,<pos38=int64#15d
# asm 2: andl <mask=%r10d,<pos38=%ebp
andl %r10d,%ebp

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 15 to pos38

# qhasm:  f100 ^= w
# asm 1: pxor  <w=int6464#5,<f100=int6464#3
# asm 2: pxor  <w=%xmm4,<f100=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  uint32323232 f99 ^= *(int128 *) (pos96 + 0 + matrix)
# asm 1: pxor 0(<pos96=int64#10,<matrix=int64#4,1),<f99=int6464#4
# asm 2: pxor 0(<pos96=%r12,<matrix=%rcx,1),<f99=%xmm3
pxor 0(%r12,%rcx,1),%xmm3

# qhasm:  f99 ^= v
# asm 1: pxor  <v=int6464#6,<f99=int6464#4
# asm 2: pxor  <v=%xmm5,<f99=%xmm3
pxor  %xmm5,%xmm3

# qhasm:  (uint32) pos98 = pos103
# asm 1: mov  <pos103=int64#14d,>pos98=int64#7d
# asm 2: mov  <pos103=%ebx,>pos98=%eax
mov  %ebx,%eax

# qhasm:  uint32323232 f37 ^= *(int128 *) (pos37 + 48 + matrix)
# asm 1: pxor 48(<pos37=int64#1,<matrix=int64#4,1),<f37=int6464#7
# asm 2: pxor 48(<pos37=%rdi,<matrix=%rcx,1),<f37=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm:  (uint32) pos98 >>= 10
# asm 1: shr  $10,<pos98=int64#7d
# asm 2: shr  $10,<pos98=%eax
shr  $10,%eax

# qhasm:  f101 = f37
# asm 1: movdqa <f37=int6464#7,>f101=int6464#5
# asm 2: movdqa <f37=%xmm6,>f101=%xmm4
movdqa %xmm6,%xmm4

# qhasm:  uint32323232 f38 ^= *(int128 *) (pos37 + 32 + matrix)
# asm 1: pxor 32(<pos37=int64#1,<matrix=int64#4,1),<f38=int6464#9
# asm 2: pxor 32(<pos37=%rdi,<matrix=%rcx,1),<f38=%xmm8
pxor 32(%rdi,%rcx,1),%xmm8

# qhasm:  (uint32) pos98 &= mask
# asm 1: andl <mask=int64#8d,<pos98=int64#7d
# asm 2: andl <mask=%r10d,<pos98=%eax
andl %r10d,%eax

# qhasm:  f36 >>= 80
# asm 1: psrldq $10,<f36=int6464#10
# asm 2: psrldq $10,<f36=%xmm9
psrldq $10,%xmm9

# qhasm:  uint32323232 f39 ^= *(int128 *) (pos37 + 16 + matrix)
# asm 1: pxor 16(<pos37=int64#1,<matrix=int64#4,1),<f39=int6464#8
# asm 2: pxor 16(<pos37=%rdi,<matrix=%rcx,1),<f39=%xmm7
pxor 16(%rdi,%rcx,1),%xmm7

# qhasm:  f101 <<= 48
# asm 1: pslldq $6,<f101=int6464#5
# asm 2: pslldq $6,<f101=%xmm4
pslldq $6,%xmm4

# qhasm:  f99 ^= f36
# asm 1: pxor  <f36=int6464#10,<f99=int6464#4
# asm 2: pxor  <f36=%xmm9,<f99=%xmm3
pxor  %xmm9,%xmm3

# qhasm:  uint32323232 f97 ^= *(int128 *) (pos97 + 48 + matrix)
# asm 1: pxor 48(<pos97=int64#11,<matrix=int64#4,1),<f97=int6464#1
# asm 2: pxor 48(<pos97=%r13,<matrix=%rcx,1),<f97=%xmm0
pxor 48(%r13,%rcx,1),%xmm0

# qhasm:  v = f97
# asm 1: movdqa <f97=int6464#1,>v=int6464#6
# asm 2: movdqa <f97=%xmm0,>v=%xmm5
movdqa %xmm0,%xmm5

# qhasm:  f40 = *(int128 *) (pos37 + 0 + matrix)
# asm 1: movdqa 0(<pos37=int64#1,<matrix=int64#4),>f40=int6464#10
# asm 2: movdqa 0(<pos37=%rdi,<matrix=%rcx),>f40=%xmm9
movdqa 0(%rdi,%rcx),%xmm9

# qhasm:  uint6464 f97 <<= 3
# asm 1: psllq $3,<f97=int6464#1
# asm 2: psllq $3,<f97=%xmm0
psllq $3,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f98 ^= *(int128 *) (pos97 + 32 + matrix)
# asm 1: pxor 32(<pos97=int64#11,<matrix=int64#4,1),<f98=int6464#2
# asm 2: pxor 32(<pos97=%r13,<matrix=%rcx,1),<f98=%xmm1
pxor 32(%r13,%rcx,1),%xmm1

# qhasm:  f101 ^= f97
# asm 1: pxor  <f97=int6464#1,<f101=int6464#5
# asm 2: pxor  <f97=%xmm0,<f101=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  (uint64) pos39 >>= 50
# asm 1: shr  $50,<pos39=int64#12
# asm 2: shr  $50,<pos39=%r14
shr  $50,%r14

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#1
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm0
pshufd $0x45,%xmm5,%xmm0

# qhasm:  uint32323232 f99 ^= *(int128 *) (pos97 + 16 + matrix)
# asm 1: pxor 16(<pos97=int64#11,<matrix=int64#4,1),<f99=int6464#4
# asm 2: pxor 16(<pos97=%r13,<matrix=%rcx,1),<f99=%xmm3
pxor 16(%r13,%rcx,1),%xmm3

# qhasm:  (uint32) pos39 &= mask
# asm 1: andl <mask=int64#8d,<pos39=int64#12d
# asm 2: andl <mask=%r10d,<pos39=%r14d
andl %r10d,%r14d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 14 to pos39

# qhasm:  f101 ^= w
# asm 1: pxor  <w=int6464#1,<f101=int6464#5
# asm 2: pxor  <w=%xmm0,<f101=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  uint32323232 f100 ^= *(int128 *) (pos97 + 0 + matrix)
# asm 1: pxor 0(<pos97=int64#11,<matrix=int64#4,1),<f100=int6464#3
# asm 2: pxor 0(<pos97=%r13,<matrix=%rcx,1),<f100=%xmm2
pxor 0(%r13,%rcx,1),%xmm2

# qhasm:  f100 ^= v
# asm 1: pxor  <v=int6464#6,<f100=int6464#3
# asm 2: pxor  <v=%xmm5,<f100=%xmm2
pxor  %xmm5,%xmm2

# qhasm:  (uint32) pos99 = pos103
# asm 1: mov  <pos103=int64#14d,>pos99=int64#1d
# asm 2: mov  <pos103=%ebx,>pos99=%edi
mov  %ebx,%edi

# qhasm:  uint32323232 f38 ^= *(int128 *) (pos38 + 48 + matrix)
# asm 1: pxor 48(<pos38=int64#15,<matrix=int64#4,1),<f38=int6464#9
# asm 2: pxor 48(<pos38=%rbp,<matrix=%rcx,1),<f38=%xmm8
pxor 48(%rbp,%rcx,1),%xmm8

# qhasm:  (uint32) pos99 >>= 18
# asm 1: shr  $18,<pos99=int64#1d
# asm 2: shr  $18,<pos99=%edi
shr  $18,%edi

# qhasm:  f102 = f38
# asm 1: movdqa <f38=int6464#9,>f102=int6464#1
# asm 2: movdqa <f38=%xmm8,>f102=%xmm0
movdqa %xmm8,%xmm0

# qhasm:  uint32323232 f39 ^= *(int128 *) (pos38 + 32 + matrix)
# asm 1: pxor 32(<pos38=int64#15,<matrix=int64#4,1),<f39=int6464#8
# asm 2: pxor 32(<pos38=%rbp,<matrix=%rcx,1),<f39=%xmm7
pxor 32(%rbp,%rcx,1),%xmm7

# qhasm:  (uint32) pos99 &= mask
# asm 1: andl <mask=int64#8d,<pos99=int64#1d
# asm 2: andl <mask=%r10d,<pos99=%edi
andl %r10d,%edi

# qhasm:  f37 >>= 80
# asm 1: psrldq $10,<f37=int6464#7
# asm 2: psrldq $10,<f37=%xmm6
psrldq $10,%xmm6

# qhasm:  uint32323232 f40 ^= *(int128 *) (pos38 + 16 + matrix)
# asm 1: pxor 16(<pos38=int64#15,<matrix=int64#4,1),<f40=int6464#10
# asm 2: pxor 16(<pos38=%rbp,<matrix=%rcx,1),<f40=%xmm9
pxor 16(%rbp,%rcx,1),%xmm9

# qhasm:  f102 <<= 48
# asm 1: pslldq $6,<f102=int6464#1
# asm 2: pslldq $6,<f102=%xmm0
pslldq $6,%xmm0

# qhasm:  f100 ^= f37
# asm 1: pxor  <f37=int6464#7,<f100=int6464#3
# asm 2: pxor  <f37=%xmm6,<f100=%xmm2
pxor  %xmm6,%xmm2

# qhasm:  uint32323232 f98 ^= *(int128 *) (pos98 + 48 + matrix)
# asm 1: pxor 48(<pos98=int64#7,<matrix=int64#4,1),<f98=int6464#2
# asm 2: pxor 48(<pos98=%rax,<matrix=%rcx,1),<f98=%xmm1
pxor 48(%rax,%rcx,1),%xmm1

# qhasm:  v = f98
# asm 1: movdqa <f98=int6464#2,>v=int6464#6
# asm 2: movdqa <f98=%xmm1,>v=%xmm5
movdqa %xmm1,%xmm5

# qhasm:  f41 = *(int128 *) (pos38 + 0 + matrix)
# asm 1: movdqa 0(<pos38=int64#15,<matrix=int64#4),>f41=int6464#7
# asm 2: movdqa 0(<pos38=%rbp,<matrix=%rcx),>f41=%xmm6
movdqa 0(%rbp,%rcx),%xmm6

# qhasm:  uint6464 f98 <<= 3
# asm 1: psllq $3,<f98=int6464#2
# asm 2: psllq $3,<f98=%xmm1
psllq $3,%xmm1

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f99 ^= *(int128 *) (pos98 + 32 + matrix)
# asm 1: pxor 32(<pos98=int64#7,<matrix=int64#4,1),<f99=int6464#4
# asm 2: pxor 32(<pos98=%rax,<matrix=%rcx,1),<f99=%xmm3
pxor 32(%rax,%rcx,1),%xmm3

# qhasm:  (uint32) pos40 = pos47
# asm 1: mov  <pos47=int64#13d,>pos40=int64#10d
# asm 2: mov  <pos47=%r15d,>pos40=%r12d
mov  %r15d,%r12d

# qhasm:  f102 ^= f98
# asm 1: pxor  <f98=int6464#2,<f102=int6464#1
# asm 2: pxor  <f98=%xmm1,<f102=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  (uint32) pos40 <<= 6
# asm 1: shl  $6,<pos40=int64#10d
# asm 2: shl  $6,<pos40=%r12d
shl  $6,%r12d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#2
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm1
pshufd $0x45,%xmm5,%xmm1

# qhasm:  uint32323232 f100 ^= *(int128 *) (pos98 + 16 + matrix)
# asm 1: pxor 16(<pos98=int64#7,<matrix=int64#4,1),<f100=int6464#3
# asm 2: pxor 16(<pos98=%rax,<matrix=%rcx,1),<f100=%xmm2
pxor 16(%rax,%rcx,1),%xmm2

# qhasm:  (uint32) pos40 &= mask
# asm 1: andl <mask=int64#8d,<pos40=int64#10d
# asm 2: andl <mask=%r10d,<pos40=%r12d
andl %r10d,%r12d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f102 ^= w
# asm 1: pxor  <w=int6464#2,<f102=int6464#1
# asm 2: pxor  <w=%xmm1,<f102=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  uint32323232 f101 ^= *(int128 *) (pos98 + 0 + matrix)
# asm 1: pxor 0(<pos98=int64#7,<matrix=int64#4,1),<f101=int6464#5
# asm 2: pxor 0(<pos98=%rax,<matrix=%rcx,1),<f101=%xmm4
pxor 0(%rax,%rcx,1),%xmm4

# qhasm:  f101 ^= v
# asm 1: pxor  <v=int6464#6,<f101=int6464#5
# asm 2: pxor  <v=%xmm5,<f101=%xmm4
pxor  %xmm5,%xmm4

# qhasm:  pos100 = pos103
# asm 1: mov  <pos103=int64#14,>pos100=int64#7
# asm 2: mov  <pos103=%rbx,>pos100=%rax
mov  %rbx,%rax

# qhasm:  uint32323232 f39 ^= *(int128 *) (pos39 + 48 + matrix)
# asm 1: pxor 48(<pos39=int64#12,<matrix=int64#4,1),<f39=int6464#8
# asm 2: pxor 48(<pos39=%r14,<matrix=%rcx,1),<f39=%xmm7
pxor 48(%r14,%rcx,1),%xmm7

# qhasm:  (uint64) pos100 >>= 26
# asm 1: shr  $26,<pos100=int64#7
# asm 2: shr  $26,<pos100=%rax
shr  $26,%rax

# qhasm:  f103 = f39
# asm 1: movdqa <f39=int6464#8,>f103=int6464#2
# asm 2: movdqa <f39=%xmm7,>f103=%xmm1
movdqa %xmm7,%xmm1

# qhasm:  uint32323232 f40 ^= *(int128 *) (pos39 + 32 + matrix)
# asm 1: pxor 32(<pos39=int64#12,<matrix=int64#4,1),<f40=int6464#10
# asm 2: pxor 32(<pos39=%r14,<matrix=%rcx,1),<f40=%xmm9
pxor 32(%r14,%rcx,1),%xmm9

# qhasm:  (uint32) pos100 &= mask
# asm 1: andl <mask=int64#8d,<pos100=int64#7d
# asm 2: andl <mask=%r10d,<pos100=%eax
andl %r10d,%eax

# qhasm:  f38 >>= 80
# asm 1: psrldq $10,<f38=int6464#9
# asm 2: psrldq $10,<f38=%xmm8
psrldq $10,%xmm8

# qhasm:  uint32323232 f41 ^= *(int128 *) (pos39 + 16 + matrix)
# asm 1: pxor 16(<pos39=int64#12,<matrix=int64#4,1),<f41=int6464#7
# asm 2: pxor 16(<pos39=%r14,<matrix=%rcx,1),<f41=%xmm6
pxor 16(%r14,%rcx,1),%xmm6

# qhasm:  assign 7 to pos100

# qhasm:  f103 <<= 48
# asm 1: pslldq $6,<f103=int6464#2
# asm 2: pslldq $6,<f103=%xmm1
pslldq $6,%xmm1

# qhasm:  f101 ^= f38
# asm 1: pxor  <f38=int6464#9,<f101=int6464#5
# asm 2: pxor  <f38=%xmm8,<f101=%xmm4
pxor  %xmm8,%xmm4

# qhasm:  uint32323232 f99 ^= *(int128 *) (pos99 + 48 + matrix)
# asm 1: pxor 48(<pos99=int64#1,<matrix=int64#4,1),<f99=int6464#4
# asm 2: pxor 48(<pos99=%rdi,<matrix=%rcx,1),<f99=%xmm3
pxor 48(%rdi,%rcx,1),%xmm3

# qhasm:  v = f99
# asm 1: movdqa <f99=int6464#4,>v=int6464#6
# asm 2: movdqa <f99=%xmm3,>v=%xmm5
movdqa %xmm3,%xmm5

# qhasm:  f42 = *(int128 *) (pos39 + 0 + matrix)
# asm 1: movdqa 0(<pos39=int64#12,<matrix=int64#4),>f42=int6464#9
# asm 2: movdqa 0(<pos39=%r14,<matrix=%rcx),>f42=%xmm8
movdqa 0(%r14,%rcx),%xmm8

# qhasm:  uint6464 f99 <<= 3
# asm 1: psllq $3,<f99=int6464#4
# asm 2: psllq $3,<f99=%xmm3
psllq $3,%xmm3

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f100 ^= *(int128 *) (pos99 + 32 + matrix)
# asm 1: pxor 32(<pos99=int64#1,<matrix=int64#4,1),<f100=int6464#3
# asm 2: pxor 32(<pos99=%rdi,<matrix=%rcx,1),<f100=%xmm2
pxor 32(%rdi,%rcx,1),%xmm2

# qhasm:  (uint32) pos41 = pos47
# asm 1: mov  <pos47=int64#13d,>pos41=int64#11d
# asm 2: mov  <pos47=%r15d,>pos41=%r13d
mov  %r15d,%r13d

# qhasm:  f103 ^= f99
# asm 1: pxor  <f99=int6464#4,<f103=int6464#2
# asm 2: pxor  <f99=%xmm3,<f103=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  (uint32) pos41 >>= 2
# asm 1: shr  $2,<pos41=int64#11d
# asm 2: shr  $2,<pos41=%r13d
shr  $2,%r13d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#4
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm3
pshufd $0x45,%xmm5,%xmm3

# qhasm:  uint32323232 f101 ^= *(int128 *) (pos99 + 16 + matrix)
# asm 1: pxor 16(<pos99=int64#1,<matrix=int64#4,1),<f101=int6464#5
# asm 2: pxor 16(<pos99=%rdi,<matrix=%rcx,1),<f101=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm:  (uint32) pos41 &= mask
# asm 1: andl <mask=int64#8d,<pos41=int64#11d
# asm 2: andl <mask=%r10d,<pos41=%r13d
andl %r10d,%r13d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f103 ^= w
# asm 1: pxor  <w=int6464#4,<f103=int6464#2
# asm 2: pxor  <w=%xmm3,<f103=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  uint32323232 f102 ^= *(int128 *) (pos99 + 0 + matrix)
# asm 1: pxor 0(<pos99=int64#1,<matrix=int64#4,1),<f102=int6464#1
# asm 2: pxor 0(<pos99=%rdi,<matrix=%rcx,1),<f102=%xmm0
pxor 0(%rdi,%rcx,1),%xmm0

# qhasm:  f102 ^= v
# asm 1: pxor  <v=int6464#6,<f102=int6464#1
# asm 2: pxor  <v=%xmm5,<f102=%xmm0
pxor  %xmm5,%xmm0

# qhasm:  pos101 = pos103
# asm 1: mov  <pos103=int64#14,>pos101=int64#1
# asm 2: mov  <pos103=%rbx,>pos101=%rdi
mov  %rbx,%rdi

# qhasm:  uint32323232 f40 ^= *(int128 *) (pos40 + 48 + matrix)
# asm 1: pxor 48(<pos40=int64#10,<matrix=int64#4,1),<f40=int6464#10
# asm 2: pxor 48(<pos40=%r12,<matrix=%rcx,1),<f40=%xmm9
pxor 48(%r12,%rcx,1),%xmm9

# qhasm:  (uint64) pos101 >>= 34
# asm 1: shr  $34,<pos101=int64#1
# asm 2: shr  $34,<pos101=%rdi
shr  $34,%rdi

# qhasm:  f104 = f40
# asm 1: movdqa <f40=int6464#10,>f104=int6464#4
# asm 2: movdqa <f40=%xmm9,>f104=%xmm3
movdqa %xmm9,%xmm3

# qhasm:  uint32323232 f41 ^= *(int128 *) (pos40 + 32 + matrix)
# asm 1: pxor 32(<pos40=int64#10,<matrix=int64#4,1),<f41=int6464#7
# asm 2: pxor 32(<pos40=%r12,<matrix=%rcx,1),<f41=%xmm6
pxor 32(%r12,%rcx,1),%xmm6

# qhasm:  (uint32) pos101 &= mask
# asm 1: andl <mask=int64#8d,<pos101=int64#1d
# asm 2: andl <mask=%r10d,<pos101=%edi
andl %r10d,%edi

# qhasm:  f39 >>= 80
# asm 1: psrldq $10,<f39=int6464#8
# asm 2: psrldq $10,<f39=%xmm7
psrldq $10,%xmm7

# qhasm:  uint32323232 f42 ^= *(int128 *) (pos40 + 16 + matrix)
# asm 1: pxor 16(<pos40=int64#10,<matrix=int64#4,1),<f42=int6464#9
# asm 2: pxor 16(<pos40=%r12,<matrix=%rcx,1),<f42=%xmm8
pxor 16(%r12,%rcx,1),%xmm8

# qhasm:  assign 1 to pos101

# qhasm:  f104 <<= 48
# asm 1: pslldq $6,<f104=int6464#4
# asm 2: pslldq $6,<f104=%xmm3
pslldq $6,%xmm3

# qhasm:  f102 ^= f39
# asm 1: pxor  <f39=int6464#8,<f102=int6464#1
# asm 2: pxor  <f39=%xmm7,<f102=%xmm0
pxor  %xmm7,%xmm0

# qhasm:  uint32323232 f100 ^= *(int128 *) (pos100 + 48 + matrix)
# asm 1: pxor 48(<pos100=int64#7,<matrix=int64#4,1),<f100=int6464#3
# asm 2: pxor 48(<pos100=%rax,<matrix=%rcx,1),<f100=%xmm2
pxor 48(%rax,%rcx,1),%xmm2

# qhasm:  v = f100
# asm 1: movdqa <f100=int6464#3,>v=int6464#6
# asm 2: movdqa <f100=%xmm2,>v=%xmm5
movdqa %xmm2,%xmm5

# qhasm:  f43 = *(int128 *) (pos40 + 0 + matrix)
# asm 1: movdqa 0(<pos40=int64#10,<matrix=int64#4),>f43=int6464#8
# asm 2: movdqa 0(<pos40=%r12,<matrix=%rcx),>f43=%xmm7
movdqa 0(%r12,%rcx),%xmm7

# qhasm:  uint6464 f100 <<= 3
# asm 1: psllq $3,<f100=int6464#3
# asm 2: psllq $3,<f100=%xmm2
psllq $3,%xmm2

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f101 ^= *(int128 *) (pos100 + 32 + matrix)
# asm 1: pxor 32(<pos100=int64#7,<matrix=int64#4,1),<f101=int6464#5
# asm 2: pxor 32(<pos100=%rax,<matrix=%rcx,1),<f101=%xmm4
pxor 32(%rax,%rcx,1),%xmm4

# qhasm:  (uint32) pos42 = pos47
# asm 1: mov  <pos47=int64#13d,>pos42=int64#10d
# asm 2: mov  <pos47=%r15d,>pos42=%r12d
mov  %r15d,%r12d

# qhasm:  f104 ^= f100
# asm 1: pxor  <f100=int6464#3,<f104=int6464#4
# asm 2: pxor  <f100=%xmm2,<f104=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  (uint32) pos42 >>= 10
# asm 1: shr  $10,<pos42=int64#10d
# asm 2: shr  $10,<pos42=%r12d
shr  $10,%r12d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#3
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm2
pshufd $0x45,%xmm5,%xmm2

# qhasm:  uint32323232 f102 ^= *(int128 *) (pos100 + 16 + matrix)
# asm 1: pxor 16(<pos100=int64#7,<matrix=int64#4,1),<f102=int6464#1
# asm 2: pxor 16(<pos100=%rax,<matrix=%rcx,1),<f102=%xmm0
pxor 16(%rax,%rcx,1),%xmm0

# qhasm:  (uint32) pos42 &= mask
# asm 1: andl <mask=int64#8d,<pos42=int64#10d
# asm 2: andl <mask=%r10d,<pos42=%r12d
andl %r10d,%r12d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f104 ^= w
# asm 1: pxor  <w=int6464#3,<f104=int6464#4
# asm 2: pxor  <w=%xmm2,<f104=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  uint32323232 f103 ^= *(int128 *) (pos100 + 0 + matrix)
# asm 1: pxor 0(<pos100=int64#7,<matrix=int64#4,1),<f103=int6464#2
# asm 2: pxor 0(<pos100=%rax,<matrix=%rcx,1),<f103=%xmm1
pxor 0(%rax,%rcx,1),%xmm1

# qhasm:  f103 ^= v
# asm 1: pxor  <v=int6464#6,<f103=int6464#2
# asm 2: pxor  <v=%xmm5,<f103=%xmm1
pxor  %xmm5,%xmm1

# qhasm:  pos111 = *(int64 *) (bp + 40)
# asm 1: movq   40(<bp=int64#2),>pos111=int64#12
# asm 2: movq   40(<bp=%rsi),>pos111=%r14
movq   40(%rsi),%r14

# qhasm:  pos102 = pos103
# asm 1: mov  <pos103=int64#14,>pos102=int64#15
# asm 2: mov  <pos103=%rbx,>pos102=%rbp
mov  %rbx,%rbp

# qhasm:  uint32323232 f41 ^= *(int128 *) (pos41 + 48 + matrix)
# asm 1: pxor 48(<pos41=int64#11,<matrix=int64#4,1),<f41=int6464#7
# asm 2: pxor 48(<pos41=%r13,<matrix=%rcx,1),<f41=%xmm6
pxor 48(%r13,%rcx,1),%xmm6

# qhasm:  (uint64) pos102 >>= 42
# asm 1: shr  $42,<pos102=int64#15
# asm 2: shr  $42,<pos102=%rbp
shr  $42,%rbp

# qhasm:  f105 = f41
# asm 1: movdqa <f41=int6464#7,>f105=int6464#3
# asm 2: movdqa <f41=%xmm6,>f105=%xmm2
movdqa %xmm6,%xmm2

# qhasm:  uint32323232 f42 ^= *(int128 *) (pos41 + 32 + matrix)
# asm 1: pxor 32(<pos41=int64#11,<matrix=int64#4,1),<f42=int6464#9
# asm 2: pxor 32(<pos41=%r13,<matrix=%rcx,1),<f42=%xmm8
pxor 32(%r13,%rcx,1),%xmm8

# qhasm:  (uint32) pos102 &= mask
# asm 1: andl <mask=int64#8d,<pos102=int64#15d
# asm 2: andl <mask=%r10d,<pos102=%ebp
andl %r10d,%ebp

# qhasm:  f40 >>= 80
# asm 1: psrldq $10,<f40=int6464#10
# asm 2: psrldq $10,<f40=%xmm9
psrldq $10,%xmm9

# qhasm:  uint32323232 f43 ^= *(int128 *) (pos41 + 16 + matrix)
# asm 1: pxor 16(<pos41=int64#11,<matrix=int64#4,1),<f43=int6464#8
# asm 2: pxor 16(<pos41=%r13,<matrix=%rcx,1),<f43=%xmm7
pxor 16(%r13,%rcx,1),%xmm7

# qhasm:  assign 15 to pos102

# qhasm:  f105 <<= 48
# asm 1: pslldq $6,<f105=int6464#3
# asm 2: pslldq $6,<f105=%xmm2
pslldq $6,%xmm2

# qhasm:  f103 ^= f40
# asm 1: pxor  <f40=int6464#10,<f103=int6464#2
# asm 2: pxor  <f40=%xmm9,<f103=%xmm1
pxor  %xmm9,%xmm1

# qhasm:  uint32323232 f101 ^= *(int128 *) (pos101 + 48 + matrix)
# asm 1: pxor 48(<pos101=int64#1,<matrix=int64#4,1),<f101=int6464#5
# asm 2: pxor 48(<pos101=%rdi,<matrix=%rcx,1),<f101=%xmm4
pxor 48(%rdi,%rcx,1),%xmm4

# qhasm:  v = f101
# asm 1: movdqa <f101=int6464#5,>v=int6464#6
# asm 2: movdqa <f101=%xmm4,>v=%xmm5
movdqa %xmm4,%xmm5

# qhasm:  f44 = *(int128 *) (pos41 + 0 + matrix)
# asm 1: movdqa 0(<pos41=int64#11,<matrix=int64#4),>f44=int6464#10
# asm 2: movdqa 0(<pos41=%r13,<matrix=%rcx),>f44=%xmm9
movdqa 0(%r13,%rcx),%xmm9

# qhasm:  uint6464 f101 <<= 3
# asm 1: psllq $3,<f101=int6464#5
# asm 2: psllq $3,<f101=%xmm4
psllq $3,%xmm4

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f102 ^= *(int128 *) (pos101 + 32 + matrix)
# asm 1: pxor 32(<pos101=int64#1,<matrix=int64#4,1),<f102=int6464#1
# asm 2: pxor 32(<pos101=%rdi,<matrix=%rcx,1),<f102=%xmm0
pxor 32(%rdi,%rcx,1),%xmm0

# qhasm:  (uint32) pos43 = pos47
# asm 1: mov  <pos47=int64#13d,>pos43=int64#11d
# asm 2: mov  <pos47=%r15d,>pos43=%r13d
mov  %r15d,%r13d

# qhasm:  f105 ^= f101
# asm 1: pxor  <f101=int6464#5,<f105=int6464#3
# asm 2: pxor  <f101=%xmm4,<f105=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  (uint32) pos43 >>= 18
# asm 1: shr  $18,<pos43=int64#11d
# asm 2: shr  $18,<pos43=%r13d
shr  $18,%r13d

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#5
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm4
pshufd $0x45,%xmm5,%xmm4

# qhasm:  uint32323232 f103 ^= *(int128 *) (pos101 + 16 + matrix)
# asm 1: pxor 16(<pos101=int64#1,<matrix=int64#4,1),<f103=int6464#2
# asm 2: pxor 16(<pos101=%rdi,<matrix=%rcx,1),<f103=%xmm1
pxor 16(%rdi,%rcx,1),%xmm1

# qhasm:  (uint32) pos43 &= mask
# asm 1: andl <mask=int64#8d,<pos43=int64#11d
# asm 2: andl <mask=%r10d,<pos43=%r13d
andl %r10d,%r13d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f105 ^= w
# asm 1: pxor  <w=int6464#5,<f105=int6464#3
# asm 2: pxor  <w=%xmm4,<f105=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  uint32323232 f104 ^= *(int128 *) (pos101 + 0 + matrix)
# asm 1: pxor 0(<pos101=int64#1,<matrix=int64#4,1),<f104=int6464#4
# asm 2: pxor 0(<pos101=%rdi,<matrix=%rcx,1),<f104=%xmm3
pxor 0(%rdi,%rcx,1),%xmm3

# qhasm:  f104 ^= v
# asm 1: pxor  <v=int6464#6,<f104=int6464#4
# asm 2: pxor  <v=%xmm5,<f104=%xmm3
pxor  %xmm5,%xmm3

# qhasm:  uint32323232 f42 ^= *(int128 *) (pos42 + 48 + matrix)
# asm 1: pxor 48(<pos42=int64#10,<matrix=int64#4,1),<f42=int6464#9
# asm 2: pxor 48(<pos42=%r12,<matrix=%rcx,1),<f42=%xmm8
pxor 48(%r12,%rcx,1),%xmm8

# qhasm:  (uint64) pos103 >>= 50
# asm 1: shr  $50,<pos103=int64#14
# asm 2: shr  $50,<pos103=%rbx
shr  $50,%rbx

# qhasm:  f106 = f42
# asm 1: movdqa <f42=int6464#9,>f106=int6464#5
# asm 2: movdqa <f42=%xmm8,>f106=%xmm4
movdqa %xmm8,%xmm4

# qhasm:  uint32323232 f43 ^= *(int128 *) (pos42 + 32 + matrix)
# asm 1: pxor 32(<pos42=int64#10,<matrix=int64#4,1),<f43=int6464#8
# asm 2: pxor 32(<pos42=%r12,<matrix=%rcx,1),<f43=%xmm7
pxor 32(%r12,%rcx,1),%xmm7

# qhasm:  (uint32) pos103 &= mask
# asm 1: andl <mask=int64#8d,<pos103=int64#14d
# asm 2: andl <mask=%r10d,<pos103=%ebx
andl %r10d,%ebx

# qhasm:  f41 >>= 80
# asm 1: psrldq $10,<f41=int6464#7
# asm 2: psrldq $10,<f41=%xmm6
psrldq $10,%xmm6

# qhasm:  uint32323232 f44 ^= *(int128 *) (pos42 + 16 + matrix)
# asm 1: pxor 16(<pos42=int64#10,<matrix=int64#4,1),<f44=int6464#10
# asm 2: pxor 16(<pos42=%r12,<matrix=%rcx,1),<f44=%xmm9
pxor 16(%r12,%rcx,1),%xmm9

# qhasm:  assign 14 to pos103

# qhasm:  f106 <<= 48
# asm 1: pslldq $6,<f106=int6464#5
# asm 2: pslldq $6,<f106=%xmm4
pslldq $6,%xmm4

# qhasm:  f104 ^= f41
# asm 1: pxor  <f41=int6464#7,<f104=int6464#4
# asm 2: pxor  <f41=%xmm6,<f104=%xmm3
pxor  %xmm6,%xmm3

# qhasm:  uint32323232 f102 ^= *(int128 *) (pos102 + 48 + matrix)
# asm 1: pxor 48(<pos102=int64#15,<matrix=int64#4,1),<f102=int6464#1
# asm 2: pxor 48(<pos102=%rbp,<matrix=%rcx,1),<f102=%xmm0
pxor 48(%rbp,%rcx,1),%xmm0

# qhasm:  v = f102
# asm 1: movdqa <f102=int6464#1,>v=int6464#6
# asm 2: movdqa <f102=%xmm0,>v=%xmm5
movdqa %xmm0,%xmm5

# qhasm:  f45 = *(int128 *) (pos42 + 0 + matrix)
# asm 1: movdqa 0(<pos42=int64#10,<matrix=int64#4),>f45=int6464#7
# asm 2: movdqa 0(<pos42=%r12,<matrix=%rcx),>f45=%xmm6
movdqa 0(%r12,%rcx),%xmm6

# qhasm:  uint6464 f102 <<= 3
# asm 1: psllq $3,<f102=int6464#1
# asm 2: psllq $3,<f102=%xmm0
psllq $3,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos44 = pos47
# asm 1: mov  <pos47=int64#13,>pos44=int64#7
# asm 2: mov  <pos47=%r15,>pos44=%rax
mov  %r15,%rax

# qhasm:  uint32323232 f103 ^= *(int128 *) (pos102 + 32 + matrix)
# asm 1: pxor 32(<pos102=int64#15,<matrix=int64#4,1),<f103=int6464#2
# asm 2: pxor 32(<pos102=%rbp,<matrix=%rcx,1),<f103=%xmm1
pxor 32(%rbp,%rcx,1),%xmm1

# qhasm:  f106 ^= f102
# asm 1: pxor  <f102=int6464#1,<f106=int6464#5
# asm 2: pxor  <f102=%xmm0,<f106=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  (uint64) pos44 >>= 26
# asm 1: shr  $26,<pos44=int64#7
# asm 2: shr  $26,<pos44=%rax
shr  $26,%rax

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#1
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm0
pshufd $0x45,%xmm5,%xmm0

# qhasm:  uint32323232 f104 ^= *(int128 *) (pos102 + 16 + matrix)
# asm 1: pxor 16(<pos102=int64#15,<matrix=int64#4,1),<f104=int6464#4
# asm 2: pxor 16(<pos102=%rbp,<matrix=%rcx,1),<f104=%xmm3
pxor 16(%rbp,%rcx,1),%xmm3

# qhasm:  (uint32) pos44 &= mask
# asm 1: andl <mask=int64#8d,<pos44=int64#7d
# asm 2: andl <mask=%r10d,<pos44=%eax
andl %r10d,%eax

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 7 to pos44

# qhasm:  f106 ^= w
# asm 1: pxor  <w=int6464#1,<f106=int6464#5
# asm 2: pxor  <w=%xmm0,<f106=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  uint32323232 f105 ^= *(int128 *) (pos102 + 0 + matrix)
# asm 1: pxor 0(<pos102=int64#15,<matrix=int64#4,1),<f105=int6464#3
# asm 2: pxor 0(<pos102=%rbp,<matrix=%rcx,1),<f105=%xmm2
pxor 0(%rbp,%rcx,1),%xmm2

# qhasm:  f105 ^= v
# asm 1: pxor  <v=int6464#6,<f105=int6464#3
# asm 2: pxor  <v=%xmm5,<f105=%xmm2
pxor  %xmm5,%xmm2

# qhasm:  (uint32) pos104 = pos111
# asm 1: mov  <pos111=int64#12d,>pos104=int64#10d
# asm 2: mov  <pos111=%r14d,>pos104=%r12d
mov  %r14d,%r12d

# qhasm:  uint32323232 f43 ^= *(int128 *) (pos43 + 48 + matrix)
# asm 1: pxor 48(<pos43=int64#11,<matrix=int64#4,1),<f43=int6464#8
# asm 2: pxor 48(<pos43=%r13,<matrix=%rcx,1),<f43=%xmm7
pxor 48(%r13,%rcx,1),%xmm7

# qhasm:  (uint32) pos104 <<= 6
# asm 1: shl  $6,<pos104=int64#10d
# asm 2: shl  $6,<pos104=%r12d
shl  $6,%r12d

# qhasm:  f107 = f43
# asm 1: movdqa <f43=int6464#8,>f107=int6464#1
# asm 2: movdqa <f43=%xmm7,>f107=%xmm0
movdqa %xmm7,%xmm0

# qhasm:  uint32323232 f44 ^= *(int128 *) (pos43 + 32 + matrix)
# asm 1: pxor 32(<pos43=int64#11,<matrix=int64#4,1),<f44=int6464#10
# asm 2: pxor 32(<pos43=%r13,<matrix=%rcx,1),<f44=%xmm9
pxor 32(%r13,%rcx,1),%xmm9

# qhasm:  (uint32) pos104 &= mask
# asm 1: andl <mask=int64#8d,<pos104=int64#10d
# asm 2: andl <mask=%r10d,<pos104=%r12d
andl %r10d,%r12d

# qhasm:  f42 >>= 80
# asm 1: psrldq $10,<f42=int6464#9
# asm 2: psrldq $10,<f42=%xmm8
psrldq $10,%xmm8

# qhasm:  uint32323232 f45 ^= *(int128 *) (pos43 + 16 + matrix)
# asm 1: pxor 16(<pos43=int64#11,<matrix=int64#4,1),<f45=int6464#7
# asm 2: pxor 16(<pos43=%r13,<matrix=%rcx,1),<f45=%xmm6
pxor 16(%r13,%rcx,1),%xmm6

# qhasm:  f107 <<= 48
# asm 1: pslldq $6,<f107=int6464#1
# asm 2: pslldq $6,<f107=%xmm0
pslldq $6,%xmm0

# qhasm:  f105 ^= f42
# asm 1: pxor  <f42=int6464#9,<f105=int6464#3
# asm 2: pxor  <f42=%xmm8,<f105=%xmm2
pxor  %xmm8,%xmm2

# qhasm:  uint32323232 f103 ^= *(int128 *) (pos103 + 48 + matrix)
# asm 1: pxor 48(<pos103=int64#14,<matrix=int64#4,1),<f103=int6464#2
# asm 2: pxor 48(<pos103=%rbx,<matrix=%rcx,1),<f103=%xmm1
pxor 48(%rbx,%rcx,1),%xmm1

# qhasm:  v = f103
# asm 1: movdqa <f103=int6464#2,>v=int6464#6
# asm 2: movdqa <f103=%xmm1,>v=%xmm5
movdqa %xmm1,%xmm5

# qhasm:  f46 = *(int128 *) (pos43 + 0 + matrix)
# asm 1: movdqa 0(<pos43=int64#11,<matrix=int64#4),>f46=int6464#9
# asm 2: movdqa 0(<pos43=%r13,<matrix=%rcx),>f46=%xmm8
movdqa 0(%r13,%rcx),%xmm8

# qhasm:  uint6464 f103 <<= 3
# asm 1: psllq $3,<f103=int6464#2
# asm 2: psllq $3,<f103=%xmm1
psllq $3,%xmm1

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos45 = pos47
# asm 1: mov  <pos47=int64#13,>pos45=int64#1
# asm 2: mov  <pos47=%r15,>pos45=%rdi
mov  %r15,%rdi

# qhasm:  uint32323232 f104 ^= *(int128 *) (pos103 + 32 + matrix)
# asm 1: pxor 32(<pos103=int64#14,<matrix=int64#4,1),<f104=int6464#4
# asm 2: pxor 32(<pos103=%rbx,<matrix=%rcx,1),<f104=%xmm3
pxor 32(%rbx,%rcx,1),%xmm3

# qhasm:  f107 ^= f103
# asm 1: pxor  <f103=int6464#2,<f107=int6464#1
# asm 2: pxor  <f103=%xmm1,<f107=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  (uint64) pos45 >>= 34
# asm 1: shr  $34,<pos45=int64#1
# asm 2: shr  $34,<pos45=%rdi
shr  $34,%rdi

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#2
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm1
pshufd $0x45,%xmm5,%xmm1

# qhasm:  uint32323232 f105 ^= *(int128 *) (pos103 + 16 + matrix)
# asm 1: pxor 16(<pos103=int64#14,<matrix=int64#4,1),<f105=int6464#3
# asm 2: pxor 16(<pos103=%rbx,<matrix=%rcx,1),<f105=%xmm2
pxor 16(%rbx,%rcx,1),%xmm2

# qhasm:  (uint32) pos45 &= mask
# asm 1: andl <mask=int64#8d,<pos45=int64#1d
# asm 2: andl <mask=%r10d,<pos45=%edi
andl %r10d,%edi

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 1 to pos45

# qhasm:  f107 ^= w
# asm 1: pxor  <w=int6464#2,<f107=int6464#1
# asm 2: pxor  <w=%xmm1,<f107=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  uint32323232 f106 ^= *(int128 *) (pos103 + 0 + matrix)
# asm 1: pxor 0(<pos103=int64#14,<matrix=int64#4,1),<f106=int6464#5
# asm 2: pxor 0(<pos103=%rbx,<matrix=%rcx,1),<f106=%xmm4
pxor 0(%rbx,%rcx,1),%xmm4

# qhasm:  f106 ^= v
# asm 1: pxor  <v=int6464#6,<f106=int6464#5
# asm 2: pxor  <v=%xmm5,<f106=%xmm4
pxor  %xmm5,%xmm4

# qhasm:  (uint32) pos105 = pos111
# asm 1: mov  <pos111=int64#12d,>pos105=int64#11d
# asm 2: mov  <pos111=%r14d,>pos105=%r13d
mov  %r14d,%r13d

# qhasm:  uint32323232 f44 ^= *(int128 *) (pos44 + 48 + matrix)
# asm 1: pxor 48(<pos44=int64#7,<matrix=int64#4,1),<f44=int6464#10
# asm 2: pxor 48(<pos44=%rax,<matrix=%rcx,1),<f44=%xmm9
pxor 48(%rax,%rcx,1),%xmm9

# qhasm:  (uint32) pos105 >>= 2
# asm 1: shr  $2,<pos105=int64#11d
# asm 2: shr  $2,<pos105=%r13d
shr  $2,%r13d

# qhasm:  f108 = f44
# asm 1: movdqa <f44=int6464#10,>f108=int6464#2
# asm 2: movdqa <f44=%xmm9,>f108=%xmm1
movdqa %xmm9,%xmm1

# qhasm:  uint32323232 f45 ^= *(int128 *) (pos44 + 32 + matrix)
# asm 1: pxor 32(<pos44=int64#7,<matrix=int64#4,1),<f45=int6464#7
# asm 2: pxor 32(<pos44=%rax,<matrix=%rcx,1),<f45=%xmm6
pxor 32(%rax,%rcx,1),%xmm6

# qhasm:  (uint32) pos105 &= mask
# asm 1: andl <mask=int64#8d,<pos105=int64#11d
# asm 2: andl <mask=%r10d,<pos105=%r13d
andl %r10d,%r13d

# qhasm:  f43 >>= 80
# asm 1: psrldq $10,<f43=int6464#8
# asm 2: psrldq $10,<f43=%xmm7
psrldq $10,%xmm7

# qhasm:  uint32323232 f46 ^= *(int128 *) (pos44 + 16 + matrix)
# asm 1: pxor 16(<pos44=int64#7,<matrix=int64#4,1),<f46=int6464#9
# asm 2: pxor 16(<pos44=%rax,<matrix=%rcx,1),<f46=%xmm8
pxor 16(%rax,%rcx,1),%xmm8

# qhasm:  f108 <<= 48
# asm 1: pslldq $6,<f108=int6464#2
# asm 2: pslldq $6,<f108=%xmm1
pslldq $6,%xmm1

# qhasm:  f106 ^= f43
# asm 1: pxor  <f43=int6464#8,<f106=int6464#5
# asm 2: pxor  <f43=%xmm7,<f106=%xmm4
pxor  %xmm7,%xmm4

# qhasm:  uint32323232 f104 ^= *(int128 *) (pos104 + 48 + matrix)
# asm 1: pxor 48(<pos104=int64#10,<matrix=int64#4,1),<f104=int6464#4
# asm 2: pxor 48(<pos104=%r12,<matrix=%rcx,1),<f104=%xmm3
pxor 48(%r12,%rcx,1),%xmm3

# qhasm:  v = f104
# asm 1: movdqa <f104=int6464#4,>v=int6464#6
# asm 2: movdqa <f104=%xmm3,>v=%xmm5
movdqa %xmm3,%xmm5

# qhasm:  f47 = *(int128 *) (pos44 + 0 + matrix)
# asm 1: movdqa 0(<pos44=int64#7,<matrix=int64#4),>f47=int6464#8
# asm 2: movdqa 0(<pos44=%rax,<matrix=%rcx),>f47=%xmm7
movdqa 0(%rax,%rcx),%xmm7

# qhasm:  uint6464 f104 <<= 3
# asm 1: psllq $3,<f104=int6464#4
# asm 2: psllq $3,<f104=%xmm3
psllq $3,%xmm3

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  pos46 = pos47
# asm 1: mov  <pos47=int64#13,>pos46=int64#15
# asm 2: mov  <pos47=%r15,>pos46=%rbp
mov  %r15,%rbp

# qhasm:  uint32323232 f105 ^= *(int128 *) (pos104 + 32 + matrix)
# asm 1: pxor 32(<pos104=int64#10,<matrix=int64#4,1),<f105=int6464#3
# asm 2: pxor 32(<pos104=%r12,<matrix=%rcx,1),<f105=%xmm2
pxor 32(%r12,%rcx,1),%xmm2

# qhasm:  f108 ^= f104
# asm 1: pxor  <f104=int6464#4,<f108=int6464#2
# asm 2: pxor  <f104=%xmm3,<f108=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  (uint64) pos46 >>= 42
# asm 1: shr  $42,<pos46=int64#15
# asm 2: shr  $42,<pos46=%rbp
shr  $42,%rbp

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#4
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm3
pshufd $0x45,%xmm5,%xmm3

# qhasm:  uint32323232 f106 ^= *(int128 *) (pos104 + 16 + matrix)
# asm 1: pxor 16(<pos104=int64#10,<matrix=int64#4,1),<f106=int6464#5
# asm 2: pxor 16(<pos104=%r12,<matrix=%rcx,1),<f106=%xmm4
pxor 16(%r12,%rcx,1),%xmm4

# qhasm:  (uint32) pos46 &= mask
# asm 1: andl <mask=int64#8d,<pos46=int64#15d
# asm 2: andl <mask=%r10d,<pos46=%ebp
andl %r10d,%ebp

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 15 to pos46

# qhasm:  f108 ^= w
# asm 1: pxor  <w=int6464#4,<f108=int6464#2
# asm 2: pxor  <w=%xmm3,<f108=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  uint32323232 f107 ^= *(int128 *) (pos104 + 0 + matrix)
# asm 1: pxor 0(<pos104=int64#10,<matrix=int64#4,1),<f107=int6464#1
# asm 2: pxor 0(<pos104=%r12,<matrix=%rcx,1),<f107=%xmm0
pxor 0(%r12,%rcx,1),%xmm0

# qhasm:  f107 ^= v
# asm 1: pxor  <v=int6464#6,<f107=int6464#1
# asm 2: pxor  <v=%xmm5,<f107=%xmm0
pxor  %xmm5,%xmm0

# qhasm:  (uint32) pos106 = pos111
# asm 1: mov  <pos111=int64#12d,>pos106=int64#7d
# asm 2: mov  <pos111=%r14d,>pos106=%eax
mov  %r14d,%eax

# qhasm:  uint32323232 f45 ^= *(int128 *) (pos45 + 48 + matrix)
# asm 1: pxor 48(<pos45=int64#1,<matrix=int64#4,1),<f45=int6464#7
# asm 2: pxor 48(<pos45=%rdi,<matrix=%rcx,1),<f45=%xmm6
pxor 48(%rdi,%rcx,1),%xmm6

# qhasm:  (uint32) pos106 >>= 10
# asm 1: shr  $10,<pos106=int64#7d
# asm 2: shr  $10,<pos106=%eax
shr  $10,%eax

# qhasm:  f109 = f45
# asm 1: movdqa <f45=int6464#7,>f109=int6464#4
# asm 2: movdqa <f45=%xmm6,>f109=%xmm3
movdqa %xmm6,%xmm3

# qhasm:  uint32323232 f46 ^= *(int128 *) (pos45 + 32 + matrix)
# asm 1: pxor 32(<pos45=int64#1,<matrix=int64#4,1),<f46=int6464#9
# asm 2: pxor 32(<pos45=%rdi,<matrix=%rcx,1),<f46=%xmm8
pxor 32(%rdi,%rcx,1),%xmm8

# qhasm:  (uint32) pos106 &= mask
# asm 1: andl <mask=int64#8d,<pos106=int64#7d
# asm 2: andl <mask=%r10d,<pos106=%eax
andl %r10d,%eax

# qhasm:  f44 >>= 80
# asm 1: psrldq $10,<f44=int6464#10
# asm 2: psrldq $10,<f44=%xmm9
psrldq $10,%xmm9

# qhasm:  uint32323232 f47 ^= *(int128 *) (pos45 + 16 + matrix)
# asm 1: pxor 16(<pos45=int64#1,<matrix=int64#4,1),<f47=int6464#8
# asm 2: pxor 16(<pos45=%rdi,<matrix=%rcx,1),<f47=%xmm7
pxor 16(%rdi,%rcx,1),%xmm7

# qhasm:  f109 <<= 48
# asm 1: pslldq $6,<f109=int6464#4
# asm 2: pslldq $6,<f109=%xmm3
pslldq $6,%xmm3

# qhasm:  f107 ^= f44
# asm 1: pxor  <f44=int6464#10,<f107=int6464#1
# asm 2: pxor  <f44=%xmm9,<f107=%xmm0
pxor  %xmm9,%xmm0

# qhasm:  uint32323232 f105 ^= *(int128 *) (pos105 + 48 + matrix)
# asm 1: pxor 48(<pos105=int64#11,<matrix=int64#4,1),<f105=int6464#3
# asm 2: pxor 48(<pos105=%r13,<matrix=%rcx,1),<f105=%xmm2
pxor 48(%r13,%rcx,1),%xmm2

# qhasm:  v = f105
# asm 1: movdqa <f105=int6464#3,>v=int6464#6
# asm 2: movdqa <f105=%xmm2,>v=%xmm5
movdqa %xmm2,%xmm5

# qhasm:  f48 = *(int128 *) (pos45 + 0 + matrix)
# asm 1: movdqa 0(<pos45=int64#1,<matrix=int64#4),>f48=int6464#10
# asm 2: movdqa 0(<pos45=%rdi,<matrix=%rcx),>f48=%xmm9
movdqa 0(%rdi,%rcx),%xmm9

# qhasm:  uint6464 f105 <<= 3
# asm 1: psllq $3,<f105=int6464#3
# asm 2: psllq $3,<f105=%xmm2
psllq $3,%xmm2

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f106 ^= *(int128 *) (pos105 + 32 + matrix)
# asm 1: pxor 32(<pos105=int64#11,<matrix=int64#4,1),<f106=int6464#5
# asm 2: pxor 32(<pos105=%r13,<matrix=%rcx,1),<f106=%xmm4
pxor 32(%r13,%rcx,1),%xmm4

# qhasm:  f109 ^= f105
# asm 1: pxor  <f105=int6464#3,<f109=int6464#4
# asm 2: pxor  <f105=%xmm2,<f109=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  (uint64) pos47 >>= 50
# asm 1: shr  $50,<pos47=int64#13
# asm 2: shr  $50,<pos47=%r15
shr  $50,%r15

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#3
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm2
pshufd $0x45,%xmm5,%xmm2

# qhasm:  uint32323232 f107 ^= *(int128 *) (pos105 + 16 + matrix)
# asm 1: pxor 16(<pos105=int64#11,<matrix=int64#4,1),<f107=int6464#1
# asm 2: pxor 16(<pos105=%r13,<matrix=%rcx,1),<f107=%xmm0
pxor 16(%r13,%rcx,1),%xmm0

# qhasm:  (uint32) pos47 &= mask
# asm 1: andl <mask=int64#8d,<pos47=int64#13d
# asm 2: andl <mask=%r10d,<pos47=%r15d
andl %r10d,%r15d

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  assign 14 to pos47

# qhasm:  f109 ^= w
# asm 1: pxor  <w=int6464#3,<f109=int6464#4
# asm 2: pxor  <w=%xmm2,<f109=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  uint32323232 f108 ^= *(int128 *) (pos105 + 0 + matrix)
# asm 1: pxor 0(<pos105=int64#11,<matrix=int64#4,1),<f108=int6464#2
# asm 2: pxor 0(<pos105=%r13,<matrix=%rcx,1),<f108=%xmm1
pxor 0(%r13,%rcx,1),%xmm1

# qhasm:  f108 ^= v
# asm 1: pxor  <v=int6464#6,<f108=int6464#2
# asm 2: pxor  <v=%xmm5,<f108=%xmm1
pxor  %xmm5,%xmm1

# qhasm:  (uint32) pos107 = pos111
# asm 1: mov  <pos111=int64#12d,>pos107=int64#1d
# asm 2: mov  <pos111=%r14d,>pos107=%edi
mov  %r14d,%edi

# qhasm:  uint32323232 f46 ^= *(int128 *) (pos46 + 48 + matrix)
# asm 1: pxor 48(<pos46=int64#15,<matrix=int64#4,1),<f46=int6464#9
# asm 2: pxor 48(<pos46=%rbp,<matrix=%rcx,1),<f46=%xmm8
pxor 48(%rbp,%rcx,1),%xmm8

# qhasm:  (uint32) pos107 >>= 18
# asm 1: shr  $18,<pos107=int64#1d
# asm 2: shr  $18,<pos107=%edi
shr  $18,%edi

# qhasm:  f110 = f46
# asm 1: movdqa <f46=int6464#9,>f110=int6464#3
# asm 2: movdqa <f46=%xmm8,>f110=%xmm2
movdqa %xmm8,%xmm2

# qhasm:  uint32323232 f47 ^= *(int128 *) (pos46 + 32 + matrix)
# asm 1: pxor 32(<pos46=int64#15,<matrix=int64#4,1),<f47=int6464#8
# asm 2: pxor 32(<pos46=%rbp,<matrix=%rcx,1),<f47=%xmm7
pxor 32(%rbp,%rcx,1),%xmm7

# qhasm:  (uint32) pos107 &= mask
# asm 1: andl <mask=int64#8d,<pos107=int64#1d
# asm 2: andl <mask=%r10d,<pos107=%edi
andl %r10d,%edi

# qhasm:  f45 >>= 80
# asm 1: psrldq $10,<f45=int6464#7
# asm 2: psrldq $10,<f45=%xmm6
psrldq $10,%xmm6

# qhasm:  uint32323232 f48 ^= *(int128 *) (pos46 + 16 + matrix)
# asm 1: pxor 16(<pos46=int64#15,<matrix=int64#4,1),<f48=int6464#10
# asm 2: pxor 16(<pos46=%rbp,<matrix=%rcx,1),<f48=%xmm9
pxor 16(%rbp,%rcx,1),%xmm9

# qhasm:  f110 <<= 48
# asm 1: pslldq $6,<f110=int6464#3
# asm 2: pslldq $6,<f110=%xmm2
pslldq $6,%xmm2

# qhasm:  f108 ^= f45
# asm 1: pxor  <f45=int6464#7,<f108=int6464#2
# asm 2: pxor  <f45=%xmm6,<f108=%xmm1
pxor  %xmm6,%xmm1

# qhasm:  uint32323232 f106 ^= *(int128 *) (pos106 + 48 + matrix)
# asm 1: pxor 48(<pos106=int64#7,<matrix=int64#4,1),<f106=int6464#5
# asm 2: pxor 48(<pos106=%rax,<matrix=%rcx,1),<f106=%xmm4
pxor 48(%rax,%rcx,1),%xmm4

# qhasm:  v = f106
# asm 1: movdqa <f106=int6464#5,>v=int6464#6
# asm 2: movdqa <f106=%xmm4,>v=%xmm5
movdqa %xmm4,%xmm5

# qhasm:  f49 = *(int128 *) (pos46 + 0 + matrix)
# asm 1: movdqa 0(<pos46=int64#15,<matrix=int64#4),>f49=int6464#7
# asm 2: movdqa 0(<pos46=%rbp,<matrix=%rcx),>f49=%xmm6
movdqa 0(%rbp,%rcx),%xmm6

# qhasm:  uint6464 f106 <<= 3
# asm 1: psllq $3,<f106=int6464#5
# asm 2: psllq $3,<f106=%xmm4
psllq $3,%xmm4

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f107 ^= *(int128 *) (pos106 + 32 + matrix)
# asm 1: pxor 32(<pos106=int64#7,<matrix=int64#4,1),<f107=int6464#1
# asm 2: pxor 32(<pos106=%rax,<matrix=%rcx,1),<f107=%xmm0
pxor 32(%rax,%rcx,1),%xmm0

# qhasm:  f110 ^= f106
# asm 1: pxor  <f106=int6464#5,<f110=int6464#3
# asm 2: pxor  <f106=%xmm4,<f110=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#5
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm4
pshufd $0x45,%xmm5,%xmm4

# qhasm:  uint32323232 f108 ^= *(int128 *) (pos106 + 16 + matrix)
# asm 1: pxor 16(<pos106=int64#7,<matrix=int64#4,1),<f108=int6464#2
# asm 2: pxor 16(<pos106=%rax,<matrix=%rcx,1),<f108=%xmm1
pxor 16(%rax,%rcx,1),%xmm1

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f110 ^= w
# asm 1: pxor  <w=int6464#5,<f110=int6464#3
# asm 2: pxor  <w=%xmm4,<f110=%xmm2
pxor  %xmm4,%xmm2

# qhasm:  uint32323232 f109 ^= *(int128 *) (pos106 + 0 + matrix)
# asm 1: pxor 0(<pos106=int64#7,<matrix=int64#4,1),<f109=int6464#4
# asm 2: pxor 0(<pos106=%rax,<matrix=%rcx,1),<f109=%xmm3
pxor 0(%rax,%rcx,1),%xmm3

# qhasm:  f109 ^= v
# asm 1: pxor  <v=int6464#6,<f109=int6464#4
# asm 2: pxor  <v=%xmm5,<f109=%xmm3
pxor  %xmm5,%xmm3

# qhasm:  pos108 = pos111
# asm 1: mov  <pos111=int64#12,>pos108=int64#7
# asm 2: mov  <pos111=%r14,>pos108=%rax
mov  %r14,%rax

# qhasm:  uint32323232 f47 ^= *(int128 *) (pos47 + 48 + matrix)
# asm 1: pxor 48(<pos47=int64#13,<matrix=int64#4,1),<f47=int6464#8
# asm 2: pxor 48(<pos47=%r15,<matrix=%rcx,1),<f47=%xmm7
pxor 48(%r15,%rcx,1),%xmm7

# qhasm:  (uint64) pos108 >>= 26
# asm 1: shr  $26,<pos108=int64#7
# asm 2: shr  $26,<pos108=%rax
shr  $26,%rax

# qhasm:  f111 = f47
# asm 1: movdqa <f47=int6464#8,>f111=int6464#5
# asm 2: movdqa <f47=%xmm7,>f111=%xmm4
movdqa %xmm7,%xmm4

# qhasm:  uint32323232 f48 ^= *(int128 *) (pos47 + 32 + matrix)
# asm 1: pxor 32(<pos47=int64#13,<matrix=int64#4,1),<f48=int6464#10
# asm 2: pxor 32(<pos47=%r15,<matrix=%rcx,1),<f48=%xmm9
pxor 32(%r15,%rcx,1),%xmm9

# qhasm:  (uint32) pos108 &= mask
# asm 1: andl <mask=int64#8d,<pos108=int64#7d
# asm 2: andl <mask=%r10d,<pos108=%eax
andl %r10d,%eax

# qhasm:  f46 >>= 80
# asm 1: psrldq $10,<f46=int6464#9
# asm 2: psrldq $10,<f46=%xmm8
psrldq $10,%xmm8

# qhasm:  uint32323232 f49 ^= *(int128 *) (pos47 + 16 + matrix)
# asm 1: pxor 16(<pos47=int64#13,<matrix=int64#4,1),<f49=int6464#7
# asm 2: pxor 16(<pos47=%r15,<matrix=%rcx,1),<f49=%xmm6
pxor 16(%r15,%rcx,1),%xmm6

# qhasm:  assign 7 to pos108

# qhasm:  f111 <<= 48
# asm 1: pslldq $6,<f111=int6464#5
# asm 2: pslldq $6,<f111=%xmm4
pslldq $6,%xmm4

# qhasm:  f109 ^= f46
# asm 1: pxor  <f46=int6464#9,<f109=int6464#4
# asm 2: pxor  <f46=%xmm8,<f109=%xmm3
pxor  %xmm8,%xmm3

# qhasm:  uint32323232 f107 ^= *(int128 *) (pos107 + 48 + matrix)
# asm 1: pxor 48(<pos107=int64#1,<matrix=int64#4,1),<f107=int6464#1
# asm 2: pxor 48(<pos107=%rdi,<matrix=%rcx,1),<f107=%xmm0
pxor 48(%rdi,%rcx,1),%xmm0

# qhasm:  v = f107
# asm 1: movdqa <f107=int6464#1,>v=int6464#6
# asm 2: movdqa <f107=%xmm0,>v=%xmm5
movdqa %xmm0,%xmm5

# qhasm:  f50 = *(int128 *) (pos47 + 0 + matrix)
# asm 1: movdqa 0(<pos47=int64#13,<matrix=int64#4),>f50=int6464#9
# asm 2: movdqa 0(<pos47=%r15,<matrix=%rcx),>f50=%xmm8
movdqa 0(%r15,%rcx),%xmm8

# qhasm:  uint6464 f107 <<= 3
# asm 1: psllq $3,<f107=int6464#1
# asm 2: psllq $3,<f107=%xmm0
psllq $3,%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f108 ^= *(int128 *) (pos107 + 32 + matrix)
# asm 1: pxor 32(<pos107=int64#1,<matrix=int64#4,1),<f108=int6464#2
# asm 2: pxor 32(<pos107=%rdi,<matrix=%rcx,1),<f108=%xmm1
pxor 32(%rdi,%rcx,1),%xmm1

# qhasm:  f111 ^= f107
# asm 1: pxor  <f107=int6464#1,<f111=int6464#5
# asm 2: pxor  <f107=%xmm0,<f111=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#1
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm0
pshufd $0x45,%xmm5,%xmm0

# qhasm:  uint32323232 f109 ^= *(int128 *) (pos107 + 16 + matrix)
# asm 1: pxor 16(<pos107=int64#1,<matrix=int64#4,1),<f109=int6464#4
# asm 2: pxor 16(<pos107=%rdi,<matrix=%rcx,1),<f109=%xmm3
pxor 16(%rdi,%rcx,1),%xmm3

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f111 ^= w
# asm 1: pxor  <w=int6464#1,<f111=int6464#5
# asm 2: pxor  <w=%xmm0,<f111=%xmm4
pxor  %xmm0,%xmm4

# qhasm:  uint32323232 f110 ^= *(int128 *) (pos107 + 0 + matrix)
# asm 1: pxor 0(<pos107=int64#1,<matrix=int64#4,1),<f110=int6464#3
# asm 2: pxor 0(<pos107=%rdi,<matrix=%rcx,1),<f110=%xmm2
pxor 0(%rdi,%rcx,1),%xmm2

# qhasm:  f110 ^= v
# asm 1: pxor  <v=int6464#6,<f110=int6464#3
# asm 2: pxor  <v=%xmm5,<f110=%xmm2
pxor  %xmm5,%xmm2

# qhasm:  pos109 = pos111
# asm 1: mov  <pos111=int64#12,>pos109=int64#1
# asm 2: mov  <pos111=%r14,>pos109=%rdi
mov  %r14,%rdi

# qhasm:  uint32323232 f48 ^= *(int128 *) (pos48 + 48 + matrix)
# asm 1: pxor 48(<pos48=int64#5,<matrix=int64#4,1),<f48=int6464#10
# asm 2: pxor 48(<pos48=%r8,<matrix=%rcx,1),<f48=%xmm9
pxor 48(%r8,%rcx,1),%xmm9

# qhasm:  (uint64) pos109 >>= 34
# asm 1: shr  $34,<pos109=int64#1
# asm 2: shr  $34,<pos109=%rdi
shr  $34,%rdi

# qhasm:  f112 = f48
# asm 1: movdqa <f48=int6464#10,>f112=int6464#1
# asm 2: movdqa <f48=%xmm9,>f112=%xmm0
movdqa %xmm9,%xmm0

# qhasm:  uint32323232 f49 ^= *(int128 *) (pos48 + 32 + matrix)
# asm 1: pxor 32(<pos48=int64#5,<matrix=int64#4,1),<f49=int6464#7
# asm 2: pxor 32(<pos48=%r8,<matrix=%rcx,1),<f49=%xmm6
pxor 32(%r8,%rcx,1),%xmm6

# qhasm:  (uint32) pos109 &= mask
# asm 1: andl <mask=int64#8d,<pos109=int64#1d
# asm 2: andl <mask=%r10d,<pos109=%edi
andl %r10d,%edi

# qhasm:  f47 >>= 80
# asm 1: psrldq $10,<f47=int6464#8
# asm 2: psrldq $10,<f47=%xmm7
psrldq $10,%xmm7

# qhasm:  uint32323232 f50 ^= *(int128 *) (pos48 + 16 + matrix)
# asm 1: pxor 16(<pos48=int64#5,<matrix=int64#4,1),<f50=int6464#9
# asm 2: pxor 16(<pos48=%r8,<matrix=%rcx,1),<f50=%xmm8
pxor 16(%r8,%rcx,1),%xmm8

# qhasm:  assign 1 to pos109

# qhasm:  f112 <<= 48
# asm 1: pslldq $6,<f112=int6464#1
# asm 2: pslldq $6,<f112=%xmm0
pslldq $6,%xmm0

# qhasm:  f110 ^= f47
# asm 1: pxor  <f47=int6464#8,<f110=int6464#3
# asm 2: pxor  <f47=%xmm7,<f110=%xmm2
pxor  %xmm7,%xmm2

# qhasm:  uint32323232 f108 ^= *(int128 *) (pos108 + 48 + matrix)
# asm 1: pxor 48(<pos108=int64#7,<matrix=int64#4,1),<f108=int6464#2
# asm 2: pxor 48(<pos108=%rax,<matrix=%rcx,1),<f108=%xmm1
pxor 48(%rax,%rcx,1),%xmm1

# qhasm:  v = f108
# asm 1: movdqa <f108=int6464#2,>v=int6464#6
# asm 2: movdqa <f108=%xmm1,>v=%xmm5
movdqa %xmm1,%xmm5

# qhasm:  uint6464 f108 <<= 3
# asm 1: psllq $3,<f108=int6464#2
# asm 2: psllq $3,<f108=%xmm1
psllq $3,%xmm1

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f109 ^= *(int128 *) (pos108 + 32 + matrix)
# asm 1: pxor 32(<pos108=int64#7,<matrix=int64#4,1),<f109=int6464#4
# asm 2: pxor 32(<pos108=%rax,<matrix=%rcx,1),<f109=%xmm3
pxor 32(%rax,%rcx,1),%xmm3

# qhasm:  f112 ^= f108
# asm 1: pxor  <f108=int6464#2,<f112=int6464#1
# asm 2: pxor  <f108=%xmm1,<f112=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#2
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm1
pshufd $0x45,%xmm5,%xmm1

# qhasm:  uint32323232 f110 ^= *(int128 *) (pos108 + 16 + matrix)
# asm 1: pxor 16(<pos108=int64#7,<matrix=int64#4,1),<f110=int6464#3
# asm 2: pxor 16(<pos108=%rax,<matrix=%rcx,1),<f110=%xmm2
pxor 16(%rax,%rcx,1),%xmm2

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f112 ^= w
# asm 1: pxor  <w=int6464#2,<f112=int6464#1
# asm 2: pxor  <w=%xmm1,<f112=%xmm0
pxor  %xmm1,%xmm0

# qhasm:  uint32323232 f111 ^= *(int128 *) (pos108 + 0 + matrix)
# asm 1: pxor 0(<pos108=int64#7,<matrix=int64#4,1),<f111=int6464#5
# asm 2: pxor 0(<pos108=%rax,<matrix=%rcx,1),<f111=%xmm4
pxor 0(%rax,%rcx,1),%xmm4

# qhasm:  f111 ^= v
# asm 1: pxor  <v=int6464#6,<f111=int6464#5
# asm 2: pxor  <v=%xmm5,<f111=%xmm4
pxor  %xmm5,%xmm4

# qhasm:  pos110 = pos111
# asm 1: mov  <pos111=int64#12,>pos110=int64#15
# asm 2: mov  <pos111=%r14,>pos110=%rbp
mov  %r14,%rbp

# qhasm:  uint32323232 f49 ^= *(int128 *) (pos49 + 48 + matrix)
# asm 1: pxor 48(<pos49=int64#6,<matrix=int64#4,1),<f49=int6464#7
# asm 2: pxor 48(<pos49=%r9,<matrix=%rcx,1),<f49=%xmm6
pxor 48(%r9,%rcx,1),%xmm6

# qhasm:  (uint64) pos110 >>= 42
# asm 1: shr  $42,<pos110=int64#15
# asm 2: shr  $42,<pos110=%rbp
shr  $42,%rbp

# qhasm:  f113 = f49
# asm 1: movdqa <f49=int6464#7,>f113=int6464#2
# asm 2: movdqa <f49=%xmm6,>f113=%xmm1
movdqa %xmm6,%xmm1

# qhasm:  uint32323232 f50 ^= *(int128 *) (pos49 + 32 + matrix)
# asm 1: pxor 32(<pos49=int64#6,<matrix=int64#4,1),<f50=int6464#9
# asm 2: pxor 32(<pos49=%r9,<matrix=%rcx,1),<f50=%xmm8
pxor 32(%r9,%rcx,1),%xmm8

# qhasm:  (uint32) pos110 &= mask
# asm 1: andl <mask=int64#8d,<pos110=int64#15d
# asm 2: andl <mask=%r10d,<pos110=%ebp
andl %r10d,%ebp

# qhasm:  f48 >>= 80
# asm 1: psrldq $10,<f48=int6464#10
# asm 2: psrldq $10,<f48=%xmm9
psrldq $10,%xmm9

# qhasm:  assign 15 to pos110

# qhasm:  f113 <<= 48
# asm 1: pslldq $6,<f113=int6464#2
# asm 2: pslldq $6,<f113=%xmm1
pslldq $6,%xmm1

# qhasm:  f111 ^= f48
# asm 1: pxor  <f48=int6464#10,<f111=int6464#5
# asm 2: pxor  <f48=%xmm9,<f111=%xmm4
pxor  %xmm9,%xmm4

# qhasm:  uint32323232 f109 ^= *(int128 *) (pos109 + 48 + matrix)
# asm 1: pxor 48(<pos109=int64#1,<matrix=int64#4,1),<f109=int6464#4
# asm 2: pxor 48(<pos109=%rdi,<matrix=%rcx,1),<f109=%xmm3
pxor 48(%rdi,%rcx,1),%xmm3

# qhasm:  v = f109
# asm 1: movdqa <f109=int6464#4,>v=int6464#6
# asm 2: movdqa <f109=%xmm3,>v=%xmm5
movdqa %xmm3,%xmm5

# qhasm:  uint6464 f109 <<= 3
# asm 1: psllq $3,<f109=int6464#4
# asm 2: psllq $3,<f109=%xmm3
psllq $3,%xmm3

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f110 ^= *(int128 *) (pos109 + 32 + matrix)
# asm 1: pxor 32(<pos109=int64#1,<matrix=int64#4,1),<f110=int6464#3
# asm 2: pxor 32(<pos109=%rdi,<matrix=%rcx,1),<f110=%xmm2
pxor 32(%rdi,%rcx,1),%xmm2

# qhasm:  f113 ^= f109
# asm 1: pxor  <f109=int6464#4,<f113=int6464#2
# asm 2: pxor  <f109=%xmm3,<f113=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#4
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm3
pshufd $0x45,%xmm5,%xmm3

# qhasm:  uint32323232 f111 ^= *(int128 *) (pos109 + 16 + matrix)
# asm 1: pxor 16(<pos109=int64#1,<matrix=int64#4,1),<f111=int6464#5
# asm 2: pxor 16(<pos109=%rdi,<matrix=%rcx,1),<f111=%xmm4
pxor 16(%rdi,%rcx,1),%xmm4

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f113 ^= w
# asm 1: pxor  <w=int6464#4,<f113=int6464#2
# asm 2: pxor  <w=%xmm3,<f113=%xmm1
pxor  %xmm3,%xmm1

# qhasm:  uint32323232 f112 ^= *(int128 *) (pos109 + 0 + matrix)
# asm 1: pxor 0(<pos109=int64#1,<matrix=int64#4,1),<f112=int6464#1
# asm 2: pxor 0(<pos109=%rdi,<matrix=%rcx,1),<f112=%xmm0
pxor 0(%rdi,%rcx,1),%xmm0

# qhasm:  f112 ^= v
# asm 1: pxor  <v=int6464#6,<f112=int6464#1
# asm 2: pxor  <v=%xmm5,<f112=%xmm0
pxor  %xmm5,%xmm0

# qhasm:  uint32323232 f50 ^= *(int128 *) (pos50 + 48 + matrix)
# asm 1: pxor 48(<pos50=int64#9,<matrix=int64#4,1),<f50=int6464#9
# asm 2: pxor 48(<pos50=%r11,<matrix=%rcx,1),<f50=%xmm8
pxor 48(%r11,%rcx,1),%xmm8

# qhasm:  (uint64) pos111 >>= 50
# asm 1: shr  $50,<pos111=int64#12
# asm 2: shr  $50,<pos111=%r14
shr  $50,%r14

# qhasm:  f114 = f50
# asm 1: movdqa <f50=int6464#9,>f114=int6464#4
# asm 2: movdqa <f50=%xmm8,>f114=%xmm3
movdqa %xmm8,%xmm3

# qhasm:  (uint32) pos111 &= mask
# asm 1: andl <mask=int64#8d,<pos111=int64#12d
# asm 2: andl <mask=%r10d,<pos111=%r14d
andl %r10d,%r14d

# qhasm:  f49 >>= 80
# asm 1: psrldq $10,<f49=int6464#7
# asm 2: psrldq $10,<f49=%xmm6
psrldq $10,%xmm6

# qhasm:  assign 14 to pos111

# qhasm:  f114 <<= 48
# asm 1: pslldq $6,<f114=int6464#4
# asm 2: pslldq $6,<f114=%xmm3
pslldq $6,%xmm3

# qhasm:  f112 ^= f49
# asm 1: pxor  <f49=int6464#7,<f112=int6464#1
# asm 2: pxor  <f49=%xmm6,<f112=%xmm0
pxor  %xmm6,%xmm0

# qhasm:  uint32323232 f110 ^= *(int128 *) (pos110 + 48 + matrix)
# asm 1: pxor 48(<pos110=int64#15,<matrix=int64#4,1),<f110=int6464#3
# asm 2: pxor 48(<pos110=%rbp,<matrix=%rcx,1),<f110=%xmm2
pxor 48(%rbp,%rcx,1),%xmm2

# qhasm:  v = f110
# asm 1: movdqa <f110=int6464#3,>v=int6464#6
# asm 2: movdqa <f110=%xmm2,>v=%xmm5
movdqa %xmm2,%xmm5

# qhasm:  uint6464 f110 <<= 3
# asm 1: psllq $3,<f110=int6464#3
# asm 2: psllq $3,<f110=%xmm2
psllq $3,%xmm2

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#6
# asm 2: psrlq $61,<v=%xmm5
psrlq $61,%xmm5

# qhasm:  uint32323232 f111 ^= *(int128 *) (pos110 + 32 + matrix)
# asm 1: pxor 32(<pos110=int64#15,<matrix=int64#4,1),<f111=int6464#5
# asm 2: pxor 32(<pos110=%rbp,<matrix=%rcx,1),<f111=%xmm4
pxor 32(%rbp,%rcx,1),%xmm4

# qhasm:  f114 ^= f110
# asm 1: pxor  <f110=int6464#3,<f114=int6464#4
# asm 2: pxor  <f110=%xmm2,<f114=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  w[0,1,2,3] = v[1,1,0,1]
# asm 1: pshufd $0x45,<v=int6464#6,>w=int6464#3
# asm 2: pshufd $0x45,<v=%xmm5,>w=%xmm2
pshufd $0x45,%xmm5,%xmm2

# qhasm:  uint32323232 f112 ^= *(int128 *) (pos110 + 16 + matrix)
# asm 1: pxor 16(<pos110=int64#15,<matrix=int64#4,1),<f112=int6464#1
# asm 2: pxor 16(<pos110=%rbp,<matrix=%rcx,1),<f112=%xmm0
pxor 16(%rbp,%rcx,1),%xmm0

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#6
# asm 2: psrldq $8,<v=%xmm5
psrldq $8,%xmm5

# qhasm:  f114 ^= w
# asm 1: pxor  <w=int6464#3,<f114=int6464#4
# asm 2: pxor  <w=%xmm2,<f114=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  uint32323232 f113 ^= *(int128 *) (pos110 + 0 + matrix)
# asm 1: pxor 0(<pos110=int64#15,<matrix=int64#4,1),<f113=int6464#2
# asm 2: pxor 0(<pos110=%rbp,<matrix=%rcx,1),<f113=%xmm1
pxor 0(%rbp,%rcx,1),%xmm1

# qhasm:  f113 ^= v
# asm 1: pxor  <v=int6464#6,<f113=int6464#2
# asm 2: pxor  <v=%xmm5,<f113=%xmm1
pxor  %xmm5,%xmm1

# qhasm:  f50 >>= 80
# asm 1: psrldq $10,<f50=int6464#9
# asm 2: psrldq $10,<f50=%xmm8
psrldq $10,%xmm8

# qhasm:  f113 ^= f50
# asm 1: pxor  <f50=int6464#9,<f113=int6464#2
# asm 2: pxor  <f50=%xmm8,<f113=%xmm1
pxor  %xmm8,%xmm1

# qhasm:  uint32323232 f111 ^= *(int128 *) (pos111 + 48 + matrix)
# asm 1: pxor 48(<pos111=int64#12,<matrix=int64#4,1),<f111=int6464#5
# asm 2: pxor 48(<pos111=%r14,<matrix=%rcx,1),<f111=%xmm4
pxor 48(%r14,%rcx,1),%xmm4

# qhasm:  v = f111
# asm 1: movdqa <f111=int6464#5,>v=int6464#3
# asm 2: movdqa <f111=%xmm4,>v=%xmm2
movdqa %xmm4,%xmm2

# qhasm:  f111 &= crypto_hashblocks_rfsb509_core2_MASK125
# asm 1: pand  crypto_hashblocks_rfsb509_core2_MASK125,<f111=int6464#5
# asm 2: pand  crypto_hashblocks_rfsb509_core2_MASK125,<f111=%xmm4
pand  crypto_hashblocks_rfsb509_core2_MASK125,%xmm4

# qhasm:  pos55 = f111
# asm 1: movd   <f111=int6464#5,>pos55=int64#14
# asm 2: movd   <f111=%xmm4,>pos55=%rbx
movd   %xmm4,%rbx

# qhasm:  uint32323232 f112 ^= *(int128 *) (pos111 + 32 + matrix)
# asm 1: pxor 32(<pos111=int64#12,<matrix=int64#4,1),<f112=int6464#1
# asm 2: pxor 32(<pos111=%r14,<matrix=%rcx,1),<f112=%xmm0
pxor 32(%r14,%rcx,1),%xmm0

# qhasm:  uint6464 v >>= 61
# asm 1: psrlq $61,<v=int6464#3
# asm 2: psrlq $61,<v=%xmm2
psrlq $61,%xmm2

# qhasm:  uint32323232 f113 ^= *(int128 *) (pos111 + 16 + matrix)
# asm 1: pxor 16(<pos111=int64#12,<matrix=int64#4,1),<f113=int6464#2
# asm 2: pxor 16(<pos111=%r14,<matrix=%rcx,1),<f113=%xmm1
pxor 16(%r14,%rcx,1),%xmm1

# qhasm:  v >>= 64
# asm 1: psrldq $8,<v=int6464#3
# asm 2: psrldq $8,<v=%xmm2
psrldq $8,%xmm2

# qhasm:  uint32323232 f114 ^= *(int128 *) (pos111 + 0 + matrix)
# asm 1: pxor 0(<pos111=int64#12,<matrix=int64#4,1),<f114=int6464#4
# asm 2: pxor 0(<pos111=%r14,<matrix=%rcx,1),<f114=%xmm3
pxor 0(%r14,%rcx,1),%xmm3

# qhasm:  f114 ^= v
# asm 1: pxor  <v=int6464#3,<f114=int6464#4
# asm 2: pxor  <v=%xmm2,<f114=%xmm3
pxor  %xmm2,%xmm3

# qhasm:  state3 = f111
# asm 1: movdqa <f111=int6464#5,>state3=stack128#4
# asm 2: movdqa <f111=%xmm4,>state3=48(%rsp)
movdqa %xmm4,48(%rsp)

# qhasm:  state2 = f112
# asm 1: movdqa <f112=int6464#1,>state2=stack128#3
# asm 2: movdqa <f112=%xmm0,>state2=32(%rsp)
movdqa %xmm0,32(%rsp)

# qhasm:  state1 = f113
# asm 1: movdqa <f113=int6464#2,>state1=stack128#2
# asm 2: movdqa <f113=%xmm1,>state1=16(%rsp)
movdqa %xmm1,16(%rsp)

# qhasm:  state0 = f114
# asm 1: movdqa <f114=int6464#4,>state0=stack128#1
# asm 2: movdqa <f114=%xmm3,>state0=0(%rsp)
movdqa %xmm3,0(%rsp)

# qhasm:  bp += 48
# asm 1: add  $48,<bp=int64#2
# asm 2: add  $48,<bp=%rsi
add  $48,%rsi

# qhasm:                    unsigned<? blen -= 48
# asm 1: sub  $48,<blen=int64#3
# asm 2: sub  $48,<blen=%rdx
sub  $48,%rdx
# comment:fp stack unchanged by jump

# qhasm:  goto mainloop if !unsigned<
jae ._mainloop
# comment:fp stack unchanged by fallthrough

# qhasm:  done:
._done:

# qhasm:  rp = rp_stack
# asm 1: movq <rp_stack=stack64#8,>rp=int64#1
# asm 2: movq <rp_stack=120(%rsp),>rp=%rdi
movq 120(%rsp),%rdi

# qhasm:  v = state0
# asm 1: movdqa <state0=stack128#1,>v=int6464#1
# asm 2: movdqa <state0=0(%rsp),>v=%xmm0
movdqa 0(%rsp),%xmm0

# qhasm:  *(unaligned int128 *) (rp + 0) = v
# asm 1: movdqu <v=int6464#1,0(<rp=int64#1)
# asm 2: movdqu <v=%xmm0,0(<rp=%rdi)
movdqu %xmm0,0(%rdi)

# qhasm:  v = state1
# asm 1: movdqa <state1=stack128#2,>v=int6464#1
# asm 2: movdqa <state1=16(%rsp),>v=%xmm0
movdqa 16(%rsp),%xmm0

# qhasm:  *(unaligned int128 *) (rp + 16) = v
# asm 1: movdqu <v=int6464#1,16(<rp=int64#1)
# asm 2: movdqu <v=%xmm0,16(<rp=%rdi)
movdqu %xmm0,16(%rdi)

# qhasm:  v = state2
# asm 1: movdqa <state2=stack128#3,>v=int6464#1
# asm 2: movdqa <state2=32(%rsp),>v=%xmm0
movdqa 32(%rsp),%xmm0

# qhasm:  *(unaligned int128 *) (rp + 32) = v
# asm 1: movdqu <v=int6464#1,32(<rp=int64#1)
# asm 2: movdqu <v=%xmm0,32(<rp=%rdi)
movdqu %xmm0,32(%rdi)

# qhasm:  v = state3
# asm 1: movdqa <state3=stack128#4,>v=int6464#1
# asm 2: movdqa <state3=48(%rsp),>v=%xmm0
movdqa 48(%rsp),%xmm0

# qhasm:  *(unaligned int128 *) (rp + 48) = v
# asm 1: movdqu <v=int6464#1,48(<rp=int64#1)
# asm 2: movdqu <v=%xmm0,48(<rp=%rdi)
movdqu %xmm0,48(%rdi)

# qhasm:  c1 = c1_stack
# asm 1: movq <c1_stack=stack64#1,>c1=int64#9
# asm 2: movq <c1_stack=64(%rsp),>c1=%r11
movq 64(%rsp),%r11

# qhasm:  c2 = c2_stack
# asm 1: movq <c2_stack=stack64#2,>c2=int64#10
# asm 2: movq <c2_stack=72(%rsp),>c2=%r12
movq 72(%rsp),%r12

# qhasm:  c3 = c3_stack
# asm 1: movq <c3_stack=stack64#3,>c3=int64#11
# asm 2: movq <c3_stack=80(%rsp),>c3=%r13
movq 80(%rsp),%r13

# qhasm:  c4 = c4_stack
# asm 1: movq <c4_stack=stack64#4,>c4=int64#12
# asm 2: movq <c4_stack=88(%rsp),>c4=%r14
movq 88(%rsp),%r14

# qhasm:  c5 = c5_stack
# asm 1: movq <c5_stack=stack64#5,>c5=int64#13
# asm 2: movq <c5_stack=96(%rsp),>c5=%r15
movq 96(%rsp),%r15

# qhasm:  c6 = c6_stack
# asm 1: movq <c6_stack=stack64#6,>c6=int64#14
# asm 2: movq <c6_stack=104(%rsp),>c6=%rbx
movq 104(%rsp),%rbx

# qhasm:  c7 = c7_stack
# asm 1: movq <c7_stack=stack64#7,>c7=int64#15
# asm 2: movq <c7_stack=112(%rsp),>c7=%rbp
movq 112(%rsp),%rbp

# qhasm:  int64 result

# qhasm:  result = blen + 48
# asm 1: lea  48(<blen=int64#3),>result=int64#7
# asm 2: lea  48(<blen=%rdx),>result=%rax
lea  48(%rdx),%rax

# qhasm:  assign outputreg 0 to result

# qhasm:  leave
add %r11,%rsp
ret
