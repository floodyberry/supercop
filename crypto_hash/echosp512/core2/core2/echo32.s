#------------------------------------------------------------------------------------ #
# Implementation of the simple pipe ECHO hash function in its 512-bit outputs variant.#
# Optimized for Intel Core2, 32-bit mode                                              #
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
# 604 "echo32.c" 1
	.intel_syntax noprefix
# 0 "" 2
# 605 "echo32.c" 1
	pusha
# 0 "" 2
# 610 "echo32.c" 1
	mov    dword ptr [SHA3_R], 10
# 0 "" 2
# 612 "echo32.c" 1
	mov    eax, dword ptr [SHA3_S+264]
# 0 "" 2
# 613 "echo32.c" 1
	mov    ecx, dword ptr [SHA3_S+264]
# 0 "" 2
# 614 "echo32.c" 1
	mov    edx, eax
# 0 "" 2
# 615 "echo32.c" 1
	sar    edx, 31
# 0 "" 2
# 616 "echo32.c" 1
	add    eax, dword ptr [SHA3_S+256]
# 0 "" 2
# 617 "echo32.c" 1
	adc    edx, dword ptr [SHA3_S+260]
# 0 "" 2
# 618 "echo32.c" 1
	mov    dword ptr [SHA3_CNT],   0
# 0 "" 2
# 619 "echo32.c" 1
	mov    dword ptr [SHA3_CNT+4], 0
# 0 "" 2
# 620 "echo32.c" 1
	test   ecx, ecx
# 0 "" 2
# 621 "echo32.c" 1
	mov    dword ptr [SHA3_S+256], eax
# 0 "" 2
# 622 "echo32.c" 1
	mov    dword ptr [SHA3_S+260], edx
# 0 "" 2
# 623 "echo32.c" 1
	je     L2
# 0 "" 2
# 624 "echo32.c" 1
	mov    dword ptr [SHA3_CNT],   eax
# 0 "" 2
# 625 "echo32.c" 1
	mov    dword ptr [SHA3_CNT+4], edx
# 0 "" 2
# 626 "echo32.c" 1
	L2:
# 0 "" 2
# 627 "echo32.c" 1
	mov    edx, dword ptr [SHA3_CNT+4]
# 0 "" 2
# 628 "echo32.c" 1
	mov    dword ptr [SHA3_S+264], 0
# 0 "" 2
# 629 "echo32.c" 1
	mov    eax, dword ptr [SHA3_CNT]
# 0 "" 2
# 630 "echo32.c" 1
	cmp    edx, 0
# 0 "" 2
# 631 "echo32.c" 1
	ja     OVERFLOW
# 0 "" 2
# 636 "echo32.c" 1
	cmp    eax, -162
# 0 "" 2
# 638 "echo32.c" 1
	ja     OVERFLOW
# 0 "" 2
# 641 "echo32.c" 1
	NO_OVERFLOW1:
# 0 "" 2
# 646 "echo32.c" 1
	movaps  xmm0, [SHA3_S]
# 0 "" 2
# 646 "echo32.c" 1
	movaps  xmm1, [SHA3_S+16]
# 0 "" 2
# 646 "echo32.c" 1
	movaps  xmm2, [SHA3_S+2*16]
# 0 "" 2
# 646 "echo32.c" 1
	movaps  xmm3, [SHA3_S+3*16]
# 0 "" 2
# 646 "echo32.c" 1
	pxor    xmm0, [SHA3_S+4*16]
# 0 "" 2
# 646 "echo32.c" 1
	pxor    xmm1, [SHA3_S+4*16+16]
# 0 "" 2
# 646 "echo32.c" 1
	pxor    xmm2, [SHA3_S+4*16+2*16]
# 0 "" 2
# 646 "echo32.c" 1
	pxor    xmm3, [SHA3_S+4*16+3*16]
# 0 "" 2
# 646 "echo32.c" 1
	pxor    xmm0, [SHA3_S+8*16]
# 0 "" 2
# 646 "echo32.c" 1
	pxor    xmm1, [SHA3_S+8*16+16]
# 0 "" 2
# 646 "echo32.c" 1
	pxor    xmm2, [SHA3_S+8*16+2*16]
# 0 "" 2
# 646 "echo32.c" 1
	pxor    xmm3, [SHA3_S+8*16+3*16]
# 0 "" 2
# 646 "echo32.c" 1
	pxor    xmm0, [SHA3_S+12*16]
# 0 "" 2
# 646 "echo32.c" 1
	pxor    xmm1, [SHA3_S+12*16+16]
# 0 "" 2
# 646 "echo32.c" 1
	pxor    xmm2, [SHA3_S+12*16+2*16]
# 0 "" 2
# 646 "echo32.c" 1
	pxor    xmm3, [SHA3_S+12*16+3*16]
# 0 "" 2
# 646 "echo32.c" 1
	movaps  [OLDCV],	   xmm0
# 0 "" 2
# 646 "echo32.c" 1
	movaps  [OLDCV+16],   xmm1
# 0 "" 2
# 646 "echo32.c" 1
	movaps  [OLDCV+2*16], xmm2
# 0 "" 2
# 646 "echo32.c" 1
	movaps  [OLDCV+3*16], xmm3
# 0 "" 2
# 648 "echo32.c" 1
	xor    ebx,ebx
# 0 "" 2
# 649 "echo32.c" 1
	xor    edx,edx
# 0 "" 2
# 651 "echo32.c" 1
	mov    [SHA3_ESP], esp
