enter crypto_hashblocks_rfsb509_amd64_1
int64 rp
int64 bp
int64 blen
input rp
input bp
input blen
int64 c1
caller c1
stack64 c1_stack
c1_stack = c1
int64 c2
caller c2
stack64 c2_stack
c2_stack = c2
int64 c3
caller c3
stack64 c3_stack
c3_stack = c3
int64 c4
caller c4
stack64 c4_stack
c4_stack = c4
int64 c5
caller c5
stack64 c5_stack
c5_stack = c5
int64 c6
caller c6
stack64 c6_stack
c6_stack = c6
int64 c7
caller c7
stack64 c7_stack
c7_stack = c7
stack128 state0
stack128 state1
stack128 state2
stack128 state3
int6464 v
int64 matrix
matrix = crypto_hashblocks_rfsb509_amd64_1_matrix
assign 4 to matrix
stack64 rp_stack
rp_stack = rp
int64 mask
(uint32) mask = 0x3fc0
assign 8 to mask
int6464 f0
int6464 f1
int6464 f2
int6464 f3
int6464 f4
int6464 f5
int6464 f6
int6464 f7
int6464 f8
int6464 f9
int6464 f10
int6464 f11
int6464 f12
int6464 f13
int6464 f14
int6464 f15
int6464 f16
int6464 f17
int6464 f18
int6464 f19
int6464 f20
int6464 f21
int6464 f22
int6464 f23
int6464 f24
int6464 f25
int6464 f26
int6464 f27
int6464 f28
int6464 f29
int6464 f30
int6464 f31
int6464 f32
int6464 f33
int6464 f34
int6464 f35
int6464 f36
int6464 f37
int6464 f38
int6464 f39
int6464 f40
int6464 f41
int6464 f42
int6464 f43
int6464 f44
int6464 f45
int6464 f46
int6464 f47
int6464 f48
int6464 f49
int6464 f50
int6464 f51
int6464 f52
int6464 f53
int6464 f54
int6464 f55
int6464 f56
int6464 f57
int6464 f58
int6464 f59
int6464 f60
int6464 f61
int6464 f62
int6464 f63
int6464 f64
int6464 f65
int6464 f66
int6464 f67
int6464 f68
int6464 f69
int6464 f70
int6464 f71
int6464 f72
int6464 f73
int6464 f74
int6464 f75
int6464 f76
int6464 f77
int6464 f78
int6464 f79
int6464 f80
int6464 f81
int6464 f82
int6464 f83
int6464 f84
int6464 f85
int6464 f86
int6464 f87
int6464 f88
int6464 f89
int6464 f90
int6464 f91
int6464 f92
int6464 f93
int6464 f94
int6464 f95
int6464 f96
int6464 f97
int6464 f98
int6464 f99
int6464 f100
int6464 f101
int6464 f102
int6464 f103
int6464 f104
int6464 f105
int6464 f106
int6464 f107
int6464 f108
int6464 f109
int6464 f110
int6464 f111
int6464 f112
int6464 f113
int6464 f114
int64 pos0
int64 pos1
int64 pos2
int64 pos3
int64 pos4
int64 pos5
int64 pos6
int64 pos7
int64 pos8
int64 pos9
int64 pos10
int64 pos11
int64 pos12
int64 pos13
int64 pos14
int64 pos15
int64 pos16
int64 pos17
int64 pos18
int64 pos19
int64 pos20
int64 pos21
int64 pos22
int64 pos23
int64 pos24
int64 pos25
int64 pos26
int64 pos27
int64 pos28
int64 pos29
int64 pos30
int64 pos31
int64 pos32
int64 pos33
int64 pos34
int64 pos35
int64 pos36
int64 pos37
int64 pos38
int64 pos39
int64 pos40
int64 pos41
int64 pos42
int64 pos43
int64 pos44
int64 pos45
int64 pos46
int64 pos47
int64 pos48
int64 pos49
int64 pos50
int64 pos51
int64 pos52
int64 pos53
int64 pos54
int64 pos55
int64 pos56
int64 pos57
int64 pos58
int64 pos59
int64 pos60
int64 pos61
int64 pos62
int64 pos63
int64 pos64
int64 pos65
int64 pos66
int64 pos67
int64 pos68
int64 pos69
int64 pos70
int64 pos71
int64 pos72
int64 pos73
int64 pos74
int64 pos75
int64 pos76
int64 pos77
int64 pos78
int64 pos79
int64 pos80
int64 pos81
int64 pos82
int64 pos83
int64 pos84
int64 pos85
int64 pos86
int64 pos87
int64 pos88
int64 pos89
int64 pos90
int64 pos91
int64 pos92
int64 pos93
int64 pos94
int64 pos95
int64 pos96
int64 pos97
int64 pos98
int64 pos99
int64 pos100
int64 pos101
int64 pos102
int64 pos103
int64 pos104
int64 pos105
int64 pos106
int64 pos107
int64 pos108
int64 pos109
int64 pos110
int64 pos111
v = *(unaligned int128 *) (rp + 0)
state0 = v
v = *(unaligned int128 *) (rp + 16)
state1 = v
v = *(unaligned int128 *) (rp + 32)
state2 = v
v = *(unaligned int128 *) (rp + 48)
state3 = v

             unsigned<? blen -= 48
goto done if unsigned<

mainloop:

