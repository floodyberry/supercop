
# qhasm: int64 out

# qhasm: int64 in

# qhasm: int64 inlen

# qhasm: int64 result

# qhasm: input out

# qhasm: input in

# qhasm: input inlen

# qhasm: output result

# qhasm: int64 x00

# qhasm: int64 x01

# qhasm: int64 x02

# qhasm: int64 x03

# qhasm: int64 x04

# qhasm: int64 x05

# qhasm: int64 x06

# qhasm: int64 x07

# qhasm: int64 x08

# qhasm: int64 x09

# qhasm: int64 x0a

# qhasm: int64 x0b

# qhasm: int64 x0c

# qhasm: int64 x0d

# qhasm: int64 x0e

# qhasm: int64 x0f

# qhasm: int64 x10

# qhasm: int64 x11

# qhasm: int64 x12

# qhasm: int64 x13

# qhasm: int64 x14

# qhasm: int64 x15

# qhasm: int64 x16

# qhasm: int64 x17

# qhasm: int64 x18

# qhasm: int64 x19

# qhasm: int64 x1a

# qhasm: int64 x1b

# qhasm: int64 x1c

# qhasm: int64 x1d

# qhasm: int64 x1e

# qhasm: int64 x1f

# qhasm: int64 s00

# qhasm: int64 s01

# qhasm: int64 s02

# qhasm: int64 s03

# qhasm: int64 s04

# qhasm: int64 s05

# qhasm: int64 s06

# qhasm: int64 s07

# qhasm: int64 s08

# qhasm: int64 s09

# qhasm: int64 s0a

# qhasm: int64 s0b

# qhasm: int64 s0c

# qhasm: int64 s0d

# qhasm: int64 s0e

# qhasm: int64 s0f

# qhasm: int64 y00

# qhasm: int64 y01

# qhasm: int64 y02

# qhasm: int64 y03

# qhasm: int64 y04

# qhasm: int64 y05

# qhasm: int64 y06

# qhasm: int64 y07

# qhasm: int64 r

# qhasm: int64 i

# qhasm: int64 finalization

# qhasm: stack256 tmp

# qhasm: int64 z

# qhasm: int64 check

# qhasm: stack64 out_stack

# qhasm: stack64 in_stack

# qhasm: stack64 inlen_stack

# qhasm: stack64 finalization_stack

# qhasm: stack64 r_stack

# qhasm: stack64 x02_stack

# qhasm: stack64 x0a_stack

# qhasm: stack64 x0b_stack

# qhasm: stack64 x0c_stack

# qhasm: stack64 x0d_stack

# qhasm: stack64 x0e_stack

# qhasm: stack64 x0f_stack

# qhasm: stack64 x14_stack

# qhasm: stack64 x15_stack

# qhasm: stack64 x16_stack

# qhasm: stack64 x17_stack

# qhasm: stack64 x1c_stack

# qhasm: stack64 x1d_stack

# qhasm: stack64 x1e_stack

# qhasm: stack64 x1f_stack

# qhasm: int64 i16

# qhasm: int64 i17

# qhasm: int64 i18

# qhasm: int64 i19

# qhasm: int64 i20

# qhasm: int64 i21

# qhasm: int64 i22

# qhasm: int64 i23

# qhasm: int64 i28

# qhasm: int64 i30

# qhasm: int64 i31

# qhasm: caller i16

# qhasm: caller i17

# qhasm: caller i18

# qhasm: caller i19

# qhasm: caller i20

# qhasm: caller i21

# qhasm: caller i22

# qhasm: caller i23

# qhasm: caller i28

# qhasm: caller i30

# qhasm: caller i31

# qhasm: stack64 i16_stack

# qhasm: stack64 i17_stack

# qhasm: stack64 i18_stack

# qhasm: stack64 i19_stack

# qhasm: stack64 i20_stack

# qhasm: stack64 i21_stack

# qhasm: stack64 i22_stack

# qhasm: stack64 i23_stack

# qhasm: stack64 i28_stack

# qhasm: stack64 i30_stack

# qhasm: stack64 i31_stack

# qhasm: enter crypto_hash_cubehash1632_mips64
.text
.align 2
.set noat
.globl crypto_hash_cubehash1632_mips64
.ent crypto_hash_cubehash1632_mips64
crypto_hash_cubehash1632_mips64:
daddiu $sp,$sp,-320

# qhasm:   i16_stack = i16
# asm 1: sd <i16=int64#15,>i16_stack=stack64#1($sp)
# asm 2: sd <i16=$16,>i16_stack=32($sp)
sd $16,32($sp)

# qhasm:   i17_stack = i17
# asm 1: sd <i17=int64#16,>i17_stack=stack64#2($sp)
# asm 2: sd <i17=$17,>i17_stack=40($sp)
sd $17,40($sp)

# qhasm:   i18_stack = i18
# asm 1: sd <i18=int64#17,>i18_stack=stack64#3($sp)
# asm 2: sd <i18=$18,>i18_stack=48($sp)
sd $18,48($sp)

# qhasm:   i19_stack = i19
# asm 1: sd <i19=int64#18,>i19_stack=stack64#4($sp)
# asm 2: sd <i19=$19,>i19_stack=56($sp)
sd $19,56($sp)

# qhasm:   i20_stack = i20
# asm 1: sd <i20=int64#19,>i20_stack=stack64#5($sp)
# asm 2: sd <i20=$20,>i20_stack=64($sp)
sd $20,64($sp)

# qhasm:   i21_stack = i21
# asm 1: sd <i21=int64#20,>i21_stack=stack64#6($sp)
# asm 2: sd <i21=$21,>i21_stack=72($sp)
sd $21,72($sp)

# qhasm:   i22_stack = i22
# asm 1: sd <i22=int64#21,>i22_stack=stack64#7($sp)
# asm 2: sd <i22=$22,>i22_stack=80($sp)
sd $22,80($sp)

# qhasm:   i23_stack = i23
# asm 1: sd <i23=int64#22,>i23_stack=stack64#8($sp)
# asm 2: sd <i23=$23,>i23_stack=88($sp)
sd $23,88($sp)

# qhasm:   i28_stack = i28
# asm 1: sd <i28=int64#25,>i28_stack=stack64#9($sp)
# asm 2: sd <i28=$28,>i28_stack=96($sp)
sd $28,96($sp)

# qhasm:   i30_stack = i30
# asm 1: sd <i30=int64#26,>i30_stack=stack64#10($sp)
# asm 2: sd <i30=$30,>i30_stack=104($sp)
sd $30,104($sp)

# qhasm:   i31_stack = i31
# asm 1: sd <i31=int64#27,>i31_stack=stack64#11($sp)
# asm 2: sd <i31=$31,>i31_stack=112($sp)
sd $31,112($sp)

# qhasm:   out_stack = out
# asm 1: sd <out=int64#1,>out_stack=stack64#12($sp)
# asm 2: sd <out=$4,>out_stack=120($sp)
sd $4,120($sp)

# qhasm:   x08 = 0x4d420000
# asm 1: li >x08=int64#1,0x4d420000
# asm 2: li >x08=$4,0x4d420000
li $4,0x4d420000

# qhasm:   x08 |= 0xc787
# asm 1: ori <x08=int64#1,<x08=int64#1,0xc787
# asm 2: ori <x08=$4,<x08=$4,0xc787
ori $4,$4,0xc787

# qhasm:   x09 = 0xa6470000
# asm 1: li >x09=int64#4,0xa6470000
# asm 2: li >x09=$7,0xa6470000
li $7,0xa6470000

# qhasm:   x09 |= 0xa8b3
# asm 1: ori <x09=int64#4,<x09=int64#4,0xa8b3
# asm 2: ori <x09=$7,<x09=$7,0xa8b3
ori $7,$7,0xa8b3

# qhasm:   x0a = 0x97cf0000
# asm 1: li >x0a=int64#5,0x97cf0000
# asm 2: li >x0a=$8,0x97cf0000
li $8,0x97cf0000

# qhasm:   x0a |= 0x0bef
# asm 1: ori <x0a=int64#5,<x0a=int64#5,0x0bef
# asm 2: ori <x0a=$8,<x0a=$8,0x0bef
ori $8,$8,0x0bef

# qhasm:   x0b = 0x825b0000
# asm 1: li >x0b=int64#6,0x825b0000
# asm 2: li >x0b=$9,0x825b0000
li $9,0x825b0000

# qhasm:   x0b |= 0x4537
# asm 1: ori <x0b=int64#6,<x0b=int64#6,0x4537
# asm 2: ori <x0b=$9,<x0b=$9,0x4537
ori $9,$9,0x4537

# qhasm:   x0c = 0xeef80000
# asm 1: li >x0c=int64#7,0xeef80000
# asm 2: li >x0c=$10,0xeef80000
li $10,0xeef80000

# qhasm:   x0c |= 0x64d2
# asm 1: ori <x0c=int64#7,<x0c=int64#7,0x64d2
# asm 2: ori <x0c=$10,<x0c=$10,0x64d2
ori $10,$10,0x64d2

# qhasm:   x0d = 0xf2200000
# asm 1: li >x0d=int64#8,0xf2200000
# asm 2: li >x0d=$11,0xf2200000
li $11,0xf2200000

# qhasm:   x0d |= 0x90c4
# asm 1: ori <x0d=int64#8,<x0d=int64#8,0x90c4
# asm 2: ori <x0d=$11,<x0d=$11,0x90c4
ori $11,$11,0x90c4

# qhasm:   x0e = 0xd0e50000
# asm 1: li >x0e=int64#9,0xd0e50000
# asm 2: li >x0e=$2,0xd0e50000
li $2,0xd0e50000

# qhasm:   x0e |= 0xcd33
# asm 1: ori <x0e=int64#9,<x0e=int64#9,0xcd33
# asm 2: ori <x0e=$2,<x0e=$2,0xcd33
ori $2,$2,0xcd33

# qhasm:   x0f = 0xa2390000
# asm 1: li >x0f=int64#10,0xa2390000
# asm 2: li >x0f=$3,0xa2390000
li $3,0xa2390000

# qhasm:   x0f |= 0x11ae
# asm 1: ori <x0f=int64#10,<x0f=int64#10,0x11ae
# asm 2: ori <x0f=$3,<x0f=$3,0x11ae
ori $3,$3,0x11ae

# qhasm:   x0b_stack = x0b
# asm 1: sd <x0b=int64#6,>x0b_stack=stack64#13($sp)
# asm 2: sd <x0b=$9,>x0b_stack=128($sp)
sd $9,128($sp)

# qhasm:   x0c_stack = x0c
# asm 1: sd <x0c=int64#7,>x0c_stack=stack64#14($sp)
# asm 2: sd <x0c=$10,>x0c_stack=136($sp)
sd $10,136($sp)

# qhasm:   x0d_stack = x0d
# asm 1: sd <x0d=int64#8,>x0d_stack=stack64#15($sp)
# asm 2: sd <x0d=$11,>x0d_stack=144($sp)
sd $11,144($sp)

# qhasm:   x0e_stack = x0e
# asm 1: sd <x0e=int64#9,>x0e_stack=stack64#16($sp)
# asm 2: sd <x0e=$2,>x0e_stack=152($sp)
sd $2,152($sp)

# qhasm:   x0f_stack = x0f
# asm 1: sd <x0f=int64#10,>x0f_stack=stack64#17($sp)
# asm 2: sd <x0f=$3,>x0f_stack=160($sp)
sd $3,160($sp)

# qhasm:   x10 = 0xfcd30000
# asm 1: li >x10=int64#6,0xfcd30000
# asm 2: li >x10=$9,0xfcd30000
li $9,0xfcd30000

# qhasm:   x10 |= 0x98d9
# asm 1: ori <x10=int64#6,<x10=int64#6,0x98d9
# asm 2: ori <x10=$9,<x10=$9,0x98d9
ori $9,$9,0x98d9

# qhasm:   x11 = 0x148f0000
# asm 1: li >x11=int64#7,0x148f0000
# asm 2: li >x11=$10,0x148f0000
li $10,0x148f0000

# qhasm:   x11 |= 0xe485
# asm 1: ori <x11=int64#7,<x11=int64#7,0xe485
# asm 2: ori <x11=$10,<x11=$10,0xe485
ori $10,$10,0xe485

# qhasm:   x12 = 0x1b010000
# asm 1: li >x12=int64#9,0x1b010000
# asm 2: li >x12=$2,0x1b010000
li $2,0x1b010000

# qhasm:   x12 |= 0x7bef
# asm 1: ori <x12=int64#9,<x12=int64#9,0x7bef
# asm 2: ori <x12=$2,<x12=$2,0x7bef
ori $2,$2,0x7bef

# qhasm:   x13 = 0xb6440000
# asm 1: li >x13=int64#11,0xb6440000
# asm 2: li >x13=$12,0xb6440000
li $12,0xb6440000

# qhasm:   x13 |= 0x4532
# asm 1: ori <x13=int64#11,<x13=int64#11,0x4532
# asm 2: ori <x13=$12,<x13=$12,0x4532
ori $12,$12,0x4532

# qhasm:   x14 = 0x6a530000
# asm 1: li >x14=int64#12,0x6a530000
# asm 2: li >x14=$13,0x6a530000
li $13,0x6a530000

# qhasm:   x14 |= 0x6159
# asm 1: ori <x14=int64#12,<x14=int64#12,0x6159
# asm 2: ori <x14=$13,<x14=$13,0x6159
ori $13,$13,0x6159

# qhasm:   x15 = 0x2ff50000
# asm 1: li >x15=int64#13,0x2ff50000
# asm 2: li >x15=$14,0x2ff50000
li $14,0x2ff50000

# qhasm:   x15 |= 0x781c
# asm 1: ori <x15=int64#13,<x15=int64#13,0x781c
# asm 2: ori <x15=$14,<x15=$14,0x781c
ori $14,$14,0x781c

# qhasm:   x16 = 0x91fa0000
# asm 1: li >x16=int64#14,0x91fa0000
# asm 2: li >x16=$15,0x91fa0000
li $15,0x91fa0000

# qhasm:   x16 |= 0x7934
# asm 1: ori <x16=int64#14,<x16=int64#14,0x7934
# asm 2: ori <x16=$15,<x16=$15,0x7934
ori $15,$15,0x7934

# qhasm:   x17 = 0x0dba0000
# asm 1: li >x17=int64#15,0x0dba0000
# asm 2: li >x17=$16,0x0dba0000
li $16,0x0dba0000

# qhasm:   x17 |= 0xdea9
# asm 1: ori <x17=int64#15,<x17=int64#15,0xdea9
# asm 2: ori <x17=$16,<x17=$16,0xdea9
ori $16,$16,0xdea9

# qhasm:   x14_stack = x14
# asm 1: sd <x14=int64#12,>x14_stack=stack64#18($sp)
# asm 2: sd <x14=$13,>x14_stack=168($sp)
sd $13,168($sp)

# qhasm:   x15_stack = x15
# asm 1: sd <x15=int64#13,>x15_stack=stack64#19($sp)
# asm 2: sd <x15=$14,>x15_stack=176($sp)
sd $14,176($sp)

# qhasm:   x16_stack = x16
# asm 1: sd <x16=int64#14,>x16_stack=stack64#20($sp)
# asm 2: sd <x16=$15,>x16_stack=184($sp)
sd $15,184($sp)

# qhasm:   x17_stack = x17
# asm 1: sd <x17=int64#15,>x17_stack=stack64#21($sp)
# asm 2: sd <x17=$16,>x17_stack=192($sp)
sd $16,192($sp)

# qhasm:   x18 = 0xd65c0000
# asm 1: li >x18=int64#12,0xd65c0000
# asm 2: li >x18=$13,0xd65c0000
li $13,0xd65c0000

# qhasm:   x18 |= 0x8a2b
# asm 1: ori <x18=int64#12,<x18=int64#12,0x8a2b
# asm 2: ori <x18=$13,<x18=$13,0x8a2b
ori $13,$13,0x8a2b

# qhasm:   x19 = 0xa5a70000
# asm 1: li >x19=int64#13,0xa5a70000
# asm 2: li >x19=$14,0xa5a70000
li $14,0xa5a70000

# qhasm:   x19 |= 0x0e75
# asm 1: ori <x19=int64#13,<x19=int64#13,0x0e75
# asm 2: ori <x19=$14,<x19=$14,0x0e75
ori $14,$14,0x0e75

# qhasm:   x1a = 0xb1c60000
# asm 1: li >x1a=int64#14,0xb1c60000
# asm 2: li >x1a=$15,0xb1c60000
li $15,0xb1c60000

# qhasm:   x1a |= 0x2456
# asm 1: ori <x1a=int64#14,<x1a=int64#14,0x2456
# asm 2: ori <x1a=$15,<x1a=$15,0x2456
ori $15,$15,0x2456

# qhasm:   x1b = 0xbc790000
# asm 1: li >x1b=int64#15,0xbc790000
# asm 2: li >x1b=$16,0xbc790000
li $16,0xbc790000

# qhasm:   x1b |= 0x6576
# asm 1: ori <x1b=int64#15,<x1b=int64#15,0x6576
# asm 2: ori <x1b=$16,<x1b=$16,0x6576
ori $16,$16,0x6576

# qhasm:   x1c = 0x19210000
# asm 1: li >x1c=int64#16,0x19210000
# asm 2: li >x1c=$17,0x19210000
li $17,0x19210000

