@include "common.pq"

@define outp input_0
@define len input_2 # XXX: passed in input_2 and input_3, handle 64-bit lengths!

reg128 bb0
reg128 bb1
reg128 bb2
reg128 bb3
reg128 bb4
reg128 bb5
reg128 bb6
reg128 bb7

reg128 bb8
reg128 bb9
reg128 bb10
reg128 bb11
reg128 bb12
reg128 bb13
reg128 bb14
reg128 bb15

reg128 t
reg128 tt
reg128 t0
reg128 t1
reg128 t2
reg128 t3
reg128 t4
reg128 t5
reg128 t6
reg128 t7
reg128 u
reg128 u0
reg128 u1
reg128 u2
reg128 u3
reg128 u4
reg128 u5
reg128 u6
reg128 u7
reg128 SR
stack128 SR_stack
int32 y
int32 z
stack128 RCTRINC1_stack
stack128 RCTRINC2_stack
stack128 RCTRINC3_stack
stack128 RCTRINC4_stack
stack128 RCTRINC5_stack
stack128 RCTRINC6_stack
stack128 RCTRINC7_stack
reg128 RCTRINC1
reg128 RCTRINC2
reg128 RCTRINC3
reg128 RCTRINC4
reg128 RCTRINC5
reg128 RCTRINC6
reg128 RCTRINC7

stack1024 bl
stack128 nonce_stack
int32 blp
int32 b
int32 tmp
int32 c
int32 np

qpushenter crypto_stream_aes128ctr_neon_afternm_constants

stack64 stack_r45
stack64 stack_r67
assign r4 r5 to caller_r4 caller_r5; stack_r45 = caller_r4 caller_r5
assign r6 r7 to caller_r6 caller_r7; stack_r67 = caller_r6 caller_r7

np = input_4

# Copy nonce on the stack
bb0 = mem128[np]

new nonce_stack
new SR_stack
new RCTRINC1_stack
new RCTRINC2_stack
new RCTRINC3_stack
new RCTRINC4_stack
new RCTRINC5_stack
new RCTRINC6_stack
new RCTRINC7_stack

np = &nonce_stack
mem128[np] aligned= bb0

z = input_6
SR = mem128[z]; z += 16
RCTRINC1 = mem128[z]
4x RCTRINC2 = RCTRINC1 + RCTRINC1
4x RCTRINC3 = RCTRINC2 + RCTRINC1
4x RCTRINC4 = RCTRINC3 + RCTRINC1
4x RCTRINC5 = RCTRINC4 + RCTRINC1
4x RCTRINC6 = RCTRINC5 + RCTRINC1
4x RCTRINC7 = RCTRINC6 + RCTRINC1

z = &SR_stack
mem128[z] aligned= SR

z = &RCTRINC1_stack
mem128[z] aligned= RCTRINC1
z = &RCTRINC2_stack
mem128[z] aligned= RCTRINC2
z = &RCTRINC3_stack
mem128[z] aligned= RCTRINC3
z = &RCTRINC4_stack
mem128[z] aligned= RCTRINC4
z = &RCTRINC5_stack
mem128[z] aligned= RCTRINC5
z = &RCTRINC6_stack
mem128[z] aligned= RCTRINC6
z = &RCTRINC7_stack
mem128[z] aligned= RCTRINC7

# The following two lines are completely pointless
# except that they make the code run faster
#unsigned>? len-0
#goto enc_block if unsigned>

enc_block:

c = input_5

bb0 aligned= mem128[np]
bb1 = bb0
swap32(bb1)
bb2 = bb1
bb3 = bb1
bb4 = bb1
bb5 = bb1
bb6 = bb1
bb7 = bb1

z = &RCTRINC1_stack
RCTRINC1 aligned= mem128[z]
4x bb1 += RCTRINC1
z = &RCTRINC2_stack
RCTRINC2 aligned= mem128[z]
4x bb2 += RCTRINC2
z = &RCTRINC3_stack
RCTRINC3 aligned= mem128[z]
4x bb3 += RCTRINC3
z = &RCTRINC4_stack
RCTRINC4 aligned= mem128[z]
4x bb4 += RCTRINC4
z = &RCTRINC5_stack
RCTRINC5 aligned= mem128[z]
4x bb5 += RCTRINC5
z = &RCTRINC6_stack
RCTRINC6 aligned= mem128[z]
4x bb6 += RCTRINC6
z = &RCTRINC7_stack
RCTRINC7 aligned= mem128[z]
4x bb7 += RCTRINC7

interleave(bb0)
interleaveswap(bb1)
interleaveswap(bb2)
interleaveswap(bb3)
interleaveswap(bb4)
interleaveswap(bb5)
interleaveswap(bb6)
interleaveswap(bb7)

aesrounds( bb0, bb1, bb2, bb3, bb4, bb5, bb6, bb7, bb8, bb9, bb10, bb11, bb12, bb13, bb14, bb15, c)

unsigned<? =? len-128
goto partial if unsigned<
goto full if =

tmp = mem32[np+12]
tmp = tmp[3]tmp[2]tmp[1]tmp[0]
tmp += 8
tmp = tmp[3]tmp[2]tmp[1]tmp[0]
mem32[np+12] = tmp

mem128[outp] = bb8; outp += 16
mem128[outp] = bb9; outp += 16
mem128[outp] = bb12; outp += 16
mem128[outp] = bb14; outp += 16
mem128[outp] = bb11; outp += 16
mem128[outp] = bb15; outp += 16
mem128[outp] = bb10; outp += 16
mem128[outp] = bb13; outp += 16

len -= 128

goto enc_block
	
partial:

blp = &bl
mem128[blp] = bb8; blp += 16
mem128[blp] = bb9; blp += 16
mem128[blp] = bb12; blp += 16
mem128[blp] = bb14; blp += 16
mem128[blp] = bb11; blp += 16
mem128[blp] = bb15; blp += 16
mem128[blp] = bb10; blp += 16
mem128[blp] = bb13; blp += 16
blp = &bl

bytes:

=? len-0
goto end if =

b = mem8[blp]; blp += 1
mem8[outp] = b; outp += 1

len -= 1
goto bytes

full:

mem128[outp] = bb8; outp += 16
mem128[outp] = bb9; outp += 16
mem128[outp] = bb12; outp += 16
mem128[outp] = bb14; outp += 16
mem128[outp] = bb11; outp += 16
mem128[outp] = bb15; outp += 16
mem128[outp] = bb10; outp += 16
mem128[outp] = bb13; outp += 16

end:

assign r4 r5 to caller_r4 caller_r5 = stack_r45
assign r6 r7 to caller_r6 caller_r7 = stack_r67

qpopreturn
