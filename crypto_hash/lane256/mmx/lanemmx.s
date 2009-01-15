/*
 * Copyright (c) 2008 Sebastiaan Indesteege
 *                              <sebastiaan.indesteege@esat.kuleuven.be>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

/*
 * Assembly implementation of the LANE256 compression function, for 32-bit x86
 * CPU's using MMX
 */

/*****************************************************************************
 * Macros                                                                    *
 *****************************************************************************/

/* Do Lane i */
.macro lane i
  mexpl \i
  srsbmc %mm0, %mm1, %mm2, %mm3
  mexpr \i
  srsbmc %mm4, %mm5, %mm6, %mm7

  loadmm %mm0, %mm1, %mm4, %mm5
  addcstl 5*\i+0
  srsbmc %mm0, %mm1, %mm4, %mm5
  loadmm %mm2, %mm3, %mm6, %mm7
  addcounter 5*\i
  addcstr 5*\i+0
  srsbmc %mm2, %mm3, %mm6, %mm7

  loadmm %mm0, %mm1, %mm2, %mm3
  addcstl 5*\i+1
  srsbmc %mm0, %mm1, %mm2, %mm3
  loadmm %mm4, %mm5, %mm6, %mm7
  addcounter 5*\i+1
  addcstr 5*\i+1
  srsbmc %mm4, %mm5, %mm6, %mm7

  loadmm %mm0, %mm1, %mm4, %mm5
  addcstl 5*\i+2
  srsbmc %mm0, %mm1, %mm4, %mm5
  loadmm %mm2, %mm3, %mm6, %mm7
  addcounter 5*\i+2
  addcstr 5*\i+2
  srsbmc %mm2, %mm3, %mm6, %mm7

  loadmm %mm0, %mm1, %mm2, %mm3
  addcstl 5*\i+3
  srsbmc %mm0, %mm1, %mm2, %mm3
  loadmm %mm4, %mm5, %mm6, %mm7
  addcounter 5*\i+3
  addcstr 5*\i+3
  srsbmc %mm4, %mm5, %mm6, %mm7

  loadmm %mm0, %mm1, %mm4, %mm5
  addcstl 5*\i+4
  srsbmc %mm0, %mm1, %mm4, %mm5
  loadmm %mm2, %mm3, %mm6, %mm7
  addcounter 5*\i+4
  addcstr 5*\i+4
  srsbmc %mm2, %mm3, %mm6, %mm7

  loadmm %mm0, %mm1, %mm2, %mm3
.ifeq \i-0
  save128 %esp, 0
.else
.ifeq \i-3
  save128 %esp, 0
.else
  savexor128 %esp, 0
.endif
.endif
  loadmm %mm4, %mm5, %mm6, %mm7
.ifeq \i-0
  save128 %esp, 16
.else
.ifeq \i-3
  save128 %esp, 16
.else
  savexor128 %esp, 16
.endif
.endif
.endm

/* Do Output Transformation Lane i (i=0,1)*/
.macro otlane i
  load128 %esp, 0
  srsbmc %mm0, %mm1, %mm2, %mm3
  load128 %esp, 16
  srsbmc %mm4, %mm5, %mm6, %mm7

  loadmm %mm0, %mm1, %mm4, %mm5
  addcstl 30+2*\i+0
  srsbmc %mm0, %mm1, %mm4, %mm5
  loadmm %mm2, %mm3, %mm6, %mm7
  addcounter 30+2*\i
  addcstr 30+2*\i+0
  srsbmc %mm2, %mm3, %mm6, %mm7

  loadmm %mm0, %mm1, %mm2, %mm3
  addcstl 30+2*\i+1
  srsbmc %mm0, %mm1, %mm2, %mm3
  loadmm %mm4, %mm5, %mm6, %mm7
  addcounter 30+2*\i+1
  addcstr 30+2*\i+1
  srsbmc %mm4, %mm5, %mm6, %mm7
 
  loadmm %mm0, %mm1, %mm4, %mm5
.ifeq \i-0
  save128 %esp, 32
.else
  savexor128 %esp, 32
.endif
 loadmm %mm2, %mm3, %mm6, %mm7
.ifeq \i-0
  save128 %esp, 48
.else
  savexor128 %esp, 48
.endif
.endm

/* Message expansion */
.macro mexpl i
.ifeq \i-0
  movl 8(%ebp), %edi
  load128 %edi, 0
  loadxor128 %edi, 16
  loadxor128 %edi, 32
  loadxor128 %edi, 48
  bswap128
  movl 12(%ebp), %edi
  loadxor128 %edi, 0
.endif
.ifeq \i-1
  movl 8(%ebp), %edi
  load128 %edi, 0
  loadxor128 %edi, 32
  loadxor128 %edi, 48
  bswap128
  movl 12(%ebp), %edi
  loadxor128 %edi, 0
  loadxor128 %edi, 16
.endif
.ifeq \i-2
  movl 8(%ebp), %edi
  load128 %edi, 0
  loadxor128 %edi, 16
  loadxor128 %edi, 32
  bswap128
  movl 12(%ebp), %edi
  loadxor128 %edi, 0
  loadxor128 %edi, 16
.endif
.ifeq \i-3
  movl 12(%ebp), %edi
  load128 %edi, 0
.endif
.ifeq \i-4
  movl 8(%ebp), %edi
  load128 %edi, 0
  bswap128
.endif
.ifeq \i-5
  movl 8(%ebp), %edi
  load128 %edi, 32
  bswap128
.endif
.endm

.macro mexpr i
.ifeq \i-0
  movl 8(%ebp), %edi
  load128 %edi, 0
  loadxor128 %edi, 32
  bswap128
  movl 12(%ebp), %edi
  loadxor128 %edi, 16
.endif
.ifeq \i-1
  movl 8(%ebp), %edi
  load128 %edi, 16
  loadxor128 %edi, 32
  bswap128
  movl 12(%ebp), %edi
  loadxor128 %edi, 0
.endif
.ifeq \i-2
  movl 8(%ebp), %edi
  load128 %edi, 0
  loadxor128 %edi, 48
  bswap128
  movl 12(%ebp), %edi
  loadxor128 %edi, 0
.endif
.ifeq \i-3
  movl 12(%ebp), %edi
  load128 %edi, 16
.endif
.ifeq \i-4
  movl 8(%ebp), %edi
  load128 %edi, 16
  bswap128
.endif
.ifeq \i-5
  movl 8(%ebp), %edi
  load128 %edi, 48
  bswap128
.endif
.endm

/*
 * Do ShiftRows, SubBytes and MixColumns. The input columns are in the
 * registers %eax, %ebx, %ecx and %edx and
 * the output columns are the MMX registers c0--c3 (which are %mm0 ... %mm7)
 * Uses %esi as a scratch register
 */
.macro srsbmc c0, c1, c2, c3
  movzbl %dl, %esi
  movq T3(,%esi,8), \c0
  movzbl %al, %esi
  movq T3(,%esi,8), \c1 
  movzbl %bl, %esi
  movq T3(,%esi,8), \c2 
  movzbl %cl, %esi
  movq T3(,%esi,8), \c3 
  movzbl %ch, %esi
  pxor T2(,%esi,8), \c0
  movzbl %dh, %esi
  pxor T2(,%esi,8), \c1 
  movzbl %ah, %esi
  pxor T2(,%esi,8), \c2 
  movzbl %bh, %esi
  pxor T2(,%esi,8), \c3 
  shrl $16, %ebx
  shrl $16, %ecx
  shrl $16, %edx
  shrl $16, %eax
  movzbl %bl, %esi
  pxor T1(,%esi,8), \c0
  movzbl %cl, %esi
  pxor T1(,%esi,8), \c1 
  movzbl %dl, %esi
  pxor T1(,%esi,8), \c2 
  movzbl %al, %esi
  pxor T1(,%esi,8), \c3 
  movzbl %ah, %esi
  pxor T0(,%esi,8), \c0
  movzbl %bh, %esi
  pxor T0(,%esi,8), \c1 
  movzbl %ch, %esi
  pxor T0(,%esi,8), \c2 
  movzbl %dh, %esi
  pxor T0(,%esi,8), \c3 
.endm

/* Loading of message/chaining values, and endianness conversion. */
.macro load128 basereg, disp
  movl \disp(\basereg), %eax
  movl \disp+4(\basereg), %ebx
  movl \disp+8(\basereg), %ecx
  movl \disp+12(\basereg), %edx
