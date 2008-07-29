
# qhasm: enter nistp256_freeze
.section ".text"
.align 32
.global nistp256_freeze
nistp256_freeze:
save %sp,-272,%sp

# qhasm: int64 out

# qhasm: int64 r

# qhasm: input out

# qhasm: input r

# qhasm: int64 constants

# qhasm: int64 constants_low

# qhasm: float64 r0

# qhasm: float64 r22

# qhasm: float64 r43

# qhasm: float64 r64

# qhasm: float64 r86

# qhasm: float64 r107

# qhasm: float64 r128

# qhasm: float64 r150

# qhasm: float64 r171

# qhasm: float64 r192

# qhasm: float64 r214

# qhasm: float64 r235

# qhasm: float64 output0

# qhasm: float64 output16

# qhasm: float64 output40

# qhasm: float64 output64

# qhasm: float64 output80

# qhasm: float64 output104

# qhasm: float64 output128

# qhasm: float64 output144

# qhasm: float64 output168

# qhasm: float64 output192

# qhasm: float64 output208

# qhasm: float64 output232

# qhasm: stack64 w0

# qhasm: stack64 w16

# qhasm: stack64 w40

# qhasm: stack64 w64

# qhasm: stack64 w80

# qhasm: stack64 w104

# qhasm: stack64 w128

# qhasm: stack64 w144

# qhasm: stack64 w168

# qhasm: stack64 w192

# qhasm: stack64 w208

# qhasm: stack64 w232

# qhasm: int64 s0

# qhasm: int64 s16

# qhasm: int64 s40

# qhasm: int64 s64

# qhasm: int64 s80

# qhasm: int64 s104

# qhasm: int64 s128

# qhasm: int64 s144

# qhasm: int64 s168

# qhasm: int64 s192

# qhasm: int64 s208

# qhasm: int64 s232

# qhasm: int64 32bits

# qhasm: int64 31bits

# qhasm: int64 accum

# qhasm: int64 t0

# qhasm: int64 t32

# qhasm: int64 t64

# qhasm: int64 t96

# qhasm: int64 t128

# qhasm: int64 t160

# qhasm: int64 t192

# qhasm: int64 t224

# qhasm: int64 u0

# qhasm: int64 u32

# qhasm: int64 u64

# qhasm: int64 u96

# qhasm: int64 u128

# qhasm: int64 u160

# qhasm: int64 u192

# qhasm: int64 u224

# qhasm: int64 uc

# qhasm: int64 uc1

# qhasm: int64 wantt

# qhasm: int64 wantu

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

# qhasm: output0 = *(float64 *) (constants + 264 )
# asm 1: ldd [<constants=int64#3+264],>output0=float64#1
# asm 2: ldd [<constants=%i2+264],>output0=%f0
ldd [%i2+264],%f0

# qhasm: output16 = *(float64 *) (constants + 272 )
# asm 1: ldd [<constants=int64#3+272],>output16=float64#2
# asm 2: ldd [<constants=%i2+272],>output16=%f2
ldd [%i2+272],%f2

# qhasm: output40 = *(float64 *) (constants + 280 )
# asm 1: ldd [<constants=int64#3+280],>output40=float64#3
# asm 2: ldd [<constants=%i2+280],>output40=%f4
ldd [%i2+280],%f4

# qhasm: output64 = *(float64 *) (constants + 288 )
# asm 1: ldd [<constants=int64#3+288],>output64=float64#4
# asm 2: ldd [<constants=%i2+288],>output64=%f6
ldd [%i2+288],%f6

# qhasm: output80 = *(float64 *) (constants + 296 )
# asm 1: ldd [<constants=int64#3+296],>output80=float64#5
# asm 2: ldd [<constants=%i2+296],>output80=%f8
ldd [%i2+296],%f8

# qhasm: output104 = *(float64 *) (constants + 304)
# asm 1: ldd [<constants=int64#3+304],>output104=float64#6
# asm 2: ldd [<constants=%i2+304],>output104=%f10
ldd [%i2+304],%f10

# qhasm: output128 = *(float64 *) (constants + 312)
# asm 1: ldd [<constants=int64#3+312],>output128=float64#7
# asm 2: ldd [<constants=%i2+312],>output128=%f12
ldd [%i2+312],%f12

# qhasm: output144 = *(float64 *) (constants + 320)
# asm 1: ldd [<constants=int64#3+320],>output144=float64#8
# asm 2: ldd [<constants=%i2+320],>output144=%f14
ldd [%i2+320],%f14

# qhasm: output168 = *(float64 *) (constants + 328)
# asm 1: ldd [<constants=int64#3+328],>output168=float64#9
# asm 2: ldd [<constants=%i2+328],>output168=%f16
ldd [%i2+328],%f16

# qhasm: output192 = *(float64 *) (constants + 336)
# asm 1: ldd [<constants=int64#3+336],>output192=float64#10
# asm 2: ldd [<constants=%i2+336],>output192=%f18
ldd [%i2+336],%f18

# qhasm: output208 = *(float64 *) (constants + 344)
# asm 1: ldd [<constants=int64#3+344],>output208=float64#11
# asm 2: ldd [<constants=%i2+344],>output208=%f20
ldd [%i2+344],%f20

# qhasm: output232 = *(float64 *) (constants + 352)
# asm 1: ldd [<constants=int64#3+352],>output232=float64#12
# asm 2: ldd [<constants=%i2+352],>output232=%f22
ldd [%i2+352],%f22

# qhasm: r0 = *(float64 *) (r + 0)
# asm 1: ldd [<r=int64#2+0],>r0=float64#13
# asm 2: ldd [<r=%i1+0],>r0=%f24
ldd [%i1+0],%f24

# qhasm: r22 = *(float64 *) (r + 8)
# asm 1: ldd [<r=int64#2+8],>r22=float64#14
# asm 2: ldd [<r=%i1+8],>r22=%f26
ldd [%i1+8],%f26

# qhasm: r43 = *(float64 *) (r + 16)
# asm 1: ldd [<r=int64#2+16],>r43=float64#15
# asm 2: ldd [<r=%i1+16],>r43=%f28
ldd [%i1+16],%f28

