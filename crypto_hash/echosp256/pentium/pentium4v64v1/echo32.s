#------------------------------------------------------------------------------------ #
# Implementation of the simple pipe ECHO hash function in its 256-bit outputs variant.#
# Optimized for Pentium4, 64-bit mode                                                 #
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
.LFB539:
	.cfi_startproc
#APP
# 606 "echo32.c" 1
	.intel_syntax noprefix
# 0 "" 2
# 607 "echo32.c" 1
	push rbp
# 0 "" 2
# 607 "echo32.c" 1
	push rdi
# 0 "" 2
# 607 "echo32.c" 1
	push rsi
# 0 "" 2
# 607 "echo32.c" 1
	push rdx
# 0 "" 2
# 607 "echo32.c" 1
	push rcx
# 0 "" 2
# 607 "echo32.c" 1
	push rbx
# 0 "" 2
# 607 "echo32.c" 1
	push rax
# 0 "" 2
# 609 "echo32.c" 1
	mov    dword ptr [SHA3_R], 8
# 0 "" 2
# 614 "echo32.c" 1
	mov    eax, dword ptr [SHA3_S+264]
# 0 "" 2
# 615 "echo32.c" 1
	mov    ecx, dword ptr [SHA3_S+264]
# 0 "" 2
# 616 "echo32.c" 1
	mov    edx, eax
# 0 "" 2
# 617 "echo32.c" 1
	sar    edx, 31
# 0 "" 2
# 618 "echo32.c" 1
	add    eax, dword ptr [SHA3_S+256]
# 0 "" 2
# 619 "echo32.c" 1
	adc    edx, dword ptr [SHA3_S+260]
# 0 "" 2
# 620 "echo32.c" 1
	mov    dword ptr [SHA3_CNT],   0
# 0 "" 2
# 621 "echo32.c" 1
	mov    dword ptr [SHA3_CNT+4], 0
# 0 "" 2
# 622 "echo32.c" 1
	test   ecx, ecx
# 0 "" 2
# 623 "echo32.c" 1
	mov    dword ptr [SHA3_S+256], eax
# 0 "" 2
# 624 "echo32.c" 1
	mov    dword ptr [SHA3_S+260], edx
# 0 "" 2
# 625 "echo32.c" 1
	je     L2
# 0 "" 2
# 626 "echo32.c" 1
	mov    dword ptr [SHA3_CNT],   eax
# 0 "" 2
# 627 "echo32.c" 1
	mov    dword ptr [SHA3_CNT+4], edx
# 0 "" 2
# 628 "echo32.c" 1
	L2:
# 0 "" 2
# 629 "echo32.c" 1
	mov    edx, dword ptr [SHA3_CNT+4]
# 0 "" 2
# 630 "echo32.c" 1
	mov    dword ptr [SHA3_S+264], 0
# 0 "" 2
# 631 "echo32.c" 1
	mov    eax, dword ptr [SHA3_CNT]
# 0 "" 2
# 632 "echo32.c" 1
	cmp    edx, 0
# 0 "" 2
# 633 "echo32.c" 1
	ja     OVERFLOW
# 0 "" 2
# 635 "echo32.c" 1
	cmp    eax, -130
# 0 "" 2
# 640 "echo32.c" 1
	ja     OVERFLOW
# 0 "" 2
# 643 "echo32.c" 1
	NO_OVERFLOW1:
# 0 "" 2
# 645 "echo32.c" 1
	movaps  xmm0, [SHA3_S]
# 0 "" 2
# 645 "echo32.c" 1
	movaps  xmm1, [SHA3_S+16]
# 0 "" 2
# 645 "echo32.c" 1
	movaps  xmm2, [SHA3_S+2*16]
# 0 "" 2
# 645 "echo32.c" 1
	movaps  xmm3, [SHA3_S+3*16]
# 0 "" 2
# 645 "echo32.c" 1
	pxor    xmm0, [SHA3_S+4*16]
# 0 "" 2
# 645 "echo32.c" 1
	pxor    xmm1, [SHA3_S+4*16+16]
# 0 "" 2
# 645 "echo32.c" 1
	pxor    xmm2, [SHA3_S+4*16+2*16]
# 0 "" 2
# 645 "echo32.c" 1
	pxor    xmm3, [SHA3_S+4*16+3*16]
# 0 "" 2
# 645 "echo32.c" 1
	pxor    xmm0, [SHA3_S+8*16]
# 0 "" 2
# 645 "echo32.c" 1
	pxor    xmm1, [SHA3_S+8*16+16]
# 0 "" 2
# 645 "echo32.c" 1
	pxor    xmm2, [SHA3_S+8*16+2*16]
# 0 "" 2
# 645 "echo32.c" 1
	pxor    xmm3, [SHA3_S+8*16+3*16]
# 0 "" 2
# 645 "echo32.c" 1
	pxor    xmm0, [SHA3_S+12*16]
# 0 "" 2
# 645 "echo32.c" 1
	pxor    xmm1, [SHA3_S+12*16+16]
# 0 "" 2
# 645 "echo32.c" 1
	pxor    xmm2, [SHA3_S+12*16+2*16]
# 0 "" 2
# 645 "echo32.c" 1
	pxor    xmm3, [SHA3_S+12*16+3*16]
# 0 "" 2
# 645 "echo32.c" 1
	movaps  [OLDCV],	   xmm0
# 0 "" 2
# 645 "echo32.c" 1
	movaps  [OLDCV+16],   xmm1
# 0 "" 2
# 645 "echo32.c" 1
	movaps  [OLDCV+2*16], xmm2
# 0 "" 2
# 645 "echo32.c" 1
	movaps  [OLDCV+3*16], xmm3
# 0 "" 2
# 650 "echo32.c" 1
	xor    ebx,ebx
# 0 "" 2
# 651 "echo32.c" 1
	xor    edx,edx
# 0 "" 2
# 653 "echo32.c" 1
	mov    [SHA3_RSP], rsp