# qhasm:   x1c |= 0xc8f7
# asm 1: ori <x1c=int64#16,<x1c=int64#16,0xc8f7
# asm 2: ori <x1c=$17,<x1c=$17,0xc8f7
ori $17,$17,0xc8f7

# qhasm:   x1d = 0xe7980000
# asm 1: li >x1d=int64#17,0xe7980000
# asm 2: li >x1d=$18,0xe7980000
li $18,0xe7980000

# qhasm:   x1d |= 0x9af1
# asm 1: ori <x1d=int64#17,<x1d=int64#17,0x9af1
# asm 2: ori <x1d=$18,<x1d=$18,0x9af1
ori $18,$18,0x9af1

# qhasm:   x1e = 0x77950000
# asm 1: li >x1e=int64#18,0x77950000
# asm 2: li >x1e=$19,0x77950000
li $19,0x77950000

# qhasm:   x1e |= 0xd246
# asm 1: ori <x1e=int64#18,<x1e=int64#18,0xd246
# asm 2: ori <x1e=$19,<x1e=$19,0xd246
ori $19,$19,0xd246

# qhasm:   x1f = 0xd43e0000
# asm 1: li >x1f=int64#19,0xd43e0000
# asm 2: li >x1f=$20,0xd43e0000
li $20,0xd43e0000

# qhasm:   x1f |= 0x3b44
# asm 1: ori <x1f=int64#19,<x1f=int64#19,0x3b44
# asm 2: ori <x1f=$20,<x1f=$20,0x3b44
ori $20,$20,0x3b44

# qhasm:   x1c_stack = x1c
# asm 1: sd <x1c=int64#16,>x1c_stack=stack64#22($sp)
# asm 2: sd <x1c=$17,>x1c_stack=200($sp)
sd $17,200($sp)

# qhasm:   x1d_stack = x1d
# asm 1: sd <x1d=int64#17,>x1d_stack=stack64#23($sp)
# asm 2: sd <x1d=$18,>x1d_stack=208($sp)
sd $18,208($sp)

# qhasm:   x1e_stack = x1e
# asm 1: sd <x1e=int64#18,>x1e_stack=stack64#24($sp)
# asm 2: sd <x1e=$19,>x1e_stack=216($sp)
sd $19,216($sp)

# qhasm:   x1f_stack = x1f
# asm 1: sd <x1f=int64#19,>x1f_stack=stack64#25($sp)
# asm 2: sd <x1f=$20,>x1f_stack=224($sp)
sd $20,224($sp)

# qhasm:   x00 = 0x2aea0000
# asm 1: li >x00=int64#16,0x2aea0000
# asm 2: li >x00=$17,0x2aea0000
li $17,0x2aea0000

# qhasm:   x00 |= 0x2a61
# asm 1: ori <x00=int64#16,<x00=int64#16,0x2a61
# asm 2: ori <x00=$17,<x00=$17,0x2a61
ori $17,$17,0x2a61

# qhasm:   x01 = 0x50f40000
# asm 1: li >x01=int64#17,0x50f40000
# asm 2: li >x01=$18,0x50f40000
li $18,0x50f40000

# qhasm:   x01 |= 0x94d4
# asm 1: ori <x01=int64#17,<x01=int64#17,0x94d4
# asm 2: ori <x01=$18,<x01=$18,0x94d4
ori $18,$18,0x94d4

# qhasm:   x02 = 0x2d530000
# asm 1: li >x02=int64#18,0x2d530000
# asm 2: li >x02=$19,0x2d530000
li $19,0x2d530000

# qhasm:   x02 |= 0x8b8b
# asm 1: ori <x02=int64#18,<x02=int64#18,0x8b8b
# asm 2: ori <x02=$19,<x02=$19,0x8b8b
ori $19,$19,0x8b8b

# qhasm:   x03 = 0x41670000
# asm 1: li >x03=int64#19,0x41670000
# asm 2: li >x03=$20,0x41670000
li $20,0x41670000

# qhasm:   x03 |= 0xd83e
# asm 1: ori <x03=int64#19,<x03=int64#19,0xd83e
# asm 2: ori <x03=$20,<x03=$20,0xd83e
ori $20,$20,0xd83e

# qhasm:   x04 = 0x3fee0000
# asm 1: li >x04=int64#20,0x3fee0000
# asm 2: li >x04=$21,0x3fee0000
li $21,0x3fee0000

# qhasm:   x04 |= 0x2313
# asm 1: ori <x04=int64#20,<x04=int64#20,0x2313
# asm 2: ori <x04=$21,<x04=$21,0x2313
ori $21,$21,0x2313

# qhasm:   x05 = 0xc7010000
# asm 1: li >x05=int64#21,0xc7010000
# asm 2: li >x05=$22,0xc7010000
li $22,0xc7010000

# qhasm:   x05 |= 0xcf8c
# asm 1: ori <x05=int64#21,<x05=int64#21,0xcf8c
# asm 2: ori <x05=$22,<x05=$22,0xcf8c
ori $22,$22,0xcf8c

# qhasm:   x06 = 0xcc390000
# asm 1: li >x06=int64#22,0xcc390000
# asm 2: li >x06=$23,0xcc390000
li $23,0xcc390000

# qhasm:   x06 |= 0x968e
# asm 1: ori <x06=int64#22,<x06=int64#22,0x968e
# asm 2: ori <x06=$23,<x06=$23,0x968e
ori $23,$23,0x968e

# qhasm:   x07 = 0x50ac0000
# asm 1: li >x07=int64#23,0x50ac0000
# asm 2: li >x07=$24,0x50ac0000
li $24,0x50ac0000

# qhasm:   x07 |= 0x5695
# asm 1: ori <x07=int64#23,<x07=int64#23,0x5695
# asm 2: ori <x07=$24,<x07=$24,0x5695
ori $24,$24,0x5695

# qhasm:   finalization = 0
# asm 1: li >finalization=int64#24,0
# asm 2: li >finalization=$25,0
li $25,0

# qhasm: checkinlen:
._checkinlen:

# qhasm:                      inlen -= 32
# asm 1: daddiu <inlen=int64#3,<inlen=int64#3,-32
# asm 2: daddiu <inlen=$6,<inlen=$6,-32
daddiu $6,$6,-32

# qhasm: goto inlenbelow32 if inlen < 0
# asm 1: bltz <inlen=int64#3,._inlenbelow32
# asm 2: bltz <inlen=$6,._inlenbelow32
bltz $6,._inlenbelow32
nop

# qhasm: mainloop:
._mainloop:

# qhasm:   r = 16
# asm 1: li >r=int64#25,16
# asm 2: li >r=$28,16
li $28,16

# qhasm:   finalization_stack = finalization
# asm 1: sd <finalization=int64#24,>finalization_stack=stack64#26($sp)
# asm 2: sd <finalization=$25,>finalization_stack=232($sp)
sd $25,232($sp)

# qhasm:   inlen_stack = inlen
# asm 1: sd <inlen=int64#3,>inlen_stack=stack64#27($sp)
# asm 2: sd <inlen=$6,>inlen_stack=240($sp)
sd $6,240($sp)

# qhasm:   new y00

# qhasm:   new y01

# qhasm:   new y02

# qhasm:   new y03

# qhasm:   y00 left = *(unaligned uint32 *) (in + 0)
# asm 1: lwr <y00=int64#3,0(<in=int64#2)
# asm 2: lwr <y00=$6,0(<in=$5)
lwr $6,0($5)

# qhasm:   y00 right = *(unaligned uint32 *) (in + 0)
# asm 1: lwl <y00=int64#3,3+0(<in=int64#2)
# asm 2: lwl <y00=$6,3+0(<in=$5)
lwl $6,3+0($5)

# qhasm:   y01 left = *(unaligned uint32 *) (in + 4)
# asm 1: lwr <y01=int64#24,4(<in=int64#2)
# asm 2: lwr <y01=$25,4(<in=$5)
lwr $25,4($5)

# qhasm:   y01 right = *(unaligned uint32 *) (in + 4)
# asm 1: lwl <y01=int64#24,3+4(<in=int64#2)
# asm 2: lwl <y01=$25,3+4(<in=$5)
lwl $25,3+4($5)

# qhasm:   y02 left = *(unaligned uint32 *) (in + 8)
# asm 1: lwr <y02=int64#26,8(<in=int64#2)
# asm 2: lwr <y02=$30,8(<in=$5)
lwr $30,8($5)

# qhasm:   y02 right = *(unaligned uint32 *) (in + 8)
# asm 1: lwl <y02=int64#26,3+8(<in=int64#2)
# asm 2: lwl <y02=$30,3+8(<in=$5)
lwl $30,3+8($5)

# qhasm:   y03 left = *(unaligned uint32 *) (in + 12)
# asm 1: lwr <y03=int64#27,12(<in=int64#2)
# asm 2: lwr <y03=$31,12(<in=$5)
lwr $31,12($5)

# qhasm:   y03 right = *(unaligned uint32 *) (in + 12)
# asm 1: lwl <y03=int64#27,3+12(<in=int64#2)
# asm 2: lwl <y03=$31,3+12(<in=$5)
lwl $31,3+12($5)

# qhasm:   x00 ^= y00
# asm 1: xor <x00=int64#16,<x00=int64#16,<y00=int64#3
# asm 2: xor <x00=$17,<x00=$17,<y00=$6
xor $17,$17,$6

# qhasm:   x01 ^= y01
# asm 1: xor <x01=int64#17,<x01=int64#17,<y01=int64#24
# asm 2: xor <x01=$18,<x01=$18,<y01=$25
xor $18,$18,$25

# qhasm:   x02 ^= y02
# asm 1: xor <x02=int64#18,<x02=int64#18,<y02=int64#26
# asm 2: xor <x02=$19,<x02=$19,<y02=$30
xor $19,$19,$30

# qhasm:   x03 ^= y03
# asm 1: xor <x03=int64#19,<x03=int64#19,<y03=int64#27
# asm 2: xor <x03=$20,<x03=$20,<y03=$31
xor $20,$20,$31

# qhasm:   new y04

# qhasm:   new y05

# qhasm:   new y06

# qhasm:   new y07

# qhasm:   y04 left = *(unaligned uint32 *) (in + 16)
# asm 1: lwr <y04=int64#3,16(<in=int64#2)
# asm 2: lwr <y04=$6,16(<in=$5)
lwr $6,16($5)

# qhasm:   y04 right = *(unaligned uint32 *) (in + 16)
# asm 1: lwl <y04=int64#3,3+16(<in=int64#2)
# asm 2: lwl <y04=$6,3+16(<in=$5)
lwl $6,3+16($5)

# qhasm:   y05 left = *(unaligned uint32 *) (in + 20)
# asm 1: lwr <y05=int64#24,20(<in=int64#2)
# asm 2: lwr <y05=$25,20(<in=$5)
lwr $25,20($5)

# qhasm:   y05 right = *(unaligned uint32 *) (in + 20)
# asm 1: lwl <y05=int64#24,3+20(<in=int64#2)
# asm 2: lwl <y05=$25,3+20(<in=$5)
lwl $25,3+20($5)

# qhasm:   x04 ^= y04
# asm 1: xor <x04=int64#20,<x04=int64#20,<y04=int64#3
# asm 2: xor <x04=$21,<x04=$21,<y04=$6
xor $21,$21,$6

# qhasm:   x05 ^= y05
# asm 1: xor <x05=int64#21,<x05=int64#21,<y05=int64#24
# asm 2: xor <x05=$22,<x05=$22,<y05=$25
xor $22,$22,$25

# qhasm:   y06 left = *(unaligned uint32 *) (in + 24)
# asm 1: lwr <y06=int64#26,24(<in=int64#2)
# asm 2: lwr <y06=$30,24(<in=$5)
lwr $30,24($5)

# qhasm:   y06 right = *(unaligned uint32 *) (in + 24)
# asm 1: lwl <y06=int64#26,3+24(<in=int64#2)
# asm 2: lwl <y06=$30,3+24(<in=$5)
lwl $30,3+24($5)

# qhasm:   y07 left = *(unaligned uint32 *) (in + 28)
# asm 1: lwr <y07=int64#27,28(<in=int64#2)
# asm 2: lwr <y07=$31,28(<in=$5)
lwr $31,28($5)

# qhasm:   y07 right = *(unaligned uint32 *) (in + 28)
# asm 1: lwl <y07=int64#27,3+28(<in=int64#2)
# asm 2: lwl <y07=$31,3+28(<in=$5)
lwl $31,3+28($5)

# qhasm:   x06 ^= y06
# asm 1: xor <x06=int64#22,<x06=int64#22,<y06=int64#26
# asm 2: xor <x06=$23,<x06=$23,<y06=$30
xor $23,$23,$30

# qhasm:   x07 ^= y07
# asm 1: xor <x07=int64#23,<x07=int64#23,<y07=int64#27
# asm 2: xor <x07=$24,<x07=$24,<y07=$31
xor $24,$24,$31

# qhasm:   in += 32
# asm 1: daddiu <in=int64#2,<in=int64#2,32
# asm 2: daddiu <in=$5,<in=$5,32
daddiu $5,$5,32

# qhasm:   in_stack = in
# asm 1: sd <in=int64#2,>in_stack=stack64#28($sp)
# asm 2: sd <in=$5,>in_stack=248($sp)
sd $5,248($sp)

# qhasm: morerounds:
._morerounds:

# qhasm: r_stack = r
# asm 1: sd <r=int64#25,>r_stack=stack64#29($sp)
# asm 2: sd <r=$28,>r_stack=256($sp)
sd $28,256($sp)

# qhasm:   x10 += x00
# asm 1: daddu <x10=int64#6,<x10=int64#6,<x00=int64#16
# asm 2: daddu <x10=$9,<x10=$9,<x00=$17
daddu $9,$9,$17

# qhasm:   x12 += x02
# asm 1: daddu <x12=int64#9,<x12=int64#9,<x02=int64#18
# asm 2: daddu <x12=$2,<x12=$2,<x02=$19
daddu $2,$2,$19

# qhasm:   x18 += x08
# asm 1: daddu <x18=int64#12,<x18=int64#12,<x08=int64#1
# asm 2: daddu <x18=$13,<x18=$13,<x08=$4
daddu $13,$13,$4

# qhasm:   x1a += x0a
# asm 1: daddu <x1a=int64#14,<x1a=int64#14,<x0a=int64#5
# asm 2: daddu <x1a=$15,<x1a=$15,<x0a=$8
daddu $15,$15,$8

# qhasm:   s00 = x00 << 7
# asm 1: dsll >s00=int64#2,<x00=int64#16,7
# asm 2: dsll >s00=$5,<x00=$17,7
dsll $5,$17,7

# qhasm:   (uint32) x00 >>= 25
# asm 1: srl <x00=int64#16,<x00=int64#16,25
# asm 2: srl <x00=$17,<x00=$17,25
srl $17,$17,25

# qhasm:   x00 |= s00
# asm 1: or <x00=int64#16,<x00=int64#16,<s00=int64#2
# asm 2: or <x00=$17,<x00=$17,<s00=$5
or $17,$17,$5

# qhasm:   s02 = x02 << 7
# asm 1: dsll >s02=int64#2,<x02=int64#18,7
# asm 2: dsll >s02=$5,<x02=$19,7
dsll $5,$19,7

# qhasm:   (uint32) x02 >>= 25
# asm 1: srl <x02=int64#18,<x02=int64#18,25
# asm 2: srl <x02=$19,<x02=$19,25
srl $19,$19,25

# qhasm:   x02 |= s02
# asm 1: or <x02=int64#18,<x02=int64#18,<s02=int64#2
# asm 2: or <x02=$19,<x02=$19,<s02=$5
or $19,$19,$5

# qhasm:   s08 = x08 << 7
# asm 1: dsll >s08=int64#2,<x08=int64#1,7
# asm 2: dsll >s08=$5,<x08=$4,7
dsll $5,$4,7

# qhasm:   (uint32) x08 >>= 25
# asm 1: srl <x08=int64#1,<x08=int64#1,25
# asm 2: srl <x08=$4,<x08=$4,25
srl $4,$4,25

# qhasm:   x08 |= s08
# asm 1: or <x08=int64#1,<x08=int64#1,<s08=int64#2
# asm 2: or <x08=$4,<x08=$4,<s08=$5
or $4,$4,$5

# qhasm:   s0a = x0a << 7
# asm 1: dsll >s0a=int64#2,<x0a=int64#5,7
# asm 2: dsll >s0a=$5,<x0a=$8,7
dsll $5,$8,7

# qhasm:   (uint32) x0a >>= 25
# asm 1: srl <x0a=int64#5,<x0a=int64#5,25
# asm 2: srl <x0a=$8,<x0a=$8,25
srl $8,$8,25

# qhasm:   x0a |= s0a
# asm 1: or <x0a=int64#5,<x0a=int64#5,<s0a=int64#2
# asm 2: or <x0a=$8,<x0a=$8,<s0a=$5
or $8,$8,$5

# qhasm:   x00 ^= x18
# asm 1: xor <x00=int64#16,<x00=int64#16,<x18=int64#12
# asm 2: xor <x00=$17,<x00=$17,<x18=$13
xor $17,$17,$13

# qhasm:   x02 ^= x1a
# asm 1: xor <x02=int64#18,<x02=int64#18,<x1a=int64#14
# asm 2: xor <x02=$19,<x02=$19,<x1a=$15
xor $19,$19,$15

# qhasm:   x08 ^= x10
# asm 1: xor <x08=int64#1,<x08=int64#1,<x10=int64#6
# asm 2: xor <x08=$4,<x08=$4,<x10=$9
xor $4,$4,$9

