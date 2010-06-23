/*
 * luffa_x86asm.s
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
    MI256       %xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,\m0,\m1,%xmm6,%xmm7
    TWEAK256    %xmm3,%xmm5,%xmm6,%xmm7
    NMLTOM256   %xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7
    movaps  %xmm2, [%esp]
    STEP %xmm6,%xmm0,%xmm4,%xmm2,%xmm7,%xmm1,%xmm5,%xmm3,[\c    ],[\c+ 16]
    STEP %xmm6,%xmm0,%xmm4,%xmm2,%xmm7,%xmm1,%xmm5,%xmm3,[\c+ 32],[\c+ 48]
    STEP %xmm6,%xmm0,%xmm4,%xmm2,%xmm7,%xmm1,%xmm5,%xmm3,[\c+ 64],[\c+ 80]
    STEP %xmm6,%xmm0,%xmm4,%xmm2,%xmm7,%xmm1,%xmm5,%xmm3,[\c+ 96],[\c+112]
    STEP %xmm6,%xmm0,%xmm4,%xmm2,%xmm7,%xmm1,%xmm5,%xmm3,[\c+128],[\c+144]
    STEP %xmm6,%xmm0,%xmm4,%xmm2,%xmm7,%xmm1,%xmm5,%xmm3,[\c+160],[\c+176]
    STEP %xmm6,%xmm0,%xmm4,%xmm2,%xmm7,%xmm1,%xmm5,%xmm3,[\c+192],[\c+208]
    STEP %xmm6,%xmm0,%xmm4,%xmm2,%xmm7,%xmm1,%xmm5,%xmm3,[\c+224],[\c+240]
    movaps  [%esp], %xmm5
    MIXTON256   %xmm6,%xmm0,%xmm4,%xmm2,%xmm7,%xmm1,%xmm5,%xmm3
    movaps  %xmm2, %xmm6
    movaps  %xmm3, %xmm7
    movaps  %xmm4, [%esp]
    .endm

    .macro  MI256   h0,h1,h2,h3,h4,h5,m0,m1,t0,t1
    movaps  \t0, \h0
    movaps  \t1, \h1
    xorps   \t0, \h4
    xorps   \t1, \h5
    xorps   \t0, \h2
    xorps   \t1, \h3
    movaps  [%esp], \h4     /*h4 and h5 become open.*/
    movaps  [%esp+16], \h5
    MULT2   \t0, \t1, \h4, \h5
    xorps   \h0, \t0
    xorps   \h1, \t1
    xorps   \h2, \t0
    xorps   \h3, \t1
    xorps   \t0, [%esp]
    xorps   \t1, [%esp+16]

    movaps  \h4, \m0
    movaps  \h5, \m1
    movaps  [%esp], \t0
    movaps  [%esp+16], \t1
    xorps   \h0, \h4
    xorps   \h1, \h5
    MULT2   \h4, \h5, \t0, \t1
    xorps   \h2, \h4
    xorps   \h3, \h5
    MULT2   \h4, \h5, \t0, \t1
    xorps   \h4, [%esp]
    xorps   \h5, [%esp+16]
    .endm

    .macro  TWEAK256    r0,r1,s0,s1
    movaps  \s0, \r0
    movaps  \s1, \r1
    pslld   \r0, 1
    pslld   \r1, 2
    psrld   \s0, 31
    psrld   \s1, 30
    orps    \r0, \s0
    orps    \r1, \s1
    .endm

    //  convert normal format to mixed format
    //  (r0,r1,r2,r3,r4,r5)->(t0,r0,r4,%esp,t1,r1,r5,%esp+16)
    .macro  NMLTOM256   r0,r1,r2,r3,r4,r5,t0,t1
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
    movaps  [%esp], \r4
    movaps  [%esp+16], \r5
    movaps  \r4, \r0
    movaps  \r5, \r1
    punpcklqdq  \r4, \t0    /*(2,10,18,16)*/
    punpcklqdq  \r5, \t1    /*(6,14,22,20)*/
    pshufd  \t0, \r0, 225   /*(17,19,16,18)*/
    pshufd  \t1, \r1, 225   /*(21,23,20,22)*/
    punpckhqdq  \r0, \r2    /*(1,9,17,19)*/
    punpckhqdq  \r1, \r3    /*(5,13,21,23)*/
    punpcklqdq  \t0, \r2    /*(0,8,16,18)*/
    punpcklqdq  \t1, \r3    /*(4,12,20,22)*/
    .endm

    //  convert mixed format to normal format
    //  (r0,r1,r2,r3,r4,r5,%esp,%esp+16) -> (r1,r5,r0,r4,%esp,t0)
    .macro  MIXTON256   r0,r1,r2,r3,r4,r5,t0,t1
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

    movaps  \r2, [%esp]
    movaps  \r3, [%esp+16]
    movaps  [%esp], \t0
    movaps  \t0, \r4
    movaps  \t1, \r2
    punpckhdq   \r4, \r5
    punpckhdq   \r2, \r3
    punpckldq   \t0, \r5
    punpckldq   \t1, \r3
    movaps  \r5, \r4
    punpcklqdq  \r4, \r2
    punpckhqdq  \r5, \r2
    punpckhqdq  \t0, \t1
    .endm

    .macro  ROUND384    m0,m1,c
    MI384   %xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,\m0,\m1
    movaps  [%esp], %xmm2
    TWEAK384    %xmm3,%xmm5,%xmm7,%xmm0,%xmm1,%xmm2
    movaps  %xmm1, [%esp+48]
    movaps  [%esp+16], %xmm4
    movaps  [%esp+48], %xmm6
    //  (%esp+32,xmm1,%esp,xmm3,%esp+16,xmm5,%esp+48,xmm7)
    NMLTOM384    %xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7
    //  (xmm6,xmm4,xmm2,xmm7,%esp,%esp+32,%esp+48,%esp+16)
    movaps  %xmm0, [%esp]
    movaps  %xmm1, [%esp+32]
    movaps  %xmm3, [%esp+48]
    STEP %xmm6,%xmm4,%xmm2,%xmm7,%xmm0,%xmm1,%xmm3,%xmm5,[\c    ],[\c+ 16]
    STEP %xmm6,%xmm4,%xmm2,%xmm7,%xmm0,%xmm1,%xmm3,%xmm5,[\c+ 32],[\c+ 48]
    STEP %xmm6,%xmm4,%xmm2,%xmm7,%xmm0,%xmm1,%xmm3,%xmm5,[\c+ 64],[\c+ 80]
    STEP %xmm6,%xmm4,%xmm2,%xmm7,%xmm0,%xmm1,%xmm3,%xmm5,[\c+ 96],[\c+112]
    STEP %xmm6,%xmm4,%xmm2,%xmm7,%xmm0,%xmm1,%xmm3,%xmm5,[\c+128],[\c+144]
    STEP %xmm6,%xmm4,%xmm2,%xmm7,%xmm0,%xmm1,%xmm3,%xmm5,[\c+160],[\c+176]
    STEP %xmm6,%xmm4,%xmm2,%xmm7,%xmm0,%xmm1,%xmm3,%xmm5,[\c+192],[\c+208]
    STEP %xmm6,%xmm4,%xmm2,%xmm7,%xmm0,%xmm1,%xmm3,%xmm5,[\c+224],[\c+240]
    //  (xmm6,xmm4,xmm2,xmm7,xmm0,xmm1,xmm3,%esp+16)
    movaps  [%esp], %xmm3
    MIXTON384   %xmm6,%xmm4,%xmm2,%xmm7,%xmm0,%xmm1,%xmm3,%xmm5
    //  (xmm6,xmm0,xmm4,xmm1,%esp+32,xmm2,%esp+48,xmm5)
    movaps  %xmm3, %xmm1
    movaps  %xmm7, %xmm5
    movaps  %xmm1, %xmm0
    movaps  %xmm5, %xmm2
    movaps  %xmm0, %xmm6
    movaps  %xmm2, %xmm4
    movaps  %xmm6, [%esp+48]
    movaps  %xmm4, [%esp+32]
    .endm

    //  (h0,..,h7) -> (%esp+32, %esp+48, h2,..,h7)
    .macro  MI384   h0,h1,h2,h3,h4,h5,h6,h7,m0,m1
    movaps  [%esp+32], \h6
    movaps  [%esp+48], \h7
    xorps   \h6, \h4
    xorps   \h7, \h5
    movaps  [%esp], \h4 /*h4 and h5 become open.*/
    movaps  [%esp+16], \h5
    xorps   \h6, \h0
    xorps   \h7, \h1
    xorps   \h6, \h2
    xorps   \h7, \h3
    MULT2   \h6, \h7, \h4, \h5
    movaps  \h4, [%esp]
    movaps  \h5, [%esp+16]
    xorps   \h0, \h6
    xorps   \h1, \h7
    xorps   \h2, \h6
    xorps   \h3, \h7
    movaps  [%esp], \h0
    movaps  [%esp+16], \h1
    movaps  [%esp+64], \h2
    movaps  [%esp+80], \h3
    xorps   \h4, \h6
    xorps   \h5, \h7
    xorps   \h6, [%esp+32]
    xorps   \h7, [%esp+48]

    MULT2   \h0, \h1, \h2, \h3
    xorps   \h0, \h6
    xorps   \h1, \h7
    MULT2   \h6, \h7, \h2, \h3
    movaps  [%esp+32], \h0
    movaps  [%esp+48], \h1
    xorps   \h6, \h4
    xorps   \h7, \h5
    movaps  \h2, [%esp+64]
    movaps  \h3, [%esp+80]
    MULT2   \h4, \h5, \h0, \h1
    movaps  [%esp+64], \h6
    movaps  [%esp+80], \h7
    xorps   \h4, \h2
    xorps   \h5, \h3
    movaps  \h0, [%esp+32]
    movaps  \h1, [%esp+48]
    MULT2   \h2, \h3, \h6, \h7
    xorps   \h2, [%esp]
    xorps   \h3, [%esp+16]

    movaps  \h6, \m0
    movaps  \h7, \m1
    xorps   \h0, \h6
    xorps   \h1, \h7
    movaps  [%esp+32], \h0
    movaps  [%esp+48], \h1
    MULT2   \h6, \h7, \h0, \h1
    xorps   \h2, \h6
    xorps   \h3, \h7
    MULT2   \h6, \h7, \h0, \h1
    xorps   \h4, \h6
    xorps   \h5, \h7
    MULT2   \h6, \h7, \h0, \h1
    xorps   \h6, [%esp+64]
    xorps   \h7, [%esp+80]
    .endm

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
    orps    \r0, \s0
    orps    \r1, \s1
    orps    \r2, \s2
    .endm

    //  convert normal format to mixed format
    //  (%esp+32,r1,%esp,r3,%esp+16,r5,%esp+48,r7)->(r6,r4,r2,r7,%esp,%esp+32,%esp+48,%esp+16)
    .macro  NMLTOM384   r0,r1,r2,r3,r4,r5,r6,r7
    movaps  \r0, \r3
    movaps  \r4, \r7
    punpckhdq   \r3, \r1
    punpckhdq   \r7, \r5
    punpckldq   \r0, \r1
    punpckldq   \r4, \r5
    movaps  \r2, \r7
    movaps  \r6, \r4
    movaps  \r5, [%esp+16]
    punpckhqdq  \r4, \r0
    movaps  \r1, [%esp+32]
    punpckhqdq  \r7, \r3
    punpcklqdq  \r2, \r3
    punpcklqdq  \r6, \r0
    movaps  [%esp+16], \r7
    movaps  \r3, [%esp]
    movaps  \r7, [%esp+48]
    movaps  [%esp], \r6
    movaps  [%esp+32], \r4
    movaps  [%esp+48], \r2
    movaps  \r0, \r3
    movaps  \r4, \r7
    punpckhdq   \r3, \r1
    punpckhdq   \r7, \r5
    punpckldq   \r0, \r1
    punpckldq   \r4, \r5
    movaps  \r2, \r7
    movaps  \r6, \r4
    punpckhqdq  \r4, \r0
    punpckhqdq  \r7, \r3
    punpcklqdq  \r2, \r3
    punpcklqdq  \r6, \r0
    .endm

    //  convert mixed format to normal format
    //  (r0,r1,r2,r3,r4,r5,%esp,%esp+16)->(r0,r4,r1,r5,%esp+32,r2,%esp+48,r7)
    .macro  MIXTON384   r0,r1,r2,r3,r4,r5,r6,r7
    movaps  \r6, \r0
    movaps  \r7, \r2
    punpckhdq   \r0, \r1
    punpckhdq   \r2, \r3
    punpckldq   \r6, \r1
    punpckldq   \r7, \r3
    movaps  \r1, \r0
    movaps  \r3, \r6
    punpckhqdq  \r0, \r2
    punpckhqdq  \r6, \r7
    punpcklqdq  \r1, \r2
    punpcklqdq  \r3, \r7
    movaps  [%esp+32], \r6
    movaps  \r7, [%esp+16]
    movaps  \r6, [%esp]
    movaps  [%esp+48], \r3
    movaps  \r2, \r4
    movaps  \r3, \r6
    punpckhdq   \r4, \r5
    punpckhdq   \r6, \r7
    punpckldq   \r2, \r5
    punpckldq   \r3, \r7
    movaps  \r5, \r4
    movaps  \r7, \r2
    punpckhqdq  \r4, \r6
    punpckhqdq  \r2, \r3
    punpcklqdq  \r5, \r6
    punpcklqdq  \r7, \r3
    .endm

    //  r0,r1,r2,r3,r4,r5,r6,%esp+16 -> r0,r1,r2,r3,r4,r5,r6,%esp+16 or r7
    //  r7 is empty at the beginning, 7 is stored at %esp+16
    .macro  STEP r0,r1,r2,r3,r4,r5,r6,r7,c0,c1
    SBOX    \r0,\r1,\r2,\r3,\r7 /*(0,1,2,3)=(r7,r1,r2,r3)*/
    movaps  \r0, [%esp+16]
    movaps  [%esp+16], \r3
    movaps  [%esp], \r2
    SBOX    \r5,\r6,\r0,\r4,\r2 /*(4,5,6,7)=(r4,r2,r6,r0)*/
    movaps  [%esp+48], \r0
    movaps  [%esp+32], \r6
    MIXWORD \r7,\r4,\r3,\r5,\r1,\r2,\r0,\r6 /*(0,1) = (r7,r1), (4,5)=(r4,r2)*/
    movaps  \r0, [%esp+48]
    movaps  \r5, [%esp]
    movaps  \r3, [%esp+16]
    movaps  \r6, [%esp+32]
    movaps  [%esp+48], \r2
    movaps  [%esp], \r7
    movaps  [%esp+16], \r1
    movaps  [%esp+32], \r4
    movaps  \r2, \r5
    movaps  \r7, \r0
    MIXWORD \r2,\r6,\r0,\r1,\r3,\r7,\r4,\r5 /*(2,3)=(r2,r3), (6,7)=(r6,r0)*/
    movaps  \r0, [%esp]
    movaps  \r1, [%esp+16]
    movaps  \r4, [%esp+32]
    movaps  \r5, [%esp+48]
    movaps  [%esp+16], \r7
    ADDCONSTANTS    \r0,\r4,\c0,\c1
    .endm

    .macro  ADDCONSTANTS    r0,r1,c0,c1
    xorps   \r0,\c0
    xorps   \r1,\c1
    .endm

    .macro  ROUND512    v8,v9,m0,m1,c
    MI512   %xmm0,%xmm1,%xmm2,%xmm3,%xmm4,%xmm5,%xmm6,%xmm7,\v8,\v9,\m0,\m1
    movaps  [%esp+64], %xmm6
    movaps  %xmm1, [%esp+48]
    movaps  [%esp+80], %xmm2
    movaps  \v8, %xmm4
    //(%esp,%esp+16,%esp+32,xmm1,%esp+64,xmm7,%esp+80,xmm3,v8,xmm5)
    TWEAK512    %xmm1,%xmm7,%xmm3,%xmm5,%xmm0,%xmm2,%xmm4,%xmm6
    movaps  \v9, %xmm5
    movaps  %xmm5, [%esp+16]
    NMLTOM512    %xmm0,%xmm5,%xmm2,%xmm1,%xmm4,%xmm7,%xmm6,%xmm3,\v8,\v9
    //(6,4,2,3,%esp,%esp+32,%esp+48,%esp+16,7,5,0,1)
    movaps  [%esp+64], %xmm3
    STEP512 %xmm6,%xmm4,%xmm2,%xmm3,%xmm7,%xmm5,%xmm0,%xmm1,\v8,\v9,[\c    ],[\c+ 16],[\c+256],[\c+272]
    STEP512 %xmm6,%xmm4,%xmm2,%xmm3,%xmm7,%xmm5,%xmm0,%xmm1,\v8,\v9,[\c+ 32],[\c+ 48],[\c+288],[\c+304]
    STEP512 %xmm6,%xmm4,%xmm2,%xmm3,%xmm7,%xmm5,%xmm0,%xmm1,\v8,\v9,[\c+ 64],[\c+ 80],[\c+320],[\c+336]
    STEP512 %xmm6,%xmm4,%xmm2,%xmm3,%xmm7,%xmm5,%xmm0,%xmm1,\v8,\v9,[\c+ 96],[\c+112],[\c+352],[\c+368]
    STEP512 %xmm6,%xmm4,%xmm2,%xmm3,%xmm7,%xmm5,%xmm0,%xmm1,\v8,\v9,[\c+128],[\c+144],[\c+384],[\c+400]
    STEP512 %xmm6,%xmm4,%xmm2,%xmm3,%xmm7,%xmm5,%xmm0,%xmm1,\v8,\v9,[\c+160],[\c+176],[\c+416],[\c+432]
    STEP512 %xmm6,%xmm4,%xmm2,%xmm3,%xmm7,%xmm5,%xmm0,%xmm1,\v8,\v9,[\c+192],[\c+208],[\c+448],[\c+464]
    STEP512 %xmm6,%xmm4,%xmm2,%xmm3,%xmm7,%xmm5,%xmm0,%xmm1,\v8,\v9,[\c+224],[\c+240],[\c+480],[\c+496]
    //(6,4,2,3,%esp,%esp+32,%esp+48,%esp+16,7,5,0,1)
    MIXTON_S512 %xmm7, %xmm5, %xmm0, %xmm1
    movaps  %xmm0, [%esp]
    movaps  %xmm1, [%esp+32]
    movaps  \v8, %xmm7
    movaps  \v9, %xmm5
    //(6,4,2,3,0,1,%esp+48,%esp+16,v8,v9)
    //  (r0,r1,r2,r3,r4,r5,%esp+48,%esp+16)->(r0,r4,r1,r5,%esp,r2,%esp+32,r7)
    MIXTON512   %xmm6,%xmm4,%xmm2,%xmm3,%xmm0,%xmm1,%xmm5,%xmm7
    //  (6,0,4,1,%esp,2,%esp+16,7)
    movaps  %xmm3, %xmm1
    movaps  %xmm5, %xmm2
    movaps  %xmm1, %xmm0
    movaps  %xmm2, %xmm4
    movaps  %xmm0, %xmm6
    movaps  %xmm4, [%esp]
    movaps  %xmm6, [%esp+32]
    .endm

    //  (h0,..,h7,v8,v9) -> (%esp,%esp+16,%esp+32,%esp+48,h6,h7,h2,h3,h4,h5)
    .macro  MI512   h0,h1,h2,h3,h4,h5,h6,h7,v8,v9,m0,m1
    movaps  [%esp+32], \h6
    movaps  [%esp+48], \h7
    xorps   \h6, \h4
    xorps   \h7, \h5
    movaps  [%esp], \h4 /*h4 and h5 become open.*/
    movaps  [%esp+16], \h5  /*          */
    xorps   \h6, \v8
    xorps   \h7, \v9
    xorps   \h6, \h0
    xorps   \h7, \h1
    xorps   \h6, \h2
    xorps   \h7, \h3
    MULT2   \h6, \h7, \h4, \h5
    movaps  \h4, [%esp+32]  /*67*/
    movaps  \h5, [%esp+48]
    xorps   \h0, \h6
    xorps   \h1, \h7
    xorps   \h4, \h6
    xorps   \h5, \h7
    movaps  [%esp+32], \h0  /*01*/
    movaps  [%esp+48], \h1
    movaps  [%esp+64], \h4  /*67*/
    movaps  [%esp+80], \h5
    movaps  \h4, \v8    /*89*/
    movaps  \h5, \v9
    xorps   \h2, \h6    /*23*/
    xorps   \h3, \h7
    xorps   \h4, \h6    /*89*/
    xorps   \h5, \h7
    xorps   \h6, [%esp] /*45*/
    xorps   \h7, [%esp+16]
    movaps  \v8, \h4    /*89*/
    movaps  \v9, \h5

    MULT2   \h0, \h1, \h4, \h5  /*01*/
    xorps   \h0, \h2
    xorps   \h1, \h3
    MULT2   \h2, \h3, \h4, \h5  /*23*/
    movaps  [%esp], \h0         /*01*/
    movaps  [%esp+16], \h1
    xorps   \h2, \h6
    xorps   \h3, \h7
    movaps  \h0, [%esp+64]      /*67*/
    movaps  \h1, [%esp+80]
    MULT2   \h6, \h7, \h4, \h5  /*45*/
    movaps  [%esp+64], \h2      /*23*/
    movaps  [%esp+80], \h3
    xorps   \h6, \h0
    xorps   \h7, \h1
    movaps  \h2, \v8        /*89*/
    movaps  \h3, \v9
    MULT2   \h0, \h1, \h4, \h5
    xorps   \h0, \h2
    xorps   \h1, \h3
    MULT2   \h2, \h3, \h4, \h5
    xorps   \h2, [%esp+32]
    xorps   \h3, [%esp+48]
    movaps  [%esp+32], \h2
    movaps  [%esp+48], \h3

    MULT2   \h2, \h3, \h4, \h5
    xorps   \h2, \h0
    xorps   \h3, \h1
    MULT2   \h0, \h1, \h4, \h5
    movaps  \v8, \h2        /*89*/
    movaps  \v9, \h3
    xorps   \h0, \h6
    xorps   \h1, \h7
    movaps  \h2, [%esp+64]  /*23*/
    movaps  \h3, [%esp+80]
    MULT2   \h6, \h7, \h4, \h5
    movaps  [%esp+64], \h0  /*67*/
    movaps  [%esp+80], \h1
    xorps   \h6, \h2        /*45*/
    xorps   \h7, \h3
    movaps  \h0, [%esp]
    movaps  \h1, [%esp+16]
    MULT2   \h2, \h3, \h4, \h5
    xorps   \h2, \h0        /*23*/
    xorps   \h3, \h1
    MULT2   \h0, \h1, \h4, \h5
    xorps   \h0, [%esp+32]  /*01*/
    xorps   \h1, [%esp+48]

    movaps  \h4, \m0
    movaps  \h5, \m1
    xorps   \h0, \h4        /*01*/
    xorps   \h1, \h5
    movaps  [%esp], \h0
    movaps  [%esp+16], \h1
    MULT2   \h4, \h5, \h0, \h1
    xorps   \h2, \h4        /*23*/
    xorps   \h3, \h5
    movaps  [%esp+32], \h2
    movaps  [%esp+48], \h3
    MULT2   \h4, \h5, \h0, \h1
    xorps   \h6, \h4        /*45*/
    xorps   \h7, \h5
    movaps  \h2, [%esp+64]
    movaps  \h3, [%esp+80]
    MULT2   \h4, \h5, \h0, \h1
    xorps   \h2, \h4
    xorps   \h3, \h5
    MULT2   \h4, \h5, \h0, \h1
    xorps   \h4, \v8
    xorps   \h5, \v9
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

    //  r0,r1,r2,%esp+64,%esp,%esp+32,%esp+48,%esp+16,r4,r5,r6,r7
    .macro  STEP512 r0,r1,r2,r3,r4,r5,r6,r7,v8,v9,c0,c1,c2,c3
    SBOX    \r4,\r5,\r6,\r7,\r3 /*(8,9,10,11) = (r3,r5,r6,r7)*/
    MIXTON_S512 \r3,\r5,\r6,\r7
    MIXWORD_S512    \r3,\r5,\r6,\r7
    pshufd  \r5, \r5, 57        /*89 v110*/
    movaps  \v8, \r3
    movaps  \v9, \r5
    movaps  \r3, [%esp+64]
    movaps  \r4, [%esp]
    movaps  \r5, [%esp+32]
    movaps  \r6, [%esp+48]

    SBOX    \r0,\r1,\r2,\r3,\r7 /*(0,1,2,3)=(r7,r1,r2,r3)*/
    movaps  \r0, [%esp+16]
    movaps  [%esp], \r2
    movaps  [%esp+16], \r3
    SBOX    \r5,\r6,\r0,\r4,\r2 /*(4,5,6,7)=(r4,r2,r6,r0)*/
    movaps  [%esp+48], \r0
    movaps  [%esp+32], \r6
    MIXWORD \r7,\r4,\r3,\r5,\r1,\r2,\r0,\r6 /*(0,1)=(r7,r1), (4,5)=(r4,r2)*/
    xorps   \r4, \c1     /*ADD CNS*/
    movaps  \r0, [%esp+48]
    movaps  \r5, [%esp]
    movaps  \r6, [%esp+32]
    movaps  \r3, [%esp+16]
    movaps  [%esp], \r4
    movaps  [%esp+32], \r2
    movaps  [%esp+64], \r7
    movaps  [%esp+48], \r1
    movaps  \r2, \r5
    MIXWORD \r2,\r6,\r1,\r5,\r3,\r0,\r4,\r7 /*(2,3)=(r2,r3), (6,7)=(r6,r0)*/
    movaps  \r4, \v8
    movaps  \r5, \v9
    movaps  [%esp+16],\r0
    movaps  \r1, [%esp+48]
    movaps  \r0, [%esp+64]
    xorps   \r4, \c2
    xorps   \r5, \c3
    movaps  [%esp+48], \r6
    movaps  [%esp+64], \r3
    movaps  \r7, \r5        /*89*/
    punpckldq   \r5, \r4    /*89*/
    punpckhdq   \r7, \r4    /*89*/
    xorps   \r0, \c0
    pshufd  \r4, \r5, 78    /*89*/
    pshufd  \r6, \r7, 78    /*89*/
    .endm

    //  convert normal format to mixed format
    //  (%esp,r1,%esp+32,r3,%esp+64,r5,%esp+80,r7,v8,v9)->(r6,r4,r2,r7,%esp,%esp+32,%esp+48,%esp+16,r5,r1,r0,r3)
    .macro  NMLTOM512   r0,r1,r2,r3,r4,r5,r6,r7,v8,v9
    movaps  \r0, \r3
    movaps  \r4, \r7
    punpckhdq   \r3, \r1
    punpckhdq   \r7, \r5
    punpckldq   \r0, \r1
    punpckldq   \r4, \r5
    movaps  \r2, \r7
    movaps  \r6, \r4
    movaps  \r5, [%esp+64]
    punpckhqdq  \r4, \r0
    movaps  \r1, [%esp]
    punpckhqdq  \r7, \r3
    punpcklqdq  \r2, \r3
    punpcklqdq  \r6, \r0
    movaps  [%esp+16], \r7
    movaps  \r3, [%esp+32]
    movaps  \r7, [%esp+80]
    movaps  [%esp], \r6
    movaps  [%esp+32], \r4
    movaps  [%esp+48], \r2
    movaps  \r0, \r3
    movaps  \r4, \r7
    punpckhdq   \r3, \r1
    punpckhdq   \r7, \r5
    punpckldq   \r0, \r1
    punpckldq   \r4, \r5
    movaps  \r2, \r7
    movaps  \r6, \r4
    movaps  \r1, \v9        /*89*/
    movaps  \r5, \v8        /*89*/
    pshufd  \r1, \r1, 57    /*89 v110*/
    punpckhqdq  \r4, \r0
    punpckhqdq  \r7, \r3
    punpcklqdq  \r2, \r3
    movaps  \r3, \r1        /*89*/
    punpcklqdq  \r6, \r0
    punpckldq   \r1, \r5    /*89*/
    punpckhdq   \r3, \r5    /*89*/
    pshufd  \r5, \r1, 78    /*89*/
    pshufd  \r0, \r3, 78    /*89*/
    .endm

    //  convert mixed format to normal format
    //  (r0,r1,r2,r3,r4,r5,%esp+48,%esp+16)->(r0,r4,r1,r5,%esp,r2,%esp+32,r7)
    .macro  MIXTON512   r0,r1,r2,r3,r4,r5,r6,r7
    movaps  \r6, \r0
    movaps  \r7, \r2
    punpckhdq   \r0, \r1
    punpckhdq   \r2, \r3
    punpckldq   \r6, \r1
    punpckldq   \r7, \r3
    movaps  \r1, \r0
    movaps  \r3, \r6
    punpckhqdq  \r0, \r2
    punpckhqdq  \r6, \r7
    punpcklqdq  \r1, \r2
    punpcklqdq  \r3, \r7
    movaps  [%esp], \r6
    movaps  \r7, [%esp+16]
    movaps  \r6, [%esp+48]
    movaps  [%esp+32], \r3
    movaps  \r2, \r4
    movaps  \r3, \r6
    punpckhdq   \r4, \r5
    punpckhdq   \r6, \r7
    punpckldq   \r2, \r5
    punpckldq   \r3, \r7
    movaps  \r5, \r4
    movaps  \r7, \r2
    punpckhqdq  \r4, \r6
    punpckhqdq  \r2, \r3
    punpcklqdq  \r5, \r6
    punpcklqdq  \r7, \r3
    .endm

    .macro  MIXTON_S512 r0,r1,r2,r3
    punpckhdq   \r0, \r1
    punpckhdq   \r2, \r3
    movaps  \r1, \r0
    punpckhqdq  \r0, \r2
    punpcklqdq  \r1, \r2
    pshufd  \r1, \r1, 147   /*89 v110*/
    .endm

    //  (r0,r1) -> (r0,r1)
    .macro  MIXWORD_S512    r0,r1,t0,t1
    movaps  \t0, \r0
    xorps   \r1, \r0
    pslld   \r0, 2
    psrld   \t0, 30
    movaps  \t1, \r1
    xorps   \r0, \r1
    pslld   \t1, 14
    xorps   \r0, \t0
    psrld   \r1, 18
    xorps   \t1, \r0
    movaps  \t0, \r0
    pslld   \r0, 10
    xorps   \r1, \t1
    psrld   \t0, 22
    xorps   \r0, \r1
    movaps  \t1, \r1
    pslld   \r1, 1
    psrld   \t1, 31
    xorps   \r0, \t0
    xorps   \r1, \t1
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

    //  (r0,r1,r2,r3)->(r4,r1,r2,r3)
    .macro  SBOX r0,r1,r2,r3,r4
    movaps  \r4, \r0
    orps    \r0, \r1
    xorps   \r2, \r3
    xorps   \r1, allone
    xorps   \r0, \r3
    andps   \r3, \r4
    xorps   \r1, \r3
    xorps   \r3, \r2
    andps   \r2, \r0
    xorps   \r0, allone
    xorps   \r2, \r1
    orps    \r1, \r3
    xorps   \r4, \r1
    xorps   \r3, \r2
    andps   \r2, \r1
    xorps   \r1, \r0
    .endm

    //  (r0,r1), (s0,s1) -> (r0,r1), (s0,s1)
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

    // (m0, m1, m2, m3) -> (s0, s1, s2, s3)
    .macro  BYTESWAP m0, m1, m2, m3, r0, r1, r2, s0, s1, s2, s3
    mov     \r0, \m0
    mov     \r1, \m1
    mov     \r2, \m2
    bswap   \r0
    bswap   \r1
    bswap   \r2
    mov     \s0, \r0
    mov     \s1, \r1
    mov     \s2, \r2
    mov     \r0, \m3
    bswap   \r0
    mov     \s3, \r0
    .endm

