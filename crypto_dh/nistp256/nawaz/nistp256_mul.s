
# qhasm: enter nistp256_mul
.section ".text"
.align 32
.global nistp256_mul
nistp256_mul:
save %sp,-176,%sp

# qhasm: int64 h

# qhasm: int64 f

# qhasm: int64 g

# qhasm: input h

# qhasm: input f

# qhasm: input g

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

# qhasm: float64 g0

# qhasm: float64 g22

# qhasm: float64 g43

# qhasm: float64 g64

# qhasm: float64 g86

# qhasm: float64 g107

# qhasm: float64 g128

# qhasm: float64 g150

# qhasm: float64 g171

# qhasm: float64 g192

# qhasm: float64 g214

# qhasm: float64 g235

# qhasm: float64 f22g0

# qhasm: float64 f22g22

# qhasm: float64 f43g0

# qhasm: float64 f22g43

# qhasm: float64 f43g22

# qhasm: float64 f64g0

# qhasm: float64 f22g64

# qhasm: float64 f43g43

# qhasm: float64 f64g22

# qhasm: float64 f86g0

# qhasm: float64 f22g86

# qhasm: float64 f43g64

# qhasm: float64 f64g43

# qhasm: float64 f86g22

# qhasm: float64 f107g0

# qhasm: float64 f22g107

# qhasm: float64 f43g86

# qhasm: float64 f64g64

# qhasm: float64 f86g43

# qhasm: float64 f107g22

# qhasm: float64 f128g0

# qhasm: float64 f22g128

# qhasm: float64 f43g107

# qhasm: float64 f64g86

# qhasm: float64 f86g64

# qhasm: float64 f107g43

# qhasm: float64 f128g22

# qhasm: float64 f150g0

# qhasm: float64 f22g150

# qhasm: float64 f43g128

# qhasm: float64 f64g107

# qhasm: float64 f86g86

# qhasm: float64 f107g64

# qhasm: float64 f128g43

# qhasm: float64 f150g22

# qhasm: float64 f171g0

# qhasm: float64 f22g171

# qhasm: float64 f43g150

# qhasm: float64 f64g128

# qhasm: float64 f86g107

# qhasm: float64 f107g86

# qhasm: float64 f128g64

# qhasm: float64 f150g43

# qhasm: float64 f171g22

# qhasm: float64 f192g0

# qhasm: float64 f22g192

# qhasm: float64 f43g171

# qhasm: float64 f64g150

# qhasm: float64 f86g128

# qhasm: float64 f107g107

# qhasm: float64 f128g86

# qhasm: float64 f150g64

# qhasm: float64 f171g43

# qhasm: float64 f192g22

# qhasm: float64 f214g0

# qhasm: float64 f22g214

# qhasm: float64 f43g192

# qhasm: float64 f64g171

# qhasm: float64 f86g150

# qhasm: float64 f107g128

# qhasm: float64 f128g107

# qhasm: float64 f150g86

# qhasm: float64 f171g64

# qhasm: float64 f192g43

# qhasm: float64 f214g22

# qhasm: float64 f235g0

# qhasm: float64 f43g214

# qhasm: float64 f64g192

# qhasm: float64 f86g171

# qhasm: float64 f107g150

# qhasm: float64 f128g128

# qhasm: float64 f150g107

# qhasm: float64 f171g86

# qhasm: float64 f192g64

# qhasm: float64 f214g43

# qhasm: float64 f235g22

# qhasm: float64 f64g214

# qhasm: float64 f86g192

# qhasm: float64 f107g171

# qhasm: float64 f128g150

# qhasm: float64 f150g128

# qhasm: float64 f171g107

# qhasm: float64 f192g86

# qhasm: float64 f214g64

# qhasm: float64 f235g43

# qhasm: float64 f86g214

# qhasm: float64 f107g192

# qhasm: float64 f128g171

# qhasm: float64 f150g150

# qhasm: float64 f171g128

# qhasm: float64 f192g107

# qhasm: float64 f214g86

# qhasm: float64 f235g64

# qhasm: float64 f107g214

# qhasm: float64 f128g192

# qhasm: float64 f150g171

# qhasm: float64 f171g150

# qhasm: float64 f192g128

# qhasm: float64 f214g107

# qhasm: float64 f235g86

# qhasm: float64 f128g214

# qhasm: float64 f150g192

# qhasm: float64 f171g171

# qhasm: float64 f192g150

# qhasm: float64 f214g128

# qhasm: float64 f235g107

# qhasm: float64 f150g214

# qhasm: float64 f171g192

# qhasm: float64 f192g171

# qhasm: float64 f214g150

# qhasm: float64 f235g128

# qhasm: float64 f171g214

# qhasm: float64 f192g192

# qhasm: float64 f214g171

# qhasm: float64 f235g150

# qhasm: float64 f192g214

# qhasm: float64 f214g192

# qhasm: float64 f235g171

# qhasm: float64 f214g214

# qhasm: float64 f235g192

# qhasm: float64 f235g214

# qhasm: float64 i1

# qhasm: float64 i2

# qhasm: float64 i3

# qhasm: float64 i4

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

# qhasm: f0 = *(float64 *) (f + 0)
# asm 1: ldd [<f=int64#2+0],>f0=float64#1
# asm 2: ldd [<f=%i1+0],>f0=%f0
ldd [%i1+0],%f0

# qhasm: g0 = *(float64 *) (g + 0)
# asm 1: ldd [<g=int64#3+0],>g0=float64#2
# asm 2: ldd [<g=%i2+0],>g0=%f2
ldd [%i2+0],%f2

# qhasm: f22 = *(float64 *) (f + 8)
# asm 1: ldd [<f=int64#2+8],>f22=float64#3
# asm 2: ldd [<f=%i1+8],>f22=%f4
ldd [%i1+8],%f4

# qhasm: g22 = *(float64 *) (g + 8)
# asm 1: ldd [<g=int64#3+8],>g22=float64#4
# asm 2: ldd [<g=%i2+8],>g22=%f6
ldd [%i2+8],%f6

# qhasm: 				h0 = f0 * g0
# asm 1: fmuld <f0=float64#1,<g0=float64#2,>h0=float64#5
# asm 2: fmuld <f0=%f0,<g0=%f2,>h0=%f8
fmuld %f0,%f2,%f8

# qhasm: f43 = *(float64 *) (f + 16)
# asm 1: ldd [<f=int64#2+16],>f43=float64#6
# asm 2: ldd [<f=%i1+16],>f43=%f10
ldd [%i1+16],%f10

# qhasm: 				h22 = f0 * g22
# asm 1: fmuld <f0=float64#1,<g22=float64#4,>h22=float64#7
# asm 2: fmuld <f0=%f0,<g22=%f6,>h22=%f12
fmuld %f0,%f6,%f12

# qhasm: g43 = *(float64 *) (g + 16)
# asm 1: ldd [<g=int64#3+16],>g43=float64#8
# asm 2: ldd [<g=%i2+16],>g43=%f14
ldd [%i2+16],%f14

# qhasm: 				f22g0 = f22 * g0
# asm 1: fmuld <f22=float64#3,<g0=float64#2,>f22g0=float64#9
# asm 2: fmuld <f22=%f4,<g0=%f2,>f22g0=%f16
fmuld %f4,%f2,%f16

# qhasm: f64 = *(float64 *) (f + 24)
# asm 1: ldd [<f=int64#2+24],>f64=float64#10
# asm 2: ldd [<f=%i1+24],>f64=%f18
ldd [%i1+24],%f18

# qhasm: 				h43 = f0 * g43
# asm 1: fmuld <f0=float64#1,<g43=float64#8,>h43=float64#11
# asm 2: fmuld <f0=%f0,<g43=%f14,>h43=%f20
fmuld %f0,%f14,%f20

# qhasm: g64 = *(float64 *) (g + 24)
# asm 1: ldd [<g=int64#3+24],>g64=float64#12
# asm 2: ldd [<g=%i2+24],>g64=%f22
ldd [%i2+24],%f22

# qhasm: 				f22g22 = f22 * g22
# asm 1: fmuld <f22=float64#3,<g22=float64#4,>f22g22=float64#13
# asm 2: fmuld <f22=%f4,<g22=%f6,>f22g22=%f24
fmuld %f4,%f6,%f24

# qhasm: f86 = *(float64 *) (f + 32)
# asm 1: ldd [<f=int64#2+32],>f86=float64#14
# asm 2: ldd [<f=%i1+32],>f86=%f26
ldd [%i1+32],%f26

# qhasm: 				f43g0 = f43 * g0
# asm 1: fmuld <f43=float64#6,<g0=float64#2,>f43g0=float64#15
# asm 2: fmuld <f43=%f10,<g0=%f2,>f43g0=%f28
fmuld %f10,%f2,%f28

# qhasm: 							*(float64 *) (h + 0) = h0
# asm 1: std <h0=float64#5,[<h=int64#1+0]
# asm 2: std <h0=%f8,[<h=%i0+0]
std %f8,[%i0+0]

# qhasm: g86 = *(float64 *) (g + 32)
# asm 1: ldd [<g=int64#3+32],>g86=float64#5
# asm 2: ldd [<g=%i2+32],>g86=%f8
ldd [%i2+32],%f8

# qhasm: 				h64 = f0 * g64
# asm 1: fmuld <f0=float64#1,<g64=float64#12,>h64=float64#16
# asm 2: fmuld <f0=%f0,<g64=%f22,>h64=%f30
fmuld %f0,%f22,%f30

# qhasm: 					h22 += f22g0
# asm 1: faddd <h22=float64#7,<f22g0=float64#9,>h22=float64#7
# asm 2: faddd <h22=%f12,<f22g0=%f16,>h22=%f12
faddd %f12,%f16,%f12

# qhasm: 				f22g43 = f22 * g43
# asm 1: fmuld <f22=float64#3,<g43=float64#8,>f22g43=float64#9
# asm 2: fmuld <f22=%f4,<g43=%f14,>f22g43=%f16
fmuld %f4,%f14,%f16

# qhasm: 				f43g22 = f43 * g22
# asm 1: fmuld <f43=float64#6,<g22=float64#4,>f43g22=float64#17
# asm 2: fmuld <f43=%f10,<g22=%f6,>f43g22=%f32
fmuld %f10,%f6,%f32

# qhasm: 					h43 += f22g22
# asm 1: faddd <h43=float64#11,<f22g22=float64#13,>h43=float64#11
# asm 2: faddd <h43=%f20,<f22g22=%f24,>h43=%f20
faddd %f20,%f24,%f20

# qhasm: 				f64g0 = f64 * g0
# asm 1: fmuld <f64=float64#10,<g0=float64#2,>f64g0=float64#13
# asm 2: fmuld <f64=%f18,<g0=%f2,>f64g0=%f24
fmuld %f18,%f2,%f24

# qhasm: f107 = *(float64 *) (f + 40)
# asm 1: ldd [<f=int64#2+40],>f107=float64#18
# asm 2: ldd [<f=%i1+40],>f107=%f34
ldd [%i1+40],%f34

# qhasm: 				h86 = f0 * g86
# asm 1: fmuld <f0=float64#1,<g86=float64#5,>h86=float64#19
# asm 2: fmuld <f0=%f0,<g86=%f8,>h86=%f36
fmuld %f0,%f8,%f36

