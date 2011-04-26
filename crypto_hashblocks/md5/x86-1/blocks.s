
# qhasm: int32 ecx

# qhasm: int32 ebx

# qhasm: int32 esi

# qhasm: int32 edi

# qhasm: int32 ebp

# qhasm: caller ecx

# qhasm: caller ebx

# qhasm: caller esi

# qhasm: caller edi

# qhasm: caller ebp

# qhasm: stack32 ecx_stack

# qhasm: stack32 ebx_stack

# qhasm: stack32 esi_stack

# qhasm: stack32 edi_stack

# qhasm: stack32 ebp_stack

# qhasm: int32 a

# qhasm: int32 b

# qhasm: int32 c

# qhasm: int32 d

# qhasm: int32 loader

# qhasm: int32 arith

# qhasm: stack32 ha

# qhasm: stack32 hb

# qhasm: stack32 hc

# qhasm: stack32 hd

# qhasm: int32 state

# qhasm: int32 in

# qhasm: int32 inlen

# qhasm: stack32 state_input

# qhasm: stack32 in_input

# qhasm: stack32 inlen_input

# qhasm: stack32 state_stack

# qhasm: stack32 in_stack

# qhasm: stack32 inlen_stack

# qhasm: enter crypto_hashblocks_md5_x86_1
.text
.p2align 5
.globl _crypto_hashblocks_md5_x86_1
.globl crypto_hashblocks_md5_x86_1
_crypto_hashblocks_md5_x86_1:
crypto_hashblocks_md5_x86_1:
mov %esp,%ecx
and $31,%ecx
add $64,%ecx
sub %ecx,%esp

# qhasm: input state_input

# qhasm: input in_input

# qhasm: input inlen_input

# qhasm: ecx_stack = ecx
# asm 1: movl <ecx=int32#2,>ecx_stack=stack32#1
# asm 2: movl <ecx=%ecx,>ecx_stack=0(%esp)
movl %ecx,0(%esp)

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

# qhasm: state = state_input
# asm 1: movl <state_input=stack32#-1,>state=int32#5
# asm 2: movl <state_input=4(%esp,%ecx),>state=%esi
movl 4(%esp,%ecx),%esi

# qhasm: in = in_input
# asm 1: movl <in_input=stack32#-2,>in=int32#6
# asm 2: movl <in_input=8(%esp,%ecx),>in=%edi
movl 8(%esp,%ecx),%edi

# qhasm: inlen = inlen_input
# asm 1: movl <inlen_input=stack32#-3,>inlen=int32#7
# asm 2: movl <inlen_input=12(%esp,%ecx),>inlen=%ebp
movl 12(%esp,%ecx),%ebp

# qhasm: a = *(uint32 *) (state + 0)
# asm 1: movl 0(<state=int32#5),>a=int32#1
# asm 2: movl 0(<state=%esi),>a=%eax
movl 0(%esi),%eax

# qhasm: b = *(uint32 *) (state + 4)
# asm 1: movl 4(<state=int32#5),>b=int32#2
# asm 2: movl 4(<state=%esi),>b=%ecx
movl 4(%esi),%ecx

# qhasm: c = *(uint32 *) (state + 8)
# asm 1: movl 8(<state=int32#5),>c=int32#3
# asm 2: movl 8(<state=%esi),>c=%edx
movl 8(%esi),%edx

# qhasm: d = *(uint32 *) (state + 12)
# asm 1: movl 12(<state=int32#5),>d=int32#4
# asm 2: movl 12(<state=%esi),>d=%ebx
movl 12(%esi),%ebx

# qhasm: state_stack = state
# asm 1: movl <state=int32#5,>state_stack=stack32#6
# asm 2: movl <state=%esi,>state_stack=20(%esp)
movl %esi,20(%esp)

# qhasm: assign 1 to a

# qhasm: assign 2 to b

# qhasm: assign 3 to c

# qhasm: assign 4 to d

# qhasm: assign 7 to inlen

# qhasm:              unsigned<? inlen - 64
# asm 1: cmp  $64,<inlen=int32#7
# asm 2: cmp  $64,<inlen=%ebp
cmp  $64,%ebp
# comment:fp stack unchanged by jump

# qhasm: goto done if unsigned<
jb ._done

# qhasm: mainloop:
._mainloop:

# qhasm: inlen_stack = inlen
# asm 1: movl <inlen=int32#7,>inlen_stack=stack32#7
# asm 2: movl <inlen=%ebp,>inlen_stack=24(%esp)
movl %ebp,24(%esp)

# qhasm:   loader = *(uint32 *) (in + 0)
# asm 1: movl 0(<in=int32#6),>loader=int32#5
# asm 2: movl 0(<in=%edi),>loader=%esi
movl 0(%edi),%esi

# qhasm:   arith = c
# asm 1: mov  <c=int32#3,>arith=int32#7
# asm 2: mov  <c=%edx,>arith=%ebp
mov  %edx,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   arith &= b
# asm 1: andl <b=int32#2,<arith=int32#7
# asm 2: andl <b=%ecx,<arith=%ebp
andl %ecx,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm: ha = a
# asm 1: movl <a=int32#1,>ha=stack32#8
# asm 2: movl <a=%eax,>ha=28(%esp)
movl %eax,28(%esp)

# qhasm:   a += loader + 0xd76aa478
# asm 1: lea  0xd76aa478(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0xd76aa478(<a=%eax,<loader=%esi),>a=%eax
lea  0xd76aa478(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 7
# asm 1: rol  $7,<a=int32#1
# asm 2: rol  $7,<a=%eax
rol  $7,%eax

# qhasm:     arith = b
# asm 1: mov  <b=int32#2,>arith=int32#5
# asm 2: mov  <b=%ecx,>arith=%esi
mov  %ecx,%esi

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#5
# asm 2: xorl <c=%edx,<arith=%esi
xorl %edx,%esi

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 4)
# asm 1: movl 4(<in=int32#6),>loader=int32#7
# asm 2: movl 4(<in=%edi),>loader=%ebp
movl 4(%edi),%ebp

# qhasm:     arith &= a
# asm 1: andl <a=int32#1,<arith=int32#5
# asm 2: andl <a=%eax,<arith=%esi
andl %eax,%esi

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#5
# asm 2: xorl <c=%edx,<arith=%esi
xorl %edx,%esi

# qhasm: hd = d
# asm 1: movl <d=int32#4,>hd=stack32#9
# asm 2: movl <d=%ebx,>hd=32(%esp)
movl %ebx,32(%esp)

# qhasm:     d += loader + 0xe8c7b756
# asm 1: lea  0xe8c7b756(<d=int32#4,<loader=int32#7),>d=int32#4
# asm 2: lea  0xe8c7b756(<d=%ebx,<loader=%ebp),>d=%ebx
lea  0xe8c7b756(%ebx,%ebp),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#5,<d=int32#4
# asm 2: addl <arith=%esi,<d=%ebx
addl %esi,%ebx

# qhasm:     d <<<= 12
# asm 1: rol  $12,<d=int32#4
# asm 2: rol  $12,<d=%ebx
rol  $12,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 8)
# asm 1: movl 8(<in=int32#6),>loader=int32#5
# asm 2: movl 8(<in=%edi),>loader=%esi
movl 8(%edi),%esi

# qhasm:   arith = a
# asm 1: mov  <a=int32#1,>arith=int32#7
# asm 2: mov  <a=%eax,>arith=%ebp
mov  %eax,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   arith &= d
# asm 1: andl <d=int32#4,<arith=int32#7
# asm 2: andl <d=%ebx,<arith=%ebp
andl %ebx,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm: hc = c
# asm 1: movl <c=int32#3,>hc=stack32#10
# asm 2: movl <c=%edx,>hc=36(%esp)
movl %edx,36(%esp)