.text
    .globl  luffa256_init
    .type   luffa256_init, @function
    .align  16
luffa256_init:
    mov     %ecx, [%esp+4]
    movaps  %xmm0, [IV   ]
    movaps  %xmm1, [IV+16]
    movaps  %xmm2, [IV+32]
    movaps  %xmm3, [IV+48]
    movaps  %xmm4, [IV+64]
    movaps  %xmm5, [IV+80]
    movups  [%ecx   ], %xmm0
    movups  [%ecx+16], %xmm1
    movups  [%ecx+32], %xmm2
    movups  [%ecx+48], %xmm3
    movups  [%ecx+64], %xmm4
    movups  [%ecx+80], %xmm5
    ret
    .size   luffa256_init, .-luffa256_init


//luffa-256 round function
    .globl  luffa256
    .type   luffa256, @function
    .align  16
luffa256:
    push    %ebp
    mov     %ebp, %esp
    push    %ebx
    push    %esi
    push    %edi
    mov     %ecx, [%ebp+ 8]
    mov     %edx, [%ebp+12]
    mov     %edi, [%ebp+16]

    and     %esp, mask16align
    sub     %esp, 96

    movups  %xmm0, [%ecx   ]
    movups  %xmm1, [%ecx+16]
    movups  %xmm2, [%ecx+32]
    movups  %xmm3, [%ecx+48]
    movups  %xmm4, [%ecx+64]
    movups  %xmm5, [%ecx+80]
    xor     %esi, %esi
