#------------------------------------------------------------------------------------ #
# Implementation of the simple pipe ECHO hash function in its 512-bit outputs variant.#
# Optimized for Pentium MMX, PII, PIII, amd K7                                        #
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
# 715 "echo32.c" 1
	.intel_syntax noprefix
# 0 "" 2
# 716 "echo32.c" 1
	pusha
# 0 "" 2
# 721 "echo32.c" 1
	mov    dword ptr [SHA3_R], 10
# 0 "" 2
# 723 "echo32.c" 1
	mov    eax, dword ptr [SHA3_S+264]
# 0 "" 2
# 724 "echo32.c" 1
	mov    ecx, dword ptr [SHA3_S+264]
# 0 "" 2
# 725 "echo32.c" 1
	mov    edx, eax
# 0 "" 2
# 726 "echo32.c" 1
	sar    edx, 31
# 0 "" 2
# 727 "echo32.c" 1
	add    eax, dword ptr [SHA3_S+256]
# 0 "" 2
# 728 "echo32.c" 1
	adc    edx, dword ptr [SHA3_S+260]
# 0 "" 2
# 729 "echo32.c" 1
	mov    dword ptr [SHA3_CNT],   0
# 0 "" 2
# 730 "echo32.c" 1
	mov    dword ptr [SHA3_CNT+4], 0
# 0 "" 2
# 731 "echo32.c" 1
	test   ecx, ecx
# 0 "" 2
# 732 "echo32.c" 1
	mov    dword ptr [SHA3_S+256], eax
# 0 "" 2
# 733 "echo32.c" 1
	mov    dword ptr [SHA3_S+260], edx
# 0 "" 2
# 734 "echo32.c" 1
	je     L2
# 0 "" 2
# 735 "echo32.c" 1
	mov    dword ptr [SHA3_CNT],   eax
# 0 "" 2
# 736 "echo32.c" 1
	mov    dword ptr [SHA3_CNT+4], edx
# 0 "" 2
# 737 "echo32.c" 1
	L2:
# 0 "" 2
# 738 "echo32.c" 1
	mov    edx, dword ptr [SHA3_CNT+4]
# 0 "" 2
# 739 "echo32.c" 1
	mov    dword ptr [SHA3_S+264], 0
# 0 "" 2
# 740 "echo32.c" 1
	mov    eax, dword ptr [SHA3_CNT]
# 0 "" 2
# 741 "echo32.c" 1
	cmp    edx, 0
# 0 "" 2
# 742 "echo32.c" 1
	ja     OVERFLOW
# 0 "" 2
# 747 "echo32.c" 1
	cmp    eax, -162
# 0 "" 2
# 749 "echo32.c" 1
	ja     OVERFLOW
# 0 "" 2
# 752 "echo32.c" 1
	NO_OVERFLOW1:
# 0 "" 2
# 757 "echo32.c" 1
	movq  mm0, [SHA3_S]
# 0 "" 2
# 757 "echo32.c" 1
	movq  mm1, [SHA3_S+8]
# 0 "" 2
# 757 "echo32.c" 1
	movq  mm2, [SHA3_S+16]
# 0 "" 2
# 757 "echo32.c" 1
	movq  mm3, [SHA3_S+16+8]
# 0 "" 2
# 757 "echo32.c" 1
	movq  mm4, [SHA3_S+2*16]
# 0 "" 2
# 757 "echo32.c" 1
	movq  mm5, [SHA3_S+2*16+8]
# 0 "" 2
# 757 "echo32.c" 1
	movq  mm6, [SHA3_S+3*16]
# 0 "" 2
# 757 "echo32.c" 1
	movq  mm7, [SHA3_S+3*16+8]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm0, [SHA3_S+4*16]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm1, [SHA3_S+4*16+8]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm2, [SHA3_S+4*16+16]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm3, [SHA3_S+4*16+16+8]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm4, [SHA3_S+4*16+2*16]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm5, [SHA3_S+4*16+2*16+8]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm6, [SHA3_S+4*16+3*16]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm7, [SHA3_S+4*16+3*16+8]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm0, [SHA3_S+8*16]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm1, [SHA3_S+8*16+8]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm2, [SHA3_S+8*16+16]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm3, [SHA3_S+8*16+16+8]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm4, [SHA3_S+8*16+2*16]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm5, [SHA3_S+8*16+2*16+8]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm6, [SHA3_S+8*16+3*16]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm7, [SHA3_S+8*16+3*16+8]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm0, [SHA3_S+12*16]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm1, [SHA3_S+12*16+8]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm2, [SHA3_S+12*16+16]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm3, [SHA3_S+12*16+16+8]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm4, [SHA3_S+12*16+2*16]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm5, [SHA3_S+12*16+2*16+8]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm6, [SHA3_S+12*16+3*16]
# 0 "" 2
# 757 "echo32.c" 1
	pxor  mm7, [SHA3_S+12*16+3*16+8]
# 0 "" 2
# 757 "echo32.c" 1
	movq  [OLDCV],        mm0
# 0 "" 2
# 757 "echo32.c" 1
	movq  [OLDCV+8],      mm1
# 0 "" 2
# 757 "echo32.c" 1
	movq  [OLDCV+16],     mm2
# 0 "" 2
# 757 "echo32.c" 1
	movq  [OLDCV+16+8],   mm3
# 0 "" 2
# 757 "echo32.c" 1
	movq  [OLDCV+2*16],   mm4
# 0 "" 2
# 757 "echo32.c" 1
	movq  [OLDCV+2*16+8], mm5
# 0 "" 2
# 757 "echo32.c" 1
	movq  [OLDCV+3*16],   mm6
# 0 "" 2
# 757 "echo32.c" 1
	movq  [OLDCV+3*16+8], mm7
# 0 "" 2
# 759 "echo32.c" 1
	xor    ebx,ebx
# 0 "" 2
# 760 "echo32.c" 1
	xor    edx,edx
# 0 "" 2
# 762 "echo32.c" 1
	mov    [SHA3_ESP], esp