# qhasm:   c += loader + 0x242070db
# asm 1: lea  0x242070db(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0x242070db(<c=%edx,<loader=%esi),>c=%edx
lea  0x242070db(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 17
# asm 1: rol  $17,<c=int32#3
# asm 2: rol  $17,<c=%edx
rol  $17,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 12)
# asm 1: movl 12(<in=int32#6),>loader=int32#5
# asm 2: movl 12(<in=%edi),>loader=%esi
movl 12(%edi),%esi

# qhasm:     arith = d
# asm 1: mov  <d=int32#4,>arith=int32#7
# asm 2: mov  <d=%ebx,>arith=%ebp
mov  %ebx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     arith &= c
# asm 1: andl <c=int32#3,<arith=int32#7
# asm 2: andl <c=%edx,<arith=%ebp
andl %edx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm: hb = b
# asm 1: movl <b=int32#2,>hb=stack32#11
# asm 2: movl <b=%ecx,>hb=40(%esp)
movl %ecx,40(%esp)

# qhasm:     b += loader + 0xc1bdceee
# asm 1: lea  0xc1bdceee(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0xc1bdceee(<b=%ecx,<loader=%esi),>b=%ecx
lea  0xc1bdceee(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 22
# asm 1: rol  $22,<b=int32#2
# asm 2: rol  $22,<b=%ecx
rol  $22,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 16)
# asm 1: movl 16(<in=int32#6),>loader=int32#5
# asm 2: movl 16(<in=%edi),>loader=%esi
movl 16(%edi),%esi

# qhasm:   arith = c
# asm 1: mov  <c=int32#3,>arith=int32#7
# asm 2: mov  <c=%edx,>arith=%ebp
mov  %edx,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   arith &= b
# asm 1: andl <b=int32#2,<arith=int32#7
# asm 2: andl <b=%ecx,<arith=%ebp
andl %ecx,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   a += loader + 0xf57c0faf
# asm 1: lea  0xf57c0faf(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0xf57c0faf(<a=%eax,<loader=%esi),>a=%eax
lea  0xf57c0faf(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 7
# asm 1: rol  $7,<a=int32#1
# asm 2: rol  $7,<a=%eax
rol  $7,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 20)
# asm 1: movl 20(<in=int32#6),>loader=int32#5
# asm 2: movl 20(<in=%edi),>loader=%esi
movl 20(%edi),%esi

# qhasm:     arith = b
# asm 1: mov  <b=int32#2,>arith=int32#7
# asm 2: mov  <b=%ecx,>arith=%ebp
mov  %ecx,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     arith &= a
# asm 1: andl <a=int32#1,<arith=int32#7
# asm 2: andl <a=%eax,<arith=%ebp
andl %eax,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     d += loader + 0x4787c62a
# asm 1: lea  0x4787c62a(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0x4787c62a(<d=%ebx,<loader=%esi),>d=%ebx
lea  0x4787c62a(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 12
# asm 1: rol  $12,<d=int32#4
# asm 2: rol  $12,<d=%ebx
rol  $12,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 24)
# asm 1: movl 24(<in=int32#6),>loader=int32#5
# asm 2: movl 24(<in=%edi),>loader=%esi
movl 24(%edi),%esi

# qhasm:   arith = a
# asm 1: mov  <a=int32#1,>arith=int32#7
# asm 2: mov  <a=%eax,>arith=%ebp
mov  %eax,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   arith &= d
# asm 1: andl <d=int32#4,<arith=int32#7
# asm 2: andl <d=%ebx,<arith=%ebp
andl %ebx,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   c += loader + 0xa8304613
# asm 1: lea  0xa8304613(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0xa8304613(<c=%edx,<loader=%esi),>c=%edx
lea  0xa8304613(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 17
# asm 1: rol  $17,<c=int32#3
# asm 2: rol  $17,<c=%edx
rol  $17,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 28)
# asm 1: movl 28(<in=int32#6),>loader=int32#5
# asm 2: movl 28(<in=%edi),>loader=%esi
movl 28(%edi),%esi

# qhasm:     arith = d
# asm 1: mov  <d=int32#4,>arith=int32#7
# asm 2: mov  <d=%ebx,>arith=%ebp
mov  %ebx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     arith &= c
# asm 1: andl <c=int32#3,<arith=int32#7
# asm 2: andl <c=%edx,<arith=%ebp
andl %edx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     b += loader + 0xfd469501
# asm 1: lea  0xfd469501(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0xfd469501(<b=%ecx,<loader=%esi),>b=%ecx
lea  0xfd469501(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 22
# asm 1: rol  $22,<b=int32#2
# asm 2: rol  $22,<b=%ecx
rol  $22,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 32)
# asm 1: movl 32(<in=int32#6),>loader=int32#5
# asm 2: movl 32(<in=%edi),>loader=%esi
movl 32(%edi),%esi

# qhasm:   arith = c
# asm 1: mov  <c=int32#3,>arith=int32#7
# asm 2: mov  <c=%edx,>arith=%ebp
mov  %edx,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   arith &= b
# asm 1: andl <b=int32#2,<arith=int32#7
# asm 2: andl <b=%ecx,<arith=%ebp
andl %ecx,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   a += loader + 0x698098d8
# asm 1: lea  0x698098d8(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0x698098d8(<a=%eax,<loader=%esi),>a=%eax
lea  0x698098d8(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 7
# asm 1: rol  $7,<a=int32#1
# asm 2: rol  $7,<a=%eax
rol  $7,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 36)
# asm 1: movl 36(<in=int32#6),>loader=int32#5
# asm 2: movl 36(<in=%edi),>loader=%esi
movl 36(%edi),%esi

# qhasm:     arith = b
# asm 1: mov  <b=int32#2,>arith=int32#7
# asm 2: mov  <b=%ecx,>arith=%ebp
mov  %ecx,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     arith &= a
# asm 1: andl <a=int32#1,<arith=int32#7
# asm 2: andl <a=%eax,<arith=%ebp
andl %eax,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     d += loader + 0x8b44f7af
# asm 1: lea  0x8b44f7af(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0x8b44f7af(<d=%ebx,<loader=%esi),>d=%ebx
lea  0x8b44f7af(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 12
# asm 1: rol  $12,<d=int32#4
# asm 2: rol  $12,<d=%ebx
rol  $12,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 40)
# asm 1: movl 40(<in=int32#6),>loader=int32#5
# asm 2: movl 40(<in=%edi),>loader=%esi
movl 40(%edi),%esi

# qhasm:   arith = a
# asm 1: mov  <a=int32#1,>arith=int32#7
# asm 2: mov  <a=%eax,>arith=%ebp
mov  %eax,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   arith &= d
# asm 1: andl <d=int32#4,<arith=int32#7
# asm 2: andl <d=%ebx,<arith=%ebp
andl %ebx,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   c += loader + 0xffff5bb1
# asm 1: lea  0xffff5bb1(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0xffff5bb1(<c=%edx,<loader=%esi),>c=%edx
lea  0xffff5bb1(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 17
# asm 1: rol  $17,<c=int32#3
# asm 2: rol  $17,<c=%edx
rol  $17,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 44)
# asm 1: movl 44(<in=int32#6),>loader=int32#5
# asm 2: movl 44(<in=%edi),>loader=%esi
movl 44(%edi),%esi

# qhasm:     arith = d
# asm 1: mov  <d=int32#4,>arith=int32#7
# asm 2: mov  <d=%ebx,>arith=%ebp
mov  %ebx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     arith &= c
# asm 1: andl <c=int32#3,<arith=int32#7
# asm 2: andl <c=%edx,<arith=%ebp
andl %edx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     b += loader + 0x895cd7be
# asm 1: lea  0x895cd7be(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0x895cd7be(<b=%ecx,<loader=%esi),>b=%ecx
lea  0x895cd7be(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 22
# asm 1: rol  $22,<b=int32#2
# asm 2: rol  $22,<b=%ecx
rol  $22,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 48)
# asm 1: movl 48(<in=int32#6),>loader=int32#5
# asm 2: movl 48(<in=%edi),>loader=%esi
movl 48(%edi),%esi

