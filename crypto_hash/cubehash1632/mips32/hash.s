
# qhasm: int32 out

# qhasm: int32 in

# qhasm: int32 inlenlow

# qhasm: int32 inlenhigh

# qhasm: int32 result

# qhasm: input out

# qhasm: input in

# qhasm: input inlenlow

# qhasm: input inlenhigh

# qhasm: output result

# qhasm: int32 x00

# qhasm: int32 x01

# qhasm: int32 x02

# qhasm: int32 x03

# qhasm: int32 x04

# qhasm: int32 x05

# qhasm: int32 x06

# qhasm: int32 x07

# qhasm: int32 x08

# qhasm: int32 x09

# qhasm: int32 x0a

# qhasm: int32 x0b

# qhasm: int32 x0c

# qhasm: int32 x0d

# qhasm: int32 x0e

# qhasm: int32 x0f

# qhasm: int32 x10

# qhasm: int32 x11

# qhasm: int32 x12

# qhasm: int32 x13

# qhasm: int32 x14

# qhasm: int32 x15

# qhasm: int32 x16

# qhasm: int32 x17

# qhasm: int32 x18

# qhasm: int32 x19

# qhasm: int32 x1a

# qhasm: int32 x1b

# qhasm: int32 x1c

# qhasm: int32 x1d

# qhasm: int32 x1e

# qhasm: int32 x1f

# qhasm: int32 s00

# qhasm: int32 s01

# qhasm: int32 s02

# qhasm: int32 s03

# qhasm: int32 s04

# qhasm: int32 s05

# qhasm: int32 s06

# qhasm: int32 s07

# qhasm: int32 s08

# qhasm: int32 s09

# qhasm: int32 s0a

# qhasm: int32 s0b

# qhasm: int32 s0c

# qhasm: int32 s0d

# qhasm: int32 s0e

# qhasm: int32 s0f

# qhasm: int32 y00

# qhasm: int32 y01

# qhasm: int32 y02

# qhasm: int32 y03

# qhasm: int32 y04

# qhasm: int32 y05

# qhasm: int32 y06

# qhasm: int32 y07

# qhasm: int32 r

# qhasm: int32 i

# qhasm: int32 finalization

# qhasm: stack256 tmp

# qhasm: int32 z

# qhasm: int32 check

# qhasm: int32 carry

# qhasm: stack32 out_stack

# qhasm: stack32 in_stack

# qhasm: stack32 inlenlow_stack

# qhasm: stack32 inlenhigh_stack

# qhasm: stack32 finalization_stack

# qhasm: stack32 r_stack

# qhasm: stack32 x02_stack

# qhasm: stack32 x0a_stack

# qhasm: stack32 x0b_stack

# qhasm: stack32 x0c_stack

# qhasm: stack32 x0d_stack

# qhasm: stack32 x0e_stack

# qhasm: stack32 x0f_stack

# qhasm: stack32 x14_stack

# qhasm: stack32 x15_stack

# qhasm: stack32 x16_stack

# qhasm: stack32 x17_stack

# qhasm: stack32 x1c_stack

# qhasm: stack32 x1d_stack

# qhasm: stack32 x1e_stack

# qhasm: stack32 x1f_stack

# qhasm: int32 i16

# qhasm: int32 i17

# qhasm: int32 i18

# qhasm: int32 i19

# qhasm: int32 i20

# qhasm: int32 i21

# qhasm: int32 i22

# qhasm: int32 i23

# qhasm: int32 i30

# qhasm: int32 i31

# qhasm: caller i16

# qhasm: caller i17

# qhasm: caller i18

# qhasm: caller i19

# qhasm: caller i20

# qhasm: caller i21

# qhasm: caller i22

# qhasm: caller i23

# qhasm: caller i30

# qhasm: caller i31

# qhasm: stack32 i16_stack

# qhasm: stack32 i17_stack

# qhasm: stack32 i18_stack

# qhasm: stack32 i19_stack

# qhasm: stack32 i20_stack

# qhasm: stack32 i21_stack

# qhasm: stack32 i22_stack

# qhasm: stack32 i23_stack

# qhasm: stack32 i30_stack

# qhasm: stack32 i31_stack

# qhasm: enter crypto_hash_cubehash1632_mips32
.text
.align 2
.set noat
.globl crypto_hash_cubehash1632_mips32
.ent crypto_hash_cubehash1632_mips32
crypto_hash_cubehash1632_mips32:
addiu $sp,$sp,-192

# qhasm:   i16_stack = i16
# asm 1: sw <i16=int32#15,>i16_stack=stack32#1($sp)
# asm 2: sw <i16=$16,>i16_stack=0($sp)
sw $16,0($sp)

# qhasm:   i17_stack = i17
# asm 1: sw <i17=int32#16,>i17_stack=stack32#2($sp)
# asm 2: sw <i17=$17,>i17_stack=4($sp)
sw $17,4($sp)

# qhasm:   i18_stack = i18
# asm 1: sw <i18=int32#17,>i18_stack=stack32#3($sp)
# asm 2: sw <i18=$18,>i18_stack=8($sp)
sw $18,8($sp)

# qhasm:   i19_stack = i19
# asm 1: sw <i19=int32#18,>i19_stack=stack32#4($sp)
# asm 2: sw <i19=$19,>i19_stack=12($sp)
sw $19,12($sp)

# qhasm:   i20_stack = i20
# asm 1: sw <i20=int32#19,>i20_stack=stack32#5($sp)
# asm 2: sw <i20=$20,>i20_stack=16($sp)
sw $20,16($sp)

# qhasm:   i21_stack = i21
# asm 1: sw <i21=int32#20,>i21_stack=stack32#6($sp)
# asm 2: sw <i21=$21,>i21_stack=20($sp)
sw $21,20($sp)

# qhasm:   i22_stack = i22
# asm 1: sw <i22=int32#21,>i22_stack=stack32#7($sp)
# asm 2: sw <i22=$22,>i22_stack=24($sp)
sw $22,24($sp)

# qhasm:   i23_stack = i23
# asm 1: sw <i23=int32#22,>i23_stack=stack32#8($sp)
# asm 2: sw <i23=$23,>i23_stack=28($sp)
sw $23,28($sp)

# qhasm:   i30_stack = i30
# asm 1: sw <i30=int32#26,>i30_stack=stack32#9($sp)
# asm 2: sw <i30=$30,>i30_stack=32($sp)
sw $30,32($sp)

# qhasm:   i31_stack = i31
# asm 1: sw <i31=int32#27,>i31_stack=stack32#10($sp)
# asm 2: sw <i31=$31,>i31_stack=36($sp)
sw $31,36($sp)

# qhasm:   out_stack = out
# asm 1: sw <out=int32#1,>out_stack=stack32#11($sp)
# asm 2: sw <out=$4,>out_stack=40($sp)
sw $4,40($sp)

# qhasm:   x08 = 0x4d420000
# asm 1: li >x08=int32#1,0x4d420000
# asm 2: li >x08=$4,0x4d420000
li $4,0x4d420000

# qhasm:   x08 |= 0xc787
# asm 1: ori <x08=int32#1,<x08=int32#1,0xc787
# asm 2: ori <x08=$4,<x08=$4,0xc787
ori $4,$4,0xc787

# qhasm:   x09 = 0xa6470000
# asm 1: li >x09=int32#5,0xa6470000
# asm 2: li >x09=$8,0xa6470000
li $8,0xa6470000

# qhasm:   x09 |= 0xa8b3
# asm 1: ori <x09=int32#5,<x09=int32#5,0xa8b3
# asm 2: ori <x09=$8,<x09=$8,0xa8b3
ori $8,$8,0xa8b3

# qhasm:   x0a = 0x97cf0000
# asm 1: li >x0a=int32#6,0x97cf0000
# asm 2: li >x0a=$9,0x97cf0000
li $9,0x97cf0000

# qhasm:   x0a |= 0x0bef
# asm 1: ori <x0a=int32#6,<x0a=int32#6,0x0bef
# asm 2: ori <x0a=$9,<x0a=$9,0x0bef
ori $9,$9,0x0bef

# qhasm:   x0b = 0x825b0000
# asm 1: li >x0b=int32#7,0x825b0000
# asm 2: li >x0b=$10,0x825b0000
li $10,0x825b0000

# qhasm:   x0b |= 0x4537
# asm 1: ori <x0b=int32#7,<x0b=int32#7,0x4537
# asm 2: ori <x0b=$10,<x0b=$10,0x4537
ori $10,$10,0x4537

# qhasm:   x0c = 0xeef80000
# asm 1: li >x0c=int32#8,0xeef80000
# asm 2: li >x0c=$11,0xeef80000
li $11,0xeef80000

# qhasm:   x0c |= 0x64d2
# asm 1: ori <x0c=int32#8,<x0c=int32#8,0x64d2
# asm 2: ori <x0c=$11,<x0c=$11,0x64d2
ori $11,$11,0x64d2

# qhasm:   x0d = 0xf2200000
# asm 1: li >x0d=int32#9,0xf2200000
# asm 2: li >x0d=$2,0xf2200000
li $2,0xf2200000

# qhasm:   x0d |= 0x90c4
# asm 1: ori <x0d=int32#9,<x0d=int32#9,0x90c4
# asm 2: ori <x0d=$2,<x0d=$2,0x90c4
ori $2,$2,0x90c4

# qhasm:   x0e = 0xd0e50000
# asm 1: li >x0e=int32#10,0xd0e50000
# asm 2: li >x0e=$3,0xd0e50000
li $3,0xd0e50000

# qhasm:   x0e |= 0xcd33
# asm 1: ori <x0e=int32#10,<x0e=int32#10,0xcd33
# asm 2: ori <x0e=$3,<x0e=$3,0xcd33
ori $3,$3,0xcd33

# qhasm:   x0f = 0xa2390000
# asm 1: li >x0f=int32#11,0xa2390000
# asm 2: li >x0f=$12,0xa2390000
li $12,0xa2390000

# qhasm:   x0f |= 0x11ae
# asm 1: ori <x0f=int32#11,<x0f=int32#11,0x11ae
# asm 2: ori <x0f=$12,<x0f=$12,0x11ae
ori $12,$12,0x11ae

# qhasm:   x0b_stack = x0b
# asm 1: sw <x0b=int32#7,>x0b_stack=stack32#12($sp)
# asm 2: sw <x0b=$10,>x0b_stack=44($sp)
sw $10,44($sp)

# qhasm:   x0c_stack = x0c
# asm 1: sw <x0c=int32#8,>x0c_stack=stack32#13($sp)
# asm 2: sw <x0c=$11,>x0c_stack=48($sp)
sw $11,48($sp)

# qhasm:   x0d_stack = x0d
# asm 1: sw <x0d=int32#9,>x0d_stack=stack32#14($sp)
# asm 2: sw <x0d=$2,>x0d_stack=52($sp)
sw $2,52($sp)

# qhasm:   x0e_stack = x0e
# asm 1: sw <x0e=int32#10,>x0e_stack=stack32#15($sp)
# asm 2: sw <x0e=$3,>x0e_stack=56($sp)
sw $3,56($sp)

# qhasm:   x0f_stack = x0f
# asm 1: sw <x0f=int32#11,>x0f_stack=stack32#16($sp)
# asm 2: sw <x0f=$12,>x0f_stack=60($sp)
sw $12,60($sp)

# qhasm:   x10 = 0xfcd30000
# asm 1: li >x10=int32#7,0xfcd30000
# asm 2: li >x10=$10,0xfcd30000
li $10,0xfcd30000

# qhasm:   x10 |= 0x98d9
# asm 1: ori <x10=int32#7,<x10=int32#7,0x98d9
# asm 2: ori <x10=$10,<x10=$10,0x98d9
ori $10,$10,0x98d9

# qhasm:   x11 = 0x148f0000
# asm 1: li >x11=int32#8,0x148f0000
# asm 2: li >x11=$11,0x148f0000
li $11,0x148f0000

# qhasm:   x11 |= 0xe485
# asm 1: ori <x11=int32#8,<x11=int32#8,0xe485
# asm 2: ori <x11=$11,<x11=$11,0xe485
ori $11,$11,0xe485

# qhasm:   x12 = 0x1b010000
# asm 1: li >x12=int32#10,0x1b010000
# asm 2: li >x12=$3,0x1b010000
li $3,0x1b010000

# qhasm:   x12 |= 0x7bef
# asm 1: ori <x12=int32#10,<x12=int32#10,0x7bef
# asm 2: ori <x12=$3,<x12=$3,0x7bef
ori $3,$3,0x7bef

# qhasm:   x13 = 0xb6440000
# asm 1: li >x13=int32#12,0xb6440000
# asm 2: li >x13=$13,0xb6440000
li $13,0xb6440000

# qhasm:   x13 |= 0x4532
# asm 1: ori <x13=int32#12,<x13=int32#12,0x4532
# asm 2: ori <x13=$13,<x13=$13,0x4532
ori $13,$13,0x4532

# qhasm:   x14 = 0x6a530000
# asm 1: li >x14=int32#13,0x6a530000
# asm 2: li >x14=$14,0x6a530000
li $14,0x6a530000

# qhasm:   x14 |= 0x6159
# asm 1: ori <x14=int32#13,<x14=int32#13,0x6159
# asm 2: ori <x14=$14,<x14=$14,0x6159
ori $14,$14,0x6159

# qhasm:   x15 = 0x2ff50000
# asm 1: li >x15=int32#14,0x2ff50000
# asm 2: li >x15=$15,0x2ff50000
li $15,0x2ff50000

# qhasm:   x15 |= 0x781c
# asm 1: ori <x15=int32#14,<x15=int32#14,0x781c
# asm 2: ori <x15=$15,<x15=$15,0x781c
ori $15,$15,0x781c

# qhasm:   x16 = 0x91fa0000
# asm 1: li >x16=int32#15,0x91fa0000
# asm 2: li >x16=$16,0x91fa0000
li $16,0x91fa0000

# qhasm:   x16 |= 0x7934
# asm 1: ori <x16=int32#15,<x16=int32#15,0x7934
# asm 2: ori <x16=$16,<x16=$16,0x7934
ori $16,$16,0x7934

# qhasm:   x17 = 0x0dba0000
# asm 1: li >x17=int32#16,0x0dba0000
# asm 2: li >x17=$17,0x0dba0000
li $17,0x0dba0000

# qhasm:   x17 |= 0xdea9
# asm 1: ori <x17=int32#16,<x17=int32#16,0xdea9
# asm 2: ori <x17=$17,<x17=$17,0xdea9
ori $17,$17,0xdea9

# qhasm:   x14_stack = x14
# asm 1: sw <x14=int32#13,>x14_stack=stack32#17($sp)
# asm 2: sw <x14=$14,>x14_stack=64($sp)
sw $14,64($sp)

# qhasm:   x15_stack = x15
# asm 1: sw <x15=int32#14,>x15_stack=stack32#18($sp)
# asm 2: sw <x15=$15,>x15_stack=68($sp)
sw $15,68($sp)

# qhasm:   x16_stack = x16
# asm 1: sw <x16=int32#15,>x16_stack=stack32#19($sp)
# asm 2: sw <x16=$16,>x16_stack=72($sp)
sw $16,72($sp)

# qhasm:   x17_stack = x17
# asm 1: sw <x17=int32#16,>x17_stack=stack32#20($sp)
# asm 2: sw <x17=$17,>x17_stack=76($sp)
sw $17,76($sp)

# qhasm:   x18 = 0xd65c0000
# asm 1: li >x18=int32#13,0xd65c0000
# asm 2: li >x18=$14,0xd65c0000
li $14,0xd65c0000

# qhasm:   x18 |= 0x8a2b
# asm 1: ori <x18=int32#13,<x18=int32#13,0x8a2b
# asm 2: ori <x18=$14,<x18=$14,0x8a2b
ori $14,$14,0x8a2b

# qhasm:   x19 = 0xa5a70000
# asm 1: li >x19=int32#14,0xa5a70000
# asm 2: li >x19=$15,0xa5a70000
li $15,0xa5a70000

# qhasm:   x19 |= 0x0e75
# asm 1: ori <x19=int32#14,<x19=int32#14,0x0e75
# asm 2: ori <x19=$15,<x19=$15,0x0e75
ori $15,$15,0x0e75

# qhasm:   x1a = 0xb1c60000
# asm 1: li >x1a=int32#15,0xb1c60000
# asm 2: li >x1a=$16,0xb1c60000
li $16,0xb1c60000

# qhasm:   x1a |= 0x2456
# asm 1: ori <x1a=int32#15,<x1a=int32#15,0x2456
# asm 2: ori <x1a=$16,<x1a=$16,0x2456
ori $16,$16,0x2456

# qhasm:   x1b = 0xbc790000
# asm 1: li >x1b=int32#16,0xbc790000
# asm 2: li >x1b=$17,0xbc790000
li $17,0xbc790000

# qhasm:   x1b |= 0x6576
# asm 1: ori <x1b=int32#16,<x1b=int32#16,0x6576
# asm 2: ori <x1b=$17,<x1b=$17,0x6576
ori $17,$17,0x6576

# qhasm:   x1c = 0x19210000
# asm 1: li >x1c=int32#17,0x19210000
# asm 2: li >x1c=$18,0x19210000
li $18,0x19210000

# qhasm:   x1c |= 0xc8f7
# asm 1: ori <x1c=int32#17,<x1c=int32#17,0xc8f7
# asm 2: ori <x1c=$18,<x1c=$18,0xc8f7
ori $18,$18,0xc8f7