pos0 = ((uint64 *)&state0)[0]
pos1 = pos0
(uint32) pos0 <<= 6
(uint32) pos0 &= mask
pos2 = pos1
(uint32) pos1 >>= 2
(uint32) pos1 &= mask
f0 = *(int128 *) (pos0 + 48 + matrix)
pos3 = pos2
(uint32) pos2 >>= 10
(uint32) pos2 &= mask
f2 = *(int128 *) (pos0 + 16 + matrix)
v = f0
uint6464 f0 <<= 3
f1 = *(int128 *) (pos0 + 32 + matrix)
uint6464 v >>= 61
f4[0,1,2,3] = v[1,1,0,1]
f3 = *(int128 *) (pos0 + 0 + matrix)
v >>= 64
f4 ^= f0
f3 ^= v
uint32323232 f1 ^= *(int128 *) (pos1 + 48 + matrix)
pos4 = pos3
(uint32) pos3 >>= 18
(uint32) pos3 &= mask
uint32323232 f3 ^= *(int128 *) (pos1 + 16 + matrix)
v = f1
uint6464 f1 <<= 3
uint32323232 f2 ^= *(int128 *) (pos1 + 32 + matrix)
uint6464 v >>= 61
f5[0,1,2,3] = v[1,1,0,1]
uint32323232 f4 ^= *(int128 *) (pos1 + 0 + matrix)
v >>= 64
f5 ^= f1
f4 ^= v
uint32323232 f2 ^= *(int128 *) (pos2 + 48 + matrix)
pos5 = pos4
(uint64) pos4 >>= 26
(uint32) pos4 &= mask
assign 7 to pos4
uint32323232 f4 ^= *(int128 *) (pos2 + 16 + matrix)
v = f2
uint6464 f2 <<= 3
uint32323232 f3 ^= *(int128 *) (pos2 + 32 + matrix)
uint6464 v >>= 61
f6[0,1,2,3] = v[1,1,0,1]
uint32323232 f5 ^= *(int128 *) (pos2 + 0 + matrix)
v >>= 64
f6 ^= f2
f5 ^= v
uint32323232 f3 ^= *(int128 *) (pos3 + 48 + matrix)
pos6 = pos5
(uint64) pos5 >>= 34
(uint32) pos5 &= mask
assign 4 to pos5
uint32323232 f5 ^= *(int128 *) (pos3 + 16 + matrix)
v = f3
uint6464 f3 <<= 3
uint32323232 f4 ^= *(int128 *) (pos3 + 32 + matrix)
uint6464 v >>= 61
f7[0,1,2,3] = v[1,1,0,1]
uint32323232 f6 ^= *(int128 *) (pos3 + 0 + matrix)
v >>= 64
f7 ^= f3
f6 ^= v
uint32323232 f4 ^= *(int128 *) (pos4 + 48 + matrix)
pos7 = pos6
(uint64) pos6 >>= 42
(uint32) pos6 &= mask
assign 15 to pos6
uint32323232 f6 ^= *(int128 *) (pos4 + 16 + matrix)
v = f4
uint6464 f4 <<= 3
uint32323232 f5 ^= *(int128 *) (pos4 + 32 + matrix)
uint6464 v >>= 61
f8[0,1,2,3] = v[1,1,0,1]
uint32323232 f7 ^= *(int128 *) (pos4 + 0 + matrix)
pos8 = ((uint64 *)&state0)[1]
v >>= 64
f8 ^= f4
f7 ^= v
uint32323232 f5 ^= *(int128 *) (pos5 + 48 + matrix)
(uint64) pos7 >>= 50
(uint32) pos7 &= mask
assign 14 to pos7
uint32323232 f7 ^= *(int128 *) (pos5 + 16 + matrix)
v = f5
uint6464 f5 <<= 3
uint32323232 f6 ^= *(int128 *) (pos5 + 32 + matrix)
uint6464 v >>= 61
f9[0,1,2,3] = v[1,1,0,1]
uint32323232 f8 ^= *(int128 *) (pos5 + 0 + matrix)
v >>= 64
f9 ^= f5
f8 ^= v
uint32323232 f6 ^= *(int128 *) (pos6 + 48 + matrix)
pos9 = pos8
(uint32) pos8 <<= 6
(uint32) pos8 &= mask
uint32323232 f8 ^= *(int128 *) (pos6 + 16 + matrix)
v = f6
uint6464 f6 <<= 3
uint32323232 f7 ^= *(int128 *) (pos6 + 32 + matrix)
uint6464 v >>= 61
f10[0,1,2,3] = v[1,1,0,1]
uint32323232 f9 ^= *(int128 *) (pos6 + 0 + matrix)
v >>= 64
f10 ^= f6
f9 ^= v
uint32323232 f7 ^= *(int128 *) (pos7 + 48 + matrix)
pos10 = pos9
(uint32) pos9 >>= 2
(uint32) pos9 &= mask
uint32323232 f9 ^= *(int128 *) (pos7 + 16 + matrix)
v = f7
uint6464 f7 <<= 3
uint32323232 f8 ^= *(int128 *) (pos7 + 32 + matrix)
uint6464 v >>= 61
f11[0,1,2,3] = v[1,1,0,1]
uint32323232 f10 ^= *(int128 *) (pos7 + 0 + matrix)
v >>= 64
f11 ^= f7
f10 ^= v
uint32323232 f8 ^= *(int128 *) (pos8 + 48 + matrix)
pos11 = pos10
(uint32) pos10 >>= 10
(uint32) pos10 &= mask
uint32323232 f10 ^= *(int128 *) (pos8 + 16 + matrix)
v = f8
uint6464 f8 <<= 3
uint32323232 f9 ^= *(int128 *) (pos8 + 32 + matrix)
uint6464 v >>= 61
f12[0,1,2,3] = v[1,1,0,1]
uint32323232 f11 ^= *(int128 *) (pos8 + 0 + matrix)
v >>= 64
f12 ^= f8
f11 ^= v
uint32323232 f9 ^= *(int128 *) (pos9 + 48 + matrix)
pos12 = pos11
(uint32) pos11 >>= 18
(uint32) pos11 &= mask
uint32323232 f11 ^= *(int128 *) (pos9 + 16 + matrix)
v = f9
uint6464 f9 <<= 3
uint32323232 f10 ^= *(int128 *) (pos9 + 32 + matrix)
uint6464 v >>= 61
f13[0,1,2,3] = v[1,1,0,1]
uint32323232 f12 ^= *(int128 *) (pos9 + 0 + matrix)
v >>= 64
f13 ^= f9
f12 ^= v
uint32323232 f10 ^= *(int128 *) (pos10 + 48 + matrix)
pos13 = pos12
(uint64) pos12 >>= 26
(uint32) pos12 &= mask
assign 7 to pos12
uint32323232 f12 ^= *(int128 *) (pos10 + 16 + matrix)
v = f10
uint6464 f10 <<= 3
uint32323232 f11 ^= *(int128 *) (pos10 + 32 + matrix)
uint6464 v >>= 61
f14[0,1,2,3] = v[1,1,0,1]
uint32323232 f13 ^= *(int128 *) (pos10 + 0 + matrix)
v >>= 64
f14 ^= f10
f13 ^= v
uint32323232 f11 ^= *(int128 *) (pos11 + 48 + matrix)
pos14 = pos13
(uint64) pos13 >>= 34
(uint32) pos13 &= mask
assign 4 to pos13
uint32323232 f13 ^= *(int128 *) (pos11 + 16 + matrix)
v = f11
uint6464 f11 <<= 3
uint32323232 f12 ^= *(int128 *) (pos11 + 32 + matrix)
uint6464 v >>= 61
f15[0,1,2,3] = v[1,1,0,1]
uint32323232 f14 ^= *(int128 *) (pos11 + 0 + matrix)
v >>= 64
f15 ^= f11
f14 ^= v
uint32323232 f12 ^= *(int128 *) (pos12 + 48 + matrix)
pos15 = pos14
(uint64) pos14 >>= 42
(uint32) pos14 &= mask
assign 15 to pos14
uint32323232 f14 ^= *(int128 *) (pos12 + 16 + matrix)
v = f12
uint6464 f12 <<= 3
uint32323232 f13 ^= *(int128 *) (pos12 + 32 + matrix)
uint6464 v >>= 61
f16[0,1,2,3] = v[1,1,0,1]
uint32323232 f15 ^= *(int128 *) (pos12 + 0 + matrix)
pos16 = ((uint64 *)&state1)[0]
v >>= 64
f16 ^= f12
f15 ^= v
uint32323232 f13 ^= *(int128 *) (pos13 + 48 + matrix)
(uint64) pos15 >>= 50
(uint32) pos15 &= mask
assign 14 to pos15
uint32323232 f15 ^= *(int128 *) (pos13 + 16 + matrix)
v = f13
uint6464 f13 <<= 3
uint32323232 f14 ^= *(int128 *) (pos13 + 32 + matrix)
uint6464 v >>= 61
f17[0,1,2,3] = v[1,1,0,1]
uint32323232 f16 ^= *(int128 *) (pos13 + 0 + matrix)
v >>= 64
f17 ^= f13
f16 ^= v
uint32323232 f14 ^= *(int128 *) (pos14 + 48 + matrix)
pos17 = pos16
(uint32) pos16 <<= 6
(uint32) pos16 &= mask
uint32323232 f16 ^= *(int128 *) (pos14 + 16 + matrix)
v = f14
uint6464 f14 <<= 3
uint32323232 f15 ^= *(int128 *) (pos14 + 32 + matrix)
uint6464 v >>= 61
f18[0,1,2,3] = v[1,1,0,1]
uint32323232 f17 ^= *(int128 *) (pos14 + 0 + matrix)
v >>= 64
f18 ^= f14
f17 ^= v
uint32323232 f15 ^= *(int128 *) (pos15 + 48 + matrix)
pos18 = pos17
(uint32) pos17 >>= 2
(uint32) pos17 &= mask
uint32323232 f17 ^= *(int128 *) (pos15 + 16 + matrix)
v = f15
uint6464 f15 <<= 3
uint32323232 f16 ^= *(int128 *) (pos15 + 32 + matrix)
uint6464 v >>= 61
f19[0,1,2,3] = v[1,1,0,1]
uint32323232 f18 ^= *(int128 *) (pos15 + 0 + matrix)
v >>= 64
f19 ^= f15
f18 ^= v
uint32323232 f16 ^= *(int128 *) (pos16 + 48 + matrix)
pos19 = pos18
(uint32) pos18 >>= 10
(uint32) pos18 &= mask
uint32323232 f18 ^= *(int128 *) (pos16 + 16 + matrix)
v = f16
uint6464 f16 <<= 3
uint32323232 f17 ^= *(int128 *) (pos16 + 32 + matrix)
uint6464 v >>= 61
f20[0,1,2,3] = v[1,1,0,1]
uint32323232 f19 ^= *(int128 *) (pos16 + 0 + matrix)
v >>= 64
f20 ^= f16
f19 ^= v
uint32323232 f17 ^= *(int128 *) (pos17 + 48 + matrix)
pos20 = pos19
(uint32) pos19 >>= 18
(uint32) pos19 &= mask
uint32323232 f19 ^= *(int128 *) (pos17 + 16 + matrix)
v = f17
uint6464 f17 <<= 3
uint32323232 f18 ^= *(int128 *) (pos17 + 32 + matrix)
uint6464 v >>= 61
f21[0,1,2,3] = v[1,1,0,1]
uint32323232 f20 ^= *(int128 *) (pos17 + 0 + matrix)
v >>= 64
f21 ^= f17
f20 ^= v
uint32323232 f18 ^= *(int128 *) (pos18 + 48 + matrix)
pos21 = pos20
(uint64) pos20 >>= 26
(uint32) pos20 &= mask
assign 7 to pos20
uint32323232 f20 ^= *(int128 *) (pos18 + 16 + matrix)
v = f18
uint6464 f18 <<= 3
uint32323232 f19 ^= *(int128 *) (pos18 + 32 + matrix)
uint6464 v >>= 61
f22[0,1,2,3] = v[1,1,0,1]
uint32323232 f21 ^= *(int128 *) (pos18 + 0 + matrix)
v >>= 64
f22 ^= f18
f21 ^= v
uint32323232 f19 ^= *(int128 *) (pos19 + 48 + matrix)
pos22 = pos21
(uint64) pos21 >>= 34
(uint32) pos21 &= mask
assign 4 to pos21
uint32323232 f21 ^= *(int128 *) (pos19 + 16 + matrix)
v = f19
uint6464 f19 <<= 3
uint32323232 f20 ^= *(int128 *) (pos19 + 32 + matrix)
uint6464 v >>= 61
f23[0,1,2,3] = v[1,1,0,1]
uint32323232 f22 ^= *(int128 *) (pos19 + 0 + matrix)
v >>= 64
f23 ^= f19
f22 ^= v
uint32323232 f20 ^= *(int128 *) (pos20 + 48 + matrix)
pos23 = pos22
(uint64) pos22 >>= 42
(uint32) pos22 &= mask
assign 15 to pos22
uint32323232 f22 ^= *(int128 *) (pos20 + 16 + matrix)
v = f20
uint6464 f20 <<= 3
uint32323232 f21 ^= *(int128 *) (pos20 + 32 + matrix)
uint6464 v >>= 61
f24[0,1,2,3] = v[1,1,0,1]
uint32323232 f23 ^= *(int128 *) (pos20 + 0 + matrix)
pos24 = ((uint64 *)&state1)[1]
v >>= 64
f24 ^= f20
f23 ^= v
uint32323232 f21 ^= *(int128 *) (pos21 + 48 + matrix)
(uint64) pos23 >>= 50
(uint32) pos23 &= mask
assign 14 to pos23
uint32323232 f23 ^= *(int128 *) (pos21 + 16 + matrix)
v = f21
uint6464 f21 <<= 3
uint32323232 f22 ^= *(int128 *) (pos21 + 32 + matrix)
uint6464 v >>= 61
f25[0,1,2,3] = v[1,1,0,1]
uint32323232 f24 ^= *(int128 *) (pos21 + 0 + matrix)
v >>= 64
f25 ^= f21
f24 ^= v
uint32323232 f22 ^= *(int128 *) (pos22 + 48 + matrix)
pos25 = pos24
(uint32) pos24 <<= 6
(uint32) pos24 &= mask
uint32323232 f24 ^= *(int128 *) (pos22 + 16 + matrix)
v = f22
uint6464 f22 <<= 3
uint32323232 f23 ^= *(int128 *) (pos22 + 32 + matrix)
uint6464 v >>= 61
f26[0,1,2,3] = v[1,1,0,1]
uint32323232 f25 ^= *(int128 *) (pos22 + 0 + matrix)
v >>= 64
f26 ^= f22
f25 ^= v
uint32323232 f23 ^= *(int128 *) (pos23 + 48 + matrix)
pos26 = pos25
(uint32) pos25 >>= 2
(uint32) pos25 &= mask
uint32323232 f25 ^= *(int128 *) (pos23 + 16 + matrix)
v = f23
uint6464 f23 <<= 3
uint32323232 f24 ^= *(int128 *) (pos23 + 32 + matrix)
uint6464 v >>= 61
f27[0,1,2,3] = v[1,1,0,1]
uint32323232 f26 ^= *(int128 *) (pos23 + 0 + matrix)
v >>= 64
f27 ^= f23
f26 ^= v
uint32323232 f24 ^= *(int128 *) (pos24 + 48 + matrix)
pos27 = pos26
(uint32) pos26 >>= 10
(uint32) pos26 &= mask
uint32323232 f26 ^= *(int128 *) (pos24 + 16 + matrix)
v = f24
uint6464 f24 <<= 3
uint32323232 f25 ^= *(int128 *) (pos24 + 32 + matrix)
uint6464 v >>= 61
f28[0,1,2,3] = v[1,1,0,1]
uint32323232 f27 ^= *(int128 *) (pos24 + 0 + matrix)
v >>= 64
f28 ^= f24
f27 ^= v
uint32323232 f25 ^= *(int128 *) (pos25 + 48 + matrix)
pos28 = pos27
(uint32) pos27 >>= 18
(uint32) pos27 &= mask
uint32323232 f27 ^= *(int128 *) (pos25 + 16 + matrix)
v = f25
uint6464 f25 <<= 3
uint32323232 f26 ^= *(int128 *) (pos25 + 32 + matrix)
uint6464 v >>= 61
f29[0,1,2,3] = v[1,1,0,1]
uint32323232 f28 ^= *(int128 *) (pos25 + 0 + matrix)
v >>= 64
f29 ^= f25
f28 ^= v
uint32323232 f26 ^= *(int128 *) (pos26 + 48 + matrix)
pos29 = pos28
(uint64) pos28 >>= 26
(uint32) pos28 &= mask
assign 7 to pos28
uint32323232 f28 ^= *(int128 *) (pos26 + 16 + matrix)
v = f26
uint6464 f26 <<= 3
uint32323232 f27 ^= *(int128 *) (pos26 + 32 + matrix)
uint6464 v >>= 61
f30[0,1,2,3] = v[1,1,0,1]
uint32323232 f29 ^= *(int128 *) (pos26 + 0 + matrix)
v >>= 64
f30 ^= f26
f29 ^= v
uint32323232 f27 ^= *(int128 *) (pos27 + 48 + matrix)
pos30 = pos29
(uint64) pos29 >>= 34
(uint32) pos29 &= mask
assign 4 to pos29
uint32323232 f29 ^= *(int128 *) (pos27 + 16 + matrix)
v = f27
uint6464 f27 <<= 3
uint32323232 f28 ^= *(int128 *) (pos27 + 32 + matrix)
uint6464 v >>= 61
f31[0,1,2,3] = v[1,1,0,1]
uint32323232 f30 ^= *(int128 *) (pos27 + 0 + matrix)
v >>= 64
f31 ^= f27
f30 ^= v
uint32323232 f28 ^= *(int128 *) (pos28 + 48 + matrix)
pos31 = pos30
(uint64) pos30 >>= 42
(uint32) pos30 &= mask
assign 15 to pos30
uint32323232 f30 ^= *(int128 *) (pos28 + 16 + matrix)
v = f28
uint6464 f28 <<= 3
uint32323232 f29 ^= *(int128 *) (pos28 + 32 + matrix)
uint6464 v >>= 61
f32[0,1,2,3] = v[1,1,0,1]
uint32323232 f31 ^= *(int128 *) (pos28 + 0 + matrix)
pos32 = ((uint64 *)&state2)[0]
v >>= 64
f32 ^= f28
f31 ^= v
uint32323232 f29 ^= *(int128 *) (pos29 + 48 + matrix)
(uint64) pos31 >>= 50
(uint32) pos31 &= mask
assign 14 to pos31
uint32323232 f31 ^= *(int128 *) (pos29 + 16 + matrix)
v = f29
uint6464 f29 <<= 3
uint32323232 f30 ^= *(int128 *) (pos29 + 32 + matrix)
uint6464 v >>= 61
f33[0,1,2,3] = v[1,1,0,1]
uint32323232 f32 ^= *(int128 *) (pos29 + 0 + matrix)
v >>= 64
f33 ^= f29
f32 ^= v
uint32323232 f30 ^= *(int128 *) (pos30 + 48 + matrix)
pos33 = pos32
(uint32) pos32 <<= 6
(uint32) pos32 &= mask
uint32323232 f32 ^= *(int128 *) (pos30 + 16 + matrix)
v = f30
uint6464 f30 <<= 3
uint32323232 f31 ^= *(int128 *) (pos30 + 32 + matrix)
uint6464 v >>= 61
f34[0,1,2,3] = v[1,1,0,1]
uint32323232 f33 ^= *(int128 *) (pos30 + 0 + matrix)
v >>= 64
f34 ^= f30
f33 ^= v
uint32323232 f31 ^= *(int128 *) (pos31 + 48 + matrix)
pos34 = pos33
(uint32) pos33 >>= 2
(uint32) pos33 &= mask
uint32323232 f33 ^= *(int128 *) (pos31 + 16 + matrix)
v = f31
uint6464 f31 <<= 3
uint32323232 f32 ^= *(int128 *) (pos31 + 32 + matrix)
uint6464 v >>= 61
f35[0,1,2,3] = v[1,1,0,1]
uint32323232 f34 ^= *(int128 *) (pos31 + 0 + matrix)
v >>= 64
f35 ^= f31
f34 ^= v
uint32323232 f32 ^= *(int128 *) (pos32 + 48 + matrix)
pos35 = pos34
(uint32) pos34 >>= 10
(uint32) pos34 &= mask
uint32323232 f34 ^= *(int128 *) (pos32 + 16 + matrix)
v = f32
uint6464 f32 <<= 3
uint32323232 f33 ^= *(int128 *) (pos32 + 32 + matrix)
uint6464 v >>= 61
f36[0,1,2,3] = v[1,1,0,1]
uint32323232 f35 ^= *(int128 *) (pos32 + 0 + matrix)
v >>= 64
f36 ^= f32
f35 ^= v
uint32323232 f33 ^= *(int128 *) (pos33 + 48 + matrix)
pos36 = pos35
(uint32) pos35 >>= 18
(uint32) pos35 &= mask
uint32323232 f35 ^= *(int128 *) (pos33 + 16 + matrix)
v = f33
uint6464 f33 <<= 3
uint32323232 f34 ^= *(int128 *) (pos33 + 32 + matrix)
uint6464 v >>= 61
f37[0,1,2,3] = v[1,1,0,1]
uint32323232 f36 ^= *(int128 *) (pos33 + 0 + matrix)
v >>= 64
f37 ^= f33
f36 ^= v
uint32323232 f34 ^= *(int128 *) (pos34 + 48 + matrix)
pos37 = pos36
(uint64) pos36 >>= 26
(uint32) pos36 &= mask
assign 7 to pos36
uint32323232 f36 ^= *(int128 *) (pos34 + 16 + matrix)
v = f34
uint6464 f34 <<= 3
uint32323232 f35 ^= *(int128 *) (pos34 + 32 + matrix)
uint6464 v >>= 61
f38[0,1,2,3] = v[1,1,0,1]
uint32323232 f37 ^= *(int128 *) (pos34 + 0 + matrix)
v >>= 64
f38 ^= f34
f37 ^= v
uint32323232 f35 ^= *(int128 *) (pos35 + 48 + matrix)
pos38 = pos37
(uint64) pos37 >>= 34
(uint32) pos37 &= mask
assign 4 to pos37
uint32323232 f37 ^= *(int128 *) (pos35 + 16 + matrix)
v = f35
uint6464 f35 <<= 3
uint32323232 f36 ^= *(int128 *) (pos35 + 32 + matrix)
uint6464 v >>= 61
f39[0,1,2,3] = v[1,1,0,1]
uint32323232 f38 ^= *(int128 *) (pos35 + 0 + matrix)
v >>= 64
f39 ^= f35
f38 ^= v
uint32323232 f36 ^= *(int128 *) (pos36 + 48 + matrix)
pos39 = pos38
(uint64) pos38 >>= 42
(uint32) pos38 &= mask
assign 15 to pos38
uint32323232 f38 ^= *(int128 *) (pos36 + 16 + matrix)
v = f36
uint6464 f36 <<= 3
uint32323232 f37 ^= *(int128 *) (pos36 + 32 + matrix)
uint6464 v >>= 61
f40[0,1,2,3] = v[1,1,0,1]
uint32323232 f39 ^= *(int128 *) (pos36 + 0 + matrix)
pos40 = ((uint64 *)&state2)[1]
v >>= 64
f40 ^= f36
f39 ^= v
uint32323232 f37 ^= *(int128 *) (pos37 + 48 + matrix)
(uint64) pos39 >>= 50
(uint32) pos39 &= mask
assign 14 to pos39
uint32323232 f39 ^= *(int128 *) (pos37 + 16 + matrix)
v = f37
uint6464 f37 <<= 3
uint32323232 f38 ^= *(int128 *) (pos37 + 32 + matrix)
uint6464 v >>= 61
f41[0,1,2,3] = v[1,1,0,1]
uint32323232 f40 ^= *(int128 *) (pos37 + 0 + matrix)
v >>= 64
f41 ^= f37
f40 ^= v
uint32323232 f38 ^= *(int128 *) (pos38 + 48 + matrix)
pos41 = pos40
(uint32) pos40 <<= 6
(uint32) pos40 &= mask
uint32323232 f40 ^= *(int128 *) (pos38 + 16 + matrix)
v = f38
uint6464 f38 <<= 3
uint32323232 f39 ^= *(int128 *) (pos38 + 32 + matrix)
uint6464 v >>= 61
f42[0,1,2,3] = v[1,1,0,1]
uint32323232 f41 ^= *(int128 *) (pos38 + 0 + matrix)
v >>= 64
f42 ^= f38
f41 ^= v
uint32323232 f39 ^= *(int128 *) (pos39 + 48 + matrix)
pos42 = pos41
(uint32) pos41 >>= 2
(uint32) pos41 &= mask
uint32323232 f41 ^= *(int128 *) (pos39 + 16 + matrix)
v = f39
uint6464 f39 <<= 3
uint32323232 f40 ^= *(int128 *) (pos39 + 32 + matrix)
uint6464 v >>= 61
f43[0,1,2,3] = v[1,1,0,1]
uint32323232 f42 ^= *(int128 *) (pos39 + 0 + matrix)
v >>= 64
f43 ^= f39
f42 ^= v
uint32323232 f40 ^= *(int128 *) (pos40 + 48 + matrix)
pos43 = pos42
(uint32) pos42 >>= 10
(uint32) pos42 &= mask
uint32323232 f42 ^= *(int128 *) (pos40 + 16 + matrix)
v = f40
uint6464 f40 <<= 3
uint32323232 f41 ^= *(int128 *) (pos40 + 32 + matrix)
uint6464 v >>= 61
f44[0,1,2,3] = v[1,1,0,1]
uint32323232 f43 ^= *(int128 *) (pos40 + 0 + matrix)
v >>= 64
f44 ^= f40
f43 ^= v
uint32323232 f41 ^= *(int128 *) (pos41 + 48 + matrix)
pos44 = pos43
(uint32) pos43 >>= 18
(uint32) pos43 &= mask
uint32323232 f43 ^= *(int128 *) (pos41 + 16 + matrix)
v = f41
uint6464 f41 <<= 3
uint32323232 f42 ^= *(int128 *) (pos41 + 32 + matrix)
uint6464 v >>= 61
f45[0,1,2,3] = v[1,1,0,1]
uint32323232 f44 ^= *(int128 *) (pos41 + 0 + matrix)
v >>= 64
f45 ^= f41
f44 ^= v
uint32323232 f42 ^= *(int128 *) (pos42 + 48 + matrix)
pos45 = pos44
(uint64) pos44 >>= 26
(uint32) pos44 &= mask
assign 7 to pos44
uint32323232 f44 ^= *(int128 *) (pos42 + 16 + matrix)
v = f42
uint6464 f42 <<= 3
uint32323232 f43 ^= *(int128 *) (pos42 + 32 + matrix)
uint6464 v >>= 61
f46[0,1,2,3] = v[1,1,0,1]
uint32323232 f45 ^= *(int128 *) (pos42 + 0 + matrix)
v >>= 64
f46 ^= f42
f45 ^= v
uint32323232 f43 ^= *(int128 *) (pos43 + 48 + matrix)
pos46 = pos45
(uint64) pos45 >>= 34
(uint32) pos45 &= mask
assign 4 to pos45
uint32323232 f45 ^= *(int128 *) (pos43 + 16 + matrix)
v = f43
uint6464 f43 <<= 3
uint32323232 f44 ^= *(int128 *) (pos43 + 32 + matrix)
uint6464 v >>= 61
f47[0,1,2,3] = v[1,1,0,1]
uint32323232 f46 ^= *(int128 *) (pos43 + 0 + matrix)
v >>= 64
f47 ^= f43
f46 ^= v
uint32323232 f44 ^= *(int128 *) (pos44 + 48 + matrix)
pos47 = pos46
(uint64) pos46 >>= 42
(uint32) pos46 &= mask
assign 15 to pos46
uint32323232 f46 ^= *(int128 *) (pos44 + 16 + matrix)
v = f44
uint6464 f44 <<= 3
uint32323232 f45 ^= *(int128 *) (pos44 + 32 + matrix)
uint6464 v >>= 61
f48[0,1,2,3] = v[1,1,0,1]
uint32323232 f47 ^= *(int128 *) (pos44 + 0 + matrix)
pos48 = ((uint64 *)&state3)[0]
v >>= 64
f48 ^= f44
f47 ^= v
uint32323232 f45 ^= *(int128 *) (pos45 + 48 + matrix)
(uint64) pos47 >>= 50
(uint32) pos47 &= mask
assign 14 to pos47
uint32323232 f47 ^= *(int128 *) (pos45 + 16 + matrix)
v = f45
uint6464 f45 <<= 3
uint32323232 f46 ^= *(int128 *) (pos45 + 32 + matrix)
uint6464 v >>= 61
f49[0,1,2,3] = v[1,1,0,1]
uint32323232 f48 ^= *(int128 *) (pos45 + 0 + matrix)
v >>= 64
f49 ^= f45
f48 ^= v
uint32323232 f46 ^= *(int128 *) (pos46 + 48 + matrix)
pos49 = pos48
(uint32) pos48 <<= 6
(uint32) pos48 &= mask
uint32323232 f48 ^= *(int128 *) (pos46 + 16 + matrix)
v = f46
uint6464 f46 <<= 3
uint32323232 f47 ^= *(int128 *) (pos46 + 32 + matrix)
uint6464 v >>= 61
f50[0,1,2,3] = v[1,1,0,1]
uint32323232 f49 ^= *(int128 *) (pos46 + 0 + matrix)
v >>= 64
f50 ^= f46
f49 ^= v
uint32323232 f47 ^= *(int128 *) (pos47 + 48 + matrix)
pos50 = pos49
(uint32) pos49 >>= 2
(uint32) pos49 &= mask
uint32323232 f49 ^= *(int128 *) (pos47 + 16 + matrix)
v = f47
uint6464 f47 <<= 3
uint32323232 f48 ^= *(int128 *) (pos47 + 32 + matrix)
uint6464 v >>= 61
f51[0,1,2,3] = v[1,1,0,1]
uint32323232 f50 ^= *(int128 *) (pos47 + 0 + matrix)
v >>= 64
f51 ^= f47
f50 ^= v
uint32323232 f48 ^= *(int128 *) (pos48 + 48 + matrix)
pos51 = pos50
(uint32) pos50 >>= 10
(uint32) pos50 &= mask
uint32323232 f50 ^= *(int128 *) (pos48 + 16 + matrix)
v = f48
uint6464 f48 <<= 3
uint32323232 f49 ^= *(int128 *) (pos48 + 32 + matrix)
uint6464 v >>= 61
f52[0,1,2,3] = v[1,1,0,1]
uint32323232 f51 ^= *(int128 *) (pos48 + 0 + matrix)
v >>= 64
f52 ^= f48
f51 ^= v
uint32323232 f49 ^= *(int128 *) (pos49 + 48 + matrix)
pos52 = pos51
(uint32) pos51 >>= 18
(uint32) pos51 &= mask
uint32323232 f51 ^= *(int128 *) (pos49 + 16 + matrix)
v = f49
uint6464 f49 <<= 3
uint32323232 f50 ^= *(int128 *) (pos49 + 32 + matrix)
uint6464 v >>= 61
f53[0,1,2,3] = v[1,1,0,1]
uint32323232 f52 ^= *(int128 *) (pos49 + 0 + matrix)
v >>= 64
f53 ^= f49
f52 ^= v
uint32323232 f50 ^= *(int128 *) (pos50 + 48 + matrix)
pos53 = pos52
(uint64) pos52 >>= 26
(uint32) pos52 &= mask
assign 7 to pos52
uint32323232 f52 ^= *(int128 *) (pos50 + 16 + matrix)
v = f50
uint6464 f50 <<= 3
uint32323232 f51 ^= *(int128 *) (pos50 + 32 + matrix)
uint6464 v >>= 61
f54[0,1,2,3] = v[1,1,0,1]
uint32323232 f53 ^= *(int128 *) (pos50 + 0 + matrix)
v >>= 64
f54 ^= f50
f53 ^= v
uint32323232 f51 ^= *(int128 *) (pos51 + 48 + matrix)
pos54 = pos53
(uint64) pos53 >>= 34
(uint32) pos53 &= mask
assign 4 to pos53
uint32323232 f53 ^= *(int128 *) (pos51 + 16 + matrix)
v = f51
uint6464 f51 <<= 3
uint32323232 f52 ^= *(int128 *) (pos51 + 32 + matrix)
uint6464 v >>= 61
f55[0,1,2,3] = v[1,1,0,1]
uint32323232 f54 ^= *(int128 *) (pos51 + 0 + matrix)
v >>= 64
f55 ^= f51
f54 ^= v
uint32323232 f52 ^= *(int128 *) (pos52 + 48 + matrix)
pos55 = pos54
(uint64) pos54 >>= 42
(uint32) pos54 &= mask
assign 15 to pos54
uint32323232 f54 ^= *(int128 *) (pos52 + 16 + matrix)
v = f52
uint6464 f52 <<= 3
uint32323232 f53 ^= *(int128 *) (pos52 + 32 + matrix)
uint6464 v >>= 61
f56[0,1,2,3] = v[1,1,0,1]
uint32323232 f55 ^= *(int128 *) (pos52 + 0 + matrix)
pos56 = ((uint64 *)&state3)[1]
v >>= 64
f56 ^= f52
f55 ^= v
uint32323232 f53 ^= *(int128 *) (pos53 + 48 + matrix)
(uint64) pos55 >>= 50
(uint32) pos55 &= mask
assign 14 to pos55
uint32323232 f55 ^= *(int128 *) (pos53 + 16 + matrix)
v = f53
uint6464 f53 <<= 3
uint32323232 f54 ^= *(int128 *) (pos53 + 32 + matrix)
uint6464 v >>= 61
f57[0,1,2,3] = v[1,1,0,1]
uint32323232 f56 ^= *(int128 *) (pos53 + 0 + matrix)
v >>= 64
f57 ^= f53
f56 ^= v
uint32323232 f54 ^= *(int128 *) (pos54 + 48 + matrix)
pos57 = pos56
(uint32) pos56 <<= 6
(uint32) pos56 &= mask
uint32323232 f56 ^= *(int128 *) (pos54 + 16 + matrix)
v = f54
uint6464 f54 <<= 3
uint32323232 f55 ^= *(int128 *) (pos54 + 32 + matrix)
uint6464 v >>= 61
f58[0,1,2,3] = v[1,1,0,1]
uint32323232 f57 ^= *(int128 *) (pos54 + 0 + matrix)
v >>= 64
f58 ^= f54
f57 ^= v
uint32323232 f55 ^= *(int128 *) (pos55 + 48 + matrix)
pos58 = pos57
(uint32) pos57 >>= 2
(uint32) pos57 &= mask
uint32323232 f57 ^= *(int128 *) (pos55 + 16 + matrix)
v = f55
uint6464 f55 <<= 3
uint32323232 f56 ^= *(int128 *) (pos55 + 32 + matrix)
uint6464 v >>= 61
f59[0,1,2,3] = v[1,1,0,1]
uint32323232 f58 ^= *(int128 *) (pos55 + 0 + matrix)
v >>= 64
f59 ^= f55
f58 ^= v
uint32323232 f56 ^= *(int128 *) (pos56 + 48 + matrix)
pos59 = pos58
(uint32) pos58 >>= 10
(uint32) pos58 &= mask
uint32323232 f58 ^= *(int128 *) (pos56 + 16 + matrix)
v = f56
uint6464 f56 <<= 3
uint32323232 f57 ^= *(int128 *) (pos56 + 32 + matrix)
uint6464 v >>= 61
f60[0,1,2,3] = v[1,1,0,1]
uint32323232 f59 ^= *(int128 *) (pos56 + 0 + matrix)
v >>= 64
f60 ^= f56
f59 ^= v
uint32323232 f57 ^= *(int128 *) (pos57 + 48 + matrix)
pos60 = pos59
(uint32) pos59 >>= 18
(uint32) pos59 &= mask
uint32323232 f59 ^= *(int128 *) (pos57 + 16 + matrix)
v = f57
uint6464 f57 <<= 3
uint32323232 f58 ^= *(int128 *) (pos57 + 32 + matrix)
uint6464 v >>= 61
f61[0,1,2,3] = v[1,1,0,1]
uint32323232 f60 ^= *(int128 *) (pos57 + 0 + matrix)
v >>= 64
f61 ^= f57
f60 ^= v
uint32323232 f58 ^= *(int128 *) (pos58 + 48 + matrix)
pos61 = pos60
(uint64) pos60 >>= 26
(uint32) pos60 &= mask
assign 7 to pos60
uint32323232 f60 ^= *(int128 *) (pos58 + 16 + matrix)
v = f58
uint6464 f58 <<= 3
uint32323232 f59 ^= *(int128 *) (pos58 + 32 + matrix)
uint6464 v >>= 61
f62[0,1,2,3] = v[1,1,0,1]
uint32323232 f61 ^= *(int128 *) (pos58 + 0 + matrix)
v >>= 64
f62 ^= f58
f61 ^= v
uint32323232 f59 ^= *(int128 *) (pos59 + 48 + matrix)
pos62 = pos61
(uint64) pos61 >>= 34
(uint32) pos61 &= mask
assign 4 to pos61
uint32323232 f61 ^= *(int128 *) (pos59 + 16 + matrix)
v = f59
uint6464 f59 <<= 3
uint32323232 f60 ^= *(int128 *) (pos59 + 32 + matrix)
uint6464 v >>= 61
f63[0,1,2,3] = v[1,1,0,1]
uint32323232 f62 ^= *(int128 *) (pos59 + 0 + matrix)
v >>= 64
f63 ^= f59
f62 ^= v
uint32323232 f60 ^= *(int128 *) (pos60 + 48 + matrix)
pos63 = pos62
(uint64) pos62 >>= 42
(uint32) pos62 &= mask
assign 15 to pos62
uint32323232 f62 ^= *(int128 *) (pos60 + 16 + matrix)
v = f60
uint6464 f60 <<= 3
uint32323232 f61 ^= *(int128 *) (pos60 + 32 + matrix)
uint6464 v >>= 61
f64[0,1,2,3] = v[1,1,0,1]
uint32323232 f63 ^= *(int128 *) (pos60 + 0 + matrix)
pos64 = *(int64 *) (bp + 0)
v >>= 64
f64 ^= f60
f63 ^= v
uint32323232 f61 ^= *(int128 *) (pos61 + 48 + matrix)
(uint64) pos63 >>= 50
(uint32) pos63 &= mask
assign 14 to pos63
uint32323232 f63 ^= *(int128 *) (pos61 + 16 + matrix)
v = f61
uint6464 f61 <<= 3
uint32323232 f62 ^= *(int128 *) (pos61 + 32 + matrix)
uint6464 v >>= 61
f65[0,1,2,3] = v[1,1,0,1]
uint32323232 f64 ^= *(int128 *) (pos61 + 0 + matrix)
v >>= 64
f65 ^= f61
f64 ^= v
uint32323232 f62 ^= *(int128 *) (pos62 + 48 + matrix)
pos65 = pos64
(uint32) pos64 <<= 6
(uint32) pos64 &= mask
uint32323232 f64 ^= *(int128 *) (pos62 + 16 + matrix)
v = f62
uint6464 f62 <<= 3
uint32323232 f63 ^= *(int128 *) (pos62 + 32 + matrix)
uint6464 v >>= 61
f66[0,1,2,3] = v[1,1,0,1]
uint32323232 f65 ^= *(int128 *) (pos62 + 0 + matrix)
v >>= 64
f66 ^= f62
f65 ^= v
uint32323232 f63 ^= *(int128 *) (pos63 + 48 + matrix)
pos66 = pos65
(uint32) pos65 >>= 2
(uint32) pos65 &= mask
uint32323232 f65 ^= *(int128 *) (pos63 + 16 + matrix)
v = f63
uint6464 f63 <<= 3
uint32323232 f64 ^= *(int128 *) (pos63 + 32 + matrix)
uint6464 v >>= 61
f67[0,1,2,3] = v[1,1,0,1]
uint32323232 f66 ^= *(int128 *) (pos63 + 0 + matrix)
v >>= 64
f67 ^= f63
f66 ^= v
uint32323232 f64 ^= *(int128 *) (pos64 + 48 + matrix)
pos67 = pos66
(uint32) pos66 >>= 10
(uint32) pos66 &= mask
uint32323232 f66 ^= *(int128 *) (pos64 + 16 + matrix)
v = f64
uint6464 f64 <<= 3
uint32323232 f65 ^= *(int128 *) (pos64 + 32 + matrix)
uint6464 v >>= 61
f68[0,1,2,3] = v[1,1,0,1]
uint32323232 f67 ^= *(int128 *) (pos64 + 0 + matrix)
v >>= 64
f68 ^= f64
f67 ^= v
uint32323232 f65 ^= *(int128 *) (pos65 + 48 + matrix)
pos68 = pos67
(uint32) pos67 >>= 18
(uint32) pos67 &= mask
uint32323232 f67 ^= *(int128 *) (pos65 + 16 + matrix)
v = f65
uint6464 f65 <<= 3
uint32323232 f66 ^= *(int128 *) (pos65 + 32 + matrix)
uint6464 v >>= 61
f69[0,1,2,3] = v[1,1,0,1]
uint32323232 f68 ^= *(int128 *) (pos65 + 0 + matrix)
v >>= 64
f69 ^= f65
f68 ^= v
uint32323232 f66 ^= *(int128 *) (pos66 + 48 + matrix)
pos69 = pos68
(uint64) pos68 >>= 26
(uint32) pos68 &= mask
assign 7 to pos68
uint32323232 f68 ^= *(int128 *) (pos66 + 16 + matrix)
v = f66
uint6464 f66 <<= 3
uint32323232 f67 ^= *(int128 *) (pos66 + 32 + matrix)
uint6464 v >>= 61
f70[0,1,2,3] = v[1,1,0,1]
uint32323232 f69 ^= *(int128 *) (pos66 + 0 + matrix)
v >>= 64
f70 ^= f66
f69 ^= v
uint32323232 f67 ^= *(int128 *) (pos67 + 48 + matrix)
pos70 = pos69
(uint64) pos69 >>= 34
(uint32) pos69 &= mask
assign 4 to pos69
uint32323232 f69 ^= *(int128 *) (pos67 + 16 + matrix)
v = f67
uint6464 f67 <<= 3
uint32323232 f68 ^= *(int128 *) (pos67 + 32 + matrix)
uint6464 v >>= 61
f71[0,1,2,3] = v[1,1,0,1]
uint32323232 f70 ^= *(int128 *) (pos67 + 0 + matrix)
v >>= 64
f71 ^= f67
f70 ^= v
uint32323232 f68 ^= *(int128 *) (pos68 + 48 + matrix)
pos71 = pos70
(uint64) pos70 >>= 42
(uint32) pos70 &= mask
assign 15 to pos70
uint32323232 f70 ^= *(int128 *) (pos68 + 16 + matrix)
v = f68
uint6464 f68 <<= 3
uint32323232 f69 ^= *(int128 *) (pos68 + 32 + matrix)
uint6464 v >>= 61
f72[0,1,2,3] = v[1,1,0,1]
uint32323232 f71 ^= *(int128 *) (pos68 + 0 + matrix)
pos72 = *(int64 *) (bp + 8)
v >>= 64
f72 ^= f68
f71 ^= v
uint32323232 f69 ^= *(int128 *) (pos69 + 48 + matrix)
(uint64) pos71 >>= 50
(uint32) pos71 &= mask
assign 14 to pos71
uint32323232 f71 ^= *(int128 *) (pos69 + 16 + matrix)
v = f69
uint6464 f69 <<= 3
uint32323232 f70 ^= *(int128 *) (pos69 + 32 + matrix)
uint6464 v >>= 61
f73[0,1,2,3] = v[1,1,0,1]
uint32323232 f72 ^= *(int128 *) (pos69 + 0 + matrix)
v >>= 64
f73 ^= f69
f72 ^= v
uint32323232 f70 ^= *(int128 *) (pos70 + 48 + matrix)
pos73 = pos72
(uint32) pos72 <<= 6
(uint32) pos72 &= mask
uint32323232 f72 ^= *(int128 *) (pos70 + 16 + matrix)
v = f70
uint6464 f70 <<= 3
uint32323232 f71 ^= *(int128 *) (pos70 + 32 + matrix)
uint6464 v >>= 61
f74[0,1,2,3] = v[1,1,0,1]
uint32323232 f73 ^= *(int128 *) (pos70 + 0 + matrix)
v >>= 64
f74 ^= f70
f73 ^= v
uint32323232 f71 ^= *(int128 *) (pos71 + 48 + matrix)
pos74 = pos73
(uint32) pos73 >>= 2
(uint32) pos73 &= mask
uint32323232 f73 ^= *(int128 *) (pos71 + 16 + matrix)
v = f71
uint6464 f71 <<= 3
uint32323232 f72 ^= *(int128 *) (pos71 + 32 + matrix)
uint6464 v >>= 61
f75[0,1,2,3] = v[1,1,0,1]
uint32323232 f74 ^= *(int128 *) (pos71 + 0 + matrix)
v >>= 64
f75 ^= f71
f74 ^= v
uint32323232 f72 ^= *(int128 *) (pos72 + 48 + matrix)
pos75 = pos74
(uint32) pos74 >>= 10
(uint32) pos74 &= mask
uint32323232 f74 ^= *(int128 *) (pos72 + 16 + matrix)
v = f72
uint6464 f72 <<= 3
uint32323232 f73 ^= *(int128 *) (pos72 + 32 + matrix)
uint6464 v >>= 61
f76[0,1,2,3] = v[1,1,0,1]
uint32323232 f75 ^= *(int128 *) (pos72 + 0 + matrix)
v >>= 64
f76 ^= f72
f75 ^= v
uint32323232 f73 ^= *(int128 *) (pos73 + 48 + matrix)
pos76 = pos75
(uint32) pos75 >>= 18
(uint32) pos75 &= mask
uint32323232 f75 ^= *(int128 *) (pos73 + 16 + matrix)
v = f73
uint6464 f73 <<= 3
uint32323232 f74 ^= *(int128 *) (pos73 + 32 + matrix)
uint6464 v >>= 61
f77[0,1,2,3] = v[1,1,0,1]
uint32323232 f76 ^= *(int128 *) (pos73 + 0 + matrix)
v >>= 64
f77 ^= f73
f76 ^= v
uint32323232 f74 ^= *(int128 *) (pos74 + 48 + matrix)
pos77 = pos76
(uint64) pos76 >>= 26
(uint32) pos76 &= mask
assign 7 to pos76
uint32323232 f76 ^= *(int128 *) (pos74 + 16 + matrix)
v = f74
uint6464 f74 <<= 3
uint32323232 f75 ^= *(int128 *) (pos74 + 32 + matrix)
uint6464 v >>= 61
f78[0,1,2,3] = v[1,1,0,1]
uint32323232 f77 ^= *(int128 *) (pos74 + 0 + matrix)
v >>= 64
f78 ^= f74
f77 ^= v
uint32323232 f75 ^= *(int128 *) (pos75 + 48 + matrix)
pos78 = pos77
(uint64) pos77 >>= 34
(uint32) pos77 &= mask
assign 4 to pos77
uint32323232 f77 ^= *(int128 *) (pos75 + 16 + matrix)
v = f75
uint6464 f75 <<= 3
uint32323232 f76 ^= *(int128 *) (pos75 + 32 + matrix)
uint6464 v >>= 61
f79[0,1,2,3] = v[1,1,0,1]
uint32323232 f78 ^= *(int128 *) (pos75 + 0 + matrix)
v >>= 64
f79 ^= f75
f78 ^= v
uint32323232 f76 ^= *(int128 *) (pos76 + 48 + matrix)
pos79 = pos78
(uint64) pos78 >>= 42
(uint32) pos78 &= mask
assign 15 to pos78
uint32323232 f78 ^= *(int128 *) (pos76 + 16 + matrix)
v = f76
uint6464 f76 <<= 3
uint32323232 f77 ^= *(int128 *) (pos76 + 32 + matrix)
uint6464 v >>= 61
f80[0,1,2,3] = v[1,1,0,1]
uint32323232 f79 ^= *(int128 *) (pos76 + 0 + matrix)
pos80 = *(int64 *) (bp + 16)
v >>= 64
f80 ^= f76
f79 ^= v
uint32323232 f77 ^= *(int128 *) (pos77 + 48 + matrix)
(uint64) pos79 >>= 50
(uint32) pos79 &= mask
assign 14 to pos79
uint32323232 f79 ^= *(int128 *) (pos77 + 16 + matrix)
v = f77
uint6464 f77 <<= 3
uint32323232 f78 ^= *(int128 *) (pos77 + 32 + matrix)
uint6464 v >>= 61
f81[0,1,2,3] = v[1,1,0,1]
uint32323232 f80 ^= *(int128 *) (pos77 + 0 + matrix)
v >>= 64
f81 ^= f77
f80 ^= v
uint32323232 f78 ^= *(int128 *) (pos78 + 48 + matrix)
pos81 = pos80
(uint32) pos80 <<= 6
(uint32) pos80 &= mask
uint32323232 f80 ^= *(int128 *) (pos78 + 16 + matrix)
v = f78
uint6464 f78 <<= 3
uint32323232 f79 ^= *(int128 *) (pos78 + 32 + matrix)
uint6464 v >>= 61
f82[0,1,2,3] = v[1,1,0,1]
uint32323232 f81 ^= *(int128 *) (pos78 + 0 + matrix)
v >>= 64
f82 ^= f78
f81 ^= v
uint32323232 f79 ^= *(int128 *) (pos79 + 48 + matrix)
pos82 = pos81
(uint32) pos81 >>= 2
(uint32) pos81 &= mask
uint32323232 f81 ^= *(int128 *) (pos79 + 16 + matrix)
v = f79
uint6464 f79 <<= 3
uint32323232 f80 ^= *(int128 *) (pos79 + 32 + matrix)
uint6464 v >>= 61
f83[0,1,2,3] = v[1,1,0,1]
uint32323232 f82 ^= *(int128 *) (pos79 + 0 + matrix)
v >>= 64
f83 ^= f79
f82 ^= v
uint32323232 f80 ^= *(int128 *) (pos80 + 48 + matrix)
pos83 = pos82
(uint32) pos82 >>= 10
(uint32) pos82 &= mask
uint32323232 f82 ^= *(int128 *) (pos80 + 16 + matrix)
v = f80
uint6464 f80 <<= 3
uint32323232 f81 ^= *(int128 *) (pos80 + 32 + matrix)
uint6464 v >>= 61
f84[0,1,2,3] = v[1,1,0,1]
uint32323232 f83 ^= *(int128 *) (pos80 + 0 + matrix)
v >>= 64
f84 ^= f80
f83 ^= v
uint32323232 f81 ^= *(int128 *) (pos81 + 48 + matrix)
pos84 = pos83
(uint32) pos83 >>= 18
(uint32) pos83 &= mask
uint32323232 f83 ^= *(int128 *) (pos81 + 16 + matrix)
v = f81
uint6464 f81 <<= 3
uint32323232 f82 ^= *(int128 *) (pos81 + 32 + matrix)
uint6464 v >>= 61
f85[0,1,2,3] = v[1,1,0,1]
uint32323232 f84 ^= *(int128 *) (pos81 + 0 + matrix)
v >>= 64
f85 ^= f81
f84 ^= v
uint32323232 f82 ^= *(int128 *) (pos82 + 48 + matrix)
pos85 = pos84
(uint64) pos84 >>= 26
(uint32) pos84 &= mask
assign 7 to pos84
uint32323232 f84 ^= *(int128 *) (pos82 + 16 + matrix)
v = f82
uint6464 f82 <<= 3
uint32323232 f83 ^= *(int128 *) (pos82 + 32 + matrix)
uint6464 v >>= 61
f86[0,1,2,3] = v[1,1,0,1]
uint32323232 f85 ^= *(int128 *) (pos82 + 0 + matrix)
v >>= 64
f86 ^= f82
f85 ^= v
uint32323232 f83 ^= *(int128 *) (pos83 + 48 + matrix)
pos86 = pos85
(uint64) pos85 >>= 34
(uint32) pos85 &= mask
assign 4 to pos85
uint32323232 f85 ^= *(int128 *) (pos83 + 16 + matrix)
v = f83
uint6464 f83 <<= 3
uint32323232 f84 ^= *(int128 *) (pos83 + 32 + matrix)
uint6464 v >>= 61
f87[0,1,2,3] = v[1,1,0,1]
uint32323232 f86 ^= *(int128 *) (pos83 + 0 + matrix)
v >>= 64
f87 ^= f83
f86 ^= v
uint32323232 f84 ^= *(int128 *) (pos84 + 48 + matrix)
pos87 = pos86
(uint64) pos86 >>= 42
(uint32) pos86 &= mask
assign 15 to pos86
uint32323232 f86 ^= *(int128 *) (pos84 + 16 + matrix)
v = f84
uint6464 f84 <<= 3
uint32323232 f85 ^= *(int128 *) (pos84 + 32 + matrix)
uint6464 v >>= 61
f88[0,1,2,3] = v[1,1,0,1]
uint32323232 f87 ^= *(int128 *) (pos84 + 0 + matrix)
pos88 = *(int64 *) (bp + 24)
v >>= 64
f88 ^= f84
f87 ^= v
uint32323232 f85 ^= *(int128 *) (pos85 + 48 + matrix)
(uint64) pos87 >>= 50
(uint32) pos87 &= mask
assign 14 to pos87
uint32323232 f87 ^= *(int128 *) (pos85 + 16 + matrix)
v = f85
uint6464 f85 <<= 3
uint32323232 f86 ^= *(int128 *) (pos85 + 32 + matrix)
uint6464 v >>= 61
f89[0,1,2,3] = v[1,1,0,1]
uint32323232 f88 ^= *(int128 *) (pos85 + 0 + matrix)
v >>= 64
f89 ^= f85
f88 ^= v
uint32323232 f86 ^= *(int128 *) (pos86 + 48 + matrix)
pos89 = pos88
(uint32) pos88 <<= 6
(uint32) pos88 &= mask
uint32323232 f88 ^= *(int128 *) (pos86 + 16 + matrix)
v = f86
uint6464 f86 <<= 3
uint32323232 f87 ^= *(int128 *) (pos86 + 32 + matrix)
uint6464 v >>= 61
f90[0,1,2,3] = v[1,1,0,1]
uint32323232 f89 ^= *(int128 *) (pos86 + 0 + matrix)
v >>= 64
f90 ^= f86
f89 ^= v
uint32323232 f87 ^= *(int128 *) (pos87 + 48 + matrix)
pos90 = pos89
(uint32) pos89 >>= 2
(uint32) pos89 &= mask
uint32323232 f89 ^= *(int128 *) (pos87 + 16 + matrix)
v = f87
uint6464 f87 <<= 3
uint32323232 f88 ^= *(int128 *) (pos87 + 32 + matrix)
uint6464 v >>= 61
f91[0,1,2,3] = v[1,1,0,1]
uint32323232 f90 ^= *(int128 *) (pos87 + 0 + matrix)
v >>= 64
f91 ^= f87
f90 ^= v
uint32323232 f88 ^= *(int128 *) (pos88 + 48 + matrix)
pos91 = pos90
(uint32) pos90 >>= 10
(uint32) pos90 &= mask
uint32323232 f90 ^= *(int128 *) (pos88 + 16 + matrix)
v = f88
uint6464 f88 <<= 3
uint32323232 f89 ^= *(int128 *) (pos88 + 32 + matrix)
uint6464 v >>= 61
f92[0,1,2,3] = v[1,1,0,1]
uint32323232 f91 ^= *(int128 *) (pos88 + 0 + matrix)
v >>= 64
f92 ^= f88
f91 ^= v
uint32323232 f89 ^= *(int128 *) (pos89 + 48 + matrix)
pos92 = pos91
(uint32) pos91 >>= 18
(uint32) pos91 &= mask
uint32323232 f91 ^= *(int128 *) (pos89 + 16 + matrix)
v = f89
uint6464 f89 <<= 3
uint32323232 f90 ^= *(int128 *) (pos89 + 32 + matrix)
uint6464 v >>= 61
f93[0,1,2,3] = v[1,1,0,1]
uint32323232 f92 ^= *(int128 *) (pos89 + 0 + matrix)
v >>= 64
f93 ^= f89
f92 ^= v
uint32323232 f90 ^= *(int128 *) (pos90 + 48 + matrix)
pos93 = pos92
(uint64) pos92 >>= 26
(uint32) pos92 &= mask
assign 7 to pos92
uint32323232 f92 ^= *(int128 *) (pos90 + 16 + matrix)
v = f90
uint6464 f90 <<= 3
uint32323232 f91 ^= *(int128 *) (pos90 + 32 + matrix)
uint6464 v >>= 61
f94[0,1,2,3] = v[1,1,0,1]
uint32323232 f93 ^= *(int128 *) (pos90 + 0 + matrix)
v >>= 64
f94 ^= f90
f93 ^= v
uint32323232 f91 ^= *(int128 *) (pos91 + 48 + matrix)
pos94 = pos93
(uint64) pos93 >>= 34
(uint32) pos93 &= mask
assign 4 to pos93
uint32323232 f93 ^= *(int128 *) (pos91 + 16 + matrix)
v = f91
uint6464 f91 <<= 3
uint32323232 f92 ^= *(int128 *) (pos91 + 32 + matrix)
uint6464 v >>= 61
f95[0,1,2,3] = v[1,1,0,1]
uint32323232 f94 ^= *(int128 *) (pos91 + 0 + matrix)
v >>= 64
f95 ^= f91
f94 ^= v
uint32323232 f92 ^= *(int128 *) (pos92 + 48 + matrix)
pos95 = pos94
(uint64) pos94 >>= 42
(uint32) pos94 &= mask
assign 15 to pos94
uint32323232 f94 ^= *(int128 *) (pos92 + 16 + matrix)
v = f92
uint6464 f92 <<= 3
uint32323232 f93 ^= *(int128 *) (pos92 + 32 + matrix)
uint6464 v >>= 61
f96[0,1,2,3] = v[1,1,0,1]
uint32323232 f95 ^= *(int128 *) (pos92 + 0 + matrix)
pos96 = *(int64 *) (bp + 32)
v >>= 64
f96 ^= f92
f95 ^= v
uint32323232 f93 ^= *(int128 *) (pos93 + 48 + matrix)
(uint64) pos95 >>= 50
(uint32) pos95 &= mask
assign 14 to pos95
uint32323232 f95 ^= *(int128 *) (pos93 + 16 + matrix)
v = f93
uint6464 f93 <<= 3
uint32323232 f94 ^= *(int128 *) (pos93 + 32 + matrix)
uint6464 v >>= 61
f97[0,1,2,3] = v[1,1,0,1]
uint32323232 f96 ^= *(int128 *) (pos93 + 0 + matrix)
v >>= 64
f97 ^= f93
f96 ^= v
uint32323232 f94 ^= *(int128 *) (pos94 + 48 + matrix)
pos97 = pos96
(uint32) pos96 <<= 6
(uint32) pos96 &= mask
uint32323232 f96 ^= *(int128 *) (pos94 + 16 + matrix)
v = f94
uint6464 f94 <<= 3
uint32323232 f95 ^= *(int128 *) (pos94 + 32 + matrix)
uint6464 v >>= 61
f98[0,1,2,3] = v[1,1,0,1]
uint32323232 f97 ^= *(int128 *) (pos94 + 0 + matrix)
v >>= 64
f98 ^= f94
f97 ^= v
uint32323232 f95 ^= *(int128 *) (pos95 + 48 + matrix)
pos98 = pos97
(uint32) pos97 >>= 2
(uint32) pos97 &= mask
uint32323232 f97 ^= *(int128 *) (pos95 + 16 + matrix)
v = f95
uint6464 f95 <<= 3
uint32323232 f96 ^= *(int128 *) (pos95 + 32 + matrix)
uint6464 v >>= 61
f99[0,1,2,3] = v[1,1,0,1]
uint32323232 f98 ^= *(int128 *) (pos95 + 0 + matrix)
v >>= 64
f99 ^= f95
f98 ^= v
uint32323232 f96 ^= *(int128 *) (pos96 + 48 + matrix)
pos99 = pos98
(uint32) pos98 >>= 10
(uint32) pos98 &= mask
uint32323232 f98 ^= *(int128 *) (pos96 + 16 + matrix)
v = f96
uint6464 f96 <<= 3
uint32323232 f97 ^= *(int128 *) (pos96 + 32 + matrix)
uint6464 v >>= 61
f100[0,1,2,3] = v[1,1,0,1]
uint32323232 f99 ^= *(int128 *) (pos96 + 0 + matrix)
v >>= 64
f100 ^= f96
f99 ^= v
uint32323232 f97 ^= *(int128 *) (pos97 + 48 + matrix)
pos100 = pos99
(uint32) pos99 >>= 18
(uint32) pos99 &= mask
uint32323232 f99 ^= *(int128 *) (pos97 + 16 + matrix)
v = f97
uint6464 f97 <<= 3
uint32323232 f98 ^= *(int128 *) (pos97 + 32 + matrix)
uint6464 v >>= 61
f101[0,1,2,3] = v[1,1,0,1]
uint32323232 f100 ^= *(int128 *) (pos97 + 0 + matrix)
v >>= 64
f101 ^= f97
f100 ^= v
uint32323232 f98 ^= *(int128 *) (pos98 + 48 + matrix)
pos101 = pos100
(uint64) pos100 >>= 26
(uint32) pos100 &= mask
assign 7 to pos100
uint32323232 f100 ^= *(int128 *) (pos98 + 16 + matrix)
v = f98
uint6464 f98 <<= 3
uint32323232 f99 ^= *(int128 *) (pos98 + 32 + matrix)
uint6464 v >>= 61
f102[0,1,2,3] = v[1,1,0,1]
uint32323232 f101 ^= *(int128 *) (pos98 + 0 + matrix)
v >>= 64
f102 ^= f98
f101 ^= v
uint32323232 f99 ^= *(int128 *) (pos99 + 48 + matrix)
pos102 = pos101
(uint64) pos101 >>= 34
(uint32) pos101 &= mask
assign 4 to pos101
uint32323232 f101 ^= *(int128 *) (pos99 + 16 + matrix)
v = f99
uint6464 f99 <<= 3
uint32323232 f100 ^= *(int128 *) (pos99 + 32 + matrix)
uint6464 v >>= 61
f103[0,1,2,3] = v[1,1,0,1]
uint32323232 f102 ^= *(int128 *) (pos99 + 0 + matrix)
v >>= 64
f103 ^= f99
f102 ^= v
uint32323232 f100 ^= *(int128 *) (pos100 + 48 + matrix)
pos103 = pos102
(uint64) pos102 >>= 42
(uint32) pos102 &= mask
assign 15 to pos102
uint32323232 f102 ^= *(int128 *) (pos100 + 16 + matrix)
v = f100
uint6464 f100 <<= 3
uint32323232 f101 ^= *(int128 *) (pos100 + 32 + matrix)
uint6464 v >>= 61
f104[0,1,2,3] = v[1,1,0,1]
uint32323232 f103 ^= *(int128 *) (pos100 + 0 + matrix)
pos104 = *(int64 *) (bp + 40)
v >>= 64
f104 ^= f100
f103 ^= v
uint32323232 f101 ^= *(int128 *) (pos101 + 48 + matrix)
(uint64) pos103 >>= 50
(uint32) pos103 &= mask
assign 14 to pos103
uint32323232 f103 ^= *(int128 *) (pos101 + 16 + matrix)
v = f101
uint6464 f101 <<= 3
uint32323232 f102 ^= *(int128 *) (pos101 + 32 + matrix)
uint6464 v >>= 61
f105[0,1,2,3] = v[1,1,0,1]
uint32323232 f104 ^= *(int128 *) (pos101 + 0 + matrix)
v >>= 64
f105 ^= f101
f104 ^= v
uint32323232 f102 ^= *(int128 *) (pos102 + 48 + matrix)
pos105 = pos104
(uint32) pos104 <<= 6
(uint32) pos104 &= mask
uint32323232 f104 ^= *(int128 *) (pos102 + 16 + matrix)
v = f102
uint6464 f102 <<= 3
uint32323232 f103 ^= *(int128 *) (pos102 + 32 + matrix)
uint6464 v >>= 61
f106[0,1,2,3] = v[1,1,0,1]
uint32323232 f105 ^= *(int128 *) (pos102 + 0 + matrix)
v >>= 64
f106 ^= f102
f105 ^= v
uint32323232 f103 ^= *(int128 *) (pos103 + 48 + matrix)
pos106 = pos105
(uint32) pos105 >>= 2
(uint32) pos105 &= mask
uint32323232 f105 ^= *(int128 *) (pos103 + 16 + matrix)
v = f103
uint6464 f103 <<= 3
uint32323232 f104 ^= *(int128 *) (pos103 + 32 + matrix)
uint6464 v >>= 61
f107[0,1,2,3] = v[1,1,0,1]
uint32323232 f106 ^= *(int128 *) (pos103 + 0 + matrix)
v >>= 64
f107 ^= f103
f106 ^= v
uint32323232 f104 ^= *(int128 *) (pos104 + 48 + matrix)
pos107 = pos106
(uint32) pos106 >>= 10
(uint32) pos106 &= mask
uint32323232 f106 ^= *(int128 *) (pos104 + 16 + matrix)
v = f104
uint6464 f104 <<= 3
uint32323232 f105 ^= *(int128 *) (pos104 + 32 + matrix)
uint6464 v >>= 61
f108[0,1,2,3] = v[1,1,0,1]
uint32323232 f107 ^= *(int128 *) (pos104 + 0 + matrix)
v >>= 64
f108 ^= f104
f107 ^= v
uint32323232 f105 ^= *(int128 *) (pos105 + 48 + matrix)
pos108 = pos107
(uint32) pos107 >>= 18
(uint32) pos107 &= mask
uint32323232 f107 ^= *(int128 *) (pos105 + 16 + matrix)
v = f105
uint6464 f105 <<= 3
uint32323232 f106 ^= *(int128 *) (pos105 + 32 + matrix)
uint6464 v >>= 61
f109[0,1,2,3] = v[1,1,0,1]
uint32323232 f108 ^= *(int128 *) (pos105 + 0 + matrix)
v >>= 64
f109 ^= f105
f108 ^= v
uint32323232 f106 ^= *(int128 *) (pos106 + 48 + matrix)
pos109 = pos108
(uint64) pos108 >>= 26
(uint32) pos108 &= mask
assign 7 to pos108
uint32323232 f108 ^= *(int128 *) (pos106 + 16 + matrix)
v = f106
uint6464 f106 <<= 3
uint32323232 f107 ^= *(int128 *) (pos106 + 32 + matrix)
uint6464 v >>= 61
f110[0,1,2,3] = v[1,1,0,1]
uint32323232 f109 ^= *(int128 *) (pos106 + 0 + matrix)
v >>= 64
f110 ^= f106
f109 ^= v
uint32323232 f107 ^= *(int128 *) (pos107 + 48 + matrix)
pos110 = pos109
(uint64) pos109 >>= 34
(uint32) pos109 &= mask
assign 4 to pos109
uint32323232 f109 ^= *(int128 *) (pos107 + 16 + matrix)
v = f107
uint6464 f107 <<= 3
uint32323232 f108 ^= *(int128 *) (pos107 + 32 + matrix)
uint6464 v >>= 61
f111[0,1,2,3] = v[1,1,0,1]
uint32323232 f110 ^= *(int128 *) (pos107 + 0 + matrix)
v >>= 64
f111 ^= f107
f110 ^= v
uint32323232 f108 ^= *(int128 *) (pos108 + 48 + matrix)
pos111 = pos110
(uint64) pos110 >>= 42
(uint32) pos110 &= mask
assign 15 to pos110
uint32323232 f110 ^= *(int128 *) (pos108 + 16 + matrix)
v = f108
uint6464 f108 <<= 3
uint32323232 f109 ^= *(int128 *) (pos108 + 32 + matrix)
uint6464 v >>= 61
f112[0,1,2,3] = v[1,1,0,1]
uint32323232 f111 ^= *(int128 *) (pos108 + 0 + matrix)
v >>= 64
f112 ^= f108
f111 ^= v
uint32323232 f109 ^= *(int128 *) (pos109 + 48 + matrix)
(uint64) pos111 >>= 50
(uint32) pos111 &= mask
assign 14 to pos111
uint32323232 f111 ^= *(int128 *) (pos109 + 16 + matrix)
v = f109
uint6464 f109 <<= 3
uint32323232 f110 ^= *(int128 *) (pos109 + 32 + matrix)
uint6464 v >>= 61
f113[0,1,2,3] = v[1,1,0,1]
uint32323232 f112 ^= *(int128 *) (pos109 + 0 + matrix)
v >>= 64
f113 ^= f109
f112 ^= v
uint32323232 f110 ^= *(int128 *) (pos110 + 48 + matrix)
uint32323232 f112 ^= *(int128 *) (pos110 + 16 + matrix)
v = f110
uint6464 f110 <<= 3
uint32323232 f111 ^= *(int128 *) (pos110 + 32 + matrix)
uint6464 v >>= 61
f114[0,1,2,3] = v[1,1,0,1]
uint32323232 f113 ^= *(int128 *) (pos110 + 0 + matrix)
v >>= 64
f114 ^= f110
f113 ^= v
uint32323232 f111 ^= *(int128 *) (pos111 + 48 + matrix)
uint32323232 f113 ^= *(int128 *) (pos111 + 16 + matrix)
uint32323232 f112 ^= *(int128 *) (pos111 + 32 + matrix)
uint32323232 f114 ^= *(int128 *) (pos111 + 0 + matrix)
v = f111
uint6464 v >>= 61
v >>= 64
f114 ^= v
f111 &= crypto_hashblocks_rfsb509_amd64_1_MASK125
state3 = f111
state2 = f112
state1 = f113
state0 = f114

bp += 48
                  unsigned<? blen -= 48
goto mainloop if !unsigned<

done:

rp = rp_stack

v = state0
*(unaligned int128 *) (rp + 0) = v
v = state1
*(unaligned int128 *) (rp + 16) = v
v = state2
*(unaligned int128 *) (rp + 32) = v
v = state3
*(unaligned int128 *) (rp + 48) = v

c1 = c1_stack
c2 = c2_stack
c3 = c3_stack
c4 = c4_stack
c5 = c5_stack
c6 = c6_stack
c7 = c7_stack

int64 result
result = blen + 48
assign outputreg 0 to result

leave
