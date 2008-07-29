
# qhasm: enter nistp256_modp
.section ".text"
.align 32
.global nistp256_modp
nistp256_modp:
save %sp,-176,%sp

# qhasm: int64 r

# qhasm: int64 h

# qhasm: input r

# qhasm: input h

# qhasm: int64 constants

# qhasm: int64 constants_low

# qhasm: float64 scale32

# qhasm: float64 scale64

# qhasm: float64 scale160

# qhasm: float64 scale256

# qhasm: float64 x1

# qhasm: float64 x2

# qhasm: float64 x3

# qhasm: float64 x4

# qhasm: float64 x5

# qhasm: float64 x6

# qhasm: float64 x7

# qhasm: float64 x8

# qhasm: float64 alpha22

# qhasm: float64 alpha43

# qhasm: float64 alpha64

# qhasm: float64 alpha86

# qhasm: float64 alpha107

# qhasm: float64 alpha128

# qhasm: float64 alpha150

# qhasm: float64 alpha171

# qhasm: float64 alpha192

# qhasm: float64 alpha214

# qhasm: float64 alpha235

# qhasm: float64 alpha256

# qhasm: float64 alpha278

# qhasm: float64 alpha299

# qhasm: float64 alpha320

# qhasm: float64 alpha342

# qhasm: float64 alpha363

# qhasm: float64 alpha384

# qhasm: float64 alpha406

# qhasm: float64 alpha427

# qhasm: float64 alpha448

# qhasm: float64 alpha470

# qhasm: float64 alpha491

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

# qhasm: float64 closest22

# qhasm: float64 closest43

# qhasm: float64 closest64

# qhasm: float64 closest86

# qhasm: float64 closest107

# qhasm: float64 closest128

# qhasm: float64 closest150

# qhasm: float64 closest171

# qhasm: float64 closest192

# qhasm: float64 closest214

# qhasm: float64 closest235

# qhasm: float64 closest256

# qhasm: float64 closest278

# qhasm: float64 closest299

# qhasm: float64 closest320

# qhasm: float64 closest342

# qhasm: float64 closest363

# qhasm: float64 closest384

# qhasm: float64 closest406

# qhasm: float64 closest427

# qhasm: float64 closest448

# qhasm: float64 closest470

# qhasm: float64 closest491

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

# qhasm: h470 = *(float64 *) (h + 176)
# asm 1: ldd [<h=int64#2+176],>h470=float64#1
# asm 2: ldd [<h=%i1+176],>h470=%f0
ldd [%i1+176],%f0

# qhasm: scale32 = *(float64 *)(constants + 144)
# asm 1: ldd [<constants=int64#3+144],>scale32=float64#2
# asm 2: ldd [<constants=%i2+144],>scale32=%f2
ldd [%i2+144],%f2

# qhasm: scale64 = *(float64 *)(constants + 152)
# asm 1: ldd [<constants=int64#3+152],>scale64=float64#3
# asm 2: ldd [<constants=%i2+152],>scale64=%f4
ldd [%i2+152],%f4

# qhasm: scale160 = *(float64 *)(constants + 160)
# asm 1: ldd [<constants=int64#3+160],>scale160=float64#4
# asm 2: ldd [<constants=%i2+160],>scale160=%f6
ldd [%i2+160],%f6

# qhasm: alpha491 = *(float64 *)(constants + 256)
# asm 1: ldd [<constants=int64#3+256],>alpha491=float64#5
# asm 2: ldd [<constants=%i2+256],>alpha491=%f8
ldd [%i2+256],%f8

# qhasm: 				closest491 = h470 + alpha491
# asm 1: faddd <h470=float64#1,<alpha491=float64#5,>closest491=float64#6
# asm 2: faddd <h470=%f0,<alpha491=%f8,>closest491=%f10
faddd %f0,%f8,%f10

# qhasm: scale256 = *(float64 *)(constants + 168)
# asm 1: ldd [<constants=int64#3+168],>scale256=float64#7
# asm 2: ldd [<constants=%i2+168],>scale256=%f12
ldd [%i2+168],%f12

# qhasm: 				closest491 -= alpha491
# asm 1: fsubd <closest491=float64#6,<alpha491=float64#5,>closest491=float64#5
# asm 2: fsubd <closest491=%f10,<alpha491=%f8,>closest491=%f8
fsubd %f10,%f8,%f8

# qhasm: h448 = *(float64 *) (h + 168)
# asm 1: ldd [<h=int64#2+168],>h448=float64#6
# asm 2: ldd [<h=%i1+168],>h448=%f10
ldd [%i1+168],%f10

# qhasm: 				x1 = closest491 * scale32
# asm 1: fmuld <closest491=float64#5,<scale32=float64#2,>x1=float64#8
# asm 2: fmuld <closest491=%f8,<scale32=%f2,>x1=%f14
fmuld %f8,%f2,%f14

# qhasm: 						h470 -= closest491
# asm 1: fsubd <h470=float64#1,<closest491=float64#5,>h470=float64#1
# asm 2: fsubd <h470=%f0,<closest491=%f8,>h470=%f0
fsubd %f0,%f8,%f0

# qhasm: h427 = *(float64 *) (h + 160)
# asm 1: ldd [<h=int64#2+160],>h427=float64#9
# asm 2: ldd [<h=%i1+160],>h427=%f16
ldd [%i1+160],%f16

# qhasm: 				x2 = closest491 * scale64
# asm 1: fmuld <closest491=float64#5,<scale64=float64#3,>x2=float64#10
# asm 2: fmuld <closest491=%f8,<scale64=%f4,>x2=%f18
fmuld %f8,%f4,%f18

# qhasm: h320 = *(float64 *) (h + 120)
# asm 1: ldd [<h=int64#2+120],>h320=float64#11
# asm 2: ldd [<h=%i1+120],>h320=%f20
ldd [%i1+120],%f20

# qhasm: 				x3 = closest491 * scale160
# asm 1: fmuld <closest491=float64#5,<scale160=float64#4,>x3=float64#12
# asm 2: fmuld <closest491=%f8,<scale160=%f6,>x3=%f22
fmuld %f8,%f6,%f22

# qhasm: h235 = *(float64 *) (h + 88)
# asm 1: ldd [<h=int64#2+88],>h235=float64#13
# asm 2: ldd [<h=%i1+88],>h235=%f24
ldd [%i1+88],%f24

# qhasm: 				x4 = closest491 * scale256
# asm 1: fmuld <closest491=float64#5,<scale256=float64#7,>x4=float64#5
# asm 2: fmuld <closest491=%f8,<scale256=%f12,>x4=%f8
fmuld %f8,%f12,%f8

# qhasm: alpha470 = *(float64 *)(constants + 248)
# asm 1: ldd [<constants=int64#3+248],>alpha470=float64#14
# asm 2: ldd [<constants=%i2+248],>alpha470=%f26
ldd [%i2+248],%f26

# qhasm: 				x5 = h470 * scale32
# asm 1: fmuld <h470=float64#1,<scale32=float64#2,>x5=float64#15
# asm 2: fmuld <h470=%f0,<scale32=%f2,>x5=%f28
fmuld %f0,%f2,%f28

# qhasm: 						h448 += x1
# asm 1: faddd <h448=float64#6,<x1=float64#8,>h448=float64#6
# asm 2: faddd <h448=%f10,<x1=%f14,>h448=%f10
faddd %f10,%f14,%f10

# qhasm: 				x6 = h470 * scale64
# asm 1: fmuld <h470=float64#1,<scale64=float64#3,>x6=float64#8
# asm 2: fmuld <h470=%f0,<scale64=%f4,>x6=%f14
fmuld %f0,%f4,%f14

# qhasm: 						h427 -= x2
# asm 1: fsubd <h427=float64#9,<x2=float64#10,>h427=float64#9
# asm 2: fsubd <h427=%f16,<x2=%f18,>h427=%f16
fsubd %f16,%f18,%f16

# qhasm: 				x7 = h470 * scale160
# asm 1: fmuld <h470=float64#1,<scale160=float64#4,>x7=float64#10
# asm 2: fmuld <h470=%f0,<scale160=%f6,>x7=%f18
fmuld %f0,%f6,%f18

# qhasm: 						h320 -= x3
# asm 1: fsubd <h320=float64#11,<x3=float64#12,>h320=float64#11
# asm 2: fsubd <h320=%f20,<x3=%f22,>h320=%f20
fsubd %f20,%f22,%f20

# qhasm: 				x8 = h470 * scale256
# asm 1: fmuld <h470=float64#1,<scale256=float64#7,>x8=float64#1
# asm 2: fmuld <h470=%f0,<scale256=%f12,>x8=%f0
fmuld %f0,%f12,%f0

# qhasm: 						h235 += x4
# asm 1: faddd <h235=float64#13,<x4=float64#5,>h235=float64#5
# asm 2: faddd <h235=%f24,<x4=%f8,>h235=%f8
faddd %f24,%f8,%f8

# qhasm: h406 = *(float64 *) (h + 152)
# asm 1: ldd [<h=int64#2+152],>h406=float64#12
# asm 2: ldd [<h=%i1+152],>h406=%f22
ldd [%i1+152],%f22

# qhasm: 				closest470 = h448 + alpha470
# asm 1: faddd <h448=float64#6,<alpha470=float64#14,>closest470=float64#13
# asm 2: faddd <h448=%f10,<alpha470=%f26,>closest470=%f24
faddd %f10,%f26,%f24

# qhasm: h299 = *(float64 *) (h + 112)
# asm 1: ldd [<h=int64#2+112],>h299=float64#16
# asm 2: ldd [<h=%i1+112],>h299=%f30
ldd [%i1+112],%f30

# qhasm: 				closest470 -= alpha470
# asm 1: fsubd <closest470=float64#13,<alpha470=float64#14,>closest470=float64#13
# asm 2: fsubd <closest470=%f24,<alpha470=%f26,>closest470=%f24
fsubd %f24,%f26,%f24

# qhasm: h214 = *(float64 *) (h + 80)
# asm 1: ldd [<h=int64#2+80],>h214=float64#14
# asm 2: ldd [<h=%i1+80],>h214=%f26
ldd [%i1+80],%f26

# qhasm: 				h448 -= closest470
# asm 1: fsubd <h448=float64#6,<closest470=float64#13,>h448=float64#6
# asm 2: fsubd <h448=%f10,<closest470=%f24,>h448=%f10
fsubd %f10,%f24,%f10

# qhasm: 				x1 = closest470 * scale32
# asm 1: fmuld <closest470=float64#13,<scale32=float64#2,>x1=float64#17
# asm 2: fmuld <closest470=%f24,<scale32=%f2,>x1=%f32
fmuld %f24,%f2,%f32

# qhasm: 						h427 += x5
# asm 1: faddd <h427=float64#9,<x5=float64#15,>h427=float64#9
# asm 2: faddd <h427=%f16,<x5=%f28,>h427=%f16
faddd %f16,%f28,%f16

# qhasm: 				x2 = closest470 * scale64
# asm 1: fmuld <closest470=float64#13,<scale64=float64#3,>x2=float64#15
# asm 2: fmuld <closest470=%f24,<scale64=%f4,>x2=%f28
fmuld %f24,%f4,%f28

# qhasm: 						h406 -= x6
# asm 1: fsubd <h406=float64#12,<x6=float64#8,>h406=float64#8
# asm 2: fsubd <h406=%f22,<x6=%f14,>h406=%f14
fsubd %f22,%f14,%f14