.endm
.macro save128 basereg, disp
  movl %eax, \disp(\basereg)
  movl %ebx, \disp+4(\basereg)
  movl %ecx, \disp+8(\basereg)
  movl %edx, \disp+12(\basereg)
.endm
.macro loadxor128 basereg, disp
  xorl \disp(\basereg), %eax
  xorl \disp+4(\basereg), %ebx
  xorl \disp+8(\basereg), %ecx
  xorl \disp+12(\basereg), %edx
.endm
.macro savexor128 basereg, disp
  xorl %eax, \disp(\basereg)
  xorl %ebx, \disp+4(\basereg)
  xorl %ecx, \disp+8(\basereg)
  xorl %edx, \disp+12(\basereg)
.endm
.macro bswap128
  bswap %eax
  bswap %ebx
  bswap %ecx
  bswap %edx
.endm

/* Copy columns from MMX regs to %eax, %ebx, %ecx, %edx */
.macro loadmm c0, c1, c2, c3
  movd \c0, %eax
  movd \c1, %ebx
  movd \c2, %ecx
  movd \c3, %edx
.endm

/* Add constants */
.macro addcstl i
  xorlcst (8*(\i)+5), %edx /* ordering to avoid pipeline stalls */
  xorlcst (8*(\i)+0), %eax
  xorlcst (8*(\i)+1), %ebx
  xorlcst (8*(\i)+4), %ecx
.endm
.macro addcstr i
  xorlcst (8*(\i)+7), %edx
  xorlcst (8*(\i)+2), %eax
  xorlcst (8*(\i)+3), %ebx
  xorlcst (8*(\i)+6), %ecx
.endm

/* Add counter */
.macro addcounter i
.ifeq ((\i) % 2) - 0
  xorl 16(%ebp), %ebx
.endif
.ifeq ((\i) % 2) - 1
  xorl 20(%ebp), %ebx
.endif
.endm

