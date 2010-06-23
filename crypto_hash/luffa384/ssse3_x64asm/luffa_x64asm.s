/*
 * luffa_x64asm.s
 * Version 2.0 (Sep 15th 2009)
 *
 * Copyright (C) 2008-2009 Hitachi, Ltd. All rights reserved.
 *
 * Hitachi, Ltd. is the owner of this software and hereby grant
 * the U.S. Government and any interested party the right to use
 * this software for the purposes of the SHA-3 evaluation process,
 * notwithstanding that this software is copyrighted.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

.intel_syntax

    .macro  ROUND256    m0,m1,c
    MI256       %xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,\m0,\m1,%xmm6,%xmm7,%xmm10,%xmm11
    TWEAK256    %xmm3,%xmm5,%xmm8,%xmm9
    NMLTOM256   %xmm0,%xmm1,%xmm2,%xmm8,%xmm4,%xmm9,%xmm6,%xmm3,%xmm5,%xmm7
    STEP        %xmm6,%xmm0,%xmm5,%xmm4,%xmm3,%xmm1,%xmm7,%xmm9,%xmm2,%xmm8,%xmm10,%xmm11,[\c    ],[\c+ 16]
    STEP        %xmm6,%xmm0,%xmm5,%xmm4,%xmm3,%xmm1,%xmm7,%xmm9,%xmm2,%xmm8,%xmm10,%xmm11,[\c+ 32],[\c+ 48]
    STEP        %xmm6,%xmm0,%xmm5,%xmm4,%xmm3,%xmm1,%xmm7,%xmm9,%xmm2,%xmm8,%xmm10,%xmm11,[\c+ 64],[\c+ 80]
    STEP        %xmm6,%xmm0,%xmm5,%xmm4,%xmm3,%xmm1,%xmm7,%xmm9,%xmm2,%xmm8,%xmm10,%xmm11,[\c+ 96],[\c+112]
    STEP        %xmm6,%xmm0,%xmm5,%xmm4,%xmm3,%xmm1,%xmm7,%xmm9,%xmm2,%xmm8,%xmm10,%xmm11,[\c+128],[\c+144]
    STEP        %xmm6,%xmm0,%xmm5,%xmm4,%xmm3,%xmm1,%xmm7,%xmm9,%xmm2,%xmm8,%xmm10,%xmm11,[\c+160],[\c+176]
    STEP        %xmm6,%xmm0,%xmm5,%xmm4,%xmm3,%xmm1,%xmm7,%xmm9,%xmm2,%xmm8,%xmm10,%xmm11,[\c+192],[\c+208]
    STEP        %xmm6,%xmm0,%xmm5,%xmm4,%xmm3,%xmm1,%xmm7,%xmm9,%xmm2,%xmm8,%xmm10,%xmm11,[\c+224],[\c+240]
    MIXTON256   %xmm6,%xmm0,%xmm5,%xmm4,%xmm3,%xmm1,%xmm7,%xmm9,%xmm2,%xmm8
    movaps      %xmm4, %xmm2
    movaps      %xmm2, %xmm6
    .endm

    .macro  MI256   h0,h1,h2,h3,h4,h5,m0,m1,t0,t1,t2,t3
    movaps  \t0, \h0
    movaps  \t1, \h1
    xorps   \t0, \h2
    xorps   \t1, \h3
    xorps   \t0, \h4
    xorps   \t1, \h5
    MULT2   \t0, \t1, \t2, \t3
    xorps   \h0, \t0
    xorps   \h1, \t1
    xorps   \h2, \t0
    xorps   \h3, \t1
    xorps   \h4, \t0
    xorps   \h5, \t1

    xorps   \h0, \m0
    xorps   \h1, \m1
    MULT2   \m0, \m1, \t0, \t1
    xorps   \h2, \m0
    xorps   \h3, \m1
    MULT2   \m0, \m1, \t0, \t1
    xorps   \h4, \m0
    xorps   \h5, \m1
    .endm

    //  (r0,r1) -> (s0,s1)
    .macro  TWEAK256    r0,r1,s0,s1
    movaps  \s0, \r0
    movaps  \s1, \r1
    pslld   \r0, 1
    pslld   \r1, 2
    psrld   \s0, 31
    psrld   \s1, 30
    orps    \s0, \r0
    orps    \s1, \r1
    .endm

    //  convert normal format to mixed format
    //  (r0,r1,r2,r3,r4,r5)->(t0,r0,t2,r4,t1,r1,t3,r5)
    .macro  NMLTOM256   r0,r1,r2,r3,r4,r5,t0,t1,t2,t3,t4
    movaps  \t0, \r2
    movaps  \t1, \r3
    punpckhdq   \t0, \r0    /*(3,11,2,10)*/
    punpckhdq   \t1, \r1    /*(7,15,6,14)*/
    punpckldq   \r2, \r0    /*(1,9,0,8)*/
    punpckldq   \r3, \r1    /*(5,13,4,12)*/
    pshufd  \r0, \r4, 120   /*(17,19,18,16)*/
    pshufd  \r1, \r5, 120   /*(21,23,22,20)*/
    punpckhqdq  \r4, \t0    /*(3,11,19,18)*/
    punpckhqdq  \r5, \t1    /*(7,15,23,22)*/
    movaps  \t2, \r0
    movaps  \t3, \r1
    punpcklqdq  \t2, \t0    /*(2,10,18,16)*/
    punpcklqdq  \t3, \t1    /*(6,14,22,20)*/
    pshufd  \t0, \r0, 225   /*(17,19,16,18)*/
    pshufd  \t1, \r1, 225   /*(21,23,20,22)*/
    punpckhqdq  \r0, \r2    /*(1,9,17,19)*/
    punpckhqdq  \r1, \r3    /*(5,13,21,23)*/
    punpcklqdq  \t0, \r2    /*(0,8,16,18)*/
    punpcklqdq  \t1, \r3    /*(4,12,20,22)*/
    .endm

    //  convert mixed format to normal format
    //  (r0,r1,r2,r3,r4,r5,r6,r7) -> (r1,r5,r0,r4,t0,r2)
    .macro  MIXTON256   r0,r1,r2,r3,r4,r5,r6,r7,t0,t1
    movaps  \t0, \r0
    movaps  \t1, \r2
    punpckhdq   \r0, \r1    /*(1,0,9,8)*/
    punpckhdq   \r2, \r3    /*(3,2,11,10)*/
    punpckldq   \t0, \r1    /*(17,16,-,-)*/
    punpckldq   \t1, \r3    /*(19,18,-,-)*/
    movaps  \r1, \r0
    punpcklqdq  \r0, \r2    /*(11,10,9,8)*/
    punpckhqdq  \r1, \r2    /*(3,2,1,0)*/
    punpckhqdq  \t0, \t1    /*(19,18,17,16)*/

    movaps  \r2, \r4
    movaps  \t1, \r6
    punpckhdq   \r4, \r5
    punpckhdq   \r6, \r7
    punpckldq   \r2, \r5
    punpckldq   \t1, \r7
    movaps  \r5, \r4
    punpcklqdq  \r4, \r6
    punpckhqdq  \r5, \r6
    punpckhqdq  \r2, \t1
    .endm

    .macro  ROUND384    m0,m1,c
    MI384       %xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,\m0,\m1,%xmm10,%xmm11,%xmm12,%xmm13
    TWEAK384    %xmm3,%xmm5,%xmm7,%xmm8,%xmm9,%xmm10
    NMLTOM384   %xmm0,%xmm1,%xmm2,%xmm8,%xmm4,%xmm9,%xmm6,%xmm10,%xmm3,%xmm11,%xmm7,%xmm5
    STEP        %xmm4,%xmm7,%xmm0,%xmm6,%xmm9,%xmm5,%xmm1,%xmm10,%xmm2,%xmm3,%xmm8,%xmm11,[\c    ],[\c+ 16]
    STEP        %xmm4,%xmm7,%xmm0,%xmm6,%xmm9,%xmm5,%xmm1,%xmm10,%xmm2,%xmm3,%xmm8,%xmm11,[\c+ 32],[\c+ 48]
    STEP        %xmm4,%xmm7,%xmm0,%xmm6,%xmm9,%xmm5,%xmm1,%xmm10,%xmm2,%xmm3,%xmm8,%xmm11,[\c+ 64],[\c+ 80]
    STEP        %xmm4,%xmm7,%xmm0,%xmm6,%xmm9,%xmm5,%xmm1,%xmm10,%xmm2,%xmm3,%xmm8,%xmm11,[\c+ 96],[\c+112]
    STEP        %xmm4,%xmm7,%xmm0,%xmm6,%xmm9,%xmm5,%xmm1,%xmm10,%xmm2,%xmm3,%xmm8,%xmm11,[\c+128],[\c+144]
    STEP        %xmm4,%xmm7,%xmm0,%xmm6,%xmm9,%xmm5,%xmm1,%xmm10,%xmm2,%xmm3,%xmm8,%xmm11,[\c+160],[\c+176]
    STEP        %xmm4,%xmm7,%xmm0,%xmm6,%xmm9,%xmm5,%xmm1,%xmm10,%xmm2,%xmm3,%xmm8,%xmm11,[\c+192],[\c+208]
    STEP        %xmm4,%xmm7,%xmm0,%xmm6,%xmm9,%xmm5,%xmm1,%xmm10,%xmm2,%xmm3,%xmm8,%xmm11,[\c+224],[\c+240]
    MIXTON384   %xmm4,%xmm7,%xmm0,%xmm6,%xmm9,%xmm5,%xmm1,%xmm10,%xmm2,%xmm3,%xmm8,%xmm11
    movaps      %xmm1, %xmm6
    movaps      %xmm0, %xmm4
    movaps      %xmm3, %xmm9
    movaps      %xmm6, %xmm2
    movaps      %xmm4, %xmm5
    movaps      %xmm2, %xmm7
    movaps      %xmm5, %xmm10
    movaps      %xmm7, %xmm8
    .endm

    .macro  MI384   h0,h1,h2,h3,h4,h5,h6,h7,m0,m1,t0,t1,t2,t3
    movaps  \t0, \h0
    movaps  \t1, \h1
    xorps   \t0, \h2
    xorps   \t1, \h3
    xorps   \t0, \h4
    xorps   \t1, \h5
    xorps   \t0, \h6
    xorps   \t1, \h7
    MULT2   \t0, \t1, \t2, \t3
    xorps   \h0, \t0
    xorps   \h1, \t1
    xorps   \h2, \t0
    xorps   \h3, \t1
    xorps   \h4, \t0
    xorps   \h5, \t1
    xorps   \h6, \t0
    xorps   \h7, \t1

    movaps  \t0, \h0
    movaps  \t1, \h1
    MULT2   \h0, \h1, \t2, \t3
    xorps   \h0, \h6
    xorps   \h1, \h7
    MULT2   \h6, \h7, \t2, \t3
    xorps   \h6, \h4
    xorps   \h7, \h5
    MULT2   \h4, \h5, \t2, \t3
    xorps   \h4, \h2
    xorps   \h5, \h3
    MULT2   \h2, \h3, \t2, \t3
    xorps   \h2, \t0
    xorps   \h3, \t1

    xorps   \h0, \m0
    xorps   \h1, \m1
    MULT2   \m0, \m1, \t0, \t1
    xorps   \h2, \m0
    xorps   \h3, \m1
    MULT2   \m0, \m1, \t0, \t1
    xorps   \h4, \m0
    xorps   \h5, \m1
    MULT2   \m0, \m1, \t0, \t1
    xorps   \h6, \m0
    xorps   \h7, \m1
    .endm

    //  (r0,r1,r2) -> (s0,s1,s2)
    .macro  TWEAK384    r0,r1,r2,s0,s1,s2
    movaps  \s0, \r0
    movaps  \s1, \r1
    movaps  \s2, \r2
    pslld   \r0, 1
    pslld   \r1, 2
    pslld   \r2, 3
    psrld   \s0, 31
    psrld   \s1, 30
    psrld   \s2, 29
    orps    \s0, \r0
    orps    \s1, \r1
    orps    \s2, \r2
    .endm

    //  convert normal format to mixed format
    //  (r0,r1,r2,r3,r4,r5,r6,r7)->(r4,t2,r0,r6,r5,t3,r1,r7)
    .macro  NMLTOM384   r0,r1,r2,r3,r4,r5,r6,r7,t0,t1,t2,t3
    movaps  \t0, \r2
    movaps  \t1, \r3
    movaps  \t2, \r6
    movaps  \t3, \r7
    punpckhdq   \r6, \r4
    punpckhdq   \r7, \r5
    punpckhdq   \r2, \r0
    punpckhdq   \r3, \r1
    punpckldq   \t2, \r4
    punpckldq   \t3, \r5
    punpckldq   \t0, \r0
    punpckldq   \t1, \r1
    movaps  \r4, \t2
    movaps  \r5, \t3
    movaps  \r0, \r6
    movaps  \r1, \r7
    punpcklqdq  \r4, \t0
    punpcklqdq  \r5, \t1
    punpcklqdq  \r0, \r2
    punpcklqdq  \r1, \r3
    punpckhqdq  \t2, \t0
    punpckhqdq  \t3, \t1
    punpckhqdq  \r6, \r2
    punpckhqdq  \r7, \r3
    .endm

    //  convert mixed format to normal format
    //  (r0,r1,r2,r3,r4,r5,r6,r7) -> (r0,r3,r1,r4,r5,r7,t0,t2)
    .macro  MIXTON384   r0,r1,r2,r3,r4,r5,r6,r7,t0,t1,t2,t3
    movaps  \t0, \r0
    movaps  \t1, \r2
    movaps  \t2, \r4
    movaps  \t3, \r6
    punpckhdq   \r0, \r1
    punpckhdq   \r2, \r3
    punpckhdq   \r4, \r5
    punpckhdq   \r6, \r7
    punpckldq   \t0, \r1
    punpckldq   \t1, \r3
    punpckldq   \t2, \r5
    punpckldq   \t3, \r7
    movaps  \r1, \r0
    movaps  \r3, \r4
    movaps  \r5, \t0
    movaps  \r7, \t2
    punpckhqdq  \r0, \r2
    punpckhqdq  \r3, \r6
    punpckhqdq  \r5, \t1
    punpckhqdq  \r7, \t3
    punpcklqdq  \r1, \r2
    punpcklqdq  \r4, \r6
    punpcklqdq  \t0, \t1
    punpcklqdq  \t2, \t3
    .endm

    .macro  STEP    r0,r1,r2,r3,r4,r5,r6,r7,t0,t1,t2,t3,c0,c1
    SBOX    \r0,\r1,\r2,\r3,\t0,\r5,\r6,\r7,\r4,\t1
    MIXWORD \t0,\r4,\r0,\t2,\r1,\t1,\r5,\t3
    MIXWORD \r2,\r6,\r0,\t2,\r3,\r7,\r5,\t3
    movaps  \r0, \t0
    movaps  \r5, \t1
    ADDCONSTANTS    \r0,\r4,\c0,\c1
    .endm

    .macro  ADDCONSTANTS    r0,r1,c0,c1
    xorps   \r0,\c0
    xorps   \r1,\c1
    .endm

    #(r0,r1,r2,r3)->(r4,r1,r2,r3), (s0,s1,s2,s3)->(s4,s1,s2,s3)
    .macro  SBOX r0,r1,r2,r3,r4,s0,s1,s2,s3,s4
    movaps  \r4, \r0
    movaps  \s4, \s0
    orps    \r0, \r1
    orps    \s0, \s1
    xorps   \r2, \r3
    xorps   \s2, \s3
    xorps   \r1, allone
    xorps   \s1, allone
    xorps   \r0, \r3
    xorps   \s0, \s3
    andps   \r3, \r4
    andps   \s3, \s4
    xorps   \r1, \r3
    xorps   \s1, \s3
    xorps   \r3, \r2
    xorps   \s3, \s2
    andps   \r2, \r0
    andps   \s2, \s0
    xorps   \r0, allone
    xorps   \s0, allone
    xorps   \r2, \r1
    xorps   \s2, \s1
    orps    \r1, \r3
    orps    \s1, \s3
    xorps   \r4, \r1
    xorps   \s4, \s1
    xorps   \r3, \r2
    xorps   \s3, \s2
    andps   \r2, \r1
    andps   \s2, \s1
    xorps   \r1, \r0
    xorps   \s1, \s0
    .endm

    //  (r0,s0),(r1,s1)->(r0,s0),(r1,s1)
    .macro  MIXWORD r0,r1,t0,t1,s0,s1,u0,u1
    movaps  \t0, \r0
    movaps  \u0, \s0
    xorps   \r1, \r0
    xorps   \s1, \s0
    pslld   \r0, 2
    pslld   \s0, 2
    psrld   \t0, 30
    psrld   \u0, 30
    movaps  \t1, \r1
    movaps  \u1, \s1
    xorps   \r0, \r1
    xorps   \s0, \s1
    pslld   \t1, 14
    pslld   \u1, 14
    xorps   \r0, \t0
    xorps   \s0, \u0
    psrld   \r1, 18
    psrld   \s1, 18
    xorps   \t1, \r0
    xorps   \u1, \s0
    movaps  \t0, \r0
    movaps  \u0, \s0
    pslld   \r0, 10
    pslld   \s0, 10
    xorps   \r1, \t1
    xorps   \s1, \u1
    psrld   \t0, 22
    psrld   \u0, 22
    xorps   \r0, \r1
    xorps   \s0, \s1
    movaps  \t1, \r1
    movaps  \u1, \s1
    pslld   \r1, 1
    pslld   \s1, 1
    psrld   \t1, 31
    psrld   \u1, 31
    xorps   \r0, \t0
    xorps   \s0, \u0
    xorps   \r1, \t1
    xorps   \s1, \u1
    .endm

    .macro  ROUND512    m0,m1,c
    MI512       %xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,%xmm8,%xmm9,\m0,\m1,%xmm10,%xmm11,%xmm12,%xmm13
    TWEAK512    %xmm3,%xmm5,%xmm7,%xmm9,%xmm10,%xmm11,%xmm12,%xmm13
    NMLTOM5     %xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm12,%xmm13,%xmm14,%xmm15
    STEP512     %xmm4,%xmm14,%xmm0,%xmm6,%xmm5,%xmm15,%xmm1,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm2,%xmm3,%xmm12,%xmm13,[\c    ],[\c+ 16],[\c+256],[\c+272]
    STEP512     %xmm4,%xmm14,%xmm0,%xmm6,%xmm5,%xmm15,%xmm1,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm2,%xmm3,%xmm12,%xmm13,[\c+ 32],[\c+ 48],[\c+288],[\c+304]
    STEP512     %xmm4,%xmm14,%xmm0,%xmm6,%xmm5,%xmm15,%xmm1,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm2,%xmm3,%xmm12,%xmm13,[\c+ 64],[\c+ 80],[\c+320],[\c+336]
    STEP512     %xmm4,%xmm14,%xmm0,%xmm6,%xmm5,%xmm15,%xmm1,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm2,%xmm3,%xmm12,%xmm13,[\c+ 96],[\c+112],[\c+352],[\c+368]
    STEP512     %xmm4,%xmm14,%xmm0,%xmm6,%xmm5,%xmm15,%xmm1,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm2,%xmm3,%xmm12,%xmm13,[\c+128],[\c+144],[\c+384],[\c+400]
    STEP512     %xmm4,%xmm14,%xmm0,%xmm6,%xmm5,%xmm15,%xmm1,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm2,%xmm3,%xmm12,%xmm13,[\c+160],[\c+176],[\c+416],[\c+432]
    STEP512     %xmm4,%xmm14,%xmm0,%xmm6,%xmm5,%xmm15,%xmm1,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm2,%xmm3,%xmm12,%xmm13,[\c+192],[\c+208],[\c+448],[\c+464]
    STEP512     %xmm4,%xmm14,%xmm0,%xmm6,%xmm5,%xmm15,%xmm1,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm2,%xmm3,%xmm12,%xmm13,[\c+224],[\c+240],[\c+480],[\c+496]
    // (r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11) -> (r0,r3,r1,r4,r5,r7,t0,t2,r8,r9)
    MIXTON5     %xmm4,%xmm14,%xmm0,%xmm6,%xmm5,%xmm15,%xmm1,%xmm7,%xmm8,%xmm9,%xmm10,%xmm11,%xmm2,%xmm3,%xmm12,%xmm13
    // (4,6,14,5,15,7,2,12,8,9)
    movaps      %xmm3, %xmm5
    movaps      %xmm1, %xmm6
    movaps      %xmm0, %xmm4
    movaps      %xmm5, %xmm7
    movaps      %xmm6, %xmm2
    movaps      %xmm4, %xmm15
    movaps      %xmm7, %xmm12
    movaps      %xmm2, %xmm14
    .endm

    .macro  MI512   h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,m0,m1,t0,t1,t2,t3
    movaps  \t0, \h0
    movaps  \t1, \h1
    xorps   \t0, \h2
    xorps   \t1, \h3
    xorps   \t0, \h4
    xorps   \t1, \h5
    xorps   \t0, \h6
    xorps   \t1, \h7
    xorps   \t0, \h8
    xorps   \t1, \h9
    MULT2   \t0, \t1, \t2, \t3
    xorps   \h0, \t0
    xorps   \h1, \t1
    xorps   \h2, \t0
    xorps   \h3, \t1
    xorps   \h4, \t0
    xorps   \h5, \t1
    xorps   \h6, \t0
    xorps   \h7, \t1
    xorps   \h8, \t0
    xorps   \h9, \t1

    movaps  \t0, \h0
    movaps  \t1, \h1
    MULT2   \h0, \h1, \t2, \t3
    xorps   \h0, \h2
    xorps   \h1, \h3
    MULT2   \h2, \h3, \t2, \t3
    xorps   \h2, \h4
    xorps   \h3, \h5
    MULT2   \h4, \h5, \t2, \t3
    xorps   \h4, \h6
    xorps   \h5, \h7
    MULT2   \h6, \h7, \t2, \t3
    xorps   \h6, \h8
    xorps   \h7, \h9
    MULT2   \h8, \h9, \t2, \t3
    xorps   \h8, \t0
    xorps   \h9, \t1

    movaps  \t0, \h0
    movaps  \t1, \h1
    MULT2   \h0, \h1, \t2, \t3
    xorps   \h0, \h8
    xorps   \h1, \h9
    MULT2   \h8, \h9, \t2, \t3
    xorps   \h8, \h6
    xorps   \h9, \h7
    MULT2   \h6, \h7, \t2, \t3
    xorps   \h6, \h4
    xorps   \h7, \h5
    MULT2   \h4, \h5, \t2, \t3
    xorps   \h4, \h2
    xorps   \h5, \h3
    MULT2   \h2, \h3, \t2, \t3
    xorps   \h2, \t0
    xorps   \h3, \t1

    xorps   \h0, \m0
    xorps   \h1, \m1
    MULT2   \m0, \m1, \t0, \t1
    xorps   \h2, \m0
    xorps   \h3, \m1
    MULT2   \m0, \m1, \t0, \t1
    xorps   \h4, \m0
    xorps   \h5, \m1
    MULT2   \m0, \m1, \t0, \t1
    xorps   \h6, \m0
    xorps   \h7, \m1
    MULT2   \m0, \m1, \t0, \t1
    xorps   \h8, \m0
    xorps   \h9, \m1
    .endm

    //  (r0,r1,r2,r3) -> (r0,r1,r2,r3)
    .macro  TWEAK512    r0,r1,r2,r3,s0,s1,s2,s3
    movaps  \s0, \r0
    movaps  \s1, \r1
    movaps  \s2, \r2
    movaps  \s3, \r3
    pslld   \r0, 1
    pslld   \r1, 2
    pslld   \r2, 3
    pslld   \r3, 4
    psrld   \s0, 31
    psrld   \s1, 30
    psrld   \s2, 29
    psrld   \s3, 28
    orps    \r0, \s0
    orps    \r1, \s1
    orps    \r2, \s2
    orps    \r3, \s3
    .endm

    .macro  STEP512 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,t0,t1,t2,t3,c0,c1,c2,c3
    SBOX5   \r0,\r1,\r2,\r3,\t0,\r5,\r6,\r7,\r4,\t1,\r8,\r9,\r10,\r11,\t2
    MIXWORD512  \t0,\r4,\r0,\r8,\r1,\t1,\r5,\t3,\t2,\r9,\r10,\r11
    MIXWORD3    \r2,\r6,\r0,\r8,\r3,\r7,\r5,\t3,\t2,\r9,\r10,\r11
    pshufd  \r9, \r9, 57        /*r8,r9 v110*/
    movaps  \r0, \t0
    movaps  \r11, \r9           /*r8,r9*/
    punpckldq   \r9, \t2        /*r8,r9*/
    punpckhdq   \r11, \t2       /*r8,r9*/
    movaps  \r5, \t1
    pshufd  \r8, \r9, 78        /*r8,r9*/
    pshufd  \r10, \r11, 78      /*r8,r9*/
    ADDCONSTANTS512 \r0,\r4,\r8,\r11,\c0,\c1,\c2,\c3
    .endm

    //  (r0,r1,r2,r3)->(r4,r1,r2,r3), (s0,s1,s2,s3)->(s4,s1,s2,s3), (u0,u1,u2,u3)->(u4,u1,u2,u3)
    .macro  SBOX5 r0,r1,r2,r3,r4,s0,s1,s2,s3,s4,u0,u1,u2,u3,u4
    movaps  \r4, \r0
    movaps  \s4, \s0
    movaps  \u4, \u0
    orps    \r0, \r1
    orps    \s0, \s1
    orps    \u0, \u1
    xorps   \r2, \r3
    xorps   \s2, \s3
    xorps   \u2, \u3
    xorps   \r1, allone
    xorps   \s1, allone
    xorps   \u1, allone
    xorps   \r0, \r3
    xorps   \s0, \s3
    xorps   \u0, \u3
    andps   \r3, \r4
    andps   \s3, \s4
    andps   \u3, \u4
    xorps   \r1, \r3
    xorps   \s1, \s3
    xorps   \u1, \u3
    xorps   \r3, \r2
    xorps   \s3, \s2
    xorps   \u3, \u2
    andps   \r2, \r0
    andps   \s2, \s0
    andps   \u2, \u0
    xorps   \r0, allone
    xorps   \s0, allone
    xorps   \u0, allone
    xorps   \r2, \r1
    xorps   \s2, \s1
    xorps   \u2, \u1
    orps    \r1, \r3
    orps    \s1, \s3
    orps    \u1, \u3
    xorps   \r4, \r1
    xorps   \s4, \s1
    xorps   \u4, \u1
    xorps   \r3, \r2
    xorps   \s3, \s2
    xorps   \u3, \u2
    andps   \r2, \r1
    andps   \s2, \s1
    andps   \u2, \u1
    xorps   \r1, \r0
    xorps   \s1, \s0
    xorps   \u1, \u0
    .endm

    //  (r0,r1),(s0,s1)->(r0,r1),(s0,s1) and MIXTON_S
    .macro  MIXWORD512 r0,r1,t0,t1,s0,s1,u0,u1,r8,r9,r10,r11
    movaps  \t0, \r0
    movaps  \u0, \s0
    xorps   \r1, \r0
    xorps   \s1, \s0
    pslld   \r0, 2
    pslld   \s0, 2
    psrld   \t0, 30
    psrld   \u0, 30
    movaps  \t1, \r1
    movaps  \u1, \s1
    punpckhdq   \r8, \r9    /*r8,r9*/
    xorps   \r0, \r1
    xorps   \s0, \s1
    pslld   \t1, 14
    pslld   \u1, 14
    punpckhdq   \r10, \r11  /*r8,r9*/
    xorps   \r0, \t0
    xorps   \s0, \u0
    psrld   \r1, 18
    psrld   \s1, 18
    movaps  \r9, \r8        /*r8,r9*/
    xorps   \t1, \r0
    xorps   \u1, \s0
    movaps  \t0, \r0
    movaps  \u0, \s0
    punpckhqdq  \r8, \r10   /*r8,r9*/
    pslld   \r0, 10
    pslld   \s0, 10
    xorps   \r1, \t1
    xorps   \s1, \u1
    punpcklqdq  \r9, \r10   /*r8,r9*/
    psrld   \t0, 22
    psrld   \u0, 22
    xorps   \r0, \r1
    xorps   \s0, \s1
    movaps  \t1, \r1
    movaps  \u1, \s1
    pshufd  \r9, \r9, 147   /*r8,r9 v110*/
    pslld   \r1, 1
    pslld   \s1, 1
    psrld   \t1, 31
    psrld   \u1, 31
    xorps   \r0, \t0
    xorps   \s0, \u0
    xorps   \r1, \t1
    xorps   \s1, \u1
    .endm

    //  (r0,r1),(s0,s1),(p0,p1)->(r0,r1),(s0,s1),(p0,p1)
    .macro  MIXWORD3    r0,r1,t0,t1,s0,s1,u0,u1,p0,p1,q0,q1
    movaps  \t0, \r0
    movaps  \u0, \s0
    movaps  \q0, \p0
    xorps   \r1, \r0
    xorps   \s1, \s0
    xorps   \p1, \p0
    pslld   \r0, 2
    pslld   \s0, 2
    pslld   \p0, 2
    psrld   \t0, 30
    psrld   \u0, 30
    psrld   \q0, 30
    movaps  \t1, \r1
    movaps  \u1, \s1
    movaps  \q1, \p1
    xorps   \r0, \r1
    xorps   \s0, \s1
    xorps   \p0, \p1
    pslld   \t1, 14
    pslld   \u1, 14
    pslld   \q1, 14
    xorps   \r0, \t0
    xorps   \s0, \u0
    xorps   \p0, \q0
    psrld   \r1, 18
    psrld   \s1, 18
    psrld   \p1, 18
    xorps   \t1, \r0
    xorps   \u1, \s0
    xorps   \q1, \p0
    movaps  \t0, \r0
    movaps  \u0, \s0
    movaps  \q0, \p0
    pslld   \r0, 10
    pslld   \s0, 10
    pslld   \p0, 10
    xorps   \r1, \t1
    xorps   \s1, \u1
    xorps   \p1, \q1
    psrld   \t0, 22
    psrld   \u0, 22
    psrld   \q0, 22
    xorps   \r0, \r1
    xorps   \s0, \s1
    xorps   \p0, \p1
    movaps  \t1, \r1
    movaps  \u1, \s1
    movaps  \q1, \p1
    pslld   \r1, 1
    pslld   \s1, 1
    pslld   \p1, 1
    psrld   \t1, 31
    psrld   \u1, 31
    psrld   \q1, 31
    xorps   \r0, \t0
    xorps   \s0, \u0
    xorps   \p0, \q0
    xorps   \r1, \t1
    xorps   \s1, \u1
    xorps   \p1, \q1
    .endm

    .macro  ADDCONSTANTS512 r0,r1,r2,r3,c0,c1,c2,c3
    xorps   \r0,\c0
    xorps   \r1,\c1
    xorps   \r2,\c2
    xorps   \r3,\c3
    .endm

    //  convert normal format to mixed format
    //  (r0,r1,r2,r3,r4,r5,r6,r7,r8,r9)->(r4,t2,r0,r6,r5,t3,r1,r7,r8,r9,r10,r11)
    .macro  NMLTOM5 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,t0,t1,t2,t3
    pshufd  \r9, \r9, 57        /*r8,r9 v110*/
    movaps  \t0, \r2
    movaps  \t1, \r3
    movaps  \t2, \r6
    movaps  \t3, \r7
    movaps  \r11, \r9           /*r8,r9*/
    punpckhdq   \r6, \r4
    punpckhdq   \r7, \r5
    punpckhdq   \r2, \r0
    punpckhdq   \r3, \r1
    punpckldq   \r9, \r8        /*r8,r9*/
    punpckldq   \t2, \r4
    punpckldq   \t3, \r5
    punpckldq   \t0, \r0
    punpckldq   \t1, \r1
    punpckhdq   \r11, \r8       /*r8,r9*/
    movaps  \r4, \t2
    movaps  \r5, \t3
    movaps  \r0, \r6
    movaps  \r1, \r7
    punpcklqdq  \r4, \t0
    punpcklqdq  \r5, \t1
    punpcklqdq  \r0, \r2
    punpcklqdq  \r1, \r3
    pshufd  \r8, \r9, 78        /*r8,r9*/
    punpckhqdq  \t2, \t0
    punpckhqdq  \t3, \t1
    punpckhqdq  \r6, \r2
    punpckhqdq  \r7, \r3
    pshufd  \r10, \r11, 78      /*r8,r9*/
    .endm

    //  convert mixed format to normal format
    //  (r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11) -> (r0,r3,r1,r4,r5,r7,t0,t2,r8,r9)
    .macro  MIXTON5 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,t0,t1,t2,t3
    movaps  \t0, \r0
    movaps  \t1, \r2
    punpckhdq   \r8, \r9    /*r8,r9*/
    movaps  \t2, \r4
    movaps  \t3, \r6
    punpckhdq   \r0, \r1
    punpckhdq   \r2, \r3
    punpckhdq   \r4, \r5
    punpckhdq   \r6, \r7
    punpckhdq   \r10, \r11  /*r8,r9*/
    punpckldq   \t0, \r1
    punpckldq   \t1, \r3
    punpckldq   \t2, \r5
    punpckldq   \t3, \r7
    movaps  \r9, \r8        /*r8,r9*/
    movaps  \r1, \r0
    movaps  \r3, \r4
    movaps  \r5, \t0
    movaps  \r7, \t2
    punpckhqdq  \r8, \r10   /*r8,r9*/
    punpckhqdq  \r0, \r2
    punpckhqdq  \r3, \r6
    punpckhqdq  \r5, \t1
    punpckhqdq  \r7, \t3
    punpcklqdq  \r9, \r10   /*r8,r9*/
    punpcklqdq  \r1, \r2
    punpcklqdq  \r4, \r6
    punpcklqdq  \t0, \t1
    pshufd  \r9, \r9, 147   /*r8,r9 v110*/
    punpcklqdq  \t2, \t3
    .endm

    .macro  MULT2   r0,r1,r2,r3
    movaps  \r2, \r1
    andps   \r2, mask1000
    pshufd  \r2, \r2, 243
    xorps   \r0, \r2
    movaps  \r3, \r1
    movaps  \r2, \r0
    pslldq  \r1, 4
    pslldq  \r0, 4
    psrldq  \r3, 12
    psrldq  \r2, 12
    orps    \r0, \r3
    orps    \r1, \r2
    .endm

    // (r0) -> (r0)
    .macro  BYTESWAPQW r0, r1, r2, r3
    movaps  \r1, \r0
    movaps  \r2, \r0
    movaps  \r3, \r0 
    pslld   \r0, 24
    psrld   \r1, 24
    andps   \r2, mask0010
    pslld   \r2,  8 
    andps   \r3, mask0100
    psrld   \r3,  8 
    orps    \r0, \r1
    orps    \r2, \r3
    orps    \r0, \r2
    .endm