.RND256:
    BYTESWAP [%edx   ],[%edx+ 4],[%edx+ 8],[%edx+12],%eax,%ebx,%ecx,[%esp+64],[%esp+68],[%esp+72],[%esp+76]
    BYTESWAP [%edx+16],[%edx+20],[%edx+24],[%edx+28],%eax,%ebx,%ecx,[%esp+80],[%esp+84],[%esp+88],[%esp+92]
    ROUND256 [%esp+64],[%esp+80],constants
    add     %edx, 32
    add     %esi, 1
    cmp     %esi, %edi
    jl      .RND256
    
    mov     %ecx, [%ebp+8]
    movups  [%ecx   ], %xmm0
    movups  [%ecx+16], %xmm1
    movups  [%ecx+32], %xmm2
    movups  [%ecx+48], %xmm3
    movups  [%ecx+64], %xmm4
    movups  [%ecx+80], %xmm5

    sub     %ebp, 12
    mov     %esp, %ebp
    pop     %edi
    pop     %esi
    pop     %ebx
    pop     %ebp
    ret
    .size   luffa256, .-luffa256


    .globl  luffa256_final
    .type   luffa256_final, @function
    .align  16
luffa256_final:
    push    %ebp
    mov     %ebp, %esp
    mov     %ecx, [%ebp+ 8]
    mov     %edx, [%ebp+12]

    and     %esp, mask16align
    sub     %esp, 96

    xorps   %xmm0, %xmm0
    movaps  [%esp+64], %xmm0
    movaps  [%esp+80], %xmm0
    
    movups  %xmm0, [%ecx   ]
    movups  %xmm1, [%ecx+16]
    movups  %xmm2, [%ecx+32]
    movups  %xmm3, [%ecx+48]
    movups  %xmm4, [%ecx+64]
    movups  %xmm5, [%ecx+80]
    ROUND256   [%esp+64], [%esp+80], constants
    xorps   %xmm0, %xmm2
    xorps   %xmm1, %xmm3
    xorps   %xmm0, %xmm4
    xorps   %xmm1, %xmm5

    BYTESWAPQW %xmm0, %xmm2, %xmm3, %xmm4
    movups  [%edx   ], %xmm0

    BYTESWAPQW %xmm1, %xmm2, %xmm3, %xmm4
    movups  [%edx+16], %xmm1

    mov %esp, %ebp
    pop %ebp
    ret
    .size   luffa256_final, .-luffa256_final


    .globl  luffa384_init
    .type   luffa384_init, @function
    .align  16