# qhasm:   x0a ^= x12
# asm 1: xor <x0a=int64#5,<x0a=int64#5,<x12=int64#9
# asm 2: xor <x0a=$8,<x0a=$8,<x12=$2
xor $8,$8,$2

# qhasm:           x02_stack = x02
# asm 1: sd <x02=int64#18,>x02_stack=stack64#15($sp)
# asm 2: sd <x02=$19,>x02_stack=144($sp)
sd $19,144($sp)

# qhasm:   x1a += x00
# asm 1: daddu <x1a=int64#14,<x1a=int64#14,<x00=int64#16
# asm 2: daddu <x1a=$15,<x1a=$15,<x00=$17
daddu $15,$15,$17

# qhasm:           x0a_stack = x0a
# asm 1: sd <x0a=int64#5,>x0a_stack=stack64#17($sp)
# asm 2: sd <x0a=$8,>x0a_stack=160($sp)
sd $8,160($sp)

# qhasm:   x18 += x02
# asm 1: daddu <x18=int64#12,<x18=int64#12,<x02=int64#18
# asm 2: daddu <x18=$13,<x18=$13,<x02=$19
daddu $13,$13,$19

# qhasm:           x14 = x14_stack
# asm 1: ld >x14=int64#2,<x14_stack=stack64#18($sp)
# asm 2: ld >x14=$5,<x14_stack=168($sp)
ld $5,168($sp)

# qhasm:   x12 += x08
# asm 1: daddu <x12=int64#9,<x12=int64#9,<x08=int64#1
# asm 2: daddu <x12=$2,<x12=$2,<x08=$4
daddu $2,$2,$4

# qhasm:           x16 = x16_stack
# asm 1: ld >x16=int64#3,<x16_stack=stack64#20($sp)
# asm 2: ld >x16=$6,<x16_stack=184($sp)
ld $6,184($sp)

# qhasm:   x10 += x0a
# asm 1: daddu <x10=int64#6,<x10=int64#6,<x0a=int64#5
# asm 2: daddu <x10=$9,<x10=$9,<x0a=$8
daddu $9,$9,$8

# qhasm:           x1c = x1c_stack
# asm 1: ld >x1c=int64#5,<x1c_stack=stack64#22($sp)
# asm 2: ld >x1c=$8,<x1c_stack=200($sp)
ld $8,200($sp)

# qhasm:   x14 += x04
# asm 1: daddu <x14=int64#2,<x14=int64#2,<x04=int64#20
# asm 2: daddu <x14=$5,<x14=$5,<x04=$21
daddu $5,$5,$21

# qhasm:           x1e = x1e_stack
# asm 1: ld >x1e=int64#18,<x1e_stack=stack64#24($sp)
# asm 2: ld >x1e=$19,<x1e_stack=216($sp)
ld $19,216($sp)

# qhasm: 	  x0c = x0c_stack
# asm 1: ld >x0c=int64#24,<x0c_stack=stack64#14($sp)
# asm 2: ld >x0c=$25,<x0c_stack=136($sp)
ld $25,136($sp)

# qhasm: 	  x0e = x0e_stack
# asm 1: ld >x0e=int64#25,<x0e_stack=stack64#16($sp)
# asm 2: ld >x0e=$28,<x0e_stack=152($sp)
ld $28,152($sp)

# qhasm:   x16 += x06
# asm 1: daddu <x16=int64#3,<x16=int64#3,<x06=int64#22
# asm 2: daddu <x16=$6,<x16=$6,<x06=$23
daddu $6,$6,$23

# qhasm:   x1c += x0c
# asm 1: daddu <x1c=int64#5,<x1c=int64#5,<x0c=int64#24
# asm 2: daddu <x1c=$8,<x1c=$8,<x0c=$25
daddu $8,$8,$25

# qhasm:   x1e += x0e
# asm 1: daddu <x1e=int64#18,<x1e=int64#18,<x0e=int64#25
# asm 2: daddu <x1e=$19,<x1e=$19,<x0e=$28
daddu $19,$19,$28

# qhasm:   s04 = x04 << 7
# asm 1: dsll >s04=int64#26,<x04=int64#20,7
# asm 2: dsll >s04=$30,<x04=$21,7
dsll $30,$21,7

# qhasm:   (uint32) x04 >>= 25
# asm 1: srl <x04=int64#20,<x04=int64#20,25
# asm 2: srl <x04=$21,<x04=$21,25
srl $21,$21,25

# qhasm:   x04 |= s04
# asm 1: or <x04=int64#20,<x04=int64#20,<s04=int64#26
# asm 2: or <x04=$21,<x04=$21,<s04=$30
or $21,$21,$30

# qhasm:   s06 = x06 << 7
# asm 1: dsll >s06=int64#26,<x06=int64#22,7
# asm 2: dsll >s06=$30,<x06=$23,7
dsll $30,$23,7

# qhasm:   (uint32) x06 >>= 25
# asm 1: srl <x06=int64#22,<x06=int64#22,25
# asm 2: srl <x06=$23,<x06=$23,25
srl $23,$23,25

# qhasm:   x06 |= s06
# asm 1: or <x06=int64#22,<x06=int64#22,<s06=int64#26
# asm 2: or <x06=$23,<x06=$23,<s06=$30
or $23,$23,$30

# qhasm:   s0c = x0c << 7
# asm 1: dsll >s0c=int64#26,<x0c=int64#24,7
# asm 2: dsll >s0c=$30,<x0c=$25,7
dsll $30,$25,7

# qhasm:   (uint32) x0c >>= 25
# asm 1: srl <x0c=int64#24,<x0c=int64#24,25
# asm 2: srl <x0c=$25,<x0c=$25,25
srl $25,$25,25

# qhasm:   x0c |= s0c
# asm 1: or <x0c=int64#24,<x0c=int64#24,<s0c=int64#26
# asm 2: or <x0c=$25,<x0c=$25,<s0c=$30
or $25,$25,$30

# qhasm:   s0e = x0e << 7
# asm 1: dsll >s0e=int64#26,<x0e=int64#25,7
# asm 2: dsll >s0e=$30,<x0e=$28,7
dsll $30,$28,7

# qhasm:   (uint32) x0e >>= 25
# asm 1: srl <x0e=int64#25,<x0e=int64#25,25
# asm 2: srl <x0e=$28,<x0e=$28,25
srl $28,$28,25

# qhasm:   x0e |= s0e
# asm 1: or <x0e=int64#25,<x0e=int64#25,<s0e=int64#26
# asm 2: or <x0e=$28,<x0e=$28,<s0e=$30
or $28,$28,$30

# qhasm:   x04 ^= x1c
# asm 1: xor <x04=int64#20,<x04=int64#20,<x1c=int64#5
# asm 2: xor <x04=$21,<x04=$21,<x1c=$8
xor $21,$21,$8

# qhasm:   x06 ^= x1e
# asm 1: xor <x06=int64#22,<x06=int64#22,<x1e=int64#18
# asm 2: xor <x06=$23,<x06=$23,<x1e=$19
xor $23,$23,$19

# qhasm:   x0c ^= x14
# asm 1: xor <x0c=int64#24,<x0c=int64#24,<x14=int64#2
# asm 2: xor <x0c=$25,<x0c=$25,<x14=$5
xor $25,$25,$5

# qhasm:   x0e ^= x16
# asm 1: xor <x0e=int64#25,<x0e=int64#25,<x16=int64#3
# asm 2: xor <x0e=$28,<x0e=$28,<x16=$6
xor $28,$28,$6

# qhasm:           x0b = x0b_stack
# asm 1: ld >x0b=int64#26,<x0b_stack=stack64#13($sp)
# asm 2: ld >x0b=$30,<x0b_stack=128($sp)
ld $30,128($sp)

# qhasm:   x1e += x04
# asm 1: daddu <x1e=int64#18,<x1e=int64#18,<x04=int64#20
# asm 2: daddu <x1e=$19,<x1e=$19,<x04=$21
daddu $19,$19,$21

# qhasm:   x1c += x06
# asm 1: daddu <x1c=int64#5,<x1c=int64#5,<x06=int64#22
# asm 2: daddu <x1c=$8,<x1c=$8,<x06=$23
daddu $8,$8,$23

# qhasm:   x16 += x0c
# asm 1: daddu <x16=int64#3,<x16=int64#3,<x0c=int64#24
# asm 2: daddu <x16=$6,<x16=$6,<x0c=$25
daddu $6,$6,$25

# qhasm:   x14 += x0e
# asm 1: daddu <x14=int64#2,<x14=int64#2,<x0e=int64#25
# asm 2: daddu <x14=$5,<x14=$5,<x0e=$28
daddu $5,$5,$28

# qhasm:           x1e_stack = x1e
# asm 1: sd <x1e=int64#18,>x1e_stack=stack64#13($sp)
# asm 2: sd <x1e=$19,>x1e_stack=128($sp)
sd $19,128($sp)

# qhasm:   x11 += x01
# asm 1: daddu <x11=int64#7,<x11=int64#7,<x01=int64#17
# asm 2: daddu <x11=$10,<x11=$10,<x01=$18
daddu $10,$10,$18

# qhasm:           x1c_stack = x1c
# asm 1: sd <x1c=int64#5,>x1c_stack=stack64#14($sp)
# asm 2: sd <x1c=$8,>x1c_stack=136($sp)
sd $8,136($sp)

# qhasm:   x13 += x03
# asm 1: daddu <x13=int64#11,<x13=int64#11,<x03=int64#19
# asm 2: daddu <x13=$12,<x13=$12,<x03=$20
daddu $12,$12,$20

# qhasm:           x16_stack = x16
# asm 1: sd <x16=int64#3,>x16_stack=stack64#16($sp)
# asm 2: sd <x16=$6,>x16_stack=152($sp)
sd $6,152($sp)

# qhasm:   x19 += x09
# asm 1: daddu <x19=int64#13,<x19=int64#13,<x09=int64#4
# asm 2: daddu <x19=$14,<x19=$14,<x09=$7
daddu $14,$14,$7

# qhasm:           x14_stack = x14
# asm 1: sd <x14=int64#2,>x14_stack=stack64#18($sp)
# asm 2: sd <x14=$5,>x14_stack=168($sp)
sd $5,168($sp)

# qhasm: 	  x0c_stack = x0c
# asm 1: sd <x0c=int64#24,>x0c_stack=stack64#20($sp)
# asm 2: sd <x0c=$25,>x0c_stack=184($sp)
sd $25,184($sp)

# qhasm: 	  x0e_stack = x0e
# asm 1: sd <x0e=int64#25,>x0e_stack=stack64#22($sp)
# asm 2: sd <x0e=$28,>x0e_stack=200($sp)
sd $28,200($sp)

# qhasm:   x1b += x0b
# asm 1: daddu <x1b=int64#15,<x1b=int64#15,<x0b=int64#26
# asm 2: daddu <x1b=$16,<x1b=$16,<x0b=$30
daddu $16,$16,$30

# qhasm:   s01 = x01 << 7
# asm 1: dsll >s01=int64#2,<x01=int64#17,7
# asm 2: dsll >s01=$5,<x01=$18,7
dsll $5,$18,7

# qhasm:   (uint32) x01 >>= 25
# asm 1: srl <x01=int64#17,<x01=int64#17,25
# asm 2: srl <x01=$18,<x01=$18,25
srl $18,$18,25

# qhasm:   x01 |= s01
# asm 1: or <x01=int64#17,<x01=int64#17,<s01=int64#2
# asm 2: or <x01=$18,<x01=$18,<s01=$5
or $18,$18,$5

# qhasm:   s03 = x03 << 7
# asm 1: dsll >s03=int64#2,<x03=int64#19,7
# asm 2: dsll >s03=$5,<x03=$20,7
dsll $5,$20,7

# qhasm:   (uint32) x03 >>= 25
# asm 1: srl <x03=int64#19,<x03=int64#19,25
# asm 2: srl <x03=$20,<x03=$20,25
srl $20,$20,25

# qhasm:   x03 |= s03
# asm 1: or <x03=int64#19,<x03=int64#19,<s03=int64#2
# asm 2: or <x03=$20,<x03=$20,<s03=$5
or $20,$20,$5

# qhasm:   s09 = x09 << 7
# asm 1: dsll >s09=int64#2,<x09=int64#4,7
# asm 2: dsll >s09=$5,<x09=$7,7
dsll $5,$7,7

# qhasm:   (uint32) x09 >>= 25
# asm 1: srl <x09=int64#4,<x09=int64#4,25
# asm 2: srl <x09=$7,<x09=$7,25
srl $7,$7,25

# qhasm:   x09 |= s09
# asm 1: or <x09=int64#4,<x09=int64#4,<s09=int64#2
# asm 2: or <x09=$7,<x09=$7,<s09=$5
or $7,$7,$5

# qhasm:   s0b = x0b << 7
# asm 1: dsll >s0b=int64#2,<x0b=int64#26,7
# asm 2: dsll >s0b=$5,<x0b=$30,7
dsll $5,$30,7

# qhasm:   (uint32) x0b >>= 25
# asm 1: srl <x0b=int64#26,<x0b=int64#26,25
# asm 2: srl <x0b=$30,<x0b=$30,25
srl $30,$30,25

# qhasm:   x0b |= s0b
# asm 1: or <x0b=int64#26,<x0b=int64#26,<s0b=int64#2
# asm 2: or <x0b=$30,<x0b=$30,<s0b=$5
or $30,$30,$5

# qhasm:   x01 ^= x19
# asm 1: xor <x01=int64#17,<x01=int64#17,<x19=int64#13
# asm 2: xor <x01=$18,<x01=$18,<x19=$14
xor $18,$18,$14

# qhasm:   x03 ^= x1b
# asm 1: xor <x03=int64#19,<x03=int64#19,<x1b=int64#15
# asm 2: xor <x03=$20,<x03=$20,<x1b=$16
xor $20,$20,$16

# qhasm:   x09 ^= x11
# asm 1: xor <x09=int64#4,<x09=int64#4,<x11=int64#7
# asm 2: xor <x09=$7,<x09=$7,<x11=$10
xor $7,$7,$10

# qhasm:   x0b ^= x13
# asm 1: xor <x0b=int64#26,<x0b=int64#26,<x13=int64#11
# asm 2: xor <x0b=$30,<x0b=$30,<x13=$12
xor $30,$30,$12

# qhasm:           x15 = x15_stack
# asm 1: ld >x15=int64#2,<x15_stack=stack64#19($sp)
# asm 2: ld >x15=$5,<x15_stack=176($sp)
ld $5,176($sp)

# qhasm:   x1b += x01
# asm 1: daddu <x1b=int64#15,<x1b=int64#15,<x01=int64#17
# asm 2: daddu <x1b=$16,<x1b=$16,<x01=$18
daddu $16,$16,$18

# qhasm:           x17 = x17_stack
# asm 1: ld >x17=int64#3,<x17_stack=stack64#21($sp)
# asm 2: ld >x17=$6,<x17_stack=192($sp)
ld $6,192($sp)

# qhasm:   x19 += x03
# asm 1: daddu <x19=int64#13,<x19=int64#13,<x03=int64#19
# asm 2: daddu <x19=$14,<x19=$14,<x03=$20
daddu $14,$14,$20

# qhasm:           x1d = x1d_stack
# asm 1: ld >x1d=int64#5,<x1d_stack=stack64#23($sp)
# asm 2: ld >x1d=$8,<x1d_stack=208($sp)
ld $8,208($sp)

# qhasm:   x13 += x09
# asm 1: daddu <x13=int64#11,<x13=int64#11,<x09=int64#4
# asm 2: daddu <x13=$12,<x13=$12,<x09=$7
daddu $12,$12,$7

# qhasm:           x1f = x1f_stack
# asm 1: ld >x1f=int64#18,<x1f_stack=stack64#25($sp)
# asm 2: ld >x1f=$19,<x1f_stack=224($sp)
ld $19,224($sp)

# qhasm:   x11 += x0b
# asm 1: daddu <x11=int64#7,<x11=int64#7,<x0b=int64#26
# asm 2: daddu <x11=$10,<x11=$10,<x0b=$30
daddu $10,$10,$30

# qhasm:           x0b_stack = x0b
# asm 1: sd <x0b=int64#26,>x0b_stack=stack64#19($sp)
# asm 2: sd <x0b=$30,>x0b_stack=176($sp)
sd $30,176($sp)

# qhasm:           x0d_stack = x0d
# asm 1: sd <x0d=int64#8,>x0d_stack=stack64#30($sp)
# asm 2: sd <x0d=$11,>x0d_stack=264($sp)
sd $11,264($sp)

# qhasm:           x0f_stack = x0f
# asm 1: sd <x0f=int64#10,>x0f_stack=stack64#31($sp)
# asm 2: sd <x0f=$3,>x0f_stack=272($sp)
sd $3,272($sp)

# qhasm:   x15 += x05
# asm 1: daddu <x15=int64#2,<x15=int64#2,<x05=int64#21
# asm 2: daddu <x15=$5,<x15=$5,<x05=$22
daddu $5,$5,$22

# qhasm:   x17 += x07
# asm 1: daddu <x17=int64#3,<x17=int64#3,<x07=int64#23
# asm 2: daddu <x17=$6,<x17=$6,<x07=$24
daddu $6,$6,$24

# qhasm:   x1d += x0d
# asm 1: daddu <x1d=int64#5,<x1d=int64#5,<x0d=int64#8
# asm 2: daddu <x1d=$8,<x1d=$8,<x0d=$11
daddu $8,$8,$11

