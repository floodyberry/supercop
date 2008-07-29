
# qhasm: enter nistp256_todouble
.section ".text"
.align 32
.global nistp256_todouble
nistp256_todouble:
save %sp,-224,%sp

# qhasm: int64 z

# qhasm: int64 x

# qhasm: input z

# qhasm: input x

# qhasm: int64 constants

# qhasm: int64 constants_low

# qhasm: float64 alpha0

# qhasm: float64 alpha48

# qhasm: float64 alpha88

# qhasm: float64 alpha176

# qhasm: float64 alpha216

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

# qhasm: int64 f0

# qhasm: int64 f1

# qhasm: int64 f2

# qhasm: int64 f3

# qhasm: int64 f4

# qhasm: int64 f5

# qhasm: int64 f6

# qhasm: int64 f7

# qhasm: int64 f8

# qhasm: int64 f9

# qhasm: int64 f10

# qhasm: int64 f11

# qhasm: int64 f12

# qhasm: int64 f13

# qhasm: int64 f14

# qhasm: int64 f15

# qhasm: int64 f16

# qhasm: int64 f17

# qhasm: int64 f18

# qhasm: int64 f19

# qhasm: int64 f20

# qhasm: int64 f21

# qhasm: int64 f22

# qhasm: int64 f23

# qhasm: int64 f24

# qhasm: int64 f25

# qhasm: int64 f26

# qhasm: int64 f27

# qhasm: int64 f28

# qhasm: int64 f29

# qhasm: int64 f30

# qhasm: int64 f31

# qhasm: int64 x0

# qhasm: int64 x48

# qhasm: int64 x88

# qhasm: int64 x128

# qhasm: int64 x176

# qhasm: int64 x216

# qhasm: stack64 y0

# qhasm: stack64 y48

# qhasm: stack64 y88

# qhasm: stack64 y128

# qhasm: stack64 y176

# qhasm: stack64 y216

# qhasm: float64 z0

# qhasm: float64 z22

# qhasm: float64 z43

# qhasm: float64 z64

# qhasm: float64 z86

# qhasm: float64 z107

# qhasm: float64 z128

# qhasm: float64 z150

# qhasm: float64 z171

# qhasm: float64 z192

# qhasm: float64 z214

# qhasm: float64 z235

# qhasm: float64 closest43

# qhasm: float64 closest86

# qhasm: float64 closest128

# qhasm: float64 closest171

# qhasm: float64 closest214

# qhasm: f0 = *(uint8 *) (x + 0)
# asm 1: ldub [<x=int64#2+0],>f0=int64#3
# asm 2: ldub [<x=%i1+0],>f0=%i2
ldub [%i1+0],%i2

# qhasm: f1 = *(uint8 *) (x + 1)
# asm 1: ldub [<x=int64#2+1],>f1=int64#4
# asm 2: ldub [<x=%i1+1],>f1=%i3
ldub [%i1+1],%i3

# qhasm: f2 = *(uint8 *) (x + 2)
# asm 1: ldub [<x=int64#2+2],>f2=int64#5
# asm 2: ldub [<x=%i1+2],>f2=%i4
ldub [%i1+2],%i4

# qhasm: f3 = *(uint8 *) (x + 3)
# asm 1: ldub [<x=int64#2+3],>f3=int64#6
# asm 2: ldub [<x=%i1+3],>f3=%i5
ldub [%i1+3],%i5

# qhasm: f4 = *(uint8 *) (x + 4)
# asm 1: ldub [<x=int64#2+4],>f4=int64#7
# asm 2: ldub [<x=%i1+4],>f4=%g1
ldub [%i1+4],%g1

# qhasm: f5 = *(uint8 *) (x + 5)
# asm 1: ldub [<x=int64#2+5],>f5=int64#8
# asm 2: ldub [<x=%i1+5],>f5=%g4
ldub [%i1+5],%g4

# qhasm: f1 <<= 8
# asm 1: sllx <f1=int64#4,8,>f1=int64#4
# asm 2: sllx <f1=%i3,8,>f1=%i3
sllx %i3,8,%i3

# qhasm: f2 <<= 16
# asm 1: sllx <f2=int64#5,16,>f2=int64#5
# asm 2: sllx <f2=%i4,16,>f2=%i4
sllx %i4,16,%i4

# qhasm: f3 <<= 24
# asm 1: sllx <f3=int64#6,24,>f3=int64#6
# asm 2: sllx <f3=%i5,24,>f3=%i5
sllx %i5,24,%i5

# qhasm: f4 <<= 32
# asm 1: sllx <f4=int64#7,32,>f4=int64#7
# asm 2: sllx <f4=%g1,32,>f4=%g1
sllx %g1,32,%g1

# qhasm: f5 <<= 40
# asm 1: sllx <f5=int64#8,40,>f5=int64#8
# asm 2: sllx <f5=%g4,40,>f5=%g4
sllx %g4,40,%g4

# qhasm: x0 = 2151
# asm 1: add %g0,2151,>x0=int64#9
# asm 2: add %g0,2151,>x0=%g5
add %g0,2151,%g5

# qhasm: x0 <<= 51
# asm 1: sllx <x0=int64#9,51,>x0=int64#9
# asm 2: sllx <x0=%g5,51,>x0=%g5
sllx %g5,51,%g5

# qhasm: x0 += f0
# asm 1: add <x0=int64#9,<f0=int64#3,>x0=int64#3
# asm 2: add <x0=%g5,<f0=%i2,>x0=%i2
add %g5,%i2,%i2

# qhasm: x0 += f1
# asm 1: add <x0=int64#3,<f1=int64#4,>x0=int64#3
# asm 2: add <x0=%i2,<f1=%i3,>x0=%i2
add %i2,%i3,%i2

# qhasm: x0 += f2
# asm 1: add <x0=int64#3,<f2=int64#5,>x0=int64#3
# asm 2: add <x0=%i2,<f2=%i4,>x0=%i2
add %i2,%i4,%i2

