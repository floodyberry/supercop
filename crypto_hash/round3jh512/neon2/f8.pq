int128 x0
int128 x1
int128 x2
int128 x3
int128 x4
int128 x5
int128 x6
int128 x7
int128 r0
int128 r1
int128 r2
int128 r3
int128 r4
int128 r5
int128 r6
int128 r7
int128 temp0
int128 temp1
int32 r
int128 cf
int128 c33
int128 c55

qpushenter F8

# XXX the function-call boundary here is poorly chosen;
# should at least inline blocks, maybe all of crypto_hash

x0 = mem128[input_0]; input_0 += 16
x1 = mem128[input_0]; input_0 += 16
x2 = mem128[input_0]; input_0 += 16
x3 = mem128[input_0]; input_0 += 16

r0 = mem128[input_1]; input_1 += 16
r1 = mem128[input_1]; input_1 += 16
r2 = mem128[input_1]; input_1 += 16
r3 = mem128[input_1]
input_1 -= 48

x0 ^= r0
  x4 = mem128[input_0]; input_0 += 16
    cf = 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
x1 ^= r1
  x5 = mem128[input_0]; input_0 += 16
    c33 = 51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51
x2 ^= r2
  x6 = mem128[input_0]; input_0 += 16
    c55 = 85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85
x3 ^= r3
  x7 = mem128[input_0]
  input_0 -= 112

r = 42

mainloop:

@define SS ;\
    temp0 aligned= mem128[input_2]; input_2 += 16 ;\
    r0 = temp0 & ~x4 ;\
    temp1 aligned= mem128[input_2]; input_2 += 16 ;\
    r4 = temp1 & ~x5 ;\
    x0 ^= r0 ;\
    x1 ^= r4 ;\
    r1 = x0 & x2 ;\
    r5 = x1 & x3 ;\
    temp0 ^= r1 ;\
    temp1 ^= r5 ;\
    r0 = x4 & ~x6 ;\
    r4 = x5 & ~x7 ;\
    x0 ^= r0 ;\
    x1 ^= r4 ;\
    r3 = x2 | ~x4 ;\
    r7 = x3 | ~x5 ;\
    x6 ^= r3 ;\
    x7 ^= r7 ;\
    r1 = x0 & x4 ;\
    r5 = x1 & x5 ;\
    x2 ^= r1 ;\
    x3 ^= r5 ;\
    r2 = x0 & ~x6 ;\
    r6 = x1 & ~x7 ;\
    x4 ^= r2 ;\
    x5 ^= r6 ;\
    r0 = x2 | x6 ;\
    r4 = x3 | x7 ;\
    x0 ^= r0 ;\
    x1 ^= r4 ;\
    r3 = x2 & x4 ;\
    x4 ^= temp0 ;\
    r7 = x3 & x5 ;\
    x5 ^= temp1 ;\
    x6 ^= r3 ;\
    x7 ^= r7 ;\
    r1 = temp0 & x0 ;\
    r5 = temp1 & x1 ;\
    x2 ^= r1 ;\
    x3 ^= r5 ;\

