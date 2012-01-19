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
.equ cKeccakR_SizeInBytes , 1088/8
.equ crypto_hash_BYTES , 256/8


@//  --- offsets in state
.equ Aba0, 0*4
.equ Aba1, 1*4
.equ Abe0, 2*4
.equ Abe1, 3*4
.equ Abi0, 4*4
.equ Abi1, 5*4
.equ Abo0, 6*4
.equ Abo1, 7*4
.equ Abu0, 8*4
.equ Abu1, 9*4
.equ Aga0, 10*4
.equ Aga1, 11*4
.equ Age0, 12*4
.equ Age1, 13*4
.equ Agi0, 14*4
.equ Agi1, 15*4
.equ Ago0, 16*4
.equ Ago1, 17*4
.equ Agu0, 18*4
.equ Agu1, 19*4
.equ Aka0, 20*4
.equ Aka1, 21*4
.equ Ake0, 22*4
.equ Ake1, 23*4
.equ Aki0, 24*4
.equ Aki1, 25*4
.equ Ako0, 26*4
.equ Ako1, 27*4
.equ Aku0, 28*4
.equ Aku1, 29*4
.equ Ama0, 30*4
.equ Ama1, 31*4
.equ Ame0, 32*4
.equ Ame1, 33*4
.equ Ami0, 34*4
.equ Ami1, 35*4
.equ Amo0, 36*4
.equ Amo1, 37*4
.equ Amu0, 38*4
.equ Amu1, 39*4
.equ Asa0, 40*4
.equ Asa1, 41*4
.equ Ase0, 42*4
.equ Ase1, 43*4
.equ Asi0, 44*4
.equ Asi1, 45*4
.equ Aso0, 46*4
.equ Aso1, 47*4
.equ Asu0, 48*4
.equ Asu1, 49*4

@//  --- offsets on stack
.equ mDa0, 50*4
.equ mDa1, 51*4
.equ mDo0, 52*4
.equ mDo1, 53*4
.equ mDi0, 54*4
.equ mRC  , 55*4
.equ mRet, 56*4
.equ mIn  , 57*4
.equ mOut, 58*4
.equ mLen, 59*4

@// --- macros

    @// Credit: Henry S. Warren, Hacker's Delight, Addison-Wesley, 2002
.macro    interleaveLane  x0,x1,s0,s1,t,m55,m33,m0F,mFF,tt

    and    \t,\x0,\m55
    and    \tt,\x1,\m55
    orr    \t,\t,\t, LSR #1
    orr    \tt,\tt,\tt, LSR #1
    and    \t,\t,\m33
    and    \tt,\tt,\m33
    orr    \t,\t,\t, LSR #2
    orr    \tt,\tt,\tt, LSR #2
    and    \t,\t,\m0F
    and    \tt,\tt,\m0F
    orr    \t,\t,\t, LSR #4
    orr    \tt,\tt,\tt, LSR #4
    and    \t,\t,\mFF
    and    \tt,\tt,\mFF
    bfi    \t,\t,#8, #8
    orr    \tt,\tt,\tt, LSR #8
    eor    \s0,\s0,\t, LSR #8

    and    \t,\x0,\m55, LSL #1
    eor    \s0,\s0,\tt, LSL #16
    and    \tt,\x1,\m55, LSL #1
    orr    \t,\t,\t, LSL #1
    orr    \tt,\tt,\tt, LSL #1
    and    \t,\t,\m33, LSL #2
    and    \tt,\tt,\m33, LSL #2
    orr    \t,\t,\t, LSL #2
    orr    \tt,\tt,\tt, LSL #2
    and    \t,\t,\m0F, LSL #4
    and    \tt,\tt,\m0F, LSL #4
    orr    \t,\t,\t, LSL #4
    orr    \tt,\tt,\tt, LSL #4
    and    \t,\t,\mFF, LSL #8
    and    \tt,\tt,\mFF, LSL #8
    orr    \t,\t,\t, LSL #8
    orr    \tt,\tt,\tt, LSL #8
    eor    \s1,\s1,\t, LSR #16
    bfc    \tt, #0, #16
    eors  \s1,\s1,\tt
    .endm

    @// Credit: Henry S. Warren, Hacker's Delight, Addison-Wesley, 2002
