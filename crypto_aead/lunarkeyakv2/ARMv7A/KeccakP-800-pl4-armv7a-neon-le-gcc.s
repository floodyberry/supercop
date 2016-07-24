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

@ ATTENTION: These functions work only on little endian CPU with@ ARMv7A + NEON architecture
@ ATTENTION: State must be 256 bit (32 bytes) aligned, best is 64-byte (cache alignment).

@ INFO: Parallel execution of Keccak-P permutation on 4 lane interleaved states.
@ INFO: KeccakP800times4_PermuteAll_12rounds() execution time is TBM!! cycles on a Cortex-A8 (BeagleBone Black)
@ INFO: KeccakP800times4_PermuteAll_22rounds() execution time is TBM!! cycles on a Cortex-A8 (BeagleBone Black)



.text

@----------------------------------------------------------------------------

@ --- offsets in state
.equ _ba    , 0*16
.equ _be    , 1*16
.equ _bi    , 2*16
.equ _bo    , 3*16
.equ _bu    , 4*16
.equ _ga    , 5*16
.equ _ge    , 6*16
.equ _gi    , 7*16
.equ _go    , 8*16
.equ _gu    , 9*16
.equ _ka    , 10*16
.equ _ke    , 11*16
.equ _ki    , 12*16
.equ _ko    , 13*16
.equ _ku    , 14*16
.equ _ma    , 15*16
.equ _me    , 16*16
.equ _mi    , 17*16
.equ _mo    , 18*16
.equ _mu    , 19*16
.equ _sa    , 20*16
.equ _se    , 21*16
.equ _si    , 22*16
.equ _so    , 23*16
.equ _su    , 24*16

.equ LaneSizeShift, 2
.equ ParallelShift, 2
.equ LaneSize   , (1 << LaneSizeShift)
.equ Parallel   , (1 << ParallelShift)
.equ LaneSizeBits, (LaneSize * 8)

    @--------------------------------------------------------------------------
    @
    @ Neon macros
    @

.macro  mVadd       r, a, b
    vadd.u32    \r, \a, \b
    .endm

.macro  mVshl       r, a, b
    vshl.u32    \r, \a, \b
    .endm

.macro  mVsri       r, a, b
    vsri.32     \r, \a, \b
    .endm

.macro  mVeor       r, a, b
    veor.32     \r, \a, \b
    .endm

.macro  mVbic       r, a, b
    vbic.32     \r, \a, \b
    .endm

    @--------------------------------------------------------------------------
.macro    mVload        qreg, curr, next
    .if \next == 16
    vld1.64     { \qreg }, [r3:128]!
    .else
    .if \next == (\curr+6*16)
    vld1.64     { \qreg }, [r3:128], r4
    .else
    vld1.64     { \qreg }, [r3:128]
    add         r3, r3, #\next
    .endif
    .endif
    .endm

    @--------------------------------------------------------------------------
.macro  mC      stateOut, first, b1, b2, b3, firstPlane, cc
    .if         \firstPlane == 1
    .if     \first == 1
    vld1.64 { d30 }, [r1:64]!       @ get round constant (2 lanes)
    .endif
    mVbic   \cc, \b3, \b2
    .if     \first == 1
    vmov    d31, d30
    .endif
    mVeor   \cc, \cc, \b1
    .if     \first == 1
    mVeor   \cc, \cc, q15
    .endif
    vst1.64 { \cc }, [\stateOut:128]!
    .else
    mVbic   q15, \b3, \b2
    mVeor   q15, q15, \b1
    vst1.64 { q15 }, [\stateOut:128]!
    mVeor   \cc, \cc, q15
    .endif
    .endm

    @--------------------------------------------------------------------------