# qhasm:   arith = c
# asm 1: mov  <c=int32#3,>arith=int32#7
# asm 2: mov  <c=%edx,>arith=%ebp
mov  %edx,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   arith &= b
# asm 1: andl <b=int32#2,<arith=int32#7
# asm 2: andl <b=%ecx,<arith=%ebp
andl %ecx,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   a += loader + 0x6b901122
# asm 1: lea  0x6b901122(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0x6b901122(<a=%eax,<loader=%esi),>a=%eax
lea  0x6b901122(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 7
# asm 1: rol  $7,<a=int32#1
# asm 2: rol  $7,<a=%eax
rol  $7,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 52)
# asm 1: movl 52(<in=int32#6),>loader=int32#5
# asm 2: movl 52(<in=%edi),>loader=%esi
movl 52(%edi),%esi

# qhasm:     arith = b
# asm 1: mov  <b=int32#2,>arith=int32#7
# asm 2: mov  <b=%ecx,>arith=%ebp
mov  %ecx,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     arith &= a
# asm 1: andl <a=int32#1,<arith=int32#7
# asm 2: andl <a=%eax,<arith=%ebp
andl %eax,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     d += loader + 0xfd987193
# asm 1: lea  0xfd987193(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0xfd987193(<d=%ebx,<loader=%esi),>d=%ebx
lea  0xfd987193(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 12
# asm 1: rol  $12,<d=int32#4
# asm 2: rol  $12,<d=%ebx
rol  $12,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 56)
# asm 1: movl 56(<in=int32#6),>loader=int32#5
# asm 2: movl 56(<in=%edi),>loader=%esi
movl 56(%edi),%esi

# qhasm:   arith = a
# asm 1: mov  <a=int32#1,>arith=int32#7
# asm 2: mov  <a=%eax,>arith=%ebp
mov  %eax,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   arith &= d
# asm 1: andl <d=int32#4,<arith=int32#7
# asm 2: andl <d=%ebx,<arith=%ebp
andl %ebx,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   c += loader + 0xa679438e
# asm 1: lea  0xa679438e(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0xa679438e(<c=%edx,<loader=%esi),>c=%edx
lea  0xa679438e(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 17
# asm 1: rol  $17,<c=int32#3
# asm 2: rol  $17,<c=%edx
rol  $17,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 60)
# asm 1: movl 60(<in=int32#6),>loader=int32#5
# asm 2: movl 60(<in=%edi),>loader=%esi
movl 60(%edi),%esi

# qhasm:     arith = d
# asm 1: mov  <d=int32#4,>arith=int32#7
# asm 2: mov  <d=%ebx,>arith=%ebp
mov  %ebx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     arith &= c
# asm 1: andl <c=int32#3,<arith=int32#7
# asm 2: andl <c=%edx,<arith=%ebp
andl %edx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     b += loader + 0x49b40821
# asm 1: lea  0x49b40821(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0x49b40821(<b=%ecx,<loader=%esi),>b=%ecx
lea  0x49b40821(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 22
# asm 1: rol  $22,<b=int32#2
# asm 2: rol  $22,<b=%ecx
rol  $22,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 4)
# asm 1: movl 4(<in=int32#6),>loader=int32#5
# asm 2: movl 4(<in=%edi),>loader=%esi
movl 4(%edi),%esi

# qhasm:   arith = c
# asm 1: mov  <c=int32#3,>arith=int32#7
# asm 2: mov  <c=%edx,>arith=%ebp
mov  %edx,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   arith &= d
# asm 1: andl <d=int32#4,<arith=int32#7
# asm 2: andl <d=%ebx,<arith=%ebp
andl %ebx,%ebp

# qhasm:   arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:   a += loader + 0xf61e2562
# asm 1: lea  0xf61e2562(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0xf61e2562(<a=%eax,<loader=%esi),>a=%eax
lea  0xf61e2562(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 5
# asm 1: rol  $5,<a=int32#1
# asm 2: rol  $5,<a=%eax
rol  $5,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 24)
# asm 1: movl 24(<in=int32#6),>loader=int32#5
# asm 2: movl 24(<in=%edi),>loader=%esi
movl 24(%edi),%esi

# qhasm:     arith = b
# asm 1: mov  <b=int32#2,>arith=int32#7
# asm 2: mov  <b=%ecx,>arith=%ebp
mov  %ecx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     arith &= c
# asm 1: andl <c=int32#3,<arith=int32#7
# asm 2: andl <c=%edx,<arith=%ebp
andl %edx,%ebp

# qhasm:     arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:     d += loader + 0xc040b340
# asm 1: lea  0xc040b340(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0xc040b340(<d=%ebx,<loader=%esi),>d=%ebx
lea  0xc040b340(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 9
# asm 1: rol  $9,<d=int32#4
# asm 2: rol  $9,<d=%ebx
rol  $9,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 44)
# asm 1: movl 44(<in=int32#6),>loader=int32#5
# asm 2: movl 44(<in=%edi),>loader=%esi
movl 44(%edi),%esi

# qhasm:   arith = a
# asm 1: mov  <a=int32#1,>arith=int32#7
# asm 2: mov  <a=%eax,>arith=%ebp
mov  %eax,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   arith &= b
# asm 1: andl <b=int32#2,<arith=int32#7
# asm 2: andl <b=%ecx,<arith=%ebp
andl %ecx,%ebp

# qhasm:   arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:   c += loader + 0x265e5a51
# asm 1: lea  0x265e5a51(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0x265e5a51(<c=%edx,<loader=%esi),>c=%edx
lea  0x265e5a51(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 14
# asm 1: rol  $14,<c=int32#3
# asm 2: rol  $14,<c=%edx
rol  $14,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 0)
# asm 1: movl 0(<in=int32#6),>loader=int32#5
# asm 2: movl 0(<in=%edi),>loader=%esi
movl 0(%edi),%esi

# qhasm:     arith = d
# asm 1: mov  <d=int32#4,>arith=int32#7
# asm 2: mov  <d=%ebx,>arith=%ebp
mov  %ebx,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     arith &= a
# asm 1: andl <a=int32#1,<arith=int32#7
# asm 2: andl <a=%eax,<arith=%ebp
andl %eax,%ebp

# qhasm:     arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:     b += loader + 0xe9b6c7aa
# asm 1: lea  0xe9b6c7aa(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0xe9b6c7aa(<b=%ecx,<loader=%esi),>b=%ecx
lea  0xe9b6c7aa(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 20
# asm 1: rol  $20,<b=int32#2
# asm 2: rol  $20,<b=%ecx
rol  $20,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 20)
# asm 1: movl 20(<in=int32#6),>loader=int32#5
# asm 2: movl 20(<in=%edi),>loader=%esi
movl 20(%edi),%esi

# qhasm:   arith = c
# asm 1: mov  <c=int32#3,>arith=int32#7
# asm 2: mov  <c=%edx,>arith=%ebp
mov  %edx,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   arith &= d
# asm 1: andl <d=int32#4,<arith=int32#7
# asm 2: andl <d=%ebx,<arith=%ebp
andl %ebx,%ebp

# qhasm:   arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:   a += loader + 0xd62f105d
# asm 1: lea  0xd62f105d(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0xd62f105d(<a=%eax,<loader=%esi),>a=%eax
lea  0xd62f105d(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 5
# asm 1: rol  $5,<a=int32#1
# asm 2: rol  $5,<a=%eax
rol  $5,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 40)
# asm 1: movl 40(<in=int32#6),>loader=int32#5
# asm 2: movl 40(<in=%edi),>loader=%esi
movl 40(%edi),%esi