# 0 "" 2
# 653 "echo32.c" 1
	LABEL_BIG_ROUND_NO1:
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, [SHA3_S+0]
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, [SHA3_S+0+4]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+0],    edi
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+0+4],  esp
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, [SHA3_S+16]
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, [SHA3_S+16+4]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+16],    edi
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+16+4],  esp
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, [SHA3_S+32]
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, [SHA3_S+32+4]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+32],    edi
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+32+4],  esp
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, [SHA3_S+48]
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, [SHA3_S+48+4]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 654 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 654 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 654 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 654 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 654 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 654 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 654 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 654 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 654 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+48],    edi
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+48+4],  esp
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 654 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, [SHA3_S+64]
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, [SHA3_S+64+4]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+64],    edi
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+64+4],  esp
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, [SHA3_S+80]
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, [SHA3_S+80+4]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+80],    edi
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+80+4],  esp
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, [SHA3_S+96]
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, [SHA3_S+96+4]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+96],    edi
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+96+4],  esp
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, [SHA3_S+112]
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, [SHA3_S+112+4]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 655 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 655 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 655 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 655 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 655 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 655 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 655 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 655 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 655 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+112],    edi
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+112+4],  esp
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 655 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+128]
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+128+4]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+128],    edi
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+128+4],  esp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+144]
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+144+4]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+144],    edi
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+144+4],  esp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+160]
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+160+4]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+160],    edi
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+160+4],  esp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+176]
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+176+4]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 656 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 656 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 656 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 656 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 656 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 656 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 656 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 656 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 656 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+176],    edi
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+176+4],  esp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 656 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+192]
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+192+4]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+192],    edi
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+192+4],  esp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+208]
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+208+4]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+208],    edi
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+208+4],  esp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+224]
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+224+4]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+224],    edi
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+224+4],  esp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+240]
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+240+4]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 657 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 657 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 657 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 657 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 657 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 657 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 657 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 657 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 657 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+240],    edi
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+240+4],  esp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 657 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*0]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*5]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 658 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 658 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 658 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 658 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 658 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 658 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 658 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 658 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 658 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0,  [SHA3_S]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S],   xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,     xmm4
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,     xmm5
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,     xmm6
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,     xmm7
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16], xmm1
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*2]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm2,      xmm7
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm2,      xmm5
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*2],  xmm2
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*3]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*3], xmm3
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*9]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 658 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 658 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 658 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 658 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 658 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 658 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 658 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 658 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 658 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*4], xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*5]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm1
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*6]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*6], xmm2
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*7]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*7], xmm3
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 658 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 658 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 658 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 658 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 658 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 658 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 658 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 658 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 658 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*8], xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*9]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm1
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm2
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*11]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm3,      xmm7
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm3,      xmm6
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*11], xmm3
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 658 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 658 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 658 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 658 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 658 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 658 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 658 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 658 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 658 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 658 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 658 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*12], xmm0
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm1
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm2
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 658 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 658 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm3
# 0 "" 2
# 659 "echo32.c" 1
	subd [SHA3_R], 1
# 0 "" 2
# 660 "echo32.c" 1
	jne LABEL_BIG_ROUND_NO1
# 0 "" 2
# 661 "echo32.c" 1
	jmp END
# 0 "" 2
# 663 "echo32.c" 1
	OVERFLOW:
# 0 "" 2
# 664 "echo32.c" 1
	mov    ecx, eax
# 0 "" 2
# 665 "echo32.c" 1
	mov    ebx, edx
# 0 "" 2
# 670 "echo32.c" 1
	add    ecx, 160
# 0 "" 2
# 672 "echo32.c" 1
	adc    ebx, 0
# 0 "" 2
# 673 "echo32.c" 1
	cmp    ebx, edx
# 0 "" 2
# 674 "echo32.c" 1
	je     NO_OVERFLOW2
# 0 "" 2
# 679 "echo32.c" 1
	movaps  xmm0, [SHA3_S]
# 0 "" 2
# 679 "echo32.c" 1
	movaps  xmm1, [SHA3_S+16]
# 0 "" 2
# 679 "echo32.c" 1
	movaps  xmm2, [SHA3_S+2*16]
# 0 "" 2
# 679 "echo32.c" 1
	movaps  xmm3, [SHA3_S+3*16]
# 0 "" 2
# 679 "echo32.c" 1
	pxor    xmm0, [SHA3_S+4*16]
# 0 "" 2
# 679 "echo32.c" 1
	pxor    xmm1, [SHA3_S+4*16+16]
# 0 "" 2
# 679 "echo32.c" 1
	pxor    xmm2, [SHA3_S+4*16+2*16]
# 0 "" 2
# 679 "echo32.c" 1
	pxor    xmm3, [SHA3_S+4*16+3*16]
# 0 "" 2
# 679 "echo32.c" 1
	pxor    xmm0, [SHA3_S+8*16]
# 0 "" 2
# 679 "echo32.c" 1
	pxor    xmm1, [SHA3_S+8*16+16]
# 0 "" 2
# 679 "echo32.c" 1
	pxor    xmm2, [SHA3_S+8*16+2*16]
# 0 "" 2
# 679 "echo32.c" 1
	pxor    xmm3, [SHA3_S+8*16+3*16]
# 0 "" 2
# 679 "echo32.c" 1
	pxor    xmm0, [SHA3_S+12*16]
# 0 "" 2
# 679 "echo32.c" 1
	pxor    xmm1, [SHA3_S+12*16+16]
# 0 "" 2
# 679 "echo32.c" 1
	pxor    xmm2, [SHA3_S+12*16+2*16]
# 0 "" 2
# 679 "echo32.c" 1
	pxor    xmm3, [SHA3_S+12*16+3*16]
# 0 "" 2
# 679 "echo32.c" 1
	movaps  [OLDCV],	   xmm0
# 0 "" 2
# 679 "echo32.c" 1
	movaps  [OLDCV+16],   xmm1
# 0 "" 2
# 679 "echo32.c" 1
	movaps  [OLDCV+2*16], xmm2
# 0 "" 2
# 679 "echo32.c" 1
	movaps  [OLDCV+3*16], xmm3
# 0 "" 2
# 681 "echo32.c" 1
	xor    ebx,ebx
# 0 "" 2
# 682 "echo32.c" 1
	xor    edx,edx
# 0 "" 2
# 684 "echo32.c" 1
	mov    [SHA3_ESP], esp
