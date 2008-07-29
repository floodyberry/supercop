
# qhasm: stack32 arg1

# qhasm: stack32 arg2

# qhasm: stack32 arg3

# qhasm: stack32 arg4

# qhasm: stack32 arg5

# qhasm: input arg1

# qhasm: input arg2

# qhasm: input arg3

# qhasm: input arg4

# qhasm: input arg5

# qhasm: int32 eax

# qhasm: int32 ebx

# qhasm: int32 esi

# qhasm: int32 edi

# qhasm: int32 ebp

# qhasm: caller eax

# qhasm: caller ebx

# qhasm: caller esi

# qhasm: caller edi

# qhasm: caller ebp

# qhasm: stack32 eax_stack

# qhasm: stack32 ebx_stack

# qhasm: stack32 esi_stack

# qhasm: stack32 edi_stack

# qhasm: stack32 ebp_stack

# qhasm: int32 c

# qhasm: int32 k

# qhasm: int32 iv

# qhasm: int32 x0

# qhasm: int32 x1

# qhasm: int32 x2

# qhasm: int32 x3

# qhasm: int32 e

# qhasm: int32 q0

# qhasm: int32 q1

# qhasm: int32 q2

# qhasm: int32 q3

# qhasm: int32 in

# qhasm: int32 out

# qhasm: int32 len

# qhasm: int3232 c_stack

# qhasm: int3232 in_stack

# qhasm: int3232 out_stack

# qhasm: int3232 len_stack

# qhasm: int3232 y1_stack

# qhasm: int3232 y2_stack

# qhasm: int3232 y3_stack

# qhasm: int3232 z1_stack

# qhasm: int3232 z2_stack

# qhasm: int3232 z3_stack

# qhasm: stack32 n0

# qhasm: stack32 n1

# qhasm: stack32 n2

# qhasm: stack32 n3

# qhasm: stack32 r0

# qhasm: stack32 r1

# qhasm: stack32 r2

# qhasm: stack32 r3

# qhasm: stack32 r4

# qhasm: stack32 r5

# qhasm: stack32 r6

# qhasm: stack32 r7

# qhasm: stack32 r8

# qhasm: stack32 r9

# qhasm: stack32 r10

# qhasm: stack32 r11

# qhasm: stack32 r12

# qhasm: stack32 r13

# qhasm: stack32 r14

# qhasm: stack32 r15

# qhasm: stack32 r16

# qhasm: stack32 r17

# qhasm: stack32 r18

# qhasm: stack32 r19

# qhasm: stack32 r20

# qhasm: stack32 r21

# qhasm: stack32 r22

# qhasm: stack32 r23

# qhasm: stack32 r24

# qhasm: stack32 r25

# qhasm: stack32 r26

# qhasm: stack32 r27

# qhasm: stack32 r28

# qhasm: stack32 r29

# qhasm: stack32 r30

# qhasm: stack32 r31

# qhasm: stack32 r32

# qhasm: stack32 r33

# qhasm: stack32 r34

# qhasm: stack32 r35

# qhasm: stack32 r36

# qhasm: stack32 r37

# qhasm: stack32 r38

# qhasm: stack32 r39

# qhasm: stack32 r40

# qhasm: stack32 r41

# qhasm: stack32 r42

# qhasm: stack32 r43

# qhasm: int32 y0

# qhasm: int32 y1

# qhasm: int32 y2

# qhasm: int32 y3

# qhasm: int32 z0

# qhasm: int32 z1

# qhasm: int32 z2

# qhasm: int32 z3

# qhasm: int32 p00

# qhasm: int32 p01

# qhasm: int32 p02

# qhasm: int32 p03

# qhasm: int32 p10

# qhasm: int32 p11

# qhasm: int32 p12

# qhasm: int32 p13

# qhasm: int32 p20

# qhasm: int32 p21

# qhasm: int32 p22

# qhasm: int32 p23

# qhasm: int32 p30

# qhasm: int32 p31

# qhasm: int32 p32

# qhasm: int32 p33

# qhasm: int32 b0

# qhasm: int32 b1

# qhasm: int32 b2

# qhasm: int32 b3

# qhasm: enter ECRYPT_init
.text
.p2align 5
.globl _ECRYPT_init
.globl ECRYPT_init
_ECRYPT_init:
ECRYPT_init:
mov %esp,%eax
and $31,%eax
add $224,%eax
sub %eax,%esp

# qhasm: leave
add %eax,%esp
ret

# qhasm: enter ECRYPT_ivsetup
.text
.p2align 5
.globl _ECRYPT_ivsetup
.globl ECRYPT_ivsetup
_ECRYPT_ivsetup:
ECRYPT_ivsetup:
mov %esp,%eax
and $31,%eax
add $224,%eax
sub %eax,%esp

# qhasm: eax_stack = eax
# asm 1: movl <eax=int32#1,>eax_stack=stack32#1
# asm 2: movl <eax=%eax,>eax_stack=0(%esp)
movl %eax,0(%esp)

# qhasm: ebx_stack = ebx
# asm 1: movl <ebx=int32#4,>ebx_stack=stack32#2
# asm 2: movl <ebx=%ebx,>ebx_stack=4(%esp)
movl %ebx,4(%esp)

# qhasm: esi_stack = esi
# asm 1: movl <esi=int32#5,>esi_stack=stack32#3
# asm 2: movl <esi=%esi,>esi_stack=8(%esp)
movl %esi,8(%esp)

# qhasm: edi_stack = edi
# asm 1: movl <edi=int32#6,>edi_stack=stack32#4
# asm 2: movl <edi=%edi,>edi_stack=12(%esp)
movl %edi,12(%esp)

# qhasm: ebp_stack = ebp
# asm 1: movl <ebp=int32#7,>ebp_stack=stack32#5
# asm 2: movl <ebp=%ebp,>ebp_stack=16(%esp)
movl %ebp,16(%esp)

# qhasm: c = arg1
# asm 1: movl <arg1=stack32#-1,>c=int32#2
# asm 2: movl <arg1=4(%esp,%eax),>c=%ecx
movl 4(%esp,%eax),%ecx

# qhasm: iv = arg2
# asm 1: movl <arg2=stack32#-2,>iv=int32#1
# asm 2: movl <arg2=8(%esp,%eax),>iv=%eax
movl 8(%esp,%eax),%eax

# qhasm: x0 = *(uint32 *) (iv + 0)
# asm 1: movl 0(<iv=int32#1),>x0=int32#3
# asm 2: movl 0(<iv=%eax),>x0=%edx
movl 0(%eax),%edx

# qhasm: x1 = *(uint32 *) (iv + 4)
# asm 1: movl 4(<iv=int32#1),>x1=int32#4
# asm 2: movl 4(<iv=%eax),>x1=%ebx
movl 4(%eax),%ebx

# qhasm: x2 = *(uint32 *) (iv + 8)
# asm 1: movl 8(<iv=int32#1),>x2=int32#5
# asm 2: movl 8(<iv=%eax),>x2=%esi
movl 8(%eax),%esi

# qhasm: x3 = *(uint32 *) (iv + 12)
# asm 1: movl 12(<iv=int32#1),>x3=int32#1
# asm 2: movl 12(<iv=%eax),>x3=%eax
movl 12(%eax),%eax

# qhasm: *(uint32 *) (c + 56) = x0
# asm 1: movl <x0=int32#3,56(<c=int32#2)
# asm 2: movl <x0=%edx,56(<c=%ecx)
movl %edx,56(%ecx)

# qhasm: *(uint32 *) (c + 60) = x1
# asm 1: movl <x1=int32#4,60(<c=int32#2)
# asm 2: movl <x1=%ebx,60(<c=%ecx)
movl %ebx,60(%ecx)

# qhasm: *(uint32 *) (c + 64) = x2
# asm 1: movl <x2=int32#5,64(<c=int32#2)
# asm 2: movl <x2=%esi,64(<c=%ecx)
movl %esi,64(%ecx)

# qhasm: *(uint32 *) (c + 68) = x3
# asm 1: movl <x3=int32#1,68(<c=int32#2)
# asm 2: movl <x3=%eax,68(<c=%ecx)
movl %eax,68(%ecx)

# qhasm: eax = eax_stack
# asm 1: movl <eax_stack=stack32#1,>eax=int32#1
# asm 2: movl <eax_stack=0(%esp),>eax=%eax
movl 0(%esp),%eax

# qhasm: ebx = ebx_stack
# asm 1: movl <ebx_stack=stack32#2,>ebx=int32#4
# asm 2: movl <ebx_stack=4(%esp),>ebx=%ebx
movl 4(%esp),%ebx

# qhasm: esi = esi_stack
# asm 1: movl <esi_stack=stack32#3,>esi=int32#5
# asm 2: movl <esi_stack=8(%esp),>esi=%esi
movl 8(%esp),%esi

# qhasm: edi = edi_stack
# asm 1: movl <edi_stack=stack32#4,>edi=int32#6
# asm 2: movl <edi_stack=12(%esp),>edi=%edi
movl 12(%esp),%edi

# qhasm: ebp = ebp_stack
# asm 1: movl <ebp_stack=stack32#5,>ebp=int32#7
# asm 2: movl <ebp_stack=16(%esp),>ebp=%ebp
movl 16(%esp),%ebp

# qhasm: leave
add %eax,%esp
ret

# qhasm: enter ECRYPT_keysetup
.text
.p2align 5
.globl _ECRYPT_keysetup
.globl ECRYPT_keysetup
_ECRYPT_keysetup:
ECRYPT_keysetup:
mov %esp,%eax
and $31,%eax
add $224,%eax
sub %eax,%esp

# qhasm: eax_stack = eax
# asm 1: movl <eax=int32#1,>eax_stack=stack32#1
# asm 2: movl <eax=%eax,>eax_stack=0(%esp)
movl %eax,0(%esp)

# qhasm: ebx_stack = ebx
# asm 1: movl <ebx=int32#4,>ebx_stack=stack32#2
# asm 2: movl <ebx=%ebx,>ebx_stack=4(%esp)
movl %ebx,4(%esp)

# qhasm: esi_stack = esi
# asm 1: movl <esi=int32#5,>esi_stack=stack32#3
# asm 2: movl <esi=%esi,>esi_stack=8(%esp)
movl %esi,8(%esp)

# qhasm: edi_stack = edi
# asm 1: movl <edi=int32#6,>edi_stack=stack32#4
# asm 2: movl <edi=%edi,>edi_stack=12(%esp)
movl %edi,12(%esp)

# qhasm: ebp_stack = ebp
# asm 1: movl <ebp=int32#7,>ebp_stack=stack32#5
# asm 2: movl <ebp=%ebp,>ebp_stack=16(%esp)
movl %ebp,16(%esp)

# qhasm: c = arg1
# asm 1: movl <arg1=stack32#-1,>c=int32#2
# asm 2: movl <arg1=4(%esp,%eax),>c=%ecx
movl 4(%esp,%eax),%ecx

# qhasm: k = arg2
# asm 1: movl <arg2=stack32#-2,>k=int32#1
# asm 2: movl <arg2=8(%esp,%eax),>k=%eax
movl 8(%esp,%eax),%eax

# qhasm: x0 = *(uint32 *) (k + 0)
# asm 1: movl 0(<k=int32#1),>x0=int32#3
# asm 2: movl 0(<k=%eax),>x0=%edx
movl 0(%eax),%edx

# qhasm: x1 = *(uint32 *) (k + 4)
# asm 1: movl 4(<k=int32#1),>x1=int32#4
# asm 2: movl 4(<k=%eax),>x1=%ebx
movl 4(%eax),%ebx

# qhasm: x2 = *(uint32 *) (k + 8)
# asm 1: movl 8(<k=int32#1),>x2=int32#5
# asm 2: movl 8(<k=%eax),>x2=%esi
movl 8(%eax),%esi

# qhasm: x3 = *(uint32 *) (k + 12)
# asm 1: movl 12(<k=int32#1),>x3=int32#1
# asm 2: movl 12(<k=%eax),>x3=%eax
movl 12(%eax),%eax

# qhasm: *(uint32 *) (c + 0) = x0
# asm 1: movl <x0=int32#3,0(<c=int32#2)
# asm 2: movl <x0=%edx,0(<c=%ecx)
movl %edx,0(%ecx)

# qhasm: *(uint32 *) (c + 4) = x1
# asm 1: movl <x1=int32#4,4(<c=int32#2)
# asm 2: movl <x1=%ebx,4(<c=%ecx)
movl %ebx,4(%ecx)

# qhasm: *(uint32 *) (c + 8) = x2
# asm 1: movl <x2=int32#5,8(<c=int32#2)
# asm 2: movl <x2=%esi,8(<c=%ecx)
movl %esi,8(%ecx)

# qhasm: *(uint32 *) (c + 12) = x3
# asm 1: movl <x3=int32#1,12(<c=int32#2)
# asm 2: movl <x3=%eax,12(<c=%ecx)
movl %eax,12(%ecx)

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>e=int32#6
# asm 2: movzbl <x3=%ah,>e=%edi
movzbl %ah,%edi

# qhasm: e = *(uint8 *) (&aes_table2 + e * 8)
# asm 1: movzbl aes_table2(,<e=int32#6,8),>e=int32#6
# asm 2: movzbl aes_table2(,<e=%edi,8),>e=%edi
movzbl aes_table2(,%edi,8),%edi

# qhasm: e ^= 0x01
# asm 1: xor  $0x01,<e=int32#6
# asm 2: xor  $0x01,<e=%edi
xor  $0x01,%edi

# qhasm: q3 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q3=int32#7
# asm 2: movzbl <x3=%al,>q3=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q3 = *(uint32 *) (&aes_table1 + q3 * 8)
# asm 1: movl aes_table1(,<q3=int32#7,8),>q3=int32#7
# asm 2: movl aes_table1(,<q3=%ebp,8),>q3=%ebp
movl aes_table1(,%ebp,8),%ebp

# qhasm: q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int32#7
# asm 2: and  $0xff000000,<q3=%ebp
and  $0xff000000,%ebp

# qhasm: e ^= q3
# asm 1: xor  <q3=int32#7,<e=int32#6
# asm 2: xor  <q3=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>q2=int32#7
# asm 2: movzbl <x3=%ah,>q2=%ebp
movzbl %ah,%ebp

# qhasm: q2 = *(uint32 *) (&aes_table0 + q2 * 8)
# asm 1: movl aes_table0(,<q2=int32#7,8),>q2=int32#7
# asm 2: movl aes_table0(,<q2=%ebp,8),>q2=%ebp
movl aes_table0(,%ebp,8),%ebp

# qhasm: q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int32#7
# asm 2: and  $0x00ff0000,<q2=%ebp
and  $0x00ff0000,%ebp

# qhasm: e ^= q2
# asm 1: xor  <q2=int32#7,<e=int32#6
# asm 2: xor  <q2=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q1 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q1=int32#7
# asm 2: movzbl <x3=%al,>q1=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q1 = *(uint16 *) (&aes_tablex + q1 * 8)
# asm 1: movzwl aes_tablex(,<q1=int32#7,8),>q1=int32#7
# asm 2: movzwl aes_tablex(,<q1=%ebp,8),>q1=%ebp
movzwl aes_tablex(,%ebp,8),%ebp

# qhasm: e ^= q1
# asm 1: xor  <q1=int32#7,<e=int32#6
# asm 2: xor  <q1=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xor  <e=int32#6,<x0=int32#3
# asm 2: xor  <e=%edi,<x0=%edx
xor  %edi,%edx

# qhasm: *(uint32 *) (c + 16) = x0
# asm 1: movl <x0=int32#3,16(<c=int32#2)
# asm 2: movl <x0=%edx,16(<c=%ecx)
movl %edx,16(%ecx)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#3,<x1=int32#4
# asm 2: xor  <x0=%edx,<x1=%ebx
xor  %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#4,<x2=int32#5
# asm 2: xor  <x1=%ebx,<x2=%esi
xor  %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#5,<x3=int32#1
# asm 2: xor  <x2=%esi,<x3=%eax
xor  %esi,%eax

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>e=int32#6
# asm 2: movzbl <x3=%ah,>e=%edi
movzbl %ah,%edi

# qhasm: e = *(uint8 *) (&aes_table2 + e * 8)
# asm 1: movzbl aes_table2(,<e=int32#6,8),>e=int32#6
# asm 2: movzbl aes_table2(,<e=%edi,8),>e=%edi
movzbl aes_table2(,%edi,8),%edi

