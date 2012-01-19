@ The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
@ Michaël Peeters and Gilles Van Assche. For more information, feedback or
@ questions, please refer to our website: http://keccak.noekeon.org/
@
@ Implementation by Ronny Van Keer, hereby denoted as "the implementer".
@
@ To the extent possible under law, the implementer has waived all copyright
@ and related or neighboring rights to the source code in this file.
@ http://creativecommons.org/publicdomain/zero/1.0/

@ This file was created from a .asm file
@  using the ads2gas.pl script.
.equ DO1STROUNDING, 0

  @ PRESERVE8
.text

@// --- defines
.equ cKeccakLaneSizeInBytes, 8
.equ cKeccakR_SizeInBytes  , 1024/8
.equ crypto_hash_BYTES      , cKeccakR_SizeInBytes

@//  --- offsets in state
.equ Aba, 0*8
.equ Aga, 1*8
.equ Aka, 2*8
.equ Ama, 3*8
.equ Asa, 4*8


@// --- code 

  .align 8

.global   KeccakF_armv7a_neon_asm
    
@//int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
.global   crypto_hash_keccak_inplace_armv7a_neon

crypto_hash_keccak_inplace_armv7a_neon:  @

    push  {r4-r6,lr}
    mov    r5, r0
    vpush  {q4-q7}
    
    @//allocate and clear state
    pld    [sp, #-5*8]  @//preload state data
    vmov.i64  q6, #0
    vpush  {d12}
    vmov.i64  q7, #0
    vmov.i64  q8, #0
    vpush  {d12}
    vmov.i64  q9, #0
    vmov.i64  q10, #0
    vpush  {d12}
    vmov.i64  q11, #0
    vmov.i64  q12, #0
    vpush  {d12}
    vmov.i64  q13, #0
    vmov.i64  q14, #0
    vpush  {d12}
    vmov.i64  q15, #0

    subs  r2, r2, #cKeccakR_SizeInBytes
    bcc    crypto_hash_LoopEnd
    pld    [r1]  @//preload in data

    @//  Complete rate loop  
crypto_hash_Loop:

    vldr  d7, [sp, #Aba]    @get 5 lanes from stack
    vldm  r1!, { d0-d1 }
    veor.64  d7, d0
    vldm  r1!, { d2-d3 }
    veor.64  d12, d1
    vldm  r1!, { d0-d1 }
    veor.64  d17, d2
    vldr  d8, [sp, #Aga]
    veor.64  d22, d3
    vldm  r1!, { d2-d3 }
    veor.64  d27, d0
    vstr  d7, [sp, #Aba]
    veor.64  d8, d1
    vldm  r1!, { d0-d1 }
    veor.64  d13, d2
    vldr  d9, [sp, #Aka]
    veor.64  d18, d3
    vldm  r1!, { d2-d3 }
    veor.64  d23, d0
    vldr  d10, [sp, #Ama]
    veor.64  d28, d1
    vldm  r1!, { d0-d1 }
    veor.64  d9, d2
    vstr  d8, [sp, #Aga]
    veor.64  d14, d3
    vldm  r1!, { d2-d3 }
    veor.64  d19, d0
    vldr  d11, [sp, #Asa]
    veor.64  d24, d1
    vstr  d9, [sp, #Aka]
    veor.64  d29, d2
    veor.64  d10, d3
    veor.64  q4, q5
    vstr  d10, [sp, #Ama]
    veor.64  d5, d8, d9
    veor.64  d5, d5, d7

    bl    KeccakF_armv7a_neon_asm
    subs  r2, r2, #cKeccakR_SizeInBytes
    bcs    crypto_hash_Loop
crypto_hash_LoopEnd:

    adds  r2, r2, #cKeccakR_SizeInBytes
    vldm  sp, { d7-d11 }  @get 5 lanes from stack
    cmp    r2, #8
    blo    crypto_hash_IncompleteLane

    @ Absorb last complete lanes
    cmp    r2, #8*8
    bhs    crypto_hash_8LanesOrMore
    
    @less than 8 lanes left
    cmp    r2, #4*8
    bhs    crypto_hash_4LanesOrMore

    @1 to 3 lanes left
    vld1.64   d0, [r1]!            
    cmp    r2, #2*8
    veor.64  d7, d0
    blo    crypto_hash_FinalizeCompleteLanes
    vld1.64   d0, [r1]!            
    cmp    r2, #3*8
    veor.64  d12, d0
    blo    crypto_hash_FinalizeCompleteLanes
    vld1.64   d0, [r1]!            
    veor.64  d17, d0
    b      crypto_hash_FinalizeCompleteLanes
    
crypto_hash_4LanesOrMore:
    vldm  r1!, { d0-d1 }
    veor.64  d7, d0
    vldm  r1!, { d2-d3 }
    veor.64  d12, d1
    veor.64  d17, d2
    veor.64  d22, d3

    cmp    r2, #5*8
    blo    crypto_hash_FinalizeCompleteLanes
    vld1.64   d0, [r1]!            
    cmp    r2, #6*8
    veor.64  d27, d0
    blo    crypto_hash_FinalizeCompleteLanes
    vld1.64   d0, [r1]!            
    cmp    r2, #7*8
    veor.64  d8, d0
    blo    crypto_hash_FinalizeCompleteLanes
    vld1.64   d0, [r1]!            
    veor.64  d13, d0
    b      crypto_hash_FinalizeCompleteLanes

crypto_hash_8LanesOrMore:
    vldm  r1!, { d0-d1 }
    veor.64  d7, d0
    vldm  r1!, { d2-d3 }
    veor.64  d12, d1
    vldm  r1!, { d0-d1 }
    veor.64  d17, d2
    veor.64  d22, d3
    vldm  r1!, { d2-d3 }
    veor.64  d27, d0
    veor.64  d8, d1
    veor.64  d13, d2
    veor.64  d18, d3

    cmp    r2, #12*8
    bhs    crypto_hash_12LanesOrMore

    @8 to 11 lanes left
    cmp    r2, #9*8
    blo    crypto_hash_FinalizeCompleteLanes
    vld1.64   d0, [r1]!            
    cmp    r2, #10*8
    veor.64  d23, d0
    blo    crypto_hash_FinalizeCompleteLanes
    vld1.64   d0, [r1]!            
    cmp    r2, #11*8
    veor.64  d28, d0
    blo    crypto_hash_FinalizeCompleteLanes
    vld1.64   d0, [r1]!            
    veor.64  d9, d0
    b      crypto_hash_FinalizeCompleteLanes

crypto_hash_12LanesOrMore:
    vldm  r1!, { d0-d1 }
    veor.64  d23, d0
    vldm  r1!, { d2-d3 }
    veor.64  d28, d1
    veor.64  d9, d2
    veor.64  d14, d3

    @12 to 15 lanes left
    cmp    r2, #13*8
    blo    crypto_hash_FinalizeCompleteLanes
    vld1.64   d0, [r1]!            
    cmp    r2, #14*8
    veor.64  d19, d0
    blo    crypto_hash_FinalizeCompleteLanes
    vld1.64   d0, [r1]!            
    cmp    r2, #15*8
    veor.64  d24, d0
    blo    crypto_hash_FinalizeCompleteLanes
    vld1.64   d0, [r1]!            
    veor.64  d29, d0

crypto_hash_FinalizeCompleteLanes:


crypto_hash_IncompleteLane:
    and    r0, r2, #cKeccakLaneSizeInBytes-1
    vmov.i8  d0, #0xFF          @padding
    lsr    r2, r2, #3  @//number of lanes left

    vshr.u64  d0, #63            @padding
      adr  r3, crypto_hash_IncompleteLaneTable
    ldr    pc, [r3, r0, LSL #2]

crypto_hash_IncompleteLaneTable:
    .long     crypto_hash_IncompleteDone  @0 left
    .long     crypto_hash_1left
    .long     crypto_hash_2left
    .long     crypto_hash_3left
    .long     crypto_hash_4left
    .long     crypto_hash_5left
    .long     crypto_hash_6left
    .long     crypto_hash_7left

crypto_hash_1left:
    vshl.u64  d0, d0, #8
    vld1.8    d0[0], [r1]!            
    b    crypto_hash_IncompleteDone

crypto_hash_2left:
    vshl.u64  d0, d0, #16
    vld1.16    d0[0], [r1]!            
    b    crypto_hash_IncompleteDone

crypto_hash_3left:
    vshl.u64  d0, d0, #24
    vld1.16    d0[0], [r1]!            
    vld1.8    d0[2], [r1]!            
    b    crypto_hash_IncompleteDone

crypto_hash_4left:
    vshl.u64  d0, d0, #32
    vld1.32    d0[0], [r1]!            
    b    crypto_hash_IncompleteDone

crypto_hash_5left:
    vshl.u64  d0, d0, #40
    vld1.32    d0[0], [r1]!            
    vld1.8    d0[4], [r1]!            
    b    crypto_hash_IncompleteDone

crypto_hash_6left:
    vshl.u64  d0, d0, #48
    vld1.32    d0[0], [r1]!            
    vld1.16    d0[2], [r1]!            
    b    crypto_hash_IncompleteDone

crypto_hash_7left:
    vshl.u64  d0, d0, #56
    vld1.32    d0[0], [r1]!            
    vld1.16    d0[2], [r1]!            
    vld1.8    d0[6], [r1]!            

crypto_hash_IncompleteDone:
      adr  r3, crypto_hash_xorlastLaneTable
    ldr    pc, [r3, r2, LSL #2]

crypto_hash_xorlastLaneTable:
    .long     crypto_hash_xorLane1
    .long     crypto_hash_xorLane2
    .long     crypto_hash_xorLane3
    .long     crypto_hash_xorLane4
    .long     crypto_hash_xorLane5
    .long     crypto_hash_xorLane6
    .long     crypto_hash_xorLane7
    .long     crypto_hash_xorLane8
    .long     crypto_hash_xorLane9
    .long     crypto_hash_xorLane10
    .long     crypto_hash_xorLane11
    .long     crypto_hash_xorLane12
    .long     crypto_hash_xorLane13
    .long     crypto_hash_xorLane14
    .long     crypto_hash_xorLane15
    .long     crypto_hash_xorLane16
    
crypto_hash_xorLane1:
    veor.64  d7, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane2:
    veor.64  d12, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane3:
    veor.64  d17, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane4:
    veor.64  d22, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane5:
    veor.64  d27, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane6:
    veor.64  d8, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane7:
    veor.64  d13, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane8:
    veor.64  d18, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane9:
    veor.64  d23, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane10:
    veor.64  d28, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane11:
    veor.64  d9, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane12:
    veor.64  d14, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane13:
    veor.64  d19, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane14:
    veor.64  d24, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane15:
    veor.64  d29, d0
    b  crypto_hash_xorLastBitOfRate

crypto_hash_xorLane16:
    veor.64  d10, d0


crypto_hash_xorLastBitOfRate:
    vmov.i8    d3, #0xFF          
    vshl.u64  d3, d3, #63
    veor.64    d10, d10, d3
    
    vstm  sp, { d7-d10 }  @put 4 lanes back on stack (last one not modified)
    
    veor.64  q4, q5
    veor.64  d5, d8, d9
    veor.64  d5, d5, d7

    bl    KeccakF_armv7a_neon_asm

    pld      [r5]  @//preload out data for write

    vpop    { d0-d1 }
    vst1.64  d0, [r5]!
    vst1.64  d12, [r5]!
    vst1.64  d17, [r5]!
    vst1.64  d22, [r5]!
    vst1.64  d27, [r5]!

    vpop    { d2-d3 }
    vst1.64  d1, [r5]!
    vst1.64  d13, [r5]!
    vst1.64  d18, [r5]!
    vst1.64  d23, [r5]!
    vst1.64  d28, [r5]!

    vst1.64  d2, [r5]!
    vst1.64  d14, [r5]!
    vst1.64  d19, [r5]!
    vst1.64  d24, [r5]!
    vst1.64  d29, [r5]!

    adds  sp, sp, #8      @no need of last stacked lane in output
    vst1.64  d3, [r5]!

    vpop  {q4-q7}
    movs  r0, #0
    pop    {r4-r6,pc}

  @
  .align 8