# qhasm: r64 = *(float64 *) (r + 24)
# asm 1: ldd [<r=int64#2+24],>r64=float64#16
# asm 2: ldd [<r=%i1+24],>r64=%f30
ldd [%i1+24],%f30

# qhasm: r86 = *(float64 *) (r + 32)
# asm 1: ldd [<r=int64#2+32],>r86=float64#17
# asm 2: ldd [<r=%i1+32],>r86=%f32
ldd [%i1+32],%f32

# qhasm: r107 = *(float64 *) (r + 40)
# asm 1: ldd [<r=int64#2+40],>r107=float64#18
# asm 2: ldd [<r=%i1+40],>r107=%f34
ldd [%i1+40],%f34

# qhasm: r128 = *(float64 *) (r + 48)
# asm 1: ldd [<r=int64#2+48],>r128=float64#19
# asm 2: ldd [<r=%i1+48],>r128=%f36
ldd [%i1+48],%f36

# qhasm: r150 = *(float64 *) (r + 56)
# asm 1: ldd [<r=int64#2+56],>r150=float64#20
# asm 2: ldd [<r=%i1+56],>r150=%f38
ldd [%i1+56],%f38

# qhasm: r171 = *(float64 *) (r + 64)
# asm 1: ldd [<r=int64#2+64],>r171=float64#21
# asm 2: ldd [<r=%i1+64],>r171=%f40
ldd [%i1+64],%f40

# qhasm: r192 = *(float64 *) (r + 72)
# asm 1: ldd [<r=int64#2+72],>r192=float64#22
# asm 2: ldd [<r=%i1+72],>r192=%f42
ldd [%i1+72],%f42

# qhasm: r214 = *(float64 *) (r + 80)
# asm 1: ldd [<r=int64#2+80],>r214=float64#23
# asm 2: ldd [<r=%i1+80],>r214=%f44
ldd [%i1+80],%f44

# qhasm: r235 = *(float64 *) (r + 88)
# asm 1: ldd [<r=int64#2+88],>r235=float64#24
# asm 2: ldd [<r=%i1+88],>r235=%f46
ldd [%i1+88],%f46

# qhasm: output0 += r0
# asm 1: faddd <output0=float64#1,<r0=float64#13,>output0=float64#1
# asm 2: faddd <output0=%f0,<r0=%f24,>output0=%f0
faddd %f0,%f24,%f0

# qhasm: output16 += r22
# asm 1: faddd <output16=float64#2,<r22=float64#14,>output16=float64#2
# asm 2: faddd <output16=%f2,<r22=%f26,>output16=%f2
faddd %f2,%f26,%f2

# qhasm: output40 += r43
# asm 1: faddd <output40=float64#3,<r43=float64#15,>output40=float64#3
# asm 2: faddd <output40=%f4,<r43=%f28,>output40=%f4
faddd %f4,%f28,%f4

# qhasm: output64 += r64
# asm 1: faddd <output64=float64#4,<r64=float64#16,>output64=float64#4
# asm 2: faddd <output64=%f6,<r64=%f30,>output64=%f6
faddd %f6,%f30,%f6

# qhasm: output80 += r86
# asm 1: faddd <output80=float64#5,<r86=float64#17,>output80=float64#5
# asm 2: faddd <output80=%f8,<r86=%f32,>output80=%f8
faddd %f8,%f32,%f8

# qhasm: output104 += r107
# asm 1: faddd <output104=float64#6,<r107=float64#18,>output104=float64#6
# asm 2: faddd <output104=%f10,<r107=%f34,>output104=%f10
faddd %f10,%f34,%f10

# qhasm: output128 += r128
# asm 1: faddd <output128=float64#7,<r128=float64#19,>output128=float64#7
# asm 2: faddd <output128=%f12,<r128=%f36,>output128=%f12
faddd %f12,%f36,%f12

# qhasm: output144 += r150
# asm 1: faddd <output144=float64#8,<r150=float64#20,>output144=float64#8
# asm 2: faddd <output144=%f14,<r150=%f38,>output144=%f14
faddd %f14,%f38,%f14

# qhasm: output168 += r171
# asm 1: faddd <output168=float64#9,<r171=float64#21,>output168=float64#9
# asm 2: faddd <output168=%f16,<r171=%f40,>output168=%f16
faddd %f16,%f40,%f16

# qhasm: output192 += r192
# asm 1: faddd <output192=float64#10,<r192=float64#22,>output192=float64#10
# asm 2: faddd <output192=%f18,<r192=%f42,>output192=%f18
faddd %f18,%f42,%f18

# qhasm: output208 += r214
# asm 1: faddd <output208=float64#11,<r214=float64#23,>output208=float64#11
# asm 2: faddd <output208=%f20,<r214=%f44,>output208=%f20
faddd %f20,%f44,%f20

# qhasm: output232 += r235
# asm 1: faddd <output232=float64#12,<r235=float64#24,>output232=float64#12
# asm 2: faddd <output232=%f22,<r235=%f46,>output232=%f22
faddd %f22,%f46,%f22

# qhasm: w0 = output0
# asm 1: std <output0=float64#1,[%fp+2023->w0=stack64#1]
# asm 2: std <output0=%f0,[%fp+2023->w0=0]
std %f0,[%fp+2023-0]

# qhasm: w16 = output16
# asm 1: std <output16=float64#2,[%fp+2023->w16=stack64#2]
# asm 2: std <output16=%f2,[%fp+2023->w16=8]
std %f2,[%fp+2023-8]

# qhasm: w40 = output40
# asm 1: std <output40=float64#3,[%fp+2023->w40=stack64#3]
# asm 2: std <output40=%f4,[%fp+2023->w40=16]
std %f4,[%fp+2023-16]

# qhasm: w64 = output64
# asm 1: std <output64=float64#4,[%fp+2023->w64=stack64#4]
# asm 2: std <output64=%f6,[%fp+2023->w64=24]
std %f6,[%fp+2023-24]

# qhasm: w80 = output80
# asm 1: std <output80=float64#5,[%fp+2023->w80=stack64#5]
# asm 2: std <output80=%f8,[%fp+2023->w80=32]
std %f8,[%fp+2023-32]