# qhasm:   x1f += x0f
# asm 1: daddu <x1f=int64#18,<x1f=int64#18,<x0f=int64#10
# asm 2: daddu <x1f=$19,<x1f=$19,<x0f=$3
daddu $19,$19,$3

# qhasm:   s05 = x05 << 7
# asm 1: dsll >s05=int64#24,<x05=int64#21,7
# asm 2: dsll >s05=$25,<x05=$22,7
dsll $25,$22,7

# qhasm:   (uint32) x05 >>= 25
# asm 1: srl <x05=int64#21,<x05=int64#21,25
# asm 2: srl <x05=$22,<x05=$22,25
srl $22,$22,25

# qhasm:   x05 |= s05
# asm 1: or <x05=int64#21,<x05=int64#21,<s05=int64#24
# asm 2: or <x05=$22,<x05=$22,<s05=$25
or $22,$22,$25

# qhasm:   s07 = x07 << 7
# asm 1: dsll >s07=int64#24,<x07=int64#23,7
# asm 2: dsll >s07=$25,<x07=$24,7
dsll $25,$24,7

# qhasm:   (uint32) x07 >>= 25
# asm 1: srl <x07=int64#23,<x07=int64#23,25
# asm 2: srl <x07=$24,<x07=$24,25
srl $24,$24,25

# qhasm:   x07 |= s07
# asm 1: or <x07=int64#23,<x07=int64#23,<s07=int64#24
# asm 2: or <x07=$24,<x07=$24,<s07=$25
or $24,$24,$25

# qhasm:   s0d = x0d << 7
# asm 1: dsll >s0d=int64#24,<x0d=int64#8,7
# asm 2: dsll >s0d=$25,<x0d=$11,7
dsll $25,$11,7

# qhasm:   (uint32) x0d >>= 25
# asm 1: srl <x0d=int64#8,<x0d=int64#8,25
# asm 2: srl <x0d=$11,<x0d=$11,25
srl $11,$11,25

# qhasm:   x0d |= s0d
# asm 1: or <x0d=int64#8,<x0d=int64#8,<s0d=int64#24
# asm 2: or <x0d=$11,<x0d=$11,<s0d=$25
or $11,$11,$25

# qhasm:   s0f = x0f << 7
# asm 1: dsll >s0f=int64#24,<x0f=int64#10,7
# asm 2: dsll >s0f=$25,<x0f=$3,7
dsll $25,$3,7

# qhasm:   (uint32) x0f >>= 25
# asm 1: srl <x0f=int64#10,<x0f=int64#10,25
# asm 2: srl <x0f=$3,<x0f=$3,25
srl $3,$3,25

# qhasm:   x0f |= s0f
# asm 1: or <x0f=int64#10,<x0f=int64#10,<s0f=int64#24
# asm 2: or <x0f=$3,<x0f=$3,<s0f=$25
or $3,$3,$25

# qhasm:   x05 ^= x1d
# asm 1: xor <x05=int64#21,<x05=int64#21,<x1d=int64#5
# asm 2: xor <x05=$22,<x05=$22,<x1d=$8
xor $22,$22,$8

# qhasm:   x07 ^= x1f
# asm 1: xor <x07=int64#23,<x07=int64#23,<x1f=int64#18
# asm 2: xor <x07=$24,<x07=$24,<x1f=$19
xor $24,$24,$19

# qhasm:   x0d ^= x15
# asm 1: xor <x0d=int64#8,<x0d=int64#8,<x15=int64#2
# asm 2: xor <x0d=$11,<x0d=$11,<x15=$5
xor $11,$11,$5

# qhasm:   x0f ^= x17
# asm 1: xor <x0f=int64#10,<x0f=int64#10,<x17=int64#3
# asm 2: xor <x0f=$3,<x0f=$3,<x17=$6
xor $3,$3,$6

# qhasm:   x1f += x05
# asm 1: daddu <x1f=int64#18,<x1f=int64#18,<x05=int64#21
# asm 2: daddu <x1f=$19,<x1f=$19,<x05=$22
daddu $19,$19,$22

# qhasm:   x1d += x07
# asm 1: daddu <x1d=int64#5,<x1d=int64#5,<x07=int64#23
# asm 2: daddu <x1d=$8,<x1d=$8,<x07=$24
daddu $8,$8,$24

# qhasm:   x17 += x0d
# asm 1: daddu <x17=int64#3,<x17=int64#3,<x0d=int64#8
# asm 2: daddu <x17=$6,<x17=$6,<x0d=$11
daddu $6,$6,$11

# qhasm:   x15 += x0f
# asm 1: daddu <x15=int64#2,<x15=int64#2,<x0f=int64#10
# asm 2: daddu <x15=$5,<x15=$5,<x0f=$3
daddu $5,$5,$3

# qhasm:           x1e = x1e_stack
# asm 1: ld >x1e=int64#24,<x1e_stack=stack64#13($sp)
# asm 2: ld >x1e=$25,<x1e_stack=128($sp)
ld $25,128($sp)

# qhasm: 	  x0d_stack = x0d
# asm 1: sd <x0d=int64#8,>x0d_stack=stack64#13($sp)
# asm 2: sd <x0d=$11,>x0d_stack=128($sp)
sd $11,128($sp)

# qhasm: 	  x0f_stack = x0f
# asm 1: sd <x0f=int64#10,>x0f_stack=stack64#21($sp)
# asm 2: sd <x0f=$3,>x0f_stack=192($sp)
sd $3,192($sp)

# qhasm:   s00 = x00 << 11
# asm 1: dsll >s00=int64#8,<x00=int64#16,11
# asm 2: dsll >s00=$11,<x00=$17,11
dsll $11,$17,11

# qhasm:   (uint32) x00 >>= 21
# asm 1: srl <x00=int64#16,<x00=int64#16,21
# asm 2: srl <x00=$17,<x00=$17,21
srl $17,$17,21

# qhasm:   x00 |= s00
# asm 1: or <x00=int64#16,<x00=int64#16,<s00=int64#8
# asm 2: or <x00=$17,<x00=$17,<s00=$11
or $17,$17,$11

# qhasm:           x16 = x16_stack
# asm 1: ld >x16=int64#8,<x16_stack=stack64#16($sp)
# asm 2: ld >x16=$11,<x16_stack=152($sp)
ld $11,152($sp)

# qhasm:   s01 = x01 << 11
# asm 1: dsll >s01=int64#10,<x01=int64#17,11
# asm 2: dsll >s01=$3,<x01=$18,11
dsll $3,$18,11

# qhasm:   (uint32) x01 >>= 21
# asm 1: srl <x01=int64#17,<x01=int64#17,21
# asm 2: srl <x01=$18,<x01=$18,21
srl $18,$18,21

# qhasm:   x01 |= s01
# asm 1: or <x01=int64#17,<x01=int64#17,<s01=int64#10
# asm 2: or <x01=$18,<x01=$18,<s01=$3
or $18,$18,$3

# qhasm:           x15_stack = x15
# asm 1: sd <x15=int64#2,>x15_stack=stack64#16($sp)
# asm 2: sd <x15=$5,>x15_stack=152($sp)
sd $5,152($sp)

# qhasm:   s08 = x08 << 11
# asm 1: dsll >s08=int64#2,<x08=int64#1,11
# asm 2: dsll >s08=$5,<x08=$4,11
dsll $5,$4,11

# qhasm:   (uint32) x08 >>= 21
# asm 1: srl <x08=int64#1,<x08=int64#1,21
# asm 2: srl <x08=$4,<x08=$4,21
srl $4,$4,21

# qhasm:   x08 |= s08
# asm 1: or <x08=int64#1,<x08=int64#1,<s08=int64#2
# asm 2: or <x08=$4,<x08=$4,<s08=$5
or $4,$4,$5

# qhasm:           x1d_stack = x1d
# asm 1: sd <x1d=int64#5,>x1d_stack=stack64#23($sp)
# asm 2: sd <x1d=$8,>x1d_stack=208($sp)
sd $8,208($sp)

# qhasm:   s09 = x09 << 11
# asm 1: dsll >s09=int64#2,<x09=int64#4,11
# asm 2: dsll >s09=$5,<x09=$7,11
dsll $5,$7,11

# qhasm:   (uint32) x09 >>= 21
# asm 1: srl <x09=int64#4,<x09=int64#4,21
# asm 2: srl <x09=$7,<x09=$7,21
srl $7,$7,21

# qhasm:   x09 |= s09
# asm 1: or <x09=int64#4,<x09=int64#4,<s09=int64#2
# asm 2: or <x09=$7,<x09=$7,<s09=$5
or $7,$7,$5

# qhasm:   x00 ^= x1e
# asm 1: xor <x00=int64#16,<x00=int64#16,<x1e=int64#24
# asm 2: xor <x00=$17,<x00=$17,<x1e=$25
xor $17,$17,$25

# qhasm:   x01 ^= x1f
# asm 1: xor <x01=int64#17,<x01=int64#17,<x1f=int64#18
# asm 2: xor <x01=$18,<x01=$18,<x1f=$19
xor $18,$18,$19

# qhasm:   x08 ^= x16
# asm 1: xor <x08=int64#1,<x08=int64#1,<x16=int64#8
# asm 2: xor <x08=$4,<x08=$4,<x16=$11
xor $4,$4,$11

# qhasm:   x09 ^= x17
# asm 1: xor <x09=int64#4,<x09=int64#4,<x17=int64#3
# asm 2: xor <x09=$7,<x09=$7,<x17=$6
xor $7,$7,$6

# qhasm:   x1f += x00
# asm 1: daddu <x1f=int64#18,<x1f=int64#18,<x00=int64#16
# asm 2: daddu <x1f=$19,<x1f=$19,<x00=$17
daddu $19,$19,$17

# qhasm:   x1e += x01
# asm 1: daddu <x1e=int64#24,<x1e=int64#24,<x01=int64#17
# asm 2: daddu <x1e=$25,<x1e=$25,<x01=$18
daddu $25,$25,$18

# qhasm:   x17 += x08
# asm 1: daddu <x17=int64#3,<x17=int64#3,<x08=int64#1
# asm 2: daddu <x17=$6,<x17=$6,<x08=$4
daddu $6,$6,$4

# qhasm:   x16 += x09
# asm 1: daddu <x16=int64#8,<x16=int64#8,<x09=int64#4
# asm 2: daddu <x16=$11,<x16=$11,<x09=$7
daddu $11,$11,$7

# qhasm:   s00 = x00 << 7
# asm 1: dsll >s00=int64#2,<x00=int64#16,7
# asm 2: dsll >s00=$5,<x00=$17,7
dsll $5,$17,7

# qhasm:   (uint32) x00 >>= 25
# asm 1: srl <x00=int64#16,<x00=int64#16,25
# asm 2: srl <x00=$17,<x00=$17,25
srl $17,$17,25

# qhasm:   x00 |= s00
# asm 1: or <x00=int64#16,<x00=int64#16,<s00=int64#2
# asm 2: or <x00=$17,<x00=$17,<s00=$5
or $17,$17,$5

# qhasm:           x1f_stack = x1f
# asm 1: sd <x1f=int64#18,>x1f_stack=stack64#24($sp)
# asm 2: sd <x1f=$19,>x1f_stack=216($sp)
sd $19,216($sp)

# qhasm:   s01 = x01 << 7
# asm 1: dsll >s01=int64#2,<x01=int64#17,7
# asm 2: dsll >s01=$5,<x01=$18,7
dsll $5,$18,7

# qhasm:   (uint32) x01 >>= 25
# asm 1: srl <x01=int64#17,<x01=int64#17,25
# asm 2: srl <x01=$18,<x01=$18,25
srl $18,$18,25

# qhasm:   x01 |= s01
# asm 1: or <x01=int64#17,<x01=int64#17,<s01=int64#2
# asm 2: or <x01=$18,<x01=$18,<s01=$5
or $18,$18,$5

# qhasm:           x1e_stack = x1e
# asm 1: sd <x1e=int64#24,>x1e_stack=stack64#25($sp)
# asm 2: sd <x1e=$25,>x1e_stack=224($sp)
sd $25,224($sp)

# qhasm:   s08 = x08 << 7
# asm 1: dsll >s08=int64#2,<x08=int64#1,7
# asm 2: dsll >s08=$5,<x08=$4,7
dsll $5,$4,7

# qhasm:   (uint32) x08 >>= 25
# asm 1: srl <x08=int64#1,<x08=int64#1,25
# asm 2: srl <x08=$4,<x08=$4,25
srl $4,$4,25

# qhasm:   x08 |= s08
# asm 1: or <x08=int64#1,<x08=int64#1,<s08=int64#2
# asm 2: or <x08=$4,<x08=$4,<s08=$5
or $4,$4,$5

# qhasm:           x17_stack = x17
# asm 1: sd <x17=int64#3,>x17_stack=stack64#32($sp)
# asm 2: sd <x17=$6,>x17_stack=280($sp)
sd $6,280($sp)

# qhasm:   s09 = x09 << 7
# asm 1: dsll >s09=int64#2,<x09=int64#4,7
# asm 2: dsll >s09=$5,<x09=$7,7
dsll $5,$7,7

# qhasm:   (uint32) x09 >>= 25
# asm 1: srl <x09=int64#4,<x09=int64#4,25
# asm 2: srl <x09=$7,<x09=$7,25
srl $7,$7,25

# qhasm:   x09 |= s09
# asm 1: or <x09=int64#4,<x09=int64#4,<s09=int64#2
# asm 2: or <x09=$7,<x09=$7,<s09=$5
or $7,$7,$5

# qhasm:           x16_stack = x16
# asm 1: sd <x16=int64#8,>x16_stack=stack64#33($sp)
# asm 2: sd <x16=$11,>x16_stack=288($sp)
sd $11,288($sp)

# qhasm:   x00 ^= x17
# asm 1: xor <x00=int64#16,<x00=int64#16,<x17=int64#3
# asm 2: xor <x00=$17,<x00=$17,<x17=$6
xor $17,$17,$6

# qhasm:           x02 = x02_stack
# asm 1: ld >x02=int64#2,<x02_stack=stack64#15($sp)
# asm 2: ld >x02=$5,<x02_stack=144($sp)
ld $5,144($sp)

# qhasm:   x01 ^= x16
# asm 1: xor <x01=int64#17,<x01=int64#17,<x16=int64#8
# asm 2: xor <x01=$18,<x01=$18,<x16=$11
xor $18,$18,$11

# qhasm:           x0a = x0a_stack
# asm 1: ld >x0a=int64#3,<x0a_stack=stack64#17($sp)
# asm 2: ld >x0a=$6,<x0a_stack=160($sp)
ld $6,160($sp)

# qhasm:   x08 ^= x1f
# asm 1: xor <x08=int64#1,<x08=int64#1,<x1f=int64#18
# asm 2: xor <x08=$4,<x08=$4,<x1f=$19
xor $4,$4,$19

# qhasm:           x0b = x0b_stack
# asm 1: ld >x0b=int64#5,<x0b_stack=stack64#19($sp)
# asm 2: ld >x0b=$8,<x0b_stack=176($sp)
ld $8,176($sp)

# qhasm:   x09 ^= x1e
# asm 1: xor <x09=int64#4,<x09=int64#4,<x1e=int64#24
# asm 2: xor <x09=$7,<x09=$7,<x1e=$25
xor $7,$7,$25

# qhasm:           x1c = x1c_stack
# asm 1: ld >x1c=int64#8,<x1c_stack=stack64#14($sp)
# asm 2: ld >x1c=$11,<x1c_stack=136($sp)
ld $11,136($sp)

# qhasm:   s02 = x02 << 11
# asm 1: dsll >s02=int64#10,<x02=int64#2,11
# asm 2: dsll >s02=$3,<x02=$5,11
dsll $3,$5,11

# qhasm:   (uint32) x02 >>= 21
# asm 1: srl <x02=int64#2,<x02=int64#2,21
# asm 2: srl <x02=$5,<x02=$5,21
srl $5,$5,21

# qhasm:   x02 |= s02
# asm 1: or <x02=int64#2,<x02=int64#2,<s02=int64#10
# asm 2: or <x02=$5,<x02=$5,<s02=$3
or $5,$5,$3

# qhasm:           x1d = x1d_stack
# asm 1: ld >x1d=int64#10,<x1d_stack=stack64#23($sp)
# asm 2: ld >x1d=$3,<x1d_stack=208($sp)
ld $3,208($sp)

# qhasm:   s03 = x03 << 11
# asm 1: dsll >s03=int64#18,<x03=int64#19,11
# asm 2: dsll >s03=$19,<x03=$20,11
dsll $19,$20,11

# qhasm:   (uint32) x03 >>= 21
# asm 1: srl <x03=int64#19,<x03=int64#19,21
# asm 2: srl <x03=$20,<x03=$20,21
srl $20,$20,21

# qhasm:   x03 |= s03
# asm 1: or <x03=int64#19,<x03=int64#19,<s03=int64#18
# asm 2: or <x03=$20,<x03=$20,<s03=$19
or $20,$20,$19

# qhasm:           x14 = x14_stack
# asm 1: ld >x14=int64#18,<x14_stack=stack64#18($sp)
# asm 2: ld >x14=$19,<x14_stack=168($sp)
ld $19,168($sp)

# qhasm:   s0a = x0a << 11
# asm 1: dsll >s0a=int64#24,<x0a=int64#3,11
# asm 2: dsll >s0a=$25,<x0a=$6,11
dsll $25,$6,11