.text
    .globl  luffa256_init
    .type   luffa256_init, @function
    .align  16
luffa256_init:
    movaps  %xmm0, [IV   ]
    movaps  %xmm1, [IV+16]
    movaps  %xmm2, [IV+32]
    movaps  %xmm3, [IV+48]
    movaps  %xmm4, [IV+64]
    movaps  %xmm5, [IV+80]
    movups  [%rdi   ], %xmm0
    movups  [%rdi+16], %xmm1
    movups  [%rdi+32], %xmm2
    movups  [%rdi+48], %xmm3
    movups  [%rdi+64], %xmm4
    movups  [%rdi+80], %xmm5
    ret
    .size   luffa256_init, .-luffa256_init


//luffa-256 round function
    .globl  luffa256
    .type   luffa256, @function
    .align  16
luffa256:
    mov     %rax, 0 
    movups  %xmm0, [%rdi   ]
    movups  %xmm1, [%rdi+16]
    movups  %xmm2, [%rdi+32]
    movups  %xmm3, [%rdi+48]
    movups  %xmm4, [%rdi+64]
    movups  %xmm5, [%rdi+80]

.RND256:
    movups  %xmm8, [%rsi   ]
    movups  %xmm9, [%rsi+16]

    // bytes swap 
    /*
    BYTESWAPQW %xmm8, %xmm12, %xmm13, %xmm14
    BYTESWAPQW %xmm9, %xmm12, %xmm13, %xmm14
    */

    // bytes swap using pshufb instruction 
    pshufb  %xmm8, byte_order 
    pshufb  %xmm9, byte_order 

    ROUND256    %xmm8, %xmm9, constants
    add     %rsi, 32
    add     %rax, 1
    cmp     %rax, %rdx
    jl      .RND256
    
    movups  [%rdi   ], %xmm0
    movups  [%rdi+16], %xmm1
    movups  [%rdi+32], %xmm2
    movups  [%rdi+48], %xmm3
    movups  [%rdi+64], %xmm4
    movups  [%rdi+80], %xmm5
    ret
    .size   luffa256, .-luffa256


    .globl  luffa256_final
    .type   luffa256_final, @function
    .align  16