# qhasm:     arith = b
# asm 1: mov  <b=int32#2,>arith=int32#7
# asm 2: mov  <b=%ecx,>arith=%ebp
mov  %ecx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     arith &= c
# asm 1: andl <c=int32#3,<arith=int32#7
# asm 2: andl <c=%edx,<arith=%ebp
andl %edx,%ebp

# qhasm:     arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:     d += loader + 0x02441453
# asm 1: lea  0x02441453(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0x02441453(<d=%ebx,<loader=%esi),>d=%ebx
lea  0x02441453(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 9
# asm 1: rol  $9,<d=int32#4
# asm 2: rol  $9,<d=%ebx
rol  $9,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 60)
# asm 1: movl 60(<in=int32#6),>loader=int32#5
# asm 2: movl 60(<in=%edi),>loader=%esi
movl 60(%edi),%esi

# qhasm:   arith = a
# asm 1: mov  <a=int32#1,>arith=int32#7
# asm 2: mov  <a=%eax,>arith=%ebp
mov  %eax,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   arith &= b
# asm 1: andl <b=int32#2,<arith=int32#7
# asm 2: andl <b=%ecx,<arith=%ebp
andl %ecx,%ebp

# qhasm:   arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:   c += loader + 0xd8a1e681
# asm 1: lea  0xd8a1e681(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0xd8a1e681(<c=%edx,<loader=%esi),>c=%edx
lea  0xd8a1e681(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 14
# asm 1: rol  $14,<c=int32#3
# asm 2: rol  $14,<c=%edx
rol  $14,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 16)
# asm 1: movl 16(<in=int32#6),>loader=int32#5
# asm 2: movl 16(<in=%edi),>loader=%esi
movl 16(%edi),%esi

# qhasm:     arith = d
# asm 1: mov  <d=int32#4,>arith=int32#7
# asm 2: mov  <d=%ebx,>arith=%ebp
mov  %ebx,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     arith &= a
# asm 1: andl <a=int32#1,<arith=int32#7
# asm 2: andl <a=%eax,<arith=%ebp
andl %eax,%ebp

# qhasm:     arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:     b += loader + 0xe7d3fbc8
# asm 1: lea  0xe7d3fbc8(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0xe7d3fbc8(<b=%ecx,<loader=%esi),>b=%ecx
lea  0xe7d3fbc8(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 20
# asm 1: rol  $20,<b=int32#2
# asm 2: rol  $20,<b=%ecx
rol  $20,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 36)
# asm 1: movl 36(<in=int32#6),>loader=int32#5
# asm 2: movl 36(<in=%edi),>loader=%esi
movl 36(%edi),%esi

# qhasm:   arith = c
# asm 1: mov  <c=int32#3,>arith=int32#7
# asm 2: mov  <c=%edx,>arith=%ebp
mov  %edx,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   arith &= d
# asm 1: andl <d=int32#4,<arith=int32#7
# asm 2: andl <d=%ebx,<arith=%ebp
andl %ebx,%ebp

# qhasm:   arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:   a += loader + 0x21e1cde6
# asm 1: lea  0x21e1cde6(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0x21e1cde6(<a=%eax,<loader=%esi),>a=%eax
lea  0x21e1cde6(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 5
# asm 1: rol  $5,<a=int32#1
# asm 2: rol  $5,<a=%eax
rol  $5,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 56)
# asm 1: movl 56(<in=int32#6),>loader=int32#5
# asm 2: movl 56(<in=%edi),>loader=%esi
movl 56(%edi),%esi

# qhasm:     arith = b
# asm 1: mov  <b=int32#2,>arith=int32#7
# asm 2: mov  <b=%ecx,>arith=%ebp
mov  %ecx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     arith &= c
# asm 1: andl <c=int32#3,<arith=int32#7
# asm 2: andl <c=%edx,<arith=%ebp
andl %edx,%ebp

# qhasm:     arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:     d += loader + 0xc33707d6
# asm 1: lea  0xc33707d6(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0xc33707d6(<d=%ebx,<loader=%esi),>d=%ebx
lea  0xc33707d6(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 9
# asm 1: rol  $9,<d=int32#4
# asm 2: rol  $9,<d=%ebx
rol  $9,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 12)
# asm 1: movl 12(<in=int32#6),>loader=int32#5
# asm 2: movl 12(<in=%edi),>loader=%esi
movl 12(%edi),%esi

# qhasm:   arith = a
# asm 1: mov  <a=int32#1,>arith=int32#7
# asm 2: mov  <a=%eax,>arith=%ebp
mov  %eax,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   arith &= b
# asm 1: andl <b=int32#2,<arith=int32#7
# asm 2: andl <b=%ecx,<arith=%ebp
andl %ecx,%ebp

# qhasm:   arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:   c += loader + 0xf4d50d87
# asm 1: lea  0xf4d50d87(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0xf4d50d87(<c=%edx,<loader=%esi),>c=%edx
lea  0xf4d50d87(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 14
# asm 1: rol  $14,<c=int32#3
# asm 2: rol  $14,<c=%edx
rol  $14,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 32)
# asm 1: movl 32(<in=int32#6),>loader=int32#5
# asm 2: movl 32(<in=%edi),>loader=%esi
movl 32(%edi),%esi

# qhasm:     arith = d
# asm 1: mov  <d=int32#4,>arith=int32#7
# asm 2: mov  <d=%ebx,>arith=%ebp
mov  %ebx,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     arith &= a
# asm 1: andl <a=int32#1,<arith=int32#7
# asm 2: andl <a=%eax,<arith=%ebp
andl %eax,%ebp

# qhasm:     arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:     b += loader + 0x455a14ed
# asm 1: lea  0x455a14ed(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0x455a14ed(<b=%ecx,<loader=%esi),>b=%ecx
lea  0x455a14ed(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 20
# asm 1: rol  $20,<b=int32#2
# asm 2: rol  $20,<b=%ecx
rol  $20,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 52)
# asm 1: movl 52(<in=int32#6),>loader=int32#5
# asm 2: movl 52(<in=%edi),>loader=%esi
movl 52(%edi),%esi

# qhasm:   arith = c
# asm 1: mov  <c=int32#3,>arith=int32#7
# asm 2: mov  <c=%edx,>arith=%ebp
mov  %edx,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   arith &= d
# asm 1: andl <d=int32#4,<arith=int32#7
# asm 2: andl <d=%ebx,<arith=%ebp
andl %ebx,%ebp

# qhasm:   arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:   a += loader + 0xa9e3e905
# asm 1: lea  0xa9e3e905(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0xa9e3e905(<a=%eax,<loader=%esi),>a=%eax
lea  0xa9e3e905(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 5
# asm 1: rol  $5,<a=int32#1
# asm 2: rol  $5,<a=%eax
rol  $5,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 8)
# asm 1: movl 8(<in=int32#6),>loader=int32#5
# asm 2: movl 8(<in=%edi),>loader=%esi
movl 8(%edi),%esi

# qhasm:     arith = b
# asm 1: mov  <b=int32#2,>arith=int32#7
# asm 2: mov  <b=%ecx,>arith=%ebp
mov  %ecx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     arith &= c
# asm 1: andl <c=int32#3,<arith=int32#7
# asm 2: andl <c=%edx,<arith=%ebp
andl %edx,%ebp

