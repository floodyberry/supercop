int128 a0
int128 a1
int128 a2
int128 a3
int128 a4

int128 b0
int128 b1
int128 b2
int128 b3
int128 b4

int128 _2a0
int128 _2a1
int128 _2a2
int128 _2a3
int128 _2a4


int128 r0
int128 r1
int128 r2
int128 r3
int128 r4

int128 r5


int128 t
int128 mask25
int128 mask26

int32 adr0
int32 adr1
int32 adr2

int32 count


stack128 mask25_stack
int32 ptr25

stack128 caller_q4_stack
stack128 caller_q5_stack
stack128 caller_q6_stack
stack128 caller_q7_stack


qpushenter mul

#count = 10000
#loop:
#count -= 1
#unsigned>? count - 0
#goto loop if unsigned>

ptr25 = &mask25_stack

2x mask25 = 0xffffffff
4x mask25 <<= 7
2x mask25 unsigned>> = 7

2x mask26 = 0xffffffff
4x mask26 <<= 6
2x mask26 unsigned>> = 6

mem128[ptr25] = mask25

####


adr1 = input_1
a0 = mem128[adr1]; adr1+=16
a1 = mem128[adr1]; adr1+=16
a2 = mem128[adr1]; adr1+=16

2x _2a0 = a0 << 1
2x _2a1 = a1 << 1
2x _2a2 = a2 << 1


adr2 = input_2
b0 = mem128[adr2]; adr2+=16
b1 = mem128[adr2]; adr2+=16
b2 = mem128[adr2]; adr2+=16


## First half ##

r0[0,1]  =   a0[0] unsigned* b0[0]; r0[2,3]  =   a0[1] unsigned* b0[1]		#   a0 b0
r1[0,1]  =   a0[2] unsigned* b0[0]; r1[2,3]  =   a0[3] unsigned* b0[1]		#   a1 b0
r2[0,1]  =   a1[0] unsigned* b0[0]; r2[2,3]  =   a1[1] unsigned* b0[1]		#   a2 b0
r3[0,1]  =   a1[2] unsigned* b0[0]; r3[2,3]  =   a1[3] unsigned* b0[1]		#   a3 b0
r4[0,1]  =   a2[0] unsigned* b0[0]; r4[2,3]  =   a2[1] unsigned* b0[1]		#   a4 b0

r0[0,1] += _2a2[0] unsigned* b0[2]; r0[2,3] += _2a2[1] unsigned* b0[3]		# 2 a4 b1
r1[0,1] +=   a0[0] unsigned* b0[2]; r1[2,3] +=   a0[1] unsigned* b0[3]		#   a0 b1
r2[0,1] += _2a0[2] unsigned* b0[2]; r2[2,3] += _2a0[3] unsigned* b0[3]		# 2 a1 b1
r3[0,1] +=   a1[0] unsigned* b0[2]; r3[2,3] +=   a1[1] unsigned* b0[3]		#   a2 b1
r4[0,1] += _2a1[2] unsigned* b0[2]; r4[2,3] += _2a1[3] unsigned* b0[3]		# 2 a3 b1

r0[0,1] += _2a1[2] unsigned* b1[0]; r0[2,3] += _2a1[3] unsigned* b1[1]		# 2 a3 b2
r1[0,1] +=   a2[0] unsigned* b1[0]; r1[2,3] +=   a2[1] unsigned* b1[1]		#   a4 b2
r2[0,1] +=   a0[0] unsigned* b1[0]; r2[2,3] +=   a0[1] unsigned* b1[1]		#   a0 b2
r3[0,1] +=   a0[2] unsigned* b1[0]; r3[2,3] +=   a0[3] unsigned* b1[1]		#   a1 b2
r4[0,1] +=   a1[0] unsigned* b1[0]; r4[2,3] +=   a1[1] unsigned* b1[1]		#   a2 b2

r0[0,1] += _2a1[0] unsigned* b1[2]; r0[2,3] += _2a1[1] unsigned* b1[3]		# 2 a2 b3
r1[0,1] += _2a1[2] unsigned* b1[2]; r1[2,3] += _2a1[3] unsigned* b1[3]		# 2 a3 b3
r2[0,1] += _2a2[0] unsigned* b1[2]; r2[2,3] += _2a2[1] unsigned* b1[3]		# 2 a4 b3
r3[0,1] +=   a0[0] unsigned* b1[2]; r3[2,3] +=   a0[1] unsigned* b1[3]		#   a0 b3
r4[0,1] += _2a0[2] unsigned* b1[2]; r4[2,3] += _2a0[3] unsigned* b1[3]		# 2 a1 b3

r0[0,1] += _2a0[2] unsigned* b2[0]; r0[2,3] += _2a0[3] unsigned* b2[1]		# 2 a1 b4
r1[0,1] +=   a1[0] unsigned* b2[0]; r1[2,3] +=   a1[1] unsigned* b2[1]		#   a2 b4
r2[0,1] += _2a1[2] unsigned* b2[0]; r2[2,3] += _2a1[3] unsigned* b2[1]		# 2 a3 b4
r3[0,1] +=   a2[0] unsigned* b2[0]; r3[2,3] +=   a2[1] unsigned* b2[1]		#   a4 b4
r4[0,1] +=   a0[0] unsigned* b2[0]; r4[2,3] +=   a0[1] unsigned* b2[1]		#   a0 b4


# carry #

2x t = r0 unsigned>> 26
2x r1 += t
r0 &= mask26

2x t = r1 unsigned>> 25
2x r2 += t
r1 &= mask25

2x t = r2 unsigned>> 26
2x r3 += t
r2 &= mask26

2x t = r3 unsigned>> 25
2x r4 += t
r3 &= mask25