# 0 "" 2
# 655 "echo32.c" 1
	LABEL_BIG_ROUND_NO1:
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+0]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+0+4]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+0],    edi
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+0+4],  esp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+16]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+16+4]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+16],    edi
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+16+4],  esp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+32]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+32+4]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+32],    edi
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+32+4],  esp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+48]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+48+4]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 656 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+48],    edi
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+48+4],  esp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+64]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+64+4]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+64],    edi
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+64+4],  esp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+80]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+80+4]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+80],    edi
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+80+4],  esp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+96]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+96+4]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+96],    edi
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+96+4],  esp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+112]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+112+4]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 657 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+112],    edi
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+112+4],  esp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, [SHA3_S+128]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, [SHA3_S+128+4]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+128],    edi
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+128+4],  esp
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, [SHA3_S+144]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, [SHA3_S+144+4]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+144],    edi
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+144+4],  esp
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, [SHA3_S+160]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, [SHA3_S+160+4]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+160],    edi
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+160+4],  esp
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, [SHA3_S+176]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, [SHA3_S+176+4]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 658 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 658 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 658 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 658 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 658 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 658 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+176],    edi
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+176+4],  esp
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 658 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, [SHA3_S+192]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, [SHA3_S+192+4]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+192],    edi
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+192+4],  esp
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, [SHA3_S+208]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, [SHA3_S+208+4]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+208],    edi
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+208+4],  esp
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, [SHA3_S+224]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, [SHA3_S+224+4]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+224],    edi
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+224+4],  esp
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, [SHA3_S+240]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, [SHA3_S+240+4]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx   edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx   ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 659 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 659 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 659 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 659 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 659 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 659 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+240],    edi
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+240+4],  esp
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 659 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*0]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*5]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 660 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 660 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 660 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 660 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 660 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 660 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 660 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 660 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 660 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0,  [SHA3_S]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S],   xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,     xmm4
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,     xmm5
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,     xmm6
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,     xmm7
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16], xmm1
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*2]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm2,      xmm7
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm2,      xmm5
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*2],  xmm2
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*3]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*3], xmm3
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*9]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 660 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 660 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 660 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 660 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 660 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 660 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 660 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 660 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 660 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*4], xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*5]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm1
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*6]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*6], xmm2
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*7]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*7], xmm3
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 660 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 660 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 660 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 660 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 660 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 660 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 660 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 660 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 660 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*8], xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*9]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm1
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm2
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*11]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm3,      xmm7
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm3,      xmm6
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*11], xmm3
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 660 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 660 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 660 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 660 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 660 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 660 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 660 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 660 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 660 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 660 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 660 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*12], xmm0
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm1
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm2
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 660 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 660 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm3
# 0 "" 2
# 661 "echo32.c" 1
	subd [SHA3_R], 1
# 0 "" 2
# 662 "echo32.c" 1
	jne LABEL_BIG_ROUND_NO1
# 0 "" 2
# 663 "echo32.c" 1
	jmp END
# 0 "" 2
# 665 "echo32.c" 1
	OVERFLOW:
# 0 "" 2
# 666 "echo32.c" 1
	mov    ecx, eax
# 0 "" 2
# 667 "echo32.c" 1
	mov    ebx, edx
# 0 "" 2
# 669 "echo32.c" 1
	add    ecx, 128
# 0 "" 2
# 674 "echo32.c" 1
	adc    ebx, 0
# 0 "" 2
# 675 "echo32.c" 1
	cmp    ebx, edx
# 0 "" 2
# 676 "echo32.c" 1
	je     NO_OVERFLOW2
# 0 "" 2
# 678 "echo32.c" 1
	movaps  xmm0, [SHA3_S]
# 0 "" 2
# 678 "echo32.c" 1
	movaps  xmm1, [SHA3_S+16]
# 0 "" 2
# 678 "echo32.c" 1
	movaps  xmm2, [SHA3_S+2*16]
# 0 "" 2
# 678 "echo32.c" 1
	movaps  xmm3, [SHA3_S+3*16]
# 0 "" 2
# 678 "echo32.c" 1
	pxor    xmm0, [SHA3_S+4*16]
# 0 "" 2
# 678 "echo32.c" 1
	pxor    xmm1, [SHA3_S+4*16+16]
# 0 "" 2
# 678 "echo32.c" 1
	pxor    xmm2, [SHA3_S+4*16+2*16]
# 0 "" 2
# 678 "echo32.c" 1
	pxor    xmm3, [SHA3_S+4*16+3*16]
# 0 "" 2
# 678 "echo32.c" 1
	pxor    xmm0, [SHA3_S+8*16]
# 0 "" 2
# 678 "echo32.c" 1
	pxor    xmm1, [SHA3_S+8*16+16]
# 0 "" 2
# 678 "echo32.c" 1
	pxor    xmm2, [SHA3_S+8*16+2*16]
# 0 "" 2
# 678 "echo32.c" 1
	pxor    xmm3, [SHA3_S+8*16+3*16]
# 0 "" 2
# 678 "echo32.c" 1
	pxor    xmm0, [SHA3_S+12*16]
# 0 "" 2
# 678 "echo32.c" 1
	pxor    xmm1, [SHA3_S+12*16+16]
# 0 "" 2
# 678 "echo32.c" 1
	pxor    xmm2, [SHA3_S+12*16+2*16]
# 0 "" 2
# 678 "echo32.c" 1
	pxor    xmm3, [SHA3_S+12*16+3*16]
# 0 "" 2
# 678 "echo32.c" 1
	movaps  [OLDCV],	   xmm0
# 0 "" 2
# 678 "echo32.c" 1
	movaps  [OLDCV+16],   xmm1
# 0 "" 2
# 678 "echo32.c" 1
	movaps  [OLDCV+2*16], xmm2
# 0 "" 2
# 678 "echo32.c" 1
	movaps  [OLDCV+3*16], xmm3
# 0 "" 2
# 683 "echo32.c" 1
	xor    ebx,ebx
# 0 "" 2
# 684 "echo32.c" 1
	xor    edx,edx
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_RSP], rsp
# 0 "" 2
# 687 "echo32.c" 1
	LABEL_BIG_ROUND_O:
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+0]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+0+4]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 688 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+0],    edi
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+0+4],  esp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+16]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+16+4]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 688 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+16],    edi
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+16+4],  esp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+32]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+32+4]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 688 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+32],    edi
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+32+4],  esp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+48]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+48+4]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 688 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 688 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+48],    edi
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+48+4],  esp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+64]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+64+4]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 689 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+64],    edi
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+64+4],  esp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+80]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+80+4]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 689 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+80],    edi
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+80+4],  esp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+96]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+96+4]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 689 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+96],    edi
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+96+4],  esp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+112]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+112+4]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 689 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 689 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+112],    edi
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+112+4],  esp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, [SHA3_S+128]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, [SHA3_S+128+4]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 690 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 690 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+128],    edi
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+128+4],  esp
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, [SHA3_S+144]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, [SHA3_S+144+4]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 690 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 690 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+144],    edi
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+144+4],  esp
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, [SHA3_S+160]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, [SHA3_S+160+4]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 690 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 690 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+160],    edi
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+160+4],  esp
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, [SHA3_S+176]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, [SHA3_S+176+4]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 690 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 690 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 690 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 690 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 690 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 690 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 690 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 690 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+176],    edi
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+176+4],  esp
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 690 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, [SHA3_S+192]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, [SHA3_S+192+4]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 691 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 691 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+192],    edi
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+192+4],  esp
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, [SHA3_S+208]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, [SHA3_S+208+4]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 691 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 691 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+208],    edi
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+208+4],  esp
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, [SHA3_S+224]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, [SHA3_S+224+4]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 691 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 691 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+224],    edi
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+224+4],  esp
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, [SHA3_S+240]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, [SHA3_S+240+4]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 691 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 691 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 691 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 691 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 691 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 691 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 691 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 691 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+240],    edi
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+240+4],  esp
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 691 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*0]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*5]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 692 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 692 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 692 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 692 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 692 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 692 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 692 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 692 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 692 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0,  [SHA3_S]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S],   xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,     xmm4
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,     xmm5
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,     xmm6
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,     xmm7
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16], xmm1
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*2]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm2,      xmm7
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm2,      xmm5
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*2],  xmm2
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*3]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*3], xmm3
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*9]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 692 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 692 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 692 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 692 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 692 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 692 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 692 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 692 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 692 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*4], xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*5]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm1
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*6]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*6], xmm2
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*7]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*7], xmm3
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 692 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 692 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 692 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 692 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 692 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 692 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 692 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 692 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 692 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*8], xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*9]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm1
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm2
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*11]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm3,      xmm7
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm3,      xmm6
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*11], xmm3
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 692 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 692 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 692 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 692 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 692 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 692 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 692 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 692 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 692 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 692 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 692 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*12], xmm0
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm1
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm2
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 692 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 692 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm3
# 0 "" 2
# 693 "echo32.c" 1
	subd [SHA3_R], 1