# qhasm: x0 += f3
# asm 1: add <x0=int64#3,<f3=int64#6,>x0=int64#3
# asm 2: add <x0=%i2,<f3=%i5,>x0=%i2
add %i2,%i5,%i2

# qhasm: x0 += f4
# asm 1: add <x0=int64#3,<f4=int64#7,>x0=int64#3
# asm 2: add <x0=%i2,<f4=%g1,>x0=%i2
add %i2,%g1,%i2

# qhasm: x0 += f5
# asm 1: add <x0=int64#3,<f5=int64#8,>x0=int64#3
# asm 2: add <x0=%i2,<f5=%g4,>x0=%i2
add %i2,%g4,%i2

# qhasm: f6 = *(uint8 *) (x + 6)
# asm 1: ldub [<x=int64#2+6],>f6=int64#4
# asm 2: ldub [<x=%i1+6],>f6=%i3
ldub [%i1+6],%i3

# qhasm: f7 = *(uint8 *) (x + 7)
# asm 1: ldub [<x=int64#2+7],>f7=int64#5
# asm 2: ldub [<x=%i1+7],>f7=%i4
ldub [%i1+7],%i4

# qhasm: f8 = *(uint8 *) (x + 8)
# asm 1: ldub [<x=int64#2+8],>f8=int64#6
# asm 2: ldub [<x=%i1+8],>f8=%i5
ldub [%i1+8],%i5

# qhasm: f9 = *(uint8 *) (x + 9)
# asm 1: ldub [<x=int64#2+9],>f9=int64#7
# asm 2: ldub [<x=%i1+9],>f9=%g1
ldub [%i1+9],%g1

# qhasm: f10 = *(uint8 *) (x + 10)
# asm 1: ldub [<x=int64#2+10],>f10=int64#8
# asm 2: ldub [<x=%i1+10],>f10=%g4
ldub [%i1+10],%g4

# qhasm: f7 <<= 8
# asm 1: sllx <f7=int64#5,8,>f7=int64#5
# asm 2: sllx <f7=%i4,8,>f7=%i4
sllx %i4,8,%i4

# qhasm: f8 <<= 16
# asm 1: sllx <f8=int64#6,16,>f8=int64#6
# asm 2: sllx <f8=%i5,16,>f8=%i5
sllx %i5,16,%i5

# qhasm: f9 <<= 24
# asm 1: sllx <f9=int64#7,24,>f9=int64#7
# asm 2: sllx <f9=%g1,24,>f9=%g1
sllx %g1,24,%g1

# qhasm: f10 <<= 32
# asm 1: sllx <f10=int64#8,32,>f10=int64#8
# asm 2: sllx <f10=%g4,32,>f10=%g4
sllx %g4,32,%g4

# qhasm: x48 = 2247
# asm 1: add %g0,2247,>x48=int64#9
# asm 2: add %g0,2247,>x48=%g5
add %g0,2247,%g5

# qhasm: x48 <<= 51
# asm 1: sllx <x48=int64#9,51,>x48=int64#9
# asm 2: sllx <x48=%g5,51,>x48=%g5
sllx %g5,51,%g5

# qhasm: x48 += f6
# asm 1: add <x48=int64#9,<f6=int64#4,>x48=int64#4
# asm 2: add <x48=%g5,<f6=%i3,>x48=%i3
add %g5,%i3,%i3

# qhasm: x48 += f7
# asm 1: add <x48=int64#4,<f7=int64#5,>x48=int64#4
# asm 2: add <x48=%i3,<f7=%i4,>x48=%i3
add %i3,%i4,%i3

# qhasm: x48 += f8
# asm 1: add <x48=int64#4,<f8=int64#6,>x48=int64#4
# asm 2: add <x48=%i3,<f8=%i5,>x48=%i3
add %i3,%i5,%i3

# qhasm: x48 += f9
# asm 1: add <x48=int64#4,<f9=int64#7,>x48=int64#4
# asm 2: add <x48=%i3,<f9=%g1,>x48=%i3
add %i3,%g1,%i3

# qhasm: x48 += f10
# asm 1: add <x48=int64#4,<f10=int64#8,>x48=int64#4
# asm 2: add <x48=%i3,<f10=%g4,>x48=%i3
add %i3,%g4,%i3

# qhasm: f11 = *(uint8 *) (x + 11)
# asm 1: ldub [<x=int64#2+11],>f11=int64#5
# asm 2: ldub [<x=%i1+11],>f11=%i4
ldub [%i1+11],%i4

# qhasm: f12 = *(uint8 *) (x + 12)
# asm 1: ldub [<x=int64#2+12],>f12=int64#6
# asm 2: ldub [<x=%i1+12],>f12=%i5
ldub [%i1+12],%i5

# qhasm: f13 = *(uint8 *) (x + 13)
# asm 1: ldub [<x=int64#2+13],>f13=int64#7
# asm 2: ldub [<x=%i1+13],>f13=%g1
ldub [%i1+13],%g1

# qhasm: f14 = *(uint8 *) (x + 14)
# asm 1: ldub [<x=int64#2+14],>f14=int64#8
# asm 2: ldub [<x=%i1+14],>f14=%g4
ldub [%i1+14],%g4

# qhasm: f15 = *(uint8 *) (x + 15)
# asm 1: ldub [<x=int64#2+15],>f15=int64#9
# asm 2: ldub [<x=%i1+15],>f15=%g5
ldub [%i1+15],%g5

# qhasm: f12 <<= 8
# asm 1: sllx <f12=int64#6,8,>f12=int64#6
# asm 2: sllx <f12=%i5,8,>f12=%i5
sllx %i5,8,%i5

# qhasm: f13 <<= 16
# asm 1: sllx <f13=int64#7,16,>f13=int64#7
# asm 2: sllx <f13=%g1,16,>f13=%g1
sllx %g1,16,%g1

# qhasm: f14 <<= 24
# asm 1: sllx <f14=int64#8,24,>f14=int64#8
# asm 2: sllx <f14=%g4,24,>f14=%g4
sllx %g4,24,%g4

