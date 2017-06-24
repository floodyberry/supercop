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

@ WARNING: These functions work only on little endian CPU with@ ARMv7a architecture.


.text

.equ _ba, 0*4
.equ _be, 1*4
.equ _bi, 2*4
.equ _bo, 3*4
.equ _bu, 4*4
.equ _ga, 5*4
.equ _ge, 6*4
.equ _gi, 7*4
.equ _go, 8*4
.equ _gu, 9*4
.equ _ka, 10*4
.equ _ke, 11*4
.equ _ki, 12*4
.equ _ko, 13*4
.equ _ku, 14*4
.equ _ma, 15*4
.equ _me, 16*4
.equ _mi, 17*4
.equ _mo, 18*4
.equ _mu, 19*4
.equ _sa, 20*4
.equ _se, 21*4
.equ _si, 22*4
.equ _so, 23*4
.equ _su, 24*4

.macro  ThetaRhoPiChiIota   stateOut, stateIn, ofsOut, ofs1, ofs2, ofs3, ofs4, dd1, dd2, dd3, dd4, dd5, rr2, rr3, rr4, rr5
    ldr         r2, [\stateIn, #\ofs1]
    ldr         r3, [\stateIn, #\ofs2]
    ldr         r4, [\stateIn, #\ofs3]
    eor         r2, r2, \dd1
    ldr         r5, [\stateIn, #\ofs4]
    eor         r3, r3, \dd2
    eor         r4, r4, \dd3
    eor         r5, r5, \dd4
    eor         r6, r6, \dd5
    ror         r3, r3, #32-\rr2
    ror         r4, r4, #32-\rr3
    ror         r5, r5, #32-\rr4
    ror         r6, r6, #32-\rr5

    bic         r1, r5, r4
    eor         r1, r1, r3
    str         r1, [\stateOut, #\ofsOut+4]
    bic         r1, r6, r5
    eor         r1, r1, r4
    str         r1, [\stateOut, #\ofsOut+8]
    bic         r1, r2, r6
    eor         r1, r1, r5
    str         r1, [\stateOut, #\ofsOut+12]
    bic         r7, r3, r2
    eor         r7, r7, r6
    str         r7, [\stateOut, #\ofsOut+16]
    ldr         r1, [lr], #4
    bic         r4, r4, r3
    eor         r4, r4, r1
    eor         r4, r4, r2
    str         r4, [\stateOut, #\ofsOut+0]
    .endm

.macro  ThetaRhoPiChi       stateOut, stateIn, ofsOut, ofs1, ofs2, ofs3, ofs4, ofs5, dd1, dd2, dd3, dd4, dd5, rr1, rr2, rr3, rr4, rr5
    ldr         r2, [\stateIn, #\ofs1]
    ldr         r3, [\stateIn, #\ofs2]
    ldr         r4, [\stateIn, #\ofs3]
    eor         r2, r2, \dd1
    ldr         r5, [\stateIn, #\ofs4]
    eor         r3, r3, \dd2
    ldr         r6, [\stateIn, #\ofs5]
    eor         r4, r4, \dd3
    eor         r5, r5, \dd4
    ror         r2, r2, #32-\rr1
    eor         r6, r6, \dd5
    ror         r3, r3, #32-\rr2
    ror         r4, r4, #32-\rr3
    ror         r5, r5, #32-\rr4
    ror         r6, r6, #32-\rr5

    bic         r1, r4, r3
    eor         r1, r1, r2
    str         r1, [\stateOut, #\ofsOut+0]
    bic         r1, r5, r4
    eor         r1, r1, r3
    str         r1, [\stateOut, #\ofsOut+4]
    bic         r1, r6, r5
    eor         r1, r1, r4
    str         r1, [\stateOut, #\ofsOut+8]
    bic         r1, r2, r6
    bic         r2, r3, r2
    eor         r1, r1, r5
    eor         r2, r2, r6
    str         r1, [\stateOut, #\ofsOut+12]
    eor         r7, r7, r2
    str         r2, [\stateOut, #\ofsOut+16]
    .endm

.macro  ThetaRhoPiChiLast   stateOut, stateIn, ofsOut, ofs1, ofs2, ofs3, ofs4, ofs5, dd1, dd2, dd3, dd4, dd5, rr1, rr2, rr3, rr4, rr5
    ldr         r2, [\stateIn, #\ofs1]
    ldr         r3, [\stateIn, #\ofs2]
    ldr         r4, [\stateIn, #\ofs3]
    eor         r2, r2, \dd1
    ldr         r5, [\stateIn, #\ofs4]
    eor         r3, r3, \dd2
    ldr         r6, [\stateIn, #\ofs5]
    eor         r4, r4, \dd3
    eor         r5, r5, \dd4
    ror         r2, r2, #32-\rr1
    eor         r6, r6, \dd5
    ror         r3, r3, #32-\rr2
    ror         r4, r4, #32-\rr3
    ror         r5, r5, #32-\rr4
    ror         r6, r6, #32-\rr5

    bic         r8, r4, r3
    bic         r9, r5, r4
    bic         r10, r6, r5
    bic         r11, r2, r6
    bic         r1, r3, r2
    eor         r8, r8, r2
    eor         r9, r9, r3
    eor         r10, r10, r4
    str         r8, [\stateOut, #\ofsOut+0]
    eor         r11, r11, r5
    str         r9, [\stateOut, #\ofsOut+4]
    eor         r6, r6, r1
    str         r10, [\stateOut, #\ofsOut+8]
    str         r11, [\stateOut, #\ofsOut+12]
    eor         r7, r7, r6
    str         r6, [\stateOut, #\ofsOut+16]
    .endm

.macro  KeccakRound stateOut, stateIn
    @  prepare Theta
    ldr         r2, [\stateIn, #_ba]
    ldr         r3, [\stateIn, #_be]
    ldr         r4, [\stateIn, #_bi]
    ldr         r5, [\stateIn, #_bo]
    eor         r2, r2, r8
    eor         r3, r3, r9
    eor         r4, r4, r10
    eor         r5, r5, r11
    ldr         r8, [\stateIn, #_ga]
    ldr         r9, [\stateIn, #_ge]
    ldr         r10, [\stateIn, #_gi]
    ldr         r11, [\stateIn, #_go]
    eor         r2, r2, r8
    eor         r3, r3, r9
    eor         r4, r4, r10
    eor         r5, r5, r11
    ldr         r8, [\stateIn, #_ka]
    ldr         r9, [\stateIn, #_ke]
    ldr         r10, [\stateIn, #_ki]
    ldr         r11, [\stateIn, #_ko]
    eor         r2, r2, r8
    eor         r3, r3, r9
    eor         r4, r4, r10
    eor         r5, r5, r11
    ldr         r8, [\stateIn, #_ma]
    ldr         r9, [\stateIn, #_me]
    ldr         r10, [\stateIn, #_mi]
    ldr         r11, [\stateIn, #_mo]
    eor         r2, r2, r8
    eor         r3, r3, r9
    eor         r4, r4, r10
    eor         r5, r5, r11
    eor         r8, r7, r3, ROR #31
    eor         r9, r2, r4, ROR #31
    eor         r10, r3, r5, ROR #31
    eor         r11, r4, r7, ROR #31
    eor         r12, r5, r2, ROR #31

    ThetaRhoPiChiIota   \stateOut, \stateIn, _ba, _ba, _ge, _ki, _mo,      r8, r9, r10, r11, r12,     12, 11, 21, 14
    ThetaRhoPiChi       \stateOut, \stateIn, _ga, _bo, _gu, _ka, _me, _si, r11, r12, r8, r9, r10, 28, 20,  3, 13, 29
    ThetaRhoPiChi       \stateOut, \stateIn, _ka, _be, _gi, _ko, _mu, _sa, r9, r10, r11, r12, r8,  1,  6, 25,  8, 18
    ThetaRhoPiChi       \stateOut, \stateIn, _ma, _bu, _ga, _ke, _mi, _so, r12, r8, r9, r10, r11, 27,  4, 10, 15, 24
    ThetaRhoPiChiLast   \stateOut, \stateIn, _sa, _bi, _go, _ku, _ma, _se, r10, r11, r12, r8, r9, 30, 23,  7,  9,  2
    .endm


@ ----------------------------------------------------------------------------
@
@  void KeccakP800_StaticInitialize( void )
@
.align 8
.global   KeccakP800_StaticInitialize
KeccakP800_StaticInitialize:
    bx      lr


@ ----------------------------------------------------------------------------
@
@  void KeccakP800_Initialize(void *state)
@
.align 8
.global   KeccakP800_Initialize
KeccakP800_Initialize:
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
    pop     {r4 - r5}
    bx      lr


@ ----------------------------------------------------------------------------
@
@  void KeccakP800_AddByte(void *state, unsigned char byte, unsigned int offset)
@
.align 8
.global   KeccakP800_AddByte
KeccakP800_AddByte:
    ldrb    r3, [r0, r2]
    eors    r3, r3, r1
    strb    r3, [r0, r2]
    bx      lr


@ ----------------------------------------------------------------------------
@
@  void KeccakP800_AddBytes(void *state, const unsigned char *data, unsigned int offset, unsigned int length)
@
.align 8
.global   KeccakP800_AddBytes
KeccakP800_AddBytes:
    push    {r4,lr}
    adds    r0, r0, r2                              @ state += offset
    subs    r3, r3, #4                              @ .if length >= 4
    bcc     KeccakP800_AddBytes_Bytes
KeccakP800_AddBytes_LanesLoop:                  @ then, perform on words
    ldr     r2, [r0]
    ldr     r4, [r1], #4
    eors    r2, r2, r4
    str     r2, [r0], #4
    subs    r3, r3, #4
    bcs     KeccakP800_AddBytes_LanesLoop
KeccakP800_AddBytes_Bytes:
    adds    r3, r3, #3
    bcc     KeccakP800_AddBytes_Exit
KeccakP800_AddBytes_BytesLoop:
    ldrb    r2, [r0]
    ldrb    r4, [r1], #1
    eors    r2, r2, r4
    strb    r2, [r0], #1
    subs    r3, r3, #1
    bcs     KeccakP800_AddBytes_BytesLoop
KeccakP800_AddBytes_Exit:
    pop     {r4,pc}


@ ----------------------------------------------------------------------------
@
@  void KeccakP800_OverwriteBytes(void *state, const unsigned char *data, unsigned int offset, unsigned int length)
@
.align 8
.global   KeccakP800_OverwriteBytes
KeccakP800_OverwriteBytes:
    adds    r0, r0, r2                              @ state += offset
    subs    r3, r3, #4                              @ .if length >= 4
    bcc     KeccakP800_OverwriteBytes_Bytes
KeccakP800_OverwriteBytes_LanesLoop:            @ then, perform on words
    ldr     r2, [r1], #4
    str     r2, [r0], #4
    subs    r3, r3, #4
    bcs     KeccakP800_OverwriteBytes_LanesLoop
KeccakP800_OverwriteBytes_Bytes:
    adds    r3, r3, #3
    bcc     KeccakP800_OverwriteBytes_Exit
KeccakP800_OverwriteBytes_BytesLoop:
    ldrb    r2, [r1], #1
    strb    r2, [r0], #1
    subs    r3, r3, #1
    bcs     KeccakP800_OverwriteBytes_BytesLoop
KeccakP800_OverwriteBytes_Exit:
    bx      lr



@ ----------------------------------------------------------------------------
@
@  void KeccakP800_OverwriteWithZeroes(void *state, unsigned int byteCount)
@
.align 8
.global   KeccakP800_OverwriteWithZeroes
KeccakP800_OverwriteWithZeroes:
    movs    r3, #0
    lsrs    r2, r1, #2
    beq     KeccakP800_OverwriteWithZeroes_Bytes
KeccakP800_OverwriteWithZeroes_LoopLanes:
    str     r3, [r0], #4
    subs    r2, r2, #1
    bne     KeccakP800_OverwriteWithZeroes_LoopLanes
KeccakP800_OverwriteWithZeroes_Bytes:
    ands    r1, #3
    beq     KeccakP800_OverwriteWithZeroes_Exit
KeccakP800_OverwriteWithZeroes_LoopBytes:
    strb    r3, [r0], #1
    subs    r1, r1, #1
    bne     KeccakP800_OverwriteWithZeroes_LoopBytes
KeccakP800_OverwriteWithZeroes_Exit:
    bx      lr


@ ----------------------------------------------------------------------------
@
@  void KeccakP800_ExtractBytes(void *state, const unsigned char *data, unsigned int offset, unsigned int length)
@
.align 8
.global   KeccakP800_ExtractBytes
KeccakP800_ExtractBytes:
    adds    r0, r0, r2                              @ state += offset
    subs    r3, r3, #4                              @ .if length >= 4
    bcc     KeccakP800_ExtractBytes_Bytes
KeccakP800_ExtractBytes_LanesLoop:              @ then, handle words
    ldr     r2, [r0], #4
    str     r2, [r1], #4
    subs    r3, r3, #4
    bcs     KeccakP800_ExtractBytes_LanesLoop
KeccakP800_ExtractBytes_Bytes:
    adds    r3, r3, #3
    bcc     KeccakP800_ExtractBytes_Exit
KeccakP800_ExtractBytes_BytesLoop:
    ldrb    r2, [r0], #1
    strb    r2, [r1], #1
    subs    r3, r3, #1
    bcs     KeccakP800_ExtractBytes_BytesLoop
KeccakP800_ExtractBytes_Exit:
    bx      lr


@ ----------------------------------------------------------------------------
@
@  void KeccakP800_ExtractAndAddBytes(void *state, const unsigned char *input, unsigned char *output, unsigned int offset, unsigned int length)
@
.align 8
.global   KeccakP800_ExtractAndAddBytes
KeccakP800_ExtractAndAddBytes:
    push    {r4,r5}
    adds    r0, r0, r3                                  @ state += offset (offset register no longer needed, reuse for length)
    ldr     r3, [sp, #8]                                @ get length argument from stack
    subs    r3, r3, #4                                  @ .if length >= 4
    bcc     KeccakP800_ExtractAndAddBytes_Bytes
KeccakP800_ExtractAndAddBytes_LanesLoop:            @ then, handle words
    ldr     r5, [r0], #4
    ldr     r4, [r1], #4
    eors    r5, r5, r4
    str     r5, [r2], #4
    subs    r3, r3, #4
    bcs     KeccakP800_ExtractAndAddBytes_LanesLoop
KeccakP800_ExtractAndAddBytes_Bytes:
    adds    r3, r3, #3
    bcc     KeccakP800_ExtractAndAddBytes_Exit
KeccakP800_ExtractAndAddBytes_BytesLoop:
    ldrb    r5, [r0], #1
    ldrb    r4, [r1], #1
    eors    r5, r5, r4
    strb    r5, [r2], #1
    subs    r3, r3, #1
    bcs     KeccakP800_ExtractAndAddBytes_BytesLoop
KeccakP800_ExtractAndAddBytes_Exit:
    pop     {r4,r5}
    bx      lr


@ ----------------------------------------------------------------------------
@
@  void KeccakP800_Permute_12rounds( void *state )
@
.align 8
.global   KeccakP800_Permute_12rounds
KeccakP800_Permute_12rounds:
    adr     r1, KeccakP800_Permute_RoundConstants12
    b       KeccakP800_Permute


@ ----------------------------------------------------------------------------
@
@  void KeccakP800_Permute_22rounds( void *state )
@
.align 8
.global   KeccakP800_Permute_22rounds
KeccakP800_Permute_22rounds:
    adr     r1, KeccakP800_Permute_RoundConstants22
    b       KeccakP800_Permute


.align 8
KeccakP800_Permute_RoundConstants22:
        .long       0x00000001
        .long       0x00008082
        .long       0x0000808a
        .long       0x80008000
        .long       0x0000808b
        .long       0x80000001
        .long       0x80008081
        .long       0x00008009
        .long       0x0000008a
        .long       0x00000088
KeccakP800_Permute_RoundConstants12:
        .long       0x80008009
        .long       0x8000000a
        .long       0x8000808b
        .long       0x0000008b
        .long       0x00008089
        .long       0x00008003
        .long       0x00008002
        .long       0x00000080
        .long       0x0000800a
        .long       0x8000000a
        .long       0x80008081
        .long       0x00008080
        .long       0           @ terminator

@ ----------------------------------------------------------------------------
@
@  void KeccakP800_Permute( void *state, void *rc )
@
.align 8
KeccakP800_Permute:
    push        {r4-r12,lr}
    mov         lr, r1
    add         r2, r0, #_sa
    sub         sp, sp, #4*25+4
    ldmia       r2, { r8 - r12 }
    ldr         r7, [r0, #_bu]
    ldr         r1, [r0, #_gu]
    mov         r6, r12
    eor         r7, r7, r12
    ldr         r12, [r0, #_ku]
    eor         r7, r7, r1
    ldr         r1, [r0, #_mu]
    eor         r7, r7, r12
    eor         r7, r7, r1
KeccakP800_Permute_RoundLoop:
    KeccakRound sp, r0
    KeccakRound r0, sp
    ldr         r4, [lr]
    cmp         r4, #0
    bne         KeccakP800_Permute_RoundLoop
    add         sp,sp,#4*25+4
    pop         {r4-r12,pc}


