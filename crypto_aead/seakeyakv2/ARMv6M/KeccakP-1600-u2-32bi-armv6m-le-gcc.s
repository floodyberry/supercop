@
@ Implementation by the Keccak, Keyak and Ketje Teams, namely, Guido Bertoni,
@ Joan Daemen, Michaël Peeters, Gilles Van Assche and Ronny Van Keer, hereby
@ denoted as "the implementer".
@
@ For more information, feedback or questions, please refer to our websites:
@ http://keccak.noekeon.org/
@ http://keyak.noekeon.org/
@ http://ketje.noekeon.org/
@
@ To the extent possible under law, the implementer has waived all copyright
@ and related or neighboring rights to the source code in this file.
@ http://creativecommons.org/publicdomain/zero/1.0/
@

@ WARNING: These functions work only on little endian CPU with@ ARMv6m architecture (ARM Cortex-M0, ...).


    .thumb
    .syntax unified
.text

    @ Credit: Henry S. Warren, Hacker's Delight, Addison-Wesley, 2002
.macro  toBitInterleaving   in0,in1,out0,out1,t,tt,pMask

    mov     \out0, \in0
    ldr     \t, [\pMask, #0]
    ands    \out0, \out0, \t
    lsrs    \t, \out0, #1
    orrs    \out0, \out0, \t
    ldr     \t, [\pMask, #4]
    ands    \out0, \out0, \t
    lsrs    \t, \out0, #2
    orrs    \out0, \out0, \t
    ldr     \t, [\pMask, #8]
    ands    \out0, \out0, \t
    lsrs    \t, \out0, #4
    orrs    \out0, \out0, \t
    ldr     \t, [\pMask, #12]
    ands    \out0, \out0, \t
    lsrs    \t, \out0, #8
    orrs    \out0, \out0, \t

    mov     \out1, \in1
    ldr     \t, [\pMask, #0]
    ands    \out1, \out1, \t
    lsrs    \t, \out1, #1
    orrs    \out1, \out1, \t
    ldr     \t, [\pMask, #4]
    ands    \out1, \out1, \t
    lsrs    \t, \out1, #2
    orrs    \out1, \out1, \t
    ldr     \t, [\pMask, #8]
    ands    \out1, \out1, \t
    lsrs    \t, \out1, #4
    orrs    \out1, \out1, \t
    ldr     \t, [\pMask, #12]
    ands    \out1, \out1, \t
    lsrs    \t, \out1, #8
    orrs    \out1, \out1, \t

    lsls    \out0, \out0, #16
    lsrs    \out0, \out0, #16
    lsls    \out1, \out1, #16
    orrs    \out0, \out0, \out1

    mov     \out1, \in0
    ldr     \t, [\pMask, #16]
    ands    \out1, \out1, \t
    lsls    \t, \out1, #1
    orrs    \out1, \out1, \t
    ldr     \t, [\pMask, #20]
    ands    \out1, \out1, \t
    lsls    \t, \out1, #2
    orrs    \out1, \out1, \t
    ldr     \t, [\pMask, #24]
    ands    \out1, \out1, \t
    lsls    \t, \out1, #4
    orrs    \out1, \out1, \t
    ldr     \t, [\pMask, #28]
    ands    \out1, \out1, \t
    lsls    \t, \out1, #8
    orrs    \out1, \out1, \t

    mov     \tt, \in1
    ldr     \t, [\pMask, #16]
    ands    \tt, \tt, \t
    lsls    \t, \tt, #1
    orrs    \tt, \tt, \t
    ldr     \t, [\pMask, #20]
    ands    \tt, \tt, \t
    lsls    \t, \tt, #2
    orrs    \tt, \tt, \t
    ldr     \t, [\pMask, #24]
    ands    \tt, \tt, \t
    lsls    \t, \tt, #4
    orrs    \tt, \tt, \t
    ldr     \t, [\pMask, #28]
    ands    \tt, \tt, \t
    lsls    \t, \tt, #8
    orrs    \tt, \tt, \t

    lsrs    \out1,\out1, #16
    lsrs    \tt, \tt, #16
    lsls    \tt, \tt, #16
    orrs    \out1,\out1,\tt
    .endm

    @ Credit: Henry S. Warren, Hacker's Delight, Addison-Wesley, 2002
.macro  fromBitInterleavingStep x, t, tt, pMask, maskofs, shift

    @ t = (x ^ (x >> shift)) & mask@  x = x ^ t ^ (t << shift)@
    lsrs    \t, \x, #\shift
    eors    \t, \t, \x
    ldr     \tt, [\pMask, #\maskofs]
    ands    \t, \t, \tt
    eors    \x, \x, \t
    lsls    \t, \t, #\shift
    eors    \x, \x, \t
    .endm

.macro  fromBitInterleaving     x0, x1, t, tt, pMask
    movs    \t, \x0                 @ t = x0
    lsls    \x0, \x0, #16           @ x0 = (x0 & 0x0000FFFF) | (x1 << 16)@
    lsrs    \x0, \x0, #16
    lsls    \tt, \x1, #16
    orrs    \x0, \x0, \tt
    lsrs    \x1, \x1, #16           @   x1 = (t >> 16) | (x1 & 0xFFFF0000)@
    lsls    \x1, \x1, #16
    lsrs    \t, \t, #16
    orrs    \x1, \x1, \t
    fromBitInterleavingStep \x0, \t, \tt, \pMask, 0, 8
    fromBitInterleavingStep \x0, \t, \tt, \pMask, 4, 4
    fromBitInterleavingStep \x0, \t, \tt, \pMask, 8, 2
    fromBitInterleavingStep \x0, \t, \tt, \pMask, 12, 1
    fromBitInterleavingStep \x1, \t, \tt, \pMask, 0, 8
    fromBitInterleavingStep \x1, \t, \tt, \pMask, 4, 4
    fromBitInterleavingStep \x1, \t, \tt, \pMask, 8, 2
    fromBitInterleavingStep \x1, \t, \tt, \pMask, 12, 1
    .endm

@ --- offsets in state
.equ _ba0, 0*4
.equ _ba1, 1*4
.equ _be0, 2*4
.equ _be1, 3*4
.equ _bi0, 4*4
.equ _bi1, 5*4
.equ _bo0, 6*4
.equ _bo1, 7*4
.equ _bu0, 8*4
.equ _bu1, 9*4
.equ _ga0, 10*4
.equ _ga1, 11*4
.equ _ge0, 12*4
.equ _ge1, 13*4
.equ _gi0, 14*4
.equ _gi1, 15*4
.equ _go0, 16*4
.equ _go1, 17*4
.equ _gu0, 18*4
.equ _gu1, 19*4
.equ _ka0, 20*4
.equ _ka1, 21*4
.equ _ke0, 22*4
.equ _ke1, 23*4
.equ _ki0, 24*4
.equ _ki1, 25*4
.equ _ko0, 26*4
.equ _ko1, 27*4
.equ _ku0, 28*4
.equ _ku1, 29*4
.equ _ma0, 30*4
.equ _ma1, 31*4
.equ _me0, 32*4
.equ _me1, 33*4
.equ _mi0, 34*4
.equ _mi1, 35*4
.equ _mo0, 36*4
.equ _mo1, 37*4
.equ _mu0, 38*4
.equ _mu1, 39*4
.equ _sa0, 40*4
.equ _sa1, 41*4
.equ _se0, 42*4
.equ _se1, 43*4
.equ _si0, 44*4
.equ _si1, 45*4
.equ _so0, 46*4
.equ _so1, 47*4
.equ _su0, 48*4
.equ _su1, 49*4

@ --- offsets on stack
.equ mEs    , 0     @ Secondary state
.equ mD , 25*2*4
.equ mDo0, mD+0*4
.equ mDo1, mD+1*4
.equ mDu0, mD+2*4
.equ mDu1, mD+3*4
.equ mRC    , mD+4*4
.equ mRFU, mD+5*4
.equ mSize, mD+6*4

@ --- macros

.macro  load    reg, stkIn, offset
    .if     \stkIn == 1
    ldr     \reg, [sp, #\offset]
    .else
    .if     \offset >= _ma0
    ldr     \reg, [r7, #\offset-_ma0]
    .else
    ldr     \reg, [r0, #\offset]
    .endif
    .endif
    .endm

.macro  store   reg, stkIn, offset
    .if     \stkIn == 0
    str     \reg, [sp, #\offset]
    .else
    .if     \offset >= _ma0
    str     \reg, [r7, #\offset-_ma0]
    .else
    str     \reg, [r0, #\offset]
    .endif
    .endif
    .endm

.macro  xor5    stkIn, result,b,g,k,m,s
    load    \result, \stkIn, \b
    load    r6, \stkIn, \g
    eors    \result, \result, r6
    load    r6, \stkIn, \k
    eors    \result, \result, r6
    load    r6, \stkIn, \m
    eors    \result, \result, r6
    load    r6, \stkIn, \s
    eors    \result, \result, r6
    .endm

.macro  te0m    oD, rCp0, rCn1
    rors    \rCn1, \rCn1, r4
    eors    \rCn1, \rCn1, \rCp0
    str     \rCn1, [sp, #\oD]
    .endm

.macro  te1m    oD, rCp1, rCn0
    eors    \rCn0, \rCn0, \rCp1
    str     \rCn0, [sp, #\oD]
    .endm

.macro  te0r    rD, rCp0, rCn1
    rors    \rCn1, \rCn1, r4
    eors    \rCn1, \rCn1, \rCp0
    mov     \rD, \rCn1
    .endm

.macro  te1r    rD, rCp1, rCn0
    eors    \rCn0, \rCn0, \rCp1
    mov     \rD, \rCn0
    .endm

.macro  trp1    stkIn, b, ofS, orD, fD, rot
    load    \b, \stkIn, \ofS
    .if         \fD != 0
    mov     r6, \orD
    .else
    ldr     r6, [sp, #\orD]
    .endif
    eors    \b, \b, r6
    .if     \rot != 0
    movs    r6, #32-\rot
    rors    \b, \b, r6
    .endif
    .endm

.macro  trp5    stkIn, oS0, orD0, fD0, oR0, oS1, orD1, fD1, oR1, oS2, orD2, fD2, oR2, oS3, orD3, fD3, oR3, oS4, orD4, fD4, oR4
    trp1    \stkIn, r1, \oS0, \orD0, \fD0, \oR0
    trp1    \stkIn, r2, \oS1, \orD1, \fD1, \oR1
    trp1    \stkIn, r3, \oS2, \orD2, \fD2, \oR2
    trp1    \stkIn, r4, \oS3, \orD3, \fD3, \oR3
    trp1    \stkIn, r5, \oS4, \orD4, \fD4, \oR4
    .endm

.macro  chio1   stkIn, oOut, ax0, ax1, ax2, iota, useax2
    .if \useax2 != 0
    bics    \ax2, \ax2, \ax1            @ A[x+2] = A[x+2] & ~A[x+1]
    eors    \ax2, \ax2, \ax0            @ A[x+2] = A[x+2] ^ A[x]
    .if \iota != 0xFF
    ldr     r1, [sp, #mRC]
    ldr     r4, [r1, #\iota]
    eors    \ax2, \ax2, r4
    .endif
    store   \ax2, \stkIn, \oOut
    .else
    mov     r6, \ax2                    @ T1 = A[x+2]
    bics    r6, r6, \ax1                @ T1 = T1 & ~A[x+1]
    eors    r6, r6, \ax0                @ T1 = T1 ^ A[x]
    store   r6, \stkIn, \oOut
    .endif
    .endm

.macro  chio5   stkIn, oOut, iota
    chio1   \stkIn, \oOut+8*4, r5, r1, r2, 0xFF, 0
    chio1   \stkIn, \oOut+6*4, r4, r5, r1, 0xFF, 0
    chio1   \stkIn, \oOut+4*4, r3, r4, r5, 0xFF, 1
    chio1   \stkIn, \oOut+2*4, r2, r3, r4, 0xFF, 1
    chio1   \stkIn, \oOut+0*4, r1, r2, r3, \iota, 1
    .endm

.macro  Kround  stkIn, iota

    @ prepare Theta
    movs    r4, #31

    xor5    \stkIn, r1, _be1, _ge1, _ke1, _me1, _se1
    xor5    \stkIn, r2, _bu0, _gu0, _ku0, _mu0, _su0
    mov     r6, r1
    te0r    r8, r2, r6

    xor5    \stkIn, r3, _bi1, _gi1, _ki1, _mi1, _si1
    te1m    mDo1, r3, r2

    xor5    \stkIn, r2, _ba0, _ga0, _ka0, _ma0, _sa0
    te0r    r10, r2, r3

    xor5    \stkIn, r3, _bo1, _go1, _ko1, _mo1, _so1
    te1m    mDu1, r3, r2

    xor5    \stkIn, r2, _be0, _ge0, _ke0, _me0, _se0
    te0r    r12, r2, r3

    xor5    \stkIn, r3, _bu1, _gu1, _ku1, _mu1, _su1
    te1r    r9, r3, r2

    xor5    \stkIn, r2, _bi0, _gi0, _ki0, _mi0, _si0
    te0m    mDo0, r2, r3

    xor5    \stkIn, r3, _ba1, _ga1, _ka1, _ma1, _sa1
    te1r    r11, r3, r2

    xor5    \stkIn, r2, _bo0, _go0, _ko0, _mo0, _so0
    te0m    mDu0, r2, r3
    te1r    lr, r1, r2

    trp5    \stkIn, _bi0, r12, 1, 31, _go1, mDo1, 0, 28, _ku1, mDu1, 0, 20, _ma1, r9, 1, 21, _se0, r10, 1,  1
    chio5   \stkIn, _sa0, 0xFF
    trp5    \stkIn, _bi1, lr, 1, 31, _go0, mDo0, 0, 27, _ku0, mDu0, 0, 19, _ma0, r8, 1, 20, _se1, r11, 1,  1
    chio5   \stkIn, _sa1, 0xFF

    trp5    \stkIn, _bu1, mDu1, 0, 14, _ga0, r8, 1, 18, _ke0, r10, 1,  5, _mi1, lr, 1,  8, _so0, mDo0, 0, 28
    chio5   \stkIn,  _ma0, 0xFF
    trp5    \stkIn, _bu0, mDu0, 0, 13, _ga1, r9, 1, 18, _ke1, r11, 1,  5, _mi0, r12, 1,  7, _so1, mDo1, 0, 28
    chio5   \stkIn,  _ma1, 0xFF

    trp5    \stkIn, _be1, r11, 1,  1, _gi0, r12, 1,  3, _ko1, mDo1, 0, 13, _mu0, mDu0, 0,  4, _sa0, r8, 1,  9
    chio5   \stkIn, _ka0, 0xFF
    trp5    \stkIn, _be0, r10, 1,  0, _gi1, lr, 1,  3, _ko0, mDo0, 0, 12, _mu1, mDu1, 0,  4, _sa1, r9, 1,  9
    chio5   \stkIn, _ka1, 0xFF

    trp5    \stkIn, _bo0, mDo0, 0, 14, _gu0, mDu0, 0, 10, _ka1, r9, 1,  2, _me1, r11, 1, 23, _si1, lr, 1, 31
    chio5   \stkIn, _ga0, 0xFF
    trp5    \stkIn, _bo1, mDo1, 0, 14, _gu1, mDu1, 0, 10, _ka0, r8, 1,  1, _me0, r10, 1, 22, _si0, r12, 1, 30
    chio5   \stkIn, _ga1, 0xFF

    trp5    \stkIn, _ba0, r8, 1,  0, _ge0, r10, 1, 22, _ki1, lr, 1, 22, _mo1, mDo1, 0, 11, _su0, mDu0, 0,  7
    chio5   \stkIn, _ba0, \iota+0
    trp5    \stkIn, _ba1, r9, 1,  0, _ge1, r11, 1, 22, _ki0, r12, 1, 21, _mo0, mDo0, 0, 10, _su1, mDu1, 0,  7
    chio5   \stkIn, _ba1, \iota+4
    .endm

@----------------------------------------------------------------------------
@
@ void KeccakP1600_StaticInitialize( void )
@
.align 8
.global   KeccakP1600_StaticInitialize
KeccakP1600_StaticInitialize:
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP1600_Initialize(void *state)
@
.align 8
.global   KeccakP1600_Initialize
KeccakP1600_Initialize:
    push    {r4 - r5}
    movs    r1, #0
    movs    r2, #0
    movs    r3, #0
    movs    r4, #0
    movs    r5, #0
    stmia   r0!, { r1 - r5 }
    stmia   r0!, { r1 - r5 }
    stmia   r0!, { r1 - r5 }
    stmia   r0!, { r1 - r5 }
    stmia   r0!, { r1 - r5 }
    stmia   r0!, { r1 - r5 }
    stmia   r0!, { r1 - r5 }
    stmia   r0!, { r1 - r5 }
    stmia   r0!, { r1 - r5 }
    stmia   r0!, { r1 - r5 }
    pop     {r4 - r5}
    bx      lr


@ ----------------------------------------------------------------------------
@
@  void KeccakP1600_AddByte(void *state, unsigned char byte, unsigned int offset)
@
.align 8
.global   KeccakP1600_AddByte
KeccakP1600_AddByte:
    push    {r4 - r7}
    mov     r4, r8
    mov     r5, r9
    push    {r4 - r5}
    lsrs    r4, r2, #3                              @ offset &= ~7
    lsls    r4, r4, #3
    adds    r0, r0, r4                              @ add whole lane offset to state pointer
    lsls    r2, r2, #29                             @ offset &= 7 (part not lane aligned)
    lsrs    r2, r2, #29
    adr     r7, KeccakP1600_AddBytes_ToBitInterleavingConstants
    movs    r4, #0
    movs    r5, #0
    push    { r4 - r5 }
    add     r2, r2, sp
    strb    r1, [r2]
    pop     { r4 - r5 }
    mov     r8, r4
    mov     r9, r5
    toBitInterleaving   r8, r9, r4, r5, r6, r2, r7
    ldr     r6, [r0]
    eors    r4, r4, r6
    ldr     r6, [r0, #4]
    eors    r5, r5, r6
    stmia   r0!, { r4, r5 }
    pop     {r4 - r5}
    mov     r8, r4
    mov     r9, r5
    pop     {r4 - r7}
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP1600_AddBytes(void *state, const unsigned char *data, unsigned int offset, unsigned int length)
@
.align 8
.global   KeccakP1600_AddBytes
KeccakP1600_AddBytes:
    cmp     r3, #0                                  @ .if length != 0
    beq     KeccakP1600_AddBytes_Exit1
    push    {r4 - r6, lr}                           @ then
    mov     r4, r8
    mov     r5, r9
    mov     r6, r10
    push    {r4 - r7}
    lsrs    r4, r2, #3                              @ offset &= ~7
    lsls    r4, r4, #3
    adds    r0, r0, r4                              @ add whole lane offset to state pointer
    lsls    r2, r2, #29                             @ offset &= 7 (part not lane aligned)
    lsrs    r2, r2, #29
    beq     KeccakP1600_AddBytes_CheckLanes @ .if offset != 0
    movs    r4, r3                                  @ then, do remaining bytes in first lane
    movs    r5, #8
    subs    r5, r2                                  @ max size in lane = 8 - offset
    cmp     r4, r5
    ble     KeccakP1600_AddBytes_BytesAlign
    movs    r4, r5
KeccakP1600_AddBytes_BytesAlign:
    subs    r3, r3, r4                              @ size left
    mov     r10, r3
    movs    r3, r4
    adr     r7, KeccakP1600_AddBytes_ToBitInterleavingConstants
    bl      __KeccakP1600_AddBytesInLane
    mov     r3, r10
KeccakP1600_AddBytes_CheckLanes:
    lsrs    r2, r3, #3                              @ .if length >= 8
    beq     KeccakP1600_AddBytes_Bytes
    mov     r10, r3
    adr     r3, KeccakP1600_AddBytes_ToBitInterleavingConstants
    bl      __KeccakP1600_AddLanes
    mov     r3, r10
    lsls    r3, r3, #29
    lsrs    r3, r3, #29
KeccakP1600_AddBytes_Bytes:
    cmp     r3, #0
    beq     KeccakP1600_AddBytes_Exit
    movs    r2, #0
    adr     r7, KeccakP1600_AddBytes_ToBitInterleavingConstants
    bl      __KeccakP1600_AddBytesInLane
KeccakP1600_AddBytes_Exit:
    pop     {r4 - r7}
    mov     r8, r4
    mov     r9, r5
    mov     r10, r6
    pop     {r4 - r6, pc}
KeccakP1600_AddBytes_Exit1:
    bx      lr
    nop
KeccakP1600_AddBytes_ToBitInterleavingConstants:
        .long       0x55555555
        .long       0x33333333
        .long       0x0F0F0F0F
        .long       0x00FF00FF
        .long       0xAAAAAAAA
        .long       0xCCCCCCCC
        .long       0xF0F0F0F0
        .long       0xFF00FF00


@----------------------------------------------------------------------------
@
@ __KeccakP1600_AddLanes
@
@ Input:
@  r0 state pointer
@  r1 data pointer
@  r2 laneCount
@  r3 to bit interleaving constants pointer
@
@ Output:
@  r0 state pointer next lane
@  r1 data pointer next byte to input
@
@  Changed: r2-r9
@
.align 8
__KeccakP1600_AddLanes:
    lsls    r4, r1, #30
    bne     __KeccakP1600_AddLanes_LoopUnaligned
__KeccakP1600_AddLanes_LoopAligned:
    ldmia   r1!, {r6,r7}
    mov     r8, r6
    mov     r9, r7
    toBitInterleaving   r8, r9, r6, r7, r5, r4, r3
    ldr     r5, [r0]
    eors    r6, r6, r5
    ldr     r5, [r0, #4]
    eors    r7, r7, r5
    stmia   r0!, {r6,r7}
    subs    r2, r2, #1
    bne     __KeccakP1600_AddLanes_LoopAligned
    bx      lr
__KeccakP1600_AddLanes_LoopUnaligned:
    ldrb    r6, [r1, #0]
    ldrb    r4, [r1, #1]
    lsls    r4, r4, #8
    orrs    r6, r6, r4
    ldrb    r4, [r1, #2]
    lsls    r4, r4, #16
    orrs    r6, r6, r4
    ldrb    r4, [r1, #3]
    lsls    r4, r4, #24
    orrs    r6, r6, r4
    ldrb    r7, [r1, #4]
    ldrb    r4, [r1, #5]
    lsls    r4, r4, #8
    orrs    r7, r7, r4
    ldrb    r4, [r1, #6]
    lsls    r4, r4, #16
    orrs    r7, r7, r4
    ldrb    r4, [r1, #7]
    lsls    r4, r4, #24
    orrs    r7, r7, r4
    adds    r1, r1, #8
    mov     r8, r6
    mov     r9, r7
    toBitInterleaving   r8, r9, r6, r7, r5, r4, r3
    ldr     r5, [r0]
    eors    r6, r6, r5
    ldr     r5, [r0, #4]
    eors    r7, r7, r5
    stmia   r0!, {r6, r7}
    subs    r2, r2, #1
    bne     __KeccakP1600_AddLanes_LoopUnaligned
    bx      lr


@----------------------------------------------------------------------------
@
@ __KeccakP1600_AddBytesInLane
@
@ Input:
@  r0 state pointer
@  r1 data pointer
@  r2 offset in lane
@  r3 length
@  r7 to bit interleaving constants pointer
@
@ Output:
@  r0 state pointer next lane
@  r1 data pointer next byte to input
@
@  Changed: r2-r9
@
.align 8
__KeccakP1600_AddBytesInLane:
    movs    r4, #0
    movs    r5, #0
    push    { r4 - r5 }
    add     r2, r2, sp
__KeccakP1600_AddBytesInLane_Loop:
    ldrb    r5, [r1]
    strb    r5, [r2]
    adds    r1, r1, #1
    adds    r2, r2, #1
    subs    r3, r3, #1
    bne     __KeccakP1600_AddBytesInLane_Loop
    pop     { r4 - r5 }
    mov     r8, r4
    mov     r9, r5
    toBitInterleaving   r8, r9, r4, r5, r6, r2, r7
    ldr     r6, [r0]
    eors    r4, r4, r6
    ldr     r6, [r0, #4]
    eors    r5, r5, r6
    stmia   r0!, { r4, r5 }
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP1600_OverwriteBytes(void *state, const unsigned char *data, unsigned int offset, unsigned int length)
@
.align 8
.global   KeccakP1600_OverwriteBytes
KeccakP1600_OverwriteBytes:
    cmp     r3, #0                                  @ .if length != 0
    beq     KeccakP1600_OverwriteBytes_Exit1
    push    {r4 - r6, lr}                           @ then
    mov     r4, r8
    mov     r5, r9
    mov     r6, r10
    push    {r4 - r7}
    lsrs    r4, r2, #3                              @ offset &= ~7
    lsls    r4, r4, #3
    adds    r0, r0, r4                              @ add whole lane offset to state pointer
    lsls    r2, r2, #29                             @ offset &= 7 (part not lane aligned)
    lsrs    r2, r2, #29
    beq     KeccakP1600_OverwriteBytes_CheckLanes   @ .if offset != 0
    movs    r4, r3                                  @ then, do remaining bytes in first lane
    movs    r5, #8
    subs    r5, r2                                  @ max size in lane = 8 - offset
    cmp     r4, r5
    ble     KeccakP1600_OverwriteBytes_BytesAlign
    movs    r4, r5
KeccakP1600_OverwriteBytes_BytesAlign:
    subs    r3, r3, r4                              @ size left
    mov     r10, r3
    movs    r3, r4
    adr     r7, KeccakP1600_OverwriteBytes_ToBitInterleavingConstants
    bl      __KeccakP1600_OverwriteBytesInLane
    mov     r3, r10
KeccakP1600_OverwriteBytes_CheckLanes:
    lsrs    r2, r3, #3                              @ .if length >= 8
    beq     KeccakP1600_OverwriteBytes_Bytes
    mov     r10, r3
    adr     r3, KeccakP1600_OverwriteBytes_ToBitInterleavingConstants
    bl      __KeccakP1600_OverwriteLanes
    mov     r3, r10
    lsls    r3, r3, #29
    lsrs    r3, r3, #29
KeccakP1600_OverwriteBytes_Bytes:
    cmp     r3, #0
    beq     KeccakP1600_OverwriteBytes_Exit
    movs    r2, #0
    adr     r7, KeccakP1600_OverwriteBytes_ToBitInterleavingConstants
    bl      __KeccakP1600_OverwriteBytesInLane
KeccakP1600_OverwriteBytes_Exit:
    pop     {r4 - r7}
    mov     r8, r4
    mov     r9, r5
    mov     r10, r6
    pop     {r4 - r6, pc}
KeccakP1600_OverwriteBytes_Exit1:
    bx      lr
    nop
KeccakP1600_OverwriteBytes_ToBitInterleavingConstants:
        .long       0x55555555
        .long       0x33333333
        .long       0x0F0F0F0F
        .long       0x00FF00FF
        .long       0xAAAAAAAA
        .long       0xCCCCCCCC
        .long       0xF0F0F0F0
        .long       0xFF00FF00


@----------------------------------------------------------------------------
@
@ __KeccakP1600_OverwriteLanes
@
@ Input:
@  r0 state pointer
@  r1 data pointer
@  r2 laneCount
@  r3 to bit interleaving constants pointer
@
@ Output:
@  r0 state pointer next lane
@  r1 data pointer next byte to input
@
@  Changed: r2-r9
@
.align 8
__KeccakP1600_OverwriteLanes:
    lsls    r4, r1, #30
    bne     __KeccakP1600_OverwriteLanes_LoopUnaligned
__KeccakP1600_OverwriteLanes_LoopAligned:
    ldmia   r1!, {r6,r7}
    mov     r8, r6
    mov     r9, r7
    toBitInterleaving   r8, r9, r6, r7, r5, r4, r3
    stmia   r0!, {r6,r7}
    subs    r2, r2, #1
    bne     __KeccakP1600_OverwriteLanes_LoopAligned
    bx      lr
__KeccakP1600_OverwriteLanes_LoopUnaligned:
    ldrb    r6, [r1, #0]
    ldrb    r4, [r1, #1]
    lsls    r4, r4, #8
    orrs    r6, r6, r4
    ldrb    r4, [r1, #2]
    lsls    r4, r4, #16
    orrs    r6, r6, r4
    ldrb    r4, [r1, #3]
    lsls    r4, r4, #24
    orrs    r6, r6, r4
    ldrb    r7, [r1, #4]
    ldrb    r4, [r1, #5]
    lsls    r4, r4, #8
    orrs    r7, r7, r4
    ldrb    r4, [r1, #6]
    lsls    r4, r4, #16
    orrs    r7, r7, r4
    ldrb    r4, [r1, #7]
    lsls    r4, r4, #24
    orrs    r7, r7, r4
    adds    r1, r1, #8
    mov     r8, r6
    mov     r9, r7
    toBitInterleaving   r8, r9, r6, r7, r5, r4, r3
    stmia   r0!, {r6, r7}
    subs    r2, r2, #1
    bne     __KeccakP1600_OverwriteLanes_LoopUnaligned
    bx      lr


@----------------------------------------------------------------------------
@
@ __KeccakP1600_OverwriteBytesInLane
@
@ Input:
@  r0 state pointer
@  r1 data pointer
@  r2 offset in lane
@  r3 length
@  r7 to bit interleaving constants pointer
@
@ Output:
@  r0 state pointer next lane
@  r1 data pointer next byte to input
@
@  Changed: r2-r9
@
.align 8
__KeccakP1600_OverwriteBytesInLane:
    movs    r4, #0
    movs    r5, #0
    push    { r4 - r5 }
    lsls    r6, r2, #2
    add     r2, r2, sp
    movs    r4, #0x0F                       @r4 mask to wipe nibbles(bit interleaved bytes) in state
    lsls    r4, r4, r6
    movs    r6, r4
__KeccakP1600_OverwriteBytesInLane_Loop:
    orrs    r6, r6, r4
    lsls    r4, r4, #4
    ldrb    r5, [r1]
    strb    r5, [r2]
    adds    r1, r1, #1
    adds    r2, r2, #1
    subs    r3, r3, #1
    bne     __KeccakP1600_OverwriteBytesInLane_Loop
    pop     { r4 - r5 }
    mov     r8, r4
    mov     r9, r5
    toBitInterleaving   r8, r9, r4, r5, r3, r2, r7
    ldr     r3, [r0]
    bics    r3, r3, r6
    eors    r4, r4, r3
    ldr     r3, [r0, #4]
    bics    r3, r3, r6
    eors    r5, r5, r3
    stmia   r0!, { r4, r5 }
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP1600_OverwriteWithZeroes(void *state, unsigned int byteCount)
@
.align 8
.global   KeccakP1600_OverwriteWithZeroes
KeccakP1600_OverwriteWithZeroes:
    push    {r4 - r5}
    lsrs    r2, r1, #3
    beq     KeccakP1600_OverwriteWithZeroes_Bytes
    movs    r4, #0
    movs    r5, #0
KeccakP1600_OverwriteWithZeroes_LoopLanes:
    stm     r0!, { r4, r5 }
    subs    r2, r2, #1
    bne     KeccakP1600_OverwriteWithZeroes_LoopLanes
KeccakP1600_OverwriteWithZeroes_Bytes:
    lsls    r1, r1, #32-3
    beq     KeccakP1600_OverwriteWithZeroes_Exit
    lsrs    r1, r1, #32-3
    movs    r3, #0x0F                       @r2 already zero, r3 = mask to wipe nibbles(bit interleaved bytes) in state
KeccakP1600_OverwriteWithZeroes_LoopBytes:
    orrs    r2, r2, r3
    lsls    r3, r3, #4
    subs    r1, r1, #1
    bne     KeccakP1600_OverwriteWithZeroes_LoopBytes
    ldr     r4, [r0]
    ldr     r5, [r0, #4]
    bics    r4, r4, r2
    bics    r5, r5, r2
    stm     r0!, { r4, r5 }
KeccakP1600_OverwriteWithZeroes_Exit:
    pop     {r4 - r5}
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP1600_ExtractBytes(void *state, const unsigned char *data, unsigned int offset, unsigned int length)
@
.align 8
.global   KeccakP1600_ExtractBytes
KeccakP1600_ExtractBytes:
    cmp     r3, #0                                  @ .if length != 0
    beq     KeccakP1600_ExtractBytes_Exit1
    push    {r4 - r6, lr}                           @ then
    mov     r4, r8
    push    {r4, r7}
    lsrs    r4, r2, #3                              @ offset &= ~7
    lsls    r4, r4, #3
    adds    r0, r0, r4                              @ add whole lane offset to state pointer
    lsls    r2, r2, #29                             @ offset &= 7 (part not lane aligned)
    lsrs    r2, r2, #29
    beq     KeccakP1600_ExtractBytes_CheckLanes @ .if offset != 0
    movs    r4, r3                                  @ then, do remaining bytes in first lane
    movs    r5, #8
    subs    r5, r2                                  @ max size in lane = 8 - offset
    cmp     r4, r5
    ble     KeccakP1600_ExtractBytes_BytesAlign
    movs    r4, r5
KeccakP1600_ExtractBytes_BytesAlign:
    subs    r3, r3, r4                              @ size left
    mov     r8, r3
    movs    r3, r4
    adr     r7, KeccakP1600_ExtractBytes_FromBitInterleavingConstants
    bl      __KeccakP1600_ExtractBytesInLane
    mov     r3, r8
KeccakP1600_ExtractBytes_CheckLanes:
    lsrs    r2, r3, #3                              @ .if length >= 8
    beq     KeccakP1600_ExtractBytes_Bytes
    mov     r8, r3
    adr     r3, KeccakP1600_ExtractBytes_FromBitInterleavingConstants
    bl      __KeccakP1600_ExtractLanes
    mov     r3, r8
    lsls    r3, r3, #29
    lsrs    r3, r3, #29
KeccakP1600_ExtractBytes_Bytes:
    cmp     r3, #0
    beq     KeccakP1600_ExtractBytes_Exit
    movs    r2, #0
    adr     r7, KeccakP1600_ExtractBytes_FromBitInterleavingConstants
    bl      __KeccakP1600_ExtractBytesInLane
KeccakP1600_ExtractBytes_Exit:
    pop     {r4,r7}
    mov     r8, r4
    pop     {r4 - r6, pc}
KeccakP1600_ExtractBytes_Exit1:
    bx      lr
    nop
KeccakP1600_ExtractBytes_FromBitInterleavingConstants:
        .long       0x0000FF00
        .long       0x00F000F0
        .long       0x0C0C0C0C
        .long       0x22222222


@----------------------------------------------------------------------------
@
@ __KeccakP1600_ExtractLanes
@
@ Input:
@  r0 state pointer
@  r1 data pointer
@  r2 laneCount
@  r3 from bit interleaving constants pointer
@
@ Output:
@  r0 state pointer next lane
@  r1 data pointer next byte to output
@
@  Changed: r2-r7
@
.align 8
__KeccakP1600_ExtractLanes:
    lsls    r4, r1, #30
    bne     __KeccakP1600_ExtractLanes_LoopUnaligned
__KeccakP1600_ExtractLanes_LoopAligned:
    ldmia   r0!, {r6,r7}
    fromBitInterleaving r6, r7, r5, r4, r3
    stmia   r1!, {r6,r7}
    subs    r2, r2, #1
    bne     __KeccakP1600_ExtractLanes_LoopAligned
    bx      lr
__KeccakP1600_ExtractLanes_LoopUnaligned:
    ldmia   r0!, {r6,r7}
    fromBitInterleaving r6, r7, r5, r4, r3
    strb    r6, [r1, #0]
    lsrs    r6, r6, #8
    strb    r6, [r1, #1]
    lsrs    r6, r6, #8
    strb    r6, [r1, #2]
    lsrs    r6, r6, #8
    strb    r6, [r1, #3]
    strb    r7, [r1, #4]
    lsrs    r7, r7, #8
    strb    r7, [r1, #5]
    lsrs    r7, r7, #8
    strb    r7, [r1, #6]
    lsrs    r7, r7, #8
    strb    r7, [r1, #7]
    adds    r1, r1, #8
    subs    r2, r2, #1
    bne     __KeccakP1600_ExtractLanes_LoopUnaligned
    bx      lr


@----------------------------------------------------------------------------
@
@ __KeccakP1600_ExtractBytesInLane
@
@ Input:
@  r0 state pointer
@  r1 data pointer
@  r2 offset in lane
@  r3 length
@  r7 from bit interleaving constants pointer
@
@ Output:
@  r0 state pointer next lane
@  r1 data pointer next byte to output
@
@  Changed: r2-r7
@
.align 8
__KeccakP1600_ExtractBytesInLane:
    ldmia   r0!, {r4,r5}
    push    {r0, r3}
    fromBitInterleaving r4, r5, r0, r3, r7
    pop     {r0, r3}
    push    {r4, r5}
    mov     r4, sp
    adds    r4, r4, r2
__KeccakP1600_ExtractBytesInLane_Loop:
    ldrb    r2, [r4]
    adds    r4, r4, #1
    strb    r2, [r1]
    adds    r1, r1, #1
    subs    r3, r3, #1
    bne     __KeccakP1600_ExtractBytesInLane_Loop
    add     sp, #8
    bx      lr


@----------------------------------------------------------------------------
@
@  void KeccakP1600_ExtractAndAddBytes(void *state, const unsigned char *input, unsigned char *output, unsigned int offset, unsigned int length)
@
.align 8
.global   KeccakP1600_ExtractAndAddBytes
KeccakP1600_ExtractAndAddBytes:
    push    {r3 - r7, lr}
    mov     r4, r8
    mov     r5, r9
    push    {r4 - r5}
    mov     r9, r2
    mov     r2, r3
    ldr     r3, [sp, #8*4]
    cmp     r3, #0                                  @ .if length != 0
    beq     KeccakP1600_ExtractAndAddBytes_Exit
    lsrs    r4, r2, #3                              @ offset &= ~7
    lsls    r4, r4, #3
    adds    r0, r0, r4                              @ add whole lane offset to state pointer
    lsls    r2, r2, #29                             @ offset &= 7 (part not lane aligned)
    lsrs    r2, r2, #29
    beq     KeccakP1600_ExtractAndAddBytes_CheckLanes   @ .if offset != 0
    movs    r4, r3                                  @ then, do remaining bytes in first lane
    movs    r5, #8
    subs    r5, r2                                  @ max size in lane = 8 - offset
    cmp     r4, r5
    ble     KeccakP1600_ExtractAndAddBytes_BytesAlign
    movs    r4, r5
KeccakP1600_ExtractAndAddBytes_BytesAlign:
    subs    r3, r3, r4                              @ size left
    mov     r8, r3
    movs    r3, r4
    adr     r7, KeccakP1600_ExtractAndAddBytes_FromBitInterleavingConstants
    bl      __KeccakP1600_ExtractAndAddBytesInLane
    mov     r3, r8
KeccakP1600_ExtractAndAddBytes_CheckLanes:
    lsrs    r2, r3, #3                              @ .if length >= 8
    beq     KeccakP1600_ExtractAndAddBytes_Bytes
    mov     r8, r3
    adr     r3, KeccakP1600_ExtractAndAddBytes_FromBitInterleavingConstants
    bl      __KeccakP1600_ExtractAndAddLanes
    mov     r3, r8
    lsls    r3, r3, #29
    lsrs    r3, r3, #29
KeccakP1600_ExtractAndAddBytes_Bytes:
    cmp     r3, #0
    beq     KeccakP1600_ExtractAndAddBytes_Exit
    movs    r2, #0
    adr     r7, KeccakP1600_ExtractAndAddBytes_FromBitInterleavingConstants
    bl      __KeccakP1600_ExtractAndAddBytesInLane
KeccakP1600_ExtractAndAddBytes_Exit:
    pop     {r4 - r5}
    mov     r8, r4
    mov     r9, r5
    pop     {r3 - r7, pc}
.align 8
KeccakP1600_ExtractAndAddBytes_FromBitInterleavingConstants:
        .long       0x0000FF00
        .long       0x00F000F0
        .long       0x0C0C0C0C
        .long       0x22222222


@----------------------------------------------------------------------------
@
@ __KeccakP1600_ExtractAndAddLanes
@
@ Input:
@  r0 state pointer
@  r1 in pointer
@  r2 laneCount
@  r3 from bit interleaving constants pointer
@  r9 out pointer
@
@ Output:
@  r0 state pointer next lane
@  r1 in pointer (next lane)
@  r9 out pointer (next lane)
@
@  Changed: r2-r7
@
.align 8
__KeccakP1600_ExtractAndAddLanes:
    lsls    r4, r1, #30
    bne     __KeccakP1600_ExtractAndAddLanes_LoopUnaligned
    mov     r4, r9
    lsls    r4, r4, #30
    bne     __KeccakP1600_ExtractAndAddLanes_LoopUnaligned
__KeccakP1600_ExtractAndAddLanes_LoopAligned:
    ldmia   r0!, {r6,r7}
    fromBitInterleaving r6, r7, r5, r4, r3
    mov     r4, r9
    ldm     r1!, {r5}
    eors    r6, r6, r5
    ldm     r1!, {r5}
    eors    r7, r7, r5
    stmia   r4!, {r6,r7}
    mov     r9, r4
    subs    r2, r2, #1
    bne     __KeccakP1600_ExtractAndAddLanes_LoopAligned
    bx      lr
__KeccakP1600_ExtractAndAddLanes_LoopUnaligned:
    ldmia   r0!, {r6,r7}
    fromBitInterleaving r6, r7, r5, r4, r3
    mov     r4, r9
    ldrb    r5, [r1, #0]
    eors    r5, r5, r6
    strb    r5, [r4, #0]
    lsrs    r6, r6, #8
    ldrb    r5, [r1, #1]
    eors    r5, r5, r6
    strb    r5, [r4, #1]
    lsrs    r6, r6, #8
    ldrb    r5, [r1, #2]
    eors    r5, r5, r6
    strb    r5, [r4, #2]
    lsrs    r6, r6, #8
    ldrb    r5, [r1, #3]
    eors    r5, r5, r6
    strb    r5, [r4, #3]
    ldrb    r5, [r1, #4]
    eors    r5, r5, r7
    strb    r5, [r4, #4]
    lsrs    r7, r7, #8
    ldrb    r5, [r1, #5]
    eors    r5, r5, r7
    strb    r5, [r4, #5]
    lsrs    r7, r7, #8
    ldrb    r5, [r1, #6]
    eors    r5, r5, r7
    strb    r5, [r4, #6]
    lsrs    r7, r7, #8
    ldrb    r5, [r1, #7]
    eors    r5, r5, r7
    strb    r5, [r4, #7]
    adds    r1, r1, #8
    adds    r4, r4, #8
    mov     r9, r4
    subs    r2, r2, #1
    bne     __KeccakP1600_ExtractAndAddLanes_LoopUnaligned
    bx      lr


@----------------------------------------------------------------------------
@
@ __KeccakP1600_ExtractAndAddBytesInLane
@
@ Input:
@  r0 state pointer
@  r1 data pointer
@  r2 offset in lane
@  r3 length
@  r7 from bit interleaving constants pointer
@  r9 out pointer
@
@ Output:
@  r0 state pointer next lane
@  r1 in pointer (next byte)
@  r9 out pointer (next byte)
@
@  Changed: r2-r7
@
.align 8
__KeccakP1600_ExtractAndAddBytesInLane:
    ldmia   r0!, {r4,r5}
    push    {r0, r3}
    fromBitInterleaving r4, r5, r0, r3, r7
    pop     {r0, r3}
    push    {r4, r5}
    mov     r4, sp
    adds    r4, r4, r2
    mov     r6, r9
__KeccakP1600_ExtractAndAddBytesInLane_Loop:
    ldrb    r2, [r4]
    adds    r4, r4, #1
    ldrb    r5, [r1]
    eors    r2, r2, r5
    strb    r2, [r6]
    adds    r1, r1, #1
    adds    r6, r6, #1
    subs    r3, r3, #1
    bne     __KeccakP1600_ExtractAndAddBytesInLane_Loop
    add     sp, #8
    mov     r9, r6
    bx      lr


@ ----------------------------------------------------------------------------
@
@  void KeccakP1600_Permute_12rounds( void *state )
@
.align 8
.global   KeccakP1600_Permute_12rounds
KeccakP1600_Permute_12rounds:
    adr     r1, KeccakP1600_Permute_RoundConstants12
    b       KeccakP1600_Permute


@ ----------------------------------------------------------------------------
@
@  void KeccakP1600_Permute_24rounds( void *state )
@
.align 8
.global   KeccakP1600_Permute_24rounds
KeccakP1600_Permute_24rounds:
    adr     r1, KeccakP1600_Permute_RoundConstants24
    b       KeccakP1600_Permute


.align 8
KeccakP1600_Permute_RoundConstants24:
    @       0           1
        .long       0x00000001, 0x00000000
        .long       0x00000000, 0x00000089
        .long       0x00000000, 0x8000008b
        .long       0x00000000, 0x80008080

        .long       0x00000001, 0x0000008b
        .long       0x00000001, 0x00008000
        .long       0x00000001, 0x80008088
        .long       0x00000001, 0x80000082

        .long       0x00000000, 0x0000000b
        .long       0x00000000, 0x0000000a
        .long       0x00000001, 0x00008082
        .long       0x00000000, 0x00008003

KeccakP1600_Permute_RoundConstants12:
        .long       0x00000001, 0x0000808b
        .long       0x00000001, 0x8000000b
        .long       0x00000001, 0x8000008a
        .long       0x00000001, 0x80000081

        .long       0x00000000, 0x80000081
        .long       0x00000000, 0x80000008
        .long       0x00000000, 0x00000083
        .long       0x00000000, 0x80008003

        .long       0x00000001, 0x80008088
        .long       0x00000000, 0x80000088
        .long       0x00000001, 0x00008000
        .long       0x00000000, 0x80008082

        .long       0x000000FF  @terminator

@----------------------------------------------------------------------------
@
@ void KeccakP1600_Permute( void *state, void * rc )
@
.align 8
KeccakP1600_Permute:
    push    { r4 - r6, lr }
    mov     r2, r8
    mov     r3, r9
    mov     r4, r10
    mov     r5, r11
    mov     r6, r12
    push    { r2 - r7 }
    sub     sp, #mSize
    movs    r7, #_ma0
    adds    r7, r7, r0
KeccakP1600_Permute_RoundLoop:
    str     r1, [sp, #mRC]
    Kround  0, 0
    Kround  1, 8
    adds    r1, r1, #2*8        @ Update pointer RC
    ldr     r6, [r1]            @ Check terminator
    cmp     r6, #0xFF
    beq     KeccakP1600_Permute_Done
    ldr     r6, =KeccakP1600_Permute_RoundLoop+1
    bx      r6
.align 8
    .ltorg
KeccakP1600_Permute_Done:
    add     sp, #mSize
    pop     { r1 - r5, r7 }
    mov     r8, r1
    mov     r9, r2
    mov     r10, r3
    mov     r11, r4
    mov     r12, r5
    pop     { r4 - r6, pc }


