
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

# qhasm: int32 check

# qhasm: int32 x0

# qhasm: int32 x1

# qhasm: int32 x2

# qhasm: int32 x3

# qhasm: int32 e

# qhasm: int32 q0

# qhasm: int32 q1

# qhasm: int32 q2

# qhasm: int32 q3

# qhasm: int32 tmp

# qhasm: int32 mainloopbytes

# qhasm: stack32 mainloopbytes_stack

# qhasm: int32 in

# qhasm: int32 out

# qhasm: int32 len

# qhasm: int32 tmpinp

# qhasm: int32 lentmp

# qhasm: stack32 outsave

# qhasm: int32 inv

# qhasm: int32 outv

# qhasm: int3232 c_stack

# qhasm: int3232 in_stack

# qhasm: int3232 out_stack

# qhasm: int3232 len_stack

# qhasm: int3232 y0_stack

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

# qhasm: stack32 pre10

# qhasm: stack32 pre20

# qhasm: stack32 pre21

# qhasm: stack32 pre22

# qhasm: stack32 pre23

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

# qhasm: stack128 tmpin

# qhasm: enter ECRYPT_init
.text
.p2align 5
.globl _ECRYPT_init
.globl ECRYPT_init
_ECRYPT_init:
ECRYPT_init:
mov %esp,%eax
and $31,%eax
add $288,%eax
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
add $288,%eax
sub %eax,%esp

# qhasm: eax_stack = eax
# asm 1: movl <eax=int32#1,>eax_stack=stack32#1
# asm 2: movl <eax=%eax,>eax_stack=32(%esp)
movl %eax,32(%esp)

# qhasm: ebx_stack = ebx
# asm 1: movl <ebx=int32#4,>ebx_stack=stack32#2
# asm 2: movl <ebx=%ebx,>ebx_stack=36(%esp)
movl %ebx,36(%esp)

# qhasm: esi_stack = esi
# asm 1: movl <esi=int32#5,>esi_stack=stack32#3
# asm 2: movl <esi=%esi,>esi_stack=40(%esp)
movl %esi,40(%esp)

# qhasm: edi_stack = edi
# asm 1: movl <edi=int32#6,>edi_stack=stack32#4
# asm 2: movl <edi=%edi,>edi_stack=44(%esp)
movl %edi,44(%esp)

# qhasm: ebp_stack = ebp
# asm 1: movl <ebp=int32#7,>ebp_stack=stack32#5
# asm 2: movl <ebp=%ebp,>ebp_stack=48(%esp)
movl %ebp,48(%esp)

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
# asm 2: movl <eax_stack=32(%esp),>eax=%eax
movl 32(%esp),%eax

# qhasm: ebx = ebx_stack
# asm 1: movl <ebx_stack=stack32#2,>ebx=int32#4
# asm 2: movl <ebx_stack=36(%esp),>ebx=%ebx
movl 36(%esp),%ebx

# qhasm: esi = esi_stack
# asm 1: movl <esi_stack=stack32#3,>esi=int32#5
# asm 2: movl <esi_stack=40(%esp),>esi=%esi
movl 40(%esp),%esi

# qhasm: edi = edi_stack
# asm 1: movl <edi_stack=stack32#4,>edi=int32#6
# asm 2: movl <edi_stack=44(%esp),>edi=%edi
movl 44(%esp),%edi

# qhasm: ebp = ebp_stack
# asm 1: movl <ebp_stack=stack32#5,>ebp=int32#7
# asm 2: movl <ebp_stack=48(%esp),>ebp=%ebp
movl 48(%esp),%ebp

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
add $288,%eax
sub %eax,%esp

# qhasm: eax_stack = eax
# asm 1: movl <eax=int32#1,>eax_stack=stack32#1
# asm 2: movl <eax=%eax,>eax_stack=32(%esp)
movl %eax,32(%esp)

# qhasm: ebx_stack = ebx
# asm 1: movl <ebx=int32#4,>ebx_stack=stack32#2
# asm 2: movl <ebx=%ebx,>ebx_stack=36(%esp)
movl %ebx,36(%esp)

# qhasm: esi_stack = esi
# asm 1: movl <esi=int32#5,>esi_stack=stack32#3
# asm 2: movl <esi=%esi,>esi_stack=40(%esp)
movl %esi,40(%esp)

# qhasm: edi_stack = edi
# asm 1: movl <edi=int32#6,>edi_stack=stack32#4
# asm 2: movl <edi=%edi,>edi_stack=44(%esp)
movl %edi,44(%esp)

# qhasm: ebp_stack = ebp
# asm 1: movl <ebp=int32#7,>ebp_stack=stack32#5
# asm 2: movl <ebp=%ebp,>ebp_stack=48(%esp)
movl %ebp,48(%esp)

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
# asm 1: xorl <q3=int32#7,<e=int32#6
# asm 2: xorl <q3=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q2=int32#7,<e=int32#6
# asm 2: xorl <q2=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q1=int32#7,<e=int32#6
# asm 2: xorl <q1=%ebp,<e=%edi
xorl %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xorl <e=int32#6,<x0=int32#3
# asm 2: xorl <e=%edi,<x0=%edx
xorl %edi,%edx

# qhasm: *(uint32 *) (c + 16) = x0
# asm 1: movl <x0=int32#3,16(<c=int32#2)
# asm 2: movl <x0=%edx,16(<c=%ecx)
movl %edx,16(%ecx)

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#3,<x1=int32#4
# asm 2: xorl <x0=%edx,<x1=%ebx
xorl %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#4,<x2=int32#5
# asm 2: xorl <x1=%ebx,<x2=%esi
xorl %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#1
# asm 2: xorl <x2=%esi,<x3=%eax
xorl %esi,%eax

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
# asm 1: xorl <q3=int32#7,<e=int32#6
# asm 2: xorl <q3=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q2=int32#7,<e=int32#6
# asm 2: xorl <q2=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q1=int32#7,<e=int32#6
# asm 2: xorl <q1=%ebp,<e=%edi
xorl %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xorl <e=int32#6,<x0=int32#3
# asm 2: xorl <e=%edi,<x0=%edx
xorl %edi,%edx

# qhasm: *(uint32 *) (c + 20) = x0
# asm 1: movl <x0=int32#3,20(<c=int32#2)
# asm 2: movl <x0=%edx,20(<c=%ecx)
movl %edx,20(%ecx)

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#3,<x1=int32#4
# asm 2: xorl <x0=%edx,<x1=%ebx
xorl %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#4,<x2=int32#5
# asm 2: xorl <x1=%ebx,<x2=%esi
xorl %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#1
# asm 2: xorl <x2=%esi,<x3=%eax
xorl %esi,%eax

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
# asm 1: xorl <q3=int32#7,<e=int32#6
# asm 2: xorl <q3=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q2=int32#7,<e=int32#6
# asm 2: xorl <q2=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q1=int32#7,<e=int32#6
# asm 2: xorl <q1=%ebp,<e=%edi
xorl %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xorl <e=int32#6,<x0=int32#3
# asm 2: xorl <e=%edi,<x0=%edx
xorl %edi,%edx

# qhasm: *(uint32 *) (c + 24) = x0
# asm 1: movl <x0=int32#3,24(<c=int32#2)
# asm 2: movl <x0=%edx,24(<c=%ecx)
movl %edx,24(%ecx)

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#3,<x1=int32#4
# asm 2: xorl <x0=%edx,<x1=%ebx
xorl %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#4,<x2=int32#5
# asm 2: xorl <x1=%ebx,<x2=%esi
xorl %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#1
# asm 2: xorl <x2=%esi,<x3=%eax
xorl %esi,%eax

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
# asm 1: xorl <q3=int32#7,<e=int32#6
# asm 2: xorl <q3=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q2=int32#7,<e=int32#6
# asm 2: xorl <q2=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q1=int32#7,<e=int32#6
# asm 2: xorl <q1=%ebp,<e=%edi
xorl %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xorl <e=int32#6,<x0=int32#3
# asm 2: xorl <e=%edi,<x0=%edx
xorl %edi,%edx

# qhasm: *(uint32 *) (c + 28) = x0
# asm 1: movl <x0=int32#3,28(<c=int32#2)
# asm 2: movl <x0=%edx,28(<c=%ecx)
movl %edx,28(%ecx)

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#3,<x1=int32#4
# asm 2: xorl <x0=%edx,<x1=%ebx
xorl %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#4,<x2=int32#5
# asm 2: xorl <x1=%ebx,<x2=%esi
xorl %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#1
# asm 2: xorl <x2=%esi,<x3=%eax
xorl %esi,%eax

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
# asm 1: xorl <q3=int32#7,<e=int32#6
# asm 2: xorl <q3=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q2=int32#7,<e=int32#6
# asm 2: xorl <q2=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q1=int32#7,<e=int32#6
# asm 2: xorl <q1=%ebp,<e=%edi
xorl %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xorl <e=int32#6,<x0=int32#3
# asm 2: xorl <e=%edi,<x0=%edx
xorl %edi,%edx

# qhasm: *(uint32 *) (c + 32) = x0
# asm 1: movl <x0=int32#3,32(<c=int32#2)
# asm 2: movl <x0=%edx,32(<c=%ecx)
movl %edx,32(%ecx)

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#3,<x1=int32#4
# asm 2: xorl <x0=%edx,<x1=%ebx
xorl %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#4,<x2=int32#5
# asm 2: xorl <x1=%ebx,<x2=%esi
xorl %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#1
# asm 2: xorl <x2=%esi,<x3=%eax
xorl %esi,%eax

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
# asm 1: xorl <q3=int32#7,<e=int32#6
# asm 2: xorl <q3=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q2=int32#7,<e=int32#6
# asm 2: xorl <q2=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q1=int32#7,<e=int32#6
# asm 2: xorl <q1=%ebp,<e=%edi
xorl %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xorl <e=int32#6,<x0=int32#3
# asm 2: xorl <e=%edi,<x0=%edx
xorl %edi,%edx

# qhasm: *(uint32 *) (c + 36) = x0
# asm 1: movl <x0=int32#3,36(<c=int32#2)
# asm 2: movl <x0=%edx,36(<c=%ecx)
movl %edx,36(%ecx)

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#3,<x1=int32#4
# asm 2: xorl <x0=%edx,<x1=%ebx
xorl %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#4,<x2=int32#5
# asm 2: xorl <x1=%ebx,<x2=%esi
xorl %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#1
# asm 2: xorl <x2=%esi,<x3=%eax
xorl %esi,%eax

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
# asm 1: xorl <q3=int32#7,<e=int32#6
# asm 2: xorl <q3=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q2=int32#7,<e=int32#6
# asm 2: xorl <q2=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q1=int32#7,<e=int32#6
# asm 2: xorl <q1=%ebp,<e=%edi
xorl %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xorl <e=int32#6,<x0=int32#3
# asm 2: xorl <e=%edi,<x0=%edx
xorl %edi,%edx

# qhasm: *(uint32 *) (c + 40) = x0
# asm 1: movl <x0=int32#3,40(<c=int32#2)
# asm 2: movl <x0=%edx,40(<c=%ecx)
movl %edx,40(%ecx)

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#3,<x1=int32#4
# asm 2: xorl <x0=%edx,<x1=%ebx
xorl %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#4,<x2=int32#5
# asm 2: xorl <x1=%ebx,<x2=%esi
xorl %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#1
# asm 2: xorl <x2=%esi,<x3=%eax
xorl %esi,%eax

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
# asm 1: xorl <q3=int32#7,<e=int32#6
# asm 2: xorl <q3=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q2=int32#7,<e=int32#6
# asm 2: xorl <q2=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q1=int32#7,<e=int32#6
# asm 2: xorl <q1=%ebp,<e=%edi
xorl %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xorl <e=int32#6,<x0=int32#3
# asm 2: xorl <e=%edi,<x0=%edx
xorl %edi,%edx

# qhasm: *(uint32 *) (c + 44) = x0
# asm 1: movl <x0=int32#3,44(<c=int32#2)
# asm 2: movl <x0=%edx,44(<c=%ecx)
movl %edx,44(%ecx)

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#3,<x1=int32#4
# asm 2: xorl <x0=%edx,<x1=%ebx
xorl %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#4,<x2=int32#5
# asm 2: xorl <x1=%ebx,<x2=%esi
xorl %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#1
# asm 2: xorl <x2=%esi,<x3=%eax
xorl %esi,%eax

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
# asm 1: xorl <q3=int32#7,<e=int32#6
# asm 2: xorl <q3=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q2=int32#7,<e=int32#6
# asm 2: xorl <q2=%ebp,<e=%edi
xorl %ebp,%edi

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
# asm 1: xorl <q1=int32#7,<e=int32#6
# asm 2: xorl <q1=%ebp,<e=%edi
xorl %ebp,%edi

# qhasm: x0 ^= e
# asm 1: xorl <e=int32#6,<x0=int32#3
# asm 2: xorl <e=%edi,<x0=%edx
xorl %edi,%edx

# qhasm: *(uint32 *) (c + 48) = x0
# asm 1: movl <x0=int32#3,48(<c=int32#2)
# asm 2: movl <x0=%edx,48(<c=%ecx)
movl %edx,48(%ecx)

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#3,<x1=int32#4
# asm 2: xorl <x0=%edx,<x1=%ebx
xorl %edx,%ebx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#4,<x2=int32#5
# asm 2: xorl <x1=%ebx,<x2=%esi
xorl %ebx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#1
# asm 2: xorl <x2=%esi,<x3=%eax
xorl %esi,%eax

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
# asm 1: xorl <q3=int32#5,<e=int32#4
# asm 2: xorl <q3=%esi,<e=%ebx
xorl %esi,%ebx

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
# asm 1: xorl <q2=int32#5,<e=int32#4
# asm 2: xorl <q2=%esi,<e=%ebx
xorl %esi,%ebx

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
# asm 1: xorl <q1=int32#1,<e=int32#4
# asm 2: xorl <q1=%eax,<e=%ebx
xorl %eax,%ebx

# qhasm: x0 ^= e
# asm 1: xorl <e=int32#4,<x0=int32#3
# asm 2: xorl <e=%ebx,<x0=%edx
xorl %ebx,%edx

# qhasm: *(uint32 *) (c + 52) = x0
# asm 1: movl <x0=int32#3,52(<c=int32#2)
# asm 2: movl <x0=%edx,52(<c=%ecx)
movl %edx,52(%ecx)

# qhasm: eax = eax_stack
# asm 1: movl <eax_stack=stack32#1,>eax=int32#1
# asm 2: movl <eax_stack=32(%esp),>eax=%eax
movl 32(%esp),%eax