# qhasm: f15 <<= 32
# asm 1: sllx <f15=int64#9,32,>f15=int64#9
# asm 2: sllx <f15=%g5,32,>f15=%g5
sllx %g5,32,%g5

# qhasm: x88 = 2327
# asm 1: add %g0,2327,>x88=int64#10
# asm 2: add %g0,2327,>x88=%o0
add %g0,2327,%o0

# qhasm: x88 <<= 51
# asm 1: sllx <x88=int64#10,51,>x88=int64#10
# asm 2: sllx <x88=%o0,51,>x88=%o0
sllx %o0,51,%o0

# qhasm: x88 += f11
# asm 1: add <x88=int64#10,<f11=int64#5,>x88=int64#5
# asm 2: add <x88=%o0,<f11=%i4,>x88=%i4
add %o0,%i4,%i4

# qhasm: x88 += f12
# asm 1: add <x88=int64#5,<f12=int64#6,>x88=int64#5
# asm 2: add <x88=%i4,<f12=%i5,>x88=%i4
add %i4,%i5,%i4

# qhasm: x88 += f13
# asm 1: add <x88=int64#5,<f13=int64#7,>x88=int64#5
# asm 2: add <x88=%i4,<f13=%g1,>x88=%i4
add %i4,%g1,%i4

# qhasm: x88 += f14
# asm 1: add <x88=int64#5,<f14=int64#8,>x88=int64#5
# asm 2: add <x88=%i4,<f14=%g4,>x88=%i4
add %i4,%g4,%i4

# qhasm: x88 += f15
# asm 1: add <x88=int64#5,<f15=int64#9,>x88=int64#5
# asm 2: add <x88=%i4,<f15=%g5,>x88=%i4
add %i4,%g5,%i4

# qhasm: f16 = *(uint8 *) (x + 16)
# asm 1: ldub [<x=int64#2+16],>f16=int64#6
# asm 2: ldub [<x=%i1+16],>f16=%i5
ldub [%i1+16],%i5

# qhasm: f17 = *(uint8 *) (x + 17)
# asm 1: ldub [<x=int64#2+17],>f17=int64#7
# asm 2: ldub [<x=%i1+17],>f17=%g1
ldub [%i1+17],%g1

# qhasm: f18 = *(uint8 *) (x + 18)
# asm 1: ldub [<x=int64#2+18],>f18=int64#8
# asm 2: ldub [<x=%i1+18],>f18=%g4
ldub [%i1+18],%g4

# qhasm: f19 = *(uint8 *) (x + 19)
# asm 1: ldub [<x=int64#2+19],>f19=int64#9
# asm 2: ldub [<x=%i1+19],>f19=%g5
ldub [%i1+19],%g5

# qhasm: f20 = *(uint8 *) (x + 20)
# asm 1: ldub [<x=int64#2+20],>f20=int64#10
# asm 2: ldub [<x=%i1+20],>f20=%o0
ldub [%i1+20],%o0

# qhasm: f21 = *(uint8 *) (x + 21)
# asm 1: ldub [<x=int64#2+21],>f21=int64#11
# asm 2: ldub [<x=%i1+21],>f21=%o1
ldub [%i1+21],%o1

# qhasm: f17 <<= 8
# asm 1: sllx <f17=int64#7,8,>f17=int64#7
# asm 2: sllx <f17=%g1,8,>f17=%g1
sllx %g1,8,%g1

# qhasm: f18 <<= 16
# asm 1: sllx <f18=int64#8,16,>f18=int64#8
# asm 2: sllx <f18=%g4,16,>f18=%g4
sllx %g4,16,%g4

# qhasm: f19 <<= 24
# asm 1: sllx <f19=int64#9,24,>f19=int64#9
# asm 2: sllx <f19=%g5,24,>f19=%g5
sllx %g5,24,%g5

# qhasm: f20 <<= 32
# asm 1: sllx <f20=int64#10,32,>f20=int64#10
# asm 2: sllx <f20=%o0,32,>f20=%o0
sllx %o0,32,%o0

# qhasm: f21 <<= 40
# asm 1: sllx <f21=int64#11,40,>f21=int64#11
# asm 2: sllx <f21=%o1,40,>f21=%o1
sllx %o1,40,%o1

# qhasm: x128 = 2407
# asm 1: add %g0,2407,>x128=int64#12
# asm 2: add %g0,2407,>x128=%o2
add %g0,2407,%o2

# qhasm: x128 <<= 51
# asm 1: sllx <x128=int64#12,51,>x128=int64#12
# asm 2: sllx <x128=%o2,51,>x128=%o2
sllx %o2,51,%o2

# qhasm: x128 += f16
# asm 1: add <x128=int64#12,<f16=int64#6,>x128=int64#6
# asm 2: add <x128=%o2,<f16=%i5,>x128=%i5
add %o2,%i5,%i5

# qhasm: x128 += f17
# asm 1: add <x128=int64#6,<f17=int64#7,>x128=int64#6
# asm 2: add <x128=%i5,<f17=%g1,>x128=%i5
add %i5,%g1,%i5

# qhasm: x128 += f18
# asm 1: add <x128=int64#6,<f18=int64#8,>x128=int64#6
# asm 2: add <x128=%i5,<f18=%g4,>x128=%i5
add %i5,%g4,%i5

# qhasm: x128 += f19
# asm 1: add <x128=int64#6,<f19=int64#9,>x128=int64#6
# asm 2: add <x128=%i5,<f19=%g5,>x128=%i5
add %i5,%g5,%i5

# qhasm: x128 += f20
# asm 1: add <x128=int64#6,<f20=int64#10,>x128=int64#6
# asm 2: add <x128=%i5,<f20=%o0,>x128=%i5
add %i5,%o0,%i5

# qhasm: x128 += f21
# asm 1: add <x128=int64#6,<f21=int64#11,>x128=int64#6
# asm 2: add <x128=%i5,<f21=%o1,>x128=%i5
add %i5,%o1,%i5

