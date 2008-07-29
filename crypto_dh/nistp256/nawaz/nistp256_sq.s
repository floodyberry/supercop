
# qhasm: enter nistp256_sq
.section ".text"
.align 32
.global nistp256_sq
nistp256_sq:
save %sp,-176,%sp

# qhasm: int64 h

# qhasm: int64 f

# qhasm: input h

# qhasm: input f

# qhasm: int64 constants

# qhasm: int64 constants_low

# qhasm: float64 two

# qhasm: float64 f0

# qhasm: float64 f22

# qhasm: float64 f43

# qhasm: float64 f64

# qhasm: float64 f86

# qhasm: float64 f107

# qhasm: float64 f128

# qhasm: float64 f150

# qhasm: float64 f171

# qhasm: float64 f192

# qhasm: float64 f214

# qhasm: float64 f235

# qhasm: float64 2f0

# qhasm: float64 2f22

# qhasm: float64 2f43

# qhasm: float64 2f64

# qhasm: float64 2f86

# qhasm: float64 2f107

# qhasm: float64 2f128

# qhasm: float64 2f150

# qhasm: float64 2f171

# qhasm: float64 2f192

# qhasm: float64 2f214

# qhasm: float64 r

# qhasm: float64 s

# qhasm: float64 t

# qhasm: float64 u

# qhasm: float64 v

# qhasm: float64 w

# qhasm: float64 x

# qhasm: float64 y

# qhasm: float64 z

# qhasm: float64 h0

# qhasm: float64 h22

# qhasm: float64 h43

# qhasm: float64 h64

# qhasm: float64 h86

# qhasm: float64 h107

# qhasm: float64 h128

# qhasm: float64 h150

# qhasm: float64 h171

# qhasm: float64 h192

# qhasm: float64 h214

# qhasm: float64 h235

# qhasm: float64 h256

# qhasm: float64 h278

# qhasm: float64 h299

# qhasm: float64 h320

# qhasm: float64 h342

# qhasm: float64 h363

# qhasm: float64 h384

# qhasm: float64 h406

# qhasm: float64 h427

# qhasm: float64 h448

# qhasm: float64 h470

# qhasm: constants = (nistp256_constants & 0xfffffc0000000000) >> 32
# asm 1: sethi %hh(nistp256_constants),>constants=int64#3
# asm 2: sethi %hh(nistp256_constants),>constants=%i2
sethi %hh(nistp256_constants),%i2

# qhasm: constants_low = nistp256_constants & 0xfffffc00
# asm 1: sethi %lm(nistp256_constants),>constants_low=int64#4
# asm 2: sethi %lm(nistp256_constants),>constants_low=%i3
sethi %lm(nistp256_constants),%i3

# qhasm: constants |= (nistp256_constants & 0x3ff00000000) >> 32
# asm 1: or <constants=int64#3,%hm(nistp256_constants),>constants=int64#3
# asm 2: or <constants=%i2,%hm(nistp256_constants),>constants=%i2
or %i2,%hm(nistp256_constants),%i2

# qhasm: constants_low |= nistp256_constants & 0x3ff
# asm 1: or <constants_low=int64#4,%lo(nistp256_constants),>constants_low=int64#4
# asm 2: or <constants_low=%i3,%lo(nistp256_constants),>constants_low=%i3
or %i3,%lo(nistp256_constants),%i3

# qhasm: constants <<= 32
# asm 1: sllx <constants=int64#3,32,>constants=int64#3
# asm 2: sllx <constants=%i2,32,>constants=%i2
sllx %i2,32,%i2

# qhasm: constants |= constants_low
# asm 1: or  <constants=int64#3,<constants_low=int64#4,>constants=int64#3
# asm 2: or  <constants=%i2,<constants_low=%i3,>constants=%i2
or  %i2,%i3,%i2

# qhasm: two = *(float64 *) (constants + 0)
# asm 1: ldd [<constants=int64#3+0],>two=float64#1
# asm 2: ldd [<constants=%i2+0],>two=%f0
ldd [%i2+0],%f0

# qhasm: f0 = *(float64 *) (f + 0)
# asm 1: ldd [<f=int64#2+0],>f0=float64#2
# asm 2: ldd [<f=%i1+0],>f0=%f2
ldd [%i1+0],%f2

# qhasm: f22 = *(float64 *) (f + 8)
# asm 1: ldd [<f=int64#2+8],>f22=float64#3
# asm 2: ldd [<f=%i1+8],>f22=%f4
ldd [%i1+8],%f4

# qhasm: f43 = *(float64 *) (f + 16)
# asm 1: ldd [<f=int64#2+16],>f43=float64#4
# asm 2: ldd [<f=%i1+16],>f43=%f6
ldd [%i1+16],%f6

# qhasm: 					h0 = f0 * f0
# asm 1: fmuld <f0=float64#2,<f0=float64#2,>h0=float64#5
# asm 2: fmuld <f0=%f2,<f0=%f2,>h0=%f8
fmuld %f2,%f2,%f8

# qhasm: 								*(float64 *) (h + 0) = h0
# asm 1: std <h0=float64#5,[<h=int64#1+0]
# asm 2: std <h0=%f8,[<h=%i0+0]
std %f8,[%i0+0]

# qhasm: f64 = *(float64 *) (f + 24)
# asm 1: ldd [<f=int64#2+24],>f64=float64#5
# asm 2: ldd [<f=%i1+24],>f64=%f8
ldd [%i1+24],%f8

# qhasm: 					2f0 = two * f0
# asm 1: fmuld <two=float64#1,<f0=float64#2,>2f0=float64#2
# asm 2: fmuld <two=%f0,<f0=%f2,>2f0=%f2
fmuld %f0,%f2,%f2

# qhasm: f86 = *(float64 *) (f + 32)
# asm 1: ldd [<f=int64#2+32],>f86=float64#6
# asm 2: ldd [<f=%i1+32],>f86=%f10
ldd [%i1+32],%f10

# qhasm: 					2f22 = two * f22
# asm 1: fmuld <two=float64#1,<f22=float64#3,>2f22=float64#7
# asm 2: fmuld <two=%f0,<f22=%f4,>2f22=%f12
fmuld %f0,%f4,%f12