# qhasm:   (uint32) x0a >>= 21
# asm 1: srl <x0a=int64#3,<x0a=int64#3,21
# asm 2: srl <x0a=$6,<x0a=$6,21
srl $6,$6,21

# qhasm:   x0a |= s0a
# asm 1: or <x0a=int64#3,<x0a=int64#3,<s0a=int64#24
# asm 2: or <x0a=$6,<x0a=$6,<s0a=$25
or $6,$6,$25

# qhasm:           x15 = x15_stack
# asm 1: ld >x15=int64#24,<x15_stack=stack64#16($sp)
# asm 2: ld >x15=$25,<x15_stack=152($sp)
ld $25,152($sp)

# qhasm:   s0b = x0b << 11
# asm 1: dsll >s0b=int64#25,<x0b=int64#5,11
# asm 2: dsll >s0b=$28,<x0b=$8,11
dsll $28,$8,11

# qhasm:   (uint32) x0b >>= 21
# asm 1: srl <x0b=int64#5,<x0b=int64#5,21
# asm 2: srl <x0b=$8,<x0b=$8,21
srl $8,$8,21

# qhasm:   x0b |= s0b
# asm 1: or <x0b=int64#5,<x0b=int64#5,<s0b=int64#25
# asm 2: or <x0b=$8,<x0b=$8,<s0b=$28
or $8,$8,$28

# qhasm:   x02 ^= x1c
# asm 1: xor <x02=int64#2,<x02=int64#2,<x1c=int64#8
# asm 2: xor <x02=$5,<x02=$5,<x1c=$11
xor $5,$5,$11

# qhasm:   x03 ^= x1d
# asm 1: xor <x03=int64#19,<x03=int64#19,<x1d=int64#10
# asm 2: xor <x03=$20,<x03=$20,<x1d=$3
xor $20,$20,$3

# qhasm:   x0a ^= x14
# asm 1: xor <x0a=int64#3,<x0a=int64#3,<x14=int64#18
# asm 2: xor <x0a=$6,<x0a=$6,<x14=$19
xor $6,$6,$19

# qhasm:   x0b ^= x15
# asm 1: xor <x0b=int64#5,<x0b=int64#5,<x15=int64#24
# asm 2: xor <x0b=$8,<x0b=$8,<x15=$25
xor $8,$8,$25

# qhasm:   x1d += x02
# asm 1: daddu <x1d=int64#10,<x1d=int64#10,<x02=int64#2
# asm 2: daddu <x1d=$3,<x1d=$3,<x02=$5
daddu $3,$3,$5

# qhasm:   x1c += x03
# asm 1: daddu <x1c=int64#8,<x1c=int64#8,<x03=int64#19
# asm 2: daddu <x1c=$11,<x1c=$11,<x03=$20
daddu $11,$11,$20

# qhasm:   x15 += x0a
# asm 1: daddu <x15=int64#24,<x15=int64#24,<x0a=int64#3
# asm 2: daddu <x15=$25,<x15=$25,<x0a=$6
daddu $25,$25,$6

# qhasm:   x14 += x0b
# asm 1: daddu <x14=int64#18,<x14=int64#18,<x0b=int64#5
# asm 2: daddu <x14=$19,<x14=$19,<x0b=$8
daddu $19,$19,$8

# qhasm:           x1d_stack = x1d
# asm 1: sd <x1d=int64#10,>x1d_stack=stack64#14($sp)
# asm 2: sd <x1d=$3,>x1d_stack=136($sp)
sd $3,136($sp)

# qhasm:   s02 = x02 << 7
# asm 1: dsll >s02=int64#25,<x02=int64#2,7
# asm 2: dsll >s02=$28,<x02=$5,7
dsll $28,$5,7

# qhasm:   (uint32) x02 >>= 25
# asm 1: srl <x02=int64#2,<x02=int64#2,25
# asm 2: srl <x02=$5,<x02=$5,25
srl $5,$5,25

# qhasm:   x02 |= s02
# asm 1: or <x02=int64#2,<x02=int64#2,<s02=int64#25
# asm 2: or <x02=$5,<x02=$5,<s02=$28
or $5,$5,$28

# qhasm:           x1c_stack = x1c
# asm 1: sd <x1c=int64#8,>x1c_stack=stack64#15($sp)
# asm 2: sd <x1c=$11,>x1c_stack=144($sp)
sd $11,144($sp)

# qhasm:   s03 = x03 << 7
# asm 1: dsll >s03=int64#25,<x03=int64#19,7
# asm 2: dsll >s03=$28,<x03=$20,7
dsll $28,$20,7

# qhasm:   (uint32) x03 >>= 25
# asm 1: srl <x03=int64#19,<x03=int64#19,25
# asm 2: srl <x03=$20,<x03=$20,25
srl $20,$20,25

# qhasm:   x03 |= s03
# asm 1: or <x03=int64#19,<x03=int64#19,<s03=int64#25
# asm 2: or <x03=$20,<x03=$20,<s03=$28
or $20,$20,$28

# qhasm:           x15_stack = x15
# asm 1: sd <x15=int64#24,>x15_stack=stack64#16($sp)
# asm 2: sd <x15=$25,>x15_stack=152($sp)
sd $25,152($sp)

# qhasm:   s0a = x0a << 7
# asm 1: dsll >s0a=int64#25,<x0a=int64#3,7
# asm 2: dsll >s0a=$28,<x0a=$6,7
dsll $28,$6,7

# qhasm:   (uint32) x0a >>= 25
# asm 1: srl <x0a=int64#3,<x0a=int64#3,25
# asm 2: srl <x0a=$6,<x0a=$6,25
srl $6,$6,25

# qhasm:   x0a |= s0a
# asm 1: or <x0a=int64#3,<x0a=int64#3,<s0a=int64#25
# asm 2: or <x0a=$6,<x0a=$6,<s0a=$28
or $6,$6,$28

# qhasm:           x14_stack = x14
# asm 1: sd <x14=int64#18,>x14_stack=stack64#17($sp)
# asm 2: sd <x14=$19,>x14_stack=160($sp)
sd $19,160($sp)

# qhasm:   s0b = x0b << 7
# asm 1: dsll >s0b=int64#25,<x0b=int64#5,7
# asm 2: dsll >s0b=$28,<x0b=$8,7
dsll $28,$8,7

# qhasm:   (uint32) x0b >>= 25
# asm 1: srl <x0b=int64#5,<x0b=int64#5,25
# asm 2: srl <x0b=$8,<x0b=$8,25
srl $8,$8,25

# qhasm:   x0b |= s0b
# asm 1: or <x0b=int64#5,<x0b=int64#5,<s0b=int64#25
# asm 2: or <x0b=$8,<x0b=$8,<s0b=$28
or $8,$8,$28

# qhasm:   x02 ^= x15
# asm 1: xor <x02=int64#2,<x02=int64#2,<x15=int64#24
# asm 2: xor <x02=$5,<x02=$5,<x15=$25
xor $5,$5,$25

# qhasm:   x03 ^= x14
# asm 1: xor <x03=int64#19,<x03=int64#19,<x14=int64#18
# asm 2: xor <x03=$20,<x03=$20,<x14=$19
xor $20,$20,$19

# qhasm:   x0a ^= x1d
# asm 1: xor <x0a=int64#3,<x0a=int64#3,<x1d=int64#10
# asm 2: xor <x0a=$6,<x0a=$6,<x1d=$3
xor $6,$6,$3

# qhasm: 	  x0c = x0c_stack
# asm 1: ld >x0c=int64#10,<x0c_stack=stack64#20($sp)
# asm 2: ld >x0c=$3,<x0c_stack=184($sp)
ld $3,184($sp)

# qhasm: 	  x0d = x0d_stack
# asm 1: ld >x0d=int64#18,<x0d_stack=stack64#13($sp)
# asm 2: ld >x0d=$19,<x0d_stack=128($sp)
ld $19,128($sp)

# qhasm:   x0b ^= x1c
# asm 1: xor <x0b=int64#5,<x0b=int64#5,<x1c=int64#8
# asm 2: xor <x0b=$8,<x0b=$8,<x1c=$11
xor $8,$8,$11

# qhasm:           x02_stack = x02
# asm 1: sd <x02=int64#2,>x02_stack=stack64#13($sp)
# asm 2: sd <x02=$5,>x02_stack=128($sp)
sd $5,128($sp)

# qhasm:   s04 = x04 << 11
# asm 1: dsll >s04=int64#2,<x04=int64#20,11
# asm 2: dsll >s04=$5,<x04=$21,11
dsll $5,$21,11

# qhasm:   (uint32) x04 >>= 21
# asm 1: srl <x04=int64#20,<x04=int64#20,21
# asm 2: srl <x04=$21,<x04=$21,21
srl $21,$21,21

# qhasm:   x04 |= s04
# asm 1: or <x04=int64#20,<x04=int64#20,<s04=int64#2
# asm 2: or <x04=$21,<x04=$21,<s04=$5
or $21,$21,$5

# qhasm:           x0a_stack = x0a
# asm 1: sd <x0a=int64#3,>x0a_stack=stack64#20($sp)
# asm 2: sd <x0a=$6,>x0a_stack=184($sp)
sd $6,184($sp)

# qhasm:   s05 = x05 << 11
# asm 1: dsll >s05=int64#2,<x05=int64#21,11
# asm 2: dsll >s05=$5,<x05=$22,11
dsll $5,$22,11

# qhasm:   (uint32) x05 >>= 21
# asm 1: srl <x05=int64#21,<x05=int64#21,21
# asm 2: srl <x05=$22,<x05=$22,21
srl $22,$22,21

# qhasm:   x05 |= s05
# asm 1: or <x05=int64#21,<x05=int64#21,<s05=int64#2
# asm 2: or <x05=$22,<x05=$22,<s05=$5
or $22,$22,$5

# qhasm:           x0b_stack = x0b
# asm 1: sd <x0b=int64#5,>x0b_stack=stack64#34($sp)
# asm 2: sd <x0b=$8,>x0b_stack=296($sp)
sd $8,296($sp)

# qhasm:   s0c = x0c << 11
# asm 1: dsll >s0c=int64#2,<x0c=int64#10,11
# asm 2: dsll >s0c=$5,<x0c=$3,11
dsll $5,$3,11

# qhasm:   (uint32) x0c >>= 21
# asm 1: srl <x0c=int64#10,<x0c=int64#10,21
# asm 2: srl <x0c=$3,<x0c=$3,21
srl $3,$3,21

# qhasm:   x0c |= s0c
# asm 1: or <x0c=int64#10,<x0c=int64#10,<s0c=int64#2
# asm 2: or <x0c=$3,<x0c=$3,<s0c=$5
or $3,$3,$5

# qhasm:   s0d = x0d << 11
# asm 1: dsll >s0d=int64#2,<x0d=int64#18,11
# asm 2: dsll >s0d=$5,<x0d=$19,11
dsll $5,$19,11

# qhasm:   (uint32) x0d >>= 21
# asm 1: srl <x0d=int64#18,<x0d=int64#18,21
# asm 2: srl <x0d=$19,<x0d=$19,21
srl $19,$19,21

# qhasm:   x0d |= s0d
# asm 1: or <x0d=int64#18,<x0d=int64#18,<s0d=int64#2
# asm 2: or <x0d=$19,<x0d=$19,<s0d=$5
or $19,$19,$5

# qhasm:   x04 ^= x1a
# asm 1: xor <x04=int64#20,<x04=int64#20,<x1a=int64#14
# asm 2: xor <x04=$21,<x04=$21,<x1a=$15
xor $21,$21,$15

# qhasm:   x05 ^= x1b
# asm 1: xor <x05=int64#21,<x05=int64#21,<x1b=int64#15
# asm 2: xor <x05=$22,<x05=$22,<x1b=$16
xor $22,$22,$16

# qhasm:   x0c ^= x12
# asm 1: xor <x0c=int64#10,<x0c=int64#10,<x12=int64#9
# asm 2: xor <x0c=$3,<x0c=$3,<x12=$2
xor $3,$3,$2

# qhasm:   x0d ^= x13
# asm 1: xor <x0d=int64#18,<x0d=int64#18,<x13=int64#11
# asm 2: xor <x0d=$19,<x0d=$19,<x13=$12
xor $19,$19,$12

# qhasm:   x1b += x04
# asm 1: daddu <x1b=int64#15,<x1b=int64#15,<x04=int64#20
# asm 2: daddu <x1b=$16,<x1b=$16,<x04=$21
daddu $16,$16,$21

# qhasm:   x1a += x05
# asm 1: daddu <x1a=int64#14,<x1a=int64#14,<x05=int64#21
# asm 2: daddu <x1a=$15,<x1a=$15,<x05=$22
daddu $15,$15,$22

# qhasm:   x13 += x0c
# asm 1: daddu <x13=int64#11,<x13=int64#11,<x0c=int64#10
# asm 2: daddu <x13=$12,<x13=$12,<x0c=$3
daddu $12,$12,$3

# qhasm:   x12 += x0d
# asm 1: daddu <x12=int64#9,<x12=int64#9,<x0d=int64#18
# asm 2: daddu <x12=$2,<x12=$2,<x0d=$19
daddu $2,$2,$19

# qhasm:   s04 = x04 << 7
# asm 1: dsll >s04=int64#2,<x04=int64#20,7
# asm 2: dsll >s04=$5,<x04=$21,7
dsll $5,$21,7

# qhasm:   (uint32) x04 >>= 25
# asm 1: srl <x04=int64#20,<x04=int64#20,25
# asm 2: srl <x04=$21,<x04=$21,25
srl $21,$21,25

# qhasm:   x04 |= s04
# asm 1: or <x04=int64#20,<x04=int64#20,<s04=int64#2
# asm 2: or <x04=$21,<x04=$21,<s04=$5
or $21,$21,$5

# qhasm:   s05 = x05 << 7
# asm 1: dsll >s05=int64#2,<x05=int64#21,7
# asm 2: dsll >s05=$5,<x05=$22,7
dsll $5,$22,7

# qhasm:   (uint32) x05 >>= 25
# asm 1: srl <x05=int64#21,<x05=int64#21,25
# asm 2: srl <x05=$22,<x05=$22,25
srl $22,$22,25

# qhasm:   x05 |= s05
# asm 1: or <x05=int64#21,<x05=int64#21,<s05=int64#2
# asm 2: or <x05=$22,<x05=$22,<s05=$5
or $22,$22,$5

# qhasm:   s0c = x0c << 7
# asm 1: dsll >s0c=int64#2,<x0c=int64#10,7
# asm 2: dsll >s0c=$5,<x0c=$3,7
dsll $5,$3,7

# qhasm:   (uint32) x0c >>= 25
# asm 1: srl <x0c=int64#10,<x0c=int64#10,25
# asm 2: srl <x0c=$3,<x0c=$3,25
srl $3,$3,25

# qhasm:   x0c |= s0c
# asm 1: or <x0c=int64#10,<x0c=int64#10,<s0c=int64#2
# asm 2: or <x0c=$3,<x0c=$3,<s0c=$5
or $3,$3,$5

# qhasm:   s0d = x0d << 7
# asm 1: dsll >s0d=int64#2,<x0d=int64#18,7
# asm 2: dsll >s0d=$5,<x0d=$19,7
dsll $5,$19,7

# qhasm:   (uint32) x0d >>= 25
# asm 1: srl <x0d=int64#18,<x0d=int64#18,25
# asm 2: srl <x0d=$19,<x0d=$19,25
srl $19,$19,25

# qhasm:   x0d |= s0d
# asm 1: or <x0d=int64#18,<x0d=int64#18,<s0d=int64#2
# asm 2: or <x0d=$19,<x0d=$19,<s0d=$5
or $19,$19,$5

# qhasm:   x04 ^= x13
# asm 1: xor <x04=int64#20,<x04=int64#20,<x13=int64#11
# asm 2: xor <x04=$21,<x04=$21,<x13=$12
xor $21,$21,$12

# qhasm:   x05 ^= x12
# asm 1: xor <x05=int64#21,<x05=int64#21,<x12=int64#9
# asm 2: xor <x05=$22,<x05=$22,<x12=$2
xor $22,$22,$2

# qhasm:   x0c ^= x1b
# asm 1: xor <x0c=int64#10,<x0c=int64#10,<x1b=int64#15
# asm 2: xor <x0c=$3,<x0c=$3,<x1b=$16
xor $3,$3,$16

# qhasm:   x0d ^= x1a
# asm 1: xor <x0d=int64#18,<x0d=int64#18,<x1a=int64#14
# asm 2: xor <x0d=$19,<x0d=$19,<x1a=$15
xor $19,$19,$15

# qhasm:           x0c_stack = x0c
# asm 1: sd <x0c=int64#10,>x0c_stack=stack64#18($sp)
# asm 2: sd <x0c=$3,>x0c_stack=168($sp)
sd $3,168($sp)

# qhasm:           x0d_stack = x0d
# asm 1: sd <x0d=int64#18,>x0d_stack=stack64#19($sp)
# asm 2: sd <x0d=$19,>x0d_stack=176($sp)
sd $19,176($sp)

# qhasm: 	  x0e = x0e_stack
# asm 1: ld >x0e=int64#2,<x0e_stack=stack64#22($sp)
# asm 2: ld >x0e=$5,<x0e_stack=200($sp)
ld $5,200($sp)

# qhasm: 	  x0f = x0f_stack
# asm 1: ld >x0f=int64#3,<x0f_stack=stack64#21($sp)
# asm 2: ld >x0f=$6,<x0f_stack=192($sp)
ld $6,192($sp)

