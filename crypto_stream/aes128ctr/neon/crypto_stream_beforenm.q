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
reg128 xmm0
reg128 xmm1
reg128 xmm2
reg128 xmm3
reg128 xmm4
reg128 xmm5
reg128 xmm6
reg128 xmm7
reg128 xmm8
reg128 xmm9
reg128 xmm10
reg128 xmm11
reg128 xmm12
reg128 xmm13
reg128 xmm14
reg128 xmm15
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

qpushenter crypto_stream_aes128ctr_neon_beforenm

  #BEGIN MACRO bitslicekey0
  xmm0 = mem128[input_1]
    #BEGIN MACRO interleave
    xmm0 = xmm0[0,2,1,3]
    xmm0 = xmm0[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
    xmm0 = xmm0[0,2,1,3]
    xmm0 = xmm0[0,4,2,6,1,5,3,7]
    xmm0 = xmm0[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
    xmm0 = xmm0[1,0]
    #END MACRO interleave
  
  xmm1 = xmm0
  xmm2 = xmm0
  xmm3 = xmm0
  xmm4 = xmm0
  xmm5 = xmm0
  xmm6 = xmm0
  xmm7 = xmm0
  
    #BEGIN MACRO bitslice
    u = 0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55
      #BEGIN MACRO swapmove4
      2x t0 = xmm6 unsigned>> 1
      2x t2 = xmm4 unsigned>> 1
      2x t4 = xmm2 unsigned>> 1
      2x t6 = xmm0 unsigned>> 1
      t0 ^= xmm7
      t2 ^= xmm5
      t4 ^= xmm3
      t6 ^= xmm1
      t0 &= u
      t2 &= u
      t4 &= u
      t6 &= u
      xmm7 ^= t0
      xmm5 ^= t2
      xmm3 ^= t4
      xmm1 ^= t6
      2x t0 <<= 1
      2x t2 <<= 1
      2x t4 <<= 1
      2x t6 <<= 1
      xmm6 ^= t0
      xmm4 ^= t2
      xmm2 ^= t4
      xmm0 ^= t6
      #END MACRO swapmove4
    
    
    u = 0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33,0x33
      #BEGIN MACRO swapmove4
      2x t0 = xmm5 unsigned>> 2
      2x t2 = xmm4 unsigned>> 2
      2x t4 = xmm1 unsigned>> 2
      2x t6 = xmm0 unsigned>> 2
      t0 ^= xmm7
      t2 ^= xmm6
      t4 ^= xmm3
      t6 ^= xmm2
      t0 &= u
      t2 &= u
      t4 &= u
      t6 &= u
      xmm7 ^= t0
      xmm6 ^= t2
      xmm3 ^= t4
      xmm2 ^= t6
      2x t0 <<= 2
      2x t2 <<= 2
      2x t4 <<= 2
      2x t6 <<= 2
      xmm5 ^= t0
      xmm4 ^= t2
      xmm1 ^= t4
      xmm0 ^= t6
      #END MACRO swapmove4
    
    
    u = 0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f
      #BEGIN MACRO swapmove4
      2x t0 = xmm3 unsigned>> 4
      2x t2 = xmm2 unsigned>> 4
      2x t4 = xmm1 unsigned>> 4
      2x t6 = xmm0 unsigned>> 4
      t0 ^= xmm7
      t2 ^= xmm6
      t4 ^= xmm5
      t6 ^= xmm4
      t0 &= u
      t2 &= u
      t4 &= u
      t6 &= u
      xmm7 ^= t0
      xmm6 ^= t2
      xmm5 ^= t4
      xmm4 ^= t6
      2x t0 <<= 4
      2x t2 <<= 4
      2x t4 <<= 4
      2x t6 <<= 4
      xmm3 ^= t0
      xmm2 ^= t2
      xmm1 ^= t4
      xmm0 ^= t6
      #END MACRO swapmove4
    
    #END MACRO bitslice
  
  
  mem128[input_0] aligned= xmm0;input_0 += 16
  mem128[input_0] aligned= xmm1;input_0 += 16
  mem128[input_0] aligned= xmm2;input_0 += 16
  mem128[input_0] aligned= xmm3;input_0 += 16
  mem128[input_0] aligned= xmm4;input_0 += 16
  mem128[input_0] aligned= xmm5;input_0 += 16
  mem128[input_0] aligned= xmm6;input_0 += 16
  mem128[input_0] aligned= xmm7;input_0 += 16
  input_0 -= 128
  #END MACRO bitslicekey0


  #BEGIN MACRO keyexpbs1
    #BEGIN MACRO rotbyte8
    xmm0 = xmm0[3]xmm0[0,1,2] 
    xmm1 = xmm1[3]xmm1[0,1,2] 
    xmm2 = xmm2[3]xmm2[0,1,2] 
    4x xmm0 <<= 24 
    xmm3 = xmm3[3]xmm3[0,1,2] 
    4x xmm1 <<= 24 
    xmm4 = xmm4[3]xmm4[0,1,2] 
    4x xmm2 <<= 24 
    xmm5 = xmm5[3]xmm5[0,1,2] 
    4x xmm3 <<= 24 
    xmm6 = xmm6[3]xmm6[0,1,2] 
    4x xmm4 <<= 24 
    xmm7 = xmm7[3]xmm7[0,1,2] 
    4x xmm5 <<= 24 
    4x xmm6 <<= 24 
    4x xmm7 <<= 24 
    #END MACRO rotbyte8
  
  
    #BEGIN MACRO sbox
    xmm5 ^= xmm6
    xmm2 ^= xmm1
    xmm5 ^= xmm0
    xmm6 ^= xmm2
    xmm3 ^= xmm0
    xmm6 ^= xmm3
    xmm3 ^= xmm7
    xmm7 ^= xmm5
    xmm3 ^= xmm4
    xmm4 ^= xmm5
    xmm3 ^= xmm1
    xmm2 ^= xmm7
    xmm1 ^= xmm5
      #BEGIN MACRO Inv_GF256
      xmm11 = xmm7 ^ xmm4
      xmm10 = xmm1 ^ xmm2
      xmm9 = xmm5 ^ xmm3
      xmm13 = xmm2 ^ xmm4
      xmm12 = xmm6 ^ xmm0
      xmm8 = xmm10 & xmm9
      xmm14 = xmm11 & xmm12
      xmm15 = xmm11 ^ xmm10
      xmm11 |= xmm12
      xmm12 ^= xmm9
      xmm10 |= xmm9
      xmm15 &= xmm12
      xmm12 = xmm3 ^ xmm0
      xmm11 ^= xmm15
      xmm13 &= xmm12
      xmm10 ^= xmm14
      xmm11 ^= xmm13
      xmm10 ^= xmm13
      xmm13 = xmm7 ^ xmm1
      xmm12 = xmm5 ^ xmm6
      xmm8 ^= xmm14
      xmm9 = xmm13 | xmm12
      xmm13 &= xmm12
      xmm9 ^= xmm15
      xmm8 ^= xmm13
      xmm9 ^= xmm14
      xmm12 = xmm2 & xmm3
      xmm13 = xmm4 & xmm0
      xmm11 ^= xmm12
      xmm10 ^= xmm13
      xmm14 = xmm1 & xmm5
      xmm12 = xmm11 ^ xmm10
      xmm15 = xmm7 | xmm6
      xmm9 ^= xmm14
      xmm8 ^= xmm15
      xmm11 &= xmm9
      xmm13 = xmm9 ^ xmm8
      xmm14 = xmm8 ^ xmm11
      xmm11 ^= xmm10
      xmm15 = xmm12 & xmm14
      xmm13 &= xmm11
      xmm15 ^= xmm10
      xmm13 ^= xmm8
      
      xmm10 = xmm14 ^ xmm13
      xmm9 ^= xmm13
      xmm10 &= xmm8
      xmm8 = xmm5 ^ xmm3
      xmm14 ^= xmm10
      xmm9 ^= xmm10
      xmm14 &= xmm15
      
      xmm14 ^= xmm12
      xmm12 = xmm6 ^ xmm0
      xmm10 = xmm15 ^ xmm14
      
      xmm10 &= xmm6
      xmm6 ^= xmm5
      xmm5 &= xmm15
      xmm6 &= xmm14
      xmm14 ^= xmm9
      xmm15 ^= xmm13
      xmm6 ^= xmm5
      xmm11 = xmm15 ^ xmm14
      xmm5 ^= xmm10
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm0
      xmm0 ^= xmm3
      xmm3 &= xmm13
      xmm0 &= xmm9
      xmm6 ^= xmm12
      xmm0 ^= xmm3
      xmm3 ^= xmm10
      xmm0 ^= xmm12
      xmm5 ^= xmm8
      xmm3 ^= xmm8
      xmm12 = xmm7 ^ xmm4
      xmm11 = xmm15 ^ xmm14
      xmm8 = xmm1 ^ xmm2
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm4
      xmm4 ^= xmm2
      xmm2 &= xmm13
      xmm4 &= xmm9
      xmm15 ^= xmm13
      xmm14 ^= xmm9
      xmm4 ^= xmm2
      xmm11 = xmm15 ^ xmm14
      xmm2 ^= xmm10
      xmm11 &= xmm7
      xmm7 ^= xmm1
      xmm1 &= xmm15
      xmm7 &= xmm14
      xmm4 ^= xmm12
      xmm7 ^= xmm1
      xmm1 ^= xmm11
      xmm7 ^= xmm12
      xmm1 ^= xmm8
      xmm2 ^= xmm8
      #END MACRO Inv_GF256
    
    xmm7 ^= xmm0
    xmm1 ^= xmm6
    xmm4 ^= xmm7
    xmm6 ^= xmm0
    xmm0 ^= xmm1
    xmm1 ^= xmm5
    xmm5 ^= xmm2
    xmm2 ^= xmm3
    xmm3 ^= xmm5
    xmm4 ^= xmm5
    xmm6 ^= xmm3
    #END MACRO sbox
  
  
    #BEGIN MACRO setrcon
    2x u = 0
    u = u[0],0xffffffff00000000
    #END MACRO setrcon
  
  xmm0 ^= u
    #BEGIN MACRO expb8
    4x xmm0 unsigned>>= 24
    4x xmm1 unsigned>>= 24
    4x xmm4 unsigned>>= 24
    4x xmm6 unsigned>>= 24
    4x u0 = xmm0 << 8
    4x u1 = xmm1 << 8
    4x u2 = xmm4 << 8
    4x u3 = xmm6 << 8
    xmm0 |= u0
    xmm1 |= u1
    xmm4 |= u2
    xmm6 |= u3
    4x u0 = xmm0 << 16
    4x u1 = xmm1 << 16
    4x u2 = xmm4 << 16
    4x u3 = xmm6 << 16
    xmm0 |= u0
    xmm1 |= u1
    xmm4 |= u2
    xmm6 |= u3
    4x xmm3 unsigned>>= 24
    4x xmm7 unsigned>>= 24
    4x xmm2 unsigned>>= 24
    4x xmm5 unsigned>>= 24
    4x u4 = xmm3 << 8
    4x u5 = xmm7 << 8
    4x u6 = xmm2 << 8
    4x u7 = xmm5 << 8
    xmm3 |= u4
    xmm7 |= u5
    xmm2 |= u6
    xmm5 |= u7
    4x u4 = xmm3 << 16
    4x u5 = xmm7 << 16
    4x u6 = xmm2 << 16
    4x u7 = xmm5 << 16
    xmm3 |= u4
    xmm7 |= u5
    xmm2 |= u6
    xmm5 |= u7
    #END MACRO expb8
  
  
  xmm8 aligned= mem128[input_0];input_0 += 16
  xmm0 ^= xmm8
  xmm9 aligned= mem128[input_0];input_0 += 16
  xmm1 ^= xmm9
  xmm10 aligned= mem128[input_0];input_0 += 16
  xmm4 ^= xmm10
  xmm11 aligned= mem128[input_0];input_0 += 16
  xmm6 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm4 ^= xmm10
  xmm6 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm4 ^= xmm10
  xmm6 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm12 aligned= mem128[input_0];input_0 += 16
  xmm1 ^= xmm9
  xmm13 aligned= mem128[input_0];input_0 += 16
  xmm4 ^= xmm10
  xmm14 aligned= mem128[input_0];input_0 += 16
  xmm6 ^= xmm11
  xmm15 aligned= mem128[input_0];input_0 += 16
  xmm3 ^= xmm12
  mem128[input_0] aligned= xmm0 ;input_0 += 16
  xmm7 ^= xmm13
  mem128[input_0] aligned= xmm1 ;input_0 += 16
  xmm2 ^= xmm14
  mem128[input_0] aligned= xmm4 ;input_0 += 16
  xmm5 ^= xmm15
  mem128[input_0] aligned= xmm6 ;input_0 += 16
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm3 ^= xmm12
  xmm7 ^= xmm13
  xmm2 ^= xmm14
  xmm5 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm3 ^= xmm12
  xmm7 ^= xmm13
  xmm2 ^= xmm14
  xmm5 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm3 ^= xmm12
  xmm7 ^= xmm13
  xmm2 ^= xmm14
  xmm5 ^= xmm15
  mem128[input_0] aligned= xmm3 ;input_0 += 16
  mem128[input_0] aligned= xmm7 ;input_0 += 16
  mem128[input_0] aligned= xmm2 ;input_0 += 16
  mem128[input_0] aligned= xmm5 ;input_0 += 16
  input_0 -= 128
  #END MACRO keyexpbs1

  #BEGIN MACRO keyexpbs
  xmm0 = ~xmm0
  xmm1 = ~xmm1
  xmm7 = ~xmm7
  xmm2 = ~xmm2
    #BEGIN MACRO rotbyte8
    xmm0 = xmm0[3]xmm0[0,1,2] 
    xmm1 = xmm1[3]xmm1[0,1,2] 
    xmm4 = xmm4[3]xmm4[0,1,2] 
    4x xmm0 <<= 24 
    xmm6 = xmm6[3]xmm6[0,1,2] 
    4x xmm1 <<= 24 
    xmm3 = xmm3[3]xmm3[0,1,2] 
    4x xmm4 <<= 24 
    xmm7 = xmm7[3]xmm7[0,1,2] 
    4x xmm6 <<= 24 
    xmm2 = xmm2[3]xmm2[0,1,2] 
    4x xmm3 <<= 24 
    xmm5 = xmm5[3]xmm5[0,1,2] 
    4x xmm7 <<= 24 
    4x xmm2 <<= 24 
    4x xmm5 <<= 24 
    #END MACRO rotbyte8
  
  
    #BEGIN MACRO sbox
    xmm7 ^= xmm2
    xmm4 ^= xmm1
    xmm7 ^= xmm0
    xmm2 ^= xmm4
    xmm6 ^= xmm0
    xmm2 ^= xmm6
    xmm6 ^= xmm5
    xmm5 ^= xmm7
    xmm6 ^= xmm3
    xmm3 ^= xmm7
    xmm6 ^= xmm1
    xmm4 ^= xmm5
    xmm1 ^= xmm7
      #BEGIN MACRO Inv_GF256
      xmm11 = xmm5 ^ xmm3
      xmm10 = xmm1 ^ xmm4
      xmm9 = xmm7 ^ xmm6
      xmm13 = xmm4 ^ xmm3
      xmm12 = xmm2 ^ xmm0
      xmm8 = xmm10 & xmm9
      xmm14 = xmm11 & xmm12
      xmm15 = xmm11 ^ xmm10
      xmm11 |= xmm12
      xmm12 ^= xmm9
      xmm10 |= xmm9
      xmm15 &= xmm12
      xmm12 = xmm6 ^ xmm0
      xmm11 ^= xmm15
      xmm13 &= xmm12
      xmm10 ^= xmm14
      xmm11 ^= xmm13
      xmm10 ^= xmm13
      xmm13 = xmm5 ^ xmm1
      xmm12 = xmm7 ^ xmm2
      xmm8 ^= xmm14
      xmm9 = xmm13 | xmm12
      xmm13 &= xmm12
      xmm9 ^= xmm15
      xmm8 ^= xmm13
      xmm9 ^= xmm14
      xmm12 = xmm4 & xmm6
      xmm13 = xmm3 & xmm0
      xmm11 ^= xmm12
      xmm10 ^= xmm13
      xmm14 = xmm1 & xmm7
      xmm12 = xmm11 ^ xmm10
      xmm15 = xmm5 | xmm2
      xmm9 ^= xmm14
      xmm8 ^= xmm15
      xmm11 &= xmm9
      xmm13 = xmm9 ^ xmm8
      xmm14 = xmm8 ^ xmm11
      xmm11 ^= xmm10
      xmm15 = xmm12 & xmm14
      xmm13 &= xmm11
      xmm15 ^= xmm10
      xmm13 ^= xmm8
      
      xmm10 = xmm14 ^ xmm13
      xmm9 ^= xmm13
      xmm10 &= xmm8
      xmm8 = xmm7 ^ xmm6
      xmm14 ^= xmm10
      xmm9 ^= xmm10
      xmm14 &= xmm15
      
      xmm14 ^= xmm12
      xmm12 = xmm2 ^ xmm0
      xmm10 = xmm15 ^ xmm14
      
      xmm10 &= xmm2
      xmm2 ^= xmm7
      xmm7 &= xmm15
      xmm2 &= xmm14
      xmm14 ^= xmm9
      xmm15 ^= xmm13
      xmm2 ^= xmm7
      xmm11 = xmm15 ^ xmm14
      xmm7 ^= xmm10
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm0
      xmm0 ^= xmm6
      xmm6 &= xmm13
      xmm0 &= xmm9
      xmm2 ^= xmm12
      xmm0 ^= xmm6
      xmm6 ^= xmm10
      xmm0 ^= xmm12
      xmm7 ^= xmm8
      xmm6 ^= xmm8
      xmm12 = xmm5 ^ xmm3
      xmm11 = xmm15 ^ xmm14
      xmm8 = xmm1 ^ xmm4
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm3
      xmm3 ^= xmm4
      xmm4 &= xmm13
      xmm3 &= xmm9
      xmm15 ^= xmm13
      xmm14 ^= xmm9
      xmm3 ^= xmm4
      xmm11 = xmm15 ^ xmm14
      xmm4 ^= xmm10
      xmm11 &= xmm5
      xmm5 ^= xmm1
      xmm1 &= xmm15
      xmm5 &= xmm14
      xmm3 ^= xmm12
      xmm5 ^= xmm1
      xmm1 ^= xmm11
      xmm5 ^= xmm12
      xmm1 ^= xmm8
      xmm4 ^= xmm8
      #END MACRO Inv_GF256
    
    xmm5 ^= xmm0
    xmm1 ^= xmm2
    xmm3 ^= xmm5
    xmm2 ^= xmm0
    xmm0 ^= xmm1
    xmm1 ^= xmm7
    xmm7 ^= xmm4
    xmm4 ^= xmm6
    xmm6 ^= xmm7
    xmm3 ^= xmm7
    xmm2 ^= xmm6
    #END MACRO sbox
  
  
    #BEGIN MACRO setrcon
    2x u = 0
    u = u[0],0xffffffff00000000
    #END MACRO setrcon
  
  xmm1 ^= u
    #BEGIN MACRO expb8
    4x xmm0 unsigned>>= 24
    4x xmm1 unsigned>>= 24
    4x xmm3 unsigned>>= 24
    4x xmm2 unsigned>>= 24
    4x u0 = xmm0 << 8
    4x u1 = xmm1 << 8
    4x u2 = xmm3 << 8
    4x u3 = xmm2 << 8
    xmm0 |= u0
    xmm1 |= u1
    xmm3 |= u2
    xmm2 |= u3
    4x u0 = xmm0 << 16
    4x u1 = xmm1 << 16
    4x u2 = xmm3 << 16
    4x u3 = xmm2 << 16
    xmm0 |= u0
    xmm1 |= u1
    xmm3 |= u2
    xmm2 |= u3
    4x xmm6 unsigned>>= 24
    4x xmm5 unsigned>>= 24
    4x xmm4 unsigned>>= 24
    4x xmm7 unsigned>>= 24
    4x u4 = xmm6 << 8
    4x u5 = xmm5 << 8
    4x u6 = xmm4 << 8
    4x u7 = xmm7 << 8
    xmm6 |= u4
    xmm5 |= u5
    xmm4 |= u6
    xmm7 |= u7
    4x u4 = xmm6 << 16
    4x u5 = xmm5 << 16
    4x u6 = xmm4 << 16
    4x u7 = xmm7 << 16
    xmm6 |= u4
    xmm5 |= u5
    xmm4 |= u6
    xmm7 |= u7
    #END MACRO expb8
  
  
  xmm8 aligned= mem128[input_0];input_0 += 16
  xmm8 = ~xmm8
  xmm9 aligned= mem128[input_0];input_0 += 16
  xmm9 = ~xmm9
  xmm10 aligned= mem128[input_0];input_0 += 16
  xmm0 ^= xmm8
  xmm11 aligned= mem128[input_0];input_0 += 16
  xmm1 ^= xmm9
  xmm3 ^= xmm10
  xmm2 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm3 ^= xmm10
  xmm2 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm3 ^= xmm10
  xmm2 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm3 ^= xmm10
  xmm12 aligned= mem128[input_0];input_0 += 16
  xmm2 ^= xmm11
  xmm13 aligned= mem128[input_0];input_0 += 16
  xmm13 = ~xmm13
  xmm14 aligned= mem128[input_0];input_0 += 16
  xmm14 = ~xmm14
  xmm15 aligned= mem128[input_0];input_0 += 16
  xmm6 ^= xmm12
  mem128[input_0] aligned= xmm0 ;input_0 += 16
  xmm5 ^= xmm13
  mem128[input_0] aligned= xmm1 ;input_0 += 16
  xmm4 ^= xmm14
  mem128[input_0] aligned= xmm3 ;input_0 += 16
  xmm7 ^= xmm15
  mem128[input_0] aligned= xmm2 ;input_0 += 16
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm6 ^= xmm12
  xmm5 ^= xmm13
  xmm4 ^= xmm14
  xmm7 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm6 ^= xmm12
  xmm5 ^= xmm13
  xmm4 ^= xmm14
  xmm7 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm6 ^= xmm12
  xmm5 ^= xmm13
  xmm4 ^= xmm14
  xmm7 ^= xmm15
  mem128[input_0] aligned= xmm6 ;input_0 += 16
  mem128[input_0] aligned= xmm5 ;input_0 += 16
  mem128[input_0] aligned= xmm4 ;input_0 += 16
  mem128[input_0] aligned= xmm7 ;input_0 += 16
  input_0 -= 128
  #END MACRO keyexpbs

  #BEGIN MACRO keyexpbs
  xmm0 = ~xmm0
  xmm1 = ~xmm1
  xmm5 = ~xmm5
  xmm4 = ~xmm4
    #BEGIN MACRO rotbyte8
    xmm0 = xmm0[3]xmm0[0,1,2] 
    xmm1 = xmm1[3]xmm1[0,1,2] 
    xmm3 = xmm3[3]xmm3[0,1,2] 
    4x xmm0 <<= 24 
    xmm2 = xmm2[3]xmm2[0,1,2] 
    4x xmm1 <<= 24 
    xmm6 = xmm6[3]xmm6[0,1,2] 
    4x xmm3 <<= 24 
    xmm5 = xmm5[3]xmm5[0,1,2] 
    4x xmm2 <<= 24 
    xmm4 = xmm4[3]xmm4[0,1,2] 
    4x xmm6 <<= 24 
    xmm7 = xmm7[3]xmm7[0,1,2] 
    4x xmm5 <<= 24 
    4x xmm4 <<= 24 
    4x xmm7 <<= 24 
    #END MACRO rotbyte8
  
  
    #BEGIN MACRO sbox
    xmm5 ^= xmm4
    xmm3 ^= xmm1
    xmm5 ^= xmm0
    xmm4 ^= xmm3
    xmm2 ^= xmm0
    xmm4 ^= xmm2
    xmm2 ^= xmm7
    xmm7 ^= xmm5
    xmm2 ^= xmm6
    xmm6 ^= xmm5
    xmm2 ^= xmm1
    xmm3 ^= xmm7
    xmm1 ^= xmm5
      #BEGIN MACRO Inv_GF256
      xmm11 = xmm7 ^ xmm6
      xmm10 = xmm1 ^ xmm3
      xmm9 = xmm5 ^ xmm2
      xmm13 = xmm3 ^ xmm6
      xmm12 = xmm4 ^ xmm0
      xmm8 = xmm10 & xmm9
      xmm14 = xmm11 & xmm12
      xmm15 = xmm11 ^ xmm10
      xmm11 |= xmm12
      xmm12 ^= xmm9
      xmm10 |= xmm9
      xmm15 &= xmm12
      xmm12 = xmm2 ^ xmm0
      xmm11 ^= xmm15
      xmm13 &= xmm12
      xmm10 ^= xmm14
      xmm11 ^= xmm13
      xmm10 ^= xmm13
      xmm13 = xmm7 ^ xmm1
      xmm12 = xmm5 ^ xmm4
      xmm8 ^= xmm14
      xmm9 = xmm13 | xmm12
      xmm13 &= xmm12
      xmm9 ^= xmm15
      xmm8 ^= xmm13
      xmm9 ^= xmm14
      xmm12 = xmm3 & xmm2
      xmm13 = xmm6 & xmm0
      xmm11 ^= xmm12
      xmm10 ^= xmm13
      xmm14 = xmm1 & xmm5
      xmm12 = xmm11 ^ xmm10
      xmm15 = xmm7 | xmm4
      xmm9 ^= xmm14
      xmm8 ^= xmm15
      xmm11 &= xmm9
      xmm13 = xmm9 ^ xmm8
      xmm14 = xmm8 ^ xmm11
      xmm11 ^= xmm10
      xmm15 = xmm12 & xmm14
      xmm13 &= xmm11
      xmm15 ^= xmm10
      xmm13 ^= xmm8
      
      xmm10 = xmm14 ^ xmm13
      xmm9 ^= xmm13
      xmm10 &= xmm8
      xmm8 = xmm5 ^ xmm2
      xmm14 ^= xmm10
      xmm9 ^= xmm10
      xmm14 &= xmm15
      
      xmm14 ^= xmm12
      xmm12 = xmm4 ^ xmm0
      xmm10 = xmm15 ^ xmm14
      
      xmm10 &= xmm4
      xmm4 ^= xmm5
      xmm5 &= xmm15
      xmm4 &= xmm14
      xmm14 ^= xmm9
      xmm15 ^= xmm13
      xmm4 ^= xmm5
      xmm11 = xmm15 ^ xmm14
      xmm5 ^= xmm10
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm0
      xmm0 ^= xmm2
      xmm2 &= xmm13
      xmm0 &= xmm9
      xmm4 ^= xmm12
      xmm0 ^= xmm2
      xmm2 ^= xmm10
      xmm0 ^= xmm12
      xmm5 ^= xmm8
      xmm2 ^= xmm8
      xmm12 = xmm7 ^ xmm6
      xmm11 = xmm15 ^ xmm14
      xmm8 = xmm1 ^ xmm3
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm6
      xmm6 ^= xmm3
      xmm3 &= xmm13
      xmm6 &= xmm9
      xmm15 ^= xmm13
      xmm14 ^= xmm9
      xmm6 ^= xmm3
      xmm11 = xmm15 ^ xmm14
      xmm3 ^= xmm10
      xmm11 &= xmm7
      xmm7 ^= xmm1
      xmm1 &= xmm15
      xmm7 &= xmm14
      xmm6 ^= xmm12
      xmm7 ^= xmm1
      xmm1 ^= xmm11
      xmm7 ^= xmm12
      xmm1 ^= xmm8
      xmm3 ^= xmm8
      #END MACRO Inv_GF256
    
    xmm7 ^= xmm0
    xmm1 ^= xmm4
    xmm6 ^= xmm7
    xmm4 ^= xmm0
    xmm0 ^= xmm1
    xmm1 ^= xmm5
    xmm5 ^= xmm3
    xmm3 ^= xmm2
    xmm2 ^= xmm5
    xmm6 ^= xmm5
    xmm4 ^= xmm2
    #END MACRO sbox
  
  
    #BEGIN MACRO setrcon
    2x u = 0
    u = u[0],0xffffffff00000000
    #END MACRO setrcon
  
  xmm6 ^= u
    #BEGIN MACRO expb8
    4x xmm0 unsigned>>= 24
    4x xmm1 unsigned>>= 24
    4x xmm6 unsigned>>= 24
    4x xmm4 unsigned>>= 24
    4x u0 = xmm0 << 8
    4x u1 = xmm1 << 8
    4x u2 = xmm6 << 8
    4x u3 = xmm4 << 8
    xmm0 |= u0
    xmm1 |= u1
    xmm6 |= u2
    xmm4 |= u3
    4x u0 = xmm0 << 16
    4x u1 = xmm1 << 16
    4x u2 = xmm6 << 16
    4x u3 = xmm4 << 16
    xmm0 |= u0
    xmm1 |= u1
    xmm6 |= u2
    xmm4 |= u3
    4x xmm2 unsigned>>= 24
    4x xmm7 unsigned>>= 24
    4x xmm3 unsigned>>= 24
    4x xmm5 unsigned>>= 24
    4x u4 = xmm2 << 8
    4x u5 = xmm7 << 8
    4x u6 = xmm3 << 8
    4x u7 = xmm5 << 8
    xmm2 |= u4
    xmm7 |= u5
    xmm3 |= u6
    xmm5 |= u7
    4x u4 = xmm2 << 16
    4x u5 = xmm7 << 16
    4x u6 = xmm3 << 16
    4x u7 = xmm5 << 16
    xmm2 |= u4
    xmm7 |= u5
    xmm3 |= u6
    xmm5 |= u7
    #END MACRO expb8
  
  
  xmm8 aligned= mem128[input_0];input_0 += 16
  xmm8 = ~xmm8
  xmm9 aligned= mem128[input_0];input_0 += 16
  xmm9 = ~xmm9
  xmm10 aligned= mem128[input_0];input_0 += 16
  xmm0 ^= xmm8
  xmm11 aligned= mem128[input_0];input_0 += 16
  xmm1 ^= xmm9
  xmm6 ^= xmm10
  xmm4 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm6 ^= xmm10
  xmm4 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm6 ^= xmm10
  xmm4 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm6 ^= xmm10
  xmm12 aligned= mem128[input_0];input_0 += 16
  xmm4 ^= xmm11
  xmm13 aligned= mem128[input_0];input_0 += 16
  xmm13 = ~xmm13
  xmm14 aligned= mem128[input_0];input_0 += 16
  xmm14 = ~xmm14
  xmm15 aligned= mem128[input_0];input_0 += 16
  xmm2 ^= xmm12
  mem128[input_0] aligned= xmm0 ;input_0 += 16
  xmm7 ^= xmm13
  mem128[input_0] aligned= xmm1 ;input_0 += 16
  xmm3 ^= xmm14
  mem128[input_0] aligned= xmm6 ;input_0 += 16
  xmm5 ^= xmm15
  mem128[input_0] aligned= xmm4 ;input_0 += 16
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm2 ^= xmm12
  xmm7 ^= xmm13
  xmm3 ^= xmm14
  xmm5 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm2 ^= xmm12
  xmm7 ^= xmm13
  xmm3 ^= xmm14
  xmm5 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm2 ^= xmm12
  xmm7 ^= xmm13
  xmm3 ^= xmm14
  xmm5 ^= xmm15
  mem128[input_0] aligned= xmm2 ;input_0 += 16
  mem128[input_0] aligned= xmm7 ;input_0 += 16
  mem128[input_0] aligned= xmm3 ;input_0 += 16
  mem128[input_0] aligned= xmm5 ;input_0 += 16
  input_0 -= 128
  #END MACRO keyexpbs

  #BEGIN MACRO keyexpbs
  xmm0 = ~xmm0
  xmm1 = ~xmm1
  xmm7 = ~xmm7
  xmm3 = ~xmm3
    #BEGIN MACRO rotbyte8
    xmm0 = xmm0[3]xmm0[0,1,2] 
    xmm1 = xmm1[3]xmm1[0,1,2] 
    xmm6 = xmm6[3]xmm6[0,1,2] 
    4x xmm0 <<= 24 
    xmm4 = xmm4[3]xmm4[0,1,2] 
    4x xmm1 <<= 24 
    xmm2 = xmm2[3]xmm2[0,1,2] 
    4x xmm6 <<= 24 
    xmm7 = xmm7[3]xmm7[0,1,2] 
    4x xmm4 <<= 24 
    xmm3 = xmm3[3]xmm3[0,1,2] 
    4x xmm2 <<= 24 
    xmm5 = xmm5[3]xmm5[0,1,2] 
    4x xmm7 <<= 24 
    4x xmm3 <<= 24 
    4x xmm5 <<= 24 
    #END MACRO rotbyte8
  
  
    #BEGIN MACRO sbox
    xmm7 ^= xmm3
    xmm6 ^= xmm1
    xmm7 ^= xmm0
    xmm3 ^= xmm6
    xmm4 ^= xmm0
    xmm3 ^= xmm4
    xmm4 ^= xmm5
    xmm5 ^= xmm7
    xmm4 ^= xmm2
    xmm2 ^= xmm7
    xmm4 ^= xmm1
    xmm6 ^= xmm5
    xmm1 ^= xmm7
      #BEGIN MACRO Inv_GF256
      xmm11 = xmm5 ^ xmm2
      xmm10 = xmm1 ^ xmm6
      xmm9 = xmm7 ^ xmm4
      xmm13 = xmm6 ^ xmm2
      xmm12 = xmm3 ^ xmm0
      xmm8 = xmm10 & xmm9
      xmm14 = xmm11 & xmm12
      xmm15 = xmm11 ^ xmm10
      xmm11 |= xmm12
      xmm12 ^= xmm9
      xmm10 |= xmm9
      xmm15 &= xmm12
      xmm12 = xmm4 ^ xmm0
      xmm11 ^= xmm15
      xmm13 &= xmm12
      xmm10 ^= xmm14
      xmm11 ^= xmm13
      xmm10 ^= xmm13
      xmm13 = xmm5 ^ xmm1
      xmm12 = xmm7 ^ xmm3
      xmm8 ^= xmm14
      xmm9 = xmm13 | xmm12
      xmm13 &= xmm12
      xmm9 ^= xmm15
      xmm8 ^= xmm13
      xmm9 ^= xmm14
      xmm12 = xmm6 & xmm4
      xmm13 = xmm2 & xmm0
      xmm11 ^= xmm12
      xmm10 ^= xmm13
      xmm14 = xmm1 & xmm7
      xmm12 = xmm11 ^ xmm10
      xmm15 = xmm5 | xmm3
      xmm9 ^= xmm14
      xmm8 ^= xmm15
      xmm11 &= xmm9
      xmm13 = xmm9 ^ xmm8
      xmm14 = xmm8 ^ xmm11
      xmm11 ^= xmm10
      xmm15 = xmm12 & xmm14
      xmm13 &= xmm11
      xmm15 ^= xmm10
      xmm13 ^= xmm8
      
      xmm10 = xmm14 ^ xmm13
      xmm9 ^= xmm13
      xmm10 &= xmm8
      xmm8 = xmm7 ^ xmm4
      xmm14 ^= xmm10
      xmm9 ^= xmm10
      xmm14 &= xmm15
      
      xmm14 ^= xmm12
      xmm12 = xmm3 ^ xmm0
      xmm10 = xmm15 ^ xmm14
      
      xmm10 &= xmm3
      xmm3 ^= xmm7
      xmm7 &= xmm15
      xmm3 &= xmm14
      xmm14 ^= xmm9
      xmm15 ^= xmm13
      xmm3 ^= xmm7
      xmm11 = xmm15 ^ xmm14
      xmm7 ^= xmm10
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm0
      xmm0 ^= xmm4
      xmm4 &= xmm13
      xmm0 &= xmm9
      xmm3 ^= xmm12
      xmm0 ^= xmm4
      xmm4 ^= xmm10
      xmm0 ^= xmm12
      xmm7 ^= xmm8
      xmm4 ^= xmm8
      xmm12 = xmm5 ^ xmm2
      xmm11 = xmm15 ^ xmm14
      xmm8 = xmm1 ^ xmm6
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm2
      xmm2 ^= xmm6
      xmm6 &= xmm13
      xmm2 &= xmm9
      xmm15 ^= xmm13
      xmm14 ^= xmm9
      xmm2 ^= xmm6
      xmm11 = xmm15 ^ xmm14
      xmm6 ^= xmm10
      xmm11 &= xmm5
      xmm5 ^= xmm1
      xmm1 &= xmm15
      xmm5 &= xmm14
      xmm2 ^= xmm12
      xmm5 ^= xmm1
      xmm1 ^= xmm11
      xmm5 ^= xmm12
      xmm1 ^= xmm8
      xmm6 ^= xmm8
      #END MACRO Inv_GF256
    
    xmm5 ^= xmm0
    xmm1 ^= xmm3
    xmm2 ^= xmm5
    xmm3 ^= xmm0
    xmm0 ^= xmm1
    xmm1 ^= xmm7
    xmm7 ^= xmm6
    xmm6 ^= xmm4
    xmm4 ^= xmm7
    xmm2 ^= xmm7
    xmm3 ^= xmm4
    #END MACRO sbox
  
  
    #BEGIN MACRO setrcon
    2x u = 0
    u = u[0],0xffffffff00000000
    #END MACRO setrcon
  
  xmm3 ^= u
    #BEGIN MACRO expb8
    4x xmm0 unsigned>>= 24
    4x xmm1 unsigned>>= 24
    4x xmm2 unsigned>>= 24
    4x xmm3 unsigned>>= 24
    4x u0 = xmm0 << 8
    4x u1 = xmm1 << 8
    4x u2 = xmm2 << 8
    4x u3 = xmm3 << 8
    xmm0 |= u0
    xmm1 |= u1
    xmm2 |= u2
    xmm3 |= u3
    4x u0 = xmm0 << 16
    4x u1 = xmm1 << 16
    4x u2 = xmm2 << 16
    4x u3 = xmm3 << 16
    xmm0 |= u0
    xmm1 |= u1
    xmm2 |= u2
    xmm3 |= u3
    4x xmm4 unsigned>>= 24
    4x xmm5 unsigned>>= 24
    4x xmm6 unsigned>>= 24
    4x xmm7 unsigned>>= 24
    4x u4 = xmm4 << 8
    4x u5 = xmm5 << 8
    4x u6 = xmm6 << 8
    4x u7 = xmm7 << 8
    xmm4 |= u4
    xmm5 |= u5
    xmm6 |= u6
    xmm7 |= u7
    4x u4 = xmm4 << 16
    4x u5 = xmm5 << 16
    4x u6 = xmm6 << 16
    4x u7 = xmm7 << 16
    xmm4 |= u4
    xmm5 |= u5
    xmm6 |= u6
    xmm7 |= u7
    #END MACRO expb8
  
  
  xmm8 aligned= mem128[input_0];input_0 += 16
  xmm8 = ~xmm8
  xmm9 aligned= mem128[input_0];input_0 += 16
  xmm9 = ~xmm9
  xmm10 aligned= mem128[input_0];input_0 += 16
  xmm0 ^= xmm8
  xmm11 aligned= mem128[input_0];input_0 += 16
  xmm1 ^= xmm9
  xmm2 ^= xmm10
  xmm3 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm2 ^= xmm10
  xmm3 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm2 ^= xmm10
  xmm3 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm2 ^= xmm10
  xmm12 aligned= mem128[input_0];input_0 += 16
  xmm3 ^= xmm11
  xmm13 aligned= mem128[input_0];input_0 += 16
  xmm13 = ~xmm13
  xmm14 aligned= mem128[input_0];input_0 += 16
  xmm14 = ~xmm14
  xmm15 aligned= mem128[input_0];input_0 += 16
  xmm4 ^= xmm12
  mem128[input_0] aligned= xmm0 ;input_0 += 16
  xmm5 ^= xmm13
  mem128[input_0] aligned= xmm1 ;input_0 += 16
  xmm6 ^= xmm14
  mem128[input_0] aligned= xmm2 ;input_0 += 16
  xmm7 ^= xmm15
  mem128[input_0] aligned= xmm3 ;input_0 += 16
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm4 ^= xmm12
  xmm5 ^= xmm13
  xmm6 ^= xmm14
  xmm7 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm4 ^= xmm12
  xmm5 ^= xmm13
  xmm6 ^= xmm14
  xmm7 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm4 ^= xmm12
  xmm5 ^= xmm13
  xmm6 ^= xmm14
  xmm7 ^= xmm15
  mem128[input_0] aligned= xmm4 ;input_0 += 16
  mem128[input_0] aligned= xmm5 ;input_0 += 16
  mem128[input_0] aligned= xmm6 ;input_0 += 16
  mem128[input_0] aligned= xmm7 ;input_0 += 16
  input_0 -= 128
  #END MACRO keyexpbs


  #BEGIN MACRO keyexpbs
  xmm0 = ~xmm0
  xmm1 = ~xmm1
  xmm5 = ~xmm5
  xmm6 = ~xmm6
    #BEGIN MACRO rotbyte8
    xmm0 = xmm0[3]xmm0[0,1,2] 
    xmm1 = xmm1[3]xmm1[0,1,2] 
    xmm2 = xmm2[3]xmm2[0,1,2] 
    4x xmm0 <<= 24 
    xmm3 = xmm3[3]xmm3[0,1,2] 
    4x xmm1 <<= 24 
    xmm4 = xmm4[3]xmm4[0,1,2] 
    4x xmm2 <<= 24 
    xmm5 = xmm5[3]xmm5[0,1,2] 
    4x xmm3 <<= 24 
    xmm6 = xmm6[3]xmm6[0,1,2] 
    4x xmm4 <<= 24 
    xmm7 = xmm7[3]xmm7[0,1,2] 
    4x xmm5 <<= 24 
    4x xmm6 <<= 24 
    4x xmm7 <<= 24 
    #END MACRO rotbyte8
  
  
    #BEGIN MACRO sbox
    xmm5 ^= xmm6
    xmm2 ^= xmm1
    xmm5 ^= xmm0
    xmm6 ^= xmm2
    xmm3 ^= xmm0
    xmm6 ^= xmm3
    xmm3 ^= xmm7
    xmm7 ^= xmm5
    xmm3 ^= xmm4
    xmm4 ^= xmm5
    xmm3 ^= xmm1
    xmm2 ^= xmm7
    xmm1 ^= xmm5
      #BEGIN MACRO Inv_GF256
      xmm11 = xmm7 ^ xmm4
      xmm10 = xmm1 ^ xmm2
      xmm9 = xmm5 ^ xmm3
      xmm13 = xmm2 ^ xmm4
      xmm12 = xmm6 ^ xmm0
      xmm8 = xmm10 & xmm9
      xmm14 = xmm11 & xmm12
      xmm15 = xmm11 ^ xmm10
      xmm11 |= xmm12
      xmm12 ^= xmm9
      xmm10 |= xmm9
      xmm15 &= xmm12
      xmm12 = xmm3 ^ xmm0
      xmm11 ^= xmm15
      xmm13 &= xmm12
      xmm10 ^= xmm14
      xmm11 ^= xmm13
      xmm10 ^= xmm13
      xmm13 = xmm7 ^ xmm1
      xmm12 = xmm5 ^ xmm6
      xmm8 ^= xmm14
      xmm9 = xmm13 | xmm12
      xmm13 &= xmm12
      xmm9 ^= xmm15
      xmm8 ^= xmm13
      xmm9 ^= xmm14
      xmm12 = xmm2 & xmm3
      xmm13 = xmm4 & xmm0
      xmm11 ^= xmm12
      xmm10 ^= xmm13
      xmm14 = xmm1 & xmm5
      xmm12 = xmm11 ^ xmm10
      xmm15 = xmm7 | xmm6
      xmm9 ^= xmm14
      xmm8 ^= xmm15
      xmm11 &= xmm9
      xmm13 = xmm9 ^ xmm8
      xmm14 = xmm8 ^ xmm11
      xmm11 ^= xmm10
      xmm15 = xmm12 & xmm14
      xmm13 &= xmm11
      xmm15 ^= xmm10
      xmm13 ^= xmm8
      
      xmm10 = xmm14 ^ xmm13
      xmm9 ^= xmm13
      xmm10 &= xmm8
      xmm8 = xmm5 ^ xmm3
      xmm14 ^= xmm10
      xmm9 ^= xmm10
      xmm14 &= xmm15
      
      xmm14 ^= xmm12
      xmm12 = xmm6 ^ xmm0
      xmm10 = xmm15 ^ xmm14
      
      xmm10 &= xmm6
      xmm6 ^= xmm5
      xmm5 &= xmm15
      xmm6 &= xmm14
      xmm14 ^= xmm9
      xmm15 ^= xmm13
      xmm6 ^= xmm5
      xmm11 = xmm15 ^ xmm14
      xmm5 ^= xmm10
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm0
      xmm0 ^= xmm3
      xmm3 &= xmm13
      xmm0 &= xmm9
      xmm6 ^= xmm12
      xmm0 ^= xmm3
      xmm3 ^= xmm10
      xmm0 ^= xmm12
      xmm5 ^= xmm8
      xmm3 ^= xmm8
      xmm12 = xmm7 ^ xmm4
      xmm11 = xmm15 ^ xmm14
      xmm8 = xmm1 ^ xmm2
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm4
      xmm4 ^= xmm2
      xmm2 &= xmm13
      xmm4 &= xmm9
      xmm15 ^= xmm13
      xmm14 ^= xmm9
      xmm4 ^= xmm2
      xmm11 = xmm15 ^ xmm14
      xmm2 ^= xmm10
      xmm11 &= xmm7
      xmm7 ^= xmm1
      xmm1 &= xmm15
      xmm7 &= xmm14
      xmm4 ^= xmm12
      xmm7 ^= xmm1
      xmm1 ^= xmm11
      xmm7 ^= xmm12
      xmm1 ^= xmm8
      xmm2 ^= xmm8
      #END MACRO Inv_GF256
    
    xmm7 ^= xmm0
    xmm1 ^= xmm6
    xmm4 ^= xmm7
    xmm6 ^= xmm0
    xmm0 ^= xmm1
    xmm1 ^= xmm5
    xmm5 ^= xmm2
    xmm2 ^= xmm3
    xmm3 ^= xmm5
    xmm4 ^= xmm5
    xmm6 ^= xmm3
    #END MACRO sbox
  
  
    #BEGIN MACRO setrcon
    2x u = 0
    u = u[0],0xffffffff00000000
    #END MACRO setrcon
  
  xmm3 ^= u
    #BEGIN MACRO expb8
    4x xmm0 unsigned>>= 24
    4x xmm1 unsigned>>= 24
    4x xmm4 unsigned>>= 24
    4x xmm6 unsigned>>= 24
    4x u0 = xmm0 << 8
    4x u1 = xmm1 << 8
    4x u2 = xmm4 << 8
    4x u3 = xmm6 << 8
    xmm0 |= u0
    xmm1 |= u1
    xmm4 |= u2
    xmm6 |= u3
    4x u0 = xmm0 << 16
    4x u1 = xmm1 << 16
    4x u2 = xmm4 << 16
    4x u3 = xmm6 << 16
    xmm0 |= u0
    xmm1 |= u1
    xmm4 |= u2
    xmm6 |= u3
    4x xmm3 unsigned>>= 24
    4x xmm7 unsigned>>= 24
    4x xmm2 unsigned>>= 24
    4x xmm5 unsigned>>= 24
    4x u4 = xmm3 << 8
    4x u5 = xmm7 << 8
    4x u6 = xmm2 << 8
    4x u7 = xmm5 << 8
    xmm3 |= u4
    xmm7 |= u5
    xmm2 |= u6
    xmm5 |= u7
    4x u4 = xmm3 << 16
    4x u5 = xmm7 << 16
    4x u6 = xmm2 << 16
    4x u7 = xmm5 << 16
    xmm3 |= u4
    xmm7 |= u5
    xmm2 |= u6
    xmm5 |= u7
    #END MACRO expb8
  
  
  xmm8 aligned= mem128[input_0];input_0 += 16
  xmm8 = ~xmm8
  xmm9 aligned= mem128[input_0];input_0 += 16
  xmm9 = ~xmm9
  xmm10 aligned= mem128[input_0];input_0 += 16
  xmm0 ^= xmm8
  xmm11 aligned= mem128[input_0];input_0 += 16
  xmm1 ^= xmm9
  xmm4 ^= xmm10
  xmm6 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm4 ^= xmm10
  xmm6 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm4 ^= xmm10
  xmm6 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm4 ^= xmm10
  xmm12 aligned= mem128[input_0];input_0 += 16
  xmm6 ^= xmm11
  xmm13 aligned= mem128[input_0];input_0 += 16
  xmm13 = ~xmm13
  xmm14 aligned= mem128[input_0];input_0 += 16
  xmm14 = ~xmm14
  xmm15 aligned= mem128[input_0];input_0 += 16
  xmm3 ^= xmm12
  mem128[input_0] aligned= xmm0 ;input_0 += 16
  xmm7 ^= xmm13
  mem128[input_0] aligned= xmm1 ;input_0 += 16
  xmm2 ^= xmm14
  mem128[input_0] aligned= xmm4 ;input_0 += 16
  xmm5 ^= xmm15
  mem128[input_0] aligned= xmm6 ;input_0 += 16
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm3 ^= xmm12
  xmm7 ^= xmm13
  xmm2 ^= xmm14
  xmm5 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm3 ^= xmm12
  xmm7 ^= xmm13
  xmm2 ^= xmm14
  xmm5 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm3 ^= xmm12
  xmm7 ^= xmm13
  xmm2 ^= xmm14
  xmm5 ^= xmm15
  mem128[input_0] aligned= xmm3 ;input_0 += 16
  mem128[input_0] aligned= xmm7 ;input_0 += 16
  mem128[input_0] aligned= xmm2 ;input_0 += 16
  mem128[input_0] aligned= xmm5 ;input_0 += 16
  input_0 -= 128
  #END MACRO keyexpbs

  #BEGIN MACRO keyexpbs
  xmm0 = ~xmm0
  xmm1 = ~xmm1
  xmm7 = ~xmm7
  xmm2 = ~xmm2
    #BEGIN MACRO rotbyte8
    xmm0 = xmm0[3]xmm0[0,1,2] 
    xmm1 = xmm1[3]xmm1[0,1,2] 
    xmm4 = xmm4[3]xmm4[0,1,2] 
    4x xmm0 <<= 24 
    xmm6 = xmm6[3]xmm6[0,1,2] 
    4x xmm1 <<= 24 
    xmm3 = xmm3[3]xmm3[0,1,2] 
    4x xmm4 <<= 24 
    xmm7 = xmm7[3]xmm7[0,1,2] 
    4x xmm6 <<= 24 
    xmm2 = xmm2[3]xmm2[0,1,2] 
    4x xmm3 <<= 24 
    xmm5 = xmm5[3]xmm5[0,1,2] 
    4x xmm7 <<= 24 
    4x xmm2 <<= 24 
    4x xmm5 <<= 24 
    #END MACRO rotbyte8
  
  
    #BEGIN MACRO sbox
    xmm7 ^= xmm2
    xmm4 ^= xmm1
    xmm7 ^= xmm0
    xmm2 ^= xmm4
    xmm6 ^= xmm0
    xmm2 ^= xmm6
    xmm6 ^= xmm5
    xmm5 ^= xmm7
    xmm6 ^= xmm3
    xmm3 ^= xmm7
    xmm6 ^= xmm1
    xmm4 ^= xmm5
    xmm1 ^= xmm7
      #BEGIN MACRO Inv_GF256
      xmm11 = xmm5 ^ xmm3
      xmm10 = xmm1 ^ xmm4
      xmm9 = xmm7 ^ xmm6
      xmm13 = xmm4 ^ xmm3
      xmm12 = xmm2 ^ xmm0
      xmm8 = xmm10 & xmm9
      xmm14 = xmm11 & xmm12
      xmm15 = xmm11 ^ xmm10
      xmm11 |= xmm12
      xmm12 ^= xmm9
      xmm10 |= xmm9
      xmm15 &= xmm12
      xmm12 = xmm6 ^ xmm0
      xmm11 ^= xmm15
      xmm13 &= xmm12
      xmm10 ^= xmm14
      xmm11 ^= xmm13
      xmm10 ^= xmm13
      xmm13 = xmm5 ^ xmm1
      xmm12 = xmm7 ^ xmm2
      xmm8 ^= xmm14
      xmm9 = xmm13 | xmm12
      xmm13 &= xmm12
      xmm9 ^= xmm15
      xmm8 ^= xmm13
      xmm9 ^= xmm14
      xmm12 = xmm4 & xmm6
      xmm13 = xmm3 & xmm0
      xmm11 ^= xmm12
      xmm10 ^= xmm13
      xmm14 = xmm1 & xmm7
      xmm12 = xmm11 ^ xmm10
      xmm15 = xmm5 | xmm2
      xmm9 ^= xmm14
      xmm8 ^= xmm15
      xmm11 &= xmm9
      xmm13 = xmm9 ^ xmm8
      xmm14 = xmm8 ^ xmm11
      xmm11 ^= xmm10
      xmm15 = xmm12 & xmm14
      xmm13 &= xmm11
      xmm15 ^= xmm10
      xmm13 ^= xmm8
      
      xmm10 = xmm14 ^ xmm13
      xmm9 ^= xmm13
      xmm10 &= xmm8
      xmm8 = xmm7 ^ xmm6
      xmm14 ^= xmm10
      xmm9 ^= xmm10
      xmm14 &= xmm15
      
      xmm14 ^= xmm12
      xmm12 = xmm2 ^ xmm0
      xmm10 = xmm15 ^ xmm14
      
      xmm10 &= xmm2
      xmm2 ^= xmm7
      xmm7 &= xmm15
      xmm2 &= xmm14
      xmm14 ^= xmm9
      xmm15 ^= xmm13
      xmm2 ^= xmm7
      xmm11 = xmm15 ^ xmm14
      xmm7 ^= xmm10
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm0
      xmm0 ^= xmm6
      xmm6 &= xmm13
      xmm0 &= xmm9
      xmm2 ^= xmm12
      xmm0 ^= xmm6
      xmm6 ^= xmm10
      xmm0 ^= xmm12
      xmm7 ^= xmm8
      xmm6 ^= xmm8
      xmm12 = xmm5 ^ xmm3
      xmm11 = xmm15 ^ xmm14
      xmm8 = xmm1 ^ xmm4
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm3
      xmm3 ^= xmm4
      xmm4 &= xmm13
      xmm3 &= xmm9
      xmm15 ^= xmm13
      xmm14 ^= xmm9
      xmm3 ^= xmm4
      xmm11 = xmm15 ^ xmm14
      xmm4 ^= xmm10
      xmm11 &= xmm5
      xmm5 ^= xmm1
      xmm1 &= xmm15
      xmm5 &= xmm14
      xmm3 ^= xmm12
      xmm5 ^= xmm1
      xmm1 ^= xmm11
      xmm5 ^= xmm12
      xmm1 ^= xmm8
      xmm4 ^= xmm8
      #END MACRO Inv_GF256
    
    xmm5 ^= xmm0
    xmm1 ^= xmm2
    xmm3 ^= xmm5
    xmm2 ^= xmm0
    xmm0 ^= xmm1
    xmm1 ^= xmm7
    xmm7 ^= xmm4
    xmm4 ^= xmm6
    xmm6 ^= xmm7
    xmm3 ^= xmm7
    xmm2 ^= xmm6
    #END MACRO sbox
  
  
    #BEGIN MACRO setrcon
    2x u = 0
    u = u[0],0xffffffff00000000
    #END MACRO setrcon
  
  xmm5 ^= u
    #BEGIN MACRO expb8
    4x xmm0 unsigned>>= 24
    4x xmm1 unsigned>>= 24
    4x xmm3 unsigned>>= 24
    4x xmm2 unsigned>>= 24
    4x u0 = xmm0 << 8
    4x u1 = xmm1 << 8
    4x u2 = xmm3 << 8
    4x u3 = xmm2 << 8
    xmm0 |= u0
    xmm1 |= u1
    xmm3 |= u2
    xmm2 |= u3
    4x u0 = xmm0 << 16
    4x u1 = xmm1 << 16
    4x u2 = xmm3 << 16
    4x u3 = xmm2 << 16
    xmm0 |= u0
    xmm1 |= u1
    xmm3 |= u2
    xmm2 |= u3
    4x xmm6 unsigned>>= 24
    4x xmm5 unsigned>>= 24
    4x xmm4 unsigned>>= 24
    4x xmm7 unsigned>>= 24
    4x u4 = xmm6 << 8
    4x u5 = xmm5 << 8
    4x u6 = xmm4 << 8
    4x u7 = xmm7 << 8
    xmm6 |= u4
    xmm5 |= u5
    xmm4 |= u6
    xmm7 |= u7
    4x u4 = xmm6 << 16
    4x u5 = xmm5 << 16
    4x u6 = xmm4 << 16
    4x u7 = xmm7 << 16
    xmm6 |= u4
    xmm5 |= u5
    xmm4 |= u6
    xmm7 |= u7
    #END MACRO expb8
  
  
  xmm8 aligned= mem128[input_0];input_0 += 16
  xmm8 = ~xmm8
  xmm9 aligned= mem128[input_0];input_0 += 16
  xmm9 = ~xmm9
  xmm10 aligned= mem128[input_0];input_0 += 16
  xmm0 ^= xmm8
  xmm11 aligned= mem128[input_0];input_0 += 16
  xmm1 ^= xmm9
  xmm3 ^= xmm10
  xmm2 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm3 ^= xmm10
  xmm2 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm3 ^= xmm10
  xmm2 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm3 ^= xmm10
  xmm12 aligned= mem128[input_0];input_0 += 16
  xmm2 ^= xmm11
  xmm13 aligned= mem128[input_0];input_0 += 16
  xmm13 = ~xmm13
  xmm14 aligned= mem128[input_0];input_0 += 16
  xmm14 = ~xmm14
  xmm15 aligned= mem128[input_0];input_0 += 16
  xmm6 ^= xmm12
  mem128[input_0] aligned= xmm0 ;input_0 += 16
  xmm5 ^= xmm13
  mem128[input_0] aligned= xmm1 ;input_0 += 16
  xmm4 ^= xmm14
  mem128[input_0] aligned= xmm3 ;input_0 += 16
  xmm7 ^= xmm15
  mem128[input_0] aligned= xmm2 ;input_0 += 16
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm6 ^= xmm12
  xmm5 ^= xmm13
  xmm4 ^= xmm14
  xmm7 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm6 ^= xmm12
  xmm5 ^= xmm13
  xmm4 ^= xmm14
  xmm7 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm6 ^= xmm12
  xmm5 ^= xmm13
  xmm4 ^= xmm14
  xmm7 ^= xmm15
  mem128[input_0] aligned= xmm6 ;input_0 += 16
  mem128[input_0] aligned= xmm5 ;input_0 += 16
  mem128[input_0] aligned= xmm4 ;input_0 += 16
  mem128[input_0] aligned= xmm7 ;input_0 += 16
  input_0 -= 128
  #END MACRO keyexpbs

  #BEGIN MACRO keyexpbs
  xmm0 = ~xmm0
  xmm1 = ~xmm1
  xmm5 = ~xmm5
  xmm4 = ~xmm4
    #BEGIN MACRO rotbyte8
    xmm0 = xmm0[3]xmm0[0,1,2] 
    xmm1 = xmm1[3]xmm1[0,1,2] 
    xmm3 = xmm3[3]xmm3[0,1,2] 
    4x xmm0 <<= 24 
    xmm2 = xmm2[3]xmm2[0,1,2] 
    4x xmm1 <<= 24 
    xmm6 = xmm6[3]xmm6[0,1,2] 
    4x xmm3 <<= 24 
    xmm5 = xmm5[3]xmm5[0,1,2] 
    4x xmm2 <<= 24 
    xmm4 = xmm4[3]xmm4[0,1,2] 
    4x xmm6 <<= 24 
    xmm7 = xmm7[3]xmm7[0,1,2] 
    4x xmm5 <<= 24 
    4x xmm4 <<= 24 
    4x xmm7 <<= 24 
    #END MACRO rotbyte8
  
  
    #BEGIN MACRO sbox
    xmm5 ^= xmm4
    xmm3 ^= xmm1
    xmm5 ^= xmm0
    xmm4 ^= xmm3
    xmm2 ^= xmm0
    xmm4 ^= xmm2
    xmm2 ^= xmm7
    xmm7 ^= xmm5
    xmm2 ^= xmm6
    xmm6 ^= xmm5
    xmm2 ^= xmm1
    xmm3 ^= xmm7
    xmm1 ^= xmm5
      #BEGIN MACRO Inv_GF256
      xmm11 = xmm7 ^ xmm6
      xmm10 = xmm1 ^ xmm3
      xmm9 = xmm5 ^ xmm2
      xmm13 = xmm3 ^ xmm6
      xmm12 = xmm4 ^ xmm0
      xmm8 = xmm10 & xmm9
      xmm14 = xmm11 & xmm12
      xmm15 = xmm11 ^ xmm10
      xmm11 |= xmm12
      xmm12 ^= xmm9
      xmm10 |= xmm9
      xmm15 &= xmm12
      xmm12 = xmm2 ^ xmm0
      xmm11 ^= xmm15
      xmm13 &= xmm12
      xmm10 ^= xmm14
      xmm11 ^= xmm13
      xmm10 ^= xmm13
      xmm13 = xmm7 ^ xmm1
      xmm12 = xmm5 ^ xmm4
      xmm8 ^= xmm14
      xmm9 = xmm13 | xmm12
      xmm13 &= xmm12
      xmm9 ^= xmm15
      xmm8 ^= xmm13
      xmm9 ^= xmm14
      xmm12 = xmm3 & xmm2
      xmm13 = xmm6 & xmm0
      xmm11 ^= xmm12
      xmm10 ^= xmm13
      xmm14 = xmm1 & xmm5
      xmm12 = xmm11 ^ xmm10
      xmm15 = xmm7 | xmm4
      xmm9 ^= xmm14
      xmm8 ^= xmm15
      xmm11 &= xmm9
      xmm13 = xmm9 ^ xmm8
      xmm14 = xmm8 ^ xmm11
      xmm11 ^= xmm10
      xmm15 = xmm12 & xmm14
      xmm13 &= xmm11
      xmm15 ^= xmm10
      xmm13 ^= xmm8
      
      xmm10 = xmm14 ^ xmm13
      xmm9 ^= xmm13
      xmm10 &= xmm8
      xmm8 = xmm5 ^ xmm2
      xmm14 ^= xmm10
      xmm9 ^= xmm10
      xmm14 &= xmm15
      
      xmm14 ^= xmm12
      xmm12 = xmm4 ^ xmm0
      xmm10 = xmm15 ^ xmm14
      
      xmm10 &= xmm4
      xmm4 ^= xmm5
      xmm5 &= xmm15
      xmm4 &= xmm14
      xmm14 ^= xmm9
      xmm15 ^= xmm13
      xmm4 ^= xmm5
      xmm11 = xmm15 ^ xmm14
      xmm5 ^= xmm10
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm0
      xmm0 ^= xmm2
      xmm2 &= xmm13
      xmm0 &= xmm9
      xmm4 ^= xmm12
      xmm0 ^= xmm2
      xmm2 ^= xmm10
      xmm0 ^= xmm12
      xmm5 ^= xmm8
      xmm2 ^= xmm8
      xmm12 = xmm7 ^ xmm6
      xmm11 = xmm15 ^ xmm14
      xmm8 = xmm1 ^ xmm3
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm6
      xmm6 ^= xmm3
      xmm3 &= xmm13
      xmm6 &= xmm9
      xmm15 ^= xmm13
      xmm14 ^= xmm9
      xmm6 ^= xmm3
      xmm11 = xmm15 ^ xmm14
      xmm3 ^= xmm10
      xmm11 &= xmm7
      xmm7 ^= xmm1
      xmm1 &= xmm15
      xmm7 &= xmm14
      xmm6 ^= xmm12
      xmm7 ^= xmm1
      xmm1 ^= xmm11
      xmm7 ^= xmm12
      xmm1 ^= xmm8
      xmm3 ^= xmm8
      #END MACRO Inv_GF256
    
    xmm7 ^= xmm0
    xmm1 ^= xmm4
    xmm6 ^= xmm7
    xmm4 ^= xmm0
    xmm0 ^= xmm1
    xmm1 ^= xmm5
    xmm5 ^= xmm3
    xmm3 ^= xmm2
    xmm2 ^= xmm5
    xmm6 ^= xmm5
    xmm4 ^= xmm2
    #END MACRO sbox
  
  
    #BEGIN MACRO setrcon
    2x u = 0
    u = u[0],0xffffffff00000000
    #END MACRO setrcon
  
  xmm3 ^= u
    #BEGIN MACRO expb8
    4x xmm0 unsigned>>= 24
    4x xmm1 unsigned>>= 24
    4x xmm6 unsigned>>= 24
    4x xmm4 unsigned>>= 24
    4x u0 = xmm0 << 8
    4x u1 = xmm1 << 8
    4x u2 = xmm6 << 8
    4x u3 = xmm4 << 8
    xmm0 |= u0
    xmm1 |= u1
    xmm6 |= u2
    xmm4 |= u3
    4x u0 = xmm0 << 16
    4x u1 = xmm1 << 16
    4x u2 = xmm6 << 16
    4x u3 = xmm4 << 16
    xmm0 |= u0
    xmm1 |= u1
    xmm6 |= u2
    xmm4 |= u3
    4x xmm2 unsigned>>= 24
    4x xmm7 unsigned>>= 24
    4x xmm3 unsigned>>= 24
    4x xmm5 unsigned>>= 24
    4x u4 = xmm2 << 8
    4x u5 = xmm7 << 8
    4x u6 = xmm3 << 8
    4x u7 = xmm5 << 8
    xmm2 |= u4
    xmm7 |= u5
    xmm3 |= u6
    xmm5 |= u7
    4x u4 = xmm2 << 16
    4x u5 = xmm7 << 16
    4x u6 = xmm3 << 16
    4x u7 = xmm5 << 16
    xmm2 |= u4
    xmm7 |= u5
    xmm3 |= u6
    xmm5 |= u7
    #END MACRO expb8
  
  
  xmm8 aligned= mem128[input_0];input_0 += 16
  xmm8 = ~xmm8
  xmm9 aligned= mem128[input_0];input_0 += 16
  xmm9 = ~xmm9
  xmm10 aligned= mem128[input_0];input_0 += 16
  xmm0 ^= xmm8
  xmm11 aligned= mem128[input_0];input_0 += 16
  xmm1 ^= xmm9
  xmm6 ^= xmm10
  xmm4 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm6 ^= xmm10
  xmm4 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm6 ^= xmm10
  xmm4 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm6 ^= xmm10
  xmm12 aligned= mem128[input_0];input_0 += 16
  xmm4 ^= xmm11
  xmm13 aligned= mem128[input_0];input_0 += 16
  xmm13 = ~xmm13
  xmm14 aligned= mem128[input_0];input_0 += 16
  xmm14 = ~xmm14
  xmm15 aligned= mem128[input_0];input_0 += 16
  xmm2 ^= xmm12
  mem128[input_0] aligned= xmm0 ;input_0 += 16
  xmm7 ^= xmm13
  mem128[input_0] aligned= xmm1 ;input_0 += 16
  xmm3 ^= xmm14
  mem128[input_0] aligned= xmm6 ;input_0 += 16
  xmm5 ^= xmm15
  mem128[input_0] aligned= xmm4 ;input_0 += 16
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm2 ^= xmm12
  xmm7 ^= xmm13
  xmm3 ^= xmm14
  xmm5 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm2 ^= xmm12
  xmm7 ^= xmm13
  xmm3 ^= xmm14
  xmm5 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm2 ^= xmm12
  xmm7 ^= xmm13
  xmm3 ^= xmm14
  xmm5 ^= xmm15
  mem128[input_0] aligned= xmm2 ;input_0 += 16
  mem128[input_0] aligned= xmm7 ;input_0 += 16
  mem128[input_0] aligned= xmm3 ;input_0 += 16
  mem128[input_0] aligned= xmm5 ;input_0 += 16
  input_0 -= 128
  #END MACRO keyexpbs

  #BEGIN MACRO keyexpbs
  xmm0 = ~xmm0
  xmm1 = ~xmm1
  xmm7 = ~xmm7
  xmm3 = ~xmm3
    #BEGIN MACRO rotbyte8
    xmm0 = xmm0[3]xmm0[0,1,2] 
    xmm1 = xmm1[3]xmm1[0,1,2] 
    xmm6 = xmm6[3]xmm6[0,1,2] 
    4x xmm0 <<= 24 
    xmm4 = xmm4[3]xmm4[0,1,2] 
    4x xmm1 <<= 24 
    xmm2 = xmm2[3]xmm2[0,1,2] 
    4x xmm6 <<= 24 
    xmm7 = xmm7[3]xmm7[0,1,2] 
    4x xmm4 <<= 24 
    xmm3 = xmm3[3]xmm3[0,1,2] 
    4x xmm2 <<= 24 
    xmm5 = xmm5[3]xmm5[0,1,2] 
    4x xmm7 <<= 24 
    4x xmm3 <<= 24 
    4x xmm5 <<= 24 
    #END MACRO rotbyte8
  
  
    #BEGIN MACRO sbox
    xmm7 ^= xmm3
    xmm6 ^= xmm1
    xmm7 ^= xmm0
    xmm3 ^= xmm6
    xmm4 ^= xmm0
    xmm3 ^= xmm4
    xmm4 ^= xmm5
    xmm5 ^= xmm7
    xmm4 ^= xmm2
    xmm2 ^= xmm7
    xmm4 ^= xmm1
    xmm6 ^= xmm5
    xmm1 ^= xmm7
      #BEGIN MACRO Inv_GF256
      xmm11 = xmm5 ^ xmm2
      xmm10 = xmm1 ^ xmm6
      xmm9 = xmm7 ^ xmm4
      xmm13 = xmm6 ^ xmm2
      xmm12 = xmm3 ^ xmm0
      xmm8 = xmm10 & xmm9
      xmm14 = xmm11 & xmm12
      xmm15 = xmm11 ^ xmm10
      xmm11 |= xmm12
      xmm12 ^= xmm9
      xmm10 |= xmm9
      xmm15 &= xmm12
      xmm12 = xmm4 ^ xmm0
      xmm11 ^= xmm15
      xmm13 &= xmm12
      xmm10 ^= xmm14
      xmm11 ^= xmm13
      xmm10 ^= xmm13
      xmm13 = xmm5 ^ xmm1
      xmm12 = xmm7 ^ xmm3
      xmm8 ^= xmm14
      xmm9 = xmm13 | xmm12
      xmm13 &= xmm12
      xmm9 ^= xmm15
      xmm8 ^= xmm13
      xmm9 ^= xmm14
      xmm12 = xmm6 & xmm4
      xmm13 = xmm2 & xmm0
      xmm11 ^= xmm12
      xmm10 ^= xmm13
      xmm14 = xmm1 & xmm7
      xmm12 = xmm11 ^ xmm10
      xmm15 = xmm5 | xmm3
      xmm9 ^= xmm14
      xmm8 ^= xmm15
      xmm11 &= xmm9
      xmm13 = xmm9 ^ xmm8
      xmm14 = xmm8 ^ xmm11
      xmm11 ^= xmm10
      xmm15 = xmm12 & xmm14
      xmm13 &= xmm11
      xmm15 ^= xmm10
      xmm13 ^= xmm8
      
      xmm10 = xmm14 ^ xmm13
      xmm9 ^= xmm13
      xmm10 &= xmm8
      xmm8 = xmm7 ^ xmm4
      xmm14 ^= xmm10
      xmm9 ^= xmm10
      xmm14 &= xmm15
      
      xmm14 ^= xmm12
      xmm12 = xmm3 ^ xmm0
      xmm10 = xmm15 ^ xmm14
      
      xmm10 &= xmm3
      xmm3 ^= xmm7
      xmm7 &= xmm15
      xmm3 &= xmm14
      xmm14 ^= xmm9
      xmm15 ^= xmm13
      xmm3 ^= xmm7
      xmm11 = xmm15 ^ xmm14
      xmm7 ^= xmm10
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm0
      xmm0 ^= xmm4
      xmm4 &= xmm13
      xmm0 &= xmm9
      xmm3 ^= xmm12
      xmm0 ^= xmm4
      xmm4 ^= xmm10
      xmm0 ^= xmm12
      xmm7 ^= xmm8
      xmm4 ^= xmm8
      xmm12 = xmm5 ^ xmm2
      xmm11 = xmm15 ^ xmm14
      xmm8 = xmm1 ^ xmm6
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm2
      xmm2 ^= xmm6
      xmm6 &= xmm13
      xmm2 &= xmm9
      xmm15 ^= xmm13
      xmm14 ^= xmm9
      xmm2 ^= xmm6
      xmm11 = xmm15 ^ xmm14
      xmm6 ^= xmm10
      xmm11 &= xmm5
      xmm5 ^= xmm1
      xmm1 &= xmm15
      xmm5 &= xmm14
      xmm2 ^= xmm12
      xmm5 ^= xmm1
      xmm1 ^= xmm11
      xmm5 ^= xmm12
      xmm1 ^= xmm8
      xmm6 ^= xmm8
      #END MACRO Inv_GF256
    
    xmm5 ^= xmm0
    xmm1 ^= xmm3
    xmm2 ^= xmm5
    xmm3 ^= xmm0
    xmm0 ^= xmm1
    xmm1 ^= xmm7
    xmm7 ^= xmm6
    xmm6 ^= xmm4
    xmm4 ^= xmm7
    xmm2 ^= xmm7
    xmm3 ^= xmm4
    #END MACRO sbox
  
  
    #BEGIN MACRO setrcon
    2x u = 0
    u = u[0],0xffffffff00000000
    #END MACRO setrcon
  
  xmm7 ^= u
    #BEGIN MACRO expb8
    4x xmm0 unsigned>>= 24
    4x xmm1 unsigned>>= 24
    4x xmm2 unsigned>>= 24
    4x xmm3 unsigned>>= 24
    4x u0 = xmm0 << 8
    4x u1 = xmm1 << 8
    4x u2 = xmm2 << 8
    4x u3 = xmm3 << 8
    xmm0 |= u0
    xmm1 |= u1
    xmm2 |= u2
    xmm3 |= u3
    4x u0 = xmm0 << 16
    4x u1 = xmm1 << 16
    4x u2 = xmm2 << 16
    4x u3 = xmm3 << 16
    xmm0 |= u0
    xmm1 |= u1
    xmm2 |= u2
    xmm3 |= u3
    4x xmm4 unsigned>>= 24
    4x xmm5 unsigned>>= 24
    4x xmm6 unsigned>>= 24
    4x xmm7 unsigned>>= 24
    4x u4 = xmm4 << 8
    4x u5 = xmm5 << 8
    4x u6 = xmm6 << 8
    4x u7 = xmm7 << 8
    xmm4 |= u4
    xmm5 |= u5
    xmm6 |= u6
    xmm7 |= u7
    4x u4 = xmm4 << 16
    4x u5 = xmm5 << 16
    4x u6 = xmm6 << 16
    4x u7 = xmm7 << 16
    xmm4 |= u4
    xmm5 |= u5
    xmm6 |= u6
    xmm7 |= u7
    #END MACRO expb8
  
  
  xmm8 aligned= mem128[input_0];input_0 += 16
  xmm8 = ~xmm8
  xmm9 aligned= mem128[input_0];input_0 += 16
  xmm9 = ~xmm9
  xmm10 aligned= mem128[input_0];input_0 += 16
  xmm0 ^= xmm8
  xmm11 aligned= mem128[input_0];input_0 += 16
  xmm1 ^= xmm9
  xmm2 ^= xmm10
  xmm3 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm2 ^= xmm10
  xmm3 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm2 ^= xmm10
  xmm3 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm2 ^= xmm10
  xmm12 aligned= mem128[input_0];input_0 += 16
  xmm3 ^= xmm11
  xmm13 aligned= mem128[input_0];input_0 += 16
  xmm13 = ~xmm13
  xmm14 aligned= mem128[input_0];input_0 += 16
  xmm14 = ~xmm14
  xmm15 aligned= mem128[input_0];input_0 += 16
  xmm4 ^= xmm12
  mem128[input_0] aligned= xmm0 ;input_0 += 16
  xmm5 ^= xmm13
  mem128[input_0] aligned= xmm1 ;input_0 += 16
  xmm6 ^= xmm14
  mem128[input_0] aligned= xmm2 ;input_0 += 16
  xmm7 ^= xmm15
  mem128[input_0] aligned= xmm3 ;input_0 += 16
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm4 ^= xmm12
  xmm5 ^= xmm13
  xmm6 ^= xmm14
  xmm7 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm4 ^= xmm12
  xmm5 ^= xmm13
  xmm6 ^= xmm14
  xmm7 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm4 ^= xmm12
  xmm5 ^= xmm13
  xmm6 ^= xmm14
  xmm7 ^= xmm15
  mem128[input_0] aligned= xmm4 ;input_0 += 16
  mem128[input_0] aligned= xmm5 ;input_0 += 16
  mem128[input_0] aligned= xmm6 ;input_0 += 16
  mem128[input_0] aligned= xmm7 ;input_0 += 16
  input_0 -= 128
  #END MACRO keyexpbs


  #BEGIN MACRO keyexpbs
  xmm0 = ~xmm0
  xmm1 = ~xmm1
  xmm5 = ~xmm5
  xmm6 = ~xmm6
    #BEGIN MACRO rotbyte8
    xmm0 = xmm0[3]xmm0[0,1,2] 
    xmm1 = xmm1[3]xmm1[0,1,2] 
    xmm2 = xmm2[3]xmm2[0,1,2] 
    4x xmm0 <<= 24 
    xmm3 = xmm3[3]xmm3[0,1,2] 
    4x xmm1 <<= 24 
    xmm4 = xmm4[3]xmm4[0,1,2] 
    4x xmm2 <<= 24 
    xmm5 = xmm5[3]xmm5[0,1,2] 
    4x xmm3 <<= 24 
    xmm6 = xmm6[3]xmm6[0,1,2] 
    4x xmm4 <<= 24 
    xmm7 = xmm7[3]xmm7[0,1,2] 
    4x xmm5 <<= 24 
    4x xmm6 <<= 24 
    4x xmm7 <<= 24 
    #END MACRO rotbyte8
  
  
    #BEGIN MACRO sbox
    xmm5 ^= xmm6
    xmm2 ^= xmm1
    xmm5 ^= xmm0
    xmm6 ^= xmm2
    xmm3 ^= xmm0
    xmm6 ^= xmm3
    xmm3 ^= xmm7
    xmm7 ^= xmm5
    xmm3 ^= xmm4
    xmm4 ^= xmm5
    xmm3 ^= xmm1
    xmm2 ^= xmm7
    xmm1 ^= xmm5
      #BEGIN MACRO Inv_GF256
      xmm11 = xmm7 ^ xmm4
      xmm10 = xmm1 ^ xmm2
      xmm9 = xmm5 ^ xmm3
      xmm13 = xmm2 ^ xmm4
      xmm12 = xmm6 ^ xmm0
      xmm8 = xmm10 & xmm9
      xmm14 = xmm11 & xmm12
      xmm15 = xmm11 ^ xmm10
      xmm11 |= xmm12
      xmm12 ^= xmm9
      xmm10 |= xmm9
      xmm15 &= xmm12
      xmm12 = xmm3 ^ xmm0
      xmm11 ^= xmm15
      xmm13 &= xmm12
      xmm10 ^= xmm14
      xmm11 ^= xmm13
      xmm10 ^= xmm13
      xmm13 = xmm7 ^ xmm1
      xmm12 = xmm5 ^ xmm6
      xmm8 ^= xmm14
      xmm9 = xmm13 | xmm12
      xmm13 &= xmm12
      xmm9 ^= xmm15
      xmm8 ^= xmm13
      xmm9 ^= xmm14
      xmm12 = xmm2 & xmm3
      xmm13 = xmm4 & xmm0
      xmm11 ^= xmm12
      xmm10 ^= xmm13
      xmm14 = xmm1 & xmm5
      xmm12 = xmm11 ^ xmm10
      xmm15 = xmm7 | xmm6
      xmm9 ^= xmm14
      xmm8 ^= xmm15
      xmm11 &= xmm9
      xmm13 = xmm9 ^ xmm8
      xmm14 = xmm8 ^ xmm11
      xmm11 ^= xmm10
      xmm15 = xmm12 & xmm14
      xmm13 &= xmm11
      xmm15 ^= xmm10
      xmm13 ^= xmm8
      
      xmm10 = xmm14 ^ xmm13
      xmm9 ^= xmm13
      xmm10 &= xmm8
      xmm8 = xmm5 ^ xmm3
      xmm14 ^= xmm10
      xmm9 ^= xmm10
      xmm14 &= xmm15
      
      xmm14 ^= xmm12
      xmm12 = xmm6 ^ xmm0
      xmm10 = xmm15 ^ xmm14
      
      xmm10 &= xmm6
      xmm6 ^= xmm5
      xmm5 &= xmm15
      xmm6 &= xmm14
      xmm14 ^= xmm9
      xmm15 ^= xmm13
      xmm6 ^= xmm5
      xmm11 = xmm15 ^ xmm14
      xmm5 ^= xmm10
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm0
      xmm0 ^= xmm3
      xmm3 &= xmm13
      xmm0 &= xmm9
      xmm6 ^= xmm12
      xmm0 ^= xmm3
      xmm3 ^= xmm10
      xmm0 ^= xmm12
      xmm5 ^= xmm8
      xmm3 ^= xmm8
      xmm12 = xmm7 ^ xmm4
      xmm11 = xmm15 ^ xmm14
      xmm8 = xmm1 ^ xmm2
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm4
      xmm4 ^= xmm2
      xmm2 &= xmm13
      xmm4 &= xmm9
      xmm15 ^= xmm13
      xmm14 ^= xmm9
      xmm4 ^= xmm2
      xmm11 = xmm15 ^ xmm14
      xmm2 ^= xmm10
      xmm11 &= xmm7
      xmm7 ^= xmm1
      xmm1 &= xmm15
      xmm7 &= xmm14
      xmm4 ^= xmm12
      xmm7 ^= xmm1
      xmm1 ^= xmm11
      xmm7 ^= xmm12
      xmm1 ^= xmm8
      xmm2 ^= xmm8
      #END MACRO Inv_GF256
    
    xmm7 ^= xmm0
    xmm1 ^= xmm6
    xmm4 ^= xmm7
    xmm6 ^= xmm0
    xmm0 ^= xmm1
    xmm1 ^= xmm5
    xmm5 ^= xmm2
    xmm2 ^= xmm3
    xmm3 ^= xmm5
    xmm4 ^= xmm5
    xmm6 ^= xmm3
    #END MACRO sbox
  
  
    #BEGIN MACRO setrcon
    2x u = 0
    u = u[0],0xffffffff00000000
    #END MACRO setrcon
  
  xmm0 ^= u
  xmm1 ^= u
  xmm6 ^= u
  xmm3 ^= u
    #BEGIN MACRO expb8
    4x xmm0 unsigned>>= 24
    4x xmm1 unsigned>>= 24
    4x xmm4 unsigned>>= 24
    4x xmm6 unsigned>>= 24
    4x u0 = xmm0 << 8
    4x u1 = xmm1 << 8
    4x u2 = xmm4 << 8
    4x u3 = xmm6 << 8
    xmm0 |= u0
    xmm1 |= u1
    xmm4 |= u2
    xmm6 |= u3
    4x u0 = xmm0 << 16
    4x u1 = xmm1 << 16
    4x u2 = xmm4 << 16
    4x u3 = xmm6 << 16
    xmm0 |= u0
    xmm1 |= u1
    xmm4 |= u2
    xmm6 |= u3
    4x xmm3 unsigned>>= 24
    4x xmm7 unsigned>>= 24
    4x xmm2 unsigned>>= 24
    4x xmm5 unsigned>>= 24
    4x u4 = xmm3 << 8
    4x u5 = xmm7 << 8
    4x u6 = xmm2 << 8
    4x u7 = xmm5 << 8
    xmm3 |= u4
    xmm7 |= u5
    xmm2 |= u6
    xmm5 |= u7
    4x u4 = xmm3 << 16
    4x u5 = xmm7 << 16
    4x u6 = xmm2 << 16
    4x u7 = xmm5 << 16
    xmm3 |= u4
    xmm7 |= u5
    xmm2 |= u6
    xmm5 |= u7
    #END MACRO expb8
  
  
  xmm8 aligned= mem128[input_0];input_0 += 16
  xmm8 = ~xmm8
  xmm9 aligned= mem128[input_0];input_0 += 16
  xmm9 = ~xmm9
  xmm10 aligned= mem128[input_0];input_0 += 16
  xmm0 ^= xmm8
  xmm11 aligned= mem128[input_0];input_0 += 16
  xmm1 ^= xmm9
  xmm4 ^= xmm10
  xmm6 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm4 ^= xmm10
  xmm6 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm4 ^= xmm10
  xmm6 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm4 ^= xmm10
  xmm12 aligned= mem128[input_0];input_0 += 16
  xmm6 ^= xmm11
  xmm13 aligned= mem128[input_0];input_0 += 16
  xmm13 = ~xmm13
  xmm14 aligned= mem128[input_0];input_0 += 16
  xmm14 = ~xmm14
  xmm15 aligned= mem128[input_0];input_0 += 16
  xmm3 ^= xmm12
  mem128[input_0] aligned= xmm0 ;input_0 += 16
  xmm7 ^= xmm13
  mem128[input_0] aligned= xmm1 ;input_0 += 16
  xmm2 ^= xmm14
  mem128[input_0] aligned= xmm4 ;input_0 += 16
  xmm5 ^= xmm15
  mem128[input_0] aligned= xmm6 ;input_0 += 16
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm3 ^= xmm12
  xmm7 ^= xmm13
  xmm2 ^= xmm14
  xmm5 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm3 ^= xmm12
  xmm7 ^= xmm13
  xmm2 ^= xmm14
  xmm5 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm3 ^= xmm12
  xmm7 ^= xmm13
  xmm2 ^= xmm14
  xmm5 ^= xmm15
  mem128[input_0] aligned= xmm3 ;input_0 += 16
  mem128[input_0] aligned= xmm7 ;input_0 += 16
  mem128[input_0] aligned= xmm2 ;input_0 += 16
  mem128[input_0] aligned= xmm5 ;input_0 += 16
  input_0 -= 128
  #END MACRO keyexpbs

  #BEGIN MACRO keyexpbs10
  xmm0 = ~xmm0
  xmm1 = ~xmm1
  xmm7 = ~xmm7
  xmm2 = ~xmm2
    #BEGIN MACRO rotbyte8
    xmm0 = xmm0[3]xmm0[0,1,2] 
    xmm1 = xmm1[3]xmm1[0,1,2] 
    xmm4 = xmm4[3]xmm4[0,1,2] 
    4x xmm0 <<= 24 
    xmm6 = xmm6[3]xmm6[0,1,2] 
    4x xmm1 <<= 24 
    xmm3 = xmm3[3]xmm3[0,1,2] 
    4x xmm4 <<= 24 
    xmm7 = xmm7[3]xmm7[0,1,2] 
    4x xmm6 <<= 24 
    xmm2 = xmm2[3]xmm2[0,1,2] 
    4x xmm3 <<= 24 
    xmm5 = xmm5[3]xmm5[0,1,2] 
    4x xmm7 <<= 24 
    4x xmm2 <<= 24 
    4x xmm5 <<= 24 
    #END MACRO rotbyte8
  
  
    #BEGIN MACRO sbox
    xmm7 ^= xmm2
    xmm4 ^= xmm1
    xmm7 ^= xmm0
    xmm2 ^= xmm4
    xmm6 ^= xmm0
    xmm2 ^= xmm6
    xmm6 ^= xmm5
    xmm5 ^= xmm7
    xmm6 ^= xmm3
    xmm3 ^= xmm7
    xmm6 ^= xmm1
    xmm4 ^= xmm5
    xmm1 ^= xmm7
      #BEGIN MACRO Inv_GF256
      xmm11 = xmm5 ^ xmm3
      xmm10 = xmm1 ^ xmm4
      xmm9 = xmm7 ^ xmm6
      xmm13 = xmm4 ^ xmm3
      xmm12 = xmm2 ^ xmm0
      xmm8 = xmm10 & xmm9
      xmm14 = xmm11 & xmm12
      xmm15 = xmm11 ^ xmm10
      xmm11 |= xmm12
      xmm12 ^= xmm9
      xmm10 |= xmm9
      xmm15 &= xmm12
      xmm12 = xmm6 ^ xmm0
      xmm11 ^= xmm15
      xmm13 &= xmm12
      xmm10 ^= xmm14
      xmm11 ^= xmm13
      xmm10 ^= xmm13
      xmm13 = xmm5 ^ xmm1
      xmm12 = xmm7 ^ xmm2
      xmm8 ^= xmm14
      xmm9 = xmm13 | xmm12
      xmm13 &= xmm12
      xmm9 ^= xmm15
      xmm8 ^= xmm13
      xmm9 ^= xmm14
      xmm12 = xmm4 & xmm6
      xmm13 = xmm3 & xmm0
      xmm11 ^= xmm12
      xmm10 ^= xmm13
      xmm14 = xmm1 & xmm7
      xmm12 = xmm11 ^ xmm10
      xmm15 = xmm5 | xmm2
      xmm9 ^= xmm14
      xmm8 ^= xmm15
      xmm11 &= xmm9
      xmm13 = xmm9 ^ xmm8
      xmm14 = xmm8 ^ xmm11
      xmm11 ^= xmm10
      xmm15 = xmm12 & xmm14
      xmm13 &= xmm11
      xmm15 ^= xmm10
      xmm13 ^= xmm8
      
      xmm10 = xmm14 ^ xmm13
      xmm9 ^= xmm13
      xmm10 &= xmm8
      xmm8 = xmm7 ^ xmm6
      xmm14 ^= xmm10
      xmm9 ^= xmm10
      xmm14 &= xmm15
      
      xmm14 ^= xmm12
      xmm12 = xmm2 ^ xmm0
      xmm10 = xmm15 ^ xmm14
      
      xmm10 &= xmm2
      xmm2 ^= xmm7
      xmm7 &= xmm15
      xmm2 &= xmm14
      xmm14 ^= xmm9
      xmm15 ^= xmm13
      xmm2 ^= xmm7
      xmm11 = xmm15 ^ xmm14
      xmm7 ^= xmm10
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm0
      xmm0 ^= xmm6
      xmm6 &= xmm13
      xmm0 &= xmm9
      xmm2 ^= xmm12
      xmm0 ^= xmm6
      xmm6 ^= xmm10
      xmm0 ^= xmm12
      xmm7 ^= xmm8
      xmm6 ^= xmm8
      xmm12 = xmm5 ^ xmm3
      xmm11 = xmm15 ^ xmm14
      xmm8 = xmm1 ^ xmm4
      xmm11 &= xmm12
      xmm12 ^= xmm8
      xmm8 &= xmm15
      xmm12 &= xmm14
      xmm10 = xmm13 ^ xmm9
      xmm8 ^= xmm12
      xmm12 ^= xmm11
      xmm10 &= xmm3
      xmm3 ^= xmm4
      xmm4 &= xmm13
      xmm3 &= xmm9
      xmm15 ^= xmm13
      xmm14 ^= xmm9
      xmm3 ^= xmm4
      xmm11 = xmm15 ^ xmm14
      xmm4 ^= xmm10
      xmm11 &= xmm5
      xmm5 ^= xmm1
      xmm1 &= xmm15
      xmm5 &= xmm14
      xmm3 ^= xmm12
      xmm5 ^= xmm1
      xmm1 ^= xmm11
      xmm5 ^= xmm12
      xmm1 ^= xmm8
      xmm4 ^= xmm8
      #END MACRO Inv_GF256
    
    xmm5 ^= xmm0
    xmm1 ^= xmm2
    xmm3 ^= xmm5
    xmm2 ^= xmm0
    xmm0 ^= xmm1
    xmm1 ^= xmm7
    xmm7 ^= xmm4
    xmm4 ^= xmm6
    xmm6 ^= xmm7
    xmm3 ^= xmm7
    xmm2 ^= xmm6
    #END MACRO sbox
  
  
    #BEGIN MACRO setrcon
    2x u = 0
    u = u[0],0xffffffff00000000
    #END MACRO setrcon
  
  xmm1 ^= u
  xmm3 ^= u
  xmm6 ^= u
  xmm5 ^= u
    #BEGIN MACRO expb8
    4x xmm0 unsigned>>= 24
    4x xmm1 unsigned>>= 24
    4x xmm3 unsigned>>= 24
    4x xmm2 unsigned>>= 24
    4x u0 = xmm0 << 8
    4x u1 = xmm1 << 8
    4x u2 = xmm3 << 8
    4x u3 = xmm2 << 8
    xmm0 |= u0
    xmm1 |= u1
    xmm3 |= u2
    xmm2 |= u3
    4x u0 = xmm0 << 16
    4x u1 = xmm1 << 16
    4x u2 = xmm3 << 16
    4x u3 = xmm2 << 16
    xmm0 |= u0
    xmm1 |= u1
    xmm3 |= u2
    xmm2 |= u3
    4x xmm6 unsigned>>= 24
    4x xmm5 unsigned>>= 24
    4x xmm4 unsigned>>= 24
    4x xmm7 unsigned>>= 24
    4x u4 = xmm6 << 8
    4x u5 = xmm5 << 8
    4x u6 = xmm4 << 8
    4x u7 = xmm7 << 8
    xmm6 |= u4
    xmm5 |= u5
    xmm4 |= u6
    xmm7 |= u7
    4x u4 = xmm6 << 16
    4x u5 = xmm5 << 16
    4x u6 = xmm4 << 16
    4x u7 = xmm7 << 16
    xmm6 |= u4
    xmm5 |= u5
    xmm4 |= u6
    xmm7 |= u7
    #END MACRO expb8
  
  
  xmm8 aligned= mem128[input_0];input_0 += 16
  xmm8 = ~xmm8
  xmm9 aligned= mem128[input_0];input_0 += 16
  xmm9 = ~xmm9
  xmm10 aligned= mem128[input_0];input_0 += 16
  xmm0 ^= xmm8
  xmm11 aligned= mem128[input_0];input_0 += 16
  xmm1 ^= xmm9
  xmm3 ^= xmm10
  xmm2 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm3 ^= xmm10
  xmm2 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm3 ^= xmm10
  xmm2 ^= xmm11
  4x xmm8 unsigned>>= 8
  4x xmm9 unsigned>>= 8
  4x xmm10 unsigned>>= 8
  4x xmm11 unsigned>>= 8
  xmm0 ^= xmm8
  xmm1 ^= xmm9
  xmm3 ^= xmm10
  xmm12 aligned= mem128[input_0];input_0 += 16
  xmm2 ^= xmm11
  xmm13 aligned= mem128[input_0];input_0 += 16
  xmm13 = ~xmm13
  xmm14 aligned= mem128[input_0];input_0 += 16
  xmm14 = ~xmm14
  xmm15 aligned= mem128[input_0];input_0 += 16
  xmm6 ^= xmm12
  xmm5 ^= xmm13
    #BEGIN MACRO interleave
    xmm0 = xmm0[0,2,1,3]
    xmm0 = xmm0[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
    xmm0 = xmm0[0,2,1,3]
    xmm0 = xmm0[0,4,2,6,1,5,3,7]
    xmm0 = xmm0[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
    xmm0 = xmm0[1,0]
    #END MACRO interleave
  
  xmm4 ^= xmm14
  xmm7 ^= xmm15
  mem128[input_0] aligned= xmm0 ;input_0 += 16
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
    #BEGIN MACRO interleave
    xmm1 = xmm1[0,2,1,3]
    xmm1 = xmm1[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
    xmm1 = xmm1[0,2,1,3]
    xmm1 = xmm1[0,4,2,6,1,5,3,7]
    xmm1 = xmm1[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
    xmm1 = xmm1[1,0]
    #END MACRO interleave
  
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  mem128[input_0] aligned= xmm1 ;input_0 += 16
  xmm6 ^= xmm12
  xmm5 ^= xmm13
    #BEGIN MACRO interleave
    xmm3 = xmm3[0,2,1,3]
    xmm3 = xmm3[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
    xmm3 = xmm3[0,2,1,3]
    xmm3 = xmm3[0,4,2,6,1,5,3,7]
    xmm3 = xmm3[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
    xmm3 = xmm3[1,0]
    #END MACRO interleave
  
  xmm4 ^= xmm14
  xmm7 ^= xmm15
  mem128[input_0] aligned= xmm3 ;input_0 += 16
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
    #BEGIN MACRO interleave
    xmm2 = xmm2[0,2,1,3]
    xmm2 = xmm2[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
    xmm2 = xmm2[0,2,1,3]
    xmm2 = xmm2[0,4,2,6,1,5,3,7]
    xmm2 = xmm2[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
    xmm2 = xmm2[1,0]
    #END MACRO interleave
  
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  mem128[input_0] aligned= xmm2 ;input_0 += 16
  xmm6 ^= xmm12
  xmm5 ^= xmm13
  xmm4 ^= xmm14
  xmm7 ^= xmm15
  4x xmm12 unsigned>>= 8
  4x xmm13 unsigned>>= 8
  4x xmm14 unsigned>>= 8
  4x xmm15 unsigned>>= 8
  xmm6 ^= xmm12
  xmm5 ^= xmm13
  xmm4 ^= xmm14
  xmm7 ^= xmm15
    #BEGIN MACRO interleave
    xmm6 = xmm6[0,2,1,3]
    xmm6 = xmm6[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
    xmm6 = xmm6[0,2,1,3]
    xmm6 = xmm6[0,4,2,6,1,5,3,7]
    xmm6 = xmm6[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
    xmm6 = xmm6[1,0]
    #END MACRO interleave
  
  mem128[input_0] aligned= xmm6 ;input_0 += 16
    #BEGIN MACRO interleave
    xmm5 = xmm5[0,2,1,3]
    xmm5 = xmm5[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
    xmm5 = xmm5[0,2,1,3]
    xmm5 = xmm5[0,4,2,6,1,5,3,7]
    xmm5 = xmm5[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
    xmm5 = xmm5[1,0]
    #END MACRO interleave
  
  mem128[input_0] aligned= xmm5 ;input_0 += 16
    #BEGIN MACRO interleave
    xmm4 = xmm4[0,2,1,3]
    xmm4 = xmm4[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
    xmm4 = xmm4[0,2,1,3]
    xmm4 = xmm4[0,4,2,6,1,5,3,7]
    xmm4 = xmm4[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
    xmm4 = xmm4[1,0]
    #END MACRO interleave
  
  mem128[input_0] aligned= xmm4 ;input_0 += 16
    #BEGIN MACRO interleave
    xmm7 = xmm7[0,2,1,3]
    xmm7 = xmm7[0,8,2,10,4,12,6,14,1,9,3,11,5,13,7,15]
    xmm7 = xmm7[0,2,1,3]
    xmm7 = xmm7[0,4,2,6,1,5,3,7]
    xmm7 = xmm7[7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8]
    xmm7 = xmm7[1,0]
    #END MACRO interleave
  
  mem128[input_0] aligned= xmm7 ;input_0 += 16
  input_0 -= 128
  #END MACRO keyexpbs10


qpopreturn
