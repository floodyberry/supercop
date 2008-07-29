
# qhasm: enter nistp256_add
.section ".text"
.align 32
.global nistp256_add
nistp256_add:
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

# qhasm: 				h0 = f0 + g0
# asm 1: faddd <f0=float64#1,<g0=float64#2,>h0=float64#1
# asm 2: faddd <f0=%f0,<g0=%f2,>h0=%f0
faddd %f0,%f2,%f0

# qhasm: f43 = *(float64 *) (f + 16)
# asm 1: ldd [<f=int64#2+16],>f43=float64#2
# asm 2: ldd [<f=%i1+16],>f43=%f2
ldd [%i1+16],%f2

# qhasm: g43 = *(float64 *) (g + 16)
# asm 1: ldd [<g=int64#3+16],>g43=float64#5
# asm 2: ldd [<g=%i2+16],>g43=%f8
ldd [%i2+16],%f8

# qhasm: 				h22 = f22 + g22
# asm 1: faddd <f22=float64#3,<g22=float64#4,>h22=float64#3
# asm 2: faddd <f22=%f4,<g22=%f6,>h22=%f4
faddd %f4,%f6,%f4

# qhasm: f64 = *(float64 *) (f + 24)
# asm 1: ldd [<f=int64#2+24],>f64=float64#4
# asm 2: ldd [<f=%i1+24],>f64=%f6
ldd [%i1+24],%f6

# qhasm: g64 = *(float64 *) (g + 24)
# asm 1: ldd [<g=int64#3+24],>g64=float64#6
# asm 2: ldd [<g=%i2+24],>g64=%f10
ldd [%i2+24],%f10

# qhasm: 				h43 = f43 + g43
# asm 1: faddd <f43=float64#2,<g43=float64#5,>h43=float64#2
# asm 2: faddd <f43=%f2,<g43=%f8,>h43=%f2
faddd %f2,%f8,%f2

# qhasm: 						*(float64 *) (h + 0) = h0
# asm 1: std <h0=float64#1,[<h=int64#1+0]
# asm 2: std <h0=%f0,[<h=%i0+0]
std %f0,[%i0+0]

# qhasm: f86 = *(float64 *) (f + 32)
# asm 1: ldd [<f=int64#2+32],>f86=float64#1
# asm 2: ldd [<f=%i1+32],>f86=%f0
ldd [%i1+32],%f0

# qhasm: g86 = *(float64 *) (g + 32)
# asm 1: ldd [<g=int64#3+32],>g86=float64#5
# asm 2: ldd [<g=%i2+32],>g86=%f8
ldd [%i2+32],%f8

# qhasm: 				h64 = f64 + g64
# asm 1: faddd <f64=float64#4,<g64=float64#6,>h64=float64#4
# asm 2: faddd <f64=%f6,<g64=%f10,>h64=%f6
faddd %f6,%f10,%f6

# qhasm: 						*(float64 *) (h + 8) = h22
# asm 1: std <h22=float64#3,[<h=int64#1+8]
# asm 2: std <h22=%f4,[<h=%i0+8]
std %f4,[%i0+8]

# qhasm: f107 = *(float64 *) (f + 40)
# asm 1: ldd [<f=int64#2+40],>f107=float64#3
# asm 2: ldd [<f=%i1+40],>f107=%f4
ldd [%i1+40],%f4

# qhasm: g107 = *(float64 *) (g + 40)
# asm 1: ldd [<g=int64#3+40],>g107=float64#6
# asm 2: ldd [<g=%i2+40],>g107=%f10
ldd [%i2+40],%f10

# qhasm: 				h86 = f86 + g86
# asm 1: faddd <f86=float64#1,<g86=float64#5,>h86=float64#1
# asm 2: faddd <f86=%f0,<g86=%f8,>h86=%f0
faddd %f0,%f8,%f0

# qhasm: 						*(float64 *) (h + 16) = h43
# asm 1: std <h43=float64#2,[<h=int64#1+16]
# asm 2: std <h43=%f2,[<h=%i0+16]
std %f2,[%i0+16]

# qhasm: f128 = *(float64 *) (f + 48)
# asm 1: ldd [<f=int64#2+48],>f128=float64#2
# asm 2: ldd [<f=%i1+48],>f128=%f2
ldd [%i1+48],%f2

# qhasm: g128 = *(float64 *) (g + 48)
# asm 1: ldd [<g=int64#3+48],>g128=float64#5
# asm 2: ldd [<g=%i2+48],>g128=%f8
ldd [%i2+48],%f8

# qhasm: 				h107 = f107 + g107
# asm 1: faddd <f107=float64#3,<g107=float64#6,>h107=float64#3
# asm 2: faddd <f107=%f4,<g107=%f10,>h107=%f4
faddd %f4,%f10,%f4

# qhasm: 						*(float64 *) (h + 24) = h64
# asm 1: std <h64=float64#4,[<h=int64#1+24]
# asm 2: std <h64=%f6,[<h=%i0+24]
std %f6,[%i0+24]

# qhasm: f150 = *(float64 *) (f + 56)
# asm 1: ldd [<f=int64#2+56],>f150=float64#4
# asm 2: ldd [<f=%i1+56],>f150=%f6
ldd [%i1+56],%f6

# qhasm: g150 = *(float64 *) (g + 56)
# asm 1: ldd [<g=int64#3+56],>g150=float64#6
# asm 2: ldd [<g=%i2+56],>g150=%f10
ldd [%i2+56],%f10