luffa256_final:
    movups  %xmm0, [%rdi   ]
    movups  %xmm1, [%rdi+16]
    movups  %xmm2, [%rdi+32]
    movups  %xmm3, [%rdi+48]
    movups  %xmm4, [%rdi+64]
    movups  %xmm5, [%rdi+80]

    xorps   %xmm8, %xmm8
    movaps  %xmm9, %xmm8
    ROUND256    %xmm8, %xmm9, constants
    xorps   %xmm0, %xmm2
    xorps   %xmm1, %xmm3
    xorps   %xmm0, %xmm4
    xorps   %xmm1, %xmm5

    // bytes swap
    /*
    BYTESWAPQW %xmm0, %xmm2, %xmm3, %xmm4
    BYTESWAPQW %xmm1, %xmm2, %xmm3, %xmm4
    */

    // bytes swap using pshufb instruction 
    pshufb  %xmm0, byte_order 
    pshufb  %xmm1, byte_order 

    movups  [%rsi   ], %xmm0
    movups  [%rsi+16], %xmm1
    ret
    .size   luffa256_final, .-luffa256_final


    .globl  luffa384_init
    .type   luffa384_init, @function
    .align  16
luffa384_init:
    movaps  %xmm0, [IV    ]
    movaps  %xmm1, [IV+ 16]
    movaps  %xmm2, [IV+ 32]
    movaps  %xmm3, [IV+ 48]
    movaps  %xmm4, [IV+ 64]
    movaps  %xmm5, [IV+ 80]
    movaps  %xmm6, [IV+ 96]
    movaps  %xmm7, [IV+112]
    movups  [%rdi    ], %xmm0
    movups  [%rdi+ 16], %xmm1
    movups  [%rdi+ 32], %xmm2
    movups  [%rdi+ 48], %xmm3
    movups  [%rdi+ 64], %xmm4
    movups  [%rdi+ 80], %xmm5
    movups  [%rdi+ 96], %xmm6
    movups  [%rdi+112], %xmm7
    ret
    .size   luffa384_init, .-luffa384_init