# qhasm:   x1d = 0xe7980000
# asm 1: li >x1d=int32#18,0xe7980000
# asm 2: li >x1d=$19,0xe7980000
li $19,0xe7980000

# qhasm:   x1d |= 0x9af1
# asm 1: ori <x1d=int32#18,<x1d=int32#18,0x9af1
# asm 2: ori <x1d=$19,<x1d=$19,0x9af1
ori $19,$19,0x9af1

# qhasm:   x1e = 0x77950000
# asm 1: li >x1e=int32#19,0x77950000
# asm 2: li >x1e=$20,0x77950000
li $20,0x77950000

# qhasm:   x1e |= 0xd246
# asm 1: ori <x1e=int32#19,<x1e=int32#19,0xd246
# asm 2: ori <x1e=$20,<x1e=$20,0xd246
ori $20,$20,0xd246

# qhasm:   x1f = 0xd43e0000
# asm 1: li >x1f=int32#20,0xd43e0000
# asm 2: li >x1f=$21,0xd43e0000
li $21,0xd43e0000

# qhasm:   x1f |= 0x3b44
# asm 1: ori <x1f=int32#20,<x1f=int32#20,0x3b44
# asm 2: ori <x1f=$21,<x1f=$21,0x3b44
ori $21,$21,0x3b44

# qhasm:   x1c_stack = x1c
# asm 1: sw <x1c=int32#17,>x1c_stack=stack32#21($sp)
# asm 2: sw <x1c=$18,>x1c_stack=80($sp)
sw $18,80($sp)

# qhasm:   x1d_stack = x1d
# asm 1: sw <x1d=int32#18,>x1d_stack=stack32#22($sp)
# asm 2: sw <x1d=$19,>x1d_stack=84($sp)
sw $19,84($sp)

# qhasm:   x1e_stack = x1e
# asm 1: sw <x1e=int32#19,>x1e_stack=stack32#23($sp)
# asm 2: sw <x1e=$20,>x1e_stack=88($sp)
sw $20,88($sp)

# qhasm:   x1f_stack = x1f
# asm 1: sw <x1f=int32#20,>x1f_stack=stack32#24($sp)
# asm 2: sw <x1f=$21,>x1f_stack=92($sp)
sw $21,92($sp)

# qhasm:   x00 = 0x2aea0000
# asm 1: li >x00=int32#17,0x2aea0000
# asm 2: li >x00=$18,0x2aea0000
li $18,0x2aea0000

# qhasm:   x00 |= 0x2a61
# asm 1: ori <x00=int32#17,<x00=int32#17,0x2a61
# asm 2: ori <x00=$18,<x00=$18,0x2a61
ori $18,$18,0x2a61

# qhasm:   x01 = 0x50f40000
# asm 1: li >x01=int32#18,0x50f40000
# asm 2: li >x01=$19,0x50f40000
li $19,0x50f40000

# qhasm:   x01 |= 0x94d4
# asm 1: ori <x01=int32#18,<x01=int32#18,0x94d4
# asm 2: ori <x01=$19,<x01=$19,0x94d4
ori $19,$19,0x94d4

# qhasm:   x02 = 0x2d530000
# asm 1: li >x02=int32#19,0x2d530000
# asm 2: li >x02=$20,0x2d530000
li $20,0x2d530000

# qhasm:   x02 |= 0x8b8b
# asm 1: ori <x02=int32#19,<x02=int32#19,0x8b8b
# asm 2: ori <x02=$20,<x02=$20,0x8b8b
ori $20,$20,0x8b8b

# qhasm:   x03 = 0x41670000
# asm 1: li >x03=int32#20,0x41670000
# asm 2: li >x03=$21,0x41670000
li $21,0x41670000

# qhasm:   x03 |= 0xd83e
# asm 1: ori <x03=int32#20,<x03=int32#20,0xd83e
# asm 2: ori <x03=$21,<x03=$21,0xd83e
ori $21,$21,0xd83e

# qhasm:   x04 = 0x3fee0000
# asm 1: li >x04=int32#21,0x3fee0000
# asm 2: li >x04=$22,0x3fee0000
li $22,0x3fee0000

# qhasm:   x04 |= 0x2313
# asm 1: ori <x04=int32#21,<x04=int32#21,0x2313
# asm 2: ori <x04=$22,<x04=$22,0x2313
ori $22,$22,0x2313

# qhasm:   x05 = 0xc7010000
# asm 1: li >x05=int32#22,0xc7010000
# asm 2: li >x05=$23,0xc7010000
li $23,0xc7010000

# qhasm:   x05 |= 0xcf8c
# asm 1: ori <x05=int32#22,<x05=int32#22,0xcf8c
# asm 2: ori <x05=$23,<x05=$23,0xcf8c
ori $23,$23,0xcf8c

# qhasm:   x06 = 0xcc390000
# asm 1: li >x06=int32#23,0xcc390000
# asm 2: li >x06=$24,0xcc390000
li $24,0xcc390000

# qhasm:   x06 |= 0x968e
# asm 1: ori <x06=int32#23,<x06=int32#23,0x968e
# asm 2: ori <x06=$24,<x06=$24,0x968e
ori $24,$24,0x968e

# qhasm:   x07 = 0x50ac0000
# asm 1: li >x07=int32#24,0x50ac0000
# asm 2: li >x07=$25,0x50ac0000
li $25,0x50ac0000

# qhasm:   x07 |= 0x5695
# asm 1: ori <x07=int32#24,<x07=int32#24,0x5695
# asm 2: ori <x07=$25,<x07=$25,0x5695
ori $25,$25,0x5695

# qhasm:   finalization = 0
# asm 1: li >finalization=int32#25,0
# asm 2: li >finalization=$28,0
li $28,0

# qhasm: checkinlen:
._checkinlen:

# qhasm:                  carry = (uint32) inlenlow < 32
# asm 1: sltiu >carry=int32#26,<inlenlow=int32#3,32
# asm 2: sltiu >carry=$30,<inlenlow=$6,32
sltiu $30,$6,32

# qhasm: goto mainloop if carry == 0
# asm 1: beq <carry=int32#26,$0,._mainloop
# asm 2: beq <carry=$30,$0,._mainloop
beq $30,$0,._mainloop
nop

# qhasm: goto inlenbelow32 if inlenhigh == 0
# asm 1: beq <inlenhigh=int32#4,$0,._inlenbelow32
# asm 2: beq <inlenhigh=$7,$0,._inlenbelow32
beq $7,$0,._inlenbelow32
nop

# qhasm: mainloop:
._mainloop:

# qhasm:   inlenlow -= 32
# asm 1: addiu <inlenlow=int32#3,<inlenlow=int32#3,-32
# asm 2: addiu <inlenlow=$6,<inlenlow=$6,-32
addiu $6,$6,-32

# qhasm:   inlenhigh -= carry
# asm 1: subu <inlenhigh=int32#4,<inlenhigh=int32#4,<carry=int32#26
# asm 2: subu <inlenhigh=$7,<inlenhigh=$7,<carry=$30
subu $7,$7,$30

# qhasm:   r = 16
# asm 1: li >r=int32#26,16
# asm 2: li >r=$30,16
li $30,16

# qhasm:   finalization_stack = finalization
# asm 1: sw <finalization=int32#25,>finalization_stack=stack32#25($sp)
# asm 2: sw <finalization=$28,>finalization_stack=96($sp)
sw $28,96($sp)

# qhasm:   inlenlow_stack = inlenlow
# asm 1: sw <inlenlow=int32#3,>inlenlow_stack=stack32#26($sp)
# asm 2: sw <inlenlow=$6,>inlenlow_stack=100($sp)
sw $6,100($sp)

# qhasm:   inlenhigh_stack = inlenhigh
# asm 1: sw <inlenhigh=int32#4,>inlenhigh_stack=stack32#27($sp)
# asm 2: sw <inlenhigh=$7,>inlenhigh_stack=104($sp)
sw $7,104($sp)

# qhasm:   new y00

# qhasm:   new y01

# qhasm:   new y02

# qhasm:   new y03

# qhasm:   y00 left = *(unaligned uint32 *) (in + 0)
# asm 1: lwr <y00=int32#3,0(<in=int32#2)
# asm 2: lwr <y00=$6,0(<in=$5)
lwr $6,0($5)

# qhasm:   y00 right = *(unaligned uint32 *) (in + 0)
# asm 1: lwl <y00=int32#3,3+0(<in=int32#2)
# asm 2: lwl <y00=$6,3+0(<in=$5)
lwl $6,3+0($5)

# qhasm:   y01 left = *(unaligned uint32 *) (in + 4)
# asm 1: lwr <y01=int32#4,4(<in=int32#2)
# asm 2: lwr <y01=$7,4(<in=$5)
lwr $7,4($5)

# qhasm:   y01 right = *(unaligned uint32 *) (in + 4)
# asm 1: lwl <y01=int32#4,3+4(<in=int32#2)
# asm 2: lwl <y01=$7,3+4(<in=$5)
lwl $7,3+4($5)

# qhasm:   y02 left = *(unaligned uint32 *) (in + 8)
# asm 1: lwr <y02=int32#25,8(<in=int32#2)
# asm 2: lwr <y02=$28,8(<in=$5)
lwr $28,8($5)

# qhasm:   y02 right = *(unaligned uint32 *) (in + 8)
# asm 1: lwl <y02=int32#25,3+8(<in=int32#2)
# asm 2: lwl <y02=$28,3+8(<in=$5)
lwl $28,3+8($5)

# qhasm:   y03 left = *(unaligned uint32 *) (in + 12)
# asm 1: lwr <y03=int32#27,12(<in=int32#2)
# asm 2: lwr <y03=$31,12(<in=$5)
lwr $31,12($5)

# qhasm:   y03 right = *(unaligned uint32 *) (in + 12)
# asm 1: lwl <y03=int32#27,3+12(<in=int32#2)
# asm 2: lwl <y03=$31,3+12(<in=$5)
lwl $31,3+12($5)

# qhasm:   x00 ^= y00
# asm 1: xor <x00=int32#17,<x00=int32#17,<y00=int32#3
# asm 2: xor <x00=$18,<x00=$18,<y00=$6
xor $18,$18,$6

# qhasm:   x01 ^= y01
# asm 1: xor <x01=int32#18,<x01=int32#18,<y01=int32#4
# asm 2: xor <x01=$19,<x01=$19,<y01=$7
xor $19,$19,$7

# qhasm:   x02 ^= y02
# asm 1: xor <x02=int32#19,<x02=int32#19,<y02=int32#25
# asm 2: xor <x02=$20,<x02=$20,<y02=$28
xor $20,$20,$28

# qhasm:   x03 ^= y03
# asm 1: xor <x03=int32#20,<x03=int32#20,<y03=int32#27
# asm 2: xor <x03=$21,<x03=$21,<y03=$31
xor $21,$21,$31

# qhasm:   new y04

# qhasm:   new y05

# qhasm:   new y06

# qhasm:   new y07

# qhasm:   y04 left = *(unaligned uint32 *) (in + 16)
# asm 1: lwr <y04=int32#3,16(<in=int32#2)
# asm 2: lwr <y04=$6,16(<in=$5)
lwr $6,16($5)

# qhasm:   y04 right = *(unaligned uint32 *) (in + 16)
# asm 1: lwl <y04=int32#3,3+16(<in=int32#2)
# asm 2: lwl <y04=$6,3+16(<in=$5)
lwl $6,3+16($5)

# qhasm:   y05 left = *(unaligned uint32 *) (in + 20)
# asm 1: lwr <y05=int32#4,20(<in=int32#2)
# asm 2: lwr <y05=$7,20(<in=$5)
lwr $7,20($5)

# qhasm:   y05 right = *(unaligned uint32 *) (in + 20)
# asm 1: lwl <y05=int32#4,3+20(<in=int32#2)
# asm 2: lwl <y05=$7,3+20(<in=$5)
lwl $7,3+20($5)

# qhasm:   x04 ^= y04
# asm 1: xor <x04=int32#21,<x04=int32#21,<y04=int32#3
# asm 2: xor <x04=$22,<x04=$22,<y04=$6
xor $22,$22,$6

# qhasm:   x05 ^= y05
# asm 1: xor <x05=int32#22,<x05=int32#22,<y05=int32#4
# asm 2: xor <x05=$23,<x05=$23,<y05=$7
xor $23,$23,$7

# qhasm:   y06 left = *(unaligned uint32 *) (in + 24)
# asm 1: lwr <y06=int32#25,24(<in=int32#2)
# asm 2: lwr <y06=$28,24(<in=$5)
lwr $28,24($5)

# qhasm:   y06 right = *(unaligned uint32 *) (in + 24)
# asm 1: lwl <y06=int32#25,3+24(<in=int32#2)
# asm 2: lwl <y06=$28,3+24(<in=$5)
lwl $28,3+24($5)

# qhasm:   y07 left = *(unaligned uint32 *) (in + 28)
# asm 1: lwr <y07=int32#27,28(<in=int32#2)
# asm 2: lwr <y07=$31,28(<in=$5)
lwr $31,28($5)

# qhasm:   y07 right = *(unaligned uint32 *) (in + 28)
# asm 1: lwl <y07=int32#27,3+28(<in=int32#2)
# asm 2: lwl <y07=$31,3+28(<in=$5)
lwl $31,3+28($5)

# qhasm:   x06 ^= y06
# asm 1: xor <x06=int32#23,<x06=int32#23,<y06=int32#25
# asm 2: xor <x06=$24,<x06=$24,<y06=$28
xor $24,$24,$28

# qhasm:   x07 ^= y07
# asm 1: xor <x07=int32#24,<x07=int32#24,<y07=int32#27
# asm 2: xor <x07=$25,<x07=$25,<y07=$31
xor $25,$25,$31

# qhasm:   in += 32
# asm 1: addiu <in=int32#2,<in=int32#2,32
# asm 2: addiu <in=$5,<in=$5,32
addiu $5,$5,32

# qhasm:   in_stack = in
# asm 1: sw <in=int32#2,>in_stack=stack32#28($sp)
# asm 2: sw <in=$5,>in_stack=108($sp)
sw $5,108($sp)

# qhasm: morerounds:
._morerounds:

# qhasm: r_stack = r
# asm 1: sw <r=int32#26,>r_stack=stack32#29($sp)
# asm 2: sw <r=$30,>r_stack=112($sp)
sw $30,112($sp)

# qhasm:   x10 += x00
# asm 1: addu <x10=int32#7,<x10=int32#7,<x00=int32#17
# asm 2: addu <x10=$10,<x10=$10,<x00=$18
addu $10,$10,$18

# qhasm:   x12 += x02
# asm 1: addu <x12=int32#10,<x12=int32#10,<x02=int32#19
# asm 2: addu <x12=$3,<x12=$3,<x02=$20
addu $3,$3,$20

# qhasm:   x18 += x08
# asm 1: addu <x18=int32#13,<x18=int32#13,<x08=int32#1
# asm 2: addu <x18=$14,<x18=$14,<x08=$4
addu $14,$14,$4

# qhasm:   x1a += x0a
# asm 1: addu <x1a=int32#15,<x1a=int32#15,<x0a=int32#6
# asm 2: addu <x1a=$16,<x1a=$16,<x0a=$9
addu $16,$16,$9

# qhasm:   s00 = x00 << 7
# asm 1: sll >s00=int32#2,<x00=int32#17,7
# asm 2: sll >s00=$5,<x00=$18,7
sll $5,$18,7

# qhasm:   (uint32) x00 >>= 25
# asm 1: srl <x00=int32#17,<x00=int32#17,25
# asm 2: srl <x00=$18,<x00=$18,25
srl $18,$18,25

# qhasm:   x00 |= s00
# asm 1: or <x00=int32#17,<x00=int32#17,<s00=int32#2
# asm 2: or <x00=$18,<x00=$18,<s00=$5
or $18,$18,$5

# qhasm:   s02 = x02 << 7
# asm 1: sll >s02=int32#2,<x02=int32#19,7
# asm 2: sll >s02=$5,<x02=$20,7
sll $5,$20,7

# qhasm:   (uint32) x02 >>= 25
# asm 1: srl <x02=int32#19,<x02=int32#19,25
# asm 2: srl <x02=$20,<x02=$20,25
srl $20,$20,25

# qhasm:   x02 |= s02
# asm 1: or <x02=int32#19,<x02=int32#19,<s02=int32#2
# asm 2: or <x02=$20,<x02=$20,<s02=$5
or $20,$20,$5

# qhasm:   s08 = x08 << 7
# asm 1: sll >s08=int32#2,<x08=int32#1,7
# asm 2: sll >s08=$5,<x08=$4,7
sll $5,$4,7

# qhasm:   (uint32) x08 >>= 25
# asm 1: srl <x08=int32#1,<x08=int32#1,25
# asm 2: srl <x08=$4,<x08=$4,25
srl $4,$4,25

# qhasm:   x08 |= s08
# asm 1: or <x08=int32#1,<x08=int32#1,<s08=int32#2
# asm 2: or <x08=$4,<x08=$4,<s08=$5
or $4,$4,$5

# qhasm:   s0a = x0a << 7
# asm 1: sll >s0a=int32#2,<x0a=int32#6,7
# asm 2: sll >s0a=$5,<x0a=$9,7
sll $5,$9,7

# qhasm:   (uint32) x0a >>= 25
# asm 1: srl <x0a=int32#6,<x0a=int32#6,25
# asm 2: srl <x0a=$9,<x0a=$9,25
srl $9,$9,25

