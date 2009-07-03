# Author: Peter Schwabe
# Public domain
# 2009-06-02

int64 statep

input statep

int64 bidx
int64 k
int64 l
int64 index
int64 i
int64 temp
int64 bufferp
int64 syndromep 
int64 t0
int64 t1
int64 t2
int64 t3

int6464 s0
int6464 s1
int6464 s2
int6464 s3
int6464 s4
int6464 s5
int6464 s6
int6464 s7

int6464 s0t
int6464 s1t
int6464 s2t
int6464 s3t
int6464 s4t
int6464 s5t
int6464 s6t
int6464 s7t


@define xor1024(i) \
index = $ i << 14 $;\
(uint8) index ^= *(uint8 *)(syndromep + i);\
;\
k = $ (i * 6) >> 3 $;\
l = $ 16 - 6 - ((i * 6) & 7) $;\
;\
t0 = *(uint8 *)(bufferp + k);\
t0 <<= 8;\
(uint8) t0 ^= *(uint8 *)(bufferp + k + 1);\
(uint64) t0 >>= l;\
(uint32) t0 &= 0x3f;\
t0 <<= 8;\
index ^= t0;\
bidx = index;\
(uint32) bidx >>= 10;\
(uint32) index &= 1023;\
t0 = bidx * 2088;\
t1 = index ;\
(uint32) t1 &= 7;\
t1 = t1 * 261;\
t2 = 128;\
t3 = index;\
(uint32) t3 >>= 3;\
t2 -= t3;\
;\
temp = &fsb256_first_line;\
temp += t0;\
temp += t1;\
temp += t2;\
;\
(unaligned) s0t = *(int128 *)(temp + 0);\
(unaligned) s1t = *(int128 *)(temp + 16);\
(unaligned) s2t = *(int128 *)(temp + 32);\
(unaligned) s3t = *(int128 *)(temp + 48);\
(unaligned) s4t = *(int128 *)(temp + 64);\
(unaligned) s5t = *(int128 *)(temp + 80);\
(unaligned) s6t = *(int128 *)(temp + 96);\
(unaligned) s7t = *(int128 *)(temp + 112);\
s0 ^= s0t;\
s1 ^= s1t;\
s2 ^= s2t;\
s3 ^= s3t;\
s4 ^= s4t;\
s5 ^= s5t;\
s6 ^= s6t;\
s7 ^= s7t;\

enter performHash256

syndromep = *(uint64 *)(statep + 0)
bufferp = *(uint64 *)(statep + 16)

i = 0
s0 = 0
s1 = 0
s2 = 0
s3 = 0
s4 = 0
s5 = 0
s6 = 0
s7 = 0

xor1024(0)
xor1024(1)
xor1024(2)
xor1024(3)
xor1024(4)
xor1024(5)
xor1024(6)
xor1024(7)
xor1024(8)
xor1024(9)
xor1024(10)
xor1024(11)
xor1024(12)
xor1024(13)
xor1024(14)
xor1024(15)
xor1024(16)
xor1024(17)
xor1024(18)
xor1024(19)
xor1024(20)
xor1024(21)
xor1024(22)
xor1024(23)
xor1024(24)
xor1024(25)
xor1024(26)
xor1024(27)
xor1024(28)
xor1024(29)
xor1024(30)
xor1024(31)
xor1024(32)
xor1024(33)
xor1024(34)
xor1024(35)
xor1024(36)
xor1024(37)
xor1024(38)
xor1024(39)
xor1024(40)
xor1024(41)
xor1024(42)
xor1024(43)
xor1024(44)
xor1024(45)
xor1024(46)
xor1024(47)
xor1024(48)
xor1024(49)
xor1024(50)
xor1024(51)
xor1024(52)
xor1024(53)
xor1024(54)
xor1024(55)
xor1024(56)
xor1024(57)
xor1024(58)
xor1024(59)
xor1024(60)
xor1024(61)
xor1024(62)
xor1024(63)
xor1024(64)
xor1024(65)
xor1024(66)
xor1024(67)
xor1024(68)
xor1024(69)
xor1024(70)
xor1024(71)
xor1024(72)
xor1024(73)
xor1024(74)
xor1024(75)
xor1024(76)
xor1024(77)
xor1024(78)
xor1024(79)
xor1024(80)
xor1024(81)
xor1024(82)
xor1024(83)
xor1024(84)
xor1024(85)
xor1024(86)
xor1024(87)
xor1024(88)
xor1024(89)
xor1024(90)
xor1024(91)
xor1024(92)
xor1024(93)
xor1024(94)
xor1024(95)
xor1024(96)
xor1024(97)
xor1024(98)
xor1024(99)
xor1024(100)
xor1024(101)
xor1024(102)
xor1024(103)
xor1024(104)
xor1024(105)
xor1024(106)
xor1024(107)
xor1024(108)
xor1024(109)
xor1024(110)
xor1024(111)
xor1024(112)
xor1024(113)
xor1024(114)
xor1024(115)
xor1024(116)
xor1024(117)
xor1024(118)
xor1024(119)
xor1024(120)
xor1024(121)
xor1024(122)
xor1024(123)
xor1024(124)
xor1024(125)
xor1024(126)
xor1024(127)

*(int128 *)(syndromep + 0) = s0
*(int128 *)(syndromep + 16) = s1
*(int128 *)(syndromep + 32) = s2
*(int128 *)(syndromep + 48) = s3
*(int128 *)(syndromep + 64) = s4
*(int128 *)(syndromep + 80) = s5
*(int128 *)(syndromep + 96) = s6
*(int128 *)(syndromep + 112) = s7

*(uint32 *)(statep + 24) = 0

leave