# qhasm: e ^= 0x02
# asm 1: xor  $0x02,<e=int32#6
# asm 2: xor  $0x02,<e=%edi
xor  $0x02,%edi

# qhasm: q3 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q3=int32#7
# asm 2: movzbl <x3=%al,>q3=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q3 = *(uint32 *) (&aes_table1 + q3 * 8)
# asm 1: movl aes_table1(,<q3=int32#7,8),>q3=int32#7
# asm 2: movl aes_table1(,<q3=%ebp,8),>q3=%ebp
movl aes_table1(,%ebp,8),%ebp

# qhasm: q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int32#7
# asm 2: and  $0xff000000,<q3=%ebp
and  $0xff000000,%ebp

# qhasm: e ^= q3
# asm 1: xor  <q3=int32#7,<e=int32#6
# asm 2: xor  <q3=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>q2=int32#7
# asm 2: movzbl <x3=%ah,>q2=%ebp
movzbl %ah,%ebp

# qhasm: q2 = *(uint32 *) (&aes_table0 + q2 * 8)
# asm 1: movl aes_table0(,<q2=int32#7,8),>q2=int32#7
# asm 2: movl aes_table0(,<q2=%ebp,8),>q2=%ebp
movl aes_table0(,%ebp,8),%ebp

# qhasm: q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int32#7
# asm 2: and  $0x00ff0000,<q2=%ebp
and  $0x00ff0000,%ebp

# qhasm: e ^= q2
# asm 1: xor  <q2=int32#7,<e=int32#6
# asm 2: xor  <q2=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q1 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q1=int32#7
# asm 2: movzbl <x3=%al,>q1=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q1 = *(uint16 *) (&aes_tablex + q1 * 8)
# asm 1: movzwl aes_tablex(,<q1=int32#7,8),>q1=int32#7
# asm 2: movzwl aes_tablex(,<q1=%ebp,8),>q1=%ebp
movzwl aes_tablex(,%ebp,8),%ebp

# qhasm: e ^= q1
# asm 1: xor  <q1=int32#7,<e=int32#6
# asm 2: xor  <q1=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xor  <e=int32#6,<x0=int32#3
# asm 2: xor  <e=%edi,<x0=%edx
xor  %edi,%edx

# qhasm: *(uint32 *) (c + 20) = x0
# asm 1: movl <x0=int32#3,20(<c=int32#2)
# asm 2: movl <x0=%edx,20(<c=%ecx)
movl %edx,20(%ecx)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#3,<x1=int32#4
# asm 2: xor  <x0=%edx,<x1=%ebx
xor  %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#4,<x2=int32#5
# asm 2: xor  <x1=%ebx,<x2=%esi
xor  %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#5,<x3=int32#1
# asm 2: xor  <x2=%esi,<x3=%eax
xor  %esi,%eax

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>e=int32#6
# asm 2: movzbl <x3=%ah,>e=%edi
movzbl %ah,%edi

# qhasm: e = *(uint8 *) (&aes_table2 + e * 8)
# asm 1: movzbl aes_table2(,<e=int32#6,8),>e=int32#6
# asm 2: movzbl aes_table2(,<e=%edi,8),>e=%edi
movzbl aes_table2(,%edi,8),%edi

# qhasm: e ^= 0x04
# asm 1: xor  $0x04,<e=int32#6
# asm 2: xor  $0x04,<e=%edi
xor  $0x04,%edi

# qhasm: q3 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q3=int32#7
# asm 2: movzbl <x3=%al,>q3=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q3 = *(uint32 *) (&aes_table1 + q3 * 8)
# asm 1: movl aes_table1(,<q3=int32#7,8),>q3=int32#7
# asm 2: movl aes_table1(,<q3=%ebp,8),>q3=%ebp
movl aes_table1(,%ebp,8),%ebp

# qhasm: q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int32#7
# asm 2: and  $0xff000000,<q3=%ebp
and  $0xff000000,%ebp

# qhasm: e ^= q3
# asm 1: xor  <q3=int32#7,<e=int32#6
# asm 2: xor  <q3=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>q2=int32#7
# asm 2: movzbl <x3=%ah,>q2=%ebp
movzbl %ah,%ebp

# qhasm: q2 = *(uint32 *) (&aes_table0 + q2 * 8)
# asm 1: movl aes_table0(,<q2=int32#7,8),>q2=int32#7
# asm 2: movl aes_table0(,<q2=%ebp,8),>q2=%ebp
movl aes_table0(,%ebp,8),%ebp

# qhasm: q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int32#7
# asm 2: and  $0x00ff0000,<q2=%ebp
and  $0x00ff0000,%ebp

# qhasm: e ^= q2
# asm 1: xor  <q2=int32#7,<e=int32#6
# asm 2: xor  <q2=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q1 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q1=int32#7
# asm 2: movzbl <x3=%al,>q1=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q1 = *(uint16 *) (&aes_tablex + q1 * 8)
# asm 1: movzwl aes_tablex(,<q1=int32#7,8),>q1=int32#7
# asm 2: movzwl aes_tablex(,<q1=%ebp,8),>q1=%ebp
movzwl aes_tablex(,%ebp,8),%ebp

# qhasm: e ^= q1
# asm 1: xor  <q1=int32#7,<e=int32#6
# asm 2: xor  <q1=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xor  <e=int32#6,<x0=int32#3
# asm 2: xor  <e=%edi,<x0=%edx
xor  %edi,%edx

# qhasm: *(uint32 *) (c + 24) = x0
# asm 1: movl <x0=int32#3,24(<c=int32#2)
# asm 2: movl <x0=%edx,24(<c=%ecx)
movl %edx,24(%ecx)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#3,<x1=int32#4
# asm 2: xor  <x0=%edx,<x1=%ebx
xor  %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#4,<x2=int32#5
# asm 2: xor  <x1=%ebx,<x2=%esi
xor  %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#5,<x3=int32#1
# asm 2: xor  <x2=%esi,<x3=%eax
xor  %esi,%eax

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>e=int32#6
# asm 2: movzbl <x3=%ah,>e=%edi
movzbl %ah,%edi

# qhasm: e = *(uint8 *) (&aes_table2 + e * 8)
# asm 1: movzbl aes_table2(,<e=int32#6,8),>e=int32#6
# asm 2: movzbl aes_table2(,<e=%edi,8),>e=%edi
movzbl aes_table2(,%edi,8),%edi

# qhasm: e ^= 0x08
# asm 1: xor  $0x08,<e=int32#6
# asm 2: xor  $0x08,<e=%edi
xor  $0x08,%edi

# qhasm: q3 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q3=int32#7
# asm 2: movzbl <x3=%al,>q3=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q3 = *(uint32 *) (&aes_table1 + q3 * 8)
# asm 1: movl aes_table1(,<q3=int32#7,8),>q3=int32#7
# asm 2: movl aes_table1(,<q3=%ebp,8),>q3=%ebp
movl aes_table1(,%ebp,8),%ebp

# qhasm: q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int32#7
# asm 2: and  $0xff000000,<q3=%ebp
and  $0xff000000,%ebp

# qhasm: e ^= q3
# asm 1: xor  <q3=int32#7,<e=int32#6
# asm 2: xor  <q3=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>q2=int32#7
# asm 2: movzbl <x3=%ah,>q2=%ebp
movzbl %ah,%ebp

# qhasm: q2 = *(uint32 *) (&aes_table0 + q2 * 8)
# asm 1: movl aes_table0(,<q2=int32#7,8),>q2=int32#7
# asm 2: movl aes_table0(,<q2=%ebp,8),>q2=%ebp
movl aes_table0(,%ebp,8),%ebp

# qhasm: q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int32#7
# asm 2: and  $0x00ff0000,<q2=%ebp
and  $0x00ff0000,%ebp

# qhasm: e ^= q2
# asm 1: xor  <q2=int32#7,<e=int32#6
# asm 2: xor  <q2=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q1 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q1=int32#7
# asm 2: movzbl <x3=%al,>q1=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q1 = *(uint16 *) (&aes_tablex + q1 * 8)
# asm 1: movzwl aes_tablex(,<q1=int32#7,8),>q1=int32#7
# asm 2: movzwl aes_tablex(,<q1=%ebp,8),>q1=%ebp
movzwl aes_tablex(,%ebp,8),%ebp

# qhasm: e ^= q1
# asm 1: xor  <q1=int32#7,<e=int32#6
# asm 2: xor  <q1=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xor  <e=int32#6,<x0=int32#3
# asm 2: xor  <e=%edi,<x0=%edx
xor  %edi,%edx

# qhasm: *(uint32 *) (c + 28) = x0
# asm 1: movl <x0=int32#3,28(<c=int32#2)
# asm 2: movl <x0=%edx,28(<c=%ecx)
movl %edx,28(%ecx)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#3,<x1=int32#4
# asm 2: xor  <x0=%edx,<x1=%ebx
xor  %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#4,<x2=int32#5
# asm 2: xor  <x1=%ebx,<x2=%esi
xor  %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#5,<x3=int32#1
# asm 2: xor  <x2=%esi,<x3=%eax
xor  %esi,%eax

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>e=int32#6
# asm 2: movzbl <x3=%ah,>e=%edi
movzbl %ah,%edi

# qhasm: e = *(uint8 *) (&aes_table2 + e * 8)
# asm 1: movzbl aes_table2(,<e=int32#6,8),>e=int32#6
# asm 2: movzbl aes_table2(,<e=%edi,8),>e=%edi
movzbl aes_table2(,%edi,8),%edi

# qhasm: e ^= 0x10
# asm 1: xor  $0x10,<e=int32#6
# asm 2: xor  $0x10,<e=%edi
xor  $0x10,%edi

# qhasm: q3 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q3=int32#7
# asm 2: movzbl <x3=%al,>q3=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q3 = *(uint32 *) (&aes_table1 + q3 * 8)
# asm 1: movl aes_table1(,<q3=int32#7,8),>q3=int32#7
# asm 2: movl aes_table1(,<q3=%ebp,8),>q3=%ebp
movl aes_table1(,%ebp,8),%ebp

# qhasm: q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int32#7
# asm 2: and  $0xff000000,<q3=%ebp
and  $0xff000000,%ebp

# qhasm: e ^= q3
# asm 1: xor  <q3=int32#7,<e=int32#6
# asm 2: xor  <q3=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>q2=int32#7
# asm 2: movzbl <x3=%ah,>q2=%ebp
movzbl %ah,%ebp

# qhasm: q2 = *(uint32 *) (&aes_table0 + q2 * 8)
# asm 1: movl aes_table0(,<q2=int32#7,8),>q2=int32#7
# asm 2: movl aes_table0(,<q2=%ebp,8),>q2=%ebp
movl aes_table0(,%ebp,8),%ebp

# qhasm: q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int32#7
# asm 2: and  $0x00ff0000,<q2=%ebp
and  $0x00ff0000,%ebp

# qhasm: e ^= q2
# asm 1: xor  <q2=int32#7,<e=int32#6
# asm 2: xor  <q2=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q1 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q1=int32#7
# asm 2: movzbl <x3=%al,>q1=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q1 = *(uint16 *) (&aes_tablex + q1 * 8)
# asm 1: movzwl aes_tablex(,<q1=int32#7,8),>q1=int32#7
# asm 2: movzwl aes_tablex(,<q1=%ebp,8),>q1=%ebp
movzwl aes_tablex(,%ebp,8),%ebp

# qhasm: e ^= q1
# asm 1: xor  <q1=int32#7,<e=int32#6
# asm 2: xor  <q1=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xor  <e=int32#6,<x0=int32#3
# asm 2: xor  <e=%edi,<x0=%edx
xor  %edi,%edx

# qhasm: *(uint32 *) (c + 32) = x0
# asm 1: movl <x0=int32#3,32(<c=int32#2)
# asm 2: movl <x0=%edx,32(<c=%ecx)
movl %edx,32(%ecx)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#3,<x1=int32#4
# asm 2: xor  <x0=%edx,<x1=%ebx
xor  %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#4,<x2=int32#5
# asm 2: xor  <x1=%ebx,<x2=%esi
xor  %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#5,<x3=int32#1
# asm 2: xor  <x2=%esi,<x3=%eax
xor  %esi,%eax

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>e=int32#6
# asm 2: movzbl <x3=%ah,>e=%edi
movzbl %ah,%edi

# qhasm: e = *(uint8 *) (&aes_table2 + e * 8)
# asm 1: movzbl aes_table2(,<e=int32#6,8),>e=int32#6
# asm 2: movzbl aes_table2(,<e=%edi,8),>e=%edi
movzbl aes_table2(,%edi,8),%edi

# qhasm: e ^= 0x20
# asm 1: xor  $0x20,<e=int32#6
# asm 2: xor  $0x20,<e=%edi
xor  $0x20,%edi

# qhasm: q3 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q3=int32#7
# asm 2: movzbl <x3=%al,>q3=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q3 = *(uint32 *) (&aes_table1 + q3 * 8)
# asm 1: movl aes_table1(,<q3=int32#7,8),>q3=int32#7
# asm 2: movl aes_table1(,<q3=%ebp,8),>q3=%ebp
movl aes_table1(,%ebp,8),%ebp

# qhasm: q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int32#7
# asm 2: and  $0xff000000,<q3=%ebp
and  $0xff000000,%ebp

# qhasm: e ^= q3
# asm 1: xor  <q3=int32#7,<e=int32#6
# asm 2: xor  <q3=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>q2=int32#7
# asm 2: movzbl <x3=%ah,>q2=%ebp
movzbl %ah,%ebp

# qhasm: q2 = *(uint32 *) (&aes_table0 + q2 * 8)
# asm 1: movl aes_table0(,<q2=int32#7,8),>q2=int32#7
# asm 2: movl aes_table0(,<q2=%ebp,8),>q2=%ebp
movl aes_table0(,%ebp,8),%ebp

# qhasm: q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int32#7
# asm 2: and  $0x00ff0000,<q2=%ebp
and  $0x00ff0000,%ebp

# qhasm: e ^= q2
# asm 1: xor  <q2=int32#7,<e=int32#6
# asm 2: xor  <q2=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q1 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q1=int32#7
# asm 2: movzbl <x3=%al,>q1=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q1 = *(uint16 *) (&aes_tablex + q1 * 8)
# asm 1: movzwl aes_tablex(,<q1=int32#7,8),>q1=int32#7
# asm 2: movzwl aes_tablex(,<q1=%ebp,8),>q1=%ebp
movzwl aes_tablex(,%ebp,8),%ebp

# qhasm: e ^= q1
# asm 1: xor  <q1=int32#7,<e=int32#6
# asm 2: xor  <q1=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xor  <e=int32#6,<x0=int32#3
# asm 2: xor  <e=%edi,<x0=%edx
xor  %edi,%edx

# qhasm: *(uint32 *) (c + 36) = x0
# asm 1: movl <x0=int32#3,36(<c=int32#2)
# asm 2: movl <x0=%edx,36(<c=%ecx)
movl %edx,36(%ecx)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#3,<x1=int32#4
# asm 2: xor  <x0=%edx,<x1=%ebx
xor  %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#4,<x2=int32#5
# asm 2: xor  <x1=%ebx,<x2=%esi
xor  %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#5,<x3=int32#1
# asm 2: xor  <x2=%esi,<x3=%eax
xor  %esi,%eax

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>e=int32#6
# asm 2: movzbl <x3=%ah,>e=%edi
movzbl %ah,%edi

# qhasm: e = *(uint8 *) (&aes_table2 + e * 8)
# asm 1: movzbl aes_table2(,<e=int32#6,8),>e=int32#6
# asm 2: movzbl aes_table2(,<e=%edi,8),>e=%edi
movzbl aes_table2(,%edi,8),%edi

# qhasm: e ^= 0x40
# asm 1: xor  $0x40,<e=int32#6
# asm 2: xor  $0x40,<e=%edi
xor  $0x40,%edi

# qhasm: q3 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q3=int32#7
# asm 2: movzbl <x3=%al,>q3=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q3 = *(uint32 *) (&aes_table1 + q3 * 8)
# asm 1: movl aes_table1(,<q3=int32#7,8),>q3=int32#7
# asm 2: movl aes_table1(,<q3=%ebp,8),>q3=%ebp
movl aes_table1(,%ebp,8),%ebp

# qhasm: q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int32#7
# asm 2: and  $0xff000000,<q3=%ebp
and  $0xff000000,%ebp

