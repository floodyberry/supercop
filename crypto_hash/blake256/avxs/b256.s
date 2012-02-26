.intel_syntax noprefix

.globl _blake256_compress
.globl blake256_compress

.text
.align 64

blake256_compress:
_blake256_compress:
 push rbp
 mov rbp, rsp
 sub rsp, 64
 and rsp, -16
 xor eax, eax
 vmovdqa xmm0, [u8to32]
 vmovdqu xmm10, [rsi + 00]
 vmovdqu xmm11, [rsi + 16]
 vmovdqu xmm12, [rsi + 32]
 vmovdqu xmm13, [rsi + 48]
 vpshufb xmm10, xmm10, xmm0
 vpshufb xmm11, xmm11, xmm0
 vpshufb xmm12, xmm12, xmm0
 vpshufb xmm13, xmm13, xmm0
 vmovdqa [rsp + 00], xmm10
 vmovdqa [rsp + 16], xmm11
 vmovdqa [rsp + 32], xmm12
 vmovdqa [rsp + 48], xmm13
 vmovdqa xmm0, [rdi + 00]
 vmovdqa xmm1, [rdi + 16]
 vmovdqa xmm2, [const_c + 00]
 vmovdqa xmm3, [const_c + 16]
 cmp eax, [rdi+60]
 jnz _skip_counter
 vmovd xmm8, [rdi + 48]
 vmovd xmm9, [rdi + 52]
 vshufps xmm8, xmm8, xmm9, 0
 vxorps xmm3, xmm3, xmm8
_skip_counter:
 vmovdqa xmm14, [rot8]
 vmovdqa xmm15, [rot16]