luffa384_init:
    mov     %ecx, [%esp+4]
    movaps  %xmm0, [IV    ]
    movaps  %xmm1, [IV+ 16]
    movaps  %xmm2, [IV+ 32]
    movaps  %xmm3, [IV+ 48]
    movaps  %xmm4, [IV+ 64]
    movaps  %xmm5, [IV+ 80]
    movaps  %xmm6, [IV+ 96]
    movaps  %xmm7, [IV+112]
    movups  [%ecx+  0], %xmm0
    movups  [%ecx+ 16], %xmm1
    movups  [%ecx+ 32], %xmm2
    movups  [%ecx+ 48], %xmm3
    movups  [%ecx+ 64], %xmm4
    movups  [%ecx+ 80], %xmm5
    movups  [%ecx+ 96], %xmm6
    movups  [%ecx+112], %xmm7
    ret
    .size   luffa384_init, .-luffa384_init


//luffa-384 round function
    .globl  luffa384
    .type   luffa384, @function
    .align  16
luffa384:
    push    %ebp
    mov     %ebp, %esp
    push    %ebx
    push    %esi
    push    %edi
    mov     %ecx, [%ebp+ 8]
    mov     %edx, [%ebp+12]
    mov     %edi, [%ebp+16]

    and     %esp, mask16align
    sub     %esp, 128

    movups  %xmm0, [%ecx    ]
    movups  %xmm1, [%ecx+ 16]
    movups  %xmm2, [%ecx+ 32]
    movups  %xmm3, [%ecx+ 48]
    movups  %xmm4, [%ecx+ 64]
    movups  %xmm5, [%ecx+ 80]
    movups  %xmm6, [%ecx+ 96]
    movups  %xmm7, [%ecx+112]
    xor     %esi, %esi
