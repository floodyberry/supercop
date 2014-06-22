int32 adr0	# x3 y3 z3 t3
int32 adr1	# x2 y2 z2 t2
int32 adr2	#  1  x  y  z
int32 adr3	# stepconst (128) , hadstepconst (128)
int32 adr4
int32 adr5

int32 count
int32 idx
int32 shf
int32 bit
int32 swap
int32 prevbit
int128 c

int128 sum0
int128 sum1
int128 dif0
int128 dif1
int128 neg1
int128 neg2
int128 copy

int128 suma0
int128 difa0
int128 suma1
int128 difa1

int128 rst0
int128 rst1
int128 rst2
int128 rst3
int128 rst4

int128 a0
int128 a1
int128 a2
int128 a3
int128 a4

int128 _2a0
int128 _2a1
int128 _2a2
int128 _2a3
int128 _2a4

int128 b0
int128 b1
int128 b2
int128 b3
int128 b4

int128 _2b0
int128 _2b1
int128 _2b2
int128 _2b3
int128 _2b4

int128 c0

int128 h0
int128 h1
int128 h2
int128 h3
int128 h4
int128 h5

int128 k0
int128 k1
int128 k2
int128 k3
int128 k4
int128 k5

int128 _2k0
int128 _2k2
int128 _2k4

int128 p0
int128 p1
int128 p2
int128 p3
int128 p4
int128 p5

int128 q0
int128 q1
int128 q2
int128 q3
int128 q4
int128 q5

int128 n0
int128 n1
int128 n2

int128 na0
int128 na1

int128 t
int128 t0
int128 t1
int128 t2
int128 t3
int128 t4

int128 mask25
int128 mask26

int128 _27
int128 _28
int128 _29_28
int128 _28_27_28_27


qpushenter loop

stack32 stack_r4
stack32 stack_r5
stack32 stack_r6
stack32 stack_r7
stack32 stack_r8
stack32 stack_r9
stack32 stack_r10
stack32 stack_r11
stack32 stack_r12
stack32 stack_r14

stack_r4 = caller_r4
stack_r5 = caller_r5
stack_r6 = caller_r6
stack_r7 = caller_r7
stack_r8 = caller_r8
stack_r9 = caller_r9
stack_r10 = caller_r10
stack_r11 = caller_r11
stack_r12 = caller_r12
stack_r14 = caller_r14

#-------------------------------

count = 0xff
prevbit = 0
count ^= 0x5

looptop:

adr4 = input_4
		adr1 = input_1 + 16
		adr0 = input_1 + 64
idx = (count unsigned>> 5)
  shf = count & 0x1f
idx <<= 2
adr4 += idx
		adr2 = input_1
		adr3 = input_1 + 48
bit = mem32[adr4]

bit unsigned>> = shf	### latency
bit &= 0x1		### latency
swap = bit ^ prevbit	### latency
prevbit = bit 		### latency
bit = swap ^ 0x1
bit -= 1


#==========#
# Hadamard #
#==========#

#---------------#
## x2 y2 z2 t2 ##
## x3 y3 z3 t3 ##
#---------------#

b1 aligned = mem128[adr1]
b4 aligned = mem128[adr0]	# use adr0 instead of adr1

4x sum1 = b1 + b4
b0 aligned = mem128[adr2]	# use adr2 instead of adr1


	adr0 = input_0 + 16
	adr1 = input_0 + 64
adr2 = input_1 + 32
4x dif1 = b1 - b4
b3 aligned = mem128[adr3]	# use adr3 instead of adr1

4x sum0 = b0 + b3
	a1 aligned = mem128[adr0]
4x dif0 = b0 - b3
	a4 aligned = mem128[adr1]	# use adr1 instead of adr0

	adr0 = input_0
	adr1 = input_0 + 32	

sum1 dif1 = sum1[0]dif1[0]sum1[2]dif1[2]sum1[1]dif1[1]sum1[3]dif1[3]	


b2 aligned = mem128[adr2]	# use adr2 instead of adr1

	a0 aligned = mem128[adr0]
	a2 aligned = mem128[adr1]; adr1 += 16	# use adr1 instead of adr0
	a3 aligned = mem128[adr1]		# use adr1 instead of adr0

	4x suma1 = a1 + a4
sum1 b2 = sum1[0]b2[0] sum1[1]b2[1]
	4x difa1 = a1 - a4
dif1 b2 = dif1[0]b2[1] b2[0]dif1[1]


sum0 dif0 = sum0[0]dif0[0]sum0[2]dif0[2]sum0[1]dif0[1]sum0[3]dif0[3]			### 1 cycle

4x b1 = sum1 + dif1									### 1 cycle
	suma1 difa1 = suma1[0]difa1[0]suma1[2]difa1[2] suma1[1]difa1[1]suma1[3]difa1[3]	### 1 cycle
4x b4 = sum1 - dif1									### 1 cycle

	4x suma0 = a0 + a3
b1 b2 = b2[0]b1[1] b1[0]b2[1]	

4x b0 = sum0 + dif0
	suma1 a2 = suma1[0]a2[0] suma1[1]a2[1]

4x b3 = sum0 - dif0
b2 b4 = b2[0]b4[0] b2[1]b4[1]

adr5 = input_5
b1 b4 = b1[0]b1[1]b1[2]b4[2] b4[0]b4[1]b1[3]b4[3]
	4x difa0 = a0 - a3

adr5 += 48
	a2 difa1 = a2[0]difa1[1] difa1[0]a2[1]
4x sum1 = b1 + b4

4x dif1 = b1 - b4
_29_28 aligned = mem128[adr5]

adr5 -= 16

adr0 = input_1
adr1 = input_1 + 48
adr2 = input_1 + 32


4x b0 += _29_28
_28    aligned = mem128[adr5]


4x b3 += _29_28
sum1 dif1 = sum1[0]dif1[0] sum1[1]dif1[1]	### latency

4x dif1 += _28					### latency
b2 sum1 = b2[0]sum1[0] b2[1]sum1[1]

4x b2   += _29_28
mem128[adr0] aligned = b0	# use adr0 instead of adr1

4x sum1 += _29_28
mem128[adr1] aligned = b3


adr5 = input_5

#adr1 = input_1
#mem128[adr1] aligned = b0
#adr1 = input_1 + 48
#mem128[adr1] aligned = b3
#adr1 = input_1 + 32
#mem128[adr1] aligned = dif1
#adr1 = input_1 + 16
#mem128[adr1] aligned = b2
#adr1 = input_1 + 64
#mem128[adr1] aligned = sum1


adr3 = input_1 + 16
adr4 = input_1 + 64



4x a1 = suma1 + difa1
mem128[adr2] aligned = dif1	# use adr2 instead of adr1

4x a4 = suma1 - difa1
mem128[adr3] aligned = b2	# use adr3 instead of adr1

suma0 difa0 = suma0[0]difa0[0]suma0[2]difa0[2] suma0[1]difa0[1]suma0[3]difa0[3]

mem128[adr4] aligned = sum1	# use adr4 instead of adr1

4x a0 = suma0 + difa0
a1 a2 = a2[0]a1[1] a1[0]a2[1]

4x a3 = suma0 - difa0
a2 a4 = a2[0]a4[0] a2[1]a4[1]

a1 a4 = a1[0]a1[1]a1[2]a4[2] a4[0]a4[1]a1[3]a4[3]

adr0 = input_0 + 48
	adr1 = input_1

4x suma1 = a1 + a4		### latency
mask25 aligned = mem128[adr5]; adr5+=16

4x difa1 = a1 - a4
mask26 aligned = mem128[adr5]; adr5+=16

	b0 aligned = mem128[adr1]; adr1+=16


a2 suma1 = a2[0]suma1[0] a2[1]suma1[1]	### latency
4x a3 = a3 + _29_28

suma1 difa1 = suma1[0]difa1[0] suma1[1]difa1[1]
4x a0 = a0 + _29_28

4x a4 = suma1 + _29_28


4x a1 = a2 + _29_28
mem128[adr0] aligned = a3; adr0+=16

4x a2 = difa1 + _28
mem128[adr0] aligned = a4; adr0+=16	### latency



##############################################################


#=============#
# First Input #
# x3 y3 z3 t3 #
#=============#

	adr0 = input_1 + 48
	b1 aligned = mem128[adr1]; adr1+=16
	b3 aligned = mem128[adr0]		# use adr0 instead of adr1
	adr0 -= 16