//luffa-384 round function
    .globl  luffa384
    .type   luffa384, @function
    .align  16
luffa384:
    mov %rax, 0
    movups  %xmm0, [%rdi    ]
    movups  %xmm1, [%rdi+ 16]
    movups  %xmm2, [%rdi+ 32]
    movups  %xmm3, [%rdi+ 48]
    movups  %xmm4, [%rdi+ 64]
    movups  %xmm5, [%rdi+ 80]
    movups  %xmm6, [%rdi+ 96]
    movups  %xmm7, [%rdi+112]
.RND384:
    movups  %xmm8, [%rsi   ]
    movups  %xmm9, [%rsi+16]

    // bytes swap
    /*
    BYTESWAPQW %xmm8, %xmm12, %xmm13, %xmm14
    BYTESWAPQW %xmm9, %xmm12, %xmm13, %xmm14
    */

    // bytes swap using pshufb instruction 
    pshufb  %xmm8, byte_order 
    pshufb  %xmm9, byte_order 

    ROUND384    %xmm8, %xmm9, constants
    add     %rsi, 32
    add     %rax, 1
    cmp     %rax, %rdx
    jl      .RND384

    movups  [%rdi    ], %xmm0
    movups  [%rdi+ 16], %xmm1
    movups  [%rdi+ 32], %xmm2
    movups  [%rdi+ 48], %xmm3
    movups  [%rdi+ 64], %xmm4
    movups  [%rdi+ 80], %xmm5
    movups  [%rdi+ 96], %xmm6
    movups  [%rdi+112], %xmm7
    ret
    .size   luffa384, .-luffa384


    .globl  luffa384_final
    .type   luffa384_final, @function
    .align  16