# qhasm:   x0a |= s0a
# asm 1: or <x0a=int32#6,<x0a=int32#6,<s0a=int32#2
# asm 2: or <x0a=$9,<x0a=$9,<s0a=$5
or $9,$9,$5

# qhasm:   x00 ^= x18
# asm 1: xor <x00=int32#17,<x00=int32#17,<x18=int32#13
# asm 2: xor <x00=$18,<x00=$18,<x18=$14
xor $18,$18,$14

# qhasm:   x02 ^= x1a
# asm 1: xor <x02=int32#19,<x02=int32#19,<x1a=int32#15
# asm 2: xor <x02=$20,<x02=$20,<x1a=$16
xor $20,$20,$16

# qhasm:   x08 ^= x10
# asm 1: xor <x08=int32#1,<x08=int32#1,<x10=int32#7
# asm 2: xor <x08=$4,<x08=$4,<x10=$10
xor $4,$4,$10

# qhasm:   x0a ^= x12
# asm 1: xor <x0a=int32#6,<x0a=int32#6,<x12=int32#10
# asm 2: xor <x0a=$9,<x0a=$9,<x12=$3
xor $9,$9,$3

# qhasm:           x02_stack = x02
# asm 1: sw <x02=int32#19,>x02_stack=stack32#14($sp)
# asm 2: sw <x02=$20,>x02_stack=52($sp)
sw $20,52($sp)

# qhasm:   x1a += x00
# asm 1: addu <x1a=int32#15,<x1a=int32#15,<x00=int32#17
# asm 2: addu <x1a=$16,<x1a=$16,<x00=$18
addu $16,$16,$18

# qhasm:           x0a_stack = x0a
# asm 1: sw <x0a=int32#6,>x0a_stack=stack32#16($sp)
# asm 2: sw <x0a=$9,>x0a_stack=60($sp)
sw $9,60($sp)

# qhasm:   x18 += x02
# asm 1: addu <x18=int32#13,<x18=int32#13,<x02=int32#19
# asm 2: addu <x18=$14,<x18=$14,<x02=$20
addu $14,$14,$20

# qhasm:           x14 = x14_stack
# asm 1: lw >x14=int32#2,<x14_stack=stack32#17($sp)
# asm 2: lw >x14=$5,<x14_stack=64($sp)
lw $5,64($sp)

# qhasm:   x12 += x08
# asm 1: addu <x12=int32#10,<x12=int32#10,<x08=int32#1
# asm 2: addu <x12=$3,<x12=$3,<x08=$4
addu $3,$3,$4

# qhasm:           x16 = x16_stack
# asm 1: lw >x16=int32#3,<x16_stack=stack32#19($sp)
# asm 2: lw >x16=$6,<x16_stack=72($sp)
lw $6,72($sp)

# qhasm:   x10 += x0a
# asm 1: addu <x10=int32#7,<x10=int32#7,<x0a=int32#6
# asm 2: addu <x10=$10,<x10=$10,<x0a=$9
addu $10,$10,$9

# qhasm:           x1c = x1c_stack
# asm 1: lw >x1c=int32#4,<x1c_stack=stack32#21($sp)
# asm 2: lw >x1c=$7,<x1c_stack=80($sp)
lw $7,80($sp)

# qhasm:   x14 += x04
# asm 1: addu <x14=int32#2,<x14=int32#2,<x04=int32#21
# asm 2: addu <x14=$5,<x14=$5,<x04=$22
addu $5,$5,$22

# qhasm:           x1e = x1e_stack
# asm 1: lw >x1e=int32#6,<x1e_stack=stack32#23($sp)
# asm 2: lw >x1e=$9,<x1e_stack=88($sp)
lw $9,88($sp)

# qhasm: 	  x0c = x0c_stack
# asm 1: lw >x0c=int32#19,<x0c_stack=stack32#13($sp)
# asm 2: lw >x0c=$20,<x0c_stack=48($sp)
lw $20,48($sp)

# qhasm: 	  x0e = x0e_stack
# asm 1: lw >x0e=int32#25,<x0e_stack=stack32#15($sp)
# asm 2: lw >x0e=$28,<x0e_stack=56($sp)
lw $28,56($sp)

# qhasm:   x16 += x06
# asm 1: addu <x16=int32#3,<x16=int32#3,<x06=int32#23
# asm 2: addu <x16=$6,<x16=$6,<x06=$24
addu $6,$6,$24

# qhasm:   x1c += x0c
# asm 1: addu <x1c=int32#4,<x1c=int32#4,<x0c=int32#19
# asm 2: addu <x1c=$7,<x1c=$7,<x0c=$20
addu $7,$7,$20

# qhasm:   x1e += x0e
# asm 1: addu <x1e=int32#6,<x1e=int32#6,<x0e=int32#25
# asm 2: addu <x1e=$9,<x1e=$9,<x0e=$28
addu $9,$9,$28

# qhasm:   s04 = x04 << 7
# asm 1: sll >s04=int32#26,<x04=int32#21,7
# asm 2: sll >s04=$30,<x04=$22,7
sll $30,$22,7

# qhasm:   (uint32) x04 >>= 25
# asm 1: srl <x04=int32#21,<x04=int32#21,25
# asm 2: srl <x04=$22,<x04=$22,25
srl $22,$22,25

# qhasm:   x04 |= s04
# asm 1: or <x04=int32#21,<x04=int32#21,<s04=int32#26
# asm 2: or <x04=$22,<x04=$22,<s04=$30
or $22,$22,$30

# qhasm:   s06 = x06 << 7
# asm 1: sll >s06=int32#26,<x06=int32#23,7
# asm 2: sll >s06=$30,<x06=$24,7
sll $30,$24,7

# qhasm:   (uint32) x06 >>= 25
# asm 1: srl <x06=int32#23,<x06=int32#23,25
# asm 2: srl <x06=$24,<x06=$24,25
srl $24,$24,25

# qhasm:   x06 |= s06
# asm 1: or <x06=int32#23,<x06=int32#23,<s06=int32#26
# asm 2: or <x06=$24,<x06=$24,<s06=$30
or $24,$24,$30

# qhasm:   s0c = x0c << 7
# asm 1: sll >s0c=int32#26,<x0c=int32#19,7
# asm 2: sll >s0c=$30,<x0c=$20,7
sll $30,$20,7

# qhasm:   (uint32) x0c >>= 25
# asm 1: srl <x0c=int32#19,<x0c=int32#19,25
# asm 2: srl <x0c=$20,<x0c=$20,25
srl $20,$20,25

# qhasm:   x0c |= s0c
# asm 1: or <x0c=int32#19,<x0c=int32#19,<s0c=int32#26
# asm 2: or <x0c=$20,<x0c=$20,<s0c=$30
or $20,$20,$30

# qhasm:   s0e = x0e << 7
# asm 1: sll >s0e=int32#26,<x0e=int32#25,7
# asm 2: sll >s0e=$30,<x0e=$28,7
sll $30,$28,7

# qhasm:   (uint32) x0e >>= 25
# asm 1: srl <x0e=int32#25,<x0e=int32#25,25
# asm 2: srl <x0e=$28,<x0e=$28,25
srl $28,$28,25

# qhasm:   x0e |= s0e
# asm 1: or <x0e=int32#25,<x0e=int32#25,<s0e=int32#26
# asm 2: or <x0e=$28,<x0e=$28,<s0e=$30
or $28,$28,$30

# qhasm:   x04 ^= x1c
# asm 1: xor <x04=int32#21,<x04=int32#21,<x1c=int32#4
# asm 2: xor <x04=$22,<x04=$22,<x1c=$7
xor $22,$22,$7

# qhasm:   x06 ^= x1e
# asm 1: xor <x06=int32#23,<x06=int32#23,<x1e=int32#6
# asm 2: xor <x06=$24,<x06=$24,<x1e=$9
xor $24,$24,$9

# qhasm:   x0c ^= x14
# asm 1: xor <x0c=int32#19,<x0c=int32#19,<x14=int32#2
# asm 2: xor <x0c=$20,<x0c=$20,<x14=$5
xor $20,$20,$5

# qhasm:   x0e ^= x16
# asm 1: xor <x0e=int32#25,<x0e=int32#25,<x16=int32#3
# asm 2: xor <x0e=$28,<x0e=$28,<x16=$6
xor $28,$28,$6

# qhasm:           x0b = x0b_stack
# asm 1: lw >x0b=int32#26,<x0b_stack=stack32#12($sp)
# asm 2: lw >x0b=$30,<x0b_stack=44($sp)
lw $30,44($sp)

# qhasm:   x1e += x04
# asm 1: addu <x1e=int32#6,<x1e=int32#6,<x04=int32#21
# asm 2: addu <x1e=$9,<x1e=$9,<x04=$22
addu $9,$9,$22

# qhasm:   x1c += x06
# asm 1: addu <x1c=int32#4,<x1c=int32#4,<x06=int32#23
# asm 2: addu <x1c=$7,<x1c=$7,<x06=$24
addu $7,$7,$24

# qhasm:   x16 += x0c
# asm 1: addu <x16=int32#3,<x16=int32#3,<x0c=int32#19
# asm 2: addu <x16=$6,<x16=$6,<x0c=$20
addu $6,$6,$20

# qhasm:   x14 += x0e
# asm 1: addu <x14=int32#2,<x14=int32#2,<x0e=int32#25
# asm 2: addu <x14=$5,<x14=$5,<x0e=$28
addu $5,$5,$28

# qhasm:           x1e_stack = x1e
# asm 1: sw <x1e=int32#6,>x1e_stack=stack32#12($sp)
# asm 2: sw <x1e=$9,>x1e_stack=44($sp)
sw $9,44($sp)

# qhasm:   x11 += x01
# asm 1: addu <x11=int32#8,<x11=int32#8,<x01=int32#18
# asm 2: addu <x11=$11,<x11=$11,<x01=$19
addu $11,$11,$19

# qhasm:           x1c_stack = x1c
# asm 1: sw <x1c=int32#4,>x1c_stack=stack32#13($sp)
# asm 2: sw <x1c=$7,>x1c_stack=48($sp)
sw $7,48($sp)

# qhasm:   x13 += x03
# asm 1: addu <x13=int32#12,<x13=int32#12,<x03=int32#20
# asm 2: addu <x13=$13,<x13=$13,<x03=$21
addu $13,$13,$21

# qhasm:           x16_stack = x16
# asm 1: sw <x16=int32#3,>x16_stack=stack32#15($sp)
# asm 2: sw <x16=$6,>x16_stack=56($sp)
sw $6,56($sp)

# qhasm:   x19 += x09
# asm 1: addu <x19=int32#14,<x19=int32#14,<x09=int32#5
# asm 2: addu <x19=$15,<x19=$15,<x09=$8
addu $15,$15,$8

# qhasm:           x14_stack = x14
# asm 1: sw <x14=int32#2,>x14_stack=stack32#17($sp)
# asm 2: sw <x14=$5,>x14_stack=64($sp)
sw $5,64($sp)

# qhasm: 	  x0c_stack = x0c
# asm 1: sw <x0c=int32#19,>x0c_stack=stack32#19($sp)
# asm 2: sw <x0c=$20,>x0c_stack=72($sp)
sw $20,72($sp)

# qhasm: 	  x0e_stack = x0e
# asm 1: sw <x0e=int32#25,>x0e_stack=stack32#21($sp)
# asm 2: sw <x0e=$28,>x0e_stack=80($sp)
sw $28,80($sp)

# qhasm:   x1b += x0b
# asm 1: addu <x1b=int32#16,<x1b=int32#16,<x0b=int32#26
# asm 2: addu <x1b=$17,<x1b=$17,<x0b=$30
addu $17,$17,$30

# qhasm:   s01 = x01 << 7
# asm 1: sll >s01=int32#2,<x01=int32#18,7
# asm 2: sll >s01=$5,<x01=$19,7
sll $5,$19,7

# qhasm:   (uint32) x01 >>= 25
# asm 1: srl <x01=int32#18,<x01=int32#18,25
# asm 2: srl <x01=$19,<x01=$19,25
srl $19,$19,25

# qhasm:   x01 |= s01
# asm 1: or <x01=int32#18,<x01=int32#18,<s01=int32#2
# asm 2: or <x01=$19,<x01=$19,<s01=$5
or $19,$19,$5

# qhasm:   s03 = x03 << 7
# asm 1: sll >s03=int32#2,<x03=int32#20,7
# asm 2: sll >s03=$5,<x03=$21,7
sll $5,$21,7

# qhasm:   (uint32) x03 >>= 25
# asm 1: srl <x03=int32#20,<x03=int32#20,25
# asm 2: srl <x03=$21,<x03=$21,25
srl $21,$21,25

# qhasm:   x03 |= s03
# asm 1: or <x03=int32#20,<x03=int32#20,<s03=int32#2
# asm 2: or <x03=$21,<x03=$21,<s03=$5
or $21,$21,$5

# qhasm:   s09 = x09 << 7
# asm 1: sll >s09=int32#2,<x09=int32#5,7
# asm 2: sll >s09=$5,<x09=$8,7
sll $5,$8,7

# qhasm:   (uint32) x09 >>= 25
# asm 1: srl <x09=int32#5,<x09=int32#5,25
# asm 2: srl <x09=$8,<x09=$8,25
srl $8,$8,25

# qhasm:   x09 |= s09
# asm 1: or <x09=int32#5,<x09=int32#5,<s09=int32#2
# asm 2: or <x09=$8,<x09=$8,<s09=$5
or $8,$8,$5

# qhasm:   s0b = x0b << 7
# asm 1: sll >s0b=int32#2,<x0b=int32#26,7
# asm 2: sll >s0b=$5,<x0b=$30,7
sll $5,$30,7

# qhasm:   (uint32) x0b >>= 25
# asm 1: srl <x0b=int32#26,<x0b=int32#26,25
# asm 2: srl <x0b=$30,<x0b=$30,25
srl $30,$30,25

# qhasm:   x0b |= s0b
# asm 1: or <x0b=int32#26,<x0b=int32#26,<s0b=int32#2
# asm 2: or <x0b=$30,<x0b=$30,<s0b=$5
or $30,$30,$5

# qhasm:   x01 ^= x19
# asm 1: xor <x01=int32#18,<x01=int32#18,<x19=int32#14
# asm 2: xor <x01=$19,<x01=$19,<x19=$15
xor $19,$19,$15

# qhasm:   x03 ^= x1b
# asm 1: xor <x03=int32#20,<x03=int32#20,<x1b=int32#16
# asm 2: xor <x03=$21,<x03=$21,<x1b=$17
xor $21,$21,$17

# qhasm:   x09 ^= x11
# asm 1: xor <x09=int32#5,<x09=int32#5,<x11=int32#8
# asm 2: xor <x09=$8,<x09=$8,<x11=$11
xor $8,$8,$11

# qhasm:   x0b ^= x13
# asm 1: xor <x0b=int32#26,<x0b=int32#26,<x13=int32#12
# asm 2: xor <x0b=$30,<x0b=$30,<x13=$13
xor $30,$30,$13

# qhasm:           x15 = x15_stack
# asm 1: lw >x15=int32#2,<x15_stack=stack32#18($sp)
# asm 2: lw >x15=$5,<x15_stack=68($sp)
lw $5,68($sp)

# qhasm:   x1b += x01
# asm 1: addu <x1b=int32#16,<x1b=int32#16,<x01=int32#18
# asm 2: addu <x1b=$17,<x1b=$17,<x01=$19
addu $17,$17,$19

# qhasm:           x17 = x17_stack
# asm 1: lw >x17=int32#3,<x17_stack=stack32#20($sp)
# asm 2: lw >x17=$6,<x17_stack=76($sp)
lw $6,76($sp)

# qhasm:   x19 += x03
# asm 1: addu <x19=int32#14,<x19=int32#14,<x03=int32#20
# asm 2: addu <x19=$15,<x19=$15,<x03=$21
addu $15,$15,$21

# qhasm:           x1d = x1d_stack
# asm 1: lw >x1d=int32#4,<x1d_stack=stack32#22($sp)
# asm 2: lw >x1d=$7,<x1d_stack=84($sp)
lw $7,84($sp)

# qhasm:   x13 += x09
# asm 1: addu <x13=int32#12,<x13=int32#12,<x09=int32#5
# asm 2: addu <x13=$13,<x13=$13,<x09=$8
addu $13,$13,$8

# qhasm:           x1f = x1f_stack
# asm 1: lw >x1f=int32#6,<x1f_stack=stack32#24($sp)
# asm 2: lw >x1f=$9,<x1f_stack=92($sp)
lw $9,92($sp)

# qhasm:   x11 += x0b
# asm 1: addu <x11=int32#8,<x11=int32#8,<x0b=int32#26
# asm 2: addu <x11=$11,<x11=$11,<x0b=$30
addu $11,$11,$30

# qhasm:           x0b_stack = x0b
# asm 1: sw <x0b=int32#26,>x0b_stack=stack32#18($sp)
# asm 2: sw <x0b=$30,>x0b_stack=68($sp)
sw $30,68($sp)

# qhasm:           x0d_stack = x0d
# asm 1: sw <x0d=int32#9,>x0d_stack=stack32#30($sp)
# asm 2: sw <x0d=$2,>x0d_stack=116($sp)
sw $2,116($sp)

# qhasm:           x0f_stack = x0f
# asm 1: sw <x0f=int32#11,>x0f_stack=stack32#31($sp)
# asm 2: sw <x0f=$12,>x0f_stack=120($sp)
sw $12,120($sp)