# qhasm: 							*(float64 *) (h + 8) = h22
# asm 1: std <h22=float64#7,[<h=int64#1+8]
# asm 2: std <h22=%f12,[<h=%i0+8]
std %f12,[%i0+8]

# qhasm: g107 = *(float64 *) (g + 40)
# asm 1: ldd [<g=int64#3+40],>g107=float64#7
# asm 2: ldd [<g=%i2+40],>g107=%f12
ldd [%i2+40],%f12

# qhasm: 				f22g64 = f22 * g64
# asm 1: fmuld <f22=float64#3,<g64=float64#12,>f22g64=float64#20
# asm 2: fmuld <f22=%f4,<g64=%f22,>f22g64=%f38
fmuld %f4,%f22,%f38

# qhasm: 					h64 += f22g43
# asm 1: faddd <h64=float64#16,<f22g43=float64#9,>h64=float64#9
# asm 2: faddd <h64=%f30,<f22g43=%f16,>h64=%f16
faddd %f30,%f16,%f16

# qhasm: 				f43g43 = f43 * g43
# asm 1: fmuld <f43=float64#6,<g43=float64#8,>f43g43=float64#16
# asm 2: fmuld <f43=%f10,<g43=%f14,>f43g43=%f30
fmuld %f10,%f14,%f30

# qhasm: 					h43 += f43g0
# asm 1: faddd <h43=float64#11,<f43g0=float64#15,>h43=float64#11
# asm 2: faddd <h43=%f20,<f43g0=%f28,>h43=%f20
faddd %f20,%f28,%f20

# qhasm: 				f64g22 = f64 * g22
# asm 1: fmuld <f64=float64#10,<g22=float64#4,>f64g22=float64#15
# asm 2: fmuld <f64=%f18,<g22=%f6,>f64g22=%f28
fmuld %f18,%f6,%f28

# qhasm: 					i1 = f43g22 + f64g0
# asm 1: faddd <f43g22=float64#17,<f64g0=float64#13,>i1=float64#13
# asm 2: faddd <f43g22=%f32,<f64g0=%f24,>i1=%f24
faddd %f32,%f24,%f24

# qhasm: 				f86g0 = f86 * g0
# asm 1: fmuld <f86=float64#14,<g0=float64#2,>f86g0=float64#17
# asm 2: fmuld <f86=%f26,<g0=%f2,>f86g0=%f32
fmuld %f26,%f2,%f32

# qhasm: 				h107 = f0 * g107
# asm 1: fmuld <f0=float64#1,<g107=float64#7,>h107=float64#21
# asm 2: fmuld <f0=%f0,<g107=%f12,>h107=%f40
fmuld %f0,%f12,%f40

# qhasm: 					h86 += f22g64
# asm 1: faddd <h86=float64#19,<f22g64=float64#20,>h86=float64#19
# asm 2: faddd <h86=%f36,<f22g64=%f38,>h86=%f36
faddd %f36,%f38,%f36

# qhasm: f128 = *(float64 *) (f + 48)
# asm 1: ldd [<f=int64#2+48],>f128=float64#20
# asm 2: ldd [<f=%i1+48],>f128=%f38
ldd [%i1+48],%f38

# qhasm: 				f22g86 = f22 * g86
# asm 1: fmuld <f22=float64#3,<g86=float64#5,>f22g86=float64#22
# asm 2: fmuld <f22=%f4,<g86=%f8,>f22g86=%f42
fmuld %f4,%f8,%f42

# qhasm: 							*(float64 *) (h + 16) = h43
# asm 1: std <h43=float64#11,[<h=int64#1+16]
# asm 2: std <h43=%f20,[<h=%i0+16]
std %f20,[%i0+16]

# qhasm: g128 = *(float64 *) (g + 48)
# asm 1: ldd [<g=int64#3+48],>g128=float64#11
# asm 2: ldd [<g=%i2+48],>g128=%f20
ldd [%i2+48],%f20

# qhasm: 				f43g64 = f43 * g64
# asm 1: fmuld <f43=float64#6,<g64=float64#12,>f43g64=float64#23
# asm 2: fmuld <f43=%f10,<g64=%f22,>f43g64=%f44
fmuld %f10,%f22,%f44

# qhasm: 					h64 += i1
# asm 1: faddd <h64=float64#9,<i1=float64#13,>h64=float64#9
# asm 2: faddd <h64=%f16,<i1=%f24,>h64=%f16
faddd %f16,%f24,%f16

# qhasm: 				f64g43 = f64 * g43
# asm 1: fmuld <f64=float64#10,<g43=float64#8,>f64g43=float64#13
# asm 2: fmuld <f64=%f18,<g43=%f14,>f64g43=%f24
fmuld %f18,%f14,%f24

# qhasm: 					i2 = f43g43 + f64g22
# asm 1: faddd <f43g43=float64#16,<f64g22=float64#15,>i2=float64#15
# asm 2: faddd <f43g43=%f30,<f64g22=%f28,>i2=%f28
faddd %f30,%f28,%f28

# qhasm: 				f86g22 = f86 * g22
# asm 1: fmuld <f86=float64#14,<g22=float64#4,>f86g22=float64#16
# asm 2: fmuld <f86=%f26,<g22=%f6,>f86g22=%f30
fmuld %f26,%f6,%f30

# qhasm: 					h86 += f86g0
# asm 1: faddd <h86=float64#19,<f86g0=float64#17,>h86=float64#17
# asm 2: faddd <h86=%f36,<f86g0=%f32,>h86=%f32
faddd %f36,%f32,%f32

# qhasm: 				f107g0 = f107 * g0
# asm 1: fmuld <f107=float64#18,<g0=float64#2,>f107g0=float64#19
# asm 2: fmuld <f107=%f34,<g0=%f2,>f107g0=%f36
fmuld %f34,%f2,%f36

# qhasm: 					h107 += f22g86
# asm 1: faddd <h107=float64#21,<f22g86=float64#22,>h107=float64#21
# asm 2: faddd <h107=%f40,<f22g86=%f42,>h107=%f40
faddd %f40,%f42,%f40

# qhasm: 				h128 = f0 * g128
# asm 1: fmuld <f0=float64#1,<g128=float64#11,>h128=float64#22
# asm 2: fmuld <f0=%f0,<g128=%f20,>h128=%f42
fmuld %f0,%f20,%f42

# qhasm: 							*(float64 *) (h + 24) = h64
# asm 1: std <h64=float64#9,[<h=int64#1+24]
# asm 2: std <h64=%f16,[<h=%i0+24]
std %f16,[%i0+24]

# qhasm: f150 = *(float64 *) (f + 56)
# asm 1: ldd [<f=int64#2+56],>f150=float64#9
# asm 2: ldd [<f=%i1+56],>f150=%f16
ldd [%i1+56],%f16

# qhasm: 				f22g107 = f22 * g107
# asm 1: fmuld <f22=float64#3,<g107=float64#7,>f22g107=float64#24
# asm 2: fmuld <f22=%f4,<g107=%f12,>f22g107=%f46
fmuld %f4,%f12,%f46

# qhasm: 					i1 = f43g64 + f64g43
# asm 1: faddd <f43g64=float64#23,<f64g43=float64#13,>i1=float64#13
# asm 2: faddd <f43g64=%f44,<f64g43=%f24,>i1=%f24
faddd %f44,%f24,%f24

# qhasm: g150 = *(float64 *) (g + 56)
# asm 1: ldd [<g=int64#3+56],>g150=float64#23
# asm 2: ldd [<g=%i2+56],>g150=%f44
ldd [%i2+56],%f44

# qhasm: 				f43g86 = f43 * g86
# asm 1: fmuld <f43=float64#6,<g86=float64#5,>f43g86=float64#25
# asm 2: fmuld <f43=%f10,<g86=%f8,>f43g86=%f48
fmuld %f10,%f8,%f48

# qhasm: 					h86 += i2
# asm 1: faddd <h86=float64#17,<i2=float64#15,>h86=float64#15
# asm 2: faddd <h86=%f32,<i2=%f28,>h86=%f28
faddd %f32,%f28,%f28

# qhasm: 				f64g64 = f64 * g64
# asm 1: fmuld <f64=float64#10,<g64=float64#12,>f64g64=float64#17
# asm 2: fmuld <f64=%f18,<g64=%f22,>f64g64=%f32
fmuld %f18,%f22,%f32

# qhasm: 					i3 = f86g22 + f107g0		
# asm 1: faddd <f86g22=float64#16,<f107g0=float64#19,>i3=float64#16
# asm 2: faddd <f86g22=%f30,<f107g0=%f36,>i3=%f30
faddd %f30,%f36,%f30

# qhasm: 				f86g43 = f86 * g43
# asm 1: fmuld <f86=float64#14,<g43=float64#8,>f86g43=float64#19
# asm 2: fmuld <f86=%f26,<g43=%f14,>f86g43=%f36
fmuld %f26,%f14,%f36

# qhasm: 				f107g22 = f107 * g22
# asm 1: fmuld <f107=float64#18,<g22=float64#4,>f107g22=float64#26
# asm 2: fmuld <f107=%f34,<g22=%f6,>f107g22=%f50
fmuld %f34,%f6,%f50

# qhasm: 					h107 += i1
# asm 1: faddd <h107=float64#21,<i1=float64#13,>h107=float64#13
# asm 2: faddd <h107=%f40,<i1=%f24,>h107=%f24
faddd %f40,%f24,%f24

# qhasm: 				f128g0 = f128 * g0
# asm 1: fmuld <f128=float64#20,<g0=float64#2,>f128g0=float64#21
# asm 2: fmuld <f128=%f38,<g0=%f2,>f128g0=%f40
fmuld %f38,%f2,%f40

# qhasm: 					h128 += f22g107
# asm 1: faddd <h128=float64#22,<f22g107=float64#24,>h128=float64#22
# asm 2: faddd <h128=%f42,<f22g107=%f46,>h128=%f42
faddd %f42,%f46,%f42

# qhasm: 							*(float64 *) (h + 32) = h86
# asm 1: std <h86=float64#15,[<h=int64#1+32]
# asm 2: std <h86=%f28,[<h=%i0+32]
std %f28,[%i0+32]

# qhasm: 				h150 = f0 * g150
# asm 1: fmuld <f0=float64#1,<g150=float64#23,>h150=float64#15
# asm 2: fmuld <f0=%f0,<g150=%f44,>h150=%f28
fmuld %f0,%f44,%f28

# qhasm: 					i2 = f43g86 + f64g64
# asm 1: faddd <f43g86=float64#25,<f64g64=float64#17,>i2=float64#17
# asm 2: faddd <f43g86=%f48,<f64g64=%f32,>i2=%f32
faddd %f48,%f32,%f32

# qhasm: 				f22g128 = f22 * g128
# asm 1: fmuld <f22=float64#3,<g128=float64#11,>f22g128=float64#24
# asm 2: fmuld <f22=%f4,<g128=%f20,>f22g128=%f46
fmuld %f4,%f20,%f46

# qhasm: 				f43g107 = f43 * g107
# asm 1: fmuld <f43=float64#6,<g107=float64#7,>f43g107=float64#25
# asm 2: fmuld <f43=%f10,<g107=%f12,>f43g107=%f48
fmuld %f10,%f12,%f48