luffa384_final:
    movups  %xmm0, [%rdi    ]
    movups  %xmm1, [%rdi+ 16]
    movups  %xmm2, [%rdi+ 32]
    movups  %xmm3, [%rdi+ 48]
    movups  %xmm4, [%rdi+ 64]
    movups  %xmm5, [%rdi+ 80]
    movups  %xmm6, [%rdi+ 96]
    movups  %xmm7, [%rdi+112]

    xorps   %xmm8, %xmm8
    movaps  %xmm9, %xmm8
    ROUND384    %xmm8, %xmm9, constants
    movaps  %xmm10, %xmm0
    movaps  %xmm11, %xmm1
    xorps   %xmm10, %xmm2
    xorps   %xmm11, %xmm3
    xorps   %xmm10, %xmm4
    xorps   %xmm11, %xmm5
    xorps   %xmm10, %xmm6
    xorps   %xmm11, %xmm7

    // bytes swap
    /*
    BYTESWAPQW %xmm10, %xmm12, %xmm13, %xmm14
    BYTESWAPQW %xmm11, %xmm12, %xmm13, %xmm14
    */

    // bytes swap using pshufb instruction 
    pshufb  %xmm10, byte_order 
    pshufb  %xmm11, byte_order 

    movups  [%rsi   ], %xmm10
    movups  [%rsi+16], %xmm11

    xorps   %xmm8, %xmm8
    movaps  %xmm9, %xmm8
    ROUND384    %xmm8, %xmm9, constants
    xorps   %xmm0, %xmm2
    xorps   %xmm1, %xmm3
    xorps   %xmm0, %xmm4
    xorps   %xmm1, %xmm5
    xorps   %xmm0, %xmm6
    xorps   %xmm1, %xmm7

    // bytes swap
    /*
    BYTESWAPQW %xmm0, %xmm12, %xmm13, %xmm14
    */

    // bytes swap using pshufb instruction 
    pshufb  %xmm0, byte_order 

    movups  [%rsi+32], %xmm0
    ret
    .size   luffa384_final, .-luffa384_final


    .globl  luffa512_init
    .type   luffa512_init, @function
    .align  16