# qhasm: e ^= q3
# asm 1: xor  <q3=int32#7,<e=int32#6
# asm 2: xor  <q3=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>q2=int32#7
# asm 2: movzbl <x3=%ah,>q2=%ebp
movzbl %ah,%ebp

# qhasm: q2 = *(uint32 *) (&aes_table0 + q2 * 8)
# asm 1: movl aes_table0(,<q2=int32#7,8),>q2=int32#7
# asm 2: movl aes_table0(,<q2=%ebp,8),>q2=%ebp
movl aes_table0(,%ebp,8),%ebp

# qhasm: q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int32#7
# asm 2: and  $0x00ff0000,<q2=%ebp
and  $0x00ff0000,%ebp

# qhasm: e ^= q2
# asm 1: xor  <q2=int32#7,<e=int32#6
# asm 2: xor  <q2=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q1 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q1=int32#7
# asm 2: movzbl <x3=%al,>q1=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q1 = *(uint16 *) (&aes_tablex + q1 * 8)
# asm 1: movzwl aes_tablex(,<q1=int32#7,8),>q1=int32#7
# asm 2: movzwl aes_tablex(,<q1=%ebp,8),>q1=%ebp
movzwl aes_tablex(,%ebp,8),%ebp

# qhasm: e ^= q1
# asm 1: xor  <q1=int32#7,<e=int32#6
# asm 2: xor  <q1=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xor  <e=int32#6,<x0=int32#3
# asm 2: xor  <e=%edi,<x0=%edx
xor  %edi,%edx

# qhasm: *(uint32 *) (c + 40) = x0
# asm 1: movl <x0=int32#3,40(<c=int32#2)
# asm 2: movl <x0=%edx,40(<c=%ecx)
movl %edx,40(%ecx)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#3,<x1=int32#4
# asm 2: xor  <x0=%edx,<x1=%ebx
xor  %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#4,<x2=int32#5
# asm 2: xor  <x1=%ebx,<x2=%esi
xor  %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#5,<x3=int32#1
# asm 2: xor  <x2=%esi,<x3=%eax
xor  %esi,%eax

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>e=int32#6
# asm 2: movzbl <x3=%ah,>e=%edi
movzbl %ah,%edi

# qhasm: e = *(uint8 *) (&aes_table2 + e * 8)
# asm 1: movzbl aes_table2(,<e=int32#6,8),>e=int32#6
# asm 2: movzbl aes_table2(,<e=%edi,8),>e=%edi
movzbl aes_table2(,%edi,8),%edi

# qhasm: e ^= 0x80
# asm 1: xor  $0x80,<e=int32#6
# asm 2: xor  $0x80,<e=%edi
xor  $0x80,%edi

# qhasm: q3 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q3=int32#7
# asm 2: movzbl <x3=%al,>q3=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q3 = *(uint32 *) (&aes_table1 + q3 * 8)
# asm 1: movl aes_table1(,<q3=int32#7,8),>q3=int32#7
# asm 2: movl aes_table1(,<q3=%ebp,8),>q3=%ebp
movl aes_table1(,%ebp,8),%ebp

# qhasm: q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int32#7
# asm 2: and  $0xff000000,<q3=%ebp
and  $0xff000000,%ebp

# qhasm: e ^= q3
# asm 1: xor  <q3=int32#7,<e=int32#6
# asm 2: xor  <q3=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>q2=int32#7
# asm 2: movzbl <x3=%ah,>q2=%ebp
movzbl %ah,%ebp

# qhasm: q2 = *(uint32 *) (&aes_table0 + q2 * 8)
# asm 1: movl aes_table0(,<q2=int32#7,8),>q2=int32#7
# asm 2: movl aes_table0(,<q2=%ebp,8),>q2=%ebp
movl aes_table0(,%ebp,8),%ebp

# qhasm: q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int32#7
# asm 2: and  $0x00ff0000,<q2=%ebp
and  $0x00ff0000,%ebp

# qhasm: e ^= q2
# asm 1: xor  <q2=int32#7,<e=int32#6
# asm 2: xor  <q2=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q1 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q1=int32#7
# asm 2: movzbl <x3=%al,>q1=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q1 = *(uint16 *) (&aes_tablex + q1 * 8)
# asm 1: movzwl aes_tablex(,<q1=int32#7,8),>q1=int32#7
# asm 2: movzwl aes_tablex(,<q1=%ebp,8),>q1=%ebp
movzwl aes_tablex(,%ebp,8),%ebp

# qhasm: e ^= q1
# asm 1: xor  <q1=int32#7,<e=int32#6
# asm 2: xor  <q1=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xor  <e=int32#6,<x0=int32#3
# asm 2: xor  <e=%edi,<x0=%edx
xor  %edi,%edx

# qhasm: *(uint32 *) (c + 44) = x0
# asm 1: movl <x0=int32#3,44(<c=int32#2)
# asm 2: movl <x0=%edx,44(<c=%ecx)
movl %edx,44(%ecx)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#3,<x1=int32#4
# asm 2: xor  <x0=%edx,<x1=%ebx
xor  %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#4,<x2=int32#5
# asm 2: xor  <x1=%ebx,<x2=%esi
xor  %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#5,<x3=int32#1
# asm 2: xor  <x2=%esi,<x3=%eax
xor  %esi,%eax

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>e=int32#6
# asm 2: movzbl <x3=%ah,>e=%edi
movzbl %ah,%edi

# qhasm: e = *(uint8 *) (&aes_table2 + e * 8)
# asm 1: movzbl aes_table2(,<e=int32#6,8),>e=int32#6
# asm 2: movzbl aes_table2(,<e=%edi,8),>e=%edi
movzbl aes_table2(,%edi,8),%edi

# qhasm: e ^= 0x1b
# asm 1: xor  $0x1b,<e=int32#6
# asm 2: xor  $0x1b,<e=%edi
xor  $0x1b,%edi

# qhasm: q3 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q3=int32#7
# asm 2: movzbl <x3=%al,>q3=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q3 = *(uint32 *) (&aes_table1 + q3 * 8)
# asm 1: movl aes_table1(,<q3=int32#7,8),>q3=int32#7
# asm 2: movl aes_table1(,<q3=%ebp,8),>q3=%ebp
movl aes_table1(,%ebp,8),%ebp

# qhasm: q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int32#7
# asm 2: and  $0xff000000,<q3=%ebp
and  $0xff000000,%ebp

# qhasm: e ^= q3
# asm 1: xor  <q3=int32#7,<e=int32#6
# asm 2: xor  <q3=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>q2=int32#7
# asm 2: movzbl <x3=%ah,>q2=%ebp
movzbl %ah,%ebp

# qhasm: q2 = *(uint32 *) (&aes_table0 + q2 * 8)
# asm 1: movl aes_table0(,<q2=int32#7,8),>q2=int32#7
# asm 2: movl aes_table0(,<q2=%ebp,8),>q2=%ebp
movl aes_table0(,%ebp,8),%ebp

# qhasm: q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int32#7
# asm 2: and  $0x00ff0000,<q2=%ebp
and  $0x00ff0000,%ebp

# qhasm: e ^= q2
# asm 1: xor  <q2=int32#7,<e=int32#6
# asm 2: xor  <q2=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: q1 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q1=int32#7
# asm 2: movzbl <x3=%al,>q1=%ebp
movzbl %al,%ebp

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q1 = *(uint16 *) (&aes_tablex + q1 * 8)
# asm 1: movzwl aes_tablex(,<q1=int32#7,8),>q1=int32#7
# asm 2: movzwl aes_tablex(,<q1=%ebp,8),>q1=%ebp
movzwl aes_tablex(,%ebp,8),%ebp

# qhasm: e ^= q1
# asm 1: xor  <q1=int32#7,<e=int32#6
# asm 2: xor  <q1=%ebp,<e=%edi
xor  %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xor  <e=int32#6,<x0=int32#3
# asm 2: xor  <e=%edi,<x0=%edx
xor  %edi,%edx

# qhasm: *(uint32 *) (c + 48) = x0
# asm 1: movl <x0=int32#3,48(<c=int32#2)
# asm 2: movl <x0=%edx,48(<c=%ecx)
movl %edx,48(%ecx)

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#3,<x1=int32#4
# asm 2: xor  <x0=%edx,<x1=%ebx
xor  %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#4,<x2=int32#5
# asm 2: xor  <x1=%ebx,<x2=%esi
xor  %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#5,<x3=int32#1
# asm 2: xor  <x2=%esi,<x3=%eax
xor  %esi,%eax

# qhasm: e = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>e=int32#4
# asm 2: movzbl <x3=%ah,>e=%ebx
movzbl %ah,%ebx

# qhasm: e = *(uint8 *) (&aes_table2 + e * 8)
# asm 1: movzbl aes_table2(,<e=int32#4,8),>e=int32#4
# asm 2: movzbl aes_table2(,<e=%ebx,8),>e=%ebx
movzbl aes_table2(,%ebx,8),%ebx

# qhasm: e ^= 0x36
# asm 1: xor  $0x36,<e=int32#4
# asm 2: xor  $0x36,<e=%ebx
xor  $0x36,%ebx

# qhasm: q3 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q3=int32#5
# asm 2: movzbl <x3=%al,>q3=%esi
movzbl %al,%esi

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q3 = *(uint32 *) (&aes_table1 + q3 * 8)
# asm 1: movl aes_table1(,<q3=int32#5,8),>q3=int32#5
# asm 2: movl aes_table1(,<q3=%esi,8),>q3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm: q3 &= 0xff000000
# asm 1: and  $0xff000000,<q3=int32#5
# asm 2: and  $0xff000000,<q3=%esi
and  $0xff000000,%esi

# qhasm: e ^= q3
# asm 1: xor  <q3=int32#5,<e=int32#4
# asm 2: xor  <q3=%esi,<e=%ebx
xor  %esi,%ebx

# qhasm: q2 = (x3 >> 8) & 255
# asm 1: movzbl <x3=int32#1%next8,>q2=int32#5
# asm 2: movzbl <x3=%ah,>q2=%esi
movzbl %ah,%esi

# qhasm: q2 = *(uint32 *) (&aes_table0 + q2 * 8)
# asm 1: movl aes_table0(,<q2=int32#5,8),>q2=int32#5
# asm 2: movl aes_table0(,<q2=%esi,8),>q2=%esi
movl aes_table0(,%esi,8),%esi

# qhasm: q2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<q2=int32#5
# asm 2: and  $0x00ff0000,<q2=%esi
and  $0x00ff0000,%esi

# qhasm: e ^= q2
# asm 1: xor  <q2=int32#5,<e=int32#4
# asm 2: xor  <q2=%esi,<e=%ebx
xor  %esi,%ebx

# qhasm: q1 = x3 & 255
# asm 1: movzbl <x3=int32#1%8,>q1=int32#5
# asm 2: movzbl <x3=%al,>q1=%esi
movzbl %al,%esi

# qhasm: x3 <<<= 16
# asm 1: rol  $16,<x3=int32#1
# asm 2: rol  $16,<x3=%eax
rol  $16,%eax

# qhasm: q1 = *(uint16 *) (&aes_tablex + q1 * 8)
# asm 1: movzwl aes_tablex(,<q1=int32#5,8),>q1=int32#1
# asm 2: movzwl aes_tablex(,<q1=%esi,8),>q1=%eax
movzwl aes_tablex(,%esi,8),%eax

# qhasm: e ^= q1
# asm 1: xor  <q1=int32#1,<e=int32#4
# asm 2: xor  <q1=%eax,<e=%ebx
xor  %eax,%ebx

# qhasm: x0 ^= e
# asm 1: xor  <e=int32#4,<x0=int32#3
# asm 2: xor  <e=%ebx,<x0=%edx
xor  %ebx,%edx

# qhasm: *(uint32 *) (c + 52) = x0
# asm 1: movl <x0=int32#3,52(<c=int32#2)
# asm 2: movl <x0=%edx,52(<c=%ecx)
movl %edx,52(%ecx)

# qhasm: eax = eax_stack
# asm 1: movl <eax_stack=stack32#1,>eax=int32#1
# asm 2: movl <eax_stack=0(%esp),>eax=%eax
movl 0(%esp),%eax

# qhasm: ebx = ebx_stack
# asm 1: movl <ebx_stack=stack32#2,>ebx=int32#4
# asm 2: movl <ebx_stack=4(%esp),>ebx=%ebx
movl 4(%esp),%ebx

# qhasm: esi = esi_stack
# asm 1: movl <esi_stack=stack32#3,>esi=int32#5
# asm 2: movl <esi_stack=8(%esp),>esi=%esi
movl 8(%esp),%esi

# qhasm: edi = edi_stack
# asm 1: movl <edi_stack=stack32#4,>edi=int32#6
# asm 2: movl <edi_stack=12(%esp),>edi=%edi
movl 12(%esp),%edi

# qhasm: ebp = ebp_stack
# asm 1: movl <ebp_stack=stack32#5,>ebp=int32#7
# asm 2: movl <ebp_stack=16(%esp),>ebp=%ebp
movl 16(%esp),%ebp

# qhasm: leave
add %eax,%esp
ret

# qhasm: enter ECRYPT_process_bytes stackaligned4096 aes_constants
.text
.p2align 5
.globl _ECRYPT_process_bytes
.globl ECRYPT_process_bytes
_ECRYPT_process_bytes:
ECRYPT_process_bytes:
mov %esp,%eax
sub $aes_constants,%eax
and $4095,%eax
add $224,%eax
sub %eax,%esp

# qhasm: eax_stack = eax
# asm 1: movl <eax=int32#1,>eax_stack=stack32#1
# asm 2: movl <eax=%eax,>eax_stack=0(%esp)
movl %eax,0(%esp)

# qhasm: ebx_stack = ebx
# asm 1: movl <ebx=int32#4,>ebx_stack=stack32#2
# asm 2: movl <ebx=%ebx,>ebx_stack=4(%esp)
movl %ebx,4(%esp)

# qhasm: esi_stack = esi
# asm 1: movl <esi=int32#5,>esi_stack=stack32#3
# asm 2: movl <esi=%esi,>esi_stack=8(%esp)
movl %esi,8(%esp)

# qhasm: edi_stack = edi
# asm 1: movl <edi=int32#6,>edi_stack=stack32#4
# asm 2: movl <edi=%edi,>edi_stack=12(%esp)
movl %edi,12(%esp)

# qhasm: ebp_stack = ebp
# asm 1: movl <ebp=int32#7,>ebp_stack=stack32#5
# asm 2: movl <ebp=%ebp,>ebp_stack=16(%esp)
movl %ebp,16(%esp)

# qhasm: c = arg2
# asm 1: movl <arg2=stack32#-2,>c=int32#4
# asm 2: movl <arg2=8(%esp,%eax),>c=%ebx
movl 8(%esp,%eax),%ebx

# qhasm: in = arg3
# asm 1: movl <arg3=stack32#-3,>in=int32#2
# asm 2: movl <arg3=12(%esp,%eax),>in=%ecx
movl 12(%esp,%eax),%ecx

# qhasm: out = arg4
# asm 1: movl <arg4=stack32#-4,>out=int32#3
# asm 2: movl <arg4=16(%esp,%eax),>out=%edx
movl 16(%esp,%eax),%edx

# qhasm: len = arg5
# asm 1: movl <arg5=stack32#-5,>len=int32#1
# asm 2: movl <arg5=20(%esp,%eax),>len=%eax
movl 20(%esp,%eax),%eax

# qhasm: c_stack = c
# asm 1: movd <c=int32#4,>c_stack=int3232#1
# asm 2: movd <c=%ebx,>c_stack=%mm0
movd %ebx,%mm0

# qhasm: in_stack = in
# asm 1: movd <in=int32#2,>in_stack=int3232#2
# asm 2: movd <in=%ecx,>in_stack=%mm1
movd %ecx,%mm1

# qhasm: out_stack = out
# asm 1: movd <out=int32#3,>out_stack=int3232#3
# asm 2: movd <out=%edx,>out_stack=%mm2
movd %edx,%mm2

# qhasm: len_stack = len
# asm 1: movd <len=int32#1,>len_stack=int3232#4
# asm 2: movd <len=%eax,>len_stack=%mm3
movd %eax,%mm3

# qhasm:                      unsigned>? len - 0
# asm 1: cmp  $0,<len=int32#1
# asm 2: cmp  $0,<len=%eax
cmp  $0,%eax
# comment:fp stack unchanged by jump

# qhasm: goto nothingtodo if !unsigned>
jbe ._nothingtodo