vpunpckldq xmm8, xmm10, xmm11
vpunpckhdq xmm9, xmm10, xmm11
vpunpckldq xmm4, xmm8, xmm9
vpunpckhdq xmm5, xmm8, xmm9
vpunpckldq xmm8, xmm12, xmm13
vpunpckhdq xmm9, xmm12, xmm13
vpunpckldq xmm6, xmm8, xmm9
vpunpckhdq xmm7, xmm8, xmm9
vpxor xmm4, xmm4, [const_z + 0*64 + 00]
vpxor xmm5, xmm5, [const_z + 0*64 + 16]
vpxor xmm6, xmm6, [const_z + 0*64 + 32]
vpxor xmm7, xmm7, [const_z + 0*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpalignr xmm4, xmm11, xmm13, 4
vpinsrd xmm4, xmm4, [rsp + 9*4], 2
vpshufd xmm4, xmm4, 0b00101101
vpblendw xmm5, xmm12, xmm13, 0b11000000
vpinsrd xmm5, xmm5, [rsp + 6*4], 1
vpshufd xmm5, xmm5, 0b01110010
vpunpcklqdq xmm6, xmm11, xmm10
vpinsrd xmm6, xmm6, [rsp + 11*4], 0
vpshufd xmm6, xmm6, 0b01001011
vpunpckhdq xmm7, xmm11, xmm10
vpblendw xmm7, xmm7, xmm13, 0b00000011
vpxor xmm4, xmm4, [const_z + 1*64 + 00]
vpxor xmm5, xmm5, [const_z + 1*64 + 16]
vpxor xmm6, xmm6, [const_z + 1*64 + 32]
vpxor xmm7, xmm7, [const_z + 1*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpblendw xmm4, xmm13, xmm11, 0b00001100
vpinsrd xmm4, xmm4, [rsp + 11*4], 2
vpshufd xmm4, xmm4, 0b11010010
vpblendw xmm5, xmm10, xmm13, 0b00001100
vpinsrd xmm5, xmm5, [rsp + 8*4], 3
vpshufd xmm5, xmm5, 0b01100011
vpblendw xmm6, xmm12, xmm11, 0b11000000
vpinsrd xmm6, xmm6, [rsp + 3*4], 0
vpshufd xmm6, xmm6, 0b01110010
vpblendw xmm7, xmm11, xmm10, 0b00001100
vpinsrd xmm7, xmm7, [rsp + 14*4], 3
vpshufd xmm7, xmm7, 0b00011011
vpxor xmm4, xmm4, [const_z + 2*64 + 00]
vpxor xmm5, xmm5, [const_z + 2*64 + 16]
vpxor xmm6, xmm6, [const_z + 2*64 + 32]
vpxor xmm7, xmm7, [const_z + 2*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpunpckhdq xmm8, xmm10, xmm11
vpalignr xmm4, xmm13, xmm8, 8
vpinsrd xmm4, xmm4, [rsp + 11*4], 2
vpshufd xmm4, xmm4, 0b10110001
vpblendw xmm5, xmm13, xmm10, 0b00001100
vpinsrd xmm5, xmm5, [rsp + 9*4], 3
vpshufd xmm5, xmm5, 0b10000111
vpblendw xmm6, xmm11, xmm10, 0b00110000
vpblendw xmm6, xmm6, xmm13, 0b11000000
vpshufd xmm6, xmm6, 0b11000110
vpunpckldq xmm8, xmm10, xmm12
vpunpckhdq xmm7, xmm11, xmm12
vpunpcklqdq xmm7, xmm7, xmm8
vpxor xmm4, xmm4, [const_z + 3*64 + 00]
vpxor xmm5, xmm5, [const_z + 3*64 + 16]
vpxor xmm6, xmm6, [const_z + 3*64 + 32]
vpxor xmm7, xmm7, [const_z + 3*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpunpckhdq xmm4, xmm10, xmm12
vpunpckldq xmm8, xmm12, xmm11
vpalignr xmm4, xmm4, xmm8, 8
vpunpcklqdq xmm5, xmm10, xmm11
vpunpckhqdq xmm9, xmm11, xmm13
vpblendw xmm5, xmm5, xmm9, 0b11001100
vpblendw xmm8, xmm10, xmm11, 0b00110000
vpblendw xmm6, xmm12, xmm13, 0b00110000
vpunpckhqdq xmm6, xmm6, xmm8
vpunpckldq xmm7, xmm10, xmm13
vpblendw xmm7, xmm7, xmm12, 0b00000011
vpshufd xmm7, xmm7, 0b11000110
vpxor xmm4, xmm4, [const_z + 4*64 + 00]
vpxor xmm5, xmm5, [const_z + 4*64 + 16]
vpxor xmm6, xmm6, [const_z + 4*64 + 32]
vpxor xmm7, xmm7, [const_z + 4*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpunpckldq xmm8, xmm10, xmm12
vpunpckhdq xmm4, xmm10, xmm11
vpunpcklqdq xmm4, xmm4, xmm8
vpunpckhdq xmm5, xmm10, xmm12
vpblendw xmm5, xmm5, xmm13, 0b00000011
vpshufd xmm5, xmm5, 0b10110100
vpblendw xmm6, xmm11, xmm10, 0b00001100
vpinsrd xmm6, xmm6, [rsp + 15*4], 2
vpshufd xmm6, xmm6, 0b01101100
vpshufd xmm7, xmm13, 0b00100001
vpunpcklqdq xmm9, xmm11, xmm12
vpblendw xmm7, xmm7, xmm9, 0b11001100
vpxor xmm4, xmm4, [const_z + 5*64 + 00]
vpxor xmm5, xmm5, [const_z + 5*64 + 16]
vpxor xmm6, xmm6, [const_z + 5*64 + 32]
vpxor xmm7, xmm7, [const_z + 5*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpblendw xmm4, xmm13, xmm10, 0b00001100
vpinsrd xmm4, xmm4, [rsp + 4*4], 3
vpblendw xmm5, xmm13, xmm12, 0b00110000
vpinsrd xmm5, xmm5, [rsp + 5*4], 0
vpshufd xmm5, xmm5, 0b10011100
vpunpckldq xmm6, xmm10, xmm12
vpblendw xmm6, xmm6, xmm11, 0b00110000
vpshufd xmm6, xmm6, 0b01111000
vpunpckhdq xmm7, xmm11, xmm12
vpunpckhqdq xmm7, xmm7, xmm10
vpshufd xmm7, xmm7, 0b01101100
vpxor xmm4, xmm4, [const_z + 6*64 + 00]
vpxor xmm5, xmm5, [const_z + 6*64 + 16]
vpxor xmm6, xmm6, [const_z + 6*64 + 32]
vpxor xmm7, xmm7, [const_z + 6*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpunpckhdq xmm4, xmm10, xmm11
vpblendw xmm4, xmm4, xmm13, 0b00001111
vpshufd xmm4, xmm4, 0b10001101
vpblendw xmm5, xmm12, xmm13, 0b00110000
vpinsrd xmm5, xmm5, [rsp + 1*4], 0
vpshufd xmm5, xmm5, 0b01001011
vpblendw xmm6, xmm10, xmm11, 0b00001100
vpshufd xmm6, xmm6, 0b10000001
vpalignr xmm8, xmm12, xmm13, 8
vpblendw xmm6, xmm6, xmm8, 0b00111100
vpunpckldq xmm7, xmm10, xmm11
vpunpckhdq xmm8, xmm11, xmm12
vpunpcklqdq xmm7, xmm7, xmm8
vpxor xmm4, xmm4, [const_z + 7*64 + 00]
vpxor xmm5, xmm5, [const_z + 7*64 + 16]
vpxor xmm6, xmm6, [const_z + 7*64 + 32]
vpxor xmm7, xmm7, [const_z + 7*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpunpckhdq xmm4, xmm11, xmm13
vpalignr xmm8, xmm10, xmm12, 4
vpblendw xmm4, xmm4, xmm8, 0b11110000
vpshufd xmm8, xmm12, 0b00010000
vpunpckhdq xmm5, xmm13, xmm10
vpunpckhdq xmm5, xmm5, xmm8
vpunpcklqdq xmm6, xmm13, xmm10
vpblendw xmm6, xmm6, xmm12, 0b00110000
vpshufd xmm6, xmm6, 0b10110100
vpblendw xmm7, xmm11, xmm10, 0b00110000
vpshufd xmm7, xmm7, 0b01001110
vpxor xmm4, xmm4, [const_z + 8*64 + 00]
vpxor xmm5, xmm5, [const_z + 8*64 + 16]
vpxor xmm6, xmm6, [const_z + 8*64 + 32]
vpxor xmm7, xmm7, [const_z + 8*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpblendw xmm4, xmm12, xmm11, 0b11000000
vpblendw xmm4, xmm4, xmm10, 0b00001100
vpshufd xmm4, xmm4, 0b01110010
vpshufd xmm5, xmm11, 0b01100000
vpinsrd xmm5, xmm5, [rsp + 2*4], 0
vpshufd xmm6, xmm13, 0b01000011
vpblendw xmm6, xmm6, xmm12, 0b00001100
vpinsrd xmm6, xmm6, [rsp + 3*4], 2
vpblendw xmm9, xmm13, xmm12, 0b11000000
vpshufd xmm9, xmm9, 0b00101101
vpalignr xmm7, xmm10, xmm9, 4
vpxor xmm4, xmm4, [const_z + 9*64 + 00]
vpxor xmm5, xmm5, [const_z + 9*64 + 16]
vpxor xmm6, xmm6, [const_z + 9*64 + 32]
vpxor xmm7, xmm7, [const_z + 9*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpunpckldq xmm8, xmm10, xmm11
vpunpckhdq xmm9, xmm10, xmm11
vpunpckldq xmm4, xmm8, xmm9
vpunpckhdq xmm5, xmm8, xmm9
vpunpckldq xmm8, xmm12, xmm13
vpunpckhdq xmm9, xmm12, xmm13
vpunpckldq xmm6, xmm8, xmm9
vpunpckhdq xmm7, xmm8, xmm9
vpxor xmm4, xmm4, [const_z + 0*64 + 00]
vpxor xmm5, xmm5, [const_z + 0*64 + 16]
vpxor xmm6, xmm6, [const_z + 0*64 + 32]
vpxor xmm7, xmm7, [const_z + 0*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpalignr xmm4, xmm11, xmm13, 4
vpinsrd xmm4, xmm4, [rsp + 9*4], 2
vpshufd xmm4, xmm4, 0b00101101
vpblendw xmm5, xmm12, xmm13, 0b11000000
vpinsrd xmm5, xmm5, [rsp + 6*4], 1
vpshufd xmm5, xmm5, 0b01110010
vpunpcklqdq xmm6, xmm11, xmm10
vpinsrd xmm6, xmm6, [rsp + 11*4], 0
vpshufd xmm6, xmm6, 0b01001011
vpunpckhdq xmm7, xmm11, xmm10
vpblendw xmm7, xmm7, xmm13, 0b00000011
vpxor xmm4, xmm4, [const_z + 1*64 + 00]
vpxor xmm5, xmm5, [const_z + 1*64 + 16]
vpxor xmm6, xmm6, [const_z + 1*64 + 32]
vpxor xmm7, xmm7, [const_z + 1*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpblendw xmm4, xmm13, xmm11, 0b00001100
vpinsrd xmm4, xmm4, [rsp + 11*4], 2
vpshufd xmm4, xmm4, 0b11010010
vpblendw xmm5, xmm10, xmm13, 0b00001100
vpinsrd xmm5, xmm5, [rsp + 8*4], 3
vpshufd xmm5, xmm5, 0b01100011
vpblendw xmm6, xmm12, xmm11, 0b11000000
vpinsrd xmm6, xmm6, [rsp + 3*4], 0
vpshufd xmm6, xmm6, 0b01110010
vpblendw xmm7, xmm11, xmm10, 0b00001100
vpinsrd xmm7, xmm7, [rsp + 14*4], 3
vpshufd xmm7, xmm7, 0b00011011
vpxor xmm4, xmm4, [const_z + 2*64 + 00]
vpxor xmm5, xmm5, [const_z + 2*64 + 16]
vpxor xmm6, xmm6, [const_z + 2*64 + 32]
vpxor xmm7, xmm7, [const_z + 2*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
vpunpckhdq xmm8, xmm10, xmm11
vpalignr xmm4, xmm13, xmm8, 8
vpinsrd xmm4, xmm4, [rsp + 11*4], 2
vpshufd xmm4, xmm4, 0b10110001
vpblendw xmm5, xmm13, xmm10, 0b00001100
vpinsrd xmm5, xmm5, [rsp + 9*4], 3
vpshufd xmm5, xmm5, 0b10000111
vpblendw xmm6, xmm11, xmm10, 0b00110000
vpblendw xmm6, xmm6, xmm13, 0b11000000
vpshufd xmm6, xmm6, 0b11000110
vpunpckldq xmm8, xmm10, xmm12
vpunpckhdq xmm7, xmm11, xmm12
vpunpcklqdq xmm7, xmm7, xmm8
vpxor xmm4, xmm4, [const_z + 3*64 + 00]
vpxor xmm5, xmm5, [const_z + 3*64 + 16]
vpxor xmm6, xmm6, [const_z + 3*64 + 32]
vpxor xmm7, xmm7, [const_z + 3*64 + 48]
 vpaddd xmm0, xmm0, xmm4
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm5
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x39
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x93
 vpaddd xmm0, xmm0, xmm6
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm15
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-12
 vpsrld xmm1, xmm1, 12
 vpxor xmm1, xmm1, xmm8
 vpaddd xmm0, xmm0, xmm7
 vpaddd xmm0, xmm0, xmm1
 vpxor xmm3, xmm3, xmm0
 vpshufb xmm3, xmm3, xmm14
 vpaddd xmm2, xmm2, xmm3
 vpxor xmm1, xmm1, xmm2
 vpslld xmm8, xmm1, 32-7
 vpsrld xmm1, xmm1, 7
 vpxor xmm1, xmm1, xmm8
 vpshufd xmm1, xmm1, 0x93
 vpshufd xmm2, xmm2, 0x4e
 vpshufd xmm3, xmm3, 0x39
 vpxor xmm0, xmm0, xmm2
 vpxor xmm1, xmm1, xmm3
 vpxor xmm0, xmm0, [rdi + 00]
 vpxor xmm1, xmm1, [rdi + 16]
 vmovdqa [rdi + 00], xmm0
 vmovdqa [rdi + 16], xmm1
 mov rsp, rbp
 pop rbp
 ret

.section .rodata
.align 64
u8to32: .byte 3,2,1,0, 7,6,5,4, 11,10,9,8, 15,14,13,12
rot8: .byte 1,2,3,0, 5,6,7,4, 9,10,11,8, 13,14,15,12
rot16: .byte 2,3,0,1, 6,7,4,5, 10,11,8,9, 14,15,12,13
const_c: .long 0x243F6A88, 0x85A308D3, 0x13198A2E, 0x03707344
 .long 0xA4093822, 0x299F31D0, 0x082EFA98, 0xEC4E6C89
.align 64
const_z: .long 0x85A308D3, 0x03707344, 0x299F31D0, 0xEC4E6C89
 .long 0x243F6A88, 0x13198A2E, 0xA4093822, 0x082EFA98
 .long 0x38D01377, 0x34E90C6C, 0xC97C50DD, 0xB5470917
 .long 0x452821E6, 0xBE5466CF, 0xC0AC29B7, 0x3F84D5B5
 .long 0xBE5466CF, 0x452821E6, 0xB5470917, 0x082EFA98
 .long 0x3F84D5B5, 0xA4093822, 0x38D01377, 0xC97C50DD
 .long 0xC0AC29B7, 0x13198A2E, 0xEC4E6C89, 0x03707344
 .long 0x85A308D3, 0x243F6A88, 0x34E90C6C, 0x299F31D0
 .long 0x452821E6, 0x243F6A88, 0x13198A2E, 0xC97C50DD
 .long 0x34E90C6C, 0xC0AC29B7, 0x299F31D0, 0xB5470917
 .long 0x3F84D5B5, 0x082EFA98, 0x85A308D3, 0xA4093822
 .long 0xBE5466CF, 0x03707344, 0xEC4E6C89, 0x38D01377
 .long 0x38D01377, 0x85A308D3, 0xC0AC29B7, 0x3F84D5B5
 .long 0xEC4E6C89, 0x03707344, 0xC97C50DD, 0x34E90C6C
 .long 0x082EFA98, 0xBE5466CF, 0x243F6A88, 0x452821E6
 .long 0x13198A2E, 0x299F31D0, 0xA4093822, 0xB5470917
 .long 0x243F6A88, 0xEC4E6C89, 0xA4093822, 0xB5470917
 .long 0x38D01377, 0x299F31D0, 0x13198A2E, 0xBE5466CF
 .long 0x85A308D3, 0xC0AC29B7, 0x452821E6, 0xC97C50DD
 .long 0x3F84D5B5, 0x34E90C6C, 0x082EFA98, 0x03707344
 .long 0xC0AC29B7, 0xBE5466CF, 0x34E90C6C, 0x03707344
 .long 0x13198A2E, 0x082EFA98, 0x243F6A88, 0x452821E6
 .long 0xC97C50DD, 0x299F31D0, 0x3F84D5B5, 0x38D01377
 .long 0xA4093822, 0xEC4E6C89, 0xB5470917, 0x85A308D3
 .long 0x299F31D0, 0xB5470917, 0xC97C50DD, 0xBE5466CF
 .long 0xC0AC29B7, 0x85A308D3, 0x3F84D5B5, 0xA4093822
 .long 0xEC4E6C89, 0x03707344, 0x13198A2E, 0x34E90C6C
 .long 0x243F6A88, 0x082EFA98, 0x38D01377, 0x452821E6
 .long 0x34E90C6C, 0x3F84D5B5, 0x85A308D3, 0x38D01377
 .long 0xC97C50DD, 0xEC4E6C89, 0xC0AC29B7, 0x03707344
 .long 0x243F6A88, 0xA4093822, 0x082EFA98, 0xBE5466CF
 .long 0x299F31D0, 0xB5470917, 0x452821E6, 0x13198A2E
 .long 0xB5470917, 0x38D01377, 0x03707344, 0x452821E6
 .long 0x082EFA98, 0x3F84D5B5, 0x34E90C6C, 0x243F6A88
 .long 0x13198A2E, 0xEC4E6C89, 0xA4093822, 0x299F31D0
 .long 0xC0AC29B7, 0xC97C50DD, 0x85A308D3, 0xBE5466CF
 .long 0x13198A2E, 0xA4093822, 0x082EFA98, 0x299F31D0
 .long 0xBE5466CF, 0x452821E6, 0xEC4E6C89, 0x85A308D3
 .long 0x34E90C6C, 0x3F84D5B5, 0xC0AC29B7, 0x243F6A88
 .long 0xB5470917, 0x38D01377, 0x03707344, 0xC97C50DD
 .long 0x85A308D3, 0x03707344, 0x299F31D0, 0xEC4E6C89
 .long 0x243F6A88, 0x13198A2E, 0xA4093822, 0x082EFA98
 .long 0x38D01377, 0x34E90C6C, 0xC97C50DD, 0xB5470917
 .long 0x452821E6, 0xBE5466CF, 0xC0AC29B7, 0x3F84D5B5
 .long 0xBE5466CF, 0x452821E6, 0xB5470917, 0x082EFA98
 .long 0x3F84D5B5, 0xA4093822, 0x38D01377, 0xC97C50DD
 .long 0xC0AC29B7, 0x13198A2E, 0xEC4E6C89, 0x03707344
 .long 0x85A308D3, 0x243F6A88, 0x34E90C6C, 0x299F31D0
 .long 0x452821E6, 0x243F6A88, 0x13198A2E, 0xC97C50DD
 .long 0x34E90C6C, 0xC0AC29B7, 0x299F31D0, 0xB5470917
 .long 0x3F84D5B5, 0x082EFA98, 0x85A308D3, 0xA4093822
 .long 0xBE5466CF, 0x03707344, 0xEC4E6C89, 0x38D01377
 .long 0x38D01377, 0x85A308D3, 0xC0AC29B7, 0x3F84D5B5
 .long 0xEC4E6C89, 0x03707344, 0xC97C50DD, 0x34E90C6C
 .long 0x082EFA98, 0xBE5466CF, 0x243F6A88, 0x452821E6
 .long 0x13198A2E, 0x299F31D0, 0xA4093822, 0xB5470917