.macro    uninterleaveLane  x0, x1, t, mFF, mF0, m0C, m22, tt

    mov    \t, \x0
    bfi    \x0, \x1, #16, #16
    bfc    \x1, #0, #16
    orr    \x1, \x1, \t, LSR #16

    eor    \t, \x0, \x0, LSR #8
    eor    \tt, \x1, \x1, LSR #8
    and    \t, \mFF
    and    \tt, \mFF
    eor    \x0, \x0, \t
    eor    \x1, \x1, \tt
    eor    \x0, \x0, \t, LSL #8
    eor    \x1, \x1, \tt, LSL #8

    eor    \t, \x0, \x0, LSR #4
    eor    \tt, \x1, \x1, LSR #4
    and    \t, \mF0
    and    \tt, \mF0
    eor    \x0, \x0, \t
    eor    \x1, \x1, \tt
    eor    \x0, \x0, \t, LSL #4
    eor    \x1, \x1, \tt, LSL #4

    eor    \t, \x0, \x0, LSR #2
    eor    \tt, \x1, \x1, LSR #2
    and    \t, \m0C
    and    \tt, \m0C
    eor    \x0, \x0, \t
    eor    \x1, \x1, \tt
    eor    \x0, \x0, \t, LSL #2
    eor    \x1, \x1, \tt, LSL #2

    eor    \t, \x0, \x0, LSR #1
    eor    \tt, \x1, \x1, LSR #1
    and    \t, \m22
    and    \tt, \m22
    eor    \x0, \x0, \t
    eor    \x1, \x1, \tt
    eor    \x0, \x0, \t, LSL #1
    eor    \x1, \x1, \tt, LSL #1
    .endm