# qhasm: 				x3 = closest470 * scale160
# asm 1: fmuld <closest470=float64#13,<scale160=float64#4,>x3=float64#12
# asm 2: fmuld <closest470=%f24,<scale160=%f6,>x3=%f22
fmuld %f24,%f6,%f22

# qhasm: 						h299 -= x7
# asm 1: fsubd <h299=float64#16,<x7=float64#10,>h299=float64#10
# asm 2: fsubd <h299=%f30,<x7=%f18,>h299=%f18
fsubd %f30,%f18,%f18

# qhasm: 				x4 = closest470 * scale256
# asm 1: fmuld <closest470=float64#13,<scale256=float64#7,>x4=float64#13
# asm 2: fmuld <closest470=%f24,<scale256=%f12,>x4=%f24
fmuld %f24,%f12,%f24

# qhasm: 						h214 += x8
# asm 1: faddd <h214=float64#14,<x8=float64#1,>h214=float64#1
# asm 2: faddd <h214=%f26,<x8=%f0,>h214=%f0
faddd %f26,%f0,%f0

# qhasm: alpha448 = *(float64 *)(constants + 240)
# asm 1: ldd [<constants=int64#3+240],>alpha448=float64#14
# asm 2: ldd [<constants=%i2+240],>alpha448=%f26
ldd [%i2+240],%f26

# qhasm: 				x5 = h448 * scale32
# asm 1: fmuld <h448=float64#6,<scale32=float64#2,>x5=float64#16
# asm 2: fmuld <h448=%f10,<scale32=%f2,>x5=%f30
fmuld %f10,%f2,%f30

# qhasm: 						h427 += x1
# asm 1: faddd <h427=float64#9,<x1=float64#17,>h427=float64#9
# asm 2: faddd <h427=%f16,<x1=%f32,>h427=%f16
faddd %f16,%f32,%f16

# qhasm: 				x6 = h448 * scale64
# asm 1: fmuld <h448=float64#6,<scale64=float64#3,>x6=float64#17
# asm 2: fmuld <h448=%f10,<scale64=%f4,>x6=%f32
fmuld %f10,%f4,%f32

# qhasm: 						h406 -= x2
# asm 1: fsubd <h406=float64#8,<x2=float64#15,>h406=float64#8
# asm 2: fsubd <h406=%f14,<x2=%f28,>h406=%f14
fsubd %f14,%f28,%f14

# qhasm: 				x7 = h448 * scale160
# asm 1: fmuld <h448=float64#6,<scale160=float64#4,>x7=float64#15
# asm 2: fmuld <h448=%f10,<scale160=%f6,>x7=%f28
fmuld %f10,%f6,%f28

# qhasm: 						h299 -= x3
# asm 1: fsubd <h299=float64#10,<x3=float64#12,>h299=float64#10
# asm 2: fsubd <h299=%f18,<x3=%f22,>h299=%f18
fsubd %f18,%f22,%f18

# qhasm: 				x8 = h448 * scale256
# asm 1: fmuld <h448=float64#6,<scale256=float64#7,>x8=float64#6
# asm 2: fmuld <h448=%f10,<scale256=%f12,>x8=%f10
fmuld %f10,%f12,%f10

# qhasm: 						h214 += x4
# asm 1: faddd <h214=float64#1,<x4=float64#13,>h214=float64#1
# asm 2: faddd <h214=%f0,<x4=%f24,>h214=%f0
faddd %f0,%f24,%f0

# qhasm: h384 = *(float64 *) (h + 144)
# asm 1: ldd [<h=int64#2+144],>h384=float64#12
# asm 2: ldd [<h=%i1+144],>h384=%f22
ldd [%i1+144],%f22

# qhasm: 				closest448 = h427 + alpha448
# asm 1: faddd <h427=float64#9,<alpha448=float64#14,>closest448=float64#13
# asm 2: faddd <h427=%f16,<alpha448=%f26,>closest448=%f24
faddd %f16,%f26,%f24

# qhasm: h278 = *(float64 *) (h + 104)
# asm 1: ldd [<h=int64#2+104],>h278=float64#18
# asm 2: ldd [<h=%i1+104],>h278=%f34
ldd [%i1+104],%f34

# qhasm: 				closest448 -= alpha448
# asm 1: fsubd <closest448=float64#13,<alpha448=float64#14,>closest448=float64#13
# asm 2: fsubd <closest448=%f24,<alpha448=%f26,>closest448=%f24
fsubd %f24,%f26,%f24

# qhasm: h192 = *(float64 *) (h + 72)
# asm 1: ldd [<h=int64#2+72],>h192=float64#14
# asm 2: ldd [<h=%i1+72],>h192=%f26
ldd [%i1+72],%f26

# qhasm: 				h427 -= closest448
# asm 1: fsubd <h427=float64#9,<closest448=float64#13,>h427=float64#9
# asm 2: fsubd <h427=%f16,<closest448=%f24,>h427=%f16
fsubd %f16,%f24,%f16

# qhasm: 				x1 = closest448 * scale32
# asm 1: fmuld <closest448=float64#13,<scale32=float64#2,>x1=float64#19
# asm 2: fmuld <closest448=%f24,<scale32=%f2,>x1=%f36
fmuld %f24,%f2,%f36

# qhasm: 						h406 += x5
# asm 1: faddd <h406=float64#8,<x5=float64#16,>h406=float64#8
# asm 2: faddd <h406=%f14,<x5=%f30,>h406=%f14
faddd %f14,%f30,%f14

# qhasm: 				x2 = closest448 * scale64
# asm 1: fmuld <closest448=float64#13,<scale64=float64#3,>x2=float64#16
# asm 2: fmuld <closest448=%f24,<scale64=%f4,>x2=%f30
fmuld %f24,%f4,%f30

# qhasm: 						h384 -= x6
# asm 1: fsubd <h384=float64#12,<x6=float64#17,>h384=float64#12
# asm 2: fsubd <h384=%f22,<x6=%f32,>h384=%f22
fsubd %f22,%f32,%f22

# qhasm: 				x3 = closest448 * scale160
# asm 1: fmuld <closest448=float64#13,<scale160=float64#4,>x3=float64#17
# asm 2: fmuld <closest448=%f24,<scale160=%f6,>x3=%f32
fmuld %f24,%f6,%f32

# qhasm: 						h278 -= x7
# asm 1: fsubd <h278=float64#18,<x7=float64#15,>h278=float64#15
# asm 2: fsubd <h278=%f34,<x7=%f28,>h278=%f28
fsubd %f34,%f28,%f28

# qhasm: 				x4 = closest448 * scale256
# asm 1: fmuld <closest448=float64#13,<scale256=float64#7,>x4=float64#13
# asm 2: fmuld <closest448=%f24,<scale256=%f12,>x4=%f24
fmuld %f24,%f12,%f24

# qhasm: 						h192 += x8
# asm 1: faddd <h192=float64#14,<x8=float64#6,>h192=float64#6
# asm 2: faddd <h192=%f26,<x8=%f10,>h192=%f10
faddd %f26,%f10,%f10

# qhasm: alpha427 = *(float64 *)(constants + 232)
# asm 1: ldd [<constants=int64#3+232],>alpha427=float64#14
# asm 2: ldd [<constants=%i2+232],>alpha427=%f26
ldd [%i2+232],%f26

# qhasm: 				x5 = h427 * scale32
# asm 1: fmuld <h427=float64#9,<scale32=float64#2,>x5=float64#18
# asm 2: fmuld <h427=%f16,<scale32=%f2,>x5=%f34
fmuld %f16,%f2,%f34

# qhasm: 						h406 += x1
# asm 1: faddd <h406=float64#8,<x1=float64#19,>h406=float64#8
# asm 2: faddd <h406=%f14,<x1=%f36,>h406=%f14
faddd %f14,%f36,%f14

# qhasm: 				x6 = h427 * scale64
# asm 1: fmuld <h427=float64#9,<scale64=float64#3,>x6=float64#19
# asm 2: fmuld <h427=%f16,<scale64=%f4,>x6=%f36
fmuld %f16,%f4,%f36

# qhasm: 						h384 -= x2
# asm 1: fsubd <h384=float64#12,<x2=float64#16,>h384=float64#12
# asm 2: fsubd <h384=%f22,<x2=%f30,>h384=%f22
fsubd %f22,%f30,%f22

# qhasm: 				x7 = h427 * scale160
# asm 1: fmuld <h427=float64#9,<scale160=float64#4,>x7=float64#16
# asm 2: fmuld <h427=%f16,<scale160=%f6,>x7=%f30
fmuld %f16,%f6,%f30

# qhasm: 						h278 -= x3
# asm 1: fsubd <h278=float64#15,<x3=float64#17,>h278=float64#15
# asm 2: fsubd <h278=%f28,<x3=%f32,>h278=%f28
fsubd %f28,%f32,%f28

# qhasm: 				x8 = h427 * scale256
# asm 1: fmuld <h427=float64#9,<scale256=float64#7,>x8=float64#9
# asm 2: fmuld <h427=%f16,<scale256=%f12,>x8=%f16
fmuld %f16,%f12,%f16

# qhasm: 						h192 += x4
# asm 1: faddd <h192=float64#6,<x4=float64#13,>h192=float64#6
# asm 2: faddd <h192=%f10,<x4=%f24,>h192=%f10
faddd %f10,%f24,%f10

# qhasm: h363 = *(float64 *) (h + 136)
# asm 1: ldd [<h=int64#2+136],>h363=float64#13
# asm 2: ldd [<h=%i1+136],>h363=%f24
ldd [%i1+136],%f24

# qhasm: 				closest427 = h406 + alpha427
# asm 1: faddd <h406=float64#8,<alpha427=float64#14,>closest427=float64#17
# asm 2: faddd <h406=%f14,<alpha427=%f26,>closest427=%f32
faddd %f14,%f26,%f32

# qhasm: h256 = *(float64 *) (h + 96)
# asm 1: ldd [<h=int64#2+96],>h256=float64#20
# asm 2: ldd [<h=%i1+96],>h256=%f38
ldd [%i1+96],%f38

# qhasm: 				closest427 -= alpha427
# asm 1: fsubd <closest427=float64#17,<alpha427=float64#14,>closest427=float64#14
# asm 2: fsubd <closest427=%f32,<alpha427=%f26,>closest427=%f26
fsubd %f32,%f26,%f26

# qhasm: h171 = *(float64 *) (h + 64)
# asm 1: ldd [<h=int64#2+64],>h171=float64#17
# asm 2: ldd [<h=%i1+64],>h171=%f32
ldd [%i1+64],%f32

# qhasm: 				h406 -= closest427
# asm 1: fsubd <h406=float64#8,<closest427=float64#14,>h406=float64#8
# asm 2: fsubd <h406=%f14,<closest427=%f26,>h406=%f14
fsubd %f14,%f26,%f14

# qhasm: 				x1 = closest427 * scale32
# asm 1: fmuld <closest427=float64#14,<scale32=float64#2,>x1=float64#21
# asm 2: fmuld <closest427=%f26,<scale32=%f2,>x1=%f40
fmuld %f26,%f2,%f40

# qhasm: 						h384 += x5
# asm 1: faddd <h384=float64#12,<x5=float64#18,>h384=float64#12
# asm 2: faddd <h384=%f22,<x5=%f34,>h384=%f22
faddd %f22,%f34,%f22