# qhasm: w104 = output104
# asm 1: std <output104=float64#6,[%fp+2023->w104=stack64#6]
# asm 2: std <output104=%f10,[%fp+2023->w104=40]
std %f10,[%fp+2023-40]

# qhasm: w128 = output128
# asm 1: std <output128=float64#7,[%fp+2023->w128=stack64#7]
# asm 2: std <output128=%f12,[%fp+2023->w128=48]
std %f12,[%fp+2023-48]

# qhasm: w144 = output144
# asm 1: std <output144=float64#8,[%fp+2023->w144=stack64#8]
# asm 2: std <output144=%f14,[%fp+2023->w144=56]
std %f14,[%fp+2023-56]

# qhasm: w168 = output168
# asm 1: std <output168=float64#9,[%fp+2023->w168=stack64#9]
# asm 2: std <output168=%f16,[%fp+2023->w168=64]
std %f16,[%fp+2023-64]

# qhasm: w192 = output192
# asm 1: std <output192=float64#10,[%fp+2023->w192=stack64#10]
# asm 2: std <output192=%f18,[%fp+2023->w192=72]
std %f18,[%fp+2023-72]

# qhasm: w208 = output208
# asm 1: std <output208=float64#11,[%fp+2023->w208=stack64#11]
# asm 2: std <output208=%f20,[%fp+2023->w208=80]
std %f20,[%fp+2023-80]

# qhasm: w232 = output232
# asm 1: std <output232=float64#12,[%fp+2023->w232=stack64#12]
# asm 2: std <output232=%f22,[%fp+2023->w232=88]
std %f22,[%fp+2023-88]

# qhasm: s0 = bottom32 w0
# asm 1: ld [%fp+2027-<w0=stack64#1],>s0=int64#2
# asm 2: ld [%fp+2027-<w0=0],>s0=%i1
ld [%fp+2027-0],%i1

# qhasm: s16 = bottom32 w16
# asm 1: ld [%fp+2027-<w16=stack64#2],>s16=int64#3
# asm 2: ld [%fp+2027-<w16=8],>s16=%i2
ld [%fp+2027-8],%i2

# qhasm: s40 = bottom32 w40
# asm 1: ld [%fp+2027-<w40=stack64#3],>s40=int64#4
# asm 2: ld [%fp+2027-<w40=16],>s40=%i3
ld [%fp+2027-16],%i3

# qhasm: s64 = bottom32 w64
# asm 1: ld [%fp+2027-<w64=stack64#4],>s64=int64#5
# asm 2: ld [%fp+2027-<w64=24],>s64=%i4
ld [%fp+2027-24],%i4

# qhasm: s80 = bottom32 w80
# asm 1: ld [%fp+2027-<w80=stack64#5],>s80=int64#6
# asm 2: ld [%fp+2027-<w80=32],>s80=%i5
ld [%fp+2027-32],%i5

# qhasm: s104 = bottom32 w104
# asm 1: ld [%fp+2027-<w104=stack64#6],>s104=int64#7
# asm 2: ld [%fp+2027-<w104=40],>s104=%g1
ld [%fp+2027-40],%g1

# qhasm: s128 = bottom32 w128
# asm 1: ld [%fp+2027-<w128=stack64#7],>s128=int64#8
# asm 2: ld [%fp+2027-<w128=48],>s128=%g4
ld [%fp+2027-48],%g4

# qhasm: s144 = bottom32 w144
# asm 1: ld [%fp+2027-<w144=stack64#8],>s144=int64#9
# asm 2: ld [%fp+2027-<w144=56],>s144=%g5
ld [%fp+2027-56],%g5

# qhasm: s168 = bottom32 w168
# asm 1: ld [%fp+2027-<w168=stack64#9],>s168=int64#10
# asm 2: ld [%fp+2027-<w168=64],>s168=%o0
ld [%fp+2027-64],%o0

# qhasm: s192 = bottom32 w192
# asm 1: ld [%fp+2027-<w192=stack64#10],>s192=int64#11
# asm 2: ld [%fp+2027-<w192=72],>s192=%o1
ld [%fp+2027-72],%o1

# qhasm: s208 = bottom32 w208
# asm 1: ld [%fp+2027-<w208=stack64#11],>s208=int64#12
# asm 2: ld [%fp+2027-<w208=80],>s208=%o2
ld [%fp+2027-80],%o2

# qhasm: s232 = bottom32 w232
# asm 1: ld [%fp+2027-<w232=stack64#12],>s232=int64#13
# asm 2: ld [%fp+2027-<w232=88],>s232=%o3
ld [%fp+2027-88],%o3

# qhasm: 32bits = 0xffffffff & 0xfffffc00
# asm 1: sethi %lm(0xffffffff),>32bits=int64#14
# asm 2: sethi %lm(0xffffffff),>32bits=%o4
sethi %lm(0xffffffff),%o4

# qhasm: 32bits |= 0xffffffff & 0x3ff
# asm 1: or <32bits=int64#14,%lo(0xffffffff),>32bits=int64#14
# asm 2: or <32bits=%o4,%lo(0xffffffff),>32bits=%o4
or %o4,%lo(0xffffffff),%o4

# qhasm: s16 <<= 16
# asm 1: sllx <s16=int64#3,16,>s16=int64#3
# asm 2: sllx <s16=%i2,16,>s16=%i2
sllx %i2,16,%i2

# qhasm: accum = s0 + s16
# asm 1: add <s0=int64#2,<s16=int64#3,>accum=int64#2
# asm 2: add <s0=%i1,<s16=%i2,>accum=%i1
add %i1,%i2,%i1

# qhasm: t0 = accum & 32bits
# asm 1: and <accum=int64#2,<32bits=int64#14,>t0=int64#3
# asm 2: and <accum=%i1,<32bits=%o4,>t0=%i2
and %i1,%o4,%i2

# qhasm: (uint64) accum >>= 32
# asm 1: srlx <accum=int64#2,32,>accum=int64#2
# asm 2: srlx <accum=%i1,32,>accum=%i1
srlx %i1,32,%i1