# qhasm: 					h107 += i3
# asm 1: faddd <h107=float64#13,<i3=float64#16,>h107=float64#13
# asm 2: faddd <h107=%f24,<i3=%f30,>h107=%f24
faddd %f24,%f30,%f24

# qhasm: f171 = *(float64 *) (f + 64)
# asm 1: ldd [<f=int64#2+64],>f171=float64#16
# asm 2: ldd [<f=%i1+64],>f171=%f30
ldd [%i1+64],%f30

# qhasm: 				f64g86 = f64 * g86
# asm 1: fmuld <f64=float64#10,<g86=float64#5,>f64g86=float64#27
# asm 2: fmuld <f64=%f18,<g86=%f8,>f64g86=%f52
fmuld %f18,%f8,%f52

# qhasm: 					i1 = f86g43 + f107g22
# asm 1: faddd <f86g43=float64#19,<f107g22=float64#26,>i1=float64#19
# asm 2: faddd <f86g43=%f36,<f107g22=%f50,>i1=%f36
faddd %f36,%f50,%f36

# qhasm: g171 = *(float64 *) (g + 64)
# asm 1: ldd [<g=int64#3+64],>g171=float64#26
# asm 2: ldd [<g=%i2+64],>g171=%f50
ldd [%i2+64],%f50

# qhasm: 				f86g64 = f86 * g64
# asm 1: fmuld <f86=float64#14,<g64=float64#12,>f86g64=float64#28
# asm 2: fmuld <f86=%f26,<g64=%f22,>f86g64=%f54
fmuld %f26,%f22,%f54

# qhasm: 					h128 += i2
# asm 1: faddd <h128=float64#22,<i2=float64#17,>h128=float64#17
# asm 2: faddd <h128=%f42,<i2=%f32,>h128=%f32
faddd %f42,%f32,%f32

# qhasm: 				f107g43 = f107 * g43
# asm 1: fmuld <f107=float64#18,<g43=float64#8,>f107g43=float64#22
# asm 2: fmuld <f107=%f34,<g43=%f14,>f107g43=%f42
fmuld %f34,%f14,%f42

# qhasm: 					h150 += f22g128
# asm 1: faddd <h150=float64#15,<f22g128=float64#24,>h150=float64#15
# asm 2: faddd <h150=%f28,<f22g128=%f46,>h150=%f28
faddd %f28,%f46,%f28

# qhasm: 				f128g22 = f128 * g22
# asm 1: fmuld <f128=float64#20,<g22=float64#4,>f128g22=float64#24
# asm 2: fmuld <f128=%f38,<g22=%f6,>f128g22=%f46
fmuld %f38,%f6,%f46

# qhasm: 				f150g0 = f150 * g0
# asm 1: fmuld <f150=float64#9,<g0=float64#2,>f150g0=float64#29
# asm 2: fmuld <f150=%f16,<g0=%f2,>f150g0=%f56
fmuld %f16,%f2,%f56

# qhasm: 					i1 += f128g0
# asm 1: faddd <i1=float64#19,<f128g0=float64#21,>i1=float64#19
# asm 2: faddd <i1=%f36,<f128g0=%f40,>i1=%f36
faddd %f36,%f40,%f36

# qhasm: 							*(float64 *) (h + 40) = h107
# asm 1: std <h107=float64#13,[<h=int64#1+40]
# asm 2: std <h107=%f24,[<h=%i0+40]
std %f24,[%i0+40]

# qhasm: 				h171 = f0 * g171
# asm 1: fmuld <f0=float64#1,<g171=float64#26,>h171=float64#13
# asm 2: fmuld <f0=%f0,<g171=%f50,>h171=%f24
fmuld %f0,%f50,%f24

# qhasm: 					i3 = f43g107 + f64g86
# asm 1: faddd <f43g107=float64#25,<f64g86=float64#27,>i3=float64#21
# asm 2: faddd <f43g107=%f48,<f64g86=%f52,>i3=%f40
faddd %f48,%f52,%f40

# qhasm: 				f22g150 = f22 * g150
# asm 1: fmuld <f22=float64#3,<g150=float64#23,>f22g150=float64#25
# asm 2: fmuld <f22=%f4,<g150=%f44,>f22g150=%f48
fmuld %f4,%f44,%f48

# qhasm: 					i2 = f86g64 + f107g43
# asm 1: faddd <f86g64=float64#28,<f107g43=float64#22,>i2=float64#22
# asm 2: faddd <f86g64=%f54,<f107g43=%f42,>i2=%f42
faddd %f54,%f42,%f42

# qhasm: 				f43g128 = f43 * g128
# asm 1: fmuld <f43=float64#6,<g128=float64#11,>f43g128=float64#27
# asm 2: fmuld <f43=%f10,<g128=%f20,>f43g128=%f52
fmuld %f10,%f20,%f52

# qhasm: 					h150 += f128g22
# asm 1: faddd <h150=float64#15,<f128g22=float64#24,>h150=float64#15
# asm 2: faddd <h150=%f28,<f128g22=%f46,>h150=%f28
faddd %f28,%f46,%f28

# qhasm: f192 = *(float64 *) (f + 72)
# asm 1: ldd [<f=int64#2+72],>f192=float64#24
# asm 2: ldd [<f=%i1+72],>f192=%f46
ldd [%i1+72],%f46

# qhasm: 				f64g107 = f64 * g107
# asm 1: fmuld <f64=float64#10,<g107=float64#7,>f64g107=float64#28
# asm 2: fmuld <f64=%f18,<g107=%f12,>f64g107=%f54
fmuld %f18,%f12,%f54

# qhasm: 					h128 += i1
# asm 1: faddd <h128=float64#17,<i1=float64#19,>h128=float64#17
# asm 2: faddd <h128=%f32,<i1=%f36,>h128=%f32
faddd %f32,%f36,%f32

# qhasm: g192 = *(float64 *) (g + 72)
# asm 1: ldd [<g=int64#3+72],>g192=float64#19
# asm 2: ldd [<g=%i2+72],>g192=%f36
ldd [%i2+72],%f36

# qhasm: 				f86g86 = f86 * g86
# asm 1: fmuld <f86=float64#14,<g86=float64#5,>f86g86=float64#30
# asm 2: fmuld <f86=%f26,<g86=%f8,>f86g86=%f58
fmuld %f26,%f8,%f58

# qhasm: 					i3 += f150g0
# asm 1: faddd <i3=float64#21,<f150g0=float64#29,>i3=float64#21
# asm 2: faddd <i3=%f40,<f150g0=%f56,>i3=%f40
faddd %f40,%f56,%f40

# qhasm: 				f107g64 = f107 * g64
# asm 1: fmuld <f107=float64#18,<g64=float64#12,>f107g64=float64#29
# asm 2: fmuld <f107=%f34,<g64=%f22,>f107g64=%f56
fmuld %f34,%f22,%f56

# qhasm: 					h171 += f22g150
# asm 1: faddd <h171=float64#13,<f22g150=float64#25,>h171=float64#13
# asm 2: faddd <h171=%f24,<f22g150=%f48,>h171=%f24
faddd %f24,%f48,%f24

# qhasm: 				f128g43 = f128 * g43
# asm 1: fmuld <f128=float64#20,<g43=float64#8,>f128g43=float64#25
# asm 2: fmuld <f128=%f38,<g43=%f14,>f128g43=%f48
fmuld %f38,%f14,%f48

# qhasm: 					h150 += i2
# asm 1: faddd <h150=float64#15,<i2=float64#22,>h150=float64#15
# asm 2: faddd <h150=%f28,<i2=%f42,>h150=%f28
faddd %f28,%f42,%f28

# qhasm: 				f150g22 = f150 * g22
# asm 1: fmuld <f150=float64#9,<g22=float64#4,>f150g22=float64#22
# asm 2: fmuld <f150=%f16,<g22=%f6,>f150g22=%f42
fmuld %f16,%f6,%f42

# qhasm: 					i1 = f43g128 + f64g107	
# asm 1: faddd <f43g128=float64#27,<f64g107=float64#28,>i1=float64#27
# asm 2: faddd <f43g128=%f52,<f64g107=%f54,>i1=%f52
faddd %f52,%f54,%f52

# qhasm: 				f171g0 = f171 * g0
# asm 1: fmuld <f171=float64#16,<g0=float64#2,>f171g0=float64#28
# asm 2: fmuld <f171=%f30,<g0=%f2,>f171g0=%f54
fmuld %f30,%f2,%f54

# qhasm: 							*(float64 *) (h + 48) = h128
# asm 1: std <h128=float64#17,[<h=int64#1+48]
# asm 2: std <h128=%f32,[<h=%i0+48]
std %f32,[%i0+48]

# qhasm: 				h192 = f0 * g192
# asm 1: fmuld <f0=float64#1,<g192=float64#19,>h192=float64#17
# asm 2: fmuld <f0=%f0,<g192=%f36,>h192=%f32
fmuld %f0,%f36,%f32

# qhasm: 					i4 = f86g86 + f107g64  
# asm 1: faddd <f86g86=float64#30,<f107g64=float64#29,>i4=float64#29
# asm 2: faddd <f86g86=%f58,<f107g64=%f56,>i4=%f56
faddd %f58,%f56,%f56

# qhasm: 				f22g171 = f22 * g171
# asm 1: fmuld <f22=float64#3,<g171=float64#26,>f22g171=float64#30
# asm 2: fmuld <f22=%f4,<g171=%f50,>f22g171=%f58
fmuld %f4,%f50,%f58

# qhasm: 					h150 += i3
# asm 1: faddd <h150=float64#15,<i3=float64#21,>h150=float64#15
# asm 2: faddd <h150=%f28,<i3=%f40,>h150=%f28
faddd %f28,%f40,%f28

# qhasm: 				f43g150 = f43 * g150
# asm 1: fmuld <f43=float64#6,<g150=float64#23,>f43g150=float64#21
# asm 2: fmuld <f43=%f10,<g150=%f44,>f43g150=%f40
fmuld %f10,%f44,%f40

# qhasm: 					h171 += i1
# asm 1: faddd <h171=float64#13,<i1=float64#27,>h171=float64#13
# asm 2: faddd <h171=%f24,<i1=%f52,>h171=%f24
faddd %f24,%f52,%f24

# qhasm: 				f64g128 = f64 * g128
# asm 1: fmuld <f64=float64#10,<g128=float64#11,>f64g128=float64#27
# asm 2: fmuld <f64=%f18,<g128=%f20,>f64g128=%f52
fmuld %f18,%f20,%f52

# qhasm: 					i2 = f128g43 + f150g22
# asm 1: faddd <f128g43=float64#25,<f150g22=float64#22,>i2=float64#22
# asm 2: faddd <f128g43=%f48,<f150g22=%f42,>i2=%f42
faddd %f48,%f42,%f42

# qhasm: f214 = *(float64 *) (f + 80)
# asm 1: ldd [<f=int64#2+80],>f214=float64#25
# asm 2: ldd [<f=%i1+80],>f214=%f48
ldd [%i1+80],%f48

# qhasm: 				f86g107 = f86 * g107
# asm 1: fmuld <f86=float64#14,<g107=float64#7,>f86g107=float64#31
# asm 2: fmuld <f86=%f26,<g107=%f12,>f86g107=%f60
fmuld %f26,%f12,%f60