.RND384:
    BYTESWAP [%edx   ],[%edx+ 4],[%edx+ 8],[%edx+12],%eax,%ebx,%ecx,[%esp+ 96],[%esp+100],[%esp+104],[%esp+108]
    BYTESWAP [%edx+16],[%edx+20],[%edx+24],[%edx+28],%eax,%ebx,%ecx,[%esp+112],[%esp+116],[%esp+120],[%esp+124]
    ROUND384 [%esp+96],[%esp+112],constants
    add     %edx, 32
    add     %esi, 1
    cmp     %esi, %edi
    jl      .RND384

    mov     %ecx, [%ebp+8]
    movups  [%ecx    ], %xmm0
    movups  [%ecx+ 16], %xmm1
    movups  [%ecx+ 32], %xmm2
    movups  [%ecx+ 48], %xmm3
    movups  [%ecx+ 64], %xmm4
    movups  [%ecx+ 80], %xmm5
    movups  [%ecx+ 96], %xmm6
    movups  [%ecx+112], %xmm7
    
    sub     %ebp, 12
    mov     %esp, %ebp
    pop     %edi
    pop     %esi
    pop     %ebx
    pop     %ebp
    ret
    .size   luffa384, .-luffa384


    .globl  luffa384_final
    .type   luffa384_final, @function
    .align  16