# qhasm: 				h128 = f128 + g128
# asm 1: faddd <f128=float64#2,<g128=float64#5,>h128=float64#2
# asm 2: faddd <f128=%f2,<g128=%f8,>h128=%f2
faddd %f2,%f8,%f2

# qhasm: 						*(float64 *) (h + 32) = h86
# asm 1: std <h86=float64#1,[<h=int64#1+32]
# asm 2: std <h86=%f0,[<h=%i0+32]
std %f0,[%i0+32]

# qhasm: f171 = *(float64 *) (f + 64)
# asm 1: ldd [<f=int64#2+64],>f171=float64#1
# asm 2: ldd [<f=%i1+64],>f171=%f0
ldd [%i1+64],%f0

# qhasm: g171 = *(float64 *) (g + 64)
# asm 1: ldd [<g=int64#3+64],>g171=float64#5
# asm 2: ldd [<g=%i2+64],>g171=%f8
ldd [%i2+64],%f8

# qhasm: 				h150 = f150 + g150
# asm 1: faddd <f150=float64#4,<g150=float64#6,>h150=float64#4
# asm 2: faddd <f150=%f6,<g150=%f10,>h150=%f6
faddd %f6,%f10,%f6

# qhasm: 						*(float64 *) (h + 40) = h107
# asm 1: std <h107=float64#3,[<h=int64#1+40]
# asm 2: std <h107=%f4,[<h=%i0+40]
std %f4,[%i0+40]

# qhasm: f192 = *(float64 *) (f + 72)
# asm 1: ldd [<f=int64#2+72],>f192=float64#3
# asm 2: ldd [<f=%i1+72],>f192=%f4
ldd [%i1+72],%f4

# qhasm: g192 = *(float64 *) (g + 72)
# asm 1: ldd [<g=int64#3+72],>g192=float64#6
# asm 2: ldd [<g=%i2+72],>g192=%f10
ldd [%i2+72],%f10

# qhasm: 				h171 = f171 + g171
# asm 1: faddd <f171=float64#1,<g171=float64#5,>h171=float64#1
# asm 2: faddd <f171=%f0,<g171=%f8,>h171=%f0
faddd %f0,%f8,%f0

# qhasm: 						*(float64 *) (h + 48) = h128
# asm 1: std <h128=float64#2,[<h=int64#1+48]
# asm 2: std <h128=%f2,[<h=%i0+48]
std %f2,[%i0+48]

# qhasm: f214 = *(float64 *) (f + 80)
# asm 1: ldd [<f=int64#2+80],>f214=float64#2
# asm 2: ldd [<f=%i1+80],>f214=%f2
ldd [%i1+80],%f2

# qhasm: g214 = *(float64 *) (g + 80)
# asm 1: ldd [<g=int64#3+80],>g214=float64#5
# asm 2: ldd [<g=%i2+80],>g214=%f8
ldd [%i2+80],%f8

# qhasm: 				h192 = f192 + g192
# asm 1: faddd <f192=float64#3,<g192=float64#6,>h192=float64#3
# asm 2: faddd <f192=%f4,<g192=%f10,>h192=%f4
faddd %f4,%f10,%f4

# qhasm: 						*(float64 *) (h + 56) = h150
# asm 1: std <h150=float64#4,[<h=int64#1+56]
# asm 2: std <h150=%f6,[<h=%i0+56]
std %f6,[%i0+56]

# qhasm: f235 = *(float64 *) (f + 88)
# asm 1: ldd [<f=int64#2+88],>f235=float64#4
# asm 2: ldd [<f=%i1+88],>f235=%f6
ldd [%i1+88],%f6

# qhasm: g235 = *(float64 *) (g + 88)
# asm 1: ldd [<g=int64#3+88],>g235=float64#6
# asm 2: ldd [<g=%i2+88],>g235=%f10
ldd [%i2+88],%f10

# qhasm: 				h214 = f214 + g214
# asm 1: faddd <f214=float64#2,<g214=float64#5,>h214=float64#2
# asm 2: faddd <f214=%f2,<g214=%f8,>h214=%f2
faddd %f2,%f8,%f2

# qhasm: 						*(float64 *) (h + 64) = h171
# asm 1: std <h171=float64#1,[<h=int64#1+64]
# asm 2: std <h171=%f0,[<h=%i0+64]
std %f0,[%i0+64]

# qhasm: *(float64 *) (h + 72) = h192
# asm 1: std <h192=float64#3,[<h=int64#1+72]
# asm 2: std <h192=%f4,[<h=%i0+72]
std %f4,[%i0+72]

# qhasm: *(float64 *) (h + 80) = h214
# asm 1: std <h214=float64#2,[<h=int64#1+80]
# asm 2: std <h214=%f2,[<h=%i0+80]
std %f2,[%i0+80]

# qhasm: 				h235 = f235 + g235
# asm 1: faddd <f235=float64#4,<g235=float64#6,>h235=float64#1
# asm 2: faddd <f235=%f6,<g235=%f10,>h235=%f0
faddd %f6,%f10,%f0

# qhasm: *(float64 *) (h + 88) = h235
# asm 1: std <h235=float64#1,[<h=int64#1+88]
# asm 2: std <h235=%f0,[<h=%i0+88]
std %f0,[%i0+88]

# qhasm: leave
ret
restore