.macro  mTRPCIT stateIn, ob, og, ok, om, os, obn, d1, r1, d2, r2, d3, r3, d4, r4, d5, r5, stateOut, firstPlane

    mVload  q10, \ob, \og
    mVload  q11, \og, \ok
    mVload  q12, \ok, \om

    .if     \r1 == 0
    mVeor   q10, q10, \d1
    .else
    mVeor   q15, q10,  \d1
    .endif
    mVeor   q13, q11, \d2
    mVeor   q14, q12, \d3
    vpush   { \d1 }

    .if     \r1 != 0
    mVshl   q10, q15,  #\r1
    .endif
    mVshl   q11, q13, #\r2
    mVshl   q12, q14, #\r3
    .if     \r1 != 0
    mVsri   q10, q15,  #LaneSizeBits-\r1
    .endif
    mVsri   q11, q13, #LaneSizeBits-\r2
    mVsri   q12, q14, #LaneSizeBits-\r3
    mC      \stateOut, 1,  q10, q11, q12, \firstPlane, q0

    mVload  q13, \om, \os
    mVload  q14, \os, \obn

    mVeor   \d1, q13, \d4
    mVeor   q15, q14, \d5

    mVshl   q13, \d1, #\r4
    mVshl   q14, q15, #\r5

    mVsri   q13, \d1, #LaneSizeBits-\r4
    mVsri   q14, q15, #LaneSizeBits-\r5
    vpop    { \d1 }

    mC      \stateOut, 0, q11, q12, q13, \firstPlane, q1
    mC      \stateOut, 0, q12, q13, q14, \firstPlane, q2
    mC      \stateOut, 0, q13, q14, q10, \firstPlane, q3
    mC      \stateOut, 0, q14, q10, q11, \firstPlane, q4
    .endm

    @--------------------------------------------------------------------------
.macro  mKR     stateOut,stateIn

    @ prepare Theta (part2)
    @ De = Ca ^ ROLn(Ci, 1)
    @ Di = Ce ^ ROLn(Co, 1)
    @ Do = Ci ^ ROLn(Cu, 1)
    @ Du = Co ^ ROLn(Ca, 1)
    @ Da = Cu ^ ROLn(Ce, 1)
    mVadd   q6, q2, q2
    mVadd   q7, q3, q3
    mVadd   q8, q4, q4
    mVadd   q9, q0, q0
    mVadd   q5, q1, q1
    mVsri   q6, q2, #LaneSizeBits-1
    mVsri   q7, q3, #LaneSizeBits-1
    mVsri   q8, q4, #LaneSizeBits-1
    mVsri   q9, q0, #LaneSizeBits-1
    mVsri   q5, q1, #LaneSizeBits-1
    mVeor   q6, q6, q0
    mVeor   q7, q7, q1
    mVeor   q8, q8, q2
    mVeor   q9, q9, q3
    mVeor   q5, q5, q4

    @ Apply Theta, Rho, Pi, Chi, Iota, Prepare Theta
    mTRPCIT \stateIn, _ba, _ge, _ki, _mo, _su, _bo, q5,  0, q6, 12, q7, 11, q8, 21, q9, 14, \stateOut, 1
    mTRPCIT \stateIn, _bo, _gu, _ka, _me, _si, _be, q8, 28, q9, 20, q5,  3, q6, 13, q7, 29, \stateOut, 0
    mTRPCIT \stateIn, _be, _gi, _ko, _mu, _sa, _bu, q6,  1, q7,  6, q8, 25, q9,  8, q5, 18, \stateOut, 0
    mTRPCIT \stateIn, _bu, _ga, _ke, _mi, _so, _bi, q9, 27, q5,  4, q6, 10, q7, 15, q8, 24, \stateOut, 0
    mTRPCIT \stateIn, _bi, _go, _ku, _ma, _se, _ba, q7, 30, q8, 23, q9,  7, q5,  9, q6,  2, \stateOut, 0
    sub     \stateOut, \stateOut, #25*Parallel*LaneSize
    .endm

@----------------------------------------------------------------------------
@
@ void KeccakP800_Pl_StaticInitialize( void )
@
.align 8
.global   KeccakP800_Pl_StaticInitialize
KeccakP800_Pl_StaticInitialize:
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP800times4_InitializeAll( void *states )
@
.align 8
.global   KeccakP800times4_InitializeAll
KeccakP800times4_InitializeAll:
    vmov.i64    q0, #0
    vmov.i64    q1, #0
    vmov.i64    q2, #0
    vmov.i64    q3, #0
    vstm        r0!, { d0 - d7 }      @ clear 16 lanes at a time
    vstm        r0!, { d0 - d7 }
    vstm        r0!, { d0 - d7 }
    vstm        r0!, { d0 - d7 }
    vstm        r0!, { d0 - d7 }
    vstm        r0!, { d0 - d7 }
    vstm        r0!, { d0 - d1}
    bx          lr