luffa384_final:
    push    %ebp
    mov     %ebp, %esp
    mov     %ecx, [%ebp+ 8]
    mov     %edx, [%ebp+12]

    and     %esp, mask16align
    sub     %esp, 128

    xorps   %xmm0, %xmm0
    movaps  [%esp+ 96], %xmm0
    movaps  [%esp+112], %xmm0
    
    movups  %xmm0, [%ecx   ]
    movups  %xmm1, [%ecx+16]
    movups  %xmm2, [%ecx+32]
    movups  %xmm3, [%ecx+48]
    movups  %xmm4, [%ecx+64]
    movups  %xmm5, [%ecx+80]
    ROUND384   [%esp+96], [%esp+112], constants
    movaps  [%esp   ], %xmm0
    movaps  [%esp+16], %xmm1
    movaps  [%esp+32], %xmm2
    movaps  [%esp+48], %xmm3
    movaps  [%esp+64], %xmm4

    xorps   %xmm0, %xmm2
    xorps   %xmm1, %xmm3
    xorps   %xmm0, %xmm4
    xorps   %xmm1, %xmm5
    xorps   %xmm0, %xmm6
    xorps   %xmm1, %xmm7

    BYTESWAPQW %xmm0, %xmm2, %xmm3, %xmm4
    movups  [%edx   ], %xmm0

    BYTESWAPQW %xmm1, %xmm2, %xmm3, %xmm4
    movups  [%edx+16], %xmm1

    movaps  %xmm0, [%esp   ]
    movaps  %xmm1, [%esp+16]
    movaps  %xmm2, [%esp+32]
    movaps  %xmm3, [%esp+48]
    movaps  %xmm4, [%esp+64]
    ROUND384   [%esp+96], [%esp+112], constants
    xorps   %xmm0, %xmm2
    xorps   %xmm1, %xmm3
    xorps   %xmm0, %xmm4
    xorps   %xmm1, %xmm5
    xorps   %xmm0, %xmm6
    xorps   %xmm1, %xmm7

    BYTESWAPQW %xmm0, %xmm2, %xmm3, %xmm4
    movups  [%edx+32], %xmm0

    mov %esp, %ebp
    pop %ebp
    ret
    .size   luffa384_final, .-luffa384_final


    .globl  luffa512_init
    .type   luffa512_init, @function
    .align  16
