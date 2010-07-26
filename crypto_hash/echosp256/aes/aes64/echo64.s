#------------------------------------------------------------------------------------ #
# Implementation of the simple pipe ECHO hash function in its 256-bit outputs variant.#
# Optimized for Intel AES-NI, 64-bit mode                                             #
#                                                                                     #
# Date:     2010-07-23                                                                #
#                                                                                     #
# Authors:  Ryad Benadjila  <ryadbenadjila@gmail.com>                                 #
#           Olivier Billet  <billet@eurecom.fr>                                       #
#------------------------------------------------------------------------------------ #
	.file	"echo64.c"
	.text
	.p2align 4,,15
.globl Compress
	.type	Compress, @function
Compress:
.LFB539:
	.cfi_startproc
#APP
# 518 "echo64.c" 1
	.intel_syntax noprefix
# 0 "" 2
# 519 "echo64.c" 1
	push rdx
# 0 "" 2
# 519 "echo64.c" 1
	push rcx
# 0 "" 2
# 519 "echo64.c" 1
	push rax
# 0 "" 2
# 519 "echo64.c" 1
	push rbx
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm0,  [rdi]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm1,  [rdi+16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm2,  [rdi+2*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm3,  [rdi+3*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm4,  [rdi+4*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm5,  [rdi+5*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm6,  [rdi+6*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm7,  [rdi+7*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm8,  [rdi+8*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm9,  [rdi+9*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm10, [rdi+10*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm11, [rdi+11*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm12, [rdi+12*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm13, [rdi+13*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm14, [rdi+14*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm15, [rdi+15*16]
# 0 "" 2
# 521 "echo64.c" 1
	pxor  xmm0,      xmm4
# 0 "" 2
# 521 "echo64.c" 1
	pxor  xmm1,      xmm5
# 0 "" 2
# 521 "echo64.c" 1
	pxor  xmm2,      xmm6
# 0 "" 2
# 521 "echo64.c" 1
	pxor  xmm3,      xmm7
# 0 "" 2
# 521 "echo64.c" 1
	pxor  xmm0,      xmm8
# 0 "" 2
# 521 "echo64.c" 1
	pxor  xmm1,      xmm9
# 0 "" 2
# 521 "echo64.c" 1
	pxor  xmm2,      xmm10
# 0 "" 2
# 521 "echo64.c" 1
	pxor  xmm3,      xmm11
# 0 "" 2
# 521 "echo64.c" 1
	pxor  xmm0,      xmm12
# 0 "" 2
# 521 "echo64.c" 1
	pxor  xmm1,      xmm13
# 0 "" 2
# 521 "echo64.c" 1
	pxor  xmm2,      xmm14
# 0 "" 2
# 521 "echo64.c" 1
	pxor  xmm3,      xmm15
# 0 "" 2
# 521 "echo64.c" 1
	movaps  [OLDCV],      xmm0
# 0 "" 2
# 521 "echo64.c" 1
	movaps  [OLDCV+16],   xmm1
# 0 "" 2
# 521 "echo64.c" 1
	movaps  [OLDCV+2*16], xmm2
# 0 "" 2
# 521 "echo64.c" 1
	movaps  [OLDCV+3*16], xmm3
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm0, [rdi]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm1, [rdi+16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm2, [rdi+2*16]
# 0 "" 2
# 521 "echo64.c" 1
	movaps  xmm3, [rdi+3*16]
# 0 "" 2
# 526 "echo64.c" 1
	mov   eax, [rdi+16*2*8+8]
# 0 "" 2
# 527 "echo64.c" 1
	add   [rdi+16*2*8], rax
# 0 "" 2
# 528 "echo64.c" 1
	xor   rax, rax
# 0 "" 2
# 529 "echo64.c" 1
	mov   rdx, [rdi+16*2*8]
# 0 "" 2
# 530 "echo64.c" 1
	cmp   dword ptr [rdi+16*2*8+8], 0
# 0 "" 2
# 531 "echo64.c" 1
	cmove rdx, rax
# 0 "" 2
# 532 "echo64.c" 1
	mov   [rdi+16*2*8+8], eax
# 0 "" 2
# 533 "echo64.c" 1
	mov   rsi, 8*16*16
# 0 "" 2
# 534 "echo64.c" 1
	mov   rax, rdx
# 0 "" 2
# 535 "echo64.c" 1
	mov   rbx, rdx
# 0 "" 2
# 536 "echo64.c" 1
	mov   rcx, rdx
# 0 "" 2
# 537 "echo64.c" 1
	add   rbx, 1
# 0 "" 2
# 538 "echo64.c" 1
	add   rcx, 2
# 0 "" 2
# 539 "echo64.c" 1
	add   rdx, 3
# 0 "" 2
# 540 "echo64.c" 1
	LABEL_COUNTER_SETUP:
# 0 "" 2
# 541 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-16],    rax
# 0 "" 2
# 542 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-2*16],  rbx
# 0 "" 2
# 543 "echo64.c" 1
	add rax, 4
# 0 "" 2
# 544 "echo64.c" 1
	add rbx, 4
# 0 "" 2
# 545 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-3*16],  rcx
# 0 "" 2
# 546 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-4*16],  rdx
# 0 "" 2
# 547 "echo64.c" 1
	add rcx, 4
# 0 "" 2
# 548 "echo64.c" 1
	add rdx, 4
# 0 "" 2
# 549 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-5*16],  rax
# 0 "" 2
# 550 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-6*16],  rbx
# 0 "" 2
# 551 "echo64.c" 1
	add rax, 4
# 0 "" 2
# 552 "echo64.c" 1
	add rbx, 4
# 0 "" 2
# 553 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-7*16],  rcx
# 0 "" 2
# 554 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-8*16],  rdx
# 0 "" 2
# 555 "echo64.c" 1
	add rcx, 4
# 0 "" 2
# 556 "echo64.c" 1
	add rdx, 4
# 0 "" 2
# 557 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-9*16],  rax
# 0 "" 2
# 558 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-10*16], rbx
# 0 "" 2
# 559 "echo64.c" 1
	add rax, 4
# 0 "" 2
# 560 "echo64.c" 1
	add rbx, 4
# 0 "" 2
# 561 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-11*16], rcx
# 0 "" 2
# 562 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-12*16], rdx
# 0 "" 2
# 563 "echo64.c" 1
	add rcx, 4
# 0 "" 2
# 564 "echo64.c" 1
	add rdx, 4
# 0 "" 2
# 565 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-13*16], rax
# 0 "" 2
# 566 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-14*16], rbx
# 0 "" 2
# 567 "echo64.c" 1
	add rax, 4
# 0 "" 2
# 568 "echo64.c" 1
	add rbx, 4
# 0 "" 2
# 569 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-15*16], rcx
# 0 "" 2
# 570 "echo64.c" 1
	mov [SHA3_FULL_CNT+rsi-16*16], rdx
# 0 "" 2
# 571 "echo64.c" 1
	add rcx, 4
# 0 "" 2
# 572 "echo64.c" 1
	add rdx, 4
# 0 "" 2
# 573 "echo64.c" 1
	sub rsi, 16*16
# 0 "" 2
# 574 "echo64.c" 1
	ja LABEL_COUNTER_SETUP
# 0 "" 2
# 575 "echo64.c" 1
	mov   rcx, 8*16*16
# 0 "" 2
# 577 "echo64.c" 1
	LABEL_BIG_ROUND:
# 0 "" 2
# 578 "echo64.c" 1
	aesenc  xmm0, [SHA3_FULL_CNT+rcx- 1*16]
# 0 "" 2
# 579 "echo64.c" 1
	aesenc  xmm1, [SHA3_FULL_CNT+rcx- 2*16]
# 0 "" 2
# 580 "echo64.c" 1
	aesenc  xmm2, [SHA3_FULL_CNT+rcx- 3*16]
# 0 "" 2
# 581 "echo64.c" 1
	aesenc  xmm3, [SHA3_FULL_CNT+rcx- 4*16]
# 0 "" 2
# 582 "echo64.c" 1
	aesenc  xmm4, [SHA3_FULL_CNT+rcx- 5*16]
# 0 "" 2
# 583 "echo64.c" 1
	aesenc  xmm5, [SHA3_FULL_CNT+rcx- 6*16]
# 0 "" 2
# 584 "echo64.c" 1
	aesenc  xmm6, [SHA3_FULL_CNT+rcx- 7*16]
# 0 "" 2
# 585 "echo64.c" 1
	aesenc  xmm7, [SHA3_FULL_CNT+rcx- 8*16]
# 0 "" 2
# 586 "echo64.c" 1
	aesenc  xmm8, [SHA3_FULL_CNT+rcx- 9*16]
# 0 "" 2
# 587 "echo64.c" 1
	aesenc  xmm9, [SHA3_FULL_CNT+rcx-10*16]
# 0 "" 2
# 588 "echo64.c" 1
	aesenc  xmm10, [SHA3_FULL_CNT+rcx-11*16]
# 0 "" 2
# 589 "echo64.c" 1
	aesenc  xmm11, [SHA3_FULL_CNT+rcx-12*16]
# 0 "" 2
# 590 "echo64.c" 1
	aesenc  xmm12, [SHA3_FULL_CNT+rcx-13*16]
# 0 "" 2
# 591 "echo64.c" 1
	aesenc  xmm13, [SHA3_FULL_CNT+rcx-14*16]
# 0 "" 2
# 592 "echo64.c" 1
	aesenc  xmm14, [SHA3_FULL_CNT+rcx-15*16]
# 0 "" 2
# 593 "echo64.c" 1
	aesenc  xmm15, [SHA3_FULL_CNT+rcx-16*16]
# 0 "" 2
# 595 "echo64.c" 1
	aesenc  xmm0, [MEM_CST]
# 0 "" 2
# 596 "echo64.c" 1
	aesenc  xmm1, [MEM_CST]
# 0 "" 2
# 597 "echo64.c" 1
	aesenc  xmm2, [MEM_CST]
# 0 "" 2
# 598 "echo64.c" 1
	aesenc  xmm3, [MEM_CST]
# 0 "" 2
# 599 "echo64.c" 1
	aesenc  xmm4, [MEM_CST]
# 0 "" 2
# 600 "echo64.c" 1
	aesenc  xmm5, [MEM_CST]
# 0 "" 2
# 601 "echo64.c" 1
	aesenc  xmm6, [MEM_CST]
# 0 "" 2
# 602 "echo64.c" 1
	aesenc  xmm7, [MEM_CST]
# 0 "" 2
# 603 "echo64.c" 1
	aesenc  xmm8, [MEM_CST]
# 0 "" 2
# 604 "echo64.c" 1
	aesenc  xmm9, [MEM_CST]
# 0 "" 2
# 605 "echo64.c" 1
	aesenc  xmm10, [MEM_CST]
# 0 "" 2
# 606 "echo64.c" 1
	aesenc  xmm11, [MEM_CST]
# 0 "" 2
# 607 "echo64.c" 1
	aesenc  xmm12, [MEM_CST]
# 0 "" 2
# 608 "echo64.c" 1
	aesenc  xmm13, [MEM_CST]
# 0 "" 2
# 609 "echo64.c" 1
	aesenc  xmm14, [MEM_CST]
# 0 "" 2
# 610 "echo64.c" 1
	aesenc  xmm15, [MEM_CST]
# 0 "" 2
# 612 "echo64.c" 1
	movdqa [rdi+11*16], xmm11
# 0 "" 2
# 613 "echo64.c" 1
	movdqa [rdi+10*16], xmm6
# 0 "" 2
# 614 "echo64.c" 1
	movdqa [rdi+9*16],  xmm1
# 0 "" 2
# 615 "echo64.c" 1
	movdqa [rdi+8*16],  xmm12
# 0 "" 2
# 616 "echo64.c" 1
	movdqa [rdi+7*16],  xmm7
# 0 "" 2
# 617 "echo64.c" 1
	movdqa [rdi+6*16],  xmm2
# 0 "" 2
# 618 "echo64.c" 1
	movdqa [rdi+5*16],  xmm13
# 0 "" 2
# 619 "echo64.c" 1
	movdqa [rdi+4*16],  xmm8
# 0 "" 2
# 620 "echo64.c" 1
	movdqa [rdi+3*16],  xmm3
# 0 "" 2
# 621 "echo64.c" 1
	movdqa [rdi+2*16],  xmm14
# 0 "" 2
# 622 "echo64.c" 1
	movdqa [rdi+1*16],  xmm9
# 0 "" 2
# 623 "echo64.c" 1
	movdqa [rdi+0*16],  xmm4
# 0 "" 2
# 624 "echo64.c" 1
	movaps  xmm13, [MEM_CST+32]
# 0 "" 2
# 624 "echo64.c" 1
	movaps  xmm14, [MEM_CST+16]
# 0 "" 2
# 624 "echo64.c" 1
	movdqu  xmm7, xmm0
# 0 "" 2
# 624 "echo64.c" 1
	movdqu  xmm1, xmm5
# 0 "" 2
# 624 "echo64.c" 1
	movdqu  xmm2, xmm10
# 0 "" 2
# 624 "echo64.c" 1
	movdqu  xmm3, xmm15
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm4, xmm4
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm0, xmm1
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm2, xmm3
# 0 "" 2
# 624 "echo64.c" 1
	movdqu   xmm1, xmm0
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm4, xmm14
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm3, xmm7
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm1, xmm2
# 0 "" 2
# 624 "echo64.c" 1
	pand     xmm4, xmm0
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm0, xmm4
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm6, xmm6
# 0 "" 2
# 624 "echo64.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 624 "echo64.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 624 "echo64.c" 1
	pmullw   xmm4, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm6, xmm14
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm0, xmm4
# 0 "" 2
# 624 "echo64.c" 1
	pand     xmm6, xmm2
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm2, xmm6
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm4, xmm4
# 0 "" 2
# 624 "echo64.c" 1
	psrlw    xmm6, 7
# 0 "" 2
# 624 "echo64.c" 1
	psllw    xmm2, 1
# 0 "" 2
# 624 "echo64.c" 1
	pmullw   xmm6, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm4, xmm14
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm2, xmm6
# 0 "" 2
# 624 "echo64.c" 1
	pand     xmm4, xmm3
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm3, xmm4
# 0 "" 2
# 624 "echo64.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 624 "echo64.c" 1
	psllw    xmm3, 1
# 0 "" 2
# 624 "echo64.c" 1
	pmullw   xmm4, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm3, xmm4
# 0 "" 2
# 624 "echo64.c" 1
	movdqu   xmm4, xmm2
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm0, xmm1
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm4, xmm3
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm2, xmm1
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm3, xmm1
# 0 "" 2
# 624 "echo64.c" 1
	movdqu   xmm1, xmm4
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm0, xmm7
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm2, xmm10
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm3, xmm15
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm1, xmm5
# 0 "" 2
# 624 "echo64.c" 1
	movaps  xmm4, [rdi+0*16]
# 0 "" 2
# 624 "echo64.c" 1
	movaps  xmm5, [rdi+1*16]
# 0 "" 2
# 624 "echo64.c" 1
	movaps  xmm6, [rdi+2*16]
# 0 "" 2
# 624 "echo64.c" 1
	movaps  xmm7, [rdi+3*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm8, xmm8
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm4, xmm5
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm6, xmm7
# 0 "" 2
# 624 "echo64.c" 1
	movdqu   xmm5, xmm4
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm8, xmm14
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm7, [rdi+0*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm5, xmm6
# 0 "" 2
# 624 "echo64.c" 1
	pand     xmm8, xmm4
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm4, xmm8
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm9, xmm9
# 0 "" 2
# 624 "echo64.c" 1
	psrlw    xmm8, 7
# 0 "" 2
# 624 "echo64.c" 1
	psllw    xmm4, 1
# 0 "" 2
# 624 "echo64.c" 1
	pmullw   xmm8, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm9, xmm14
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm4, xmm8
# 0 "" 2
# 624 "echo64.c" 1
	pand     xmm9, xmm6
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm6, xmm9
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm8, xmm8
# 0 "" 2
# 624 "echo64.c" 1
	psrlw    xmm9, 7
# 0 "" 2
# 624 "echo64.c" 1
	psllw    xmm6, 1
# 0 "" 2
# 624 "echo64.c" 1
	pmullw   xmm9, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm8, xmm14
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm6, xmm9
# 0 "" 2
# 624 "echo64.c" 1
	pand     xmm8, xmm7
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm7, xmm8
# 0 "" 2
# 624 "echo64.c" 1
	psrlw    xmm8, 7
# 0 "" 2
# 624 "echo64.c" 1
	psllw    xmm7, 1
# 0 "" 2
# 624 "echo64.c" 1
	pmullw   xmm8, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm7, xmm8
# 0 "" 2
# 624 "echo64.c" 1
	movdqu   xmm8, xmm6
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm4, xmm5
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm8, xmm7
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm6, xmm5
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm8, xmm4
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 624 "echo64.c" 1
	movdqu   xmm5, xmm8
# 0 "" 2
# 624 "echo64.c" 1
	movaps   xmm8,  [rdi+4*16]
# 0 "" 2
# 624 "echo64.c" 1
	movaps   xmm9,  [rdi+5*16]
# 0 "" 2
# 624 "echo64.c" 1
	movaps   xmm10, [rdi+6*16]
# 0 "" 2
# 624 "echo64.c" 1
	movaps   xmm11, [rdi+7*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm4,  [rdi+0*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm5,  [rdi+1*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm6,  [rdi+2*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm7,  [rdi+3*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm12, xmm12
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm8, xmm9
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm10, xmm11
# 0 "" 2
# 624 "echo64.c" 1
	movdqu   xmm9, xmm8
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm12, xmm14
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm11, [rdi+4*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm9, xmm10
# 0 "" 2
# 624 "echo64.c" 1
	pand     xmm12, xmm8
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm8, xmm12
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm15, xmm15
# 0 "" 2
# 624 "echo64.c" 1
	psrlw    xmm12, 7
# 0 "" 2
# 624 "echo64.c" 1
	psllw    xmm8, 1
# 0 "" 2
# 624 "echo64.c" 1
	pmullw   xmm12, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm15, xmm14
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm8, xmm12
# 0 "" 2
# 624 "echo64.c" 1
	pand     xmm15, xmm10
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm10, xmm15
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm12, xmm12
# 0 "" 2
# 624 "echo64.c" 1
	psrlw    xmm15, 7
# 0 "" 2
# 624 "echo64.c" 1
	psllw    xmm10, 1
# 0 "" 2
# 624 "echo64.c" 1
	pmullw   xmm15, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm12, xmm14
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm10, xmm15
# 0 "" 2
# 624 "echo64.c" 1
	pand     xmm12, xmm11
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm11, xmm12
# 0 "" 2
# 624 "echo64.c" 1
	psrlw    xmm12, 7
# 0 "" 2
# 624 "echo64.c" 1
	psllw    xmm11, 1
# 0 "" 2
# 624 "echo64.c" 1
	pmullw   xmm12, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm11, xmm12
# 0 "" 2
# 624 "echo64.c" 1
	movdqu   xmm12, xmm10
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm8, xmm9
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm12, xmm11
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm10, xmm9
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm12, xmm8
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm11, xmm9
# 0 "" 2
# 624 "echo64.c" 1
	movdqu   xmm9, xmm12
# 0 "" 2
# 624 "echo64.c" 1
	movaps   xmm12, [rdi+ 8*16]
# 0 "" 2
# 624 "echo64.c" 1
	movaps   xmm13, [rdi+ 9*16]
# 0 "" 2
# 624 "echo64.c" 1
	movaps   xmm14, [rdi+10*16]
# 0 "" 2
# 624 "echo64.c" 1
	movaps   xmm15, [rdi+11*16]
# 0 "" 2
# 624 "echo64.c" 1
	movaps  [rdi+12*16], xmm0
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm8,  [rdi+ 4*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm9,  [rdi+ 5*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm10, [rdi+ 6*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm11, [rdi+ 7*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm0, xmm0
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm12, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm14, xmm15
# 0 "" 2
# 624 "echo64.c" 1
	movdqu   xmm13, xmm12
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm0, [MEM_CST+16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm15, [rdi+8*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm13, xmm14
# 0 "" 2
# 624 "echo64.c" 1
	pand     xmm0, xmm12
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm12, xmm0
# 0 "" 2
# 624 "echo64.c" 1
	psrlw    xmm0, 7
# 0 "" 2
# 624 "echo64.c" 1
	psllw    xmm12, 1
# 0 "" 2
# 624 "echo64.c" 1
	pmullw   xmm0, [MEM_CST+32]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm12, xmm0
# 0 "" 2
# 624 "echo64.c" 1
	movaps   xmm0, [MEM_CST+16]
# 0 "" 2
# 624 "echo64.c" 1
	pand     xmm0, xmm14
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm14, xmm0
# 0 "" 2
# 624 "echo64.c" 1
	psrlw    xmm0, 7
# 0 "" 2
# 624 "echo64.c" 1
	psllw    xmm14, 1
# 0 "" 2
# 624 "echo64.c" 1
	pmullw   xmm0, [MEM_CST+32]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm14, xmm0
# 0 "" 2
# 624 "echo64.c" 1
	movaps   xmm0, [MEM_CST+16]
# 0 "" 2
# 624 "echo64.c" 1
	pand     xmm0, xmm15
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm15, xmm0
# 0 "" 2
# 624 "echo64.c" 1
	psrlw    xmm0, 7
# 0 "" 2
# 624 "echo64.c" 1
	psllw    xmm15, 1
# 0 "" 2
# 624 "echo64.c" 1
	pmullw   xmm0, [MEM_CST+32]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm15, xmm0
# 0 "" 2
# 624 "echo64.c" 1
	movdqu   xmm0, xmm14
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm12, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm0, xmm15
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm14, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm0, xmm12
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm15, xmm13
# 0 "" 2
# 624 "echo64.c" 1
	movdqu   xmm13, xmm0
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm12, [rdi+ 8*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm13, [rdi+ 9*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm14, [rdi+10*16]
# 0 "" 2
# 624 "echo64.c" 1
	pxor     xmm15, [rdi+11*16]
# 0 "" 2
# 624 "echo64.c" 1
	movaps   xmm0,  [rdi+12*16]
# 0 "" 2
# 625 "echo64.c" 1
	sub rcx, 16*16
# 0 "" 2
# 626 "echo64.c" 1
	jne LABEL_BIG_ROUND
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm0,      xmm4
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm1,      xmm5
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm2,      xmm6
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm3,      xmm7
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm0,      xmm8
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm1,      xmm9
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm2,      xmm10
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm3,      xmm11
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm0,     xmm12
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm1,     xmm13
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm2,     xmm14
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm3,     xmm15
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm0, [OLDCV]
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm1, [OLDCV+16]
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm2, [OLDCV+2*16]
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm3, [OLDCV+3*16]
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm0, xmm2
# 0 "" 2
# 630 "echo64.c" 1
	pxor  xmm1, xmm3
# 0 "" 2
# 630 "echo64.c" 1
	movaps  [rdi],        xmm0
# 0 "" 2
# 630 "echo64.c" 1
	movaps  [rdi+16],     xmm1
# 0 "" 2
# 635 "echo64.c" 1
	pop rbx
# 0 "" 2
# 635 "echo64.c" 1
	pop rax
# 0 "" 2
# 635 "echo64.c" 1
	pop rcx
# 0 "" 2
# 635 "echo64.c" 1
	pop rdx
# 0 "" 2
# 636 "echo64.c" 1
	.att_syntax noprefix
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE539:
	.size	Compress, .-Compress
	.p2align 4,,15
.globl Init
	.type	Init, @function
Init:
.LFB540:
	.cfi_startproc
	movabsq	$-9187201950435737472, %rax
	movabsq	$-9187201950435737472, %r11
	movabsq	$7599940337074203, %r10
	movq	%rax, MEM_CST+16(%rip)
	movabsq	$7599940337074203, %r9
	movabsq	$-72340172838076674, %rax
	movabsq	$72340172838076673, %r8
	movabsq	$72340172838076673, %rcx
	movabsq	$-72340172838076674, %rdx
	movq	%rax, MEM_CST+72(%rip)
	movq	$0, MEM_CST(%rip)
	xorl	%eax, %eax
	movq	$0, MEM_CST+8(%rip)
	movq	%r11, MEM_CST+24(%rip)
	movq	%r10, MEM_CST+32(%rip)
	movq	%r9, MEM_CST+40(%rip)
	movq	%r8, MEM_CST+48(%rip)
	movq	%rcx, MEM_CST+56(%rip)
	movq	%rdx, MEM_CST+64(%rip)
	movq	$0, MEM_CST+80(%rip)
	movq	$0, MEM_CST+88(%rip)
	.p2align 4,,10
	.p2align 3
.L4:
	movq	$0, SHA3_FULL_CNT+135(%rax)
	subq	$1, %rax
	cmpq	$-128, %rax
	jne	.L4
	leal	-160(%rsi), %edx
	movl	$2, %eax
	cmpl	$352, %edx
	ja	.L6
	xorl	%eax, %eax
	cmpl	$257, %esi
	movl	%esi, 268(%rdi)
	setge	%al
	movslq	%esi,%rsi
	movq	%rdi, %rdx
	leal	2(%rax,%rax), %eax
	xorl	%ecx, %ecx
	movl	%eax, 272(%rdi)
	.p2align 4,,10
	.p2align 3
.L9:
	addl	$1, %ecx
	movq	%rsi, (%rdx)
	movq	$0, 8(%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %eax
	jg	.L9
	addl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L11:
	movslq	%eax,%rdx
	movq	$0, (%rdi,%rdx,8)
	leal	1(%rax), %edx
	addl	$2, %eax
	cmpl	$32, %eax
	movslq	%edx,%rdx
	movq	$0, (%rdi,%rdx,8)
	jne	.L11
	movq	$0, 256(%rdi)
	movl	$0, 264(%rdi)
	xorb	%al, %al
.L6:
	rep
	ret
	.cfi_endproc
.LFE540:
	.size	Init, .-Init
	.p2align 4,,15
.globl Final
	.type	Final, @function
Final:
.LFB542:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%r13
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	movl	$16, %r12d
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
	pushq	%rbp
	.cfi_def_cfa_offset 40
	movq	%rsi, %rbp
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	movl	272(%rdi), %esi
	movq	%rdi, %rbx
	.cfi_offset 3, -48
	movl	264(%rdi), %eax
	subl	%esi, %r12d
	sall	$4, %esi
	sall	$7, %r12d
	movslq	%esi,%rsi
	movl	%r12d, %edx
	leaq	(%rdi,%rsi), %rsi
	subl	%eax, %edx
	cmpl	$144, %edx
	jg	.L18
	leal	7(%rax), %r8d
	testl	%eax, %eax
	movl	%eax, %edx
	movl	$255, %edi
	cmovns	%eax, %r8d
	sarl	$31, %edx
	shrl	$29, %edx
	sarl	$3, %r8d
	leal	(%rax,%rdx), %ecx
	movslq	%r8d,%r8
	leaq	(%rsi,%r8), %r8
	andl	$7, %ecx
	subl	%ecx, %edx
	leal	7(%rdx), %ecx
	movl	$1, %edx
	sall	%cl, %edx
	orb	(%r8), %dl
	leal	(%rcx,%rax), %eax
	sall	%cl, %edi
	andl	%edi, %edx
	testl	%eax, %eax
	movb	%dl, (%r8)
	jle	.L19
	movl	%r12d, %edx
	subl	%eax, %edx
	leal	7(%rdx), %ecx
	testl	%edx, %edx
	cmovs	%ecx, %edx
	sarl	$3, %eax
	cltq
	sarl	$3, %edx
	leaq	1(%rsi,%rax), %rdi
	movslq	%edx,%rdx
	xorl	%esi, %esi
	call	memset
	movq	%rbx, %rdi
	call	Compress
	movl	272(%rbx), %r14d
	movslq	264(%rbx),%r13
	addq	256(%rbx), %r13
	sall	$4, %r14d
	movslq	%r14d,%r14
	leaq	(%rbx,%r14), %r14
.L20:
	subl	$144, %r12d
	movq	%r14, %rdi
	leal	7(%r12), %eax
	testl	%r12d, %r12d
	cmovs	%eax, %r12d
	xorl	%esi, %esi
	sarl	$3, %r12d
	movslq	%r12d,%rdx
	call	memset
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L18:
	leal	7(%rax), %edx
	testl	%eax, %eax
	movl	$255, %edi
	cmovns	%eax, %edx
	sarl	$3, %edx
	movslq	%edx,%rdx
	addq	%rdx, %rsi
	movl	%eax, %edx
	sarl	$31, %edx
	shrl	$29, %edx
	leal	(%rax,%rdx), %ecx
	andl	$7, %ecx
	subl	%ecx, %edx
	leal	7(%rdx), %ecx
	movl	$1, %edx
	sall	%cl, %edx
	orb	(%rsi), %dl
	sall	%cl, %edi
	leal	(%rcx,%rax), %eax
	andl	%edi, %edx
	movb	%dl, (%rsi)
.L19:
	movl	272(%rbx), %r14d
	movslq	264(%rbx),%r13
	addq	256(%rbx), %r13
	sall	$4, %r14d
	testl	%eax, %eax
	movslq	%r14d,%r14
	leaq	(%rbx,%r14), %r14
	je	.L20
	subl	$144, %r12d
	leal	7(%rax), %ecx
	subl	%eax, %r12d
	leal	7(%r12), %edx
	testl	%r12d, %r12d
	cmovs	%edx, %r12d
	sarl	$3, %r12d
	testl	%eax, %eax
	cmovs	%ecx, %eax
	movslq	%r12d,%rdx
	xorl	%esi, %esi
	sarl	$3, %eax
	cltq
	leaq	1(%r14,%rax), %rdi
	call	memset
.L22:
	movl	$16, %eax
	subl	272(%rbx), %eax
	movl	268(%rbx), %edx
	movq	%rbx, %rdi
	sall	$4, %eax
	cltq
	leaq	-18(%r14,%rax), %rax
	movb	%dl, (%rax)
	movl	268(%rbx), %edx
	movb	%r13b, 2(%rax)
	movb	$0, 10(%rax)
	movb	$0, 11(%rax)
	movb	$0, 12(%rax)
	sarl	$8, %edx
	movb	$0, 13(%rax)
	movb	$0, 14(%rax)
	movb	%dl, 1(%rax)
	movq	%r13, %rdx
	movb	$0, 15(%rax)
	shrq	$8, %rdx
	movb	$0, 16(%rax)
	movb	$0, 17(%rax)
	movb	%dl, 3(%rax)
	movq	%r13, %rdx
	shrq	$16, %rdx
	movb	%dl, 4(%rax)
	movq	%r13, %rdx
	shrq	$24, %rdx
	movb	%dl, 5(%rax)
	movq	%r13, %rdx
	shrq	$32, %rdx
	movb	%dl, 6(%rax)
	movq	%r13, %rdx
	shrq	$40, %rdx
	movb	%dl, 7(%rax)
	movq	%r13, %rdx
	shrq	$56, %r13
	shrq	$48, %rdx
	movb	%r13b, 9(%rax)
	movb	%dl, 8(%rax)
	call	Compress
	movl	268(%rbx), %eax
	sarl	$3, %eax
	testl	%eax, %eax
	je	.L23
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L24:
	movl	%eax, %edx
	movl	%eax, %ecx
	mov	%eax, %esi
	shrl	$3, %edx
	andl	$7, %ecx
	addl	$1, %eax
	mov	%edx, %edx
	sall	$3, %ecx
	movq	(%rbx,%rdx,8), %rdx
	shrq	%cl, %rdx
	movb	%dl, (%rbp,%rsi)
	movl	268(%rbx), %edx
	sarl	$3, %edx
	cmpl	%eax, %edx
	ja	.L24
.L23:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	xorl	%eax, %eax
	popq	%r14
	ret
	.cfi_endproc
.LFE542:
	.size	Final, .-Final
	.p2align 4,,15
.globl Update
	.type	Update, @function
Update:
.LFB541:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	movq	%rdi, %r15
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	movq	%rsi, %rbp
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	272(%rdi), %eax
	movl	264(%rdi), %ebx
	.cfi_offset 3, -56
	movq	%rdx, 24(%rsp)
	movq	24(%rsp), %r12
	sall	$4, %eax
	sarl	$3, %ebx
	movslq	%eax,%rdx
	shrq	$3, %r12
	leaq	(%rdi,%rdx), %rdx
	testq	%r12, %r12
	movq	%rdx, 16(%rsp)
	jle	.L39
	movl	$256, 12(%rsp)
	subl	%eax, 12(%rsp)
	.p2align 4,,10
	.p2align 3
.L31:
	movl	12(%rsp), %r14d
	subl	%ebx, %r14d
	movslq	%r14d,%r13
	cmpq	%r12, %r13
	jg	.L30
	movq	16(%rsp), %rdi
	movslq	%ebx,%rbx
	movq	%rbp, %rsi
	movq	%r13, %rdx
	sall	$3, %r14d
	subq	%r13, %r12
	addq	%r13, %rbp
	addq	%rbx, %rdi
	xorl	%ebx, %ebx
	call	memcpy
	addl	%r14d, 264(%r15)
	movq	%r15, %rdi
	call	Compress
	testq	%r12, %r12
	jg	.L31
	xorl	%eax, %eax
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L30:
	movslq	%ebx,%rdi
	addq	16(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r12, %rdx
	addl	%r12d, %ebx
	addq	%r12, %rbp
	call	memcpy
.L39:
	leal	0(,%rbx,8), %eax
.L29:
	movq	24(%rsp), %rcx
	movl	%eax, 264(%r15)
	andl	$7, %ecx
	je	.L32
	addl	%ecx, %eax
	movl	%eax, 264(%r15)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	je	.L34
	movl	$7, %edx
	movl	$1, %esi
	subl	%ecx, %edx
	movl	$7, %ecx
	.p2align 4,,10
	.p2align 3
.L35:
	movl	%esi, %edi
	sall	%cl, %edi
	subl	$1, %ecx
	orl	%edi, %eax
	cmpl	%edx, %ecx
	jne	.L35
	andb	(%rbp), %al
.L34:
	movq	16(%rsp), %rdx
	movslq	%ebx,%rbx
	movb	%al, (%rdx,%rbx)
.L32:
	addq	$40, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.cfi_endproc
.LFE541:
	.size	Update, .-Update
	.p2align 4,,15
.globl Hash
	.type	Hash, @function
Hash:
.LFB543:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	movabsq	$-9187201950435737472, %r11
	movabsq	$-9187201950435737472, %r10
	movabsq	$7599940337074203, %r9
	movabsq	$7599940337074203, %r8
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	movabsq	$72340172838076673, %rbp
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	pushq	%rbx
	.cfi_def_cfa_offset 56
	movq	%rsi, %rbx
	.cfi_offset 3, -56
	movabsq	$72340172838076673, %rsi
	subq	$328, %rsp
	.cfi_def_cfa_offset 384
	movq	$0, MEM_CST(%rip)
	movq	$0, MEM_CST+8(%rip)
	movq	%rdx, 16(%rsp)
	movq	%rcx, 24(%rsp)
	movabsq	$-72340172838076674, %rdx
	movabsq	$-72340172838076674, %rcx
	movq	%r11, MEM_CST+16(%rip)
	movq	%r10, MEM_CST+24(%rip)
	movq	%r9, MEM_CST+32(%rip)
	movq	%r8, MEM_CST+40(%rip)
	movq	%rbp, MEM_CST+48(%rip)
	movq	%rsi, MEM_CST+56(%rip)
	movq	%rcx, MEM_CST+64(%rip)
	movq	%rdx, MEM_CST+72(%rip)
	movq	$0, MEM_CST+80(%rip)
	movq	$0, MEM_CST+88(%rip)
	.p2align 4,,10
	.p2align 3
.L41:
	movq	$0, SHA3_FULL_CNT+135(%rax)
	subq	$1, %rax
	cmpq	$-128, %rax
	jne	.L41
	leal	-160(%rdi), %edx
	movl	$2, %eax
	cmpl	$352, %edx
	ja	.L43
	xorl	%ecx, %ecx
	cmpl	$257, %edi
	leaq	32(%rsp), %r12
	setge	%cl
	movl	%edi, 300(%rsp)
	xorl	%edx, %edx
	leal	2(%rcx,%rcx), %ecx
	movslq	%edi,%rdi
	movq	%r12, %rax
	movl	%ecx, 304(%rsp)
	.p2align 4,,10
	.p2align 3
.L45:
	addl	$1, %edx
	movq	%rdi, (%rax)
	movq	$0, 8(%rax)
	addq	$16, %rax
	cmpl	%ecx, %edx
	jl	.L45
	leal	(%rcx,%rcx), %eax
	.p2align 4,,10
	.p2align 3
.L48:
	movslq	%eax,%rdx
	movq	$0, 32(%rsp,%rdx,8)
	leal	1(%rax), %edx
	addl	$2, %eax
	cmpl	$32, %eax
	movslq	%edx,%rdx
	movq	$0, 32(%rsp,%rdx,8)
	jne	.L48
	movq	16(%rsp), %r13
	sall	$4, %ecx
	movq	$0, 288(%rsp)
	movslq	%ecx,%rbp
	movl	$0, 296(%rsp)
	leaq	(%r12,%rbp), %rbp
	shrq	$3, %r13
	testq	%r13, %r13
	jle	.L49
	movw	$256, %ax
	movq	%r13, %r15
	subl	%ecx, %eax
	movslq	%eax,%r14
	sall	$3, %eax
	movl	%eax, 12(%rsp)
	movq	%r14, %rax
	subq	%r14, %r15
	negq	%rax
	movq	%rax, (%rsp)
.L51:
	cmpq	%r14, %r13
	jl	.L50
	movq	%rbx, %rsi
	movq	%r14, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	%r12, %rdi
	movl	12(%rsp), %eax
	addl	%eax, 296(%rsp)
	call	Compress
	addq	(%rsp), %r15
	addq	%r14, %rbx
	addq	(%rsp), %r13
	leaq	(%r15,%r14), %rax
	testq	%rax, %rax
	jg	.L51
.L49:
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L50:
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	memcpy
	movl	%r13d, %edx
	addq	%r13, %rbx
	leal	0(,%rdx,8), %eax
.L52:
	movq	16(%rsp), %rcx
	movl	%eax, 296(%rsp)
	andl	$7, %ecx
	je	.L53
	addl	%ecx, %eax
	movl	%eax, 296(%rsp)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	je	.L55
	movl	$7, %esi
	movl	$1, %edi
	subl	%ecx, %esi
	movl	$7, %ecx
	.p2align 4,,10
	.p2align 3
.L56:
	movl	%edi, %r8d
	sall	%cl, %r8d
	subl	$1, %ecx
	orl	%r8d, %eax
	cmpl	%esi, %ecx
	jne	.L56
	andb	(%rbx), %al
.L55:
	movslq	%edx,%rdx
	movb	%al, (%rbp,%rdx)
.L53:
	movq	24(%rsp), %rsi
	movq	%r12, %rdi
	call	Final
.L43:
	addq	$328, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.cfi_endproc
.LFE543:
	.size	Hash, .-Hash
	.p2align 4,,15
	.type	T.43, @function
T.43:
.LFB545:
	.cfi_startproc
	movq	%rbx, -48(%rsp)
	movq	%r12, -32(%rsp)
	movabsq	$72340172838076673, %rax
	movq	%r13, -24(%rsp)
	movq	%r14, -16(%rsp)
	movq	%rdi, %rbx
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -56
	movq	%r15, -8(%rsp)
	movq	%rbp, -40(%rsp)
	subq	$360, %rsp
	.cfi_def_cfa_offset 368
	movq	%rsi, 8(%rsp)
	movq	%rdx, %r12
	movabsq	$-9187201950435737472, %rdi
	movabsq	$-9187201950435737472, %rsi
	movabsq	$7599940337074203, %rcx
	movabsq	$7599940337074203, %rdx
	movabsq	$72340172838076673, %r15
	.cfi_offset 6, -48
	.cfi_offset 15, -16
	movabsq	$-72340172838076674, %r14
	movabsq	$-72340172838076674, %r13
	movq	%rax, MEM_CST+48(%rip)
	movq	$0, MEM_CST(%rip)
	xorl	%eax, %eax
	movq	$0, MEM_CST+8(%rip)
	movq	%rdi, MEM_CST+16(%rip)
	movq	%rsi, MEM_CST+24(%rip)
	movq	%rcx, MEM_CST+32(%rip)
	movq	%rdx, MEM_CST+40(%rip)
	movq	%r15, MEM_CST+56(%rip)
	movq	%r14, MEM_CST+64(%rip)
	movq	%r13, MEM_CST+72(%rip)
	movq	$0, MEM_CST+80(%rip)
	movq	$0, MEM_CST+88(%rip)
.L64:
	movq	$0, SHA3_FULL_CNT+135(%rax)
	subq	$1, %rax
	cmpq	$-128, %rax
	jne	.L64
	movdqa	.LC0(%rip), %xmm0
	leaq	16(%rsp), %rbp
	movq	8(%rsp), %r13
	movl	$256, 284(%rsp)
	movdqa	%xmm0, 16(%rsp)
	movl	$2, 288(%rsp)
	leaq	32(%rbp), %r15
	movl	$0, 280(%rsp)
	movdqa	%xmm0, 32(%rsp)
	pxor	%xmm0, %xmm0
	shrq	$3, %r13
	testq	%r13, %r13
	movdqa	%xmm0, 48(%rsp)
	movdqa	%xmm0, 64(%rsp)
	movdqa	%xmm0, 80(%rsp)
	movdqa	%xmm0, 96(%rsp)
	movdqa	%xmm0, 112(%rsp)
	movdqa	%xmm0, 128(%rsp)
	movdqa	%xmm0, 144(%rsp)
	movdqa	%xmm0, 160(%rsp)
	movdqa	%xmm0, 176(%rsp)
	movdqa	%xmm0, 192(%rsp)
	movdqa	%xmm0, 208(%rsp)
	movdqa	%xmm0, 224(%rsp)
	movdqa	%xmm0, 240(%rsp)
	movdqa	%xmm0, 240(%rbp)
	movq	$0, 272(%rsp)
	jle	.L65
	movq	%r13, %r14
	subq	$224, %r14
	jmp	.L67
	.p2align 4,,10
	.p2align 3
.L77:
	movq	%rbx, %rsi
	movl	$224, %edx
	movq	%r15, %rdi
	call	memcpy
	subq	$224, %r14
	movq	%rbp, %rdi
	addl	$1792, 280(%rsp)
	call	Compress
	leaq	224(%r14), %rax
	addq	$224, %rbx
	subq	$224, %r13
	testq	%rax, %rax
	jle	.L65
.L67:
	cmpq	$224, %r13
	jge	.L77
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	memcpy
	movl	%r13d, %edx
	addq	%r13, %rbx
	leal	0(,%rdx,8), %eax
.L68:
	movq	8(%rsp), %rcx
	movl	%eax, 280(%rsp)
	andl	$7, %ecx
	je	.L69
	addl	%ecx, %eax
	movl	%eax, 280(%rsp)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	je	.L71
	movl	$7, %esi
	movl	$1, %edi
	subl	%ecx, %esi
	movl	$7, %ecx
	.p2align 4,,10
	.p2align 3
.L72:
	movl	%edi, %r8d
	sall	%cl, %r8d
	subl	$1, %ecx
	orl	%r8d, %eax
	cmpl	%esi, %ecx
	jne	.L72
	andb	(%rbx), %al
.L71:
	movslq	%edx,%rdx
	movb	%al, 32(%rbp,%rdx)
.L69:
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	Final
	movq	312(%rsp), %rbx
	movq	320(%rsp), %rbp
	movq	328(%rsp), %r12
	movq	336(%rsp), %r13
	movq	344(%rsp), %r14
	movq	352(%rsp), %r15
	addq	$360, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L65:
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L68
	.cfi_endproc
.LFE545:
	.size	T.43, .-T.43
	.p2align 4,,15
.globl crypto_hash_echosp256_aes_aes64
	.type	crypto_hash_echosp256_aes_aes64, @function
crypto_hash_echosp256_aes_aes64:
.LFB544:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rsi, %rdi
	leaq	0(,%rdx,8), %rsi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rax, %rdx
	call	T.43
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addq	$8, %rsp
	notl	%eax
	ret
	.cfi_endproc
.LFE544:
	.size	crypto_hash_echosp256_aes_aes64, .-crypto_hash_echosp256_aes_aes64
	.comm	OLDCV,64,16
	.comm	MEM_CST,96,16
	.comm	SHA3_CNT,16,16
	.comm	SHA3_FULL_CNT,2048,16
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	256
	.quad	0
	.ident	"GCC: (Debian 4.4.3-7) 4.4.3"
	.section	.note.GNU-stack,"",@progbits