@----------------------------------------------------------------------------
@
@ void KeccakP800times4_AddByte( void *states, unsigned int instanceIndex, unsigned char byte, unsigned int offset )
@
.align 8
.global   KeccakP800times4_AddByte
KeccakP800times4_AddByte:
    add     r0, r0, r1, LSL #LaneSizeShift  @ states += LaneSize * instanceIndex
    lsr     r1, r3, #LaneSizeShift          @ states += (offset & ~(LaneSize-1)) * Parallel
    add     r0, r0, r1, LSL #ParallelShift+LaneSizeShift
    and     r3, r3, #LaneSize-1
    add     r0, r0, r3                      @ states += offset & (LaneSize-1)
    ldrb    r1, [r0]
    eor     r1, r1, r2
    strb    r1, [r0]
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP800times4_AddBytes( void *states, unsigned int instanceIndex, const unsigned char *data,
@                                   unsigned int offset, unsigned int length )
@
.align 8
.global   KeccakP800times4_AddBytes
KeccakP800times4_AddBytes:
    add     r0, r0, r1, LSL #LaneSizeShift  @ states += LaneSize * instanceIndex
    ldr     r1, [sp, #0*4]                  @ r1 = length
    cmp     r1, #0
    beq     KeccakP800times4_AddBytes_Exit
    push    { r4-r5 }
    lsr     r4, r3, #LaneSizeShift          @ states += (offset & ~(LaneSize-1)) * Parallel
    add     r0, r0, r4, LSL #ParallelShift+LaneSizeShift
    ands    r3, r3, #LaneSize-1             @ .if (offset & (LaneSize-1)) != 0
    beq     KeccakP800times4_AddBytes_CheckLanes
    add     r0, r0, r3                      @ states += offset & (LaneSize-1)
    rsb     r3, r3, #LaneSize               @ lenInLane = LaneSize - (offset & (LaneSize-1))
KeccakP800times4_AddBytes_LoopBytesFirst:
    ldrb    r4, [r0]
    ldrb    r5, [r2], #1
    eor     r4, r4, r5
    subs    r1, r1, #1
    strb    r4, [r0], #1
    beq     KeccakP800times4_AddBytes_Done
    subs    r3, r3, #1
    bne     KeccakP800times4_AddBytes_LoopBytesFirst
    add     r0, r0, #LaneSize*(Parallel-1)  @ states += LaneSize*(Parallel-1) (next lane of current state part)
KeccakP800times4_AddBytes_CheckLanes:
    lsrs    r3, r1, #LaneSizeShift
    beq     KeccakP800times4_AddBytes_CheckBytesLast
KeccakP800times4_AddBytes_LoopLanes:
    ldr     r4, [r0]
    ldr     r5, [r2], #4
    eor     r4, r4, r5
    subs    r3, r3, #1
    str     r4, [r0], #Parallel*LaneSize    @ states += Parallel*LaneSize (next lane of current state part)
    bne     KeccakP800times4_AddBytes_LoopLanes
KeccakP800times4_AddBytes_CheckBytesLast:
    ands    r1, r1, #LaneSize-1
    beq     KeccakP800times4_AddBytes_Done
KeccakP800times4_AddBytes_LoopBytesLast:
    ldrb    r4, [r0]
    ldrb    r5, [r2], #1
    eor     r4, r4, r5
    subs    r1, r1, #1
    strb    r4, [r0], #1
    bne     KeccakP800times4_AddBytes_LoopBytesLast
KeccakP800times4_AddBytes_Done:
    pop     { r4-r5 }
KeccakP800times4_AddBytes_Exit:
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP800times4_AddLanesAll( void *states, const unsigned char *data, unsigned int laneCount, unsigned int laneOffset )
@
.global   KeccakP800times4_AddLanesAll
.align 8
KeccakP800times4_AddLanesAll:
    cmp     r2, #0
    beq     KeccakP800times4_AddLanesAll_Exit
    push    {r4 - r9}
    lsl     r4, r3, #LaneSizeShift          @ r4: LaneSize * laneOffset
    add     r3, r1, r4                      @ r3: data + r4 (index 1)
    add     r8, r3, r4                      @ r8: data + 2 * r4 (index 2)
    add     r9, r8, r4                      @ r9: data + 3 * r4 (index 3)
KeccakP800times4_AddLanesAll_Loop:
    ldrd    r6, r7, [r0]
    ldr     r4, [r1], #4                    @ index 0+1
    ldr     r5, [r3], #4
    eor     r6, r6, r4
    eor     r7, r7, r5
    strd    r6, r7, [r0], #8
    ldrd    r6, r7, [r0]
    ldr     r4, [r8], #4                    @ index 2+3
    ldr     r5, [r9], #4
    eor     r6, r6, r4
    eor     r7, r7, r5
    strd    r6, r7, [r0], #8
    subs    r2, r2, #1
    bne     KeccakP800times4_AddLanesAll_Loop
    pop     {r4 - r9}
KeccakP800times4_AddLanesAll_Exit:
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP800times4_OverwriteBytes( void *states, unsigned int instanceIndex, const unsigned char *data,
@                                   unsigned int offset, unsigned int length )
@
.align 8
.global     KeccakP800times4_OverwriteBytes
KeccakP800times4_OverwriteBytes:
    add     r0, r0, r1, LSL #LaneSizeShift  @ states += LaneSize * instanceIndex
    ldr     r1, [sp, #0*4]                  @ r1 = length
    cmp     r1, #0
    beq     KeccakP800times4_OverwriteBytes_Exit
    push    { r4-r5 }
    lsr     r4, r3, #LaneSizeShift          @ states += (offset & ~LaneSize) * Parallel
    add     r0, r0, r4, LSL #ParallelShift+LaneSizeShift
    ands    r3, r3, #LaneSize-1             @ .if (offset & (LaneSize-1)) != 0
    beq     KeccakP800times4_OverwriteBytes_CheckLanes
    add     r0, r0, r3                      @ states += offset & (LaneSize-1)
    rsb     r3, r3, #LaneSize               @ lenInLane = LaneSize - (offset & (LaneSize-1))
KeccakP800times4_OverwriteBytes_LoopBytesFirst:
    ldrb    r4, [r2], #1
    strb    r4, [r0], #1
    subs    r1, r1, #1
    beq     KeccakP800times4_OverwriteBytes_Done
    subs    r3, r3, #1
    bne     KeccakP800times4_OverwriteBytes_LoopBytesFirst
    add     r0, r0, #LaneSize*(Parallel-1)  @ states += LaneSize*(Parallel-1) (next lane of current state part)
KeccakP800times4_OverwriteBytes_CheckLanes:
    lsrs    r3, r1, #3
    beq     KeccakP800times4_OverwriteBytes_CheckBytesLast
KeccakP800times4_OverwriteBytes_LoopLanes:
    ldr     r4, [r2], #4
    str     r4, [r0], #LaneSize*Parallel    @ states += LaneSize*Parallel (next lane of current state part)
    subs    r3, r3, #1
    bne     KeccakP800times4_OverwriteBytes_LoopLanes
KeccakP800times4_OverwriteBytes_CheckBytesLast:
    ands    r1, r1, #LaneSize-1
    beq     KeccakP800times4_OverwriteBytes_Done
KeccakP800times4_OverwriteBytes_LoopBytesLast:
    ldrb    r4, [r2], #1
    subs    r1, r1, #1
    strb    r4, [r0], #1
    bne     KeccakP800times4_OverwriteBytes_LoopBytesLast
KeccakP800times4_OverwriteBytes_Done:
    pop     { r4-r5 }
KeccakP800times4_OverwriteBytes_Exit:
    bx      lr


@----------------------------------------------------------------------------
@
@ KeccakP800times4_OverwriteLanesAll( void *states, const unsigned char *data, unsigned int laneCount, unsigned int laneOffset )
@
.align 8
.global     KeccakP800times4_OverwriteLanesAll
KeccakP800times4_OverwriteLanesAll:
    cmp     r2, #0
    beq     KeccakP800times4_OverwriteLanesAll_Exit
    push    { r4-r7 }
    lsl     r4, r3, #LaneSizeShift          @ r4: LaneSize * laneOffset
    add     r3, r1, r4                      @ r3: data + r4 (index 1)
    add     r6, r3, r4                      @ r6: data + 2 * r4 (index 2)
    add     r7, r8, r4                      @ r7: data + 3 * r4 (index 3)
KeccakP800times4_OverwriteLanesAll_Loop:
    ldr     r4, [r1], #4
    ldr     r5, [r3], #4
    strd    r4, r5, [r0], #8
    ldr     r4, [r6], #4
    ldr     r5, [r7], #4
    subs    r2, r2, #1
    strd    r4, r5, [r0], #8
    bne     KeccakP800times4_OverwriteLanesAll_Loop
    pop     { r4-r7 }
KeccakP800times4_OverwriteLanesAll_Exit:
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP800times4_OverwriteWithZeroes( void *states, unsigned int instanceIndex, unsigned int byteCount )
@
.align 8
.global     KeccakP800times4_OverwriteWithZeroes
KeccakP800times4_OverwriteWithZeroes:
    add     r0, r0, r1, LSL #LaneSizeShift  @ states += LaneSize * instanceIndex
    lsrs    r1, r2, #LaneSizeShift          @ r1: laneCount = byteCount / LaneSize
    beq     KeccakP800times4_OverwriteWithZeroes_Bytes
    movs    r3, #0
KeccakP800times4_OverwriteWithZeroes_LoopLanes:
    subs    r1, r1, #1
    str     r3, [r0], #Parallel*LaneSize
    bne     KeccakP800times4_OverwriteWithZeroes_LoopLanes
KeccakP800times4_OverwriteWithZeroes_Bytes:
    ands    r2, r2, #LaneSize-1             @ r2: byteCount remaining
    beq     KeccakP800times4_OverwriteWithZeroes_Exit
KeccakP800times4_OverwriteWithZeroes_LoopBytes:
    subs    r2, r2, #1
    strb    r3, [r0], #1
    bne     KeccakP800times4_OverwriteWithZeroes_LoopBytes
KeccakP800times4_OverwriteWithZeroes_Exit:
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP800times4_ExtractBytes( void *states, unsigned int instanceIndex, const unsigned char *data,
@                                   unsigned int offset, unsigned int length )
@
.align 8
.global     KeccakP800times4_ExtractBytes
KeccakP800times4_ExtractBytes:
    add     r0, r0, r1, LSL #LaneSizeShift  @ states += LaneSize * instanceIndex
    ldr     r1, [sp, #0*4]                  @ r1 = length
    cmp     r1, #0
    beq     KeccakP800times4_ExtractBytes_Exit
    push    { r4-r5 }
    lsr     r4, r3, #LaneSizeShift          @ states += (offset & ~(LaneSize-1)) * Parallel
    add     r0, r0, r4, LSL #LaneSizeShift+ParallelShift
    ands    r3, r3, #LaneSize-1             @ .if (offset & (LaneSize-1)) != 0
    beq     KeccakP800times4_ExtractBytes_CheckLanes
    add     r0, r0, r3                      @ states += offset & (LaneSize-1)
    rsb     r3, r3, #LaneSize               @ lenInLane = LaneSize - (offset & (LaneSize-1))
KeccakP800times4_ExtractBytes_LoopBytesFirst:
    ldrb    r4, [r0], #1
    strb    r4, [r2], #1
    subs    r1, r1, #1
    beq     KeccakP800times4_ExtractBytes_Done
    subs    r3, r3, #1
    bne     KeccakP800times4_ExtractBytes_LoopBytesFirst
    add     r0, r0, #LaneSize*(Parallel-1)  @ states += LaneSize*(Parallel-1) (next lane of current state part)
KeccakP800times4_ExtractBytes_CheckLanes:
    lsrs    r3, r1, #LaneSizeShift
    beq     KeccakP800times4_ExtractBytes_CheckBytesLast
KeccakP800times4_ExtractBytes_LoopLanes:
    ldr     r4, [r0], #Parallel*LaneSize
    str     r4, [r2], #4
    subs    r3, r3, #1
    bne     KeccakP800times4_ExtractBytes_LoopLanes
KeccakP800times4_ExtractBytes_CheckBytesLast:
    ands    r1, r1, #LaneSize-1
    beq     KeccakP800times4_ExtractBytes_Done
KeccakP800times4_ExtractBytes_LoopBytesLast:
    ldrb    r4, [r0], #1
    subs    r1, r1, #1
    strb    r4, [r2], #1
    bne     KeccakP800times4_ExtractBytes_LoopBytesLast
KeccakP800times4_ExtractBytes_Done:
    pop     { r4-r5 }
KeccakP800times4_ExtractBytes_Exit:
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP800times4_ExtractLanesAll( const void *states, unsigned char *data, unsigned int laneCount, unsigned int laneOffset )
@
.align 8
.global     KeccakP800times4_ExtractLanesAll
KeccakP800times4_ExtractLanesAll:
    cmp     r2, #0
    beq     KeccakP800times4_ExtractLanesAll_Exit
    push    { r4-r7 }
    lsl     r4, r3, #LaneSizeShift          @ r4: LaneSize * laneOffset
    add     r3, r1, r4                      @ r3: data + r4 (index 1)
    add     r6, r3, r4                      @ r6: data + 2 * r4 (index 2)
    add     r7, r8, r4                      @ r7: data + 3 * r4 (index 3)
KeccakP800times4_ExtractLanesAll_Loop:
    ldrd    r4, r5, [r0], #8
    str     r4, [r1], #4
    str     r5, [r3], #4
    ldrd    r4, r5, [r0], #8
    subs    r2, r2, #1
    str     r4, [r6], #4
    str     r5, [r7], #4
    bne     KeccakP800times4_ExtractLanesAll_Loop
    pop     { r4-r7 }
KeccakP800times4_ExtractLanesAll_Exit:
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP800times4_ExtractAndAddBytes( void *states, unsigned int instanceIndex,
@                                           const unsigned char *input, unsigned char *output,
@                                           unsigned int offset, unsigned int length )
@
.align 8
.global     KeccakP800times4_ExtractAndAddBytes
KeccakP800times4_ExtractAndAddBytes:
    add     r0, r0, r1, LSL #LaneSizeShift  @ states += LaneSize * instanceIndex
    ldr     r1, [sp, #1*4]                  @ r1 = length
    cmp     r1, #0
    beq     KeccakP800times4_ExtractAndAddBytes_Exit
    push    { r4-r5 }
    ldr     r12, [sp, #6*4]                 @ r12 = offset
    lsr     r4, r12, #LaneSize-1            @ states += (offset & ~(LaneSize-1)) * 2
    add     r0, r0, r4, LSL #LaneSizeShift+ParallelShift
    ands    r12, r12, #LaneSize-1           @ .if (offset & (LaneSize-1)) != 0
    beq     KeccakP800times4_ExtractAndAddBytes_CheckLanes
    add     r0, r0, r12                     @ states += offset & (LaneSize-1)
    rsb     r12, r12, #LaneSize             @ lenInLane = LaneSize - (offset & (LaneSize-1))
KeccakP800times4_ExtractAndAddBytes_LoopBytesFirst:
    ldrb    r4, [r0], #1
    ldrb    r5, [r2], #1
    eor     r4, r4, r5
    strb    r4, [r3], #1
    subs    r1, r1, #1
    beq     KeccakP800times4_ExtractAndAddBytes_Done
    subs    r12, r12, #1
    bne     KeccakP800times4_ExtractAndAddBytes_LoopBytesFirst
    add     r0, r0, #LaneSize*(Parallel-1)  @ states += LaneSize*(Parallel-1) (next lane of current state part)
KeccakP800times4_ExtractAndAddBytes_CheckLanes:
    lsrs    r12, r1, #LaneSizeShift
    beq     KeccakP800times4_ExtractAndAddBytes_CheckBytesLast
KeccakP800times4_ExtractAndAddBytes_LoopLanes:
    ldr     r4, [r0], #Parallel*LaneSize
    ldr     r5, [r2], #4
    eor     r4, r4, r5
    subs    r12, r12, #1
    str     r4, [r3], #4
    bne     KeccakP800times4_ExtractAndAddBytes_LoopLanes
KeccakP800times4_ExtractAndAddBytes_CheckBytesLast:
    ands    r1, r1, #LaneSize-1
    beq     KeccakP800times4_ExtractAndAddBytes_Done
KeccakP800times4_ExtractAndAddBytes_LoopBytesLast:
    ldrb    r4, [r0], #1
    ldrb    r5, [r2], #1
    eor     r4, r4, r5
    subs    r1, r1, #1
    strb    r4, [r3], #1
    bne     KeccakP800times4_ExtractAndAddBytes_LoopBytesLast
KeccakP800times4_ExtractAndAddBytes_Done:
    pop     { r4-r5 }
KeccakP800times4_ExtractAndAddBytes_Exit:
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP800times4_ExtractAndAddLanesAll(  const void *states,
@                                               const unsigned char *input, unsigned char *output,
@                                               unsigned int laneCount, unsigned int laneOffset )
@
.align 8
.global     KeccakP800times4_ExtractAndAddLanesAll
KeccakP800times4_ExtractAndAddLanesAll:
    cmp     r3, #0
    beq     KeccakP800times4_ExtractAndAddLanesAll_Exit
    push    {r4-r12,lr}
    ldr     r12, [sp, #10*4]                    @ r12 = laneOffset
    add     r4, r1, r12, LSL #LaneSizeShift     @ r4(input instance 1): input + 1 * LaneSize * laneOffset
    add     r7, r2, r12, LSL #LaneSizeShift     @ r7(output instance 1): output + 1 * LaneSize * laneOffset
    add     r5, r4, r12, LSL #LaneSizeShift     @ r5(input instance 2): input + 2 * LaneSize * laneOffset
    add     r8, r7, r12, LSL #LaneSizeShift     @ r8(output instance 2): output + 2 * LaneSize * laneOffset
    add     r6, r5, r12, LSL #LaneSizeShift     @ r6(input instance 3): input + 3 * LaneSize * laneOffset
    add     r9, r8, r12, LSL #LaneSizeShift     @ r9(output instance 3): output + 3 * LaneSize * laneOffset
KeccakP800times4_ExtractAndAddLanesAll_Loop:
    ldrd    r10, r11, [r0], #8
    ldr     r12, [r1], #4
    ldr     lr, [r4], #4
    eor     r10, r10, r12
    eor     r11, r11, lr
    str     r10, [r2], #4
    str     r11, [r7], #4
    ldrd    r10, r11, [r0], #8
    ldr     r12, [r5], #4
    ldr     lr, [r6], #4
    eor     r10, r10, r12
    eor     r11, r11, lr
    subs    r3, r3, #1
    str     r10, [r8], #4
    str     r11, [r9], #4
    bne     KeccakP800times4_ExtractAndAddLanesAll_Loop
    pop     {r4-r12,pc}
KeccakP800times4_ExtractAndAddLanesAll_Exit:
    bx      lr


@----------------------------------------------------------------------------
@
@ void KeccakP800times4_PermuteAll_22rounds( void *states )
@
.align 8
.global     KeccakP800times4_PermuteAll_22rounds
KeccakP800times4_PermuteAll_22rounds:
    adr     r1, KeccakP800times4_Permute_RoundConstants22
    movs    r2, #22
    b       KeccakP800times4_PermuteAll


@----------------------------------------------------------------------------
@
@ void KeccakP800times4_PermuteAll_12rounds( void *states )
@
.align 8
.global     KeccakP800times4_PermuteAll_12rounds
KeccakP800times4_PermuteAll_12rounds:
    adr     r1, KeccakP800times4_Permute_RoundConstants12
    movs    r2, #12
    b       KeccakP800times4_PermuteAll


   .align 8
KeccakP800times4_Permute_RoundConstants22:
        .quad       0x0000000100000001
        .quad       0x0000808200008082
        .quad       0x0000808a0000808a
        .quad       0x8000800080008000
        .quad       0x0000808b0000808b
        .quad       0x8000000180000001
        .quad       0x8000808180008081
        .quad       0x0000800900008009
        .quad       0x0000008a0000008a
        .quad       0x0000008800000088
KeccakP800times4_Permute_RoundConstants12:
        .quad       0x8000800980008009
        .quad       0x8000000a8000000a
        .quad       0x8000808b8000808b
        .quad       0x0000008b0000008b
        .quad       0x0000808900008089
        .quad       0x0000800300008003
        .quad       0x0000800200008002
        .quad       0x0000008000000080
        .quad       0x0000800a0000800a
        .quad       0x8000000a8000000a
        .quad       0x8000808180008081
        .quad       0x0000808000008080

@----------------------------------------------------------------------------
@
@ void KeccakP800times4_PermuteAll( void *states, void *rc, unsigned int nr )
@
.equ _SAS, 25*4+4+8 @allocate secondary state (add 12 bytes to allow alignment on 16 bytes and multiple of 8)

.align 8
KeccakP800times4_PermuteAll:
    vpush   {q4-q7}
    push    {r4-r7}
    sub     sp, #_SAS
    mov     r3, r0
    add     r5, sp, #8

    @PrepareTheta
    @ Ca = ba ^ ga ^ ka ^ ma ^ sa
    @ Ce = be ^ ge ^ ke ^ me ^ se
    @ Ci = bi ^ gi ^ ki ^ mi ^ si
    @ Co = bo ^ go ^ ko ^ mo ^ so
    @ Cu = bu ^ gu ^ ku ^ mu ^ su
    vld1.64 { d0, d1, d2, d3 }, [r3:256]!   @ _ba _be
    bic     r5, #15
    vld1.64 { d4, d5, d6, d7 }, [r3:256]!   @ _bi _bo
    vld1.64 { d8, d9, d10, d11 }, [r3:256]! @ _bu _ga
    vld1.64 { d12, d13 }, [r3:128]! @ _ge
    veor.64 q0, q0, q5
    vld1.64 { d14, d15 }, [r3:128]! @ _gi
    veor.64 q1, q1, q6
    vld1.64 { d16, d17 }, [r3:128]! @ _go
    veor.64 q2, q2, q7
    vld1.64 { d18, d19 }, [r3:128]! @ _gu
    veor.64 q3, q3, q8
    vld1.64 { d10, d11 }, [r3:128]! @ _ka
    veor.64 q4, q4, q9
    vld1.64 { d12, d13 }, [r3:128]! @ _ke
    veor.64 q0, q0, q5
    vld1.64 { d14, d15 }, [r3:128]! @ _ki
    veor.64 q1, q1, q6
    vld1.64 { d16, d17 }, [r3:128]! @ _ko
    veor.64 q2, q2, q7
    vld1.64 { d18, d19 }, [r3:128]! @ _ku
    veor.64 q3, q3, q8
    vld1.64 { d10, d11 }, [r3:128]! @ _ma
    veor.64 q4, q4, q9
    vld1.64 { d12, d13 }, [r3:128]! @ _me
    veor.64 q0, q0, q5
    vld1.64 { d14, d15 }, [r3:128]! @ _mi
    veor.64 q1, q1, q6
    vld1.64 { d16, d17 }, [r3:128]! @ _mo
    veor.64 q2, q2, q7
    vld1.64 { d18, d19 }, [r3:128]! @ _mu
    veor.64 q3, q3, q8
    vld1.64 { d10, d11 }, [r3:128]! @ _sa
    veor.64 q4, q4, q9
    vld1.64 { d12, d13 }, [r3:128]! @ _se
    veor.64 q0, q0, q5
    vld1.64 { d14, d15 }, [r3:128]! @ _si
    veor.64 q1, q1, q6
    vld1.64 { d16, d17 }, [r3:128]! @ _so
    veor.64 q2, q2, q7
    vld1.64 { d18, d19 }, [r3:128]! @ _su
    mov     r3, r0
    veor.64 q3, q3, q8
    veor.64 q4, q4, q9
KeccakP800times4_PermuteAll_RoundLoop:
    mKr     r5, r0
    mKr     r0, r5
    subs    r2, #2
    bne     KeccakP800times4_PermuteAll_RoundLoop
    add     sp, #_SAS   @ free stack space
    pop     {r4-r7}
    vpop    {q4-q7}
    bx      lr