# 0 "" 2
# 685 "echo32.c" 1
	LABEL_BIG_ROUND_O:
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, [SHA3_S+0]
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, [SHA3_S+0+4]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 686 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+0],    edi
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+0+4],  esp
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, [SHA3_S+16]
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, [SHA3_S+16+4]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 686 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+16],    edi
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+16+4],  esp
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, [SHA3_S+32]
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, [SHA3_S+32+4]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 686 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+32],    edi
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+32+4],  esp
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, [SHA3_S+48]
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, [SHA3_S+48+4]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 686 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 686 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 686 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 686 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 686 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 686 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 686 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 686 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 686 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 686 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+48],    edi
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+48+4],  esp
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 686 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, [SHA3_S+64]
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, [SHA3_S+64+4]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 687 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+64],    edi
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+64+4],  esp
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, [SHA3_S+80]
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, [SHA3_S+80+4]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 687 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+80],    edi
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+80+4],  esp
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, [SHA3_S+96]
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, [SHA3_S+96+4]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 687 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+96],    edi
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+96+4],  esp
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, [SHA3_S+112]
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, [SHA3_S+112+4]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 687 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 687 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 687 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 687 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 687 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 687 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 687 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 687 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 687 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 687 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+112],    edi
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+112+4],  esp
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 687 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+128]
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+128+4]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+128],    edi
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+128+4],  esp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+144]
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+144+4]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+144],    edi
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+144+4],  esp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+160]
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+160+4]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+160],    edi
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+160+4],  esp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+176]
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+176+4]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 688 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 688 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 688 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 688 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 688 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 688 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 688 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 688 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 688 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 688 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+176],    edi
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+176+4],  esp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 688 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+192]
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+192+4]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+192],    edi
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+192+4],  esp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+208]
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+208+4]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+208],    edi
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+208+4],  esp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+224]
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+224+4]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+224],    edi
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+224+4],  esp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+240]
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+240+4]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 689 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 689 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 689 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 689 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 689 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 689 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 689 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 689 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 689 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 689 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+240],    edi
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+240+4],  esp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 689 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*0]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*5]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 690 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 690 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 690 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 690 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 690 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 690 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 690 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 690 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 690 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0,  [SHA3_S]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S],   xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,     xmm4
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,     xmm5
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,     xmm6
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,     xmm7
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16], xmm1
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*2]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm2,      xmm7
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm2,      xmm5
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*2],  xmm2
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*3]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*3], xmm3
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*9]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 690 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 690 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 690 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 690 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 690 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 690 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 690 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 690 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 690 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*4], xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*5]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm1
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*6]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*6], xmm2
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*7]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*7], xmm3
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 690 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 690 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 690 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 690 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 690 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 690 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 690 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 690 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 690 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*8], xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*9]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm1
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm2
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*11]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm3,      xmm7
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm3,      xmm6
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*11], xmm3
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 690 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 690 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 690 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 690 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 690 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 690 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 690 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 690 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 690 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 690 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 690 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*12], xmm0
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm1
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm2
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 690 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 690 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm3
# 0 "" 2
# 691 "echo32.c" 1
	subd [SHA3_R], 1
# 0 "" 2
# 692 "echo32.c" 1
	jne LABEL_BIG_ROUND_O
# 0 "" 2
# 693 "echo32.c" 1
	jmp END
# 0 "" 2
# 695 "echo32.c" 1
	NO_OVERFLOW2:
# 0 "" 2
# 696 "echo32.c" 1
	mov    dword ptr [SHA3_S+264], 0
# 0 "" 2
# 701 "echo32.c" 1
	movaps  xmm0, [SHA3_S]
# 0 "" 2
# 701 "echo32.c" 1
	movaps  xmm1, [SHA3_S+16]
# 0 "" 2
# 701 "echo32.c" 1
	movaps  xmm2, [SHA3_S+2*16]
# 0 "" 2
# 701 "echo32.c" 1
	movaps  xmm3, [SHA3_S+3*16]
# 0 "" 2
# 701 "echo32.c" 1
	pxor    xmm0, [SHA3_S+4*16]
# 0 "" 2
# 701 "echo32.c" 1
	pxor    xmm1, [SHA3_S+4*16+16]
# 0 "" 2
# 701 "echo32.c" 1
	pxor    xmm2, [SHA3_S+4*16+2*16]
# 0 "" 2
# 701 "echo32.c" 1
	pxor    xmm3, [SHA3_S+4*16+3*16]
# 0 "" 2
# 701 "echo32.c" 1
	pxor    xmm0, [SHA3_S+8*16]
# 0 "" 2
# 701 "echo32.c" 1
	pxor    xmm1, [SHA3_S+8*16+16]
# 0 "" 2
# 701 "echo32.c" 1
	pxor    xmm2, [SHA3_S+8*16+2*16]
# 0 "" 2
# 701 "echo32.c" 1
	pxor    xmm3, [SHA3_S+8*16+3*16]
# 0 "" 2
# 701 "echo32.c" 1
	pxor    xmm0, [SHA3_S+12*16]
# 0 "" 2
# 701 "echo32.c" 1
	pxor    xmm1, [SHA3_S+12*16+16]
# 0 "" 2
# 701 "echo32.c" 1
	pxor    xmm2, [SHA3_S+12*16+2*16]
# 0 "" 2
# 701 "echo32.c" 1
	pxor    xmm3, [SHA3_S+12*16+3*16]
# 0 "" 2
# 701 "echo32.c" 1
	movaps  [OLDCV],	   xmm0
# 0 "" 2
# 701 "echo32.c" 1
	movaps  [OLDCV+16],   xmm1
# 0 "" 2
# 701 "echo32.c" 1
	movaps  [OLDCV+2*16], xmm2
# 0 "" 2
# 701 "echo32.c" 1
	movaps  [OLDCV+3*16], xmm3
# 0 "" 2
# 703 "echo32.c" 1
	xor    ebx,ebx
# 0 "" 2
# 704 "echo32.c" 1
	xor    edx,edx
# 0 "" 2
# 706 "echo32.c" 1
	mov    [SHA3_ESP], esp
# 0 "" 2
# 708 "echo32.c" 1
	LABEL_BIG_ROUND_NO2:
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, [SHA3_S+0]
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, [SHA3_S+0+4]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+0],    edi
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+0+4],  esp
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, [SHA3_S+16]
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, [SHA3_S+16+4]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+16],    edi
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+16+4],  esp
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, [SHA3_S+32]
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, [SHA3_S+32+4]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+32],    edi
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+32+4],  esp
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, [SHA3_S+48]
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, [SHA3_S+48+4]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 709 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 709 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 709 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 709 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 709 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 709 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 709 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 709 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 709 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+48],    edi
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+48+4],  esp
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 709 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, [SHA3_S+64]
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, [SHA3_S+64+4]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+64],    edi
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+64+4],  esp
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, [SHA3_S+80]
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, [SHA3_S+80+4]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+80],    edi
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+80+4],  esp
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, [SHA3_S+96]
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, [SHA3_S+96+4]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+96],    edi
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+96+4],  esp
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, [SHA3_S+112]
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, [SHA3_S+112+4]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 710 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 710 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 710 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 710 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 710 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 710 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 710 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 710 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 710 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+112],    edi
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+112+4],  esp
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 710 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+128]
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+128+4]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+128],    edi
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+128+4],  esp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+144]
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+144+4]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+144],    edi
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+144+4],  esp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+160]
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+160+4]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+160],    edi
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+160+4],  esp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+176]
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+176+4]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 711 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 711 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 711 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 711 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 711 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 711 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 711 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 711 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 711 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+176],    edi
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+176+4],  esp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 711 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+192]
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+192+4]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+192],    edi
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+192+4],  esp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+208]
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+208+4]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+208],    edi
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+208+4],  esp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+224]
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+224+4]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+224],    edi
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+224+4],  esp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+240]
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+240+4]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 712 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 712 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 712 "echo32.c" 1
	ror    ecx, 16