# qhasm: 				x2 = closest427 * scale64
# asm 1: fmuld <closest427=float64#14,<scale64=float64#3,>x2=float64#18
# asm 2: fmuld <closest427=%f26,<scale64=%f4,>x2=%f34
fmuld %f26,%f4,%f34

# qhasm: 						h363 -= x6
# asm 1: fsubd <h363=float64#13,<x6=float64#19,>h363=float64#13
# asm 2: fsubd <h363=%f24,<x6=%f36,>h363=%f24
fsubd %f24,%f36,%f24

# qhasm: 				x3 = closest427 * scale160
# asm 1: fmuld <closest427=float64#14,<scale160=float64#4,>x3=float64#19
# asm 2: fmuld <closest427=%f26,<scale160=%f6,>x3=%f36
fmuld %f26,%f6,%f36

# qhasm: 						h256 -= x7
# asm 1: fsubd <h256=float64#20,<x7=float64#16,>h256=float64#16
# asm 2: fsubd <h256=%f38,<x7=%f30,>h256=%f30
fsubd %f38,%f30,%f30

# qhasm: 				x4 = closest427 * scale256
# asm 1: fmuld <closest427=float64#14,<scale256=float64#7,>x4=float64#14
# asm 2: fmuld <closest427=%f26,<scale256=%f12,>x4=%f26
fmuld %f26,%f12,%f26

# qhasm: 						h171 += x8
# asm 1: faddd <h171=float64#17,<x8=float64#9,>h171=float64#9
# asm 2: faddd <h171=%f32,<x8=%f16,>h171=%f16
faddd %f32,%f16,%f16

# qhasm: alpha406 = *(float64 *)(constants + 224)
# asm 1: ldd [<constants=int64#3+224],>alpha406=float64#17
# asm 2: ldd [<constants=%i2+224],>alpha406=%f32
ldd [%i2+224],%f32

# qhasm: 				x5 = h406 * scale32
# asm 1: fmuld <h406=float64#8,<scale32=float64#2,>x5=float64#20
# asm 2: fmuld <h406=%f14,<scale32=%f2,>x5=%f38
fmuld %f14,%f2,%f38

# qhasm: 						h384 += x1
# asm 1: faddd <h384=float64#12,<x1=float64#21,>h384=float64#12
# asm 2: faddd <h384=%f22,<x1=%f40,>h384=%f22
faddd %f22,%f40,%f22

# qhasm: 				x6 = h406 * scale64
# asm 1: fmuld <h406=float64#8,<scale64=float64#3,>x6=float64#21
# asm 2: fmuld <h406=%f14,<scale64=%f4,>x6=%f40
fmuld %f14,%f4,%f40

# qhasm: 						h363 -= x2
# asm 1: fsubd <h363=float64#13,<x2=float64#18,>h363=float64#13
# asm 2: fsubd <h363=%f24,<x2=%f34,>h363=%f24
fsubd %f24,%f34,%f24

# qhasm: 				x7 = h406 * scale160
# asm 1: fmuld <h406=float64#8,<scale160=float64#4,>x7=float64#18
# asm 2: fmuld <h406=%f14,<scale160=%f6,>x7=%f34
fmuld %f14,%f6,%f34

# qhasm: 						h256 -= x3
# asm 1: fsubd <h256=float64#16,<x3=float64#19,>h256=float64#16
# asm 2: fsubd <h256=%f30,<x3=%f36,>h256=%f30
fsubd %f30,%f36,%f30

# qhasm: 				x8 = h406 * scale256
# asm 1: fmuld <h406=float64#8,<scale256=float64#7,>x8=float64#8
# asm 2: fmuld <h406=%f14,<scale256=%f12,>x8=%f14
fmuld %f14,%f12,%f14

# qhasm: 						h171 += x4
# asm 1: faddd <h171=float64#9,<x4=float64#14,>h171=float64#9
# asm 2: faddd <h171=%f16,<x4=%f26,>h171=%f16
faddd %f16,%f26,%f16

# qhasm: h342 = *(float64 *) (h + 128)
# asm 1: ldd [<h=int64#2+128],>h342=float64#14
# asm 2: ldd [<h=%i1+128],>h342=%f26
ldd [%i1+128],%f26

# qhasm: 				closest406 = h384 + alpha406
# asm 1: faddd <h384=float64#12,<alpha406=float64#17,>closest406=float64#19
# asm 2: faddd <h384=%f22,<alpha406=%f32,>closest406=%f36
faddd %f22,%f32,%f36

# qhasm: h150 = *(float64 *) (h + 56)
# asm 1: ldd [<h=int64#2+56],>h150=float64#22
# asm 2: ldd [<h=%i1+56],>h150=%f42
ldd [%i1+56],%f42

# qhasm: 				closest406 -= alpha406
# asm 1: fsubd <closest406=float64#19,<alpha406=float64#17,>closest406=float64#17
# asm 2: fsubd <closest406=%f36,<alpha406=%f32,>closest406=%f32
fsubd %f36,%f32,%f32

# qhasm: 				h384 -= closest406
# asm 1: fsubd <h384=float64#12,<closest406=float64#17,>h384=float64#12
# asm 2: fsubd <h384=%f22,<closest406=%f32,>h384=%f22
fsubd %f22,%f32,%f22

# qhasm: 				x1 = closest406 * scale32
# asm 1: fmuld <closest406=float64#17,<scale32=float64#2,>x1=float64#19
# asm 2: fmuld <closest406=%f32,<scale32=%f2,>x1=%f36
fmuld %f32,%f2,%f36

# qhasm: 						h363 += x5
# asm 1: faddd <h363=float64#13,<x5=float64#20,>h363=float64#13
# asm 2: faddd <h363=%f24,<x5=%f38,>h363=%f24
faddd %f24,%f38,%f24

# qhasm: 				x2 = closest406 * scale64
# asm 1: fmuld <closest406=float64#17,<scale64=float64#3,>x2=float64#20
# asm 2: fmuld <closest406=%f32,<scale64=%f4,>x2=%f38
fmuld %f32,%f4,%f38

# qhasm: 						h342 -= x6
# asm 1: fsubd <h342=float64#14,<x6=float64#21,>h342=float64#14
# asm 2: fsubd <h342=%f26,<x6=%f40,>h342=%f26
fsubd %f26,%f40,%f26

# qhasm: 				x3 = closest406 * scale160
# asm 1: fmuld <closest406=float64#17,<scale160=float64#4,>x3=float64#21
# asm 2: fmuld <closest406=%f32,<scale160=%f6,>x3=%f40
fmuld %f32,%f6,%f40

# qhasm: 						h235 -= x7
# asm 1: fsubd <h235=float64#5,<x7=float64#18,>h235=float64#5
# asm 2: fsubd <h235=%f8,<x7=%f34,>h235=%f8
fsubd %f8,%f34,%f8

# qhasm: 				x4 = closest406 * scale256
# asm 1: fmuld <closest406=float64#17,<scale256=float64#7,>x4=float64#17
# asm 2: fmuld <closest406=%f32,<scale256=%f12,>x4=%f32
fmuld %f32,%f12,%f32

# qhasm: 						h150 += x8
# asm 1: faddd <h150=float64#22,<x8=float64#8,>h150=float64#8
# asm 2: faddd <h150=%f42,<x8=%f14,>h150=%f14
faddd %f42,%f14,%f14

# qhasm: alpha384 = *(float64 *)(constants + 216)
# asm 1: ldd [<constants=int64#3+216],>alpha384=float64#18
# asm 2: ldd [<constants=%i2+216],>alpha384=%f34
ldd [%i2+216],%f34

# qhasm: 				x5 = h384 * scale32
# asm 1: fmuld <h384=float64#12,<scale32=float64#2,>x5=float64#22
# asm 2: fmuld <h384=%f22,<scale32=%f2,>x5=%f42
fmuld %f22,%f2,%f42

# qhasm: 						h363 += x1
# asm 1: faddd <h363=float64#13,<x1=float64#19,>h363=float64#13
# asm 2: faddd <h363=%f24,<x1=%f36,>h363=%f24
faddd %f24,%f36,%f24

# qhasm: 				x6 = h384 * scale64
# asm 1: fmuld <h384=float64#12,<scale64=float64#3,>x6=float64#19
# asm 2: fmuld <h384=%f22,<scale64=%f4,>x6=%f36
fmuld %f22,%f4,%f36

# qhasm: 						h342 -= x2
# asm 1: fsubd <h342=float64#14,<x2=float64#20,>h342=float64#14
# asm 2: fsubd <h342=%f26,<x2=%f38,>h342=%f26
fsubd %f26,%f38,%f26

# qhasm: 				x7 = h384 * scale160
# asm 1: fmuld <h384=float64#12,<scale160=float64#4,>x7=float64#20
# asm 2: fmuld <h384=%f22,<scale160=%f6,>x7=%f38
fmuld %f22,%f6,%f38

# qhasm: 						h235 -= x3
# asm 1: fsubd <h235=float64#5,<x3=float64#21,>h235=float64#5
# asm 2: fsubd <h235=%f8,<x3=%f40,>h235=%f8
fsubd %f8,%f40,%f8

# qhasm: 				x8 = h384 * scale256
# asm 1: fmuld <h384=float64#12,<scale256=float64#7,>x8=float64#12
# asm 2: fmuld <h384=%f22,<scale256=%f12,>x8=%f22
fmuld %f22,%f12,%f22

# qhasm: 						h150 += x4
# asm 1: faddd <h150=float64#8,<x4=float64#17,>h150=float64#8
# asm 2: faddd <h150=%f14,<x4=%f32,>h150=%f14
faddd %f14,%f32,%f14

# qhasm: 				closest384 = h363 + alpha384
# asm 1: faddd <h363=float64#13,<alpha384=float64#18,>closest384=float64#17
# asm 2: faddd <h363=%f24,<alpha384=%f34,>closest384=%f32
faddd %f24,%f34,%f32

# qhasm: 				closest384 -= alpha384
# asm 1: fsubd <closest384=float64#17,<alpha384=float64#18,>closest384=float64#17
# asm 2: fsubd <closest384=%f32,<alpha384=%f34,>closest384=%f32
fsubd %f32,%f34,%f32

# qhasm: 				h363 -= closest384
# asm 1: fsubd <h363=float64#13,<closest384=float64#17,>h363=float64#13
# asm 2: fsubd <h363=%f24,<closest384=%f32,>h363=%f24
fsubd %f24,%f32,%f24

# qhasm: h128 = *(float64 *) (h + 48)
# asm 1: ldd [<h=int64#2+48],>h128=float64#18
# asm 2: ldd [<h=%i1+48],>h128=%f34
ldd [%i1+48],%f34

# qhasm: 				x1 = closest384 * scale32
# asm 1: fmuld <closest384=float64#17,<scale32=float64#2,>x1=float64#21
# asm 2: fmuld <closest384=%f32,<scale32=%f2,>x1=%f40
fmuld %f32,%f2,%f40

# qhasm: 						h342 += x5
# asm 1: faddd <h342=float64#14,<x5=float64#22,>h342=float64#14
# asm 2: faddd <h342=%f26,<x5=%f42,>h342=%f26
faddd %f26,%f42,%f26

# qhasm: 				x2= closest384 * scale64
# asm 1: fmuld <closest384=float64#17,<scale64=float64#3,>x2=float64#22
# asm 2: fmuld <closest384=%f32,<scale64=%f4,>x2=%f42
fmuld %f32,%f4,%f42

# qhasm: 						h320 -= x6
# asm 1: fsubd <h320=float64#11,<x6=float64#19,>h320=float64#11
# asm 2: fsubd <h320=%f20,<x6=%f36,>h320=%f20
fsubd %f20,%f36,%f20