# qhasm:     arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:     d += loader + 0xfcefa3f8
# asm 1: lea  0xfcefa3f8(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0xfcefa3f8(<d=%ebx,<loader=%esi),>d=%ebx
lea  0xfcefa3f8(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 9
# asm 1: rol  $9,<d=int32#4
# asm 2: rol  $9,<d=%ebx
rol  $9,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 28)
# asm 1: movl 28(<in=int32#6),>loader=int32#5
# asm 2: movl 28(<in=%edi),>loader=%esi
movl 28(%edi),%esi

# qhasm:   arith = a
# asm 1: mov  <a=int32#1,>arith=int32#7
# asm 2: mov  <a=%eax,>arith=%ebp
mov  %eax,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   arith &= b
# asm 1: andl <b=int32#2,<arith=int32#7
# asm 2: andl <b=%ecx,<arith=%ebp
andl %ecx,%ebp

# qhasm:   arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:   c += loader + 0x676f02d9
# asm 1: lea  0x676f02d9(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0x676f02d9(<c=%edx,<loader=%esi),>c=%edx
lea  0x676f02d9(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 14
# asm 1: rol  $14,<c=int32#3
# asm 2: rol  $14,<c=%edx
rol  $14,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 48)
# asm 1: movl 48(<in=int32#6),>loader=int32#5
# asm 2: movl 48(<in=%edi),>loader=%esi
movl 48(%edi),%esi

# qhasm:     arith = d
# asm 1: mov  <d=int32#4,>arith=int32#7
# asm 2: mov  <d=%ebx,>arith=%ebp
mov  %ebx,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     arith &= a
# asm 1: andl <a=int32#1,<arith=int32#7
# asm 2: andl <a=%eax,<arith=%ebp
andl %eax,%ebp

# qhasm:     arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:     b += loader + 0x8d2a4c8a
# asm 1: lea  0x8d2a4c8a(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0x8d2a4c8a(<b=%ecx,<loader=%esi),>b=%ecx
lea  0x8d2a4c8a(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 20
# asm 1: rol  $20,<b=int32#2
# asm 2: rol  $20,<b=%ecx
rol  $20,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 20)
# asm 1: movl 20(<in=int32#6),>loader=int32#5
# asm 2: movl 20(<in=%edi),>loader=%esi
movl 20(%edi),%esi

# qhasm:   arith = d
# asm 1: mov  <d=int32#4,>arith=int32#7
# asm 2: mov  <d=%ebx,>arith=%ebp
mov  %ebx,%ebp

# qhasm:   arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   a += loader + 0xfffa3942
# asm 1: lea  0xfffa3942(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0xfffa3942(<a=%eax,<loader=%esi),>a=%eax
lea  0xfffa3942(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 4
# asm 1: rol  $4,<a=int32#1
# asm 2: rol  $4,<a=%eax
rol  $4,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 32)
# asm 1: movl 32(<in=int32#6),>loader=int32#5
# asm 2: movl 32(<in=%edi),>loader=%esi
movl 32(%edi),%esi

# qhasm:     arith = c
# asm 1: mov  <c=int32#3,>arith=int32#7
# asm 2: mov  <c=%edx,>arith=%ebp
mov  %edx,%ebp

# qhasm:     arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     d += loader + 0x8771f681
# asm 1: lea  0x8771f681(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0x8771f681(<d=%ebx,<loader=%esi),>d=%ebx
lea  0x8771f681(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 11
# asm 1: rol  $11,<d=int32#4
# asm 2: rol  $11,<d=%ebx
rol  $11,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 44)
# asm 1: movl 44(<in=int32#6),>loader=int32#5
# asm 2: movl 44(<in=%edi),>loader=%esi
movl 44(%edi),%esi

# qhasm:   arith = b
# asm 1: mov  <b=int32#2,>arith=int32#7
# asm 2: mov  <b=%ecx,>arith=%ebp
mov  %ecx,%ebp

# qhasm:   arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   c += loader + 0x6d9d6122
# asm 1: lea  0x6d9d6122(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0x6d9d6122(<c=%edx,<loader=%esi),>c=%edx
lea  0x6d9d6122(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 16
# asm 1: rol  $16,<c=int32#3
# asm 2: rol  $16,<c=%edx
rol  $16,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 56)
# asm 1: movl 56(<in=int32#6),>loader=int32#5
# asm 2: movl 56(<in=%edi),>loader=%esi
movl 56(%edi),%esi

# qhasm:     arith = a
# asm 1: mov  <a=int32#1,>arith=int32#7
# asm 2: mov  <a=%eax,>arith=%ebp
mov  %eax,%ebp

# qhasm:     arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     b += loader + 0xfde5380c
# asm 1: lea  0xfde5380c(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0xfde5380c(<b=%ecx,<loader=%esi),>b=%ecx
lea  0xfde5380c(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 23
# asm 1: rol  $23,<b=int32#2
# asm 2: rol  $23,<b=%ecx
rol  $23,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 4)
# asm 1: movl 4(<in=int32#6),>loader=int32#5
# asm 2: movl 4(<in=%edi),>loader=%esi
movl 4(%edi),%esi

# qhasm:   arith = d
# asm 1: mov  <d=int32#4,>arith=int32#7
# asm 2: mov  <d=%ebx,>arith=%ebp
mov  %ebx,%ebp

# qhasm:   arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   a += loader + 0xa4beea44
# asm 1: lea  0xa4beea44(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0xa4beea44(<a=%eax,<loader=%esi),>a=%eax
lea  0xa4beea44(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 4
# asm 1: rol  $4,<a=int32#1
# asm 2: rol  $4,<a=%eax
rol  $4,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 16)
# asm 1: movl 16(<in=int32#6),>loader=int32#5
# asm 2: movl 16(<in=%edi),>loader=%esi
movl 16(%edi),%esi

# qhasm:     arith = c
# asm 1: mov  <c=int32#3,>arith=int32#7
# asm 2: mov  <c=%edx,>arith=%ebp
mov  %edx,%ebp

# qhasm:     arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     d += loader + 0x4bdecfa9
# asm 1: lea  0x4bdecfa9(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0x4bdecfa9(<d=%ebx,<loader=%esi),>d=%ebx
lea  0x4bdecfa9(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 11
# asm 1: rol  $11,<d=int32#4
# asm 2: rol  $11,<d=%ebx
rol  $11,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 28)
# asm 1: movl 28(<in=int32#6),>loader=int32#5
# asm 2: movl 28(<in=%edi),>loader=%esi
movl 28(%edi),%esi

# qhasm:   arith = b
# asm 1: mov  <b=int32#2,>arith=int32#7
# asm 2: mov  <b=%ecx,>arith=%ebp
mov  %ecx,%ebp

# qhasm:   arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   c += loader + 0xf6bb4b60
# asm 1: lea  0xf6bb4b60(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0xf6bb4b60(<c=%edx,<loader=%esi),>c=%edx
lea  0xf6bb4b60(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 16
# asm 1: rol  $16,<c=int32#3
# asm 2: rol  $16,<c=%edx
rol  $16,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 40)
# asm 1: movl 40(<in=int32#6),>loader=int32#5
# asm 2: movl 40(<in=%edi),>loader=%esi
movl 40(%edi),%esi

# qhasm:     arith = a
# asm 1: mov  <a=int32#1,>arith=int32#7
# asm 2: mov  <a=%eax,>arith=%ebp
mov  %eax,%ebp

# qhasm:     arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     b += loader + 0xbebfbc70
# asm 1: lea  0xbebfbc70(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0xbebfbc70(<b=%ecx,<loader=%esi),>b=%ecx
lea  0xbebfbc70(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 23
# asm 1: rol  $23,<b=int32#2
# asm 2: rol  $23,<b=%ecx
rol  $23,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 52)
# asm 1: movl 52(<in=int32#6),>loader=int32#5
# asm 2: movl 52(<in=%edi),>loader=%esi
movl 52(%edi),%esi