# qhasm: x0 = *(uint32 *) (c + 0)
# asm 1: movl 0(<c=int32#4),>x0=int32#1
# asm 2: movl 0(<c=%ebx),>x0=%eax
movl 0(%ebx),%eax

# qhasm: x1 = *(uint32 *) (c + 4)
# asm 1: movl 4(<c=int32#4),>x1=int32#2
# asm 2: movl 4(<c=%ebx),>x1=%ecx
movl 4(%ebx),%ecx

# qhasm: x2 = *(uint32 *) (c + 8)
# asm 1: movl 8(<c=int32#4),>x2=int32#3
# asm 2: movl 8(<c=%ebx),>x2=%edx
movl 8(%ebx),%edx

# qhasm: x3 = *(uint32 *) (c + 12)
# asm 1: movl 12(<c=int32#4),>x3=int32#5
# asm 2: movl 12(<c=%ebx),>x3=%esi
movl 12(%ebx),%esi

# qhasm: r0 = x0
# asm 1: movl <x0=int32#1,>r0=stack32#6
# asm 2: movl <x0=%eax,>r0=20(%esp)
movl %eax,20(%esp)

# qhasm: r1 = x1
# asm 1: movl <x1=int32#2,>r1=stack32#7
# asm 2: movl <x1=%ecx,>r1=24(%esp)
movl %ecx,24(%esp)

# qhasm: r2 = x2
# asm 1: movl <x2=int32#3,>r2=stack32#8
# asm 2: movl <x2=%edx,>r2=28(%esp)
movl %edx,28(%esp)

# qhasm: r3 = x3
# asm 1: movl <x3=int32#5,>r3=stack32#9
# asm 2: movl <x3=%esi,>r3=32(%esp)
movl %esi,32(%esp)

# qhasm: x0 = *(uint32 *) (c + 16)
# asm 1: movl 16(<c=int32#4),>x0=int32#1
# asm 2: movl 16(<c=%ebx),>x0=%eax
movl 16(%ebx),%eax

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#1,<x1=int32#2
# asm 2: xor  <x0=%eax,<x1=%ecx
xor  %eax,%ecx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#2,<x2=int32#3
# asm 2: xor  <x1=%ecx,<x2=%edx
xor  %ecx,%edx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#3,<x3=int32#5
# asm 2: xor  <x2=%edx,<x3=%esi
xor  %edx,%esi

# qhasm: r4 = x0
# asm 1: movl <x0=int32#1,>r4=stack32#10
# asm 2: movl <x0=%eax,>r4=36(%esp)
movl %eax,36(%esp)

# qhasm: r5 = x1
# asm 1: movl <x1=int32#2,>r5=stack32#11
# asm 2: movl <x1=%ecx,>r5=40(%esp)
movl %ecx,40(%esp)

# qhasm: r6 = x2
# asm 1: movl <x2=int32#3,>r6=stack32#12
# asm 2: movl <x2=%edx,>r6=44(%esp)
movl %edx,44(%esp)

# qhasm: r7 = x3
# asm 1: movl <x3=int32#5,>r7=stack32#13
# asm 2: movl <x3=%esi,>r7=48(%esp)
movl %esi,48(%esp)

# qhasm: x0 = *(uint32 *) (c + 20)
# asm 1: movl 20(<c=int32#4),>x0=int32#1
# asm 2: movl 20(<c=%ebx),>x0=%eax
movl 20(%ebx),%eax

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#1,<x1=int32#2
# asm 2: xor  <x0=%eax,<x1=%ecx
xor  %eax,%ecx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#2,<x2=int32#3
# asm 2: xor  <x1=%ecx,<x2=%edx
xor  %ecx,%edx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#3,<x3=int32#5
# asm 2: xor  <x2=%edx,<x3=%esi
xor  %edx,%esi

# qhasm: r8 = x0
# asm 1: movl <x0=int32#1,>r8=stack32#14
# asm 2: movl <x0=%eax,>r8=52(%esp)
movl %eax,52(%esp)

# qhasm: r9 = x1
# asm 1: movl <x1=int32#2,>r9=stack32#15
# asm 2: movl <x1=%ecx,>r9=56(%esp)
movl %ecx,56(%esp)

# qhasm: r10 = x2
# asm 1: movl <x2=int32#3,>r10=stack32#16
# asm 2: movl <x2=%edx,>r10=60(%esp)
movl %edx,60(%esp)

# qhasm: r11 = x3
# asm 1: movl <x3=int32#5,>r11=stack32#17
# asm 2: movl <x3=%esi,>r11=64(%esp)
movl %esi,64(%esp)

# qhasm: x0 = *(uint32 *) (c + 24)
# asm 1: movl 24(<c=int32#4),>x0=int32#1
# asm 2: movl 24(<c=%ebx),>x0=%eax
movl 24(%ebx),%eax

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#1,<x1=int32#2
# asm 2: xor  <x0=%eax,<x1=%ecx
xor  %eax,%ecx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#2,<x2=int32#3
# asm 2: xor  <x1=%ecx,<x2=%edx
xor  %ecx,%edx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#3,<x3=int32#5
# asm 2: xor  <x2=%edx,<x3=%esi
xor  %edx,%esi

# qhasm: r12 = x0
# asm 1: movl <x0=int32#1,>r12=stack32#18
# asm 2: movl <x0=%eax,>r12=68(%esp)
movl %eax,68(%esp)

# qhasm: r13 = x1
# asm 1: movl <x1=int32#2,>r13=stack32#19
# asm 2: movl <x1=%ecx,>r13=72(%esp)
movl %ecx,72(%esp)

# qhasm: r14 = x2
# asm 1: movl <x2=int32#3,>r14=stack32#20
# asm 2: movl <x2=%edx,>r14=76(%esp)
movl %edx,76(%esp)

# qhasm: r15 = x3
# asm 1: movl <x3=int32#5,>r15=stack32#21
# asm 2: movl <x3=%esi,>r15=80(%esp)
movl %esi,80(%esp)

# qhasm: x0 = *(uint32 *) (c + 28)
# asm 1: movl 28(<c=int32#4),>x0=int32#1
# asm 2: movl 28(<c=%ebx),>x0=%eax
movl 28(%ebx),%eax

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#1,<x1=int32#2
# asm 2: xor  <x0=%eax,<x1=%ecx
xor  %eax,%ecx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#2,<x2=int32#3
# asm 2: xor  <x1=%ecx,<x2=%edx
xor  %ecx,%edx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#3,<x3=int32#5
# asm 2: xor  <x2=%edx,<x3=%esi
xor  %edx,%esi

# qhasm: r16 = x0
# asm 1: movl <x0=int32#1,>r16=stack32#22
# asm 2: movl <x0=%eax,>r16=84(%esp)
movl %eax,84(%esp)

# qhasm: r17 = x1
# asm 1: movl <x1=int32#2,>r17=stack32#23
# asm 2: movl <x1=%ecx,>r17=88(%esp)
movl %ecx,88(%esp)

# qhasm: r18 = x2
# asm 1: movl <x2=int32#3,>r18=stack32#24
# asm 2: movl <x2=%edx,>r18=92(%esp)
movl %edx,92(%esp)

# qhasm: r19 = x3
# asm 1: movl <x3=int32#5,>r19=stack32#25
# asm 2: movl <x3=%esi,>r19=96(%esp)
movl %esi,96(%esp)

# qhasm: x0 = *(uint32 *) (c + 32)
# asm 1: movl 32(<c=int32#4),>x0=int32#1
# asm 2: movl 32(<c=%ebx),>x0=%eax
movl 32(%ebx),%eax

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#1,<x1=int32#2
# asm 2: xor  <x0=%eax,<x1=%ecx
xor  %eax,%ecx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#2,<x2=int32#3
# asm 2: xor  <x1=%ecx,<x2=%edx
xor  %ecx,%edx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#3,<x3=int32#5
# asm 2: xor  <x2=%edx,<x3=%esi
xor  %edx,%esi

# qhasm: r20 = x0
# asm 1: movl <x0=int32#1,>r20=stack32#26
# asm 2: movl <x0=%eax,>r20=100(%esp)
movl %eax,100(%esp)

# qhasm: r21 = x1
# asm 1: movl <x1=int32#2,>r21=stack32#27
# asm 2: movl <x1=%ecx,>r21=104(%esp)
movl %ecx,104(%esp)

# qhasm: r22 = x2
# asm 1: movl <x2=int32#3,>r22=stack32#28
# asm 2: movl <x2=%edx,>r22=108(%esp)
movl %edx,108(%esp)

# qhasm: r23 = x3
# asm 1: movl <x3=int32#5,>r23=stack32#29
# asm 2: movl <x3=%esi,>r23=112(%esp)
movl %esi,112(%esp)

# qhasm: x0 = *(uint32 *) (c + 36)
# asm 1: movl 36(<c=int32#4),>x0=int32#1
# asm 2: movl 36(<c=%ebx),>x0=%eax
movl 36(%ebx),%eax

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#1,<x1=int32#2
# asm 2: xor  <x0=%eax,<x1=%ecx
xor  %eax,%ecx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#2,<x2=int32#3
# asm 2: xor  <x1=%ecx,<x2=%edx
xor  %ecx,%edx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#3,<x3=int32#5
# asm 2: xor  <x2=%edx,<x3=%esi
xor  %edx,%esi

# qhasm: r24 = x0
# asm 1: movl <x0=int32#1,>r24=stack32#30
# asm 2: movl <x0=%eax,>r24=116(%esp)
movl %eax,116(%esp)

# qhasm: r25 = x1
# asm 1: movl <x1=int32#2,>r25=stack32#31
# asm 2: movl <x1=%ecx,>r25=120(%esp)
movl %ecx,120(%esp)

# qhasm: r26 = x2
# asm 1: movl <x2=int32#3,>r26=stack32#32
# asm 2: movl <x2=%edx,>r26=124(%esp)
movl %edx,124(%esp)

# qhasm: r27 = x3
# asm 1: movl <x3=int32#5,>r27=stack32#33
# asm 2: movl <x3=%esi,>r27=128(%esp)
movl %esi,128(%esp)

# qhasm: x0 = *(uint32 *) (c + 40)
# asm 1: movl 40(<c=int32#4),>x0=int32#1
# asm 2: movl 40(<c=%ebx),>x0=%eax
movl 40(%ebx),%eax

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#1,<x1=int32#2
# asm 2: xor  <x0=%eax,<x1=%ecx
xor  %eax,%ecx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#2,<x2=int32#3
# asm 2: xor  <x1=%ecx,<x2=%edx
xor  %ecx,%edx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#3,<x3=int32#5
# asm 2: xor  <x2=%edx,<x3=%esi
xor  %edx,%esi

# qhasm: r28 = x0
# asm 1: movl <x0=int32#1,>r28=stack32#34
# asm 2: movl <x0=%eax,>r28=132(%esp)
movl %eax,132(%esp)

# qhasm: r29 = x1
# asm 1: movl <x1=int32#2,>r29=stack32#35
# asm 2: movl <x1=%ecx,>r29=136(%esp)
movl %ecx,136(%esp)

# qhasm: r30 = x2
# asm 1: movl <x2=int32#3,>r30=stack32#36
# asm 2: movl <x2=%edx,>r30=140(%esp)
movl %edx,140(%esp)

# qhasm: r31 = x3
# asm 1: movl <x3=int32#5,>r31=stack32#37
# asm 2: movl <x3=%esi,>r31=144(%esp)
movl %esi,144(%esp)

# qhasm: x0 = *(uint32 *) (c + 44)
# asm 1: movl 44(<c=int32#4),>x0=int32#1
# asm 2: movl 44(<c=%ebx),>x0=%eax
movl 44(%ebx),%eax

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#1,<x1=int32#2
# asm 2: xor  <x0=%eax,<x1=%ecx
xor  %eax,%ecx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#2,<x2=int32#3
# asm 2: xor  <x1=%ecx,<x2=%edx
xor  %ecx,%edx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#3,<x3=int32#5
# asm 2: xor  <x2=%edx,<x3=%esi
xor  %edx,%esi

# qhasm: r32 = x0
# asm 1: movl <x0=int32#1,>r32=stack32#38
# asm 2: movl <x0=%eax,>r32=148(%esp)
movl %eax,148(%esp)

# qhasm: r33 = x1
# asm 1: movl <x1=int32#2,>r33=stack32#39
# asm 2: movl <x1=%ecx,>r33=152(%esp)
movl %ecx,152(%esp)

# qhasm: r34 = x2
# asm 1: movl <x2=int32#3,>r34=stack32#40
# asm 2: movl <x2=%edx,>r34=156(%esp)
movl %edx,156(%esp)

# qhasm: r35 = x3
# asm 1: movl <x3=int32#5,>r35=stack32#41
# asm 2: movl <x3=%esi,>r35=160(%esp)
movl %esi,160(%esp)

# qhasm: x0 = *(uint32 *) (c + 48)
# asm 1: movl 48(<c=int32#4),>x0=int32#1
# asm 2: movl 48(<c=%ebx),>x0=%eax
movl 48(%ebx),%eax

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#1,<x1=int32#2
# asm 2: xor  <x0=%eax,<x1=%ecx
xor  %eax,%ecx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#2,<x2=int32#3
# asm 2: xor  <x1=%ecx,<x2=%edx
xor  %ecx,%edx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#3,<x3=int32#5
# asm 2: xor  <x2=%edx,<x3=%esi
xor  %edx,%esi

# qhasm: r36 = x0
# asm 1: movl <x0=int32#1,>r36=stack32#42
# asm 2: movl <x0=%eax,>r36=164(%esp)
movl %eax,164(%esp)

# qhasm: r37 = x1
# asm 1: movl <x1=int32#2,>r37=stack32#43
# asm 2: movl <x1=%ecx,>r37=168(%esp)
movl %ecx,168(%esp)

# qhasm: r38 = x2
# asm 1: movl <x2=int32#3,>r38=stack32#44
# asm 2: movl <x2=%edx,>r38=172(%esp)
movl %edx,172(%esp)

# qhasm: r39 = x3
# asm 1: movl <x3=int32#5,>r39=stack32#45
# asm 2: movl <x3=%esi,>r39=176(%esp)
movl %esi,176(%esp)

# qhasm: x0 = *(uint32 *) (c + 52)
# asm 1: movl 52(<c=int32#4),>x0=int32#1
# asm 2: movl 52(<c=%ebx),>x0=%eax
movl 52(%ebx),%eax

# qhasm: x1 ^= x0
# asm 1: xor  <x0=int32#1,<x1=int32#2
# asm 2: xor  <x0=%eax,<x1=%ecx
xor  %eax,%ecx

# qhasm: x2 ^= x1
# asm 1: xor  <x1=int32#2,<x2=int32#3
# asm 2: xor  <x1=%ecx,<x2=%edx
xor  %ecx,%edx

# qhasm: x3 ^= x2
# asm 1: xor  <x2=int32#3,<x3=int32#5
# asm 2: xor  <x2=%edx,<x3=%esi
xor  %edx,%esi

# qhasm: r40 = x0
# asm 1: movl <x0=int32#1,>r40=stack32#46
# asm 2: movl <x0=%eax,>r40=180(%esp)
movl %eax,180(%esp)

# qhasm: r41 = x1
# asm 1: movl <x1=int32#2,>r41=stack32#47
# asm 2: movl <x1=%ecx,>r41=184(%esp)
movl %ecx,184(%esp)

# qhasm: r42 = x2
# asm 1: movl <x2=int32#3,>r42=stack32#48
# asm 2: movl <x2=%edx,>r42=188(%esp)
movl %edx,188(%esp)

# qhasm: r43 = x3
# asm 1: movl <x3=int32#5,>r43=stack32#49
# asm 2: movl <x3=%esi,>r43=192(%esp)
movl %esi,192(%esp)

# qhasm: y0 = *(uint32 *) (c + 56)
# asm 1: movl 56(<c=int32#4),>y0=int32#1
# asm 2: movl 56(<c=%ebx),>y0=%eax
movl 56(%ebx),%eax

# qhasm: y1 = *(uint32 *) (c + 60)
# asm 1: movl 60(<c=int32#4),>y1=int32#2
# asm 2: movl 60(<c=%ebx),>y1=%ecx
movl 60(%ebx),%ecx

# qhasm: y2 = *(uint32 *) (c + 64)
# asm 1: movl 64(<c=int32#4),>y2=int32#3
# asm 2: movl 64(<c=%ebx),>y2=%edx
movl 64(%ebx),%edx