.macro    xor55    result1,b1,g1,k1,m1,s1,result2,b2,g2,k2,m2,s2

    ldr      \result1, [sp, #\b1]
    ldr      \result2, [sp, #\b2]
    ldr      r1, [sp, #\g1]
    ldr      r2, [sp, #\g2]
    eor      \result1, \result1, r1        
    ldr      r1, [sp, #\k1]
    eor      \result2, \result2, r2
    ldr      r2, [sp, #\k2]
    eor      \result1, \result1, r1        
    ldr      r1, [sp, #\m1]
    eor      \result2, \result2, r2
    ldr      r2, [sp, #\m2]
    eor      \result1, \result1, r1        
    ldr      r1, [sp, #\s1]
    eor      \result2, \result2, r2
    ldr      r2, [sp, #\s2]
    eor      \result1, \result1, r1        
    eor      \result2, \result2, r2
    .endm


.macro    KeccakThetaRhoPiChiIota aA1, aDax, aA2, aDex, rot2, aA3, aDix, rot3, aA4, aDox, rot4, aA5, aDux, rot5, offset, last
    ldr    r3, [sp, #\aA1]
    ldr    r4, [sp, #\aA2]
    eor    r3, r3, \aDax
    ldr    r5, [sp, #\aA3]
    eor    r4, r4, \aDex
    ldr    r6, [sp, #\aA4]
    eor    r5, r5, \aDix
    ldr    r7, [sp, #\aA5]
    ror    r4, #32-\rot2
    eor    r6, r6, \aDox
    ror    r5, #32-\rot3
    eor    r7, r7, \aDux
    ror    r6, #32-\rot4
    ror    r7, #32-\rot5

    bic      r1, r6, r5
    bic      r2, r7, r6
    eor      r1, r1, r4
    eor      r2, r2, r5
    str      r1, [sp, #\aA2]

    bic      r1, r3, r7
    str      r2, [sp, #\aA3]
    bic      r2, r4, r3
    eor      r1, r1, r6
    eor      r2, r2, r7
    str      r1, [sp, #\aA4]
    ldr      r1, [sp, #mRC]
    bic      r5, r5, r4
    ldr      r4, [r1, #\offset]
    eor      r3, r3, r5
    str      r2, [sp, #\aA5]
    .if  \last == 1
    ldr      r2, [r1, #32]!
    .endif
    eor      r3, r3, r4
    .if  \last == 1
    str      r1, [sp, #mRC]
    cmp      r2, #0xFFFFFFFF
    .endif
    str      r3, [sp, #\aA1]
    .endm

.macro    KeccakThetaRhoPiChi aB1, aA1, aDax, rot1, aB2, aA2, aDex, rot2, aB3, aA3, aDix, rot3, aB4, aA4, aDox, rot4, aB5, aA5, aDux, rot5
    ldr    \aB1, [sp, #\aA1]
    ldr    \aB2, [sp, #\aA2]
    eor    \aB1, \aB1, \aDax
    ldr    \aB3, [sp, #\aA3]
    eor    \aB2, \aB2, \aDex
    ldr    \aB4, [sp, #\aA4]
    ror    \aB1, #32-\rot1
    eor    \aB3, \aB3, \aDix
    .if  \rot2 > 0
    ror    \aB2, #32-\rot2
    .endif
    ldr    \aB5, [sp, #\aA5]
    ror    \aB3, #32-\rot3
    eor    \aB4, \aB4, \aDox
    eor    \aB5, \aB5, \aDux
    ror    \aB4, #32-\rot4
    ror    \aB5, #32-\rot5

    bic      r1, r7, r6
    bic      r2, r3, r7
    eor      r1, r1, r5
    eor      r2, r2, r6
    bic      r6, r6, r5
    bic      r5, r5, r4
    str      r1, [sp, #\aA3]
    eor      r6, r6, r4
    str      r2, [sp, #\aA4]
    bic      r4, r4, r3
    str      r6, [sp, #\aA2]
    eor      r5, r5, r3
    eor      r4, r4, r7
    str      r5, [sp, #\aA1]
    str      r4, [sp, #\aA5]

    .endm

.macro    KeccakRound0

    xor55       r3,  Abu0, Agu0, Aku0, Amu0, Asu0,   r7, Abe1, Age1, Ake1, Ame1, Ase1
    xor55       r6,  Abu1, Agu1, Aku1, Amu1, Asu1, r12, Abe0, Age0, Ake0, Ame0, Ase0
    eor          r1, r3, r7, ROR #31
    eor         r8, r6, r12
    str          r1, [sp, #mDa0]

    xor55       r5,  Abi0, Agi0, Aki0, Ami0, Asi0,   r4,  Abi1, Agi1, Aki1, Ami1, Asi1
    str          r8, [sp, #mDa1]
    eor          r0, r5, r6, ROR #31
    eor         r11, r4, r3
    str          r0, [sp, #mDo0]

    xor55       r3,  Aba0, Aga0, Aka0, Ama0, Asa0,   r6,  Aba1, Aga1, Aka1, Ama1, Asa1
    str          r11, [sp, #mDo1]
    eor          r10, r3, r4, ROR #31
    eor         r11, r6, r5

    xor55       r4,  Abo1, Ago1, Ako1, Amo1, Aso1,   r5,  Abo0, Ago0, Ako0, Amo0, Aso0
    eor          r12, r12, r4, ROR #31
    eor         r9, r7, r5
    str          r12, [sp, #mDi0]

    eor          r12, r5, r6, ROR #31
    eor         lr, r4, r3

    KeccakThetaRhoPiChi r5, Aka1, r8,  2, r6, Ame1, r11, 23, r7, Asi1, r9, 31, r3, Abo0, r0, 14, r4, Agu0, r12, 10
    KeccakThetaRhoPiChi r7, Asa1, r8,  9, r3, Abe0, r10,  0, r4, Agi1, r9,  3, r5, Ako0, r0, 12, r6, Amu1, lr,  4
    ldr      r8, [sp, #mDa0]
    KeccakThetaRhoPiChi r4, Aga0, r8, 18, r5, Ake0, r10,  5, r6, Ami1, r9,  8, r7, Aso0, r0, 28, r3, Abu1, lr, 14
    KeccakThetaRhoPiChi r6, Ama0, r8, 20, r7, Ase1, r11,  1, r3, Abi1, r9, 31, r4, Ago0, r0, 27, r5, Aku0, r12, 19
    ldr      r0, [sp, #mDo1]
    KeccakThetaRhoPiChiIota Aba0, r8,         Age0, r10, 22,     Aki1, r9, 22,     Amo1, r0, 11,     Asu0, r12,  7, 0, 0

    ldr      r9, [sp, #mDi0]
    KeccakThetaRhoPiChi r5, Aka0, r8,  1, r6, Ame0, r10, 22, r7, Asi0, r9, 30, r3, Abo1, r0, 14, r4, Agu1, lr, 10
    KeccakThetaRhoPiChi r7, Asa0, r8,  9, r3, Abe1, r11,  1, r4, Agi0, r9,  3, r5, Ako1, r0, 13, r6, Amu0, r12,  4
    ldr      r8, [sp, #mDa1]
    KeccakThetaRhoPiChi r4, Aga1, r8, 18, r5, Ake1, r11,  5, r6, Ami0, r9,  7, r7, Aso1, r0, 28, r3, Abu0, r12, 13
    KeccakThetaRhoPiChi r6, Ama1, r8, 21, r7, Ase0, r10,  1, r3, Abi0, r9, 31, r4, Ago1, r0, 28, r5, Aku1, lr, 20
    ldr      r0, [sp, #mDo0]
    KeccakThetaRhoPiChiIota Aba1, r8,         Age1, r11, 22,     Aki0, r9, 21,     Amo0, r0, 10,     Asu1, lr,  7, 4, 0
    .endm

.macro    KeccakRound1

    xor55       r3,  Asu0, Agu0, Amu0, Abu1, Aku1,   r7, Age1, Ame0, Abe0, Ake1, Ase1
    xor55       r6,  Asu1, Agu1, Amu1, Abu0, Aku0, r12, Age0, Ame1, Abe1, Ake0, Ase0
    eor          r1, r3, r7, ROR #31
    eor         r8, r6, r12
    str          r1, [sp, #mDa0]

    xor55       r5,  Aki1, Asi1, Agi0, Ami1, Abi0,   r4,  Aki0, Asi0, Agi1, Ami0, Abi1
    str          r8, [sp, #mDa1]
    eor          r0, r5, r6, ROR #31
    eor         r11, r4, r3
    str          r0, [sp, #mDo0]

    xor55       r3,  Aba0, Aka1, Asa0, Aga0, Ama1,   r6,  Aba1, Aka0, Asa1, Aga1, Ama0
    str          r11, [sp, #mDo1]
    eor          r10, r3, r4, ROR #31
    eor         r11, r6, r5

    xor55       r4,  Amo0, Abo1, Ako0, Aso1, Ago0,   r5,  Amo1, Abo0, Ako1, Aso0, Ago1
    eor          r12, r12, r4, ROR #31
    eor         r9, r7, r5
    str          r12, [sp, #mDi0]

    eor          r12, r5, r6, ROR #31
    eor         lr, r4, r3

    KeccakThetaRhoPiChi r5, Asa1, r8,  2, r6, Ake1, r11, 23, r7, Abi1, r9, 31, r3, Amo1, r0, 14, r4, Agu0, r12, 10
    KeccakThetaRhoPiChi r7, Ama0, r8,  9, r3, Age0, r10,  0, r4, Asi0, r9,  3, r5, Ako1, r0, 12, r6, Abu0, lr,  4
    ldr      r8, [sp, #mDa0]
    KeccakThetaRhoPiChi r4, Aka1, r8, 18, r5, Abe1, r10,  5, r6, Ami0, r9,  8, r7, Ago1, r0, 28, r3, Asu1, lr, 14
    KeccakThetaRhoPiChi r6, Aga0, r8, 20, r7, Ase1, r11,  1, r3, Aki0, r9, 31, r4, Abo0, r0, 27, r5, Amu0, r12, 19
    ldr      r0, [sp, #mDo1]
    KeccakThetaRhoPiChiIota Aba0, r8,         Ame1, r10, 22,     Agi1, r9, 22,     Aso1, r0, 11,     Aku1, r12,  7, 8, 0

    ldr      r9, [sp, #mDi0]
    KeccakThetaRhoPiChi r5, Asa0, r8,  1, r6, Ake0, r10, 22, r7, Abi0, r9, 30, r3, Amo0, r0, 14, r4, Agu1, lr, 10
    KeccakThetaRhoPiChi r7, Ama1, r8,  9, r3, Age1, r11,  1, r4, Asi1, r9,  3, r5, Ako0, r0, 13, r6, Abu1, r12,  4
    ldr      r8, [sp, #mDa1]
    KeccakThetaRhoPiChi r4, Aka0, r8, 18, r5, Abe0, r11,  5, r6, Ami1, r9,  7, r7, Ago0, r0, 28, r3, Asu0, r12, 13
    KeccakThetaRhoPiChi r6, Aga1, r8, 21, r7, Ase0, r10,  1, r3, Aki1, r9, 31, r4, Abo1, r0, 28, r5, Amu1, lr, 20
    ldr      r0, [sp, #mDo0]
    KeccakThetaRhoPiChiIota Aba1, r8,         Ame0, r11, 22,     Agi0, r9, 21,     Aso0, r0, 10,     Aku0, lr,  7, 12, 0
    .endm

.macro    KeccakRound2

    xor55       r3, Aku1, Agu0, Abu1, Asu1, Amu1,    r7, Ame0, Ake0, Age0, Abe0, Ase1
    xor55       r6,  Aku0, Agu1, Abu0, Asu0, Amu0, r12, Ame1, Ake1, Age1, Abe1, Ase0
    eor          r1, r3, r7, ROR #31
    eor         r8, r6, r12
    str          r1, [sp, #mDa0]

    xor55       r5,  Agi1, Abi1, Asi1, Ami0, Aki1,   r4,  Agi0, Abi0, Asi0, Ami1, Aki0
    str          r8, [sp, #mDa1]
    eor         r0, r5, r6, ROR #31
    eor         r11, r4, r3
    str          r0, [sp, #mDo0]

    xor55       r3,  Aba0, Asa1, Ama1, Aka1, Aga1,   r6,  Aba1, Asa0, Ama0, Aka0, Aga0
    str          r11, [sp, #mDo1]
    eor         r10, r3, r4, ROR #31
    eor         r11, r6, r5

    xor55       r4,  Aso0, Amo0, Ako1, Ago0, Abo0,   r5,  Aso1, Amo1, Ako0, Ago1, Abo1
    eor         r12, r12, r4, ROR #31
    eor         r9, r7, r5
    str          r12, [sp, #mDi0]

    eor         r12, r5, r6, ROR #31
    eor         lr, r4, r3

    KeccakThetaRhoPiChi r5, Ama0, r8,  2, r6, Abe0, r11, 23, r7, Aki0, r9, 31, r3, Aso1, r0, 14, r4, Agu0, r12, 10
    KeccakThetaRhoPiChi r7, Aga0, r8,  9, r3, Ame1, r10,  0, r4, Abi0, r9,  3, r5, Ako0, r0, 12, r6, Asu0, lr,  4
    ldr      r8, [sp, #mDa0]
    KeccakThetaRhoPiChi r4, Asa1, r8, 18, r5, Age1, r10,  5, r6, Ami1, r9,  8, r7, Abo1, r0, 28, r3, Aku0, lr, 14
    KeccakThetaRhoPiChi r6, Aka1, r8, 20, r7, Ase1, r11,  1, r3, Agi0, r9, 31, r4, Amo1, r0, 27, r5, Abu1, r12, 19
    ldr      r0, [sp, #mDo1]
    KeccakThetaRhoPiChiIota Aba0, r8,         Ake1, r10, 22,     Asi0, r9, 22,     Ago0, r0, 11,     Amu1, r12,  7, 16, 0

    ldr      r9, [sp, #mDi0]
    KeccakThetaRhoPiChi r5, Ama1, r8,  1, r6, Abe1, r10, 22, r7, Aki1, r9, 30, r3, Aso0, r0, 14, r4, Agu1, lr, 10
    KeccakThetaRhoPiChi r7, Aga1, r8,  9, r3, Ame0, r11,  1, r4, Abi1, r9,  3, r5, Ako1, r0, 13, r6, Asu1, r12,  4
    ldr      r8, [sp, #mDa1]
    KeccakThetaRhoPiChi r4, Asa0, r8, 18, r5, Age0, r11,  5, r6, Ami0, r9,  7, r7, Abo0, r0, 28, r3, Aku1, r12, 13
    KeccakThetaRhoPiChi r6, Aka0, r8, 21, r7, Ase0, r10,  1, r3, Agi1, r9, 31, r4, Amo0, r0, 28, r5, Abu0, lr, 20
    ldr      r0, [sp, #mDo0]
    KeccakThetaRhoPiChiIota Aba1, r8,         Ake0, r11, 22,     Asi1, r9, 21,     Ago1, r0, 10,     Amu0, lr,  7, 20, 0
    .endm

.macro    KeccakRound3

    xor55       r3,  Amu1, Agu0, Asu1, Aku0, Abu0,   r7, Ake0, Abe1, Ame1, Age0, Ase1
    xor55       r6,  Amu0, Agu1, Asu0, Aku1, Abu1, r12, Ake1, Abe0, Ame0, Age1, Ase0
    eor          r1, r3, r7, ROR #31
    eor         r8, r6, r12
    str          r1, [sp, #mDa0]

    xor55       r5,  Asi0, Aki0, Abi1, Ami1, Agi1,   r4,  Asi1, Aki1, Abi0, Ami0, Agi0
    str          r8, [sp, #mDa1]
    eor         r0, r5, r6, ROR #31
    eor         r11, r4, r3
    str          r0, [sp, #mDo0]

    xor55       r3,  Aba0, Ama0, Aga1, Asa1, Aka0,   r6,  Aba1, Ama1, Aga0, Asa0, Aka1
    str          r11, [sp, #mDo1]
    eor         r10, r3, r4, ROR #31
    eor         r11, r6, r5

    xor55       r4,  Ago1, Aso0, Ako0, Abo0, Amo1,   r5,  Ago0, Aso1, Ako1, Abo1, Amo0
    eor         r12, r12, r4, ROR #31
    eor         r9, r7, r5
    str          r12, [sp, #mDi0]

    eor         r12, r5, r6, ROR #31
    eor         lr, r4, r3

    KeccakThetaRhoPiChi r5, Aga0, r8,  2, r6, Age0, r11, 23, r7, Agi0, r9, 31, r3, Ago0, r0, 14, r4, Agu0, r12, 10
    KeccakThetaRhoPiChi r7, Aka1, r8,  9, r3, Ake1, r10,  0, r4, Aki1, r9,  3, r5, Ako1, r0, 12, r6, Aku1, lr,  4
    ldr      r8, [sp, #mDa0]
    KeccakThetaRhoPiChi r4, Ama0, r8, 18, r5, Ame0, r10,  5, r6, Ami0, r9,  8, r7, Amo0, r0, 28, r3, Amu0, lr, 14
    KeccakThetaRhoPiChi r6, Asa1, r8, 20, r7, Ase1, r11,  1, r3, Asi1, r9, 31, r4, Aso1, r0, 27, r5, Asu1, r12, 19
    ldr      r0, [sp, #mDo1]
    KeccakThetaRhoPiChiIota Aba0, r8,         Abe0, r10, 22,     Abi0, r9, 22,     Abo0, r0, 11,     Abu0, r12,  7, 24, 0

    ldr      r9, [sp, #mDi0]
    KeccakThetaRhoPiChi r5, Aga1, r8,  1, r6, Age1, r10, 22, r7, Agi1, r9, 30, r3, Ago1, r0, 14, r4, Agu1, lr, 10
    KeccakThetaRhoPiChi r7, Aka0, r8,  9, r3, Ake0, r11,  1, r4, Aki0, r9,  3, r5, Ako0, r0, 13, r6, Aku0, r12,  4
    ldr      r8, [sp, #mDa1]
    KeccakThetaRhoPiChi r4, Ama1, r8, 18, r5, Ame1, r11,  5, r6, Ami1, r9,  7, r7, Amo1, r0, 28, r3, Amu1, r12, 13
    KeccakThetaRhoPiChi r6, Asa0, r8, 21, r7, Ase0, r10,  1, r3, Asi0, r9, 31, r4, Aso0, r0, 28, r5, Asu0, lr, 20
    ldr      r0, [sp, #mDo0]
    KeccakThetaRhoPiChiIota Aba1, r8,         Abe1, r11, 22,     Abi1, r9, 21,     Abo1, r0, 10,     Abu1, lr,  7, 28, 1
    .endm

@// --- code and constants

@//int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
.global   crypto_hash_keccakc512_inplace32bi_armv7a           @
crypto_hash_keccakc512_inplace32bi_armv7a:                    @

    push  {r4-r12,lr}
    sub    sp, sp, #10*4

    @//allocate and clear state
    mov    r3, #0
    mov    r4, #0
    mov    r5, #0
    mov    r6, #0
    mov    r7, #0
    push  {r3-r7}
    push  {r3-r7}
    push  {r3-r7}
    push  {r3-r7}
    push  {r3-r7}
    push  {r3-r7}
    push  {r3-r7}
    push  {r3-r7}
    push  {r3-r7}
    push  {r3-r7}

    str    r0, [sp, #mOut]    @//  save out pointer

    @//  Complete rate loop  
    subs  r4, r2, #cKeccakR_SizeInBytes
      adr  r3, KeccakF1600RoundConstantsWithTerminator
    str    r1, [sp, #mIn]    @//  save in pointer
      adr  r0, crypto_hash_LoopRet
    str    r3, [sp, #mRC]    @// save Round Constants pointer
    str    r0, [sp, #mRet]    @// save return address
    bcc    crypto_hash_LoopEnd

    str    r4, [sp, #mLen]    @// save inlen (ignore upper 32-bit word, since CPU address space is only 32-bit wide)
    mov    r4, #cKeccakR_SizeInBytes/cKeccakLaneSizeInBytes
    b    KeccakF_FullRate
crypto_hash_LoopRet:
    ldr    r2, [sp, #mLen]
      adr  r0, KeccakF1600RoundConstantsWithTerminator
    subs  r4, r2, #cKeccakR_SizeInBytes
    str    r0, [sp, #mRC]    @// save Round Constants pointer
    str    r4, [sp, #mLen]
    mov    r4, #cKeccakR_SizeInBytes/cKeccakLaneSizeInBytes
    bcs    KeccakF_FullRate
crypto_hash_LoopEnd:

    @// Last incomplete lane and padding
    mov    r4, r2, LSR #3    @// r4 nbrFullLanes = len >> 3@
    and    r6, r2, #7      @// r6 len &= 7@  length last incomplete lane

    mov    r0, #1          @//  XOR first padding bit into state: state[nbrFullLanes << 1] ^= 1 << (len * 4)@
    mov    r1, r6, LSL #2
    lsl    r0, r0, r1
    ldr    r1, [sp, r4, LSL #3]
    eor    r1, r1, r0
    str    r1, [sp, r4, LSL #3]

    @// XOR last incomplete lane if needed
      adr  r1, crypto_hash_leftBranchTab
    ldr    r3, [sp, #mIn]    @//  get in pointer
    add    r3, r3, r4, LSL #3  @// p = in + nbrFullLanes << 3@
    ldr    pc, [r1, r6, LSL #2]
crypto_hash_leftBranchTab:
    .long     crypto_hash_IncompleteDone @//0 left
    .long     crypto_hash_1left
    .long     crypto_hash_2left
    .long     crypto_hash_3left
    .long     crypto_hash_4left
    .long     crypto_hash_5left
    .long     crypto_hash_6left
    .long     crypto_hash_7left

crypto_hash_1left:
    ldrb  r0, [r3]
    mov    r1, #0         @// x1 = 0
    b    crypto_hash_Interleave
crypto_hash_2left:
    ldrh  r0, [r3]
    mov    r1, #0         @// x1 = 0
    b    crypto_hash_Interleave
crypto_hash_3left:
    ldrh  r0, [r3]
    ldrb  r1, [r3, #2]
    orr    r0, r0, r1, LSL #16
    mov    r1, #0         @// x1 = 0
    b    crypto_hash_Interleave
crypto_hash_4left:
    ldr    r0, [r3]
    mov    r1, #0         @// x1 = 0
    b    crypto_hash_Interleave
crypto_hash_5left:
    ldr    r0, [r3]
    ldrb  r1, [r3, #4]
    b    crypto_hash_Interleave
crypto_hash_6left:
    ldr    r0, [r3]
    ldrh  r1, [r3, #4]
    b    crypto_hash_Interleave
crypto_hash_7left:
    ldrh  r1, [r3, #4]
    ldrb  r0, [r3, #6]
    orr    r1, r1, r0, LSL #16
    ldr    r0, [r3]

crypto_hash_Interleave:
    add    r8, sp, r4, LSL #3
    movw  r9, #0x5555
    movw  r10, #0x3333
    movw  r11, #0x0F0F
    movw  r12, #0x00FF
    ldrd  r2, r3, [r8]
    movt  r9, #0x5555
    movt  r10, #0x3333
    movt  r11, #0x0F0F
    movt  r12, #0x00FF
    interleaveLane  r0, r1, r2, r3, r6, r9, r10, r11, r12, lr
    strd  r2, r3, [r8]
crypto_hash_IncompleteDone:
    ldr    r0, [sp, #cKeccakR_SizeInBytes-4]  @//  XOR second padding bit into state
    eor    r0, #0x80000000
    str    r0, [sp, #cKeccakR_SizeInBytes-4]

      adr  r0, crypto_hash_SqueezeRet
    str    r0, [sp, #mRet]    @// save return address
    b    KeccakF
crypto_hash_SqueezeRet:

    ldr    r7, [sp, #mOut]    @// save return address
    mov    r4, #crypto_hash_BYTES/cKeccakLaneSizeInBytes  @len  = crypto_hash_BYTES / cKeccakLaneSizeInBytes@
    mov    r3, sp
    movw  r9,  #0xFF00
    movw  r10, #0x00F0
    movw  r11, #0x0C0C
    movw  r12, #0x2222
    movt  r10, #0x00F0
    movt  r11, #0x0C0C
    movt  r12, #0x2222
crypto_hash_OutputLoop:
    ldrd  r0, r1, [r3], #8
    uninterleaveLane  r0, r1, r2, r9, r10, r11, r12, lr
    str    r0, [r7], #4
    subs  r4, r4, #1
    str    r1, [r7], #4
    bne    crypto_hash_OutputLoop

    add    sp, sp, #5*5*2*4+10*4
    mov    r0, #0
    pop    {r4-r12,pc}

  .align 8
    .ltorg
KeccakF1600RoundConstantsWithTerminator:
    @//    0      1
    .long     0x00000001,  0x00000000
    .long     0x00000000,  0x00000089
    .long     0x00000000,  0x8000008b
    .long     0x00000000,  0x80008080

    .long     0x00000001,  0x0000008b
    .long     0x00000001,  0x00008000
    .long     0x00000001,  0x80008088
    .long     0x00000001,  0x80000082

    .long     0x00000000,  0x0000000b
    .long     0x00000000,  0x0000000a
    .long     0x00000001,  0x00008082
    .long     0x00000000,  0x00008003

    .long     0x00000001,  0x0000808b
    .long     0x00000001,  0x8000000b
    .long     0x00000001,  0x8000008a
    .long     0x00000001,  0x80000081

    .long     0x00000000,  0x80000081
    .long     0x00000000,  0x80000008
    .long     0x00000000,  0x00000083
    .long     0x00000000,  0x80008003

    .long     0x00000001,  0x80008088
    .long     0x00000000,  0x80000088
    .long     0x00000001,  0x00008000
    .long     0x00000000,  0x80008082

    .long     0xFFFFFFFF  @//terminator

  .align 8

KeccakF:
    cmp    r4, #0
    beq    roundLoop
KeccakF_FullRate:
    mov    r8, sp
    ldr    r1, [sp, #mIn]
    movw  r9,  #0x5555
    movw  r10, #0x3333
    movw  r11, #0x0F0F
    movw  r12, #0x00FF
    movt  r9,  #0x5555
    movt  r10, #0x3333
    movt  r11, #0x0F0F
    movt  r12, #0x00FF
interleaveLoop:
    ldr    r2, [r1], #4
    ldr    r5, [r1], #4
    ldrd    r6, r7, [r8]
    interleaveLane  r2, r5, r6, r7, r3, r9, r10, r11, r12, lr
    subs  r4, r4, #1
    strd  r6,r7,[r8], #8
    bne    interleaveLoop
    str    r1, [sp, #mIn]

roundLoop:
    KeccakRound0
    KeccakRound1
    KeccakRound2
    KeccakRound3
    bne    roundLoop
    ldr    pc, [sp, #mRet]

  @
  .align 8