# qhasm: 				x3 = closest384 * scale160
# asm 1: fmuld <closest384=float64#17,<scale160=float64#4,>x3=float64#19
# asm 2: fmuld <closest384=%f32,<scale160=%f6,>x3=%f36
fmuld %f32,%f6,%f36

# qhasm: 						h214 -= x7
# asm 1: fsubd <h214=float64#1,<x7=float64#20,>h214=float64#1
# asm 2: fsubd <h214=%f0,<x7=%f38,>h214=%f0
fsubd %f0,%f38,%f0

# qhasm: 				x4 = closest384 * scale256
# asm 1: fmuld <closest384=float64#17,<scale256=float64#7,>x4=float64#17
# asm 2: fmuld <closest384=%f32,<scale256=%f12,>x4=%f32
fmuld %f32,%f12,%f32

# qhasm: 						h128 += x8
# asm 1: faddd <h128=float64#18,<x8=float64#12,>h128=float64#12
# asm 2: faddd <h128=%f34,<x8=%f22,>h128=%f22
faddd %f34,%f22,%f22

# qhasm: alpha363 = *(float64 *)(constants + 208)
# asm 1: ldd [<constants=int64#3+208],>alpha363=float64#18
# asm 2: ldd [<constants=%i2+208],>alpha363=%f34
ldd [%i2+208],%f34

# qhasm: 				x5 = h363 * scale32
# asm 1: fmuld <h363=float64#13,<scale32=float64#2,>x5=float64#20
# asm 2: fmuld <h363=%f24,<scale32=%f2,>x5=%f38
fmuld %f24,%f2,%f38

# qhasm: 						h342 += x1
# asm 1: faddd <h342=float64#14,<x1=float64#21,>h342=float64#14
# asm 2: faddd <h342=%f26,<x1=%f40,>h342=%f26
faddd %f26,%f40,%f26

# qhasm: 				x6 = h363 * scale64
# asm 1: fmuld <h363=float64#13,<scale64=float64#3,>x6=float64#21
# asm 2: fmuld <h363=%f24,<scale64=%f4,>x6=%f40
fmuld %f24,%f4,%f40

# qhasm: 						h320 -= x2
# asm 1: fsubd <h320=float64#11,<x2=float64#22,>h320=float64#11
# asm 2: fsubd <h320=%f20,<x2=%f42,>h320=%f20
fsubd %f20,%f42,%f20

# qhasm: 				x7 = h363 * scale160
# asm 1: fmuld <h363=float64#13,<scale160=float64#4,>x7=float64#22
# asm 2: fmuld <h363=%f24,<scale160=%f6,>x7=%f42
fmuld %f24,%f6,%f42

# qhasm: 						h214 -= x3
# asm 1: fsubd <h214=float64#1,<x3=float64#19,>h214=float64#1
# asm 2: fsubd <h214=%f0,<x3=%f36,>h214=%f0
fsubd %f0,%f36,%f0

# qhasm: 				x8 = h363 * scale256
# asm 1: fmuld <h363=float64#13,<scale256=float64#7,>x8=float64#13
# asm 2: fmuld <h363=%f24,<scale256=%f12,>x8=%f24
fmuld %f24,%f12,%f24

# qhasm: 						h128 += x4
# asm 1: faddd <h128=float64#12,<x4=float64#17,>h128=float64#12
# asm 2: faddd <h128=%f22,<x4=%f32,>h128=%f22
faddd %f22,%f32,%f22

# qhasm: 				closest363 = h342 + alpha363
# asm 1: faddd <h342=float64#14,<alpha363=float64#18,>closest363=float64#17
# asm 2: faddd <h342=%f26,<alpha363=%f34,>closest363=%f32
faddd %f26,%f34,%f32

# qhasm: 				closest363 -= alpha363
# asm 1: fsubd <closest363=float64#17,<alpha363=float64#18,>closest363=float64#17
# asm 2: fsubd <closest363=%f32,<alpha363=%f34,>closest363=%f32
fsubd %f32,%f34,%f32

# qhasm: 				h342 -= closest363
# asm 1: fsubd <h342=float64#14,<closest363=float64#17,>h342=float64#14
# asm 2: fsubd <h342=%f26,<closest363=%f32,>h342=%f26
fsubd %f26,%f32,%f26

# qhasm: h107 = *(float64 *) (h + 40)
# asm 1: ldd [<h=int64#2+40],>h107=float64#18
# asm 2: ldd [<h=%i1+40],>h107=%f34
ldd [%i1+40],%f34

# qhasm: 				x1 = closest363 * scale32
# asm 1: fmuld <closest363=float64#17,<scale32=float64#2,>x1=float64#19
# asm 2: fmuld <closest363=%f32,<scale32=%f2,>x1=%f36
fmuld %f32,%f2,%f36

# qhasm: 						h320 += x5
# asm 1: faddd <h320=float64#11,<x5=float64#20,>h320=float64#11
# asm 2: faddd <h320=%f20,<x5=%f38,>h320=%f20
faddd %f20,%f38,%f20

# qhasm: 				x2 = closest363 * scale64
# asm 1: fmuld <closest363=float64#17,<scale64=float64#3,>x2=float64#20
# asm 2: fmuld <closest363=%f32,<scale64=%f4,>x2=%f38
fmuld %f32,%f4,%f38

# qhasm: 						h299 -= x6
# asm 1: fsubd <h299=float64#10,<x6=float64#21,>h299=float64#10
# asm 2: fsubd <h299=%f18,<x6=%f40,>h299=%f18
fsubd %f18,%f40,%f18

# qhasm: 				x3 = closest363 * scale160
# asm 1: fmuld <closest363=float64#17,<scale160=float64#4,>x3=float64#21
# asm 2: fmuld <closest363=%f32,<scale160=%f6,>x3=%f40
fmuld %f32,%f6,%f40

# qhasm: 						h192 -= x7
# asm 1: fsubd <h192=float64#6,<x7=float64#22,>h192=float64#6
# asm 2: fsubd <h192=%f10,<x7=%f42,>h192=%f10
fsubd %f10,%f42,%f10

# qhasm: 				x4 = closest363 * scale256
# asm 1: fmuld <closest363=float64#17,<scale256=float64#7,>x4=float64#17
# asm 2: fmuld <closest363=%f32,<scale256=%f12,>x4=%f32
fmuld %f32,%f12,%f32

# qhasm: 						h107 += x8
# asm 1: faddd <h107=float64#18,<x8=float64#13,>h107=float64#13
# asm 2: faddd <h107=%f34,<x8=%f24,>h107=%f24
faddd %f34,%f24,%f24

# qhasm: alpha342 = *(float64 *)(constants + 200)
# asm 1: ldd [<constants=int64#3+200],>alpha342=float64#18
# asm 2: ldd [<constants=%i2+200],>alpha342=%f34
ldd [%i2+200],%f34

# qhasm: 				x5 = h342 * scale32
# asm 1: fmuld <h342=float64#14,<scale32=float64#2,>x5=float64#22
# asm 2: fmuld <h342=%f26,<scale32=%f2,>x5=%f42
fmuld %f26,%f2,%f42

# qhasm: 						h320 += x1
# asm 1: faddd <h320=float64#11,<x1=float64#19,>h320=float64#11
# asm 2: faddd <h320=%f20,<x1=%f36,>h320=%f20
faddd %f20,%f36,%f20

# qhasm: 				x6 = h342 * scale64
# asm 1: fmuld <h342=float64#14,<scale64=float64#3,>x6=float64#19
# asm 2: fmuld <h342=%f26,<scale64=%f4,>x6=%f36
fmuld %f26,%f4,%f36

# qhasm: 						h299 -= x2
# asm 1: fsubd <h299=float64#10,<x2=float64#20,>h299=float64#10
# asm 2: fsubd <h299=%f18,<x2=%f38,>h299=%f18
fsubd %f18,%f38,%f18

# qhasm: 				x7 = h342 * scale160
# asm 1: fmuld <h342=float64#14,<scale160=float64#4,>x7=float64#20
# asm 2: fmuld <h342=%f26,<scale160=%f6,>x7=%f38
fmuld %f26,%f6,%f38

# qhasm: 						h192 -= x3
# asm 1: fsubd <h192=float64#6,<x3=float64#21,>h192=float64#6
# asm 2: fsubd <h192=%f10,<x3=%f40,>h192=%f10
fsubd %f10,%f40,%f10

# qhasm: 				x8 = h342 * scale256
# asm 1: fmuld <h342=float64#14,<scale256=float64#7,>x8=float64#14
# asm 2: fmuld <h342=%f26,<scale256=%f12,>x8=%f26
fmuld %f26,%f12,%f26

# qhasm: 						h107 += x4
# asm 1: faddd <h107=float64#13,<x4=float64#17,>h107=float64#13
# asm 2: faddd <h107=%f24,<x4=%f32,>h107=%f24
faddd %f24,%f32,%f24

# qhasm: 				closest342 = h320 + alpha342
# asm 1: faddd <h320=float64#11,<alpha342=float64#18,>closest342=float64#17
# asm 2: faddd <h320=%f20,<alpha342=%f34,>closest342=%f32
faddd %f20,%f34,%f32

# qhasm: 				closest342 -= alpha342
# asm 1: fsubd <closest342=float64#17,<alpha342=float64#18,>closest342=float64#17
# asm 2: fsubd <closest342=%f32,<alpha342=%f34,>closest342=%f32
fsubd %f32,%f34,%f32

# qhasm: 				h320 -= closest342
# asm 1: fsubd <h320=float64#11,<closest342=float64#17,>h320=float64#11
# asm 2: fsubd <h320=%f20,<closest342=%f32,>h320=%f20
fsubd %f20,%f32,%f20

# qhasm: h86 = *(float64 *) (h + 32)
# asm 1: ldd [<h=int64#2+32],>h86=float64#18
# asm 2: ldd [<h=%i1+32],>h86=%f34
ldd [%i1+32],%f34

# qhasm: 				x1 = closest342 * scale32
# asm 1: fmuld <closest342=float64#17,<scale32=float64#2,>x1=float64#21
# asm 2: fmuld <closest342=%f32,<scale32=%f2,>x1=%f40
fmuld %f32,%f2,%f40

# qhasm: 						h299 += x5
# asm 1: faddd <h299=float64#10,<x5=float64#22,>h299=float64#10
# asm 2: faddd <h299=%f18,<x5=%f42,>h299=%f18
faddd %f18,%f42,%f18

# qhasm: 				x2 = closest342 * scale64
# asm 1: fmuld <closest342=float64#17,<scale64=float64#3,>x2=float64#22
# asm 2: fmuld <closest342=%f32,<scale64=%f4,>x2=%f42
fmuld %f32,%f4,%f42

# qhasm: 						h278 -= x6
# asm 1: fsubd <h278=float64#15,<x6=float64#19,>h278=float64#15
# asm 2: fsubd <h278=%f28,<x6=%f36,>h278=%f28
fsubd %f28,%f36,%f28

# qhasm: 				x3 = closest342 * scale160
# asm 1: fmuld <closest342=float64#17,<scale160=float64#4,>x3=float64#19
# asm 2: fmuld <closest342=%f32,<scale160=%f6,>x3=%f36
fmuld %f32,%f6,%f36

# qhasm: 						h171 -= x7
# asm 1: fsubd <h171=float64#9,<x7=float64#20,>h171=float64#9
# asm 2: fsubd <h171=%f16,<x7=%f38,>h171=%f16
fsubd %f16,%f38,%f16