# qhasm: s40 <<= 8
# asm 1: sllx <s40=int64#4,8,>s40=int64#4
# asm 2: sllx <s40=%i3,8,>s40=%i3
sllx %i3,8,%i3

# qhasm: accum += s40
# asm 1: add <accum=int64#2,<s40=int64#4,>accum=int64#2
# asm 2: add <accum=%i1,<s40=%i3,>accum=%i1
add %i1,%i3,%i1

# qhasm: t32 = accum & 32bits
# asm 1: and <accum=int64#2,<32bits=int64#14,>t32=int64#4
# asm 2: and <accum=%i1,<32bits=%o4,>t32=%i3
and %i1,%o4,%i3

# qhasm: (uint64) accum >>= 32
# asm 1: srlx <accum=int64#2,32,>accum=int64#2
# asm 2: srlx <accum=%i1,32,>accum=%i1
srlx %i1,32,%i1

# qhasm: accum += s64
# asm 1: add <accum=int64#2,<s64=int64#5,>accum=int64#2
# asm 2: add <accum=%i1,<s64=%i4,>accum=%i1
add %i1,%i4,%i1

# qhasm: s80 <<= 16
# asm 1: sllx <s80=int64#6,16,>s80=int64#5
# asm 2: sllx <s80=%i5,16,>s80=%i4
sllx %i5,16,%i4

# qhasm: accum += s80
# asm 1: add <accum=int64#2,<s80=int64#5,>accum=int64#2
# asm 2: add <accum=%i1,<s80=%i4,>accum=%i1
add %i1,%i4,%i1

# qhasm: t64 = accum & 32bits
# asm 1: and <accum=int64#2,<32bits=int64#14,>t64=int64#5
# asm 2: and <accum=%i1,<32bits=%o4,>t64=%i4
and %i1,%o4,%i4

# qhasm: (uint64) accum >>= 32
# asm 1: srlx <accum=int64#2,32,>accum=int64#2
# asm 2: srlx <accum=%i1,32,>accum=%i1
srlx %i1,32,%i1

# qhasm: s104 <<= 8
# asm 1: sllx <s104=int64#7,8,>s104=int64#6
# asm 2: sllx <s104=%g1,8,>s104=%i5
sllx %g1,8,%i5

# qhasm: accum += s104
# asm 1: add <accum=int64#2,<s104=int64#6,>accum=int64#2
# asm 2: add <accum=%i1,<s104=%i5,>accum=%i1
add %i1,%i5,%i1

# qhasm: t96 = accum & 32bits
# asm 1: and <accum=int64#2,<32bits=int64#14,>t96=int64#6
# asm 2: and <accum=%i1,<32bits=%o4,>t96=%i5
and %i1,%o4,%i5

# qhasm: (uint64) accum >>= 32
# asm 1: srlx <accum=int64#2,32,>accum=int64#2
# asm 2: srlx <accum=%i1,32,>accum=%i1
srlx %i1,32,%i1

# qhasm: accum += s128
# asm 1: add <accum=int64#2,<s128=int64#8,>accum=int64#2
# asm 2: add <accum=%i1,<s128=%g4,>accum=%i1
add %i1,%g4,%i1

# qhasm: s144 <<= 16
# asm 1: sllx <s144=int64#9,16,>s144=int64#7
# asm 2: sllx <s144=%g5,16,>s144=%g1
sllx %g5,16,%g1

# qhasm: accum += s144
# asm 1: add <accum=int64#2,<s144=int64#7,>accum=int64#2
# asm 2: add <accum=%i1,<s144=%g1,>accum=%i1
add %i1,%g1,%i1

# qhasm: t128 = accum & 32bits
# asm 1: and <accum=int64#2,<32bits=int64#14,>t128=int64#7
# asm 2: and <accum=%i1,<32bits=%o4,>t128=%g1
and %i1,%o4,%g1

# qhasm: (uint64) accum >>= 32
# asm 1: srlx <accum=int64#2,32,>accum=int64#2
# asm 2: srlx <accum=%i1,32,>accum=%i1
srlx %i1,32,%i1

# qhasm: s168 <<= 8
# asm 1: sllx <s168=int64#10,8,>s168=int64#8
# asm 2: sllx <s168=%o0,8,>s168=%g4
sllx %o0,8,%g4

# qhasm: accum += s168
# asm 1: add <accum=int64#2,<s168=int64#8,>accum=int64#2
# asm 2: add <accum=%i1,<s168=%g4,>accum=%i1
add %i1,%g4,%i1

# qhasm: t160 = accum & 32bits
# asm 1: and <accum=int64#2,<32bits=int64#14,>t160=int64#8
# asm 2: and <accum=%i1,<32bits=%o4,>t160=%g4
and %i1,%o4,%g4

# qhasm: (uint64) accum >>= 32
# asm 1: srlx <accum=int64#2,32,>accum=int64#2
# asm 2: srlx <accum=%i1,32,>accum=%i1
srlx %i1,32,%i1

# qhasm: accum += s192
# asm 1: add <accum=int64#2,<s192=int64#11,>accum=int64#2
# asm 2: add <accum=%i1,<s192=%o1,>accum=%i1
add %i1,%o1,%i1

# qhasm: s208 <<= 16
# asm 1: sllx <s208=int64#12,16,>s208=int64#9
# asm 2: sllx <s208=%o2,16,>s208=%g5
sllx %o2,16,%g5

# qhasm: accum += s208
# asm 1: add <accum=int64#2,<s208=int64#9,>accum=int64#2
# asm 2: add <accum=%i1,<s208=%g5,>accum=%i1
add %i1,%g5,%i1

# qhasm: t192 = accum & 32bits
# asm 1: and <accum=int64#2,<32bits=int64#14,>t192=int64#9
# asm 2: and <accum=%i1,<32bits=%o4,>t192=%g5
and %i1,%o4,%g5

# qhasm: (uint64) accum >>= 32
# asm 1: srlx <accum=int64#2,32,>accum=int64#2
# asm 2: srlx <accum=%i1,32,>accum=%i1
srlx %i1,32,%i1