# qhasm:   arith = d
# asm 1: mov  <d=int32#4,>arith=int32#7
# asm 2: mov  <d=%ebx,>arith=%ebp
mov  %ebx,%ebp

# qhasm:   arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   a += loader + 0x289b7ec6
# asm 1: lea  0x289b7ec6(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0x289b7ec6(<a=%eax,<loader=%esi),>a=%eax
lea  0x289b7ec6(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 4
# asm 1: rol  $4,<a=int32#1
# asm 2: rol  $4,<a=%eax
rol  $4,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 0)
# asm 1: movl 0(<in=int32#6),>loader=int32#5
# asm 2: movl 0(<in=%edi),>loader=%esi
movl 0(%edi),%esi

# qhasm:     arith = c
# asm 1: mov  <c=int32#3,>arith=int32#7
# asm 2: mov  <c=%edx,>arith=%ebp
mov  %edx,%ebp

# qhasm:     arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     d += loader + 0xeaa127fa
# asm 1: lea  0xeaa127fa(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0xeaa127fa(<d=%ebx,<loader=%esi),>d=%ebx
lea  0xeaa127fa(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 11
# asm 1: rol  $11,<d=int32#4
# asm 2: rol  $11,<d=%ebx
rol  $11,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 12)
# asm 1: movl 12(<in=int32#6),>loader=int32#5
# asm 2: movl 12(<in=%edi),>loader=%esi
movl 12(%edi),%esi

# qhasm:   arith = b
# asm 1: mov  <b=int32#2,>arith=int32#7
# asm 2: mov  <b=%ecx,>arith=%ebp
mov  %ecx,%ebp

# qhasm:   arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   c += loader + 0xd4ef3085
# asm 1: lea  0xd4ef3085(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0xd4ef3085(<c=%edx,<loader=%esi),>c=%edx
lea  0xd4ef3085(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 16
# asm 1: rol  $16,<c=int32#3
# asm 2: rol  $16,<c=%edx
rol  $16,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 24)
# asm 1: movl 24(<in=int32#6),>loader=int32#5
# asm 2: movl 24(<in=%edi),>loader=%esi
movl 24(%edi),%esi

# qhasm:     arith = a
# asm 1: mov  <a=int32#1,>arith=int32#7
# asm 2: mov  <a=%eax,>arith=%ebp
mov  %eax,%ebp

# qhasm:     arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     b += loader + 0x04881d05
# asm 1: lea  0x04881d05(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0x04881d05(<b=%ecx,<loader=%esi),>b=%ecx
lea  0x04881d05(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 23
# asm 1: rol  $23,<b=int32#2
# asm 2: rol  $23,<b=%ecx
rol  $23,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 36)
# asm 1: movl 36(<in=int32#6),>loader=int32#5
# asm 2: movl 36(<in=%edi),>loader=%esi
movl 36(%edi),%esi

# qhasm:   arith = d
# asm 1: mov  <d=int32#4,>arith=int32#7
# asm 2: mov  <d=%ebx,>arith=%ebp
mov  %ebx,%ebp

# qhasm:   arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   a += loader + 0xd9d4d039
# asm 1: lea  0xd9d4d039(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0xd9d4d039(<a=%eax,<loader=%esi),>a=%eax
lea  0xd9d4d039(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 4
# asm 1: rol  $4,<a=int32#1
# asm 2: rol  $4,<a=%eax
rol  $4,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 48)
# asm 1: movl 48(<in=int32#6),>loader=int32#5
# asm 2: movl 48(<in=%edi),>loader=%esi
movl 48(%edi),%esi

# qhasm:     arith = c
# asm 1: mov  <c=int32#3,>arith=int32#7
# asm 2: mov  <c=%edx,>arith=%ebp
mov  %edx,%ebp

# qhasm:     arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     d += loader + 0xe6db99e5
# asm 1: lea  0xe6db99e5(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0xe6db99e5(<d=%ebx,<loader=%esi),>d=%ebx
lea  0xe6db99e5(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 11
# asm 1: rol  $11,<d=int32#4
# asm 2: rol  $11,<d=%ebx
rol  $11,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 60)
# asm 1: movl 60(<in=int32#6),>loader=int32#5
# asm 2: movl 60(<in=%edi),>loader=%esi
movl 60(%edi),%esi

# qhasm:   arith = b
# asm 1: mov  <b=int32#2,>arith=int32#7
# asm 2: mov  <b=%ecx,>arith=%ebp
mov  %ecx,%ebp

# qhasm:   arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   c += loader + 0x1fa27cf8
# asm 1: lea  0x1fa27cf8(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0x1fa27cf8(<c=%edx,<loader=%esi),>c=%edx
lea  0x1fa27cf8(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 16
# asm 1: rol  $16,<c=int32#3
# asm 2: rol  $16,<c=%edx
rol  $16,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 8)
# asm 1: movl 8(<in=int32#6),>loader=int32#5
# asm 2: movl 8(<in=%edi),>loader=%esi
movl 8(%edi),%esi

# qhasm:     arith = a
# asm 1: mov  <a=int32#1,>arith=int32#7
# asm 2: mov  <a=%eax,>arith=%ebp
mov  %eax,%ebp

# qhasm:     arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     b += loader + 0xc4ac5665
# asm 1: lea  0xc4ac5665(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0xc4ac5665(<b=%ecx,<loader=%esi),>b=%ecx
lea  0xc4ac5665(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 23
# asm 1: rol  $23,<b=int32#2
# asm 2: rol  $23,<b=%ecx
rol  $23,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 0)
# asm 1: movl 0(<in=int32#6),>loader=int32#5
# asm 2: movl 0(<in=%edi),>loader=%esi
movl 0(%edi),%esi

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   arith |= b
# asm 1: orl  <b=int32#2,<arith=int32#7
# asm 2: orl  <b=%ecx,<arith=%ebp
orl  %ecx,%ebp

# qhasm:   arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:   a += loader + 0xf4292244
# asm 1: lea  0xf4292244(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0xf4292244(<a=%eax,<loader=%esi),>a=%eax
lea  0xf4292244(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 6
# asm 1: rol  $6,<a=int32#1
# asm 2: rol  $6,<a=%eax
rol  $6,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 28)
# asm 1: movl 28(<in=int32#6),>loader=int32#5
# asm 2: movl 28(<in=%edi),>loader=%esi
movl 28(%edi),%esi

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     arith |= a
# asm 1: orl  <a=int32#1,<arith=int32#7
# asm 2: orl  <a=%eax,<arith=%ebp
orl  %eax,%ebp

# qhasm:     arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:     d += loader + 0x432aff97
# asm 1: lea  0x432aff97(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0x432aff97(<d=%ebx,<loader=%esi),>d=%ebx
lea  0x432aff97(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 10
# asm 1: rol  $10,<d=int32#4
# asm 2: rol  $10,<d=%ebx
rol  $10,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 56)
# asm 1: movl 56(<in=int32#6),>loader=int32#5
# asm 2: movl 56(<in=%edi),>loader=%esi
movl 56(%edi),%esi

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   arith |= d
# asm 1: orl  <d=int32#4,<arith=int32#7
# asm 2: orl  <d=%ebx,<arith=%ebp
orl  %ebx,%ebp

# qhasm:   arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:   c += loader + 0xab9423a7
# asm 1: lea  0xab9423a7(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0xab9423a7(<c=%edx,<loader=%esi),>c=%edx
lea  0xab9423a7(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 15
# asm 1: rol  $15,<c=int32#3
# asm 2: rol  $15,<c=%edx
rol  $15,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 20)
# asm 1: movl 20(<in=int32#6),>loader=int32#5
# asm 2: movl 20(<in=%edi),>loader=%esi
movl 20(%edi),%esi

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     arith |= c
# asm 1: orl  <c=int32#3,<arith=int32#7
# asm 2: orl  <c=%edx,<arith=%ebp
orl  %edx,%ebp