# qhasm: f22 = *(uint8 *) (x + 22)
# asm 1: ldub [<x=int64#2+22],>f22=int64#7
# asm 2: ldub [<x=%i1+22],>f22=%g1
ldub [%i1+22],%g1

# qhasm: f23 = *(uint8 *) (x + 23)
# asm 1: ldub [<x=int64#2+23],>f23=int64#8
# asm 2: ldub [<x=%i1+23],>f23=%g4
ldub [%i1+23],%g4

# qhasm: f24 = *(uint8 *) (x + 24)
# asm 1: ldub [<x=int64#2+24],>f24=int64#9
# asm 2: ldub [<x=%i1+24],>f24=%g5
ldub [%i1+24],%g5

# qhasm: f25 = *(uint8 *) (x + 25)
# asm 1: ldub [<x=int64#2+25],>f25=int64#10
# asm 2: ldub [<x=%i1+25],>f25=%o0
ldub [%i1+25],%o0

# qhasm: f26 = *(uint8 *) (x + 26)
# asm 1: ldub [<x=int64#2+26],>f26=int64#11
# asm 2: ldub [<x=%i1+26],>f26=%o1
ldub [%i1+26],%o1

# qhasm: f23 <<= 8
# asm 1: sllx <f23=int64#8,8,>f23=int64#8
# asm 2: sllx <f23=%g4,8,>f23=%g4
sllx %g4,8,%g4

# qhasm: f24 <<= 16
# asm 1: sllx <f24=int64#9,16,>f24=int64#9
# asm 2: sllx <f24=%g5,16,>f24=%g5
sllx %g5,16,%g5

# qhasm: f25 <<= 24
# asm 1: sllx <f25=int64#10,24,>f25=int64#10
# asm 2: sllx <f25=%o0,24,>f25=%o0
sllx %o0,24,%o0

# qhasm: f26 <<= 32
# asm 1: sllx <f26=int64#11,32,>f26=int64#11
# asm 2: sllx <f26=%o1,32,>f26=%o1
sllx %o1,32,%o1

# qhasm: x176 = 2503
# asm 1: add %g0,2503,>x176=int64#12
# asm 2: add %g0,2503,>x176=%o2
add %g0,2503,%o2

# qhasm: x176 <<= 51
# asm 1: sllx <x176=int64#12,51,>x176=int64#12
# asm 2: sllx <x176=%o2,51,>x176=%o2
sllx %o2,51,%o2

# qhasm: x176 += f22
# asm 1: add <x176=int64#12,<f22=int64#7,>x176=int64#7
# asm 2: add <x176=%o2,<f22=%g1,>x176=%g1
add %o2,%g1,%g1

# qhasm: x176 += f23
# asm 1: add <x176=int64#7,<f23=int64#8,>x176=int64#7
# asm 2: add <x176=%g1,<f23=%g4,>x176=%g1
add %g1,%g4,%g1

# qhasm: x176 += f24
# asm 1: add <x176=int64#7,<f24=int64#9,>x176=int64#7
# asm 2: add <x176=%g1,<f24=%g5,>x176=%g1
add %g1,%g5,%g1

# qhasm: x176 += f25
# asm 1: add <x176=int64#7,<f25=int64#10,>x176=int64#7
# asm 2: add <x176=%g1,<f25=%o0,>x176=%g1
add %g1,%o0,%g1

# qhasm: x176 += f26
# asm 1: add <x176=int64#7,<f26=int64#11,>x176=int64#7
# asm 2: add <x176=%g1,<f26=%o1,>x176=%g1
add %g1,%o1,%g1

# qhasm: f27 = *(uint8 *) (x + 27)
# asm 1: ldub [<x=int64#2+27],>f27=int64#8
# asm 2: ldub [<x=%i1+27],>f27=%g4
ldub [%i1+27],%g4

# qhasm: f28 = *(uint8 *) (x + 28)
# asm 1: ldub [<x=int64#2+28],>f28=int64#9
# asm 2: ldub [<x=%i1+28],>f28=%g5
ldub [%i1+28],%g5

# qhasm: f29 = *(uint8 *) (x + 29)
# asm 1: ldub [<x=int64#2+29],>f29=int64#10
# asm 2: ldub [<x=%i1+29],>f29=%o0
ldub [%i1+29],%o0

# qhasm: f30 = *(uint8 *) (x + 30)
# asm 1: ldub [<x=int64#2+30],>f30=int64#11
# asm 2: ldub [<x=%i1+30],>f30=%o1
ldub [%i1+30],%o1

# qhasm: f31 = *(uint8 *) (x + 31)
# asm 1: ldub [<x=int64#2+31],>f31=int64#2
# asm 2: ldub [<x=%i1+31],>f31=%i1
ldub [%i1+31],%i1

# qhasm: f28 <<= 8
# asm 1: sllx <f28=int64#9,8,>f28=int64#9
# asm 2: sllx <f28=%g5,8,>f28=%g5
sllx %g5,8,%g5

# qhasm: f29 <<= 16
# asm 1: sllx <f29=int64#10,16,>f29=int64#10
# asm 2: sllx <f29=%o0,16,>f29=%o0
sllx %o0,16,%o0

# qhasm: f30 <<= 24
# asm 1: sllx <f30=int64#11,24,>f30=int64#11
# asm 2: sllx <f30=%o1,24,>f30=%o1
sllx %o1,24,%o1

# qhasm: f31 <<= 32
# asm 1: sllx <f31=int64#2,32,>f31=int64#2
# asm 2: sllx <f31=%i1,32,>f31=%i1
sllx %i1,32,%i1

# qhasm: x216 = 2583
# asm 1: add %g0,2583,>x216=int64#12
# asm 2: add %g0,2583,>x216=%o2
add %g0,2583,%o2

# qhasm: x216 <<= 51
# asm 1: sllx <x216=int64#12,51,>x216=int64#12
# asm 2: sllx <x216=%o2,51,>x216=%o2
sllx %o2,51,%o2

# qhasm: x216 += f27
# asm 1: add <x216=int64#12,<f27=int64#8,>x216=int64#8
# asm 2: add <x216=%o2,<f27=%g4,>x216=%g4
add %o2,%g4,%g4