# qhasm: ebx = ebx_stack
# asm 1: movl <ebx_stack=stack32#2,>ebx=int32#4
# asm 2: movl <ebx_stack=36(%esp),>ebx=%ebx
movl 36(%esp),%ebx

# qhasm: esi = esi_stack
# asm 1: movl <esi_stack=stack32#3,>esi=int32#5
# asm 2: movl <esi_stack=40(%esp),>esi=%esi
movl 40(%esp),%esi

# qhasm: edi = edi_stack
# asm 1: movl <edi_stack=stack32#4,>edi=int32#6
# asm 2: movl <edi_stack=44(%esp),>edi=%edi
movl 44(%esp),%edi

# qhasm: ebp = ebp_stack
# asm 1: movl <ebp_stack=stack32#5,>ebp=int32#7
# asm 2: movl <ebp_stack=48(%esp),>ebp=%ebp
movl 48(%esp),%ebp

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
add $288,%eax
sub %eax,%esp

# qhasm: eax_stack = eax
# asm 1: movl <eax=int32#1,>eax_stack=stack32#1
# asm 2: movl <eax=%eax,>eax_stack=32(%esp)
movl %eax,32(%esp)

# qhasm: ebx_stack = ebx
# asm 1: movl <ebx=int32#4,>ebx_stack=stack32#2
# asm 2: movl <ebx=%ebx,>ebx_stack=36(%esp)
movl %ebx,36(%esp)

# qhasm: esi_stack = esi
# asm 1: movl <esi=int32#5,>esi_stack=stack32#3
# asm 2: movl <esi=%esi,>esi_stack=40(%esp)
movl %esi,40(%esp)

# qhasm: edi_stack = edi
# asm 1: movl <edi=int32#6,>edi_stack=stack32#4
# asm 2: movl <edi=%edi,>edi_stack=44(%esp)
movl %edi,44(%esp)

# qhasm: ebp_stack = ebp
# asm 1: movl <ebp=int32#7,>ebp_stack=stack32#5
# asm 2: movl <ebp=%ebp,>ebp_stack=48(%esp)
movl %ebp,48(%esp)

# qhasm: c = arg2
# asm 1: movl <arg2=stack32#-2,>c=int32#2
# asm 2: movl <arg2=8(%esp,%eax),>c=%ecx
movl 8(%esp,%eax),%ecx

# qhasm: in = arg3
# asm 1: movl <arg3=stack32#-3,>in=int32#3
# asm 2: movl <arg3=12(%esp,%eax),>in=%edx
movl 12(%esp,%eax),%edx

# qhasm: out = arg4
# asm 1: movl <arg4=stack32#-4,>out=int32#4
# asm 2: movl <arg4=16(%esp,%eax),>out=%ebx
movl 16(%esp,%eax),%ebx

# qhasm: len = arg5
# asm 1: movl <arg5=stack32#-5,>len=int32#1
# asm 2: movl <arg5=20(%esp,%eax),>len=%eax
movl 20(%esp,%eax),%eax

# qhasm: c_stack = c
# asm 1: movd <c=int32#2,>c_stack=int3232#1
# asm 2: movd <c=%ecx,>c_stack=%mm0
movd %ecx,%mm0

# qhasm: in_stack = in
# asm 1: movd <in=int32#3,>in_stack=int3232#2
# asm 2: movd <in=%edx,>in_stack=%mm1
movd %edx,%mm1

# qhasm: out_stack = out
# asm 1: movd <out=int32#4,>out_stack=int3232#3
# asm 2: movd <out=%ebx,>out_stack=%mm2
movd %ebx,%mm2

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
# asm 1: movl 0(<c=int32#2),>x0=int32#1
# asm 2: movl 0(<c=%ecx),>x0=%eax
movl 0(%ecx),%eax

# qhasm: x1 = *(uint32 *) (c + 4)
# asm 1: movl 4(<c=int32#2),>x1=int32#3
# asm 2: movl 4(<c=%ecx),>x1=%edx
movl 4(%ecx),%edx

# qhasm: x2 = *(uint32 *) (c + 8)
# asm 1: movl 8(<c=int32#2),>x2=int32#5
# asm 2: movl 8(<c=%ecx),>x2=%esi
movl 8(%ecx),%esi

# qhasm: x3 = *(uint32 *) (c + 12)
# asm 1: movl 12(<c=int32#2),>x3=int32#6
# asm 2: movl 12(<c=%ecx),>x3=%edi
movl 12(%ecx),%edi

# qhasm: r0 = x0
# asm 1: movl <x0=int32#1,>r0=stack32#6
# asm 2: movl <x0=%eax,>r0=52(%esp)
movl %eax,52(%esp)

# qhasm: r1 = x1
# asm 1: movl <x1=int32#3,>r1=stack32#7
# asm 2: movl <x1=%edx,>r1=56(%esp)
movl %edx,56(%esp)

# qhasm: r2 = x2
# asm 1: movl <x2=int32#5,>r2=stack32#8
# asm 2: movl <x2=%esi,>r2=60(%esp)
movl %esi,60(%esp)

# qhasm: r3 = x3
# asm 1: movl <x3=int32#6,>r3=stack32#9
# asm 2: movl <x3=%edi,>r3=64(%esp)
movl %edi,64(%esp)

# qhasm: x0 = *(uint32 *) (c + 16)
# asm 1: movl 16(<c=int32#2),>x0=int32#1
# asm 2: movl 16(<c=%ecx),>x0=%eax
movl 16(%ecx),%eax

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#1,<x1=int32#3
# asm 2: xorl <x0=%eax,<x1=%edx
xorl %eax,%edx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#3,<x2=int32#5
# asm 2: xorl <x1=%edx,<x2=%esi
xorl %edx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#6
# asm 2: xorl <x2=%esi,<x3=%edi
xorl %esi,%edi

# qhasm: r4 = x0
# asm 1: movl <x0=int32#1,>r4=stack32#10
# asm 2: movl <x0=%eax,>r4=68(%esp)
movl %eax,68(%esp)

# qhasm: r5 = x1
# asm 1: movl <x1=int32#3,>r5=stack32#11
# asm 2: movl <x1=%edx,>r5=72(%esp)
movl %edx,72(%esp)

# qhasm: r6 = x2
# asm 1: movl <x2=int32#5,>r6=stack32#12
# asm 2: movl <x2=%esi,>r6=76(%esp)
movl %esi,76(%esp)

# qhasm: r7 = x3
# asm 1: movl <x3=int32#6,>r7=stack32#13
# asm 2: movl <x3=%edi,>r7=80(%esp)
movl %edi,80(%esp)

# qhasm: x0 = *(uint32 *) (c + 20)
# asm 1: movl 20(<c=int32#2),>x0=int32#1
# asm 2: movl 20(<c=%ecx),>x0=%eax
movl 20(%ecx),%eax

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#1,<x1=int32#3
# asm 2: xorl <x0=%eax,<x1=%edx
xorl %eax,%edx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#3,<x2=int32#5
# asm 2: xorl <x1=%edx,<x2=%esi
xorl %edx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#6
# asm 2: xorl <x2=%esi,<x3=%edi
xorl %esi,%edi

# qhasm: r8 = x0
# asm 1: movl <x0=int32#1,>r8=stack32#14
# asm 2: movl <x0=%eax,>r8=84(%esp)
movl %eax,84(%esp)

# qhasm: r9 = x1
# asm 1: movl <x1=int32#3,>r9=stack32#15
# asm 2: movl <x1=%edx,>r9=88(%esp)
movl %edx,88(%esp)

# qhasm: r10 = x2
# asm 1: movl <x2=int32#5,>r10=stack32#16
# asm 2: movl <x2=%esi,>r10=92(%esp)
movl %esi,92(%esp)

# qhasm: r11 = x3
# asm 1: movl <x3=int32#6,>r11=stack32#17
# asm 2: movl <x3=%edi,>r11=96(%esp)
movl %edi,96(%esp)

# qhasm: x0 = *(uint32 *) (c + 24)
# asm 1: movl 24(<c=int32#2),>x0=int32#1
# asm 2: movl 24(<c=%ecx),>x0=%eax
movl 24(%ecx),%eax

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#1,<x1=int32#3
# asm 2: xorl <x0=%eax,<x1=%edx
xorl %eax,%edx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#3,<x2=int32#5
# asm 2: xorl <x1=%edx,<x2=%esi
xorl %edx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#6
# asm 2: xorl <x2=%esi,<x3=%edi
xorl %esi,%edi

# qhasm: r12 = x0
# asm 1: movl <x0=int32#1,>r12=stack32#18
# asm 2: movl <x0=%eax,>r12=100(%esp)
movl %eax,100(%esp)

# qhasm: r13 = x1
# asm 1: movl <x1=int32#3,>r13=stack32#19
# asm 2: movl <x1=%edx,>r13=104(%esp)
movl %edx,104(%esp)

# qhasm: r14 = x2
# asm 1: movl <x2=int32#5,>r14=stack32#20
# asm 2: movl <x2=%esi,>r14=108(%esp)
movl %esi,108(%esp)

# qhasm: r15 = x3
# asm 1: movl <x3=int32#6,>r15=stack32#21
# asm 2: movl <x3=%edi,>r15=112(%esp)
movl %edi,112(%esp)

# qhasm: x0 = *(uint32 *) (c + 28)
# asm 1: movl 28(<c=int32#2),>x0=int32#1
# asm 2: movl 28(<c=%ecx),>x0=%eax
movl 28(%ecx),%eax

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#1,<x1=int32#3
# asm 2: xorl <x0=%eax,<x1=%edx
xorl %eax,%edx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#3,<x2=int32#5
# asm 2: xorl <x1=%edx,<x2=%esi
xorl %edx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#6
# asm 2: xorl <x2=%esi,<x3=%edi
xorl %esi,%edi

# qhasm: r16 = x0
# asm 1: movl <x0=int32#1,>r16=stack32#22
# asm 2: movl <x0=%eax,>r16=116(%esp)
movl %eax,116(%esp)

# qhasm: r17 = x1
# asm 1: movl <x1=int32#3,>r17=stack32#23
# asm 2: movl <x1=%edx,>r17=120(%esp)
movl %edx,120(%esp)

# qhasm: r18 = x2
# asm 1: movl <x2=int32#5,>r18=stack32#24
# asm 2: movl <x2=%esi,>r18=124(%esp)
movl %esi,124(%esp)

# qhasm: r19 = x3
# asm 1: movl <x3=int32#6,>r19=stack32#25
# asm 2: movl <x3=%edi,>r19=128(%esp)
movl %edi,128(%esp)

# qhasm: x0 = *(uint32 *) (c + 32)
# asm 1: movl 32(<c=int32#2),>x0=int32#1
# asm 2: movl 32(<c=%ecx),>x0=%eax
movl 32(%ecx),%eax

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#1,<x1=int32#3
# asm 2: xorl <x0=%eax,<x1=%edx
xorl %eax,%edx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#3,<x2=int32#5
# asm 2: xorl <x1=%edx,<x2=%esi
xorl %edx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#6
# asm 2: xorl <x2=%esi,<x3=%edi
xorl %esi,%edi

# qhasm: r20 = x0
# asm 1: movl <x0=int32#1,>r20=stack32#26
# asm 2: movl <x0=%eax,>r20=132(%esp)
movl %eax,132(%esp)

# qhasm: r21 = x1
# asm 1: movl <x1=int32#3,>r21=stack32#27
# asm 2: movl <x1=%edx,>r21=136(%esp)
movl %edx,136(%esp)

# qhasm: r22 = x2
# asm 1: movl <x2=int32#5,>r22=stack32#28
# asm 2: movl <x2=%esi,>r22=140(%esp)
movl %esi,140(%esp)

# qhasm: r23 = x3
# asm 1: movl <x3=int32#6,>r23=stack32#29
# asm 2: movl <x3=%edi,>r23=144(%esp)
movl %edi,144(%esp)

# qhasm: x0 = *(uint32 *) (c + 36)
# asm 1: movl 36(<c=int32#2),>x0=int32#1
# asm 2: movl 36(<c=%ecx),>x0=%eax
movl 36(%ecx),%eax

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#1,<x1=int32#3
# asm 2: xorl <x0=%eax,<x1=%edx
xorl %eax,%edx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#3,<x2=int32#5
# asm 2: xorl <x1=%edx,<x2=%esi
xorl %edx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#6
# asm 2: xorl <x2=%esi,<x3=%edi
xorl %esi,%edi

# qhasm: r24 = x0
# asm 1: movl <x0=int32#1,>r24=stack32#30
# asm 2: movl <x0=%eax,>r24=148(%esp)
movl %eax,148(%esp)

# qhasm: r25 = x1
# asm 1: movl <x1=int32#3,>r25=stack32#31
# asm 2: movl <x1=%edx,>r25=152(%esp)
movl %edx,152(%esp)

# qhasm: r26 = x2
# asm 1: movl <x2=int32#5,>r26=stack32#32
# asm 2: movl <x2=%esi,>r26=156(%esp)
movl %esi,156(%esp)

# qhasm: r27 = x3
# asm 1: movl <x3=int32#6,>r27=stack32#33
# asm 2: movl <x3=%edi,>r27=160(%esp)
movl %edi,160(%esp)

# qhasm: x0 = *(uint32 *) (c + 40)
# asm 1: movl 40(<c=int32#2),>x0=int32#1
# asm 2: movl 40(<c=%ecx),>x0=%eax
movl 40(%ecx),%eax

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#1,<x1=int32#3
# asm 2: xorl <x0=%eax,<x1=%edx
xorl %eax,%edx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#3,<x2=int32#5
# asm 2: xorl <x1=%edx,<x2=%esi
xorl %edx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#6
# asm 2: xorl <x2=%esi,<x3=%edi
xorl %esi,%edi

# qhasm: r28 = x0
# asm 1: movl <x0=int32#1,>r28=stack32#34
# asm 2: movl <x0=%eax,>r28=164(%esp)
movl %eax,164(%esp)

# qhasm: r29 = x1
# asm 1: movl <x1=int32#3,>r29=stack32#35
# asm 2: movl <x1=%edx,>r29=168(%esp)
movl %edx,168(%esp)

# qhasm: r30 = x2
# asm 1: movl <x2=int32#5,>r30=stack32#36
# asm 2: movl <x2=%esi,>r30=172(%esp)
movl %esi,172(%esp)

# qhasm: r31 = x3
# asm 1: movl <x3=int32#6,>r31=stack32#37
# asm 2: movl <x3=%edi,>r31=176(%esp)
movl %edi,176(%esp)