# qhasm: f107 = *(float64 *) (f + 40)
# asm 1: ldd [<f=int64#2+40],>f107=float64#8
# asm 2: ldd [<f=%i1+40],>f107=%f14
ldd [%i1+40],%f14

# qhasm: 					2f43 = two * f43
# asm 1: fmuld <two=float64#1,<f43=float64#4,>2f43=float64#9
# asm 2: fmuld <two=%f0,<f43=%f6,>2f43=%f16
fmuld %f0,%f6,%f16

# qhasm: f128 = *(float64 *) (f + 48)
# asm 1: ldd [<f=int64#2+48],>f128=float64#10
# asm 2: ldd [<f=%i1+48],>f128=%f18
ldd [%i1+48],%f18

# qhasm: 					2f64 = two * f64
# asm 1: fmuld <two=float64#1,<f64=float64#5,>2f64=float64#11
# asm 2: fmuld <two=%f0,<f64=%f8,>2f64=%f20
fmuld %f0,%f8,%f20

# qhasm: f150 = *(float64 *) (f + 56)
# asm 1: ldd [<f=int64#2+56],>f150=float64#12
# asm 2: ldd [<f=%i1+56],>f150=%f22
ldd [%i1+56],%f22

# qhasm: 					h22 = 2f0 * f22
# asm 1: fmuld <2f0=float64#2,<f22=float64#3,>h22=float64#13
# asm 2: fmuld <2f0=%f2,<f22=%f4,>h22=%f24
fmuld %f2,%f4,%f24

# qhasm: 								*(float64 *) (h + 8) = h22
# asm 1: std <h22=float64#13,[<h=int64#1+8]
# asm 2: std <h22=%f24,[<h=%i0+8]
std %f24,[%i0+8]

# qhasm: f171 = *(float64 *) (f + 64)
# asm 1: ldd [<f=int64#2+64],>f171=float64#13
# asm 2: ldd [<f=%i1+64],>f171=%f24
ldd [%i1+64],%f24

# qhasm: 					h43 = 2f0 * f43
# asm 1: fmuld <2f0=float64#2,<f43=float64#4,>h43=float64#14
# asm 2: fmuld <2f0=%f2,<f43=%f6,>h43=%f26
fmuld %f2,%f6,%f26

# qhasm: f192 = *(float64 *) (f + 72)
# asm 1: ldd [<f=int64#2+72],>f192=float64#15
# asm 2: ldd [<f=%i1+72],>f192=%f28
ldd [%i1+72],%f28

# qhasm: 					x = f22 * f22
# asm 1: fmuld <f22=float64#3,<f22=float64#3,>x=float64#3
# asm 2: fmuld <f22=%f4,<f22=%f4,>x=%f4
fmuld %f4,%f4,%f4

# qhasm: f214 = *(float64 *) (f + 80)
# asm 1: ldd [<f=int64#2+80],>f214=float64#16
# asm 2: ldd [<f=%i1+80],>f214=%f30
ldd [%i1+80],%f30

# qhasm: 					h64 = 2f0 * f64
# asm 1: fmuld <2f0=float64#2,<f64=float64#5,>h64=float64#17
# asm 2: fmuld <2f0=%f2,<f64=%f8,>h64=%f32
fmuld %f2,%f8,%f32

# qhasm: f235 = *(float64 *) (f + 88)
# asm 1: ldd [<f=int64#2+88],>f235=float64#18
# asm 2: ldd [<f=%i1+88],>f235=%f34
ldd [%i1+88],%f34

# qhasm: 					y = 2f22 * f43
# asm 1: fmuld <2f22=float64#7,<f43=float64#4,>y=float64#19
# asm 2: fmuld <2f22=%f12,<f43=%f6,>y=%f36
fmuld %f12,%f6,%f36

# qhasm: 					2f86 = two * f86
# asm 1: fmuld <two=float64#1,<f86=float64#6,>2f86=float64#20
# asm 2: fmuld <two=%f0,<f86=%f10,>2f86=%f38
fmuld %f0,%f10,%f38

# qhasm: 					2f107 = two * f107
# asm 1: fmuld <two=float64#1,<f107=float64#8,>2f107=float64#21
# asm 2: fmuld <two=%f0,<f107=%f14,>2f107=%f40
fmuld %f0,%f14,%f40

# qhasm: 						h43 += x
# asm 1: faddd <h43=float64#14,<x=float64#3,>h43=float64#3
# asm 2: faddd <h43=%f26,<x=%f4,>h43=%f4
faddd %f26,%f4,%f4

# qhasm: 					2f128 = two * f128
# asm 1: fmuld <two=float64#1,<f128=float64#10,>2f128=float64#14
# asm 2: fmuld <two=%f0,<f128=%f18,>2f128=%f26
fmuld %f0,%f18,%f26

# qhasm: 					2f150 = two * f150
# asm 1: fmuld <two=float64#1,<f150=float64#12,>2f150=float64#22
# asm 2: fmuld <two=%f0,<f150=%f22,>2f150=%f42
fmuld %f0,%f22,%f42

# qhasm: 						h64 += y
# asm 1: faddd <h64=float64#17,<y=float64#19,>h64=float64#17
# asm 2: faddd <h64=%f32,<y=%f36,>h64=%f32
faddd %f32,%f36,%f32

# qhasm: 					2f171 = two * f171
# asm 1: fmuld <two=float64#1,<f171=float64#13,>2f171=float64#19
# asm 2: fmuld <two=%f0,<f171=%f24,>2f171=%f36
fmuld %f0,%f24,%f36

# qhasm: 								*(float64 *) (h + 16) = h43
# asm 1: std <h43=float64#3,[<h=int64#1+16]
# asm 2: std <h43=%f4,[<h=%i0+16]
std %f4,[%i0+16]

# qhasm: 					h86 = 2f0 * f86
# asm 1: fmuld <2f0=float64#2,<f86=float64#6,>h86=float64#3
# asm 2: fmuld <2f0=%f2,<f86=%f10,>h86=%f4
fmuld %f2,%f10,%f4

