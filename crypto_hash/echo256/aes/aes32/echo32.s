#------------------------------------------------------------------------------------ #
# Implementation of the double pipe ECHO hash function in its 256-bit outputs variant.#
# Optimized for Intel AES-NI, 32-bit mode                                             #
#                                                                                     #
# Date:     2010-07-23                                                                #
#                                                                                     #
# Authors:  Ryad Benadjila  <ryadbenadjila@gmail.com>                                 #
#           Olivier Billet  <billet@eurecom.fr>                                       #
#------------------------------------------------------------------------------------ #
	.file	"echo32.c"
	.text
	.p2align 4,,15
.globl Compress
	.type	Compress, @function
Compress:
	pushl	%ebp
	movl	%esp, %ebp
#APP
# 493 "echo32.c" 1
	.intel_syntax noprefix
# 0 "" 2
# 494 "echo32.c" 1
	pusha
# 0 "" 2
# 496 "echo32.c" 1
	mov    [SHA3_ESP], esp
# 0 "" 2
# 506 "echo32.c" 1
	movd   xmm0, [SHA3_S+16*2*8+8]
# 0 "" 2
# 506 "echo32.c" 1
	movq   xmm1, [SHA3_S+16*2*8]
# 0 "" 2
# 506 "echo32.c" 1
	paddq  xmm1, xmm0
# 0 "" 2
# 506 "echo32.c" 1
	movq  [SHA3_S+16*2*8], xmm1
# 0 "" 2
# 506 "echo32.c" 1
	pxor   xmm0, xmm0
# 0 "" 2
# 506 "echo32.c" 1
	movq   xmm1, [SHA3_S+16*2*8]
# 0 "" 2
# 506 "echo32.c" 1
	cmp    dword ptr [SHA3_S+16*2*8+8], 0
# 0 "" 2
# 506 "echo32.c" 1
	jne    NEXT
# 0 "" 2
# 506 "echo32.c" 1
	movq   xmm1, xmm0
# 0 "" 2
# 506 "echo32.c" 1
	NEXT:    
# 0 "" 2
# 506 "echo32.c" 1
	movd   [SHA3_S+16*2*8+8], xmm0
# 0 "" 2
# 506 "echo32.c" 1
	mov    esi, 8*16*16
# 0 "" 2
# 506 "echo32.c" 1
	movaps xmm0, xmm1
# 0 "" 2
# 506 "echo32.c" 1
	movaps xmm2, xmm1
# 0 "" 2
# 506 "echo32.c" 1
	movaps xmm3, xmm1
# 0 "" 2
# 506 "echo32.c" 1
	paddq  xmm1, [ONE]
# 0 "" 2
# 506 "echo32.c" 1
	paddq  xmm2, [TWO]
# 0 "" 2
# 506 "echo32.c" 1
	paddq  xmm3, [THREE]
# 0 "" 2
# 506 "echo32.c" 1
	movaps xmm5, [FOUR]
# 0 "" 2
# 506 "echo32.c" 1
	LABEL_COUNTER_SETUP:
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-16],    xmm0
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-2*16],  xmm1
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm0, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm1, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-3*16],  xmm2
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-4*16],  xmm3
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm2, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm3, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-5*16],  xmm0
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-6*16],  xmm1
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm0, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm1, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-7*16],  xmm2
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-8*16],  xmm3
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm2, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm3, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-9*16],  xmm0
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-10*16], xmm1
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm0, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm1, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-11*16], xmm2
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-12*16], xmm3
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm2, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm3, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-13*16], xmm0
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-14*16], xmm1
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm0, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm1, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-15*16], xmm2
# 0 "" 2
# 506 "echo32.c" 1
	movq [SHA3_FULL_CNT+esi-16*16], xmm3
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm2, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	paddq xmm3, xmm5
# 0 "" 2
# 506 "echo32.c" 1
	sub esi, 16*16
# 0 "" 2
# 506 "echo32.c" 1
	ja LABEL_COUNTER_SETUP
# 0 "" 2
# 509 "echo32.c" 1
	movaps  xmm0, [SHA3_S]
# 0 "" 2
# 509 "echo32.c" 1
	movaps  xmm1, [SHA3_S+16]
# 0 "" 2
# 509 "echo32.c" 1
	movaps  xmm2, [SHA3_S+2*16]
# 0 "" 2
# 509 "echo32.c" 1
	movaps  xmm3, [SHA3_S+3*16]
# 0 "" 2
# 509 "echo32.c" 1
	pxor    xmm0, [SHA3_S+4*16]
# 0 "" 2
# 509 "echo32.c" 1
	pxor    xmm1, [SHA3_S+4*16+16]
# 0 "" 2
# 509 "echo32.c" 1
	pxor    xmm2, [SHA3_S+4*16+2*16]
# 0 "" 2
# 509 "echo32.c" 1
	pxor    xmm3, [SHA3_S+4*16+3*16]
# 0 "" 2
# 509 "echo32.c" 1
	pxor    xmm0, [SHA3_S+8*16]
# 0 "" 2
# 509 "echo32.c" 1
	pxor    xmm1, [SHA3_S+8*16+16]
# 0 "" 2
# 509 "echo32.c" 1
	pxor    xmm2, [SHA3_S+8*16+2*16]
# 0 "" 2
# 509 "echo32.c" 1
	pxor    xmm3, [SHA3_S+8*16+3*16]
# 0 "" 2
# 509 "echo32.c" 1
	pxor    xmm0, [SHA3_S+12*16]
# 0 "" 2
# 509 "echo32.c" 1
	pxor    xmm1, [SHA3_S+12*16+16]
# 0 "" 2
# 509 "echo32.c" 1
	pxor    xmm2, [SHA3_S+12*16+2*16]
# 0 "" 2
# 509 "echo32.c" 1
	pxor    xmm3, [SHA3_S+12*16+3*16]
# 0 "" 2
# 509 "echo32.c" 1
	movaps  [OLDCV],	   xmm0
# 0 "" 2
# 509 "echo32.c" 1
	movaps  [OLDCV+16],   xmm1
# 0 "" 2
# 509 "echo32.c" 1
	movaps  [OLDCV+2*16], xmm2
# 0 "" 2
# 509 "echo32.c" 1
	movaps  [OLDCV+3*16], xmm3
# 0 "" 2
# 514 "echo32.c" 1
	mov   ecx, 8*16*16
# 0 "" 2
# 516 "echo32.c" 1
	LABEL_BIG_ROUND:
# 0 "" 2
# 517 "echo32.c" 1
	movdqa   xmm0, [SHA3_S]
# 0 "" 2
# 518 "echo32.c" 1
	movdqa   xmm1, [SHA3_S+1*16]
# 0 "" 2
# 519 "echo32.c" 1
	movdqa   xmm2, [SHA3_S+2*16]
# 0 "" 2
# 520 "echo32.c" 1
	movdqa   xmm3, [SHA3_S+3*16]
# 0 "" 2
# 521 "echo32.c" 1
	movdqa   xmm4, [SHA3_S+4*16]
# 0 "" 2
# 522 "echo32.c" 1
	movdqa   xmm5, [SHA3_S+5*16]
# 0 "" 2
# 523 "echo32.c" 1
	movdqa   xmm6, [SHA3_S+6*16]
# 0 "" 2
# 524 "echo32.c" 1
	movdqa   xmm7, [SHA3_S+7*16]
# 0 "" 2
# 525 "echo32.c" 1
	aesenc  xmm0, [SHA3_FULL_CNT+ecx- 1*16]
# 0 "" 2
# 526 "echo32.c" 1
	aesenc  xmm1, [SHA3_FULL_CNT+ecx- 2*16]