# qhasm:   x15 += x05
# asm 1: addu <x15=int32#2,<x15=int32#2,<x05=int32#22
# asm 2: addu <x15=$5,<x15=$5,<x05=$23
addu $5,$5,$23

# qhasm:   x17 += x07
# asm 1: addu <x17=int32#3,<x17=int32#3,<x07=int32#24
# asm 2: addu <x17=$6,<x17=$6,<x07=$25
addu $6,$6,$25

# qhasm:   x1d += x0d
# asm 1: addu <x1d=int32#4,<x1d=int32#4,<x0d=int32#9
# asm 2: addu <x1d=$7,<x1d=$7,<x0d=$2
addu $7,$7,$2

# qhasm:   x1f += x0f
# asm 1: addu <x1f=int32#6,<x1f=int32#6,<x0f=int32#11
# asm 2: addu <x1f=$9,<x1f=$9,<x0f=$12
addu $9,$9,$12

# qhasm:   s05 = x05 << 7
# asm 1: sll >s05=int32#19,<x05=int32#22,7
# asm 2: sll >s05=$20,<x05=$23,7
sll $20,$23,7

# qhasm:   (uint32) x05 >>= 25
# asm 1: srl <x05=int32#22,<x05=int32#22,25
# asm 2: srl <x05=$23,<x05=$23,25
srl $23,$23,25

# qhasm:   x05 |= s05
# asm 1: or <x05=int32#22,<x05=int32#22,<s05=int32#19
# asm 2: or <x05=$23,<x05=$23,<s05=$20
or $23,$23,$20

# qhasm:   s07 = x07 << 7
# asm 1: sll >s07=int32#19,<x07=int32#24,7
# asm 2: sll >s07=$20,<x07=$25,7
sll $20,$25,7

# qhasm:   (uint32) x07 >>= 25
# asm 1: srl <x07=int32#24,<x07=int32#24,25
# asm 2: srl <x07=$25,<x07=$25,25
srl $25,$25,25

# qhasm:   x07 |= s07
# asm 1: or <x07=int32#24,<x07=int32#24,<s07=int32#19
# asm 2: or <x07=$25,<x07=$25,<s07=$20
or $25,$25,$20

# qhasm:   s0d = x0d << 7
# asm 1: sll >s0d=int32#19,<x0d=int32#9,7
# asm 2: sll >s0d=$20,<x0d=$2,7
sll $20,$2,7

# qhasm:   (uint32) x0d >>= 25
# asm 1: srl <x0d=int32#9,<x0d=int32#9,25
# asm 2: srl <x0d=$2,<x0d=$2,25
srl $2,$2,25

# qhasm:   x0d |= s0d
# asm 1: or <x0d=int32#9,<x0d=int32#9,<s0d=int32#19
# asm 2: or <x0d=$2,<x0d=$2,<s0d=$20
or $2,$2,$20

# qhasm:   s0f = x0f << 7
# asm 1: sll >s0f=int32#19,<x0f=int32#11,7
# asm 2: sll >s0f=$20,<x0f=$12,7
sll $20,$12,7

# qhasm:   (uint32) x0f >>= 25
# asm 1: srl <x0f=int32#11,<x0f=int32#11,25
# asm 2: srl <x0f=$12,<x0f=$12,25
srl $12,$12,25

# qhasm:   x0f |= s0f
# asm 1: or <x0f=int32#11,<x0f=int32#11,<s0f=int32#19
# asm 2: or <x0f=$12,<x0f=$12,<s0f=$20
or $12,$12,$20

# qhasm:   x05 ^= x1d
# asm 1: xor <x05=int32#22,<x05=int32#22,<x1d=int32#4
# asm 2: xor <x05=$23,<x05=$23,<x1d=$7
xor $23,$23,$7

# qhasm:   x07 ^= x1f
# asm 1: xor <x07=int32#24,<x07=int32#24,<x1f=int32#6
# asm 2: xor <x07=$25,<x07=$25,<x1f=$9
xor $25,$25,$9

# qhasm:   x0d ^= x15
# asm 1: xor <x0d=int32#9,<x0d=int32#9,<x15=int32#2
# asm 2: xor <x0d=$2,<x0d=$2,<x15=$5
xor $2,$2,$5

# qhasm:   x0f ^= x17
# asm 1: xor <x0f=int32#11,<x0f=int32#11,<x17=int32#3
# asm 2: xor <x0f=$12,<x0f=$12,<x17=$6
xor $12,$12,$6

# qhasm:   x1f += x05
# asm 1: addu <x1f=int32#6,<x1f=int32#6,<x05=int32#22
# asm 2: addu <x1f=$9,<x1f=$9,<x05=$23
addu $9,$9,$23

# qhasm:   x1d += x07
# asm 1: addu <x1d=int32#4,<x1d=int32#4,<x07=int32#24
# asm 2: addu <x1d=$7,<x1d=$7,<x07=$25
addu $7,$7,$25

# qhasm:   x17 += x0d
# asm 1: addu <x17=int32#3,<x17=int32#3,<x0d=int32#9
# asm 2: addu <x17=$6,<x17=$6,<x0d=$2
addu $6,$6,$2

# qhasm:   x15 += x0f
# asm 1: addu <x15=int32#2,<x15=int32#2,<x0f=int32#11
# asm 2: addu <x15=$5,<x15=$5,<x0f=$12
addu $5,$5,$12

# qhasm:           x1e = x1e_stack
# asm 1: lw >x1e=int32#19,<x1e_stack=stack32#12($sp)
# asm 2: lw >x1e=$20,<x1e_stack=44($sp)
lw $20,44($sp)

# qhasm: 	  x0d_stack = x0d
# asm 1: sw <x0d=int32#9,>x0d_stack=stack32#12($sp)
# asm 2: sw <x0d=$2,>x0d_stack=44($sp)
sw $2,44($sp)

# qhasm: 	  x0f_stack = x0f
# asm 1: sw <x0f=int32#11,>x0f_stack=stack32#20($sp)
# asm 2: sw <x0f=$12,>x0f_stack=76($sp)
sw $12,76($sp)

# qhasm:   s00 = x00 << 11
# asm 1: sll >s00=int32#9,<x00=int32#17,11
# asm 2: sll >s00=$2,<x00=$18,11
sll $2,$18,11

# qhasm:   (uint32) x00 >>= 21
# asm 1: srl <x00=int32#17,<x00=int32#17,21
# asm 2: srl <x00=$18,<x00=$18,21
srl $18,$18,21

# qhasm:   x00 |= s00
# asm 1: or <x00=int32#17,<x00=int32#17,<s00=int32#9
# asm 2: or <x00=$18,<x00=$18,<s00=$2
or $18,$18,$2

# qhasm:           x16 = x16_stack
# asm 1: lw >x16=int32#9,<x16_stack=stack32#15($sp)
# asm 2: lw >x16=$2,<x16_stack=56($sp)
lw $2,56($sp)

# qhasm:   s01 = x01 << 11
# asm 1: sll >s01=int32#11,<x01=int32#18,11
# asm 2: sll >s01=$12,<x01=$19,11
sll $12,$19,11

# qhasm:   (uint32) x01 >>= 21
# asm 1: srl <x01=int32#18,<x01=int32#18,21
# asm 2: srl <x01=$19,<x01=$19,21
srl $19,$19,21

# qhasm:   x01 |= s01
# asm 1: or <x01=int32#18,<x01=int32#18,<s01=int32#11
# asm 2: or <x01=$19,<x01=$19,<s01=$12
or $19,$19,$12

# qhasm:           x15_stack = x15
# asm 1: sw <x15=int32#2,>x15_stack=stack32#15($sp)
# asm 2: sw <x15=$5,>x15_stack=56($sp)
sw $5,56($sp)

# qhasm:   s08 = x08 << 11
# asm 1: sll >s08=int32#2,<x08=int32#1,11
# asm 2: sll >s08=$5,<x08=$4,11
sll $5,$4,11

# qhasm:   (uint32) x08 >>= 21
# asm 1: srl <x08=int32#1,<x08=int32#1,21
# asm 2: srl <x08=$4,<x08=$4,21
srl $4,$4,21

# qhasm:   x08 |= s08
# asm 1: or <x08=int32#1,<x08=int32#1,<s08=int32#2
# asm 2: or <x08=$4,<x08=$4,<s08=$5
or $4,$4,$5

# qhasm:           x1d_stack = x1d
# asm 1: sw <x1d=int32#4,>x1d_stack=stack32#22($sp)
# asm 2: sw <x1d=$7,>x1d_stack=84($sp)
sw $7,84($sp)

# qhasm:   s09 = x09 << 11
# asm 1: sll >s09=int32#2,<x09=int32#5,11
# asm 2: sll >s09=$5,<x09=$8,11
sll $5,$8,11

# qhasm:   (uint32) x09 >>= 21
# asm 1: srl <x09=int32#5,<x09=int32#5,21
# asm 2: srl <x09=$8,<x09=$8,21
srl $8,$8,21

# qhasm:   x09 |= s09
# asm 1: or <x09=int32#5,<x09=int32#5,<s09=int32#2
# asm 2: or <x09=$8,<x09=$8,<s09=$5
or $8,$8,$5

# qhasm:   x00 ^= x1e
# asm 1: xor <x00=int32#17,<x00=int32#17,<x1e=int32#19
# asm 2: xor <x00=$18,<x00=$18,<x1e=$20
xor $18,$18,$20

# qhasm:   x01 ^= x1f
# asm 1: xor <x01=int32#18,<x01=int32#18,<x1f=int32#6
# asm 2: xor <x01=$19,<x01=$19,<x1f=$9
xor $19,$19,$9

# qhasm:   x08 ^= x16
# asm 1: xor <x08=int32#1,<x08=int32#1,<x16=int32#9
# asm 2: xor <x08=$4,<x08=$4,<x16=$2
xor $4,$4,$2

# qhasm:   x09 ^= x17
# asm 1: xor <x09=int32#5,<x09=int32#5,<x17=int32#3
# asm 2: xor <x09=$8,<x09=$8,<x17=$6
xor $8,$8,$6

# qhasm:   x1f += x00
# asm 1: addu <x1f=int32#6,<x1f=int32#6,<x00=int32#17
# asm 2: addu <x1f=$9,<x1f=$9,<x00=$18
addu $9,$9,$18

# qhasm:   x1e += x01
# asm 1: addu <x1e=int32#19,<x1e=int32#19,<x01=int32#18
# asm 2: addu <x1e=$20,<x1e=$20,<x01=$19
addu $20,$20,$19

# qhasm:   x17 += x08
# asm 1: addu <x17=int32#3,<x17=int32#3,<x08=int32#1
# asm 2: addu <x17=$6,<x17=$6,<x08=$4
addu $6,$6,$4

# qhasm:   x16 += x09
# asm 1: addu <x16=int32#9,<x16=int32#9,<x09=int32#5
# asm 2: addu <x16=$2,<x16=$2,<x09=$8
addu $2,$2,$8

# qhasm:   s00 = x00 << 7
# asm 1: sll >s00=int32#2,<x00=int32#17,7
# asm 2: sll >s00=$5,<x00=$18,7
sll $5,$18,7

# qhasm:   (uint32) x00 >>= 25
# asm 1: srl <x00=int32#17,<x00=int32#17,25
# asm 2: srl <x00=$18,<x00=$18,25
srl $18,$18,25

# qhasm:   x00 |= s00
# asm 1: or <x00=int32#17,<x00=int32#17,<s00=int32#2
# asm 2: or <x00=$18,<x00=$18,<s00=$5
or $18,$18,$5

# qhasm:           x1f_stack = x1f
# asm 1: sw <x1f=int32#6,>x1f_stack=stack32#23($sp)
# asm 2: sw <x1f=$9,>x1f_stack=88($sp)
sw $9,88($sp)

# qhasm:   s01 = x01 << 7
# asm 1: sll >s01=int32#2,<x01=int32#18,7
# asm 2: sll >s01=$5,<x01=$19,7
sll $5,$19,7

# qhasm:   (uint32) x01 >>= 25
# asm 1: srl <x01=int32#18,<x01=int32#18,25
# asm 2: srl <x01=$19,<x01=$19,25
srl $19,$19,25

# qhasm:   x01 |= s01
# asm 1: or <x01=int32#18,<x01=int32#18,<s01=int32#2
# asm 2: or <x01=$19,<x01=$19,<s01=$5
or $19,$19,$5

# qhasm:           x1e_stack = x1e
# asm 1: sw <x1e=int32#19,>x1e_stack=stack32#24($sp)
# asm 2: sw <x1e=$20,>x1e_stack=92($sp)
sw $20,92($sp)

# qhasm:   s08 = x08 << 7
# asm 1: sll >s08=int32#2,<x08=int32#1,7
# asm 2: sll >s08=$5,<x08=$4,7
sll $5,$4,7

# qhasm:   (uint32) x08 >>= 25
# asm 1: srl <x08=int32#1,<x08=int32#1,25
# asm 2: srl <x08=$4,<x08=$4,25
srl $4,$4,25

# qhasm:   x08 |= s08
# asm 1: or <x08=int32#1,<x08=int32#1,<s08=int32#2
# asm 2: or <x08=$4,<x08=$4,<s08=$5
or $4,$4,$5

# qhasm:           x17_stack = x17
# asm 1: sw <x17=int32#3,>x17_stack=stack32#32($sp)
# asm 2: sw <x17=$6,>x17_stack=124($sp)
sw $6,124($sp)

# qhasm:   s09 = x09 << 7
# asm 1: sll >s09=int32#2,<x09=int32#5,7
# asm 2: sll >s09=$5,<x09=$8,7
sll $5,$8,7

# qhasm:   (uint32) x09 >>= 25
# asm 1: srl <x09=int32#5,<x09=int32#5,25
# asm 2: srl <x09=$8,<x09=$8,25
srl $8,$8,25

# qhasm:   x09 |= s09
# asm 1: or <x09=int32#5,<x09=int32#5,<s09=int32#2
# asm 2: or <x09=$8,<x09=$8,<s09=$5
or $8,$8,$5

# qhasm:           x16_stack = x16
# asm 1: sw <x16=int32#9,>x16_stack=stack32#33($sp)
# asm 2: sw <x16=$2,>x16_stack=128($sp)
sw $2,128($sp)

# qhasm:   x00 ^= x17
# asm 1: xor <x00=int32#17,<x00=int32#17,<x17=int32#3
# asm 2: xor <x00=$18,<x00=$18,<x17=$6
xor $18,$18,$6

# qhasm:           x02 = x02_stack
# asm 1: lw >x02=int32#2,<x02_stack=stack32#14($sp)
# asm 2: lw >x02=$5,<x02_stack=52($sp)
lw $5,52($sp)

# qhasm:   x01 ^= x16
# asm 1: xor <x01=int32#18,<x01=int32#18,<x16=int32#9
# asm 2: xor <x01=$19,<x01=$19,<x16=$2
xor $19,$19,$2

# qhasm:           x0a = x0a_stack
# asm 1: lw >x0a=int32#3,<x0a_stack=stack32#16($sp)
# asm 2: lw >x0a=$6,<x0a_stack=60($sp)
lw $6,60($sp)

# qhasm:   x08 ^= x1f
# asm 1: xor <x08=int32#1,<x08=int32#1,<x1f=int32#6
# asm 2: xor <x08=$4,<x08=$4,<x1f=$9
xor $4,$4,$9

# qhasm:           x0b = x0b_stack
# asm 1: lw >x0b=int32#4,<x0b_stack=stack32#18($sp)
# asm 2: lw >x0b=$7,<x0b_stack=68($sp)
lw $7,68($sp)

# qhasm:   x09 ^= x1e
# asm 1: xor <x09=int32#5,<x09=int32#5,<x1e=int32#19
# asm 2: xor <x09=$8,<x09=$8,<x1e=$20
xor $8,$8,$20

# qhasm:           x1c = x1c_stack
# asm 1: lw >x1c=int32#6,<x1c_stack=stack32#13($sp)
# asm 2: lw >x1c=$9,<x1c_stack=48($sp)
lw $9,48($sp)

# qhasm:   s02 = x02 << 11
# asm 1: sll >s02=int32#9,<x02=int32#2,11
# asm 2: sll >s02=$2,<x02=$5,11
sll $2,$5,11

# qhasm:   (uint32) x02 >>= 21
# asm 1: srl <x02=int32#2,<x02=int32#2,21
# asm 2: srl <x02=$5,<x02=$5,21
srl $5,$5,21

# qhasm:   x02 |= s02
# asm 1: or <x02=int32#2,<x02=int32#2,<s02=int32#9
# asm 2: or <x02=$5,<x02=$5,<s02=$2
or $5,$5,$2

# qhasm:           x1d = x1d_stack
# asm 1: lw >x1d=int32#9,<x1d_stack=stack32#22($sp)
# asm 2: lw >x1d=$2,<x1d_stack=84($sp)
lw $2,84($sp)

# qhasm:   s03 = x03 << 11
# asm 1: sll >s03=int32#11,<x03=int32#20,11
# asm 2: sll >s03=$12,<x03=$21,11
sll $12,$21,11

# qhasm:   (uint32) x03 >>= 21
# asm 1: srl <x03=int32#20,<x03=int32#20,21
# asm 2: srl <x03=$21,<x03=$21,21
srl $21,$21,21

# qhasm:   x03 |= s03
# asm 1: or <x03=int32#20,<x03=int32#20,<s03=int32#11
# asm 2: or <x03=$21,<x03=$21,<s03=$12
or $21,$21,$12

# qhasm:           x14 = x14_stack
# asm 1: lw >x14=int32#11,<x14_stack=stack32#17($sp)
# asm 2: lw >x14=$12,<x14_stack=64($sp)
lw $12,64($sp)