# qhasm:   s06 = x06 << 11
# asm 1: dsll >s06=int64#5,<x06=int64#22,11
# asm 2: dsll >s06=$8,<x06=$23,11
dsll $8,$23,11

# qhasm:   (uint32) x06 >>= 21
# asm 1: srl <x06=int64#22,<x06=int64#22,21
# asm 2: srl <x06=$23,<x06=$23,21
srl $23,$23,21

# qhasm:   x06 |= s06
# asm 1: or <x06=int64#22,<x06=int64#22,<s06=int64#5
# asm 2: or <x06=$23,<x06=$23,<s06=$8
or $23,$23,$8

# qhasm:   s07 = x07 << 11
# asm 1: dsll >s07=int64#5,<x07=int64#23,11
# asm 2: dsll >s07=$8,<x07=$24,11
dsll $8,$24,11

# qhasm:   (uint32) x07 >>= 21
# asm 1: srl <x07=int64#23,<x07=int64#23,21
# asm 2: srl <x07=$24,<x07=$24,21
srl $24,$24,21

# qhasm:   x07 |= s07
# asm 1: or <x07=int64#23,<x07=int64#23,<s07=int64#5
# asm 2: or <x07=$24,<x07=$24,<s07=$8
or $24,$24,$8

# qhasm:   s0e = x0e << 11
# asm 1: dsll >s0e=int64#5,<x0e=int64#2,11
# asm 2: dsll >s0e=$8,<x0e=$5,11
dsll $8,$5,11

# qhasm:   (uint32) x0e >>= 21
# asm 1: srl <x0e=int64#2,<x0e=int64#2,21
# asm 2: srl <x0e=$5,<x0e=$5,21
srl $5,$5,21

# qhasm:   x0e |= s0e
# asm 1: or <x0e=int64#2,<x0e=int64#2,<s0e=int64#5
# asm 2: or <x0e=$5,<x0e=$5,<s0e=$8
or $5,$5,$8

# qhasm:   s0f = x0f << 11
# asm 1: dsll >s0f=int64#5,<x0f=int64#3,11
# asm 2: dsll >s0f=$8,<x0f=$6,11
dsll $8,$6,11

# qhasm:   (uint32) x0f >>= 21
# asm 1: srl <x0f=int64#3,<x0f=int64#3,21
# asm 2: srl <x0f=$6,<x0f=$6,21
srl $6,$6,21

# qhasm:   x0f |= s0f
# asm 1: or <x0f=int64#3,<x0f=int64#3,<s0f=int64#5
# asm 2: or <x0f=$6,<x0f=$6,<s0f=$8
or $6,$6,$8

# qhasm:   x06 ^= x18
# asm 1: xor <x06=int64#22,<x06=int64#22,<x18=int64#12
# asm 2: xor <x06=$23,<x06=$23,<x18=$13
xor $23,$23,$13

# qhasm:   x07 ^= x19
# asm 1: xor <x07=int64#23,<x07=int64#23,<x19=int64#13
# asm 2: xor <x07=$24,<x07=$24,<x19=$14
xor $24,$24,$14

# qhasm:   x0e ^= x10
# asm 1: xor <x0e=int64#2,<x0e=int64#2,<x10=int64#6
# asm 2: xor <x0e=$5,<x0e=$5,<x10=$9
xor $5,$5,$9

# qhasm:   x0f ^= x11
# asm 1: xor <x0f=int64#3,<x0f=int64#3,<x11=int64#7
# asm 2: xor <x0f=$6,<x0f=$6,<x11=$10
xor $6,$6,$10

# qhasm:   x19 += x06
# asm 1: daddu <x19=int64#13,<x19=int64#13,<x06=int64#22
# asm 2: daddu <x19=$14,<x19=$14,<x06=$23
daddu $14,$14,$23

# qhasm:   x18 += x07
# asm 1: daddu <x18=int64#12,<x18=int64#12,<x07=int64#23
# asm 2: daddu <x18=$13,<x18=$13,<x07=$24
daddu $13,$13,$24

# qhasm:   x11 += x0e
# asm 1: daddu <x11=int64#7,<x11=int64#7,<x0e=int64#2
# asm 2: daddu <x11=$10,<x11=$10,<x0e=$5
daddu $10,$10,$5

# qhasm:   x10 += x0f
# asm 1: daddu <x10=int64#6,<x10=int64#6,<x0f=int64#3
# asm 2: daddu <x10=$9,<x10=$9,<x0f=$6
daddu $9,$9,$6

# qhasm:   s06 = x06 << 7
# asm 1: dsll >s06=int64#5,<x06=int64#22,7
# asm 2: dsll >s06=$8,<x06=$23,7
dsll $8,$23,7

# qhasm:   (uint32) x06 >>= 25
# asm 1: srl <x06=int64#22,<x06=int64#22,25
# asm 2: srl <x06=$23,<x06=$23,25
srl $23,$23,25

# qhasm:   x06 |= s06
# asm 1: or <x06=int64#22,<x06=int64#22,<s06=int64#5
# asm 2: or <x06=$23,<x06=$23,<s06=$8
or $23,$23,$8

# qhasm:   s07 = x07 << 7
# asm 1: dsll >s07=int64#5,<x07=int64#23,7
# asm 2: dsll >s07=$8,<x07=$24,7
dsll $8,$24,7

# qhasm:   (uint32) x07 >>= 25
# asm 1: srl <x07=int64#23,<x07=int64#23,25
# asm 2: srl <x07=$24,<x07=$24,25
srl $24,$24,25

# qhasm:   x07 |= s07
# asm 1: or <x07=int64#23,<x07=int64#23,<s07=int64#5
# asm 2: or <x07=$24,<x07=$24,<s07=$8
or $24,$24,$8

# qhasm:   s0e = x0e << 7
# asm 1: dsll >s0e=int64#5,<x0e=int64#2,7
# asm 2: dsll >s0e=$8,<x0e=$5,7
dsll $8,$5,7

# qhasm:   (uint32) x0e >>= 25
# asm 1: srl <x0e=int64#2,<x0e=int64#2,25
# asm 2: srl <x0e=$5,<x0e=$5,25
srl $5,$5,25

# qhasm:   x0e |= s0e
# asm 1: or <x0e=int64#2,<x0e=int64#2,<s0e=int64#5
# asm 2: or <x0e=$5,<x0e=$5,<s0e=$8
or $5,$5,$8

# qhasm:   s0f = x0f << 7
# asm 1: dsll >s0f=int64#5,<x0f=int64#3,7
# asm 2: dsll >s0f=$8,<x0f=$6,7
dsll $8,$6,7

# qhasm:   (uint32) x0f >>= 25
# asm 1: srl <x0f=int64#3,<x0f=int64#3,25
# asm 2: srl <x0f=$6,<x0f=$6,25
srl $6,$6,25

# qhasm:   x0f |= s0f
# asm 1: or <x0f=int64#3,<x0f=int64#3,<s0f=int64#5
# asm 2: or <x0f=$6,<x0f=$6,<s0f=$8
or $6,$6,$8

# qhasm:   x06 ^= x11
# asm 1: xor <x06=int64#22,<x06=int64#22,<x11=int64#7
# asm 2: xor <x06=$23,<x06=$23,<x11=$10
xor $23,$23,$10

# qhasm:           x15 = x15_stack
# asm 1: ld >x15=int64#5,<x15_stack=stack64#16($sp)
# asm 2: ld >x15=$8,<x15_stack=152($sp)
ld $8,152($sp)

# qhasm:   x07 ^= x10
# asm 1: xor <x07=int64#23,<x07=int64#23,<x10=int64#6
# asm 2: xor <x07=$24,<x07=$24,<x10=$9
xor $24,$24,$9

# qhasm:           x14 = x14_stack
# asm 1: ld >x14=int64#10,<x14_stack=stack64#17($sp)
# asm 2: ld >x14=$3,<x14_stack=160($sp)
ld $3,160($sp)

# qhasm:   x0e ^= x19
# asm 1: xor <x0e=int64#2,<x0e=int64#2,<x19=int64#13
# asm 2: xor <x0e=$5,<x0e=$5,<x19=$14
xor $5,$5,$14

# qhasm:           x1d = x1d_stack
# asm 1: ld >x1d=int64#18,<x1d_stack=stack64#14($sp)
# asm 2: ld >x1d=$19,<x1d_stack=136($sp)
ld $19,136($sp)

# qhasm:   x0f ^= x18
# asm 1: xor <x0f=int64#3,<x0f=int64#3,<x18=int64#12
# asm 2: xor <x0f=$6,<x0f=$6,<x18=$13
xor $6,$6,$13

# qhasm:           x1c = x1c_stack
# asm 1: ld >x1c=int64#24,<x1c_stack=stack64#15($sp)
# asm 2: ld >x1c=$25,<x1c_stack=144($sp)
ld $25,144($sp)

# qhasm: 	  x0e_stack = x0e
# asm 1: sd <x0e=int64#2,>x0e_stack=stack64#16($sp)
# asm 2: sd <x0e=$5,>x0e_stack=152($sp)
sd $5,152($sp)

# qhasm: 	  x0f_stack = x0f
# asm 1: sd <x0f=int64#3,>x0f_stack=stack64#17($sp)
# asm 2: sd <x0f=$6,>x0f_stack=160($sp)
sd $6,160($sp)

# qhasm: 	  x0c = x0c_stack
# asm 1: ld >x0c=int64#2,<x0c_stack=stack64#18($sp)
# asm 2: ld >x0c=$5,<x0c_stack=168($sp)
ld $5,168($sp)

# qhasm: 	  x0d = x0d_stack
# asm 1: ld >x0d=int64#8,<x0d_stack=stack64#19($sp)
# asm 2: ld >x0d=$11,<x0d_stack=176($sp)
ld $11,176($sp)

# qhasm:   x11 += x04
# asm 1: daddu <x11=int64#7,<x11=int64#7,<x04=int64#20
# asm 2: daddu <x11=$10,<x11=$10,<x04=$21
daddu $10,$10,$21

# qhasm:   x10 += x05
# asm 1: daddu <x10=int64#6,<x10=int64#6,<x05=int64#21
# asm 2: daddu <x10=$9,<x10=$9,<x05=$22
daddu $9,$9,$22

# qhasm:   x19 += x0c
# asm 1: daddu <x19=int64#13,<x19=int64#13,<x0c=int64#2
# asm 2: daddu <x19=$14,<x19=$14,<x0c=$5
daddu $14,$14,$5

# qhasm:   x18 += x0d
# asm 1: daddu <x18=int64#12,<x18=int64#12,<x0d=int64#8
# asm 2: daddu <x18=$13,<x18=$13,<x0d=$11
daddu $13,$13,$11

# qhasm:   x15 += x00
# asm 1: daddu <x15=int64#5,<x15=int64#5,<x00=int64#16
# asm 2: daddu <x15=$8,<x15=$8,<x00=$17
daddu $8,$8,$17

# qhasm:   x14 += x01
# asm 1: daddu <x14=int64#10,<x14=int64#10,<x01=int64#17
# asm 2: daddu <x14=$3,<x14=$3,<x01=$18
daddu $3,$3,$18

# qhasm:   x1d += x08
# asm 1: daddu <x1d=int64#18,<x1d=int64#18,<x08=int64#1
# asm 2: daddu <x1d=$19,<x1d=$19,<x08=$4
daddu $19,$19,$4

# qhasm:   x1c += x09
# asm 1: daddu <x1c=int64#24,<x1c=int64#24,<x09=int64#4
# asm 2: daddu <x1c=$25,<x1c=$25,<x09=$7
daddu $25,$25,$7

# qhasm:   s04 = x04 << 11
# asm 1: dsll >s04=int64#3,<x04=int64#20,11
# asm 2: dsll >s04=$6,<x04=$21,11
dsll $6,$21,11

# qhasm:   (uint32) x04 >>= 21
# asm 1: srl <x04=int64#20,<x04=int64#20,21
# asm 2: srl <x04=$21,<x04=$21,21
srl $21,$21,21

# qhasm:   x04 |= s04
# asm 1: or <x04=int64#20,<x04=int64#20,<s04=int64#3
# asm 2: or <x04=$21,<x04=$21,<s04=$6
or $21,$21,$6

# qhasm:           x15_stack = x15
# asm 1: sd <x15=int64#5,>x15_stack=stack64#19($sp)
# asm 2: sd <x15=$8,>x15_stack=176($sp)
sd $8,176($sp)

# qhasm:   s05 = x05 << 11
# asm 1: dsll >s05=int64#3,<x05=int64#21,11
# asm 2: dsll >s05=$6,<x05=$22,11
dsll $6,$22,11

# qhasm:   (uint32) x05 >>= 21
# asm 1: srl <x05=int64#21,<x05=int64#21,21
# asm 2: srl <x05=$22,<x05=$22,21
srl $22,$22,21

# qhasm:   x05 |= s05
# asm 1: or <x05=int64#21,<x05=int64#21,<s05=int64#3
# asm 2: or <x05=$22,<x05=$22,<s05=$6
or $22,$22,$6

# qhasm:           x14_stack = x14
# asm 1: sd <x14=int64#10,>x14_stack=stack64#18($sp)
# asm 2: sd <x14=$3,>x14_stack=168($sp)
sd $3,168($sp)

# qhasm:   s0c = x0c << 11
# asm 1: dsll >s0c=int64#3,<x0c=int64#2,11
# asm 2: dsll >s0c=$6,<x0c=$5,11
dsll $6,$5,11

# qhasm:   (uint32) x0c >>= 21
# asm 1: srl <x0c=int64#2,<x0c=int64#2,21
# asm 2: srl <x0c=$5,<x0c=$5,21
srl $5,$5,21

# qhasm:   x0c |= s0c
# asm 1: or <x0c=int64#2,<x0c=int64#2,<s0c=int64#3
# asm 2: or <x0c=$5,<x0c=$5,<s0c=$6
or $5,$5,$6

# qhasm:           x1d_stack = x1d
# asm 1: sd <x1d=int64#18,>x1d_stack=stack64#23($sp)
# asm 2: sd <x1d=$19,>x1d_stack=208($sp)
sd $19,208($sp)

# qhasm:   s0d = x0d << 11
# asm 1: dsll >s0d=int64#3,<x0d=int64#8,11
# asm 2: dsll >s0d=$6,<x0d=$11,11
dsll $6,$11,11

# qhasm:   (uint32) x0d >>= 21
# asm 1: srl <x0d=int64#8,<x0d=int64#8,21
# asm 2: srl <x0d=$11,<x0d=$11,21
srl $11,$11,21

# qhasm:   x0d |= s0d
# asm 1: or <x0d=int64#8,<x0d=int64#8,<s0d=int64#3
# asm 2: or <x0d=$11,<x0d=$11,<s0d=$6
or $11,$11,$6

# qhasm:           x1c_stack = x1c
# asm 1: sd <x1c=int64#24,>x1c_stack=stack64#22($sp)
# asm 2: sd <x1c=$25,>x1c_stack=200($sp)
sd $25,200($sp)

# qhasm:   x04 ^= x15
# asm 1: xor <x04=int64#20,<x04=int64#20,<x15=int64#5
# asm 2: xor <x04=$21,<x04=$21,<x15=$8
xor $21,$21,$8

# qhasm:   x05 ^= x14
# asm 1: xor <x05=int64#21,<x05=int64#21,<x14=int64#10
# asm 2: xor <x05=$22,<x05=$22,<x14=$3
xor $22,$22,$3

# qhasm:   x0c ^= x1d
# asm 1: xor <x0c=int64#2,<x0c=int64#2,<x1d=int64#18
# asm 2: xor <x0c=$5,<x0c=$5,<x1d=$19
xor $5,$5,$19

# qhasm:   x0d ^= x1c
# asm 1: xor <x0d=int64#8,<x0d=int64#8,<x1c=int64#24
# asm 2: xor <x0d=$11,<x0d=$11,<x1c=$25
xor $11,$11,$25

# qhasm:           x0c_stack = x0c
# asm 1: sd <x0c=int64#2,>x0c_stack=stack64#14($sp)
# asm 2: sd <x0c=$5,>x0c_stack=136($sp)
sd $5,136($sp)

# qhasm:           x0d_stack = x0d
# asm 1: sd <x0d=int64#8,>x0d_stack=stack64#15($sp)
# asm 2: sd <x0d=$11,>x0d_stack=144($sp)
sd $11,144($sp)

# qhasm:           x0e = x0e_stack
# asm 1: ld >x0e=int64#2,<x0e_stack=stack64#16($sp)
# asm 2: ld >x0e=$5,<x0e_stack=152($sp)
ld $5,152($sp)

# qhasm:           x0f = x0f_stack
# asm 1: ld >x0f=int64#10,<x0f_stack=stack64#17($sp)
# asm 2: ld >x0f=$3,<x0f_stack=160($sp)
ld $3,160($sp)

# qhasm:   s00 = x00 << 11
# asm 1: dsll >s00=int64#3,<x00=int64#16,11
# asm 2: dsll >s00=$6,<x00=$17,11
dsll $6,$17,11

# qhasm:   (uint32) x00 >>= 21
# asm 1: srl <x00=int64#16,<x00=int64#16,21
# asm 2: srl <x00=$17,<x00=$17,21
srl $17,$17,21

# qhasm:   x00 |= s00
# asm 1: or <x00=int64#16,<x00=int64#16,<s00=int64#3
# asm 2: or <x00=$17,<x00=$17,<s00=$6
or $17,$17,$6