# 0 "" 2
# 764 "echo32.c" 1
	LABEL_BIG_ROUND_NO1:
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, [SHA3_S+0]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, [SHA3_S+0+4]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+0],    edi
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+0+4],  esp
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, [SHA3_S+16]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, [SHA3_S+16+4]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+16],    edi
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+16+4],  esp
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, [SHA3_S+32]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, [SHA3_S+32+4]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+32],    edi
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+32+4],  esp
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, [SHA3_S+48]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, [SHA3_S+48+4]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 765 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 765 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 765 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 765 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 765 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 765 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+48],    edi
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+48+4],  esp
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 765 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, [SHA3_S+64]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, [SHA3_S+64+4]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+64],    edi
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+64+4],  esp
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, [SHA3_S+80]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, [SHA3_S+80+4]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+80],    edi
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+80+4],  esp
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, [SHA3_S+96]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, [SHA3_S+96+4]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+96],    edi
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+96+4],  esp
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, [SHA3_S+112]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, [SHA3_S+112+4]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 766 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 766 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 766 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 766 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 766 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 766 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+112],    edi
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+112+4],  esp
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 766 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, [SHA3_S+128]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, [SHA3_S+128+4]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+128],    edi
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+128+4],  esp
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, [SHA3_S+144]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, [SHA3_S+144+4]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+144],    edi
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+144+4],  esp
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, [SHA3_S+160]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, [SHA3_S+160+4]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+160],    edi
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+160+4],  esp
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, [SHA3_S+176]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, [SHA3_S+176+4]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 767 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 767 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 767 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 767 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 767 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 767 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+176],    edi
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+176+4],  esp
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 767 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, [SHA3_S+192]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, [SHA3_S+192+4]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+192],    edi
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+192+4],  esp
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, [SHA3_S+208]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, [SHA3_S+208+4]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+208],    edi
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+208+4],  esp
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, [SHA3_S+224]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, [SHA3_S+224+4]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+224],    edi
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+224+4],  esp
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, [SHA3_S+240]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, [SHA3_S+240+4]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 768 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 768 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 768 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 768 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 768 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 768 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+240],    edi
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+240+4],  esp
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 768 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm0, [SHA3_S+16*9]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm1, [SHA3_S+16*9+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm2, [SHA3_S+16*13]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm3, [SHA3_S+16*13+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*13],   mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*13+8], mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*9],   mm2
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*9+8], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm0, [SHA3_S+16*5]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm1, [SHA3_S+16*5+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm2, [SHA3_S+16*13]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm3, [SHA3_S+16*13+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*13],   mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*13+8], mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*5],   mm2
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*5+8], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm0, [SHA3_S+16*1]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm1, [SHA3_S+16*1+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm2, [SHA3_S+16*13]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm3, [SHA3_S+16*13+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*13],   mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*13+8], mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*1],   mm2
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*1+8], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm0, [SHA3_S+16*2]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm1, [SHA3_S+16*2+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm2, [SHA3_S+16*10]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm3, [SHA3_S+16*10+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*10],   mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*10+8], mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*2],   mm2
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*2+8], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm0, [SHA3_S+16*6]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm1, [SHA3_S+16*6+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm2, [SHA3_S+16*14]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm3, [SHA3_S+16*14+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*14],   mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*14+8], mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*6],   mm2
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*6+8], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm0, [SHA3_S+16*3]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm1, [SHA3_S+16*3+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm2, [SHA3_S+16*15]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm3, [SHA3_S+16*15+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*15],   mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*15+8], mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*3],   mm2
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*3+8], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm0, [SHA3_S+16*7]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm1, [SHA3_S+16*7+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm2, [SHA3_S+16*15]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm3, [SHA3_S+16*15+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*15],   mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*15+8], mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*7],   mm2
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*7+8], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm0, [SHA3_S+16*11]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm1, [SHA3_S+16*11+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm2, [SHA3_S+16*15]
# 0 "" 2
# 769 "echo32.c" 1
	movq  mm3, [SHA3_S+16*15+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*15],   mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*15+8], mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*11],   mm2
# 0 "" 2
# 769 "echo32.c" 1
	movq  [SHA3_S+16*11+8], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, [SHA3_S+0*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm1, [SHA3_S+1*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm2, [SHA3_S+2*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm3, [SHA3_S+3*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 769 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0,  [SHA3_S+0*16]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+0*16], mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+1*16], mm1
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+2*16], mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+3*16], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, [SHA3_S+0*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm1, [SHA3_S+1*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm2, [SHA3_S+2*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm3, [SHA3_S+3*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 769 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0,  [SHA3_S+0*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+0*16+8], mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+1*16+8], mm1
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+2*16+8], mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+3*16+8], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, [SHA3_S+4*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm1, [SHA3_S+5*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm2, [SHA3_S+6*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm3, [SHA3_S+7*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 769 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0,  [SHA3_S+4*16]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+4*16], mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+5*16], mm1
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+6*16], mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+7*16], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, [SHA3_S+4*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm1, [SHA3_S+5*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm2, [SHA3_S+6*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm3, [SHA3_S+7*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 769 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0,  [SHA3_S+4*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+4*16+8], mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+5*16+8], mm1
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+6*16+8], mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+7*16+8], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, [SHA3_S+8*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm1, [SHA3_S+9*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm2, [SHA3_S+10*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm3, [SHA3_S+11*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 769 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0,  [SHA3_S+8*16]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+8*16], mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+9*16], mm1
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+10*16], mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+11*16], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, [SHA3_S+8*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm1, [SHA3_S+9*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm2, [SHA3_S+10*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm3, [SHA3_S+11*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 769 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0,  [SHA3_S+8*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+8*16+8], mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+9*16+8], mm1
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+10*16+8], mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+11*16+8], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, [SHA3_S+12*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm1, [SHA3_S+13*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm2, [SHA3_S+14*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm3, [SHA3_S+15*16]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 769 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0,  [SHA3_S+12*16]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+12*16], mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+13*16], mm1
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+14*16], mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+15*16], mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, [SHA3_S+12*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm1, [SHA3_S+13*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm2, [SHA3_S+14*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm3, [SHA3_S+15*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 769 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 769 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 769 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 769 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 769 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 769 "echo32.c" 1
	movq   mm0,  [SHA3_S+12*16+8]
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+12*16+8], mm0
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+13*16+8], mm1
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+14*16+8], mm2
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 769 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 769 "echo32.c" 1
	movq   [SHA3_S+15*16+8], mm3
# 0 "" 2
# 770 "echo32.c" 1
	subd [SHA3_R], 1
# 0 "" 2
# 771 "echo32.c" 1
	jne LABEL_BIG_ROUND_NO1
# 0 "" 2
# 772 "echo32.c" 1
	jmp END
# 0 "" 2
# 774 "echo32.c" 1
	OVERFLOW:
# 0 "" 2
# 775 "echo32.c" 1
	mov    ecx, eax
# 0 "" 2
# 776 "echo32.c" 1
	mov    ebx, edx
# 0 "" 2
# 781 "echo32.c" 1
	add    ecx, 160
# 0 "" 2
# 783 "echo32.c" 1
	adc    ebx, 0
# 0 "" 2
# 784 "echo32.c" 1
	cmp    ebx, edx
# 0 "" 2
# 785 "echo32.c" 1
	je     NO_OVERFLOW2
# 0 "" 2
# 790 "echo32.c" 1
	movq  mm0, [SHA3_S]
# 0 "" 2
# 790 "echo32.c" 1
	movq  mm1, [SHA3_S+8]
# 0 "" 2
# 790 "echo32.c" 1
	movq  mm2, [SHA3_S+16]
# 0 "" 2
# 790 "echo32.c" 1
	movq  mm3, [SHA3_S+16+8]
# 0 "" 2
# 790 "echo32.c" 1
	movq  mm4, [SHA3_S+2*16]
# 0 "" 2
# 790 "echo32.c" 1
	movq  mm5, [SHA3_S+2*16+8]
# 0 "" 2
# 790 "echo32.c" 1
	movq  mm6, [SHA3_S+3*16]
# 0 "" 2
# 790 "echo32.c" 1
	movq  mm7, [SHA3_S+3*16+8]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm0, [SHA3_S+4*16]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm1, [SHA3_S+4*16+8]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm2, [SHA3_S+4*16+16]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm3, [SHA3_S+4*16+16+8]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm4, [SHA3_S+4*16+2*16]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm5, [SHA3_S+4*16+2*16+8]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm6, [SHA3_S+4*16+3*16]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm7, [SHA3_S+4*16+3*16+8]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm0, [SHA3_S+8*16]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm1, [SHA3_S+8*16+8]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm2, [SHA3_S+8*16+16]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm3, [SHA3_S+8*16+16+8]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm4, [SHA3_S+8*16+2*16]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm5, [SHA3_S+8*16+2*16+8]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm6, [SHA3_S+8*16+3*16]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm7, [SHA3_S+8*16+3*16+8]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm0, [SHA3_S+12*16]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm1, [SHA3_S+12*16+8]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm2, [SHA3_S+12*16+16]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm3, [SHA3_S+12*16+16+8]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm4, [SHA3_S+12*16+2*16]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm5, [SHA3_S+12*16+2*16+8]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm6, [SHA3_S+12*16+3*16]
# 0 "" 2
# 790 "echo32.c" 1
	pxor  mm7, [SHA3_S+12*16+3*16+8]
# 0 "" 2
# 790 "echo32.c" 1
	movq  [OLDCV],        mm0
# 0 "" 2
# 790 "echo32.c" 1
	movq  [OLDCV+8],      mm1
# 0 "" 2
# 790 "echo32.c" 1
	movq  [OLDCV+16],     mm2
# 0 "" 2
# 790 "echo32.c" 1
	movq  [OLDCV+16+8],   mm3
# 0 "" 2
# 790 "echo32.c" 1
	movq  [OLDCV+2*16],   mm4
# 0 "" 2
# 790 "echo32.c" 1
	movq  [OLDCV+2*16+8], mm5
# 0 "" 2
# 790 "echo32.c" 1
	movq  [OLDCV+3*16],   mm6
# 0 "" 2
# 790 "echo32.c" 1
	movq  [OLDCV+3*16+8], mm7
# 0 "" 2
# 792 "echo32.c" 1
	xor    ebx,ebx
# 0 "" 2
# 793 "echo32.c" 1
	xor    edx,edx
# 0 "" 2
# 795 "echo32.c" 1
	mov    [SHA3_ESP], esp
# 0 "" 2
# 796 "echo32.c" 1
	LABEL_BIG_ROUND_O:
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, [SHA3_S+0]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, [SHA3_S+0+4]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 797 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+0],    edi
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+0+4],  esp
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, [SHA3_S+16]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, [SHA3_S+16+4]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 797 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+16],    edi
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+16+4],  esp
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, [SHA3_S+32]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, [SHA3_S+32+4]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 797 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+32],    edi
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+32+4],  esp
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, [SHA3_S+48]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, [SHA3_S+48+4]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 797 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 797 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 797 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 797 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 797 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 797 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 797 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+48],    edi
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+48+4],  esp
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 797 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, [SHA3_S+64]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, [SHA3_S+64+4]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 798 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+64],    edi
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+64+4],  esp
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, [SHA3_S+80]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, [SHA3_S+80+4]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 798 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+80],    edi
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+80+4],  esp
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, [SHA3_S+96]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, [SHA3_S+96+4]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 798 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+96],    edi
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+96+4],  esp
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, [SHA3_S+112]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, [SHA3_S+112+4]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 798 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 798 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 798 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 798 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 798 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 798 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 798 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+112],    edi
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+112+4],  esp
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 798 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, [SHA3_S+128]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, [SHA3_S+128+4]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 799 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+128],    edi
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+128+4],  esp
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, [SHA3_S+144]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, [SHA3_S+144+4]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 799 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+144],    edi
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+144+4],  esp
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, [SHA3_S+160]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, [SHA3_S+160+4]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 799 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+160],    edi
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+160+4],  esp
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, [SHA3_S+176]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, [SHA3_S+176+4]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 799 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 799 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 799 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 799 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 799 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 799 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 799 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+176],    edi
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+176+4],  esp
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 799 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, [SHA3_S+192]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, [SHA3_S+192+4]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 800 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+192],    edi
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+192+4],  esp
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, [SHA3_S+208]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, [SHA3_S+208+4]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 800 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+208],    edi
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+208+4],  esp
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, [SHA3_S+224]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, [SHA3_S+224+4]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 800 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+224],    edi
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+224+4],  esp
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, [SHA3_S+240]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, [SHA3_S+240+4]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 800 "echo32.c" 1
	addd   [SHA3_CNT+4], 1
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 800 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 800 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 800 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 800 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 800 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 800 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+240],    edi
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+240+4],  esp
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 800 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm0, [SHA3_S+16*9]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm1, [SHA3_S+16*9+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm2, [SHA3_S+16*13]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm3, [SHA3_S+16*13+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*13],   mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*13+8], mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*9],   mm2
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*9+8], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm0, [SHA3_S+16*5]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm1, [SHA3_S+16*5+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm2, [SHA3_S+16*13]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm3, [SHA3_S+16*13+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*13],   mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*13+8], mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*5],   mm2
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*5+8], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm0, [SHA3_S+16*1]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm1, [SHA3_S+16*1+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm2, [SHA3_S+16*13]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm3, [SHA3_S+16*13+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*13],   mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*13+8], mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*1],   mm2
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*1+8], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm0, [SHA3_S+16*2]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm1, [SHA3_S+16*2+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm2, [SHA3_S+16*10]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm3, [SHA3_S+16*10+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*10],   mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*10+8], mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*2],   mm2
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*2+8], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm0, [SHA3_S+16*6]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm1, [SHA3_S+16*6+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm2, [SHA3_S+16*14]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm3, [SHA3_S+16*14+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*14],   mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*14+8], mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*6],   mm2
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*6+8], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm0, [SHA3_S+16*3]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm1, [SHA3_S+16*3+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm2, [SHA3_S+16*15]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm3, [SHA3_S+16*15+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*15],   mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*15+8], mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*3],   mm2
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*3+8], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm0, [SHA3_S+16*7]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm1, [SHA3_S+16*7+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm2, [SHA3_S+16*15]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm3, [SHA3_S+16*15+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*15],   mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*15+8], mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*7],   mm2
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*7+8], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm0, [SHA3_S+16*11]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm1, [SHA3_S+16*11+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm2, [SHA3_S+16*15]
# 0 "" 2
# 801 "echo32.c" 1
	movq  mm3, [SHA3_S+16*15+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*15],   mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*15+8], mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*11],   mm2