# 0 "" 2
# 694 "echo32.c" 1
	jne LABEL_BIG_ROUND_O
# 0 "" 2
# 695 "echo32.c" 1
	jmp END
# 0 "" 2
# 697 "echo32.c" 1
	NO_OVERFLOW2:
# 0 "" 2
# 698 "echo32.c" 1
	mov    dword ptr [SHA3_S+264], 0
# 0 "" 2
# 700 "echo32.c" 1
	movaps  xmm0, [SHA3_S]
# 0 "" 2
# 700 "echo32.c" 1
	movaps  xmm1, [SHA3_S+16]
# 0 "" 2
# 700 "echo32.c" 1
	movaps  xmm2, [SHA3_S+2*16]
# 0 "" 2
# 700 "echo32.c" 1
	movaps  xmm3, [SHA3_S+3*16]
# 0 "" 2
# 700 "echo32.c" 1
	pxor    xmm0, [SHA3_S+4*16]
# 0 "" 2
# 700 "echo32.c" 1
	pxor    xmm1, [SHA3_S+4*16+16]
# 0 "" 2
# 700 "echo32.c" 1
	pxor    xmm2, [SHA3_S+4*16+2*16]
# 0 "" 2
# 700 "echo32.c" 1
	pxor    xmm3, [SHA3_S+4*16+3*16]
# 0 "" 2
# 700 "echo32.c" 1
	pxor    xmm0, [SHA3_S+8*16]
# 0 "" 2
# 700 "echo32.c" 1
	pxor    xmm1, [SHA3_S+8*16+16]
# 0 "" 2
# 700 "echo32.c" 1
	pxor    xmm2, [SHA3_S+8*16+2*16]
# 0 "" 2
# 700 "echo32.c" 1
	pxor    xmm3, [SHA3_S+8*16+3*16]
# 0 "" 2
# 700 "echo32.c" 1
	pxor    xmm0, [SHA3_S+12*16]
# 0 "" 2
# 700 "echo32.c" 1
	pxor    xmm1, [SHA3_S+12*16+16]
# 0 "" 2
# 700 "echo32.c" 1
	pxor    xmm2, [SHA3_S+12*16+2*16]
# 0 "" 2
# 700 "echo32.c" 1
	pxor    xmm3, [SHA3_S+12*16+3*16]
# 0 "" 2
# 700 "echo32.c" 1
	movaps  [OLDCV],	   xmm0
# 0 "" 2
# 700 "echo32.c" 1
	movaps  [OLDCV+16],   xmm1
# 0 "" 2
# 700 "echo32.c" 1
	movaps  [OLDCV+2*16], xmm2
# 0 "" 2
# 700 "echo32.c" 1
	movaps  [OLDCV+3*16], xmm3
# 0 "" 2
# 705 "echo32.c" 1
	xor    ebx,ebx
# 0 "" 2
# 706 "echo32.c" 1
	xor    edx,edx
# 0 "" 2
# 708 "echo32.c" 1
	mov    [SHA3_RSP], rsp
# 0 "" 2
# 710 "echo32.c" 1
	LABEL_BIG_ROUND_NO2:
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+0]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+0+4]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 711 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+0],    edi
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+0+4],  esp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+16]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+16+4]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 711 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+16],    edi
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+16+4],  esp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+32]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+32+4]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 711 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+32],    edi
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+32+4],  esp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+48]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+48+4]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 711 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 711 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+48],    edi
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+48+4],  esp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+64]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+64+4]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 712 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+64],    edi
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+64+4],  esp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+80]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+80+4]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 712 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+80],    edi
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+80+4],  esp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+96]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+96+4]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 712 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+96],    edi
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+96+4],  esp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+112]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+112+4]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 712 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 712 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+112],    edi
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+112+4],  esp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, [SHA3_S+128]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, [SHA3_S+128+4]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 713 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+128],    edi
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+128+4],  esp
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, [SHA3_S+144]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, [SHA3_S+144+4]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 713 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+144],    edi
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+144+4],  esp
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, [SHA3_S+160]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, [SHA3_S+160+4]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 713 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+160],    edi
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+160+4],  esp
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, [SHA3_S+176]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, [SHA3_S+176+4]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 713 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 713 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 713 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 713 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 713 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 713 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 713 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+176],    edi
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+176+4],  esp
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 713 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, [SHA3_S+192]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, [SHA3_S+192+4]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 714 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+192],    edi
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+192+4],  esp
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, [SHA3_S+208]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, [SHA3_S+208+4]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 714 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+208],    edi
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+208+4],  esp
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, [SHA3_S+224]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, [SHA3_S+224+4]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 714 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+224],    edi
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+224+4],  esp
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, [SHA3_S+240]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, [SHA3_S+240+4]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 714 "echo32.c" 1
	movzx   edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 714 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 714 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 714 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 714 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 714 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 714 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+240],    edi
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+240+4],  esp
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 714 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*0]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*5]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 715 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 715 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 715 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 715 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 715 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 715 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 715 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 715 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 715 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0,  [SHA3_S]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S],   xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,     xmm4
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,     xmm5
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,     xmm6
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,     xmm7
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16], xmm1
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*2]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm2,      xmm7
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm2,      xmm5
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*2],  xmm2
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*3]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*3], xmm3
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*9]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 715 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 715 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 715 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 715 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 715 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 715 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 715 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 715 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 715 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*4], xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*5]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm1
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*6]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*6], xmm2
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*7]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*7], xmm3
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 715 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 715 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 715 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 715 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 715 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 715 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 715 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 715 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 715 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*8], xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*9]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm1
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm2
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*11]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm3,      xmm7
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm3,      xmm6
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*11], xmm3
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 715 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 715 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 715 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 715 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 715 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 715 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 715 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 715 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 715 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 715 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 715 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*12], xmm0
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm1
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm2
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 715 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 715 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm3
# 0 "" 2
# 716 "echo32.c" 1
	subd [SHA3_R], 1