luffa512_init:
    mov     %ecx, [%esp+4]
    movaps  %xmm0, [IV    ]
    movaps  %xmm1, [IV+ 16]
    movaps  %xmm2, [IV+ 32]
    movaps  %xmm3, [IV+ 48]
    movaps  %xmm4, [IV+ 64]
    movaps  %xmm5, [IV+ 80]
    movaps  %xmm6, [IV+ 96]
    movaps  %xmm7, [IV+112]
    movups  [%ecx    ], %xmm0
    movups  [%ecx+ 16], %xmm1
    movups  [%ecx+ 32], %xmm2
    movups  [%ecx+ 48], %xmm3
    movups  [%ecx+ 64], %xmm4
    movups  [%ecx+ 80], %xmm5
    movups  [%ecx+ 96], %xmm6
    movups  [%ecx+112], %xmm7
    movaps  %xmm0, [IV+128]
    movaps  %xmm1, [IV+144]
    movups  [%ecx+128], %xmm0
    movups  [%ecx+144], %xmm1
    ret
    .size   luffa512_init, .-luffa512_init


//luffa-512 round function
    .globl  luffa512
    .type   luffa512, @function
    .align  16
luffa512:
    push    %ebp
    mov     %ebp, %esp
    push    %ebx
    push    %esi
    push    %edi
    mov     %ecx, [%ebp +8]
    mov     %edx, [%ebp+12]
    mov     %edi, [%ebp+16]

    and     %esp, mask16align
    sub     %esp, 160

    movups  %xmm6, [%ecx+128]
    movups  %xmm7, [%ecx+144]
    movups  %xmm0, [%ecx    ]
    movups  %xmm1, [%ecx+ 16]
    movups  %xmm2, [%ecx+ 32]
    movups  %xmm3, [%ecx+ 48]
    movaps  [%esp+ 96], %xmm6
    movaps  [%esp+112], %xmm7
    movups  %xmm4, [%ecx+ 64]
    movups  %xmm5, [%ecx+ 80]
    movups  %xmm6, [%ecx+ 96]
    movups  %xmm7, [%ecx+112]
    xor     %esi, %esi
