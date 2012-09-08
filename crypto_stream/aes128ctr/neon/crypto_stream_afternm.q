# Emilia Käsper
# Peter Schwabe
# D. J. Bernstein
# oneshiftrow: x = x[1]x[2]x[3]x[0] x[6]x[7]x[4]x[5] x[11]x[8]x[9]x[10] x[12]x[13]x[14]x[15]
# SR: .quad 0x0504070600030201, 0x0f0e0d0c0a09080b






# oneshiftrowlast: x = x[15]x[10]x[5]x[0] x[14]x[9]x[4]x[3] x[12]x[11]x[6]x[1] x[13]x[8]x[7]x[2]
# SRM0:   .quad 0x0304090e00050a0f, 0x01060b0c0207080d






# SWAP32: .int 0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f





# RCON: .int 0x00000000, 0x00000000, 0x00000000, 0xffffffff







# rotbyte: x = ? ? ? x[12] ? ? ? x[0] ? ? ? x[4] ? ? ? x[8]
# don't care about ? values
# e.g. shuffle bytes of x by ROTB: .int 0x0c000000, 0x00000000, 0x04000000, 0x08000000
# expb: x = x[3]x[3]x[3]x[3] x[7]x[7]x[7]x[7] x[11]x[11]x[11]x[11] x[15]x[15]x[15]x[15]
# e.g. shuffle bytes of x by EXPB0: .int 0x03030303, 0x07070707, 0x0b0b0b0b, 0x0f0f0f0f
# interleave: x = x[15]x[11]x[7]x[3] x[14]x[10]x[6]x[2] x[13]x[9]x[5]x[1] x[12]x[8]x[4]x[0]
# e.g. shuffle bytes of x by M0:  .quad 0x02060a0e03070b0f, 0x0004080c0105090d
# interleaveswap: x = x[12]x[8]x[4]x[0] x[13]x[9]x[5]x[1] x[14]x[10]x[6]x[2] x[15]x[11]x[7]x[3]
# e.g. shuffle bytes of x by M0SWAP: .quad 0x0105090d0004080c , 0x03070b0f02060a0e
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
assign r4 r5 to caller_r4 caller_r5;stack_r45 = caller_r4 caller_r5
assign r6 r7 to caller_r6 caller_r7;stack_r67 = caller_r6 caller_r7

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
SR = mem128[z];z += 16
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
  #BEGIN MACRO swap32
  bb1 = bb1[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
  #END MACRO swap32

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

  #BEGIN MACRO interleave
  bb0 = bb0[0,2,1,3]
  bb0 = bb0[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
  bb0 = bb0[0,2,1,3]
  bb0 = bb0[0,4,2,6,1,5,3,7]
  bb0 = bb0[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
  bb0 = bb0[1,0]
  #END MACRO interleave

  #BEGIN MACRO interleaveswap
  bb1 = bb1[0,2,1,3]
  bb1 = bb1[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
  bb1 = bb1[0,2,1,3]
  bb1 = bb1[0,4,2,6,1,5,3,7]
  bb1 = bb1[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
  #END MACRO interleaveswap

  #BEGIN MACRO interleaveswap
  bb2 = bb2[0,2,1,3]
  bb2 = bb2[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
  bb2 = bb2[0,2,1,3]
  bb2 = bb2[0,4,2,6,1,5,3,7]
  bb2 = bb2[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
  #END MACRO interleaveswap

  #BEGIN MACRO interleaveswap
  bb3 = bb3[0,2,1,3]
  bb3 = bb3[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
  bb3 = bb3[0,2,1,3]
  bb3 = bb3[0,4,2,6,1,5,3,7]
  bb3 = bb3[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
  #END MACRO interleaveswap

  #BEGIN MACRO interleaveswap
  bb4 = bb4[0,2,1,3]
  bb4 = bb4[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
  bb4 = bb4[0,2,1,3]
  bb4 = bb4[0,4,2,6,1,5,3,7]
  bb4 = bb4[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
  #END MACRO interleaveswap

  #BEGIN MACRO interleaveswap
  bb5 = bb5[0,2,1,3]
  bb5 = bb5[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
  bb5 = bb5[0,2,1,3]
  bb5 = bb5[0,4,2,6,1,5,3,7]
  bb5 = bb5[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
  #END MACRO interleaveswap

  #BEGIN MACRO interleaveswap
  bb6 = bb6[0,2,1,3]
  bb6 = bb6[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
  bb6 = bb6[0,2,1,3]
  bb6 = bb6[0,4,2,6,1,5,3,7]
  bb6 = bb6[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
  #END MACRO interleaveswap

  #BEGIN MACRO interleaveswap
  bb7 = bb7[0,2,1,3]
  bb7 = bb7[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
  bb7 = bb7[0,2,1,3]
  bb7 = bb7[0,4,2,6,1,5,3,7]
  bb7 = bb7[3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12]
  #END MACRO interleaveswap


  #BEGIN MACRO aesrounds
    #BEGIN MACRO bitslice
    u = 0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55
      #BEGIN MACRO swapmove4
      2x t0 = bb6 unsigned>> 1
      2x t2 = bb4 unsigned>> 1
      2x t4 = bb2 unsigned>> 1
      2x t6 = bb0 unsigned>> 1
      t0 ^= bb7
      t2 ^= bb5
      t4 ^= bb3
      t6 ^= bb1
      t0 &= u
      t2 &= u
      t4 &= u
      t6 &= u
      bb7 ^= t0
      bb5 ^= t2
      bb3 ^= t4
      bb1 ^= t6
      2x t0 <<= 1
      2x t2 <<= 1
      2x t4 <<= 1
      2x t6 <<= 1
      bb6 ^= t0
      bb4 ^= t2
      bb2 ^= t4
      bb0 ^= t6
      #END MACRO swapmove4
    
    
    u = 0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33
      #BEGIN MACRO swapmove4
      2x t0 = bb5 unsigned>> 2
      2x t2 = bb4 unsigned>> 2
      2x t4 = bb1 unsigned>> 2
      2x t6 = bb0 unsigned>> 2
      t0 ^= bb7
      t2 ^= bb6
      t4 ^= bb3
      t6 ^= bb2
      t0 &= u
      t2 &= u
      t4 &= u
      t6 &= u
      bb7 ^= t0
      bb6 ^= t2
      bb3 ^= t4
      bb2 ^= t6
      2x t0 <<= 2
      2x t2 <<= 2
      2x t4 <<= 2
      2x t6 <<= 2
      bb5 ^= t0
      bb4 ^= t2
      bb1 ^= t4
      bb0 ^= t6
      #END MACRO swapmove4
    
    
    u = 0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f
      #BEGIN MACRO swapmove4
      2x t0 = bb3 unsigned>> 4
      2x t2 = bb2 unsigned>> 4
      2x t4 = bb1 unsigned>> 4
      2x t6 = bb0 unsigned>> 4
      t0 ^= bb7
      t2 ^= bb6
      t4 ^= bb5
      t6 ^= bb4
      t0 &= u
      t2 &= u
      t4 &= u
      t6 &= u
      bb7 ^= t0
      bb6 ^= t2
      bb5 ^= t4
      bb4 ^= t6
      2x t0 <<= 4
      2x t2 <<= 4
      2x t4 <<= 4
      2x t6 <<= 4
      bb3 ^= t0
      bb2 ^= t2
      bb1 ^= t4
      bb0 ^= t6
      #END MACRO swapmove4
    
    #END MACRO bitslice
  
    #BEGIN MACRO loadkey
    bb8 aligned= mem128[c];c += 16
    bb9 aligned= mem128[c];c += 16
    bb10 aligned= mem128[c];c += 16
    bb11 aligned= mem128[c];c += 16
    bb12 aligned= mem128[c];c += 16
    bb13 aligned= mem128[c];c += 16
    bb14 aligned= mem128[c];c += 16
    bb15 aligned= mem128[c];c += 16
    #END MACRO loadkey
  
    #BEGIN MACRO aesround
    bb1 ^= bb9
    z = &SR_stack
    SR aligned= mem128[z]
    bb2 ^= bb10
    bb5 ^= bb13
      #BEGIN MACRO oneshiftrow
      bb1 = bb1[SR[0,1,2,3,4,5,6,7]] bb1[8,9,10,11,12,13,14,15]
      bb1 = bb1[0,1,2,3,4,5,6,7] bb1[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb0 ^= bb8
    bb3 ^= bb11
      #BEGIN MACRO oneshiftrow
      bb2 = bb2[SR[0,1,2,3,4,5,6,7]] bb2[8,9,10,11,12,13,14,15]
      bb2 = bb2[0,1,2,3,4,5,6,7] bb2[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb6 ^= bb14
    bb7 ^= bb15
      #BEGIN MACRO oneshiftrow
      bb5 = bb5[SR[0,1,2,3,4,5,6,7]] bb5[8,9,10,11,12,13,14,15]
      bb5 = bb5[0,1,2,3,4,5,6,7] bb5[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb4 ^= bb12
      #BEGIN MACRO oneshiftrow
      bb0 = bb0[SR[0,1,2,3,4,5,6,7]] bb0[8,9,10,11,12,13,14,15]
      bb0 = bb0[0,1,2,3,4,5,6,7] bb0[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb2 ^= bb1
      #BEGIN MACRO oneshiftrow
      bb3 = bb3[SR[0,1,2,3,4,5,6,7]] bb3[8,9,10,11,12,13,14,15]
      bb3 = bb3[0,1,2,3,4,5,6,7] bb3[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb5 ^= bb0
      #BEGIN MACRO oneshiftrow
      bb6 = bb6[SR[0,1,2,3,4,5,6,7]] bb6[8,9,10,11,12,13,14,15]
      bb6 = bb6[0,1,2,3,4,5,6,7] bb6[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb3 ^= bb0
      #BEGIN MACRO oneshiftrow
      bb7 = bb7[SR[0,1,2,3,4,5,6,7]] bb7[8,9,10,11,12,13,14,15]
      bb7 = bb7[0,1,2,3,4,5,6,7] bb7[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb5 ^= bb6
    bb6 ^= bb3
    bb3 ^= bb7
      #BEGIN MACRO oneshiftrow
      bb4 = bb4[SR[0,1,2,3,4,5,6,7]] bb4[8,9,10,11,12,13,14,15]
      bb4 = bb4[0,1,2,3,4,5,6,7] bb4[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb6 ^= bb2
    bb7 ^= bb5
    bb3 ^= bb4
    bb4 ^= bb5
    bb3 ^= bb1
    bb2 ^= bb7
    bb1 ^= bb5
      #BEGIN MACRO Inv_GF256
      bb11 = bb7 ^ bb4
      bb10 = bb1 ^ bb2
      bb9 = bb5 ^ bb3
      bb13 = bb2 ^ bb4
      bb12 = bb6 ^ bb0
      bb8 = bb10 & bb9
      bb14 = bb11 & bb12
      bb15 = bb11 ^ bb10
      bb11 |= bb12
      bb12 ^= bb9
      bb10 |= bb9
      bb15 &= bb12
      bb12 = bb3 ^ bb0
      bb11 ^= bb15
      bb13 &= bb12
      bb10 ^= bb14
      bb11 ^= bb13
      bb10 ^= bb13
      bb13 = bb7 ^ bb1
      bb12 = bb5 ^ bb6
      bb8 ^= bb14
      bb9 = bb13 | bb12
      bb13 &= bb12
      bb9 ^= bb15
      bb8 ^= bb13
      bb9 ^= bb14
      bb12 = bb2 & bb3
      bb13 = bb4 & bb0
      bb11 ^= bb12
      bb10 ^= bb13
      bb14 = bb1 & bb5
      bb12 = bb11 ^ bb10
      bb15 = bb7 | bb6
      bb9 ^= bb14
      bb8 ^= bb15
      bb11 &= bb9
      bb13 = bb9 ^ bb8
      bb14 = bb8 ^ bb11
      bb11 ^= bb10
      bb15 = bb12 & bb14
      bb13 &= bb11
      bb15 ^= bb10
      bb13 ^= bb8
      
      bb10 = bb14 ^ bb13
      bb9 ^= bb13
      bb10 &= bb8
      bb8 = bb5 ^ bb3
      bb14 ^= bb10
      bb9 ^= bb10
      bb14 &= bb15
      
      bb14 ^= bb12
      bb12 = bb6 ^ bb0
      bb10 = bb15 ^ bb14
      
      bb10 &= bb6
      bb6 ^= bb5
      bb5 &= bb15
      bb6 &= bb14
      bb14 ^= bb9
      bb15 ^= bb13
      bb6 ^= bb5
      bb11 = bb15 ^ bb14
      bb5 ^= bb10
      bb11 &= bb12
      bb12 ^= bb8
      bb8 &= bb15
      bb12 &= bb14
      bb10 = bb13 ^ bb9
      bb8 ^= bb12
      bb12 ^= bb11
      bb10 &= bb0
      bb0 ^= bb3
      bb3 &= bb13
      bb0 &= bb9
      bb6 ^= bb12
      bb0 ^= bb3
      bb3 ^= bb10
      bb0 ^= bb12
      bb5 ^= bb8
      bb3 ^= bb8
      bb12 = bb7 ^ bb4
      bb11 = bb15 ^ bb14
      bb8 = bb1 ^ bb2
      bb11 &= bb12
      bb12 ^= bb8
      bb8 &= bb15
      bb12 &= bb14
      bb10 = bb13 ^ bb9
      bb8 ^= bb12
      bb12 ^= bb11
      bb10 &= bb4
      bb4 ^= bb2
      bb2 &= bb13
      bb4 &= bb9
      bb15 ^= bb13
      bb14 ^= bb9
      bb4 ^= bb2
      bb11 = bb15 ^ bb14
      bb2 ^= bb10
      bb11 &= bb7
      bb7 ^= bb1
      bb1 &= bb15
      bb7 &= bb14
      bb4 ^= bb12
      bb7 ^= bb1
      bb1 ^= bb11
      bb7 ^= bb12
      bb1 ^= bb8
      bb2 ^= bb8
      #END MACRO Inv_GF256
    
    bb7 ^= bb0
    bb1 ^= bb6
    bb4 ^= bb7
    bb6 ^= bb0
    bb0 ^= bb1
    bb1 ^= bb5
    bb5 ^= bb2
    bb2 ^= bb3
    bb3 ^= bb5
    bb8 = bb0[3]bb0[0,1,2]
    bb4 ^= bb5
    bb9 = bb1[3]bb1[0,1,2]
    bb6 ^= bb3
    bb10 = bb4[3]bb4[0,1,2]
    bb0 ^= bb8
    bb11 = bb6[3]bb6[0,1,2]
    bb1 ^= bb9
    bb12 = bb3[3]bb3[0,1,2]
    bb4 ^= bb10
    bb15 = bb5[3]bb5[0,1,2]
    bb6 ^= bb11
    bb13 = bb7[3]bb7[0,1,2]
    bb3 ^= bb12
    bb14 = bb2[3]bb2[0,1,2]
    bb5 ^= bb15
    bb7 ^= bb13
    bb2 ^= bb14
    bb9 ^= bb0
    bb8 ^= bb5
    bb10 ^= bb1
    bb9 ^= bb5
    bb0 = bb0[2,3]bb0[0,1]
    bb11 ^= bb4
    bb1 = bb1[2,3]bb1[0,1]
    bb12 ^= bb6
    bb4 = bb4[2,3]bb4[0,1]
    bb13 ^= bb3
    bb6 = bb6[2,3]bb6[0,1]
    bb11 ^= bb5
    bb3 = bb3[2,3]bb3[0,1]
    bb14 ^= bb7
    bb7 = bb7[2,3]bb7[0,1]
    bb15 ^= bb2
    bb2 = bb2[2,3]bb2[0,1]
    bb12 ^= bb5
    bb5 = bb5[2,3]bb5[0,1]
    bb8 ^= bb0
    bb0 aligned= mem128[c];c += 16
    bb9 ^= bb1
    bb1 aligned= mem128[c];c += 16
    bb14 ^= bb2
    bb2 aligned= mem128[c];c += 16
    bb12 ^= bb3
    bb3 aligned= mem128[c];c += 16
    bb10 ^= bb4
    bb4 aligned= mem128[c];c += 16
    bb15 ^= bb5
    bb5 aligned= mem128[c];c += 16
    bb11 ^= bb6
    bb6 aligned= mem128[c];c += 16
    bb13 ^= bb7
    bb7 aligned= mem128[c];c += 16
    #END MACRO aesround
  
    #BEGIN MACRO aesround
    bb9 ^= bb1
    z = &SR_stack
    SR aligned= mem128[z]
    bb10 ^= bb2
    bb13 ^= bb5
      #BEGIN MACRO oneshiftrow
      bb9 = bb9[SR[0,1,2,3,4,5,6,7]] bb9[8,9,10,11,12,13,14,15]
      bb9 = bb9[0,1,2,3,4,5,6,7] bb9[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb8 ^= bb0
    bb11 ^= bb3
      #BEGIN MACRO oneshiftrow
      bb10 = bb10[SR[0,1,2,3,4,5,6,7]] bb10[8,9,10,11,12,13,14,15]
      bb10 = bb10[0,1,2,3,4,5,6,7] bb10[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb14 ^= bb6
    bb15 ^= bb7
      #BEGIN MACRO oneshiftrow
      bb13 = bb13[SR[0,1,2,3,4,5,6,7]] bb13[8,9,10,11,12,13,14,15]
      bb13 = bb13[0,1,2,3,4,5,6,7] bb13[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb12 ^= bb4
      #BEGIN MACRO oneshiftrow
      bb8 = bb8[SR[0,1,2,3,4,5,6,7]] bb8[8,9,10,11,12,13,14,15]
      bb8 = bb8[0,1,2,3,4,5,6,7] bb8[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb10 ^= bb9
      #BEGIN MACRO oneshiftrow
      bb11 = bb11[SR[0,1,2,3,4,5,6,7]] bb11[8,9,10,11,12,13,14,15]
      bb11 = bb11[0,1,2,3,4,5,6,7] bb11[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb13 ^= bb8
      #BEGIN MACRO oneshiftrow
      bb14 = bb14[SR[0,1,2,3,4,5,6,7]] bb14[8,9,10,11,12,13,14,15]
      bb14 = bb14[0,1,2,3,4,5,6,7] bb14[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb11 ^= bb8
      #BEGIN MACRO oneshiftrow
      bb15 = bb15[SR[0,1,2,3,4,5,6,7]] bb15[8,9,10,11,12,13,14,15]
      bb15 = bb15[0,1,2,3,4,5,6,7] bb15[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb13 ^= bb14
    bb14 ^= bb11
    bb11 ^= bb15
      #BEGIN MACRO oneshiftrow
      bb12 = bb12[SR[0,1,2,3,4,5,6,7]] bb12[8,9,10,11,12,13,14,15]
      bb12 = bb12[0,1,2,3,4,5,6,7] bb12[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb14 ^= bb10
    bb15 ^= bb13
    bb11 ^= bb12
    bb12 ^= bb13
    bb11 ^= bb9
    bb10 ^= bb15
    bb9 ^= bb13
      #BEGIN MACRO Inv_GF256
      bb3 = bb15 ^ bb12
      bb2 = bb9 ^ bb10
      bb1 = bb13 ^ bb11
      bb5 = bb10 ^ bb12
      bb4 = bb14 ^ bb8
      bb0 = bb2 & bb1
      bb6 = bb3 & bb4
      bb7 = bb3 ^ bb2
      bb3 |= bb4
      bb4 ^= bb1
      bb2 |= bb1
      bb7 &= bb4
      bb4 = bb11 ^ bb8
      bb3 ^= bb7
      bb5 &= bb4
      bb2 ^= bb6
      bb3 ^= bb5
      bb2 ^= bb5
      bb5 = bb15 ^ bb9
      bb4 = bb13 ^ bb14
      bb0 ^= bb6
      bb1 = bb5 | bb4
      bb5 &= bb4
      bb1 ^= bb7
      bb0 ^= bb5
      bb1 ^= bb6
      bb4 = bb10 & bb11
      bb5 = bb12 & bb8
      bb3 ^= bb4
      bb2 ^= bb5
      bb6 = bb9 & bb13
      bb4 = bb3 ^ bb2
      bb7 = bb15 | bb14
      bb1 ^= bb6
      bb0 ^= bb7
      bb3 &= bb1
      bb5 = bb1 ^ bb0
      bb6 = bb0 ^ bb3
      bb3 ^= bb2
      bb7 = bb4 & bb6
      bb5 &= bb3
      bb7 ^= bb2
      bb5 ^= bb0
      
      bb2 = bb6 ^ bb5
      bb1 ^= bb5
      bb2 &= bb0
      bb0 = bb13 ^ bb11
      bb6 ^= bb2
      bb1 ^= bb2
      bb6 &= bb7
      
      bb6 ^= bb4
      bb4 = bb14 ^ bb8
      bb2 = bb7 ^ bb6
      
      bb2 &= bb14
      bb14 ^= bb13
      bb13 &= bb7
      bb14 &= bb6
      bb6 ^= bb1
      bb7 ^= bb5
      bb14 ^= bb13
      bb3 = bb7 ^ bb6
      bb13 ^= bb2
      bb3 &= bb4
      bb4 ^= bb0
      bb0 &= bb7
      bb4 &= bb6
      bb2 = bb5 ^ bb1
      bb0 ^= bb4
      bb4 ^= bb3
      bb2 &= bb8
      bb8 ^= bb11
      bb11 &= bb5
      bb8 &= bb1
      bb14 ^= bb4
      bb8 ^= bb11
      bb11 ^= bb2
      bb8 ^= bb4
      bb13 ^= bb0
      bb11 ^= bb0
      bb4 = bb15 ^ bb12
      bb3 = bb7 ^ bb6
      bb0 = bb9 ^ bb10
      bb3 &= bb4
      bb4 ^= bb0
      bb0 &= bb7
      bb4 &= bb6
      bb2 = bb5 ^ bb1
      bb0 ^= bb4
      bb4 ^= bb3
      bb2 &= bb12
      bb12 ^= bb10
      bb10 &= bb5
      bb12 &= bb1
      bb7 ^= bb5
      bb6 ^= bb1
      bb12 ^= bb10
      bb3 = bb7 ^ bb6
      bb10 ^= bb2
      bb3 &= bb15
      bb15 ^= bb9
      bb9 &= bb7
      bb15 &= bb6
      bb12 ^= bb4
      bb15 ^= bb9
      bb9 ^= bb3
      bb15 ^= bb4
      bb9 ^= bb0
      bb10 ^= bb0
      #END MACRO Inv_GF256
    
    bb15 ^= bb8
    bb9 ^= bb14
    bb12 ^= bb15
    bb14 ^= bb8
    bb8 ^= bb9
    bb9 ^= bb13
    bb13 ^= bb10
    bb10 ^= bb11
    bb11 ^= bb13
    bb0 = bb8[3]bb8[0,1,2]
    bb12 ^= bb13
    bb1 = bb9[3]bb9[0,1,2]
    bb14 ^= bb11
    bb2 = bb12[3]bb12[0,1,2]
    bb8 ^= bb0
    bb3 = bb14[3]bb14[0,1,2]
    bb9 ^= bb1
    bb4 = bb11[3]bb11[0,1,2]
    bb12 ^= bb2
    bb7 = bb13[3]bb13[0,1,2]
    bb14 ^= bb3
    bb5 = bb15[3]bb15[0,1,2]
    bb11 ^= bb4
    bb6 = bb10[3]bb10[0,1,2]
    bb13 ^= bb7
    bb15 ^= bb5
    bb10 ^= bb6
    bb1 ^= bb8
    bb0 ^= bb13
    bb2 ^= bb9
    bb1 ^= bb13
    bb8 = bb8[2,3]bb8[0,1]
    bb3 ^= bb12
    bb9 = bb9[2,3]bb9[0,1]
    bb4 ^= bb14
    bb12 = bb12[2,3]bb12[0,1]
    bb5 ^= bb11
    bb14 = bb14[2,3]bb14[0,1]
    bb3 ^= bb13
    bb11 = bb11[2,3]bb11[0,1]
    bb6 ^= bb15
    bb15 = bb15[2,3]bb15[0,1]
    bb7 ^= bb10
    bb10 = bb10[2,3]bb10[0,1]
    bb4 ^= bb13
    bb13 = bb13[2,3]bb13[0,1]
    bb0 ^= bb8
    bb8 aligned= mem128[c];c += 16
    bb1 ^= bb9
    bb9 aligned= mem128[c];c += 16
    bb6 ^= bb10
    bb10 aligned= mem128[c];c += 16
    bb4 ^= bb11
    bb11 aligned= mem128[c];c += 16
    bb2 ^= bb12
    bb12 aligned= mem128[c];c += 16
    bb7 ^= bb13
    bb13 aligned= mem128[c];c += 16
    bb3 ^= bb14
    bb14 aligned= mem128[c];c += 16
    bb5 ^= bb15
    bb15 aligned= mem128[c];c += 16
    #END MACRO aesround
  
    #BEGIN MACRO aesround
    bb1 ^= bb9
    z = &SR_stack
    SR aligned= mem128[z]
    bb2 ^= bb10
    bb5 ^= bb13
      #BEGIN MACRO oneshiftrow
      bb1 = bb1[SR[0,1,2,3,4,5,6,7]] bb1[8,9,10,11,12,13,14,15]
      bb1 = bb1[0,1,2,3,4,5,6,7] bb1[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb0 ^= bb8
    bb3 ^= bb11
      #BEGIN MACRO oneshiftrow
      bb2 = bb2[SR[0,1,2,3,4,5,6,7]] bb2[8,9,10,11,12,13,14,15]
      bb2 = bb2[0,1,2,3,4,5,6,7] bb2[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb6 ^= bb14
    bb7 ^= bb15
      #BEGIN MACRO oneshiftrow
      bb5 = bb5[SR[0,1,2,3,4,5,6,7]] bb5[8,9,10,11,12,13,14,15]
      bb5 = bb5[0,1,2,3,4,5,6,7] bb5[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb4 ^= bb12
      #BEGIN MACRO oneshiftrow
      bb0 = bb0[SR[0,1,2,3,4,5,6,7]] bb0[8,9,10,11,12,13,14,15]
      bb0 = bb0[0,1,2,3,4,5,6,7] bb0[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb2 ^= bb1
      #BEGIN MACRO oneshiftrow
      bb3 = bb3[SR[0,1,2,3,4,5,6,7]] bb3[8,9,10,11,12,13,14,15]
      bb3 = bb3[0,1,2,3,4,5,6,7] bb3[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb5 ^= bb0
      #BEGIN MACRO oneshiftrow
      bb6 = bb6[SR[0,1,2,3,4,5,6,7]] bb6[8,9,10,11,12,13,14,15]
      bb6 = bb6[0,1,2,3,4,5,6,7] bb6[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb3 ^= bb0
      #BEGIN MACRO oneshiftrow
      bb7 = bb7[SR[0,1,2,3,4,5,6,7]] bb7[8,9,10,11,12,13,14,15]
      bb7 = bb7[0,1,2,3,4,5,6,7] bb7[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb5 ^= bb6
    bb6 ^= bb3
    bb3 ^= bb7
      #BEGIN MACRO oneshiftrow
      bb4 = bb4[SR[0,1,2,3,4,5,6,7]] bb4[8,9,10,11,12,13,14,15]
      bb4 = bb4[0,1,2,3,4,5,6,7] bb4[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb6 ^= bb2
    bb7 ^= bb5
    bb3 ^= bb4
    bb4 ^= bb5
    bb3 ^= bb1
    bb2 ^= bb7
    bb1 ^= bb5
      #BEGIN MACRO Inv_GF256
      bb11 = bb7 ^ bb4
      bb10 = bb1 ^ bb2
      bb9 = bb5 ^ bb3
      bb13 = bb2 ^ bb4
      bb12 = bb6 ^ bb0
      bb8 = bb10 & bb9
      bb14 = bb11 & bb12
      bb15 = bb11 ^ bb10
      bb11 |= bb12
      bb12 ^= bb9
      bb10 |= bb9
      bb15 &= bb12
      bb12 = bb3 ^ bb0
      bb11 ^= bb15
      bb13 &= bb12
      bb10 ^= bb14
      bb11 ^= bb13
      bb10 ^= bb13
      bb13 = bb7 ^ bb1
      bb12 = bb5 ^ bb6
      bb8 ^= bb14
      bb9 = bb13 | bb12
      bb13 &= bb12
      bb9 ^= bb15
      bb8 ^= bb13
      bb9 ^= bb14
      bb12 = bb2 & bb3
      bb13 = bb4 & bb0
      bb11 ^= bb12
      bb10 ^= bb13
      bb14 = bb1 & bb5
      bb12 = bb11 ^ bb10
      bb15 = bb7 | bb6
      bb9 ^= bb14
      bb8 ^= bb15
      bb11 &= bb9
      bb13 = bb9 ^ bb8
      bb14 = bb8 ^ bb11
      bb11 ^= bb10
      bb15 = bb12 & bb14
      bb13 &= bb11
      bb15 ^= bb10
      bb13 ^= bb8
      
      bb10 = bb14 ^ bb13
      bb9 ^= bb13
      bb10 &= bb8
      bb8 = bb5 ^ bb3
      bb14 ^= bb10
      bb9 ^= bb10
      bb14 &= bb15
      
      bb14 ^= bb12
      bb12 = bb6 ^ bb0
      bb10 = bb15 ^ bb14
      
      bb10 &= bb6
      bb6 ^= bb5
      bb5 &= bb15
      bb6 &= bb14
      bb14 ^= bb9
      bb15 ^= bb13
      bb6 ^= bb5
      bb11 = bb15 ^ bb14
      bb5 ^= bb10
      bb11 &= bb12
      bb12 ^= bb8
      bb8 &= bb15
      bb12 &= bb14
      bb10 = bb13 ^ bb9
      bb8 ^= bb12
      bb12 ^= bb11
      bb10 &= bb0
      bb0 ^= bb3
      bb3 &= bb13
      bb0 &= bb9
      bb6 ^= bb12
      bb0 ^= bb3
      bb3 ^= bb10
      bb0 ^= bb12
      bb5 ^= bb8
      bb3 ^= bb8
      bb12 = bb7 ^ bb4
      bb11 = bb15 ^ bb14
      bb8 = bb1 ^ bb2
      bb11 &= bb12
      bb12 ^= bb8
      bb8 &= bb15
      bb12 &= bb14
      bb10 = bb13 ^ bb9
      bb8 ^= bb12
      bb12 ^= bb11
      bb10 &= bb4
      bb4 ^= bb2
      bb2 &= bb13
      bb4 &= bb9
      bb15 ^= bb13
      bb14 ^= bb9
      bb4 ^= bb2
      bb11 = bb15 ^ bb14
      bb2 ^= bb10
      bb11 &= bb7
      bb7 ^= bb1
      bb1 &= bb15
      bb7 &= bb14
      bb4 ^= bb12
      bb7 ^= bb1
      bb1 ^= bb11
      bb7 ^= bb12
      bb1 ^= bb8
      bb2 ^= bb8
      #END MACRO Inv_GF256
    
    bb7 ^= bb0
    bb1 ^= bb6
    bb4 ^= bb7
    bb6 ^= bb0
    bb0 ^= bb1
    bb1 ^= bb5
    bb5 ^= bb2
    bb2 ^= bb3
    bb3 ^= bb5
    bb8 = bb0[3]bb0[0,1,2]
    bb4 ^= bb5
    bb9 = bb1[3]bb1[0,1,2]
    bb6 ^= bb3
    bb10 = bb4[3]bb4[0,1,2]
    bb0 ^= bb8
    bb11 = bb6[3]bb6[0,1,2]
    bb1 ^= bb9
    bb12 = bb3[3]bb3[0,1,2]
    bb4 ^= bb10
    bb15 = bb5[3]bb5[0,1,2]
    bb6 ^= bb11
    bb13 = bb7[3]bb7[0,1,2]
    bb3 ^= bb12
    bb14 = bb2[3]bb2[0,1,2]
    bb5 ^= bb15
    bb7 ^= bb13
    bb2 ^= bb14
    bb9 ^= bb0
    bb8 ^= bb5
    bb10 ^= bb1
    bb9 ^= bb5
    bb0 = bb0[2,3]bb0[0,1]
    bb11 ^= bb4
    bb1 = bb1[2,3]bb1[0,1]
    bb12 ^= bb6
    bb4 = bb4[2,3]bb4[0,1]
    bb13 ^= bb3
    bb6 = bb6[2,3]bb6[0,1]
    bb11 ^= bb5
    bb3 = bb3[2,3]bb3[0,1]
    bb14 ^= bb7
    bb7 = bb7[2,3]bb7[0,1]
    bb15 ^= bb2
    bb2 = bb2[2,3]bb2[0,1]
    bb12 ^= bb5
    bb5 = bb5[2,3]bb5[0,1]
    bb8 ^= bb0
    bb0 aligned= mem128[c];c += 16
    bb9 ^= bb1
    bb1 aligned= mem128[c];c += 16
    bb14 ^= bb2
    bb2 aligned= mem128[c];c += 16
    bb12 ^= bb3
    bb3 aligned= mem128[c];c += 16
    bb10 ^= bb4
    bb4 aligned= mem128[c];c += 16
    bb15 ^= bb5
    bb5 aligned= mem128[c];c += 16
    bb11 ^= bb6
    bb6 aligned= mem128[c];c += 16
    bb13 ^= bb7
    bb7 aligned= mem128[c];c += 16
    #END MACRO aesround
  
    #BEGIN MACRO aesround
    bb9 ^= bb1
    z = &SR_stack
    SR aligned= mem128[z]
    bb10 ^= bb2
    bb13 ^= bb5
      #BEGIN MACRO oneshiftrow
      bb9 = bb9[SR[0,1,2,3,4,5,6,7]] bb9[8,9,10,11,12,13,14,15]
      bb9 = bb9[0,1,2,3,4,5,6,7] bb9[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb8 ^= bb0
    bb11 ^= bb3
      #BEGIN MACRO oneshiftrow
      bb10 = bb10[SR[0,1,2,3,4,5,6,7]] bb10[8,9,10,11,12,13,14,15]
      bb10 = bb10[0,1,2,3,4,5,6,7] bb10[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb14 ^= bb6
    bb15 ^= bb7
      #BEGIN MACRO oneshiftrow
      bb13 = bb13[SR[0,1,2,3,4,5,6,7]] bb13[8,9,10,11,12,13,14,15]
      bb13 = bb13[0,1,2,3,4,5,6,7] bb13[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb12 ^= bb4
      #BEGIN MACRO oneshiftrow
      bb8 = bb8[SR[0,1,2,3,4,5,6,7]] bb8[8,9,10,11,12,13,14,15]
      bb8 = bb8[0,1,2,3,4,5,6,7] bb8[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb10 ^= bb9
      #BEGIN MACRO oneshiftrow
      bb11 = bb11[SR[0,1,2,3,4,5,6,7]] bb11[8,9,10,11,12,13,14,15]
      bb11 = bb11[0,1,2,3,4,5,6,7] bb11[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb13 ^= bb8
      #BEGIN MACRO oneshiftrow
      bb14 = bb14[SR[0,1,2,3,4,5,6,7]] bb14[8,9,10,11,12,13,14,15]
      bb14 = bb14[0,1,2,3,4,5,6,7] bb14[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb11 ^= bb8
      #BEGIN MACRO oneshiftrow
      bb15 = bb15[SR[0,1,2,3,4,5,6,7]] bb15[8,9,10,11,12,13,14,15]
      bb15 = bb15[0,1,2,3,4,5,6,7] bb15[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb13 ^= bb14
    bb14 ^= bb11
    bb11 ^= bb15
      #BEGIN MACRO oneshiftrow
      bb12 = bb12[SR[0,1,2,3,4,5,6,7]] bb12[8,9,10,11,12,13,14,15]
      bb12 = bb12[0,1,2,3,4,5,6,7] bb12[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb14 ^= bb10
    bb15 ^= bb13
    bb11 ^= bb12
    bb12 ^= bb13
    bb11 ^= bb9
    bb10 ^= bb15
    bb9 ^= bb13
      #BEGIN MACRO Inv_GF256
      bb3 = bb15 ^ bb12
      bb2 = bb9 ^ bb10
      bb1 = bb13 ^ bb11
      bb5 = bb10 ^ bb12
      bb4 = bb14 ^ bb8
      bb0 = bb2 & bb1
      bb6 = bb3 & bb4
      bb7 = bb3 ^ bb2
      bb3 |= bb4
      bb4 ^= bb1
      bb2 |= bb1
      bb7 &= bb4
      bb4 = bb11 ^ bb8
      bb3 ^= bb7
      bb5 &= bb4
      bb2 ^= bb6
      bb3 ^= bb5
      bb2 ^= bb5
      bb5 = bb15 ^ bb9
      bb4 = bb13 ^ bb14
      bb0 ^= bb6
      bb1 = bb5 | bb4
      bb5 &= bb4
      bb1 ^= bb7
      bb0 ^= bb5
      bb1 ^= bb6
      bb4 = bb10 & bb11
      bb5 = bb12 & bb8
      bb3 ^= bb4
      bb2 ^= bb5
      bb6 = bb9 & bb13
      bb4 = bb3 ^ bb2
      bb7 = bb15 | bb14
      bb1 ^= bb6
      bb0 ^= bb7
      bb3 &= bb1
      bb5 = bb1 ^ bb0
      bb6 = bb0 ^ bb3
      bb3 ^= bb2
      bb7 = bb4 & bb6
      bb5 &= bb3
      bb7 ^= bb2
      bb5 ^= bb0
      
      bb2 = bb6 ^ bb5
      bb1 ^= bb5
      bb2 &= bb0
      bb0 = bb13 ^ bb11
      bb6 ^= bb2
      bb1 ^= bb2
      bb6 &= bb7
      
      bb6 ^= bb4
      bb4 = bb14 ^ bb8
      bb2 = bb7 ^ bb6
      
      bb2 &= bb14
      bb14 ^= bb13
      bb13 &= bb7
      bb14 &= bb6
      bb6 ^= bb1
      bb7 ^= bb5
      bb14 ^= bb13
      bb3 = bb7 ^ bb6
      bb13 ^= bb2
      bb3 &= bb4
      bb4 ^= bb0
      bb0 &= bb7
      bb4 &= bb6
      bb2 = bb5 ^ bb1
      bb0 ^= bb4
      bb4 ^= bb3
      bb2 &= bb8
      bb8 ^= bb11
      bb11 &= bb5
      bb8 &= bb1
      bb14 ^= bb4
      bb8 ^= bb11
      bb11 ^= bb2
      bb8 ^= bb4
      bb13 ^= bb0
      bb11 ^= bb0
      bb4 = bb15 ^ bb12
      bb3 = bb7 ^ bb6
      bb0 = bb9 ^ bb10
      bb3 &= bb4
      bb4 ^= bb0
      bb0 &= bb7
      bb4 &= bb6
      bb2 = bb5 ^ bb1
      bb0 ^= bb4
      bb4 ^= bb3
      bb2 &= bb12
      bb12 ^= bb10
      bb10 &= bb5
      bb12 &= bb1
      bb7 ^= bb5
      bb6 ^= bb1
      bb12 ^= bb10
      bb3 = bb7 ^ bb6
      bb10 ^= bb2
      bb3 &= bb15
      bb15 ^= bb9
      bb9 &= bb7
      bb15 &= bb6
      bb12 ^= bb4
      bb15 ^= bb9
      bb9 ^= bb3
      bb15 ^= bb4
      bb9 ^= bb0
      bb10 ^= bb0
      #END MACRO Inv_GF256
    
    bb15 ^= bb8
    bb9 ^= bb14
    bb12 ^= bb15
    bb14 ^= bb8
    bb8 ^= bb9
    bb9 ^= bb13
    bb13 ^= bb10
    bb10 ^= bb11
    bb11 ^= bb13
    bb0 = bb8[3]bb8[0,1,2]
    bb12 ^= bb13
    bb1 = bb9[3]bb9[0,1,2]
    bb14 ^= bb11
    bb2 = bb12[3]bb12[0,1,2]
    bb8 ^= bb0
    bb3 = bb14[3]bb14[0,1,2]
    bb9 ^= bb1
    bb4 = bb11[3]bb11[0,1,2]
    bb12 ^= bb2
    bb7 = bb13[3]bb13[0,1,2]
    bb14 ^= bb3
    bb5 = bb15[3]bb15[0,1,2]
    bb11 ^= bb4
    bb6 = bb10[3]bb10[0,1,2]
    bb13 ^= bb7
    bb15 ^= bb5
    bb10 ^= bb6
    bb1 ^= bb8
    bb0 ^= bb13
    bb2 ^= bb9
    bb1 ^= bb13
    bb8 = bb8[2,3]bb8[0,1]
    bb3 ^= bb12
    bb9 = bb9[2,3]bb9[0,1]
    bb4 ^= bb14
    bb12 = bb12[2,3]bb12[0,1]
    bb5 ^= bb11
    bb14 = bb14[2,3]bb14[0,1]
    bb3 ^= bb13
    bb11 = bb11[2,3]bb11[0,1]
    bb6 ^= bb15
    bb15 = bb15[2,3]bb15[0,1]
    bb7 ^= bb10
    bb10 = bb10[2,3]bb10[0,1]
    bb4 ^= bb13
    bb13 = bb13[2,3]bb13[0,1]
    bb0 ^= bb8
    bb8 aligned= mem128[c];c += 16
    bb1 ^= bb9
    bb9 aligned= mem128[c];c += 16
    bb6 ^= bb10
    bb10 aligned= mem128[c];c += 16
    bb4 ^= bb11
    bb11 aligned= mem128[c];c += 16
    bb2 ^= bb12
    bb12 aligned= mem128[c];c += 16
    bb7 ^= bb13
    bb13 aligned= mem128[c];c += 16
    bb3 ^= bb14
    bb14 aligned= mem128[c];c += 16
    bb5 ^= bb15
    bb15 aligned= mem128[c];c += 16
    #END MACRO aesround
  
    #BEGIN MACRO aesround
    bb1 ^= bb9
    z = &SR_stack
    SR aligned= mem128[z]
    bb2 ^= bb10
    bb5 ^= bb13
      #BEGIN MACRO oneshiftrow
      bb1 = bb1[SR[0,1,2,3,4,5,6,7]] bb1[8,9,10,11,12,13,14,15]
      bb1 = bb1[0,1,2,3,4,5,6,7] bb1[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb0 ^= bb8
    bb3 ^= bb11
      #BEGIN MACRO oneshiftrow
      bb2 = bb2[SR[0,1,2,3,4,5,6,7]] bb2[8,9,10,11,12,13,14,15]
      bb2 = bb2[0,1,2,3,4,5,6,7] bb2[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb6 ^= bb14
    bb7 ^= bb15
      #BEGIN MACRO oneshiftrow
      bb5 = bb5[SR[0,1,2,3,4,5,6,7]] bb5[8,9,10,11,12,13,14,15]
      bb5 = bb5[0,1,2,3,4,5,6,7] bb5[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb4 ^= bb12
      #BEGIN MACRO oneshiftrow
      bb0 = bb0[SR[0,1,2,3,4,5,6,7]] bb0[8,9,10,11,12,13,14,15]
      bb0 = bb0[0,1,2,3,4,5,6,7] bb0[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb2 ^= bb1
      #BEGIN MACRO oneshiftrow
      bb3 = bb3[SR[0,1,2,3,4,5,6,7]] bb3[8,9,10,11,12,13,14,15]
      bb3 = bb3[0,1,2,3,4,5,6,7] bb3[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb5 ^= bb0
      #BEGIN MACRO oneshiftrow
      bb6 = bb6[SR[0,1,2,3,4,5,6,7]] bb6[8,9,10,11,12,13,14,15]
      bb6 = bb6[0,1,2,3,4,5,6,7] bb6[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb3 ^= bb0
      #BEGIN MACRO oneshiftrow
      bb7 = bb7[SR[0,1,2,3,4,5,6,7]] bb7[8,9,10,11,12,13,14,15]
      bb7 = bb7[0,1,2,3,4,5,6,7] bb7[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb5 ^= bb6
    bb6 ^= bb3
    bb3 ^= bb7
      #BEGIN MACRO oneshiftrow
      bb4 = bb4[SR[0,1,2,3,4,5,6,7]] bb4[8,9,10,11,12,13,14,15]
      bb4 = bb4[0,1,2,3,4,5,6,7] bb4[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb6 ^= bb2
    bb7 ^= bb5
    bb3 ^= bb4
    bb4 ^= bb5
    bb3 ^= bb1
    bb2 ^= bb7
    bb1 ^= bb5
      #BEGIN MACRO Inv_GF256
      bb11 = bb7 ^ bb4
      bb10 = bb1 ^ bb2
      bb9 = bb5 ^ bb3
      bb13 = bb2 ^ bb4
      bb12 = bb6 ^ bb0
      bb8 = bb10 & bb9
      bb14 = bb11 & bb12
      bb15 = bb11 ^ bb10
      bb11 |= bb12
      bb12 ^= bb9
      bb10 |= bb9
      bb15 &= bb12
      bb12 = bb3 ^ bb0
      bb11 ^= bb15
      bb13 &= bb12
      bb10 ^= bb14
      bb11 ^= bb13
      bb10 ^= bb13
      bb13 = bb7 ^ bb1
      bb12 = bb5 ^ bb6
      bb8 ^= bb14
      bb9 = bb13 | bb12
      bb13 &= bb12
      bb9 ^= bb15
      bb8 ^= bb13
      bb9 ^= bb14
      bb12 = bb2 & bb3
      bb13 = bb4 & bb0
      bb11 ^= bb12
      bb10 ^= bb13
      bb14 = bb1 & bb5
      bb12 = bb11 ^ bb10
      bb15 = bb7 | bb6
      bb9 ^= bb14
      bb8 ^= bb15
      bb11 &= bb9
      bb13 = bb9 ^ bb8
      bb14 = bb8 ^ bb11
      bb11 ^= bb10
      bb15 = bb12 & bb14
      bb13 &= bb11
      bb15 ^= bb10
      bb13 ^= bb8
      
      bb10 = bb14 ^ bb13
      bb9 ^= bb13
      bb10 &= bb8
      bb8 = bb5 ^ bb3
      bb14 ^= bb10
      bb9 ^= bb10
      bb14 &= bb15
      
      bb14 ^= bb12
      bb12 = bb6 ^ bb0
      bb10 = bb15 ^ bb14
      
      bb10 &= bb6
      bb6 ^= bb5
      bb5 &= bb15
      bb6 &= bb14
      bb14 ^= bb9
      bb15 ^= bb13
      bb6 ^= bb5
      bb11 = bb15 ^ bb14
      bb5 ^= bb10
      bb11 &= bb12
      bb12 ^= bb8
      bb8 &= bb15
      bb12 &= bb14
      bb10 = bb13 ^ bb9
      bb8 ^= bb12
      bb12 ^= bb11
      bb10 &= bb0
      bb0 ^= bb3
      bb3 &= bb13
      bb0 &= bb9
      bb6 ^= bb12
      bb0 ^= bb3
      bb3 ^= bb10
      bb0 ^= bb12
      bb5 ^= bb8
      bb3 ^= bb8
      bb12 = bb7 ^ bb4
      bb11 = bb15 ^ bb14
      bb8 = bb1 ^ bb2
      bb11 &= bb12
      bb12 ^= bb8
      bb8 &= bb15
      bb12 &= bb14
      bb10 = bb13 ^ bb9
      bb8 ^= bb12
      bb12 ^= bb11
      bb10 &= bb4
      bb4 ^= bb2
      bb2 &= bb13
      bb4 &= bb9
      bb15 ^= bb13
      bb14 ^= bb9
      bb4 ^= bb2
      bb11 = bb15 ^ bb14
      bb2 ^= bb10
      bb11 &= bb7
      bb7 ^= bb1
      bb1 &= bb15
      bb7 &= bb14
      bb4 ^= bb12
      bb7 ^= bb1
      bb1 ^= bb11
      bb7 ^= bb12
      bb1 ^= bb8
      bb2 ^= bb8
      #END MACRO Inv_GF256
    
    bb7 ^= bb0
    bb1 ^= bb6
    bb4 ^= bb7
    bb6 ^= bb0
    bb0 ^= bb1
    bb1 ^= bb5
    bb5 ^= bb2
    bb2 ^= bb3
    bb3 ^= bb5
    bb8 = bb0[3]bb0[0,1,2]
    bb4 ^= bb5
    bb9 = bb1[3]bb1[0,1,2]
    bb6 ^= bb3
    bb10 = bb4[3]bb4[0,1,2]
    bb0 ^= bb8
    bb11 = bb6[3]bb6[0,1,2]
    bb1 ^= bb9
    bb12 = bb3[3]bb3[0,1,2]
    bb4 ^= bb10
    bb15 = bb5[3]bb5[0,1,2]
    bb6 ^= bb11
    bb13 = bb7[3]bb7[0,1,2]
    bb3 ^= bb12
    bb14 = bb2[3]bb2[0,1,2]
    bb5 ^= bb15
    bb7 ^= bb13
    bb2 ^= bb14
    bb9 ^= bb0
    bb8 ^= bb5
    bb10 ^= bb1
    bb9 ^= bb5
    bb0 = bb0[2,3]bb0[0,1]
    bb11 ^= bb4
    bb1 = bb1[2,3]bb1[0,1]
    bb12 ^= bb6
    bb4 = bb4[2,3]bb4[0,1]
    bb13 ^= bb3
    bb6 = bb6[2,3]bb6[0,1]
    bb11 ^= bb5
    bb3 = bb3[2,3]bb3[0,1]
    bb14 ^= bb7
    bb7 = bb7[2,3]bb7[0,1]
    bb15 ^= bb2
    bb2 = bb2[2,3]bb2[0,1]
    bb12 ^= bb5
    bb5 = bb5[2,3]bb5[0,1]
    bb8 ^= bb0
    bb0 aligned= mem128[c];c += 16
    bb9 ^= bb1
    bb1 aligned= mem128[c];c += 16
    bb14 ^= bb2
    bb2 aligned= mem128[c];c += 16
    bb12 ^= bb3
    bb3 aligned= mem128[c];c += 16
    bb10 ^= bb4
    bb4 aligned= mem128[c];c += 16
    bb15 ^= bb5
    bb5 aligned= mem128[c];c += 16
    bb11 ^= bb6
    bb6 aligned= mem128[c];c += 16
    bb13 ^= bb7
    bb7 aligned= mem128[c];c += 16
    #END MACRO aesround
  
    #BEGIN MACRO aesround
    bb9 ^= bb1
    z = &SR_stack
    SR aligned= mem128[z]
    bb10 ^= bb2
    bb13 ^= bb5
      #BEGIN MACRO oneshiftrow
      bb9 = bb9[SR[0,1,2,3,4,5,6,7]] bb9[8,9,10,11,12,13,14,15]
      bb9 = bb9[0,1,2,3,4,5,6,7] bb9[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb8 ^= bb0
    bb11 ^= bb3
      #BEGIN MACRO oneshiftrow
      bb10 = bb10[SR[0,1,2,3,4,5,6,7]] bb10[8,9,10,11,12,13,14,15]
      bb10 = bb10[0,1,2,3,4,5,6,7] bb10[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb14 ^= bb6
    bb15 ^= bb7
      #BEGIN MACRO oneshiftrow
      bb13 = bb13[SR[0,1,2,3,4,5,6,7]] bb13[8,9,10,11,12,13,14,15]
      bb13 = bb13[0,1,2,3,4,5,6,7] bb13[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb12 ^= bb4
      #BEGIN MACRO oneshiftrow
      bb8 = bb8[SR[0,1,2,3,4,5,6,7]] bb8[8,9,10,11,12,13,14,15]
      bb8 = bb8[0,1,2,3,4,5,6,7] bb8[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb10 ^= bb9
      #BEGIN MACRO oneshiftrow
      bb11 = bb11[SR[0,1,2,3,4,5,6,7]] bb11[8,9,10,11,12,13,14,15]
      bb11 = bb11[0,1,2,3,4,5,6,7] bb11[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb13 ^= bb8
      #BEGIN MACRO oneshiftrow
      bb14 = bb14[SR[0,1,2,3,4,5,6,7]] bb14[8,9,10,11,12,13,14,15]
      bb14 = bb14[0,1,2,3,4,5,6,7] bb14[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb11 ^= bb8
      #BEGIN MACRO oneshiftrow
      bb15 = bb15[SR[0,1,2,3,4,5,6,7]] bb15[8,9,10,11,12,13,14,15]
      bb15 = bb15[0,1,2,3,4,5,6,7] bb15[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb13 ^= bb14
    bb14 ^= bb11
    bb11 ^= bb15
      #BEGIN MACRO oneshiftrow
      bb12 = bb12[SR[0,1,2,3,4,5,6,7]] bb12[8,9,10,11,12,13,14,15]
      bb12 = bb12[0,1,2,3,4,5,6,7] bb12[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb14 ^= bb10
    bb15 ^= bb13
    bb11 ^= bb12
    bb12 ^= bb13
    bb11 ^= bb9
    bb10 ^= bb15
    bb9 ^= bb13
      #BEGIN MACRO Inv_GF256
      bb3 = bb15 ^ bb12
      bb2 = bb9 ^ bb10
      bb1 = bb13 ^ bb11
      bb5 = bb10 ^ bb12
      bb4 = bb14 ^ bb8
      bb0 = bb2 & bb1
      bb6 = bb3 & bb4
      bb7 = bb3 ^ bb2
      bb3 |= bb4
      bb4 ^= bb1
      bb2 |= bb1
      bb7 &= bb4
      bb4 = bb11 ^ bb8
      bb3 ^= bb7
      bb5 &= bb4
      bb2 ^= bb6
      bb3 ^= bb5
      bb2 ^= bb5
      bb5 = bb15 ^ bb9
      bb4 = bb13 ^ bb14
      bb0 ^= bb6
      bb1 = bb5 | bb4
      bb5 &= bb4
      bb1 ^= bb7
      bb0 ^= bb5
      bb1 ^= bb6
      bb4 = bb10 & bb11
      bb5 = bb12 & bb8
      bb3 ^= bb4
      bb2 ^= bb5
      bb6 = bb9 & bb13
      bb4 = bb3 ^ bb2
      bb7 = bb15 | bb14
      bb1 ^= bb6
      bb0 ^= bb7
      bb3 &= bb1
      bb5 = bb1 ^ bb0
      bb6 = bb0 ^ bb3
      bb3 ^= bb2
      bb7 = bb4 & bb6
      bb5 &= bb3
      bb7 ^= bb2
      bb5 ^= bb0
      
      bb2 = bb6 ^ bb5
      bb1 ^= bb5
      bb2 &= bb0
      bb0 = bb13 ^ bb11
      bb6 ^= bb2
      bb1 ^= bb2
      bb6 &= bb7
      
      bb6 ^= bb4
      bb4 = bb14 ^ bb8
      bb2 = bb7 ^ bb6
      
      bb2 &= bb14
      bb14 ^= bb13
      bb13 &= bb7
      bb14 &= bb6
      bb6 ^= bb1
      bb7 ^= bb5
      bb14 ^= bb13
      bb3 = bb7 ^ bb6
      bb13 ^= bb2
      bb3 &= bb4
      bb4 ^= bb0
      bb0 &= bb7
      bb4 &= bb6
      bb2 = bb5 ^ bb1
      bb0 ^= bb4
      bb4 ^= bb3
      bb2 &= bb8
      bb8 ^= bb11
      bb11 &= bb5
      bb8 &= bb1
      bb14 ^= bb4
      bb8 ^= bb11
      bb11 ^= bb2
      bb8 ^= bb4
      bb13 ^= bb0
      bb11 ^= bb0
      bb4 = bb15 ^ bb12
      bb3 = bb7 ^ bb6
      bb0 = bb9 ^ bb10
      bb3 &= bb4
      bb4 ^= bb0
      bb0 &= bb7
      bb4 &= bb6
      bb2 = bb5 ^ bb1
      bb0 ^= bb4
      bb4 ^= bb3
      bb2 &= bb12
      bb12 ^= bb10
      bb10 &= bb5
      bb12 &= bb1
      bb7 ^= bb5
      bb6 ^= bb1
      bb12 ^= bb10
      bb3 = bb7 ^ bb6
      bb10 ^= bb2
      bb3 &= bb15
      bb15 ^= bb9
      bb9 &= bb7
      bb15 &= bb6
      bb12 ^= bb4
      bb15 ^= bb9
      bb9 ^= bb3
      bb15 ^= bb4
      bb9 ^= bb0
      bb10 ^= bb0
      #END MACRO Inv_GF256
    
    bb15 ^= bb8
    bb9 ^= bb14
    bb12 ^= bb15
    bb14 ^= bb8
    bb8 ^= bb9
    bb9 ^= bb13
    bb13 ^= bb10
    bb10 ^= bb11
    bb11 ^= bb13
    bb0 = bb8[3]bb8[0,1,2]
    bb12 ^= bb13
    bb1 = bb9[3]bb9[0,1,2]
    bb14 ^= bb11
    bb2 = bb12[3]bb12[0,1,2]
    bb8 ^= bb0
    bb3 = bb14[3]bb14[0,1,2]
    bb9 ^= bb1
    bb4 = bb11[3]bb11[0,1,2]
    bb12 ^= bb2
    bb7 = bb13[3]bb13[0,1,2]
    bb14 ^= bb3
    bb5 = bb15[3]bb15[0,1,2]
    bb11 ^= bb4
    bb6 = bb10[3]bb10[0,1,2]
    bb13 ^= bb7
    bb15 ^= bb5
    bb10 ^= bb6
    bb1 ^= bb8
    bb0 ^= bb13
    bb2 ^= bb9
    bb1 ^= bb13
    bb8 = bb8[2,3]bb8[0,1]
    bb3 ^= bb12
    bb9 = bb9[2,3]bb9[0,1]
    bb4 ^= bb14
    bb12 = bb12[2,3]bb12[0,1]
    bb5 ^= bb11
    bb14 = bb14[2,3]bb14[0,1]
    bb3 ^= bb13
    bb11 = bb11[2,3]bb11[0,1]
    bb6 ^= bb15
    bb15 = bb15[2,3]bb15[0,1]
    bb7 ^= bb10
    bb10 = bb10[2,3]bb10[0,1]
    bb4 ^= bb13
    bb13 = bb13[2,3]bb13[0,1]
    bb0 ^= bb8
    bb8 aligned= mem128[c];c += 16
    bb1 ^= bb9
    bb9 aligned= mem128[c];c += 16
    bb6 ^= bb10
    bb10 aligned= mem128[c];c += 16
    bb4 ^= bb11
    bb11 aligned= mem128[c];c += 16
    bb2 ^= bb12
    bb12 aligned= mem128[c];c += 16
    bb7 ^= bb13
    bb13 aligned= mem128[c];c += 16
    bb3 ^= bb14
    bb14 aligned= mem128[c];c += 16
    bb5 ^= bb15
    bb15 aligned= mem128[c];c += 16
    #END MACRO aesround
  
    #BEGIN MACRO aesround
    bb1 ^= bb9
    z = &SR_stack
    SR aligned= mem128[z]
    bb2 ^= bb10
    bb5 ^= bb13
      #BEGIN MACRO oneshiftrow
      bb1 = bb1[SR[0,1,2,3,4,5,6,7]] bb1[8,9,10,11,12,13,14,15]
      bb1 = bb1[0,1,2,3,4,5,6,7] bb1[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb0 ^= bb8
    bb3 ^= bb11
      #BEGIN MACRO oneshiftrow
      bb2 = bb2[SR[0,1,2,3,4,5,6,7]] bb2[8,9,10,11,12,13,14,15]
      bb2 = bb2[0,1,2,3,4,5,6,7] bb2[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb6 ^= bb14
    bb7 ^= bb15
      #BEGIN MACRO oneshiftrow
      bb5 = bb5[SR[0,1,2,3,4,5,6,7]] bb5[8,9,10,11,12,13,14,15]
      bb5 = bb5[0,1,2,3,4,5,6,7] bb5[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb4 ^= bb12
      #BEGIN MACRO oneshiftrow
      bb0 = bb0[SR[0,1,2,3,4,5,6,7]] bb0[8,9,10,11,12,13,14,15]
      bb0 = bb0[0,1,2,3,4,5,6,7] bb0[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb2 ^= bb1
      #BEGIN MACRO oneshiftrow
      bb3 = bb3[SR[0,1,2,3,4,5,6,7]] bb3[8,9,10,11,12,13,14,15]
      bb3 = bb3[0,1,2,3,4,5,6,7] bb3[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb5 ^= bb0
      #BEGIN MACRO oneshiftrow
      bb6 = bb6[SR[0,1,2,3,4,5,6,7]] bb6[8,9,10,11,12,13,14,15]
      bb6 = bb6[0,1,2,3,4,5,6,7] bb6[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb3 ^= bb0
      #BEGIN MACRO oneshiftrow
      bb7 = bb7[SR[0,1,2,3,4,5,6,7]] bb7[8,9,10,11,12,13,14,15]
      bb7 = bb7[0,1,2,3,4,5,6,7] bb7[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb5 ^= bb6
    bb6 ^= bb3
    bb3 ^= bb7
      #BEGIN MACRO oneshiftrow
      bb4 = bb4[SR[0,1,2,3,4,5,6,7]] bb4[8,9,10,11,12,13,14,15]
      bb4 = bb4[0,1,2,3,4,5,6,7] bb4[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb6 ^= bb2
    bb7 ^= bb5
    bb3 ^= bb4
    bb4 ^= bb5
    bb3 ^= bb1
    bb2 ^= bb7
    bb1 ^= bb5
      #BEGIN MACRO Inv_GF256
      bb11 = bb7 ^ bb4
      bb10 = bb1 ^ bb2
      bb9 = bb5 ^ bb3
      bb13 = bb2 ^ bb4
      bb12 = bb6 ^ bb0
      bb8 = bb10 & bb9
      bb14 = bb11 & bb12
      bb15 = bb11 ^ bb10
      bb11 |= bb12
      bb12 ^= bb9
      bb10 |= bb9
      bb15 &= bb12
      bb12 = bb3 ^ bb0
      bb11 ^= bb15
      bb13 &= bb12
      bb10 ^= bb14
      bb11 ^= bb13
      bb10 ^= bb13
      bb13 = bb7 ^ bb1
      bb12 = bb5 ^ bb6
      bb8 ^= bb14
      bb9 = bb13 | bb12
      bb13 &= bb12
      bb9 ^= bb15
      bb8 ^= bb13
      bb9 ^= bb14
      bb12 = bb2 & bb3
      bb13 = bb4 & bb0
      bb11 ^= bb12
      bb10 ^= bb13
      bb14 = bb1 & bb5
      bb12 = bb11 ^ bb10
      bb15 = bb7 | bb6
      bb9 ^= bb14
      bb8 ^= bb15
      bb11 &= bb9
      bb13 = bb9 ^ bb8
      bb14 = bb8 ^ bb11
      bb11 ^= bb10
      bb15 = bb12 & bb14
      bb13 &= bb11
      bb15 ^= bb10
      bb13 ^= bb8
      
      bb10 = bb14 ^ bb13
      bb9 ^= bb13
      bb10 &= bb8
      bb8 = bb5 ^ bb3
      bb14 ^= bb10
      bb9 ^= bb10
      bb14 &= bb15
      
      bb14 ^= bb12
      bb12 = bb6 ^ bb0
      bb10 = bb15 ^ bb14
      
      bb10 &= bb6
      bb6 ^= bb5
      bb5 &= bb15
      bb6 &= bb14
      bb14 ^= bb9
      bb15 ^= bb13
      bb6 ^= bb5
      bb11 = bb15 ^ bb14
      bb5 ^= bb10
      bb11 &= bb12
      bb12 ^= bb8
      bb8 &= bb15
      bb12 &= bb14
      bb10 = bb13 ^ bb9
      bb8 ^= bb12
      bb12 ^= bb11
      bb10 &= bb0
      bb0 ^= bb3
      bb3 &= bb13
      bb0 &= bb9
      bb6 ^= bb12
      bb0 ^= bb3
      bb3 ^= bb10
      bb0 ^= bb12
      bb5 ^= bb8
      bb3 ^= bb8
      bb12 = bb7 ^ bb4
      bb11 = bb15 ^ bb14
      bb8 = bb1 ^ bb2
      bb11 &= bb12
      bb12 ^= bb8
      bb8 &= bb15
      bb12 &= bb14
      bb10 = bb13 ^ bb9
      bb8 ^= bb12
      bb12 ^= bb11
      bb10 &= bb4
      bb4 ^= bb2
      bb2 &= bb13
      bb4 &= bb9
      bb15 ^= bb13
      bb14 ^= bb9
      bb4 ^= bb2
      bb11 = bb15 ^ bb14
      bb2 ^= bb10
      bb11 &= bb7
      bb7 ^= bb1
      bb1 &= bb15
      bb7 &= bb14
      bb4 ^= bb12
      bb7 ^= bb1
      bb1 ^= bb11
      bb7 ^= bb12
      bb1 ^= bb8
      bb2 ^= bb8
      #END MACRO Inv_GF256
    
    bb7 ^= bb0
    bb1 ^= bb6
    bb4 ^= bb7
    bb6 ^= bb0
    bb0 ^= bb1
    bb1 ^= bb5
    bb5 ^= bb2
    bb2 ^= bb3
    bb3 ^= bb5
    bb8 = bb0[3]bb0[0,1,2]
    bb4 ^= bb5
    bb9 = bb1[3]bb1[0,1,2]
    bb6 ^= bb3
    bb10 = bb4[3]bb4[0,1,2]
    bb0 ^= bb8
    bb11 = bb6[3]bb6[0,1,2]
    bb1 ^= bb9
    bb12 = bb3[3]bb3[0,1,2]
    bb4 ^= bb10
    bb15 = bb5[3]bb5[0,1,2]
    bb6 ^= bb11
    bb13 = bb7[3]bb7[0,1,2]
    bb3 ^= bb12
    bb14 = bb2[3]bb2[0,1,2]
    bb5 ^= bb15
    bb7 ^= bb13
    bb2 ^= bb14
    bb9 ^= bb0
    bb8 ^= bb5
    bb10 ^= bb1
    bb9 ^= bb5
    bb0 = bb0[2,3]bb0[0,1]
    bb11 ^= bb4
    bb1 = bb1[2,3]bb1[0,1]
    bb12 ^= bb6
    bb4 = bb4[2,3]bb4[0,1]
    bb13 ^= bb3
    bb6 = bb6[2,3]bb6[0,1]
    bb11 ^= bb5
    bb3 = bb3[2,3]bb3[0,1]
    bb14 ^= bb7
    bb7 = bb7[2,3]bb7[0,1]
    bb15 ^= bb2
    bb2 = bb2[2,3]bb2[0,1]
    bb12 ^= bb5
    bb5 = bb5[2,3]bb5[0,1]
    bb8 ^= bb0
    bb0 aligned= mem128[c];c += 16
    bb9 ^= bb1
    bb1 aligned= mem128[c];c += 16
    bb14 ^= bb2
    bb2 aligned= mem128[c];c += 16
    bb12 ^= bb3
    bb3 aligned= mem128[c];c += 16
    bb10 ^= bb4
    bb4 aligned= mem128[c];c += 16
    bb15 ^= bb5
    bb5 aligned= mem128[c];c += 16
    bb11 ^= bb6
    bb6 aligned= mem128[c];c += 16
    bb13 ^= bb7
    bb7 aligned= mem128[c];c += 16
    #END MACRO aesround
  
    #BEGIN MACRO aesround
    bb9 ^= bb1
    z = &SR_stack
    SR aligned= mem128[z]
    bb10 ^= bb2
    bb13 ^= bb5
      #BEGIN MACRO oneshiftrow
      bb9 = bb9[SR[0,1,2,3,4,5,6,7]] bb9[8,9,10,11,12,13,14,15]
      bb9 = bb9[0,1,2,3,4,5,6,7] bb9[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb8 ^= bb0
    bb11 ^= bb3
      #BEGIN MACRO oneshiftrow
      bb10 = bb10[SR[0,1,2,3,4,5,6,7]] bb10[8,9,10,11,12,13,14,15]
      bb10 = bb10[0,1,2,3,4,5,6,7] bb10[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb14 ^= bb6
    bb15 ^= bb7
      #BEGIN MACRO oneshiftrow
      bb13 = bb13[SR[0,1,2,3,4,5,6,7]] bb13[8,9,10,11,12,13,14,15]
      bb13 = bb13[0,1,2,3,4,5,6,7] bb13[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb12 ^= bb4
      #BEGIN MACRO oneshiftrow
      bb8 = bb8[SR[0,1,2,3,4,5,6,7]] bb8[8,9,10,11,12,13,14,15]
      bb8 = bb8[0,1,2,3,4,5,6,7] bb8[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb10 ^= bb9
      #BEGIN MACRO oneshiftrow
      bb11 = bb11[SR[0,1,2,3,4,5,6,7]] bb11[8,9,10,11,12,13,14,15]
      bb11 = bb11[0,1,2,3,4,5,6,7] bb11[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb13 ^= bb8
      #BEGIN MACRO oneshiftrow
      bb14 = bb14[SR[0,1,2,3,4,5,6,7]] bb14[8,9,10,11,12,13,14,15]
      bb14 = bb14[0,1,2,3,4,5,6,7] bb14[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb11 ^= bb8
      #BEGIN MACRO oneshiftrow
      bb15 = bb15[SR[0,1,2,3,4,5,6,7]] bb15[8,9,10,11,12,13,14,15]
      bb15 = bb15[0,1,2,3,4,5,6,7] bb15[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb13 ^= bb14
    bb14 ^= bb11
    bb11 ^= bb15
      #BEGIN MACRO oneshiftrow
      bb12 = bb12[SR[0,1,2,3,4,5,6,7]] bb12[8,9,10,11,12,13,14,15]
      bb12 = bb12[0,1,2,3,4,5,6,7] bb12[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb14 ^= bb10
    bb15 ^= bb13
    bb11 ^= bb12
    bb12 ^= bb13
    bb11 ^= bb9
    bb10 ^= bb15
    bb9 ^= bb13
      #BEGIN MACRO Inv_GF256
      bb3 = bb15 ^ bb12
      bb2 = bb9 ^ bb10
      bb1 = bb13 ^ bb11
      bb5 = bb10 ^ bb12
      bb4 = bb14 ^ bb8
      bb0 = bb2 & bb1
      bb6 = bb3 & bb4
      bb7 = bb3 ^ bb2
      bb3 |= bb4
      bb4 ^= bb1
      bb2 |= bb1
      bb7 &= bb4
      bb4 = bb11 ^ bb8
      bb3 ^= bb7
      bb5 &= bb4
      bb2 ^= bb6
      bb3 ^= bb5
      bb2 ^= bb5
      bb5 = bb15 ^ bb9
      bb4 = bb13 ^ bb14
      bb0 ^= bb6
      bb1 = bb5 | bb4
      bb5 &= bb4
      bb1 ^= bb7
      bb0 ^= bb5
      bb1 ^= bb6
      bb4 = bb10 & bb11
      bb5 = bb12 & bb8
      bb3 ^= bb4
      bb2 ^= bb5
      bb6 = bb9 & bb13
      bb4 = bb3 ^ bb2
      bb7 = bb15 | bb14
      bb1 ^= bb6
      bb0 ^= bb7
      bb3 &= bb1
      bb5 = bb1 ^ bb0
      bb6 = bb0 ^ bb3
      bb3 ^= bb2
      bb7 = bb4 & bb6
      bb5 &= bb3
      bb7 ^= bb2
      bb5 ^= bb0
      
      bb2 = bb6 ^ bb5
      bb1 ^= bb5
      bb2 &= bb0
      bb0 = bb13 ^ bb11
      bb6 ^= bb2
      bb1 ^= bb2
      bb6 &= bb7
      
      bb6 ^= bb4
      bb4 = bb14 ^ bb8
      bb2 = bb7 ^ bb6
      
      bb2 &= bb14
      bb14 ^= bb13
      bb13 &= bb7
      bb14 &= bb6
      bb6 ^= bb1
      bb7 ^= bb5
      bb14 ^= bb13
      bb3 = bb7 ^ bb6
      bb13 ^= bb2
      bb3 &= bb4
      bb4 ^= bb0
      bb0 &= bb7
      bb4 &= bb6
      bb2 = bb5 ^ bb1
      bb0 ^= bb4
      bb4 ^= bb3
      bb2 &= bb8
      bb8 ^= bb11
      bb11 &= bb5
      bb8 &= bb1
      bb14 ^= bb4
      bb8 ^= bb11
      bb11 ^= bb2
      bb8 ^= bb4
      bb13 ^= bb0
      bb11 ^= bb0
      bb4 = bb15 ^ bb12
      bb3 = bb7 ^ bb6
      bb0 = bb9 ^ bb10
      bb3 &= bb4
      bb4 ^= bb0
      bb0 &= bb7
      bb4 &= bb6
      bb2 = bb5 ^ bb1
      bb0 ^= bb4
      bb4 ^= bb3
      bb2 &= bb12
      bb12 ^= bb10
      bb10 &= bb5
      bb12 &= bb1
      bb7 ^= bb5
      bb6 ^= bb1
      bb12 ^= bb10
      bb3 = bb7 ^ bb6
      bb10 ^= bb2
      bb3 &= bb15
      bb15 ^= bb9
      bb9 &= bb7
      bb15 &= bb6
      bb12 ^= bb4
      bb15 ^= bb9
      bb9 ^= bb3
      bb15 ^= bb4
      bb9 ^= bb0
      bb10 ^= bb0
      #END MACRO Inv_GF256
    
    bb15 ^= bb8
    bb9 ^= bb14
    bb12 ^= bb15
    bb14 ^= bb8
    bb8 ^= bb9
    bb9 ^= bb13
    bb13 ^= bb10
    bb10 ^= bb11
    bb11 ^= bb13
    bb0 = bb8[3]bb8[0,1,2]
    bb12 ^= bb13
    bb1 = bb9[3]bb9[0,1,2]
    bb14 ^= bb11
    bb2 = bb12[3]bb12[0,1,2]
    bb8 ^= bb0
    bb3 = bb14[3]bb14[0,1,2]
    bb9 ^= bb1
    bb4 = bb11[3]bb11[0,1,2]
    bb12 ^= bb2
    bb7 = bb13[3]bb13[0,1,2]
    bb14 ^= bb3
    bb5 = bb15[3]bb15[0,1,2]
    bb11 ^= bb4
    bb6 = bb10[3]bb10[0,1,2]
    bb13 ^= bb7
    bb15 ^= bb5
    bb10 ^= bb6
    bb1 ^= bb8
    bb0 ^= bb13
    bb2 ^= bb9
    bb1 ^= bb13
    bb8 = bb8[2,3]bb8[0,1]
    bb3 ^= bb12
    bb9 = bb9[2,3]bb9[0,1]
    bb4 ^= bb14
    bb12 = bb12[2,3]bb12[0,1]
    bb5 ^= bb11
    bb14 = bb14[2,3]bb14[0,1]
    bb3 ^= bb13
    bb11 = bb11[2,3]bb11[0,1]
    bb6 ^= bb15
    bb15 = bb15[2,3]bb15[0,1]
    bb7 ^= bb10
    bb10 = bb10[2,3]bb10[0,1]
    bb4 ^= bb13
    bb13 = bb13[2,3]bb13[0,1]
    bb0 ^= bb8
    bb8 aligned= mem128[c];c += 16
    bb1 ^= bb9
    bb9 aligned= mem128[c];c += 16
    bb6 ^= bb10
    bb10 aligned= mem128[c];c += 16
    bb4 ^= bb11
    bb11 aligned= mem128[c];c += 16
    bb2 ^= bb12
    bb12 aligned= mem128[c];c += 16
    bb7 ^= bb13
    bb13 aligned= mem128[c];c += 16
    bb3 ^= bb14
    bb14 aligned= mem128[c];c += 16
    bb5 ^= bb15
    bb15 aligned= mem128[c];c += 16
    #END MACRO aesround
  
    #BEGIN MACRO aesround
    bb1 ^= bb9
    z = &SR_stack
    SR aligned= mem128[z]
    bb2 ^= bb10
    bb5 ^= bb13
      #BEGIN MACRO oneshiftrow
      bb1 = bb1[SR[0,1,2,3,4,5,6,7]] bb1[8,9,10,11,12,13,14,15]
      bb1 = bb1[0,1,2,3,4,5,6,7] bb1[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb0 ^= bb8
    bb3 ^= bb11
      #BEGIN MACRO oneshiftrow
      bb2 = bb2[SR[0,1,2,3,4,5,6,7]] bb2[8,9,10,11,12,13,14,15]
      bb2 = bb2[0,1,2,3,4,5,6,7] bb2[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb6 ^= bb14
    bb7 ^= bb15
      #BEGIN MACRO oneshiftrow
      bb5 = bb5[SR[0,1,2,3,4,5,6,7]] bb5[8,9,10,11,12,13,14,15]
      bb5 = bb5[0,1,2,3,4,5,6,7] bb5[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb4 ^= bb12
      #BEGIN MACRO oneshiftrow
      bb0 = bb0[SR[0,1,2,3,4,5,6,7]] bb0[8,9,10,11,12,13,14,15]
      bb0 = bb0[0,1,2,3,4,5,6,7] bb0[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb2 ^= bb1
      #BEGIN MACRO oneshiftrow
      bb3 = bb3[SR[0,1,2,3,4,5,6,7]] bb3[8,9,10,11,12,13,14,15]
      bb3 = bb3[0,1,2,3,4,5,6,7] bb3[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb5 ^= bb0
      #BEGIN MACRO oneshiftrow
      bb6 = bb6[SR[0,1,2,3,4,5,6,7]] bb6[8,9,10,11,12,13,14,15]
      bb6 = bb6[0,1,2,3,4,5,6,7] bb6[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb3 ^= bb0
      #BEGIN MACRO oneshiftrow
      bb7 = bb7[SR[0,1,2,3,4,5,6,7]] bb7[8,9,10,11,12,13,14,15]
      bb7 = bb7[0,1,2,3,4,5,6,7] bb7[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb5 ^= bb6
    bb6 ^= bb3
    bb3 ^= bb7
      #BEGIN MACRO oneshiftrow
      bb4 = bb4[SR[0,1,2,3,4,5,6,7]] bb4[8,9,10,11,12,13,14,15]
      bb4 = bb4[0,1,2,3,4,5,6,7] bb4[8+SR[8,9,10,11,12,13,14,15]]
      #END MACRO oneshiftrow
    
    bb6 ^= bb2
    bb7 ^= bb5
    bb3 ^= bb4
    bb4 ^= bb5
    bb3 ^= bb1
    bb2 ^= bb7
    bb1 ^= bb5
      #BEGIN MACRO Inv_GF256
      bb11 = bb7 ^ bb4
      bb10 = bb1 ^ bb2
      bb9 = bb5 ^ bb3
      bb13 = bb2 ^ bb4
      bb12 = bb6 ^ bb0
      bb8 = bb10 & bb9
      bb14 = bb11 & bb12
      bb15 = bb11 ^ bb10
      bb11 |= bb12
      bb12 ^= bb9
      bb10 |= bb9
      bb15 &= bb12
      bb12 = bb3 ^ bb0
      bb11 ^= bb15
      bb13 &= bb12
      bb10 ^= bb14
      bb11 ^= bb13
      bb10 ^= bb13
      bb13 = bb7 ^ bb1
      bb12 = bb5 ^ bb6
      bb8 ^= bb14
      bb9 = bb13 | bb12
      bb13 &= bb12
      bb9 ^= bb15
      bb8 ^= bb13
      bb9 ^= bb14
      bb12 = bb2 & bb3
      bb13 = bb4 & bb0
      bb11 ^= bb12
      bb10 ^= bb13
      bb14 = bb1 & bb5
      bb12 = bb11 ^ bb10
      bb15 = bb7 | bb6
      bb9 ^= bb14
      bb8 ^= bb15
      bb11 &= bb9
      bb13 = bb9 ^ bb8
      bb14 = bb8 ^ bb11
      bb11 ^= bb10
      bb15 = bb12 & bb14
      bb13 &= bb11
      bb15 ^= bb10
      bb13 ^= bb8
      
      bb10 = bb14 ^ bb13
      bb9 ^= bb13
      bb10 &= bb8
      bb8 = bb5 ^ bb3
      bb14 ^= bb10
      bb9 ^= bb10
      bb14 &= bb15
      
      bb14 ^= bb12
      bb12 = bb6 ^ bb0
      bb10 = bb15 ^ bb14
      
      bb10 &= bb6
      bb6 ^= bb5
      bb5 &= bb15
      bb6 &= bb14
      bb14 ^= bb9
      bb15 ^= bb13
      bb6 ^= bb5
      bb11 = bb15 ^ bb14
      bb5 ^= bb10
      bb11 &= bb12
      bb12 ^= bb8
      bb8 &= bb15
      bb12 &= bb14
      bb10 = bb13 ^ bb9
      bb8 ^= bb12
      bb12 ^= bb11
      bb10 &= bb0
      bb0 ^= bb3
      bb3 &= bb13
      bb0 &= bb9
      bb6 ^= bb12
      bb0 ^= bb3
      bb3 ^= bb10
      bb0 ^= bb12
      bb5 ^= bb8
      bb3 ^= bb8
      bb12 = bb7 ^ bb4
      bb11 = bb15 ^ bb14
      bb8 = bb1 ^ bb2
      bb11 &= bb12
      bb12 ^= bb8
      bb8 &= bb15
      bb12 &= bb14
      bb10 = bb13 ^ bb9
      bb8 ^= bb12
      bb12 ^= bb11
      bb10 &= bb4
      bb4 ^= bb2
      bb2 &= bb13
      bb4 &= bb9
      bb15 ^= bb13
      bb14 ^= bb9
      bb4 ^= bb2
      bb11 = bb15 ^ bb14
      bb2 ^= bb10
      bb11 &= bb7
      bb7 ^= bb1
      bb1 &= bb15
      bb7 &= bb14
      bb4 ^= bb12
      bb7 ^= bb1
      bb1 ^= bb11
      bb7 ^= bb12
      bb1 ^= bb8
      bb2 ^= bb8
      #END MACRO Inv_GF256
    
    bb7 ^= bb0
    bb1 ^= bb6
    bb4 ^= bb7
    bb6 ^= bb0
    bb0 ^= bb1
    bb1 ^= bb5
    bb5 ^= bb2
    bb2 ^= bb3
    bb3 ^= bb5
    bb8 = bb0[3]bb0[0,1,2]
    bb4 ^= bb5
    bb9 = bb1[3]bb1[0,1,2]
    bb6 ^= bb3
    bb10 = bb4[3]bb4[0,1,2]
    bb0 ^= bb8
    bb11 = bb6[3]bb6[0,1,2]
    bb1 ^= bb9
    bb12 = bb3[3]bb3[0,1,2]
    bb4 ^= bb10
    bb15 = bb5[3]bb5[0,1,2]
    bb6 ^= bb11
    bb13 = bb7[3]bb7[0,1,2]
    bb3 ^= bb12
    bb14 = bb2[3]bb2[0,1,2]
    bb5 ^= bb15
    bb7 ^= bb13
    bb2 ^= bb14
    bb9 ^= bb0
    bb8 ^= bb5
    bb10 ^= bb1
    bb9 ^= bb5
    bb0 = bb0[2,3]bb0[0,1]
    bb11 ^= bb4
    bb1 = bb1[2,3]bb1[0,1]
    bb12 ^= bb6
    bb4 = bb4[2,3]bb4[0,1]
    bb13 ^= bb3
    bb6 = bb6[2,3]bb6[0,1]
    bb11 ^= bb5
    bb3 = bb3[2,3]bb3[0,1]
    bb14 ^= bb7
    bb7 = bb7[2,3]bb7[0,1]
    bb15 ^= bb2
    bb2 = bb2[2,3]bb2[0,1]
    bb12 ^= bb5
    bb5 = bb5[2,3]bb5[0,1]
    bb8 ^= bb0
    bb0 aligned= mem128[c];c += 16
    bb9 ^= bb1
    bb1 aligned= mem128[c];c += 16
    bb14 ^= bb2
    bb2 aligned= mem128[c];c += 16
    bb12 ^= bb3
    bb3 aligned= mem128[c];c += 16
    bb10 ^= bb4
    bb4 aligned= mem128[c];c += 16
    bb15 ^= bb5
    bb5 aligned= mem128[c];c += 16
    bb11 ^= bb6
    bb6 aligned= mem128[c];c += 16
    bb13 ^= bb7
    bb7 aligned= mem128[c];c += 16
    #END MACRO aesround
  
    #BEGIN MACRO lastround
    bb8 ^= bb0
    z = &SR_stack
    SR aligned= mem128[z]
    bb9 ^= bb1
      #BEGIN MACRO oneshiftrowlast
        #BEGIN MACRO oneshiftrow
        bb8 = bb8[SR[0,1,2,3,4,5,6,7]] bb8[8,9,10,11,12,13,14,15]
        bb8 = bb8[0,1,2,3,4,5,6,7] bb8[8+SR[8,9,10,11,12,13,14,15]]
        #END MACRO oneshiftrow
      
        #BEGIN MACRO interleave
        bb8 = bb8[0,2,1,3]
        bb8 = bb8[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
        bb8 = bb8[0,2,1,3]
        bb8 = bb8[0,4,2,6,1,5,3,7]
        bb8 = bb8[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
        bb8 = bb8[1,0]
        #END MACRO interleave
      
      #END MACRO oneshiftrowlast
    
    bb10 ^= bb2
      #BEGIN MACRO oneshiftrowlast
        #BEGIN MACRO oneshiftrow
        bb9 = bb9[SR[0,1,2,3,4,5,6,7]] bb9[8,9,10,11,12,13,14,15]
        bb9 = bb9[0,1,2,3,4,5,6,7] bb9[8+SR[8,9,10,11,12,13,14,15]]
        #END MACRO oneshiftrow
      
        #BEGIN MACRO interleave
        bb9 = bb9[0,2,1,3]
        bb9 = bb9[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
        bb9 = bb9[0,2,1,3]
        bb9 = bb9[0,4,2,6,1,5,3,7]
        bb9 = bb9[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
        bb9 = bb9[1,0]
        #END MACRO interleave
      
      #END MACRO oneshiftrowlast
    
    bb11 ^= bb3
      #BEGIN MACRO oneshiftrowlast
        #BEGIN MACRO oneshiftrow
        bb10 = bb10[SR[0,1,2,3,4,5,6,7]] bb10[8,9,10,11,12,13,14,15]
        bb10 = bb10[0,1,2,3,4,5,6,7] bb10[8+SR[8,9,10,11,12,13,14,15]]
        #END MACRO oneshiftrow
      
        #BEGIN MACRO interleave
        bb10 = bb10[0,2,1,3]
        bb10 = bb10[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
        bb10 = bb10[0,2,1,3]
        bb10 = bb10[0,4,2,6,1,5,3,7]
        bb10 = bb10[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
        bb10 = bb10[1,0]
        #END MACRO interleave
      
      #END MACRO oneshiftrowlast
    
    bb12 ^= bb4
      #BEGIN MACRO oneshiftrowlast
        #BEGIN MACRO oneshiftrow
        bb11 = bb11[SR[0,1,2,3,4,5,6,7]] bb11[8,9,10,11,12,13,14,15]
        bb11 = bb11[0,1,2,3,4,5,6,7] bb11[8+SR[8,9,10,11,12,13,14,15]]
        #END MACRO oneshiftrow
      
        #BEGIN MACRO interleave
        bb11 = bb11[0,2,1,3]
        bb11 = bb11[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
        bb11 = bb11[0,2,1,3]
        bb11 = bb11[0,4,2,6,1,5,3,7]
        bb11 = bb11[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
        bb11 = bb11[1,0]
        #END MACRO interleave
      
      #END MACRO oneshiftrowlast
    
    bb10 ^= bb9
    bb13 ^= bb5
      #BEGIN MACRO oneshiftrowlast
        #BEGIN MACRO oneshiftrow
        bb12 = bb12[SR[0,1,2,3,4,5,6,7]] bb12[8,9,10,11,12,13,14,15]
        bb12 = bb12[0,1,2,3,4,5,6,7] bb12[8+SR[8,9,10,11,12,13,14,15]]
        #END MACRO oneshiftrow
      
        #BEGIN MACRO interleave
        bb12 = bb12[0,2,1,3]
        bb12 = bb12[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
        bb12 = bb12[0,2,1,3]
        bb12 = bb12[0,4,2,6,1,5,3,7]
        bb12 = bb12[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
        bb12 = bb12[1,0]
        #END MACRO interleave
      
      #END MACRO oneshiftrowlast
    
    bb11 ^= bb8
    bb14 ^= bb6
      #BEGIN MACRO oneshiftrowlast
        #BEGIN MACRO oneshiftrow
        bb13 = bb13[SR[0,1,2,3,4,5,6,7]] bb13[8,9,10,11,12,13,14,15]
        bb13 = bb13[0,1,2,3,4,5,6,7] bb13[8+SR[8,9,10,11,12,13,14,15]]
        #END MACRO oneshiftrow
      
        #BEGIN MACRO interleave
        bb13 = bb13[0,2,1,3]
        bb13 = bb13[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
        bb13 = bb13[0,2,1,3]
        bb13 = bb13[0,4,2,6,1,5,3,7]
        bb13 = bb13[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
        bb13 = bb13[1,0]
        #END MACRO interleave
      
      #END MACRO oneshiftrowlast
    
    bb15 ^= bb7
      #BEGIN MACRO oneshiftrowlast
        #BEGIN MACRO oneshiftrow
        bb14 = bb14[SR[0,1,2,3,4,5,6,7]] bb14[8,9,10,11,12,13,14,15]
        bb14 = bb14[0,1,2,3,4,5,6,7] bb14[8+SR[8,9,10,11,12,13,14,15]]
        #END MACRO oneshiftrow
      
        #BEGIN MACRO interleave
        bb14 = bb14[0,2,1,3]
        bb14 = bb14[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
        bb14 = bb14[0,2,1,3]
        bb14 = bb14[0,4,2,6,1,5,3,7]
        bb14 = bb14[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
        bb14 = bb14[1,0]
        #END MACRO interleave
      
      #END MACRO oneshiftrowlast
    
    bb13 ^= bb14
      #BEGIN MACRO oneshiftrowlast
        #BEGIN MACRO oneshiftrow
        bb15 = bb15[SR[0,1,2,3,4,5,6,7]] bb15[8,9,10,11,12,13,14,15]
        bb15 = bb15[0,1,2,3,4,5,6,7] bb15[8+SR[8,9,10,11,12,13,14,15]]
        #END MACRO oneshiftrow
      
        #BEGIN MACRO interleave
        bb15 = bb15[0,2,1,3]
        bb15 = bb15[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
        bb15 = bb15[0,2,1,3]
        bb15 = bb15[0,4,2,6,1,5,3,7]
        bb15 = bb15[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
        bb15 = bb15[1,0]
        #END MACRO interleave
      
      #END MACRO oneshiftrowlast
    
    bb13 ^= bb8
    bb14 ^= bb10
    bb14 ^= bb11
    bb11 ^= bb15
    bb15 ^= bb13
    bb11 ^= bb12
    bb12 ^= bb13
    bb11 ^= bb9
    bb10 ^= bb15
    bb9 ^= bb13
      #BEGIN MACRO Inv_GF256
      bb3 = bb15 ^ bb12
      bb2 = bb9 ^ bb10
      bb1 = bb13 ^ bb11
      bb5 = bb10 ^ bb12
      bb4 = bb14 ^ bb8
      bb0 = bb2 & bb1
      bb6 = bb3 & bb4
      bb7 = bb3 ^ bb2
      bb3 |= bb4
      bb4 ^= bb1
      bb2 |= bb1
      bb7 &= bb4
      bb4 = bb11 ^ bb8
      bb3 ^= bb7
      bb5 &= bb4
      bb2 ^= bb6
      bb3 ^= bb5
      bb2 ^= bb5
      bb5 = bb15 ^ bb9
      bb4 = bb13 ^ bb14
      bb0 ^= bb6
      bb1 = bb5 | bb4
      bb5 &= bb4
      bb1 ^= bb7
      bb0 ^= bb5
      bb1 ^= bb6
      bb4 = bb10 & bb11
      bb5 = bb12 & bb8
      bb3 ^= bb4
      bb2 ^= bb5
      bb6 = bb9 & bb13
      bb4 = bb3 ^ bb2
      bb7 = bb15 | bb14
      bb1 ^= bb6
      bb0 ^= bb7
      bb3 &= bb1
      bb5 = bb1 ^ bb0
      bb6 = bb0 ^ bb3
      bb3 ^= bb2
      bb7 = bb4 & bb6
      bb5 &= bb3
      bb7 ^= bb2
      bb5 ^= bb0
      
      bb2 = bb6 ^ bb5
      bb1 ^= bb5
      bb2 &= bb0
      bb0 = bb13 ^ bb11
      bb6 ^= bb2
      bb1 ^= bb2
      bb6 &= bb7
      
      bb6 ^= bb4
      bb4 = bb14 ^ bb8
      bb2 = bb7 ^ bb6
      
      bb2 &= bb14
      bb14 ^= bb13
      bb13 &= bb7
      bb14 &= bb6
      bb6 ^= bb1
      bb7 ^= bb5
      bb14 ^= bb13
      bb3 = bb7 ^ bb6
      bb13 ^= bb2
      bb3 &= bb4
      bb4 ^= bb0
      bb0 &= bb7
      bb4 &= bb6
      bb2 = bb5 ^ bb1
      bb0 ^= bb4
      bb4 ^= bb3
      bb2 &= bb8
      bb8 ^= bb11
      bb11 &= bb5
      bb8 &= bb1
      bb14 ^= bb4
      bb8 ^= bb11
      bb11 ^= bb2
      bb8 ^= bb4
      bb13 ^= bb0
      bb11 ^= bb0
      bb4 = bb15 ^ bb12
      bb3 = bb7 ^ bb6
      bb0 = bb9 ^ bb10
      bb3 &= bb4
      bb4 ^= bb0
      bb0 &= bb7
      bb4 &= bb6
      bb2 = bb5 ^ bb1
      bb0 ^= bb4
      bb4 ^= bb3
      bb2 &= bb12
      bb12 ^= bb10
      bb10 &= bb5
      bb12 &= bb1
      bb7 ^= bb5
      bb6 ^= bb1
      bb12 ^= bb10
      bb3 = bb7 ^ bb6
      bb10 ^= bb2
      bb3 &= bb15
      bb15 ^= bb9
      bb9 &= bb7
      bb15 &= bb6
      bb12 ^= bb4
      bb15 ^= bb9
      bb9 ^= bb3
      bb15 ^= bb4
      bb9 ^= bb0
      bb10 ^= bb0
      #END MACRO Inv_GF256
    
    bb15 ^= bb8
    bb9 ^= bb14
    bb12 ^= bb15
    bb14 ^= bb8
    bb8 ^= bb9
    bb9 ^= bb13
    bb13 ^= bb10
    bb10 ^= bb11
    bb11 ^= bb13
    bb12 ^= bb13
    bb14 ^= bb11
    bb0 aligned= mem128[c];c += 16
    bb8 ^= bb0
    bb1 aligned= mem128[c];c += 16
    bb9 ^= bb1
    bb2 aligned= mem128[c];c += 16
    bb12 ^= bb2
    bb3 aligned= mem128[c];c += 16
    bb14 ^= bb3
    bb4 aligned= mem128[c];c += 16
    bb11 ^= bb4
    bb5 aligned= mem128[c];c += 16
    bb15 ^= bb5
    bb6 aligned= mem128[c];c += 16
    bb10 ^= bb6
    bb7 aligned= mem128[c];c += 16
    bb13 ^= bb7
    #END MACRO lastround
  
    #BEGIN MACRO bitslice
    u = 0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55
      #BEGIN MACRO swapmove4
      2x t0 = bb10 unsigned>> 1
      2x t2 = bb11 unsigned>> 1
      2x t4 = bb12 unsigned>> 1
      2x t6 = bb8 unsigned>> 1
      t0 ^= bb13
      t2 ^= bb15
      t4 ^= bb14
      t6 ^= bb9
      t0 &= u
      t2 &= u
      t4 &= u
      t6 &= u
      bb13 ^= t0
      bb15 ^= t2
      bb14 ^= t4
      bb9 ^= t6
      2x t0 <<= 1
      2x t2 <<= 1
      2x t4 <<= 1
      2x t6 <<= 1
      bb10 ^= t0
      bb11 ^= t2
      bb12 ^= t4
      bb8 ^= t6
      #END MACRO swapmove4
    
    
    u = 0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33
      #BEGIN MACRO swapmove4
      2x t0 = bb15 unsigned>> 2
      2x t2 = bb11 unsigned>> 2
      2x t4 = bb9 unsigned>> 2
      2x t6 = bb8 unsigned>> 2
      t0 ^= bb13
      t2 ^= bb10
      t4 ^= bb14
      t6 ^= bb12
      t0 &= u
      t2 &= u
      t4 &= u
      t6 &= u
      bb13 ^= t0
      bb10 ^= t2
      bb14 ^= t4
      bb12 ^= t6
      2x t0 <<= 2
      2x t2 <<= 2
      2x t4 <<= 2
      2x t6 <<= 2
      bb15 ^= t0
      bb11 ^= t2
      bb9 ^= t4
      bb8 ^= t6
      #END MACRO swapmove4
    
    
    u = 0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f
      #BEGIN MACRO swapmove4
      2x t0 = bb14 unsigned>> 4
      2x t2 = bb12 unsigned>> 4
      2x t4 = bb9 unsigned>> 4
      2x t6 = bb8 unsigned>> 4
      t0 ^= bb13
      t2 ^= bb10
      t4 ^= bb15
      t6 ^= bb11
      t0 &= u
      t2 &= u
      t4 &= u
      t6 &= u
      bb13 ^= t0
      bb10 ^= t2
      bb15 ^= t4
      bb11 ^= t6
      2x t0 <<= 4
      2x t2 <<= 4
      2x t4 <<= 4
      2x t6 <<= 4
      bb14 ^= t0
      bb12 ^= t2
      bb9 ^= t4
      bb8 ^= t6
      #END MACRO swapmove4
    
    #END MACRO bitslice
  
  #END MACRO aesrounds


unsigned<? =? input_2-128
goto partial if unsigned<
goto full if =

tmp = mem32[np+12]
tmp = tmp[3]tmp[2]tmp[1]tmp[0]
tmp += 8
tmp = tmp[3]tmp[2]tmp[1]tmp[0]
mem32[np+12] = tmp

mem128[input_0] = bb8;input_0 += 16
mem128[input_0] = bb9;input_0 += 16
mem128[input_0] = bb12;input_0 += 16
mem128[input_0] = bb14;input_0 += 16
mem128[input_0] = bb11;input_0 += 16
mem128[input_0] = bb15;input_0 += 16
mem128[input_0] = bb10;input_0 += 16
mem128[input_0] = bb13;input_0 += 16

input_2 -= 128

goto enc_block

partial:

blp = &bl
mem128[blp] = bb8;blp += 16
mem128[blp] = bb9;blp += 16
mem128[blp] = bb12;blp += 16
mem128[blp] = bb14;blp += 16
mem128[blp] = bb11;blp += 16
mem128[blp] = bb15;blp += 16
mem128[blp] = bb10;blp += 16
mem128[blp] = bb13;blp += 16
blp = &bl

bytes:

=? input_2-0
goto end if =

b = mem8[blp];blp += 1
mem8[input_0] = b;input_0 += 1

input_2 -= 1
goto bytes

full:

mem128[input_0] = bb8;input_0 += 16
mem128[input_0] = bb9;input_0 += 16
mem128[input_0] = bb12;input_0 += 16
mem128[input_0] = bb14;input_0 += 16
mem128[input_0] = bb11;input_0 += 16
mem128[input_0] = bb15;input_0 += 16
mem128[input_0] = bb10;input_0 += 16
mem128[input_0] = bb13;input_0 += 16

end:

assign r4 r5 to caller_r4 caller_r5 = stack_r45
assign r6 r7 to caller_r6 caller_r7 = stack_r67

qpopreturn