## First half ##

#---------------------------------------#
# Multiplication                        #
# x3 y3 z3 t3 = x3*x2 y3*y2 z3*z2 t3*t2 #
#---------------------------------------#

h3[0,1]  =   b1[2] unsigned* a0[0]; h3[2,3]  =   b1[3] unsigned* a0[1]
h3[0,1] +=   b1[0] unsigned* a0[2]; h3[2,3] +=   b1[1] unsigned* a0[3]

2x _2b1 = b1 + b1
b0 b3 = b0[0]b3[0] b0[1]b3[1]

h1[0,1]  =   b1[0] unsigned* a2[0]; h1[2,3]  =   b1[1] unsigned* a2[1]
h4[0,1]  =   b1[0] unsigned* a1[0]; h4[2,3]  =   b1[1] unsigned* a1[1]

2x _2b0 = b3 + b3
b2 aligned = mem128[adr0]			# use adr0 instead of adr1

h2[0,1]  =   b1[0] unsigned* a0[0]; h2[2,3]  =   b1[1] unsigned* a0[1]

h1[0,1] +=   b2[0] unsigned* a1[0]; h1[2,3] +=   b2[1] unsigned* a1[1]

2x _2b2 = b2 + b2
b0 b3 = b0[0]b3[0] b0[1]b3[1]

h4[0,1] +=   b2[0] unsigned* a0[0]; h4[2,3] +=   b2[1] unsigned* a0[1]
h4[0,1] += _2b1[2] unsigned* a0[2]; h4[2,3] += _2b1[3] unsigned* a0[3]
h4[0,1] += _2b0[0] unsigned* a1[2]; h4[2,3] += _2b0[1] unsigned* a1[3]
h4[0,1] +=   b0[0] unsigned* a2[0]; h4[2,3] +=   b0[1] unsigned* a2[1]

h0[0,1]  = _2b1[2] unsigned* a1[0]; h0[2,3]  = _2b1[3] unsigned* a1[1]
h0[0,1] += _2b1[0] unsigned* a1[2]; h0[2,3] += _2b1[1] unsigned* a1[3]
h0[0,1] += _2b2[0] unsigned* a0[2]; h0[2,3] += _2b2[1] unsigned* a0[3]
h0[0,1] +=   b0[0] unsigned* a0[0]; h0[2,3] +=   b0[1] unsigned* a0[1]
h0[0,1] += _2b0[0] unsigned* a2[0]; h0[2,3] += _2b0[1] unsigned* a2[1]

h1[0,1] += _2b1[2] unsigned* a1[2]; h1[2,3] += _2b1[3] unsigned* a1[3]
h2[0,1] += _2b1[2] unsigned* a2[0]; h2[2,3] += _2b1[3] unsigned* a2[1]


2x t = h4 unsigned>> 25
h4 &= mask25

h1[0,1] +=   b0[2] unsigned* a0[0]; h1[2,3] +=   b0[3] unsigned* a0[1]
2x h0 += t
h1[0,1] +=   b0[0] unsigned* a0[2]; h1[2,3] +=   b0[1] unsigned* a0[3]

2x t = h0 unsigned>> 26
h0 &= mask26

h2[0,1] += _2b2[0] unsigned* a1[2]; h2[2,3] += _2b2[1] unsigned* a1[3]
2x h1 += t
h2[0,1] +=   b0[0] unsigned* a1[0]; h2[2,3] +=   b0[1] unsigned* a1[1]
h2[0,1] += _2b0[0] unsigned* a0[2]; h2[2,3] += _2b0[1] unsigned* a0[3]

2x t = h1 unsigned>> 25
h1 &= mask25

h3[0,1] +=   b2[0] unsigned* a2[0]; h3[2,3] +=   b2[1] unsigned* a2[1]
2x h2 += t
h3[0,1] +=   b0[2] unsigned* a1[0]; h3[2,3] +=   b0[3] unsigned* a1[1]
h3[0,1] +=   b0[0] unsigned* a1[2]; h3[2,3] +=   b0[1] unsigned* a1[3]


## serial carry && cmov ##

2x t = h2 unsigned>> 26
h2 &= mask26

#bit = input_4
t0 = a0 ^ b0
t1 = a1 ^ b1
2x h3 += t

#bit -= 1
4x c = bit

t0 &= c

2x t = h3 unsigned>> 25
h3 &= mask25

adr1 = input_1

b0 ^= t0
t2 = a2 ^ b2
2x h4 += t

t1 &= c
t2 &= c
mem128[adr1] aligned = b0; adr1+=16

2x t = h4 unsigned>> 25
	adr0 = input_0 + 48
	a3 aligned = mem128[adr0]; adr0+=16

h4 &= mask25
	a4 aligned = mem128[adr0]; adr0+=16

b1 ^= t1
	adr1 = input_1 + 48
	b3 aligned = mem128[adr1]; adr1+=16

t2 ^= b2
h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]

2x h0 += t
h4 = h4[0,2,1,3]

b2 = t2[0,1]b2[2,3]



##############################################################


## Second half ##

#---------------------------------------#
# Multiplication                        #
# x3 y3 z3 t3 = x3*x2 y3*y2 z3*z2 t3*t2 #
#---------------------------------------#


b4 aligned = mem128[adr1]; adr1+=16

adr1 = input_1 + 16

2x _2b4 = b4 + b4
mem128[adr1] aligned = b1; adr1+=16


k5[0,1]  =   b2[2] unsigned* a3[0]; k5[2,3]  =   b2[3] unsigned* a3[1]
a2 = h4[0]a2[1]	
h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
k5[0,1] += _2b4[2] unsigned* a3[2]; k5[2,3] += _2b4[3] unsigned* a3[3]
h2 = h2[0,2,1,3]
k5[0,1] +=   b4[0] unsigned* a4[0]; k5[2,3] +=   b4[1] unsigned* a4[1]
h0 = h0[0,2,1,3]
mem128[adr1] aligned = b2; adr1+=16
k5[0,1] += _2b0[2] unsigned* a4[2]; k5[2,3] += _2b0[3] unsigned* a4[3]
k5[0,1] +=   b3[0] unsigned* a2[2]; k5[2,3] +=   b3[1] unsigned* a2[3]


k0[0,1]  =   b3[0] unsigned* a3[0]; k0[2,3]  =   b3[1] unsigned* a3[1]
k0[0,1] += _2b2[2] unsigned* a3[2]; k0[2,3] += _2b2[3] unsigned* a3[3]
k0[0,1] += _2b4[2] unsigned* a4[0]; k0[2,3] += _2b4[3] unsigned* a4[1]
k0[0,1] += _2b4[0] unsigned* a4[2]; k0[2,3] += _2b4[1] unsigned* a4[3]
k0[0,1] += _2b0[2] unsigned* a2[2]; k0[2,3] += _2b0[3] unsigned* a2[3]

k2[0,1]  = _2b2[2] unsigned* a4[2]; k2[2,3]  = _2b2[3] unsigned* a4[3]

adr0 = input_0
2x t = k5 unsigned>> 25
mem128[adr0] aligned = h0; adr0+=16
k5 &= mask25
mem128[adr0] aligned = h2; adr0+=16

k1[0,1]  =   b3[2] unsigned* a3[0]; k1[2,3]  =   b3[3] unsigned* a3[1]
2x k0 += t
k1[0,1] +=   b3[0] unsigned* a3[2]; k1[2,3] +=   b3[1] unsigned* a3[3]
k1[0,1] +=   b2[2] unsigned* a4[0]; k1[2,3] +=   b2[3] unsigned* a4[1]
k1[0,1] += _2b4[2] unsigned* a4[2]; k1[2,3] += _2b4[3] unsigned* a4[3]
k1[0,1] +=   b4[0] unsigned* a2[2]; k1[2,3] +=   b4[1] unsigned* a2[3]

adr5 = input_5
adr5 += 16
2x t = k0 unsigned>> 26
mask26 aligned = mem128[adr5]
k0 &= mask26
mem128[adr0] aligned = a2; adr0+=16

k2[0,1] +=   b4[0] unsigned* a3[0]; k2[2,3] +=   b4[1] unsigned* a3[1]
2x k1 += t
k2[0,1] += _2b0[2] unsigned* a3[2]; k2[2,3] += _2b0[3] unsigned* a3[3]
k2[0,1] +=   b3[0] unsigned* a4[0]; k2[2,3] +=   b3[1] unsigned* a4[1]
k2[0,1] += _2b4[2] unsigned* a2[2]; k2[2,3] += _2b4[3] unsigned* a2[3]