# qhasm: 					x = 2f22 * f64
# asm 1: fmuld <2f22=float64#7,<f64=float64#5,>x=float64#23
# asm 2: fmuld <2f22=%f12,<f64=%f8,>x=%f44
fmuld %f12,%f8,%f44

# qhasm: 					y = f43 * f43
# asm 1: fmuld <f43=float64#4,<f43=float64#4,>y=float64#4
# asm 2: fmuld <f43=%f6,<f43=%f6,>y=%f6
fmuld %f6,%f6,%f6

# qhasm: 								*(float64 *) (h + 24) = h64
# asm 1: std <h64=float64#17,[<h=int64#1+24]
# asm 2: std <h64=%f32,[<h=%i0+24]
std %f32,[%i0+24]

# qhasm: 					2f192 = two * f192
# asm 1: fmuld <two=float64#1,<f192=float64#15,>2f192=float64#17
# asm 2: fmuld <two=%f0,<f192=%f28,>2f192=%f32
fmuld %f0,%f28,%f32

# qhasm: 					2f214 = two * f214
# asm 1: fmuld <two=float64#1,<f214=float64#16,>2f214=float64#1
# asm 2: fmuld <two=%f0,<f214=%f30,>2f214=%f0
fmuld %f0,%f30,%f0

# qhasm: 						h86 += x
# asm 1: faddd <h86=float64#3,<x=float64#23,>h86=float64#3
# asm 2: faddd <h86=%f4,<x=%f44,>h86=%f4
faddd %f4,%f44,%f4

# qhasm: 					h107 = 2f0 * f107
# asm 1: fmuld <2f0=float64#2,<f107=float64#8,>h107=float64#23
# asm 2: fmuld <2f0=%f2,<f107=%f14,>h107=%f44
fmuld %f2,%f14,%f44

# qhasm: 					z = 2f22 * f86
# asm 1: fmuld <2f22=float64#7,<f86=float64#6,>z=float64#24
# asm 2: fmuld <2f22=%f12,<f86=%f10,>z=%f46
fmuld %f12,%f10,%f46

# qhasm: 					w = 2f43 * f64
# asm 1: fmuld <2f43=float64#9,<f64=float64#5,>w=float64#25
# asm 2: fmuld <2f43=%f16,<f64=%f8,>w=%f48
fmuld %f16,%f8,%f48

# qhasm: 						h86 += y
# asm 1: faddd <h86=float64#3,<y=float64#4,>h86=float64#3
# asm 2: faddd <h86=%f4,<y=%f6,>h86=%f4
faddd %f4,%f6,%f4

# qhasm: 					h128 = 2f0 * f128
# asm 1: fmuld <2f0=float64#2,<f128=float64#10,>h128=float64#4
# asm 2: fmuld <2f0=%f2,<f128=%f18,>h128=%f6
fmuld %f2,%f18,%f6

# qhasm: 								*(float64 *) (h + 32) = h86
# asm 1: std <h86=float64#3,[<h=int64#1+32]
# asm 2: std <h86=%f4,[<h=%i0+32]
std %f4,[%i0+32]

# qhasm: 					x = 2f22 * f107
# asm 1: fmuld <2f22=float64#7,<f107=float64#8,>x=float64#3
# asm 2: fmuld <2f22=%f12,<f107=%f14,>x=%f4
fmuld %f12,%f14,%f4

# qhasm: 					y = 2f43 * f86
# asm 1: fmuld <2f43=float64#9,<f86=float64#6,>y=float64#26
# asm 2: fmuld <2f43=%f16,<f86=%f10,>y=%f50
fmuld %f16,%f10,%f50

# qhasm: 						h107 += z
# asm 1: faddd <h107=float64#23,<z=float64#24,>h107=float64#23
# asm 2: faddd <h107=%f44,<z=%f46,>h107=%f44
faddd %f44,%f46,%f44

# qhasm: 					v = f64 * f64
# asm 1: fmuld <f64=float64#5,<f64=float64#5,>v=float64#5
# asm 2: fmuld <f64=%f8,<f64=%f8,>v=%f8
fmuld %f8,%f8,%f8

# qhasm: 					h150 = 2f0 * f150
# asm 1: fmuld <2f0=float64#2,<f150=float64#12,>h150=float64#24
# asm 2: fmuld <2f0=%f2,<f150=%f22,>h150=%f46
fmuld %f2,%f22,%f46

# qhasm: 						h128 += x
# asm 1: faddd <h128=float64#4,<x=float64#3,>h128=float64#3
# asm 2: faddd <h128=%f6,<x=%f4,>h128=%f4
faddd %f6,%f4,%f4

# qhasm: 					u = 2f22 * f128
# asm 1: fmuld <2f22=float64#7,<f128=float64#10,>u=float64#4
# asm 2: fmuld <2f22=%f12,<f128=%f18,>u=%f6
fmuld %f12,%f18,%f6

# qhasm: 					z = 2f43 * f107
# asm 1: fmuld <2f43=float64#9,<f107=float64#8,>z=float64#27
# asm 2: fmuld <2f43=%f16,<f107=%f14,>z=%f52
fmuld %f16,%f14,%f52

# qhasm: 						h107 += w
# asm 1: faddd <h107=float64#23,<w=float64#25,>h107=float64#23
# asm 2: faddd <h107=%f44,<w=%f48,>h107=%f44
faddd %f44,%f48,%f44

# qhasm: 					t = 2f64 * f86
# asm 1: fmuld <2f64=float64#11,<f86=float64#6,>t=float64#25
# asm 2: fmuld <2f64=%f20,<f86=%f10,>t=%f48
fmuld %f20,%f10,%f48

# qhasm: 						y += v
# asm 1: faddd <y=float64#26,<v=float64#5,>y=float64#5
# asm 2: faddd <y=%f50,<v=%f8,>y=%f8
faddd %f50,%f8,%f8

# qhasm: 					h171 = 2f0 * f171
# asm 1: fmuld <2f0=float64#2,<f171=float64#13,>h171=float64#26
# asm 2: fmuld <2f0=%f2,<f171=%f24,>h171=%f50
fmuld %f2,%f24,%f50