# qhasm: uc = 0x00000000
# asm 1: add %g0,0x00000000,>uc=int64#10
# asm 2: add %g0,0x00000000,>uc=%o0
add %g0,0x00000000,%o0

# qhasm: uc1 = 0x00000000
# asm 1: add %g0,0x00000000,>uc1=int64#11
# asm 2: add %g0,0x00000000,>uc1=%o1
add %g0,0x00000000,%o1

# qhasm: s232 <<= 8
# asm 1: sllx <s232=int64#13,8,>s232=int64#12
# asm 2: sllx <s232=%o3,8,>s232=%o2
sllx %o3,8,%o2

# qhasm: t224 = accum + s232
# asm 1: add <accum=int64#2,<s232=int64#12,>t224=int64#2
# asm 2: add <accum=%i1,<s232=%o2,>t224=%i1
add %i1,%o2,%i1

# qhasm:  uc = t224
# asm 1: add %g0,<t224=int64#2,>uc=int64#12
# asm 2: add %g0,<t224=%i1,>uc=%o2
add %g0,%i1,%o2

# qhasm: (uint64) uc>>=32
# asm 1: srlx <uc=int64#12,32,>uc=int64#12
# asm 2: srlx <uc=%o2,32,>uc=%o2
srlx %o2,32,%o2

# qhasm: 32bits = 0xffffffff & 0xfffffc00
# asm 1: sethi %lm(0xffffffff),>32bits=int64#13
# asm 2: sethi %lm(0xffffffff),>32bits=%o3
sethi %lm(0xffffffff),%o3

# qhasm: 32bits |= 0xffffffff & 0x3ff
# asm 1: or <32bits=int64#13,%lo(0xffffffff),>32bits=int64#13
# asm 2: or <32bits=%o3,%lo(0xffffffff),>32bits=%o3
or %o3,%lo(0xffffffff),%o3

# qhasm: carry32? u0 = t0 + 1
# asm 1: addcc <t0=int64#3,1,>u0=int64#14
# asm 2: addcc <t0=%i2,1,>u0=%o4
addcc %i2,1,%o4

# qhasm: carry32? u32 = t32 + 0 + carry32
# asm 1: addccc <t32=int64#4,0,>u32=int64#15
# asm 2: addccc <t32=%i3,0,>u32=%o5
addccc %i3,0,%o5

# qhasm: carry32? u64 = t64 + 0 + carry32
# asm 1: addccc <t64=int64#5,0,>u64=int64#16
# asm 2: addccc <t64=%i4,0,>u64=%o7
addccc %i4,0,%o7

# qhasm: carry32? u96 = t96 + 32bits + carry32
# asm 1: addccc <t96=int64#6,<32bits=int64#13,>u96=int64#17
# asm 2: addccc <t96=%i5,<32bits=%o3,>u96=%l0
addccc %i5,%o3,%l0

# qhasm: carry32? u128 = t128 + 32bits + carry32
# asm 1: addccc <t128=int64#7,<32bits=int64#13,>u128=int64#18
# asm 2: addccc <t128=%g1,<32bits=%o3,>u128=%l1
addccc %g1,%o3,%l1

# qhasm: carry32? u160 = t160 + 32bits + carry32
# asm 1: addccc <t160=int64#8,<32bits=int64#13,>u160=int64#19
# asm 2: addccc <t160=%g4,<32bits=%o3,>u160=%l2
addccc %g4,%o3,%l2

# qhasm: 32bits -=1
# asm 1: sub <32bits=int64#13,1,>32bits=int64#13
# asm 2: sub <32bits=%o3,1,>32bits=%o3
sub %o3,1,%o3

# qhasm: carry32? u192 = t192 + 32bits + carry32
# asm 1: addccc <t192=int64#9,<32bits=int64#13,>u192=int64#13
# asm 2: addccc <t192=%g5,<32bits=%o3,>u192=%o3
addccc %g5,%o3,%o3

# qhasm: carry32? u224 = t224 + 0 + carry32
# asm 1: addccc <t224=int64#2,0,>u224=int64#20
# asm 2: addccc <t224=%i1,0,>u224=%l3
addccc %i1,0,%l3

# qhasm: uc1 = u224
# asm 1: add %g0,<u224=int64#20,>uc1=int64#21
# asm 2: add %g0,<u224=%l3,>uc1=%l4
add %g0,%l3,%l4

# qhasm: (uint64) uc1>>=32
# asm 1: srlx <uc1=int64#21,32,>uc1=int64#21
# asm 2: srlx <uc1=%l4,32,>uc1=%l4
srlx %l4,32,%l4

# qhasm: uc |= uc1
# asm 1: or  <uc=int64#12,<uc1=int64#21,>uc=int64#12
# asm 2: or  <uc=%o2,<uc1=%l4,>uc=%o2
or  %o2,%l4,%o2

# qhasm: wantt = uc
# asm 1: add %g0,<uc=int64#12,>wantt=int64#12
# asm 2: add %g0,<uc=%o2,>wantt=%o2
add %g0,%o2,%o2

# qhasm: wantt -= 1
# asm 1: sub <wantt=int64#12,1,>wantt=int64#12
# asm 2: sub <wantt=%o2,1,>wantt=%o2
sub %o2,1,%o2

# qhasm: wantu = ~wantt
# asm 1: not  <wantt=int64#12,>wantu=int64#21
# asm 2: not  <wantt=%o2,>wantu=%l4
not  %o2,%l4

# qhasm: t0 &= wantt
# asm 1: and <t0=int64#3,<wantt=int64#12,>t0=int64#3
# asm 2: and <t0=%i2,<wantt=%o2,>t0=%i2
and %i2,%o2,%i2

# qhasm: t32 &= wantt
# asm 1: and <t32=int64#4,<wantt=int64#12,>t32=int64#4
# asm 2: and <t32=%i3,<wantt=%o2,>t32=%i3
and %i3,%o2,%i3

# qhasm: t64 &= wantt
# asm 1: and <t64=int64#5,<wantt=int64#12,>t64=int64#5
# asm 2: and <t64=%i4,<wantt=%o2,>t64=%i4
and %i4,%o2,%i4