luffa512_init:
    movaps  %xmm0, [IV    ]
    movaps  %xmm1, [IV+ 16]
    movaps  %xmm2, [IV+ 32]
    movaps  %xmm3, [IV+ 48]
    movaps  %xmm4, [IV+ 64]
    movaps  %xmm5, [IV+ 80]
    movaps  %xmm6, [IV+ 96]
    movaps  %xmm7, [IV+112]
    movaps  %xmm8, [IV+128]
    movaps  %xmm9, [IV+144]
    movups  [%rdi    ], %xmm0
    movups  [%rdi+ 16], %xmm1
    movups  [%rdi+ 32], %xmm2
    movups  [%rdi+ 48], %xmm3
    movups  [%rdi+ 64], %xmm4
    movups  [%rdi+ 80], %xmm5
    movups  [%rdi+ 96], %xmm6
    movups  [%rdi+112], %xmm7
    movups  [%rdi+128], %xmm8
    movups  [%rdi+144], %xmm9
    ret
    .size   luffa512_init, .-luffa512_init


//luffa-512 round function
    .globl  luffa512
    .type   luffa512, @function
    .align  16
luffa512:
    mov %rax, 0
    movups  %xmm0, [%rdi    ]
    movups  %xmm1, [%rdi+ 16]
    movups  %xmm2, [%rdi+ 32]
    movups  %xmm3, [%rdi+ 48]
    movups  %xmm4, [%rdi+ 64]
    movups  %xmm5, [%rdi+ 80]
    movups  %xmm6, [%rdi+ 96]
    movups  %xmm7, [%rdi+112]
    movups  %xmm8, [%rdi+128]
    movups  %xmm9, [%rdi+144]