2x t = k1 unsigned>> 25
k1 &= mask25

k3[0,1]  =   b4[2] unsigned* a3[0]; k3[2,3]  =   b4[3] unsigned* a3[1]
2x k2 += t
k3[0,1] +=   b4[0] unsigned* a3[2]; k3[2,3] +=   b4[1] unsigned* a3[3]
k3[0,1] +=   b3[2] unsigned* a4[0]; k3[2,3] +=   b3[3] unsigned* a4[1]
k3[0,1] +=   b3[0] unsigned* a4[2]; k3[2,3] +=   b3[1] unsigned* a4[3]
k3[0,1] +=   b2[2] unsigned* a2[2]; k3[2,3] +=   b2[3] unsigned* a2[3]


## serial carry ##

2x t = k2 unsigned>> 26
k2 &= mask26

#bit = input_4
t3  = a3 ^ b3
t4  = a4 ^ b4

2x k3 += t

#bit -= 1
4x c = bit

t3 &= c

2x t = k3 unsigned>> 25
k3 &= mask25

b3 ^= t3
t2  = a2 ^ b2

2x k5 +=t

t2 &= c
t4 &= c

	adr1 = input_1 + 48
	mem128[adr1] aligned = b3; adr1+=16

	adr0 = input_0
2x t = k5 unsigned>> 25
	a0 aligned = mem128[adr0]; adr0+=16
k5 &= mask25
	a1 aligned = mem128[adr0]; adr0+=16

	adr3 = input_3 + 16
	c0 aligned = mem128[adr3]

t2 ^= b2
b4 ^= t4
k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]


2x k0 += t
k5 = k5[0,2,1,3]


	p4[0,1]  =   a2[0] unsigned* c0[0]; p4[2,3]  =   a2[1] unsigned* c0[1]
mem128[adr1] aligned = b4; adr1+=16

##############################################################


#---------------#
# Mul by Const2 #
#---------------#


p0[0,1]  =   a0[0] unsigned* c0[0]; p0[2,3]  =   a0[1] unsigned* c0[1]
p1[0,1]  =   a0[2] unsigned* c0[0]; p1[2,3]  =   a0[3] unsigned* c0[1]

a2 = a2[0]k5[0]
b2  = b2[0,1]t2[2,3]

2x t = p4 unsigned>> 25
k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]

p4 &= mask25
k2 = k2[0,2,1,3]

2x p0 += t
k0 = k0[0,2,1,3]

p2[0,1]  =   a1[0] unsigned* c0[0]; p2[2,3]  =   a1[1] unsigned* c0[1]

2x t = p0 unsigned>> 26
p0 &= mask26

adr1 = input_1 + 32
mem128[adr1] aligned = b2; adr1+=16

2x p1 += t

adr0 = input_0 + 32
mem128[adr0] aligned = a2; adr0+=16

p3[0,1]  =   a1[2] unsigned* c0[0]; p3[2,3]  =   a1[3] unsigned* c0[1]

2x t = p1 unsigned>> 25
mem128[adr0] aligned = k0; adr0+=16
p1 &= mask25
mem128[adr0] aligned = k2; adr0+=16

	q5[0,1]  =   a2[2] unsigned* c0[2]; q5[2,3]  =   a2[3] unsigned* c0[3]

2x p2 += t
p0 p1 = p0[0]p1[0]p0[2]p1[2] p0[1]p1[1]p0[3]p1[3]



##############################################################


#---------------#
# Mul by Const2 #
#---------------#




#--

adr5 = input_5
adr5 += 80
_28_27_28_27 aligned = mem128[adr5]
2x t = p2 unsigned>> 26 #p
p2 &= mask26 #p

4x na0 = _28_27_28_27 - p0 #p
2x p3 += t #p

q0[0,1]  =   k0[0] unsigned* c0[2]; q0[2,3]  =   k0[1] unsigned* c0[3]
2x t = p3 unsigned>> 25 #p
p3 &= mask25 #p

2x t2 = q5 unsigned>> 25
q5 &= mask25
2x q0 += t2

q1[0,1]  =   k0[2] unsigned* c0[2]; q1[2,3]  =   k0[3] unsigned* c0[3]

2x p4 += t #p
p2 p3 = p2[0]p3[0]p2[2]p3[2] p2[1]p3[1]p2[3]p3[3] #p


2x t2 = q0 unsigned>> 26
q0 &= mask26

q2[0,1]  =   k2[0] unsigned* c0[2]; q2[2,3]  =   k2[1] unsigned* c0[3]
4x na1 = _28_27_28_27 - p2 #p
2x q1 += t2

q3[0,1]  =   k2[2] unsigned* c0[2]; q3[2,3]  =   k2[3] unsigned* c0[3]

# negate #
2x t2 = q1 unsigned>> 25
q1 &= mask25
2x q2 += t2

na0 = p0[0]na0[1] #p
na1 = p2[0]na1[1] #p


q0 q1 = q0[0]q1[0]q0[2]q1[2] q0[1]q1[1]q0[3]q1[3]
2x t2 = q2 unsigned>> 26

na0 = na0[0,2,1,3] #p
q2 &= mask26

4x n0 = _28_27_28_27 - q0 #qq

2x q3 += t2
na1 = na1[0,2,1,3] #p

## serial carry ##

	adr5 = input_5
	adr5 += 64
	_27 aligned = mem128[adr5]; adr5+=16
	_28_27_28_27 aligned = mem128[adr5]


2x t2 = q3 unsigned>> 25
q3 &= mask25
2x q5 += t2


##----------------##



# arrange #

q2 q3 = q2[0]q3[0]q2[2]q3[2] q2[1]q3[1]q2[3]q3[3]	# latency
p4 q5 = p4[0]q5[0]p4[2]q5[2] p4[1]q5[1]p4[3]q5[3]


# negate #

4x n1 = _28_27_28_27 - q2 #qq
4x n2 = _27 - p4 #qq			# latency

n0 = n0[0,2,1,3] #qq
n1 = n1[0,2,1,3] #qq




adr0 = input_0 + 48



## Hadamard ## ----------------------------------------------------

## x3 y3 z3 t3 ##

q0 = n2[1,2,3]p4[0] #qq		# prev.
4x sum1 = na1 + n1
mem128[adr0] = n0; adr0+=16	# prev. mul const 2
p4 = q0[3]q0[0,1,2] #qq		# prev.
4x dif1 = na1 - n1
mem128[adr0] = n1; adr0+=16	# prev. mul const 2
p4 = p4[0,2,1,3] #qq		# prev.

sum1 dif1 = sum1[0]dif1[0]sum1[2]dif1[2] sum1[1]dif1[1]sum1[3]dif1[3]

4x sum0 = na0 + n0
sum1 p4 = sum1[0]p4[0] sum1[1]p4[1]
4x dif0 = na0 - n0
p4 dif1 = p4[0]dif1[1] dif1[0]p4[1]

4x a1 = sum1 + dif1
4x a4 = sum1 - dif1

sum0 dif0 = sum0[0]dif0[0]sum0[2]dif0[2] sum0[1]dif0[1]sum0[3]dif0[3]

4x a0 = sum0 + dif0
a1 p4 = p4[0]a1[1] a1[0]p4[1]

4x a3 = sum0 - dif0
p4 a4 = p4[0]a4[0] p4[1]a4[1]

a1 a4 = a1[0]a1[1]a1[2]a4[2] a4[0]a4[1]a1[3]a4[3]

adr5 = input_5
adr5 += 32

4x sum1 = a1 + a4
_28 aligned = mem128[adr5]; adr5+=16

4x dif1 = a1 - a4
_29_28 aligned = mem128[adr5]


p4 sum1 = p4[0]sum1[0] p4[1]sum1[1]
4x a0 = a0 + _29_28

sum1 dif1 = sum1[0]dif1[0] sum1[1]dif1[1]
4x a3 = a3 + _29_28

4x a4 = sum1 + _29_28
4x a1 = p4 + _29_28
4x a2 = dif1 + _28




#=============#
# First Input #
# x3 y3 z3 t3 #
#=============#


## First half ##

a0 a3 = a0[0]a3[0] a0[1]a3[1]
2x _2a1 = a1 + a1
2x _2a2 = a2 + a2
2x _2a0 = a3 + a3
a0 a3 = a0[0]a3[0] a0[1]a3[1]
2x _2a4 = a4 + a4