# 0 "" 2
# 527 "echo32.c" 1
	aesenc  xmm2, [SHA3_FULL_CNT+ecx- 3*16]
# 0 "" 2
# 528 "echo32.c" 1
	aesenc  xmm3, [SHA3_FULL_CNT+ecx- 4*16]
# 0 "" 2
# 529 "echo32.c" 1
	aesenc  xmm4, [SHA3_FULL_CNT+ecx- 5*16]
# 0 "" 2
# 530 "echo32.c" 1
	aesenc  xmm5, [SHA3_FULL_CNT+ecx- 6*16]
# 0 "" 2
# 531 "echo32.c" 1
	aesenc  xmm6, [SHA3_FULL_CNT+ecx- 7*16]
# 0 "" 2
# 532 "echo32.c" 1
	aesenc  xmm7, [SHA3_FULL_CNT+ecx- 8*16]
# 0 "" 2
# 533 "echo32.c" 1
	movdqa   [SHA3_S],      xmm0
# 0 "" 2
# 534 "echo32.c" 1
	movdqa   [SHA3_S+1*16], xmm1
# 0 "" 2
# 535 "echo32.c" 1
	movdqa   [SHA3_S+2*16], xmm2
# 0 "" 2
# 536 "echo32.c" 1
	movdqa   [SHA3_S+3*16], xmm3
# 0 "" 2
# 537 "echo32.c" 1
	movdqa   [SHA3_S+4*16], xmm4
# 0 "" 2
# 538 "echo32.c" 1
	movdqa   [SHA3_S+5*16], xmm5
# 0 "" 2
# 539 "echo32.c" 1
	movdqa   [SHA3_S+6*16], xmm6
# 0 "" 2
# 540 "echo32.c" 1
	movdqa   [SHA3_S+7*16], xmm7
# 0 "" 2
# 541 "echo32.c" 1
	movdqa   xmm0, [SHA3_S+8*16]
# 0 "" 2
# 542 "echo32.c" 1
	movdqa   xmm1, [SHA3_S+9*16]
# 0 "" 2
# 543 "echo32.c" 1
	movdqa   xmm2, [SHA3_S+10*16]
# 0 "" 2
# 544 "echo32.c" 1
	movdqa   xmm3, [SHA3_S+11*16]
# 0 "" 2
# 545 "echo32.c" 1
	movdqa   xmm4, [SHA3_S+12*16]
# 0 "" 2
# 546 "echo32.c" 1
	movdqa   xmm5, [SHA3_S+13*16]
# 0 "" 2
# 547 "echo32.c" 1
	movdqa   xmm6, [SHA3_S+14*16]
# 0 "" 2
# 548 "echo32.c" 1
	movdqa   xmm7, [SHA3_S+15*16]
# 0 "" 2
# 549 "echo32.c" 1
	aesenc  xmm0, [SHA3_FULL_CNT+ecx- 9*16]
# 0 "" 2
# 550 "echo32.c" 1
	aesenc  xmm1, [SHA3_FULL_CNT+ecx- 10*16]
# 0 "" 2
# 551 "echo32.c" 1
	aesenc  xmm2, [SHA3_FULL_CNT+ecx- 11*16]
# 0 "" 2
# 552 "echo32.c" 1
	aesenc  xmm3, [SHA3_FULL_CNT+ecx- 12*16]
# 0 "" 2
# 553 "echo32.c" 1
	aesenc  xmm4, [SHA3_FULL_CNT+ecx- 13*16]
# 0 "" 2
# 554 "echo32.c" 1
	aesenc  xmm5, [SHA3_FULL_CNT+ecx- 14*16]
# 0 "" 2
# 555 "echo32.c" 1
	aesenc  xmm6, [SHA3_FULL_CNT+ecx- 15*16]
# 0 "" 2
# 556 "echo32.c" 1
	aesenc  xmm7, [SHA3_FULL_CNT+ecx- 16*16]
# 0 "" 2
# 558 "echo32.c" 1
	aesenc  xmm0, [ZERO_KEY]
# 0 "" 2
# 559 "echo32.c" 1
	aesenc  xmm1, [ZERO_KEY]
# 0 "" 2
# 560 "echo32.c" 1
	aesenc  xmm2, [ZERO_KEY]
# 0 "" 2
# 561 "echo32.c" 1
	aesenc  xmm3, [ZERO_KEY]
# 0 "" 2
# 562 "echo32.c" 1
	aesenc  xmm4, [ZERO_KEY]
# 0 "" 2
# 563 "echo32.c" 1
	aesenc  xmm5, [ZERO_KEY]
# 0 "" 2
# 564 "echo32.c" 1
	aesenc  xmm6, [ZERO_KEY]
# 0 "" 2
# 565 "echo32.c" 1
	aesenc  xmm7, [ZERO_KEY]
# 0 "" 2
# 566 "echo32.c" 1
	movdqa   [SHA3_S+8*16],  xmm0
# 0 "" 2
# 567 "echo32.c" 1
	movdqa   [SHA3_S+9*16],  xmm1
# 0 "" 2
# 568 "echo32.c" 1
	movdqa   [SHA3_S+10*16], xmm2
# 0 "" 2
# 569 "echo32.c" 1
	movdqa   [SHA3_S+11*16], xmm3
# 0 "" 2
# 570 "echo32.c" 1
	movdqa   [SHA3_S+12*16], xmm4
# 0 "" 2
# 571 "echo32.c" 1
	movdqa   [SHA3_S+13*16], xmm5
# 0 "" 2
# 572 "echo32.c" 1
	movdqa   [SHA3_S+14*16], xmm6
# 0 "" 2
# 573 "echo32.c" 1
	movdqa   [SHA3_S+15*16], xmm7
# 0 "" 2
# 574 "echo32.c" 1
	movdqa   xmm0, [SHA3_S]
# 0 "" 2
# 575 "echo32.c" 1
	movdqa   xmm1, [SHA3_S+1*16]
# 0 "" 2
# 576 "echo32.c" 1
	movdqa   xmm2, [SHA3_S+2*16]
# 0 "" 2
# 577 "echo32.c" 1
	movdqa   xmm3, [SHA3_S+3*16]
# 0 "" 2
# 578 "echo32.c" 1
	movdqa   xmm4, [SHA3_S+4*16]
# 0 "" 2
# 579 "echo32.c" 1
	movdqa   xmm5, [SHA3_S+5*16]
# 0 "" 2
# 580 "echo32.c" 1
	movdqa   xmm6, [SHA3_S+6*16]
# 0 "" 2
# 581 "echo32.c" 1
	movdqa   xmm7, [SHA3_S+7*16]
# 0 "" 2
# 582 "echo32.c" 1
	aesenc  xmm0, [ZERO_KEY]
# 0 "" 2
# 583 "echo32.c" 1
	aesenc  xmm1, [ZERO_KEY]
# 0 "" 2
# 584 "echo32.c" 1
	aesenc  xmm2, [ZERO_KEY]
# 0 "" 2
# 585 "echo32.c" 1
	aesenc  xmm3, [ZERO_KEY]
# 0 "" 2
# 586 "echo32.c" 1
	aesenc  xmm4, [ZERO_KEY]
# 0 "" 2
# 587 "echo32.c" 1
	aesenc  xmm5, [ZERO_KEY]
# 0 "" 2
# 588 "echo32.c" 1
	aesenc  xmm6, [ZERO_KEY]
# 0 "" 2
# 589 "echo32.c" 1
	aesenc  xmm7, [ZERO_KEY]
# 0 "" 2
# 590 "echo32.c" 1
	movdqa   [SHA3_S],      xmm0