# 0 "" 2
# 801 "echo32.c" 1
	movq  [SHA3_S+16*11+8], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, [SHA3_S+0*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm1, [SHA3_S+1*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm2, [SHA3_S+2*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm3, [SHA3_S+3*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 801 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0,  [SHA3_S+0*16]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+0*16], mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+1*16], mm1
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+2*16], mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+3*16], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, [SHA3_S+0*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm1, [SHA3_S+1*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm2, [SHA3_S+2*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm3, [SHA3_S+3*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 801 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0,  [SHA3_S+0*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+0*16+8], mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+1*16+8], mm1
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+2*16+8], mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+3*16+8], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, [SHA3_S+4*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm1, [SHA3_S+5*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm2, [SHA3_S+6*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm3, [SHA3_S+7*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 801 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0,  [SHA3_S+4*16]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+4*16], mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+5*16], mm1
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+6*16], mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+7*16], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, [SHA3_S+4*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm1, [SHA3_S+5*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm2, [SHA3_S+6*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm3, [SHA3_S+7*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 801 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0,  [SHA3_S+4*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+4*16+8], mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+5*16+8], mm1
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+6*16+8], mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+7*16+8], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, [SHA3_S+8*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm1, [SHA3_S+9*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm2, [SHA3_S+10*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm3, [SHA3_S+11*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 801 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0,  [SHA3_S+8*16]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+8*16], mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+9*16], mm1
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+10*16], mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+11*16], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, [SHA3_S+8*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm1, [SHA3_S+9*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm2, [SHA3_S+10*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm3, [SHA3_S+11*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 801 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0,  [SHA3_S+8*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+8*16+8], mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+9*16+8], mm1
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+10*16+8], mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+11*16+8], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, [SHA3_S+12*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm1, [SHA3_S+13*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm2, [SHA3_S+14*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm3, [SHA3_S+15*16]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 801 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0,  [SHA3_S+12*16]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+12*16], mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+13*16], mm1
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+14*16], mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+15*16], mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, [SHA3_S+12*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm1, [SHA3_S+13*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm2, [SHA3_S+14*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm3, [SHA3_S+15*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 801 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 801 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 801 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 801 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 801 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 801 "echo32.c" 1
	movq   mm0,  [SHA3_S+12*16+8]
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+12*16+8], mm0
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+13*16+8], mm1
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+14*16+8], mm2
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 801 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 801 "echo32.c" 1
	movq   [SHA3_S+15*16+8], mm3
# 0 "" 2
# 802 "echo32.c" 1
	subd [SHA3_R], 1
# 0 "" 2
# 803 "echo32.c" 1
	jne LABEL_BIG_ROUND_O
# 0 "" 2
# 804 "echo32.c" 1
	jmp END
# 0 "" 2
# 806 "echo32.c" 1
	NO_OVERFLOW2:
# 0 "" 2
# 807 "echo32.c" 1
	mov    dword ptr [SHA3_S+264], 0
# 0 "" 2
# 812 "echo32.c" 1
	movq  mm0, [SHA3_S]
# 0 "" 2
# 812 "echo32.c" 1
	movq  mm1, [SHA3_S+8]
# 0 "" 2
# 812 "echo32.c" 1
	movq  mm2, [SHA3_S+16]
# 0 "" 2
# 812 "echo32.c" 1
	movq  mm3, [SHA3_S+16+8]
# 0 "" 2
# 812 "echo32.c" 1
	movq  mm4, [SHA3_S+2*16]
# 0 "" 2
# 812 "echo32.c" 1
	movq  mm5, [SHA3_S+2*16+8]
# 0 "" 2
# 812 "echo32.c" 1
	movq  mm6, [SHA3_S+3*16]
# 0 "" 2
# 812 "echo32.c" 1
	movq  mm7, [SHA3_S+3*16+8]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm0, [SHA3_S+4*16]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm1, [SHA3_S+4*16+8]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm2, [SHA3_S+4*16+16]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm3, [SHA3_S+4*16+16+8]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm4, [SHA3_S+4*16+2*16]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm5, [SHA3_S+4*16+2*16+8]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm6, [SHA3_S+4*16+3*16]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm7, [SHA3_S+4*16+3*16+8]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm0, [SHA3_S+8*16]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm1, [SHA3_S+8*16+8]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm2, [SHA3_S+8*16+16]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm3, [SHA3_S+8*16+16+8]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm4, [SHA3_S+8*16+2*16]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm5, [SHA3_S+8*16+2*16+8]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm6, [SHA3_S+8*16+3*16]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm7, [SHA3_S+8*16+3*16+8]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm0, [SHA3_S+12*16]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm1, [SHA3_S+12*16+8]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm2, [SHA3_S+12*16+16]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm3, [SHA3_S+12*16+16+8]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm4, [SHA3_S+12*16+2*16]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm5, [SHA3_S+12*16+2*16+8]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm6, [SHA3_S+12*16+3*16]
# 0 "" 2
# 812 "echo32.c" 1
	pxor  mm7, [SHA3_S+12*16+3*16+8]
# 0 "" 2
# 812 "echo32.c" 1
	movq  [OLDCV],        mm0
# 0 "" 2
# 812 "echo32.c" 1
	movq  [OLDCV+8],      mm1
# 0 "" 2
# 812 "echo32.c" 1
	movq  [OLDCV+16],     mm2
# 0 "" 2
# 812 "echo32.c" 1
	movq  [OLDCV+16+8],   mm3
# 0 "" 2
# 812 "echo32.c" 1
	movq  [OLDCV+2*16],   mm4
# 0 "" 2
# 812 "echo32.c" 1
	movq  [OLDCV+2*16+8], mm5
# 0 "" 2
# 812 "echo32.c" 1
	movq  [OLDCV+3*16],   mm6
# 0 "" 2
# 812 "echo32.c" 1
	movq  [OLDCV+3*16+8], mm7
# 0 "" 2
# 814 "echo32.c" 1
	xor    ebx,ebx
# 0 "" 2
# 815 "echo32.c" 1
	xor    edx,edx
# 0 "" 2
# 817 "echo32.c" 1
	mov    [SHA3_ESP], esp
# 0 "" 2
# 819 "echo32.c" 1
	LABEL_BIG_ROUND_NO2:
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, [SHA3_S+0]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, [SHA3_S+0+4]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, [SHA3_S+0+8]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, [SHA3_S+0+12]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+0],    edi
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+0+4],  esp
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+0+8],  ebp
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+0+12], esi
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, [SHA3_S+16]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, [SHA3_S+16+4]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, [SHA3_S+16+8]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, [SHA3_S+16+12]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+16],    edi
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+16+4],  esp
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+16+8],  ebp
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+16+12], esi
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, [SHA3_S+32]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, [SHA3_S+32+4]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, [SHA3_S+32+8]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, [SHA3_S+32+12]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+32],    edi
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+32+4],  esp
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+32+8],  ebp
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+32+12], esi
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, [SHA3_S+48]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, [SHA3_S+48+4]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	mov    ecx, [SHA3_S+48+8]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	mov    eax, [SHA3_S+48+12]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 820 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 820 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 820 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 820 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 820 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 820 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+48],    edi
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+48+4],  esp
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+48+8],  ebp
# 0 "" 2
# 820 "echo32.c" 1
	mov    [SHA3_S+48+12], esi
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, [SHA3_S+64]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, [SHA3_S+64+4]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, [SHA3_S+64+8]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, [SHA3_S+64+12]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+64],    edi
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+64+4],  esp
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+64+8],  ebp
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+64+12], esi
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, [SHA3_S+80]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, [SHA3_S+80+4]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, [SHA3_S+80+8]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, [SHA3_S+80+12]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+80],    edi
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+80+4],  esp
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+80+8],  ebp
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+80+12], esi
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, [SHA3_S+96]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, [SHA3_S+96+4]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, [SHA3_S+96+8]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, [SHA3_S+96+12]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+96],    edi
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+96+4],  esp
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+96+8],  ebp
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+96+12], esi
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, [SHA3_S+112]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, [SHA3_S+112+4]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	mov    ecx, [SHA3_S+112+8]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	mov    eax, [SHA3_S+112+12]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 821 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 821 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 821 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 821 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 821 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 821 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+112],    edi
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+112+4],  esp
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+112+8],  ebp
# 0 "" 2
# 821 "echo32.c" 1
	mov    [SHA3_S+112+12], esi
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, [SHA3_S+128]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, [SHA3_S+128+4]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, [SHA3_S+128+8]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, [SHA3_S+128+12]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+128],    edi
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+128+4],  esp
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+128+8],  ebp
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+128+12], esi
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, [SHA3_S+144]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, [SHA3_S+144+4]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, [SHA3_S+144+8]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, [SHA3_S+144+12]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+144],    edi
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+144+4],  esp
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+144+8],  ebp
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+144+12], esi
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, [SHA3_S+160]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, [SHA3_S+160+4]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, [SHA3_S+160+8]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, [SHA3_S+160+12]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+160],    edi
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+160+4],  esp
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+160+8],  ebp
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+160+12], esi
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, [SHA3_S+176]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, [SHA3_S+176+4]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	mov    ecx, [SHA3_S+176+8]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	mov    eax, [SHA3_S+176+12]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 822 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 822 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 822 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 822 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 822 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 822 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+176],    edi
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+176+4],  esp
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+176+8],  ebp
# 0 "" 2
# 822 "echo32.c" 1
	mov    [SHA3_S+176+12], esi
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, [SHA3_S+192]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, [SHA3_S+192+4]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, [SHA3_S+192+8]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, [SHA3_S+192+12]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+192],    edi
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+192+4],  esp
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+192+8],  ebp
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+192+12], esi
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, [SHA3_S+208]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, [SHA3_S+208+4]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, [SHA3_S+208+8]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, [SHA3_S+208+12]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+208],    edi
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+208+4],  esp
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+208+8],  ebp
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+208+12], esi
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, [SHA3_S+224]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, [SHA3_S+224+4]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, [SHA3_S+224+8]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, [SHA3_S+224+12]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+224],    edi
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+224+4],  esp
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+224+8],  ebp
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+224+12], esi
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, [SHA3_S+240]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, [SHA3_S+240+4]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [SHA3_CNT]  
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [SHA3_CNT+4]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	addd   [SHA3_CNT],   1
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, edi
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, esp
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	mov    edi, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	mov    esp, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	mov    esi, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    ebp, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	mov    ecx, [SHA3_S+240+8]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	mov    eax, [SHA3_S+240+12]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*edx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, ch
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ebx]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, ah
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*edx+3]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 16
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 16
# 0 "" 2
# 823 "echo32.c" 1
	xor    ebp, [Te+8*ebx+3]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    edx, cl
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*edx+2]
# 0 "" 2
# 823 "echo32.c" 1
	movzx    ebx, al