# qhasm: 					x = 2f22 * f150
# asm 1: fmuld <2f22=float64#7,<f150=float64#12,>x=float64#28
# asm 2: fmuld <2f22=%f12,<f150=%f22,>x=%f54
fmuld %f12,%f22,%f54

# qhasm: 						h150 += u
# asm 1: faddd <h150=float64#24,<u=float64#4,>h150=float64#4
# asm 2: faddd <h150=%f46,<u=%f6,>h150=%f6
faddd %f46,%f6,%f6

# qhasm: 					s = 2f43 * f128
# asm 1: fmuld <2f43=float64#9,<f128=float64#10,>s=float64#24
# asm 2: fmuld <2f43=%f16,<f128=%f18,>s=%f46
fmuld %f16,%f18,%f46

# qhasm: 								*(float64 *) (h + 40) = h107
# asm 1: std <h107=float64#23,[<h=int64#1+40]
# asm 2: std <h107=%f44,[<h=%i0+40]
std %f44,[%i0+40]

# qhasm: 					v = 2f64 * f107
# asm 1: fmuld <2f64=float64#11,<f107=float64#8,>v=float64#23
# asm 2: fmuld <2f64=%f20,<f107=%f14,>v=%f44
fmuld %f20,%f14,%f44

# qhasm: 						h128 += y
# asm 1: faddd <h128=float64#3,<y=float64#5,>h128=float64#3
# asm 2: faddd <h128=%f4,<y=%f8,>h128=%f4
faddd %f4,%f8,%f4

# qhasm: 					w = f86 * f86
# asm 1: fmuld <f86=float64#6,<f86=float64#6,>w=float64#5
# asm 2: fmuld <f86=%f10,<f86=%f10,>w=%f8
fmuld %f10,%f10,%f8

# qhasm: 						z += t
# asm 1: faddd <z=float64#27,<t=float64#25,>z=float64#6
# asm 2: faddd <z=%f52,<t=%f48,>z=%f10
faddd %f52,%f48,%f10

# qhasm: 					h192 = 2f0 * f192
# asm 1: fmuld <2f0=float64#2,<f192=float64#15,>h192=float64#25
# asm 2: fmuld <2f0=%f2,<f192=%f28,>h192=%f48
fmuld %f2,%f28,%f48

# qhasm: 						h171 += x
# asm 1: faddd <h171=float64#26,<x=float64#28,>h171=float64#26
# asm 2: faddd <h171=%f50,<x=%f54,>h171=%f50
faddd %f50,%f54,%f50

# qhasm: 					u = 2f22 * f171
# asm 1: fmuld <2f22=float64#7,<f171=float64#13,>u=float64#27
# asm 2: fmuld <2f22=%f12,<f171=%f24,>u=%f52
fmuld %f12,%f24,%f52

# qhasm: 					y = 2f43 * f150
# asm 1: fmuld <2f43=float64#9,<f150=float64#12,>y=float64#28
# asm 2: fmuld <2f43=%f16,<f150=%f22,>y=%f54
fmuld %f16,%f22,%f54

# qhasm: 						s += v
# asm 1: faddd <s=float64#24,<v=float64#23,>s=float64#23
# asm 2: faddd <s=%f46,<v=%f44,>s=%f44
faddd %f46,%f44,%f44

# qhasm: 								*(float64 *) (h + 48) = h128
# asm 1: std <h128=float64#3,[<h=int64#1+48]
# asm 2: std <h128=%f4,[<h=%i0+48]
std %f4,[%i0+48]

# qhasm: 					t = 2f64 * f128
# asm 1: fmuld <2f64=float64#11,<f128=float64#10,>t=float64#3
# asm 2: fmuld <2f64=%f20,<f128=%f18,>t=%f4
fmuld %f20,%f18,%f4

# qhasm: 						h150 += z
# asm 1: faddd <h150=float64#4,<z=float64#6,>h150=float64#4
# asm 2: faddd <h150=%f6,<z=%f10,>h150=%f6
faddd %f6,%f10,%f6

# qhasm: 					x = 2f86 * f107
# asm 1: fmuld <2f86=float64#20,<f107=float64#8,>x=float64#6
# asm 2: fmuld <2f86=%f38,<f107=%f14,>x=%f10
fmuld %f38,%f14,%f10

# qhasm: 						h171 += w
# asm 1: faddd <h171=float64#26,<w=float64#5,>h171=float64#5
# asm 2: faddd <h171=%f50,<w=%f8,>h171=%f8
faddd %f50,%f8,%f8

# qhasm: 					h214 = 2f0 * f214
# asm 1: fmuld <2f0=float64#2,<f214=float64#16,>h214=float64#24
# asm 2: fmuld <2f0=%f2,<f214=%f30,>h214=%f46
fmuld %f2,%f30,%f46

# qhasm: 						h192 += u
# asm 1: faddd <h192=float64#25,<u=float64#27,>h192=float64#25
# asm 2: faddd <h192=%f48,<u=%f52,>h192=%f48
faddd %f48,%f52,%f48

# qhasm: 					v = 2f22 * f192
# asm 1: fmuld <2f22=float64#7,<f192=float64#15,>v=float64#26
# asm 2: fmuld <2f22=%f12,<f192=%f28,>v=%f50
fmuld %f12,%f28,%f50

# qhasm: 					z = 2f43 * f171
# asm 1: fmuld <2f43=float64#9,<f171=float64#13,>z=float64#27
# asm 2: fmuld <2f43=%f16,<f171=%f24,>z=%f52
fmuld %f16,%f24,%f52

# qhasm: 						y += t
# asm 1: faddd <y=float64#28,<t=float64#3,>y=float64#3
# asm 2: faddd <y=%f54,<t=%f4,>y=%f4
faddd %f54,%f4,%f4

# qhasm: 								*(float64 *) (h + 56) = h150
# asm 1: std <h150=float64#4,[<h=int64#1+56]
# asm 2: std <h150=%f6,[<h=%i0+56]
std %f6,[%i0+56]