.RND512:
    BYTESWAP [%edx   ],[%edx+ 4],[%edx+ 8],[%edx+12],%eax,%ebx,%ecx,[%esp+128],[%esp+132],[%esp+136],[%esp+140]
    BYTESWAP [%edx+16],[%edx+20],[%edx+24],[%edx+28],%eax,%ebx,%ecx,[%esp+144],[%esp+148],[%esp+152],[%esp+156]
    ROUND512 [%esp+96],[%esp+112],[%esp+128],[%esp+144], constants
    add     %edx, 32
    add     %esi, 1
    cmp     %esi, %edi
    jl      .RND512

    mov     %ecx, [%ebp+8]
    movups  [%ecx    ], %xmm0
    movups  [%ecx+ 16], %xmm1
    movaps  %xmm0, [%esp +96]
    movaps  %xmm1, [%esp+112]
    movups  [%ecx+ 32], %xmm2
    movups  [%ecx+ 48], %xmm3
    movups  [%ecx+ 64], %xmm4
    movups  [%ecx+ 80], %xmm5
    movups  [%ecx+ 96], %xmm6
    movups  [%ecx+112], %xmm7
    movups  [%ecx+128], %xmm0
    movups  [%ecx+144], %xmm1

    sub     %ebp, 12
    mov     %esp, %ebp
    pop     %edi
    pop     %esi
    pop     %ebx
    pop     %ebp
    ret
    .size   luffa512, .-luffa512


    .globl  luffa512_final
    .type   luffa512_final, @function
    .align  16
luffa512_final:
    push    %ebp
    mov     %ebp, %esp
    mov     %ecx, [%ebp+ 8]
    mov     %edx, [%ebp+12]

    and     %esp, mask16align
    sub     %esp, 160

    xorps   %xmm0, %xmm0
    movaps  [%esp+128], %xmm0
    movaps  [%esp+144], %xmm0

    movups  %xmm6, [%ecx+128]
    movups  %xmm7, [%ecx+144]
    movups  %xmm0, [%ecx    ]
    movups  %xmm1, [%ecx+ 16]
    movups  %xmm2, [%ecx+ 32]
    movups  %xmm3, [%ecx+ 48]
    movaps  [%esp+ 96], %xmm6
    movaps  [%esp+112], %xmm7
    movups  %xmm4, [%ecx+ 64]
    movups  %xmm5, [%ecx+ 80]
    movups  %xmm6, [%ecx+ 96]
    movups  %xmm7, [%ecx+112]
    ROUND512    [%esp+96], [%esp+112], [%esp+128], [%esp+144], constants
    movaps  [%esp   ], %xmm0
    movaps  [%esp+16], %xmm1
    movaps  [%esp+32], %xmm2
    movaps  [%esp+48], %xmm3
    movaps  [%esp+64], %xmm4
    xorps   %xmm0, %xmm2
    xorps   %xmm1, %xmm3
    xorps   %xmm0, %xmm4
    xorps   %xmm1, %xmm5
    xorps   %xmm0, %xmm6
    xorps   %xmm1, %xmm7
    xorps   %xmm0, [%esp+ 96]
    xorps   %xmm1, [%esp+112]

    BYTESWAPQW %xmm0, %xmm2, %xmm3, %xmm4
    movups  [%edx   ], %xmm0

    BYTESWAPQW %xmm1, %xmm2, %xmm3, %xmm4
    movups  [%edx+16], %xmm1

    movaps  %xmm0, [%esp   ]
    movaps  %xmm1, [%esp+16]
    movaps  %xmm2, [%esp+32]
    movaps  %xmm3, [%esp+48]
    movaps  %xmm4, [%esp+64]
    ROUND512    [%esp+96], [%esp+112], [%esp+128], [%esp+144], constants
    xorps   %xmm0, %xmm2
    xorps   %xmm1, %xmm3
    xorps   %xmm0, %xmm4
    xorps   %xmm1, %xmm5
    xorps   %xmm0, %xmm6
    xorps   %xmm1, %xmm7
    xorps   %xmm0, [%esp+ 96]
    xorps   %xmm1, [%esp+112]

    BYTESWAPQW %xmm0, %xmm2, %xmm3, %xmm4
    movups  [%edx+32], %xmm0

    BYTESWAPQW %xmm1, %xmm2, %xmm3, %xmm4
    movups  [%edx+48], %xmm1

    mov %esp, %ebp
    pop %ebp
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
mask16align:
    .long   0xfffffff0

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
    .long   0xf0d2e9e3,0x0,0x0,0x0
    .long   0x0,0x0,0x0,0x5090d577
    .long   0xac11d7fa,0x0,0x0,0x0
    .long   0x0,0x0,0x0,0x2d1925ab
    .long   0x1bcb66f2,0x0,0x0,0x0
    .long   0x0,0x0,0x0,0xb46496ac
    .long   0x6f2d9bc9,0x0,0x0,0x0
    .long   0x0,0x0,0x0,0xd1925ab0
    .long   0x78602649,0x0,0x0,0x0
    .long   0x0,0x0,0x0,0x29131ab6
    .long   0x8edae952,0x0,0x0,0x0
    .long   0x0,0x0,0x0,0x0fc053c3
    .long   0x3b6ba548,0x0,0x0,0x0
    .long   0x0,0x0,0x0,0x3f014f0c
    .long   0xedae9520,0x0,0x0,0x0
    .long   0x0,0x0,0x0,0xfc053c31

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