# qhasm: 					i4 += f171g0
# asm 1: faddd <i4=float64#29,<f171g0=float64#28,>i4=float64#28
# asm 2: faddd <i4=%f56,<f171g0=%f54,>i4=%f54
faddd %f56,%f54,%f54

# qhasm: g214 = *(float64 *) (g + 80)
# asm 1: ldd [<g=int64#3+80],>g214=float64#29
# asm 2: ldd [<g=%i2+80],>g214=%f56
ldd [%i2+80],%f56

# qhasm: 				f107g86 = f107 * g86
# asm 1: fmuld <f107=float64#18,<g86=float64#5,>f107g86=float64#32
# asm 2: fmuld <f107=%f34,<g86=%f8,>f107g86=%f62
fmuld %f34,%f8,%f62

# qhasm: 					h192 += f22g171
# asm 1: faddd <h192=float64#17,<f22g171=float64#30,>h192=float64#17
# asm 2: faddd <h192=%f32,<f22g171=%f58,>h192=%f32
faddd %f32,%f58,%f32

# qhasm: 							*(float64 *) (h + 56) = h150
# asm 1: std <h150=float64#15,[<h=int64#1+56]
# asm 2: std <h150=%f28,[<h=%i0+56]
std %f28,[%i0+56]

# qhasm: 				f128g64 = f128 * g64
# asm 1: fmuld <f128=float64#20,<g64=float64#12,>f128g64=float64#15
# asm 2: fmuld <f128=%f38,<g64=%f22,>f128g64=%f28
fmuld %f38,%f22,%f28

# qhasm: 				f150g43 = f150 * g43
# asm 1: fmuld <f150=float64#9,<g43=float64#8,>f150g43=float64#30
# asm 2: fmuld <f150=%f16,<g43=%f14,>f150g43=%f58
fmuld %f16,%f14,%f58

# qhasm: 					h171 += i2
# asm 1: faddd <h171=float64#13,<i2=float64#22,>h171=float64#13
# asm 2: faddd <h171=%f24,<i2=%f42,>h171=%f24
faddd %f24,%f42,%f24

# qhasm: 				f171g22 = f171 * g22
# asm 1: fmuld <f171=float64#16,<g22=float64#4,>f171g22=float64#22
# asm 2: fmuld <f171=%f30,<g22=%f6,>f171g22=%f42
fmuld %f30,%f6,%f42

# qhasm: 					i1 = f43g150 + f64g128	
# asm 1: faddd <f43g150=float64#21,<f64g128=float64#27,>i1=float64#21
# asm 2: faddd <f43g150=%f40,<f64g128=%f52,>i1=%f40
faddd %f40,%f52,%f40

# qhasm: 				f192g0 = f192 * g0
# asm 1: fmuld <f192=float64#24,<g0=float64#2,>f192g0=float64#27
# asm 2: fmuld <f192=%f46,<g0=%f2,>f192g0=%f52
fmuld %f46,%f2,%f52

# qhasm: 					h192 += f86g107
# asm 1: faddd <h192=float64#17,<f86g107=float64#31,>h192=float64#17
# asm 2: faddd <h192=%f32,<f86g107=%f60,>h192=%f32
faddd %f32,%f60,%f32

# qhasm: 				h214 = f0 * g214
# asm 1: fmuld <f0=float64#1,<g214=float64#29,>h214=float64#31
# asm 2: fmuld <f0=%f0,<g214=%f56,>h214=%f60
fmuld %f0,%f56,%f60

# qhasm: 					i3 = f107g86 + f128g64
# asm 1: faddd <f107g86=float64#32,<f128g64=float64#15,>i3=float64#15
# asm 2: faddd <f107g86=%f62,<f128g64=%f28,>i3=%f28
faddd %f62,%f28,%f28

# qhasm: 				f22g192 = f22 * g192
# asm 1: fmuld <f22=float64#3,<g192=float64#19,>f22g192=float64#3
# asm 2: fmuld <f22=%f4,<g192=%f36,>f22g192=%f4
fmuld %f4,%f36,%f4

# qhasm: 					h171 += i4
# asm 1: faddd <h171=float64#13,<i4=float64#28,>h171=float64#13
# asm 2: faddd <h171=%f24,<i4=%f54,>h171=%f24
faddd %f24,%f54,%f24

# qhasm: 				f43g171 = f43 * g171
# asm 1: fmuld <f43=float64#6,<g171=float64#26,>f43g171=float64#6
# asm 2: fmuld <f43=%f10,<g171=%f50,>f43g171=%f10
fmuld %f10,%f50,%f10

# qhasm: 					i1 += f150g43
# asm 1: faddd <i1=float64#21,<f150g43=float64#30,>i1=float64#21
# asm 2: faddd <i1=%f40,<f150g43=%f58,>i1=%f40
faddd %f40,%f58,%f40

# qhasm: 				f64g150 = f64 * g150
# asm 1: fmuld <f64=float64#10,<g150=float64#23,>f64g150=float64#23
# asm 2: fmuld <f64=%f18,<g150=%f44,>f64g150=%f44
fmuld %f18,%f44,%f44

# qhasm: 					h192 += f171g22
# asm 1: faddd <h192=float64#17,<f171g22=float64#22,>h192=float64#17
# asm 2: faddd <h192=%f32,<f171g22=%f42,>h192=%f32
faddd %f32,%f42,%f32

# qhasm: 				f86g128 = f86 * g128
# asm 1: fmuld <f86=float64#14,<g128=float64#11,>f86g128=float64#11
# asm 2: fmuld <f86=%f26,<g128=%f20,>f86g128=%f20
fmuld %f26,%f20,%f20

# qhasm: 					i3 += f192g0
# asm 1: faddd <i3=float64#15,<f192g0=float64#27,>i3=float64#15
# asm 2: faddd <i3=%f28,<f192g0=%f52,>i3=%f28
faddd %f28,%f52,%f28

# qhasm: 				f107g107 = f107 * g107
# asm 1: fmuld <f107=float64#18,<g107=float64#7,>f107g107=float64#7
# asm 2: fmuld <f107=%f34,<g107=%f12,>f107g107=%f12
fmuld %f34,%f12,%f12

# qhasm: 					h214 += f22g192	
# asm 1: faddd <h214=float64#31,<f22g192=float64#3,>h214=float64#3
# asm 2: faddd <h214=%f60,<f22g192=%f4,>h214=%f4
faddd %f60,%f4,%f4

# qhasm: 							*(float64 *) (h + 64) = h171
# asm 1: std <h171=float64#13,[<h=int64#1+64]
# asm 2: std <h171=%f24,[<h=%i0+64]
std %f24,[%i0+64]

# qhasm: f235 = *(float64 *) (f + 88)
# asm 1: ldd [<f=int64#2+88],>f235=float64#13
# asm 2: ldd [<f=%i1+88],>f235=%f24
ldd [%i1+88],%f24

# qhasm: 				f128g86 = f128 * g86
# asm 1: fmuld <f128=float64#20,<g86=float64#5,>f128g86=float64#18
# asm 2: fmuld <f128=%f38,<g86=%f8,>f128g86=%f34
fmuld %f38,%f8,%f34

# qhasm: g235 = *(float64 *) (g + 88)
# asm 1: ldd [<g=int64#3+88],>g235=float64#22
# asm 2: ldd [<g=%i2+88],>g235=%f42
ldd [%i2+88],%f42

# qhasm: 				f150g64 = f150 * g64
# asm 1: fmuld <f150=float64#9,<g64=float64#12,>f150g64=float64#9
# asm 2: fmuld <f150=%f16,<g64=%f22,>f150g64=%f16
fmuld %f16,%f22,%f16

# qhasm: 					h192 += i1
# asm 1: faddd <h192=float64#17,<i1=float64#21,>h192=float64#17
# asm 2: faddd <h192=%f32,<i1=%f40,>h192=%f32
faddd %f32,%f40,%f32

# qhasm: f22 = *(float64 *) (f + 8)
# asm 1: ldd [<f=int64#2+8],>f22=float64#21
# asm 2: ldd [<f=%i1+8],>f22=%f40
ldd [%i1+8],%f40

# qhasm: 				f171g43 = f171 * g43
# asm 1: fmuld <f171=float64#16,<g43=float64#8,>f171g43=float64#27
# asm 2: fmuld <f171=%f30,<g43=%f14,>f171g43=%f52
fmuld %f30,%f14,%f52

# qhasm: 					i2 = f43g171 + f64g150
# asm 1: faddd <f43g171=float64#6,<f64g150=float64#23,>i2=float64#6
# asm 2: faddd <f43g171=%f10,<f64g150=%f44,>i2=%f10
faddd %f10,%f44,%f10

# qhasm: f43 = *(float64 *) (f + 16)
# asm 1: ldd [<f=int64#2+16],>f43=float64#23
# asm 2: ldd [<f=%i1+16],>f43=%f44
ldd [%i1+16],%f44

# qhasm: 				f192g22 = f192 * g22
# asm 1: fmuld <f192=float64#24,<g22=float64#4,>f192g22=float64#28
# asm 2: fmuld <f192=%f46,<g22=%f6,>f192g22=%f54
fmuld %f46,%f6,%f54

# qhasm: 					h214 += f86g128
# asm 1: faddd <h214=float64#3,<f86g128=float64#11,>h214=float64#3
# asm 2: faddd <h214=%f4,<f86g128=%f20,>h214=%f4
faddd %f4,%f20,%f4

# qhasm: g150 = *(float64 *) (g + 56)
# asm 1: ldd [<g=int64#3+56],>g150=float64#11
# asm 2: ldd [<g=%i2+56],>g150=%f20
ldd [%i2+56],%f20

# qhasm: 				f214g0 = f214 * g0
# asm 1: fmuld <f214=float64#25,<g0=float64#2,>f214g0=float64#2
# asm 2: fmuld <f214=%f48,<g0=%f2,>f214g0=%f2
fmuld %f48,%f2,%f2

# qhasm: 					i4 = f107g107 + f128g86
# asm 1: faddd <f107g107=float64#7,<f128g86=float64#18,>i4=float64#7
# asm 2: faddd <f107g107=%f12,<f128g86=%f34,>i4=%f12
faddd %f12,%f34,%f12

# qhasm: g128 = *(float64 *) (g + 48)
# asm 1: ldd [<g=int64#3+48],>g128=float64#18
# asm 2: ldd [<g=%i2+48],>g128=%f34
ldd [%i2+48],%f34

# qhasm: 				h235 = f0 * g235
# asm 1: fmuld <f0=float64#1,<g235=float64#22,>h235=float64#1
# asm 2: fmuld <f0=%f0,<g235=%f42,>h235=%f0
fmuld %f0,%f42,%f0

# qhasm: 					h192 += i3
# asm 1: faddd <h192=float64#17,<i3=float64#15,>h192=float64#15
# asm 2: faddd <h192=%f32,<i3=%f28,>h192=%f28
faddd %f32,%f28,%f28

# qhasm: f107 = *(float64 *) (f + 40)
# asm 1: ldd [<f=int64#2+40],>f107=float64#17
# asm 2: ldd [<f=%i1+40],>f107=%f32
ldd [%i1+40],%f32