# qhasm: 					w = 2f64 * f150
# asm 1: fmuld <2f64=float64#11,<f150=float64#12,>w=float64#4
# asm 2: fmuld <2f64=%f20,<f150=%f22,>w=%f6
fmuld %f20,%f22,%f6

# qhasm: 						h171 += s
# asm 1: faddd <h171=float64#5,<s=float64#23,>h171=float64#5
# asm 2: faddd <h171=%f8,<s=%f44,>h171=%f8
faddd %f8,%f44,%f8

# qhasm: 					u = 2f86 * f128
# asm 1: fmuld <2f86=float64#20,<f128=float64#10,>u=float64#23
# asm 2: fmuld <2f86=%f38,<f128=%f18,>u=%f44
fmuld %f38,%f18,%f44

# qhasm: 						h192 += x
# asm 1: faddd <h192=float64#25,<x=float64#6,>h192=float64#6
# asm 2: faddd <h192=%f48,<x=%f10,>h192=%f10
faddd %f48,%f10,%f10

# qhasm: 					r = f107 * f107
# asm 1: fmuld <f107=float64#8,<f107=float64#8,>r=float64#8
# asm 2: fmuld <f107=%f14,<f107=%f14,>r=%f14
fmuld %f14,%f14,%f14

# qhasm: 						h214 += v
# asm 1: faddd <h214=float64#24,<v=float64#26,>h214=float64#24
# asm 2: faddd <h214=%f46,<v=%f50,>h214=%f46
faddd %f46,%f50,%f46

# qhasm: 					h235 = 2f0 * f235
# asm 1: fmuld <2f0=float64#2,<f235=float64#18,>h235=float64#2
# asm 2: fmuld <2f0=%f2,<f235=%f34,>h235=%f2
fmuld %f2,%f34,%f2

# qhasm: 					t = 2f22 * f214
# asm 1: fmuld <2f22=float64#7,<f214=float64#16,>t=float64#25
# asm 2: fmuld <2f22=%f12,<f214=%f30,>t=%f48
fmuld %f12,%f30,%f48

# qhasm: 						z += w
# asm 1: faddd <z=float64#27,<w=float64#4,>z=float64#4
# asm 2: faddd <z=%f52,<w=%f6,>z=%f6
faddd %f52,%f6,%f6

# qhasm: 								*(float64 *) (h + 64) = h171
# asm 1: std <h171=float64#5,[<h=int64#1+64]
# asm 2: std <h171=%f8,[<h=%i0+64]
std %f8,[%i0+64]

# qhasm: 					s = 2f43 * f192
# asm 1: fmuld <2f43=float64#9,<f192=float64#15,>s=float64#5
# asm 2: fmuld <2f43=%f16,<f192=%f28,>s=%f8
fmuld %f16,%f28,%f8

# qhasm: 						h192 += y
# asm 1: faddd <h192=float64#6,<y=float64#3,>h192=float64#3
# asm 2: faddd <h192=%f10,<y=%f4,>h192=%f4
faddd %f10,%f4,%f4

# qhasm: 					x = 2f64 * f171
# asm 1: fmuld <2f64=float64#11,<f171=float64#13,>x=float64#6
# asm 2: fmuld <2f64=%f20,<f171=%f24,>x=%f10
fmuld %f20,%f24,%f10

# qhasm: 						u += r
# asm 1: faddd <u=float64#23,<r=float64#8,>u=float64#8
# asm 2: faddd <u=%f44,<r=%f14,>u=%f14
faddd %f44,%f14,%f14

# qhasm: 					v = 2f86 * f150
# asm 1: fmuld <2f86=float64#20,<f150=float64#12,>v=float64#23
# asm 2: fmuld <2f86=%f38,<f150=%f22,>v=%f44
fmuld %f38,%f22,%f44

# qhasm: 					w = 2f107 * f128
# asm 1: fmuld <2f107=float64#21,<f128=float64#10,>w=float64#26
# asm 2: fmuld <2f107=%f40,<f128=%f18,>w=%f50
fmuld %f40,%f18,%f50

# qhasm: 						h214 += z
# asm 1: faddd <h214=float64#24,<z=float64#4,>h214=float64#4
# asm 2: faddd <h214=%f46,<z=%f6,>h214=%f6
faddd %f46,%f6,%f6

# qhasm: 					h256 = 2f22 * f235
# asm 1: fmuld <2f22=float64#7,<f235=float64#18,>h256=float64#7
# asm 2: fmuld <2f22=%f12,<f235=%f34,>h256=%f12
fmuld %f12,%f34,%f12

# qhasm: 						h235 += t
# asm 1: faddd <h235=float64#2,<t=float64#25,>h235=float64#2
# asm 2: faddd <h235=%f2,<t=%f48,>h235=%f2
faddd %f2,%f48,%f2

# qhasm: 								*(float64 *) (h + 72) = h192
# asm 1: std <h192=float64#3,[<h=int64#1+72]
# asm 2: std <h192=%f4,[<h=%i0+72]
std %f4,[%i0+72]

# qhasm: 					r = 2f43 * f214
# asm 1: fmuld <2f43=float64#9,<f214=float64#16,>r=float64#3
# asm 2: fmuld <2f43=%f16,<f214=%f30,>r=%f4
fmuld %f16,%f30,%f4

# qhasm: 						s += x
# asm 1: faddd <s=float64#5,<x=float64#6,>s=float64#5
# asm 2: faddd <s=%f8,<x=%f10,>s=%f8
faddd %f8,%f10,%f8

# qhasm: 					y = 2f64 * f192
# asm 1: fmuld <2f64=float64#11,<f192=float64#15,>y=float64#6
# asm 2: fmuld <2f64=%f20,<f192=%f28,>y=%f10
fmuld %f20,%f28,%f10

# qhasm: 					z = 2f86 * f171
# asm 1: fmuld <2f86=float64#20,<f171=float64#13,>z=float64#24
# asm 2: fmuld <2f86=%f38,<f171=%f24,>z=%f46
fmuld %f38,%f24,%f46