# qhasm: x216 += f28
# asm 1: add <x216=int64#8,<f28=int64#9,>x216=int64#8
# asm 2: add <x216=%g4,<f28=%g5,>x216=%g4
add %g4,%g5,%g4

# qhasm: x216 += f29
# asm 1: add <x216=int64#8,<f29=int64#10,>x216=int64#8
# asm 2: add <x216=%g4,<f29=%o0,>x216=%g4
add %g4,%o0,%g4

# qhasm: x216 += f30
# asm 1: add <x216=int64#8,<f30=int64#11,>x216=int64#8
# asm 2: add <x216=%g4,<f30=%o1,>x216=%g4
add %g4,%o1,%g4

# qhasm: x216 += f31
# asm 1: add <x216=int64#8,<f31=int64#2,>x216=int64#2
# asm 2: add <x216=%g4,<f31=%i1,>x216=%i1
add %g4,%i1,%i1

# qhasm: y0 = x0
# asm 1: stx <x0=int64#3,[%fp+2023->y0=stack64#1]
# asm 2: stx <x0=%i2,[%fp+2023->y0=0]
stx %i2,[%fp+2023-0]

# qhasm: y48 = x48
# asm 1: stx <x48=int64#4,[%fp+2023->y48=stack64#2]
# asm 2: stx <x48=%i3,[%fp+2023->y48=8]
stx %i3,[%fp+2023-8]

# qhasm: y88 = x88
# asm 1: stx <x88=int64#5,[%fp+2023->y88=stack64#3]
# asm 2: stx <x88=%i4,[%fp+2023->y88=16]
stx %i4,[%fp+2023-16]

# qhasm: y128 = x128
# asm 1: stx <x128=int64#6,[%fp+2023->y128=stack64#4]
# asm 2: stx <x128=%i5,[%fp+2023->y128=24]
stx %i5,[%fp+2023-24]

# qhasm: y176 = x176
# asm 1: stx <x176=int64#7,[%fp+2023->y176=stack64#5]
# asm 2: stx <x176=%g1,[%fp+2023->y176=32]
stx %g1,[%fp+2023-32]

# qhasm: y216 = x216
# asm 1: stx <x216=int64#2,[%fp+2023->y216=stack64#6]
# asm 2: stx <x216=%i1,[%fp+2023->y216=40]
stx %i1,[%fp+2023-40]

# qhasm: constants = (nistp256_constants & 0xfffffc0000000000) >> 32
# asm 1: sethi %hh(nistp256_constants),>constants=int64#2
# asm 2: sethi %hh(nistp256_constants),>constants=%i1
sethi %hh(nistp256_constants),%i1

# qhasm: constants_low = nistp256_constants & 0xfffffc00
# asm 1: sethi %lm(nistp256_constants),>constants_low=int64#3
# asm 2: sethi %lm(nistp256_constants),>constants_low=%i2
sethi %lm(nistp256_constants),%i2

# qhasm: constants |= (nistp256_constants & 0x3ff00000000) >> 32
# asm 1: or <constants=int64#2,%hm(nistp256_constants),>constants=int64#2
# asm 2: or <constants=%i1,%hm(nistp256_constants),>constants=%i1
or %i1,%hm(nistp256_constants),%i1

# qhasm: constants_low |= nistp256_constants & 0x3ff
# asm 1: or <constants_low=int64#3,%lo(nistp256_constants),>constants_low=int64#3
# asm 2: or <constants_low=%i2,%lo(nistp256_constants),>constants_low=%i2
or %i2,%lo(nistp256_constants),%i2

# qhasm: constants <<= 32
# asm 1: sllx <constants=int64#2,32,>constants=int64#2
# asm 2: sllx <constants=%i1,32,>constants=%i1
sllx %i1,32,%i1

# qhasm: constants |= constants_low
# asm 1: or  <constants=int64#2,<constants_low=int64#3,>constants=int64#2
# asm 2: or  <constants=%i1,<constants_low=%i2,>constants=%i1
or  %i1,%i2,%i1

# qhasm: alpha0 = *(float64 *) (constants + 104)
# asm 1: ldd [<constants=int64#2+104],>alpha0=float64#1
# asm 2: ldd [<constants=%i1+104],>alpha0=%f0
ldd [%i1+104],%f0

# qhasm: alpha48 = *(float64 *) (constants + 112)
# asm 1: ldd [<constants=int64#2+112],>alpha48=float64#2
# asm 2: ldd [<constants=%i1+112],>alpha48=%f2
ldd [%i1+112],%f2

# qhasm: alpha88 = *(float64 *) (constants + 120)
# asm 1: ldd [<constants=int64#2+120],>alpha88=float64#3
# asm 2: ldd [<constants=%i1+120],>alpha88=%f4
ldd [%i1+120],%f4

# qhasm: alpha128 = *(float64 *) (constants + 48)
# asm 1: ldd [<constants=int64#2+48],>alpha128=float64#4
# asm 2: ldd [<constants=%i1+48],>alpha128=%f6
ldd [%i1+48],%f6

# qhasm: alpha176 = *(float64 *) (constants + 128)
# asm 1: ldd [<constants=int64#2+128],>alpha176=float64#5
# asm 2: ldd [<constants=%i1+128],>alpha176=%f8
ldd [%i1+128],%f8

# qhasm: alpha216 = *(float64 *) (constants + 136)
# asm 1: ldd [<constants=int64#2+136],>alpha216=float64#6
# asm 2: ldd [<constants=%i1+136],>alpha216=%f10
ldd [%i1+136],%f10

# qhasm: alpha22 = *(float64 *) (constants + 8)
# asm 1: ldd [<constants=int64#2+8],>alpha22=float64#7
# asm 2: ldd [<constants=%i1+8],>alpha22=%f12
ldd [%i1+8],%f12