# qhasm: 				f22g214 = f22 * g214
# asm 1: fmuld <f22=float64#21,<g214=float64#29,>f22g214=float64#21
# asm 2: fmuld <f22=%f40,<g214=%f56,>f22g214=%f40
fmuld %f40,%f56,%f40

# qhasm: 					i2 += f150g64
# asm 1: faddd <i2=float64#6,<f150g64=float64#9,>i2=float64#6
# asm 2: faddd <i2=%f10,<f150g64=%f16,>i2=%f10
faddd %f10,%f16,%f10

# qhasm: g107 = *(float64 *) (g + 40)
# asm 1: ldd [<g=int64#3+40],>g107=float64#9
# asm 2: ldd [<g=%i2+40],>g107=%f16
ldd [%i2+40],%f16

# qhasm: 				f43g192 = f43 * g192
# asm 1: fmuld <f43=float64#23,<g192=float64#19,>f43g192=float64#23
# asm 2: fmuld <f43=%f44,<g192=%f36,>f43g192=%f44
fmuld %f44,%f36,%f44

# qhasm: 					h214 += f171g43
# asm 1: faddd <h214=float64#3,<f171g43=float64#27,>h214=float64#3
# asm 2: faddd <h214=%f4,<f171g43=%f52,>h214=%f4
faddd %f4,%f52,%f4

# qhasm: f150 = *(float64 *) (f + 56)
# asm 1: ldd [<f=int64#2+56],>f150=float64#27
# asm 2: ldd [<f=%i1+56],>f150=%f52
ldd [%i1+56],%f52

# qhasm: 				f64g171 = f64 * g171
# asm 1: fmuld <f64=float64#10,<g171=float64#26,>f64g171=float64#30
# asm 2: fmuld <f64=%f18,<g171=%f50,>f64g171=%f58
fmuld %f18,%f50,%f58

# qhasm: 					i4 += f192g22
# asm 1: faddd <i4=float64#7,<f192g22=float64#28,>i4=float64#7
# asm 2: faddd <i4=%f12,<f192g22=%f54,>i4=%f12
faddd %f12,%f54,%f12

# qhasm: 				f86g150 = f86 * g150
# asm 1: fmuld <f86=float64#14,<g150=float64#11,>f86g150=float64#28
# asm 2: fmuld <f86=%f26,<g150=%f20,>f86g150=%f54
fmuld %f26,%f20,%f54

# qhasm: 							*(float64 *) (h + 72) = h192
# asm 1: std <h192=float64#15,[<h=int64#1+72]
# asm 2: std <h192=%f28,[<h=%i0+72]
std %f28,[%i0+72]

# qhasm: 				f107g128 = f107 * g128
# asm 1: fmuld <f107=float64#17,<g128=float64#18,>f107g128=float64#15
# asm 2: fmuld <f107=%f32,<g128=%f34,>f107g128=%f28
fmuld %f32,%f34,%f28

# qhasm: 					i2 += f214g0
# asm 1: faddd <i2=float64#6,<f214g0=float64#2,>i2=float64#2
# asm 2: faddd <i2=%f10,<f214g0=%f2,>i2=%f2
faddd %f10,%f2,%f2

# qhasm: 				f128g107 = f128 * g107
# asm 1: fmuld <f128=float64#20,<g107=float64#9,>f128g107=float64#6
# asm 2: fmuld <f128=%f38,<g107=%f16,>f128g107=%f10
fmuld %f38,%f16,%f10

# qhasm: 					h235 += f22g214
# asm 1: faddd <h235=float64#1,<f22g214=float64#21,>h235=float64#1
# asm 2: faddd <h235=%f0,<f22g214=%f40,>h235=%f0
faddd %f0,%f40,%f0

# qhasm: g0 = *(float64 *) (g + 0)
# asm 1: ldd [<g=int64#3+0],>g0=float64#9
# asm 2: ldd [<g=%i2+0],>g0=%f16
ldd [%i2+0],%f16

# qhasm: 				f150g86 = f150 * g86
# asm 1: fmuld <f150=float64#27,<g86=float64#5,>f150g86=float64#17
# asm 2: fmuld <f150=%f52,<g86=%f8,>f150g86=%f32
fmuld %f52,%f8,%f32

# qhasm: 					h214 += i4
# asm 1: faddd <h214=float64#3,<i4=float64#7,>h214=float64#3
# asm 2: faddd <h214=%f4,<i4=%f12,>h214=%f4
faddd %f4,%f12,%f4

# qhasm: f22 = *(float64 *) (f + 8)
# asm 1: ldd [<f=int64#2+8],>f22=float64#7
# asm 2: ldd [<f=%i1+8],>f22=%f12
ldd [%i1+8],%f12

# qhasm: 				f171g64 = f171 * g64
# asm 1: fmuld <f171=float64#16,<g64=float64#12,>f171g64=float64#21
# asm 2: fmuld <f171=%f30,<g64=%f22,>f171g64=%f40
fmuld %f30,%f22,%f40

# qhasm: 					i1 = f43g192 + f64g171	
# asm 1: faddd <f43g192=float64#23,<f64g171=float64#30,>i1=float64#23
# asm 2: faddd <f43g192=%f44,<f64g171=%f58,>i1=%f44
faddd %f44,%f58,%f44

# qhasm: f43 = *(float64 *) (f + 16)
# asm 1: ldd [<f=int64#2+16],>f43=float64#30
# asm 2: ldd [<f=%i1+16],>f43=%f58
ldd [%i1+16],%f58

# qhasm: 				f192g43 = f192 * g43
# asm 1: fmuld <f192=float64#24,<g43=float64#8,>f192g43=float64#31
# asm 2: fmuld <f192=%f46,<g43=%f14,>f192g43=%f60
fmuld %f46,%f14,%f60

# qhasm: 					i3 = f86g150 + f107g128
# asm 1: faddd <f86g150=float64#28,<f107g128=float64#15,>i3=float64#15
# asm 2: faddd <f86g150=%f54,<f107g128=%f28,>i3=%f28
faddd %f54,%f28,%f28

# qhasm: f107 = *(float64 *) (f + 40)
# asm 1: ldd [<f=int64#2+40],>f107=float64#28
# asm 2: ldd [<f=%i1+40],>f107=%f54
ldd [%i1+40],%f54

# qhasm: 				f214g22 = f214 * g22
# asm 1: fmuld <f214=float64#25,<g22=float64#4,>f214g22=float64#32
# asm 2: fmuld <f214=%f48,<g22=%f6,>f214g22=%f62
fmuld %f48,%f6,%f62

# qhasm: 					h235 += f128g107
# asm 1: faddd <h235=float64#1,<f128g107=float64#6,>h235=float64#1
# asm 2: faddd <h235=%f0,<f128g107=%f10,>h235=%f0
faddd %f0,%f10,%f0

# qhasm: g107 = *(float64 *) (g + 40)
# asm 1: ldd [<g=int64#3+40],>g107=float64#6
# asm 2: ldd [<g=%i2+40],>g107=%f10
ldd [%i2+40],%f10

# qhasm: 				f235g0 = f235 * g0
# asm 1: fmuld <f235=float64#13,<g0=float64#9,>f235g0=float64#9
# asm 2: fmuld <f235=%f24,<g0=%f16,>f235g0=%f16
fmuld %f24,%f16,%f16

# qhasm: 					h214 += i2
# asm 1: faddd <h214=float64#3,<i2=float64#2,>h214=float64#2
# asm 2: faddd <h214=%f4,<i2=%f2,>h214=%f2
faddd %f4,%f2,%f2

# qhasm: 				h256 = f22 * g235
# asm 1: fmuld <f22=float64#7,<g235=float64#22,>h256=float64#3
# asm 2: fmuld <f22=%f12,<g235=%f42,>h256=%f4
fmuld %f12,%f42,%f4

# qhasm: 					i1 += f150g86
# asm 1: faddd <i1=float64#23,<f150g86=float64#17,>i1=float64#7
# asm 2: faddd <i1=%f44,<f150g86=%f32,>i1=%f12
faddd %f44,%f32,%f12

# qhasm: 				f43g214 = f43 * g214
# asm 1: fmuld <f43=float64#30,<g214=float64#29,>f43g214=float64#17
# asm 2: fmuld <f43=%f58,<g214=%f56,>f43g214=%f32
fmuld %f58,%f56,%f32

# qhasm: 					i3 += f171g64
# asm 1: faddd <i3=float64#15,<f171g64=float64#21,>i3=float64#15
# asm 2: faddd <i3=%f28,<f171g64=%f40,>i3=%f28
faddd %f28,%f40,%f28

# qhasm: 				f64g192 = f64 * g192
# asm 1: fmuld <f64=float64#10,<g192=float64#19,>f64g192=float64#21
# asm 2: fmuld <f64=%f18,<g192=%f36,>f64g192=%f40
fmuld %f18,%f36,%f40

# qhasm: 					h235 += f192g43
# asm 1: faddd <h235=float64#1,<f192g43=float64#31,>h235=float64#1
# asm 2: faddd <h235=%f0,<f192g43=%f60,>h235=%f0
faddd %f0,%f60,%f0

# qhasm: 				f86g171 = f86 * g171
# asm 1: fmuld <f86=float64#14,<g171=float64#26,>f86g171=float64#23
# asm 2: fmuld <f86=%f26,<g171=%f50,>f86g171=%f44
fmuld %f26,%f50,%f44

# qhasm: 					i4 = f214g22 + f235g0
# asm 1: faddd <f214g22=float64#32,<f235g0=float64#9,>i4=float64#9
# asm 2: faddd <f214g22=%f62,<f235g0=%f16,>i4=%f16
faddd %f62,%f16,%f16

# qhasm: 							*(float64 *) (h + 80) = h214
# asm 1: std <h214=float64#2,[<h=int64#1+80]
# asm 2: std <h214=%f2,[<h=%i0+80]
std %f2,[%i0+80]

# qhasm: 				f107g150 = f107 * g150
# asm 1: fmuld <f107=float64#28,<g150=float64#11,>f107g150=float64#2
# asm 2: fmuld <f107=%f54,<g150=%f20,>f107g150=%f2
fmuld %f54,%f20,%f2

# qhasm:                                 f128g128 = f128 * g128
# asm 1: fmuld <f128=float64#20,<g128=float64#18,>f128g128=float64#31
# asm 2: fmuld <f128=%f38,<g128=%f34,>f128g128=%f60
fmuld %f38,%f34,%f60

# qhasm: 					i1 += i3
# asm 1: faddd <i1=float64#7,<i3=float64#15,>i1=float64#7
# asm 2: faddd <i1=%f12,<i3=%f28,>i1=%f12
faddd %f12,%f28,%f12

# qhasm:                                 f150g107 = f150 * g107
# asm 1: fmuld <f150=float64#27,<g107=float64#6,>f150g107=float64#15
# asm 2: fmuld <f150=%f52,<g107=%f10,>f150g107=%f28
fmuld %f52,%f10,%f28

# qhasm: 					h256 += f43g214
# asm 1: faddd <h256=float64#3,<f43g214=float64#17,>h256=float64#3
# asm 2: faddd <h256=%f4,<f43g214=%f32,>h256=%f4
faddd %f4,%f32,%f4