# qhasm: 						h214 += u
# asm 1: faddd <h214=float64#4,<u=float64#8,>h214=float64#4
# asm 2: faddd <h214=%f6,<u=%f14,>h214=%f6
faddd %f6,%f14,%f6

# qhasm: 					t = 2f107 * f150
# asm 1: fmuld <2f107=float64#21,<f150=float64#12,>t=float64#8
# asm 2: fmuld <2f107=%f40,<f150=%f22,>t=%f14
fmuld %f40,%f22,%f14

# qhasm: 						v += w
# asm 1: faddd <v=float64#23,<w=float64#26,>v=float64#23
# asm 2: faddd <v=%f44,<w=%f50,>v=%f44
faddd %f44,%f50,%f44

# qhasm: 					x = f128 * f128
# asm 1: fmuld <f128=float64#10,<f128=float64#10,>x=float64#10
# asm 2: fmuld <f128=%f18,<f128=%f18,>x=%f18
fmuld %f18,%f18,%f18

# qhasm: 						h235 += s
# asm 1: faddd <h235=float64#2,<s=float64#5,>h235=float64#2
# asm 2: faddd <h235=%f2,<s=%f8,>h235=%f2
faddd %f2,%f8,%f2

# qhasm: 					h278 = 2f43 * f235
# asm 1: fmuld <2f43=float64#9,<f235=float64#18,>h278=float64#5
# asm 2: fmuld <2f43=%f16,<f235=%f34,>h278=%f8
fmuld %f16,%f34,%f8

# qhasm: 						h256 += r
# asm 1: faddd <h256=float64#7,<r=float64#3,>h256=float64#3
# asm 2: faddd <h256=%f12,<r=%f4,>h256=%f4
faddd %f12,%f4,%f4

# qhasm: 					u = 2f64 * f214
# asm 1: fmuld <2f64=float64#11,<f214=float64#16,>u=float64#7
# asm 2: fmuld <2f64=%f20,<f214=%f30,>u=%f12
fmuld %f20,%f30,%f12

# qhasm: 						y += z
# asm 1: faddd <y=float64#6,<z=float64#24,>y=float64#6
# asm 2: faddd <y=%f10,<z=%f46,>y=%f10
faddd %f10,%f46,%f10

# qhasm: 								*(float64 *) (h + 80) = h214
# asm 1: std <h214=float64#4,[<h=int64#1+80]
# asm 2: std <h214=%f6,[<h=%i0+80]
std %f6,[%i0+80]

# qhasm: 					w = 2f86 * f192
# asm 1: fmuld <2f86=float64#20,<f192=float64#15,>w=float64#4
# asm 2: fmuld <2f86=%f38,<f192=%f28,>w=%f6
fmuld %f38,%f28,%f6

# qhasm: 					s = 2f107 * f171
# asm 1: fmuld <2f107=float64#21,<f171=float64#13,>s=float64#9
# asm 2: fmuld <2f107=%f40,<f171=%f24,>s=%f16
fmuld %f40,%f24,%f16

# qhasm: 						h235 += v
# asm 1: faddd <h235=float64#2,<v=float64#23,>h235=float64#2
# asm 2: faddd <h235=%f2,<v=%f44,>h235=%f2
faddd %f2,%f44,%f2

# qhasm: 					r = 2f128 * f150
# asm 1: fmuld <2f128=float64#14,<f150=float64#12,>r=float64#23
# asm 2: fmuld <2f128=%f26,<f150=%f22,>r=%f44
fmuld %f26,%f22,%f44

# qhasm: 						t += x
# asm 1: faddd <t=float64#8,<x=float64#10,>t=float64#8
# asm 2: faddd <t=%f14,<x=%f18,>t=%f14
faddd %f14,%f18,%f14

# qhasm: 					h299 = 2f64 * f235
# asm 1: fmuld <2f64=float64#11,<f235=float64#18,>h299=float64#10
# asm 2: fmuld <2f64=%f20,<f235=%f34,>h299=%f18
fmuld %f20,%f34,%f18

# qhasm: 						h256 += y
# asm 1: faddd <h256=float64#3,<y=float64#6,>h256=float64#3
# asm 2: faddd <h256=%f4,<y=%f10,>h256=%f4
faddd %f4,%f10,%f4

# qhasm: 					z = 2f86 * f214
# asm 1: fmuld <2f86=float64#20,<f214=float64#16,>z=float64#6
# asm 2: fmuld <2f86=%f38,<f214=%f30,>z=%f10
fmuld %f38,%f30,%f10

# qhasm: 						h278 += u
# asm 1: faddd <h278=float64#5,<u=float64#7,>h278=float64#5
# asm 2: faddd <h278=%f8,<u=%f12,>h278=%f8
faddd %f8,%f12,%f8

# qhasm: 					v = 2f107 * f192
# asm 1: fmuld <2f107=float64#21,<f192=float64#15,>v=float64#7
# asm 2: fmuld <2f107=%f40,<f192=%f28,>v=%f12
fmuld %f40,%f28,%f12

# qhasm: 						w += s
# asm 1: faddd <w=float64#4,<s=float64#9,>w=float64#4
# asm 2: faddd <w=%f6,<s=%f16,>w=%f6
faddd %f6,%f16,%f6

# qhasm: 								*(float64 *) (h + 88) = h235
# asm 1: std <h235=float64#2,[<h=int64#1+88]
# asm 2: std <h235=%f2,[<h=%i0+88]
std %f2,[%i0+88]

# qhasm: 					x = 2f128 * f171
# asm 1: fmuld <2f128=float64#14,<f171=float64#13,>x=float64#2
# asm 2: fmuld <2f128=%f26,<f171=%f24,>x=%f2
fmuld %f26,%f24,%f2

# qhasm: 					y = f150 * f150
# asm 1: fmuld <f150=float64#12,<f150=float64#12,>y=float64#9
# asm 2: fmuld <f150=%f22,<f150=%f22,>y=%f16
fmuld %f22,%f22,%f16

# qhasm: 						h256 += t
# asm 1: faddd <h256=float64#3,<t=float64#8,>h256=float64#3
# asm 2: faddd <h256=%f4,<t=%f14,>h256=%f4
faddd %f4,%f14,%f4