# 0 "" 2
# 591 "echo32.c" 1
	movdqa   [SHA3_S+1*16], xmm1
# 0 "" 2
# 592 "echo32.c" 1
	movdqa   [SHA3_S+2*16], xmm2
# 0 "" 2
# 593 "echo32.c" 1
	movdqa   [SHA3_S+3*16], xmm3
# 0 "" 2
# 594 "echo32.c" 1
	movdqa   [SHA3_S+4*16], xmm4
# 0 "" 2
# 595 "echo32.c" 1
	movdqa   [SHA3_S+5*16], xmm5
# 0 "" 2
# 596 "echo32.c" 1
	movdqa   [SHA3_S+6*16], xmm6
# 0 "" 2
# 597 "echo32.c" 1
	movdqa   [SHA3_S+7*16], xmm7
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*0]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*5]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 599 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 599 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 599 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 599 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 599 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 599 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 599 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 599 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 599 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0,  [SHA3_S]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S],   xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,     xmm4
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,     xmm5
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,     xmm6
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,     xmm7
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16], xmm1
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*2]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm2,      xmm7
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm2,      xmm5
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*2],  xmm2
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*3]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*3], xmm3
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*9]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 599 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 599 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 599 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 599 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 599 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 599 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 599 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 599 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 599 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*4], xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*5]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm1
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*6]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*6], xmm2
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*7]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*7], xmm3
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 599 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 599 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 599 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 599 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 599 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 599 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 599 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 599 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 599 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*8], xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*9]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm1
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm2
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*11]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm3,      xmm7
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm3,      xmm6
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*11], xmm3
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 599 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 599 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 599 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 599 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 599 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 599 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 599 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 599 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 599 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 599 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 599 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*12], xmm0
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm1
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm2
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 599 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 599 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm3
# 0 "" 2
# 600 "echo32.c" 1
	sub ecx, 16*16
# 0 "" 2
# 601 "echo32.c" 1
	jne LABEL_BIG_ROUND
# 0 "" 2
# 603 "echo32.c" 1
	END:
# 0 "" 2
# 605 "echo32.c" 1
	movaps  xmm0, [OLDCV]
# 0 "" 2
# 605 "echo32.c" 1
	movaps  xmm1, [OLDCV+16]
# 0 "" 2
# 605 "echo32.c" 1
	movaps  xmm2, [OLDCV+2*16]