# qhasm:                                 f171g86 = f171 * g86
# asm 1: fmuld <f171=float64#16,<g86=float64#5,>f171g86=float64#17
# asm 2: fmuld <f171=%f30,<g86=%f8,>f171g86=%f32
fmuld %f30,%f8,%f32

# qhasm: 					h235 += i4
# asm 1: faddd <h235=float64#1,<i4=float64#9,>h235=float64#1
# asm 2: faddd <h235=%f0,<i4=%f16,>h235=%f0
faddd %f0,%f16,%f0

# qhasm:                                 f192g64 = f192 * g64
# asm 1: fmuld <f192=float64#24,<g64=float64#12,>f192g64=float64#9
# asm 2: fmuld <f192=%f46,<g64=%f22,>f192g64=%f16
fmuld %f46,%f22,%f16

# qhasm: 					i2 = f64g192 + f86g171
# asm 1: faddd <f64g192=float64#21,<f86g171=float64#23,>i2=float64#21
# asm 2: faddd <f64g192=%f40,<f86g171=%f44,>i2=%f40
faddd %f40,%f44,%f40

# qhasm: 				f214g43 = f214 * g43
# asm 1: fmuld <f214=float64#25,<g43=float64#8,>f214g43=float64#23
# asm 2: fmuld <f214=%f48,<g43=%f14,>f214g43=%f44
fmuld %f48,%f14,%f44

# qhasm: 					i3 = f107g150 + f128g128	
# asm 1: faddd <f107g150=float64#2,<f128g128=float64#31,>i3=float64#2
# asm 2: faddd <f107g150=%f2,<f128g128=%f60,>i3=%f2
faddd %f2,%f60,%f2

# qhasm: 				f235g22 = f235 * g22
# asm 1: fmuld <f235=float64#13,<g22=float64#4,>f235g22=float64#4
# asm 2: fmuld <f235=%f24,<g22=%f6,>f235g22=%f6
fmuld %f24,%f6,%f6

# qhasm: 					h256 += f150g107
# asm 1: faddd <h256=float64#3,<f150g107=float64#15,>h256=float64#3
# asm 2: faddd <h256=%f4,<f150g107=%f28,>h256=%f4
faddd %f4,%f28,%f4

# qhasm: 				h278 = f43 * g235
# asm 1: fmuld <f43=float64#30,<g235=float64#22,>h278=float64#15
# asm 2: fmuld <f43=%f58,<g235=%f42,>h278=%f28
fmuld %f58,%f42,%f28

# qhasm: 					h235 += i1
# asm 1: faddd <h235=float64#1,<i1=float64#7,>h235=float64#1
# asm 2: faddd <h235=%f0,<i1=%f12,>h235=%f0
faddd %f0,%f12,%f0

# qhasm: 				f64g214 = f64 * g214
# asm 1: fmuld <f64=float64#10,<g214=float64#29,>f64g214=float64#7
# asm 2: fmuld <f64=%f18,<g214=%f56,>f64g214=%f12
fmuld %f18,%f56,%f12

# qhasm: 					i2 += f171g86
# asm 1: faddd <i2=float64#21,<f171g86=float64#17,>i2=float64#17
# asm 2: faddd <i2=%f40,<f171g86=%f32,>i2=%f32
faddd %f40,%f32,%f32

# qhasm: 				f86g192 = f86 * g192
# asm 1: fmuld <f86=float64#14,<g192=float64#19,>f86g192=float64#21
# asm 2: fmuld <f86=%f26,<g192=%f36,>f86g192=%f40
fmuld %f26,%f36,%f40

# qhasm: 					i3 += f192g64
# asm 1: faddd <i3=float64#2,<f192g64=float64#9,>i3=float64#2
# asm 2: faddd <i3=%f2,<f192g64=%f16,>i3=%f2
faddd %f2,%f16,%f2

# qhasm: 				f107g171 = f107 * g171
# asm 1: fmuld <f107=float64#28,<g171=float64#26,>f107g171=float64#9
# asm 2: fmuld <f107=%f54,<g171=%f50,>f107g171=%f16
fmuld %f54,%f50,%f16

# qhasm: 					h256 += f214g43
# asm 1: faddd <h256=float64#3,<f214g43=float64#23,>h256=float64#3
# asm 2: faddd <h256=%f4,<f214g43=%f44,>h256=%f4
faddd %f4,%f44,%f4

# qhasm: 				f128g150 = f128 * g150
# asm 1: fmuld <f128=float64#20,<g150=float64#11,>f128g150=float64#23
# asm 2: fmuld <f128=%f38,<g150=%f20,>f128g150=%f44
fmuld %f38,%f20,%f44

# qhasm: 							*(float64 *) (h + 88) = h235
# asm 1: std <h235=float64#1,[<h=int64#1+88]
# asm 2: std <h235=%f0,[<h=%i0+88]
std %f0,[%i0+88]

# qhasm: 				f150g128 = f150 * g128
# asm 1: fmuld <f150=float64#27,<g128=float64#18,>f150g128=float64#1
# asm 2: fmuld <f150=%f52,<g128=%f34,>f150g128=%f0
fmuld %f52,%f34,%f0

# qhasm: 					i2 += f235g22
# asm 1: faddd <i2=float64#17,<f235g22=float64#4,>i2=float64#4
# asm 2: faddd <i2=%f32,<f235g22=%f6,>i2=%f6
faddd %f32,%f6,%f6

# qhasm: 				f171g107 = f171 * g107
# asm 1: fmuld <f171=float64#16,<g107=float64#6,>f171g107=float64#17
# asm 2: fmuld <f171=%f30,<g107=%f10,>f171g107=%f32
fmuld %f30,%f10,%f32

# qhasm: 					h278 += f64g214
# asm 1: faddd <h278=float64#15,<f64g214=float64#7,>h278=float64#7
# asm 2: faddd <h278=%f28,<f64g214=%f12,>h278=%f12
faddd %f28,%f12,%f12

# qhasm: 				f192g86 = f192 * g86
# asm 1: fmuld <f192=float64#24,<g86=float64#5,>f192g86=float64#15
# asm 2: fmuld <f192=%f46,<g86=%f8,>f192g86=%f28
fmuld %f46,%f8,%f28

# qhasm: 					h256 += i3
# asm 1: faddd <h256=float64#3,<i3=float64#2,>h256=float64#2
# asm 2: faddd <h256=%f4,<i3=%f2,>h256=%f2
faddd %f4,%f2,%f2

# qhasm: 				f214g64 = f214 * g64
# asm 1: fmuld <f214=float64#25,<g64=float64#12,>f214g64=float64#3
# asm 2: fmuld <f214=%f48,<g64=%f22,>f214g64=%f4
fmuld %f48,%f22,%f4

# qhasm: 					i1 = f86g192 + f107g171	
# asm 1: faddd <f86g192=float64#21,<f107g171=float64#9,>i1=float64#9
# asm 2: faddd <f86g192=%f40,<f107g171=%f16,>i1=%f16
faddd %f40,%f16,%f16

# qhasm: 				f235g43 = f235 * g43
# asm 1: fmuld <f235=float64#13,<g43=float64#8,>f235g43=float64#8
# asm 2: fmuld <f235=%f24,<g43=%f14,>f235g43=%f14
fmuld %f24,%f14,%f14

# qhasm: 					i4 = f128g150 + f150g128
# asm 1: faddd <f128g150=float64#23,<f150g128=float64#1,>i4=float64#1
# asm 2: faddd <f128g150=%f44,<f150g128=%f0,>i4=%f0
faddd %f44,%f0,%f0

# qhasm: 				h299 = f64 * g235
# asm 1: fmuld <f64=float64#10,<g235=float64#22,>h299=float64#10
# asm 2: fmuld <f64=%f18,<g235=%f42,>h299=%f18
fmuld %f18,%f42,%f18

# qhasm: 					h278 += f171g107
# asm 1: faddd <h278=float64#7,<f171g107=float64#17,>h278=float64#7
# asm 2: faddd <h278=%f12,<f171g107=%f32,>h278=%f12
faddd %f12,%f32,%f12

# qhasm: 				f86g214 = f86 * g214
# asm 1: fmuld <f86=float64#14,<g214=float64#29,>f86g214=float64#17
# asm 2: fmuld <f86=%f26,<g214=%f56,>f86g214=%f32
fmuld %f26,%f56,%f32

# qhasm: 					h256 += i2
# asm 1: faddd <h256=float64#2,<i2=float64#4,>h256=float64#2
# asm 2: faddd <h256=%f2,<i2=%f6,>h256=%f2
faddd %f2,%f6,%f2

# qhasm: 				f107g192 = f107 * g192
# asm 1: fmuld <f107=float64#28,<g192=float64#19,>f107g192=float64#4
# asm 2: fmuld <f107=%f54,<g192=%f36,>f107g192=%f6
fmuld %f54,%f36,%f6

# qhasm: 					i1 += f192g86
# asm 1: faddd <i1=float64#9,<f192g86=float64#15,>i1=float64#9
# asm 2: faddd <i1=%f16,<f192g86=%f28,>i1=%f16
faddd %f16,%f28,%f16

# qhasm: 				f128g171 = f128 * g171
# asm 1: fmuld <f128=float64#20,<g171=float64#26,>f128g171=float64#15
# asm 2: fmuld <f128=%f38,<g171=%f50,>f128g171=%f28
fmuld %f38,%f50,%f28

# qhasm: 					i4 += f214g64
# asm 1: faddd <i4=float64#1,<f214g64=float64#3,>i4=float64#1
# asm 2: faddd <i4=%f0,<f214g64=%f4,>i4=%f0
faddd %f0,%f4,%f0

# qhasm: 				f150g150 = f150 * g150
# asm 1: fmuld <f150=float64#27,<g150=float64#11,>f150g150=float64#3
# asm 2: fmuld <f150=%f52,<g150=%f20,>f150g150=%f4
fmuld %f52,%f20,%f4

# qhasm: 					h278 += f235g43
# asm 1: faddd <h278=float64#7,<f235g43=float64#8,>h278=float64#7
# asm 2: faddd <h278=%f12,<f235g43=%f14,>h278=%f12
faddd %f12,%f14,%f12

# qhasm: 				f171g128 = f171 * g128
# asm 1: fmuld <f171=float64#16,<g128=float64#18,>f171g128=float64#8
# asm 2: fmuld <f171=%f30,<g128=%f34,>f171g128=%f14
fmuld %f30,%f34,%f14

# qhasm: 					h299 += f86g214
# asm 1: faddd <h299=float64#10,<f86g214=float64#17,>h299=float64#10
# asm 2: faddd <h299=%f18,<f86g214=%f32,>h299=%f18
faddd %f18,%f32,%f18

# qhasm: 							*(float64 *) (h + 96) = h256
# asm 1: std <h256=float64#2,[<h=int64#1+96]
# asm 2: std <h256=%f2,[<h=%i0+96]
std %f2,[%i0+96]

# qhasm: 				f192g107 = f192 * g107
# asm 1: fmuld <f192=float64#24,<g107=float64#6,>f192g107=float64#2
# asm 2: fmuld <f192=%f46,<g107=%f10,>f192g107=%f2
fmuld %f46,%f10,%f2