#----------#
# Squaring #
#----------#

h3[0,1]  =   a2[0] unsigned*   a2[0]; h3[2,3]  =   a2[1] unsigned*   a2[1]
h3[0,1] += _2a1[2] unsigned*   a0[0]; h3[2,3] += _2a1[3] unsigned*   a0[1]
h3[0,1] += _2a1[0] unsigned*   a0[2]; h3[2,3] += _2a1[1] unsigned*   a0[3]

h4[0,1]  =   a1[0] unsigned*   a1[0]; h4[2,3]  =   a1[1] unsigned*   a1[1]
h4[0,1] += _2a2[0] unsigned*   a0[0]; h4[2,3] += _2a2[1] unsigned*   a0[1]
h4[0,1] += _2a1[2] unsigned* _2a0[0]; h4[2,3] += _2a1[3] unsigned* _2a0[1]

2x t = h3 unsigned>> 25
h3 &= mask25

h0[0,1]  =   a0[0] unsigned*   a0[0]; h0[2,3]  =   a0[1] unsigned*   a0[1]
2x h4 += t
h0[0,1] += _2a2[0] unsigned* _2a0[0]; h0[2,3] += _2a2[1] unsigned* _2a0[1]
h0[0,1] += _2a1[2] unsigned* _2a1[0]; h0[2,3] += _2a1[3] unsigned* _2a1[1]

2x t = h4 unsigned>> 25
h4 &= mask25

h1[0,1]  = _2a1[2] unsigned*   a1[2]; h1[2,3]  = _2a1[3] unsigned*   a1[3]
2x h0 += t
h1[0,1] += _2a0[0] unsigned*   a0[0]; h1[2,3] += _2a0[1] unsigned*   a0[1]
h1[0,1] += _2a2[0] unsigned*   a1[0]; h1[2,3] += _2a2[1] unsigned*   a1[1]

2x t = h0 unsigned>> 26
h0 &= mask26

h2[0,1]  = _2a0[0] unsigned*   a0[2]; h2[2,3]  = _2a0[1] unsigned*   a0[3]
2x h1 += t
h2[0,1] += _2a1[0] unsigned*   a0[0]; h2[2,3] += _2a1[1] unsigned*   a0[1]
h2[0,1] += _2a2[0] unsigned* _2a1[2]; h2[2,3] += _2a2[1] unsigned* _2a1[3]

2x t = h1 unsigned>> 25
h1 &= mask25

	k3[0,1]  =   a2[2] unsigned*   a2[2]; k3[2,3]  =   a2[3] unsigned*   a2[3]
2x h2 += t
h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
	k3[0,1] += _2a4[2] unsigned*   a3[0]; k3[2,3] += _2a4[3] unsigned*   a3[1]
	k3[0,1] += _2a4[0] unsigned*   a3[2]; k3[2,3] += _2a4[1] unsigned*   a3[3]

2x t = h2 unsigned>> 26
h2 &= mask26
h0 = h0[0,2,1,3]

	k4[0,1]  =   a4[0] unsigned*   a4[0]; k4[2,3]  =   a4[1] unsigned*   a4[1]
2x h3 += t
	k4[0,1] += _2a2[2] unsigned*   a3[0]; k4[2,3] += _2a2[3] unsigned*   a3[1]
	k4[0,1] += _2a4[2] unsigned* _2a0[2]; k4[2,3] += _2a4[3] unsigned* _2a0[3]

2x t = h3 unsigned>> 25
h3 &= mask25

adr0 = input_0
mem128[adr0] aligned = h0; adr0+=16

	k0[0,1]  =   a3[0] unsigned*   a3[0]; k0[2,3]  =   a3[1] unsigned*   a3[1]
2x h4 += t
	2x t2 = k3 unsigned>> 25
h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
	k3 &= mask25

	k0[0,1] += _2a2[2] unsigned* _2a0[2]; k0[2,3] += _2a2[3] unsigned* _2a0[3]
	2x k4 += t2
h4 = h4[0,2,1,3]
	k0[0,1] += _2a4[2] unsigned* _2a4[0]; k0[2,3] += _2a4[3] unsigned* _2a4[1]
	2x t2 = k4 unsigned>> 25
h2 = h2[0,2,1,3]


# arrange #

	k4 &= mask25

a2 = h4[0]a2[1]
mem128[adr0] aligned = h2; adr0+=16

#----------#
# Squaring #
#----------#


k1[0,1]  = _2a4[2] unsigned*   a4[2]; k1[2,3]  = _2a4[3] unsigned*   a4[3]	
2x k0 += t2
k1[0,1] += _2a0[2] unsigned*   a3[0]; k1[2,3] += _2a0[3] unsigned*   a3[1]
k1[0,1] += _2a2[2] unsigned*   a4[0]; k1[2,3] += _2a2[3] unsigned*   a4[1]

2x t2 = k0 unsigned>> 26
k0 &= mask26

k2[0,1]  = _2a0[2] unsigned*   a3[2]; k2[2,3]  = _2a0[3] unsigned*   a3[3]
2x k1 += t2
k2[0,1] += _2a4[0] unsigned*   a3[0]; k2[2,3] += _2a4[1] unsigned*   a3[1]
k2[0,1] += _2a2[2] unsigned* _2a4[2]; k2[2,3] += _2a2[3] unsigned* _2a4[3]

2x t2 = k1 unsigned>> 25

	adr2 = input_2
	b0 aligned = mem128[adr2]; adr2+=16

k1 &= mask25

	adr0 = input_0
	a0 aligned = mem128[adr0]; adr0+=16

	h1[0,1]  =   a0[2] unsigned* b0[0]; h1[2,3]  =   a0[3] unsigned* b0[1]	

2x k2 += t2
k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]

	h1[0,1] +=   a0[0] unsigned* b0[2]; h1[2,3] +=   a0[1] unsigned* b0[3]	

2x t2 = k2 unsigned>> 26
k0 = k0[0,2,1,3]
k2 &= mask26

	adr0 = input_0 + 16
	a1 aligned = mem128[adr0]; adr0+=16

	h0[0,1]  =   a0[0] unsigned* b0[0]; h0[2,3]  =   a0[1] unsigned* b0[1]


2x k3 += t2

adr0 = input_0 + 48
mem128[adr0] aligned = k0; adr0+=16

	h3[0,1]  =   a1[2] unsigned* b0[0]; h3[2,3]  =   a1[3] unsigned* b0[1]	
	h3[0,1] +=   a1[0] unsigned* b0[2]; h3[2,3] +=   a1[1] unsigned* b0[3]

2x t2 = k3 unsigned>> 25
k3 &= mask25
	a0 k0 = a0[0]k0[0] a0[1]k0[1]

	2x _2a1 = a1 + a1
	b1 aligned = mem128[adr2]; adr2+=16

	h3[0,1] +=   k0[0] unsigned* b1[0]; h3[2,3] +=   k0[1] unsigned* b1[1]	

2x k4 += t2
k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]

	h3[0,1] +=   a0[0] unsigned* b1[2]; h3[2,3] +=   a0[1] unsigned* b1[3]
	2x _2a0 = k0 + k0
k4 = k4[0,2,1,3]


k2 = k2[0,2,1,3]

	h2[0,1]  =   a1[0] unsigned* b0[0]; h2[2,3]  =   a1[1] unsigned* b0[1]	

a2 = a2[0]k4[0]

adr0 = input_0 + 64
mem128[adr0] aligned = k2; adr0+=16

	2x _2a2 = a2 + a2
	a0 k0 = a0[0]k0[0] a0[1]k0[1]

	adr2 = input_2 + 32
	b2 aligned = mem128[adr2]; adr2+=16

adr0 = input_0 + 32
mem128[adr0] aligned = a2; adr0+=16	# prev. sqr
mem128[adr0] aligned = k0; adr0+=16	# prev. sqr


#----------------#
# Multiplication #
#----------------#

h3[0,1] +=   a2[0] unsigned* b2[0]; h3[2,3] +=   a2[1] unsigned* b2[1]	

h4[0,1]  =   a2[0] unsigned* b0[0]; h4[2,3]  =   a2[1] unsigned* b0[1]
h4[0,1] += _2a1[2] unsigned* b0[2]; h4[2,3] += _2a1[3] unsigned* b0[3]
h4[0,1] +=   a1[0] unsigned* b1[0]; h4[2,3] +=   a1[1] unsigned* b1[1]
h4[0,1] += _2a0[0] unsigned* b1[2]; h4[2,3] += _2a0[1] unsigned* b1[3]
h4[0,1] +=   a0[0] unsigned* b2[0]; h4[2,3] +=   a0[1] unsigned* b2[1]