# qhasm: alpha43 = *(float64 *) (constants + 16)
# asm 1: ldd [<constants=int64#2+16],>alpha43=float64#8
# asm 2: ldd [<constants=%i1+16],>alpha43=%f14
ldd [%i1+16],%f14

# qhasm: alpha64 = *(float64 *) (constants + 24)
# asm 1: ldd [<constants=int64#2+24],>alpha64=float64#9
# asm 2: ldd [<constants=%i1+24],>alpha64=%f16
ldd [%i1+24],%f16

# qhasm: alpha86 = *(float64 *) (constants + 32)
# asm 1: ldd [<constants=int64#2+32],>alpha86=float64#10
# asm 2: ldd [<constants=%i1+32],>alpha86=%f18
ldd [%i1+32],%f18

# qhasm: alpha107 = *(float64 *) (constants + 40)
# asm 1: ldd [<constants=int64#2+40],>alpha107=float64#11
# asm 2: ldd [<constants=%i1+40],>alpha107=%f20
ldd [%i1+40],%f20

# qhasm: alpha150 = *(float64 *) (constants + 56)
# asm 1: ldd [<constants=int64#2+56],>alpha150=float64#12
# asm 2: ldd [<constants=%i1+56],>alpha150=%f22
ldd [%i1+56],%f22

# qhasm: alpha171 = *(float64 *) (constants + 64)
# asm 1: ldd [<constants=int64#2+64],>alpha171=float64#13
# asm 2: ldd [<constants=%i1+64],>alpha171=%f24
ldd [%i1+64],%f24

# qhasm: alpha192 = *(float64 *) (constants + 72)
# asm 1: ldd [<constants=int64#2+72],>alpha192=float64#14
# asm 2: ldd [<constants=%i1+72],>alpha192=%f26
ldd [%i1+72],%f26

# qhasm: alpha214 = *(float64 *) (constants + 80)
# asm 1: ldd [<constants=int64#2+80],>alpha214=float64#15
# asm 2: ldd [<constants=%i1+80],>alpha214=%f28
ldd [%i1+80],%f28

# qhasm: alpha235 = *(float64 *) (constants + 88)
# asm 1: ldd [<constants=int64#2+88],>alpha235=float64#16
# asm 2: ldd [<constants=%i1+88],>alpha235=%f30
ldd [%i1+88],%f30

# qhasm: z0 = y0
# asm 1: ldd [%fp+2023-<y0=stack64#1],>z0=float64#17
# asm 2: ldd [%fp+2023-<y0=0],>z0=%f32
ldd [%fp+2023-0],%f32

# qhasm: z43 = y48
# asm 1: ldd [%fp+2023-<y48=stack64#2],>z43=float64#18
# asm 2: ldd [%fp+2023-<y48=8],>z43=%f34
ldd [%fp+2023-8],%f34

# qhasm: z86 = y88
# asm 1: ldd [%fp+2023-<y88=stack64#3],>z86=float64#19
# asm 2: ldd [%fp+2023-<y88=16],>z86=%f36
ldd [%fp+2023-16],%f36

# qhasm: z128 = y128
# asm 1: ldd [%fp+2023-<y128=stack64#4],>z128=float64#20
# asm 2: ldd [%fp+2023-<y128=24],>z128=%f38
ldd [%fp+2023-24],%f38

# qhasm: z171 = y176
# asm 1: ldd [%fp+2023-<y176=stack64#5],>z171=float64#21
# asm 2: ldd [%fp+2023-<y176=32],>z171=%f40
ldd [%fp+2023-32],%f40

# qhasm: z214 = y216
# asm 1: ldd [%fp+2023-<y216=stack64#6],>z214=float64#22
# asm 2: ldd [%fp+2023-<y216=40],>z214=%f42
ldd [%fp+2023-40],%f42

# qhasm: z0 -= alpha0
# asm 1: fsubd <z0=float64#17,<alpha0=float64#1,>z0=float64#1
# asm 2: fsubd <z0=%f32,<alpha0=%f0,>z0=%f0
fsubd %f32,%f0,%f0

# qhasm: z43 -= alpha48
# asm 1: fsubd <z43=float64#18,<alpha48=float64#2,>z43=float64#2
# asm 2: fsubd <z43=%f34,<alpha48=%f2,>z43=%f2
fsubd %f34,%f2,%f2

# qhasm: z86 -= alpha88
# asm 1: fsubd <z86=float64#19,<alpha88=float64#3,>z86=float64#3
# asm 2: fsubd <z86=%f36,<alpha88=%f4,>z86=%f4
fsubd %f36,%f4,%f4

# qhasm: z128 -= alpha128
# asm 1: fsubd <z128=float64#20,<alpha128=float64#4,>z128=float64#17
# asm 2: fsubd <z128=%f38,<alpha128=%f6,>z128=%f32
fsubd %f38,%f6,%f32

# qhasm: z171 -= alpha176
# asm 1: fsubd <z171=float64#21,<alpha176=float64#5,>z171=float64#5
# asm 2: fsubd <z171=%f40,<alpha176=%f8,>z171=%f8
fsubd %f40,%f8,%f8

# qhasm: z214 -= alpha216
# asm 1: fsubd <z214=float64#22,<alpha216=float64#6,>z214=float64#6
# asm 2: fsubd <z214=%f42,<alpha216=%f10,>z214=%f10
fsubd %f42,%f10,%f10

# qhasm: z22 = z0 + alpha22
# asm 1: faddd <z0=float64#1,<alpha22=float64#7,>z22=float64#18
# asm 2: faddd <z0=%f0,<alpha22=%f12,>z22=%f34
faddd %f0,%f12,%f34

# qhasm: z22 -= alpha22
# asm 1: fsubd <z22=float64#18,<alpha22=float64#7,>z22=float64#7
# asm 2: fsubd <z22=%f34,<alpha22=%f12,>z22=%f12
fsubd %f34,%f12,%f12

# qhasm: z0 -= z22
# asm 1: fsubd <z0=float64#1,<z22=float64#7,>z0=float64#1
# asm 2: fsubd <z0=%f0,<z22=%f12,>z0=%f0
fsubd %f0,%f12,%f0