# qhasm: 				f214g86 = f214 * g86
# asm 1: fmuld <f214=float64#25,<g86=float64#5,>f214g86=float64#17
# asm 2: fmuld <f214=%f48,<g86=%f8,>f214g86=%f32
fmuld %f48,%f8,%f32

# qhasm: 					i1 += i4
# asm 1: faddd <i1=float64#9,<i4=float64#1,>i1=float64#1
# asm 2: faddd <i1=%f16,<i4=%f0,>i1=%f0
faddd %f16,%f0,%f0

# qhasm: 				f235g64 = f235 * g64
# asm 1: fmuld <f235=float64#13,<g64=float64#12,>f235g64=float64#9
# asm 2: fmuld <f235=%f24,<g64=%f22,>f235g64=%f16
fmuld %f24,%f22,%f16

# qhasm: 					i3 = f107g192 + f128g171
# asm 1: faddd <f107g192=float64#4,<f128g171=float64#15,>i3=float64#4
# asm 2: faddd <f107g192=%f6,<f128g171=%f28,>i3=%f6
faddd %f6,%f28,%f6

# qhasm: 				h320 = f86 * g235
# asm 1: fmuld <f86=float64#14,<g235=float64#22,>h320=float64#12
# asm 2: fmuld <f86=%f26,<g235=%f42,>h320=%f22
fmuld %f26,%f42,%f22

# qhasm: 					h299 += f150g150
# asm 1: faddd <h299=float64#10,<f150g150=float64#3,>h299=float64#3
# asm 2: faddd <h299=%f18,<f150g150=%f4,>h299=%f4
faddd %f18,%f4,%f4

# qhasm: 				f107g214 = f107 * g214
# asm 1: fmuld <f107=float64#28,<g214=float64#29,>f107g214=float64#10
# asm 2: fmuld <f107=%f54,<g214=%f56,>f107g214=%f18
fmuld %f54,%f56,%f18

# qhasm: 					i2 = f171g128 + f192g107
# asm 1: faddd <f171g128=float64#8,<f192g107=float64#2,>i2=float64#2
# asm 2: faddd <f171g128=%f14,<f192g107=%f2,>i2=%f2
faddd %f14,%f2,%f2

# qhasm: 				f128g192 = f128 * g192
# asm 1: fmuld <f128=float64#20,<g192=float64#19,>f128g192=float64#8
# asm 2: fmuld <f128=%f38,<g192=%f36,>f128g192=%f14
fmuld %f38,%f36,%f14

# qhasm: 					h278 += i1
# asm 1: faddd <h278=float64#7,<i1=float64#1,>h278=float64#1
# asm 2: faddd <h278=%f12,<i1=%f0,>h278=%f0
faddd %f12,%f0,%f0

# qhasm: 				f150g171 = f150 * g171
# asm 1: fmuld <f150=float64#27,<g171=float64#26,>f150g171=float64#7
# asm 2: fmuld <f150=%f52,<g171=%f50,>f150g171=%f12
fmuld %f52,%f50,%f12

# qhasm: 					i3 += f214g86
# asm 1: faddd <i3=float64#4,<f214g86=float64#17,>i3=float64#4
# asm 2: faddd <i3=%f6,<f214g86=%f32,>i3=%f6
faddd %f6,%f32,%f6

# qhasm: 				f171g150 = f171 * g150
# asm 1: fmuld <f171=float64#16,<g150=float64#11,>f171g150=float64#14
# asm 2: fmuld <f171=%f30,<g150=%f20,>f171g150=%f26
fmuld %f30,%f20,%f26

# qhasm: 					h299 += f235g64
# asm 1: faddd <h299=float64#3,<f235g64=float64#9,>h299=float64#3
# asm 2: faddd <h299=%f4,<f235g64=%f16,>h299=%f4
faddd %f4,%f16,%f4

# qhasm: 				f192g128 = f192 * g128
# asm 1: fmuld <f192=float64#24,<g128=float64#18,>f192g128=float64#9
# asm 2: fmuld <f192=%f46,<g128=%f34,>f192g128=%f16
fmuld %f46,%f34,%f16

# qhasm: 					h320 += f107g214
# asm 1: faddd <h320=float64#12,<f107g214=float64#10,>h320=float64#10
# asm 2: faddd <h320=%f22,<f107g214=%f18,>h320=%f18
faddd %f22,%f18,%f18

# qhasm: 				f214g107 = f214 * g107
# asm 1: fmuld <f214=float64#25,<g107=float64#6,>f214g107=float64#12
# asm 2: fmuld <f214=%f48,<g107=%f10,>f214g107=%f22
fmuld %f48,%f10,%f22

# qhasm: 							*(float64 *) (h + 104) = h278
# asm 1: std <h278=float64#1,[<h=int64#1+104]
# asm 2: std <h278=%f0,[<h=%i0+104]
std %f0,[%i0+104]

# qhasm: 				f235g86 = f235 * g86
# asm 1: fmuld <f235=float64#13,<g86=float64#5,>f235g86=float64#1
# asm 2: fmuld <f235=%f24,<g86=%f8,>f235g86=%f0
fmuld %f24,%f8,%f0

# qhasm: 					i2 += i3
# asm 1: faddd <i2=float64#2,<i3=float64#4,>i2=float64#2
# asm 2: faddd <i2=%f2,<i3=%f6,>i2=%f2
faddd %f2,%f6,%f2

# qhasm: 				h342 = f107 * g235
# asm 1: fmuld <f107=float64#28,<g235=float64#22,>h342=float64#4
# asm 2: fmuld <f107=%f54,<g235=%f42,>h342=%f6
fmuld %f54,%f42,%f6

# qhasm: 					i1 = f128g192 + f150g171
# asm 1: faddd <f128g192=float64#8,<f150g171=float64#7,>i1=float64#5
# asm 2: faddd <f128g192=%f14,<f150g171=%f12,>i1=%f8
faddd %f14,%f12,%f8

# qhasm: 				f128g214 = f128 * g214
# asm 1: fmuld <f128=float64#20,<g214=float64#29,>f128g214=float64#7
# asm 2: fmuld <f128=%f38,<g214=%f56,>f128g214=%f12
fmuld %f38,%f56,%f12

# qhasm: 					h320 += f171g150
# asm 1: faddd <h320=float64#10,<f171g150=float64#14,>h320=float64#8
# asm 2: faddd <h320=%f18,<f171g150=%f26,>h320=%f14
faddd %f18,%f26,%f14

# qhasm: 				f150g192 = f150 * g192
# asm 1: fmuld <f150=float64#27,<g192=float64#19,>f150g192=float64#10
# asm 2: fmuld <f150=%f52,<g192=%f36,>f150g192=%f18
fmuld %f52,%f36,%f18

# qhasm: 					i4 = f192g128 + f214g107
# asm 1: faddd <f192g128=float64#9,<f214g107=float64#12,>i4=float64#9
# asm 2: faddd <f192g128=%f16,<f214g107=%f22,>i4=%f16
faddd %f16,%f22,%f16

# qhasm: 				f171g171 = f171 * g171
# asm 1: fmuld <f171=float64#16,<g171=float64#26,>f171g171=float64#12
# asm 2: fmuld <f171=%f30,<g171=%f50,>f171g171=%f22
fmuld %f30,%f50,%f22

# qhasm: 					h299 += i2
# asm 1: faddd <h299=float64#3,<i2=float64#2,>h299=float64#2
# asm 2: faddd <h299=%f4,<i2=%f2,>h299=%f2
faddd %f4,%f2,%f2

# qhasm: 				f192g150 = f192 * g150
# asm 1: fmuld <f192=float64#24,<g150=float64#11,>f192g150=float64#3
# asm 2: fmuld <f192=%f46,<g150=%f20,>f192g150=%f4
fmuld %f46,%f20,%f4

# qhasm: 					i1 += f235g86
# asm 1: faddd <i1=float64#5,<f235g86=float64#1,>i1=float64#1
# asm 2: faddd <i1=%f8,<f235g86=%f0,>i1=%f0
faddd %f8,%f0,%f0

# qhasm: 				f214g128 = f214 * g128
# asm 1: fmuld <f214=float64#25,<g128=float64#18,>f214g128=float64#5
# asm 2: fmuld <f214=%f48,<g128=%f34,>f214g128=%f8
fmuld %f48,%f34,%f8

# qhasm: 					h342 += f128g214
# asm 1: faddd <h342=float64#4,<f128g214=float64#7,>h342=float64#4
# asm 2: faddd <h342=%f6,<f128g214=%f12,>h342=%f6
faddd %f6,%f12,%f6

# qhasm: 				f235g107 = f235 * g107
# asm 1: fmuld <f235=float64#13,<g107=float64#6,>f235g107=float64#6
# asm 2: fmuld <f235=%f24,<g107=%f10,>f235g107=%f10
fmuld %f24,%f10,%f10

# qhasm: 					h320 += i4
# asm 1: faddd <h320=float64#8,<i4=float64#9,>h320=float64#7
# asm 2: faddd <h320=%f14,<i4=%f16,>h320=%f12
faddd %f14,%f16,%f12

# qhasm: 				h363 = f128 * g235
# asm 1: fmuld <f128=float64#20,<g235=float64#22,>h363=float64#8
# asm 2: fmuld <f128=%f38,<g235=%f42,>h363=%f14
fmuld %f38,%f42,%f14

# qhasm: 					i2 = f150g192 + f171g171
# asm 1: faddd <f150g192=float64#10,<f171g171=float64#12,>i2=float64#9
# asm 2: faddd <f150g192=%f18,<f171g171=%f22,>i2=%f16
faddd %f18,%f22,%f16

# qhasm: 							*(float64 *) (h + 112) = h299
# asm 1: std <h299=float64#2,[<h=int64#1+112]
# asm 2: std <h299=%f2,[<h=%i0+112]
std %f2,[%i0+112]

# qhasm: 				f150g214 = f150 * g214
# asm 1: fmuld <f150=float64#27,<g214=float64#29,>f150g214=float64#2
# asm 2: fmuld <f150=%f52,<g214=%f56,>f150g214=%f2
fmuld %f52,%f56,%f2

# qhasm: 					i3 = f192g150 + f214g128
# asm 1: faddd <f192g150=float64#3,<f214g128=float64#5,>i3=float64#3
# asm 2: faddd <f192g150=%f4,<f214g128=%f8,>i3=%f4
faddd %f4,%f8,%f4

# qhasm: 				f171g192 = f171 * g192
# asm 1: fmuld <f171=float64#16,<g192=float64#19,>f171g192=float64#5
# asm 2: fmuld <f171=%f30,<g192=%f36,>f171g192=%f8
fmuld %f30,%f36,%f8

# qhasm: 					h342 += f235g107
# asm 1: faddd <h342=float64#4,<f235g107=float64#6,>h342=float64#4
# asm 2: faddd <h342=%f6,<f235g107=%f10,>h342=%f6
faddd %f6,%f10,%f6

# qhasm: 				f192g171 = f192 * g171
# asm 1: fmuld <f192=float64#24,<g171=float64#26,>f192g171=float64#6
# asm 2: fmuld <f192=%f46,<g171=%f50,>f192g171=%f10
fmuld %f46,%f50,%f10

