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

@ WARNING: These functions work only on little endian CPU with@ ARMv7m architecture (Cortex-M3, ...).


    .thumb
    .syntax unified
.text

.equ _ba, 0
.equ _be, 1
.equ _bi, 2
.equ _bo, 3
.equ _bu, 4
.equ _ga, 5
.equ _ge, 6
.equ _gi, 7
.equ _go, 8
.equ _gu, 9
.equ _ka, 10
.equ _ke, 11
.equ _ki, 12
.equ _ko, 13
.equ _ku, 14
.equ _ma, 15
.equ _me, 16
.equ _mi, 17
.equ _mo, 18
.equ _mu, 19
.equ _sa, 20
.equ _se, 21
.equ _si, 22
.equ _so, 23
.equ _su, 24


.equ _a, 0
.equ _e, 8
.equ _i, 16
.equ _o, 24

.equ _B, 0
.equ _G, 8
.equ _K, 16
.equ _M, 24

.macro  RhoPi   rot, rOut, oOut, rIn, oIn

    .if \rot != 0
    .if \oIn ==0
        ubfx        r2, \rIn, #8-\rot, #\rot
        bfi         r2, \rIn, #\rot, #8-\rot
        bfi         \rOut, r2, #\oOut, #8
    .else
        uxtb        r1, \rIn, ROR #\oIn
        ubfx        r2, r1, #8-\rot, #\rot
        bfi         r2, r1, #\rot, #8-\rot
        bfi         \rOut, r2, #\oOut, #8
    .endif
    .else
    .if \oIn !=0
        lsr         r1, \rIn, #\oIn
        bfi         \rOut, r1, #\oOut, #8
    .else
        bfi         \rOut, \rOut, #\oOut, #8
    .endif
    .endif
    .endm

.macro  Chi         rXaeio, rXu, offU

    .if \offU == 0
    lsls        r2, \rXu, #24
    .else
    .if \offU == 24
    and         r2, \rXu, #0xFF000000
    .else
    ubfx        r2, \rXu, #\offU, #8                @r2 = Beiou
    lsls        r2, r2, #24
    .endif
    .endif
    orr         r2, r2, \rXaeio, LSR #8

    lsl         r1, \rXaeio, #24                    @r1 = Bioua
    orr         r1, r1, r2, LSR #8

    bics        r1, r1, r2                      @r1 = Bioua & ~ Beiou
    bic         r2, r2, \rXaeio                 @r2 = Be & ~Ba
    eor         \rXaeio, \rXaeio, r1                @Baeio ^= r1

    .if \offU !=0
    eor         r2, r2, \rXu, LSR #\offU            @r2 ^= Bu
    .else
    eors        r2, r2, \rXu                        @r2 ^= Bu
    .endif
    bfi         \rXu, r2, #\offU, #8
    .endm

@//----------------------------------------------------------------------------
@//
@// void KetJr_StateOverwrite( void *state, unsigned int offset, const unsigned char *data, unsigned int length )
@//
.align 8
.global   KetJr_StateOverwrite
KetJr_StateOverwrite:
    cmp     r3, #0
    beq     KetJr_StateOverwrite_Exit
    adds    r0, r0, r1
KetJr_StateOverwrite_Loop:
    ldrb    r1, [r2], #1
    subs    r3, r3, #1
    strb    r1, [r0], #1
    bne     KetJr_StateOverwrite_Loop
KetJr_StateOverwrite_Exit:
    bx      lr