# qhasm:   s0a = x0a << 11
# asm 1: sll >s0a=int32#19,<x0a=int32#3,11
# asm 2: sll >s0a=$20,<x0a=$6,11
sll $20,$6,11

# qhasm:   (uint32) x0a >>= 21
# asm 1: srl <x0a=int32#3,<x0a=int32#3,21
# asm 2: srl <x0a=$6,<x0a=$6,21
srl $6,$6,21

# qhasm:   x0a |= s0a
# asm 1: or <x0a=int32#3,<x0a=int32#3,<s0a=int32#19
# asm 2: or <x0a=$6,<x0a=$6,<s0a=$20
or $6,$6,$20

# qhasm:           x15 = x15_stack
# asm 1: lw >x15=int32#19,<x15_stack=stack32#15($sp)
# asm 2: lw >x15=$20,<x15_stack=56($sp)
lw $20,56($sp)

# qhasm:   s0b = x0b << 11
# asm 1: sll >s0b=int32#25,<x0b=int32#4,11
# asm 2: sll >s0b=$28,<x0b=$7,11
sll $28,$7,11

# qhasm:   (uint32) x0b >>= 21
# asm 1: srl <x0b=int32#4,<x0b=int32#4,21
# asm 2: srl <x0b=$7,<x0b=$7,21
srl $7,$7,21

# qhasm:   x0b |= s0b
# asm 1: or <x0b=int32#4,<x0b=int32#4,<s0b=int32#25
# asm 2: or <x0b=$7,<x0b=$7,<s0b=$28
or $7,$7,$28

# qhasm:   x02 ^= x1c
# asm 1: xor <x02=int32#2,<x02=int32#2,<x1c=int32#6
# asm 2: xor <x02=$5,<x02=$5,<x1c=$9
xor $5,$5,$9

# qhasm:   x03 ^= x1d
# asm 1: xor <x03=int32#20,<x03=int32#20,<x1d=int32#9
# asm 2: xor <x03=$21,<x03=$21,<x1d=$2
xor $21,$21,$2

# qhasm:   x0a ^= x14
# asm 1: xor <x0a=int32#3,<x0a=int32#3,<x14=int32#11
# asm 2: xor <x0a=$6,<x0a=$6,<x14=$12
xor $6,$6,$12

# qhasm:   x0b ^= x15
# asm 1: xor <x0b=int32#4,<x0b=int32#4,<x15=int32#19
# asm 2: xor <x0b=$7,<x0b=$7,<x15=$20
xor $7,$7,$20

# qhasm:   x1d += x02
# asm 1: addu <x1d=int32#9,<x1d=int32#9,<x02=int32#2
# asm 2: addu <x1d=$2,<x1d=$2,<x02=$5
addu $2,$2,$5

# qhasm:   x1c += x03
# asm 1: addu <x1c=int32#6,<x1c=int32#6,<x03=int32#20
# asm 2: addu <x1c=$9,<x1c=$9,<x03=$21
addu $9,$9,$21

# qhasm:   x15 += x0a
# asm 1: addu <x15=int32#19,<x15=int32#19,<x0a=int32#3
# asm 2: addu <x15=$20,<x15=$20,<x0a=$6
addu $20,$20,$6

# qhasm:   x14 += x0b
# asm 1: addu <x14=int32#11,<x14=int32#11,<x0b=int32#4
# asm 2: addu <x14=$12,<x14=$12,<x0b=$7
addu $12,$12,$7

# qhasm:           x1d_stack = x1d
# asm 1: sw <x1d=int32#9,>x1d_stack=stack32#13($sp)
# asm 2: sw <x1d=$2,>x1d_stack=48($sp)
sw $2,48($sp)

# qhasm:   s02 = x02 << 7
# asm 1: sll >s02=int32#25,<x02=int32#2,7
# asm 2: sll >s02=$28,<x02=$5,7
sll $28,$5,7

# qhasm:   (uint32) x02 >>= 25
# asm 1: srl <x02=int32#2,<x02=int32#2,25
# asm 2: srl <x02=$5,<x02=$5,25
srl $5,$5,25

# qhasm:   x02 |= s02
# asm 1: or <x02=int32#2,<x02=int32#2,<s02=int32#25
# asm 2: or <x02=$5,<x02=$5,<s02=$28
or $5,$5,$28

# qhasm:           x1c_stack = x1c
# asm 1: sw <x1c=int32#6,>x1c_stack=stack32#14($sp)
# asm 2: sw <x1c=$9,>x1c_stack=52($sp)
sw $9,52($sp)

# qhasm:   s03 = x03 << 7
# asm 1: sll >s03=int32#25,<x03=int32#20,7
# asm 2: sll >s03=$28,<x03=$21,7
sll $28,$21,7

# qhasm:   (uint32) x03 >>= 25
# asm 1: srl <x03=int32#20,<x03=int32#20,25
# asm 2: srl <x03=$21,<x03=$21,25
srl $21,$21,25

# qhasm:   x03 |= s03
# asm 1: or <x03=int32#20,<x03=int32#20,<s03=int32#25
# asm 2: or <x03=$21,<x03=$21,<s03=$28
or $21,$21,$28

# qhasm:           x15_stack = x15
# asm 1: sw <x15=int32#19,>x15_stack=stack32#15($sp)
# asm 2: sw <x15=$20,>x15_stack=56($sp)
sw $20,56($sp)

# qhasm:   s0a = x0a << 7
# asm 1: sll >s0a=int32#25,<x0a=int32#3,7
# asm 2: sll >s0a=$28,<x0a=$6,7
sll $28,$6,7

# qhasm:   (uint32) x0a >>= 25
# asm 1: srl <x0a=int32#3,<x0a=int32#3,25
# asm 2: srl <x0a=$6,<x0a=$6,25
srl $6,$6,25

# qhasm:   x0a |= s0a
# asm 1: or <x0a=int32#3,<x0a=int32#3,<s0a=int32#25
# asm 2: or <x0a=$6,<x0a=$6,<s0a=$28
or $6,$6,$28

# qhasm:           x14_stack = x14
# asm 1: sw <x14=int32#11,>x14_stack=stack32#16($sp)
# asm 2: sw <x14=$12,>x14_stack=60($sp)
sw $12,60($sp)

# qhasm:   s0b = x0b << 7
# asm 1: sll >s0b=int32#25,<x0b=int32#4,7
# asm 2: sll >s0b=$28,<x0b=$7,7
sll $28,$7,7

# qhasm:   (uint32) x0b >>= 25
# asm 1: srl <x0b=int32#4,<x0b=int32#4,25
# asm 2: srl <x0b=$7,<x0b=$7,25
srl $7,$7,25

# qhasm:   x0b |= s0b
# asm 1: or <x0b=int32#4,<x0b=int32#4,<s0b=int32#25
# asm 2: or <x0b=$7,<x0b=$7,<s0b=$28
or $7,$7,$28

# qhasm:   x02 ^= x15
# asm 1: xor <x02=int32#2,<x02=int32#2,<x15=int32#19
# asm 2: xor <x02=$5,<x02=$5,<x15=$20
xor $5,$5,$20

# qhasm:   x03 ^= x14
# asm 1: xor <x03=int32#20,<x03=int32#20,<x14=int32#11
# asm 2: xor <x03=$21,<x03=$21,<x14=$12
xor $21,$21,$12

# qhasm:   x0a ^= x1d
# asm 1: xor <x0a=int32#3,<x0a=int32#3,<x1d=int32#9
# asm 2: xor <x0a=$6,<x0a=$6,<x1d=$2
xor $6,$6,$2

# qhasm: 	  x0c = x0c_stack
# asm 1: lw >x0c=int32#9,<x0c_stack=stack32#19($sp)
# asm 2: lw >x0c=$2,<x0c_stack=72($sp)
lw $2,72($sp)

# qhasm: 	  x0d = x0d_stack
# asm 1: lw >x0d=int32#11,<x0d_stack=stack32#12($sp)
# asm 2: lw >x0d=$12,<x0d_stack=44($sp)
lw $12,44($sp)

# qhasm:   x0b ^= x1c
# asm 1: xor <x0b=int32#4,<x0b=int32#4,<x1c=int32#6
# asm 2: xor <x0b=$7,<x0b=$7,<x1c=$9
xor $7,$7,$9

# qhasm:           x02_stack = x02
# asm 1: sw <x02=int32#2,>x02_stack=stack32#12($sp)
# asm 2: sw <x02=$5,>x02_stack=44($sp)
sw $5,44($sp)

# qhasm:   s04 = x04 << 11
# asm 1: sll >s04=int32#2,<x04=int32#21,11
# asm 2: sll >s04=$5,<x04=$22,11
sll $5,$22,11

# qhasm:   (uint32) x04 >>= 21
# asm 1: srl <x04=int32#21,<x04=int32#21,21
# asm 2: srl <x04=$22,<x04=$22,21
srl $22,$22,21

# qhasm:   x04 |= s04
# asm 1: or <x04=int32#21,<x04=int32#21,<s04=int32#2
# asm 2: or <x04=$22,<x04=$22,<s04=$5
or $22,$22,$5

# qhasm:           x0a_stack = x0a
# asm 1: sw <x0a=int32#3,>x0a_stack=stack32#19($sp)
# asm 2: sw <x0a=$6,>x0a_stack=72($sp)
sw $6,72($sp)

# qhasm:   s05 = x05 << 11
# asm 1: sll >s05=int32#2,<x05=int32#22,11
# asm 2: sll >s05=$5,<x05=$23,11
sll $5,$23,11

# qhasm:   (uint32) x05 >>= 21
# asm 1: srl <x05=int32#22,<x05=int32#22,21
# asm 2: srl <x05=$23,<x05=$23,21
srl $23,$23,21

# qhasm:   x05 |= s05
# asm 1: or <x05=int32#22,<x05=int32#22,<s05=int32#2
# asm 2: or <x05=$23,<x05=$23,<s05=$5
or $23,$23,$5

# qhasm:           x0b_stack = x0b
# asm 1: sw <x0b=int32#4,>x0b_stack=stack32#34($sp)
# asm 2: sw <x0b=$7,>x0b_stack=132($sp)
sw $7,132($sp)

# qhasm:   s0c = x0c << 11
# asm 1: sll >s0c=int32#2,<x0c=int32#9,11
# asm 2: sll >s0c=$5,<x0c=$2,11
sll $5,$2,11

# qhasm:   (uint32) x0c >>= 21
# asm 1: srl <x0c=int32#9,<x0c=int32#9,21
# asm 2: srl <x0c=$2,<x0c=$2,21
srl $2,$2,21

# qhasm:   x0c |= s0c
# asm 1: or <x0c=int32#9,<x0c=int32#9,<s0c=int32#2
# asm 2: or <x0c=$2,<x0c=$2,<s0c=$5
or $2,$2,$5

# qhasm:   s0d = x0d << 11
# asm 1: sll >s0d=int32#2,<x0d=int32#11,11
# asm 2: sll >s0d=$5,<x0d=$12,11
sll $5,$12,11

# qhasm:   (uint32) x0d >>= 21
# asm 1: srl <x0d=int32#11,<x0d=int32#11,21
# asm 2: srl <x0d=$12,<x0d=$12,21
srl $12,$12,21

# qhasm:   x0d |= s0d
# asm 1: or <x0d=int32#11,<x0d=int32#11,<s0d=int32#2
# asm 2: or <x0d=$12,<x0d=$12,<s0d=$5
or $12,$12,$5

# qhasm:   x04 ^= x1a
# asm 1: xor <x04=int32#21,<x04=int32#21,<x1a=int32#15
# asm 2: xor <x04=$22,<x04=$22,<x1a=$16
xor $22,$22,$16

# qhasm:   x05 ^= x1b
# asm 1: xor <x05=int32#22,<x05=int32#22,<x1b=int32#16
# asm 2: xor <x05=$23,<x05=$23,<x1b=$17
xor $23,$23,$17

# qhasm:   x0c ^= x12
# asm 1: xor <x0c=int32#9,<x0c=int32#9,<x12=int32#10
# asm 2: xor <x0c=$2,<x0c=$2,<x12=$3
xor $2,$2,$3

# qhasm:   x0d ^= x13
# asm 1: xor <x0d=int32#11,<x0d=int32#11,<x13=int32#12
# asm 2: xor <x0d=$12,<x0d=$12,<x13=$13
xor $12,$12,$13

# qhasm:   x1b += x04
# asm 1: addu <x1b=int32#16,<x1b=int32#16,<x04=int32#21
# asm 2: addu <x1b=$17,<x1b=$17,<x04=$22
addu $17,$17,$22

# qhasm:   x1a += x05
# asm 1: addu <x1a=int32#15,<x1a=int32#15,<x05=int32#22
# asm 2: addu <x1a=$16,<x1a=$16,<x05=$23
addu $16,$16,$23

# qhasm:   x13 += x0c
# asm 1: addu <x13=int32#12,<x13=int32#12,<x0c=int32#9
# asm 2: addu <x13=$13,<x13=$13,<x0c=$2
addu $13,$13,$2

# qhasm:   x12 += x0d
# asm 1: addu <x12=int32#10,<x12=int32#10,<x0d=int32#11
# asm 2: addu <x12=$3,<x12=$3,<x0d=$12
addu $3,$3,$12

# qhasm:   s04 = x04 << 7
# asm 1: sll >s04=int32#2,<x04=int32#21,7
# asm 2: sll >s04=$5,<x04=$22,7
sll $5,$22,7

# qhasm:   (uint32) x04 >>= 25
# asm 1: srl <x04=int32#21,<x04=int32#21,25
# asm 2: srl <x04=$22,<x04=$22,25
srl $22,$22,25

# qhasm:   x04 |= s04
# asm 1: or <x04=int32#21,<x04=int32#21,<s04=int32#2
# asm 2: or <x04=$22,<x04=$22,<s04=$5
or $22,$22,$5

# qhasm:   s05 = x05 << 7
# asm 1: sll >s05=int32#2,<x05=int32#22,7
# asm 2: sll >s05=$5,<x05=$23,7
sll $5,$23,7

# qhasm:   (uint32) x05 >>= 25
# asm 1: srl <x05=int32#22,<x05=int32#22,25
# asm 2: srl <x05=$23,<x05=$23,25
srl $23,$23,25

# qhasm:   x05 |= s05
# asm 1: or <x05=int32#22,<x05=int32#22,<s05=int32#2
# asm 2: or <x05=$23,<x05=$23,<s05=$5
or $23,$23,$5

# qhasm:   s0c = x0c << 7
# asm 1: sll >s0c=int32#2,<x0c=int32#9,7
# asm 2: sll >s0c=$5,<x0c=$2,7
sll $5,$2,7

# qhasm:   (uint32) x0c >>= 25
# asm 1: srl <x0c=int32#9,<x0c=int32#9,25
# asm 2: srl <x0c=$2,<x0c=$2,25
srl $2,$2,25

# qhasm:   x0c |= s0c
# asm 1: or <x0c=int32#9,<x0c=int32#9,<s0c=int32#2
# asm 2: or <x0c=$2,<x0c=$2,<s0c=$5
or $2,$2,$5

# qhasm:   s0d = x0d << 7
# asm 1: sll >s0d=int32#2,<x0d=int32#11,7
# asm 2: sll >s0d=$5,<x0d=$12,7
sll $5,$12,7

# qhasm:   (uint32) x0d >>= 25
# asm 1: srl <x0d=int32#11,<x0d=int32#11,25
# asm 2: srl <x0d=$12,<x0d=$12,25
srl $12,$12,25

# qhasm:   x0d |= s0d
# asm 1: or <x0d=int32#11,<x0d=int32#11,<s0d=int32#2
# asm 2: or <x0d=$12,<x0d=$12,<s0d=$5
or $12,$12,$5

# qhasm:   x04 ^= x13
# asm 1: xor <x04=int32#21,<x04=int32#21,<x13=int32#12
# asm 2: xor <x04=$22,<x04=$22,<x13=$13
xor $22,$22,$13

# qhasm:   x05 ^= x12
# asm 1: xor <x05=int32#22,<x05=int32#22,<x12=int32#10
# asm 2: xor <x05=$23,<x05=$23,<x12=$3
xor $23,$23,$3

# qhasm:   x0c ^= x1b
# asm 1: xor <x0c=int32#9,<x0c=int32#9,<x1b=int32#16
# asm 2: xor <x0c=$2,<x0c=$2,<x1b=$17
xor $2,$2,$17

# qhasm:   x0d ^= x1a
# asm 1: xor <x0d=int32#11,<x0d=int32#11,<x1a=int32#15
# asm 2: xor <x0d=$12,<x0d=$12,<x1a=$16
xor $12,$12,$16

# qhasm:           x0c_stack = x0c
# asm 1: sw <x0c=int32#9,>x0c_stack=stack32#17($sp)
# asm 2: sw <x0c=$2,>x0c_stack=64($sp)
sw $2,64($sp)

# qhasm:           x0d_stack = x0d
# asm 1: sw <x0d=int32#11,>x0d_stack=stack32#18($sp)
# asm 2: sw <x0d=$12,>x0d_stack=68($sp)
sw $12,68($sp)

# qhasm: 	  x0e = x0e_stack
# asm 1: lw >x0e=int32#2,<x0e_stack=stack32#21($sp)
# asm 2: lw >x0e=$5,<x0e_stack=80($sp)
lw $5,80($sp)