# qhasm: 					h320 += i1
# asm 1: faddd <h320=float64#7,<i1=float64#1,>h320=float64#1
# asm 2: faddd <h320=%f12,<i1=%f0,>h320=%f0
faddd %f12,%f0,%f0

# qhasm: 				f214g150 = f214 * g150
# asm 1: fmuld <f214=float64#25,<g150=float64#11,>f214g150=float64#7
# asm 2: fmuld <f214=%f48,<g150=%f20,>f214g150=%f12
fmuld %f48,%f20,%f12

# qhasm: 				f235g128 = f235 * g128
# asm 1: fmuld <f235=float64#13,<g128=float64#18,>f235g128=float64#10
# asm 2: fmuld <f235=%f24,<g128=%f34,>f235g128=%f18
fmuld %f24,%f34,%f18

# qhasm: 					i2 += i3
# asm 1: faddd <i2=float64#9,<i3=float64#3,>i2=float64#3
# asm 2: faddd <i2=%f16,<i3=%f4,>i2=%f4
faddd %f16,%f4,%f4

# qhasm: 				h384 = f150 * g235
# asm 1: fmuld <f150=float64#27,<g235=float64#22,>h384=float64#9
# asm 2: fmuld <f150=%f52,<g235=%f42,>h384=%f16
fmuld %f52,%f42,%f16

# qhasm: 					h363 += f150g214
# asm 1: faddd <h363=float64#8,<f150g214=float64#2,>h363=float64#2
# asm 2: faddd <h363=%f14,<f150g214=%f2,>h363=%f2
faddd %f14,%f2,%f2

# qhasm: 				f171g214 = f171 * g214
# asm 1: fmuld <f171=float64#16,<g214=float64#29,>f171g214=float64#8
# asm 2: fmuld <f171=%f30,<g214=%f56,>f171g214=%f14
fmuld %f30,%f56,%f14

# qhasm: 					i1 = f171g192 + f192g171
# asm 1: faddd <f171g192=float64#5,<f192g171=float64#6,>i1=float64#5
# asm 2: faddd <f171g192=%f8,<f192g171=%f10,>i1=%f8
faddd %f8,%f10,%f8

# qhasm: 							*(float64 *) (h + 120) = h320
# asm 1: std <h320=float64#1,[<h=int64#1+120]
# asm 2: std <h320=%f0,[<h=%i0+120]
std %f0,[%i0+120]

# qhasm: 				f192g192 = f192 * g192
# asm 1: fmuld <f192=float64#24,<g192=float64#19,>f192g192=float64#1
# asm 2: fmuld <f192=%f46,<g192=%f36,>f192g192=%f0
fmuld %f46,%f36,%f0

# qhasm: 				f214g171 = f214 * g171
# asm 1: fmuld <f214=float64#25,<g171=float64#26,>f214g171=float64#6
# asm 2: fmuld <f214=%f48,<g171=%f50,>f214g171=%f10
fmuld %f48,%f50,%f10

# qhasm: 					h342 += i2
# asm 1: faddd <h342=float64#4,<i2=float64#3,>h342=float64#3
# asm 2: faddd <h342=%f6,<i2=%f4,>h342=%f4
faddd %f6,%f4,%f4

# qhasm: 				f235g150 = f235 * g150
# asm 1: fmuld <f235=float64#13,<g150=float64#11,>f235g150=float64#4
# asm 2: fmuld <f235=%f24,<g150=%f20,>f235g150=%f6
fmuld %f24,%f20,%f6

# qhasm: 					h363 += f214g150
# asm 1: faddd <h363=float64#2,<f214g150=float64#7,>h363=float64#2
# asm 2: faddd <h363=%f2,<f214g150=%f12,>h363=%f2
faddd %f2,%f12,%f2

# qhasm: 				h406 = f171 * g235
# asm 1: fmuld <f171=float64#16,<g235=float64#22,>h406=float64#7
# asm 2: fmuld <f171=%f30,<g235=%f42,>h406=%f12
fmuld %f30,%f42,%f12

# qhasm: 					i1 += f235g128
# asm 1: faddd <i1=float64#5,<f235g128=float64#10,>i1=float64#5
# asm 2: faddd <i1=%f8,<f235g128=%f18,>i1=%f8
faddd %f8,%f18,%f8

# qhasm: 				f192g214 = f192 * g214
# asm 1: fmuld <f192=float64#24,<g214=float64#29,>f192g214=float64#10
# asm 2: fmuld <f192=%f46,<g214=%f56,>f192g214=%f18
fmuld %f46,%f56,%f18

# qhasm: 					h384 += f171g214
# asm 1: faddd <h384=float64#9,<f171g214=float64#8,>h384=float64#8
# asm 2: faddd <h384=%f16,<f171g214=%f14,>h384=%f14
faddd %f16,%f14,%f14

# qhasm: 				f214g192 = f214 * g192
# asm 1: fmuld <f214=float64#25,<g192=float64#19,>f214g192=float64#9
# asm 2: fmuld <f214=%f48,<g192=%f36,>f214g192=%f16
fmuld %f48,%f36,%f16

# qhasm: 					i3 = f192g192 + f214g171
# asm 1: faddd <f192g192=float64#1,<f214g171=float64#6,>i3=float64#1
# asm 2: faddd <f192g192=%f0,<f214g171=%f10,>i3=%f0
faddd %f0,%f10,%f0

# qhasm: 							*(float64 *) (h + 128) = h342
# asm 1: std <h342=float64#3,[<h=int64#1+128]
# asm 2: std <h342=%f4,[<h=%i0+128]
std %f4,[%i0+128]

# qhasm: 				f235g171 = f235 * g171
# asm 1: fmuld <f235=float64#13,<g171=float64#26,>f235g171=float64#3
# asm 2: fmuld <f235=%f24,<g171=%f50,>f235g171=%f4
fmuld %f24,%f50,%f4

# qhasm: 				h427 = f192 * g235
# asm 1: fmuld <f192=float64#24,<g235=float64#22,>h427=float64#6
# asm 2: fmuld <f192=%f46,<g235=%f42,>h427=%f10
fmuld %f46,%f42,%f10

# qhasm: 					h363 += i1
# asm 1: faddd <h363=float64#2,<i1=float64#5,>h363=float64#2
# asm 2: faddd <h363=%f2,<i1=%f8,>h363=%f2
faddd %f2,%f8,%f2

# qhasm: 				f214g214 = f214 * g214
# asm 1: fmuld <f214=float64#25,<g214=float64#29,>f214g214=float64#5
# asm 2: fmuld <f214=%f48,<g214=%f56,>f214g214=%f8
fmuld %f48,%f56,%f8

# qhasm: 					h384 += f235g150
# asm 1: faddd <h384=float64#8,<f235g150=float64#4,>h384=float64#4
# asm 2: faddd <h384=%f14,<f235g150=%f6,>h384=%f6
faddd %f14,%f6,%f6

# qhasm: 				f235g192 = f235 * g192
# asm 1: fmuld <f235=float64#13,<g192=float64#19,>f235g192=float64#8
# asm 2: fmuld <f235=%f24,<g192=%f36,>f235g192=%f14
fmuld %f24,%f36,%f14

# qhasm: 					h406 += f192g214
# asm 1: faddd <h406=float64#7,<f192g214=float64#10,>h406=float64#7
# asm 2: faddd <h406=%f12,<f192g214=%f18,>h406=%f12
faddd %f12,%f18,%f12

# qhasm: 				h448 = f214 * g235
# asm 1: fmuld <f214=float64#25,<g235=float64#22,>h448=float64#10
# asm 2: fmuld <f214=%f48,<g235=%f42,>h448=%f18
fmuld %f48,%f42,%f18

# qhasm: 					i2 = f214g192 + f235g171
# asm 1: faddd <f214g192=float64#9,<f235g171=float64#3,>i2=float64#3
# asm 2: faddd <f214g192=%f16,<f235g171=%f4,>i2=%f4
faddd %f16,%f4,%f4

# qhasm: 				f235g214 = f235 * g214
# asm 1: fmuld <f235=float64#13,<g214=float64#29,>f235g214=float64#9
# asm 2: fmuld <f235=%f24,<g214=%f56,>f235g214=%f16
fmuld %f24,%f56,%f16

# qhasm: 							*(float64 *) (h + 136) = h363
# asm 1: std <h363=float64#2,[<h=int64#1+136]
# asm 2: std <h363=%f2,[<h=%i0+136]
std %f2,[%i0+136]

# qhasm: 				h470 = f235 * g235
# asm 1: fmuld <f235=float64#13,<g235=float64#22,>h470=float64#2
# asm 2: fmuld <f235=%f24,<g235=%f42,>h470=%f2
fmuld %f24,%f42,%f2

# qhasm: 					h384 += i3
# asm 1: faddd <h384=float64#4,<i3=float64#1,>h384=float64#1
# asm 2: faddd <h384=%f6,<i3=%f0,>h384=%f0
faddd %f6,%f0,%f0

# qhasm: 					h427 += f214g214
# asm 1: faddd <h427=float64#6,<f214g214=float64#5,>h427=float64#4
# asm 2: faddd <h427=%f10,<f214g214=%f8,>h427=%f6
faddd %f10,%f8,%f6

# qhasm: 					h406 += i2
# asm 1: faddd <h406=float64#7,<i2=float64#3,>h406=float64#3
# asm 2: faddd <h406=%f12,<i2=%f4,>h406=%f4
faddd %f12,%f4,%f4

# qhasm: 					h427 += f235g192
# asm 1: faddd <h427=float64#4,<f235g192=float64#8,>h427=float64#4
# asm 2: faddd <h427=%f6,<f235g192=%f14,>h427=%f6
faddd %f6,%f14,%f6

# qhasm: 							*(float64 *) (h + 176) = h470
# asm 1: std <h470=float64#2,[<h=int64#1+176]
# asm 2: std <h470=%f2,[<h=%i0+176]
std %f2,[%i0+176]

# qhasm: 					h448 += f235g214
# asm 1: faddd <h448=float64#10,<f235g214=float64#9,>h448=float64#2
# asm 2: faddd <h448=%f18,<f235g214=%f16,>h448=%f2
faddd %f18,%f16,%f2

# qhasm: 							*(float64 *) (h + 144) = h384
# asm 1: std <h384=float64#1,[<h=int64#1+144]
# asm 2: std <h384=%f0,[<h=%i0+144]
std %f0,[%i0+144]

# qhasm: 							*(float64 *) (h + 144) = h384
# asm 1: std <h384=float64#1,[<h=int64#1+144]
# asm 2: std <h384=%f0,[<h=%i0+144]
std %f0,[%i0+144]

# qhasm: 							*(float64 *) (h + 152) = h406
# asm 1: std <h406=float64#3,[<h=int64#1+152]
# asm 2: std <h406=%f4,[<h=%i0+152]
std %f4,[%i0+152]

# qhasm: 							*(float64 *) (h + 160) = h427
# asm 1: std <h427=float64#4,[<h=int64#1+160]
# asm 2: std <h427=%f6,[<h=%i0+160]
std %f6,[%i0+160]

# qhasm: 							*(float64 *) (h + 168) = h448
# asm 1: std <h448=float64#2,[<h=int64#1+168]
# asm 2: std <h448=%f2,[<h=%i0+168]
std %f2,[%i0+168]

# qhasm: leave
ret
restore