# 0 "" 2
# 712 "echo32.c" 1
	ror    eax, 16
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, cl
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, al
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 712 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 712 "echo32.c" 1
	mov    dl, ch
# 0 "" 2
# 712 "echo32.c" 1
	mov    bl, ah
# 0 "" 2
# 712 "echo32.c" 1
	xor    esi, [Te+8*edx+1]
# 0 "" 2
# 712 "echo32.c" 1
	xor    edi, [Te+8*ebx+1]
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+240],    edi
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+240+4],  esp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 712 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*0]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*5]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 713 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 713 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 713 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 713 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 713 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 713 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 713 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 713 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 713 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0,  [SHA3_S]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S],   xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,     xmm4
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,     xmm5
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,     xmm6
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,     xmm7
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16], xmm1
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*2]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm2,      xmm7
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm2,      xmm5
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*2],  xmm2
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*3]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*3], xmm3
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*9]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 713 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 713 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 713 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 713 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 713 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 713 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 713 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 713 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 713 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*4]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*4], xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*5]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*5], xmm1
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*6]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*6], xmm2
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*7]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*7], xmm3
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*10]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 713 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 713 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 713 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 713 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 713 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 713 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 713 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 713 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 713 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*8]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*8], xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*9]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*9], xmm1
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*10], xmm2
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*11]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm3,      xmm7
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm3,      xmm6
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*11], xmm3
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm1, [SHA3_S+16*13]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm2, [SHA3_S+16*14]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm3, [SHA3_S+16*15]
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm4, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm4, xmm1
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm5, xmm2
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm5, xmm3
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm6, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm6, xmm3
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm7, xmm4
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm7, xmm5
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, xmm4
# 0 "" 2
# 713 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 713 "echo32.c" 1
	psrlw    xmm4, 7
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm4, [MEM_CST+16]
# 0 "" 2
# 713 "echo32.c" 1
	pmullw   xmm4, [MEM_CST+32]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm4, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, xmm5
# 0 "" 2
# 713 "echo32.c" 1
	psllw    xmm0, 1
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 713 "echo32.c" 1
	psrlw    xmm5, 7
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm5, [MEM_CST+16]
# 0 "" 2
# 713 "echo32.c" 1
	pmullw   xmm5, [MEM_CST+32]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm5, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, xmm6
# 0 "" 2
# 713 "echo32.c" 1
	psllq    xmm0, 1
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm0, [MEM_CST]
# 0 "" 2
# 713 "echo32.c" 1
	psrlq    xmm6, 7
# 0 "" 2
# 713 "echo32.c" 1
	pand     xmm6, [MEM_CST+16]
# 0 "" 2
# 713 "echo32.c" 1
	pmullw   xmm6, [MEM_CST+32]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm6, xmm0
# 0 "" 2
# 713 "echo32.c" 1
	movaps   xmm0, [SHA3_S+16*12]
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm0,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm0,  xmm4
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*12], xmm0
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,  xmm4
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,  xmm5
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,  xmm6
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm1,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*13], xmm1
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm2,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm2,  xmm5
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*14], xmm2
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm3,  xmm7
# 0 "" 2
# 713 "echo32.c" 1
	pxor     xmm3,  xmm6
# 0 "" 2
# 713 "echo32.c" 1
	movaps   [SHA3_S+16*15], xmm3
# 0 "" 2
# 714 "echo32.c" 1
	subd [SHA3_R], 1
# 0 "" 2
# 715 "echo32.c" 1
	jne LABEL_BIG_ROUND_NO2
# 0 "" 2
# 717 "echo32.c" 1
	END:
# 0 "" 2
# 722 "echo32.c" 1
	movaps  xmm0, [OLDCV]
# 0 "" 2
# 722 "echo32.c" 1
	movaps  xmm1, [OLDCV+16]
# 0 "" 2
# 722 "echo32.c" 1
	movaps  xmm2, [OLDCV+2*16]