@//----------------------------------------------------------------------------
@//
@// void KetJr_Step( void *state, unsigned int size, unsigned char framing )
@//
.align 8
.global   KetJr_Step
KetJr_Step:
    push    {r4-r12,lr}

    @ Load state into registers
    ldr     r8, [r0, #_ba]      @ B-aeio
    ldr     r9, [r0, #_ga]      @ G-aeio
    ldr     r10, [r0, #_ka]     @ K-aeio
    ldr     r11, [r0, #_ma]     @ M-aeio
    ldr     r12, [r0, #_sa]     @ S-aeio

    ldrb    r6, [r0, #_bu]      @ BGKM-u
    ldrb    r3, [r0, #_gu]
    orr     r6, r6, r3, LSL #8
    ldrb    r3, [r0, #_ku]
    orr     r6, r6, r3, LSL #16
    ldrb    r3, [r0, #_mu]
    orr     r6, r6, r3, LSL #24

    ldrb    r7, [r0, #_su]          @ S-u

    lsls    r1, r1, #3
    lsls    r2, r2, r1
    eors    r8, r8, r2
    eor     r8, r8, #0x00080000

    bl      KeccakP200_1_StatePermuteAsm

    @ Save registers into RAM state
    str     r8, [r0, #_ba]      @ B-aeio
    str     r9, [r0, #_ga]      @ G-aeio
    str     r10, [r0, #_ka]     @ K-aeio
    str     r11, [r0, #_ma]     @ M-aeio
    str     r12, [r0, #_sa]     @ S-aeio

    strb    r6, [r0, #_bu]      @ BGKM-u
    lsrs    r6, #8
    strb    r6, [r0, #_gu]
    lsrs    r6, #8
    strb    r6, [r0, #_ku]
    lsrs    r6, #8
    strb    r6, [r0, #_mu]
    strb    r7, [r0, #_su]          @ S-u

    pop     {r4-r12,pc}


@//----------------------------------------------------------------------------
@//
@// void KetJr_FeedAssociatedDataBlocks( void *state, const unsigned char *data, unsigned int nBlocks )
@//
.align 8
.global   KetJr_FeedAssociatedDataBlocks
KetJr_FeedAssociatedDataBlocks:
    push    {r4-r12,lr}

    @ Load state into registers
    ldr     r8, [r0, #_ba]      @ B-aeio
    ldr     r9, [r0, #_ga]      @ G-aeio
    ldr     r10, [r0, #_ka]     @ K-aeio
    ldr     r11, [r0, #_ma]     @ M-aeio
    ldr     r12, [r0, #_sa]     @ S-aeio

    ldrb    r6, [r0, #_bu]      @ BGKM-u
    ldrb    r3, [r0, #_gu]
    orr     r6, r6, r3, LSL #8
    ldrb    r3, [r0, #_ku]
    orr     r6, r6, r3, LSL #16
    ldrb    r3, [r0, #_mu]
    orr     r6, r6, r3, LSL #24

    ldrb    r7, [r0, #_su]          @ S-u

KetJr_FeedAssociatedDataBlocks_Loop:
    ldrh    r3, [r1], #2
    eor     r8, r8, #0x000C0000     @ padding + FRAMEBITS00
    eor     r8, r8, r3          @ data

    push    {r1-r2}
    bl      KeccakP200_1_StatePermuteAsm
    pop     {r1-r2}

    subs    r2, r2, #1
    bne     KetJr_FeedAssociatedDataBlocks_Loop

    @ Save registers into RAM state
    str     r8, [r0, #_ba]      @ B-aeio
    str     r9, [r0, #_ga]      @ G-aeio
    str     r10, [r0, #_ka]     @ K-aeio
    str     r11, [r0, #_ma]     @ M-aeio
    str     r12, [r0, #_sa]     @ S-aeio

    strb    r6, [r0, #_bu]      @ BGKM-u
    lsrs    r6, #8
    strb    r6, [r0, #_gu]
    lsrs    r6, #8
    strb    r6, [r0, #_ku]
    lsrs    r6, #8
    strb    r6, [r0, #_mu]
    strb    r7, [r0, #_su]          @ S-u

    pop     {r4-r12,pc}


@//----------------------------------------------------------------------------
@//
@// void KetJr_UnwrapBlocks( void *state, const unsigned char *ciphertext, unsigned char *plaintext, unsigned int nBlocks )
@//
.align 8
.global   KetJr_UnwrapBlocks
KetJr_UnwrapBlocks:
    push    {r4-r12,lr}

    @ Load state into registers
    ldr     r8, [r0, #_ba]      @ B-aeio
    ldr     r9, [r0, #_ga]      @ G-aeio
    ldr     r10, [r0, #_ka]     @ K-aeio
    ldr     r11, [r0, #_ma]     @ M-aeio
    ldr     r12, [r0, #_sa]     @ S-aeio

    ldrb    r6, [r0, #_bu]      @ BGKM-u
    ldrb    r4, [r0, #_gu]
    orr     r6, r6, r4, LSL #8
    ldrb    r4, [r0, #_ku]
    orr     r6, r6, r4, LSL #16
    ldrb    r4, [r0, #_mu]
    orr     r6, r6, r4, LSL #24

    ldrb    r7, [r0, #_su]          @ S-u

KetJr_UnwrapBlocks_Loop:
    ldrh    r4, [r1], #2                    @ ciphertext
    eor     lr, r4, r8                  @ plaintext
    strh    lr, [r2], #2
    eor     r8, r8, #0x000F0000     @ padding + FRAMEBITS11
    bfi     r8, r4, #0, #16         @ state = ciphertext

    push    {r1-r4}
    bl      KeccakP200_1_StatePermuteAsm
    pop     {r1-r4}

    subs    r3, r3, #1
    bne     KetJr_UnwrapBlocks_Loop

    @ Save registers into RAM state
    str     r8, [r0, #_ba]      @ B-aeio
    str     r9, [r0, #_ga]      @ G-aeio
    str     r10, [r0, #_ka]     @ K-aeio
    str     r11, [r0, #_ma]     @ M-aeio
    str     r12, [r0, #_sa]     @ S-aeio

    strb    r6, [r0, #_bu]      @ BGKM-u
    lsrs    r6, #8
    strb    r6, [r0, #_gu]
    lsrs    r6, #8
    strb    r6, [r0, #_ku]
    lsrs    r6, #8
    strb    r6, [r0, #_mu]
    strb    r7, [r0, #_su]          @ S-u

    pop     {r4-r12,pc}


@//----------------------------------------------------------------------------
@//
@// void KetJr_WrapBlocks( void *state, const unsigned char *plaintext, unsigned char *ciphertext, unsigned int nBlocks )
@//
.align 8
.global   KetJr_WrapBlocks
KetJr_WrapBlocks:
    push    {r4-r12,lr}

    @ Load state into registers
    ldr     r8, [r0, #_ba]      @ B-aeio
    ldr     r9, [r0, #_ga]      @ G-aeio
    ldr     r10, [r0, #_ka]     @ K-aeio
    ldr     r11, [r0, #_ma]     @ M-aeio
    ldr     r12, [r0, #_sa]     @ S-aeio

    ldrb    r6, [r0, #_bu]      @ BGKM-u
    ldrb    r4, [r0, #_gu]
    orr     r6, r6, r4, LSL #8
    ldrb    r4, [r0, #_ku]
    orr     r6, r6, r4, LSL #16
    ldrb    r4, [r0, #_mu]
    orr     r6, r6, r4, LSL #24

    ldrb    r7, [r0, #_su]          @ S-u

KetJr_WrapBlocks_Loop:
    ldrh    r4, [r1], #2                    @ plaintext
    eor     r8, r8, #0x000F0000     @ padding + FRAMEBITS11
    eor     r8, r8, r4          @ ciphertext = state ^= plaintext
    strh    r8, [r2], #2
    push    {r1-r4}
    bl      KeccakP200_1_StatePermuteAsm
    pop     {r1-r4}
    subs    r3, r3, #1
    bne     KetJr_WrapBlocks_Loop

    @ Save registers into RAM state
    str     r8, [r0, #_ba]      @ B-aeio
    str     r9, [r0, #_ga]      @ G-aeio
    str     r10, [r0, #_ka]     @ K-aeio
    str     r11, [r0, #_ma]     @ M-aeio
    str     r12, [r0, #_sa]     @ S-aeio

    strb    r6, [r0, #_bu]      @ BGKM-u
    lsrs    r6, #8
    strb    r6, [r0, #_gu]
    lsrs    r6, #8
    strb    r6, [r0, #_ku]
    lsrs    r6, #8
    strb    r6, [r0, #_mu]
    strb    r7, [r0, #_su]          @ S-u

    pop     {r4-r12,pc}


@//----------------------------------------------------------------------------
@//
@// Keccak-P[200, 1] usable from asm only
@//
KeccakP200_1_StatePermuteAsm:

    @ Prepare Theta
    eors        r4, r8, r9
    eors        r4, r4, r10
    eors        r4, r4, r11
    eors        r4, r4, r12

    eor         r1, r6, r6, LSL #16
    eor         r1, r1, r1, LSL #8
    eor         r5, r7, r1, LSR #24

    bic         r1, r4, #0x80808080     @ r1 = rol(Caeio)
    lsl         r1, r1, #1
    and         r2, r4, #0x80808080
    orr         r1, r1, r2, LSR #7

    @ Apply Theta u
    eors        r2, r1, r4, LSR #24     @ rt2(=Du) = Co ^ rol(Ca)
    uxtb        r2, r2
    eor         r7, r7, r2
    orr         r2, r2, r2, LSL #8
    orr         r2, r2, r2, LSL #16
    eor         r6, r6, r2

    lsl         r2, r5, #1                  @ r2 = rol(Cu)
    orrs        r2, r2, r5, LSR #7

    lsr         r1, r1, #8
    orr         r1, r1, r2, LSL #24         @ r1 = rol(Ceiou)
    orr         r2, r5, r4, LSL #8      @ r2 = Cuaei
    eors        r2, r2, r1                  @ r2 ^= r1

    @ Apply Theta aeio
    eor         r8, r8, r2
    eor         r9, r9, r2
    eor         r10, r10, r2
    eor         r11, r11, r2
    eor         r12, r12, r2

    @ Rho Pi
    lsr     r3, r8, #_e             @ save _be
    RhoPi   4, r8, _e, r9, _e       @ _be, _ge   1 <  6
    RhoPi   4, r9, _e, r6, _G       @ _ge, _gu   6 <  9
    RhoPi   5, r6, _G, r12, _i      @ _gu, _si   9 < 22
    RhoPi   7, r12, _i, r6, _K      @ _si, _ku  22 < 14
    RhoPi   2, r6, _K, r12, _a      @ _ku, _sa  14 < 20
    RhoPi   6, r12, _a, r8, _i      @ _sa, _bi  20 <  2
    RhoPi   3, r8, _i, r10, _i      @ _bi, _ki   2 < 12
    RhoPi   1, r10, _i, r10, _o     @ _ki, _ko  12 < 13
    RhoPi   0, r10, _o, r6, _M      @ _ko, _mu  13 < 19
    RhoPi   0, r6, _M, r12, _o      @ _mu, _so  19 < 23
    RhoPi   1, r12, _o, r11, _a     @ _so, _ma  23 < 15
    RhoPi   3, r11, _a, r6, _B      @ _ma, _bu  15 <  4
    RhoPi   6, r6, _B, r7,     0        @ _bu, _su   4 < 24
    RhoPi   2, r7,     0, r12, _e       @ _su, _se  24 < 21
    RhoPi   7, r12, _e, r9, _o      @ _se, _go  21 <  8
    RhoPi   5, r9, _o, r11, _e      @ _go, _me   8 < 16
    RhoPi   4, r11, _e, r9, _a      @ _me, _ga  16 <  5
    RhoPi   4, r9, _a, r8, _o       @ _ga, _bo   5 <  3
    RhoPi   5, r8, _o, r11, _o      @ _bo, _mo   3 < 18
    RhoPi   7, r11, _o, r11, _i     @ _mo, _mi  18 < 17
    RhoPi   2, r11, _i, r10, _e     @ _mi, _ke  17 < 11
    RhoPi   6, r10, _e, r9, _i      @ _ke, _gi  11 <  7
    RhoPi   3, r9, _i, r10, _a      @ _gi, _ka   7 < 10
    RhoPi   1, r10, _a, r3,      0      @ _ka, _be  10 < 1

    @ Chi
    Chi     r8, r6, _B
    Chi     r9, r6, _G
    Chi     r10, r6, _K
    Chi     r11, r6, _M
    Chi     r12, r7,     0

    @ Iota
    eor     r8, r8, #0x80

    @ Done
    bx      lr