# 0 "" 2
# 717 "echo32.c" 1
	jne LABEL_BIG_ROUND_NO2
# 0 "" 2
# 719 "echo32.c" 1
	END:
# 0 "" 2
# 721 "echo32.c" 1
	movaps  xmm0, [OLDCV]
# 0 "" 2
# 721 "echo32.c" 1
	movaps  xmm1, [OLDCV+16]
# 0 "" 2
# 721 "echo32.c" 1
	movaps  xmm2, [OLDCV+2*16]
# 0 "" 2
# 721 "echo32.c" 1
	movaps  xmm3, [OLDCV+3*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm0, [SHA3_S]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm1, [SHA3_S+1*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm2, [SHA3_S+2*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm3, [SHA3_S+3*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm0, [SHA3_S+4*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm1, [SHA3_S+5*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm2, [SHA3_S+6*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm3, [SHA3_S+7*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm0, [SHA3_S+8*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm1, [SHA3_S+9*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm2, [SHA3_S+10*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm3, [SHA3_S+11*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm0, [SHA3_S+12*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm1, [SHA3_S+13*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm2, [SHA3_S+14*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm3, [SHA3_S+15*16]
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm0, xmm2
# 0 "" 2
# 721 "echo32.c" 1
	pxor    xmm1, xmm3
# 0 "" 2
# 721 "echo32.c" 1
	movaps  [SHA3_S]     , xmm0
# 0 "" 2
# 721 "echo32.c" 1
	movaps  [SHA3_S+1*16], xmm1
# 0 "" 2
# 727 "echo32.c" 1
	mov    rsp, [SHA3_RSP]
# 0 "" 2
# 728 "echo32.c" 1
	pop rax
# 0 "" 2
# 728 "echo32.c" 1
	pop rbx
# 0 "" 2
# 728 "echo32.c" 1
	pop rcx
# 0 "" 2
# 728 "echo32.c" 1
	pop rdx
# 0 "" 2
# 728 "echo32.c" 1
	pop rsi
# 0 "" 2
# 728 "echo32.c" 1
	pop rdi
# 0 "" 2
# 728 "echo32.c" 1
	pop rbp
# 0 "" 2
# 729 "echo32.c" 1
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
	cmpq	$Saved_glob, %rdi
	movq	$Saved_glob, SHA3_S+280(%rip)
	je	.L4
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movdqa	SHA3_S(%rax), %xmm0
	movdqa	%xmm0, Saved_glob(%rax)
	addq	$16, %rax
	cmpq	$288, %rax
	jne	.L5
.L4:
	leal	-160(%rsi), %edx
	movq	%rdi, SHA3_S+280(%rip)
	movl	$-16843010, MEM_CST(%rip)
	movl	$-16843010, MEM_CST+4(%rip)
	movl	$-16843010, MEM_CST+8(%rip)
	movl	$2, %eax
	cmpl	$352, %edx
	movl	$-16843010, MEM_CST+12(%rip)
	movl	$16843009, MEM_CST+16(%rip)
	movl	$16843009, MEM_CST+20(%rip)
	movl	$16843009, MEM_CST+24(%rip)
	movl	$16843009, MEM_CST+28(%rip)
	movl	$1769499, MEM_CST+32(%rip)
	movl	$1769499, MEM_CST+36(%rip)
	movl	$1769499, MEM_CST+40(%rip)
	movl	$1769499, MEM_CST+44(%rip)
	movl	$1, MEM_CST+48(%rip)
	movl	$0, MEM_CST+52(%rip)
	movl	$0, MEM_CST+56(%rip)
	movl	$0, MEM_CST+60(%rip)
	ja	.L7
	xorl	%eax, %eax
	cmpl	$257, %esi
	movl	%esi, SHA3_S+268(%rip)
	setge	%al
	movslq	%esi,%rsi
	movl	$SHA3_S, %edx
	leal	2(%rax,%rax), %eax
	xorl	%ecx, %ecx
	movl	%eax, SHA3_S+272(%rip)
	.p2align 4,,10
	.p2align 3
.L10:
	addl	$1, %ecx
	movq	%rsi, (%rdx)
	movq	$0, 8(%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %eax
	jg	.L10
	addl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L12:
	movslq	%eax,%rdx
	movq	$0, SHA3_S(,%rdx,8)
	leal	1(%rax), %edx
	addl	$2, %eax
	cmpl	$32, %eax
	movslq	%edx,%rdx
	movq	$0, SHA3_S(,%rdx,8)
	jne	.L12
	movq	$0, SHA3_S+256(%rip)
	movl	$0, SHA3_S+264(%rip)
	xorb	%al, %al
.L7:
	rep
	ret
	.cfi_endproc
.LFE540:
	.size	Init, .-Init
	.p2align 4,,15
.globl Update
	.type	Update, @function
Update:
.LFB541:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	movq	%rsi, %rbx
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdx, (%rsp)
	movq	SHA3_S+280(%rip), %rdx
	cmpq	%rdi, %rdx
	je	.L19
	testb	$15, %dl
	movl	$SHA3_S, %esi
	jne	.L20
	cmpq	$SHA3_S+16, %rdx
	jbe	.L69
.L52:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L22:
	movdqa	SHA3_S(%rax), %xmm0
	movdqa	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	$288, %rax
	jne	.L22
	leaq	16(%rdi), %rax
	cmpq	%rax, %rsi
	jbe	.L70
.L53:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L27:
	movdqu	(%rdi,%rax), %xmm0
	movdqa	%xmm0, SHA3_S(%rax)
	addq	$16, %rax
	cmpq	$288, %rax
	jne	.L27
.L28:
	movq	%rdi, SHA3_S+280(%rip)
.L19:
	movl	SHA3_S+272(%rip), %edx
	movq	(%rsp), %r12
	movl	SHA3_S+264(%rip), %eax
	sall	$4, %edx
	shrq	$3, %r12
	movslq	%edx,%rbp
	sarl	$3, %eax
	testq	%r12, %r12
	leaq	SHA3_S(%rbp), %r14
	jle	.L68
	movl	$256, %r15d
	subl	%edx, %r15d
	.p2align 4,,10
	.p2align 3
.L43:
	movl	%r15d, %r8d
	subl	%eax, %r8d
	movslq	%r8d,%r13
	cmpq	%r12, %r13
	jle	.L32
	movq	%r12, %rdi
	sarq	$3, %rdi
	testq	%rdi, %rdi
	jle	.L34
	movslq	%eax,%rsi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	leaq	(%r14,%rsi), %r8
	.p2align 4,,10
	.p2align 3
.L44:
	movq	(%rbx,%rdx,8), %rsi
	addl	$1, %ecx
	movq	%rsi, (%r8,%rdx,8)
	mov	%ecx, %edx
	cmpq	%rdi, %rdx
	jl	.L44
.L34:
	movq	%r12, %rdx
	leal	0(,%rdi,8), %ecx
	andl	$7, %edx
	leaq	(%rdx,%rdi,8), %rdi
	mov	%ecx, %edx
	cmpq	%rdi, %rdx
	jge	.L45
	movslq	%eax,%rsi
	leaq	(%r14,%rsi), %r8
	.p2align 4,,10
	.p2align 3
.L46:
	movzbl	(%rbx,%rdx), %esi
	addl	$1, %ecx
	movb	%sil, (%r8,%rdx)
	mov	%ecx, %edx
	cmpq	%rdi, %rdx
	jl	.L46
.L45:
	addl	%r12d, %eax
	addq	%r12, %rbx
.L68:
	leal	0(,%rax,8), %edx
.L31:
	movq	(%rsp), %rcx
	movl	%edx, SHA3_S+264(%rip)
	andl	$7, %ecx
	je	.L47
	addl	%ecx, %edx
	movl	%edx, SHA3_S+264(%rip)
	xorl	%edx, %edx
	testl	%ecx, %ecx
	je	.L49
	movl	$7, %esi
	movl	$1, %edi
	subl	%ecx, %esi
	movl	$7, %ecx
	.p2align 4,,10
	.p2align 3
.L50:
	movl	%edi, %r8d
	sall	%cl, %r8d
	subl	$1, %ecx
	orl	%r8d, %edx
	cmpl	%esi, %ecx
	jne	.L50
	andb	(%rbx), %dl
.L49:
	cltq
	movb	%dl, SHA3_S(%rbp,%rax)
.L47:
	addq	$8, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L32:
	leal	7(%r8), %edx
	testl	%r8d, %r8d
	cmovns	%r8d, %edx
	sarl	$3, %edx
	testl	%edx, %edx
	je	.L35
	movslq	%eax,%r9
	cmpl	$21, %edx
	leaq	(%r14,%r9), %r9
	jbe	.L36
	testb	$15, %r9b
	jne	.L36
	leaq	16(%rbx), %rcx
	cmpq	%rcx, %r9
	jbe	.L71
.L54:
	movl	%edx, %r10d
	shrl	%r10d
	movl	%r10d, %ecx
	addl	%ecx, %ecx
	je	.L55
	xorl	%esi, %esi
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L39:
	movdqu	(%rbx,%rsi), %xmm0
	addl	$1, %edi
	movdqa	%xmm0, (%r9,%rsi)
	addq	$16, %rsi
	cmpl	%r10d, %edi
	jb	.L39
	cmpl	%ecx, %edx
	je	.L35
	.p2align 4,,10
	.p2align 3
.L55:
	mov	%ecx, %esi
	addl	$1, %ecx
	movq	(%rbx,%rsi,8), %rdi
	cmpl	%ecx, %edx
	movq	%rdi, (%r9,%rsi,8)
	ja	.L55
.L35:
	movl	%r8d, %ecx
	sall	$3, %edx
	sarl	$31, %ecx
	shrl	$29, %ecx
	leal	(%r8,%rcx), %esi
	andl	$7, %esi
	subl	%ecx, %esi
	leal	(%rdx,%rsi), %esi
	cmpl	%esi, %edx
	jae	.L41
	cltq
	leaq	(%r14,%rax), %rdi
	.p2align 4,,10
	.p2align 3
.L42:
	mov	%edx, %eax
	addl	$1, %edx
	movzbl	(%rbx,%rax), %ecx
	cmpl	%esi, %edx
	movb	%cl, (%rdi,%rax)
	jb	.L42
.L41:
	xorl	%eax, %eax
	subq	%r13, %r12
	sall	$3, %r8d
	addq	%r13, %rbx
	addl	%r8d, SHA3_S+264(%rip)
	call	Compress
	xorl	%eax, %eax
	testq	%r12, %r12
	jg	.L43
	xorl	%edx, %edx
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L71:
	leaq	16(%r9), %rcx
	cmpq	%rcx, %rbx
	ja	.L54
	.p2align 4,,10
	.p2align 3
.L36:
	leal	-1(%rdx), %esi
	movq	%rbx, %rcx
	leaq	8(%rbx,%rsi,8), %rdi
	.p2align 4,,10
	.p2align 3
.L40:
	movq	(%rcx), %rsi
	addq	$8, %rcx
	movq	%rsi, (%r9)
	addq	$8, %r9
	cmpq	%rdi, %rcx
	jne	.L40
	jmp	.L35
.L70:
	cmpq	$SHA3_S+16, %rdi
	ja	.L53
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L29:
	movq	(%rdi,%rax), %rdx
	movq	%rdx, SHA3_S(%rax)
	addq	$8, %rax
	cmpq	$288, %rax
	jne	.L29
	jmp	.L28
.L69:
	leaq	16(%rdx), %rax
	cmpq	%rax, %rsi
	ja	.L52
.L20:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L24:
	movq	SHA3_S(%rax), %rcx
	movq	%rcx, (%rdx,%rax)
	addq	$8, %rax
	cmpq	$288, %rax
	jne	.L24
	leaq	16(%rdi), %rax
	cmpq	%rax, %rsi
	ja	.L53
	jmp	.L70
	.cfi_endproc
.LFE541:
	.size	Update, .-Update
	.p2align 4,,15
.globl Final
	.type	Final, @function
Final:
.LFB542:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	pushq	%r12
	.cfi_def_cfa_offset 24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	movq	%rsi, %rbx
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	SHA3_S+280(%rip), %rdx
	cmpq	%rdi, %rdx
	je	.L73
	testb	$15, %dl
	movl	$SHA3_S, %esi
	jne	.L74
	cmpq	$SHA3_S+16, %rdx
	jbe	.L99
.L92:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L76:
	movdqa	SHA3_S(%rax), %xmm0
	movdqa	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	$288, %rax
	jne	.L76
	leaq	16(%rdi), %rax
	cmpq	%rax, %rsi
	jbe	.L100
.L93:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L81:
	movdqu	(%rdi,%rax), %xmm0
	movdqa	%xmm0, SHA3_S(%rax)
	addq	$16, %rax
	cmpq	$288, %rax
	jne	.L81
.L82:
	movq	%rdi, SHA3_S+280(%rip)
.L73:
	movl	SHA3_S+272(%rip), %edx
	movl	$16, %ebp
	movl	SHA3_S+264(%rip), %eax
	subl	%edx, %ebp
	movl	%edx, %esi
	sall	$7, %ebp
	sall	$4, %esi
	movl	%ebp, %edx
	movslq	%esi,%rsi
	subl	%eax, %edx
	addq	$SHA3_S, %rsi
	cmpl	$144, %edx
	jg	.L84
	leal	7(%rax), %edx
	testl	%eax, %eax
	movl	$255, %edi
	cmovns	%eax, %edx
	sarl	$3, %edx
	movslq	%edx,%rdx
	leaq	(%rsi,%rdx), %r8
	movl	%eax, %edx
	sarl	$31, %edx
	shrl	$29, %edx
	leal	(%rax,%rdx), %ecx
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
	jle	.L85
	movl	%ebp, %edx
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
	xorl	%eax, %eax
	call	Compress
	movl	SHA3_S+272(%rip), %eax
	movslq	SHA3_S+264(%rip),%r12
	addq	SHA3_S+256(%rip), %r12
	sall	$4, %eax
	cltq
	leaq	SHA3_S(%rax), %r13
.L86:
	subl	$144, %ebp
	movq	%r13, %rdi
	leal	7(%rbp), %eax
	testl	%ebp, %ebp
	cmovns	%ebp, %eax
	xorl	%esi, %esi
	sarl	$3, %eax
	movslq	%eax,%rdx
	call	memset
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L84:
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
.L85:
	movl	SHA3_S+272(%rip), %r13d
	movslq	SHA3_S+264(%rip),%r12
	addq	SHA3_S+256(%rip), %r12
	sall	$4, %r13d
	movslq	%r13d,%r13
	addq	$SHA3_S, %r13
	testl	%eax, %eax
	je	.L86
	subl	$144, %ebp
	leal	7(%rax), %ecx
	subl	%eax, %ebp
	leal	7(%rbp), %edx
	testl	%ebp, %ebp
	cmovs	%edx, %ebp
	sarl	$3, %ebp
	testl	%eax, %eax
	cmovs	%ecx, %eax
	movslq	%ebp,%rdx
	xorl	%esi, %esi
	sarl	$3, %eax
	cltq
	leaq	1(%r13,%rax), %rdi
	call	memset
.L88:
	movl	$16, %eax
	subl	SHA3_S+272(%rip), %eax
	movl	SHA3_S+268(%rip), %edx
	sall	$4, %eax
	cltq
	leaq	-18(%r13,%rax), %rax
	movb	%dl, (%rax)
	movl	SHA3_S+268(%rip), %edx
	movb	%r12b, 2(%rax)
	movb	$0, 10(%rax)
	movb	$0, 11(%rax)
	movb	$0, 12(%rax)
	sarl	$8, %edx
	movb	$0, 13(%rax)
	movb	$0, 14(%rax)
	movb	%dl, 1(%rax)
	movq	%r12, %rdx
	movb	$0, 15(%rax)
	shrq	$8, %rdx
	movb	$0, 16(%rax)
	movb	$0, 17(%rax)
	movb	%dl, 3(%rax)
	movq	%r12, %rdx
	shrq	$16, %rdx
	movb	%dl, 4(%rax)
	movq	%r12, %rdx
	shrq	$24, %rdx
	movb	%dl, 5(%rax)
	movq	%r12, %rdx
	shrq	$32, %rdx
	movb	%dl, 6(%rax)
	movq	%r12, %rdx
	shrq	$40, %rdx
	movb	%dl, 7(%rax)
	movq	%r12, %rdx
	shrq	$56, %r12
	shrq	$48, %rdx
	movb	%r12b, 9(%rax)
	movb	%dl, 8(%rax)
	xorl	%eax, %eax
	call	Compress
	movl	SHA3_S+268(%rip), %eax
	sarl	$3, %eax
	testl	%eax, %eax
	je	.L89
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L90:
	movl	%eax, %edx
	movl	%eax, %ecx
	mov	%eax, %esi
	shrl	$3, %edx
	andl	$7, %ecx
	addl	$1, %eax
	mov	%edx, %edx
	sall	$3, %ecx
	movq	SHA3_S(,%rdx,8), %rdx
	shrq	%cl, %rdx
	movb	%dl, (%rbx,%rsi)
	movl	SHA3_S+268(%rip), %edx
	sarl	$3, %edx
	cmpl	%eax, %edx
	ja	.L90
.L89:
	movq	$0, SHA3_S+280(%rip)
	addq	$8, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L100:
	cmpq	$SHA3_S+16, %rdi
	ja	.L93
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L83:
	movq	(%rdi,%rax), %rdx
	movq	%rdx, SHA3_S(%rax)
	addq	$8, %rax
	cmpq	$288, %rax
	jne	.L83
	jmp	.L82
.L99:
	leaq	16(%rdx), %rax
	cmpq	%rax, %rsi
	ja	.L92
.L74:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L78:
	movq	SHA3_S(%rax), %rcx
	movq	%rcx, (%rdx,%rax)
	addq	$8, %rax
	cmpq	$288, %rax
	jne	.L78
	leaq	16(%rdi), %rax
	cmpq	%rax, %rsi
	ja	.L93
	jmp	.L100
	.cfi_endproc
.LFE542:
	.size	Final, .-Final
	.p2align 4,,15
	.type	T.56, @function
T.56:
.LFB545:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	movq	%rdx, %rbp
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$296, %rsp
	.cfi_def_cfa_offset 320
	movq	$Saved_glob, SHA3_S+280(%rip)
.L102:
	movdqa	SHA3_S(%rax), %xmm0
	movdqa	%xmm0, Saved_glob(%rax)
	addq	$16, %rax
	cmpq	$288, %rax
	jne	.L102
	.cfi_offset 3, -24
	movdqa	.LC0(%rip), %xmm0
	movl	$SHA3_S, %eax
	movq	%rsi, %rdx
	movq	%rdi, %rsi
	movq	%rsp, %rdi
	movdqa	%xmm0, SHA3_S(%rip)
	movq	%rsp, SHA3_S+280(%rip)
	movl	$-16843010, MEM_CST(%rip)
	movdqa	%xmm0, 16(%rax)
	pxor	%xmm0, %xmm0
	movl	$-16843010, MEM_CST+4(%rip)
	movl	$-16843010, MEM_CST+8(%rip)
	movdqa	%xmm0, SHA3_S+32(%rip)
	movl	$-16843010, MEM_CST+12(%rip)
	movl	$16843009, MEM_CST+16(%rip)
	movdqa	%xmm0, SHA3_S+48(%rip)
	movdqa	%xmm0, SHA3_S+64(%rip)
	movdqa	%xmm0, SHA3_S+80(%rip)
	movdqa	%xmm0, SHA3_S+96(%rip)
	movdqa	%xmm0, SHA3_S+112(%rip)
	movdqa	%xmm0, SHA3_S+128(%rip)
	movdqa	%xmm0, SHA3_S+144(%rip)
	movdqa	%xmm0, SHA3_S+160(%rip)
	movdqa	%xmm0, SHA3_S+176(%rip)
	movdqa	%xmm0, SHA3_S+192(%rip)
	movl	$16843009, MEM_CST+20(%rip)
	movl	$16843009, MEM_CST+24(%rip)
	movl	$16843009, MEM_CST+28(%rip)
	movl	$1769499, MEM_CST+32(%rip)
	movl	$1769499, MEM_CST+36(%rip)
	movl	$1769499, MEM_CST+40(%rip)
	movl	$1769499, MEM_CST+44(%rip)
	movl	$1, MEM_CST+48(%rip)
	movl	$0, MEM_CST+52(%rip)
	movl	$0, MEM_CST+56(%rip)
	movl	$0, MEM_CST+60(%rip)
	movl	$256, SHA3_S+268(%rip)
	movl	$2, SHA3_S+272(%rip)
	movdqa	%xmm0, SHA3_S+208(%rip)
	movq	$0, SHA3_S+256(%rip)
	movl	$0, SHA3_S+264(%rip)
	movdqa	%xmm0, SHA3_S+224(%rip)
	movdqa	%xmm0, SHA3_S+240(%rip)
	call	Update
	testl	%eax, %eax
	je	.L106
	addq	$296, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L106:
	movq	%rbp, %rsi
	movq	%rsp, %rdi
	call	Final
	addq	$296, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.cfi_endproc
.LFE545:
	.size	T.56, .-T.56
	.p2align 4,,15
.globl crypto_hash_echosp256_pentium_pentium4v64v1
	.type	crypto_hash_echosp256_pentium_pentium4v64v1, @function
crypto_hash_echosp256_pentium_pentium4v64v1:
.LFB544:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rsi, %rdi
	leaq	0(,%rdx,8), %rsi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rax, %rdx
	call	T.56
	cmpl	$1, %eax
	sbbl	%eax, %eax
	addq	$8, %rsp
	notl	%eax
	ret
	.cfi_endproc
.LFE544:
	.size	crypto_hash_echosp256_pentium_pentium4v64v1, .-crypto_hash_echosp256_pentium_pentium4v64v1
	.p2align 4,,15
.globl Hash
	.type	Hash, @function
Hash:
.LFB543:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	movq	%rcx, %rbp
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$296, %rsp
	.cfi_def_cfa_offset 320
	movq	$Saved_glob, SHA3_S+280(%rip)
	.p2align 4,,10
	.p2align 3
.L112:
	movdqa	SHA3_S(%rax), %xmm0
	movdqa	%xmm0, Saved_glob(%rax)
	addq	$16, %rax
	cmpq	$288, %rax
	jne	.L112
	.cfi_offset 3, -24
	leal	-160(%rdi), %ecx
	movq	%rsp, SHA3_S+280(%rip)
	movl	$-16843010, MEM_CST(%rip)
	movl	$-16843010, MEM_CST+4(%rip)
	movl	$-16843010, MEM_CST+8(%rip)
	movw	$2, %ax
	cmpl	$352, %ecx
	movl	$-16843010, MEM_CST+12(%rip)
	movl	$16843009, MEM_CST+16(%rip)
	movl	$16843009, MEM_CST+20(%rip)
	movl	$16843009, MEM_CST+24(%rip)
	movl	$16843009, MEM_CST+28(%rip)
	movl	$1769499, MEM_CST+32(%rip)
	movl	$1769499, MEM_CST+36(%rip)
	movl	$1769499, MEM_CST+40(%rip)
	movl	$1769499, MEM_CST+44(%rip)
	movl	$1, MEM_CST+48(%rip)
	movl	$0, MEM_CST+52(%rip)
	movl	$0, MEM_CST+56(%rip)
	movl	$0, MEM_CST+60(%rip)
	ja	.L114
	xorl	%eax, %eax
	cmpl	$257, %edi
	movl	%edi, SHA3_S+268(%rip)
	setge	%al
	movslq	%edi,%rdi
	movl	$SHA3_S, %ecx
	leal	2(%rax,%rax), %eax
	xorl	%r8d, %r8d
	movl	%eax, SHA3_S+272(%rip)
	.p2align 4,,10
	.p2align 3
.L116:
	addl	$1, %r8d
	movq	%rdi, (%rcx)
	movq	$0, 8(%rcx)
	addq	$16, %rcx
	cmpl	%eax, %r8d
	jl	.L116
	addl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L119:
	movslq	%eax,%rcx
	movq	$0, SHA3_S(,%rcx,8)
	leal	1(%rax), %ecx
	addl	$2, %eax
	cmpl	$32, %eax
	movslq	%ecx,%rcx
	movq	$0, SHA3_S(,%rcx,8)
	jne	.L119
	movq	%rsp, %rdi
	movq	$0, SHA3_S+256(%rip)
	movl	$0, SHA3_S+264(%rip)
	call	Update
	testl	%eax, %eax
	je	.L124
.L114:
	addq	$296, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L124:
	movq	%rbp, %rsi
	movq	%rsp, %rdi
	call	Final
	addq	$296, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.cfi_endproc
.LFE543:
	.size	Hash, .-Hash
.globl Te
	.data
	.align 32
	.type	Te, @object
	.size	Te, 2048
Te:
	.quad	-6529265329927658554
	.quad	-8900101356774458120
	.quad	-7388304797017344018
	.quad	-8251865593360450570
	.quad	1005132844121649919
	.quad	-4797622407988024362
	.quad	-5661183204331130914
	.quad	6108505697581122961
	.quad	5778171512136675424
	.quad	216455365242454274
	.quad	-6239904621395482674
	.quad	9019350329206713174
	.quad	1873214763559747303
	.quad	7122398509757093813
	.quad	-1825176872897762483
	.quad	-7316529786040977684
	.quad	5029054650612632207
	.quad	-7096966990484307425
	.quad	4668484080080898441
	.quad	-8683645991532003846
	.quad	1583854123747048175
	.quad	-1488059576881686094
	.quad	-3943104270151759986
	.quad	860452489855561979
	.quad	-1392266211132330687
	.quad	7481838747975472307
	.quad	-170395302725770657
	.quad	-1535816233085063355
	.quad	-4639661838745953245
	.quad	-602175769616800685
	.quad	-7605890494573153564
	.quad	6611496026471710875
	.quad	-4415859193207605387
	.quad	2089104945465654753
	.quad	-5867183996402429123
	.quad	7648843126775621196
	.quad	6500442951153759852
	.quad	4701546347491180414
	.quad	213912139012241397
	.quad	5750195688596884611
	.quad	6643992973106492520
	.quad	-818065985882446511
	.quad	3811705346337400273
	.quad	644562273589916153
	.quad	-7822345859815607838
	.quad	8347660140225812651
	.quad	5994626877379129698
	.quad	4545562670091539754
	.quad	865821460969817096
	.quad	5964955675628390293
	.quad	7287707407267078982
	.quad	6828516540690973597
	.quad	2889085756068337712
	.quad	-6803085021418187209
	.quad	1082276826212271370
	.quad	-5360802876730205649
	.quad	650496428040718094
	.quad	3896196574364176932
	.quad	-7241647344750395365
	.quad	4459376029494076127
	.quad	2804594459322084301
	.quad	7577068115799254862
	.quad	-3624638488098196865
	.quad	-6956524398845790742
	.quad	1948098287182088466
	.quad	-7024626830531132643
	.quad	8371114565792705624
	.quad	3321996486553246260
	.quad	3250221475576879926
	.quad	-5589408193354764580
	.quad	-1271604211639231820
	.quad	-315075656991858597
	.quad	-697404123828301148
	.quad	5565107143834286966
	.quad	7050058349803919031
	.quad	-3552298328145022083
	.quad	8874669974940625234
	.quad	4531716189447250909
	.quad	8155789532863606622
	.quad	-7528747457375337453
	.quad	-769179134804667482
	.quad	7553048644334768569
	.quad	0
	.quad	3237505121087516097
	.quad	6926571687758536768
	.quad	2304995161731300579
	.quad	-3985209058629930631
	.quad	-1343379222615598154
	.quad	-4725847397011658028
	.quad	5101394810565806989
	.quad	-2756556568660099481
	.quad	5420426789568199026
	.quad	-2429047045767935340
	.quad	-3149057820158309224
	.quad	-1704514942124140368
	.quad	5390755450378506117
	.quad	7768938860600414395
	.quad	3093955099134783429
	.quad	-1897517032850937265
	.quad	1656194283700222957
	.quad	-4232464978683935866
	.quad	-2932602454915854950
	.quad	6139307231645217638
	.quad	-7744637673640983279
	.quad	-3511323871980206710
	.quad	1223283553215314409
	.quad	432910730484908548
	.quad	-9115426389703557122
	.quad	-1130314854313209696
	.quad	4916871380420279416
	.quad	-4999102076964331739
	.quad	-2042197387117025205
	.quad	-913859489070755422
	.quad	-98055142772595875
	.quad	-4593600698192478080
	.quad	-8462387920843600123
	.quad	-5939524156355603905
	.quad	-4855552055011599071
	.quad	5203971424325744752
	.quad	357462160964974065
	.quad	-2324776170488546205
	.quad	-4488199353160780169
	.quad	8492340494491900591
	.quad	7143027053000991042
	.quad	3463285843879268384
	.quad	1945554923512922085
	.quad	1077473004074824701
	.quad	7913619214866502335
	.quad	5534305472331238785
	.quad	1444542878034168856
	.quad	3824421563387810598
	.quad	3453395337353161923
	.quad	-2206940018958704706
	.quad	-6730744861465012427
	.quad	-3727779237222660984
	.quad	4113782271919986478
	.quad	6324395913846768787
	.quad	-961616007835179179
	.quad	-9043651378727190788
	.quad	5133326745662733690
	.quad	-6024579588466383672
	.quad	-1775159620787151430
	.quad	3105541121310791986
	.quad	-7677665505549519898
	.quad	-6890401049436200768
	.quad	-7457537561016041191
	.quad	-3364382853087408226
	.quad	9213481532476152995
	.quad	7359482418243445316
	.quad	9091125340183079508
	.quad	-6084204510621691845
	.quad	-8968769074875561973
	.quad	-3871329259175393652
	.quad	3021614939181608647
	.quad	-3190597562738886549
	.quad	4329107304849085480
	.quad	8781701134304599719
	.quad	-2135165007982338372
	.quad	2092778641448176406
	.quad	8564680654445075373
	.quad	4314695675227988187
	.quad	6211082242621583972
	.quad	5636882154810653300
	.quad	2164553652424542740
	.quad	-2645502411010389614
	.quad	722271439017084428
	.quad	7792393148728353864
	.quad	-1991614986029605704
	.quad	6756176380737798815
	.quad	7985959374819677117
	.quad	-1176375994866684861
	.quad	-6457490318951292220
	.quad	-6300094726887337671
	.quad	-6587194839512279759
	.quad	4027595562603046099
	.quad	-8396545947626538510
	.quad	3668155324384667605
	.quad	4884374296346544267
	.quad	6428667940177393518
	.quad	-5229402806159577638
	.quad	-8318837898890867455
	.quad	7265948531709826481
	.quad	-3292607842111041892
	.quad	-2258087603382671031
	.quad	-5445858171402031912
	.quad	-408043415296125268
	.quad	573352377230619891
	.quad	2732254299368909519
	.quad	-5808124223223929398
	.quad	-8180090582384084236
	.quad	-1608156393038238137
	.quad	1731642921939634192
	.quad	-3045917208472798609
	.quad	-8613001312868992784
	.quad	8008848513970808138
	.quad	8227564543839972956
	.quad	2601985712162872376
	.quad	-1033956167788353961
	.quad	-4056418954989226893
	.quad	5892615515675215511
	.quad	2587573945102821579
	.quad	8997591316210507169
	.quad	-7172979764088245016
	.quad	2386660679233773374
	.quad	-2500822056744301674
	.quad	-2540666386754192031
	.quad	-8751748560656299251
	.quad	-8824088720609474033
	.quad	-8038801225058062112
	.quad	4773321358467546748
	.quad	-4272309171254872719
	.quad	-6168129610419116340
	.quad	-2861957776252843888
	.quad	361135719508542214
	.quad	141571979059066615
	.quad	1300992856081436188
	.quad	-6673945684193746494
	.quad	6860448338348946794
	.quad	-479818426272491602
	.quad	-3406487779004532375
	.quad	-7960527855546890729
	.quad	6395605810206065049
	.quad	2818441077405326650
	.quad	-5071442236917506521
	.quad	4098805458962342361
	.quad	1439173769480960235
	.quad	-5505483230996293589
	.quad	3679741209121722658
	.quad	-4942302762254112302
	.quad	8131769923960166825
	.quad	-8534728080796774905
	.quad	-6371304623246633933
	.quad	-5288462716777030867
	.quad	2458435690210139708
	.quad	-7888187695593715947
	.quad	2371683728837175753
	.quad	5318415290425331335
	.quad	-48038028100938326
	.quad	8658214609698170960
	.quad	8854041294257774501
	.quad	-8102947682625221629
	.quad	-530965873257504423
	.quad	-9184659291141207799
	.quad	1660998243276623130
	.quad	-2684216408706924699
	.quad	3595815164431492823
	.quad	-4160689967707569532
	.quad	-5158758127496566576
	.quad	-4377145332950023806
	.quad	-5721373447261939415
	.quad	8587569931035159898
	.quad	1229217845105069854
	.quad	-3769318842364284805
	.quad	-264493393343392600
	.quad	-2973577048519623827
	.quad	4185557282896352812
	.comm	OLDCV,64,32
	.comm	MEM_CST,64,32
	.comm	SHA3_CNT,8,8
	.comm	SHA3_RSP,8,8
	.comm	SHA3_R,4,4
	.comm	Saved_glob,288,32
	.comm	SHA3_S,288,32
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	256
	.quad	0
	.ident	"GCC: (Debian 4.4.3-7) 4.4.3"
	.section	.note.GNU-stack,"",@progbits