2x t  = h3 unsigned>> 25
h3 &= mask25

h0[0,1] += _2a2[0] unsigned* b0[2]; h0[2,3] += _2a2[1] unsigned* b0[3]
2x h4 += t
h0[0,1] += _2a1[2] unsigned* b1[0]; h0[2,3] += _2a1[3] unsigned* b1[1]	
h0[0,1] += _2a1[0] unsigned* b1[2]; h0[2,3] += _2a1[1] unsigned* b1[3]
h0[0,1] += _2a0[0] unsigned* b2[0]; h0[2,3] += _2a0[1] unsigned* b2[1]

2x t = h4 unsigned>> 25
h4 &= mask25

h1[0,1] +=   a2[0] unsigned* b1[0]; h1[2,3] +=   a2[1] unsigned* b1[1]	
2x h0 += t
adr5 = input_5
adr5 += 16
mask26 aligned = mem128[adr5]
h1[0,1] += _2a1[2] unsigned* b1[2]; h1[2,3] += _2a1[3] unsigned* b1[3]	
h1[0,1] +=   a1[0] unsigned* b2[0]; h1[2,3] +=   a1[1] unsigned* b2[1]

2x t = h0 unsigned>> 26
h0 &= mask26

h2[0,1] += _2a0[0] unsigned* b0[2]; h2[2,3] += _2a0[1] unsigned* b0[3]	
2x h1 += t
h2[0,1] +=   a0[0] unsigned* b1[0]; h2[2,3] +=   a0[1] unsigned* b1[1]	
h2[0,1] += _2a2[0] unsigned* b1[2]; h2[2,3] += _2a2[1] unsigned* b1[3]
h2[0,1] += _2a1[2] unsigned* b2[0]; h2[2,3] += _2a1[3] unsigned* b2[1]


## serial carry ##

2x t = h1 unsigned>> 25
h1 &= mask25

	k3[0,1]  =   a2[2] unsigned* b2[2]; k3[2,3]  =   a2[3] unsigned* b2[3]	

2x h2 += t
h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]

	k0[0,1]  = _2a0[2] unsigned* b2[2]; k0[2,3]  = _2a0[3] unsigned* b2[3]	

2x t = h2 unsigned>> 26
h0 = h0[0,2,1,3]

h2 &= mask26

	adr2 = input_2 + 48
	b3 aligned = mem128[adr2]; adr2+=16

2x h3 += t

adr0 = input_0
mem128[adr0] aligned = h0; adr0+=16

	k0[0,1] += _2a2[2] unsigned* b3[2]; k0[2,3] += _2a2[3] unsigned* b3[3]

2x t = h3 unsigned>> 25
	adr0 = input_0 + 48
	a3 aligned = mem128[adr0]; adr0+=16

h3 &= mask25
	a4 aligned = mem128[adr0]; adr0+=16

	k4[0,1]  =   a2[2] unsigned* b3[0]; k4[2,3]  =   a2[3] unsigned* b3[1]	

2x h4 += t
h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]


	2x _2a4 = a4 + a4
b4 aligned = mem128[adr2]; adr2+=16

	k3[0,1] +=   a4[2] unsigned* b3[0]; k3[2,3] +=   a4[3] unsigned* b3[1]	



#----------------#
# Multiplication #
#----------------#

h2 = h2[0,2,1,3]

k3[0,1] +=   a4[0] unsigned* b3[2]; k3[2,3] +=   a4[1] unsigned* b3[3]	
k3[0,1] +=   a3[2] unsigned* b4[0]; k3[2,3] +=   a3[3] unsigned* b4[1]
k3[0,1] +=   a3[0] unsigned* b4[2]; k3[2,3] +=   a3[1] unsigned* b4[3]

k4[0,1] += _2a4[2] unsigned* b3[2]; k4[2,3] += _2a4[3] unsigned* b3[3]
k4[0,1] +=   a4[0] unsigned* b4[0]; k4[2,3] +=   a4[1] unsigned* b4[1]
k4[0,1] += _2a0[2] unsigned* b4[2]; k4[2,3] += _2a0[3] unsigned* b4[3]	
k4[0,1] +=   a3[0] unsigned* b2[2]; k4[2,3] +=   a3[1] unsigned* b2[3]

k2[0,1]  = _2a2[2] unsigned* b4[2]; k2[2,3]  = _2a2[3] unsigned* b4[3]
k2[0,1] += _2a0[2] unsigned* b3[2]; k2[2,3] += _2a0[3] unsigned* b3[3]

2x t2 = k3 unsigned>> 25
k3 &= mask25

adr0 = input_0 + 16			# prev.
mem128[adr0] aligned = h2; adr0+=16	# prev.

k0[0,1] +=   a3[0] unsigned* b3[0]; k0[2,3] +=   a3[1] unsigned* b3[1]	
2x k4 += t2
k0[0,1] += _2a4[2] unsigned* b4[0]; k0[2,3] += _2a4[3] unsigned* b4[1]
k0[0,1] += _2a4[0] unsigned* b4[2]; k0[2,3] += _2a4[1] unsigned* b4[3]

2x t2 = k4 unsigned>> 25
k4 &= mask25

k1[0,1]  =   a3[2] unsigned* b3[0]; k1[2,3]  =   a3[3] unsigned* b3[1]	
2x k0 += t2
k1[0,1] +=   a3[0] unsigned* b3[2]; k1[2,3] +=   a3[1] unsigned* b3[3]
k1[0,1] +=   a2[2] unsigned* b4[0]; k1[2,3] +=   a2[3] unsigned* b4[1]
k1[0,1] += _2a4[2] unsigned* b4[2]; k1[2,3] += _2a4[3] unsigned* b4[3]
k1[0,1] +=   a4[0] unsigned* b2[2]; k1[2,3] +=   a4[1] unsigned* b2[3]

2x t2 = k0 unsigned>> 26
k0 &= mask26

k2[0,1] +=   a4[0] unsigned* b3[0]; k2[2,3] +=   a4[1] unsigned* b3[1]	
2x k1 += t2
k2[0,1] +=   a3[0] unsigned* b4[0]; k2[2,3] +=   a3[1] unsigned* b4[1]
k2[0,1] += _2a4[2] unsigned* b2[2]; k2[2,3] += _2a4[3] unsigned* b2[3]

## serial carry ##

2x t2 = k1 unsigned>> 25
	adr1 = input_1
	b0 aligned = mem128[adr1]; adr1+=16

k1 &= mask25
	b1 aligned = mem128[adr1]; adr1+=16

	adr1 = input_1 + 48
	b3 aligned = mem128[adr1]; adr1+=16

	h0[0,1]  =   b0[0] unsigned*   b0[0]; h0[2,3]  =   b0[1] unsigned*   b0[1]	

2x k2 += t2
k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]

	h5[0,1]  =   b1[0] unsigned*   b1[0]; h5[2,3]  =   b1[1] unsigned*   b1[1]	

2x t2 = k2 unsigned>> 26
	b0 b3 = b0[0]b3[0] b0[1]b3[1]
k2 &= mask26
k0 = k0[0,2,1,3]
2x k3 += t2

	adr1 = input_1 + 32
	b2 aligned = mem128[adr1]; adr1+=16
	h3[0,1]  =   b2[0] unsigned*   b2[0]; h3[2,3]  =   b2[1] unsigned*   b2[1]	

2x t2 = k3 unsigned>> 25
k3 &= mask25

	2x _2b0 = b3 + b3
	2x _2b1 = b1 + b1

adr0 = input_0 + 48
mem128[adr0] aligned = k0; adr0+=16

2x k4 += t2
k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]

##----------------##

	2x _2b2 = b2 + b2
	b0 b3 = b0[0]b3[0] b0[1]b3[1]
	h0[0,1] += _2b1[2] unsigned* _2b1[0]; h0[2,3] += _2b1[3] unsigned* _2b1[1]	

	h0[0,1] += _2b2[0] unsigned* _2b0[0]; h0[2,3] += _2b2[1] unsigned* _2b0[1]	
	h1[0,1]  = _2b1[2] unsigned*   b1[2]; h1[2,3]  = _2b1[3] unsigned*   b1[3]

	h1[0,1] += _2b0[0] unsigned*   b0[0]; h1[2,3] += _2b0[1] unsigned*   b0[1]	
	h1[0,1] += _2b2[0] unsigned*   b1[0]; h1[2,3] += _2b2[1] unsigned*   b1[1]


	adr5 = input_5
	adr5 += 16
	mask26 aligned = mem128[adr5]
	2x t = h0 unsigned>> 26