# qhasm: t96 &= wantt
# asm 1: and <t96=int64#6,<wantt=int64#12,>t96=int64#6
# asm 2: and <t96=%i5,<wantt=%o2,>t96=%i5
and %i5,%o2,%i5

# qhasm: t128 &= wantt
# asm 1: and <t128=int64#7,<wantt=int64#12,>t128=int64#7
# asm 2: and <t128=%g1,<wantt=%o2,>t128=%g1
and %g1,%o2,%g1

# qhasm: t160 &= wantt
# asm 1: and <t160=int64#8,<wantt=int64#12,>t160=int64#8
# asm 2: and <t160=%g4,<wantt=%o2,>t160=%g4
and %g4,%o2,%g4

# qhasm: t192 &= wantt
# asm 1: and <t192=int64#9,<wantt=int64#12,>t192=int64#9
# asm 2: and <t192=%g5,<wantt=%o2,>t192=%g5
and %g5,%o2,%g5

# qhasm: t224 &= wantt
# asm 1: and <t224=int64#2,<wantt=int64#12,>t224=int64#2
# asm 2: and <t224=%i1,<wantt=%o2,>t224=%i1
and %i1,%o2,%i1

# qhasm: u0 &= wantu
# asm 1: and <u0=int64#14,<wantu=int64#21,>u0=int64#12
# asm 2: and <u0=%o4,<wantu=%l4,>u0=%o2
and %o4,%l4,%o2

# qhasm: u32 &= wantu
# asm 1: and <u32=int64#15,<wantu=int64#21,>u32=int64#14
# asm 2: and <u32=%o5,<wantu=%l4,>u32=%o4
and %o5,%l4,%o4

# qhasm: u64 &= wantu
# asm 1: and <u64=int64#16,<wantu=int64#21,>u64=int64#15
# asm 2: and <u64=%o7,<wantu=%l4,>u64=%o5
and %o7,%l4,%o5

# qhasm: u96 &= wantu
# asm 1: and <u96=int64#17,<wantu=int64#21,>u96=int64#16
# asm 2: and <u96=%l0,<wantu=%l4,>u96=%o7
and %l0,%l4,%o7

# qhasm: u128 &= wantu
# asm 1: and <u128=int64#18,<wantu=int64#21,>u128=int64#17
# asm 2: and <u128=%l1,<wantu=%l4,>u128=%l0
and %l1,%l4,%l0

# qhasm: u160 &= wantu
# asm 1: and <u160=int64#19,<wantu=int64#21,>u160=int64#18
# asm 2: and <u160=%l2,<wantu=%l4,>u160=%l1
and %l2,%l4,%l1

# qhasm: u192 &= wantu
# asm 1: and <u192=int64#13,<wantu=int64#21,>u192=int64#13
# asm 2: and <u192=%o3,<wantu=%l4,>u192=%o3
and %o3,%l4,%o3

# qhasm: u224 &= wantu
# asm 1: and <u224=int64#20,<wantu=int64#21,>u224=int64#19
# asm 2: and <u224=%l3,<wantu=%l4,>u224=%l2
and %l3,%l4,%l2

# qhasm: t0 ^= u0
# asm 1: xor <t0=int64#3,<u0=int64#12,>t0=int64#3
# asm 2: xor <t0=%i2,<u0=%o2,>t0=%i2
xor %i2,%o2,%i2

# qhasm: t32 ^= u32
# asm 1: xor <t32=int64#4,<u32=int64#14,>t32=int64#4
# asm 2: xor <t32=%i3,<u32=%o4,>t32=%i3
xor %i3,%o4,%i3

# qhasm: t64 ^= u64
# asm 1: xor <t64=int64#5,<u64=int64#15,>t64=int64#5
# asm 2: xor <t64=%i4,<u64=%o5,>t64=%i4
xor %i4,%o5,%i4

# qhasm: t96 ^= u96
# asm 1: xor <t96=int64#6,<u96=int64#16,>t96=int64#6
# asm 2: xor <t96=%i5,<u96=%o7,>t96=%i5
xor %i5,%o7,%i5

# qhasm: t128 ^= u128
# asm 1: xor <t128=int64#7,<u128=int64#17,>t128=int64#7
# asm 2: xor <t128=%g1,<u128=%l0,>t128=%g1
xor %g1,%l0,%g1

# qhasm: t160 ^= u160
# asm 1: xor <t160=int64#8,<u160=int64#18,>t160=int64#8
# asm 2: xor <t160=%g4,<u160=%l1,>t160=%g4
xor %g4,%l1,%g4

# qhasm: t192 ^= u192
# asm 1: xor <t192=int64#9,<u192=int64#13,>t192=int64#9
# asm 2: xor <t192=%g5,<u192=%o3,>t192=%g5
xor %g5,%o3,%g5

# qhasm: t224 ^= u224
# asm 1: xor <t224=int64#2,<u224=int64#19,>t224=int64#2
# asm 2: xor <t224=%i1,<u224=%l2,>t224=%i1
xor %i1,%l2,%i1

# qhasm: *(uint8 *) (out + 0) = t0
# asm 1: stb <t0=int64#3,[<out=int64#1+0]
# asm 2: stb <t0=%i2,[<out=%i0+0]
stb %i2,[%i0+0]

# qhasm: *(uint8 *) (out + 4) = t32
# asm 1: stb <t32=int64#4,[<out=int64#1+4]
# asm 2: stb <t32=%i3,[<out=%i0+4]
stb %i3,[%i0+4]

# qhasm: *(uint8 *) (out + 8) = t64
# asm 1: stb <t64=int64#5,[<out=int64#1+8]
# asm 2: stb <t64=%i4,[<out=%i0+8]
stb %i4,[%i0+8]

# qhasm: *(uint8 *) (out + 12) = t96
# asm 1: stb <t96=int64#6,[<out=int64#1+12]
# asm 2: stb <t96=%i5,[<out=%i0+12]
stb %i5,[%i0+12]

# qhasm: *(uint8 *) (out + 16) = t128
# asm 1: stb <t128=int64#7,[<out=int64#1+16]
# asm 2: stb <t128=%g1,[<out=%i0+16]
stb %g1,[%i0+16]