@define L ;\
    x5 ^= x6 ;\
    x1 ^= x2 ;\
    x3 ^= x4 ;\
    x5 ^= x0 ;\
    x7 ^= x0 ;\
    x0 ^= x3 ;\
    x2 ^= x5 ;\
    x4 ^= x7 ;\
    x6 ^= x1 ;\
    x4 ^= x1 ;\

  SS
  L
  2x r1 = x1 << 1
  2x x1 unsigned>>= 1
    2x r3 = x3 << 1
    2x x3 unsigned>>= 1
  x1 = (c55 & x1) | (~c55 & r1)
    x3 = (c55 & x3) | (~c55 & r3)
      2x r5 = x5 << 1
      2x x5 unsigned>>= 1
        2x r7 = x7 << 1
        2x x7 unsigned>>= 1
      x5 = (c55 & x5) | (~c55 & r5)
        x7 = (c55 & x7) | (~c55 & r7)

  SS
  L
  2x r1 = x1 << 2
  2x x1 unsigned>>= 2
    2x r3 = x3 << 2
    2x x3 unsigned>>= 2
  x1 = (c33 & x1) | (~c33 & r1)
    x3 = (c33 & x3) | (~c33 & r3)
      2x r5 = x5 << 2
      2x x5 unsigned>>= 2
        2x r7 = x7 << 2
        2x x7 unsigned>>= 2
      x5 = (c33 & x5) | (~c33 & r5)
        x7 = (c33 & x7) | (~c33 & r7)

  SS
  L
  2x r1 = x1 << 4
  2x x1 unsigned>>= 4
    2x r3 = x3 << 4
    2x x3 unsigned>>= 4
  x1 = (cf & x1) | (~cf & r1)
    x3 = (cf & x3) | (~cf & r3)
      2x r5 = x5 << 4
      2x x5 unsigned>>= 4
        2x r7 = x7 << 4
        2x x7 unsigned>>= 4
      x5 = (cf & x5) | (~cf & r5)
        x7 = (cf & x7) | (~cf & r7)

  SS
    x5 ^= x6
    x1 ^= x2
    x3 ^= x4
    x5 ^= x0
    x7 ^= x0
    x0 ^= x3
    x2 ^= x5
  x3 = x3[1] x3[0] x3[3] x3[2] x3[5] x3[4] x3[7] x3[6] x3[9] x3[8] x3[11] x3[10] x3[13] x3[12] x3[15] x3[14]
    x4 ^= x7
  x5 = x5[1] x5[0] x5[3] x5[2] x5[5] x5[4] x5[7] x5[6] x5[9] x5[8] x5[11] x5[10] x5[13] x5[12] x5[15] x5[14]
    x6 ^= x1
  x7 = x7[1] x7[0] x7[3] x7[2] x7[5] x7[4] x7[7] x7[6] x7[9] x7[8] x7[11] x7[10] x7[13] x7[12] x7[15] x7[14]
    x4 ^= x1
  x1 = x1[1] x1[0] x1[3] x1[2] x1[5] x1[4] x1[7] x1[6] x1[9] x1[8] x1[11] x1[10] x1[13] x1[12] x1[15] x1[14]

  SS
    x5 ^= x6
    x1 ^= x2
    x3 ^= x4
    x5 ^= x0
    x7 ^= x0
    x0 ^= x3
    x2 ^= x5
  x3 = x3[1] x3[0] x3[3] x3[2] x3[5] x3[4] x3[7] x3[6]
    x4 ^= x7
  x5 = x5[1] x5[0] x5[3] x5[2] x5[5] x5[4] x5[7] x5[6]
    x6 ^= x1
  x7 = x7[1] x7[0] x7[3] x7[2] x7[5] x7[4] x7[7] x7[6]
    x4 ^= x1
  x1 = x1[1] x1[0] x1[3] x1[2] x1[5] x1[4] x1[7] x1[6]

  SS
    x5 ^= x6
    x1 ^= x2
    x3 ^= x4
    x5 ^= x0
    x7 ^= x0
    x0 ^= x3
    x2 ^= x5
  x3 = x3[1] x3[0] x3[3] x3[2]
    x4 ^= x7
  x5 = x5[1] x5[0] x5[3] x5[2]
    x6 ^= x1
  x7 = x7[1] x7[0] x7[3] x7[2]
    x4 ^= x1
  x1 = x1[1] x1[0] x1[3] x1[2]

  SS
    x5 ^= x6
    x1 ^= x2
    x3 ^= x4
    x5 ^= x0
    x7 ^= x0
    x0 ^= x3
    x2 ^= x5
  x3 = x3[1] x3[0]
    x4 ^= x7
  x5 = x5[1] x5[0]
    x6 ^= x1
  x7 = x7[1] x7[0]
    x4 ^= x1
  x1 = x1[1] x1[0]

                 unsigned>? r -= 7
goto mainloop if unsigned>

r0 = mem128[input_1]; input_1 += 16
r1 = mem128[input_1]; input_1 += 16
r2 = mem128[input_1]; input_1 += 16
r3 = mem128[input_1]

x4 ^= r0
  mem128[input_0] = x0; input_0 += 16
x5 ^= r1
  mem128[input_0] = x1; input_0 += 16
x6 ^= r2
  mem128[input_0] = x2; input_0 += 16
x7 ^= r3
  mem128[input_0] = x3; input_0 += 16

mem128[input_0] = x4; input_0 += 16
mem128[input_0] = x5; input_0 += 16
mem128[input_0] = x6; input_0 += 16
mem128[input_0] = x7

qpopreturn