# qhasm: 				x4 = closest342 * scale256
# asm 1: fmuld <closest342=float64#17,<scale256=float64#7,>x4=float64#17
# asm 2: fmuld <closest342=%f32,<scale256=%f12,>x4=%f32
fmuld %f32,%f12,%f32

# qhasm: 						h86 += x8
# asm 1: faddd <h86=float64#18,<x8=float64#14,>h86=float64#14
# asm 2: faddd <h86=%f34,<x8=%f26,>h86=%f26
faddd %f34,%f26,%f26

# qhasm: alpha320 = *(float64 *)(constants + 192)
# asm 1: ldd [<constants=int64#3+192],>alpha320=float64#18
# asm 2: ldd [<constants=%i2+192],>alpha320=%f34
ldd [%i2+192],%f34

# qhasm: 				x5 = h320 * scale32
# asm 1: fmuld <h320=float64#11,<scale32=float64#2,>x5=float64#20
# asm 2: fmuld <h320=%f20,<scale32=%f2,>x5=%f38
fmuld %f20,%f2,%f38

# qhasm: 						h299 += x1
# asm 1: faddd <h299=float64#10,<x1=float64#21,>h299=float64#10
# asm 2: faddd <h299=%f18,<x1=%f40,>h299=%f18
faddd %f18,%f40,%f18

# qhasm: 				x6 = h320 * scale64
# asm 1: fmuld <h320=float64#11,<scale64=float64#3,>x6=float64#21
# asm 2: fmuld <h320=%f20,<scale64=%f4,>x6=%f40
fmuld %f20,%f4,%f40

# qhasm: 						h278 -= x2
# asm 1: fsubd <h278=float64#15,<x2=float64#22,>h278=float64#15
# asm 2: fsubd <h278=%f28,<x2=%f42,>h278=%f28
fsubd %f28,%f42,%f28

# qhasm: 				x7 = h320 * scale160
# asm 1: fmuld <h320=float64#11,<scale160=float64#4,>x7=float64#22
# asm 2: fmuld <h320=%f20,<scale160=%f6,>x7=%f42
fmuld %f20,%f6,%f42

# qhasm: 						h171 -= x3
# asm 1: fsubd <h171=float64#9,<x3=float64#19,>h171=float64#9
# asm 2: fsubd <h171=%f16,<x3=%f36,>h171=%f16
fsubd %f16,%f36,%f16

# qhasm: 				x8 = h320 * scale256
# asm 1: fmuld <h320=float64#11,<scale256=float64#7,>x8=float64#11
# asm 2: fmuld <h320=%f20,<scale256=%f12,>x8=%f20
fmuld %f20,%f12,%f20

# qhasm: 						h86 += x4
# asm 1: faddd <h86=float64#14,<x4=float64#17,>h86=float64#14
# asm 2: faddd <h86=%f26,<x4=%f32,>h86=%f26
faddd %f26,%f32,%f26

# qhasm: 				closest320 = h299 + alpha320
# asm 1: faddd <h299=float64#10,<alpha320=float64#18,>closest320=float64#17
# asm 2: faddd <h299=%f18,<alpha320=%f34,>closest320=%f32
faddd %f18,%f34,%f32

# qhasm: 				closest320 -= alpha320
# asm 1: fsubd <closest320=float64#17,<alpha320=float64#18,>closest320=float64#17
# asm 2: fsubd <closest320=%f32,<alpha320=%f34,>closest320=%f32
fsubd %f32,%f34,%f32

# qhasm: h64 = *(float64 *) (h + 24)
# asm 1: ldd [<h=int64#2+24],>h64=float64#18
# asm 2: ldd [<h=%i1+24],>h64=%f34
ldd [%i1+24],%f34

# qhasm: 				h299 -= closest320
# asm 1: fsubd <h299=float64#10,<closest320=float64#17,>h299=float64#10
# asm 2: fsubd <h299=%f18,<closest320=%f32,>h299=%f18
fsubd %f18,%f32,%f18

# qhasm: 				x1 = closest320 * scale32
# asm 1: fmuld <closest320=float64#17,<scale32=float64#2,>x1=float64#19
# asm 2: fmuld <closest320=%f32,<scale32=%f2,>x1=%f36
fmuld %f32,%f2,%f36

# qhasm: 						h278 += x5
# asm 1: faddd <h278=float64#15,<x5=float64#20,>h278=float64#15
# asm 2: faddd <h278=%f28,<x5=%f38,>h278=%f28
faddd %f28,%f38,%f28

# qhasm: 				x2 = closest320 * scale64
# asm 1: fmuld <closest320=float64#17,<scale64=float64#3,>x2=float64#20
# asm 2: fmuld <closest320=%f32,<scale64=%f4,>x2=%f38
fmuld %f32,%f4,%f38

# qhasm: 						h256 -= x6
# asm 1: fsubd <h256=float64#16,<x6=float64#21,>h256=float64#16
# asm 2: fsubd <h256=%f30,<x6=%f40,>h256=%f30
fsubd %f30,%f40,%f30

# qhasm: 				x3 = closest320 * scale160
# asm 1: fmuld <closest320=float64#17,<scale160=float64#4,>x3=float64#21
# asm 2: fmuld <closest320=%f32,<scale160=%f6,>x3=%f40
fmuld %f32,%f6,%f40

# qhasm: 						h150 -= x7
# asm 1: fsubd <h150=float64#8,<x7=float64#22,>h150=float64#8
# asm 2: fsubd <h150=%f14,<x7=%f42,>h150=%f14
fsubd %f14,%f42,%f14

# qhasm: 				x4 = closest320 * scale256
# asm 1: fmuld <closest320=float64#17,<scale256=float64#7,>x4=float64#17
# asm 2: fmuld <closest320=%f32,<scale256=%f12,>x4=%f32
fmuld %f32,%f12,%f32

# qhasm: 						h64 += x8
# asm 1: faddd <h64=float64#18,<x8=float64#11,>h64=float64#11
# asm 2: faddd <h64=%f34,<x8=%f20,>h64=%f20
faddd %f34,%f20,%f20

# qhasm: alpha299 = *(float64 *)(constants + 184)
# asm 1: ldd [<constants=int64#3+184],>alpha299=float64#18
# asm 2: ldd [<constants=%i2+184],>alpha299=%f34
ldd [%i2+184],%f34

# qhasm: 				x5 = h299 * scale32
# asm 1: fmuld <h299=float64#10,<scale32=float64#2,>x5=float64#22
# asm 2: fmuld <h299=%f18,<scale32=%f2,>x5=%f42
fmuld %f18,%f2,%f42

# qhasm: 						h278 += x1
# asm 1: faddd <h278=float64#15,<x1=float64#19,>h278=float64#15
# asm 2: faddd <h278=%f28,<x1=%f36,>h278=%f28
faddd %f28,%f36,%f28

# qhasm: 				x6 = h299 * scale64
# asm 1: fmuld <h299=float64#10,<scale64=float64#3,>x6=float64#19
# asm 2: fmuld <h299=%f18,<scale64=%f4,>x6=%f36
fmuld %f18,%f4,%f36

# qhasm: 						h256 -= x2
# asm 1: fsubd <h256=float64#16,<x2=float64#20,>h256=float64#16
# asm 2: fsubd <h256=%f30,<x2=%f38,>h256=%f30
fsubd %f30,%f38,%f30

# qhasm: 				x7 = h299 * scale160
# asm 1: fmuld <h299=float64#10,<scale160=float64#4,>x7=float64#20
# asm 2: fmuld <h299=%f18,<scale160=%f6,>x7=%f38
fmuld %f18,%f6,%f38

# qhasm: 						h150 -= x3
# asm 1: fsubd <h150=float64#8,<x3=float64#21,>h150=float64#8
# asm 2: fsubd <h150=%f14,<x3=%f40,>h150=%f14
fsubd %f14,%f40,%f14

# qhasm: 				x8 = h299 * scale256
# asm 1: fmuld <h299=float64#10,<scale256=float64#7,>x8=float64#10
# asm 2: fmuld <h299=%f18,<scale256=%f12,>x8=%f18
fmuld %f18,%f12,%f18

# qhasm: 						h64 += x4
# asm 1: faddd <h64=float64#11,<x4=float64#17,>h64=float64#11
# asm 2: faddd <h64=%f20,<x4=%f32,>h64=%f20
faddd %f20,%f32,%f20

# qhasm: 				closest299 = h278 + alpha299
# asm 1: faddd <h278=float64#15,<alpha299=float64#18,>closest299=float64#17
# asm 2: faddd <h278=%f28,<alpha299=%f34,>closest299=%f32
faddd %f28,%f34,%f32

# qhasm: 				closest299 -= alpha299
# asm 1: fsubd <closest299=float64#17,<alpha299=float64#18,>closest299=float64#17
# asm 2: fsubd <closest299=%f32,<alpha299=%f34,>closest299=%f32
fsubd %f32,%f34,%f32

# qhasm: h43 = *(float64 *) (h + 16)
# asm 1: ldd [<h=int64#2+16],>h43=float64#18
# asm 2: ldd [<h=%i1+16],>h43=%f34
ldd [%i1+16],%f34

# qhasm: 				h278 -= closest299
# asm 1: fsubd <h278=float64#15,<closest299=float64#17,>h278=float64#15
# asm 2: fsubd <h278=%f28,<closest299=%f32,>h278=%f28
fsubd %f28,%f32,%f28

# qhasm: 				x1 = closest299 * scale32
# asm 1: fmuld <closest299=float64#17,<scale32=float64#2,>x1=float64#21
# asm 2: fmuld <closest299=%f32,<scale32=%f2,>x1=%f40
fmuld %f32,%f2,%f40

# qhasm: 						h256 += x5
# asm 1: faddd <h256=float64#16,<x5=float64#22,>h256=float64#16
# asm 2: faddd <h256=%f30,<x5=%f42,>h256=%f30
faddd %f30,%f42,%f30

# qhasm: 				x2 = closest299 * scale64
# asm 1: fmuld <closest299=float64#17,<scale64=float64#3,>x2=float64#22
# asm 2: fmuld <closest299=%f32,<scale64=%f4,>x2=%f42
fmuld %f32,%f4,%f42

# qhasm: 						h235 -= x6
# asm 1: fsubd <h235=float64#5,<x6=float64#19,>h235=float64#5
# asm 2: fsubd <h235=%f8,<x6=%f36,>h235=%f8
fsubd %f8,%f36,%f8

# qhasm: 				x3 = closest299 * scale160
# asm 1: fmuld <closest299=float64#17,<scale160=float64#4,>x3=float64#19
# asm 2: fmuld <closest299=%f32,<scale160=%f6,>x3=%f36
fmuld %f32,%f6,%f36

# qhasm: 						h128 -= x7
# asm 1: fsubd <h128=float64#12,<x7=float64#20,>h128=float64#12
# asm 2: fsubd <h128=%f22,<x7=%f38,>h128=%f22
fsubd %f22,%f38,%f22

# qhasm: 				x4 = closest299 * scale256
# asm 1: fmuld <closest299=float64#17,<scale256=float64#7,>x4=float64#17
# asm 2: fmuld <closest299=%f32,<scale256=%f12,>x4=%f32
fmuld %f32,%f12,%f32