k2 = k2[0,2,1,3]
	h0 &= mask26
h4 k4 = h4[0]k4[0]h4[2]k4[2] h4[1]k4[1]h4[3]k4[3]

mem128[adr0] aligned = k2; adr0+=16

	h2[0,1]  = _2b0[0] unsigned*   b0[2]; h2[2,3]  = _2b0[1] unsigned*   b0[3]	

	2x h1 += t
h4 = h4[0,2,1,3]

	h2[0,1] += _2b1[0] unsigned*   b0[0]; h2[2,3] += _2b1[1] unsigned*   b0[1]	


#------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------





#==============#
# Second Input #
# x2 y2 z2 t2  #
#==============#

## First half ##

#---------------------------------------#
# Squaring                              #
# x2 y2 z2 t2 = x2*x2 y2*y2 z2*z2 t2*t2 #
#---------------------------------------#


h2[0,1] += _2b2[0] unsigned* _2b1[2]; h2[2,3] += _2b2[1] unsigned* _2b1[3]	

2x t = h1 unsigned>> 25
adr5 = input_5
mask25 aligned = mem128[adr5]

h1 &= mask25
adr0 = input_0 + 32			# prev.
mem128[adr0] aligned = h4; adr0+=16	# prev.


h3[0,1] += _2b1[2] unsigned*   b0[0]; h3[2,3] += _2b1[3] unsigned*   b0[1]	
2x h2 += t
h3[0,1] += _2b1[0] unsigned*   b0[2]; h3[2,3] += _2b1[1] unsigned*   b0[3]	

2x t = h2 unsigned>> 26
h2 &= mask26

h5[0,1] += _2b2[0] unsigned*   b0[0]; h5[2,3] += _2b2[1] unsigned*   b0[1]	
2x h3 += t
h5[0,1] += _2b1[2] unsigned* _2b0[0]; h5[2,3] += _2b1[3] unsigned* _2b0[1]	

## serial carry ##
2x t = h3 unsigned>> 25
h3 &= mask25

	k0[0,1]  =   b3[0] unsigned*   b3[0]; k0[2,3]  =   b3[1] unsigned*   b3[1]	

2x h5 += t
h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]

	k0[0,1] += _2b2[2] unsigned* _2b0[2]; k0[2,3] += _2b2[3] unsigned* _2b0[3]	

2x t = h5 unsigned>> 25
h2 = h2[0,2,1,3]
h5 &= mask25

	k1[0,1]  = _2b0[2] unsigned*   b3[0]; k1[2,3]  = _2b0[3] unsigned*   b3[1]	

2x h0 += t
h5 = h5[0,2,1,3]

	k3[0,1]  =   b2[2] unsigned*   b2[2]; k3[2,3]  =   b2[3] unsigned*   b2[3]	

2x t = h0 unsigned>> 26

adr1 = input_1 + 16
mem128[adr1] = h2; adr1+=16

h0 &= mask26

	adr1 = input_1 + 64
	b4 aligned = mem128[adr1]; adr1+=16

2x h1 += t
a2 = h5[0]a2[1]

##----------------##

# arrange #

	k1[0,1] += _2b2[2] unsigned*   b4[0]; k1[2,3] += _2b2[3] unsigned*   b4[1]	

	2x _2b4 = b4 + b4
h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]

	k2[0,1]  = _2b0[2] unsigned*   b3[2]; k2[2,3]  = _2b0[3] unsigned*   b3[3]	
	k0[0,1] += _2b4[2] unsigned* _2b4[0]; k0[2,3] += _2b4[3] unsigned* _2b4[1]
	k1[0,1] += _2b4[2] unsigned*   b4[2]; k1[2,3] += _2b4[3] unsigned*   b4[3]

	k2[0,1] += _2b4[0] unsigned*   b3[0]; k2[2,3] += _2b4[1] unsigned*   b3[1]	
	k2[0,1] += _2b2[2] unsigned* _2b4[2]; k2[2,3] += _2b2[3] unsigned* _2b4[3]

	2x t2 = k0 unsigned>> 26
	k0 &= mask26

	2x k1 += t2
h0 = h0[0,2,1,3]

	k3[0,1] += _2b4[2] unsigned*   b3[0]; k3[2,3] += _2b4[3] unsigned*   b3[1]	

	2x t2 = k1 unsigned>> 25
	k1 &= mask25

	2x k2 += t2
adr1 = input_1
mem128[adr1] = h0; adr1+=16


##################


## Second half ##




#---------------------------------------#
# Squaring                              #
# x2 y2 z2 t2 = x2*x2 y2*y2 z2*z2 t2*t2 #
#---------------------------------------#

k3[0,1] += _2b4[0] unsigned*   b3[2]; k3[2,3] += _2b4[1] unsigned*   b3[3]	

2x t2 = k2 unsigned>> 26
k2 &= mask26

	adr3 = input_3 + 16		#
	c0 aligned = mem128[adr3]	#

k4[0,1]  =   b4[0] unsigned*   b4[0]; k4[2,3]  =   b4[1] unsigned*   b4[1]	
2x k3 += t2
k4[0,1] += _2b2[2] unsigned*   b3[0]; k4[2,3] += _2b2[3] unsigned*   b3[1]	
k4[0,1] += _2b4[2] unsigned* _2b0[2]; k4[2,3] += _2b4[3] unsigned* _2b0[3]


## serial carry ##

2x t2 = k3 unsigned>> 25
	adr1 = input_1
	b0 aligned = mem128[adr1]; adr1+=16

k3 &= mask25
	b1 aligned = mem128[adr1]; adr1+=16

	h0[0,1]  =   b0[0] unsigned* c0[0]; h0[2,3]  =   b0[1] unsigned* c0[1]	

2x k4 += t2

	h1[0,1]  =   b0[2] unsigned* c0[0]; h1[2,3]  =   b0[3] unsigned* c0[1]	
	h2[0,1]  =   b1[0] unsigned* c0[0]; h2[2,3]  =   b1[1] unsigned* c0[1]

2x t2 = k4 unsigned>> 25
k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
k4 &= mask25
2x k0 += t2
k2 = k2[0,2,1,3]

	h3[0,1]  =   b1[2] unsigned* c0[0]; h3[2,3]  =   b1[3] unsigned* c0[1]	

	2x t = h1 unsigned>> 25
	h1 &= mask25
	2x h2 += t

2x t2 = k0 unsigned>> 26
k4 = k4[0,2,1,3]

k0 &= mask26
2x k1 += t2
a2 = a2[0]k4[0]

##----------------##

	2x t = h2 unsigned>> 26
	h2 &= mask26

	2x h3 += t
k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]

	h4[0,1]  =   a2[0] unsigned* c0[0]; h4[2,3]  =   a2[1] unsigned* c0[1]	

	2x t = h3 unsigned>> 25
	h3 &= mask25

		p2[0,1]  =   k2[0] unsigned* c0[2]; p2[2,3]  =   k2[1] unsigned* c0[3]	
	2x h4 += t
k0 = k0[0,2,1,3]

		p3[0,1]  =   k2[2] unsigned* c0[2]; p3[2,3]  =   k2[3] unsigned* c0[3]	

	2x t = h4 unsigned>> 25
	h4 &= mask25
	2x h0 += t

		2x t2 = p2 unsigned>> 26
		p2 &= mask26
		2x p3 += t2

adr1 = input_1 + 48
mem128[adr1] = k0; adr1+=16


##################

#---------------#
# Mul by Const2 #
#---------------#


## serial carry ##

			p5[0,1]  =   a2[2] unsigned* c0[2]; p5[2,3]  =   a2[3] unsigned* c0[3]	

			2x t2 = p3 unsigned>> 25
			p3 &= mask25

2x t = h0 unsigned>> 26
h0 &= mask26
2x h1 += t
h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]

adr5 = input_5
adr5 += 80

			2x p5 += t2
_28_27_28_27 aligned = mem128[adr5]

			p0[0,1]  =   k0[0] unsigned* c0[2]; p0[2,3]  =   k0[1] unsigned* c0[3]	

			2x t2 = p5 unsigned>> 25
			p5 &= mask25