# 0 "" 2
# 823 "echo32.c" 1
	xor    esp, [Te+8*ebx+2]
# 0 "" 2
# 823 "echo32.c" 1
	shr    ecx, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    esi, [Te+8*ecx+1]
# 0 "" 2
# 823 "echo32.c" 1
	shr    eax, 8
# 0 "" 2
# 823 "echo32.c" 1
	xor    edi, [Te+8*eax+1]
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+240],    edi
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+240+4],  esp
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+240+8],  ebp
# 0 "" 2
# 823 "echo32.c" 1
	mov    [SHA3_S+240+12], esi
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm0, [SHA3_S+16*9]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm1, [SHA3_S+16*9+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm2, [SHA3_S+16*13]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm3, [SHA3_S+16*13+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*13],   mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*13+8], mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*9],   mm2
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*9+8], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm0, [SHA3_S+16*5]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm1, [SHA3_S+16*5+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm2, [SHA3_S+16*13]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm3, [SHA3_S+16*13+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*13],   mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*13+8], mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*5],   mm2
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*5+8], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm0, [SHA3_S+16*1]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm1, [SHA3_S+16*1+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm2, [SHA3_S+16*13]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm3, [SHA3_S+16*13+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*13],   mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*13+8], mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*1],   mm2
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*1+8], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm0, [SHA3_S+16*2]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm1, [SHA3_S+16*2+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm2, [SHA3_S+16*10]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm3, [SHA3_S+16*10+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*10],   mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*10+8], mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*2],   mm2
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*2+8], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm0, [SHA3_S+16*6]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm1, [SHA3_S+16*6+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm2, [SHA3_S+16*14]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm3, [SHA3_S+16*14+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*14],   mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*14+8], mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*6],   mm2
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*6+8], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm0, [SHA3_S+16*3]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm1, [SHA3_S+16*3+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm2, [SHA3_S+16*15]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm3, [SHA3_S+16*15+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*15],   mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*15+8], mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*3],   mm2
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*3+8], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm0, [SHA3_S+16*7]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm1, [SHA3_S+16*7+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm2, [SHA3_S+16*15]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm3, [SHA3_S+16*15+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*15],   mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*15+8], mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*7],   mm2
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*7+8], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm0, [SHA3_S+16*11]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm1, [SHA3_S+16*11+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm2, [SHA3_S+16*15]
# 0 "" 2
# 824 "echo32.c" 1
	movq  mm3, [SHA3_S+16*15+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*15],   mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*15+8], mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*11],   mm2