# qhasm: 						h43 += x8
# asm 1: faddd <h43=float64#18,<x8=float64#10,>h43=float64#10
# asm 2: faddd <h43=%f34,<x8=%f18,>h43=%f18
faddd %f34,%f18,%f18

# qhasm: alpha278 = *(float64 *)(constants + 176)
# asm 1: ldd [<constants=int64#3+176],>alpha278=float64#18
# asm 2: ldd [<constants=%i2+176],>alpha278=%f34
ldd [%i2+176],%f34

# qhasm: 				x5 = h278 * scale32
# asm 1: fmuld <h278=float64#15,<scale32=float64#2,>x5=float64#20
# asm 2: fmuld <h278=%f28,<scale32=%f2,>x5=%f38
fmuld %f28,%f2,%f38

# qhasm: 						h256 += x1
# asm 1: faddd <h256=float64#16,<x1=float64#21,>h256=float64#16
# asm 2: faddd <h256=%f30,<x1=%f40,>h256=%f30
faddd %f30,%f40,%f30

# qhasm: 				x6 = h278 * scale64
# asm 1: fmuld <h278=float64#15,<scale64=float64#3,>x6=float64#21
# asm 2: fmuld <h278=%f28,<scale64=%f4,>x6=%f40
fmuld %f28,%f4,%f40

# qhasm: 						h235 -= x2
# asm 1: fsubd <h235=float64#5,<x2=float64#22,>h235=float64#5
# asm 2: fsubd <h235=%f8,<x2=%f42,>h235=%f8
fsubd %f8,%f42,%f8

# qhasm: 				x7 = h278 * scale160
# asm 1: fmuld <h278=float64#15,<scale160=float64#4,>x7=float64#22
# asm 2: fmuld <h278=%f28,<scale160=%f6,>x7=%f42
fmuld %f28,%f6,%f42

# qhasm: 						h128 -= x3
# asm 1: fsubd <h128=float64#12,<x3=float64#19,>h128=float64#12
# asm 2: fsubd <h128=%f22,<x3=%f36,>h128=%f22
fsubd %f22,%f36,%f22

# qhasm: 				x8 = h278 * scale256
# asm 1: fmuld <h278=float64#15,<scale256=float64#7,>x8=float64#15
# asm 2: fmuld <h278=%f28,<scale256=%f12,>x8=%f28
fmuld %f28,%f12,%f28

# qhasm: 						h43 += x4
# asm 1: faddd <h43=float64#10,<x4=float64#17,>h43=float64#10
# asm 2: faddd <h43=%f18,<x4=%f32,>h43=%f18
faddd %f18,%f32,%f18

# qhasm: 				closest278 = h256 + alpha278
# asm 1: faddd <h256=float64#16,<alpha278=float64#18,>closest278=float64#17
# asm 2: faddd <h256=%f30,<alpha278=%f34,>closest278=%f32
faddd %f30,%f34,%f32

# qhasm: 				closest278 -= alpha278
# asm 1: fsubd <closest278=float64#17,<alpha278=float64#18,>closest278=float64#17
# asm 2: fsubd <closest278=%f32,<alpha278=%f34,>closest278=%f32
fsubd %f32,%f34,%f32

# qhasm: h22 = *(float64 *) (h + 8)
# asm 1: ldd [<h=int64#2+8],>h22=float64#18
# asm 2: ldd [<h=%i1+8],>h22=%f34
ldd [%i1+8],%f34

# qhasm: 				h256 -= closest278
# asm 1: fsubd <h256=float64#16,<closest278=float64#17,>h256=float64#16
# asm 2: fsubd <h256=%f30,<closest278=%f32,>h256=%f30
fsubd %f30,%f32,%f30

# qhasm: 				x1 = closest278 * scale32
# asm 1: fmuld <closest278=float64#17,<scale32=float64#2,>x1=float64#19
# asm 2: fmuld <closest278=%f32,<scale32=%f2,>x1=%f36
fmuld %f32,%f2,%f36

# qhasm: 						h235 += x5
# asm 1: faddd <h235=float64#5,<x5=float64#20,>h235=float64#5
# asm 2: faddd <h235=%f8,<x5=%f38,>h235=%f8
faddd %f8,%f38,%f8

# qhasm: 				x2 = closest278 * scale64
# asm 1: fmuld <closest278=float64#17,<scale64=float64#3,>x2=float64#20
# asm 2: fmuld <closest278=%f32,<scale64=%f4,>x2=%f38
fmuld %f32,%f4,%f38

# qhasm: 						h214 -= x6
# asm 1: fsubd <h214=float64#1,<x6=float64#21,>h214=float64#1
# asm 2: fsubd <h214=%f0,<x6=%f40,>h214=%f0
fsubd %f0,%f40,%f0

# qhasm: 				x3 = closest278 * scale160
# asm 1: fmuld <closest278=float64#17,<scale160=float64#4,>x3=float64#21
# asm 2: fmuld <closest278=%f32,<scale160=%f6,>x3=%f40
fmuld %f32,%f6,%f40

# qhasm: 						h107 -= x7
# asm 1: fsubd <h107=float64#13,<x7=float64#22,>h107=float64#13
# asm 2: fsubd <h107=%f24,<x7=%f42,>h107=%f24
fsubd %f24,%f42,%f24

# qhasm: 				x4 = closest278 * scale256
# asm 1: fmuld <closest278=float64#17,<scale256=float64#7,>x4=float64#17
# asm 2: fmuld <closest278=%f32,<scale256=%f12,>x4=%f32
fmuld %f32,%f12,%f32

# qhasm: 						h22 += x8
# asm 1: faddd <h22=float64#18,<x8=float64#15,>h22=float64#15
# asm 2: faddd <h22=%f34,<x8=%f28,>h22=%f28
faddd %f34,%f28,%f28

# qhasm: 				x5 = h256 * scale32
# asm 1: fmuld <h256=float64#16,<scale32=float64#2,>x5=float64#18
# asm 2: fmuld <h256=%f30,<scale32=%f2,>x5=%f34
fmuld %f30,%f2,%f34

# qhasm: 						h235 += x1
# asm 1: faddd <h235=float64#5,<x1=float64#19,>h235=float64#5
# asm 2: faddd <h235=%f8,<x1=%f36,>h235=%f8
faddd %f8,%f36,%f8

# qhasm: 				x6 = h256 * scale64
# asm 1: fmuld <h256=float64#16,<scale64=float64#3,>x6=float64#19
# asm 2: fmuld <h256=%f30,<scale64=%f4,>x6=%f36
fmuld %f30,%f4,%f36

# qhasm: 						h214 -= x2
# asm 1: fsubd <h214=float64#1,<x2=float64#20,>h214=float64#1
# asm 2: fsubd <h214=%f0,<x2=%f38,>h214=%f0
fsubd %f0,%f38,%f0

# qhasm: h0 = *(float64 *) (h + 0)
# asm 1: ldd [<h=int64#2+0],>h0=float64#20
# asm 2: ldd [<h=%i1+0],>h0=%f38
ldd [%i1+0],%f38

# qhasm: 				x7 = h256 * scale160
# asm 1: fmuld <h256=float64#16,<scale160=float64#4,>x7=float64#22
# asm 2: fmuld <h256=%f30,<scale160=%f6,>x7=%f42
fmuld %f30,%f6,%f42

# qhasm: 						h107 -= x3
# asm 1: fsubd <h107=float64#13,<x3=float64#21,>h107=float64#13
# asm 2: fsubd <h107=%f24,<x3=%f40,>h107=%f24
fsubd %f24,%f40,%f24

# qhasm: alpha22 = *(float64 *)(constants + 8)
# asm 1: ldd [<constants=int64#3+8],>alpha22=float64#21
# asm 2: ldd [<constants=%i2+8],>alpha22=%f40
ldd [%i2+8],%f40

# qhasm: 				x8 = h256 * scale256
# asm 1: fmuld <h256=float64#16,<scale256=float64#7,>x8=float64#16
# asm 2: fmuld <h256=%f30,<scale256=%f12,>x8=%f30
fmuld %f30,%f12,%f30

# qhasm: 						h22 += x4
# asm 1: faddd <h22=float64#15,<x4=float64#17,>h22=float64#15
# asm 2: faddd <h22=%f28,<x4=%f32,>h22=%f28
faddd %f28,%f32,%f28

# qhasm: alpha43 = *(float64 *)(constants + 16)
# asm 1: ldd [<constants=int64#3+16],>alpha43=float64#17
# asm 2: ldd [<constants=%i2+16],>alpha43=%f32
ldd [%i2+16],%f32

# qhasm: 						h192 -= x6
# asm 1: fsubd <h192=float64#6,<x6=float64#19,>h192=float64#6
# asm 2: fsubd <h192=%f10,<x6=%f36,>h192=%f10
fsubd %f10,%f36,%f10

# qhasm: alpha64 = *(float64 *)(constants + 24)
# asm 1: ldd [<constants=int64#3+24],>alpha64=float64#19
# asm 2: ldd [<constants=%i2+24],>alpha64=%f36
ldd [%i2+24],%f36

# qhasm: 						h86 -= x7
# asm 1: fsubd <h86=float64#14,<x7=float64#22,>h86=float64#14
# asm 2: fsubd <h86=%f26,<x7=%f42,>h86=%f26
fsubd %f26,%f42,%f26

# qhasm: alpha86 = *(float64 *)(constants + 32)
# asm 1: ldd [<constants=int64#3+32],>alpha86=float64#22
# asm 2: ldd [<constants=%i2+32],>alpha86=%f42
ldd [%i2+32],%f42

# qhasm: 						h214 += x5
# asm 1: faddd <h214=float64#1,<x5=float64#18,>h214=float64#1
# asm 2: faddd <h214=%f0,<x5=%f34,>h214=%f0
faddd %f0,%f34,%f0

# qhasm: 						h0 += x8
# asm 1: faddd <h0=float64#20,<x8=float64#16,>h0=float64#16
# asm 2: faddd <h0=%f38,<x8=%f30,>h0=%f30
faddd %f38,%f30,%f30

# qhasm: closest22 = h0 + alpha22
# asm 1: faddd <h0=float64#16,<alpha22=float64#21,>closest22=float64#18
# asm 2: faddd <h0=%f30,<alpha22=%f40,>closest22=%f34
faddd %f30,%f40,%f34

# qhasm: closest22 -= alpha22
# asm 1: fsubd <closest22=float64#18,<alpha22=float64#21,>closest22=float64#18
# asm 2: fsubd <closest22=%f34,<alpha22=%f40,>closest22=%f34
fsubd %f34,%f40,%f34

# qhasm: h0 -= closest22
# asm 1: fsubd <h0=float64#16,<closest22=float64#18,>h0=float64#16
# asm 2: fsubd <h0=%f30,<closest22=%f34,>h0=%f30
fsubd %f30,%f34,%f30

# qhasm: h22 += closest22
# asm 1: faddd <h22=float64#15,<closest22=float64#18,>h22=float64#15
# asm 2: faddd <h22=%f28,<closest22=%f34,>h22=%f28
faddd %f28,%f34,%f28

# qhasm: closest43 = h22 + alpha43
# asm 1: faddd <h22=float64#15,<alpha43=float64#17,>closest43=float64#18
# asm 2: faddd <h22=%f28,<alpha43=%f32,>closest43=%f34
faddd %f28,%f32,%f34

# qhasm: closest43 -= alpha43
# asm 1: fsubd <closest43=float64#18,<alpha43=float64#17,>closest43=float64#17
# asm 2: fsubd <closest43=%f34,<alpha43=%f32,>closest43=%f32
fsubd %f34,%f32,%f32