2x t = r4 unsigned>> 25
2x r0 += t
r4 &= mask25
#--
2x t = r0 unsigned>> 26
2x r1 += t
r0 &= mask26


# arrange #

r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
r0 = r0[0,2,1,3]
r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
r2 = r2[0,2,1,3]


adr0 = input_0
mem128[adr0] = r0; adr0+=16
mem128[adr0] = r2; adr0+=16

####


## Second half ##

a3 = mem128[adr1]; adr1+=16
a4 = mem128[adr1]; adr1+=16

2x _2a3 = a3 << 1
2x _2a4 = a4 << 1

b3 = mem128[adr2]; adr2+=16
b4 = mem128[adr2]; adr2+=16

r0[0,1]  =   a3[0] unsigned* b3[0]; r0[2,3]  =   a3[1] unsigned* b3[1]		#   c0 d0
r1[0,1]  =   a3[2] unsigned* b3[0]; r1[2,3]  =   a3[3] unsigned* b3[1]		#   c1 d0
r2[0,1]  =   a4[0] unsigned* b3[0]; r2[2,3]  =   a4[1] unsigned* b3[1]		#   c2 d0
r3[0,1]  =   a4[2] unsigned* b3[0]; r3[2,3]  =   a4[3] unsigned* b3[1]		#   c3 d0
r5[0,1]  =   a2[2] unsigned* b3[0]; r5[2,3]  =   a2[3] unsigned* b3[1]		#   c4 d0

r0[0,1] += _2a2[2] unsigned* b3[2]; r0[2,3] += _2a2[3] unsigned* b3[3]		# 2 c4 d1
r1[0,1] +=   a3[0] unsigned* b3[2]; r1[2,3] +=   a3[1] unsigned* b3[3]		#   c0 d1
r2[0,1] += _2a3[2] unsigned* b3[2]; r2[2,3] += _2a3[3] unsigned* b3[3]		# 2 c1 d1
r3[0,1] +=   a4[0] unsigned* b3[2]; r3[2,3] +=   a4[1] unsigned* b3[3]		#   c2 d1
r5[0,1] += _2a4[2] unsigned* b3[2]; r5[2,3] += _2a4[3] unsigned* b3[3]		# 2 c3 d1

r0[0,1] += _2a4[2] unsigned* b4[0]; r0[2,3] += _2a4[3] unsigned* b4[1]		# 2 c3 d2
r1[0,1] +=   a2[2] unsigned* b4[0]; r1[2,3] +=   a2[3] unsigned* b4[1]		#   c4 d2
r2[0,1] +=   a3[0] unsigned* b4[0]; r2[2,3] +=   a3[1] unsigned* b4[1]		#   c0 d2
r3[0,1] +=   a3[2] unsigned* b4[0]; r3[2,3] +=   a3[3] unsigned* b4[1]		#   c1 d2
r5[0,1] +=   a4[0] unsigned* b4[0]; r5[2,3] +=   a4[1] unsigned* b4[1]		#   c2 d2

r0[0,1] += _2a4[0] unsigned* b4[2]; r0[2,3] += _2a4[1] unsigned* b4[3]		# 2 c2 d3
r1[0,1] += _2a4[2] unsigned* b4[2]; r1[2,3] += _2a4[3] unsigned* b4[3]		# 2 c3 d3
r2[0,1] += _2a2[2] unsigned* b4[2]; r2[2,3] += _2a2[3] unsigned* b4[3]		# 2 c4 d3
r3[0,1] +=   a3[0] unsigned* b4[2]; r3[2,3] +=   a3[1] unsigned* b4[3]		#   c0 d3
r5[0,1] += _2a3[2] unsigned* b4[2]; r5[2,3] += _2a3[3] unsigned* b4[3]		# 2 c1 d3

r0[0,1] += _2a3[2] unsigned* b2[2]; r0[2,3] += _2a3[3] unsigned* b2[3]		# 2 c1 d4
r1[0,1] +=   a4[0] unsigned* b2[2]; r1[2,3] +=   a4[1] unsigned* b2[3]		#   c2 d4
r2[0,1] += _2a4[2] unsigned* b2[2]; r2[2,3] += _2a4[3] unsigned* b2[3]		# 2 c3 d4
r3[0,1] +=   a2[2] unsigned* b2[2]; r3[2,3] +=   a2[3] unsigned* b2[3]		#   c4 d4
r5[0,1] +=   a3[0] unsigned* b2[2]; r5[2,3] +=   a3[1] unsigned* b2[3]		#   c0 d4


# carry #

mask25 = mem128[ptr25]

2x t = r0 unsigned>> 26
2x r1 += t
r0 &= mask26

2x t = r1 unsigned>> 25
2x r2 += t
r1 &= mask25

2x t = r2 unsigned>> 26
2x r3 += t
r2 &= mask26

2x t = r3 unsigned>> 25
2x r5 += t
r3 &= mask25

2x t = r5 unsigned>> 25
2x r0 += t
r5 &= mask25
#--
2x t = r0 unsigned>> 26
2x r1 += t
r0 &= mask26



# arrange #

r0 r1 = r0[0]r1[0]r0[2]r1[2] r0[1]r1[1]r0[3]r1[3]
r0 = r0[0,2,1,3]
r2 r3 = r2[0]r3[0]r2[2]r3[2] r2[1]r3[1]r2[3]r3[3]
r2 = r2[0,2,1,3]

r4 r5 = r4[0]r5[0]r4[2]r5[2] r4[1]r5[1]r4[3]r5[3]
r4 = r4[0,2,1,3]

####



mem128[adr0] = r4; adr0+=16
mem128[adr0] = r0; adr0+=16
mem128[adr0] = r2; adr0+=16


qpopreturn
