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

@//  --- offsets in state
.equ Aba, 0*8
.equ Aga, 1*8
.equ Aka, 2*8
.equ Ama, 3*8
.equ Asa, 4*8

@// --- macros

.macro    KeccakThetaRhoPiChiIota argA1, argA2, argA3, argA4, argA5

    @Prepare Theta
    @Ca = Aba^Aga^Aka^Ama^Asa@
    @Ce = Abe^Age^Ake^Ame^Ase@
    @Ci = Abi^Agi^Aki^Ami^Asi@
    @Co = Abo^Ago^Ako^Amo^Aso@
    @Cu = Abu^Agu^Aku^Amu^Asu@
    @De = Ca^ROL64(Ci, 1)@
    @Di = Ce^ROL64(Co, 1)@
    @Do = Ci^ROL64(Cu, 1)@
    @Du = Co^ROL64(Ca, 1)@
    @Da = Cu^ROL64(Ce, 1)@

    veor.64 q4, q6, q7
    veor.64 q5, q9, q10
    veor.64 d8,  d8,   d9
    veor.64 d10,  d10,   d11
    veor.64 d1,  d8,   d16
    veor.64 d2,  d10,   d17

    veor.64 q4, q11, q12
    veor.64 q5, q14, q15
    veor.64 d8,  d8,   d9
    veor.64 d10,  d10,   d11
    veor.64 d3,  d8,   d26

    vadd.u64 q4, q1, q1
    veor.64 d4,  d10,   d27
    vmov.64  d0, d5
    vsri.64 q4, q1, #63

    vadd.u64 q5, q2, q2
    veor.64 q4, q4, q0
    vsri.64 q5, q2, #63
    vadd.u64 d7, d1, d1
    veor.64 \argA2, \argA2, d8
    veor.64 q5, q5, q1

    vsri.64 d7, d1, #63
    vshl.u64 d1, \argA2, #44
    veor.64 \argA3, \argA3, d9
    veor.64 d7, d7, d4

    @Ba = argA1^Da@
    @Be = ROL64((argA2^De), 44)@
    @Bi = ROL64((argA3^Di), 43)@
    @Bo = ROL64((argA4^Do), 21)@
    @Bu = ROL64((argA5^Du), 14)@
    @argA2 =   Be ^((~Bi)& Bo )@
    @argA3 =   Bi ^((~Bo)& Bu )@
    @argA4 =   Bo ^((~Bu)& Ba )@
    @argA5 =   Bu ^((~Ba)& Be )@ 
    @argA1 =   Ba ^((~Be)& Bi )@ argA1 ^= KeccakF1600RoundConstants[i+round]@
    vsri.64 d1, \argA2, #64-44
    vshl.u64 d2, \argA3, #43
    vldr.64 d0, [sp, #\argA1]
    veor.64 \argA4, \argA4, d10
    vsri.64 d2, \argA3, #64-43
    vshl.u64 d3, \argA4, #21
    veor.64 \argA5, \argA5, d11
    veor.64 d0, d0, d7
    vsri.64 d3, \argA4, #64-21
    vbic.64   d5, d2, d1
    vshl.u64 d4, \argA5, #14
    vbic.64   \argA2, d3, d2
    vld1.64   d6, [r3]!
    veor.64   d5, d0
    vsri.64 d4, \argA5, #64-14
    veor.64   d5, d6
    vbic.64   \argA5, d1, d0
    vbic.64   \argA3, d4, d3
    vbic.64   \argA4, d0, d4
    veor.64   \argA2, d1
    vstr.64   d5, [sp, #\argA1]
    veor.64   \argA3, d2    
    veor.64   \argA4, d3
    veor.64   \argA5, d4

    .endm

.macro    KeccakThetaRhoPiChi1   argA1, argA2, argA3, argA4, argA5

    @d2 = ROL64((argA1^Da), 3)@
    @d3 = ROL64((argA2^De), 45)@
    @d4 = ROL64((argA3^Di), 61)@
    @d0 = ROL64((argA4^Do), 28)@
    @d1 = ROL64((argA5^Du), 20)@
    @argA1 =   Ba ^((~Be)&  Bi )@ Ca ^= argA1@
    @argA2 =   Be ^((~Bi)&  Bo )@
    @argA3 =   Bi ^((~Bo)&  Bu )@
    @argA4 =   Bo ^((~Bu)&  Ba )@
    @argA5 =   Bu ^((~Ba)&  Be )@

    veor.64 \argA2, \argA2, d8
    veor.64 \argA3, \argA3, d9
    vshl.u64  d3, \argA2, #45
    vldr.64 d6, [sp, #\argA1]
    vshl.u64  d4, \argA3, #61
    veor.64 \argA4, \argA4, d10
    vsri.64  d3, \argA2, #64-45
    veor.64 \argA5, \argA5, d11
    vsri.64  d4, \argA3, #64-61
    vshl.u64  d0, \argA4, #28
    veor.64 d6, d6, d7
    vshl.u64  d1, \argA5, #20
    vbic.64   \argA3, d4, d3
    vsri.64  d0, \argA4, #64-28
    vbic.64   \argA4, d0, d4
    vshl.u64  d2, d6, #3
    vsri.64  d1, \argA5, #64-20
    veor.64   \argA4, d3
    vsri.64  d2, d6, #64-3
    vbic.64   \argA5, d1, d0
    vbic.64   d6, d2, d1
    vbic.64   \argA2, d3, d2
    veor.64   d6, d0
    veor.64   \argA2, d1
    vstr.64   d6, [sp, #\argA1]
    veor.64   \argA3, d2
    veor.64  d5, d6
    veor.64   \argA5, d4

    .endm

.macro    KeccakThetaRhoPiChi2 argA1, argA2, argA3, argA4, argA5

    @d4 = ROL64((argA1^Da), 18)@
    @d0 = ROL64((argA2^De), 1)@
    @d1 = ROL64((argA3^Di), 6)@
    @d2 = ROL64((argA4^Do), 25)@
    @d3 = ROL64((argA5^Du), 8)@
    @argA1 =   Ba ^((~Be)&  Bi )@ Ca ^= argA1@
    @argA2 =   Be ^((~Bi)&  Bo )@
    @argA3 =   Bi ^((~Bo)&  Bu )@
    @argA4 =   Bo ^((~Bu)&  Ba )@
    @argA5 =   Bu ^((~Ba)&  Be )@

    veor.64 \argA3, \argA3, d9
    veor.64 \argA4, \argA4, d10
    vshl.u64  d1, \argA3, #6
    vldr.64 d6, [sp, #\argA1]
    vshl.u64  d2, \argA4, #25
    veor.64 \argA5, \argA5, d11
    vsri.64  d1, \argA3, #64-6
    veor.64 \argA2, \argA2, d8
    vsri.64  d2, \argA4, #64-25
    vext.8  d3, \argA5, \argA5, #7
    veor.64 d6, d6, d7
    vbic.64  \argA3, d2, d1
    vadd.u64  d0, \argA2, \argA2
    vbic.64   \argA4, d3, d2
    vsri.64  d0, \argA2, #64-1
    vshl.u64  d4, d6, #18
    veor.64  \argA2, d1, \argA4
    veor.64  \argA3, d0
    vsri.64  d4, d6, #64-18
    vstr.64   \argA3, [sp, #\argA1]
    veor.64  d5, \argA3
    vbic.64   \argA5, d1, d0
    vbic.64   \argA3, d4, d3
    vbic.64   \argA4, d0, d4
    veor.64   \argA3, d2
    veor.64   \argA4, d3
    veor.64   \argA5, d4

    .endm

.macro    KeccakThetaRhoPiChi3 argA1, argA2, argA3, argA4, argA5

    @d1 = ROL64((argA1^Da), 36)@
    @d2 = ROL64((argA2^De), 10)@
    @d3 = ROL64((argA3^Di), 15)@
    @d4 = ROL64((argA4^Do), 56)@
    @d0 = ROL64((argA5^Du), 27)@
    @argA1 =   Ba ^((~Be)&  Bi )@ Ca ^= argA1@
    @argA2 =   Be ^((~Bi)&  Bo )@
    @argA3 =   Bi ^((~Bo)&  Bu )@
    @argA4 =   Bo ^((~Bu)&  Ba )@
    @argA5 =   Bu ^((~Ba)&  Be )@

    veor.64 \argA2, \argA2, d8
    veor.64 \argA3, \argA3, d9
    vshl.u64  d2, \argA2, #10
    vldr.64 d6, [sp, #\argA1]
    vshl.u64  d3, \argA3, #15
    veor.64 \argA4, \argA4, d10
    vsri.64  d2, \argA2, #64-10
    vsri.64  d3, \argA3, #64-15
    veor.64 \argA5, \argA5, d11
    vext.8  d4, \argA4, \argA4, #1
    vbic.64   \argA2, d3, d2
    vshl.u64  d0, \argA5, #27
    veor.64 d6, d6, d7
    vbic.64   \argA3, d4, d3
    vsri.64  d0, \argA5, #64-27
    vshl.u64  d1, d6, #36
    veor.64   \argA3, d2
    vbic.64   \argA4, d0, d4
    vsri.64  d1, d6, #64-36
    
    veor.64   \argA4, d3
    vbic.64   d6, d2, d1
    vbic.64   \argA5, d1, d0
    veor.64   d6, d0
    veor.64   \argA2, d1
    vstr.64   d6, [sp, #\argA1]
    veor.64  d5, d6
    veor.64   \argA5, d4

    .endm

.macro    KeccakThetaRhoPiChi4 argA1, argA2, argA3, argA4, argA5

    @d3 = ROL64((argA1^Da), 41)@
    @d4 = ROL64((argA2^De), 2)@
    @d0 = ROL64((argA3^Di), 62)@
    @d1 = ROL64((argA4^Do), 55)@
    @d2 = ROL64((argA5^Du), 39)@
    @argA1 =   Ba ^((~Be)&  Bi )@ Ca ^= argA1@
    @argA2 =   Be ^((~Bi)&  Bo )@
    @argA3 =   Bi ^((~Bo)&  Bu )@
    @argA4 =   Bo ^((~Bu)&  Ba )@
    @argA5 =   Bu ^((~Ba)&  Be )@

    veor.64 \argA2, \argA2, d8
    veor.64 \argA3, \argA3, d9
    vshl.u64  d4, \argA2, #2
    veor.64 \argA5, \argA5, d11
    vshl.u64  d0, \argA3, #62
    vldr.64 d6, [sp, #\argA1]
    vsri.64  d4, \argA2, #64-2
    veor.64 \argA4, \argA4, d10
    vsri.64  d0, \argA3, #64-62

    vshl.u64  d1, \argA4, #55
    veor.64 d6, d6, d7
    vshl.u64  d2, \argA5, #39
    vsri.64  d1, \argA4, #64-55
    vbic.64  \argA4, d0, d4
    vsri.64  d2, \argA5, #64-39
    vbic.64  \argA2, d1, d0
    vshl.u64  d3, d6, #41
    veor.64  \argA5, d4, \argA2
    vbic.64  \argA2, d2, d1
    vsri.64  d3, d6, #64-41
    veor.64  d6, d0, \argA2
    
    vbic.64 \argA2, d3, d2
    vbic.64 \argA3, d4, d3
    veor.64 \argA2, d1
    vstr.64 d6, [sp, #\argA1]
    veor.64 d5, d6
    veor.64 \argA3, d2
    veor.64 \argA4, d3

    .endm

@// --- constants


  .align 8
    .ltorg
KeccakF1600RoundConstantsWithTerminator:
    .quad  0x0000000000000001
    .quad  0x0000000000008082
    .quad  0x800000000000808a
    .quad  0x8000000080008000
    .quad  0x000000000000808b
    .quad  0x0000000080000001
    .quad  0x8000000080008081
    .quad  0x8000000000008009
    .quad  0x000000000000008a
    .quad  0x0000000000000088
    .quad  0x0000000080008009
    .quad  0x000000008000000a
    .quad  0x000000008000808b
    .quad  0x800000000000008b
    .quad  0x8000000000008089
    .quad  0x8000000000008003
    .quad  0x8000000000008002
    .quad  0x8000000000000080
    .quad  0x000000000000800a
    .quad  0x800000008000000a
    .quad  0x8000000080008081
    .quad  0x8000000000008080
    .quad  0x0000000080000001
    .quad  0x8000000080008008
    .quad   0xFFFFFFFFFFFFFFFF  @//terminator

  .align 8

@// --- code 

@not callable from C!
.global   KeccakF_armv7a_neon_asm
KeccakF_armv7a_neon_asm:  @

      adr  r3, KeccakF1600RoundConstantsWithTerminator
roundLoop:

    KeccakThetaRhoPiChiIota  Aba, d13, d19, d25, d31
    KeccakThetaRhoPiChi1    Aka, d15, d21, d22, d28
    KeccakThetaRhoPiChi2    Asa, d12, d18, d24, d30
    KeccakThetaRhoPiChi3    Aga, d14, d20, d26, d27
    KeccakThetaRhoPiChi4    Ama, d16, d17, d23, d29

    KeccakThetaRhoPiChiIota  Aba, d15, d18, d26, d29
    KeccakThetaRhoPiChi1    Asa, d14, d17, d25, d28
    KeccakThetaRhoPiChi2    Ama, d13, d21, d24, d27
    KeccakThetaRhoPiChi3    Aka, d12, d20, d23, d31
    KeccakThetaRhoPiChi4    Aga, d16, d19, d22, d30

    KeccakThetaRhoPiChiIota Aba, d14, d21, d23, d30
    KeccakThetaRhoPiChi1    Ama, d12, d19, d26, d28
    KeccakThetaRhoPiChi2    Aga, d15, d17, d24, d31
    KeccakThetaRhoPiChi3    Asa, d13, d20, d22, d29
    KeccakThetaRhoPiChi4    Aka, d16, d18, d25, d27

    KeccakThetaRhoPiChiIota Aba, d12, d17, d22, d27
    KeccakThetaRhoPiChi1    Aga, d13, d18, d23, d28
    KeccakThetaRhoPiChi2    Aka, d14, d19, d24, d29
    ldr    r0, [r3]
    KeccakThetaRhoPiChi3    Ama, d15, d20, d25, d30
    cmp    r0, #0xFFFFFFFF
    KeccakThetaRhoPiChi4    Asa, d16, d21, d26, d31

    bne    roundLoop
    bx    lr

  @
  .align 8

@//void KeccakF_armv7a( tKeccakLane * state )  callable from C
.global   KeccakF_armv7a_neon
KeccakF_armv7a_neon:  @

    vpush  {q4-q7}
    sub    sp,sp, #5*8

    vldr.64  d0,  [r0, #0*8]
    vldr.64  d12, [r0, #1*8]
    vldr.64  d17, [r0, #2*8]
    vldr.64  d22, [r0, #3*8]
    vldr.64  d27, [r0, #4*8]

    vldr.64  d1,  [r0, #5*8]
    vldr.64  d13, [r0, #6*8]
    vldr.64  d18, [r0, #7*8]
    vldr.64  d23, [r0, #8*8]
    vldr.64  d28, [r0, #9*8]

    vldr.64  d2,  [r0, #10*8]
    vldr.64  d14, [r0, #11*8]
    vldr.64  d19, [r0, #12*8]
    vldr.64  d24, [r0, #13*8]
    vldr.64  d29, [r0, #14*8]

    vldr.64  d3,  [r0, #15*8]
    vldr.64  d15, [r0, #16*8]
    vldr.64  d20, [r0, #17*8]
    vldr.64  d25, [r0, #18*8]
    vldr.64  d30, [r0, #19*8]

    vldr.64  d4,  [r0, #20*8]
    vldr.64  d16, [r0, #21*8]
    vldr.64  d21, [r0, #22*8]
    vldr.64  d26, [r0, #23*8]
    vldr.64  d31, [r0, #24*8]

    vstr.64  d0, [sp, #Aba]
    mov      r2, lr
    vstr.64  d1, [sp, #Aga]
    veor.64 q0, q0, q1
    vstr.64  d2, [sp, #Aka]
    veor.64 d5, d0,  d1
    vstr.64  d3, [sp, #Ama]
    mov      r1, r0
    vstr.64  d4, [sp, #Asa]
    veor.64 d5, d5,  d4

    bl      KeccakF_armv7a_neon_asm

    vpop.64  { d0- d4 }

    vstr.64  d0,  [r1, #0*8]
    vstr.64  d12, [r1, #1*8]
    vstr.64  d17, [r1, #2*8]
    vstr.64  d22, [r1, #3*8]
    vstr.64  d27, [r1, #4*8]

    vstr.64  d1,  [r1, #5*8]
    vstr.64  d13, [r1, #6*8]
    vstr.64  d18, [r1, #7*8]
    vstr.64  d23, [r1, #8*8]
    vstr.64  d28, [r1, #9*8]

    vstr.64  d2,  [r1, #10*8]
    vstr.64  d14, [r1, #11*8]
    vstr.64  d19, [r1, #12*8]
    vstr.64  d24, [r1, #13*8]
    vstr.64  d29, [r1, #14*8]

    vstr.64  d3,  [r1, #15*8]
    vstr.64  d15, [r1, #16*8]
    vstr.64  d20, [r1, #17*8]
    vstr.64  d25, [r1, #18*8]
    vstr.64  d30, [r1, #19*8]

    vstr.64  d4,  [r1, #20*8]
    vstr.64  d16, [r1, #21*8]
    vstr.64  d21, [r1, #22*8]
    vstr.64  d26, [r1, #23*8]
    vstr.64  d31, [r1, #24*8]

    vpop  {q4-q7}
    bx    r2

  @