# qhasm: closest43 = z22 + alpha43
# asm 1: faddd <z22=float64#7,<alpha43=float64#8,>closest43=float64#18
# asm 2: faddd <z22=%f12,<alpha43=%f14,>closest43=%f34
faddd %f12,%f14,%f34

# qhasm: closest43 -= alpha43
# asm 1: fsubd <closest43=float64#18,<alpha43=float64#8,>closest43=float64#8
# asm 2: fsubd <closest43=%f34,<alpha43=%f14,>closest43=%f14
fsubd %f34,%f14,%f14

# qhasm: z22 -= closest43
# asm 1: fsubd <z22=float64#7,<closest43=float64#8,>z22=float64#7
# asm 2: fsubd <z22=%f12,<closest43=%f14,>z22=%f12
fsubd %f12,%f14,%f12

# qhasm: z43 += closest43
# asm 1: faddd <z43=float64#2,<closest43=float64#8,>z43=float64#2
# asm 2: faddd <z43=%f2,<closest43=%f14,>z43=%f2
faddd %f2,%f14,%f2

# qhasm: z64 = z43 + alpha64
# asm 1: faddd <z43=float64#2,<alpha64=float64#9,>z64=float64#8
# asm 2: faddd <z43=%f2,<alpha64=%f16,>z64=%f14
faddd %f2,%f16,%f14

# qhasm: z64 -= alpha64
# asm 1: fsubd <z64=float64#8,<alpha64=float64#9,>z64=float64#8
# asm 2: fsubd <z64=%f14,<alpha64=%f16,>z64=%f14
fsubd %f14,%f16,%f14

# qhasm: z43 -= z64
# asm 1: fsubd <z43=float64#2,<z64=float64#8,>z43=float64#2
# asm 2: fsubd <z43=%f2,<z64=%f14,>z43=%f2
fsubd %f2,%f14,%f2

# qhasm: closest86 = z64 + alpha86
# asm 1: faddd <z64=float64#8,<alpha86=float64#10,>closest86=float64#9
# asm 2: faddd <z64=%f14,<alpha86=%f18,>closest86=%f16
faddd %f14,%f18,%f16

# qhasm: closest86 -= alpha86
# asm 1: fsubd <closest86=float64#9,<alpha86=float64#10,>closest86=float64#9
# asm 2: fsubd <closest86=%f16,<alpha86=%f18,>closest86=%f16
fsubd %f16,%f18,%f16

# qhasm: z64 -= closest86
# asm 1: fsubd <z64=float64#8,<closest86=float64#9,>z64=float64#8
# asm 2: fsubd <z64=%f14,<closest86=%f16,>z64=%f14
fsubd %f14,%f16,%f14

# qhasm: z86 += closest86
# asm 1: faddd <z86=float64#3,<closest86=float64#9,>z86=float64#3
# asm 2: faddd <z86=%f4,<closest86=%f16,>z86=%f4
faddd %f4,%f16,%f4

# qhasm: z107 = z86 + alpha107
# asm 1: faddd <z86=float64#3,<alpha107=float64#11,>z107=float64#9
# asm 2: faddd <z86=%f4,<alpha107=%f20,>z107=%f16
faddd %f4,%f20,%f16

# qhasm: z107 -= alpha107
# asm 1: fsubd <z107=float64#9,<alpha107=float64#11,>z107=float64#9
# asm 2: fsubd <z107=%f16,<alpha107=%f20,>z107=%f16
fsubd %f16,%f20,%f16

# qhasm: z86 -= z107
# asm 1: fsubd <z86=float64#3,<z107=float64#9,>z86=float64#3
# asm 2: fsubd <z86=%f4,<z107=%f16,>z86=%f4
fsubd %f4,%f16,%f4

# qhasm: closest128 = z107 + alpha128
# asm 1: faddd <z107=float64#9,<alpha128=float64#4,>closest128=float64#10
# asm 2: faddd <z107=%f16,<alpha128=%f6,>closest128=%f18
faddd %f16,%f6,%f18

# qhasm: closest128 -= alpha128
# asm 1: fsubd <closest128=float64#10,<alpha128=float64#4,>closest128=float64#4
# asm 2: fsubd <closest128=%f18,<alpha128=%f6,>closest128=%f6
fsubd %f18,%f6,%f6

# qhasm: z107 -= closest128
# asm 1: fsubd <z107=float64#9,<closest128=float64#4,>z107=float64#9
# asm 2: fsubd <z107=%f16,<closest128=%f6,>z107=%f16
fsubd %f16,%f6,%f16

# qhasm: z128 += closest128
# asm 1: faddd <z128=float64#17,<closest128=float64#4,>z128=float64#4
# asm 2: faddd <z128=%f32,<closest128=%f6,>z128=%f6
faddd %f32,%f6,%f6

# qhasm: z150 = z128 + alpha150
# asm 1: faddd <z128=float64#4,<alpha150=float64#12,>z150=float64#10
# asm 2: faddd <z128=%f6,<alpha150=%f22,>z150=%f18
faddd %f6,%f22,%f18

# qhasm: z150 -= alpha150
# asm 1: fsubd <z150=float64#10,<alpha150=float64#12,>z150=float64#10
# asm 2: fsubd <z150=%f18,<alpha150=%f22,>z150=%f18
fsubd %f18,%f22,%f18

# qhasm: z128 -= z150
# asm 1: fsubd <z128=float64#4,<z150=float64#10,>z128=float64#4
# asm 2: fsubd <z128=%f6,<z150=%f18,>z128=%f6
fsubd %f6,%f18,%f6

# qhasm: closest171 = z150 + alpha171
# asm 1: faddd <z150=float64#10,<alpha171=float64#13,>closest171=float64#11
# asm 2: faddd <z150=%f18,<alpha171=%f24,>closest171=%f20
faddd %f18,%f24,%f20

# qhasm: closest171 -= alpha171
# asm 1: fsubd <closest171=float64#11,<alpha171=float64#13,>closest171=float64#11
# asm 2: fsubd <closest171=%f20,<alpha171=%f24,>closest171=%f20
fsubd %f20,%f24,%f20