# qhasm: 	  x0f = x0f_stack
# asm 1: lw >x0f=int32#3,<x0f_stack=stack32#20($sp)
# asm 2: lw >x0f=$6,<x0f_stack=76($sp)
lw $6,76($sp)

# qhasm:   s06 = x06 << 11
# asm 1: sll >s06=int32#4,<x06=int32#23,11
# asm 2: sll >s06=$7,<x06=$24,11
sll $7,$24,11

# qhasm:   (uint32) x06 >>= 21
# asm 1: srl <x06=int32#23,<x06=int32#23,21
# asm 2: srl <x06=$24,<x06=$24,21
srl $24,$24,21

# qhasm:   x06 |= s06
# asm 1: or <x06=int32#23,<x06=int32#23,<s06=int32#4
# asm 2: or <x06=$24,<x06=$24,<s06=$7
or $24,$24,$7

# qhasm:   s07 = x07 << 11
# asm 1: sll >s07=int32#4,<x07=int32#24,11
# asm 2: sll >s07=$7,<x07=$25,11
sll $7,$25,11

# qhasm:   (uint32) x07 >>= 21
# asm 1: srl <x07=int32#24,<x07=int32#24,21
# asm 2: srl <x07=$25,<x07=$25,21
srl $25,$25,21

# qhasm:   x07 |= s07
# asm 1: or <x07=int32#24,<x07=int32#24,<s07=int32#4
# asm 2: or <x07=$25,<x07=$25,<s07=$7
or $25,$25,$7

# qhasm:   s0e = x0e << 11
# asm 1: sll >s0e=int32#4,<x0e=int32#2,11
# asm 2: sll >s0e=$7,<x0e=$5,11
sll $7,$5,11

# qhasm:   (uint32) x0e >>= 21
# asm 1: srl <x0e=int32#2,<x0e=int32#2,21
# asm 2: srl <x0e=$5,<x0e=$5,21
srl $5,$5,21

# qhasm:   x0e |= s0e
# asm 1: or <x0e=int32#2,<x0e=int32#2,<s0e=int32#4
# asm 2: or <x0e=$5,<x0e=$5,<s0e=$7
or $5,$5,$7

# qhasm:   s0f = x0f << 11
# asm 1: sll >s0f=int32#4,<x0f=int32#3,11
# asm 2: sll >s0f=$7,<x0f=$6,11
sll $7,$6,11

# qhasm:   (uint32) x0f >>= 21
# asm 1: srl <x0f=int32#3,<x0f=int32#3,21
# asm 2: srl <x0f=$6,<x0f=$6,21
srl $6,$6,21

# qhasm:   x0f |= s0f
# asm 1: or <x0f=int32#3,<x0f=int32#3,<s0f=int32#4
# asm 2: or <x0f=$6,<x0f=$6,<s0f=$7
or $6,$6,$7

# qhasm:   x06 ^= x18
# asm 1: xor <x06=int32#23,<x06=int32#23,<x18=int32#13
# asm 2: xor <x06=$24,<x06=$24,<x18=$14
xor $24,$24,$14

# qhasm:   x07 ^= x19
# asm 1: xor <x07=int32#24,<x07=int32#24,<x19=int32#14
# asm 2: xor <x07=$25,<x07=$25,<x19=$15
xor $25,$25,$15

# qhasm:   x0e ^= x10
# asm 1: xor <x0e=int32#2,<x0e=int32#2,<x10=int32#7
# asm 2: xor <x0e=$5,<x0e=$5,<x10=$10
xor $5,$5,$10

# qhasm:   x0f ^= x11
# asm 1: xor <x0f=int32#3,<x0f=int32#3,<x11=int32#8
# asm 2: xor <x0f=$6,<x0f=$6,<x11=$11
xor $6,$6,$11

# qhasm:   x19 += x06
# asm 1: addu <x19=int32#14,<x19=int32#14,<x06=int32#23
# asm 2: addu <x19=$15,<x19=$15,<x06=$24
addu $15,$15,$24

# qhasm:   x18 += x07
# asm 1: addu <x18=int32#13,<x18=int32#13,<x07=int32#24
# asm 2: addu <x18=$14,<x18=$14,<x07=$25
addu $14,$14,$25

# qhasm:   x11 += x0e
# asm 1: addu <x11=int32#8,<x11=int32#8,<x0e=int32#2
# asm 2: addu <x11=$11,<x11=$11,<x0e=$5
addu $11,$11,$5

# qhasm:   x10 += x0f
# asm 1: addu <x10=int32#7,<x10=int32#7,<x0f=int32#3
# asm 2: addu <x10=$10,<x10=$10,<x0f=$6
addu $10,$10,$6

# qhasm:   s06 = x06 << 7
# asm 1: sll >s06=int32#4,<x06=int32#23,7
# asm 2: sll >s06=$7,<x06=$24,7
sll $7,$24,7

# qhasm:   (uint32) x06 >>= 25
# asm 1: srl <x06=int32#23,<x06=int32#23,25
# asm 2: srl <x06=$24,<x06=$24,25
srl $24,$24,25

# qhasm:   x06 |= s06
# asm 1: or <x06=int32#23,<x06=int32#23,<s06=int32#4
# asm 2: or <x06=$24,<x06=$24,<s06=$7
or $24,$24,$7

# qhasm:   s07 = x07 << 7
# asm 1: sll >s07=int32#4,<x07=int32#24,7
# asm 2: sll >s07=$7,<x07=$25,7
sll $7,$25,7

# qhasm:   (uint32) x07 >>= 25
# asm 1: srl <x07=int32#24,<x07=int32#24,25
# asm 2: srl <x07=$25,<x07=$25,25
srl $25,$25,25

# qhasm:   x07 |= s07
# asm 1: or <x07=int32#24,<x07=int32#24,<s07=int32#4
# asm 2: or <x07=$25,<x07=$25,<s07=$7
or $25,$25,$7

# qhasm:   s0e = x0e << 7
# asm 1: sll >s0e=int32#4,<x0e=int32#2,7
# asm 2: sll >s0e=$7,<x0e=$5,7
sll $7,$5,7

# qhasm:   (uint32) x0e >>= 25
# asm 1: srl <x0e=int32#2,<x0e=int32#2,25
# asm 2: srl <x0e=$5,<x0e=$5,25
srl $5,$5,25

# qhasm:   x0e |= s0e
# asm 1: or <x0e=int32#2,<x0e=int32#2,<s0e=int32#4
# asm 2: or <x0e=$5,<x0e=$5,<s0e=$7
or $5,$5,$7

# qhasm:   s0f = x0f << 7
# asm 1: sll >s0f=int32#4,<x0f=int32#3,7
# asm 2: sll >s0f=$7,<x0f=$6,7
sll $7,$6,7

# qhasm:   (uint32) x0f >>= 25
# asm 1: srl <x0f=int32#3,<x0f=int32#3,25
# asm 2: srl <x0f=$6,<x0f=$6,25
srl $6,$6,25

# qhasm:   x0f |= s0f
# asm 1: or <x0f=int32#3,<x0f=int32#3,<s0f=int32#4
# asm 2: or <x0f=$6,<x0f=$6,<s0f=$7
or $6,$6,$7

# qhasm:   x06 ^= x11
# asm 1: xor <x06=int32#23,<x06=int32#23,<x11=int32#8
# asm 2: xor <x06=$24,<x06=$24,<x11=$11
xor $24,$24,$11

# qhasm:           x15 = x15_stack
# asm 1: lw >x15=int32#4,<x15_stack=stack32#15($sp)
# asm 2: lw >x15=$7,<x15_stack=56($sp)
lw $7,56($sp)

# qhasm:   x07 ^= x10
# asm 1: xor <x07=int32#24,<x07=int32#24,<x10=int32#7
# asm 2: xor <x07=$25,<x07=$25,<x10=$10
xor $25,$25,$10

# qhasm:           x14 = x14_stack
# asm 1: lw >x14=int32#6,<x14_stack=stack32#16($sp)
# asm 2: lw >x14=$9,<x14_stack=60($sp)
lw $9,60($sp)

# qhasm:   x0e ^= x19
# asm 1: xor <x0e=int32#2,<x0e=int32#2,<x19=int32#14
# asm 2: xor <x0e=$5,<x0e=$5,<x19=$15
xor $5,$5,$15

# qhasm:           x1d = x1d_stack
# asm 1: lw >x1d=int32#11,<x1d_stack=stack32#13($sp)
# asm 2: lw >x1d=$12,<x1d_stack=48($sp)
lw $12,48($sp)

# qhasm:   x0f ^= x18
# asm 1: xor <x0f=int32#3,<x0f=int32#3,<x18=int32#13
# asm 2: xor <x0f=$6,<x0f=$6,<x18=$14
xor $6,$6,$14

# qhasm:           x1c = x1c_stack
# asm 1: lw >x1c=int32#19,<x1c_stack=stack32#14($sp)
# asm 2: lw >x1c=$20,<x1c_stack=52($sp)
lw $20,52($sp)

# qhasm: 	  x0e_stack = x0e
# asm 1: sw <x0e=int32#2,>x0e_stack=stack32#15($sp)
# asm 2: sw <x0e=$5,>x0e_stack=56($sp)
sw $5,56($sp)

# qhasm: 	  x0f_stack = x0f
# asm 1: sw <x0f=int32#3,>x0f_stack=stack32#16($sp)
# asm 2: sw <x0f=$6,>x0f_stack=60($sp)
sw $6,60($sp)

# qhasm: 	  x0c = x0c_stack
# asm 1: lw >x0c=int32#2,<x0c_stack=stack32#17($sp)
# asm 2: lw >x0c=$5,<x0c_stack=64($sp)
lw $5,64($sp)

# qhasm: 	  x0d = x0d_stack
# asm 1: lw >x0d=int32#9,<x0d_stack=stack32#18($sp)
# asm 2: lw >x0d=$2,<x0d_stack=68($sp)
lw $2,68($sp)

# qhasm:   x11 += x04
# asm 1: addu <x11=int32#8,<x11=int32#8,<x04=int32#21
# asm 2: addu <x11=$11,<x11=$11,<x04=$22
addu $11,$11,$22

# qhasm:   x10 += x05
# asm 1: addu <x10=int32#7,<x10=int32#7,<x05=int32#22
# asm 2: addu <x10=$10,<x10=$10,<x05=$23
addu $10,$10,$23

# qhasm:   x19 += x0c
# asm 1: addu <x19=int32#14,<x19=int32#14,<x0c=int32#2
# asm 2: addu <x19=$15,<x19=$15,<x0c=$5
addu $15,$15,$5

# qhasm:   x18 += x0d
# asm 1: addu <x18=int32#13,<x18=int32#13,<x0d=int32#9
# asm 2: addu <x18=$14,<x18=$14,<x0d=$2
addu $14,$14,$2

# qhasm:   x15 += x00
# asm 1: addu <x15=int32#4,<x15=int32#4,<x00=int32#17
# asm 2: addu <x15=$7,<x15=$7,<x00=$18
addu $7,$7,$18

# qhasm:   x14 += x01
# asm 1: addu <x14=int32#6,<x14=int32#6,<x01=int32#18
# asm 2: addu <x14=$9,<x14=$9,<x01=$19
addu $9,$9,$19

# qhasm:   x1d += x08
# asm 1: addu <x1d=int32#11,<x1d=int32#11,<x08=int32#1
# asm 2: addu <x1d=$12,<x1d=$12,<x08=$4
addu $12,$12,$4

# qhasm:   x1c += x09
# asm 1: addu <x1c=int32#19,<x1c=int32#19,<x09=int32#5
# asm 2: addu <x1c=$20,<x1c=$20,<x09=$8
addu $20,$20,$8

# qhasm:   s04 = x04 << 11
# asm 1: sll >s04=int32#3,<x04=int32#21,11
# asm 2: sll >s04=$6,<x04=$22,11
sll $6,$22,11

# qhasm:   (uint32) x04 >>= 21
# asm 1: srl <x04=int32#21,<x04=int32#21,21
# asm 2: srl <x04=$22,<x04=$22,21
srl $22,$22,21

# qhasm:   x04 |= s04
# asm 1: or <x04=int32#21,<x04=int32#21,<s04=int32#3
# asm 2: or <x04=$22,<x04=$22,<s04=$6
or $22,$22,$6

# qhasm:           x15_stack = x15
# asm 1: sw <x15=int32#4,>x15_stack=stack32#18($sp)
# asm 2: sw <x15=$7,>x15_stack=68($sp)
sw $7,68($sp)

# qhasm:   s05 = x05 << 11
# asm 1: sll >s05=int32#3,<x05=int32#22,11
# asm 2: sll >s05=$6,<x05=$23,11
sll $6,$23,11

# qhasm:   (uint32) x05 >>= 21
# asm 1: srl <x05=int32#22,<x05=int32#22,21
# asm 2: srl <x05=$23,<x05=$23,21
srl $23,$23,21

# qhasm:   x05 |= s05
# asm 1: or <x05=int32#22,<x05=int32#22,<s05=int32#3
# asm 2: or <x05=$23,<x05=$23,<s05=$6
or $23,$23,$6

# qhasm:           x14_stack = x14
# asm 1: sw <x14=int32#6,>x14_stack=stack32#17($sp)
# asm 2: sw <x14=$9,>x14_stack=64($sp)
sw $9,64($sp)

# qhasm:   s0c = x0c << 11
# asm 1: sll >s0c=int32#3,<x0c=int32#2,11
# asm 2: sll >s0c=$6,<x0c=$5,11
sll $6,$5,11

# qhasm:   (uint32) x0c >>= 21
# asm 1: srl <x0c=int32#2,<x0c=int32#2,21
# asm 2: srl <x0c=$5,<x0c=$5,21
srl $5,$5,21

# qhasm:   x0c |= s0c
# asm 1: or <x0c=int32#2,<x0c=int32#2,<s0c=int32#3
# asm 2: or <x0c=$5,<x0c=$5,<s0c=$6
or $5,$5,$6

# qhasm:           x1d_stack = x1d
# asm 1: sw <x1d=int32#11,>x1d_stack=stack32#22($sp)
# asm 2: sw <x1d=$12,>x1d_stack=84($sp)
sw $12,84($sp)

# qhasm:   s0d = x0d << 11
# asm 1: sll >s0d=int32#3,<x0d=int32#9,11
# asm 2: sll >s0d=$6,<x0d=$2,11
sll $6,$2,11

# qhasm:   (uint32) x0d >>= 21
# asm 1: srl <x0d=int32#9,<x0d=int32#9,21
# asm 2: srl <x0d=$2,<x0d=$2,21
srl $2,$2,21

# qhasm:   x0d |= s0d
# asm 1: or <x0d=int32#9,<x0d=int32#9,<s0d=int32#3
# asm 2: or <x0d=$2,<x0d=$2,<s0d=$6
or $2,$2,$6

# qhasm:           x1c_stack = x1c
# asm 1: sw <x1c=int32#19,>x1c_stack=stack32#21($sp)
# asm 2: sw <x1c=$20,>x1c_stack=80($sp)
sw $20,80($sp)

# qhasm:   x04 ^= x15
# asm 1: xor <x04=int32#21,<x04=int32#21,<x15=int32#4
# asm 2: xor <x04=$22,<x04=$22,<x15=$7
xor $22,$22,$7

# qhasm:   x05 ^= x14
# asm 1: xor <x05=int32#22,<x05=int32#22,<x14=int32#6
# asm 2: xor <x05=$23,<x05=$23,<x14=$9
xor $23,$23,$9

# qhasm:   x0c ^= x1d
# asm 1: xor <x0c=int32#2,<x0c=int32#2,<x1d=int32#11
# asm 2: xor <x0c=$5,<x0c=$5,<x1d=$12
xor $5,$5,$12

# qhasm:   x0d ^= x1c
# asm 1: xor <x0d=int32#9,<x0d=int32#9,<x1c=int32#19
# asm 2: xor <x0d=$2,<x0d=$2,<x1c=$20
xor $2,$2,$20

# qhasm:           x0c_stack = x0c
# asm 1: sw <x0c=int32#2,>x0c_stack=stack32#13($sp)
# asm 2: sw <x0c=$5,>x0c_stack=48($sp)
sw $5,48($sp)

# qhasm:           x0d_stack = x0d
# asm 1: sw <x0d=int32#9,>x0d_stack=stack32#14($sp)
# asm 2: sw <x0d=$2,>x0d_stack=52($sp)
sw $2,52($sp)

# qhasm:           x0e = x0e_stack
# asm 1: lw >x0e=int32#2,<x0e_stack=stack32#15($sp)
# asm 2: lw >x0e=$5,<x0e_stack=56($sp)
lw $5,56($sp)

# qhasm:           x0f = x0f_stack
# asm 1: lw >x0f=int32#11,<x0f_stack=stack32#16($sp)
# asm 2: lw >x0f=$12,<x0f_stack=60($sp)
lw $12,60($sp)

# qhasm:   s00 = x00 << 11
# asm 1: sll >s00=int32#3,<x00=int32#17,11
# asm 2: sll >s00=$6,<x00=$18,11
sll $6,$18,11

# qhasm:   (uint32) x00 >>= 21
# asm 1: srl <x00=int32#17,<x00=int32#17,21
# asm 2: srl <x00=$18,<x00=$18,21
srl $18,$18,21

# qhasm:   x00 |= s00
# asm 1: or <x00=int32#17,<x00=int32#17,<s00=int32#3
# asm 2: or <x00=$18,<x00=$18,<s00=$6
or $18,$18,$6