# qhasm:     arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:     b += loader + 0xfc93a039
# asm 1: lea  0xfc93a039(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0xfc93a039(<b=%ecx,<loader=%esi),>b=%ecx
lea  0xfc93a039(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 21
# asm 1: rol  $21,<b=int32#2
# asm 2: rol  $21,<b=%ecx
rol  $21,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 48)
# asm 1: movl 48(<in=int32#6),>loader=int32#5
# asm 2: movl 48(<in=%edi),>loader=%esi
movl 48(%edi),%esi

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   arith |= b
# asm 1: orl  <b=int32#2,<arith=int32#7
# asm 2: orl  <b=%ecx,<arith=%ebp
orl  %ecx,%ebp

# qhasm:   arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:   a += loader + 0x655b59c3
# asm 1: lea  0x655b59c3(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0x655b59c3(<a=%eax,<loader=%esi),>a=%eax
lea  0x655b59c3(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 6
# asm 1: rol  $6,<a=int32#1
# asm 2: rol  $6,<a=%eax
rol  $6,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 12)
# asm 1: movl 12(<in=int32#6),>loader=int32#5
# asm 2: movl 12(<in=%edi),>loader=%esi
movl 12(%edi),%esi

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     arith |= a
# asm 1: orl  <a=int32#1,<arith=int32#7
# asm 2: orl  <a=%eax,<arith=%ebp
orl  %eax,%ebp

# qhasm:     arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:     d += loader + 0x8f0ccc92
# asm 1: lea  0x8f0ccc92(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0x8f0ccc92(<d=%ebx,<loader=%esi),>d=%ebx
lea  0x8f0ccc92(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 10
# asm 1: rol  $10,<d=int32#4
# asm 2: rol  $10,<d=%ebx
rol  $10,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 40)
# asm 1: movl 40(<in=int32#6),>loader=int32#5
# asm 2: movl 40(<in=%edi),>loader=%esi
movl 40(%edi),%esi

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   arith |= d
# asm 1: orl  <d=int32#4,<arith=int32#7
# asm 2: orl  <d=%ebx,<arith=%ebp
orl  %ebx,%ebp

# qhasm:   arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:   c += loader + 0xffeff47d
# asm 1: lea  0xffeff47d(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0xffeff47d(<c=%edx,<loader=%esi),>c=%edx
lea  0xffeff47d(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 15
# asm 1: rol  $15,<c=int32#3
# asm 2: rol  $15,<c=%edx
rol  $15,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 4)
# asm 1: movl 4(<in=int32#6),>loader=int32#5
# asm 2: movl 4(<in=%edi),>loader=%esi
movl 4(%edi),%esi

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     arith |= c
# asm 1: orl  <c=int32#3,<arith=int32#7
# asm 2: orl  <c=%edx,<arith=%ebp
orl  %edx,%ebp

# qhasm:     arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:     b += loader + 0x85845dd1
# asm 1: lea  0x85845dd1(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0x85845dd1(<b=%ecx,<loader=%esi),>b=%ecx
lea  0x85845dd1(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 21
# asm 1: rol  $21,<b=int32#2
# asm 2: rol  $21,<b=%ecx
rol  $21,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 32)
# asm 1: movl 32(<in=int32#6),>loader=int32#5
# asm 2: movl 32(<in=%edi),>loader=%esi
movl 32(%edi),%esi

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   arith |= b
# asm 1: orl  <b=int32#2,<arith=int32#7
# asm 2: orl  <b=%ecx,<arith=%ebp
orl  %ecx,%ebp

# qhasm:   arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:   a += loader + 0x6fa87e4f
# asm 1: lea  0x6fa87e4f(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0x6fa87e4f(<a=%eax,<loader=%esi),>a=%eax
lea  0x6fa87e4f(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 6
# asm 1: rol  $6,<a=int32#1
# asm 2: rol  $6,<a=%eax
rol  $6,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 60)
# asm 1: movl 60(<in=int32#6),>loader=int32#5
# asm 2: movl 60(<in=%edi),>loader=%esi
movl 60(%edi),%esi

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     arith |= a
# asm 1: orl  <a=int32#1,<arith=int32#7
# asm 2: orl  <a=%eax,<arith=%ebp
orl  %eax,%ebp

# qhasm:     arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:     d += loader + 0xfe2ce6e0
# asm 1: lea  0xfe2ce6e0(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0xfe2ce6e0(<d=%ebx,<loader=%esi),>d=%ebx
lea  0xfe2ce6e0(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 10
# asm 1: rol  $10,<d=int32#4
# asm 2: rol  $10,<d=%ebx
rol  $10,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 24)
# asm 1: movl 24(<in=int32#6),>loader=int32#5
# asm 2: movl 24(<in=%edi),>loader=%esi
movl 24(%edi),%esi

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   arith |= d
# asm 1: orl  <d=int32#4,<arith=int32#7
# asm 2: orl  <d=%ebx,<arith=%ebp
orl  %ebx,%ebp

# qhasm:   arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:   c += loader + 0xa3014314
# asm 1: lea  0xa3014314(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0xa3014314(<c=%edx,<loader=%esi),>c=%edx
lea  0xa3014314(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 15
# asm 1: rol  $15,<c=int32#3
# asm 2: rol  $15,<c=%edx
rol  $15,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 52)
# asm 1: movl 52(<in=int32#6),>loader=int32#5
# asm 2: movl 52(<in=%edi),>loader=%esi
movl 52(%edi),%esi

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     arith |= c
# asm 1: orl  <c=int32#3,<arith=int32#7
# asm 2: orl  <c=%edx,<arith=%ebp
orl  %edx,%ebp