# qhasm: h22 -= closest43
# asm 1: fsubd <h22=float64#15,<closest43=float64#17,>h22=float64#15
# asm 2: fsubd <h22=%f28,<closest43=%f32,>h22=%f28
fsubd %f28,%f32,%f28

# qhasm: h43 += closest43
# asm 1: faddd <h43=float64#10,<closest43=float64#17,>h43=float64#10
# asm 2: faddd <h43=%f18,<closest43=%f32,>h43=%f18
faddd %f18,%f32,%f18

# qhasm: closest64 = h43 + alpha64
# asm 1: faddd <h43=float64#10,<alpha64=float64#19,>closest64=float64#17
# asm 2: faddd <h43=%f18,<alpha64=%f36,>closest64=%f32
faddd %f18,%f36,%f32

# qhasm: closest64 -= alpha64
# asm 1: fsubd <closest64=float64#17,<alpha64=float64#19,>closest64=float64#17
# asm 2: fsubd <closest64=%f32,<alpha64=%f36,>closest64=%f32
fsubd %f32,%f36,%f32

# qhasm: h43 -= closest64
# asm 1: fsubd <h43=float64#10,<closest64=float64#17,>h43=float64#10
# asm 2: fsubd <h43=%f18,<closest64=%f32,>h43=%f18
fsubd %f18,%f32,%f18

# qhasm: h64 += closest64
# asm 1: faddd <h64=float64#11,<closest64=float64#17,>h64=float64#11
# asm 2: faddd <h64=%f20,<closest64=%f32,>h64=%f20
faddd %f20,%f32,%f20

# qhasm: alpha107 = *(float64 *)(constants + 40)
# asm 1: ldd [<constants=int64#3+40],>alpha107=float64#17
# asm 2: ldd [<constants=%i2+40],>alpha107=%f32
ldd [%i2+40],%f32

# qhasm: closest86 = h64 + alpha86
# asm 1: faddd <h64=float64#11,<alpha86=float64#22,>closest86=float64#18
# asm 2: faddd <h64=%f20,<alpha86=%f42,>closest86=%f34
faddd %f20,%f42,%f34

# qhasm: closest86 -= alpha86
# asm 1: fsubd <closest86=float64#18,<alpha86=float64#22,>closest86=float64#18
# asm 2: fsubd <closest86=%f34,<alpha86=%f42,>closest86=%f34
fsubd %f34,%f42,%f34

# qhasm: h64 -= closest86
# asm 1: fsubd <h64=float64#11,<closest86=float64#18,>h64=float64#11
# asm 2: fsubd <h64=%f20,<closest86=%f34,>h64=%f20
fsubd %f20,%f34,%f20

# qhasm: h86 += closest86
# asm 1: faddd <h86=float64#14,<closest86=float64#18,>h86=float64#14
# asm 2: faddd <h86=%f26,<closest86=%f34,>h86=%f26
faddd %f26,%f34,%f26

# qhasm: alpha128 = *(float64 *)(constants + 48)
# asm 1: ldd [<constants=int64#3+48],>alpha128=float64#18
# asm 2: ldd [<constants=%i2+48],>alpha128=%f34
ldd [%i2+48],%f34

# qhasm: closest107 = h86 + alpha107
# asm 1: faddd <h86=float64#14,<alpha107=float64#17,>closest107=float64#19
# asm 2: faddd <h86=%f26,<alpha107=%f32,>closest107=%f36
faddd %f26,%f32,%f36

# qhasm: closest107 -= alpha107
# asm 1: fsubd <closest107=float64#19,<alpha107=float64#17,>closest107=float64#17
# asm 2: fsubd <closest107=%f36,<alpha107=%f32,>closest107=%f32
fsubd %f36,%f32,%f32

# qhasm: h86 -= closest107
# asm 1: fsubd <h86=float64#14,<closest107=float64#17,>h86=float64#14
# asm 2: fsubd <h86=%f26,<closest107=%f32,>h86=%f26
fsubd %f26,%f32,%f26

# qhasm: h107 += closest107
# asm 1: faddd <h107=float64#13,<closest107=float64#17,>h107=float64#13
# asm 2: faddd <h107=%f24,<closest107=%f32,>h107=%f24
faddd %f24,%f32,%f24

# qhasm: alpha150 = *(float64 *)(constants + 56)
# asm 1: ldd [<constants=int64#3+56],>alpha150=float64#17
# asm 2: ldd [<constants=%i2+56],>alpha150=%f32
ldd [%i2+56],%f32

# qhasm: closest128 = h107 + alpha128
# asm 1: faddd <h107=float64#13,<alpha128=float64#18,>closest128=float64#19
# asm 2: faddd <h107=%f24,<alpha128=%f34,>closest128=%f36
faddd %f24,%f34,%f36

# qhasm: closest128 -= alpha128
# asm 1: fsubd <closest128=float64#19,<alpha128=float64#18,>closest128=float64#18
# asm 2: fsubd <closest128=%f36,<alpha128=%f34,>closest128=%f34
fsubd %f36,%f34,%f34

# qhasm: h107 -= closest128
# asm 1: fsubd <h107=float64#13,<closest128=float64#18,>h107=float64#13
# asm 2: fsubd <h107=%f24,<closest128=%f34,>h107=%f24
fsubd %f24,%f34,%f24

# qhasm: h128 += closest128
# asm 1: faddd <h128=float64#12,<closest128=float64#18,>h128=float64#12
# asm 2: faddd <h128=%f22,<closest128=%f34,>h128=%f22
faddd %f22,%f34,%f22

# qhasm: alpha171 = *(float64 *)(constants + 64)
# asm 1: ldd [<constants=int64#3+64],>alpha171=float64#18
# asm 2: ldd [<constants=%i2+64],>alpha171=%f34
ldd [%i2+64],%f34

# qhasm: closest150 = h128 + alpha150
# asm 1: faddd <h128=float64#12,<alpha150=float64#17,>closest150=float64#19
# asm 2: faddd <h128=%f22,<alpha150=%f32,>closest150=%f36
faddd %f22,%f32,%f36

# qhasm: closest150 -= alpha150
# asm 1: fsubd <closest150=float64#19,<alpha150=float64#17,>closest150=float64#17
# asm 2: fsubd <closest150=%f36,<alpha150=%f32,>closest150=%f32
fsubd %f36,%f32,%f32

# qhasm: h128 -= closest150
# asm 1: fsubd <h128=float64#12,<closest150=float64#17,>h128=float64#12
# asm 2: fsubd <h128=%f22,<closest150=%f32,>h128=%f22
fsubd %f22,%f32,%f22

# qhasm: h150 += closest150
# asm 1: faddd <h150=float64#8,<closest150=float64#17,>h150=float64#8
# asm 2: faddd <h150=%f14,<closest150=%f32,>h150=%f14
faddd %f14,%f32,%f14

# qhasm: alpha192 = *(float64 *)(constants + 72)
# asm 1: ldd [<constants=int64#3+72],>alpha192=float64#17
# asm 2: ldd [<constants=%i2+72],>alpha192=%f32
ldd [%i2+72],%f32

# qhasm: closest171 = h150 + alpha171
# asm 1: faddd <h150=float64#8,<alpha171=float64#18,>closest171=float64#19
# asm 2: faddd <h150=%f14,<alpha171=%f34,>closest171=%f36
faddd %f14,%f34,%f36

# qhasm: closest171 -= alpha171
# asm 1: fsubd <closest171=float64#19,<alpha171=float64#18,>closest171=float64#18
# asm 2: fsubd <closest171=%f36,<alpha171=%f34,>closest171=%f34
fsubd %f36,%f34,%f34

# qhasm: h150 -= closest171
# asm 1: fsubd <h150=float64#8,<closest171=float64#18,>h150=float64#8
# asm 2: fsubd <h150=%f14,<closest171=%f34,>h150=%f14
fsubd %f14,%f34,%f14

# qhasm: h171 += closest171
# asm 1: faddd <h171=float64#9,<closest171=float64#18,>h171=float64#9
# asm 2: faddd <h171=%f16,<closest171=%f34,>h171=%f16
faddd %f16,%f34,%f16

# qhasm: alpha214 = *(float64 *)(constants + 80)
# asm 1: ldd [<constants=int64#3+80],>alpha214=float64#18
# asm 2: ldd [<constants=%i2+80],>alpha214=%f34
ldd [%i2+80],%f34

# qhasm: closest192 = h171 + alpha192
# asm 1: faddd <h171=float64#9,<alpha192=float64#17,>closest192=float64#19
# asm 2: faddd <h171=%f16,<alpha192=%f32,>closest192=%f36
faddd %f16,%f32,%f36

# qhasm: closest192 -= alpha192
# asm 1: fsubd <closest192=float64#19,<alpha192=float64#17,>closest192=float64#17
# asm 2: fsubd <closest192=%f36,<alpha192=%f32,>closest192=%f32
fsubd %f36,%f32,%f32

# qhasm: h171 -= closest192
# asm 1: fsubd <h171=float64#9,<closest192=float64#17,>h171=float64#9
# asm 2: fsubd <h171=%f16,<closest192=%f32,>h171=%f16
fsubd %f16,%f32,%f16

# qhasm: h192 += closest192
# asm 1: faddd <h192=float64#6,<closest192=float64#17,>h192=float64#6
# asm 2: faddd <h192=%f10,<closest192=%f32,>h192=%f10
faddd %f10,%f32,%f10

# qhasm: alpha235 = *(float64 *)(constants + 88)
# asm 1: ldd [<constants=int64#3+88],>alpha235=float64#17
# asm 2: ldd [<constants=%i2+88],>alpha235=%f32
ldd [%i2+88],%f32

# qhasm: closest214 = h192 + alpha214
# asm 1: faddd <h192=float64#6,<alpha214=float64#18,>closest214=float64#19
# asm 2: faddd <h192=%f10,<alpha214=%f34,>closest214=%f36
faddd %f10,%f34,%f36

# qhasm: closest214 -= alpha214
# asm 1: fsubd <closest214=float64#19,<alpha214=float64#18,>closest214=float64#18
# asm 2: fsubd <closest214=%f36,<alpha214=%f34,>closest214=%f34
fsubd %f36,%f34,%f34

# qhasm: h192 -= closest214
# asm 1: fsubd <h192=float64#6,<closest214=float64#18,>h192=float64#6
# asm 2: fsubd <h192=%f10,<closest214=%f34,>h192=%f10
fsubd %f10,%f34,%f10

# qhasm: h214 += closest214
# asm 1: faddd <h214=float64#1,<closest214=float64#18,>h214=float64#1
# asm 2: faddd <h214=%f0,<closest214=%f34,>h214=%f0
faddd %f0,%f34,%f0

# qhasm: alpha256 = *(float64 *)(constants + 96)
# asm 1: ldd [<constants=int64#3+96],>alpha256=float64#18
# asm 2: ldd [<constants=%i2+96],>alpha256=%f34
ldd [%i2+96],%f34

# qhasm: closest235 = h214 + alpha235
# asm 1: faddd <h214=float64#1,<alpha235=float64#17,>closest235=float64#19
# asm 2: faddd <h214=%f0,<alpha235=%f32,>closest235=%f36
faddd %f0,%f32,%f36

# qhasm: closest235 -= alpha235
# asm 1: fsubd <closest235=float64#19,<alpha235=float64#17,>closest235=float64#17
# asm 2: fsubd <closest235=%f36,<alpha235=%f32,>closest235=%f32
fsubd %f36,%f32,%f32