# qhasm: y3 = *(uint32 *) (c + 68)
# asm 1: movl 68(<c=int32#4),>y3=int32#4
# asm 2: movl 68(<c=%ebx),>y3=%ebx
movl 68(%ebx),%ebx

# qhasm: mainloop:
._mainloop:

# qhasm:   n0 = y0
# asm 1: movl <y0=int32#1,>n0=stack32#50
# asm 2: movl <y0=%eax,>n0=196(%esp)
movl %eax,196(%esp)

# qhasm:   n1 = y1
# asm 1: movl <y1=int32#2,>n1=stack32#51
# asm 2: movl <y1=%ecx,>n1=200(%esp)
movl %ecx,200(%esp)

# qhasm:   n2 = y2
# asm 1: movl <y2=int32#3,>n2=stack32#52
# asm 2: movl <y2=%edx,>n2=204(%esp)
movl %edx,204(%esp)

# qhasm:   n3 = y3
# asm 1: movl <y3=int32#4,>n3=stack32#53
# asm 2: movl <y3=%ebx,>n3=208(%esp)
movl %ebx,208(%esp)

# qhasm:   y0 ^= r0
# asm 1: xorl <r0=stack32#6,<y0=int32#1
# asm 2: xorl <r0=20(%esp),<y0=%eax
xorl 20(%esp),%eax

# qhasm:   y1 ^= r1
# asm 1: xorl <r1=stack32#7,<y1=int32#2
# asm 2: xorl <r1=24(%esp),<y1=%ecx
xorl 24(%esp),%ecx

# qhasm:   y2 ^= r2
# asm 1: xorl <r2=stack32#8,<y2=int32#3
# asm 2: xorl <r2=28(%esp),<y2=%edx
xorl 28(%esp),%edx

# qhasm:   y3 ^= r3
# asm 1: xorl <r3=stack32#9,<y3=int32#4
# asm 2: xorl <r3=32(%esp),<y3=%ebx
xorl 32(%esp),%ebx

# qhasm:   y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:   p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:   z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:   z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:   p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:   z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:   z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:   p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:   z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:   z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:   z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:   y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:   p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:   z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:   p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:   y0 = r4
# asm 1: movl <r4=stack32#10,>y0=int32#1
# asm 2: movl <r4=36(%esp),>y0=%eax
movl 36(%esp),%eax

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int32#4,<y0=int32#1
# asm 2: xor  <z0=%ebx,<y0=%eax
xor  %ebx,%eax

# qhasm:   y1 = r5
# asm 1: movl <r5=stack32#11,>y1=int32#2
# asm 2: movl <r5=40(%esp),>y1=%ecx
movl 40(%esp),%ecx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int32#7,<y1=int32#2
# asm 2: xor  <z1=%ebp,<y1=%ecx
xor  %ebp,%ecx

# qhasm:   y2 = r6
# asm 1: movl <r6=stack32#12,>y2=int32#3
# asm 2: movl <r6=44(%esp),>y2=%edx
movl 44(%esp),%edx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int32#6,<y2=int32#3
# asm 2: xor  <z2=%edi,<y2=%edx
xor  %edi,%edx

# qhasm:   y3 = r7
# asm 1: movl <r7=stack32#13,>y3=int32#4
# asm 2: movl <r7=48(%esp),>y3=%ebx
movl 48(%esp),%ebx

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int32#5,<y3=int32#4
# asm 2: xor  <z3=%esi,<y3=%ebx
xor  %esi,%ebx

# qhasm:   y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:   p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:   z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:   z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:   p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:   z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:   z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:   p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:   z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:   z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:   z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:   y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:   p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:   z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:   p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:   y0 = r8
# asm 1: movl <r8=stack32#14,>y0=int32#1
# asm 2: movl <r8=52(%esp),>y0=%eax
movl 52(%esp),%eax

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int32#4,<y0=int32#1
# asm 2: xor  <z0=%ebx,<y0=%eax
xor  %ebx,%eax

# qhasm:   y1 = r9
# asm 1: movl <r9=stack32#15,>y1=int32#2
# asm 2: movl <r9=56(%esp),>y1=%ecx
movl 56(%esp),%ecx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int32#7,<y1=int32#2
# asm 2: xor  <z1=%ebp,<y1=%ecx
xor  %ebp,%ecx

# qhasm:   y2 = r10
# asm 1: movl <r10=stack32#16,>y2=int32#3
# asm 2: movl <r10=60(%esp),>y2=%edx
movl 60(%esp),%edx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int32#6,<y2=int32#3
# asm 2: xor  <z2=%edi,<y2=%edx
xor  %edi,%edx

# qhasm:   y3 = r11
# asm 1: movl <r11=stack32#17,>y3=int32#4
# asm 2: movl <r11=64(%esp),>y3=%ebx
movl 64(%esp),%ebx

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int32#5,<y3=int32#4
# asm 2: xor  <z3=%esi,<y3=%ebx
xor  %esi,%ebx

# qhasm:   y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:   p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:   z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:   z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:   p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:   z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:   z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:   p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:   z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:   z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:   z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:   y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:   p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:   z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:   p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:   y0 = r12
# asm 1: movl <r12=stack32#18,>y0=int32#1
# asm 2: movl <r12=68(%esp),>y0=%eax
movl 68(%esp),%eax

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int32#4,<y0=int32#1
# asm 2: xor  <z0=%ebx,<y0=%eax
xor  %ebx,%eax

# qhasm:   y1 = r13
# asm 1: movl <r13=stack32#19,>y1=int32#2
# asm 2: movl <r13=72(%esp),>y1=%ecx
movl 72(%esp),%ecx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int32#7,<y1=int32#2
# asm 2: xor  <z1=%ebp,<y1=%ecx
xor  %ebp,%ecx

# qhasm:   y2 = r14
# asm 1: movl <r14=stack32#20,>y2=int32#3
# asm 2: movl <r14=76(%esp),>y2=%edx
movl 76(%esp),%edx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int32#6,<y2=int32#3
# asm 2: xor  <z2=%edi,<y2=%edx
xor  %edi,%edx

# qhasm:   y3 = r15
# asm 1: movl <r15=stack32#21,>y3=int32#4
# asm 2: movl <r15=80(%esp),>y3=%ebx
movl 80(%esp),%ebx

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int32#5,<y3=int32#4
# asm 2: xor  <z3=%esi,<y3=%ebx
xor  %esi,%ebx

# qhasm:   y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:   p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:   z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:   z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:   p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:   z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:   z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:   p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:   z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:   z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:   z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:   y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:   p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:   z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:   p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:   y0 = r16
# asm 1: movl <r16=stack32#22,>y0=int32#1
# asm 2: movl <r16=84(%esp),>y0=%eax
movl 84(%esp),%eax

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int32#4,<y0=int32#1
# asm 2: xor  <z0=%ebx,<y0=%eax
xor  %ebx,%eax

# qhasm:   y1 = r17
# asm 1: movl <r17=stack32#23,>y1=int32#2
# asm 2: movl <r17=88(%esp),>y1=%ecx
movl 88(%esp),%ecx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int32#7,<y1=int32#2
# asm 2: xor  <z1=%ebp,<y1=%ecx
xor  %ebp,%ecx

# qhasm:   y2 = r18
# asm 1: movl <r18=stack32#24,>y2=int32#3
# asm 2: movl <r18=92(%esp),>y2=%edx
movl 92(%esp),%edx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int32#6,<y2=int32#3
# asm 2: xor  <z2=%edi,<y2=%edx
xor  %edi,%edx

# qhasm:   y3 = r19
# asm 1: movl <r19=stack32#25,>y3=int32#4
# asm 2: movl <r19=96(%esp),>y3=%ebx
movl 96(%esp),%ebx

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int32#5,<y3=int32#4
# asm 2: xor  <z3=%esi,<y3=%ebx
xor  %esi,%ebx

# qhasm:   y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:   p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:   z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:   z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:   p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:   z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:   z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:   p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:   z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:   z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:   z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:   y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:   p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:   z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:   p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:   y0 = r20
# asm 1: movl <r20=stack32#26,>y0=int32#1
# asm 2: movl <r20=100(%esp),>y0=%eax
movl 100(%esp),%eax

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int32#4,<y0=int32#1
# asm 2: xor  <z0=%ebx,<y0=%eax
xor  %ebx,%eax

# qhasm:   y1 = r21
# asm 1: movl <r21=stack32#27,>y1=int32#2
# asm 2: movl <r21=104(%esp),>y1=%ecx
movl 104(%esp),%ecx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int32#7,<y1=int32#2
# asm 2: xor  <z1=%ebp,<y1=%ecx
xor  %ebp,%ecx

# qhasm:   y2 = r22
# asm 1: movl <r22=stack32#28,>y2=int32#3
# asm 2: movl <r22=108(%esp),>y2=%edx
movl 108(%esp),%edx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int32#6,<y2=int32#3
# asm 2: xor  <z2=%edi,<y2=%edx
xor  %edi,%edx

# qhasm:   y3 = r23
# asm 1: movl <r23=stack32#29,>y3=int32#4
# asm 2: movl <r23=112(%esp),>y3=%ebx
movl 112(%esp),%ebx

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int32#5,<y3=int32#4
# asm 2: xor  <z3=%esi,<y3=%ebx
xor  %esi,%ebx

# qhasm:   y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:   p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:   z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:   z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:   p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:   z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:   z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:   p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:   z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:   z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:   z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:   y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:   p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:   z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:   p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:   y0 = r24
# asm 1: movl <r24=stack32#30,>y0=int32#1
# asm 2: movl <r24=116(%esp),>y0=%eax
movl 116(%esp),%eax

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int32#4,<y0=int32#1
# asm 2: xor  <z0=%ebx,<y0=%eax
xor  %ebx,%eax

# qhasm:   y1 = r25
# asm 1: movl <r25=stack32#31,>y1=int32#2
# asm 2: movl <r25=120(%esp),>y1=%ecx
movl 120(%esp),%ecx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int32#7,<y1=int32#2
# asm 2: xor  <z1=%ebp,<y1=%ecx
xor  %ebp,%ecx

# qhasm:   y2 = r26
# asm 1: movl <r26=stack32#32,>y2=int32#3
# asm 2: movl <r26=124(%esp),>y2=%edx
movl 124(%esp),%edx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int32#6,<y2=int32#3
# asm 2: xor  <z2=%edi,<y2=%edx
xor  %edi,%edx

# qhasm:   y3 = r27
# asm 1: movl <r27=stack32#33,>y3=int32#4
# asm 2: movl <r27=128(%esp),>y3=%ebx
movl 128(%esp),%ebx

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int32#5,<y3=int32#4
# asm 2: xor  <z3=%esi,<y3=%ebx
xor  %esi,%ebx

# qhasm:   y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:   p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:   z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:   z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:   p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:   z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:   z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:   p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:   z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:   z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:   z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:   y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:   p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:   z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:   p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:   y0 = r28
# asm 1: movl <r28=stack32#34,>y0=int32#1
# asm 2: movl <r28=132(%esp),>y0=%eax
movl 132(%esp),%eax

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int32#4,<y0=int32#1
# asm 2: xor  <z0=%ebx,<y0=%eax
xor  %ebx,%eax

# qhasm:   y1 = r29
# asm 1: movl <r29=stack32#35,>y1=int32#2
# asm 2: movl <r29=136(%esp),>y1=%ecx
movl 136(%esp),%ecx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int32#7,<y1=int32#2
# asm 2: xor  <z1=%ebp,<y1=%ecx
xor  %ebp,%ecx

# qhasm:   y2 = r30
# asm 1: movl <r30=stack32#36,>y2=int32#3
# asm 2: movl <r30=140(%esp),>y2=%edx
movl 140(%esp),%edx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int32#6,<y2=int32#3
# asm 2: xor  <z2=%edi,<y2=%edx
xor  %edi,%edx

# qhasm:   y3 = r31
# asm 1: movl <r31=stack32#37,>y3=int32#4
# asm 2: movl <r31=144(%esp),>y3=%ebx
movl 144(%esp),%ebx

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int32#5,<y3=int32#4
# asm 2: xor  <z3=%esi,<y3=%ebx
xor  %esi,%ebx

# qhasm:   y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:   p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:   z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:   z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:   p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:   z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:   z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:   p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:   z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:   z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:   z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:   y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:   p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:   z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:   p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:   y0 = r32
# asm 1: movl <r32=stack32#38,>y0=int32#1
# asm 2: movl <r32=148(%esp),>y0=%eax
movl 148(%esp),%eax

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int32#4,<y0=int32#1
# asm 2: xor  <z0=%ebx,<y0=%eax
xor  %ebx,%eax

# qhasm:   y1 = r33
# asm 1: movl <r33=stack32#39,>y1=int32#2
# asm 2: movl <r33=152(%esp),>y1=%ecx
movl 152(%esp),%ecx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int32#7,<y1=int32#2
# asm 2: xor  <z1=%ebp,<y1=%ecx
xor  %ebp,%ecx

# qhasm:   y2 = r34
# asm 1: movl <r34=stack32#40,>y2=int32#3
# asm 2: movl <r34=156(%esp),>y2=%edx
movl 156(%esp),%edx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int32#6,<y2=int32#3
# asm 2: xor  <z2=%edi,<y2=%edx
xor  %edi,%edx

# qhasm:   y3 = r35
# asm 1: movl <r35=stack32#41,>y3=int32#4
# asm 2: movl <r35=160(%esp),>y3=%ebx
movl 160(%esp),%ebx

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int32#5,<y3=int32#4
# asm 2: xor  <z3=%esi,<y3=%ebx
xor  %esi,%ebx

# qhasm:   y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:   p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:   z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:   z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:   p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:   z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:   z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:   p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:   z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:   z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:   z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:   y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:   p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:   z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:   p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:   y0 = r36
# asm 1: movl <r36=stack32#42,>y0=int32#1
# asm 2: movl <r36=164(%esp),>y0=%eax
movl 164(%esp),%eax

# qhasm:   y0 ^= z0
# asm 1: xor  <z0=int32#4,<y0=int32#1
# asm 2: xor  <z0=%ebx,<y0=%eax
xor  %ebx,%eax

# qhasm:   y1 = r37
# asm 1: movl <r37=stack32#43,>y1=int32#2
# asm 2: movl <r37=168(%esp),>y1=%ecx
movl 168(%esp),%ecx

# qhasm:   y1 ^= z1
# asm 1: xor  <z1=int32#7,<y1=int32#2
# asm 2: xor  <z1=%ebp,<y1=%ecx
xor  %ebp,%ecx

# qhasm:   y2 = r38
# asm 1: movl <r38=stack32#44,>y2=int32#3
# asm 2: movl <r38=172(%esp),>y2=%edx
movl 172(%esp),%edx

# qhasm:   y2 ^= z2
# asm 1: xor  <z2=int32#6,<y2=int32#3
# asm 2: xor  <z2=%edi,<y2=%edx
xor  %edi,%edx

# qhasm:   y3 = r39
# asm 1: movl <r39=stack32#45,>y3=int32#4
# asm 2: movl <r39=176(%esp),>y3=%ebx
movl 176(%esp),%ebx

# qhasm:   y3 ^= z3
# asm 1: xor  <z3=int32#5,<y3=int32#4
# asm 2: xor  <z3=%esi,<y3=%ebx
xor  %esi,%ebx

# qhasm:   y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:   z0 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>z0=int32#4
# asm 2: movzbl <y0=%al,>z0=%ebx
movzbl %al,%ebx

# qhasm:   z0 = *(uint8 *) (&aes_table2 + z0 * 8)
# asm 1: movzbl aes_table2(,<z0=int32#4,8),>z0=int32#4
# asm 2: movzbl aes_table2(,<z0=%ebx,8),>z0=%ebx
movzbl aes_table2(,%ebx,8),%ebx

# qhasm:   z3 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>z3=int32#5
# asm 2: movzbl <y0=%ah,>z3=%esi
movzbl %ah,%esi

# qhasm:   z3 = *(uint16 *) (&aes_tablex + z3 * 8)
# asm 1: movzwl aes_tablex(,<z3=int32#5,8),>z3=int32#5
# asm 2: movzwl aes_tablex(,<z3=%esi,8),>z3=%esi
movzwl aes_tablex(,%esi,8),%esi

# qhasm:   (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:   z2 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>z2=int32#6
# asm 2: movzbl <y0=%al,>z2=%edi
movzbl %al,%edi