# qhasm: x0 = *(uint32 *) (c + 44)
# asm 1: movl 44(<c=int32#2),>x0=int32#1
# asm 2: movl 44(<c=%ecx),>x0=%eax
movl 44(%ecx),%eax

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#1,<x1=int32#3
# asm 2: xorl <x0=%eax,<x1=%edx
xorl %eax,%edx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#3,<x2=int32#5
# asm 2: xorl <x1=%edx,<x2=%esi
xorl %edx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#6
# asm 2: xorl <x2=%esi,<x3=%edi
xorl %esi,%edi

# qhasm: r32 = x0
# asm 1: movl <x0=int32#1,>r32=stack32#38
# asm 2: movl <x0=%eax,>r32=180(%esp)
movl %eax,180(%esp)

# qhasm: r33 = x1
# asm 1: movl <x1=int32#3,>r33=stack32#39
# asm 2: movl <x1=%edx,>r33=184(%esp)
movl %edx,184(%esp)

# qhasm: r34 = x2
# asm 1: movl <x2=int32#5,>r34=stack32#40
# asm 2: movl <x2=%esi,>r34=188(%esp)
movl %esi,188(%esp)

# qhasm: r35 = x3
# asm 1: movl <x3=int32#6,>r35=stack32#41
# asm 2: movl <x3=%edi,>r35=192(%esp)
movl %edi,192(%esp)

# qhasm: x0 = *(uint32 *) (c + 48)
# asm 1: movl 48(<c=int32#2),>x0=int32#1
# asm 2: movl 48(<c=%ecx),>x0=%eax
movl 48(%ecx),%eax

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#1,<x1=int32#3
# asm 2: xorl <x0=%eax,<x1=%edx
xorl %eax,%edx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#3,<x2=int32#5
# asm 2: xorl <x1=%edx,<x2=%esi
xorl %edx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#6
# asm 2: xorl <x2=%esi,<x3=%edi
xorl %esi,%edi

# qhasm: r36 = x0
# asm 1: movl <x0=int32#1,>r36=stack32#42
# asm 2: movl <x0=%eax,>r36=196(%esp)
movl %eax,196(%esp)

# qhasm: r37 = x1
# asm 1: movl <x1=int32#3,>r37=stack32#43
# asm 2: movl <x1=%edx,>r37=200(%esp)
movl %edx,200(%esp)

# qhasm: r38 = x2
# asm 1: movl <x2=int32#5,>r38=stack32#44
# asm 2: movl <x2=%esi,>r38=204(%esp)
movl %esi,204(%esp)

# qhasm: r39 = x3
# asm 1: movl <x3=int32#6,>r39=stack32#45
# asm 2: movl <x3=%edi,>r39=208(%esp)
movl %edi,208(%esp)

# qhasm: x0 = *(uint32 *) (c + 52)
# asm 1: movl 52(<c=int32#2),>x0=int32#1
# asm 2: movl 52(<c=%ecx),>x0=%eax
movl 52(%ecx),%eax

# qhasm: x1 ^= x0
# asm 1: xorl <x0=int32#1,<x1=int32#3
# asm 2: xorl <x0=%eax,<x1=%edx
xorl %eax,%edx

# qhasm: x2 ^= x1
# asm 1: xorl <x1=int32#3,<x2=int32#5
# asm 2: xorl <x1=%edx,<x2=%esi
xorl %edx,%esi

# qhasm: x3 ^= x2
# asm 1: xorl <x2=int32#5,<x3=int32#6
# asm 2: xorl <x2=%esi,<x3=%edi
xorl %esi,%edi

# qhasm: r40 = x0
# asm 1: movl <x0=int32#1,>r40=stack32#46
# asm 2: movl <x0=%eax,>r40=212(%esp)
movl %eax,212(%esp)

# qhasm: r41 = x1
# asm 1: movl <x1=int32#3,>r41=stack32#47
# asm 2: movl <x1=%edx,>r41=216(%esp)
movl %edx,216(%esp)

# qhasm: r42 = x2
# asm 1: movl <x2=int32#5,>r42=stack32#48
# asm 2: movl <x2=%esi,>r42=220(%esp)
movl %esi,220(%esp)

# qhasm: r43 = x3
# asm 1: movl <x3=int32#6,>r43=stack32#49
# asm 2: movl <x3=%edi,>r43=224(%esp)
movl %edi,224(%esp)

# qhasm: y0 = *(uint32 *) (c + 56)
# asm 1: movl 56(<c=int32#2),>y0=int32#1
# asm 2: movl 56(<c=%ecx),>y0=%eax
movl 56(%ecx),%eax

# qhasm: y1 = *(uint32 *) (c + 60)
# asm 1: movl 60(<c=int32#2),>y1=int32#3
# asm 2: movl 60(<c=%ecx),>y1=%edx
movl 60(%ecx),%edx

# qhasm: y2 = *(uint32 *) (c + 64)
# asm 1: movl 64(<c=int32#2),>y2=int32#5
# asm 2: movl 64(<c=%ecx),>y2=%esi
movl 64(%ecx),%esi

# qhasm: y3 = *(uint32 *) (c + 68)
# asm 1: movl 68(<c=int32#2),>y3=int32#2
# asm 2: movl 68(<c=%ecx),>y3=%ecx
movl 68(%ecx),%ecx

# qhasm: n0 = y0
# asm 1: movl <y0=int32#1,>n0=stack32#50
# asm 2: movl <y0=%eax,>n0=228(%esp)
movl %eax,228(%esp)

# qhasm: n1 = y1
# asm 1: movl <y1=int32#3,>n1=stack32#51
# asm 2: movl <y1=%edx,>n1=232(%esp)
movl %edx,232(%esp)

# qhasm: n2 = y2
# asm 1: movl <y2=int32#5,>n2=stack32#52
# asm 2: movl <y2=%esi,>n2=236(%esp)
movl %esi,236(%esp)

# qhasm: n3 = y3
# asm 1: movl <y3=int32#2,>n3=stack32#53
# asm 2: movl <y3=%ecx,>n3=240(%esp)
movl %ecx,240(%esp)

# qhasm: len = len_stack
# asm 1: movd <len_stack=int3232#4,>len=int32#2
# asm 2: movd <len_stack=%mm3,>len=%ecx
movd %mm3,%ecx

# qhasm: unsigned<? len - 16
# asm 1: cmp  $16,<len=int32#2
# asm 2: cmp  $16,<len=%ecx
cmp  $16,%ecx
# comment:fp stack unchanged by jump

# qhasm: goto outerloop if !unsigned<
jae ._outerloop

# qhasm: tmpinp = &tmpin
# asm 1: leal <tmpin=stack128#1,>tmpinp=int32#6
# asm 2: leal <tmpin=0(%esp),>tmpinp=%edi
leal 0(%esp),%edi

# qhasm: lentmp = len_stack
# asm 1: movd <len_stack=int3232#4,>lentmp=int32#2
# asm 2: movd <len_stack=%mm3,>lentmp=%ecx
movd %mm3,%ecx

# qhasm: outsave = out
# asm 1: movl <out=int32#4,>outsave=stack32#54
# asm 2: movl <out=%ebx,>outsave=244(%esp)
movl %ebx,244(%esp)

# qhasm: in = in_stack
# asm 1: movd <in_stack=int3232#2,>in=int32#5
# asm 2: movd <in_stack=%mm1,>in=%esi
movd %mm1,%esi

# qhasm: while (lentmp) { *tmpinp++ = *in++; --lentmp }
rep movsb

# qhasm: in = &tmpin
# asm 1: leal <tmpin=stack128#1,>in=int32#2
# asm 2: leal <tmpin=0(%esp),>in=%ecx
leal 0(%esp),%ecx

# qhasm: out = &tmpin
# asm 1: leal <tmpin=stack128#1,>out=int32#3
# asm 2: leal <tmpin=0(%esp),>out=%edx
leal 0(%esp),%edx

# qhasm: in_stack = in
# asm 1: movd <in=int32#2,>in_stack=int3232#2
# asm 2: movd <in=%ecx,>in_stack=%mm1
movd %ecx,%mm1

# qhasm: out_stack = out
# asm 1: movd <out=int32#3,>out_stack=int3232#3
# asm 2: movd <out=%edx,>out_stack=%mm2
movd %edx,%mm2

# qhasm: mainloopbytes = 16
# asm 1: mov  $16,>mainloopbytes=int32#2
# asm 2: mov  $16,>mainloopbytes=%ecx
mov  $16,%ecx

# qhasm: len = len_stack
# asm 1: movd <len_stack=int3232#4,>len=int32#3
# asm 2: movd <len_stack=%mm3,>len=%edx
movd %mm3,%edx

# qhasm: len -= 16
# asm 1: sub  $16,<len=int32#3
# asm 2: sub  $16,<len=%edx
sub  $16,%edx

# qhasm: len_stack = len
# asm 1: movd <len=int32#3,>len_stack=int3232#4
# asm 2: movd <len=%edx,>len_stack=%mm3
movd %edx,%mm3

# qhasm: mainloopbytes_stack = mainloopbytes
# asm 1: movl <mainloopbytes=int32#2,>mainloopbytes_stack=stack32#55
# asm 2: movl <mainloopbytes=%ecx,>mainloopbytes_stack=248(%esp)
movl %ecx,248(%esp)
# comment:fp stack unchanged by jump

# qhasm: goto precompute
jmp ._precompute

# qhasm: outerloop:
._outerloop:

# qhasm:   tmp = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>tmp=int32#2
# asm 2: movzbl <y0=%al,>tmp=%ecx
movzbl %al,%ecx

# qhasm:   tmp <<= 4
# asm 1: shl  $4,<tmp=int32#2
# asm 2: shl  $4,<tmp=%ecx
shl  $4,%ecx

# qhasm:   mainloopbytes = 4096
# asm 1: mov  $4096,>mainloopbytes=int32#3
# asm 2: mov  $4096,>mainloopbytes=%edx
mov  $4096,%edx

# qhasm:   mainloopbytes -= tmp
# asm 1: subl <tmp=int32#2,<mainloopbytes=int32#3
# asm 2: subl <tmp=%ecx,<mainloopbytes=%edx
subl %ecx,%edx

# qhasm:   len = len_stack
# asm 1: movd <len_stack=int3232#4,>len=int32#2
# asm 2: movd <len_stack=%mm3,>len=%ecx
movd %mm3,%ecx

# qhasm:   unsigned<? len - mainloopbytes
# asm 1: cmp  <mainloopbytes=int32#3,<len=int32#2
# asm 2: cmp  <mainloopbytes=%edx,<len=%ecx
cmp  %edx,%ecx
# comment:fp stack unchanged by jump

# qhasm:   goto happy if !unsigned<
jae ._happy

# qhasm:     mainloopbytes = len
# asm 1: mov  <len=int32#2,>mainloopbytes=int32#3
# asm 2: mov  <len=%ecx,>mainloopbytes=%edx
mov  %ecx,%edx

# qhasm:     (uint32) mainloopbytes >>= 4
# asm 1: shr  $4,<mainloopbytes=int32#3
# asm 2: shr  $4,<mainloopbytes=%edx
shr  $4,%edx

# qhasm:     mainloopbytes <<= 4
# asm 1: shl  $4,<mainloopbytes=int32#3
# asm 2: shl  $4,<mainloopbytes=%edx
shl  $4,%edx
# comment:fp stack unchanged by fallthrough

# qhasm:   happy:
._happy:

# qhasm:   mainloopbytes_stack = mainloopbytes
# asm 1: movl <mainloopbytes=int32#3,>mainloopbytes_stack=stack32#55
# asm 2: movl <mainloopbytes=%edx,>mainloopbytes_stack=248(%esp)
movl %edx,248(%esp)

# qhasm:   len -= mainloopbytes
# asm 1: subl <mainloopbytes=int32#3,<len=int32#2
# asm 2: subl <mainloopbytes=%edx,<len=%ecx
subl %edx,%ecx

# qhasm:   len_stack = len
# asm 1: movd <len=int32#2,>len_stack=int3232#4
# asm 2: movd <len=%ecx,>len_stack=%mm3
movd %ecx,%mm3

# qhasm:   precompute:
._precompute:

# qhasm:   y1 = n1
# asm 1: movl <n1=stack32#51,>y1=int32#2
# asm 2: movl <n1=232(%esp),>y1=%ecx
movl 232(%esp),%ecx

# qhasm:   y2 = n2
# asm 1: movl <n2=stack32#52,>y2=int32#3
# asm 2: movl <n2=236(%esp),>y2=%edx
movl 236(%esp),%edx

# qhasm:   y3 = n3
# asm 1: movl <n3=stack32#53,>y3=int32#4
# asm 2: movl <n3=240(%esp),>y3=%ebx
movl 240(%esp),%ebx

# qhasm:   y0 ^= r0
# asm 1: xorl <r0=stack32#6,<y0=int32#1
# asm 2: xorl <r0=52(%esp),<y0=%eax
xorl 52(%esp),%eax

# qhasm:   y1 ^= r1
# asm 1: xorl <r1=stack32#7,<y1=int32#2
# asm 2: xorl <r1=56(%esp),<y1=%ecx
xorl 56(%esp),%ecx

# qhasm:   y2 ^= r2
# asm 1: xorl <r2=stack32#8,<y2=int32#3
# asm 2: xorl <r2=60(%esp),<y2=%edx
xorl 60(%esp),%edx

# qhasm:   y3 ^= r3
# asm 1: xorl <r3=stack32#9,<y3=int32#4
# asm 2: xorl <r3=64(%esp),<y3=%ebx
xorl 64(%esp),%ebx

# qhasm:   y0_stack = y0
# asm 1: movd <y0=int32#1,>y0_stack=int3232#5
# asm 2: movd <y0=%eax,>y0_stack=%mm4
movd %eax,%mm4