/* Constants lookup table embedded in code */
.macro xorlcst i, reg
.ifeq (\i)-0
xorl $0x07fc703d, \reg
.endif
.ifeq (\i)-1
xorl $0xd3fe381f, \reg
.endif
.ifeq (\i)-2
xorl $0xb9ff1c0e, \reg
.endif
.ifeq (\i)-3
xorl $0x5cff8e07, \reg
.endif
.ifeq (\i)-4
xorl $0xfe7fc702, \reg
.endif
.ifeq (\i)-5
xorl $0x7f3fe381, \reg
.endif
.ifeq (\i)-6
xorl $0xef9ff1c1, \reg
.endif
.ifeq (\i)-7
xorl $0xa7cff8e1, \reg
.endif
.ifeq (\i)-8
xorl $0x83e7fc71, \reg
.endif
.ifeq (\i)-9
xorl $0x91f3fe39, \reg
.endif
.ifeq (\i)-10
xorl $0x98f9ff1d, \reg
.endif
.ifeq (\i)-11
xorl $0x9c7cff8f, \reg
.endif
.ifeq (\i)-12
xorl $0x9e3e7fc6, \reg
.endif
.ifeq (\i)-13
xorl $0x4f1f3fe3, \reg
.endif
.ifeq (\i)-14
xorl $0xf78f9ff0, \reg
.endif
.ifeq (\i)-15
xorl $0x7bc7cff8, \reg
.endif
.ifeq (\i)-16
xorl $0x3de3e7fc, \reg
.endif
.ifeq (\i)-17
xorl $0x1ef1f3fe, \reg
.endif
.ifeq (\i)-18
xorl $0x0f78f9ff, \reg
.endif
.ifeq (\i)-19
xorl $0xd7bc7cfe, \reg
.endif
.ifeq (\i)-20
xorl $0x6bde3e7f, \reg
.endif
.ifeq (\i)-21
xorl $0xe5ef1f3e, \reg
.endif
.ifeq (\i)-22
xorl $0x72f78f9f, \reg
.endif
.ifeq (\i)-23
xorl $0xe97bc7ce, \reg
.endif
.ifeq (\i)-24
xorl $0x74bde3e7, \reg
.endif
.ifeq (\i)-25
xorl $0xea5ef1f2, \reg
.endif
.ifeq (\i)-26
xorl $0x752f78f9, \reg
.endif
.ifeq (\i)-27
xorl $0xea97bc7d, \reg
.endif
.ifeq (\i)-28
xorl $0xa54bde3f, \reg
.endif
.ifeq (\i)-29
xorl $0x82a5ef1e, \reg
.endif
.ifeq (\i)-30
xorl $0x4152f78f, \reg
.endif
.ifeq (\i)-31
xorl $0xf0a97bc6, \reg
.endif
.ifeq (\i)-32
xorl $0x7854bde3, \reg
.endif
.ifeq (\i)-33
xorl $0xec2a5ef0, \reg
.endif
.ifeq (\i)-34
xorl $0x76152f78, \reg
.endif
.ifeq (\i)-35
xorl $0x3b0a97bc, \reg
.endif
.ifeq (\i)-36
xorl $0x1d854bde, \reg
.endif
.ifeq (\i)-37
xorl $0x0ec2a5ef, \reg
.endif
.ifeq (\i)-38
xorl $0xd76152f6, \reg
.endif
.ifeq (\i)-39
xorl $0x6bb0a97b, \reg
.endif
.ifeq (\i)-40
xorl $0xe5d854bc, \reg
.endif
.ifeq (\i)-41
xorl $0x72ec2a5e, \reg
.endif
.ifeq (\i)-42
xorl $0x3976152f, \reg
.endif
.ifeq (\i)-43
xorl $0xccbb0a96, \reg
.endif
.ifeq (\i)-44
xorl $0x665d854b, \reg
.endif
.ifeq (\i)-45
xorl $0xe32ec2a4, \reg
.endif
.ifeq (\i)-46
xorl $0x71976152, \reg
.endif
.ifeq (\i)-47
xorl $0x38cbb0a9, \reg
.endif
.ifeq (\i)-48
xorl $0xcc65d855, \reg
.endif
.ifeq (\i)-49
xorl $0xb632ec2b, \reg
.endif
.ifeq (\i)-50
xorl $0x8b197614, \reg
.endif
.ifeq (\i)-51
xorl $0x458cbb0a, \reg
.endif
.ifeq (\i)-52
xorl $0x22c65d85, \reg
.endif
.ifeq (\i)-53
xorl $0xc1632ec3, \reg
.endif
.ifeq (\i)-54
xorl $0xb0b19760, \reg
.endif
.ifeq (\i)-55
xorl $0x5858cbb0, \reg
.endif
.ifeq (\i)-56
xorl $0x2c2c65d8, \reg
.endif
.ifeq (\i)-57
xorl $0x161632ec, \reg
.endif
.ifeq (\i)-58
xorl $0x0b0b1976, \reg
.endif
.ifeq (\i)-59
xorl $0x05858cbb, \reg
.endif
.ifeq (\i)-60
xorl $0xd2c2c65c, \reg
.endif
.ifeq (\i)-61
xorl $0x6961632e, \reg
.endif
.ifeq (\i)-62
xorl $0x34b0b197, \reg
.endif
.ifeq (\i)-63
xorl $0xca5858ca, \reg
.endif
.ifeq (\i)-64
xorl $0x652c2c65, \reg
.endif
.ifeq (\i)-65
xorl $0xe2961633, \reg
.endif
.ifeq (\i)-66
xorl $0xa14b0b18, \reg
.endif
.ifeq (\i)-67
xorl $0x50a5858c, \reg
.endif
.ifeq (\i)-68
xorl $0x2852c2c6, \reg
.endif
.ifeq (\i)-69
xorl $0x14296163, \reg
.endif
.ifeq (\i)-70
xorl $0xda14b0b0, \reg
.endif
.ifeq (\i)-71
xorl $0x6d0a5858, \reg
.endif
.ifeq (\i)-72
xorl $0x36852c2c, \reg
.endif
.ifeq (\i)-73
xorl $0x1b429616, \reg
.endif
.ifeq (\i)-74
xorl $0x0da14b0b, \reg
.endif
.ifeq (\i)-75
xorl $0xd6d0a584, \reg
.endif
.ifeq (\i)-76
xorl $0x6b6852c2, \reg
.endif
.ifeq (\i)-77
xorl $0x35b42961, \reg
.endif
.ifeq (\i)-78
xorl $0xcada14b1, \reg
.endif
.ifeq (\i)-79
xorl $0xb56d0a59, \reg
.endif
.ifeq (\i)-80
xorl $0x8ab6852d, \reg
.endif
.ifeq (\i)-81
xorl $0x955b4297, \reg
.endif
.ifeq (\i)-82
xorl $0x9aada14a, \reg
.endif
.ifeq (\i)-83
xorl $0x4d56d0a5, \reg
.endif
.ifeq (\i)-84
xorl $0xf6ab6853, \reg
.endif
.ifeq (\i)-85
xorl $0xab55b428, \reg
.endif
.ifeq (\i)-86
xorl $0x55aada14, \reg
.endif
.ifeq (\i)-87
xorl $0x2ad56d0a, \reg
.endif
.ifeq (\i)-88
xorl $0x156ab685, \reg
.endif
.ifeq (\i)-89
xorl $0xdab55b43, \reg
.endif
.ifeq (\i)-90
xorl $0xbd5aada0, \reg
.endif
.ifeq (\i)-91
xorl $0x5ead56d0, \reg
.endif
.ifeq (\i)-92
xorl $0x2f56ab68, \reg
.endif
.ifeq (\i)-93
xorl $0x17ab55b4, \reg
.endif
.ifeq (\i)-94
xorl $0x0bd5aada, \reg
.endif
.ifeq (\i)-95
xorl $0x05ead56d, \reg
.endif
.ifeq (\i)-96
xorl $0xd2f56ab7, \reg
.endif
.ifeq (\i)-97
xorl $0xb97ab55a, \reg
.endif
.ifeq (\i)-98
xorl $0x5cbd5aad, \reg
.endif
.ifeq (\i)-99
xorl $0xfe5ead57, \reg
.endif
.ifeq (\i)-100
xorl $0xaf2f56aa, \reg
.endif
.ifeq (\i)-101
xorl $0x5797ab55, \reg
.endif
.ifeq (\i)-102
xorl $0xfbcbd5ab, \reg
.endif
.ifeq (\i)-103
xorl $0xade5ead4, \reg
.endif
.ifeq (\i)-104
xorl $0x56f2f56a, \reg
.endif
.ifeq (\i)-105
xorl $0x2b797ab5, \reg
.endif
.ifeq (\i)-106
xorl $0xc5bcbd5b, \reg
.endif
.ifeq (\i)-107
xorl $0xb2de5eac, \reg
.endif
.ifeq (\i)-108
xorl $0x596f2f56, \reg
.endif
.ifeq (\i)-109
xorl $0x2cb797ab, \reg
.endif
.ifeq (\i)-110
xorl $0xc65bcbd4, \reg
.endif
.ifeq (\i)-111
xorl $0x632de5ea, \reg
.endif
.ifeq (\i)-112
xorl $0x3196f2f5, \reg
.endif
.ifeq (\i)-113
xorl $0xc8cb797b, \reg
.endif
.ifeq (\i)-114
xorl $0xb465bcbc, \reg
.endif
.ifeq (\i)-115
xorl $0x5a32de5e, \reg
.endif
.ifeq (\i)-116
xorl $0x2d196f2f, \reg
.endif
.ifeq (\i)-117
xorl $0xc68cb796, \reg
.endif
.ifeq (\i)-118
xorl $0x63465bcb, \reg
.endif
.ifeq (\i)-119
xorl $0xe1a32de4, \reg
.endif
.ifeq (\i)-120
xorl $0x70d196f2, \reg
.endif
.ifeq (\i)-121
xorl $0x3868cb79, \reg
.endif
.ifeq (\i)-122
xorl $0xcc3465bd, \reg
.endif
.ifeq (\i)-123
xorl $0xb61a32df, \reg
.endif
.ifeq (\i)-124
xorl $0x8b0d196e, \reg
.endif
.ifeq (\i)-125
xorl $0x45868cb7, \reg
.endif
.ifeq (\i)-126
xorl $0xf2c3465a, \reg
.endif
.ifeq (\i)-127
xorl $0x7961a32d, \reg
.endif
.ifeq (\i)-128
xorl $0xecb0d197, \reg
.endif
.ifeq (\i)-129
xorl $0xa65868ca, \reg
.endif
.ifeq (\i)-130
xorl $0x532c3465, \reg
.endif
.ifeq (\i)-131
xorl $0xf9961a33, \reg
.endif
.ifeq (\i)-132
xorl $0xaccb0d18, \reg
.endif
.ifeq (\i)-133
xorl $0x5665868c, \reg
.endif
.ifeq (\i)-134
xorl $0x2b32c346, \reg
.endif
.ifeq (\i)-135
xorl $0x159961a3, \reg
.endif
.ifeq (\i)-136
xorl $0xdaccb0d0, \reg
.endif
.ifeq (\i)-137
xorl $0x6d665868, \reg
.endif
.ifeq (\i)-138
xorl $0x36b32c34, \reg
.endif
.ifeq (\i)-139
xorl $0x1b59961a, \reg
.endif
.ifeq (\i)-140
xorl $0x0daccb0d, \reg
.endif
.ifeq (\i)-141
xorl $0xd6d66587, \reg
.endif
.ifeq (\i)-142
xorl $0xbb6b32c2, \reg
.endif
.ifeq (\i)-143
xorl $0x5db59961, \reg
.endif
.ifeq (\i)-144
xorl $0xfedaccb1, \reg
.endif
.ifeq (\i)-145
xorl $0xaf6d6659, \reg
.endif
.ifeq (\i)-146
xorl $0x87b6b32d, \reg
.endif
.ifeq (\i)-147
xorl $0x93db5997, \reg
.endif
.ifeq (\i)-148
xorl $0x99edacca, \reg
.endif
.ifeq (\i)-149
xorl $0x4cf6d665, \reg
.endif
.ifeq (\i)-150
xorl $0xf67b6b33, \reg
.endif
.ifeq (\i)-151
xorl $0xab3db598, \reg
.endif
.ifeq (\i)-152
xorl $0x559edacc, \reg
.endif
.ifeq (\i)-153
xorl $0x2acf6d66, \reg
.endif
.ifeq (\i)-154
xorl $0x1567b6b3, \reg
.endif
.ifeq (\i)-155
xorl $0xdab3db58, \reg
.endif
.ifeq (\i)-156
xorl $0x6d59edac, \reg
.endif
.ifeq (\i)-157
xorl $0x36acf6d6, \reg
.endif
.ifeq (\i)-158
xorl $0x1b567b6b, \reg
.endif
.ifeq (\i)-159
xorl $0xddab3db4, \reg
.endif
.ifeq (\i)-160
xorl $0x6ed59eda, \reg
.endif
.ifeq (\i)-161
xorl $0x376acf6d, \reg
.endif
.ifeq (\i)-162
xorl $0xcbb567b7, \reg
.endif
.ifeq (\i)-163
xorl $0xb5dab3da, \reg
.endif
.ifeq (\i)-164
xorl $0x5aed59ed, \reg
.endif
.ifeq (\i)-165
xorl $0xfd76acf7, \reg
.endif
.ifeq (\i)-166
xorl $0xaebb567a, \reg
.endif
.ifeq (\i)-167
xorl $0x575dab3d, \reg
.endif
.ifeq (\i)-168
xorl $0xfbaed59f, \reg
.endif
.ifeq (\i)-169
xorl $0xadd76ace, \reg
.endif
.ifeq (\i)-170
xorl $0x56ebb567, \reg
.endif
.ifeq (\i)-171
xorl $0xfb75dab2, \reg
.endif
.ifeq (\i)-172
xorl $0x7dbaed59, \reg
.endif
.ifeq (\i)-173
xorl $0xeedd76ad, \reg
.endif
.ifeq (\i)-174
xorl $0xa76ebb57, \reg
.endif
.ifeq (\i)-175
xorl $0x83b75daa, \reg
.endif
.ifeq (\i)-176
xorl $0x41dbaed5, \reg
.endif
.ifeq (\i)-177
xorl $0xf0edd76b, \reg
.endif
.ifeq (\i)-178
xorl $0xa876ebb4, \reg
.endif
.ifeq (\i)-179
xorl $0x543b75da, \reg
.endif
.ifeq (\i)-180
xorl $0x2a1dbaed, \reg
.endif
.ifeq (\i)-181
xorl $0xc50edd77, \reg
.endif
.ifeq (\i)-182
xorl $0xb2876eba, \reg
.endif
.ifeq (\i)-183
xorl $0x5943b75d, \reg
.endif
.ifeq (\i)-184
xorl $0xfca1dbaf, \reg
.endif
.ifeq (\i)-185
xorl $0xae50edd6, \reg
.endif
.ifeq (\i)-186
xorl $0x572876eb, \reg
.endif
.ifeq (\i)-187
xorl $0xfb943b74, \reg
.endif
.ifeq (\i)-188
xorl $0x7dca1dba, \reg
.endif
.ifeq (\i)-189
xorl $0x3ee50edd, \reg
.endif
.ifeq (\i)-190
xorl $0xcf72876f, \reg
.endif
.ifeq (\i)-191
xorl $0xb7b943b6, \reg
.endif
.ifeq (\i)-192
xorl $0x5bdca1db, \reg
.endif
.ifeq (\i)-193
xorl $0xfdee50ec, \reg
.endif
.ifeq (\i)-194
xorl $0x7ef72876, \reg
.endif
.ifeq (\i)-195
xorl $0x3f7b943b, \reg
.endif
.ifeq (\i)-196
xorl $0xcfbdca1c, \reg
.endif
.ifeq (\i)-197
xorl $0x67dee50e, \reg
.endif
.ifeq (\i)-198
xorl $0x33ef7287, \reg
.endif
.ifeq (\i)-199
xorl $0xc9f7b942, \reg
.endif
.ifeq (\i)-200
xorl $0x64fbdca1, \reg
.endif
.ifeq (\i)-201
xorl $0xe27dee51, \reg
.endif
.ifeq (\i)-202
xorl $0xa13ef729, \reg
.endif
.ifeq (\i)-203
xorl $0x809f7b95, \reg
.endif
.ifeq (\i)-204
xorl $0x904fbdcb, \reg
.endif
.ifeq (\i)-205
xorl $0x9827dee4, \reg
.endif
.ifeq (\i)-206
xorl $0x4c13ef72, \reg
.endif
.ifeq (\i)-207
xorl $0x2609f7b9, \reg
.endif
.ifeq (\i)-208
xorl $0xc304fbdd, \reg
.endif
.ifeq (\i)-209
xorl $0xb1827def, \reg
.endif
.ifeq (\i)-210
xorl $0x88c13ef6, \reg
.endif
.ifeq (\i)-211
xorl $0x44609f7b, \reg
.endif
.ifeq (\i)-212
xorl $0xf2304fbc, \reg
.endif
.ifeq (\i)-213
xorl $0x791827de, \reg
.endif
.ifeq (\i)-214
xorl $0x3c8c13ef, \reg
.endif
.ifeq (\i)-215
xorl $0xce4609f6, \reg
.endif
.ifeq (\i)-216
xorl $0x672304fb, \reg
.endif
.ifeq (\i)-217
xorl $0xe391827c, \reg
.endif
.ifeq (\i)-218
xorl $0x71c8c13e, \reg
.endif
.ifeq (\i)-219
xorl $0x38e4609f, \reg
.endif
.ifeq (\i)-220
xorl $0xcc72304e, \reg
.endif
.ifeq (\i)-221
xorl $0x66391827, \reg
.endif
.ifeq (\i)-222
xorl $0xe31c8c12, \reg
.endif
.ifeq (\i)-223
xorl $0x718e4609, \reg
.endif
.ifeq (\i)-224
xorl $0xe8c72305, \reg
.endif
.ifeq (\i)-225
xorl $0xa4639183, \reg
.endif
.ifeq (\i)-226
xorl $0x8231c8c0, \reg
.endif
.ifeq (\i)-227
xorl $0x4118e460, \reg
.endif
.ifeq (\i)-228
xorl $0x208c7230, \reg
.endif
.ifeq (\i)-229
xorl $0x10463918, \reg
.endif
.ifeq (\i)-230
xorl $0x08231c8c, \reg
.endif
.ifeq (\i)-231
xorl $0x04118e46, \reg
.endif
.ifeq (\i)-232
xorl $0x0208c723, \reg
.endif
.ifeq (\i)-233
xorl $0xd1046390, \reg
.endif
.ifeq (\i)-234
xorl $0x688231c8, \reg
.endif
.ifeq (\i)-235
xorl $0x344118e4, \reg
.endif
.ifeq (\i)-236
xorl $0x1a208c72, \reg
.endif
.ifeq (\i)-237
xorl $0x0d104639, \reg
.endif
.ifeq (\i)-238
xorl $0xd688231d, \reg
.endif
.ifeq (\i)-239
xorl $0xbb44118f, \reg
.endif
.ifeq (\i)-240
xorl $0x8da208c6, \reg
.endif
.ifeq (\i)-241
xorl $0x46d10463, \reg
.endif
.ifeq (\i)-242
xorl $0xf3688230, \reg
.endif
.ifeq (\i)-243
xorl $0x79b44118, \reg
.endif
.ifeq (\i)-244
xorl $0x3cda208c, \reg
.endif
.ifeq (\i)-245
xorl $0x1e6d1046, \reg
.endif
.ifeq (\i)-246
xorl $0x0f368823, \reg
.endif
.ifeq (\i)-247
xorl $0xd79b4410, \reg
.endif
.ifeq (\i)-248
xorl $0x6bcda208, \reg
.endif
.ifeq (\i)-249
xorl $0x35e6d104, \reg
.endif
.ifeq (\i)-250
xorl $0x1af36882, \reg
.endif
.ifeq (\i)-251
xorl $0x0d79b441, \reg
.endif
.ifeq (\i)-252
xorl $0xd6bcda21, \reg
.endif
.ifeq (\i)-253
xorl $0xbb5e6d11, \reg
.endif
.ifeq (\i)-254
xorl $0x8daf3689, \reg
.endif
.ifeq (\i)-255
xorl $0x96d79b45, \reg
.endif
.ifeq (\i)-256
xorl $0x9b6bcda3, \reg
.endif
.ifeq (\i)-257
xorl $0x9db5e6d0, \reg
.endif
.ifeq (\i)-258
xorl $0x4edaf368, \reg
.endif
.ifeq (\i)-259
xorl $0x276d79b4, \reg
.endif
.ifeq (\i)-260
xorl $0x13b6bcda, \reg
.endif
.ifeq (\i)-261
xorl $0x09db5e6d, \reg
.endif
.ifeq (\i)-262
xorl $0xd4edaf37, \reg
.endif
.ifeq (\i)-263
xorl $0xba76d79a, \reg
.endif
.ifeq (\i)-264
xorl $0x5d3b6bcd, \reg
.endif
.ifeq (\i)-265
xorl $0xfe9db5e7, \reg
.endif
.ifeq (\i)-266
xorl $0xaf4edaf2, \reg
.endif
.ifeq (\i)-267
xorl $0x57a76d79, \reg
.endif
.ifeq (\i)-268
xorl $0xfbd3b6bd, \reg
.endif
.ifeq (\i)-269
xorl $0xade9db5f, \reg
.endif
.ifeq (\i)-270
xorl $0x86f4edae, \reg
.endif
.ifeq (\i)-271
xorl $0x437a76d7, \reg
.endif
.endm