# qhasm: 					h320 = 2f86 * f235
# asm 1: fmuld <2f86=float64#20,<f235=float64#18,>h320=float64#8
# asm 2: fmuld <2f86=%f38,<f235=%f34,>h320=%f14
fmuld %f38,%f34,%f14

# qhasm: 						h278 += r
# asm 1: faddd <h278=float64#5,<r=float64#23,>h278=float64#5
# asm 2: faddd <h278=%f8,<r=%f44,>h278=%f8
faddd %f8,%f44,%f8

# qhasm: 					u = 2f107 * f214
# asm 1: fmuld <2f107=float64#21,<f214=float64#16,>u=float64#11
# asm 2: fmuld <2f107=%f40,<f214=%f30,>u=%f20
fmuld %f40,%f30,%f20

# qhasm: 						h299 += z
# asm 1: faddd <h299=float64#10,<z=float64#6,>h299=float64#6
# asm 2: faddd <h299=%f18,<z=%f10,>h299=%f10
faddd %f18,%f10,%f10

# qhasm: 					s = 2f128 * f192
# asm 1: fmuld <2f128=float64#14,<f192=float64#15,>s=float64#10
# asm 2: fmuld <2f128=%f26,<f192=%f28,>s=%f18
fmuld %f26,%f28,%f18

# qhasm: 						v += x
# asm 1: faddd <v=float64#7,<x=float64#2,>v=float64#2
# asm 2: faddd <v=%f12,<x=%f2,>v=%f2
faddd %f12,%f2,%f2

# qhasm: 					t = 2f150 * f171
# asm 1: fmuld <2f150=float64#22,<f171=float64#13,>t=float64#7
# asm 2: fmuld <2f150=%f42,<f171=%f24,>t=%f12
fmuld %f42,%f24,%f12

# qhasm: 								*(float64 *) (h + 96) = h256
# asm 1: std <h256=float64#3,[<h=int64#1+96]
# asm 2: std <h256=%f4,[<h=%i0+96]
std %f4,[%i0+96]

# qhasm: 					h342 = 2f107 * f235
# asm 1: fmuld <2f107=float64#21,<f235=float64#18,>h342=float64#3
# asm 2: fmuld <2f107=%f40,<f235=%f34,>h342=%f4
fmuld %f40,%f34,%f4

# qhasm: 						h278 += w
# asm 1: faddd <h278=float64#5,<w=float64#4,>h278=float64#4
# asm 2: faddd <h278=%f8,<w=%f6,>h278=%f6
faddd %f8,%f6,%f6

# qhasm: 					r = 2f128 * f214
# asm 1: fmuld <2f128=float64#14,<f214=float64#16,>r=float64#5
# asm 2: fmuld <2f128=%f26,<f214=%f30,>r=%f8
fmuld %f26,%f30,%f8

# qhasm: 						h299 += y
# asm 1: faddd <h299=float64#6,<y=float64#9,>h299=float64#6
# asm 2: faddd <h299=%f10,<y=%f16,>h299=%f10
faddd %f10,%f16,%f10

# qhasm: 					z = 2f150 * f192
# asm 1: fmuld <2f150=float64#22,<f192=float64#15,>z=float64#9
# asm 2: fmuld <2f150=%f42,<f192=%f28,>z=%f16
fmuld %f42,%f28,%f16

# qhasm: 						h320 += u
# asm 1: faddd <h320=float64#8,<u=float64#11,>h320=float64#8
# asm 2: faddd <h320=%f14,<u=%f20,>h320=%f14
faddd %f14,%f20,%f14

# qhasm: 					x = f171 * f171
# asm 1: fmuld <f171=float64#13,<f171=float64#13,>x=float64#11
# asm 2: fmuld <f171=%f24,<f171=%f24,>x=%f20
fmuld %f24,%f24,%f20

# qhasm: 						s += t
# asm 1: faddd <s=float64#10,<t=float64#7,>s=float64#7
# asm 2: faddd <s=%f18,<t=%f12,>s=%f12
faddd %f18,%f12,%f12

# qhasm: 					h363 = 2f128 * f235
# asm 1: fmuld <2f128=float64#14,<f235=float64#18,>h363=float64#10
# asm 2: fmuld <2f128=%f26,<f235=%f34,>h363=%f18
fmuld %f26,%f34,%f18

# qhasm: 								*(float64 *) (h + 104) = h278
# asm 1: std <h278=float64#4,[<h=int64#1+104]
# asm 2: std <h278=%f6,[<h=%i0+104]
std %f6,[%i0+104]

# qhasm: 					w = 2f150 * f214
# asm 1: fmuld <2f150=float64#22,<f214=float64#16,>w=float64#4
# asm 2: fmuld <2f150=%f42,<f214=%f30,>w=%f6
fmuld %f42,%f30,%f6

# qhasm: 						h299 += v
# asm 1: faddd <h299=float64#6,<v=float64#2,>h299=float64#2
# asm 2: faddd <h299=%f10,<v=%f2,>h299=%f2
faddd %f10,%f2,%f2

# qhasm: 					y = 2f171 * f192
# asm 1: fmuld <2f171=float64#19,<f192=float64#15,>y=float64#6
# asm 2: fmuld <2f171=%f36,<f192=%f28,>y=%f10
fmuld %f36,%f28,%f10

# qhasm: 						h342 += r
# asm 1: faddd <h342=float64#3,<r=float64#5,>h342=float64#3
# asm 2: faddd <h342=%f4,<r=%f8,>h342=%f4
faddd %f4,%f8,%f4

# qhasm: 					h384 = 2f150 * f235
# asm 1: fmuld <2f150=float64#22,<f235=float64#18,>h384=float64#5
# asm 2: fmuld <2f150=%f42,<f235=%f34,>h384=%f8
fmuld %f42,%f34,%f8

# qhasm: 						h320 += s
# asm 1: faddd <h320=float64#8,<s=float64#7,>h320=float64#7
# asm 2: faddd <h320=%f14,<s=%f12,>h320=%f12
faddd %f14,%f12,%f12