.RND512:
    movups  %xmm14, [%rsi   ]
    movups  %xmm15, [%rsi+16]

    // bytes swap
    /*
    BYTESWAPQW %xmm14, %xmm11, %xmm12, %xmm13
    BYTESWAPQW %xmm15, %xmm11, %xmm12, %xmm13
    */

    // bytes swap using pshufb instruction 
    pshufb  %xmm14, byte_order 
    pshufb  %xmm15, byte_order 

    ROUND512    %xmm14, %xmm15, constants
    add     %rsi, 32
    add     %rax, 1
    cmp     %rax, %rdx
    jl      .RND512

    movups  [%rdi    ], %xmm0
    movups  [%rdi+ 16], %xmm1
    movups  [%rdi+ 32], %xmm2
    movups  [%rdi+ 48], %xmm3
    movups  [%rdi+ 64], %xmm4
    movups  [%rdi+ 80], %xmm5
    movups  [%rdi+ 96], %xmm6
    movups  [%rdi+112], %xmm7
    movups  [%rdi+128], %xmm8
    movups  [%rdi+144], %xmm9
    ret
    .size   luffa512, .-luffa512


    .globl  luffa512_final
    .type   luffa512_final, @function
    .align  16
luffa512_final:
    movups  %xmm0, [%rdi    ]
    movups  %xmm1, [%rdi+ 16]
    movups  %xmm2, [%rdi+ 32]
    movups  %xmm3, [%rdi+ 48]
    movups  %xmm4, [%rdi+ 64]
    movups  %xmm5, [%rdi+ 80]
    movups  %xmm6, [%rdi+ 96]
    movups  %xmm7, [%rdi+112]
    movups  %xmm8, [%rdi+128]
    movups  %xmm9, [%rdi+144]

    xorps   %xmm14, %xmm14
    movaps  %xmm15, %xmm14
    ROUND512    %xmm14, %xmm15, constants
    movaps  %xmm10, %xmm0
    movaps  %xmm11, %xmm1
    xorps   %xmm10, %xmm2
    xorps   %xmm11, %xmm3
    xorps   %xmm10, %xmm4
    xorps   %xmm11, %xmm5
    xorps   %xmm10, %xmm6
    xorps   %xmm11, %xmm7
    xorps   %xmm10, %xmm8
    xorps   %xmm11, %xmm9

    // bytes swap
    /*
    BYTESWAPQW %xmm10, %xmm12, %xmm13, %xmm14
    BYTESWAPQW %xmm11, %xmm12, %xmm13, %xmm14
    */

    // bytes swap using pshufb instruction 
    pshufb  %xmm10, byte_order 
    pshufb  %xmm11, byte_order 

    movups  [%rsi   ], %xmm10
    movups  [%rsi+16], %xmm11

    xorps   %xmm14, %xmm14
    movaps  %xmm15, %xmm14
    ROUND512    %xmm14, %xmm15, constants
    xorps   %xmm0, %xmm2
    xorps   %xmm1, %xmm3
    xorps   %xmm0, %xmm4
    xorps   %xmm1, %xmm5
    xorps   %xmm0, %xmm6
    xorps   %xmm1, %xmm7
    xorps   %xmm0, %xmm8
    xorps   %xmm1, %xmm9

    // bytes swap
    /*
    BYTESWAPQW %xmm0, %xmm12, %xmm13, %xmm14
    BYTESWAPQW %xmm1, %xmm12, %xmm13, %xmm14
    */

    // bytes swap using pshufb instruction 
    pshufb  %xmm0, byte_order 
    pshufb  %xmm1, byte_order 

    movups  [%rsi+32], %xmm0
    movups  [%rsi+48], %xmm1
    ret
    .size   luffa512_final, .-luffa512_final


    .section    .rodata
    .align  16