# negate #

4x n1 = _28_27_28_27 - h2
h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]

			2x p0 += t2

4x n0 = _28_27_28_27 - h0
h2 = h2[0]n1[1]


			p1[0,1]  =   k0[2] unsigned* c0[2]; p1[2,3]  =   k0[3] unsigned* c0[3]	

			2x t2 = p0 unsigned>> 26
			h4 p5 = h4[0]p5[0]h4[2]p5[2] h4[1]p5[1]h4[3]p5[3]
			p0 &= mask26
			
			adr5 = input_5
			adr5 += 64
			_27 aligned = mem128[adr5]

h0 = h0[0]n0[1]

			2x p1 += t2
h2 = h2[0,2,1,3]

			4x n2 = _27 - h4
h0 = h0[0,2,1,3]



#---------------#
# Mul by Const2 #
#---------------#


## serial carry ##

2x t2 = p1 unsigned>> 25	# latency
p1 &= mask25
2x p2 += t2



##----------------##


# arrange #

adr5 = input_5
adr5 += 80
_28_27_28_27 aligned = mem128[adr5]

p5 = n2[1,2,3]h4[0]
p0 p1 = p0[0]p1[0]p0[2]p1[2] p0[1]p1[1]p0[3]p1[3]
p2 p3 = p2[0]p3[0]p2[2]p3[2] p2[1]p3[1]p2[3]p3[3]

# negate #


4x n0 = _28_27_28_27 - p0	# latency
4x n1 = _28_27_28_27 - p2
p4 = p5[3]p5[0,1,2]

n0 = n0[0,2,1,3]
n1 = n1[0,2,1,3]
p4 = p4[0,2,1,3]



## Hadamard ##-----------------------------------------------------------------------------
## x2 y2 z2 t2 ##

#--

#4x sum0 = h0 + n0
#4x dif0 = h0 - n0
#
#4x sum1 = h2 + n1
#4x dif1 = h2 - n1
#
#adr5 = input_5
#adr5 += 32
#
#sum0 dif0 = sum0[0]dif0[0]sum0[2]dif0[2] sum0[1]dif0[1]sum0[3]dif0[3]
#sum1 dif1 = sum1[0]dif1[0]sum1[2]dif1[2] sum1[1]dif1[1]sum1[3]dif1[3]
#
#4x a0 = sum0 + dif0
#_28 aligned = mem128[adr5]; adr5+=16
#
#4x a3 = sum0 - dif0
#_29_28 aligned = mem128[adr5]
#
#4x a0 = a0 + _29_28
#sum1 p4 = sum1[0]p4[0] sum1[1]p4[1]
#
#4x a3 = a3 + _29_28
#p4 dif1 = p4[0]dif1[1] dif1[0]p4[1]
#
#4x a1 = sum1 + dif1
#4x a4 = sum1 - dif1
#
#a1 p4 = p4[0]a1[1] a1[0]p4[1]
#p4 a4 = p4[0]a4[0] p4[1]a4[1]
#
#a1 a4 = a1[0]a1[1]a1[2]a4[2] a4[0]a4[1]a1[3]a4[3]
#
#4x sum1 = a1 + a4
#4x dif1 = a1 - a4
#
#p4 sum1 = p4[0]sum1[0] p4[1]sum1[1]
#sum1 dif1 = sum1[0]dif1[0] sum1[1]dif1[1]
#
#4x a1 = p4 + _29_28
#4x a4 = sum1 + _29_28
#4x a2 = dif1 + _28
#
#adr1 = input_1 + 64
#mem128[adr1] aligned = a4; adr1 +=16

#--

4x sum1 = h2 + n1
4x dif1 = h2 - n1

sum1 dif1 = sum1[0]dif1[0]sum1[2]dif1[2] sum1[1]dif1[1]sum1[3]dif1[3]

4x sum0 = h0 + n0
sum1 p4 = sum1[0]p4[0] sum1[1]p4[1]
4x dif0 = h0 - n0
p4 dif1 = p4[0]dif1[1] dif1[0]p4[1]

4x a1 = sum1 + dif1
4x a4 = sum1 - dif1

sum0 dif0 = sum0[0]dif0[0]sum0[2]dif0[2] sum0[1]dif0[1]sum0[3]dif0[3]

4x a0 = sum0 + dif0
a1 p4 = p4[0]a1[1] a1[0]p4[1]
4x a3 = sum0 - dif0
p4 a4 = p4[0]a4[0] p4[1]a4[1]

a1 a4 = a1[0]a1[1]a1[2]a4[2] a4[0]a4[1]a1[3]a4[3]

4x sum1 = a1 + a4
adr5 = input_5
adr5 += 32
_28 aligned = mem128[adr5]; adr5+=16

4x dif1 = a1 - a4
_29_28 aligned = mem128[adr5]

4x a0 = a0 + _29_28
p4 sum1 = p4[0]sum1[0] p4[1]sum1[1]
4x a3 = a3 + _29_28
sum1 dif1 = sum1[0]dif1[0] sum1[1]dif1[1]

4x a1 = p4 + _29_28
4x a4 = sum1 + _29_28
4x a2 = dif1 + _28


#-----------------------------


a0 a3 = a0[0]a3[0] a0[1]a3[1]
2x _2a1 = a1 + a1
2x _2a2 = a2 + a2
2x _2a0 = a3 + a3

adr1 = input_1 + 64			# prev.
mem128[adr1] aligned = a4; adr1 +=16	# prev.


## First half ##

#----------#
# Squaring #
#----------#

k0[0,1]  =   a0[0] unsigned*   a0[0]; k0[2,3]  =   a0[1] unsigned*   a0[1]	
k0[0,1] += _2a2[0] unsigned* _2a0[0]; k0[2,3] += _2a2[1] unsigned* _2a0[1]
k0[0,1] += _2a1[2] unsigned* _2a1[0]; k0[2,3] += _2a1[3] unsigned* _2a1[1]
a0 a3 = a0[0]a3[0] a0[1]a3[1]

k1[0,1]  = _2a1[2] unsigned*   a1[2]; k1[2,3]  = _2a1[3] unsigned*   a1[3]
k1[0,1] += _2a0[0] unsigned*   a0[0]; k1[2,3] += _2a0[1] unsigned*   a0[1]
k1[0,1] += _2a2[0] unsigned*   a1[0]; k1[2,3] += _2a2[1] unsigned*   a1[1]

2x t = k0 unsigned>> 26
k0 &= mask26

k2[0,1]  = _2a0[0] unsigned*   a0[2]; k2[2,3]  = _2a0[1] unsigned*   a0[3]	
2x k1 += t
k2[0,1] += _2a1[0] unsigned*   a0[0]; k2[2,3] += _2a1[1] unsigned*   a0[1]	
k2[0,1] += _2a2[0] unsigned* _2a1[2]; k2[2,3] += _2a2[1] unsigned* _2a1[3]

2x t = k1 unsigned>> 25
k1 &= mask25

k3[0,1]  =   a2[0] unsigned*   a2[0]; k3[2,3]  =   a2[1] unsigned*   a2[1]	
2x k2 += t
k3[0,1] += _2a1[2] unsigned*   a0[0]; k3[2,3] += _2a1[3] unsigned*   a0[1]	
k3[0,1] += _2a1[0] unsigned*   a0[2]; k3[2,3] += _2a1[1] unsigned*   a0[3]

2x t = k2 unsigned>> 26
k2 &= mask26

k4[0,1]  =   a1[0] unsigned*   a1[0]; k4[2,3]  =   a1[1] unsigned*   a1[1]	
2x k3 += t
k4[0,1] += _2a2[0] unsigned*   a0[0]; k4[2,3] += _2a2[1] unsigned*   a0[1]
k4[0,1] += _2a1[2] unsigned* _2a0[0]; k4[2,3] += _2a1[3] unsigned* _2a0[1]


## serial carry ##

2x t = k3 unsigned>> 25
k3 &= mask25
	h0[0,1]  =   a3[0] unsigned*   a3[0]; h0[2,3]  =   a3[1] unsigned*   a3[1]	
2x k4 += t

	h0[0,1] += _2a2[2] unsigned* _2a0[2]; h0[2,3] += _2a2[3] unsigned* _2a0[3]	