# qhasm: *(uint8 *) (out + 20) = t160
# asm 1: stb <t160=int64#8,[<out=int64#1+20]
# asm 2: stb <t160=%g4,[<out=%i0+20]
stb %g4,[%i0+20]

# qhasm: *(uint8 *) (out + 24) = t192
# asm 1: stb <t192=int64#9,[<out=int64#1+24]
# asm 2: stb <t192=%g5,[<out=%i0+24]
stb %g5,[%i0+24]

# qhasm: *(uint8 *) (out + 28) = t224
# asm 1: stb <t224=int64#2,[<out=int64#1+28]
# asm 2: stb <t224=%i1,[<out=%i0+28]
stb %i1,[%i0+28]

# qhasm: out += 1
# asm 1: add <out=int64#1,1,>out=int64#1
# asm 2: add <out=%i0,1,>out=%i0
add %i0,1,%i0

# qhasm: (uint64) t0 >>= 8
# asm 1: srlx <t0=int64#3,8,>t0=int64#3
# asm 2: srlx <t0=%i2,8,>t0=%i2
srlx %i2,8,%i2

# qhasm: (uint64) t32 >>= 8
# asm 1: srlx <t32=int64#4,8,>t32=int64#4
# asm 2: srlx <t32=%i3,8,>t32=%i3
srlx %i3,8,%i3

# qhasm: (uint64) t64 >>= 8
# asm 1: srlx <t64=int64#5,8,>t64=int64#5
# asm 2: srlx <t64=%i4,8,>t64=%i4
srlx %i4,8,%i4

# qhasm: (uint64) t96 >>= 8
# asm 1: srlx <t96=int64#6,8,>t96=int64#6
# asm 2: srlx <t96=%i5,8,>t96=%i5
srlx %i5,8,%i5

# qhasm: (uint64) t128 >>= 8
# asm 1: srlx <t128=int64#7,8,>t128=int64#7
# asm 2: srlx <t128=%g1,8,>t128=%g1
srlx %g1,8,%g1

# qhasm: (uint64) t160 >>= 8
# asm 1: srlx <t160=int64#8,8,>t160=int64#8
# asm 2: srlx <t160=%g4,8,>t160=%g4
srlx %g4,8,%g4

# qhasm: (uint64) t192 >>= 8
# asm 1: srlx <t192=int64#9,8,>t192=int64#9
# asm 2: srlx <t192=%g5,8,>t192=%g5
srlx %g5,8,%g5

# qhasm: (uint64) t224 >>= 8
# asm 1: srlx <t224=int64#2,8,>t224=int64#2
# asm 2: srlx <t224=%i1,8,>t224=%i1
srlx %i1,8,%i1

# qhasm: *(uint8 *) (out + 0) = t0
# asm 1: stb <t0=int64#3,[<out=int64#1+0]
# asm 2: stb <t0=%i2,[<out=%i0+0]
stb %i2,[%i0+0]

# qhasm: *(uint8 *) (out + 4) = t32
# asm 1: stb <t32=int64#4,[<out=int64#1+4]
# asm 2: stb <t32=%i3,[<out=%i0+4]
stb %i3,[%i0+4]

# qhasm: *(uint8 *) (out + 8) = t64
# asm 1: stb <t64=int64#5,[<out=int64#1+8]
# asm 2: stb <t64=%i4,[<out=%i0+8]
stb %i4,[%i0+8]

# qhasm: *(uint8 *) (out + 12) = t96
# asm 1: stb <t96=int64#6,[<out=int64#1+12]
# asm 2: stb <t96=%i5,[<out=%i0+12]
stb %i5,[%i0+12]

# qhasm: *(uint8 *) (out + 16) = t128
# asm 1: stb <t128=int64#7,[<out=int64#1+16]
# asm 2: stb <t128=%g1,[<out=%i0+16]
stb %g1,[%i0+16]

# qhasm: *(uint8 *) (out + 20) = t160
# asm 1: stb <t160=int64#8,[<out=int64#1+20]
# asm 2: stb <t160=%g4,[<out=%i0+20]
stb %g4,[%i0+20]

# qhasm: *(uint8 *) (out + 24) = t192
# asm 1: stb <t192=int64#9,[<out=int64#1+24]
# asm 2: stb <t192=%g5,[<out=%i0+24]
stb %g5,[%i0+24]

# qhasm: *(uint8 *) (out + 28) = t224
# asm 1: stb <t224=int64#2,[<out=int64#1+28]
# asm 2: stb <t224=%i1,[<out=%i0+28]
stb %i1,[%i0+28]

# qhasm: out += 1
# asm 1: add <out=int64#1,1,>out=int64#1
# asm 2: add <out=%i0,1,>out=%i0
add %i0,1,%i0

# qhasm: (uint64) t0 >>= 8
# asm 1: srlx <t0=int64#3,8,>t0=int64#3
# asm 2: srlx <t0=%i2,8,>t0=%i2
srlx %i2,8,%i2

# qhasm: (uint64) t32 >>= 8
# asm 1: srlx <t32=int64#4,8,>t32=int64#4
# asm 2: srlx <t32=%i3,8,>t32=%i3
srlx %i3,8,%i3

# qhasm: (uint64) t64 >>= 8
# asm 1: srlx <t64=int64#5,8,>t64=int64#5
# asm 2: srlx <t64=%i4,8,>t64=%i4
srlx %i4,8,%i4

# qhasm: (uint64) t96 >>= 8
# asm 1: srlx <t96=int64#6,8,>t96=int64#6
# asm 2: srlx <t96=%i5,8,>t96=%i5
srlx %i5,8,%i5

# qhasm: (uint64) t128 >>= 8
# asm 1: srlx <t128=int64#7,8,>t128=int64#7
# asm 2: srlx <t128=%g1,8,>t128=%g1
srlx %g1,8,%g1

# qhasm: (uint64) t160 >>= 8
# asm 1: srlx <t160=int64#8,8,>t160=int64#8
# asm 2: srlx <t160=%g4,8,>t160=%g4
srlx %g4,8,%g4