# qhasm:   s01 = x01 << 11
# asm 1: dsll >s01=int64#3,<x01=int64#17,11
# asm 2: dsll >s01=$6,<x01=$18,11
dsll $6,$18,11

# qhasm:   (uint32) x01 >>= 21
# asm 1: srl <x01=int64#17,<x01=int64#17,21
# asm 2: srl <x01=$18,<x01=$18,21
srl $18,$18,21

# qhasm:   x01 |= s01
# asm 1: or <x01=int64#17,<x01=int64#17,<s01=int64#3
# asm 2: or <x01=$18,<x01=$18,<s01=$6
or $18,$18,$6

# qhasm:   s08 = x08 << 11
# asm 1: dsll >s08=int64#3,<x08=int64#1,11
# asm 2: dsll >s08=$6,<x08=$4,11
dsll $6,$4,11

# qhasm:   (uint32) x08 >>= 21
# asm 1: srl <x08=int64#1,<x08=int64#1,21
# asm 2: srl <x08=$4,<x08=$4,21
srl $4,$4,21

# qhasm:   x08 |= s08
# asm 1: or <x08=int64#1,<x08=int64#1,<s08=int64#3
# asm 2: or <x08=$4,<x08=$4,<s08=$6
or $4,$4,$6

# qhasm:   s09 = x09 << 11
# asm 1: dsll >s09=int64#3,<x09=int64#4,11
# asm 2: dsll >s09=$6,<x09=$7,11
dsll $6,$7,11

# qhasm:   (uint32) x09 >>= 21
# asm 1: srl <x09=int64#4,<x09=int64#4,21
# asm 2: srl <x09=$7,<x09=$7,21
srl $7,$7,21

# qhasm:   x09 |= s09
# asm 1: or <x09=int64#4,<x09=int64#4,<s09=int64#3
# asm 2: or <x09=$7,<x09=$7,<s09=$6
or $7,$7,$6

# qhasm:   x00 ^= x11
# asm 1: xor <x00=int64#16,<x00=int64#16,<x11=int64#7
# asm 2: xor <x00=$17,<x00=$17,<x11=$10
xor $17,$17,$10

# qhasm:   x01 ^= x10
# asm 1: xor <x01=int64#17,<x01=int64#17,<x10=int64#6
# asm 2: xor <x01=$18,<x01=$18,<x10=$9
xor $18,$18,$9

# qhasm:           x17 = x17_stack
# asm 1: ld >x17=int64#3,<x17_stack=stack64#32($sp)
# asm 2: ld >x17=$6,<x17_stack=280($sp)
ld $6,280($sp)

# qhasm:   x08 ^= x19
# asm 1: xor <x08=int64#1,<x08=int64#1,<x19=int64#13
# asm 2: xor <x08=$4,<x08=$4,<x19=$14
xor $4,$4,$14

# qhasm:           x02 = x02_stack
# asm 1: ld >x02=int64#18,<x02_stack=stack64#13($sp)
# asm 2: ld >x02=$19,<x02_stack=128($sp)
ld $19,128($sp)

# qhasm:   x09 ^= x18
# asm 1: xor <x09=int64#4,<x09=int64#4,<x18=int64#12
# asm 2: xor <x09=$7,<x09=$7,<x18=$13
xor $7,$7,$13

# qhasm:           x16 = x16_stack
# asm 1: ld >x16=int64#24,<x16_stack=stack64#33($sp)
# asm 2: ld >x16=$25,<x16_stack=288($sp)
ld $25,288($sp)

# qhasm:   x13 += x06
# asm 1: daddu <x13=int64#11,<x13=int64#11,<x06=int64#22
# asm 2: daddu <x13=$12,<x13=$12,<x06=$23
daddu $12,$12,$23

# qhasm:           x1f = x1f_stack
# asm 1: ld >x1f=int64#25,<x1f_stack=stack64#24($sp)
# asm 2: ld >x1f=$28,<x1f_stack=216($sp)
ld $28,216($sp)

# qhasm:   x12 += x07
# asm 1: daddu <x12=int64#9,<x12=int64#9,<x07=int64#23
# asm 2: daddu <x12=$2,<x12=$2,<x07=$24
daddu $2,$2,$24

# qhasm:           x0a = x0a_stack
# asm 1: ld >x0a=int64#5,<x0a_stack=stack64#20($sp)
# asm 2: ld >x0a=$8,<x0a_stack=184($sp)
ld $8,184($sp)

# qhasm:   x1b += x0e
# asm 1: daddu <x1b=int64#15,<x1b=int64#15,<x0e=int64#2
# asm 2: daddu <x1b=$16,<x1b=$16,<x0e=$5
daddu $16,$16,$5

# qhasm:           x1e = x1e_stack
# asm 1: ld >x1e=int64#26,<x1e_stack=stack64#25($sp)
# asm 2: ld >x1e=$30,<x1e_stack=224($sp)
ld $30,224($sp)

# qhasm:   x1a += x0f
# asm 1: daddu <x1a=int64#14,<x1a=int64#14,<x0f=int64#10
# asm 2: daddu <x1a=$15,<x1a=$15,<x0f=$3
daddu $15,$15,$3

# qhasm:           x0b = x0b_stack
# asm 1: ld >x0b=int64#27,<x0b_stack=stack64#34($sp)
# asm 2: ld >x0b=$31,<x0b_stack=296($sp)
ld $31,296($sp)

# qhasm:   x17 += x02
# asm 1: daddu <x17=int64#3,<x17=int64#3,<x02=int64#18
# asm 2: daddu <x17=$6,<x17=$6,<x02=$19
daddu $6,$6,$19

# qhasm:   x16 += x03
# asm 1: daddu <x16=int64#24,<x16=int64#24,<x03=int64#19
# asm 2: daddu <x16=$25,<x16=$25,<x03=$20
daddu $25,$25,$20

# qhasm:   x1f += x0a
# asm 1: daddu <x1f=int64#25,<x1f=int64#25,<x0a=int64#5
# asm 2: daddu <x1f=$28,<x1f=$28,<x0a=$8
daddu $28,$28,$8

# qhasm:   x1e += x0b
# asm 1: daddu <x1e=int64#26,<x1e=int64#26,<x0b=int64#27
# asm 2: daddu <x1e=$30,<x1e=$30,<x0b=$31
daddu $30,$30,$31

# qhasm:   s06 = x06 << 11
# asm 1: dsll >s06=int64#28,<x06=int64#22,11
# asm 2: dsll >s06=$1,<x06=$23,11
dsll $1,$23,11

# qhasm:   (uint32) x06 >>= 21
# asm 1: srl <x06=int64#22,<x06=int64#22,21
# asm 2: srl <x06=$23,<x06=$23,21
srl $23,$23,21

# qhasm:   x06 |= s06
# asm 1: or <x06=int64#22,<x06=int64#22,<s06=int64#28
# asm 2: or <x06=$23,<x06=$23,<s06=$1
or $23,$23,$1

# qhasm:           x17_stack = x17
# asm 1: sd <x17=int64#3,>x17_stack=stack64#21($sp)
# asm 2: sd <x17=$6,>x17_stack=192($sp)
sd $6,192($sp)

# qhasm:   s07 = x07 << 11
# asm 1: dsll >s07=int64#28,<x07=int64#23,11
# asm 2: dsll >s07=$1,<x07=$24,11
dsll $1,$24,11

# qhasm:   (uint32) x07 >>= 21
# asm 1: srl <x07=int64#23,<x07=int64#23,21
# asm 2: srl <x07=$24,<x07=$24,21
srl $24,$24,21

# qhasm:   x07 |= s07
# asm 1: or <x07=int64#23,<x07=int64#23,<s07=int64#28
# asm 2: or <x07=$24,<x07=$24,<s07=$1
or $24,$24,$1

# qhasm:           x16_stack = x16
# asm 1: sd <x16=int64#24,>x16_stack=stack64#20($sp)
# asm 2: sd <x16=$25,>x16_stack=184($sp)
sd $25,184($sp)

# qhasm:   s0e = x0e << 11
# asm 1: dsll >s0e=int64#28,<x0e=int64#2,11
# asm 2: dsll >s0e=$1,<x0e=$5,11
dsll $1,$5,11

# qhasm:   (uint32) x0e >>= 21
# asm 1: srl <x0e=int64#2,<x0e=int64#2,21
# asm 2: srl <x0e=$5,<x0e=$5,21
srl $5,$5,21

# qhasm:   x0e |= s0e
# asm 1: or <x0e=int64#2,<x0e=int64#2,<s0e=int64#28
# asm 2: or <x0e=$5,<x0e=$5,<s0e=$1
or $5,$5,$1

# qhasm:           x1f_stack = x1f
# asm 1: sd <x1f=int64#25,>x1f_stack=stack64#25($sp)
# asm 2: sd <x1f=$28,>x1f_stack=224($sp)
sd $28,224($sp)

# qhasm:   s0f = x0f << 11
# asm 1: dsll >s0f=int64#28,<x0f=int64#10,11
# asm 2: dsll >s0f=$1,<x0f=$3,11
dsll $1,$3,11

# qhasm:   (uint32) x0f >>= 21
# asm 1: srl <x0f=int64#10,<x0f=int64#10,21
# asm 2: srl <x0f=$3,<x0f=$3,21
srl $3,$3,21

# qhasm:   x0f |= s0f
# asm 1: or <x0f=int64#10,<x0f=int64#10,<s0f=int64#28
# asm 2: or <x0f=$3,<x0f=$3,<s0f=$1
or $3,$3,$1

# qhasm:           x1e_stack = x1e
# asm 1: sd <x1e=int64#26,>x1e_stack=stack64#24($sp)
# asm 2: sd <x1e=$30,>x1e_stack=216($sp)
sd $30,216($sp)

# qhasm:   x06 ^= x17
# asm 1: xor <x06=int64#22,<x06=int64#22,<x17=int64#3
# asm 2: xor <x06=$23,<x06=$23,<x17=$6
xor $23,$23,$6

# qhasm:   x07 ^= x16
# asm 1: xor <x07=int64#23,<x07=int64#23,<x16=int64#24
# asm 2: xor <x07=$24,<x07=$24,<x16=$25
xor $24,$24,$25

# qhasm:   x0e ^= x1f
# asm 1: xor <x0e=int64#2,<x0e=int64#2,<x1f=int64#25
# asm 2: xor <x0e=$5,<x0e=$5,<x1f=$28
xor $5,$5,$28

# qhasm:   x0f ^= x1e
# asm 1: xor <x0f=int64#10,<x0f=int64#10,<x1e=int64#26
# asm 2: xor <x0f=$3,<x0f=$3,<x1e=$30
xor $3,$3,$30

# qhasm:           x0e_stack = x0e
# asm 1: sd <x0e=int64#2,>x0e_stack=stack64#16($sp)
# asm 2: sd <x0e=$5,>x0e_stack=152($sp)
sd $5,152($sp)

# qhasm:           x0f_stack = x0f
# asm 1: sd <x0f=int64#10,>x0f_stack=stack64#17($sp)
# asm 2: sd <x0f=$3,>x0f_stack=160($sp)
sd $3,160($sp)

# qhasm:   s0b = x0b << 11
# asm 1: dsll >s0b=int64#2,<x0b=int64#27,11
# asm 2: dsll >s0b=$5,<x0b=$31,11
dsll $5,$31,11

# qhasm:   (uint32) x0b >>= 21
# asm 1: srl <x0b=int64#27,<x0b=int64#27,21
# asm 2: srl <x0b=$31,<x0b=$31,21
srl $31,$31,21

# qhasm:   x0b |= s0b
# asm 1: or <x0b=int64#27,<x0b=int64#27,<s0b=int64#2
# asm 2: or <x0b=$31,<x0b=$31,<s0b=$5
or $31,$31,$5

# qhasm:   s0a = x0a << 11
# asm 1: dsll >s0a=int64#2,<x0a=int64#5,11
# asm 2: dsll >s0a=$5,<x0a=$8,11
dsll $5,$8,11

# qhasm:   (uint32) x0a >>= 21
# asm 1: srl <x0a=int64#5,<x0a=int64#5,21
# asm 2: srl <x0a=$8,<x0a=$8,21
srl $8,$8,21

# qhasm:   x0a |= s0a
# asm 1: or <x0a=int64#5,<x0a=int64#5,<s0a=int64#2
# asm 2: or <x0a=$8,<x0a=$8,<s0a=$5
or $8,$8,$5

# qhasm:   s03 = x03 << 11
# asm 1: dsll >s03=int64#2,<x03=int64#19,11
# asm 2: dsll >s03=$5,<x03=$20,11
dsll $5,$20,11

# qhasm:   (uint32) x03 >>= 21
# asm 1: srl <x03=int64#19,<x03=int64#19,21
# asm 2: srl <x03=$20,<x03=$20,21
srl $20,$20,21

# qhasm:   x03 |= s03
# asm 1: or <x03=int64#19,<x03=int64#19,<s03=int64#2
# asm 2: or <x03=$20,<x03=$20,<s03=$5
or $20,$20,$5

# qhasm:   s02 = x02 << 11
# asm 1: dsll >s02=int64#2,<x02=int64#18,11
# asm 2: dsll >s02=$5,<x02=$19,11
dsll $5,$19,11

# qhasm:   (uint32) x02 >>= 21
# asm 1: srl <x02=int64#18,<x02=int64#18,21
# asm 2: srl <x02=$19,<x02=$19,21
srl $19,$19,21

# qhasm:   x02 |= s02
# asm 1: or <x02=int64#18,<x02=int64#18,<s02=int64#2
# asm 2: or <x02=$19,<x02=$19,<s02=$5
or $19,$19,$5

# qhasm:         r = r_stack
# asm 1: ld >r=int64#25,<r_stack=stack64#29($sp)
# asm 2: ld >r=$28,<r_stack=256($sp)
ld $28,256($sp)

# qhasm:   x0b ^= x1a
# asm 1: xor <x0b=int64#27,<x0b=int64#27,<x1a=int64#14
# asm 2: xor <x0b=$31,<x0b=$31,<x1a=$15
xor $31,$31,$15

# qhasm:   x0a ^= x1b
# asm 1: xor <x0a=int64#5,<x0a=int64#5,<x1b=int64#15
# asm 2: xor <x0a=$8,<x0a=$8,<x1b=$16
xor $8,$8,$16

# qhasm:                    r -= 2
# asm 1: daddiu <r=int64#25,<r=int64#25,-2
# asm 2: daddiu <r=$28,<r=$28,-2
daddiu $28,$28,-2

# qhasm:   x03 ^= x12
# asm 1: xor <x03=int64#19,<x03=int64#19,<x12=int64#9
# asm 2: xor <x03=$20,<x03=$20,<x12=$2
xor $20,$20,$2

# qhasm:   x02 ^= x13
# asm 1: xor <x02=int64#18,<x02=int64#18,<x13=int64#11
# asm 2: xor <x02=$19,<x02=$19,<x13=$12
xor $19,$19,$12

# qhasm:           x0b_stack = x0b
# asm 1: sd <x0b=int64#27,>x0b_stack=stack64#13($sp)
# asm 2: sd <x0b=$31,>x0b_stack=128($sp)
sd $31,128($sp)

# qhasm: goto morerounds if r > 0
# asm 1: bgtz <r=int64#25,._morerounds
# asm 2: bgtz <r=$28,._morerounds
bgtz $28,._morerounds
nop

# qhasm:   finalization = finalization_stack
# asm 1: ld >finalization=int64#24,<finalization_stack=stack64#26($sp)
# asm 2: ld >finalization=$25,<finalization_stack=232($sp)
ld $25,232($sp)

# qhasm:   in = in_stack
# asm 1: ld >in=int64#2,<in_stack=stack64#28($sp)
# asm 2: ld >in=$5,<in_stack=248($sp)
ld $5,248($sp)

# qhasm:   inlen = inlen_stack
# asm 1: ld >inlen=int64#3,<inlen_stack=stack64#27($sp)
# asm 2: ld >inlen=$6,<inlen_stack=240($sp)
ld $6,240($sp)

# qhasm: goto checkinlen
b ._checkinlen
nop

# qhasm: inlenbelow32:
._inlenbelow32:

# qhasm:   inlen += 32
# asm 1: daddiu <inlen=int64#3,<inlen=int64#3,32
# asm 2: daddiu <inlen=$6,<inlen=$6,32
daddiu $6,$6,32

# qhasm: 		      check = 1
# asm 1: li >check=int64#25,1
# asm 2: li >check=$28,1
li $28,1

# qhasm: goto finalization1 if finalization == check
# asm 1: beq <finalization=int64#24,<check=int64#25,._finalization1
# asm 2: beq <finalization=$25,<check=$28,._finalization1
beq $25,$28,._finalization1
nop

# qhasm: 		      check = 2
# asm 1: li >check=int64#25,2
# asm 2: li >check=$28,2
li $28,2

# qhasm: goto finalization2 if finalization == check
# asm 1: beq <finalization=int64#24,<check=int64#25,._finalization2
# asm 2: beq <finalization=$25,<check=$28,._finalization2
beq $25,$28,._finalization2
nop

# qhasm:   new tmp

# qhasm:   y00 = 0
# asm 1: li >y00=int64#24,0
# asm 2: li >y00=$25,0
li $25,0

# qhasm:   z = &tmp
# asm 1: daddiu >z=int64#25,$sp,<tmp=stack256#1
# asm 2: daddiu >z=$28,$sp,<tmp=0
daddiu $28,$sp,0