/*****************************************************************************
 * Functions                                                                 *
 *****************************************************************************/
.text
/*
 * void lane256_compress_mmx(const u8 m[64], u32 h[8], const u32 ctrh, const u32 ctrl);
 *
 * m:     8(%ebp)
 * h:    12(%ebp)
 * ctrh: 16(%ebp)
 * ctrl: 20(%ebp)
 */
.global lane256_compress_mmx
lane256_compress_mmx:
  pushl %ebp
  movl %esp, %ebp
  pushl %ebx
  pushl %edi
  pushl %esi

  subl $64, %esp             /* reserve space for local storage (64 bytes) + align (0 bytes) */

  lane 0
  lane 1
  lane 2
  otlane 0

  lane 3
  lane 4
  lane 5
  otlane 1

  movl 12(%ebp), %edi
  load128 %esp, 32
  save128 %edi, 0
  load128 %esp, 48
  save128 %edi, 16

  emms
  addl $64, %esp /* restore stack pointer */
  popl %esi
  popl %edi
  popl %ebx
  popl %ebp
  ret
.size lane256_compress_mmx, .-lane256_compress_mmx

/*****************************************************************************
 * Lookup tables                                                             *
 *****************************************************************************/
.data
.align 8
T0:
.quad 0x00000000c66363a5, 0x00000000f87c7c84, 0x00000000ee777799, 0x00000000f67b7b8d
.quad 0x00000000fff2f20d, 0x00000000d66b6bbd, 0x00000000de6f6fb1, 0x0000000091c5c554
.quad 0x0000000060303050, 0x0000000002010103, 0x00000000ce6767a9, 0x00000000562b2b7d
.quad 0x00000000e7fefe19, 0x00000000b5d7d762, 0x000000004dababe6, 0x00000000ec76769a
.quad 0x000000008fcaca45, 0x000000001f82829d, 0x0000000089c9c940, 0x00000000fa7d7d87
.quad 0x00000000effafa15, 0x00000000b25959eb, 0x000000008e4747c9, 0x00000000fbf0f00b
.quad 0x0000000041adadec, 0x00000000b3d4d467, 0x000000005fa2a2fd, 0x0000000045afafea
.quad 0x00000000239c9cbf, 0x0000000053a4a4f7, 0x00000000e4727296, 0x000000009bc0c05b
.quad 0x0000000075b7b7c2, 0x00000000e1fdfd1c, 0x000000003d9393ae, 0x000000004c26266a
.quad 0x000000006c36365a, 0x000000007e3f3f41, 0x00000000f5f7f702, 0x0000000083cccc4f
.quad 0x000000006834345c, 0x0000000051a5a5f4, 0x00000000d1e5e534, 0x00000000f9f1f108
.quad 0x00000000e2717193, 0x00000000abd8d873, 0x0000000062313153, 0x000000002a15153f
.quad 0x000000000804040c, 0x0000000095c7c752, 0x0000000046232365, 0x000000009dc3c35e
.quad 0x0000000030181828, 0x00000000379696a1, 0x000000000a05050f, 0x000000002f9a9ab5
.quad 0x000000000e070709, 0x0000000024121236, 0x000000001b80809b, 0x00000000dfe2e23d
.quad 0x00000000cdebeb26, 0x000000004e272769, 0x000000007fb2b2cd, 0x00000000ea75759f
.quad 0x000000001209091b, 0x000000001d83839e, 0x00000000582c2c74, 0x00000000341a1a2e
.quad 0x00000000361b1b2d, 0x00000000dc6e6eb2, 0x00000000b45a5aee, 0x000000005ba0a0fb
.quad 0x00000000a45252f6, 0x00000000763b3b4d, 0x00000000b7d6d661, 0x000000007db3b3ce
.quad 0x000000005229297b, 0x00000000dde3e33e, 0x000000005e2f2f71, 0x0000000013848497
.quad 0x00000000a65353f5, 0x00000000b9d1d168, 0x0000000000000000, 0x00000000c1eded2c
.quad 0x0000000040202060, 0x00000000e3fcfc1f, 0x0000000079b1b1c8, 0x00000000b65b5bed
.quad 0x00000000d46a6abe, 0x000000008dcbcb46, 0x0000000067bebed9, 0x000000007239394b
.quad 0x00000000944a4ade, 0x00000000984c4cd4, 0x00000000b05858e8, 0x0000000085cfcf4a
.quad 0x00000000bbd0d06b, 0x00000000c5efef2a, 0x000000004faaaae5, 0x00000000edfbfb16
.quad 0x00000000864343c5, 0x000000009a4d4dd7, 0x0000000066333355, 0x0000000011858594
.quad 0x000000008a4545cf, 0x00000000e9f9f910, 0x0000000004020206, 0x00000000fe7f7f81
.quad 0x00000000a05050f0, 0x00000000783c3c44, 0x00000000259f9fba, 0x000000004ba8a8e3
.quad 0x00000000a25151f3, 0x000000005da3a3fe, 0x00000000804040c0, 0x00000000058f8f8a
.quad 0x000000003f9292ad, 0x00000000219d9dbc, 0x0000000070383848, 0x00000000f1f5f504
.quad 0x0000000063bcbcdf, 0x0000000077b6b6c1, 0x00000000afdada75, 0x0000000042212163
.quad 0x0000000020101030, 0x00000000e5ffff1a, 0x00000000fdf3f30e, 0x00000000bfd2d26d
.quad 0x0000000081cdcd4c, 0x00000000180c0c14, 0x0000000026131335, 0x00000000c3ecec2f
.quad 0x00000000be5f5fe1, 0x00000000359797a2, 0x00000000884444cc, 0x000000002e171739
.quad 0x0000000093c4c457, 0x0000000055a7a7f2, 0x00000000fc7e7e82, 0x000000007a3d3d47
.quad 0x00000000c86464ac, 0x00000000ba5d5de7, 0x000000003219192b, 0x00000000e6737395
.quad 0x00000000c06060a0, 0x0000000019818198, 0x000000009e4f4fd1, 0x00000000a3dcdc7f
.quad 0x0000000044222266, 0x00000000542a2a7e, 0x000000003b9090ab, 0x000000000b888883
.quad 0x000000008c4646ca, 0x00000000c7eeee29, 0x000000006bb8b8d3, 0x000000002814143c
.quad 0x00000000a7dede79, 0x00000000bc5e5ee2, 0x00000000160b0b1d, 0x00000000addbdb76
.quad 0x00000000dbe0e03b, 0x0000000064323256, 0x00000000743a3a4e, 0x00000000140a0a1e
.quad 0x00000000924949db, 0x000000000c06060a, 0x000000004824246c, 0x00000000b85c5ce4
.quad 0x000000009fc2c25d, 0x00000000bdd3d36e, 0x0000000043acacef, 0x00000000c46262a6
.quad 0x00000000399191a8, 0x00000000319595a4, 0x00000000d3e4e437, 0x00000000f279798b
.quad 0x00000000d5e7e732, 0x000000008bc8c843, 0x000000006e373759, 0x00000000da6d6db7
.quad 0x00000000018d8d8c, 0x00000000b1d5d564, 0x000000009c4e4ed2, 0x0000000049a9a9e0
.quad 0x00000000d86c6cb4, 0x00000000ac5656fa, 0x00000000f3f4f407, 0x00000000cfeaea25
.quad 0x00000000ca6565af, 0x00000000f47a7a8e, 0x0000000047aeaee9, 0x0000000010080818
.quad 0x000000006fbabad5, 0x00000000f0787888, 0x000000004a25256f, 0x000000005c2e2e72
.quad 0x00000000381c1c24, 0x0000000057a6a6f1, 0x0000000073b4b4c7, 0x0000000097c6c651
.quad 0x00000000cbe8e823, 0x00000000a1dddd7c, 0x00000000e874749c, 0x000000003e1f1f21
.quad 0x00000000964b4bdd, 0x0000000061bdbddc, 0x000000000d8b8b86, 0x000000000f8a8a85
.quad 0x00000000e0707090, 0x000000007c3e3e42, 0x0000000071b5b5c4, 0x00000000cc6666aa
.quad 0x00000000904848d8, 0x0000000006030305, 0x00000000f7f6f601, 0x000000001c0e0e12
.quad 0x00000000c26161a3, 0x000000006a35355f, 0x00000000ae5757f9, 0x0000000069b9b9d0
.quad 0x0000000017868691, 0x0000000099c1c158, 0x000000003a1d1d27, 0x00000000279e9eb9
.quad 0x00000000d9e1e138, 0x00000000ebf8f813, 0x000000002b9898b3, 0x0000000022111133
.quad 0x00000000d26969bb, 0x00000000a9d9d970, 0x00000000078e8e89, 0x00000000339494a7
.quad 0x000000002d9b9bb6, 0x000000003c1e1e22, 0x0000000015878792, 0x00000000c9e9e920
.quad 0x0000000087cece49, 0x00000000aa5555ff, 0x0000000050282878, 0x00000000a5dfdf7a
.quad 0x00000000038c8c8f, 0x0000000059a1a1f8, 0x0000000009898980, 0x000000001a0d0d17
.quad 0x0000000065bfbfda, 0x00000000d7e6e631, 0x00000000844242c6, 0x00000000d06868b8
.quad 0x00000000824141c3, 0x00000000299999b0, 0x000000005a2d2d77, 0x000000001e0f0f11
.quad 0x000000007bb0b0cb, 0x00000000a85454fc, 0x000000006dbbbbd6, 0x000000002c16163a
T1:
.quad 0x00000000a5c66363, 0x0000000084f87c7c, 0x0000000099ee7777, 0x000000008df67b7b
.quad 0x000000000dfff2f2, 0x00000000bdd66b6b, 0x00000000b1de6f6f, 0x000000005491c5c5
.quad 0x0000000050603030, 0x0000000003020101, 0x00000000a9ce6767, 0x000000007d562b2b
.quad 0x0000000019e7fefe, 0x0000000062b5d7d7, 0x00000000e64dabab, 0x000000009aec7676
.quad 0x00000000458fcaca, 0x000000009d1f8282, 0x000000004089c9c9, 0x0000000087fa7d7d
.quad 0x0000000015effafa, 0x00000000ebb25959, 0x00000000c98e4747, 0x000000000bfbf0f0
.quad 0x00000000ec41adad, 0x0000000067b3d4d4, 0x00000000fd5fa2a2, 0x00000000ea45afaf
.quad 0x00000000bf239c9c, 0x00000000f753a4a4, 0x0000000096e47272, 0x000000005b9bc0c0
.quad 0x00000000c275b7b7, 0x000000001ce1fdfd, 0x00000000ae3d9393, 0x000000006a4c2626
.quad 0x000000005a6c3636, 0x00000000417e3f3f, 0x0000000002f5f7f7, 0x000000004f83cccc
.quad 0x000000005c683434, 0x00000000f451a5a5, 0x0000000034d1e5e5, 0x0000000008f9f1f1
.quad 0x0000000093e27171, 0x0000000073abd8d8, 0x0000000053623131, 0x000000003f2a1515
.quad 0x000000000c080404, 0x000000005295c7c7, 0x0000000065462323, 0x000000005e9dc3c3
.quad 0x0000000028301818, 0x00000000a1379696, 0x000000000f0a0505, 0x00000000b52f9a9a
.quad 0x00000000090e0707, 0x0000000036241212, 0x000000009b1b8080, 0x000000003ddfe2e2
.quad 0x0000000026cdebeb, 0x00000000694e2727, 0x00000000cd7fb2b2, 0x000000009fea7575
.quad 0x000000001b120909, 0x000000009e1d8383, 0x0000000074582c2c, 0x000000002e341a1a
.quad 0x000000002d361b1b, 0x00000000b2dc6e6e, 0x00000000eeb45a5a, 0x00000000fb5ba0a0
.quad 0x00000000f6a45252, 0x000000004d763b3b, 0x0000000061b7d6d6, 0x00000000ce7db3b3
.quad 0x000000007b522929, 0x000000003edde3e3, 0x00000000715e2f2f, 0x0000000097138484
.quad 0x00000000f5a65353, 0x0000000068b9d1d1, 0x0000000000000000, 0x000000002cc1eded
.quad 0x0000000060402020, 0x000000001fe3fcfc, 0x00000000c879b1b1, 0x00000000edb65b5b
.quad 0x00000000bed46a6a, 0x00000000468dcbcb, 0x00000000d967bebe, 0x000000004b723939
.quad 0x00000000de944a4a, 0x00000000d4984c4c, 0x00000000e8b05858, 0x000000004a85cfcf
.quad 0x000000006bbbd0d0, 0x000000002ac5efef, 0x00000000e54faaaa, 0x0000000016edfbfb
.quad 0x00000000c5864343, 0x00000000d79a4d4d, 0x0000000055663333, 0x0000000094118585
.quad 0x00000000cf8a4545, 0x0000000010e9f9f9, 0x0000000006040202, 0x0000000081fe7f7f
.quad 0x00000000f0a05050, 0x0000000044783c3c, 0x00000000ba259f9f, 0x00000000e34ba8a8
.quad 0x00000000f3a25151, 0x00000000fe5da3a3, 0x00000000c0804040, 0x000000008a058f8f
.quad 0x00000000ad3f9292, 0x00000000bc219d9d, 0x0000000048703838, 0x0000000004f1f5f5
.quad 0x00000000df63bcbc, 0x00000000c177b6b6, 0x0000000075afdada, 0x0000000063422121
.quad 0x0000000030201010, 0x000000001ae5ffff, 0x000000000efdf3f3, 0x000000006dbfd2d2
.quad 0x000000004c81cdcd, 0x0000000014180c0c, 0x0000000035261313, 0x000000002fc3ecec
.quad 0x00000000e1be5f5f, 0x00000000a2359797, 0x00000000cc884444, 0x00000000392e1717
.quad 0x000000005793c4c4, 0x00000000f255a7a7, 0x0000000082fc7e7e, 0x00000000477a3d3d
.quad 0x00000000acc86464, 0x00000000e7ba5d5d, 0x000000002b321919, 0x0000000095e67373
.quad 0x00000000a0c06060, 0x0000000098198181, 0x00000000d19e4f4f, 0x000000007fa3dcdc
.quad 0x0000000066442222, 0x000000007e542a2a, 0x00000000ab3b9090, 0x00000000830b8888
.quad 0x00000000ca8c4646, 0x0000000029c7eeee, 0x00000000d36bb8b8, 0x000000003c281414
.quad 0x0000000079a7dede, 0x00000000e2bc5e5e, 0x000000001d160b0b, 0x0000000076addbdb
.quad 0x000000003bdbe0e0, 0x0000000056643232, 0x000000004e743a3a, 0x000000001e140a0a
.quad 0x00000000db924949, 0x000000000a0c0606, 0x000000006c482424, 0x00000000e4b85c5c
.quad 0x000000005d9fc2c2, 0x000000006ebdd3d3, 0x00000000ef43acac, 0x00000000a6c46262
.quad 0x00000000a8399191, 0x00000000a4319595, 0x0000000037d3e4e4, 0x000000008bf27979
.quad 0x0000000032d5e7e7, 0x00000000438bc8c8, 0x00000000596e3737, 0x00000000b7da6d6d
.quad 0x000000008c018d8d, 0x0000000064b1d5d5, 0x00000000d29c4e4e, 0x00000000e049a9a9
.quad 0x00000000b4d86c6c, 0x00000000faac5656, 0x0000000007f3f4f4, 0x0000000025cfeaea
.quad 0x00000000afca6565, 0x000000008ef47a7a, 0x00000000e947aeae, 0x0000000018100808
.quad 0x00000000d56fbaba, 0x0000000088f07878, 0x000000006f4a2525, 0x00000000725c2e2e
.quad 0x0000000024381c1c, 0x00000000f157a6a6, 0x00000000c773b4b4, 0x000000005197c6c6
.quad 0x0000000023cbe8e8, 0x000000007ca1dddd, 0x000000009ce87474, 0x00000000213e1f1f
.quad 0x00000000dd964b4b, 0x00000000dc61bdbd, 0x00000000860d8b8b, 0x00000000850f8a8a
.quad 0x0000000090e07070, 0x00000000427c3e3e, 0x00000000c471b5b5, 0x00000000aacc6666
.quad 0x00000000d8904848, 0x0000000005060303, 0x0000000001f7f6f6, 0x00000000121c0e0e
.quad 0x00000000a3c26161, 0x000000005f6a3535, 0x00000000f9ae5757, 0x00000000d069b9b9
.quad 0x0000000091178686, 0x000000005899c1c1, 0x00000000273a1d1d, 0x00000000b9279e9e
.quad 0x0000000038d9e1e1, 0x0000000013ebf8f8, 0x00000000b32b9898, 0x0000000033221111
.quad 0x00000000bbd26969, 0x0000000070a9d9d9, 0x0000000089078e8e, 0x00000000a7339494
.quad 0x00000000b62d9b9b, 0x00000000223c1e1e, 0x0000000092158787, 0x0000000020c9e9e9
.quad 0x000000004987cece, 0x00000000ffaa5555, 0x0000000078502828, 0x000000007aa5dfdf
.quad 0x000000008f038c8c, 0x00000000f859a1a1, 0x0000000080098989, 0x00000000171a0d0d
.quad 0x00000000da65bfbf, 0x0000000031d7e6e6, 0x00000000c6844242, 0x00000000b8d06868
.quad 0x00000000c3824141, 0x00000000b0299999, 0x00000000775a2d2d, 0x00000000111e0f0f
.quad 0x00000000cb7bb0b0, 0x00000000fca85454, 0x00000000d66dbbbb, 0x000000003a2c1616
T2:
.quad 0x0000000063a5c663, 0x000000007c84f87c, 0x000000007799ee77, 0x000000007b8df67b
.quad 0x00000000f20dfff2, 0x000000006bbdd66b, 0x000000006fb1de6f, 0x00000000c55491c5
.quad 0x0000000030506030, 0x0000000001030201, 0x0000000067a9ce67, 0x000000002b7d562b
.quad 0x00000000fe19e7fe, 0x00000000d762b5d7, 0x00000000abe64dab, 0x00000000769aec76
.quad 0x00000000ca458fca, 0x00000000829d1f82, 0x00000000c94089c9, 0x000000007d87fa7d
.quad 0x00000000fa15effa, 0x0000000059ebb259, 0x0000000047c98e47, 0x00000000f00bfbf0
.quad 0x00000000adec41ad, 0x00000000d467b3d4, 0x00000000a2fd5fa2, 0x00000000afea45af
.quad 0x000000009cbf239c, 0x00000000a4f753a4, 0x000000007296e472, 0x00000000c05b9bc0
.quad 0x00000000b7c275b7, 0x00000000fd1ce1fd, 0x0000000093ae3d93, 0x00000000266a4c26
.quad 0x00000000365a6c36, 0x000000003f417e3f, 0x00000000f702f5f7, 0x00000000cc4f83cc
.quad 0x00000000345c6834, 0x00000000a5f451a5, 0x00000000e534d1e5, 0x00000000f108f9f1
.quad 0x000000007193e271, 0x00000000d873abd8, 0x0000000031536231, 0x00000000153f2a15
.quad 0x00000000040c0804, 0x00000000c75295c7, 0x0000000023654623, 0x00000000c35e9dc3
.quad 0x0000000018283018, 0x0000000096a13796, 0x00000000050f0a05, 0x000000009ab52f9a
.quad 0x0000000007090e07, 0x0000000012362412, 0x00000000809b1b80, 0x00000000e23ddfe2
.quad 0x00000000eb26cdeb, 0x0000000027694e27, 0x00000000b2cd7fb2, 0x00000000759fea75
.quad 0x00000000091b1209, 0x00000000839e1d83, 0x000000002c74582c, 0x000000001a2e341a
.quad 0x000000001b2d361b, 0x000000006eb2dc6e, 0x000000005aeeb45a, 0x00000000a0fb5ba0
.quad 0x0000000052f6a452, 0x000000003b4d763b, 0x00000000d661b7d6, 0x00000000b3ce7db3
.quad 0x00000000297b5229, 0x00000000e33edde3, 0x000000002f715e2f, 0x0000000084971384
.quad 0x0000000053f5a653, 0x00000000d168b9d1, 0x0000000000000000, 0x00000000ed2cc1ed
.quad 0x0000000020604020, 0x00000000fc1fe3fc, 0x00000000b1c879b1, 0x000000005bedb65b
.quad 0x000000006abed46a, 0x00000000cb468dcb, 0x00000000bed967be, 0x00000000394b7239
.quad 0x000000004ade944a, 0x000000004cd4984c, 0x0000000058e8b058, 0x00000000cf4a85cf
.quad 0x00000000d06bbbd0, 0x00000000ef2ac5ef, 0x00000000aae54faa, 0x00000000fb16edfb
.quad 0x0000000043c58643, 0x000000004dd79a4d, 0x0000000033556633, 0x0000000085941185
.quad 0x0000000045cf8a45, 0x00000000f910e9f9, 0x0000000002060402, 0x000000007f81fe7f
.quad 0x0000000050f0a050, 0x000000003c44783c, 0x000000009fba259f, 0x00000000a8e34ba8
.quad 0x0000000051f3a251, 0x00000000a3fe5da3, 0x0000000040c08040, 0x000000008f8a058f
.quad 0x0000000092ad3f92, 0x000000009dbc219d, 0x0000000038487038, 0x00000000f504f1f5
.quad 0x00000000bcdf63bc, 0x00000000b6c177b6, 0x00000000da75afda, 0x0000000021634221
.quad 0x0000000010302010, 0x00000000ff1ae5ff, 0x00000000f30efdf3, 0x00000000d26dbfd2
.quad 0x00000000cd4c81cd, 0x000000000c14180c, 0x0000000013352613, 0x00000000ec2fc3ec
.quad 0x000000005fe1be5f, 0x0000000097a23597, 0x0000000044cc8844, 0x0000000017392e17
.quad 0x00000000c45793c4, 0x00000000a7f255a7, 0x000000007e82fc7e, 0x000000003d477a3d
.quad 0x0000000064acc864, 0x000000005de7ba5d, 0x00000000192b3219, 0x000000007395e673
.quad 0x0000000060a0c060, 0x0000000081981981, 0x000000004fd19e4f, 0x00000000dc7fa3dc
.quad 0x0000000022664422, 0x000000002a7e542a, 0x0000000090ab3b90, 0x0000000088830b88
.quad 0x0000000046ca8c46, 0x00000000ee29c7ee, 0x00000000b8d36bb8, 0x00000000143c2814
.quad 0x00000000de79a7de, 0x000000005ee2bc5e, 0x000000000b1d160b, 0x00000000db76addb
.quad 0x00000000e03bdbe0, 0x0000000032566432, 0x000000003a4e743a, 0x000000000a1e140a
.quad 0x0000000049db9249, 0x00000000060a0c06, 0x00000000246c4824, 0x000000005ce4b85c
.quad 0x00000000c25d9fc2, 0x00000000d36ebdd3, 0x00000000acef43ac, 0x0000000062a6c462
.quad 0x0000000091a83991, 0x0000000095a43195, 0x00000000e437d3e4, 0x00000000798bf279
.quad 0x00000000e732d5e7, 0x00000000c8438bc8, 0x0000000037596e37, 0x000000006db7da6d
.quad 0x000000008d8c018d, 0x00000000d564b1d5, 0x000000004ed29c4e, 0x00000000a9e049a9
.quad 0x000000006cb4d86c, 0x0000000056faac56, 0x00000000f407f3f4, 0x00000000ea25cfea
.quad 0x0000000065afca65, 0x000000007a8ef47a, 0x00000000aee947ae, 0x0000000008181008
.quad 0x00000000bad56fba, 0x000000007888f078, 0x00000000256f4a25, 0x000000002e725c2e
.quad 0x000000001c24381c, 0x00000000a6f157a6, 0x00000000b4c773b4, 0x00000000c65197c6
.quad 0x00000000e823cbe8, 0x00000000dd7ca1dd, 0x00000000749ce874, 0x000000001f213e1f
.quad 0x000000004bdd964b, 0x00000000bddc61bd, 0x000000008b860d8b, 0x000000008a850f8a
.quad 0x000000007090e070, 0x000000003e427c3e, 0x00000000b5c471b5, 0x0000000066aacc66
.quad 0x0000000048d89048, 0x0000000003050603, 0x00000000f601f7f6, 0x000000000e121c0e
.quad 0x0000000061a3c261, 0x00000000355f6a35, 0x0000000057f9ae57, 0x00000000b9d069b9
.quad 0x0000000086911786, 0x00000000c15899c1, 0x000000001d273a1d, 0x000000009eb9279e
.quad 0x00000000e138d9e1, 0x00000000f813ebf8, 0x0000000098b32b98, 0x0000000011332211
.quad 0x0000000069bbd269, 0x00000000d970a9d9, 0x000000008e89078e, 0x0000000094a73394
.quad 0x000000009bb62d9b, 0x000000001e223c1e, 0x0000000087921587, 0x00000000e920c9e9
.quad 0x00000000ce4987ce, 0x0000000055ffaa55, 0x0000000028785028, 0x00000000df7aa5df
.quad 0x000000008c8f038c, 0x00000000a1f859a1, 0x0000000089800989, 0x000000000d171a0d
.quad 0x00000000bfda65bf, 0x00000000e631d7e6, 0x0000000042c68442, 0x0000000068b8d068
.quad 0x0000000041c38241, 0x0000000099b02999, 0x000000002d775a2d, 0x000000000f111e0f
.quad 0x00000000b0cb7bb0, 0x0000000054fca854, 0x00000000bbd66dbb, 0x00000000163a2c16
T3:
.quad 0x000000006363a5c6, 0x000000007c7c84f8, 0x00000000777799ee, 0x000000007b7b8df6
.quad 0x00000000f2f20dff, 0x000000006b6bbdd6, 0x000000006f6fb1de, 0x00000000c5c55491
.quad 0x0000000030305060, 0x0000000001010302, 0x000000006767a9ce, 0x000000002b2b7d56
.quad 0x00000000fefe19e7, 0x00000000d7d762b5, 0x00000000ababe64d, 0x0000000076769aec
.quad 0x00000000caca458f, 0x0000000082829d1f, 0x00000000c9c94089, 0x000000007d7d87fa
.quad 0x00000000fafa15ef, 0x000000005959ebb2, 0x000000004747c98e, 0x00000000f0f00bfb
.quad 0x00000000adadec41, 0x00000000d4d467b3, 0x00000000a2a2fd5f, 0x00000000afafea45
.quad 0x000000009c9cbf23, 0x00000000a4a4f753, 0x00000000727296e4, 0x00000000c0c05b9b
.quad 0x00000000b7b7c275, 0x00000000fdfd1ce1, 0x000000009393ae3d, 0x0000000026266a4c
.quad 0x0000000036365a6c, 0x000000003f3f417e, 0x00000000f7f702f5, 0x00000000cccc4f83
.quad 0x0000000034345c68, 0x00000000a5a5f451, 0x00000000e5e534d1, 0x00000000f1f108f9
.quad 0x00000000717193e2, 0x00000000d8d873ab, 0x0000000031315362, 0x0000000015153f2a
.quad 0x0000000004040c08, 0x00000000c7c75295, 0x0000000023236546, 0x00000000c3c35e9d
.quad 0x0000000018182830, 0x000000009696a137, 0x0000000005050f0a, 0x000000009a9ab52f
.quad 0x000000000707090e, 0x0000000012123624, 0x0000000080809b1b, 0x00000000e2e23ddf
.quad 0x00000000ebeb26cd, 0x000000002727694e, 0x00000000b2b2cd7f, 0x0000000075759fea
.quad 0x0000000009091b12, 0x0000000083839e1d, 0x000000002c2c7458, 0x000000001a1a2e34
.quad 0x000000001b1b2d36, 0x000000006e6eb2dc, 0x000000005a5aeeb4, 0x00000000a0a0fb5b
.quad 0x000000005252f6a4, 0x000000003b3b4d76, 0x00000000d6d661b7, 0x00000000b3b3ce7d
.quad 0x0000000029297b52, 0x00000000e3e33edd, 0x000000002f2f715e, 0x0000000084849713
.quad 0x000000005353f5a6, 0x00000000d1d168b9, 0x0000000000000000, 0x00000000eded2cc1
.quad 0x0000000020206040, 0x00000000fcfc1fe3, 0x00000000b1b1c879, 0x000000005b5bedb6
.quad 0x000000006a6abed4, 0x00000000cbcb468d, 0x00000000bebed967, 0x0000000039394b72
.quad 0x000000004a4ade94, 0x000000004c4cd498, 0x000000005858e8b0, 0x00000000cfcf4a85
.quad 0x00000000d0d06bbb, 0x00000000efef2ac5, 0x00000000aaaae54f, 0x00000000fbfb16ed
.quad 0x000000004343c586, 0x000000004d4dd79a, 0x0000000033335566, 0x0000000085859411
.quad 0x000000004545cf8a, 0x00000000f9f910e9, 0x0000000002020604, 0x000000007f7f81fe
.quad 0x000000005050f0a0, 0x000000003c3c4478, 0x000000009f9fba25, 0x00000000a8a8e34b
.quad 0x000000005151f3a2, 0x00000000a3a3fe5d, 0x000000004040c080, 0x000000008f8f8a05
.quad 0x000000009292ad3f, 0x000000009d9dbc21, 0x0000000038384870, 0x00000000f5f504f1
.quad 0x00000000bcbcdf63, 0x00000000b6b6c177, 0x00000000dada75af, 0x0000000021216342
.quad 0x0000000010103020, 0x00000000ffff1ae5, 0x00000000f3f30efd, 0x00000000d2d26dbf
.quad 0x00000000cdcd4c81, 0x000000000c0c1418, 0x0000000013133526, 0x00000000ecec2fc3
.quad 0x000000005f5fe1be, 0x000000009797a235, 0x000000004444cc88, 0x000000001717392e
.quad 0x00000000c4c45793, 0x00000000a7a7f255, 0x000000007e7e82fc, 0x000000003d3d477a
.quad 0x000000006464acc8, 0x000000005d5de7ba, 0x0000000019192b32, 0x00000000737395e6
.quad 0x000000006060a0c0, 0x0000000081819819, 0x000000004f4fd19e, 0x00000000dcdc7fa3
.quad 0x0000000022226644, 0x000000002a2a7e54, 0x000000009090ab3b, 0x000000008888830b
.quad 0x000000004646ca8c, 0x00000000eeee29c7, 0x00000000b8b8d36b, 0x0000000014143c28
.quad 0x00000000dede79a7, 0x000000005e5ee2bc, 0x000000000b0b1d16, 0x00000000dbdb76ad
.quad 0x00000000e0e03bdb, 0x0000000032325664, 0x000000003a3a4e74, 0x000000000a0a1e14
.quad 0x000000004949db92, 0x0000000006060a0c, 0x0000000024246c48, 0x000000005c5ce4b8
.quad 0x00000000c2c25d9f, 0x00000000d3d36ebd, 0x00000000acacef43, 0x000000006262a6c4
.quad 0x000000009191a839, 0x000000009595a431, 0x00000000e4e437d3, 0x0000000079798bf2
.quad 0x00000000e7e732d5, 0x00000000c8c8438b, 0x000000003737596e, 0x000000006d6db7da
.quad 0x000000008d8d8c01, 0x00000000d5d564b1, 0x000000004e4ed29c, 0x00000000a9a9e049
.quad 0x000000006c6cb4d8, 0x000000005656faac, 0x00000000f4f407f3, 0x00000000eaea25cf
.quad 0x000000006565afca, 0x000000007a7a8ef4, 0x00000000aeaee947, 0x0000000008081810
.quad 0x00000000babad56f, 0x00000000787888f0, 0x0000000025256f4a, 0x000000002e2e725c
.quad 0x000000001c1c2438, 0x00000000a6a6f157, 0x00000000b4b4c773, 0x00000000c6c65197
.quad 0x00000000e8e823cb, 0x00000000dddd7ca1, 0x0000000074749ce8, 0x000000001f1f213e
.quad 0x000000004b4bdd96, 0x00000000bdbddc61, 0x000000008b8b860d, 0x000000008a8a850f
.quad 0x00000000707090e0, 0x000000003e3e427c, 0x00000000b5b5c471, 0x000000006666aacc
.quad 0x000000004848d890, 0x0000000003030506, 0x00000000f6f601f7, 0x000000000e0e121c
.quad 0x000000006161a3c2, 0x0000000035355f6a, 0x000000005757f9ae, 0x00000000b9b9d069
.quad 0x0000000086869117, 0x00000000c1c15899, 0x000000001d1d273a, 0x000000009e9eb927
.quad 0x00000000e1e138d9, 0x00000000f8f813eb, 0x000000009898b32b, 0x0000000011113322
.quad 0x000000006969bbd2, 0x00000000d9d970a9, 0x000000008e8e8907, 0x000000009494a733
.quad 0x000000009b9bb62d, 0x000000001e1e223c, 0x0000000087879215, 0x00000000e9e920c9
.quad 0x00000000cece4987, 0x000000005555ffaa, 0x0000000028287850, 0x00000000dfdf7aa5
.quad 0x000000008c8c8f03, 0x00000000a1a1f859, 0x0000000089898009, 0x000000000d0d171a
.quad 0x00000000bfbfda65, 0x00000000e6e631d7, 0x000000004242c684, 0x000000006868b8d0
.quad 0x000000004141c382, 0x000000009999b029, 0x000000002d2d775a, 0x000000000f0f111e
.quad 0x00000000b0b0cb7b, 0x000000005454fca8, 0x00000000bbbbd66d, 0x0000000016163a2c