# qhasm: 					u = 2f171 * f214
# asm 1: fmuld <2f171=float64#19,<f214=float64#16,>u=float64#8
# asm 2: fmuld <2f171=%f36,<f214=%f30,>u=%f14
fmuld %f36,%f30,%f14

# qhasm: 						z += x
# asm 1: faddd <z=float64#9,<x=float64#11,>z=float64#9
# asm 2: faddd <z=%f16,<x=%f20,>z=%f16
faddd %f16,%f20,%f16

# qhasm: 					t = f192 * f192
# asm 1: fmuld <f192=float64#15,<f192=float64#15,>t=float64#11
# asm 2: fmuld <f192=%f28,<f192=%f28,>t=%f20
fmuld %f28,%f28,%f20

# qhasm: 						h363 += w
# asm 1: faddd <h363=float64#10,<w=float64#4,>h363=float64#4
# asm 2: faddd <h363=%f18,<w=%f6,>h363=%f6
faddd %f18,%f6,%f6

# qhasm: 								*(float64 *) (h + 112) = h299
# asm 1: std <h299=float64#2,[<h=int64#1+112]
# asm 2: std <h299=%f2,[<h=%i0+112]
std %f2,[%i0+112]

# qhasm: 					h406 = 2f171 * f235
# asm 1: fmuld <2f171=float64#19,<f235=float64#18,>h406=float64#2
# asm 2: fmuld <2f171=%f36,<f235=%f34,>h406=%f2
fmuld %f36,%f34,%f2

# qhasm: 					s = 2f192 * f214
# asm 1: fmuld <2f192=float64#17,<f214=float64#16,>s=float64#10
# asm 2: fmuld <2f192=%f32,<f214=%f30,>s=%f18
fmuld %f32,%f30,%f18

# qhasm: 								*(float64 *) (h + 120) = h320
# asm 1: std <h320=float64#7,[<h=int64#1+120]
# asm 2: std <h320=%f12,[<h=%i0+120]
std %f12,[%i0+120]

# qhasm: 					h427 = 2f192 * f235
# asm 1: fmuld <2f192=float64#17,<f235=float64#18,>h427=float64#7
# asm 2: fmuld <2f192=%f32,<f235=%f34,>h427=%f12
fmuld %f32,%f34,%f12

# qhasm: 						h342 += z
# asm 1: faddd <h342=float64#3,<z=float64#9,>h342=float64#3
# asm 2: faddd <h342=%f4,<z=%f16,>h342=%f4
faddd %f4,%f16,%f4

# qhasm: 					x = f214 * f214
# asm 1: fmuld <f214=float64#16,<f214=float64#16,>x=float64#9
# asm 2: fmuld <f214=%f30,<f214=%f30,>x=%f16
fmuld %f30,%f30,%f16

# qhasm: 						h363 += y
# asm 1: faddd <h363=float64#4,<y=float64#6,>h363=float64#4
# asm 2: faddd <h363=%f6,<y=%f10,>h363=%f6
faddd %f6,%f10,%f6

# qhasm: 					h448 = 2f214 * f235
# asm 1: fmuld <2f214=float64#1,<f235=float64#18,>h448=float64#1
# asm 2: fmuld <2f214=%f0,<f235=%f34,>h448=%f0
fmuld %f0,%f34,%f0

# qhasm: 						h384 += u
# asm 1: faddd <h384=float64#5,<u=float64#8,>h384=float64#5
# asm 2: faddd <h384=%f8,<u=%f14,>h384=%f8
faddd %f8,%f14,%f8

# qhasm: 					h470 = f235 * f235
# asm 1: fmuld <f235=float64#18,<f235=float64#18,>h470=float64#6
# asm 2: fmuld <f235=%f34,<f235=%f34,>h470=%f10
fmuld %f34,%f34,%f10

# qhasm: 						h406 += s
# asm 1: faddd <h406=float64#2,<s=float64#10,>h406=float64#2
# asm 2: faddd <h406=%f2,<s=%f18,>h406=%f2
faddd %f2,%f18,%f2

# qhasm: 								*(float64 *) (h + 128) = h342
# asm 1: std <h342=float64#3,[<h=int64#1+128]
# asm 2: std <h342=%f4,[<h=%i0+128]
std %f4,[%i0+128]

# qhasm: 						h384 += t
# asm 1: faddd <h384=float64#5,<t=float64#11,>h384=float64#3
# asm 2: faddd <h384=%f8,<t=%f20,>h384=%f4
faddd %f8,%f20,%f4

# qhasm: 								*(float64 *) (h + 136) = h363
# asm 1: std <h363=float64#4,[<h=int64#1+136]
# asm 2: std <h363=%f6,[<h=%i0+136]
std %f6,[%i0+136]

# qhasm: 						h427 += x
# asm 1: faddd <h427=float64#7,<x=float64#9,>h427=float64#4
# asm 2: faddd <h427=%f12,<x=%f16,>h427=%f6
faddd %f12,%f16,%f6

# qhasm: 								*(float64 *) (h + 168) = h448
# asm 1: std <h448=float64#1,[<h=int64#1+168]
# asm 2: std <h448=%f0,[<h=%i0+168]
std %f0,[%i0+168]

# qhasm: 								*(float64 *) (h + 152) = h406
# asm 1: std <h406=float64#2,[<h=int64#1+152]
# asm 2: std <h406=%f2,[<h=%i0+152]
std %f2,[%i0+152]

# qhasm: 								*(float64 *) (h + 144) = h384
# asm 1: std <h384=float64#3,[<h=int64#1+144]
# asm 2: std <h384=%f4,[<h=%i0+144]
std %f4,[%i0+144]

# qhasm: 								*(float64 *) (h + 160) = h427
# asm 1: std <h427=float64#4,[<h=int64#1+160]
# asm 2: std <h427=%f6,[<h=%i0+160]
std %f6,[%i0+160]

# qhasm: 								*(float64 *) (h + 176) = h470
# asm 1: std <h470=float64#6,[<h=int64#1+176]
# asm 2: std <h470=%f10,[<h=%i0+176]
std %f10,[%i0+176]

# qhasm: leave
ret
restore