# qhasm: h214 -= closest235
# asm 1: fsubd <h214=float64#1,<closest235=float64#17,>h214=float64#1
# asm 2: fsubd <h214=%f0,<closest235=%f32,>h214=%f0
fsubd %f0,%f32,%f0

# qhasm: h235 += closest235
# asm 1: faddd <h235=float64#5,<closest235=float64#17,>h235=float64#5
# asm 2: faddd <h235=%f8,<closest235=%f32,>h235=%f8
faddd %f8,%f32,%f8

# qhasm: closest256 = h235 + alpha256
# asm 1: faddd <h235=float64#5,<alpha256=float64#18,>closest256=float64#17
# asm 2: faddd <h235=%f8,<alpha256=%f34,>closest256=%f32
faddd %f8,%f34,%f32

# qhasm: closest256 -= alpha256
# asm 1: fsubd <closest256=float64#17,<alpha256=float64#18,>closest256=float64#17
# asm 2: fsubd <closest256=%f32,<alpha256=%f34,>closest256=%f32
fsubd %f32,%f34,%f32

# qhasm: h235 -= closest256
# asm 1: fsubd <h235=float64#5,<closest256=float64#17,>h235=float64#5
# asm 2: fsubd <h235=%f8,<closest256=%f32,>h235=%f8
fsubd %f8,%f32,%f8

# qhasm: alpha22 = *(float64 *)(constants + 8)
# asm 1: ldd [<constants=int64#3+8],>alpha22=float64#18
# asm 2: ldd [<constants=%i2+8],>alpha22=%f34
ldd [%i2+8],%f34

# qhasm: 				x4 = closest256 * scale256
# asm 1: fmuld <closest256=float64#17,<scale256=float64#7,>x4=float64#7
# asm 2: fmuld <closest256=%f32,<scale256=%f12,>x4=%f12
fmuld %f32,%f12,%f12

# qhasm: alpha107 = *(float64 *)(constants + 40)
# asm 1: ldd [<constants=int64#3+40],>alpha107=float64#19
# asm 2: ldd [<constants=%i2+40],>alpha107=%f36
ldd [%i2+40],%f36

# qhasm: 				x3 = closest256 * scale160
# asm 1: fmuld <closest256=float64#17,<scale160=float64#4,>x3=float64#4
# asm 2: fmuld <closest256=%f32,<scale160=%f6,>x3=%f6
fmuld %f32,%f6,%f6

# qhasm: alpha214 = *(float64 *)(constants + 80)
# asm 1: ldd [<constants=int64#3+80],>alpha214=float64#20
# asm 2: ldd [<constants=%i2+80],>alpha214=%f38
ldd [%i2+80],%f38

# qhasm: 				x2 = closest256 * scale64
# asm 1: fmuld <closest256=float64#17,<scale64=float64#3,>x2=float64#3
# asm 2: fmuld <closest256=%f32,<scale64=%f4,>x2=%f4
fmuld %f32,%f4,%f4

# qhasm: alpha235 = *(float64 *)(constants + 88)
# asm 1: ldd [<constants=int64#3+88],>alpha235=float64#21
# asm 2: ldd [<constants=%i2+88],>alpha235=%f40
ldd [%i2+88],%f40

# qhasm: 				x1 = closest256 * scale32
# asm 1: fmuld <closest256=float64#17,<scale32=float64#2,>x1=float64#2
# asm 2: fmuld <closest256=%f32,<scale32=%f2,>x1=%f2
fmuld %f32,%f2,%f2

# qhasm:                                                  h0 += x4
# asm 1: faddd <h0=float64#16,<x4=float64#7,>h0=float64#7
# asm 2: faddd <h0=%f30,<x4=%f12,>h0=%f12
faddd %f30,%f12,%f12

# qhasm: 							*(float64 *) (r + 16) = h43
# asm 1: std <h43=float64#10,[<r=int64#1+16]
# asm 2: std <h43=%f18,[<r=%i0+16]
std %f18,[%i0+16]

# qhasm:                                                  h86 -= x3
# asm 1: fsubd <h86=float64#14,<x3=float64#4,>h86=float64#4
# asm 2: fsubd <h86=%f26,<x3=%f6,>h86=%f6
fsubd %f26,%f6,%f6

# qhasm: 							*(float64 *) (r + 24) = h64
# asm 1: std <h64=float64#11,[<r=int64#1+24]
# asm 2: std <h64=%f20,[<r=%i0+24]
std %f20,[%i0+24]

# qhasm:                                                  h192 -= x2
# asm 1: fsubd <h192=float64#6,<x2=float64#3,>h192=float64#3
# asm 2: fsubd <h192=%f10,<x2=%f4,>h192=%f4
fsubd %f10,%f4,%f4

# qhasm: 							*(float64 *) (r + 48) = h128
# asm 1: std <h128=float64#12,[<r=int64#1+48]
# asm 2: std <h128=%f22,[<r=%i0+48]
std %f22,[%i0+48]

# qhasm:                                                  h214 += x1
# asm 1: faddd <h214=float64#1,<x1=float64#2,>h214=float64#1
# asm 2: faddd <h214=%f0,<x1=%f2,>h214=%f0
faddd %f0,%f2,%f0

# qhasm: 							*(float64 *) (r + 56) = h150
# asm 1: std <h150=float64#8,[<r=int64#1+56]
# asm 2: std <h150=%f14,[<r=%i0+56]
std %f14,[%i0+56]

# qhasm: closest22 = h0 + alpha22
# asm 1: faddd <h0=float64#7,<alpha22=float64#18,>closest22=float64#2
# asm 2: faddd <h0=%f12,<alpha22=%f34,>closest22=%f2
faddd %f12,%f34,%f2

# qhasm: 							*(float64 *) (r + 64) = h171
# asm 1: std <h171=float64#9,[<r=int64#1+64]
# asm 2: std <h171=%f16,[<r=%i0+64]
std %f16,[%i0+64]

# qhasm: closest107 = h86 + alpha107
# asm 1: faddd <h86=float64#4,<alpha107=float64#19,>closest107=float64#6
# asm 2: faddd <h86=%f6,<alpha107=%f36,>closest107=%f10
faddd %f6,%f36,%f10

# qhasm: closest214 = h192 + alpha214
# asm 1: faddd <h192=float64#3,<alpha214=float64#20,>closest214=float64#8
# asm 2: faddd <h192=%f4,<alpha214=%f38,>closest214=%f14
faddd %f4,%f38,%f14

# qhasm: closest22 -= alpha22
# asm 1: fsubd <closest22=float64#2,<alpha22=float64#18,>closest22=float64#2
# asm 2: fsubd <closest22=%f2,<alpha22=%f34,>closest22=%f2
fsubd %f2,%f34,%f2

# qhasm: closest107 -= alpha107
# asm 1: fsubd <closest107=float64#6,<alpha107=float64#19,>closest107=float64#6
# asm 2: fsubd <closest107=%f10,<alpha107=%f36,>closest107=%f10
fsubd %f10,%f36,%f10

# qhasm: closest214 -= alpha214
# asm 1: fsubd <closest214=float64#8,<alpha214=float64#20,>closest214=float64#8
# asm 2: fsubd <closest214=%f14,<alpha214=%f38,>closest214=%f14
fsubd %f14,%f38,%f14

# qhasm: h0 -= closest22
# asm 1: fsubd <h0=float64#7,<closest22=float64#2,>h0=float64#7
# asm 2: fsubd <h0=%f12,<closest22=%f2,>h0=%f12
fsubd %f12,%f2,%f12

# qhasm: h86 -= closest107
# asm 1: fsubd <h86=float64#4,<closest107=float64#6,>h86=float64#4
# asm 2: fsubd <h86=%f6,<closest107=%f10,>h86=%f6
fsubd %f6,%f10,%f6

# qhasm: h192 -= closest214
# asm 1: fsubd <h192=float64#3,<closest214=float64#8,>h192=float64#3
# asm 2: fsubd <h192=%f4,<closest214=%f14,>h192=%f4
fsubd %f4,%f14,%f4

# qhasm: h22 += closest22
# asm 1: faddd <h22=float64#15,<closest22=float64#2,>h22=float64#2
# asm 2: faddd <h22=%f28,<closest22=%f2,>h22=%f2
faddd %f28,%f2,%f2

# qhasm: h107 += closest107
# asm 1: faddd <h107=float64#13,<closest107=float64#6,>h107=float64#6
# asm 2: faddd <h107=%f24,<closest107=%f10,>h107=%f10
faddd %f24,%f10,%f10

# qhasm: 							*(float64 *) (r + 0) = h0
# asm 1: std <h0=float64#7,[<r=int64#1+0]
# asm 2: std <h0=%f12,[<r=%i0+0]
std %f12,[%i0+0]

# qhasm: h214 += closest214
# asm 1: faddd <h214=float64#1,<closest214=float64#8,>h214=float64#1
# asm 2: faddd <h214=%f0,<closest214=%f14,>h214=%f0
faddd %f0,%f14,%f0

# qhasm: 							*(float64 *) (r + 32) = h86
# asm 1: std <h86=float64#4,[<r=int64#1+32]
# asm 2: std <h86=%f6,[<r=%i0+32]
std %f6,[%i0+32]

# qhasm: closest235 = h214 + alpha235
# asm 1: faddd <h214=float64#1,<alpha235=float64#21,>closest235=float64#4
# asm 2: faddd <h214=%f0,<alpha235=%f40,>closest235=%f6
faddd %f0,%f40,%f6

# qhasm: 							*(float64 *) (r + 72) = h192
# asm 1: std <h192=float64#3,[<r=int64#1+72]
# asm 2: std <h192=%f4,[<r=%i0+72]
std %f4,[%i0+72]

# qhasm: closest235 -= alpha235
# asm 1: fsubd <closest235=float64#4,<alpha235=float64#21,>closest235=float64#3
# asm 2: fsubd <closest235=%f6,<alpha235=%f40,>closest235=%f4
fsubd %f6,%f40,%f4

# qhasm: 							*(float64 *) (r + 8) = h22
# asm 1: std <h22=float64#2,[<r=int64#1+8]
# asm 2: std <h22=%f2,[<r=%i0+8]
std %f2,[%i0+8]

# qhasm: h214 -= closest235
# asm 1: fsubd <h214=float64#1,<closest235=float64#3,>h214=float64#1
# asm 2: fsubd <h214=%f0,<closest235=%f4,>h214=%f0
fsubd %f0,%f4,%f0

# qhasm: 							*(float64 *) (r + 40) = h107
# asm 1: std <h107=float64#6,[<r=int64#1+40]
# asm 2: std <h107=%f10,[<r=%i0+40]
std %f10,[%i0+40]

# qhasm: h235 += closest235
# asm 1: faddd <h235=float64#5,<closest235=float64#3,>h235=float64#2
# asm 2: faddd <h235=%f8,<closest235=%f4,>h235=%f2
faddd %f8,%f4,%f2

# qhasm: 						*(float64 *) (r + 80) = h214
# asm 1: std <h214=float64#1,[<r=int64#1+80]
# asm 2: std <h214=%f0,[<r=%i0+80]
std %f0,[%i0+80]

# qhasm: 						*(float64 *) (r + 88) = h235
# asm 1: std <h235=float64#2,[<r=int64#1+88]
# asm 2: std <h235=%f2,[<r=%i0+88]
std %f2,[%i0+88]

# qhasm: leave
ret
restore