# qhasm:   *(uint32 *) (z + 0) = y00
# asm 1: sw <y00=int64#24,0(<z=int64#25)
# asm 2: sw <y00=$25,0(<z=$28)
sw $25,0($28)

# qhasm:   *(uint32 *) (z + 4) = y00
# asm 1: sw <y00=int64#24,4(<z=int64#25)
# asm 2: sw <y00=$25,4(<z=$28)
sw $25,4($28)

# qhasm:   *(uint32 *) (z + 8) = y00
# asm 1: sw <y00=int64#24,8(<z=int64#25)
# asm 2: sw <y00=$25,8(<z=$28)
sw $25,8($28)

# qhasm:   *(uint32 *) (z + 12) = y00
# asm 1: sw <y00=int64#24,12(<z=int64#25)
# asm 2: sw <y00=$25,12(<z=$28)
sw $25,12($28)

# qhasm:   *(uint32 *) (z + 16) = y00
# asm 1: sw <y00=int64#24,16(<z=int64#25)
# asm 2: sw <y00=$25,16(<z=$28)
sw $25,16($28)

# qhasm:   *(uint32 *) (z + 20) = y00
# asm 1: sw <y00=int64#24,20(<z=int64#25)
# asm 2: sw <y00=$25,20(<z=$28)
sw $25,20($28)

# qhasm:   *(uint32 *) (z + 24) = y00
# asm 1: sw <y00=int64#24,24(<z=int64#25)
# asm 2: sw <y00=$25,24(<z=$28)
sw $25,24($28)

# qhasm:   *(uint32 *) (z + 28) = y00
# asm 1: sw <y00=int64#24,28(<z=int64#25)
# asm 2: sw <y00=$25,28(<z=$28)
sw $25,28($28)

# qhasm: goto copydone if inlen <= 0
# asm 1: blez <inlen=int64#3,._copydone
# asm 2: blez <inlen=$6,._copydone
blez $6,._copydone
nop

# qhasm:   copyloop:
._copyloop:

# qhasm:     y00 = *(uint8 *) (in + 0)
# asm 1: lbu >y00=int64#24,0(<in=int64#2)
# asm 2: lbu >y00=$25,0(<in=$5)
lbu $25,0($5)

# qhasm:     in += 1
# asm 1: daddiu <in=int64#2,<in=int64#2,1
# asm 2: daddiu <in=$5,<in=$5,1
daddiu $5,$5,1

# qhasm:     *(uint8 *) (z + 0) = y00
# asm 1: sb <y00=int64#24,0(<z=int64#25)
# asm 2: sb <y00=$25,0(<z=$28)
sb $25,0($28)

# qhasm:     z += 1
# asm 1: daddiu <z=int64#25,<z=int64#25,1
# asm 2: daddiu <z=$28,<z=$28,1
daddiu $28,$28,1

# qhasm:                  inlen -= 1
# asm 1: daddiu <inlen=int64#3,<inlen=int64#3,-1
# asm 2: daddiu <inlen=$6,<inlen=$6,-1
daddiu $6,$6,-1

# qhasm: goto copyloop if inlen > 0
# asm 1: bgtz <inlen=int64#3,._copyloop
# asm 2: bgtz <inlen=$6,._copyloop
bgtz $6,._copyloop
nop

# qhasm: copydone:
._copydone:

# qhasm:   y00 = 128
# asm 1: li >y00=int64#2,128
# asm 2: li >y00=$5,128
li $5,128

# qhasm:   *(uint8 *) (z + 0) = y00
# asm 1: sb <y00=int64#2,0(<z=int64#25)
# asm 2: sb <y00=$5,0(<z=$28)
sb $5,0($28)

# qhasm:   in = &tmp
# asm 1: daddiu >in=int64#2,$sp,<tmp=stack256#1
# asm 2: daddiu >in=$5,$sp,<tmp=0
daddiu $5,$sp,0

# qhasm:   finalization = 1
# asm 1: li >finalization=int64#24,1
# asm 2: li >finalization=$25,1
li $25,1

# qhasm:   inlen = 0
# asm 1: li >inlen=int64#3,0
# asm 2: li >inlen=$6,0
li $6,0

# qhasm:   goto mainloop
b ._mainloop
nop

# qhasm: finalization1:
._finalization1:

# qhasm:   x1f = x1f_stack
# asm 1: ld >x1f=int64#24,<x1f_stack=stack64#25($sp)
# asm 2: ld >x1f=$25,<x1f_stack=224($sp)
ld $25,224($sp)

# qhasm:   x1f ^= 1
# asm 1: xori <x1f=int64#24,<x1f=int64#24,1
# asm 2: xori <x1f=$25,<x1f=$25,1
xori $25,$25,1

# qhasm:   x1f_stack = x1f
# asm 1: sd <x1f=int64#24,>x1f_stack=stack64#25($sp)
# asm 2: sd <x1f=$25,>x1f_stack=224($sp)
sd $25,224($sp)

# qhasm:   r = 160
# asm 1: li >r=int64#25,160
# asm 2: li >r=$28,160
li $28,160

# qhasm:   finalization = 2
# asm 1: li >finalization=int64#24,2
# asm 2: li >finalization=$25,2
li $25,2

# qhasm:   finalization_stack = finalization
# asm 1: sd <finalization=int64#24,>finalization_stack=stack64#26($sp)
# asm 2: sd <finalization=$25,>finalization_stack=232($sp)
sd $25,232($sp)

# qhasm:   in_stack = in
# asm 1: sd <in=int64#2,>in_stack=stack64#28($sp)
# asm 2: sd <in=$5,>in_stack=248($sp)
sd $5,248($sp)

# qhasm:   inlen_stack = inlen
# asm 1: sd <inlen=int64#3,>inlen_stack=stack64#27($sp)
# asm 2: sd <inlen=$6,>inlen_stack=240($sp)
sd $6,240($sp)

# qhasm: goto morerounds
b ._morerounds
nop

# qhasm: finalization2:
._finalization2:

# qhasm:   out = out_stack
# asm 1: ld >out=int64#2,<out_stack=stack64#12($sp)
# asm 2: ld >out=$5,<out_stack=120($sp)
ld $5,120($sp)

# qhasm:   *(unaligned uint32 *) (out + 0) left = x00
# asm 1: swr <x00=int64#16,0(<out=int64#2)
# asm 2: swr <x00=$17,0(<out=$5)
swr $17,0($5)

# qhasm:   *(unaligned uint32 *) (out + 0) right = x00
# asm 1: swl <x00=int64#16,3+0(<out=int64#2)
# asm 2: swl <x00=$17,3+0(<out=$5)
swl $17,3+0($5)

# qhasm:   *(unaligned uint32 *) (out + 4) left = x01
# asm 1: swr <x01=int64#17,4(<out=int64#2)
# asm 2: swr <x01=$18,4(<out=$5)
swr $18,4($5)

# qhasm:   *(unaligned uint32 *) (out + 4) right = x01
# asm 1: swl <x01=int64#17,3+4(<out=int64#2)
# asm 2: swl <x01=$18,3+4(<out=$5)
swl $18,3+4($5)

# qhasm:   *(unaligned uint32 *) (out + 8) left = x02
# asm 1: swr <x02=int64#18,8(<out=int64#2)
# asm 2: swr <x02=$19,8(<out=$5)
swr $19,8($5)

# qhasm:   *(unaligned uint32 *) (out + 8) right = x02
# asm 1: swl <x02=int64#18,3+8(<out=int64#2)
# asm 2: swl <x02=$19,3+8(<out=$5)
swl $19,3+8($5)

# qhasm:   *(unaligned uint32 *) (out + 12) left = x03
# asm 1: swr <x03=int64#19,12(<out=int64#2)
# asm 2: swr <x03=$20,12(<out=$5)
swr $20,12($5)

# qhasm:   *(unaligned uint32 *) (out + 12) right = x03
# asm 1: swl <x03=int64#19,3+12(<out=int64#2)
# asm 2: swl <x03=$20,3+12(<out=$5)
swl $20,3+12($5)

# qhasm:   *(unaligned uint32 *) (out + 16) left = x04
# asm 1: swr <x04=int64#20,16(<out=int64#2)
# asm 2: swr <x04=$21,16(<out=$5)
swr $21,16($5)

# qhasm:   *(unaligned uint32 *) (out + 16) right = x04
# asm 1: swl <x04=int64#20,3+16(<out=int64#2)
# asm 2: swl <x04=$21,3+16(<out=$5)
swl $21,3+16($5)

# qhasm:   *(unaligned uint32 *) (out + 20) left = x05
# asm 1: swr <x05=int64#21,20(<out=int64#2)
# asm 2: swr <x05=$22,20(<out=$5)
swr $22,20($5)

# qhasm:   *(unaligned uint32 *) (out + 20) right = x05
# asm 1: swl <x05=int64#21,3+20(<out=int64#2)
# asm 2: swl <x05=$22,3+20(<out=$5)
swl $22,3+20($5)

# qhasm:   *(unaligned uint32 *) (out + 24) left = x06
# asm 1: swr <x06=int64#22,24(<out=int64#2)
# asm 2: swr <x06=$23,24(<out=$5)
swr $23,24($5)

# qhasm:   *(unaligned uint32 *) (out + 24) right = x06
# asm 1: swl <x06=int64#22,3+24(<out=int64#2)
# asm 2: swl <x06=$23,3+24(<out=$5)
swl $23,3+24($5)

# qhasm:   *(unaligned uint32 *) (out + 28) left = x07
# asm 1: swr <x07=int64#23,28(<out=int64#2)
# asm 2: swr <x07=$24,28(<out=$5)
swr $24,28($5)

# qhasm:   *(unaligned uint32 *) (out + 28) right = x07
# asm 1: swl <x07=int64#23,3+28(<out=int64#2)
# asm 2: swl <x07=$24,3+28(<out=$5)
swl $24,3+28($5)

# qhasm:   x0b = x0b_stack
# asm 1: ld >x0b=int64#3,<x0b_stack=stack64#13($sp)
# asm 2: ld >x0b=$6,<x0b_stack=128($sp)
ld $6,128($sp)

# qhasm:   x0c = x0c_stack
# asm 1: ld >x0c=int64#6,<x0c_stack=stack64#14($sp)
# asm 2: ld >x0c=$9,<x0c_stack=136($sp)
ld $9,136($sp)

# qhasm:   x0d = x0d_stack
# asm 1: ld >x0d=int64#7,<x0d_stack=stack64#15($sp)
# asm 2: ld >x0d=$10,<x0d_stack=144($sp)
ld $10,144($sp)

# qhasm:   x0e = x0e_stack
# asm 1: ld >x0e=int64#8,<x0e_stack=stack64#16($sp)
# asm 2: ld >x0e=$11,<x0e_stack=152($sp)
ld $11,152($sp)

# qhasm:   x0f = x0f_stack
# asm 1: ld >x0f=int64#9,<x0f_stack=stack64#17($sp)
# asm 2: ld >x0f=$2,<x0f_stack=160($sp)
ld $2,160($sp)

# qhasm:   *(unaligned uint32 *) (out + 32) left = x08
# asm 1: swr <x08=int64#1,32(<out=int64#2)
# asm 2: swr <x08=$4,32(<out=$5)
swr $4,32($5)

# qhasm:   *(unaligned uint32 *) (out + 32) right = x08
# asm 1: swl <x08=int64#1,3+32(<out=int64#2)
# asm 2: swl <x08=$4,3+32(<out=$5)
swl $4,3+32($5)

# qhasm:   *(unaligned uint32 *) (out + 36) left = x09
# asm 1: swr <x09=int64#4,36(<out=int64#2)
# asm 2: swr <x09=$7,36(<out=$5)
swr $7,36($5)

# qhasm:   *(unaligned uint32 *) (out + 36) right = x09
# asm 1: swl <x09=int64#4,3+36(<out=int64#2)
# asm 2: swl <x09=$7,3+36(<out=$5)
swl $7,3+36($5)

# qhasm:   *(unaligned uint32 *) (out + 40) left = x0a
# asm 1: swr <x0a=int64#5,40(<out=int64#2)
# asm 2: swr <x0a=$8,40(<out=$5)
swr $8,40($5)

# qhasm:   *(unaligned uint32 *) (out + 40) right = x0a
# asm 1: swl <x0a=int64#5,3+40(<out=int64#2)
# asm 2: swl <x0a=$8,3+40(<out=$5)
swl $8,3+40($5)

# qhasm:   *(unaligned uint32 *) (out + 44) left = x0b
# asm 1: swr <x0b=int64#3,44(<out=int64#2)
# asm 2: swr <x0b=$6,44(<out=$5)
swr $6,44($5)

# qhasm:   *(unaligned uint32 *) (out + 44) right = x0b
# asm 1: swl <x0b=int64#3,3+44(<out=int64#2)
# asm 2: swl <x0b=$6,3+44(<out=$5)
swl $6,3+44($5)

# qhasm:   *(unaligned uint32 *) (out + 48) left = x0c
# asm 1: swr <x0c=int64#6,48(<out=int64#2)
# asm 2: swr <x0c=$9,48(<out=$5)
swr $9,48($5)

# qhasm:   *(unaligned uint32 *) (out + 48) right = x0c
# asm 1: swl <x0c=int64#6,3+48(<out=int64#2)
# asm 2: swl <x0c=$9,3+48(<out=$5)
swl $9,3+48($5)

# qhasm:   *(unaligned uint32 *) (out + 52) left = x0d
# asm 1: swr <x0d=int64#7,52(<out=int64#2)
# asm 2: swr <x0d=$10,52(<out=$5)
swr $10,52($5)

# qhasm:   *(unaligned uint32 *) (out + 52) right = x0d
# asm 1: swl <x0d=int64#7,3+52(<out=int64#2)
# asm 2: swl <x0d=$10,3+52(<out=$5)
swl $10,3+52($5)

# qhasm:   *(unaligned uint32 *) (out + 56) left = x0e
# asm 1: swr <x0e=int64#8,56(<out=int64#2)
# asm 2: swr <x0e=$11,56(<out=$5)
swr $11,56($5)

# qhasm:   *(unaligned uint32 *) (out + 56) right = x0e
# asm 1: swl <x0e=int64#8,3+56(<out=int64#2)
# asm 2: swl <x0e=$11,3+56(<out=$5)
swl $11,3+56($5)

# qhasm:   *(unaligned uint32 *) (out + 60) left = x0f
# asm 1: swr <x0f=int64#9,60(<out=int64#2)
# asm 2: swr <x0f=$2,60(<out=$5)
swr $2,60($5)

# qhasm:   *(unaligned uint32 *) (out + 60) right = x0f
# asm 1: swl <x0f=int64#9,3+60(<out=int64#2)
# asm 2: swl <x0f=$2,3+60(<out=$5)
swl $2,3+60($5)

# qhasm:   result = 0
# asm 1: li >result=int64#1,0
# asm 2: li >result=$4,0
li $4,0

# qhasm:   i16 = i16_stack
# asm 1: ld >i16=int64#15,<i16_stack=stack64#1($sp)
# asm 2: ld >i16=$16,<i16_stack=32($sp)
ld $16,32($sp)

# qhasm:   i17 = i17_stack
# asm 1: ld >i17=int64#16,<i17_stack=stack64#2($sp)
# asm 2: ld >i17=$17,<i17_stack=40($sp)
ld $17,40($sp)

# qhasm:   i18 = i18_stack
# asm 1: ld >i18=int64#17,<i18_stack=stack64#3($sp)
# asm 2: ld >i18=$18,<i18_stack=48($sp)
ld $18,48($sp)

# qhasm:   i19 = i19_stack
# asm 1: ld >i19=int64#18,<i19_stack=stack64#4($sp)
# asm 2: ld >i19=$19,<i19_stack=56($sp)
ld $19,56($sp)

# qhasm:   i20 = i20_stack
# asm 1: ld >i20=int64#19,<i20_stack=stack64#5($sp)
# asm 2: ld >i20=$20,<i20_stack=64($sp)
ld $20,64($sp)

# qhasm:   i21 = i21_stack
# asm 1: ld >i21=int64#20,<i21_stack=stack64#6($sp)
# asm 2: ld >i21=$21,<i21_stack=72($sp)
ld $21,72($sp)

# qhasm:   i22 = i22_stack
# asm 1: ld >i22=int64#21,<i22_stack=stack64#7($sp)
# asm 2: ld >i22=$22,<i22_stack=80($sp)
ld $22,80($sp)

# qhasm:   i23 = i23_stack
# asm 1: ld >i23=int64#22,<i23_stack=stack64#8($sp)
# asm 2: ld >i23=$23,<i23_stack=88($sp)
ld $23,88($sp)

# qhasm:   i28 = i28_stack
# asm 1: ld >i28=int64#25,<i28_stack=stack64#9($sp)
# asm 2: ld >i28=$28,<i28_stack=96($sp)
ld $28,96($sp)

# qhasm:   i30 = i30_stack
# asm 1: ld >i30=int64#26,<i30_stack=stack64#10($sp)
# asm 2: ld >i30=$30,<i30_stack=104($sp)
ld $30,104($sp)

# qhasm:   i31 = i31_stack
# asm 1: ld >i31=int64#27,<i31_stack=stack64#11($sp)
# asm 2: ld >i31=$31,<i31_stack=112($sp)
ld $31,112($sp)

# qhasm: leave
or $2,$4,$0
or $3,$5,$0
daddiu $sp,$sp,320
j $31
nop
.end crypto_hash_cubehash1632_mips64