# qhasm:   s01 = x01 << 11
# asm 1: sll >s01=int32#3,<x01=int32#18,11
# asm 2: sll >s01=$6,<x01=$19,11
sll $6,$19,11

# qhasm:   (uint32) x01 >>= 21
# asm 1: srl <x01=int32#18,<x01=int32#18,21
# asm 2: srl <x01=$19,<x01=$19,21
srl $19,$19,21

# qhasm:   x01 |= s01
# asm 1: or <x01=int32#18,<x01=int32#18,<s01=int32#3
# asm 2: or <x01=$19,<x01=$19,<s01=$6
or $19,$19,$6

# qhasm:   s08 = x08 << 11
# asm 1: sll >s08=int32#3,<x08=int32#1,11
# asm 2: sll >s08=$6,<x08=$4,11
sll $6,$4,11

# qhasm:   (uint32) x08 >>= 21
# asm 1: srl <x08=int32#1,<x08=int32#1,21
# asm 2: srl <x08=$4,<x08=$4,21
srl $4,$4,21

# qhasm:   x08 |= s08
# asm 1: or <x08=int32#1,<x08=int32#1,<s08=int32#3
# asm 2: or <x08=$4,<x08=$4,<s08=$6
or $4,$4,$6

# qhasm:   s09 = x09 << 11
# asm 1: sll >s09=int32#3,<x09=int32#5,11
# asm 2: sll >s09=$6,<x09=$8,11
sll $6,$8,11

# qhasm:   (uint32) x09 >>= 21
# asm 1: srl <x09=int32#5,<x09=int32#5,21
# asm 2: srl <x09=$8,<x09=$8,21
srl $8,$8,21

# qhasm:   x09 |= s09
# asm 1: or <x09=int32#5,<x09=int32#5,<s09=int32#3
# asm 2: or <x09=$8,<x09=$8,<s09=$6
or $8,$8,$6

# qhasm:   x00 ^= x11
# asm 1: xor <x00=int32#17,<x00=int32#17,<x11=int32#8
# asm 2: xor <x00=$18,<x00=$18,<x11=$11
xor $18,$18,$11

# qhasm:   x01 ^= x10
# asm 1: xor <x01=int32#18,<x01=int32#18,<x10=int32#7
# asm 2: xor <x01=$19,<x01=$19,<x10=$10
xor $19,$19,$10

# qhasm:           x17 = x17_stack
# asm 1: lw >x17=int32#3,<x17_stack=stack32#32($sp)
# asm 2: lw >x17=$6,<x17_stack=124($sp)
lw $6,124($sp)

# qhasm:   x08 ^= x19
# asm 1: xor <x08=int32#1,<x08=int32#1,<x19=int32#14
# asm 2: xor <x08=$4,<x08=$4,<x19=$15
xor $4,$4,$15

# qhasm:           x02 = x02_stack
# asm 1: lw >x02=int32#19,<x02_stack=stack32#12($sp)
# asm 2: lw >x02=$20,<x02_stack=44($sp)
lw $20,44($sp)

# qhasm:   x09 ^= x18
# asm 1: xor <x09=int32#5,<x09=int32#5,<x18=int32#13
# asm 2: xor <x09=$8,<x09=$8,<x18=$14
xor $8,$8,$14

# qhasm:           x16 = x16_stack
# asm 1: lw >x16=int32#4,<x16_stack=stack32#33($sp)
# asm 2: lw >x16=$7,<x16_stack=128($sp)
lw $7,128($sp)

# qhasm:   x13 += x06
# asm 1: addu <x13=int32#12,<x13=int32#12,<x06=int32#23
# asm 2: addu <x13=$13,<x13=$13,<x06=$24
addu $13,$13,$24

# qhasm:           x1f = x1f_stack
# asm 1: lw >x1f=int32#25,<x1f_stack=stack32#23($sp)
# asm 2: lw >x1f=$28,<x1f_stack=88($sp)
lw $28,88($sp)

# qhasm:   x12 += x07
# asm 1: addu <x12=int32#10,<x12=int32#10,<x07=int32#24
# asm 2: addu <x12=$3,<x12=$3,<x07=$25
addu $3,$3,$25

# qhasm:           x0a = x0a_stack
# asm 1: lw >x0a=int32#6,<x0a_stack=stack32#19($sp)
# asm 2: lw >x0a=$9,<x0a_stack=72($sp)
lw $9,72($sp)

# qhasm:   x1b += x0e
# asm 1: addu <x1b=int32#16,<x1b=int32#16,<x0e=int32#2
# asm 2: addu <x1b=$17,<x1b=$17,<x0e=$5
addu $17,$17,$5

# qhasm:           x1e = x1e_stack
# asm 1: lw >x1e=int32#26,<x1e_stack=stack32#24($sp)
# asm 2: lw >x1e=$30,<x1e_stack=92($sp)
lw $30,92($sp)

# qhasm:   x1a += x0f
# asm 1: addu <x1a=int32#15,<x1a=int32#15,<x0f=int32#11
# asm 2: addu <x1a=$16,<x1a=$16,<x0f=$12
addu $16,$16,$12

# qhasm:           x0b = x0b_stack
# asm 1: lw >x0b=int32#27,<x0b_stack=stack32#34($sp)
# asm 2: lw >x0b=$31,<x0b_stack=132($sp)
lw $31,132($sp)

# qhasm:   x17 += x02
# asm 1: addu <x17=int32#3,<x17=int32#3,<x02=int32#19
# asm 2: addu <x17=$6,<x17=$6,<x02=$20
addu $6,$6,$20

# qhasm:   x16 += x03
# asm 1: addu <x16=int32#4,<x16=int32#4,<x03=int32#20
# asm 2: addu <x16=$7,<x16=$7,<x03=$21
addu $7,$7,$21

# qhasm:   x1f += x0a
# asm 1: addu <x1f=int32#25,<x1f=int32#25,<x0a=int32#6
# asm 2: addu <x1f=$28,<x1f=$28,<x0a=$9
addu $28,$28,$9

# qhasm:   x1e += x0b
# asm 1: addu <x1e=int32#26,<x1e=int32#26,<x0b=int32#27
# asm 2: addu <x1e=$30,<x1e=$30,<x0b=$31
addu $30,$30,$31

# qhasm:   s06 = x06 << 11
# asm 1: sll >s06=int32#28,<x06=int32#23,11
# asm 2: sll >s06=$1,<x06=$24,11
sll $1,$24,11

# qhasm:   (uint32) x06 >>= 21
# asm 1: srl <x06=int32#23,<x06=int32#23,21
# asm 2: srl <x06=$24,<x06=$24,21
srl $24,$24,21

# qhasm:   x06 |= s06
# asm 1: or <x06=int32#23,<x06=int32#23,<s06=int32#28
# asm 2: or <x06=$24,<x06=$24,<s06=$1
or $24,$24,$1

# qhasm:           x17_stack = x17
# asm 1: sw <x17=int32#3,>x17_stack=stack32#20($sp)
# asm 2: sw <x17=$6,>x17_stack=76($sp)
sw $6,76($sp)

# qhasm:   s07 = x07 << 11
# asm 1: sll >s07=int32#28,<x07=int32#24,11
# asm 2: sll >s07=$1,<x07=$25,11
sll $1,$25,11

# qhasm:   (uint32) x07 >>= 21
# asm 1: srl <x07=int32#24,<x07=int32#24,21
# asm 2: srl <x07=$25,<x07=$25,21
srl $25,$25,21

# qhasm:   x07 |= s07
# asm 1: or <x07=int32#24,<x07=int32#24,<s07=int32#28
# asm 2: or <x07=$25,<x07=$25,<s07=$1
or $25,$25,$1

# qhasm:           x16_stack = x16
# asm 1: sw <x16=int32#4,>x16_stack=stack32#19($sp)
# asm 2: sw <x16=$7,>x16_stack=72($sp)
sw $7,72($sp)

# qhasm:   s0e = x0e << 11
# asm 1: sll >s0e=int32#28,<x0e=int32#2,11
# asm 2: sll >s0e=$1,<x0e=$5,11
sll $1,$5,11

# qhasm:   (uint32) x0e >>= 21
# asm 1: srl <x0e=int32#2,<x0e=int32#2,21
# asm 2: srl <x0e=$5,<x0e=$5,21
srl $5,$5,21

# qhasm:   x0e |= s0e
# asm 1: or <x0e=int32#2,<x0e=int32#2,<s0e=int32#28
# asm 2: or <x0e=$5,<x0e=$5,<s0e=$1
or $5,$5,$1

# qhasm:           x1f_stack = x1f
# asm 1: sw <x1f=int32#25,>x1f_stack=stack32#24($sp)
# asm 2: sw <x1f=$28,>x1f_stack=92($sp)
sw $28,92($sp)

# qhasm:   s0f = x0f << 11
# asm 1: sll >s0f=int32#28,<x0f=int32#11,11
# asm 2: sll >s0f=$1,<x0f=$12,11
sll $1,$12,11

# qhasm:   (uint32) x0f >>= 21
# asm 1: srl <x0f=int32#11,<x0f=int32#11,21
# asm 2: srl <x0f=$12,<x0f=$12,21
srl $12,$12,21

# qhasm:   x0f |= s0f
# asm 1: or <x0f=int32#11,<x0f=int32#11,<s0f=int32#28
# asm 2: or <x0f=$12,<x0f=$12,<s0f=$1
or $12,$12,$1

# qhasm:           x1e_stack = x1e
# asm 1: sw <x1e=int32#26,>x1e_stack=stack32#23($sp)
# asm 2: sw <x1e=$30,>x1e_stack=88($sp)
sw $30,88($sp)

# qhasm:   x06 ^= x17
# asm 1: xor <x06=int32#23,<x06=int32#23,<x17=int32#3
# asm 2: xor <x06=$24,<x06=$24,<x17=$6
xor $24,$24,$6

# qhasm:   x07 ^= x16
# asm 1: xor <x07=int32#24,<x07=int32#24,<x16=int32#4
# asm 2: xor <x07=$25,<x07=$25,<x16=$7
xor $25,$25,$7

# qhasm:   x0e ^= x1f
# asm 1: xor <x0e=int32#2,<x0e=int32#2,<x1f=int32#25
# asm 2: xor <x0e=$5,<x0e=$5,<x1f=$28
xor $5,$5,$28

# qhasm:   x0f ^= x1e
# asm 1: xor <x0f=int32#11,<x0f=int32#11,<x1e=int32#26
# asm 2: xor <x0f=$12,<x0f=$12,<x1e=$30
xor $12,$12,$30

# qhasm:           x0e_stack = x0e
# asm 1: sw <x0e=int32#2,>x0e_stack=stack32#15($sp)
# asm 2: sw <x0e=$5,>x0e_stack=56($sp)
sw $5,56($sp)

# qhasm:           x0f_stack = x0f
# asm 1: sw <x0f=int32#11,>x0f_stack=stack32#16($sp)
# asm 2: sw <x0f=$12,>x0f_stack=60($sp)
sw $12,60($sp)

# qhasm:   s0b = x0b << 11
# asm 1: sll >s0b=int32#2,<x0b=int32#27,11
# asm 2: sll >s0b=$5,<x0b=$31,11
sll $5,$31,11

# qhasm:   (uint32) x0b >>= 21
# asm 1: srl <x0b=int32#27,<x0b=int32#27,21
# asm 2: srl <x0b=$31,<x0b=$31,21
srl $31,$31,21

# qhasm:   x0b |= s0b
# asm 1: or <x0b=int32#27,<x0b=int32#27,<s0b=int32#2
# asm 2: or <x0b=$31,<x0b=$31,<s0b=$5
or $31,$31,$5

# qhasm:   s0a = x0a << 11
# asm 1: sll >s0a=int32#2,<x0a=int32#6,11
# asm 2: sll >s0a=$5,<x0a=$9,11
sll $5,$9,11

# qhasm:   (uint32) x0a >>= 21
# asm 1: srl <x0a=int32#6,<x0a=int32#6,21
# asm 2: srl <x0a=$9,<x0a=$9,21
srl $9,$9,21

# qhasm:   x0a |= s0a
# asm 1: or <x0a=int32#6,<x0a=int32#6,<s0a=int32#2
# asm 2: or <x0a=$9,<x0a=$9,<s0a=$5
or $9,$9,$5

# qhasm:   s03 = x03 << 11
# asm 1: sll >s03=int32#2,<x03=int32#20,11
# asm 2: sll >s03=$5,<x03=$21,11
sll $5,$21,11

# qhasm:   (uint32) x03 >>= 21
# asm 1: srl <x03=int32#20,<x03=int32#20,21
# asm 2: srl <x03=$21,<x03=$21,21
srl $21,$21,21

# qhasm:   x03 |= s03
# asm 1: or <x03=int32#20,<x03=int32#20,<s03=int32#2
# asm 2: or <x03=$21,<x03=$21,<s03=$5
or $21,$21,$5

# qhasm:   s02 = x02 << 11
# asm 1: sll >s02=int32#2,<x02=int32#19,11
# asm 2: sll >s02=$5,<x02=$20,11
sll $5,$20,11

# qhasm:   (uint32) x02 >>= 21
# asm 1: srl <x02=int32#19,<x02=int32#19,21
# asm 2: srl <x02=$20,<x02=$20,21
srl $20,$20,21

# qhasm:   x02 |= s02
# asm 1: or <x02=int32#19,<x02=int32#19,<s02=int32#2
# asm 2: or <x02=$20,<x02=$20,<s02=$5
or $20,$20,$5

# qhasm:         r = r_stack
# asm 1: lw >r=int32#26,<r_stack=stack32#29($sp)
# asm 2: lw >r=$30,<r_stack=112($sp)
lw $30,112($sp)

# qhasm:   x0b ^= x1a
# asm 1: xor <x0b=int32#27,<x0b=int32#27,<x1a=int32#15
# asm 2: xor <x0b=$31,<x0b=$31,<x1a=$16
xor $31,$31,$16

# qhasm:   x0a ^= x1b
# asm 1: xor <x0a=int32#6,<x0a=int32#6,<x1b=int32#16
# asm 2: xor <x0a=$9,<x0a=$9,<x1b=$17
xor $9,$9,$17

# qhasm:                    r -= 2
# asm 1: addiu <r=int32#26,<r=int32#26,-2
# asm 2: addiu <r=$30,<r=$30,-2
addiu $30,$30,-2

# qhasm:   x03 ^= x12
# asm 1: xor <x03=int32#20,<x03=int32#20,<x12=int32#10
# asm 2: xor <x03=$21,<x03=$21,<x12=$3
xor $21,$21,$3

# qhasm:   x02 ^= x13
# asm 1: xor <x02=int32#19,<x02=int32#19,<x13=int32#12
# asm 2: xor <x02=$20,<x02=$20,<x13=$13
xor $20,$20,$13

# qhasm:           x0b_stack = x0b
# asm 1: sw <x0b=int32#27,>x0b_stack=stack32#12($sp)
# asm 2: sw <x0b=$31,>x0b_stack=44($sp)
sw $31,44($sp)

# qhasm: goto morerounds if r > 0
# asm 1: bgtz <r=int32#26,._morerounds
# asm 2: bgtz <r=$30,._morerounds
bgtz $30,._morerounds
nop

# qhasm:   finalization = finalization_stack
# asm 1: lw >finalization=int32#25,<finalization_stack=stack32#25($sp)
# asm 2: lw >finalization=$28,<finalization_stack=96($sp)
lw $28,96($sp)

# qhasm:   in = in_stack
# asm 1: lw >in=int32#2,<in_stack=stack32#28($sp)
# asm 2: lw >in=$5,<in_stack=108($sp)
lw $5,108($sp)

# qhasm:   inlenlow = inlenlow_stack
# asm 1: lw >inlenlow=int32#3,<inlenlow_stack=stack32#26($sp)
# asm 2: lw >inlenlow=$6,<inlenlow_stack=100($sp)
lw $6,100($sp)

# qhasm:   inlenhigh = inlenhigh_stack
# asm 1: lw >inlenhigh=int32#4,<inlenhigh_stack=stack32#27($sp)
# asm 2: lw >inlenhigh=$7,<inlenhigh_stack=104($sp)
lw $7,104($sp)

# qhasm: goto checkinlen
b ._checkinlen
nop

# qhasm: inlenbelow32:
._inlenbelow32:

# qhasm: 		      check = 1
# asm 1: li >check=int32#26,1
# asm 2: li >check=$30,1
li $30,1

# qhasm: goto finalization1 if finalization == check
# asm 1: beq <finalization=int32#25,<check=int32#26,._finalization1
# asm 2: beq <finalization=$28,<check=$30,._finalization1
beq $28,$30,._finalization1
nop

# qhasm: 		      check = 2
# asm 1: li >check=int32#26,2
# asm 2: li >check=$30,2
li $30,2

# qhasm: goto finalization2 if finalization == check
# asm 1: beq <finalization=int32#25,<check=int32#26,._finalization2
# asm 2: beq <finalization=$28,<check=$30,._finalization2
beq $28,$30,._finalization2
nop

# qhasm:   new tmp

# qhasm:   y00 = 0
# asm 1: li >y00=int32#25,0
# asm 2: li >y00=$28,0
li $28,0

# qhasm:   z = &tmp
# asm 1: addiu >z=int32#26,$sp,<tmp=stack256#1
# asm 2: addiu >z=$30,$sp,<tmp=160
addiu $30,$sp,160

# qhasm:   *(uint32 *) (z + 0) = y00
# asm 1: sw <y00=int32#25,0(<z=int32#26)
# asm 2: sw <y00=$28,0(<z=$30)
sw $28,0($30)