# 0 "" 2
# 824 "echo32.c" 1
	movq  [SHA3_S+16*11+8], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, [SHA3_S+0*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm1, [SHA3_S+1*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm2, [SHA3_S+2*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm3, [SHA3_S+3*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 824 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0,  [SHA3_S+0*16]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+0*16], mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+1*16], mm1
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+2*16], mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+3*16], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, [SHA3_S+0*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm1, [SHA3_S+1*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm2, [SHA3_S+2*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm3, [SHA3_S+3*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 824 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0,  [SHA3_S+0*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+0*16+8], mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+1*16+8], mm1
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+2*16+8], mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+3*16+8], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, [SHA3_S+4*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm1, [SHA3_S+5*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm2, [SHA3_S+6*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm3, [SHA3_S+7*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 824 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0,  [SHA3_S+4*16]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+4*16], mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+5*16], mm1
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+6*16], mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+7*16], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, [SHA3_S+4*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm1, [SHA3_S+5*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm2, [SHA3_S+6*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm3, [SHA3_S+7*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 824 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0,  [SHA3_S+4*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+4*16+8], mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+5*16+8], mm1
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+6*16+8], mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+7*16+8], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, [SHA3_S+8*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm1, [SHA3_S+9*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm2, [SHA3_S+10*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm3, [SHA3_S+11*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 824 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0,  [SHA3_S+8*16]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+8*16], mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+9*16], mm1
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+10*16], mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+11*16], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, [SHA3_S+8*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm1, [SHA3_S+9*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm2, [SHA3_S+10*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm3, [SHA3_S+11*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 824 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0,  [SHA3_S+8*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+8*16+8], mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+9*16+8], mm1
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+10*16+8], mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+11*16+8], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, [SHA3_S+12*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm1, [SHA3_S+13*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm2, [SHA3_S+14*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm3, [SHA3_S+15*16]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 824 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0,  [SHA3_S+12*16]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+12*16], mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+13*16], mm1
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+14*16], mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+15*16], mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, [SHA3_S+12*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm1, [SHA3_S+13*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm2, [SHA3_S+14*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm3, [SHA3_S+15*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm1
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm5, mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm3
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm7, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm7, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm4, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm4, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm4, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm4, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm5
# 0 "" 2
# 824 "echo32.c" 1
	psllw  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlw  mm5, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm5, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm5, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm5, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0, mm6
# 0 "" 2
# 824 "echo32.c" 1
	psllq  mm0, 1
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm0, [MEM_CST]
# 0 "" 2
# 824 "echo32.c" 1
	psrlq  mm6, 7
# 0 "" 2
# 824 "echo32.c" 1
	pand   mm6, [MEM_CST+16]
# 0 "" 2
# 824 "echo32.c" 1
	pmullw mm6, [MEM_CST+32]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm6, mm0
# 0 "" 2
# 824 "echo32.c" 1
	movq   mm0,  [SHA3_S+12*16+8]
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm0, mm4
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+12*16+8], mm0
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm4
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm5
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm6
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm1, mm7
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+13*16+8], mm1
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm2, mm5
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+14*16+8], mm2
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm7
# 0 "" 2
# 824 "echo32.c" 1
	pxor   mm3, mm6
# 0 "" 2
# 824 "echo32.c" 1
	movq   [SHA3_S+15*16+8], mm3
# 0 "" 2
# 825 "echo32.c" 1
	subd [SHA3_R], 1
# 0 "" 2
# 826 "echo32.c" 1
	jne LABEL_BIG_ROUND_NO2
# 0 "" 2
# 828 "echo32.c" 1
	END:
# 0 "" 2
# 833 "echo32.c" 1
	movq  mm0, [OLDCV]
# 0 "" 2
# 833 "echo32.c" 1
	movq  mm1, [OLDCV+8]
# 0 "" 2
# 833 "echo32.c" 1
	movq  mm2, [OLDCV+16]
# 0 "" 2
# 833 "echo32.c" 1
	movq  mm3, [OLDCV+16+8]
# 0 "" 2
# 833 "echo32.c" 1
	movq  mm4, [OLDCV+2*16]
# 0 "" 2
# 833 "echo32.c" 1
	movq  mm5, [OLDCV+2*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	movq  mm6, [OLDCV+3*16]
# 0 "" 2
# 833 "echo32.c" 1
	movq  mm7, [OLDCV+3*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm0, [SHA3_S]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm1, [SHA3_S+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm2, [SHA3_S+16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm3, [SHA3_S+16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm4, [SHA3_S+2*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm5, [SHA3_S+2*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm6, [SHA3_S+3*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm7, [SHA3_S+3*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm0, [SHA3_S+4*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm1, [SHA3_S+4*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm2, [SHA3_S+5*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm3, [SHA3_S+5*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm4, [SHA3_S+6*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm5, [SHA3_S+6*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm6, [SHA3_S+7*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm7, [SHA3_S+7*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm0, [SHA3_S+8*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm1, [SHA3_S+8*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm2, [SHA3_S+9*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm3, [SHA3_S+9*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm4, [SHA3_S+10*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm5, [SHA3_S+10*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm6, [SHA3_S+11*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm7, [SHA3_S+11*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm0, [SHA3_S+12*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm1, [SHA3_S+12*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm2, [SHA3_S+13*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm3, [SHA3_S+13*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm4, [SHA3_S+14*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm5, [SHA3_S+14*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm6, [SHA3_S+15*16]
# 0 "" 2
# 833 "echo32.c" 1
	pxor  mm7, [SHA3_S+15*16+8]
# 0 "" 2
# 833 "echo32.c" 1
	movq  [SHA3_S], mm0
# 0 "" 2
# 833 "echo32.c" 1
	movq  [SHA3_S+8], mm1
# 0 "" 2
# 833 "echo32.c" 1
	movq  [SHA3_S+16], mm2
# 0 "" 2
# 833 "echo32.c" 1
	movq  [SHA3_S+16+8], mm3
# 0 "" 2
# 833 "echo32.c" 1
	movq  [SHA3_S+2*16], mm4
# 0 "" 2
# 833 "echo32.c" 1
	movq  [SHA3_S+2*16+8], mm5
# 0 "" 2
# 833 "echo32.c" 1
	movq  [SHA3_S+3*16], mm6
# 0 "" 2
# 833 "echo32.c" 1
	movq  [SHA3_S+3*16+8], mm7
# 0 "" 2
# 836 "echo32.c" 1
	mov    esp, [SHA3_ESP]
# 0 "" 2
# 838 "echo32.c" 1
	emms
# 0 "" 2
# 839 "echo32.c" 1
	popa
# 0 "" 2
# 840 "echo32.c" 1
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
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	movl	8(%ebp), %edi
	pushl	%esi
	movl	12(%ebp), %esi
	pushl	%ebx
	movl	SHA3_S+276, %ebx
	testl	%ebx, %ebx
	je	.L4
	cmpl	%edi, %ebx
	je	.L4
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L5:
	movl	SHA3_S(,%eax,8), %edx
	movl	SHA3_S+4(,%eax,8), %ecx
	movl	%edx, (%ebx,%eax,8)
	movl	%ecx, 4(%ebx,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L5
.L4:
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
	ja	.L7
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
.L10:
	addl	$1, %ecx
	movl	%ebx, (%edx)
	movl	%esi, 4(%edx)
	movl	$0, 8(%edx)
	movl	$0, 12(%edx)
	addl	$16, %edx
	cmpl	%ecx, %eax
	jg	.L10
	sall	$4, %eax
	addl	$SHA3_S, %eax
	.p2align 4,,7
	.p2align 3
.L12:
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	addl	$16, %eax
	cmpl	$SHA3_S+256, %eax
	jne	.L12
	movl	$0, SHA3_S+256
	xorl	%eax, %eax
	movl	$0, SHA3_S+260
	movl	$0, SHA3_S+264
.L7:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
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
	subl	$84, %esp
	movl	8(%ebp), %esi
	movl	SHA3_S+276, %edi
	movl	16(%ebp), %eax
	movl	20(%ebp), %edx
	movl	12(%ebp), %ebx
	cmpl	%esi, %edi
	movl	%eax, -88(%ebp)
	movl	%edx, -84(%ebp)
	je	.L19
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L20:
	movl	SHA3_S(,%eax,8), %edx
	movl	SHA3_S+4(,%eax,8), %ecx
	movl	%edx, (%edi,%eax,8)
	movl	%ecx, 4(%edi,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L20
	xorb	%al, %al
	.p2align 4,,7
	.p2align 3
.L21:
	movl	(%esi,%eax,8), %edx
	movl	4(%esi,%eax,8), %ecx
	movl	%edx, SHA3_S(,%eax,8)
	movl	%ecx, SHA3_S+4(,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L21
	movl	%esi, SHA3_S+276
.L19:
	movl	SHA3_S+272, %edx
	movl	-88(%ebp), %eax
	sall	$4, %edx
	movl	%edx, -76(%ebp)
	addl	$SHA3_S, %edx
	movl	%edx, -60(%ebp)
	movl	-84(%ebp), %edx
	shrdl	$3, %edx, %eax
	shrl	$3, %edx
	movl	%edx, -36(%ebp)
	movl	SHA3_S+264, %edx
	movl	%eax, -40(%ebp)
	sarl	$3, %edx
	cmpl	$0, -36(%ebp)
	movl	%edx, -28(%ebp)
	jle	.L78
.L22:
	movl	-76(%ebp), %ecx
	movl	$256, -72(%ebp)
	subl	%ecx, -72(%ebp)
	.p2align 4,,7
	.p2align 3
.L72:
	movl	-72(%ebp), %eax
	subl	-28(%ebp), %eax
	movl	-36(%ebp), %ecx
	movl	%eax, %edx
	sarl	$31, %edx
	cmpl	%ecx, %edx
	movl	%eax, -24(%ebp)
	movl	%eax, -56(%ebp)
	movl	%edx, -52(%ebp)
	jl	.L25
	jg	.L53
	movl	-40(%ebp), %edx
	cmpl	%edx, %eax
	jbe	.L25
.L53:
	movl	-36(%ebp), %edx
	movl	-40(%ebp), %eax
	shrdl	$3, %edx, %eax
	sarl	$3, %edx
	cmpl	$0, %edx
	movl	%eax, -24(%ebp)
	movl	%edx, -20(%ebp)
	jle	.L79
.L27:
	movl	-60(%ebp), %ecx
	xorl	%eax, %eax
	xorl	%esi, %esi
	movl	-28(%ebp), %edx
	leal	(%ecx,%edx), %edi
	.p2align 4,,7
	.p2align 3
.L73:
	movl	(%ebx,%eax,8), %edx
	movl	4(%ebx,%eax,8), %ecx
	movl	%edx, (%edi,%eax,8)
	movl	%ecx, 4(%edi,%eax,8)
	addl	$1, %eax
	cmpl	-20(%ebp), %esi
	jl	.L73
	jle	.L80
.L29:
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
	jg	.L43
	jl	.L57
	cmpl	%esi, %ecx
	jae	.L43
.L57:
	movl	-28(%ebp), %eax
	leal	(%ebx,%ecx), %edx
	movl	%ebx, -24(%ebp)
	addl	%ecx, %eax
	addl	-60(%ebp), %eax
	.p2align 4,,7
	.p2align 3
.L74:
	movzbl	(%edx), %ebx
	addl	$1, %ecx
	addl	$1, %edx
	movb	%bl, (%eax)
	xorl	%ebx, %ebx
	addl	$1, %eax
	cmpl	%edi, %ebx
	jl	.L74
	jg	.L76
	cmpl	%esi, %ecx
	jb	.L74
.L76:
	movl	-24(%ebp), %ebx
.L43:
	movl	-40(%ebp), %eax
	addl	%eax, -28(%ebp)
	addl	%eax, %ebx
.L77:
	movl	-28(%ebp), %eax
	sall	$3, %eax
.L24:
	movl	-88(%ebp), %ecx
	movl	%eax, SHA3_S+264
	andl	$7, %ecx
	je	.L47
	addl	%ecx, %eax
	movl	$7, %edx
	movl	%eax, SHA3_S+264
	subl	%ecx, %edx
	xorl	%eax, %eax
	movl	$7, %ecx
	movl	$1, %edi
	.p2align 4,,7
	.p2align 3
.L50:
	movl	%edi, %esi
	sall	%cl, %esi
	subl	$1, %ecx
	orl	%esi, %eax
	cmpl	%edx, %ecx
	jne	.L50
	movl	-28(%ebp), %edx
	movl	-76(%ebp), %ecx
	andb	(%ebx), %al
	movb	%al, SHA3_S(%ecx,%edx)
.L47:
	addl	$84, %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L80:
	cmpl	-24(%ebp), %eax
	jb	.L73
	jmp	.L29
	.p2align 4,,7
	.p2align 3
.L25:
	movl	-24(%ebp), %esi
	sarl	$31, %esi
	shrl	$29, %esi
	addl	-24(%ebp), %esi
	sarl	$3, %esi
	testl	%esi, %esi
	je	.L30
	movl	-60(%ebp), %ecx
	xorl	%eax, %eax
	movl	-28(%ebp), %edx
	leal	(%ecx,%edx), %edi
	.p2align 4,,7
	.p2align 3
.L31:
	movl	(%ebx,%eax,8), %edx
	movl	4(%ebx,%eax,8), %ecx
	movl	%edx, (%edi,%eax,8)
	movl	%ecx, 4(%edi,%eax,8)
	addl	$1, %eax
	cmpl	%esi, %eax
	jb	.L31
.L30:
	movl	-24(%ebp), %edx
	sall	$3, %esi
	movl	-24(%ebp), %ecx
	movl	%esi, %eax
	movl	%esi, -44(%ebp)
	sarl	$31, %edx
	shrl	$29, %edx
	addl	%edx, %ecx
	andl	$7, %ecx
	subl	%edx, %ecx
	addl	%esi, %ecx
	cmpl	%ecx, %esi
	jae	.L32
	movl	-28(%ebp), %edi
	movl	%ecx, %edx
	addl	-76(%ebp), %edi
	subl	%esi, %edx
	cmpl	$9, %edx
	movl	%edx, -64(%ebp)
	leal	(%ebx,%esi), %esi
	leal	SHA3_S(%eax,%edi), %edi
	jbe	.L33
	movl	%edi, %edx
	orl	%esi, %edx
	andl	$3, %edx
	jne	.L33
	leal	4(%esi), %edx
	cmpl	%edx, %edi
	jbe	.L81
.L55:
	movl	-64(%ebp), %edx
	shrl	$2, %edx
	movl	%edx, -92(%ebp)
	sall	$2, %edx
	testl	%edx, %edx
	movl	%edx, -68(%ebp)
	je	.L35
	movl	%ecx, -80(%ebp)
	movl	-92(%ebp), %ecx
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L36:
	movl	(%esi,%eax,4), %edx
	movl	%edx, (%edi,%eax,4)
	addl	$1, %eax
	cmpl	%ecx, %eax
	jb	.L36
	movl	-44(%ebp), %eax
	movl	-68(%ebp), %edx
	addl	-68(%ebp), %eax
	cmpl	%edx, -64(%ebp)
	movl	-80(%ebp), %ecx
	je	.L32
.L35:
	movl	-28(%ebp), %edx
	leal	(%ebx,%eax), %esi
	movl	%ecx, %edi
	addl	%eax, %edx
	addl	-60(%ebp), %edx
	.p2align 4,,7
	.p2align 3
.L37:
	movzbl	(%esi), %ecx
	addl	$1, %eax
	addl	$1, %esi
	movb	%cl, (%edx)
	addl	$1, %edx
	cmpl	%eax, %edi
	ja	.L37
.L32:
	movl	-24(%ebp), %eax
	sall	$3, %eax
	addl	%eax, SHA3_S+264
	call	Compress
	movl	-56(%ebp), %eax
	addl	-24(%ebp), %ebx
	movl	-52(%ebp), %edx
	subl	%eax, -40(%ebp)
	sbbl	%edx, -36(%ebp)
	cmpl	$0, -36(%ebp)
	movl	$0, -28(%ebp)
	jg	.L72
	jl	.L56
	cmpl	$0, -40(%ebp)
	ja	.L72
.L56:
	xorl	%eax, %eax
	movl	$0, -28(%ebp)
	.p2align 4,,5
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L79:
	.p2align 4,,5
	jl	.L29
	cmpl	$0, %eax
	.p2align 4,,5
	ja	.L27
	.p2align 4,,9
	.p2align 3
	jmp	.L29
	.p2align 4,,7
	.p2align 3
.L81:
	leal	4(%edi), %edx
	cmpl	%edx, %esi
	.p2align 4,,5
	ja	.L55
	.p2align 4,,7
	.p2align 3
.L33:
	movl	-44(%ebp), %edx
	movl	%ecx, %edi
	addl	-28(%ebp), %edx
	addl	-60(%ebp), %edx
	.p2align 4,,7
	.p2align 3
.L38:
	movzbl	(%esi), %ecx
	addl	$1, %eax
	addl	$1, %esi
	movb	%cl, (%edx)
	addl	$1, %edx
	cmpl	%eax, %edi
	ja	.L38
	jmp	.L32
.L78:
	jl	.L77
	cmpl	$0, %eax
	.p2align 4,,9
	.p2align 3
	ja	.L22
	.p2align 4,,9
	.p2align 3
	jmp	.L77
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
	movl	8(%ebp), %esi
	movl	SHA3_S+276, %edi
	cmpl	%esi, %edi
	je	.L83
	movl	12(%ebp), %ebx
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L84:
	movl	SHA3_S(,%eax,8), %edx
	movl	SHA3_S+4(,%eax,8), %ecx
	movl	%edx, (%edi,%eax,8)
	movl	%ecx, 4(%edi,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L84
	movl	%ebx, 12(%ebp)
	xorb	%al, %al
	.p2align 4,,7
	.p2align 3
.L85:
	movl	(%esi,%eax,8), %edx
	movl	4(%esi,%eax,8), %ecx
	movl	%edx, SHA3_S(,%eax,8)
	movl	%ecx, SHA3_S+4(,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L85
	movl	%ebx, 12(%ebp)
	movl	%esi, SHA3_S+276
.L83:
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
	jg	.L86
	movl	%eax, %edx
	sarl	$31, %edx
	shrl	$29, %edx
	leal	(%edx,%eax), %ecx
	movl	%ecx, %edi
	andl	$7, %ecx
	subl	%ecx, %edx
	sarl	$3, %edi
	addl	%ebx, %edi
	leal	7(%edx), %ecx
	movl	$1, %edx
	movl	%edi, -32(%ebp)
	sall	%cl, %edx
	orb	(%edi), %dl
	movl	$255, %edi
	sall	%cl, %edi
	leal	(%ecx,%eax), %eax
	andl	%edi, %edx
	movl	-32(%ebp), %edi
	testl	%eax, %eax
	movb	%dl, (%edi)
	jle	.L87
	movl	%esi, %ecx
	subl	%eax, %ecx
	movl	%ecx, %edx
	sarl	$31, %edx
	shrl	$29, %edx
	addl	%ecx, %edx
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
.L88:
	subl	$144, %esi
	sarl	$3, %esi
	movl	%edx, -36(%ebp)
	movl	%ecx, -40(%ebp)
	movl	%esi, 8(%esp)
	movl	$0, 4(%esp)
	movl	%edi, (%esp)
	call	memset
	movl	-36(%ebp), %edx
	movl	-40(%ebp), %ecx
	jmp	.L90
	.p2align 4,,7
	.p2align 3
.L86:
	movl	%eax, %edx
	sarl	$31, %edx
	shrl	$29, %edx
	leal	(%edx,%eax), %ecx
	movl	%ecx, %edi
	andl	$7, %ecx
	sarl	$3, %edi
	subl	%ecx, %edx
	leal	7(%edx), %ecx
	movl	$1, %edx
	leal	(%edi,%ebx), %ebx
	movl	$255, %edi
	sall	%cl, %edx
	orb	(%ebx), %dl
	sall	%cl, %edi
	leal	(%ecx,%eax), %eax
	andl	%edi, %edx
	movb	%dl, (%ebx)
.L87:
	movl	SHA3_S+264, %edx
	movl	SHA3_S+272, %edi
	movl	%edx, %ecx
	sall	$4, %edi
	sarl	$31, %ecx
	addl	$SHA3_S, %edi
	addl	SHA3_S+256, %edx
	adcl	SHA3_S+260, %ecx
	testl	%eax, %eax
	je	.L88
	leal	-144(%esi), %ebx
	subl	%eax, %ebx
	movl	%ebx, %esi
	sarl	$31, %esi
	shrl	$29, %esi
	addl	%esi, %ebx
	movl	%eax, %esi
	sarl	$31, %esi
	shrl	$29, %esi
	addl	%esi, %eax
	sarl	$3, %eax
	leal	1(%edi,%eax), %eax
	sarl	$3, %ebx
	movl	%edx, -36(%ebp)
	movl	%ecx, -40(%ebp)
	movl	%ebx, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	memset
	movl	-40(%ebp), %ecx
	movl	-36(%ebp), %edx
.L90:
	movl	SHA3_S+268, %esi
	movl	$16, %eax
	subl	SHA3_S+272, %eax
	sall	$4, %eax
	movl	%esi, %ebx
	leal	-18(%edi,%eax), %eax
	movl	%ecx, %edi
	movb	%bl, (%eax)
	movl	SHA3_S+268, %esi
	movb	%dl, 2(%eax)
	movb	%cl, 6(%eax)
	movb	$0, 10(%eax)
	sarl	$8, %esi
	movl	%esi, %ebx
	movl	%edx, %esi
	shrdl	$8, %edi, %esi
	movl	%ecx, %edi
	movb	%bl, 1(%eax)
	movl	%esi, %ebx
	movl	%edx, %esi
	shrdl	$16, %edi, %esi
	movl	%ecx, %edi
	movb	%bl, 3(%eax)
	movl	%esi, %ebx
	movl	%edx, %esi
	shrdl	$24, %edi, %esi
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
	je	.L91
	movl	12(%ebp), %edx
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L92:
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
	je	.L97
	movl	%esi, %ebx
.L97:
	movb	%bl, (%edx,%eax)
	movl	SHA3_S+268, %ecx
	addl	$1, %eax
	sarl	$3, %ecx
	cmpl	%eax, %ecx
	ja	.L92
.L91:
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
	.type	T.39, @function
T.39:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$332, %esp
	movl	SHA3_S+276, %esi
	movl	%edx, -320(%ebp)
	leal	-312(%ebp), %ebx
	movl	%ecx, -316(%ebp)
	testl	%esi, %esi
	je	.L99
	cmpl	%ebx, %esi
	je	.L99
	xorl	%ecx, %ecx
	movl	%esi, %edx
.L100:
	movl	SHA3_S(,%ecx,8), %esi
	movl	SHA3_S+4(,%ecx,8), %edi
	movl	%esi, (%edx,%ecx,8)
	movl	%edi, 4(%edx,%ecx,8)
	addl	$1, %ecx
	cmpl	$35, %ecx
	jne	.L100
.L99:
	movl	%ebx, SHA3_S+276
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
	movl	$512, SHA3_S+268
	movl	$4, SHA3_S+272
	movl	$512, SHA3_S
	movl	$0, SHA3_S+4
	movl	$0, SHA3_S+8
	movl	$0, SHA3_S+12
	movl	$512, SHA3_S+16
	movl	$0, SHA3_S+20
	movl	$0, SHA3_S+24
	movl	$0, SHA3_S+28
	movl	$512, SHA3_S+32
	movl	$0, SHA3_S+36
	movl	$0, SHA3_S+40
	movl	$0, SHA3_S+44
	movl	$512, SHA3_S+48
	movl	$0, SHA3_S+52
	movl	$0, SHA3_S+56
	movl	$0, SHA3_S+60
	movl	$0, SHA3_S+64
	movl	$0, SHA3_S+68
	movl	$0, SHA3_S+72
	movl	$0, SHA3_S+76
	movl	$0, SHA3_S+80
	movl	$0, SHA3_S+84
	movl	$0, SHA3_S+88
	movl	$0, SHA3_S+92
	movl	$0, SHA3_S+96
	movl	$0, SHA3_S+100
	movl	$0, SHA3_S+104
	movl	$0, SHA3_S+108
	movl	$0, SHA3_S+112
	movl	$0, SHA3_S+116
	movl	$0, SHA3_S+120
	movl	$0, SHA3_S+124
	movl	$0, SHA3_S+128
	movl	$0, SHA3_S+132
	movl	$0, SHA3_S+136
	movl	$0, SHA3_S+140
	movl	$0, SHA3_S+144
	movl	$0, SHA3_S+148
	movl	$0, SHA3_S+152
	movl	$0, SHA3_S+156
	movl	$0, SHA3_S+160
	movl	$0, SHA3_S+164
	movl	$0, SHA3_S+168
	movl	$0, SHA3_S+172
	movl	$0, SHA3_S+176
	movl	$0, SHA3_S+180
	movl	$0, SHA3_S+184
	movl	$0, SHA3_S+188
	movl	$0, SHA3_S+192
	movl	-320(%ebp), %edx
	movl	-316(%ebp), %ecx
	movl	$0, SHA3_S+196
	movl	$0, SHA3_S+200
	movl	$0, SHA3_S+204
	movl	$0, SHA3_S+208
	movl	$0, SHA3_S+212
	movl	$0, SHA3_S+216
	movl	$0, SHA3_S+220
	movl	$0, SHA3_S+224
	movl	$0, SHA3_S+228
	movl	$0, SHA3_S+232
	movl	$0, SHA3_S+236
	movl	$0, SHA3_S+240
	movl	$0, SHA3_S+244
	movl	$0, SHA3_S+248
	movl	$0, SHA3_S+252
	movl	$0, SHA3_S+256
	movl	$0, SHA3_S+260
	movl	$0, SHA3_S+264
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	Update
	testl	%eax, %eax
	je	.L105
	addl	$332, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L105:
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
	.size	T.39, .-T.39
	.p2align 4,,15
.globl crypto_hash_echosp512_pentium_pentiummmx
	.type	crypto_hash_echosp512_pentium_pentiummmx, @function
crypto_hash_echosp512_pentium_pentiummmx:
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
	call	T.39
	leave
	cmpl	$1, %eax
	sbbl	%eax, %eax
	notl	%eax
	ret
	.size	crypto_hash_echosp512_pentium_pentiummmx, .-crypto_hash_echosp512_pentium_pentiummmx
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
	movl	SHA3_S+276, %esi
	movl	16(%ebp), %eax
	leal	-312(%ebp), %ebx
	movl	20(%ebp), %edx
	movl	8(%ebp), %edi
	testl	%esi, %esi
	movl	%eax, -320(%ebp)
	movl	%edx, -316(%ebp)
	je	.L111
	cmpl	%ebx, %esi
	je	.L111
	xorl	%eax, %eax
	.p2align 4,,7
	.p2align 3
.L112:
	movl	SHA3_S(,%eax,8), %edx
	movl	SHA3_S+4(,%eax,8), %ecx
	movl	%edx, (%esi,%eax,8)
	movl	%ecx, 4(%esi,%eax,8)
	addl	$1, %eax
	cmpl	$35, %eax
	jne	.L112
.L111:
	leal	-160(%edi), %edx
	movl	$2, %eax
	cmpl	$352, %edx
	movl	%ebx, SHA3_S+276
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
	ja	.L114
	xorl	%ecx, %ecx
	cmpl	$257, %edi
	setge	%cl
	movl	%edi, %esi
	leal	2(%ecx,%ecx), %ecx
	movl	$SHA3_S, %eax
	movl	%edi, SHA3_S+268
	xorl	%edx, %edx
	movl	%ecx, SHA3_S+272
	sarl	$31, %edi
	.p2align 4,,7
	.p2align 3
.L116:
	addl	$1, %edx
	movl	%esi, (%eax)
	movl	%edi, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	addl	$16, %eax
	cmpl	%ecx, %edx
	jl	.L116
	sall	$4, %ecx
	addl	$SHA3_S, %ecx
	.p2align 4,,7
	.p2align 3
.L119:
	movl	$0, (%ecx)
	movl	$0, 4(%ecx)
	movl	$0, 8(%ecx)
	movl	$0, 12(%ecx)
	addl	$16, %ecx
	cmpl	$SHA3_S+256, %ecx
	jne	.L119
	movl	-320(%ebp), %eax
	movl	-316(%ebp), %edx
	movl	$0, SHA3_S+256
	movl	$0, SHA3_S+260
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	12(%ebp), %eax
	movl	$0, SHA3_S+264
	movl	%ebx, (%esp)
	movl	%eax, 4(%esp)
	call	Update
	testl	%eax, %eax
	je	.L125
.L114:
	addl	$332, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L125:
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
	.ident	"GCC: (Debian 4.4.3-7) 4.4.3"
	.section	.note.GNU-stack,"",@progbits