# qhasm:     arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:     b += loader + 0x4e0811a1
# asm 1: lea  0x4e0811a1(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0x4e0811a1(<b=%ecx,<loader=%esi),>b=%ecx
lea  0x4e0811a1(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 21
# asm 1: rol  $21,<b=int32#2
# asm 2: rol  $21,<b=%ecx
rol  $21,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   loader = *(uint32 *) (in + 16)
# asm 1: movl 16(<in=int32#6),>loader=int32#5
# asm 2: movl 16(<in=%edi),>loader=%esi
movl 16(%edi),%esi

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:   arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:   arith |= b
# asm 1: orl  <b=int32#2,<arith=int32#7
# asm 2: orl  <b=%ecx,<arith=%ebp
orl  %ecx,%ebp

# qhasm:   arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:   a += loader + 0xf7537e82
# asm 1: lea  0xf7537e82(<a=int32#1,<loader=int32#5),>a=int32#1
# asm 2: lea  0xf7537e82(<a=%eax,<loader=%esi),>a=%eax
lea  0xf7537e82(%eax,%esi),%eax

# qhasm:   a += arith
# asm 1: addl <arith=int32#7,<a=int32#1
# asm 2: addl <arith=%ebp,<a=%eax
addl %ebp,%eax

# qhasm:   a <<<= 6
# asm 1: rol  $6,<a=int32#1
# asm 2: rol  $6,<a=%eax
rol  $6,%eax

# qhasm:   a += b
# asm 1: addl <b=int32#2,<a=int32#1
# asm 2: addl <b=%ecx,<a=%eax
addl %ecx,%eax

# qhasm:     loader = *(uint32 *) (in + 44)
# asm 1: movl 44(<in=int32#6),>loader=int32#5
# asm 2: movl 44(<in=%edi),>loader=%esi
movl 44(%edi),%esi

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:     arith ^= c
# asm 1: xorl <c=int32#3,<arith=int32#7
# asm 2: xorl <c=%edx,<arith=%ebp
xorl %edx,%ebp

# qhasm:     arith |= a
# asm 1: orl  <a=int32#1,<arith=int32#7
# asm 2: orl  <a=%eax,<arith=%ebp
orl  %eax,%ebp

# qhasm:     arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:     d += loader + 0xbd3af235
# asm 1: lea  0xbd3af235(<d=int32#4,<loader=int32#5),>d=int32#4
# asm 2: lea  0xbd3af235(<d=%ebx,<loader=%esi),>d=%ebx
lea  0xbd3af235(%ebx,%esi),%ebx

# qhasm:     d += arith
# asm 1: addl <arith=int32#7,<d=int32#4
# asm 2: addl <arith=%ebp,<d=%ebx
addl %ebp,%ebx

# qhasm:     d <<<= 10
# asm 1: rol  $10,<d=int32#4
# asm 2: rol  $10,<d=%ebx
rol  $10,%ebx

# qhasm:     d += a
# asm 1: addl <a=int32#1,<d=int32#4
# asm 2: addl <a=%eax,<d=%ebx
addl %eax,%ebx

# qhasm:   loader = *(uint32 *) (in + 8)
# asm 1: movl 8(<in=int32#6),>loader=int32#5
# asm 2: movl 8(<in=%edi),>loader=%esi
movl 8(%edi),%esi

# qhasm:   arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:   arith ^= b
# asm 1: xorl <b=int32#2,<arith=int32#7
# asm 2: xorl <b=%ecx,<arith=%ebp
xorl %ecx,%ebp

# qhasm:   arith |= d
# asm 1: orl  <d=int32#4,<arith=int32#7
# asm 2: orl  <d=%ebx,<arith=%ebp
orl  %ebx,%ebp

# qhasm:   arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:   c += loader + 0x2ad7d2bb
# asm 1: lea  0x2ad7d2bb(<c=int32#3,<loader=int32#5),>c=int32#3
# asm 2: lea  0x2ad7d2bb(<c=%edx,<loader=%esi),>c=%edx
lea  0x2ad7d2bb(%edx,%esi),%edx

# qhasm:   c += arith
# asm 1: addl <arith=int32#7,<c=int32#3
# asm 2: addl <arith=%ebp,<c=%edx
addl %ebp,%edx

# qhasm:   c <<<= 15
# asm 1: rol  $15,<c=int32#3
# asm 2: rol  $15,<c=%edx
rol  $15,%edx

# qhasm:   c += d
# asm 1: addl <d=int32#4,<c=int32#3
# asm 2: addl <d=%ebx,<c=%edx
addl %ebx,%edx

# qhasm:     loader = *(uint32 *) (in + 36)
# asm 1: movl 36(<in=int32#6),>loader=int32#5
# asm 2: movl 36(<in=%edi),>loader=%esi
movl 36(%edi),%esi

# qhasm:     arith = -1
# asm 1: mov  $-1,>arith=int32#7
# asm 2: mov  $-1,>arith=%ebp
mov  $-1,%ebp

# qhasm:     arith ^= a
# asm 1: xorl <a=int32#1,<arith=int32#7
# asm 2: xorl <a=%eax,<arith=%ebp
xorl %eax,%ebp

# qhasm:     arith |= c
# asm 1: orl  <c=int32#3,<arith=int32#7
# asm 2: orl  <c=%edx,<arith=%ebp
orl  %edx,%ebp

# qhasm:     arith ^= d
# asm 1: xorl <d=int32#4,<arith=int32#7
# asm 2: xorl <d=%ebx,<arith=%ebp
xorl %ebx,%ebp

# qhasm:     b += loader + 0xeb86d391
# asm 1: lea  0xeb86d391(<b=int32#2,<loader=int32#5),>b=int32#2
# asm 2: lea  0xeb86d391(<b=%ecx,<loader=%esi),>b=%ecx
lea  0xeb86d391(%ecx,%esi),%ecx

# qhasm:     b += arith
# asm 1: addl <arith=int32#7,<b=int32#2
# asm 2: addl <arith=%ebp,<b=%ecx
addl %ebp,%ecx

# qhasm:     b <<<= 21
# asm 1: rol  $21,<b=int32#2
# asm 2: rol  $21,<b=%ecx
rol  $21,%ecx

# qhasm:     b += c
# asm 1: addl <c=int32#3,<b=int32#2
# asm 2: addl <c=%edx,<b=%ecx
addl %edx,%ecx

# qhasm:   inlen = inlen_stack
# asm 1: movl <inlen_stack=stack32#7,>inlen=int32#7
# asm 2: movl <inlen_stack=24(%esp),>inlen=%ebp
movl 24(%esp),%ebp

# qhasm:   in += 64
# asm 1: add  $64,<in=int32#6
# asm 2: add  $64,<in=%edi
add  $64,%edi

# qhasm:   inlen -= 64
# asm 1: sub $64,<inlen=int32#7
# asm 2: sub $64,<inlen=%ebp
sub $64,%ebp

# qhasm:   a += ha
# asm 1: addl <ha=stack32#8,<a=int32#1
# asm 2: addl <ha=28(%esp),<a=%eax
addl 28(%esp),%eax

# qhasm:   b += hb
# asm 1: addl <hb=stack32#11,<b=int32#2
# asm 2: addl <hb=40(%esp),<b=%ecx
addl 40(%esp),%ecx

# qhasm:   c += hc
# asm 1: addl <hc=stack32#10,<c=int32#3
# asm 2: addl <hc=36(%esp),<c=%edx
addl 36(%esp),%edx

# qhasm:   d += hd
# asm 1: addl <hd=stack32#9,<d=int32#4
# asm 2: addl <hd=32(%esp),<d=%ebx
addl 32(%esp),%ebx

# qhasm:                   unsigned<? inlen - 64
# asm 1: cmp  $64,<inlen=int32#7
# asm 2: cmp  $64,<inlen=%ebp
cmp  $64,%ebp
# comment:fp stack unchanged by jump

# qhasm: goto mainloop if !unsigned<
jae ._mainloop
# comment:fp stack unchanged by fallthrough

# qhasm: done:
._done:

# qhasm: state = state_stack
# asm 1: movl <state_stack=stack32#6,>state=int32#5
# asm 2: movl <state_stack=20(%esp),>state=%esi
movl 20(%esp),%esi

# qhasm: *(uint32 *) (state + 0) = a
# asm 1: movl <a=int32#1,0(<state=int32#5)
# asm 2: movl <a=%eax,0(<state=%esi)
movl %eax,0(%esi)

# qhasm: *(uint32 *) (state + 4) = b
# asm 1: movl <b=int32#2,4(<state=int32#5)
# asm 2: movl <b=%ecx,4(<state=%esi)
movl %ecx,4(%esi)

# qhasm: *(uint32 *) (state + 8) = c
# asm 1: movl <c=int32#3,8(<state=int32#5)
# asm 2: movl <c=%edx,8(<state=%esi)
movl %edx,8(%esi)

# qhasm: *(uint32 *) (state + 12) = d
# asm 1: movl <d=int32#4,12(<state=int32#5)
# asm 2: movl <d=%ebx,12(<state=%esi)
movl %ebx,12(%esi)

# qhasm: int32 result

# qhasm: assign outputreg 0 to result

# qhasm: result = inlen
# asm 1: mov  <inlen=int32#7,>result=int32#1
# asm 2: mov  <inlen=%ebp,>result=%eax
mov  %ebp,%eax

# qhasm: ecx = ecx_stack
# asm 1: movl <ecx_stack=stack32#1,>ecx=int32#2
# asm 2: movl <ecx_stack=0(%esp),>ecx=%ecx
movl 0(%esp),%ecx

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
add %ecx,%esp
ret