# qhasm:   z2 = *(uint32 *) (&aes_table0 + z2 * 8)
# asm 1: movl aes_table0(,<z2=int32#6,8),>z2=int32#6
# asm 2: movl aes_table0(,<z2=%edi,8),>z2=%edi
movl aes_table0(,%edi,8),%edi

# qhasm:   z2 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<z2=int32#6
# asm 2: and  $0x00ff0000,<z2=%edi
and  $0x00ff0000,%edi

# qhasm:   z1 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>z1=int32#1
# asm 2: movzbl <y0=%ah,>z1=%eax
movzbl %ah,%eax

# qhasm:   z1 = *(uint32 *) (&aes_table1 + z1 * 8)
# asm 1: movl aes_table1(,<z1=int32#1,8),>z1=int32#7
# asm 2: movl aes_table1(,<z1=%eax,8),>z1=%ebp
movl aes_table1(,%eax,8),%ebp

# qhasm:   z1 &= 0xff000000
# asm 1: and  $0xff000000,<z1=int32#7
# asm 2: and  $0xff000000,<z1=%ebp
and  $0xff000000,%ebp

# qhasm:   z0 ^= r40
# asm 1: xorl <r40=stack32#46,<z0=int32#4
# asm 2: xorl <r40=180(%esp),<z0=%ebx
xorl 180(%esp),%ebx

# qhasm:   z3 ^= r43
# asm 1: xorl <r43=stack32#49,<z3=int32#5
# asm 2: xorl <r43=192(%esp),<z3=%esi
xorl 192(%esp),%esi

# qhasm:   z1 ^= r41
# asm 1: xorl <r41=stack32#47,<z1=int32#7
# asm 2: xorl <r41=184(%esp),<z1=%ebp
xorl 184(%esp),%ebp

# qhasm:   z2 ^= r42
# asm 1: xorl <r42=stack32#48,<z2=int32#6
# asm 2: xorl <r42=188(%esp),<z2=%edi
xorl 188(%esp),%edi

# qhasm:   p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:   p10 = *(uint8 *) (&aes_table2 + p10 * 8)
# asm 1: movzbl aes_table2(,<p10=int32#1,8),>p10=int32#1
# asm 2: movzbl aes_table2(,<p10=%eax,8),>p10=%eax
movzbl aes_table2(,%eax,8),%eax

# qhasm:   z1 ^= p10
# asm 1: xor  <p10=int32#1,<z1=int32#7
# asm 2: xor  <p10=%eax,<z1=%ebp
xor  %eax,%ebp

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:   p11 = *(uint16 *) (&aes_tablex + p11 * 8)
# asm 1: movzwl aes_tablex(,<p11=int32#1,8),>p11=int32#1
# asm 2: movzwl aes_tablex(,<p11=%eax,8),>p11=%eax
movzwl aes_tablex(,%eax,8),%eax

# qhasm:   z0 ^= p11
# asm 1: xor  <p11=int32#1,<z0=int32#4
# asm 2: xor  <p11=%eax,<z0=%ebx
xor  %eax,%ebx

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:   p12 = *(uint32 *) (&aes_table0 + p12 * 8)
# asm 1: movl aes_table0(,<p12=int32#1,8),>p12=int32#1
# asm 2: movl aes_table0(,<p12=%eax,8),>p12=%eax
movl aes_table0(,%eax,8),%eax

# qhasm:   p12 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<p12=int32#1
# asm 2: and  $0x00ff0000,<p12=%eax
and  $0x00ff0000,%eax

# qhasm:   z3 ^= p12
# asm 1: xor  <p12=int32#1,<z3=int32#5
# asm 2: xor  <p12=%eax,<z3=%esi
xor  %eax,%esi

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:   p13 = *(uint32 *) (&aes_table1 + p13 * 8)
# asm 1: movl aes_table1(,<p13=int32#1,8),>p13=int32#1
# asm 2: movl aes_table1(,<p13=%eax,8),>p13=%eax
movl aes_table1(,%eax,8),%eax

# qhasm:   p13 &= 0xff000000
# asm 1: and  $0xff000000,<p13=int32#1
# asm 2: and  $0xff000000,<p13=%eax
and  $0xff000000,%eax

# qhasm:   z2 ^= p13
# asm 1: xor  <p13=int32#1,<z2=int32#6
# asm 2: xor  <p13=%eax,<z2=%edi
xor  %eax,%edi

# qhasm:   y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:   p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:   p20 = *(uint8 *) (&aes_table2 + p20 * 8)
# asm 1: movzbl aes_table2(,<p20=int32#2,8),>p20=int32#2
# asm 2: movzbl aes_table2(,<p20=%ecx,8),>p20=%ecx
movzbl aes_table2(,%ecx,8),%ecx

# qhasm:   z2 ^= p20
# asm 1: xor  <p20=int32#2,<z2=int32#6
# asm 2: xor  <p20=%ecx,<z2=%edi
xor  %ecx,%edi

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:   p21 = *(uint16 *) (&aes_tablex + p21 * 8)
# asm 1: movzwl aes_tablex(,<p21=int32#2,8),>p21=int32#2
# asm 2: movzwl aes_tablex(,<p21=%ecx,8),>p21=%ecx
movzwl aes_tablex(,%ecx,8),%ecx

# qhasm:   z1 ^= p21
# asm 1: xor  <p21=int32#2,<z1=int32#7
# asm 2: xor  <p21=%ecx,<z1=%ebp
xor  %ecx,%ebp

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:   p22 = *(uint32 *) (&aes_table0 + p22 * 8)
# asm 1: movl aes_table0(,<p22=int32#2,8),>p22=int32#2
# asm 2: movl aes_table0(,<p22=%ecx,8),>p22=%ecx
movl aes_table0(,%ecx,8),%ecx

# qhasm:   p22 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<p22=int32#2
# asm 2: and  $0x00ff0000,<p22=%ecx
and  $0x00ff0000,%ecx

# qhasm:   z0 ^= p22
# asm 1: xor  <p22=int32#2,<z0=int32#4
# asm 2: xor  <p22=%ecx,<z0=%ebx
xor  %ecx,%ebx

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:   p23 = *(uint32 *) (&aes_table1 + p23 * 8)
# asm 1: movl aes_table1(,<p23=int32#2,8),>p23=int32#2
# asm 2: movl aes_table1(,<p23=%ecx,8),>p23=%ecx
movl aes_table1(,%ecx,8),%ecx

# qhasm:   p23 &= 0xff000000
# asm 1: and  $0xff000000,<p23=int32#2
# asm 2: and  $0xff000000,<p23=%ecx
and  $0xff000000,%ecx

# qhasm:   z3 ^= p23
# asm 1: xor  <p23=int32#2,<z3=int32#5
# asm 2: xor  <p23=%ecx,<z3=%esi
xor  %ecx,%esi

# qhasm:   p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:   p30 = *(uint8 *) (&aes_table2 + p30 * 8)
# asm 1: movzbl aes_table2(,<p30=int32#2,8),>p30=int32#2
# asm 2: movzbl aes_table2(,<p30=%ecx,8),>p30=%ecx
movzbl aes_table2(,%ecx,8),%ecx

# qhasm:   z3 ^= p30
# asm 1: xor  <p30=int32#2,<z3=int32#5
# asm 2: xor  <p30=%ecx,<z3=%esi
xor  %ecx,%esi

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:   p31 = *(uint16 *) (&aes_tablex + p31 * 8)
# asm 1: movzwl aes_tablex(,<p31=int32#2,8),>p31=int32#2
# asm 2: movzwl aes_tablex(,<p31=%ecx,8),>p31=%ecx
movzwl aes_tablex(,%ecx,8),%ecx

# qhasm:   z2 ^= p31
# asm 1: xor  <p31=int32#2,<z2=int32#6
# asm 2: xor  <p31=%ecx,<z2=%edi
xor  %ecx,%edi

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:   p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:   p32 = *(uint32 *) (&aes_table0 + p32 * 8)
# asm 1: movl aes_table0(,<p32=int32#2,8),>p32=int32#2
# asm 2: movl aes_table0(,<p32=%ecx,8),>p32=%ecx
movl aes_table0(,%ecx,8),%ecx

# qhasm:   p32 &= 0x00ff0000
# asm 1: and  $0x00ff0000,<p32=int32#2
# asm 2: and  $0x00ff0000,<p32=%ecx
and  $0x00ff0000,%ecx

# qhasm:   z1 ^= p32
# asm 1: xor  <p32=int32#2,<z1=int32#7
# asm 2: xor  <p32=%ecx,<z1=%ebp
xor  %ecx,%ebp

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:   p33 = *(uint32 *) (&aes_table1 + p33 * 8)
# asm 1: movl aes_table1(,<p33=int32#1,8),>p33=int32#1
# asm 2: movl aes_table1(,<p33=%eax,8),>p33=%eax
movl aes_table1(,%eax,8),%eax

# qhasm:   p33 &= 0xff000000
# asm 1: and  $0xff000000,<p33=int32#1
# asm 2: and  $0xff000000,<p33=%eax
and  $0xff000000,%eax

# qhasm:   z0 ^= p33
# asm 1: xor  <p33=int32#1,<z0=int32#4
# asm 2: xor  <p33=%eax,<z0=%ebx
xor  %eax,%ebx

# qhasm:   len = len_stack
# asm 1: movd <len_stack=int3232#4,>len=int32#3
# asm 2: movd <len_stack=%mm3,>len=%edx
movd %mm3,%edx

# qhasm:                      unsigned<? len - 16
# asm 1: cmp  $16,<len=int32#3
# asm 2: cmp  $16,<len=%edx
cmp  $16,%edx
# comment:fp stack unchanged by jump

# qhasm:   goto fullblock if !unsigned<
jae ._fullblock

# qhasm:     z1_stack = z1
# asm 1: movd <z1=int32#7,>z1_stack=int3232#4
# asm 2: movd <z1=%ebp,>z1_stack=%mm3
movd %ebp,%mm3

# qhasm:     z2_stack = z2
# asm 1: movd <z2=int32#6,>z2_stack=int3232#5
# asm 2: movd <z2=%edi,>z2_stack=%mm4
movd %edi,%mm4

# qhasm:     z3_stack = z3
# asm 1: movd <z3=int32#5,>z3_stack=int3232#6
# asm 2: movd <z3=%esi,>z3_stack=%mm5
movd %esi,%mm5

# qhasm:     in = in_stack
# asm 1: movd <in_stack=int3232#2,>in=int32#5
# asm 2: movd <in_stack=%mm1,>in=%esi
movd %mm1,%esi

# qhasm:     out = out_stack
# asm 1: movd <out_stack=int3232#3,>out=int32#6
# asm 2: movd <out_stack=%mm2,>out=%edi
movd %mm2,%edi

# qhasm:     b0 = *(uint8 *) (in + 0)
# asm 1: movzbl 0(<in=int32#5),>b0=int32#1
# asm 2: movzbl 0(<in=%esi),>b0=%eax
movzbl 0(%esi),%eax

# qhasm:     b0 ^= z0
# asm 1: xor  <z0=int32#4,<b0=int32#1
# asm 2: xor  <z0=%ebx,<b0=%eax
xor  %ebx,%eax

# qhasm:     *(uint8 *) (out + 0) = b0
# asm 1: movb <b0=int32#1%8,0(<out=int32#6)
# asm 2: movb <b0=%al,0(<out=%edi)
movb %al,0(%edi)

# qhasm:                                 unsigned>? len - 1
# asm 1: cmp  $1,<len=int32#3
# asm 2: cmp  $1,<len=%edx
cmp  $1,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) z0 >>= 8
# asm 1: shr  $8,<z0=int32#4
# asm 2: shr  $8,<z0=%ebx
shr  $8,%ebx

# qhasm:     b1 = *(uint8 *) (in + 1)
# asm 1: movzbl 1(<in=int32#5),>b1=int32#1
# asm 2: movzbl 1(<in=%esi),>b1=%eax
movzbl 1(%esi),%eax

# qhasm:     b1 ^= z0
# asm 1: xor  <z0=int32#4,<b1=int32#1
# asm 2: xor  <z0=%ebx,<b1=%eax
xor  %ebx,%eax

# qhasm:     *(uint8 *) (out + 1) = b1
# asm 1: movb <b1=int32#1%8,1(<out=int32#6)
# asm 2: movb <b1=%al,1(<out=%edi)
movb %al,1(%edi)

# qhasm:                                 unsigned>? len - 2
# asm 1: cmp  $2,<len=int32#3
# asm 2: cmp  $2,<len=%edx
cmp  $2,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) z0 >>= 8
# asm 1: shr  $8,<z0=int32#4
# asm 2: shr  $8,<z0=%ebx
shr  $8,%ebx

# qhasm:     b2 = *(uint8 *) (in + 2)
# asm 1: movzbl 2(<in=int32#5),>b2=int32#1
# asm 2: movzbl 2(<in=%esi),>b2=%eax
movzbl 2(%esi),%eax

# qhasm:     b2 ^= z0
# asm 1: xor  <z0=int32#4,<b2=int32#1
# asm 2: xor  <z0=%ebx,<b2=%eax
xor  %ebx,%eax

# qhasm:     *(uint8 *) (out + 2) = b2
# asm 1: movb <b2=int32#1%8,2(<out=int32#6)
# asm 2: movb <b2=%al,2(<out=%edi)
movb %al,2(%edi)

# qhasm:                                 unsigned>? len - 3
# asm 1: cmp  $3,<len=int32#3
# asm 2: cmp  $3,<len=%edx
cmp  $3,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) z0 >>= 8
# asm 1: shr  $8,<z0=int32#4
# asm 2: shr  $8,<z0=%ebx
shr  $8,%ebx

# qhasm:     b3 = *(uint8 *) (in + 3)
# asm 1: movzbl 3(<in=int32#5),>b3=int32#1
# asm 2: movzbl 3(<in=%esi),>b3=%eax
movzbl 3(%esi),%eax

# qhasm:     b3 ^= z0
# asm 1: xor  <z0=int32#4,<b3=int32#1
# asm 2: xor  <z0=%ebx,<b3=%eax
xor  %ebx,%eax

# qhasm:     *(uint8 *) (out + 3) = b3
# asm 1: movb <b3=int32#1%8,3(<out=int32#6)
# asm 2: movb <b3=%al,3(<out=%edi)
movb %al,3(%edi)

# qhasm:                                 unsigned>? len - 4
# asm 1: cmp  $4,<len=int32#3
# asm 2: cmp  $4,<len=%edx
cmp  $4,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     z1 = z1_stack
# asm 1: movd <z1_stack=int3232#4,>z1=int32#2
# asm 2: movd <z1_stack=%mm3,>z1=%ecx
movd %mm3,%ecx

# qhasm:     b0 = *(uint8 *) (in + 4)
# asm 1: movzbl 4(<in=int32#5),>b0=int32#1
# asm 2: movzbl 4(<in=%esi),>b0=%eax
movzbl 4(%esi),%eax

# qhasm:     b0 ^= z1
# asm 1: xor  <z1=int32#2,<b0=int32#1
# asm 2: xor  <z1=%ecx,<b0=%eax
xor  %ecx,%eax

# qhasm:     *(uint8 *) (out + 4) = b0
# asm 1: movb <b0=int32#1%8,4(<out=int32#6)
# asm 2: movb <b0=%al,4(<out=%edi)
movb %al,4(%edi)

# qhasm:                                 unsigned>? len - 5
# asm 1: cmp  $5,<len=int32#3
# asm 2: cmp  $5,<len=%edx
cmp  $5,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) z1 >>= 8
# asm 1: shr  $8,<z1=int32#2
# asm 2: shr  $8,<z1=%ecx
shr  $8,%ecx

# qhasm:     b1 = *(uint8 *) (in + 5)
# asm 1: movzbl 5(<in=int32#5),>b1=int32#1
# asm 2: movzbl 5(<in=%esi),>b1=%eax
movzbl 5(%esi),%eax

# qhasm:     b1 ^= z1
# asm 1: xor  <z1=int32#2,<b1=int32#1
# asm 2: xor  <z1=%ecx,<b1=%eax
xor  %ecx,%eax

# qhasm:     *(uint8 *) (out + 5) = b1
# asm 1: movb <b1=int32#1%8,5(<out=int32#6)
# asm 2: movb <b1=%al,5(<out=%edi)
movb %al,5(%edi)