# 0 "" 2
# 605 "echo32.c" 1
	movaps  xmm3, [OLDCV+3*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm0, [SHA3_S]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm1, [SHA3_S+1*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm2, [SHA3_S+2*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm3, [SHA3_S+3*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm0, [SHA3_S+4*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm1, [SHA3_S+5*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm2, [SHA3_S+6*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm3, [SHA3_S+7*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm0, [SHA3_S+8*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm1, [SHA3_S+9*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm2, [SHA3_S+10*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm3, [SHA3_S+11*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm0, [SHA3_S+12*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm1, [SHA3_S+13*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm2, [SHA3_S+14*16]
# 0 "" 2
# 605 "echo32.c" 1
	pxor    xmm3, [SHA3_S+15*16]
# 0 "" 2
# 605 "echo32.c" 1
	movaps  [SHA3_S]     , xmm0
# 0 "" 2
# 605 "echo32.c" 1
	movaps  [SHA3_S+1*16], xmm1
# 0 "" 2
# 605 "echo32.c" 1
	movaps  [SHA3_S+2*16], xmm2
# 0 "" 2
# 605 "echo32.c" 1
	movaps  [SHA3_S+3*16], xmm3
# 0 "" 2
# 611 "echo32.c" 1
	mov    esp, [SHA3_ESP]
# 0 "" 2
# 612 "echo32.c" 1
	popa
# 0 "" 2
# 613 "echo32.c" 1
	.att_syntax noprefix
# 0 "" 2
#NO_APP
	popl	%ebp
	ret
	.size	Compress, .-Compress
	.p2align 4,,15
.globl Update
	.type	Update, @function
Update:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	movl	20(%ebp), %edx
	movl	8(%ebp), %ecx
	movl	16(%ebp), %eax
	movl	12(%ebp), %ebx
	movl	%edx, -84(%ebp)
	movl	SHA3_S+276, %edx
	movl	%eax, -88(%ebp)
	cmpl	%ecx, %edx
	je	.L4
	testb	$15, %dl
	leal	16(%edx), %eax
	jne	.L5
	cmpl	$SHA3_S+16, %edx
	jbe	.L80
.L48:
	movdqa	SHA3_S, %xmm0
	movdqa	%xmm0, (%edx)
	movdqa	SHA3_S+16, %xmm0
	movdqa	%xmm0, 16(%edx)
	movdqa	SHA3_S+32, %xmm0
	movdqa	%xmm0, 16(%eax)
	movdqa	SHA3_S+48, %xmm0
	movdqa	%xmm0, 32(%eax)
	movdqa	SHA3_S+64, %xmm0
	movdqa	%xmm0, 48(%eax)
	movdqa	SHA3_S+80, %xmm0
	movdqa	%xmm0, 64(%eax)
	movdqa	SHA3_S+96, %xmm0
	movdqa	%xmm0, 80(%eax)
	movdqa	SHA3_S+112, %xmm0
	movdqa	%xmm0, 96(%eax)
	movdqa	SHA3_S+128, %xmm0
	movdqa	%xmm0, 112(%eax)
	movdqa	SHA3_S+144, %xmm0
	movdqa	%xmm0, 128(%eax)
	movdqa	SHA3_S+160, %xmm0
	movdqa	%xmm0, 144(%eax)
	movdqa	SHA3_S+176, %xmm0
	movdqa	%xmm0, 160(%eax)
	movdqa	SHA3_S+192, %xmm0
	movdqa	%xmm0, 176(%eax)
	movdqa	SHA3_S+208, %xmm0
	movdqa	%xmm0, 192(%eax)
	movdqa	SHA3_S+224, %xmm0
	movdqa	%xmm0, 208(%eax)
	movdqa	SHA3_S+240, %xmm0
	movdqa	%xmm0, 224(%eax)
	movdqa	SHA3_S+256, %xmm0
	movdqa	%xmm0, 240(%eax)
	movl	SHA3_S+272, %esi
	movl	SHA3_S+276, %edi
	movl	%esi, 272(%edx)
	movl	%edi, 276(%edx)
.L7:
	leal	16(%ecx), %eax
	cmpl	$SHA3_S, %eax
	jae	.L81
.L49:
	movdqu	(%ecx), %xmm0
	movdqa	%xmm0, SHA3_S
	movdqu	(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+16
	movdqu	16(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+32
	movdqu	32(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+48
	movdqu	48(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+64
	movdqu	64(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+80
	movdqu	80(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+96
	movdqu	96(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+112
	movdqu	112(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+128
	movdqu	128(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+144
	movdqu	144(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+160
	movdqu	160(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+176
	movdqu	176(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+192
	movdqu	192(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+208
	movdqu	208(%eax), %xmm0
	addl	$224, %eax
	movdqa	%xmm0, SHA3_S+224
	movdqu	(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+240
	movdqu	16(%eax), %xmm0
	movdqa	%xmm0, SHA3_S+256
	movl	272(%ecx), %eax
	movl	%eax, SHA3_S+272
.L11:
	movl	%ecx, SHA3_S+276
.L4:
	movl	SHA3_S+272, %edx
	movl	-88(%ebp), %eax
	sall	$4, %edx
	movl	%edx, -72(%ebp)
	addl	$SHA3_S, %edx
	movl	%edx, -56(%ebp)
	movl	-84(%ebp), %edx
	shrdl	$3, %edx, %eax
	shrl	$3, %edx
	movl	%edx, -36(%ebp)
	movl	SHA3_S+264, %edx
	movl	%eax, -40(%ebp)
	sarl	$3, %edx
	cmpl	$0, -36(%ebp)
	movl	%edx, -32(%ebp)
	jle	.L82
.L13:
	movl	-72(%ebp), %ecx
	movl	$256, -64(%ebp)
	subl	%ecx, -64(%ebp)
	.p2align 4,,7
	.p2align 3
.L73:
	movl	-64(%ebp), %edi
	subl	-32(%ebp), %edi
	movl	-36(%ebp), %ecx
	movl	%edi, %edx
	movl	%edi, %eax
	sarl	$31, %edx
	cmpl	%ecx, %edx
	movl	%edi, -24(%ebp)
	movl	%edi, -48(%ebp)
	movl	%edx, -44(%ebp)
	jl	.L16
	jg	.L51
	movl	-40(%ebp), %edi
	cmpl	%edi, %eax
	jbe	.L16
.L51:
	movl	-36(%ebp), %edx
	movl	-40(%ebp), %eax
	shrdl	$3, %edx, %eax
	sarl	$3, %edx
	cmpl	$0, %edx
	movl	%eax, -24(%ebp)
	movl	%edx, -20(%ebp)
	jle	.L83
.L18:
	movl	-56(%ebp), %ecx
	xorl	%eax, %eax
	xorl	%esi, %esi
	movl	-32(%ebp), %edx
	leal	(%ecx,%edx), %edi
	.p2align 4,,7
	.p2align 3
.L74:
	movl	(%ebx,%eax,8), %edx
	movl	4(%ebx,%eax,8), %ecx
	movl	%edx, (%edi,%eax,8)
	movl	%ecx, 4(%edi,%eax,8)
	addl	$1, %eax
	cmpl	-20(%ebp), %esi
	jl	.L74
	jle	.L84
.L20:
	movl	-24(%ebp), %esi
	xorl	%edx, %edx
	movl	-20(%ebp), %edi
	movl	-40(%ebp), %eax
	movl	-24(%ebp), %ecx
	shldl	$3, %esi, %edi
	andl	$7, %eax
	sall	$3, %esi
	sall	$3, %ecx
	addl	%eax, %esi
	adcl	%edx, %edi
	xorl	%eax, %eax
	cmpl	%edi, %eax
	jg	.L39
	jl	.L56
	cmpl	%esi, %ecx
	jae	.L39
.L56:
	movl	-32(%ebp), %eax
	leal	(%ebx,%ecx), %edx
	movl	%ebx, -24(%ebp)
	addl	%ecx, %eax
	addl	-56(%ebp), %eax
	.p2align 4,,7
	.p2align 3
.L75:
	movzbl	(%edx), %ebx
	addl	$1, %ecx
	addl	$1, %edx
	movb	%bl, (%eax)
	xorl	%ebx, %ebx
	addl	$1, %eax
	cmpl	%edi, %ebx
	jl	.L75
	jg	.L77
	cmpl	%esi, %ecx
	jb	.L75
.L77:
	movl	-24(%ebp), %ebx
.L39:
	movl	-40(%ebp), %edi
	addl	%edi, -32(%ebp)
	addl	%edi, %ebx
.L78:
	movl	-32(%ebp), %eax
	sall	$3, %eax
.L15:
	movl	-88(%ebp), %ecx
	movl	%eax, SHA3_S+264
	andl	$7, %ecx
	je	.L43
	addl	%ecx, %eax
	movl	$7, %edx
	movl	%eax, SHA3_S+264
	subl	%ecx, %edx
	xorl	%eax, %eax
	movl	$7, %ecx
	movl	$1, %edi
	.p2align 4,,7
	.p2align 3
.L46:
	movl	%edi, %esi
	sall	%cl, %esi
	subl	$1, %ecx
	orl	%esi, %eax
	cmpl	%edx, %ecx
	jne	.L46
	movl	-32(%ebp), %edx
	movl	-72(%ebp), %ecx
	andb	(%ebx), %al
	movb	%al, SHA3_S(%ecx,%edx)
.L43:
	addl	$76, %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L84:
	cmpl	-24(%ebp), %eax
	jb	.L74
	jmp	.L20
	.p2align 4,,7
	.p2align 3
.L16:
	movl	-24(%ebp), %esi
	movl	-24(%ebp), %edx
	addl	$7, %esi
	testl	%edx, %edx
	cmovns	-24(%ebp), %esi
	sarl	$3, %esi
	testl	%esi, %esi
	je	.L21
	movl	-56(%ebp), %edi
	addl	-32(%ebp), %edi
	cmpl	$21, %esi
	jbe	.L22
	testl	$15, %edi
	jne	.L22
	leal	16(%ebx), %eax
	cmpl	%eax, %edi
	jbe	.L85
.L53:
	movl	%esi, %edx
	shrl	%edx
	movl	%edx, %eax
	addl	%eax, %eax
	movl	%edx, -28(%ebp)
	je	.L24
	movl	%eax, -52(%ebp)
	movl	-28(%ebp), %eax
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	.p2align 4,,7
	.p2align 3
.L25:
	addl	$1, %ecx
	movdqu	(%ebx,%edx), %xmm0
	movdqa	%xmm0, (%edi,%edx)
	addl	$16, %edx
	cmpl	%eax, %ecx
	jb	.L25
	movl	-52(%ebp), %eax
	cmpl	%eax, %esi
	je	.L21
.L24:
	leal	0(,%eax,8), %edx
	movl	%esi, %edi
	leal	(%ebx,%edx), %ecx
	addl	-32(%ebp), %edx
	addl	-56(%ebp), %edx
	movl	%ebx, -28(%ebp)
	.p2align 4,,7
	.p2align 3
.L26:
	movl	(%ecx), %ebx
	addl	$1, %eax
	movl	4(%ecx), %esi
	addl	$8, %ecx
	movl	%ebx, (%edx)
	movl	%esi, 4(%edx)
	addl	$8, %edx
	cmpl	%eax, %edi
	ja	.L26
	movl	-28(%ebp), %ebx
	movl	%edi, %esi
.L21:
	movl	-24(%ebp), %edx
	sall	$3, %esi
	movl	-24(%ebp), %ecx
	movl	%esi, %eax
	movl	%esi, -28(%ebp)
	sarl	$31, %edx
	shrl	$29, %edx
	addl	%edx, %ecx
	andl	$7, %ecx
	subl	%edx, %ecx
	addl	%esi, %ecx
	cmpl	%ecx, %esi
	jae	.L28
	movl	%ecx, %edi
	movl	-32(%ebp), %edx
	subl	%esi, %edi
	movl	%edi, -52(%ebp)
	leal	(%ebx,%eax), %edi
	addl	-72(%ebp), %edx
	cmpl	$15, -52(%ebp)
	leal	SHA3_S(%esi,%edx), %esi
	jbe	.L29
	testl	$15, %esi
	jne	.L29
	leal	16(%edi), %edx
	cmpl	%edx, %esi
	jbe	.L86
.L54:
	movl	-52(%ebp), %edx
	shrl	$4, %edx
	movl	%edx, -68(%ebp)
	sall	$4, %edx
	testl	%edx, %edx
	movl	%edx, -60(%ebp)
	je	.L31
	movl	%ecx, -76(%ebp)
	movl	-68(%ebp), %ecx
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,7
	.p2align 3
.L32:
	addl	$1, %edx
	movdqu	(%edi,%eax), %xmm0
	movdqa	%xmm0, (%esi,%eax)
	addl	$16, %eax
	cmpl	%ecx, %edx
	jb	.L32
	movl	-28(%ebp), %eax
	movl	-60(%ebp), %edi
	addl	-60(%ebp), %eax
	cmpl	%edi, -52(%ebp)
	movl	-76(%ebp), %ecx
	je	.L28
.L31:
	movl	-32(%ebp), %edx
	leal	(%ebx,%eax), %esi
	movl	%ecx, %edi
	addl	%eax, %edx
	addl	-56(%ebp), %edx
	.p2align 4,,7
	.p2align 3
.L33:
	movzbl	(%esi), %ecx
	addl	$1, %eax
	addl	$1, %esi
	movb	%cl, (%edx)
	addl	$1, %edx
	cmpl	%eax, %edi
	ja	.L33
.L28:
	movl	-24(%ebp), %eax
	sall	$3, %eax
	addl	%eax, SHA3_S+264
	call	Compress
	movl	-48(%ebp), %eax
	addl	-24(%ebp), %ebx
	movl	-44(%ebp), %edx
	subl	%eax, -40(%ebp)
	sbbl	%edx, -36(%ebp)
	cmpl	$0, -36(%ebp)
	movl	$0, -32(%ebp)
	jg	.L73
	jl	.L55
	cmpl	$0, -40(%ebp)
	ja	.L73
.L55:
	xorl	%eax, %eax
	movl	$0, -32(%ebp)
	.p2align 4,,5
	jmp	.L15
	.p2align 4,,7
	.p2align 3
.L83:
	.p2align 4,,5
	jl	.L20
	cmpl	$0, %eax
	.p2align 4,,5
	ja	.L18
	.p2align 4,,9
	.p2align 3
	jmp	.L20
	.p2align 4,,7
	.p2align 3
.L86:
	leal	16(%esi), %edx
	cmpl	%edx, %edi
	.p2align 4,,5
	ja	.L54
	.p2align 4,,7
	.p2align 3
.L29:
	movl	-28(%ebp), %edx
	movl	%ecx, %esi
	addl	-32(%ebp), %edx
	addl	-56(%ebp), %edx
	.p2align 4,,7
	.p2align 3
.L34:
	movzbl	(%edi), %ecx
	addl	$1, %eax
	addl	$1, %edi
	movb	%cl, (%edx)
	addl	$1, %edx
	cmpl	%eax, %esi
	ja	.L34
	jmp	.L28
	.p2align 4,,7
	.p2align 3
.L85:
	leal	16(%edi), %eax
	cmpl	%eax, %ebx
	ja	.L53
	.p2align 4,,7
	.p2align 3
.L22:
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L27:
	movl	(%ebx,%eax,8), %edx
	movl	4(%ebx,%eax,8), %ecx
	movl	%edx, (%edi,%eax,8)
	movl	%ecx, 4(%edi,%eax,8)
	addl	$1, %eax
	cmpl	%eax, %esi
	ja	.L27
	jmp	.L21
.L82:
	jl	.L78
	cmpl	$0, %eax
	.p2align 4,,9
	.p2align 3
	ja	.L13
	.p2align 4,,9
	.p2align 3
	jmp	.L78
.L81:
	cmpl	$SHA3_S+16, %ecx
	.p2align 4,,4
	ja	.L49
	xorl	%eax, %eax
	movl	%ecx, %esi
	.p2align 4,,7
	.p2align 3
.L12:
	movl	(%esi,%eax,8), %edx
	movl	4(%esi,%eax,8), %ecx
	movl	%edx, SHA3_S(,%eax,8)
	movl	%ecx, SHA3_S+4(,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L12
	movl	%esi, %ecx
	jmp	.L11
.L80:
	cmpl	$SHA3_S, %eax
	jb	.L48
.L5:
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L8:
	movl	SHA3_S(,%eax,8), %esi
	movl	SHA3_S+4(,%eax,8), %edi
	movl	%esi, (%edx,%eax,8)
	movl	%edi, 4(%edx,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L8
	jmp	.L7
	.size	Update, .-Update
	.p2align 4,,15
.globl Final
	.type	Final, @function
Final:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	movl	8(%ebp), %edx
	movl	SHA3_S+276, %eax
	cmpl	%edx, %eax
	je	.L88
	movl	%eax, %edi
	movl	$SHA3_S, %esi
	movl	$70, %ecx
	movl	$SHA3_S, %eax
	rep movsl
	movl	%eax, %edi
	movl	%edx, %esi
	movb	$70, %cl
	rep movsl
	movl	%edx, SHA3_S+276
.L88:
	movl	SHA3_S+272, %edx
	movl	$16, %esi
	movl	SHA3_S+264, %eax
	subl	%edx, %esi
	sall	$7, %esi
	sall	$4, %edx
	leal	SHA3_S(%edx), %ebx
	movl	%esi, %edx
	subl	%eax, %edx
	cmpl	$144, %edx
	jg	.L89
	testl	%eax, %eax
	leal	7(%eax), %edx
	cmovns	%eax, %edx
	sarl	$3, %edx
	addl	%ebx, %edx
	movl	%edx, -32(%ebp)
	movl	%eax, %edx
	movl	-32(%ebp), %edi
	sarl	$31, %edx
	shrl	$29, %edx
	leal	(%eax,%edx), %ecx
	andl	$7, %ecx
	subl	%ecx, %edx
	leal	7(%edx), %ecx
	movl	$1, %edx
	sall	%cl, %edx
	orb	(%edi), %dl
	movl	$255, %edi
	sall	%cl, %edi
	leal	(%ecx,%eax), %eax
	andl	%edi, %edx
	movl	-32(%ebp), %edi
	testl	%eax, %eax
	movb	%dl, (%edi)
	jle	.L90
	movl	%esi, %edx
	subl	%eax, %edx
	testl	%edx, %edx
	leal	7(%edx), %ecx
	cmovs	%ecx, %edx
	sarl	$3, %eax
	sarl	$3, %edx
	leal	1(%ebx,%eax), %eax
	movl	%edx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	memset
	call	Compress
	movl	SHA3_S+264, %edx
	movl	SHA3_S+272, %edi
	movl	%edx, %ecx
	sall	$4, %edi
	sarl	$31, %ecx
	addl	$SHA3_S, %edi
	addl	SHA3_S+256, %edx
	adcl	SHA3_S+260, %ecx
.L91:
	leal	-137(%esi), %eax
	subl	$144, %esi
	cmovs	%eax, %esi
	sarl	$3, %esi
	movl	%edx, -36(%ebp)
	movl	%ecx, -40(%ebp)
	movl	%esi, 8(%esp)
	movl	$0, 4(%esp)
	movl	%edi, (%esp)
	call	memset
	movl	-36(%ebp), %edx
	movl	-40(%ebp), %ecx
	jmp	.L93
	.p2align 4,,7
	.p2align 3
.L89:
	testl	%eax, %eax
	movl	$255, %edi
	leal	7(%eax), %edx
	cmovns	%eax, %edx
	sarl	$3, %edx
	leal	(%edx,%ebx), %ebx
	movl	%eax, %edx
	sarl	$31, %edx
	shrl	$29, %edx
	leal	(%eax,%edx), %ecx
	andl	$7, %ecx
	subl	%ecx, %edx
	leal	7(%edx), %ecx
	movl	$1, %edx
	sall	%cl, %edx
	orb	(%ebx), %dl
	sall	%cl, %edi
	leal	(%ecx,%eax), %eax
	andl	%edi, %edx
	movb	%dl, (%ebx)
.L90:
	movl	SHA3_S+264, %edx
	movl	SHA3_S+272, %edi
	movl	%edx, %ecx
	sall	$4, %edi
	sarl	$31, %ecx
	addl	$SHA3_S, %edi
	addl	SHA3_S+256, %edx
	adcl	SHA3_S+260, %ecx
	testl	%eax, %eax
	je	.L91
	subl	$144, %esi
	subl	%eax, %esi
	testl	%esi, %esi
	leal	7(%esi), %ebx
	cmovs	%ebx, %esi
	sarl	$3, %esi
	testl	%eax, %eax
	leal	7(%eax), %ebx
	cmovs	%ebx, %eax
	sarl	$3, %eax
	leal	1(%edi,%eax), %eax
	movl	%edx, -36(%ebp)
	movl	%ecx, -40(%ebp)
	movl	%esi, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	memset
	movl	-40(%ebp), %ecx
	movl	-36(%ebp), %edx
.L93:
	movl	SHA3_S+268, %esi
	movl	$16, %eax
	subl	SHA3_S+272, %eax
	sall	$4, %eax
	movl	%esi, %ebx
	leal	-18(%edi,%eax), %eax
	movb	%bl, (%eax)
	movl	SHA3_S+268, %esi
	movb	%dl, 2(%eax)
	movb	%cl, 6(%eax)
	movb	$0, 10(%eax)
	sarl	$8, %esi
	movl	%esi, %ebx
	movl	%edx, %esi
	shrdl	$8, %ecx, %esi
	movb	%bl, 1(%eax)
	movl	%esi, %ebx
	movl	%edx, %esi
	shrdl	$16, %ecx, %esi
	movb	%bl, 3(%eax)
	movl	%esi, %ebx
	movl	%edx, %esi
	shrdl	$24, %ecx, %esi
	movl	%ecx, %edx
	movb	%bl, 4(%eax)
	movl	%esi, %ebx
	movl	%ecx, %esi
	shrl	$8, %esi
	movb	%bl, 5(%eax)
	movl	%esi, %ebx
	movl	%ecx, %esi
	shrl	$16, %esi
	movb	%bl, 7(%eax)
	shrl	$24, %edx
	movl	%esi, %ebx
	movb	%bl, 8(%eax)
	movb	%dl, 9(%eax)
	movb	$0, 11(%eax)
	movb	$0, 12(%eax)
	movb	$0, 13(%eax)
	movb	$0, 14(%eax)
	movb	$0, 15(%eax)
	movb	$0, 16(%eax)
	movb	$0, 17(%eax)
	call	Compress
	movl	SHA3_S+268, %eax
	sarl	$3, %eax
	testl	%eax, %eax
	je	.L94
	movl	12(%ebp), %edx
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L95:
	movl	%eax, %ebx
	movl	%eax, %ecx
	shrl	$3, %ebx
	andl	$7, %ecx
	movl	SHA3_S+4(,%ebx,8), %esi
	sall	$3, %ecx
	movl	SHA3_S(,%ebx,8), %ebx
	shrdl	%esi, %ebx
	shrl	%cl, %esi
	testb	$32, %cl
	cmovne	%esi, %ebx
	movb	%bl, (%edx,%eax)
	movl	SHA3_S+268, %ecx
	addl	$1, %eax
	sarl	$3, %ecx
	cmpl	%eax, %ecx
	ja	.L95
.L94:
	movl	$0, SHA3_S+276
	xorl	%eax, %eax
	addl	$44, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	Final, .-Final
	.p2align 4,,15
.globl Init
	.type	Init, @function
Init:
	movl	SHA3_S+276, %edx
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	movl	8(%ebp), %edi
	pushl	%esi
	testl	%edx, %edx
	movl	12(%ebp), %esi
	pushl	%ebx
	je	.L99
	cmpl	%edi, %edx
	je	.L99
	testb	$15, %dl
	leal	16(%edx), %eax
	jne	.L100
	cmpl	$SHA3_S+16, %edx
	jbe	.L118
.L113:
	movdqa	SHA3_S, %xmm0
	movdqa	%xmm0, (%edx)
	movdqa	SHA3_S+16, %xmm0
	movdqa	%xmm0, 16(%edx)
	movdqa	SHA3_S+32, %xmm0
	movdqa	%xmm0, 16(%eax)
	movdqa	SHA3_S+48, %xmm0
	movdqa	%xmm0, 32(%eax)
	movdqa	SHA3_S+64, %xmm0
	movdqa	%xmm0, 48(%eax)
	movdqa	SHA3_S+80, %xmm0
	movdqa	%xmm0, 64(%eax)
	movdqa	SHA3_S+96, %xmm0
	movdqa	%xmm0, 80(%eax)
	movdqa	SHA3_S+112, %xmm0
	movdqa	%xmm0, 96(%eax)
	movdqa	SHA3_S+128, %xmm0
	movdqa	%xmm0, 112(%eax)
	movdqa	SHA3_S+144, %xmm0
	movdqa	%xmm0, 128(%eax)
	movdqa	SHA3_S+160, %xmm0
	movdqa	%xmm0, 144(%eax)
	movdqa	SHA3_S+176, %xmm0
	movdqa	%xmm0, 160(%eax)
	movdqa	SHA3_S+192, %xmm0
	movdqa	%xmm0, 176(%eax)
	movdqa	SHA3_S+208, %xmm0
	movdqa	%xmm0, 192(%eax)
	movdqa	SHA3_S+224, %xmm0
	movdqa	%xmm0, 208(%eax)
	movdqa	SHA3_S+240, %xmm0
	movdqa	%xmm0, 224(%eax)
	movdqa	SHA3_S+256, %xmm0
	movdqa	%xmm0, 240(%eax)
	movl	SHA3_S+272, %ecx
	movl	SHA3_S+276, %ebx
	movl	%ecx, 272(%edx)
	movl	%ebx, 276(%edx)
.L99:
	leal	-160(%esi), %edx
	movl	$2, %eax
	cmpl	$352, %edx
	movl	%edi, SHA3_S+276
	movl	$-16843010, MEM_CST
	movl	$-16843010, MEM_CST+4
	movl	$-16843010, MEM_CST+8
	movl	$-16843010, MEM_CST+12
	movl	$16843009, MEM_CST+16
	movl	$16843009, MEM_CST+20
	movl	$16843009, MEM_CST+24
	movl	$16843009, MEM_CST+28
	movl	$1769499, MEM_CST+32
	movl	$1769499, MEM_CST+36
	movl	$1769499, MEM_CST+40
	movl	$1769499, MEM_CST+44
	movl	$1, MEM_CST+48
	movl	$0, MEM_CST+52
	movl	$0, MEM_CST+56
	movl	$0, MEM_CST+60
	movl	$0, ZERO_KEY
	movl	$0, ZERO_KEY+4
	movl	$0, ZERO_KEY+8
	movl	$0, ZERO_KEY+12
	movb	$1, ONE
	movb	$2, TWO
	movb	$3, THREE
	movb	$4, FOUR
	ja	.L104
	xorl	%eax, %eax
	cmpl	$257, %esi
	setge	%al
	movl	%esi, %ebx
	leal	4(,%eax,4), %eax
	movl	$SHA3_S, %edx
	movl	%esi, SHA3_S+268
	xorl	%ecx, %ecx
	movl	%eax, SHA3_S+272
	sarl	$31, %esi
	.p2align 4,,7
	.p2align 3
.L107:
	addl	$1, %ecx
	movl	%ebx, (%edx)
	movl	%esi, 4(%edx)
	movl	$0, 8(%edx)
	movl	$0, 12(%edx)
	addl	$16, %edx
	cmpl	%ecx, %eax
	jg	.L107
	cmpl	$15, %eax
	jg	.L108
	movl	%eax, %ecx
	notl	%ecx
	addl	$17, %ecx
	cmpl	$1, %ecx
	jbe	.L109
	testl	%ecx, %ecx
	je	.L109
	sall	$4, %eax
	pxor	%xmm0, %xmm0
	leal	SHA3_S(%eax), %ebx
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L110:
	movl	%eax, %edx
	addl	$1, %eax
	sall	$4, %edx
	cmpl	%eax, %ecx
	movdqa	%xmm0, (%ebx,%edx)
	ja	.L110
.L108:
	movl	$0, SHA3_S+256
	xorl	%eax, %eax
	movl	$0, SHA3_S+260
	movl	$0, SHA3_S+264
.L104:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L109:
	sall	$4, %eax
	addl	$SHA3_S, %eax
	.p2align 4,,7
	.p2align 3
.L111:
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	addl	$16, %eax
	cmpl	$SHA3_S+256, %eax
	jne	.L111
	jmp	.L108
	.p2align 4,,7
	.p2align 3
.L118:
	cmpl	$SHA3_S, %eax
	jb	.L113
	.p2align 4,,7
	.p2align 3
.L100:
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L102:
	movl	SHA3_S(,%eax,8), %ecx
	movl	SHA3_S+4(,%eax,8), %ebx
	movl	%ecx, (%edx,%eax,8)
	movl	%ebx, 4(%edx,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L102
	jmp	.L99
	.size	Init, .-Init
	.p2align 4,,15
	.type	T.57, @function
T.57:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	movl	%ecx, %edi
	pushl	%esi
	movl	%edx, %esi
	pushl	%ebx
	subl	$332, %esp
	movl	SHA3_S+276, %ecx
	movl	%eax, -316(%ebp)
	leal	-312(%ebp), %ebx
	testl	%ecx, %ecx
	je	.L120
	cmpl	%ebx, %ecx
	je	.L120
	testb	$15, %cl
	leal	16(%ecx), %edx
	je	.L129
.L121:
	movl	-316(%ebp), %eax
	xorl	%edx, %edx
	movl	%esi, -328(%ebp)
	movl	%edi, -324(%ebp)
.L123:
	movl	SHA3_S(,%edx,8), %esi
	movl	SHA3_S+4(,%edx,8), %edi
	movl	%esi, (%ecx,%edx,8)
	movl	%edi, 4(%ecx,%edx,8)
	addl	$1, %edx
	cmpl	$35, %edx
	jne	.L123
	movl	-328(%ebp), %esi
	movl	-324(%ebp), %edi
	movl	%eax, -316(%ebp)
	.p2align 4,,7
	.p2align 3
.L120:
	movdqa	.LC0, %xmm0
	movl	%ebx, SHA3_S+276
	movdqa	%xmm0, SHA3_S
	movdqa	%xmm0, SHA3_S+16
	movdqa	%xmm0, SHA3_S+32
	movdqa	%xmm0, SHA3_S+48
	movl	$-16843010, MEM_CST
	pxor	%xmm0, %xmm0
	movdqa	%xmm0, SHA3_S+64
	movl	$-16843010, MEM_CST+4
	movl	$-16843010, MEM_CST+8
	movl	$-16843010, MEM_CST+12
	movl	$16843009, MEM_CST+16
	movl	$16843009, MEM_CST+20
	movl	$16843009, MEM_CST+24
	movl	$16843009, MEM_CST+28
	movl	$1769499, MEM_CST+32
	movl	$1769499, MEM_CST+36
	movl	$1769499, MEM_CST+40
	movl	$1769499, MEM_CST+44
	movl	$1, MEM_CST+48
	movl	$0, MEM_CST+52
	movl	$0, MEM_CST+56
	movl	$0, MEM_CST+60
	movl	$0, ZERO_KEY
	movl	$0, ZERO_KEY+4
	movl	$0, ZERO_KEY+8
	movl	$0, ZERO_KEY+12
	movb	$1, ONE
	movb	$2, TWO
	movb	$3, THREE
	movb	$4, FOUR
	movl	$256, SHA3_S+268
	movl	$4, SHA3_S+272
	movdqa	%xmm0, SHA3_S+80
	movdqa	%xmm0, SHA3_S+96
	movl	%esi, 8(%esp)
	movdqa	%xmm0, SHA3_S+112
	movdqa	%xmm0, SHA3_S+128
	movl	%edi, 12(%esp)
	movl	-316(%ebp), %edi
	movdqa	%xmm0, SHA3_S+144
	movdqa	%xmm0, SHA3_S+160
	movdqa	%xmm0, SHA3_S+176
	movdqa	%xmm0, SHA3_S+192
	movdqa	%xmm0, SHA3_S+208
	movdqa	%xmm0, SHA3_S+224
	movdqa	%xmm0, SHA3_S+240
	movl	$0, SHA3_S+256
	movl	$0, SHA3_S+260
	movl	$0, SHA3_S+264
	movl	%edi, 4(%esp)
	movl	%ebx, (%esp)
	call	Update
	testl	%eax, %eax
	je	.L130
	addl	$332, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L129:
	cmpl	$SHA3_S+16, %ecx
	jbe	.L131
.L126:
	movdqa	SHA3_S, %xmm0
	movdqa	%xmm0, (%ecx)
	movdqa	SHA3_S+16, %xmm0
	movdqa	%xmm0, 16(%ecx)
	movdqa	SHA3_S+32, %xmm0
	movdqa	%xmm0, 16(%edx)
	movdqa	SHA3_S+48, %xmm0
	movdqa	%xmm0, 32(%edx)
	movdqa	SHA3_S+64, %xmm0
	movdqa	%xmm0, 48(%edx)
	movdqa	SHA3_S+80, %xmm0
	movdqa	%xmm0, 64(%edx)
	movdqa	SHA3_S+96, %xmm0
	movdqa	%xmm0, 80(%edx)
	movdqa	SHA3_S+112, %xmm0
	movdqa	%xmm0, 96(%edx)
	movdqa	SHA3_S+128, %xmm0
	movdqa	%xmm0, 112(%edx)
	movdqa	SHA3_S+144, %xmm0
	movdqa	%xmm0, 128(%edx)
	movdqa	SHA3_S+160, %xmm0
	movdqa	%xmm0, 144(%edx)
	movdqa	SHA3_S+176, %xmm0
	movdqa	%xmm0, 160(%edx)
	movdqa	SHA3_S+192, %xmm0
	movdqa	%xmm0, 176(%edx)
	movdqa	SHA3_S+208, %xmm0
	movdqa	%xmm0, 192(%edx)
	movdqa	SHA3_S+224, %xmm0
	movdqa	%xmm0, 208(%edx)
	movdqa	SHA3_S+240, %xmm0
	movdqa	%xmm0, 224(%edx)
	movdqa	SHA3_S+256, %xmm0
	movdqa	%xmm0, 240(%edx)
	movl	SHA3_S+272, %eax
	movl	SHA3_S+276, %edx
	movl	%eax, 272(%ecx)
	movl	%edx, 276(%ecx)
	jmp	.L120
.L131:
	cmpl	$SHA3_S, %edx
	jae	.L121
	jmp	.L126
	.p2align 4,,7
	.p2align 3
.L130:
	movl	8(%ebp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	Final
	addl	$332, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	T.57, .-T.57
	.p2align 4,,15
.globl crypto_hash_echo256_aes_aes32
	.type	crypto_hash_echo256_aes_aes32, @function
crypto_hash_echo256_aes_aes32:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	20(%ebp), %ecx
	movl	%eax, (%esp)
	movl	12(%ebp), %eax
	shldl	$3, %edx, %ecx
	sall	$3, %edx
	call	T.57
	leave
	cmpl	$1, %eax
	sbbl	%eax, %eax
	notl	%eax
	ret
	.size	crypto_hash_echo256_aes_aes32, .-crypto_hash_echo256_aes_aes32
	.p2align 4,,15
.globl Hash
	.type	Hash, @function
Hash:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$332, %esp
	movl	20(%ebp), %edx
	movl	16(%ebp), %eax
	leal	-312(%ebp), %ebx
	movl	%edx, -316(%ebp)
	movl	SHA3_S+276, %edx
	movl	%eax, -320(%ebp)
	testl	%edx, %edx
	je	.L137
	cmpl	%ebx, %edx
	je	.L137
	testb	$15, %dl
	leal	16(%edx), %eax
	jne	.L138
	cmpl	$SHA3_S+16, %edx
	jbe	.L157
.L151:
	movdqa	SHA3_S, %xmm0
	movdqa	%xmm0, (%edx)
	movdqa	SHA3_S+16, %xmm0
	movdqa	%xmm0, 16(%edx)
	movdqa	SHA3_S+32, %xmm0
	movdqa	%xmm0, 16(%eax)
	movdqa	SHA3_S+48, %xmm0
	movdqa	%xmm0, 32(%eax)
	movdqa	SHA3_S+64, %xmm0
	movdqa	%xmm0, 48(%eax)
	movdqa	SHA3_S+80, %xmm0
	movdqa	%xmm0, 64(%eax)
	movdqa	SHA3_S+96, %xmm0
	movdqa	%xmm0, 80(%eax)
	movdqa	SHA3_S+112, %xmm0
	movdqa	%xmm0, 96(%eax)
	movdqa	SHA3_S+128, %xmm0
	movdqa	%xmm0, 112(%eax)
	movdqa	SHA3_S+144, %xmm0
	movdqa	%xmm0, 128(%eax)
	movdqa	SHA3_S+160, %xmm0
	movdqa	%xmm0, 144(%eax)
	movdqa	SHA3_S+176, %xmm0
	movdqa	%xmm0, 160(%eax)
	movdqa	SHA3_S+192, %xmm0
	movdqa	%xmm0, 176(%eax)
	movdqa	SHA3_S+208, %xmm0
	movdqa	%xmm0, 192(%eax)
	movdqa	SHA3_S+224, %xmm0
	movdqa	%xmm0, 208(%eax)
	movdqa	SHA3_S+240, %xmm0
	movdqa	%xmm0, 224(%eax)
	movdqa	SHA3_S+256, %xmm0
	movdqa	%xmm0, 240(%eax)
	movl	SHA3_S+272, %esi
	movl	SHA3_S+276, %edi
	movl	%esi, 272(%edx)
	movl	%edi, 276(%edx)
.L137:
	movl	$-16843010, MEM_CST
	movl	$2, %eax
	movl	$-16843010, MEM_CST+4
	movl	$-16843010, MEM_CST+8
	movl	$-16843010, MEM_CST+12
	movl	$16843009, MEM_CST+16
	movl	$16843009, MEM_CST+20
	movl	$16843009, MEM_CST+24
	movl	$16843009, MEM_CST+28
	movl	$1769499, MEM_CST+32
	movl	$1769499, MEM_CST+36
	movl	$1769499, MEM_CST+40
	movl	$1769499, MEM_CST+44
	movl	$1, MEM_CST+48
	movl	$0, MEM_CST+52
	movl	$0, MEM_CST+56
	movl	$0, MEM_CST+60
	movl	8(%ebp), %edx
	movl	%ebx, SHA3_S+276
	movl	$0, ZERO_KEY
	movl	$0, ZERO_KEY+4
	subl	$160, %edx
	cmpl	$352, %edx
	movl	$0, ZERO_KEY+8
	movl	$0, ZERO_KEY+12
	movb	$1, ONE
	movb	$2, TWO
	movb	$3, THREE
	movb	$4, FOUR
	ja	.L142
	movl	8(%ebp), %edi
	xorl	%ecx, %ecx
	movl	$SHA3_S, %eax
	cmpl	$257, %edi
	movl	%edi, %edx
	setge	%cl
	movl	%edi, %esi
	sarl	$31, %edx
	leal	4(,%ecx,4), %ecx
	movl	%edi, SHA3_S+268
	movl	%edx, %edi
	xorl	%edx, %edx
	movl	%ecx, SHA3_S+272
	.p2align 4,,7
	.p2align 3
.L144:
	addl	$1, %edx
	movl	%esi, (%eax)
	movl	%edi, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	addl	$16, %eax
	cmpl	%ecx, %edx
	jl	.L144
	cmpl	$15, %ecx
	jg	.L146
	movl	%ecx, %esi
	notl	%esi
	addl	$17, %esi
	cmpl	$1, %esi
	jbe	.L147
	testl	%esi, %esi
	je	.L147
	sall	$4, %ecx
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	addl	$SHA3_S, %ecx
	.p2align 4,,7
	.p2align 3
.L148:
	movl	%eax, %edx
	addl	$1, %eax
	sall	$4, %edx
	cmpl	%eax, %esi
	movdqa	%xmm0, (%ecx,%edx)
	ja	.L148
.L146:
	movl	-320(%ebp), %esi
	movl	-316(%ebp), %edi
	movl	$0, SHA3_S+256
	movl	$0, SHA3_S+260
	movl	%esi, 8(%esp)
	movl	%edi, 12(%esp)
	movl	12(%ebp), %eax
	movl	$0, SHA3_S+264
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	Update
	testl	%eax, %eax
	je	.L158
.L142:
	addl	$332, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L147:
	sall	$4, %ecx
	addl	$SHA3_S, %ecx
	.p2align 4,,7
	.p2align 3
.L149:
	movl	$0, (%ecx)
	movl	$0, 4(%ecx)
	movl	$0, 8(%ecx)
	movl	$0, 12(%ecx)
	addl	$16, %ecx
	cmpl	$SHA3_S+256, %ecx
	jne	.L149
	jmp	.L146
	.p2align 4,,7
	.p2align 3
.L158:
	movl	24(%ebp), %eax
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	Final
	addl	$332, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L157:
	cmpl	$SHA3_S, %eax
	jb	.L151
	.p2align 4,,7
	.p2align 3
.L138:
	movl	8(%ebp), %esi
	xorl	%eax, %eax
	movl	%edx, %edi
	.p2align 4,,7
	.p2align 3
.L140:
	movl	SHA3_S(,%eax,8), %edx
	movl	SHA3_S+4(,%eax,8), %ecx
	movl	%edx, (%edi,%eax,8)
	movl	%ecx, 4(%edi,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L140
	movl	%esi, 8(%ebp)
	jmp	.L137
	.size	Hash, .-Hash
	.comm	OLDCV,64,16
	.comm	MEM_CST,96,16
	.comm	SHA3_FULL_CNT,2048,16
	.comm	ZERO_KEY,16,16
	.comm	ONE,16,16
	.comm	TWO,16,16
	.comm	THREE,16,16
	.comm	FOUR,16,16
	.comm	SAVED_MSBL,4,4
	.comm	SHA3_CNT,8,8
	.comm	SHA3_ESP,4,4
	.comm	SHA3_S,280,32
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	256
	.long	0
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 4.4.3-4ubuntu5) 4.4.3"
	.section	.note.GNU-stack,"",@progbits