2x t = k4 unsigned>> 25
k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
k4 &= mask25
2x k0 += t
k2 = k2[0,2,1,3]

	h1[0,1] = _2a0[2] unsigned*   a3[0]; h1[2,3] = _2a0[3] unsigned*   a3[1]	
2x t = k0 unsigned>> 26
k4 = k4[0,2,1,3]
k0 &= mask26
2x k1 += t

##----------------##

	h5[0,1]  = _2a2[2] unsigned*   a3[0]; h5[2,3]  = _2a2[3] unsigned*   a3[1]	
# arrange #
	adr1 = input_1 +64
	a4 aligned = mem128[adr1]; adr1+=16

	2x _2a4 = a4 + a4
k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]


a2 = k4[0]a2[1]
	h0[0,1] += _2a4[2] unsigned* _2a4[0]; h0[2,3] += _2a4[3] unsigned* _2a4[1]	
	h1[0,1] += _2a4[2] unsigned*   a4[2]; h1[2,3] += _2a4[3] unsigned*   a4[3]
	h1[0,1] += _2a2[2] unsigned*   a4[0]; h1[2,3] += _2a2[3] unsigned*   a4[1]
	h3[0,1]  =   a2[2] unsigned*   a2[2]; h3[2,3]  =   a2[3] unsigned*   a2[3]

	2x t2 = h0 unsigned>> 26
k0 = k0[0,2,1,3]
	h0 &= mask26

	2x h1 += t2

adr1 = input_1
mem128[adr1] aligned = k0; adr1+=16



## Second half ##

#----------#
# Squaring #
#----------#

h2[0,1]  = _2a0[2] unsigned*   a3[2]; h2[2,3]  = _2a0[3] unsigned*   a3[3]	
h2[0,1] += _2a4[0] unsigned*   a3[0]; h2[2,3] += _2a4[1] unsigned*   a3[1]
h2[0,1] += _2a2[2] unsigned* _2a4[2]; h2[2,3] += _2a2[3] unsigned* _2a4[3]

2x t2 = h1 unsigned>> 25
h1 &= mask25
mem128[adr1] aligned = k2; adr1+=16	# prev.

h3[0,1] += _2a4[2] unsigned*   a3[0]; h3[2,3] += _2a4[3] unsigned*   a3[1]	
2x h2 += t2
h3[0,1] += _2a4[0] unsigned*   a3[2]; h3[2,3] += _2a4[1] unsigned*   a3[3]	

2x t2 = h2 unsigned>> 26
#h2 &= mask26
b4 = h2 & mask26	### change h2 to b4

h5[0,1] +=   a4[0] unsigned*   a4[0]; h5[2,3] +=   a4[1] unsigned*   a4[1]	
2x h3 += t2
h5[0,1] += _2a4[2] unsigned* _2a0[2]; h5[2,3] += _2a4[3] unsigned* _2a0[3]	

2x t2 = h3 unsigned>> 25
		adr3 = input_3
		c0 aligned = mem128[adr3]

h3 &= mask25

		adr1 = input_1
		b0 aligned = mem128[adr1]; adr1+=16

		k0[0,1]  =   b0[0] unsigned* c0[0]; k0[2,3]  =   b0[1] unsigned* c0[1]	
2x h5 += t2

## serial carry ##

		k1[0,1]  =   b0[2] unsigned* c0[0]; k1[2,3]  =   b0[3] unsigned* c0[1]	
2x t2 = h5 unsigned>> 25
#h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
b4 h3 = b4[0]h3[0]b4[2]h3[2] b4[1]h3[1]b4[3]h3[3]
h5 &= mask25
2x h0 += t2
b4 = b4[0,2,1,3]

		2x t2 = k0 unsigned>> 26
		k0 &= mask26
		2x k1 += t2

2x t2 = h0 unsigned>> 26
h5 = h5[0,2,1,3]
#h0 &= mask26	
b3 = h0 & mask26	### change h0 to b3
##----------------##

		adr1 = input_1 + 16
		b1 aligned = mem128[adr1]; adr1+=16
		k2[0,1]  =   b1[0] unsigned* c0[0]; k2[2,3]  =   b1[1] unsigned* c0[1]	

2x h1 += t2
a2 = a2[0]h5[0]

		2x t2 = k1 unsigned>> 25
		k1 &= mask25
		2x k2 += t2


# arrange #

		k3[0,1]  =   b1[2] unsigned* c0[0]; k3[2,3]  =   b1[3] unsigned* c0[1]	
		k4[0,1]  =   a2[0] unsigned* c0[0]; k4[2,3]  =   a2[1] unsigned* c0[1]
		2x t2 = k2 unsigned>> 26
#h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]
b3 h1 = b3[0]h1[0]b3[2]h1[2] b3[1]h1[1]b3[3]h1[3]
		k2 &= mask26
		2x k3 += t2

#h0 = h0[0,2,1,3]
b3 = b3[0,2,1,3]



#---------------#
# Mul by Const1 #
#---------------#


## First half ##

		h0[0,1]  =   b3[0] unsigned* c0[2]; h0[2,3]  =   b3[1] unsigned* c0[3]	

## serial carry ##

2x t2 = k3 unsigned>> 25
k3 &= mask25
2x k4 += t2

		h1[0,1]  =   b3[2] unsigned* c0[2]; h1[2,3]  =   b3[3] unsigned* c0[3]	

2x t2 = k4 unsigned>> 25
k4 &= mask25
k2 k3 = k2[0]k3[0]k2[2]k3[2] k2[1]k3[1]k2[3]k3[3]
2x k0 += t2

##----------------##

# arrange #


adr5 = input_5
adr5 += 80
_28_27_28_27 aligned = mem128[adr5]

4x n1 = _28_27_28_27 - k2

# negate #

		2x t2 = h0 unsigned>> 26
		h0 &= mask26
k0 k1 = k0[0]k1[0]k0[2]k1[2] k0[1]k1[1]k0[3]k1[3]
		2x h1 += t2

		h2[0,1]  =   b4[0] unsigned* c0[2]; h2[2,3]  =   b4[1] unsigned* c0[3]	
4x n0 = _28_27_28_27 - k0
n1 = n1[0]k2[1]
n0 = n0[0]k0[1]

		2x t2 = h1 unsigned>> 25
n1 = n1[0,2,1,3]
		h1 &= mask25
n0 = n0[0,2,1,3]
		2x h2 += t2

		h3[0,1]  =   b4[2] unsigned* c0[2]; h3[2,3]  =   b4[3] unsigned* c0[3]	
		2x t2 = h2 unsigned>> 26


adr1 = input_1
mem128[adr1] aligned = n0; adr1+=16
		h2 &= mask26
mem128[adr1] aligned = n1; adr1+=16







#--------------------------------------------


#---------------#
# Mul by Const1 #
#---------------#

h5[0,1]  =   a2[2] unsigned* c0[2]; h5[2,3]  =   a2[3] unsigned* c0[3]	
2x h3 += t2


## serial carry ##


2x t2 = h3 unsigned>> 25
h3 &= mask25
2x h5 += t2

2x t2 = h5 unsigned>> 25
h5 &= mask25
2x h0 += t2

##----------------##


# arrange #

adr5 = input_5
adr5 += 64
_27 aligned = mem128[adr5]

k4 h5 = k4[0]h5[0]k4[2]h5[2] k4[1]h5[1]k4[3]h5[3]
h2 h3 = h2[0]h3[0]h2[2]h3[2] h2[1]h3[1]h2[3]h3[3]
h0 h1 = h0[0]h1[0]h0[2]h1[2] h0[1]h1[1]h0[3]h1[3]

4x n2 = _27 - k4

h2 = h2[0,2,1,3]
h0 = h0[0,2,1,3]


# negate #


h1 = k4[1,2,3]n2[0]

adr1 = input_1 + 64
mem128[adr1] aligned = h2
adr1 -= 16
mem128[adr1] aligned = h0; adr1+=16

h4 = h1[3]h1[0,1,2]
h4 = h4[0,2,1,3]


adr1 = input_1 + 32
mem128[adr1] aligned = h4; adr1+=16


unsigned<? count -= 1
goto looptop if !unsigned<




#------------------------------

caller_r4 = stack_r4
caller_r5 = stack_r5
caller_r6 = stack_r6
caller_r7 = stack_r7
caller_r8 = stack_r8
caller_r9 = stack_r9
caller_r10 = stack_r10
caller_r11 = stack_r11
caller_r12 = stack_r12
caller_r14 = stack_r14


qpopreturn