mask1000:
    .long   0x0,0x0,0x0,0xffffffff
mask0010:
    .long   0x0000ff00,0x0000ff00,0x0000ff00,0x0000ff00
mask0100:
    .long   0x00ff0000,0x00ff0000,0x00ff0000,0x00ff0000
allone:
    .byte   0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff
byte_order:
    .byte   0x03,0x02,0x01,0x00,0x07,0x06,0x05,0x04,0x0b,0x0a,0x09,0x08,0x0f,0x0e,0x0d,0x0c

    .globl  constants
    .align  32
    .type   constants, @object
    .size   constants, 512
constants:
    .long   0xb213afa5,0xfc20d9d2,0xb6de10ed,0x303994a6
    .long   0xe028c9bf,0xe25e72c1,0x01685f3d,0xe0337818
    .long   0xc84ebe95,0x34552e25,0x70f47aae,0xc0e65299
    .long   0x44756f91,0xe623bb72,0x05a17cf4,0x441ba90d
    .long   0x4e608a22,0x7ad8818f,0x0707a3d4,0x6cc33a12
    .long   0x7e8fce32,0x5c58a4a4,0xbd09caca,0x7f34d442
    .long   0x56d858fe,0x8438764a,0x1c1e8f51,0xdc56983e
    .long   0x956548be,0x1e38e2e7,0xf4272b28,0x9389217f
    .long   0x343b138f,0xbb6de032,0x707a3d45,0x1e00108f
    .long   0xfe191be2,0x78e38b9d,0x144ae5cc,0xe5a8bce6
    .long   0xd0ec4e3d,0xedb780c8,0xaeb28562,0x7800423d
    .long   0x3cb226e5,0x27586719,0xfaa7ae2b,0x5274baf4
    .long   0x2ceb4882,0xd9847356,0xbaca1589,0x8f5b7882
    .long   0x5944a28e,0x36eda57f,0x2e48f1c1,0x26889ba7
    .long   0xb3ad2208,0xa2c78434,0x40a46f3e,0x96e1db12
    .long   0xa1c4c355,0x703aace7,0xb923c704,0x9a226e9d
    .long   0x0,0x0,0x0,0xf0d2e9e3
    .long   0x0,0x0,0x5090d577,0x0
    .long   0x0,0x0,0x0,0xac11d7fa
    .long   0x0,0x0,0x2d1925ab,0x0
    .long   0x0,0x0,0x0,0x1bcb66f2
    .long   0x0,0x0,0xb46496ac,0x0
    .long   0x0,0x0,0x0,0x6f2d9bc9
    .long   0x0,0x0,0xd1925ab0,0x0
    .long   0x0,0x0,0x0,0x78602649
    .long   0x0,0x0,0x29131ab6,0x0
    .long   0x0,0x0,0x0,0x8edae952
    .long   0x0,0x0,0x0fc053c3,0x0
    .long   0x0,0x0,0x0,0x3b6ba548
    .long   0x0,0x0,0x3f014f0c,0x0
    .long   0x0,0x0,0x0,0xedae9520
    .long   0x0,0x0,0xfc053c31,0x0

    .globl  IV
    .align  32
    .type   IV, @object
    .size   IV, 160
IV:
    .long   0x6d251e69,0x44b051e0,0x4eaa6fb4,0xdbf78465
    .long   0x6e292011,0x90152df4,0xee058139,0xdef610bb
    .long   0xc3b44b95,0xd9d2f256,0x70eee9a0,0xde099fa3
    .long   0x5d9b0557,0x8fc944b3,0xcf1ccf0e,0x746cd581
    .long   0xf7efc89d,0x5dba5781,0x04016ce5,0xad659c05
    .long   0x0306194f,0x666d1836,0x24aa230a,0x8b264ae7
    .long   0x858075d5,0x36d79cce,0xe571f7d7,0x204b1f67
    .long   0x35870c6a,0x57e9e923,0x14bcb808,0x7cde72ce
    .long   0x6c68e9be,0x5ec41e22,0xc825b7c7,0xaffb4363
    .long   0xf5df3999,0x0fc688f1,0xb07224cc,0x03e86cea
