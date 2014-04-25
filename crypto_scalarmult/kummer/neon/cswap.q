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

int128 t
int128 c

int32 bit

int32 adr0
int32 adr1
int32 adr2

int32 count

stack128 caller_q4_stack
stack128 caller_q5_stack
stack128 caller_q6_stack
stack128 caller_q7_stack

qpushenter cswap

#count = 10000
#loop:


adr0 = input_0
a0 = mem128[adr0]; adr0+=16
a1 = mem128[adr0]; adr0+=16
a2 = mem128[adr0]; adr0+=16
a3 = mem128[adr0]; adr0+=16
a4 = mem128[adr0]; adr0+=16

adr1 = input_1
b0 = mem128[adr1]; adr1+=16
b1 = mem128[adr1]; adr1+=16
b2 = mem128[adr1]; adr1+=16
b3 = mem128[adr1]; adr1+=16
b4 = mem128[adr1]; adr1+=16


#adr2 = input_2
bit = input_2

bit -= 1
4x c = bit

t  = a0 ^ b0
t  &= c
a0 ^= t
b0 ^= t

t  = a1 ^ b1
t  &= c
a1 ^= t
b1 ^= t

t  = a2 ^ b2
t  &= c
a2 ^= t
b2 ^= t

t  = a3 ^ b3
t  &= c
a3 ^= t
b3 ^= t

t  = a4 ^ b4
t  &= c
a4 ^= t
b4 ^= t

adr0 = input_0
mem128[adr0] = a0; adr0+=16
mem128[adr0] = a1; adr0+=16
mem128[adr0] = a2; adr0+=16
mem128[adr0] = a3; adr0+=16
mem128[adr0] = a4; adr0+=16

adr1 = input_1
mem128[adr1] = b0; adr1+=16
mem128[adr1] = b1; adr1+=16
mem128[adr1] = b2; adr1+=16
mem128[adr1] = b3; adr1+=16
mem128[adr1] = b4; adr1+=16


#count -= 1
#unsigned>? count - 0
#goto loop if unsigned>



qpopreturn