# qhasm: z150 -= closest171
# asm 1: fsubd <z150=float64#10,<closest171=float64#11,>z150=float64#10
# asm 2: fsubd <z150=%f18,<closest171=%f20,>z150=%f18
fsubd %f18,%f20,%f18

# qhasm: z171 += closest171
# asm 1: faddd <z171=float64#5,<closest171=float64#11,>z171=float64#5
# asm 2: faddd <z171=%f8,<closest171=%f20,>z171=%f8
faddd %f8,%f20,%f8

# qhasm: z192 = z171 + alpha192
# asm 1: faddd <z171=float64#5,<alpha192=float64#14,>z192=float64#11
# asm 2: faddd <z171=%f8,<alpha192=%f26,>z192=%f20
faddd %f8,%f26,%f20

# qhasm: z192 -= alpha192
# asm 1: fsubd <z192=float64#11,<alpha192=float64#14,>z192=float64#11
# asm 2: fsubd <z192=%f20,<alpha192=%f26,>z192=%f20
fsubd %f20,%f26,%f20

# qhasm: z171 -= z192
# asm 1: fsubd <z171=float64#5,<z192=float64#11,>z171=float64#5
# asm 2: fsubd <z171=%f8,<z192=%f20,>z171=%f8
fsubd %f8,%f20,%f8

# qhasm: closest214 = z192 + alpha214
# asm 1: faddd <z192=float64#11,<alpha214=float64#15,>closest214=float64#12
# asm 2: faddd <z192=%f20,<alpha214=%f28,>closest214=%f22
faddd %f20,%f28,%f22

# qhasm: closest214 -= alpha214
# asm 1: fsubd <closest214=float64#12,<alpha214=float64#15,>closest214=float64#12
# asm 2: fsubd <closest214=%f22,<alpha214=%f28,>closest214=%f22
fsubd %f22,%f28,%f22

# qhasm: z192 -= closest214
# asm 1: fsubd <z192=float64#11,<closest214=float64#12,>z192=float64#11
# asm 2: fsubd <z192=%f20,<closest214=%f22,>z192=%f20
fsubd %f20,%f22,%f20

# qhasm: z214 += closest214
# asm 1: faddd <z214=float64#6,<closest214=float64#12,>z214=float64#6
# asm 2: faddd <z214=%f10,<closest214=%f22,>z214=%f10
faddd %f10,%f22,%f10

# qhasm: z235 = z214 + alpha235
# asm 1: faddd <z214=float64#6,<alpha235=float64#16,>z235=float64#12
# asm 2: faddd <z214=%f10,<alpha235=%f30,>z235=%f22
faddd %f10,%f30,%f22

# qhasm: z235 -= alpha235
# asm 1: fsubd <z235=float64#12,<alpha235=float64#16,>z235=float64#12
# asm 2: fsubd <z235=%f22,<alpha235=%f30,>z235=%f22
fsubd %f22,%f30,%f22

# qhasm: z214 -= z235
# asm 1: fsubd <z214=float64#6,<z235=float64#12,>z214=float64#6
# asm 2: fsubd <z214=%f10,<z235=%f22,>z214=%f10
fsubd %f10,%f22,%f10

# qhasm: *(float64 *) (z + 0) = z0
# asm 1: std <z0=float64#1,[<z=int64#1+0]
# asm 2: std <z0=%f0,[<z=%i0+0]
std %f0,[%i0+0]

# qhasm: *(float64 *) (z + 8) = z22
# asm 1: std <z22=float64#7,[<z=int64#1+8]
# asm 2: std <z22=%f12,[<z=%i0+8]
std %f12,[%i0+8]

# qhasm: *(float64 *) (z + 16) = z43
# asm 1: std <z43=float64#2,[<z=int64#1+16]
# asm 2: std <z43=%f2,[<z=%i0+16]
std %f2,[%i0+16]

# qhasm: *(float64 *) (z + 24) = z64
# asm 1: std <z64=float64#8,[<z=int64#1+24]
# asm 2: std <z64=%f14,[<z=%i0+24]
std %f14,[%i0+24]

# qhasm: *(float64 *) (z + 32) = z86
# asm 1: std <z86=float64#3,[<z=int64#1+32]
# asm 2: std <z86=%f4,[<z=%i0+32]
std %f4,[%i0+32]

# qhasm: *(float64 *) (z + 40) = z107
# asm 1: std <z107=float64#9,[<z=int64#1+40]
# asm 2: std <z107=%f16,[<z=%i0+40]
std %f16,[%i0+40]

# qhasm: *(float64 *) (z + 48) = z128
# asm 1: std <z128=float64#4,[<z=int64#1+48]
# asm 2: std <z128=%f6,[<z=%i0+48]
std %f6,[%i0+48]

# qhasm: *(float64 *) (z + 56) = z150
# asm 1: std <z150=float64#10,[<z=int64#1+56]
# asm 2: std <z150=%f18,[<z=%i0+56]
std %f18,[%i0+56]

# qhasm: *(float64 *) (z + 64) = z171
# asm 1: std <z171=float64#5,[<z=int64#1+64]
# asm 2: std <z171=%f8,[<z=%i0+64]
std %f8,[%i0+64]

# qhasm: *(float64 *) (z + 72) = z192
# asm 1: std <z192=float64#11,[<z=int64#1+72]
# asm 2: std <z192=%f20,[<z=%i0+72]
std %f20,[%i0+72]

# qhasm: *(float64 *) (z + 80) = z214
# asm 1: std <z214=float64#6,[<z=int64#1+80]
# asm 2: std <z214=%f10,[<z=%i0+80]
std %f10,[%i0+80]

# qhasm: *(float64 *) (z + 88) = z235
# asm 1: std <z235=float64#12,[<z=int64#1+88]
# asm 2: std <z235=%f22,[<z=%i0+88]
std %f22,[%i0+88]

# qhasm: leave
ret
restore