# qhasm:   p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:   z1 = *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: movl aes_table0(,<p10=int32#1,8),>z1=int32#5
# asm 2: movl aes_table0(,<p10=%eax,8),>z1=%esi
movl aes_table0(,%eax,8),%esi

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:   z0 = *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: movl aes_table1(,<p11=int32#1,8),>z0=int32#6
# asm 2: movl aes_table1(,<p11=%eax,8),>z0=%edi
movl aes_table1(,%eax,8),%edi

# qhasm:   y1 <<<= 16
# asm 1: rol  $16,<y1=int32#2
# asm 2: rol  $16,<y1=%ecx
rol  $16,%ecx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:   z3 = *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: movl aes_table2(,<p12=int32#1,8),>z3=int32#7
# asm 2: movl aes_table2(,<p12=%eax,8),>z3=%ebp
movl aes_table2(,%eax,8),%ebp

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:   z2 = *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: movl aes_table3(,<p13=int32#1,8),>z2=int32#2
# asm 2: movl aes_table3(,<p13=%eax,8),>z2=%ecx
movl aes_table3(,%eax,8),%ecx

# qhasm:   p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#1
# asm 2: movzbl <y2=%dl,>p20=%eax
movzbl %dl,%eax

# qhasm:   z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#1,8),<z2=int32#2
# asm 2: xorl aes_table0(,<p20=%eax,8),<z2=%ecx
xorl aes_table0(,%eax,8),%ecx

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#1
# asm 2: movzbl <y2=%dh,>p21=%eax
movzbl %dh,%eax

# qhasm:   z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#1,8),<z1=int32#5
# asm 2: xorl aes_table1(,<p21=%eax,8),<z1=%esi
xorl aes_table1(,%eax,8),%esi

# qhasm:   y2 <<<= 16
# asm 1: rol  $16,<y2=int32#3
# asm 2: rol  $16,<y2=%edx
rol  $16,%edx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#1
# asm 2: movzbl <y2=%dl,>p22=%eax
movzbl %dl,%eax

# qhasm:   z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#1,8),<z0=int32#6
# asm 2: xorl aes_table2(,<p22=%eax,8),<z0=%edi
xorl aes_table2(,%eax,8),%edi

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#1
# asm 2: movzbl <y2=%dh,>p23=%eax
movzbl %dh,%eax

# qhasm:   z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#1,8),<z3=int32#7
# asm 2: xorl aes_table3(,<p23=%eax,8),<z3=%ebp
xorl aes_table3(,%eax,8),%ebp

# qhasm:   y0 = y0_stack
# asm 1: movd <y0_stack=int3232#5,>y0=int32#1
# asm 2: movd <y0_stack=%mm4,>y0=%eax
movd %mm4,%eax

# qhasm:   p30 = y3 & 255
# asm 1: movzbl <y3=int32#4%8,>p30=int32#3
# asm 2: movzbl <y3=%bl,>p30=%edx
movzbl %bl,%edx

# qhasm:   z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#3,8),<z3=int32#7
# asm 2: xorl aes_table0(,<p30=%edx,8),<z3=%ebp
xorl aes_table0(,%edx,8),%ebp

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#4%next8,>p31=int32#3
# asm 2: movzbl <y3=%bh,>p31=%edx
movzbl %bh,%edx

# qhasm:   z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#3,8),<z2=int32#2
# asm 2: xorl aes_table1(,<p31=%edx,8),<z2=%ecx
xorl aes_table1(,%edx,8),%ecx

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#4
# asm 2: shr  $16,<y3=%ebx
shr  $16,%ebx

# qhasm:   p32 = y3 & 255
# asm 1: movzbl <y3=int32#4%8,>p32=int32#3
# asm 2: movzbl <y3=%bl,>p32=%edx
movzbl %bl,%edx

# qhasm:   z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#3,8),<z1=int32#5
# asm 2: xorl aes_table2(,<p32=%edx,8),<z1=%esi
xorl aes_table2(,%edx,8),%esi

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#4%next8,>p33=int32#3
# asm 2: movzbl <y3=%bh,>p33=%edx
movzbl %bh,%edx

# qhasm:   z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#3,8),<z0=int32#6
# asm 2: xorl aes_table3(,<p33=%edx,8),<z0=%edi
xorl aes_table3(,%edx,8),%edi

# qhasm:   p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#3
# asm 2: movzbl <y0=%ah,>p03=%edx
movzbl %ah,%edx

# qhasm:   y0 <<<= 16
# asm 1: rol  $16,<y0=int32#1
# asm 2: rol  $16,<y0=%eax
rol  $16,%eax

# qhasm:   z3 ^= *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: xorl aes_table1(,<p03=int32#3,8),<z3=int32#7
# asm 2: xorl aes_table1(,<p03=%edx,8),<z3=%ebp
xorl aes_table1(,%edx,8),%ebp

# qhasm:   p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#3
# asm 2: movzbl <y0=%al,>p02=%edx
movzbl %al,%edx

# qhasm:   z2 ^= *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: xorl aes_table2(,<p02=int32#3,8),<z2=int32#2
# asm 2: xorl aes_table2(,<p02=%edx,8),<z2=%ecx
xorl aes_table2(,%edx,8),%ecx

# qhasm:   p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#3
# asm 2: movzbl <y0=%ah,>p01=%edx
movzbl %ah,%edx

# qhasm:   z1 ^= *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: xorl aes_table3(,<p01=int32#3,8),<z1=int32#5
# asm 2: xorl aes_table3(,<p01=%edx,8),<z1=%esi
xorl aes_table3(,%edx,8),%esi

# qhasm:   y0 <<<= 16
# asm 1: rol  $16,<y0=int32#1
# asm 2: rol  $16,<y0=%eax
rol  $16,%eax

# qhasm:   y1 = r5
# asm 1: movl <r5=stack32#11,>y1=int32#3
# asm 2: movl <r5=72(%esp),>y1=%edx
movl 72(%esp),%edx

# qhasm:   y1 ^= z1
# asm 1: xorl <z1=int32#5,<y1=int32#3
# asm 2: xorl <z1=%esi,<y1=%edx
xorl %esi,%edx

# qhasm:   y2 = r6
# asm 1: movl <r6=stack32#12,>y2=int32#4
# asm 2: movl <r6=76(%esp),>y2=%ebx
movl 76(%esp),%ebx

# qhasm:   y2 ^= z2
# asm 1: xorl <z2=int32#2,<y2=int32#4
# asm 2: xorl <z2=%ecx,<y2=%ebx
xorl %ecx,%ebx

# qhasm:   y3 = r7
# asm 1: movl <r7=stack32#13,>y3=int32#2
# asm 2: movl <r7=80(%esp),>y3=%ecx
movl 80(%esp),%ecx

# qhasm:   y3 ^= z3
# asm 1: xorl <z3=int32#7,<y3=int32#2
# asm 2: xorl <z3=%ebp,<y3=%ecx
xorl %ebp,%ecx

# qhasm:   z0 ^= r4
# asm 1: xorl <r4=stack32#10,<z0=int32#6
# asm 2: xorl <r4=68(%esp),<z0=%edi
xorl 68(%esp),%edi

# qhasm:   pre10 = z0
# asm 1: movl <z0=int32#6,>pre10=stack32#56
# asm 2: movl <z0=%edi,>pre10=252(%esp)
movl %edi,252(%esp)

# qhasm:   y2_stack = y2
# asm 1: movd <y2=int32#4,>y2_stack=int3232#5
# asm 2: movd <y2=%ebx,>y2_stack=%mm4
movd %ebx,%mm4

# qhasm:   p30 = y3 & 255
# asm 1: movzbl <y3=int32#2%8,>p30=int32#4
# asm 2: movzbl <y3=%cl,>p30=%ebx
movzbl %cl,%ebx

# qhasm:   z3 = *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: movl aes_table0(,<p30=int32#4,8),>z3=int32#4
# asm 2: movl aes_table0(,<p30=%ebx,8),>z3=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:   p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#2%next8,>p31=int32#5
# asm 2: movzbl <y3=%ch,>p31=%esi
movzbl %ch,%esi

# qhasm:   z2 = *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: movl aes_table1(,<p31=int32#5,8),>z2=int32#5
# asm 2: movl aes_table1(,<p31=%esi,8),>z2=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:   (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#2
# asm 2: shr  $16,<y3=%ecx
shr  $16,%ecx

# qhasm:   p32 = y3 & 255
# asm 1: movzbl <y3=int32#2%8,>p32=int32#6
# asm 2: movzbl <y3=%cl,>p32=%edi
movzbl %cl,%edi

# qhasm:   z1 = *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: movl aes_table2(,<p32=int32#6,8),>z1=int32#6
# asm 2: movl aes_table2(,<p32=%edi,8),>z1=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:   p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#2%next8,>p33=int32#2
# asm 2: movzbl <y3=%ch,>p33=%ecx
movzbl %ch,%ecx

# qhasm:   z0 = *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: movl aes_table3(,<p33=int32#2,8),>z0=int32#7
# asm 2: movl aes_table3(,<p33=%ecx,8),>z0=%ebp
movl aes_table3(,%ecx,8),%ebp

# qhasm:   p10 = y1 & 255
# asm 1: movzbl <y1=int32#3%8,>p10=int32#2
# asm 2: movzbl <y1=%dl,>p10=%ecx
movzbl %dl,%ecx

# qhasm:   z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#2,8),<z1=int32#6
# asm 2: xorl aes_table0(,<p10=%ecx,8),<z1=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:   p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#3%next8,>p11=int32#2
# asm 2: movzbl <y1=%dh,>p11=%ecx
movzbl %dh,%ecx

# qhasm:   z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#2,8),<z0=int32#7
# asm 2: xorl aes_table1(,<p11=%ecx,8),<z0=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:   (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#3
# asm 2: shr  $16,<y1=%edx
shr  $16,%edx

# qhasm:   p12 = y1 & 255
# asm 1: movzbl <y1=int32#3%8,>p12=int32#2
# asm 2: movzbl <y1=%dl,>p12=%ecx
movzbl %dl,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#2,8),<z3=int32#4
# asm 2: xorl aes_table2(,<p12=%ecx,8),<z3=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:   p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#3%next8,>p13=int32#2
# asm 2: movzbl <y1=%dh,>p13=%ecx
movzbl %dh,%ecx

# qhasm:   z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#2,8),<z2=int32#5
# asm 2: xorl aes_table3(,<p13=%ecx,8),<z2=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:   y2 = y2_stack
# asm 1: movd <y2_stack=int3232#5,>y2=int32#2
# asm 2: movd <y2_stack=%mm4,>y2=%ecx
movd %mm4,%ecx

# qhasm:   p20 = y2 & 255
# asm 1: movzbl <y2=int32#2%8,>p20=int32#3
# asm 2: movzbl <y2=%cl,>p20=%edx
movzbl %cl,%edx

# qhasm:   z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#3,8),<z2=int32#5
# asm 2: xorl aes_table0(,<p20=%edx,8),<z2=%esi
xorl aes_table0(,%edx,8),%esi

# qhasm:   p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#2%next8,>p21=int32#3
# asm 2: movzbl <y2=%ch,>p21=%edx
movzbl %ch,%edx

# qhasm:   z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#3,8),<z1=int32#6
# asm 2: xorl aes_table1(,<p21=%edx,8),<z1=%edi
xorl aes_table1(,%edx,8),%edi

# qhasm:   (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#2
# asm 2: shr  $16,<y2=%ecx
shr  $16,%ecx

# qhasm:   p22 = y2 & 255
# asm 1: movzbl <y2=int32#2%8,>p22=int32#3
# asm 2: movzbl <y2=%cl,>p22=%edx
movzbl %cl,%edx

# qhasm:   z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#3,8),<z0=int32#7
# asm 2: xorl aes_table2(,<p22=%edx,8),<z0=%ebp
xorl aes_table2(,%edx,8),%ebp

# qhasm:   p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#2%next8,>p23=int32#2
# asm 2: movzbl <y2=%ch,>p23=%ecx
movzbl %ch,%ecx

# qhasm:   z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#4
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%ebx
xorl aes_table3(,%ecx,8),%ebx

# qhasm:   z0 ^= r8
# asm 1: xorl <r8=stack32#14,<z0=int32#7
# asm 2: xorl <r8=84(%esp),<z0=%ebp
xorl 84(%esp),%ebp

# qhasm:   z1 ^= r9
# asm 1: xorl <r9=stack32#15,<z1=int32#6
# asm 2: xorl <r9=88(%esp),<z1=%edi
xorl 88(%esp),%edi

# qhasm:   z2 ^= r10
# asm 1: xorl <r10=stack32#16,<z2=int32#5
# asm 2: xorl <r10=92(%esp),<z2=%esi
xorl 92(%esp),%esi

# qhasm:   z3 ^= r11
# asm 1: xorl <r11=stack32#17,<z3=int32#4
# asm 2: xorl <r11=96(%esp),<z3=%ebx
xorl 96(%esp),%ebx

# qhasm:   pre20 = z0
# asm 1: movl <z0=int32#7,>pre20=stack32#57
# asm 2: movl <z0=%ebp,>pre20=256(%esp)
movl %ebp,256(%esp)

# qhasm:   pre21 = z1
# asm 1: movl <z1=int32#6,>pre21=stack32#58
# asm 2: movl <z1=%edi,>pre21=260(%esp)
movl %edi,260(%esp)

# qhasm:   pre22 = z2
# asm 1: movl <z2=int32#5,>pre22=stack32#59
# asm 2: movl <z2=%esi,>pre22=264(%esp)
movl %esi,264(%esp)

# qhasm:   pre23 = z3
# asm 1: movl <z3=int32#4,>pre23=stack32#60
# asm 2: movl <z3=%ebx,>pre23=268(%esp)
movl %ebx,268(%esp)

# qhasm:   y0 ^= r0
# asm 1: xorl <r0=stack32#6,<y0=int32#1
# asm 2: xorl <r0=52(%esp),<y0=%eax
xorl 52(%esp),%eax

# qhasm:   mainloop:
._mainloop:

# qhasm:     y0 ^= r0
# asm 1: xorl <r0=stack32#6,<y0=int32#1
# asm 2: xorl <r0=52(%esp),<y0=%eax
xorl 52(%esp),%eax

# qhasm:     p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#1
# asm 2: movzbl <y0=%al,>p00=%eax
movzbl %al,%eax

# qhasm:     z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#1,8),>z0=int32#1
# asm 2: movl aes_table0(,<p00=%eax,8),>z0=%eax
movl aes_table0(,%eax,8),%eax

# qhasm:     z0 ^= pre10
# asm 1: xorl <pre10=stack32#56,<z0=int32#1
# asm 2: xorl <pre10=252(%esp),<z0=%eax
xorl 252(%esp),%eax

# qhasm:     p00 = z0 & 255
# asm 1: movzbl <z0=int32#1%8,>p00=int32#2
# asm 2: movzbl <z0=%al,>p00=%ecx
movzbl %al,%ecx

# qhasm:     y0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#2,8),>y0=int32#2
# asm 2: movl aes_table0(,<p00=%ecx,8),>y0=%ecx
movl aes_table0(,%ecx,8),%ecx

# qhasm:     p03 = (z0 >> 8) & 255
# asm 1: movzbl <z0=int32#1%next8,>p03=int32#3
# asm 2: movzbl <z0=%ah,>p03=%edx
movzbl %ah,%edx

# qhasm:     (uint32) z0 >>= 16
# asm 1: shr  $16,<z0=int32#1
# asm 2: shr  $16,<z0=%eax
shr  $16,%eax

# qhasm:     y3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#3,8),>y3=int32#4
# asm 2: movl aes_table1(,<p03=%edx,8),>y3=%ebx
movl aes_table1(,%edx,8),%ebx

# qhasm:     p02 = z0 & 255
# asm 1: movzbl <z0=int32#1%8,>p02=int32#3
# asm 2: movzbl <z0=%al,>p02=%edx
movzbl %al,%edx

# qhasm:     y2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#3,8),>y2=int32#3
# asm 2: movl aes_table2(,<p02=%edx,8),>y2=%edx
movl aes_table2(,%edx,8),%edx

# qhasm:     p01 = (z0 >> 8) & 255
# asm 1: movzbl <z0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <z0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:     y1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>y1=int32#1
# asm 2: movl aes_table3(,<p01=%eax,8),>y1=%eax
movl aes_table3(,%eax,8),%eax

# qhasm:     y0 ^= pre20
# asm 1: xorl <pre20=stack32#57,<y0=int32#2
# asm 2: xorl <pre20=256(%esp),<y0=%ecx
xorl 256(%esp),%ecx

# qhasm:     y1 ^= pre21
# asm 1: xorl <pre21=stack32#58,<y1=int32#1
# asm 2: xorl <pre21=260(%esp),<y1=%eax
xorl 260(%esp),%eax

# qhasm:     y2 ^= pre22
# asm 1: xorl <pre22=stack32#59,<y2=int32#3
# asm 2: xorl <pre22=264(%esp),<y2=%edx
xorl 264(%esp),%edx

# qhasm:     y3 ^= pre23
# asm 1: xorl <pre23=stack32#60,<y3=int32#4
# asm 2: xorl <pre23=268(%esp),<y3=%ebx
xorl 268(%esp),%ebx

# qhasm:     y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:     p00 = y0 & 255
# asm 1: movzbl <y0=int32#2%8,>p00=int32#4
# asm 2: movzbl <y0=%cl,>p00=%ebx
movzbl %cl,%ebx

# qhasm:     z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:     p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#2%next8,>p03=int32#5
# asm 2: movzbl <y0=%ch,>p03=%esi
movzbl %ch,%esi

# qhasm:     (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#2
# asm 2: shr  $16,<y0=%ecx
shr  $16,%ecx

# qhasm:     z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:     p02 = y0 & 255
# asm 1: movzbl <y0=int32#2%8,>p02=int32#6
# asm 2: movzbl <y0=%cl,>p02=%edi
movzbl %cl,%edi

# qhasm:     z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:     p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#2%next8,>p01=int32#2
# asm 2: movzbl <y0=%ch,>p01=%ecx
movzbl %ch,%ecx

# qhasm:     z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#2,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%ecx,8),>z1=%ebp
movl aes_table3(,%ecx,8),%ebp

# qhasm:     p10 = y1 & 255
# asm 1: movzbl <y1=int32#1%8,>p10=int32#2
# asm 2: movzbl <y1=%al,>p10=%ecx
movzbl %al,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%ecx,8),<z1=%ebp
xorl aes_table0(,%ecx,8),%ebp

# qhasm:     p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#1%next8,>p11=int32#2
# asm 2: movzbl <y1=%ah,>p11=%ecx
movzbl %ah,%ecx

# qhasm:     z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%ecx,8),<z0=%ebx
xorl aes_table1(,%ecx,8),%ebx

# qhasm:     (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#1
# asm 2: shr  $16,<y1=%eax
shr  $16,%eax

# qhasm:     p12 = y1 & 255
# asm 1: movzbl <y1=int32#1%8,>p12=int32#2
# asm 2: movzbl <y1=%al,>p12=%ecx
movzbl %al,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%ecx,8),<z3=%esi
xorl aes_table2(,%ecx,8),%esi

# qhasm:     p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#1%next8,>p13=int32#1
# asm 2: movzbl <y1=%ah,>p13=%eax
movzbl %ah,%eax

# qhasm:     z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:     y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:     p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:     p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:     (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:     p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:     z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:     p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:     p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:     p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:     (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:     p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:     p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:     y0 = r12
# asm 1: movl <r12=stack32#18,>y0=int32#1
# asm 2: movl <r12=100(%esp),>y0=%eax
movl 100(%esp),%eax

# qhasm:     y0 ^= z0
# asm 1: xorl <z0=int32#4,<y0=int32#1
# asm 2: xorl <z0=%ebx,<y0=%eax
xorl %ebx,%eax

# qhasm:     y1 = r13
# asm 1: movl <r13=stack32#19,>y1=int32#2
# asm 2: movl <r13=104(%esp),>y1=%ecx
movl 104(%esp),%ecx

# qhasm:     y1 ^= z1
# asm 1: xorl <z1=int32#7,<y1=int32#2
# asm 2: xorl <z1=%ebp,<y1=%ecx
xorl %ebp,%ecx

# qhasm:     y2 = r14
# asm 1: movl <r14=stack32#20,>y2=int32#3
# asm 2: movl <r14=108(%esp),>y2=%edx
movl 108(%esp),%edx

# qhasm:     y2 ^= z2
# asm 1: xorl <z2=int32#6,<y2=int32#3
# asm 2: xorl <z2=%edi,<y2=%edx
xorl %edi,%edx

# qhasm:     y3 = r15
# asm 1: movl <r15=stack32#21,>y3=int32#4
# asm 2: movl <r15=112(%esp),>y3=%ebx
movl 112(%esp),%ebx

# qhasm:     y3 ^= z3
# asm 1: xorl <z3=int32#5,<y3=int32#4
# asm 2: xorl <z3=%esi,<y3=%ebx
xorl %esi,%ebx

# qhasm:     y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:     p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:     z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:     p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:     (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:     z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:     p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:     z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:     p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:     z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:     p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:     z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:     p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:     (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:     p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:     z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:     p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:     z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:     y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:     p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:     p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:     (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:     p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:     z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:     p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:     p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:     p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:     (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:     p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:     p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:     y0 = r16
# asm 1: movl <r16=stack32#22,>y0=int32#1
# asm 2: movl <r16=116(%esp),>y0=%eax
movl 116(%esp),%eax

# qhasm:     y0 ^= z0
# asm 1: xorl <z0=int32#4,<y0=int32#1
# asm 2: xorl <z0=%ebx,<y0=%eax
xorl %ebx,%eax

# qhasm:     y1 = r17
# asm 1: movl <r17=stack32#23,>y1=int32#2
# asm 2: movl <r17=120(%esp),>y1=%ecx
movl 120(%esp),%ecx

# qhasm:     y1 ^= z1
# asm 1: xorl <z1=int32#7,<y1=int32#2
# asm 2: xorl <z1=%ebp,<y1=%ecx
xorl %ebp,%ecx

# qhasm:     y2 = r18
# asm 1: movl <r18=stack32#24,>y2=int32#3
# asm 2: movl <r18=124(%esp),>y2=%edx
movl 124(%esp),%edx

# qhasm:     y2 ^= z2
# asm 1: xorl <z2=int32#6,<y2=int32#3
# asm 2: xorl <z2=%edi,<y2=%edx
xorl %edi,%edx

# qhasm:     y3 = r19
# asm 1: movl <r19=stack32#25,>y3=int32#4
# asm 2: movl <r19=128(%esp),>y3=%ebx
movl 128(%esp),%ebx

# qhasm:     y3 ^= z3
# asm 1: xorl <z3=int32#5,<y3=int32#4
# asm 2: xorl <z3=%esi,<y3=%ebx
xorl %esi,%ebx

# qhasm:     y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:     p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:     z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:     p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:     (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:     z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:     p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:     z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:     p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:     z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:     p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:     z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:     p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:     (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:     p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:     z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:     p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:     z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:     y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:     p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:     p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:     (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:     p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:     z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:     p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:     p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:     p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:     (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:     p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:     p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:     y0 = r20
# asm 1: movl <r20=stack32#26,>y0=int32#1
# asm 2: movl <r20=132(%esp),>y0=%eax
movl 132(%esp),%eax

# qhasm:     y0 ^= z0
# asm 1: xorl <z0=int32#4,<y0=int32#1
# asm 2: xorl <z0=%ebx,<y0=%eax
xorl %ebx,%eax

# qhasm:     y1 = r21
# asm 1: movl <r21=stack32#27,>y1=int32#2
# asm 2: movl <r21=136(%esp),>y1=%ecx
movl 136(%esp),%ecx

# qhasm:     y1 ^= z1
# asm 1: xorl <z1=int32#7,<y1=int32#2
# asm 2: xorl <z1=%ebp,<y1=%ecx
xorl %ebp,%ecx

# qhasm:     y2 = r22
# asm 1: movl <r22=stack32#28,>y2=int32#3
# asm 2: movl <r22=140(%esp),>y2=%edx
movl 140(%esp),%edx

# qhasm:     y2 ^= z2
# asm 1: xorl <z2=int32#6,<y2=int32#3
# asm 2: xorl <z2=%edi,<y2=%edx
xorl %edi,%edx

# qhasm:     y3 = r23
# asm 1: movl <r23=stack32#29,>y3=int32#4
# asm 2: movl <r23=144(%esp),>y3=%ebx
movl 144(%esp),%ebx

# qhasm:     y3 ^= z3
# asm 1: xorl <z3=int32#5,<y3=int32#4
# asm 2: xorl <z3=%esi,<y3=%ebx
xorl %esi,%ebx

# qhasm:     y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:     p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:     z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:     p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:     (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:     z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:     p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:     z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:     p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:     z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:     p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:     z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:     p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:     (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:     p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:     z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:     p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:     z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:     y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:     p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:     p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:     (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:     p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:     z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:     p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:     p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:     p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:     (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:     p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:     p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:     y0 = r24
# asm 1: movl <r24=stack32#30,>y0=int32#1
# asm 2: movl <r24=148(%esp),>y0=%eax
movl 148(%esp),%eax

# qhasm:     y0 ^= z0
# asm 1: xorl <z0=int32#4,<y0=int32#1
# asm 2: xorl <z0=%ebx,<y0=%eax
xorl %ebx,%eax

# qhasm:     y1 = r25
# asm 1: movl <r25=stack32#31,>y1=int32#2
# asm 2: movl <r25=152(%esp),>y1=%ecx
movl 152(%esp),%ecx

# qhasm:     y1 ^= z1
# asm 1: xorl <z1=int32#7,<y1=int32#2
# asm 2: xorl <z1=%ebp,<y1=%ecx
xorl %ebp,%ecx

# qhasm:     y2 = r26
# asm 1: movl <r26=stack32#32,>y2=int32#3
# asm 2: movl <r26=156(%esp),>y2=%edx
movl 156(%esp),%edx

# qhasm:     y2 ^= z2
# asm 1: xorl <z2=int32#6,<y2=int32#3
# asm 2: xorl <z2=%edi,<y2=%edx
xorl %edi,%edx

# qhasm:     y3 = r27
# asm 1: movl <r27=stack32#33,>y3=int32#4
# asm 2: movl <r27=160(%esp),>y3=%ebx
movl 160(%esp),%ebx

# qhasm:     y3 ^= z3
# asm 1: xorl <z3=int32#5,<y3=int32#4
# asm 2: xorl <z3=%esi,<y3=%ebx
xorl %esi,%ebx

# qhasm:     y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:     p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:     z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:     p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:     (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:     z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:     p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:     z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:     p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:     z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:     p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:     z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:     p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:     (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:     p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:     z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:     p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:     z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:     y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:     p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:     p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:     (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:     p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:     z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:     p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:     p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:     p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:     (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:     p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:     p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:     y0 = r28
# asm 1: movl <r28=stack32#34,>y0=int32#1
# asm 2: movl <r28=164(%esp),>y0=%eax
movl 164(%esp),%eax

# qhasm:     y0 ^= z0
# asm 1: xorl <z0=int32#4,<y0=int32#1
# asm 2: xorl <z0=%ebx,<y0=%eax
xorl %ebx,%eax

# qhasm:     y1 = r29
# asm 1: movl <r29=stack32#35,>y1=int32#2
# asm 2: movl <r29=168(%esp),>y1=%ecx
movl 168(%esp),%ecx

# qhasm:     y1 ^= z1
# asm 1: xorl <z1=int32#7,<y1=int32#2
# asm 2: xorl <z1=%ebp,<y1=%ecx
xorl %ebp,%ecx

# qhasm:     y2 = r30
# asm 1: movl <r30=stack32#36,>y2=int32#3
# asm 2: movl <r30=172(%esp),>y2=%edx
movl 172(%esp),%edx

# qhasm:     y2 ^= z2
# asm 1: xorl <z2=int32#6,<y2=int32#3
# asm 2: xorl <z2=%edi,<y2=%edx
xorl %edi,%edx

# qhasm:     y3 = r31
# asm 1: movl <r31=stack32#37,>y3=int32#4
# asm 2: movl <r31=176(%esp),>y3=%ebx
movl 176(%esp),%ebx

# qhasm:     y3 ^= z3
# asm 1: xorl <z3=int32#5,<y3=int32#4
# asm 2: xorl <z3=%esi,<y3=%ebx
xorl %esi,%ebx

# qhasm:     y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:     p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:     z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:     p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:     (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:     z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:     p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:     z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:     p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:     z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:     p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:     z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:     p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:     (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:     p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:     z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:     p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:     z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:     y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:     p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:     p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:     (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:     p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:     z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:     p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:     p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:     p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:     (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:     p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:     p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:     y0 = r32
# asm 1: movl <r32=stack32#38,>y0=int32#1
# asm 2: movl <r32=180(%esp),>y0=%eax
movl 180(%esp),%eax

# qhasm:     y0 ^= z0
# asm 1: xorl <z0=int32#4,<y0=int32#1
# asm 2: xorl <z0=%ebx,<y0=%eax
xorl %ebx,%eax

# qhasm:     y1 = r33
# asm 1: movl <r33=stack32#39,>y1=int32#2
# asm 2: movl <r33=184(%esp),>y1=%ecx
movl 184(%esp),%ecx

# qhasm:     y1 ^= z1
# asm 1: xorl <z1=int32#7,<y1=int32#2
# asm 2: xorl <z1=%ebp,<y1=%ecx
xorl %ebp,%ecx

# qhasm:     y2 = r34
# asm 1: movl <r34=stack32#40,>y2=int32#3
# asm 2: movl <r34=188(%esp),>y2=%edx
movl 188(%esp),%edx

# qhasm:     y2 ^= z2
# asm 1: xorl <z2=int32#6,<y2=int32#3
# asm 2: xorl <z2=%edi,<y2=%edx
xorl %edi,%edx

# qhasm:     y3 = r35
# asm 1: movl <r35=stack32#41,>y3=int32#4
# asm 2: movl <r35=192(%esp),>y3=%ebx
movl 192(%esp),%ebx

# qhasm:     y3 ^= z3
# asm 1: xorl <z3=int32#5,<y3=int32#4
# asm 2: xorl <z3=%esi,<y3=%ebx
xorl %esi,%ebx

# qhasm:     y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:     p00 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p00=int32#4
# asm 2: movzbl <y0=%al,>p00=%ebx
movzbl %al,%ebx

# qhasm:     z0 = *(uint32 *) (&aes_table0 + p00 * 8)
# asm 1: movl aes_table0(,<p00=int32#4,8),>z0=int32#4
# asm 2: movl aes_table0(,<p00=%ebx,8),>z0=%ebx
movl aes_table0(,%ebx,8),%ebx

# qhasm:     p03 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p03=int32#5
# asm 2: movzbl <y0=%ah,>p03=%esi
movzbl %ah,%esi

# qhasm:     (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:     z3 = *(uint32 *) (&aes_table1 + p03 * 8)
# asm 1: movl aes_table1(,<p03=int32#5,8),>z3=int32#5
# asm 2: movl aes_table1(,<p03=%esi,8),>z3=%esi
movl aes_table1(,%esi,8),%esi

# qhasm:     p02 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>p02=int32#6
# asm 2: movzbl <y0=%al,>p02=%edi
movzbl %al,%edi

# qhasm:     z2 = *(uint32 *) (&aes_table2 + p02 * 8)
# asm 1: movl aes_table2(,<p02=int32#6,8),>z2=int32#6
# asm 2: movl aes_table2(,<p02=%edi,8),>z2=%edi
movl aes_table2(,%edi,8),%edi

# qhasm:     p01 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>p01=int32#1
# asm 2: movzbl <y0=%ah,>p01=%eax
movzbl %ah,%eax

# qhasm:     z1 = *(uint32 *) (&aes_table3 + p01 * 8)
# asm 1: movl aes_table3(,<p01=int32#1,8),>z1=int32#7
# asm 2: movl aes_table3(,<p01=%eax,8),>z1=%ebp
movl aes_table3(,%eax,8),%ebp

# qhasm:     p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:     z1 ^= *(uint32 *) (&aes_table0 + p10 * 8)
# asm 1: xorl aes_table0(,<p10=int32#1,8),<z1=int32#7
# asm 2: xorl aes_table0(,<p10=%eax,8),<z1=%ebp
xorl aes_table0(,%eax,8),%ebp

# qhasm:     p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table1 + p11 * 8)
# asm 1: xorl aes_table1(,<p11=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table1(,<p11=%eax,8),<z0=%ebx
xorl aes_table1(,%eax,8),%ebx

# qhasm:     (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:     p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:     z3 ^= *(uint32 *) (&aes_table2 + p12 * 8)
# asm 1: xorl aes_table2(,<p12=int32#1,8),<z3=int32#5
# asm 2: xorl aes_table2(,<p12=%eax,8),<z3=%esi
xorl aes_table2(,%eax,8),%esi

# qhasm:     p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:     z2 ^= *(uint32 *) (&aes_table3 + p13 * 8)
# asm 1: xorl aes_table3(,<p13=int32#1,8),<z2=int32#6
# asm 2: xorl aes_table3(,<p13=%eax,8),<z2=%edi
xorl aes_table3(,%eax,8),%edi

# qhasm:     y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:     p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table0 + p20 * 8)
# asm 1: xorl aes_table0(,<p20=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table0(,<p20=%ecx,8),<z2=%edi
xorl aes_table0(,%ecx,8),%edi

# qhasm:     p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table1 + p21 * 8)
# asm 1: xorl aes_table1(,<p21=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table1(,<p21=%ecx,8),<z1=%ebp
xorl aes_table1(,%ecx,8),%ebp

# qhasm:     (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:     p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:     z0 ^= *(uint32 *) (&aes_table2 + p22 * 8)
# asm 1: xorl aes_table2(,<p22=int32#2,8),<z0=int32#4
# asm 2: xorl aes_table2(,<p22=%ecx,8),<z0=%ebx
xorl aes_table2(,%ecx,8),%ebx

# qhasm:     p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table3 + p23 * 8)
# asm 1: xorl aes_table3(,<p23=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table3(,<p23=%ecx,8),<z3=%esi
xorl aes_table3(,%ecx,8),%esi

# qhasm:     p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:     z3 ^= *(uint32 *) (&aes_table0 + p30 * 8)
# asm 1: xorl aes_table0(,<p30=int32#2,8),<z3=int32#5
# asm 2: xorl aes_table0(,<p30=%ecx,8),<z3=%esi
xorl aes_table0(,%ecx,8),%esi

# qhasm:     p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:     z2 ^= *(uint32 *) (&aes_table1 + p31 * 8)
# asm 1: xorl aes_table1(,<p31=int32#2,8),<z2=int32#6
# asm 2: xorl aes_table1(,<p31=%ecx,8),<z2=%edi
xorl aes_table1(,%ecx,8),%edi

# qhasm:     (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:     p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:     z1 ^= *(uint32 *) (&aes_table2 + p32 * 8)
# asm 1: xorl aes_table2(,<p32=int32#2,8),<z1=int32#7
# asm 2: xorl aes_table2(,<p32=%ecx,8),<z1=%ebp
xorl aes_table2(,%ecx,8),%ebp

# qhasm:     p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:     z0 ^= *(uint32 *) (&aes_table3 + p33 * 8)
# asm 1: xorl aes_table3(,<p33=int32#1,8),<z0=int32#4
# asm 2: xorl aes_table3(,<p33=%eax,8),<z0=%ebx
xorl aes_table3(,%eax,8),%ebx

# qhasm:     y0 = r36
# asm 1: movl <r36=stack32#42,>y0=int32#1
# asm 2: movl <r36=196(%esp),>y0=%eax
movl 196(%esp),%eax

# qhasm:     y0 ^= z0
# asm 1: xorl <z0=int32#4,<y0=int32#1
# asm 2: xorl <z0=%ebx,<y0=%eax
xorl %ebx,%eax

# qhasm:     y1 = r37
# asm 1: movl <r37=stack32#43,>y1=int32#2
# asm 2: movl <r37=200(%esp),>y1=%ecx
movl 200(%esp),%ecx

# qhasm:     y1 ^= z1
# asm 1: xorl <z1=int32#7,<y1=int32#2
# asm 2: xorl <z1=%ebp,<y1=%ecx
xorl %ebp,%ecx

# qhasm:     y2 = r38
# asm 1: movl <r38=stack32#44,>y2=int32#3
# asm 2: movl <r38=204(%esp),>y2=%edx
movl 204(%esp),%edx

# qhasm:     y2 ^= z2
# asm 1: xorl <z2=int32#6,<y2=int32#3
# asm 2: xorl <z2=%edi,<y2=%edx
xorl %edi,%edx

# qhasm:     y3 = r39
# asm 1: movl <r39=stack32#45,>y3=int32#4
# asm 2: movl <r39=208(%esp),>y3=%ebx
movl 208(%esp),%ebx

# qhasm:     y3 ^= z3
# asm 1: xorl <z3=int32#5,<y3=int32#4
# asm 2: xorl <z3=%esi,<y3=%ebx
xorl %esi,%ebx

# qhasm:     y3_stack = y3
# asm 1: movd <y3=int32#4,>y3_stack=int3232#5
# asm 2: movd <y3=%ebx,>y3_stack=%mm4
movd %ebx,%mm4

# qhasm:     z0 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>z0=int32#4
# asm 2: movzbl <y0=%al,>z0=%ebx
movzbl %al,%ebx

# qhasm:     z0 = *(uint8 *) (&aes_table2 + z0 * 8)
# asm 1: movzbl aes_table2(,<z0=int32#4,8),>z0=int32#4
# asm 2: movzbl aes_table2(,<z0=%ebx,8),>z0=%ebx
movzbl aes_table2(,%ebx,8),%ebx

# qhasm:     z3 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>z3=int32#5
# asm 2: movzbl <y0=%ah,>z3=%esi
movzbl %ah,%esi

# qhasm:     z3 = *(uint16 *) (&aes_tablex + z3 * 8)
# asm 1: movzwl aes_tablex(,<z3=int32#5,8),>z3=int32#5
# asm 2: movzwl aes_tablex(,<z3=%esi,8),>z3=%esi
movzwl aes_tablex(,%esi,8),%esi

# qhasm:     (uint32) y0 >>= 16
# asm 1: shr  $16,<y0=int32#1
# asm 2: shr  $16,<y0=%eax
shr  $16,%eax

# qhasm:     z2 = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>z2=int32#6
# asm 2: movzbl <y0=%al,>z2=%edi
movzbl %al,%edi

# qhasm:     z2 = *(uint32 *) (&lr_table0 + z2 * 8)
# asm 1: movl lr_table0(,<z2=int32#6,8),>z2=int32#6
# asm 2: movl lr_table0(,<z2=%edi,8),>z2=%edi
movl lr_table0(,%edi,8),%edi

# qhasm:     z1 = (y0 >> 8) & 255
# asm 1: movzbl <y0=int32#1%next8,>z1=int32#1
# asm 2: movzbl <y0=%ah,>z1=%eax
movzbl %ah,%eax

# qhasm:     z1 = *(uint32 *) (&lr_table1 + z1 * 8)
# asm 1: movl lr_table1(,<z1=int32#1,8),>z1=int32#7
# asm 2: movl lr_table1(,<z1=%eax,8),>z1=%ebp
movl lr_table1(,%eax,8),%ebp

# qhasm:     z0 ^= r40
# asm 1: xorl <r40=stack32#46,<z0=int32#4
# asm 2: xorl <r40=212(%esp),<z0=%ebx
xorl 212(%esp),%ebx

# qhasm:     z3 ^= r43
# asm 1: xorl <r43=stack32#49,<z3=int32#5
# asm 2: xorl <r43=224(%esp),<z3=%esi
xorl 224(%esp),%esi

# qhasm:     z1 ^= r41
# asm 1: xorl <r41=stack32#47,<z1=int32#7
# asm 2: xorl <r41=216(%esp),<z1=%ebp
xorl 216(%esp),%ebp

# qhasm:     z2 ^= r42
# asm 1: xorl <r42=stack32#48,<z2=int32#6
# asm 2: xorl <r42=220(%esp),<z2=%edi
xorl 220(%esp),%edi

# qhasm:     p10 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p10=int32#1
# asm 2: movzbl <y1=%cl,>p10=%eax
movzbl %cl,%eax

# qhasm:     p10 = *(uint8 *) (&aes_table2 + p10 * 8)
# asm 1: movzbl aes_table2(,<p10=int32#1,8),>p10=int32#1
# asm 2: movzbl aes_table2(,<p10=%eax,8),>p10=%eax
movzbl aes_table2(,%eax,8),%eax

# qhasm:     z1 ^= p10
# asm 1: xorl <p10=int32#1,<z1=int32#7
# asm 2: xorl <p10=%eax,<z1=%ebp
xorl %eax,%ebp

# qhasm:     p11 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p11=int32#1
# asm 2: movzbl <y1=%ch,>p11=%eax
movzbl %ch,%eax

# qhasm:     p11 = *(uint16 *) (&aes_tablex + p11 * 8)
# asm 1: movzwl aes_tablex(,<p11=int32#1,8),>p11=int32#1
# asm 2: movzwl aes_tablex(,<p11=%eax,8),>p11=%eax
movzwl aes_tablex(,%eax,8),%eax

# qhasm:     z0 ^= p11
# asm 1: xorl <p11=int32#1,<z0=int32#4
# asm 2: xorl <p11=%eax,<z0=%ebx
xorl %eax,%ebx

# qhasm:     (uint32) y1 >>= 16
# asm 1: shr  $16,<y1=int32#2
# asm 2: shr  $16,<y1=%ecx
shr  $16,%ecx

# qhasm:     p12 = y1 & 255
# asm 1: movzbl <y1=int32#2%8,>p12=int32#1
# asm 2: movzbl <y1=%cl,>p12=%eax
movzbl %cl,%eax

# qhasm:     p12 = *(uint32 *) (&lr_table0 + p12 * 8)
# asm 1: movl lr_table0(,<p12=int32#1,8),>p12=int32#1
# asm 2: movl lr_table0(,<p12=%eax,8),>p12=%eax
movl lr_table0(,%eax,8),%eax

# qhasm:     z3 ^= p12
# asm 1: xorl <p12=int32#1,<z3=int32#5
# asm 2: xorl <p12=%eax,<z3=%esi
xorl %eax,%esi

# qhasm:     p13 = (y1 >> 8) & 255
# asm 1: movzbl <y1=int32#2%next8,>p13=int32#1
# asm 2: movzbl <y1=%ch,>p13=%eax
movzbl %ch,%eax

# qhasm:     p13 = *(uint32 *) (&lr_table1 + p13 * 8)
# asm 1: movl lr_table1(,<p13=int32#1,8),>p13=int32#1
# asm 2: movl lr_table1(,<p13=%eax,8),>p13=%eax
movl lr_table1(,%eax,8),%eax

# qhasm:     z2 ^= p13
# asm 1: xorl <p13=int32#1,<z2=int32#6
# asm 2: xorl <p13=%eax,<z2=%edi
xorl %eax,%edi

# qhasm:     y3 = y3_stack
# asm 1: movd <y3_stack=int3232#5,>y3=int32#1
# asm 2: movd <y3_stack=%mm4,>y3=%eax
movd %mm4,%eax

# qhasm:     p20 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p20=int32#2
# asm 2: movzbl <y2=%dl,>p20=%ecx
movzbl %dl,%ecx

# qhasm:     p20 = *(uint8 *) (&aes_table2 + p20 * 8)
# asm 1: movzbl aes_table2(,<p20=int32#2,8),>p20=int32#2
# asm 2: movzbl aes_table2(,<p20=%ecx,8),>p20=%ecx
movzbl aes_table2(,%ecx,8),%ecx

# qhasm:     z2 ^= p20
# asm 1: xorl <p20=int32#2,<z2=int32#6
# asm 2: xorl <p20=%ecx,<z2=%edi
xorl %ecx,%edi

# qhasm:     p21 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p21=int32#2
# asm 2: movzbl <y2=%dh,>p21=%ecx
movzbl %dh,%ecx

# qhasm:     p21 = *(uint16 *) (&aes_tablex + p21 * 8)
# asm 1: movzwl aes_tablex(,<p21=int32#2,8),>p21=int32#2
# asm 2: movzwl aes_tablex(,<p21=%ecx,8),>p21=%ecx
movzwl aes_tablex(,%ecx,8),%ecx

# qhasm:     z1 ^= p21
# asm 1: xorl <p21=int32#2,<z1=int32#7
# asm 2: xorl <p21=%ecx,<z1=%ebp
xorl %ecx,%ebp

# qhasm:     (uint32) y2 >>= 16
# asm 1: shr  $16,<y2=int32#3
# asm 2: shr  $16,<y2=%edx
shr  $16,%edx

# qhasm:     p22 = y2 & 255
# asm 1: movzbl <y2=int32#3%8,>p22=int32#2
# asm 2: movzbl <y2=%dl,>p22=%ecx
movzbl %dl,%ecx

# qhasm:     p22 = *(uint32 *) (&lr_table0 + p22 * 8)
# asm 1: movl lr_table0(,<p22=int32#2,8),>p22=int32#2
# asm 2: movl lr_table0(,<p22=%ecx,8),>p22=%ecx
movl lr_table0(,%ecx,8),%ecx

# qhasm:     z0 ^= p22
# asm 1: xorl <p22=int32#2,<z0=int32#4
# asm 2: xorl <p22=%ecx,<z0=%ebx
xorl %ecx,%ebx

# qhasm:     p23 = (y2 >> 8) & 255
# asm 1: movzbl <y2=int32#3%next8,>p23=int32#2
# asm 2: movzbl <y2=%dh,>p23=%ecx
movzbl %dh,%ecx

# qhasm:     p23 = *(uint32 *) (&lr_table1 + p23 * 8)
# asm 1: movl lr_table1(,<p23=int32#2,8),>p23=int32#2
# asm 2: movl lr_table1(,<p23=%ecx,8),>p23=%ecx
movl lr_table1(,%ecx,8),%ecx

# qhasm:     z3 ^= p23
# asm 1: xorl <p23=int32#2,<z3=int32#5
# asm 2: xorl <p23=%ecx,<z3=%esi
xorl %ecx,%esi

# qhasm:     p30 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p30=int32#2
# asm 2: movzbl <y3=%al,>p30=%ecx
movzbl %al,%ecx

# qhasm:     p30 = *(uint8 *) (&aes_table2 + p30 * 8)
# asm 1: movzbl aes_table2(,<p30=int32#2,8),>p30=int32#2
# asm 2: movzbl aes_table2(,<p30=%ecx,8),>p30=%ecx
movzbl aes_table2(,%ecx,8),%ecx

# qhasm:     z3 ^= p30
# asm 1: xorl <p30=int32#2,<z3=int32#5
# asm 2: xorl <p30=%ecx,<z3=%esi
xorl %ecx,%esi

# qhasm:     p31 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p31=int32#2
# asm 2: movzbl <y3=%ah,>p31=%ecx
movzbl %ah,%ecx

# qhasm:     p31 = *(uint16 *) (&aes_tablex + p31 * 8)
# asm 1: movzwl aes_tablex(,<p31=int32#2,8),>p31=int32#2
# asm 2: movzwl aes_tablex(,<p31=%ecx,8),>p31=%ecx
movzwl aes_tablex(,%ecx,8),%ecx

# qhasm:     z2 ^= p31
# asm 1: xorl <p31=int32#2,<z2=int32#6
# asm 2: xorl <p31=%ecx,<z2=%edi
xorl %ecx,%edi

# qhasm:     (uint32) y3 >>= 16
# asm 1: shr  $16,<y3=int32#1
# asm 2: shr  $16,<y3=%eax
shr  $16,%eax

# qhasm:     p32 = y3 & 255
# asm 1: movzbl <y3=int32#1%8,>p32=int32#2
# asm 2: movzbl <y3=%al,>p32=%ecx
movzbl %al,%ecx

# qhasm:     p32 = *(uint32 *) (&lr_table0 + p32 * 8)
# asm 1: movl lr_table0(,<p32=int32#2,8),>p32=int32#2
# asm 2: movl lr_table0(,<p32=%ecx,8),>p32=%ecx
movl lr_table0(,%ecx,8),%ecx

# qhasm:     z1 ^= p32
# asm 1: xorl <p32=int32#2,<z1=int32#7
# asm 2: xorl <p32=%ecx,<z1=%ebp
xorl %ecx,%ebp

# qhasm:     p33 = (y3 >> 8) & 255
# asm 1: movzbl <y3=int32#1%next8,>p33=int32#1
# asm 2: movzbl <y3=%ah,>p33=%eax
movzbl %ah,%eax

# qhasm:     p33 = *(uint32 *) (&lr_table1 + p33 * 8)
# asm 1: movl lr_table1(,<p33=int32#1,8),>p33=int32#1
# asm 2: movl lr_table1(,<p33=%eax,8),>p33=%eax
movl lr_table1(,%eax,8),%eax

# qhasm:     z0 ^= p33
# asm 1: xorl <p33=int32#1,<z0=int32#4
# asm 2: xorl <p33=%eax,<z0=%ebx
xorl %eax,%ebx

# qhasm:     in = in_stack
# asm 1: movd <in_stack=int3232#2,>in=int32#1
# asm 2: movd <in_stack=%mm1,>in=%eax
movd %mm1,%eax

# qhasm:     out = out_stack
# asm 1: movd <out_stack=int3232#3,>out=int32#3
# asm 2: movd <out_stack=%mm2,>out=%edx
movd %mm2,%edx

# qhasm:     z0 ^= *(uint32 *) (in + 0)
# asm 1: xorl 0(<in=int32#1),<z0=int32#4
# asm 2: xorl 0(<in=%eax),<z0=%ebx
xorl 0(%eax),%ebx

# qhasm:     z1 ^= *(uint32 *) (in + 4)
# asm 1: xorl 4(<in=int32#1),<z1=int32#7
# asm 2: xorl 4(<in=%eax),<z1=%ebp
xorl 4(%eax),%ebp

# qhasm:     z2 ^= *(uint32 *) (in + 8)
# asm 1: xorl 8(<in=int32#1),<z2=int32#6
# asm 2: xorl 8(<in=%eax),<z2=%edi
xorl 8(%eax),%edi

# qhasm:     z3 ^= *(uint32 *) (in + 12)
# asm 1: xorl 12(<in=int32#1),<z3=int32#5
# asm 2: xorl 12(<in=%eax),<z3=%esi
xorl 12(%eax),%esi

# qhasm:     in += 16
# asm 1: add  $16,<in=int32#1
# asm 2: add  $16,<in=%eax
add  $16,%eax

# qhasm:     in_stack = in
# asm 1: movd <in=int32#1,>in_stack=int3232#2
# asm 2: movd <in=%eax,>in_stack=%mm1
movd %eax,%mm1

# qhasm:     *(uint32 *) (out + 0) = z0
# asm 1: movl <z0=int32#4,0(<out=int32#3)
# asm 2: movl <z0=%ebx,0(<out=%edx)
movl %ebx,0(%edx)

# qhasm:     *(uint32 *) (out + 4) = z1
# asm 1: movl <z1=int32#7,4(<out=int32#3)
# asm 2: movl <z1=%ebp,4(<out=%edx)
movl %ebp,4(%edx)

# qhasm:     *(uint32 *) (out + 8) = z2
# asm 1: movl <z2=int32#6,8(<out=int32#3)
# asm 2: movl <z2=%edi,8(<out=%edx)
movl %edi,8(%edx)

# qhasm:     *(uint32 *) (out + 12) = z3
# asm 1: movl <z3=int32#5,12(<out=int32#3)
# asm 2: movl <z3=%esi,12(<out=%edx)
movl %esi,12(%edx)

# qhasm:     out += 16
# asm 1: add  $16,<out=int32#3
# asm 2: add  $16,<out=%edx
add  $16,%edx

# qhasm:     out_stack = out
# asm 1: movd <out=int32#3,>out_stack=int3232#3
# asm 2: movd <out=%edx,>out_stack=%mm2
movd %edx,%mm2

# qhasm:     y0 = n0
# asm 1: movl <n0=stack32#50,>y0=int32#1
# asm 2: movl <n0=228(%esp),>y0=%eax
movl 228(%esp),%eax

# qhasm:     y0 += 1
# asm 1: add  $1,<y0=int32#1
# asm 2: add  $1,<y0=%eax
add  $1,%eax

# qhasm:     n0 = y0
# asm 1: movl <y0=int32#1,>n0=stack32#50
# asm 2: movl <y0=%eax,>n0=228(%esp)
movl %eax,228(%esp)

# qhasm:     mainloopbytes = mainloopbytes_stack
# asm 1: movl <mainloopbytes_stack=stack32#55,>mainloopbytes=int32#2
# asm 2: movl <mainloopbytes_stack=248(%esp),>mainloopbytes=%ecx
movl 248(%esp),%ecx

# qhasm:     unsigned>? mainloopbytes -= 16
# asm 1: sub  $16,<mainloopbytes=int32#2
# asm 2: sub  $16,<mainloopbytes=%ecx
sub  $16,%ecx

# qhasm:     mainloopbytes_stack = mainloopbytes
# asm 1: movl <mainloopbytes=int32#2,>mainloopbytes_stack=stack32#55
# asm 2: movl <mainloopbytes=%ecx,>mainloopbytes_stack=248(%esp)
movl %ecx,248(%esp)
# comment:fp stack unchanged by jump

# qhasm:     goto mainloop if unsigned>
ja ._mainloop

# qhasm:   len = len_stack
# asm 1: movd <len_stack=int3232#4,>len=int32#4
# asm 2: movd <len_stack=%mm3,>len=%ebx
movd %mm3,%ebx

# qhasm:   signed>? =? len - 0
# asm 1: cmp  $0,<len=int32#4
# asm 2: cmp  $0,<len=%ebx
cmp  $0,%ebx
# comment:fp stack unchanged by jump

# qhasm:     goto done if =
je ._done
# comment:fp stack unchanged by jump

# qhasm:     goto processlastbytes if !signed>
jle ._processlastbytes

# qhasm:   unsigned<? len - 16
# asm 1: cmp  $16,<len=int32#4
# asm 2: cmp  $16,<len=%ebx
cmp  $16,%ebx
# comment:fp stack unchanged by jump

# qhasm:     goto outerloop if !unsigned<
jae ._outerloop

# qhasm:   tmpinp = &tmpin
# asm 1: leal <tmpin=stack128#1,>tmpinp=int32#6
# asm 2: leal <tmpin=0(%esp),>tmpinp=%edi
leal 0(%esp),%edi

# qhasm:   lentmp = len
# asm 1: mov  <len=int32#4,>lentmp=int32#2
# asm 2: mov  <len=%ebx,>lentmp=%ecx
mov  %ebx,%ecx

# qhasm:   outsave = out
# asm 1: movl <out=int32#3,>outsave=stack32#54
# asm 2: movl <out=%edx,>outsave=244(%esp)
movl %edx,244(%esp)

# qhasm:   in = in_stack
# asm 1: movd <in_stack=int3232#2,>in=int32#5
# asm 2: movd <in_stack=%mm1,>in=%esi
movd %mm1,%esi

# qhasm:   while (lentmp) { *tmpinp++ = *in++; --lentmp }
rep movsb

# qhasm:   in = &tmpin
# asm 1: leal <tmpin=stack128#1,>in=int32#2
# asm 2: leal <tmpin=0(%esp),>in=%ecx
leal 0(%esp),%ecx

# qhasm:   out = &tmpin
# asm 1: leal <tmpin=stack128#1,>out=int32#3
# asm 2: leal <tmpin=0(%esp),>out=%edx
leal 0(%esp),%edx

# qhasm:   in_stack = in
# asm 1: movd <in=int32#2,>in_stack=int3232#2
# asm 2: movd <in=%ecx,>in_stack=%mm1
movd %ecx,%mm1

# qhasm:   out_stack = out
# asm 1: movd <out=int32#3,>out_stack=int3232#3
# asm 2: movd <out=%edx,>out_stack=%mm2
movd %edx,%mm2

# qhasm:   len -= 16
# asm 1: sub  $16,<len=int32#4
# asm 2: sub  $16,<len=%ebx
sub  $16,%ebx

# qhasm:   len_stack = len
# asm 1: movd <len=int32#4,>len_stack=int3232#4
# asm 2: movd <len=%ebx,>len_stack=%mm3
movd %ebx,%mm3

# qhasm:   mainloopbytes = 16
# asm 1: mov  $16,>mainloopbytes=int32#2
# asm 2: mov  $16,>mainloopbytes=%ecx
mov  $16,%ecx

# qhasm:   mainloopbytes_stack = mainloopbytes
# asm 1: movl <mainloopbytes=int32#2,>mainloopbytes_stack=stack32#55
# asm 2: movl <mainloopbytes=%ecx,>mainloopbytes_stack=248(%esp)
movl %ecx,248(%esp)

# qhasm:   tmp = y0 & 255
# asm 1: movzbl <y0=int32#1%8,>tmp=int32#2
# asm 2: movzbl <y0=%al,>tmp=%ecx
movzbl %al,%ecx

# qhasm:   =? tmp - 0 
# asm 1: cmp  $0,<tmp=int32#2
# asm 2: cmp  $0,<tmp=%ecx
cmp  $0,%ecx
# comment:fp stack unchanged by jump

# qhasm:     goto mainloop if !=
jne ._mainloop
# comment:fp stack unchanged by jump

# qhasm:     goto precompute
jmp ._precompute

# qhasm: processlastbytes:
._processlastbytes:

# qhasm: len = len_stack
# asm 1: movd <len_stack=int3232#4,>len=int32#2
# asm 2: movd <len_stack=%mm3,>len=%ecx
movd %mm3,%ecx

# qhasm: len += 16
# asm 1: add  $16,<len=int32#2
# asm 2: add  $16,<len=%ecx
add  $16,%ecx

# qhasm: tmpinp = &tmpin
# asm 1: leal <tmpin=stack128#1,>tmpinp=int32#5
# asm 2: leal <tmpin=0(%esp),>tmpinp=%esi
leal 0(%esp),%esi

# qhasm: out = outsave
# asm 1: movl <outsave=stack32#54,>out=int32#6
# asm 2: movl <outsave=244(%esp),>out=%edi
movl 244(%esp),%edi

# qhasm: lentmp = len
# asm 1: mov  <len=int32#2,>lentmp=int32#2
# asm 2: mov  <len=%ecx,>lentmp=%ecx
mov  %ecx,%ecx

# qhasm: while (lentmp) { *out++ = *tmpinp++; --lentmp }
rep movsb
# comment:fp stack unchanged by fallthrough

# qhasm: done:
._done:

# qhasm:   c = c_stack
# asm 1: movd <c_stack=int3232#1,>c=int32#2
# asm 2: movd <c_stack=%mm0,>c=%ecx
movd %mm0,%ecx

# qhasm:   y1 = n1
# asm 1: movl <n1=stack32#51,>y1=int32#3
# asm 2: movl <n1=232(%esp),>y1=%edx
movl 232(%esp),%edx

# qhasm:   y2 = n2
# asm 1: movl <n2=stack32#52,>y2=int32#4
# asm 2: movl <n2=236(%esp),>y2=%ebx
movl 236(%esp),%ebx

# qhasm:   y3 = n3
# asm 1: movl <n3=stack32#53,>y3=int32#5
# asm 2: movl <n3=240(%esp),>y3=%esi
movl 240(%esp),%esi

# qhasm: *(uint32 *) (c + 56) = y0
# asm 1: movl <y0=int32#1,56(<c=int32#2)
# asm 2: movl <y0=%eax,56(<c=%ecx)
movl %eax,56(%ecx)

# qhasm: *(uint32 *) (c + 60) = y1
# asm 1: movl <y1=int32#3,60(<c=int32#2)
# asm 2: movl <y1=%edx,60(<c=%ecx)
movl %edx,60(%ecx)

# qhasm: *(uint32 *) (c + 64) = y2
# asm 1: movl <y2=int32#4,64(<c=int32#2)
# asm 2: movl <y2=%ebx,64(<c=%ecx)
movl %ebx,64(%ecx)

# qhasm: *(uint32 *) (c + 68) = y3
# asm 1: movl <y3=int32#5,68(<c=int32#2)
# asm 2: movl <y3=%esi,68(<c=%ecx)
movl %esi,68(%ecx)
# comment:fp stack unchanged by fallthrough

# qhasm: nothingtodo:
._nothingtodo:

# qhasm: emms
emms

# qhasm: eax = eax_stack
# asm 1: movl <eax_stack=stack32#1,>eax=int32#1
# asm 2: movl <eax_stack=32(%esp),>eax=%eax
movl 32(%esp),%eax

# qhasm: ebx = ebx_stack
# asm 1: movl <ebx_stack=stack32#2,>ebx=int32#4
# asm 2: movl <ebx_stack=36(%esp),>ebx=%ebx
movl 36(%esp),%ebx

# qhasm: esi = esi_stack
# asm 1: movl <esi_stack=stack32#3,>esi=int32#5
# asm 2: movl <esi_stack=40(%esp),>esi=%esi
movl 40(%esp),%esi

# qhasm: edi = edi_stack
# asm 1: movl <edi_stack=stack32#4,>edi=int32#6
# asm 2: movl <edi_stack=44(%esp),>edi=%edi
movl 44(%esp),%edi

# qhasm: ebp = ebp_stack
# asm 1: movl <ebp_stack=stack32#5,>ebp=int32#7
# asm 2: movl <ebp_stack=48(%esp),>ebp=%ebp
movl 48(%esp),%ebp

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

lr_table0:
.long 0x00630000
lr_table1:
.long 0x63000000
.long 0x007c0000
.long 0x7c000000
.long 0x00770000
.long 0x77000000
.long 0x007b0000
.long 0x7b000000
.long 0x00f20000
.long 0xf2000000
.long 0x006b0000
.long 0x6b000000
.long 0x006f0000
.long 0x6f000000
.long 0x00c50000
.long 0xc5000000
.long 0x00300000
.long 0x30000000
.long 0x00010000
.long 0x01000000
.long 0x00670000
.long 0x67000000
.long 0x002b0000
.long 0x2b000000
.long 0x00fe0000
.long 0xfe000000
.long 0x00d70000
.long 0xd7000000
.long 0x00ab0000
.long 0xab000000
.long 0x00760000
.long 0x76000000
.long 0x00ca0000
.long 0xca000000
.long 0x00820000
.long 0x82000000
.long 0x00c90000
.long 0xc9000000
.long 0x007d0000
.long 0x7d000000
.long 0x00fa0000
.long 0xfa000000
.long 0x00590000
.long 0x59000000
.long 0x00470000
.long 0x47000000
.long 0x00f00000
.long 0xf0000000
.long 0x00ad0000
.long 0xad000000
.long 0x00d40000
.long 0xd4000000
.long 0x00a20000
.long 0xa2000000
.long 0x00af0000
.long 0xaf000000
.long 0x009c0000
.long 0x9c000000
.long 0x00a40000
.long 0xa4000000
.long 0x00720000
.long 0x72000000
.long 0x00c00000
.long 0xc0000000
.long 0x00b70000
.long 0xb7000000
.long 0x00fd0000
.long 0xfd000000
.long 0x00930000
.long 0x93000000
.long 0x00260000
.long 0x26000000
.long 0x00360000
.long 0x36000000
.long 0x003f0000
.long 0x3f000000
.long 0x00f70000
.long 0xf7000000
.long 0x00cc0000
.long 0xcc000000
.long 0x00340000
.long 0x34000000
.long 0x00a50000
.long 0xa5000000
.long 0x00e50000
.long 0xe5000000
.long 0x00f10000
.long 0xf1000000
.long 0x00710000
.long 0x71000000
.long 0x00d80000
.long 0xd8000000
.long 0x00310000
.long 0x31000000
.long 0x00150000
.long 0x15000000
.long 0x00040000
.long 0x04000000
.long 0x00c70000
.long 0xc7000000
.long 0x00230000
.long 0x23000000
.long 0x00c30000
.long 0xc3000000
.long 0x00180000
.long 0x18000000
.long 0x00960000
.long 0x96000000
.long 0x00050000
.long 0x05000000
.long 0x009a0000
.long 0x9a000000
.long 0x00070000
.long 0x07000000
.long 0x00120000
.long 0x12000000
.long 0x00800000
.long 0x80000000
.long 0x00e20000
.long 0xe2000000
.long 0x00eb0000
.long 0xeb000000
.long 0x00270000
.long 0x27000000
.long 0x00b20000
.long 0xb2000000
.long 0x00750000
.long 0x75000000
.long 0x00090000
.long 0x09000000
.long 0x00830000
.long 0x83000000
.long 0x002c0000
.long 0x2c000000
.long 0x001a0000
.long 0x1a000000
.long 0x001b0000
.long 0x1b000000
.long 0x006e0000
.long 0x6e000000
.long 0x005a0000
.long 0x5a000000
.long 0x00a00000
.long 0xa0000000
.long 0x00520000
.long 0x52000000
.long 0x003b0000
.long 0x3b000000
.long 0x00d60000
.long 0xd6000000
.long 0x00b30000
.long 0xb3000000
.long 0x00290000
.long 0x29000000
.long 0x00e30000
.long 0xe3000000
.long 0x002f0000
.long 0x2f000000
.long 0x00840000
.long 0x84000000
.long 0x00530000
.long 0x53000000
.long 0x00d10000
.long 0xd1000000
.long 0x00000000
.long 0x00000000
.long 0x00ed0000
.long 0xed000000
.long 0x00200000
.long 0x20000000
.long 0x00fc0000
.long 0xfc000000
.long 0x00b10000
.long 0xb1000000
.long 0x005b0000
.long 0x5b000000
.long 0x006a0000
.long 0x6a000000
.long 0x00cb0000
.long 0xcb000000
.long 0x00be0000
.long 0xbe000000
.long 0x00390000
.long 0x39000000
.long 0x004a0000
.long 0x4a000000
.long 0x004c0000
.long 0x4c000000
.long 0x00580000
.long 0x58000000
.long 0x00cf0000
.long 0xcf000000
.long 0x00d00000
.long 0xd0000000
.long 0x00ef0000
.long 0xef000000
.long 0x00aa0000
.long 0xaa000000
.long 0x00fb0000
.long 0xfb000000
.long 0x00430000
.long 0x43000000
.long 0x004d0000
.long 0x4d000000
.long 0x00330000
.long 0x33000000
.long 0x00850000
.long 0x85000000
.long 0x00450000
.long 0x45000000
.long 0x00f90000
.long 0xf9000000
.long 0x00020000
.long 0x02000000
.long 0x007f0000
.long 0x7f000000
.long 0x00500000
.long 0x50000000
.long 0x003c0000
.long 0x3c000000
.long 0x009f0000
.long 0x9f000000
.long 0x00a80000
.long 0xa8000000
.long 0x00510000
.long 0x51000000
.long 0x00a30000
.long 0xa3000000
.long 0x00400000
.long 0x40000000
.long 0x008f0000
.long 0x8f000000
.long 0x00920000
.long 0x92000000
.long 0x009d0000
.long 0x9d000000
.long 0x00380000
.long 0x38000000
.long 0x00f50000
.long 0xf5000000
.long 0x00bc0000
.long 0xbc000000
.long 0x00b60000
.long 0xb6000000
.long 0x00da0000
.long 0xda000000
.long 0x00210000
.long 0x21000000
.long 0x00100000
.long 0x10000000
.long 0x00ff0000
.long 0xff000000
.long 0x00f30000
.long 0xf3000000
.long 0x00d20000
.long 0xd2000000
.long 0x00cd0000
.long 0xcd000000
.long 0x000c0000
.long 0x0c000000
.long 0x00130000
.long 0x13000000
.long 0x00ec0000
.long 0xec000000
.long 0x005f0000
.long 0x5f000000
.long 0x00970000
.long 0x97000000
.long 0x00440000
.long 0x44000000
.long 0x00170000
.long 0x17000000
.long 0x00c40000
.long 0xc4000000
.long 0x00a70000
.long 0xa7000000
.long 0x007e0000
.long 0x7e000000
.long 0x003d0000
.long 0x3d000000
.long 0x00640000
.long 0x64000000
.long 0x005d0000
.long 0x5d000000
.long 0x00190000
.long 0x19000000
.long 0x00730000
.long 0x73000000
.long 0x00600000
.long 0x60000000
.long 0x00810000
.long 0x81000000
.long 0x004f0000
.long 0x4f000000
.long 0x00dc0000
.long 0xdc000000
.long 0x00220000
.long 0x22000000
.long 0x002a0000
.long 0x2a000000
.long 0x00900000
.long 0x90000000
.long 0x00880000
.long 0x88000000
.long 0x00460000
.long 0x46000000
.long 0x00ee0000
.long 0xee000000
.long 0x00b80000
.long 0xb8000000
.long 0x00140000
.long 0x14000000
.long 0x00de0000
.long 0xde000000
.long 0x005e0000
.long 0x5e000000
.long 0x000b0000
.long 0x0b000000
.long 0x00db0000
.long 0xdb000000
.long 0x00e00000
.long 0xe0000000
.long 0x00320000
.long 0x32000000
.long 0x003a0000
.long 0x3a000000
.long 0x000a0000
.long 0x0a000000
.long 0x00490000
.long 0x49000000
.long 0x00060000
.long 0x06000000
.long 0x00240000
.long 0x24000000
.long 0x005c0000
.long 0x5c000000
.long 0x00c20000
.long 0xc2000000
.long 0x00d30000
.long 0xd3000000
.long 0x00ac0000
.long 0xac000000
.long 0x00620000
.long 0x62000000
.long 0x00910000
.long 0x91000000
.long 0x00950000
.long 0x95000000
.long 0x00e40000
.long 0xe4000000
.long 0x00790000
.long 0x79000000
.long 0x00e70000
.long 0xe7000000
.long 0x00c80000
.long 0xc8000000
.long 0x00370000
.long 0x37000000
.long 0x006d0000
.long 0x6d000000
.long 0x008d0000
.long 0x8d000000
.long 0x00d50000
.long 0xd5000000
.long 0x004e0000
.long 0x4e000000
.long 0x00a90000
.long 0xa9000000
.long 0x006c0000
.long 0x6c000000
.long 0x00560000
.long 0x56000000
.long 0x00f40000
.long 0xf4000000
.long 0x00ea0000
.long 0xea000000
.long 0x00650000
.long 0x65000000
.long 0x007a0000
.long 0x7a000000
.long 0x00ae0000
.long 0xae000000
.long 0x00080000
.long 0x08000000
.long 0x00ba0000
.long 0xba000000
.long 0x00780000
.long 0x78000000
.long 0x00250000
.long 0x25000000
.long 0x002e0000
.long 0x2e000000
.long 0x001c0000
.long 0x1c000000
.long 0x00a60000
.long 0xa6000000
.long 0x00b40000
.long 0xb4000000
.long 0x00c60000
.long 0xc6000000
.long 0x00e80000
.long 0xe8000000
.long 0x00dd0000
.long 0xdd000000
.long 0x00740000
.long 0x74000000
.long 0x001f0000
.long 0x1f000000
.long 0x004b0000
.long 0x4b000000
.long 0x00bd0000
.long 0xbd000000
.long 0x008b0000
.long 0x8b000000
.long 0x008a0000
.long 0x8a000000
.long 0x00700000
.long 0x70000000
.long 0x003e0000
.long 0x3e000000
.long 0x00b50000
.long 0xb5000000
.long 0x00660000
.long 0x66000000
.long 0x00480000
.long 0x48000000
.long 0x00030000
.long 0x03000000
.long 0x00f60000
.long 0xf6000000
.long 0x000e0000
.long 0x0e000000
.long 0x00610000
.long 0x61000000
.long 0x00350000
.long 0x35000000
.long 0x00570000
.long 0x57000000
.long 0x00b90000
.long 0xb9000000
.long 0x00860000
.long 0x86000000
.long 0x00c10000
.long 0xc1000000
.long 0x001d0000
.long 0x1d000000
.long 0x009e0000
.long 0x9e000000
.long 0x00e10000
.long 0xe1000000
.long 0x00f80000
.long 0xf8000000
.long 0x00980000
.long 0x98000000
.long 0x00110000
.long 0x11000000
.long 0x00690000
.long 0x69000000
.long 0x00d90000
.long 0xd9000000
.long 0x008e0000
.long 0x8e000000
.long 0x00940000
.long 0x94000000
.long 0x009b0000
.long 0x9b000000
.long 0x001e0000
.long 0x1e000000
.long 0x00870000
.long 0x87000000
.long 0x00e90000
.long 0xe9000000
.long 0x00ce0000
.long 0xce000000
.long 0x00550000
.long 0x55000000
.long 0x00280000
.long 0x28000000
.long 0x00df0000
.long 0xdf000000
.long 0x008c0000
.long 0x8c000000
.long 0x00a10000
.long 0xa1000000
.long 0x00890000
.long 0x89000000
.long 0x000d0000
.long 0x0d000000
.long 0x00bf0000
.long 0xbf000000
.long 0x00e60000
.long 0xe6000000
.long 0x00420000
.long 0x42000000
.long 0x00680000
.long 0x68000000
.long 0x00410000
.long 0x41000000
.long 0x00990000
.long 0x99000000
.long 0x002d0000
.long 0x2d000000
.long 0x000f0000
.long 0x0f000000
.long 0x00b00000
.long 0xb0000000
.long 0x00540000
.long 0x54000000
.long 0x00bb0000
.long 0xbb000000
.long 0x00160000
.long 0x16000000