# qhasm: (uint64) t192 >>= 8
# asm 1: srlx <t192=int64#9,8,>t192=int64#9
# asm 2: srlx <t192=%g5,8,>t192=%g5
srlx %g5,8,%g5

# qhasm: (uint64) t224 >>= 8
# asm 1: srlx <t224=int64#2,8,>t224=int64#2
# asm 2: srlx <t224=%i1,8,>t224=%i1
srlx %i1,8,%i1

# qhasm: *(uint8 *) (out + 0) = t0
# asm 1: stb <t0=int64#3,[<out=int64#1+0]
# asm 2: stb <t0=%i2,[<out=%i0+0]
stb %i2,[%i0+0]

# qhasm: *(uint8 *) (out + 4) = t32
# asm 1: stb <t32=int64#4,[<out=int64#1+4]
# asm 2: stb <t32=%i3,[<out=%i0+4]
stb %i3,[%i0+4]

# qhasm: *(uint8 *) (out + 8) = t64
# asm 1: stb <t64=int64#5,[<out=int64#1+8]
# asm 2: stb <t64=%i4,[<out=%i0+8]
stb %i4,[%i0+8]

# qhasm: *(uint8 *) (out + 12) = t96
# asm 1: stb <t96=int64#6,[<out=int64#1+12]
# asm 2: stb <t96=%i5,[<out=%i0+12]
stb %i5,[%i0+12]

# qhasm: *(uint8 *) (out + 16) = t128
# asm 1: stb <t128=int64#7,[<out=int64#1+16]
# asm 2: stb <t128=%g1,[<out=%i0+16]
stb %g1,[%i0+16]

# qhasm: *(uint8 *) (out + 20) = t160
# asm 1: stb <t160=int64#8,[<out=int64#1+20]
# asm 2: stb <t160=%g4,[<out=%i0+20]
stb %g4,[%i0+20]

# qhasm: *(uint8 *) (out + 24) = t192
# asm 1: stb <t192=int64#9,[<out=int64#1+24]
# asm 2: stb <t192=%g5,[<out=%i0+24]
stb %g5,[%i0+24]

# qhasm: *(uint8 *) (out + 28) = t224
# asm 1: stb <t224=int64#2,[<out=int64#1+28]
# asm 2: stb <t224=%i1,[<out=%i0+28]
stb %i1,[%i0+28]

# qhasm: out += 1
# asm 1: add <out=int64#1,1,>out=int64#1
# asm 2: add <out=%i0,1,>out=%i0
add %i0,1,%i0

# qhasm: (uint64) t0 >>= 8
# asm 1: srlx <t0=int64#3,8,>t0=int64#3
# asm 2: srlx <t0=%i2,8,>t0=%i2
srlx %i2,8,%i2

# qhasm: (uint64) t32 >>= 8
# asm 1: srlx <t32=int64#4,8,>t32=int64#4
# asm 2: srlx <t32=%i3,8,>t32=%i3
srlx %i3,8,%i3

# qhasm: (uint64) t64 >>= 8
# asm 1: srlx <t64=int64#5,8,>t64=int64#5
# asm 2: srlx <t64=%i4,8,>t64=%i4
srlx %i4,8,%i4

# qhasm: (uint64) t96 >>= 8
# asm 1: srlx <t96=int64#6,8,>t96=int64#6
# asm 2: srlx <t96=%i5,8,>t96=%i5
srlx %i5,8,%i5

# qhasm: (uint64) t128 >>= 8
# asm 1: srlx <t128=int64#7,8,>t128=int64#7
# asm 2: srlx <t128=%g1,8,>t128=%g1
srlx %g1,8,%g1

# qhasm: (uint64) t160 >>= 8
# asm 1: srlx <t160=int64#8,8,>t160=int64#8
# asm 2: srlx <t160=%g4,8,>t160=%g4
srlx %g4,8,%g4

# qhasm: (uint64) t192 >>= 8
# asm 1: srlx <t192=int64#9,8,>t192=int64#9
# asm 2: srlx <t192=%g5,8,>t192=%g5
srlx %g5,8,%g5

# qhasm: (uint64) t224 >>= 8
# asm 1: srlx <t224=int64#2,8,>t224=int64#2
# asm 2: srlx <t224=%i1,8,>t224=%i1
srlx %i1,8,%i1

# qhasm: *(uint8 *) (out + 0) = t0
# asm 1: stb <t0=int64#3,[<out=int64#1+0]
# asm 2: stb <t0=%i2,[<out=%i0+0]
stb %i2,[%i0+0]

# qhasm: *(uint8 *) (out + 4) = t32
# asm 1: stb <t32=int64#4,[<out=int64#1+4]
# asm 2: stb <t32=%i3,[<out=%i0+4]
stb %i3,[%i0+4]

# qhasm: *(uint8 *) (out + 8) = t64
# asm 1: stb <t64=int64#5,[<out=int64#1+8]
# asm 2: stb <t64=%i4,[<out=%i0+8]
stb %i4,[%i0+8]

# qhasm: *(uint8 *) (out + 12) = t96
# asm 1: stb <t96=int64#6,[<out=int64#1+12]
# asm 2: stb <t96=%i5,[<out=%i0+12]
stb %i5,[%i0+12]

# qhasm: *(uint8 *) (out + 16) = t128
# asm 1: stb <t128=int64#7,[<out=int64#1+16]
# asm 2: stb <t128=%g1,[<out=%i0+16]
stb %g1,[%i0+16]

# qhasm: *(uint8 *) (out + 20) = t160
# asm 1: stb <t160=int64#8,[<out=int64#1+20]
# asm 2: stb <t160=%g4,[<out=%i0+20]
stb %g4,[%i0+20]

# qhasm: *(uint8 *) (out + 24) = t192
# asm 1: stb <t192=int64#9,[<out=int64#1+24]
# asm 2: stb <t192=%g5,[<out=%i0+24]
stb %g5,[%i0+24]

# qhasm: *(uint8 *) (out + 28) = t224
# asm 1: stb <t224=int64#2,[<out=int64#1+28]
# asm 2: stb <t224=%i1,[<out=%i0+28]
stb %i1,[%i0+28]

# qhasm: leave
ret
restore