# qhasm:   *(uint32 *) (z + 4) = y00
# asm 1: sw <y00=int32#25,4(<z=int32#26)
# asm 2: sw <y00=$28,4(<z=$30)
sw $28,4($30)

# qhasm:   *(uint32 *) (z + 8) = y00
# asm 1: sw <y00=int32#25,8(<z=int32#26)
# asm 2: sw <y00=$28,8(<z=$30)
sw $28,8($30)

# qhasm:   *(uint32 *) (z + 12) = y00
# asm 1: sw <y00=int32#25,12(<z=int32#26)
# asm 2: sw <y00=$28,12(<z=$30)
sw $28,12($30)

# qhasm:   *(uint32 *) (z + 16) = y00
# asm 1: sw <y00=int32#25,16(<z=int32#26)
# asm 2: sw <y00=$28,16(<z=$30)
sw $28,16($30)

# qhasm:   *(uint32 *) (z + 20) = y00
# asm 1: sw <y00=int32#25,20(<z=int32#26)
# asm 2: sw <y00=$28,20(<z=$30)
sw $28,20($30)

# qhasm:   *(uint32 *) (z + 24) = y00
# asm 1: sw <y00=int32#25,24(<z=int32#26)
# asm 2: sw <y00=$28,24(<z=$30)
sw $28,24($30)

# qhasm:   *(uint32 *) (z + 28) = y00
# asm 1: sw <y00=int32#25,28(<z=int32#26)
# asm 2: sw <y00=$28,28(<z=$30)
sw $28,28($30)

# qhasm: goto copydone if inlenlow <= 0
# asm 1: blez <inlenlow=int32#3,._copydone
# asm 2: blez <inlenlow=$6,._copydone
blez $6,._copydone
nop

# qhasm:   copyloop:
._copyloop:

# qhasm:     y00 = *(uint8 *) (in + 0)
# asm 1: lbu >y00=int32#25,0(<in=int32#2)
# asm 2: lbu >y00=$28,0(<in=$5)
lbu $28,0($5)

# qhasm:     in += 1
# asm 1: addiu <in=int32#2,<in=int32#2,1
# asm 2: addiu <in=$5,<in=$5,1
addiu $5,$5,1

# qhasm:     *(uint8 *) (z + 0) = y00
# asm 1: sb <y00=int32#25,0(<z=int32#26)
# asm 2: sb <y00=$28,0(<z=$30)
sb $28,0($30)

# qhasm:     z += 1
# asm 1: addiu <z=int32#26,<z=int32#26,1
# asm 2: addiu <z=$30,<z=$30,1
addiu $30,$30,1

# qhasm:                  inlenlow -= 1
# asm 1: addiu <inlenlow=int32#3,<inlenlow=int32#3,-1
# asm 2: addiu <inlenlow=$6,<inlenlow=$6,-1
addiu $6,$6,-1

# qhasm: goto copyloop if inlenlow > 0
# asm 1: bgtz <inlenlow=int32#3,._copyloop
# asm 2: bgtz <inlenlow=$6,._copyloop
bgtz $6,._copyloop
nop

# qhasm: copydone:
._copydone:

# qhasm:   y00 = 128
# asm 1: li >y00=int32#2,128
# asm 2: li >y00=$5,128
li $5,128

# qhasm:   *(uint8 *) (z + 0) = y00
# asm 1: sb <y00=int32#2,0(<z=int32#26)
# asm 2: sb <y00=$5,0(<z=$30)
sb $5,0($30)

# qhasm:   in = &tmp
# asm 1: addiu >in=int32#2,$sp,<tmp=stack256#1
# asm 2: addiu >in=$5,$sp,<tmp=160
addiu $5,$sp,160

# qhasm:   finalization = 1
# asm 1: li >finalization=int32#25,1
# asm 2: li >finalization=$28,1
li $28,1

# qhasm:   inlenlow = 32
# asm 1: li >inlenlow=int32#3,32
# asm 2: li >inlenlow=$6,32
li $6,32

# qhasm:   carry = 0
# asm 1: li >carry=int32#26,0
# asm 2: li >carry=$30,0
li $30,0

# qhasm:   goto mainloop
b ._mainloop
nop

# qhasm: finalization1:
._finalization1:

# qhasm:   x1f = x1f_stack
# asm 1: lw >x1f=int32#25,<x1f_stack=stack32#24($sp)
# asm 2: lw >x1f=$28,<x1f_stack=92($sp)
lw $28,92($sp)

# qhasm:   x1f ^= 1
# asm 1: xori <x1f=int32#25,<x1f=int32#25,1
# asm 2: xori <x1f=$28,<x1f=$28,1
xori $28,$28,1

# qhasm:   x1f_stack = x1f
# asm 1: sw <x1f=int32#25,>x1f_stack=stack32#24($sp)
# asm 2: sw <x1f=$28,>x1f_stack=92($sp)
sw $28,92($sp)

# qhasm:   r = 160
# asm 1: li >r=int32#26,160
# asm 2: li >r=$30,160
li $30,160

# qhasm:   finalization = 2
# asm 1: li >finalization=int32#25,2
# asm 2: li >finalization=$28,2
li $28,2

# qhasm:   finalization_stack = finalization
# asm 1: sw <finalization=int32#25,>finalization_stack=stack32#25($sp)
# asm 2: sw <finalization=$28,>finalization_stack=96($sp)
sw $28,96($sp)

# qhasm:   in_stack = in
# asm 1: sw <in=int32#2,>in_stack=stack32#28($sp)
# asm 2: sw <in=$5,>in_stack=108($sp)
sw $5,108($sp)

# qhasm:   inlenlow_stack = inlenlow
# asm 1: sw <inlenlow=int32#3,>inlenlow_stack=stack32#26($sp)
# asm 2: sw <inlenlow=$6,>inlenlow_stack=100($sp)
sw $6,100($sp)

# qhasm:   inlenhigh_stack = inlenhigh
# asm 1: sw <inlenhigh=int32#4,>inlenhigh_stack=stack32#27($sp)
# asm 2: sw <inlenhigh=$7,>inlenhigh_stack=104($sp)
sw $7,104($sp)

# qhasm: goto morerounds
b ._morerounds
nop

# qhasm: finalization2:
._finalization2:

# qhasm:   out = out_stack
# asm 1: lw >out=int32#2,<out_stack=stack32#11($sp)
# asm 2: lw >out=$5,<out_stack=40($sp)
lw $5,40($sp)

# qhasm:   *(unaligned uint32 *) (out + 0) left = x00
# asm 1: swr <x00=int32#17,0(<out=int32#2)
# asm 2: swr <x00=$18,0(<out=$5)
swr $18,0($5)

# qhasm:   *(unaligned uint32 *) (out + 0) right = x00
# asm 1: swl <x00=int32#17,3+0(<out=int32#2)
# asm 2: swl <x00=$18,3+0(<out=$5)
swl $18,3+0($5)

# qhasm:   *(unaligned uint32 *) (out + 4) left = x01
# asm 1: swr <x01=int32#18,4(<out=int32#2)
# asm 2: swr <x01=$19,4(<out=$5)
swr $19,4($5)

# qhasm:   *(unaligned uint32 *) (out + 4) right = x01
# asm 1: swl <x01=int32#18,3+4(<out=int32#2)
# asm 2: swl <x01=$19,3+4(<out=$5)
swl $19,3+4($5)

# qhasm:   *(unaligned uint32 *) (out + 8) left = x02
# asm 1: swr <x02=int32#19,8(<out=int32#2)
# asm 2: swr <x02=$20,8(<out=$5)
swr $20,8($5)

# qhasm:   *(unaligned uint32 *) (out + 8) right = x02
# asm 1: swl <x02=int32#19,3+8(<out=int32#2)
# asm 2: swl <x02=$20,3+8(<out=$5)
swl $20,3+8($5)

# qhasm:   *(unaligned uint32 *) (out + 12) left = x03
# asm 1: swr <x03=int32#20,12(<out=int32#2)
# asm 2: swr <x03=$21,12(<out=$5)
swr $21,12($5)

# qhasm:   *(unaligned uint32 *) (out + 12) right = x03
# asm 1: swl <x03=int32#20,3+12(<out=int32#2)
# asm 2: swl <x03=$21,3+12(<out=$5)
swl $21,3+12($5)

# qhasm:   *(unaligned uint32 *) (out + 16) left = x04
# asm 1: swr <x04=int32#21,16(<out=int32#2)
# asm 2: swr <x04=$22,16(<out=$5)
swr $22,16($5)

# qhasm:   *(unaligned uint32 *) (out + 16) right = x04
# asm 1: swl <x04=int32#21,3+16(<out=int32#2)
# asm 2: swl <x04=$22,3+16(<out=$5)
swl $22,3+16($5)

# qhasm:   *(unaligned uint32 *) (out + 20) left = x05
# asm 1: swr <x05=int32#22,20(<out=int32#2)
# asm 2: swr <x05=$23,20(<out=$5)
swr $23,20($5)

# qhasm:   *(unaligned uint32 *) (out + 20) right = x05
# asm 1: swl <x05=int32#22,3+20(<out=int32#2)
# asm 2: swl <x05=$23,3+20(<out=$5)
swl $23,3+20($5)

# qhasm:   *(unaligned uint32 *) (out + 24) left = x06
# asm 1: swr <x06=int32#23,24(<out=int32#2)
# asm 2: swr <x06=$24,24(<out=$5)
swr $24,24($5)

# qhasm:   *(unaligned uint32 *) (out + 24) right = x06
# asm 1: swl <x06=int32#23,3+24(<out=int32#2)
# asm 2: swl <x06=$24,3+24(<out=$5)
swl $24,3+24($5)

# qhasm:   *(unaligned uint32 *) (out + 28) left = x07
# asm 1: swr <x07=int32#24,28(<out=int32#2)
# asm 2: swr <x07=$25,28(<out=$5)
swr $25,28($5)

# qhasm:   *(unaligned uint32 *) (out + 28) right = x07
# asm 1: swl <x07=int32#24,3+28(<out=int32#2)
# asm 2: swl <x07=$25,3+28(<out=$5)
swl $25,3+28($5)

# qhasm:   x0b = x0b_stack
# asm 1: lw >x0b=int32#3,<x0b_stack=stack32#12($sp)
# asm 2: lw >x0b=$6,<x0b_stack=44($sp)
lw $6,44($sp)

# qhasm:   x0c = x0c_stack
# asm 1: lw >x0c=int32#4,<x0c_stack=stack32#13($sp)
# asm 2: lw >x0c=$7,<x0c_stack=48($sp)
lw $7,48($sp)

# qhasm:   x0d = x0d_stack
# asm 1: lw >x0d=int32#7,<x0d_stack=stack32#14($sp)
# asm 2: lw >x0d=$10,<x0d_stack=52($sp)
lw $10,52($sp)

# qhasm:   x0e = x0e_stack
# asm 1: lw >x0e=int32#8,<x0e_stack=stack32#15($sp)
# asm 2: lw >x0e=$11,<x0e_stack=56($sp)
lw $11,56($sp)

# qhasm:   x0f = x0f_stack
# asm 1: lw >x0f=int32#9,<x0f_stack=stack32#16($sp)
# asm 2: lw >x0f=$2,<x0f_stack=60($sp)
lw $2,60($sp)

# qhasm:   *(unaligned uint32 *) (out + 32) left = x08
# asm 1: swr <x08=int32#1,32(<out=int32#2)
# asm 2: swr <x08=$4,32(<out=$5)
swr $4,32($5)

# qhasm:   *(unaligned uint32 *) (out + 32) right = x08
# asm 1: swl <x08=int32#1,3+32(<out=int32#2)
# asm 2: swl <x08=$4,3+32(<out=$5)
swl $4,3+32($5)

# qhasm:   *(unaligned uint32 *) (out + 36) left = x09
# asm 1: swr <x09=int32#5,36(<out=int32#2)
# asm 2: swr <x09=$8,36(<out=$5)
swr $8,36($5)

# qhasm:   *(unaligned uint32 *) (out + 36) right = x09
# asm 1: swl <x09=int32#5,3+36(<out=int32#2)
# asm 2: swl <x09=$8,3+36(<out=$5)
swl $8,3+36($5)

# qhasm:   *(unaligned uint32 *) (out + 40) left = x0a
# asm 1: swr <x0a=int32#6,40(<out=int32#2)
# asm 2: swr <x0a=$9,40(<out=$5)
swr $9,40($5)

# qhasm:   *(unaligned uint32 *) (out + 40) right = x0a
# asm 1: swl <x0a=int32#6,3+40(<out=int32#2)
# asm 2: swl <x0a=$9,3+40(<out=$5)
swl $9,3+40($5)

# qhasm:   *(unaligned uint32 *) (out + 44) left = x0b
# asm 1: swr <x0b=int32#3,44(<out=int32#2)
# asm 2: swr <x0b=$6,44(<out=$5)
swr $6,44($5)

# qhasm:   *(unaligned uint32 *) (out + 44) right = x0b
# asm 1: swl <x0b=int32#3,3+44(<out=int32#2)
# asm 2: swl <x0b=$6,3+44(<out=$5)
swl $6,3+44($5)

# qhasm:   *(unaligned uint32 *) (out + 48) left = x0c
# asm 1: swr <x0c=int32#4,48(<out=int32#2)
# asm 2: swr <x0c=$7,48(<out=$5)
swr $7,48($5)

# qhasm:   *(unaligned uint32 *) (out + 48) right = x0c
# asm 1: swl <x0c=int32#4,3+48(<out=int32#2)
# asm 2: swl <x0c=$7,3+48(<out=$5)
swl $7,3+48($5)

# qhasm:   *(unaligned uint32 *) (out + 52) left = x0d
# asm 1: swr <x0d=int32#7,52(<out=int32#2)
# asm 2: swr <x0d=$10,52(<out=$5)
swr $10,52($5)

# qhasm:   *(unaligned uint32 *) (out + 52) right = x0d
# asm 1: swl <x0d=int32#7,3+52(<out=int32#2)
# asm 2: swl <x0d=$10,3+52(<out=$5)
swl $10,3+52($5)

# qhasm:   *(unaligned uint32 *) (out + 56) left = x0e
# asm 1: swr <x0e=int32#8,56(<out=int32#2)
# asm 2: swr <x0e=$11,56(<out=$5)
swr $11,56($5)

# qhasm:   *(unaligned uint32 *) (out + 56) right = x0e
# asm 1: swl <x0e=int32#8,3+56(<out=int32#2)
# asm 2: swl <x0e=$11,3+56(<out=$5)
swl $11,3+56($5)

# qhasm:   *(unaligned uint32 *) (out + 60) left = x0f
# asm 1: swr <x0f=int32#9,60(<out=int32#2)
# asm 2: swr <x0f=$2,60(<out=$5)
swr $2,60($5)

# qhasm:   *(unaligned uint32 *) (out + 60) right = x0f
# asm 1: swl <x0f=int32#9,3+60(<out=int32#2)
# asm 2: swl <x0f=$2,3+60(<out=$5)
swl $2,3+60($5)

# qhasm:   result = 0
# asm 1: li >result=int32#1,0
# asm 2: li >result=$4,0
li $4,0

# qhasm:   i16 = i16_stack
# asm 1: lw >i16=int32#15,<i16_stack=stack32#1($sp)
# asm 2: lw >i16=$16,<i16_stack=0($sp)
lw $16,0($sp)

# qhasm:   i17 = i17_stack
# asm 1: lw >i17=int32#16,<i17_stack=stack32#2($sp)
# asm 2: lw >i17=$17,<i17_stack=4($sp)
lw $17,4($sp)

# qhasm:   i18 = i18_stack
# asm 1: lw >i18=int32#17,<i18_stack=stack32#3($sp)
# asm 2: lw >i18=$18,<i18_stack=8($sp)
lw $18,8($sp)

# qhasm:   i19 = i19_stack
# asm 1: lw >i19=int32#18,<i19_stack=stack32#4($sp)
# asm 2: lw >i19=$19,<i19_stack=12($sp)
lw $19,12($sp)

# qhasm:   i20 = i20_stack
# asm 1: lw >i20=int32#19,<i20_stack=stack32#5($sp)
# asm 2: lw >i20=$20,<i20_stack=16($sp)
lw $20,16($sp)

# qhasm:   i21 = i21_stack
# asm 1: lw >i21=int32#20,<i21_stack=stack32#6($sp)
# asm 2: lw >i21=$21,<i21_stack=20($sp)
lw $21,20($sp)

# qhasm:   i22 = i22_stack
# asm 1: lw >i22=int32#21,<i22_stack=stack32#7($sp)
# asm 2: lw >i22=$22,<i22_stack=24($sp)
lw $22,24($sp)

# qhasm:   i23 = i23_stack
# asm 1: lw >i23=int32#22,<i23_stack=stack32#8($sp)
# asm 2: lw >i23=$23,<i23_stack=28($sp)
lw $23,28($sp)

# qhasm:   i30 = i30_stack
# asm 1: lw >i30=int32#26,<i30_stack=stack32#9($sp)
# asm 2: lw >i30=$30,<i30_stack=32($sp)
lw $30,32($sp)

# qhasm:   i31 = i31_stack
# asm 1: lw >i31=int32#27,<i31_stack=stack32#10($sp)
# asm 2: lw >i31=$31,<i31_stack=36($sp)
lw $31,36($sp)

# qhasm: leave
or $2,$4,$0
or $3,$5,$0
addiu $sp,$sp,192
j $31
nop
.end crypto_hash_cubehash1632_mips32