# qhasm:                                 unsigned>? len - 6
# asm 1: cmp  $6,<len=int32#3
# asm 2: cmp  $6,<len=%edx
cmp  $6,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) z1 >>= 8
# asm 1: shr  $8,<z1=int32#2
# asm 2: shr  $8,<z1=%ecx
shr  $8,%ecx

# qhasm:     b2 = *(uint8 *) (in + 6)
# asm 1: movzbl 6(<in=int32#5),>b2=int32#1
# asm 2: movzbl 6(<in=%esi),>b2=%eax
movzbl 6(%esi),%eax

# qhasm:     b2 ^= z1
# asm 1: xor  <z1=int32#2,<b2=int32#1
# asm 2: xor  <z1=%ecx,<b2=%eax
xor  %ecx,%eax

# qhasm:     *(uint8 *) (out + 6) = b2
# asm 1: movb <b2=int32#1%8,6(<out=int32#6)
# asm 2: movb <b2=%al,6(<out=%edi)
movb %al,6(%edi)

# qhasm:                                 unsigned>? len - 7
# asm 1: cmp  $7,<len=int32#3
# asm 2: cmp  $7,<len=%edx
cmp  $7,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) z1 >>= 8
# asm 1: shr  $8,<z1=int32#2
# asm 2: shr  $8,<z1=%ecx
shr  $8,%ecx

# qhasm:     b3 = *(uint8 *) (in + 7)
# asm 1: movzbl 7(<in=int32#5),>b3=int32#1
# asm 2: movzbl 7(<in=%esi),>b3=%eax
movzbl 7(%esi),%eax

# qhasm:     b3 ^= z1
# asm 1: xor  <z1=int32#2,<b3=int32#1
# asm 2: xor  <z1=%ecx,<b3=%eax
xor  %ecx,%eax

# qhasm:     *(uint8 *) (out + 7) = b3
# asm 1: movb <b3=int32#1%8,7(<out=int32#6)
# asm 2: movb <b3=%al,7(<out=%edi)
movb %al,7(%edi)

# qhasm:                                 unsigned>? len - 8
# asm 1: cmp  $8,<len=int32#3
# asm 2: cmp  $8,<len=%edx
cmp  $8,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     z2 = z2_stack
# asm 1: movd <z2_stack=int3232#5,>z2=int32#2
# asm 2: movd <z2_stack=%mm4,>z2=%ecx
movd %mm4,%ecx

# qhasm:     b0 = *(uint8 *) (in + 8)
# asm 1: movzbl 8(<in=int32#5),>b0=int32#1
# asm 2: movzbl 8(<in=%esi),>b0=%eax
movzbl 8(%esi),%eax

# qhasm:     b0 ^= z2
# asm 1: xor  <z2=int32#2,<b0=int32#1
# asm 2: xor  <z2=%ecx,<b0=%eax
xor  %ecx,%eax

# qhasm:     *(uint8 *) (out + 8) = b0
# asm 1: movb <b0=int32#1%8,8(<out=int32#6)
# asm 2: movb <b0=%al,8(<out=%edi)
movb %al,8(%edi)

# qhasm:                                 unsigned>? len - 9
# asm 1: cmp  $9,<len=int32#3
# asm 2: cmp  $9,<len=%edx
cmp  $9,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) z2 >>= 8
# asm 1: shr  $8,<z2=int32#2
# asm 2: shr  $8,<z2=%ecx
shr  $8,%ecx

# qhasm:     b1 = *(uint8 *) (in + 9)
# asm 1: movzbl 9(<in=int32#5),>b1=int32#1
# asm 2: movzbl 9(<in=%esi),>b1=%eax
movzbl 9(%esi),%eax

# qhasm:     b1 ^= z2
# asm 1: xor  <z2=int32#2,<b1=int32#1
# asm 2: xor  <z2=%ecx,<b1=%eax
xor  %ecx,%eax

# qhasm:     *(uint8 *) (out + 9) = b1
# asm 1: movb <b1=int32#1%8,9(<out=int32#6)
# asm 2: movb <b1=%al,9(<out=%edi)
movb %al,9(%edi)

# qhasm:                                 unsigned>? len - 10
# asm 1: cmp  $10,<len=int32#3
# asm 2: cmp  $10,<len=%edx
cmp  $10,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) z2 >>= 8
# asm 1: shr  $8,<z2=int32#2
# asm 2: shr  $8,<z2=%ecx
shr  $8,%ecx

# qhasm:     b2 = *(uint8 *) (in + 10)
# asm 1: movzbl 10(<in=int32#5),>b2=int32#1
# asm 2: movzbl 10(<in=%esi),>b2=%eax
movzbl 10(%esi),%eax

# qhasm:     b2 ^= z2
# asm 1: xor  <z2=int32#2,<b2=int32#1
# asm 2: xor  <z2=%ecx,<b2=%eax
xor  %ecx,%eax

# qhasm:     *(uint8 *) (out + 10) = b2
# asm 1: movb <b2=int32#1%8,10(<out=int32#6)
# asm 2: movb <b2=%al,10(<out=%edi)
movb %al,10(%edi)

# qhasm:                                 unsigned>? len - 11
# asm 1: cmp  $11,<len=int32#3
# asm 2: cmp  $11,<len=%edx
cmp  $11,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) z2 >>= 8
# asm 1: shr  $8,<z2=int32#2
# asm 2: shr  $8,<z2=%ecx
shr  $8,%ecx

# qhasm:     b3 = *(uint8 *) (in + 11)
# asm 1: movzbl 11(<in=int32#5),>b3=int32#1
# asm 2: movzbl 11(<in=%esi),>b3=%eax
movzbl 11(%esi),%eax

# qhasm:     b3 ^= z2
# asm 1: xor  <z2=int32#2,<b3=int32#1
# asm 2: xor  <z2=%ecx,<b3=%eax
xor  %ecx,%eax

# qhasm:     *(uint8 *) (out + 11) = b3
# asm 1: movb <b3=int32#1%8,11(<out=int32#6)
# asm 2: movb <b3=%al,11(<out=%edi)
movb %al,11(%edi)

# qhasm:                                 unsigned>? len - 12
# asm 1: cmp  $12,<len=int32#3
# asm 2: cmp  $12,<len=%edx
cmp  $12,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     z3 = z3_stack
# asm 1: movd <z3_stack=int3232#6,>z3=int32#2
# asm 2: movd <z3_stack=%mm5,>z3=%ecx
movd %mm5,%ecx

# qhasm:     b0 = *(uint8 *) (in + 12)
# asm 1: movzbl 12(<in=int32#5),>b0=int32#1
# asm 2: movzbl 12(<in=%esi),>b0=%eax
movzbl 12(%esi),%eax

# qhasm:     b0 ^= z3
# asm 1: xor  <z3=int32#2,<b0=int32#1
# asm 2: xor  <z3=%ecx,<b0=%eax
xor  %ecx,%eax

# qhasm:     *(uint8 *) (out + 12) = b0
# asm 1: movb <b0=int32#1%8,12(<out=int32#6)
# asm 2: movb <b0=%al,12(<out=%edi)
movb %al,12(%edi)

# qhasm:                                 unsigned>? len - 13
# asm 1: cmp  $13,<len=int32#3
# asm 2: cmp  $13,<len=%edx
cmp  $13,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) z3 >>= 8
# asm 1: shr  $8,<z3=int32#2
# asm 2: shr  $8,<z3=%ecx
shr  $8,%ecx

# qhasm:     b1 = *(uint8 *) (in + 13)
# asm 1: movzbl 13(<in=int32#5),>b1=int32#1
# asm 2: movzbl 13(<in=%esi),>b1=%eax
movzbl 13(%esi),%eax

# qhasm:     b1 ^= z3
# asm 1: xor  <z3=int32#2,<b1=int32#1
# asm 2: xor  <z3=%ecx,<b1=%eax
xor  %ecx,%eax

# qhasm:     *(uint8 *) (out + 13) = b1
# asm 1: movb <b1=int32#1%8,13(<out=int32#6)
# asm 2: movb <b1=%al,13(<out=%edi)
movb %al,13(%edi)

# qhasm:                                 unsigned>? len - 14
# asm 1: cmp  $14,<len=int32#3
# asm 2: cmp  $14,<len=%edx
cmp  $14,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     (uint32) z3 >>= 8
# asm 1: shr  $8,<z3=int32#2
# asm 2: shr  $8,<z3=%ecx
shr  $8,%ecx

# qhasm:     b2 = *(uint8 *) (in + 14)
# asm 1: movzbl 14(<in=int32#5),>b2=int32#1
# asm 2: movzbl 14(<in=%esi),>b2=%eax
movzbl 14(%esi),%eax

# qhasm:     b2 ^= z3
# asm 1: xor  <z3=int32#2,<b2=int32#1
# asm 2: xor  <z3=%ecx,<b2=%eax
xor  %ecx,%eax

# qhasm:     *(uint8 *) (out + 14) = b2
# asm 1: movb <b2=int32#1%8,14(<out=int32#6)
# asm 2: movb <b2=%al,14(<out=%edi)
movb %al,14(%edi)

# qhasm:                                 unsigned>? len - 15
# asm 1: cmp  $15,<len=int32#3
# asm 2: cmp  $15,<len=%edx
cmp  $15,%edx
# comment:fp stack unchanged by jump

# qhasm:     goto finishpartialblock if !unsigned>
jbe ._finishpartialblock

# qhasm:     b3 = *(uint8 *) (in + 15)
# asm 1: movzbl 15(<in=int32#5),>b3=int32#1
# asm 2: movzbl 15(<in=%esi),>b3=%eax
movzbl 15(%esi),%eax

# qhasm:     b3 ^= z3
# asm 1: xor  <z3=int32#2,<b3=int32#1
# asm 2: xor  <z3=%ecx,<b3=%eax
xor  %ecx,%eax

# qhasm:     *(uint8 *) (out + 15) = b3
# asm 1: movb <b3=int32#1%8,15(<out=int32#6)
# asm 2: movb <b3=%al,15(<out=%edi)
movb %al,15(%edi)

# qhasm:     *(uint8 *) (out + 15) = z3
# asm 1: movb <z3=int32#2%8,15(<out=int32#6)
# asm 2: movb <z3=%cl,15(<out=%edi)
movb %cl,15(%edi)
# comment:fp stack unchanged by fallthrough

# qhasm: finishpartialblock:
._finishpartialblock:

# qhasm:     y0 = n0
# asm 1: movl <n0=stack32#50,>y0=int32#1
# asm 2: movl <n0=196(%esp),>y0=%eax
movl 196(%esp),%eax

# qhasm:     y1 = n1
# asm 1: movl <n1=stack32#51,>y1=int32#2
# asm 2: movl <n1=200(%esp),>y1=%ecx
movl 200(%esp),%ecx

# qhasm:     y2 = n2
# asm 1: movl <n2=stack32#52,>y2=int32#3
# asm 2: movl <n2=204(%esp),>y2=%edx
movl 204(%esp),%edx

# qhasm:     y3 = n3
# asm 1: movl <n3=stack32#53,>y3=int32#4
# asm 2: movl <n3=208(%esp),>y3=%ebx
movl 208(%esp),%ebx

# qhasm:     y0 += 1
# asm 1: add  $1,<y0=int32#1
# asm 2: add  $1,<y0=%eax
add  $1,%eax
# comment:fp stack unchanged by jump

# qhasm:   goto done
jmp ._done

# qhasm: fullblock:
._fullblock:

# qhasm:   len -= 16
# asm 1: sub  $16,<len=int32#3
# asm 2: sub  $16,<len=%edx
sub  $16,%edx

# qhasm:   len_stack = len
# asm 1: movd <len=int32#3,>len_stack=int3232#4
# asm 2: movd <len=%edx,>len_stack=%mm3
movd %edx,%mm3

# qhasm:   in = in_stack
# asm 1: movd <in_stack=int3232#2,>in=int32#1
# asm 2: movd <in_stack=%mm1,>in=%eax
movd %mm1,%eax

# qhasm:   z0 ^= *(uint32 *) (in + 0)
# asm 1: xorl 0(<in=int32#1),<z0=int32#4
# asm 2: xorl 0(<in=%eax),<z0=%ebx
xorl 0(%eax),%ebx

# qhasm:   z1 ^= *(uint32 *) (in + 4)
# asm 1: xorl 4(<in=int32#1),<z1=int32#7
# asm 2: xorl 4(<in=%eax),<z1=%ebp
xorl 4(%eax),%ebp

# qhasm:   z2 ^= *(uint32 *) (in + 8)
# asm 1: xorl 8(<in=int32#1),<z2=int32#6
# asm 2: xorl 8(<in=%eax),<z2=%edi
xorl 8(%eax),%edi

# qhasm:   z3 ^= *(uint32 *) (in + 12)
# asm 1: xorl 12(<in=int32#1),<z3=int32#5
# asm 2: xorl 12(<in=%eax),<z3=%esi
xorl 12(%eax),%esi

# qhasm:   in += 16
# asm 1: add  $16,<in=int32#1
# asm 2: add  $16,<in=%eax
add  $16,%eax

# qhasm:   in_stack = in
# asm 1: movd <in=int32#1,>in_stack=int3232#2
# asm 2: movd <in=%eax,>in_stack=%mm1
movd %eax,%mm1

# qhasm:   out = out_stack
# asm 1: movd <out_stack=int3232#3,>out=int32#1
# asm 2: movd <out_stack=%mm2,>out=%eax
movd %mm2,%eax

# qhasm:   *(uint32 *) (out + 0) = z0
# asm 1: movl <z0=int32#4,0(<out=int32#1)
# asm 2: movl <z0=%ebx,0(<out=%eax)
movl %ebx,0(%eax)

# qhasm:   *(uint32 *) (out + 4) = z1
# asm 1: movl <z1=int32#7,4(<out=int32#1)
# asm 2: movl <z1=%ebp,4(<out=%eax)
movl %ebp,4(%eax)

# qhasm:   *(uint32 *) (out + 8) = z2
# asm 1: movl <z2=int32#6,8(<out=int32#1)
# asm 2: movl <z2=%edi,8(<out=%eax)
movl %edi,8(%eax)

# qhasm:   *(uint32 *) (out + 12) = z3
# asm 1: movl <z3=int32#5,12(<out=int32#1)
# asm 2: movl <z3=%esi,12(<out=%eax)
movl %esi,12(%eax)

# qhasm:   out += 16
# asm 1: add  $16,<out=int32#1
# asm 2: add  $16,<out=%eax
add  $16,%eax

# qhasm:   out_stack = out
# asm 1: movd <out=int32#1,>out_stack=int3232#3
# asm 2: movd <out=%eax,>out_stack=%mm2
movd %eax,%mm2

# qhasm: nextloop:
._nextloop:

# qhasm:   y0 = n0
# asm 1: movl <n0=stack32#50,>y0=int32#1
# asm 2: movl <n0=196(%esp),>y0=%eax
movl 196(%esp),%eax

# qhasm:   y1 = n1
# asm 1: movl <n1=stack32#51,>y1=int32#2
# asm 2: movl <n1=200(%esp),>y1=%ecx
movl 200(%esp),%ecx

# qhasm:   y2 = n2
# asm 1: movl <n2=stack32#52,>y2=int32#3
# asm 2: movl <n2=204(%esp),>y2=%edx
movl 204(%esp),%edx

# qhasm:   y3 = n3
# asm 1: movl <n3=stack32#53,>y3=int32#4
# asm 2: movl <n3=208(%esp),>y3=%ebx
movl 208(%esp),%ebx

# qhasm:   y0 += 1
# asm 1: add  $1,<y0=int32#1
# asm 2: add  $1,<y0=%eax
add  $1,%eax

# qhasm:   len = len_stack
# asm 1: movd <len_stack=int3232#4,>len=int32#5
# asm 2: movd <len_stack=%mm3,>len=%esi
movd %mm3,%esi

# qhasm:                 unsigned>? len - 0
# asm 1: cmp  $0,<len=int32#5
# asm 2: cmp  $0,<len=%esi
cmp  $0,%esi
# comment:fp stack unchanged by jump

# qhasm:   goto done if !unsigned>
jbe ._done
# comment:fp stack unchanged by jump

# qhasm: goto mainloop
jmp ._mainloop

# qhasm: done:
._done:

# qhasm: c = c_stack
# asm 1: movd <c_stack=int3232#1,>c=int32#5
# asm 2: movd <c_stack=%mm0,>c=%esi
movd %mm0,%esi