# 0 "" 2
# 722 "echo32.c" 1
	movaps  xmm3, [OLDCV+3*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm0, [SHA3_S]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm1, [SHA3_S+1*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm2, [SHA3_S+2*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm3, [SHA3_S+3*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm0, [SHA3_S+4*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm1, [SHA3_S+5*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm2, [SHA3_S+6*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm3, [SHA3_S+7*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm0, [SHA3_S+8*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm1, [SHA3_S+9*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm2, [SHA3_S+10*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm3, [SHA3_S+11*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm0, [SHA3_S+12*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm1, [SHA3_S+13*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm2, [SHA3_S+14*16]
# 0 "" 2
# 722 "echo32.c" 1
	pxor    xmm3, [SHA3_S+15*16]
# 0 "" 2
# 722 "echo32.c" 1
	movaps  [SHA3_S]     , xmm0
# 0 "" 2
# 722 "echo32.c" 1
	movaps  [SHA3_S+1*16], xmm1
# 0 "" 2
# 722 "echo32.c" 1
	movaps  [SHA3_S+2*16], xmm2
# 0 "" 2
# 722 "echo32.c" 1
	movaps  [SHA3_S+3*16], xmm3
# 0 "" 2
# 725 "echo32.c" 1
	mov    esp, [SHA3_ESP]
# 0 "" 2
# 726 "echo32.c" 1
	popa
# 0 "" 2
# 727 "echo32.c" 1
	.att_syntax noprefix
# 0 "" 2
#NO_APP
	popl	%ebp
	ret
	.size	Compress, .-Compress
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
	je	.L4
	cmpl	%edi, %edx
	je	.L4
	testb	$15, %dl
	leal	16(%edx), %eax
	jne	.L5
	cmpl	$SHA3_S+16, %edx
	jbe	.L24
.L18:
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
.L4:
	cmpl	$512, %esi
	movl	$2, %eax
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
	ja	.L9
	xorl	%eax, %eax
	cmpl	$257, %esi
	setge	%al
	movl	%esi, %ebx
	leal	2(%eax,%eax), %eax
	movl	$SHA3_S, %edx
	movl	%esi, SHA3_S+268
	xorl	%ecx, %ecx
	movl	%eax, SHA3_S+272
	sarl	$31, %esi
	.p2align 4,,7
	.p2align 3
.L12:
	addl	$1, %ecx
	movl	%ebx, (%edx)
	movl	%esi, 4(%edx)
	movl	$0, 8(%edx)
	movl	$0, 12(%edx)
	addl	$16, %edx
	cmpl	%ecx, %eax
	jg	.L12
	movl	%eax, %ecx
	notl	%ecx
	addl	$17, %ecx
	cmpl	$1, %ecx
	jbe	.L14
	testl	%ecx, %ecx
	je	.L14
	sall	$4, %eax
	pxor	%xmm0, %xmm0
	leal	SHA3_S(%eax), %ebx
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L15:
	movl	%eax, %edx
	addl	$1, %eax
	sall	$4, %edx
	cmpl	%eax, %ecx
	movdqa	%xmm0, (%ebx,%edx)
	ja	.L15
.L13:
	movl	$0, SHA3_S+256
	xorl	%eax, %eax
	movl	$0, SHA3_S+260
	movl	$0, SHA3_S+264
.L9:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L14:
	sall	$4, %eax
	addl	$SHA3_S, %eax
	.p2align 4,,7
	.p2align 3
.L16:
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	addl	$16, %eax
	cmpl	$SHA3_S+256, %eax
	jne	.L16
	jmp	.L13
	.p2align 4,,7
	.p2align 3
.L24:
	cmpl	$SHA3_S, %eax
	jb	.L18
	.p2align 4,,7
	.p2align 3
.L5:
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L7:
	movl	SHA3_S(,%eax,8), %ecx
	movl	SHA3_S+4(,%eax,8), %ebx
	movl	%ecx, (%edx,%eax,8)
	movl	%ebx, 4(%edx,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L7
	jmp	.L4
	.size	Init, .-Init
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
	je	.L26
	testb	$15, %dl
	leal	16(%edx), %eax
	jne	.L27
	cmpl	$SHA3_S+16, %edx
	jbe	.L101
.L70:
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
.L29:
	leal	16(%ecx), %eax
	cmpl	$SHA3_S, %eax
	jae	.L102
.L71:
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
.L33:
	movl	%ecx, SHA3_S+276
.L26:
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
	jle	.L103
.L35:
	movl	-72(%ebp), %ecx
	movl	$256, -64(%ebp)
	subl	%ecx, -64(%ebp)
	.p2align 4,,7
	.p2align 3
.L95:
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
	jl	.L38
	jg	.L73
	movl	-40(%ebp), %edi
	cmpl	%edi, %eax
	jbe	.L38
.L73:
	movl	-36(%ebp), %edx
	movl	-40(%ebp), %eax
	shrdl	$3, %edx, %eax
	sarl	$3, %edx
	cmpl	$0, %edx
	movl	%eax, -24(%ebp)
	movl	%edx, -20(%ebp)
	jle	.L104
.L40:
	movl	-56(%ebp), %ecx
	xorl	%eax, %eax
	xorl	%esi, %esi
	movl	-32(%ebp), %edx
	leal	(%ecx,%edx), %edi
	.p2align 4,,7
	.p2align 3
.L96:
	movl	(%ebx,%eax,8), %edx
	movl	4(%ebx,%eax,8), %ecx
	movl	%edx, (%edi,%eax,8)
	movl	%ecx, 4(%edi,%eax,8)
	addl	$1, %eax
	cmpl	-20(%ebp), %esi
	jl	.L96
	jle	.L105
.L42:
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
	jg	.L61
	jl	.L78
	cmpl	%esi, %ecx
	jae	.L61
.L78:
	movl	-32(%ebp), %eax
	leal	(%ebx,%ecx), %edx
	movl	%ebx, -24(%ebp)
	addl	%ecx, %eax
	addl	-56(%ebp), %eax
	.p2align 4,,7
	.p2align 3
.L97:
	movzbl	(%edx), %ebx
	addl	$1, %ecx
	addl	$1, %edx
	movb	%bl, (%eax)
	xorl	%ebx, %ebx
	addl	$1, %eax
	cmpl	%edi, %ebx
	jl	.L97
	jg	.L99
	cmpl	%esi, %ecx
	jb	.L97
.L99:
	movl	-24(%ebp), %ebx
.L61:
	movl	-40(%ebp), %edi
	addl	%edi, -32(%ebp)
	addl	%edi, %ebx
.L100:
	movl	-32(%ebp), %eax
	sall	$3, %eax
.L37:
	movl	-88(%ebp), %ecx
	movl	%eax, SHA3_S+264
	andl	$7, %ecx
	je	.L65
	addl	%ecx, %eax
	movl	$7, %edx
	movl	%eax, SHA3_S+264
	subl	%ecx, %edx
	xorl	%eax, %eax
	movl	$7, %ecx
	movl	$1, %edi
	.p2align 4,,7
	.p2align 3
.L68:
	movl	%edi, %esi
	sall	%cl, %esi
	subl	$1, %ecx
	orl	%esi, %eax
	cmpl	%edx, %ecx
	jne	.L68
	movl	-32(%ebp), %edx
	movl	-72(%ebp), %ecx
	andb	(%ebx), %al
	movb	%al, SHA3_S(%ecx,%edx)
.L65:
	addl	$76, %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L105:
	cmpl	-24(%ebp), %eax
	jb	.L96
	jmp	.L42
	.p2align 4,,7
	.p2align 3
.L38:
	movl	-24(%ebp), %esi
	movl	-24(%ebp), %edx
	addl	$7, %esi
	testl	%edx, %edx
	cmovns	-24(%ebp), %esi
	sarl	$3, %esi
	testl	%esi, %esi
	je	.L43
	movl	-56(%ebp), %edi
	addl	-32(%ebp), %edi
	cmpl	$21, %esi
	jbe	.L44
	testl	$15, %edi
	jne	.L44
	leal	16(%ebx), %eax
	cmpl	%eax, %edi
	jbe	.L106
.L75:
	movl	%esi, %edx
	shrl	%edx
	movl	%edx, %eax
	addl	%eax, %eax
	movl	%edx, -28(%ebp)
	je	.L46
	movl	%eax, -52(%ebp)
	movl	-28(%ebp), %eax
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	.p2align 4,,7
	.p2align 3
.L47:
	addl	$1, %ecx
	movdqu	(%ebx,%edx), %xmm0
	movdqa	%xmm0, (%edi,%edx)
	addl	$16, %edx
	cmpl	%eax, %ecx
	jb	.L47
	movl	-52(%ebp), %eax
	cmpl	%eax, %esi
	je	.L43
.L46:
	leal	0(,%eax,8), %edx
	movl	%esi, %edi
	leal	(%ebx,%edx), %ecx
	addl	-32(%ebp), %edx
	addl	-56(%ebp), %edx
	movl	%ebx, -28(%ebp)
	.p2align 4,,7
	.p2align 3
.L48:
	movl	(%ecx), %ebx
	addl	$1, %eax
	movl	4(%ecx), %esi
	addl	$8, %ecx
	movl	%ebx, (%edx)
	movl	%esi, 4(%edx)
	addl	$8, %edx
	cmpl	%eax, %edi
	ja	.L48
	movl	-28(%ebp), %ebx
	movl	%edi, %esi
.L43:
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
	jae	.L50
	movl	%ecx, %edi
	movl	-32(%ebp), %edx
	subl	%esi, %edi
	movl	%edi, -52(%ebp)
	leal	(%ebx,%eax), %edi
	addl	-72(%ebp), %edx
	cmpl	$15, -52(%ebp)
	leal	SHA3_S(%esi,%edx), %esi
	jbe	.L51
	testl	$15, %esi
	jne	.L51
	leal	16(%edi), %edx
	cmpl	%edx, %esi
	jbe	.L107
.L76:
	movl	-52(%ebp), %edx
	shrl	$4, %edx
	movl	%edx, -68(%ebp)
	sall	$4, %edx
	testl	%edx, %edx
	movl	%edx, -60(%ebp)
	je	.L53
	movl	%ecx, -76(%ebp)
	movl	-68(%ebp), %ecx
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,7
	.p2align 3
.L54:
	addl	$1, %edx
	movdqu	(%edi,%eax), %xmm0
	movdqa	%xmm0, (%esi,%eax)
	addl	$16, %eax
	cmpl	%ecx, %edx
	jb	.L54
	movl	-28(%ebp), %eax
	movl	-60(%ebp), %edi
	addl	-60(%ebp), %eax
	cmpl	%edi, -52(%ebp)
	movl	-76(%ebp), %ecx
	je	.L50
.L53:
	movl	-32(%ebp), %edx
	leal	(%ebx,%eax), %esi
	movl	%ecx, %edi
	addl	%eax, %edx
	addl	-56(%ebp), %edx
	.p2align 4,,7
	.p2align 3
.L55:
	movzbl	(%esi), %ecx
	addl	$1, %eax
	addl	$1, %esi
	movb	%cl, (%edx)
	addl	$1, %edx
	cmpl	%eax, %edi
	ja	.L55
.L50:
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
	jg	.L95
	jl	.L77
	cmpl	$0, -40(%ebp)
	ja	.L95
.L77:
	xorl	%eax, %eax
	movl	$0, -32(%ebp)
	.p2align 4,,5
	jmp	.L37
	.p2align 4,,7
	.p2align 3
.L104:
	.p2align 4,,5
	jl	.L42
	cmpl	$0, %eax
	.p2align 4,,5
	ja	.L40
	.p2align 4,,9
	.p2align 3
	jmp	.L42
	.p2align 4,,7
	.p2align 3
.L107:
	leal	16(%esi), %edx
	cmpl	%edx, %edi
	.p2align 4,,5
	ja	.L76
	.p2align 4,,7
	.p2align 3
.L51:
	movl	-28(%ebp), %edx
	movl	%ecx, %esi
	addl	-32(%ebp), %edx
	addl	-56(%ebp), %edx
	.p2align 4,,7
	.p2align 3
.L56:
	movzbl	(%edi), %ecx
	addl	$1, %eax
	addl	$1, %edi
	movb	%cl, (%edx)
	addl	$1, %edx
	cmpl	%eax, %esi
	ja	.L56
	jmp	.L50
	.p2align 4,,7
	.p2align 3
.L106:
	leal	16(%edi), %eax
	cmpl	%eax, %ebx
	ja	.L75
	.p2align 4,,7
	.p2align 3
.L44:
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L49:
	movl	(%ebx,%eax,8), %edx
	movl	4(%ebx,%eax,8), %ecx
	movl	%edx, (%edi,%eax,8)
	movl	%ecx, 4(%edi,%eax,8)
	addl	$1, %eax
	cmpl	%eax, %esi
	ja	.L49
	jmp	.L43
.L103:
	jl	.L100
	cmpl	$0, %eax
	.p2align 4,,9
	.p2align 3
	ja	.L35
	.p2align 4,,9
	.p2align 3
	jmp	.L100
.L102:
	cmpl	$SHA3_S+16, %ecx
	.p2align 4,,4
	ja	.L71
	xorl	%eax, %eax
	movl	%ecx, %esi
	.p2align 4,,7
	.p2align 3
.L34:
	movl	(%esi,%eax,8), %edx
	movl	4(%esi,%eax,8), %ecx
	movl	%edx, SHA3_S(,%eax,8)
	movl	%ecx, SHA3_S+4(,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L34
	movl	%esi, %ecx
	jmp	.L33
.L101:
	cmpl	$SHA3_S, %eax
	jb	.L70
.L27:
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L30:
	movl	SHA3_S(,%eax,8), %esi
	movl	SHA3_S+4(,%eax,8), %edi
	movl	%esi, (%edx,%eax,8)
	movl	%edi, 4(%edx,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L30
	jmp	.L29
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
	je	.L109
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
.L109:
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
	jg	.L110
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
	jle	.L111
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
.L112:
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
	jmp	.L114
	.p2align 4,,7
	.p2align 3
.L110:
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
.L111:
	movl	SHA3_S+264, %edx
	movl	SHA3_S+272, %edi
	movl	%edx, %ecx
	sall	$4, %edi
	sarl	$31, %ecx
	addl	$SHA3_S, %edi
	addl	SHA3_S+256, %edx
	adcl	SHA3_S+260, %ecx
	testl	%eax, %eax
	je	.L112
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
.L114:
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
	je	.L115
	movl	12(%ebp), %edx
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L116:
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
	ja	.L116
.L115:
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
	.type	T.43, @function
T.43:
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
	movdqa	%xmm0, SHA3_S+80
	movdqa	%xmm0, SHA3_S+96
	movdqa	%xmm0, SHA3_S+112
	movdqa	%xmm0, SHA3_S+128
	movdqa	%xmm0, SHA3_S+144
	movdqa	%xmm0, SHA3_S+160
	movdqa	%xmm0, SHA3_S+176
	movdqa	%xmm0, SHA3_S+192
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
	movl	$512, SHA3_S+268
	movl	$4, SHA3_S+272
	movdqa	%xmm0, SHA3_S+208
	movdqa	%xmm0, SHA3_S+224
	movl	%esi, 8(%esp)
	movdqa	%xmm0, SHA3_S+240
	movl	%edi, 12(%esp)
	movl	-316(%ebp), %edi
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
	.size	T.43, .-T.43
	.p2align 4,,15
.globl crypto_hash_echosp512_core2_core2
	.type	crypto_hash_echosp512_core2_core2, @function
crypto_hash_echosp512_core2_core2:
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
	call	T.43
	leave
	cmpl	$1, %eax
	sbbl	%eax, %eax
	notl	%eax
	ret
	.size	crypto_hash_echosp512_core2_core2, .-crypto_hash_echosp512_core2_core2
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
	cmpl	$512, 8(%ebp)
	movl	%ebx, SHA3_S+276
	ja	.L142
	movl	8(%ebp), %edi
	xorl	%ecx, %ecx
	movl	$SHA3_S, %eax
	cmpl	$257, %edi
	movl	%edi, %edx
	setge	%cl
	movl	%edi, %esi
	sarl	$31, %edx
	leal	2(%ecx,%ecx), %ecx
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
.globl Te
	.data
	.align 32
	.type	Te, @object
	.size	Te, 2048
Te:
	.long	-1520213050
	.long	-1520213050
	.long	-2072216328
	.long	-2072216328
	.long	-1720223762
	.long	-1720223762
	.long	-1921287178
	.long	-1921287178
	.long	234025727
	.long	234025727
	.long	-1117033514
	.long	-1117033514
	.long	-1318096930
	.long	-1318096930
	.long	1422247313
	.long	1422247313
	.long	1345335392
	.long	1345335392
	.long	50397442
	.long	50397442
	.long	-1452841010
	.long	-1452841010
	.long	2099981142
	.long	2099981142
	.long	436141799
	.long	436141799
	.long	1658312629
	.long	1658312629
	.long	-424957107
	.long	-424957107
	.long	-1703512340
	.long	-1703512340
	.long	1170918031
	.long	1170918031
	.long	-1652391393
	.long	-1652391393
	.long	1086966153
	.long	1086966153
	.long	-2021818886
	.long	-2021818886
	.long	368769775
	.long	368769775
	.long	-346465870
	.long	-346465870
	.long	-918075506
	.long	-918075506
	.long	200339707
	.long	200339707
	.long	-324162239
	.long	-324162239
	.long	1742001331
	.long	1742001331
	.long	-39673249
	.long	-39673249
	.long	-357585083
	.long	-357585083
	.long	-1080255453
	.long	-1080255453
	.long	-140204973
	.long	-140204973
	.long	-1770884380
	.long	-1770884380
	.long	1539358875
	.long	1539358875
	.long	-1028147339
	.long	-1028147339
	.long	486407649
	.long	486407649
	.long	-1366060227
	.long	-1366060227
	.long	1780885068
	.long	1780885068
	.long	1513502316
	.long	1513502316
	.long	1094664062
	.long	1094664062
	.long	49805301
	.long	49805301
	.long	1338821763
	.long	1338821763
	.long	1546925160
	.long	1546925160
	.long	-190470831
	.long	-190470831
	.long	887481809
	.long	887481809
	.long	150073849
	.long	150073849
	.long	-1821281822
	.long	-1821281822
	.long	1943591083
	.long	1943591083
	.long	1395732834
	.long	1395732834
	.long	1058346282
	.long	1058346282
	.long	201589768
	.long	201589768
	.long	1388824469
	.long	1388824469
	.long	1696801606
	.long	1696801606
	.long	1589887901
	.long	1589887901
	.long	672667696
	.long	672667696
	.long	-1583966665
	.long	-1583966665
	.long	251987210
	.long	251987210
	.long	-1248159185
	.long	-1248159185
	.long	151455502
	.long	151455502
	.long	907153956
	.long	907153956
	.long	-1686077413
	.long	-1686077413
	.long	1038279391
	.long	1038279391
	.long	652995533
	.long	652995533
	.long	1764173646
	.long	1764173646
	.long	-843926913
	.long	-843926913
	.long	-1619692054
	.long	-1619692054
	.long	453576978
	.long	453576978
	.long	-1635548387
	.long	-1635548387
	.long	1949051992
	.long	1949051992
	.long	773462580
	.long	773462580
	.long	756751158
	.long	756751158
	.long	-1301385508
	.long	-1301385508
	.long	-296068428
	.long	-296068428
	.long	-73359269
	.long	-73359269
	.long	-162377052
	.long	-162377052
	.long	1295727478
	.long	1295727478
	.long	1641469623
	.long	1641469623
	.long	-827083907
	.long	-827083907
	.long	2066295122
	.long	2066295122
	.long	1055122397
	.long	1055122397
	.long	1898917726
	.long	1898917726
	.long	-1752923117
	.long	-1752923117
	.long	-179088474
	.long	-179088474
	.long	1758581177
	.long	1758581177
	.long	0
	.long	0
	.long	753790401
	.long	753790401
	.long	1612718144
	.long	1612718144
	.long	536673507
	.long	536673507
	.long	-927878791
	.long	-927878791
	.long	-312779850
	.long	-312779850
	.long	-1100322092
	.long	-1100322092
	.long	1187761037
	.long	1187761037
	.long	-641810841
	.long	-641810841
	.long	1262041458
	.long	1262041458
	.long	-565556588
	.long	-565556588
	.long	-733197160
	.long	-733197160
	.long	-396863312
	.long	-396863312
	.long	1255133061
	.long	1255133061
	.long	1808847035
	.long	1808847035
	.long	720367557
	.long	720367557
	.long	-441800113
	.long	-441800113
	.long	385612781
	.long	385612781
	.long	-985447546
	.long	-985447546
	.long	-682799718
	.long	-682799718
	.long	1429418854
	.long	1429418854
	.long	-1803188975
	.long	-1803188975
	.long	-817543798
	.long	-817543798
	.long	284817897
	.long	284817897
	.long	100794884
	.long	100794884
	.long	-2122350594
	.long	-2122350594
	.long	-263171936
	.long	-263171936
	.long	1144798328
	.long	1144798328
	.long	-1163944155
	.long	-1163944155
	.long	-475486133
	.long	-475486133
	.long	-212774494
	.long	-212774494
	.long	-22830243
	.long	-22830243
	.long	-1069531008
	.long	-1069531008
	.long	-1970303227
	.long	-1970303227
	.long	-1382903233
	.long	-1382903233
	.long	-1130521311
	.long	-1130521311
	.long	1211644016
	.long	1211644016
	.long	83228145
	.long	83228145
	.long	-541279133
	.long	-541279133
	.long	-1044990345
	.long	-1044990345
	.long	1977277103
	.long	1977277103
	.long	1663115586
	.long	1663115586
	.long	806359072
	.long	806359072
	.long	452984805
	.long	452984805
	.long	250868733
	.long	250868733
	.long	1842533055
	.long	1842533055
	.long	1288555905
	.long	1288555905
	.long	336333848
	.long	336333848
	.long	890442534
	.long	890442534
	.long	804056259
	.long	804056259
	.long	-513843266
	.long	-513843266
	.long	-1567123659
	.long	-1567123659
	.long	-867941240
	.long	-867941240
	.long	957814574
	.long	957814574
	.long	1472513171
	.long	1472513171
	.long	-223893675
	.long	-223893675
	.long	-2105639172
	.long	-2105639172
	.long	1195195770
	.long	1195195770
	.long	-1402706744
	.long	-1402706744
	.long	-413311558
	.long	-413311558
	.long	723065138
	.long	723065138
	.long	-1787595802
	.long	-1787595802
	.long	-1604296512
	.long	-1604296512
	.long	-1736343271
	.long	-1736343271
	.long	-783331426
	.long	-783331426
	.long	2145180835
	.long	2145180835
	.long	1713513028
	.long	1713513028
	.long	2116692564
	.long	2116692564
	.long	-1416589253
	.long	-1416589253
	.long	-2088204277
	.long	-2088204277
	.long	-901364084
	.long	-901364084
	.long	703524551
	.long	703524551
	.long	-742868885
	.long	-742868885
	.long	1007948840
	.long	1007948840
	.long	2044649127
	.long	2044649127
	.long	-497131844
	.long	-497131844
	.long	487262998
	.long	487262998
	.long	1994120109
	.long	1994120109
	.long	1004593371
	.long	1004593371
	.long	1446130276
	.long	1446130276
	.long	1312438900
	.long	1312438900
	.long	503974420
	.long	503974420
	.long	-615954030
	.long	-615954030
	.long	168166924
	.long	168166924
	.long	1814307912
	.long	1814307912
	.long	-463709000
	.long	-463709000
	.long	1573044895
	.long	1573044895
	.long	1859376061
	.long	1859376061
	.long	-273896381
	.long	-273896381
	.long	-1503501628
	.long	-1503501628
	.long	-1466855111
	.long	-1466855111
	.long	-1533700815
	.long	-1533700815
	.long	937747667
	.long	937747667
	.long	-1954973198
	.long	-1954973198
	.long	854058965
	.long	854058965
	.long	1137232011
	.long	1137232011
	.long	1496790894
	.long	1496790894
	.long	-1217565222
	.long	-1217565222
	.long	-1936880383
	.long	-1936880383
	.long	1691735473
	.long	1691735473
	.long	-766620004
	.long	-766620004
	.long	-525751991
	.long	-525751991
	.long	-1267962664
	.long	-1267962664
	.long	-95005012
	.long	-95005012
	.long	133494003
	.long	133494003
	.long	636152527
	.long	636152527
	.long	-1352309302
	.long	-1352309302
	.long	-1904575756
	.long	-1904575756
	.long	-374428089
	.long	-374428089
	.long	403179536
	.long	403179536
	.long	-709182865
	.long	-709182865
	.long	-2005370640
	.long	-2005370640
	.long	1864705354
	.long	1864705354
	.long	1915629148
	.long	1915629148
	.long	605822008
	.long	605822008
	.long	-240736681
	.long	-240736681
	.long	-944458637
	.long	-944458637
	.long	1371981463
	.long	1371981463
	.long	602466507
	.long	602466507
	.long	2094914977
	.long	2094914977
	.long	-1670089496
	.long	-1670089496
	.long	555687742
	.long	555687742
	.long	-582268010
	.long	-582268010
	.long	-591544991
	.long	-591544991
	.long	-2037675251
	.long	-2037675251
	.long	-2054518257
	.long	-2054518257
	.long	-1871679264
	.long	-1871679264
	.long	1111375484
	.long	1111375484
	.long	-994724495
	.long	-994724495
	.long	-1436129588
	.long	-1436129588
	.long	-666351472
	.long	-666351472
	.long	84083462
	.long	84083462
	.long	32962295
	.long	32962295
	.long	302911004
	.long	302911004
	.long	-1553899070
	.long	-1553899070
	.long	1597322602
	.long	1597322602
	.long	-111716434
	.long	-111716434
	.long	-793134743
	.long	-793134743
	.long	-1853454825
	.long	-1853454825
	.long	1489093017
	.long	1489093017
	.long	656219450
	.long	656219450
	.long	-1180787161
	.long	-1180787161
	.long	954327513
	.long	954327513
	.long	335083755
	.long	335083755
	.long	-1281845205
	.long	-1281845205
	.long	856756514
	.long	856756514
	.long	-1150719534
	.long	-1150719534
	.long	1893325225
	.long	1893325225
	.long	-1987146233
	.long	-1987146233
	.long	-1483434957
	.long	-1483434957
	.long	-1231316179
	.long	-1231316179
	.long	572399164
	.long	572399164
	.long	-1836611819
	.long	-1836611819
	.long	552200649
	.long	552200649
	.long	1238290055
	.long	1238290055
	.long	-11184726
	.long	-11184726
	.long	2015897680
	.long	2015897680
	.long	2061492133
	.long	2061492133
	.long	-1886614525
	.long	-1886614525
	.long	-123625127
	.long	-123625127
	.long	-2138470135
	.long	-2138470135
	.long	386731290
	.long	386731290
	.long	-624967835
	.long	-624967835
	.long	837215959
	.long	837215959
	.long	-968736124
	.long	-968736124
	.long	-1201116976
	.long	-1201116976
	.long	-1019133566
	.long	-1019133566
	.long	-1332111063
	.long	-1332111063
	.long	1999449434
	.long	1999449434
	.long	286199582
	.long	286199582
	.long	-877612933
	.long	-877612933
	.long	-61582168
	.long	-61582168
	.long	-692339859
	.long	-692339859
	.long	974525996
	.long	974525996
	.comm	OLDCV,128,32
	.comm	MEM_CST,64,32
	.comm	SHA3_CNT,8,8
	.comm	SHA3_ESP,4,4
	.comm	SHA3_R,4,4
	.comm	SHA3_S,280,32
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	512
	.long	0
	.long	0
	.long	0
	.ident	"GCC: (Debian 4.4.3-7) 4.4.3"
	.section	.note.GNU-stack,"",@progbits