# qhasm: *(uint32 *) (c + 56) = y0
# asm 1: movl <y0=int32#1,56(<c=int32#5)
# asm 2: movl <y0=%eax,56(<c=%esi)
movl %eax,56(%esi)

# qhasm: *(uint32 *) (c + 60) = y1
# asm 1: movl <y1=int32#2,60(<c=int32#5)
# asm 2: movl <y1=%ecx,60(<c=%esi)
movl %ecx,60(%esi)

# qhasm: *(uint32 *) (c + 64) = y2
# asm 1: movl <y2=int32#3,64(<c=int32#5)
# asm 2: movl <y2=%edx,64(<c=%esi)
movl %edx,64(%esi)

# qhasm: *(uint32 *) (c + 68) = y3
# asm 1: movl <y3=int32#4,68(<c=int32#5)
# asm 2: movl <y3=%ebx,68(<c=%esi)
movl %ebx,68(%esi)
# comment:fp stack unchanged by fallthrough

# qhasm: nothingtodo:
._nothingtodo:

# qhasm: emms
emms

# qhasm: eax = eax_stack
# asm 1: movl <eax_stack=stack32#1,>eax=int32#1
# asm 2: movl <eax_stack=0(%esp),>eax=%eax
movl 0(%esp),%eax

# qhasm: ebx = ebx_stack
# asm 1: movl <ebx_stack=stack32#2,>ebx=int32#4
# asm 2: movl <ebx_stack=4(%esp),>ebx=%ebx
movl 4(%esp),%ebx

# qhasm: esi = esi_stack
# asm 1: movl <esi_stack=stack32#3,>esi=int32#5
# asm 2: movl <esi_stack=8(%esp),>esi=%esi
movl 8(%esp),%esi

# qhasm: edi = edi_stack
# asm 1: movl <edi_stack=stack32#4,>edi=int32#6
# asm 2: movl <edi_stack=12(%esp),>edi=%edi
movl 12(%esp),%edi

# qhasm: ebp = ebp_stack
# asm 1: movl <ebp_stack=stack32#5,>ebp=int32#7
# asm 2: movl <ebp_stack=16(%esp),>ebp=%ebp
movl 16(%esp),%ebp

# qhasm: leave
add %eax,%esp
ret

# constants
.data
.section .rodata
.p2align 6

aes_constants:
aes_tablex:
.byte 0x00
aes_table2:
.byte 0x63
aes_table1:
.byte 0xa5
aes_table0:
.byte 0xc6
aes_table3:
.long 0xc6a56363
.long 0xf8847c00
.long 0xf8847c7c
.long 0xee997700
.long 0xee997777
.long 0xf68d7b00
.long 0xf68d7b7b
.long 0xff0df200
.long 0xff0df2f2
.long 0xd6bd6b00
.long 0xd6bd6b6b
.long 0xdeb16f00
.long 0xdeb16f6f
.long 0x9154c500
.long 0x9154c5c5
.long 0x60503000
.long 0x60503030
.long 0x02030100
.long 0x02030101
.long 0xcea96700
.long 0xcea96767
.long 0x567d2b00
.long 0x567d2b2b
.long 0xe719fe00
.long 0xe719fefe
.long 0xb562d700
.long 0xb562d7d7
.long 0x4de6ab00
.long 0x4de6abab
.long 0xec9a7600
.long 0xec9a7676
.long 0x8f45ca00
.long 0x8f45caca
.long 0x1f9d8200
.long 0x1f9d8282
.long 0x8940c900
.long 0x8940c9c9
.long 0xfa877d00
.long 0xfa877d7d
.long 0xef15fa00
.long 0xef15fafa
.long 0xb2eb5900
.long 0xb2eb5959
.long 0x8ec94700
.long 0x8ec94747
.long 0xfb0bf000
.long 0xfb0bf0f0
.long 0x41ecad00
.long 0x41ecadad
.long 0xb367d400
.long 0xb367d4d4
.long 0x5ffda200
.long 0x5ffda2a2
.long 0x45eaaf00
.long 0x45eaafaf
.long 0x23bf9c00
.long 0x23bf9c9c
.long 0x53f7a400
.long 0x53f7a4a4
.long 0xe4967200
.long 0xe4967272
.long 0x9b5bc000
.long 0x9b5bc0c0
.long 0x75c2b700
.long 0x75c2b7b7
.long 0xe11cfd00
.long 0xe11cfdfd
.long 0x3dae9300
.long 0x3dae9393
.long 0x4c6a2600
.long 0x4c6a2626
.long 0x6c5a3600
.long 0x6c5a3636
.long 0x7e413f00
.long 0x7e413f3f
.long 0xf502f700
.long 0xf502f7f7
.long 0x834fcc00
.long 0x834fcccc
.long 0x685c3400
.long 0x685c3434
.long 0x51f4a500
.long 0x51f4a5a5
.long 0xd134e500
.long 0xd134e5e5
.long 0xf908f100
.long 0xf908f1f1
.long 0xe2937100
.long 0xe2937171
.long 0xab73d800
.long 0xab73d8d8
.long 0x62533100
.long 0x62533131
.long 0x2a3f1500
.long 0x2a3f1515
.long 0x080c0400
.long 0x080c0404
.long 0x9552c700
.long 0x9552c7c7
.long 0x46652300
.long 0x46652323
.long 0x9d5ec300
.long 0x9d5ec3c3
.long 0x30281800
.long 0x30281818
.long 0x37a19600
.long 0x37a19696
.long 0x0a0f0500
.long 0x0a0f0505
.long 0x2fb59a00
.long 0x2fb59a9a
.long 0x0e090700
.long 0x0e090707
.long 0x24361200
.long 0x24361212
.long 0x1b9b8000
.long 0x1b9b8080
.long 0xdf3de200
.long 0xdf3de2e2
.long 0xcd26eb00
.long 0xcd26ebeb
.long 0x4e692700
.long 0x4e692727
.long 0x7fcdb200
.long 0x7fcdb2b2
.long 0xea9f7500
.long 0xea9f7575
.long 0x121b0900
.long 0x121b0909
.long 0x1d9e8300
.long 0x1d9e8383
.long 0x58742c00
.long 0x58742c2c
.long 0x342e1a00
.long 0x342e1a1a
.long 0x362d1b00
.long 0x362d1b1b
.long 0xdcb26e00
.long 0xdcb26e6e
.long 0xb4ee5a00
.long 0xb4ee5a5a
.long 0x5bfba000
.long 0x5bfba0a0
.long 0xa4f65200
.long 0xa4f65252
.long 0x764d3b00
.long 0x764d3b3b
.long 0xb761d600
.long 0xb761d6d6
.long 0x7dceb300
.long 0x7dceb3b3
.long 0x527b2900
.long 0x527b2929
.long 0xdd3ee300
.long 0xdd3ee3e3
.long 0x5e712f00
.long 0x5e712f2f
.long 0x13978400
.long 0x13978484
.long 0xa6f55300
.long 0xa6f55353
.long 0xb968d100
.long 0xb968d1d1
.long 0x00000000
.long 0x00000000
.long 0xc12ced00
.long 0xc12ceded
.long 0x40602000
.long 0x40602020
.long 0xe31ffc00
.long 0xe31ffcfc
.long 0x79c8b100
.long 0x79c8b1b1
.long 0xb6ed5b00
.long 0xb6ed5b5b
.long 0xd4be6a00
.long 0xd4be6a6a
.long 0x8d46cb00
.long 0x8d46cbcb
.long 0x67d9be00
.long 0x67d9bebe
.long 0x724b3900
.long 0x724b3939
.long 0x94de4a00
.long 0x94de4a4a
.long 0x98d44c00
.long 0x98d44c4c
.long 0xb0e85800
.long 0xb0e85858
.long 0x854acf00
.long 0x854acfcf
.long 0xbb6bd000
.long 0xbb6bd0d0
.long 0xc52aef00
.long 0xc52aefef
.long 0x4fe5aa00
.long 0x4fe5aaaa
.long 0xed16fb00
.long 0xed16fbfb
.long 0x86c54300
.long 0x86c54343
.long 0x9ad74d00
.long 0x9ad74d4d
.long 0x66553300
.long 0x66553333
.long 0x11948500
.long 0x11948585
.long 0x8acf4500
.long 0x8acf4545
.long 0xe910f900
.long 0xe910f9f9
.long 0x04060200
.long 0x04060202
.long 0xfe817f00
.long 0xfe817f7f
.long 0xa0f05000
.long 0xa0f05050
.long 0x78443c00
.long 0x78443c3c
.long 0x25ba9f00
.long 0x25ba9f9f
.long 0x4be3a800
.long 0x4be3a8a8
.long 0xa2f35100
.long 0xa2f35151
.long 0x5dfea300
.long 0x5dfea3a3
.long 0x80c04000
.long 0x80c04040
.long 0x058a8f00
.long 0x058a8f8f
.long 0x3fad9200
.long 0x3fad9292
.long 0x21bc9d00
.long 0x21bc9d9d
.long 0x70483800
.long 0x70483838
.long 0xf104f500
.long 0xf104f5f5
.long 0x63dfbc00
.long 0x63dfbcbc
.long 0x77c1b600
.long 0x77c1b6b6
.long 0xaf75da00
.long 0xaf75dada
.long 0x42632100
.long 0x42632121
.long 0x20301000
.long 0x20301010
.long 0xe51aff00
.long 0xe51affff
.long 0xfd0ef300
.long 0xfd0ef3f3
.long 0xbf6dd200
.long 0xbf6dd2d2
.long 0x814ccd00
.long 0x814ccdcd
.long 0x18140c00
.long 0x18140c0c
.long 0x26351300
.long 0x26351313
.long 0xc32fec00
.long 0xc32fecec
.long 0xbee15f00
.long 0xbee15f5f
.long 0x35a29700
.long 0x35a29797
.long 0x88cc4400
.long 0x88cc4444
.long 0x2e391700
.long 0x2e391717
.long 0x9357c400
.long 0x9357c4c4
.long 0x55f2a700
.long 0x55f2a7a7
.long 0xfc827e00
.long 0xfc827e7e
.long 0x7a473d00
.long 0x7a473d3d
.long 0xc8ac6400
.long 0xc8ac6464
.long 0xbae75d00
.long 0xbae75d5d
.long 0x322b1900
.long 0x322b1919
.long 0xe6957300
.long 0xe6957373
.long 0xc0a06000
.long 0xc0a06060
.long 0x19988100
.long 0x19988181
.long 0x9ed14f00
.long 0x9ed14f4f
.long 0xa37fdc00
.long 0xa37fdcdc
.long 0x44662200
.long 0x44662222
.long 0x547e2a00
.long 0x547e2a2a
.long 0x3bab9000
.long 0x3bab9090
.long 0x0b838800
.long 0x0b838888
.long 0x8cca4600
.long 0x8cca4646
.long 0xc729ee00
.long 0xc729eeee
.long 0x6bd3b800
.long 0x6bd3b8b8
.long 0x283c1400
.long 0x283c1414
.long 0xa779de00
.long 0xa779dede
.long 0xbce25e00
.long 0xbce25e5e
.long 0x161d0b00
.long 0x161d0b0b
.long 0xad76db00
.long 0xad76dbdb
.long 0xdb3be000
.long 0xdb3be0e0
.long 0x64563200
.long 0x64563232
.long 0x744e3a00
.long 0x744e3a3a
.long 0x141e0a00
.long 0x141e0a0a
.long 0x92db4900
.long 0x92db4949
.long 0x0c0a0600
.long 0x0c0a0606
.long 0x486c2400
.long 0x486c2424
.long 0xb8e45c00
.long 0xb8e45c5c
.long 0x9f5dc200
.long 0x9f5dc2c2
.long 0xbd6ed300
.long 0xbd6ed3d3
.long 0x43efac00
.long 0x43efacac
.long 0xc4a66200
.long 0xc4a66262
.long 0x39a89100
.long 0x39a89191
.long 0x31a49500
.long 0x31a49595
.long 0xd337e400
.long 0xd337e4e4
.long 0xf28b7900
.long 0xf28b7979
.long 0xd532e700
.long 0xd532e7e7
.long 0x8b43c800
.long 0x8b43c8c8
.long 0x6e593700
.long 0x6e593737
.long 0xdab76d00
.long 0xdab76d6d
.long 0x018c8d00
.long 0x018c8d8d
.long 0xb164d500
.long 0xb164d5d5
.long 0x9cd24e00
.long 0x9cd24e4e
.long 0x49e0a900
.long 0x49e0a9a9
.long 0xd8b46c00
.long 0xd8b46c6c
.long 0xacfa5600
.long 0xacfa5656
.long 0xf307f400
.long 0xf307f4f4
.long 0xcf25ea00
.long 0xcf25eaea
.long 0xcaaf6500
.long 0xcaaf6565
.long 0xf48e7a00
.long 0xf48e7a7a
.long 0x47e9ae00
.long 0x47e9aeae
.long 0x10180800
.long 0x10180808
.long 0x6fd5ba00
.long 0x6fd5baba
.long 0xf0887800
.long 0xf0887878
.long 0x4a6f2500
.long 0x4a6f2525
.long 0x5c722e00
.long 0x5c722e2e
.long 0x38241c00
.long 0x38241c1c
.long 0x57f1a600
.long 0x57f1a6a6
.long 0x73c7b400
.long 0x73c7b4b4
.long 0x9751c600
.long 0x9751c6c6
.long 0xcb23e800
.long 0xcb23e8e8
.long 0xa17cdd00
.long 0xa17cdddd
.long 0xe89c7400
.long 0xe89c7474
.long 0x3e211f00
.long 0x3e211f1f
.long 0x96dd4b00
.long 0x96dd4b4b
.long 0x61dcbd00
.long 0x61dcbdbd
.long 0x0d868b00
.long 0x0d868b8b
.long 0x0f858a00
.long 0x0f858a8a
.long 0xe0907000
.long 0xe0907070
.long 0x7c423e00
.long 0x7c423e3e
.long 0x71c4b500
.long 0x71c4b5b5
.long 0xccaa6600
.long 0xccaa6666
.long 0x90d84800
.long 0x90d84848
.long 0x06050300
.long 0x06050303
.long 0xf701f600
.long 0xf701f6f6
.long 0x1c120e00
.long 0x1c120e0e
.long 0xc2a36100
.long 0xc2a36161
.long 0x6a5f3500
.long 0x6a5f3535
.long 0xaef95700
.long 0xaef95757
.long 0x69d0b900
.long 0x69d0b9b9
.long 0x17918600
.long 0x17918686
.long 0x9958c100
.long 0x9958c1c1
.long 0x3a271d00
.long 0x3a271d1d
.long 0x27b99e00
.long 0x27b99e9e
.long 0xd938e100
.long 0xd938e1e1
.long 0xeb13f800
.long 0xeb13f8f8
.long 0x2bb39800
.long 0x2bb39898
.long 0x22331100
.long 0x22331111
.long 0xd2bb6900
.long 0xd2bb6969
.long 0xa970d900
.long 0xa970d9d9
.long 0x07898e00
.long 0x07898e8e
.long 0x33a79400
.long 0x33a79494
.long 0x2db69b00
.long 0x2db69b9b
.long 0x3c221e00
.long 0x3c221e1e
.long 0x15928700
.long 0x15928787
.long 0xc920e900
.long 0xc920e9e9
.long 0x8749ce00
.long 0x8749cece
.long 0xaaff5500
.long 0xaaff5555
.long 0x50782800
.long 0x50782828
.long 0xa57adf00
.long 0xa57adfdf
.long 0x038f8c00
.long 0x038f8c8c
.long 0x59f8a100
.long 0x59f8a1a1
.long 0x09808900
.long 0x09808989
.long 0x1a170d00
.long 0x1a170d0d
.long 0x65dabf00
.long 0x65dabfbf
.long 0xd731e600
.long 0xd731e6e6
.long 0x84c64200
.long 0x84c64242
.long 0xd0b86800
.long 0xd0b86868
.long 0x82c34100
.long 0x82c34141
.long 0x29b09900
.long 0x29b09999
.long 0x5a772d00
.long 0x5a772d2d
.long 0x1e110f00
.long 0x1e110f0f
.long 0x7bcbb000
.long 0x7bcbb0b0
.long 0xa8fc5400
.long 0xa8fc5454
.long 0x6dd6bb00
.long 0x6dd6bbbb
.long 0x2c3a1600
.long 0x2c3a1616
